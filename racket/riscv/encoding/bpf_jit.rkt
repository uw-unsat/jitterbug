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
  serval/lib/bvarith
  (only-in "../../lib/extraction/c.rkt" 0x define-rvenc define-rvenc/16)
  (prefix-in riscv: serval/riscv/base))

(provide (except-out (all-defined-out) RV_REG_ZERO))

(define RV_REG_ZERO 'x0)

(define (enc-reg reg)
  (zero-extend (riscv:encode-gpr reg) (bitvector 32)))

(define (enc-creg reg)
  (zero-extend (riscv:encode-compressed-gpr reg) (bitvector 16)))

(define (enc-imm32 imm)
  (zero-extend imm (bitvector 32)))

(define (enc-imm16 imm)
  (zero-extend imm (bitvector 16)))

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
  (bvor (bvshl (enc-imm32 imm11_0) (bv 20 32))
        (bvshl (enc-reg rs1) (bv 15 32))
        (bvshl (bv funct3 32) (bv 12 32))
        (bvshl (enc-reg rd) (bv 7 32))
        (bv opcode 32)))

(define (rv_s_insn imm11_0 rs2 rs1 funct3 opcode)
  (define imm11_5 (u8 (bvashr (enc-imm32 imm11_0) (bv 5 32))))
  (define imm4_0 (u8 (bvand (enc-imm32 imm11_0) (bv #x1f 32))))
  (bvor (bvshl (enc-imm32 imm11_5) (bv 25 32))
        (bvshl (enc-reg rs2) (bv 20 32))
        (bvshl (enc-reg rs1) (bv 15 32))
        (bvshl (bv funct3 32) (bv 12 32))
        (bvshl (enc-imm32 imm4_0) (bv 7 32))
        (bv opcode 32)))

(define (rv_b_insn imm12_1 rs2 rs1 funct3 opcode)
  (define imm12
    (u8 (bvor (bvashr (bvand (enc-imm32 imm12_1) (bv #x800 32)) (bv 5 32))
                      (bvashr (bvand (enc-imm32 imm12_1) (bv #x3f0 32)) (bv 4 32)))))
  (define imm4_1
    (u8 (bvor (bvshl (bvand (enc-imm32 imm12_1) (bv #xf 32)) (bv 1 32))
              (bvashr (bvand (enc-imm32 imm12_1) (bv #x400 32)) (bv 10 32)))))
  (bvor (bvshl (enc-imm32 imm12) (bv 25 32))
        (bvshl (enc-reg rs2) (bv 20 32))
        (bvshl (enc-reg rs1) (bv 15 32))
        (bvshl (bv funct3 32) (bv 12 32))
        (bvshl (enc-imm32 imm4_1) (bv 7 32))
        (bv opcode 32)))

(define (rv_u_insn imm31_12 rd opcode)
  (bvor (bvshl (enc-imm32 imm31_12) (bv 12 32))
        (bvshl (enc-reg rd) (bv 7 32))
        (bv opcode 32)))

(define (rv_j_insn imm20_1 rd opcode)
  (define imm
    (bvor (bvand (enc-imm32 imm20_1) (bv #x80000 32))
          (bvshl (bvand (enc-imm32 imm20_1) (bv #x3ff 32)) (bv 9 32))
          (bvlshr (bvand (enc-imm32 imm20_1) (bv #x400 32)) (bv 2 32))
          (bvlshr (bvand (enc-imm32 imm20_1) (bv #x7f800 32)) (bv 11 32))))
  (bvor (bvshl (enc-imm32 imm) (bv 12 32))
        (bvshl (enc-reg rd) (bv 7 32))
        (bv opcode 32)))

(define (rv_amo_insn funct5 aq rl rs2 rs1 funct3 rd opcode)
  (define funct7
    (bvor (bvshl (bv funct5 8) (bv 2 8))
          (bvshl (zero-extend aq (bitvector 8)) (bv 1 8))
          (zero-extend rl (bitvector 8))))
  (rv_r_insn funct7 rs2 rs1 funct3 rd opcode))

(define (rv_cb_insn funct3 imm6 funct2 rd op)
  (define imm
    (bvor (bvshl (bvand (enc-imm16 imm6) (bv #x20 16)) (bv 7 16))
          (bvshl (bvand (enc-imm16 imm6) (bv #x1f 16)) (bv 2 16))))

  ; Correct for funct2 being a bv, e.g., from c.beqz, c.bnez
  (set! funct2 (if (integer? funct2) (bv funct2 16) funct2))

  (bvor (bvshl (bv funct3 16) (bv 13 16))
        (bvshl funct2 (bv 10 16))
        (bvshl (enc-creg rd) (bv 7 16))
        (bv op 16)
        imm))

(define (rv_ca_insn funct6 rd funct2 rs2 op)
  (bvor (bvshl (bv funct6 16) (bv 10 16))
        (bvshl (enc-creg rd) (bv 7 16))
        (bvshl (bv funct2 16) (bv 5 16))
        (bvshl (enc-creg rs2) (bv 2 16))
        (bv op 16)))

(define (rv_ci_insn funct3 imm6 rd op)
  (define imm
    (bvor (bvshl (bvand (enc-imm16 imm6) (bv #x20 16)) (bv 7 16))
          (bvshl (bvand (enc-imm16 imm6) (bv #x1f 16)) (bv 2 16))))

  (bvor (bvshl (bv funct3 16) (bv 13 16))
        (bvshl (trunc 16 (enc-reg rd)) (bv 7 16))
        (bv op 16)
        imm))

(define (rv_cr_insn funct4 rd rs2 op)
  (bvor (bvshl (bv funct4 16) (bv 12 16))
        (bvshl (trunc 16 (enc-reg rd)) (bv 7 16))
        (bvshl (trunc 16 (enc-reg rs2)) (bv 2 16))
        (bv op 16)))

(define (rv_cl_insn funct3 imm_hi rs1 imm_lo rd op)
  (bvor (bvshl (bv funct3 16) (bv 13 16))
        (bvshl imm_hi (bv 10 16))
        (bvshl (enc-creg rs1) (bv 7 16))
        (bvshl imm_lo (bv 5 16))
        (bvshl (enc-creg rd) (bv 2 16))
        (bv op 16)))

(define (rv_cs_insn funct3 imm_hi rs1 imm_lo rs2 op)
  (bvor (bvshl (bv funct3 16) (bv 13 16))
        (bvshl imm_hi (bv 10 16))
        (bvshl (enc-creg rs1) (bv 7 16))
        (bvshl imm_lo (bv 5 16))
        (bvshl (enc-creg rs2) (bv 2 16))
        (bv op 16)))

(define (rv_css_insn funct3 uimm rs2 op)
  (bvor (bvshl (bv funct3 16) (bv 13 16))
        (bvshl uimm (bv 7 16))
        (bvshl (trunc 16 (enc-reg rs2)) (bv 2 16))
        (bv op 16)))

(define (rv_ciw_insn funct3 imm rd op)
  (bvor (bvshl (bv funct3 16) (bv 13 16))
        (bvshl imm (bv 5 16))
        (bvshl (enc-creg rd) (bv 2 16))
        (bv op 16)))

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

; RVC instructions

(define (rvc_addi4spn rd imm10)
  (define imm (bvor (bvshl (bvand (enc-imm16 imm10) (bv #x30 16)) (bv 2 16))
                    (bvlshr (bvand (enc-imm16 imm10) (bv #x3c0 16)) (bv 4 16))
                    (bvlshr (bvand (enc-imm16 imm10) (bv #x4 16)) (bv 1 16))
                    (bvlshr (bvand (enc-imm16 imm10) (bv #x8 16)) (bv 3 16))))
  (rv_ciw_insn 0 imm rd 0))

(define (rvc_lw rd imm7 rs)
  (define imm_hi (bvlshr (bvand (enc-imm16 imm7) (bv #x38 16)) (bv 3 16)))
  (define imm_lo (bvor (bvlshr (bvand (enc-imm16 imm7) (bv #x4 16)) (bv 1 16))
                       (bvlshr (bvand (enc-imm16 imm7) (bv #x40 16)) (bv 6 16))))
  (rv_cl_insn (0x 2) imm_hi rs imm_lo rd 0))

(define (rvc_ld rd imm8 rs)
  (define imm_hi (bvlshr (bvand (enc-imm16 imm8) (bv #x38 16)) (bv 3 16)))
  (define imm_lo (bvlshr (bvand (enc-imm16 imm8) (bv #xc0 16)) (bv 6 16)))
  (rv_cl_insn (0x 3) imm_hi rs imm_lo rd 0))

(define (rvc_sw rs1 imm7 rs2)
  (define imm_hi (bvlshr (bvand (enc-imm16 imm7) (bv #x38 16)) (bv 3 16)))
  (define imm_lo (bvor (bvlshr (bvand (enc-imm16 imm7) (bv #x4 16)) (bv 1 16))
                       (bvlshr (bvand (enc-imm16 imm7) (bv #x40 16)) (bv 6 16))))
  (rv_cs_insn (0x 6) imm_hi rs1 imm_lo rs2 0))

(define (rvc_sd rs1 imm8 rs2)
  (define imm_hi (bvlshr (bvand (enc-imm16 imm8) (bv #x38 16)) (bv 3 16)))
  (define imm_lo (bvlshr (bvand (enc-imm16 imm8) (bv #xc0 16)) (bv 6 16)))
  (rv_cs_insn (0x 7) imm_hi rs1 imm_lo rs2 0))

(define-rvenc/16 (rvc_addi rd imm6)
  (rv_ci_insn 0 imm6 rd (0x 1)))

(define-rvenc/16 (rvc_addiw rd imm6)
  (rv_ci_insn (0x 1) imm6 rd (0x 1)))

(define-rvenc/16 (rvc_li rd imm6)
  (rv_ci_insn (0x 2) imm6 rd (0x 1)))

(define (rvc_addi16sp imm10)
  (define imm
    (bvor (bvlshr (bvand (enc-imm16 imm10) (bv #x200 16)) (bv 4 16))
          (bvand (enc-imm16 imm10) (bv #x10 16))
          (bvlshr (bvand (enc-imm16 imm10) (bv #x40 16)) (bv 3 16))
          (bvlshr (bvand (enc-imm16 imm10) (bv #x180 16)) (bv 6 16))
          (bvlshr (bvand (enc-imm16 imm10) (bv #x20 16)) (bv 5 16))))
  (rv_ci_insn (0x 3) imm 'x2 (0x 1)))

(define-rvenc/16 (rvc_lui rd imm6)
  (rv_ci_insn (0x 3) imm6 rd (0x 1)))

(define-rvenc/16 (rvc_srli rd imm6)
  (rv_cb_insn (0x 4) imm6 0 rd (0x 1)))

(define-rvenc/16 (rvc_srai rd imm6)
  (rv_cb_insn (0x 4) imm6 (0x 1) rd (0x 1)))

(define-rvenc/16 (rvc_andi rd imm6)
  (rv_cb_insn (0x 4) imm6 (0x 2) rd (0x 1)))

(define-rvenc/16 (rvc_sub rd rs)
  (rv_ca_insn (0x 23) rd 0 rs (0x 1)))

(define-rvenc/16 (rvc_xor rd rs)
  (rv_ca_insn (0x 23) rd (0x 1) rs (0x 1)))

(define-rvenc/16 (rvc_or rd rs)
  (rv_ca_insn (0x 23) rd (0x 2) rs (0x 1)))

(define-rvenc/16 (rvc_and rd rs)
  (rv_ca_insn (0x 23) rd (0x 3) rs (0x 1)))

(define-rvenc/16 (rvc_subw rd rs)
  (rv_ca_insn (0x 27) rd 0 rs (0x 1)))

(define (rvc_beqz rs1 imm9)
  (define imm (bvor (bvlshr (bvand (enc-imm16 imm9) (bv #x100 16)) (bv 3 16))
                    (bvlshr (bvand (enc-imm16 imm9) (bv #xc0 16)) (bv 3 16))
                    (bvand (enc-imm16 imm9) (bv #x6 16))
                    (bvlshr (bvand (enc-imm16 imm9) (bv #x20 16)) (bv 5 16))))

  (define funct2 (bvlshr (bvand (enc-imm16 imm9) (bv #x18 16)) (bv 3 16)))

  (rv_cb_insn (0x 6) imm funct2 rs1 (0x 1)))

(define (rvc_bnez rs1 imm9)
  (define imm (bvor (bvlshr (bvand (enc-imm16 imm9) (bv #x100 16)) (bv 3 16))
                    (bvlshr (bvand (enc-imm16 imm9) (bv #xc0 16)) (bv 3 16))
                    (bvand (enc-imm16 imm9) (bv #x6 16))
                    (bvlshr (bvand (enc-imm16 imm9) (bv #x20 16)) (bv 5 16))))

  (define funct2 (bvlshr (bvand (enc-imm16 imm9) (bv #x18 16)) (bv 3 16)))

  (rv_cb_insn (0x 7) imm funct2 rs1 (0x 1)))

(define-rvenc/16 (rvc_slli rd imm6)
  (rv_ci_insn 0 imm6 rd (0x 2)))

(define (rvc_lwsp rd imm8)
  (define imm6
    (bvor (bvlshr (bvand (enc-imm16 imm8) (bv #xc0 16)) (bv 6 16))
          (bvand (enc-imm16 imm8) (bv #x3c 16))))
  (rv_ci_insn (0x 2) imm6 rd (0x 2)))

(define (rvc_ldsp rd imm9)
  (define imm6
    (bvor (bvlshr (bvand (enc-imm16 imm9) (bv #x1c0 16)) (bv 6 16))
          (bvand (enc-imm16 imm9) (bv #x38 16))))
  (rv_ci_insn (0x 3) imm6 rd (0x 2)))

(define-rvenc/16 (rvc_jr rs1)
  (rv_cr_insn (0x 8) rs1 RV_REG_ZERO (0x 2)))

(define-rvenc/16 (rvc_mv rd rs)
  (rv_cr_insn (0x 8) rd rs (0x 2)))

(define-rvenc/16 (rvc_jalr rs1)
  (rv_cr_insn (0x 9) rs1 RV_REG_ZERO (0x 2)))

(define-rvenc/16 (rvc_add rd rs)
  (rv_cr_insn (0x 9) rd rs (0x 2)))

(define (rvc_swsp imm8 rs2)
  (define imm (bvor (bvand (enc-imm16 imm8) (bv #x3c 16))
                    (bvlshr (bvand (enc-imm16 imm8) (bv #xc0 16)) (bv 6 16))))
  (rv_css_insn (0x 6) imm rs2 (0x 2)))

(define (rvc_sdsp imm9 rs2)
  (define imm (bvor (bvand (enc-imm16 imm9) (bv #x38 16))
                    (bvlshr (bvand (enc-imm16 imm9) (bv #x1c0 16)) (bv 6 16))))
  (rv_css_insn (0x 7) imm rs2 (0x 2)))

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
