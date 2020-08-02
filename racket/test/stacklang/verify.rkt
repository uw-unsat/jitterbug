#lang rosette

(require (prefix-in stacklang: "../../stacklang/sema.rkt")
         "../../stacklang/spec.rkt"
         serval/lib/unittest
         rosette/solver/smt/z3)


(current-solver (z3 #:options
  (hash ':smt.auto-config 'false)))

(define (check-jit insn #:expect-bug [expect-bug #f])
  (if (not expect-bug)
      (check-unsat? (verify (jit-specification insn)))
      (check-sat? (verify (jit-specification insn)))))

(define tests
  (test-suite+ "stackjit tests"

    (test-case+ "VERIFY pop"
      (check-jit (stacklang:pop)))

    (test-case+ "VERIFY sub"
      (check-jit (stacklang:sub)))

    (test-case+ "VERIFY swap"
      (check-jit (stacklang:swap)))

    (test-case+ "VERIFY push" (begin
      (define-symbolic* imm (bitvector 7))
      (check-jit (stacklang:push imm))))

    (test-case+ "CHECKBUG push" (parameterize ([stacklang:inject-bugs #t])
      (define-symbolic* imm (bitvector 7))
      (check-jit (stacklang:push imm) #:expect-bug #t)))

    (test-case+ "VERIFY jump" (begin
      (define-symbolic* off (bitvector 7))
      (check-jit (stacklang:jump off))))

    (test-case+ "VERIFY jeq" (begin
      (define-symbolic* off (bitvector 7))
      (check-jit (stacklang:jeq off))))

    (test-case+ "CHECKBUG jeq" (parameterize ([stacklang:inject-bugs #t])
      (define-symbolic* imm (bitvector 7))
      (check-jit (stacklang:jeq imm) #:expect-bug #t)))

    (test-case+ "VERIFY jlt" (begin
      (define-symbolic* off (bitvector 7))
      (check-jit (stacklang:jlt off))))

    (test-case+ "VERIFY stop" (check-jit (stacklang:stop)))

  ))

(module+ test
  (time (run-tests tests)))
