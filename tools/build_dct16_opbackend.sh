#!/usr/bin/env bash
# Build the DCT16 OpIR backend candidate (upstream per-row pass1 +
# upstream pass2, op-DAG driven).
# Usage: tools/build_dct16_opbackend.sh [out.cpp] [out.o]
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_CPP="${1:-/tmp/dct16_opbackend.cpp}"
OUT_O="${2:-/tmp/dct16_opbackend.o}"
cd "$ROOT"
PYTHONPATH="$ROOT/optimizer/ir" python3 - <<'PY'
import sys
from dct16_op_emit import emit_acle
open(sys.argv[1], "w").write(emit_acle())
PY "$OUT_CPP"
aarch64-linux-gnu-g++ -O2 -fno-tree-pre -std=c++11 \
    -march=armv8.2-a+sve2 -c "$OUT_CPP" -o "$OUT_O"
echo "opbackend OK: $OUT_O"
