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

    def test_bench_invalid_without_interception(self):
        # docs/87 sec.2: no interception -> INVALID, no preset line.
        r = self._qemu({"AGO_BENCH": "1"})
        self.assertEqual(r.returncode, 0, r.stderr)
        self.assertIn("BENCH INVALID", r.stderr)
        self.assertNotIn("AGO_PRESET=", r.stdout)

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


@unittest.skipUnless(
    os.path.isdir(os.path.join(ROOT, "build", "x265-8-cross-sve2")),
    "injected cross-built libx265 missing")
class InterceptionE2ETest(unittest.TestCase):
    """Real interception loop under qemu (docs/87 step 3)."""

    def test_positive_and_negative(self):
        r = subprocess.run(
            [sys.executable,
             os.path.join(ROOT, "tools", "verify_preload_local.py"),
             "--kernels", "dct16", "--iters", "400", "--rounds", "3",
             "--out", os.path.join(tempfile.mkdtemp(prefix="e2e-"),
                                   "report.json")],
            capture_output=True, text=True, timeout=600)
        self.assertEqual(r.returncode, 0,
                         "stdout=%s\nstderr=%s" % (r.stdout[-1500:],
                                                    r.stderr[-1500:]))
        self.assertIn("patched=1", r.stdout)
        self.assertIn("ord=0", r.stdout)          # upstream arm competed
        self.assertIn("AGO_PRESET=v1:m", r.stdout)  # preset produced (v1 grammar)
        self.assertIn("invalid=True", r.stdout)
        self.assertIn("preset_leaked=False", r.stdout)


if __name__ == "__main__":
    unittest.main()
