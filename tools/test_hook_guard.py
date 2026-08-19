"""Regression tests for the multicover-aware setup hook (docs/95 §4).

The injected-lib hook must defer to the release .so's interposer when a
multicover marker (dynopt_preset_and_bench) is present; the legacy probe
era still relies on the setup-time call.
"""

import os
import subprocess
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))


def _inject_text():
    """Reconstructs what the two injectors write into primitives.cpp."""
    import tbl_md5
    src = os.path.join(ROOT, "third_party", "x265", "source", "common",
                       "primitives.cpp")
    orig = open(src, encoding="utf-8").read()
    s = orig
    state = tbl_md5._patch_primitives(src, "/tmp/test-hook-guard.bak")
    try:
        patched = open(src, encoding="utf-8").read()
    finally:
        if state == "patched":
            import shutil
            shutil.copyfile("/tmp/test-hook-guard.bak", src)
    return patched


class HookGuardTest(unittest.TestCase):
    def test_tbl_md5_injector_has_guard(self):
        patched = _inject_text()
        self.assertIn("dynopt_preset_and_bench", patched)
        self.assertIn("#ifndef RTLD_DEFAULT", patched)
        self.assertIn('"dynopt_preset_and_bench")', patched)
        self.assertIn("dynopt_patch_primitives();", patched)
        # the unguarded bare call (8-space indent inside x265_setup
        # primitives) must no longer be emitted; only the guarded one
        # (deeper indent) may appear
        self.assertNotIn("\n        dynopt_patch_primitives();\n", patched)

    def test_build_preload_so_injector_has_guard(self):
        src = os.path.join(ROOT, "tools", "build_preload_so.py")
        text = open(src, encoding="utf-8").read()
        self.assertIn("dynopt_preset_and_bench", text)
        self.assertIn("if (!dlsym(RTLD_DEFAULT,", text)


if __name__ == "__main__":
    unittest.main()
