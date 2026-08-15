#!/usr/bin/env bash
# Build the AGO satd8 8x8 paired microbench (upstream NEON vs cover).
#
# Usage: scripts/build-ago-satd8-bench.sh [CXX] [BUILD_DIR]
#   CXX       cross/native C++ compiler (default aarch64-linux-gnu-g++)
#   BUILD_DIR x265 build dir with libx265.a (default build/x265-8-cross-make)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${1:-aarch64-linux-gnu-g++}"
BUILD_DIR="${2:-build/x265-8-cross-make}"
OUT="build/ago_satd8_microbench"

python3 - build/ago_satd8_cover.cpp <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.frontend import SATD8_DSL, parse_dsl
from ago.cover_neon import build_c_source
open(sys.argv[1], "w").write(build_c_source(parse_dsl(SATD8_DSL)))
PY

"$CXX" -O3 -static -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 \
  -DX265_DEPTH=8 -DX265_NS=x265 \
  -I third_party/x265/source -I third_party/x265/source/common \
  -I "$BUILD_DIR" benchmarks/ago_satd8_microbench.cpp \
  build/ago_satd8_cover.cpp "$BUILD_DIR/libx265.a" \
  -lpthread -ldl -o "$OUT"

echo "built $OUT"
echo "run: $OUT neon [samples] [batch]"
echo "run: $OUT cand [samples] [batch]"
