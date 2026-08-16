#!/usr/bin/env python3
"""Canonical-dot-driven DCT32 lowering enumeration (dot search axis).

Builds the v3.1 plan, canonicalizes its op DAG to typed `dot` nodes,
selects lowerings under a contract family, derives the emitter flags
(legacy_ex) and measures fused_uop for each choice via the proven
search_plans measurement chain (QEMU + cross g++).

Usage:
  python3 tools/search_dot_lowerings.py
"""

import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for sub in ("optimizer/ir", "optimizer/analysis", "tools"):
    sys.path.insert(0, os.path.join(ROOT, sub))

from dct32_op_ir import lower_plan_to_ops  # noqa: E402
from dct32_rewrites import apply_rewrites as apply32  # noqa: E402
from dot_ir import (  # noqa: E402
    derive_dot_lowering_flags,
    dot_summary,
    select_dot_lowerings,
)
from layout_ir import lower, verify_layout  # noqa: E402
from layout_verify import check_source  # noqa: E402
from layout_ir import dct32_v31_plan  # noqa: E402
from kernel_manifest import load_manifest  # noqa: E402
from search_plans import measure  # noqa: E402
from gen_verify import generate as gen_verify  # noqa: E402


def main():
    manifest = load_manifest("dct32")
    workdir = "/tmp/dct32-dot-search"
    os.makedirs(workdir, exist_ok=True)
    verify_src = os.path.join(workdir, "verify_generated.cpp")
    with open(verify_src, "w") as f:
        f.write(gen_verify(manifest))

    plan = dct32_v31_plan()
    ok, why = verify_layout(plan)
    if not ok:
        print("semantic FAIL: %s" % why)
        return 1

    ops = lower_plan_to_ops(plan)
    print("canonical dots:", dot_summary(ops))

    # Canonical-driven grid: legacy family x narrow_batch x constant
    # layout x acc_split.  Legacy flags are derived from the canonical
    # dot selection (select_dot_lowerings -> derive_dot_lowering_flags).
    grid = []
    for legacy in ("off", "ex", "ex+k4"):
        for narrow in (1, 4):
            for const in ("canonical", "derived-replicated"):
                for acc in (1, 2):
                    grid.append((legacy, narrow, const, acc))

    rows = []
    for idx, (legacy, narrow, const, acc) in enumerate(grid):
        contract = ("legacy-internal-exact" if legacy != "off"
                    else "upstream-exact")
        dag = ops
        if legacy in ("ex", "ex+k4"):
            rew = ["legacy_k2"]
            if legacy == "ex+k4":
                rew.append("legacy_k4")
            dag = apply32(ops, rew)
        canon, _ = select_dot_lowerings(dag, "sve2", contract, sve2=True)
        flags = derive_dot_lowering_flags(canon)
        if legacy == "off":
            flags = {"legacy_ex": 0, "legacy_k4": 0}
        p = dct32_v31_plan()
        p.lowering["legacy_ex"] = flags["legacy_ex"]
        p.lowering["legacy_k4"] = flags["legacy_k4"]
        p.lowering["narrow_batch"] = narrow
        p.lowering["constant_layout"] = const
        p.lowering["acc_split"] = acc
        src = lower(p)
        src_path = os.path.join(workdir, "dot-%02d.cpp" % idx)
        with open(src_path, "w") as f:
            f.write(src)
        passed, why2, counts = measure(
            manifest, verify_src, src_path, workdir, "dot-%02d" % idx,
            allow_mismatch=(legacy != "off"))
        if not passed:
            rows.append((legacy, narrow, const, acc, None, why2))
            continue
        rows.append((legacy, narrow, const, acc,
                     counts.get("vector_fused_uop"),
                     counts.get("scatter_gather", 0)))

    print("\n%-8s %5s %-18s %4s %8s %6s" %
          ("legacy", "narrow", "const", "acc", "fused_uop", "sg"))
    for legacy, narrow, const, acc, fu, mis in sorted(
            rows, key=lambda r: (r[4] is None, r[4] or 10 ** 9)):
        print("%-8s %5s %-18s %4s %8s %6s" %
              (legacy, narrow, const, acc, fu, mis))
    return 0


if __name__ == "__main__":
    sys.exit(main())
