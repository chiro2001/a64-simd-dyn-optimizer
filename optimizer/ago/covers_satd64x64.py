"""Bounded cover search for satd-64x64 (AGO M3 extension).

Covers:

  A best_sve2_cadd : native SVE2 cadd butterfly (64x64); gate-arbitrated
                     bit-exact vs x265::satd8_sve2<64,64>.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2_cadd.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "addl_u8", "cadd_s16", "tbl_s16", "cadd_s16",
          "add_u16", "abs_s16", "paddl_u16", "add_u16"]
    tail = (["ld1_u8"] * 4096 + ["addl_u8"] * 2048 +
            ["cadd_s16"] * 2048 + ["tbl_s16"] * 512 +
            ["add_u16"] * 1024 + ["abs_s16"] * 1024 +
            ["paddl_u16"])
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2_cadd (SVE2 native cadd, 64x64)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.25,
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_satd_64x64_sve2") -> str:
    """Return the satd-64x64 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("satd-64x64 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "satd-64x64", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
