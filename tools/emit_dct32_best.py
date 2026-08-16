#!/usr/bin/env python3
"""Emit the current golden-gated best DCT32 candidate source.

Best found by tools/search_op_axes.py (2026-08-16): r16k2ep+si =
4100 fused_uop, TestBenchLite 5-seed PASS.  This script regenerates that
exact source from the plan flags so the artifact is reproducible.

Usage:
  python3 tools/emit_dct32_best.py [--out PATH]
"""

import argparse
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for sub in ("optimizer/ir", "optimizer/analysis", "tools"):
    sys.path.insert(0, os.path.join(ROOT, sub))

from dct32_op_emit import emit_from_plan  # noqa: E402
from layout_ir import dct32_v31_plan  # noqa: E402


BEST_FLAGS = {
    "legacy_ex": 1,
    "legacy_k4": 1,
    "k0_even_sve": 1,
    "odd_from_k0packs": 1,
    "row_group": 16,
    "k2k4_from_packs": 1,
    "k0_epack": 1,
    "sdot_indexed": 1,
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(
        ROOT, "kernels/dct32/candidates/best_sve2_op4100.cpp"))
    ap.add_argument("--base", action="store_true",
                    help="emit the upstream-exact op-backend baseline "
                         "(8114 fused_uop, 20k diff 0) instead of the "
                         "legacy golden-gated best")
    args = ap.parse_args()
    p = dct32_v31_plan()
    flags = {} if args.base else BEST_FLAGS
    p.lowering.update(flags)
    src = emit_from_plan(p, "dynopt_dct32_sve2_shared")
    if args.base:
        out = os.path.join(ROOT, "kernels/dct32/candidates/"
                           "best_sve2_opbase.cpp")
        header = ("// Upstream-exact op-backend DCT32 baseline "
                  "(2026-08-16):\n"
                  "// 8114 fused_uop, 20k diff 0 (injectable, bit-exact "
                  "safe)\n"
                  "// Regenerate with tools/emit_dct32_best.py --base\n\n")
    else:
        out = args.out
        header = ("// Best golden-gated DCT32 candidate (2026-08-16):\n"
                  "// flags %r -> 4100 fused_uop, TestBenchLite 5-seed "
                  "PASS\n"
                  "// Regenerate with tools/emit_dct32_best.py\n\n"
                  % (BEST_FLAGS,))
    os.makedirs(os.path.dirname(out), exist_ok=True)
    with open(out, "w") as f:
        f.write(header + src)
    print("wrote %s (%d bytes)" % (out, len(src) + len(header)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
