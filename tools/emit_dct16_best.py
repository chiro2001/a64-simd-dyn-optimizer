#!/usr/bin/env python3
"""Emit the golden-gated best DCT16 candidate source.

Best found by tools/search_dct16_axes.py (2026-08-16): quarter+oddq =
895 fused_uop (upstream-exact, 0 mismatch, 0 scatter, TestBenchLite
5-seed PASS).  This regenerates that exact source.

Usage:
  python3 tools/emit_dct16_best.py [--out PATH]
"""

import argparse
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for sub in ("optimizer/ir", "optimizer/analysis", "tools"):
    sys.path.insert(0, os.path.join(ROOT, sub))

from dct16_op_emit import emit_acle  # noqa: E402


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(
        ROOT, "kernels/dct16/candidates/best_sve2_op895.cpp"))
    args = ap.parse_args()
    src = emit_acle(func_name="dynopt_dct16_sve2_shared",
                    pass1="quarter", pass2="odd-quarter")
    header = ("// Best golden-gated DCT16 candidate (2026-08-16):\n"
              "// quarter+oddq -> 895 fused_uop, 0 mismatch, 0 scatter,\n"
              "// TestBenchLite 5-seed PASS (upstream-exact)\n"
              "// Regenerate with tools/emit_dct16_best.py\n\n")
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w") as f:
        f.write(header + src)
    print("wrote %s (%d bytes)" % (args.out, len(src) + len(header)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
