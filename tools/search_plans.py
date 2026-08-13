#!/usr/bin/env python3
"""Rewrite-driven DCT32 plan search (round-0012 P1, increment 4).

Enumerates valid subsets of the atomic rewrites from the canonical spec
plan, lowers each to source through emit_grouped (NO `layout` preset, no
composite-template selector), and checks that the resulting candidate set
reproduces the P0 axis search exactly -- including the v3.1 best of 3962
fused_uop (upstream-exact, zero scatter).

This is the "search from rewrites" version of the E1 blind-rediscovery
acceptance: the search space is defined by rewrites, not by manifest
layout strings.
"""

import hashlib
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from layout_ir import lower, verify_layout  # noqa: E402
from rewrites_dct32 import (  # noqa: E402
    assign_output_lanes,
    batch_round_narrow_store,
    dct32_spec_plan,
    derive_constant_map,
    k2_pass1_slice,
    segment_dot,
)


def apply(plan, rewrites):
    for r in rewrites:
        plan, _ = r(plan)
    return plan


def all_plans():
    """18 valid rewrite subsets: 2 without output-lane ownership, 16 with."""
    with_assign = [assign_output_lanes]
    optional = (
        ("segment", segment_dot),
        ("narrow4", lambda p: batch_round_narrow_store(p, 4)),
        ("derived", derive_constant_map),
        ("k2", k2_pass1_slice),
    )
    plans = []
    base = dct32_spec_plan()
    # without assign: no-op and narrow-only (source-identical for row-reduce)
    plans.append(("spec", base, ()))
    plans.append(("spec+narrow4", apply(base, (optional[1][1],)),
                  (optional[1][1],)))
    # with assign: all 16 subsets of the four optional rewrites
    from itertools import combinations
    for mask in range(1 << len(optional)):
        chosen = [f for i, (_, f) in enumerate(optional) if mask & (1 << i)]
        rewrites = list(with_assign) + chosen
        tag = "assign+" + "+".join(n for i, (n, _) in enumerate(optional)
                                   if mask & (1 << i))
        plans.append((tag, apply(base, rewrites), tuple(rewrites)))
    return plans


def p0_index(outdir):
    """sha256(<tag>.cpp) -> (tag, counts) from the P0 layout search."""
    idx = {}
    results = json.load(open(os.path.join(outdir, "results.json")))
    for r in results:
        path = os.path.join(outdir, r["tag"] + ".cpp")
        if not os.path.exists(path):
            continue
        h = hashlib.sha256(open(path, "rb").read()).hexdigest()
        idx[h] = (r["tag"], r.get("counts", {}))
    return idx


def main():
    outdir = os.path.join(ROOT,
                          "experiments/m30-dct32-search/layout-search")
    if not os.path.exists(os.path.join(outdir, "results.json")):
        print("missing P0 results; run search_sve2_layouts.py --kernel dct32 "
              "first", file=sys.stderr)
        return 2
    index = p0_index(outdir)
    cc = ["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
          "-march=armv8.2-a+sve2", "-c"]

    rows = []
    seen_hash = set()
    compiled = set()
    missing = []
    plans = all_plans()
    for tag, plan, rewrites in plans:
        ok, why = verify_layout(plan)
        if not ok:
            missing.append((tag, "verify_layout: " + why))
            continue
        src = lower(plan)
        h = hashlib.sha256(src.encode()).hexdigest()
        if h not in compiled:
            compiled.add(h)
            tmp = "/tmp/plan-%s.cpp" % tag.replace("+", "_")
            with open(tmp, "w") as f:
                f.write(src)
            p = subprocess.run(cc + [tmp, "-o", tmp[:-4] + ".o"],
                               stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT, text=True)
            if p.returncode != 0:
                missing.append((tag, "compile failed:\n" + p.stdout))
                continue
        ent = index.get(h)
        if ent is None:
            missing.append((tag, "no matching P0 candidate (source hash)"))
            continue
        if h in seen_hash:
            continue
        seen_hash.add(h)
        rows.append((ent[0], ent[1].get("vector_fused_uop"),
                     ent[1].get("scatter_gather", 0),
                     ent[1].get("stack_vector", 0), h[:12], tag))

    rows.sort(key=lambda r: r[1])
    print("%-74s %7s %4s %4s" %
          ("p0 tag", "fused", "sg", "stk"))
    for tag, fu, sg, stk, h, plan_tag in rows:
        print("%-74s %7s %4s %4s  %s" % (tag, fu, sg, stk, h))
    if missing:
        print("\nmissing/failed plans:")
        for tag, why in missing:
            print("  %-28s %s" % (tag, why))
        return 1

    best = rows[0]
    if best[1] != 3962 or best[2] != 0:
        print("FAIL: rewrite search best must be 3962 fused_uop, zero "
              "scatter; got %r" % (best,))
        return 1
    print("\nrewrite-driven search: %d plans -> %d unique candidates, "
          "best=%s (fused_uop %s)"
          % (len(plans), len(rows), best[0], best[1]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
