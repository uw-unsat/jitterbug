#lang rosette

(require
  (prefix-in core: serval/lib/core)
  (prefix-in bvaxiom: "../bvaxiom.rkt")
  "prologue.rkt"
  "epilogue.rkt"
  "per-insn.rkt"
  "tail-call.rkt"
  "bpf.rkt"
  rosette/lib/angelic
  serval/lib/bvarith
  serval/lib/debug
  serval/lib/solver
  serval/lib/unittest)

(provide (all-defined-out))

(define verify-fill-holes (make-parameter #f))
(define verify-split-asserts (make-parameter #f))

(define (@check-verify assocs asserted)
  (check-equal? (asserts) null)
  (cond
    ; Use synthesis to filling in the holes, disabled by default.
    [(verify-fill-holes)
      (define sol
         (synthesize
           #:forall (bpf-symbolics)
           #:guarantee (assert (apply && asserted))))
      (check-sat? sol)
      (displayln sol)]

    ; By default, verify asserts at once for better performance.
    ; If verification fails, verify individual asserts again for
    ; better debugging information (rather than "Unknown assert").
    [(and (not (verify-split-asserts))
          (unsat? (verify (assert (apply && asserted)))))
     ; yay
     (void)]

    [else
     (define total (length asserted))
     (define n 1)
     (for ([e asserted])
      (printf "Verifying assert ~v / ~v:\n" n total)
      (set! n (add1 n))
      ;;; (for ([bug (bug-ref e)])
      ;;;   (displayln ((dict-ref bug 'message))))

      (define model (verify (assert e)))
      (define info (list))
      (when (sat? model)
        ; set the check-info stack
        (set! info (map (lambda (p) (make-check-info (car p) (evaluate (cdr p) model))) assocs))
        (define bugs (bug-ref e))
        (when (null? bugs)
          (printf "Unknown assert\n"))
        (for ([bug bugs])
          (displayln (bug-format bug model))))
      (with-check-info*
        info
        (thunk (check-unsat? model))))]))

(define (@verify-bpf-jit code target)
  (parameterize
    ([solver-logic 'QF_UFBV]
     [bvaxiom:assumptions null]
     [bpf-symbolics null])
    (define proc
      (case code
        [(PROLOGUE)
          (thunk (prologue-correctness target))]
        [(EPILOGUE)
          (thunk (epilogue-correctness target))]
        [((BPF_JMP BPF_TAIL_CALL))
          (thunk (tail-call-correctness target))]
        [else
          (thunk
            (per-insn-correctness code target
              #:assumptions bvaxiom:assumptions))]))
    (define-values (assocs asserted) (with-asserts (proc)))
    (@check-verify assocs asserted)))

(define (verify-bpf-jit/64 code target)
  (parameterize
    ([core:target-pointer-bitwidth 64]
     [core:bvmulhu-proc bvaxiom:bvmulhu-uf/64]
     [core:bvmul-proc bvaxiom:bvmul-uf/64]
     [core:bvudiv-proc bvaxiom:bvudiv-uf/64]
     [core:bvurem-proc bvaxiom:bvurem-uf])
    (@verify-bpf-jit code target)))

(define (verify-bpf-jit/32 code target)
  (parameterize
    ([core:target-pointer-bitwidth 32]
     [core:bvmulhu-proc bvaxiom:bvmulhu-uf/32]
     [core:bvmul-proc bvaxiom:bvmul-uf/32]
     [core:bvudiv-proc bvaxiom:bvudiv-uf/32]
     [core:bvurem-proc bvaxiom:bvurem-uf])
    (@verify-bpf-jit code target)))