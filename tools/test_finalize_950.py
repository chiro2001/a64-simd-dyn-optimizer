#!/usr/bin/env python3
"""finalize_950.py dry-run and failure-path tests."""

import json
import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class Finalize950Test(unittest.TestCase):
    def _run(self, data):
        p = os.path.join(ROOT, "build", "tmp-f950-test.json")
        with open(p, "w") as f:
            json.dump(data, f)
        return subprocess.run(
            [sys.executable, os.path.join(ROOT, "tools",
                                          "finalize_950.py"),
             "--results", p, "--dry-run"],
            capture_output=True, text=True)

    def test_dry_run_ok(self):
        r = self._run({
            "frames": 30, "base_median_ms": 8900, "opt_median_ms": 8800,
            "ci_low_ms": 30, "ci_high_ms": 150,
            "base_md5": "abc", "opt_md5": "abc", "expect_md5": "abc"})
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
        self.assertIn("diff=-1.12%", r.stdout)
        self.assertIn("dry-run", r.stdout)

    def test_md5_mismatch_fails(self):
        r = self._run({
            "frames": 30, "base_median_ms": 8900, "opt_median_ms": 8800,
            "ci_low_ms": 30, "ci_high_ms": 150,
            "base_md5": "x", "opt_md5": "y"})
        self.assertEqual(r.returncode, 1)
        self.assertIn("bit-exact", r.stdout)

    def test_100f_media_gate(self):
        r = self._run({
            "frames": 100, "base_median_ms": 26000,
            "opt_median_ms": 25500, "ci_low_ms": 50, "ci_high_ms": 200,
            "base_md5": "abc", "opt_md5": "abc", "yuv_md5": "bad"})
        self.assertEqual(r.returncode, 1)
        self.assertIn("yuv md5", r.stdout)


if __name__ == "__main__":
    unittest.main()
