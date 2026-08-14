#!/usr/bin/env python3
"""End-to-end seed pipeline (S1): recipe -> extract(+roundtrip gate) ->
structure detection (family/axis seed) -> search -> summary.

Usage:
  python3 tools/seed_pipeline.py --recipe seeds/sa8d-8x8.yaml --kernel sa8d
      [--outdir experiments/<seed>/pipeline] [--no-mca] [--workers 4]

Every step is a subprocess of an existing tool, so each stage can be rerun
independently and the artifacts are reproducible from the recipe.
"""

import argparse
import json
import os
import subprocess
import sys

try:
    import yaml
except ImportError:
    yaml = None

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATCHED_MCA = "/home/chiro/llvm-src/build-mca/bin/llvm-mca"


def run(cmd, **kw):
    print("+ %s" % " ".join(cmd))
    return subprocess.run(cmd, check=True, **kw)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--recipe", required=True)
    ap.add_argument("--kernel", required=True,
                    help="search kernel name (kernels/<kernel>/manifest.yaml)")
    ap.add_argument("--outdir", default=None)
    ap.add_argument("--workers", type=int, default=4)
    ap.add_argument("--no-mca", action="store_true")
    ap.add_argument("--no-verify", action="store_true",
                    help="skip the roundtrip gate during extraction")
    ap.add_argument("--force-search", action="store_true",
                    help="run the search even if the manifest space is huge")
    args = ap.parse_args()
    if yaml is None:
        raise SystemExit("pyyaml required")
    recipe = yaml.safe_load(open(args.recipe))
    seed = recipe["seed"]
    outdir = args.outdir or os.path.join(ROOT, "experiments", seed, "pipeline")
    os.makedirs(outdir, exist_ok=True)
    mi = os.path.join(outdir, "machine-ir.json")
    seed_json = os.path.join(outdir, "recipe-seed.json")
    search_dir = os.path.join(outdir, "search")

    # 1) extract + roundtrip gate
    cmd = [sys.executable, os.path.join(ROOT, "tools", "extract_seed.py"),
           "--recipe", os.path.abspath(args.recipe), "--out", mi]
    if args.no_verify:
        cmd.append("--no-verify")
    run(cmd)

    # 2) structure detection -> family / axis seed
    run([sys.executable, os.path.join(ROOT, "tools", "recipe_seed.py"),
         "--machine-ir", mi, "--out", seed_json, "--kernel", args.kernel])
    seed_doc = json.load(open(seed_json))

    # 3) search over the kernel's full axis space (guarded against huge
    # manifest spaces: dct32's raw space is 7.37e8; a search that cannot
    # finish quickly is skipped, the roundtrip gate stays the acceptance)
    sys.path.insert(0, os.path.join(ROOT, "tools"))
    from kernel_manifest import load_manifest, layout_plans  # noqa: E402
    try:
        km = load_manifest(args.kernel)
    except Exception:
        km = None
    n_plans = 0
    if km is not None and not args.force_search:
        for _ in layout_plans(km):
            n_plans += 1
            if n_plans > 5000:
                break
    if n_plans > 5000:
        print("search space too large (%d+ combos); skipping search "
              "(acceptance = roundtrip gate). Use --force-search to "
              "override, or add search.extra skip-axes / a search-axis "
              "subset to the recipe." % n_plans)
        summary = {
            "recipe": args.recipe,
            "kernel": args.kernel,
            "family_hint": seed_doc.get("family_hint"),
            "structure": seed_doc.get("structure"),
            "axis_seed": seed_doc.get("axis_seed"),
            "search": "skipped (space too large)",
            "gate": "passed (roundtrip 0 mismatches)" if not args.no_verify
            else "skipped",
        }
        with open(os.path.join(outdir, "summary.json"), "w") as f:
            json.dump(summary, f, indent=1)
        print("== summary ==")
        print(json.dumps(summary, ensure_ascii=False, indent=1))
        return
    cmd = [sys.executable, os.path.join(ROOT, "tools", "search_sve2_layouts.py"),
           "--kernel", args.kernel, "--workers", str(args.workers),
           "--outdir", search_dir]
    search_cfg = recipe.get("search") or {}
    if search_cfg.get("backend"):
        cmd += ["--backend", search_cfg["backend"]]
    for extra in search_cfg.get("extra", []):
        cmd += [str(extra)]
    if not args.no_mca and os.path.exists(PATCHED_MCA):
        cmd += ["--mca-top", "5", "--mca-bin", PATCHED_MCA]
    run(cmd)

    # 4) summary
    results = json.load(open(os.path.join(search_dir, "results.json")))
    ranked = sorted(
        (r for r in results if (r.get("counts") or {}).get(
            "vector_fused_uop") is not None),
        key=lambda r: r["counts"]["vector_fused_uop"])
    if not ranked:
        raise SystemExit("no ranked candidates in %s" % search_dir)
    best = ranked[0]
    summary = {
        "recipe": args.recipe,
        "kernel": args.kernel,
        "family_hint": seed_doc.get("family_hint"),
        "structure": seed_doc.get("structure"),
        "axis_seed": seed_doc.get("axis_seed"),
        "best": {
            "tag": best["tag"],
            "fused_uop": best["counts"]["vector_fused_uop"],
            "mca_cycles": best.get("mca_cycles"),
        },
        "candidates": len(ranked),
    }
    out = os.path.join(outdir, "summary.json")
    with open(out, "w") as f:
        json.dump(summary, f, indent=1)
    print("== summary ==")
    print(json.dumps(summary, ensure_ascii=False, indent=1))


if __name__ == "__main__":
    main()
