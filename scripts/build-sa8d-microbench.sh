#!/usr/bin/env bash
# Build the standalone SA8D microbench against an existing x265 build.
# Usage: scripts/build-sa8d-microbench.sh <build-dir> [out]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:?usage: build-sa8d-microbench.sh <build-dir> [out]}"
OUT="${2:-build/sa8d_microbench}"
SRC="$ROOT/third_party/x265/source"

if [ ! -f "$BUILD/libx265.a" ]; then
  echo "[build-sa8d-microbench] missing $BUILD/libx265.a" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"
g++ -O3 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/benchmarks/sa8d_microbench.cpp" \
  "$BUILD/libx265.a" -lnuma -lpthread -ldl \
  -o "$OUT"
echo "[build-sa8d-microbench] OK: $OUT"
