#!/usr/bin/env bash
# Build the SVE SA8D A/B microbench against an unmodified x265 baseline lib.
#
# Links the 8x8 single-tile candidate as the `cand` 8x8 impl and the 16x16
# two-wave wrapper (which calls the raw x2 helper) as the `cand` 16x16 impl,
# next to the upstream `neon` dispatch in the same binary. This is the 920B
# paired-PMU binary: candidate SVE256 vs same-machine NEON.
#
# Usage: scripts/build-sa8d-sve-microbench.sh <x265-build-dir> [out]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:-build/x265-8-gcc}"
OUT="${2:-build/sa8d_sve_microbench}"
SRC="$ROOT/third_party/x265/source"
CXX="${CXX:-g++}"
SVE_MARCH="${SVE_MARCH:-armv8-a+sve}"
NUMA_LIBS="${NUMA_LIBS:--lnuma}"
[ "${SKIP_NUMA:-0}" = "1" ] && NUMA_LIBS=""

if [ ! -f "$BUILD/libx265.a" ]; then
  echo "[build-sa8d-sve-microbench] missing $BUILD/libx265.a" >&2
  exit 1
fi

mkdir -p "$ROOT/generated/sa8d" "$(dirname "$OUT")"
PY="${PYTHON:-python3}"
GEN1="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8.cpp"
GEN3="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8x2raw.cpp"
GEN4="$ROOT/generated/sa8d/sve_roundtrip_sa8d_16x16.cpp"

PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN1" --backend sve2
PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN3" --backend sve2 \
  --pack x2 --raw
PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN4" --backend sve2 \
  --pack x2 --raw --shape 16x16

"$CXX" -O3 -DNDEBUG -std=c++11 -Wall -Wextra -march="$SVE_MARCH" \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -DDYNOPT_CANDIDATE=dynopt_sa8d_8x8_neon_sve2 \
  -DDYNOPT_CANDIDATE16=dynopt_sa8d_16x16_neon_sve2 \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/benchmarks/sa8d_microbench.cpp" "$GEN1" "$GEN3" "$GEN4" \
  "$BUILD/libx265.a" $NUMA_LIBS -lpthread -ldl \
  -o "$OUT"

echo "[build-sa8d-sve-microbench] OK: $OUT"
sha256sum "$OUT"
