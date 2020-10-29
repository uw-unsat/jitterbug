#lang rosette

; This file is translated and adapted from arch/riscv/net/bpf_jit.h,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0
;
; Common functionality for RV32 and RV64 BPF JIT compilers
;
; Copyright (c) 2019 Björn Töpel <bjorn.topel@gmail.com>

(require
  (prefix-in riscv: serval/riscv/interp)
  serval/lib/debug
  serval/lib/bvarith
  "../lib/bpf-common.rkt")

(provide (all-defined-out))

(define-symbolic _CONFIG_RISCV_ISA_C boolean?)
(define CONFIG_RISCV_ISA_C (make-parameter _CONFIG_RISCV_ISA_C))

; Whether to allow riscv compressed instructions.
(define (rvc_enabled)
  (CONFIG_RISCV_ISA_C))

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

(struct context (program-length insns insns-addr ninsns epilogue-offset stack_size offset flags aux) #:mutable #:transparent)

(define (ninsns_rvoff ninsns)
  (bvshl ninsns (bv 1 32)))

(define (->prog->aux->verifier_zext ctx)
  (bpf-prog-aux-verifier_zext (context-aux ctx)))

(define (->prog->aux->stack_depth ctx)
  (bpf-prog-aux-stack_depth (context-aux ctx)))

(define ->stack_size context-stack_size)

; Emit a 4-byte instruction
(define (emit insn ctx)
  (assert (= (riscv:instruction-size insn) 4))
  (define unimp (riscv:c.unimp))
  (for/all ([insns (context-insns ctx) #:exhaustive])
    (set-context-insns! ctx (vector-append insns (vector insn unimp))))
  (set-context-ninsns! ctx (bvadd (bv 2 32) (context-ninsns ctx))))

; Emit a compressed instruction
(define (emitc insn ctx)
  (bug-on (! (rvc_enabled))
          #:msg "Cannot use rvc instructions when !(rvc_enabled)"
          #:dbg 'emitc)
  (assert (= (riscv:instruction-size insn) 2))
  (for/all ([insns (context-insns ctx) #:exhaustive])
    (set-context-insns! ctx (vector-append insns (vector insn))))
  (set-context-ninsns! ctx (bvadd (bv 1 32) (context-ninsns ctx))))

(define (epilogue_offset ctx)
  (define to (context-epilogue-offset ctx))
  (define from (context-ninsns ctx))
  (ninsns_rvoff (bvsub to from)))

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

(define (is_6b_int imm)
  (&& (bvsle (bv (- #x20) 32) imm) (bvslt imm (bv #x20 32))))

(define (is_7b_uint imm)
  (bvult imm (bv #x80 32)))

(define (is_8b_uint imm)
  (bvult imm (bv #x100 32)))

(define (is_9b_int imm)
  (&& (bvsle (bv (- #x100) 32) imm) (bvslt imm (bv #x100 32))))

(define (is_9b_uint imm)
  (bvult imm (bv #x200 32)))

(define (is_10b_int imm)
  (&& (bvsle (bv (- #x200) 32) imm) (bvslt imm (bv #x200 32))))

(define (is_10b_uint imm)
  (bvult imm (bv #x400 32)))

(define (is_12b_int imm)
  (&& (bvsle (bv (- #x800) 32) imm) (bvslt imm (bv #x800 32))))

(define (is_13b_int imm)
  (&& (bvsle (bv (- #x1000) 32) imm) (bvslt imm (bv #x1000 32))))

(define (is_21b_int imm [size 32])
  (&& (bvsle (bv (- #x100000) size) imm) (bvslt imm (bv #x100000 size))))

; RVC helpers

(define (zreg? reg)
  (for/all ([reg reg #:exhaustive])
    (case reg
      [(x0 zero) #t]
      [else #f])))

(define (x1reg? reg)
  (for/all ([reg reg #:exhaustive])
    (case reg
      [(x1 ra) #t]
      [else #f])))

(define (x2reg? reg)
  (for/all ([reg reg #:exhaustive])
    (case reg
      [(x2 sp) #t]
      [else #f])))

(define (emit_jalr rd rs imm ctx)
  (cond
    [(&& (rvc_enabled) (x1reg? rd) (! (zreg? rs)) (bvzero? imm))
      (emitc (rvc_jalr rs) ctx)]
    [(&& (rvc_enabled) (zreg? rd) (! (zreg? rs)) (bvzero? imm))
      (emitc (rvc_jr rs) ctx)]
    [else
      (emit (rv_jalr rd rs imm) ctx)]))

(define (emit_mv rd rs ctx)
  (cond
    [(&& (rvc_enabled) (! (zreg? rd)) (! (zreg? rs)))
      (emitc (rvc_mv rd rs) ctx)]
    [else
      (emit (rv_addi rd rs 0) ctx)]))

(define (emit_add rd rs1 rs2 ctx)
  (cond
    [(&& (rvc_enabled) (! (zreg? rd)) (equal? rd rs1) (! (zreg? rs2)))
      (emitc (rvc_add rd rs2) ctx)]
    [else
      (emit (rv_add rd rs1 rs2) ctx)]))

(define (emit_addi rd rs imm ctx)
  (cond
    [(&& (rvc_enabled) (x2reg? rd) (equal? rd rs) (is_10b_int imm) (! (bvzero? imm)) (bvzero? (bvand imm (bv #xf 32))))
      (emitc (rvc_addi16sp imm) ctx)]
    [(&& (rvc_enabled) (is_creg rd) (x2reg? rs) (is_10b_uint imm) (bvzero? (bvand imm (bv #x3 32))) (! (bvzero? imm)))
      (emitc (rvc_addi4spn rd imm) ctx)]
    [(&& (rvc_enabled) (! (zreg? rd)) (equal? rd rs) (! (bvzero? imm)) (is_6b_int imm))
      (emitc (rvc_addi rd imm) ctx)]
    [else
      (emit (rv_addi rd rs imm) ctx)]))

(define (emit_li rd imm ctx)
  (cond
    [(&& (rvc_enabled) (! (zreg? rd)) (is_6b_int imm))
      (emitc (rvc_li rd imm) ctx)]
    [else
      (emit (rv_addi rd RV_REG_ZERO imm) ctx)]))

(define (emit_lui rd imm ctx)
  (cond
    [(&& (rvc_enabled) (! (zreg? rd)) (! (x2reg? rd)) (is_6b_int imm) (! (bvzero? imm)))
      (emitc (rvc_lui rd imm) ctx)]
    [else
      (emit (rv_lui rd imm) ctx)]))

(define (emit_slli rd rs imm ctx)
  (cond
    [(&& (rvc_enabled) (! (zreg? rd)) (equal? rd rs) (! (bvzero? imm)) (bvult imm (bv (riscv:XLEN) 32)))
      (emitc (rvc_slli rd imm) ctx)]
    [else
      (emit (rv_slli rd rs imm) ctx)]))

(define (emit_andi rd rs imm ctx)
  (cond
    [(&& (rvc_enabled) (is_creg rd) (equal? rd rs) (is_6b_int imm))
      (emitc (rvc_andi rd imm) ctx)]
    [else
      (emit (rv_andi rd rs imm) ctx)]))

(define (emit_srli rd rs imm ctx)
  (cond
    [(&& (rvc_enabled) (is_creg rd) (equal? rd rs) (! (bvzero? imm)) (bvult imm (bv (riscv:XLEN) 32)))
      (emitc (rvc_srli rd imm) ctx)]
    [else
      (emit (rv_srli rd rs imm) ctx)]))

(define (emit_srai rd rs imm ctx)
  (cond
    [(&& (rvc_enabled) (is_creg rd) (equal? rd rs) (! (bvzero? imm)) (bvult imm (bv (riscv:XLEN) 32)))
      (emitc (rvc_srai rd imm) ctx)]
    [else
      (emit (rv_srai rd rs imm) ctx)]))

(define (emit_sub rd rs1 rs2 ctx)
  (cond
    [(&& (rvc_enabled) (is_creg rd) (equal? rd rs1) (is_creg rs2))
      (emitc (rvc_sub rd rs2) ctx)]
    [else
      (emit (rv_sub rd rs1 rs2) ctx)]))

(define (emit_or rd rs1 rs2 ctx)
  (cond
    [(&& (rvc_enabled) (is_creg rd) (equal? rd rs1) (is_creg rs2))
      (emitc (rvc_or rd rs2) ctx)]
    [else
      (emit (rv_or rd rs1 rs2) ctx)]))

(define (emit_and rd rs1 rs2 ctx)
  (cond
    [(&& (rvc_enabled) (is_creg rd) (equal? rd rs1) (is_creg rs2))
      (emitc (rvc_and rd rs2) ctx)]
    [else
      (emit (rv_and rd rs1 rs2) ctx)]))

(define (emit_xor rd rs1 rs2 ctx)
  (cond
    [(&& (rvc_enabled) (is_creg rd) (equal? rd rs1) (is_creg rs2))
      (emitc (rvc_xor rd rs2) ctx)]
    [else
      (emit (rv_xor rd rs1 rs2) ctx)]))

(define (emit_lw rd off rs1 ctx)
  (cond
    [(&& (rvc_enabled) (x2reg? rs1) (! (zreg? rd)) (is_8b_uint off) (bvzero? (bvand off (bv #x3 32))))
      (emitc (rvc_lwsp rd off) ctx)]
    [(&& (rvc_enabled) (is_creg rd) (is_creg rs1) (is_7b_uint off) (bvzero? (bvand off (bv #x3 32))))
      (emitc (rvc_lw rd off rs1) ctx)]
    [else
      (emit (rv_lw rd off rs1) ctx)]))

(define (emit_sw rs1 off rs2 ctx)
  (cond
    [(&& (rvc_enabled) (x2reg? rs1) (is_8b_uint off) (bvzero? (bvand off (bv #x3 32))))
      (emitc (rvc_swsp off rs2) ctx)]
    [(&& (rvc_enabled) (is_creg rs1) (is_creg rs2) (is_7b_uint off) (bvzero? (bvand off (bv #x3 32))))
      (emitc (rvc_sw rs1 off rs2) ctx)]
    [else
      (emit (rv_sw rs1 off rs2) ctx)]))

; RV64-only helper functions.

(define (emit_addiw rd rs imm ctx)
  (cond
    [(&& (rvc_enabled) (! (zreg? rd)) (equal? rd rs) (is_6b_int imm))
      (emitc (rvc_addiw rd imm) ctx)]
    [else
      (emit (rv_addiw rd rs imm) ctx)]))

(define (emit_ld rd off rs1 ctx)
  (cond
    [(&& (rvc_enabled) (x2reg? rs1) (! (zreg? rd)) (is_9b_uint off) (bvzero? (bvand off (bv #x7 32))))
      (emitc (rvc_ldsp rd off) ctx)]
    [(&& (rvc_enabled) (is_creg rd) (is_creg rs1) (is_8b_uint off) (bvzero? (bvand off (bv #x7 32))))
      (emitc (rvc_ld rd off rs1) ctx)]
    [else
      (emit (rv_ld rd off rs1) ctx)]))

(define (emit_sd rs1 off rs2 ctx)
  (cond
    [(&& (rvc_enabled) (x2reg? rs1) (is_9b_uint off) (bvzero? (bvand off (bv #x7 32))))
      (emitc (rvc_sdsp off rs2) ctx)]
    [(&& (rvc_enabled) (is_creg rs1) (is_creg rs2) (is_8b_uint off) (bvzero? (bvand off (bv #x7 32))))
      (emitc (rvc_sd rs1 off rs2) ctx)]
    [else
      (emit (rv_sd rs1 off rs2) ctx)]))

(define (emit_subw rd rs1 rs2 ctx)
  (if (&& (rvc_enabled) (is_creg rd) (equal? rd rs1) (is_creg rs2))
    (emitc (rvc_subw rd rs2) ctx)
    (emit (rv_subw rd rs1 rs2) ctx)))

(define (emit_beq rs1 rs2 off ctx)
  (cond
    [(&& (rvc_enabled) (zreg? rs2) (is_9b_int off))
      (emitc (rvc_beqz rs1 off) ctx)]
    [else
      (emit (rv_beq rs1 rs2 off) ctx)]))

(define (emit_bne rs1 rs2 off ctx)
  (cond
    [(&& (rvc_enabled) (zreg? rs2) (is_9b_int off))
      (emitc (rvc_bnez rs1 off) ctx)]
    [else
      (emit (rv_bne rs1 rs2 off) ctx)]))

; uses ctx->offset with a particular idx,
; but generates assertions that the idx is in-bounds.
(define (offset-array-deref ctx idx)
  (define offset (context-offset ctx))
  (define len (context-program-length ctx))
  (assert (bvuge idx (bv 0 32)))
  (assert (bvult idx len))
  (offset idx))

(define (rv_offset insn off ctx)
  (set! off (bvadd off (bv 1 32)))
  (define from
    (if (bvsgt insn (bv 0 32))
        (offset-array-deref ctx (bvsub insn (bv 1 32)))
        (bv 0 32)))

  (define to
    (if (bvsge (bvadd insn off) (bv 0 32))
        (offset-array-deref ctx (bvsub (bvadd insn off) (bv 1 32)))
        (bv 0 32)))

  (ninsns_rvoff (bvsub to from)))

(define (make-immediate x size)
  (cond
    [(and (integer? x) (! (term? x))) (bv x size)]
    [(bv? x) (trunc size x)]
    [else (bug #:msg (format "make-immediate: bad immediate ~v" x))]))

; Pseudo-instructions

(define (rv_bgt rs1 rs2 off) (rv_blt rs2 rs1 off))
(define (rv_bgtu rs1 rs2 off) (rv_bltu rs2 rs1 off))
(define (rv_ble rs1 rs2 off) (rv_bge rs2 rs1 off))
(define (rv_bleu rs1 rs2 off) (rv_bgeu rs2 rs1 off))

(define (rv_mv rd rs1)
  (rv_addi rd rs1 0))

(define (rv_li rd imm)
  (rv_addi rd RV_REG_ZERO imm))

; Encodings to Serval's riscv format.

(define (rv_auipc rd imm)
  (riscv:auipc (make-immediate imm 20) (riscv:encode-gpr rd)))

(define (rv_lui rd imm31_12)
  (riscv:lui (make-immediate imm31_12 20) (riscv:encode-gpr rd)))

(define (rv_jalr rd rs1 imm)
  (riscv:jalr (make-immediate imm 12) (riscv:encode-gpr rs1) (riscv:encode-gpr rd)))

(define ((make-branch ctor) rs1 rs2 offset)
  (define imm (make-immediate offset 12))
  (define imm12&10:5 (concat (extract 11 11 imm)
                             (extract 9 4 imm)))
  (define imm4:1&11 (concat (extract 3 0 imm)
                            (extract 10 10 imm)))
  (ctor imm12&10:5 (riscv:encode-gpr rs2) (riscv:encode-gpr rs1) imm4:1&11))

(define rv_beq (make-branch riscv:beq))
(define rv_bne (make-branch riscv:bne))
(define rv_blt (make-branch riscv:blt))
(define rv_bltu (make-branch riscv:bltu))
(define rv_bgeu (make-branch riscv:bgeu))
(define rv_bge (make-branch riscv:bge))

(define (rv_jal dst offset)
  (define imm (make-immediate offset 20))
  (define imm20&10:1&11&19:12
    (concat (extract 19 19 imm)
            (extract 9 0 imm)
            (extract 10 10 imm)
            (extract 18 11 imm)))
  (riscv:jal imm20&10:1&11&19:12 (riscv:encode-gpr dst)))

(define ((make-r-insn ctor) rd rs1 rs2)
  (ctor (riscv:encode-gpr rs2) (riscv:encode-gpr rs1) (riscv:encode-gpr rd)))

(define rv_slt (make-r-insn riscv:slt))
(define rv_sltu (make-r-insn riscv:sltu))
(define rv_addw (make-r-insn riscv:addw))
(define rv_add (make-r-insn riscv:add))
(define rv_subw (make-r-insn riscv:subw))
(define rv_sub (make-r-insn riscv:sub))
(define rv_and (make-r-insn riscv:and_))
(define rv_or (make-r-insn riscv:or_))
(define rv_xor (make-r-insn riscv:xor))
(define rv_mulw (make-r-insn riscv:mulw))
(define rv_mulhu (make-r-insn riscv:mulhu))
(define rv_mul (make-r-insn riscv:mul))
(define rv_divuw (make-r-insn riscv:divuw))
(define rv_divu (make-r-insn riscv:divu))
(define rv_remuw (make-r-insn riscv:remuw))
(define rv_remu (make-r-insn riscv:remu))
(define rv_sllw (make-r-insn riscv:sllw))
(define rv_sll (make-r-insn riscv:sll))
(define rv_srlw (make-r-insn riscv:srlw))
(define rv_srl (make-r-insn riscv:srl))
(define rv_sraw (make-r-insn riscv:sraw))
(define rv_sra (make-r-insn riscv:sra))

(define ((make-i-insn ctor) rd rs1 imm)
  (define imm11:0 (make-immediate imm 12))
  (ctor imm11:0 (riscv:encode-gpr rs1) (riscv:encode-gpr rd)))

(define rv_addi (make-i-insn riscv:addi))
(define rv_addiw (make-i-insn riscv:addiw))
(define rv_andi (make-i-insn riscv:andi))
(define rv_ori (make-i-insn riscv:ori))
(define rv_xori (make-i-insn riscv:xori))

(define ((make-i-shift6-insn ctor) rd rs1 imm)
  (define shamt6 (make-immediate imm 6))
  (ctor shamt6 (riscv:encode-gpr rs1) (riscv:encode-gpr rd)))

(define rv_slli (make-i-shift6-insn riscv:slli))
(define rv_srli (make-i-shift6-insn riscv:srli))
(define rv_srai (make-i-shift6-insn riscv:srai))

(define ((make-i-shift5-insn ctor) rd rs1 imm)
  (define shamt5 (make-immediate imm 5))
  (ctor shamt5 (riscv:encode-gpr rs1) (riscv:encode-gpr rd)))

(define rv_slliw (make-i-shift5-insn riscv:slliw))
(define rv_srliw (make-i-shift5-insn riscv:srliw))
(define rv_sraiw (make-i-shift5-insn riscv:sraiw))

(define ((make-store-insn ctor) rs1 off rs2)
  (define imm (make-immediate off 12))
  (define imm11:5 (extract 11 5 imm))
  (define imm4:0 (extract 4 0 imm))
  (ctor imm11:5 (riscv:encode-gpr rs2) (riscv:encode-gpr rs1) imm4:0))

(define rv_sb (make-store-insn riscv:sb))
(define rv_sh (make-store-insn riscv:sh))
(define rv_sw (make-store-insn riscv:sw))
(define rv_sd (make-store-insn riscv:sd))

(define ((make-load-insn ctor) rd imm rs1)
  (define imm11:0 (make-immediate imm 12))
  (ctor imm11:0 (riscv:encode-gpr rs1) (riscv:encode-gpr rd)))

(define rv_lbu (make-load-insn riscv:lbu))
(define rv_lhu (make-load-insn riscv:lhu))
(define rv_lwu (make-load-insn riscv:lwu))
(define rv_lw (make-load-insn riscv:lw))
(define rv_ld (make-load-insn riscv:ld))

(define (rv_amoadd_w rd rs2 rs1 aq rl)
  (riscv:amoadd.w (make-immediate aq 1)
                  (make-immediate rl 1)
                  (riscv:encode-gpr rs2)
                  (riscv:encode-gpr rs1)
                  (riscv:encode-gpr rd)))

(define (rv_amoadd_d rd rs2 rs1 aq rl)
  (riscv:amoadd.d (make-immediate aq 1)
                  (make-immediate rl 1)
                  (riscv:encode-gpr rs2)
                  (riscv:encode-gpr rs1)
                  (riscv:encode-gpr rd)))

(define (is_creg reg)
  (for/all ([reg reg #:exhaustive])
    (case reg
      [(s0 s1 a0 a1 a2 a3 a4 a5 fp x8 x9 x10 x11 x12 x13 x14 x15) #t]
      [else #f])))

(define ((make-cb-insn ctor) rs1/rd imm)
  (set! imm (make-immediate imm 6))
  (define imm5 (extract 5 5 imm))
  (define imm4:0 (extract 4 0 imm))
  (ctor imm5 (riscv:encode-compressed-gpr rs1/rd) imm4:0))

(define rvc_andi (make-cb-insn riscv:c.andi))
(define rvc_srai (make-cb-insn riscv:c.srai))
(define rvc_srli (make-cb-insn riscv:c.srli))

(define ((make-ci-insn ctor) rs1/rd imm)
  (set! imm (make-immediate imm 6))
  (define imm5 (extract 5 5 imm))
  (define imm4:0 (extract 4 0 imm))
  (ctor imm5 (riscv:encode-gpr rs1/rd) imm4:0))

(define rvc_addiw (make-ci-insn riscv:c.addiw))
(define rvc_addi (make-ci-insn riscv:c.addi))
(define rvc_li (make-ci-insn riscv:c.li))
(define rvc_lui (make-ci-insn riscv:c.lui))
(define rvc_slli (make-ci-insn riscv:c.slli))

(define (rvc_addi16sp imm)
  (set! imm (make-immediate imm 10))
  (define nzimm9 (extract 9 9 imm))
  (define nzimm4&6&8:7&5
    (concat (extract 4 4 imm)
            (extract 6 6 imm)
            (extract 8 7 imm)
            (extract 5 5 imm)))
  (assert (bvzero? (extract 3 0 imm)))
  (riscv:c.addi16sp nzimm9 nzimm4&6&8:7&5))

(define (rvc_addi4spn rd imm)
  (set! imm (make-immediate imm 10))
  (define nzuimm5:4&9:6&2&3
    (concat (extract 5 4 imm)
            (extract 9 6 imm)
            (extract 2 2 imm)
            (extract 3 3 imm)))
  (assert (bvzero? (extract 1 0 imm)))
  (riscv:c.addi4spn nzuimm5:4&9:6&2&3 (riscv:encode-compressed-gpr rd)))

(define (rvc_swsp imm rs2)
  (set! imm (make-immediate imm 8))
  (define uimm5:2&7:6
    (concat (extract 5 2 imm)
            (extract 7 6 imm)))
  (assert (bvzero? (extract 1 0 imm)))
  (riscv:c.swsp uimm5:2&7:6 (riscv:encode-gpr rs2)))

(define (rvc_sdsp imm rs2)
  (set! imm (make-immediate imm 9))
  (define uimm5:3&8:6
    (concat (extract 5 3 imm)
            (extract 8 6 imm)))
  (assert (bvzero? (extract 2 0 imm)))
  (riscv:c.sdsp uimm5:3&8:6 (riscv:encode-gpr rs2)))

(define (rvc_lwsp rd imm)
  (set! imm (make-immediate imm 8))
  (define uimm5 (extract 5 5 imm))
  (define uimm4:2&7:6 (concat (extract 4 2 imm) (extract 7 6 imm)))
  (assert (bvzero? (extract 1 0 imm)))
  (riscv:c.lwsp uimm5 (riscv:encode-gpr rd) uimm4:2&7:6))

(define (rvc_ldsp rd imm)
  (set! imm (make-immediate imm 9))
  (define uimm5 (extract 5 5 imm))
  (define uimm4:3&8:6 (concat (extract 4 3 imm) (extract 8 6 imm)))
  (assert (bvzero? (extract 2 0 imm)))
  (riscv:c.ldsp uimm5 (riscv:encode-gpr rd) uimm4:3&8:6))

(define ((make-ca-insn ctor) rs1/rd rs2)
  (ctor (riscv:encode-compressed-gpr rs1/rd) (riscv:encode-compressed-gpr rs2)))

(define rvc_and (make-ca-insn riscv:c.and))
(define rvc_or (make-ca-insn riscv:c.or))
(define rvc_sub (make-ca-insn riscv:c.sub))
(define rvc_subw (make-ca-insn riscv:c.subw))
(define rvc_xor (make-ca-insn riscv:c.xor))

(define ((make-cr-insn ctor) rd rs)
  (ctor (riscv:encode-gpr rd) (riscv:encode-gpr rs)))

(define rvc_mv (make-cr-insn riscv:c.mv))
(define rvc_add (make-cr-insn riscv:c.add))

(define (rvc_lw rd off rs1)
  (set! off (make-immediate off 7))
  (define uimm5:3 (extract 5 3 off))
  (define uimm2&6 (concat (extract 2 2 off) (extract 6 6 off)))
  (assert (bvzero? (extract 1 0 off)))
  (riscv:c.lw uimm5:3 (riscv:encode-compressed-gpr rs1)
              uimm2&6 (riscv:encode-compressed-gpr rd)))

(define (rvc_ld rd off rs1)
  (set! off (make-immediate off 8))
  (define uimm5:3 (extract 5 3 off))
  (define uimm7:6 (extract 7 6 off))
  (assert (bvzero? (extract 2 0 off)))
  (riscv:c.ld uimm5:3 (riscv:encode-compressed-gpr rs1)
              uimm7:6 (riscv:encode-compressed-gpr rd)))

(define (rvc_sw rs1 off rs2)
  (set! off (make-immediate off 7))
  (define uimm5:3 (extract 5 3 off))
  (define uimm2&6 (concat (extract 2 2 off) (extract 6 6 off)))
  (assert (bvzero? (extract 1 0 off)))
  (riscv:c.sw uimm5:3 (riscv:encode-compressed-gpr rs1)
              uimm2&6 (riscv:encode-compressed-gpr rs2)))

(define (rvc_sd rs1 off rs2)
  (set! off (make-immediate off 8))
  (define uimm5:3 (extract 5 3 off))
  (define uimm7:6 (extract 7 6 off))
  (assert (bvzero? (extract 2 0 off)))
  (riscv:c.sd uimm5:3 (riscv:encode-compressed-gpr rs1)
              uimm7:6 (riscv:encode-compressed-gpr rs2)))

(define (rvc_jalr rs1)
  (riscv:c.jalr (riscv:encode-gpr rs1)))

(define (rvc_jr rs1)
  (riscv:c.jr (riscv:encode-gpr rs1)))

(define ((make-cb-branch-insn ctor) rs1 imm)
  (set! imm (make-immediate imm 9))
  (define imm8&4:3 (concat (extract 8 8 imm) (extract 4 3 imm)))
  (define imm7:6&2:1&5 (concat (extract 7 6 imm) (extract 2 1 imm) (extract 5 5 imm)))
  (assert (bvzero? (extract 0 0 imm)))
  (ctor imm8&4:3 (riscv:encode-compressed-gpr rs1) imm7:6&2:1&5))

(define rvc_beqz (make-cb-branch-insn riscv:c.beqz))
(define rvc_bnez (make-cb-branch-insn riscv:c.bnez))