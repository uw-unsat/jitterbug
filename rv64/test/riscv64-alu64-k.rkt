#lang racket/base

(require "../bpf_jit_riscv64.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv64-alu64-k tests"
    (jit-test-case '(BPF_ALU64 BPF_MOV BPF_K))
    (jit-test-case '(BPF_ALU64 BPF_ADD BPF_K))
    (jit-test-case '(BPF_ALU64 BPF_LSH BPF_K))
    (jit-test-case '(BPF_ALU64 BPF_RSH BPF_K))
    (jit-test-case '(BPF_ALU64 BPF_ARSH BPF_K))
    (jit-test-case '(BPF_ALU64 BPF_NEG))
))

(module+ test
  (time (run-tests tests)))
