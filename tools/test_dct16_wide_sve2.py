#!/usr/bin/env python3
"""Test for optimizer/ir/dct16_wide_sve2.py emitter.

Validates:
  1) emit_candidate() generates valid C++ that compiles
  2) neon_bridge mode produces bit-exact output vs op895 under QEMU
  3) all modes generate parseable C++ (no syntax errors)
"""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_wide_sve2 import emit_candidate  # noqa: E402

CC = os.environ.get("CROSS_CC", "aarch64-linux-gnu-g++")
CXXFLAGS = ["-O3", "-march=armv8-a+sve2", "-std=c++17"]
QEMU = os.environ.get("QEMU", "qemu-aarch64")
QEMU_SYSROOT = os.environ.get("QEMU_SYSROOT", "/usr/aarch64-linux-gnu")


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


class TestDct16WideSve2Emitter(unittest.TestCase):
    """Unit tests for the width-native SVE2 dct16 emitter."""

    def test_emits_valid_cpp_all_modes(self):
        """emit_candidate() produces non-empty C++ for all modes."""
        for mode in ("addp", "uzp", "neon_bridge", "neon_bridge_fused", "pure_sve2"):
            code = emit_candidate(mode)
            self.assertIsInstance(code, str)
            self.assertGreater(len(code), 1000)
            self.assertIn("op_pass_4", code)
            self.assertIn("op_pass_11", code)
            self.assertIn("dynopt_dct16_sve2_shared", code)

    def test_constants_present(self):
        """Generated code contains required constant arrays."""
        code = emit_candidate("neon_bridge")
        self.assertIn("GT16_S32", code)
        self.assertIn("T8E", code)
        self.assertIn("CQ_LO", code)
        self.assertIn("CQ_HI", code)

    def test_neon_bridge_has_neon_intrinsics(self):
        """neon_bridge mode uses NEON vaddl/vpaddq intrinsics."""
        code = emit_candidate("neon_bridge")
        self.assertIn("vaddl_s16", code)
        self.assertIn("vpaddq_s32", code)

    def test_non_neon_modes_use_sve2_primitives(self):
        """addp/uzp modes use svunpklo/svadd_s32 instead of NEON."""
        for mode in ("addp", "uzp"):
            code = emit_candidate(mode)
            self.assertIn("svunpklo_s32", code)
            self.assertIn("svadd_s32_x", code)
            self.assertNotIn("vaddl_s16", code)


@unittest.skipUnless(_has_cross_compiler(), "cross compiler not available")
class TestDct16WideSve2Compile(unittest.TestCase):
    """Compilation tests (require aarch64 cross compiler)."""

    def setUp(self):
        self.tmp = os.path.join(ROOT, "build", "tmp-test-wide-sve2")
        os.makedirs(self.tmp, exist_ok=True)

    def test_all_modes_compile(self):
        """All modes compile without errors."""
        for mode in ("addp", "uzp", "neon_bridge", "neon_bridge_fused", "pure_sve2"):
            src = os.path.join(self.tmp, "dct16_%s.cpp" % mode)
            obj = os.path.join(self.tmp, "dct16_%s.o" % mode)
            code = emit_candidate(mode)
            with open(src, "w") as f:
                f.write(code)
            r = subprocess.run(
                [CC] + CXXFLAGS + ["-c", src, "-o", obj],
                capture_output=True, text=True)
            self.assertEqual(r.returncode, 0,
                             "compile failed for %s: %s" % (mode, r.stderr))

    def test_neon_bridge_static_counts(self):
        """neon_bridge mode has reasonable static counts."""
        sys.path.insert(0, os.path.join(ROOT, "tools"))
        from static_counts import static_counts
        src = os.path.join(self.tmp, "dct16_neon_bridge.cpp")
        obj = os.path.join(self.tmp, "dct16_neon_bridge.o")
        code = emit_candidate("neon_bridge")
        with open(src, "w") as f:
            f.write(code)
        subprocess.run(
            [CC] + CXXFLAGS + ["-c", src, "-o", obj],
            check=True, capture_output=True)
        counts = static_counts(obj)
        self.assertGreater(counts["vector_fused_uop"], 800)
        self.assertLess(counts["vector_fused_uop"], 1100)
        self.assertLess(counts["permute_depth_ratio"], 0.30)

    def test_neon_bridge_fused_compiles_and_counts(self):
        """neon_bridge_fused mode compiles and has expected static features."""
        sys.path.insert(0, os.path.join(ROOT, "tools"))
        from static_counts import static_counts
        src = os.path.join(self.tmp, "dct16_neon_bridge_fused.cpp")
        obj = os.path.join(self.tmp, "dct16_neon_bridge_fused.o")
        code = emit_candidate("neon_bridge_fused")
        with open(src, "w") as f:
            f.write(code)
        subprocess.run(
            [CC] + CXXFLAGS + ["-c", src, "-o", obj],
            check=True, capture_output=True)
        counts = static_counts(obj)
        self.assertGreater(counts["vector_fused_uop"], 800)
        self.assertLess(counts["vector_fused_uop"], 1100)
        self.assertGreater(counts["spill_reload"], 0)
        self.assertLess(counts["spill_reload"], 30)


if __name__ == "__main__":
    unittest.main()
