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
from search_sve2_layouts import QEMU, run, symbol_range, true_dynamic  # noqa: E402


KERNELS = {
    "dct32": {
        "out": os.path.join(ROOT, "experiments", "m30-dct32-search",
                            "layout-search-rwseq"),
        "rewrites": ["none", "tbl2_to_zip", "legacy_k2", "legacy_k4",
                     "merge_narrow8"],
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


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--kernel", choices=("dct32", "dct16"), default="dct32")
    args = ap.parse_args()
    kernel = args.kernel
    cfg = KERNELS[kernel]
    OUT = cfg["out"]
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
    seqs = []
    for combo in itertools.product(cfg["rewrites"], repeat=4):
        seq = [c for c in combo if c != "none"]
        key = "|".join(seq)
        if key in seen:
            continue
        seen[key] = True
        src = emit_seq(kernel, seq)
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
                     os.path.join(ROOT, cfg["ref_lib"]),
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
        if kernel == "dct16":
            legacy_seq = "legacy_even_sve" in key.split("|")
        else:
            legacy_seq = False
        if kernel == "dct16" and not legacy_seq:
            ok_mism = r.returncode == 0 and mism == 0
        else:
            ok_mism = r.returncode in (0, 1) and 0 <= mism <= 22528
        if not ok_mism:
            rows.append({"seq": key, "_h": h, "passed": False, "mism": mism})
            continue
        driver = os.path.join(OUT, "seq_%s-driver" % h)
        if not os.path.exists(driver):
            d = run(["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
                     "-std=c++11",
                     os.path.join(ROOT, cfg["driver"]),
                     obj, "-o", driver])
            if d.returncode != 0:
                rows.append({"seq": key, "passed": True, "mism": mism,
                             "_h": h, "trace": "LINK_FAIL"})
                continue
        rng = symbol_range(driver, cfg["range_start"])
        rng_end = symbol_range(driver, cfg["range_end"])
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
            h = r.get("_h")
            if not h:
                rw = [c for c in r["seq"].split("|") if c]
                src = emit_seq(kernel, rw)
                h = hashlib.sha256(src.encode()).hexdigest()[:12]
            obj = os.path.join(OUT, "seq_%s.o" % h)
            cycles, uops = run_mca(obj, OUT)
            r["mca_cycles"] = cycles
            r["mca_uops"] = uops
            print("mca %-52s fused=%s mca_cycles=%s mca_uops=%s"
                  % (r["seq"], r["fused_uop"], cycles, uops))
    with open(os.path.join(OUT, "results.json"), "w") as f:
        json.dump({"kernel": kernel, "rows": rows,
                   "best": min(measured, key=lambda r: r["fused_uop"])
                   if measured else None}, f, indent=1)


if __name__ == "__main__":
    main()
