"""Unit tests for the v0 cost model."""

import unittest

from optimizer.analysis.cost import N1_PROFILE, classify, cycles_lb


class TestCostModel(unittest.TestCase):

    def test_classify_disjoint(self):
        h = {"mul": 10, "mla": 4, "addp": 6, "trn1": 3, "rshrn": 2,
             "ld1": 5, "st1": 5, "nop": 1}
        c = classify(h)
        self.assertEqual(c["mul"], 14)
        self.assertEqual(c["add"], 6)
        self.assertEqual(c["permute"], 3)
        self.assertEqual(c["narrow"], 2)
        self.assertEqual(c["load"], 5)
        self.assertEqual(c["store"], 5)
        self.assertEqual(c["scalar"], 1)

    def test_cycles_lb_is_max(self):
        h = {"mul": 100, "add": 1}
        lb, bounds = cycles_lb(h, N1_PROFILE)
        self.assertGreater(lb, 0)
        self.assertIn("mul", bounds)
        self.assertAlmostEqual(lb, 100 * 2.0)


if __name__ == "__main__":
    unittest.main()
