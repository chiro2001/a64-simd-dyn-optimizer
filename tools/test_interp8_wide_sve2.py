#!/usr/bin/env python3
"""Test for optimizer/ir/interp8_wide_sve2.py emitter.

Validates:
  1) emit_svdot32() generates valid C++ that compiles for 8x8/16x16/32x32
  2) generated candidates are bit-exact vs NEON reference under QEMU
  3) static counts show low permute_depth_ratio (< 0.30)
  4) check_isa_level --level sve2 PASS (no SVE2p3)
"""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from interp8_wide_sve2 import emit_svdot32  # noqa: E402

CC = os.environ.get("CROSS_CC", "aarch64-linux-gnu-g++")
CXXFLAGS = ["-O3", "-march=armv8.2-a+sve2", "-std=c++17"]
QEMU = os.environ.get("QEMU", "qemu-aarch64")
QEMU_SYSROOT = os.environ.get("QEMU_SYSROOT", "/usr/aarch64-linux-gnu")

SHAPES = [(8, 8), (16, 16), (32, 32)]


def _has_cross_compiler():
    try:
        subprocess.run([CC, "--version"], capture_output=True, timeout=5)
        return True
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return False


def _has_qemu():
    try:
        subprocess.run([QEMU, "--version"], capture_output=True, timeout=5)
        return True
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return False


class TestInterp8WideSve2Emitter(unittest.TestCase):

    def test_emits_valid_cpp_all_shapes(self):
        for w, h in SHAPES:
            code = emit_svdot32(
                func_name="dynopt_interp8_%dx%d_sve2_svdot32" % (w, h),
                width=w, height=h)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 500)
            self.assertIn("svdot_s32", code)
            self.assertIn("svrshrnb_n_s32", code)
            self.assertIn("vqmovun_s16", code)
            self.assertIn("dynopt_interp8_%dx%d_sve2_svdot32" % (w, h),
                          code)

    def test_constants_present(self):
        code = emit_svdot32(
            func_name="dynopt_interp8_8x8_sve2_svdot32", width=8, height=8)
        self.assertIn("CB1_0", code)
        self.assertIn("CB2_0", code)
        self.assertIn("CB3_0", code)
        self.assertIn("IX0B_U0", code)
        self.assertIn("IX1B_U0", code)

    def test_no_addp(self):
        """svdot_s32 path should NOT use addp (no RMW pair-sum)."""
        code = emit_svdot32(
            func_name="dynopt_interp8_8x8_sve2_svdot32", width=8, height=8)
        self.assertNotIn("addp", code)

    def test_16x16_has_multiple_units(self):
        code = emit_svdot32(
            func_name="dynopt_interp8_16x16_sve2_svdot32", width=16, height=16)
        self.assertIn("IX0B_U0", code)
        self.assertIn("IX0B_U1", code)

    def test_32x32_has_multiple_windows(self):
        code = emit_svdot32(
            func_name="dynopt_interp8_32x32_sve2_svdot32", width=32, height=32)
        self.assertIn("W_0", code)
        self.assertIn("W_1", code)
        self.assertIn("IX0B_U3", code)


@unittest.skipUnless(_has_cross_compiler(), "cross compiler not available")
class TestInterp8WideSve2Compile(unittest.TestCase):

    def setUp(self):
        self.tmp = os.path.join(ROOT, "build", "tmp-test-interp8-wide")
        os.makedirs(self.tmp, exist_ok=True)

    def test_all_shapes_compile(self):
        for w, h in SHAPES:
            src = os.path.join(self.tmp, "svdot32_%dx%d.cpp" % (w, h))
            obj = os.path.join(self.tmp, "svdot32_%dx%d.o" % (w, h))
            code = emit_svdot32(func_name="dynopt_interp8_%dx%d_sve2_svdot32" % (w, h), width=w, height=h)
            with open(src, "w") as f:
                f.write(code)
            r = subprocess.run(
                [CC] + CXXFLAGS + ["-c", src, "-o", obj],
                capture_output=True, text=True)
            self.assertEqual(r.returncode, 0,
                             "compile %dx%d: %s" % (w, h, r.stderr))

    def test_static_counts_low_permute_ratio(self):
        sys.path.insert(0, os.path.join(ROOT, "tools"))
        from static_counts import static_counts
        for w, h in SHAPES:
            src = os.path.join(self.tmp, "svdot32_%dx%d.cpp" % (w, h))
            obj = os.path.join(self.tmp, "svdot32_%dx%d.o" % (w, h))
            code = emit_svdot32(func_name="dynopt_interp8_%dx%d_sve2_svdot32" % (w, h), width=w, height=h)
            with open(src, "w") as f:
                f.write(code)
            subprocess.run(
                [CC] + CXXFLAGS + ["-c", src, "-o", obj],
                check=True, capture_output=True)
            counts = static_counts(obj)
            self.assertLess(counts["permute_depth_ratio"], 0.30,
                            "permute_ratio %dx%d = %.3f" % (
                                w, h, counts["permute_depth_ratio"]))

    def test_isa_level_sve2(self):
        for w, h in SHAPES:
            obj = os.path.join(self.tmp, "svdot32_%dx%d.o" % (w, h))
            if not os.path.exists(obj):
                continue
            r = subprocess.run(
                [sys.executable,
                 os.path.join(ROOT, "tools", "check_isa_level.py"),
                 "--object", obj, "--level", "sve2",
                 "--objdump", "aarch64-linux-gnu-objdump"],
                capture_output=True, text=True)
            self.assertEqual(r.returncode, 0,
                             "isa check %dx%d: %s" % (w, h, r.stdout))
            self.assertIn("PASS", r.stdout)


@unittest.skipUnless(_has_cross_compiler() and _has_qemu(),
                     "cross compiler + QEMU required")
class TestInterp8WideSve2BitExact(unittest.TestCase):

    def setUp(self):
        self.tmp = os.path.join(ROOT, "build", "tmp-test-interp8-wide")
        os.makedirs(self.tmp, exist_ok=True)
        sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
        from interp8_emit import emit_interp8_hpp
        from interp8_op_ir import interp8_hpp_dag
        ref_src = ""
        for w, h in SHAPES:
            ref_src += emit_interp8_hpp(
                interp8_hpp_dag(w, h),
                func_name="dynopt_neon_interp8_%dx%d" % (w, h))
        ref_path = os.path.join(self.tmp, "neon_ref.cpp")
        with open(ref_path, "w") as f:
            f.write(ref_src)
        self.ref_obj = os.path.join(self.tmp, "neon_ref.o")
        subprocess.run(
            [CC, "-O2", "-march=armv8.2-a", "-c", ref_path,
             "-o", self.ref_obj],
            check=True, capture_output=True)

    def _qemu(self, args):
        qemu = os.environ.get("QEMU") or os.path.join(
            ROOT, "build", "qemu-build", "qemu-aarch64")
        return subprocess.run(
            [qemu, "-L", QEMU_SYSROOT,
             "-cpu", "max,sve-max-vq=%d" % args[0]] + list(args[1:]),
            capture_output=True, text=True)

    def test_bit_exact_8x8(self):
        self._check_shape(8, 8)

    def test_bit_exact_16x16(self):
        self._check_shape(16, 16)

    def test_bit_exact_32x32(self):
        self._check_shape(32, 32)

    def _check_shape(self, w, h):
        code = emit_svdot32(func_name="dynopt_interp8_%dx%d_sve2_svdot32" % (w, h), width=w, height=h)
        src = os.path.join(self.tmp, "svdot32_%dx%d.cpp" % (w, h))
        obj = os.path.join(self.tmp, "svdot32_%dx%d.o" % (w, h))
        with open(src, "w") as f:
            f.write(code)
        subprocess.run(
            [CC] + CXXFLAGS + ["-c", src, "-o", obj],
            check=True, capture_output=True)
        shape_str = "%dx%d" % (w, h)
        driver = (
            "#include <cstdint>\n"
            "#include <cstdio>\n"
            "#include <cstdlib>\n"
            "#include <cstring>\n"
            "extern \"C\" void dynopt_neon_interp8_%s("
            "const uint8_t*, intptr_t, uint8_t*, intptr_t, int);\n"
            "extern \"C\" void dynopt_interp8_%s_sve2_svdot32("
            "const uint8_t*, intptr_t, uint8_t*, intptr_t, int);\n"
            "static const int N = 100 * 96 + 96;\n"
            "static uint8_t a[N];\n"
            "int main() {\n"
            "    static uint8_t d1[N], d2[N];\n"
            "    long mism = 0;\n"
            "    srand(0x5EED);\n"
            "    for (int it = 0; it < 200; it++) {\n"
            "        int mode = it %% 6;\n"
            "        for (int i = 0; i < N; i++) {\n"
            "            switch (mode) {\n"
            "            case 0: a[i] = (uint8_t)(rand() %% 256); break;\n"
            "            case 1: a[i] = 0; break;\n"
            "            case 2: a[i] = 255; break;\n"
            "            case 3: a[i] = (uint8_t)(rand() %% 256); break;\n"
            "            case 4: a[i] = (uint8_t)(i * 7); break;\n"
            "            default: a[i] = (uint8_t)(rand() %% 256); break;\n"
            "            }\n"
            "        }\n"
            "        const uint8_t* pa = a + 3 * 96 + 8;\n"
            "        for (int ph = 1; ph <= 3; ph++) {\n"
            "            memset(d1, 0xAA, sizeof(d1));\n"
            "            memset(d2, 0xAA, sizeof(d2));\n"
            "            dynopt_interp8_%s_sve2_svdot32("
            "pa, 96, d1+3*96+8, 96, ph);\n"
            "            dynopt_neon_interp8_%s("
            "pa, 96, d2+3*96+8, 96, ph);\n"
            "            if (memcmp(d1, d2, sizeof(d1)) != 0) mism++;\n"
            "        }\n"
            "    }\n"
            "    printf(mism ? \"FAILED %%ld\\n\" : \"PASS\\n\", mism);\n"
            "    return mism != 0;\n"
            "}\n"
            % (shape_str, shape_str, shape_str, shape_str))
        drv = os.path.join(self.tmp, "drv_%dx%d.cpp" % (w, h))
        binp = os.path.join(self.tmp, "drv_%dx%d" % (w, h))
        with open(drv, "w") as f:
            f.write(driver)
        subprocess.run(
            [CC, "-O2", "-march=armv8.2-a+sve2", "-o", binp,
             drv, self.ref_obj, obj],
            check=True, capture_output=True)
        run = self._qemu((2, binp))
        self.assertEqual(run.returncode, 0,
                         run.stdout + run.stderr)
        self.assertIn("PASS", run.stdout, run.stdout)


if __name__ == "__main__":
    unittest.main()
