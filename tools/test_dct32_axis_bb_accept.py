#!/usr/bin/env python3
"""dct32 op-backend B&B acceptance unit test (same-best, no mis-prune;
node-reduction gate is data-dependent and recorded separately)."""

import itertools
import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class Dct32AxisBBAcceptTest(unittest.TestCase):
    def test_same_best_and_no_misprune(self):
        r = subprocess.run(
            [sys.executable, os.path.join(ROOT, "tools",
                                          "dct32_axis_bb_accept.py")],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
        self.assertIn("same best: True", r.stdout)
        self.assertIn("B&B: best=1053", r.stdout)


if __name__ == "__main__":
    unittest.main()
