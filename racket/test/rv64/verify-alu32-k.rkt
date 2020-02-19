#lang racket/base

(require "../../rv64/spec.rkt" "../../rv64/bpf_jit_riscv64.rkt")
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
    (jit-verify-case '(BPF_ALU BPF_MUL BPF_K))
    (jit-verify-case '(BPF_ALU BPF_DIV BPF_K))
    (jit-verify-case '(BPF_ALU BPF_MOD BPF_K))
    (jit-verify-case '(BPF_ALU BPF_LSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_RSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_ARSH BPF_K))
    (jit-verify-case '(BPF_ALU BPF_NEG))
))

(module+ test
  (time (run-tests tests)))
