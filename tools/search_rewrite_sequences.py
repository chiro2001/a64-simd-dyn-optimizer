#!/usr/bin/env python3
"""Enumerate op-level rewrite sequences (up to 4 steps).

Kernels:
  - dct32: base = dct32_v31_plan() with row4 / tbl2 / upstream-exact;
    sequences applied via dct32_op_emit.emit_from_plan(rewrites=[...]).
  - dct16: base = manifest combo quarter + odd-quarter + tbl2 packs +
    store_merge16=0; sequences applied via dct16_op_emit.emit_from_combo
    (rewrites=[...]).

Each sequence is measured end-to-end (compile -> 20k diff -> true-dynamic
fused_uop).
"""

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from dataclasses import replace  # noqa: E402
from gen_verify import generate as gen_verify  # noqa: E402
from kernel_manifest import load_manifest  # noqa: E402
from search_sve2_layouts import (QEMU, run, symbol_range, true_dynamic,
                                 run_dynamic_mca)  # noqa: E402


KERNELS = {
    "dct32": {
        "out": os.path.join(ROOT, "experiments", "m30-dct32-search",
                            "layout-search-rwseq"),
        "rewrites": ["none", "tbl2_to_zip", "legacy_k2", "legacy_k4",
                     "merge_narrow8", "k0_even_sve"],
        "manifest": "dct32",
        "range_start": "_ZL9op_pass_4PKsPsl",
        "range_end": "dynopt_dct32_sve2_shared",
        "driver": "kernels/dct32/trace_driver.cpp",
        "ref_lib": "build/x265-8-clang-sve/libx265.a",
    },
    "dct16": {
        "out": os.path.join(ROOT, "experiments", "m30-dct16-search",
                            "layout-search-rwseq"),
        "rewrites": ["none", "tbl2_to_zip", "merge_narrow8",
                     "legacy_even_sve"],
        "manifest": "dct16",
        "range_start": "_ZL9op_pass_4PKsPsl",
        "range_end": "dynopt_dct16_sve2_shared",
        "driver": "kernels/dct16/shared_trace_driver.cpp",
        "ref_lib": "build/x265-8-clang-sve/libx265.a",
        # base combo: tbl2 packs + store_merge16=0 (rewrites improve both)
        "combo": {"pass1": "quarter", "pass1_k_tile": 4,
                  "pass1_pack_zip": 1, "pass1_even_factor": 1,
                  "pass2": "odd-quarter", "pass2_k_tile": 2,
                  "pass2_pack_zip": 0, "store_merge16": 1,
                  "legacy_semantics": 0, "even_sve": 0},
    },
}


def prune_sequence(kernel, seq):
    """Return a prune reason if the rewrite sequence is provably redundant
    or invalid, else None.

    Rules are validated against the full up-to-four enumeration universe
    (source-hash coverage 100%, 2026-08-14):
      dct32: legacy_k2 must precede legacy_k4 when both present;
             merge_narrow8 at most once;
             k0_even_sve requires legacy_k2 and legacy_k4 before it.
      dct16: tbl2_to_zip and merge_narrow8 at most once (idempotent;
             repeated application produces identical source).
    """
    if seq.count("merge_narrow8") > 1:
        return "merge>1"
    i2 = seq.index("legacy_k2") if "legacy_k2" in seq else None
    i4 = seq.index("legacy_k4") if "legacy_k4" in seq else None
    if i2 is not None and i4 is not None and i4 < i2:
        return "k4<k2"
    if kernel == "dct32" and "k0_even_sve" in seq:
        i0 = seq.index("k0_even_sve")
        if not (i2 is not None and i2 < i0
                and i4 is not None and i4 < i0):
            return "k0 prereq"
    if kernel == "dct16" and seq.count("tbl2_to_zip") > 1:
        return "tbl2>1"
    return None


def emit_seq(kernel, seq):
    """Return generated source for a rewrite sequence on the kernel base."""
    if kernel == "dct32":
        from dct32_op_emit import emit_from_plan  # noqa: E402
        from layout_ir import dct32_v31_plan  # noqa: E402
        base = dct32_v31_plan()
        lo = dict(base.lowering)
        lo["slice_kind"] = "tbl2"
        lo.pop("legacy_ex", None)
        lo.pop("legacy_k4", None)
        lo.pop("row_group", None)
        base = replace(base, lowering=lo)
        return emit_from_plan(replace(base, lowering=dict(lo,
                                                          rewrites=seq)),
                              func_name="dynopt_dct32_sve2_shared")
    if kernel == "dct16":
        from dct16_op_emit import emit_from_combo  # noqa: E402
        return emit_from_combo(dict(KERNELS["dct16"]["combo"]),
                               rewrites=seq,
                               func_name="dynopt_dct16_sve2_shared")
    raise ValueError(kernel)


def measure_rewrite_candidate(task):
    """Measure one rewrite sequence end-to-end. Module-level so it can be
    pickled by ProcessPoolExecutor.

    task = (cfg, verify_src, key, src, kernel, outdir,
            first_cases, full_cases)
    Returns (row, stage) with the same row schema as the serial loop.
    """
    cfg, verify_src, key, src, kernel, OUT, first_cases, full_cases = task
    h = hashlib.sha256(src.encode()).hexdigest()[:12]
    cpp = os.path.join(OUT, "seq_%s.cpp" % h)
    if not os.path.exists(cpp):
        open(cpp, "w").write(src)
    obj = os.path.join(OUT, "seq_%s.o" % h)
    if not os.path.exists(obj):
        try:
            c = run(["aarch64-linux-gnu-g++", "-O2", "-fno-tree-pre",
                     "-std=c++11", "-march=armv8.2-a+sve2",
                     "-c", cpp, "-o", obj], timeout=120)
        except subprocess.TimeoutExpired:
            return {"seq": key, "_h": h, "build": "TIMEOUT"}, "BUILD TIMEOUT"
        if c.returncode != 0:
            return {"seq": key, "_h": h, "build": "FAIL"}, "BUILD FAIL"
    verify = os.path.join(OUT, "seq_%s-verify" % h)
    if not os.path.exists(verify):
        try:
            v = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
                     "-march=armv8.2-a+sve2",
                     verify_src,
                     obj, "-Wl,--start-group",
                     os.path.join(ROOT, cfg["ref_lib"]),
                     "-Wl,--end-group", "-lpthread", "-ldl",
                     "-o", verify], timeout=120)
        except subprocess.TimeoutExpired:
            return {"seq": key, "_h": h, "build": "LINK_TIMEOUT"}, \
                "LINK TIMEOUT"
        if v.returncode != 0:
            return {"seq": key, "_h": h, "build": "LINK_FAIL"}, "LINK FAIL"
    legacy_seq = "legacy_even_sve" in key.split("|")
    strict = kernel == "dct16" and not legacy_seq

    def _run_verify(cases_arg):
        try:
            rr = run(QEMU + [verify, str(cases_arg)], timeout=180)
        except subprocess.TimeoutExpired:
            return None, -1, False
        mm = 0
        if "mismatches=" in rr.stdout:
            try:
                mm = int(rr.stdout.split("mismatches=", 1)[1].split()[0])
            except ValueError:
                mm = -1
        if strict:
            oo = rr.returncode == 0 and mm == 0
        else:
            bound = max(1, round(22528 * cases_arg / 20000))
            oo = rr.returncode in (0, 1) and 0 <= mm <= bound
        return rr, mm, oo

    r, mism, ok = _run_verify(first_cases)
    if r is None:
        return {"seq": key, "_h": h, "passed": False, "mism": -1,
                "timeout": True}, "VERIFY TIMEOUT"
    if not ok:
        gate = "short" if first_cases < full_cases else "full"
        return {"seq": key, "_h": h, "passed": False, "mism": mism,
                "gate": gate}, "VERIFY FAIL (%s)" % gate
    if full_cases != first_cases:
        r, mism, ok = _run_verify(full_cases)
        if r is None:
            return {"seq": key, "_h": h, "passed": False, "mism": -1,
                    "timeout": True}, "VERIFY TIMEOUT"
        if not ok:
            return {"seq": key, "_h": h, "passed": False, "mism": mism,
                    "gate": "full"}, "VERIFY FAIL (full)"
    driver = os.path.join(OUT, "seq_%s-driver" % h)
    if not os.path.exists(driver):
        try:
            d = run(["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
                     "-std=c++11",
                     os.path.join(ROOT, cfg["driver"]),
                     obj, "-o", driver], timeout=120)
        except subprocess.TimeoutExpired:
            return {"seq": key, "passed": True, "mism": mism, "_h": h,
                    "trace": "LINK_TIMEOUT"}, "DRIVER LINK TIMEOUT"
        if d.returncode != 0:
            return {"seq": key, "passed": True, "mism": mism, "_h": h,
                    "trace": "LINK_FAIL"}, "DRIVER LINK FAIL"
    rng = symbol_range(driver, cfg["range_start"])
    rng_end = symbol_range(driver, cfg["range_end"])
    if not rng or not rng_end:
        return {"seq": key, "passed": True, "mism": mism, "_h": h,
                "trace": "NO_RANGE"}, "NO RANGE"
    try:
        counts = true_dynamic(driver, rng[0], rng_end[1],
                              os.path.join(OUT, "seq_%s-trace.log" % h),
                              timeout=300)
    except subprocess.TimeoutExpired:
        return {"seq": key, "passed": True, "mism": mism, "_h": h,
                "trace": "TRACE_TIMEOUT"}, "TRACE TIMEOUT"
    if counts is None:
        return {"seq": key, "passed": True, "mism": mism, "_h": h,
                "trace": "FAIL"}, "TRACE FAIL"
    return {"seq": key, "passed": True, "mism": mism,
            "fused_uop": counts["vector_fused_uop"],
            "raw": counts["vector"],
            "movprfx": counts["movprfx"], "_h": h,
            "range": [hex(rng[0]), hex(rng_end[1])]}, "OK"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--kernel", choices=("dct32", "dct16"), default="dct32")
    ap.add_argument("--workers", type=int, default=1,
                    help="parallel worker processes (default 1 = serial, "
                         "identical results order)")
    ap.add_argument("--outdir", default=None,
                    help="result/artifact directory (default: the kernel's "
                         "layout-search-rwseq dir)")
    ap.add_argument("--no-prune", action="store_true",
                    help="disable rewrite dependency pruning and enumerate "
                         "the full up-to-four universe")
    ap.add_argument("--short-cases", type=int, default=2000,
                    help="reject-gate case count (default 2000); same RNG "
                         "stream, so 2k is a strict prefix of the full "
                         "corpus")
    ap.add_argument("--full-cases", type=int, default=20000,
                    help="full differential case count (default 20000)")
    ap.add_argument("--no-short-gate", action="store_true",
                    help="run only the full differential (exhaustive mode)")
    args = ap.parse_args()
    kernel = args.kernel
    cfg = KERNELS[kernel]
    OUT = args.outdir or cfg["out"]
    os.makedirs(OUT, exist_ok=True)
    manifest = load_manifest(cfg["manifest"])
    verify_src = os.path.join(OUT, "verify_generated.cpp")
    if not os.path.exists(verify_src):
        open(verify_src, "w").write(gen_verify(manifest))

    old_rows = []
    old_path = os.path.join(OUT, "results.json")
    if os.path.exists(old_path):
        old_rows = json.load(open(old_path)).get("rows", [])
    cached = {r.get("seq"): r for r in old_rows
              if r.get("fused_uop") is not None}

    seen = {}
    seen_src = {}
    seqs = []
    pruned_by = {}
    planned_keys = 0
    for combo in itertools.product(cfg["rewrites"], repeat=4):
        seq = [c for c in combo if c != "none"]
        key = "|".join(seq)
        if key in seen:
            continue
        seen[key] = True
        reason = None if args.no_prune else prune_sequence(kernel, seq)
        if reason:
            pruned_by[reason] = pruned_by.get(reason, 0) + 1
            continue
        planned_keys += 1
        src = emit_seq(kernel, seq)
        h = hashlib.sha256(src.encode()).hexdigest()[:12]
        if h in seen_src:
            seen_src[h].append(key)
            continue
        seen_src[h] = [key]
        seqs.append((key, src))

    rows = []
    tasks = []
    for key, src in seqs:
        if key in cached:
            rows.append(dict(cached[key]))
            continue
        tasks.append((cfg, verify_src, key, src, kernel, OUT,
                      args.full_cases if args.no_short_gate
                      else args.short_cases, args.full_cases))

    def _measure_all():
        if args.workers <= 1:
            for t in tasks:
                yield measure_rewrite_candidate(t)
            return
        with concurrent.futures.ProcessPoolExecutor(
                max_workers=args.workers) as ex:
            yield from ex.map(measure_rewrite_candidate, tasks)

    for _task, (row, stage) in zip(tasks, _measure_all()):
        rows.append(row)
        if row.get("fused_uop") is not None:
            print("%-60s fused=%s mism=%s"
                  % (row["seq"] or "(none)", row["fused_uop"],
                     row["mism"]), flush=True)
        else:
            print("%-60s %s" % (row.get("seq") or "(none)", stage),
                  flush=True)

    measured = [r for r in rows if r.get("fused_uop") is not None]
    if measured:
        best = min(measured, key=lambda r: r["fused_uop"])
        print("best:", best["seq"], best["fused_uop"])
        top = sorted(measured, key=lambda r: r["fused_uop"])[:10]
        for r in top:
            if r.get("mca_cycles") is not None or not r.get("range"):
                continue
            h = r.get("_h")
            trace = os.path.join(OUT, "seq_%s-trace.log" % h)
            mca_s = os.path.join(OUT, "seq_%s.mca.s" % h)
            cycles, uops, total = run_dynamic_mca(
                trace, int(r["range"][0], 16), int(r["range"][1], 16),
                mca_s)
            r["mca_cycles"] = cycles
            r["mca_uops"] = uops
            print("mca %-52s fused=%s dyn_insns=%s mca_cycles=%s mca_uops=%s"
                  % (r["seq"], r["fused_uop"], total, cycles, uops))
    with open(os.path.join(OUT, "results.json"), "w") as f:
        json.dump({"kernel": kernel, "rows": rows,
                   "seq_keys": len(seen),
                   "planned_keys": planned_keys,
                   "pruned_by": pruned_by,
                   "unique_sources": len(seqs),
                   "source_aliases": {h: ks
                                      for h, ks in seen_src.items()
                                      if len(ks) > 1},
                   "best": min(measured, key=lambda r: r["fused_uop"])
                   if measured else None}, f, indent=1)


if __name__ == "__main__":
    main()
