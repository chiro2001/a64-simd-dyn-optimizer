#!/usr/bin/env python3
"""Layout search driver for the tool-generated SVE2 DCT16 candidate.

Enumerates emitter parameters, generates the candidate, compiles it,
runs the upstream-exact differential in QEMU (fixed VL=256), and records
the true-dynamic instruction counts. Every distinct body must still be
measured on the target machine later; this is the static/dynamic funnel.

Usage:
  python3 tools/search_sve2_layouts.py [--outdir experiments/m30-dct16-search/layout-search]

Exit code 0 only if at least one candidate passes the upstream-exact gate.
"""

import argparse
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from emit_dct16_sve2_shared import emit  # noqa: E402


QEMU = ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu",
        "-cpu", "max,sve-max-vq=2"]
VERIFY_SRC = os.path.join(ROOT, "kernels/dct16/sve_shared_verify.cpp")
TRACE_DRIVER = os.path.join(ROOT, "kernels/dct16/shared_trace_driver.cpp")
UPSTREAM_LIB = os.path.join(ROOT, "build/x265-8-clang-sve/libx265.a")


def run(cmd, **kw):
    return subprocess.run(cmd, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, text=True, **kw)


def symbol_range(binary, sym):
    out = run(["nm", binary, "--defined-only"]).stdout
    addrs = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 3 and parts[2] == sym:
            addrs.append(int(parts[0], 16))
    if not addrs:
        return None
    start = min(addrs)
    nxt = None
    for line in out.splitlines():
        parts = line.split()
        if len(parts) < 3:
            continue
        try:
            a = int(parts[0], 16)
        except ValueError:
            continue
        if a > start and (nxt is None or a < nxt) and parts[1] in ("T", "t"):
            nxt = a
    return start, (nxt if nxt is not None else start + 1)


def true_dynamic(binary, start, end, log):
    r = run(QEMU + ["-one-insn-per-tb", "-d", "exec,in_asm",
                    "-dfilter", "0x%x..0x%x" % (start, end),
                    "-D", log, binary])
    if r.returncode != 0:
        return None
    p = run(["python3", os.path.join(ROOT, "tools/parse_qemu_trace.py"),
             log, hex(start), hex(end), "--exec", "--json", log + ".json"])
    if p.returncode != 0:
        return None
    d = json.load(open(log + ".json"))
    return {"total": len(d["instructions"]), "vector": len(d["vector"])}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--outdir",
                    default=os.path.join(ROOT,
                                         "experiments/m30-dct16-search/"
                                         "layout-search"))
    args = ap.parse_args()
    os.makedirs(args.outdir, exist_ok=True)

    combos = [
        ("quarter", "upstream"),
        ("quarter", "odd-quarter"),
        ("per-row", "upstream"),
    ]
    results = []
    for p1, p2 in combos:
        tag = "p1-%s_p2-%s" % (p1, p2)
        src = os.path.join(args.outdir, tag + ".cpp")
        with open(src, "w") as f:
            f.write(emit(pass1_layout=p1, pass2_layout=p2))
        obj = os.path.join(args.outdir, tag + ".o")
        c = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
                 "-march=armv8.2-a+sve2", "-c", src, "-o", obj])
        if c.returncode != 0:
            print("%-24s BUILD FAIL" % tag)
            continue
        verify = os.path.join(args.outdir, tag + "-verify")
        v = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
                 "-march=armv8.2-a+sve2", VERIFY_SRC, obj,
                 "-Wl,--start-group", UPSTREAM_LIB, "-Wl,--end-group",
                 "-lpthread", "-ldl", "-o", verify])
        if v.returncode != 0:
            print("%-24s LINK FAIL" % tag)
            continue
        r = run(QEMU + [verify, "20000"])
        ok = r.returncode == 0 and "mismatches=0" in r.stdout
        print("%-24s verify: %s" % (tag, r.stdout.strip().splitlines()[-1]
                                    if r.stdout.strip() else "no output"))
        if not ok:
            results.append({"tag": tag, "pass1": p1, "pass2": p2,
                            "upstream_exact": False, "verify": r.stdout})
            continue
        driver = os.path.join(args.outdir, tag + "-trace-driver")
        d = run(["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
                 "-std=c++11", TRACE_DRIVER, obj, "-o", driver])
        if d.returncode != 0:
            results.append({"tag": tag, "pass1": p1, "pass2": p2,
                            "upstream_exact": True, "counts": None})
            continue
        rng = symbol_range(driver, "dynopt_dct16_sve2_shared")
        if rng is None:
            results.append({"tag": tag, "pass1": p1, "pass2": p2,
                            "upstream_exact": True, "counts": None})
            continue
        counts = true_dynamic(driver, rng[0], rng[1],
                              os.path.join(args.outdir, tag + "-trace.log"))
        results.append({"tag": tag, "pass1": p1, "pass2": p2,
                        "upstream_exact": True, "counts": counts})
        if counts:
            print("  dynamic total=%d vector=%d" % (counts["total"],
                                                    counts["vector"]))

    json.dump(results, open(os.path.join(args.outdir, "results.json"), "w"),
              indent=1)
    ok = [r for r in results if r.get("upstream_exact") and r.get("counts")]
    ok.sort(key=lambda r: r["counts"]["vector"])
    print("rank by vector count:")
    for r in ok:
        print("  %-24s vector=%d" % (r["tag"], r["counts"]["vector"]))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
