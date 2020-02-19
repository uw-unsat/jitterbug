#lang racket

(require "../../rv64/spec.rkt" "../../rv64/bpf_jit_riscv64.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv64-jump64-k tests"
    (jit-verify-case '(BPF_JMP BPF_JA BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JSET BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JEQ BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JGT BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JLT BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JGE BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JLE BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JNE BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JSGT BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JSLT BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JSGE BPF_K))
    (jit-verify-case '(BPF_JMP BPF_JSLE BPF_K))
))

(module+ test
  (time (run-tests tests)))
