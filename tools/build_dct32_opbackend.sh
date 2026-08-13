#!/usr/bin/env bash
# Build the DCT32 OpIR backend candidate (E1-B slice).
# Usage: tools/build_dct32_opbackend.sh [out.cpp] [out.o]
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_CPP="${1:-/tmp/dct32_opbackend.cpp}"
OUT_O="${2:-/tmp/dct32_opbackend.o}"
cd "$ROOT"
PYTHONPATH="$ROOT/optimizer/ir" python3 - <<'PY'
import sys
from layout_ir import dct32_v31_plan
from dct32_op_emit import emit_from_plan
open(sys.argv[1], "w").write(emit_from_plan(dct32_v31_plan()))
PY "$OUT_CPP"
aarch64-linux-gnu-g++ -O2 -fno-tree-pre -std=c++11 \
    -march=armv8.2-a+sve2 -c "$OUT_CPP" -o "$OUT_O"
echo "opbackend OK: $OUT_O"
