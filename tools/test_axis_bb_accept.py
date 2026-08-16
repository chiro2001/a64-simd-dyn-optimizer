#!/usr/bin/env python3
"""B&B acceptance unit test on the m31 satd enumeration."""

import sys
import unittest

sys.path.insert(0, ".")

import axis_bb_accept as ab  # noqa: E402


class AxisBBAcceptTest(unittest.TestCase):
    def test_acceptance(self):
        rows = ab.load()
        self.assertGreaterEqual(len(rows), 24)
        fb = ab.full_best(rows)
        bb, nodes, pruned = ab.bb_search(rows)
        self.assertEqual(bb, fb, "mis-pruned optimum")
        self.assertGreaterEqual(nodes, 1)
        self.assertLess(nodes, len(rows), "no node reduction")
        self.assertGreaterEqual(len(rows) / nodes, 2.0,
                                "node reduction gate (>=2x)")


if __name__ == "__main__":
    unittest.main()
