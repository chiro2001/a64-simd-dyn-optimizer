"""Bounded cover search for sao-b0 (band offset, AGO M3 extension).

Covers (export dynopt_sao_b0_64x4_sve2):

  A best_sve2 : width-native table lookup (fused=116, permute=33.3%,
                cp_lat 23) — svtbl 32-entry offset table + s16
                saturating add + qxtun narrow

Gate-arbitrated bit-exact vs processSaoCUB0_neon (64x4).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "lsr_u8", "tbl_s8", "addl_s16", "qadd_s16",
          "qxtun_s16", "uzp1_u8", "st1_u8"]
    tail = (["ld1_u8"] * 32 + ["lsr_u8"] * 8 + ["tbl_s8"] * 8 +
            ["addl_s16"] * 16 + ["qadd_s16"] * 16 +
            ["qxtun_s16"] * 16 + ["uzp1_u8"] * 16 + ["st1_u8"] * 16)
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2 (width-native tbl, fused=116)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.333,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_b0_64x4_sve2") -> str:
    """Return the sao-b0 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sao-b0 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sao-b0", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
