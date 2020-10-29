#lang racket/base

(require "../../riscv/rv32/spec.rkt" "../../riscv/rv32/synthesis.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv32-alu64-x synthesis"

    (jit-synthesize-case '(BPF_ALU64 BPF_MOV BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_ADD BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_SUB BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_AND BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_OR BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_XOR BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_MUL BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_DIV BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_MOD BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_LSH BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_RSH BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_ARSH BPF_X))
    ; (jit-synthesize-case '(BPF_ALU64 BPF_NEG))
))

(module+ test
  (time (run-tests tests)))
