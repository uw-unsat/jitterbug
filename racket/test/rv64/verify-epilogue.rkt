#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-epilogue "riscv64-epilogue tests" check-jit)))
