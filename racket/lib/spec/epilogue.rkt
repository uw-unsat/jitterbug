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

(define (epilogue-correctness target)
  (define target-bitwidth (bpf-target-bitwidth target))
  (define emit-epilogue (bpf-target-emit-epilogue target))
  (define init-ctx (bpf-target-init-ctx target))
  (define run-jitted-code (bpf-target-run-jitted-code target))
  (define init-cpu (bpf-target-init-cpu target))
  (define max-stack-usage (bpf-target-max-stack-usage target))
  (define arch-invariants (bpf-target-arch-invariants target))
  (define arch-safety (bpf-target-arch-safety target))
  (define bpf-stack-range (bpf-target-bpf-stack-range target))
  (define abstract-regs (bpf-target-abstract-regs target))
  (define abstract-return-value (bpf-target-abstract-return-value target))

  (define-symbolic* target-pc-base (bitvector target-bitwidth))
  (define prog-aux (make-bpf-prog-aux))
  (define ctx (init-ctx target-pc-base (bv 0 32) (bv 0 32) prog-aux))

  (define memmgr (make-hybrid-memmgr target-bitwidth 64 (max-stack-usage ctx)))
  (define target-cpu (init-cpu ctx target-pc-base (copy-hybrid-memmgr memmgr)))

  ; Create representation of initial target CPU for validating callee-saved registers.
  (define initial-cpu (init-cpu ctx target-pc-base (copy-hybrid-memmgr memmgr)))

  (define-symbolic* r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 ax (bitvector 64))
  (define bpf-regs (bpf:regs r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 ax))
  (define bpf-cpu (bpf:init-cpu #:make-memmgr (thunk #f)
                                #:make-callmgr (thunk #f)))
  (bpf:set-cpu-regs! bpf-cpu (struct-copy bpf:regs bpf-regs))

  ; Construct set of live registers. Only R0 (return value) is live.
  (define liveset (bpf:regs #t #f #f #f #f #f #f #f #f #f #f #f))

  (parameterize ([enable-stack-addr-symopt #f])

    (define pre (&&
      ; Memory manager invariants hold (e.g., stack alignment)
      (core:memmgr-invariants memmgr)
      ; BPF stack depth in bounds
      (bvule (bpf-prog-aux-stack_depth prog-aux) (bv 512 32))))

    (when pre
      (when (and (arch-invariants ctx initial-cpu target-cpu)
                 (live-regs-equal? liveset (abstract-regs target-cpu) bpf-regs))

        (define bpf-return-value (trunc 32 (bpf:reg-ref bpf-cpu BPF_REG_0)))
        (define insns (emit-epilogue ctx))

        (run-jitted-code target-pc-base target-cpu insns)
        (bug-assert (equal? (abstract-return-value target-cpu) bpf-return-value)
                    #:msg "Return value must match after running epilogue")
        (bug-assert (arch-safety initial-cpu target-cpu)
                    #:msg "Arch safety must hold after running epilogue")
        (bug-assert (hybrid-memmgr-trace-equal? memmgr (core:gen-cpu-memmgr target-cpu))
                    #:msg "Epilogue must not generate memory trace events")
        (void)
      )))

  null)
