#!/usr/bin/env python3
"""Canonical op-axis search for DCT16 (same loop as DCT32).

Enumerates dct16 op-backend variants (pass1 per-row/quarter, pass2
upstream/odd-quarter, legacy/even_sve) through the same QEMU differential
+ true-dynamic measurement chain used by search_op_axes.py.

Usage:
  python3 tools/search_dct16_axes.py
"""

import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for sub in ("optimizer/ir", "optimizer/analysis", "tools"):
    sys.path.insert(0, os.path.join(ROOT, sub))

from dct16_op_emit import emit_acle  # noqa: E402
from kernel_manifest import load_manifest  # noqa: E402
from search_plans import measure  # noqa: E402
from gen_verify import generate as gen_verify  # noqa: E402


VARIANTS = [
    ("perrow+upstream", dict(pass1="per-row", pass2="upstream")),
    ("quarter+upstream", dict(pass1="quarter", pass2="upstream")),
    ("perrow+oddq", dict(pass1="per-row", pass2="odd-quarter")),
    ("quarter+oddq", dict(pass1="quarter", pass2="odd-quarter")),
    ("legacy", dict(pass1="quarter", pass2="odd-quarter", legacy=True)),
    ("legacy+sve", dict(pass1="quarter", pass2="odd-quarter",
                        legacy=True, even_sve=True)),
    ("perrow+legacy+sve", dict(pass1="per-row", pass2="odd-quarter",
                               legacy=True, even_sve=True)),
    ("q+k4+m16", dict(pass1="quarter", pass1_k_tile=4, pass2="odd-quarter",
                      store_merge16=True)),
    ("q2", dict(pass1="quarter", pass1_k_tile=2, pass2="odd-quarter")),
    ("q4+k2", dict(pass1="quarter", pass1_k_tile=4, pass2="odd-quarter",
                   pass2_k_tile=2)),
    ("q4+nozip", dict(pass1="quarter", pass1_k_tile=4, pass1_pack_zip=False,
                      pass2="odd-quarter")),
    ("q4+p2nozip", dict(pass1="quarter", pass1_k_tile=4,
                        pass2="odd-quarter", pass2_pack_zip=False)),
    ("q4+noef", dict(pass1="quarter", pass1_k_tile=4, pass1_even_factor=False,
                     pass2="odd-quarter")),
    ("q4+nom16", dict(pass1="quarter", pass1_k_tile=4,
                      pass2="odd-quarter", store_merge16=False)),
    ("q2+legacy+sve", dict(pass1="quarter", pass1_k_tile=2,
                           pass2="odd-quarter", legacy=True,
                           even_sve=True)),
    ("q4+k2+legacy+sve", dict(pass1="quarter", pass1_k_tile=4,
                              pass2="odd-quarter", pass2_k_tile=2,
                              legacy=True, even_sve=True)),
]


def main():
    manifest = load_manifest("dct16")
    workdir = "/tmp/dct16-op-axes"
    os.makedirs(workdir, exist_ok=True)
    verify_src = os.path.join(workdir, "verify_generated.cpp")
    with open(verify_src, "w") as f:
        f.write(gen_verify(manifest))

    rows = []
    for tag, kw in VARIANTS:
        try:
            src = emit_acle(func_name="dynopt_dct16_sve2_shared", **kw)
        except Exception as e:
            rows.append((tag, "emit-fail", str(e)[:80]))
            continue
        src_path = os.path.join(workdir, "d16-%s.cpp" % tag)
        with open(src_path, "w") as f:
            f.write(src)
        passed, why, counts = measure(
            manifest, verify_src, src_path, workdir, "d16-%s" % tag,
            allow_mismatch=kw.get("legacy", False),
            range_start_syms=["_ZL9op_pass_4PKsPsl"],
            range_end_sym="dynopt_dct16_sve2_shared",
            cxx_flags_extra="-fno-tree-pre")
        if not passed:
            rows.append((tag, "measure-fail", why))
            continue
        rows.append((tag, counts.get("vector_fused_uop"),
                     counts.get("scatter_gather", 0), why))

    print("\n%-18s %8s %6s %6s" % ("variant", "fused_uop", "sg", "mism"))
    for row in sorted(rows, key=lambda r: (isinstance(r[1], str),
                                           r[1] if isinstance(r[1], int)
                                           else 10 ** 9)):
        if isinstance(row[1], int):
            print("%-18s %8d %6s %6s" % (row[0], row[1], row[2], row[3]))
        else:
            print("%-18s %-8s %s" % (row[0], row[1], row[2]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
