#!/usr/bin/env python3
"""Interception self-check + benchmark-skeleton verification (docs/87 step 3).

Runs the real interception loop end to end:

  positive: cross-built x265 + multicover .so preload + AGO_BENCH=1 ->
            "patched N x265 dispatch slot(s)", per-arm ns lines, an
            AGO_PRESET=... line (ord 0 when upstream wins, i.e. explicit
            no-injection).  The multicover .so ships its own
            x265_setup_primitives interposer (docs/95 §3), so a plain
            (non-source-injected) libx265 is sufficient.
  negative: the .so in a process with no x265 + AGO_BENCH=1 ->
            "BENCH INVALID (interception failed)" and no preset line.

Default CPU pins qemu to sve-max-vq=2 (the repo-wide qemu SVE quirk at
VL=256, see docs/89).  On real 920B/710/950 hardware pass --native
(and optionally --cpu '') to execute on silicon.

qemu note: qemu-user does not honour the LD_PRELOAD env var for the
guest (the host ld.so rejects the aarch64 .so as "incompatible ELF
machine").  Under qemu the loader is invoked directly with
`--preload <abs so>` (docs/95 §3); --native still uses LD_PRELOAD.
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUILDER = os.path.join(ROOT, "tools", "build_preload_so.py")

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

SELFCHECK_C = """// generated from benchmarks/ago_preload_selfcheck.cpp
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>
#include "common/primitives.h"
using namespace X265_NS;
typedef void (*setup_t)(x265_param*);
int main(int argc, char** argv) {
    const char* lib = (argc > 1) ? argv[1] : "libx265.so.216";
    const char* x265lib = getenv("X265_LIB");
    if (x265lib) lib = x265lib;
    // RTLD_GLOBAL makes libx265 symbols globally visible so the
    // preloaded multicover .so's x265_setup_primitives interposer
    // wins the global PLT lookup (docs/95 §3).  Under RTLD_LOCAL the
    // dlsym below would resolve to libx265's own setup and bypass the
    // interposer entirely.
    void* xh = dlopen(lib, RTLD_NOW | RTLD_GLOBAL);
    if (!xh) { fprintf(stderr, "selfcheck: dlopen %s failed: %s\\n", lib, dlerror()); return 3; }
    setup_t setup = (setup_t)dlsym(RTLD_DEFAULT, "_ZN4x26521x265_setup_primitivesEP10x265_param");
    if (!setup) setup = (setup_t)dlsym(xh, "_ZN4x26521x265_setup_primitivesEP10x265_param");
    if (!setup) { fprintf(stderr, "selfcheck: setup symbol missing\\n"); return 4; }
    x265_param p; memset(&p, 0, sizeof(p)); p.internalBitDepth = 8; p.cpuid = 0;
    setup(&p);
    EncoderPrimitives* P = (EncoderPrimitives*)dlsym(xh, "_ZN4x26510primitivesE");
    if (!P) { fprintf(stderr, "selfcheck: primitives missing\\n"); return 5; }
    void (*df)(const int16_t*, int16_t*, intptr_t) = P->cu[BLOCK_16x16].dct;
    if (!df) { fprintf(stderr, "selfcheck: dct16 slot empty\\n"); return 6; }
    static int16_t src[16 * 16 + 64], dst[16 * 16 + 64];
    for (int i = 0; i < 1000; i++) df(src, dst, 64);
    fprintf(stderr, "selfcheck: dct16 fn=%p iters=1000 ok\\n", (void*)df);
    return 0;
}
"""


def _run(cmd, env=None, cwd=None, timeout=600):
    return subprocess.run(cmd, capture_output=True, text=True, env=env,
                          cwd=cwd, timeout=timeout)


SYSROOT = "/usr/aarch64-linux-gnu"
GUEST_LD = SYSROOT + "/lib/ld-linux-aarch64.so.1"


def _qemu_prefix(cpu):
    if not cpu:
        return []
    return ["qemu-aarch64", "-cpu", cpu, "-L", SYSROOT]


def _pos_cmd(args, so, host, lib):
    """Build the positive-test command line.

    qemu: invoke the guest loader directly with --preload so the
    multicover .so is loaded into the guest (LD_PRELOAD env does not
    work under qemu-user, docs/95 §3).  native: plain LD_PRELOAD.
    """
    if args.native:
        return [host, lib]
    libpath = ":".join([SYSROOT + "/lib", args.lib_dir,
                       os.path.dirname(so) or "."])
    return (["qemu-aarch64", "-cpu", args.cpu, "-L", SYSROOT,
             GUEST_LD,
             "--library-path", libpath,
             "--preload", os.path.abspath(so),
             host, lib])


def _neg_cmd(args, driver, so):
    """Negative test: driver dlopens the .so itself; no preload needed."""
    return _qemu_prefix(args.cpu if not args.native else "") + [driver, so]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--kernels", default="dct16",
                    help="comma list (default dct16)")
    ap.add_argument("--lib-dir",
                    default=os.path.join(ROOT, "build", "x265-8-cross-sve2"),
                    help="dir containing libx265.so.216 (injected build)")
    ap.add_argument("--workdir", default=tempfile.mkdtemp(prefix="vpl-"))
    ap.add_argument("--out", default=None, help="JSON report path")
    ap.add_argument("--cpu", default="max,sve-max-vq=2",
                    help="qemu cpu ('' for native)")
    ap.add_argument("--native", action="store_true",
                    help="run binaries natively (real 920B/710/950)")
    ap.add_argument("--iters", default="1000")
    ap.add_argument("--rounds", default="3")
    ap.add_argument("--budget-ms", default="4000")
    ap.add_argument("--maxord", default="", help="AGO_BENCH_MAXORD override")
    ap.add_argument("--positive-only", action="store_true")
    ap.add_argument("--negative-only", action="store_true")
    args = ap.parse_args()

    kernels = [k.strip() for k in args.kernels.split(",") if k.strip()]
    prefix = "" if args.native else "aarch64-linux-gnu-"
    os.makedirs(args.workdir, exist_ok=True)

    so = os.path.join(args.workdir, "dynopt-mc.so")
    build = _run([sys.executable, BUILDER, "--isa", "sve2",
                  "--kernels", ",".join(kernels), "--multicover",
                  "--bench-kernels", ",".join(kernels), "--out", so,
                  "--workdir", args.workdir])
    if build.returncode != 0:
        print("FATAL: multicover build failed\n" + build.stdout[-2000:])
        return 2

    host_src = os.path.join(args.workdir, "selfcheck.cpp")
    with open(host_src, "w") as f:
        f.write(SELFCHECK_C)
    host = os.path.join(args.workdir, "selfcheck")
    lib = os.path.join(args.lib_dir, "libx265.so.216")
    # Link against the injected lib but leave dynopt_patch_primitives
    # unresolved at link time: it must come from LD_PRELOAD at runtime
    # (this is the real deployment shape).
    hb = _run([prefix + "g++", "-O2", "-DX265_DEPTH=8",
               "-I", os.path.join(ROOT, "third_party", "x265", "source"),
               "-I", args.lib_dir, "-o", host, host_src, "-ldl",
               "-L", args.lib_dir,
               "-Wl,--unresolved-symbols=ignore-in-shared-libs",
               "-Wl,-rpath-link,/usr/aarch64-linux-gnu/lib", "-lx265"])
    if hb.returncode != 0:
        print("FATAL: selfcheck host build failed\n" + hb.stderr[-2000:])
        return 2

    drv_src = os.path.join(args.workdir, "driver.c")
    with open(drv_src, "w") as f:
        f.write(DRIVER_C)
    driver = os.path.join(args.workdir, "driver")
    _run([prefix + "gcc", "-o", driver, drv_src, "-ldl"])

    env = dict(os.environ)
    env["LD_LIBRARY_PATH"] = args.lib_dir
    env["AGO_BENCH"] = "1"
    env["AGO_BENCH_ITERS"] = args.iters
    env["AGO_BENCH_ROUNDS"] = args.rounds
    env["AGO_BENCH_BUDGET_MS"] = args.budget_ms
    if args.maxord:
        env["AGO_BENCH_MAXORD"] = args.maxord

    report = {"kernels": args.kernels, "cpu": args.cpu,
              "libx265": lib, "qemu": not args.native}

    if not args.negative_only:
        env2 = dict(env)
        # native uses LD_PRELOAD; qemu uses the loader --preload flag
        # (built into _pos_cmd) and must not inherit LD_PRELOAD, or the
        # host ld.so rejects the aarch64 .so as incompatible ELF.
        if args.native:
            env2["LD_PRELOAD"] = so
        else:
            env2.pop("LD_PRELOAD", None)
        pos = _run(_pos_cmd(args, so, host, lib), env=env2)
        out = pos.stdout + pos.stderr
        m = re.search(r"patched (\d+) x265 dispatch slot\(s\)", out)
        preset_match = re.search(r"^AGO_PRESET=.*$", pos.stdout, re.M)
        report["positive"] = {
            "returncode": pos.returncode,
            "intercepted": bool(m),
            "patched_slots": int(m.group(1)) if m else 0,
            "preset": preset_match.group(0) if preset_match else "",
            "arms": re.findall(r"dynopt: bench (\S+) ord=(\d+) ns/call=(\d+)",
                               out),
            "chosen": re.findall(r"dynopt: bench (\S+) chosen=ord(-?\d+) "
                                 r"ns=(\d+) upstream_ns=(\d+)", out),
            "stderr_tail": pos.stderr[-1200:],
        }
        ok = pos.returncode == 0 and report["positive"]["intercepted"] \
            and report["positive"]["preset"]
        print("positive: exit=%d intercepted=%s patched=%d preset=%r"
              % (pos.returncode, report["positive"]["intercepted"],
                 report["positive"]["patched_slots"],
                 report["positive"]["preset"]))
        for arm in report["positive"]["arms"]:
            print("  bench %-8s ord=%-2s ns=%s" % (arm[0], arm[1], arm[2]))
        for c in report["positive"]["chosen"]:
            print("  chosen %-8s ord=%-3s ns=%-8s upstream_ns=%s"
                  % (c[0], c[1], c[2], c[3]))
        if not ok:
            print("stderr:\n" + report["positive"]["stderr_tail"])
            return 1

    if not args.positive_only:
        neg = _run(_neg_cmd(args, driver, so), env=env)
        report["negative"] = {
            "returncode": neg.returncode,
            "invalid": "BENCH INVALID" in neg.stderr,
            "preset_leaked": bool(re.search(r"^AGO_PRESET=", neg.stdout,
                                            re.M)),
            "stderr": neg.stderr[-800:],
        }
        ok = report["negative"]["returncode"] == 0 \
            and report["negative"]["invalid"] \
            and not report["negative"]["preset_leaked"]
        print("negative: exit=%d invalid=%s preset_leaked=%s"
              % (neg.returncode, report["negative"]["invalid"],
                 report["negative"]["preset_leaked"]))
        if not ok:
            print("stderr:\n" + report["negative"]["stderr"])
            return 1

    if args.out:
        with open(args.out, "w") as f:
            json.dump(report, f, indent=2)
        print("report: %s" % args.out)
    print("step-3 verification PASSED")
    return 0


if __name__ == "__main__":
    sys.exit(main())
