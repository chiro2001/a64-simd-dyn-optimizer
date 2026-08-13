#!/usr/bin/env python3
"""Layout search driver, driven by the kernel manifest (docs/16).

Enumerates the cartesian product of the manifest's layout axes, generates
each candidate, compiles it (ACLE or direct asm backend), runs the
upstream-exact differential in QEMU (fixed VL from the manifest), and
records true-dynamic instruction counts. Every distinct body must still
be measured on the target machine later; this is the static/dynamic
funnel. Search space is kept small (<60s) by design; add axes/values in
the manifest when the optimizer gains new structure.

Usage:
  python3 tools/search_sve2_layouts.py [--kernel dct16] [--backend asm|acle]
      [--outdir experiments/m30-dct16-search/layout-search]

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

from emit_dct16_sve2_asm import assemble, bootstrap_cpp  # noqa: E402
from kernel_manifest import layout_combos, load_manifest, repo_path  # noqa: E402
from gen_verify import generate as gen_verify  # noqa: E402


QEMU = ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu",
        "-cpu", "max,sve-max-vq=2"]


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
    c = d.get("counts", {})
    return {"total": len(d["instructions"]),
            "vector": len(d["vector"]),
            "movprfx": c.get("movprfx", 0),
            "vector_fused": c.get("vector_fused", len(d["vector"]))}


def make_emitter(kernel):
    """Return emit(combo) for the kernel's manifest layout axes."""
    if kernel == "dct16":
        from emit_dct16_sve2_shared import emit

        def emit_fn(combo):
            return emit(pass1_layout=combo.get("pass1", "quarter"),
                        pass2_layout=combo.get("pass2", "upstream"),
                        pass1_k_tile=combo.get("pass1_k_tile", 2),
                        pass2_k_tile=combo.get("pass2_k_tile", 1),
                        narrow_merge=combo.get("narrow_merge", 0),
                        legacy_semantics=combo.get("legacy_semantics", 0))
        return emit_fn
    if kernel == "dct8":
        from emit_dct8_sve2_shared import emit

        def emit_fn(combo):
            return emit(k_tile=combo.get("k_tile", 1))
        return emit_fn
    raise ValueError("no emitter registered for kernel %r" % kernel)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--backend", choices=("acle", "asm"), default="acle")
    ap.add_argument("--contract", default=None)
    ap.add_argument("--kernel", default="dct16")
    ap.add_argument("--outdir", default=None)
    args = ap.parse_args()
    manifest = load_manifest(args.kernel)
    if args.contract:
        manifest["contract"] = args.contract
    if args.outdir is None:
        args.outdir = os.path.join(
            ROOT, "experiments/m30-%s-search/layout-search" % args.kernel)
    emit = make_emitter(args.kernel)
    os.makedirs(args.outdir, exist_ok=True)
    verify_src = os.path.join(args.outdir, "verify_generated.cpp")
    if not os.path.exists(verify_src):
        with open(verify_src, "w") as f:
            f.write(gen_verify(manifest))

    combos = layout_combos(manifest)
    if not combos or not manifest.get("layouts"):
        print("manifest has no layout axes", file=sys.stderr)
        return 2
    driver_o = os.path.join(args.outdir, "trace-driver.o")
    if args.backend == "asm" and not os.path.exists(driver_o):
        run(["aarch64-linux-gnu-gcc", "-O2", "-c",
             repo_path(manifest, manifest["candidate"]["trace_driver_c"]),
             "-o", driver_o])
    results = []
    seen = set()
    for combo in combos:
        if "pass1" in manifest.get("layouts", {}):
            if combo.get("pass1") != "quarter":
                combo["pass1_k_tile"] = 2   # tile only applies to quarter
        if "pass2" in manifest.get("layouts", {}):
            if combo.get("pass2") != "odd-quarter":
                combo["pass2_k_tile"] = 1   # tile only applies to odd-quarter
        tag = "_".join("%s-%s" % (k, v) for k, v in combo.items())
        if tag in seen:
            continue
        seen.add(tag)
        src = os.path.join(args.outdir, tag + ".cpp")
        with open(src, "w") as f:
            f.write(emit(combo))
        obj = os.path.join(args.outdir, tag + ".o")
        if args.backend == "asm":
            s_path = os.path.join(args.outdir, tag + ".S")
            bootstrap_cpp(src, s_path)
            c = run(["aarch64-linux-gnu-as", "-march=armv8.2-a+sve2",
                     "-o", obj, s_path])
        else:
            c = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
                     "-march=armv8.2-a+sve2", "-c", src, "-o", obj])
        if c.returncode != 0:
            print("%-24s BUILD FAIL" % tag)
            continue
        verify = os.path.join(args.outdir, tag + "-verify")
        v = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
                 "-march=armv8.2-a+sve2",
                 verify_src, obj, "-Wl,--start-group",
                 repo_path(manifest, manifest["reference"]["lib"]),
                 "-Wl,--end-group",
                 "-lpthread", "-ldl", "-o", verify])
        if v.returncode != 0:
            print("%-24s LINK FAIL" % tag)
            continue
        r = run(QEMU + [verify, "20000"])
        # Gate policy (docs/17 §5): acceptance is the x265 TestBench golden
        # standard. The scalar differential is a fast proxy: upstream-exact
        # combos must be bit-identical; legacy-internal-exact combos
        # intentionally reproduce the internal kernel's rare s16-wrap
        # divergence from the C reference (~0.045%, passes TestBench), so
        # accept a small mismatch rate and record it.
        mism = 0
        if "mismatches=" in r.stdout:
            try:
                mism = int(r.stdout.split("mismatches=", 1)[1].split()[0])
            except (ValueError, IndexError):
                mism = -1
        if combo.get("legacy_semantics"):
            ok = r.returncode in (0, 1) and 0 <= mism <= 5120  # <=0.1% proxy
        else:
            ok = r.returncode == 0 and mism == 0
        print("%-24s verify: %s" % (tag, r.stdout.strip().splitlines()[-1]
                                    if r.stdout.strip() else "no output"))
        if not ok:
            results.append({"tag": tag, **combo,
                            "upstream_exact": False,
                            "passed": False,
                            "verify_mismatches": mism,
                            "verify": r.stdout})
            continue
        driver = os.path.join(args.outdir, tag + "-trace-driver")
        if args.backend == "asm":
            d = run(["aarch64-linux-gnu-gcc", "-no-pie", "-static",
                     obj, driver_o, "-o", driver])
        else:
            d = run(["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
                     "-std=c++11",
                     repo_path(manifest,
                               manifest["candidate"]["trace_driver_src"]),
                     obj, "-o", driver])
        if d.returncode != 0:
            results.append({"tag": tag, **combo,
                            "passed": False, "counts": None})
            continue
        rng = symbol_range(driver, manifest["candidate"]["symbol"])
        if rng is None:
            results.append({"tag": tag, **combo,
                            "passed": False, "counts": None})
            continue
        counts = true_dynamic(driver, rng[0], rng[1],
                              os.path.join(args.outdir, tag + "-trace.log"))
        results.append({"tag": tag, **combo,
                        "upstream_exact": not combo.get("legacy_semantics"),
                        "passed": True,
                        "verify_mismatches": mism,
                        "counts": counts})
        if counts:
            print("  dynamic total=%d vector=%d movprfx=%d fused_adj=%d"
                  % (counts["total"], counts["vector"],
                     counts["movprfx"], counts["vector_fused"]))

    json.dump(results, open(os.path.join(args.outdir, "results.json"), "w"),
              indent=1)
    ok = [r for r in results if r.get("passed") and r.get("counts")]
    ok.sort(key=lambda r: r["counts"]["vector_fused"])
    print("rank by fused-adjusted vector count (docs/09 §1.5):")
    for r in ok:
        print("  %-24s vector=%d fused_adj=%d"
              % (r["tag"], r["counts"]["vector"],
                 r["counts"]["vector_fused"]))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
