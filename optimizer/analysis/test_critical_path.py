"""Unit tests for the critical-path estimator."""

import unittest

from optimizer.analysis.critical_path import estimate_critical_path, parse_inst


ASM = """
0000000000000000 <f>:
   0:   4cdf7c20        ld1     {v0.4s}, [x1]
   4:   4e20d420        mul     v0.4s, v1.4s, v0.4s
   8:   4ea0bc22        addp    v2.4s, v1.4s, v0.4s
   c:   0f17e843        rshrn   v3.4h, v2.4s, #9
  10:   3c802020        str     q0, [x1]
  14:   3c802031        str     q1, [x1]
"""


class TestCriticalPath(unittest.TestCase):

    def test_parse_inst_binary(self):
        mn, dst, reads = parse_inst(
            "   4:\t4e20d420 \tmul\tv0.4s, v1.4s, v0.4s")
        self.assertEqual(mn, "mul")
        self.assertEqual(dst, "v0")
        self.assertEqual(reads, ["v1", "v0"])

    def test_parse_inst_store(self):
        mn, dst, reads = parse_inst(
            "  10:\t3c802020 \tstr\tq0, [x1]")
        self.assertIsNone(dst)
        self.assertEqual(reads, ["q0"])

    def test_stack_slot_chain(self):
        asm = """
   0:   3c802020        str     q0, [sp, #32]
   4:   3cc003e0        ldr     q1, [sp, #32]
"""
        cp, dist, lines, preds = estimate_critical_path(asm)
        # store -> load dependency via sp#32: 1 + 4
        self.assertAlmostEqual(cp, 5.0)

    def test_estimate(self):
        cp, dist, lines, preds = estimate_critical_path(ASM)
        self.assertGreater(cp, 0)
        # ld1 (4) -> mul (3) -> addp (3) -> rshrn (4) = 14 is one path
        self.assertGreaterEqual(cp, 14.0)


if __name__ == "__main__":
    unittest.main()
