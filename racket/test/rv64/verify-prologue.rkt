#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-prologue "riscv64-prologue tests" check-jit)))
