#!/usr/bin/env python3
"""Test for tools/scan_permute_ratio.py scanner."""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))


def _has_cross_compiler():
    try:
        cc = os.environ.get("CROSS_CC", "aarch64-linux-gnu-g++")
        subprocess.run([cc, "--version"], capture_output=True, timeout=5)
        return True
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return False


class TestScanPermuteRatio(unittest.TestCase):

    def test_find_candidates_no_filter(self):
        from scan_permute_ratio import find_candidates
        cands = find_candidates()
        self.assertGreater(len(cands), 50)
        rels = [c[0] for c in cands]
        self.assertTrue(all("best_" in r for r in rels))
        self.assertTrue(all("candidates" in r for r in rels))

    def test_find_candidates_filter(self):
        from scan_permute_ratio import find_candidates
        cands = find_candidates("dct16")
        self.assertGreater(len(cands), 5)
        for rel, _ in cands:
            self.assertIn("dct16", rel)

    def test_find_candidates_excludes_proto(self):
        from scan_permute_ratio import find_candidates
        cands = find_candidates("interp8")
        for rel, _ in cands:
            self.assertNotIn("proto_", rel)


@unittest.skipUnless(_has_cross_compiler(), "cross compiler not available")
class TestScanPermuteRatioCompile(unittest.TestCase):

    def test_dct16_op895_low_ratio(self):
        """dct16 op895 (positive control) should have ratio < 0.30."""
        from scan_permute_ratio import compile_and_count
        import tempfile
        cpp = os.path.join(ROOT, "kernels/dct16/candidates/best_sve2_op895.cpp")
        with tempfile.TemporaryDirectory() as tmpdir:
            c = compile_and_count(cpp, "armv8.2-a+sve2", tmpdir)
            self.assertNotIn("compile_error", c, c.get("compile_error", ""))
            self.assertLess(c["permute_depth_ratio"], 0.30)

    def test_dct16_sve16_high_ratio(self):
        """dct16 sve16 (negative control) should have ratio > 0.40."""
        from scan_permute_ratio import compile_and_count
        import tempfile
        cpp = os.path.join(ROOT, "kernels/dct16/candidates/best_ir_sve16.cpp")
        with tempfile.TemporaryDirectory() as tmpdir:
            c = compile_and_count(cpp, "armv8.2-a+sve2", tmpdir)
            self.assertNotIn("compile_error", c, c.get("compile_error", ""))
            self.assertGreater(c["permute_depth_ratio"], 0.40)


if __name__ == "__main__":
    unittest.main()
