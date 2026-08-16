#!/usr/bin/env python3
"""Tests for the DCT16 op IR (leaf / odd slice / upstream full DAG)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_op_ir import (  # noqa: E402
    dct16_leaf_provenance, dct16_pass1_provenance,
    dct16_upstream_provenance, dct16_width_provenance,
    lower_pass1_fused8, lower_pass1_leaf, lower_pass1_odd,
    lower_pass1_perrow, lower_pass1_quarter, lower_pass2_odd_quarter,
    lower_pass2_odd_quarter_legacy_even_sve, lower_pass2_upstream)
from dct16_rewrites import apply_rewrites  # noqa: E402


def main():
    ops, leaves = lower_pass1_leaf()
    r = dct16_leaf_provenance(ops, leaves)
    assert r["ok"], r["issues"]
    assert len(ops) == 16 * 4  # load + rev + E + O per row
    assert len(leaves) == 16
    all_ops = ops + lower_pass1_odd(leaves)
    r2 = dct16_pass1_provenance(all_ops)
    assert r2["ok"], r2["issues"]
    assert r2["odd_dots"] == 8 * 16
    print("DCT16 pass1 slice OK: ops=%d rows=%d odd_dots=%d"
          % (len(all_ops), len(leaves), r2["odd_dots"]))
    # Full upstream DAG: pass1 per-row + pass2 upstream.
    full = lower_pass1_perrow() + lower_pass2_upstream()
    r3 = dct16_upstream_provenance(full)
    assert r3["ok"], r3["issues"]
    assert r3["store_count"] == 512   # output-lane count (pass1+pass2)
    assert r3["expected_lanes"] == 512
    n1 = len([o for o in full if o.tile_id.startswith("p1.")])
    n2 = len([o for o in full if o.tile_id.startswith("p2.")])
    print("DCT16 upstream DAG OK: pass1_ops=%d pass2_ops=%d stores=%d"
          % (n1, n2, r3["store_count"]))
    # Odd-quarter pass2 (upstream even): zip packs + chained SDOT +
    # narrow16/store merge.
    oq = lower_pass1_perrow() + lower_pass2_odd_quarter(
        pack_zip=True, store_merge16=True, k_tile=1)
    r4 = dct16_upstream_provenance(oq)
    assert r4["ok"], r4["issues"]
    assert r4["expected_lanes"] == 512
    n2o = len([o for o in oq if o.tile_id.startswith("p2.")])
    print("DCT16 odd-quarter DAG OK: pass2_ops=%d stores=%d"
          % (n2o, r4["store_count"]))
    # Quarter pass1 (zip packs + even factor) + odd-quarter pass2.
    qq = lower_pass1_quarter(k_tile=4, pack_zip=True, even_factor=True) \
        + lower_pass2_odd_quarter(pack_zip=True, store_merge16=True,
                                  k_tile=2)
    r5 = dct16_upstream_provenance(qq)
    assert r5["ok"], r5["issues"]
    n1q = len([o for o in qq if o.tile_id.startswith("p1.")])
    print("DCT16 quarter+odd-quarter DAG OK: pass1_ops=%d stores=%d"
          % (n1q, r5["store_count"]))
    # Legacy even_sve (704 family): scatter path + QEOW sdot.
    lg = lower_pass1_quarter(k_tile=4, pack_zip=True, even_factor=True) \
        + lower_pass2_odd_quarter_legacy_even_sve(k_tile=2,
                                                  store_merge16=True)
    r6 = dct16_upstream_provenance(lg)
    assert r6["ok"], r6["issues"]
    assert r6["scatter_stores"] == 4
    print("DCT16 legacy even_sve DAG OK: ops=%d scatter=%d"
          % (len(lg), r6["scatter_stores"]))
    # Cross-kernel rewrites on a tbl2 + store_merge16=0 base.
    base = lower_pass1_quarter(k_tile=4, pack_zip=True, even_factor=True) \
        + lower_pass2_odd_quarter(pack_zip=False, store_merge16=False,
                                  k_tile=2)
    for seq in (["tbl2_to_zip"], ["merge_narrow8"],
                ["tbl2_to_zip", "merge_narrow8"],
                ["legacy_even_sve"],
                ["tbl2_to_zip", "legacy_even_sve", "merge_narrow8"]):
        rw = apply_rewrites(list(base), seq)
        r = dct16_upstream_provenance(rw)
        assert r["ok"], (seq, r["issues"])
    rw_legacy = apply_rewrites(list(base), ["legacy_even_sve"])
    r = dct16_upstream_provenance(rw_legacy)
    assert r["scatter_stores"] == 4
    assert all(o.attrs.get("mode") == "qrshrn"
               for o in rw_legacy if o.kind in
               ("narrow4", "narrow8", "narrow16", "narrow4_sve"))
    try:
        apply_rewrites(list(base), ["bogus"])
        raise AssertionError("expected ValueError for unknown rewrite")
    except ValueError:
        pass
    print("DCT16 rewrites OK (tbl2_to_zip / merge_narrow8)")
    # 8-lane fused pass1 (VL=128/NEON baseline) + pass2 upstream.
    f8 = lower_pass1_fused8() + lower_pass2_upstream()
    r8 = dct16_upstream_provenance(f8)
    assert r8["ok"], r8["issues"]
    assert r8["store_count"] == 512
    assert r8["expected_lanes"] == 512
    assert r8["scatter_stores"] == 0
    w8 = dct16_width_provenance(f8, 128)
    assert w8["ok"], w8["issues"]
    assert "rev32" in w8["resolved"]
    w256 = dct16_width_provenance(f8, 256)
    assert w256["ok"], w256["issues"]
    print("DCT16 fused8 DAG OK: ops=%d stores=%d width_resolved=%d"
          % (len(f8), r8["store_count"], len(w8["resolved"])))
    return 0


if __name__ == "__main__":
    sys.exit(main())
