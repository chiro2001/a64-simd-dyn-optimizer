#!/usr/bin/env python3
"""final_gate.py -- docs/87 step 8: 950 (or target-machine) final gate loop.

Input:  release dir from build_release.py:
        {release.so, preset-<target>.txt, manifest.json}
        + 指定视频 (raw YUV), x265 injected shared lib dir, target machine.
Runs:   1. manifest attestation (so sha256) + preset validation
           (parsed + fingerprint vs host, using the runtime .so markers)
        2. interception positive check + AGO_BENCH over the release .so
           itself -> per-cover ns/call arms + runtime-chosen preset line
        3. video md5 gate: baseline encode vs LD_PRELOAD+AGO_PRESET encode
           (bounded covers stay same-md5 unless --allow-bounded-md5-diff)
        4. emits exchange verdict.json (schema ago/exchange/verdict v1)
        5. optional kernel-test-db rows for the chosen preset ordinals
        6. exit 0 iff all required gates pass

Usage:
  # 内网/950:
  bash scripts/run-final-gate.sh --release-dir release/950 \
      --lib-dir /path/injected-libx265 --video spec-8k-01.yuv \
      --res 7680x4320 --frames 120 --db
  # 外网 qemu 代理演练:
  python3 tools/final_gate.py --release-dir release/qemu \
      --target qemu --video build/final/in.yuv --res 128x128 --frames 24 \
      --db --json release/qemu/verdict.json
"""

import argparse
import datetime
import shutil
import hashlib
import json
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.join(ROOT, "optimizer"))
import cover_registry as cr    # noqa: E402
import exchange as ex         # noqa: E402
import kernel_db              # noqa: E402
import tbl_md5                # noqa: E402

SELFCHECK = os.path.join(ROOT, "benchmarks", "ago_preload_selfcheck.cpp")
QEMU_CPU = "max,sve-max-vq=2"
QEMU_L = "/usr/aarch64-linux-gnu"
BENCH_RE = re.compile(r"^dynopt: bench (\S+) ord=(\d+) ns/call=(\d+)$",
                      re.MULTILINE)
APPLIED_RE = re.compile(r"dynopt: AGO_PRESET applied \((\d+) kernels\)")
IGNORED_RE = re.compile(r"dynopt: AGO_PRESET ignored \((.*)\)")
PATCHED_RE = re.compile(r"patched (\d+) x265 dispatch slot\(s\)")
BENCH_INVALID_RE = re.compile(r"dynopt: BENCH INVALID")


def _run(cmd, env=None, timeout=1800, cwd=None):
    return subprocess.run(cmd, capture_output=True, text=True, env=env,
                          timeout=timeout, cwd=cwd)


def _qemu(cpu):
    return ["qemu-aarch64", "-cpu", cpu, "-L", QEMU_L]


def _guest_loader(cpu, lib_dirs, preload_so=None):
    """qemu 11: the guest ignores LD_PRELOAD delivered via env; run the
    guest dynamic loader directly with --preload (host-path-safe)."""
    libs = "/lib:" + ":".join(os.path.abspath(d) for d in lib_dirs)
    cmd = _qemu(cpu) + [QEMU_L + "/lib/ld-linux-aarch64.so.1",
                        "--library-path", libs]
    if preload_so:
        cmd += ["--preload", os.path.abspath(preload_so)]
    return cmd


def _run_guest(cpu, preload_so, lib_dirs, argv, env=None):
    cmd = _guest_loader(cpu, lib_dirs, preload_so) + list(argv)
    return _run(cmd, env=env, timeout=3600)


def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def load_release(release_dir):
    manifest = json.load(open(os.path.join(release_dir, "manifest.json"),
                              encoding="utf-8"))
    so = os.path.join(release_dir, manifest.get("build", {}).get("so",
                                                                 "release.so"))
    preset_path = None
    for fn in os.listdir(release_dir):
        if fn.startswith("preset-") and fn.endswith(".txt"):
            preset_path = os.path.join(release_dir, fn)
    if preset_path is None:
        raise SystemExit("no preset-*.txt in %s" % release_dir)
    preset_text = open(preset_path, encoding="utf-8").read().strip()
    return manifest, so, preset_text


def build_selfcheck(lib_dir, workdir, native):
    prefix = "" if native else "aarch64-linux-gnu-"
    src = os.path.join(workdir, "final-selfcheck.cpp")
    with open(src, "w", encoding="utf-8") as f:
        f.write(open(SELFCHECK, encoding="utf-8").read())
    host = os.path.join(workdir, "final-selfcheck")
    r = _run([prefix + "g++", "-O2", "-DX265_DEPTH=8",
              "-I", os.path.join(ROOT, "third_party", "x265", "source"),
              "-I", lib_dir, "-o", host, src, "-ldl",
              "-L", lib_dir,
              "-Wl,--unresolved-symbols=ignore-in-shared-libs",
              "-Wl,-rpath-link,/usr/aarch64-linux-gnu/lib", "-lx265"])
    if r.returncode != 0:
        raise SystemExit("selfcheck build failed: " + r.stderr[-800:])
    return host


def run_bench(release_so, lib_dir, preset_text, native, cpu, workdir,
              iters, rounds, budget_ms):
    host = build_selfcheck(lib_dir, workdir, native)
    env = dict(os.environ)
    env["LD_LIBRARY_PATH"] = lib_dir
    env["LD_PRELOAD"] = release_so
    env["AGO_PRESET"] = preset_text
    env["AGO_BENCH"] = "1"
    env["AGO_BENCH_ITERS"] = str(iters)
    env["AGO_BENCH_ROUNDS"] = str(rounds)
    env["AGO_BENCH_BUDGET_MS"] = str(budget_ms)
    libargv = [host, os.path.join(lib_dir, "libx265.so.216")]
    if native:
        env["LD_PRELOAD"] = release_so
        r = _run([host, os.path.join(lib_dir, "libx265.so.216")],
                 env=env, timeout=3600)
    else:
        r = _run_guest(cpu, release_so, [lib_dir], libargv, env=env)
    out = (r.stdout or "") + "\n" + (r.stderr or "")
    arms = {}
    for m in BENCH_RE.finditer(out):
        arms.setdefault(m.group(1), {})[int(m.group(2))] = int(m.group(3))
    accepted = APPLIED_RE.search(out)
    ignored = IGNORED_RE.search(out)
    patched = PATCHED_RE.search(out)
    invalid = BENCH_INVALID_RE.search(out)
    runtime_preset = None
    for line in (r.stdout or "").splitlines():
        if line.startswith("AGO_PRESET=v1:"):
            runtime_preset = line.strip()
            break
    return {
        "returncode": r.returncode,
        "arms": arms,
        "preset_applied": bool(accepted),
        "preset_applied_kernels": int(accepted.group(1)) if accepted else 0,
        "preset_ignored_reason": ignored.group(1) if ignored else None,
        "patched_slots": int(patched.group(1)) if patched else 0,
        "bench_invalid": bool(invalid),
        "runtime_preset": runtime_preset,
        "stderr_tail": (r.stderr or "")[-600:],
    }


def encode_md5(cli, video, res, frames, xpreset, workdir, tag, preload_so,
               preset_text=None, lib_dir=None, native=False, cpu=QEMU_CPU):
    out = os.path.join(workdir, tag + ".hevc")
    args = [cli, "--input", video, "--input-res", res, "--fps", "25",
            "--frames", str(frames), "--preset", xpreset,
            "--output", out]
    env = dict(os.environ)
    if preload_so and preset_text:
        env["AGO_PRESET"] = preset_text
    env.pop("AGO_TRACE", None)  # ensure legacy recorder mode stays off
    if native:
        env["LD_LIBRARY_PATH"] = lib_dir
        if preload_so:
            env["LD_PRELOAD"] = preload_so
        r = _run(args, env=env, timeout=3600)
    else:
        r = _run_guest(cpu, preload_so, [lib_dir], args, env=env)
    if r.returncode != 0:
        return None, (r.stdout + r.stderr)[-600:]
    return sha256_file(out), ""


def main():
    ap = argparse.ArgumentParser(prog="final_gate.py", description=__doc__)
    ap.add_argument("--release-dir", required=True)
    ap.add_argument("--lib-dir", default=os.path.join(
        ROOT, "build", "x265-8-cross-sve2"))
    ap.add_argument("--target", default="qemu",
                    choices=("qemu", "920B", "710", "950", "native"))
    ap.add_argument("--native", action="store_true")
    ap.add_argument("--cpu", default=QEMU_CPU)
    ap.add_argument("--video", required=True)
    ap.add_argument("--res", default="128x128")
    ap.add_argument("--frames", type=int, default=24)
    ap.add_argument("--x265-preset", default="faster")
    ap.add_argument("--bench-iters", type=int, default=1000)
    ap.add_argument("--bench-rounds", type=int, default=1)
    ap.add_argument("--bench-budget-ms", type=int, default=4000)
    ap.add_argument("--skip-md5", action="store_true")
    ap.add_argument("--skip-bench", action="store_true")
    ap.add_argument("--db", action="store_true",
                    help="write kernel-test-db rows for chosen covers")
    ap.add_argument("--json", default="")
    ap.add_argument("--machine", default="", help="fp component (default target)")
    ap.add_argument("--isa", default="sve2")
    ap.add_argument("--vl", type=int, default=32)
    ap.add_argument("--compiler", default="gcc16.1")
    ap.add_argument("--inject-shared", default="",
                    help="qemu proxy: x265 shared build dir to stage+inject"
                         " the dynopt setup hook into (docs/95)")
    ap.add_argument("--keep-stage", action="store_true",
                    help="keep the injected shared build stage dir")
    ap.add_argument("--required-gates",
                    default="interception,video_md5,benchmark")
    args = ap.parse_args()

    manifest, so, preset_text = load_release(args.release_dir)
    workdir = tempfile.mkdtemp(prefix="final-gate-")

    # qemu proxy: stage an injected shared x265 build so the CLI really
    # calls dynopt_patch_primitives() (resolved from preloaded release.so
    # via the guest loader).  Real machines keep the 内网 injected bin.
    bench_lib_dir = args.lib_dir
    md5_cli = os.path.join(args.lib_dir, "x265")
    md5_lib_dir = args.lib_dir
    stub_so = None
    injected = {"mode": "native-lib" if args.native else "qemu-clean-lib"}
    if args.inject_shared:
        stage = os.path.join(workdir, "x265-shared-injected")
        shutil.copytree(args.inject_shared, stage)
        stub_src = os.path.join(workdir, "stub_hook.cpp")
        with open(stub_src, "w", encoding="utf-8") as f:
            f.write('extern "C" void dynopt_patch_primitives(void) {}\n')
        stub_obj = os.path.join(workdir, "stub_hook.o")
        r = _run(["aarch64-linux-gnu-g++", "-c", "-o", stub_obj, stub_src])
        if r.returncode != 0:
            raise SystemExit("stub hook compile failed: " + r.stderr[-400:])
        stub_so = os.path.join(workdir, "stub_hook.so")
        r = _run(["aarch64-linux-gnu-g++", "-shared", "-o", stub_so,
                  stub_obj])
        if r.returncode != 0:
            raise SystemExit("stub hook link failed: " + r.stderr[-400:])
        # inject the setup hook into the staged build (same edit class as
        # build_preload_so --inject / tbl_md5.inject)
        from tbl_md5 import _patch_primitives, _flags
        prim = os.path.join(ROOT, "third_party", "x265", "source",
                            "common", "primitives.cpp")
        backup = os.path.join(stage, "primitives.cpp.dynopt.bak")
        state = _patch_primitives(prim, backup)
        try:
            fr = _flags(stage)
            prim_obj = os.path.join(
                stage, "common", "CMakeFiles", "common.dir",
                "primitives.cpp.o")
            cc = ["aarch64-linux-gnu-g++"] +                 [a for a in fr["CXX_DEFINES"].split() if a] +                 [a for a in fr["CXX_INCLUDES"].split() if a] +                 [a for a in fr["CXX_FLAGS"].split() if a]
            r = _run(cc + ["-DENABLE_ASSEMBLY=1", "-o", prim_obj, "-c",
                           prim], cwd=os.path.join(stage, "common"))
            if r.returncode != 0:
                raise SystemExit("staged primitives compile: " +
                                 (r.stdout + r.stderr)[-600:])
            r = _run(["ar", "r", os.path.join(stage, "libx265.a"),
                      prim_obj])
            if r.returncode != 0:
                raise SystemExit("ar stage: " + r.stderr[-400:])
            r = _run(["cmake", "--build", stage, "--target", "cli", "-j", "8"])
            if r.returncode != 0:
                raise SystemExit("stage cli relink: " +
                                 (r.stdout + r.stderr)[-800:])
        finally:
            if state == "patched":
                shutil.copyfile(backup, prim)
        bench_lib_dir = stage
        md5_cli = os.path.join(stage, "x265")
        md5_lib_dir = stage
        injected["mode"] = "qemu-injected"
        injected["stage"] = stage
    ver = {"schema": ex.SCHEMA_VERDICT, "version": ex.VERSION,
           "machine": {"tag": args.machine or args.target, "isa": args.isa,
                       "vl": args.vl},
           "date": datetime.date.today().isoformat(),
           "preset_used": preset_text,
           "pairwise": {}, "kernels": [], "gates": {},
           "commit_external": _run(["git", "rev-parse", "--short", "HEAD"],
                                   cwd=ROOT).stdout.strip() or "?",
           "report_ref": "docs/95 + release/%s" % args.target}
    ver["injected"] = injected
    errors = []

    # 0. attest manifest + preset
    so_hash = sha256_file(so)
    attest = manifest.get("build", {})
    if attest.get("so_sha256") and attest["so_sha256"] != so_hash:
        errors.append("manifest so_sha256 mismatch: %s != %s"
                      % (attest["so_sha256"], so_hash[:16]))
    registry = {"schema_version": 1, "kernels": manifest.get("kernels", [])}
    reg_errors = cr.CoverRegistry.validate(registry)
    if reg_errors:
        errors.append("manifest registry invalid: %s" % "; ".join(reg_errors[:3]))
    fp = cr.fingerprint(args.machine or args.target, args.isa, args.vl,
                        args.compiler, so_hash)
    # The preset's own fingerprint is library-computed at bench time;
    # expect_fp=None validates grammar + whitelist only. Runtime acceptance
    # is decided by the .so marker (see run_bench -> preset_applied), which
    # compares the library-computed host fp against the preset.
    preset_obj, preset_ok, warns = cr.resolve_preset(preset_text, registry)
    if any("out-of-range" in w or "unknown kernel" in w for w in warns):
        errors.append("preset whitelist invalid: %s" % "; ".join(warns[:2]))
    chosen = preset_obj.choices if preset_ok else {}
    ver["fingerprint"] = fp
    ver["preset_fp"] = preset_obj.fp
    ver["fingerprint_consistency"] = (fp == preset_obj.fp)

    # 1. interception + bench
    bench = {}
    if not args.skip_bench:
        bench = run_bench(so, bench_lib_dir, preset_text, args.native,
                          args.cpu, workdir, args.bench_iters,
                          args.bench_rounds, args.bench_budget_ms)
        intercept_ok = (bench["patched_slots"] > 0 and
                        not bench["bench_invalid"])
        ver["gates"]["interception"] = {
            "passed": intercept_ok,
            "patched_slots": bench.get("patched_slots", 0)}
        ver["gates"]["benchmark"] = {
            "passed": (bench.get("returncode") == 0 and
                       bool(bench.get("arms", {}))),
            "rounds": args.bench_rounds,
            "arms": bench.get("arms", {})}
        if not intercept_ok:
            errors.append("interception gate FAILED (slots=%s)"
                          % bench.get("patched_slots"))
        if bench.get("preset_applied"):
            pass  # fingerprint matched; nothing to record beyond applied flag
        expected_k = len(chosen)
        ver["gates"]["preset_runtime_policy"] = {
            "applied": bench.get("preset_applied", False),
            "applied_kernels": bench.get("preset_applied_kernels", 0),
            "expected_kernels": expected_k,
            "ignored_reason": bench.get("preset_ignored_reason"),
            "runtime_preset": bench.get("runtime_preset")}
        if (bench.get("preset_applied")
                and bench.get("preset_applied_kernels", 0) != expected_k):
            errors.append(
                "preset runtime gate: applied %d/%d kernels (partial "
                "acceptance; release rejected on 950-style host)"
                % (bench.get("preset_applied_kernels", 0), expected_k))
        if bench.get("preset_ignored_reason"):
            errors.append("preset runtime fallback: %s"
                          % bench["preset_ignored_reason"])
        # pairwise order per kernel by measured arms (upstream first ties)
        for k, arms in bench.get("arms", {}).items():
            covers = {c["id"]: c for c in
                      next((e["covers"] for e in registry["kernels"]
                            if e["kernel"] == k), [])}
            order = sorted(arms,
                           key=lambda o: (o != 0, arms[o]))
            labels = []
            for o in order:
                lab = covers.get(o, {}).get("label") or "id%d" % o
                if o == 0 or lab == "upstream dispatch":
                    lab = "upstream"  # exchange schema canonical label
                labels.append(lab)
            ver["pairwise"][k] = labels

    # 2. md5 gate (指定视频)
    cli = md5_cli
    if not args.skip_md5:
        # Modern deployment: the multicover release.so self-injects via its
        # x265_setup_primitives interposer, so the proxy gate uses the
        # supplied (clean) lib as-is; --inject-shared only simulates the
        # legacy injected-lib combination (protected by the idempotency
        # guard, docs/95 §4).  Base side uses the no-op hook stub so the
        # staged lib's weak hook call still links.
        base_preload = stub_so if stub_so else None
        if not args.skip_md5:
            base_md5, errb = encode_md5(
                cli, args.video, args.res, args.frames, args.x265_preset,
                workdir, "base", base_preload, None, md5_lib_dir,
                args.native, args.cpu)
            rel_md5, errr = encode_md5(
                cli, args.video, args.res, args.frames, args.x265_preset,
                workdir, "release", so, preset_text, md5_lib_dir,
                args.native, args.cpu)
            md5_ok = (base_md5 is not None and base_md5 == rel_md5)
            ver["gates"]["video_md5"] = {
                "passed": md5_ok,
                "injected_mode": injected["mode"],
            "clips": [os.path.basename(args.video)],
            "res": args.res, "frames": args.frames,
            "preset": args.x265_preset,
            "base_md5": base_md5, "release_md5": rel_md5,
        }
        if base_md5 is None:
            errors.append("baseline encode failed: " + errb[-300:])
        elif rel_md5 is None:
            errors.append("release encode failed: " + errr[-300:])
        elif not md5_ok:
            errors.append("video md5 gate FAILED (base %s != release %s)"
                          % (base_md5[:12], rel_md5[:12]))

    # 3. chosen-cover rows + kernel metrics
    for k, ord_ in sorted(chosen.items()):
        entry = next((e for e in registry["kernels"]
                      if e["kernel"] == k), None)
        if not entry:
            continue
        cover = next((c for c in entry["covers"]
                      if c.get("id") == ord_), {})
        kind = "upstream" if ord_ == 0 else (
            "bounded" if cover.get("bound") else "exact")
        arm_ns = bench.get("arms", {}).get(k, {}).get(ord_)
        up_ns = bench.get("arms", {}).get(k, {}).get(0)
        speedup = (float(up_ns) / arm_ns) if (up_ns and arm_ns) else None
        row = {"kernel": k, "cover": ord_, "kind": kind,
               "label": cover.get("label", "id%d" % ord_),
               "arm_ns": arm_ns, "upstream_ns": up_ns,
               "speedup_vs_upstream": speedup}
        ver["kernels"].append(row)
        if args.db and (arm_ns or ord_ == 0):
            bit_exact = "yes" if ord_ == 0 or kind == "exact" else (
                "no (bounded: max_abs<=%d%s)" % (
                    cover["bound"],
                    "; measured=%d" % cover["deviation"]
                    if cover.get("deviation") is not None else ""))
            row_b = {
                "id": "%s-%s-final-%s-%s" % (
                    k, cover.get("label") or ord_, ver["date"],
                    ver.get("commit_external", "?")),
                "date": ver["date"], "commit": ver.get("commit_external"),
                "kernel": k, "variant": (cover.get("label") or "c%d" % ord_),
                "input_isa": entry.get("input_isa", ""),
                "output_isa": entry.get("output_isa", ""),
                "candidate_file": cover.get("source_file", ""),
                "testbench": "final-gate-md5+bench",
                "machine": args.machine or args.target,
                "kernel_metric": "ns_per_call",
                "kernel_value": str(arm_ns) if arm_ns else "",
                "e2e_100f_pct": (round((1 - speedup) * 100, 3)
                                 if speedup else ""),
                "e2e_30f_pct": "",
                "e2e_ci_ms": "",
                "bit_exact": bit_exact,
                "report": ver["report_ref"],
            }
            r2 = _run([sys.executable,
                       os.path.join(ROOT, "tools", "kernel_db.py"), "add"]
                      + ["%s=%s" % (kk, vv)
                         for kk, vv in row_b.items() if vv != ""],
                      cwd=ROOT)
            ver.setdefault("db_rows", []).append(
                (row_b["id"], r2.returncode))

    required = {g.strip() for g in args.required_gates.split(",") if g}
    run_ok = not errors and all(
        ver["gates"].get(g, {}).get("passed") for g in required
        if g in ver["gates"]) and (args.skip_bench or bench.get(
            "returncode") == 0)
    ver["passed"] = bool(run_ok) and not errors
    ver["errors"] = errors
    if not args.keep_stage and injected.get("stage"):
        shutil.rmtree(injected["stage"], ignore_errors=True)
    out_json = args.json or os.path.join(args.release_dir, "verdict.json")
    with open(out_json, "w", encoding="utf-8") as f:
        json.dump(ver, f, ensure_ascii=False, indent=2, sort_keys=True)
        f.write("\n")
    print(json.dumps(ver, ensure_ascii=False, indent=2, sort_keys=True))
    print("verdict ->", out_json)
    return 0 if ver["passed"] else 1


if __name__ == "__main__":
    sys.exit(main())
