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
from optimizer.ago.covers_psycost import cover_meta as psy_meta
from optimizer.ago.covers_psycost import emit_cover as emit_psy


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
        self.assertEqual(m["covers"], ["A", "B"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.30)
        self.assertGreater(m["expected_permute_ratio"]["B"], 0.30)

    def test_emit_all(self):
        for c in satd16_meta()["covers"]:
            code = emit_satd16(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_satd16("Z")


class TestCoversPsyCost(unittest.TestCase):

    def test_meta(self):
        m = psy_meta()
        self.assertEqual(m["covers"], ["A", "B"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.35)
        self.assertGreater(m["expected_permute_ratio"]["B"], 0.35)

    def test_emit_all(self):
        for c in psy_meta()["covers"]:
            code = emit_psy(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_psy("Z")


if __name__ == "__main__":
    unittest.main()
