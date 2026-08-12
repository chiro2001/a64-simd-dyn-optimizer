#!/usr/bin/env bash
# Extract the fully-unrolled DCT16 NEON kernel to LLVM IR and import it into
# the MachineIR seed used by search_driver.
#
# Usage:
#   scripts/extract-dct16-seed.sh [out-ll] [out-json]
#
# -O3 alone leaves the 4-iteration output loops unrolled incompletely;
# -funroll-loops plus a high unroll threshold makes dct16_neon straight-line
# (no br), which the current straight-line importer requires.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LL="${1:-$ROOT/experiments/m30-dct16-search/llvm-ir/dct16-unroll.ll}"
JSON="${2:-$ROOT/experiments/m30-dct16-search/imported/machine-ir.json}"
mkdir -p "$(dirname "$LL")" "$(dirname "$JSON")"

clang -target aarch64-linux-gnu -march=armv8.2-a+dotprod -O3 -std=c++11 \
  -funroll-loops -mllvm -unroll-threshold=5000 -mllvm -unroll-count=16 \
  -DHAVE_NEON=1 -DHAVE_NEON_DOTPROD=1 -DX265_ARCH_ARM64=1 \
  -DENABLE_ASSEMBLY=1 -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -I"$ROOT/third_party/x265/source" \
  -I"$ROOT/third_party/x265/source/common" \
  -I"$ROOT/build/x265-8-cross-make" \
  -S -emit-llvm "$ROOT/third_party/x265/source/common/aarch64/dct-prim.cpp" \
  -o "$LL"

PYTHONPATH="$ROOT" python3 - "$LL" "$JSON" <<'PY'
import json
import re
import sys

from optimizer.ir.machine_ir import import_llvm_ir_text

text = open(sys.argv[1]).read()
m = re.search(r"define[^{]*@_ZN4x26510dct16_neonEPKsPsl[^{]*\{", text)
if not m:
    raise SystemExit("dct16_neon not found in IR")
start = m.end() - 1
depth = 0
for i in range(start, len(text)):
    if text[i] == "{":
        depth += 1
    elif text[i] == "}":
        depth -= 1
        if depth == 0:
            break
body = text[m.start():i + 1]
ir = import_llvm_ir_text(body, function="x265::dct16_neon")
doc = {"function": ir.function, "nodes": [dict(n) for n in ir.nodes]}
json.dump(doc, open(sys.argv[2], "w"), indent=1)
print("imported %d nodes -> %s" % (len(doc["nodes"]), sys.argv[2]))
PY
