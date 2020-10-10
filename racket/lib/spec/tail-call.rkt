#lang rosette

(provide (all-defined-out))

(require (prefix-in bpf: serval/bpf)
         (prefix-in core: serval/lib/core)
         (prefix-in bvaxiom: "../bvaxiom.rkt")
         "../hybrid-memory.rkt"
         "../bpf-common.rkt"
         "../env.rkt"
         "bpf.rkt"
         rosette/lib/angelic
         serval/lib/bvarith
         serval/lib/debug
         serval/lib/solver
         serval/lib/unittest)

(define (tail-call-correctness target)

  ; Extract BPF JIT parameters from description of target architecture.
  (define target-bitwidth (bpf-target-bitwidth target))
  (define abstract-regs (bpf-target-abstract-regs target))
  (define abstract-tail-call-cnt (bpf-target-abstract-tail-call-cnt target))
  (define emit-insn (bpf-target-emit-insn target))
  (define select-bpf-regs (bpf-target-select-bpf-regs target))
  (define run-jitted-code (bpf-target-run-jitted-code target))
  (define simulate-call (bpf-target-simulate-call target))
  (define init-cpu (bpf-target-init-cpu target))
  (define arch-invariants (bpf-target-arch-invariants target))
  (define set-cpu-pc! (bpf-target-set-cpu-pc! target))
  (define init-arch-invariants! (bpf-target-init-arch-invariants! target))
  (define init-ctx (bpf-target-init-ctx target))
  (define emit-prologue (bpf-target-emit-prologue target))
  (define bpf-to-target-pc (bpf-target-bpf-to-target-pc target))
  (define code-size (bpf-target-code-size target))
  (define max-target-size (bpf-target-max-size target))
  (define supports-pseudocall (bpf-target-supports-pseudocall target))
  (define function-alignment (bpf-target-function-alignment target))
  (define max-stack-usage (bpf-target-max-stack-usage target))
  (define bpf-stack-range (bpf-target-bpf-stack-range target))
  (define initial-state? (bpf-target-initial-state? target))
  (define ctx-valid? (bpf-target-ctx-valid? target))

  ; Create symbolic register content for each BPF register
  (define-symbolic* r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 ax (bitvector 64))
  (define bpf-regs (bpf:regs r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 ax))

  ; Construct set of live registers. Reuse bpf:regs struct with booleans
  ; instead of bitvectors.
  (define-symbolic* liveset-list boolean? [MAX_BPF_JIT_REG])
  (define liveset (apply bpf:regs liveset-list))

  ; Symbolic index of the current instruction being compiled
  (define-symbolic* insn-idx (bitvector 32))
  (define bpf-pc (zero-extend insn-idx (bitvector 64)))

  ; Length of BPF program
  (define-symbolic* program-length (bitvector 32))

  ; Base of the generated target program
  (define-symbolic* target-pc-base (bitvector target-bitwidth))

  ; Create architecture-dependent context
  (define prog-aux (make-bpf-prog-aux))
  (define ctx (init-ctx target-pc-base insn-idx program-length prog-aux))

  ; Create memory manager with enough symbolic bytes to return for loads.
  (define memmgr (make-hybrid-memmgr target-bitwidth 64 (max-stack-usage ctx)
                                      #:bpf-stack-range (bpf-stack-range ctx)))

  ; Initialize the BPF CPU, PC, and registers
  (define bpf-cpu (bpf:init-cpu #:make-memmgr (thunk memmgr)
                                #:make-callmgr (thunk #f)))
  (bpf:set-cpu-pc! bpf-cpu bpf-pc)
  (bpf:set-cpu-regs! bpf-cpu (struct-copy bpf:regs bpf-regs))

  (define bpf-context-ptr (bpf:reg-ref bpf-cpu BPF_REG_1))

  ; Helper function for constructing target PC from BPF instruction index, using the target-specific
  ; PC mapping.
  (define (make-target-pc insn-idx)
    (bpf-to-target-pc ctx target-pc-base insn-idx))

  ; Make the initial target program counter from the instruction index using the helper.
  (define target-pc-start (make-target-pc insn-idx))

  ; Construct the BPF instruction.
  (define bpf-insn (bpf:insn '(BPF_JMP BPF_TAIL_CALL) BPF_REG_0 BPF_REG_0 (bv 0 16) (bv 0 32)))

  (define pre (&&
    ; Target addresses for current BPF instruction and BPF instructions reachable in one step
    ; are all in the bounds of the maximum size of JITed code.
    (bvult (bvsub (make-target-pc insn-idx) (make-target-pc (bv 0 32)))
           max-target-size)
    (bvult (bvsub (make-target-pc (bvadd1 insn-idx)) (make-target-pc (bv 0 32)))
           max-target-size)
    (bvult (bvsub (make-target-pc program-length) (make-target-pc (bv 0 32)))
           max-target-size)

    ; wf
    (ctx-valid? ctx insn-idx)

    ; Memory manager invariants hold (e.g., stack alignment)
    (core:memmgr-invariants memmgr)

    ; BPF stack depth in bounds
    (bvule (bpf-prog-aux-stack_depth prog-aux) (bv 512 32))

    ; Can only have performed <= MAX_TAIL_CALL_CNT number of tail calls.
    (bvule (bpf:cpu-tail-call-cnt bpf-cpu) (bv MAX_TAIL_CALL_CNT 32))

    ; Preconditions from Linux BPF verifier
    (verifier-preconditions memmgr target insn-idx bpf-insn program-length liveset bpf-cpu)))

  (parameterize ([enable-stack-addr-symopt #f])
    ; Continue only if preconditions hold
    (when pre

      ; Create target CPU with starting program counter
      (define target-cpu (init-cpu ctx target-pc-start (copy-hybrid-memmgr memmgr)))
      (init-arch-invariants! ctx target-cpu)

      ; Create representation of initial target CPU for validating callee-saved registers.
      (define initial-cpu (init-cpu ctx target-pc-base (copy-hybrid-memmgr memmgr)))

      (define tcall-insns (emit-insn insn-idx bpf-insn #f ctx))

      ; The location of the next instruction is consistent with the mapping from BPF instruction
      ; to target PC. In other words, the size of the code generated by emit-insn is the same
      ; as what is reported by ctx->offset for this architecture.
      (define precondition-next-instruction
        (for/all ([tcall-insns tcall-insns #:exhaustive])
          (bveq (make-target-pc (bvadd1 insn-idx))
                (bvadd (make-target-pc insn-idx)
                      (integer->bitvector (code-size tcall-insns) (bitvector target-bitwidth))))))

      (when (&& precondition-next-instruction
                (arch-invariants ctx initial-cpu target-cpu)
                (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
                (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) (abstract-regs target-cpu)))

        ; Run the BPF interpreter on the symbolic BPF instruction.

        (define-values (result bpf-asserted)
          (with-asserts (bpf-simulate-tail-call bpf-cpu)))
        (define ok (car result))
        (define tcall-addr (cdr result))

        ; Sanity check
        (check-sat? (solve (assert (&& ok (apply && bpf-asserted)))))

        (when (&& (apply && bpf-asserted)
                  (core:bvaligned? tcall-addr (trunc target-bitwidth function-alignment)))

          (for/all ([tcall-insns tcall-insns #:exhaustive])

            ; Run the target interpreter on the JITed instructions
            (run-jitted-code target-pc-start target-cpu tcall-insns)

            ; The tail call counters must continue to match.
            (bug-assert (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
                        #:msg "tail-call: Tail call count must match.")

            (bug-assert (hybrid-memmgr-trace-equal? (bpf:cpu-memmgr bpf-cpu) (core:gen-cpu-memmgr target-cpu))
                        #:msg "tail-call: Memory traces must match")

            (bug-assert (&& (core:memmgr-invariants (bpf:cpu-memmgr bpf-cpu))
                            (core:memmgr-invariants (core:gen-cpu-memmgr target-cpu)))
                        #:msg "tail-call: memmgr invariants must continue to hold")

            ; At this point we've run the spec for TAIL_CALL and run until the end of the generated code.
            ; Now one of two things are possible. Either the call succeeded, or it did not.
            (cond
              [(! ok)
                ; The first is that the tail call did not succeed. This case should be easy.
                ; In this case, the BPF instruction behaved as though it were a no-op.

                (bug-assert (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) (abstract-regs target-cpu))
                            #:msg "tail-call: failed tail call must preserve registers")

                (bug-assert (arch-invariants ctx initial-cpu target-cpu)
                            #:msg "tail-call: failed tail call must maintain invariants")

                (bug-assert (equal? (make-target-pc (trunc 32 (bpf:cpu-pc bpf-cpu)))
                                    (core:gen-cpu-pc target-cpu))
                            #:msg "tail-call: failed tail call must skip to next instruction")

                (void)]
              [else
                ; In this branch the tail call succeeded. Now we have to prove we jumped to
                ; the correct place, and that if we assume that we jumped to a prologue we
                ; can get back all of the invariants we care about.

                ; This is where things start to become architecture-dependent. Not every arch
                ; has to implement tail call using the prologue, so some of this may not make
                ; sense for archs other than rv32.

                (bug-assert (equal? (bpf:@reg-ref (abstract-regs target-cpu) BPF_REG_1)
                                    bpf-context-ptr)
                            #:msg "tail call should not clobber BPF R1")

                (define next-program-input (program-input bpf-context-ptr))

                (bug-assert (equal? (core:gen-cpu-pc target-cpu) (bvadd tcall-addr (bv 4 32)))
                            #:msg "tail-call: PC after tail call must be correct")

                ; Make a new prog-aux and ctx because we are in a new BPF program.
                (define-symbolic* target-pc-base2 (bitvector target-bitwidth))
                (define-symbolic* program-length2 (bitvector 32))
                (define ctx2 (init-ctx target-pc-base2 (bv 0 32) program-length2 prog-aux))

                (set-cpu-pc! target-cpu (bvadd target-pc-base2 (bv 4 32)))

                (define prologue-insns (emit-prologue ctx2))

                (run-jitted-code target-pc-base2 target-cpu prologue-insns)

                (bug-assert (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
                            #:msg "tail-call: Tail call count must match after prologue.")

              ]))))))

  null)
