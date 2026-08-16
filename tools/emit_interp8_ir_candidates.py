#!/usr/bin/env python3
"""Generate best_ir.cpp (pure-NEON interp8 hpp IR) for every hpp shape.

One width-independent DAG per (W,H) from optimizer/ir/interp8_op_ir.py,
emitted with the manifest candidate symbol so build_preload_so can pick
it up under AGO_IR_FILTER=1 (docs/66, docs/68 §3).

Usage:
  python3 tools/emit_interp8_ir_candidates.py [kernel...]
  (default: all interp8 hpp shapes)
"""

import importlib
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from interp8_op_ir import (  # noqa: E402
    interp8_hpp_8x8_dag, interp8_hpp_8x16_dag, interp8_hpp_16x8_dag,
    interp8_hpp_16x16_dag, interp8_hpp_16x32_dag, interp8_hpp_32x16_dag,
    interp8_hpp_32x32_dag, interp8_hpp_64x32_dag, interp8_hpp_64x64_dag,
)
from interp8_emit import emit_interp8_hpp  # noqa: E402
from kernel_manifest import load_manifest  # noqa: E402

SHAPES = {
    "interp8": interp8_hpp_8x8_dag,
    "interp8-8x16": interp8_hpp_8x16_dag,
    "interp8-16x8": interp8_hpp_16x8_dag,
    "interp8-16": interp8_hpp_16x16_dag,
    "interp8-16x32": interp8_hpp_16x32_dag,
    "interp8-32x16": interp8_hpp_32x16_dag,
    "interp8-32": interp8_hpp_32x32_dag,
    "interp8-64x32": interp8_hpp_64x32_dag,
    "interp8-64x64": interp8_hpp_64x64_dag,
}


def main():
    want = set(sys.argv[1:]) or set(SHAPES)
    for kernel, dag in SHAPES.items():
        if kernel not in want:
            continue
        sym = load_manifest(kernel)["candidate"]["symbol"]
        ops = dag()
        src = emit_interp8_hpp(ops, func_name=sym)
        out = os.path.join(ROOT, "kernels", kernel, "candidates",
                           "best_ir.cpp")
        os.makedirs(os.path.dirname(out), exist_ok=True)
        with open(out, "w") as f:
            f.write(src)
        print("%-14s %-34s ops=%-6d lines=%d -> %s"
              % (kernel, sym, len(ops), src.count("\n"),
                 os.path.relpath(out, ROOT)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
