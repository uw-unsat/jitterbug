#lang rosette

; This file is translated and adapted from arch/arm/net/bpf_jit_32.c,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0-only
;
; Just-In-Time compiler for eBPF filters on 32bit ARM
;
; Copyright (c) 2017 Shubham Bansal <illusionist.neo@gmail.com>
; Copyright (c) 2011 Mircea Gherzan <mgherzan@gmail.com>

(require
  "bpf_jit.rkt"
  "../lib/bpf-common.rkt"
  "../common.rkt"
  "../lib/patch.rkt"
  "../lib/spec/bpf.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in arm32: serval/arm32))

(provide (all-defined-out))

(define STACK_ALIGNMENT (make-parameter 8))
(define use-ldrd/strd (make-parameter #t))
(define use-rev (make-parameter #t))
(define use-uxth (make-parameter #t))
(define CONFIG_FRAME_POINTER (make-parameter #t))

(define (hweight16 val)
  (for/all ([val val #:exhaustive])
    (begin
      (define weight (bv 0 16))
      (for ([i (in-range 16)])
        (when (equal? (bit i val) (bv 1 1))
          (set! weight (bvadd1 weight))))
      weight)))

(define CALLEE_MASK
  (bvor (bvshl (bv 1 16) (bv 4 16))    ; ARM_R4
        (bvshl (bv 1 16) (bv 5 16))    ; ARM_R5
        (bvshl (bv 1 16) (bv 6 16))    ; ARM_R6
        (bvshl (bv 1 16) (bv 7 16))    ; ARM_R7
        (bvshl (bv 1 16) (bv 8 16))    ; ARM_R8
        (bvshl (bv 1 16) (bv 9 16))    ; ARM_R9
        (bvshl (bv 1 16) (bv 11 16)))) ; ARM_FP

(define CALLEE_PUSH_MASK
  (bvor CALLEE_MASK
        (bvshl (bv 1 16) (bv 14 16)))) ; ARM_LR

(define CALLEE_POP_MASK
  (bvor CALLEE_MASK
        (bvshl (bv 1 16) (bv 15 16)))) ; ARM_PC

; Stack layout - these are offsets from (top of stack - 4)
(define BPF_R2_HI 0)
(define BPF_R2_LO 1)
(define BPF_R3_HI 2)
(define BPF_R3_LO 3)
(define BPF_R4_HI 4)
(define BPF_R4_LO 5)
(define BPF_R5_HI 6)
(define BPF_R5_LO 7)
(define BPF_R7_HI 8)
(define BPF_R7_LO 9)
(define BPF_R8_HI 10)
(define BPF_R8_LO 11)
(define BPF_R9_HI 12)
(define BPF_R9_LO 13)
(define BPF_FP_HI 14)
(define BPF_FP_LO 15)
(define BPF_TC_HI 16)
(define BPF_TC_LO 17)
(define BPF_AX_HI 18)
(define BPF_AX_LO 19)
; Stack space for BPF_REG_2, BPF_REG_3, BPF_REG_4,
; BPF_REG_5, BPF_REG_7, BPF_REG_8, BPF_REG_9,
; BPF_REG_FP and Tail call counts.
(define BPF_JIT_SCRATCH_REGS 20)

; Negative "register" values indicate the register is stored on the stack
; and are the offset from the top of the eBPF JIT scratch space.
(define (STACK_OFFSET k) (bv (- (- 4) (* k 4)) 16))
(define SCRATCH_SIZE     (* BPF_JIT_SCRATCH_REGS 4))
(define (_STACK_SIZE aux)
  (bvadd (bpf-prog-aux-stack_depth aux) (bv SCRATCH_SIZE 32)))
(define (STACK_SIZE aux)
  (round_up (_STACK_SIZE aux) (bv (STACK_ALIGNMENT) 32)))

(define (EBPF_SCRATCH_TO_ARM_FP x)
  (if (CONFIG_FRAME_POINTER)
      (bvsub x (bvmul (bv 4 16) (hweight16 CALLEE_PUSH_MASK)) (bv 4 16))
      x))

(define TMP_REG_1 'tmp1) ; TEMP Register 1
(define TMP_REG_2 'tmp2) ; TEMP Register 2
(define TCALL_CNT 'tcc) ; Tail Call Count

(define @bpf2a32 (list
  ; return value from in-kernel function, and exit value from eBPF
  (cons BPF_REG_0 (cons ARM_R1 ARM_R0))
  ; arguments from eBPF program to in-kernel function
  (cons BPF_REG_1 (cons ARM_R3 ARM_R2))
  ; Stored on stack scratch space
  (cons BPF_REG_2 (cons (STACK_OFFSET BPF_R2_HI) (STACK_OFFSET BPF_R2_LO)))
  (cons BPF_REG_3 (cons (STACK_OFFSET BPF_R3_HI) (STACK_OFFSET BPF_R3_LO)))
  (cons BPF_REG_4 (cons (STACK_OFFSET BPF_R4_HI) (STACK_OFFSET BPF_R4_LO)))
  (cons BPF_REG_5 (cons (STACK_OFFSET BPF_R5_HI) (STACK_OFFSET BPF_R5_LO)))
  ; callee saved registers that in-kernel function will preserve
  (cons BPF_REG_6 (cons ARM_R5 ARM_R4))
  ; Stored on stack scratch space
  (cons BPF_REG_7 (cons (STACK_OFFSET BPF_R7_HI) (STACK_OFFSET BPF_R7_LO)))
  (cons BPF_REG_8 (cons (STACK_OFFSET BPF_R8_HI) (STACK_OFFSET BPF_R8_LO)))
  (cons BPF_REG_9 (cons (STACK_OFFSET BPF_R9_HI) (STACK_OFFSET BPF_R9_LO)))
  ; Read only Frame Pointer to access Stack
  (cons BPF_REG_FP (cons (STACK_OFFSET BPF_FP_HI) (STACK_OFFSET BPF_FP_LO)))
  ; Temporary Register for internal BPF JIT, can be used
  ; for constant blindings and others.
  (cons TMP_REG_1 (cons ARM_R7 ARM_R6))
  (cons TMP_REG_2 (cons ARM_R9 ARM_R8))
  ; Tail call count. Stored on stack scratch space.
  (cons TCALL_CNT (cons (STACK_OFFSET BPF_TC_HI) (STACK_OFFSET BPF_TC_LO)))
  ; temporary register for blinding constants.
  ; Stored on stack scratch space.
  (cons BPF_REG_AX (cons (STACK_OFFSET BPF_AX_HI) (STACK_OFFSET BPF_AX_LO)))))

(define (bpf2a32 r)
  (cdr (assoc r @bpf2a32)))

(define (hi x) (car x))
(define (lo x) (cdr x))

(struct context (target idx epilogue-offset offsets program-length stack_size aux) #:mutable #:transparent)

(define (->prog->aux->verifier_zext ctx)
  (bpf-prog-aux-verifier_zext (context-aux ctx)))

(define (_emit cond insn ctx)
  (set! insn (arm32:conditional-instruction (bv cond 4) insn))
  (for/all ([insns (context-target ctx) #:exhaustive])
    (set-context-target! ctx (vector-append insns (vector insn))))
  (set-context-idx! ctx (bvadd (bv 1 32) (context-idx ctx))))

 ; Emit an instruction that will be executed unconditionally.
(define (emit inst ctx)
  (_emit ARM_COND_AL inst ctx))

; Checks if immediate value can be converted to imm12(12 bits) value.
(define (imm8m x [rot 0])
  (if (< rot 16)
      (if (bvzero? (bvand x (bvnot (ror32 (bv #xff 32) (bv (* 2 rot) 32)))))
          (bvor (rol32 x (bv (* 2 rot) 32)) (bv (arithmetic-shift rot 8) 32))
          (imm8m x (add1 rot)))
      (bv -1 32)))

; imm12: s16
(define (arm_bpf_ldst_imm12 op rt rn imm12)
  (define U
    (cond
      [(bvsge imm12 (bv 0 16))
       (bv #b1 1)]
      [else
       (set! imm12 (bvneg imm12))
       (bv #b0 1)]))
  (op (bv #b1 1) U (bv #b0 1) rn rt (extract 11 0 imm12)))

; imm8: s16
(define (arm_bpf_ldst_imm8 op rt rn imm8)
  (define U
    (cond
      [(bvsge imm8 (bv 0 16))
       (bv #b1 1)]
      [else
       (set! imm8 (bvneg imm8))
       (bv #b0 1)]))
  (op (bv #b1 1) U (bv #b0 1) rn rt (extract 7 4 imm8) (extract 3 0 imm8)))

(define (ARM_LDR_I rt rn off)  (arm_bpf_ldst_imm12 arm32:ldr-immediate rt rn off))
(define (ARM_LDRB_I rt rn off) (arm_bpf_ldst_imm12 arm32:ldrb-immediate rt rn off))
(define (ARM_LDRD_I rt rn off) (if (use-ldrd/strd) (arm_bpf_ldst_imm8 arm32:ldrd-immediate rt rn off) (core:bug #:msg "no ldrd")))
(define (ARM_LDRH_I rt rn off) (arm_bpf_ldst_imm8 arm32:ldrh-immediate rt rn off))

(define (ARM_STR_I rt rn off)  (arm_bpf_ldst_imm12 arm32:str-immediate rt rn off))
(define (ARM_STRB_I rt rn off) (arm_bpf_ldst_imm12 arm32:strb-immediate rt rn off))
(define (ARM_STRD_I rt rn off) (if (use-ldrd/strd) (arm_bpf_ldst_imm8 arm32:strd-immediate rt rn off) (core:bug #:msg "no strd")))
(define (ARM_STRH_I rt rn off) (arm_bpf_ldst_imm8 arm32:strh-immediate rt rn off))


(define (bpf2a32_offset bpf_to bpf_from ctx)
  (define offsets (context-offsets ctx))
  (define to (offsets bpf_to))
  (define from (offsets bpf_from))
  (bvsub to from (bv 1 32)))


; Move an immediate that's not an imm8m to a core register.
(define (emit_mov_i_no8m rd val ctx)
  (assert ((bitvector 32) val))
  (emit (ARM_MOVW rd (bvand val (bv #xffff 32))) ctx)
  (when (bvugt val (bv #xffff 32))
    (emit (ARM_MOVT rd (bvlshr val (bv 16 32))) ctx)))


(define (emit_mov_i rd val ctx)
  (assert ((bitvector 32) val))
  (define imm12 (imm8m val))

  (if (bvsge imm12 (bv 0 32))
      (emit (ARM_MOV_I rd imm12) ctx)
      (emit_mov_i_no8m rd val ctx)))

(define (emit_blx_r tgt_reg ctx)
  ; NB: assume __LINUX_ARM_ARCH >= 5
  (emit (ARM_BLX_R tgt_reg) ctx))

(define (epilogue_offset ctx)
  (define to (context-epilogue-offset ctx))
  (define from (context-idx ctx))
  (bvsub (bvsub to from) (bv 2 (type-of to))))

(define (emit_udivmod rd rm rn ctx op)
  (case op
    [(BPF_DIV)
     (emit (ARM_UDIV rd rm rn) ctx)]
    [else
     (emit (ARM_UDIV ARM_IP rm rn) ctx)
     (emit (ARM_MLS rd rn ARM_IP rm) ctx)]))


; Is the translated BPF register on stack?
(define (is_stacked reg)
  ((bitvector 16) reg))


; If a BPF register is on the stack (stk is true), load it to the
; supplied temporary register and return the temporary register
; for subsequent operations, otherwise just use the CPU register.
(define (arm_bpf_get_reg32 reg tmp ctx)
  (if (is_stacked reg)
      (begin
        (emit (ARM_LDR_I tmp ARM_FP (EBPF_SCRATCH_TO_ARM_FP reg)) ctx)
        tmp)
      reg))

(define (arm_bpf_get_reg64 reg tmp ctx)
  (when (is_stacked (lo reg))
    (cond
      [(use-ldrd/strd)
       (emit (ARM_LDRD_I (lo tmp) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo reg))) ctx)]
      [else
       (emit (ARM_LDR_I (lo tmp) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo reg))) ctx)
       (emit (ARM_LDR_I (hi tmp) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (hi reg))) ctx)])
    (set! reg tmp))
  reg)

; If a BPF register is on the stack (stk is true), save the register
; back to the stack.  If the source register is not the same, then
; move it into the correct register.
(define (arm_bpf_put_reg32 reg src ctx)
  (if (is_stacked reg)
    (emit (ARM_STR_I src ARM_FP (EBPF_SCRATCH_TO_ARM_FP reg)) ctx)
    (when (! (equal? reg src))
      (emit (ARM_MOV_R reg src) ctx))))

(define (arm_bpf_put_reg64 reg src ctx)
  (cond
    [(is_stacked (lo reg))
     (cond
       [(use-ldrd/strd)
        (emit (ARM_STRD_I (lo src) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo reg))) ctx)]
       [else
        (emit (ARM_STR_I (lo src) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo reg))) ctx)
        (emit (ARM_STR_I (hi src) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (hi reg))) ctx)])]
    [else
     (when (! (equal? (lo reg) (lo src)))
       (emit (ARM_MOV_R (lo reg) (lo src)) ctx))
     (when (! (equal? (hi reg) (hi src)))
       (emit (ARM_MOV_R (hi reg) (hi src) ctx)))]))


(define (emit_a32_mov_i dst val ctx)
  (define tmp (bpf2a32 TMP_REG_1))

  (if (is_stacked dst)
      (begin
        (emit_mov_i (lo tmp) val ctx)
        (arm_bpf_put_reg32 dst (lo tmp) ctx))
      (emit_mov_i dst val ctx)))


(define (emit_a32_mov_i64 dst val ctx)
  (assert ((bitvector 64) val))
  (define tmp (bpf2a32 TMP_REG_1))
  (define rd (if (is_stacked (lo dst)) tmp dst))

  (emit_mov_i (lo rd) (extract 31 0 val) ctx)
  (emit_mov_i (hi rd) (extract 63 32 val) ctx)

  (arm_bpf_put_reg64 dst rd ctx))

; Sign extended move
(define (emit_a32_mov_se_i64 is64 dst val ctx)
  (assert ((bitvector 32) val))
  (define val64 (zero-extend val (bitvector 64)))

  (when (&& is64 (bitvector->bool (bvand val (bv (arithmetic-shift 1 31) 32))))
    (set! val64 (bvor val64 (bv #xffffffff00000000 64))))
  (emit_a32_mov_i64 dst val64 ctx))


(define (emit_a32_add_r dst src is64 hi ctx)
  ; 64 bit :
  ;   adds dst_lo, dst_lo, src_lo
  ;   adc dst_hi, dst_hi, src_hi
  ; 32 bit :
  ;   add dst_lo, dst_lo, src_lo
  (cond
    [(&& (! hi) is64)
     (emit (ARM_ADDS_R dst dst src) ctx)]
    [(&& hi is64)
     (emit (ARM_ADC_R dst dst src) ctx)]
    [else
     (emit (ARM_ADD_R dst dst src) ctx)]))

(define (emit_a32_sub_r dst src is64 hi ctx)
  ; 64 bit :
  ;   subs dst_lo, dst_lo, src_lo
  ;   sbc dst_hi, dst_hi, src_hi
  ; 32 bit :
  ;   sub dst_lo, dst_lo, src_lo
  (cond
    [(&& (! hi) is64)
     (emit (ARM_SUBS_R dst dst src) ctx)]
    [(&& hi is64)
     (emit (ARM_SBC_R dst dst src) ctx)]
    [else
     (emit (ARM_SUB_R dst dst src) ctx)]))

(define (emit_alu_r dst src is64 hi op ctx)
  (case op
    ; dst = dst + src
    [(BPF_ADD)
     (emit_a32_add_r dst src is64 hi ctx)]
    ; dst = dst - src
    [(BPF_SUB)
     (emit_a32_sub_r dst src is64 hi ctx)]
    ; dst = dst | src
    [(BPF_OR)
     (emit (ARM_ORR_R dst dst src) ctx)]
    ; dst = dst & src
    [(BPF_AND)
     (emit (ARM_AND_R dst dst src) ctx)]
    ; dst = dst ^ src
    [(BPF_XOR)
     (emit (ARM_EOR_R dst dst src) ctx)]
    ; dst = dst * src
    [(BPF_MUL)
     (emit (ARM_MUL dst dst src) ctx)]
    ; dst = dst << src
    [(BPF_LSH)
     (emit (ARM_LSL_R dst dst src) ctx)]
    ; dst = dst >> src
    [(BPF_RSH)
     (emit (ARM_LSR_R dst dst src) ctx)]
    ; dst = dst >> src (signed)
    [(BPF_ARSH)
     (emit (ARM_MOV_SR dst dst SRTYPE_ASR src) ctx)]))

; ALU operation (32 bit)
; dst = dst (op) src
(define (emit_a32_alu_r dst src ctx is64 hi op)
  (define tmp (bpf2a32 TMP_REG_1))
  (define rn (arm_bpf_get_reg32 src (lo tmp) ctx))
  (define rd (arm_bpf_get_reg32 dst (hi tmp) ctx))
  ; ALU operation
  (emit_alu_r rd rn is64 hi op ctx)
  (arm_bpf_put_reg32 dst rd ctx))

; ALU operation (64 bit)
(define (emit_a32_alu_r64 is64 dst src ctx op)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  (define rd (arm_bpf_get_reg64 dst tmp ctx))
  (cond
    [is64
     (define rs (arm_bpf_get_reg64 src tmp2 ctx))
     ; ALU operation
     (emit_alu_r (lo rd) (lo rs) #t #f op ctx)
     (emit_alu_r (hi rd) (hi rs) #t #t op ctx)]
    [else
     (define rs (arm_bpf_get_reg32 (lo src) (lo tmp2) ctx))
     ; ALU operation
     (emit_alu_r (lo rd) rs #t #f op ctx)
     (when (! (->prog->aux->verifier_zext ctx))
       (emit_a32_mov_i (hi rd) (bv 0 32) ctx))])

  (arm_bpf_put_reg64 dst rd ctx))


; dst = src (4 bytes)
(define (emit_a32_mov_r dst src ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define rt (arm_bpf_get_reg32 src (hi tmp) ctx))
  (arm_bpf_put_reg32 dst rt ctx))


; dst = src
(define (emit_a32_mov_r64 is64 dst src ctx)
  (cond
    [(! is64)
     (emit_a32_mov_r (lo dst) (lo src) ctx)
     (when (! (->prog->aux->verifier_zext ctx))
       ; Zero out high 4 bytes
       (emit_a32_mov_i (hi dst) (bv 0 32) ctx))]
    [(! (use-ldrd/strd))
     ; complete 8 byte move
     (emit_a32_mov_r (lo dst) (lo src) ctx)
     (emit_a32_mov_r (hi dst) (hi src) ctx)]
    [(&& (is_stacked (lo src)) (is_stacked (lo dst)))
     (define tmp (bpf2a32 TMP_REG_1))
     (emit (ARM_LDRD_I (lo tmp) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo src))) ctx)
     (emit (ARM_STRD_I (lo tmp) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo dst))) ctx)]
    [(is_stacked (lo src))
     (emit (ARM_LDRD_I (lo dst) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo src))) ctx)]
    [(is_stacked (lo dst))
     (emit (ARM_STRD_I (lo src) ARM_FP (EBPF_SCRATCH_TO_ARM_FP (lo dst))) ctx)]
    [else
     (emit (ARM_MOV_R (hi dst) (hi src)) ctx)
     (emit (ARM_MOV_R (lo dst) (lo src)) ctx)]))


; Shift operations
(define (emit_a32_alu_i dst val ctx op)
  (define tmp (bpf2a32 TMP_REG_1))
  (define rd (arm_bpf_get_reg32 dst (hi tmp) ctx))

  ; Do shift operation
  (case op
    [(BPF_LSH)
     (emit (ARM_LSL_I rd rd val) ctx)]
    [(BPF_RSH)
     (emit (ARM_LSR_I rd rd val) ctx)]
    ; PATCH
    [(BPF_ARSH)
     (emit (ARM_ASR_I rd rd val) ctx)]
    [(BPF_NEG)
     (emit (ARM_RSB_I rd rd val) ctx)])

  (arm_bpf_put_reg32 dst rd ctx))


; dst = ~dst (64 bit)
(define (emit_a32_neg64 dst ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  ; Setup Operand
  (define rd (arm_bpf_get_reg64 dst tmp ctx))

  ; Do Negate Operation
  (emit (ARM_RSBS_I (lo rd) (lo rd) (bv 0 32)) ctx)
  (emit (ARM_RSC_I (hi rd) (hi rd) (bv 0 32)) ctx)

  (arm_bpf_put_reg64 dst rd ctx))


; dst = dst << src
(define (emit_a32_lsh_r64 dst src ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  ; Setup Operands
  (define rt (arm_bpf_get_reg32 (lo src) (lo tmp2) ctx))
  (define rd (arm_bpf_get_reg64 dst tmp ctx))

  ; Do LSH operation
  (emit (ARM_SUB_I ARM_IP rt (bv 32 32)) ctx)
  (emit (ARM_RSB_I (hi tmp2) rt (bv 32 32)) ctx)
  (emit (ARM_MOV_SR ARM_LR (hi rd) SRTYPE_ASL rt) ctx)
  (emit (ARM_ORR_SR ARM_LR ARM_LR (lo rd) SRTYPE_ASL ARM_IP) ctx)
  (emit (ARM_ORR_SR ARM_IP ARM_LR (lo rd) SRTYPE_LSR (hi tmp2)) ctx)
  (emit (ARM_MOV_SR ARM_LR (lo rd) SRTYPE_ASL rt) ctx)

  (arm_bpf_put_reg32 (lo dst) ARM_LR ctx)
  (arm_bpf_put_reg32 (hi dst) ARM_IP ctx))


; dst = dst >> src
(define (emit_a32_rsh_r64 dst src ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  ; Setup Operands
  (define rt (arm_bpf_get_reg32 (lo src) (lo tmp2) ctx))
  (define rd (arm_bpf_get_reg64 dst tmp ctx))

  ; Do RSH operation
  (emit (ARM_RSB_I ARM_IP rt (bv 32 32)) ctx)
  (emit (ARM_SUBS_I (hi tmp2) rt (bv 32 32)) ctx)
  (emit (ARM_MOV_SR ARM_LR (lo rd) SRTYPE_LSR rt) ctx)
  (emit (ARM_ORR_SR ARM_LR ARM_LR (hi rd) SRTYPE_ASL ARM_IP) ctx)
  (emit (ARM_ORR_SR ARM_LR ARM_LR (hi rd) SRTYPE_LSR (hi tmp2)) ctx)
  (emit (ARM_MOV_SR ARM_IP (hi rd) SRTYPE_LSR rt) ctx)

  (arm_bpf_put_reg32 (lo dst) ARM_LR ctx)
  (arm_bpf_put_reg32 (hi dst) ARM_IP ctx))


; dst = dst >> src (signed)
(define (emit_a32_arsh_r64 dst src ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  ; Setup Operands
  (define rt (arm_bpf_get_reg32 (lo src) (lo tmp2) ctx))
  (define rd (arm_bpf_get_reg64 dst tmp ctx))

  ; Do the ARSH operation
  (emit (ARM_RSB_I ARM_IP rt (bv 32 32)) ctx)
  (emit (ARM_SUBS_I (hi tmp2) rt (bv 32 32)) ctx)
  (emit (ARM_MOV_SR ARM_LR (lo rd) SRTYPE_LSR rt) ctx)
  (emit (ARM_ORR_SR ARM_LR ARM_LR (hi rd) SRTYPE_ASL ARM_IP) ctx)
  ; PATCH: the original code uses a conditional B followed by ORR.
  ; Save one instruction by removing B and using a conditional ORR.
  (_emit ARM_COND_PL (ARM_ORR_SR ARM_LR ARM_LR (hi rd) SRTYPE_ASR (hi tmp2)) ctx)
  (emit (ARM_MOV_SR ARM_IP (hi rd) SRTYPE_ASR rt) ctx)

  (arm_bpf_put_reg32 (lo dst) ARM_LR ctx)
  (arm_bpf_put_reg32 (hi dst) ARM_IP ctx))


; dst = dst << val
(define (emit_a32_lsh_i64 dst val ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  ; Setup Operands
  (define rd (arm_bpf_get_reg64 dst tmp ctx))

  ; Do LSH operation
  (cond
    [(bvult val (bv 32 32))
     (emit (ARM_MOV_SI (hi tmp2) (hi rd) SRTYPE_ASL val) ctx)
     (emit (ARM_ORR_SI (hi rd) (hi tmp2) (lo rd) SRTYPE_LSR (bvsub (bv 32 32) val)) ctx)
     (emit (ARM_MOV_SI (lo rd) (lo rd) SRTYPE_ASL val) ctx)]
    [else
     (if (bveq val (bv 32 32))
         (emit (ARM_MOV_R (hi rd) (lo rd)) ctx)
         (emit (ARM_MOV_SI (hi rd) (lo rd) SRTYPE_ASL (bvsub val (bv 32 32))) ctx))
     (emit (ARM_EOR_R (lo rd) (lo rd) (lo rd)) ctx)])

  (arm_bpf_put_reg64 dst rd ctx))


; dst = dst >> val
(define (emit_a32_rsh_i64 dst val ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  ; Setup operands
  (define rd (arm_bpf_get_reg64 dst tmp ctx))

  ;  Do LSR operation
  (cond
    [(PATCH-TEST (bveq val (bv 0 32)))
     (void)]
    [(bvult val (bv 32 32))
     (emit (ARM_MOV_SI (lo tmp2) (lo rd) SRTYPE_LSR val) ctx)
     (emit (ARM_ORR_SI (lo rd) (lo tmp2) (hi rd) SRTYPE_ASL (bvsub (bv 32 32) val)) ctx)
     (emit (ARM_MOV_SI (hi rd) (hi rd) SRTYPE_LSR val) ctx)]
    [(bveq val (bv 32 32))
     (emit (ARM_MOV_R (lo rd) (hi rd)) ctx)
     (emit (ARM_MOV_I (hi rd) (bv 0 32)) ctx)]
    [else
     (emit (ARM_MOV_SI (lo rd) (hi rd) SRTYPE_LSR (bvsub val (bv 32 32))) ctx)
     (emit (ARM_MOV_I (hi rd) (bv 0 32)) ctx)])

  (arm_bpf_put_reg64 dst rd ctx))


; dst = dst >> val (signed)
(define (emit_a32_arsh_i64 dst val ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  ; Setup operands
  (define rd (arm_bpf_get_reg64 dst tmp ctx))

  ; Do ARSH operation
  (cond
    [(PATCH-TEST (bveq val (bv 0 32)))
     (void)]
    [(bvult val (bv 32 32))
     (emit (ARM_MOV_SI (lo tmp2) (lo rd) SRTYPE_LSR val) ctx)
     (emit (ARM_ORR_SI (lo rd) (lo tmp2) (hi rd) SRTYPE_ASL (bvsub (bv 32 32) val)) ctx)
     (emit (ARM_MOV_SI (hi rd) (hi rd) SRTYPE_ASR val) ctx)]
    [(bveq val (bv 32 32))
     (emit (ARM_MOV_R (lo rd) (hi rd)) ctx)
     (emit (ARM_MOV_SI (hi rd) (hi rd) SRTYPE_ASR (bv 31 32)) ctx)]
    [else
     (emit (ARM_MOV_SI (lo rd) (hi rd) SRTYPE_ASR (bvsub val (bv 32 32))) ctx)
     (emit (ARM_MOV_SI (hi rd) (hi rd) SRTYPE_ASR (bv 31 32)) ctx)])

  (arm_bpf_put_reg64 dst rd ctx))


(define (emit_a32_mul_r64 dst src ctx)
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))

  ; Setup operands for multiplication
  (define rd (arm_bpf_get_reg64 dst tmp ctx))
  (define rt (arm_bpf_get_reg64 src tmp2 ctx))

  ; Do Multiplication
  (emit (ARM_MUL ARM_IP (lo rd) (hi rt)) ctx)
  (emit (ARM_MUL ARM_LR (hi rd) (lo rt)) ctx)
  (emit (ARM_ADD_R ARM_LR ARM_IP ARM_LR) ctx)

  (emit (ARM_UMULL ARM_IP (hi rd) (lo rd) (lo rt)) ctx)
  (emit (ARM_ADD_R (hi rd) ARM_LR (hi rd)) ctx)

  (arm_bpf_put_reg32 (lo dst) ARM_IP ctx)
  (arm_bpf_put_reg32 (hi dst) (hi rd) ctx))


(define (is_ldst_imm off sz)
  (define off_max
    (case sz
      [(BPF_B BPF_W)
       ; imm12
       (bv #xfff 16)]
      [(BPF_H)
       ; imm8
       (bv #xff 16)]
      [(BPF_DW)
       ; imm16 (minus 4) using ldr/str (avoid ldrd/strd for better unaligned accesses)
       (bv (- #xfff 4) 16)]))
  (&& (bvsle (bvneg off_max) off) (bvsle off off_max)))

; *(size *)(dst + off) = src
(define (emit_str_r dst src off ctx sz)
  (define tmp (bpf2a32 TMP_REG_1))
  (define rd (arm_bpf_get_reg32 dst (lo tmp) ctx))

  ; PATCH: bounds
  (when (! (is_ldst_imm off sz))
    (emit_a32_mov_i (hi tmp) (sign-extend off (bitvector 32)) ctx)
    (emit (ARM_ADD_R (hi tmp) (hi tmp) rd) ctx)
    (set! rd (hi tmp))
    (set! off (bv 0 16)))

  (case sz
    [(BPF_B)
     ; Store a Byte
     (emit (ARM_STRB_I (lo src) rd off) ctx)]
    [(BPF_H)
     ; Store a HalfWord
     (emit (ARM_STRH_I (lo src) rd off) ctx)]
    [(BPF_W)
     ; Store a Word
     (emit (ARM_STR_I (lo src) rd off) ctx)]
    [(BPF_DW)
     ; Store a Double Word
     (emit (ARM_STR_I (lo src) rd off) ctx)
     (emit (ARM_STR_I (hi src) rd (bvadd off (bv 4 16))) ctx)]))


; dst = *(size*)(src + off)
(define (emit_ldx_r dst src off ctx sz)
  (define tmp (bpf2a32 TMP_REG_1))
  (define rd (if (is_stacked (lo dst)) tmp dst))
  (define rm src)

  (cond
    ; PATCH: bounds
    [(! (is_ldst_imm off sz))
     (emit_a32_mov_i (hi tmp) (sign-extend off (bitvector 32)) ctx)
     (emit (ARM_ADD_R (hi tmp) (hi tmp) src) ctx)
     (set! rm (hi tmp))
     (set! off (bv 0 16))]
    [(equal? (lo rd) rm)
     (emit (ARM_MOV_R (hi tmp) rm) ctx)
     (set! rm (hi tmp))])

  (case sz
    [(BPF_B)
     ; Load a Byte
     (emit (ARM_LDRB_I (lo rd) rm off) ctx)
     (when (! (->prog->aux->verifier_zext ctx))
       (emit_a32_mov_i (hi rd) (bv 0 32) ctx))]
    [(BPF_H)
     ; Load a HalfWord
     (emit (ARM_LDRH_I (lo rd) rm off) ctx)
     (when (! (->prog->aux->verifier_zext ctx))
       (emit_a32_mov_i (hi rd) (bv 0 32) ctx))]
    [(BPF_W)
     ; Load a Word
     (emit (ARM_LDR_I (lo rd) rm off) ctx)
     (when (! (->prog->aux->verifier_zext ctx))
       (emit_a32_mov_i (hi rd) (bv 0 32) ctx))]
    [(BPF_DW)
     ; Load a Double Word
     (emit (ARM_LDR_I (lo rd) rm off) ctx)
     (emit (ARM_LDR_I (hi rd) rm (bvadd off (bv 4 16))) ctx)])

  (arm_bpf_put_reg64 dst rd ctx))


; Arithmatic Operation
(define (emit_ar_r rd rt rm rn ctx op is_jmp64)
  (case op
    [(BPF_JSET)
     (cond
       [is_jmp64
        (emit (ARM_AND_R ARM_IP rt rn) ctx)
        (emit (ARM_AND_R ARM_LR rd rm) ctx)
        (emit (ARM_ORRS_R ARM_IP ARM_LR ARM_IP) ctx)]
       [else
        (emit (ARM_ANDS_R ARM_IP rt rn) ctx)])]
    [(BPF_JEQ
      BPF_JNE
      BPF_JGT
      BPF_JGE
      BPF_JLE
      BPF_JLT)
     (cond
       [is_jmp64
        (emit (ARM_CMP_R rd rm) ctx)
        ; Only compare low halve if high halve are equal.
        (_emit ARM_COND_EQ (ARM_CMP_R rt rn) ctx)]
       [else
        (emit (ARM_CMP_R rt rn) ctx)])]
    [(BPF_JSLE
      BPF_JSGT)
     (emit (ARM_CMP_R rn rt) ctx)
     (when is_jmp64
       (emit (ARM_SBCS_R ARM_IP rm rd) ctx))]
    [(BPF_JSLT
      BPF_JSGE)
      (emit (ARM_CMP_R rt rn) ctx)
     (when is_jmp64
       (emit (ARM_SBCS_R ARM_IP rd rm) ctx))]))


; 0xabcd => 0xcdab
(define (emit_rev16 rd rn ctx)
  (cond
    [(use-rev)
     (emit (ARM_REV16 rd rn) ctx)]
    [else
     (define tmp2 (bpf2a32 TMP_REG_2))

     (emit (ARM_AND_I (lo tmp2) rn (bv #xff 32)) ctx)
     (emit (ARM_MOV_SI (hi tmp2) rn SRTYPE_LSR (bv 8 32)) ctx)
     (emit (ARM_AND_I (hi tmp2) (hi tmp2) (bv #xff 32)) ctx)
     (emit (ARM_ORR_SI rd (hi tmp2) (lo tmp2) SRTYPE_LSL (bv 8 32)) ctx)]))

; 0xabcdefgh => 0xghefcdab
(define (emit_rev32 rd rn ctx)
  (cond
    [(use-rev)
     (emit (ARM_REV rd rn) ctx)]
    [else
     (define tmp2 (bpf2a32 TMP_REG_2))

     (emit (ARM_AND_I (lo tmp2) rn (bv #xff 32)) ctx)
     (emit (ARM_MOV_SI (hi tmp2) rn SRTYPE_LSR (bv 24 32)) ctx)
     (emit (ARM_ORR_SI ARM_IP (hi tmp2) (lo tmp2) SRTYPE_LSL (bv 24 32)) ctx)

     (emit (ARM_MOV_SI (lo tmp2) rn SRTYPE_LSR (bv 8 32)) ctx)
     (emit (ARM_AND_I (lo tmp2) (lo tmp2) (bv #xff 32)) ctx)
     (emit (ARM_MOV_SI (hi tmp2) rn SRTYPE_LSR (bv 16 32)) ctx)
     (emit (ARM_AND_I (hi tmp2) (hi tmp2) (bv #xff 32)) ctx)
     (emit (ARM_MOV_SI (hi tmp2) (hi tmp2) SRTYPE_LSL (bv 8 32)) ctx)
     (emit (ARM_ORR_SI (hi tmp2) (hi tmp2) (lo tmp2) SRTYPE_LSL (bv 16 32)) ctx)
     (emit (ARM_ORR_R rd ARM_IP (hi tmp2)) ctx)]))

(define (emit_push_r64 src ctx)
  (define tmp2 (bpf2a32 TMP_REG_2))
  (define reg_set (bv 0 16))

  (define rt (arm_bpf_get_reg64 src tmp2 ctx))

  (set! reg_set (bvor (bvshl (bv 1 16) (zero-extend (unbox (lo rt)) (bitvector 16)))
                      (bvshl (bv 1 16) (zero-extend (unbox (hi rt)) (bitvector 16)))))

  (emit (ARM_PUSH reg_set) ctx))

(define (build_prologue ctx)
  (define aux (context-aux ctx))
  (define arm_r0 (lo (bpf2a32 BPF_REG_0)))
  (define bpf_r1 (bpf2a32 BPF_REG_1))
  (define bpf_fp (bpf2a32 BPF_REG_FP))
  (define tcc (bpf2a32 TCALL_CNT))

  ; Save callee saved registers.
  ; NB: assume CONFIG_FRAME_POINTER
  (cond
    [(CONFIG_FRAME_POINTER)
      (define reg_set
        (bvor CALLEE_PUSH_MASK
              (bvshl (bv 1 16) (bv 12 16))   ; ARM_IP
              (bvshl (bv 1 16) (bv 15 16)))) ; ARM_PC
      (emit (ARM_MOV_R ARM_IP ARM_SP) ctx)
      (emit (ARM_PUSH reg_set) ctx)
      (emit (ARM_SUB_I ARM_FP ARM_IP (bv 4 32)) ctx)]
    [else
      (error "not supported")])

  ; mov r3, #0
  ; sub r2, sp, #SCRATCH_SIZE
  (emit (ARM_MOV_I (hi bpf_r1) (bv 0 32)) ctx)
  (emit (ARM_SUB_I (lo bpf_r1) ARM_SP (bv SCRATCH_SIZE 32)) ctx)

  (set-context-stack_size! ctx (imm8m (STACK_SIZE aux)))

  ; Set up function call stack.
  (emit (ARM_SUB_I ARM_SP ARM_SP (context-stack_size ctx)) ctx)

  ; Set up BPF prog stack base register
  (emit_a32_mov_r64 #t bpf_fp bpf_r1 ctx)

  ; Initialize Tail Count
  (emit (ARM_MOV_I (lo bpf_r1) (bv 0 32)) ctx)
  (emit_a32_mov_r64 #t tcc bpf_r1 ctx)

  ; Move BPF_CTX to BPF_R1
  (emit (ARM_MOV_R (lo bpf_r1) arm_r0) ctx)

  ; end of prologue
  (void))

; restore callee saved registers
(define (build_epilogue ctx)
  (cond
    [(CONFIG_FRAME_POINTER)
      (define reg_set
        (bvor CALLEE_POP_MASK
              (bvshl (bv 1 16) (bv 13 16)))) ; ARM_SP

      (emit (ARM_SUB_I ARM_SP ARM_FP (bvmul (bv 4 32) (zero-extend (hweight16 reg_set) (bitvector 32)))) ctx)
      (emit (ARM_LDM ARM_SP reg_set) ctx)]
    [else
      (error "not supported")]))

(define (build_insn i insn next-insn ctx)
  (define code (bpf:insn-code insn))
  (define dst (bpf2a32 (bpf:insn-dst insn)))
  (define src (bpf2a32 (bpf:insn-src insn)))
  (define tmp (bpf2a32 TMP_REG_1))
  (define tmp2 (bpf2a32 TMP_REG_2))
  (define off (bpf:insn-off insn))
  (define imm (bpf:insn-imm insn))
  (define is64 (equal? (BPF_CLASS code) 'BPF_ALU64))
  (define off32 (sign-extend off (bitvector 32)))

  (case code
    ; ALU operations

    ; dst = src
    [((BPF_ALU BPF_MOV BPF_X)
      (BPF_ALU64 BPF_MOV BPF_X))
      (if (equal? imm (bv 1 32))
        ; Special mov32 for zext
        (emit_a32_mov_i (hi dst) (bv 0 32) ctx)
        (emit_a32_mov_r64 is64 dst src ctx))]
    [((BPF_ALU BPF_MOV BPF_K)
      (BPF_ALU64 BPF_MOV BPF_K))
      ; Sign-extend immediate value to destination reg
      (emit_a32_mov_se_i64 is64 dst imm ctx)]

    ; dst = dst + src/imm
    ; dst = dst - src/imm
    ; dst = dst | src/imm
    ; dst = dst & src/imm
    ; dst = dst ^ src/imm
    ; dst = dst * src/imm
    ; dst = dst << src
    ; dst = dst >> src
    [((BPF_ALU BPF_ADD BPF_X)
      (BPF_ALU BPF_SUB BPF_X)
      (BPF_ALU BPF_OR BPF_X)
      (BPF_ALU BPF_AND BPF_X)
      (BPF_ALU BPF_XOR BPF_X)
      (BPF_ALU BPF_MUL BPF_X)
      (BPF_ALU BPF_LSH BPF_X)
      (BPF_ALU BPF_RSH BPF_X)
      (BPF_ALU BPF_ARSH BPF_X)
      (BPF_ALU64 BPF_ADD BPF_X)
      (BPF_ALU64 BPF_SUB BPF_X)
      (BPF_ALU64 BPF_OR BPF_X)
      (BPF_ALU64 BPF_AND BPF_X)
      (BPF_ALU64 BPF_XOR BPF_X))
     (emit_a32_alu_r64 is64 dst src ctx (BPF_OP code))]
    [((BPF_ALU BPF_ADD BPF_K)
      (BPF_ALU BPF_SUB BPF_K)
      (BPF_ALU BPF_OR BPF_K)
      (BPF_ALU BPF_AND BPF_K)
      (BPF_ALU BPF_XOR BPF_K)
      (BPF_ALU BPF_MUL BPF_K)
      (BPF_ALU64 BPF_ADD BPF_K)
      (BPF_ALU64 BPF_SUB BPF_K)
      (BPF_ALU64 BPF_OR BPF_K)
      (BPF_ALU64 BPF_AND BPF_K)
      (BPF_ALU64 BPF_XOR BPF_K))
     ; Move immediate value to the temporary register
     ; and then do the ALU operation on the temporary
     ; register as this will sign-extend the immediate
     ; value into temporary reg and then it would be
     ; safe to do the operation on it.
     (emit_a32_mov_se_i64 is64 tmp2 imm ctx)
     (emit_a32_alu_r64 is64 dst tmp2 ctx (BPF_OP code))]

    ; dst = dst / src(imm)
    ; dst = dst % src(imm)
    [((BPF_ALU BPF_DIV BPF_K)
      (BPF_ALU BPF_DIV BPF_X)
      (BPF_ALU BPF_MOD BPF_K)
      (BPF_ALU BPF_MOD BPF_X))
     (define rd_lo (arm_bpf_get_reg32 (lo dst) (lo tmp2) ctx))
     (define rt
       (case (BPF_SRC code)
         [(BPF_X)
          (arm_bpf_get_reg32 (lo src) (hi tmp2) ctx)]
         [(BPF_K)
          (emit_a32_mov_i (hi tmp2) imm ctx)
          (hi tmp2)]))
     (emit_udivmod rd_lo rd_lo rt ctx (BPF_OP code))
     (arm_bpf_put_reg32 (lo dst) rd_lo ctx)
     (when (! (->prog->aux->verifier_zext ctx))
       (emit_a32_mov_i (hi dst) (bv 0 32) ctx))]
    ; no 64-bit DIV/MOD support

    ; dst = dst >> imm
    ; dst = dst << imm
    ; dst = dst >> imm (signed)
    [((BPF_ALU BPF_LSH BPF_K)
      (BPF_ALU BPF_RSH BPF_K)
      ; PATCH
      (BPF_ALU BPF_ARSH BPF_K))
     (when (bitvector->bool imm)
       (emit_a32_alu_i (lo dst) imm ctx (BPF_OP code)))
     (when (! (->prog->aux->verifier_zext ctx))
       (emit_a32_mov_i (hi dst) (bv 0 32) ctx))]

    ; dst = dst << imm
    [((BPF_ALU64 BPF_LSH BPF_K))
     (emit_a32_lsh_i64 dst imm ctx)]
    ; dst = dst >> imm
    [((BPF_ALU64 BPF_RSH BPF_K))
     (emit_a32_rsh_i64 dst imm ctx)]
    ; dst = dst >> imm (signed)
    [((BPF_ALU64 BPF_ARSH BPF_K))
     (emit_a32_arsh_i64 dst imm ctx)]

    ; dst = dst << src
    [((BPF_ALU64 BPF_LSH BPF_X))
     (emit_a32_lsh_r64 dst src ctx)]
    ; dst = dst >> src
    [((BPF_ALU64 BPF_RSH BPF_X))
     (emit_a32_rsh_r64 dst src ctx)]
    ; dst = dst >> src (signed)
    [((BPF_ALU64 BPF_ARSH BPF_X))
     (emit_a32_arsh_r64 dst src ctx)]

    ; dst = ~dst
    [((BPF_ALU BPF_NEG))
     (emit_a32_alu_i (lo dst) (bv 0 32) ctx (BPF_OP code))
     (when (! (->prog->aux->verifier_zext ctx))
       (emit_a32_mov_i (hi dst) (bv 0 32) ctx))]
     ; dst = ~dst (64 bit)
    [((BPF_ALU64 BPF_NEG))
     (emit_a32_neg64 dst ctx)]

    ; dst = dst * src/imm
    [((BPF_ALU64 BPF_MUL BPF_X))
     (emit_a32_mul_r64 dst src ctx)]
    [((BPF_ALU64 BPF_MUL BPF_K))
     ; Move immediate value to the temporary register
     ; and then do the multiplication on it as this
     ; will sign-extend the immediate value into temp
     ; reg then it would be safe to do the operation
     ; on it.
     (emit_a32_mov_se_i64 is64 tmp2 imm ctx)
     (emit_a32_mul_r64 dst tmp2 ctx)]

    ; dst = htole(dst)
    ; dst = htobe(dst)
    [((BPF_ALU BPF_END BPF_FROM_LE)
      (BPF_ALU BPF_END BPF_FROM_BE))
     (define rd (arm_bpf_get_reg64 dst tmp ctx))
     (define (emit_bswap_uxt)
       (cond
         [(bveq imm (bv 16 32))
          ; zero-extend 16 bits into 64 bits
          (cond
            [(use-uxth)
             (emit (ARM_UXTH (lo rd) (lo rd)) ctx)]
            [else
             (emit_a32_mov_i (lo tmp2) (bv #xffff 32) ctx)
             (emit (ARM_AND_R (lo rd) (lo rd) (lo tmp2)) ctx)])
          (when (! (->prog->aux->verifier_zext ctx))
            (emit (ARM_EOR_R (hi rd) (hi rd) (hi rd)) ctx))]
         [(bveq imm (bv 32 32))
          ; zero-extend 32 bits into 64 bits
          (when (! (->prog->aux->verifier_zext ctx))
            (emit (ARM_EOR_R (hi rd) (hi rd) (hi rd)) ctx))]
         [(bveq imm (bv 64 32))
          ; nop
          (void)]))
     (case (BPF_SRC code)
       [(BPF_FROM_LE)
        (emit_bswap_uxt)]
       [else
        (cond
          [(bveq imm (bv 16 32))
           (emit_rev16 (lo rd) (lo rd) ctx)
           (emit_bswap_uxt)]
          [(bveq imm (bv 32 32))
           (emit_rev32 (lo rd) (lo rd) ctx)
           (emit_bswap_uxt)]
          [(bveq imm (bv 64 32))
           (emit_rev32 ARM_LR (lo rd) ctx)
           (emit_rev32 (lo rd) (hi rd) ctx)
           (emit (ARM_MOV_R (hi rd) ARM_LR) ctx)])])
     (arm_bpf_put_reg64 dst rd ctx)]

    [((BPF_JMP BPF_CALL))
      (define r0 (bpf2a32 BPF_REG_0))
      (define r1 (bpf2a32 BPF_REG_1))
      (define r2 (bpf2a32 BPF_REG_2))
      (define r3 (bpf2a32 BPF_REG_3))
      (define r4 (bpf2a32 BPF_REG_4))
      (define r5 (bpf2a32 BPF_REG_5))

      (define func (bvadd (extract 31 0 (bpf-jit-call-base))
                          (zero-extend imm (bitvector 32))))

      (emit_a32_mov_r64 #t r0 r1 ctx)
      (emit_a32_mov_r64 #t r1 r2 ctx)
      (emit_push_r64 r5 ctx)
      (emit_push_r64 r4 ctx)
      (emit_push_r64 r3 ctx)

      (emit_a32_mov_i (lo tmp) func ctx)
      (emit_blx_r (lo tmp) ctx)

      (emit (ARM_ADD_I ARM_SP ARM_SP (imm8m (bv 24 32))) ctx)]

    [((BPF_JMP BPF_EXIT))
      (cond
        [(equal? i (bvsub1 (context-program-length ctx)))
          ; Break
          (void)]
        [else
          (define jmp_offset (epilogue_offset ctx))
          (emit (ARM_B jmp_offset) ctx)])]

    ; dst = imm64
    [((BPF_LD BPF_IMM BPF_DW))
      (define val
        (bvor (bvshl (zero-extend (bpf:insn-imm next-insn) (bitvector 64)) (bv 32 64))
              (zero-extend imm (bitvector 64))))
      (emit_a32_mov_i64 dst val ctx)]

    ; LDX: dst = *(size *)(src + off)
    [((BPF_LDX BPF_MEM BPF_W)
      (BPF_LDX BPF_MEM BPF_H)
      (BPF_LDX BPF_MEM BPF_B)
      (BPF_LDX BPF_MEM BPF_DW))
     (define rn (arm_bpf_get_reg32 (lo src) (lo tmp2) ctx))
     (emit_ldx_r dst rn off ctx (BPF_SIZE code))]

    ; ST: *(size *)(dst + off) = imm
    [((BPF_ST BPF_MEM BPF_W)
      (BPF_ST BPF_MEM BPF_H)
      (BPF_ST BPF_MEM BPF_B)
      (BPF_ST BPF_MEM BPF_DW))
     (case (BPF_SIZE code)
       [(BPF_DW)
        ; Sign-extend immediate value into temp reg
        (emit_a32_mov_se_i64 #t tmp2 imm ctx)]
       [(BPF_W BPF_H BPF_B)
        (emit_a32_mov_i (lo tmp2) imm ctx)])
      (emit_str_r (lo dst) tmp2 off ctx (BPF_SIZE code))]

    ; STX XADD: lock *(u32 *)(dst + off) += src
    ; STX XADD: lock *(u64 *)(dst + off) += src
    ; not yet

    ; STX: *(size *)(dst + off) = src
    [((BPF_STX BPF_MEM BPF_W)
      (BPF_STX BPF_MEM BPF_H)
      (BPF_STX BPF_MEM BPF_B)
      (BPF_STX BPF_MEM BPF_DW))
     (define rs (arm_bpf_get_reg64 src tmp2 ctx))
     (emit_str_r (lo dst) rs off ctx (BPF_SIZE code))]

    ; PC += off if dst == src
    ; PC += off if dst > src
    ; PC += off if dst >= src
    ; PC += off if dst < src
    ; PC += off if dst <= src
    ; PC += off if dst != src
    ; PC += off if dst > src (signed)
    ; PC += off if dst >= src (signed)
    ; PC += off if dst < src (signed)
    ; PC += off if dst <= src (signed)
    ; PC += off if dst & src
    [((BPF_JMP BPF_JEQ BPF_X)
      (BPF_JMP BPF_JGT BPF_X)
      (BPF_JMP BPF_JGE BPF_X)
      (BPF_JMP BPF_JNE BPF_X)
      (BPF_JMP BPF_JSGT BPF_X)
      (BPF_JMP BPF_JSGE BPF_X)
      (BPF_JMP BPF_JSET BPF_X)
      (BPF_JMP BPF_JLE BPF_X)
      (BPF_JMP BPF_JLT BPF_X)
      (BPF_JMP BPF_JSLT BPF_X)
      (BPF_JMP BPF_JSLE BPF_X)
      (BPF_JMP32 BPF_JEQ BPF_X)
      (BPF_JMP32 BPF_JGT BPF_X)
      (BPF_JMP32 BPF_JGE BPF_X)
      (BPF_JMP32 BPF_JNE BPF_X)
      (BPF_JMP32 BPF_JSGT BPF_X)
      (BPF_JMP32 BPF_JSGE BPF_X)
      (BPF_JMP32 BPF_JSET BPF_X)
      (BPF_JMP32 BPF_JLE BPF_X)
      (BPF_JMP32 BPF_JLT BPF_X)
      (BPF_JMP32 BPF_JSLT BPF_X)
      (BPF_JMP32 BPF_JSLE BPF_X)
    ; PC += off if dst == imm
    ; PC += off if dst > imm
    ; PC += off if dst >= imm
    ; PC += off if dst < imm
    ; PC += off if dst <= imm
    ; PC += off if dst != imm
    ; PC += off if dst > imm (signed)
    ; PC += off if dst >= imm (signed)
    ; PC += off if dst < imm (signed)
    ; PC += off if dst <= imm (signed)
    ; PC += off if dst & imm
      (BPF_JMP BPF_JEQ BPF_K)
      (BPF_JMP BPF_JGT BPF_K)
      (BPF_JMP BPF_JGE BPF_K)
      (BPF_JMP BPF_JNE BPF_K)
      (BPF_JMP BPF_JSGT BPF_K)
      (BPF_JMP BPF_JSGE BPF_K)
      (BPF_JMP BPF_JSET BPF_K)
      (BPF_JMP BPF_JLE BPF_K)
      (BPF_JMP BPF_JLT BPF_K)
      (BPF_JMP BPF_JSLT BPF_K)
      (BPF_JMP BPF_JSLE BPF_K)
      (BPF_JMP32 BPF_JEQ BPF_K)
      (BPF_JMP32 BPF_JGT BPF_K)
      (BPF_JMP32 BPF_JGE BPF_K)
      (BPF_JMP32 BPF_JNE BPF_K)
      (BPF_JMP32 BPF_JSGT BPF_K)
      (BPF_JMP32 BPF_JSGE BPF_K)
      (BPF_JMP32 BPF_JSET BPF_K)
      (BPF_JMP32 BPF_JLE BPF_K)
      (BPF_JMP32 BPF_JLT BPF_K)
      (BPF_JMP32 BPF_JSLT BPF_K)
      (BPF_JMP32 BPF_JSLE BPF_K))

     (define (go_jmp rm rn)
       ; Setup destination register
       (define rd (arm_bpf_get_reg64 dst tmp ctx))
       ; Check for the condition
       (emit_ar_r (hi rd) (lo rd) rm rn ctx (BPF_OP code) (equal? (BPF_CLASS code) 'BPF_JMP))

       ; Setup JUMP instruction
       (define jmp_offset (bpf2a32_offset (bvadd i off32) i ctx))
       (define cc
         (case (BPF_OP code)
           [(BPF_JNE
             BPF_JSET) ARM_COND_NE]
           [(BPF_JEQ)  ARM_COND_EQ]
           [(BPF_JGT)  ARM_COND_HI]
           [(BPF_JGE)  ARM_COND_CS]
           [(BPF_JSGT) ARM_COND_LT]
           [(BPF_JSGE) ARM_COND_GE]
           [(BPF_JLE)  ARM_COND_LS]
           [(BPF_JLT)  ARM_COND_CC]
           [(BPF_JSLT) ARM_COND_LT]
           [(BPF_JSLE) ARM_COND_GE]))
       (_emit cc (ARM_B jmp_offset) ctx))

     (case (BPF_SRC code)
       [(BPF_X)
        ; Setup source registers
        (define rm (arm_bpf_get_reg32 (hi src) (hi tmp2) ctx))
        (define rn (arm_bpf_get_reg32 (lo src) (lo tmp2) ctx))
        (go_jmp rm rn)]
       [(BPF_K)
        (unless (bvzero? off)
          (define rm (hi tmp2))
          (define rn (lo tmp2))
          ; Sign-extend immediate value
          (emit_a32_mov_se_i64 #t tmp2 imm ctx)
          (go_jmp rm rn))])]

    ; JMP OFF
    [((BPF_JMP BPF_JA))
     (unless (bvzero? off)
       (define jmp_offset (bpf2a32_offset (bvadd i off32) i ctx))
       (emit (ARM_B jmp_offset) ctx))]

    [else (assert #f (format "unknown opcode: ~v" code))])

  (context-target ctx))
