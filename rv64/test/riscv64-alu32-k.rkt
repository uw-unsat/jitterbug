#lang racket/base

(require "../bpf_jit_riscv64.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv64-alu32-k tests"
    (jit-verify-case '(BPF_ALU BPF_MOV BPF_K))
    (jit-verify-case '(BPF_ALU BPF_ADD BPF_K))
    (jit-verify-case '(BPF_ALU BPF_SUB BPF_K))
    (jit-verify-case '(BPF_ALU BPF_AND BPF_K))
    (jit-verify-case '(BPF_ALU BPF_OR BPF_K))
    (jit-verify-case '(BPF_ALU BPF_XOR BPF_K))

    ; Solvers have trouble reasoning about non-linear arithmetic.
    ; Instead, perform testing for these operations using random
    ; initial register and immediate values.
    (jit-test-case '(BPF_ALU BPF_MUL BPF_K))
    (jit-test-case '(BPF_ALU BPF_DIV BPF_K))
    (jit-test-case '(BPF_ALU BPF_MOD BPF_K))

    (jit-verify-case '(BPF_ALU BPF_LSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_RSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_ARSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_NEG))
))

(module+ test
  (time (run-tests tests)))
