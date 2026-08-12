#!/usr/bin/env bash
# Generate and verify the SA8D 8x8 seed roundtrip candidate.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:-build/x265-8-gcc}"
SRC="$ROOT/third_party/x265/source"
GEN="$ROOT/generated/sa8d/roundtrip_sa8d_8x8.cpp"
mkdir -p "$(dirname "$GEN")"

PYTHONPATH="$PWD" .venv/bin/python kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN"

g++ -O3 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  kernels/sa8d/roundtrip_verify.cpp "$GEN" \
  "$BUILD/libx265.a" -lnuma -lpthread -ldl \
  -o build/sa8d_roundtrip_verify

echo "[roundtrip] built build/sa8d_roundtrip_verify"
build/sa8d_roundtrip_verify 100000
