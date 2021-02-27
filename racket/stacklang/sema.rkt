#lang rosette

(require (prefix-in core: serval/lib/core)
         "../lib/hybrid-memory.rkt")

(provide (all-defined-out))

(define inject-bugs (make-parameter #f))

(struct cpu (pc sp memmgr) #:transparent #:mutable)

(define (init-cpu memmgr)
  (define-symbolic* pc (bitvector 32))
  (define-symbolic* sp (bitvector 32))
  (cpu pc sp memmgr))

(define-generics insn
  (opcodeof insn)
  (immof insn)
  (interpret-insn insn cpu))

(define (@immof insn)
  (zero-extend (immof insn) (bitvector 32)))

(struct pop () #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'POP)
   (define (immof insn) #f)
   (define (interpret-insn insn cpu)
    (define mm (cpu-memmgr cpu))
    (define sp (cpu-sp cpu))
    ; Increment sp
    (set! sp (bvadd (bv 4 32) sp))
    ; there is a value on stack to pop
    (assert (bvule sp (bvsub (hybrid-memmgr-stackbase mm) (bv 4 32))))
    (set-cpu-sp! cpu sp)
    (set-cpu-pc! cpu (bvadd1 (cpu-pc cpu))))])

(struct sub () #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'SUB)
   (define (immof insn) #f)
   (define (interpret-insn insn cpu)
    (define mm (cpu-memmgr cpu))
    (define sp (cpu-sp cpu))

    ; At least two stack elements
    (assert (bvule sp (bvsub (hybrid-memmgr-stackbase mm) (bv 8 32))))

    (define a (core:memmgr-load mm sp (bv 0 32) (bv 4 32)))
    (define b (core:memmgr-load mm sp (bv 4 32) (bv 4 32)))

    (core:memmgr-store! mm sp (bv 0 32) (bvsub a b) (bv 4 32))
    (set-cpu-pc! cpu (bvadd1 (cpu-pc cpu))))])

(struct swap () #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'SWAP)
   (define (immof insn) #f)
   (define (interpret-insn insn cpu)
    (define mm (cpu-memmgr cpu))
    (define sp (cpu-sp cpu))

    ; At least two stack elements
    (assert (bvule sp (bvsub (hybrid-memmgr-stackbase mm) (bv 8 32))))

    (define a (core:memmgr-load mm sp (bv 0 32) (bv 4 32)))
    (define b (core:memmgr-load mm sp (bv 4 32) (bv 4 32)))

    (core:memmgr-store! mm sp (bv 0 32) b (bv 4 32))
    (core:memmgr-store! mm sp (bv 4 32) a (bv 4 32))
    (set-cpu-pc! cpu (bvadd1 (cpu-pc cpu))))])

(struct push (i) #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'PUSH)
   (define (immof insn) (push-i insn))
   (define (interpret-insn insn cpu)
    (define mm (cpu-memmgr cpu))
    (define sp (cpu-sp cpu))
    ; No overflow
    (assert (bvult (bvsub sp (bv 4 32)) sp))
    (set! sp (bvsub sp (bv 4 32)))
    ; Room enough to push
    (assert (bvuge sp (bvsub (hybrid-memmgr-stackbase mm)
                             (hybrid-memmgr-stacksize mm))))

    (when (! (inject-bugs))
      (core:memmgr-store! mm sp (bv 0 32)
                          (zero-extend (push-i insn) (bitvector 32)) (bv 4 32)))
    (set-cpu-sp! cpu sp)
    (set-cpu-pc! cpu (bvadd1 (cpu-pc cpu))))])

(struct jump (i) #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'JUMP)
   (define (immof insn) (jump-i insn))
   (define (interpret-insn insn cpu)
    (define i32 (zero-extend (jump-i insn) (bitvector 32)))
    (set-cpu-pc! cpu i32))])

(struct jeq (i) #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'JEQ)
   (define (immof insn) (jeq-i insn))
   (define (interpret-insn insn cpu)
    (define mm (cpu-memmgr cpu))
    (define i32 (zero-extend (jeq-i insn) (bitvector 32)))
    (define sp (cpu-sp cpu))

    ; At least two stack elements
    (assert (bvule sp (bvsub (hybrid-memmgr-stackbase mm) (bv 8 32))))

    (define a (core:memmgr-load mm sp (bv 0 32) (bv 4 32)))
    (define b (core:memmgr-load mm sp (bv 4 32) (bv 4 32)))

    (if (equal? a b)
        (set-cpu-pc! cpu i32)
        (set-cpu-pc! cpu (bvadd1 (cpu-pc cpu)))))])

(struct jlt (i) #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'JLT)
   (define (immof insn) (jlt-i insn))
   (define (interpret-insn insn cpu)
    (define mm (cpu-memmgr cpu))
    (define i32 (zero-extend (jlt-i insn) (bitvector 32)))
    (define sp (cpu-sp cpu))

    ; At least two stack elements
    (assert (bvule sp (bvsub (hybrid-memmgr-stackbase mm) (bv 8 32))))

    (define a (core:memmgr-load mm sp (bv 0 32) (bv 4 32)))
    (define b (core:memmgr-load mm sp (bv 4 32) (bv 4 32)))

    (if (bvult a b)
        (set-cpu-pc! cpu i32)
        (set-cpu-pc! cpu (bvadd1 (cpu-pc cpu)))))])

; Stop has no source semantics
(struct stop () #:transparent
  #:methods gen:insn
  [(define (opcodeof insn) 'STOP)
   (define (immof insn) #f)
   (define (interpret-insn insn cpu) (void))])
