#lang rosette

(require (prefix-in core: serval/lib/core)
         "env.rkt")

(provide make-hybrid-memmgr copy-hybrid-memmgr hybrid-memmgr-stackbase hybrid-memmgr-stacksize
         stack-addr? heap-addr? hybrid-memmgr-trace-equal? enable-stack-addr-symopt
         set-hybrid-memmgr-bpf-stack-range! hybrid-memmgr-trace-event!
         set-hybrid-memmgr-stacksize! (struct-out call-event)
         hybrid-memmgr-get-fresh-bytes)

(define enable-stack-addr-symopt (make-environment-flag "ENABLE_STACK_ADDR_SYMOPT" #f))

(struct load-event (addr size result) #:transparent)
(struct store-event (addr size value) #:transparent)
(struct call-event (fn result arg1 arg2 arg3 arg4 arg5) #:transparent)
(struct atomic-begin-event () #:transparent)
(struct atomic-end-event () #:transparent)

(define (make-address memmgr addr off size)
  (core:bug-on (! (equal? (core:bv-size addr) (core:bv-size off)))
               #:msg (format "make-address: addr and off must be same bv-size: ~v ~v" addr off))
  (core:bug-on (! (equal? (core:bv-size addr) (core:bv-size size)))
               #:msg (format "make-address: addr and size must be same bv-size: ~v ~v" addr size))
  (define address (bvadd addr off))
  (define bitwidth (hybrid-memmgr-bitwidth memmgr))
  (core:bug-on (! (equal? (core:bv-size address) bitwidth))
               #:msg (format "make-address: addr+off must be bitwidth of memmgr ~v" address))
  address)

; Add an event to the trace log
(define (hybrid-memmgr-trace-event! memmgr event)
  (set-hybrid-memmgr-trace! memmgr (cons event (hybrid-memmgr-trace memmgr))))

; Generate events for the trace. If the access is larger than the bitwidth of the memmgr,
; break it down into N / B separate events, where N is number of bytes of the access and B
; is the number of bytes per word of the memmgr. The order of events starts with lowest address
; (least significant bytes).
(define (breakdown-trace-event address N bitwidth value event)
  (define B (/ bitwidth 8))
  (core:bug-on (&& (> N B) (! (= 0 (remainder N B))))
               #:msg (format "breakdown-trace-event: Large memory access must be multiple of bitwidth: N=~v B=~v" N B))
  (if (> N B)
    (for ([i (in-range (/ N B))])
      (event (bvadd address (bv (* i B) bitwidth))
             B
             (extract (- (* (+ i 1) bitwidth) 1) (* i bitwidth) value)))
    (event address N value)))

; Tell if a stack access (address, size) is in bounds on the stack.
; First use symbolic optimization stack-addr? to see where to dispatch access,
; but check that anything we consider a stack access is in fact in bounds.
; We also block out the region corresponding to the BPF stack.
(define (stack-addr? memmgr address size)
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define stacksize (hybrid-memmgr-stacksize memmgr))
  (define bpf-stack-range (hybrid-memmgr-bpf-stack-range memmgr))
  (&& (! (bvzero? stacksize))
      (bvule (bvadd address size) stackbase)
      (bvuge address (bvsub stackbase stacksize))
      (|| (bvuge address (bvadd stackbase (cdr bpf-stack-range)))
          (bvule (bvadd address size) (bvadd stackbase (car bpf-stack-range))))))

; Tells if an address is contained entirely _not_ on the stack.
; This is not the negation of stack-addr? as it does not count accesses
; which are partially on the stack.
; We also count accesses to the BPF stack as going to the heap.
(define (heap-addr? memmgr address size)
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define stacksize (hybrid-memmgr-stacksize memmgr))
  (define bpf-stack-range (hybrid-memmgr-bpf-stack-range memmgr))
  (|| (bvzero? stacksize)
      (bvule (bvadd address size) (bvsub stackbase stacksize))
      (bvuge address stackbase)
      (&& (bvuge address (bvadd stackbase (car bpf-stack-range)))
          (bvule (bvadd address size) (bvadd stackbase (cdr bpf-stack-range))))))

; This should return true if an address is definitely on the stack based on
; its structure alone. This is used as a symbolic optimization to avoid sending
; stack addrs to the heap and vice versa, which the solver will have to untangle down the line.
; The disadvantage is that if you use an address which _is_ on the stack that this function
; doesn't recognize, verification will fail as the symbolic optimization is not sound.
(define (stack-addr-symopt? memmgr address size)
  ; Recognize a derived address from stackbase.  We don't need to trust this part,
  ; as we emit checks to ensure that address is within a range from stackbase.
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (for/all ([address address #:exhaustive])
    (match address
      [(? (lambda (x) (eqv? x stackbase))) #t]
      [(expression (== bvadd) x y) (or (stack-addr-symopt? memmgr x size)
                                       (stack-addr-symopt? memmgr y size))]
      [(expression (== extract) _ _ x) (stack-addr-symopt? memmgr x size)]
      [(expression (== sign-extend) x _) (stack-addr-symopt? memmgr x size)]
      [(expression (== zero-extend) x _) (stack-addr-symopt? memmgr x size)]
      [_ #f])))

(define (hybrid-memmgr-stack-store! memmgr addr off data size)
  (define N (bitvector->natural size))
  (define bitwidth (hybrid-memmgr-bitwidth memmgr))
  (define address (make-address memmgr addr off size))
  (core:bug-on (! (= (* N 8) bitwidth))
               #:msg "hybrid-memmgr: accesses to stack must be size of bitwidth")
  (core:bug-on (! (= bitwidth (core:bv-size data)))
               #:msg "hybrid-memmgr-store!: data must be size of bitwidth")
  (core:bug-on (! (core:bvaligned? (bvadd addr off) size))
               #:msg "hybrid-memmgr: stack addrs must be aligned")

  (define oldf (hybrid-memmgr-stack memmgr))
  (define newf (lambda (p) (if (equal? p address) data (oldf p))))
  (set-hybrid-memmgr-stack! memmgr newf))

(define (hybrid-memmgr-store! memmgr addr off data size)
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define address (make-address memmgr addr off size))

  (cond
    [(and (enable-stack-addr-symopt) (stack-addr-symopt? memmgr address size))
      (core:bug-assert (stack-addr? memmgr address size)
                  #:msg "stack-addr-symopt? Must return #t only for actual stack addresses")
      (hybrid-memmgr-stack-store! memmgr addr off data size)]

    [(and (not (enable-stack-addr-symopt)) (stack-addr? memmgr address size))
      (hybrid-memmgr-stack-store! memmgr addr off data size)]

    [(heap-addr? memmgr address size) ; To the rest of memory

      (define bitwidth (hybrid-memmgr-bitwidth memmgr))
      (define N (bitvector->natural size)) ; Number of bytes to store

      (core:bug-on (! (equal? (* 8 N) (core:bv-size data)))
                   #:msg "hybrid-memmgr-store!: bitwidth of data must be 8*size")

      ; Discard data as we don't assume what the rest of memory returns upon load.
      ; Generate trace of stores.
      (breakdown-trace-event address N bitwidth data
                             (lambda e (hybrid-memmgr-trace-event! memmgr (apply store-event e))))]
    [else (core:bug #:msg "hybrid-memmgr-load: address cannot overlap stack+heap")]))

(define (hybrid-memmgr-stack-load memmgr addr off size)
  (define N (bitvector->natural size))
  (define bitwidth (hybrid-memmgr-bitwidth memmgr))
  (define address (make-address memmgr addr off size))
  (core:bug-on (! (= (* N 8) bitwidth))
               #:msg "hybrid-memmgr: accesses to stack must be size of bitwidth")
  (core:bug-on (! (core:bvaligned? (bvadd addr off) size))
               #:msg "hybrid-memmgr: stack addrs must be aligned")
  ((hybrid-memmgr-stack memmgr) address))

(define (hybrid-memmgr-get-fresh-bytes memmgr N)
  ; Assuming there are enough bytes in memory.
  (define-values (data rest) (split-at (hybrid-memmgr-memory memmgr) N))
  ; Update memory.
  (set-hybrid-memmgr-memory! memmgr rest)
  data)

(define (hybrid-memmgr-load memmgr addr off size)
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define address (make-address memmgr addr off size))

  (cond
    [(and (enable-stack-addr-symopt) (stack-addr-symopt? memmgr address size))
      (core:bug-assert (stack-addr? memmgr address size)
              #:msg "stack-addr-symopt? Must return #t only for actual stack addresses")
      (hybrid-memmgr-stack-load memmgr addr off size)]

    [(and (not (enable-stack-addr-symopt)) (stack-addr? memmgr address size))
      (hybrid-memmgr-stack-load memmgr addr off size)]

    [(heap-addr? memmgr address size) ; To the rest of memory

      (define bitwidth (hybrid-memmgr-bitwidth memmgr))

      ; Perform the load, simply returning bytes seeded in memory.
      (define N (bitvector->natural size))
      (define data (hybrid-memmgr-get-fresh-bytes memmgr N))
      (define value (core:list->bitvector/le data))

      ; Generate trace of loads.
      (breakdown-trace-event address N bitwidth value
                             (lambda e (hybrid-memmgr-trace-event! memmgr (apply load-event e))))

      value]
    [else (core:bug #:msg "hybrid-memmgr-load: address cannot overlap stack+heap")]))

(define (make-hybrid-memmgr bitwidth size stacksize #:bpf-stack-range [bpf-stack-range #f])

  ; Initially empty trace
  (define trace (list))

  ; Symbolic stack base and stack memory
  (define-symbolic* stackbase (bitvector bitwidth))
  (define-symbolic* stack (~> (bitvector bitwidth) (bitvector bitwidth)))

  (when (false? bpf-stack-range)
    (set! bpf-stack-range (cons (bv 0 bitwidth) (bv 0 bitwidth))))

  ; The rest of memory is a list of symbolic bv8 bytes
  (define memory (build-list size (lambda (x) (core:make-bv8))))

  (hybrid-memmgr stackbase stacksize bpf-stack-range stack trace memory bitwidth))

(define (hybrid-memory-atomic-begin memmgr)
  (hybrid-memmgr-trace-event! memmgr (atomic-begin-event)))

(define (hybrid-memory-atomic-end memmgr)
  (hybrid-memmgr-trace-event! memmgr (atomic-end-event)))

(define (hybrid-memmgr-invariants memmgr)
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define stacksize (hybrid-memmgr-stacksize memmgr))
  (define bitwidth (hybrid-memmgr-bitwidth memmgr))
  (&& (core:bvaligned? stackbase (bv (/ bitwidth 8) bitwidth))
      (bvuge stackbase stacksize)))

(define (copy-hybrid-memmgr memmgr)
  (struct-copy hybrid-memmgr memmgr))

(define (hybrid-memmgr-trace-equal? m1 m2)
  (equal? (hybrid-memmgr-trace m1) (hybrid-memmgr-trace m2)))

(struct hybrid-memmgr
        (stackbase stacksize bpf-stack-range stack trace memory bitwidth)
        #:transparent #:mutable

  #:methods core:gen:memmgr [
    (define memmgr-load hybrid-memmgr-load)
    (define memmgr-store! hybrid-memmgr-store!)
    (define memmgr-invariants hybrid-memmgr-invariants)
    (define memmgr-atomic-begin hybrid-memory-atomic-begin)
    (define memmgr-atomic-end hybrid-memory-atomic-end)
    (define (memmgr-bitwidth m) (hybrid-memmgr-bitwidth m))
  ])
