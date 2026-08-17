#!/usr/bin/env python3
"""Tests for optimizer/ago/covers_dct16.py and covers_dct32.py."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

from optimizer.ago.covers_dct16 import cover_meta as dct16_meta
from optimizer.ago.covers_dct16 import emit_cover as emit_dct16
from optimizer.ago.covers_dct32 import cover_meta as dct32_meta
from optimizer.ago.covers_dct32 import emit_cover as emit_dct32


class TestCoversDct16(unittest.TestCase):

    def test_meta_has_3_covers(self):
        m = dct16_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])

    def test_expected_ratios(self):
        m = dct16_meta()
        self.assertLess(m["expected_permute_ratio"]["A"], 0.30)
        self.assertGreater(m["expected_permute_ratio"]["B"], 0.40)

    def test_emit_A_neon_bridge(self):
        code = emit_dct16("A")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 500)

    def test_emit_B_pure_sve2(self):
        code = emit_dct16("B")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 500)

    def test_emit_C_op895_ref(self):
        code = emit_dct16("C")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 500)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_dct16("Z")


class TestCoversDct32(unittest.TestCase):

    def test_meta_has_2_covers(self):
        m = dct32_meta()
        self.assertEqual(m["covers"], ["A", "B"])

    def test_expected_ratios(self):
        m = dct32_meta()
        self.assertLess(m["expected_permute_ratio"]["A"], 0.25)
        self.assertLess(m["expected_permute_ratio"]["B"], 0.25)

    def test_emit_A_loop(self):
        code = emit_dct32("A")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 500)

    def test_emit_B_opbase_ref(self):
        code = emit_dct32("B")
        self.assertIsInstance(code, str)
        self.assertGreater(len(code), 500)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_dct32("Z")


if __name__ == "__main__":
    unittest.main()
