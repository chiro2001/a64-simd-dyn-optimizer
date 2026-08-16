"""P4 template tests: full-unroll, tail-specialize, dot-fusion,
butterfly-quarter (protocol + emitted structure + proof obligations)."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "optimizer"))

from ago.rules import CoverTemplate, ProofObligation, RuleBinding  # noqa: E402
from ago.templates.unroll_full import (  # noqa: E402
    FullUnrollPattern, FullUnrollRewrite, FullUnrollTemplate)
from ago.templates.tail_specialize import (  # noqa: E402
    TailSpecializePattern, TailSpecializeRewrite, TailSpecializeTemplate)
from ago.templates.dot_fusion import (  # noqa: E402
    DotFusionPattern, DotFusionTemplate, dot_groups,
    emit_dot_fusion, proof_c_source, ref_muladd)
from ago.templates.butterfly_quarter import (  # noqa: E402
    ButterflyQuarterPattern, ButterflyQuarterTemplate,
    emit_quarter_pass)


class TestFullUnroll(unittest.TestCase):
    def test_match_and_emit(self):
        b = FullUnrollPattern().match((4, "op({i});"))
        self.assertIsNotNone(b)
        src, obs = FullUnrollTemplate().emit(
            (4, "op({i});"), b)
        self.assertEqual(src.count("op("), 4)
        self.assertEqual(src, "op(0);\nop(1);\nop(2);\nop(3);")
        self.assertEqual(obs[0].kind, "differential")

    def test_callable_body(self):
        b = RuleBinding({"trip_count": 3, "body": lambda i: "f(%d);" % i})
        src, _ = FullUnrollTemplate().emit((3, b.values["body"]), b)
        self.assertIn("f(2);", src)

    def test_preconditions(self):
        t = FullUnrollTemplate()
        self.assertFalse(t.preconditions((0, "x"), RuleBinding(
            {"trip_count": 0, "body": "x"})))
        self.assertTrue(t.preconditions((2, "x"), RuleBinding(
            {"trip_count": 2, "body": "x"})))

    def test_rewrite_protocol(self):
        self.assertEqual(FullUnrollRewrite().id, "full-unroll")
        with self.assertRaises(NotImplementedError):
            CoverTemplate().emit(None, None)


class TestTailSpecialize(unittest.TestCase):
    def _main(self, s):
        return "main(%d);" % s

    def _tail(self, rem):
        return "tail(%d);" % rem

    def test_divisible_no_tail(self):
        b = TailSpecializePattern().match((4, 8, self._main, self._tail))
        src, obs = TailSpecializeTemplate().emit((4, 8, None, None), b)
        self.assertEqual(src.count("main("), 2)
        self.assertNotIn("tail(", src)
        self.assertIn('remainder 0', obs[0].to_json())

    def test_remainder_emitted(self):
        b = TailSpecializePattern().match((4, 10, self._main, self._tail))
        src, obs = TailSpecializeTemplate().emit((4, 10, None, None), b)
        self.assertEqual(src.count("main("), 2)
        self.assertIn("tail(2);", src)
        self.assertIn('remainder 2', obs[0].to_json())

    def test_coverage_obligation(self):
        _, obs = TailSpecializeRewrite().apply(
            (4, 10, self._main, self._tail),
            TailSpecializePattern().match((4, 10, self._main, self._tail)))
        self.assertEqual(obs[0].id, "tail-cover-4-10")
        self.assertIn("touched exactly once", obs[0].to_json())


class TestDotFusion(unittest.TestCase):
    def test_reference_and_groups(self):
        a = [1, 2, 3, 4, 5, 6, 7, 8]
        b = [8, 7, 6, 5, 4, 3, 2, 1]
        self.assertEqual(ref_muladd(a, b), 120)
        self.assertEqual(dot_groups(a, b, 4), [60, 60])

    def test_emit_sve_s16_uses_sdot_s64(self):
        src = emit_dot_fusion(a_ty="int16_t", target="sve2", n=8)
        self.assertIn("svdot_s64", src)
        self.assertIn("svlasta_s64", src)

    def test_emit_sve_s8_uses_sdot_s32(self):
        src = emit_dot_fusion(a_ty="int8_t", target="sve2", n=8)
        self.assertIn("svdot_s32", src)

    def test_emit_neon_s8(self):
        src = emit_dot_fusion(a_ty="int8_t", target="neon", n=16)
        self.assertIn("vdotq_s32", src)

    def test_neon_s16_rejected(self):
        with self.assertRaises(ValueError):
            emit_dot_fusion(a_ty="int16_t", target="neon", n=8)

    def test_proof_harness(self):
        src = proof_c_source(a_ty="int16_t", lanes=4, n=8)
        self.assertIn("dot_fused_1g", src)
        self.assertIn("exhaustive+random", src)
        self.assertIn("20000", src)

    def test_template_obligations(self):
        b = DotFusionPattern().match(([1] * 8, [1] * 8, 4))
        _, obs = DotFusionTemplate().emit(([1] * 8, [1] * 8, 4), b,
                                          target="sve2")
        self.assertTrue(all(isinstance(o, ProofObligation) for o in obs))
        self.assertIn("wrap", obs[0].to_json())


class TestButterflyQuarter(unittest.TestCase):
    def test_match_and_emit(self):
        b = ButterflyQuarterPattern().match((16, {"GT": [], "T8E": []}))
        self.assertIsNotNone(b)
        src, obs = ButterflyQuarterTemplate().emit(
            (16, {"GT": [], "T8E": []}), b, target="sve2")
        self.assertIn("O_0", src)
        self.assertIn("EO_0", src)
        self.assertIn("EE_0", src)
        self.assertIn("sdot", src)
        self.assertEqual(obs[0].id, "quarter-16")
        self.assertIn("TestBenchLite", obs[0].to_json())

    def test_sizes(self):
        for n in (8, 16, 32):
            src = emit_quarter_pass(n=n, target="sve2")
            self.assertIn("const int line = %d;" % n, src)

    def test_invalid_size_rejected(self):
        self.assertIsNone(ButterflyQuarterPattern().match((12, {})))


if __name__ == "__main__":
    unittest.main()
