"""Tests for width-scalable permute index resolution."""

import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from width_expr import (  # noqa: E402
    leaf_tables,
    resolve,
    rev16_neon_helper,
)
from dct16_op_ir import lower_pass1_leaf, lower_pass1_perrow  # noqa: E402


class TestResolve(unittest.TestCase):
    def test_rev16_vl256_full_reverse(self):
        self.assertEqual(resolve("rev16", 256),
                         [(15, 14, 13, 12, 11, 10, 9, 8,
                           7, 6, 5, 4, 3, 2, 1, 0)])

    def test_rev16_vl128_identity_plus_rev8(self):
        # 8-lane fused kernel: low half unchanged, high half reversed.
        self.assertEqual(resolve("rev16", 128),
                         [tuple(range(8)), (7, 6, 5, 4, 3, 2, 1, 0)])

    def test_rev8_vl256_two_segments(self):
        self.assertEqual(resolve("rev8", 256),
                         [(7, 6, 5, 4, 3, 2, 1, 0),
                          (15, 14, 13, 12, 11, 10, 9, 8)])

    def test_rev8_vl128_single_segment(self):
        self.assertEqual(resolve("rev8", 128),
                         [(7, 6, 5, 4, 3, 2, 1, 0)])

    def test_rev32_and_rev64(self):
        self.assertEqual(resolve("rev32", 128),
                         [(3, 2, 1, 0)])
        self.assertEqual(resolve("rev64", 128),
                         [(1, 0)])

    def test_unknown_raises(self):
        with self.assertRaises(KeyError):
            resolve("nope")


class TestLeafTables(unittest.TestCase):
    def test_leaf_vl128(self):
        t = leaf_tables(128)
        self.assertEqual(t["rev16"][1], rev16_neon_helper())

    def test_leaf_vl256(self):
        t = leaf_tables(256)
        self.assertEqual(len(t["rev16"][0]), 16)
        self.assertEqual(t["rev16"][0][0], 15)


class TestOpIrPermutes(unittest.TestCase):
    def test_leaf_uses_rev8(self):
        ops, _ = lower_pass1_leaf()
        revs = [o for o in ops if o.attrs.get("idx") == "rev8"]
        self.assertEqual(len(revs), 16)
        self.assertEqual(resolve("rev8", 128)[0],
                         (7, 6, 5, 4, 3, 2, 1, 0))

    def test_perrow_uses_rev16(self):
        ops = lower_pass1_perrow()
        revs = [o for o in ops if o.attrs.get("idx") == "rev16"]
        self.assertEqual(len(revs), 16)
        # VL=128 8-lane lowering of the 16-lane row reverse.
        self.assertEqual(resolve("rev16", 128),
                         [tuple(range(8)), (7, 6, 5, 4, 3, 2, 1, 0)])


if __name__ == "__main__":
    unittest.main()
