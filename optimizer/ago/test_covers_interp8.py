#!/usr/bin/env python3
"""Test for optimizer/ago/covers_interp8.py (AGO interp8 hpp covers)."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

from optimizer.ago.covers_interp8 import cover_meta, emit_cover


class TestCoversInterp8(unittest.TestCase):

    def test_cover_meta_has_3_covers(self):
        meta = cover_meta()
        self.assertEqual(len(meta["covers"]), 3)
        self.assertEqual(meta["covers"], ["A", "B", "C"])

    def test_cover_meta_has_all_fields(self):
        meta = cover_meta()
        for c in meta["covers"]:
            self.assertIn(c, meta["names"])
            self.assertIn(c, meta["cp_chains"])
            self.assertIn(c, meta["tail_ops"])
            self.assertIn(c, meta["expected_permute_ratio"])

    def test_expected_ratios(self):
        meta = cover_meta()
        self.assertLess(meta["expected_permute_ratio"]["A"], 0.30)
        self.assertGreater(meta["expected_permute_ratio"]["B"], 0.40)

    def test_emit_cover_A_svdot32(self):
        code = emit_cover("A")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 500)
        self.assertIn("svdot_s32", code)
        self.assertIn("vqmovun_s16", code)
        self.assertIn("dynopt_interp8_8x8_sve2", code)

    def test_emit_cover_B_svdot64(self):
        code = emit_cover("B")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 500)
        self.assertIn("svdot_s64", code)

    def test_emit_cover_C_neon(self):
        code = emit_cover("C")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 200)
        self.assertIn("vmlal", code)

    def test_emit_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_cover("Z")


if __name__ == "__main__":
    unittest.main()
