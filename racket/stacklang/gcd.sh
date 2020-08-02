#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
cc -o "$DIR"/jit "$DIR"/main.c "$DIR"/jit.c
"$DIR"/jit "=6<4-j0sj0." "$@"
