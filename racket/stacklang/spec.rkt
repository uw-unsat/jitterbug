#lang rosette

(require "jit.rkt"
         "../lib/hybrid-memory.rkt"
         (prefix-in stacklang: "sema.rkt")
         (prefix-in x86: serval/x86)
         (prefix-in core: serval/lib/core))

(provide jit-specification)


(define (init-ctx base-addr addrs)
  (define ctx (context (vector) base-addr addrs))
  ctx)

(define (code-size vec)
  (vector-length vec))

(define (cpu-abstract-function x86)
  (error "not yet"))

(define (init-x86-cpu ctx target-pc memmgr)
  (define x86-cpu (x86:init-cpu memmgr))
  (x86:cpu-pc-set! x86-cpu target-pc)
  x86-cpu)

(define (fetch prog base pc)
  (define n (bitvector->natural (bvsub pc base)))
  (cond
    ; jump (symbolic address)
    [(term? n) #f]
    [else
     (let ([e (assoc n prog)])
       (if e (cdr e) #f))]))

(define (interpret-program base cpu prog)
  (for/all ([pc (x86:cpu-pc-ref cpu) #:exhaustive])
    (begin
      (x86:cpu-pc-set! cpu pc)
      (define insn (fetch prog base pc))
      (when insn
        (x86:interpret-insn cpu insn)
        (interpret-program base cpu prog)))))

(define (make-x86-program bytes)
  (define insns (x86:decode (vector->list bytes)))
  (define off 0)
  (for/list ([insn insns])
    (define cur off)
    (set! off (+ off (x86:instruction-size insn)))
    (cons cur insn)))

(define (run-jitted-code base x86-cpu insns)
  (define out (open-output-nowhere))
  (for/all ([insns insns #:exhaustive])
    (displayln insns out)
    (displayln "..." out)
    (define prog (make-x86-program insns))
    (for ([e prog])
      (displayln e out))
    (interpret-program base x86-cpu prog)
    (displayln "===\n" out)))

(define maximum-stack-size (bv -4 32))

(define (addr ctx i)
  (bvadd (context-base-addr ctx)
         ((context-addrs ctx) i)))

(define (arch-invariants ctx stack-cpu x86)
  (define edi (x86:cpu-gpr-ref x86 (x86:symbol->gpr32 'edi)))
  (define eax (x86:cpu-gpr-ref x86 (x86:symbol->gpr32 'eax)))
  (define x86-mm (x86:cpu-memmgr x86))
  (define stack-mm (stacklang:cpu-memmgr stack-cpu))
  (define-symbolic i (bitvector 32))

  (and
    ; Program counters match
    (equal? (addr ctx (stacklang:cpu-pc stack-cpu))
            (extract 31 0 (x86:cpu-pc x86)))

    ; edi is aligned
    (core:bvaligned? edi (bv 4 32))

    ; Stack bases match
    (equal? (hybrid-memmgr-stackbase x86-mm)
            (hybrid-memmgr-stackbase stack-mm))

    ; edi is one slot off of stacklang sp
    (equal? edi (bvadd (bv 4 32) (stacklang:cpu-sp stack-cpu)))

    ; stacklang sp is not too low
    (bvuge (stacklang:cpu-sp stack-cpu)
           (bvsub (hybrid-memmgr-stackbase stack-mm)
                  maximum-stack-size))
    (bvult (stacklang:cpu-sp stack-cpu)
           (hybrid-memmgr-stackbase stack-mm))

    ; Rest of stack matches
    (forall (list i)
      (implies (&& (bvuge i edi)
                   (bvult i (hybrid-memmgr-stackbase stack-mm))
                   (core:bvaligned? i (bv 4 32)))
        (equal? (core:memmgr-load x86-mm i (bv 0 32) (bv 4 32))
                (core:memmgr-load stack-mm i (bv 0 32) (bv 4 32)))))
    ; Top of stack matches
    (equal? (core:memmgr-load stack-mm (stacklang:cpu-sp stack-cpu)
                              (bv 0 32) (bv 4 32))
            eax)
  ))

(define (jit-specification insn)
  (define-symbolic* base-addr (bitvector 32))
  (define-symbolic* addrs (~> (bitvector 32) (bitvector 32)))
  (define ctx (init-ctx base-addr addrs))

  ; Construct state of source language.
  (define stacklang-memmgr (make-hybrid-memmgr 32 24 maximum-stack-size ; max stack usage
                                               #:bpf-stack-range (cons (bv 0 32) (bv 0 32))))
  (define stacklang-cpu (stacklang:init-cpu stacklang-memmgr))
  (define stacklang-pc (stacklang:cpu-pc stacklang-cpu))

  ; Construct state for x86 target.
  (define x86-memmgr (make-hybrid-memmgr 32 24 maximum-stack-size ; max stack usage
                                         #:bpf-stack-range (cons (bv 0 32) (bv 0 32))))

  (parameterize ([current-context ctx]
                 [enable-stack-addr-symopt #f])
    ; Run the JIT
    (emit_insn stacklang-pc insn (context-addrs ctx) ctx)
    (define jited-code (context-insns ctx))
    (displayln jited-code)
    (define x86-cpu (init-x86-cpu ctx base-addr x86-memmgr))

    ; Preconditions: memmgr invariants hold, and cpu invariants
    ; tying source and target hold.
    (when (and (core:memmgr-invariants x86-memmgr)
               (core:memmgr-invariants stacklang-memmgr)
               (arch-invariants ctx stacklang-cpu x86-cpu))

      (cond
        [(stacklang:stop? insn)
          ; "stop" instruction, nothing to do in source, in target prove
          ; that PC after running code is same as edx.
          (run-jitted-code base-addr x86-cpu jited-code)
          (define edx (x86:cpu-gpr-ref x86-cpu (x86:symbol->gpr32 'edx)))
          (assert (equal? edx (extract 31 0 (x86:cpu-pc x86-cpu))))]

        [else
          ; Every other instruction (i.e., those with semantics in the source)

          ; Run the source semantics and capture any generated assertions.
          (define r (with-vc (stacklang:interpret-insn insn stacklang-cpu)))
          (assert (normal? r))
          (define result (result-value r))
          ; Assume safe execution of stacklang instruction.
          (assume (vc-assumes (result-state r)))
          (assume (vc-asserts (result-state r)))


          ; Assume next instruction is in right place
          (assume (equal? (addr ctx (bvadd1 stacklang-pc))
                          (bvadd (integer->bitvector (code-size jited-code) (bitvector 32))
                                 (addr ctx stacklang-pc))))

          ; Run the generated code.
          (run-jitted-code base-addr x86-cpu jited-code)

          ; Assert invariants continue to hold.
          (assert (arch-invariants ctx stacklang-cpu x86-cpu))]))))
