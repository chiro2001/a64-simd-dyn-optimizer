#!/usr/bin/env python3
"""build_release.py -- docs/87 step 4 single entry (P1-P4).

Input:  {x265 src, x265 bin (injected libx265), target machine, [preset]}
Output: {release.so, preset-<target>.txt, manifest.json, report.json}

Pipeline:
  P1 candidate generation -- cover registry (docs/88 schema) + emit cover
     sources (multicover.plan_covers) in stable ordinal order;
  P2 coarse screen -- bit-exact differential gate vs real upstream
     (libx265 primitives) on deterministic pseudo-random inputs
     (qemu/native); failing covers are excluded from the build;
  P3 build -- multicover .so with the surviving covers;
  P4 runtime arbitration -- AGO_BENCH under real interception
     (LD_PRELOAD + injected libx265) -> preset; validate against the
     registry; package release.so + preset + manifest.

Gated kernels are those with a shape spec in tools/bench_specs.py
(dct16/dct32/satd-8 today); other kernels enter P4 without a gate
(status=not-gated).

Example (external side, qemu proxy):
    python3 tools/build_release.py --kernels dct16,dct32 --out-dir release/qemu

Real machine (920B/710/950):
    python3 tools/build_release.py --target 920B --native
        --bin /path/to/injected-libx265-dir --out-dir release/920B
"""

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import tempfile
from datetime import datetime, timezone

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if os.path.join(ROOT, "tools") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "tools"))
if os.path.join(ROOT, "optimizer") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "optimizer"))

import cover_registry
import multicover
from bench_specs import spec as bench_spec

BUILDER = os.path.join(ROOT, "tools", "build_preload_so.py")
SELFCHECK = os.path.join(ROOT, "benchmarks", "ago_preload_selfcheck.cpp")
DEFAULT_LIBDIR = os.path.join(ROOT, "build", "x265-8-cross-sve2")
GATE_RE = re.compile(
    r"^GATE (\S+) (\d+) (pass|fail|missing_symbol) ?(\d+)?$", re.M)
BENCH_RE = re.compile(r"^dynopt: bench (\S+) ord=(\d+) ns/call=(\d+)$",
                      re.M)


# ---- pure helpers (unit-testable without toolchain) ----


def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 16), b""):
            h.update(chunk)
    return h.hexdigest()


def select_covers(gate_results):
    """Coarse-screen decision: keep passing / non-gated covers only.

    gate_results: {kernel: {id: {"status": "pass"|"fail"|"not-gated",
                                 "mismatches": int}}}
    Returns {kernel: sorted list of kept ids}.
    """
    out = {}
    for kernel, per_id in gate_results.items():
        out[kernel] = sorted(cid for cid, r in per_id.items()
                             if r["status"] != "fail")
    return out
def _parts(params):
    return [p.strip() for p in params.split(",") if p.strip()]


GATE_MAIN_TEMPLATE = r'''#include <cstdint>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <dlfcn.h>
#include "common/primitives.h"
using namespace X265_NS;
typedef void (*setup_t)(x265_param*);
extern "C" int dynopt_patch_primitives(void);
extern "C" int dynopt_patch_primitives(void) { return -1; }
int main(int argc, char** argv) {
    if (argc < 3) return 2;
    void* xh = dlopen("libx265.so.216", RTLD_NOW | RTLD_LOCAL);
    if (!xh) { fprintf(stderr, "gate: dlopen libx265 failed: %s\n", dlerror()); return 3; }
    setup_t setup = (setup_t)dlsym(xh, "_ZN4x26521x265_setup_primitivesEP10x265_param");
    x265_param p; memset(&p, 0, sizeof(p)); p.internalBitDepth = 8; p.cpuid = 0;
    setup(&p);
    EncoderPrimitives* P = (EncoderPrimitives*)dlsym(xh, "_ZN4x26510primitivesE");
    int iters = atoi(argv[2]);
    typedef @@RET@@ (*fn_t)(@@PARAMS@@);
    /* baseline BEFORE the probe .so loads (its ctor may patch slots) */
    fn_t up = (fn_t)(@@UPSTREAM@@);
    if (!up) { fprintf(stderr, "gate: upstream @@KERNEL@@ missing\n"); return 5; }
    void* ph = dlopen(argv[1], RTLD_NOW | RTLD_LOCAL);
    if (!ph) { fprintf(stderr, "gate: dlopen probe failed: %s\n", dlerror()); return 4; }
@@DECLS@@
@@COVERS@@
    return 0;
}
'''

GATE_COVER_BYTES = r'''    {
        fn_t cf = (fn_t)dlsym(ph, "dynopt_@@KERNEL@@_cov@@CID@@");
        if (!cf) { printf("GATE @@KERNEL@@ @@CID@@ missing_symbol 0\n"); }
        else {
        int bad = 0;
        for (int it = 0; it < iters; it++) {
            for (int i = 0; i < @@INSAMPLES@@; i++) {
                int16_t v = (int16_t)(((i * 73 + it * 131) & 511) - 256);
                memcpy((uint8_t*)ob0 + i * 2, &v, 2);
            }
            memset(oa@@OUTIDX@@, 0, @@OUTBYTES@@);
            memset(ob@@OUTIDX@@, 0, @@OUTBYTES@@);
            up(@@UPARGS@@);
            cf(@@COVERARGS@@);
            bad += memcmp(oa@@OUTIDX@@, ob@@OUTIDX@@, @@OUTBYTES@@) != 0;
        }
        printf("GATE @@KERNEL@@ @@CID@@ %s %d\n", bad == 0 ? "pass" : "fail", bad);
        }
    }
'''

GATE_COVER_RET = r'''    {
        fn_t cf = (fn_t)dlsym(ph, "dynopt_@@KERNEL@@_cov@@CID@@");
        if (!cf) { printf("GATE @@KERNEL@@ @@CID@@ missing_symbol 0\n"); }
        else {
        int bad = 0;
        for (int it = 0; it < iters; it++) {
            for (int i = 0; i < @@INBYTES@@; i++) {
                ((uint8_t*)ob0)[i] = (uint8_t)((i * 73 + it * 131) & 255);
                ((uint8_t*)ob1)[i] = (uint8_t)((i * 37 + it * 97 + 11) & 255);
            }
            int uv = up(@@UPARGS@@);
            int cv = cf(@@COVERARGS@@);
            bad += (uv != cv);
        }
        printf("GATE @@KERNEL@@ @@CID@@ %s %d\n", bad == 0 ? "pass" : "fail", bad);
        }
    }
'''


def _gate_cpp(kernel, spec, cover_ids):
    """Generate one differential-gate binary per gated kernel."""
    params = _parts(spec["params"])
    # buffers index POINTER params in order (0..nptr-1), not global
    # param positions (dct16: src=0,dst=1; satd-8: pix0=0,pix1=1)
    out_bi = None
    si = 0
    for p in params:
        if "*" in p:
            si += 1
            out_bi = si - 1          # last pointer param is the dst
    scalars = spec.get("call_scalars", spec["scalars"])
    bufs = spec["buffers"]
    cmpbytes = spec.get("compare_bytes", bufs[out_bi])

    decls = ["    alignas(64) static uint8_t ob%d[%d];" % (i, s)
             for i, s in enumerate(bufs)]
    decls.append("    alignas(64) static uint8_t oa%d[%d];"
                 % (out_bi, bufs[out_bi]))

    def call_args(out_tag):
        args = []
        si = 0
        bi = 0
        for i, p in enumerate(params):
            if "*" in p:
                base = "ob%d" % bi
                if bi == out_bi:
                    base = out_tag + str(bi)
                args.append("(%s*)%s" % (p[:p.rindex("*")].strip(), base))
                bi += 1
            else:
                args.append(str(scalars[si]))
                si += 1
        return ", ".join(args)

    tpl = GATE_COVER_RET if spec["compare"] == "return" else GATE_COVER_BYTES
    covers_out = []
    for cid in cover_ids:
        c = tpl.replace("@@KERNEL@@", kernel).replace("@@CID@@", str(cid))
        c = c.replace("@@INBYTES@@", str(bufs[0]))
        c = c.replace("@@INSAMPLES@@", str(bufs[0] // 2))
        c = c.replace("@@OUTIDX@@", str(out_bi))
        c = c.replace("@@OUTBYTES@@", str(cmpbytes))
        c = c.replace("@@UPARGS@@", call_args("oa"))
        c = c.replace("@@COVERARGS@@", call_args("ob"))
        covers_out.append(c)

    cpp = GATE_MAIN_TEMPLATE
    cpp = cpp.replace("@@RET@@", spec["ret"])
    cpp = cpp.replace("@@PARAMS@@", ", ".join(p.replace(" *", " ") for p in params))
    cpp = cpp.replace("@@UPSTREAM@@", spec["upstream"])
    cpp = cpp.replace("@@KERNEL@@", kernel)
    cpp = cpp.replace("@@DECLS@@", "\n".join(decls))
    cpp = cpp.replace("@@COVERS@@", "\n".join(covers_out))
    return cpp


PRESET_ENV_PREFIX = "AGO_PRESET="


def normalize_preset(s):
    """Runtime prints `AGO_PRESET=v1:...`; stored/parsed form is
    `v1:...` (docs/88). Accept both on the way in."""
    s = s.strip()
    if s.startswith(PRESET_ENV_PREFIX):
        s = s[len(PRESET_ENV_PREFIX):]
    return s


def _run(cmd, env=None, cwd=None, timeout=900):
    return subprocess.run(cmd, capture_output=True, text=True, env=env,
                          cwd=cwd, timeout=timeout)

def main():
    ap = argparse.ArgumentParser(prog="build_release.py",
                                 description=__doc__)
    ap.add_argument("--src", default=os.path.join(ROOT, "third_party",
                                                  "x265", "source"))
    ap.add_argument("--bin", default=DEFAULT_LIBDIR,
                    help="dir with injected libx265.so.216")
    ap.add_argument("--kernels", default="dct16",
                    help="comma separated kernel list")
    ap.add_argument("--target", choices=("qemu", "920B", "710", "950",
                                         "native"), default="qemu")
    ap.add_argument("--native", action="store_true",
                    help="run gates/bench natively (real machine)")
    ap.add_argument("--cpu", default="max,sve-max-vq=2",
                    help="qemu cpu ('' for native)")
    ap.add_argument("--out-dir", default=None)
    ap.add_argument("--workdir", default=None)
    ap.add_argument("--preset", default="",
                    help="preset file (or string, must start with v1:)")
    ap.add_argument("--gate-iters", type=int, default=500)
    ap.add_argument("--skip-gate", action="store_true")
    ap.add_argument("--bench-iters", default="800")
    ap.add_argument("--bench-rounds", default="3")
    ap.add_argument("--json", default="", help="report path override")
    args = ap.parse_args()

    kernels = [k.strip() for k in args.kernels.split(",") if k.strip()]
    if not kernels:
        raise SystemExit("--kernels required")
    workdir = args.workdir or tempfile.mkdtemp(prefix="buildrel-")
    os.makedirs(workdir, exist_ok=True)
    out_dir = args.out_dir or os.path.join(ROOT, "release", args.target)
    os.makedirs(out_dir, exist_ok=True)
    prefix = "" if args.native else "aarch64-linux-gnu-"
    qemu_prefix = [] if args.native else [
        "qemu-aarch64", "-cpu", args.cpu, "-L", "/usr/aarch64-linux-gnu"]
    env = dict(os.environ)
    env["LD_LIBRARY_PATH"] = args.bin

    def qemu_preload_prefix(cpu, preload_so, lib_dir):
        """qemu 11 guest-loader path: LD_PRELOAD in the process env is not
        honored by the guest (host ld errors / loader ignores it). Instead
        run the guest dynamic loader directly with --preload (docs/95)."""
        return ["qemu-aarch64", "-cpu", cpu, "-L", "/usr/aarch64-linux-gnu",
                "/usr/aarch64-linux-gnu/lib/ld-linux-aarch64.so.1",
                "--library-path", "/lib:" + lib_dir,
                "--preload", os.path.abspath(preload_so)]

    # ---- P1: registry + cover plans ----
    registry = cover_registry.build_ago_registry(kernels)
    errs = cover_registry.CoverRegistry.validate(registry)
    if errs:
        raise SystemExit("registry invalid: %s" % "; ".join(errs[:3]))
    plan = {}
    from ago_auto_search import KERNEL_COVERS
    no_covers = []
    for e in registry["kernels"]:
        covers, dflt = multicover.plan_covers(
            e["kernel"], e["default_symbol"],
            os.path.join(workdir, "cover-src"))
        plan[e["kernel"]] = {"covers": covers, "default_id": dflt}
        if not covers:
            no_covers.append(e["kernel"])
    if no_covers:
        supported = []
        for kk, (mm, _ss) in KERNEL_COVERS.items():
            try:
                mod = __import__(mm, fromlist=["cover_meta"])
                if mod.cover_meta().get("covers"):
                    supported.append(kk)
            except Exception:
                continue  # broken modules must not block the guard
        raise SystemExit(
            "P1: no registered multicover candidates for %s (kernel in"
            " KERNEL_COVERS but cover_meta() has no covers). This kernel"
            " is not releasable via build_release yet; supported kernels"
            " with covers today: %s"
            % (", ".join(no_covers), ", ".join(sorted(supported)) or
               "(none)"))

    report = {"target": args.target, "cpu": args.cpu, "kernels": kernels,
              "phases": {"p1": "registry + plans ok"}, "gates": {},
              "arms": {}, "preset": "", "errors": [], "excluded": {}}

    # ---- P2: coarse-screen probe build + differential gate ----
    probe_so = os.path.join(workdir, "probe-multicover.so")
    pb = _run([sys.executable, BUILDER, "--isa", "sve2",
               "--kernels", ",".join(kernels), "--multicover",
               "--bench-kernels", ",".join(kernels),
               "--out", probe_so, "--workdir", workdir])
    if pb.returncode != 0:
        raise SystemExit("P2 probe build failed:\n" + pb.stdout[-2500:])
    gate_results = {k: {} for k in kernels}
    if not args.skip_gate:
        for k in kernels:
            sp = bench_spec(k)
            if not sp:
                for c in plan[k]["covers"]:
                    gate_results[k][c["id"]] = {
                        "status": "not-gated", "mismatches": 0, "iters": 0}
                continue
            ids = [c["id"] for c in plan[k]["covers"]]
            gate_src = os.path.join(workdir, "gate-%s.cpp" % k)
            with open(gate_src, "w", encoding="utf-8") as f:
                f.write(_gate_cpp(k, sp, ids))
            gate_bin = os.path.join(workdir, "gate-%s" % k)
            gb = _run([prefix + "g++", "-O2", "-DX265_DEPTH=8",
                       "-I", args.src, "-I", args.bin, "-o", gate_bin,
                       gate_src, "-ldl", "-L", args.bin,
                       "-Wl,--unresolved-symbols=ignore-in-shared-libs",
                       "-Wl,-rpath-link,/usr/aarch64-linux-gnu/lib",
                       "-Wl,--export-dynamic", "-lx265"])
            if gb.returncode != 0:
                raise SystemExit("P2 gate %s build failed:\n%s"
                                 % (k, gb.stderr[-2000:]))
            gr = _run(qemu_prefix + [gate_bin, probe_so,
                                     str(args.gate_iters)], env=env)

            for m in GATE_RE.finditer(gr.stdout):
                _, kid, status, mism = m.groups()
                cid = int(kid)
                gate_results[k][cid] = {
                    "status": status, "iters": args.gate_iters,
                    "mismatches": int(mism or 0)}
            for c in plan[k]["covers"]:
                gate_results[k].setdefault(
                    c["id"], {"status": "no-run", "iters": 0,
                              "mismatches": -1})
            if gr.returncode != 0:
                report["errors"].append(
                    "P2 gate %s run failed:\n%s" % (k, gr.stderr[-1200:]))
    else:
        for k in kernels:
            for c in plan[k]["covers"]:
                gate_results[k][c["id"]] = {
                    "status": "not-gated", "iters": 0, "mismatches": 0}
    report["gates"] = gate_results
    report["phases"]["p2"] = "differential gate done"
    kept = select_covers(gate_results)
    empty = [k for k in kernels if not kept[k]]
    if empty:
        raise SystemExit(
            "P2 coarse screen: ALL covers failed for %s; refusing to"
            " release a legacy (non-multicover) .so. Summary: %s"
            % (", ".join(empty),
               json.dumps({k: gate_results[k] for k in empty})))
    excluded = {k: sorted(set(c["id"] for c in plan[k]["covers"])
                          - set(kept[k])) for k in kernels}
    report["excluded"] = {k: v for k, v in excluded.items() if v}

    # ---- P3: final multicover build with surviving covers ----
    final_so = os.path.join(out_dir, "release.so")
    cover_args = ";".join("%s=%s" % (k, ",".join(str(i) for i in kept[k]))
                          for k in kernels)
    fb = _run([sys.executable, BUILDER, "--isa", "sve2",
               "--kernels", ",".join(kernels), "--multicover",
               "--bench-kernels", ",".join(kernels),
               "--cover-ids", cover_args,
               "--out", final_so, "--workdir", workdir])
    if fb.returncode != 0:
        raise SystemExit("P3 final build failed:\n" + fb.stdout[-2500:])
    report["build_log"] = fb.stdout.strip().splitlines()[-12:]
    report["phases"]["p3"] = "release.so built"

    # ---- P4: runtime arbitration under real interception ----
    preset_str = None
    if args.preset:
        preset_str = normalize_preset(args.preset)
        if os.path.isfile(args.preset) and not preset_str.startswith("v1:"):
            preset_str = normalize_preset(
                open(args.preset, encoding="utf-8").read())
        try:
            preset = cover_registry.Preset.parse(preset_str)
        except ValueError as exc:
            raise SystemExit("invalid --preset: %s" % exc)
        ok, warns = preset.validate(registry)
        if not ok:
            raise SystemExit("preset fails registry validation: %s"
                             % "; ".join(warns))
        report["preset"] = preset_str
        report["chosen"] = preset.choices
        report["phases"]["p4"] = "preset supplied+validated (no bench)"
    else:
        host = os.path.join(workdir, "selfcheck")
        hb = _run([prefix + "g++", "-O2", "-DX265_DEPTH=8",
                   "-I", args.src, "-I", args.bin, "-o", host,
                   SELFCHECK, "-ldl", "-L", args.bin,
                   "-Wl,--unresolved-symbols=ignore-in-shared-libs",
                   "-Wl,-rpath-link,/usr/aarch64-linux-gnu/lib", "-lx265"])
        if hb.returncode != 0:
            raise SystemExit("P4 selfcheck host build failed:\n%s"
                             % hb.stderr[-2000:])
        libpath = os.path.join(args.bin, "libx265.so.216")
        if args.native:
            env2 = dict(env)
            env2["LD_PRELOAD"] = final_so
            env2["AGO_BENCH"] = "1"
            env2["AGO_BENCH_ITERS"] = args.bench_iters
            env2["AGO_BENCH_ROUNDS"] = args.bench_rounds
            br = _run(qemu_prefix + [host, libpath], env=env2)
        else:
            env2 = dict(env)
            env2["AGO_BENCH"] = "1"
            env2["AGO_BENCH_ITERS"] = args.bench_iters
            env2["AGO_BENCH_ROUNDS"] = args.bench_rounds
            br = _run(qemu_preload_prefix(args.cpu, final_so,
                                          args.bin) + [host, libpath],
                      env=env2)
        out = br.stdout + br.stderr
        m2 = re.search(r"^AGO_PRESET=.*$", br.stdout, re.M)
        if not m2 or br.returncode != 0 or "patched" not in out:
            report["errors"].append(
                "P4 bench/interception failed\n" + br.stderr[-1500:])
        else:
            preset_str = normalize_preset(m2.group(0))
            report["preset"] = preset_str
            report["chosen"] = {
                k: int(v) for k, v in
                (tok.split("=") for tok in preset_str.split(":")[-1]
                 .split(","))}
            for m3 in BENCH_RE.finditer(out):
                report["arms"].setdefault(m3.group(1), {})[
                    int(m3.group(2))] = int(m3.group(3))
        report["phases"]["p4"] = "runtime arbitration done"

    if report["errors"]:
        raise SystemExit("build_release failed:\n"
                         + "\n".join(report["errors"]))

    # ---- manifest (registry + gate + compile/hash per cover) ----
    manifest = {
        "schema_version": 1,
        "generated": "build_release",
        "machine": {"tag": args.target, "cpu": args.cpu,
                    "native": args.native,
                    "qemu": not args.native},
        "build": {"so": "release.so",
                  "so_sha256": sha256_file(final_so),
                  "built_at": datetime.now(timezone.utc)
                  .strftime("%Y-%m-%dT%H:%M:%SZ")},
        "preset": preset_str or "",
        "chosen": report.get("chosen", {}),
        "kernels": [],
    }
    for e in registry["kernels"]:
        k = e["kernel"]
        covers_out = [dict(c) for c in e["covers"]]
        for c in covers_out:
            if c["id"] == 0:
                continue
            src_path = next(p["src"] for p in plan[k]["covers"]
                            if p["id"] == c["id"])
            c["source_file"] = os.path.relpath(src_path, ROOT)
            c["sha256"] = sha256_file(src_path)
            c["compile"] = {"isa": "sve2"}
            c["gate"] = gate_results[k].get(
                c["id"], {"status": "no-run", "iters": 0, "mismatches": -1})
            c["excluded"] = c["id"] in excluded[k]
        manifest["kernels"].append(e)
    errs = cover_registry.CoverRegistry.validate(manifest)
    if errs:
        raise SystemExit("manifest invalid: %s" % "; ".join(errs[:3]))

    preset_path = os.path.join(out_dir, "preset-%s.txt" % args.target)
    if preset_str:
        with open(preset_path, "w", encoding="utf-8") as f:
            f.write(preset_str + "\n")
    with open(os.path.join(out_dir, "manifest.json"), "w",
              encoding="utf-8") as f:
        json.dump(manifest, f, ensure_ascii=False, indent=2, sort_keys=True)
        f.write("\n")
    report_path = args.json or os.path.join(out_dir, "report.json")
    with open(report_path, "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2, sort_keys=True)
        f.write("\n")

    print("build_release OK -> %s" % out_dir)
    print("  preset: %s" % (preset_str or "(none)"))
    print("  excluded: %s" % (report["excluded"] or "none"))
    print("  manifest: %s" % os.path.join(out_dir, "manifest.json"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
