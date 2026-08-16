#!/usr/bin/env python3
"""Generic lattice B&B acceptance over both real datasets."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from lattice_bb import acceptance  # noqa: E402
from lattice_bb_accept import load_combos  # noqa: E402


class LatticeBBTest(unittest.TestCase):
    def test_satd_dataset(self):
        combos = load_combos(os.path.join(
            ROOT, "experiments", "m31-satd8-axis-search", "results.json"))
        rep = acceptance(combos)
        self.assertTrue(rep["same_best"])
        self.assertEqual(rep["full_best"], 60)
        self.assertGreaterEqual(rep["node_reduction"], 4.0)
        self.assertTrue(rep["gate_met"])

    def test_dct32_dataset(self):
        combos = load_combos(os.path.join(
            ROOT, "build", "dct32-axis-bb", "results.json"))
        rep = acceptance(combos)
        self.assertTrue(rep["same_best"])
        self.assertEqual(rep["full_best"], 886)
        self.assertGreaterEqual(rep["node_reduction"], 2.0)
        self.assertTrue(rep["gate_met"])

    def test_sao_layout_dataset(self):
        combos = load_combos(os.path.join(
            ROOT, "experiments", "m33-sao-layout-bb", "results.json"))
        rep = acceptance(combos)
        self.assertTrue(rep["same_best"])
        self.assertEqual(rep["full_best"], 33)
        self.assertGreaterEqual(rep["node_reduction"], 4.0)
        self.assertTrue(rep["gate_met"])


if __name__ == "__main__":
    unittest.main()
