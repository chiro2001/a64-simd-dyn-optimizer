#!/usr/bin/env python3
"""dct16 pure-SVE emitter validation:
1) generated object has zero NEON registers (--no-neon);
2) numeric equality vs the neon8 fused8 candidate on random inputs
   (QEMU, VL=128)."""

import json
import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_pure_sve_emit import emit_pure_sve  # noqa: E402
from dct16_op_emit import emit_acle  # noqa: E402


DRIVER = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void dynopt_dct16_pure_sve(
    const int16_t*, int16_t*, intptr_t);
extern "C" void dynopt_dct16_neon8(
    const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[16 * 16 + 8];
    int16_t a[16 * 16], b[16 * 16];
    long mism = 0;
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < 16 * 16 + 8; i++)
            src[i] = (int16_t)(rand() % 60000 - 30000);
        dynopt_dct16_pure_sve(src, a, 16);
        dynopt_dct16_neon8(src, b, 16);
        for (int i = 0; i < 16 * 16; i++)
            if (a[i] != b[i]) mism++;
    }
    printf(mism ? "FAILED %ld\n" : "PASS\n", mism);
    return mism != 0;
}
"""


class Dct16PureSveTest(unittest.TestCase):

    def build(self, src, obj, extra=None):
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-c", "-O2",
             "-march=armv8.2-a+sve2", "-msve-vector-bits=128",
             "-o", obj, src] + (extra or []), capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

    def test_pure_sve_no_neon(self):
        src = os.path.join(ROOT, "build", "tmp-pure-dct16.cpp")
        obj = os.path.join(ROOT, "build", "tmp-pure-dct16.o")
        os.makedirs(os.path.dirname(src), exist_ok=True)
        with open(src, "w") as f:
            f.write(emit_pure_sve("dynopt_dct16_pure_sve"))
        self.build(src, obj)
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

    def test_numeric_equality_vs_neon8(self):
        pure_src = os.path.join(ROOT, "build", "tmp-pure-dct16.cpp")
        with open(pure_src, "w") as f:
            f.write(emit_pure_sve("dynopt_dct16_pure_sve"))
        pure_obj = os.path.join(ROOT, "build", "tmp-pure-dct16.o")
        self.build(pure_src, pure_obj)
        mixed_src = os.path.join(ROOT, "build", "tmp-mixed-dct16.cpp")
        with open(mixed_src, "w") as f:
            f.write(emit_acle(neon8=True, func_name="dynopt_dct16_neon8"))
        mixed_obj = os.path.join(ROOT, "build", "tmp-mixed-dct16.o")
        self.build(mixed_src, mixed_obj)
        drv = os.path.join(ROOT, "build", "tmp-dct16-driver.cpp")
        with open(drv, "w") as f:
            f.write(DRIVER)
        binp = os.path.join(ROOT, "build", "tmp-dct16-driver")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-o", binp, drv,
             pure_obj, mixed_obj], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        run = subprocess.run([qemu, "-L", "/usr/aarch64-linux-gnu",
                              "-cpu", "max,sve-max-vq=1", binp],
                             capture_output=True, text=True)
        self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout)


if __name__ == "__main__":
    unittest.main()
