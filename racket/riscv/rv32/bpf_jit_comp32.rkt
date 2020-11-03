#lang rosette

(require
  "../../lib/extraction/c.rkt"
  "../../lib/bpf-common.rkt"
  "../impl-common.rkt"
  "../../common.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in riscv: serval/riscv/base))

(provide
  RV_REG_TCC BPF_JIT_SCRATCH_REGS
  NR_SAVED_REGISTERS
  bpf2rv32 emit_insn is_stacked
  bpf_jit_build_prologue bpf_jit_build_epilogue)


(define BPF_R6_HI 0)
(define BPF_R6_LO 1)
(define BPF_R7_HI 2)
(define BPF_R7_LO 3)
(define BPF_R8_HI 4)
(define BPF_R8_LO 5)
(define BPF_R9_HI 6)
(define BPF_R9_LO 7)
(define BPF_AX_HI 8)
(define BPF_AX_LO 9)
(define BPF_JIT_SCRATCH_REGS 10)

(define NR_SAVED_REGISTERS 9)

(define (STACK_OFFSET k) (bv (- (- 4) (* 4 NR_SAVED_REGISTERS) (* 4 k)) 32))

(define TMP_REG_1 'tmp1)
(define TMP_REG_2 'tmp2)

(define RV_REG_TCC 't6)
(define RV_REG_TCC_SAVED 's7)

(define regmap (list
    (cons BPF_REG_0 (cons RV_REG_S2 RV_REG_S1))
    (cons BPF_REG_1 (cons RV_REG_A1 RV_REG_A0))
    (cons BPF_REG_2 (cons RV_REG_A3 RV_REG_A2))
    (cons BPF_REG_3 (cons RV_REG_A5 RV_REG_A4))
    (cons BPF_REG_4 (cons RV_REG_A7 RV_REG_A6))
    (cons BPF_REG_5 (cons RV_REG_S4 RV_REG_S3))
    (cons BPF_REG_6 (cons (STACK_OFFSET BPF_R6_HI) (STACK_OFFSET BPF_R6_LO)))
    (cons BPF_REG_7 (cons (STACK_OFFSET BPF_R7_HI) (STACK_OFFSET BPF_R7_LO)))
    (cons BPF_REG_8 (cons (STACK_OFFSET BPF_R8_HI) (STACK_OFFSET BPF_R8_LO)))
    (cons BPF_REG_9 (cons (STACK_OFFSET BPF_R9_HI) (STACK_OFFSET BPF_R9_LO)))
    (cons BPF_REG_FP (cons RV_REG_S6 RV_REG_S5))
    (cons BPF_REG_AX (cons (STACK_OFFSET BPF_AX_HI) (STACK_OFFSET BPF_AX_LO)))
    (cons TMP_REG_1 (cons RV_REG_T3 RV_REG_T2))
    (cons TMP_REG_2 (cons RV_REG_T5 RV_REG_T4))
  ))

(define (bpf2rv32 r)
  (cdr (assoc r regmap)))

(define (hi x) (car x))
(define (lo x) (cdr x))

(define (emit_imm rd imm ctx)
  (define upper (bvashr (bvadd imm (bvshl (bv 1 32) (bv 11 32))) (bv 12 32)))
  (define lower (bvand imm (bv #xfff 32)))

  (cond
    [(! (bvzero? upper))
      (emit (rv_lui rd upper) ctx)
      (emit (rv_addi rd rd lower) ctx)]
    [else
      (emit (rv_addi rd RV_REG_ZERO lower) ctx)]))

(func (emit_imm32 rd imm ctx)
  (comment "/* Emit immediate into lower bits. */")
  (emit_imm (lo rd) imm ctx)
  (blank)
  (comment "/* Sign-extend into upper bits. */")
  (if (bvsge imm (bv 0 32))
    (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)
    (emit (rv_addi (hi rd) RV_REG_ZERO -1) ctx)))

(func (emit_imm64 rd imm_hi imm_lo ctx)
  (emit_imm (lo rd) imm_lo ctx)
  (emit_imm (hi rd) imm_hi ctx))

(func (__build_epilogue is_tail_call ctx)
  (var [stack_adjust (->stack_size ctx)]
       [r0 (@ bpf2rv32 BPF_REG_0)])

  (comment "/* Set return value if not tail call. */")
  (when (! is_tail_call)
    (emit (rv_addi RV_REG_A0 (lo r0) 0) ctx)
    (emit (rv_addi RV_REG_A1 (hi r0) 0) ctx))

  (blank)
  (comment "/* Restore callee-saved registers. */")
  (emit (rv_lw RV_REG_RA (bvsub stack_adjust (bv 4 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_FP (bvsub stack_adjust (bv 8 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_S1 (bvsub stack_adjust (bv 12 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_S2 (bvsub stack_adjust (bv 16 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_S3 (bvsub stack_adjust (bv 20 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_S4 (bvsub stack_adjust (bv 24 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_S5 (bvsub stack_adjust (bv 28 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_S6 (bvsub stack_adjust (bv 32 32)) RV_REG_SP) ctx)
  (emit (rv_lw RV_REG_S7 (bvsub stack_adjust (bv 36 32)) RV_REG_SP) ctx)

  (blank)
  (emit (rv_addi RV_REG_SP RV_REG_SP stack_adjust) ctx)

  (blank)
  (cond
    [is_tail_call
      (comment "/*"
               " * goto *(t0 + 4);"
               " * Skips first instruction of prologue which initializes tail"
               " * call counter. Assumes t0 contains address of target program,"
               " * see emit_bpf_tail_call."
               " */")
      (emit (rv_jalr RV_REG_ZERO RV_REG_T0 4) ctx)]
    [else
      (emit (rv_jalr RV_REG_ZERO RV_REG_RA 0) ctx)]))


(define (is_stacked r)
  (bv? r))

(func (bpf_get_reg64 reg tmp ctx)
  (when (is_stacked (hi reg))
    (emit (rv_lw (hi tmp) (hi reg) RV_REG_FP) ctx)
    (emit (rv_lw (lo tmp) (lo reg) RV_REG_FP) ctx)
    (set! reg tmp))
  reg)

(func (bpf_put_reg64 reg src ctx)
  (when (is_stacked (hi reg))
    (emit (rv_sw RV_REG_FP (hi reg) (hi src)) ctx)
    (emit (rv_sw RV_REG_FP (lo reg) (lo src)) ctx)))

(func (bpf_get_reg32 reg tmp ctx)
  (when (is_stacked (lo reg))
    (emit (rv_lw (lo tmp) (lo reg) RV_REG_FP) ctx)
    (set! reg tmp))
  reg)

(func (bpf_put_reg32 reg src ctx)
  (cond
    [(is_stacked (lo reg))
      (emit (rv_sw RV_REG_FP (lo reg) (lo src)) ctx)
      (when (! (->prog->aux->verifier_zext ctx))
        (emit (rv_sw RV_REG_FP (hi reg) RV_REG_ZERO) ctx))]
    [(! (->prog->aux->verifier_zext ctx))
      (emit (rv_addi (hi reg) RV_REG_ZERO 0) ctx)]))

(define (emit_jump_and_link rd rvoff force_jalr ctx)
  (cond
    [(&& (! (equal? rvoff (bv 0 32)))
         (is_21b_int rvoff)
         (! force_jalr))
      (emit (rv_jal rd (bvashr rvoff (bv 1 32))) ctx)]
    [else
      (define upper (bvashr (bvadd rvoff (bvshl (bv 1 32) (bv 11 32))) (bv 12 32)))
      (define lower (bvand rvoff (bv #xfff 32)))
      (emit (rv_auipc RV_REG_T1 upper) ctx)
      (emit (rv_jalr rd RV_REG_T1 lower) ctx)]))

(func (emit_alu_i64 dst imm ctx op)
  (var [tmp1 (@ bpf2rv32 TMP_REG_1)]
       [rd   (bpf_get_reg64 dst tmp1 ctx)])

  (switch op
    [(BPF_MOV)
      (emit_imm32 rd imm ctx)]

    ; Leave BPF_ADD/BPF_SUB (64-bit) with imm out, as special handling
    ; doesn't save instructions.  For example, for BPF_ADD we need to load
    ; either (lo rd) or imm to a temporary register to check for overflow
    ; (for calculating the upper 32 bits).  Juse reuse emit_alu_r64.

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
          (comment "/* Do nothing. */")]
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
          (comment "/* Do nothing. */")]
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
          (comment "/* Do nothing. */")]
        [else
          (emit (rv_slli RV_REG_T0 (hi rd) (bvsub (bv 32 32) imm)) ctx)
          (emit (rv_srli (lo rd) (lo rd) imm) ctx)
          (emit (rv_or (lo rd) RV_REG_T0 (lo rd)) ctx)
          (emit (rv_srai (hi rd) (hi rd) imm) ctx)])])

  (blank)
  (bpf_put_reg64 dst rd ctx))

(func (emit_alu_i32 dst imm ctx op)
  (var [tmp1 (@ bpf2rv32 TMP_REG_1)]
       [rd   (bpf_get_reg32 dst tmp1 ctx)])

  (switch op
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
          (emit (rv_sra (lo rd) (lo rd) RV_REG_T0) ctx)])])

  (blank)
  (bpf_put_reg32 dst rd ctx))

(func (emit_alu_r64 dst src ctx op)
  (var [tmp1 (@ bpf2rv32 TMP_REG_1)]
       [tmp2 (@ bpf2rv32 TMP_REG_2)]
       [rd   (bpf_get_reg64 dst tmp1 ctx)]
       [rs   (bpf_get_reg64 src tmp2 ctx)])

  (switch op
    [(BPF_MOV)
      (emit (rv_addi (lo rd) (lo rs) 0) ctx)
      (emit (rv_addi (hi rd) (hi rs) 0) ctx)]

    [(BPF_ADD)
      (cond
        [(equal? rd rs)
          (emit (rv_srli RV_REG_T0 (lo rd) 31) ctx)
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
      (emit (rv_sub (hi rd) (hi rd) RV_REG_T0) ctx)])

  (blank)
  (bpf_put_reg64 dst rd ctx))

(func (emit_alu_r32 dst src ctx op)
  (var [tmp1 (@ bpf2rv32 TMP_REG_1)]
       [tmp2 (@ bpf2rv32 TMP_REG_2)]
       [rd   (bpf_get_reg32 dst tmp1 ctx)]
       [rs   (bpf_get_reg32 src tmp2 ctx)])

  (switch op
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
      (emit (rv_sub (lo rd) RV_REG_ZERO (lo rd)) ctx)])

  (blank)
  (bpf_put_reg32 dst rd ctx))

(define (emit_branch_r64 src1 src2 rvoff ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define s (context-ninsns ctx))

  (define rs1 (bpf_get_reg64 src1 tmp1 ctx))
  (define rs2 (bpf_get_reg64 src2 tmp2 ctx))

  (define (NO_JUMP idx) (+ 6 (* 2 idx)))
  (define (JUMP idx) (+ 2 (* 2 idx)))

  (switch op #:id SWITCH_emit_branch_r64

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
      (emit (rv_beq RV_REG_T0 RV_REG_ZERO (NO_JUMP 0)) ctx)])

  (define e (context-ninsns ctx))
  (set! rvoff (bvsub rvoff (ninsns_rvoff (bvsub e s))))
  (emit_jump_and_link RV_REG_ZERO rvoff #t ctx))

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
      (set! rvoff (bvsub rvoff (ninsns_rvoff (bvsub e s))))
      (emit_jump_and_link RV_REG_ZERO rvoff #t ctx)))

(define (emit_branch_r32 src1 src2 rvoff ctx op)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define s (context-ninsns ctx))

  (define rs1 (bpf_get_reg32 src1 tmp1 ctx))
  (define rs2 (bpf_get_reg32 src2 tmp2 ctx))

  (define e (context-ninsns ctx))
  (set! rvoff (bvsub rvoff (ninsns_rvoff (bvsub e s))))

  (emit_bcc op (lo rs1) (lo rs2) rvoff ctx))

(define (emit_call fixed addr ctx)
  (define r0 (bpf2rv32 BPF_REG_0))
  (define r5 (bpf2rv32 BPF_REG_5))

  (define addr32 (extract 31 0 addr))

  (define upper (bvlshr (bvadd addr32
                               (bvshl (bv 1 32)
                                      (bv 11 32)))
                        (bv 12 32)))
  (define lower (bvand addr32 (bv #xfff 32)))

  (begin/c #:id BLOCK_emit_call
  (comment "/* R1-R4 already in correct registers---need to push R5 to stack. */")
  (emit (rv_addi RV_REG_SP RV_REG_SP -16) ctx)
  (emit (rv_sw RV_REG_SP 0 (lo r5)) ctx)
  (emit (rv_sw RV_REG_SP 4 (hi r5)) ctx)

  (blank)
  (comment "/* Backup TCC. */")
  (emit (rv_addi RV_REG_TCC_SAVED RV_REG_TCC 0) ctx)

  (blank)
  (comment "/*"
           " * Use lui/jalr pair to jump to absolute address. Don't use emit_imm as"
           " * the number of emitted instructions should not depend on the value of"
           " * addr."
           " */")
  (emit (rv_lui RV_REG_T1 upper) ctx)
  (emit (rv_jalr RV_REG_RA RV_REG_T1 lower) ctx)

  (blank)
  (comment "/* Restore TCC. */")
  (emit (rv_addi RV_REG_TCC RV_REG_TCC_SAVED 0) ctx)

  (blank)
  (comment "/* Set return value and restore stack. */")
  (emit (rv_addi (lo r0) RV_REG_A0 0) ctx)
  (emit (rv_addi (hi r0) RV_REG_A1 0) ctx)
  (emit (rv_addi RV_REG_SP RV_REG_SP 16) ctx)))

(define (emit_bpf_tail_call insn insn-idx ctx)

  (define start_insn (context-ninsns ctx))
  (define arr_reg (bpf2rv32 BPF_REG_2))
  (define idx_reg (bpf2rv32 BPF_REG_3))

  (define offset (context-offset ctx))
  (define tc_insn
    (if (! (bvzero? insn-idx))
        (bvsub (offset insn-idx) (offset (bvsub1 insn-idx)))
        (offset (bv 0 32))))

  (define off (bv 0 32))
  (core:bug-on (! (is_12b_int off)) #:msg "tail call")
  (emit (rv_lw RV_REG_T1 off (lo arr_reg)) ctx)

  (set! off (ninsns_rvoff (bvsub tc_insn (bvsub (context-ninsns ctx) start_insn))))
  (emit_bcc 'BPF_JGE (lo idx_reg) RV_REG_T1 off ctx)

  (emit (rv_addi RV_REG_T1 RV_REG_TCC -1) ctx)
  (set! off (ninsns_rvoff (bvsub tc_insn (bvsub (context-ninsns ctx) start_insn))))
  (emit_bcc 'BPF_JSLT RV_REG_TCC RV_REG_ZERO off ctx)

  (emit (rv_slli RV_REG_T0 (lo idx_reg) 2) ctx)
  (emit (rv_add RV_REG_T0 RV_REG_T0 (lo arr_reg)) ctx)
  (set! off (bv 8 32)) ; TODO use real offsetof
  (emit (rv_lw RV_REG_T0 off RV_REG_T0) ctx)
  (set! off (ninsns_rvoff (bvsub tc_insn (bvsub (context-ninsns ctx) start_insn))))
  (emit_bcc 'BPF_JEQ RV_REG_T0 RV_REG_ZERO off ctx)

  (set! off (bv 0 32))
  (emit (rv_lw RV_REG_T0 off RV_REG_T0) ctx)
  (emit (rv_addi RV_REG_TCC RV_REG_T1 0) ctx)

  (__build_epilogue #t ctx)
  (void))

(func (emit_load_r64 dst src off ctx size)
  (var [tmp1 (@ bpf2rv32 TMP_REG_1)]
       [tmp2 (@ bpf2rv32 TMP_REG_2)]
       [rd (bpf_get_reg64 dst tmp1 ctx)]
       [rs (bpf_get_reg64 src tmp2 ctx)])

  (emit_imm RV_REG_T0 (sign-extend off (bitvector 32)) ctx)
  (emit (rv_add RV_REG_T0 RV_REG_T0 (lo rs)) ctx)
  (blank)

  (switch size
    [(BPF_B)
      (emit (rv_lbu (lo rd) 0 RV_REG_T0) ctx)
      (when (! (->prog->aux->verifier_zext ctx))
        (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]
    [(BPF_H)
      (emit (rv_lhu (lo rd) 0 RV_REG_T0) ctx)
      (when (! (->prog->aux->verifier_zext ctx))
        (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]
    [(BPF_W)
      (emit (rv_lw (lo rd) 0 RV_REG_T0) ctx)
      (when (! (->prog->aux->verifier_zext ctx))
        (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]
    [(BPF_DW)
      (emit (rv_lw (lo rd) 0 RV_REG_T0) ctx)
      (emit (rv_lw (hi rd) 4 RV_REG_T0) ctx)])

  (blank)
  (bpf_put_reg64 dst rd ctx)
  0)

(define (emit_store_r64 dst src off ctx size mode)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define rd (bpf_get_reg64 dst tmp1 ctx))
  (define rs (bpf_get_reg64 src tmp2 ctx))

  (emit_imm RV_REG_T0 (sign-extend off (bitvector 32)) ctx)
  (emit (rv_add RV_REG_T0 RV_REG_T0 (lo rd)) ctx)

  (switch size #:id SWITCH_emit_store_r64
    [(BPF_B)
      (emit (rv_sb RV_REG_T0 0 (lo rs)) ctx)]
    [(BPF_H)
      (emit (rv_sh RV_REG_T0 0 (lo rs)) ctx)]
    [(BPF_W)
      (case mode
        [(BPF_MEM)
          (emit (rv_sw RV_REG_T0 0 (lo rs)) ctx)]
        [(BPF_XADD)
          (emit (rv_amoadd_w RV_REG_ZERO (lo rs) RV_REG_T0 0 0) ctx)])]
    [(BPF_DW)
      (emit (rv_sw RV_REG_T0 0 (lo rs)) ctx)
      (emit (rv_sw RV_REG_T0 4 (hi rs)) ctx)]))

(func (emit_rev16 rd ctx)
  (emit (rv_slli rd rd 16) ctx)
  (emit (rv_slli RV_REG_T1 rd 8) ctx)
  (emit (rv_srli rd rd 8) ctx)
  (emit (rv_add RV_REG_T1 rd RV_REG_T1) ctx)
  (emit (rv_srli rd RV_REG_T1 16) ctx))

(func (emit_rev32 rd ctx)
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

  (emit (rv_addi rd RV_REG_T1 0) ctx))

(define (emit_zext64 dst ctx)
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define rd (bpf_get_reg64 dst tmp1 ctx))
  (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx)
  (bpf_put_reg64 dst rd ctx))

(define (emit_insn insn-idx insn next-insn ctx)
  (define code (bpf:insn-code insn))
  (define dst (bpf:insn-dst insn))
  (define src (bpf:insn-src insn))
  (define off (bpf:insn-off insn))
  (define imm (bpf:insn-imm insn))

  (set! dst (bpf2rv32 dst))
  (set! src (bpf2rv32 src))
  (define tmp1 (bpf2rv32 TMP_REG_1))
  (define tmp2 (bpf2rv32 TMP_REG_2))

  (define is64 (|| (equal? (BPF_CLASS code) 'BPF_ALU64)
                   (equal? (BPF_CLASS code) 'BPF_JMP)))

  (case code

    [((BPF_ALU64 BPF_MOV BPF_X)

      (BPF_ALU64 BPF_ADD BPF_X)
      (BPF_ALU64 BPF_ADD BPF_K)

      (BPF_ALU64 BPF_SUB BPF_X)
      (BPF_ALU64 BPF_SUB BPF_K)

      (BPF_ALU64 BPF_AND BPF_X)
      (BPF_ALU64 BPF_OR BPF_X)
      (BPF_ALU64 BPF_XOR BPF_X)

      (BPF_ALU64 BPF_MUL BPF_X)
      (BPF_ALU64 BPF_MUL BPF_K)

      (BPF_ALU64 BPF_LSH BPF_X)
      (BPF_ALU64 BPF_RSH BPF_X)
      (BPF_ALU64 BPF_ARSH BPF_X))

      (when (equal? (BPF_SRC code) 'BPF_K)
        (emit_imm32 tmp2 imm ctx)
        (set! src tmp2))
      (emit_alu_r64 dst src ctx (BPF_OP code))]

    [((BPF_ALU64 BPF_NEG))
      (emit_alu_r64 dst tmp2 ctx (BPF_OP code))]

    ; NB: ALU64 DIV/MOD unsupported

    [((BPF_ALU64 BPF_MOV BPF_K)
      (BPF_ALU64 BPF_AND BPF_K)
      (BPF_ALU64 BPF_OR BPF_K)
      (BPF_ALU64 BPF_XOR BPF_K)
      (BPF_ALU64 BPF_LSH BPF_K)
      (BPF_ALU64 BPF_RSH BPF_K)
      (BPF_ALU64 BPF_ARSH BPF_K))

      (emit_alu_i64 dst imm ctx (BPF_OP code))]

    [((BPF_ALU BPF_MOV BPF_X))
      ; Special mov32 for zext.
      (if (equal? imm (bv 1 32))
        (emit_zext64 dst ctx)
        (emit_alu_r32 dst src ctx (BPF_OP code)))]

    [((BPF_ALU BPF_ADD BPF_X)
      (BPF_ALU BPF_SUB BPF_X)
      (BPF_ALU BPF_AND BPF_X)
      (BPF_ALU BPF_OR BPF_X)
      (BPF_ALU BPF_XOR BPF_X)

      (BPF_ALU BPF_MUL BPF_X)
      (BPF_ALU BPF_MUL BPF_K)

      (BPF_ALU BPF_DIV BPF_X)
      (BPF_ALU BPF_DIV BPF_K)

      (BPF_ALU BPF_MOD BPF_X)
      (BPF_ALU BPF_MOD BPF_K)

      (BPF_ALU BPF_LSH BPF_X)
      (BPF_ALU BPF_RSH BPF_X)
      (BPF_ALU BPF_ARSH BPF_X))

      (when (equal? (BPF_SRC code) 'BPF_K)
        (emit_imm32 tmp2 imm ctx)
        (set! src tmp2))
      (emit_alu_r32 dst src ctx (BPF_OP code))]

    [((BPF_ALU BPF_MOV BPF_K)
      (BPF_ALU BPF_ADD BPF_K)
      (BPF_ALU BPF_SUB BPF_K)
      (BPF_ALU BPF_AND BPF_K)
      (BPF_ALU BPF_OR BPF_K)
      (BPF_ALU BPF_XOR BPF_K)
      (BPF_ALU BPF_LSH BPF_K)
      (BPF_ALU BPF_RSH BPF_K)
      (BPF_ALU BPF_ARSH BPF_K))

      (emit_alu_i32 dst imm ctx (BPF_OP code))]

    [((BPF_ALU BPF_NEG))
      (emit_alu_r32 dst tmp2 ctx (BPF_OP code))]

    [((BPF_ALU BPF_END BPF_FROM_LE))
      (define rd (bpf_get_reg64 dst tmp1 ctx))

      (cond
        [(equal? imm (bv 16 32))
          (emit (rv_slli (lo rd) (lo rd) 16) ctx)
          (emit (rv_srli (lo rd) (lo rd) 16) ctx)
          (when (! (->prog->aux->verifier_zext ctx))
            (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]
        [(equal? imm (bv 32 32))
          (when (! (->prog->aux->verifier_zext ctx))
            (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]
        [(equal? imm (bv 64 32))
          (comment "/* Do nothing. */")]
        [else
          (core:bug #:msg (format "BPF_FROM_LE: Bad immediate ~v" imm))])

      (bpf_put_reg64 dst rd ctx)]

    [((BPF_ALU BPF_END BPF_FROM_BE))
      (begin/c #:id BLOCK_emit_be
      (var [rd (bpf_get_reg64 dst tmp1 ctx)])

      (switch= imm
        [((bv 16 32))
          (emit_rev16 (lo rd) ctx)
          (when (! (->prog->aux->verifier_zext ctx))
            (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]
        [((bv 32 32))
          (emit_rev32 (lo rd) ctx)
          (when (! (->prog->aux->verifier_zext ctx))
            (emit (rv_addi (hi rd) RV_REG_ZERO 0) ctx))]
        [((bv 64 32))
          (comment "/* Swap upper and lower halves. */")
          (emit (rv_addi RV_REG_T0 (lo rd) 0) ctx)
          (emit (rv_addi (lo rd) (hi rd) 0) ctx)
          (emit (rv_addi (hi rd) RV_REG_T0 0) ctx)

          (blank)
          (comment "/* Swap each half. */")
          (emit_rev32 (lo rd) ctx)
          (emit_rev32 (hi rd) ctx)]
        [default
          (pr_err "\"bpf-jit: BPF_END imm %d invalid\\n\"" imm)
          (error -1)])

      (blank)
      (bpf_put_reg64 dst rd ctx))]

    [((BPF_JMP BPF_JA))
      (define off32 (sign-extend off (bitvector 32)))
      (define rvoff (rv_offset insn-idx off32 ctx))
      (emit_jump_and_link RV_REG_ZERO rvoff #f ctx)]

    [((BPF_JMP BPF_CALL))
      (define &addr (box (void)))
      (define &fixed (box (void)))
      (bpf_jit_get_func_addr ctx insn &addr &fixed)
      (emit_call (unbox &fixed) (unbox &addr) ctx)]

    [((BPF_JMP BPF_TAIL_CALL))
      (emit_bpf_tail_call insn insn-idx ctx)]

    [((BPF_JMP BPF_JEQ BPF_X)
      (BPF_JMP BPF_JEQ BPF_K)
      (BPF_JMP32 BPF_JEQ BPF_X)
      (BPF_JMP32 BPF_JEQ BPF_K)

      (BPF_JMP BPF_JNE BPF_X)
      (BPF_JMP BPF_JNE BPF_K)
      (BPF_JMP32 BPF_JNE BPF_X)
      (BPF_JMP32 BPF_JNE BPF_K)

      (BPF_JMP BPF_JLE BPF_X)
      (BPF_JMP BPF_JLE BPF_K)
      (BPF_JMP32 BPF_JLE BPF_X)
      (BPF_JMP32 BPF_JLE BPF_K)

      (BPF_JMP BPF_JLT BPF_X)
      (BPF_JMP BPF_JLT BPF_K)
      (BPF_JMP32 BPF_JLT BPF_X)
      (BPF_JMP32 BPF_JLT BPF_K)

      (BPF_JMP BPF_JGE BPF_X)
      (BPF_JMP BPF_JGE BPF_K)
      (BPF_JMP32 BPF_JGE BPF_X)
      (BPF_JMP32 BPF_JGE BPF_K)

      (BPF_JMP BPF_JGT BPF_X)
      (BPF_JMP BPF_JGT BPF_K)
      (BPF_JMP32 BPF_JGT BPF_X)
      (BPF_JMP32 BPF_JGT BPF_K)

      (BPF_JMP BPF_JSLE BPF_X)
      (BPF_JMP BPF_JSLE BPF_K)
      (BPF_JMP32 BPF_JSLE BPF_X)
      (BPF_JMP32 BPF_JSLE BPF_K)

      (BPF_JMP BPF_JSLT BPF_X)
      (BPF_JMP BPF_JSLT BPF_K)
      (BPF_JMP32 BPF_JSLT BPF_X)
      (BPF_JMP32 BPF_JSLT BPF_K)

      (BPF_JMP BPF_JSGE BPF_X)
      (BPF_JMP BPF_JSGE BPF_K)
      (BPF_JMP32 BPF_JSGE BPF_X)
      (BPF_JMP32 BPF_JSGE BPF_K)

      (BPF_JMP BPF_JSGT BPF_X)
      (BPF_JMP BPF_JSGT BPF_K)
      (BPF_JMP32 BPF_JSGT BPF_X)
      (BPF_JMP32 BPF_JSGT BPF_K)

      (BPF_JMP BPF_JSET BPF_X)
      (BPF_JMP BPF_JSET BPF_K)
      (BPF_JMP32 BPF_JSET BPF_X)
      (BPF_JMP32 BPF_JSET BPF_K))

      (define rvoff (rv_offset insn-idx (sign-extend off (bitvector 32)) ctx))
      (when (equal? (BPF_SRC code) 'BPF_K)
        (define s (context-ninsns ctx))
        (emit_imm32 tmp2 imm ctx)
        (set! src tmp2)
        (define e (context-ninsns ctx))
        (set! rvoff (bvsub rvoff (ninsns_rvoff (bvsub e s)))))
      (if is64
        (emit_branch_r64 dst src rvoff ctx (BPF_OP code))
        (emit_branch_r32 dst src rvoff ctx (BPF_OP code)))]

    [((BPF_JMP BPF_EXIT))
      (cond
        [(equal? insn-idx (bvsub1 (context-program-length ctx)))
          ; Break
          (void)]
        [else
          (define rvoff (epilogue_offset ctx))
          (emit_jump_and_link RV_REG_ZERO rvoff #f ctx)])]

    [((BPF_LD BPF_IMM BPF_DW))
      (define imm_lo imm)
      (define imm_hi (bpf:insn-imm next-insn))
      (define rd (bpf_get_reg64 dst tmp1 ctx))
      (emit_imm64 rd imm_hi imm_lo ctx)
      (bpf_put_reg64 dst rd ctx)]

    [((BPF_LDX BPF_MEM BPF_B)
      (BPF_LDX BPF_MEM BPF_H)
      (BPF_LDX BPF_MEM BPF_W)
      (BPF_LDX BPF_MEM BPF_DW))

      (emit_load_r64 dst src off ctx (BPF_SIZE code))]

    [((BPF_ST BPF_MEM BPF_B)
      (BPF_ST BPF_MEM BPF_H)
      (BPF_ST BPF_MEM BPF_W)
      (BPF_ST BPF_MEM BPF_DW)

      (BPF_STX BPF_MEM BPF_B)
      (BPF_STX BPF_MEM BPF_H)
      (BPF_STX BPF_MEM BPF_W)
      (BPF_STX BPF_MEM BPF_DW)
      (BPF_STX BPF_XADD BPF_W))

      (when (equal? (BPF_CLASS code) 'BPF_ST)
        (emit_imm32 tmp2 imm ctx)
        (set! src tmp2))

      (emit_store_r64 dst src off ctx (BPF_SIZE code) (BPF_MODE code))]

    [else (core:bug #:msg (format "emit_insn: unrecognized code: ~v" code))])

  (context-insns ctx))

(func (bpf_jit_build_prologue ctx)
  (var [fp (@ bpf2rv32 BPF_REG_FP)]
       [r1 (@ bpf2rv32 BPF_REG_1)]
       [stack_adjust (_int 0)]
       [bpf_stack_adjust (round_up (->prog->aux->stack_depth ctx) (bv STACK_ALIGN 32))])

  (comment "/* Make space for callee-saved registers. */")
  (setf! bvadd stack_adjust (bvmul (bv NR_SAVED_REGISTERS 32) (bv (sizeof 'u32) 32)))

  (comment "/* Make space for BPF registers on stack. */")
  (setf! bvadd stack_adjust (bvmul (bv BPF_JIT_SCRATCH_REGS 32) (bv (sizeof 'u32) 32)))

  (comment "/* Make space for BPF stack. */")
  (setf! bvadd stack_adjust bpf_stack_adjust)

  (comment "/* Round up for stack alignment. */")
  (set! stack_adjust (round_up stack_adjust (bv STACK_ALIGN 32)))

  (blank)
  (comment "/*"
           " * The first instruction sets the tail-call-counter (TCC) register."
           " * This instruction is skipped by tail calls."
           " */")
  (emit (rv_addi RV_REG_TCC RV_REG_ZERO MAX_TAIL_CALL_CNT) ctx)

  (blank)
  (emit (rv_addi RV_REG_SP RV_REG_SP (bvneg stack_adjust)) ctx)

  (blank)
  (comment "/* Save callee-save registers. */")
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 4 32)) RV_REG_RA) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 8 32)) RV_REG_FP) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 12 32)) RV_REG_S1) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 16 32)) RV_REG_S2) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 20 32)) RV_REG_S3) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 24 32)) RV_REG_S4) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 28 32)) RV_REG_S5) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 32 32)) RV_REG_S6) ctx)
  (emit (rv_sw RV_REG_SP (bvsub stack_adjust (bv 36 32)) RV_REG_S7) ctx)

  (blank)
  (comment "/* Set fp: used as the base address for stacked BPF registers. */")
  (emit (rv_addi RV_REG_FP RV_REG_SP stack_adjust) ctx)

  (blank)
  (comment "/* Set up BPF frame pointer. */")
  (emit (rv_addi (lo fp) RV_REG_SP bpf_stack_adjust) ctx)
  (emit (rv_addi (hi fp) RV_REG_ZERO 0) ctx)

  (blank)
  (comment "/* Set up BPF context pointer. */")
  (emit (rv_addi (lo r1) RV_REG_A0 0) ctx)
  (emit (rv_addi (hi r1) RV_REG_ZERO 0) ctx)

  (blank)
  (set-field! context ctx stack_size stack_adjust))

(define (bpf_jit_build_epilogue ctx)
  (__build_epilogue #f ctx))

; types for C code
(begin-for-syntax
  (emit-infer-type
    (lambda (stx)
      (define e (syntax-e stx))
      (define op (syntax-e (car e)))
      (cond
        [(member op '(bpf_get_reg32 bpf_get_reg64))
         "const s8 *"]
        [(member op '(_int ->stack_size round_up))
         "int"]
        [(and (equal? op '@) (equal? (syntax-e (second e)) 'bpf2rv32))
         "const s8 *"]))))
