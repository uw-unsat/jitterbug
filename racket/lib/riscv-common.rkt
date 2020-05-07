#lang rosette

; This file is translated and adapted from arch/riscv/net/bpf_jit.h,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0
;
; Common functionality for RV32 and RV64 BPF JIT compilers
;
; Copyright (c) 2019 Björn Töpel <bjorn.topel@gmail.com>

(require (prefix-in riscv: serval/riscv/interp))
(require serval/lib/debug)
(require "bpf-common.rkt")

(provide (all-defined-out))

(define STACK_ALIGN 16)

(define RV_REG_ZERO 'zero)
(define RV_REG_RA 'ra)
(define RV_REG_SP 'sp)
(define RV_REG_GP 'gp)
(define RV_REG_TP 'tp)
(define RV_REG_T0 't0)
(define RV_REG_T1 't1)
(define RV_REG_T2 't2)
(define RV_REG_FP 'fp)
(define RV_REG_S1 's1)
(define RV_REG_A0 'a0)
(define RV_REG_A1 'a1)
(define RV_REG_A2 'a2)
(define RV_REG_A3 'a3)
(define RV_REG_A4 'a4)
(define RV_REG_A5 'a5)
(define RV_REG_A6 'a6)
(define RV_REG_A7 'a7)
(define RV_REG_S2 's2)
(define RV_REG_S3 's3)
(define RV_REG_S4 's4)
(define RV_REG_S5 's5)
(define RV_REG_S6 's6)
(define RV_REG_S7 's7)
(define RV_REG_S8 's8)
(define RV_REG_S9 's9)
(define RV_REG_S10 's10)
(define RV_REG_S11 's11)
(define RV_REG_T3 't3)
(define RV_REG_T4 't4)
(define RV_REG_T5 't5)
(define RV_REG_T6 't6)

(struct context (program-length insns insns-addr ninsns epilogue-offset stack_size offset flags
                 saved-regs aux) #:mutable #:transparent)

(define (->prog->aux->verifier_zext ctx)
  (bpf-prog-aux-verifier_zext (context-aux ctx)))

(define (->prog->aux->stack_depth ctx)
  (bpf-prog-aux-stack_depth (context-aux ctx)))

(define ->stack_size context-stack_size)

(define (emit insn ctx)
  (for/all ([insns (context-insns ctx) #:exhaustive])
    (set-context-insns! ctx (vector-append insns (vector insn))))
  (set-context-ninsns! ctx (bvadd (bv 1 32) (context-ninsns ctx))))

(define (epilogue_offset ctx)
  (define to (context-epilogue-offset ctx))
  (define from (context-ninsns ctx))
  (bvshl (bvsub to from) (bv 2 (type-of to))))

(define (invert_bpf_cond cond_)
  (case cond_
    [(BPF_JEQ) 'BPF_JNE]
    [(BPF_JGT) 'BPF_JLE]
    [(BPF_JLT) 'BPF_JGE]
    [(BPF_JGE) 'BPF_JLT]
    [(BPF_JLE) 'BPF_JGT]
    [(BPF_JNE) 'BPF_JEQ]
    [(BPF_JSGT) 'BPF_JSLE]
    [(BPF_JSLT) 'BPF_JSGE]
    [(BPF_JSGE) 'BPF_JSLT]
    [(BPF_JSLE) 'BPF_JSGT]
    [else (bug #:msg "invert_bpf_cond_")]))

(define (is_12b_int imm)
  (&& (bvsle (bv (- #x800) 32) imm) (bvslt imm (bv #x800 32))))

(define (is_13b_int imm)
  (&& (bvsle (bv (- #x1000) 32) imm) (bvslt imm (bv #x1000 32))))

(define (is_21b_int imm [size 32])
  (&& (bvsle (bv (- #x100000) size) imm) (bvslt imm (bv #x100000 size))))

(define (rv_offset insn off ctx)
  (define offset (context-offset ctx))
  (set! off (bvadd off (bv 1 32)))
  (define from
    (if (bvsgt insn (bv 0 32))
        (offset (bvsub insn (bv 1 32)))
        (bv 0 32)))

  (define to
    (if (bvsge (bvadd insn off) (bv 0 32))
        (offset (bvsub (bvadd insn off) (bv 1 32)))
        (bv 0 32)))

  (bvshl (bvsub to from) (bv 2 32)))

(define (make-immediate x size)
  (cond
    [(and (integer? x) (! (term? x))) (bv x size)]
    [(bv? x) (extract (- size 1) 0 x)]
    [else (bug #:msg (format "make-immediate: bad immediate ~v" x))]))

(define (rv_auipc rd imm)
  (riscv:rv_u_insn 'auipc rd (make-immediate imm 20)))

(define (rv_jalr rd rs1 imm)
  (riscv:rv_i_insn 'jalr rd rs1 (make-immediate imm 12)))

(define (rv_bne rs1 rs2 offset)
  (riscv:rv_s_insn 'bne rs1 rs2 (make-immediate offset 12)))

(define (rv_beq rs1 rs2 offset)
  (riscv:rv_s_insn 'beq rs1 rs2 (make-immediate offset 12)))

(define (rv_blt rs1 rs2 offset)
  (riscv:rv_s_insn 'blt rs1 rs2 (make-immediate offset 12)))

(define (rv_bgt rs1 rs2 offset)
  (riscv:rv_s_insn 'blt rs2 rs1 (make-immediate offset 12)))

(define (rv_bltu rs1 rs2 offset)
  (riscv:rv_s_insn 'bltu rs1 rs2 (make-immediate offset 12)))

(define (rv_bgtu rs1 rs2 offset)
  (riscv:rv_s_insn 'bltu rs2 rs1 (make-immediate offset 12)))

(define (rv_bgeu rs1 rs2 offset)
  (riscv:rv_s_insn 'bgeu rs1 rs2 (make-immediate offset 12)))

(define (rv_bleu rs1 rs2 offset)
  (riscv:rv_s_insn 'bgeu rs2 rs1 (make-immediate offset 12)))

(define (rv_bge rs1 rs2 offset)
  (riscv:rv_s_insn 'bge rs1 rs2 (make-immediate offset 12)))

(define (rv_ble rs1 rs2 offset)
  (riscv:rv_s_insn 'bge rs2 rs1 (make-immediate offset 12)))

(define (rv_jal dst offset)
  (riscv:rv_u_insn 'jal dst (make-immediate offset 20)))

(define (rv_addiw rd rs1 imm11_0)
  (riscv:rv_i_insn 'addiw rd rs1 (make-immediate imm11_0 12)))

(define (rv_addi rd rs1 imm11_0)
  (riscv:rv_i_insn 'addi rd rs1 (make-immediate imm11_0 12)))

(define (rv_mv rd rs1)
  (rv_addi rd rs1 0))

(define (rv_sltu rd rs1 rs2)
  (riscv:rv_r_insn 'sltu rd rs1 rs2))

(define (rv_addw rd rs1 rs2)
  (riscv:rv_r_insn 'addw rd rs1 rs2))

(define (rv_add rd rs1 rs2)
  (riscv:rv_r_insn 'add rd rs1 rs2))

(define (rv_subw rd rs1 rs2)
  (riscv:rv_r_insn 'subw rd rs1 rs2))

(define (rv_sub rd rs1 rs2)
  (riscv:rv_r_insn 'sub rd rs1 rs2))

(define (rv_and rd rs1 rs2)
  (riscv:rv_r_insn 'and rd rs1 rs2))

(define (rv_or rd rs1 rs2)
  (riscv:rv_r_insn 'or rd rs1 rs2))

(define (rv_xor rd rs1 rs2)
  (riscv:rv_r_insn 'xor rd rs1 rs2))

(define (rv_mulw rd rs1 rs2)
  (riscv:rv_r_insn 'mulw rd rs1 rs2))

(define (rv_mulhu rd rs1 rs2)
  (riscv:rv_r_insn 'mulhu rd rs1 rs2))

(define (rv_mul rd rs1 rs2)
  (riscv:rv_r_insn 'mul rd rs1 rs2))

(define (rv_divuw rd rs1 rs2)
  (riscv:rv_r_insn 'divuw rd rs1 rs2))

(define (rv_divu rd rs1 rs2)
  (riscv:rv_r_insn 'divu rd rs1 rs2))

(define (rv_remuw rd rs1 rs2)
  (riscv:rv_r_insn 'remuw rd rs1 rs2))

(define (rv_remu rd rs1 rs2)
  (riscv:rv_r_insn 'remu rd rs1 rs2))

(define (rv_sllw rd rs1 rs2)
  (riscv:rv_r_insn 'sllw rd rs1 rs2))

(define (rv_sll rd rs1 rs2)
  (riscv:rv_r_insn 'sll rd rs1 rs2))

(define (rv_srlw rd rs1 rs2)
  (riscv:rv_r_insn 'srlw rd rs1 rs2))

(define (rv_srl rd rs1 rs2)
  (riscv:rv_r_insn 'srl rd rs1 rs2))

(define (rv_sraw rd rs1 rs2)
  (riscv:rv_r_insn 'sraw rd rs1 rs2))

(define (rv_sra rd rs1 rs2)
  (riscv:rv_r_insn 'sra rd rs1 rs2))

(define (rv_lui rd imm31_12)
  (riscv:rv_u_insn 'lui rd (make-immediate imm31_12 20)))

(define (rv_slli rd rs1 imm11_0)
  (riscv:rv_i_insn 'slli rd rs1 (make-immediate imm11_0 12)))

(define (rv_andi rd rs1 imm11_0)
  (riscv:rv_i_insn 'andi rd rs1 (make-immediate imm11_0 12)))

(define (rv_ori rd rs1 imm11_0)
  (riscv:rv_i_insn 'ori rd rs1 (make-immediate imm11_0 12)))

(define (rv_xori rd rs1 imm11_0)
  (riscv:rv_i_insn 'xori rd rs1 (make-immediate imm11_0 12)))

(define (rv_slliw rd rs1 imm11_0)
  (riscv:rv_i_insn 'slliw rd rs1 (make-immediate imm11_0 12)))

(define (rv_srliw rd rs1 imm11_0)
  (riscv:rv_i_insn 'srliw rd rs1 (make-immediate imm11_0 12)))

(define (rv_srli rd rs1 imm11_0)
  (riscv:rv_i_insn 'srli rd rs1 (make-immediate imm11_0 12)))

(define (rv_sraiw rd rs1 imm11_0)
  (riscv:rv_i_insn 'sraiw rd rs1 (make-immediate imm11_0 12)))

(define (rv_srai rd rs1 imm11_0)
  (riscv:rv_i_insn 'srai rd rs1 (make-immediate imm11_0 12)))

(define (rv_sb rs1 imm11_0 rs2)
  (riscv:rv_s_insn 'sb rs1 rs2 (make-immediate imm11_0 12)))

(define (rv_sh rs1 imm11_0 rs2)
  (riscv:rv_s_insn 'sh rs1 rs2 (make-immediate imm11_0 12)))

(define (rv_sw rs1 imm11_0 rs2)
  (riscv:rv_s_insn 'sw rs1 rs2 (make-immediate imm11_0 12)))

(define (rv_sd rs1 imm11_0 rs2)
  (riscv:rv_s_insn 'sd rs1 rs2 (make-immediate imm11_0 12)))

(define (rv_lbu rd imm11_0 rs1)
  (riscv:rv_i_insn 'lbu rd rs1 (make-immediate imm11_0 12)))

(define (rv_lhu rd imm11_0 rs1)
  (riscv:rv_i_insn 'lhu rd rs1 (make-immediate imm11_0 12)))

(define (rv_lw rd imm11_0 rs1)
  (riscv:rv_i_insn 'lw rd rs1 (make-immediate imm11_0 12)))

(define (rv_lwu rd imm11_0 rs1)
  (riscv:rv_i_insn 'lwu rd rs1 (make-immediate imm11_0 12)))

(define (rv_ld rd imm11_0 rs1)
  (riscv:rv_i_insn 'ld rd rs1 (make-immediate imm11_0 12)))

(define (rv_amoadd_w rd rs2 rs1 aq rl)
  (riscv:rv_amo_insn 'amoadd.w rd rs1 rs2 (make-immediate aq 1) (make-immediate rl 1)))

(define (rv_amoadd_d rd rs2 rs1 aq rl)
  (riscv:rv_amo_insn 'amoadd.d rd rs1 rs2 (make-immediate aq 1) (make-immediate rl 1)))
