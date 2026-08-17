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
            sc2 = compile_and_count(cpp, "armv8.2-a+sve2", td)
            self.assertNotIn("error", sc2)
            # sve1: rejected (svcadd is SVE2-only)
            sc1 = compile_and_count(cpp, "armv8.2-a+sve", td)
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
            sc = compile_and_count(cpp, "armv8.2-a+sve", td)
            self.assertNotIn("error", sc)
