"""End-to-end test for the multicover runtime protocol (docs/87 step 2).

Builds an LD_PRELOAD .so with all three dct16 covers and drives the
generated AGO_PRESET / AGO_BENCH runtime through a small aarch64
dlopen harness under qemu-user.

NOTE: qemu-user at SVE VL=256 corrupts the guest return address after
heavy dct16_wide_sve2 (cov1/cov2) sweeps (see docs/89); AGO_BENCH runs
here are pinned to sve-max-vq=2 exactly like the other qemu gates.
"""

import os
import re
import shutil
import subprocess
import sys
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUILDER = os.path.join(ROOT, "tools", "build_preload_so.py")
DEFAULT = "aarch64-linux-gnu-"
QEMU = "qemu-aarch64"
SYSROOT = "/usr/aarch64-linux-gnu"

DRIVER_C = r"""
#include <dlfcn.h>
#include <stdio.h>
int main(int argc, char** argv) {
    if (argc < 2) return 1;
    void* h = dlopen(argv[1], RTLD_NOW | RTLD_LOCAL);
    if (!h) { fprintf(stderr, "dlopen failed: %s\n", dlerror()); return 2; }
    void (*fn)(void) = (void (*)(void))dlsym(h, "dynopt_preset_and_bench");
    if (!fn) { fprintf(stderr, "dlsym failed: %s\n", dlerror()); return 3; }
    fn();
    return 0;
}
"""


def _run(cmd, env=None, cwd=None):
    return subprocess.run(cmd, capture_output=True, text=True, env=env,
                          cwd=cwd, timeout=600)


@unittest.skipUnless(
    shutil.which(DEFAULT + "g++") and shutil.which(QEMU) and
    os.path.isdir(SYSROOT), "aarch64 cross toolchain / qemu missing")
class MulticoverSoTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tmp = tempfile.mkdtemp(prefix="mc-so-")
        cls.so = os.path.join(cls.tmp, "dynopt-mc-dct16.so")
        work = os.path.join(cls.tmp, "work")
        r = _run([sys.executable, BUILDER, "--isa", "sve2",
                  "--kernels", "dct16", "--multicover",
                  "--bench-kernels", "dct16", "--out", cls.so,
                  "--workdir", work])
        cls.build_ok = (r.returncode == 0)
        if not cls.build_ok:
            raise RuntimeError("multicover build failed:\n" + r.stdout[-1500:])
        cls.driver = os.path.join(cls.tmp, "mc_driver")
        src = os.path.join(cls.tmp, "mc_driver.c")
        with open(src, "w") as f:
            f.write(DRIVER_C)
        _run([DEFAULT + "gcc", "-o", cls.driver, src, "-ldl"])
        cls.nm = _run([DEFAULT + "nm", "-D", cls.so]).stdout

    def _qemu(self, extra_env=None, cpu="max,sve-max-vq=2"):
        qcmd = [QEMU, "-cpu", cpu, "-L", SYSROOT]
        env = dict(os.environ)
        if extra_env:
            env.update(extra_env)
        return _run(qcmd + [self.driver, self.so], env=env)

    def test_exported_symbols(self):
        for sym in ("dynopt_dct16_cov1", "dynopt_dct16_cov2",
                    "dynopt_dct16_cov3", "dynopt_preset_and_bench"):
            self.assertIn(" T %s" % sym, self.nm, sym)

    def test_bench_produces_preset(self):
        r = self._qemu({"AGO_BENCH": "1"})
        self.assertEqual(r.returncode, 0, r.stderr)
        m = re.search(r"^AGO_PRESET=m[0-9a-f]{8}:dct16=[123]$",
                      r.stdout.strip(), re.M)
        self.assertTrue(m, "stdout=%r stderr=%r" % (r.stdout, r.stderr))

    def test_fingerprint_mismatch_fallback(self):
        r = self._qemu({"AGO_PRESET": "v1:m00000000:dct16=3"}, cpu="max")
        self.assertEqual(r.returncode, 0, r.stderr)
        self.assertIn("fingerprint mismatch", r.stderr)

    def test_valid_preset_applies(self):
        r = self._qemu({"AGO_PRESET": "v1:m00000000:dct16=3"}, cpu="max")
        host = re.search(r"host=(m[0-9a-f]{8})", r.stderr)
        self.assertTrue(host, r.stderr)
        r2 = self._qemu({"AGO_PRESET": "v1:%s:dct16=3" % host.group(1)},
                        cpu="max")
        self.assertEqual(r2.returncode, 0, r2.stderr)
        self.assertIn("AGO_PRESET applied", r2.stderr)

    def test_out_of_whitelist_and_unknown(self):
        r = self._qemu({"AGO_PRESET": "v1:m00000000:dct16=99"}, cpu="max")
        host = re.search(r"host=(m[0-9a-f]{8})", r.stderr)
        base = "v1:%s:" % host.group(1)
        for bad in ("dct16=99", "nope=1", "dct16=x"):
            r2 = self._qemu({"AGO_PRESET": base + bad}, cpu="max")
            self.assertEqual(r2.returncode, 0, r2.stderr)
            self.assertIn("ignored", r2.stderr, bad)
        r3 = self._qemu({"AGO_PRESET": "v0:m00000000:dct16=3"}, cpu="max")
        self.assertIn("bad version", r3.stderr)


if __name__ == "__main__":
    unittest.main()
