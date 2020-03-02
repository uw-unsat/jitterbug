#lang rosette

(require
  (only-in "../lib/emit.rkt" 0x define-rvenc)
  (prefix-in riscv: serval/riscv/base))

(provide (all-defined-out))


(define (enc-reg reg)
  (zero-extend (riscv:gpr->idx reg) (bitvector 32)))

(define (enc-imm imm)
  (zero-extend imm (bitvector 32)))


; instruction formats

(define (rv_r_insn funct7 rs2 rs1 funct3 rd opcode)
  (bvor (bvshl (bv funct7 32) (bv 25 32))
        (bvshl (enc-reg rs2) (bv 20 32))
        (bvshl (enc-reg rs1) (bv 15 32))
        (bvshl (bv funct3 32) (bv 12 32))
        (bvshl (enc-reg rd) (bv 7 32))
        (bv opcode 32)))

(define (rv_i_insn imm11_0 rs1 funct3 rd opcode)
  (bvor (bvshl (enc-imm imm11_0) (bv 20 32))
        (bvshl (enc-reg rs1) (bv 15 32))
        (bvshl (bv funct3 32) (bv 12 32))
        (bvshl (enc-reg rd) (bv 7 32))
        (bv opcode 32)))


; instructions

(define-rvenc (rv_add rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 0 rd (0x 33)))

(define-rvenc (rv_addi rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 0 rd (0x 13)))

(define-rvenc (rv_sub rd rs1 rs2)
  (rv_r_insn (0x 20) rs2 rs1 0 rd (0x 33)))

(define-rvenc (rv_and rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 7 rd (0x 33)))

(define-rvenc (rv_andi rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 7 rd (0x 13)))

(define-rvenc (rv_or rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 6 rd (0x 33)))

(define-rvenc (rv_ori rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 6 rd (0x 13)))

(define-rvenc (rv_xor rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 4 rd (0x 33)))

(define-rvenc (rv_xori rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 4 rd (0x 13)))

(define-rvenc (rv_mul rd rs1 rs2)
  (rv_r_insn 1 rs2 rs1 0 rd (0x 33)))

(define-rvenc (rv_mulhu rd rs1 rs2)
	(rv_r_insn 1 rs2 rs1 3 rd (0x 33)))

(define-rvenc (rv_sll rd rs1 rs2)
	(rv_r_insn 0 rs2 rs1 1 rd (0x 33)))

(define-rvenc (rv_slli rd rs1 imm11_0)
	(rv_i_insn imm11_0 rs1 1 rd (0x 13)))

(define-rvenc (rv_srl rd rs1 rs2)
	(rv_r_insn 0 rs2 rs1 5 rd (0x 33)))

(define-rvenc (rv_srli rd rs1 imm11_0)
	(rv_i_insn imm11_0 rs1 5 rd (0x 13)))

(define-rvenc (rv_sra rd rs1 rs2)
  (rv_r_insn (0x 20) rs2 rs1 5 rd (0x 33)))

(define-rvenc (rv_srai rd rs1 imm11_0)
	(rv_i_insn (bvor (bv (0x 400) 12) imm11_0) rs1 5 rd (0x 13)))

(define-rvenc (rv_divu rd rs1 rs2)
	(rv_r_insn 1 rs2 rs1 5 rd (0x 33)))

(define-rvenc (rv_remu rd rs1 rs2)
	(rv_r_insn 1 rs2 rs1 7 rd (0x 33)))

(define-rvenc (rv_sltu rd rs1 rs2)
	(rv_r_insn 0 rs2 rs1 3 rd (0x 33)))


; RV64-only instructions

(define-rvenc (rv_addiw rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 0 rd (0x 1b)))

(define-rvenc (rv_addw rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 0 rd (0x 3b)))

(define-rvenc (rv_subw rd rs1 rs2)
  (rv_r_insn (0x 20) rs2 rs1 0 rd (0x 3b)))

(define-rvenc (rv_mulw rd rs1 rs2)
  (rv_r_insn 1 rs2 rs1 0 rd (0x 3b)))

(define-rvenc (rv_divuw rd rs1 rs2)
	(rv_r_insn 1 rs2 rs1 5 rd (0x 3b)))

(define-rvenc (rv_remuw rd rs1 rs2)
  (rv_r_insn 1 rs2 rs1 7 rd (0x 3b)))

(define-rvenc (rv_sllw rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 1 rd (0x 3b)))

(define-rvenc (rv_srlw rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 5 rd (0x 3b)))

(define-rvenc (rv_sraw rd rs1 rs2)
  (rv_r_insn (0x 20) rs2 rs1 5 rd (0x 3b)))

(define-rvenc (rv_slliw rd rs1 imm11_0)
	(rv_i_insn imm11_0 rs1 1 rd (0x 1b)))

(define-rvenc (rv_srliw rd rs1 imm11_0)
	(rv_i_insn imm11_0 rs1 5 rd (0x 1b)))

(define-rvenc (rv_sraiw rd rs1 imm11_0)
	(rv_i_insn (bvor (bv (0x 400) 12) imm11_0) rs1 5 rd (0x 1b)))
