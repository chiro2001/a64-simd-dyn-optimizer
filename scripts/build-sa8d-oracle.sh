#!/usr/bin/env bash
# Build the SA8D oracle CLI against an existing x265 build.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:-build/x265-8-gcc}"
OUT="${2:-build/sa8d_oracle}"
SRC="$ROOT/third_party/x265/source"

mkdir -p "$(dirname "$OUT")"
g++ -O3 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/kernels/sa8d/oracle.cpp" \
  "$BUILD/libx265.a" -lnuma -lpthread -ldl \
  -o "$OUT"
echo "[build-sa8d-oracle] OK: $OUT"
