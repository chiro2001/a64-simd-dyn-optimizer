#!/usr/bin/env python3
"""Feedback Loop: calibrate ago_pred against measured kernel cycles.

Ingest a measurements JSON (the format the 950 microbench reports):

    [
      {"kernel": "dct16",  "cover": "op895", "measured_cyc": 95.0},
      {"kernel": "satd16", "cover": "C",     "measured_cyc": 12.4},
      ...
    ]

For each row: emit the cover source (optimizer/ago/covers_*.py), compile
(-O3 armv8.2-a+sve2), extract final-object features, predict with the
current cost table (predict.py), then scale = measured / predicted.
Per-kernel scale = median across that kernel's rows (outlier-filtered,
[0.5, 2.0]). Writes build/calibration.json:

    {"kernel": {"scale": ..., "n": ..., "ratio_min": ..., "ratio_max": ...}}

The rank path (search_sve2_layouts --rank-by ago) loads it automatically
(or $DYNOPT_CALIBRATION) and multiplies ago_pred by the scale.

Usage:
    python3 tools/feedback_calibrate.py --ingest <measurements.json> \
        [--table benchmarks/neon-timing-n1/timing-n1.json] \
        [--out build/calibration.json] [--march armv8.2-a+sve2]
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer"))
sys.path.insert(0, ROOT)

_CXX = "aarch64-linux-gnu-g++"


def _emit_source(kernel: str, cover: str) -> str:
    from ago_auto_search import KERNEL_COVERS  # noqa: E402
    module_name, func_name = KERNEL_COVERS[kernel]
    module = __import__(module_name, fromlist=["emit_cover", "cover_meta"])
    return module.emit_cover(cover, func_name)


def predict_row(kernel: str, cover: str, table: dict,
                march: str, tmpdir: str) -> float:
    """Compile the cover and predict its cycles with the current table."""
    from ago.objfeatures import extract_features  # noqa: E402
    from ago.predict import predict_from_features  # noqa: E402
    from ago_auto_search import KERNEL_COVERS  # noqa: E402

    module_name, _ = KERNEL_COVERS[kernel]
    module = __import__(module_name, fromlist=["cover_meta"])
    meta = module.cover_meta()

    code = _emit_source(kernel, cover)
    cpp = os.path.join(tmpdir, "%s-%s.cpp" % (kernel, cover))
    with open(cpp, "w") as f:
        f.write(code)
    obj = cpp.replace(".cpp", ".o")
    r = subprocess.run(
        [_CXX, "-O3", "-march=" + march, "-c", cpp, "-o", obj],
        capture_output=True, timeout=180)
    if r.returncode != 0:
        raise RuntimeError("compile failed for %s/%s" % (kernel, cover))
    feats = extract_features(obj, cpp)
    p = predict_from_features(meta, cover, table, feats)
    return float(p["predicted_cyc"])


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--ingest", required=True,
                    help="measurements JSON (list of {kernel, cover, measured_cyc})")
    ap.add_argument("--table", default=os.path.join(
        ROOT, "benchmarks", "neon-timing-n1", "timing-n1.json"))
    ap.add_argument("--out", default=os.path.join(ROOT, "build", "calibration.json"))
    ap.add_argument("--march", default="armv8.2-a+sve2")
    args = ap.parse_args()

    with open(args.ingest) as f:
        measurements = json.load(f)
    with open(args.table) as f:
        table = json.load(f)

    from ago.calibration import fit_scales  # noqa: E402

    rows = []
    with tempfile.TemporaryDirectory(prefix="feedback-cal-") as tmpdir:
        for m in measurements:
            kernel = m["kernel"]
            cover = m["cover"]
            try:
                predicted = predict_row(kernel, cover, table, args.march, tmpdir)
            except (RuntimeError, KeyError, ValueError) as exc:
                print("SKIP %s/%s: %s" % (kernel, cover, exc))
                continue
            measured = float(m["measured_cyc"])
            ratio = measured / predicted if predicted else float("inf")
            rows.append({"kernel": kernel, "cover": cover,
                         "predicted": predicted, "measured": measured,
                         "ratio": ratio})
            print("  %-20s %-12s predicted=%8.1f measured=%8.1f ratio=%.3f"
                  % (kernel, cover, predicted, measured, ratio))

    if not rows:
        print("no rows processed")
        return 1

    scales = fit_scales(rows)
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w") as f:
        json.dump(scales, f, indent=2, sort_keys=True)
        f.write("\n")

    print("\ncalibration written to %s" % args.out)
    print("%-20s %7s %4s %8s %8s" % ("kernel", "scale", "n", "min", "max"))
    for k in sorted(scales):
        e = scales[k]
        print("%-20s %7.3f %4d %8.3f %8.3f%s"
              % (k, e["scale"], e["n"], e["ratio_min"], e["ratio_max"],
                 "  (%d outliers)" % e["outliers"] if e["outliers"] else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
