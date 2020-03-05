#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp32-k "riscv32-jmp32-k tests" check-jit)))