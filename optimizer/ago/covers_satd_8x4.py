"""Bounded cover search for satd 8x4 (AGO M3 extension).

Covers (export dynopt_satd_8x4_sve2):

  A best_cadd_bridge : cadd-butterfly bridge port of the upstream
                       hadamard_4x4_dual (fused=36, permute=0%,
                       cp_lat 13) — the 8-wide shape cannot fill
                       VL=256 vectors, so the 128-bit bridge mirrors
                       the upstream exactly (same as psy-cost cadd)
  B/C/D               : NEON trn covers from covers_satd_shapes (8x4)

Gate-arbitrated bit-exact vs x265::satd8_sve2<8,4>.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_cadd_bridge.cpp",
}


def cover_meta() -> Dict:
    return {
        "covers": ["A"],
        "names": {"A": "best_cadd_bridge (fused=36, permute=0%)"},
        "cp_chains": {"A": ["ld1_u8", "addl_u8", "cadd_s16", "tbl_s16",
                            "cadd_s16", "abs_s16", "umax_u16", "paddl_u16"]},
        "tail_ops": {"A": ["ld1_u8"] * 4 + ["addl_u8"] * 4 +
                          ["cadd_s16"] * 8 + ["tbl_s16"] * 4 +
                          ["abs_s16"] * 2 + ["umax_u16"] * 2 +
                          ["paddl_u16"] * 2},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_satd_8x4_sve2") -> str:
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    if cover != "A":
        raise ValueError("satd-8x4 cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "satd-8x4", "candidates",
                     _FILES["A"])
    with open(p) as f:
        return f.read()
