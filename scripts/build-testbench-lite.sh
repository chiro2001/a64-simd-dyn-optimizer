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
CXX="${CXX:-aarch64-linux-gnu-g++}"

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
if [ -z "${CAND_DCT32:-}" ] && [ -f "$ROOT/kernels/dct32/candidates/best_sve2.o" ]; then
    CAND_DCT32="$ROOT/kernels/dct32/candidates/best_sve2.o"
else
    CAND_DCT32="${CAND_DCT32:-}"
fi
if [ -f "$ROOT/kernels/interp8/candidates/best_sve2.o" ]; then
    CAND_INTERP8="$ROOT/kernels/interp8/candidates/best_sve2.o"
else
    CAND_INTERP8=""
fi
CAND_INTERP8_SDOTH=""
if [ -f "$ROOT/kernels/interp8/candidates/best_sve2_sdoth.o" ]; then
    CAND_INTERP8_SDOTH="$ROOT/kernels/interp8/candidates/best_sve2_sdoth.o"
fi
CAND_INTERP8_16=""
if [ -f "$ROOT/kernels/interp8/candidates/best_sve2_sdoth_16x16.o" ]; then
    CAND_INTERP8_16="$ROOT/kernels/interp8/candidates/best_sve2_sdoth_16x16.o"
fi
CAND_INTERP8_32=""
if [ -f "$ROOT/kernels/interp8/candidates/best_sve2_sdoth_32x32.o" ]; then
    CAND_INTERP8_32="$ROOT/kernels/interp8/candidates/best_sve2_sdoth_32x32.o"
fi
CAND_INTERP8_VPP=""
if [ -f "$ROOT/kernels/interp8vpp-16/candidates/best_sve2.o" ]; then
    CAND_INTERP8_VPP="$ROOT/kernels/interp8vpp-16/candidates/best_sve2.o"
fi
CAND_INTERP8_VPP32=""
if [ -f "$ROOT/kernels/interp8vpp-32/candidates/best_sve2.o" ]; then
    CAND_INTERP8_VPP32="$ROOT/kernels/interp8vpp-32/candidates/best_sve2.o"
fi
CAND_IDCT16=""
if [ -f "$ROOT/kernels/idct16/candidates/best_sve2.o" ]; then
    CAND_IDCT16="$ROOT/kernels/idct16/candidates/best_sve2.o"
fi
CAND_IDCT32=""
if [ -f "$ROOT/kernels/idct32/candidates/best_sve2.o" ]; then
    CAND_IDCT32="$ROOT/kernels/idct32/candidates/best_sve2.o"
fi
# Drop a reference candidate when the caller passes the same object, so the
# link does not see duplicate definitions of its symbol.
[ -n "$CAND_DCT16" ] && [ "$(readlink -f "$CAND_DCT16")" = "$CAND" ] \
    && CAND_DCT16=""
[ -n "$CAND_SA8D" ] && [ "$(readlink -f "$CAND_SA8D")" = "$CAND" ] \
    && CAND_SA8D=""
[ -n "$CAND_SA8D16" ] && [ "$(readlink -f "$CAND_SA8D16")" = "$CAND" ] \
    && CAND_SA8D16=""
[ -n "$CAND_DCT32" ] && [ "$(readlink -f "$CAND_DCT32")" = "$CAND" ] \
    && CAND_DCT32=""
[ -n "$CAND_INTERP8" ] && [ "$(readlink -f "$CAND_INTERP8")" = "$CAND" ] \
    && CAND_INTERP8=""
for var in CAND_INTERP8_SDOTH CAND_INTERP8_16 CAND_INTERP8_32 \
           CAND_INTERP8_VPP CAND_INTERP8_VPP32 CAND_IDCT16 CAND_IDCT32; do
    eval "f=\${$var:-}"
    [ -n "$f" ] && [ "$(readlink -f "$f")" = "$CAND" ] && eval "$var="
done

# Drop any reference candidate that shares an exported symbol with the
# candidate under test (op-backend candidates reuse the dynopt_* symbol
# that the grouped reference objects also define).
for var in CAND_DCT16 CAND_SA8D CAND_SA8D16 CAND_DCT32 CAND_INTERP8 \
           CAND_INTERP8_SDOTH CAND_INTERP8_16 CAND_INTERP8_32 \
           CAND_INTERP8_VPP CAND_INTERP8_VPP32 CAND_IDCT16 CAND_IDCT32; do
    eval "f=\${$var:-}"
    [ -n "$f" ] || continue
    if comm -12 \
        <(nm -g --defined-only "$CAND" 2>/dev/null | awk '{print $3}' | sort -u) \
        <(nm -g --defined-only "$f" 2>/dev/null | awk '{print $3}' | sort -u) \
        | grep -q .; then
        eval "$var="
    fi
done
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
    -c "$SRC/test/ipfilterharness.cpp" -o "$LITE/ipfilterharness.o"
"$CXX" -std=gnu++98 -O3 -DNDEBUG -fPIC "${DEFS[@]}" "${INCS[@]}" \
    -c "$ROOT/tools/testbench_lite.cpp" -o "$LITE/testbench_lite.o"

"$CXX" "$CAND" $CAND_DCT16 $CAND_SA8D $CAND_SA8D16 $CAND_DCT32 \
    $CAND_INTERP8 $CAND_INTERP8_SDOTH $CAND_INTERP8_16 $CAND_INTERP8_32 \
    $CAND_INTERP8_VPP $CAND_INTERP8_VPP32 $CAND_IDCT16 $CAND_IDCT32 \
    -Wl,-Bsymbolic,-znoexecstack \
    "$LITE/testbench_lite.o" "$LITE/mbdstharness.o" "$LITE/pixelharness.o" \
    "$LITE/ipfilterharness.o" \
    -o "$LITE/TestBenchLite" "$OUT/libx265.a" -lpthread -lrt -ldl

if [ "${RUN_MODE:-qemu}" = native ]; then
    echo "running testbench-lite natively..."
    "$LITE/TestBenchLite" "${@:3}"
else
    echo "running testbench-lite under QEMU (VL=256)..."
    qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 \
        "$LITE/TestBenchLite" "${@:3}"
fi
