"""Tests for IR width parameterization (vscale / concrete_lanes)."""

import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__)))), "optimizer", "ago"))

from ir import Shape  # noqa: E402
from layout_ir import ValueLayout  # noqa: E402


class TestShapeWidth(unittest.TestCase):
    def test_fixed_width_no_scaling(self):
        s = Shape("s16", 8, 128)
        self.assertEqual(s.concrete_lanes(128), 8)
        self.assertEqual(s.concrete_lanes(256), 8)

    def test_scalable_width_scales(self):
        s = Shape("s16", 8, 128, vscale=1)
        self.assertEqual(s.concrete_lanes(128), 8)
        self.assertEqual(s.concrete_lanes(256), 16)


class TestValueLayoutWidth(unittest.TestCase):
    def test_fixed(self):
        v = ValueLayout("x", "s16", (0, 1, 2, 3))
        self.assertEqual(v.concrete_lanes(256), (0, 1, 2, 3))

    def test_scalable(self):
        v = ValueLayout("x", "s16", (0, 1, 2, 3), vscale=1)
        self.assertEqual(v.concrete_lanes(128), (0, 1, 2, 3))
        self.assertEqual(v.concrete_lanes(256), (0, 2, 4, 6))


if __name__ == "__main__":
    unittest.main()
