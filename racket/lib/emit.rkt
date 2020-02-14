#lang racket

(require (for-syntax racket/string))
(provide (all-defined-out))

(begin-for-syntax
  (define emit-port (make-parameter (if (getenv "EMIT") (current-output-port) #f)))
  ; (emit-port (current-output-port))

  (define (semicolon s)
    (if (or (string-endswith? s "}") (string-endswith? s "*/") (equal? s ""))
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
    (string-append
      "if ("
      (fmt expr)
      ") {\n"
      (string-join
        (for/list [(v lst)]
          (string-append "\t\t\t" (semicolon (fmt v)) "\n")))
      "\t\t}"))

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
           [(comment) (syntax-e (car args))]
           [(cond) (fmt-cond args)]
           [(equal?) (apply format "~a == ~a" (map fmt args))]
           [(when) (apply fmt-when args)]
           [else (format "~a(~a)" op
                         (string-join (map (lambda (v) (format "~a" (fmt v))) args) ", "))]))]
      [else (format "TODO: ~a" e)]))

  (define (string-endswith? s c)
    (if (<= (string-length c) (string-length s))
      (equal? (substring s (- (string-length s) (string-length c))) c)
      #f))

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
