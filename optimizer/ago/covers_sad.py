"""Bounded cover search for sad 16x16 (AGO M3, docs/82 下一步 #4).

Covers are the existing hand-written/IR candidates (docs/37: SAD has
"no optimization space" — the dotprod NEON reference is already optimal):

  A best_sve2     : hand-written SVE2 (permute_ratio=0.0%, fused=80)
  B best_ir       : IR-generated SVE2 (permute_ratio=0.0%, fused=66)
  C best_ir_sve16 : dual-group 16-lane IR (permute_ratio=54.7%, fused=384,
                    expected loser on 950)

The auto-search must rank A/B above C (permute_ratio rho=-1.000 vs 950).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
    "B": "best_ir.cpp",
    "C": "best_ir_sve16.cpp",
}


def cover_meta() -> Dict:
    return {
        "covers": ["A", "B", "C"],
        "names": {
            "A": "best_sve2 (SVE2, permute=0.0%)",
            "B": "best_ir (IR SVE2, permute=0.0%)",
            "C": "best_ir_sve16 (dual-group, permute=54.7%)",
        },
        "expected_permute_ratio": {
            "A": 0.0,    # measured (reports/scan-permute-all-20260818.txt)
            "B": 0.0,    # measured
            "C": 0.547,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sad_16x16_sve2") -> str:
    """Return an existing sad candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sad cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sad", "candidates", _FILES[cover])
    with open(p) as f:
        return f.read()
