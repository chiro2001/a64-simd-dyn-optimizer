"""M2-expanded corpus component tests (round-0024)."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "optimizer"))

from ago.covers_sa8d8 import all_covers as sa8d8_covers  # noqa: E402
from ago.covers_sa8d8 import emit_cover as emit_sa8d8  # noqa: E402
from ago.covers_satd8 import all_covers as satd8_covers  # noqa: E402
from ago.covers_satd8 import emit_cover as emit_satd8  # noqa: E402
from ago.covers_satd_shapes import all_shapes, emit_cover  # noqa: E402
from ago.manifest import CandidateManifest  # noqa: E402
from ago.predict import predict_from_features, predict_sve1  # noqa: E402


class TestCovers(unittest.TestCase):
    def test_satd8_covers_emit(self):
        for c in satd8_covers():
            src = emit_satd8(c, "dynopt_ago_satd8")
            self.assertIn("dynopt_ago_satd8", src)
            self.assertIn("vaddlvq_u16", src)

    def test_sa8d8_covers_emit(self):
        for c in sa8d8_covers():
            src = emit_sa8d8(c, "dynopt_ago_sa8d8")
            self.assertIn("dynopt_ago_sa8d8", src)
            self.assertIn("hadamard_8_v", src)

    def test_shape_covers_emit(self):
        for shape in all_shapes():
            for c in ("A", "B", "C"):
                src = emit_cover(shape, c)
                self.assertIn("extern \"C\" int", src)
                self.assertIn("hadamard_4_v", src)


class TestManifest(unittest.TestCase):
    def test_roundtrip(self):
        m = CandidateManifest(
            kernel="satd8", cover="A", contract_hash="abc",
            region="satd8/reduce",
            template_params={"tail": "upstream"},
            source_hash="s", object_hash="o", verify="20k bad=0")
        m2 = CandidateManifest.from_json(m.to_json())
        self.assertEqual(m, m2)


class TestPredict(unittest.TestCase):
    def test_from_features(self):
        table = {
            "empty": {"latency_cyc": 1.0, "throughput_cyc_per_op": 1.0},
            "add_u16": {"latency_cyc": 2.0, "throughput_cyc_per_op": 1.0},
            "ld1_u8": {"latency_cyc": None, "throughput_cyc_per_op": 0.5},
            "paddl_u16": {"latency_cyc": 4.0,
                          "throughput_cyc_per_op": 2.0},
        }
        meta = {
            "cp_chains": {"A": ["ld1_u8", "add_u16", "paddl_u16"]},
            "tail_ops": {"A": ["add_u16"]},
        }
        feats = {"insn_by_class": {"ld_vec": 8, "add": 4, "max": 2},
                 "spill_reload_heuristic": 0}
        p = predict_from_features(meta, "A", table, feats)
        # tput = 8*0.5 + 4*1 + 2*1 = 10; cp = 0.98(null->empty)+2+4 = 6.98
        self.assertAlmostEqual(p["tput_sum"], 10.0)
        self.assertAlmostEqual(p["cp_lat"], 1.0 + 2 + 4)
        self.assertAlmostEqual(p["predicted_cyc"], 10.0)

    def test_null_not_zero(self):
        table = {"empty": {"latency_cyc": 1.5,
                           "throughput_cyc_per_op": 1.0},
                 "x": {"latency_cyc": None,
                       "throughput_cyc_per_op": 2.0}}
        from ago.predict import _cost
        self.assertEqual(_cost(table, "x")["latency_cyc"], 1.5)

    def test_predict_sve1(self):
        table = {
            "empty": {"latency_cyc": 1.0, "throughput_cyc_per_op": 1.0},
            "add_s16": {"latency_cyc": 2.27,
                        "throughput_cyc_per_op": 0.50},
            "sub_s16": {"latency_cyc": 2.28,
                        "throughput_cyc_per_op": 0.50},
            "mul_s16": {"latency_cyc": 3.00,
                        "throughput_cyc_per_op": 1.00},
            "tbl_s16": {"latency_cyc": 3.00,
                        "throughput_cyc_per_op": 0.69},
            "uaddv_s32": {"latency_cyc": 13.02,
                          "throughput_cyc_per_op": 1.89},
            "ld1b_s8": {"latency_cyc": 24.03,
                        "throughput_cyc_per_op": 0.50},
        }
        feats = {"insn_by_class": {"ld_vec": 8, "add": 16, "tbl": 4,
                                   "mul": 8, "max": 2},
                 "spill_reload_heuristic": 0}
        cp = ["ld1b_s8", "sub_s16", "tbl_s16", "mul_s16", "add_s16",
              "uaddv_s32"]
        p = predict_sve1(cp, table, feats)
        # tput = 8*0.5 + 16*0.5 + 4*0.69 + 8*1.0 + 2*1.0 = 16.76
        self.assertAlmostEqual(p["tput_sum"], 8 * 0.5 + 16 * 0.5 +
                               4 * 0.69 + 8 * 1.0 + 2 * 1.0)
        # cp = 24.03(null-filled? ld1b has latency) + 2.27 + 3 + 3 + 2.27 + 13.02
        self.assertGreater(p["predicted_cyc"], 45.0)


if __name__ == "__main__":
    unittest.main()
