#lang rosette

; This file is translated and adapted from arch/arm64/net/bpf_jit.h,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0-only
;
; BPF JIT compiler for ARM64
;
; Copyright (C) 2014-2016 Zi Shen Lim <zlim.lnx@gmail.com>

(require
  "insn.rkt"
  (prefix-in arm64: serval/arm64))

(provide
  AARCH64_BREAK_FAULT
  (all-defined-out))


; 5-bit Register Operand
(define A64_R arm64:integer->gpr)
(define A64_FP (A64_R 29)) ; Frame pointer
(define A64_LR (A64_R 30)) ; Link register
(define A64_ZR (A64_R 31)) ; Zero: as source register
(define A64_SP (A64_R 31)) ; Stack pointer: as load/store base reg


; Conditional branch (immediate)
(define A64_COND_EQ (bv #x0 4)) ; ==
(define A64_COND_NE (bv #x1 4)) ; !=
(define A64_COND_CS (bv #x2 4)) ; unsigned >=
(define A64_COND_HI (bv #x8 4)) ; unsigned >
(define A64_COND_LS (bv #x9 4)) ; unsigned <=
(define A64_COND_CC (bv #x3 4)) ; unsigned <
(define A64_COND_GE (bv #xa 4)) ; signed >=
(define A64_COND_GT (bv #xc 4)) ; signed >
(define A64_COND_LE (bv #xd 4)) ; signed <=
(define A64_COND_LT (bv #xb 4)) ; signed <
(define (A64_B_COND cond imm19) (arm64:b.cond (extract 18 0 imm19) cond))

; Unconditional branch (immediate)

(define (A64_BRANCH imm26 type) (type (extract 25 0 imm26)))

(define (A64_B imm26)  (A64_BRANCH imm26 arm64:b))
(define (A64_BL imm26) (A64_BRANCH imm26 arm64:bl))

; Unconditional branch (register)

(define (A64_BR Rn) (arm64:br Rn))
(define (A64_BLR Rn) (arm64:blr Rn))
(define (A64_RET Rn) (arm64:ret Rn))

; LSE atomics
(define (A64_STADD sf Rn Rs)
  ((if (bitvector->bool sf) arm64:stadd64 arm64:stadd32) Rs Rn))


; Load/store register (register offset)

(define (A64_LS_REG Rt Rn Rm type)
  (type Rm (bv #b011 3) (bv #b0 1) Rn Rt))

(define (A64_STRB Wt Xn Xm)  (A64_LS_REG Wt Xn Xm arm64:strb))
(define (A64_LDRB Wt Xn Xm)  (A64_LS_REG Wt Xn Xm arm64:ldrb))
(define (A64_STRH Wt Xn Xm)  (A64_LS_REG Wt Xn Xm arm64:strh))
(define (A64_LDRH Wt Xn Xm)  (A64_LS_REG Wt Xn Xm arm64:ldrh))
(define (A64_STR32 Wt Xn Xm) (A64_LS_REG Wt Xn Xm arm64:str32))
(define (A64_LDR32 Wt Xn Xm) (A64_LS_REG Wt Xn Xm arm64:ldr32))
(define (A64_STR64 Xt Xn Xm) (A64_LS_REG Xt Xn Xm arm64:str64))
(define (A64_LDR64 Xt Xn Xm) (A64_LS_REG Xt Xn Xm arm64:ldr64))

; Load/store register pair
; Rn -= 16; Rn[0] = Rt; Rn[8] = Rt2;
(define (A64_PUSH Rt Rt2 Rn) (arm64:stp-preindex (bv #b10 2) (bv -2 7) Rt2 Rn Rt))
; Rt = Rn[0]; Rt2 = Rn[8]; Rn += 16;
(define (A64_POP Rt Rt2 Rn) (arm64:ldp-postindex (bv #b10 2) (bv 2 7) Rt2 Rn Rt))

; Add/subtract (immediate)

(define (A64_ADDSUB_IMM sf Rd Rn imm12 type)
  (define lst (encode-addsub-immediate imm12 sf))
  (type sf (first lst) (second lst) Rn Rd))

; Rd = Rn OP imm12
(define (A64_ADD_I sf Rd Rn imm12) (A64_ADDSUB_IMM sf Rd Rn imm12 arm64:add-immediate))
(define (A64_SUB_I sf Rd Rn imm12) (A64_ADDSUB_IMM sf Rd Rn imm12 arm64:sub-immediate))
(define (A64_ADDS_I sf Rd Rn imm12) (A64_ADDSUB_IMM sf Rd Rn imm12 arm64:adds-immediate))
(define (A64_SUBS_I sf Rd Rn imm12) (A64_ADDSUB_IMM sf Rd Rn imm12 arm64:subs-immediate))
; Rn + imm12; set condition flags
(define (A64_CMN_I sf Rn imm12) (A64_ADDS_I sf A64_ZR Rn imm12))
; Rn - imm12; set condition flags
(define (A64_CMP_I sf Rn imm12) (A64_SUBS_I sf A64_ZR Rn imm12))

; Rd = Rn
(define (A64_MOV sf Rd Rn) (A64_ADD_I sf Rd Rn (bv 0 32)))


; Bitfield move

(define (A64_BITFIELD sf Rd Rn immr imms type)
  (type sf (extract 5 0 immr) (extract 5 0 imms) Rn Rd))

; Signed, with sign replication to left and zeros to right
(define (A64_SBFM sf Rd Rn ir is) (A64_BITFIELD sf Rd Rn ir is arm64:sbfm))
; Unsigned, with zeros to left and right
(define (A64_UBFM sf Rd Rn ir is) (A64_BITFIELD sf Rd Rn ir is arm64:ubfm))

; Rd = Rn << shift
(define (A64_LSL sf Rd Rn shift)
  ; sz = (sf) ? 64 : 32;
  ; immr = (unsigned)-(shift) % sz
  ; imms = sz - 1 - (shift)
  (define n (bitvector-size (type-of shift)))
  (define sz (if (bitvector->bool sf) (bv 64 n) (bv 32 n)))
  (define immr (bvand (bvneg shift) (bvsub sz (bv 1 n))))
  (define imms (bvsub sz (bv 1 n) shift))
  (A64_UBFM sf Rd Rn immr imms))
; Rd = Rn >> shift
(define (A64_LSR sf Rd Rn shift) (A64_UBFM sf Rd Rn shift (if (bitvector->bool sf) (bv 63 6) (bv 31 6))))
; Rd = Rn >> shift (signed)
(define (A64_ASR sf Rd Rn shift) (A64_SBFM sf Rd Rn shift (if (bitvector->bool sf) (bv 63 6) (bv 31 6))))

; Zero extend
(define (A64_UXTH sf Rd Rn) (A64_UBFM sf Rd Rn (bv 0 6) (bv 15 6)))
(define (A64_UXTW sf Rd Rn) (A64_UBFM sf Rd Rn (bv 0 6) (bv 31 6)))


; Move wide (immediate)

(define (A64_MOVEW sf Rd imm16 shift type)
  (define shiftbv
    (if (integer? shift)
        (bv (arithmetic-shift shift -4) 2)
        (extract 1 0 (bvlshr shift (integer->bitvector 4 (type-of shift))))))
  (type sf shiftbv (extract 15 0 imm16) Rd))

; Rd = Zeros (for MOVZ);
; Rd |= imm16 << shift (where shift is {0, 16, 32, 48});
; Rd = ~Rd; (for MOVN);
(define (A64_MOVN sf Rd imm16 shift) (A64_MOVEW sf Rd imm16 shift arm64:movn))
(define (A64_MOVZ sf Rd imm16 shift) (A64_MOVEW sf Rd imm16 shift arm64:movz))
(define (A64_MOVK sf Rd imm16 shift) (A64_MOVEW sf Rd imm16 shift arm64:movk))


; Add/subtract (shifted register)

(define (A64_ADDSUB_SREG sf Rd Rn Rm type)
  (type sf (bv 0 2) Rm (bv 0 6) Rn Rd))

; Rd = Rn OP Rm
(define (A64_ADD sf Rd Rn Rm) (A64_ADDSUB_SREG sf Rd Rn Rm arm64:add-shifted-register))
(define (A64_SUB sf Rd Rn Rm) (A64_ADDSUB_SREG sf Rd Rn Rm arm64:sub-shifted-register))
(define (A64_SUBS sf Rd Rn Rm) (A64_ADDSUB_SREG sf Rd Rn Rm arm64:subs-shifted-register))
; Rd = -Rm
(define (A64_NEG sf Rd Rm) (A64_SUB sf Rd A64_ZR Rm))
; Rn - Rm; set condition flags
(define (A64_CMP sf Rn Rm) (A64_SUBS sf A64_ZR Rn Rm))


; Data-processing (1 source)

; Rd = BSWAPx(Rn)
(define (A64_REV16 sf Rd Rn) (arm64:rev16 sf Rn Rd))
(define (A64_REV32 sf Rd Rn) (if (bitvector->bool sf)
                                 (arm64:rev32 Rn Rd)
                                 (arm64:rev sf Rn Rd)))
(define (A64_REV64 Rd Rn)    (arm64:rev64 Rn Rd))


; Data-processing (2 source)

(define (A64_DATA2 sf Rd Rn Rm type) (type sf Rm Rn Rd))

; Rd = Rn OP Rm
(define (A64_UDIV sf Rd Rn Rm) (A64_DATA2 sf Rd Rn Rm arm64:udiv))
(define (A64_LSLV sf Rd Rn Rm) (A64_DATA2 sf Rd Rn Rm arm64:lslv))
(define (A64_LSRV sf Rd Rn Rm) (A64_DATA2 sf Rd Rn Rm arm64:lsrv))
(define (A64_ASRV sf Rd Rn Rm) (A64_DATA2 sf Rd Rn Rm arm64:asrv))


; Data-processing (3 source)

; Rd = Ra + Rn * Rm
(define (A64_MADD sf Rd Ra Rn Rm) (arm64:madd sf Rm Ra Rn Rd))
; Rd = Ra - Rn * Rm
(define (A64_MSUB sf Rd Ra Rn Rm) (arm64:msub sf Rm Ra Rn Rd))
; Rd = Rn * Rm
(define (A64_MUL sf Rd Rn Rm) (A64_MADD sf Rd A64_ZR Rn Rm))


; Logical (immediate)

(define (A64_LOGIC_IMM sf Rd Rn imm type)
  (define imm64 ((if (bitvector->bool sf) sign-extend zero-extend) imm (bitvector 64)))
  (define lst (encode-logical-immediate imm64 sf))
  (if (equal? lst AARCH64_BREAK_FAULT)
      AARCH64_BREAK_FAULT
      (type sf (first lst) (second lst) (third lst) Rn Rd)))

; Rd = Rn OP imm
(define (A64_AND_I sf Rd Rn imm) (A64_LOGIC_IMM sf Rd Rn imm arm64:and-immediate))
(define (A64_ORR_I sf Rd Rn imm) (A64_LOGIC_IMM sf Rd Rn imm arm64:orr-immediate))
(define (A64_EOR_I sf Rd Rn imm) (A64_LOGIC_IMM sf Rd Rn imm arm64:eor-immediate))
(define (A64_ANDS_I sf Rd Rn imm) (A64_LOGIC_IMM sf Rd Rn imm arm64:ands-immediate))
; Rn & imm; set condition flags
(define (A64_TST_I sf Rn imm) (A64_ANDS_I sf A64_ZR Rn imm))


; Logical (shifted register)

(define (A64_LOGIC_SREG sf Rd Rn Rm type)
  (type sf (bv 0 2) Rm (bv 0 6) Rn Rd))

; Rd = Rn OP Rm
(define (A64_AND sf Rd Rn Rm) (A64_LOGIC_SREG sf Rd Rn Rm arm64:and-shifted-register))
(define (A64_ORR sf Rd Rn Rm) (A64_LOGIC_SREG sf Rd Rn Rm arm64:orr-shifted-register))
(define (A64_EOR sf Rd Rn Rm) (A64_LOGIC_SREG sf Rd Rn Rm arm64:eor-shifted-register))
(define (A64_ANDS sf Rd Rn Rm) (A64_LOGIC_SREG sf Rd Rn Rm arm64:ands-shifted-register))
; Rn & Rm; set condition flags
(define (A64_TST sf Rn Rm) (A64_ANDS sf A64_ZR Rn Rm))
