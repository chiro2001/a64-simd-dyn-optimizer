"""Unit tests for typed semantic rewrites."""

import unittest
import json
import os

from optimizer.ir.machine_ir import MachineIR
from optimizer.ir.rewrites import widen_dct8_pass2_odd
from optimizer.ir.rewrites import widen_overflows


def make_ir():
    # pass1 coef values: cA = rshrn(x,2), cB = rshrn(y,2) (s16)
    # pass2 O = sub<s16>(cA, rev64(cB)) -> wraps upstream
    # odd  = smull<s16>(coef_load, O)
    nodes = [
        {"op": "intrinsic", "intrinsic": "rshrn",
         "args": [{"ref": "x"}, {"imm": 2}], "src": ["x"], "dst": "cA"},
        {"op": "intrinsic", "intrinsic": "rshrn",
         "args": [{"ref": "y"}, {"imm": 2}], "src": ["y"], "dst": "cB"},
        {"op": "shuffle", "type": "<4 x i16>", "src": ["cB"],
         "mask": [3, 2, 1, 0], "dst": "cBr"},
        {"op": "load", "type": "<4 x i16>", "ptr": "0", "dst": "coef"},
        {"op": "sub", "type": "<4 x i16>", "src": ["cA", "cBr"], "dst": "O"},
        {"op": "intrinsic", "intrinsic": "smull",
         "args": [{"ref": "coef"}, {"ref": "O"}], "src": ["coef", "O"],
         "dst": "odd"},
    ]
    for i, n in enumerate(nodes):
        n["id"] = i
    return MachineIR(nodes=nodes)


class TestWidenDct8Pass2Odd(unittest.TestCase):

    def test_widens_pass2_odd(self):
        ir = widen_dct8_pass2_odd(make_ir())
        bydst = {n.get("dst"): n for n in ir.nodes}
        self.assertEqual(bydst["O"]["type"], "<4 x i32>")
        self.assertEqual(bydst["odd"]["op"], "mul")
        self.assertEqual(bydst["odd"]["type"], "<4 x i32>")
        # coefficient got widened too
        wc = bydst["odd"]["src"][0]
        self.assertEqual(bydst[wc]["op"], "sext")
        # the safe pass1-style sub (load-based) must be left untouched

    def test_ignores_pass1_sub(self):
        ir = MachineIR(nodes=[
            {"id": 0, "op": "load", "type": "<4 x i16>", "ptr": "0",
             "dst": "s0"},
            {"id": 1, "op": "shuffle", "type": "<4 x i16>", "src": ["s1"],
             "mask": [3, 2, 1, 0], "dst": "s1r"},
            {"id": 2, "op": "sub", "type": "<4 x i16>",
             "src": ["s0", "s1r"], "dst": "O1"},
        ])
        out = widen_dct8_pass2_odd(ir)
        self.assertEqual(len(out.nodes), 3)
        self.assertEqual(out.nodes[2]["op"], "sub")
        self.assertEqual(out.nodes[2]["type"], "<4 x i16>")

    def test_range_driven_matches_pattern_on_seed(self):
        seed = os.path.join(
            os.path.dirname(__file__), "..", "..", "experiments",
            "m12-dct8", "imported", "machine-ir.json")
        if not os.path.exists(seed):
            self.skipTest("dct8 seed not present")
        doc = json.load(open(seed))
        a = MachineIR(function=doc.get("function"),
                      nodes=[dict(n) for n in doc["nodes"]])
        b = MachineIR(function=doc.get("function"),
                      nodes=[dict(n) for n in doc["nodes"]])
        widen_dct8_pass2_odd(a)
        widen_overflows(b)
        self.assertEqual(a.to_dict()["nodes"], b.to_dict()["nodes"])


if __name__ == "__main__":
    unittest.main()
