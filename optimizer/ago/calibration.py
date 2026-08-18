"""Feedback-loop calibration: kernel-level scale factors for ago_pred.

The analytical predictor (predict.py) uses per-op cost tables measured
on N1/920B; measured kernel cycles on the real target (e.g. 950) can
deviate systematically per kernel.  tools/feedback_calibrate.py fits a
per-kernel scale = median(measured / predicted) from an ingested
measurements file and writes build/calibration.json here:

    {"dct16": {"scale": 1.23, "n": 3,
               "ratio_min": 1.10, "ratio_max": 1.40}, ...}

The rank paths (search_sve2_layouts --rank-by ago) load it when present
(or $DYNOPT_CALIBRATION) and multiply ago_pred by the kernel's scale.
"""

from __future__ import annotations

import json
import os
from typing import Dict, Optional


def default_calibration_path() -> str:
    return os.environ.get(
        "DYNOPT_CALIBRATION",
        os.path.join(os.path.dirname(os.path.dirname(
            os.path.dirname(os.path.abspath(__file__)))),
            "build", "calibration.json"))


def load_calibration(path: Optional[str] = None) -> Dict:
    """Load the calibration JSON; missing/unreadable -> empty dict.

    Never raises: a calibration is an optional refinement, not a gate.
    """
    p = path or default_calibration_path()
    try:
        with open(p) as f:
            data = json.load(f)
        if not isinstance(data, dict):
            return {}
        return {k: v for k, v in data.items()
                if isinstance(v, dict) and isinstance(v.get("scale"), (int, float))}
    except (OSError, ValueError):
        return {}


def apply_calibration(predicted_cyc: float, kernel: str,
                      calibration: Optional[Dict] = None) -> float:
    """Multiply predicted cycles by the kernel's calibrated scale."""
    cal = calibration if calibration is not None else load_calibration()
    if cal:
        entry = cal.get(kernel)
        if entry and entry.get("scale"):
            return float(predicted_cyc) * float(entry["scale"])
    return float(predicted_cyc)


def fit_scales(rows: list, min_ratio: float = 0.5,
               max_ratio: float = 2.0) -> Dict:
    """Fit per-kernel median scale from measurement rows.

    rows: [{"kernel": ..., "predicted": float, "measured": float}]
    Outlier filtering is relative to the kernel's median: entries
    outside [0.5 * median, 2.0 * median] are dropped (two-pass).
    This handles both well-calibrated (ratio ~1x) and initial
    calibration (ratio ~50-80x due to loop static undercount).
    """
    from collections import defaultdict
    from statistics import median

    ratios = defaultdict(list)
    for r in rows:
        p = float(r["predicted"])
        m = float(r["measured"])
        if p <= 0:
            continue
        ratios[r["kernel"]].append(m / p)
    out = {}
    for kernel, rs in ratios.items():
        # Pass 1: compute median from all entries
        med = median(rs)
        # Pass 2: filter relative to median (robust to any absolute scale)
        lo = med * min_ratio
        hi = med * max_ratio
        sane = [x for x in rs if lo <= x <= hi]
        base = sorted(sane) if sane else sorted(rs)
        scale = base[len(base) // 2]
        out[kernel] = {
            "scale": round(scale, 4),
            "n": len(rs),
            "ratio_min": round(min(rs), 4),
            "ratio_max": round(max(rs), 4),
            "outliers": len(rs) - len(sane),
        }
    return out
