"""Bounded cover search for sa8d 16x16 (AGO M3 extension).

Covers:

  A best_sve1     : existing width-ish SVE1 (fused=411, permute=16.9%)
  B best_sve2     : existing NEON-128 trn (fused=404, permute=20.2%)
  C best_wide_cadd: width-native cadd butterfly port of the upstream
                    hadamard_8x8 (fused=177, permute=10.3%, cp_lat 46
                    vs 100/95) — processes left/right 8x8 quadrants
                    simultaneously at VL=256

The auto-search must rank C above A/B (fewer uops, lower permute).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve1.cpp",
    "B": "best_sve2.cpp",
    "C": "best_wide_cadd.cpp",
}


def cover_meta() -> Dict:
    # SA8D 16x16 dataflow (all covers): load diff -> 8-point hadamard
    # (cadd/tbl or trn) -> abs/max fold -> u16 sum -> final >>1.
    cp = ["ld1_u8", "addl_u8", "cadd_s16", "tbl_s16", "cadd_s16",
          "tbl_s16", "cadd_s16", "abs_s16", "umax_u16", "add_u16",
          "uaddv_u16"]
    tail = (["ld1_u8"] * 64 + ["addl_u8"] * 32 + ["cadd_s16"] * 48 +
            ["tbl_s16"] * 32 + ["abs_s16"] * 16 + ["umax_u16"] * 8 +
            ["add_u16"] * 8 + ["uaddv_u16"])
    return {
        "covers": ["A", "B", "C"],
        "names": {
            "A": "best_sve1 (SVE1, fused=411)",
            "B": "best_sve2 (NEON-128 trn, fused=404)",
            "C": "best_wide_cadd (width-native cadd, fused=177)",
        },
        "cp_chains": {"A": cp, "B": cp, "C": cp},
        "tail_ops": {"A": tail, "B": tail, "C": tail},
        "expected_permute_ratio": {
            "A": 0.169,  # measured
            "B": 0.202,  # measured
            "C": 0.103,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sa8d_16x16_sve2") -> str:
    """Return an existing sa8d16 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sa8d16 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sa8d16", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
