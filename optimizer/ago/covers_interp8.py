"""Bounded cover search for interp8 hpp 8x8 (AGO M3, docs/80).

All covers share the upstream dataflow (8-tap horizontal filter:
load window -> gather taps -> dot-product accumulate -> narrow -> store)
and differ in the dot-product instruction selection:

  A svdot32  : svdot_s32 (s8xs8->s32, 8 pixel/lane, no addp RMW)
              — permute_ratio=20.5%, fused_uop=87 (BEST)
  B svdot64  : svdot_s64 (s16xs16->s64, 4 groups + addp_s32 pair-sum)
              — permute_ratio=53.3%, fused_uop=127 (current best_sve2)
  C neon     : vmull/vmlal (pure NEON, VL=128 baseline)
              — permute_ratio=~15% (estimated, 2x width)

Cover A (svdot_s32) is the M3 template output (docs/80): the s8 input
avoids u8->u16 widening, and the 8-group s32 output maps 1:1 to pixels,
eliminating the addp RMW serial dependency that makes Cover B
permute-bound on 950.

cp_chains are annotated per cover (source-level dependency structure).
"""

from __future__ import annotations

from typing import Dict


def cover_meta() -> Dict:
    """Return cover metadata for AGO predictor.

    cp_chains: source-level critical path op sequence (by cost-table key).
    tail_ops:  throughput-bound ops in the tail (by cost-table key).
    """
    return {
        "covers": ["A", "B", "C"],
        "names": {
            "A": "svdot32 (s8xs8->s32, 8 pixel/lane)",
            "B": "svdot64 (s16xs16->s64, addp pair-sum)",
            "C": "neon (vmull/vmlal, VL=128)",
        },
        "cp_chains": {
            # svdot_s32 path: load -> sub -> svtbl -> svdot -> rshrnb -> uzp1 -> vqmovun -> st
            "A": ["ld1b_s8", "sub_s8", "tbl_s8", "sdot",
                  "rshrnb", "uzp1", "xtn", "st1_u8"],
            # svdot_s64 path: ld1ub_u16 -> svtbl_u16 -> svdot_s64 ->
            # uzp1_s32 -> svtbl2 -> rshrnb -> uzp1 -> vqmovun -> st
            "B": ["ld1b_u16", "tbl_s8", "sdot", "uzp1",
                  "tbl_s8", "rshrnb", "uzp1", "xtn", "st1_u8"],
            # NEON path: vld1 -> vmull -> vmlal -> vqrshrun -> vst1
            "C": ["ld1_u8", "mull_s16", "mla_s16",
                  "rshrun", "st1_u8"],
        },
        "tail_ops": {
            "A": ["sdot"] * 2 + ["rshrnb", "uzp1", "xtn", "st1_u8"],
            "B": ["sdot"] * 4 + ["uzp1", "tbl_s8", "rshrnb",
                                 "uzp1", "xtn", "st1_u8"],
            "C": ["mull_s16", "mla_s16"] * 4 + ["rshrun", "st1_u8"],
        },
        "expected_permute_ratio": {
            "A": 0.205,  # measured (docs/80)
            "B": 0.533,  # measured (docs/80)
            "C": 0.150,  # estimated
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_interp8_8x8_sve2") -> str:
    """Emit cover variant as C++ source code.

    A: svdot_s32 (optimizer/ir/interp8_wide_sve2.py)
    B: svdot_s64 (tools/emit_interp8_sve2_shared.py emit())
    C: NEON (optimizer/ir/interp8_emit.py)
    """
    import os
    import sys

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    _ir = os.path.join(_ROOT, "optimizer", "ir")
    if _ir not in sys.path:
        sys.path.insert(0, _ir)

    if cover == "A":
        from interp8_wide_sve2 import emit_svdot32
        return emit_svdot32(func_name=func_name, width=8, height=8)

    if cover == "B":
        _tools = os.path.join(_ROOT, "tools")
        if _tools not in sys.path:
            sys.path.insert(0, _tools)
        from emit_interp8_sve2_shared import emit
        return emit(func_name=func_name)

    if cover == "C":
        from interp8_emit import emit_interp8_hpp
        from interp8_op_ir import interp8_hpp_8x8_dag
        return emit_interp8_hpp(interp8_hpp_8x8_dag(), func_name=func_name)

    raise ValueError("interp8 cover %s not defined" % cover)
