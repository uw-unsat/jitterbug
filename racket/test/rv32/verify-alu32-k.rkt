#lang racket

(require "../../rv32/spec.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv32-alu32-k tests"
    (jit-verify-case '(BPF_ALU BPF_MOV BPF_K))
    (jit-verify-case '(BPF_ALU BPF_ADD BPF_K))
    (jit-verify-case '(BPF_ALU BPF_SUB BPF_K))
    (jit-verify-case '(BPF_ALU BPF_AND BPF_K))
    (jit-verify-case '(BPF_ALU BPF_OR BPF_K))
    (jit-verify-case '(BPF_ALU BPF_XOR BPF_K))
    (jit-verify-case '(BPF_ALU BPF_MUL BPF_K))
    (jit-verify-case '(BPF_ALU BPF_DIV BPF_K))
    (jit-verify-case '(BPF_ALU BPF_MOD BPF_K))
    (jit-verify-case '(BPF_ALU BPF_LSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_RSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_ARSH BPF_K))
))

(module+ test
  (time (run-tests tests)))
