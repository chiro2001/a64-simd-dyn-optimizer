"""Unit tests for tools/final_gate.py parsing + loader shape (docs/87 step 8)."""

import os
import re
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import final_gate as fg


class ParseTest(unittest.TestCase):
    OUT = (
        "dynopt: AGO_PRESET applied (2 kernels)\n"
        "dynopt: bench dct16 ord=0 ns/call=2358\n"
        "dynopt: bench dct16 ord=1 ns/call=4635\n"
        "dynopt: bench dct32 ord=0 ns/call=18409\n"
        "dynopt: patched 2 x265 dispatch slot(s)\n"
        "AGO_PRESET=v1:mfd2a2bf4:dct16=0,dct32=0\n"
    )

    def test_arms_multiline(self):
        arms = {}
        for m in fg.BENCH_RE.finditer(self.OUT):
            arms.setdefault(m.group(1), {})[int(m.group(2))] = int(m.group(3))
        self.assertEqual(arms, {"dct16": {0: 2358, 1: 4635},
                                "dct32": {0: 18409}})

    def test_markers(self):
        self.assertTrue(fg.APPLIED_RE.search(self.OUT))
        m = fg.APPLIED_RE.search(self.OUT)
        self.assertEqual(int(m.group(1)), 2)
        self.assertEqual(fg.PATCHED_RE.search(self.OUT).group(1), "2")
        self.assertIsNone(fg.IGNORED_RE.search(self.OUT))

    def test_runtime_preset_line(self):
        got = [l for l in self.OUT.splitlines()
               if l.startswith("AGO_PRESET=v1:")]
        self.assertEqual(len(got), 1)
        self.assertTrue(got[0].endswith("dct16=0,dct32=0"))

    def test_guest_loader_shape(self):
        cmd = fg._guest_loader("max,sve-max-vq=2", ["/x/y"],
                               "/a/b/release.so")
        self.assertTrue(any("ld-linux-aarch64.so.1" in x for x in cmd))
        self.assertIn("--preload", cmd)
        self.assertEqual(cmd[cmd.index("--preload") + 1], "/a/b/release.so")
        self.assertIn("/lib:", cmd[cmd.index("--library-path") + 1])

    def test_guest_loader_no_preload(self):
        cmd = fg._guest_loader("max,sve-max-vq=2", ["/x/y"])
        self.assertNotIn("--preload", cmd)


if __name__ == "__main__":
    unittest.main()
