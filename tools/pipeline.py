#!/usr/bin/env python3
"""One-command pipeline skeleton: kernel -> optimize -> kernel -> evaluate.

The stages are wired to existing tools so the DCT16 flow runs end to end
from a clean build; the optimization stage is the only part meant to
change (emitter layout parameters / rewrites), the skeleton stays fixed.

  python3 tools/pipeline.py baseline [--outdir DIR]
  python3 tools/pipeline.py search   [--backend asm|acle]
  python3 tools/pipeline.py report   [--outdir DIR]
  python3 tools/pipeline.py --all    [--backend asm|acle]

Prerequisites: cross toolchain (aarch64-linux-gnu-*), qemu-aarch64 with
SVE, build/x265-8-clang-sve/libx265.a (upstream SVE reference), and the
NEON roundtrip object build/dct16_roundtrip.o for the NEON baseline.
"""

import argparse
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from kernel_manifest import load_manifest, repo_path  # noqa: E402

QEMU = ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu",
        "-cpu", "max,sve-max-vq=2"]


def run(cmd, **kw):
    return subprocess.run(cmd, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, text=True, **kw)


def symbol_range(binary, sym):
    out = run(["nm", binary, "--defined-only"]).stdout
    start = None
    for line in out.splitlines():
        p = line.split()
        if len(p) >= 3 and p[2] == sym:
            start = int(p[0], 16)
    if start is None:
        return None
    nxt = None
    for line in out.splitlines():
        p = line.split()
        if len(p) < 3:
            continue
        try:
            a = int(p[0], 16)
        except ValueError:
            continue
        if a > start and (nxt is None or a < nxt) and p[1] in ("T", "t"):
            nxt = a
    return start, (nxt if nxt is not None else start + 1)


def trace_count(binary, start, end, log):
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


def stage_baseline(outdir, manifest):
    os.makedirs(outdir, exist_ok=True)
    result = {}

    # upstream SVE baseline
    for name, b in manifest.get("baselines", {}).items():
        bin_path = os.path.join(outdir, "baseline-%s-driver" % name)
        obj = repo_path(manifest, b["object"]) if b.get("object") else None
        lib = repo_path(manifest, manifest["reference"]["lib"]) \
            if not obj else None
        cmd = ["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
               "-std=c++11", repo_path(manifest, b["driver"])]
        if obj:
            cmd += [obj]
        else:
            cmd += ["-Wl,--start-group", lib, "-Wl,--end-group",
                    "-lpthread", "-ldl"]
        cmd += ["-o", bin_path]
        r = run(cmd)
        if r.returncode != 0:
            print("baseline %s BUILD FAIL:\n%s" % (name, r.stdout[-2000:]))
            return 1
        sym = b.get("symbol_mangled", b.get("symbol"))
        rng = symbol_range(bin_path, sym)
        if rng:
            counts = trace_count(bin_path, rng[0], rng[1],
                                 os.path.join(outdir, "baseline-%s.log"
                                              % name))
            result[name] = counts

    json.dump(result, open(os.path.join(outdir, "baseline.json"), "w"),
              indent=1)
    for k, v in result.items():
        print("baseline %-12s %s" % (k, v))
    return 0


def stage_search(backend, manifest, contract=None):
    cmd = ["python3", os.path.join(ROOT, "tools/search_sve2_layouts.py"),
           "--backend", backend, "--kernel", manifest["kernel"]]
    if contract:
        cmd += ["--contract", contract]
    return run(cmd).returncode


def stage_report(outdir):
    base = json.load(open(os.path.join(outdir, "baseline.json")))
    res = json.load(open(os.path.join(outdir, "results.json")))
    print("baseline (true-dynamic, fused_adj):")
    for k, v in base.items():
        if v:
            print("  %-12s vector=%d fused_adj=%d"
                  % (k, v["vector"], v["vector_fused"]))
    print("candidates:")
    ok = [r for r in res if r.get("counts")]
    ok.sort(key=lambda r: r["counts"]["vector_fused"])
    ref = base.get("upstream_sve") or base.get("sve")
    ref_fused = ref["vector_fused"] if ref else None
    for r in ok:
        extra = ""
        if ref_fused:
            half = ref_fused / 2.0
            rec = (ref_fused - r["counts"]["vector_fused"]) \
                / (ref_fused - half)
            extra = " vs_sve=%.3f half_recovery=%.0f%%" % (
                r["counts"]["vector_fused"] / ref_fused, rec * 100)
        print("  %-24s vector=%d fused_adj=%d upstream_exact=%s%s"
              % (r["tag"], r["counts"]["vector"],
                 r["counts"]["vector_fused"], r.get("upstream_exact"), extra))
    best = ok[0]["tag"] if ok else None
    if best:
        trace = os.path.join(outdir, best + "-trace.log.json")
        if os.path.exists(trace):
            sys.path.insert(0, os.path.join(ROOT, "tools"))
            from recover_loops import detect_loops
            d = json.load(open(trace))
            loops = detect_loops(d["instructions"])
            print("loop report for %s (%d loops):"
                  % (best, len(loops)))
            for l in loops[:8]:
                print("  trip=%d period=%d depth=%d body=[0x%x..0x%x)"
                      % (l["trip"], l["period"], l["depth"],
                         d["instructions"][l["start"]]["addr"],
                         d["instructions"][l["end"] - 1]["addr"]))
    return 0


def stage_finalize(outdir, manifest, contract=None):
    """Fix the best candidate as a stable deliverable. Legacy contract
    finalizes to best_legacy_sve2.* and uses the proxy gate (<=0.06%)."""
    res = json.load(open(os.path.join(outdir, "results.json")))
    want = contract or "upstream-exact"
    ok = [r for r in res if r.get("counts")
          and r.get("contract", "upstream-exact") == want]
    if not ok:
        print("no candidates to finalize", file=sys.stderr)
        return 1
    best = min(ok, key=lambda r: r["counts"]["vector_fused"])
    legacy = contract == "legacy-internal-exact"

    sys.path.insert(0, os.path.join(ROOT, "tools"))
    from emit_dct16_sve2_shared import emit
    from emit_dct16_sve2_asm import bootstrap_cpp

    cand_dir = os.path.join(ROOT, "kernels", manifest["kernel"],
                            "candidates")
    os.makedirs(cand_dir, exist_ok=True)
    stem = "best_legacy_sve2" if legacy else "best_sve2"
    cpp = os.path.join(cand_dir, stem + ".cpp")
    s = os.path.join(cand_dir, stem + ".S")
    with open(cpp, "w") as f:
        f.write(emit(pass1_layout=best.get("pass1", "quarter"),
                     pass2_layout=best.get("pass2", "upstream"),
                     pass1_k_tile=best.get("pass1_k_tile", 2),
                     pass2_k_tile=best.get("pass2_k_tile", 1),
                     narrow_merge=best.get("narrow_merge", 0),
                     legacy_semantics=best.get("legacy_semantics", 0),
                     legacy_even_full=best.get("legacy_even_full", 0),
                     store_merge16=best.get("store_merge16", 0),
                     pass1_even_factor=best.get("pass1_even_factor", 0),
                     pass1_pack_zip=best.get("pass1_pack_zip", 0),
                     pass2_pack_zip=best.get("pass2_pack_zip", 0),
                     even_sve=best.get("even_sve", 0)))
    bootstrap_cpp(cpp, s)

    # 200k verification of the finalized artifact (proxy gate for legacy)
    verify_src = os.path.join(outdir, "verify_generated.cpp")
    if not os.path.exists(verify_src):
        with open(verify_src, "w") as f:
            f.write(gen_verify(manifest))
    exe = os.path.join(outdir, "best-verify")
    r = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
             "-march=armv8.2-a+sve2", verify_src, cpp,
             "-Wl,--start-group",
             repo_path(manifest, manifest["reference"]["lib"]),
             "-Wl,--end-group", "-lpthread", "-ldl", "-o", exe])
    if r.returncode != 0:
        print("finalize BUILD FAIL:\n%s" % r.stdout[-2000:])
        return 1
    r = run(QEMU + [exe, "200000"])
    mism = 0
    if "mismatches=" in r.stdout:
        try:
            mism = int(r.stdout.split("mismatches=", 1)[1].split()[0])
        except (ValueError, IndexError):
            mism = -1
    if legacy:
        ok_verify = r.returncode in (0, 1) and 0 <= mism <= 30720
    else:
        ok_verify = r.returncode == 0 and mism == 0

    best_dir = os.path.join(ROOT, "experiments/m30-dct16-search/best")
    os.makedirs(best_dir, exist_ok=True)
    record = {
        "tag": best["tag"],
        "layout": {k: v for k, v in best.items()
                   if k.startswith("pass") or k in
                   ("narrow_merge", "legacy_semantics", "legacy_even_full",
                    "store_merge16", "even_sve")},
        "counts": best["counts"],
        "artifacts": {"cpp": cpp, "asm": s},
        "contract": contract or "upstream-exact",
        "verify_200k": ok_verify,
        "verify_mismatches": mism,
        "verify_output": r.stdout.strip()[-500:],
    }
    rec_name = "best_legacy.json" if legacy else "best.json"
    json.dump(record, open(os.path.join(best_dir, rec_name), "w"), indent=1)
    print("finalized %s -> %s / %s" % (best["tag"], cpp, s))
    print("200k verify:", r.stdout.strip().splitlines()[-1]
          if r.stdout.strip() else "no output",
          "OK" if ok_verify else "FAIL")
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--all", action="store_true")
    ap.add_argument("--backend", choices=("asm", "acle"), default="asm")
    ap.add_argument("--kernel", default="dct16")
    ap.add_argument("--contract", default=None)
    ap.add_argument("--outdir", default=None)
    ap.add_argument("stage", nargs="?",
                    choices=("baseline", "search", "report", "finalize"))
    args = ap.parse_args()
    manifest = load_manifest(args.kernel)
    if args.outdir is None:
        args.outdir = os.path.join(
            ROOT, "experiments/m30-%s-search/layout-search" % args.kernel)

    if args.all or args.stage == "baseline":
        if stage_baseline(args.outdir, manifest) != 0:
            return 1
        if args.stage == "baseline":
            return 0
    if args.all or args.stage == "search":
        if stage_search(args.backend, manifest, args.contract) != 0:
            return 1
    if args.all or args.stage == "report":
        return stage_report(args.outdir)
    if args.stage == "finalize":
        return stage_finalize(args.outdir, manifest, args.contract)
    ap.print_help()
    return 2


if __name__ == "__main__":
    sys.exit(main())
