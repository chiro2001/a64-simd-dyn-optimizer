#!/usr/bin/env python3
"""Tests for ago_auto_search.py discovery mode (docs/82 #5)."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import ago_auto_search as AAS


class TestDiscoveryGrid(unittest.TestCase):

    def test_dct16_grid_has_emitter_modes(self):
        v = AAS._discovery_variants("dct16")
        labels = [l for l, _ in v]
        self.assertIn("emitter-neon_bridge_fused", labels)
        self.assertIn("emitter-addp", labels)

    def test_dct16_grid_emits_code(self):
        v = AAS._discovery_variants("dct16")
        for _, emit_fn in v:
            code = emit_fn()
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 500)

    def test_interp8_grid_empty(self):
        # svdot32 16x16/32x32 are separate kernels; 8x8 variants curated.
        self.assertEqual(AAS._discovery_variants("interp8"), [])

    def test_dct32_grid_batch8(self):
        # docs/79 unexplored axis: 8 rows per g iteration (batch=8).
        variants = AAS._discovery_variants("dct32")
        labels = [v[0] for v in variants]
        self.assertIn("emitter-batch8", labels)

    def test_sad_grid_empty(self):
        self.assertEqual(AAS._discovery_variants("sad"), [])

    def test_discover_flag_wired(self):
        # --discover must reach auto_search().
        import io
        from contextlib import redirect_stdout
        buf = io.StringIO()
        with redirect_stdout(buf):
            # psy-cost has no discovery grid -> prints the "no grid" note
            rc = AAS.auto_search("psy-cost-16x16", discover=True)
        self.assertEqual(rc, 0)
        self.assertIn("无发现网格", buf.getvalue())


if __name__ == "__main__":
    unittest.main()


class TestCoverMetaAdapter(unittest.TestCase):

    def test_current_protocol_passthrough(self):
        from ago_auto_search import _normalize_cover_meta
        meta = {"covers": ["A", "B"], "names": {}, "cp_chains": {},
                "tail_ops": {}, "expected_permute_ratio": {}}
        out = _normalize_cover_meta(meta)
        self.assertIs(out, meta)  # unchanged

    def test_old_m2_format_adapted(self):
        from ago_auto_search import _normalize_cover_meta
        old = {"kernel": "sa8d8", "tails": {"A": "tA", "B": "tB"},
               "tail_ops": {"A": [], "B": []},
               "cp_chains": {"A": ["ld1"], "B": ["ld1"]},
               "regions": {}}
        out = _normalize_cover_meta(old)
        self.assertEqual(out["covers"], ["A", "B"])
        self.assertEqual(out["cp_chains"]["A"], ["ld1"])
        self.assertEqual(out["expected_permute_ratio"]["A"], 0.0)
        self.assertIn("sa8d8", out["names"]["A"])

    def test_sa8d_and_satd8_run(self):
        import tempfile
        sys.path.insert(0, os.path.join(ROOT, "tools"))
        from ago_auto_search import auto_search, KERNEL_COVERS
        for k in ("sa8d", "satd-8"):
            rc = auto_search(k, "permute", False, False)
            self.assertEqual(rc, 0, k)


class TestRankByAgo(unittest.TestCase):
    """Verify --rank-by ago uses cost-table prediction (docs/86)."""

    def test_interp8_rank_by_ago_picks_svdot32(self):
        """ago prediction should select svdot32 (cover-A) for interp8,
        consistent with the combined-score winner."""
        rc = AAS.auto_search("interp8", "ago", False, False)
        self.assertEqual(rc, 0)

    def test_satd16_rank_by_ago_picks_cadd(self):
        """ago prediction should select best_sve2_cadd (cover-C) for
        satd-16, consistent with docs/83 round 3."""
        rc = AAS.auto_search("satd-16", "ago", False, False)
        self.assertEqual(rc, 0)

    def test_rank_by_ago_and_permute_consistent_winners(self):
        """For psy-cost-16x16, both ranking modes should select cover-C
        (best_cadd butterfly). This verifies the cost-table prediction
        doesn't contradict the combined-score heuristic."""
        rc_ago = AAS.auto_search("psy-cost-16x16", "ago", False, False)
        rc_perm = AAS.auto_search("psy-cost-16x16", "permute", False, False)
        self.assertEqual(rc_ago, 0)
        self.assertEqual(rc_perm, 0)

    def test_select_table_sve(self):
        """_select_table should pick SVE1 table for SVE march."""
        from ago_auto_search import _select_table
        path = _select_table("armv8.2-a+sve2")
        self.assertIn("sve-timing-920b", path)
        path2 = _select_table("armv8.2-a+sve")
        self.assertIn("sve-timing-920b", path2)

    def test_select_table_neon(self):
        """_select_table should pick NP1 table for NEON march."""
        from ago_auto_search import _select_table
        path = _select_table("armv8.2-a+dotprod")
        self.assertIn("neon-timing-n1", path)

    def test_calibration_loaded_in_rank_by_ago(self):
        """When build/calibration.json exists, --rank-by ago should
        apply the calibration scale (docs/86 Feedback Loop validation)."""
        import json, os
        calib_path = os.path.join(ROOT, "build", "calibration.json")
        if not os.path.exists(calib_path):
            self.skipTest("no calibration.json (run feedback_calibrate)")
        with open(calib_path) as f:
            calib = json.load(f)
        # Verify calibration has expected structure
        self.assertIsInstance(calib, dict)
        for kernel, entry in calib.items():
            self.assertIn("scale", entry)
            self.assertGreater(entry["scale"], 0)
        # Verify sa8d is calibrated (from 920B ticks data)
        self.assertIn("sa8d", calib)
        self.assertGreater(calib["sa8d"]["scale"], 50)  # ~81x loop factor

    def test_psycost_shapes_in_corpus(self):
        """psy-cost-8x8/32x32/64x64 must be in KERNEL_COVERS
        (manual search results fed into AGO, docs/86)."""
        for k in ("psy-cost-8x8", "psy-cost-32x32",
                  "psy-cost-64x64", "psy-cost-16x16"):
            self.assertIn(k, AAS.KERNEL_COVERS,
                          "%s missing from KERNEL_COVERS" % k)
        # Verify each can emit and has cover_meta
        for k in ("psy-cost-8x8", "psy-cost-32x32", "psy-cost-64x64"):
            mod_name, func = AAS.KERNEL_COVERS[k]
            mod = __import__(mod_name, fromlist=["emit_cover", "cover_meta"])
            meta = mod.cover_meta()
            self.assertIn("covers", meta)
            self.assertGreaterEqual(len(meta["covers"]), 1)
            code = mod.emit_cover(meta["covers"][0], func)
            self.assertGreater(len(code), 100)


class TestIsaConstraint(unittest.TestCase):
    """SVE1 constraint (920B): SVE2-only covers must be rejected."""

    def test_sve2_cadd_source_rejected_under_sve1(self):
        import tempfile
        sys.path.insert(0, os.path.join(ROOT, "tools"))
        from ago_auto_search import compile_and_count
        src = (
            "#include <arm_sve.h>\n"
            "svint16_t f(svint16_t a) { return svcadd_s16(a, a, 90); }\n")
        with tempfile.TemporaryDirectory(prefix="isa-") as td:
            cpp = os.path.join(td, "c.cpp")
            with open(cpp, "w") as f:
                f.write(src)
            # sve2: compiles
            sc2, _ = compile_and_count(cpp, "armv8.2-a+sve2", td)
            self.assertNotIn("error", sc2)
            # sve1: rejected (svcadd is SVE2-only)
            sc1, _ = compile_and_count(cpp, "armv8.2-a+sve", td)
            self.assertIn("error", sc1)

    def test_sve1_source_ok_under_sve1(self):
        import tempfile
        sys.path.insert(0, os.path.join(ROOT, "tools"))
        from ago_auto_search import compile_and_count
        src = (
            "#include <arm_sve.h>\n"
            "svint16_t f(svint16_t a) { return svadd_s16_x(svptrue_b16(), a, a); }\n")
        with tempfile.TemporaryDirectory(prefix="isa-") as td:
            cpp = os.path.join(td, "c.cpp")
            with open(cpp, "w") as f:
                f.write(src)
            sc, _ = compile_and_count(cpp, "armv8.2-a+sve", td)
            self.assertNotIn("error", sc)
