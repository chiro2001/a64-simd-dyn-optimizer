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

    def test_dct32_grid_empty(self):
        # loop/opbase already cover all existing dct32 variants.
        self.assertEqual(AAS._discovery_variants("dct32"), [])

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
