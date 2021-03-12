#lang rosette

(require
  "bpf_jit_comp32.rkt"
  "../../lib/bpf-common.rkt"
  "../../lib/hybrid-memory.rkt"
  "../../lib/spec/proof.rkt"
  "../../lib/spec/bpf.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in x86: serval/x86))

(provide (all-defined-out))

(define verbose (make-parameter #f))

(define (init-ctx insns-addr insn-idx program-length aux)
  (define-symbolic* addrs (~> (bitvector 32) (bitvector 32)))
  (define-symbolic* len cleanup-addr (bitvector 32))
  (define-symbolic* seen-exit boolean?)
  (define ctx (context insns-addr (vector) addrs len aux seen-exit cleanup-addr))
  ctx)

(define (x86_32-ctx-valid? ctx insn-idx)
  (&& (equal? (context-len ctx) ((context-offset ctx) insn-idx))))

(define (code-size vec)
  (vector-length vec))

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offset ctx))
  (define (prev-offset insn)
   (if (bveq insn (bv 0 32)) (bv 0 32) (offsets (bvsub insn (bv 1 32)))))
  (bvadd
    target-pc-base
    (zero-extend (prev-offset bpf-pc) (bitvector 32))))

(define (cpu-abstract-regs x86)
  (define mm (x86:cpu-memmgr x86))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define ebp (x86:cpu-gpr-ref x86 x86:ebp))
  (define (loadreg hilo i)
    (define k (bpf:idx->reg i))
    (define reg/off (hilo (bpf2ia32 k)))
    (if (equal? k BPF_REG_AX)
        (x86:cpu-gpr-ref x86 (x86:gpr32-no-rex (unbox reg/off)))
        (core:memmgr-load mm ebp (sign-extend reg/off (bitvector 32)) (bv 4 32))))

  (apply bpf:regs
         (for/list ([i (in-range MAX_BPF_JIT_REG)])
           (define loval (loadreg lo i))
           (define hival (loadreg hi i))
           (concat hival loval))))

(define (init-arch-invariants! ctx cpu)
  (for ([inv (cpu-invariant-registers ctx cpu)])
    (x86:cpu-gpr-set! cpu (car inv) (cdr inv))))

(define (arch-invariants ctx initial-cpu cpu)
  (define mm (x86:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define (loadfromstack off)
    (core:memmgr-load mm stackbase (bv off 32) (bv 4 32)))

  (&&
    (equal? (x86:cpu-gpr-ref initial-cpu x86:ebp) (loadfromstack (- 8)))
    (equal? (x86:cpu-gpr-ref initial-cpu x86:edi) (loadfromstack (- 12)))
    (equal? (x86:cpu-gpr-ref initial-cpu x86:esi) (loadfromstack (- 16)))
    (equal? (x86:cpu-gpr-ref initial-cpu x86:ebx) (loadfromstack (- 20)))
    (apply &&
      (for/list ([inv (cpu-invariant-registers ctx cpu)])
        (equal? (x86:cpu-gpr-ref cpu (car inv)) (cdr inv))))))

(define (cpu-invariant-registers ctx cpu)
  (define mm (x86:cpu-memmgr cpu))
  (define aux (context-aux ctx))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (list (cons x86:ebp (bvsub stackbase (bv (+ SCRATCH_SIZE 12 4 4) 32)))
        (cons x86:esp (bvsub stackbase (bv 4 32) (bvadd (STACK_SIZE aux) (bv 16 32))))))

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

; (off, insn)
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

(define (x86_32-max-stack-usage ctx)
  (bvadd (bv 4 32) ; Space for return addr for this function
         (STACK_SIZE (context-aux ctx))
         (bv 16 32) ; saved regs
         (bv 4 32) ; Space for return addr for called function
         (bv (* 8 5) 32))) ; Space for BPF_CALL regs

(define (x86_32-simulate-call cpu call-addr call-fn)
  (define memmgr (x86:cpu-memmgr cpu))

  (define (loadfromstack off)
    (core:memmgr-load memmgr (x86:cpu-gpr-ref cpu x86:esp) off (bv 4 32)))

  ; i386 calling convention.
  ; NB: Linux is compiled with -mregparm=3, so the first 64-bit argument is
  ; stored in [edx:eax] rather than on the stack.
  (define args (list
    (concat (x86:cpu-gpr-ref cpu x86:edx) (x86:cpu-gpr-ref cpu x86:eax))
    ; Start counting from (bv 4 32) to skip pushed return address.
    (concat (loadfromstack (bv 8 32)) (loadfromstack (bv 4 32)))
    (concat (loadfromstack (bv 16 32)) (loadfromstack (bv 12 32)))
    (concat (loadfromstack (bv 24 32)) (loadfromstack (bv 20 32)))
    (concat (loadfromstack (bv 32 32)) (loadfromstack (bv 28 32)))))

  ; Obtain nondeterministic result from memmgr.
  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Generate trace event
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn result args))

  ; Set the return value registers.
  (x86:cpu-gpr-set! cpu x86:eax (extract 31 0 result))
  (x86:cpu-gpr-set! cpu x86:edx (extract 63 32 result))

  ; Simulate an x86 'ret' instruction.
  (x86:interpret-insn cpu (x86:ret-near)))

(define (x86_32-copy-cpu cpu)
  (struct-copy x86:cpu cpu
    [gprs  (vector-copy (x86:cpu-gprs cpu))]
    [flags (vector-copy (x86:cpu-flags cpu))]))

(define (x86_32-bpf-stack-range ctx)
  (define aux (context-aux ctx))
  (define stack_depth (bpf-prog-aux-stack_depth aux))

  (define top (bvneg
    (bvadd (bv (* 4 5) 32) ; 4 pushed registers + previous return address
           (bv SCRATCH_SIZE 32)))) ; Scratch space

  (define bottom (bvsub top stack_depth))
  (cons bottom top))

(define (x86_32-initial-state? ctx input cpu)
  (define mm (x86:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (&& (equal? (x86:cpu-gpr-ref cpu x86:esp) (bvsub stackbase (bv 4 32)))
      (equal? (x86:cpu-gpr-ref cpu x86:eax) (core:trunc 32 (program-input-r1 input)))))

(define (x86_32-arch-safety Tinitial Tfinal)
  (define mm (x86:cpu-memmgr Tfinal))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (&&
    (equal? (x86:cpu-gpr-ref Tfinal x86:esp) stackbase)
    (equal? (x86:cpu-pc-ref Tfinal) (core:memmgr-load mm stackbase (bv -4 32) (bv 4 32)))
    (apply && (for/list ([reg (list x86:edi x86:esi x86:ebp x86:ebx)])
      (equal? (x86:cpu-gpr-ref Tinitial reg) (x86:cpu-gpr-ref Tfinal reg))))))

(define (x86_32-epilogue-offset target-pc-base ctx)
  (bvadd target-pc-base (context-cleanup-addr ctx)))

(define x86_32-target (make-bpf-target
  #:target-bitwidth 32
  #:abstract-regs cpu-abstract-regs
  #:emit-insn emit_insn
  #:run-code run-jitted-code
  #:init-cpu init-x86-cpu
  #:init-arch-invariants! init-arch-invariants!
  #:arch-invariants arch-invariants
  #:max-target-size #x800000
  #:init-ctx init-ctx
  #:code-size code-size
  #:max-stack-usage x86_32-max-stack-usage
  #:bpf-to-target-pc bpf-to-target-pc
  #:simulate-call x86_32-simulate-call
  #:supports-pseudocall #f
  #:copy-target-cpu x86_32-copy-cpu
  #:bpf-stack-range x86_32-bpf-stack-range
  #:initial-state? x86_32-initial-state?
  #:ctx-valid? x86_32-ctx-valid?
  #:epilogue-offset x86_32-epilogue-offset
  #:emit-prologue
    (lambda (ctx)
      (emit_prologue ctx (bpf-prog-aux-stack_depth (context-aux ctx)))
      (context-insns ctx))
  #:emit-epilogue
    (lambda (ctx)
      (emit_epilogue ctx (bpf-prog-aux-stack_depth (context-aux ctx)))
      (context-insns ctx))
  #:abstract-return-value (lambda (cpu) (x86:cpu-gpr-ref cpu x86:eax))
  #:arch-safety x86_32-arch-safety
))

(define (check-jit code)
  (verify-bpf-jit/32 code x86_32-target))
