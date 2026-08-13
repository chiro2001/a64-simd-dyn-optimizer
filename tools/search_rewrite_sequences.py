#!/usr/bin/env python3
"""Enumerate op-level rewrite sequences (up to 4 steps) for DCT32.

Base plan: dct32_v31_plan() with row4 / tbl2 / upstream-exact. Each
sequence is applied via emit_from_plan(rewrites=[...]) and measured
end-to-end (compile -> 20k diff -> true-dynamic fused_uop).
"""

import hashlib
import itertools
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from dataclasses import replace  # noqa: E402
from dct32_op_emit import emit_from_plan  # noqa: E402
from gen_verify import generate as gen_verify  # noqa: E402
from kernel_manifest import load_manifest  # noqa: E402
from layout_ir import dct32_v31_plan  # noqa: E402
from search_sve2_layouts import QEMU, run, symbol_range, true_dynamic  # noqa: E402


REW = ["none", "tbl2_to_zip", "legacy_k2", "legacy_k4", "merge_narrow8"]
OUT = os.path.join(ROOT, "experiments", "m30-dct32-search",
                   "layout-search-rwseq")


def main():
    os.makedirs(OUT, exist_ok=True)
    base = dct32_v31_plan()
    lo = dict(base.lowering)
    lo["slice_kind"] = "tbl2"
    lo.pop("legacy_ex", None)
    lo.pop("legacy_k4", None)
    lo.pop("row_group", None)
    base = replace(base, lowering=lo)
    manifest = load_manifest("dct32")
    verify_src = os.path.join(OUT, "verify_generated.cpp")
    if not os.path.exists(verify_src):
        open(verify_src, "w").write(gen_verify(manifest))

    seen = {}
    seqs = []
    for combo in itertools.product(REW, repeat=4):
        seq = [c for c in combo if c != "none"]
        key = "|".join(seq)
        if key in seen:
            continue
        seen[key] = True
        src = emit_from_plan(replace(base, lowering=dict(lo, rewrites=seq)),
                             func_name="dynopt_dct32_sve2_shared")
        seqs.append((key, src))

    rows = []
    for key, src in seqs:
        h = hashlib.sha256(src.encode()).hexdigest()[:12]
        cpp = os.path.join(OUT, "seq_%s.cpp" % h)
        if not os.path.exists(cpp):
            open(cpp, "w").write(src)
        obj = os.path.join(OUT, "seq_%s.o" % h)
        if not os.path.exists(obj):
            c = run(["aarch64-linux-gnu-g++", "-O2", "-fno-tree-pre",
                     "-std=c++11", "-march=armv8.2-a+sve2",
                     "-c", cpp, "-o", obj])
            if c.returncode != 0:
                rows.append({"seq": key, "build": "FAIL"})
                continue
        verify = os.path.join(OUT, "seq_%s-verify" % h)
        if not os.path.exists(verify):
            v = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
                     "-march=armv8.2-a+sve2",
                     verify_src,
                     obj, "-Wl,--start-group",
                     os.path.join(ROOT, "build", "x265-8-clang-sve",
                                  "libx265.a"),
                     "-Wl,--end-group", "-lpthread", "-ldl",
                     "-o", verify])
            if v.returncode != 0:
                rows.append({"seq": key, "build": "LINK_FAIL"})
                continue
        r = run(QEMU + [verify, "20000"])
        mism = 0
        if "mismatches=" in r.stdout:
            try:
                mism = int(r.stdout.split("mismatches=", 1)[1].split()[0])
            except ValueError:
                mism = -1
        if r.returncode not in (0, 1) or mism > 22528:
            rows.append({"seq": key, "passed": False, "mism": mism})
            continue
        driver = os.path.join(OUT, "seq_%s-driver" % h)
        if not os.path.exists(driver):
            d = run(["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
                     "-std=c++11",
                     os.path.join(ROOT, "kernels", "dct32",
                                  "trace_driver.cpp"),
                     obj, "-o", driver])
            if d.returncode != 0:
                rows.append({"seq": key, "passed": True, "mism": mism,
                             "trace": "LINK_FAIL"})
                continue
        rng = symbol_range(driver, "_ZL9op_pass_4PKsPsl")
        end_sym = "dynopt_dct32_sve2_shared"
        rng_end = symbol_range(driver, end_sym)
        if not rng or not rng_end:
            rows.append({"seq": key, "passed": True, "mism": mism,
                         "trace": "NO_RANGE"})
            continue
        counts = true_dynamic(driver, rng[0], rng_end[1],
                              os.path.join(OUT, "seq_%s-trace.log" % h))
        rows.append({"seq": key, "passed": True, "mism": mism,
                     "fused_uop": counts["vector_fused_uop"],
                     "raw": counts["vector"],
                     "movprfx": counts["movprfx"]})
        print("%-60s fused=%s mism=%s" % (key or "(none)", counts[
              "vector_fused_uop"], mism), flush=True)

    measured = [r for r in rows if r.get("fused_uop") is not None]
    if measured:
        best = min(measured, key=lambda r: r["fused_uop"])
        print("best:", best["seq"], best["fused_uop"])
    with open(os.path.join(OUT, "results.json"), "w") as f:
        json.dump({"rows": rows,
                   "best": min(measured, key=lambda r: r["fused_uop"])
                   if measured else None}, f, indent=1)


if __name__ == "__main__":
    main()
