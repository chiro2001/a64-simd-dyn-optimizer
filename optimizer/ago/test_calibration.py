#!/usr/bin/env python3
"""Tests for optimizer/ago/calibration.py (feedback-loop calibration)."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

from optimizer.ago.calibration import (  # noqa: E402
    apply_calibration, fit_scales, load_calibration,
)


class TestFitScales(unittest.TestCase):

    def test_median_scale(self):
        rows = [
            {"kernel": "k1", "predicted": 100, "measured": 120},
            {"kernel": "k1", "predicted": 100, "measured": 140},
            {"kernel": "k1", "predicted": 100, "measured": 130},
        ]
        out = fit_scales(rows)
        self.assertAlmostEqual(out["k1"]["scale"], 1.30, places=3)
        self.assertEqual(out["k1"]["n"], 3)
        self.assertEqual(out["k1"]["outliers"], 0)

    def test_outlier_filtered(self):
        rows = [
            {"kernel": "k1", "predicted": 100, "measured": 130},
            {"kernel": "k1", "predicted": 100, "measured": 140},
            {"kernel": "k1", "predicted": 100, "measured": 900},  # outlier 9x
        ]
        out = fit_scales(rows)
        self.assertEqual(out["k1"]["outliers"], 1)
        self.assertAlmostEqual(out["k1"]["scale"], 1.40, places=3)

    def test_multi_kernel(self):
        rows = [
            {"kernel": "a", "predicted": 10, "measured": 20},
            {"kernel": "b", "predicted": 10, "measured": 10},
        ]
        out = fit_scales(rows)
        self.assertAlmostEqual(out["a"]["scale"], 2.0, places=3)
        self.assertAlmostEqual(out["b"]["scale"], 1.0, places=3)


class TestApplyCalibration(unittest.TestCase):

    def test_multiply(self):
        cal = {"k1": {"scale": 1.3}}
        self.assertAlmostEqual(apply_calibration(100, "k1", cal), 130.0)

    def test_missing_kernel_identity(self):
        cal = {"k1": {"scale": 1.3}}
        self.assertEqual(apply_calibration(100, "k2", cal), 100.0)

    def test_empty_calibration_identity(self):
        self.assertEqual(apply_calibration(100, "k1", {}), 100.0)

    def test_missing_file_returns_empty(self):
        self.assertEqual(load_calibration("/nonexistent/cal.json"), {})

    def test_bad_json_returns_empty(self):
        import tempfile
        with tempfile.NamedTemporaryFile("w", suffix=".json",
                                         delete=False) as f:
            f.write("{not json")
            path = f.name
        try:
            self.assertEqual(load_calibration(path), {})
        finally:
            os.unlink(path)


if __name__ == "__main__":
    unittest.main()
