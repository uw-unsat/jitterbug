#lang rosette

(provide (all-defined-out))

(require
  (prefix-in bpf: serval/bpf)
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

(define (per-insn-correctness code target #:assumptions [assumptions (thunk null)])
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
  (define init-arch-invariants! (bpf-target-init-arch-invariants! target))
  (define init-ctx (bpf-target-init-ctx target))
  (define bpf-to-target-pc (bpf-target-bpf-to-target-pc target))
  (define code-size (bpf-target-code-size target))
  (define max-target-size (bpf-target-max-size target))
  (define supports-pseudocall (bpf-target-supports-pseudocall target))
  (define function-alignment (bpf-target-function-alignment target))
  (define max-stack-usage (bpf-target-max-stack-usage target))
  (define bpf-stack-range (bpf-target-bpf-stack-range target))
  (define ctx-valid? (bpf-target-ctx-valid? target))
  (define epilogue-offset (bpf-target-epilogue-offset target))

  (define dst (apply choose* (select-bpf-regs 'dst)))
  (define src (apply choose* (select-bpf-regs 'src)))

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

  ; Create a symbolic function to represent result of BPF call.
  ; Takes 5 bv64 arguments and produces a bv64 result.
  (define-symbolic* bpf-call-fn (~> (bitvector 64) (bitvector 64) (bitvector 64) (bitvector 64)
                                    (bitvector 64) (bitvector 64)))

  ; When we are verifying BPF_CALL, also prove this auxilliary lemma about non-fixed call addresses
  ; when the target supports pseudocalls.
  (when (&& (equal? code '(BPF_JMP BPF_CALL)) supports-pseudocall)
    (bpf-call-nonfixed-specification target))

  ; Initialize the BPF CPU, PC, and registers
  (define bpf-cpu (bpf:init-cpu #:make-memmgr (thunk memmgr)
                                #:make-callmgr (thunk (spec-bpf-callmgr bpf-call-fn))))
  (bpf:set-cpu-pc! bpf-cpu bpf-pc)
  (bpf:set-cpu-regs! bpf-cpu (struct-copy bpf:regs bpf-regs))

  ; Helper function for constructing target PC from BPF instruction index, using the target-specific
  ; PC mapping.
  (define (make-target-pc insn-idx)
    (bpf-to-target-pc ctx target-pc-base insn-idx))

  ; Make the initial target program counter from the instruction index using the helper.
  (define target-pc-start (make-target-pc insn-idx))

  ; Symbolic offset and immediate for BPF instruction
  (define-symbolic* off (bitvector 16))
  (define-symbolic* imm (bitvector 32))

  ; Construct the BPF instruction.
  (define bpf-insn (bpf:insn code dst src off imm))

  ; Get the function call address from the model of bpf_jit_get_func_addr.
  ; This will be compared against the program counter for verifying BPF_CALL.
  (define &addr (box (void)))
  (define &fixed (box (void)))
  (bpf_jit_get_func_addr ctx bpf-insn &addr &fixed)
  (define bpf-call-addr (unbox &addr))
  (define bpf-call-fixed? (unbox &fixed))

  ; Construct the next BPF instruction when the insn-size is > 1.
  ; This corresponds to the ld64 case which must read the immediate
  ; from the next BPF instruction.
  (define next-bpf-insn #f)
  (when (bvugt (bpf:insn-size bpf-insn) (bv 1 64))
    (define-symbolic* imm2 (bitvector 32))
    (set! next-bpf-insn (bpf:insn #f #f #f #f imm2)))

  ; BPF instruction size. (1 for all instructions except ld64).
  (define bpf-insn-size (trunc 32 (bpf:insn-size bpf-insn)))

  ; Add a list of symbolics we made.
  ; Only useful in program synthesis where we may want to quantify over these variables.
  (add-symbolics next-bpf-insn liveset dst src off imm ctx insn-idx target-pc-base bpf-cpu
                  bpf-call-addr bpf-call-fn bpf-call-fixed? program-length)

  (define pre
    (&&
      ; Context must be valid
      (ctx-valid? ctx insn-idx)
      ; Target addresses for current BPF instruction and BPF instructions reachable in one step
      ; are all in the bounds of the maximum size of JITed code.
      (bvult (bvsub (make-target-pc (bvadd bpf-insn-size insn-idx (sign-extend off (bitvector 32))))
                    (make-target-pc (bv 0 32)))
            max-target-size)
      (bvult (bvsub (make-target-pc insn-idx)
                    (make-target-pc (bv 0 32)))
            max-target-size)
      (bvult (bvsub (make-target-pc (bvadd insn-idx bpf-insn-size))
                    (make-target-pc (bv 0 32)))
            max-target-size)
      (bvult (bvsub (make-target-pc program-length)
                    (make-target-pc (bv 0 32)))
            max-target-size)
      (bvult (bvsub (epilogue-offset target-pc-base ctx)
                    (make-target-pc (bv 0 32)))
            max-target-size)
      ; Memory manager invariants hold (e.g., stack alignment)
      (core:memmgr-invariants memmgr)
      ; BPF stack depth in bounds
      (bvule (bpf-prog-aux-stack_depth prog-aux) (bv 512 32))
      ; BPF_CALL function address is aligned to target minimum function alignment.
      (core:bvaligned? bpf-call-addr function-alignment)
      ; If the target does not support pseudocall, can only jit fixed functions.
      (=> (! supports-pseudocall) bpf-call-fixed?)
      ; Can only have performed <= MAX_TAIL_CALL_CNT number of tail calls.
      (bvule (bpf:cpu-tail-call-cnt bpf-cpu) (bv MAX_TAIL_CALL_CNT 32))
      ; Preconditions from Linux BPF verifier
      (verifier-preconditions memmgr target insn-idx bpf-insn program-length liveset bpf-cpu)))

  ; Continue only if preconditions hold
  (when pre

    ; Create target CPU with starting program counter
    (define target-cpu (init-cpu ctx target-pc-start (copy-hybrid-memmgr memmgr)))
    (init-arch-invariants! ctx target-cpu)
    (add-symbolics target-cpu)

    ; Create representation of initial target CPU for validating callee-saved registers.
    (define initial-cpu (init-cpu ctx target-pc-base (copy-hybrid-memmgr memmgr)))
    (add-symbolics initial-cpu)

    (define insns
      (if (emit-insn-split-regs?)
          (for*/all ([src src #:exhaustive]
                      [dst dst #:exhaustive])
            (emit-insn insn-idx (struct-copy bpf:insn bpf-insn [src src] [dst dst]) next-bpf-insn ctx))
          (emit-insn insn-idx bpf-insn next-bpf-insn ctx)))

    (when (&& (arch-invariants ctx initial-cpu target-cpu)
              (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
              (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) (abstract-regs target-cpu)))

      ; Run the BPF interpreter on the symbolic BPF instruction.
      (bpf:interpret-insn bpf-cpu bpf-insn #:next next-bpf-insn)

      (define precondition-next-instruction
        (for/all ([insns insns #:exhaustive])
          ; Run the target interpreter on the JITed instructions
          (run-jitted-code target-pc-start target-cpu insns)

          ; The location of the next instruction is consistent with the mapping from BPF instruction
          ; to target PC. In other words, the size of the code generated by emit-insn is the same
          ; as what is reported by ctx->offset for this architecture.
          (define pre
            (bveq (make-target-pc (bvadd insn-idx bpf-insn-size))
                  (bvadd (make-target-pc insn-idx)
                          (integer->bitvector (code-size insns) (bitvector target-bitwidth)))))

          ; Special handling for BPF function call
          (when (and (equal? code '(BPF_JMP BPF_CALL)) pre (apply && (assumptions)))
            (bug-assert (equal? (trunc target-bitwidth bpf-call-addr) (core:gen-cpu-pc target-cpu))
                        #:msg "per-insn-correctness: Target PC must match address of function after call")
            ; Simulate the effect of a call in the target ABI.
            (simulate-call target-cpu bpf-call-addr bpf-call-fn)
            ; Assumption: After a call, registers R1 through R5 are havocked and must be dead.
            ; We encode this by setting them to be not live in the postcondition.
            (for-each (lambda (r) (bpf:@reg-set! liveset r #f))
                      (list BPF_REG_1 BPF_REG_2 BPF_REG_3 BPF_REG_4 BPF_REG_5 BPF_REG_AX))
            ; Run the JITed code again to handle any post-function cleanup.
            (run-jitted-code target-pc-start target-cpu insns))

          pre))

      ; Add assumptions generated by JIT and JITed code.
      (when (&& precondition-next-instruction
                (apply && (assumptions)))

        (define target-bpf-regs (abstract-regs target-cpu))
        ; Zero-extend when the verifier supports it.
        (when (verifier-does-zext? code imm prog-aux)
          (define value (zero-extend (trunc 32 (bpf:@reg-ref target-bpf-regs dst))
                                      (bitvector 64)))
          (bpf:@reg-set! target-bpf-regs dst value))

        (bug-assert (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
                    #:msg "per-insn-correctness: Tail call count must match.")

        (bug-assert (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) target-bpf-regs)
                    #:msg "per-insn-correctness: Final registers must match")

        (bug-assert (hybrid-memmgr-trace-equal? (bpf:cpu-memmgr bpf-cpu) (core:gen-cpu-memmgr target-cpu))
                    #:msg "per-insn-correctness: Memory traces must match")

        (bug-assert (&& (core:memmgr-invariants (bpf:cpu-memmgr bpf-cpu))
                        (core:memmgr-invariants (core:gen-cpu-memmgr target-cpu)))
                    #:msg "per-insn-correctness: memmgr invariants must continue to hold")

        (bug-assert (arch-invariants ctx initial-cpu target-cpu)
                    #:msg "per-insn-correctness: target CPU invariants must continue to hold")

        ; Compute the final expected target PC. If BPF PC is #f, execution ended
        ; and the target PC must be at the epilogue.
        ; NB: currently assume epilogue is at the end of program.
        (define final-pc-expected
          (if (bpf:cpu-pc bpf-cpu)
              (make-target-pc (trunc 32 (bpf:cpu-pc bpf-cpu)))
              (epilogue-offset target-pc-base ctx)))

        (bug-assert (equal? final-pc-expected (core:gen-cpu-pc target-cpu))
                    #:msg "per-insn-correctness: PCs must match after execution"))))

  ; information for the check-info stack
  (list
    (cons 'bpf-insn bpf-insn)
    (cons 'bpf-regs bpf-regs)
    (cons 'bpf-pc bpf-pc)
    (cons 'final-bpf-regs (bpf:cpu-regs bpf-cpu))
    (cons 'final-bpf-pc (bpf:cpu-pc bpf-cpu))))


; bpf_jit_get_func_addr in Linux can return fixed = false, which indicates that the call address
; is not known ahead of time and will by populated by a future pass of the JIT. For such functions,
; the JIT must emit code whose length does not depend on the specific address of the call, or else
; jump offsets can be corrupted when the end call address is finally populated. This ensures that
; property by proving a noninterference-like property: the size of generated code for two separate
; executions of the JIT for BPF_CALL must not depend on the value of the address for non-fixed calls.
(define (bpf-call-nonfixed-specification target)
  (define target-bitwidth (bpf-target-bitwidth target))
  (define emit-insn (bpf-target-emit-insn target))
  (define init-ctx (bpf-target-init-ctx target))
  (define code-size (bpf-target-code-size target))

  (define-symbolic* target-pc-base1 (bitvector target-bitwidth))
  (define-symbolic* target-pc-base2 (bitvector target-bitwidth))

  (define-symbolic* insn-idx (bitvector 32))
  (define-symbolic* program-length (bitvector 32))

  (define prog-aux (make-bpf-prog-aux))

  (define ctx1 (init-ctx target-pc-base1 insn-idx program-length prog-aux))
  (define ctx2 (init-ctx target-pc-base2 insn-idx program-length prog-aux))

  (define-symbolic* bpf-call-addr1 (bitvector 64))
  (define-symbolic* bpf-call-addr2 (bitvector 64))
  (define-symbolic* imm (bitvector 32))
  (define-symbolic* off (bitvector 32))
  ; Create bpf instruction for call. Choose dummy register r0 (not used).
  (define bpf-insn (bpf:insn '(BPF_JMP BPF_CALL) BPF_REG_0 BPF_REG_0 off imm))

  (define insns1
    (parameterize ([bpf-jit-pseudo-call-addr bpf-call-addr1]
                   [bpf-jit-function-fixed? #f])
      (emit-insn insn-idx bpf-insn #f ctx1)))

  (define insns2
    (parameterize ([bpf-jit-pseudo-call-addr bpf-call-addr2]
                   [bpf-jit-function-fixed? #f])
      (emit-insn insn-idx bpf-insn #f ctx2)))

  (for*/all ([insns1 insns1 #:exhaustive]
             [insns2 insns2 #:exhaustive])
    (when (apply && (bvaxiom:assumptions))
      (bug-assert (equal? (code-size insns1) (code-size insns2))
                  #:msg "BPF_CALL: length of generated code must not vary when addr not fixed"))))