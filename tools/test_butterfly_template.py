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
    _NEON_HEADER, coef_c_arrays, emit_quarter_pass, emit_quarter_pass2_16,
    emit_quarter_pass2_32, emit_quarter_pass32,
    emit_quarter_pass2_neon16, emit_quarter_pass2_neon32,
    emit_quarter_pass32_neon)
from dct32_constants import GT32  # noqa: E402
from dct16_op_ir import G16, GT16_S32, T8E  # noqa: E402
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

DRIVER_FULL = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_dct16(const int16_t*, int16_t*, intptr_t);
extern "C" void dynopt_dct16_sve8_anyvl(
    const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[16 * 16 + 8], a[256], b[256];
    long mism = 0;
    srand(0xF111);
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < 16 * 16 + 8; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_dct16(src, a, 16);
        dynopt_dct16_sve8_anyvl(src, b, 16);
        for (int i = 0; i < 256; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""

DRIVER_FULL32 = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_dct32(const int16_t*, int16_t*, intptr_t);
extern "C" void dynopt_dct32_sve8_anyvl(
    const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[32 * 32 + 16], a[1024], b[1024];
    long mism = 0;
    srand(0xF322);
    for (int it = 0; it < 80; it++)
    {
        for (int i = 0; i < 32 * 32 + 16; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_dct32(src, a, 32);
        dynopt_dct32_sve8_anyvl(src, b, 32);
        for (int i = 0; i < 1024; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""

DRIVER_NEON = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_pass4_neon(const int16_t*, int16_t*, intptr_t);
extern "C" void dbg_pass4_neon(const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[16 * 16 + 8], a[256], b[256];
    long mism = 0;
    srand(0x4E0F);
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < 16 * 16 + 8; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_pass4_neon(src, a, 16);
        dbg_pass4_neon(src, b, 16);
        for (int i = 0; i < 256; i++)
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

    def _full_gate(self, name, n, tpl_src, arrays, wrapper, driver_src,
                   ref_sym, n_out, iters, seed_src):
        body = "\n".join(l for l in tpl_src.splitlines()
                         if not l.startswith("#include"))
        src = ("#include <arm_sve.h>\n#include <cstdint>\n\n"
               + PURE_SVE_HELPERS + "\n" + arrays + "\n" + body
               + "\n" + wrapper)
        tpl_s = self.write("tmp-tpl-%s.cpp" % name, src)
        tpl_o = os.path.join(ROOT, "build", "tmp-tpl-%s.o" % name)
        self.build(tpl_s, tpl_o)
        pure = seed_src.replace("    if (svcntb() != 16) return;\n", "")
        ref_s = self.write("tmp-tpl-%s-ref.cpp" % name, pure)
        ref_o = os.path.join(ROOT, "build", "tmp-tpl-%s-ref.o" % name)
        self.build(ref_s, ref_o)
        drv = self.write("tmp-tpl-%s-driver.cpp" % name, driver_src)
        binp = os.path.join(ROOT, "build", "tmp-tpl-%s-driver" % name)
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-o", binp, drv,
             tpl_o, ref_o], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        run = subprocess.run(
            [qemu, "-L", "/usr/aarch64-linux-gnu",
             "-cpu", "max,sve-max-vq=1", binp],
            capture_output=True, text=True)
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout)

    def test_template_full_dct16_matches_golden(self):
        p1 = emit_quarter_pass(n=16, coefs={
            "gt": G16,
            "t8odd": [row[:4] + row[:4]
                      for row in (G16[2], G16[6], G16[10], G16[14])],
            "t8e": T8E}, fn="quarter_pass1", include_coefs=False)
        p2 = emit_quarter_pass2_16(coefs={
            "gt": G16, "gt16s32": GT16_S32, "t8e": T8E},
            include_coefs=False)
        wrapper = ('extern "C" void tpl_dct16(const int16_t* s, '
                   "int16_t* d, intptr_t st)\n{\n"
                   "    int16_t coef[256];\n"
                   "    quarter_pass1(s, coef, st);\n"
                   "    quarter_pass2_16(coef, d);\n}\n")
        arrays = coef_c_arrays({
            "gt": G16,
            "t8odd": [row[:4] + row[:4]
                      for row in (G16[2], G16[6], G16[10], G16[14])],
            "gt16s32": GT16_S32, "t8e": T8E})
        self._full_gate("full16", 16, p1 + "\n" + p2, arrays, wrapper,
                        DRIVER_FULL, "dynopt_dct16_sve8_anyvl",
                        256, 200,
                        emit_pure_sve("dynopt_dct16_sve8_anyvl"))

    def test_template_full_dct32_matches_golden(self):
        p1 = emit_quarter_pass32(coefs={
            "gt32a": [GT32[k][:8] for k in range(32)],
            "gt32b": [GT32[k][8:16] for k in range(32)],
            "k4": [GT32[k][:4] for k in range(4, 32, 8)],
            "t8e": T8E}, fn="quarter_pass1_32", include_coefs=False)
        p2 = emit_quarter_pass2_32(coefs={
            "gt32a": [GT32[k][:8] for k in range(32)],
            "gt32b": [GT32[k][8:16] for k in range(32)],
            "gt32s32a": [GT32[k][:4] for k in range(2, 32, 4)],
            "gt32s32b": [GT32[k][4:8] for k in range(2, 32, 4)],
            "k4": [GT32[k][:4] for k in range(4, 32, 8)],
            "t8e": T8E}, include_coefs=False)
        wrapper = ('extern "C" void tpl_dct32(const int16_t* s, '
                   "int16_t* d, intptr_t st)\n{\n"
                   "    int16_t coef[1024];\n"
                   "    quarter_pass1_32(s, coef, st);\n"
                   "    quarter_pass2_32(coef, d);\n}\n")
        arrays = coef_c_arrays({
            "gt32a": [GT32[k][:8] for k in range(32)],
            "gt32b": [GT32[k][8:16] for k in range(32)],
            "gt32s32a": [GT32[k][:4] for k in range(2, 32, 4)],
            "gt32s32b": [GT32[k][4:8] for k in range(2, 32, 4)],
            "k4": [GT32[k][:4] for k in range(4, 32, 8)],
            "t8e": T8E})
        self._full_gate("full32", 32, p1 + "\n" + p2, arrays, wrapper,
                        DRIVER_FULL32, "dynopt_dct32_sve8_anyvl",
                        1024, 80,
                        emit_pure_sve32("dynopt_dct32_sve8_anyvl"))

    def test_template_neon_pass1_matches_golden(self):
        coefs = {"gt": G16,
                 "t8odd": [row[:4] + row[:4]
                           for row in (G16[2], G16[6], G16[10], G16[14])],
                 "t8e": T8E}
        src = emit_quarter_pass(n=16, coefs=coefs, target="neon",
                                fn="quarter_pass1_neon")
        body = "\n".join(l for l in src.splitlines()
                         if not l.startswith("#include"))
        tpl = ("#include <arm_neon.h>\n#include <cstdint>\n\n"
               + body +
               '\nextern "C" void tpl_pass4_neon(const int16_t* s, '
               "int16_t* d, intptr_t st) { quarter_pass1_neon(s, d, st); }\n")
        tpl_src = self.write("tmp-tpl-neon.cpp", tpl)
        tpl_obj = os.path.join(ROOT, "build", "tmp-tpl-neon.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", tpl_obj, tpl_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        with open(os.path.join(
                ROOT, "kernels", "dct16", "candidates",
                "best_neon_vl128.cpp")) as f:
            golden = f.read()
        golden += ('\nextern "C" void dbg_pass4_neon(const int16_t* s, '
                   "int16_t* d, intptr_t st) "
                   "{ pass1Butterfly16_sve(s, d, st); }\n")
        ref_src = self.write("tmp-tpl-neon-ref.cpp", golden)
        ref_obj = os.path.join(ROOT, "build", "tmp-tpl-neon-ref.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", ref_obj, ref_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        drv = self.write("tmp-tpl-neon-driver.cpp", DRIVER_NEON)
        binp = os.path.join(ROOT, "build", "tmp-tpl-neon-driver")
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

    def test_template_neon_full_dct16_matches_golden(self):
        coefs = {"gt": G16,
                 "t8odd": [row[:4] + row[:4]
                           for row in (G16[2], G16[6], G16[10], G16[14])],
                 "gt16s16": [row[:4] for row in (G16[2], G16[6], G16[10],
                                                  G16[14])],
                 "t8e": T8E}
        p1 = emit_quarter_pass(n=16, coefs=coefs, target="neon",
                               fn="quarter_pass1_neon",
                               include_coefs=False)
        p2 = emit_quarter_pass2_neon16(coefs=coefs, include_coefs=False,
                                       include_header=False)
        # drop the duplicate dq_rev helper block from pass1 (pass2
        # provides it via _NEON_HEADER)
        p1_body = []
        skip = False
        for l in p1.splitlines():
            if "DQ_REV16_TBL" in l:
                skip = True
            if skip and l.startswith("static inline void quarter_pass1_neon"):
                skip = False
            if not skip:
                p1_body.append(l)
        body = "\n".join(p1_body + p2.splitlines())
        body = "\n".join(l for l in body.splitlines()
                         if not l.startswith("#include"))
        arrays = coef_c_arrays(coefs)
        tpl = ("#include <arm_neon.h>\n#include <cstdint>\n\n"
               + arrays + "\n" + _NEON_HEADER + "\n" + body +
               '\nextern "C" void tpl_dct16_neon(const int16_t* s, '
               "int16_t* d, intptr_t st)\n{\n"
               "    int16_t coef[256];\n"
               "    quarter_pass1_neon(s, coef, st);\n"
               "    quarter_pass2_neon16(coef, d);\n}\n")
        tpl_src = self.write("tmp-tpl-neon-full.cpp", tpl)
        tpl_obj = os.path.join(ROOT, "build", "tmp-tpl-neon-full.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", tpl_obj, tpl_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        with open(os.path.join(
                ROOT, "kernels", "dct16", "candidates",
                "best_neon_vl128.cpp")) as f:
            golden = f.read()
        ref_src = self.write("tmp-tpl-neon-full-ref.cpp", golden)
        ref_obj = os.path.join(ROOT, "build", "tmp-tpl-neon-full-ref.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", ref_obj, ref_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        drv = self.write("tmp-tpl-neon-full-driver.cpp", r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_dct16_neon(const int16_t*, int16_t*, intptr_t);
extern "C" void dynopt_dct16_sve2_shared(
    const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[16 * 16 + 8], a[256], b[256];
    long mism = 0;
    srand(0x5EED);
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < 16 * 16 + 8; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_dct16_neon(src, a, 16);
        dynopt_dct16_sve2_shared(src, b, 16);
        for (int i = 0; i < 256; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
""")
        binp = os.path.join(ROOT, "build", "tmp-tpl-neon-full-driver")
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

    def test_template_neon_dct32_pass1_matches_golden(self):
        coefs = {"gt32a": [GT32[k][:8] for k in range(32)],
                 "gt32b": [GT32[k][8:16] for k in range(32)],
                 "k4s16": [GT32[k][:4] for k in range(4, 32, 8)],
                 "t8e": T8E}
        src = emit_quarter_pass32_neon(coefs=coefs,
                                       fn="quarter_pass1_32_neon",
                                       include_coefs=False)
        body = "\n".join(l for l in src.splitlines()
                         if not l.startswith("#include"))
        tpl = ("#include <arm_neon.h>\n#include <cstdint>\n\n"
               + coef_c_arrays(coefs) + "\n" + body +
               '\nextern "C" void tpl_pass4_32_neon(const int16_t* s, '
               "int16_t* d, intptr_t st) "
               "{ quarter_pass1_32_neon(s, d, st); }\n")
        tpl_src = self.write("tmp-tpl-neon32.cpp", tpl)
        tpl_obj = os.path.join(ROOT, "build", "tmp-tpl-neon32.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", tpl_obj, tpl_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        with open(os.path.join(
                ROOT, "kernels", "dct32", "candidates",
                "best_neon_vl128.cpp")) as f:
            golden = f.read()
        golden += ('\nextern "C" void dbg_pass4_32_neon(const int16_t* s, '
                   "int16_t* d, intptr_t st) "
                   "{ pass1Butterfly32_sve(s, d, st); }\n")
        ref_src = self.write("tmp-tpl-neon32-ref.cpp", golden)
        ref_obj = os.path.join(ROOT, "build", "tmp-tpl-neon32-ref.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", ref_obj, ref_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        drv = self.write("tmp-tpl-neon32-driver.cpp", r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_pass4_32_neon(const int16_t*, int16_t*, intptr_t);
extern "C" void dbg_pass4_32_neon(const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[32 * 32 + 16], a[1024], b[1024];
    long mism = 0;
    srand(0x4E0F);
    for (int it = 0; it < 80; it++)
    {
        for (int i = 0; i < 32 * 32 + 16; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_pass4_32_neon(src, a, 32);
        dbg_pass4_32_neon(src, b, 32);
        for (int i = 0; i < 1024; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
""")
        binp = os.path.join(ROOT, "build", "tmp-tpl-neon32-driver")
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

    def test_template_neon_full_dct32_matches_golden(self):
        coefs = {"gt32a": [GT32[k][:8] for k in range(32)],
                 "gt32b": [GT32[k][8:16] for k in range(32)],
                 "k2s16a": [GT32[k][:4] for k in range(2, 32, 4)],
                 "k2s16b": [GT32[k][4:8] for k in range(2, 32, 4)],
                 "k4s16": [GT32[k][:4] for k in range(4, 32, 8)],
                 "t8e": T8E}
        p1 = emit_quarter_pass32_neon(coefs=coefs,
                                      fn="quarter_pass1_32_neon",
                                      include_coefs=False,
                                      include_header=False)
        p2 = emit_quarter_pass2_neon32(coefs=coefs,
                                       include_coefs=False,
                                       include_header=False)
        body = "\n".join(l for l in (p1 + "\n" + p2).splitlines()
                         if not l.startswith("#include"))
        tpl = ("#include <arm_neon.h>\n#include <cstdint>\n\n"
               + coef_c_arrays(coefs) + "\n" + _NEON_HEADER + "\n"
               + body +
               '\nextern "C" void tpl_dct32_neon(const int16_t* s, '
               "int16_t* d, intptr_t st)\n{\n"
               "    int16_t coef[1024];\n"
               "    quarter_pass1_32_neon(s, coef, st);\n"
               "    quarter_pass2_32_neon(coef, d);\n}\n")
        tpl_src = self.write("tmp-tpl-neon32-full.cpp", tpl)
        tpl_obj = os.path.join(ROOT, "build", "tmp-tpl-neon32-full.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", tpl_obj, tpl_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        with open(os.path.join(
                ROOT, "kernels", "dct32", "candidates",
                "best_neon_vl128.cpp")) as f:
            golden = f.read()
        ref_src = self.write("tmp-tpl-neon32-full-ref.cpp", golden)
        ref_obj = os.path.join(ROOT, "build",
                               "tmp-tpl-neon32-full-ref.o")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+dotprod", "-o", ref_obj, ref_src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

        drv = self.write("tmp-tpl-neon32-full-driver.cpp", r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void tpl_dct32_neon(const int16_t*, int16_t*, intptr_t);
extern "C" void dynopt_dct32_sve2_shared(
    const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[32 * 32 + 16], a[1024], b[1024];
    long mism = 0;
    srand(0x4E0F);
    for (int it = 0; it < 80; it++)
    {
        for (int i = 0; i < 32 * 32 + 16; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        tpl_dct32_neon(src, a, 32);
        dynopt_dct32_sve2_shared(src, b, 32);
        for (int i = 0; i < 1024; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
""")
        binp = os.path.join(ROOT, "build", "tmp-tpl-neon32-full-driver")
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
