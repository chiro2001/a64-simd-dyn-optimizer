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
                with open(c["src"], encoding="utf-8") as f:
                    src = f.read()
                self.assertIn(c["func_name"], src)
                self.assertNotIn("dynopt_dct16_sve2_shared", src)

    def test_helper_symbols_are_uniquified(self):
        with tempfile.TemporaryDirectory() as td:
            covers, _ = multicover.plan_covers(
                "dct16", "dynopt_dct16_sve2_shared", td)
            helper_sets = []
            for c in covers:
                with open(c["src"], encoding="utf-8") as f:
                    src = f.read()
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
        self.assertIn("AGO_BENCH_ROUNDS", src)    # median-of-rounds
        self.assertIn("med[nr / 2]", src)
        self.assertIn("AGO_BENCH_BUDGET_MS", src)  # timebox
        self.assertIn("upstream_ns", src)          # baseline pairing
        # shape-aware buffers (dct16: src 576B, dst 16*64*2+64=2112B)
        self.assertIn("dynopt_b0[576]", src)
        self.assertIn("dynopt_b1[2112]", src)

    def test_interception_contract(self):
        src = self._gen(bench=[])
        self.assertIn("dynopt_intercept_status", src)
        self.assertIn("dynopt_mark_intercepted", src)

    def test_bench_gate(self):
        src = self._gen(bench=["dct16"])
        self.assertIn("BENCH INVALID (interception failed)", src)
        self.assertIn("dynopt_bench_all();", src)

    def test_debug_trace_is_env_gated(self):
        src = self._gen(bench=["dct16"])
        self.assertIn('if (getenv("AGO_DEBUG"))', src)

    def test_whitelist_failure_text_present(self):
        src = self._gen(bench=[])
        self.assertIn("fingerprint mismatch", src)
        self.assertIn("out of whitelist", src)
        self.assertIn("bad fingerprint", src)


class HoleyCoversTest(unittest.TestCase):
    """Cover allow-list from build_release P2 leaves stable ordinal holes
    (e.g. cov2 excluded): the fns table must zero them, not reference
    undeclared symbols."""

    def test_hole_is_zeroed(self):
        k = [dict(kernel="dct16", ret="void",
                  params="const int16_t*, int16_t*, intptr_t",
                  cover_ids=[1, 3], default_id=3)]
        src = multicover.runtime_cpp(k, bench_kernels=["dct16"])
        self.assertIn("dynopt_dct16_fns[4] = {0, dynopt_dct16_cov1, 0,"
                      " dynopt_dct16_cov3};", src)
        self.assertIn("if (!dynopt_dct16_fns[ord]) return -1;", src)


class PresetVersionTest(unittest.TestCase):
    """AGO_PRESET emitted by the runtime must match the docs/88 grammar
    (v1:<fp>:<kv>) so bench output can be re-fed as the env var."""

    def test_emit_has_v1(self):
        k = [dict(kernel="dct16", ret="void",
                  params="const int16_t*, int16_t*, intptr_t",
                  cover_ids=[1, 2, 3], default_id=1)]
        src = multicover.runtime_cpp(k, bench_kernels=["dct16"])
        self.assertIn('"AGO_PRESET=v1:%s:", fp', src)
        self.assertIn('strcmp(v, "v1")', src)


class PlanExtrasTest(unittest.TestCase):
    """docs/87 step 5: checked-in scan-only candidates register as
    extra cover arms (op4032 on dct32, i8mm on interp8-32)."""

    def test_dct32_op4032_extra_cover_id4(self):
        with tempfile.TemporaryDirectory() as td:
            extra = [{"letter": "op4032", "src": os.path.join(
                ROOT, "kernels/dct32/candidates/best_sve2_op4032.cpp")}]
            covers, dflt = multicover.plan_covers(
                "dct32", "dynopt_dct32_sve2_shared", td,
                extra_covers=extra)
            self.assertEqual([c["id"] for c in covers], [1, 2, 3, 4])
            c4 = covers[3]
            self.assertEqual(c4["letter"], "op4032")
            self.assertEqual(c4["func_name"], "dynopt_dct32_cov4")
            with open(c4["src"], encoding="utf-8") as f:
                src = f.read()
            self.assertIn("dynopt_dct32_cov4", src)

    def test_interp8_32_i8mm_extra_cover_id2(self):
        with tempfile.TemporaryDirectory() as td:
            extra = [{"letter": "i8mm", "src": os.path.join(
                ROOT, "kernels/interp8-32/candidates/best_sve2_i8mm.cpp")}]
            covers, _ = multicover.plan_covers(
                "interp8-32", "dynopt_interp8_32x32_sve2", td,
                extra_covers=extra)
            self.assertEqual([c["id"] for c in covers], [1, 2])
            c2 = covers[1]
            self.assertEqual(c2["letter"], "i8mm")
            with open(c2["src"], encoding="utf-8") as f:
                src = f.read()
            self.assertIn("dynopt_interp8_32_cov2", src)
            # the original i8mm exported symbol survives (unique)
            self.assertIn("dynopt_interp8_hpp_32x32_i8mm", src)

    def test_extra_respect_allow_ids(self):
        with tempfile.TemporaryDirectory() as td:
            extra = [{"letter": "op4032", "src": os.path.join(
                ROOT, "kernels/dct32/candidates/best_sve2_op4032.cpp")}]
            covers, _ = multicover.plan_covers(
                "dct32", "dynopt_dct32_sve2_shared", td,
                extra_covers=extra, allow_ids={4})
            self.assertEqual([c["id"] for c in covers], [4])

    def test_missing_symbol_rejected(self):
        with tempfile.TemporaryDirectory() as td:
            src = os.path.join(td, "bad.cpp")
            with open(src, "w", encoding="utf-8") as f:
                f.write("extern \"C\" void dynopt_dct32_wrong(void) {}\n")
            with self.assertRaises(ValueError):
                multicover.plan_covers(
                    "dct32", "dynopt_dct32_sve2_shared", td,
                    extra_covers=[{"letter": "x", "src": src}])


if __name__ == "__main__":
    unittest.main()
