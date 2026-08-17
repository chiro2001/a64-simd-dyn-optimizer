"""Bounded cover search for satd 16x16 (AGO M3, docs/82 下一步 #4).

Covers wrap the existing satd-16 candidates:

  A best_sve1 : SVE1 VL=256 single-width (permute_ratio=8.0%, fused=172)
  B best_ir_sve16 : dual-group 16-lane IR (permute_ratio=58.8%, fused=731,
                    expected loser on 950 — same pattern as dct16 sve16)

The auto-search must rank A above B (permute_ratio rho=-1.000 vs 950).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve1.cpp",
    "B": "best_ir_sve16.cpp",
}


def cover_meta() -> Dict:
    return {
        "covers": ["A", "B"],
        "names": {
            "A": "best_sve1 (SVE1, permute=8.0%)",
            "B": "best_ir_sve16 (dual-group, permute=58.8%)",
        },
        "expected_permute_ratio": {
            "A": 0.080,  # measured (reports/scan-permute-all-20260818.txt)
            "B": 0.588,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_satd_16x16_sve2") -> str:
    """Return an existing satd-16 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("satd-16 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "satd-16", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
