#!/usr/bin/env python3
"""Unit wrapper for the two-group composition certificate."""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class CompositionCheckTest(unittest.TestCase):
    def test_composition_pass(self):
        r = subprocess.run(
            [sys.executable, os.path.join(ROOT, "tools",
                                          "composition_check.py")],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
        self.assertIn("COMPOSITION PASS", r.stdout)
        self.assertNotIn("UNKNOWN statements", r.stdout)


if __name__ == "__main__":
    unittest.main()
