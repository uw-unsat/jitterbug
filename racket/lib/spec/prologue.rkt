#lang rosette

(require
  (prefix-in bpf: serval/bpf)
  (prefix-in core: serval/lib/core)
  "../hybrid-memory.rkt"
  "../bpf-common.rkt"
  "../env.rkt"
  "bpf.rkt"
  rosette/lib/angelic
  serval/lib/bvarith
  serval/lib/debug
  serval/lib/solver
  serval/lib/unittest)

(provide (all-defined-out))

(define (prologue-correctness target)
  (define target-bitwidth (bpf-target-bitwidth target))
  (define emit-prologue (bpf-target-emit-prologue target))
  (define init-ctx (bpf-target-init-ctx target))
  (define run-jitted-code (bpf-target-run-jitted-code target))
  (define init-cpu (bpf-target-init-cpu target))
  (define max-stack-usage (bpf-target-max-stack-usage target))
  (define initial-state? (bpf-target-initial-state? target))
  (define arch-invariants (bpf-target-arch-invariants target))
  (define bpf-stack-range (bpf-target-bpf-stack-range target))
  (define abstract-regs (bpf-target-abstract-regs target))
  (define copy-target-cpu (bpf-target-copy-target-cpu target))
  (define ctx-valid? (bpf-target-ctx-valid? target))

  (define-symbolic* target-pc-base (bitvector target-bitwidth))
  (define prog-aux (make-bpf-prog-aux))
  (define ctx (init-ctx target-pc-base (bv 0 32) (bv 0 32) prog-aux))

  (define memmgr (make-hybrid-memmgr target-bitwidth 64 (max-stack-usage ctx)))
  (define target-cpu (init-cpu ctx target-pc-base (copy-hybrid-memmgr memmgr)))
  (define initial-cpu (copy-target-cpu target-cpu))

  (define bpf-stack-top (bvadd (hybrid-memmgr-stackbase memmgr) (cdr (bpf-stack-range ctx))))

  (define-symbolic* input-r1 (bitvector 64))
  (define input (program-input input-r1))

  (define-symbolic* r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 ax (bitvector 64))
  (define bpf-regs (bpf:regs r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 ax))
  (define bpf-cpu (bpf:init-cpu #:make-memmgr (thunk #f)
                                #:make-callmgr (thunk #f)))
  (bpf:set-cpu-regs! bpf-cpu (struct-copy bpf:regs bpf-regs))

  (define bpf-stack-depth (bpf-prog-aux-stack_depth prog-aux))

  ; Construct set of live registers. Only R1 and FP live initially.
  ; FP only need be live if stack size is non-zero.
  (define liveset (bpf:regs #f #t #f #f #f #f #f #f #f #f (! (bvzero? bpf-stack-depth)) #f))

  (define pre (&&
    ; Memory manager invariants hold (e.g., stack alignment)
    (core:memmgr-invariants memmgr)
    ; wf
    (ctx-valid? ctx (bv 0 32))

    ; Target is initial state
    (initial-state? ctx input target-cpu)

    ; Source is initial state
    (bpf-initial-state? ctx input bpf-cpu)

    ; Context pointer upper bits are 0.
    (implies (< target-bitwidth 64)
      (bvzero? (extract 63 (- 64 target-bitwidth) input-r1)))

    ; Initial BPF state points to stack top
    (equal? (bpf:@reg-ref bpf-regs BPF_REG_FP) (zero-extend bpf-stack-top (bitvector 64)))

    ; BPF stack depth in bounds
    (bvule (bpf-prog-aux-stack_depth prog-aux) (bv 512 32))))

  (parameterize ([enable-stack-addr-symopt #f])
    (when pre
      (define insns (emit-prologue ctx))
      (run-jitted-code target-pc-base target-cpu insns)
      (define regs (abstract-regs target-cpu))
      (void)

      (bug-assert (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) (abstract-regs target-cpu))
                  #:msg "regs must be equivalent after prologue")
      (bug-assert (arch-invariants ctx initial-cpu target-cpu)
                  #:msg "CPU invariants must hold after running prologue")
      (bug-assert (hybrid-memmgr-trace-equal? memmgr (core:gen-cpu-memmgr target-cpu))
                  #:msg "Prologue must not generate memory trace events")
      ))

  null)
