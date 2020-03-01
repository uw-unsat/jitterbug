#lang rosette

(require
  rosette/solver/smt/boolector
  serval/lib/unittest
  racket/control
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in core: serval/lib/core)
  rosette/lib/synthax
  rosette/lib/angelic
  "../lib/bpf-common.rkt"
  "../lib/riscv-common.rkt"
  serval/lib/solver
  "../lib/rvsynth.rkt"
  "spec.rkt")

(provide (all-defined-out))

; ; A JIT compiler is a vector of instruction templates
; (struct instr-template (op rd rs1 rs2 imm) #:transparent)

(define rv64-dst-regs '(tmp tmp2 dst))
(define rv64-src-regs '(tmp tmp2 src zero dst))

; Register mappping
(define regmap '(a5 a0))

; Interpret a register template, given a concrete source and destination register.
(define (rv64-interpret-reg reg-template dst src)
  (case reg-template
    [(zero) 'zero]
    [(tmp) 't0]
    [(tmp2) 't1]
    [(src) (list-ref regmap (bpf:reg-idx src))]
    [(dst) (list-ref regmap (bpf:reg-idx dst))]))

(define (render-reg r)
  (case r
    [(tmp) "RV_REG_T0"]
    [(tmp2) "RV_REG_T1"]
    [(zero) "RV_REG_ZERO"]
    [(src) "src"]
    [(dst) "dst"]))

(define (render-immediate immediate)
  (format "0x~x" (bitvector->natural immediate)))

(define (render-instr template)
  (cond
    [(riscv:rv_r_insn? template)
      (define op (riscv:rv_r_insn-op template))
      (define rd (riscv:rv_r_insn-rd template))
      (define rs1 (riscv:rv_r_insn-rs1 template))
      (define rs2 (riscv:rv_r_insn-rs2 template))

      (format "    emit(rv_~s(~a, ~a, ~a), ctx);" op (render-reg rd) (render-reg rs1) (render-reg rs2))]

    [(riscv:rv_i_insn? template)
      (define op (riscv:rv_i_insn-op template))
      (define rd (riscv:rv_i_insn-rd template))
      (define rs1 (riscv:rv_i_insn-rs1 template))
      (define imm (riscv:rv_i_insn-imm12 template))

      (format "    emit(rv_~s(~a, ~a, ~a), ctx);" op (render-reg rd) (render-reg rs1) (render-immediate imm))]

    [else (assert #f (format "Don't know how to render ~v" template))]))


(define (render-jit jit)
  (define instrs (string-join (map render-instr (vector->list jit)) "\n" #:after-last "\n"))
  (format "void emit_op(u8 dst, u8 src, s32 imm, struct rv_jit_context *ctx) {\n~a}" instrs))

(define (synth-jit-loop op #:maxsize maxsize)
  (let/ec k
    (for ([size (in-range maxsize)])
      (define j (synthesize-op op #:size size #:target rv64-target))
      (when j (k j)))
    #f))


(define (synth-and-print op)
  (define jit (synth-jit-loop op #:maxsize 8))
  (if jit
    (printf "\nSolution found for ~v:\n~a\n\n" op (render-jit jit))
    (printf "No solution.\n")))

(define-syntax-rule (jit-synthesize-case code)
  (test-case+ (format "SYNTHESIZE ~s" code)
    (begin
      (with-prefer-boolector
        (parameterize
          ([riscv:XLEN 64]
            [dst-regs rv64-dst-regs]
            [src-regs rv64-src-regs]
            [interpret-reg rv64-interpret-reg]
            [current-bitwidth #f]
            [core:target-endian 'little]
            [core:target-pointer-bitwidth 64])
        (synth-and-print code))))))
