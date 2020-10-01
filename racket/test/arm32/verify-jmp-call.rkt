#lang racket/base

(require
  "../../lib/tests.rkt"
  "../../lib/hybrid-memory.rkt"
  (only-in "../../arm32/spec.rkt" check-jit))

(module+ test
  (time
    (parameterize ([enable-stack-addr-symopt #f])
      (verify-jmp-call "arm32-jmp-call tests" check-jit))))