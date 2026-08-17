"""Bounded cover search for satd 8x32 (AGO M3 extension).

Covers (export dynopt_satd_8x32_sve2):

  A best_cadd_bridge : 128-bit bridge port of hadamard_4x4_quad x4
                       (8x8 blocks; fused=75 loop body, permute=0%)

Gate-arbitrated bit-exact vs x265::satd8_sve2<8,32>.
"""

from __future__ import annotations

from typing import Dict

_FILES = {"A": "best_cadd_bridge.cpp"}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "addl_u8", "cadd_s16", "tbl_s16", "cadd_s16",
          "abs_s16", "umax_u16", "paddl_u16"]
    tail = (["ld1_u8"] * 64 + ["addl_u8"] * 64 + ["cadd_s16"] * 96 +
            ["tbl_s16"] * 64 + ["abs_s16"] * 32 + ["umax_u16"] * 16 +
            ["paddl_u16"] * 8)
    return {
        "covers": ["A"],
        "names": {"A": "best_cadd_bridge (fused=75 loop body)"},
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_satd_8x32_sve2") -> str:
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    if cover != "A":
        raise ValueError("satd-8x32 cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "satd-8x32", "candidates",
                     _FILES["A"])
    with open(p) as f:
        return f.read()
