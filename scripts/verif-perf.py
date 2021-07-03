#!/usr/bin/env python3

import argparse
import csv
import glob
import subprocess
import sys
import time
import re

parser = argparse.ArgumentParser()
parser.add_argument("--debug", action="store_true")
parser.add_argument("--dry-run", action="store_true")
parser.add_argument("output", type=argparse.FileType('w'))
args = parser.parse_args()

debug = args.debug
output = args.output
dry_run = args.dry_run

outfile = output

architectures = [
    "rv64",
    "rv32",
    "arm64",
    "arm32",
    "x86_64",
    "x86_32",
]

time_re = re.compile(r"\[       OK \] \"VERIFY \((.+)\)\" \((.+)ms cpu\) \((.+)ms real\) \((.+) terms\)")


def get_proc_one_architecture(arch):
    cmd = "echo" if dry_run else "make"
    args = ["RACO_JOBS=1", f"verify-{arch}"]
    return subprocess.run([cmd, *args], capture_output=True, encoding="utf8", check=True)


def run(arch):
    if debug:
        print(f"DEBUG: Running {arch}")
    proc = get_proc_one_architecture(arch)

    for line in proc.stdout.splitlines():
        match = re.match(time_re, line)
        if match:
            instr = match.group(1)
            cputime = match.group(2)
            realtime = match.group(3)
            terms = match.group(4)
            result = f"{arch}, {instr}, {cputime}, {realtime}, {terms}\n"
            print(result, end="")
            outfile.write(result)


outfile.write("arch, instr, cputime, realtime, terms\n")
for arch in architectures:
    run(arch)
outfile.close()
