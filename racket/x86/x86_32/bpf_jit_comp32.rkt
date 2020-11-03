#lang rosette

; This file is translated and adapted from arch/x86/net/bpf_jit_comp32.c,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0
;
; Just-In-Time compiler for eBPF filters on IA32 (32bit x86)
;
; Author: Wang YanQing (udknight@gmail.com)
; The code based on code and ideas from:
; Eric Dumazet (eric.dumazet@gmail.com)
; and from:
; Shubham Bansal <illusionist.neo@gmail.com>

(require
  "../../lib/bpf-common.rkt"
  "../../lib/patch.rkt"
  "../../common.rkt"
  "../common.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf))

(provide (all-defined-out))

(define current-context (make-parameter #f))

(struct context (image insns offset len aux seen-exit cleanup-addr) #:mutable #:transparent)

(define STACK_ALIGNMENT 8)
(define SCRATCH_SIZE 96)
(define (_STACK_SIZE aux)
  (bvadd (bpf-prog-aux-stack_depth aux) (bv SCRATCH_SIZE 32)))
(define (STACK_SIZE aux)
  (round_up (_STACK_SIZE aux) (bv STACK_ALIGNMENT 32)))

(define (emit_code ctx lst)
  (define vec (list->vector lst))
  (define size (bv (vector-length vec) 32))
  (for/all ([i (context-insns ctx) #:exhaustive])
    (set-context-insns! ctx (vector-append i vec)))
  (set-context-len! ctx (bvadd size (context-len ctx))))

(define (EMIT v n)
  (define lst
    (cond
      [(list? v) (map (lambda (x) (if (bv? x) (extract 7 0 x) (bv x 8))) v)]
      [(bv? v) (core:bitvector->list/le v)]
      [(integer? v) (core:bitvector->list/le (bv v (* n 8)))]
      [else (core:bug (format "emit: ~a" v))]))
  (emit_code (current-context) (take lst n)))

(define (EMIT1 b1) (EMIT (list b1) 1))
(define (EMIT2 b1 b2) (EMIT (list b1 b2) 2))
(define (EMIT3 b1 b2 b3) (EMIT (list b1 b2 b3) 3))
(define (EMIT4 b1 b2 b3 b4) (EMIT (list b1 b2 b3 b4) 4))

(define (EMIT1_off32 b1 off)
  (EMIT1 b1)
  (EMIT off 4))

(define (EMIT2_off32 b1 b2 off)
  (EMIT2 b1 b2)
  (EMIT off 4))

(define (EMIT3_off32 b1 b2 b3 off)
  (EMIT3 b1 b2 b3)
  (EMIT off 4))

(define (EMIT4_off32 b1 b2 b3 b4 off)
  (EMIT4 b1 b2 b3 b4)
  (EMIT off 4))

(define (is_imm8 imm32)
  (&& (bvsle imm32 (bv 127 32))
      (bvsge imm32 (bv -128 32))))

(define (is_imm32 imm64)
  (bveq imm64 (sign-extend ((extract 31 0) imm64) (bitvector 64))))


(define (STACK_OFFSET k) (bv k 8))
(define TCALL_CNT 'tcc)

(define (IA32_REG x) (box (bv x 3)))

(define IA32_EAX (IA32_REG #x0))
(define IA32_ECX (IA32_REG #x1))
(define IA32_EDX (IA32_REG #x2))
(define IA32_EBX (IA32_REG #x3))
(define IA32_ESP (IA32_REG #x4))
(define IA32_EBP (IA32_REG #x5))
(define IA32_ESI (IA32_REG #x6))
(define IA32_EDI (IA32_REG #x7))

(define @bpf2ia32 (list
  ; Return value from in-kernel function, and exit value from eBPF
  (cons BPF_REG_0 (cons (STACK_OFFSET 0) (STACK_OFFSET 4)))

  ; The arguments from eBPF program to in-kernel function */
  ; Stored on stack scratch space
  (cons BPF_REG_1 (cons (STACK_OFFSET 8) (STACK_OFFSET 12)))
  (cons BPF_REG_2 (cons (STACK_OFFSET 16) (STACK_OFFSET 20)))
  (cons BPF_REG_3 (cons (STACK_OFFSET 24) (STACK_OFFSET 28)))
  (cons BPF_REG_4 (cons (STACK_OFFSET 32) (STACK_OFFSET 36)))
  (cons BPF_REG_5 (cons (STACK_OFFSET 40) (STACK_OFFSET 44)))

  ; Callee saved registers that in-kernel function will preserve */
  ; Stored on stack scratch space
  (cons BPF_REG_6 (cons (STACK_OFFSET 48) (STACK_OFFSET 52)))
  (cons BPF_REG_7 (cons (STACK_OFFSET 56) (STACK_OFFSET 60)))
  (cons BPF_REG_8 (cons (STACK_OFFSET 64) (STACK_OFFSET 68)))
  (cons BPF_REG_9 (cons (STACK_OFFSET 72) (STACK_OFFSET 76)))

  ; Read only Frame Pointer to access Stack
  (cons BPF_REG_FP (cons (STACK_OFFSET 80) (STACK_OFFSET 84)))

  ; Temporary register for blinding constants.
  (cons BPF_REG_AX (cons IA32_ESI IA32_EDI))

  ; Tail call count. Stored on stack scratch space.
  (cons TCALL_CNT (cons (STACK_OFFSET 88) (STACK_OFFSET 92)))
))

(define (bpf2ia32 r)
  (cdr (assoc r @bpf2ia32)))

(define lo car)
(define hi cdr)

; List of x86 cond jumps opcodes (. + s8)
; Add 0x10 (and an extra 0x0f) to generate far jumps (. + s32)
(define IA32_JB  #x72)
(define IA32_JAE #x73)
(define IA32_JE  #x74)
(define IA32_JNE #x75)
(define IA32_JBE #x76)
(define IA32_JA  #x77)
(define IA32_JL  #x7C)
(define IA32_JGE #x7D)
(define IA32_JLE #x7E)
(define IA32_JG  #x7F)

(define (STACK_VAR off) off)

; Encode 'dst_reg' register into IA32 opcode 'byte'
(define (add_1reg byte dst_reg)
  (set! byte (bv byte 8))
  (set! dst_reg (unbox dst_reg))
  (static-assert (bvzero? (extract 2 0 byte)) "add_1reg: lowest 3 bits must be clear")
  (define r (core:trunc 8 (bvadd (zero-extend byte (bitvector 32))
                                 (zero-extend dst_reg (bitvector 32)))))
  (simplify-with r #:msg "add_1reg"
    (concat (extract 7 3 byte)
            dst_reg)))

; Encode 'dst_reg' and 'src_reg' registers into IA32 opcode 'byte'
(define (add_2reg byte dst_reg src_reg)
  (set! byte (bv byte 8))
  (set! dst_reg (unbox dst_reg))
  (set! src_reg (unbox src_reg))
  (define r (core:trunc 8 (bvadd (zero-extend byte (bitvector 32))
                                 (zero-extend dst_reg (bitvector 32))
                                 (bvshl (zero-extend src_reg (bitvector 32)) (bv 3 32)))))
  (static-assert (bvzero? (extract 5 0 byte)) "add_2reg: lowest 6 bits must be clear")
  (simplify-with r #:msg "add_2reg"
    (concat (extract 7 6 byte)
            src_reg
            dst_reg)))


(define (emit_ia32_mov_i dst val dstk pprog)
  (cond
    [dstk
     (cond
       [(equal? val (bv 0 32))
        ; xor eax,eax
        (EMIT2 #x33 (add_2reg #xC0 IA32_EAX IA32_EAX))
        ; mov dword ptr [ebp+off],eax
        (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR dst))]
       [else
        (EMIT3_off32 #xC7 (add_1reg #x40 IA32_EBP) (STACK_VAR dst) val)])]
    [else
     (cond
       [(equal? val (bv 0 32))
        (EMIT2 #x33 (add_2reg #xC0 dst dst))]
       [else
        (EMIT2_off32 #xC7 (add_1reg #xC0 dst) val)])]))


(define (emit_ia32_mov_r dst src dstk sstk pprog)
  (define sreg (if sstk IA32_EAX src))
  (when sstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR src)))
  (cond
    [dstk
     ; mov dword ptr [ebp+off],eax
     (EMIT3 #x89 (add_2reg #x40 IA32_EBP sreg) (STACK_VAR dst))]
    [else
     ; mov dst,sreg
     (EMIT2 #x89 (add_2reg #xC0 dst sreg))]))


(define (emit_ia32_mov_r64 is64 dst src dstk sstk pprog)
  (define verifier_zext (bpf-prog-aux-verifier_zext (context-aux pprog)))
  (emit_ia32_mov_r (lo dst) (lo src) dstk sstk pprog)
  (cond
    [is64
     ; complete 8 byte move
     (emit_ia32_mov_r (hi dst) (hi src) dstk sstk pprog)]
    [(! verifier_zext)
     ; zero out high 4 bytes
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk pprog)]
    [else (void)]))


(define (emit_ia32_mov_i64 is64 dst val dstk pprog)
  (define hival (bv 0 32))
  (when (&& is64 (bitvector->bool (bvand val (bvshl (bv 1 32) (bv 31 32)))))
    (set! hival (bvnot (bv 0 32))))
  (emit_ia32_mov_i (lo dst) val dstk pprog)
  (emit_ia32_mov_i (hi dst) hival dstk pprog))


; dst = -dst (64 bit)
(define (emit_ia32_neg64 dst dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst))))

  ; neg dreg_lo
  (EMIT2 #xF7 (add_1reg #xD8 dreg_lo))
  ; adc dreg_hi,0x0
  (EMIT3 #x83 (add_1reg #xD0 dreg_hi) (bv 0 8))
  ; neg dreg_hi
  (EMIT2 #xF7 (add_1reg #xD8 dreg_hi))

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)))))


; dst = dst << src
(define (emit_ia32_lsh_r64 dst src dstk sstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst))))

  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR (lo src)))]
    [else
     ; mov ecx,src_lo
     (EMIT2 #x8B (add_2reg #xC0 (lo src) IA32_ECX))])

  ; shld dreg_hi,dreg_lo,cl
  (EMIT3 #x0F #xA5 (add_2reg #xC0 dreg_hi dreg_lo))
  ; shl dreg_lo,cl
  (EMIT2 #xD3 (add_1reg #xE0 dreg_lo))

  ; if ecx >= 32, mov dreg_lo into dreg_hi and clear dreg_lo

  ; cmp ecx,32
  (EMIT3 #x83 (add_1reg #xF8 IA32_ECX) (bv 32 8))
  ; skip the next two instructions (4 bytes) when < 32
  (EMIT2 IA32_JB (bv 4 8))

  ; mov dreg_hi,dreg_lo
  (EMIT2 #x89 (add_2reg #xC0 dreg_hi dreg_lo))
  ; xor dreg_lo,dreg_lo
  (EMIT2 #x33 (add_2reg #xC0 dreg_lo dreg_lo))

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)))))


; dst = dst >> src
(define (emit_ia32_rsh_r64 dst src dstk sstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst))))

  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR (lo src)))]
    [else
     ; mov ecx,src_lo
     (EMIT2 #x8B (add_2reg #xC0 (lo src) IA32_ECX))])

  ; shrd dreg_lo,dreg_hi,cl
  (EMIT3 #x0F #xAD (add_2reg #xC0 dreg_lo dreg_hi))
  ; shr dreg_hi,cl
  (EMIT2 #xD3 (add_1reg #xE8 dreg_hi))

  ; if ecx >= 32, mov dreg_hi to dreg_lo and clear dreg_hi

  ; cmp ecx,32
  (EMIT3 #x83 (add_1reg #xF8 IA32_ECX) (bv 32 8))
  ; skip the next two instructions (4 bytes) when < 32
  (EMIT2 IA32_JB (bv 4 8))

  ; mov dreg_lo,dreg_hi
  (EMIT2 #x89 (add_2reg #xC0 dreg_lo dreg_hi))
  ; xor dreg_hi,dreg_hi
  (EMIT2 #x33 (add_2reg #xC0 dreg_hi dreg_hi))

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)))))


; dst = dst >> src (signed)
(define (emit_ia32_arsh_r64 dst src dstk sstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst))))

  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR (lo src)))]
    [else
     ; mov ecx,src_lo
     (EMIT2 #x8B (add_2reg #xC0 (lo src) IA32_ECX))])

  ; shrd dreg_lo,dreg_hi,cl
  (EMIT3 #x0F #xAD (add_2reg #xC0 dreg_lo dreg_hi))
  ; sar dreg_hi,cl
  (EMIT2 #xD3 (add_1reg #xF8 dreg_hi))

  ; if ecx >= 32, mov dreg_hi to dreg_lo and set/clear dreg_hi
  ; depending on the sign

  ; cmp ecx,32
  (EMIT3 #x83 (add_1reg #xF8 IA32_ECX) (bv 32 8))
  ; skip the next two instructions (5 bytes) when < 32
  (EMIT2 IA32_JB (bv 5 8))

  ; mov dreg_lo,dreg_hi
  (EMIT2 #x89 (add_2reg #xC0 dreg_lo dreg_hi))
  ; sar dreg_hi,31
  (EMIT3 #xC1 (add_1reg #xF8 dreg_hi) (bv 31 8))

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)))))


; dst = dst << val
(define (emit_ia32_lsh_i64 dst val dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst))))

  (cond
    [(bvult val (bv 32 32))

     (BUG
       ; shl dreg_hi,imm8
       (EMIT3 #xC1 (add_1reg #xE0 dreg_hi) val)
       ; mov ebx,dreg_lo
       (EMIT2 #x8B (add_2reg #xC0 dreg_lo IA32_EBX))
       ; shl dreg_lo,imm8
       (EMIT3 #xC1 (add_1reg #xE0 dreg_lo) val)

       ; IA32_ECX = 32 - val
       ; mov ecx,val
       (EMIT2 #xB1 val)
       ; movzx ecx,ecx
       (EMIT3 #x0F #xB6 (add_2reg #xC0 IA32_ECX IA32_ECX))
       ; neg ecx
       (EMIT2 #xF7 (add_1reg #xD8 IA32_ECX))
       ; add ecx,32
       (EMIT3 #x83 (add_1reg #xC0 IA32_ECX) (bv 32 8))

       ; shr ebx,cl
       (EMIT2 #xD3 (add_1reg #xE8 IA32_EBX))
       ; or dreg_hi,ebx
       (EMIT2 #x09 (add_2reg #xC0 dreg_hi IA32_EBX)))

     ; PATCH: the old code is unnecessarily complicated and
     ; incorrect when val == 0.
     (PATCH
       ; shld dreg_hi,dreg_lo,imm8
       (EMIT4 #x0F #xA4 (add_2reg #xC0 dreg_hi dreg_lo) (extract 7 0 val))
       ; shl dreg_lo,imm8
       (EMIT3 #xC1 (add_1reg #xE0 dreg_lo) (extract 7 0 val)))]
    [else
     (define value (bvsub val (bv 32 32)))

     ; shl dreg_lo,imm8
     (EMIT3 #xC1 (add_1reg #xE0 dreg_lo) (extract 7 0 value))
     ; mov dreg_hi,dreg_lo
     (EMIT2 #x89 (add_2reg #xC0 dreg_hi dreg_lo))
     ; xor dreg_lo,dreg_lo
     (EMIT2 #x33 (add_2reg #xC0 dreg_lo dreg_lo))])

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)))))


; dst = dst >> val
(define (emit_ia32_rsh_i64 dst val dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst))))

  (cond
    [(bvult val (bv 32 32))
     ; PATCH: the old code is unnecessarily complicated and
     ; incorrect when val == 0.

     ; shrd dreg_lo,dreg_hi,imm8
     (EMIT4 #x0F #xAC (add_2reg #xC0 dreg_lo dreg_hi) (extract 7 0 val))
     ; shr dreg_hi,imm8
     (EMIT3 #xC1 (add_1reg #xE8 dreg_hi) (extract 7 0 val))]
    [else
     (define value (bvsub val (bv 32 32)))

     ; shr dreg_hi,imm8
     (EMIT3 #xC1 (add_1reg #xE8 dreg_hi) (extract 7 0 value))
     ; mov dreg_lo,dreg_hi
     (EMIT2 #x89 (add_2reg #xC0 dreg_lo dreg_hi))
     ; xor dreg_hi,dreg_hi
     (EMIT2 #x33 (add_2reg #xC0 dreg_hi dreg_hi))])

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)))))


; dst = dst >> val (signed)
(define (emit_ia32_arsh_i64 dst val dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst))))

  (cond
    [(bvult val (bv 32 32))
     ; PATCH: the old code is unnecessarily complicated and
     ; incorrect when val == 0.

     ; shrd dreg_lo,dreg_hi,imm8
     (EMIT4 #x0F #xAC (add_2reg #xC0 dreg_lo dreg_hi) (extract 7 0 val))
     ; sar dreg_hi,imm8
     (EMIT3 #xC1 (add_1reg #xF8 dreg_hi) (extract 7 0 val))]
    [else
     (define value (bvsub val (bv 32 32)))

     ; sar dreg_hi,imm8
     (EMIT3 #xC1 (add_1reg #xF8 dreg_hi) (extract 7 0 value))
     ; mov dreg_lo,dreg_hi
     (EMIT2 #x89 (add_2reg #xC0 dreg_lo dreg_hi))
     ; sar dreg_hi,imm8
     (EMIT3 #xC1 (add_1reg #xF8 dreg_hi) (bv 31 8))])

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)))))


(define (emit_ia32_shift_r op dst src dstk sstk pprog)
  (define dreg (if dstk IA32_EAX dst))
  (when dstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR dst)))
  (cond
   [sstk
    ; mov ecx,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR src))]
   [(! (equal? src IA32_ECX))
    ; mov ecx,src
    (EMIT2 #x8B (add_2reg #xC0 src IA32_ECX))])
  (define b2
    (case op
      [(BPF_LSH) #xE0]
      [(BPF_RSH) #xE8]
      [(BPF_ARSH) #xF8]))
  (EMIT2 #xD3 (add_1reg b2 dreg))

  (when dstk
    ; mov dword ptr [ebp+off],dreg
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg) (STACK_VAR dst))))


(define (emit_ia32_alu_r is64 hi? op dst src dstk sstk pprog)
  (define sreg (if sstk IA32_EAX src))
  (define dreg (if dstk IA32_EDX dst))

  (when sstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR src)))
  (when dstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR dst)))

  (case op
    [(BPF_ADD)
     (cond
       [(&& hi? is64)
        (EMIT2 #x11 (add_2reg #xC0 dreg sreg))]
       [else
        (EMIT2 #x01 (add_2reg #xC0 dreg sreg))])]
    [(BPF_SUB)
     (cond
       [(&& hi? is64)
        (EMIT2 #x19 (add_2reg #xC0 dreg sreg))]
       [else
        (EMIT2 #x29 (add_2reg #xC0 dreg sreg))])]
    [(BPF_OR)
     (EMIT2 #x09 (add_2reg #xC0 dreg sreg))]
    [(BPF_AND)
     (EMIT2 #x21 (add_2reg #xC0 dreg sreg))]
    [(BPF_XOR)
     (EMIT2 #x31 (add_2reg #xC0 dreg sreg))])

  (when dstk
    ; mov dword ptr [ebp+off],dreg
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg) (STACK_VAR dst))))


(define (emit_ia32_alu_r64 is64 op dst src dstk sstk pprog)
  (define verifier_zext (bpf-prog-aux-verifier_zext (context-aux pprog)))

  (emit_ia32_alu_r is64 #f op (lo dst) (lo src) dstk sstk pprog)
  (cond
    [is64
     (emit_ia32_alu_r is64 #t op (hi dst) (hi src) dstk sstk pprog)]
    [(! verifier_zext)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk pprog)]))


(define (emit_ia32_alu_i is64 hi? op dst val dstk pprog)
  (define dreg (if dstk IA32_EAX dst))
  (define sreg IA32_EDX)

  (when dstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR dst)))
  (when (! (is_imm8 val))
    ; mov edx,imm32
    (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_EDX) val))

  (case op
    [(BPF_ADD)
     (if (&& hi? is64)
         (if (is_imm8 val)
             (EMIT3 #x83 (add_1reg #xD0 dreg) (extract 7 0 val))
             (EMIT2 #x11 (add_2reg #xC0 dreg sreg)))
         (if (is_imm8 val)
             (EMIT3 #x83 (add_1reg #xC0 dreg) (extract 7 0 val))
             (EMIT2 #x01 (add_2reg #xC0 dreg sreg))))]
    [(BPF_SUB)
     (if (&& hi? is64)
         (if (is_imm8 val)
             (EMIT3 #x83 (add_1reg #xD8 dreg) (extract 7 0 val))
             (EMIT2 #x19 (add_2reg #xC0 dreg sreg)))
         (if (is_imm8 val)
             (EMIT3 #x83 (add_1reg #xE8 dreg) (extract 7 0 val))
             (EMIT2 #x29 (add_2reg #xC0 dreg sreg))))]
    [(BPF_AND)
     (if (is_imm8 val)
         (EMIT3 #x83 (add_1reg #xE0 dreg) (extract 7 0 val))
         (EMIT2 #x21 (add_2reg #xC0 dreg sreg)))]
    [(BPF_OR)
     (if (is_imm8 val)
         (EMIT3 #x83 (add_1reg #xC8 dreg) (extract 7 0 val))
         (EMIT2 #x09 (add_2reg #xC0 dreg sreg)))]
    [(BPF_XOR)
     (if (is_imm8 val)
         (EMIT3 #x83 (add_1reg #xF0 dreg) (extract 7 0 val))
         (EMIT2 #x31 (add_2reg #xC0 dreg sreg)))]
    [(BPF_NEG)
     (EMIT2 #xF7 (add_1reg #xD8 dreg))])

  (when dstk
    ; mov dword ptr [ebp+off],dreg
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg) (STACK_VAR dst))))


(define (emit_ia32_alu_i64 is64 op dst val dstk pprog)
  (define hival (bv 0 32))
  (when (&& is64 (! (bvzero? (bvand val (bv (arithmetic-shift 1 31) 32)))))
    (set! hival (bv -1 32)))

  (emit_ia32_alu_i is64 #f op (lo dst) val dstk pprog)
  (if is64
      (emit_ia32_alu_i is64 #t op (hi dst) hival dstk pprog)
      (emit_ia32_mov_i (hi dst) (bv 0 32) dstk pprog)))


(define (emit_ia32_mul_r dst src dstk sstk pprog)
  (define sreg (if sstk IA32_ECX src))

  (when sstk
    ; mov ecx,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR src)))

  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR dst))
      ; mov eax,dst
      (EMIT2 #x8B (add_2reg #xC0 dst IA32_EAX)))

  ; mul sreg
  (EMIT2 #xF7 (add_1reg #xE0 sreg))

  (if dstk
      ; mov dword ptr [ebp+off],eax
      (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR dst))
      ; mov dst,eax
      (EMIT2 #x89 (add_2reg #xC0 dst IA32_EAX))))


(define (emit_ia32_mul_r64 dst src dstk sstk pprog)
  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (hi dst)))
      ; mov eax,dst_hi
      (EMIT2 #x8B (add_2reg #xC0 (hi dst) IA32_EAX)))

  (if sstk
      ; mul dword ptr [ebp+off]
      (EMIT3 #xF7 (add_1reg #x60 IA32_EBP) (STACK_VAR (lo src)))
      ; mul src_lo
      (EMIT2 #xF7 (add_1reg #xE0 (lo src))))

  ; mov ecx,eax
  (EMIT2 #x89 (add_2reg #xC0 IA32_ECX IA32_EAX))

  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
      ; mov eax,dst_lo
      (EMIT2 #x8B (add_2reg #xC0 (lo dst) IA32_EAX)))

  (if sstk
      ; mul dword ptr [ebp+off]
      (EMIT3 #xF7 (add_1reg #x60 IA32_EBP) (STACK_VAR (hi src)))
      ; mul src_hi
      (EMIT2 #xF7 (add_1reg #xE0 (hi src))))

  ; add ecx,eax
  (EMIT2 #x01 (add_2reg #xC0 IA32_ECX IA32_EAX))

  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
      ; mov eax,dst_lo
      (EMIT2 #x8B (add_2reg #xC0 (lo dst) IA32_EAX)))

  (if sstk
      ; mul dword ptr [ebp+off]
      (EMIT3 #xF7 (add_1reg #x60 IA32_EBP) (STACK_VAR (lo src)))
      ; mul src_lo
      (EMIT2 #xF7 (add_1reg #xE0 (lo src))))

  ; add ecx,edx
  (EMIT2 #x01 (add_2reg #xC0 IA32_ECX IA32_EDX))

  (cond
    [dstk
     ; mov dword ptr [ebp+off],eax
     (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
     ; mov dword ptr [ebp+off],ecx
     (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR (hi dst)))]
     [else
      ; mov dst_lo,eax
      (EMIT2 #x89 (add_2reg #xC0 (lo dst) IA32_EAX))
      ; mov dst_hi,ecx
      (EMIT2 #x89 (add_2reg #xC0 (hi dst) IA32_ECX))]))


(define (emit_ia32_mul_i64 dst val dstk pprog)
  (define hival (if (! (bvzero? (bvand val (bv (arithmetic-shift 1 31) 32)))) (bv -1 32) (bv 0 32)))
  ; movl eax,imm32
  (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_EAX) val)
  (if dstk
    ; mul dword ptr [ebp+off]
    (EMIT3 #xF7 (add_1reg #x60 IA32_EBP) (STACK_VAR (hi dst)))
    ; mul dst_hi
    (EMIT2 #xF7 (add_1reg #xE0 (hi dst))))

  ; mov ecx,eax
  (EMIT2 #x89 (add_2reg #xC0 IA32_ECX IA32_EAX))

  ; movl eax,imm32
  (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_EAX) hival)
  (if dstk
      ; mul dword ptr [ebp+off]
      (EMIT3 #xF7 (add_1reg #x60 IA32_EBP) (STACK_VAR (lo dst)))
      ; mul dst_lo
      (EMIT2 #xF7 (add_1reg #xE0 (lo dst))))
  ; add ecx,eax
  (EMIT2 #x01 (add_2reg #xC0 IA32_ECX IA32_EAX))

  ; movl eax,imm32
  (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_EAX) val)
  (if dstk
      ; mul dword ptr [ebp+off]
      (EMIT3 #xF7 (add_1reg #x60 IA32_EBP) (STACK_VAR (lo dst)))
      ; mul dst_lo
      (EMIT2 #xF7 (add_1reg #xE0 (lo dst))))

  ; add ecx,edx
  (EMIT2 #x01 (add_2reg #xC0 IA32_ECX IA32_EDX))

  (cond
    [dstk
     ; mov dword ptr [ebp+off],eax
     (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
     ; mov dword ptr [ebp+off],ecx
     (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR (hi dst)))]
    [else
     ; mov dword ptr [ebp+off],eax
     (EMIT2 #x89 (add_2reg #xC0 (lo dst) IA32_EAX))
     ; mov dword ptr [ebp+off],ecx
     (EMIT2 #x89 (add_2reg #xC0 (hi dst) IA32_ECX))]))


(define (emit_ia32_to_le_r64 dst val dstk pprog)
  (define verifier_zext (bpf-prog-aux-verifier_zext (context-aux pprog)))

  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when (&& dstk (! (bveq val (bv 64 32))))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR (hi dst))))

  (cond
    [(bveq val (bv 16 32))
     ; Emit 'movzwl eax,ax' to zero extend 16-bit into 64 bit
     (EMIT2 #x0F #xB7)
     (EMIT1 (add_2reg #xC0 dreg_lo dreg_lo))
     (when (! verifier_zext)
      ; xor dreg_hi,dreg_hi
      (EMIT2 #x33 (add_2reg #xC0 dreg_hi dreg_hi)))]
    [(bveq val (bv 32 32))
      (when (! verifier_zext)
        ; xor dreg_hi,dreg_hi
        (EMIT2 #x33 (add_2reg #xC0 dreg_hi dreg_hi)))]
    [(bveq val (bv 64 32))
     ; nop
     (void)])

  (when (&& dstk (! (bveq val (bv 64 32))))
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo) (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi */
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi) (STACK_VAR (hi dst)))))

(define (emit_ia32_to_be_r64 dst val dstk pprog)
  (define verifier_zext (bpf-prog-aux-verifier_zext (context-aux pprog)))

  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR (hi dst))))

  (cond
    [(bveq val (bv 16 32))
     ; Emit 'ror %ax, 8' to swap lower 2 bytes
     (EMIT1 #x66)
     (EMIT3 #xC1 (add_1reg #xC8 dreg_lo) 8)

     (EMIT2 #x0F #xB7)
     (EMIT1 (add_2reg #xC0 dreg_lo dreg_lo))

     (when (! verifier_zext)
      ; xor dreg_hi,dreg_hi
      (EMIT2 #x33 (add_2reg #xC0 dreg_hi dreg_hi)))]
    [(bveq val (bv 32 32))
     ; Emit 'bswap eax' to swap lower 4 bytes
     (EMIT1 #x0F)
     (EMIT1 (add_1reg #xC8 dreg_lo))

     (when (! verifier_zext)
      ; xor dreg_hi,dreg_hi
      (EMIT2 #x33 (add_2reg #xC0 dreg_hi dreg_hi)))]

    [(bveq val (bv 64 32))
     ; Emit 'bswap eax' to swap lower 4 bytes
     (EMIT1 #x0F)
     (EMIT1 (add_1reg #xC8 dreg_lo))

     ; Emit 'bswap edx' to swap lower 4 bytes
     (EMIT1 #x0F)
     (EMIT1 (add_1reg #xC8 dreg_hi))

     ; mov ecx,dreg_hi
     (EMIT2 #x89 (add_2reg #xC0 IA32_ECX dreg_hi))
     ; mov dreg_hi,dreg_lo
     (EMIT2 #x89 (add_2reg #xC0 dreg_hi dreg_lo))
     ; mov dreg_lo,ecx
     (EMIT2 #x89 (add_2reg #xC0 dreg_lo IA32_ECX))])

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_lo) (STACK_VAR (lo dst)))
    ; mov dword ptr [ebp+off],dreg_hi */
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP dreg_hi) (STACK_VAR (hi dst)))))


(define (emit_ia32_div_mod_r op dst src dstk sstk pprog)
  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR src))]
    [(! (equal? src IA32_ECX))
     ; mov ecx,src
     (EMIT2 #x8B (add_2reg #xC0 src IA32_ECX))])

  (cond
    [dstk
     ; mov eax,dword ptr [ebp+off]
     (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR dst))]
    [else
     ; mov eax,dst
     (EMIT2 #x8B (add_2reg #xC0 dst IA32_EAX))])

  ; xor edx,edx */
  (EMIT2 #x31 (add_2reg #xC0 IA32_EDX IA32_EDX))
  ; div ecx
  (EMIT2 #xF7 (add_1reg #xF0 IA32_ECX))

  (cond
    [(equal? op 'BPF_MOD)
     (cond
       [dstk
        (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR dst))]
       [else
        (EMIT2 #x89 (add_2reg #xC0 dst IA32_EDX))])]
    [else
     (cond
       [dstk
        (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR dst))]
       [else
        (EMIT2 #x89 (add_2reg #xC0 dst IA32_EAX))])]))


(define (bpf_size_to_x86_bytes bpf_size)
  (case bpf_size
    [(BPF_W) 4]
    [(BPF_H) 2]
    [(BPF_B) 1]
    [(BPF_DW) 4])) ; imm32

(define (emit_prologue ctx stack_depth)
  (define aux (context-aux ctx))
  (parameterize ([current-context ctx])
    (define r1 (bpf2ia32 BPF_REG_1))
    (define fplo (lo (bpf2ia32 BPF_REG_FP)))
    (define fphi (hi (bpf2ia32 BPF_REG_FP)))
    (define tcc (bpf2ia32 TCALL_CNT))

    ; push ebp
    (EMIT1 #x55)
    ; mov ebp,esp
    (EMIT2 #x89 #xE5)
    ; push edi
    (EMIT1 #x57)
    ; push esi
    (EMIT1 #x56)
    ; push ebx
    (EMIT1 #x53)

    ; sub esp,STACK_SIZE
    (EMIT2_off32 #x81 #xEC (STACK_SIZE aux))
    ; sub ebp,SCRATCH_SIZE+12
    (EMIT3 #x83 (add_1reg #xE8 IA32_EBP) (core:trunc 8 (bvadd (bv SCRATCH_SIZE 32) (bv 12 32))))
    ; xor ebx,ebx
    (EMIT2 #x31 (add_2reg #xC0 IA32_EBX IA32_EBX))

    ; Set up BPF prog stack base register
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EBP) (STACK_VAR fplo))
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EBX) (STACK_VAR fphi))

    ; Move BPF_CTX (EAX) to BPF_REG_R1
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo r1)))
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EBX) (STACK_VAR (hi r1)))

    ; Initialize Tail Count
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EBX) (STACK_VAR (lo tcc)))
    (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EBX) (STACK_VAR (hi tcc)))

    (void)))

(define (emit_epilogue ctx stack_depth)
  (parameterize ([current-context ctx])
    (define r0 (bpf2ia32 BPF_REG_0))

    ; mov eax,dwrod ptr [ebpf+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo r0)))
    ; mov edx,dword ptr [ebp+off]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR (hi r0)))

    ; add ebp,SCRATCH_SIZE+12
    (EMIT3 #x83 (add_1reg #xC0 IA32_EBP) (core:trunc 8 (bvadd (bv SCRATCH_SIZE 32) (bv 12 32))))

    ; mov ebx,dword ptr [ebp-12]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EBX) (bv -12 8))
    ; mov esi,dword ptr [ebp-8]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ESI) (bv -8 8))
    ; mov edi,dword ptr [ebp-4]
    (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDI) (bv -4 8))

    (EMIT1 #xC9) ; leave
    (EMIT1 #xC3) ; ret

    (void)))

; Push the scratch register on top of the stack.
(define (emit_push_r64 src pprog)
  ; mov ecx,dword ptr [ebp+off]
  (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR (hi src)))
  ; push ecx
  (EMIT1 #x51)

  ; mov ecx,dword ptr [ebp+off]
  (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX) (STACK_VAR (lo src)))
  ; push ecx
  (EMIT1 #x51))


(define (get_cond_jmp_opcode op is_cmp_lo)
  (case op
    [(BPF_JEQ)
     IA32_JE]
    [(BPF_JSET BPF_JNE)
     IA32_JNE]
    [(BPF_JGT)
     IA32_JA]
    [(BPF_JLT)
     IA32_JB]
    [(BPF_JGE)
     IA32_JAE]
    [(BPF_JLE)
     IA32_JBE]
    [(BPF_JSGT)
     (if (! is_cmp_lo) IA32_JG IA32_JA)]
    [(BPF_JSLT)
     (if (! is_cmp_lo) IA32_JL IA32_JB)]
    [(BPF_JSGE)
     (if (! is_cmp_lo) IA32_JGE IA32_JAE)]
    [(BPF_JSLE)
     (if (! is_cmp_lo) IA32_JLE IA32_JBE)]
    [else
     (exit 1)]))


(define (emit_insn i insn next-insn ctx)
  (parameterize ([current-context ctx])
    (do_jit i insn next-insn ctx)
    (context-insns ctx)))

(define (do_jit i insn next-insn &prog)
  (define verifier_zext (bpf-prog-aux-verifier_zext (context-aux &prog)))

  (define code (bpf:insn-code insn))
  (define dst_reg (bpf:insn-dst insn))
  (define src_reg (bpf:insn-src insn))
  (define off (bpf:insn-off insn))
  (define imm32 (bpf:insn-imm insn))
  (define off32 (sign-extend off (bitvector 32)))

  (define image (context-image &prog))
  (define addrs (context-offset &prog))
  (define is64 (equal? (BPF_CLASS code) 'BPF_ALU64))
  (define dstk (! (equal? dst_reg BPF_REG_AX)))
  (define sstk (! (equal? src_reg BPF_REG_AX)))
  (define dst (if dst_reg (bpf2ia32 dst_reg) #f))
  (define src (if src_reg (bpf2ia32 src_reg) #f))
  (define r0 (bpf2ia32 BPF_REG_0))

  (define (emit_cond_jmp)
    (define jmp_cond (get_cond_jmp_opcode (BPF_OP code) #f))
    (define jmp_offset (bvsub (addrs (bvadd i off32)) (addrs i)))
    (cond
      [(is_imm8 jmp_offset)
       (EMIT2 jmp_cond (extract 7 0 jmp_offset))]
      [else
       (EMIT2_off32 #x0F (+ jmp_cond #x10) jmp_offset)]))

  (define (emit_cond_jmp_signed)
    ; check the condition for low 32-bit comparison
    (let ([jmp_cond (get_cond_jmp_opcode (BPF_OP code) #t)]
          [jmp_offset (bvadd (bvsub (addrs (bvadd i off32)) (addrs i)) (bv 8 32))])
      (EMIT2_off32 #x0F (+ jmp_cond #x10) jmp_offset)
      (EMIT2 #xEB (bv 6 8)))
    ; check the condition for high 32-bit comparison
    (let ([jmp_cond (get_cond_jmp_opcode (BPF_OP code) #f)]
          [jmp_offset (bvsub (addrs (bvadd i off32)) (addrs i))])
      (EMIT2_off32 #x0F (+ jmp_cond #x10) jmp_offset)))

  (case code
    ; dst = src
    [((BPF_ALU BPF_MOV BPF_X)
      (BPF_ALU64 BPF_MOV BPF_X))
     (cond
       [(equal? imm32 (bv 1 32))
         ; Special mov32 for zext.
         (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]
       [else
         (emit_ia32_mov_r64 is64 dst src dstk sstk &prog)])]
    [((BPF_ALU BPF_MOV BPF_K)
      (BPF_ALU64 BPF_MOV BPF_K))
     (emit_ia32_mov_i64 is64 dst imm32 dstk &prog)]

    ; dst = dst + src/imm
    ; dst = dst - src/imm
    ; dst = dst | src/imm
    ; dst = dst & src/imm
    ; dst = dst ^ src/imm
    ; dst = dst * src/imm
    ; dst = dst << src
    ; dst = dst >> src
    [((BPF_ALU BPF_ADD BPF_X)
      (BPF_ALU BPF_SUB BPF_X)
      (BPF_ALU BPF_OR BPF_X)
      (BPF_ALU BPF_AND BPF_X)
      (BPF_ALU BPF_XOR BPF_X)
      (BPF_ALU64 BPF_ADD BPF_X)
      (BPF_ALU64 BPF_SUB BPF_X)
      (BPF_ALU64 BPF_OR BPF_X)
      (BPF_ALU64 BPF_AND BPF_X)
      (BPF_ALU64 BPF_XOR BPF_X))
     (emit_ia32_alu_r64 is64 (BPF_OP code) dst src dstk sstk &prog)]
    [((BPF_ALU BPF_ADD BPF_K)
      (BPF_ALU BPF_SUB BPF_K)
      (BPF_ALU BPF_OR BPF_K)
      (BPF_ALU BPF_AND BPF_K)
      (BPF_ALU BPF_XOR BPF_K)
      (BPF_ALU64 BPF_ADD BPF_K)
      (BPF_ALU64 BPF_SUB BPF_K)
      (BPF_ALU64 BPF_OR BPF_K)
      (BPF_ALU64 BPF_AND BPF_K)
      (BPF_ALU64 BPF_XOR BPF_K))
     (emit_ia32_alu_i64 is64 (BPF_OP code) dst imm32 dstk &prog)]

    [((BPF_ALU BPF_MUL BPF_X))
     (emit_ia32_mul_r (lo dst) (lo src) dstk sstk &prog)
     (when (! verifier_zext)
      (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog))]
    [((BPF_ALU BPF_MUL BPF_K))
     ; mov ecx,imm32
     (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_ECX) imm32)
     (emit_ia32_mul_r (lo dst) IA32_ECX dstk #f &prog)
     (when (! verifier_zext)
       (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog))]

    [((BPF_ALU BPF_LSH BPF_X)
      (BPF_ALU BPF_RSH BPF_X)
      (BPF_ALU BPF_ARSH BPF_X))
     (emit_ia32_shift_r (BPF_OP code) (lo dst) (lo src) dstk sstk &prog)
     (when (! verifier_zext)
       (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog))]
    [((BPF_ALU BPF_LSH BPF_K)
      (BPF_ALU BPF_RSH BPF_K)
      (BPF_ALU BPF_ARSH BPF_K))
     ; mov ecx,imm32
     (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_ECX) imm32)
     (emit_ia32_shift_r (BPF_OP code) (lo dst) IA32_ECX dstk #f &prog)
     (when (! verifier_zext)
       (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog))]

    ; dst = dst / src(imm)
    ; dst = dst % src(imm)
    [((BPF_ALU BPF_DIV BPF_X)
      (BPF_ALU BPF_MOD BPF_X))
     (emit_ia32_div_mod_r (BPF_OP code) (lo dst) (lo src) dstk sstk &prog)
     (when (! verifier_zext)
       (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog))]
    [((BPF_ALU BPF_DIV BPF_K)
      (BPF_ALU BPF_MOD BPF_K))
     ; mov ecx,imm32
     (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_ECX) imm32)
     (emit_ia32_div_mod_r (BPF_OP code) (lo dst) IA32_ECX dstk #f &prog)
     (when (! verifier_zext)
       (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog))]

    ; (BPF_ALU64 BPF_DIV BPF_X)
    ; (BPF_ALU64 BPF_MOD BPF_X)
    ; (BPF_ALU64 BPF_DIV BPF_K)
    ; (BPF_ALU64 BPF_MOD BPF_K)
    ; goto notyet;

    ; dst = dst << imm
    [((BPF_ALU64 BPF_LSH BPF_K))
     (emit_ia32_lsh_i64 dst imm32 dstk &prog)]
    ; dst = dst >> imm
    [((BPF_ALU64 BPF_RSH BPF_K))
     (emit_ia32_rsh_i64 dst imm32 dstk &prog)]
    ; dst = dst >> imm (signed)
    [((BPF_ALU64 BPF_ARSH BPF_K))
     (emit_ia32_arsh_i64 dst imm32 dstk &prog)]

    ; dst = dst << src
    [((BPF_ALU64 BPF_LSH BPF_X))
     (emit_ia32_lsh_r64 dst src dstk sstk &prog)]
    ; dst = dst >> src
    [((BPF_ALU64 BPF_RSH BPF_X))
     (emit_ia32_rsh_r64 dst src dstk sstk &prog)]
    ; dst = dst >> src (signed)
    [((BPF_ALU64 BPF_ARSH BPF_X))
     (emit_ia32_arsh_r64 dst src dstk sstk &prog)]

    ; dst = -dst
    [((BPF_ALU BPF_NEG))
     (emit_ia32_alu_i is64 #f (BPF_OP code) (lo dst) (bv 0 32) dstk &prog)
     (when (! verifier_zext)
       (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog))]
    [((BPF_ALU64 BPF_NEG))
     (emit_ia32_neg64 dst dstk &prog)]

    ; dst = dst * src/imm
    [((BPF_ALU64 BPF_MUL BPF_X))
     (emit_ia32_mul_r64 dst src dstk sstk &prog)]
    [((BPF_ALU64 BPF_MUL BPF_K))
     (emit_ia32_mul_i64 dst imm32 dstk &prog)]

    ; dst = htole(dst)
    [((BPF_ALU BPF_END BPF_FROM_LE))
     (emit_ia32_to_le_r64 dst imm32 dstk &prog)]

    ; dst = htobe(dst)
    [((BPF_ALU BPF_END BPF_FROM_BE))
     (emit_ia32_to_be_r64 dst imm32 dstk &prog)]

    ; dst = imm64
    [((BPF_LD BPF_IMM BPF_DW))
     (define hi_val (bpf:insn-imm next-insn))
     (define lo_val imm32)

     (emit_ia32_mov_i (lo dst) lo_val dstk &prog)
     (emit_ia32_mov_i (hi dst) hi_val dstk &prog)]

    ; ST: *(u8*)(dst_reg + off) = imm
    [((BPF_ST BPF_MEM BPF_B)
      (BPF_ST BPF_MEM BPF_H)
      (BPF_ST BPF_MEM BPF_W)
      (BPF_ST BPF_MEM BPF_DW))
     (if dstk
         ; mov eax,dword ptr [ebp+off]
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
         ; mov eax,dst_lo
         (EMIT2 #x8B (add_2reg #xC0 (lo dst) IA32_EAX)))

     (case (BPF_SIZE code)
       [(BPF_B)
        (EMIT #xC6 1)]
       [(BPF_H)
        (EMIT2 #x66 #xC7)]
       [(BPF_W
         BPF_DW)
        (EMIT #xC7 1)])

     (if (is_imm8 off32)
         (EMIT2 (add_1reg #x40 IA32_EAX) (extract 7 0 off))
         (EMIT1_off32 (add_1reg #x80 IA32_EAX) off32))
     (EMIT imm32 (bpf_size_to_x86_bytes (BPF_SIZE code)))

     (when (equal? (BPF_SIZE code) 'BPF_DW)
       (define hi (if (bitvector->bool (bvand imm32 (bv (arithmetic-shift 1 31) 32))) (bv -1 32) (bv 0 32)))
       (EMIT2_off32 #xC7 (add_1reg #x80 IA32_EAX) (bvadd off32 (bv 4 32)))
       (EMIT hi 4))]

    ; STX: *(u8*)(dst_reg + off) = src_reg
    [((BPF_STX BPF_MEM BPF_B)
      (BPF_STX BPF_MEM BPF_H)
      (BPF_STX BPF_MEM BPF_W)
      (BPF_STX BPF_MEM BPF_DW))
     (if dstk
         ; mov eax,dword ptr [ebp+off]
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)))
         ; mov eax,dst_lo
         (EMIT2 #x8B (add_2reg #xC0 (lo dst) IA32_EAX)))

     (if sstk
         ; mov edx,dword ptr [ebp+off]
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR (lo src)))
         ; mov edx,src_lo
         (EMIT2 #x8B (add_2reg #xC0 (lo src) IA32_EDX)))

     (case (BPF_SIZE code)
       [(BPF_B)
        (EMIT #x88 1)]
       [(BPF_H)
        (EMIT2 #x66 #x89)]
       [(BPF_W
         BPF_DW)
        (EMIT #x89 1)])

     (if (is_imm8 off32)
         (EMIT2 (add_2reg #x40 IA32_EAX IA32_EDX) (extract 7 0 off))
         (EMIT1_off32 (add_2reg #x80 IA32_EAX IA32_EDX) off32))

     (when (equal? (BPF_SIZE code) 'BPF_DW)
       (if sstk
           ; mov edi,dword ptr [ebp+off]
           (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR (hi src)))
           ; mov edi,src_hi
           (EMIT2 #x8B (add_2reg #xC0 (hi src) IA32_EDX)))
       (EMIT1 #x89)
       (cond
         [(is_imm8 (bvadd off32 (bv 4 32)))
          (EMIT2 (add_2reg #x40 IA32_EAX IA32_EDX) (bvadd off32 (bv 4 32)))]
         [else
          (EMIT1 (add_2reg #x80 IA32_EAX IA32_EDX))
          (EMIT (bvadd off32 (bv 4 32)) 4)]))]

    ; LDX: dst_reg = *(u8*)(src_reg + off)
    [((BPF_LDX BPF_MEM BPF_B)
      (BPF_LDX BPF_MEM BPF_H)
      (BPF_LDX BPF_MEM BPF_W)
      (BPF_LDX BPF_MEM BPF_DW))
     (if sstk
         ; mov eax,dword ptr [ebp+off]
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX) (STACK_VAR (lo src)))
         ; mov eax,src_lo
         (EMIT2 #x8B (add_2reg #xC0 (lo src) IA32_EAX)))

     (case (BPF_SIZE code)
       [(BPF_B)
        (EMIT2 #x0F #xB6)]
       [(BPF_H)
        (EMIT2 #x0F #xB7)]
       [(BPF_W
         BPF_DW)
        (EMIT #x8B 1)])

     (if (is_imm8 off32)
         (EMIT2 (add_2reg #x40 IA32_EAX IA32_EDX) (extract 7 0 off))
         (EMIT1_off32 (add_2reg #x80 IA32_EAX IA32_EDX) off32))

     (if dstk
         ; mov dword ptr [ebp+off],edx
         (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR (lo dst)))
         ; mov dst_lo,edx
         (EMIT2 #x89 (add_2reg #xC0 (lo dst) IA32_EDX)))

    (case (BPF_SIZE code)
      [(BPF_B
        BPF_H
        BPF_W)
        (cond
          ; BUG: C code inverts this condition: it breaks the case
          ; when verifier_zext is _not_ set.
          [verifier_zext (void)]
          [dstk
            (EMIT3 #xC7 (add_1reg #x40 IA32_EBP) (STACK_VAR (hi dst)))
            (EMIT #x0 4)]
          [else
            ; PATCH: EMIT3(0xC7, add_1reg(0xC0, dst_hi), 0) emits invalid bytes.
            (EMIT2 #x33 (add_2reg #xC0 (hi dst) (hi dst)))])]
      [(BPF_DW)
        (EMIT2_off32 #x8B (add_2reg #x80 IA32_EAX IA32_EDX) (bvadd off32 (bv 4 32)))
        (if dstk
            (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EDX) (STACK_VAR (hi dst)))
            (EMIT2 #x89 (add_2reg #xC0 (hi dst) IA32_EDX)))])]

    [((BPF_JMP BPF_CALL))
      (define r1 (bpf2ia32 BPF_REG_1))
      (define r2 (bpf2ia32 BPF_REG_2))
      (define r3 (bpf2ia32 BPF_REG_3))
      (define r4 (bpf2ia32 BPF_REG_4))
      (define r5 (bpf2ia32 BPF_REG_5))

      (define func (bvadd (extract 31 0 (bpf-jit-call-base))
                          imm32))
      (define jmp_offset (bvsub func (bvadd image (addrs i))))

      ; mov eax,dword ptr [ebp+off]
      (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
             (STACK_VAR (lo r1)))
      ; mov edx,dword ptr [ebp+off]
      (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
             (STACK_VAR (hi r1)))

      (emit_push_r64 r5 &prog)
      (emit_push_r64 r4 &prog)
      (emit_push_r64 r3 &prog)
      (emit_push_r64 r2 &prog)

      (EMIT1_off32 #xE8 (bvadd jmp_offset (bv 9 32)))

      ; mov dword ptr [ebp+off],eax
      (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EAX)
             (STACK_VAR (lo r0)))
      ; mov dword ptr [ebp+off],edx
      (EMIT3 #x89 (add_2reg #x40 IA32_EBP IA32_EDX)
             (STACK_VAR (hi r0)))

      ; add esp,32
      (EMIT3 #x83 (add_1reg #xC0 IA32_ESP) 32)]

    ; cond jump
    [((BPF_JMP BPF_JEQ BPF_X)
      (BPF_JMP BPF_JNE BPF_X)
      (BPF_JMP BPF_JGT BPF_X)
      (BPF_JMP BPF_JLT BPF_X)
      (BPF_JMP BPF_JGE BPF_X)
      (BPF_JMP BPF_JLE BPF_X)
      (BPF_JMP32 BPF_JEQ BPF_X)
      (BPF_JMP32 BPF_JNE BPF_X)
      (BPF_JMP32 BPF_JGT BPF_X)
      (BPF_JMP32 BPF_JLT BPF_X)
      (BPF_JMP32 BPF_JGE BPF_X)
      (BPF_JMP32 BPF_JLE BPF_X)
      (BPF_JMP32 BPF_JSGT BPF_X)
      (BPF_JMP32 BPF_JSLT BPF_X)
      (BPF_JMP32 BPF_JSGE BPF_X)
      (BPF_JMP32 BPF_JSLE BPF_X))
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo (if sstk IA32_ECX (lo src)))
     (define sreg_hi (if sstk IA32_EBX (hi src)))

     (when dstk
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)))
       (when is_jmp64
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
                (STACK_VAR (hi dst)))))

     (when sstk
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX)
              (STACK_VAR (lo src)))
       (when is_jmp64
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EBX)
                (STACK_VAR (hi src)))))

     (when is_jmp64
       ; cmp dreg_hi,sreg_hi
       (EMIT2 #x39 (add_2reg #xC0 dreg_hi sreg_hi))
       (EMIT2 IA32_JNE (bv 2 8)))
     ; cmp dreg_lo,sreg_lo
     (EMIT2 #x39 (add_2reg #xC0 dreg_lo sreg_lo))
     (emit_cond_jmp)]

    [((BPF_JMP BPF_JSGT BPF_X)
      (BPF_JMP BPF_JSLE BPF_X)
      (BPF_JMP BPF_JSLT BPF_X)
      (BPF_JMP BPF_JSGE BPF_X))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo (if sstk IA32_ECX (lo src)))
     (define sreg_hi (if sstk IA32_EBX (hi src)))

     (when dstk
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)))
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
              (STACK_VAR (hi dst))))

     (when sstk
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX)
              (STACK_VAR (lo src)))
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EBX)
              (STACK_VAR (hi src))))

     ; cmp dreg_hi,sreg_hi
     (EMIT2 #x39 (add_2reg #xC0 dreg_hi sreg_hi))
     (EMIT2 IA32_JNE (bv 10 8))
     ; cmp dreg_lo,sreg_lo
     (EMIT2 #x39 (add_2reg #xC0 dreg_lo sreg_lo))
     (emit_cond_jmp_signed)]

    [((BPF_JMP BPF_JSET BPF_X)
      (BPF_JMP32 BPF_JSET BPF_X))
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo IA32_EAX)
     (define dreg_hi IA32_EDX)
     (define sreg_lo (if sstk IA32_ECX (lo src)))
     (define sreg_hi (if sstk IA32_EBX (hi src)))

     ; PATCH: always load dst to a EAX/EDX, rather than directly using
     ; the register (e.g., BPF_AX); otherwise AND destroys its value.
     (cond
       [dstk
        (EMIT3 #x8B (add_2reg #x40 IA32_EBP dreg_lo)
               (STACK_VAR (lo dst)))
        (when is_jmp64
          (EMIT3 #x8B (add_2reg #x40 IA32_EBP dreg_hi)
                 (STACK_VAR (hi dst))))]
       [else
        (EMIT2 #x89 (add_2reg #xC0 dreg_lo (lo dst)))
        (when is_jmp64
          (EMIT2 #x89 (add_2reg #xC0 dreg_hi (hi dst))))])

     (when sstk
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_ECX)
              (STACK_VAR (lo src)))
       (when is_jmp64
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EBX)
                (STACK_VAR (hi src)))))
     ; and dreg_lo,sreg_lo
     (EMIT2 #x23 (add_2reg #xC0 sreg_lo dreg_lo))
     ; PATCH: don't test for high bits for JMP32
     (BUG
       ; and dreg_hi,sreg_hi
       (EMIT2 #x23 (add_2reg #xC0 sreg_hi dreg_hi))
       ; or dreg_lo,dreg_hi
       (EMIT2 #x09 (add_2reg #xC0 dreg_lo dreg_hi)))
     (PATCH
       (when is_jmp64
         ; and dreg_hi,sreg_hi
         (EMIT2 #x23 (add_2reg #xC0 sreg_hi dreg_hi))
         ; or dreg_lo,dreg_hi
         (EMIT2 #x09 (add_2reg #xC0 dreg_lo dreg_hi))))
     (emit_cond_jmp)]

    [((BPF_JMP BPF_JSET BPF_K)
      (BPF_JMP32 BPF_JSET BPF_K))
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo IA32_EAX)
     (define dreg_hi IA32_EDX)
     (define sreg_lo IA32_ECX)
     (define sreg_hi IA32_EBX)

     ; PATCH: always load dst to a EAX/EDX, rather than directly using
     ; the register (e.g., BPF_AX); otherwise AND destroys its value.
     (cond
       [dstk
        (EMIT3 #x8B (add_2reg #x40 IA32_EBP dreg_lo)
               (STACK_VAR (lo dst)))
        (when is_jmp64
          (EMIT3 #x8B (add_2reg #x40 IA32_EBP dreg_hi)
                 (STACK_VAR (hi dst))))]
       [else
        (EMIT2 #x89 (add_2reg #xC0 dreg_lo (lo dst)))
        (when is_jmp64
          (EMIT2 #x89 (add_2reg #xC0 dreg_hi (hi dst))))])

     ; and dreg_lo,imm32
     (EMIT2_off32 #x81 (add_1reg #xE0 dreg_lo) imm32)
     ; For jset32 or jset64 with imm >= 0, it reduces to (dst_lo & imm32).
     ; For jset64 with imm < 0, it reduces to (dst_lo & imm32) || (!!dst_hi).
     (when (&& is_jmp64 (bvslt imm32 (bv 0 32)))
         ; or dreg_lo,dreg_hi
         (EMIT2 #x09 (add_2reg #xC0 dreg_lo dreg_hi)))

     (emit_cond_jmp)]

    [((BPF_JMP BPF_JEQ BPF_K)
      (BPF_JMP BPF_JNE BPF_K)
      (BPF_JMP BPF_JGT BPF_K)
      (BPF_JMP BPF_JLT BPF_K)
      (BPF_JMP BPF_JGE BPF_K)
      (BPF_JMP BPF_JLE BPF_K)
      (BPF_JMP32 BPF_JEQ BPF_K)
      (BPF_JMP32 BPF_JNE BPF_K)
      (BPF_JMP32 BPF_JGT BPF_K)
      (BPF_JMP32 BPF_JLT BPF_K)
      (BPF_JMP32 BPF_JGE BPF_K)
      (BPF_JMP32 BPF_JLE BPF_K)
      (BPF_JMP32 BPF_JSGT BPF_K)
      (BPF_JMP32 BPF_JSLT BPF_K)
      (BPF_JMP32 BPF_JSGE BPF_K)
      (BPF_JMP32 BPF_JSLE BPF_K))
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo IA32_ECX)
     (define sreg_hi IA32_EBX)

     (when dstk
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)))
       (when is_jmp64
         (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
                (STACK_VAR (hi dst)))))

     ; mov ecx,imm32
     (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_ECX) imm32)
     (when is_jmp64
       (define hival (if (! (bvzero? (bvand imm32 (bv (arithmetic-shift 1 31) 32)))) (bv -1 32) (bv 0 32)))
       ; mov ebx,imm32
       (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_EBX) hival)
       ; cmp dreg_hi,sreg_hi
       (EMIT2 #x39 (add_2reg #xC0 dreg_hi sreg_hi))
       (EMIT2 IA32_JNE (bv 2 8)))
     ; cmp dreg_lo,sreg_lo
     (EMIT2 #x39 (add_2reg #xC0 dreg_lo sreg_lo))

     (emit_cond_jmp)]

    [((BPF_JMP BPF_JSGT BPF_K)
      (BPF_JMP BPF_JSLT BPF_K)
      (BPF_JMP BPF_JSGE BPF_K)
      (BPF_JMP BPF_JSLE BPF_K))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo IA32_ECX)
     (define sreg_hi IA32_EBX)

     (when dstk
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)))
       (EMIT3 #x8B (add_2reg #x40 IA32_EBP IA32_EDX)
              (STACK_VAR (hi dst))))

     ; mov ecx,imm32
     (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_ECX) imm32)
     (define hival (if (! (bvzero? (bvand imm32 (bv (arithmetic-shift 1 31) 32)))) (bv -1 32) (bv 0 32)))
     ; mov ebx,imm32
     (EMIT2_off32 #xC7 (add_1reg #xC0 IA32_EBX) hival)
     ; cmp dreg_hi,sreg_hi
     (EMIT2 #x39 (add_2reg #xC0 dreg_hi sreg_hi))
     (EMIT2 IA32_JNE (bv 10 8))
     ; cmp dreg_lo,sreg_lo
     (EMIT2 #x39 (add_2reg #xC0 dreg_lo sreg_lo))

     (emit_cond_jmp_signed)]

    [((BPF_JMP BPF_JA))
     (define jmp_offset
       (if (bveq off32 (bv -1 32))
           (bv -2 32)
           (bvsub (addrs (bvadd i off32))
                  (addrs i))))
     ; Optimize out nop jumps
     (unless (bvzero? jmp_offset)
       (cond
         [(is_imm8 jmp_offset)
          (EMIT2 #xEB (extract 7 0 jmp_offset))]
         [else
          (EMIT1_off32 #xE9 jmp_offset)]))]

    [((BPF_JMP BPF_EXIT))
      (cond
        [(context-seen-exit &prog)
          (define jmp_offset (bvsub (context-cleanup-addr &prog) (addrs i)))
          (cond
            [(is_imm8 jmp_offset)
              (EMIT2 #xEB (extract 7 0 jmp_offset))]
            [else
              (EMIT1_off32 #xE9 jmp_offset)])]
        [else
          (set-context-seen-exit! &prog #t)
          (set-context-cleanup-addr! &prog (context-len &prog))])]
    [else
     (assert #f (format "bpf_jit: unknown opcode ~v" code))]))
