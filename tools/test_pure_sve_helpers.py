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


PSV16_SRC = r"""
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>
""" + PURE_SVE_HELPERS + r"""
extern "C" void psv16_smoke(const int16_t* a, const int16_t* b,
                            int16_t* o, int64_t* s)
{
    svint16_t x = psv16_dual_load8(a, b);
    svint16_t y = psv16_load(b);
    psv16_store(o, psv16_rev_hi(x));
    svint64_t acc = psv16_sdot(psv_zero_s64(), x, y);
    svst1_s64(svptrue_b64(), s, acc);
    svst1_s32(svptrue_b32(), (int32_t*)s, psv16_dual_saddl(x, y));
    psv16_store(o, psv16_dual_combine4_s16(
        psv16_dual_vget_lo4(x), psv16_dual_vget_hi4(x)));
}
int main()
{
    const int16_t x[16] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
    const int16_t y[16] = {16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
    int16_t r[16]; int64_t s[4]; int32_t z[8];
    svint16_t v = psv16_load(x);
    psv16_store(r, v);
    long bad = 0;
    for (int i = 0; i < 16; i++) if (r[i] != x[i]) bad++;
    psv16_store(r, psv16_rev(v));
    for (int i = 0; i < 16; i++)
        if (r[i] != 15 - i) { bad++; printf("rev[%d]=%d exp %d\n",
                                            i, r[i], 15 - i); }
    svint64_t acc = psv_zero_s64();
    acc = psv16_sdot(acc, v, v);
    svst1_s64(svptrue_b64(), s, acc);
    const int64_t e[4] = {14, 126, 366, 734};
    for (int i = 0; i < 4; i++)
        if (s[i] != e[i]) { bad++; printf("sdot[%d]=%lld exp %lld\n",
                                          i, (long long)s[i],
                                          (long long)e[i]); }
    psv16_store(r, psv16_dual_rev16(v));
    const int16_t er[16] = {7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8};
    for (int i = 0; i < 16; i++)
        if (r[i] != er[i]) { bad++; printf("dual_rev[%d]=%d exp %d\n",
                                           i, r[i], er[i]); }
    psv16_store(r, psv16_dual_vget_lo4(v));
    if (r[0] != 0 || r[1] != 1 || r[2] != 2 || r[3] != 3 ||
        r[8] != 8 || r[9] != 9 || r[10] != 10 || r[11] != 11)
        { bad++; printf("dual_vget_lo4 bad\n"); }
    psv16_store(r, psv16_dual_vget_hi4(v));
    if (r[0] != 4 || r[1] != 5 || r[2] != 6 || r[3] != 7 ||
        r[8] != 12 || r[9] != 13 || r[10] != 14 || r[11] != 15)
        { bad++; printf("dual_vget_hi4 bad\n"); }
    psv16_store(r, psv16_rev_hi(v));
    const int16_t erh[16] = {0,1,2,3,4,5,6,7,15,14,13,12,11,10,9,8};
    for (int i = 0; i < 16; i++)
        if (r[i] != erh[i]) { bad++; printf("rev_hi[%d]=%d exp %d\n",
                                            i, r[i], erh[i]); }
    psv16_store(r, psv16_rev_lo(v));
    const int16_t erl[16] = {7,6,5,4,3,2,1,0,8,9,10,11,12,13,14,15};
    for (int i = 0; i < 16; i++)
        if (r[i] != erl[i]) { bad++; printf("rev_lo[%d]=%d exp %d\n",
                                            i, r[i], erl[i]); }
    svst1_s32(svptrue_b32(), z, psv16_dual_saddl(v, psv16_load(y)));
    const int32_t es[8] = {16,18,20,22,32,34,36,38};
    for (int i = 0; i < 8; i++)
        if (z[i] != es[i]) { bad++; printf("dual_saddl[%d]=%d exp %d\n",
                                           i, z[i], es[i]); }
    svst1_s32(svptrue_b32(), z, psv16_dual_addp4_s32(
        svld1_s32(svptrue_b32(), (const int32_t[8])
            {1,2,3,4,5,6,7,8}),
        svld1_s32(svptrue_b32(), (const int32_t[8])
            {9,10,11,12,13,14,15,16})));
    const int32_t ea[8] = {3,7,19,23,11,15,27,31};
    for (int i = 0; i < 8; i++)
        if (z[i] != ea[i]) { bad++; printf("dual_addp4[%d]=%d exp %d\n",
                                           i, z[i], ea[i]); }
    psv16_store(r, psv16_dual_combine4_s16(
        psv16_dual_vget_lo4(v), psv16_dual_vget_hi4(v)));
    for (int i = 0; i < 16; i++)
        if (r[i] != x[i]) { bad++; printf("dual_combine4[%d]=%d exp %d\n",
                                          i, r[i], x[i]); }
    svst1_s32(svptrue_b32(), z, psv16_dual_saddl(v, psv16_load(y)));
    svst1_s16(svptrue_b16(), r, psv16_dual_vmovn_s32(
        svld1_s32(svptrue_b32(), (const int32_t[8])
            {16,18,20,22,32,34,36,38})));
    if (r[0] != 16 || r[1] != 18 || r[2] != 20 || r[3] != 22 ||
        r[8] != 32 || r[9] != 34 || r[10] != 36 || r[11] != 38)
        { bad++; printf("dual_vmovn_s32 bad\n"); }
    const int16_t p0[8] = {0,1,2,3,4,5,6,7};
    const int16_t p1[8] = {8,9,10,11,12,13,14,15};
    psv16_store(r, psv16_dual_load8(p0, p1));
    for (int i = 0; i < 16; i++)
        if (r[i] != i) { bad++; printf("dual_load8[%d]=%d exp %d\n",
                                       i, r[i], i); }
    const int32_t s8[8] = {1,2,3,4,5,6,7,8};
    svint32_t s32v = svld1_s32(svptrue_b32(), s8);
    svst1_s32(svptrue_b32(), z, psv16_dual_rev32_s32(s32v));
    { const int32_t e2[8] = {4,3,2,1,8,7,6,5};
      for (int i = 0; i < 8; i++)
          if (z[i] != e2[i]) { bad++; printf("dual_rev32[%d]=%d exp %d\n",
                                             i, z[i], e2[i]); } }
    svst1_s32(svptrue_b32(), z, psv16_dual_rev64_s32(s32v));
    { const int32_t e2[8] = {2,1,4,3,6,5,8,7};
      for (int i = 0; i < 8; i++)
          if (z[i] != e2[i]) { bad++; printf("dual_rev64[%d]=%d exp %d\n",
                                             i, z[i], e2[i]); } }
    { const int64_t q[4] = {0x100000001LL, 0x200000002LL,
                            0x300000003LL, 0x400000004LL};
      svint64_t qv = svld1_s64(svptrue_b64(), q);
      svst1_s32(svptrue_b32(), z, psv16_dual_vmovn_s64(qv));
      const int32_t e2[4] = {1,2,3,4};
      for (int i = 0; i < 4; i++)
          if (z[i] != e2[i]) { bad++; printf("dual_vmovn_s64[%d]=%d exp %d\n",
                                             i, z[i], e2[i]); } }
    { const int32_t q[8] = {64,128,256,-64,32,96,160,224};
      svint32_t qv = svld1_s32(svptrue_b32(), q);
      psv16_store(r, psv16_dual_rshrn_s32<6>(qv));
      if (r[0] != 1 || r[1] != 2 || r[2] != 4 || r[3] != -1 ||
          r[8] != 1 || r[9] != 2 || r[10] != 3 || r[11] != 4)
          { bad++; printf("dual_rshrn bad\n"); } }
    { int16_t ga[4], gb[4];
      svint16_t dv = psv16_dual_vget_lo4(v);
      psv16_dual_store4_s16(ga, gb, dv);
      const int16_t e2a[4] = {0,1,2,3}, e2b[4] = {8,9,10,11};
      for (int i = 0; i < 4; i++)
          if (ga[i] != e2a[i] || gb[i] != e2b[i])
              { bad++; printf("dual_store4 bad\n"); } }
    printf(bad ? "FAILED %ld\n" : "PASS\n", bad);
    return bad != 0;
}
"""


PSV16_SMOKE_SRC = r"""
#include <arm_sve.h>
#include <cstdint>
""" + PURE_SVE_HELPERS + r"""
extern "C" void psv16_smoke(const int16_t* a, const int16_t* b,
                            int16_t* o, int64_t* s)
{
    svint16_t x = psv16_load(a), y = psv16_load(b);
    psv16_store(o, psv16_rev(x));
    svint64_t acc = psv16_sdot(psv_zero_s64(), x, y);
    svst1_s64(svptrue_b64(), s, acc);
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
             "--symbols", "psv16_smoke",
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

    def test_psv16_full_vl_under_qemu_vq2(self):
        src = os.path.join(ROOT, "build", "tmp-psv16.cpp")
        binp = os.path.join(ROOT, "build", "tmp-psv16")
        obj = os.path.join(ROOT, "build", "tmp-psv16.o")
        with open(src, "w") as f:
            f.write(PSV16_SRC)
        cxx = os.environ.get("CXX", "aarch64-linux-gnu-g++")
        r = subprocess.run([cxx, "-O2", "-march=armv8.2-a+sve2",
                            "-o", binp, src], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        # gate: object must have zero NEON SIMD data instructions
        smoke_src = os.path.join(ROOT, "build", "tmp-psv16-smoke.cpp")
        with open(smoke_src, "w") as f:
            f.write(PSV16_SMOKE_SRC)
        rg = subprocess.run([cxx, "-c", "-O2", "-march=armv8.2-a+sve2",
                             "-o", obj, smoke_src],
                            capture_output=True, text=True)
        self.assertEqual(rg.returncode, 0, rg.stderr[:3000])
        g = subprocess.run(
            [sys.executable, os.path.join(ROOT, "tools",
                                          "check_isa_level.py"),
             "--object", obj, "--level", "sve2", "--json", "--no-neon",
             "--objdump", "aarch64-linux-gnu-objdump"],
            capture_output=True, text=True)
        d = json.loads(g.stdout)
        self.assertEqual(d["neon_violations"], [], g.stdout + g.stderr)
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        run = subprocess.run([qemu, "-L", "/usr/aarch64-linux-gnu",
                              "-cpu", "max,sve-max-vq=2", binp],
                             capture_output=True, text=True)
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout)


if __name__ == "__main__":
    unittest.main()
