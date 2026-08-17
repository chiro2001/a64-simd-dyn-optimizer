"""Bounded cover search for satd 32x16 (AGO M3 extension).

Covers:

  A best_sve2_cadd : native SVE2 cadd butterfly, vertical extension of
                     the verified satd-16 cadd kernel (32 rows = 8
                     quads); fused (loop body), horizontal-doubled

The shape had no hand-written candidate before; the auto-search emits
the cadd-template cover and gates it bit-exact vs
x265::satd8_sve2<32,16>.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2_cadd.cpp",
}


def cover_meta() -> Dict:
    # SATD 32x16 dataflow: load -> sub/u16 -> horizontal 4-point cadd
    # butterfly (cadd + tbl reorder) -> vertical pair abs/abd -> max ->
    # per-quad sum -> total (two 16-lane halves).
    cp = ["ld1_u8", "addl_u8", "cadd_s16", "tbl_s16", "cadd_s16",
          "add_u16", "abs_s16", "paddl_u16", "add_u16"]
    tail = (["ld1_u8"] * 64 + ["addl_u8"] * 32 + ["cadd_s16"] * 64 +
            ["tbl_s16"] * 32 + ["add_u16"] * 16 + ["abs_s16"] * 16 +
            ["paddl_u16"])
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2_cadd (SVE2 native cadd, 32-row ext)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.25,  # measured (loop body)
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_satd_32x16_sve2") -> str:
    """Return the satd-32x16 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("satd-32x16 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "satd-32x16", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
