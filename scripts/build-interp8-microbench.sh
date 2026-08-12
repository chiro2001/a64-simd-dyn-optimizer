#!/usr/bin/env bash
# Build the interp8 8-tap luma hpp A/B microbench against an x265 build.
# Usage: scripts/build-interp8-microbench.sh <build-dir> [out] [candidate.cpp]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:?usage: build-interp8-microbench.sh <build-dir> [out] [candidate.cpp]}"
OUT="${2:-build/interp8_microbench}"
CAND="${3:-}"
SRC="$ROOT/third_party/x265/source"
NUMA_LIBS="${NUMA_LIBS:--lnuma}"
[ "${SKIP_NUMA:-0}" = "1" ] && NUMA_LIBS=""
MARCH="${MARCH:-}"

if [ ! -f "$BUILD/libx265.a" ]; then
  echo "[build-interp8-microbench] missing $BUILD/libx265.a" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"
"${CXX:-g++}" -O3 -DNDEBUG -std=c++11 -Wall -Wextra ${MARCH:+$MARCH} \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -DDYNOPT_CANDIDATE=dynopt_interp8_hpp_candidate \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/benchmarks/interp8_microbench.cpp" ${CAND:+"$CAND"} \
  "$BUILD/libx265.a" $NUMA_LIBS -lpthread -ldl \
  -o "$OUT"
echo "[build-interp8-microbench] OK: $OUT"
