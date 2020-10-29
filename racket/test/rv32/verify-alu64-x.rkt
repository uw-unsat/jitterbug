#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-x "riscv32-alu64-x tests" check-jit
         #:selector skip-div+mod)))
