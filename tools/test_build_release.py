#!/usr/bin/env python3
"""Unit tests for tools/build_release.py (docs/87 step 4, P1-P4)."""

import os
import sys
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

import build_release as br
from bench_specs import spec as bench_spec


class SelectCoversTest(unittest.TestCase):

    def test_excludes_fail_keeps_rest(self):
        g = {
            "dct16": {
                1: {"status": "pass", "mismatches": 0},
                2: {"status": "fail", "mismatches": 3},
                3: {"status": "not-gated", "mismatches": 0},
            },
        }
        self.assertEqual(br.select_covers(g), {"dct16": [1, 3]})

    def test_all_fail_yields_empty(self):
        g = {"dct32": {1: {"status": "fail", "mismatches": 8}}}
        self.assertEqual(br.select_covers(g), {"dct32": []})

    def test_ids_stay_sorted(self):
        g = {"dct16": {3: {"status": "pass"}, 1: {"status": "pass"},
                       2: {"status": "pass"}}}
        self.assertEqual(br.select_covers(g), {"dct16": [1, 2, 3]})


class GateDoorTest(unittest.TestCase):
    """The differential gate must mirror the REAL x265 call contract,
    not the padded bench convention (this was a real bug found during
    build_release bring-up)."""

    def test_dct16_uses_real_stride_and_logical_compare(self):
        cpp = br._gate_cpp("dct16", bench_spec("dct16"), [1, 2, 3])
        self.assertIn("up((const int16_t*)ob0, (int16_t*)oa1, 16);", cpp)
        self.assertIn("memcmp(oa1, ob1, 512)", cpp)
        self.assertNotIn(", 64);", cpp)
        # 9-bit residual input domain (no int16 saturation on AC/DC)
        self.assertIn("& 511) - 256", cpp)
        # baseline must be captured BEFORE the probe ctor can patch slots
        up = cpp.index("fn_t up = (fn_t)")
        ph = cpp.index("void* ph = dlopen")
        self.assertLess(up, ph)
        # per-cover lookup by ordinal-invariant symbol name
        self.assertIn('dlsym(ph, "dynopt_dct16_cov1")', cpp)
        self.assertIn('dlsym(ph, "dynopt_dct16_cov3")', cpp)

    def test_dct32_uses_real_stride32(self):
        cpp = br._gate_cpp("dct32", bench_spec("dct32"), [1, 2, 3])
        self.assertIn("up((const int16_t*)ob0, (int16_t*)oa1, 32);", cpp)
        self.assertIn("memcmp(oa1, ob1, 2048)", cpp)

    def test_satd_ret_mode(self):
        cpp = br._gate_cpp("satd-8", bench_spec("satd-8"), [1])
        self.assertIn("int uv = up(", cpp)
        self.assertIn("int cv = cf(", cpp)
        self.assertIn("P->pu[LUMA_8x8].satd", cpp)


class MultilineParseTest(unittest.TestCase):
    """GATE/BENCH output is multi-line; the parsers must use re.M."""

    def test_gate_re_finds_every_line(self):
        buf = "GATE dct16 1 pass 0\nGATE dct16 2 fail 3\n"
        ms = br.GATE_RE.finditer(buf)
        got = [(m.group(1), m.group(2), m.group(3), m.group(4))
               for m in ms]
        self.assertEqual(got, [("dct16", "1", "pass", "0"),
                               ("dct16", "2", "fail", "3")])

    def test_bench_re_finds_every_line(self):
        buf = ("dynopt: bench dct16 ord=0 ns/call=100\n"
               "dynopt: bench dct16 ord=1 ns/call=200\n")
        got = [(m.group(1), m.group(2), m.group(3))
               for m in br.BENCH_RE.finditer(buf)]
        self.assertEqual(got, [("dct16", "0", "100"),
                               ("dct16", "1", "200")])


class Sha256Test(unittest.TestCase):

    def test_roundtrip(self):
        with tempfile.NamedTemporaryFile("w", delete=False) as f:
            f.write("hello\n")
            p = f.name
        try:
            self.assertEqual(br.sha256_file(p),
                             "5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af3"
                             "4d08286a2e846f6be03")
        finally:
            os.unlink(p)


class PresetNormalizeTest(unittest.TestCase):

    def test_env_prefix_stripped(self):
        self.assertEqual(
            br.normalize_preset("AGO_PRESET=v1:mfd2a2bf4:dct16=2"),
            "v1:mfd2a2bf4:dct16=2")

    def test_plain_passthrough(self):
        self.assertEqual(br.normalize_preset("v1:mfd2a2bf4:dct16=2"),
                         "v1:mfd2a2bf4:dct16=2")

    def test_whitespace(self):
        self.assertEqual(br.normalize_preset("  v1:mfd2a2bf4:dct16=2\n"),
                         "v1:mfd2a2bf4:dct16=2")


if __name__ == "__main__":
    unittest.main()
