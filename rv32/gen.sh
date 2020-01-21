#!/bin/sh

echo "#lang racket/base\n\n(provide (all-defined-out))\n" > generated.rkt
EMIT=1 racket bpf_jit_comp32.rkt >> generated.rkt

racket gen.rkt | unexpand > bpf_jit_comp32.c
