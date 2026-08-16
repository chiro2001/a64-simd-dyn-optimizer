#!/usr/bin/env python3
"""dct16 dual-group 16-lane SVE emitter validation:
1) generated object has zero NEON registers (--no-neon);
2) numeric equality vs the 8-lane pure-SVE dct16 (runtime guard
   removed) on random/edge inputs.  The 8-lane kernel's zip stage is
   only VL=128-correct, so it runs at sve-max-vq=1 and the 16-lane
   kernel at sve-max-vq=2 in SEPARATE QEMU processes with identical
   deterministic input, then the dumps are compared.  The 8-lane
   pure-SVE kernel already equals the neon8 fused8 candidate at VL=128
   (tools/test_dct16_pure_sve.py), so this transitively pins the neon8
   contract."""

import json
import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_dual_sve_emit import emit_dual_sve  # noqa: E402
from dct16_pure_sve_emit import emit_pure_sve  # noqa: E402


DRIVER = r"""
#include <cstdint>
#include <cstdio>
#include <cstdlib>
extern "C" void dynopt_dct16_sve16(
    const int16_t*, int16_t*, intptr_t);
extern "C" void dynopt_dct16_sve8_anyvl(
    const int16_t*, int16_t*, intptr_t);
static void fill(int16_t* p, int mode)
{
    for (int i = 0; i < 16 * 16 + 16; i++)
    {
        switch (mode)
        {
        case 0: p[i] = (int16_t)(rand() % 60000 - 30000); break;
        case 1: p[i] = 0; break;
        case 2: p[i] = 32767; break;
        case 3: p[i] = -32768; break;
        case 4: p[i] = (i & 1) ? 32767 : -32768; break;
        case 5: p[i] = (int16_t)((i * 2654435761u) >> 16); break;
        default: p[i] = (int16_t)(rand() % 60000 - 30000); break;
        }
    }
}
int main(int argc, char** argv)
{
    int mode = argc > 1 ? atoi(argv[1]) : 0;
    int16_t src[16 * 16 + 16];
    int16_t a[16 * 16], b[16 * 16];
    srand(0x5EED);
    for (int it = 0; it < 200; it++)
    {
        fill(src, it < 5 ? it : 0);
        int16_t* out = mode == 0 ? a : b;
        if (mode == 0)
            dynopt_dct16_sve8_anyvl(src, out, 16);
        else
            dynopt_dct16_sve16(src, out, 16);
        for (int i = 0; i < 16 * 16; i++)
            printf("%d%c", out[i], (i & 15) == 15 ? '\n' : ' ');
    }
    return 0;
}
"""


class Dct16Sve16Test(unittest.TestCase):

    def build(self, src, obj, extra=None, bits=None):
        cmd = ["aarch64-linux-gnu-g++", "-c", "-O2",
               "-march=armv8.2-a+sve2"]
        if bits:
            cmd.append("-msve-vector-bits=%d" % bits)
        cmd += ["-o", obj, src] + (extra or [])
        r = subprocess.run(cmd, capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])

    def write(self, name, text):
        p = os.path.join(ROOT, "build", name)
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w") as f:
            f.write(text)
        return p

    def _qemu(self, args):
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        return subprocess.run(
            [qemu, "-L", "/usr/aarch64-linux-gnu",
             "-cpu", "max,sve-max-vq=%d" % args[0]] + args[1:],
            capture_output=True, text=True)

    def test_sve16_no_neon(self):
        src = self.write("tmp-dual-dct16.cpp", emit_dual_sve())
        obj = os.path.join(ROOT, "build", "tmp-dual-dct16.o")
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

    def test_sve16_vs_sve8_vq1(self):
        pure = emit_pure_sve("dynopt_dct16_sve8_anyvl")
        pure = pure.replace("    if (svcntb() != 16) return;\n", "")
        src = self.write("tmp-sve8-anyvl-dct16.cpp", pure)
        obj = os.path.join(ROOT, "build", "tmp-sve8-anyvl-dct16.o")
        self.build(src, obj)
        dual_src = self.write("tmp-dual-dct16.cpp", emit_dual_sve())
        dual_obj = os.path.join(ROOT, "build", "tmp-dual-dct16.o")
        self.build(dual_src, dual_obj)
        drv = self.write("tmp-dct16-sve16-driver.cpp", DRIVER)
        binp = os.path.join(ROOT, "build", "tmp-dct16-sve16-driver")
        r = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-o", binp, drv,
             dual_obj, obj], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr[:3000])
        ref = self._qemu([1, binp, "0"])
        self.assertEqual(ref.returncode, 0, ref.stdout + ref.stderr)
        dual = self._qemu([2, binp, "1"])
        self.assertEqual(dual.returncode, 0, dual.stdout + dual.stderr)
        rv = [int(x) for x in ref.stdout.split()]
        dv = [int(x) for x in dual.stdout.split()]
        self.assertEqual(len(rv), 200 * 16 * 16)
        self.assertEqual(len(dv), len(rv))
        mism = sum(1 for x, y in zip(rv, dv) if x != y)
        self.assertEqual(mism, 0, "%d mismatched lanes" % mism)


if __name__ == "__main__":
    unittest.main()
