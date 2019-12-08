#lang rosette

(require (prefix-in riscv: serval/riscv/interp))

(provide (all-defined-out))

; Size of RISC-V instruction, in bytes
(define DEFAULT_SIZE 4)

(define (rv_r_insn rs2 rs1 rd opcode)
  (riscv:instr opcode rd rs1 rs2 #f DEFAULT_SIZE))

(define (rv_i_insn imm11_0 rs1 rd opcode)
  (riscv:instr opcode rd rs1 #f (if (integer? imm11_0) (bv imm11_0 12) (extract 11 0 imm11_0)) DEFAULT_SIZE))

(define (rv_u_insn imm31_12 rd opcode)
  (riscv:instr opcode rd #f #f (extract 19 0 imm31_12) DEFAULT_SIZE))

(define (rv_s_insn imm11_0 rs2 rs1 opcode)
  (riscv:instr opcode #f rs1 rs2 (if (integer? imm11_0) (bv imm11_0 12) (extract 11 0 imm11_0)) DEFAULT_SIZE))

(define (make-offset-imm x size)
  (cond
    [(integer? x) (bv x size)]
    [#t (extract (- size 1) 0 x)]))

(define (rv_auipc rd imm)
  (rv_u_insn imm rd 'auipc))

(define (rv_jalr rd rs1 imm)
  (rv_i_insn imm rs1 rd 'jalr))

(define (rv_bne rs1 rs2 offset)
  (riscv:instr 'bne #f rs1 rs2 (make-offset-imm offset 12) DEFAULT_SIZE))

(define (rv_beq rs1 rs2 offset)
  (riscv:instr 'beq #f rs1 rs2 (make-offset-imm offset 12) DEFAULT_SIZE))


(define (rv_blt rs1 rs2 offset)
  (riscv:instr 'blt #f rs1 rs2 (make-offset-imm offset 12) DEFAULT_SIZE))

(define (rv_bgt rs1 rs2 offset)
  (riscv:instr 'blt #f rs2 rs1 (make-offset-imm offset 12) DEFAULT_SIZE))


(define (rv_bltu rs1 rs2 offset)
  (riscv:instr 'bltu #f rs1 rs2 (make-offset-imm offset 12) DEFAULT_SIZE))

(define (rv_bgtu rs1 rs2 offset)
  (riscv:instr 'bltu #f rs2 rs1 (make-offset-imm offset 12) DEFAULT_SIZE))


(define (rv_bgeu rs1 rs2 offset)
  (riscv:instr 'bgeu #f rs1 rs2 (make-offset-imm offset 12) DEFAULT_SIZE))

(define (rv_bleu rs1 rs2 offset)
  (riscv:instr 'bgeu #f rs2 rs1 (make-offset-imm offset 12) DEFAULT_SIZE))


(define (rv_bge rs1 rs2 offset)
  (riscv:instr 'bge #f rs1 rs2 (make-offset-imm offset 12) DEFAULT_SIZE))

(define (rv_ble rs1 rs2 offset)
  (riscv:instr 'bge #f rs2 rs1 (make-offset-imm offset 12) DEFAULT_SIZE))



(define (rv_jal dst offset)
  (riscv:instr 'jal dst #f #f (make-offset-imm offset 20) DEFAULT_SIZE))

(define (rv_addiw rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'addiw))

(define (rv_addi rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'addi))

(define (rv_sltu rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'sltu))

(define (rv_addw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'addw))

(define (rv_add rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'add))

(define (rv_subw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'subw))

(define (rv_sub rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'sub))

(define (rv_and rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'and))

(define (rv_or rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'or))

(define (rv_xor rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'xor))

(define (rv_mulw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'mulw))

(define (rv_mulhu rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'mulhu))

(define (rv_mul rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'mul))

(define (rv_divuw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'divuw))

(define (rv_divu rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'divu))

(define (rv_remuw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'remuw))

(define (rv_remu rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'remu))

(define (rv_sllw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'sllw))

(define (rv_sll rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'sll))

(define (rv_srlw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'srlw))

(define (rv_srl rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'srl))

(define (rv_sraw rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'sraw))

(define (rv_sra rd rs1 rs2)
  (rv_r_insn rs2 rs1 rd 'sra))

(define (rv_lui rd imm31_12)
  (rv_u_insn imm31_12 rd 'lui))

(define (rv_slli rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'slli))

(define (rv_andi rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'andi))

(define (rv_ori rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'ori))

(define (rv_xori rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'xori))

(define (rv_slliw rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'slliw))

(define (rv_srliw rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'srliw))

(define (rv_srli rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'srli))

(define (rv_sraiw rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'sraiw))

(define (rv_srai rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 rd 'srai))

(define (rv_lw rd imm11_0 rs1)
  (rv_i_insn imm11_0 rs1 rd 'lw))

(define (rv_sw rs1 imm11_0 rs2)
  (rv_s_insn imm11_0 rs2 rs1 'sw))

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
