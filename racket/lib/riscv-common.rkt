#lang rosette

(require (prefix-in riscv: serval/riscv/interp))
(require serval/lib/debug)

(provide (all-defined-out))

; Size of RISC-V instruction, in bytes
(define DEFAULT_SIZE 4)

(struct context (insns ninsns offset flags) #:mutable #:transparent)

(define (get-offset ctx idx)
  (bug-assert (bvsge idx (bv 0 32)) #:msg "offset arg must be in bounds")
  ((context-offset ctx) idx))

(define (code-size vec)
  (* 4 (vector-length vec)))

(define (emit insn ctx)
  (for/all ([insns (context-insns ctx) #:exhaustive])
    (set-context-insns! ctx (vector-append insns (vector insn))))
  (set-context-ninsns! ctx (bvadd (bv 1 32) (context-ninsns ctx))))

(define (init-ctx)
  (define-symbolic* offsets (~> (bitvector 32) (bitvector 32)))
  (define-symbolic* seen boolean? [32])
  (define-symbolic* ninsns (bitvector 32))
  (define ctx (context (vector) ninsns offsets (list->vector seen)))
  ctx)

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offset ctx))
  (define (prev-offset insn)
   (if (bveq insn (bv 0 32)) (bv 0 32) (offsets (bvsub insn (bv 1 32)))))
  (bvadd
    target-pc-base
    (bvmul (zero-extend (prev-offset bpf-pc) (bitvector (riscv:XLEN))) (bv 4 (riscv:XLEN)))))

(define (make-immediate x size)
  (cond
    [(integer? x) (bv x size)]
    [else (extract (- size 1) 0 x)]))

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
  (riscv:rv_u_insn 'lui rd (if (integer? imm31_12) (bv imm31_12 20) (extract 19 0 imm31_12))))

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

(define (rv_lw rd imm11_0 rs1)
  (riscv:rv_i_insn 'lw rd rs1 (make-immediate imm11_0 12)))

(define (rv_sw rs1 imm11_0 rs2)
  (riscv:rv_s_insn 'sw rs1 rs2 (make-immediate imm11_0 12)))


(define (is_12b_int imm)
  (&& (bvsle (bv (- #x800) 32) imm) (bvslt imm (bv #x800 32))))

(define (is_13b_int imm)
  (&& (bvsle (bv (- #x1000) 32) imm) (bvslt imm (bv #x1000 32))))

(define (is_21b_int imm [size 32])
  (&& (bvsle (bv (- #x100000) size) imm) (bvslt imm (bv #x100000 size))))

(define RV_REG_ZERO 'zero)
(define RV_REG_RA 'ra)
(define RV_REG_T0 't0)
(define RV_REG_T1 't1)
(define RV_REG_T2 't2)
(define RV_REG_S1 's1)
(define RV_REG_S2 's2)
(define RV_REG_S3 's3)
(define RV_REG_S4 's4)
(define RV_REG_S5 's5)
(define RV_REG_S6 's6)
(define RV_FP 'fp)

(define RV_CTX_F_SEEN_TAIL_CALL 0)
(define RV_CTX_F_SEEN_CALL RV_REG_RA)
(define RV_CTX_F_SEEN_S1 RV_REG_S1)
(define RV_CTX_F_SEEN_S2 RV_REG_S2)
(define RV_CTX_F_SEEN_S3 RV_REG_S3)
(define RV_CTX_F_SEEN_S4 RV_REG_S4)
(define RV_CTX_F_SEEN_S5 RV_REG_S5)
(define RV_CTX_F_SEEN_S6 RV_REG_S6)
