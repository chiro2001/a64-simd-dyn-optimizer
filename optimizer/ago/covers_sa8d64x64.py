"""Bounded cover search for sa8d-64x64 (AGO M3 extension).

Covers:

  A best_wide_cadd : width-native cadd butterfly (64x64, 4
                     half-vectors x 8 8-row passes); gate-arbitrated
                     bit-exact vs x265::sa8d16x32_sve2<64,64>.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_wide_cadd.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "addl_u8", "cadd_s16", "tbl_s16", "cadd_s16",
          "tbl_s16", "cadd_s16", "abs_s16", "umax_u16", "add_u16",
          "uaddv_u16"]
    tail = (["ld1_u8"] * 4096 + ["addl_u8"] * 2048 +
            ["cadd_s16"] * 1536 + ["tbl_s16"] * 1024 +
            ["abs_s16"] * 512 + ["umax_u16"] * 256 +
            ["add_u16"] * 256 + ["uaddv_u16"])
    return {
        "covers": ["A"],
        "names": {
            "A": "best_wide_cadd (width-native cadd, 64x64)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.10,
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sa8d_64x64_sve2") -> str:
    """Return the sa8d-64x64 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sa8d-64x64 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sa8d-64x64", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
