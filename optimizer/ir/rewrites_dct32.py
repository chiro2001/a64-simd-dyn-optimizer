"""Atomic DCT32 layout rewrites (round-0012 P1, increment 2).

Each rewrite transforms a Plan and returns a ProofCertificate listing the
obligations it verified before applying. The long-term acceptance is that
these rewrites, searched from a canonical spec plan WITHOUT the composite
v3 template, rediscover a candidate <= 3962 fused_uop. This increment
implements the rewrite semantics on the Plan level and demonstrates the
rediscovery path on the v3.1 plan; search integration comes next.
"""

from __future__ import annotations

from dataclasses import dataclass, replace
from typing import Tuple

from layout_ir import ConstantMap, Plan, Tile


@dataclass(frozen=True)
class ProofObligation:
    kind: str          # range | lanes | round | address | isa | memory
    detail: str


@dataclass(frozen=True)
class ProofCertificate:
    rule: str
    obligations: Tuple[ProofObligation, ...]


def _ob(rule, *obligations):
    return ProofCertificate(rule, tuple(obligations))


def assign_output_lanes(plan: Plan, row_group: int = 4):
    """Map each output to its own s64 lane (row_group<=4 at VL=256).

    Eligible: odd and k2 families in both passes. k4/k0 stay partial
    (only 4/2 terms, packing them into output lanes wastes half the VL).
    """
    if row_group not in (1, 4):
        raise ValueError("assign_output_lanes: row_group must be 1 or 4")
    obs = []
    new_tiles = []
    for t in plan.tiles:
        if t.k_family == "odd" or (t.k_family == "k2" and t.pass_id == 1):
            if t.row_group * t.k_tile > 4:
                raise ValueError(
                    "assign_output_lanes: %s needs %d s64 lanes > 4"
                    % (t.k_family, t.row_group * t.k_tile))
            obs.append(ProofObligation(
                "lanes", "%s: %d outputs fit 4 s64 lanes at VL=256"
                % (t.k_family, t.row_group * t.k_tile)))
            new_tiles.append(replace(t, row_group=row_group,
                                     lane_owner="output", acc_bits=64))
        else:
            new_tiles.append(t)
    return replace(plan, tiles=tuple(new_tiles)), \
        _ob("assign_output_lanes", *obs)


def segment_dot(plan: Plan, term_group: int = 4, acc_bits: int = 64):
    """Lower 16-term dots as sdot.d with one segment per lane.

    Requires the consuming tiles to be output-owner s64 lanes; k4/k0 are
    not touched (they keep vmul/mul-reduce lowering).
    """
    if term_group != 4 or acc_bits != 64:
        raise ValueError("segment_dot: only 4-term s64 segments supported")
    obs = []
    for t in plan.tiles:
        eligible = t.k_family == "odd" or \
            (t.k_family == "k2" and t.pass_id == 1)
        if eligible and t.lane_owner != "output":
            raise ValueError("segment_dot: %s tile must be output-owner"
                             % t.k_family)
    obs.append(ProofObligation(
        "lanes", "4-term segments accumulate per output s64 lane"))
    return replace(plan, lowering={**plan.lowering,
                                   "odd_lowering": "sdot.d"}), \
        _ob("segment_dot", *obs)


def batch_round_narrow_store(plan: Plan, batch: int = 4):
    """Batch the round-narrow-store chain (uzp1+rshrnb+uzp1).

    Precondition: memory map is contiguous and the round barrier stays at
    its pass boundary (no deferred rounding).
    """
    if batch not in (1, 4):
        raise ValueError("batch_round_narrow_store: batch must be 1 or 4")
    obs = [ProofObligation(
        "round", "round barrier stays after pass1 (shift=4) / pass2 "
                 "(shift=11); no deferred rounding")]
    for m in plan.memory_map:
        if m.topology != "contiguous":
            raise ValueError("batch_round_narrow_store: non-contiguous store")
    obs.append(ProofObligation("address", "contiguous store topology"))
    return replace(plan, lowering={**plan.lowering,
                                   "narrow_batch": batch}), \
        _ob("batch_round_narrow_store", *obs)


def derive_constant_map(plan: Plan):
    """Derive replicated constants from the output lane map.

    For output-owner sdot.d tiles the constant is [g[4m..4m+3]] x4; this
    rewrite records that derivation instead of hand-writing the table.
    """
    for t in plan.tiles:
        eligible = t.k_family == "odd" or \
            (t.k_family == "k2" and t.pass_id == 1)
        if eligible and t.lane_owner != "output":
            raise ValueError(
                "derive_constant_map: run after assign_output_lanes")
    kept = tuple(e for e in plan.constant_map.entries
                 if not e[0].startswith(("odd-", "k2-")))
    consts = ConstantMap(kept + (
        ("odd-CODD", (0, 15), 4),
        ("k2-K2S", (0, 15), 4),
    ))
    return replace(plan, constant_map=consts,
                   lowering={**plan.lowering,
                             "constant_layout": "derived-replicated"}), \
        _ob("derive_constant_map",
            ProofObligation(
                "isa", "CODD/K2S replication factor follows lane ownership"))


def k2_pass1_slice(plan: Plan):
    """Pass1 k==2 mod 4 lowering: sliced sdot.d (v3.1 mechanism).

    Requires k2 tiles to be output-owner (segment_dot applied first).
    """
    for t in plan.tiles:
        if t.k_family == "k2" and t.pass_id == 1 and \
                t.lane_owner != "output":
            raise ValueError("k2_pass1_slice: run after assign_output_lanes")
    return replace(plan, lowering={**plan.lowering,
                                   "pass1_k2_slice": 1}), \
        _ob("k2_pass1_slice",
            ProofObligation(
                "range", "pass1 s16 EO dot fits s32 per product and "
                         "s64 accumulator (20k/200k differential gate)"))


def rediscover_v31(base: Plan):
    """Apply the four atomic rewrites in dependency order to a spec plan.

    Returns the v3.1-equivalent Plan. NOTE: `layout=v3` is stamped only as
    the codegen bridge to the existing grouped emitter; the blind-search
    acceptance (no composite template) is not claimed until the atomic
    backend replaces pass_grouped_cpp.
    """
    p, c1 = assign_output_lanes(base, row_group=4)
    p, c2 = segment_dot(p)
    p, c3 = batch_round_narrow_store(p, batch=4)
    p, c4 = derive_constant_map(p)
    p, c5 = k2_pass1_slice(p)
    p = replace(p, lowering={**p.lowering,
                             "func_name": "dynopt_dct32_sve2_shared",
                             "layout": "v3"})
    return p, (c1, c2, c3, c4, c5)


def dct32_spec_plan() -> Plan:
    """Canonical DCT32 spec: no lowering axes, partial lane ownership."""
    from layout_ir import (  # noqa: E402
        ConstantMap,
        MemoryMap,
        RoundBarrier,
        Target,
    )
    t = Target(features=("sve2",), fixed_vl_bytes=32, allow_scatter=False)
    # 4-row grouping is a structural layout choice for all k families;
    # lane ownership (partial -> output) is the rewrite that follows.
    tiles = tuple(
        Tile(p, f, 4, 1, "partial", 64)
        for p in (1, 2)
        for f in ("odd", "k2", "k4", "k0"))
    barriers = (
        RoundBarrier(1, 4, "half-up", "s16", False),
        RoundBarrier(2, 11, "half-up", "s16", False),
    )
    consts = ConstantMap((
        ("odd-C32", (0, 15), 1),
        ("k2-K2", (0, 7), 1),
        ("k4-K4", (0, 3), 1),
        ("k0-K0", (0, 3), 1),
    ))
    mem = (
        MemoryMap("src", "src", "i*stride+j", "contiguous"),
        MemoryMap("coef", "coef", "k*32+i", "contiguous"),
        MemoryMap("dst", "dst", "k*32+i", "contiguous"),
    )
    return Plan(t, tiles, barriers, consts, mem, {})
