"""Bounded cover search for sao-e1 (edge offset reconstruction, AGO M3 ext).

Covers (export dynopt_sao_e1_64x4_sve2):

  A best_sve2 : width-native port of processSaoCUE1_neon (fused=213,
                permute=23.8%) - vertical edge classification (sign_down
                + upBuff + 2) + 5-entry eoTable lookup + saturating
                add/narrow (sao-b0 pattern); upBuff carried across the
                4 rows and compared by the gate.

Gate-arbitrated bit-exact vs processSaoCUE1_neon (64x4).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "abd_u8", "sub_s8", "add_s8", "tbl_s8",
          "qadd_s16", "qxtun_s16", "uzp1_u8", "st1_u8"]
    tail = (["ld1_u8"] * 64 + ["abd_u8"] * 32 + ["sub_s8"] * 16 +
            ["add_s8"] * 16 + ["tbl_s8"] * 8 + ["qadd_s16"] * 16 +
            ["qxtun_s16"] * 16 + ["uzp1_u8"] * 16 + ["st1_u8"] * 16)
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2 (width-native eo, fused=213)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.238,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_e1_64x4_sve2") -> str:
    """Return the sao-e1 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sao-e1 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sao-e1", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
