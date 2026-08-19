#!/usr/bin/env python3
"""tbl_md5.py -- docs/87 step 6: TBL <-> video-md5 relation experiment.

Establishes the empirical relation between x265's TestBenchLite gate
(random inputs, C reference) and whole-encode output md5 on real inputs:

  1. --genclip: deterministic synthetic YUV corpus (a "selected video"
     stand-in; swappable with any file path);
  2. --inject: compile the dct32 RECORDER (trace mode) or the op4032
     candidate INTO a static x265 CLI (build-x265-injected pattern);
  3. --encode: baseline / recorder / candidate encodes; record mode
     dumps every dct32 call (args + input buffers + output md5);
  4. --replay: run the recorded real inputs through upstream (C ref)
     and the candidate, per-call equality + deviation stats;
  5. --tbl: run TestBenchLite (random input) on the same candidate;

The report answers: does an input distribution that TBL rejects
(op4032 differs from C reference on random buffers) also flip the
whole-encode md5 on the real-input corpus?  If md5 stays put while
TBL rejects, TBL is the conservative cross-machine gate and video md5
is the (weaker) same-machine regression gate -- the step-7 bounded
release contract uses both, with explicit bounds on the replay stats.

Usage:
  python3 tools/tbl_md5.py --experiment --stage-dir build/step6 \
      --static-build build/x265-8-static-cli2 --out release/step6-qemu/report.json
"""

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if os.path.join(ROOT, "tools") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "tools"))

QEMU = ["qemu-aarch64", "-cpu", "max,sve-max-vq=2", "-L",
        "/usr/aarch64-linux-gnu"]
LIBDIR = os.path.join(ROOT, "build", "x265-8-cross-sve2")

# trace format header constants (see recorder.cpp / replay.cpp)
TRACE_MAGIC = b"AGO1"
KERNEL_DCT32 = 0

SETUP_PATCH = (
    "--- a/source/common/primitives.cpp\n"
    "+++ b/source/common/primitives.cpp\n"
    "@@ -26,6 +26,7 @@\n"
    "\n"
    " namespace X265_NS {\n"
    " // x265 private namespace\n"
    '+extern "C" void dynopt_patch_primitives();\n'
    "\n"
    " extern const uint8_t lumaPartitionMapTable[] =\n"
    " {\n"
    "@@ -276,6 +277,7 @@\n"
    " #endif\n"
    "\n"
    "         setupAliasPrimitives(primitives);\n"
    '+        dynopt_patch_primitives();\n'
    "\n"
    "         if (param->bLowPassDct)\n"
    "         {\n"
)

RECORDER_CPP = """
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <string>
#include "common/primitives.h"
using namespace X265_NS;
static dct_t g_orig = NULL;
static FILE* g_tr = NULL;
static unsigned long long g_seq = 0;

static void dct32_rec(const int16_t* src, int16_t* dst, intptr_t stride)
{
    if (g_orig) g_orig(src, dst, stride);
    if (g_tr) {
        int sb = (int)(stride * 32 * 2 + 64);
        int db = 32 * 32 * 2;
        uint32_t hdr[3] = { 0x314F4741, 1, 0 /* dct32 */ };
        uint64_t seq = g_seq++;
        int64_t st = stride;
        uint32_t lens[2] = { (uint32_t)sb, (uint32_t)db };
        fwrite(hdr, sizeof(uint32_t), 3, g_tr);
        fwrite(&seq, sizeof(seq), 1, g_tr);
        fwrite(&st, sizeof(st), 1, g_tr);
        fwrite(lens, sizeof(uint32_t), 2, g_tr);
        fwrite(src, 1, (size_t)sb, g_tr);
        fwrite(dst, 1, (size_t)db, g_tr);
        fflush(g_tr);
    }
}

extern "C" int dynopt_patch_primitives(void)
{
    EncoderPrimitives& P = X265_NS::primitives;
    if (!g_orig) {
        g_orig = P.cu[BLOCK_32x32].dct;
        if (!g_orig) return -1;
    }
    P.cu[BLOCK_32x32].dct = dct32_rec;
    const char* t = getenv("AGO_TRACE");
    if (t && !g_tr) g_tr = fopen(t, "wb");
    fprintf(stderr, "dynopt: recorder installed on dct32 slot\\n");
    return 1;
}
"""

REPLAY_CPP = """
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>
#include "common/primitives.h"
using namespace X265_NS;
typedef void (*setup_t)(x265_param*);
typedef void (*dct_t2)(const int16_t*, int16_t*, intptr_t);
extern "C" void dynopt_dct32_sve2_shared(const int16_t*, int16_t*, intptr_t);
extern "C" int dynopt_patch_primitives(void) { return -1; }

int main(int argc, char** argv)
{
    if (argc < 2) return 2;
    void* xh = dlopen("libx265.so.216", RTLD_NOW | RTLD_LOCAL);
    if (!xh) { fprintf(stderr, "replay: dlopen failed: %s\\n", dlerror()); return 3; }
    setup_t setup = (setup_t)dlsym(xh, "_ZN4x26521x265_setup_primitivesEP10x265_param");
    x265_param p; memset(&p, 0, sizeof(p)); p.internalBitDepth = 8; p.cpuid = 0;
    setup(&p);
    EncoderPrimitives* P = (EncoderPrimitives*)dlsym(xh, "_ZN4x26510primitivesE");
    dct_t2 up = (dct_t2)P->cu[BLOCK_32x32].dct;
    dct_t2 cf = (dct_t2)dynopt_dct32_sve2_shared;

    FILE* f = fopen(argv[1], "rb");
    if (!f) { fprintf(stderr, "replay: cannot open %s\\n", argv[1]); return 4; }
    char magic[4];
    if (fread(magic, 1, 4, f) != 4 || memcmp(magic, "AGO1", 4)) {
        fprintf(stderr, "replay: bad trace magic\\n"); return 5;
    }
    unsigned long long n = 0, eq = 0, up_consistent = 0;
    unsigned long long eq_rec = 0, cnt_rec = 0;
    long long maxd = 0, maxd_rec = 0;
    unsigned long long cnt = 0;
    static uint32_t posmax[1024];
    while (1) {
        unsigned char hb[36];
        uint32_t ver, kernel, sblen, dblen;
        uint64_t seq; int64_t stride;
        if (fread(hb, 1, 36, f) != 36) break;
        memcpy(&ver, hb, 4);
        memcpy(&kernel, hb + 4, 4);
        memcpy(&seq, hb + 8, 8);
        memcpy(&stride, hb + 16, 8);
        memcpy(&sblen, hb + 24, 4);
        memcpy(&dblen, hb + 28, 4);
        if (sblen > 1 << 20 || dblen > 1 << 20) break;
        int16_t* in = (int16_t*)malloc(sblen + 64);
        int16_t* drec = (int16_t*)malloc(dblen + 64);
        int16_t* du = (int16_t*)malloc(dblen + 64);
        int16_t* dc = (int16_t*)malloc(dblen + 64);
        fread(in, 1, sblen, f);
        fread(drec, 1, dblen, f);
        memset(dc, 0, dblen);
        memset(du, 0, dblen);
        if (n < 2) fprintf(stderr, "rpl pos-before=%ld hdr %llu sblen=%u dblen=%u stride=%lld\\n", ftell(f), n, sblen, dblen, (long long)stride);
        if (n < 2) fprintf(stderr, "rpl %llu call up\\n", n);
        up(in, du, stride);
        if (!memcmp(du, drec, dblen)) up_consistent++;
        if (n < 2) fprintf(stderr, "rpl %llu call cf\\n", n);
        cf(in, dc, stride);
        int nels = (int)(dblen / 2);
        int d = 0, drec1 = 0;
        for (int i = 0; i < nels; i++) {
            int a = du[i], b = dc[i];
            int ad = a > b ? a - b : b - a;
            if (ad) {
                d = 1; cnt++;
                if (ad > maxd) maxd = ad;
                if ((uint32_t)ad > posmax[i]) posmax[i] = (uint32_t)ad;
            }
            int ar = drec[i], br = dc[i];
            int adr = ar > br ? ar - br : br - ar;
            if (adr) { drec1 = 1; cnt_rec++; if (adr > maxd_rec) maxd_rec = adr; }
        }
        if (!d) eq++;
        if (!drec1) eq_rec++;
        n++;
        free(in); free(drec); free(du); free(dc);
        if (n % 5000 == 0) fprintf(stderr, "replay %llu records\\n", n);
    }
    fclose(f);
    fprintf(stderr, "replay upstream-consistent=%llu/%llu\\n",
            up_consistent, n);
    int top[5]; int tmax[5]; int nt = 0;
    for (int r = 0; r < 5; r++) {
        uint32_t best = 0; int bo = -1;
        for (int i = 0; i < 1024; i++)
            if (posmax[i] > best) { best = posmax[i]; bo = i; }
        if (bo < 0) break;
        top[nt] = bo; tmax[nt] = (int)posmax[bo];
        posmax[bo] = 0; nt++;
    }
    printf("RPL total=%llu eq=%llu diff_calls=%llu up_ok=%llu max=%lld cnt=%llu eq_rec=%llu cnt_rec=%llu max_rec=%lld",
           n, eq, n - eq, up_consistent, maxd, cnt, eq_rec, cnt_rec, maxd_rec);
    for (int i = 0; i < nt; i++) printf(" off=%d:max=%d", top[i], tmax[i]);
    printf("\\n");
    return n - eq ? 1 : 0;
}
"""


def _run(cmd, env=None, cwd=None, timeout=1800):
    return subprocess.run(cmd, capture_output=True, text=True, env=env,
                          cwd=cwd, timeout=timeout)


def genclip(path, w, h, frames):
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    out = bytearray()
    # deterministic corpus: moving gradient + sharp blocks + stripe noise
    rng = 12345
    for f in range(frames):
        for y in range(h):
            for x in range(w):
                v = (x * 3 + y * 5 + f * 11) & 255
                if x in (w // 4, 3 * w // 4) or y in (h // 4, 3 * h // 4):
                    v = 255 - v
                if (x // 8 + y // 8 + f) % 3 == 0:
                    v = (v + (x * y * f) % 17) & 255
                out.append(v)
        for y in range(h // 2):
            for x in range(w // 2):
                rng = (rng * 1103515245 + 12345) & 0x7fffffff
                out.append((rng >> 13) & 255)
                rng = (rng * 1103515245 + 12345) & 0x7fffffff
                out.append((rng >> 13) & 255)
    with open(path, "wb") as f:
        f.write(out)
    return len(out)


def _patch_primitives(src_path, backup_path):
    s = open(src_path, encoding="utf-8").read()
    if "dynopt_patch_primitives()" in s:
        return "already"
    shutil.copyfile(src_path, backup_path)
    s = s.replace("// x265 private namespace\n",
                  "// x265 private namespace\n"
                  'extern "C" void dynopt_patch_primitives();\n'
                  'extern "C" void* dlsym(void*, const char*);\n'
                  '#ifndef RTLD_DEFAULT\n#define RTLD_DEFAULT 0\n#endif\n',
                  1)
    s = s.replace("        setupAliasPrimitives(primitives);\n",
                  "        setupAliasPrimitives(primitives);\n"
                  "        if (!dlsym(RTLD_DEFAULT,"
                  " \"dynopt_preset_and_bench\"))\n"
                  "            dynopt_patch_primitives();\n", 1)
    open(src_path, "w", encoding="utf-8").write(s)
    return "patched"
FLAGS_MAKE = ("common/CMakeFiles/common.dir/flags.make")


def _flags(build_dir):
    """Parse flags.make handling backslash continuation lines."""
    fm = open(os.path.join(build_dir, FLAGS_MAKE), encoding="utf-8").read()
    d, cur = {}, None
    for raw in fm.splitlines():
        line = raw.rstrip()
        if not line.strip():
            continue
        if " = " in line and not line.lstrip().startswith(("#", "-")):
            k, v = line.split(" = ", 1)
            cur = k.strip()
            d[cur] = v
        elif not line.lstrip().startswith("#"):
            if cur and line.endswith("\\"):
                d[cur] += " " + line[:-1].strip()
            elif cur:
                d[cur] += " " + line.strip()
    return d


def inject(static_build, stage, mode, isa="sve2", kernel="dct32"):
    """mode in {'recorder','candidate'}; recompiles primitives.cpp in the
    static build, injects objects into libx265.a, relinks the cli, then
    restores primitives.cpp. Returns path to the relinked CLI."""
    static_build = os.path.abspath(static_build)
    stage = os.path.abspath(stage)
    src_dir = os.path.join(ROOT, "third_party", "x265", "source")
    prim = os.path.join(src_dir, "common", "primitives.cpp")
    backup = os.path.join(static_build, "primitives.cpp.dynopt.bak")
    os.makedirs(stage, exist_ok=True)

    objs = []
    if mode == "candidate":
        env = dict(os.environ)
        env["AGO_LEGACY_DCT32"] = "1"
        wo = os.path.join(stage, "work")
        r = _run([sys.executable,
                  os.path.join(ROOT, "tools", "build_preload_so.py"),
                  "--isa", isa, "--kernels", kernel,
                  "--inject-outdir", stage, "--workdir", wo],
                 env=env, cwd=ROOT)
        if r.returncode != 0:
            raise RuntimeError("build_preload_so inject: " +
                               (r.stdout + r.stderr)[-500:])
        if not os.path.exists(os.path.join(stage, "objects.txt")):
            raise RuntimeError("no objects.txt from build_preload_so")
        with open(os.path.join(stage, "objects.txt"),
                  encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line:
                    objs.append(os.path.normpath(os.path.join(
                        ROOT, line)))
    else:  # recorder
        rec_src = os.path.join(stage, "recorder.cpp")
        with open(rec_src, "w", encoding="utf-8") as f:
            f.write(RECORDER_CPP)
        fr = _flags(static_build)
        rec_obj = os.path.join(stage, "recorder.o")
        cc = ["aarch64-linux-gnu-g++", "-c", "-O2", "-fPIC",
              "-DX265_DEPTH=8", "-DX265_NS=x265"]
        cc += [a for a in fr["CXX_DEFINES"].split() if a]
        cc += [a for a in fr["CXX_INCLUDES"].split() if a]
        cc += [a for a in fr["CXX_FLAGS"].split() if a]
        cc += ["-std=gnu++11", "-o", rec_obj, rec_src]
        r = _run(cc, cwd=src_dir)
        if r.returncode != 0:
            raise RuntimeError("recorder compile: " +
                               (r.stdout + r.stderr)[-600:])
        objs = [rec_obj]

    # patch and rebuild primitives.o
    state = _patch_primitives(prim, backup)
    try:
        fr = _flags(static_build)
        prim_obj = os.path.join(
            static_build, "common/CMakeFiles/common.dir/primitives.cpp.o")
        pr = ["aarch64-linux-gnu-g++"] + \
            [a for a in fr["CXX_DEFINES"].split() if a] + \
            [a for a in fr["CXX_INCLUDES"].split() if a] + \
            [a for a in fr["CXX_FLAGS"].split() if a]
        r = _run(pr + ["-DENABLE_ASSEMBLY=1",
                       "-o", prim_obj, "-c", prim],
                 cwd=os.path.join(static_build, "common"))
        if r.returncode != 0:
            raise RuntimeError("primitives compile: " +
                               (r.stdout + r.stderr)[-600:])
        ar = ["ar", "r", os.path.join(static_build, "libx265.a"),
              prim_obj] + objs
        r = _run(ar)
        if r.returncode != 0:
            raise RuntimeError("ar: " + r.stderr[-400:])
        r = _run(["cmake", "--build", static_build, "--target", "cli",
                  "-j", "8"])
        if r.returncode != 0:
            raise RuntimeError("cli relink: " + (r.stdout + r.stderr)[-800:])
    finally:
        if state == "patched":
            shutil.copyfile(backup, prim)
    cli = os.path.join(static_build, "x265")
    out = os.path.join(stage, "x265-%s" % mode)
    shutil.copy2(cli, out)
    return out


def encode(cli, yuv, w, h, frames, out_hevc, trace=None, preset="faster"):
    cmd = QEMU + [cli, "--input", yuv, "--input-res", "%dx%d" % (w, h),
                  "--fps", "25", "--frames", str(frames),
                  "--preset", preset, "-o", out_hevc]
    env = None
    if trace:
        env = dict(os.environ)
        env["AGO_TRACE"] = trace
    r = _run(cmd, env=env, timeout=1800)
    if not os.path.exists(out_hevc):
        raise RuntimeError("encode produced no output: " +
                           (r.stdout + r.stderr)[-600:])
    return md5_file(out_hevc)


def md5_file(path):
    h = hashlib.md5()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def build_replay(stage, out_bin):
    rpl = os.path.join(stage, "replay.cpp")
    with open(rpl, "w", encoding="utf-8") as f:
        f.write(REPLAY_CPP)
    op = os.path.join(stage, "op4032.o")
    fr = _flags(os.path.join(ROOT, "build", "x265-8-cross-sve2"))
    cc = ["aarch64-linux-gnu-g++", "-c", "-O3", "-march=armv8-a+dotprod+i8mm+sve2+sve2p1",
          "-DX265_DEPTH=8"]
    cc += [a for a in fr["CXX_DEFINES"].split() if a]
    r = _run(cc + ["-I", os.path.join(ROOT, "third_party", "x265", "source"),
                   "-I", os.path.join(ROOT, "build", "x265-8-cross-sve2"),
                   "-o", op,
                   os.path.join(ROOT, "kernels", "dct32", "candidates",
                                "best_sve2_op4032.cpp")],
             cwd=ROOT)
    if r.returncode != 0:
        raise RuntimeError("op4032 compile: " + (r.stdout + r.stderr)[-400:])
    r = _run(["aarch64-linux-gnu-g++", "-O2", "-DX265_DEPTH=8",
              "-DX265_NS=x265",
              "-I", os.path.join(ROOT, "third_party", "x265", "source"),
              "-I", os.path.join(ROOT, "build", "x265-8-cross-sve2"),
              "-o", out_bin, rpl, op, "-ldl",
              "-L", LIBDIR,
              "-Wl,--unresolved-symbols=ignore-in-shared-libs",
              "-Wl,-rpath-link,/usr/aarch64-linux-gnu/lib",
              "-Wl,--export-dynamic", "-lx265"])
    if r.returncode != 0:
        raise RuntimeError("replay link: " + (r.stdout + r.stderr)[-500:])
    return out_bin


def run_tbl(stage, seed_list):
    """Build TestBenchLite with op4032 (random inputs, C ref) and run seeds;
    returns list of (seed, rc, summary)."""
    lite_bin = os.path.join(ROOT, "build", "testbench-lite",
                            "TestBenchLite")
    r = _run(["bash", os.path.join(ROOT, "scripts",
                                   "build-testbench-lite.sh"),
              os.path.join(stage, "op4032.o"),
              os.path.join(ROOT, "build", "x265-8-testbench")])
    if r.returncode != 0:
        raise RuntimeError("lite build: " + (r.stdout + r.stderr)[-500:])
    results = []
    for seed in seed_list:
        rr = _run(QEMU + [lite_bin, "--gate", "dct32", "--seed",
                          "0x%X" % seed])
        results.append({"seed": seed, "rc": rr.returncode,
                        "summary": rr.stdout.strip().splitlines()[-1]
                        if rr.stdout.strip() else rr.stderr.strip()[-120:]})
    return results


def experiment(args):
    stage = os.path.abspath(args.stage_dir)
    os.makedirs(stage, exist_ok=True)
    clip = args.clip or os.path.join(stage, "clip128.yuv")
    w, h, frames = args.res, args.res, args.frames
    genclip(clip, w, h, frames)

    report = {"kernel": "dct32", "candidate": "best_sve2_op4032",
              "clip": clip, "resolution": "%dx%d" % (w, h),
              "frames": frames, "preset": args.preset,
              "machine": "qemu sve-max-vq=2 (proxy)"}

    # baseline CLI (pre-injection snapshot)
    base_cli = os.path.join(stage, "x265-base")
    shutil.copy2(os.path.join(args.static_build, "x265"), base_cli)
    base_hevc = os.path.join(stage, "out-base.hevc")
    report["base_md5"] = encode(base_cli, clip, w, h, frames, base_hevc,
                                preset=args.preset)

    # recorder CLI + trace
    rec_cli = inject(args.static_build, os.path.join(stage, "rec"),
                     "recorder")
    trace = os.path.join(stage, "dct32.trace")
    rec_hevc = os.path.join(stage, "out-rec.hevc")
    report["rec_md5"] = encode(rec_cli, clip, w, h, frames, rec_hevc,
                               trace=trace, preset=args.preset)
    report["trace_bytes"] = os.path.getsize(trace)
    report["recording_consistent"] = \
        report["rec_md5"] == report["base_md5"]

    # candidate CLI + md5
    cand_cli = inject(args.static_build, os.path.join(stage, "cand"),
                      "candidate")
    cand_hevc = os.path.join(stage, "out-op4032.hevc")
    report["cand_md5"] = encode(cand_cli, clip, w, h, frames, cand_hevc,
                                preset=args.preset)
    report["video_md5_changed"] = \
        report["cand_md5"] != report["base_md5"]

    # replay real inputs: upstream(C) vs op4032, per-call
    rbin = build_replay(stage, os.path.join(stage, "replay"))
    renv = dict(os.environ)
    renv["LD_LIBRARY_PATH"] = LIBDIR
    rr = _run(QEMU + [rbin, trace], env=renv, timeout=1800)
    rpl = {}
    for line in rr.stdout.splitlines():
        if line.startswith("RPL "):
            parts = line.split()
            rpl = {"total": int(parts[1].split("=")[1]),
                   "eq": int(parts[2].split("=")[1]),
                   "diff_calls": int(parts[3].split("=")[1]),
                   "up_consistent": int(parts[4].split("=")[1]),
                   "max_abs": int(parts[5].split("=")[1]),
                   "diff_count": int(parts[6].split("=")[1]),
                   "eq_rec": int(parts[7].split("=")[1]),
                   "cnt_rec": int(parts[8].split("=")[1]),
                   "max_rec": int(parts[9].split("=")[1])}
            for tok in parts[10:]:
                k, v = tok.split(":")
                if k == "off":
                    rpl.setdefault("top_offsets", []).append(
                        {"off": int(v), "max": int(parts[
                            parts.index(tok) + 1].split("=")[1])})
    report["replay"] = rpl

    # TBL random-input gate on the same candidate
    report["tbl"] = run_tbl(stage, [0x1234, 0x5678, 0x9ABC])

    # relation verdict
    tbl_rejects = any(t["rc"] != 0 for t in report["tbl"])
    replay_dev = rpl.get("diff_calls", 0) > 0
    if tbl_rejects and not report["video_md5_changed"]:
        rel = "tbl_stricter_than_md5"
    elif not tbl_rejects and replay_dev and \
            not report["video_md5_changed"]:
        rel = "tbl_pass_md5_pass_replay_bounded"
    elif not tbl_rejects and report["video_md5_changed"]:
        rel = "tbl_weaker"
    elif tbl_rejects and report["video_md5_changed"]:
        rel = "both_trigger"
    else:
        rel = "all_pass"
    report["relation"] = rel
    if args.out:
        with open(args.out, "w", encoding="utf-8") as f:
            json.dump(report, f, ensure_ascii=False, indent=2,
                      sort_keys=True)
            f.write("\n")
    print(json.dumps(report, ensure_ascii=False, indent=2, sort_keys=True))
    return 0


def main():
    ap = argparse.ArgumentParser(prog="tbl_md5.py", description=__doc__)
    ap.add_argument("--experiment", action="store_true")
    ap.add_argument("--stage-dir", default="build/step6")
    ap.add_argument("--static-build",
                    default="build/x265-8-static-cli2")
    ap.add_argument("--clip", default="")
    ap.add_argument("--res", type=int, default=128)
    ap.add_argument("--frames", type=int, default=24)
    ap.add_argument("--preset", default="faster")
    ap.add_argument("--out", default="release/step6-qemu/report.json")
    ap.add_argument("--genclip", default="")
    args = ap.parse_args()
    if args.genclip:
        genclip(args.genclip, args.res, args.res, args.frames)
        return 0
    if args.experiment:
        return experiment(args)
    ap.print_help()
    return 2


if __name__ == "__main__":
    sys.exit(main())
