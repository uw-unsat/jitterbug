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
  (only-in "../lib/emit.rkt" 0x define-rvenc)
  (prefix-in riscv: serval/riscv/base))

(provide (all-defined-out))


(define (enc-reg reg)
  (zero-extend (riscv:gpr->idx reg) (bitvector 32)))

(define (enc-imm imm)
  (zero-extend imm (bitvector 32)))

(define (u8 imm)
  (extract 7 0 imm))


; instruction formats

(define (rv_r_insn funct7 rs2 rs1 funct3 rd opcode)
  (when (integer? funct7)
    (set! funct7 (bv funct7 32)))
  (bvor (bvshl (zero-extend funct7 (bitvector 32)) (bv 25 32))
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

(define (rv_s_insn imm11_0 rs2 rs1 funct3 opcode)
  (define imm11_5 (u8 (bvashr (enc-imm imm11_0) (bv 5 32))))
  (define imm4_0 (u8 (bvand (enc-imm imm11_0) (bv #x1f 32))))
  (bvor (bvshl (enc-imm imm11_5) (bv 25 32))
        (bvshl (enc-reg rs2) (bv 20 32))
        (bvshl (enc-reg rs1) (bv 15 32))
        (bvshl (bv funct3 32) (bv 12 32))
        (bvshl (enc-imm imm4_0) (bv 7 32))
        (bv opcode 32)))

(define (rv_b_insn imm12_1 rs2 rs1 funct3 opcode)
  (define imm12
    (u8 (bvor (bvashr (bvand (enc-imm imm12_1) (bv #x800 32)) (bv 5 32))
                      (bvashr (bvand (enc-imm imm12_1) (bv #x3f0 32)) (bv 4 32)))))
  (define imm4_1
    (u8 (bvor (bvshl (bvand (enc-imm imm12_1) (bv #xf 32)) (bv 1 32))
              (bvashr (bvand (enc-imm imm12_1) (bv #x400 32)) (bv 10 32)))))
  (bvor (bvshl (enc-imm imm12) (bv 25 32))
        (bvshl (enc-reg rs2) (bv 20 32))
        (bvshl (enc-reg rs1) (bv 15 32))
        (bvshl (bv funct3 32) (bv 12 32))
        (bvshl (enc-imm imm4_1) (bv 7 32))
        (bv opcode 32)))

(define (rv_u_insn imm31_12 rd opcode)
  (bvor (bvshl (enc-imm imm31_12) (bv 12 32))
        (bvshl (enc-reg rd) (bv 7 32))
        (bv opcode 32)))

(define (rv_j_insn imm20_1 rd opcode)
  (define imm
    (bvor (bvand (enc-imm imm20_1) (bv #x80000 32))
          (bvshl (bvand (enc-imm imm20_1) (bv #x3ff 32)) (bv 9 32))
          (bvlshr (bvand (enc-imm imm20_1) (bv #x400 32)) (bv 2 32))
          (bvlshr (bvand (enc-imm imm20_1) (bv #x7f800 32)) (bv 11 32))))
  (bvor (bvshl (enc-imm imm) (bv 12 32))
        (bvshl (enc-reg rd) (bv 7 32))
        (bv opcode 32)))

(define (rv_amo_insn funct5 aq rl rs2 rs1 funct3 rd opcode)
  (define funct7
    (bvor (bvshl (bv funct5 8) (bv 2 8))
          (bvshl (zero-extend aq (bitvector 8)) (bv 1 8))
          (zero-extend rl (bitvector 8))))
  (rv_r_insn funct7 rs2 rs1 funct3 rd opcode))


; instructions

(define-rvenc (rv_add rd rs1 rs2)
  (rv_r_insn 0 rs2 rs1 0 rd (0x 33)))

(define-rvenc (rv_addi rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 0 rd (0x 13)))

(define-rvenc (rv_mv rd rs1)
  (rv_addi rd rs1 (bv 0 12)))

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

(define-rvenc (rv_lui rd imm31_12)
  (rv_u_insn imm31_12 rd (0x 37)))

(define-rvenc (rv_auipc rd imm31_12)
  (rv_u_insn imm31_12 rd (0x 17)))

(define-rvenc (rv_jal rd imm20_1)
  (rv_j_insn imm20_1 rd (0x 6f)))

(define-rvenc (rv_jalr rd rs1 imm11_0)
  (rv_i_insn imm11_0 rs1 0 rd (0x 67)))

(define-rvenc (rv_beq rs1 rs2 imm12_1)
  (rv_b_insn imm12_1 rs2 rs1 0 (0x 63)))

(define-rvenc (rv_bltu rs1 rs2 imm12_1)
  (rv_b_insn imm12_1 rs2 rs1 6 (0x 63)))

(define-rvenc (rv_bgtu rs1 rs2 imm12_1)
  (rv_bltu rs2 rs1 imm12_1))

(define-rvenc (rv_bgeu rs1 rs2 imm12_1)
  (rv_b_insn imm12_1 rs2 rs1 7 (0x 63)))

(define-rvenc (rv_bleu rs1 rs2 imm12_1)
  (rv_bgeu rs2 rs1 imm12_1))

(define-rvenc (rv_bne rs1 rs2 imm12_1)
  (rv_b_insn imm12_1 rs2 rs1 1 (0x 63)))

(define-rvenc (rv_blt rs1 rs2 imm12_1)
  (rv_b_insn imm12_1 rs2 rs1 4 (0x 63)))

(define-rvenc (rv_bgt rs1 rs2 imm12_1)
  (rv_blt rs2 rs1 imm12_1))

(define-rvenc (rv_bge rs1 rs2 imm12_1)
  (rv_b_insn imm12_1 rs2 rs1 5 (0x 63)))

(define-rvenc (rv_ble rs1 rs2 imm12_1)
  (rv_bge rs2 rs1 imm12_1))

(define-rvenc (rv_sb rs1 imm11_0 rs2)
  (rv_s_insn imm11_0 rs2 rs1 0 (0x 23)))

(define-rvenc (rv_sh rs1 imm11_0 rs2)
  (rv_s_insn imm11_0 rs2 rs1 1 (0x 23)))

(define-rvenc (rv_sw rs1 imm11_0 rs2)
  (rv_s_insn imm11_0 rs2 rs1 2 (0x 23)))

(define-rvenc (rv_lbu rd imm11_0 rs1)
  (rv_i_insn imm11_0 rs1 4 rd (0x 03)))

(define-rvenc (rv_lhu rd imm11_0 rs1)
  (rv_i_insn imm11_0 rs1 5 rd (0x 03)))

(define-rvenc (rv_lw rd imm11_0 rs1)
  (rv_i_insn imm11_0 rs1 2 rd (0x 03)))

(define-rvenc (rv_amoadd_w rd rs2 rs1 aq rl)
  (rv_amo_insn 0 aq rl rs2 rs1 2 rd (0x 2f)))


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

(define-rvenc (rv_sd rs1 imm11_0 rs2)
  (rv_s_insn imm11_0 rs2 rs1 3 (0x 23)))

(define-rvenc (rv_lwu rd imm11_0 rs1)
  (rv_i_insn imm11_0 rs1 6 rd (0x 03)))

(define-rvenc (rv_ld rd imm11_0 rs1)
  (rv_i_insn imm11_0 rs1 3 rd (0x 03)))

(define-rvenc (rv_amoadd_d rd rs2 rs1 aq rl)
  (rv_amo_insn 0 aq rl rs2 rs1 3 rd (0x 2f)))
