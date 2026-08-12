#!/usr/bin/env bash
# Build unmodified x265 (pinned submodule) with Tests enabled.
# Default: 8-bit, Release, GCC, Ninja, SVE disabled (N1 has no SVE).
# Usage: scripts/build-x265.sh [8|10|12] [gcc|clang]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BD="${1:-8}"
CCID="${2:-gcc}"
SRC="$ROOT/third_party/x265/source"
BUILD="$ROOT/build/x265-${BD}-${CCID}"

if [ ! -f "$SRC/CMakeLists.txt" ]; then
  echo "[build-x265] missing x265 source at $SRC; run scripts/bootstrap.sh" >&2
  exit 1
fi

case "$BD" in
  8)  HIGH=OFF ;;
  10|12) HIGH=ON ;;
  *) echo "[build-x265] bit depth must be 8, 10 or 12" >&2; exit 2 ;;
esac

case "$CCID" in
  gcc) CC=gcc; CXX=g++ ;;
  clang) CC=clang; CXX=clang++ ;;
  *) echo "[build-x265] compiler must be gcc or clang" >&2; exit 2 ;;
esac

echo "[build-x265] configuring $BD-bit $CCID build in $BUILD"
cmake -S "$SRC" -B "$BUILD" \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER="$CC" \
  -DCMAKE_CXX_COMPILER="$CXX" \
  -DENABLE_TESTS=ON \
  -DHIGH_BIT_DEPTH="$HIGH" \
  -DENABLE_SVE=OFF \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  2>&1 | tee "$BUILD/configure.log"

echo "[build-x265] building"
cmake --build "$BUILD" --parallel "$(nproc)" 2>&1 | tee "$BUILD/build.log"

echo "[build-x265] OK: $BUILD"
ls -l "$BUILD/TestBench" "$BUILD/x265" 2>/dev/null || true
