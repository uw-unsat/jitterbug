#lang racket/base

(require web-server/templates
         "bpf_jit.generated.c.rkt")

(displayln (include-template "bpf_jit.h.tmpl"))
