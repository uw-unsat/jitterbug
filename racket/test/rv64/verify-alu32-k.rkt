#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-alu32-k "riscv64-alu32-k tests" check-jit)))
