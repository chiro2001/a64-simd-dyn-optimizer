"""Unit tests for lane tracking over the dynamic asm-trace IR."""

import unittest

from optimizer.analysis.asm_linearize import lane_forms_asm, \
    dead_code_after_rewrite, shared_constant_matrix_outputs
from optimizer.ir.asm_ir import import_asm_trace, resolve_tbl_masks


class TestAsmLinearize(unittest.TestCase):

    def test_rev64_permutes_lanes(self):
        lines = [
            "0x1000 ld1 v23.8h, [x0]",
            "0x1004 rev64 v30.8h, v23.8h",
        ]
        nodes, vec, lw = import_asm_trace(lines)
        forms = lane_forms_asm(nodes)
        rev = vec[-1]
        self.assertEqual(forms[rev["id"]][0], forms[nodes[0]["id"]][3])

    def test_addp_reduces_pairwise(self):
        lines = [
            "0x1000 ld1 v0.4s, [x0]",
            "0x1004 ld1 v1.4s, [x1]",
            "0x1008 addp v2.4s, v0.4s, v1.4s",
        ]
        nodes, vec, lw = import_asm_trace(lines)
        forms = lane_forms_asm(nodes)
        addp = vec[-1]
        self.assertEqual(len(forms[addp["id"]]), 4)
        # output lane 0 = input lane 0 + input lane 1
        self.assertEqual(len(forms[addp["id"]][0]), 2)

    def test_tbl_resolved_mask_permutes(self):
        lines = [
            "0x1000 adrp x11, #0x457000",
            "0x1004 ldr q26, [x11, #0x30]",
            "0x1008 ld1 v23.8h, [x0]",
            "0x100c tbl v24.16b, {v23.16b}, v26.16b",
        ]
        nodes, vec, lw = import_asm_trace(lines)
        rodata = {0x457030: bytes([14, 15, 12, 13, 10, 11, 8, 9,
                                   6, 7, 4, 5, 2, 3, 0, 1])}
        resolve_tbl_masks(nodes, rodata, lw)
        forms = lane_forms_asm(nodes)
        tbl = vec[-1]
        # rev16: lane 0 <- lane 7
        self.assertEqual(forms[tbl["id"]][0], forms[nodes[2]["id"]][7])

    def test_detects_shared_constant_matrix(self):
        C = [90.0, 87.0, 80.0, 70.0, 57.0, 43.0, 25.0, 9.0]
        leaves = ["a", "b", "c", "d"]
        forms = {7: [
            {(leaf, j): C[j] for j in range(8)} for leaf in leaves
        ]}
        nodes = [{"id": 7, "mn": "rshrn", "ops": "v7.4h, v6.4s, #3"}]
        hits = shared_constant_matrix_outputs(nodes, forms)
        self.assertEqual(len(hits), 1)
        self.assertEqual(hits[0]["consts"], [C])
        self.assertEqual(sorted(l for lane in hits[0]["leaves"]
                                for l, _ in lane), sorted(leaves))

    def test_dead_code_after_rewrite(self):
        nodes = [
            {"id": 0, "mn": "ldr", "ops": "q0, [x0]", "dst": ["v0"],
             "reads": [], "read_regs": [], "read_ids": [], "prev": {},
             "is_vector": True},
            {"id": 1, "mn": "smull2", "ops": "v1.4s, v0.8h, v0.8h",
             "dst": ["v1"], "reads": [0], "read_regs": ["v0"],
             "read_ids": [0], "prev": {}, "is_vector": True},
            {"id": 2, "mn": "rshrn", "ops": "v2.4h, v1.4s, #3",
             "dst": ["v2"], "reads": [1], "read_regs": ["v1"],
             "read_ids": [1], "prev": {}, "is_vector": True},
            {"id": 3, "mn": "str", "ops": "q2, [x1]", "dst": [],
             "reads": [2], "read_regs": ["v2"], "read_ids": [2],
             "prev": {}, "is_vector": True},
        ]
        hits = [{"node_id": 2, "leaves": [[(0, 0)]]}]
        forms = {2: [{(0, 0): 1.0}]}
        dead_vec, dead_total, live = dead_code_after_rewrite(
            nodes, hits, forms)
        # the smull2 chain dies; the load and store survive
        self.assertEqual(dead_vec, 1)


if __name__ == "__main__":
    unittest.main()
