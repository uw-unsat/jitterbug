#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp64-x "riscv32-jmp64-x tests" check-jit)))