"""Bounded cover search for cost-coeff-nxn (AGO M3, docs/82 #4 扩展).

Covers wrap the existing candidates (scan data, reports/scan-permute-
all-20260818.txt):

  A best_sve2         : looped scan/cost kernel (permute=45.5%, fused=23)
  B best_sve2_unroll  : unrolled variant (permute=0.0%, fused=268)

The auto-search must rank B (0.0%) above A (45.5%) — permute_ratio is
the rho=-1.000 950 predictor. Both define the manifest symbol
dynopt_cost_coeff_nxn_sve2, so the full pipeline can verify both.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
    "B": "best_sve2_unroll.cpp",
}


def cover_meta() -> Dict:
    # cost-coeff: scan-ordered coefficient magnitude accumulation.
    # The looped variant interleaves scan (permutes) with cost adds.
    cp = ["ld1_u16", "abs_s16", "add_u16", "add_u16"]
    tail = ["ld1_u16", "abs_s16", "add_u16"]
    return {
        "covers": ["A", "B"],
        "names": {
            "A": "best_sve2 (looped, permute=45.5%)",
            "B": "best_sve2_unroll (unrolled, permute=0.0%)",
        },
        "cp_chains": {"A": cp, "B": cp},
        "tail_ops": {"A": tail, "B": tail},
        "expected_permute_ratio": {
            "A": 0.455,  # measured (scan-permute-all-20260818.txt)
            "B": 0.0,    # measured
        },
    }


def emit_cover(cover: str,
               func_name: str = "dynopt_cost_coeff_nxn_sve2") -> str:
    """Return an existing cost-coeff candidate source (symbol in file)."""
    if cover not in _FILES:
        raise ValueError("cost-coeff cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "cost-coeff-nxn", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
