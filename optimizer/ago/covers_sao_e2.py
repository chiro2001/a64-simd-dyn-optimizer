"""Bounded cover search for sao-e2 (135deg edge reconstruction, AGO M3).

Covers (export dynopt_sao_e2_64_sve2):

  A best_sve2 : width-native port of processSaoCUE2_neon (fused=53,
                permute=27%) - down-right diagonal edge classification
                (sign(rec[x] - rec[x+stride+1]) + buff1 + 2) + 5-entry
                eoTable + saturating add/narrow; bufft[x+1] shifted
                store (compared by the gate).

Gate-arbitrated bit-exact vs processSaoCUE2_neon (64x1).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "abd_u8", "sub_s8", "add_s8", "tbl_s8",
          "qadd_s16", "qxtun_s16", "uzp1_u8", "st1_u8"]
    tail = (["ld1_u8"] * 16 + ["abd_u8"] * 8 + ["sub_s8"] * 4 +
            ["add_s8"] * 4 + ["tbl_s8"] * 2 + ["qadd_s16"] * 4 +
            ["qxtun_s16"] * 4 + ["uzp1_u8"] * 4 + ["st1_u8"] * 4)
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2 (width-native eo2, fused=53)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.270,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_e2_64_sve2") -> str:
    """Return the sao-e2 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sao-e2 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sao-e2", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
