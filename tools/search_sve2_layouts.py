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
import hashlib
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
    if "vector_fused_uop" not in c:
        from parse_qemu_trace import scatter_gather_count  # noqa
        sg = scatter_gather_count(d.get("vector", []))
        c = dict(c)
        c["scatter_gather"] = sg
        c["vector_fused_uop"] = c.get("vector_fused",
                                      len(d["vector"])) + 3 * sg
    return {"total": len(d["instructions"]),
            "vector": len(d["vector"]),
            "movprfx": c.get("movprfx", 0),
            "vector_fused": c.get("vector_fused", len(d["vector"])),
            "scatter_gather": c.get("scatter_gather", 0),
            "vector_fused_uop": c.get("vector_fused_uop",
                                      len(d["vector"]))}


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
                        legacy_semantics=combo.get("legacy_semantics", 0),
                        legacy_even_full=combo.get("legacy_even_full", 0),
                        store_merge16=combo.get("store_merge16", 0),
                        pass1_even_factor=combo.get("pass1_even_factor", 0),
                        pass1_pack_zip=combo.get("pass1_pack_zip", 0),
                        pass2_pack_zip=combo.get("pass2_pack_zip", 0),
                        even_sve=combo.get("even_sve", 0))
        return emit_fn
    if kernel == "dct8":
        from emit_dct8_sve2_shared import emit

        def emit_fn(combo):
            return emit(k_tile=combo.get("k_tile", 1))
        return emit_fn
    if kernel == "sa8d":
        from emit_sa8d_sve2_shared import emit

        def emit_fn(combo):
            return emit(pack=combo.get("pack", "pair"),
                        reduce=combo.get("reduce", "neon"),
                        unroll=combo.get("unroll", 1))
        return emit_fn
    if kernel == "sa8d16":
        from emit_sa8d_sve2_shared import emit_16x16

        def emit_fn(combo):
            return emit_16x16()
        return emit_fn
    raise ValueError("no emitter registered for kernel %r" % kernel)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--backend", choices=("acle", "asm"), default="acle")
    ap.add_argument("--contract", default=None)
    ap.add_argument("--kernel", default="dct16")
    ap.add_argument("--outdir", default=None)
    ap.add_argument("--finalize", action="store_true",
                    help="copy the best candidate to kernels/<name>/candidates/"
                         "best_sve2.{cpp,S,o} and run its TestBenchLite gate")
    args = ap.parse_args()
    manifest = load_manifest(args.kernel)
    if args.contract:
        manifest["contract"] = args.contract
    contract = manifest.get("contract", "upstream-exact")
    if args.outdir is None:
        args.outdir = os.path.join(
            ROOT, "experiments/m30-%s-search/layout-search" % args.kernel)
    emit = make_emitter(args.kernel)
    os.makedirs(args.outdir, exist_ok=True)
    cache_path = os.path.join(args.outdir, "verify_cache.json")
    cache = {}
    if os.path.exists(cache_path):
        try:
            cache = json.load(open(cache_path))
        except (ValueError, OSError):
            cache = {}
    verify_src = os.path.join(args.outdir, "verify_generated.cpp")
    contract_marker = os.path.join(args.outdir, "verify_contract.txt")
    marker = ""
    if os.path.exists(contract_marker):
        marker = open(contract_marker).read().strip()
    if not os.path.exists(verify_src) or marker != contract:
        # verify_generated.cpp embeds the contract's reference oracle and
        # gate; it must be regenerated when the contract changes.
        with open(verify_src, "w") as f:
            f.write(gen_verify(manifest))
        with open(contract_marker, "w") as f:
            f.write(contract)

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
    src_seen = {}
    emitted = {}
    for combo in combos:
        if "pass1" in manifest.get("layouts", {}):
            if combo.get("pass1") != "quarter":
                combo["pass1_k_tile"] = 2   # tile only applies to quarter
        if "pass2" in manifest.get("layouts", {}):
            if combo.get("pass2") != "odd-quarter":
                combo["pass2_k_tile"] = 1   # tile only applies to odd-quarter
        # Prune axis dependencies: inactive axes must be 0 (the emitter
        # ignores them, so these combos would be duplicates).
        if combo.get("pass1_even_factor") and combo.get("pass1") != "quarter":
            continue
        if combo.get("pass1_pack_zip") and combo.get("pass1") != "quarter":
            continue
        if combo.get("pass2_pack_zip") and not (
                combo.get("pass2") == "odd-quarter"
                and combo.get("narrow_merge")):
            continue
        if combo.get("even_sve") and not (
                combo.get("legacy_semantics")
                and combo.get("pass2") == "odd-quarter"
                and combo.get("narrow_merge")):
            continue
        if combo.get("legacy_even_full") and not (
                combo.get("legacy_semantics")
                and combo.get("pass2") == "odd-quarter"
                and combo.get("narrow_merge")):
            continue
        if combo.get("store_merge16") and not (
                combo.get("pass2") == "odd-quarter"
                and combo.get("narrow_merge")):
            continue
        tag = "_".join("%s-%s" % (k, v) for k, v in combo.items())
        if tag in seen:
            continue
        seen.add(tag)
        src_text = emit(combo)
        src_hash = hashlib.sha256(src_text.encode()).hexdigest()
        if src_hash in src_seen:
            # Canonical dedup: identical generated source -> identical
            # object/counts; skip the redundant combo.
            print("%-24s DUP of %s" % (tag, src_seen[src_hash]))
            continue
        src_seen[src_hash] = tag
        ckey = "%s|%s" % (args.contract or manifest.get("contract", ""),
                          src_hash)
        if ckey in cache:
            ent = cache[ckey]
            results.append({
                "tag": tag, **combo,
                "contract": contract,
                "upstream_exact": (not combo.get("legacy_semantics")
                                   if ent.get("passed") else False),
                "passed": ent["passed"],
                "verify_mismatches": ent.get("verify_mismatches", 0),
                "verify": ent.get("verify", ""),
                "counts": ent.get("counts"),
                "cached": True})
            print("%-24s CACHED (fused_adj=%s)"
                  % (tag, (ent.get("counts") or {}).get("vector_fused")))
            continue
        src = os.path.join(args.outdir, tag + ".cpp")
        with open(src, "w") as f:
            f.write(src_text)
        emitted[tag] = src_text
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
            # Proxy bound calibrated against the TestBench golden standard:
            # 0.045078% (k=2/6/10/14 s16 sdot) passes 6/6 runs; 0.090234%
            # (k=0/4/8/12 also s16 sdot) fails the first run. Accept only
            # rates near the internal signature (~0.045%), i.e. <= 0.06%.
            ok = r.returncode in (0, 1) and 0 <= mism <= 3072  # <=0.06% proxy
        else:
            ok = r.returncode == 0 and mism == 0
        print("%-24s verify: %s" % (tag, r.stdout.strip().splitlines()[-1]
                                    if r.stdout.strip() else "no output"))
        if not ok:
            cache[ckey] = {"passed": False,
                           "verify_mismatches": mism,
                           "verify": r.stdout,
                           "counts": None}
            results.append({"tag": tag, **combo,
                            "contract": contract,
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
        cache[ckey] = {"passed": True,
                       "verify_mismatches": mism,
                       "verify": r.stdout,
                       "counts": counts}
        results.append({"tag": tag, **combo,
                        "contract": contract,
                        "upstream_exact": not combo.get("legacy_semantics"),
                        "passed": True,
                        "verify_mismatches": mism,
                        "counts": counts})
        if counts:
            print("  dynamic total=%d vector=%d movprfx=%d fused_adj=%d "
                  "sg=%d fused_uop=%d"
                  % (counts["total"], counts["vector"],
                     counts["movprfx"], counts["vector_fused"],
                     counts["scatter_gather"], counts["vector_fused_uop"]))

    json.dump(results, open(os.path.join(args.outdir, "results.json"), "w"),
              indent=1)
    json.dump(cache, open(cache_path, "w"), indent=1)
    ok = [r for r in results if r.get("passed") and r.get("counts")]
    ok.sort(key=lambda r: r["counts"]["vector_fused_uop"])
    print("rank by uop-honest fused count (scatter/gather = 4 uops, "
          "docs/17 §1):")
    for r in ok:
        print("  %-24s vector=%d fused_adj=%d sg=%d fused_uop=%d"
              % (r["tag"], r["counts"]["vector"],
                 r["counts"]["vector_fused"],
                 r["counts"].get("scatter_gather", 0),
                 r["counts"]["vector_fused_uop"]))
    if args.finalize and ok:
        best = ok[0]
        cand_dir = os.path.join(ROOT, "kernels", args.kernel, "candidates")
        os.makedirs(cand_dir, exist_ok=True)
        src_path = os.path.join(cand_dir, "best_sve2.cpp")
        s_path = os.path.join(cand_dir, "best_sve2.S")
        obj_path = os.path.join(cand_dir, "best_sve2.o")
        with open(src_path, "w") as f:
            meta = {"tag", "contract", "upstream_exact", "passed",
                    "verify_mismatches", "verify", "counts", "cached"}
            combo = {k: v for k, v in best.items() if k not in meta}
            f.write(emit(combo))
        run(["aarch64-linux-gnu-g++", "-O2", "-march=armv8.2-a+sve2",
             "-S", src_path, "-o", s_path])
        c = run(["aarch64-linux-gnu-g++", "-O2", "-march=armv8.2-a+sve2",
                 "-c", src_path, "-o", obj_path])
        if c.returncode == 0:
            print("finalized %s (fused_uop=%d)"
                  % (src_path, best["counts"]["vector_fused_uop"]))
            gate = {"sa8d": "sa8d", "sa8d16": "sa8d16",
                    "dct16": "dct16"}.get(args.kernel)
            if gate:
                lite = run(["scripts/build-testbench-lite.sh", obj_path,
                            "build/x265-8-testbench", "--", "--gate", gate,
                            "--seed", "0x12345678"])
                tail = lite.stdout.strip().splitlines()
                print("  lite gate %s: %s"
                      % (gate, tail[-1] if tail else "no output"))
        else:
            print("finalize FAIL: best candidate did not compile")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
