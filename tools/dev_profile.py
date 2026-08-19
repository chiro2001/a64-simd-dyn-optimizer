#!/usr/bin/env python3
"""dev_profile.py -- docs/87 step 5 deviation-profile + re-arbitration tool.

Run one numeric deviation profile (cover vs real upstream) and one
A/B timing sweep (upstream vs each cover, same machine/qemu) for the
currently registered kernels, including check-in "extra" candidates
that were scan-only before (dct32-op4032, interp8-32-i8mm).

Per cover it reports:

  bit_exact   all samples identical to upstream
  max_abs     worst per-element absolute deviation
  mean_abs, l1, l2
  diff_count  elements differing at least once across the sample run
  top_offsets worst-position sketch (offset:max_abs pairs)

Verdict policy (arbitration): a cover
  - "ship"        : bit-exact, or bounded(max_abs <= bound) AND speedup
                    > 1.05 on this machine -- may enter the preset only
                    after the step-7 bounded gate + 950/TBL validation;
  - "hold"        : bounded but no measured gain (kept as candidate);
  - "exclude"     : divergent (max_abs > bound) -- keep upstream.

Example:
  python3 tools/dev_profile.py --kernels dct32,interp8-32,sao
      --samples 300 --bench-iters 120000 --json release/step5-qemu/report.json
"""

import argparse
import json
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if os.path.join(ROOT, "tools") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "tools"))

import multicover
from bench_specs import spec as bench_spec
from ago_auto_search import KERNEL_COVERS

# docs/87 step 5: extra candidate covers appended after the module covers.
EXTRA_COVERS = {
    "dct32": [
        {"letter": "op4032", "src": os.path.join(
            ROOT, "kernels", "dct32", "candidates",
            "best_sve2_op4032.cpp")},
    ],
    "interp8-32": [
        {"letter": "i8mm", "src": os.path.join(
            ROOT, "kernels", "interp8-32", "candidates",
            "best_sve2_i8mm.cpp")},
    ],
}

BOUND_DEFAULT = {"dct32": 32767, "interp8-32": 0, "sao": 0}
PROF_RE = re.compile(
    r"^PROF (\S+) (\d+) (exact|diff) max=(\d+) mean=(\d+) l1=(\d+) "
    r"l2=(\d+) cnt=(\d+)((?: off=\d+:max=\d+)*)$", re.M)
TM_RE = re.compile(r"^TM (\S+) (\d+) (\d+)$", re.M)
ISA_MARCH = {
    "sve2": "armv8-a+dotprod+i8mm+sve2+sve2p1",
    "sve1": "armv8-a+dotprod+sve",
}
I8MM_KERNELS = {"interp8-32", "interp8", "interp8-16", "interp8-32x16",
                "interp8-32x8", "interp8-16x32", "interp8-16x8",
                "interp8-8x8", "interp8-8x16"}

PRIMITIVES_SYM = "_ZN4x26510primitivesE"
SETUP_SYM = "_ZN4x26521x265_setup_primitivesEP10x265_param"
LIB = "libx265.so.216"


def _ptr_bufs(spec):
    """Map pointer params (in order) to buffer indices and non-pointer
    params to scalar indices; return (ptr_bufs, scalars_used,
    out_bi=last pointer buffer)."""
    params = [p.strip() for p in spec["params"].split(",")]
    ptrs, scl = [], []
    for p in params:
        if "*" in p:
            ptrs.append(len(ptrs))
        else:
            scl.append(p)
    scalars = spec.get("call_scalars", spec["scalars"])
    cand_ptr_params = None
    if spec.get("adapter"):
        cand_ptr_params = [p.strip() for p in
                           spec["cand_params"].split(",")
                           if "*" in p]
    return ptrs, scl, scalars, cand_ptr_params


def _fill_kinds(spec):
    if spec.get("fills"):
        return list(spec["fills"])
    # derive from pointer param decls in param order
    params = [p.strip() for p in spec["params"].split(",")]
    kinds = []
    for p in params:
        if "*" not in p:
            continue
        if "int16" in p:
            kinds.append("resid9")
        elif "int8" in p:
            kinds.append("int8x")
        else:
            kinds.append("bytes")
    return kinds


def _elem_size(spec, out_bi):
    params = [p.strip() for p in spec["params"].split(",")]
    bp = 0
    for p in params:
        if "*" in p:
            if bp == out_bi:
                return 2 if "int16" in p else 1
            bp += 1
    return 1


def _call_args(spec, out_tag, cand=False, out_bi=None):
    if out_bi is None:
        ptrs, _s, _sc, _c = _ptr_bufs(spec)
        out_bi = spec.get("out_buf", ptrs[-1])
    params = [p.strip() for p in spec["params"].split(",")]
    if cand and spec.get("adapter"):
        cparams = [p.strip() for p in spec["cand_params"].split(",")]
        n_nonptr = sum(1 for p in cparams if "*" not in p)
        scalars = list(spec["scalars"])[-n_nonptr:] if n_nonptr else []
        args, si = [], 0
        for p in cparams:
            if "*" in p:
                args.append("(%s*)ob%d" % (p[:p.rindex("*")].strip(),
                                           si))
                si += 1
            else:
                args.append(str(scalars[0]))
                scalars = scalars[1:]
        return ", ".join(args)
    ptrs, _scl, scalars, _ = _ptr_bufs(spec)
    args, si, bi = [], 0, 0
    for p in params:
        if "*" in p:
            base = out_tag + str(bi) if bi == out_bi \
                else "ob%d" % bi
            args.append("(%s*)%s" % (p[:p.rindex("*")].strip(), base))
            bi += 1
        else:
            args.append(str(scalars[si]))
            si += 1
    return ", ".join(args)


def _fill_block(spec):
    buf_sizes = spec["buffers"]
    kinds = _fill_kinds(spec)
    blocks = []
    for bi, (size, kind) in enumerate(zip(buf_sizes, kinds)):
        if kind == "resid9":
            blocks.append(
                "            for (int i = 0; i < %d; i++) {\n"
                "                int16_t v = (int16_t)(((i * 73 + it * 131)"
                " & 511) - 256);\n"
                "                memcpy((uint8_t*)ob%d + i * 2, &v, 2);\n"
                "            }" % (size // 2, bi))
        elif kind == "sign8":
            blocks.append(
                "            for (int i = 0; i < %d; i++)\n"
                "                ((int8_t*)ob%d)[i] = (int8_t)"
                "(((i * 3 + it) %% 3) - 1);" % (size, bi))
        elif kind == "int8x":
            blocks.append(
                "            for (int i = 0; i < %d; i++)\n"
                "                ((int8_t*)ob%d)[i] = (int8_t)"
                "(((i * 7 + it * 5) & 31) - 16);" % (size, bi))
        else:
            blocks.append(
                "            for (int i = 0; i < %d; i++)\n"
                "                ((uint8_t*)ob%d)[i] = (uint8_t)"
                "((i * 73 + it * 131) & 255);" % (size, bi))
    return "\n".join(blocks)
PROFILE_CPP = r'''#include <cstdint>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cmath>
#include <dlfcn.h>
#include "common/primitives.h"
using namespace X265_NS;
typedef void (*setup_t)(x265_param*);
extern "C" int dynopt_patch_primitives(void);
extern "C" int dynopt_patch_primitives(void) { return -1; }
static uint64_t now_ns(void) {
    struct timespec ts; clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
}
int main(int argc, char** argv) {
    if (argc < 3) return 2;
    void* xh = dlopen("@LIB@", RTLD_NOW | RTLD_LOCAL);
    if (!xh) { fprintf(stderr, "profile: dlopen libx265 failed: %s\n", dlerror()); return 3; }
    setup_t setup = (setup_t)dlsym(xh, "@SETUP@");
    x265_param p; memset(&p, 0, sizeof(p)); p.internalBitDepth = 8; p.cpuid = 0;
    setup(&p);
    EncoderPrimitives* P = (EncoderPrimitives*)dlsym(xh, "@PRIM@");
    int iters = atoi(argv[2]);
    void* ph = dlopen(argv[1], RTLD_NOW | RTLD_LOCAL);
    if (!ph) { fprintf(stderr, "profile: dlopen probe failed: %s\n", dlerror()); return 4; }
    typedef @RET@ (*fn_t)(@PARAMS@);
    fn_t up = (fn_t)(@UPSTREAM@);
    if (!up) { fprintf(stderr, "profile: upstream @KERNEL@ missing\n"); return 5; }
@DECLS@
@COVERS@
    return 0;
}
'''

PROFILE_COVER = r'''    {
        @CANDTYPEDEF@
        @CFTYPE@ cf = (@CFTYPE@)dlsym(ph, "dynopt_@KERNEL@_cov@CID@");
        if (!cf) {
            printf("PROF @KERNEL@ @CID@ missing max=0 mean=0 l1=0 l2=0 cnt=0\n");
        } else {
        uint64_t t0 = now_ns();
        uint64_t c_cnt = 0, c_sum = 0, c_max = 0, c_badit = 0;
        unsigned long long c_sq = 0;
        @POSMAX@
        for (int it = 0; it < iters; it++) {
@FILL@
            @ZEROOUT@
            up(@UPARGS@);
            cf(@CFARGS@);
            for (int e = 0; e < @ELEMS@; e++) {
                @ELEMTYPE@ a = ((@ELEMTYPE@*)oa@OUTB@)[e], b = ((@ELEMTYPE@*)ob@OUTB@)[e];
                uint32_t d = a > b ? (uint32_t)(a - b) : (uint32_t)(b - a);
                if (!d) continue;
                c_badit++;
                c_cnt++;
                c_sum += d;
                c_sq += (unsigned long long)d * (unsigned long long)d;
                if (d > c_max) c_max = d;
                if (d > pos_max[e]) pos_max[e] = d;
            }
        }
        uint64_t dt = now_ns() - t0;
        uint64_t mean = c_cnt ? (c_sum * 1000 + c_cnt / 2) / c_cnt : 0;
        uint64_t l2 = c_cnt ? (uint64_t)(sqrt((double)c_sq / c_cnt) * 1000.0) : 0;
        int toff[16], tmax[16], ntop = 0;
        for (int r = 0; r < @TOP@ && ntop < @TOP@; r++) {
            uint32_t best = 0; int bo = -1;
            for (int e = 0; e < @ELEMS@; e++)
                if (pos_max[e] > best) { best = pos_max[e]; bo = e; }
            if (bo < 0) break;
            toff[ntop] = bo;
            tmax[ntop] = (int)pos_max[bo];
            pos_max[bo] = 0;
            ntop++;
        }
        printf("PROF @KERNEL@ @CID@ %s max=%llu mean=%llu l1=%llu l2=%llu cnt=%llu",
               c_cnt ? "diff" : "exact",
               (unsigned long long)c_max, (unsigned long long)mean,
               (unsigned long long)c_sum, (unsigned long long)l2,
               (unsigned long long)c_cnt);
        for (int r = 0; r < ntop; r++) printf(" off=%d:max=%d", toff[r], tmax[r]);
        printf("\n");
        fprintf(stderr, "profile @KERNEL@ @CID@ %llu ns %lu iters\n",
                (unsigned long long)dt, (unsigned long)(iters * @ELEMS@));
        }
    }
'''

TIMING_CPP = r'''
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <dlfcn.h>
#include "common/primitives.h"
using namespace X265_NS;
typedef void (*setup_t)(x265_param*);
extern "C" int dynopt_patch_primitives(void);
extern "C" int dynopt_patch_primitives(void) { return -1; }
static uint64_t now_ns(void) {
    struct timespec ts; clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
}
int main(int argc, char** argv) {
    if (argc < 2) return 2;
    int calls = atoi(argv[1]);
    const char* cover_so = argc > 2 ? argv[2] : nullptr;
    void* xh = dlopen("@LIB@", RTLD_NOW | RTLD_LOCAL);
    if (!xh) { fprintf(stderr, "timing: dlopen libx265 failed: %s\n", dlerror()); return 3; }
    setup_t setup = (setup_t)dlsym(xh, "@SETUP@");
    x265_param p; memset(&p, 0, sizeof(p)); p.internalBitDepth = 8; p.cpuid = 0;
    setup(&p);
    EncoderPrimitives* P = (EncoderPrimitives*)dlsym(xh, "@PRIM@");
    if (cover_so) {
        void* ph = dlopen(cover_so, RTLD_NOW | RTLD_LOCAL);
        if (!ph) { fprintf(stderr, "timing: dlopen cover .so failed: %s\n", dlerror()); return 5; }
        typedef int (*patch_t)(void);
        patch_t pf = (patch_t)dlsym(ph, "dynopt_patch_primitives");
        if (!pf) { fprintf(stderr, "timing: cover .so has no patch fn\n"); return 6; }
        if (pf() < 0) { fprintf(stderr, "timing: cover patch failed\n"); return 7; }
    }
    typedef @RET@ (*fn_t)(@PARAMS@);
    fn_t fn = (fn_t)(@UPSTREAM@);
    if (!fn) { fprintf(stderr, "timing: upstream @KERNEL@ missing\n"); return 4; }
@DECLS@
@FILL@
    for (int i = 0; i < 2000; i++) fn(@UPARGS@);
    uint64_t t0 = now_ns();
    for (int i = 0; i < calls; i++) fn(@UPARGS@);
    uint64_t dt = now_ns() - t0;
    printf("TM @KERNEL@ %llu %d\n", (unsigned long long)(dt / (uint64_t)calls), calls);
    return 0;
}
'''

PATCH_CPP_TMPL = r'''#include <cstdint>
#include <cstring>
#include <cstdio>
#include <dlfcn.h>
#include "common/primitives.h"
using namespace X265_NS;
extern "C" void dynopt_@KERNEL@_cov@CID@(@CAND_PARAMS@);
@ADAPTER_DEF@
extern "C" int dynopt_patch_primitives(void) {
    void* xh = dlopen("@LIB@", RTLD_NOW | RTLD_LOCAL);
    if (!xh) return -1;
    EncoderPrimitives* P = (EncoderPrimitives*)dlsym(xh, "@PRIM@");
    if (!P) return -2;
    @ASSIGN@;
    return 1;
}
__attribute__((constructor)) static void dynopt_probe_ctor(void) {}

namespace X265_NS {
void x265_setup_primitives(x265_param* param);
}
namespace X265_NS {
void x265_setup_primitives(x265_param* param)
{
    typedef void (*setup_t)(x265_param*);
    static setup_t orig = nullptr;
    if (!orig)
        orig = reinterpret_cast<setup_t>(dlsym(
            RTLD_NEXT,
            "_ZN4x26521x265_setup_primitivesEP10x265_param"));
    if (orig)
        orig(param);
    if (param && param->internalBitDepth == 8)
        dynopt_patch_primitives();
}
}
'''
# ---- C++ generation -------------------------------------------------------


def _decls(spec):
    decls = []
    for i, size in enumerate(spec["buffers"]):
        decls.append("    alignas(64) static uint8_t ob%d[%d];"
                     % (i, size + 64))
    last_bi = _ptr_bufs(spec)[0][-1]
    out_bi = spec.get("out_buf", last_bi)
    decls.append("    alignas(64) static uint8_t oa%d[%d];"
                 % (out_bi, spec["buffers"][out_bi] + 64))
    return "\n".join(decls), out_bi


def _probe_cpp(kernel, spec, cover):
    cand = spec.get("adapter")
    if cand:
        cand_params = spec["cand_params"]
        assign = ("P->" + spec["upstream"].split("->", 1)[1] +
                  " = dynopt_sao_adapter;")
        adapter = (
            "static saoCuOrgE0_t dynopt_sao_orig = nullptr;\\n"
            "static void dynopt_sao_adapter(uint8_t* rec, int8_t* off,\\n"
            "    int width, int8_t* sign, intptr_t stride) {\\n"
            "    if (dynopt_sao_orig && width != 64)\\n"
            "        return dynopt_sao_orig(rec, off, width, sign, stride);\\n"
            "    dynopt_" + multicover.rname(kernel) + "_cov" +
            str(cover["id"]) +
            "(rec, off, sign, stride);\\n"
            "}")
    else:
        cand_params = spec["params"]
        assign = ("P->" + spec["upstream"].split("->", 1)[1] +
                  " = (decltype(P->" +
                  spec["upstream"].split("->", 1)[1] +
                  "))dynopt_" + multicover.rname(kernel) + "_cov" +
                  str(cover["id"]) + ";")
        adapter = "/* direct slot assignment */"
    cpp = PATCH_CPP_TMPL
    cpp = cpp.replace("@KERNEL@", multicover.rname(kernel))
    cpp = cpp.replace("@CID@", str(cover["id"]))
    cpp = cpp.replace("@CAND_PARAMS@", cand_params.replace("\n", " "))
    cpp = cpp.replace("@ADAPTER_DEF@", adapter.replace("\\n", "\n"))
    cpp = cpp.replace("@ASSIGN@", assign)
    cpp = cpp.replace("@LIB@", LIB)
    cpp = cpp.replace("@PRIM@", PRIMITIVES_SYM)
    return cpp


def _profile_cpp(kernel, spec, covers):
    params = spec["params"]
    cpp = PROFILE_CPP
    cpp = cpp.replace("@LIB@", LIB)
    cpp = cpp.replace("@SETUP@", SETUP_SYM)
    cpp = cpp.replace("@PRIM@", PRIMITIVES_SYM)
    cpp = cpp.replace("@RET@", spec["ret"])
    cpp = cpp.replace("@PARAMS@", ", ".join(
        p.strip() for p in params.split(",")))
    cpp = cpp.replace("@UPSTREAM@", spec["upstream"])
    cpp = cpp.replace("@KERNEL@", multicover.rname(kernel))
    decls, out_bi = _decls(spec)
    cpp = cpp.replace("@DECLS@", decls)
    covers_cpp = []
    for c in covers:
        cc = PROFILE_COVER
        cc = cc.replace("@KERNEL@", multicover.rname(kernel))
        cc = cc.replace("@CID@", str(c["id"]))
        elems = spec["compare_bytes"] // _elem_size(spec, out_bi)
        if spec.get("adapter"):
            cc = cc.replace("@CFTYPE@", "cand_t")
        else:
            cc = cc.replace("@CFTYPE@", "fn_t")
        cc = cc.replace("@POSMAX@",
                        "        static uint32_t pos_max[%d];"
                        % elems)
        fill = _fill_block(spec)
        if spec.get("inplace"):
            fill += ("\n            memcpy(oa0, ob0, %d);"
                     % spec["buffers"][0])
        cc = cc.replace("@FILL@", fill)
        if spec.get("inplace"):
            cc = cc.replace("@ZEROOUT@", "/* in-place: oa0/ob0 primed */")
        else:
            cc = cc.replace("@ZEROOUT@",
                            "memset(oa%d, 0, %d);\n"
                            "            memset(ob%d, 0, %d);"
                            % (out_bi, spec["compare_bytes"],
                               out_bi, spec["compare_bytes"]))
        cc = cc.replace("@OUTB@", str(out_bi))
        cc = cc.replace("@OUTBYTES@", str(spec["compare_bytes"]))
        cc = cc.replace("@ELEMS@", str(elems))
        cc = cc.replace("@ELEMTYPE@",
                        "int16_t" if _elem_size(spec, out_bi) == 2
                        else "uint8_t")
        cc = cc.replace("@UPARGS@", _call_args(spec, "oa", out_bi=out_bi))
        cc = cc.replace("@CFARGS@", _call_args(spec, "ob", cand=True))
        cc = cc.replace("@CANDTYPEDEF@",
                        "typedef void (*cand_t)(%s);"
                        % spec["cand_params"]
                        if spec.get("adapter") else "")
        cc = cc.replace("@TOP@", "5")
        covers_cpp.append(cc)
    cpp = cpp.replace("@COVERS@", "\n".join(covers_cpp))
    return cpp


def _timing_cpp(kernel, spec):
    cpp = TIMING_CPP
    cpp = cpp.replace("@LIB@", LIB)
    cpp = cpp.replace("@SETUP@", SETUP_SYM)
    cpp = cpp.replace("@PRIM@", PRIMITIVES_SYM)
    cpp = cpp.replace("@RET@", spec["ret"])
    params = ", ".join(p.strip() for p in
                       spec["params"].split(","))
    cpp = cpp.replace("@PARAMS@", params)
    cpp = cpp.replace("@UPSTREAM@", spec["upstream"])
    cpp = cpp.replace("@KERNEL@", multicover.rname(kernel))
    decls, out_bi = _decls(spec)
    fill = _fill_block(spec)
    fill = fill.replace("it * 131", "0").replace("it * 5", "11")
    fill = fill.replace(" + it", "")
    cpp = cpp.replace("@DECLS@", decls)
    cpp = cpp.replace("@FILL@", fill)
    cpp = cpp.replace("@UPARGS@", _call_args(spec, "ob"))
    return cpp


# ---- verdict policy (pure, unit-testable) --------------------------------


def verdict(bit_exact, max_abs, bound, speedup, exact_threshold=1.0,
           bounded_threshold=1.05):
    """Arbitration policy for docs/87 step 5.

    Exact candidates ship on any measured gain (qemu noise aside);
    bounded (non-bit-exact) candidates must win clearly (>5%) before
    release -- plus the step-7 bounded gate and the 950/TBL validation.
    """
    if max_abs is None:
        return "missing"
    if bit_exact:
        return "ship" if speedup is not None \
            and speedup > exact_threshold else "hold_exact"
    if max_abs <= bound:
        return "ship" if speedup is not None \
            and speedup > bounded_threshold else "hold_bounded"
    return "exclude"
# ---- build/run helpers ----------------------------------------------------


def _run(cmd, env=None, cwd=None, timeout=1200):
    return subprocess.run(cmd, capture_output=True, text=True, env=env,
                          cwd=cwd, timeout=timeout)


def toolchain(args, workdir, kernel):
    """(obj-per-cover build plan, probe libs, bins) all in one pass."""
    if args.native:
        prefix, qemu = "", []
    else:
        prefix, qemu = "aarch64-linux-gnu-", [
            "qemu-aarch64", "-cpu", args.cpu, "-L", "/usr/aarch64-linux-gnu"]
    march = ISA_MARCH["sve2"]
    return prefix, qemu, march


def main():
    ap = argparse.ArgumentParser(prog="dev_profile.py", description=__doc__)
    ap.add_argument("--kernels", required=True,
                    help="comma separated: dct32,interp8-32,sao")
    ap.add_argument("--target", default="qemu",
                    choices=("qemu", "920B", "710", "950", "native"))
    ap.add_argument("--native", action="store_true")
    ap.add_argument("--cpu", default="max,sve-max-vq=2")
    ap.add_argument("--samples", type=int, default=300)
    ap.add_argument("--bench-iters", type=int, default=120000)
    ap.add_argument("--bounds", default="{}",
                    help='JSON {"kernel": max_abs}; default per-kernel')
    ap.add_argument("--workdir", default=None)
    ap.add_argument("--out-dir", default=None)
    ap.add_argument("--json", default="")
    ap.add_argument("--skip-bench", action="store_true")
    ap.add_argument("--scalars", default="",
                    help="semicolon list kernel=v0,v1.. overriding scalars")
    args = ap.parse_args()

    kernels = [k.strip() for k in args.kernels.split(",") if k.strip()]
    bounds = json.loads(args.bounds) or {}
    scalar_ovr = {}
    for item in args.scalars.split(";"):
        item = item.strip()
        if not item:
            continue
        k, vals = item.split("=")
        scalar_ovr[k.strip()] = [int(v) for v in vals.split(",")]
    out_dir = args.out_dir or os.path.join(
        ROOT, "release", "step5-" + args.target)
    os.makedirs(out_dir, exist_ok=True)
    workdir = args.workdir or tempfile.mkdtemp(prefix="devprof-")
    os.makedirs(workdir, exist_ok=True)
    libdir = os.path.join(ROOT, "build", "x265-8-cross-sve2")
    env = dict(os.environ)
    env["LD_LIBRARY_PATH"] = libdir
    prefix, qemu, march = toolchain(args, workdir, ",".join(kernels))
    cc = [prefix + "g++", "-fPIC", "-O3", "-march=" + march,
          "-DX265_DEPTH=8", "-DX265_NS=x265",
          "-I", os.path.join(ROOT, "third_party", "x265", "source"),
          "-I", libdir]
    host_cc = [prefix + "g++", "-O2", "-DX265_DEPTH=8", "-DX265_NS=x265",
               "-I", os.path.join(ROOT, "third_party", "x265", "source"),
               "-I", libdir]

    report = {"machine": {"tag": args.target, "cpu": args.cpu,
                          "native": args.native, "qemu": not args.native},
              "samples": args.samples,
              "bench_iters": args.bench_iters,
              "kernels": [], "skipped": []}

    for kernel in kernels:
        sp = dict(bench_spec(kernel))
        if kernel in scalar_ovr:
            sp["scalars"] = scalar_ovr[kernel]
            sp["call_scalars"] = scalar_ovr[kernel]
            sp["shape"] = sp.get("shape", "") + " scalars=%s" % (
                ",".join(str(v) for v in sp["scalars"]))
        if not sp:
            report["skipped"].append([kernel, "no bench spec"])
            continue
        kn = multicover.rname(kernel)
        sym = KERNEL_COVERS[kernel][1]
        covers, dflt = multicover.plan_covers(
            kernel, sym, workdir,
            extra_covers=EXTRA_COVERS.get(kernel))
        if not covers:
            report["skipped"].append([kernel, "no registered covers"])
            continue
        entry = {"kernel": kernel, "symbol": sym, "default_id": dflt,
                 "upstream": sp["upstream"], "shape": sp.get("shape"),
                 "domain": "resid9/pixel/int8 (spec-driven)",
                 "covers": []}

        # compile cover objects
        objs = []
        for c in covers:
            obj = os.path.join(workdir, "%s-c%d.o" % (kn, c["id"]))
            r = _run(cc + ["-c", c["src"], "-o", obj])
            if r.returncode != 0:
                report["skipped"].append(
                    [kernel, "cover %d compile fail: %s"
                     % (c["id"], (r.stdout + r.stderr)[-300:])])
                continue
            objs.append((c, obj))

        # profile probe (all covers) + per-cover probes
        all_objs = [o for _, o in objs]
        probe_all = os.path.join(workdir, "%s-probe-all.so" % kn)
        patch_src = os.path.join(workdir, "%s-patch.cpp" % kn)
        with open(patch_src, "w", encoding="utf-8") as f:
            f.write(_probe_cpp(kernel, sp, objs[0][0]))
        r = _run(host_cc + ["-shared", "-o", probe_all] + all_objs +
                 [patch_src, "-ldl"])
        if r.returncode != 0:
            report["skipped"].append(
                [kernel, "probe link fail: %s" % r.stderr[-400:]])
            continue
        cover_so = {}
        for c, obj in objs:
            so = os.path.join(workdir, "%s-c%d.so" % (kn, c["id"]))
            ps = os.path.join(workdir, "%s-patch-c%d.cpp"
                              % (kn, c["id"]))
            with open(ps, "w", encoding="utf-8") as f:
                f.write(_probe_cpp(kernel, sp, c))
            r = _run(host_cc + ["-shared", "-o", so, obj, ps, "-ldl"])
            if r.returncode != 0:
                continue
            cover_so[c["id"]] = so

        # profile binary
        prof_src = os.path.join(workdir, "%s-profile.cpp" % kn)
        with open(prof_src, "w", encoding="utf-8") as f:
            f.write(_profile_cpp(kernel, sp, covers))
        prof_bin = os.path.join(workdir, "%s-profile" % kn)
        r = _run(host_cc + ["-o", prof_bin, prof_src, "-ldl",
                            "-L", libdir,
                            "-Wl,--unresolved-symbols=ignore-in-shared-libs",
                            "-Wl,-rpath-link,/usr/aarch64-linux-gnu/lib",
                            "-Wl,--export-dynamic", "-lx265"])
        if r.returncode != 0:
            report["skipped"].append(
                [kernel, "profile build fail: %s" % r.stderr[-500:]])
            continue
        pr = _run(qemu + [prof_bin, probe_all, str(args.samples)], env=env)
        profile = {}
        for m in PROF_RE.finditer(pr.stdout):
            profile[int(m.group(2))] = {
                "status": m.group(3), "max_abs": int(m.group(4)),
                "mean_abs_x1000": int(m.group(5)),
                "l1": int(m.group(6)), "l2_x1000": int(m.group(7)),
                "diff_count": int(m.group(8)),
                "iters": args.samples}
        if pr.returncode != 0 or not profile:
            report["kernels"].append({
                "kernel": kernel, "skipped": True,
                "stdout_head": pr.stdout[:300], "rc": pr.returncode})
            report["skipped"].append(
                [kernel, "profile run empty rc=%d %r"
                 % (pr.returncode, pr.stderr[:300])])
            continue
            report["skipped"].append(
                [kernel, "profile run empty rc=%d %r"
                 % (pr.returncode, pr.stderr[:300])])
            continue

        # timing: upstream vs per-cover
        arms = {}
        if not args.skip_bench:
            tm_src = os.path.join(workdir, "%s-timing.cpp" % kn)
            with open(tm_src, "w", encoding="utf-8") as f:
                f.write(_timing_cpp(kernel, sp))
            tm_bin = os.path.join(workdir, "%s-timing" % kn)
            r = _run(host_cc + ["-o", tm_bin, tm_src, "-ldl",
                                "-L", libdir,
                                "-Wl,--unresolved-symbols=ignore-in-shared-libs",
                                "-Wl,-rpath-link,/usr/aarch64-linux-gnu/lib",
                                "-Wl,--export-dynamic", "-lx265"])
            if r.returncode != 0:
                report["skipped"].append(
                    [kernel, "timing build fail: %s"
                     % (r.stdout + r.stderr)[-250:]])
            else:
                ur = _run(qemu + [tm_bin, str(args.bench_iters)], env=env)
                tm = TM_RE.search(ur.stdout)
                if tm:
                    arms["upstream_ns"] = int(tm.group(2))
                else:
                    report["skipped"].append(
                        [kernel, "timing upstream run: rc=%d %r"
                         % (ur.returncode, ur.stderr[:160])])
                for c, _o in objs:
                    so = cover_so.get(c["id"])
                    if not so:
                        continue
                    cr = _run(qemu + [tm_bin, str(args.bench_iters), so],
                              env=env)
                    tm2 = TM_RE.search(cr.stdout)
                    if tm2:
                        arms[c["id"]] = int(tm2.group(2))
                    else:
                        report["skipped"].append(
                            [kernel, "cover %d timing rc=%d %r"
                             % (c["id"], cr.returncode,
                                cr.stderr[:160])])
        up_ns = arms.get("upstream_ns")

        for c, _o in objs:
            p = profile.get(c["id"])
            if not p:
                entry["covers"].append(
                    {"id": c["id"], "letter": c["letter"],
                     "profile": None, "arm_ns": arms.get(c["id"]),
                     "upstream_ns": up_ns, "verdict": "missing"})
                continue
            bit_exact = p["status"] == "exact"
            bound = bounds.get(kernel, BOUND_DEFAULT.get(kernel, 0))
            cov_ns = arms.get(c["id"])
            speedup = (up_ns / cov_ns) if up_ns and cov_ns else None
            entry["covers"].append({
                "id": c["id"], "letter": c["letter"],
                "profile": p, "bound": bound,
                "bit_exact": bit_exact,
                "arm_ns": cov_ns, "upstream_ns": up_ns,
                "speedup": round(speedup, 4) if speedup else None,
                "verdict": verdict(bit_exact, p["max_abs"], bound,
                                   speedup)})
        report["kernels"].append(entry)

    out_json = args.json or os.path.join(out_dir,
                                         "profile-%s.json" % args.target)
    with open(out_json, "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2, sort_keys=True)
        f.write("\n")
    print("dev_profile done -> %s" % out_json)
    for e in report["kernels"]:
        if "covers" not in e:
            continue
        for c in e["covers"]:
            print("  %s cov%d(%s) %s max=%s speedup=%s"
                  % (e["kernel"], c["id"], c["letter"],
                     c["verdict"],
                     c["profile"] and c["profile"]["max_abs"],
                     c["speedup"]))
    for s in report["skipped"]:
        print("  SKIP %s: %s" % (s[0], s[1][:160]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
