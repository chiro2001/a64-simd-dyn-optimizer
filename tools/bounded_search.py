#!/usr/bin/env python3
"""bounded_search.py -- docs/87 step 7: bounded (non-bit-exact) search axis.

The axis runs the dev_profile differential harness over every cover in a
kernel's registry set, classifies each cover against a *deviation budget*,
and records the result in kernel-test-db with the canonical `bit_exact=no
(bounded: ...)` grammar.

Axis semantics (docs/94):

  measured max_abs == 0          -> exact             (bit_exact=yes)
  measured max_abs <= bound      -> bounded           (bit_exact=no
                                                       (bounded: max_abs<=B;
                                                        measured=...))
  measured max_abs > bound       -> excluded          (keep upstream)

Bound input may be: the kernel registry bound (dct32=32767, the maximum
representable coefficient deviation x265 tolerates) or the step-6 clip
md5-invariance envelope (docs/93: clip128 24f preset=faster under qemu was
md5-stable with max_abs<=2880 on real-input replay).  The DB row records
both: the hard kernel bound (release cap) and the measured envelope.

Usage:
  python3 tools/bounded_search.py --kernel dct32 --bound 2880 \
      --samples 300 --db
  python3 tools/bounded_search.py --kernel sao --ignore-fail-class
      --json release/step7-qemu/bounded-sao.json

The tool shells out to dev_profile.py (same harness as step 5) with
--skip-bench; no duplicate codegen lives here.
"""

import argparse
import json
import os
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.join(ROOT, "optimizer"))
import kernel_db  # noqa: E402
import dev_profile  # noqa: E402
import multicover  # noqa: E402

KERNEL_BOUND = {  # registry hard bounds (docs/88 §1)
    "dct32": 32767,
    "dct16": 32767,
    "interp8-32": 0,
    "sao": 0,
}


def _run(cmd, env=None, timeout=1800, cwd=None):
    return subprocess.run(cmd, capture_output=True, text=True, env=env,
                          timeout=timeout, cwd=cwd)


def _git_short():
    try:
        r = _run(["git", "rev-parse", "--short", "HEAD"], cwd=ROOT)
        return r.stdout.strip() or "?"
    except Exception:
        return "?"


def run_axis(kernel, bound, samples, json_out, db, target,
             extra_clock):
    import datetime
    today = datetime.date.today().isoformat()
    commit = _git_short()
    tmp = tempfile.mkdtemp(prefix="bounded-")
    prof_json = os.path.join(tmp, "profile.json")
    kern_bound = KERNEL_BOUND.get(kernel, 0)
    if bound is None:
        bound = kern_bound
    cmd = [sys.executable, os.path.join(ROOT, "tools", "dev_profile.py"),
           "--kernels", kernel, "--samples", str(samples),
           "--skip-bench", "--target", target,
           "--bounds", json.dumps({kernel: max(bound, 1)}),
           "--json", prof_json]
    r = _run(cmd, cwd=ROOT)
    if r.returncode != 0:
        print("dev_profile failed: " + (r.stdout + r.stderr)[-1200:],
              file=sys.stderr)
        return 1
    report = json.load(open(prof_json, encoding="utf-8"))
    entry = next((e for e in report.get("kernels", [])
                  if e.get("kernel") == kernel), None)
    if not entry:
        print("no kernel entry in profile json", file=sys.stderr)
        return 2
    src_map = {}
    if kernel in dev_profile.KERNEL_COVERS:
        sym = dev_profile.KERNEL_COVERS[kernel][1]
        covers, _ = multicover.plan_covers(
            kernel, sym, tmp,
            extra_covers=dev_profile.EXTRA_COVERS.get(kernel))
        src_map = {c["id"]: c.get("src", "") for c in covers}
    extra_src = {c.get("letter", ""): c.get("src", "") for c in
                 (dev_profile.EXTRA_COVERS.get(kernel) or [])}
    axis = {"kernel": kernel, "axis": "bounded",
            "bound": bound, "kernel_bound": kern_bound,
            "samples": samples, "date": today, "commit": commit,
            "covers": []}
    db_added = []
    for ec in entry.get("covers") or []:
        p = ec.get("profile") or {}
        max_abs = p.get("max_abs")
        if max_abs is None:
            cls = "missing"
        elif max_abs == 0:
            cls = "exact"
        elif max_abs <= bound:
            cls = "bounded"
        else:
            cls = "exclude"
        axis["covers"].append({
            "id": ec.get("id"), "letter": ec.get("letter"),
            "name": ec.get("name"),
            "source": (extra_src.get(str(ec.get("letter") or "")) or
                       src_map.get(ec.get("id"), "")),
            "class": cls, "max_abs": max_abs,
            "diff_count": p.get("diff_count"),
            "mean_abs_x1000": p.get("mean_abs_x1000"),
            "verdict": ec.get("verdict"),
        })
        if db and cls == "bounded":
            row = {
                "id": "%s-%s-bounded-axis-%s-%s" % (
                    kernel, str(ec.get("id")), today, commit),
                "date": today, "commit": commit, "kernel": kernel,
                "family": entry.get("family", ""),
                "variant": (ec.get("name") or "cov%d" % (ec.get("id") or 0)),
                "input_isa": entry.get("input_isa", "neon"),
                "output_isa": entry.get("output_isa", "sve2"),
                "candidate_file": axis["covers"][-1].get("source", ""),
                "gate_vq": str(samples),
                "gate_cases": "1",
                "gate_mismatch": str(p.get("diff_count") or 0),
                "testbench": "dev_profile-bounded-axis",
                "machine": "qemu-cpuid0" if target == "qemu" else target,
                "kernel_metric": "profile_max_abs",
                "kernel_value": str(max_abs),
                "e2e_30f_pct": "",
                "e2e_100f_pct": "",
                "e2e_ci_ms": "",
                "bit_exact": ("no (bounded: max_abs<=%d; measured=%d;"
                              " diff_count=%d; md5-envelope=%s)" % (
                                  kern_bound, max_abs,
                                  p.get("diff_count") or 0,
                                  extra_clock or "-")),
                "report": "docs/94 + release/step7-qemu",
            }
            r2 = _run([sys.executable, os.path.join(ROOT, "tools",
                                                    "kernel_db.py"),
                       "add"] + ["%s=%s" % (k, v)
                                 for k, v in row.items() if v != ""],
                      cwd=ROOT)
            db_added.append((row["id"], r2.returncode))
    print("[bounded] kernel=%s bound=%d (registry hard cap=%d) samples=%d"
          % (kernel, bound, kern_bound, samples))
    for c in axis["covers"]:
        print("  cov%-3s %-28s %-8s max_abs=%s diff=%s" % (
            c["id"], (c.get("name") or "")[:28], c["class"],
            c.get("max_abs"), c.get("diff_count")))
    if db_added:
        print("[bounded] db rows:", db_added)
    if json_out:
        os.makedirs(os.path.dirname(json_out) or ".", exist_ok=True)
        with open(json_out, "w", encoding="utf-8") as f:
            json.dump(axis, f, ensure_ascii=False, indent=2,
                      sort_keys=True)
            f.write("\n")
    return 0


def main():
    ap = argparse.ArgumentParser(prog="bounded_search.py",
                                 description=__doc__)
    ap.add_argument("--kernel", default="dct32")
    ap.add_argument("--bound", type=int, default=None,
                    help="deviation budget (default: registry hard bound)")
    ap.add_argument("--samples", type=int, default=300)
    ap.add_argument("--json", default="")
    ap.add_argument("--db", action="store_true",
                    help="write bounded covers to kernel-test-db")
    ap.add_argument("--target", default="qemu",
                    choices=("qemu", "920B", "710", "950"))
    ap.add_argument("--md5-envelope", default="clip128x128x24 preset=faster qemu"
                    " max_abs<=2880 per docs/93")
    args = ap.parse_args()
    return run_axis(args.kernel, args.bound, args.samples, args.json,
                    args.db, args.target, args.md5_envelope)


if __name__ == "__main__":
    sys.exit(main())
