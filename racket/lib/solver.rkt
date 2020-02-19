#lang rosette


(require
  rosette/solver/smt/boolector
  rosette/solver/smt/z3)

; Utility for controlling solver / solver path
; from environment variables.

#|
  Code using this library can obtain a solver in three different modes.

  1. get-default-solver / with-default-solver lets the user choose
     solver and path with environment variables, choosing Rosette
     defualts if not set.

  2. get-* / with-* force a specific solver, but still lets the
     user control path to solver with environment variables.

  3. get-prefer-* / with-prefer-* first check if a specific solver
     is available, but fall back to the default solver if they are not.

|#

(provide (all-defined-out))

(define-syntax-rule (with-solver solver body ...)
  (parameterize ([current-solver solver])
    (printf "Using solver ~v\n" (current-solver))
    body ...))

(define-syntax-rule (with-z3 body ...) (with-solver (get-z3) body ...))
(define-syntax-rule (with-prefer-z3 body ...) (with-solver (get-prefer-z3) body ...))
(define-syntax-rule (with-boolector body ...) (with-solver (get-boolector) body ...))
(define-syntax-rule (with-prefer-boolector body ...) (with-solver (get-prefer-boolector) body ...))
(define-syntax-rule (with-default-solver body ...) (with-solver (get-default-solver) body ...))

(define (get-default-solver)
  (let ([solver (getenv "SOLVER")])
    (cond
      ; No specific solver requested, choose no particular order
      [(false? solver) (get-z3)]
      [(equal? (string-downcase solver) "boolector")
        (get-boolector)]
      [(equal? (string-downcase solver) "z3")
        (get-z3)]
      [else
        (error (format "Unknown solver type: ~v" solver))])))

(define (get-z3 #:logic [logic #f]
                #:options [options (hash ':auto-config 'false ':smt.relevancy 0)]
                #:required [required #t])
  (let ([path (getenv "Z3")])
    (cond
      [path (z3 #:path path #:logic logic #:options options)]
      [else (z3)])))

      ; TODO: why is there no "z3-available?"
      ; [(z3-available?) (z3 #:logic logic #:options options)]
      ; [required (error "No Z3 found and Z3 en not set!")]
      ; [else #f])))

(define (get-boolector #:logic [logic #f]
                       #:options [options (hash)]
                       #:required [required #t])
  (let ([path (getenv "BOOLECTOR")])
    (cond
      [path (boolector #:path path #:logic logic #:options options)]
      [(boolector-available?) (boolector #:logic logic #:options options)]
      [required (error "No Boolector found and Boolector en not set!")]
      [else #f])))

(define (get-prefer-boolector)
  (let ([boolector (get-boolector #:required #f)])
    (if boolector boolector (begin (printf "Could not find boolector, falling back to Z3\n")
                                   (get-default-solver)))))
