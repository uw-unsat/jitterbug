#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp64-k "riscv32-jmp64-k tests" check-jit)))
