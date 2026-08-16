#!/usr/bin/env python3
"""satd8 pure-SVE emitter validation:
1) generated object has zero NEON registers (--no-neon);
2) numeric equality vs the NEON DAG candidate on random inputs under
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
from satd8_op_ir import satd8_dag  # noqa: E402
from satd8_pure_sve_emit import emit_satd8_pure_sve  # noqa: E402


DRIVER = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" int dynopt_satd_8x8_pure_sve(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_8x8_neon(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
int main()
{
    static uint8_t a[9 * 64 + 16], b[9 * 64 + 16];
    long mism = 0;
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < (int)(sizeof(a) / sizeof(a[0])); i++)
            a[i] = b[i] = (uint8_t)(rand() % 256);
        int got = dynopt_satd_8x8_pure_sve(a + 3 * 64 + 8, 64,
                                           b + 3 * 64 + 8, 64);
        int want = dynopt_satd_8x8_neon(a + 3 * 64 + 8, 64,
                                        b + 3 * 64 + 8, 64);
        if (got != want)
        {
            if (mism < 4)
                printf("it=%d got=%d want=%d\n", it, got, want);
            mism++;
        }
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""


class Satd8PureSveTest(unittest.TestCase):

    def _build(self, src, obj):
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+sve2",
             "-o", obj, src], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

    def test_pure_sve_no_neon(self):
        src = os.path.join(ROOT, "build", "tmp-pure-satd8.cpp")
        obj = os.path.join(ROOT, "build", "tmp-pure-satd8.o")
        os.makedirs(os.path.dirname(src), exist_ok=True)
        with open(src, "w") as f:
            f.write(emit_satd8_pure_sve("dynopt_satd_8x8_pure_sve"))
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
        pure_src = os.path.join(ROOT, "build", "tmp-pure-satd8.cpp")
        with open(pure_src, "w") as f:
            f.write(emit_satd8_pure_sve("dynopt_satd_8x8_pure_sve"))
        pure_obj = os.path.join(ROOT, "build", "tmp-pure-satd8.o")
        self._build(pure_src, pure_obj)
        neon_src = os.path.join(ROOT, "build", "tmp-neon-satd8.cpp")
        with open(neon_src, "w") as f:
            f.write(emit_satd8(satd8_dag(),
                               func_name="dynopt_satd_8x8_neon"))
        neon_obj = os.path.join(ROOT, "build", "tmp-neon-satd8.o")
        self._build(neon_src, neon_obj)
        drv = os.path.join(ROOT, "build", "tmp-satd8-pure-driver.cpp")
        with open(drv, "w") as f:
            f.write(DRIVER)
        binp = os.path.join(ROOT, "build", "tmp-satd8-pure-driver")
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
