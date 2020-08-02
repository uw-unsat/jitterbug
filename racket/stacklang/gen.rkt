#lang racket/base

(require web-server/templates
         "jit.generated.c.rkt")

(displayln (include-template "jit.c.tmpl"))
