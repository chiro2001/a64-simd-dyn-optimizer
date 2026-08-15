#!/usr/bin/env bash
# Real-machine LD_PRELOAD verification (920B SVE1 / 950 SVE2).
#
# Builds a dynopt library locally with tools/build_preload_so.py --isa sve1
# (or sve2), copies it and benchmarks/preload_verify.cpp to the target, then
# compiles/runs the comparison against that machine's libx265.
#
# Usage:
#   scripts/verify-preload-real-machine.sh <user@host> <isa> [remote-repo]
set -euo pipefail

HOST="${1:?usage: ... <user@host> <isa> [remote-repo]}"
ISA="${2:?isa: sve1 or sve2}"
REMOTE_REPO="${3:-/home/chiro/projects/a64-simd-dyn-optimizer}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

case "$ISA" in sve1|sve2) ;; *) echo "bad isa $ISA" >&2; exit 2 ;; esac

WORK="$(mktemp -d)"
trap 'rm -r -- "$WORK"' EXIT
python3 "$ROOT/tools/build_preload_so.py" --isa "$ISA" \
  --out "$WORK/dynopt-preload.so" --kernels sa8d,interp8,scale2d \
  --workdir "$WORK"

scp -o BatchMode=yes -o ConnectTimeout=10 \
  "$WORK/dynopt-preload.so" "$HOST:/tmp/dynopt-preload-lib.so"
scp -o BatchMode=yes -o ConnectTimeout=10 \
  "$ROOT/benchmarks/preload_verify.cpp" "$HOST:/tmp/preload_verify.cpp"

ssh -o BatchMode=yes -o ConnectTimeout=10 "$HOST" "
  cd '$REMOTE_REPO' &&
  g++ -O2 -std=c++11 -DX265_NS=x265 -DX265_DEPTH=8 -DHIGH_BIT_DEPTH=0 \
    -I third_party/x265/source -I third_party/x265/source/common \
    -I build/x265-8-gcc /tmp/preload_verify.cpp -o /tmp/preload_verify \
    -Lbuild/x265-8-gcc -lx265 -ldl -lpthread \
    -Wl,-rpath,'$REMOTE_REPO'/build/x265-8-gcc &&
  /tmp/preload_verify /tmp/dynopt-preload-lib.so
"
