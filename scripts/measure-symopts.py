#!/usr/bin/env python3

import subprocess
import time
import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--verbose", action="store_true")
args = parser.parse_args()
verbose = args.verbose

NULL = open(os.devnull, "wb")


def time_command(args, env):
    before = time.time()
    result = subprocess.run(args, env=env, stdout=None if verbose else NULL)
    after = time.time()
    assert result.returncode == 0
    return after - before


def run_rv32_add64_x(opt):
    env = dict(os.environ, ENABLE_JIT_SPLIT_REGS=str(not opt))
    return time_command(
        ["raco", "test", "--", "racket/bench/rv32-lsh64-x.rkt"], env
    )


# Time first optimization
print("riscv32 BPF_ALU64 BPF_LSH_X:")
f = run_rv32_add64_x(False)
print(f"  With splitting registers: {f:.2f}s")
t = run_rv32_add64_x(True)
print(f"  Without splitting registers: {t:.2f}s")
s = f / t
print(f"  Speedup: {s:.2f}x")


def run_rv32_stxdw(opt):
    env = dict(os.environ, ENABLE_STACK_ADDR_SYMOPT=str(opt))
    return time_command(["raco", "test", "--", "racket/bench/rv32-stxdw.rkt"], env)


print("riscv32 BPF_STX BPF_MEM BPF_DW:")
f = run_rv32_stxdw(False)
print(f"  Without optimization: {f:.2f}s")
t = run_rv32_stxdw(True)
print(f"  With optimiation: {t:.2f}s")
s = f / t
print(f"  Speedup: {s:.2f}x")
