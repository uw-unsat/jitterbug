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

(define (@check-verify assocs asserted)
  (check-true (vc-true? (vc)))
  (cond
    ; Use synthesis to filling in the holes, disabled by default.
    [(verify-fill-holes)
      (define sol
         (synthesize
           #:forall (bpf-symbolics)
           #:guarantee (assert asserted)))
      (check-sat? sol)
      (displayln sol)]

    [else
      (assert asserted)]))

(define (@verify-bpf-jit code target)
  (parameterize
    ([solver-logic 'QF_UFBV]
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
            (per-insn-correctness code target))]))
    (define result (with-vc vc-true (proc)))
    (check-true (normal? result) (format "Execution terminated abnormally:~n ~s" (result-value result)))
    (define assocs (result-value result))
    (define asserted (vc-asserts (result-state result)))
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
