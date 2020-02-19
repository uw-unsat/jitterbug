#lang racket

(require "../../rv32/spec.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv32-alu64-k tests"
    (jit-verify-case '(BPF_ALU64 BPF_MOV BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_ADD BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_SUB BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_AND BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_OR BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_XOR BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_MUL BPF_K))
    #| Cannot implement without loops---JIT will not support |#
    ; (jit-test-case '(BPF_ALU64 BPF_DIV BPF_K))
    ; (jit-test-case '(BPF_ALU64 BPF_MOD BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_LSH BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_RSH BPF_K))
    (jit-verify-case '(BPF_ALU64 BPF_ARSH BPF_K))
))

(module+ test
  (time (run-tests tests)))
