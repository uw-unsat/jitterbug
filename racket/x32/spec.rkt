#lang rosette

(require
  serval/lib/solver
  "jit.rkt"
  "../lib/bpf-common.rkt"
  (prefix-in bvaxiom: "../lib/bvaxiom.rkt")
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in x32: serval/x32))

(provide (all-defined-out))

(define (init-ctx)
  (define-symbolic* addrs (~> (bitvector 32) (bitvector 32)))
  (define-symbolic* len (bitvector 32))
  (define ctx (context (vector) addrs len))
  ctx)

(define (code-size vec)
  (define total 0)
  (for ([x vec])
    (set! total (+ total (x32:instruction-size x))))
  total)

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offset ctx))
  (define (prev-offset insn)
   (if (bveq insn (bv 0 32)) (bv 0 32) (offsets (bvsub insn (bv 1 32)))))
  (bvadd
    target-pc-base
    (zero-extend (prev-offset bpf-pc) (bitvector 32))))

(define (cpu-equal? bpf x32)
  (define bpf-regs (bpf:regs->vector (bpf:cpu-regs bpf)))
  (define stack-block (core:find-block-by-name (x32:cpu-mregions x32) 'stack))
  (define x32-regs
    (for/vector [(i (in-range (vector-length bpf-regs)))]
      (define loval
        (core:mblock-iload stack-block (list (bv (/ (lo (bpf2ia32 i)) 4) 32))))
      (define hival
        (core:mblock-iload stack-block (list (bv (/ (hi (bpf2ia32 i)) 4) 32))))
      (concat hival loval)))
  (equal? bpf-regs x32-regs))

(define (init-x32-cpu target-pc bpf-cpu)
  (define bpf-regs (bpf:regs->vector (bpf:cpu-regs bpf-cpu)))

  (define globals (make-hash (list (cons 'stack (thunk (core:marray (/ STACK_SIZE 4) (core:mcell 4)))))))
  (define stack-base #x1000)
  (define stack-top (+ stack-base STACK_SIZE))
  (define symbols `((,stack-base ,stack-top B stack)))

  (define x32-cpu (x32:init-cpu symbols globals))
  (x32:set-cpu-pc! x32-cpu target-pc)

  ; be lazy & simple
  (x32:gpr-set! x32-cpu 'ebp (bv stack-base 32))

  (define stack-block (core:find-block-by-name (x32:cpu-mregions x32-cpu) 'stack))

  (for ([i (in-range (vector-length bpf-regs))]
        [v bpf-regs])
    (define loreg (lo (bpf2ia32 i)))
    (define loval (extract 31 0 v))
    (define hireg (hi (bpf2ia32 i)))
    (define hival (extract 63 32 v))
    (if (integer? loreg)
      (core:mblock-istore! stack-block loval (list (bv (/ loreg 4) 32)))
      (x32:gpr-set! x32-cpu loreg loval))
    (if (integer? hireg)
      (core:mblock-istore! stack-block hival (list (bv (/ hireg 4) 32)))
      (x32:gpr-set! x32-cpu hireg hival)))

  x32-cpu)

(define (fetch prog base pc)
  (define n (bitvector->natural (bvsub pc base)))
  (cond
    ; jump (symbolic address)
    [(term? n) #f]
    [else
     (let ([e (assoc n prog)])
       (if e (cdr e) #f))]))

(define (interpret-program base cpu prog)
  (for/all ([pc (x32:cpu-pc cpu) #:exhaustive])
    (begin
      (x32:set-cpu-pc! cpu pc)
      (define insn (fetch prog base pc))
      (for/all ([insn insn #:exhaustive])
        (when insn
          (x32:interpret-instr cpu insn)
          (interpret-program base cpu prog))))))

; (off, insn)
(define (make-x32-program insns)
  (define off 0)
  (for/list ([insn (in-vector insns)])
    (define cur off)
    (set! off (+ off (x32:instruction-size insn)))
    (cons cur insn)))

(define (run-jitted-code x32-cpu insns)
  (define base (x32:cpu-pc x32-cpu))
  (for/all ([insns insns #:exhaustive])
    (define prog (make-x32-program insns))
    (interpret-program base x32-cpu prog)))

(define x32-target (make-bpf-target
    #:target-bitwidth 32
    #:target-pc-alignment (bv 1 32)
    #:equiv cpu-equal?
    #:run-jit run-jit
    #:run-code run-jitted-code
    #:init-cpu init-x32-cpu
    #:max-target-size (bv #x800000 32)
    #:init-ctx init-ctx
    #:code-size code-size
    #:bpf-to-target-pc bpf-to-target-pc
    #:target-cpu-pc x32:cpu-pc))

(define (check-jit code)
  (parameterize
    ([solver-logic 'QF_UFBV]
     [core:target-endian 'little]
     [core:target-pointer-bitwidth 32]
     [max-insn (bv #x100000 32)]
     [core:bvmul-proc bvaxiom:bvmul-uf]
     [core:bvudiv-proc bvaxiom:bvudiv-uf]
     [core:bvurem-proc bvaxiom:bvurem-uf]
     [core:bvmulhu-proc bvaxiom:bvmulhu-uf]
     [bvaxiom:assumptions null])
    (with-default-solver
      (check-verify
        (bpf-jit-specification
          code
          x32-target
          #:assumptions bvaxiom:assumptions)))))
