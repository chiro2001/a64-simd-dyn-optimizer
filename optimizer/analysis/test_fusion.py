"""Unit tests for the fusion static inventory."""

import unittest

from optimizer.analysis.fusion import analyze_pairs, classify_counts, \
    fusion_report, parse_inst


class TestFusion(unittest.TestCase):

    def test_parse_inst_binary(self):
        p = parse_inst("   0:\t4e20d420 \tadd\tv0.4s, v1.4s, v2.4s")
        mn, dst, srcs, preds = p
        self.assertEqual(mn, "add")
        self.assertEqual(dst["reg"], "v0")
        self.assertEqual([s["reg"] for s in srcs], ["v1", "v2"])

    def test_parse_inst_sve_predicate(self):
        p = parse_inst("   0:\t04048421 \tadd\tz0.s, p0/m, z0.s, z1.s")
        mn, dst, srcs, preds = p
        self.assertEqual(preds, ["p0"])

    def test_classify_mutually_exclusive(self):
        c = classify_counts({"add": 10, "ld1": 5, "ldr": 2, "st1": 1,
                             "nop": 3})
        self.assertEqual(c["simd_insns"], 10)
        self.assertEqual(c["load_insns"], 7)   # vector + scalar loads
        self.assertEqual(c["store_insns"], 1)
        self.assertNotIn("ld1", c)

    def test_dest_chaining_pair(self):
        asm = """
   0:   4e21d400        add     v0.4s, v0.4s, v1.4s
   4:   4e221c00        shl     v0.4s, v0.4s, #6
"""
        insts = [p for p in (parse_inst(l) for l in asm.splitlines()) if p]
        pairs = analyze_pairs(insts)
        self.assertEqual(len(pairs), 1)
        self.assertEqual(pairs[0]["read_ports"], 2)
        self.assertEqual(pairs[0]["write_ports"], 1)
        self.assertTrue(pairs[0]["dependency_ok"])

    def test_intermediate_observable_rejected(self):
        asm = """
   0:   4e21d400        add     v0.4s, v0.4s, v1.4s
   4:   4e221c00        shl     v2.4s, v2.4s, #3
   8:   4e248400        add     v3.4s, v0.4s, v2.4s
   c:   4e251c00        shl     v0.4s, v0.4s, #6
"""
        insts = [p for p in (parse_inst(l) for l in asm.splitlines()) if p]
        pairs = analyze_pairs(insts)
        # v0 is read between the add and the chained shl, so not fusable
        self.assertEqual(pairs, [])

    def test_report_fields(self):
        asm = """
   0:   4e21d400        add     v0.4s, v0.4s, v1.4s
   4:   4e221c00        shl     v0.4s, v0.4s, #6
   8:   4cdf7c20        ld1     {v4.4s}, [x1]
"""
        rep = fusion_report("k", {"name": "p", "issue_est": 4}, asm)
        self.assertEqual(rep["simd_insns"], 2)
        self.assertEqual(rep["load_insns"], 1)
        self.assertEqual(rep["n_est"], 3)
        self.assertEqual(rep["summary"]["predicted_issue_slots_saved"],
                         "unknown")

    def test_predicate_consistency(self):
        asm = """
   0:   04048421        add     z0.s, p0/m, z0.s, z1.s
   4:   04040421        add     z0.s, p1/m, z0.s, z1.s
"""
        insts = [p for p in (parse_inst(l) for l in asm.splitlines()) if p]
        pairs = analyze_pairs(insts)
        # different governing predicates: rejected
        self.assertEqual(pairs, [])


if __name__ == "__main__":
    unittest.main()
