#lang racket/base

(require web-server/templates
         "bpf_jit_comp32.generated.rkt")

(displayln (include-template "bpf_jit_comp32.c.tmpl"))
