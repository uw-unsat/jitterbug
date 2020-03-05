#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-endian "riscv64-endian tests" check-jit)))
