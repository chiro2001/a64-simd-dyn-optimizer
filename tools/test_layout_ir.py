#!/usr/bin/env python3
"""Self-test for optimizer/ir/layout_ir.py (round-0012 P1 increment 1)."""

import hashlib
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from layout_ir import (  # noqa: E402
    ConstantMap,
    MemoryMap,
    Plan,
    RoundBarrier,
    Target,
    Tile,
    dct32_v31_plan,
    lower,
    verify_layout,
)
from rewrites_dct32 import (  # noqa: E402
    batch_round_narrow_store,
    dct32_spec_plan,
    derive_constant_map,
    rediscover_v31,
    segment_dot,
)
from emit_dct32_sve2_shared import emit_grouped  # noqa: E402


def fail(msg):
    print("FAIL: %s" % msg)
    return 1


def main():
    rc = 0

    plan = dct32_v31_plan()
    ok, why = verify_layout(plan)
    if not ok:
        rc |= fail("v3.1 plan must verify: %s" % why)
    k1 = plan.canonical_key()
    k2 = plan.canonical_key()
    if k1 != k2 or len(k1) != 64:
        rc |= fail("canonical key must be stable sha256, got %r" % k1)

    # lower() must byte-identical-replay the v3.1 emitter source.
    want = emit_grouped(pass1_k2_slice=1, odd_lowering="sdot.d",
                        narrow_batch=4,
                        constant_layout="derived-replicated")
    got = lower(plan)
    if got != want:
        rc |= fail("lower(plan) != emit(v3.1) (%d vs %d bytes)"
                   % (len(got), len(want)))
    if hashlib.sha256(want.encode()).hexdigest() != \
            hashlib.sha256(got.encode()).hexdigest():
        rc |= fail("source hash mismatch")

    # Deliberately broken plans must fail verify_layout.
    bad_scatter = Plan(
        Target(features=("sve2",), fixed_vl_bytes=32, allow_scatter=True),
        plan.tiles, plan.round_barriers, plan.constant_map,
        plan.memory_map, plan.lowering)
    ok, why = verify_layout(bad_scatter)
    if ok or "scatter" not in why:
        rc |= fail("scatter must be rejected, got ok=%s why=%s" % (ok, why))

    bad_vl = Plan(
        Target(features=("sve2",), fixed_vl_bytes=64, allow_scatter=False),
        plan.tiles, plan.round_barriers, plan.constant_map,
        plan.memory_map, plan.lowering)
    ok, why = verify_layout(bad_vl)
    if ok or "VL" not in why:
        rc |= fail("VL must be rejected, got ok=%s why=%s" % (ok, why))

    bad_shift = RoundBarrier(2, 12, "half-up", "s16", False)
    bad_barriers = (plan.round_barriers[0], bad_shift)
    bad_round = Plan(plan.target, plan.tiles, bad_barriers,
                     plan.constant_map, plan.memory_map, plan.lowering)
    ok, why = verify_layout(bad_round)
    if ok or "{4, 11}" not in why:
        rc |= fail("round shifts must be {4,11}, got ok=%s why=%s"
                   % (ok, why))

    # P1 increment 2: atomic rewrites rediscover the v3.1 plan.
    spec = dct32_spec_plan()
    ok, why = verify_layout(spec)
    if not ok:
        rc |= fail("spec plan must verify: %s" % why)
    found, certs = rediscover_v31(spec)
    if len(certs) != 5:
        rc |= fail("rediscovery must produce 5 certificates, got %d"
                   % len(certs))
    if any(not c.obligations for c in certs):
        rc |= fail("every rewrite must carry proof obligations")
    if found.canonical_key() != plan.canonical_key():
        rc |= fail("rediscovered plan != v3.1 plan")
    if lower(found) != want:
        rc |= fail("lower(rediscovered) != emit(v3.1)")
    if "layout" in found.lowering:
        rc |= fail("rediscovered plan must not carry a layout preset")

    if rc == 0:
        print("layout_ir self-test: PASS (key=%s...)" % k1[:16])
    return rc


if __name__ == "__main__":
    sys.exit(main())
