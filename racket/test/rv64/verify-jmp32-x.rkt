#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp32-x "riscv64-jmp32-x tests" check-jit)))
