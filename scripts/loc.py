#!/usr/bin/env python3

import subprocess
import json
import os

BASEDIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")


def tokei(paths, *, exclude=[]):

    args = []

    for e in exclude:
        args.extend(["-e", e])
    for p in paths:
        args.append(os.path.join(BASEDIR, p))


    try:
        proc = subprocess.run(
            ["tokei", "-o", "json", *args],
            capture_output=True,
            encoding="utf8",
            check=True,
        )
    except subprocess.CalledProcessError as e:
        print(e.stderr)
        raise e
    return json.loads(proc.stdout)


print("component,lines")


def do_loc(component, language, paths, *, exclude=[]):
    results = tokei(paths, exclude=exclude)
    n = results[language]["code"]
    if language == 'C':
        n += results.get('CHeader', {'code': 0})['code']
    print(f'{component},{n}')


# riscv

do_loc(
    "rv32 Racket impl",
    "Racket",
    ["racket/rv32/bpf_jit_comp32.rkt", "racket/lib/riscv-common.rkt",],
)

do_loc(
    "rv32 Racket invariants",
    "Racket",
    [
        "racket/lib/spec/riscv.rkt",
        "racket/rv32/spec.rkt",
        "racket/rv32/synthesis.rkt",
    ],
)

do_loc(
    "rv32 C implementation",
    "C",
    [
        "arch/riscv/net/bpf_jit_core.c",
        "arch/riscv/net/bpf_jit.h",
        "arch/riscv/net/bpf_jit_comp32.c",
    ],
)


do_loc(
    "rv64 Racket impl",
    "Racket",
    ["racket/rv64/bpf_jit_comp64.rkt", "racket/lib/riscv-common.rkt",],
)

do_loc(
    "rv64 Racket invariants",
    "Racket",
    [
        "racket/lib/spec/riscv.rkt",
        "racket/rv64/spec.rkt",
        "racket/rv64/synthesis.rkt",
    ],
)

do_loc(
    "rv64 C implementation",
    "C",
    [
        "arch/riscv/net/bpf_jit_core.c",
        "arch/riscv/net/bpf_jit.h",
        "arch/riscv/net/bpf_jit_comp64.c",
    ],
)

do_loc(
    "riscv interpreter", "Racket", ["serval/serval/riscv/"],
)


do_loc("arm32 Racket impl", "Racket", ["racket/arm32/bpf_jit_comp.rkt",])

do_loc("arm32 Racket invariants", "Racket", ["racket/arm32/spec.rkt",])


do_loc(
    "arm32 C implementation", "C", ["arch/arm/"],
)


do_loc(
    "arm32 interpreter", "Racket", ["serval/serval/arm32/", "serval/serval/arm32.rkt",]
)

do_loc(
    "arm64 Racket impl",
    "Racket",
    [
        "racket/arm64/bpf_jit_comp.rkt",
        "racket/arm64/bpf_jit.rkt",
        "racket/arm64/insn.rkt",
    ],
)

do_loc("arm64 Racket invariants", "Racket", ["racket/arm64/spec.rkt",])

do_loc(
    "arm64 C implementation", "C", ["arch/arm64/net/"],
)

do_loc(
    "arm64 interpreter", "Racket", ["serval/serval/arm64/", "serval/serval/arm64.rkt",]
)


# x86

do_loc(
    "x86_32 Racket impl", "Racket", ["racket/x86_32/bpf_jit_comp32.rkt"],
)

do_loc(
    "x86_32 Racket invariants", "Racket", ["racket/x86_32/spec.rkt"],
)


do_loc("x86_32 C implementation", "C", ["arch/x86/net/bpf_jit_comp32.c"])

do_loc(
    "x86_64 Racket impl", "Racket", ["racket/x86_64/bpf_jit_comp.rkt"],
)

do_loc(
    "x86_64 Racket invariants", "Racket", ["racket/x86_64/spec.rkt"],
)

do_loc("x86_64 C implementation", "C", ["arch/x86/net/bpf_jit_comp.c"])

do_loc("x86 interpreter", "Racket", ["serval/serval/x86/", "serval/serval/x86.rkt"])


# Lib

do_loc(
    "Absynthe library",
    "Racket",
    [
        "racket/lib/bvaxiom.rkt",
        "racket/lib/extraction/",
        "racket/lib/env.rkt",
        "racket/lib/hybrid-memory.rkt",
        "racket/lib/linux.rkt",
        "racket/lib/spec/bpf.rkt",
        "racket/lib/tests.rkt",
        "serval/serval/lib/bvarith.rkt",
        "serval/serval/lib/core.rkt",
        "serval/serval/lib/debug.rkt",
        "serval/serval/lib/memmgr.rkt",
        "serval/serval/lib/memory/manager.rkt",
        "serval/serval/lib/solver.rkt",
        "serval/serval/lib/unittest.rkt",
    ],
)

do_loc(
    "Racket BPF interpreter",
    "Racket",
    ["serval/serval/bpf.rkt"],
)
