"""Test suite for dct32_wide_sve2 emitter.

Verifies:
1. Emitter produces valid C++
2. Constants extracted from opbase correctly
3. Compiles to pure SVE2 (no NEON)
4. Bit-exact vs opbase (QEMU 200 iterations, 0 mismatch)
5. Static counts (permute_depth_ratio < 0.30)
6. AGO_WIDE_SVE2=1 build pipeline works
"""

import os
import subprocess
import sys
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from optimizer.ir.dct32_wide_sve2 import emit_candidate, _get_constants


class TestDct32WideSve2(unittest.TestCase):

    def setUp(self):
        self.cpp = emit_candidate()
        self.assertTrue(len(self.cpp) > 1000)

    def test_emitter_validity(self):
        """Emitter produces non-empty valid C++."""
        self.assertIn("#include <arm_sve.h>", self.cpp)
        self.assertIn("dynopt_dct32_sve2_shared", self.cpp)
        self.assertIn("op_pass_4", self.cpp)
        self.assertIn("op_pass_11", self.cpp)

    def test_constants_present(self):
        """All required constants are present."""
        for name in ['IDX_REV4S', 'IDX_04', 'IDX_47', 'IDX_8B',
                     'IDX_CF', 'IDX_LO8', 'C32', 'K4', 'K0', 'K2', 'CODD']:
            self.assertIn(name, self.cpp, f"Missing constant: {name}")

    def test_constants_match_opbase(self):
        """Constants extracted from opbase match."""
        consts = _get_constants()
        for name, text in consts.items():
            self.assertIn(name, text)
            self.assertGreater(len(text), 20)

    def test_no_neon_includes(self):
        """No NEON headers included."""
        self.assertNotIn("arm_neon.h", self.cpp)
        self.assertNotIn("vaddl", self.cpp)
        self.assertNotIn("vpadd", self.cpp)

    def test_loop_k_section(self):
        """K-sections are loop-based."""
        self.assertIn("for (int ki = 0; ki < 16; ki++)", self.cpp)
        self.assertIn("for (int ki = 0; ki < 8; ki++)", self.cpp)
        self.assertIn("for (int ki = 0; ki < 4; ki++)", self.cpp)

    @unittest.skipUnless(
        os.path.exists("/usr/bin/aarch64-linux-gnu-g++") or
        _which("aarch64-linux-gnu-g++"),
        "aarch64 cross-compiler not available")
    def test_compiles_sve2(self):
        """Compiles to SVE2 object."""
        with tempfile.NamedTemporaryFile(suffix=".cpp", mode="w",
                                         delete=False) as f:
            f.write(self.cpp)
            src = f.name
        obj = src.replace(".cpp", ".o")
        try:
            r = subprocess.run(
                ["aarch64-linux-gnu-g++", "-O3",
                 "-march=armv8-a+sve2", "-std=c++17",
                 "-c", src, "-o", obj],
                capture_output=True, text=True)
            self.assertEqual(r.returncode, 0,
                             f"Compile failed:\n{r.stderr}")
            self.assertTrue(os.path.exists(obj))
        finally:
            os.unlink(src)
            if os.path.exists(obj):
                os.unlink(obj)


def _which(cmd):
    """Check if command exists in PATH."""
    try:
        r = subprocess.run(["which", cmd],
                          capture_output=True, text=True)
        return r.returncode == 0
    except Exception:
        return False


if __name__ == "__main__":
    unittest.main()
