#lang rosette

(require
  "bpf_jit_comp.rkt"
  "../../lib/bpf-common.rkt"
  "../../lib/hybrid-memory.rkt"
  "../../lib/spec/proof.rkt"
  "../../lib/spec/bpf.rkt"
  "../../common.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in x86: serval/x86))

(provide (all-defined-out))

(define (bpf-reg->x86 r)
  (define rex (if (is_ereg r) (bv #b1 1) (bv #b0 1)))
  (define reg (reg2hex r))
  (x86:gpr64 rex reg))

(define (init-ctx insns-addr insn-idx program-length aux)
  (define-symbolic* addrs (~> (bitvector 32) (bitvector 32)))
  (define-symbolic* len cleanup-addr (bitvector 32))
  (define-symbolic* seen-exit boolean?)
  (define ctx (context (vector) addrs len insns-addr aux seen-exit cleanup-addr))
  ctx)

(define (x86_64-ctx-valid? ctx insn-idx)
  (&& (equal? (context-len ctx) ((context-offset ctx) insn-idx))))

(define (code-size vec)
  (vector-length vec))

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offset ctx))
  (bvadd
    target-pc-base
    (zero-extend (offsets bpf-pc) (bitvector 64))))

(define (cpu-abstract-regs x86)
  (apply bpf:regs
    (for/list [(i (in-range MAX_BPF_JIT_REG))]
      (define k (bpf:idx->reg i))
      (x86:cpu-gpr-ref x86 (bpf-reg->x86 k)))))

(define (init-arch-invariants! ctx cpu)
  (for ([inv (cpu-invariant-registers ctx cpu)])
    (x86:cpu-gpr-set! cpu (car inv) (cdr inv))))

(define (arch-invariants ctx initial-cpu cpu)
  (define mm (x86:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define aux (context-aux ctx))
  (define stack_depth (zero-extend (round_up (bpf-prog-aux-stack_depth aux) (bv 8 32)) (bitvector 64)))
  (define (loadfromstack off)
    (core:memmgr-load mm stackbase off (bv 8 64) #:dbg 'x86_64-arch-invariants))

  (&& (core:bvaligned? (x86:cpu-gpr-ref cpu x86:rsp) (bv 8 64))
      (equal? (x86:cpu-gpr-ref initial-cpu x86:rbp) (loadfromstack (bv -16 64)))
      (equal? (x86:cpu-gpr-ref initial-cpu x86:rbx) (loadfromstack (bvsub (bv -16 64) stack_depth (bv 8 64))))
      (equal? (x86:cpu-gpr-ref initial-cpu x86:r12) (x86:cpu-gpr-ref cpu x86:r12))
      (equal? (x86:cpu-gpr-ref initial-cpu x86:r13) (loadfromstack (bvsub (bv -16 64) stack_depth (bv 16 64))))
      (equal? (x86:cpu-gpr-ref initial-cpu x86:r14) (loadfromstack (bvsub (bv -16 64) stack_depth (bv 24 64))))
      (equal? (x86:cpu-gpr-ref initial-cpu x86:r15) (loadfromstack (bvsub (bv -16 64) stack_depth (bv 32 64))))
      (apply &&
        (for/list ([inv (cpu-invariant-registers ctx cpu)])
          (equal? (x86:cpu-gpr-ref cpu (car inv)) (cdr inv))))))

(define (cpu-invariant-registers ctx cpu)
  (define aux (context-aux ctx))
  (define stack_depth (zero-extend (round_up (bpf-prog-aux-stack_depth aux) (bv 8 32)) (bitvector 64)))
  (define memmgr (x86:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (list (cons x86:rbp (bvsub stackbase (bv 16 64)))
        (cons x86:rsp (bvsub stackbase (bv 16 64) stack_depth (bv 32 64)))))

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
  (parameterize ([error-print-width 1000]
                 [current-output-port (open-output-nowhere)])
    (for/all ([insns insns #:exhaustive])
      (displayln insns)
      (displayln "...")
      (define prog (make-x86-program insns))
      (for ([e prog])
        (displayln e))
      (interpret-program base x86-cpu prog)
      (displayln "===\n"))))

(define (x86_64-simulate-call cpu call-addr call-fn)
  (define memmgr (x86:cpu-memmgr cpu))

  ; x86_64 calling convention
  (define args (list
    (x86:cpu-gpr-ref cpu x86:rdi)
    (x86:cpu-gpr-ref cpu x86:rsi)
    (x86:cpu-gpr-ref cpu x86:rdx)
    (x86:cpu-gpr-ref cpu x86:rcx)
    (x86:cpu-gpr-ref cpu x86:r8)))

  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Emit an event for the call
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn result args))

  ; Havoc caller-saved registers
  (for ([reg (list x86:rax x86:rcx x86:rdx x86:rsi x86:rdi x86:r8 x86:r9 x86:r10 x86:r11)])
    (define-symbolic* havoc (bitvector 64))
    (x86:cpu-gpr-set! cpu reg havoc))

  ; Simulate an x86 'ret' instruction.
  (x86:interpret-insn cpu (x86:ret-near))

  (x86:cpu-gpr-set! cpu x86:rax result))

(define (x86_64-max-stack-usage ctx)
  (define aux (context-aux ctx))
  (define stack_depth (bpf-prog-aux-stack_depth aux))

  (bvadd (bv (* 8 6) 64) ; 5 pushed registers + return address.
         (bv 8 64) ; Return address for next function.
         (zero-extend (round_up stack_depth (bv 8 32)) (bitvector 64))
         (bv 16 64))) ; Pushed args for MUL, DIV, etc.

(define (x86_64-bpf-stack-range ctx)
  (define aux (context-aux ctx))
  (define stack_depth (bpf-prog-aux-stack_depth aux))

  ; rbp is pushed first for unwinding, plus saved return address.
  (define top (bvneg (bv 16 64)))

  ; BPF stack size is stack_depth
  (define bottom (bvsub top (zero-extend (round_up stack_depth (bv 8 32)) (bitvector 64))))

  (cons bottom top))

(define (x86_64-copy-cpu cpu)
  (struct-copy x86:cpu cpu
    [gprs  (vector-copy (x86:cpu-gprs cpu))]
    [flags (vector-copy (x86:cpu-flags cpu))]))

(define (x86_64-initial-state? ctx input cpu)
  (define mm (x86:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  ; Stackbase on x86 is 8 bytes higher than initial SP because of the return address.
  (&& (equal? (x86:cpu-gpr-ref cpu x86:rsp) (bvsub stackbase (bv 8 64)))
      (equal? (x86:cpu-gpr-ref cpu x86:rdi) (program-input-r1 input))))

(define (x86_64-arch-safety Tinitial Tfinal)
  (define mm (x86:cpu-memmgr Tfinal))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (&&
    (equal? (x86:cpu-pc-ref Tfinal) (core:memmgr-load mm stackbase (bv -8 64) (bv 8 64) #:dbg #f))
    (equal? (x86:cpu-gpr-ref Tfinal x86:rsp) stackbase)
    (apply && (for/list ([reg (list x86:rbp x86:rbx x86:r12 x86:r13 x86:r14 x86:r15)])
     (equal? (x86:cpu-gpr-ref Tinitial reg) (x86:cpu-gpr-ref Tfinal reg))))))

(define (x86_64-epilogue-offset target-pc-base ctx)
  (bvadd target-pc-base (zero-extend (context-cleanup-addr ctx) (bitvector 64))))

(define x86_64-target (make-bpf-target
  #:target-bitwidth 64
  #:abstract-regs cpu-abstract-regs
  #:emit-insn emit_insn
  #:run-code run-jitted-code
  #:init-cpu init-x86-cpu
  #:init-arch-invariants! init-arch-invariants!
  #:arch-invariants arch-invariants
  #:max-target-size #x800000
  #:init-ctx init-ctx
  #:code-size code-size
  #:bpf-to-target-pc bpf-to-target-pc
  #:max-stack-usage x86_64-max-stack-usage
  #:supports-pseudocall #f
  #:simulate-call x86_64-simulate-call
  #:bpf-stack-range x86_64-bpf-stack-range
  #:copy-target-cpu x86_64-copy-cpu
  #:initial-state? x86_64-initial-state?
  #:arch-safety x86_64-arch-safety
  #:epilogue-offset x86_64-epilogue-offset
  #:ctx-valid? x86_64-ctx-valid?
  #:emit-prologue
    (lambda (ctx)
      (emit_prologue ctx (bpf-prog-aux-stack_depth (context-aux ctx)) #t)
      (context-insns ctx))
  #:emit-epilogue
    (lambda (ctx)
      (emit_epilogue ctx)
      (context-insns ctx))
  #:abstract-return-value (lambda (cpu) (core:trunc 32 (x86:cpu-gpr-ref cpu x86:rax)))
))

(define (check-jit code)
  (verify-bpf-jit/64 code x86_64-target))
