#!/usr/bin/env python3
"""Pure-SVE primitive regression: generated smoke object must contain
zero NEON registers (check_isa_level --no-neon)."""

import json
import os
import subprocess
import sys
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from pure_sve_helpers import PURE_SVE_HELPERS, smoke_source  # noqa: E402


NUMERIC_SRC = r"""
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>
""" + PURE_SVE_HELPERS + r"""
static int fails = 0;
static void chk16(const char* n, const int16_t* got, const int16_t* exp, int c)
{
    for (int i = 0; i < c; i++)
        if (got[i] != exp[i]) { printf("FAIL %s[%d]=%d exp %d\n",
                                       n, i, got[i], exp[i]); fails++; }
}
static void chk32(const char* n, const int32_t* got, const int32_t* exp, int c)
{
    for (int i = 0; i < c; i++)
        if (got[i] != exp[i]) { printf("FAIL %s[%d]=%d exp %d\n",
                                       n, i, got[i], exp[i]); fails++; }
}
int main()
{
    const int16_t a8[8] = {1,2,3,4,5,6,7,8};
    const int16_t b8[8] = {9,10,11,12,13,14,15,16};
    const int32_t a4[4] = {1,2,3,4};
    const int32_t b4[4] = {5,6,7,8};
    const int32_t s32[4] = {0x1234, 0x5678, 0x9abc, 0x7fff};
    int16_t out16[8]; int32_t out32[4];
    svint16_t x = psv_load8(a8), y = psv_load8(b8);
    psv_store4_s16(out16, psv_get_lo4_s16(x));
    { int16_t e[4] = {1,2,3,4}; chk16("lo4", out16, e, 4); }
    psv_store4_s16(out16, psv_get_hi4_s16(x));
    { int16_t e[4] = {5,6,7,8}; chk16("hi4", out16, e, 4); }
    psv_store8(out16, psv_combine4_s16(psv_get_lo4_s16(x),
                                       psv_get_lo4_s16(y)));
    { int16_t e[8] = {1,2,3,4,9,10,11,12}; chk16("combine4", out16, e, 8); }
    svint32_t w = psv_saddl_s16(psv_get_lo4_s16(x), psv_get_hi4_s16(x));
    svst1_s32(svptrue_pat_b32(SV_VL4), out32, w);
    { int32_t e[4] = {6,8,10,12}; chk32("saddl", out32, e, 4); }
    svint32_t s = psv_load4_s32(s32);
    psv_store4_s16(out16, psv_vmovn_s32(s));
    { int16_t e[4] = {0x1234, 0x5678, (int16_t)0x9abc, 0x7fff};
      chk16("vmovn_s32", out16, e, 4); }
    psv_store4_s16(out16, psv_combine4_s16(
        psv_vmovn_s32(s), psv_vmovn_s32(s)));
    { int32_t c[2] = {1, 2}, d[2] = {3, 4};
      svint32_t ca = svld1_s32(svptrue_pat_b32(SV_VL2), c);
      svint32_t cb = svld1_s32(svptrue_pat_b32(SV_VL2), d);
      svst1_s32(svptrue_pat_b32(SV_VL4), out32, psv_combine4_s32(ca, cb));
      int32_t e2[4] = {1, 2, 3, 4}; chk32("combine4_s32", out32, e2, 4); }
    svint32_t pa = psv_addp4_s32(svdup_s32_x(svptrue_pat_b32(SV_VL4), 1),
                                 svdup_s32_x(svptrue_pat_b32(SV_VL4), 2));
    svst1_s32(svptrue_pat_b32(SV_VL4), out32, pa);
    { int32_t e[4] = {2,2,4,4}; chk32("addp4", out32, e, 4); }
    svint32_t rv = psv_load4_s32(a4);
    svst1_s32(svptrue_pat_b32(SV_VL4), out32, psv_rev64_s32(rv));
    { int32_t e[4] = {2,1,4,3}; chk32("rev64", out32, e, 4); }
    svst1_s32(svptrue_pat_b32(SV_VL4), out32, psv_rev32_s32(rv));
    { int32_t e[4] = {4,3,2,1}; chk32("rev32", out32, e, 4); }
    { int32_t rq[4] = {96,128,256,-64};
      svint32_t q = psv_load4_s32(rq);
      psv_store4_s16(out16, psv_rshrn_s32<6>(q));
      int16_t e[4] = {2,2,4,-1}; chk16("rshrn6", out16, e, 4); }
    printf(fails ? "FAILED %d\n" : "PASS\n", fails);
    return fails != 0;
}
"""


class PureSveHelpersTest(unittest.TestCase):

    def test_smoke_object_has_no_neon(self):
        src = os.path.join(ROOT, "build", "tmp-pure-sve-smoke.cpp")
        obj = os.path.join(ROOT, "build", "tmp-pure-sve-smoke.o")
        os.makedirs(os.path.dirname(src), exist_ok=True)
        with open(src, "w") as f:
            f.write(smoke_source())
        cxx = os.environ.get("CXX", "aarch64-linux-gnu-g++")
        r = subprocess.run([cxx, "-c", "-O2", "-march=armv8.2-a+sve2",
                            "-msve-vector-bits=128", "-o", obj, src],
                           capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr)
        g = subprocess.run(
            [sys.executable,
             os.path.join(ROOT, "tools", "check_isa_level.py"),
             "--object", obj, "--level", "sve2", "--json", "--no-neon",
             "--objdump", "aarch64-linux-gnu-objdump"],
            capture_output=True, text=True)
        self.assertEqual(g.returncode, 0, g.stdout + g.stderr)
        d = json.loads(g.stdout)
        self.assertEqual(d["neon_violations"], [])
        self.assertEqual(d["violations"], [])

    def test_numeric_primitives_under_qemu(self):
        src = os.path.join(ROOT, "build", "tmp-pure-sve-numeric.cpp")
        binp = os.path.join(ROOT, "build", "tmp-pure-sve-numeric")
        os.makedirs(os.path.dirname(src), exist_ok=True)
        with open(src, "w") as f:
            f.write(NUMERIC_SRC)
        cxx = os.environ.get("CXX", "aarch64-linux-gnu-g++")
        r = subprocess.run([cxx, "-O2", "-march=armv8.2-a+sve2",
                            "-msve-vector-bits=128", "-o", binp, src],
                           capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr)
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        if not os.path.exists(qemu):
            qemu = "qemu-aarch64"
        run = subprocess.run([qemu, "-L", "/usr/aarch64-linux-gnu",
                              "-cpu", "max,sve-max-vq=1", binp],
                             capture_output=True, text=True)
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout)


if __name__ == "__main__":
    unittest.main()
