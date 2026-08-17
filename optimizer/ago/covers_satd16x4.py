"""Bounded cover search for satd-16x4 (AGO M3 extension).

Covers:

  A best_sve2_cadd : native SVE2 cadd butterfly (16x4, 1
                     half-vectors x 1 4-row quads); gate-arbitrated
                     bit-exact vs x265::satd8_sve2<16,4>.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2_cadd.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "addl_u8", "cadd_s16", "tbl_s16", "cadd_s16",
          "add_u16", "abs_s16", "paddl_u16", "add_u16"]
    tail = (["ld1_u8"] * 64 + ["addl_u8"] * 32 +
            ["cadd_s16"] * 8 + ["tbl_s16"] * 4 +
            ["add_u16"] * 4 + ["abs_s16"] * 4 +
            ["paddl_u16"])
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2_cadd (SVE2 native cadd, 16x4)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.10,
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_satd_16x4_sve2") -> str:
    """Return the satd-16x4 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("satd-16x4 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "satd-16x4", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
