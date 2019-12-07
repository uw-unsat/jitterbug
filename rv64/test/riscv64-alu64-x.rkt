#lang racket/base

(require "../bpf_jit_riscv64.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv64-alu64-x tests"
    (jit-test-case '(BPF_ALU64 BPF_MOV BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_ADD BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_SUB BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_AND BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_OR BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_XOR BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_LSH BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_RSH BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_ARSH BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_MUL BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_DIV BPF_X))
    (jit-test-case '(BPF_ALU64 BPF_MOD BPF_X))
))

(module+ test
  (time (run-tests tests)))
