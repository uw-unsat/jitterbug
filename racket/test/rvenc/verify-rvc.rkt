#lang rosette

(require
  (for-syntax (only-in racket/syntax format-id))
  (only-in rosette/lib/angelic choose*)
  serval/lib/unittest
  serval/lib/solver
  (prefix-in riscv: serval/riscv/base)
  (prefix-in core: serval/lib/core)
  "../../lib/hybrid-memory.rkt"
  "../../riscv/spec-common.rkt"
  "../../riscv/impl-common.rkt"
  "../../lib/spec/proof.rkt"
  "../../lib/spec/bpf.rkt")

(define (assert-rvc base-insn emit-fn . args)
  (define xlen (riscv:XLEN))

  (define-symbolic* insn-idx program-length (bitvector 32))
  (define-symbolic* insns-addr base (bitvector xlen))
  (define aux (make-bpf-prog-aux))

  (define mm (make-hybrid-memmgr xlen 64 (bv 0 xlen)))

  (define ctx1 (riscv-init-ctx insns-addr insn-idx program-length aux))
  (define ctx2 (riscv-init-ctx insns-addr insn-idx program-length aux))

  (emit (apply base-insn args) ctx1)
  (apply emit-fn (append args (list ctx2)))

  (define cpu1 ((riscv-init-cpu xlen) ctx1 base (copy-hybrid-memmgr mm)))
  (define cpu2 ((riscv-init-cpu xlen) ctx2 base (copy-hybrid-memmgr mm)))

  (define equal-before? (equal? (riscv:cpu-gprs cpu1) (riscv:cpu-gprs cpu2)))

  (for/all ([insns1 (context-insns ctx1) #:exhaustive])
    (run-jitted-code base cpu1 insns1))

  (for/all ([insns2 (context-insns ctx2) #:exhaustive])
    (run-jitted-code base cpu2 insns2)

    ; Traces must match
    (assert (=> equal-before?
                (hybrid-memmgr-trace-equal? (riscv:cpu-memmgr cpu1)
                                            (riscv:cpu-memmgr cpu2))))

    ; Regs must be equal
    (define equal-after? (equal? (riscv:cpu-gprs cpu1) (riscv:cpu-gprs cpu2)))
    (assert (=> equal-before? equal-after?))))

(define (check-rvc . args)
  (define e (with-asserts-only (apply assert-rvc args)))
  (define total (length e))
  (define n 1)
  (for ([a e])
    (printf "Solving ~v/~v.\n" n total)
    (set! n (add1 n))
    (check-unsat? (verify (assert a)))))

(define (choose-reg)
  (choose* 'x0 'x1 'x2 'x3 'x4 'x5 'x6 'x7 'x8 'x9
           'x10 'x11 'x12 'x13 'x14 'x15 'x16 'x17 'x18 'x19
           'x20 'x21 'x22 'x23 'x24 'x25 'x26 'x27 'x28 'x29
           'x30 'x31))

(define (choose-uimm5)
  (zero-extend (core:make-arg (bitvector 5)) (bitvector 32)))

(define (choose-uimm6)
  (zero-extend (core:make-arg (bitvector 6)) (bitvector 32)))

(define (choose-simm12)
  (sign-extend (core:make-arg (bitvector 12)) (bitvector 32)))

(define-syntax (rvc-verify-case/xlen stx)
  (syntax-case stx ()
    [(_ xlen op args ...)
      (with-syntax ([base-insn (format-id stx "rv_~a" (syntax-e #'op))]
                    [emit-fn (format-id stx "emit_~a" (syntax-e #'op))])
        (syntax/loc stx
          (test-case+
            (format "VERIFY ~s RV~v" (syntax->datum #'op) xlen)
            (with-prefer-boolector
              (parameterize ([riscv:XLEN xlen]
                             [enable-stack-addr-symopt #f])
                (check-rvc base-insn emit-fn args ...))))))]))

(define-syntax-rule (rvc-verify-case op args ...)
  (begin
    (rvc-verify-case/xlen 32 op args ...)
    (rvc-verify-case/xlen 64 op args ...)))

(define-syntax-rule (rvc-verify-case/32 op args ...)
  (rvc-verify-case/xlen 32 op args ...))

(define-syntax-rule (rvc-verify-case/64 op args ...)
  (rvc-verify-case/xlen 64 op args ...))

(define tests
  (test-suite+
    "rvc equivalence tests"

    (rvc-verify-case addi (choose-reg) (choose-reg) (choose-simm12))

    (rvc-verify-case sw (choose-reg) (choose-simm12) (choose-reg))
    (rvc-verify-case/64 sd (choose-reg) (choose-simm12) (choose-reg))

    (rvc-verify-case lw (choose-reg) (choose-simm12) (choose-reg))
    (rvc-verify-case/64 ld (choose-reg) (choose-simm12) (choose-reg))

    (rvc-verify-case lui (choose-reg) (choose-simm12))

    (rvc-verify-case/64 addiw (choose-reg) (choose-reg) (choose-simm12))

    (rvc-verify-case/64 slli (choose-reg) (choose-reg) (choose-uimm6))
    (rvc-verify-case/64 srli (choose-reg) (choose-reg) (choose-uimm6))
    (rvc-verify-case/64 srai (choose-reg) (choose-reg) (choose-uimm6))

    (rvc-verify-case/32 slli (choose-reg) (choose-reg) (choose-uimm5))
    (rvc-verify-case/32 srli (choose-reg) (choose-reg) (choose-uimm5))
    (rvc-verify-case/32 srai (choose-reg) (choose-reg) (choose-uimm5))

    (rvc-verify-case andi (choose-reg) (choose-reg) (choose-simm12))

    ; Pseudo-instructions mv and li
    (rvc-verify-case mv (choose-reg) (choose-reg))
    (rvc-verify-case li (choose-reg) (choose-simm12))

    (rvc-verify-case sub (choose-reg) (choose-reg) (choose-reg))
    (rvc-verify-case/64 subw (choose-reg) (choose-reg) (choose-reg))
    (rvc-verify-case or (choose-reg) (choose-reg) (choose-reg))
    (rvc-verify-case and (choose-reg) (choose-reg) (choose-reg))
    (rvc-verify-case xor (choose-reg) (choose-reg) (choose-reg))
    (rvc-verify-case add (choose-reg) (choose-reg) (choose-reg))
))

(module+ test
  (time (run-tests tests)))
