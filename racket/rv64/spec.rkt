#lang rosette

(require
  "bpf_jit_comp64.rkt"
  "../lib/linux.rkt"
  "../lib/hybrid-memory.rkt"
  "../lib/bpf-common.rkt"
  "../lib/riscv-common.rkt"
  "../lib/spec/riscv.rkt"
  "../lib/spec/bpf.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp))

(provide (all-defined-out))

(define (rv64_put_bpf_reg rv_cpu bpf_reg value)
  (riscv:gpr-set! rv_cpu (regmap bpf_reg) value))

(define (rv64_get_bpf_reg rv_cpu bpf_reg)
  (riscv:gpr-ref rv_cpu (regmap bpf_reg)))

(define (rv64-simulate-call cpu call-addr call-fn)
  (define memmgr (riscv:cpu-memmgr cpu))

 (define args (list
    (riscv:gpr-ref cpu 'a0)
    (riscv:gpr-ref cpu 'a1)
    (riscv:gpr-ref cpu 'a2)
    (riscv:gpr-ref cpu 'a3)
    (riscv:gpr-ref cpu 'a4)))

  ; Compute result.
  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Generate trace event
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn result args))

  ; Execute a "ret" (pseudo)instruction.
  (riscv:interpret-insn cpu (rv_jalr RV_REG_ZERO RV_REG_RA 0))
  (riscv:kill-jalr-mask cpu)

  ; Havoc caller-saved registers according to RISC-V calling convention
  (riscv:havoc-caller-saved! cpu)

  ; Set return value
  (riscv:gpr-set! cpu RV_REG_A0 result))

(define (rv64-init-arch-invariants! ctx cpu)
  (for ([inv (rv64-cpu-invariant-registers ctx cpu)])
    (riscv:gpr-set! cpu (car inv) (cdr inv))))

(define (rv64-arch-invariants ctx initial-cpu cpu)
  (define pc (riscv:cpu-pc cpu))
  (&&
    ; Upper bits of tail-call counter are sign extension of lower
    (equal? (riscv:gpr-ref cpu RV_REG_TCC_SAVED)
            (sign-extend (extract 31 0 (riscv:gpr-ref cpu RV_REG_TCC_SAVED))
                         (bitvector 64)))
    ; Program counter is aligned.
    (core:bvaligned? pc (bv 2 (type-of pc)))
    ; Registers have the correct values.
    (apply &&
      (for/list ([inv (rv64-cpu-invariant-registers ctx cpu)])
        (equal? (riscv:gpr-ref cpu (car inv)) (cdr inv))))))

(define (rv64-cpu-invariant-registers ctx cpu)
  (define memmgr (riscv:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (list (cons 'fp stackbase)
        (cons 'sp (bvsub stackbase
                         (context-stack_size ctx)))))

(define (rv64-init-ctx insns-addr insn-idx program-length aux)
  (define ctx (riscv-init-ctx insns-addr insn-idx program-length aux))
  (define bpf_stack_depth (bpf-prog-aux-stack_depth aux))
  (set-context-stack_size! ctx
    (zero-extend (bvadd (round_up bpf_stack_depth (bv 16 32)) ; BPF stack size
                        (bv (* 8 4) 32)) ; Space for saved regs
                 (bitvector 64)))
  ctx)

(define (rv64-max-stack-usage ctx)
  (context-stack_size ctx))

(define rv64-target (make-bpf-target
  #:target-bitwidth 64
  #:init-cpu (riscv-init-cpu 64)
  #:abstract-regs (riscv-abstract-regs rv64_get_bpf_reg)
  #:abstract-tail-call-cnt (lambda (cpu) (bvsub (bv MAX_TAIL_CALL_CNT 32) (extract 31 0 (riscv:gpr-ref cpu RV_REG_TCC_SAVED))))
  #:simulate-call rv64-simulate-call
  #:arch-invariants rv64-arch-invariants
  #:init-arch-invariants! rv64-init-arch-invariants!
  #:run-code run-jitted-code
  #:emit-insn emit_insn
  #:init-ctx rv64-init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-target-size #x8000000
  #:max-stack-usage rv64-max-stack-usage
  #:have-efficient-unaligned-access #f
  #:function-alignment 2
  #:ctx-valid? riscv-ctx-valid?
  #:epilogue-offset riscv-epilogue-offset
))

(define (check-jit code)
  (parameterize ([riscv:XLEN 64])
    (verify-bpf-jit/64 code rv64-target)))
