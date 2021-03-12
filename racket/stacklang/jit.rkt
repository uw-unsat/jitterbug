#lang rosette

; The JIT implementation largely follows the code in Section 4 ("Verified JIT
; compiler – version 1") of the paper "Verified Just-In-Time Compiler on x86"
; in POPL 2010:
;
;   xenc t (pop)    = [8B, 07, 83, C7, 04]
;   xenc t (sub)    = [2B, 07]
;   xenc t (swap)   = [87, 07]
;   xenc t (stop)   = [FF, E2]
;   xenc t (push i) = [83, EF, 04, 89, 07, B8, w2w i, 00, 00, 00]
;   xenc t (jump i) = [E9] ++ ximm (t(w2n i) − 5)
;   xenc t (jeq i)  = [3B, 07, 0F, 84] ++ ximm (t (w2n i) − 5)
;   xenc t (jlt i)  = [3B, 07, 0F, 82] ++ ximm (t (w2n i) − 5)
;
; However, there are two bugs in the above code from the paper: the offsets in
; last two lines (for jeq and jlt) should be 8, rather than 5.
;
; The corresponding Isabelle code is correct:
;   https://www.cl.cam.ac.uk/~mom22/jit/

(require (prefix-in stacklang: "sema.rkt")
         "../lib/extraction/c.rkt"
         (prefix-in core: serval/lib/core))

(provide emit_insn
         current-context
         (struct-out context))


(define immof stacklang:@immof)
(define opcodeof stacklang:opcodeof)
(define inject_bugs stacklang:inject-bugs)

(define current-context (make-parameter #f))

(struct context (insns base-addr addrs) #:mutable #:transparent)

(define (emit_code ctx lst)
  (define vec (list->vector lst))
  (define size (bv (vector-length vec) 32))
  (for/all ([i (context-insns ctx) #:exhaustive])
    (set-context-insns! ctx (vector-append i vec))))

(define (EMIT v n)
  (define lst
    (cond
      [(list? v) (map (lambda (x) (if (bv? x) (extract 7 0 x) (bv x 8))) v)]
      [(bv? v) (core:bitvector->list/le v)]
      [(integer? v) (core:bitvector->list/le (bv v (* n 8)))]
      [else (core:bug #:msg (format "emit: ~a" v))]))
  (emit_code (current-context) (take lst n)))

(define (EMIT1 b0)
  (EMIT (list b0) 1))

(define (EMIT2 b0 b1)
  (EMIT (list b0 b1) 2))

(define (EMIT3 b0 b1 b2)
  (EMIT (list b0 b1 b2) 3))

(func (emit_insn idx insn addrs ctx)
  (var [base (@ addrs idx)]
       [opcode (opcodeof insn)])

  (switch opcode
    [(POP)
      (comment "/* mov eax,[edi] */")
      (EMIT2 (0x 8B) (0x 07))
      (comment "/* add edi,4 */")
      (EMIT3 (0x 83) (0x C7) (0x 04))]
    [(SUB)
      (comment "/* sub eax,[edi] */")
      (EMIT2 (0x 2B) (0x 07))]
    [(SWAP)
      (comment "/* xchg [edi],eax */")
      (EMIT2 (0x 87) (0x 07))]
    [(PUSH)
      (comment "/* sub edi,4 */")
      (EMIT3 (0x 83) (0x EF) (0x 04))
      (comment "/* mov [edi],eax */")
      (EMIT2 (0x 89) (0x 07))
      (comment "/* mov eax,imm32 */")
      (EMIT1 (0x B8))
      (EMIT (immof insn) 4)]
    [(JUMP)
      (comment "/* jmp off32 */")
      (EMIT1 (0x E9))
      (EMIT (bvsub (bvsub (@ addrs (immof insn)) base) (bv 5 32)) 4)]
    [(JEQ)
      (comment "/* cmp eax,[edi] */")
      (EMIT2 (0x 3B) (0x 07))
      (comment "/* je off32 */")
      (EMIT2 (0x 0F) (0x 84))
      (if (inject_bugs)
          (EMIT (bvsub (bvsub (@ addrs (immof insn)) base) (bv 5 32)) 4)
          (EMIT (bvsub (bvsub (@ addrs (immof insn)) base) (bv 8 32)) 4))]
    [(JLT)
      (comment "/* cmp eax,[edi] */")
      (EMIT2 (0x 3B) (0x 07))
      (comment "/* jb off32 */")
      (EMIT2 (0x 0F) (0x 82))
      (EMIT (bvsub (bvsub (@ addrs (immof insn)) base) (bv 8 32)) 4)]
    [(STOP)
      (comment "/* jmp edx */")
      (EMIT2 (0x FF) (0x E2))]))


; types for C code
(begin-for-syntax
  (emit-infer-type
    (lambda (stx)
      (define e (syntax-e stx))
      (define op (syntax-e (car e)))
      (cond
        [(member op '(opcodeof))
         "int"]
        [(and (equal? op '@) (equal? (syntax-e (second e)) 'addrs))
         "int"]))))
