#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
#
# Copyright (c) 2020 Luke Nelson <luke.r.nels@gmail.com>
# Copyright (c) 2020 Xi Wang <xi.wang@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import argparse, subprocess


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--validate", help="use llvm-mc for validation", action="store_true")
    args = parser.parse_args()

    count = 0

    print("#lang racket/base\n\n(provide (all-defined-out))\n\n(define data '(")
    print("  ; (<val> (<n> <immr> <imms>))")

    for esize in [2, 4, 8, 16, 32, 64]:
        n = 1 if esize == 64 else 0
        for i in range(esize - 1):
            val = ('1' * (i+1)).zfill(esize) * (64 // esize)
            for immr in range(esize):
                imms = ((0b1111 << esize.bit_length()) % 64) | i
                print(f"  (#x{int(val, 2):016x} ({n} {immr:2d} {imms:2d}))")
                if args.validate:
                    validate(val, n, immr, imms)
                count = count + 1
                val = val[-1] + val[0:-1]
    print("))")

    # 5,334 unique 64-bit patterns
    assert count == 5334


def validate(val, n, immr, imms):
    def check(sf, val):
        cmd = ["llvm-mc", "--disassemble", "--triple=aarch64"]
        # and x0, x0, imm (use w0 if sf == 0)
        insn = (sf << 31) | (0b00100100 << 23) | (n << 22) | (immr << 16) | (imms << 10)
        input = b" ".join([b"0x%x" % b for b in insn.to_bytes(4, byteorder="little")])
        output = subprocess.run(cmd, stdout=subprocess.PIPE, input=input).stdout
        act = int(output.split()[-1].strip(b'#'), 0)
        exp = int(val, 2)
        assert act == exp
    # 64-bit imm
    check(1, val)
    # 32-bit imm
    if n == 0:
        assert val[0:32] == val[-32:]
        check(0, val[0:32])


if __name__ == "__main__":
    main()
