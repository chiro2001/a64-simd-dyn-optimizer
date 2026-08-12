#!/usr/bin/env bash
# Build the DCT8 differential verifier (self-contained scalar oracle vs
# upstream x265 dct8_neon) against an existing x265 build.
# Usage: scripts/build-dct8-verify.sh <build-dir> [out]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:?usage: build-dct8-verify.sh <build-dir> [out]}"
OUT="${2:-build/dct8_verify}"
SRC="$ROOT/third_party/x265/source"
NUMA_LIBS="${NUMA_LIBS:--lnuma}"   # SKIP_NUMA=1 hosts (local cross) have none
[ "${SKIP_NUMA:-0}" = "1" ] && NUMA_LIBS=""

if [ ! -f "$BUILD/libx265.a" ]; then
  echo "[build-dct8-verify] missing $BUILD/libx265.a" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"
"${CXX:-g++}" -O2 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/kernels/dct8/dct8_verify.cpp" \
  "$BUILD/libx265.a" $NUMA_LIBS -lpthread -ldl \
  -o "$OUT"
echo "[build-dct8-verify] OK: $OUT"
