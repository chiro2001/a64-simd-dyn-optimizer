#!/usr/bin/env python3
"""Dual-group 16-lane (VL=256) family emitters validation.

For every family that has a width-independent DAG (mc/sad/ssd/pixel_var/
satd16/8x16/16x8/sa8d16):
  1) the generated best_ir_sve16.cpp object has zero NEON registers;
  2) numeric equality vs the existing NEON DAG emitter under QEMU
     sve-max-vq=2 (VL=256) on random/edge inputs.
"""

import json
import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dual_sve16_families import (  # noqa: E402
    INTERP8_SHAPES,
    emit_interp8_hpp_sve16,
    emit_mc_sve16,
    emit_pixel_var_sve16,
    emit_sa8d_sve16,
    emit_sad_sve16,
    emit_satd_sve16,
    emit_ssd_sve16,
)
from mc_avg_emit import emit_avg_pp  # noqa: E402
from mc_avg_op_ir import avg_pp_16x16_dag  # noqa: E402
from pixel_var_emit import emit_pixel_var  # noqa: E402
from pixel_var_op_ir import pixel_var_16x16_dag  # noqa: E402
from sa8d16_op_ir import sa8d16_dag  # noqa: E402
from sad_emit import emit_sad16  # noqa: E402
from sad_op_ir import sad16x16_dag  # noqa: E402
from satd8_emit import emit_satd8  # noqa: E402
from satd8_op_ir import satd16_dag, satd_rect_dag  # noqa: E402
from ssd_emit import emit_sse_pp  # noqa: E402
from ssd_op_ir import sse_pp_16x16_dag  # noqa: E402
from interp8_emit import emit_interp8_hpp  # noqa: E402
from interp8_op_ir import interp8_hpp_dag  # noqa: E402


CANDIDATES = {
    "mc": emit_mc_sve16(),
    "sad": emit_sad_sve16(),
    "ssd": emit_ssd_sve16(),
    "pixel_var": emit_pixel_var_sve16(),
    "satd16": emit_satd_sve16("16x16"),
    "satd8x16": emit_satd_sve16("8x16"),
    "satd16x8": emit_satd_sve16("16x8"),
    "sa8d16": emit_sa8d_sve16(),
}
for _w, _h in INTERP8_SHAPES:
    CANDIDATES["interp8_%dx%d" % (_w, _h)] = \
        emit_interp8_hpp_sve16(_w, _h)

REFERENCES = (
    emit_avg_pp(avg_pp_16x16_dag(), func_name="dynopt_neon_avg_16x16")
    + emit_sad16(sad16x16_dag(), func_name="dynopt_neon_sad_16x16")
    + emit_sse_pp(sse_pp_16x16_dag(),
                  func_name="dynopt_neon_sse_16x16")
    + emit_pixel_var(pixel_var_16x16_dag(),
                     func_name="dynopt_neon_pixel_var_16x16")
    + emit_satd8(satd16_dag(), func_name="dynopt_neon_satd_16x16")
    + emit_satd8(satd_rect_dag("8x16"), func_name="dynopt_neon_satd_8x16")
    + emit_satd8(satd_rect_dag("16x8"), func_name="dynopt_neon_satd_16x8")
    + emit_satd8(sa8d16_dag(), func_name="dynopt_neon_sa8d_16x16")
)
for _w, _h in INTERP8_SHAPES:
    REFERENCES += emit_interp8_hpp(
        interp8_hpp_dag(_w, _h),
        func_name="dynopt_neon_interp8_%dx%d" % (_w, _h))


DRIVER = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

extern "C" void dynopt_avg_pp_16x16_sve16(
    uint8_t*, intptr_t, const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sad_16x16_sve16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" unsigned int dynopt_sse_pp_16x16_sve16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" uint64_t dynopt_pixel_var_16x16_sve16(
    const uint8_t*, intptr_t);
extern "C" int dynopt_satd_16x16_sve16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_8x16_sve16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_16x8_sve16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_sve16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

extern "C" void dynopt_neon_avg_16x16(
    uint8_t*, intptr_t, const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_neon_sad_16x16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" unsigned int dynopt_neon_sse_16x16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" uint64_t dynopt_neon_pixel_var_16x16(
    const uint8_t*, intptr_t);
extern "C" int dynopt_neon_satd_16x16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_neon_satd_8x16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_neon_satd_16x8(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_neon_sa8d_16x16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

extern "C" void dynopt_neon_interp8_8x8(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_8x16(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_16x8(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_16x16(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_16x32(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_32x16(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_32x32(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_64x32(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_neon_interp8_64x64(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

#define DECL_SVE16(w, h)                                                    \
    extern "C" void dynopt_interp8_hpp_##w##x##h##_sve16(                  \
        const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
DECL_SVE16(8, 8) DECL_SVE16(8, 16) DECL_SVE16(16, 8)
DECL_SVE16(16, 16) DECL_SVE16(16, 32) DECL_SVE16(32, 16)
DECL_SVE16(32, 32) DECL_SVE16(64, 32) DECL_SVE16(64, 64)

static const int N = 100 * 96 + 96;
static uint8_t a[N], b[N];

#define CMP_INTERP(w, h)                                                    \
    do {                                                                    \
        for (int ph = 1; ph <= 3; ph++)                                     \
        {                                                                   \
            memset(d1, 0xAA, sizeof(d1));                                   \
            memset(d2, 0xAA, sizeof(d2));                                   \
            uint8_t* dd1 = d1 + 3 * 96 + 8;                                 \
            uint8_t* dd2 = d2 + 3 * 96 + 8;                                 \
            dynopt_interp8_hpp_##w##x##h##_sve16(pa, 96, dd1, 96, ph);      \
            dynopt_neon_interp8_##w##x##h(pa, 96, dd2, 96, ph);             \
            if (memcmp(d1, d2, sizeof(d1)) != 0)                            \
            {                                                               \
                if (mism < 6)                                               \
                    printf("interp8_%dx%d ph=%d it=%d mismatch\n",          \
                           w, h, ph, it);                                   \
                mism++;                                                     \
            }                                                               \
        }                                                                   \
    } while (0)

#define CMP_INT(name, fn)                                                   \
    do {                                                                    \
        int g = fn(pa, 64, pb, 64);                                         \
        int w = name(pa, 64, pb, 64);                                       \
        if (g != w)                                                         \
        {                                                                   \
            if (mism < 6)                                                   \
                printf("%s it=%d got=%d want=%d\n", #fn, it, g, w);         \
            mism++;                                                         \
        }                                                                   \
    } while (0)

int main()
{
    static uint8_t d1[N], d2[N];
    long mism = 0;
    srand(0x5EED);
    for (int it = 0; it < 200; it++)
    {
        int mode = it % 6;
        for (int i = 0; i < N; i++)
        {
            switch (mode)
            {
            case 0: a[i] = b[i] = (uint8_t)(rand() % 256); break;
            case 1: a[i] = b[i] = 0; break;
            case 2: a[i] = b[i] = 255; break;
            case 3: a[i] = (uint8_t)(rand() % 256);
                    b[i] = (uint8_t)(rand() % 256); break;
            case 4: a[i] = (uint8_t)(i * 7);
                    b[i] = (uint8_t)(255 - i * 3); break;
            default: a[i] = b[i] = (uint8_t)(rand() % 256); break;
            }
        }
        const uint8_t* pa = a + 3 * 96 + 8;
        const uint8_t* pb = b + 3 * 96 + 8;

        memset(d1, 0xAA, sizeof(d1));
        memset(d2, 0xAA, sizeof(d2));
        dynopt_avg_pp_16x16_sve16(d1 + 3 * 64 + 8, 64, pa, 64, pb, 64);
        dynopt_neon_avg_16x16(d2 + 3 * 64 + 8, 64, pa, 64, pb, 64);
        if (memcmp(d1, d2, sizeof(d1)) != 0)
        {
            if (mism < 6) printf("avg it=%d dst mismatch\n", it);
            mism++;
        }
        CMP_INT(dynopt_neon_sad_16x16, dynopt_sad_16x16_sve16);
        CMP_INT(dynopt_neon_sse_16x16, dynopt_sse_pp_16x16_sve16);
        {
            uint64_t g = dynopt_pixel_var_16x16_sve16(pa, 64);
            uint64_t w = dynopt_neon_pixel_var_16x16(pa, 64);
            if (g != w)
            {
                if (mism < 6)
                    printf("pixel_var it=%d got=%llu want=%llu\n",
                           it, (unsigned long long)g,
                           (unsigned long long)w);
                mism++;
            }
        }
        CMP_INT(dynopt_neon_satd_16x16, dynopt_satd_16x16_sve16);
        CMP_INT(dynopt_neon_satd_8x16, dynopt_satd_8x16_sve16);
        CMP_INT(dynopt_neon_satd_16x8, dynopt_satd_16x8_sve16);
        CMP_INT(dynopt_neon_sa8d_16x16, dynopt_sa8d_16x16_sve16);
        CMP_INTERP(8, 8); CMP_INTERP(8, 16); CMP_INTERP(16, 8);
        CMP_INTERP(16, 16); CMP_INTERP(16, 32); CMP_INTERP(32, 16);
        CMP_INTERP(32, 32); CMP_INTERP(64, 32); CMP_INTERP(64, 64);
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""


class DualSve16Test(unittest.TestCase):

    def _write(self, name, text):
        p = os.path.join(ROOT, "build", name)
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w") as f:
            f.write(text)
        return p

    def _build(self, src, obj):
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+sve2", "-o", obj, src],
            capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

    def _qemu(self, args):
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        return subprocess.run(
            [qemu, "-L", "/usr/aarch64-linux-gnu",
             "-cpu", "max,sve-max-vq=%d" % args[0]] + list(args[1:]),
            capture_output=True, text=True)

    def test_no_neon(self):
        for name, src in CANDIDATES.items():
            cpp = self._write("tmp-dual16-%s.cpp" % name, src)
            obj = os.path.join(ROOT, "build",
                               "tmp-dual16-%s.o" % name)
            self._build(cpp, obj)
            g = subprocess.run(
                [sys.executable, os.path.join(ROOT, "tools",
                                              "check_isa_level.py"),
                 "--object", obj, "--level", "sve2", "--json",
                 "--no-neon", "--objdump", "aarch64-linux-gnu-objdump"],
                capture_output=True, text=True)
            self.assertEqual(g.returncode, 0, g.stdout + g.stderr)
            d = json.loads(g.stdout)
            self.assertEqual(d["neon_violations"], [], name)
            self.assertEqual(d["violations"], [], name)

    def test_numeric_vq2(self):
        cand_objs = []
        for name, src in CANDIDATES.items():
            cpp = self._write("tmp-dual16-num-%s.cpp" % name, src)
            obj = os.path.join(ROOT, "build",
                               "tmp-dual16-num-%s.o" % name)
            self._build(cpp, obj)
            cand_objs.append(obj)
        ref_src = self._write("tmp-dual16-ref.cpp", REFERENCES)
        ref_obj = os.path.join(ROOT, "build", "tmp-dual16-ref.o")
        self._build(ref_src, ref_obj)
        drv = self._write("tmp-dual16-driver.cpp", DRIVER)
        binp = os.path.join(ROOT, "build", "tmp-dual16-driver")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-o", binp, drv,
             ref_obj] + cand_objs, capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        run = self._qemu((2, binp))
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout, run.stdout)


if __name__ == "__main__":
    unittest.main()
