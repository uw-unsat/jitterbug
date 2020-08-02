#lang rosette

(require
  (for-syntax (only-in racket/syntax format-id))
  serval/lib/solver
  serval/lib/unittest
  serval/lib/bvarith
  "../../lib/bvaxiom.rkt"
  "../../lib/riscv-common.rkt"
  (prefix-in core: serval/lib/core)
  (only-in rosette/lib/angelic choose*)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in llvm: serval/llvm)
  (prefix-in llvm: "encoding.ll.rkt"))

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
  (when (apply && (assumptions))
    (define llvm-encoding
      (parameterize
        ([llvm:current-machine (llvm:make-machine null null)])
          (apply llvm-func (map make-llvm-arg args argspecs))))

    (define serval-encoding (riscv:instruction-encode (apply serval-func args)))

    (assert (bveq llvm-encoding serval-encoding))
    (list llvm-encoding serval-encoding)))

(define (verify-encoding . args)
  (define-values (encodings as) (with-asserts (apply check-encoding args)))
  (define model (verify (assert (apply && as))))
  (when (sat? model)
    (displayln (evaluate encodings model)))
  (check-unsat? model))

(define-syntax (encoding-test-case stx)
  (syntax-case stx ()
    [(_ id args argspec)
      (with-syntax ([llvm-func (format-id stx "llvm:@~a" (syntax-e #'id))]
                    [serval-func (format-id stx "~a" (syntax-e #'id))])
        (syntax/loc stx
          (test-case+ (format "VERIFY ~s encoding" (syntax->datum #'id))
            (with-prefer-boolector
              (parameterize ([assumptions null])
               (verify-encoding llvm-func serval-func args argspec))))))]))

(define-syntax-rule (rtype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-reg) (choose-reg)) '(u8 u8 u8)))

(define-syntax-rule (itype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-reg) (choose-imm 12)) '(u8 u8 u16)))

(define-syntax-rule (utype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-imm 20)) '(u8 u32)))

(define-syntax-rule (itype-shift-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-reg) (choose-imm 6)) '(u8 u8 u16)))

(define-syntax-rule (stype-encoding-test-case id)
  (encoding-test-case id (list (choose-reg) (choose-imm 12) (choose-reg)) '(u8 u16 u8)))

(define tests
  (test-suite+ "LLVM encoding verification"

    (encoding-test-case rvc_addi4spn (list (choose-creg) (concat (choose-nzimm 8) (bv 0 2))) '(u8 u32))

    (encoding-test-case rv_jal (list (choose-reg) (concat (choose-imm 20) (bv 0 1))) '(u8 u32))

    (encoding-test-case rv_amoadd_w (list (choose-reg) (choose-reg) (choose-reg) (choose-imm 1) (choose-imm 1))
                                    '(u8 u8 u8 u8 u8))

    (encoding-test-case rv_amoadd_d (list (choose-reg) (choose-reg) (choose-reg) (choose-imm 1) (choose-imm 1))
                                    '(u8 u8 u8 u8 u8))

    (stype-encoding-test-case rv_lbu)
    (stype-encoding-test-case rv_ld)
    (stype-encoding-test-case rv_lhu)
    (stype-encoding-test-case rv_lw)
    (stype-encoding-test-case rv_sb)
    (stype-encoding-test-case rv_sd)
    (stype-encoding-test-case rv_sh)
    (stype-encoding-test-case rv_sw)

    (utype-encoding-test-case rv_lui)
    (utype-encoding-test-case rv_auipc)

    (itype-shift-encoding-test-case rv_slli)
    (itype-shift-encoding-test-case rv_srai)
    (itype-shift-encoding-test-case rv_srli)

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