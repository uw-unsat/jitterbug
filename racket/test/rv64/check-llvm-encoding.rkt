#lang rosette

(require
  (for-syntax (only-in racket/syntax format-id))
  serval/lib/solver
  serval/lib/unittest
  serval/lib/bvarith
  "../../lib/bvaxiom.rkt"
  "../../riscv/impl-common.rkt"
  (prefix-in riscv: serval/riscv/decode)
  (prefix-in core: serval/lib/core)
  (only-in rosette/lib/angelic choose*)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in llvm: serval/llvm)

  (prefix-in jit: "jit.ll.rkt")
  (prefix-in jit: "jit.globals.rkt")
  (prefix-in jit: "jit.map.rkt"))

(define (llvm-emit_addi args)
  (parameterize
    ([llvm:current-machine (llvm:make-machine jit:symbols jit:globals)])

      ; Run LLVM code and check no assertions
      (apply jit:@emit_addi (append args (list (jit:@get_ctx))))

      (define ctx (core:mregion-block (core:find-mregion-by-name (llvm:current-mregions) 'ctx)))
      (define insns (core:mregion-block (core:find-mregion-by-name (llvm:current-mregions) 'insns)))

      (define ninsns (core:mblock-iload ctx (cons 'ninsns (cons (bv 0 64) (bv 4 64)))))

      ; Load one RISC-V "parcel" (16-bit instruction or instruction fragment) from offset "off"
      (define (loadparcel off)
        (define path (core:mblock-path insns off (bv 2 64)))
        (core:mblock-iload insns path))

      ; Load one instruction: uses ninsns to determine if 1 or 2 parcels
      (define (loadinsn off size)
        (cond
          [(equal? size (bv 1 32))
            (loadparcel off)]
          [(equal? size (bv 2 32))
            (concat (loadparcel (bvadd (bv 2 64) off)) (loadparcel off))]
          [else
            (assert #f)]))

      (loadinsn (bv 0 64) ninsns)))

; Make ctx with only insns and ninsns
(define (make-dummy-context)
  (context #f (vector) #f (bv 0 32) #f #f #f #f #f))

(define (check-emit_addi)
  (define rd (choose-reg))
  (define rs (choose-reg))
  (define imm (sign-extend (choose-imm 12) (bitvector 32)))

  ; Emit the LLVM version of the insn
  (define llvm-insn (llvm-emit_addi (map make-llvm-arg (list rd rs imm) '(u8 u8 s32))))

  ; Now emit our DSL version
  (define ctx (make-dummy-context))
  (parameterize ([CONFIG_RISCV_ISA_C #t]) ; FORCE ISA_C, it's baked in to the compiled C code for now
    (emit_addi rd rs imm ctx))
  (define dsl-insn (riscv:instruction-encode (vector-ref (context-insns ctx) 0)))

  (assert (bveq dsl-insn llvm-insn)))

(define (choose-nzreg)
  (choose* 'x1 'x2 'x3 'x4 'x5 'x6 'x7 'x8 'x9
           'x10 'x11 'x12 'x13 'x14 'x15 'x16 'x17 'x18 'x19
           'x20 'x21 'x22 'x23 'x24 'x25 'x26 'x27 'x28 'x29
           'x30 'x31))

(define (choose-nznx2reg)
  (choose* 'x1 'x3 'x4 'x5 'x6 'x7 'x8 'x9
           'x10 'x11 'x12 'x13 'x14 'x15 'x16 'x17 'x18 'x19
           'x20 'x21 'x22 'x23 'x24 'x25 'x26 'x27 'x28 'x29
           'x30 'x31))

(define (choose-reg)
  (choose* 'x0 'x1 'x2 'x3 'x4 'x5 'x6 'x7 'x8 'x9
           'x10 'x11 'x12 'x13 'x14 'x15 'x16 'x17 'x18 'x19
           'x20 'x21 'x22 'x23 'x24 'x25 'x26 'x27 'x28 'x29
           'x30 'x31))

(define (choose-creg)
  (choose* 's0 's1 'a0 'a1 'a2 'a3 'a4 'a5))

(define (choose-imm size)
  (core:make-arg (bitvector size)))

(define (choose-nzimm size)
  (define x (choose-imm size))
  (assume (! (bvzero? x)))
  x)

(define (make-llvm-arg arg argspec)
  (for*/all ([arg arg #:exhaustive]
             [argspec argspec #:exhaustive])
    (define extend
      (case argspec
        [(s8 s16 s32 s64) sign-extend]
        [(u8 u16 u32 u64) zero-extend]))

    (define size
      (case argspec
        [(s8 u8) 8]
        [(s16 u16) 16]
        [(s32 u32) 32]
        [(s64 u64) 64]))

    (when (symbol? arg)
      (set! arg (riscv:encode-gpr arg)))

    (extend arg (bitvector size))))

(define (check-encoding llvm-func serval-func args argspecs)
  (define llvm-encoding
    (parameterize
      ([llvm:current-machine (llvm:make-machine jit:symbols jit:globals)])
        (apply llvm-func (map make-llvm-arg args argspecs))))

  (define serval-encoding (riscv:instruction-encode (apply serval-func args)))

  (assert (bveq llvm-encoding serval-encoding))
  (list llvm-encoding serval-encoding))

(define (verify-encoding . args)
  (define result (with-vc vc-true (apply check-encoding args)))
  (check-true (normal? result))
  (define as (vc-asserts (result-state result)))
  (define encodings (result-value result))
  (define model (verify (assert as)))
  (when (sat? model)
    (printf "LLVM: ~v vs. Serval: ~v\n" (evaluate (first encodings) model) (evaluate (second encodings) model))
    (printf "Args: ~v\n" (evaluate (drop args 2) model)))
  (check-unsat? model))

(define-syntax (encoding-test-case stx)
  (syntax-case stx ()
    [(_ id args argspec)
      (with-syntax ([llvm-func (format-id stx "jit:@~a" (syntax-e #'id))]
                    [serval-func (format-id stx "~a" (syntax-e #'id))])
        (syntax/loc stx
          (test-case+ (format "VERIFY ~s encoding" (syntax->datum #'id))
            (with-prefer-boolector
              (verify-encoding llvm-func serval-func args argspec)))))]))

(define-syntax-rule (rtype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-reg) (choose-reg)) '(u8 u8 u8)))

(define-syntax-rule (itype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-reg) (choose-imm 12)) '(u8 u8 u16)))

(define-syntax-rule (utype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-imm 20)) '(u8 u32)))

(define-syntax-rule (itype-shift6-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-reg) (choose-imm 6)) '(u8 u8 u16)))

(define-syntax-rule (itype-shift5-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-reg) (choose-imm 5)) '(u8 u8 u16)))

(define-syntax-rule (stype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-imm 12) (choose-reg)) '(u8 u16 u8)))

(define-syntax-rule (catype-encoding-test-case id)
  (encoding-test-case id (list (choose-creg) (choose-creg)) '(u8 u8)))

(define-syntax-rule (citype-encoding-test-case id)
  (encoding-test-case id (list (choose-nzreg) (choose-nzimm 6)) '(u8 u32)))

(define-syntax-rule (cbtype-encoding-test-case id)
  (encoding-test-case id (list (choose-creg) (choose-nzimm 6)) '(u8 u32)))

(define-syntax-rule (crtype-encoding-test-case id)
  (encoding-test-case id (list (choose-nzreg) (choose-nzreg)) '(u8 u8)))

(define tests
  (test-suite+ "LLVM encoding verification"

    (test-case+ "check emit_addi" (check-emit_addi))

    (citype-encoding-test-case rvc_addi)
    (citype-encoding-test-case rvc_addiw)
    (citype-encoding-test-case rvc_li)
    (citype-encoding-test-case rvc_slli)

    (cbtype-encoding-test-case rvc_andi)
    (cbtype-encoding-test-case rvc_srai)
    (cbtype-encoding-test-case rvc_srli)

    ; Special handling for c.lui since rd cannot be x2.
    (encoding-test-case rvc_lui (list (choose-nznx2reg) (choose-nzimm 6)) '(u8 u32))

    (catype-encoding-test-case rvc_and)
    (catype-encoding-test-case rvc_or)
    (catype-encoding-test-case rvc_sub)
    (catype-encoding-test-case rvc_subw)
    (catype-encoding-test-case rvc_xor)

    (crtype-encoding-test-case rvc_mv)
    (crtype-encoding-test-case rvc_add)

    (encoding-test-case rvc_addi16sp (list (concat (choose-imm 6) (bv 0 4))) '(u32))
    (encoding-test-case rvc_addi4spn (list (choose-creg) (concat (choose-nzimm 8) (bv 0 2))) '(u8 u32))
    (encoding-test-case rvc_jalr (list (choose-nzreg)) '(u8))
    (encoding-test-case rvc_jr (list (choose-nzreg)) '(u8))

    ; Special handling for RVC memory instructions: they usually require that the lower
    ; log2(access size) bits of the immediate are zero.

    (encoding-test-case rvc_ldsp (list (choose-nzreg) (concat (choose-imm 6) (bv 0 3))) '(u8 u32))
    (encoding-test-case rvc_lwsp (list (choose-nzreg) (concat (choose-imm 6) (bv 0 2))) '(u8 u32))
    (encoding-test-case rvc_sdsp (list (concat (choose-imm 6) (bv 0 3)) (choose-reg)) '(u32 u8))
    (encoding-test-case rvc_swsp (list (concat (choose-imm 6) (bv 0 2)) (choose-reg)) '(u32 u8))

    (encoding-test-case rvc_ld (list (choose-creg) (concat (choose-nzimm 6) (bv 0 3)) (choose-creg))
                               '(u8 u32 u8))

    (encoding-test-case rvc_sd (list (choose-creg) (concat (choose-nzimm 6) (bv 0 3)) (choose-creg))
                               '(u8 u32 u8))

    (encoding-test-case rvc_lw (list (choose-creg) (concat (choose-nzimm 6) (bv 0 2)) (choose-creg))
                               '(u8 u32 u8))

    (encoding-test-case rvc_sw (list (choose-creg) (concat (choose-nzimm 6) (bv 0 2)) (choose-creg))
                               '(u8 u32 u8))

    (encoding-test-case rv_jal (list (choose-reg) (concat (choose-imm 20) (bv 0 1))) '(u8 u32))

    (encoding-test-case rv_amoadd_w (list (choose-reg) (choose-reg) (choose-reg) (choose-imm 1) (choose-imm 1))
                                    '(u8 u8 u8 u8 u8))

    (encoding-test-case rv_amoadd_d (list (choose-reg) (choose-reg) (choose-reg) (choose-imm 1) (choose-imm 1))
                                    '(u8 u8 u8 u8 u8))

    (stype-encoding-test-case rv_lbu)
    (stype-encoding-test-case rv_ld)
    (stype-encoding-test-case rv_lhu)
    (stype-encoding-test-case rv_lw)
    (stype-encoding-test-case rv_lwu)
    (stype-encoding-test-case rv_sb)
    (stype-encoding-test-case rv_sd)
    (stype-encoding-test-case rv_sh)
    (stype-encoding-test-case rv_sw)

    (utype-encoding-test-case rv_lui)
    (utype-encoding-test-case rv_auipc)

    (itype-shift6-encoding-test-case rv_slli)
    (itype-shift6-encoding-test-case rv_srai)
    (itype-shift6-encoding-test-case rv_srli)

    (itype-shift5-encoding-test-case rv_slliw)
    (itype-shift5-encoding-test-case rv_sraiw)
    (itype-shift5-encoding-test-case rv_srliw)

    (itype-encoding-test-case rv_jalr)
    (itype-encoding-test-case rv_addi)
    (itype-encoding-test-case rv_addiw)
    (itype-encoding-test-case rv_andi)
    (itype-encoding-test-case rv_beq)
    (itype-encoding-test-case rv_bge)
    (itype-encoding-test-case rv_bgeu)
    (itype-encoding-test-case rv_blt)
    (itype-encoding-test-case rv_bltu)
    (itype-encoding-test-case rv_bne)
    (itype-encoding-test-case rv_ori)
    (itype-encoding-test-case rv_xori)

    (rtype-encoding-test-case rv_add)
    (rtype-encoding-test-case rv_addw)
    (rtype-encoding-test-case rv_and)
    (rtype-encoding-test-case rv_divu)
    (rtype-encoding-test-case rv_divuw)
    (rtype-encoding-test-case rv_mul)
    (rtype-encoding-test-case rv_mulw)
    (rtype-encoding-test-case rv_mulhu)
    (rtype-encoding-test-case rv_or)
    (rtype-encoding-test-case rv_remu)
    (rtype-encoding-test-case rv_remuw)
    (rtype-encoding-test-case rv_sll)
    (rtype-encoding-test-case rv_sllw)
    (rtype-encoding-test-case rv_sltu)
    (rtype-encoding-test-case rv_sra)
    (rtype-encoding-test-case rv_sraw)
    (rtype-encoding-test-case rv_srl)
    (rtype-encoding-test-case rv_srlw)
    (rtype-encoding-test-case rv_sub)
    (rtype-encoding-test-case rv_subw)
    (rtype-encoding-test-case rv_xor)
  ))

(module+ test
  (time (run-tests tests)))
