#!/usr/bin/env python3

import glob
import os
import sys
import argparse

# A script to delete headers delete unused headers.

# Usage:
#  First generate the list of headers to keep:
#    cc -H ... 2> keep.txt
#  Then run this script to delete headers not in keep.txt:
#    python3 cleanheader.py -k keep.txt arch/riscv/include include

parser = argparse.ArgumentParser()
parser.add_argument('-n', '--dry-run', action='store_true')
parser.add_argument('-k', '--keep', required=True, type=str)
parser.add_argument('paths', metavar='PATH', type=str, nargs='+')
args = parser.parse_args()
dryrun = args.dry_run
paths = args.paths
keepfile = args.keep

keep = set()

with open(keepfile, 'r') as f:
    for line in f.readlines():
        keep.add(line.lstrip('. ').rstrip().casefold())

def decide(path):
    path = path.casefold()
    if path in keep:
        print(f'Keeping {path}')
    else:
        if dryrun:
            print(f'Would delete {path}')
        else:
            print(f'Deleting {path}')
            os.unlink(path)

for gl in paths:
    for path in glob.glob(gl + '/**/*.h', recursive=True):
        decide(path)
