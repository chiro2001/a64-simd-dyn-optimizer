"""Unit tests for lane-tracking linearization and the constant fold."""

import unittest

from optimizer.analysis.linearize import fold_shuffles_into_constants, \
    lane_forms
from optimizer.ir.machine_ir import MachineIR


class TestLinearize(unittest.TestCase):

    def test_shuffle_tracks_lane_permutation(self):
        ir = MachineIR(function=None, nodes=[
            {"op": "load", "type": "<4 x i32>", "dst": "a", "id": 0,
             "ptr": "0"},
            {"op": "shuffle", "type": "<4 x i32>", "mask": [3, 2, 1, 0],
             "src": ["a"], "dst": "p", "id": 1},
            {"op": "mul", "type": "<4 x i32>", "src": ["p"], "dst": "m",
             "const_vec": [1, 2, 3, 4], "id": 2},
        ])
        forms, symbolic = lane_forms(ir)
        m = forms["m"]
        # lane i of m = a[3-i] * const[i]
        self.assertEqual(sorted(k[1] for k in m[0]), [3])
        self.assertAlmostEqual(m[0][("a", 3)], 1.0)
        self.assertAlmostEqual(m[3][("a", 0)], 4.0)

    def test_fold_replaces_sparse_dot(self):
        # out = 1*a + 2*a elementwise: the two muls fold into one mul by
        # [3,3,3,3] on the raw leaf, deleting the intermediate add.
        ir = MachineIR(function=None, nodes=[
            {"op": "load", "type": "<4 x i32>", "dst": "a", "id": 0,
             "ptr": "0"},
            {"op": "shuffle", "type": "<4 x i32>", "mask": [0, 1, 2, 3],
             "src": ["a"], "dst": "p", "id": 1},
            {"op": "mul", "type": "<4 x i32>", "src": ["a"], "dst": "m1",
             "const_vec": [1, 1, 1, 1], "id": 2},
            {"op": "mul", "type": "<4 x i32>", "src": ["p"], "dst": "m2",
             "const_vec": [2, 2, 2, 2], "id": 3},
            {"op": "add", "type": "<4 x i32>", "src": ["m1", "m2"],
             "dst": "s", "id": 4},
            {"op": "intrinsic", "intrinsic": "rshrn", "src": ["s"],
             "dst": "out", "args": [{"ref": "s"}, {"imm": 9}], "id": 5},
            {"op": "store", "src": "out", "ptr": "1", "id": 6},
        ])
        fold_shuffles_into_constants(ir, max_terms=8)
        # the store now reads a rewritten linear output, whose muls cover
        # the raw leaf 'a' with the folded constants
        new = [n for n in ir.nodes
               if str(n.get("dst") or "").startswith("lin_")]
        muls = [n for n in new if n["op"] == "mul"]
        consts = sorted(tuple(n["const_vec"]) for n in muls)
        self.assertEqual(consts, [(3, 3, 3, 3)])

    def test_fold_skips_permuted_shapes(self):
        # a lane permutation (rev) makes the shape matrix-vector, which this
        # elementwise fold must NOT rewrite.
        ir = MachineIR(function=None, nodes=[
            {"op": "load", "type": "<4 x i32>", "dst": "a", "id": 0,
             "ptr": "0"},
            {"op": "shuffle", "type": "<4 x i32>", "mask": [3, 2, 1, 0],
             "src": ["a"], "dst": "p", "id": 1},
            {"op": "mul", "type": "<4 x i32>", "src": ["p"], "dst": "m",
             "const_vec": [2, 2, 2, 2], "id": 2},
            {"op": "intrinsic", "intrinsic": "rshrn", "src": ["m"],
             "dst": "out", "args": [{"ref": "m"}, {"imm": 9}], "id": 3},
            {"op": "store", "src": "out", "ptr": "1", "id": 4},
        ])
        fold_shuffles_into_constants(ir, max_terms=8)
        new = [n for n in ir.nodes
               if str(n.get("dst") or "").startswith("lin_")]
        self.assertEqual(new, [])


if __name__ == "__main__":
    unittest.main()
