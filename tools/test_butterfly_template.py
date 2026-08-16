#!/usr/bin/env python3
"""P4 butterfly-quarter template gate:
the template-generated dct16 fused-quarter pass1 (coefficient tables
from optimizer/ir/dct16_op_ir.py) must match the golden 8-lane
pure-SVE pass1 (kernels/dct16/candidates/best_ir_pure_sve.cpp) on
random inputs under QEMU VL=128.  This proves the template-driven
path reproduces the searched dct structure win (docs/70 P4 next
step)."""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer"))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from ago.templates.butterfly_quarter import (  # noqa: E402
    emit_quarter_pass, emit_quarter_pass32)
from dct32_constants import GT32  # noqa: E402
from dct16_op_ir import G16, T8E  # noqa: E402
from dct16_pure_sve_emit import emit_pure_sve  # noqa: E402
from dct32_pure_sve_emit import emit_pure_sve as emit_pure_sve32  # noqa: E402
from pure_sve_helpers import PURE_SVE_HELPERS  # noqa: E402


DRIVER = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_pass4(const int16_t*, int16_t*, intptr_t);
extern "C" void dbg_pass4(const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[16 * 16 + 8], a[256], b[256];
    long mism = 0;
    srand(0xB17E);
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < 16 * 16 + 8; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_pass4(src, a, 16);
        dbg_pass4(src, b, 16);
        for (int i = 0; i < 256; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""

DRIVER32 = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_pass4_32(const int16_t*, int16_t*, intptr_t);
extern "C" void dbg_pass4_32(const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[32 * 32 + 16], a[1024], b[1024];
    long mism = 0;
    srand(0xD32C);
    for (int it = 0; it < 80; it++)
    {
        for (int i = 0; i < 32 * 32 + 16; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_pass4_32(src, a, 32);
        dbg_pass4_32(src, b, 32);
        for (int i = 0; i < 1024; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""


class ButterflyTemplateGate(unittest.TestCase):

    def write(self, name, text):
        p = os.path.join(ROOT, "build", name)
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w") as f:
            f.write(text)
        return p

    def build(self, src, obj):
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+sve2", "-msve-vector-bits=128",
             "-o", obj, src], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

    def test_template_dct16_pass1_matches_golden(self):
        coefs = {"gt": G16,
                 "t8odd": [row[:4] + row[:4]
                           for row in (G16[2], G16[6], G16[10], G16[14])],
                 "t8e": T8E}
        src = emit_quarter_pass(n=16, coefs=coefs, fn="quarter_pass1")
        body = "\n".join(l for l in src.splitlines()
                         if not l.startswith("#include"))
        tpl = ("#include <arm_sve.h>\n#include <cstdint>\n\n"
               + PURE_SVE_HELPERS + "\n" + body +
               '\nextern "C" void tpl_pass4(const int16_t* s, '
               "int16_t* d, intptr_t st) { quarter_pass1(s, d, st); }\n")
        tpl_src = self.write("tmp-tpl-dct16.cpp", tpl)
        tpl_obj = os.path.join(ROOT, "build", "tmp-tpl-dct16.o")
        self.build(tpl_src, tpl_obj)

        pure = emit_pure_sve("x").replace(
            "    if (svcntb() != 16) return;\n", "")
        pure += ('\nextern "C" void dbg_pass4(const int16_t* s, '
                 "int16_t* d, intptr_t st) { op_pass_4(s, d, st); }\n")
        ref_src = self.write("tmp-tpl-ref.cpp", pure)
        ref_obj = os.path.join(ROOT, "build", "tmp-tpl-ref.o")
        self.build(ref_src, ref_obj)

        drv = self.write("tmp-tpl-driver.cpp", DRIVER)
        binp = os.path.join(ROOT, "build", "tmp-tpl-driver")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-o", binp, drv,
             tpl_obj, ref_obj], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        run = subprocess.run(
            [qemu, "-L", "/usr/aarch64-linux-gnu",
             "-cpu", "max,sve-max-vq=1", binp],
            capture_output=True, text=True)
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout)

    def test_template_emits_families(self):
        src = emit_quarter_pass(n=16)
        for marker in ("GT[", "T8ODD[", "T8E[", "psv_sdot",
                       "psv_rshrn_s32<shift>", "psv_store4_s16"):
            self.assertIn(marker, src)

    def test_template_dct32_pass1_matches_golden(self):
        coefs = {"gt32a": [GT32[k][:8] for k in range(32)],
                 "gt32b": [GT32[k][8:16] for k in range(32)],
                 "k4": [GT32[k][:4] for k in range(4, 32, 8)],
                 "t8e": T8E}
        src = emit_quarter_pass32(coefs=coefs,
                                  fn="quarter_pass1_32")
        body = "\n".join(l for l in src.splitlines()
                         if not l.startswith("#include"))
        tpl = ("#include <arm_sve.h>\n#include <cstdint>\n\n"
               + PURE_SVE_HELPERS + "\n" + body +
               '\nextern "C" void tpl_pass4_32(const int16_t* s, '
               "int16_t* d, intptr_t st) { quarter_pass1_32(s, d, st); }\n")
        tpl_src = self.write("tmp-tpl-dct32.cpp", tpl)
        tpl_obj = os.path.join(ROOT, "build", "tmp-tpl-dct32.o")
        self.build(tpl_src, tpl_obj)

        pure = emit_pure_sve32("x").replace(
            "    if (svcntb() != 16) return;\n", "")
        pure += ('\nextern "C" void dbg_pass4_32(const int16_t* s, '
                 "int16_t* d, intptr_t st) { op_pass_4(s, d, st); }\n")
        ref_src = self.write("tmp-tpl-ref32.cpp", pure)
        ref_obj = os.path.join(ROOT, "build", "tmp-tpl-ref32.o")
        self.build(ref_src, ref_obj)

        drv = self.write("tmp-tpl-driver32.cpp", DRIVER32)
        binp = os.path.join(ROOT, "build", "tmp-tpl-driver32")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-o", binp, drv,
             tpl_obj, ref_obj], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        run = subprocess.run(
            [qemu, "-L", "/usr/aarch64-linux-gnu",
             "-cpu", "max,sve-max-vq=1", binp],
            capture_output=True, text=True)
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout)


if __name__ == "__main__":
    unittest.main()
