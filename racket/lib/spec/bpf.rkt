#lang rosette

(require (prefix-in bpf: serval/bpf)
         (prefix-in core: serval/lib/core)
         (prefix-in bvaxiom: "../bvaxiom.rkt")
         "../hybrid-memory.rkt"
         "../bpf-common.rkt"
         rosette/lib/angelic
         serval/lib/debug
         serval/lib/solver
         serval/lib/unittest)

(provide verify-bpf-jit/64
         verify-bpf-jit/32
         default-select-bpf-regs
         (struct-out bpf-target)
         make-bpf-target
         max-insn
         bpf-jit-specification
         bpf-symbolics)

(define verify-fill-holes (make-parameter #f))
(define verify-split-asserts (make-parameter #f))

(define (@check-verify assocs asserted)
  (check-equal? (asserts) null)
  (cond
    ; Use synthesis to filling in the holes, disabled by default.
    [(verify-fill-holes)
      (define sol
         (synthesize
           #:forall (bpf-symbolics)
           #:guarantee (assert (apply && asserted))))
      (check-sat? sol)
      (displayln sol)]

    ; By default, verify asserts at once for better performance.
    ; If verification fails, verify individual asserts again for
    ; better debugging information (rather than "Unknown assert").
    [(and (not (verify-split-asserts))
          (unsat? (verify (assert (apply && asserted)))))
     ; yay
     (void)]

    [else
     (for ([e asserted])
     (define model (verify (assert e)))
     (define info (list))
     (when (sat? model)
       ; set the check-info stack
       (set! info (map (lambda (p) (make-check-info (car p) (evaluate (cdr p) model))) assocs))
       (define bugs (bug-ref e))
       (when (null? bugs)
         (printf "Unknown assert\n"))
       (for ([bug bugs])
         (displayln (bug-format bug model))))
     (with-check-info*
       info
       (thunk (check-unsat? model))))]))

(define (@verify-bpf-jit code target)
  (parameterize
    ([solver-logic 'QF_UFBV]
     [bvaxiom:assumptions null]
     [bpf-symbolics null])
    (define proc
      (case code
        [(PROLOGUE)
          (thunk (prologue-specification target))]
        [(EPILOGUE)
          (thunk (epilogue-specification target))]
        [((BPF_JMP BPF_TAIL_CALL))
          (thunk (tail-call-specification target))]
        [else
          (thunk
            (bpf-jit-specification code target
              #:assumptions bvaxiom:assumptions))]))
    (define-values (assocs asserted) (with-asserts (proc)))
    (@check-verify assocs asserted)))

(define (verify-bpf-jit/64 code target)
  (parameterize
    ([core:target-pointer-bitwidth 64]
     [core:bvmulhu-proc bvaxiom:bvmulhu-uf/64]
     [core:bvmul-proc bvaxiom:bvmul-uf/64]
     [core:bvudiv-proc bvaxiom:bvudiv-uf/64]
     [core:bvurem-proc bvaxiom:bvurem-uf])
    (@verify-bpf-jit code target)))

(define (verify-bpf-jit/32 code target)
  (parameterize
    ([core:target-pointer-bitwidth 32]
     [core:bvmulhu-proc bvaxiom:bvmulhu-uf/32]
     [core:bvmul-proc bvaxiom:bvmul-uf/32]
     [core:bvudiv-proc bvaxiom:bvudiv-uf/32]
     [core:bvurem-proc bvaxiom:bvurem-uf])
    (@verify-bpf-jit code target)))

(define (default-select-bpf-regs r)
  (append '(r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 ax) (if (equal? r 'src) '(r10) '())))

(struct spec-bpf-callmgr (fn) #:transparent
  #:methods bpf:gen:callmgr
  [(define (callmgr-handle-call callmgr cpu insn)
    (case (bpf:insn-code insn)
      [((BPF_JMP BPF_CALL))
        (define fn (spec-bpf-callmgr-fn callmgr))

          (define args (list
            (bpf:reg-ref cpu BPF_REG_1)
            (bpf:reg-ref cpu BPF_REG_2)
            (bpf:reg-ref cpu BPF_REG_3)
            (bpf:reg-ref cpu BPF_REG_4)
            (bpf:reg-ref cpu BPF_REG_5)))

        (define mm (bpf:cpu-memmgr cpu))
        (hybrid-memmgr-trace-event! mm
          (apply call-event fn args))

        ; Compute as result of uf applied to R1-R5
        (define result
          (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes mm 8)))

        ; Havoc R1-R5 and AX
        (bpf:reg-havoc! cpu BPF_REG_1)
        (bpf:reg-havoc! cpu BPF_REG_2)
        (bpf:reg-havoc! cpu BPF_REG_3)
        (bpf:reg-havoc! cpu BPF_REG_4)
        (bpf:reg-havoc! cpu BPF_REG_5)
        (bpf:reg-havoc! cpu BPF_REG_AX)

        ; Store return value in R0
        (bpf:reg-set! cpu BPF_REG_0 result)]

      [((BPF_JMP BPF_TAIL_CALL))
        (error "Tail call is handled separately")]))])

(struct bpf-target (
  bitwidth ; bitwidth of target ISA
  emit-insn ; Function to run the JIT for the target ISA
  emit-prologue ; Function to emit the prologue
  prologue-assumptions ; Assumptions that must hold on prologue entry
  emit-epilogue ; Function to emit the epilogue
  epilogue-guarantees ; What epilogue should guarantee
  select-bpf-regs ; Function to compute list of bpf possible BPF registers
  jit-split-regs? ; Whether to split src/dst when running the JIT
  run-jitted-code ; How to run the jitted code on the target isa
  simulate-call ; Simulate a function call for the target
  supports-pseudocall ; Does the JIT support PSEUDOCALLs? (i.e., BPF-to-BPF calls)
  abstract-regs ; Abstraction function to get bpf:regs from target cpu
  abstract-tail-call-cnt ; Abstraction from target to tail call count
  abstract-return-value ; Abstraction from target to return value
  init-cpu ; Create a new cpu from (target_pc, bpf_cpu)
  cpu-pc ; Extract program counter from the CPU
  set-cpu-pc! ; Set the program counter in CPU
  cpu-memmgr ; Extract memmgr from CPU
  cpu-invariants ; Implementation invariants for CPU
  init-cpu-invariants! ; Initialize CPU with invariants, e.g., to concretize registers
  max-size ; Maximum size of target generated code
  init-ctx ; Initialize JIT context
  bpf-to-target-pc ; Map a BPF program counter to a target program counter
  code-size ; How to go from JIT output to the size of generated code in PC units
  have-efficient-unaligned-access ; Can ptrs on this architecture be unaligned
  function-alignment ; Minimum alignment for function addresses
  max-stack-usage ; Maximum stack size usage
  bpf-stack-range ; (ctx) -> (bottom x top) representing range of addrs in the BPF stack
))

(define (make-bpf-target
  #:target-bitwidth target-bitwidth
  #:run-jit run-jit
  #:emit-prologue [emit-prologue #f]
  #:prologue-assumptions [prologue-assumptions #f]
  #:emit-epilogue [emit-epilogue #f]
  #:epilogue-guarantees [epilogue-guarantees #f]
  #:abstract-regs abstract-regs
  #:abstract-tail-call-cnt [abstract-tail-call-cnt (lambda a (bv 0 32))]
  #:abstract-return-value [abstract-return-value #f]
  #:simulate-call [simulate-call (lambda a (error "call not supported by this target yet"))]
  #:select-bpf-regs [select-bpf-regs default-select-bpf-regs]
  #:run-jit-split-regs? [run-jit-split-regs? #f]
  #:supports-pseudocall [supports-pseudocall #t]
  #:run-code run-jitted-code
  #:init-cpu init-cpu
  #:cpu-pc cpu-pc
  #:set-cpu-pc! [set-cpu-pc! #f]
  #:cpu-memmgr cpu-memmgr
  #:cpu-invariants [cpu-invariants (lambda a #t)]
  #:init-cpu-invariants! [init-cpu-invariants! (lambda a (void))]
  #:max-target-size max-target-size
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-stack-usage max-stack-usage
  #:bpf-stack-range [bpf-stack-range (lambda (ctx) #f)]
  #:have-efficient-unaligned-access [have-efficient-unaligned-access #t]
  #:function-alignment [function-alignment 1])

  (bpf-target target-bitwidth run-jit emit-prologue prologue-assumptions emit-epilogue epilogue-guarantees
              select-bpf-regs run-jit-split-regs? run-jitted-code
              simulate-call supports-pseudocall abstract-regs abstract-tail-call-cnt abstract-return-value
              init-cpu cpu-pc set-cpu-pc! cpu-memmgr
              cpu-invariants init-cpu-invariants!
              (bv max-target-size target-bitwidth)
              init-ctx bpf-to-target-pc code-size
              have-efficient-unaligned-access
              (bv function-alignment 64)
              max-stack-usage
              bpf-stack-range))

(define max-insn (make-parameter (bv #x1000000 32)))

(define (verifier-preconditions mm target insn-idx insn program-length liveset bpf-cpu)
  ; Operands for expressing precondition on BPF instruction
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define stacksize (hybrid-memmgr-stacksize mm))
  (define bitwidth (core:memmgr-bitwidth mm))
  (define code (bpf:insn-code insn))
  (define dst (bpf:insn-dst insn))
  (define src (bpf:insn-src insn))
  (define off (bpf:insn-off insn))
  (define imm (bpf:insn-imm insn))
  (define dst-op (bpf:reg-ref bpf-cpu dst))
  (define src-op (bpf:reg-ref bpf-cpu src))
  (define have-efficient-unaligned-access (bpf-target-have-efficient-unaligned-access target))

  (&&
    ; Program length in-bounds
    (bvule program-length (max-insn))
    ; Current instruction in program-length
    (bvult insn-idx program-length)
    ; Jump target in program-length
    (bvult (bvadd insn-idx (sign-extend off (type-of insn-idx))) program-length)

    (=> (&& (alu32? code) (div? code) (src-x? code)) (! (bveq (extract 31 0 src-op) (bv 0 32))))
    (=> (&& (alu64? code) (div? code) (src-x? code)) (! (bveq src-op (bv 0 64))))
    (=> (&& (alu32? code) (div? code) (src-k? code)) (! (bveq imm (bv 0 32))))
    (=> (&& (alu64? code) (div? code) (src-k? code)) (! (bveq imm (bv 0 32))))
    ; Assume the shifting amount is in-bounds
    (=> (&& (alu32? code) (shift? code) (src-x? code)) (bvult src-op (bv 32 64)))
    (=> (&& (alu64? code) (shift? code) (src-x? code)) (bvult src-op (bv 64 64)))
    (=> (&& (alu32? code) (shift? code) (src-k? code)) (bvult imm (bv 32 32)))
    (=> (&& (alu64? code) (shift? code) (src-k? code)) (bvult imm (bv 64 32)))
    ; Assume the endianness imm is one of 16, 32, 64
    (=> (endian? code) (|| (equal? imm (bv 16 32)) (equal? imm (bv 32 32)) (equal? imm (bv 64 32))))
    ; Assume imm in mov64 is 0
    (=> (&& (alu64? code) (mov? code) (src-x? code))
        (bveq imm (bv 0 32)))
    ; Assume imm in mov32 is either 0 or 1; the latter indicates the special variant with src == dst
    (=> (&& (alu32? code) (mov? code) (src-x? code))
        (|| (bveq imm (bv 0 32))
            (&& (bveq imm (bv 1 32)) (equal? dst src))))

    ; Source is live for BPF_X instructions
    (=> (src-x? code) (bpf:@reg-ref liveset src))
    ; destination is live for MEM, ALU, JMP
    (=> (|| (mem? code) (alu? code) (jump? code)) (bpf:@reg-ref liveset dst))

    ; R1-R5 are live before BPF_CALL
    (=> (equal? code '(BPF_JMP BPF_CALL))
        (&& (bpf:@reg-ref liveset BPF_REG_1)
            (bpf:@reg-ref liveset BPF_REG_2)
            (bpf:@reg-ref liveset BPF_REG_3)
            (bpf:@reg-ref liveset BPF_REG_4)
            (bpf:@reg-ref liveset BPF_REG_5)))

    ; R1-R3 are live before BPF_TAIL_CALL
    (=> (equal? code '(BPF_JMP BPF_TAIL_CALL))
        (&& (bpf:@reg-ref liveset BPF_REG_1)
            (bpf:@reg-ref liveset BPF_REG_2)
            (bpf:@reg-ref liveset BPF_REG_3)))

    ; Preconditions for BPF_MEM instructions.
    (implies (mem? code)
      (let-values ([(addr size) (code+operands->addr+size bitwidth code dst-op src-op off)])
        (&&
          ; No overflowing of addr+size. NB: we likely don't need this precondition if we
          ; modify heap-addr? stack-addr? to account for the possibility of overflow. But seems
          ; easier and okay to do here.
          (bvugt (bvadd addr size) addr)
          ; Pointer is aligned if required by target.
          (=> (! have-efficient-unaligned-access) (core:bvaligned? addr size))
          ; Address is not to the stack.
          (heap-addr? mm addr size))))
  ))

(define bpf-symbolics (make-parameter (list)))

(define (add-symbolics . syms)
  (bpf-symbolics (append (bpf-symbolics) (symbolics syms))))

(define (live-regs-equal? liveset regs1 regs2)
  (apply &&
    (for/list ([i (in-range MAX_BPF_JIT_REG)])
      (define k (bpf:idx->reg i))
      (=> (bpf:@reg-ref liveset k)
          (equal? (bpf:@reg-ref regs1 k)
                  (bpf:@reg-ref regs2 k))))))

(define (make-bpf-prog-aux)
  (define-symbolic* verifier_zext boolean?)
  (define-symbolic* stack_depth (bitvector 32))
  (bpf-prog-aux verifier_zext stack_depth))

; bpf_jit_get_func_addr in Linux can return fixed = false, which indicates that the call address
; is not known ahead of time and will by populated by a future pass of the JIT. For such functions,
; the JIT must emit code whose length does not depend on the specific address of the call, or else
; jump offsets can be corrupted when the end call address is finally populated. This ensures that
; property by proving a noninterference-like property: the size of generated code for two separate
; executions of the JIT for BPF_CALL must not depend on the value of the address for non-fixed calls.
(define (bpf-call-nonfixed-specification target)
  (define target-bitwidth (bpf-target-bitwidth target))
  (define run-jit (bpf-target-emit-insn target))
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
      (run-jit insn-idx bpf-insn #f ctx1)))

  (define insns2
    (parameterize ([bpf-jit-pseudo-call-addr bpf-call-addr2]
                   [bpf-jit-function-fixed? #f])
      (run-jit insn-idx bpf-insn #f ctx2)))

  (when (apply && (bvaxiom:assumptions))
    (bug-assert (equal? (code-size insns1) (code-size insns2))
                #:msg "BPF_CALL: length of generated code must not vary when addr not fixed")))

(define (verifier-does-zext? code imm aux)
  (&& (bpf-prog-aux-verifier_zext aux)
      (|| (and (alu32? code)
               (|| (! (equal? (BPF_MODE code) 'BPF_END))
                   (bvule imm (bv 32 32))))
          (and (equal? (BPF_CLASS code) 'BPF_LDX)
               (|| (equal? (BPF_SIZE code) 'BPF_B)
                   (equal? (BPF_SIZE code) 'BPF_H)
                   (equal? (BPF_SIZE code) 'BPF_W))))))

; Top-level definition for BPF JIT correctness.
(define
  (bpf-jit-specification
    code
    target
    #:assumptions [assumptions (thunk null)])

    ; Extract BPF JIT parameters from description of target architecture.
    (define target-bitwidth (bpf-target-bitwidth target))
    (define abstract-regs (bpf-target-abstract-regs target))
    (define abstract-tail-call-cnt (bpf-target-abstract-tail-call-cnt target))
    (define run-jit (bpf-target-emit-insn target))
    (define run-jit-split-regs? (bpf-target-jit-split-regs? target))
    (define select-bpf-regs (bpf-target-select-bpf-regs target))
    (define run-jitted-code (bpf-target-run-jitted-code target))
    (define simulate-call (bpf-target-simulate-call target))
    (define init-cpu (bpf-target-init-cpu target))
    (define cpu-invariants (bpf-target-cpu-invariants target))
    (define init-cpu-invariants! (bpf-target-init-cpu-invariants! target))
    (define target-cpu-pc (bpf-target-cpu-pc target))
    (define cpu-memmgr (bpf-target-cpu-memmgr target))
    (define init-ctx (bpf-target-init-ctx target))
    (define bpf-to-target-pc (bpf-target-bpf-to-target-pc target))
    (define code-size (bpf-target-code-size target))
    (define max-target-size (bpf-target-max-size target))
    (define supports-pseudocall (bpf-target-supports-pseudocall target))
    (define function-alignment (bpf-target-function-alignment target))
    (define max-stack-usage (bpf-target-max-stack-usage target))
    (define bpf-stack-range (bpf-target-bpf-stack-range target))

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
    (define-symbolic* bpf-call-fn (~> (bitvector 64) (bitvector 64) (bitvector 64) (bitvector 64) (bitvector 64) (bitvector 64)))

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
    (define bpf-insn-size (extract 31 0 (bpf:insn-size bpf-insn)))

    ; Add a list of symbolics we made.
    ; Only useful in program synthesis where we may want to quantify over these variables.
    (add-symbolics next-bpf-insn liveset dst src off imm ctx insn-idx target-pc-base bpf-cpu
                   bpf-call-addr bpf-call-fn bpf-call-fixed? program-length)

    (define pre (&&
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
      (init-cpu-invariants! ctx target-cpu)
      (add-symbolics target-cpu)

      (define insns
        (if run-jit-split-regs?
            (for*/all ([src src #:exhaustive]
                       [dst dst #:exhaustive])
              (run-jit insn-idx (struct-copy bpf:insn bpf-insn [src src] [dst dst]) next-bpf-insn ctx))
            (run-jit insn-idx bpf-insn next-bpf-insn ctx)))

      ; The location of the next instruction is consistent with the mapping from BPF instruction
      ; to target PC. In other words, the size of the code generated by run-jit is the same
      ; as what is reported by ctx->offset for this architecture.
      (define precondition-next-instruction
        (for/all ([insns insns #:exhaustive])
          (bveq (make-target-pc (bvadd insn-idx bpf-insn-size))
                (bvadd (make-target-pc insn-idx)
                       (integer->bitvector (code-size insns) (bitvector target-bitwidth))))))

      (when (&& precondition-next-instruction
                (cpu-invariants ctx target-cpu)
                (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
                (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) (abstract-regs target-cpu)))

        ; Run the BPF interpreter on the symbolic BPF instruction.
        (bpf:interpret-insn bpf-cpu bpf-insn #:next next-bpf-insn)

        (for/all ([insns insns #:exhaustive])

          ; Run the target interpreter on the JITed instructions
          (run-jitted-code target-pc-start target-cpu insns)

          ; Add assumptions generated by JIT and JITed code.
          (when (apply && (assumptions))

            ; Special handling for BPF function call
            (when (equal? code '(BPF_JMP BPF_CALL))
              (bug-assert (equal? (extract (- target-bitwidth 1) 0 bpf-call-addr) (target-cpu-pc target-cpu))
                          #:msg "bpf-jit-specification: Target PC must match address of function after call")
              ; Simulate the effect of a call in the target ABI.
              (simulate-call target-cpu bpf-call-addr bpf-call-fn)
              ; Assumption: After a call, registers R1 through R5 are havocked and must be dead.
              ; We encode this by setting them to be not live in the postcondition.
              (for-each (lambda (r) (bpf:@reg-set! liveset r #f))
                        (list BPF_REG_1 BPF_REG_2 BPF_REG_3 BPF_REG_4 BPF_REG_5 BPF_REG_AX))
              ; Run the JITed code again to handle any post-function cleanup.
              (run-jitted-code target-pc-start target-cpu insns))

            (when (equal? code '(BPF_JMP BPF_TAIL_CALL))
              (set! liveset (apply bpf:regs (make-list MAX_BPF_JIT_REG #f))))

            (define target-bpf-regs (abstract-regs target-cpu))
            ; Zero-extend when the verifier supports it.
            (when (verifier-does-zext? code imm prog-aux)
              (define value (zero-extend (extract 31 0 (bpf:@reg-ref target-bpf-regs dst))
                                         (bitvector 64)))
              (bpf:@reg-set! target-bpf-regs dst value))

            (bug-assert (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
                        #:msg "bpf-jit-specification: Tail call count must match.")

            (bug-assert (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) target-bpf-regs)
                        #:msg "bpf-jit-specification: Final registers must match")

            (bug-assert (hybrid-memmgr-trace-equal? (bpf:cpu-memmgr bpf-cpu) (cpu-memmgr target-cpu))
                        #:msg "bpf-jit-specification: Memory traces must match")

            (bug-assert (&& (core:memmgr-invariants (bpf:cpu-memmgr bpf-cpu))
                            (core:memmgr-invariants (cpu-memmgr target-cpu)))
                        #:msg "bpf-jit-specification: memmgr invariants must continue to hold")

            (bug-assert (cpu-invariants ctx target-cpu)
                        #:msg "bpf-jit-specification: target CPU invariants must continue to hold")

            ; Compute the final expected target PC. If BPF PC is #f, execution ended
            ; and the target PC must be at the epilogue.
            ; NB: currently assume epilogue is at the end of program.
            (define final-pc-expected
              (if (bpf:cpu-pc bpf-cpu)
                  (make-target-pc (extract 31 0 (bpf:cpu-pc bpf-cpu)))
                  (make-target-pc program-length)))

            (bug-assert (equal? final-pc-expected (target-cpu-pc target-cpu))
                        #:msg "bpf-jit-specification: PCs must match after execution")))))

  ; information for the check-info stack
  (list
    (cons 'bpf-insn bpf-insn)
    (cons 'bpf-regs bpf-regs)
    (cons 'bpf-pc bpf-pc)
    (cons 'final-bpf-regs (bpf:cpu-regs bpf-cpu))
    (cons 'final-bpf-pc (bpf:cpu-pc bpf-cpu))))

; Specification for the BPF semantics of a tail call.
(define (bpf-simulate-tail-call cpu)
  (define pc (bpf:cpu-pc cpu))
  (define mm (bpf:cpu-memmgr cpu))
  (define b (core:memmgr-bitwidth mm))
  (define B (/ b 8))
  (define *arr (extract (- b 1) 0 (bpf:reg-ref cpu BPF_REG_2)))
  (define idx (zero-extend (extract 31 0 (bpf:reg-ref cpu BPF_REG_3)) (bitvector b)))

  ; Load maximum number of map entries and check against index.
  (core:bug-on (! (heap-addr? mm *arr (bv 4 b))))
  (define map-max-entries (core:memmgr-load mm *arr (bv 0 b) (bv 4 b) #:dbg #f))

  (cond
    [(|| (bvuge (extract 31 0 idx) map-max-entries)
         (bvugt (bpf:cpu-tail-call-cnt cpu) (bv MAX_TAIL_CALL_CNT 32)))
      (bpf:set-cpu-pc! cpu (bvadd1 pc)) (cons #f (bv 0 b))]
    [else

      ; Load the jump address pointer from the map and check if NULL.
      (core:bug-on (! (heap-addr? mm (bvadd *arr (bvmul idx (bv B b)) (bv 8 b)) (bv B b))))
      (define *jump-addr
        (core:memmgr-load mm (bvadd *arr (bvmul idx (bv B b)))
                              (bv 8 b)
                              (bv B b) #:dbg #f))

      (cond
        [(bvzero? *jump-addr) (bpf:set-cpu-pc! cpu (bvadd1 pc)) (cons #f (bv 0 b))]
        [else
          ; Load the actual jump address and bump the tail call counter.
          (core:bug-on (! (heap-addr? mm *jump-addr (bv B b))))
          (define jump-addr (core:memmgr-load mm *jump-addr (bv 0 b) (bv B b) #:dbg #f))
          (bpf:set-cpu-tail-call-cnt! cpu (bvadd1 (bpf:cpu-tail-call-cnt cpu)))
          (cons #t jump-addr)
  ])]))

(define (tail-call-specification target)

  ; Extract BPF JIT parameters from description of target architecture.
  (define target-bitwidth (bpf-target-bitwidth target))
  (define abstract-regs (bpf-target-abstract-regs target))
  (define abstract-tail-call-cnt (bpf-target-abstract-tail-call-cnt target))
  (define run-jit (bpf-target-emit-insn target))
  (define run-jit-split-regs? (bpf-target-jit-split-regs? target))
  (define select-bpf-regs (bpf-target-select-bpf-regs target))
  (define run-jitted-code (bpf-target-run-jitted-code target))
  (define simulate-call (bpf-target-simulate-call target))
  (define init-cpu (bpf-target-init-cpu target))
  (define cpu-invariants (bpf-target-cpu-invariants target))
  (define set-cpu-pc! (bpf-target-set-cpu-pc! target))
  (define init-cpu-invariants! (bpf-target-init-cpu-invariants! target))
  (define target-cpu-pc (bpf-target-cpu-pc target))
  (define cpu-memmgr (bpf-target-cpu-memmgr target))
  (define init-ctx (bpf-target-init-ctx target))
  (define emit-prologue (bpf-target-emit-prologue target))
  (define bpf-to-target-pc (bpf-target-bpf-to-target-pc target))
  (define code-size (bpf-target-code-size target))
  (define max-target-size (bpf-target-max-size target))
  (define supports-pseudocall (bpf-target-supports-pseudocall target))
  (define function-alignment (bpf-target-function-alignment target))
  (define max-stack-usage (bpf-target-max-stack-usage target))
  (define bpf-stack-range (bpf-target-bpf-stack-range target))
  (define prologue-assumptions (bpf-target-prologue-assumptions target))

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
      (init-cpu-invariants! ctx target-cpu)

      (define tcall-insns (run-jit insn-idx bpf-insn #f ctx))

      ; The location of the next instruction is consistent with the mapping from BPF instruction
      ; to target PC. In other words, the size of the code generated by run-jit is the same
      ; as what is reported by ctx->offset for this architecture.
      (define precondition-next-instruction
        (for/all ([tcall-insns tcall-insns #:exhaustive])
          (bveq (make-target-pc (bvadd1 insn-idx))
                (bvadd (make-target-pc insn-idx)
                      (integer->bitvector (code-size tcall-insns) (bitvector target-bitwidth))))))

      (when (&& precondition-next-instruction
                (cpu-invariants ctx target-cpu)
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
                  (core:bvaligned? tcall-addr (extract (- target-bitwidth 1) 0 function-alignment)))

          (for/all ([tcall-insns tcall-insns #:exhaustive])

            ; Run the target interpreter on the JITed instructions
            (run-jitted-code target-pc-start target-cpu tcall-insns)

            ; The tail call counters must continue to match.
            (bug-assert (equal? (bpf:cpu-tail-call-cnt bpf-cpu) (abstract-tail-call-cnt target-cpu))
                        #:msg "tail-call: Tail call count must match.")

            (bug-assert (hybrid-memmgr-trace-equal? (bpf:cpu-memmgr bpf-cpu) (cpu-memmgr target-cpu))
                        #:msg "tail-call: Memory traces must match")

            (bug-assert (&& (core:memmgr-invariants (bpf:cpu-memmgr bpf-cpu))
                            (core:memmgr-invariants (cpu-memmgr target-cpu)))
                        #:msg "tail-call: memmgr invariants must continue to hold")

            ; At this point we've run the spec for TAIL_CALL and run until the end of the generated code.
            ; Now one of two things are possible. Either the call succeeded, or it did not.
            (cond
              [(! ok)
                ; The first is that the tail call did not succeed. This case should be easy.
                ; In this case, the BPF instruction behaved as though it were a no-op.

                (bug-assert (live-regs-equal? liveset (bpf:cpu-regs bpf-cpu) (abstract-regs target-cpu))
                            #:msg "tail-call: failed tail call must preserve registers")

                (bug-assert (cpu-invariants ctx target-cpu)
                            #:msg "tail-call: failed tail call must maintain invariants")

                (bug-assert (equal? (make-target-pc (extract 31 0 (bpf:cpu-pc bpf-cpu)))
                                    (target-cpu-pc target-cpu))
                            #:msg "tail-call: failed tail call must skip to next instruction")

                (void)]
              [else
                ; In this branch the tail call succeeded. Now we have to prove we jumped to
                ; the correct place, and that if we assume that we jumped to a prologue we
                ; can get back all of the invariants we care about.

                ; This is where things start to become architecture-dependent. Not every arch
                ; has to implement tail call using the prologue, so some of this may not make
                ; sense for archs other than rv32.

                (bug-assert (equal? (target-cpu-pc target-cpu) (bvadd tcall-addr (bv 4 32)))
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

(define (prologue-specification target)
  (define target-bitwidth (bpf-target-bitwidth target))
  (define emit-prologue (bpf-target-emit-prologue target))
  (define init-ctx (bpf-target-init-ctx target))
  (define run-jitted-code (bpf-target-run-jitted-code target))
  (define init-cpu (bpf-target-init-cpu target))
  (define max-stack-usage (bpf-target-max-stack-usage target))
  (define prologue-assumptions (bpf-target-prologue-assumptions target))
  (define cpu-invariants (bpf-target-cpu-invariants target))
  (define cpu-memmgr (bpf-target-cpu-memmgr target))
  (define bpf-stack-range (bpf-target-bpf-stack-range target))
  (define abstract-regs (bpf-target-abstract-regs target))

  (define-symbolic* target-pc-base (bitvector target-bitwidth))
  (define prog-aux (make-bpf-prog-aux))
  (define ctx (init-ctx target-pc-base (bv 0 32) (bv 0 32) prog-aux))

  (define memmgr (make-hybrid-memmgr target-bitwidth 64 (max-stack-usage ctx)))
  (define target-cpu (init-cpu ctx target-pc-base (copy-hybrid-memmgr memmgr)))

  (define bpf-stack-top (bvadd (hybrid-memmgr-stackbase memmgr) (cdr (bpf-stack-range ctx))))

  (define pre (&&
    ; Memory manager invariants hold (e.g., stack alignment)
    (core:memmgr-invariants memmgr)

    ; Prologue assumptions hold
    (prologue-assumptions ctx target-cpu)

    ; BPF stack depth in bounds
    (bvule (bpf-prog-aux-stack_depth prog-aux) (bv 512 32))))

  (parameterize ([enable-stack-addr-symopt #f])
    (when pre
      (define insns (emit-prologue ctx))
      (run-jitted-code target-pc-base target-cpu insns)
      (define regs (abstract-regs target-cpu))
      (bug-assert (equal? (extract (- target-bitwidth 1) 0 (bpf:@reg-ref regs BPF_REG_FP))
                          bpf-stack-top)
                  #:msg "Prologue must initialize BPF_REG_FP to stack top")
      (bug-assert (cpu-invariants ctx target-cpu)
                  #:msg "CPU invariants must hold after running prologue")
      (bug-assert (hybrid-memmgr-trace-equal? memmgr (cpu-memmgr target-cpu))
                  #:msg "Prologue must not generate memory trace events")))

  null)

(define (epilogue-specification target)
  (define target-bitwidth (bpf-target-bitwidth target))
  (define emit-epilogue (bpf-target-emit-epilogue target))
  (define init-ctx (bpf-target-init-ctx target))
  (define run-jitted-code (bpf-target-run-jitted-code target))
  (define init-cpu (bpf-target-init-cpu target))
  (define max-stack-usage (bpf-target-max-stack-usage target))
  (define epilogue-guarantees (bpf-target-epilogue-guarantees target))
  (define cpu-invariants (bpf-target-cpu-invariants target))
  (define cpu-memmgr (bpf-target-cpu-memmgr target))
  (define bpf-stack-range (bpf-target-bpf-stack-range target))
  (define abstract-regs (bpf-target-abstract-regs target))
  (define abstract-return-value (bpf-target-abstract-return-value target))

  (define-symbolic* target-pc-base (bitvector target-bitwidth))
  (define prog-aux (make-bpf-prog-aux))
  (define ctx (init-ctx target-pc-base (bv 0 32) (bv 0 32) prog-aux))

  (define memmgr (make-hybrid-memmgr target-bitwidth 64 (max-stack-usage ctx)))
  (define target-cpu (init-cpu ctx target-pc-base (copy-hybrid-memmgr memmgr)))

  (parameterize ([enable-stack-addr-symopt #f])

    (define pre (&&
      ; Memory manager invariants hold (e.g., stack alignment)
      (core:memmgr-invariants memmgr)
      ; BPF stack depth in bounds
      (bvule (bpf-prog-aux-stack_depth prog-aux) (bv 512 32))))

    (when pre
      (when (cpu-invariants ctx target-cpu)
        (define bpf-return-value (extract 31 0 (bpf:@reg-ref (abstract-regs target-cpu) BPF_REG_0)))
        (define insns (emit-epilogue ctx))

        (run-jitted-code target-pc-base target-cpu insns)
        (bug-assert (equal? (abstract-return-value ctx target-cpu) bpf-return-value)
                    #:msg "Return value must match after running epilogue")
        (bug-assert (epilogue-guarantees ctx target-cpu)
                    #:msg "epilogue guarantees must hold after running epilogue")
        (bug-assert (hybrid-memmgr-trace-equal? memmgr (cpu-memmgr target-cpu))
                    #:msg "Epilogue must not generate memory trace events"))))

  null)
