"""Bounded cover search for sao-e3 (45deg edge reconstruction, AGO M3).

Covers (export dynopt_sao_e3_64_sve2):

  A best_sve2 : width-native port of processSaoCUE3_neon (startX=0,
                endX=64) - vertical pair at shifted x (1..64) with
                upBuff1[x-1] shifted store + 5-entry eoTable +
                saturating add/narrow.

Gate-arbitrated bit-exact vs processSaoCUE3_neon (64x1).
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
            "A": "best_sve2 (width-native eo3, fused=53)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.270,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_e3_64_sve2") -> str:
    """Return the sao-e3 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sao-e3 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sao-e3", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
