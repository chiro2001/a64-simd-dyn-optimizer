"""Unit tests for lane tracking over the dynamic asm-trace IR."""

import unittest

from optimizer.analysis.asm_linearize import lane_forms_asm
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


if __name__ == "__main__":
    unittest.main()
