"""Bounded cover search for sad 16x16 (AGO M3, docs/82 下一步 #4).

Covers are the existing hand-written/IR candidates (docs/37: SAD has
"no optimization space" — the dotprod NEON reference is already optimal):

  A best_sve2     : hand-written SVE2 (permute_ratio=0.0%, fused=80)
  B best_ir       : IR-generated SVE2 (permute_ratio=0.0%, fused=66)
  C best_ir_sve16 : dual-group 16-lane IR (permute_ratio=54.7%, fused=384,
                    expected loser on 950)
  D uadalp-wide   : SVE2 wide-accumulate (svuadalp), 1 uadalp/row instead
                    of per-row svaddv reduction (round-33 discovery: 920B
                    measurement showed A's per-row reduction is 2.3x slower
                    than the NEON reference; D removes the reduction tree).
                    NOTE: UADALP is SVE2-only — SVE1 has no pairwise wide
                    accumulate (that is exactly why x265 uses NEON for sad
                    on aarch64). D targets 950; under --isa sve1 it must
                    report ISA REJECT.

The auto-search must rank A/B above C (permute_ratio rho=-1.000 vs 950),
and D should beat A/B on fused_uop + cp_lat (no per-row reduction).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
    "B": "best_ir.cpp",
    "C": "best_ir_sve16.cpp",
    "D": "best_sve2_adalp.cpp",
}

def cover_meta() -> Dict:
    # SAD 16x16 dataflow (all covers): load 16x16 x2 -> abd/sub ->
    # pairwise accumulate (uadalp tree) -> horizontal sum.
    cp = ["ld1_u8", "abd_u8", "addl_u8", "paddl_u16", "paddl_u16",
          "add_u16"]
    tail = (["ld1_u8"] * 32 + ["abd_u8"] * 16 + ["paddl_u16"] * 8 +
            ["add_u16"])
    return {
        "covers": ["A", "B", "C", "D"],
        "names": {
            "A": "best_sve2 (SVE2, permute=0.0%)",
            "B": "best_ir (IR SVE2, permute=0.0%)",
            "C": "best_ir_sve16 (dual-group, permute=54.7%)",
            "D": "uadalp-wide (SVE1, 1 uadalp/row)",
        },
        "cp_chains": {"A": cp, "B": cp, "C": cp, "D": cp},
        "tail_ops": {"A": tail, "B": tail, "C": tail, "D": tail},
        "expected_permute_ratio": {
            "A": 0.0,    # measured (reports/scan-permute-all-20260818.txt)
            "B": 0.0,    # measured
            "C": 0.547,  # measured
            "D": 0.0,    # same dataflow family as A/B
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sad_16x16_sve2") -> str:
    """Return an existing sad candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("sad cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sad", "candidates", _FILES[cover])
    with open(p) as f:
        return f.read()
