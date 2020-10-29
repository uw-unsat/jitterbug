#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp-call "riscv64-jmp-call tests" check-jit #:selector skip-tail-call)))
