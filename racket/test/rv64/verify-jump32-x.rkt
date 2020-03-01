#lang racket

(require "../../rv64/spec.rkt" "../../rv64/bpf_jit_comp.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv64-jump32-x tests"
    (jit-verify-case '(BPF_JMP32 BPF_JSET BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JEQ BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JGT BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JLT BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JGE BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JLE BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JNE BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JSGT BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JSLT BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JSGE BPF_X))
    (jit-verify-case '(BPF_JMP32 BPF_JSLE BPF_X))
))

(module+ test
  (time (run-tests tests)))
