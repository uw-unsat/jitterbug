#lang racket/base

(require "../../riscv/rv32/spec.rkt" "../../riscv/rv32/synthesis.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv32-alu32-x synthesis"
    ; (jit-verify-case '(BPF_ALU BPF_END BPF_FROM_BE))
    ; (jit-verify-case '(BPF_ALU BPF_END BPF_FROM_LE))

    (jit-synthesize-case '(BPF_ALU BPF_MOV BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_ADD BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_SUB BPF_X))
    (jit-synthesize-case '(BPF_ALU BPF_AND BPF_X))
    (jit-synthesize-case '(BPF_ALU BPF_OR BPF_X))
    (jit-synthesize-case '(BPF_ALU BPF_XOR BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_MUL BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_DIV BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_MOD BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_LSH BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_RSH BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_ARSH BPF_X))
    ; (jit-synthesize-case '(BPF_ALU BPF_NEG))
))

(module+ test
  (time (run-tests tests)))
