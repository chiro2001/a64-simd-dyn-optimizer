"""Bounded cover search for dequant (AGO M3 extension).

Covers (export dynopt_dequant_normal_256_sve2):

  A best_sve2 : width-native port of x265_dequant_normal_sve2
                (smullb/t widen-multiply + srshl rounding shift +
                sqxtnb/t saturating narrow; fused=10 loop body)

Gate-arbitrated bit-exact vs x265_dequant_normal_neon.
"""

from __future__ import annotations

from typing import Dict

import os

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {"A": "best_sve2.cpp"}


def cover_meta() -> Dict:
    cp = ["ld1_s16", "mullb_s32", "rshl_s32", "qxtn_s16", "st1_s16"]
    return {
        "covers": ["A"],
        "names": {"A": "best_sve2 (smull+srshl+sqxtn)"},
        "cp_chains": {"A": cp},
        "tail_ops": {"A": cp},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_dequant_normal_256_sve2") -> str:
    if cover != "A":
        raise ValueError("dequant cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "dequant", "candidates",
                     _FILES["A"])
    with open(p) as f:
        return f.read()
