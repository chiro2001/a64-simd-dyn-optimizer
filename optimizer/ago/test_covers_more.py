#!/usr/bin/env python3
"""Tests for the docs/82 #4 family covers: sad / satd-16 / psy-cost."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

from optimizer.ago.covers_sad import cover_meta as sad_meta
from optimizer.ago.covers_sa8d16 import cover_meta as sa8d16_meta
from optimizer.ago.covers_dct8 import cover_meta as dct8_meta
from optimizer.ago.covers_dct32 import cover_meta as dct32_meta
from optimizer.ago.covers_satd_8x4 import cover_meta as s8x4_meta
from optimizer.ago.covers_satd_8x32 import cover_meta as s8x32_meta
from optimizer.ago.covers_satd_8x32 import emit_cover as emit_s8x32
from optimizer.ago.covers_satd_8x4 import emit_cover as emit_s8x4
from optimizer.ago.covers_dct32 import emit_cover as emit_dct32
from optimizer.ago.covers_sao_e0 import cover_meta as saoe0_meta
from optimizer.ago.covers_sao_stats_e1 import cover_meta as saoe1_meta
from optimizer.ago.covers_sao_stats_e3 import cover_meta as saoe3_meta
from optimizer.ago.covers_sao_stats_e3 import emit_cover as emit_saoe3
from optimizer.ago.covers_sao_stats_e1 import emit_cover as emit_saoe1
from optimizer.ago.covers_sao_stats_e2 import cover_meta as saoe2_meta
from optimizer.ago.covers_sao_stats_bo import cover_meta as saobo_meta
from optimizer.ago.covers_sao_b0 import cover_meta as saob0_meta
from optimizer.ago.covers_sao_e1 import cover_meta as saoe1rec_meta
from optimizer.ago.covers_sao_e2 import cover_meta as saoe2rec_meta
from optimizer.ago.covers_sao_e2 import emit_cover as emit_saoe2rec
from optimizer.ago.covers_sao_e3 import cover_meta as saoe3rec_meta
from optimizer.ago.covers_sao_e3 import emit_cover as emit_saoe3rec
from optimizer.ago.covers_sao_e1 import emit_cover as emit_saoe1rec
from optimizer.ago.covers_sao_b0 import emit_cover as emit_saob0
from optimizer.ago.covers_sao_e0 import emit_cover as emit_saoe0
from optimizer.ago.covers_dct8 import emit_cover as emit_dct8
from optimizer.ago.covers_sa8d16 import emit_cover as emit_sa8d16
from optimizer.ago.covers_sad import emit_cover as emit_sad
from optimizer.ago.covers_satd16 import cover_meta as satd16_meta
from optimizer.ago.covers_satd16 import emit_cover as emit_satd16
from optimizer.ago.covers_satd16x32 import cover_meta as s16x32_meta
from optimizer.ago.covers_satd16x32 import emit_cover as emit_s16x32
from optimizer.ago.covers_psycost import cover_meta as psy_meta
from optimizer.ago.covers_psycost import emit_cover as emit_psy
from optimizer.ago.covers_satd_8x16 import cover_meta as s816_meta
from optimizer.ago.covers_satd_8x16 import emit_cover as emit_s816
from optimizer.ago.covers_satd_16x8 import cover_meta as s168_meta
from optimizer.ago.covers_satd_16x8 import emit_cover as emit_s168
from optimizer.ago.covers_costcoeff import cover_meta as cc_meta
from optimizer.ago.covers_costcoeff import emit_cover as emit_cc


class TestCoversSad(unittest.TestCase):

    def test_meta(self):
        m = sad_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        # A/B (existing best) must beat C (dual-group sve16) on 950 proxy.
        self.assertEqual(m["expected_permute_ratio"]["A"], 0.0)
        self.assertEqual(m["expected_permute_ratio"]["B"], 0.0)
        self.assertGreater(m["expected_permute_ratio"]["C"], 0.30)

    def test_emit_all(self):
        for c in sad_meta()["covers"]:
            code = emit_sad(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_sad("Z")


class TestCoversSatd16(unittest.TestCase):

    def test_meta(self):
        m = satd16_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.30)
        self.assertGreater(m["expected_permute_ratio"]["B"], 0.30)
        self.assertLess(m["expected_permute_ratio"]["C"], 0.30)

    def test_emit_all(self):
        for c in satd16_meta()["covers"]:
            code = emit_satd16(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_satd16("Z")


class TestCoversSatd16x32(unittest.TestCase):

    def test_meta(self):
        m = s16x32_meta()
        self.assertEqual(m["covers"], ["A"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.30)

    def test_emit_all(self):
        for c in s16x32_meta()["covers"]:
            code = emit_s16x32(c)
            self.assertIsInstance(code, str)
            self.assertIn("svcadd_s16", code)
            self.assertIn("g < 8", code)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_s16x32("Z")


class TestCoversPsyCost(unittest.TestCase):

    def test_meta(self):
        m = psy_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.35)
        self.assertGreater(m["expected_permute_ratio"]["B"], 0.35)
        self.assertLess(m["expected_permute_ratio"]["C"], 0.25)

    def test_emit_all(self):
        for c in psy_meta()["covers"]:
            code = emit_psy(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_psy("Z")


class TestCoversSatdShapes(unittest.TestCase):
    """satd-8x16 / satd-16x8 NEON covers (docs/82 #4 扩展)."""

    def test_8x16_meta(self):
        m = s816_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        # All measured below the 30% threshold (vs sve16 candidate 50.7%).
        for c in m["covers"]:
            self.assertLess(m["expected_permute_ratio"][c], 0.30)

    def test_16x8_meta(self):
        m = s168_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        for c in m["covers"]:
            self.assertLess(m["expected_permute_ratio"][c], 0.30)

    def test_emit_all_shapes(self):
        for emit_fn in (emit_s816, emit_s168):
            for c in ("A", "B", "C"):
                code = emit_fn(c)
                self.assertIsInstance(code, str)
                self.assertGreater(len(code), 500)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_s816("Z")
        with self.assertRaises(ValueError):
            emit_s168("Z")


class TestCoversSa8d16(unittest.TestCase):

    def test_meta(self):
        m = sa8d16_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])
        self.assertLess(m["expected_permute_ratio"]["C"], 0.15)
        self.assertGreater(m["expected_permute_ratio"]["C"],
                           m["expected_permute_ratio"]["A"] * 0.3)

    def test_emit_c(self):
        code = emit_sa8d16("C")
        self.assertIn("svcadd_s16", code)
        self.assertIn("had8_s16", code)

    def test_emit_all(self):
        for c in sa8d16_meta()["covers"]:
            code = emit_sa8d16(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_sa8d16("Z")


class TestCoversSaoStats(unittest.TestCase):
    """sao-stats-bo/e1/e2 covers."""

    def test_e1_meta(self):
        m = saoe1_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])

    def test_e3_meta(self):
        m = saoe3_meta()
        self.assertEqual(m["covers"], ["A"])

    def test_emit_e3(self):
        code = emit_saoe3("A")
        self.assertIn("dynopt_sao_stats_e3_64_sve2", code)
        self.assertIn("stride - 1", code)  # 45deg diagonal offset

    def test_e3_invalid(self):
        with self.assertRaises(ValueError):
            emit_saoe3("Z")


    def test_e2_meta(self):
        m = saoe2_meta()
        self.assertEqual(m["covers"], ["A", "B", "C"])

    def test_e2rec_meta(self):
        m = saoe2rec_meta()
        self.assertEqual(m["covers"], ["A"])

    def test_emit_e2rec(self):
        code = emit_saoe2rec("A")
        self.assertIn("dynopt_sao_e2_64_sve2", code)
        self.assertIn("stride + 1", code)  # down-right diagonal

    def test_e3rec_meta(self):
        m = saoe3rec_meta()
        self.assertEqual(m["covers"], ["A"])

    def test_emit_e3rec(self):
        code = emit_saoe3rec("A")
        self.assertIn("dynopt_sao_e3_64_sve2", code)
        self.assertIn("x - 1", code)  # shifted upBuff store

    def test_e2e3_invalid(self):
        with self.assertRaises(ValueError):
            emit_saoe2rec("Z")
        with self.assertRaises(ValueError):
            emit_saoe3rec("Z")


    def test_e1rec_meta(self):
        m = saoe1rec_meta()
        self.assertEqual(m["covers"], ["A"])

    def test_emit_e1rec(self):
        code = emit_saoe1rec("A")
        self.assertIn("dynopt_sao_e1_64x4_sve2", code)
        self.assertIn("svqxtunb_s16", code)  # saturating narrow

    def test_e1rec_invalid(self):
        with self.assertRaises(ValueError):
            emit_saoe1rec("Z")


    def test_b0_meta(self):
        m = saob0_meta()
        self.assertEqual(m["covers"], ["A"])

    def test_emit_b0(self):
        code = emit_saob0("A")
        self.assertIn("dynopt_sao_b0_64x4_sve2", code)
        self.assertIn("svtbl_s8", code)

    def test_b0_invalid(self):
        with self.assertRaises(ValueError):
            emit_saob0("Z")


    def test_bo_meta(self):
        m = saobo_meta()
        self.assertEqual(m["covers"], ["A"])

    def test_emit_e1_c(self):
        code = emit_saoe1("C")
        self.assertIn("dynopt_sao_stats_e1_64_sve2", code)

    def test_invalid(self):
        with self.assertRaises(ValueError):
            emit_saoe1("Z")


class TestCoversDct32Batch8(unittest.TestCase):

    def test_meta(self):
        m = dct32_meta()
        self.assertIn("C", m["covers"])
        self.assertLess(m["expected_permute_ratio"]["C"], 0.15)

    def test_emit_c_batch8(self):
        code = emit_dct32("C")
        self.assertIn("dynopt_dct32_sve2_shared", code)
        # batch8 doubles the odd-k halves -> 2 occurrences of the
        # X-packing marker
        self.assertGreaterEqual(code.count("svtbl2_s16"), 16)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_dct32("Z")


class TestCoversSaoE0(unittest.TestCase):

    def test_meta(self):
        m = saoe0_meta()
        self.assertEqual(m["covers"], ["A", "B", "C", "D", "E"])
        self.assertLess(m["expected_permute_ratio"]["E"], 0.30)

    def test_emit_all(self):
        for c in saoe0_meta()["covers"]:
            code = emit_saoe0(c)
            self.assertIn("dynopt_sao_stats_e0_64_sve2", code, c)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_saoe0("Z")


class TestCuChromaCovers(unittest.TestCase):
    """cu/chroma copy/arithmetic family covers (7 kernels)."""

    KERNELS = ["chroma-copy-pp-8x8", "chroma-copy-pp-32x32",
               "chroma-copy-ps-16x16", "cu-copy-pp", "cu-add-ps",
               "cu-sub-ps", "chroma-addavg-8x8"]

    def test_meta_and_emit(self):
        for k in self.KERNELS:
            mod = __import__("optimizer.ago.covers_%s"
                             % k.replace("-", "_"),
                             fromlist=["cover_meta", "emit_cover"])
            m = mod.cover_meta()
            self.assertEqual(m["covers"], ["A"], k)
            code = mod.emit_cover("A")
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100, k)


class TestCoversSatd8x32(unittest.TestCase):

    def test_meta(self):
        m = s8x32_meta()
        self.assertEqual(m["covers"], ["A"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.05)

    def test_emit(self):
        code = emit_s8x32("A")
        self.assertIn("dynopt_satd_8x32_sve2", code)
        self.assertIn("blk < 4", code)  # 4x 8x8 blocks

    def test_invalid(self):
        with self.assertRaises(ValueError):
            emit_s8x32("B")


class TestCoversSatd8x4(unittest.TestCase):

    def test_meta(self):
        m = s8x4_meta()
        self.assertEqual(m["covers"], ["A"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.05)

    def test_emit(self):
        code = emit_s8x4("A")
        self.assertIn("dynopt_satd_8x4_sve2", code)
        self.assertIn("svcadd_s16", code)  # bridge cadd

    def test_invalid(self):
        with self.assertRaises(ValueError):
            emit_s8x4("B")


class TestInterp8Shapes(unittest.TestCase):
    """interp8 16x32 / 32x32 / 64x64 shape covers (best_ir)."""

    SHAPES = [("interp8-8x16", "dynopt_interp8_8x16_sve2"),
              ("interp8-16x8", "dynopt_interp8_16x8_sve2"),
              ("interp8-16x32", "dynopt_interp8_16x32_sve2"),
              ("interp8-32", "dynopt_interp8_32x32_sve2"),
              ("interp8-64x64", "dynopt_interp8_64x64_sve2")]

    def test_meta_and_emit(self):
        for k, sym in self.SHAPES:
            mod = __import__("optimizer.ago.covers_%s"
                             % k.replace("-", "_"),
                             fromlist=["cover_meta", "emit_cover"])
            m = mod.cover_meta()
            self.assertEqual(m["covers"], ["A"], k)
            self.assertLess(m["expected_permute_ratio"]["A"], 0.05)
            code = mod.emit_cover("A")
            self.assertIn(sym, code, k)


class TestCoversDct8(unittest.TestCase):

    def test_meta(self):
        m = dct8_meta()
        self.assertEqual(m["covers"], ["A"])
        self.assertLess(m["expected_permute_ratio"]["A"], 0.30)

    def test_emit(self):
        code = emit_dct8("A")
        self.assertIn("dynopt_dct8_sve2_shared", code)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_dct8("B")  # narrowed to A only (sve2_shared not bit-exact)


class TestSa8dLargeCovers(unittest.TestCase):
    """sa8d-32x32 / sa8d-64x64 width-native cadd covers."""

    SHAPES = [(32, 32), (64, 64)]

    def test_meta_and_emit(self):
        for w, h in self.SHAPES:
            mod = __import__("optimizer.ago.covers_sa8d%dx%d" % (w, h),
                             fromlist=["cover_meta", "emit_cover"])
            m = mod.cover_meta()
            self.assertEqual(m["covers"], ["A"], "%dx%d" % (w, h))
            self.assertLess(m["expected_permute_ratio"]["A"], 0.15)
            code = mod.emit_cover("A")
            self.assertIn("svcadd_s16", code, "%dx%d" % (w, h))
            self.assertIn("dynopt_sa8d_%dx%d_sve2" % (w, h), code)
            self.assertIn(">> 1", code)  # per-group rounding


class TestLargeSatdCovers(unittest.TestCase):
    """Parameterized: all large-shape cadd covers emit + meta sane."""

    SHAPES = [(16, 4), (16, 32), (16, 64), (32, 8), (32, 16),
              (32, 32), (32, 64), (64, 16), (64, 32), (64, 48),
              (64, 64)]

    def _import(self, w, h):
        mod = __import__("optimizer.ago.covers_satd%dx%d" % (w, h),
                         fromlist=["cover_meta", "emit_cover"])
        return mod.cover_meta, mod.emit_cover

    def test_meta_all(self):
        for w, h in self.SHAPES:
            meta, _ = self._import(w, h)
            m = meta()
            self.assertEqual(m["covers"], ["A"], "%dx%d" % (w, h))
            self.assertLess(m["expected_permute_ratio"]["A"], 0.30)

    def test_emit_all(self):
        for w, h in self.SHAPES:
            _, emit = self._import(w, h)
            code = emit("A")
            self.assertIn("svcadd_s16", code, "%dx%d" % (w, h))
            self.assertIn("dynopt_satd_%dx%d_sve2" % (w, h), code)

    def test_invalid_cover_raises(self):
        _, emit = self._import(32, 64)
        with self.assertRaises(ValueError):
            emit("Z")


class TestCoversCostCoeff(unittest.TestCase):
    """cost-coeff-nxn covers (docs/82 #4 扩展)."""

    def test_meta(self):
        m = cc_meta()
        self.assertEqual(m["covers"], ["A", "B"])
        self.assertGreater(m["expected_permute_ratio"]["A"], 0.30)
        self.assertEqual(m["expected_permute_ratio"]["B"], 0.0)

    def test_emit_all(self):
        for c in ("A", "B"):
            code = emit_cc(c)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 100)

    def test_invalid_cover_raises(self):
        with self.assertRaises(ValueError):
            emit_cc("Z")


if __name__ == "__main__":
    unittest.main()
