#!/usr/bin/env python3
"""Unit wrapper for the dual-group lane-map equivalence certificate."""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class DualLaneCertTest(unittest.TestCase):
    def test_cert_pass(self):
        r = subprocess.run(
            [sys.executable, os.path.join(ROOT, "tools",
                                          "dual_lane_cert.py")],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
        self.assertIn("CERT PASS", r.stdout)


if __name__ == "__main__":
    unittest.main()
