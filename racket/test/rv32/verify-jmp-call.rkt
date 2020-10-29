#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp-call "riscv32-jmp-call tests" check-jit #:selector verify-all)))
