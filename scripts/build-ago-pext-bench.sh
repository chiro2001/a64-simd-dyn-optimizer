#!/usr/bin/env bash
# Build the AGO M3 PEXT template microbench (table vs ctz loop).
#
# Usage: scripts/build-ago-pext-bench.sh [CXX]
#   CXX  native/cross compiler (default aarch64-linux-gnu-g++)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${1:-aarch64-linux-gnu-g++}"
mkdir -p build
python3 - build/ago_pext_impl.inc <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.templates.pext_table import emit_pext_nibble
open(sys.argv[1], "w").write(emit_pext_nibble())
PY

STATIC_FLAG="-static"
if [ "${AGO_LINK_STATIC:-1}" = "0" ]; then
    STATIC_FLAG=""
fi
"$CXX" -O3 $STATIC_FLAG -DNDEBUG -std=c++11 \
  -I build benchmarks/pext_microbench.cpp -o build/ago_pext_microbench
echo "built build/ago_pext_microbench"
echo "run: build/ago_pext_microbench table|ctz [samples] [batch]"
