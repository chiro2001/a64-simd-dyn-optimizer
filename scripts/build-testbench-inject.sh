#!/usr/bin/env bash
# Build x265 TestBench with the tool-generated DCT16 candidate injected and
# run the transforms functional self-test (golden-standard acceptance gate).
#
# Injection mechanism: scripts/testbench-inject.patch rewrites testbench.cpp so
# that, after setupIntrinsicPrimitives + setupAliasPrimitives, it replaces
#   vecprim.cu[BLOCK_16x16].dct = dynopt_dct16_sve2_shared;
# The transforms harness (MBDstHarness) then compares this pointer against the
# C reference for ITERS=128 random cases x 3 buffers (check_dct_primitive).
#
# Notes:
#  * The candidate object is passed via CMAKE_EXE_LINKER_FLAGS. cmake --build
#    does NOT relink when only the .o content changes, so we always remove the
#    TestBench binary to force a relink and `nm`-verify the symbol afterwards.
#  * x265's SVE/SVE2 compile-time options are normally disabled by CMake when
#    arm_neon_sve_bridge.h is missing, so `--cpuid SVE2` is an invalid name and
#    we run under NEON labels instead. The injected function is the same SVE2
#    object and QEMU still executes it with `-cpu max,sve-max-vq=2` (VL=256).
#    Override with TESTBENCH_CPUID if a build with SVE support is available.
#
# Usage: scripts/build-testbench-inject.sh [candidate.o] [outdir]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

CAND="${1:-$ROOT/kernels/dct16/candidates/best_sve2.o}"
OUT="${2:-$ROOT/build/x265-8-testbench}"
SRC="$ROOT/third_party/x265/source"
CPUID="${TESTBENCH_CPUID:-NEON,Neon_DotProd,Neon_I8MM}"

CAND="$(readlink -f "$CAND")"

# (re)apply the injection patch to the pinned testbench.cpp
cd "$SRC/.."
if git apply --check "$ROOT/scripts/testbench-inject.patch" 2>/dev/null; then
    git apply "$ROOT/scripts/testbench-inject.patch"
elif rg -q "dynopt_dct16_sve2_shared" source/test/testbench.cpp; then
    echo "testbench.cpp already patched"
else
    echo "ERROR: cannot apply testbench-inject.patch" >&2
    exit 1
fi
cd "$ROOT"

cmake -S "$SRC" -B "$OUT" -G "Unix Makefiles" \
  -DCMAKE_MAKE_PROGRAM=/usr/bin/make \
  -DCMAKE_TOOLCHAIN_FILE="$SRC/../build/aarch64-linux/crosscompile.cmake" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_FLAGS="-DHAVE_STRTOK_R=1" \
  -DCMAKE_CXX_FLAGS="-DHAVE_STRTOK_R=1" \
  -DCMAKE_EXE_LINKER_FLAGS="$CAND" \
  -DENABLE_TESTS=ON \
  -DHIGH_BIT_DEPTH=OFF \
  -DENABLE_NEON=ON -DENABLE_NEON_DOTPROD=ON -DENABLE_NEON_I8MM=ON \
  -DENABLE_SVE=ON -DENABLE_SVE2=ON -DENABLE_SVE2_BITPERM=OFF \
  -DAARCH64_RUNTIME_CPU_DETECT=OFF \
  2>&1 | tail -3

# Force a relink even if only the candidate .o content changed (cmake --build
# does not track objects passed through CMAKE_EXE_LINKER_FLAGS).
rm -f "$OUT/test/TestBench"

cmake --build "$OUT" --target TestBench -j8 2>&1 | tail -4

echo "verifying injected symbol in TestBench binary..."
nm -g "$OUT/test/TestBench" | grep dynopt_dct16_sve2_shared
echo "verifying injection call site was compiled in..."
nm -u "$OUT/test/CMakeFiles/TestBench.dir/testbench.cpp.o" \
    | grep dynopt_dct16_sve2_shared

echo "running transforms TestBench under QEMU (VL=256), cpuid=${CPUID}..."
qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 \
  "$OUT/test/TestBench" --cpuid "$CPUID" --testbench transforms --nobench \
  2>&1 | tail -30
