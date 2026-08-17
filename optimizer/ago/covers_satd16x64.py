"""Bounded cover search for satd 16x64 (AGO M3 extension).

Covers:

  A best_sve2_cadd : native SVE2 cadd butterfly, vertical extension of
                     the verified satd-16 cadd kernel (64 rows = 16
                     quads); fused=38 (loop body), permute=22.2%

The shape had no hand-written candidate before; the auto-search emits
the cadd-template cover and gates it bit-exact vs
x265::satd8_sve2<16,64>.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2_cadd.cpp",
}


def cover_meta() -> Dict:
    # SATD 16x64 dataflow: load -> sub/u16 -> horizontal 4-point cadd
    # butterfly (cadd + tbl reorder) -> vertical pair abs/abd -> max ->
    # per-quad sum -> total (16 quads).
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
            "A": 0.222,  # measured (loop body)
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_satd_16x64_sve2") -> str:
    """Return the satd-16x64 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("satd-16x64 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "satd-16x64", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
