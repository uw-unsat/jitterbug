#lang racket/base

(require "../../rv64/spec.rkt" "../../rv64/bpf_jit_comp.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv64-alu64-k tests"
    (jit-verify-case '(BPF_ALU64 BPF_MOV BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_ADD BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_SUB BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_AND BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_OR BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_XOR BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_MUL BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_DIV BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_MOD BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_LSH BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_RSH BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_ARSH BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_NEG))
))

(module+ test
  (time (run-tests tests)))
