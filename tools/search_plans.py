#!/usr/bin/env python3
"""Rewrite-driven DCT32 plan search (round-0012 P1/P2).

Enumerates valid subsets of the atomic rewrites from the canonical spec
plan, lowers each to source through emit_grouped (NO `layout` preset, no
composite-template selector), and MEASURES each unique candidate
end-to-end: compile -> 20k upstream differential -> true-dynamic trace.
The v3.1 best must reappear at 3962 fused_uop (upstream-exact, zero
scatter).

Layers (P2): semantic (verify_layout) -> layout (canonical-key dedup) ->
lowering (source-hash dedup) -> measurement (differential + trace).
"""

import hashlib
import json
import os
import subprocess
import sys
from collections import defaultdict
from itertools import combinations

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "analysis"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from gen_verify import generate as gen_verify  # noqa: E402
from kernel_manifest import load_manifest, repo_path  # noqa: E402
from layout_ir import lower, verify_layout  # noqa: E402
from layout_verify import check_source  # noqa: E402
from rewrites_dct32 import (  # noqa: E402
    assign_output_lanes,
    batch_round_narrow_store,
    dct32_spec_plan,
    derive_constant_map,
    k2_pass1_slice,
    segment_dot,
)
from search_sve2_layouts import QEMU, run, symbol_range, true_dynamic  # noqa


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
    plans.append(("spec", base, ()))
    plans.append(("spec+narrow4", apply(base, (optional[1][1],)),
                  (optional[1][1],)))
    for mask in range(1 << len(optional)):
        chosen = [f for i, (_, f) in enumerate(optional) if mask & (1 << i)]
        rewrites = list(with_assign) + chosen
        tag = "assign+" + "+".join(n for i, (n, _) in enumerate(optional)
                                   if mask & (1 << i))
        plans.append((tag, apply(base, rewrites), tuple(rewrites)))
    return plans


def measure(manifest, verify_src, src, workdir, tag):
    """Compile -> 20k differential -> true-dynamic counts. Returns
    (passed, mismatches, counts) or (False, reason, None)."""
    obj = os.path.join(workdir, tag + ".o")
    c = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
             "-march=armv8.2-a+sve2", "-c", src, "-o", obj])
    if c.returncode != 0:
        return False, "compile failed", None
    verify = os.path.join(workdir, tag + "-verify")
    v = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
             "-march=armv8.2-a+sve2", verify_src, obj,
             "-Wl,--start-group",
             repo_path(manifest, manifest["reference"]["lib"]),
             "-Wl,--end-group", "-lpthread", "-ldl", "-o", verify])
    if v.returncode != 0:
        return False, "verify link failed", None
    r = run(QEMU + [verify, "20000"])
    if "mismatches=" not in r.stdout:
        return False, "verify produced no mismatch line", None
    mism = 0
    try:
        mism = int(r.stdout.split("mismatches=", 1)[1].split()[0])
    except (ValueError, IndexError):
        return False, "unparseable mismatch line", None
    if r.returncode != 0 or mism != 0:
        return False, "mismatches=%d" % mism, None

    driver = os.path.join(workdir, tag + "-trace-driver")
    d = run(["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
             "-std=c++11",
             repo_path(manifest,
                       manifest["candidate"]["trace_driver_src"]),
             obj, "-o", driver])
    if d.returncode != 0:
        return False, "trace driver link failed", None
    start_syms = manifest["candidate"].get(
        "range_start", manifest["candidate"]["symbol"])
    if isinstance(start_syms, str):
        start_syms = [start_syms]
    rng = None
    for start_sym in start_syms:
        rng = symbol_range(driver, start_sym)
        if rng:
            break
    if rng is None:
        return False, "no trace range", None
    counts = true_dynamic(driver, rng[0], rng[1],
                          os.path.join(workdir, tag + "-trace.log"))
    if counts is None:
        return False, "trace failed", None
    return True, mism, counts


def main():
    manifest = load_manifest("dct32")
    workdir = "/tmp/dct32-plan-search"
    os.makedirs(workdir, exist_ok=True)
    verify_src = os.path.join(workdir, "verify_generated.cpp")
    with open(verify_src, "w") as f:
        f.write(gen_verify(manifest))

    # layer 1: semantic -- every rewrite plan must pass verify_layout
    plans = all_plans()
    semantic = []
    for tag, plan, rewrites in plans:
        ok, why = verify_layout(plan)
        if not ok:
            print("semantic FAIL %s: %s" % (tag, why))
            return 1
        semantic.append((tag, plan, rewrites))

    # layer 2: layout -- dedup by canonical plan key before codegen
    by_key = {}
    for tag, plan, rewrites in semantic:
        by_key.setdefault(plan.canonical_key(), (tag, plan, rewrites))
    layout_unique = list(by_key.values())

    # layer 3: lowering -- dedup by generated source hash
    by_src = {}
    for tag, plan, rewrites in layout_unique:
        src = lower(plan)
        ok, rep = check_source(plan, src)
        if not ok:
            print("source-proof FAIL %s: %r" % (tag, rep["mismatches"]))
            return 1
        h = hashlib.sha256(src.encode()).hexdigest()
        if h not in by_src:
            by_src[h] = (tag, plan, src)

    # layer 4: measurement -- compile/verify/trace each unique source
    rows = []
    failures = []
    for i, (h, (tag, plan, src)) in enumerate(by_src.items()):
        src_path = os.path.join(workdir, "plan-%02d-%s.cpp" % (i, tag))
        with open(src_path, "w") as f:
            f.write(src)
        passed, why, counts = measure(manifest, verify_src, src_path,
                                      workdir, "plan-%02d" % i)
        if not passed:
            failures.append((tag, why))
            continue
        rows.append((tag, counts.get("vector_fused_uop"),
                     counts.get("scatter_gather", 0),
                     counts.get("stack_vector", 0), h[:12]))

    if failures:
        print("measurement failures:")
        for tag, why in failures:
            print("  %-36s %s" % (tag, why))
        return 1

    rows.sort(key=lambda r: r[1])
    print("%-78s %7s %4s %4s" % ("plan tag", "fused", "sg", "stk"))
    for tag, fu, sg, stk, h in rows:
        print("%-78s %7s %4s %4s  %s" % (tag, fu, sg, stk, h))

    best = rows[0]
    if best[1] != 3962 or best[2] != 0:
        print("FAIL: rewrite search best must be 3962 fused_uop, zero "
              "scatter; got %r" % (best,))
        return 1
    print("\nlayers: semantic=%d plans -> layout=%d canonical plans -> "
          "lowering=%d unique sources -> measured=%d"
          % (len(semantic), len(layout_unique), len(by_src), len(rows)))
    print("rewrite-driven search: best=%s (fused_uop %s)" % (best[0],
                                                             best[1]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
