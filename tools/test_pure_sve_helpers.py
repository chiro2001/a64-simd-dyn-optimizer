#!/usr/bin/env python3
"""Pure-SVE primitive regression: generated smoke object must contain
zero NEON registers (check_isa_level --no-neon)."""

import json
import os
import subprocess
import sys
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from pure_sve_helpers import smoke_source  # noqa: E402


class PureSveHelpersTest(unittest.TestCase):

    def test_smoke_object_has_no_neon(self):
        src = os.path.join(ROOT, "build", "tmp-pure-sve-smoke.cpp")
        obj = os.path.join(ROOT, "build", "tmp-pure-sve-smoke.o")
        os.makedirs(os.path.dirname(src), exist_ok=True)
        with open(src, "w") as f:
            f.write(smoke_source())
        cxx = os.environ.get("CXX", "aarch64-linux-gnu-g++")
        r = subprocess.run([cxx, "-c", "-O2", "-march=armv8.2-a+sve2",
                            "-o", obj, src], capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr)
        g = subprocess.run(
            [sys.executable,
             os.path.join(ROOT, "tools", "check_isa_level.py"),
             "--object", obj, "--level", "sve2", "--json", "--no-neon",
             "--objdump", "aarch64-linux-gnu-objdump"],
            capture_output=True, text=True)
        self.assertEqual(g.returncode, 0, g.stdout + g.stderr)
        d = json.loads(g.stdout)
        self.assertEqual(d["neon_violations"], [])
        self.assertEqual(d["violations"], [])


if __name__ == "__main__":
    unittest.main()
