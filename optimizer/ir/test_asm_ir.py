"""Unit tests for the assembly-trace importer."""

import unittest

from optimizer.ir.asm_ir import dynamic_counts, import_asm_trace, \
    resolve_tbl_masks


class TestAsmIR(unittest.TestCase):

    def test_register_view_aliasing(self):
        lines = [
            "0x1000 ldr q26, [x0]",
            "0x1004 tbl v23.16b, {v23.16b}, v26.16b",
        ]
        nodes, vec, _ = import_asm_trace(lines)
        tbl = vec[1]
        self.assertEqual(tbl["read_regs"], ["v23", "v26"])
        self.assertEqual(len(tbl["reads"]), 1)   # only the index resolves
        self.assertEqual(nodes[tbl["reads"][0]]["mn"], "ldr")

    def test_dynamic_counts_metric(self):
        lines = [
            "0x1000 ldr q0, [x0]",
            "0x1004 ldr w1, [x1]",
            "0x1008 mul v2.4s, v0.4s, v1.4s",
            "0x100c add v3.4s, v2.4s, v2.4s",
            "0x1010 str q3, [x2]",
        ]
        nodes, vec, _ = import_asm_trace(lines)
        c = dynamic_counts(nodes)
        self.assertEqual(c["load"], 2)       # vector + scalar load
        self.assertEqual(c["simd"], 2)       # mul + add
        self.assertEqual(c["simd_load"], 4)
        self.assertEqual(len(vec), 4)   # ldr/mul/add/str all vector

    def test_resolve_tbl_mask_from_rodata(self):
        lines = [
            "0x1000 adrp x11, #0x457000",
            "0x1004 ldr q26, [x11, #0x30]",
            "0x1008 tbl v23.16b, {v23.16b}, v26.16b",
        ]
        nodes, vec, last_writer = import_asm_trace(lines)
        rodata = {0x457030: bytes(range(15, -1, -1))}
        resolve_tbl_masks(nodes, rodata, last_writer)
        tbl = vec[-1]
        self.assertEqual(tbl["mask"], list(range(15, -1, -1)))

    def test_resolve_tbl_mask_through_add_chain(self):
        lines = [
            "0x1000 adrp x11, #0x457000",
            "0x1004 add x3, x11, #0x30",
            "0x1008 ldp q27, q23, [x3, #0x10]",
            "0x100c tbl v31.16b, {v31.16b}, v27.16b",
        ]
        nodes, vec, last_writer = import_asm_trace(lines)
        rodata = {0x457040: bytes(range(16))}
        resolve_tbl_masks(nodes, rodata, last_writer)
        tbl = vec[-1]
        self.assertEqual(tbl["mask"], list(range(16)))


if __name__ == "__main__":
    unittest.main()
