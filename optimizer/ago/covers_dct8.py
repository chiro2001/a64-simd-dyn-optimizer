"""Bounded cover search for dct8 (AGO M3 extension).

Covers:

  A best_sve2    : hand-written SVE2 (fused=289@clang, permute=18.5%,
                    cp_lat 59) — passes the dct8 gate

(B sve2_shared is NOT bit-exact — VERIFY FAIL 127983 mism on 2000
cases; proto_b/c/fused export dynopt_dct8_neon_* symbols - LINK FAIL.
All non-A candidates are scan-only.)
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_s16", "add_s16", "sub_s16", "tbl_s16", "add_s16",
          "mul_s16", "st1_s16"]
    tail = (["ld1_s16"] * 8 + ["add_s16"] * 32 + ["sub_s16"] * 32 +
            ["tbl_s16"] * 8 + ["mul_s16"] * 32 + ["st1_s16"] * 8)
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2 (fused=289@clang, permute=18.5%)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.185,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_dct8_sve2_shared") -> str:
    """Return an existing dct8 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("dct8 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "dct8", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
