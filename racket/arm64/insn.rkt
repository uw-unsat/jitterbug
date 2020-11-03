#lang rosette

; This file is translated and adapted from arch/arm64/kernel/insn.c,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0-only
;
; Copyright (C) 2013 Huawei Ltd.
; Author: Jiang Liu <liuj97@gmail.com>
;
; Copyright (C) 2014-2016 Zi Shen Lim <zlim.lnx@gmail.com>

(require
  "../common.rkt"
  (prefix-in core: serval/lib/core))

(provide
  AARCH64_BREAK_FAULT
  encode-addsub-immediate
  encode-logical-immediate)


(define AARCH64_BREAK_FAULT #f)

(define (BIT n)
  (core:bug-on (bvuge n (bv 64 64)) #:msg "BIT: shifting amount too large")
  (bvshl (bv 1 64) n))

(define SZ_4K (bv 4096 32))

(define (hweight64 w)
  (apply bvadd (map (lambda (x) (zero-extend x (bitvector 32))) (bitvector->bits w))))

(define (range_of_ones val)
  ; Doesn't handle full ones or full zeroes
  (define sval (bvlshr val (__ffs64 val)))
  ; One of Sean Eron Anderson's bithack tricks
  (bvzero? (bvand (bvadd1 sval) sval)))

(define (upper_32_bits n)
  (extract 63 32 n))


; imm: int
(define (encode-addsub-immediate imm sf)
  (define (out)
    (core:bug #:msg (format "encode-addsub-immediate: invalid immediate encoding: ~a" imm)))

  ; We can't encode more than a 24bit value (12bit + 12bit shift)
  ; imm & ~(BIT(24) - 1)
  (when (bitvector->bool (bvand (sign-extend imm (bitvector 64)) (bvnot (bvsub1 (BIT (bv 24 64))))))
    (out))

  (cond
    ; If we have something in the top 12 bits...
    [(bitvector->bool (bvand imm (bvnot (bvsub1 SZ_4K))))
     ; ... and in the low 12 bits -> error
     (when (bitvector->bool (bvand imm (bvsub1 SZ_4K)))
       (out))
     (list (bv #b1 1) (extract 23 12 imm))]
    [else
     (list (bv #b0 1) (extract 11 0 imm))]))


; imm: u64
(define (encode-logical-immediate imm sf)

  (define esz (if (bitvector->bool sf) (bv 64 32) (bv 32 32)))

  ; PATCH: the old code sets the default mask value to ~0ULL, even for
  ; a 32-bit immediate.  This will cause a problem later in the branch
  ; "imm |= ~mask", when the immdiate is in the form 0..01..10..01..1:
  ; the high bits are not properly set, causing the encoding to fail.
  (define mask (GENMASK (zero-extend (bvsub1 esz) (bitvector 64)) (bv 0 64)))

  (cond
    ; Can't encode full zeroes or full ones
    [(|| (! (bvzero? (bvand imm (bvnot mask))))
         (bvzero? imm)
         (equal? imm mask))
     AARCH64_BREAK_FAULT]
    [else
     ; Inverse of Replicate(). Try to spot a repeating pattern
     ; with a pow2 stride.
     (define tmp (bvudiv esz (bv 2 32)))
     (define (loop)
       (when (bvuge tmp (bv 2 32))
         (define emask (bvsub1 (BIT (zero-extend tmp (bitvector 64)))))
         (unless (! (equal? (bvand imm emask)
                            (bvand (bvlshr imm (zero-extend tmp (bitvector 64))) emask)))
           (set! esz tmp)
           (set! mask emask)
           (set! tmp (bvudiv tmp (bv 2 32)))
           (loop))))
     (loop)

     ; N is only set if we're encoding a 64bit value
     (define n (bool->bitvector (equal? esz (bv 64 32))))

     ; Trim imm to the element size
     (set! imm (bvand imm mask))

     ; That's how many ones we need to encode
     (define ones (hweight64 imm))

     ; imms is set to (ones - 1), prefixed with a string of ones
     ; and a zero if they fit. Cap it to 6 bits.
     (define imms (bvsub1 ones))
     (set! imms (bvor imms (bvshl (bv #xf 32) (ffs esz))))
     (set! imms (bvand imms (extract 31 0 (bvsub1 (BIT (bv 6 64))))))

     (define ror #f)
     ; Compute the rotation
     (cond
       [(range_of_ones imm)
        ; Pattern: 0..01..10..0
        ;
        ; Compute how many rotate we need to align it right
        (set! ror (extract 31 0 (__ffs64 imm)))]
       [else
        ; Pattern: 0..01..10..01..1
        ;
        ; Fill the unused top bits with ones, and check if
        ; the result is a valid immediate (all ones with a
        ; contiguous ranges of zeroes).
        (set! imm (bvor imm (bvnot mask)))
        (when (range_of_ones (bvnot imm))
          ; Compute the rotation to get a continuous set of
          ; ones, with the first bit set at position 0
          (set! ror (fls (bvnot imm))))])

    (if ror
        ; immr is the number of bits we need to rotate back to the
        ; original set of ones. Note that this is relative to the
        ; element size...
        (let ([immr (bvurem (bvsub esz ror) esz)])
          (list n (extract 5 0 immr) (extract 5 0 imms)))
        AARCH64_BREAK_FAULT)]))
