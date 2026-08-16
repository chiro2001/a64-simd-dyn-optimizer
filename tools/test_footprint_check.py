#!/usr/bin/env python3
"""Unit wrapper for the two-group store-footprint certificate."""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class FootprintCheckTest(unittest.TestCase):
    def test_footprint_pass(self):
        r = subprocess.run(
            [sys.executable, os.path.join(ROOT, "tools",
                                          "footprint_check.py")],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
        self.assertIn("FOOTPRINT PASS", r.stdout)
        self.assertIn("dct16=True", r.stdout)
        self.assertIn("dct32=True", r.stdout)


if __name__ == "__main__":
    unittest.main()
