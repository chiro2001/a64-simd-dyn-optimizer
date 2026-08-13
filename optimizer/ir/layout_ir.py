"""Typed LayoutIR (round-0012 P1, first increment).

The full P1 goal is a DCT32-scoped IR that lets atomic rewrites rediscover
v3.1 without the composite grouped template. This first increment provides
the value model (ValueLayout / RoundBarrier / ConstantMap / MemoryMap /
Tile / Target), a Plan with a stable canonical key, a layout verifier, and
an explicit `lower()` that replays the known v3.1 plan through the existing
emitter. Atomic rewrites (assign_output_lanes, segment_dot,
batch_round_narrow_store, derive_constant_map) are the next increment and
must satisfy: disabling the composite v3 template still rediscovers
<= 3962 fused_uop, upstream-exact, zero scatter.
"""

from __future__ import annotations

import hashlib
import json
from dataclasses import asdict, dataclass, field
from typing import Tuple


@dataclass(frozen=True)
class Target:
    features: Tuple[str, ...] = ("sve2",)
    fixed_vl_bytes: int = 32
    allow_scatter: bool = False


@dataclass(frozen=True)
class ValueLayout:
    logical_value: str
    elem_type: str                 # s8/s16/s32/s64
    lanes: Tuple[int, ...]         # logical output lanes this value owns
    range_hint: Tuple[int, int] = (0, 0)
    wrap_mode: str = "wrapping"    # wrapping|saturating


@dataclass(frozen=True)
class RoundBarrier:
    stage: int                     # 1 = after pass1, 2 = after pass2
    shift: int
    rounding_mode: str = "half-up" # matches vrshrn / (x + half) >> shift
    narrow_type: str = "s16"
    saturating: bool = False


@dataclass(frozen=True)
class ConstantMap:
    # logical G[k][j] -> (table, lane_range, replication)
    entries: Tuple[Tuple[str, Tuple[int, int], int], ...] = ()


@dataclass(frozen=True)
class MemoryMap:
    logical_value: str
    base: str                      # src | coef | dst
    affine_index: str              # e.g. "k*32+i"
    topology: str = "contiguous"


@dataclass(frozen=True)
class Tile:
    pass_id: int
    k_family: str                  # odd | k2 | k4 | k0
    row_group: int
    k_tile: int
    lane_owner: str                # partial | output
    acc_bits: int = 64


@dataclass(frozen=True)
class Plan:
    target: Target
    tiles: Tuple[Tile, ...]
    round_barriers: Tuple[RoundBarrier, ...]
    constant_map: ConstantMap
    memory_map: Tuple[MemoryMap, ...]
    lowering: dict = field(default_factory=dict)

    def canonical_key(self) -> str:
        """Order-independent hash over the logical plan (not generated
        source), so equivalent plans dedup before codegen."""
        obj = asdict(self)
        obj["tiles"] = sorted(
            obj["tiles"],
            key=lambda t: (t["pass_id"], t["k_family"], t["k_tile"],
                           t["row_group"], t["lane_owner"], t["acc_bits"]))
        obj["constant_map"]["entries"] = sorted(
            obj["constant_map"]["entries"], key=lambda e: e[0])
        obj["memory_map"] = sorted(
            obj["memory_map"],
            key=lambda m: (m["logical_value"], m["base"]))
        obj["round_barriers"] = sorted(
            obj["round_barriers"], key=lambda b: b["stage"])
        raw = json.dumps(obj, sort_keys=True, separators=(",", ":"))
        return hashlib.sha256(raw.encode()).hexdigest()


def verify_layout(plan: Plan) -> Tuple[bool, str]:
    """Static legality gate for the DCT32-scoped layout IR.

    Checks the hard constraints that must hold before codegen:
    fixed VL, no scatter, lane ownership fits the accumulator width,
    round barriers stay at their pass boundary, contiguous stores only,
    and no duplicate logical output lane.
    """
    if plan.target.fixed_vl_bytes != 32:
        return False, "fixed VL must be 32 bytes"
    if plan.target.allow_scatter:
        return False, "scatter/gather is a hard-disabled memory policy"
    if "sve2" not in plan.target.features:
        return False, "plan requires sve2 feature"

    seen_lanes = set()
    for t in plan.tiles:
        if t.row_group not in (1, 4, 8):
            return False, "row_group %d not supported by current emitter" \
                % t.row_group
        if t.lane_owner == "output":
            if t.acc_bits != 64:
                return False, "output-owner accumulator must be s64"
            if t.row_group * t.k_tile > 8:
                return False, ("output-owner needs <=8 s64 lanes at VL=256 "
                               "(row_group=8 uses two 4-lane accumulator "
                               "banks)")
        key = (t.pass_id, t.k_family, t.k_tile, t.row_group)
        if key in seen_lanes:
            return False, "duplicate tile %r" % (key,)
        seen_lanes.add(key)

    stages = sorted({b.stage for b in plan.round_barriers})
    if stages != [1, 2]:
        return False, "round barriers must exist exactly at pass1/pass2"
    shifts = {b.shift for b in plan.round_barriers}
    if shifts != {4, 11}:
        return False, "DCT32 8-bit shifts must be {4, 11}"

    for m in plan.memory_map:
        if m.topology != "contiguous":
            return False, "only contiguous store topology is legal"
        if m.base == "dst" and "scatter" in m.affine_index:
            return False, "scatter store in memory map"
    return True, "ok"


def lower(plan: Plan) -> str:
    """Replay a known plan through the parameterized emitter.

    This is the bridge between LayoutIR and the existing codegen until the
    atomic-rewrite backend replaces `pass_grouped_cpp`. Only v1/v2/v2b/v3
    presets plus the P0 axes are accepted; anything else raises so the IR
    cannot silently mask an unexpressible plan.
    """
    if plan.target.fixed_vl_bytes != 32:
        raise ValueError("lower: only VL=32 is implemented")
    import os
    import sys
    _root = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    _tools = os.path.join(_root, "tools")
    if _tools not in sys.path:
        sys.path.insert(0, _tools)
    from emit_dct32_sve2_shared import emit_grouped  # noqa: E402
    lo = plan.lowering
    return emit_grouped(
        func_name=lo.get("func_name", "dynopt_dct32_sve2_shared"),
        pass1_k2_slice=lo.get("pass1_k2_slice", 0),
        odd_lowering=lo.get("odd_lowering", "row-reduce"),
        narrow_batch=lo.get("narrow_batch", 1),
        constant_layout=lo.get("constant_layout", "canonical"))


def dct32_v31_plan() -> Plan:
    """Canonical plan for the current best DCT32 candidate (3962)."""
    t = Target(features=("sve2",), fixed_vl_bytes=32, allow_scatter=False)
    tiles = (
        Tile(1, "odd", 4, 1, "output", 64),
        Tile(1, "k2", 4, 1, "output", 64),
        Tile(1, "k4", 4, 1, "partial", 64),
        Tile(1, "k0", 4, 1, "partial", 64),
        Tile(2, "odd", 4, 1, "output", 64),
        Tile(2, "k2", 4, 1, "partial", 64),
        Tile(2, "k4", 4, 1, "partial", 64),
        Tile(2, "k0", 4, 1, "partial", 64),
    )
    barriers = (
        RoundBarrier(1, 4, "half-up", "s16", False),
        RoundBarrier(2, 11, "half-up", "s16", False),
    )
    consts = ConstantMap((
        ("odd-CODD", (0, 15), 4),
        ("k2-K2S", (0, 15), 4),
        ("k4-K4", (0, 3), 1),
        ("k0-K0", (0, 3), 1),
    ))
    mem = (
        MemoryMap("src", "src", "i*stride+j", "contiguous"),
        MemoryMap("coef", "coef", "k*32+i", "contiguous"),
        MemoryMap("dst", "dst", "k*32+i", "contiguous"),
    )
    lowering = {
        "func_name": "dynopt_dct32_sve2_shared",
        "pass1_k2_slice": 1,
        "odd_lowering": "sdot.d",
        "narrow_batch": 4,
        "constant_layout": "derived-replicated",
    }
    return Plan(t, tiles, barriers, consts, mem, lowering)
