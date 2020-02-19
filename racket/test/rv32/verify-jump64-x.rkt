#lang racket

(require "../../rv32/spec.rkt")
(require serval/lib/unittest)

(define tests
  (test-suite+
    "riscv32-jump64-x tests"
    (jit-verify-case '(BPF_JMP BPF_JEQ BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JGT BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JLT BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JGE BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JLE BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JNE BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JSGT BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JSLT BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JSGE BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JSLE BPF_X))
    (jit-verify-case '(BPF_JMP BPF_JSET BPF_X))
))

(module+ test
  (time (run-tests tests)))
