#!/usr/bin/env bash
# Build the self-contained x265-internal DCT contract reproducer
# (upstream dct4/8/16/32_c vs dct*_neon, untouched pinned sources) against an
# existing x265 static build.
# Usage: scripts/build-upstream-contract.sh <build-dir> [out]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:?usage: build-upstream-contract.sh <build-dir> [out]}"
OUT="${2:-build/upstream_contract}"
SRC="$ROOT/third_party/x265/source"
NUMA_LIBS="${NUMA_LIBS:--lnuma}"   # SKIP_NUMA=1 hosts (local cross) have none
[ "${SKIP_NUMA:-0}" = "1" ] && NUMA_LIBS=""

if [ ! -f "$BUILD/libx265.a" ]; then
  echo "[build-upstream-contract] missing $BUILD/libx265.a" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"
"${CXX:-g++}" -O2 -DNDEBUG -std=c++11 -Wall -Wextra $CXXFLAGS \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  "$ROOT/kernels/dct8/upstream_contract.cpp" \
  "$BUILD/libx265.a" $NUMA_LIBS -lpthread -ldl \
  -o "$OUT"
echo "[build-upstream-contract] OK: $OUT"
