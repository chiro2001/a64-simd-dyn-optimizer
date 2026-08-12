#!/usr/bin/env bash
# QEMU dynamic instruction tracing for one kernel invocation.
#
# Unlike a compiler-based unroll (-O3 -funroll-loops), this captures the
# instruction stream that is ACTUALLY executed once, in order, via
# `-one-insn-per-tb -d in_asm -dfilter <function range>`. The kernel object
# is linked into a static -no-pie driver so the address range is fixed.
#
# Usage:
#   tools/trace_kernel.sh <kernel.o> <symbol> [out.log] [driver.cpp]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OBJ="${1:?usage: trace_kernel.sh <kernel.o> <symbol> [out.log] [driver.cpp]}"
SYM="${2:?usage: trace_kernel.sh <kernel.o> <symbol> [out.log] [driver.cpp]}"
LOG="${3:-$ROOT/build/kernel-trace.log}"
DRIVER="${4:-$ROOT/kernels/dct16/trace_driver.cpp}"

bin="$ROOT/build/trace-driver-$(basename "$OBJ" .o)"
aarch64-linux-gnu-g++ -O2 -no-pie -static -std=c++11 \
  "$DRIVER" "$OBJ" -o "$bin"

range=$(nm "$bin" | sort | awk -v sym="$SYM" '
  $3==sym { start=$1; found=1 }
  found && $1!=start && ($2=="T" || $2=="t") { print start " " $1; exit }
') || true   # awk exits early -> sort sees SIGPIPE; ignore under pipefail
[ -n "$range" ] || { echo "symbol $SYM not found in $bin" >&2; exit 1; }
set -- $range
START=$1
END=$2

qemu-aarch64 -cpu max -one-insn-per-tb -d in_asm \
  -dfilter "0x$START..0x$END" -D "$LOG" "$bin" >/dev/null 2>&1
echo "traced $SYM at 0x$START..0x$END -> $LOG"
