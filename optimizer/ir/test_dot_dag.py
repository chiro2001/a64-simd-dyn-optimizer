"""Real-DAG tests for typed dot canonicalization on dct16/dct32."""

import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from dct16_op_ir import lower_pass1_leaf, lower_pass1_odd, lower_pass2_upstream
from dct32_op_ir import lower_plan_to_ops
from dct32_rewrites import apply_rewrites as apply32
from rewrites_dct32 import dct32_spec_plan
from dot_ir import (
    derive_dot_lowering_flags,
    dot_summary,
    select_dot_lowerings,
)


class TestDct32DotDag(unittest.TestCase):
    def setUp(self):
        self.ops = lower_plan_to_ops(dct32_spec_plan())

    def test_canonical_counts(self):
        s = dot_summary(self.ops)
        self.assertEqual(s["sdot.d/s64"], 1024)
        self.assertEqual(s["mul_saddv/s32"], 1024)

    def test_upstream_exact_uop(self):
        _, rep = select_dot_lowerings(self.ops, "sve1",
                                      "upstream-exact")
        self.assertEqual(rep["total_uop"], 1024 * 1 + 1024 * 4)
        self.assertEqual(rep["no_legal"], [])

    def test_legacy_lowering_axis_saves_uop(self):
        # legacy_k2/k4 switch mul_saddv dots to sdot.d slices: the same
        # graph, different lowering (docs/62, docs/20 legacy k2-ex).
        leg = apply32(self.ops, ["legacy_k2", "legacy_k4"])
        s = dot_summary(leg)
        self.assertLess(s["mul_saddv/s32"], 1024)
        self.assertGreater(s["sdot.d/s64"], 1024)
        _, rep = select_dot_lowerings(leg, "sve1",
                                      "legacy-internal-exact")
        self.assertLess(rep["total_uop"], 1024 * 1 + 1024 * 4)
        # op-level dot uop must drop by more than 1000 (search axis
        # benefit; full fused_uop measured separately by search_plans).
        self.assertLess(rep["total_uop"], 1024 * 1 + 1024 * 4 - 1000)

    def test_derive_flags_closes_loop(self):
        # upstream-exact: k2/k4 stay mul_saddv -> no legacy flags.
        canon_u, _ = select_dot_lowerings(self.ops, "sve1",
                                          "upstream-exact")
        self.assertEqual(derive_dot_lowering_flags(canon_u),
                         {"legacy_ex": 0, "legacy_k4": 0})
        # legacy family with k2/k4 rewrites: sdot.d on pass2 k2/k4.
        leg = apply32(self.ops, ["legacy_k2", "legacy_k4"])
        canon_l, _ = select_dot_lowerings(leg, "sve1",
                                          "legacy-internal-exact")
        flags = derive_dot_lowering_flags(canon_l)
        self.assertEqual(flags["legacy_ex"], 1)
        self.assertEqual(flags["legacy_k4"], 1)


class TestDct16DotDag(unittest.TestCase):
    def setUp(self):
        ops, leaves = lower_pass1_leaf()
        ops += lower_pass1_odd(leaves)
        ops += lower_pass2_upstream()
        self.ops = ops

    def test_canonical_counts(self):
        s = dot_summary(self.ops)
        self.assertEqual(s["sdot.d/s64"], 256)
        self.assertEqual(s["vmull_vmlal/s32"], 92)

    def test_select_no_legal_on_neon_absent(self):
        # dct16 neon_mul dots are s16/s16/s32: legal on SVE1 via
        # vmull_vmlal (NEON present) or unpk_svmul.
        canon, rep = select_dot_lowerings(self.ops, "sve1",
                                          "upstream-exact")
        self.assertEqual(rep["no_legal"], [])
        self.assertGreater(rep["nodes"], 0)
        lowerings = set(rep["selected"].values())
        self.assertTrue(lowerings <= {"sdot.d", "vmull_vmlal",
                                      "unpk_svmul", "mul_saddv"})


if __name__ == "__main__":
    unittest.main()
