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
import re
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


def run_mca(obj, workdir):
    """LLVM-MCA on the object's static body (Neoverse-V2, SVE2)."""
    s = os.path.join(workdir, os.path.basename(obj) + ".mca.s")
    txt = subprocess.check_output(["aarch64-linux-gnu-objdump", "-d", obj],
                                  text=True)
    lines = [".arch armv8.2-a+sve2", ".text"]
    for line in txt.splitlines():
        m = re.match(r"\s*[0-9a-f]+:\s+[0-9a-f]+\s+"
                     r"([a-z][a-z0-9.]*)\s*(.*)$", line)
        if m:
            ops = m.group(2).split("//")[0].strip()
            lines.append(m.group(1) + (" " + ops if ops else ""))
    open(s, "w").write("\n".join(lines) + "\n")
    r = subprocess.run(["llvm-mca", "-mtriple=aarch64", "-mcpu=neoverse-v2",
                        "-mattr=+sve2", "-iterations=1",
                        "-skip-unsupported-instructions=parse-failure", s],
                       capture_output=True, text=True)
    cycles = uops = None
    for ln in r.stdout.splitlines():
        if ln.startswith("Total Cycles:"):
            cycles = int(ln.split(":")[1].strip())
        if ln.startswith("Total uOps:"):
            uops = int(ln.split(":")[1].strip())
    return cycles, uops


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

    old_rows = []
    old_path = os.path.join(OUT, "results.json")
    if os.path.exists(old_path):
        old_rows = json.load(open(old_path)).get("rows", [])
    cached = {r.get("seq"): r for r in old_rows
              if r.get("fused_uop") is not None}

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
        if key in cached:
            rows.append(dict(cached[key]))
            continue
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
                rows.append({"seq": key, "_h": h, "build": "FAIL"})
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
                rows.append({"seq": key, "_h": h, "build": "LINK_FAIL"})
                continue
        r = run(QEMU + [verify, "20000"])
        mism = 0
        if "mismatches=" in r.stdout:
            try:
                mism = int(r.stdout.split("mismatches=", 1)[1].split()[0])
            except ValueError:
                mism = -1
        if r.returncode not in (0, 1) or mism > 22528:
            rows.append({"seq": key, "_h": h, "passed": False, "mism": mism})
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
                             "_h": h, "trace": "LINK_FAIL"})
                continue
        rng = symbol_range(driver, "_ZL9op_pass_4PKsPsl")
        end_sym = "dynopt_dct32_sve2_shared"
        rng_end = symbol_range(driver, end_sym)
        if not rng or not rng_end:
            rows.append({"seq": key, "passed": True, "mism": mism,
                         "_h": h, "trace": "NO_RANGE"})
            continue
        counts = true_dynamic(driver, rng[0], rng_end[1],
                              os.path.join(OUT, "seq_%s-trace.log" % h))
        rows.append({"seq": key, "passed": True, "mism": mism,
                     "fused_uop": counts["vector_fused_uop"],
                     "raw": counts["vector"],
                     "movprfx": counts["movprfx"], "_h": h})
        print("%-60s fused=%s mism=%s" % (key or "(none)", counts[
              "vector_fused_uop"], mism), flush=True)

    measured = [r for r in rows if r.get("fused_uop") is not None]
    if measured:
        best = min(measured, key=lambda r: r["fused_uop"])
        print("best:", best["seq"], best["fused_uop"])
        top = sorted(measured, key=lambda r: r["fused_uop"])[:10]
        for r in top:
            if r.get("mca_cycles") is not None:
                continue
            if r.get("_h"):
                h = r["_h"]
            else:
                rw = [c for c in r["seq"].split("|") if c]
                src = emit_from_plan(
                    replace(base, lowering=dict(lo, rewrites=rw)),
                    func_name="dynopt_dct32_sve2_shared")
                h = hashlib.sha256(src.encode()).hexdigest()[:12]
            obj = os.path.join(OUT, "seq_%s.o" % h)
            cycles, uops = run_mca(obj, OUT)
            r["mca_cycles"] = cycles
            r["mca_uops"] = uops
            print("mca %-52s fused=%s mca_cycles=%s mca_uops=%s"
                  % (r["seq"], r["fused_uop"], cycles, uops))
    with open(os.path.join(OUT, "results.json"), "w") as f:
        json.dump({"rows": rows,
                   "best": min(measured, key=lambda r: r["fused_uop"])
                   if measured else None}, f, indent=1)


if __name__ == "__main__":
    main()
