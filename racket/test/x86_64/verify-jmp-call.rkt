#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp-call "x86_64-jmp-call tests" check-jit
                         #:selector (verify-only-in (list 'BPF_CALL 'BPF_EXIT)))))
