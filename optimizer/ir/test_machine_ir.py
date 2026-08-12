"""Unit tests for the MachineIR LLVM importer extensions (DCT8 op family)."""

import unittest

from optimizer.ir.machine_ir import import_llvm_ir_text


SEED_SNIPPET = """
; sample lines covering the DCT8 op set
@g = external constant [8 x [8 x i16]], align 2
define void @f(ptr %0, ptr %1, i64 %2) {
  %4 = load <4 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds i16, ptr %0, i64 %2
  %6 = load <4 x i16>, ptr %5, align 2
  %7 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @g, i64 16), align 2
  %8 = sext <4 x i16> %4 to <4 x i32>
  %9 = mul nsw i64 %2, 6
  %10 = shl <4 x i32> %8, splat (i32 6)
  %11 = mul nsw <4 x i32> %8, <i32 83, i32 36, i32 83, i32 36>
  %12 = call <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %4, <4 x i16> %6)
  %13 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %12, i32 9)
  store <4 x i16> %13, ptr %1, align 2
  ret void
}
"""


class TestDct8Import(unittest.TestCase):

    def test_imports_dct8_opset(self):
        ir = import_llvm_ir_text(SEED_SNIPPET)
        by_id = {n["id"]: n for n in ir.nodes}
        ops = [n["op"] for n in ir.nodes]
        self.assertIn("store", ops)
        self.assertIn("sext", ops)
        self.assertIn("mul", ops)
        store = next(n for n in ir.nodes if n["op"] == "store")
        self.assertEqual(store["src"], "13")
        self.assertEqual(store["ptr"], "1")
        rshrn = next(n for n in ir.nodes
                     if n["op"] == "intrinsic" and n["intrinsic"] == "rshrn")
        self.assertEqual(rshrn["args"][1], {"imm": 9})
        mulv = next(n for n in ir.nodes if n["op"] == "mul"
                    and "const_vec" in n)
        self.assertEqual(mulv["const_vec"], [83, 36, 83, 36])
        const_load = next(n for n in ir.nodes
                          if n["op"] == "load" and "const_name" in n)
        self.assertEqual(const_load["const_off"], 16)
        shl = next(n for n in ir.nodes if n["op"] == "shl"
                   and n["type"].startswith("<"))
        self.assertEqual(shl["amt"], 6)


if __name__ == "__main__":
    unittest.main()
