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
    "arm32",
    "arm64",
    "x86_32",
    "x86_64",
    "rv32",
    "rv64",
]

time_re = re.compile(r"\[       OK \] \"VERIFY \((.+)\)\" \((.+) ms\)")


def get_proc_one_architecture(arch):
    cmd = "echo" if dry_run else "make"
    args = ["VERIFY_JOBS=1", f"verify-{arch}"]
    return subprocess.run([cmd, *args], capture_output=True, encoding="utf8", check=True)


def run(arch):
    if debug:
        print(f"DEBUG: Running {arch}")
    proc = get_proc_one_architecture(arch)

    for line in proc.stdout.splitlines():
        match = re.match(time_re, line)
        if match:
            instr = match.group(1)
            time = match.group(2)
            result = f"{arch}, {instr}, {time}\n"
            print(result, end="")
            outfile.write(result)


outfile.write("arch, instr, time(ms)\n")
for arch in architectures:
    run(arch)
outfile.close()
