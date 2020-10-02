#lang rosette

; This file is translated and adapted from arch/arm/net/bpf_jit_32.h,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0-only
;
; Just-In-Time compiler for BPF filters on 32bit ARM
;
; Copyright (c) 2011 Mircea Gherzan <mgherzan@gmail.com>

(require
  (prefix-in arm32: serval/arm32))

(provide (all-defined-out))


; ARM 32bit Registers
(define ARM_R0 (arm32:integer->gpr 0))
(define ARM_R1 (arm32:integer->gpr 1))
(define ARM_R2 (arm32:integer->gpr 2))
(define ARM_R3 (arm32:integer->gpr 3))
(define ARM_R4 (arm32:integer->gpr 4))
(define ARM_R5 (arm32:integer->gpr 5))
(define ARM_R6 (arm32:integer->gpr 6))
(define ARM_R7 (arm32:integer->gpr 7))
(define ARM_R8 (arm32:integer->gpr 8))
(define ARM_R9 (arm32:integer->gpr 9))
(define ARM_R10 (arm32:integer->gpr 10))
(define ARM_FP (arm32:integer->gpr 11)) ; Frame Pointer
(define ARM_IP (arm32:integer->gpr 12)) ; Intra-procedure scratch register
(define ARM_SP (arm32:integer->gpr 13)) ; Stack pointer: as load/store base reg
(define ARM_LR (arm32:integer->gpr 14)) ; Link Register
(define ARM_PC (arm32:integer->gpr 15)) ; Program counter

(define ARM_COND_EQ #x0) ; ==
(define ARM_COND_NE #x1) ; !=
(define ARM_COND_CS #x2) ; unsigned >=
(define ARM_COND_HS ARM_COND_CS)
(define ARM_COND_CC #x3) ; unsigned <
(define ARM_COND_LO ARM_COND_CC)
(define ARM_COND_MI #x4) ; < 0
(define ARM_COND_PL #x5) ; >= 0
(define ARM_COND_VS #x6) ; Signed Overflow
(define ARM_COND_VC #x7) ; No Signed Overflow
(define ARM_COND_HI #x8) ; unsigned >
(define ARM_COND_LS #x9) ; unsigned <=
(define ARM_COND_GE #xa) ; Signed >=
(define ARM_COND_LT #xb) ; Signed <
(define ARM_COND_GT #xc) ; Signed >
(define ARM_COND_LE #xd) ; Signed <=
(define ARM_COND_AL #xe) ; None

; register shift types
(define SRTYPE_LSL 0)
(define SRTYPE_LSR 1)
(define SRTYPE_ASR 2)
(define SRTYPE_ROR 3)
(define SRTYPE_ASL SRTYPE_LSL)

; register
(define (_AL3_R op rd rn rm) (op rn rd (bv 0 5) (bv 0 2) rm))
; immediate
(define (_AL3_I op rd rn imm) (op rn rd (extract 11 0 imm)))

(define (ARM_ADD_R rd rn rm) (_AL3_R arm32:add-register rd rn rm))
(define (ARM_ADDS_R rd rn rm) (_AL3_R arm32:adds-register rd rn rm))
(define (ARM_ADD_I rd rn imm) (_AL3_I arm32:add-immediate rd rn imm))
(define (ARM_ADDS_I rd rn imm) (_AL3_I arm32:adds-immediate rd rn imm))
(define (ARM_ADC_R rd rn rm) (_AL3_R arm32:adc-register rd rn rm))
(define (ARM_ADC_I rd rn imm) (_AL3_I arm32:adc-immediate rd rn imm))

(define (ARM_AND_R rd rn rm) (_AL3_R arm32:and-register rd rn rm))
(define (ARM_ANDS_R rd rn rm) (_AL3_R arm32:ands-register rd rn rm))
(define (ARM_AND_I rd rn imm) (_AL3_I arm32:and-immediate rd rn imm))

(define (ARM_B imm24) (arm32:b (extract 23 0 imm24)))
(define (ARM_BLX_R rm) (arm32:blx-register rm))

(define (ARM_CMP_R rn rm) (arm32:cmp-register rn (bv 0 5) (bv 0 2) rm))
(define (ARM_CMP_I rn imm) (arm32:cmp-immediate rn (extract 11 0 imm)))

(define (ARM_EOR_R rd rn rm) (_AL3_R arm32:eor-register rd rn rm))
(define (ARM_EOR_I rd rn imm) (_AL3_I arm32:eor-immediate rd rn imm))

(define (ARM_LDM rn regs) (arm32:ldmia (bv 1 1) rn regs))

(define (ARM_LSL_R rd rn rm) (ARM_MOV_SR rd rn SRTYPE_LSL rm))
(define (ARM_LSL_I rd rn imm) (arm32:lsl-immediate rd (extract 4 0 imm) rn))

(define (ARM_LSR_R rd rn rm) (ARM_MOV_SR rd rn SRTYPE_LSR rm))
(define (ARM_LSR_I rd rn imm) (arm32:lsr-immediate rd (extract 4 0 imm) rn))

(define (ARM_ASR_R rd rn rm) (ARM_MOV_SR rd rn SRTYPE_ASR rm))
(define (ARM_ASR_I rd rn imm) (arm32:asr-immediate rd (extract 4 0 imm) rn))

(define (ARM_MOV_R rd rm) (arm32:mov-register rd (bv 0 5) (bv 0 2) rm))
(define (ARM_MOV_I rd imm) (arm32:mov-immediate rd (extract 11 0 imm)))
(define (ARM_MOV_SR rd rm type rs)
  (arm32:mov-register-shifted-register rd rs (bv type 2) rm))
(define (ARM_MOV_SI rd rm type imm5)
  (arm32:mov-register rd (extract 4 0 imm5) (bv type 2) rm))

(define (ARM_MOVW rd imm)
  (arm32:movw (extract 15 12 imm) rd (extract 11 0 imm)))

(define (ARM_MOVT rd imm)
  (arm32:movt (extract 15 12 imm) rd (extract 11 0 imm)))

(define (ARM_MUL rd rm rn) (arm32:mul rd rm rn))

(define (ARM_PUSH regs) (arm32:stmdb (bv 1 1) ARM_SP regs))

(define (ARM_ORR_R rd rn rm) (_AL3_R arm32:orr-register rd rn rm))
(define (ARM_ORR_I rd rn imm) (_AL3_I arm32:orr-immediate rd rn imm))
(define (ARM_ORR_SR rd rn rm type rs)
  (arm32:orr-register-shifted-register rn rd rs (bv type 2) rm))
(define (ARM_ORRS_R rd rn rm) (_AL3_R arm32:orrs-register rd rn rm))
(define (ARM_ORR_SI rd rn rm type imm5)
  (arm32:orr-register rn rd (extract 4 0 imm5) (bv type 2) rm))
(define (ARM_ORRS_SI rd rn rm type imm5)
  (arm32:orrs-register rn rd (extract 4 0 imm5) (bv type 2) rm))

(define (ARM_REV rd rm) (arm32:rev rd rm))
(define (ARM_REV16 rd rm) (arm32:rev16 rd rm))

(define (ARM_RSB_I rd rn imm) (_AL3_I arm32:rsb-immediate rd rn imm))
(define (ARM_RSBS_I rd rn imm) (_AL3_I arm32:rsbs-immediate rd rn imm))
(define (ARM_RSC_I rd rn imm) (_AL3_I arm32:rsc-immediate rd rn imm))

(define (ARM_SUB_R rd rn rm) (_AL3_R arm32:sub-register rd rn rm))
(define (ARM_SUBS_R rd rn rm) (_AL3_R arm32:subs-register rd rn rm))
(define (ARM_RSB_R rd rn rm) (_AL3_R arm32:rsb-register rd rn rm))
(define (ARM_SBC_R rd rn rm) (_AL3_R arm32:sbc-register rd rn rm))
(define (ARM_SBCS_R rd rn rm) (_AL3_R arm32:sbcs-register rd rn rm))
(define (ARM_SUB_I rd rn imm) (_AL3_I arm32:sub-immediate rd rn imm))
(define (ARM_SUBS_I rd rn imm) (_AL3_I arm32:subs-immediate rd rn imm))
(define (ARM_SBC_I rd rn imm) (_AL3_I arm32:sbc-immediate rd rn imm))

(define (ARM_UDIV rd rn rm) (arm32:udiv rd rm rn))

(define (ARM_UMULL rd_lo rd_hi rn rm) (arm32:umull rd_hi rd_lo rm rn))

(define (ARM_MLS rd rn rm ra) (arm32:mls rd ra rm rn))

(define (ARM_UXTH rd rm) (arm32:uxth rd (bv 0 2) rm))
