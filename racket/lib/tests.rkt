#lang racket

(require
  "patch.rkt"
  "hybrid-memory.rkt"
  serval/lib/solver
  serval/lib/unittest)

(provide (all-defined-out))

(define (jit-verify-case code proc)
  (test-case+ (format "VERIFY ~s" code) (proc code)))

(define (jit-skip-case code proc)
  (test-case+ (format "SKIP ~s" code) (void)))

(define (make-jit-bug-case check)
  (lambda (code proc)
    (test-case+ (format "BUG ~s" code) ;(with-jit-bug (proc code))))
      (let ([info #f])
        (with-handlers ([exn:test:check? (lambda (e) (set! info (exn:test:check-stack e)))])
          (with-jit-bug (proc code)))
        (check-pred list? info "missing bug")
        ; invoke extra checker
        (check (map (lambda (x) (cons (check-info-name x) (check-info-value x))) info))))))

(define-syntax (test-bugs stx)
  (syntax-case stx ()
    [(_ name proc [code check] ...)
     (syntax/loc stx
       (run-tests (test-suite+ name
         ((make-jit-bug-case check) code proc) ...)))]))

(define-syntax (jit-verify stx)
  (syntax-case stx ()
    [(_ name proc selector code ...)
     (syntax/loc stx
       (with-prefer-boolector
         (run-tests (test-suite+ name
           ((selector code) code proc) ...))))]))

(define (verify-all code)
  jit-verify-case)

(define (skip-div+mod code)
  (if (or (member 'BPF_DIV code) (member 'BPF_MOD code))
      jit-skip-case
      jit-verify-case))

(define (verify-only-in lst)
  (lambda (code)
    (if (ormap (lambda (x) (member x code)) lst)
        jit-verify-case
        jit-skip-case)))

(define (verify-alu32-k name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_ALU BPF_MOV BPF_K)
    '(BPF_ALU BPF_ADD BPF_K)
    '(BPF_ALU BPF_SUB BPF_K)
    '(BPF_ALU BPF_AND BPF_K)
    '(BPF_ALU BPF_OR BPF_K)
    '(BPF_ALU BPF_XOR BPF_K)
    '(BPF_ALU BPF_MUL BPF_K)
    '(BPF_ALU BPF_DIV BPF_K)
    '(BPF_ALU BPF_MOD BPF_K)
    '(BPF_ALU BPF_LSH BPF_K)
    '(BPF_ALU BPF_RSH BPF_K)
    '(BPF_ALU BPF_ARSH BPF_K)
))

(define (verify-alu32-x name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_ALU BPF_MOV BPF_X)
    '(BPF_ALU BPF_ADD BPF_X)
    '(BPF_ALU BPF_SUB BPF_X)
    '(BPF_ALU BPF_AND BPF_X)
    '(BPF_ALU BPF_OR BPF_X)
    '(BPF_ALU BPF_XOR BPF_X)
    '(BPF_ALU BPF_MUL BPF_X)
    '(BPF_ALU BPF_DIV BPF_X)
    '(BPF_ALU BPF_MOD BPF_X)
    '(BPF_ALU BPF_LSH BPF_X)
    '(BPF_ALU BPF_RSH BPF_X)
    '(BPF_ALU BPF_ARSH BPF_X)
    '(BPF_ALU BPF_NEG)
))

(define (verify-alu64-k name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_ALU64 BPF_MOV BPF_K)
    '(BPF_ALU64 BPF_ADD BPF_K)
    '(BPF_ALU64 BPF_SUB BPF_K)
    '(BPF_ALU64 BPF_AND BPF_K)
    '(BPF_ALU64 BPF_OR BPF_K)
    '(BPF_ALU64 BPF_XOR BPF_K)
    '(BPF_ALU64 BPF_MUL BPF_K)
    '(BPF_ALU64 BPF_DIV BPF_K)
    '(BPF_ALU64 BPF_MOD BPF_K)
    '(BPF_ALU64 BPF_LSH BPF_K)
    '(BPF_ALU64 BPF_RSH BPF_K)
    '(BPF_ALU64 BPF_ARSH BPF_K)
))

(define (verify-alu64-x name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_ALU64 BPF_MOV BPF_X)
    '(BPF_ALU64 BPF_ADD BPF_X)
    '(BPF_ALU64 BPF_SUB BPF_X)
    '(BPF_ALU64 BPF_AND BPF_X)
    '(BPF_ALU64 BPF_OR BPF_X)
    '(BPF_ALU64 BPF_XOR BPF_X)
    '(BPF_ALU64 BPF_MUL BPF_X)
    '(BPF_ALU64 BPF_DIV BPF_X)
    '(BPF_ALU64 BPF_MOD BPF_X)
    '(BPF_ALU64 BPF_LSH BPF_X)
    '(BPF_ALU64 BPF_RSH BPF_X)
    '(BPF_ALU64 BPF_ARSH BPF_X)
    '(BPF_ALU64 BPF_NEG)
))

(define (verify-endian name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_ALU BPF_END BPF_FROM_BE)
    '(BPF_ALU BPF_END BPF_FROM_LE)
))

(define (verify-jmp32-k name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_JMP32 BPF_JEQ BPF_K)
    '(BPF_JMP32 BPF_JGT BPF_K)
    '(BPF_JMP32 BPF_JLT BPF_K)
    '(BPF_JMP32 BPF_JGE BPF_K)
    '(BPF_JMP32 BPF_JLE BPF_K)
    '(BPF_JMP32 BPF_JNE BPF_K)
    '(BPF_JMP32 BPF_JSGT BPF_K)
    '(BPF_JMP32 BPF_JSLT BPF_K)
    '(BPF_JMP32 BPF_JSGE BPF_K)
    '(BPF_JMP32 BPF_JSLE BPF_K)
    '(BPF_JMP32 BPF_JSET BPF_K)
))

(define (verify-jmp32-x name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_JMP32 BPF_JEQ BPF_X)
    '(BPF_JMP32 BPF_JGT BPF_X)
    '(BPF_JMP32 BPF_JLT BPF_X)
    '(BPF_JMP32 BPF_JGE BPF_X)
    '(BPF_JMP32 BPF_JLE BPF_X)
    '(BPF_JMP32 BPF_JNE BPF_X)
    '(BPF_JMP32 BPF_JSGT BPF_X)
    '(BPF_JMP32 BPF_JSLT BPF_X)
    '(BPF_JMP32 BPF_JSGE BPF_X)
    '(BPF_JMP32 BPF_JSLE BPF_X)
    '(BPF_JMP32 BPF_JSET BPF_X)
))

(define (verify-jmp64-k name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_JMP BPF_JA)
    '(BPF_JMP BPF_JEQ BPF_K)
    '(BPF_JMP BPF_JGT BPF_K)
    '(BPF_JMP BPF_JLT BPF_K)
    '(BPF_JMP BPF_JGE BPF_K)
    '(BPF_JMP BPF_JLE BPF_K)
    '(BPF_JMP BPF_JNE BPF_K)
    '(BPF_JMP BPF_JSGT BPF_K)
    '(BPF_JMP BPF_JSLT BPF_K)
    '(BPF_JMP BPF_JSGE BPF_K)
    '(BPF_JMP BPF_JSLE BPF_K)
    '(BPF_JMP BPF_JSET BPF_K)
))

(define (verify-jmp64-x name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_JMP BPF_JEQ BPF_X)
    '(BPF_JMP BPF_JGT BPF_X)
    '(BPF_JMP BPF_JLT BPF_X)
    '(BPF_JMP BPF_JGE BPF_X)
    '(BPF_JMP BPF_JLE BPF_X)
    '(BPF_JMP BPF_JNE BPF_X)
    '(BPF_JMP BPF_JSGT BPF_X)
    '(BPF_JMP BPF_JSLT BPF_X)
    '(BPF_JMP BPF_JSGE BPF_X)
    '(BPF_JMP BPF_JSLE BPF_X)
    '(BPF_JMP BPF_JSET BPF_X)
))

(define (skip-tail-call code)
  (if (member 'BPF_TAIL_CALL code)
      jit-skip-case
      jit-verify-case))

(define (verify-jmp-call name proc #:selector [selector skip-tail-call])
  (parameterize ([enable-stack-addr-symopt #f])
    (jit-verify name proc selector
      '(BPF_JMP BPF_CALL)
      '(BPF_JMP BPF_TAIL_CALL)
      '(BPF_JMP BPF_EXIT))))

(define (verify-ld-imm name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_LD BPF_IMM BPF_DW)))

(define (verify-ldx-mem name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_LDX BPF_MEM BPF_B)
    '(BPF_LDX BPF_MEM BPF_H)
    '(BPF_LDX BPF_MEM BPF_W)
    '(BPF_LDX BPF_MEM BPF_DW)))

(define (verify-st-mem name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_ST BPF_MEM BPF_B)
    '(BPF_ST BPF_MEM BPF_H)
    '(BPF_ST BPF_MEM BPF_W)
    '(BPF_ST BPF_MEM BPF_DW)))

(define (verify-stx-mem name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_STX BPF_MEM BPF_B)
    '(BPF_STX BPF_MEM BPF_H)
    '(BPF_STX BPF_MEM BPF_W)
    '(BPF_STX BPF_MEM BPF_DW)))

(define (skip-dw-mem code)
  (if (member 'BPF_DW code)
      jit-skip-case
      jit-verify-case))

(define (verify-stx-xadd name proc #:selector [selector verify-all])
  (jit-verify name proc selector
    '(BPF_STX BPF_XADD BPF_W)
    '(BPF_STX BPF_XADD BPF_DW)))

(define (verify-prologue name proc)
  (jit-verify name proc verify-all
    'PROLOGUE))

(define (verify-epilogue name proc)
  (jit-verify name proc verify-all
    'EPILOGUE))
