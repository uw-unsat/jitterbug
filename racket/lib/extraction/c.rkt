#lang rosette

(require
  (for-syntax racket/string))

(provide
  (all-defined-out)
  (for-syntax emit-infer-type))


(define (comment . lines)
  (void))

(define (blank)
  (void))

(define (@ a i)
  (a i))

(define (_int x)
  (bv x 32))

(define (sizeof x)
  (case x
    [(u32) 4]
    [else (error "unknown sizeof" x)]))

(define (pr_err . args)
  (void))

(begin-for-syntax
  (define emit-port (make-parameter (if (getenv "EMIT") (current-output-port) (open-output-nowhere))))
  ; infer C types from a given expression
  (define emit-infer-type (make-parameter (lambda (stx) #f)))

  (define (semicolon s)
    (if (or (string-suffix? s "}") (string-suffix? s "*/") (equal? s "") (string-suffix? s "\n"))
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

  (define (fmt-case expr . cases)
    (string-join #:after-last "\t\t}"
      (append
        (list (format "switch (~a) {\n" (syntax-e expr)))
        (for/list ([c cases])
          (define e (syntax-e c))
          (define val (syntax->datum (car e)))
          (define lst (cdr e))
          (define case-val (if (list? val) (format "case ~a" (fmt (datum->syntax #f (car val)))) val))
          (define case-stmt (string-join (map (lambda (x) (string-append "\t\t\t" (semicolon (fmt x)) "\n")) lst)))
          (define return? (equal? (syntax-e (car (syntax-e (last lst)))) 'error))
          (format "\t\t~a:\n ~a~a"
            case-val
            case-stmt
            (if return? "" "\t\t\tbreak;\n"))))))

  (define (fmt-var lst)
    (define vars
      (for/list [(e lst)]
        (define id (first e))
        (define expr (second e))
        (define type ((emit-infer-type) expr))
        (when (not (string? type))
          (error (format "unknown type: ~e" e)))
        (define space (if (string-suffix? type "*") "" " "))
        (format "~a~a~a = ~a;\n" type space (fmt id) (fmt expr))))
    (string-join vars "\t"))

  (define (syntax->compound-assignment stx)
    (define op (syntax-e stx))
    (case op
      [(bvadd) '+=]
      [else (error "unknown compound assignment" op)]))

  (define (fmt stx)
    (define e (syntax-e stx))
    (cond
      [(or (integer? e) (symbol? e) (string? e))
       e]
      [(and (pair? e) (list? (cdr e)))
       (let [(op (fmt (car e)))
             (args (cdr e))]
         (case op
           [(quote) (apply format "~a" (map fmt args))]
           [(error) (apply format "return ~a" (map fmt args))]
           [(blank) ""]
           [(bv sign-extend) (fmt (car args))]
           [(bvneg) (apply format "-~a" (map fmt args))]
           [(bvsge bvuge) (apply format "~a >= ~a" (map fmt args))]
           [(bvsgt bvugt) (apply format "~a > ~a" (map fmt args))]
           [(bvslt bvult) (apply format "~a < ~a" (map fmt args))]
           [(bvsub) (apply format "~a - ~a" (map fmt args))]
           [(bvmul) (apply format "~a * ~a" (map fmt args))]
           [(bvor) (apply format "~a | ~a" (map fmt args))]
           [(comment) (string-join (map fmt args) "\n\t")]
           [(case) (apply fmt-case args)]
           [(cond) (fmt-cond args)]
           [(if) (apply format "if (~a)\n\t\t\t~a;\n\t\telse\n\t\t\t~a" (map fmt args))]
           [(equal?) (apply format "~a == ~a" (map fmt args))]
           [(set!) (apply format "~a = ~a" (map fmt args))]
           [(setf!) (format "~a ~a ~a" (fmt (second args)) (syntax->compound-assignment (first args)) (fmt (third args)))]
           [(switch) (apply fmt-case args)]
           [(switch=) (apply fmt-case args)]
           [(var) (fmt-var (map syntax-e args))]
           [(when) (apply fmt-when args)]
           [(0x) (let ([stx (cadr e)])
                   (string-append "0x" (~a (fmt stx) #:align 'right #:width (syntax-span stx) #:pad-string "0")))]
           [(_int) (apply format "~a" (map fmt args))]
           [(@) (apply format "~a[~a]" (map fmt args))]
           [(set-field!)
             (apply (lambda (name st field val) (format "~a->~a = ~a" st field val)) (map fmt args))]
           [(->prog->aux->stack_depth
             ->prog->aux->verifier_zext
             ->stack_size) (format "~a~a" (fmt (first args)) op)]
           [(!) (apply format "!~a" (map fmt args))]
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
        (emit-prologue #'id)
        (define-values (lst last) (split-at-right (syntax->list #'(expr ...)) 1))
        (for ([e lst])
          (emit (semicolon (fmt e))))
        ; insert return for the last expression
        (let* ([e (car last)]
               [return? (or (integer? (syntax-e e)) (symbol? (syntax-e e)))])
          (emit (semicolon (format (if return? "return ~a" "~a") (fmt e)))))
        (emit-epilogue)
        (syntax/loc stx (begin expr ...)))]))

(define-syntax (set-field! stx)
  (syntax-case stx ()
    [(_ structname structval field value)
     (begin
       (with-syntax
           ([setter
             (datum->syntax
              stx
              (string->symbol
               (string-append "set-"
                              (symbol->string (syntax->datum #'structname))
                              "-"
                              (symbol->string (syntax->datum #'field))
                              "!")))])
         (syntax/loc stx (setter structval value))))]))

(define-syntax (switch stx)
  (syntax-case stx ()
    [(_ expr #:id id [(val) handler ...] ...)
     (begin
      (emit-prologue #'id)
      (emit-switch #'expr #'(val ...) #'((handler ...) ...))
      (emit-epilogue)
      (syntax/loc stx
        (case expr
          [(val) handler ...]
          ...)))]
    [(_ expr [(val) handler ...] ...)
      (syntax/loc stx
        (case expr
          [(val) handler ...]
          ...))]))

(define-syntax (switch= stx)
  (syntax-case stx ()
    [(_ expr [(val) handler ...] ... [default default-handler ...])
     #'(let [(tmp expr)]
         (cond
           [(equal? expr val) handler ...]
           ...
           [else default-handler ...]))]))

(define-syntax (var stx)
  (syntax-case stx ()
    [(_ [id expr] ...)
     #'(begin
         (define id expr) ...)]))

(define-syntax (func stx)
  (syntax-case stx ()
    [(_ (id arg ...) body ...)
     #'(define (id arg ...)
         (begin/c #:id id body ...))]))

(define-syntax (0x stx)
  (syntax-case stx ()
    [(_ arg)
     (syntax/loc stx
       (string->number (~a (syntax->datum #'arg)) 16))]))

(define-syntax (setf! stx)
  (syntax-case stx ()
    [(_ proc x val)
     #'(set! x (proc x val))]))

(define-syntax (define-rvenc stx)
  (syntax-case stx ()
    [(_ (id args ...) expr)
      (let ([port (emit-port)])
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
        (define (id args ...) expr))]))

(define-syntax (define-rvenc/16 stx)
  (syntax-case stx ()
    [(_ (id args ...) expr)
      (let ([port (emit-port)])
        (define (fmt-arg x)
          (define s (~a (syntax->datum x)))
          (define lst (regexp-match #px"imm(\\d+)" s))
          (match lst
            [(list _ width)
             (define size 32)
             (format "u~a ~a" size s)]
            [_ (format "u8 ~a" s)]))
        (emit-prologue #'id)
        (fprintf port "static inline u16 ~a(~a)\n{\n\treturn ~a;\n}\n"
          (syntax->datum #'id)
          (string-join (map fmt-arg (syntax->list #'(args ...))) ", ")
          (fmt #'expr))
        (emit-epilogue))
      (syntax/loc stx
        (define (id args ...) expr))]))
