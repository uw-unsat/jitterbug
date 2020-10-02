#lang rosette

(require
  (prefix-in core: serval/lib/core))

(provide (all-defined-out))

; Ensure that expr is concretely true.
(define (static-assert expr msg)
  (unless expr
    (eprintf "static assertion failed: ~a" msg)
    (exit 1)))

; Simplify e1 with e2 and return e2.
; This is used to rewrite REX and ModR/M bytes.
(define (simplify-with e1 e2 #:msg msg)
  (core:bug-on (! (equal? e1 e2)) #:msg msg)
  e2)
