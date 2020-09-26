#lang rosette

(require
  "../lib/bpf-common.rkt"
  "../lib/hybrid-memory.rkt"
  "../lib/spec/bpf.rkt"
  "bpf_jit_comp.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in arm64: serval/arm64))

(provide (all-defined-out))

(define (init-ctx insns-addr insn-idx program-length aux)
  (define-symbolic* offsets (~> (bitvector 32) (bitvector 32)))
  (define ninsns (offsets insn-idx))
  (define epilogue-offset (offsets program-length))
  (define ctx (context (vector) ninsns epilogue-offset offsets program-length))
  ctx)

(define (cpu-abstract-regs cpu)
  (apply bpf:regs
    (for/list [(i (in-range MAX_BPF_JIT_REG))]
      (define k (bpf:idx->reg i))
      (arm64:cpu-gpr-ref cpu (bpf2a64 k)))))

(define (init-arm64-cpu ctx target-pc memmgr)
  (define arm64-cpu (arm64:init-cpu memmgr))
  (arm64:cpu-pc-set! arm64-cpu target-pc)
  arm64-cpu)

(define (run-jitted-code base arm64-cpu insns)
  (for/all ([insns insns #:exhaustive])
    (interpret-program base arm64-cpu insns)))

(define (fetch insns base pc)
  (define n (bitvector->natural (bvudiv (bvsub pc base) (bv 4 64))))
  (cond
    [(term? n) #f]
    [(< n (vector-length insns)) (vector-ref insns n)]
    [else #f]))

(define (interpret-program base cpu insns)
  (for/all ([pc (arm64:cpu-pc-ref cpu) #:exhaustive])
    (begin
      (arm64:cpu-pc-set! cpu pc)
      (define insn (fetch insns base pc))
      (when insn
        (arm64:interpret-insn cpu insn)
        (interpret-program base cpu insns)))))

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offset ctx))
  (bvadd
    target-pc-base
    (bvmul (zero-extend (offsets bpf-pc) (bitvector 64)) (bv 4 64))))

(define (code-size vec)
  (* 4 (vector-length vec)))

(define (arch-invariants ctx initial-cpu cpu)
  (define pc (arm64:cpu-pc cpu))
  (core:bvaligned? pc (bv 4 (type-of pc))))

(define (arm64-simulate-call cpu call-addr call-fn)
  (define memmgr (arm64:cpu-memmgr cpu))

  (define args (list
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 0))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 1))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 2))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 3))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 4))))

  ; Compute result.
  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Generate trace event
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn result args))

  ; Execute a "return" instruction (br r30).
  (arm64:interpret-insn cpu (arm64:br (arm64:integer->gpr 30)))
  ; FIXME: havoc caller-saved registers
  ; Set result to r0.
  (arm64:cpu-gpr-set! cpu (arm64:integer->gpr 0) result))

(define arm64-target (make-bpf-target
  #:target-bitwidth 64
  #:init-cpu init-arm64-cpu
  #:simulate-call arm64-simulate-call
  #:arch-invariants arch-invariants
  #:abstract-regs cpu-abstract-regs
  #:run-code run-jitted-code
  #:emit-insn build_insn
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-stack-usage (lambda (ctx) (bv 128 64))
  #:max-target-size #x100000 ; 2^20
  #:function-alignment 4
))

(define (check-jit code)
  (verify-bpf-jit/64 code arm64-target))
