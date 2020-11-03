#lang rosette

; This file is translated and adapted from arch/riscv/net/bpf_jit_comp64.c,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0
; BPF JIT compiler for RV64G
;
; Copyright(c) 2019 Björn Töpel <bjorn.topel@gmail.com>

(require
  "../../lib/bpf-common.rkt"
  "../impl-common.rkt"
  "../../lib/patch.rkt"
  "../../lib/bvaxiom.rkt"
  "../../common.rkt"
  "../../lib/spec/bpf.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp))

(provide regmap emit_insn bpf_jit_build_prologue bpf_jit_build_epilogue RV_REG_TCC_SAVED)

(define RV_REG_TCC RV_REG_A6)
(define RV_REG_TCC_SAVED RV_REG_S6)

(define @regmap (list
  (cons BPF_REG_0 RV_REG_A5)
  (cons BPF_REG_1 RV_REG_A0)
  (cons BPF_REG_2 RV_REG_A1)
  (cons BPF_REG_3 RV_REG_A2)
  (cons BPF_REG_4 RV_REG_A3)
  (cons BPF_REG_5 RV_REG_A4)
  (cons BPF_REG_6 RV_REG_S1)
  (cons BPF_REG_7 RV_REG_S2)
  (cons BPF_REG_8 RV_REG_S3)
  (cons BPF_REG_9 RV_REG_S4)
  (cons BPF_REG_FP RV_REG_S5)
  (cons BPF_REG_AX RV_REG_T0)
))

(define RV_CTX_F_SEEN_TAIL_CALL 0)
(define RV_CTX_F_SEEN_CALL RV_REG_RA)
(define RV_CTX_F_SEEN_S1 RV_REG_S1)
(define RV_CTX_F_SEEN_S2 RV_REG_S2)
(define RV_CTX_F_SEEN_S3 RV_REG_S3)
(define RV_CTX_F_SEEN_S4 RV_REG_S4)
(define RV_CTX_F_SEEN_S5 RV_REG_S5)
(define RV_CTX_F_SEEN_S6 RV_REG_S6)

(define (regmap bpf_reg)
  (define e (assoc bpf_reg @regmap))
  (assert e (format "unknown BPF register: ~a" bpf_reg))
  (cdr e))

(define (bpf_to_rv_reg bpf_reg ctx)
  (define reg (regmap bpf_reg))
  (when (member reg
    (list RV_CTX_F_SEEN_S1 RV_CTX_F_SEEN_S2
          RV_CTX_F_SEEN_S3 RV_CTX_F_SEEN_S4
          RV_CTX_F_SEEN_S5 RV_CTX_F_SEEN_S6))
    (set-context-flags! ctx (core:update (context-flags ctx) (list (riscv:gpr->idx reg)) #t)))
  reg)

(define (seen_reg reg ctx)
  (define flags (context-flags ctx))
  (if (member reg
    (list RV_CTX_F_SEEN_CALL
          RV_CTX_F_SEEN_S1 RV_CTX_F_SEEN_S2
          RV_CTX_F_SEEN_S3 RV_CTX_F_SEEN_S4
          RV_CTX_F_SEEN_S5 RV_CTX_F_SEEN_S6))
    (flags (riscv:gpr->idx reg))
    #f))

(define (is_32b_int imm)
  (&& (bvsle (bv (- #x80000000) 64) imm) (bvslt imm (bv #x80000000 64))))

(define (in_auipc_jalr_range val)
  (&& (bvsle (bv (- #x80000800) 64) val) (bvslt val (bv #x7ffff800 64))))

; emit_imm is recursive which can cause symbolic evaluation to diverge
; when given a symbolic `val`. Instead, take a fuel parameter for
; the maximum number of recursive calls and assert (prove) that fuel
; does not run out. 4 appears to be the minimum value for fuel
; that is correct for all possible 64-bit values.
(define (emit_imm rd val ctx #:fuel [fuel 4])
  (cond
    [(zero? fuel) (core:bug #:msg "emit_imm: ran out of fuel")]
    [else
      (define val64 (sign-extend val (bitvector 64)))
      (define upper
        (bvashr (bvadd val64 (bvshl (bv 1 64) (bv 11 64))) (bv 12 64)))
      (define lower (bvashr (bvshl (bvand val64 (bv #xfff 64)) (bv 52 64)) (bv 52 64)))

      (cond
        [(|| (is_32b_int val64) (<= (core:bv-size val) 32))
          (assert (is_32b_int val64))
          (cond
            [(bvzero? upper)
              (emit_li rd (core:trunc 32 lower) ctx)]
            [else
              (emit_lui rd (core:trunc 32 upper) ctx)
              (emit_addiw rd rd (core:trunc 32 lower) ctx)])]

        [else
          (define shift (ffs-uf upper))
          (set! upper (bvashr upper shift))
          (set! shift (bvadd shift (bv 12 64)))
          (emit_imm rd upper ctx #:fuel (sub1 fuel))
          (emit_slli rd rd (core:trunc 32 shift) ctx)
          (when (! (bvzero? lower))
            (emit_addi rd rd (core:trunc 32 lower) ctx))])]))

(define (emit_bcc cond_ rd rs rvoff ctx)
  (case cond_
    [(BPF_JEQ)
      (emit (rv_beq rd rs (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JGT)
      (emit (rv_bltu rs rd (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JLT)
      (emit (rv_bltu rd rs (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JGE)
      (emit (rv_bgeu rd rs (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JLE)
      (emit (rv_bgeu rs rd (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JNE)
      (emit (rv_bne rd rs (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JSGT)
      (emit (rv_blt rs rd (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JSLT)
      (emit (rv_blt rd rs (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JSGE)
      (emit (rv_bge rd rs (bvashr rvoff (bv 1 32))) ctx)]
    [(BPF_JSLE)
      (emit (rv_bge rs rd (bvashr rvoff (bv 1 32))) ctx)]
    [else (assert #f)]))

(define (emit_branch cond_ rd rs insn rvoff ctx)
  (cond
    [(is_13b_int rvoff)
      (emit_bcc cond_ rd rs rvoff ctx)]
    [else
      ; Adjust for jal
      (set! rvoff (bvsub rvoff (bv 4 32)))
      #| Transform, e.g.:
      *   bne rd,rs,foo
      * to
      *   beq rd,rs,<.L1>
      *   (auipc foo)
      *   jal(r) foo
      * .L1
      |#
      (set! cond_ (invert_bpf_cond cond_))
      (cond
        [(is_21b_int rvoff)
          (emit_bcc cond_ rd rs (bv 8 32) ctx)
          (emit (rv_jal RV_REG_ZERO (bvashr rvoff (bv 1 32))) ctx)]
        [else
          (define upper (bvashr (bvadd rvoff (bvshl (bv 1 32) (bv 11 32))) (bv 12 32)))
          (define lower (bvand rvoff (bv #xfff 32)))
          (emit_bcc cond_ rd rs (bv 12 32) ctx)
          (emit (rv_auipc RV_REG_T1 upper) ctx)
          (emit (rv_jalr RV_REG_ZERO RV_REG_T1 lower) ctx)])]))

(define (emit_zext_32 reg ctx)
  (emit_slli reg reg (bv 32 32) ctx)
  (emit_srli reg reg (bv 32 32) ctx))

(define (emit_bpf_tail_call insn insn-idx ctx)

  (define start_insn (context-ninsns ctx))
  (define tcc RV_REG_TCC_SAVED) ; TODO: use rv_tail_call_reg

  (define offset (context-offset ctx))
  (define tc_insn
    (if (! (bvzero? insn-idx))
        (bvsub (offset insn-idx) (offset (bvsub1 insn-idx)))
        (offset (bv 0 32))))

  (emit_zext_32 RV_REG_A2 ctx)

  (define off (bv 0 32))
  (core:bug-on (! (is_12b_int off)) #:msg "tail call")
  (emit (rv_lwu RV_REG_T1 off RV_REG_A1) ctx)

  (set! off (ninsns_rvoff (bvsub tc_insn (bvsub (context-ninsns ctx) start_insn))))
  (emit_branch 'BPF_JGE RV_REG_A2 RV_REG_T1 insn-idx off ctx)

  (emit (rv_addi RV_REG_T1 tcc -1) ctx)
  (set! off (ninsns_rvoff (bvsub tc_insn (bvsub (context-ninsns ctx) start_insn))))
  (emit_branch 'BPF_JSLT tcc RV_REG_ZERO insn-idx off ctx)

  (emit_slli RV_REG_T2 RV_REG_A2 (bv 3 32) ctx)
  (emit_add RV_REG_T2 RV_REG_T2 RV_REG_A1 ctx)
  (set! off (bv 8 32)) ; TODO use real offsetof
  (emit_ld RV_REG_T2 off RV_REG_T2 ctx)
  (set! off (ninsns_rvoff (bvsub tc_insn (bvsub (context-ninsns ctx) start_insn))))
  (emit_bcc 'BPF_JEQ RV_REG_T2 RV_REG_ZERO off ctx)

  (set! off (bv 0 32))
  (emit_ld RV_REG_T3 off RV_REG_T2 ctx)
  (emit_mv tcc RV_REG_T1 ctx)

  ; (__build_epilogue #t ctx)
  (void))

(define (emit_zext_32_rd_rs rd rs ctx)
  (emit_mv RV_REG_T2 rd ctx)
  (emit_zext_32 RV_REG_T2 ctx)
  (emit_mv RV_REG_T1 rs ctx)
  (emit_zext_32 RV_REG_T1 ctx)
  (values RV_REG_T2 RV_REG_T1))

(define (emit_sext_32_rd_rs rd rs ctx)
  (emit_addiw RV_REG_T2 rd (bv 0 32) ctx)
  (emit_addiw RV_REG_T1 rs (bv 0 32) ctx)
  (values RV_REG_T2 RV_REG_T1))

(define (emit_zext_32_rd_t1 rd ctx)
  (emit_mv RV_REG_T2 rd ctx)
  (emit_zext_32 RV_REG_T2 ctx)
  (emit_zext_32 RV_REG_T1 ctx)
  (values RV_REG_T2))

(define (emit_sext_32_rd rd ctx)
  (emit_addiw RV_REG_T2 rd (bv 0 32) ctx)
  (values RV_REG_T2))

(define (emit_jump_and_link rd rvoff force_jalr ctx)
  (cond
    [(&& (! (bveq rvoff (bv 0 64)))
         (is_21b_int rvoff 64)
         (! force_jalr))
      (emit (rv_jal rd (bvashr rvoff (bv 1 64))) ctx)]
    [(in_auipc_jalr_range rvoff)
      (define upper (bvashr (bvadd rvoff (bvshl (bv 1 64) (bv 11 64))) (bv 12 64)))
      (define lower (bvand rvoff (bv #xfff 64)))
      (emit (rv_auipc RV_REG_T1 upper) ctx)
      (emit (rv_jalr rd RV_REG_T1 lower) ctx)]
    [else
      (core:bug #:msg "emit_jump_and_link: out of range")]))

(define (is_signed_bpf_cond cond_)
  (case cond_
    [(BPF_JSGT BPF_JSLT BPF_JSGE BPF_JSLE) #t]
    [else #f]))

(define (emit_call fixed addr ctx)

  (define ip (bvadd (context-insns-addr ctx)
                    (bvmul (bv 2 64) (zero-extend (context-ninsns ctx) (bitvector 64)))))

  (define off (bvsub addr ip))

  ; Assume that any offset to function call is reacahble with auipc+jalr.
  (assume (in_auipc_jalr_range off))

  (when (in_auipc_jalr_range off)
    (emit_jump_and_link RV_REG_RA off (! fixed) ctx))
  (define rd (bpf_to_rv_reg BPF_REG_0 ctx))
  (emit_mv rd RV_REG_A0 ctx))

(define (emit_insn insn-idx insn next-insn ctx)
  (define code (bpf:insn-code insn))
  (define dst (bpf:insn-dst insn))
  (define src (bpf:insn-src insn))
  (define off (bpf:insn-off insn))
  (define imm (bpf:insn-imm insn))

  (define is64 (|| (equal? (BPF_CLASS code) 'BPF_ALU64)
                   (equal? (BPF_CLASS code) 'BPF_JMP)))

  (define rd (bpf_to_rv_reg dst ctx))
  (define rs (bpf_to_rv_reg src ctx))

  (case code
    ; dst = src
    [((BPF_ALU BPF_MOV BPF_X)
      (BPF_ALU64 BPF_MOV BPF_X))

      (if (equal? imm (bv 1 32))
        ; mov32 for zext
        (emit_zext_32 rd ctx)
        (begin
          (emit_mv rd rs ctx)
          (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
            (emit_zext_32 rd ctx))))]

    ; dst = dst OP src
    [((BPF_ALU BPF_ADD BPF_X)
      (BPF_ALU64 BPF_ADD BPF_X))

      (emit_add rd rd rs ctx)

      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_SUB BPF_X)
      (BPF_ALU64 BPF_SUB BPF_X))

      (if is64
        (emit_sub rd rd rs ctx)
        (emit_subw rd rd rs ctx))

      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_AND BPF_X)
      (BPF_ALU64 BPF_AND BPF_X))

      (emit_and rd rd rs ctx)

      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_OR BPF_X)
      (BPF_ALU64 BPF_OR BPF_X))

      (emit_or rd rd rs ctx)

      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_XOR BPF_X)
      (BPF_ALU64 BPF_XOR BPF_X))

      (emit_xor rd rd rs ctx)

      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_MUL BPF_X)
      (BPF_ALU64 BPF_MUL BPF_X))

      (emit (if is64 (rv_mul rd rd rs) (rv_mulw rd rd rs)) ctx)
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_DIV BPF_X)
      (BPF_ALU64 BPF_DIV BPF_X))

      (emit (if is64 (rv_divu rd rd rs) (rv_divuw rd rd rs)) ctx)
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_MOD BPF_X)
      (BPF_ALU64 BPF_MOD BPF_X))

      (emit (if is64 (rv_remu rd rd rs) (rv_remuw rd rd rs)) ctx)
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_LSH BPF_X)
      (BPF_ALU64 BPF_LSH BPF_X))

      (emit (if is64 (rv_sll rd rd rs) (rv_sllw rd rd rs)) ctx)
      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_RSH BPF_X)
      (BPF_ALU64 BPF_RSH BPF_X))

      (emit (if is64 (rv_srl rd rd rs) (rv_srlw rd rd rs)) ctx)
      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_ARSH BPF_X)
      (BPF_ALU64 BPF_ARSH BPF_X))

      (emit (if is64 (rv_sra rd rd rs) (rv_sraw rd rd rs)) ctx)
      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    ; dst = -dst
    [((BPF_ALU BPF_NEG)
      (BPF_ALU64 BPF_NEG))

      (emit_sub rd RV_REG_ZERO rd ctx)
      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    ; dst = BSWAP##imm(dst)
    [((BPF_ALU BPF_END BPF_FROM_LE))
      (cond
        [(equal? imm (bv 16 32))
          (emit_slli rd rd (bv 48 32) ctx)
          (emit_srli rd rd (bv 48 32) ctx)]
        [(equal? imm (bv 32 32))
          (when (! (->prog->aux->verifier_zext ctx))
            (emit_zext_32 rd ctx))]
        [(equal? imm (bv 64 32))
          (void)] ; Do nothing
        [else
          (core:bug #:msg (format "FROM_LE: bad immediate: ~v" imm))])]

    [((BPF_ALU BPF_END BPF_FROM_BE))
      ; Possible optimizations, though not necessasry for now.
      ;   [(equal? imm (bv 16 32))
      ;     (emit (rv_srli RV_REG_T1 rd 8) ctx)
      ;     (emit (rv_andi RV_REG_T1 RV_REG_T1 #xff) ctx)
      ;     (emit (rv_andi rd rd #xff) ctx)
      ;     (emit (rv_slli rd rd 8) ctx)
      ;     (emit (rv_or rd rd RV_REG_T1) ctx)]
      ;   [(equal? imm (bv 32 32))
      ;     ; t3 = 0xff0000
      ;     (emit (rv_lui RV_REG_T3 #xff0) ctx)
      ;     ; t1 = (rd >> 24) & 0xff
      ;     (emit (rv_srliw RV_REG_T1 rd 24) ctx)
      ;     ; t1 |= (rd & 0xff0000) >> 8
      ;     (emit (rv_and RV_REG_T2 rd RV_REG_T3) ctx)
      ;     (emit (rv_srli RV_REG_T2 RV_REG_T2 8) ctx)
      ;     (emit (rv_or RV_REG_T1 RV_REG_T1 RV_REG_T2) ctx)
      ;     ; t1 |= (rd << 8) & 0xff0000
      ;     (emit (rv_slli RV_REG_T2 rd 8) ctx)
      ;     (emit (rv_and RV_REG_T2 RV_REG_T2 RV_REG_T3) ctx)
      ;     (emit (rv_or RV_REG_T1 RV_REG_T1 RV_REG_T2) ctx)
      ;     ; rd = ((rd & 0xff) << 24) | t1
      ;     (when (! (->prog->aux->verifier_zext ctx))
      ;       (emit (rv_andi rd rd #xff) ctx))
      ;     (emit (rv_slli rd rd 24) ctx)
      ;     (emit (rv_or rd rd RV_REG_T1) ctx)]
     (emit_li RV_REG_T2 (bv 0 32) ctx)

     (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
     (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)
     (emit_slli RV_REG_T2 RV_REG_T2 (bv 8 32) ctx)
     (emit_srli rd rd (bv 8 32) ctx)

     (when (! (equal? imm (bv 16 32)))
       (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
       (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)
       (emit_slli RV_REG_T2 RV_REG_T2 (bv 8 32) ctx)
       (emit_srli rd rd (bv 8 32) ctx)

       (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
       (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)
       (emit_slli RV_REG_T2 RV_REG_T2 (bv 8 32) ctx)
       (emit_srli rd rd (bv 8 32) ctx)

       (when (! (equal? imm (bv 32 32)))
         (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
         (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)
         (emit_slli RV_REG_T2 RV_REG_T2 (bv 8 32) ctx)
         (emit_srli rd rd (bv 8 32) ctx)

         (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
         (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)
         (emit_slli RV_REG_T2 RV_REG_T2 (bv 8 32) ctx)
         (emit_srli rd rd (bv 8 32) ctx)

         (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
         (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)
         (emit_slli RV_REG_T2 RV_REG_T2 (bv 8 32) ctx)
         (emit_srli rd rd (bv 8 32) ctx)

         (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
         (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)
         (emit_slli RV_REG_T2 RV_REG_T2 (bv 8 32) ctx)
         (emit_srli rd rd (bv 8 32) ctx)))

     (emit_andi RV_REG_T1 rd (bv #xff 32) ctx)
     (emit_add RV_REG_T2 RV_REG_T2 RV_REG_T1 ctx)

     (emit_mv rd RV_REG_T2 ctx)]

    ; dst = imm
    [((BPF_ALU BPF_MOV BPF_K)
      (BPF_ALU64 BPF_MOV BPF_K))

      (emit_imm rd imm ctx)
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    ; dst = dst OP imm
    [((BPF_ALU BPF_ADD BPF_K)
      (BPF_ALU64 BPF_ADD BPF_K))

      (cond
        [(is_12b_int imm)
          (emit_addi rd rd imm ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit_add rd rd RV_REG_T1 ctx)])
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_SUB BPF_K)
      (BPF_ALU64 BPF_SUB BPF_K))

      (cond
        [(is_12b_int (bvneg imm))
          (emit_addi rd rd (bvneg imm) ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit_sub rd rd RV_REG_T1 ctx)])
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_AND BPF_K)
      (BPF_ALU64 BPF_AND BPF_K))

      (cond
        [(is_12b_int imm)
          (emit_andi rd rd imm ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit_and rd rd RV_REG_T1 ctx)])
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_OR BPF_K)
      (BPF_ALU64 BPF_OR BPF_K))
      (cond
        [(is_12b_int imm)
          (emit (rv_ori rd rd imm) ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit_or rd rd RV_REG_T1 ctx)])
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_XOR BPF_K)
      (BPF_ALU64 BPF_XOR BPF_K))
      (cond
        [(is_12b_int imm)
          (emit (rv_xori rd rd imm) ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit_xor rd rd RV_REG_T1 ctx)])
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_MUL BPF_K)
      (BPF_ALU64 BPF_MUL BPF_K))

      (emit_imm RV_REG_T1 imm ctx)
      (emit (if is64 (rv_mul rd rd RV_REG_T1)
                     (rv_mulw rd rd RV_REG_T1)) ctx)
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_DIV BPF_K)
      (BPF_ALU64 BPF_DIV BPF_K))

      (emit_imm RV_REG_T1 imm ctx)
      (emit (if is64 (rv_divu rd rd RV_REG_T1)
                     (rv_divuw rd rd RV_REG_T1)) ctx)
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_MOD BPF_K)
      (BPF_ALU64 BPF_MOD BPF_K))

      (emit_imm RV_REG_T1 imm ctx)
      (emit (if is64 (rv_remu rd rd RV_REG_T1)
                     (rv_remuw rd rd RV_REG_T1)) ctx)
      (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx))]

    [((BPF_ALU BPF_LSH BPF_K)
      (BPF_ALU64 BPF_LSH BPF_K))

      (emit_slli rd rd imm ctx)

      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_RSH BPF_K)
      (BPF_ALU64 BPF_RSH BPF_K))

      (if is64
        (emit_srli rd rd imm ctx)
        (emit (rv_srliw rd rd imm) ctx))

      (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
        (emit_zext_32 rd ctx)))]

    [((BPF_ALU BPF_ARSH BPF_K)
      (BPF_ALU64 BPF_ARSH BPF_K))

      (if is64
        (emit_srai rd rd imm ctx)
        (emit (rv_sraiw rd rd imm) ctx))

     (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
       (emit_zext_32 rd ctx)))]

    ; JUMP off
    [((BPF_JMP BPF_JA))
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (sign-extend (rv_offset insn-idx off32 ctx) (bitvector 64)))
      (emit_jump_and_link RV_REG_ZERO rvoff #f ctx)]

    ; IF (dst COND src) JUMP off */
    [((BPF_JMP BPF_JEQ BPF_X)
      (BPF_JMP32 BPF_JEQ BPF_X)
      (BPF_JMP BPF_JGT BPF_X)
      (BPF_JMP32 BPF_JGT BPF_X)
      (BPF_JMP BPF_JLT BPF_X)
      (BPF_JMP32 BPF_JLT BPF_X)
      (BPF_JMP BPF_JGE BPF_X)
      (BPF_JMP32 BPF_JGE BPF_X)
      (BPF_JMP BPF_JLE BPF_X)
      (BPF_JMP32 BPF_JLE BPF_X)
      (BPF_JMP BPF_JNE BPF_X)
      (BPF_JMP32 BPF_JNE BPF_X)
      (BPF_JMP BPF_JSGT BPF_X)
      (BPF_JMP32 BPF_JSGT BPF_X)
      (BPF_JMP BPF_JSLT BPF_X)
      (BPF_JMP32 BPF_JSLT BPF_X)
      (BPF_JMP BPF_JSGE BPF_X)
      (BPF_JMP32 BPF_JSGE BPF_X)
      (BPF_JMP BPF_JSLE BPF_X)
      (BPF_JMP32 BPF_JSLE BPF_X)
      (BPF_JMP BPF_JSET BPF_X)
      (BPF_JMP32 BPF_JSET BPF_X))

      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (rv_offset insn-idx off32 ctx))
      (when (! is64)
        (define s (context-ninsns ctx))
        (cond
          [(is_signed_bpf_cond (BPF_OP code))
            (set!-values (rd rs) (emit_sext_32_rd_rs rd rs ctx))]
          [else
            (set!-values (rd rs) (emit_zext_32_rd_rs rd rs ctx))])
        (define e (context-ninsns ctx))
        (set! rvoff (bvsub rvoff (ninsns_rvoff (bvsub e s)))))
      (cond
        [(equal? (BPF_OP code) 'BPF_JSET)
          (set! rvoff (bvsub rvoff (bv 4 32)))
          (emit_and RV_REG_T1 rd rs ctx)
          (emit_branch 'BPF_JNE RV_REG_T1 RV_REG_ZERO insn-idx rvoff ctx)]
        [else
          (emit_branch (BPF_OP code) rd rs insn-idx rvoff ctx)])]

    ; IF (dst COND imm) JUMP off */
    [((BPF_JMP BPF_JEQ BPF_K)
      (BPF_JMP32 BPF_JEQ BPF_K)
      (BPF_JMP BPF_JGT BPF_K)
      (BPF_JMP32 BPF_JGT BPF_K)
      (BPF_JMP BPF_JLT BPF_K)
      (BPF_JMP32 BPF_JLT BPF_K)
      (BPF_JMP BPF_JGE BPF_K)
      (BPF_JMP32 BPF_JGE BPF_K)
      (BPF_JMP BPF_JLE BPF_K)
      (BPF_JMP32 BPF_JLE BPF_K)
      (BPF_JMP BPF_JNE BPF_K)
      (BPF_JMP32 BPF_JNE BPF_K)
      (BPF_JMP BPF_JSGT BPF_K)
      (BPF_JMP32 BPF_JSGT BPF_K)
      (BPF_JMP BPF_JSLT BPF_K)
      (BPF_JMP32 BPF_JSLT BPF_K)
      (BPF_JMP BPF_JSGE BPF_K)
      (BPF_JMP32 BPF_JSGE BPF_K)
      (BPF_JMP BPF_JSLE BPF_K)
      (BPF_JMP32 BPF_JSLE BPF_K))
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (rv_offset insn-idx off32 ctx))
      (define s (context-ninsns ctx))
      (cond
        [(! (bvzero? imm))
          (emit_imm RV_REG_T1 imm ctx)
          (set! rs RV_REG_T1)]
        [else
          (set! rs RV_REG_ZERO)])

      (when (! is64)
        (cond
          [(is_signed_bpf_cond (BPF_OP code))
            (set! rd (emit_sext_32_rd rd ctx))]
          [else
            (set! rd (emit_zext_32_rd_t1 rd ctx))]))
      (define e (context-ninsns ctx))
      (set! rvoff (bvsub rvoff (ninsns_rvoff (bvsub e s))))
      (emit_branch (BPF_OP code) rd rs insn-idx rvoff ctx)]

    [((BPF_JMP BPF_JSET BPF_K)
      (BPF_JMP32 BPF_JSET BPF_K))
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (rv_offset insn-idx off32 ctx))
      (define s (context-ninsns ctx))
      (cond
        [(is_12b_int imm)
          (emit_andi RV_REG_T1 rd imm ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit_and RV_REG_T1 rd RV_REG_T1 ctx)])
      ; For jset32, we should clear the upper 32 bits of t1, but
      ; sign-extension is sufficient here and saves one instruction,
      ; as t1 is used only in comparison against zero.
      (when (&& (! is64) (bvslt imm (bv 0 32)))
        (emit_addiw RV_REG_T1 RV_REG_T1 (bv 0 32) ctx))
      (define e (context-ninsns ctx))
      (set! rvoff (bvsub rvoff (ninsns_rvoff (bvsub e s))))
      (emit_branch 'BPF_JNE RV_REG_T1 RV_REG_ZERO insn-idx rvoff ctx)]

    ; function call
    [((BPF_JMP BPF_CALL))
      (define &addr (box (void)))
      (define &fixed (box (void)))
      (bpf_jit_get_func_addr ctx insn &addr &fixed)
      (emit_call (unbox &fixed) (unbox &addr) ctx)]

    ; tail call
    [((BPF_JMP BPF_TAIL_CALL))
      (emit_bpf_tail_call insn insn-idx ctx)]

    ; function return
    [((BPF_JMP BPF_EXIT))
      (cond
        [(equal? insn-idx (bvsub1 (context-program-length ctx)))
          ; Break
          (void)]
        [else
          (define rvoff (sign-extend (epilogue_offset ctx) (bitvector 64)))
          (emit_jump_and_link RV_REG_ZERO rvoff #f ctx)])]

    ; dst = imm64
    [((BPF_LD BPF_IMM BPF_DW))

      (define lo_val (zero-extend imm (bitvector 64)))
      (define hi_val (zero-extend (bpf:insn-imm next-insn) (bitvector 64)))

      (define imm64
        (bvor (bvshl hi_val (bv 32 64))
              lo_val))
      (emit_imm rd imm64 ctx)]

    ; LDX: dst = *(size *)(src + off) */
    [((BPF_LDX BPF_MEM BPF_B))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit (rv_lbu rd off rs) ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rs ctx)
          (emit (rv_lbu rd 0 RV_REG_T1) ctx)])]

    [((BPF_LDX BPF_MEM BPF_H))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit (rv_lhu rd off rs) ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rs ctx)
          (emit (rv_lhu rd 0 RV_REG_T1) ctx)])]

    [((BPF_LDX BPF_MEM BPF_W))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit (rv_lwu rd off rs) ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rs ctx)
          (emit (rv_lwu rd 0 RV_REG_T1) ctx)])]

    [((BPF_LDX BPF_MEM BPF_DW))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit_ld rd (sign-extend off (bitvector 32)) rs ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rs ctx)
          (emit_ld rd (bv 0 32) RV_REG_T1 ctx)])]

    ; ST: *(size *)(dst + off) = imm
    [((BPF_ST BPF_MEM BPF_B))
      (emit_imm RV_REG_T1 imm ctx)
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit (rv_sb rd off RV_REG_T1) ctx)]
        [else
          (emit_imm RV_REG_T2 off ctx)
          (emit_add RV_REG_T2 RV_REG_T2 rd ctx)
          (emit (rv_sb RV_REG_T2 0 RV_REG_T1) ctx)])]

    [((BPF_ST BPF_MEM BPF_H))
      (emit_imm RV_REG_T1 imm ctx)
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit (rv_sh rd off RV_REG_T1) ctx)]
        [else
          (emit_imm RV_REG_T2 off ctx)
          (emit_add RV_REG_T2 RV_REG_T2 rd ctx)
          (emit (rv_sh RV_REG_T2 0 RV_REG_T1) ctx)])]

    [((BPF_ST BPF_MEM BPF_W))
      (emit_imm RV_REG_T1 imm ctx)
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit_sw rd (sign-extend off (bitvector 32)) RV_REG_T1 ctx)]
        [else
          (emit_imm RV_REG_T2 off ctx)
          (emit_add RV_REG_T2 RV_REG_T2 rd ctx)
          (emit_sw RV_REG_T2 (bv 0 32) RV_REG_T1 ctx)])]

    [((BPF_ST BPF_MEM BPF_DW))
      (emit_imm RV_REG_T1 imm ctx)
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit_sd rd (sign-extend off (bitvector 32)) RV_REG_T1 ctx)]
        [else
          (emit_imm RV_REG_T2 off ctx)
          (emit_add RV_REG_T2 RV_REG_T2 rd ctx)
          (emit_sd RV_REG_T2 (bv 0 32) RV_REG_T1 ctx)])]

    ; STX: *(size *)(dst + off) = src */
    [((BPF_STX BPF_MEM BPF_B))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit (rv_sb rd off rs) ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rd ctx)
          (emit (rv_sb RV_REG_T1 0 rs) ctx)])]

    [((BPF_STX BPF_MEM BPF_H))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit (rv_sh rd off rs) ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rd ctx)
          (emit (rv_sh RV_REG_T1 0 rs) ctx)])]

    [((BPF_STX BPF_MEM BPF_W))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit_sw rd (sign-extend off (bitvector 32)) rs ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rd ctx)
          (emit_sw RV_REG_T1 (bv 0 32) rs ctx)])]

    [((BPF_STX BPF_MEM BPF_DW))
      (cond
        [(is_12b_int (sign-extend off (bitvector 32)))
          (emit_sd rd (sign-extend off (bitvector 32)) rs ctx)]
        [else
          (emit_imm RV_REG_T1 off ctx)
          (emit_add RV_REG_T1 RV_REG_T1 rd ctx)
          (emit_sd RV_REG_T1 (bv 0 32) rs ctx)])]

    [((BPF_STX BPF_XADD BPF_W)
      (BPF_STX BPF_XADD BPF_DW))

      (when (! (bvzero? off))
        (cond
          [(is_12b_int (sign-extend off (bitvector 32)))
            (emit_addi RV_REG_T1 rd (sign-extend off (bitvector 32)) ctx)]
          [else
            (emit_imm RV_REG_T1 off ctx)
            (emit_add RV_REG_T1 RV_REG_T1 rd ctx)])
        (set! rd RV_REG_T1))

      (if (equal? (BPF_SIZE code) 'BPF_W)
        (emit (rv_amoadd_w RV_REG_ZERO rs rd 0 0) ctx)
        (emit (rv_amoadd_d RV_REG_ZERO rs rd 0 0) ctx))])

  (context-insns ctx))

(define (bpf_jit_build_prologue ctx)
  (define stack_adjust (bv 0 32))
  (define bpf_stack_adjust (round_up (->prog->aux->stack_depth ctx) (bv 16 32)))

  ; NB: assume seen_reg = true for now
  (set! stack_adjust (bvadd stack_adjust (bv (* 8 8) 32)))

  (set! stack_adjust (round_up stack_adjust (bv 16 32)))
  (set! stack_adjust (bvadd stack_adjust bpf_stack_adjust))

  (define store_offset (bvsub stack_adjust (bv 8 32)))

  ; First instruction is always setting the tail-call-counter
  ; (TCC) register. This instruction is skipped for tail calls.
  ; Force using a 4-byte (non-compressed) instruction.
  (emit (rv_addi RV_REG_TCC RV_REG_ZERO (bv MAX_TAIL_CALL_CNT 32)) ctx)

  (emit_addi RV_REG_SP RV_REG_SP (bvneg stack_adjust) ctx)

  (emit_sd RV_REG_SP store_offset RV_REG_RA ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_sd RV_REG_SP store_offset RV_REG_FP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_sd RV_REG_SP store_offset RV_REG_S1 ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_sd RV_REG_SP store_offset RV_REG_S2 ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_sd RV_REG_SP store_offset RV_REG_S3 ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_sd RV_REG_SP store_offset RV_REG_S4 ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_sd RV_REG_SP store_offset RV_REG_S5 ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_sd RV_REG_SP store_offset RV_REG_S6 ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_addi RV_REG_FP RV_REG_SP stack_adjust ctx)

  (when (! (bvzero? bpf_stack_adjust))
    (emit_addi RV_REG_S5 RV_REG_SP bpf_stack_adjust ctx))

  (emit_mv RV_REG_TCC_SAVED RV_REG_TCC ctx)

  (set-context-stack_size! ctx stack_adjust))

(define (__build_epilogue is_tail_call ctx)
  (define stack_adjust (context-stack_size ctx))
  (define store_offset (bvsub stack_adjust (bv 8 32)))

  (emit_ld RV_REG_RA store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_ld RV_REG_FP store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_ld RV_REG_S1 store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_ld RV_REG_S2 store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_ld RV_REG_S3 store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_ld RV_REG_S4 store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_ld RV_REG_S5 store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_ld RV_REG_S6 store_offset RV_REG_SP ctx)
  (set! store_offset (bvsub store_offset (bv 8 32)))

  (emit_addi RV_REG_SP RV_REG_SP stack_adjust ctx)

  (when (! is_tail_call)
    (emit_mv RV_REG_A0 RV_REG_A5 ctx))

  (emit_jalr RV_REG_ZERO (if is_tail_call RV_REG_T3 RV_REG_RA)
                         (if is_tail_call (bv 4 32) (bv 0 32))
                         ctx))

(define (bpf_jit_build_epilogue ctx)
  (__build_epilogue #f ctx))
