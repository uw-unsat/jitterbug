#lang rosette

; This file contains helpers for specification details specific to BPF and JIT verification.

(require
  (prefix-in bpf: serval/bpf)
  (prefix-in core: serval/lib/core)
  (prefix-in bvaxiom: "../bvaxiom.rkt")
  "../hybrid-memory.rkt"
  "../bpf-common.rkt"
  "../env.rkt"
  rosette/lib/angelic
  serval/lib/bvarith
  serval/lib/debug
  serval/lib/solver
  serval/lib/unittest)

(provide (all-defined-out))

(define (default-select-bpf-regs r)
  (append '(r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 ax) (if (equal? r 'src) '(r10) '())))

; The call manager shims BPF CALL instructions to simulate their effects using
; the BPF calling convention.
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

        ; Compute as result of uf applied to R1-R5
        (define result
          (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes mm 8)))

        (hybrid-memmgr-trace-event! mm
          (apply call-event fn result args))

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
  initial-state? ; Assumptions that must hold on prologue entry
  emit-epilogue ; Function to emit the epilogue
  select-bpf-regs ; Function to compute list of bpf possible BPF registers
  run-jitted-code ; How to run the jitted code on the target isa
  simulate-call ; Simulate a function call for the target
  supports-pseudocall ; Does the JIT support PSEUDOCALLs? (i.e., BPF-to-BPF calls)
  abstract-regs ; Abstraction function to get bpf:regs from target cpu
  abstract-tail-call-cnt ; Abstraction from target to tail call count
  abstract-return-value ; Abstraction from target to return value
  init-cpu ; Create a new cpu from (target_pc, bpf_cpu)
  set-cpu-pc! ; Set the program counter in CPU
  arch-invariants ; Implementation invariants for CPU
  arch-safety ;
  init-arch-invariants! ; Initialize CPU with invariants, e.g., to concretize registers
  max-size ; Maximum size of target generated code
  init-ctx ; Initialize JIT context
  ctx-valid? ; Is it a valid context for a particular instruction index?
  bpf-to-target-pc ; Map a BPF program counter to a target program counter
  code-size ; How to go from JIT output to the size of generated code in PC units
  have-efficient-unaligned-access ; Can ptrs on this architecture be unaligned
  function-alignment ; Minimum alignment for function addresses
  max-stack-usage ; Maximum stack size usage
  bpf-stack-range ; (ctx) -> (bottom x top) representing range of addrs in the BPF stack
  copy-target-cpu ; Make a copy of the target CPU
  epilogue-offset ; Where is the epilogue in target code
))

; Program input is fp and r1
(struct program-input (r1) #:transparent)

(define (bpf-initial-state? ctx input cpu)
  (equal? (bpf:reg-ref cpu BPF_REG_1) (program-input-r1 input)))

(define emit-insn-split-regs? (make-environment-flag "ENABLE_JIT_SPLIT_REGS" #f))

(define (make-bpf-target
  #:target-bitwidth target-bitwidth
  #:emit-insn emit-insn
  #:emit-prologue [emit-prologue (lambda a (error "emit-prologue not supported by target"))]
  #:initial-state? [initial-state? (lambda a (error "initial-state not supported by target"))]
  #:emit-epilogue [emit-epilogue (lambda a (error "emit-epilogue not supported by target"))]
  #:abstract-regs abstract-regs
  #:abstract-tail-call-cnt [abstract-tail-call-cnt (lambda a (bv 0 32))]
  #:abstract-return-value [abstract-return-value #f]
  #:simulate-call [simulate-call (lambda a (error "call not supported by this target yet"))]
  #:select-bpf-regs [select-bpf-regs default-select-bpf-regs]
  #:supports-pseudocall [supports-pseudocall #t]
  #:run-code run-jitted-code
  #:init-cpu init-cpu
  #:set-cpu-pc! [set-cpu-pc! (lambda a (error "set-cpu-pc!: not supported"))]
  #:arch-invariants [arch-invariants (lambda a #t)]
  #:arch-safety [arch-safety (lambda a #t)]
  #:init-arch-invariants! [init-arch-invariants! (lambda a (void))]
  #:max-target-size max-target-size
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-stack-usage max-stack-usage
  #:bpf-stack-range [bpf-stack-range (lambda (ctx) #f)]
  #:have-efficient-unaligned-access [have-efficient-unaligned-access #t]
  #:ctx-valid? [ctx-valid? (lambda a #t)]
  #:function-alignment [function-alignment 1]
  #:epilogue-offset [epilogue-offset #f]
  #:copy-target-cpu [copy-target-cpu (lambda a (error "copy-target-cpu: not supported"))])

  (bpf-target target-bitwidth emit-insn emit-prologue initial-state? emit-epilogue
              select-bpf-regs run-jitted-code
              simulate-call supports-pseudocall abstract-regs abstract-tail-call-cnt abstract-return-value
              init-cpu set-cpu-pc!
              arch-invariants arch-safety init-arch-invariants!
              (bv max-target-size target-bitwidth)
              init-ctx ctx-valid? bpf-to-target-pc code-size
              have-efficient-unaligned-access
              (bv function-alignment 64)
              max-stack-usage
              bpf-stack-range
              copy-target-cpu
              epilogue-offset))

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

    (=> (&& (alu32? code) (div? code) (src-x? code)) (! (bveq (trunc 32 src-op) (bv 0 32))))
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

(define (verifier-does-zext? code imm aux)
  (&& (bpf-prog-aux-verifier_zext aux)
      (|| (and (alu32? code)
               (|| (! (equal? (BPF_MODE code) 'BPF_END))
                   (bvule imm (bv 32 32))))
          (and (equal? (BPF_CLASS code) 'BPF_LDX)
               (|| (equal? (BPF_SIZE code) 'BPF_B)
                   (equal? (BPF_SIZE code) 'BPF_H)
                   (equal? (BPF_SIZE code) 'BPF_W))))))


; Specification for the BPF semantics of a tail call.
(define (bpf-simulate-tail-call cpu)
  (define pc (bpf:cpu-pc cpu))
  (define mm (bpf:cpu-memmgr cpu))
  (define b (core:memmgr-bitwidth mm))
  (define B (/ b 8))
  (define *arr (trunc b (bpf:reg-ref cpu BPF_REG_2)))
  (define idx (zero-extend (trunc 32 (bpf:reg-ref cpu BPF_REG_3)) (bitvector b)))

  ; Load maximum number of map entries and check against index.
  (core:bug-on (! (heap-addr? mm *arr (bv 4 b))))
  (define map-max-entries (core:memmgr-load mm *arr (bv 0 b) (bv 4 b) #:dbg #f))

  (cond
    [(|| (bvuge (trunc 32 idx) map-max-entries)
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
