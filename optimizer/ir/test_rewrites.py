"""Unit tests for typed semantic rewrites."""

import unittest
import json
import os

from optimizer.ir.machine_ir import MachineIR
from optimizer.ir.rewrites import widen_dct8_pass2_odd
from optimizer.ir.rewrites import widen_overflows
from optimizer.ir.rewrites import mul64_to_shift
from optimizer.ir.rewrites import wide_loads
from optimizer.ir.rewrites import tree_to_mla


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

    def test_mul64_to_shift(self):
        ir = MachineIR(nodes=[
            {"id": 0, "op": "mul", "type": "<4 x i32>", "src": ["a"],
             "const_vec": [64, 64, 64, 64], "dst": "b"},
            {"id": 1, "op": "mul", "type": "<4 x i32>", "src": ["c"],
             "const_vec": [83, 36, 83, 36], "dst": "d"},
        ])
        mul64_to_shift(ir)
        self.assertEqual(ir.nodes[0]["op"], "shl")
        self.assertEqual(ir.nodes[0]["amt"], 6)
        self.assertEqual(ir.nodes[1]["op"], "mul")


class TestWideLoads(unittest.TestCase):

    def test_fuses_adjacent_loads_and_rewires_users(self):
        ir = MachineIR(nodes=[
            {"id": 0, "op": "load", "type": "<4 x i16>", "ptr": "0",
             "dst": "4"},
            {"id": 1, "op": "addr", "type": "ptr", "dst": "5",
             "rhs": "getelementptr inbounds nuw i8, ptr %0, i64 8"},
            {"id": 2, "op": "load", "type": "<4 x i16>", "ptr": "5",
             "dst": "6"},
            {"id": 3, "op": "sub", "type": "<4 x i16>",
             "src": ["4", "6"], "dst": "O"},
        ])
        wide_loads(ir)
        bydst = {n.get("dst"): n for n in ir.nodes}
        self.assertEqual(sum(1 for n in ir.nodes if n["op"] == "load"), 1)
        self.assertEqual(sum(1 for n in ir.nodes if n["op"] == "half"), 2)
        self.assertEqual(bydst["O"]["src"], ["wide_0_lo", "wide_0_hi"])
        self.assertEqual(bydst["wide_0"]["type"], "<8 x i16>")

    def test_leaves_shared_addr_alone(self):
        ir = MachineIR(nodes=[
            {"id": 0, "op": "load", "type": "<4 x i16>", "ptr": "0",
             "dst": "4"},
            {"id": 1, "op": "addr", "type": "ptr", "dst": "5",
             "rhs": "getelementptr inbounds nuw i8, ptr %0, i64 8"},
            {"id": 2, "op": "load", "type": "<4 x i16>", "ptr": "5",
             "dst": "6"},
            {"id": 3, "op": "load", "type": "<4 x i16>", "ptr": "5",
             "dst": "7"},
        ])
        before = [dict(n) for n in ir.nodes]
        wide_loads(ir)
        self.assertEqual(ir.nodes, before)


class TestTreeToMla(unittest.TestCase):

    def _seed(self):
        seed = os.path.join(
            os.path.dirname(__file__), "..", "..", "experiments",
            "m12-dct8", "imported", "machine-ir.json")
        doc = json.load(open(seed))
        return MachineIR(function=doc.get("function"),
                         nodes=[dict(n) for n in doc["nodes"]])

    def test_noop_without_widen(self):
        ir = self._seed()
        before = ir.to_dict()
        tree_to_mla(ir)
        self.assertEqual(ir.to_dict(), before)

    def test_rewrites_widened_odd_trees_on_seed(self):
        ir = self._seed()
        widen_overflows(ir)
        tree_to_mla(ir)
        mla = [n for n in ir.nodes if n["op"] == "mla"]
        self.assertEqual(len(mla), 24)          # 2 row groups x 4 cols x 3
        chain_muls = [n for n in ir.nodes if n["op"] == "mul"
                      and n["dst"].startswith("mla_")]
        self.assertEqual(len(chain_muls), 8)    # 2 groups x 4 columns
        trn = [n for n in ir.nodes if n["op"] == "shuffle"
               and tuple(n["mask"]) in ((0, 4, 2, 6), (1, 5, 3, 7))]
        self.assertEqual(len(trn), 8)           # 2 groups x 4 trn ops
        # the pass-1 smull trees must survive untouched
        self.assertEqual(sum(1 for n in ir.nodes
                             if n.get("intrinsic") == "smull"), 32)

    def test_seed_codegen_after_structural_rewrites(self):
        from optimizer.ir.codegen import emit_dct8_c_intrinsics

        ir = self._seed()
        widen_overflows(ir)
        wide_loads(ir)
        tree_to_mla(ir)
        text = emit_dct8_c_intrinsics(ir)
        self.assertIn("vmlaq_n_s32", text)
        self.assertIn("vget_high_s16", text)


if __name__ == "__main__":
    unittest.main()
