#!/usr/bin/env python3
"""satd pure-SVE emitters validation (8x8/16x16/32x32/64x64):
1) generated object has zero NEON registers (--no-neon);
2) numeric equality vs the NEON DAG emitters on random inputs under
   QEMU VL=128 (SVE path) and VL=256 (scalar svcntb guard fallback).
   Built without -msve-vector-bits=128 so the runtime guard is not
   constant-folded away.
"""

import json
import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from satd8_emit import emit_satd8  # noqa: E402
from satd8_op_ir import satd8_dag, satd16_dag  # noqa: E402
from satd8_pure_sve_emit import emit_satd_pure_sve  # noqa: E402


DRIVER = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" int dynopt_satd_pure_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_pure_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_pure_32x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_pure_64x64_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_neon_8x8(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_neon_16x16(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
static int neon32(const uint8_t* a, intptr_t sa,
                  const uint8_t* b, intptr_t sb)
{
    int c = 0;
    c += dynopt_neon_16x16(a + 0 * sa + 0, sa, b + 0 * sb + 0, sb);
    c += dynopt_neon_16x16(a + 0 * sa + 16, sa, b + 0 * sb + 16, sb);
    c += dynopt_neon_16x16(a + 16 * sa + 0, sa, b + 16 * sb + 0, sb);
    c += dynopt_neon_16x16(a + 16 * sa + 16, sa, b + 16 * sb + 16, sb);
    return c;
}
static int neon64(const uint8_t* a, intptr_t sa,
                  const uint8_t* b, intptr_t sb)
{
    int c = 0;
    for (int y = 0; y < 64; y += 16)
        for (int x = 0; x < 64; x += 16)
            c += dynopt_neon_16x16(a + y * sa + x, sa,
                                   b + y * sb + x, sb);
    return c;
}
int main()
{
    static uint8_t a[70 * 64 + 64], b[70 * 64 + 64];
    long mism = 0;
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < (int)(sizeof(a) / sizeof(a[0])); i++)
            a[i] = b[i] = (uint8_t)(rand() % 256);
        const uint8_t* pa = a + 3 * 64 + 8;
        const uint8_t* pb = b + 3 * 64 + 8;
        int got = dynopt_satd_pure_8x8_sve2(pa, 64, pb, 64);
        int want = dynopt_neon_8x8(pa, 64, pb, 64);
        if (got != want) { if (mism < 4) printf("8x8 it=%d got=%d want=%d\n", it, got, want); mism++; }
        got = dynopt_satd_pure_16x16_sve2(pa, 64, pb, 64);
        want = dynopt_neon_16x16(pa, 64, pb, 64);
        if (got != want) { if (mism < 4) printf("16x16 it=%d got=%d want=%d\n", it, got, want); mism++; }
        got = dynopt_satd_pure_32x32_sve2(pa, 64, pb, 64);
        want = neon32(pa, 64, pb, 64);
        if (got != want) { if (mism < 4) printf("32x32 it=%d got=%d want=%d\n", it, got, want); mism++; }
        got = dynopt_satd_pure_64x64_sve2(pa, 64, pb, 64);
        want = neon64(pa, 64, pb, 64);
        if (got != want) { if (mism < 4) printf("64x64 it=%d got=%d want=%d\n", it, got, want); mism++; }
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""


class SatdPureSveTest(unittest.TestCase):

    def _build(self, src, obj):
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+sve2",
             "-o", obj, src], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

    def test_pure_sve_no_neon(self):
        src = os.path.join(ROOT, "build", "tmp-pure-satd.cpp")
        obj = os.path.join(ROOT, "build", "tmp-pure-satd.o")
        os.makedirs(os.path.dirname(src), exist_ok=True)
        with open(src, "w") as f:
            f.write(emit_satd_pure_sve("dynopt_satd_pure"))
        self._build(src, obj)
        g = subprocess.run(
            [sys.executable, os.path.join(ROOT, "tools",
                                          "check_isa_level.py"),
             "--object", obj, "--level", "sve2", "--json", "--no-neon",
             "--objdump", "aarch64-linux-gnu-objdump"],
            capture_output=True, text=True)
        self.assertEqual(g.returncode, 0, g.stdout + g.stderr)
        d = json.loads(g.stdout)
        self.assertEqual(d["neon_violations"], [])
        self.assertEqual(d["violations"], [])

    def test_numeric_equality_vq1_and_fallback_vq2(self):
        pure_src = os.path.join(ROOT, "build", "tmp-pure-satd.cpp")
        with open(pure_src, "w") as f:
            f.write(emit_satd_pure_sve("dynopt_satd_pure"))
        pure_obj = os.path.join(ROOT, "build", "tmp-pure-satd.o")
        self._build(pure_src, pure_obj)
        neon_src = os.path.join(ROOT, "build", "tmp-neon-satd.cpp")
        with open(neon_src, "w") as f:
            f.write(emit_satd8(satd8_dag(), func_name="dynopt_neon_8x8")
                    + "\n" +
                    emit_satd8(satd16_dag(),
                               func_name="dynopt_neon_16x16"))
        neon_obj = os.path.join(ROOT, "build", "tmp-neon-satd.o")
        self._build(neon_src, neon_obj)
        drv = os.path.join(ROOT, "build", "tmp-satd-pure-driver.cpp")
        with open(drv, "w") as f:
            f.write(DRIVER)
        binp = os.path.join(ROOT, "build", "tmp-satd-pure-driver")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-o", binp, drv,
             pure_obj, neon_obj], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        for vq, label in ((1, "SVE path"), (2, "scalar fallback")):
            run = subprocess.run(
                [qemu, "-L", "/usr/aarch64-linux-gnu",
                 "-cpu", "max,sve-max-vq=%d" % vq, binp],
                capture_output=True, text=True)
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
            self.assertIn("PASS", run.stdout, label)


if __name__ == "__main__":
    unittest.main()
