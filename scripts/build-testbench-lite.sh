#!/usr/bin/env bash
# Build and run the lite x265 TestBench gate for a tool-generated kernel.
#
# Reuses x265's MBDstHarness (same random buffers, same check_dct_primitive
# loop, same C reference dct16_c) but links only the harness + the candidate
# object against the already-built libx265.a, so a candidate can be gated in
# seconds without rebuilding TestBench or the library.
#
# The full x265 TestBench run (scripts/build-testbench-inject.sh,
# `--testbench transforms --nobench`) remains the acceptance golden standard
# for DCT16; for SA8D the lite gate IS the acceptance gate (user decision
# 2026-08-13). Lite is the per-iteration fast gate for everything else.
#
# Usage: scripts/build-testbench-lite.sh [candidate.o] [outdir] [-- seed]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

CAND="${1:-$ROOT/kernels/dct16/candidates/best_sve2.o}"
OUT="${2:-$ROOT/build/x265-8-testbench}"
LITE="$ROOT/build/testbench-lite"
SRC="$ROOT/third_party/x265/source"
CXX=/usr/bin/aarch64-linux-gnu-g++

CAND="$(readlink -f "$CAND")"
# The lite binary hosts the DCT16 and SA8D (8x8/16x16) gates; link the
# reference candidates too so any --gate works with a single invocation.
if [ -f "$ROOT/kernels/dct16/candidates/best_sve2.o" ]; then
    CAND_DCT16="$ROOT/kernels/dct16/candidates/best_sve2.o"
else
    CAND_DCT16=""
fi
if [ -f "$ROOT/kernels/sa8d/candidates/best_sve2.o" ]; then
    CAND_SA8D="$ROOT/kernels/sa8d/candidates/best_sve2.o"
else
    CAND_SA8D=""
fi
if [ -f "$ROOT/kernels/sa8d16/candidates/best_sve2.o" ]; then
    CAND_SA8D16="$ROOT/kernels/sa8d16/candidates/best_sve2.o"
else
    CAND_SA8D16=""
fi
# Drop a reference candidate when the caller passes the same object, so the
# link does not see duplicate definitions of its symbol.
[ -n "$CAND_DCT16" ] && [ "$(readlink -f "$CAND_DCT16")" = "$CAND" ] \
    && CAND_DCT16=""
[ -n "$CAND_SA8D" ] && [ "$(readlink -f "$CAND_SA8D")" = "$CAND" ] \
    && CAND_SA8D=""
[ -n "$CAND_SA8D16" ] && [ "$(readlink -f "$CAND_SA8D16")" = "$CAND" ] \
    && CAND_SA8D16=""
mkdir -p "$LITE"

if [ ! -f "$OUT/libx265.a" ]; then
    echo "missing $OUT/libx265.a - configure/build the x265 test build first" >&2
    exit 1
fi

DEFS=(-DENABLE_ASSEMBLY -DEXPORT_C_API=1 -DHAVE_NEON=1 -DHAVE_NEON_DOTPROD=1 \
      -DHAVE_NEON_I8MM=1 -DHIGH_BIT_DEPTH=0 -DPIC -DX265_ARCH_ARM64=1 \
      -DX265_DEPTH=8 -DX265_NS=x265 -D__STDC_LIMIT_MACROS=1 -DHAVE_STRTOK_R=1)
INCS=(-I"$SRC" -I"$SRC/common" -I"$SRC/encoder" -I"$SRC/test" \
      -I"$OUT" -I"$SRC/compat/getopt")

"$CXX" -std=gnu++98 -O3 -DNDEBUG -fPIC "${DEFS[@]}" "${INCS[@]}" \
    -c "$SRC/test/mbdstharness.cpp" -o "$LITE/mbdstharness.o"
"$CXX" -std=gnu++98 -O3 -DNDEBUG -fPIC "${DEFS[@]}" "${INCS[@]}" \
    -c "$SRC/test/pixelharness.cpp" -o "$LITE/pixelharness.o"
"$CXX" -std=gnu++98 -O3 -DNDEBUG -fPIC "${DEFS[@]}" "${INCS[@]}" \
    -c "$ROOT/tools/testbench_lite.cpp" -o "$LITE/testbench_lite.o"

"$CXX" "$CAND" $CAND_DCT16 $CAND_SA8D $CAND_SA8D16 \
    -Wl,-Bsymbolic,-znoexecstack \
    "$LITE/testbench_lite.o" "$LITE/mbdstharness.o" "$LITE/pixelharness.o" \
    -o "$LITE/TestBenchLite" "$OUT/libx265.a" -lpthread -lrt -ldl

echo "running testbench-lite under QEMU (VL=256)..."
qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 \
    "$LITE/TestBenchLite" "${@:3}"
