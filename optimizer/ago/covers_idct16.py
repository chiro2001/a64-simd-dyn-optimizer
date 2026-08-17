"""Bounded cover search for idct16 (AGO M3 extension).

Covers (export dynopt_idct16_sve2_shared):

  A anchor_sve2 : anchor variant (fused=1282, permute=26.1%)
  B scatter_sve2: scatter variant (fused=1143, permute=23.1%)
  C zip16_sve2  : zip16 variant (fused=1151, permute=36.4%)

Gate-arbitrated bit-exact vs the idct16 reference (idct16_verify).
"""

from __future__ import annotations

from typing import Dict

import os

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {"A": "anchor_sve2.cpp", "B": "scatter_sve2.cpp",
          "C": "zip16_sve2.cpp"}


def cover_meta() -> Dict:
    cp = ["ld1_s16", "add_s16", "tbl_s16", "mul_s16", "st1_s16"]
    tail = (["ld1_s16"] * 32 + ["add_s16"] * 64 + ["tbl_s16"] * 16 +
            ["mul_s16"] * 64 + ["st1_s16"] * 32)
    return {
        "covers": ["A", "B", "C"],
        "names": {"A": "anchor (1282/26.1%)", "B": "scatter (1143/23.1%)",
                  "C": "zip16 (1151/36.4%)"},
        "cp_chains": {"A": cp, "B": cp, "C": cp},
        "tail_ops": {"A": tail, "B": tail, "C": tail},
        "expected_permute_ratio": {"A": 0.261, "B": 0.231, "C": 0.364},
    }


def emit_cover(cover: str, func_name: str = "dynopt_idct16_sve2_shared") -> str:
    if cover not in _FILES:
        raise ValueError("idct16 cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "idct16", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
