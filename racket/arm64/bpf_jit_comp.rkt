#lang rosette

; This file is translated and adapted from arch/arm64/net/bpf_jit_comp.c,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0-only
;
; BPF JIT compiler for ARM64
;
; Copyright (C) 2014-2016 Zi Shen Lim <zlim.lnx@gmail.com>

(require
  "bpf_jit.rkt"
  "../lib/bpf-common.rkt"
  "../lib/spec/bpf.rkt"
  "../common.rkt"
  "../lib/bvaxiom.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf))

(provide (all-defined-out))

(define TMP_REG_1 'tmp-r1)
(define TMP_REG_2 'tmp-r2)
(define TCALL_CNT 'tcc)
(define TMP_REG_3 'tmp-r3)

(define regmap (list
  ; return value from in-kernel function, and exit value from eBPF
  (cons BPF_REG_0 (A64_R 7))
  ; arguments from eBPF program to in-kernel function
  (cons BPF_REG_1 (A64_R 0))
  (cons BPF_REG_2 (A64_R 1))
  (cons BPF_REG_3 (A64_R 2))
  (cons BPF_REG_4 (A64_R 3))
  (cons BPF_REG_5 (A64_R 4))
  ; callee saved registers that in-kernel function will preserve
  (cons BPF_REG_6 (A64_R 19))
  (cons BPF_REG_7 (A64_R 20))
  (cons BPF_REG_8 (A64_R 21))
  (cons BPF_REG_9 (A64_R 22))
  ; read-only frame pointer to access stack
  (cons BPF_REG_FP (A64_R 25))
  ; temporary registers for internal BPF JIT
  (cons TMP_REG_1 (A64_R 10))
  (cons TMP_REG_2 (A64_R 11))
  (cons TMP_REG_3 (A64_R 12))
  ; tail_call_cnt
  (cons TCALL_CNT (A64_R 26))
  ; temporary register for blinding constants
  (cons BPF_REG_AX (A64_R 9))
))

(define (bpf2a64 r)
  (define e (assoc r regmap))
  (assert e (format "unknown BPF register: ~a" r))
  (cdr e))

(struct context (insns idx epilogue-offset offset program-length stack-size aux) #:mutable #:transparent)

(define (emit insn ctx)
  (for/all ([insns (context-insns ctx) #:exhaustive])
    ; logical-immediate instructions might produce unions with (infeasible) AARCH64_BREAK_FAULT
    (for/all ([insn insn #:exhaustive])
      (set-context-insns! ctx (vector-append insns (vector insn)))))
  (set-context-idx! ctx (bvadd (bv 1 32) (context-idx ctx))))

(define (emit_a64_mov_i is64 reg val ctx)
  (define hi (extract 15 0 (bvashr val (bv 16 32))))
  (define lo (extract 15 0 (bvand val (bv #xffff 32))))

  (cond
    [(bitvector->bool (bvand hi (bv #x8000 16)))
     (cond
       [(bveq hi (bv #xffff 16))
        (emit (A64_MOVN is64 reg (bvnot lo) 0) ctx)]
       [else
        (emit (A64_MOVN is64 reg (bvnot hi) 16) ctx)
        (when (! (bveq lo (bv #xffff 16)))
          (emit (A64_MOVK is64 reg lo 0) ctx))])]
    [else
     (emit (A64_MOVZ is64 reg lo 0) ctx)
     (when (bitvector->bool hi)
       (emit (A64_MOVK is64 reg hi 16) ctx))]))

(define (i64_i16_blocks val inverse)
  (define (block n)
    (if
      (! (bveq (bvand (bvlshr val (bv n 64)) (bv #xffff 64))
               (if inverse (bv #xffff 64) (bv #x0000 64))))
      (bv 1 32)
      (bv 0 32)))
  (bvadd
    (block 0) (block 16) (block 32) (block 48)))

(define-syntax-rule (while #:fuel fuel c body ...)
  (letrec ([loop (lambda (n)
    (cond
      [(<= n 0) (core:bug #:msg "while: out of fuel")]
      [c (begin body ... (loop (- n 1)))]
      [else (void)]))])
    (loop fuel)))

(define (emit_a64_mov_i64 reg val ctx)
  (define nrm_tmp val)
  (define rev_tmp (bvnot val))
  (cond
    [(bvzero? (bvlshr nrm_tmp (bv 32 64)))
      (emit_a64_mov_i (bv 0 1) reg (extract 31 0 val) ctx)]
    [else
      (define inverse (bvslt (i64_i16_blocks nrm_tmp #t)
                             (i64_i16_blocks nrm_tmp #f)))
      (define shift
        (smax
          (round_down
            (if inverse (bvsub (fls64 rev_tmp) (bv 1 64))
                        (bvsub (fls64 nrm_tmp) (bv 1 64)))
            (bv 16 64))
          (bv 0 64)))

      (cond
        [inverse
          (emit (A64_MOVN (bv 1 1) reg (bvand (bvlshr rev_tmp shift) (bv #xffff 64)) shift) ctx)]
        [else
          (emit (A64_MOVZ (bv 1 1) reg (bvand (bvlshr nrm_tmp shift) (bv #xffff 64)) shift) ctx)])

      (set! shift (bvsub shift (bv 16 64)))

      (while #:fuel 4 (bvsge shift (bv 0 64))
        (when (! (bveq (bvand (bvlshr nrm_tmp shift) (bv #xffff 64))
                       (if inverse (bv #xffff 64) (bv 0 64))))
          (emit (A64_MOVK (bv 1 1) reg (bvand (bvlshr nrm_tmp shift) (bv #xffff 64)) shift) ctx))

        (set! shift (bvsub shift (bv 16 64))))]))

; Kernel addresses in the vmalloc space use at most 48 bits, and the
; remaining bits are guaranteed to be 0x1. So we can compose the address
; with a fixed length movn/movk/movk sequence.
(define (emit_addr_mov_i64 reg val ctx)
  (define tmp val)
  (define shift (bv 0 32))

  ; Encode the assumption about kernel addresses.
  (assume (equal? (extract 63 48 val) (bv -1 16)))

  (emit (A64_MOVN (bv 1 1) reg (bvand (bvnot tmp) (bv #xffff 64)) shift) ctx)
  (while #:fuel 3 (bvslt shift (bv 32 32))
    (set! tmp (bvlshr tmp (bv 16 64)))
    (set! shift (bvadd shift (bv 16 32)))
    (emit (A64_MOVK (bv 1 1) reg (bvand tmp (bv #xffff 64)) shift) ctx)))

(define (bpf2a64_offset bpf_insn off ctx)
  ; bpf_insn++;
  (set! bpf_insn (bvadd1 bpf_insn))

  (define (offset x)
    (core:bug-on (bvslt x (bv 0 32)) #:msg "ctx->offset[x] where x < 0")
    ((context-offset ctx) x))

  ; * Whereas arm64 branch instructions encode the offset
  ; * from the branch itself, so we must subtract 1 from the
  ; * instruction offset.
  ; return ctx->offset[bpf_insn + off] - (ctx->offset[bpf_insn] - 1);
  (bvsub (offset (bvadd bpf_insn off))
         (bvsub1 (offset bpf_insn))))

(define (epilogue_offset ctx)
  (define to (context-epilogue-offset ctx))
  (define from (context-idx ctx))
  (bvsub to from))

(define (check_imm bits imm)
  (core:bug-on (|| (&& (bvsgt imm (bv 0 32))
                       (! (bvzero? (bvashr imm (bv bits 32)))))
                   (&& (bvslt imm (bv 0 32))
                       (! (bvzero? (bvashr (bvnot imm) (bv bits 32))))))
   #:msg (format "check_imm~a: ~a" bits imm)))

(define (check_imm26 imm)
  (check_imm 26 imm))

(define (check_imm19 imm)
  (check_imm 19 imm))

(define (is_addsub_imm imm)
  ; optionally shifted imm12
  (|| (bvzero? (bvand imm (bvnot (bv #xfff 32))))
      (bvzero? (bvand imm (bvnot (bv #xfff000 32))))))

(define (STACK_ALIGN sz)
  (bvand (bvadd sz (bv 15 (type-of sz)))
         (bvnot (bv 15 (type-of sz)))))

(define (build_prologue ctx ebpf_from_cbpf)
  (define aux (context-aux ctx))
  (define stack_depth (bpf-prog-aux-stack_depth aux))

  (define r6 (bpf2a64 BPF_REG_6))
  (define r7 (bpf2a64 BPF_REG_7))
  (define r8 (bpf2a64 BPF_REG_8))
  (define r9 (bpf2a64 BPF_REG_9))
  (define fp (bpf2a64 BPF_REG_FP))
  (define tcc (bpf2a64 TCALL_CNT))

  ; Save FP and LR registers to stay align with ARM64 AAPCS
  (emit (A64_PUSH A64_FP A64_LR A64_SP) ctx)
  (emit (A64_MOV (bv 1 1) A64_FP A64_SP) ctx)

  ; Save callee-saved registers
  (emit (A64_PUSH r6 r7 A64_SP) ctx)
  (emit (A64_PUSH r8 r9 A64_SP) ctx)
  (emit (A64_PUSH fp tcc A64_SP) ctx)

  (emit (A64_MOV (bv 1 1) fp A64_SP) ctx)

  (set-context-stack-size! ctx (STACK_ALIGN stack_depth))

  ; Set up function call stack
  (emit (A64_SUB_I (bv 1 1) A64_SP A64_SP (context-stack-size ctx)) ctx)
  (void))

(define (build_epilogue ctx)
  (define r0 (bpf2a64 BPF_REG_0))
  (define r6 (bpf2a64 BPF_REG_6))
  (define r7 (bpf2a64 BPF_REG_7))
  (define r8 (bpf2a64 BPF_REG_8))
  (define r9 (bpf2a64 BPF_REG_9))
  (define fp (bpf2a64 BPF_REG_FP))

  ; We're done with BPF stack
  (emit (A64_ADD_I (bv 1 1) A64_SP A64_SP (context-stack-size ctx)) ctx)

  ; Restore fs (x25) and x26
  (emit (A64_POP fp (A64_R 26) A64_SP) ctx)

  ; Restore callee-saved register
  (emit (A64_POP r8 r9 A64_SP) ctx)
  (emit (A64_POP r6 r7 A64_SP) ctx)

  ; Restore FP/LR registers
  (emit (A64_POP A64_FP A64_LR A64_SP) ctx)

  ; Set return value
  (emit (A64_MOV (bv 1 1) (A64_R 0) r0) ctx)

  (emit (A64_RET A64_LR) ctx)
  (void))

(define (emit_cond_jmp code i off ctx)
  (define off32 (sign-extend off (bitvector 32)))
  (define jmp_offset (bpf2a64_offset i off32 ctx))
  (check_imm19 jmp_offset)

  (define jmp_cond
    (case (BPF_OP code)
      [(BPF_JEQ) A64_COND_EQ]
      [(BPF_JGT) A64_COND_HI]
      [(BPF_JLT) A64_COND_CC]
      [(BPF_JGE) A64_COND_CS]
      [(BPF_JLE) A64_COND_LS]
      [(BPF_JSET
        BPF_JNE) A64_COND_NE]
      [(BPF_JSGT) A64_COND_GT]
      [(BPF_JSLT) A64_COND_LT]
      [(BPF_JSGE) A64_COND_GE]
      [(BPF_JSLE) A64_COND_LE]))

  (emit (A64_B_COND jmp_cond jmp_offset) ctx))

(define (build_insn i insn next-insn ctx)
  (define code (bpf:insn-code insn))
  (define dst (bpf2a64 (bpf:insn-dst insn)))
  (define src (bpf2a64 (bpf:insn-src insn)))
  (define tmp (bpf2a64 TMP_REG_1))
  (define tmp2 (bpf2a64 TMP_REG_2))
  (define tmp3 (bpf2a64 TMP_REG_3))
  (define off (bpf:insn-off insn))
  (define imm (bpf:insn-imm insn))
  (define off32 (sign-extend off (bitvector 32)))

  (define is64
    (bool->bitvector
      (|| (equal? (BPF_CLASS code) 'BPF_ALU64)
          (equal? (BPF_CLASS code) 'BPF_JMP))))
  (define isdw
    (bool->bitvector
      (equal? (BPF_SIZE code) 'BPF_DW)))

  (case code
    ; dst = src
    [((BPF_ALU BPF_MOV BPF_X)
      (BPF_ALU64 BPF_MOV BPF_X))
     (emit (A64_MOV is64 dst src) ctx)]
    ; dst = dst OP src
    [((BPF_ALU BPF_ADD BPF_X)
      (BPF_ALU64 BPF_ADD BPF_X))
     (emit (A64_ADD is64 dst dst src) ctx)]
    [((BPF_ALU BPF_SUB BPF_X)
      (BPF_ALU64 BPF_SUB BPF_X))
     (emit (A64_SUB is64 dst dst src) ctx)]
    [((BPF_ALU BPF_AND BPF_X)
      (BPF_ALU64 BPF_AND BPF_X))
     (emit (A64_AND is64 dst dst src) ctx)]
    [((BPF_ALU BPF_OR BPF_X)
      (BPF_ALU64 BPF_OR BPF_X))
     (emit (A64_ORR is64 dst dst src) ctx)]
    [((BPF_ALU BPF_XOR BPF_X)
      (BPF_ALU64 BPF_XOR BPF_X))
     (emit (A64_EOR is64 dst dst src) ctx)]
    [((BPF_ALU BPF_MUL BPF_X)
      (BPF_ALU64 BPF_MUL BPF_X))
     (emit (A64_MUL is64 dst dst src) ctx)]
    ; The original C code mixes DIV and MOD and split again.
    ; Simply split DIV and MOD to make it more explicit.
    [((BPF_ALU BPF_DIV BPF_X)
      (BPF_ALU64 BPF_DIV BPF_X))
      (emit (A64_UDIV is64 dst dst src) ctx)]
    [((BPF_ALU BPF_MOD BPF_X)
      (BPF_ALU64 BPF_MOD BPF_X))
      (emit (A64_UDIV is64 tmp dst src) ctx)
      (emit (A64_MSUB is64 dst dst tmp src) ctx)]
    [((BPF_ALU BPF_LSH BPF_X)
      (BPF_ALU64 BPF_LSH BPF_X))
      (emit (A64_LSLV is64 dst dst src) ctx)]
    [((BPF_ALU BPF_RSH BPF_X)
      (BPF_ALU64 BPF_RSH BPF_X))
      (emit (A64_LSRV is64 dst dst src) ctx)]
    [((BPF_ALU BPF_ARSH BPF_X)
      (BPF_ALU64 BPF_ARSH BPF_X))
      (emit (A64_ASRV is64 dst dst src) ctx)]
    ; dst = -dst
    [((BPF_ALU BPF_NEG)
      (BPF_ALU64 BPF_NEG))
      (emit (A64_NEG is64 dst dst) ctx)]

    ; dst = BSWAP##imm(dst)
    [((BPF_ALU BPF_END BPF_FROM_LE))
     (cond
       [(bveq imm (bv 16 32))
        (emit (A64_UXTH is64 dst dst) ctx)]
       [(bveq imm (bv 32 32))
        (emit (A64_UXTW is64 dst dst) ctx)]
       [(bveq imm (bv 64 32))
        (void)])]
    [((BPF_ALU BPF_END BPF_FROM_BE))
     (cond
       [(bveq imm (bv 16 32))
        (emit (A64_REV16 is64 dst dst) ctx)
        (emit (A64_UXTH is64 dst dst) ctx)]
       [(bveq imm (bv 32 32))
        (emit (A64_REV32 is64 dst dst) ctx)]
       [(bveq imm (bv 64 32))
        (emit (A64_REV64 dst dst) ctx)])]

    ; dst = imm
    [((BPF_ALU BPF_MOV BPF_K)
      (BPF_ALU64 BPF_MOV BPF_K))
     (emit_a64_mov_i is64 dst imm ctx)]
    ; dst = dst OP imm
    [((BPF_ALU BPF_ADD BPF_K)
      (BPF_ALU64 BPF_ADD BPF_K))
     ; PATCH
     (cond
       [(is_addsub_imm imm)
        (emit (A64_ADD_I is64 dst dst imm) ctx)]
       [(is_addsub_imm (bvneg imm))
        (emit (A64_SUB_I is64 dst dst (bvneg imm)) ctx)]
       [else
        (emit_a64_mov_i is64 tmp imm ctx)
        (emit (A64_ADD is64 dst dst tmp) ctx)])]
    [((BPF_ALU BPF_SUB BPF_K)
      (BPF_ALU64 BPF_SUB BPF_K))
     ; PATCH
     (cond
       [(is_addsub_imm imm)
        (emit (A64_SUB_I is64 dst dst imm) ctx)]
       [(is_addsub_imm (bvneg imm))
        (emit (A64_ADD_I is64 dst dst (bvneg imm)) ctx)]
       [else
        (emit_a64_mov_i is64 tmp imm ctx)
        (emit (A64_SUB is64 dst dst tmp) ctx)])]
    [((BPF_ALU BPF_AND BPF_K)
      (BPF_ALU64 BPF_AND BPF_K))
     ; PATCH
     (define a64_insn (A64_AND_I is64 dst dst imm))
     (cond
       [(! (equal? a64_insn AARCH64_BREAK_FAULT))
        (emit a64_insn ctx)]
       [else
        (emit_a64_mov_i is64 tmp imm ctx)
        (emit (A64_AND is64 dst dst tmp) ctx)])]
    [((BPF_ALU BPF_OR BPF_K)
      (BPF_ALU64 BPF_OR BPF_K))
     ; PATCH
     (define a64_insn (A64_ORR_I is64 dst dst imm))
     (cond
       [(! (equal? a64_insn AARCH64_BREAK_FAULT))
        (emit a64_insn ctx)]
       [else
        (emit_a64_mov_i is64 tmp imm ctx)
        (emit (A64_ORR is64 dst dst tmp) ctx)])]
    [((BPF_ALU BPF_XOR BPF_K)
      (BPF_ALU64 BPF_XOR BPF_K))
     ; PATCH
     (define a64_insn (A64_EOR_I is64 dst dst imm))
     (cond
       [(! (equal? a64_insn AARCH64_BREAK_FAULT))
        (emit a64_insn ctx)]
       [else
        (emit_a64_mov_i is64 tmp imm ctx)
        (emit (A64_EOR is64 dst dst tmp) ctx)])]
    [((BPF_ALU BPF_MUL BPF_K)
      (BPF_ALU64 BPF_MUL BPF_K))
     (emit_a64_mov_i is64 tmp imm ctx)
     (emit (A64_MUL is64 dst dst tmp) ctx)]
    [((BPF_ALU BPF_DIV BPF_K)
      (BPF_ALU64 BPF_DIV BPF_K))
     (emit_a64_mov_i is64 tmp imm ctx)
     (emit (A64_UDIV is64 dst dst tmp) ctx)]
    [((BPF_ALU BPF_MOD BPF_K)
      (BPF_ALU64 BPF_MOD BPF_K))
     (emit_a64_mov_i is64 tmp2 imm ctx)
     (emit (A64_UDIV is64 tmp dst tmp2) ctx)
     (emit (A64_MSUB is64 dst dst tmp tmp2) ctx)]
    [((BPF_ALU BPF_LSH BPF_K)
      (BPF_ALU64 BPF_LSH BPF_K))
     (emit (A64_LSL is64 dst dst imm) ctx)]
    [((BPF_ALU BPF_RSH BPF_K)
      (BPF_ALU64 BPF_RSH BPF_K))
     (emit (A64_LSR is64 dst dst imm) ctx)]
    [((BPF_ALU BPF_ARSH BPF_K)
      (BPF_ALU64 BPF_ARSH BPF_K))
     (emit (A64_ASR is64 dst dst imm) ctx)]

    ; JUMP off
    [((BPF_JMP BPF_JA))
     (define jmp_offset (bpf2a64_offset i off32 ctx))
     (check_imm26 jmp_offset)
     (emit (A64_B jmp_offset) ctx)]

    ; IF (dst COND src) JUMP off
    [((BPF_JMP BPF_JEQ BPF_X)
      (BPF_JMP BPF_JGT BPF_X)
      (BPF_JMP BPF_JLT BPF_X)
      (BPF_JMP BPF_JGE BPF_X)
      (BPF_JMP BPF_JLE BPF_X)
      (BPF_JMP BPF_JNE BPF_X)
      (BPF_JMP BPF_JSGT BPF_X)
      (BPF_JMP BPF_JSLT BPF_X)
      (BPF_JMP BPF_JSGE BPF_X)
      (BPF_JMP BPF_JSLE BPF_X)
      (BPF_JMP32 BPF_JEQ BPF_X)
      (BPF_JMP32 BPF_JGT BPF_X)
      (BPF_JMP32 BPF_JLT BPF_X)
      (BPF_JMP32 BPF_JGE BPF_X)
      (BPF_JMP32 BPF_JLE BPF_X)
      (BPF_JMP32 BPF_JNE BPF_X)
      (BPF_JMP32 BPF_JSGT BPF_X)
      (BPF_JMP32 BPF_JSLT BPF_X)
      (BPF_JMP32 BPF_JSGE BPF_X)
      (BPF_JMP32 BPF_JSLE BPF_X))
     (emit (A64_CMP is64 dst src) ctx)
     (emit_cond_jmp code i off ctx)]
    [((BPF_JMP BPF_JSET BPF_X)
      (BPF_JMP32 BPF_JSET BPF_X))
     (emit (A64_TST is64 dst src) ctx)
     (emit_cond_jmp code i off ctx)]

    ; IF (dst COND imm) JUMP off
    [((BPF_JMP BPF_JEQ BPF_K)
      (BPF_JMP BPF_JGT BPF_K)
      (BPF_JMP BPF_JLT BPF_K)
      (BPF_JMP BPF_JGE BPF_K)
      (BPF_JMP BPF_JLE BPF_K)
      (BPF_JMP BPF_JNE BPF_K)
      (BPF_JMP BPF_JSGT BPF_K)
      (BPF_JMP BPF_JSLT BPF_K)
      (BPF_JMP BPF_JSGE BPF_K)
      (BPF_JMP BPF_JSLE BPF_K)
      (BPF_JMP32 BPF_JEQ BPF_K)
      (BPF_JMP32 BPF_JGT BPF_K)
      (BPF_JMP32 BPF_JLT BPF_K)
      (BPF_JMP32 BPF_JGE BPF_K)
      (BPF_JMP32 BPF_JLE BPF_K)
      (BPF_JMP32 BPF_JNE BPF_K)
      (BPF_JMP32 BPF_JSGT BPF_K)
      (BPF_JMP32 BPF_JSLT BPF_K)
      (BPF_JMP32 BPF_JSGE BPF_K)
      (BPF_JMP32 BPF_JSLE BPF_K))
     ; PATCH
     (cond
       [(is_addsub_imm imm)
        (emit (A64_CMP_I is64 dst imm) ctx)]
       [(is_addsub_imm (bvneg imm))
        (emit (A64_CMN_I is64 dst (bvneg imm)) ctx)]
       [else
        (emit_a64_mov_i is64 tmp imm ctx)
        (emit (A64_CMP is64 dst tmp) ctx)])
     (emit_cond_jmp code i off ctx)]
    [((BPF_JMP BPF_JSET BPF_K)
      (BPF_JMP32 BPF_JSET BPF_K))
     ; PATCH
     (define a64_insn (A64_TST_I is64 dst imm))
     (cond
       [(! (equal? a64_insn AARCH64_BREAK_FAULT))
        (emit a64_insn ctx)]
       [else
        (emit_a64_mov_i is64 tmp imm ctx)
        (emit (A64_TST is64 dst tmp) ctx)])
     (emit_cond_jmp code i off ctx)]
    [((BPF_JMP BPF_CALL))
      (define r0 (bpf2a64 BPF_REG_0))

      (define &addr (box (void)))
      (define &fixed (box (void)))
      (bpf_jit_get_func_addr ctx insn &addr &fixed)

      (emit_addr_mov_i64 tmp (unbox &addr) ctx)
      (emit (A64_BLR tmp) ctx)
      (emit (A64_MOV (bv 1 1) r0 (A64_R 0)) ctx)]
    [((BPF_JMP BPF_EXIT))
      (cond
        [(equal? i (bvsub1 (context-program-length ctx)))
          ; Break
          (void)]
        [else
          (define jmp_offset (epilogue_offset ctx))
          (check_imm26 jmp_offset)
          (emit (A64_B jmp_offset) ctx)])]
    [((BPF_LD BPF_IMM BPF_DW))
      (define next-imm (bpf:insn-imm next-insn))
      (define imm64
        (bvor (bvshl (zero-extend next-imm (bitvector 64)) (bv 32 64))
              (zero-extend imm (bitvector 64))))
      (emit_a64_mov_i64 dst imm64 ctx)]

    ; LDX: dst = *(size *)(src + off)
    [((BPF_LDX BPF_MEM BPF_W)
      (BPF_LDX BPF_MEM BPF_H)
      (BPF_LDX BPF_MEM BPF_B)
      (BPF_LDX BPF_MEM BPF_DW))
     (emit_a64_mov_i (bv #b1 1) tmp off32 ctx)
     (case (BPF_SIZE code)
       [(BPF_W)  (emit (A64_LDR32 dst src tmp) ctx)]
       [(BPF_H)  (emit (A64_LDRH dst src tmp) ctx)]
       [(BPF_B)  (emit (A64_LDRB dst src tmp) ctx)]
       [(BPF_DW) (emit (A64_LDR64 dst src tmp) ctx)])]

    ; ST: *(size *)(dst + off) = imm
    [((BPF_ST BPF_MEM BPF_W)
      (BPF_ST BPF_MEM BPF_H)
      (BPF_ST BPF_MEM BPF_B)
      (BPF_ST BPF_MEM BPF_DW))
     ; Load imm to a register then store it */
     (emit_a64_mov_i (bv #b1 1) tmp2 off32 ctx)
     (emit_a64_mov_i (bv #b1 1) tmp imm ctx)
     (case (BPF_SIZE code)
       [(BPF_W)  (emit (A64_STR32 tmp dst tmp2) ctx)]
       [(BPF_H)  (emit (A64_STRH tmp dst tmp2) ctx)]
       [(BPF_B)  (emit (A64_STRB tmp dst tmp2) ctx)]
       [(BPF_DW) (emit (A64_STR64 tmp dst tmp2) ctx)])]

    ; STX: *(size *)(dst + off) = src
    [((BPF_STX BPF_MEM BPF_W)
      (BPF_STX BPF_MEM BPF_H)
      (BPF_STX BPF_MEM BPF_B)
      (BPF_STX BPF_MEM BPF_DW))
     (emit_a64_mov_i (bv #b1 1) tmp off32 ctx)
     (case (BPF_SIZE code)
       [(BPF_W)  (emit (A64_STR32 src dst tmp) ctx)]
       [(BPF_H)  (emit (A64_STRH src dst tmp) ctx)]
       [(BPF_B)  (emit (A64_STRB src dst tmp) ctx)]
       [(BPF_DW) (emit (A64_STR64 src dst tmp) ctx)])]

    ; STX XADD: lock *(u32 *)(dst + off) += src
    [((BPF_STX BPF_XADD BPF_W)
      ;STX XADD: lock *(u64 *)(dst + off) += src
      (BPF_STX BPF_XADD BPF_DW))
     (define reg
       (cond
         [(bvzero? off) dst]
         [else
          (emit_a64_mov_i (bv #b1 1) tmp off32 ctx)
          (emit (A64_ADD (bv #b1 1) tmp tmp dst) ctx)
          tmp]))
     (emit (A64_STADD isdw reg src) ctx)]

    [else (assert #f (format "Unrecognized code: ~v" code))])

  (context-insns ctx))
