#!/usr/bin/env bash
# Build microbench including the generated roundtrip candidate (rt impl).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:-build/x265-8-gcc}"
OUT="${2:-build/sa8d_microbench_rt}"
SRC="$ROOT/third_party/x265/source"
GEN="$ROOT/generated/sa8d/roundtrip_sa8d_8x8.cpp"

if [ ! -f "$GEN" ]; then
  echo "[roundtrip-bench] missing $GEN; run scripts/build-sa8d-roundtrip.sh first" >&2
  exit 1
fi

g++ -O3 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/benchmarks/sa8d_microbench.cpp" "$GEN" \
  "$BUILD/libx265.a" -lnuma -lpthread -ldl \
  -o "$OUT"
echo "[roundtrip-bench] OK: $OUT"
