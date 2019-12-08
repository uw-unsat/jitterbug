#lang rosette

(require
  "../lib/bpf-common.rkt"
  "../lib/riscv-common.rkt"
  rosette/lib/angelic
  serval/lib/unittest
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp))

(provide (all-defined-out))

(define regmap #(a5 a0 a1 a2 a3 a4 s1 s2 s3 s4 s5))

(define (bpf_to_rv_reg bpf_reg ctx)
  (define reg (vector-ref regmap bpf_reg))
  (when (member reg
    (list RV_CTX_F_SEEN_S1 RV_CTX_F_SEEN_S2
          RV_CTX_F_SEEN_S3 RV_CTX_F_SEEN_S4
          RV_CTX_F_SEEN_S5 RV_CTX_F_SEEN_S6))
    (vector-set! (context-flags ctx) (riscv:gpr->idx reg) #t))
  reg)

(define (seen_reg reg ctx)
  (if (member reg
    (list RV_CTX_F_SEEN_CALL
          RV_CTX_F_SEEN_S1 RV_CTX_F_SEEN_S2
          RV_CTX_F_SEEN_S3 RV_CTX_F_SEEN_S4
          RV_CTX_F_SEEN_S5 RV_CTX_F_SEEN_S6))
    (vector-ref (context-flags ctx) (riscv:gpr->idx reg))
    #f))

(define (emit_imm rd val ctx)
  (define upper (bvashr (bvadd val (bvshl (bv 1 32) (bv 11 32))) (bv 12 32)))
  (define lower (bvand val (bv #xfff 32)))
  (cond
    [(equal? upper (bv 0 32))
     (emit (rv_addi rd RV_REG_ZERO lower) ctx)]
    [else
     (emit (rv_lui rd upper) ctx)
     (emit (rv_addiw rd rd lower) ctx)]))

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

(define (emit_zext_32 reg ctx)
  (emit (rv_slli reg reg 32) ctx)
  (emit (rv_srli reg reg 32) ctx))

(define (emit_zext_32_rd_rs rd rs ctx)
  (emit (rv_addi RV_REG_T2 rd 0) ctx)
  (emit_zext_32 RV_REG_T2 ctx)
  (emit (rv_addi RV_REG_T1 rs 0) ctx)
  (emit_zext_32 RV_REG_T1 ctx)
  (values RV_REG_T2 RV_REG_T1))

(define (emit_sext_32_rd_rs rd rs ctx)
  (emit (rv_addiw RV_REG_T2 rd 0) ctx)
  (emit (rv_addiw RV_REG_T1 rs 0) ctx)
  (values RV_REG_T2 RV_REG_T1))

(define (emit_zext_32_rd_t1 rd ctx)
  (emit (rv_addi RV_REG_T2 rd 0) ctx)
  (emit_zext_32 RV_REG_T2 ctx)
  (emit_zext_32 RV_REG_T1 ctx)
  (values RV_REG_T2))

(define (emit_sext_32_rd rd ctx)
  (emit (rv_addiw RV_REG_T2 rd 0) ctx)
  (values RV_REG_T2))

(define (emit_jump_and_link rd rvoff force_jalr ctx)
  (cond
    [(&& (! (bveq rvoff (bv 0 64)))
         (is_21b_int rvoff 64)
         (! force_jalr))
      (emit (rv_jal rd (bvashr rvoff (bv 1 64))) ctx)]
    [else
      (define upper (bvashr (bvadd rvoff (bvshl (bv 1 64) (bv 11 64))) (bv 12 64)))
      (define lower (bvand rvoff (bv #xfff 64)))
      (emit (rv_auipc RV_REG_T1 upper) ctx)
      (emit (rv_jalr rd RV_REG_T1 lower) ctx)]))

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
    [else (assert #f)]))

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

(define (is_signed_bpf_cond cond_)
  (case cond_
    [(BPF_JSGT BPF_JSLT BPF_JSGE BPF_JSLE) #t]
    [else #f]))

(define (emit_insn i code dst src off imm ctx)

  (define is64 (|| (equal? (BPF_CLASS code) 'BPF_ALU64)
                   (equal? (BPF_CLASS code) 'BPF_JMP)))

  (define rd (bpf_to_rv_reg dst ctx))
  (define rs (bpf_to_rv_reg src ctx))

  (match code
    ; dst = src
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MOV 'BPF_X)
     (if (equal? imm (bv 1 32))
         ; mov32 for zext
         (emit_zext_32 rd ctx)
         (begin
           (emit (if is64 (rv_addi rd rs 0) (rv_addiw rd rs 0)) ctx)
           (when (! is64)
             (emit_zext_32 rd ctx))))]

    ; dst = dst OP src
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_ADD 'BPF_X)
     (emit (if is64 (rv_add rd rd rs) (rv_addw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_SUB 'BPF_X)
     (emit (if is64 (rv_sub rd rd rs) (rv_subw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_AND 'BPF_X)
     (emit (rv_and rd rd rs) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_OR 'BPF_X)
     (emit (rv_or rd rd rs) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_XOR 'BPF_X)
     (emit (rv_xor rd rd rs) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MUL 'BPF_X)
     (emit (if is64 (rv_mul rd rd rs) (rv_mulw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_DIV 'BPF_X)
     (emit (if is64 (rv_divu rd rd rs) (rv_divuw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MOD 'BPF_X)
     (emit (if is64 (rv_remu rd rd rs) (rv_remuw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_LSH 'BPF_X)
     (emit (if is64 (rv_sll rd rd rs) (rv_sllw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_RSH 'BPF_X)
     (emit (if is64 (rv_srl rd rd rs) (rv_srlw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_ARSH 'BPF_X)
     (emit (if is64 (rv_sra rd rd rs) (rv_sraw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]

    ; dst = -dst
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_NEG)
     (emit (if is64 (rv_sub rd RV_REG_ZERO rd) (rv_subw rd RV_REG_ZERO rd)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]

    ; dst = BSWAP##imm(dst)
    [(list 'BPF_ALU 'BPF_END 'BPF_FROM_LE)
     (define shift (extract 11 0 (bvsub (bv 64 32) imm)))
     (emit (rv_slli rd rd shift) ctx)
     (emit (rv_srli rd rd shift) ctx)]
    [(list 'BPF_ALU 'BPF_END 'BPF_FROM_BE)
     (emit (rv_addi RV_REG_T2 RV_REG_ZERO 0) ctx)

     (emit (rv_andi RV_REG_T1 rd #xff) ctx)
     (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)
     (emit (rv_slli RV_REG_T2 RV_REG_T2 8) ctx)
     (emit (rv_srli rd rd 8) ctx)

     (when (! (equal? imm (bv 16 32)))
       (emit (rv_andi RV_REG_T1 rd #xff) ctx)
       (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)
       (emit (rv_slli RV_REG_T2 RV_REG_T2 8) ctx)
       (emit (rv_srli rd rd 8) ctx)

       (emit (rv_andi RV_REG_T1 rd #xff) ctx)
       (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)
       (emit (rv_slli RV_REG_T2 RV_REG_T2 8) ctx)
       (emit (rv_srli rd rd 8) ctx)

       (when (! (equal? imm (bv 32 32)))
         (emit (rv_andi RV_REG_T1 rd #xff) ctx)
         (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)
         (emit (rv_slli RV_REG_T2 RV_REG_T2 8) ctx)
         (emit (rv_srli rd rd 8) ctx)

         (emit (rv_andi RV_REG_T1 rd #xff) ctx)
         (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)
         (emit (rv_slli RV_REG_T2 RV_REG_T2 8) ctx)
         (emit (rv_srli rd rd 8) ctx)

         (emit (rv_andi RV_REG_T1 rd #xff) ctx)
         (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)
         (emit (rv_slli RV_REG_T2 RV_REG_T2 8) ctx)
         (emit (rv_srli rd rd 8) ctx)

         (emit (rv_andi RV_REG_T1 rd #xff) ctx)
         (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)
         (emit (rv_slli RV_REG_T2 RV_REG_T2 8) ctx)
         (emit (rv_srli rd rd 8) ctx)))

     (emit (rv_andi RV_REG_T1 rd #xff) ctx)
     (emit (rv_add RV_REG_T2 RV_REG_T2 RV_REG_T1) ctx)

     (emit (rv_addi rd RV_REG_T2 0) ctx)]

    ; dst = imm
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MOV 'BPF_K)
     (emit_imm rd imm ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]

    ; dst = dst OP imm
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_ADD 'BPF_K)
      (cond
        [(is_12b_int imm)
        (emit (if is64 (rv_addi rd rd imm) (rv_addiw rd rd imm)) ctx)]
        [else
        (emit_imm RV_REG_T1 imm ctx)
        (emit (if is64 (rv_add rd rd RV_REG_T1) (rv_addw rd rd RV_REG_T1)) ctx)])
      (when (! is64)
          (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_SUB 'BPF_K)
      (cond
        [(is_12b_int (bvneg imm))
          (emit (if is64 (rv_addi rd rd (bvneg imm))
                         (rv_addiw rd rd (bvneg imm))) ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit (if is64 (rv_sub rd rd RV_REG_T1)
                         (rv_subw rd rd RV_REG_T1)) ctx)])
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_AND 'BPF_K)
      (cond
        [(is_12b_int imm)
          (emit (rv_andi rd rd imm) ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit (rv_and rd rd RV_REG_T1) ctx)])
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_OR 'BPF_K)
      (cond
        [(is_12b_int imm)
          (emit (rv_ori rd rd imm) ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit (rv_or rd rd RV_REG_T1) ctx)])
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_XOR 'BPF_K)
      (cond
        [(is_12b_int imm)
          (emit (rv_xori rd rd imm) ctx)]
        [else
          (emit_imm RV_REG_T1 imm ctx)
          (emit (rv_xor rd rd RV_REG_T1) ctx)])
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MUL 'BPF_K)
      (emit_imm RV_REG_T1 imm ctx)
      (emit (if is64 (rv_mul rd rd RV_REG_T1)
                     (rv_mulw rd rd RV_REG_T1)) ctx)
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_DIV 'BPF_K)
      (emit_imm RV_REG_T1 imm ctx)
      (emit (if is64 (rv_divu rd rd RV_REG_T1)
                     (rv_divuw rd rd RV_REG_T1)) ctx)
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MOD 'BPF_K)
      (emit_imm RV_REG_T1 imm ctx)
      (emit (if is64 (rv_remu rd rd RV_REG_T1)
                     (rv_remuw rd rd RV_REG_T1)) ctx)
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_LSH 'BPF_K)
      (emit (if is64 (rv_slli rd rd imm) (rv_slliw rd rd imm)) ctx)
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_RSH 'BPF_K)
      (emit (if is64 (rv_srli rd rd imm) (rv_srliw rd rd imm)) ctx)
      (when (! is64)
        (emit_zext_32 rd ctx))]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_ARSH 'BPF_K)
     (emit (if is64 (rv_srai rd rd imm) (rv_sraiw rd rd imm)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]

    [(list 'BPF_JMP 'BPF_JA 'BPF_K)
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (sign-extend (rv_offset i off32 ctx) (bitvector 64)))
      (emit_jump_and_link RV_REG_ZERO rvoff #f ctx)]

    [(list (or 'BPF_JMP 'BPF_JMP32) code 'BPF_X)
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (rv_offset i off32 ctx))
      (when (! is64)
        (define s (context-ninsns ctx))
        (cond
          [(is_signed_bpf_cond code)
            (set!-values (rd rs) (emit_sext_32_rd_rs rd rs ctx))]
          [else
            (set!-values (rd rs) (emit_zext_32_rd_rs rd rs ctx))])
        (define e (context-ninsns ctx))
        (set! rvoff (bvsub rvoff (bvshl (bvsub e s) (bv 2 32)))))
      (cond
        [(equal? code 'BPF_JSET)
          (set! rvoff (bvsub rvoff (bv 4 32)))
          (emit (rv_and RV_REG_T1 rd rs) ctx)
          (emit_branch 'BPF_JNE RV_REG_T1 RV_REG_ZERO i rvoff ctx)]
        [else
          (emit_branch code rd rs i rvoff ctx)])]

    [(list (or 'BPF_JMP 'BPF_JMP32) code 'BPF_K)
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (rv_offset i off32 ctx))
      (define s (context-ninsns ctx))
      (emit_imm RV_REG_T1 imm ctx)
      (when (! is64)
        (cond
          [(is_signed_bpf_cond code)
            (set! rd (emit_sext_32_rd rd ctx))]
          [else
            (set! rd (emit_zext_32_rd_t1 rd ctx))]))
      (define e (context-ninsns ctx))
      (set! rvoff (bvsub rvoff (bvshl (bvsub e s) (bv 2 32))))
      (cond
        [(equal? code 'BPF_JSET)
          (set! rvoff (bvsub rvoff (bv 4 32)))
          (emit (rv_and RV_REG_T1 rd RV_REG_T1) ctx)
          (emit_branch 'BPF_JNE RV_REG_T1 RV_REG_ZERO i rvoff ctx)]
        [else
          (emit_branch code rd RV_REG_T1 i rvoff ctx)])]
  ))

(define (cpu-equal? b r)
  (define bpf-regs (bpf:cpu-regs b))
  (define regs
    (for/vector [(i (in-range (vector-length bpf-regs)))]
      (riscv:gpr-ref r (vector-ref regmap i))))
  (equal? (bpf:cpu-regs b) regs))

(define (init-rv64-cpu target-pc bpf-cpu)
  (define bpf-regs (bpf:cpu-regs bpf-cpu))
  (define riscv-cpu (riscv:init-cpu))
  (riscv:set-cpu-pc! riscv-cpu target-pc)
  (for ([i (in-range (vector-length bpf-regs))])
    (riscv:gpr-set! riscv-cpu (vector-ref regmap i) (vector-ref bpf-regs i)))
  riscv-cpu)


(define (fetch instrs base pc)
  (define n (bitvector->natural (bvudiv (bvsub pc base) (bv 4 64))))
  (cond
    [(term? n) #f]
    [(< n (vector-length instrs)) (vector-ref instrs n)]
    [else #f]))

(define (interpret-program base cpu instrs)
  ; cpu -> riscv cpu
  ; intrs -> vector of instructions
  (for/all ([pc (riscv:cpu-pc cpu) #:exhaustive])
    (begin
      (riscv:set-cpu-pc! cpu pc)
      (define instr (fetch instrs base pc))
      (for/all ([i instr #:exhaustive])
        (when i
          (riscv:interpret-instr cpu i)
          (interpret-program base cpu instrs))))))

(define (run-jitted-code riscv-cpu insns)
  (define base (riscv:cpu-pc riscv-cpu))
  (for/all ([insns insns #:exhaustive])
    (interpret-program base riscv-cpu insns)))


(define (check-jit code)
  (verify-jit-refinement
    code
    #:target-cpu-pc riscv:cpu-pc
    #:target-insn-size (bv 4 64)
    #:target-bitwidth 64
    #:init-cpu init-rv64-cpu
    #:equiv cpu-equal?
    #:run-code run-jitted-code
    #:run-jit emit_insn
    #:max-insn (bv #x100000 32)
    #:max-target-size (bv #x800000 32)))

(define-syntax-rule (jit-verify-case code)
  (test-case+ (format "VERIFY ~s" code) (check-jit code)))

(define-syntax-rule (jit-test-case code)
  (test-case+ (format "TEST ~s" code)
    (parameterize [(verify? #f)]
      (quickcheck (check-jit code)))))
