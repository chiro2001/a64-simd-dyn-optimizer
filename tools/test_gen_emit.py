#!/usr/bin/env python3
"""Smoke test for the generic MachineIR -> SVE2 emitter (docs/40 §6-20).

For every known kernel: load its seed MachineIR, assert the detected
recipe, generate the candidate for the best layout combo, and compile it
with aarch64-linux-gnu-g++ -fsyntax-only. This catches emitter regressions
like the pg16b batch-replace bug (2026-08-15) without running QEMU.

Usage: python3 tools/test_gen_emit.py [--compile 0|1]
"""

import argparse
import json
import os
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

import gen_sve2_emit as g  # noqa: E402


KERNELS = {
    # kernel: (seed recipe name, expected family, best combo)
    "sad": ("sad-16x16", "diff-sum", {}),
    "sad-32": ("sad-32x32", "diff-sum", {}),
    "sa8d": ("sa8d-8x8", "hadamard",
            {"pack": "evenpair", "reduce": "sve"}),
    "sa8d16": ("sa8d-16x16", "hadamard",
               {"pack": 2, "reduce_tail": "saddv"}),
    "satd-4": ("satd-4x4", "hadamard", {}),
    "satd-8": ("satd-8x8", "hadamard", {"pack": 2}),
    "satd-16": ("satd-16x16", "hadamard", {"pack": 2}),
    "satd-16x32": ("satd-16x32", "hadamard", {"pack": 2}),
    "satd-16x64": ("satd-16x64", "hadamard", {"pack": 2}),
    "satd-24x32": ("satd-24x32", "hadamard", {"pack": 2}),
    "satd-32x8": ("satd-32x8", "hadamard", {"pack": 2}),
    "satd-32x16": ("satd-32x16", "hadamard", {"pack": 2}),
    "satd-32x32": ("satd-32x32", "hadamard", {"pack": 2}),
    "satd-32x64": ("satd-32x64", "hadamard", {"pack": 2}),
    "satd-64x16": ("satd-64x16", "hadamard", {"pack": 2}),
    "satd-64x32": ("satd-64x32", "hadamard", {"pack": 2}),
    "satd-48x64": ("satd-48x64", "hadamard", {"pack": 2}),
    "satd-64x48": ("satd-64x48", "hadamard", {"pack": 2}),
    "satd-64x64": ("satd-64x64", "hadamard", {"pack": 2}),
    "satd-4x8": ("satd-4x8", "hadamard", {}),
    "satd-8x4": ("satd-8x4", "hadamard", {}),
    "satd-8x16": ("satd-8x16", "hadamard", {"pack": 2}),
    "satd-8x32": ("satd-8x32", "hadamard", {"pack": 2}),
    "satd-16x8": ("satd-16x8", "hadamard", {"pack": 2}),
    "satd-16x4": ("satd-16x4", "hadamard", {"pack": 2}),
    "interp8": ("interp8-8x8", "fir",
                {"compute": "sdot-h", "pairsum": "addp"}),
    "interp8-16": ("interp8-16x16", "fir",
                  {"compute": "sdot-h", "unroll": "loop",
                   "pairsum": "addp"}),
    "interp8-32": ("interp8-32x32", "fir",
                  {"compute": "sdot-h", "unroll": "full",
                   "pairsum": "addp"}),
    "interp4": ("interp4-16x16", "fir",
               {"compute": "sdot-h"}),
    "interp4-8": ("interp4-8x8", "fir",
                 {"compute": "sdot-h"}),
    "interp4-32": ("interp4-32x32", "fir",
                  {"compute": "sdot-h"}),
    "interp8vpp-8": ("interp8vpp-8", "vertical-fir", {"sliding": 2}),
    "interp8-hps-8": ("interp8-hps-8", "fir-ps",
                     {"compute": "sdot-d"}),
    "interp8-hps-8x8-ext": ("interp8-hps-8x8-ext", "fir-ps",
                            {"compute": "sdot-d"}),
    "interp8-hps-8x16-ext": ("interp8-hps-8x16-ext", "fir-ps",
                             {"compute": "sdot-d"}),
    "interp8-hps-16x16-ext": ("interp8-hps-16x16-ext", "fir-ps",
                              {"compute": "sdot-d"}),
    "interp8-hps-32x32-ext": ("interp8-hps-32x32-ext", "fir-ps",
                              {"compute": "sdot-d"}),
    "interp8-hps-8x16": ("interp8-hps-8x16", "fir-ps",
                         {"compute": "sdot-d"}),
    "interp8-hps-16x16": ("interp8-hps-16x16", "fir-ps",
                          {"compute": "sdot-d"}),
    "interp8-hps-32x32": ("interp8-hps-32x32", "fir-ps",
                          {"compute": "sdot-d"}),
    "interp8-vps-8x8": ("interp8-vps-8x8", "vertical-ps",
                        {"acc_split": 1}),
    "interp8-vps-8x16": ("interp8-vps-8x16", "vertical-ps", {}),
    "interp8-vps-16x32": ("interp8-vps-16x32", "vertical-ps", {}),
    "interp8-vsp-16x32": ("interp8-vsp-16x32", "vertical-sp", {}),
    "interp8-vss-16x32": ("interp8-vss-16x32", "vertical-ss", {}),
    "interp8-vsp-8x16": ("interp8-vsp-8x16", "vertical-sp", {}),
    "interp8-vss-8x16": ("interp8-vss-8x16", "vertical-ss", {}),
    "interp8-vps-16x16": ("interp8-vps-16x16", "vertical-ps",
                          {"acc_split": 1}),
    "interp8-vsp-8x8": ("interp8-vsp-8x8", "vertical-sp", {}),
    "interp8-vsp-16x16": ("interp8-vsp-16x16", "vertical-sp", {}),
    "interp8-vsp-32x32": ("interp8-vsp-32x32", "vertical-sp", {}),
    "interp8-vss-8x8": ("interp8-vss-8x8", "vertical-ss", {}),
    "interp8-vss-16x16": ("interp8-vss-16x16", "vertical-ss", {}),
    "interp8-vss-32x32": ("interp8-vss-32x32", "vertical-ss", {}),
    "interp8-vps-32x32": ("interp8-vps-32x32", "vertical-ps",
                          {"acc_split": 1}),
    "interp8vpp-16": ("interp8vpp-16", "vertical-fir", {"sliding": 3}),
    "interp8vpp-32": ("interp8vpp-32", "vertical-fir", {"sliding": 3}),
    "interp4vpp-16": ("interp4vpp-16", "vertical-fir", {"sliding": 3}),
}

SDOTH_KERNELS = {"interp8", "interp8-16", "interp8-32",
                 "interp4", "interp4-8", "interp4-32"}


def machine_ir_path(recipe):
    try:
        import yaml
        r = yaml.safe_load(open(os.path.join(ROOT, "seeds", recipe + ".yaml")))
        out = r["output"]["json"]
        return out if os.path.isabs(out) else os.path.join(ROOT, out)
    except Exception:
        return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--compile", type=int, default=1)
    args = ap.parse_args()
    fails = 0
    for kernel, (recipe, family, combo) in sorted(KERNELS.items()):
        path = machine_ir_path(recipe)
        if not path or not os.path.exists(path):
            print("MISS %s (%s): machine-ir not found" % (kernel, recipe))
            fails += 1
            continue
        mi = json.load(open(path))
        got = g.detect_family(mi)
        if got != family:
            print("FAM %s: expected %r got %r" % (kernel, family, got))
            fails += 1
            continue
        emit = g.make_generic_emitter(kernel)
        src = emit(combo)
        if args.compile:
            fd, tmp = tempfile.mkstemp(suffix=".cpp")
            os.write(fd, src.encode())
            os.close(fd)
            march = ("armv9.4-a+sve2p3" if kernel in SDOTH_KERNELS
                     else "armv8.2-a+sve2")
            cc = subprocess.run(
                ["aarch64-linux-gnu-g++", "-O3", "-std=c++11",
                 "-march=" + march, "-fsyntax-only", tmp],
                capture_output=True, text=True)
            os.unlink(tmp)
            if cc.returncode != 0:
                print("COMPILE %s:\n%s" % (kernel, cc.stderr[:400]))
                fails += 1
                continue
        print("OK   %s (%s, %d bytes)" % (kernel, family, len(src)))
    print("fails=%d" % fails)
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
