"""Unit tests for tools/multicover.py (docs/87 step 2)."""

import os
import re
import sys
import tempfile
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import multicover

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class PlanCoversTest(unittest.TestCase):

    def test_dct16_plan_default_id3(self):
        with tempfile.TemporaryDirectory() as td:
            dflt = open(os.path.join(
                ROOT, "kernels/dct16/candidates/best_sve2_op895.cpp"),
                encoding="utf-8").read()
            covers, dflt_id = multicover.plan_covers(
                "dct16", "dynopt_dct16_sve2_shared", td, default_src=dflt)
            self.assertEqual([c["id"] for c in covers], [1, 2, 3])
            self.assertEqual(dflt_id, 3)
            # exported symbols are distinct and the kernel symbol is gone
            syms = [c["func_name"] for c in covers]
            self.assertEqual(len(set(syms)), 3)
            for c in covers:
                src = open(c["src"], encoding="utf-8").read()
                self.assertIn(c["func_name"], src)
                self.assertNotIn("dynopt_dct16_sve2_shared", src)

    def test_helper_symbols_are_uniquified(self):
        with tempfile.TemporaryDirectory() as td:
            covers, _ = multicover.plan_covers(
                "dct16", "dynopt_dct16_sve2_shared", td)
            helper_sets = []
            for c in covers:
                src = open(c["src"], encoding="utf-8").read()
                helper_sets.append(
                    {h for h in re.findall(r"\bdynopt_dct16_[A-Za-z0-9_]+",
                                           src)
                     if h != c["func_name"]})
            helpers = helper_sets[0] | helper_sets[1] | helper_sets[2]
            seen = set()
            for hs, c in zip(helper_sets, covers):
                for h in hs:
                    self.assertTrue(h.startswith(c["func_name"] + "_"), h)
                    for other in covers:
                        if other["id"] != c["id"]:
                            self.assertNotIn(other["func_name"], h)
                    self.assertNotIn(h, seen)
                    seen.add(h)
            self.assertGreater(len(helpers), 3)  # op_pass etc. present

    def test_default_falls_back_to_first_cover(self):
        with tempfile.TemporaryDirectory() as td:
            covers, dflt = multicover.plan_covers(
                "dct16", "dynopt_dct16_sve2_shared", td, default_src="")
            self.assertEqual(dflt, 1)

    def test_rename_symbol_guards(self):
        self.assertEqual(multicover.rename_symbol("a b c", "b", "x"),
                         "a x c")
        with self.assertRaises(ValueError):
            multicover.rename_symbol("void f(void) { }", "b", "x")
        with self.assertRaises(ValueError):
            multicover.rename_symbol("b b b b b", "b", "x")


class RuntimeCppTest(unittest.TestCase):

    def _gen(self, bench=None, default_id=3):
        k = [dict(kernel="dct16", ret="void",
                  params="const int16_t*, int16_t*, intptr_t",
                  cover_ids=[1, 2, 3], default_id=default_id)]
        return multicover.runtime_cpp(k, bench_kernels=bench or (["dct16"]
                                                                  if bench
                                                                  else []))

    def test_exports_and_default_reset(self):
        src = self._gen(bench=["dct16"])
        self.assertIn('extern "C" void dynopt_preset_and_bench(void) {', src)
        self.assertIn("dynopt_dct16_cur = dynopt_dct16_fns[3];", src)
        self.assertIn("dynopt_dct16_fns[4] = {0,", src)  # upstream slot 0
        self.assertIn("if (ord == 0) return dynopt_dct16_up ? 0 : -1;", src)
        self.assertIn('if (!strcmp(k, "dct16")) return dynopt_dct16_apply(ord);',
                      src)

    def test_timer_is_portable(self):
        src = self._gen(bench=["dct16"])
        self.assertIn("clock_gettime(CLOCK_MONOTONIC, &ts)", src)
        self.assertNotIn("cntvct_el0", src)

    def test_fingerprint_components(self):
        src = self._gen(bench=[])
        self.assertIn("AGO_ISA_STR", src)       # isa via build macro
        self.assertIn("dynopt_sha256_file", src)  # so_sha256 component
        self.assertIn("__VERSION__", src)
        self.assertNotIn("dynopt_fnv64", src)

    def test_bench_controls(self):
        src = self._gen(bench=["dct16"])
        self.assertIn("AGO_BENCH_MAXORD", src)
        self.assertIn("if (b >= 0) {", src)  # skip kernels w/o measured arm
        self.assertIn("ns/call", src)

    def test_debug_trace_is_env_gated(self):
        src = self._gen(bench=["dct16"])
        self.assertIn('if (getenv("AGO_DEBUG"))', src)

    def test_whitelist_failure_text_present(self):
        src = self._gen(bench=[])
        self.assertIn("fingerprint mismatch", src)
        self.assertIn("out of whitelist", src)
        self.assertIn("bad fingerprint", src)


if __name__ == "__main__":
    unittest.main()
