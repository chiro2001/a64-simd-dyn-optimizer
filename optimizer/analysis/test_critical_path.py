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
        mn, dsts, reads, mems = parse_inst(
            "   4:\t4e20d420 \tmul\tv0.4s, v1.4s, v0.4s")
        self.assertEqual(mn, "mul")
        self.assertEqual(dsts, ["v0"])
        self.assertEqual(reads, ["v1", "v0"])

    def test_parse_inst_store(self):
        mn, dsts, reads, mems = parse_inst(
            "  10:\t3c802020 \tstr\tq0, [x1]")
        self.assertEqual(dsts, [])
        self.assertEqual(reads, ["v0"])  # q0 aliases v0

    def test_mla_accumulator_read(self):
        mn, dsts, reads, mems = parse_inst(
            "   8:\t4f80e001 \tmla\tv1.4s, v0.4s, v2.4s")
        self.assertEqual(dsts, ["v1"])
        self.assertIn("v1", reads)  # accumulator read-modify-write
        self.assertIn("v0", reads)
        self.assertIn("v2", reads)

    def test_register_view_aliasing(self):
        _, dsts, reads, _ = parse_inst(
            "   0:\t4ea01c00 \tmov\tv0.16b, v1.16b")
        self.assertEqual(dsts, ["v0"])
        self.assertEqual(reads, ["v1"])
        _, dsts, reads, _ = parse_inst(
            "   4:\t4ea01c21 \tmov\tv1.8h, q0.8h")
        self.assertEqual(dsts, ["v1"])
        self.assertEqual(reads, ["v0"])  # q0 aliases v0
        _, dsts, reads, _ = parse_inst(
            "   8:\t2a0103e0 \tmov\tw0, w1")
        self.assertEqual(dsts, ["x0"])  # w0 aliases x0
        self.assertEqual(reads, ["x1"])

    def test_ldp_two_destinations(self):
        mn, dsts, reads, mems = parse_inst(
            "   0:\ta94107e0 \tldp\tx0, x1, [sp, #16]")
        self.assertEqual(mn, "ldp")
        self.assertEqual(dsts, ["x0", "x1"])
        self.assertEqual(reads, [])
        self.assertEqual(mems, [("sp", 16, False)])

    def test_post_index_stack_slot(self):
        mn, dsts, reads, mems = parse_inst(
            "   0:\t6db827e8 \tstp\td8, d9, [sp, #-128]!")
        self.assertEqual(mn, "stp")
        self.assertEqual(dsts, [])
        self.assertEqual(reads, ["v8", "v9"])
        self.assertEqual(mems, [("sp", -128, True)])

    def test_stack_base_array_roundtrip(self):
        # pass 1 stores through a sp-derived pointer, pass 2 loads from the
        # same slot: the two passes must be on one dependency chain.
        asm = """
   0:   91010002        add     x2, sp, #0x40
   4:   3c800040        stur    q0, [x2]
   8:   3cc00041        ldur    q1, [x2]
"""
        cp, dist, lines, preds = estimate_critical_path(asm)
        # add (2) -> store (1) -> load (4): one chain
        self.assertAlmostEqual(cp, 7.0)

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
