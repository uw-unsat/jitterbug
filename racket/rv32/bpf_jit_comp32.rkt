#lang rosette

(require
  rosette/lib/angelic
  serval/lib/unittest
  "../lib/emit.rkt"
  "../lib/bpf-common.rkt"
  "../lib/riscv-common.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in riscv: serval/riscv/base))

(provide (all-defined-out))

(define STACK_SIZE 32)

(define (stack-offset k)
  (- (- 4) (* k 4)))

(define regmap
  #((s2 . s1) ; R0
    (a1 . a0) ; R1
    (a3 . a2) ; R2
    (a5 . a4) ; R3
    (a7 . a6) ; R4
    (s4 . s3) ; R5
    (0 . 1) ; R6
    (2 . 3) ; R7
    (4 . 5) ; R8
    (6 . 7) ; R9
    (s6 . s5) ; FP
    (t3 . t2) ; TMP1
    (t5 . t4) ; TMP2
    (8 . 9) ; TCALL
    (10 . 11) ; AX
  ))

(define (bpf2rv32 r)
  (if (integer? r)
    (vector-ref regmap r)
    (vector-ref regmap (bpf:reg-idx r))))

(define (hi x) (car x))
(define (lo x) (cdr x))

(define (bpf_to_rv_reg_lo r)
  (cdr (bpf2rv32 r)))

(define (bpf_to_rv_reg_hi r)
  (car (bpf2rv32 r)))

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

(define (emit_imm rd val ctx)
  (define upper (bvashr (bvadd val (bvshl (bv 1 32) (bv 11 32))) (bv 12 32)))
  (define lower (bvand val (bv #xfff 32)))
  (cond
    [(equal? upper (bv 0 32))
     (emit (rv_addi rd RV_REG_ZERO lower) ctx)]
    [else
     (emit (rv_lui rd upper) ctx)
     (emit (rv_addi rd rd lower) ctx)]))

(define (emit_imm32 rd imm ctx)
  (emit_imm (lo rd) imm ctx)
  (if (bvsge imm (bv 0 32))
    (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)
    (emit (rv_addi (hi rd) RV_REG_ZERO -1) ctx)))

(define (comment s)
  (void))

(define (is_stacked r)
  (integer? r))

(define (riscv_bpf_get_reg64 reg tmp ctx)
  (assert (<=> (is_stacked (hi reg)) (is_stacked (lo reg))))
  (assert (&& (! (is_stacked (hi tmp))) (! (is_stacked (lo tmp)))))
  (cond
    [(is_stacked (hi reg))
      (emit (rv_lw (hi tmp) (stack-offset (hi reg)) RV_FP) ctx)
      (emit (rv_lw (lo tmp) (stack-offset (lo reg)) RV_FP) ctx)
      tmp]
    [else reg]))

(define (riscv_bpf_get_reg32 reg tmp ctx)
  (cond
    [(is_stacked (lo reg))
      (emit (rv_lw (lo tmp) (stack-offset (lo reg)) RV_FP) ctx)
      tmp]
    [else reg]))

(define (riscv_bpf_put_reg64 reg src ctx)
  (cond
    [(is_stacked (hi reg))
      (emit (rv_sw RV_FP (stack-offset (hi reg)) (hi src)) ctx)
      (emit (rv_sw RV_FP (stack-offset (lo reg)) (lo src)) ctx)]
    [(! (equal? (hi reg) (hi src)))
      (emit (rv_addi (hi reg) (hi src) 0) ctx)
      (emit (rv_addi (lo reg) (lo src) 0) ctx)]
    [else (void)]))

(define (riscv_bpf_put_reg32 reg src ctx)
  (cond
    [(is_stacked (hi reg))
      (emit (rv_sw RV_FP (stack-offset (hi reg)) RV_REG_ZERO) ctx)
      (emit (rv_sw RV_FP (stack-offset (lo reg)) (lo src)) ctx)]
    [else
      (emit (rv_addi (hi reg) RV_REG_ZERO 0) ctx)
      (emit (rv_addi (lo reg) (lo src) 0) ctx)]))

(define (emit_jump_and_link rd rvoff force_jalr ctx)
  (cond
    [(&& (! (bveq rvoff (bv 0 32)))
         (is_21b_int rvoff)
         (! force_jalr))
      (emit (rv_jal rd (bvashr rvoff (bv 1 32))) ctx)]
    [else
      (define upper (bvashr (bvadd rvoff (bvshl (bv 1 32) (bv 11 32))) (bv 12 32)))
      (define lower (bvand rvoff (bv #xfff 32)))
      (emit (rv_auipc RV_REG_T1 upper) ctx)
      (emit (rv_jalr rd RV_REG_T1 lower) ctx)]))

(define (emit_rv32_alu_i64 dst imm ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))

  (define rd (riscv_bpf_get_reg64 dst tmp1 ctx))

  (switch op #:id SWITCH_emit_rv32_alu_i64
    [(BPF_MOV)
      (emit_imm32 rd imm ctx)]

    [(BPF_AND)
      (cond
        [(is_12b_int imm)
          (emit (rv_andi (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_and (lo rd) (lo rd) RV_REG_T0) ctx)])
      (when (bvsge imm (bv 0 32))
        (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]

    [(BPF_OR)
      (cond
        [(is_12b_int imm)
          (emit (rv_ori (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_or (lo rd) (lo rd) RV_REG_T0) ctx)])
      (when (bvslt imm (bv 0 32))
        (emit (rv_ori (hi rd) RV_REG_ZERO -1) ctx))]

    [(BPF_XOR)
      (cond
        [(is_12b_int imm)
          (emit (rv_xori (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_xor (lo rd) (lo rd) RV_REG_T0) ctx)])
      (when (bvslt imm (bv 0 32))
        (emit (rv_xori (hi rd) (hi rd) -1) ctx))]

    [(BPF_LSH)
      (cond
        [(bvuge imm (bv 32 32))
          (emit (rv_slli (hi rd) (lo rd) (bvsub imm (bv 32 32))) ctx)
          (emit (rv_addi (lo rd) RV_REG_ZERO 0) ctx)]
        [(equal? imm (bv 0 32))
          (comment "/* nop */")]
        [else
          (emit (rv_srli RV_REG_T0 (lo rd) (bvsub (bv 32 32) imm)) ctx)
          (emit (rv_slli (hi rd) (hi rd) imm) ctx)
          (emit (rv_or (hi rd) RV_REG_T0 (hi rd)) ctx)
          (emit (rv_slli (lo rd) (lo rd) imm) ctx)])]

    [(BPF_RSH)
      (cond
        [(bvuge imm (bv 32 32))
          (emit (rv_srli (lo rd) (hi rd) (bvsub imm (bv 32 32))) ctx)
          (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)]
        [(equal? imm (bv 0 32))
          (comment "/* nop */")]
        [else
          (emit (rv_slli RV_REG_T0 (hi rd) (bvsub (bv 32 32) imm)) ctx)
          (emit (rv_srli (lo rd) (lo rd) imm) ctx)
          (emit (rv_or (lo rd) RV_REG_T0 (lo rd)) ctx)
          (emit (rv_srli (hi rd) (hi rd) imm) ctx)])]

    [(BPF_ARSH)
      (cond
        [(bvuge imm (bv 32 32))
          (emit (rv_srai (lo rd) (hi rd) (bvsub imm (bv 32 32))) ctx)
          (emit (rv_srai (hi rd) (hi rd) 31) ctx)]
        [(equal? imm (bv 0 32))
          (comment "/* nop */")]
        [else
          (emit (rv_slli RV_REG_T0 (hi rd) (bvsub (bv 32 32) imm)) ctx)
          (emit (rv_srli (lo rd) (lo rd) imm) ctx)
          (emit (rv_or (lo rd) RV_REG_T0 (lo rd)) ctx)
          (emit (rv_srai (hi rd) (hi rd) imm) ctx)])]
    )

  (riscv_bpf_put_reg64 dst rd ctx))


(define (emit_rv32_alu_i32 dst imm ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))

  (define rd (riscv_bpf_get_reg32 dst tmp1 ctx))

  (switch op #:id SWITCH_emit_rv32_alu_i32
    [(BPF_MOV)
      (emit_imm (lo rd) imm ctx)]
    [(BPF_ADD)
      (cond
        [(is_12b_int imm)
          (emit (rv_addi (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_add (lo rd) (lo rd) RV_REG_T0) ctx)])]
    [(BPF_SUB)
      (cond
        [(is_12b_int (bvneg imm))
          (emit (rv_addi (lo rd) (lo rd) (bvneg imm)) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_sub (lo rd) (lo rd) RV_REG_T0) ctx)])]
    [(BPF_AND)
      (cond
        [(is_12b_int imm)
          (emit (rv_andi (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_and (lo rd) (lo rd) RV_REG_T0) ctx)])]
    [(BPF_OR)
      (cond
        [(is_12b_int imm)
          (emit (rv_ori (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_or (lo rd) (lo rd) RV_REG_T0) ctx)])]
    [(BPF_XOR)
      (cond
        [(is_12b_int imm)
          (emit (rv_xori (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_xor (lo rd) (lo rd) RV_REG_T0) ctx)])]
    [(BPF_LSH)
      (cond
        [(is_12b_int imm)
          (emit (rv_slli (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_sll (lo rd) (lo rd) RV_REG_T0) ctx)])]
    [(BPF_RSH)
      (cond
        [(is_12b_int imm)
          (emit (rv_srli (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_srl (lo rd) (lo rd) RV_REG_T0) ctx)])]
    [(BPF_ARSH)
      (cond
        [(is_12b_int imm)
          (emit (rv_srai (lo rd) (lo rd) imm) ctx)]
        [else
          (emit_imm RV_REG_T0 imm ctx)
          (emit (rv_sra (lo rd) (lo rd) RV_REG_T0) ctx)])]
  )

  (riscv_bpf_put_reg32 dst rd ctx))


(define (emit_rv32_alu_r64 dst src ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define rd (riscv_bpf_get_reg64 dst tmp1 ctx))
  (define rs (riscv_bpf_get_reg64 src tmp2 ctx))

  (switch op #:id SWITCH_emit_rv32_alu_r64
    [(BPF_MOV)
      (emit (rv_addi (lo rd) (lo rs) 0) ctx)
      (emit (rv_addi (hi rd) (hi rs) 0) ctx)]

    [(BPF_ADD)
      (cond
        [(equal? rd rs)
          (emit (rv_srli RV_REG_T0 (lo rd) (bv 31 32)) ctx)
          (emit (rv_slli (hi rd) (hi rd) 1) ctx)
          (emit (rv_or (hi rd) RV_REG_T0 (hi rd)) ctx)
          (emit (rv_slli (lo rd) (lo rd) 1) ctx)]
        [else
          (emit (rv_add (lo rd) (lo rd) (lo rs)) ctx)
          (emit (rv_sltu RV_REG_T0 (lo rd) (lo rs)) ctx)
          (emit (rv_add (hi rd) (hi rd) (hi rs)) ctx)
          (emit (rv_add (hi rd) (hi rd) RV_REG_T0) ctx)])]

    [(BPF_SUB)
      (emit (rv_sub RV_REG_T1 (hi rd) (hi rs)) ctx)
      (emit (rv_sltu RV_REG_T0 (lo rd) (lo rs)) ctx)
      (emit (rv_sub (hi rd) RV_REG_T1 RV_REG_T0) ctx)
      (emit (rv_sub (lo rd) (lo rd) (lo rs)) ctx)]

    [(BPF_AND)
      (emit (rv_and (lo rd) (lo rd) (lo rs)) ctx)
      (emit (rv_and (hi rd) (hi rd) (hi rs)) ctx)]

    [(BPF_OR)
      (emit (rv_or (lo rd) (lo rd) (lo rs)) ctx)
      (emit (rv_or (hi rd) (hi rd) (hi rs)) ctx)]

    [(BPF_XOR)
      (emit (rv_xor (lo rd) (lo rd) (lo rs)) ctx)
      (emit (rv_xor (hi rd) (hi rd) (hi rs)) ctx)]

    [(BPF_MUL)
      (emit (rv_mul RV_REG_T0 (hi rs) (lo rd)) ctx)
      (emit (rv_mul (hi rd) (hi rd) (lo rs)) ctx)
      (emit (rv_mulhu RV_REG_T1 (lo rd) (lo rs)) ctx)
      (emit (rv_add (hi rd) (hi rd) RV_REG_T0) ctx)
      (emit (rv_mul (lo rd) (lo rd) (lo rs)) ctx)
      (emit (rv_add (hi rd) (hi rd) RV_REG_T1) ctx)]

    [(BPF_LSH)
      (emit (rv_addi RV_REG_T0 (lo rs) -32) ctx)
      (emit (rv_blt RV_REG_T0 RV_REG_ZERO 8) ctx)

      (emit (rv_sll (hi rd) (lo rd) RV_REG_T0) ctx)
      (emit (rv_addi (lo rd) RV_REG_ZERO 0) ctx)
      (emit (rv_jal RV_REG_ZERO 16) ctx)

      (emit (rv_addi RV_REG_T1 RV_REG_ZERO 31) ctx)
      (emit (rv_srli RV_REG_T0 (lo rd) 1) ctx)
      (emit (rv_sub RV_REG_T1 RV_REG_T1 (lo rs)) ctx)
      (emit (rv_srl RV_REG_T0 RV_REG_T0 RV_REG_T1) ctx)
      (emit (rv_sll (hi rd) (hi rd) (lo rs)) ctx)
      (emit (rv_or (hi rd) RV_REG_T0 (hi rd)) ctx)
      (emit (rv_sll (lo rd) (lo rd) (lo rs)) ctx)]

    [(BPF_RSH)
      (emit (rv_addi RV_REG_T0 (lo rs) -32) ctx)
      (emit (rv_blt RV_REG_T0 RV_REG_ZERO 8) ctx)

      (emit (rv_srl (lo rd) (hi rd) RV_REG_T0) ctx)
      (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)
      (emit (rv_jal RV_REG_ZERO 16) ctx)

      (emit (rv_addi RV_REG_T1 RV_REG_ZERO 31) ctx)
      (emit (rv_slli RV_REG_T0 (hi rd) 1) ctx)
      (emit (rv_sub RV_REG_T1 RV_REG_T1 (lo rs)) ctx)
      (emit (rv_sll RV_REG_T0 RV_REG_T0 RV_REG_T1) ctx)
      (emit (rv_srl (lo rd) (lo rd) (lo rs)) ctx)
      (emit (rv_or (lo rd) RV_REG_T0 (lo rd)) ctx)
      (emit (rv_srl (hi rd) (hi rd) (lo rs)) ctx)]

    [(BPF_ARSH)
      (emit (rv_addi RV_REG_T0 (lo rs) -32) ctx)
      (emit (rv_blt RV_REG_T0 RV_REG_ZERO 8) ctx)

      (emit (rv_sra (lo rd) (hi rd) RV_REG_T0) ctx)
      (emit (rv_srai (hi rd) (hi rd) #x1f) ctx)
      (emit (rv_jal RV_REG_ZERO 16) ctx)

      (emit (rv_addi RV_REG_T1 RV_REG_ZERO 31) ctx)
      (emit (rv_slli RV_REG_T0 (hi rd) 1) ctx)
      (emit (rv_sub RV_REG_T1 RV_REG_T1 (lo rs)) ctx)
      (emit (rv_sll RV_REG_T0 RV_REG_T0 RV_REG_T1) ctx)
      (emit (rv_srl (lo rd) (lo rd) (lo rs)) ctx)
      (emit (rv_or (lo rd) RV_REG_T0 (lo rd)) ctx)
      (emit (rv_sra (hi rd) (hi rd) (lo rs)) ctx)]

    [(BPF_NEG)
      (emit (rv_sub (lo rd) RV_REG_ZERO (lo rd)) ctx)
      (emit (rv_sltu RV_REG_T0 RV_REG_ZERO (lo rd)) ctx)
      (emit (rv_sub (hi rd) RV_REG_ZERO (hi rd)) ctx)
      (emit (rv_sub (hi rd) (hi rd) RV_REG_T0) ctx)]
  )

  (riscv_bpf_put_reg64 dst rd ctx))


(define (emit_rv32_alu_r32 dst src ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define rd (riscv_bpf_get_reg32 dst tmp1 ctx))
  (define rs (riscv_bpf_get_reg32 src tmp2 ctx))

  (switch op #:id SWITCH_emit_rv32_alu_r32
    [(BPF_MOV)
      (emit (rv_addi (lo rd) (lo rs) 0) ctx)]
    [(BPF_ADD)
      (emit (rv_add (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_SUB)
      (emit (rv_sub (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_AND)
      (emit (rv_and (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_OR)
      (emit (rv_or (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_XOR)
      (emit (rv_xor (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_MUL)
      (emit (rv_mul (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_DIV)
      (emit (rv_divu (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_MOD)
      (emit (rv_remu (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_LSH)
      (emit (rv_sll (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_RSH)
      (emit (rv_srl (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_ARSH)
      (emit (rv_sra (lo rd) (lo rd) (lo rs)) ctx)]
    [(BPF_NEG)
      (emit (rv_sub (lo rd) RV_REG_ZERO (lo rd)) ctx)]
  )

  (riscv_bpf_put_reg32 dst rd ctx))

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

(define (emit_bcc op rd rs rvoff ctx)
  (define s (context-ninsns ctx))
  (define far #f)

  (cond
    [(equal? op 'BPF_JSET)
      (set! far #t)]
    [(! (is_13b_int rvoff))
      (set! op (invert_bpf_cond op))
      (set! far #t)])

  (define off (if far (bv 6 32) (bvashr rvoff (bv 1 32))))

  (switch op #:id SWITCH_emit_bcc
    [(BPF_JEQ)
      (emit (rv_beq rd rs off) ctx)]
    [(BPF_JGT)
      (emit (rv_bgtu rd rs off) ctx)]
    [(BPF_JLT)
      (emit (rv_bltu rd rs off) ctx)]
    [(BPF_JGE)
      (emit (rv_bgeu rd rs off) ctx)]
    [(BPF_JLE)
      (emit (rv_bleu rd rs off) ctx)]
    [(BPF_JNE)
      (emit (rv_bne rd rs off) ctx)]
    [(BPF_JSGT)
      (emit (rv_bgt rd rs off) ctx)]
    [(BPF_JSLT)
      (emit (rv_blt rd rs off) ctx)]
    [(BPF_JSGE)
      (emit (rv_bge rd rs off) ctx)]
    [(BPF_JSLE)
      (emit (rv_ble rd rs off) ctx)]
    [(BPF_JSET)
      (emit (rv_and RV_REG_T0 rd rs) ctx)
      (emit (rv_beq RV_REG_T0 RV_REG_ZERO off) ctx)])

    (when far
      (define e (context-ninsns ctx))
      (set! rvoff (bvsub rvoff (bvshl (bvsub e s) (bv 2 32))))
      (emit_jump_and_link RV_REG_ZERO rvoff #t ctx))
)

(define (emit_rv32_branch_r32 src1 src2 rvoff ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define s (context-ninsns ctx))

  (define rs1 (riscv_bpf_get_reg32 src1 tmp1 ctx))
  (define rs2 (riscv_bpf_get_reg32 src2 tmp2 ctx))

  (define e (context-ninsns ctx))
  (set! rvoff (bvsub rvoff (bvshl (bvsub e s) (bv 2 32))))

  (emit_bcc op (lo rs1) (lo rs2) rvoff ctx))


(define (emit_rv32_branch_r64 src1 src2 rvoff ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define s (context-ninsns ctx))

  (define rs1 (riscv_bpf_get_reg64 src1 tmp1 ctx))
  (define rs2 (riscv_bpf_get_reg64 src2 tmp2 ctx))

  (define (NO_JUMP idx) (+ 6 (* 2 idx)))
  (define (JUMP idx) (+ 2 (* 2 idx)))

  (switch op #:id SWITCH_emit_rv32_branch_r64

    [(BPF_JEQ)
      (emit (rv_bne (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bne (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JGT)
      (emit (rv_bgtu (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_bltu (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bleu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JLT)
      (emit (rv_bltu (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_bgtu (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bgeu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JGE)
      (emit (rv_bgtu (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_bltu (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bltu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JLE)
      (emit (rv_bltu (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_bgtu (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bgtu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JNE)
      (emit (rv_bne (hi rs1) (hi rs2) (JUMP 1)) ctx)
      (emit (rv_beq (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JSGT)
      (emit (rv_bgt (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_blt (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bleu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JSLT)
      (emit (rv_blt (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_bgt (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bgeu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JSGE)
      (emit (rv_bgt (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_blt (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bltu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JSLE)
      (emit (rv_blt (hi rs1) (hi rs2) (JUMP 2)) ctx)
      (emit (rv_bgt (hi rs1) (hi rs2) (NO_JUMP 1)) ctx)
      (emit (rv_bgtu (lo rs1) (lo rs2) (NO_JUMP 0)) ctx)]
    [(BPF_JSET)
      (emit (rv_and RV_REG_T0 (hi rs1) (hi rs2)) ctx)
      (emit (rv_bne RV_REG_T0 RV_REG_ZERO (JUMP 2)) ctx)
      (emit (rv_and RV_REG_T0 (lo rs1) (lo rs2)) ctx)
      (emit (rv_beq RV_REG_T0 RV_REG_ZERO (NO_JUMP 0)) ctx)]
    )

  (define e (context-ninsns ctx))
  (set! rvoff (bvsub rvoff (bvshl (bvsub e s) (bv 2 32))))
  (emit_jump_and_link RV_REG_ZERO rvoff #t ctx))

(define (emit_rv32_rev16 rd ctx)
  (begin/c #:id BLOCK_emit_rv32_rev16
    (emit (rv_slli rd rd 16) ctx)
    (emit (rv_slli RV_REG_T1 rd 8) ctx)
    (emit (rv_srli rd rd 8) ctx)
    (emit (rv_add RV_REG_T1 rd RV_REG_T1) ctx)
    (emit (rv_srli rd RV_REG_T1 16) ctx)))

(define (emit_rv32_rev32 rd ctx)
  (begin/c #:id BLOCK_emit_rv32_rev32
    (emit (rv_addi RV_REG_T1 RV_REG_ZERO 0) ctx)

    (emit (rv_andi RV_REG_T0 rd #xff) ctx)
    (emit (rv_add RV_REG_T1 RV_REG_T1 RV_REG_T0) ctx)
    (emit (rv_slli RV_REG_T1 RV_REG_T1 8) ctx)
    (emit (rv_srli rd rd 8) ctx)

    (emit (rv_andi RV_REG_T0 rd #xff) ctx)
    (emit (rv_add RV_REG_T1 RV_REG_T1 RV_REG_T0) ctx)
    (emit (rv_slli RV_REG_T1 RV_REG_T1 8) ctx)
    (emit (rv_srli rd rd 8) ctx)

    (emit (rv_andi RV_REG_T0 rd #xff) ctx)
    (emit (rv_add RV_REG_T1 RV_REG_T1 RV_REG_T0) ctx)
    (emit (rv_slli RV_REG_T1 RV_REG_T1 8) ctx)
    (emit (rv_srli rd rd 8) ctx)
    (emit (rv_andi RV_REG_T0 rd #xff) ctx)
    (emit (rv_add RV_REG_T1 RV_REG_T1 RV_REG_T0) ctx)

    (emit (rv_addi rd RV_REG_T1 0) ctx)))

(define (run-jit insn code dst src off imm ctx)

  (set! dst (bpf2rv32 dst))
  (set! src (bpf2rv32 src))
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define is64 (|| (equal? (BPF_CLASS code) 'BPF_ALU64)
                   (equal? (BPF_CLASS code) 'BPF_JMP)))

  (match code

    [(list 'BPF_ALU64 code 'BPF_X)
      (emit_rv32_alu_r64 dst src ctx code)]

    [(list 'BPF_ALU64 (and code (or 'BPF_ADD 'BPF_SUB 'BPF_MUL 'BPF_DIV 'BPF_MOD)) 'BPF_K)
      (emit_imm32 tmp2 imm ctx)
      (emit_rv32_alu_r64 dst tmp2 ctx code)]

    [(list 'BPF_ALU64 code 'BPF_K)
      (emit_rv32_alu_i64 dst imm ctx code)]

    [(list 'BPF_ALU64 (and code 'BPF_NEG))
      (emit_rv32_alu_r64 dst (bpf2rv32 0) ctx code)]

    [(list 'BPF_ALU code 'BPF_X)
      (emit_rv32_alu_r32 dst src ctx code)]

    [(list 'BPF_ALU (and code (or 'BPF_DIV 'BPF_MOD 'BPF_MUL)) 'BPF_K)
      (emit_imm32 tmp2 imm ctx)
      (emit_rv32_alu_r32 dst tmp2 ctx code)]

    [(list 'BPF_ALU code 'BPF_K)
      (emit_rv32_alu_i32 dst imm ctx code)]

    [(list 'BPF_ALU (and code 'BPF_NEG))
      (emit_rv32_alu_r32 dst (bpf2rv32 0) ctx code)]

    [(list 'BPF_JMP 'BPF_JA 'BPF_K)
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (rv_offset insn off32 ctx))
      (emit_jump_and_link RV_REG_ZERO rvoff #f ctx)]

    [(list (and class (or 'BPF_JMP 'BPF_JMP32)) code (and source (or 'BPF_X 'BPF_K)))
      (define rvoff (rv_offset insn (sign-extend off (bitvector 32)) ctx))
      (when (equal? source 'BPF_K)
        (define s (context-ninsns ctx))
        (emit_imm32 tmp2 imm ctx)
        (set! src tmp2)
        (define e (context-ninsns ctx))
        (set! rvoff (bvsub rvoff (bvshl (bvsub e s) (bv 2 32)))))
      (if is64
        (emit_rv32_branch_r64 dst src rvoff ctx code)
        (emit_rv32_branch_r32 dst src rvoff ctx code))]

    [(list 'BPF_ALU 'BPF_END 'BPF_FROM_LE)
      (define rd (riscv_bpf_get_reg64 dst tmp1 ctx))

      (cond
        [(equal? imm (bv 16 32))
          (emit (rv_slli (lo rd) (lo rd) 16) ctx)
          (emit (rv_srli (lo rd) (lo rd) 16) ctx)
          (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)]
        [(equal? imm (bv 32 32))
          (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)]
        [(equal? imm (bv 64 32))
          (comment "/* Do nothing */")]
        [else
          (assert #f)])

      (riscv_bpf_put_reg64 dst rd ctx)]

    [(list 'BPF_ALU 'BPF_END 'BPF_FROM_BE)
      (define rd (riscv_bpf_get_reg64 dst tmp1 ctx))

      (cond
        [(equal? imm (bv 16 32))
          (emit_rv32_rev16 (lo rd) ctx)
          (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)]
        [(equal? imm (bv 32 32))
          (emit_rv32_rev32 (lo rd) ctx)
          (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)]
        [(equal? imm (bv 64 32))
          (comment "/* Swap upper and lower halves. */")
          (emit (rv_addi RV_REG_T0 (lo rd) 0) ctx)
          (emit (rv_addi (lo rd) (hi rd) 0) ctx)
          (emit (rv_addi (hi rd) RV_REG_T0 0) ctx)

          (comment "/* Swap each half */")
          (emit_rv32_rev32 (lo rd) ctx)
          (emit_rv32_rev32 (hi rd) ctx)]
        [else (assert #f)])

      (riscv_bpf_put_reg64 dst rd ctx)]

    [else (assert #f)])

  (context-insns ctx))
