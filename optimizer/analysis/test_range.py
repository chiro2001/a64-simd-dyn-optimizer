"""Unit tests for the value-range overflow scan."""

import unittest
import json
import os

from optimizer.analysis.range import ValueRange, analyze
from optimizer.ir.machine_ir import MachineIR


def ir_of(nodes):
    for i, n in enumerate(nodes):
        n["id"] = i
    return MachineIR(nodes=nodes)


class TestRange(unittest.TestCase):

    def test_narrow_sub_ok(self):
        ir = ir_of([
            {"op": "load", "type": "<4 x i16>", "ptr": "0", "dst": "a"},
            {"op": "load", "type": "<4 x i16>", "ptr": "1", "dst": "b"},
            {"op": "sub", "type": "<4 x i16>", "src": ["a", "b"],
             "dst": "c"},
        ])
        ranges, risks = analyze(ir, input_range=(-255, 255))
        self.assertEqual(ranges["c"].lo, -510)
        self.assertEqual(ranges["c"].hi, 510)
        self.assertEqual(risks, [])

    def test_wide_sub_flagged(self):
        ir = ir_of([
            {"op": "load", "type": "<4 x i16>", "ptr": "0", "dst": "a"},
            {"op": "load", "type": "<4 x i16>", "ptr": "1", "dst": "b"},
            {"op": "sub", "type": "<4 x i16>", "src": ["a", "b"],
             "dst": "c"},
        ])
        ranges, risks = analyze(ir, input_range=(-32640, 32640))
        self.assertEqual(len(risks), 1)
        self.assertEqual(risks[0]["range"], [-65280, 65280])

    def test_rshrn_narrowing(self):
        ir = ir_of([
            {"op": "load", "type": "<4 x i32>", "ptr": "0", "dst": "a"},
            {"op": "intrinsic", "intrinsic": "rshrn",
             "args": [{"ref": "a"}, {"imm": 9}], "dst": "b"},
        ])
        ranges, risks = analyze(ir, input_range=(-16711680, 16711680))
        self.assertAlmostEqual(ranges["b"].lo, -32640)
        self.assertAlmostEqual(ranges["b"].hi, 32640)

    def test_dct8_seed_flags_pass2_o_subs(self):
        seed = os.path.join(
            os.path.dirname(__file__), "..", "..", "experiments",
            "m12-dct8", "imported", "machine-ir.json")
        if not os.path.exists(seed):
            self.skipTest("dct8 seed not present")
        doc = json.load(open(seed))
        ir = MachineIR(function=doc.get("function"), nodes=doc["nodes"])
        g_t8 = [
            64, 64, 64, 64, 64, 64, 64, 64,
            89, 75, 50, 18, -18, -50, -75, -89,
            83, 36, -36, -83, -83, -36, 36, 83,
            75, -18, -89, -50, 50, 89, 18, -75,
            64, -64, -64, 64, 64, -64, -64, 64,
            50, -89, 18, 75, -75, -18, 89, -50,
            36, -83, 83, -36, -36, 83, -83, 36,
            18, -50, 75, -89, 89, -75, 50, -18,
        ]
        ranges, risks = analyze(
            ir, constants={"@_ZN4x2654g_t8E": g_t8})
        subs = [r for r in risks if r["op"] == "sub"]
        self.assertEqual(sorted(r["id"] for r in subs),
                         [203, 204, 218, 219, 233, 234, 248, 249])
        self.assertIn([-65280, 65280], [r["range"] for r in subs])


if __name__ == "__main__":
    unittest.main()
