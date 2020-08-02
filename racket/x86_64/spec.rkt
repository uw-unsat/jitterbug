#lang rosette

(require
  "bpf_jit_comp.rkt"
  "../lib/bpf-common.rkt"
  "../lib/hybrid-memory.rkt"
  "../lib/spec/bpf.rkt"
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
  (define-symbolic* len (bitvector 32))
  (define ctx (context (vector) addrs len insns-addr))
  ctx)

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

(define (init-cpu-invariants! ctx cpu)
  (for ([inv (cpu-invariant-registers ctx cpu)])
    (x86:cpu-gpr-set! cpu (car inv) (cdr inv))))

(define (cpu-invariants ctx cpu)
  (apply &&
    (for/list ([inv (cpu-invariant-registers ctx cpu)])
      (equal? (x86:cpu-gpr-ref cpu (car inv)) (cdr inv)))))

(define (cpu-invariant-registers ctx cpu)
  (define memmgr (x86:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (list (cons x86:rsp stackbase)))

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

(define x86_64-target (make-bpf-target
  #:target-bitwidth 64
  #:abstract-regs cpu-abstract-regs
  #:run-jit emit_insn
  #:run-code run-jitted-code
  #:init-cpu init-x86-cpu
  #:init-cpu-invariants! init-cpu-invariants!
  #:cpu-invariants cpu-invariants
  #:max-target-size #x800000
  #:init-ctx init-ctx
  #:code-size code-size
  #:bpf-to-target-pc bpf-to-target-pc
  #:max-stack-usage (lambda (ctx) (bv 128 64))
  #:supports-pseudocall #f
  #:simulate-call x86_64-simulate-call
))

(define (check-jit code)
  (verify-bpf-jit/64 code x86_64-target))
