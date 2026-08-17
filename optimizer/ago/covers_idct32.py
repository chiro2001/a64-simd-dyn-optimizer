"""Bounded cover search for idct32 (AGO M3 extension).

Covers (export dynopt_idct32_sve2_shared):

  A scalar_sve2  : scalar variant (fused=5968, permute=11.6%)
  B scatter_sve2 : scatter variant (fused=8670, permute=15.3%)

(sdot_* are SVE2p1 - not compiled under plain sve2, scan-only.)

Gate-arbitrated bit-exact vs the idct32 reference.
"""

from __future__ import annotations

from typing import Dict

import os

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {"A": "scalar_sve2.cpp", "B": "scatter_sve2.cpp"}


def cover_meta() -> Dict:
    cp = ["ld1_s16", "add_s16", "tbl_s16", "mul_s16", "st1_s16"]
    tail = (["ld1_s16"] * 64 + ["add_s16"] * 128 + ["tbl_s16"] * 32 +
            ["mul_s16"] * 128 + ["st1_s16"] * 64)
    return {
        "covers": ["A", "B"],
        "names": {"A": "scalar (5968/11.6%)", "B": "scatter (8670/15.3%)"},
        "cp_chains": {"A": cp, "B": cp},
        "tail_ops": {"A": tail, "B": tail},
        "expected_permute_ratio": {"A": 0.116, "B": 0.153},
    }


def emit_cover(cover: str, func_name: str = "dynopt_idct32_sve2_shared") -> str:
    if cover not in _FILES:
        raise ValueError("idct32 cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "idct32", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
