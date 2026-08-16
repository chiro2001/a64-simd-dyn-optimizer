#!/usr/bin/env python3
"""Op-backend structural-axis enumeration for DCT32 (toward 4827).

The grouped emitter grid is exhausted (best 7820); the op-level backend
(dct32_op_emit.emit_from_plan) exposes structural axes such as
k0_even_sve / k0_shared_mul / sdot_indexed / odd_from_k0packs.  This
script emits each variant through the op backend and measures it with
the same QEMU differential + true-dynamic chain (custom trace ranges for
op_pass_4 -> dynopt_dct32_sve2_shared).

Usage:
  python3 tools/search_op_axes.py
"""

import argparse
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for sub in ("optimizer/ir", "optimizer/analysis", "tools"):
    sys.path.insert(0, os.path.join(ROOT, sub))

from dct32_op_emit import emit_from_plan  # noqa: E402
from kernel_manifest import load_manifest  # noqa: E402
from layout_ir import dct32_v31_plan  # noqa: E402
from search_plans import measure  # noqa: E402
from gen_verify import generate as gen_verify  # noqa: E402


VARIANTS = [
    ("base", {}),
    ("legacy", {"legacy_ex": 1, "legacy_k4": 1}),
    ("k0even", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1}),
    ("k0shared", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "k0_shared_mul": 1}),
    ("sdoti", {"legacy_ex": 1, "legacy_k4": 1, "sdot_indexed": 1}),
    ("oddpack", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                 "odd_from_k0packs": 1}),
    ("odd+k0m8", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "odd_from_k0packs": 1, "k0_merge8": 1}),
    ("odd+k0ep", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "odd_from_k0packs": 1, "k0_epack": 1}),
    ("odd+k2k4pk", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1, "k2k4_from_packs": 1}),
    ("odd+zip", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                 "odd_from_k0packs": 1, "slice_kind": "zip"}),
    ("odd+rg8", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                 "odd_from_k0packs": 1, "row_group": 8}),
    ("odd+rg16", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "odd_from_k0packs": 1, "row_group": 16}),
    ("odd+tblzip", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1,
                    "rewrites": ["tbl2_to_zip"]}),
    ("odd+narrow8", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                     "odd_from_k0packs": 1,
                     "rewrites": ["merge_narrow8"]}),
    ("odd+k0m8+k2k4", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                       "odd_from_k0packs": 1, "k0_merge8": 1,
                       "k2k4_from_packs": 1}),
    ("odd+canon", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                   "odd_from_k0packs": 1,
                   "constant_layout": "canonical"}),
    ("rg16+k0sm", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                   "odd_from_k0packs": 1, "row_group": 16,
                   "k0_shared_mul": 1}),
    ("rg16+sdoti", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1, "row_group": 16,
                    "sdot_indexed": 1}),
    ("rg16+k2k4", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                   "odd_from_k0packs": 1, "row_group": 16,
                   "k2k4_from_packs": 1}),
    ("rg16+tblzip", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                     "odd_from_k0packs": 1, "row_group": 16,
                     "rewrites": ["tbl2_to_zip"]}),
    ("rg16+acc2", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                   "odd_from_k0packs": 1, "row_group": 16,
                   "acc_split": 2}),
    ("rg16+canon", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1, "row_group": 16,
                    "constant_layout": "canonical"}),
    ("rg16+narrow1", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                      "odd_from_k0packs": 1, "row_group": 16,
                      "narrow_batch": 1}),
    ("rg16+k0m8", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                   "odd_from_k0packs": 1, "row_group": 16,
                   "k0_merge8": 1}),
    ("rg16+k0ep", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                   "odd_from_k0packs": 1, "row_group": 16,
                   "k0_epack": 1}),
    ("r16k2+sm", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "odd_from_k0packs": 1, "row_group": 16,
                  "k2k4_from_packs": 1, "k0_shared_mul": 1}),
    ("r16k2+si", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "odd_from_k0packs": 1, "row_group": 16,
                  "k2k4_from_packs": 1, "sdot_indexed": 1}),
    ("r16k2+m8", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "odd_from_k0packs": 1, "row_group": 16,
                  "k2k4_from_packs": 1, "k0_merge8": 1}),
    ("r16k2+ep", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                  "odd_from_k0packs": 1, "row_group": 16,
                  "k2k4_from_packs": 1, "k0_epack": 1}),
    ("r16k2+acc2", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1, "row_group": 16,
                    "k2k4_from_packs": 1, "acc_split": 2}),
    ("r16k2+tblzip", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                      "odd_from_k0packs": 1, "row_group": 16,
                      "k2k4_from_packs": 1,
                      "rewrites": ["tbl2_to_zip"]}),
    ("r16k2ep+sm", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1, "row_group": 16,
                    "k2k4_from_packs": 1, "k0_epack": 1,
                    "k0_shared_mul": 1}),
    ("r16k2ep+m8", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1, "row_group": 16,
                    "k2k4_from_packs": 1, "k0_epack": 1,
                    "k0_merge8": 1}),
    ("r16k2ep+si", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                    "odd_from_k0packs": 1, "row_group": 16,
                    "k2k4_from_packs": 1, "k0_epack": 1,
                    "sdot_indexed": 1}),
    ("r16k2ep+acc2", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                      "odd_from_k0packs": 1, "row_group": 16,
                      "k2k4_from_packs": 1, "k0_epack": 1,
                      "acc_split": 2}),
    ("r16k2ep+tblzip", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                        "odd_from_k0packs": 1, "row_group": 16,
                        "k2k4_from_packs": 1, "k0_epack": 1,
                        "rewrites": ["tbl2_to_zip"]}),
    ("r16k2epsi+sm", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                      "odd_from_k0packs": 1, "row_group": 16,
                      "k2k4_from_packs": 1, "k0_epack": 1,
                      "sdot_indexed": 1, "k0_shared_mul": 1}),
    ("r16k2epsi+m8", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                      "odd_from_k0packs": 1, "row_group": 16,
                      "k2k4_from_packs": 1, "k0_epack": 1,
                      "sdot_indexed": 1, "k0_merge8": 1}),
    ("r16k2epsi+acc2", {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1,
                        "odd_from_k0packs": 1, "row_group": 16,
                        "k2k4_from_packs": 1, "k0_epack": 1,
                        "sdot_indexed": 1, "acc_split": 2}),
    ("r16k2epsi+tblzip", {"legacy_ex": 1, "legacy_k4": 1,
                          "k0_even_sve": 1, "odd_from_k0packs": 1,
                          "row_group": 16, "k2k4_from_packs": 1,
                          "k0_epack": 1, "sdot_indexed": 1,
                          "rewrites": ["tbl2_to_zip"]}),
    ("r16k2epsi+canon", {"legacy_ex": 1, "legacy_k4": 1,
                         "k0_even_sve": 1, "odd_from_k0packs": 1,
                         "row_group": 16, "k2k4_from_packs": 1,
                         "k0_epack": 1, "sdot_indexed": 1,
                         "constant_layout": "canonical"}),
]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--vq", type=int, default=2,
                    help="QEMU sve-max-vq (2=VL256, 1=VL128)")
    args = ap.parse_args()
    manifest = load_manifest("dct32")
    if args.vq == 1:
        manifest["vl_bytes"] = 16
    workdir = "/tmp/dct32-op-axes"
    os.makedirs(workdir, exist_ok=True)
    verify_src = os.path.join(workdir, "verify_generated.cpp")
    with open(verify_src, "w") as f:
        f.write(gen_verify(manifest))

    rows = []
    for tag, extra in VARIANTS:
        p = dct32_v31_plan()
        p.lowering.update(extra)
        try:
            src = emit_from_plan(p, "dynopt_dct32_sve2_shared")
        except Exception as e:
            rows.append((tag, "emit-fail", str(e)[:80]))
            continue
        src_path = os.path.join(workdir, "op-%s.cpp" % tag)
        with open(src_path, "w") as f:
            f.write(src)
        passed, why, counts = measure(
            manifest, verify_src, src_path, workdir, "op-%s" % tag,
            allow_mismatch=True,
            range_start_syms=["_ZL9op_pass_4PKsPsl"],
            range_end_sym="dynopt_dct32_sve2_shared",
            qemu_vq=args.vq)
        if not passed:
            rows.append((tag, "measure-fail", why))
            continue
        rows.append((tag, counts.get("vector_fused_uop"),
                     counts.get("scatter_gather", 0), why))

    print("\n%-10s %8s %6s %6s" % ("variant", "fused_uop", "sg", "mism"))
    for row in sorted(rows, key=lambda r: (isinstance(r[1], str),
                                           r[1] if isinstance(r[1], int)
                                           else 10 ** 9)):
        if isinstance(row[1], int):
            print("%-10s %8d %6s %6s" % (row[0], row[1], row[2], row[3]))
        else:
            print("%-10s %-8s %s" % (row[0], row[1], row[2]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
