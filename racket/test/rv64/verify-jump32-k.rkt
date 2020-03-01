#lang racket

(require "../../rv64/spec.rkt" "../../rv64/bpf_jit_comp.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv64-jump32-k tests"
    (jit-verify-case '(BPF_JMP32 BPF_JSET BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JEQ BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JGT BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JLT BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JGE BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JLE BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JNE BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JSGT BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JSLT BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JSGE BPF_K))
    (jit-verify-case '(BPF_JMP32 BPF_JSLE BPF_K))
))

(module+ test
  (time (run-tests tests)))
