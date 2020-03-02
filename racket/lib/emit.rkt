#lang rosette

(require (for-syntax racket/string))
(provide (all-defined-out))

(begin-for-syntax
  (define emit-port (make-parameter (if (getenv "EMIT") (current-output-port) #f)))
  ; (emit-port (current-output-port))

  (define (semicolon s)
    (if (or (string-suffix? s "}") (string-suffix? s "*/") (equal? s ""))
        s
        (string-append s ";")))

  (define (fmt-cond lst)
    (string-join #:after-last "\t\t}"
      (for/list [(l lst) (i (in-range (length lst)))]
       (define e (syntax-e l))
       (define c (fmt (car e)))
       (define hd
         (case c
           [(else) "\t\t} else {\n"]
           [else (format "~a (~a) {\n" (if (zero? i) "if" "\t\t} else if") c)]))
       (define tl
         (for/list [(v (cdr e))]
           (string-append "\t\t\t" (semicolon (fmt v)) "\n")))
       (string-join (cons hd tl)))))

  (define (fmt-when expr . lst)
    (define single? (= 1 (length lst)))
    (define head (string-append "if (" (fmt expr) ")"))
    (if single?
      (string-append
        head
        "\n\t\t\t"
        (fmt (car lst)))
      (string-append
        head
        " {\n"
        (string-join (map (lambda (x) (string-append "\t\t\t" (semicolon (fmt x)) "\n")) lst))
        "\t\t}")))

  (define (fmt stx)
    (define e (syntax-e stx))
    (cond
      [(or (integer? e) (symbol? e))
       e]
      [(and (pair? e) (list? (cdr e)))
       (let [(op (fmt (car e)))
             (args (cdr e))]
         (case op
           [(bv) (fmt (car args))]
           [(bvneg) (apply format "-~a" (map fmt args))]
           [(bvsge bvuge) (apply format "~a >= ~a" (map fmt args))]
           [(bvsgt bvugt) (apply format "~a > ~a" (map fmt args))]
           [(bvslt bvult) (apply format "~a < ~a" (map fmt args))]
           [(bvsub) (apply format "~a - ~a" (map fmt args))]
           [(bvor) (apply format "~a | ~a" (map fmt args))]
           [(comment) (syntax-e (car args))]
           [(cond) (fmt-cond args)]
           [(equal?) (apply format "~a == ~a" (map fmt args))]
           [(when) (apply fmt-when args)]
           [(0x) (let ([stx (cadr e)])
                   (string-append "0x" (~a (fmt stx) #:align 'right #:width (syntax-span stx) #:pad-string "0")))]
           [else (format "~a(~a)" op
                         (string-join (map (lambda (v) (format "~a" (fmt v))) args) ", "))]))]
      [else (format "TODO: ~a" e)]))

  (define (emit . vs)
    (define port (emit-port))
    (define n (length vs))
    (fprintf port "\t")
    (for [(v vs)]
      (fprintf port "~a" (if (syntax? v) (fmt v) v)))
    (fprintf port "\n"))

  (define (emit-prologue id)
    (fprintf (emit-port) "(define ~a #<<EOD\n" (syntax->datum id)))

  (define (emit-epilogue)
    (fprintf (emit-port) "EOD\n)\n\n"))

  (define (emit-switch expr vals handlers)
    (emit "switch (" expr ") {")
    (for [(v (syntax->list vals))
          (h (syntax->list handlers))]
      (emit "case " v ":")
      (for ([stmt (syntax->list h)])
        (emit "\t" (semicolon (fmt stmt))))
      (emit "\tbreak;"))
    (emit "}")))

(define-syntax (begin/c stx)
  (syntax-case stx ()
    [(_ #:id id expr ...)
      (begin
        (when (emit-port)
          (emit-prologue #'id)
          (for ([e (syntax->list #'(expr ...))])
            (emit (semicolon (fmt e))))
          (emit-epilogue))
        (syntax/loc stx (begin expr ...)))]))

(define-syntax (switch stx)
  (syntax-case stx ()
    [(_ expr #:id id [(val) handler ...] ...)
     (begin
      (when (emit-port)
        (emit-prologue #'id)
        (emit-switch #'expr #'(val ...) #'((handler ...) ...))
        (emit-epilogue))
      (syntax/loc stx
        (case expr
          [(val) handler ...]
          ...)))]))

(define-syntax (0x stx)
  (syntax-case stx ()
    [(_ arg)
     (syntax/loc stx
       (string->number (~a (syntax->datum #'arg)) 16))]))

(define-syntax (define-rvenc stx)
  (syntax-case stx ()
    [(_ (id args ...) expr)
      (let ([port (emit-port)])
        (when port
          (define (fmt-arg x)
            (define s (~a (syntax->datum x)))
            (define lst (regexp-match #px"imm(\\d+)_(\\d+)" s))
            (match lst
              [(list _ hi lo)
               (let ([n (- (add1 (string->number hi)) (string->number lo))])
                 (define size
                   (cond
                     [(> n 16) 32]
                     [(> n 8) 16]
                     [else 8]))
                 (format "u~a ~a" size s))]
              [_ (format "u8 ~a" s)]))
          (emit-prologue #'id)
          (fprintf port "static inline u32 ~a(~a)\n{\n\treturn ~a;\n}\n"
            (syntax->datum #'id)
            (string-join (map fmt-arg (syntax->list #'(args ...))) ", ")
            (fmt #'expr))
          (emit-epilogue))
        (syntax/loc stx
          (define (id args ...) expr)))]))
