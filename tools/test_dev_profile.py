"""Unit tests for tools/dev_profile.py (docs/87 step 5)."""

import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dev_profile
from bench_specs import spec as bench_spec


class VerdictTest(unittest.TestCase):

    def test_exact_any_gain_ships(self):
        self.assertEqual(dev_profile.verdict(True, 0, 0, 1.02), "ship")

    def test_exact_no_gain_holds(self):
        self.assertEqual(dev_profile.verdict(True, 0, 0, 0.98),
                         "hold_exact")

    def test_bounded_clear_gain_ships(self):
        self.assertEqual(dev_profile.verdict(False, 12096, 32767, 1.10),
                         "ship")

    def test_bounded_modest_gain_holds(self):
        self.assertEqual(dev_profile.verdict(False, 900, 32767, 1.02),
                         "hold_bounded")

    def test_divergent_excluded(self):
        self.assertEqual(dev_profile.verdict(False, 255, 0, 1.50),
                         "exclude")

    def test_missing_profile(self):
        self.assertEqual(dev_profile.verdict(False, None, 0, 1.0),
                         "missing")


class CallArgsTest(unittest.TestCase):

    def test_sao_upstream_uses_oa0_only_for_rec(self):
        args = dev_profile._call_args(bench_spec("sao"), "oa")
        self.assertIn("(uint8_t*)oa0", args)
        self.assertIn("(int8_t*)ob1", args)
        self.assertIn("(int8_t*)ob2", args)
        self.assertIn("64, (int8_t*)ob2, 128", args)

    def test_sao_candidate_uses_ob_buffers(self):
        args = dev_profile._call_args(bench_spec("sao"), "ob", cand=True)
        self.assertIn("(uint8_t*)ob0", args)
        self.assertIn("(int8_t*)ob1", args)
        self.assertIn("(int8_t*)ob2", args)
        self.assertIn("128", args)

    def test_interp8_32_scalars_phase2(self):
        sp = bench_spec("interp8-32")
        args = dev_profile._call_args(sp, "ob")
        self.assertTrue(args.endswith(", 64, 2"), args)

    def test_dct32_call_scalars(self):
        sp = bench_spec("dct32")
        args = dev_profile._call_args(sp, "ob")
        self.assertIn("(const int16_t*)ob0", args)
        self.assertIn("(int16_t*)ob1, 32", args)


class ProfReTest(unittest.TestCase):
    """Regression guard: PROF lines arrive multiline (docs/87 step 4
    gate/bench re.M bug pattern)."""

    def test_multiline_prof_parses(self):
        out = ("PROF dct32 1 exact max=0 mean=0 l1=0 l2=0 cnt=0\n"
               "PROF dct32 4 diff max=12096 mean=1 l1=86784 l2=3 cnt=36 "
               "off=905:max=12096\n")
        ms = list(dev_profile.PROF_RE.finditer(out))
        self.assertEqual(len(ms), 2)
        self.assertEqual(ms[1].group(4), "12096")

    def test_tm_line_parses(self):
        m = dev_profile.TM_RE.search("junk\nTM dct32 1234 50000\n")
        self.assertIsNotNone(m)
        self.assertEqual(m.group(2), "1234")

    def test_extra_covers_registry(self):
        self.assertEqual(
            [e["letter"] for e in dev_profile.EXTRA_COVERS["dct32"]],
            ["op4032"])
        self.assertEqual(
            [e["letter"] for e in dev_profile.EXTRA_COVERS["interp8-32"]],
            ["i8mm"])


if __name__ == "__main__":
    unittest.main()
