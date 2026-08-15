#!/usr/bin/env bash
# Build the AGO M3 DFA microbench (table vs reference formula).
#
# Usage: scripts/build-ago-remain-bench.sh [CXX]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${1:-aarch64-linux-gnu-g++}"
mkdir -p build
python3 - build/remain_ref.cpp <<'PY'
import os, sys
sys.path.insert(0, os.path.join(os.getcwd(), "tools"))
sys.path.insert(0, os.path.join(os.getcwd(), "optimizer"))
from emit_cost_remain_sve2_shared import emit
open(sys.argv[1], "w").write(emit("dynopt_cost_coeff_remain_ref"))
PY
python3 - build/remain_dfa.cpp <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.templates.dfa_table import emit_dfa
open(sys.argv[1], "w").write(emit_dfa("dynopt_cost_coeff_remain_dfa"))
PY

STATIC_FLAG="-static"
if [ "${AGO_LINK_STATIC:-1}" = "0" ]; then
    STATIC_FLAG=""
fi
"$CXX" -O3 $STATIC_FLAG -DNDEBUG -std=c++11 \
  build/remain_ref.cpp build/remain_dfa.cpp benchmarks/remain_microbench.cpp \
  -o build/ago_remain_microbench
echo "built build/ago_remain_microbench"
echo "run: build/ago_remain_microbench ref|dfa [samples] [batch]"
