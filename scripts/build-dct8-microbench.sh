#!/usr/bin/env bash
# Build the DCT8 A/B microbench (c/neon/empty/cand in one binary) against an
# existing x265 build. Optionally link a generated candidate.
# Usage: scripts/build-dct8-microbench.sh <build-dir> [out] [candidate.cpp]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:?usage: build-dct8-microbench.sh <build-dir> [out] [candidate.cpp]}"
OUT="${2:-build/dct8_microbench}"
CAND="${3:-}"
SRC="$ROOT/third_party/x265/source"
NUMA_LIBS="${NUMA_LIBS:--lnuma}"
[ "${SKIP_NUMA:-0}" = "1" ] && NUMA_LIBS=""

if [ ! -f "$BUILD/libx265.a" ]; then
  echo "[build-dct8-microbench] missing $BUILD/libx265.a" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"
"${CXX:-g++}" -O3 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -DDYNOPT_CANDIDATE=dynopt_dct8_neon_candidate \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/benchmarks/dct8_microbench.cpp" ${CAND:+"$CAND"} \
  "$BUILD/libx265.a" $NUMA_LIBS -lpthread -ldl \
  -o "$OUT"
echo "[build-dct8-microbench] OK: $OUT"
