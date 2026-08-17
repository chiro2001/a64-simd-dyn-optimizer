#!/usr/bin/env python3
"""Tests for the docs/82 #4 family covers: sad / satd-16 / psy-cost."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

from optimizer.ago.covers_sad import cover_meta as sad_meta
from optimizer.ago.covers_sad import emit_cover as emit_sad
from optimizer.ago.covers_satd16 import cover_meta as satd16_meta
from optimizer.ago.covers_satd16 import emit_cover as emit_satd16
from optimizer.ago.covers_satd16x32 import cover_meta as s16x32_meta
from optimizer.ago.covers_satd16x32 import emit_cover as emit_s16x32
from optimizer.ago.covers_psycost import cover_meta as psy_meta
from optimizer.ago.covers_psycost import emit_cover as emit_psy
from optimizer.ago.covers_satd_8x16 import cover_meta as s816_meta
from optimizer.ago.covers_satd_8x16 import emit_cover as emit_s816
from optimizer.ago.covers_satd_16x8 import cover_meta as s168_meta
from optimizer.ago.covers_satd_16x8 import emit_cover as emit_s168
from optimizer.ago.covers_costcoeff import cover_meta as cc_meta
from optimizer.ago.covers_costcoeff import emit_cover as emit_cc


class TestCoversSad(unittest.TestCase):

    def test_meta(self):
        m = sad_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        # A/B (existing best) must beat C (dual-group sve16) on 950 proxy.
        self.assertEqual(m["expected_permute_ratio"]["A"], 0.0)
        self.assertEqual(m["expected_permute_ratio"]["B"], 0.0)
        self.assertGreater(m["expected_permute_ratio"]["C"], 0.30)

    def test_emit_all(self):
        for c in sad_meta()["covers"]:
            code = emit_sad(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_sad("Z")


class TestCoversSatd16(unittest.TestCase):

    def test_meta(self):
        m = satd16_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.30)
        self.assertGreater(m["expected_permute_ratio"]["B"], 0.30)
        self.assertLess(m["expected_permute_ratio"]["C"], 0.30)

    def test_emit_all(self):
        for c in satd16_meta()["covers"]:
            code = emit_satd16(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_satd16("Z")


class TestCoversSatd16x32(unittest.TestCase):

    def test_meta(self):
        m = s16x32_meta()
        self.assertEqual(m["covers"], ["A"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.30)

    def test_emit_all(self):
        for c in s16x32_meta()["covers"]:
            code = emit_s16x32(c)
            self.assertIsInstance(code, str)
            self.assertIn("svcadd_s16", code)
            self.assertIn("g < 8", code)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_s16x32("Z")


class TestCoversPsyCost(unittest.TestCase):

    def test_meta(self):
        m = psy_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.35)
        self.assertGreater(m["expected_permute_ratio"]["B"], 0.35)
        self.assertLess(m["expected_permute_ratio"]["C"], 0.25)

    def test_emit_all(self):
        for c in psy_meta()["covers"]:
            code = emit_psy(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_psy("Z")


class TestCoversSatdShapes(unittest.TestCase):
    """satd-8x16 / satd-16x8 NEON covers (docs/82 #4 扩展)."""

    def test_8x16_meta(self):
        m = s816_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        # All measured below the 30% threshold (vs sve16 candidate 50.7%).
        for c in m["covers"]:
            self.assertLess(m["expected_permute_ratio"][c], 0.30)

    def test_16x8_meta(self):
        m = s168_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        for c in m["covers"]:
            self.assertLess(m["expected_permute_ratio"][c], 0.30)

    def test_emit_all_shapes(self):
        for emit_fn in (emit_s816, emit_s168):
            for c in ("A", "B", "C"):
                code = emit_fn(c)
                self.assertIsInstance(code, str)
                self.assertGreater(len(code), 500)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_s816("Z")
        with self.assertRaises(ValueError):
            emit_s168("Z")


class TestCoversCostCoeff(unittest.TestCase):
    """cost-coeff-nxn covers (docs/82 #4 扩展)."""

    def test_meta(self):
        m = cc_meta()
        self.assertEqual(m["covers"], ["A", "B"])
        self.assertGreater(m["expected_permute_ratio"]["A"], 0.30)
        self.assertEqual(m["expected_permute_ratio"]["B"], 0.0)

    def test_emit_all(self):
        for c in ("A", "B"):
            code = emit_cc(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_cc("Z")


if __name__ == "__main__":
    unittest.main()
