#lang racket

(provide (all-defined-out))

; Boolean flags that act as parameters in Racket but can be controlled
; using environment variables.
(define (make-environment-flag env-varname default)
  (define env-var (getenv env-varname))
  (define value
    (cond
      [(false? env-var) default]
      [(member (string-downcase env-var) (list "false" "#f" "0"))
        #f]
      [(member (string-downcase env-var) (list "true" "#t" "1"))
        #t]
      [else ; Reject anything else
        (error "Environment variable flags must be truthy or falsey: [false, #f, 0, true, #t, 1]")]))
  (eprintf "~a=~v\n" env-varname value)
  (make-parameter value))
