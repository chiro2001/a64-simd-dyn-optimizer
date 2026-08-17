#!/usr/bin/env python3
"""Layout search driver, driven by the kernel manifest (docs/16).

Enumerates the cartesian product of the manifest's layout axes, generates
each candidate, compiles it (ACLE or direct asm backend), runs the
upstream-exact differential in QEMU (fixed VL from the manifest), and
records true-dynamic instruction counts. Every distinct body must still
be measured on the target machine later; this is the static/dynamic
funnel. Search space is kept small (<60s) by design; add axes/values in
the manifest when the optimizer gains new structure.

Usage:
  python3 tools/search_sve2_layouts.py [--kernel dct16] [--backend asm|acle]
      [--outdir experiments/m30-dct16-search/layout-search]

Exit code 0 only if at least one candidate passes the upstream-exact gate.
"""

import argparse
import concurrent.futures
import hashlib
import json
import os
import re
import subprocess
import sys
import time

try:
    import yaml
except ImportError:
    yaml = None

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "tools"))
from memguard import install as install_memguard  # noqa: E402

from emit_dct16_sve2_asm import assemble, bootstrap_cpp  # noqa: E402
from kernel_manifest import layout_plans, load_manifest, repo_path  # noqa: E402
from gen_verify import generate as gen_verify  # noqa: E402
from parse_qemu_trace import parse_exec  # noqa: E402


QEMU = ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu",
        "-cpu", "max,sve-max-vq=2"]
QEMU_SVE2P3 = os.path.join(
    ROOT, os.environ.get("DYNOPT_QEMU_SVE2P3",
                         "build/qemu-build/qemu-aarch64"))

_CXX = "aarch64-linux-gnu-g++"
_CXX_OVERRIDE = None
_OPT_EXTRA = ""
_ISA = None

ISA_MARCH = {
    "neon": "armv8.2-a+dotprod",
    "sve1": "armv8.2-a+sve+dotprod",
    "sve2": "armv8.2-a+sve2",
    "sve2p1": "armv9.4-a+sve2p1",
    "sve2p3": "armv9.4-a+sve2p3",
}

ISA_MATTR = {
    "neon": "+dotprod",
    "sve1": "+sve",
    "sve2": "+sve2",
    "sve2p1": "+sve2p1",
    "sve2p3": "+sve2p3",
}

ISA_RANK = {"neon": 0, "sve1": 1, "sve2": 2, "sve2p1": 3, "sve2p2": 4,
            "sve2p3": 5}

# Kernels whose emitter has a real NEON lowering (no SVE intrinsics).
# `--isa neon` refuses other kernels instead of silently building SVE
# source with a NEON-only -march.
NEON_SUPPORTED_KERNELS = {
    "cost-coeff-nxn",
    "find-pos-first-last",
    "pel-filter-luma-strong",
    "quant",
    "sa8d16",
    "satd-8",
    "scan-pos-last",
}

# Layout values that lower to pure NEON/scalar code (or are inert axes).
NEON_SAFE_VALUES = {
    "neon", "neon-dot", "scalar", "none", "off", "default",
    "pack", "dot", "addp", "ctz", "clz", "tail",
    "popcount", "addv", "vpadal", "vaddlv", "vaddv", "seq", "pair",
    "vceqz", "full", "loop", 1, 2,
    "vpaddl",
    0,
}

# Layout axes whose values need a newer ISA than the default SVE2 build
# (the SVE2p1 sdot-s32 family and the SVE2p3 sdot.h path-B family).
ISA_REQUIRED = {
    "sve": "sve1",
    "sve1": "sve1",
    "sve2": "sve2",
    "sdot-d": "sve2",
    "sve-gather": "sve2",
    "sdot-h": "sve2p3",
    "sdot-s32": "sve2p1",
    "sdot-s32-split": "sve2p1",
    "sdot-s32-pair": "sve2p1",
}

BRANCH_MN = {"b", "br", "ret", "bl", "blr", "cbz", "cbnz", "tbz", "tbnz",
             "b.eq", "b.ne", "b.hs", "b.lo", "b.mi", "b.pl", "b.vs",
             "b.vc", "b.hi", "b.ls", "b.ge", "b.lt", "b.gt", "b.le",
             "b.al", "b.nv"}

SDOT_COMPUTES = ("sdot-s32", "sdot-s32-split", "sdot-h")


def is_sdot_compute(v):
    return v in SDOT_COMPUTES


def combo_isa_allowed(combo):
    """True when every layout value in `combo` is available at `_ISA`.
    Used by --isa to stop the search/generator from proposing SVE2p1/
    SVE2p3-only lowers on 920B (SVE1) or 950 (SVE2.0 and below)."""
    if not _ISA:
        return True
    if _ISA == "neon":
        # NEON mode is only meaningful when every axis value lowers to
        # pure NEON/scalar code; anything SVE-flavored is dropped.
        return all(v in NEON_SAFE_VALUES for v in combo.values())
    for axis, val in combo.items():
        req = ISA_REQUIRED.get(str(val))
        if req and ISA_RANK[req] > ISA_RANK[_ISA]:
            return False
    return True


def qemu_cmd(combo=None):
    """QEMU command prefix. SVE2p3 kernels (interp8 path B) need the custom
    build with the round-0018/0019 patches; the stock qemu-aarch64 SIGILLs
    on sdot.h. Override the binary with DYNOPT_QEMU_SVE2P3."""
    if combo and combo.get("compute") == "sdot-h":
        return [QEMU_SVE2P3, "-L", "/usr/aarch64-linux-gnu",
                "-cpu", "max,sve-max-vq=2"]
    return list(QEMU)


def candidate_march(combo):
    """GNU-as/-g++ -march for a candidate combo.

    sdot-s32 (SVE2p1 `sdot z.s, z.h, z.h`) needs armv9.4-a+sve2p1 and -O3
    (docs/27 §8.10: -O2 spills more); everything else stays armv8.2-a+sve2.
    """
    if _ISA:
        return ISA_MARCH[_ISA]
    if combo.get("compute") == "sdot-h":
        return "armv9.4-a+sve2p3"
    if is_sdot_compute(combo.get("compute")):
        return "armv9.4-a+sve2p1"
    return "armv8.2-a+sve2"


def candidate_opt(combo):
    if combo.get("cover"):
        # AGO backend (layout axis = cover id): keep the same -O3 the
        # auto-search (ago_auto_search.py) and the docs/82 family-table
        # scores use; -O2 would silently change the whole-object fused
        # counts (e.g. satd-16 best_sve1 48@-O2 vs 172@-O3) and skew the
        # ago_pred ranking against the calibrated -O3 features.
        return "-O3"
    if combo.get("compute") == "sdot-h":
        # clang -O3 gives 101 fused / 0 stack spills (GCC extra flags give
        # 103 fused / 14 spills); keep plain -O3 and let --cxx choose.
        return "-O3"
    if is_sdot_compute(combo.get("compute")):
        # 2026-08-14（round-0017 咨询实验 2）：-frename-registers 小赢；
        # --param=sched-pressure-algorithm=1 再赢（zip32 sdot fused
        # 5249→5111、stack 594→455、uOps -5.5%、MCA -0.8%，20k/lite
        # PASS）。-msve-vector-bits=256/-flive-range-shrinkage 无改善。
        return "-O3 -frename-registers --param=sched-pressure-algorithm=1"
    return "-O2"


def cxx_for(combo):
    """Compiler for a candidate. SVE2p3 interp8 path B defaults to clang
    (101 fused, no spills; docs/22 §5.3), like dct8; --cxx overrides."""
    if combo.get("compute") == "sdot-h" and _CXX_OVERRIDE is None:
        return "clang --target=aarch64-linux-gnu"
    return _CXX


def vector_width_counts(insns):
    """Split vector instructions by width: SVE zN (VL=256) vs NEON
    qN/dN (128-bit). Returns (sve, neon)."""
    sve = neon = 0
    for i in insns:
        ops = i.get("ops", "")
        if re.search(r"\b[z]\d+", ops):
            sve += 1
        elif re.search(r"\b[qd]\d+", ops):
            neon += 1
    return sve, neon


def run(cmd, timeout=None, **kw):
    return subprocess.run(cmd, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, text=True,
                          timeout=timeout, **kw)


def build_substituted(kernel, cpp_src, out, target="sve1"):
    """Build a shape-substituted microbenchmark binary for a candidate
    source (docs/29): C++ -> .S with the full feature set, rewrite
    unsupported mnemonics, assemble for target, link the microbench.
    Values are NOT exact; benchmark-only."""
    import tempfile
    tmp = tempfile.mkdtemp(prefix="subbench_")
    s_path = os.path.join(tmp, "k.s")
    sub_s = os.path.join(tmp, "k.sub.s")
    o_path = os.path.join(tmp, "k.o")
    run(["aarch64-linux-gnu-g++", "-O3", "-frename-registers",
         "--param=sched-pressure-algorithm=1",
         "-march=armv9.4-a+sve2p1", "-std=c++11", "-S",
         cpp_src, "-o", s_path], timeout=180)
    from substitute_unsupported import substitute as sub_pass
    lines = open(s_path).read().splitlines()
    with open(sub_s, "w") as f:
        f.write("\n".join(sub_pass(lines, target)) + "\n")
    asmarch = "armv8.2-a+sve" if target == "sve1" else "armv8.2-a+sve2"
    run(["aarch64-linux-gnu-as", "-march=" + asmarch,
         "-o", o_path, sub_s], timeout=120)
    mb = os.path.join(ROOT, "benchmarks", kernel + "_microbench.cpp")
    lib = os.path.join(ROOT, "build", "x265-8-clang-sve", "libx265.a")
    run(["aarch64-linux-gnu-g++", "-O2", "-static", "-std=c++11",
         "-march=" + asmarch, mb, o_path,
         "-Wl,--start-group", lib, "-Wl,--end-group",
         "-lpthread", "-ldl", "-o", out], timeout=180)
    return out


def symbol_range(binary, sym):
    out = run(["nm", binary, "--defined-only"]).stdout
    addrs = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 3 and parts[2] == sym:
            addrs.append(int(parts[0], 16))
    if not addrs:
        return None
    start = min(addrs)
    nxt = None
    for line in out.splitlines():
        parts = line.split()
        if len(parts) < 3:
            continue
        try:
            a = int(parts[0], 16)
        except ValueError:
            continue
        if a > start and (nxt is None or a < nxt) and parts[1] in ("T", "t"):
            nxt = a
    return start, (nxt if nxt is not None else start + 1)


def trace_to_mca(trace_log, start, end, out_s):
    """Convert a QEMU dynamic trace (--exec format) into an llvm-mca input
    file: the real executed instruction stream with branches/returns
    removed (m33 dynamic-stream口径, docs/10 §5.1)."""
    insns = parse_exec(trace_log, start, end)
    with open(out_s, "w") as f:
        f.write(".arch armv8.2-a+sve2\n.text\n")
        for i in insns:
            if i["mn"] in BRANCH_MN:
                continue
            ops = i["ops"]
            # strip inline comments (e.g. `// implicit-def`) which llvm-mc
            # rejects in a standalone file
            ops = ops.split("//")[0].strip()
            f.write(i["mn"] + (" " + ops if ops else "") + "\n")
    return len(insns)


def run_dynamic_mca(trace_log, start, end, out_s, mcpu="neoverse-v2",
                    mattr="+sve2", fix_driver=None, mca_bin="llvm-mca",
                    mca_arch=None):
    """LLVM-MCA on the complete dynamic execution stream. Returns
    (cycles, uops) or (None, None) if MCA fails. fix_driver: trace driver
    binary for objdump repair of QEMU's .byte (SVE2p1 sdot, docs/26 §5)."""
    if fix_driver:
        from fix_dynamic_trace import parse_exec_fixed
        insns, _ = parse_exec_fixed(trace_log, start, end, fix_driver)
        # Default arch matches the SVE2p1 sdot case that motivated the
        # repair path; SVE2p3 kernels (sdot.h) must pass the arch that the
        # candidate was assembled with, otherwise llvm-mc silently skips
        # the unsupported instructions (docs/22 §5.3).
        arch = ".arch %s\n" % (mca_arch or "armv9.4-a+sve2p1")
        with open(out_s, "w") as f:
            f.write(arch + ".text\n")
            for i in insns:
                if i["mn"] in BRANCH_MN:
                    continue
                ops = i["ops"].split("//")[0].strip()
                f.write(i["mn"] + (" " + ops if ops else "") + "\n")
        total = len(insns)
    else:
        total = trace_to_mca(trace_log, start, end, out_s)
    r = subprocess.run(
        [mca_bin, "-mtriple=aarch64", "-mcpu=" + mcpu,
         "-mattr=" + mattr, "-iterations=1",
         "-skip-unsupported-instructions=parse-failure", out_s],
        capture_output=True, text=True, timeout=180)
    cycles = uops = None
    for ln in r.stdout.splitlines():
        if ln.startswith("Total Cycles:"):
            cycles = int(ln.split(":")[1].strip())
        if ln.startswith("Total uOps:"):
            uops = int(ln.split(":")[1].strip())
    if r.returncode != 0 and cycles is None:
        print("mca WARN %s: rc=%d %s" % (out_s, r.returncode,
                                         r.stderr.strip().splitlines()[-1:]
                                         if r.stderr else ""))
    return cycles, uops, total


def candidate_range(row, outdir, manifest, backend, kernel):
    """Resolve the traced [start, end) range for a row. New rows store it
    at measurement time; cached rows (old verify_cache.json) have the
    trace driver and symbols on disk, so we recompute it."""
    if row.get("range"):
        return int(row["range"][0], 16), int(row["range"][1], 16)
    # Cached rows may lack a stored range. Prefer the actual executed
    # address extent of the on-disk trace (the -dfilter window), which is
    # authoritative; the symbol-based recompute below can resolve a
    # narrower range (e.g. op backend pass symbol vs the full kernel) and
    # silently truncate the proxy inputs.
    trace = os.path.join(outdir, row.get("tag", "") + "-trace.log")
    if os.path.exists(trace):
        try:
            from parse_qemu_trace import parse_exec
            insns = parse_exec(trace, 0, 1 << 63)
            if insns:
                lo = min(i["addr"] for i in insns)
                hi = max(i["addr"] for i in insns) + 4
                return lo, hi
        except Exception:
            pass
    driver = os.path.join(outdir, row.get("tag", "") + "-trace-driver")
    if not os.path.exists(driver):
        return None
    if backend == "op" and kernel in ("dct32", "dct16"):
        start_syms = ["_ZL9op_pass_4PKsPsl"]
    else:
        start_syms = manifest["candidate"].get(
            "range_start", manifest["candidate"]["symbol"])
    if isinstance(start_syms, str):
        start_syms = [start_syms]
    rng = None
    for start_sym in start_syms:
        rng = symbol_range(driver, start_sym)
        if rng:
            break
    if rng is None:
        return None
    end_sym = manifest["candidate"].get("range_end")
    if end_sym:
        rng_end = symbol_range(driver, end_sym)
        if rng_end is not None:
            return rng[0], rng_end[1]
    return rng[0], rng[1]


def true_dynamic(binary, start, end, log, timeout=None, counts_only=True,
                 vl_bytes=32, combo=None, fix_driver=None):
    r = run(qemu_cmd(combo) + ["-one-insn-per-tb", "-d", "exec,in_asm",
                               "-dfilter", "0x%x..0x%x" % (start, end),
                               "-D", log, binary], timeout=timeout)
    if r.returncode != 0:
        return None
    p = run(["python3", os.path.join(ROOT, "tools/parse_qemu_trace.py"),
             log, hex(start), hex(end), "--exec", "--json", log + ".json",
             "--vl-bytes", str(vl_bytes)]
             + (["--stream"] if counts_only else [])
             + (["--fix-driver", fix_driver] if fix_driver else []),
             timeout=timeout)
    if p.returncode != 0:
        return None
    d = json.load(open(log + ".json"))
    c = d.get("counts", {})
    if "vector_fused_uop" not in c:
        from parse_qemu_trace import scatter_gather_count  # noqa
        sg = scatter_gather_count(d.get("vector", []))
        c = dict(c)
        c["scatter_gather"] = sg
        sg_uops = sg * max(1, vl_bytes // 8)
        c["scatter_gather_uops"] = sg_uops
        c["vector_fused_uop"] = (c.get("vector_fused", len(d["vector"]))
                                 + (sg_uops - sg))
    if isinstance(d.get("vector"), list):
        n_vec = len(d["vector"])
    else:
        n_vec = d.get("vector", 0)
    n_insns = (len(d["instructions"]) if "instructions" in d
               else d.get("total", 0))
    return {"total": d.get("total", n_insns),
            "vector": n_vec,
            "movprfx": c.get("movprfx", 0),
            "vector_fused": c.get("vector_fused", n_vec),
            "scatter_gather": c.get("scatter_gather", 0),
            "scatter_gather_uops": c.get("scatter_gather_uops",
                                         c.get("scatter_gather", 0)),
            "stack_vector": c.get("stack_vector", 0),
            "vector_fused_uop": c.get("vector_fused_uop", n_vec)}


def make_emitter(kernel, backend="acle"):
    """Return emit(combo) for the kernel's manifest layout axes."""
    if backend == "ago":
        # AGO sidecar backend (M4): covers come from optimizer/ago
        # cover templates; the layout axis is the cover id (A/B/C/...).
        _ago_opt = os.path.join(ROOT, "optimizer")
        if _ago_opt not in sys.path:
            sys.path.insert(0, _ago_opt)
        if kernel == "satd-8":
            from ago.covers_satd8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_8x8_sve2")
            return emit_fn
        if kernel == "sa8d":
            from ago.covers_sa8d8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sa8d_8x8_sve2")
            return emit_fn
        if kernel == "sa8d16":
            from ago.covers_sa8d16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sa8d_16x16_sve2")
            return emit_fn
        if kernel == "sa8d-32x32":
            from ago.covers_sa8d32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sa8d_32x32_sve2")
            return emit_fn
        if kernel == "sa8d-64x64":
            from ago.covers_sa8d64x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sa8d_64x64_sve2")
            return emit_fn
        if kernel == "interp8":
            from ago.covers_interp8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_interp8_8x8_sve2")
            return emit_fn
        if kernel == "interp8-64x64":
            from ago.covers_interp8_64x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_64x64_sve2")
            return emit_fn
        if kernel == "interp8-32":
            from ago.covers_interp8_32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_32x32_sve2")
            return emit_fn
        if kernel == "interp8-16x32":
            from ago.covers_interp8_16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x32_sve2")
            return emit_fn
        if kernel == "interp8-16x8":
            from ago.covers_interp8_16x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x8_sve2")
            return emit_fn
        if kernel == "interp8-8x16":
            from ago.covers_interp8_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_8x16_sve2")
            return emit_fn
        if kernel == "dct16":
            from ago.covers_dct16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_dct16_sve2_shared")
            return emit_fn
        if kernel == "dct32":
            from ago.covers_dct32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_dct32_sve2_shared")
            return emit_fn
        if kernel == "dct8":
            from ago.covers_dct8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_dct8_sve2_shared")
            return emit_fn
        if kernel == "satd-16":
            from ago.covers_satd16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_16x16_sve2")
            return emit_fn
        if kernel == "satd-16x32":
            from ago.covers_satd16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_16x32_sve2")
            return emit_fn
        if kernel == "satd-16x64":
            from ago.covers_satd16x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_16x64_sve2")
            return emit_fn
        if kernel == "satd-32x16":
            from ago.covers_satd32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_32x16_sve2")
            return emit_fn
        if kernel == "satd-32x32":
            from ago.covers_satd32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_32x32_sve2")
            return emit_fn
        if kernel == "satd-64x16":
            from ago.covers_satd64x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_64x16_sve2")
            return emit_fn
        if kernel == "satd-32x64":
            from ago.covers_satd32x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_32x64_sve2")
            return emit_fn
        if kernel == "satd-64x32":
            from ago.covers_satd64x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_64x32_sve2")
            return emit_fn
        if kernel == "satd-64x48":
            from ago.covers_satd64x48 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_64x48_sve2")
            return emit_fn
        if kernel == "satd-64x64":
            from ago.covers_satd64x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_64x64_sve2")
            return emit_fn
        if kernel == "satd-32x8":
            from ago.covers_satd32x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_32x8_sve2")
            return emit_fn
        if kernel == "satd-16x4":
            from ago.covers_satd16x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_16x4_sve2")
            return emit_fn
        if kernel == "satd-8x16":
            from ago.covers_satd_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_8x16_sve2")
            return emit_fn
        if kernel == "satd-8x4":
            from ago.covers_satd_8x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_8x4_sve2")
            return emit_fn
        if kernel == "satd-8x32":
            from ago.covers_satd_8x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_8x32_sve2")
            return emit_fn
        if kernel == "satd-16x8":
            from ago.covers_satd_16x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_satd_16x8_sve2")
            return emit_fn
        if kernel == "sad":
            from ago.covers_sad import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sad_16x16_sve2")
            return emit_fn
        if kernel == "cost-coeff-nxn":
            from ago.covers_costcoeff import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_cost_coeff_nxn_sve2")
            return emit_fn
        if kernel == "sao-stats-e0":
            from ago.covers_sao_e0 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sao_stats_e0_64_sve2")
            return emit_fn
        if kernel == "sao-stats-e2":
            from ago.covers_sao_stats_e2 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_sao_stats_e2_64_sve2")
            return emit_fn
        if kernel == "sao-stats-e3":
            from ago.covers_sao_stats_e3 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sao_stats_e3_64_sve2")
            return emit_fn
        if kernel == "sao-b0":
            from ago.covers_sao_b0 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sao_b0_64x4_sve2")
            return emit_fn
        if kernel == "sao-e1":
            from ago.covers_sao_e1 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sao_e1_64x4_sve2")
            return emit_fn
        if kernel == "sao-e2":
            from ago.covers_sao_e2 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sao_e2_64_sve2")
            return emit_fn
        if kernel == "sao-e3":
            from ago.covers_sao_e3 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_sao_e3_64_sve2")
            return emit_fn
        if kernel == "sao-stats-e1":
            from ago.covers_sao_stats_e1 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_sao_stats_e1_64_sve2")
            return emit_fn
        if kernel == "sao-stats-bo":
            from ago.covers_sao_stats_bo import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_sao_stats_bo_64_sve2")
            return emit_fn
        if kernel == "chroma-addavg-8x8":
            from ago.covers_chroma_addavg_8x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_chroma_addavg_8x8_sve2")
            return emit_fn
        if kernel == "cu-sub-ps":
            from ago.covers_cu_sub_ps import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_cu_sub_ps_16x16_sve2")
            return emit_fn
        if kernel == "cu-add-ps":
            from ago.covers_cu_add_ps import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_cu_add_ps_16x16_sve2")
            return emit_fn
        if kernel == "cu-copy-pp":
            from ago.covers_cu_copy_pp import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_cu_copy_pp_sve2")
            return emit_fn
        if kernel == "chroma-copy-ps-16x16":
            from ago.covers_chroma_copy_ps_16x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_chroma_copy_ps_16x16_sve2")
            return emit_fn
        if kernel == "chroma-copy-pp-32x32":
            from ago.covers_chroma_copy_pp_32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_chroma_copy_pp_32x32_sve2")
            return emit_fn
        if kernel == "chroma-copy-pp-8x8":
            from ago.covers_chroma_copy_pp_8x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_chroma_copy_pp_8x8_sve2")
            return emit_fn
        if kernel == "cu-copy-ss":
            from ago.covers_cu_copy_ss import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_cu_copy_ss_16x16_sve2")
            return emit_fn
        if kernel == "cu-copy-sp":
            from ago.covers_cu_copy_sp import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_cu_copy_sp_16x16_sve2")
            return emit_fn
        if kernel == "cu-copy-ps":
            from ago.covers_cu_copy_ps import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_cu_copy_ps_16x16_sve2")
            return emit_fn
        if kernel == "chroma-copy-ss-16x16":
            from ago.covers_chroma_copy_ss_16x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_chroma_copy_ss_16x16_sve2")
            return emit_fn
        if kernel == "chroma-copy-sp-16x16":
            from ago.covers_chroma_copy_sp_16x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_chroma_copy_sp_16x16_sve2")
            return emit_fn
        if kernel == "chroma-copy-pp":
            from ago.covers_chroma_copy_pp import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_chroma_copy_pp_sve2")
            return emit_fn
        if kernel == "idct32":
            from ago.covers_idct32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_idct32_sve2_shared")
            return emit_fn
        if kernel == "idct16":
            from ago.covers_idct16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_idct16_sve2_shared")
            return emit_fn
        if kernel == "interp8-vss-8x8":
            from ago.covers_interp8_vss_8x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_8x8_sve2")
            return emit_fn
        if kernel == "interp8vpp-8x4":
            from ago.covers_interp8vpp_8x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_8x4_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-8x32":
            from ago.covers_interp8vpp_8x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_8x32_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-8x16":
            from ago.covers_interp8vpp_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_8x16_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-64x64":
            from ago.covers_interp8vpp_64x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_64x64_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-64x48":
            from ago.covers_interp8vpp_64x48 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_64x48_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-64x32":
            from ago.covers_interp8vpp_64x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_64x32_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-64x16":
            from ago.covers_interp8vpp_64x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_64x16_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-32x8":
            from ago.covers_interp8vpp_32x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_32x8_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-32x64":
            from ago.covers_interp8vpp_32x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_32x64_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-32x24":
            from ago.covers_interp8vpp_32x24 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_32x24_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-32x16":
            from ago.covers_interp8vpp_32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_32x16_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-32":
            from ago.covers_interp8vpp_32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_32x32_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-24x32":
            from ago.covers_interp8vpp_24x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_24x32_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-16x8":
            from ago.covers_interp8vpp_16x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x8_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-16x64":
            from ago.covers_interp8vpp_16x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x64_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-16x4":
            from ago.covers_interp8vpp_16x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x4_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-16x32":
            from ago.covers_interp8vpp_16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x32_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-16x12":
            from ago.covers_interp8vpp_16x12 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x12_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-16":
            from ago.covers_interp8vpp_16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x16_sve2_vpp")
            return emit_fn
        if kernel == "interp8vpp-12x16":
            from ago.covers_interp8vpp_12x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_12x16_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-8x8":
            from ago.covers_interp4vpp_8x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_8x8_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-8x64":
            from ago.covers_interp4vpp_8x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_8x64_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-8x6":
            from ago.covers_interp4vpp_8x6 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_8x6_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-8x4":
            from ago.covers_interp4vpp_8x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_8x4_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-8x32":
            from ago.covers_interp4vpp_8x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_8x32_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-8x16":
            from ago.covers_interp4vpp_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_8x16_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-32x8":
            from ago.covers_interp4vpp_32x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_32x8_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-32x64":
            from ago.covers_interp4vpp_32x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_32x64_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-32x48":
            from ago.covers_interp4vpp_32x48 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_32x48_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-32x32":
            from ago.covers_interp4vpp_32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_32x32_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-32x24":
            from ago.covers_interp4vpp_32x24 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_32x24_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-32x16":
            from ago.covers_interp4vpp_32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_32x16_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-24x64":
            from ago.covers_interp4vpp_24x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_24x64_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-24x32":
            from ago.covers_interp4vpp_24x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_24x32_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-16x8":
            from ago.covers_interp4vpp_16x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_16x8_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-16x64":
            from ago.covers_interp4vpp_16x64 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_16x64_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-16x4":
            from ago.covers_interp4vpp_16x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_16x4_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-16x32":
            from ago.covers_interp4vpp_16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_16x32_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-16x24":
            from ago.covers_interp4vpp_16x24 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_16x24_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-16x12":
            from ago.covers_interp4vpp_16x12 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_16x12_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-16":
            from ago.covers_interp4vpp_16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_16x16_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-12x32":
            from ago.covers_interp4vpp_12x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_12x32_sve2_vpp")
            return emit_fn
        if kernel == "interp4vpp-12x16":
            from ago.covers_interp4vpp_12x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp4_12x16_sve2_vpp")
            return emit_fn
        if kernel == "interp8-vss-8x4":
            from ago.covers_interp8_vss_8x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_8x4_sve2")
            return emit_fn
        if kernel == "interp8-vss-8x16":
            from ago.covers_interp8_vss_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_8x16_sve2")
            return emit_fn
        if kernel == "interp8-vss-32x32":
            from ago.covers_interp8_vss_32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_32x32_sve2")
            return emit_fn
        if kernel == "interp8-vss-32x16":
            from ago.covers_interp8_vss_32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_32x16_sve2")
            return emit_fn
        if kernel == "interp8-vss-16x4":
            from ago.covers_interp8_vss_16x4 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_16x4_sve2")
            return emit_fn
        if kernel == "interp8-vss-16x32":
            from ago.covers_interp8_vss_16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_16x32_sve2")
            return emit_fn
        if kernel == "interp8-vss-16x16":
            from ago.covers_interp8_vss_16x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vss_16x16_sve2")
            return emit_fn
        if kernel == "interp8-vsp-8x8":
            from ago.covers_interp8_vsp_8x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vsp_8x8_sve2")
            return emit_fn
        if kernel == "interp8-vsp-8x16":
            from ago.covers_interp8_vsp_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vsp_8x16_sve2")
            return emit_fn
        if kernel == "interp8-vsp-32x32":
            from ago.covers_interp8_vsp_32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vsp_32x32_sve2")
            return emit_fn
        if kernel == "interp8-vsp-32x16":
            from ago.covers_interp8_vsp_32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vsp_32x16_sve2")
            return emit_fn
        if kernel == "interp8-vsp-16x32":
            from ago.covers_interp8_vsp_16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vsp_16x32_sve2")
            return emit_fn
        if kernel == "interp8-vsp-16x16":
            from ago.covers_interp8_vsp_16x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vsp_16x16_sve2")
            return emit_fn
        if kernel == "interp8-vps-8x8":
            from ago.covers_interp8_vps_8x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vps_8x8_sve2")
            return emit_fn
        if kernel == "interp8-vps-8x16":
            from ago.covers_interp8_vps_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vps_8x16_sve2")
            return emit_fn
        if kernel == "interp8-vps-32x32":
            from ago.covers_interp8_vps_32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vps_32x32_sve2")
            return emit_fn
        if kernel == "interp8-vps-32x16":
            from ago.covers_interp8_vps_32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vps_32x16_sve2")
            return emit_fn
        if kernel == "interp8-vps-16x32":
            from ago.covers_interp8_vps_16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vps_16x32_sve2")
            return emit_fn
        if kernel == "interp8-vps-16x16":
            from ago.covers_interp8_vps_16x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_vps_16x16_sve2")
            return emit_fn
        if kernel == "interp8-hps-8x32":
            from ago.covers_interp8_hps_8x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_8x32_sve2")
            return emit_fn
        if kernel == "interp8-hps-8x16":
            from ago.covers_interp8_hps_8x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_8x16_sve2")
            return emit_fn
        if kernel == "interp8-hps-32x8":
            from ago.covers_interp8_hps_32x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_32x8_sve2")
            return emit_fn
        if kernel == "interp8-hps-32x32":
            from ago.covers_interp8_hps_32x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_32x32_sve2")
            return emit_fn
        if kernel == "interp8-hps-32x16":
            from ago.covers_interp8_hps_32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_32x16_sve2")
            return emit_fn
        if kernel == "interp8-hps-16x8":
            from ago.covers_interp8_hps_16x8 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_16x8_sve2")
            return emit_fn
        if kernel == "interp8-hps-16x32":
            from ago.covers_interp8_hps_16x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_16x32_sve2")
            return emit_fn
        if kernel == "interp8-hps-16x16":
            from ago.covers_interp8_hps_16x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_hps_16x16_sve2")
            return emit_fn
        if kernel == "sao":
            from ago.covers_sao import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_sao_e0_64_sve2")
            return emit_fn
        if kernel == "find-pos-first-last":
            from ago.covers_find_pos_first_last import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_find_pos_first_last_sve2")
            return emit_fn
        if kernel == "pel-filter-luma-strong":
            from ago.covers_pel_filter_luma_strong import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_pel_filter_luma_strong_sve2")
            return emit_fn
        if kernel == "scale2d":
            from ago.covers_scale2d import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_scale2d_64to32_sve2")
            return emit_fn
        if kernel == "sign":
            from ago.covers_sign import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_sign_sve2")
            return emit_fn
        if kernel == "scan-pos-last":
            from ago.covers_scan_pos_last import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_scan_pos_last_sve2")
            return emit_fn
        if kernel == "pu-copy-pp":
            from ago.covers_pu_copy_pp import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_pu_copy_pp_sve2")
            return emit_fn
        if kernel == "pu-addavg":
            from ago.covers_pu_addavg import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_pu_addavg_16x16_sve2")
            return emit_fn
        if kernel == "sad-32":
            from ago.covers_sad_32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_sad_32x32_sve2")
            return emit_fn
        if kernel == "ssd":
            from ago.covers_ssd import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_sse_pp_16x16_sve2")
            return emit_fn
        if kernel == "mc":
            from ago.covers_mc import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_avg_pp_16x16_sve2")
            return emit_fn
        if kernel == "interp8-64x32":
            from ago.covers_interp8_64x32 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_64x32_sve2")
            return emit_fn
        if kernel == "interp8-32x16":
            from ago.covers_interp8_32x16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_32x16_sve2")
            return emit_fn
        if kernel == "interp8-16":
            from ago.covers_interp8_16 import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"), "dynopt_interp8_16x16_sve2")
            return emit_fn
        if kernel == "psy-cost-16x16":
            from ago.covers_psycost import emit_cover  # noqa: E402

            def emit_fn(combo):
                return emit_cover(combo.get("cover", "A"),
                                  "dynopt_psy_cost_pp_16x16_sve2")
            return emit_fn
        raise ValueError("AGO backend: kernel %s has no cover template"
                         % kernel)
    if backend == "gen":
        from gen_sve2_emit import make_generic_emitter
        return make_generic_emitter(kernel, isa=_ISA)
    if kernel == "dct16" and backend == "op":
        import sys as _sys
        _ir = os.path.join(ROOT, "optimizer", "ir")
        if _ir not in _sys.path:
            _sys.path.insert(0, _ir)
        from dct16_op_emit import emit_from_combo  # noqa: E402

        def emit_fn(combo):
            return emit_from_combo(combo)
        return emit_fn
    if kernel == "dct16":
        from emit_dct16_sve2_shared import emit

        def emit_fn(combo):
            return emit(pass1_layout=combo.get("pass1", "quarter"),
                        pass2_layout=combo.get("pass2", "upstream"),
                        pass1_k_tile=combo.get("pass1_k_tile", 2),
                        pass2_k_tile=combo.get("pass2_k_tile", 1),
                        narrow_merge=combo.get("narrow_merge", 0),
                        legacy_semantics=combo.get("legacy_semantics", 0),
                        legacy_even_full=combo.get("legacy_even_full", 0),
                        store_merge16=combo.get("store_merge16", 0),
                        pass1_even_factor=combo.get("pass1_even_factor", 0),
                        pass1_pack_zip=combo.get("pass1_pack_zip", 0),
                        pass2_pack_zip=combo.get("pass2_pack_zip", 0),
                        even_sve=combo.get("even_sve", 0))
        return emit_fn
    if kernel == "dct8":
        from emit_dct8_sve2_shared import emit

        def emit_fn(combo):
            return emit(k_tile=combo.get("k_tile", 1))
        return emit_fn
    if kernel == "satd-8" and _ISA == "neon":
        from emit_satd_neon_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sa8d":
        from emit_sa8d_sve2_shared import emit

        def emit_fn(combo):
            return emit(pack=combo.get("pack", "pair"),
                        reduce=combo.get("reduce", "neon"),
                        unroll=combo.get("unroll", 1))
        return emit_fn
    if kernel == "sa8d16":
        if _ISA == "neon":
            from emit_sa8d_neon_shared import emit_16x16

            def emit_fn(combo):
                return emit_16x16(
                    func_name="dynopt_sa8d_16x16_sve2",
                    reduce=combo.get("reduce", "vpadal"),
                    quad=combo.get("quad", "seq"))
        else:
            from emit_sa8d_sve2_shared import emit_16x16
            from emit_sa8d_neon_shared import emit_16x16 as emit_16x16_neon
            from emit_sa8d_neon_shared import emit_16x16_mixed

            def emit_fn(combo):
                load = combo.get("load", "sve")
                if load == "neon":
                    return emit_16x16_neon(
                        func_name="dynopt_sa8d_16x16_sve2",
                        reduce=combo.get("reduce_mix", "vaddlv"),
                        quad=combo.get("quad", "seq"))
                if load == "mixed":
                    return emit_16x16_mixed(
                        func_name="dynopt_sa8d_16x16_sve2",
                        reduce=combo.get("reduce_mix", "vaddlv"))
                return emit_16x16(
                    reduce_tail=combo.get("reduce_tail", "saddv"))
        return emit_fn
    if kernel == "idct16":
        from emit_idct16_sve2_shared import emit

        def emit_fn(combo):
            return emit(store=combo.get("store", "scalar"),
                        compute=combo.get("compute", "mul"))
        return emit_fn
    if kernel == "idct32":
        from emit_idct32_sve2_shared import emit

        def emit_fn(combo):
            return emit(store=combo.get("store", "scatter"),
                        compute=combo.get("compute", "mul"))
        return emit_fn
    if kernel == "dct32":
        from emit_dct32_sve2_shared import emit

        def emit_fn(combo):
            if backend == "op":
                import sys as _sys
                _ir = os.path.join(ROOT, "optimizer", "ir")
                if _ir not in _sys.path:
                    _sys.path.insert(0, _ir)
                from dataclasses import replace  # noqa: E402
                from dct32_op_emit import emit_from_plan  # noqa: E402
                from layout_ir import dct32_v31_plan  # noqa: E402
                lo = dict(
                    pass1_k2_slice=combo.get("pass1_k2_slice", 1),
                    # op backend currently lowers odd only via sdot.d
                    # lane-per-output (row-reduce = TODO hybrid).
                    odd_lowering="sdot.d",
                    narrow_batch=4,
                    constant_layout="derived-replicated",
                    acc_split=combo.get("acc_split", 1),
                    legacy_ex=combo.get("legacy_ex", 0),
                    legacy_k4=combo.get("legacy_k4", 0),
                    k0_even_sve=combo.get("k0_even_sve", 0),
                    k0_shared_mul=combo.get("k0_shared_mul", 0),
                    k0_merge8=combo.get("k0_merge8", 0),
                    k0_merge16=combo.get("k0_merge16", 0),
                    k0_epack=combo.get("k0_epack", 0),
                    sdot_indexed=combo.get("sdot_indexed", 0),
                    odd_from_k0packs=combo.get("odd_from_k0packs", 0),
                    k2k4_from_packs=combo.get("k2k4_from_packs", 0),
                    slice_kind=combo.get("slice_kind", "tbl2"),
                    row_group=combo.get("row_group", 4),
                    rewrites=[c for c in (combo.get("rw1", "none"),
                                          combo.get("rw2", "none"),
                                          combo.get("rw3", "none"),
                                          combo.get("rw4", "none"))
                              if c != "none"])
                return emit_from_plan(
                    replace(dct32_v31_plan(), lowering=lo),
                    func_name="dynopt_dct32_sve2_shared")
            return emit(layout=combo.get("layout", "v1"),
                        pass1_k2_slice=combo.get("pass1_k2_slice", 1),
                        odd_lowering=combo.get("odd_lowering", "sdot.d"),
                        narrow_batch=combo.get("narrow_batch", 4),
                        constant_layout=combo.get("constant_layout",
                                                  "derived-replicated"),
                        isa=combo.get("isa", "sve2"),
                        acc_split=combo.get("acc_split", 1),
                        leaf_ex=combo.get("leaf_ex", 1),
                        legacy_ex=combo.get("legacy_ex", 0))
        return emit_fn
    if kernel == "interp8":
        from emit_interp8_sve2_shared import emit, emit_sdot_h

        def emit_fn(combo):
            if combo.get("compute") == "sdot-h":
                # Emit under the manifest symbol so the shared trace driver
                # and generated verifier bind (same extern "C" signature).
                return emit_sdot_h(func_name="dynopt_interp8_8x8_sve2",
                                   pairsum=combo.get("pairsum", "addp"))
            return emit()
        return emit_fn
    if kernel in ("interp8-16", "interp8-32"):
        from emit_interp8_sve2_shared import emit_sdot_h
        n = 16 if kernel == "interp8-16" else 32

        def emit_fn(combo):
            # SVE2p3 path-B only (docs/22 §5.5); symbol matches the
            # manifest candidate so the trace driver/verifier bind.
            return emit_sdot_h(
                func_name="dynopt_interp8_%dx%d_sve2" % (n, n),
                width=n, height=n,
                unroll=combo.get("unroll") == "full",
                pairsum=combo.get("pairsum", "addp"))
        return emit_fn
    if kernel.startswith("interp8-") and \
            kernel not in ("interp8", "interp8-16", "interp8-32"):
        m = re.fullmatch(r"interp8-(\d+)x(\d+)", kernel)
        if not m:
            raise ValueError("unrecognized interp8 kernel %r" % kernel)
        w, h = int(m.group(1)), int(m.group(2))
        from emit_interp8_sve2_shared import emit_sdot_h

        def emit_fn(combo):
            return emit_sdot_h(
                func_name="dynopt_interp8_%dx%d_sve2" % (w, h),
                width=w, height=h,
                unroll=combo.get("unroll") == "full",
                pairsum=combo.get("pairsum", "addp"))
        return emit_fn
    if kernel == "interp8vpp-16":
        from emit_interp8_sve2_shared import emit_vpp_16x16

        def emit_fn(combo):
            return emit_vpp_16x16(
                acc_split=combo.get("acc_split", 1))
        return emit_fn
    if kernel == "interp8vpp-32":
        from emit_interp8_sve2_shared import emit_vpp_32x32

        def emit_fn(combo):
            return emit_vpp_32x32(
                acc_split=combo.get("acc_split", 1))
        return emit_fn
    if kernel.startswith("interp8vpp-") and \
            kernel not in ("interp8vpp-16", "interp8vpp-32"):
        m = re.fullmatch(r"interp8vpp-(\d+)x(\d+)", kernel)
        if not m:
            raise ValueError("unrecognized interp8vpp kernel %r" % kernel)
        w, h = int(m.group(1)), int(m.group(2))
        if w <= 0:
            raise ValueError("interp8vpp emitter requires positive width")
        from emit_interp8_sve2_shared import emit_vpp

        def emit_fn(combo):
            return emit_vpp(
                func_name="dynopt_interp8_%dx%d_sve2_vpp" % (w, h),
                width=w, height=h,
                acc_split=combo.get("acc_split", 1),
                tile=combo.get("tile"))
        return emit_fn
    if kernel == "interp4":
        from emit_interp4_sve2_shared import emit_16x16

        def emit_fn(combo):
            return emit_16x16()
        return emit_fn
    if kernel == "interp4-8":
        from emit_interp4_sve2_shared import emit_8x8

        def emit_fn(combo):
            return emit_8x8()
        return emit_fn
    if kernel == "interp4-32":
        from emit_interp4_sve2_shared import emit_32x32

        def emit_fn(combo):
            return emit_32x32()
        return emit_fn
    if kernel.startswith("interp4-") and \
            kernel not in ("interp4", "interp4-8", "interp4-32"):
        m = re.fullmatch(r"interp4-(\d+)x(\d+)", kernel)
        if not m:
            raise ValueError("unrecognized interp4 kernel %r" % kernel)
        w, h = int(m.group(1)), int(m.group(2))
        from emit_interp4_sve2_shared import emit as emit_hpp

        def emit_fn(combo):
            return emit_hpp(
                func_name="dynopt_interp4_%dx%d_sve2" % (w, h),
                width=w, height=h)
        return emit_fn
    if kernel == "interp4vpp-16":
        from emit_interp4_sve2_shared import emit_vpp_16x16

        def emit_fn(combo):
            return emit_vpp_16x16()
        return emit_fn
    if kernel.startswith("interp4vpp-") and kernel != "interp4vpp-16":
        m = re.fullmatch(r"interp4vpp-(\d+)x(\d+)", kernel)
        if not m:
            raise ValueError("unrecognized interp4vpp kernel %r" % kernel)
        w, h = int(m.group(1)), int(m.group(2))
        from emit_interp4_sve2_shared import emit_vpp

        def emit_fn(combo):
            return emit_vpp(
                func_name="dynopt_interp4_%dx%d_sve2_vpp" % (w, h),
                width=w, height=h)
        return emit_fn
    if kernel == "sad":
        from emit_sad_sve2_shared import emit_16x16

        def emit_fn(combo):
            return emit_16x16()
        return emit_fn
    if kernel == "dequant":
        from emit_dequant_normal_sve2_shared import emit

        def emit_fn(combo):
            return emit(combo)
        return emit_fn
    if kernel in ("dequant-scaling-gt", "dequant-scaling-le"):
        from emit_dequant_scaling_sve2_shared import emit as _emit_dqs
        _dqs_branch = "le" if kernel.endswith("-le") else "gt"

        def emit_fn(combo):
            return _emit_dqs(dict(combo, branch=_dqs_branch))
        return emit_fn
    if kernel == "quant":
        if _ISA == "neon":
            from emit_quant_neon_shared import emit_combo

            def emit_fn(combo):
                return emit_combo(combo)
        else:
            from emit_quant_sve2_shared import emit

            def emit_fn(combo):
                return emit(combo)
        return emit_fn
    if kernel == "nquant":
        from emit_nquant_sve2_shared import emit

        def emit_fn(combo):
            return emit(combo)
        return emit_fn
    if kernel == "sign":
        from emit_sign_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "find-pos-first-last":
        from emit_find_pos_first_last_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "scan-pos-last":
        from emit_scan_pos_last_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "cost-coeff-nxn":
        from emit_cost_coeff_nxn_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    _copy_shapes = {
        "cu-copy-pp": ("dynopt_cu_copy_pp_sve2", 32, 32),
        "pu-copy-pp": ("dynopt_pu_copy_pp_sve2", 16, 16),
        "chroma-copy-pp": ("dynopt_chroma_copy_pp_sve2", 16, 16),
        "chroma-copy-pp-32x32": ("dynopt_chroma_copy_pp_32x32_sve2",
                                 32, 32),
        "chroma-copy-pp-8x8": ("dynopt_chroma_copy_pp_8x8_sve2", 8, 8),
    }
    if kernel in _copy_shapes:
        from emit_blockcopy_pp_sve2_shared import emit_combo as _copy_emit
        _sym, _w, _h = _copy_shapes[kernel]

        def emit_fn(combo):
            return _copy_emit(combo, _sym, _w, _h)
        return emit_fn
    if kernel == "pel-filter-luma-strong":
        from emit_pel_filter_luma_strong_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "pu-addavg":
        from emit_pu_addavg_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "cu-sub-ps":
        from emit_cu_sub_ps_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel in ("cu-copy-ss", "chroma-copy-ss-16x16"):
        from emit_cu_copy_ss_sve2_shared import emit_combo
        _sym = ("dynopt_cu_copy_ss_16x16_sve2" if kernel == "cu-copy-ss"
                else "dynopt_chroma_copy_ss_16x16_sve2")

        def emit_fn(combo):
            return emit_combo(combo, func_name=_sym)
        return emit_fn
    if kernel == "cu-add-ps":
        from emit_cu_add_ps_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel in ("cu-copy-sp", "chroma-copy-sp-16x16"):
        from emit_cu_copy_sp_sve2_shared import emit_combo
        _sym = ("dynopt_cu_copy_sp_16x16_sve2" if kernel == "cu-copy-sp"
                else "dynopt_chroma_copy_sp_16x16_sve2")

        def emit_fn(combo):
            return emit_combo(combo, func_name=_sym)
        return emit_fn
    if kernel in ("cu-copy-ps", "chroma-copy-ps-16x16"):
        from emit_cu_copy_ps_sve2_shared import emit_combo
        _sym = ("dynopt_cu_copy_ps_16x16_sve2" if kernel == "cu-copy-ps"
                else "dynopt_chroma_copy_ps_16x16_sve2")

        def emit_fn(combo):
            return emit_combo(combo, func_name=_sym)
        return emit_fn
    if kernel == "chroma-addavg-8x8":
        from emit_chroma_addavg_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "ssim":
        from emit_ssim_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "scale1d":
        from emit_scale1d_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "scale2d":
        from emit_scale2d_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao":
        from emit_sao_e0_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-b0":
        from emit_sao_b0_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-e1":
        from emit_sao_e1_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-e2":
        from emit_sao_e2_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-e3":
        from emit_sao_e3_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-stats-e0":
        from emit_sao_stats_e0_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-stats-e1":
        from emit_sao_stats_e1_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-stats-e2":
        from emit_sao_stats_e2_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-stats-e3":
        from emit_sao_stats_e3_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-stats-bo":
        from emit_sao_stats_bo_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sao-e1-2rows":
        from emit_sao_e1_2rows_sve2_shared import emit_combo

        def emit_fn(combo):
            return emit_combo(combo)
        return emit_fn
    if kernel == "sad-32":
        from emit_sad_sve2_shared import emit_32x32

        def emit_fn(combo):
            return emit_32x32()
        return emit_fn
    raise ValueError("no emitter registered for kernel %r" % kernel)


_EMIT_WORKER = None


def _init_emit_worker(kernel, backend):
    """ProcessPool initializer: the emitter is a closure created inside the
    worker, so ProcessPoolExecutor never needs to pickle it."""
    global _EMIT_WORKER
    _EMIT_WORKER = make_emitter(kernel, backend)


def _emit_worker(combo):
    return _EMIT_WORKER(combo)


def _layout_contract(combo, args_contract, manifest_contract):
    """Per-candidate contract label (deterministic, independent of the
    enumeration order; fixes the old serial loop's order-dependent
    `contract` mutation)."""
    if combo.get("legacy_ex") or combo.get("legacy_k4"):
        return "legacy-internal-exact"
    return args_contract or manifest_contract or "upstream-exact"


def measure_layout_candidate(task):
    """Measure one layout candidate end-to-end. Module-level so it can be
    pickled by ProcessPoolExecutor.

    task = (tag, combo, src_text, ckey, outdir, backend, manifest,
            verify_src, driver_o, kernel, contract, first_cases, full_cases,
            vl_bytes)

    Returns (row, cache_entry, stage). `row` is None for build/link
    failures (matching the serial results.json schema); verify failures
    return a row and a negative cache entry.
    """
    (tag, combo, src_text, ckey, outdir, backend, manifest,
     verify_src, driver_o, kernel, contract, first_cases, full_cases,
     vl_bytes) = task
    src = os.path.join(outdir, tag + ".cpp")
    with open(src, "w") as f:
        f.write(src_text)
    obj = os.path.join(outdir, tag + ".o")
    try:
        if backend == "asm":
            s_path = os.path.join(outdir, tag + ".S")
            bootstrap_cpp(src, s_path)
            c = run(["aarch64-linux-gnu-as",
                     "-march=" + candidate_march(combo),
                     "-o", obj, s_path], timeout=120)
        else:
            cc = cxx_for(combo).split() + candidate_opt(combo).split() + \
                _OPT_EXTRA.split() + [
                  "-std=c++11", "-march=" + candidate_march(combo),
                  "-c", src, "-o", obj]
            if backend == "op":
                cc.insert(2, "-fno-tree-pre")
            c = run(cc, timeout=120)
    except subprocess.TimeoutExpired:
        return None, None, "BUILD TIMEOUT"
    if c.returncode != 0:
        return None, None, "BUILD FAIL"
    if _ISA == "neon":
        # Pure-NEON gate: the NEON_SAFE_VALUES filter already restricts the
        # emitters, but a compiler could still lower a builtin to SVE on a
        # march that enables it. Reject any z-register SVE instruction.
        d = run(["aarch64-linux-gnu-objdump", "-d", obj], timeout=60)
        if re.search(r"\b[zZ]\d+(?:\.\w+)?\b", d.stdout):
            return None, None, "SVE IN OBJECT (neon mode)"
    if _ISA and _ISA != "neon":
        try:
            g = run([sys.executable,
                     os.path.join(ROOT, "tools/check_isa_level.py"),
                     "--object", obj, "--level", _ISA, "--json",
                     "--objdump", "aarch64-linux-gnu-objdump"], timeout=120)
            gj = json.loads(g.stdout) if g.stdout else {}
            viol = gj.get("violations") or []
        except (ValueError, KeyError):
            viol = [{"mnemonic": "unknown"}]
        if viol:
            return None, None, "ISA VIOLATION (%d)" % len(viol)
    verify = os.path.join(outdir, tag + "-verify")
    try:
        _inc = ["-I" + os.path.join(ROOT, d) for d in (
            "third_party/x265/source",
            "third_party/x265/source/common",
            "third_party/x265/source/common/aarch64",
            "third_party/x265/source/encoder",
            "build/x265-8-cross-make")]
        v = run(["aarch64-linux-gnu-g++", "-O2", "-std=c++11",
                 "-march=" + candidate_march(combo)] + _inc + [
                 verify_src, obj, "-Wl,--start-group",
                 repo_path(manifest, manifest["reference"]["lib"]),
                 "-Wl,--end-group",
                 "-lpthread", "-ldl", "-o", verify], timeout=120)
    except subprocess.TimeoutExpired:
        return None, None, "LINK TIMEOUT"
    if v.returncode != 0:
        return None, None, "LINK FAIL"
    legacy = bool(combo.get("legacy_semantics") or combo.get("legacy_ex")
                  or combo.get("legacy_k4"))

    def _run_verify(cases_arg):
        try:
            rr = run(qemu_cmd(combo) + [verify, str(cases_arg)], timeout=180)
        except subprocess.TimeoutExpired:
            return None, -1, None, "VERIFY TIMEOUT"
        mm = 0
        if "mismatches=" in rr.stdout:
            try:
                mm = int(rr.stdout.split("mismatches=", 1)[1].split()[0])
            except (ValueError, IndexError):
                mm = -1
        if legacy:
            # Proxy bound calibrated against the TestBench golden standard;
            # scales linearly with the case count (same RNG stream).
            bound = max(1, round(22528 * cases_arg / 20000))
            oo = rr.returncode in (0, 1) and 0 <= mm <= bound
        else:
            oo = rr.returncode == 0 and mm == 0
        return rr, mm, oo, "OK"

    r, mism, ok, stage = _run_verify(first_cases)
    if stage != "OK":
        return None, None, stage
    gate = "short" if first_cases < full_cases else "full"
    row = {"tag": tag, **combo, "contract": contract,
           "passed": ok, "verify_mismatches": mism, "verify": r.stdout}
    if not ok:
        row["upstream_exact"] = False
        row["gate"] = gate
        return row, {"passed": False, "verify_mismatches": mism,
                     "verify": r.stdout, "counts": None, "gate": gate}, \
            "VERIFY FAIL (%s)" % gate
    if full_cases != first_cases:
        r, mism, ok, stage = _run_verify(full_cases)
        if stage != "OK":
            return None, None, stage
        if not ok:
            row.update({"passed": False, "verify_mismatches": mism,
                        "verify": r.stdout, "gate": "full"})
            return row, {"passed": False, "verify_mismatches": mism,
                         "verify": r.stdout, "counts": None,
                         "gate": "full"}, "VERIFY FAIL (full)"
        row.update({"verify_mismatches": mism, "verify": r.stdout})
    row["upstream_exact"] = not bool(combo.get("legacy_semantics"))
    driver = os.path.join(outdir, tag + "-trace-driver")
    try:
        if backend == "asm":
            d = run(["aarch64-linux-gnu-gcc", "-no-pie", "-static",
                     obj, driver_o, "-o", driver], timeout=120)
        else:
            d = run(["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
                     "-std=c++11",
                     repo_path(manifest,
                               manifest["candidate"]["trace_driver_src"]),
                     obj, "-o", driver], timeout=120)
    except subprocess.TimeoutExpired:
        row.update({"passed": False, "counts": None})
        return row, None, "DRIVER LINK TIMEOUT"
    if d.returncode != 0:
        row.update({"passed": False, "counts": None})
        return row, None, "DRIVER LINK FAIL"
    if backend == "op" and kernel in ("dct32", "dct16"):
        start_syms = ["_ZL9op_pass_4PKsPsl"]
    elif backend == "ago" and kernel in ("dct32", "dct16"):
        # ago covers for dct16/dct32 (covers_dct16/32.py) emit static
        # op_pass_4/op_pass_11 helpers plus a thin exported wrapper
        # (dynopt_dct16/32_sve2_shared). Tracing the wrapper range
        # counts only its prologue (~14 insns) and misses the kernel;
        # the ago+dct static path below uses whole-object counts, so no
        # symbol range is needed.
        start_syms = [manifest["candidate"]["symbol"]]
    else:
        start_syms = manifest["candidate"].get(
            "range_start", manifest["candidate"]["symbol"])
    if isinstance(start_syms, str):
        start_syms = [start_syms]
    rng = None
    for start_sym in start_syms:
        rng = symbol_range(driver, start_sym)
        if rng:
            break
    if rng is None:
        row.update({"passed": False, "counts": None})
        return row, None, "NO RANGE"
    end_sym = manifest["candidate"].get("range_end")
    if end_sym is None and backend == "op" and kernel == "dct16":
        # op backend emits op_pass_4/op_pass_11 + wrapper; trace the
        # two inner passes and stop at the wrapper (it only calls them).
        end_sym = manifest["candidate"]["symbol"]
    if end_sym:
        rng_end = symbol_range(driver, end_sym)
        if rng_end is None:
            row.update({"passed": False, "counts": None})
            return row, None, "NO RANGE_END"
        rng = (rng[0], rng_end[1])
    if backend == "ago":
        # ago covers export the kernel as the exported symbol, but the
        # -O2 driver link can inline always_inline-heavy kernels into the
        # trace main, leaving a thin wrapper behind (dct16/dct32 static
        # op_pass helpers; psy-cost cadd hit the same wrapper artifact:
        # trace counted 3 uops for a 97-uop kernel). Whole-object static
        # counts are immune and are the same extractor ago_auto_search
        # uses; they match the docs/79 measured numbers (dct32 761/1129,
        # dct16 950/1019).
        try:
            from static_counts import static_counts
            counts = static_counts(obj, vl_bytes=vl_bytes)
        except Exception as exc:  # noqa: BLE001
            row.update({"passed": False, "counts": None})
            return row, None, "STATIC COUNT FAIL: %s" % exc
        row["range"] = ["all", "all"]
        row["counts"] = counts
    elif is_sdot_compute(combo.get("compute")):
        # QEMU 11.0.3 disassembles sdot z.s,z.h,z.h as .byte, so dynamic
        # trace counts would miss all 1376 sdots (docs/27 §8.10). These
        # kernels are fully unrolled: objdump static == dynamic.
        # Still trace for the dynamic-MCA path (docs/26 §5). sdot-h
        # (interp8 path B) is looped and needs the repaired dynamic counts
        # (OBJD-T trace + objdump, docs/22 §5.3); sdot-s32 stays static.
        fix_driver = driver if combo.get("compute") == "sdot-h" else None
        try:
            counts = true_dynamic(
                driver, rng[0], rng[1],
                os.path.join(outdir, tag + "-trace.log"),
                timeout=300, vl_bytes=vl_bytes, combo=combo,
                fix_driver=fix_driver)
        except subprocess.TimeoutExpired:
            counts = None
        if counts is None or combo.get("compute") != "sdot-h":
            try:
                from static_counts import static_counts
                counts = static_counts(obj, vl_bytes=vl_bytes)
            except Exception as exc:  # noqa: BLE001
                row.update({"passed": False, "counts": None})
                return row, None, "STATIC COUNT FAIL: %s" % exc
    else:
        try:
            counts = true_dynamic(driver, rng[0], rng[1],
                                  os.path.join(outdir, tag + "-trace.log"),
                                  timeout=300, vl_bytes=vl_bytes,
                                  combo=combo)
        except subprocess.TimeoutExpired:
            row.update({"passed": False, "counts": None})
            return row, None, "TRACE TIMEOUT"
        if counts is None:
            row.update({"passed": False, "counts": None})
            return row, None, "TRACE FAIL"
    row["range"] = [hex(rng[0]), hex(rng[1])]
    row["counts"] = counts
    try:
        # docs/09 v0.1: record the static fusion inventory per candidate.
        # hw_supported is 0 (empty fusion table) so it never drives ranking;
        # it is a reporting/archive metric only.
        d = run(["aarch64-linux-gnu-objdump", "-d", obj], timeout=60)
        from optimizer.analysis.fusion import fusion_report
        rep = fusion_report(
            kernel,
            {"name": "kunpeng-n2-sve2p3-vl256", "issue_est": 4},
            d.stdout)
        row["fusion"] = {
            "eligible": rep["summary"]["structurally_eligible"],
            "hw_supported": rep["summary"]["hw_supported"],
            "pairs": ["%s+%s" % (p["insn1"], p["insn2"])
                      for p in rep["pairs"]],
            "counts": rep["counts"],
        }
    except Exception:  # noqa: BLE001 - fusion inventory is best-effort
        pass
    return row, {"passed": True, "verify_mismatches": mism,
                 "verify": r.stdout, "counts": counts,
                 "range": row["range"]}, "OK"


def main():
    install_memguard()
    ap = argparse.ArgumentParser()
    ap.add_argument("--backend", choices=("acle", "asm", "op", "gen", "ago"),
                    default="acle")
    ap.add_argument("--isa", "--target-isa", default=None,
                    choices=("neon", "sve1", "sve2", "sve2p1", "sve2p3"),
                    help="restrict search/generation to this ISA level "
                         "(920B: sve1 with VL=256; 950: sve2 and below; "
                         "neon: NEON+dotprod only, for NEON->NEON validity "
                         "checks). Unsupported compute axes are dropped; "
                         "SVE objects are rejected in neon mode.")
    ap.add_argument("--target", choices=("920B", "950"), default=None,
                    help="convenience alias: 920B -> --isa sve1 "
                         "--mca-target 920B; 950 -> --isa sve2 "
                         "--mca-target 950")
    ap.add_argument("--contract", default=None)
    ap.add_argument("--kernel", default="dct16")
    ap.add_argument("--outdir", default=None)
    ap.add_argument("--finalize", action="store_true",
                    help="copy the best candidate to kernels/<name>/candidates/"
                         "best_sve2.{cpp,S,o} and run its TestBenchLite gate")
    ap.add_argument("--workers", type=int, default=1,
                    help="parallel worker processes (default 1 = serial, "
                         "identical results order)")
    ap.add_argument("--skip-axes", default=None,
                    help="comma-separated layout axis names to drop from "
                         "the cartesian product (e.g. op backend ignores "
                         "layout/odd_lowering/narrow_batch/"
                         "constant_layout)")
    ap.add_argument("--manifest", default=None,
                    help="override manifest path (seed_pipeline passes the "
                         "recipe-constrained manifest: axis_fixed values are "
                         "single-value axes, non-subset axes are removed)")
    ap.add_argument("--short-cases", type=int, default=2000,
                    help="reject-gate case count (default 2000); the harness "
                         "uses the same RNG stream, so 2k is a strict prefix "
                         "of the full corpus")
    ap.add_argument("--full-cases", type=int, default=20000,
                    help="full differential case count (default 20000)")
    ap.add_argument("--no-short-gate", action="store_true",
                    help="run only the full differential (exhaustive mode)")
    ap.add_argument("--mca-top", type=int, default=0,
                    help="run LLVM-MCA (complete dynamic stream, Neoverse-V2 "
                         "SVE2 proxy) on the top-N candidates by fused_uop "
                         "and record mca_cycles/mca_uops (default 0 = off)")
    ap.add_argument("--mca-mcpu", default=None,
                    help="llvm-mca -mcpu model (default: manifest "
                         "mca_target.llvm_proxy_cpu, i.e. neoverse-v2; "
                         "tsv110 has no SVE coverage)")
    ap.add_argument("--mca-mattr", default=None,
                    help="llvm-mca -mattr (default: manifest "
                         "mca_target.llvm_proxy_mattr, i.e. +sve2)")
    ap.add_argument("--mca-arch", default=None,
                    help="`.arch` directive for the repaired dynamic-stream "
                         ".mca.s (default armv9.4-a+sve2p1; SVE2p3 kernels "
                         "must pass e.g. armv9.4-a+sve2p3 so sdot.h is not "
                         "silently skipped, docs/22 §5.3)")
    ap.add_argument("--mca-bin", default="llvm-mca",
                    help="llvm-mca binary (default llvm-mca; use the "
                         "patched build from scripts/build-custom-llvm-mca.sh "
                         "for sdot_z32 support, docs/26 §5)")
    ap.add_argument("--mca-target", choices=("920B", "NP1", "950"), default=None,
                    help="target profile for the table-driven cycle "
                         "estimator (default: manifest mca_target.default, "
                         "i.e. NP1); llvm-mca itself still uses "
                         "neoverse-v2 as proxy")
    ap.add_argument("--cost-top", type=int, default=0,
                    help="run the target-throughput cycle estimator on the "
                         "top-N passed candidates and record "
                         "est_cycles_<target> (default 0 = off)")
    ap.add_argument("--cxx", default=None,
                    help="candidate compiler (default aarch64-linux-gnu-g++; "
                         "use a clang cross build to sweep backend flags, "
                         "round-0017)")
    ap.add_argument("--opt-extra", default="",
                    help="extra flags appended after candidate_opt for "
                         "backend/regalloc experiments (space-separated, "
                         "e.g. \"-frename-registers -fweb\")")
    ap.add_argument("--lite-top", type=int, default=0,
                    help="run the TestBenchLite golden gate (dct32/dct16/"
                         "sa8d/sa8d16/interp8) on the top-N passed "
                         "candidates and record lite_pass/lite_fails "
                         "(default 0 = off)")
    ap.add_argument("--lite-seeds", default="1,2,0x12345678,0xDEADBEEF,"
                                            "987654321",
                    help="comma-separated TestBenchLite seeds (default: the "
                         "project's official 5-seed list)")
    ap.add_argument("--cp-top", type=int, default=0,
                    help="run the critical-path latency estimator (NV2 "
                         "latencies, dynamic stream) on the top-N passed "
                         "candidates and record cp_cycles_<target> "
                         "(default 0 = off)")
    ap.add_argument("--rank-by",
                    choices=("fused_uop", "mca", "cp", "lite", "vector-lb",
                             "consensus", "bench920", "ago", "permute"),
                    default="fused_uop",
                    help="final ranking key (default fused_uop; mca requires "
                         "--mca-top and uses mca_cycles as primary key, "
                         "falling back to fused_uop for candidates without "
                         "MCA data; cp requires --cp-top and uses "
                         "cp_cycles as primary key; vector-lb requires "
                         "--cost-top and uses the NP1/920B width-aware "
                         "vector-throughput lower bound as primary key "
                         "(docs/26 §5); lite requires "
                         "--lite-top and puts TestBenchLite-passing "
                         "candidates first; consensus averages normalized "
                         "ranks over all available proxies; bench920 "
                         "requires --bench-920b and ranks by the "
                         "real-machine CNTVCT neon/cand ratio, highest "
                         "first)")
    ap.add_argument("--require-lite", action="store_true",
                    help="when finalizing, skip candidates that did not pass "
                         "TestBenchLite (requires --lite-top; candidates "
                         "without lite data are skipped)")
    ap.add_argument("--bench-920b", default=None,
                    help="SSH host (user@host) of a reachable 920B; build a "
                         "shape-substituted microbenchmark for top candidates "
                         "and run CNTVCT paired vs NEON as a secondary "
                         "real-machine reference (MCA remains primary, "
                         "docs/29 §6)")
    ap.add_argument("--bench-top", type=int, default=3,
                    help="candidates benchmarked on 920B (default 3)")
    args = ap.parse_args()
    global _CXX, _CXX_OVERRIDE, _OPT_EXTRA, _ISA
    if args.target and not args.isa:
        args.isa = "sve1" if args.target == "920B" else "sve2"
    if args.target and args.mca_target is None:
        args.mca_target = args.target
    _ISA = args.isa
    if args.cxx:
        _CXX = args.cxx
        _CXX_OVERRIDE = args.cxx
    elif args.kernel == "dct8":
        # 2026-08-14：dct8 同一 NEON-bridge 源码，GCC 编出 492 dyn /
        # MCA 118 / 920B p50 5；clang 编出 310 dyn / MCA 77 / p50 4
        # （= 上游 dct8_sve）。默认 dct8 用 clang（docs/30 §1.7）。
        _CXX = "clang --target=aarch64-linux-gnu"
    elif _ISA == "sve1":
        # 2026-08-15 真机回填：clang -O3 的 SVE1 候选普遍优于 GCC -O2
        # （sa8d16 0.67->0.81、dct32 0.60->0.73、interp8 0.61->0.72）。
        _CXX = "clang --target=aarch64-linux-gnu"
        if not args.opt_extra:
            args.opt_extra = "-O3"
    _OPT_EXTRA = args.opt_extra
    if args.rank_by == "mca" and args.mca_top == 0:
        # ranking by MCA implies running the second proxy; default to top-10.
        args.mca_top = 10
    if args.rank_by == "lite" and args.lite_top == 0:
        args.lite_top = 10
    if args.rank_by == "cp" and args.cp_top == 0:
        args.cp_top = 10
    if args.rank_by == "vector-lb" and args.cost_top == 0:
        args.cost_top = 10
    if args.rank_by == "bench920" and not args.bench_920b:
        print("--rank-by bench920 requires --bench-920b", file=sys.stderr)
        return 2
    if args.rank_by == "consensus":
        # consensus needs all proxies; default the top-N to the largest
        # requested window.
        args.mca_top = max(args.mca_top, 10)
        args.cost_top = max(args.cost_top, 10)
        args.cp_top = max(args.cp_top, 10)
        if args.lite_top == 0:
            args.lite_top = 10
    if args.manifest:
        if yaml is None:
            raise SystemExit("pyyaml required to load --manifest")
        with open(args.manifest) as f:
            manifest = yaml.safe_load(f)
        import os as _os
        manifest["_path"] = _os.path.abspath(args.manifest)
        manifest["_root"] = ROOT
    else:
        manifest = load_manifest(args.kernel)
    vl_bytes = int(manifest.get("vl_bytes", 32))
    if args.mca_mcpu is None:
        args.mca_mcpu = manifest.get("mca_target", {}).get(
            "llvm_proxy_cpu", "neoverse-v2")
    if args.mca_mattr is None:
        if _ISA:
            args.mca_mattr = ISA_MATTR[_ISA]
        else:
            args.mca_mattr = manifest.get("mca_target", {}).get(
                "llvm_proxy_mattr", "+sve2")
    if _ISA and args.mca_arch is None:
        args.mca_arch = ISA_MARCH[_ISA]
    if (not _ISA and any(is_sdot_compute(c)
                         for c in manifest.get("layouts", {})
                         .get("compute", []))):
        # sdot_z32 is SVE2p1; the patched llvm-mca needs +sve2p1 to
        # accept the asm stream (docs/26 §5).
        args.mca_mattr = "+sve2p1"
    if args.mca_target is None:
        args.mca_target = manifest.get("mca_target", {}).get(
            "default", "NP1")
    if args.contract:
        manifest["contract"] = args.contract
    contract = manifest.get("contract", "upstream-exact")
    if _ISA == "neon" and args.kernel not in NEON_SUPPORTED_KERNELS:
        print("--isa neon supports only %s; kernel %r has no pure-NEON "
              "emitter" % (", ".join(sorted(NEON_SUPPORTED_KERNELS)),
                           args.kernel), file=sys.stderr)
        return 2
    if _ISA == "neon" and manifest.get("layouts_neon"):
        # NEON searches use the kernel's dedicated pure-NEON axis set
        # (e.g. sa8d16: reduce vpadal/udot/vaddlv, quad seq/pair) instead
        # of the SVE layout axes.
        manifest["layouts"] = manifest["layouts_neon"]
    if args.outdir is None:
        args.outdir = os.path.join(
            ROOT, "experiments/m30-%s-search/layout-search" % args.kernel)
    emit = make_emitter(args.kernel, args.backend)
    if _ISA and args.backend == "gen":
        # Generic fir/vertical recipes lower sdot-h only on SVE2p3; when
        # the target is 920B (sve1) or 950 (sve2) and the manifest only
        # proposes the SVE2p3 path, fall back to the generic sdot-d path
        # (SVE1 sdot .s/.b + NEON-bridge narrowing), which is exact.
        layouts = manifest.get("layouts", {})
        if "compute" in layouts and not any(
                combo_isa_allowed({"compute": v})
                for v in layouts["compute"]):
            layouts["compute"].append("sdot-d")
    if args.skip_axes:
        skip = set(x.strip() for x in args.skip_axes.split(",") if x.strip())
        for ax in skip:
            if ax not in manifest.get("layouts", {}):
                print("warning: skip-axis %r not in manifest layouts" % ax,
                      file=sys.stderr)
            manifest["layouts"].pop(ax, None)
    os.makedirs(args.outdir, exist_ok=True)
    cache_path = os.path.join(args.outdir, "verify_cache.json")
    cache = {}
    if os.path.exists(cache_path):
        try:
            cache = json.load(open(cache_path))
        except (ValueError, OSError):
            cache = {}
    verify_src = os.path.join(args.outdir, "verify_generated.cpp")
    contract_marker = os.path.join(args.outdir, "verify_contract.txt")
    marker = ""
    if os.path.exists(contract_marker):
        marker = open(contract_marker).read().strip()
    if not os.path.exists(verify_src) or marker != contract:
        # verify_generated.cpp embeds the contract's reference oracle and
        # gate; it must be regenerated when the contract changes.
        with open(verify_src, "w") as f:
            f.write(gen_verify(manifest))
        with open(contract_marker, "w") as f:
            f.write(contract)

    # P2: the manifest's layout_prune rules replace per-kernel hardcoded
    # axis-dependency chains; only derived normalization stays here.
    if args.backend == "ago":
        ago_covers = {
            "satd-8": ["A", "B", "C", "D", "E"],
            "sa8d": ["A", "B", "C"],
            "sa8d16": ["A", "B", "C"],
            "sa8d-32x32": ["A"],
            "sa8d-64x64": ["A"],
            "interp8": ["A", "B", "C"],
            "interp8-64x64": ["A"],
            "interp8-32": ["A"],
            "interp8-16x32": ["A"],
            "interp8-16x8": ["A"],
            "interp8-8x16": ["A"],
            "dct16": ["A", "B", "C"],
            "dct32": ["A", "B", "C"],
            "dct8": ["A"],
            "satd-16": ["A", "B", "C"],
            "satd-16x32": ["A"],
            "satd-16x64": ["A"],
            "satd-32x16": ["A"],
            "satd-32x32": ["A"],
            "satd-64x16": ["A"],
            "satd-64x64": ["A"],
            "satd-16x4": ["A"],
            "satd-32x8": ["A"],
            "satd-64x48": ["A"],
            "satd-64x32": ["A"],
            "satd-32x64": ["A"],
            "satd-8x16": ["A", "B", "C"],
            "satd-8x4": ["A"],
            "satd-8x32": ["A"],
            "satd-16x8": ["A", "B", "C"],
            "sad": ["A", "B", "C"],
            "cost-coeff-nxn": ["A", "B"],
            "sao-stats-e0": ["A", "B", "C", "D", "E"],
            "sao-stats-e2": ["A", "B", "C"],
            "sao-stats-e3": ["A"],
            "sao-b0": ["A"],
            "sao-e1": ["A"],
            "sao-e2": ["A"],
            "sao-e3": ["A"],
            "sao-stats-e1": ["A", "B", "C"],
            "sao-stats-bo": ["A"],
            "chroma-addavg-8x8": ["A"],
            "cu-sub-ps": ["A"],
            "cu-add-ps": ["A"],
            "cu-copy-pp": ["A"],
            "chroma-copy-ps-16x16": ["A"],
            "chroma-copy-pp-32x32": ["A"],
            "chroma-copy-pp-8x8": ["A"],
            "cu-copy-ss": ["A"],
            "cu-copy-sp": ["A"],
            "cu-copy-ps": ["A"],
            "chroma-copy-ss-16x16": ["A"],
            "chroma-copy-sp-16x16": ["A"],
            "chroma-copy-pp": ["A"],
            "idct32": ["A", "B"],
            "idct16": ["A", "B", "C"],
            "interp8-vss-8x8": ["A"],
            "interp8vpp-8x4": ["A"],
            "interp8vpp-8x32": ["A"],
            "interp8vpp-8x16": ["A"],
            "interp8vpp-64x64": ["A"],
            "interp8vpp-64x48": ["A"],
            "interp8vpp-64x32": ["A"],
            "interp8vpp-64x16": ["A"],
            "interp8vpp-32x8": ["A"],
            "interp8vpp-32x64": ["A"],
            "interp8vpp-32x24": ["A"],
            "interp8vpp-32x16": ["A"],
            "interp8vpp-32": ["A"],
            "interp8vpp-24x32": ["A"],
            "interp8vpp-16x8": ["A"],
            "interp8vpp-16x64": ["A"],
            "interp8vpp-16x4": ["A"],
            "interp8vpp-16x32": ["A"],
            "interp8vpp-16x12": ["A"],
            "interp8vpp-16": ["A"],
            "interp8vpp-12x16": ["A"],
            "interp4vpp-8x8": ["A"],
            "interp4vpp-8x64": ["A"],
            "interp4vpp-8x6": ["A"],
            "interp4vpp-8x4": ["A"],
            "interp4vpp-8x32": ["A"],
            "interp4vpp-8x16": ["A"],
            "interp4vpp-32x8": ["A"],
            "interp4vpp-32x64": ["A"],
            "interp4vpp-32x48": ["A"],
            "interp4vpp-32x32": ["A"],
            "interp4vpp-32x24": ["A"],
            "interp4vpp-32x16": ["A"],
            "interp4vpp-24x64": ["A"],
            "interp4vpp-24x32": ["A"],
            "interp4vpp-16x8": ["A"],
            "interp4vpp-16x64": ["A"],
            "interp4vpp-16x4": ["A"],
            "interp4vpp-16x32": ["A"],
            "interp4vpp-16x24": ["A"],
            "interp4vpp-16x12": ["A"],
            "interp4vpp-16": ["A"],
            "interp4vpp-12x32": ["A"],
            "interp4vpp-12x16": ["A"],
            "interp8-vss-8x4": ["A"],
            "interp8-vss-8x16": ["A"],
            "interp8-vss-32x32": ["A"],
            "interp8-vss-32x16": ["A"],
            "interp8-vss-16x4": ["A"],
            "interp8-vss-16x32": ["A"],
            "interp8-vss-16x16": ["A"],
            "interp8-vsp-8x8": ["A"],
            "interp8-vsp-8x16": ["A"],
            "interp8-vsp-32x32": ["A"],
            "interp8-vsp-32x16": ["A"],
            "interp8-vsp-16x32": ["A"],
            "interp8-vsp-16x16": ["A"],
            "interp8-vps-8x8": ["A"],
            "interp8-vps-8x16": ["A"],
            "interp8-vps-32x32": ["A"],
            "interp8-vps-32x16": ["A"],
            "interp8-vps-16x32": ["A"],
            "interp8-vps-16x16": ["A"],
            "interp8-hps-8x32": ["A"],
            "interp8-hps-8x16": ["A"],
            "interp8-hps-32x8": ["A"],
            "interp8-hps-32x32": ["A"],
            "interp8-hps-32x16": ["A"],
            "interp8-hps-16x8": ["A"],
            "interp8-hps-16x32": ["A"],
            "interp8-hps-16x16": ["A"],
            "sao": ["A"],
            "find-pos-first-last": ["A"],
            "pel-filter-luma-strong": ["A"],
            "scale2d": ["A"],
            "sign": ["A"],
            "scan-pos-last": ["A"],
            "pu-copy-pp": ["A"],
            "pu-addavg": ["A"],
            "sad-32": ["A"],
            "ssd": ["A"],
            "mc": ["A"],
            "interp8-64x32": ["A"],
            "interp8-32x16": ["A"],
            "interp8-16": ["A"],
            "psy-cost-16x16": ["A", "B", "C"],
        }
        if args.kernel not in ago_covers:
            raise SystemExit("AGO backend: no cover axis for kernel %s"
                             % args.kernel)
        manifest["layouts"] = {"cover": ago_covers[args.kernel]}
    combos = layout_plans(manifest)
    if _ISA:
        before = 0
        kept = []
        for c in combos:
            before += 1
            if combo_isa_allowed(c):
                kept.append(c)
        combos = kept
        print("--isa %s: %d/%d layout combos survive the ISA filter"
              % (_ISA, len(combos), before))
    if not combos or not manifest.get("layouts"):
        print("manifest has no layout axes", file=sys.stderr)
        return 2
    if args.backend == "op" and args.kernel == "dct32":
        # rewrite sequences are searched separately by
        # search_rewrite_sequences.py; drop the rw axes before the cartesian
        # enumeration so the op layout search stays bounded (manifest has
        # no prune rules for rw, ~3.84M raw combos otherwise).
        filtered = [{k: v for k, v in c.items()
                     if not k.startswith("rw")} for c in combos]
        seen0, combos = set(), []
        for c in filtered:
            tag = "_".join("%s-%s" % (k, v) for k, v in c.items())
            if tag in seen0:
                continue
            seen0.add(tag)
            combos.append(c)
    driver_o = os.path.join(args.outdir, "trace-driver.o")
    if args.backend == "asm" and not os.path.exists(driver_o):
        run(["aarch64-linux-gnu-gcc", "-O2", "-c",
             repo_path(manifest, manifest["candidate"]["trace_driver_c"]),
             "-o", driver_o])
    results = []
    seen = set()
    src_seen = {}
    tasks = []
    cands = []
    for combo in combos:
        if combo.get("legacy_k4") and args.backend != "op":
            # grouped emitter has no legacy_k4 lowering yet; only the op
            # backend implements it (dct32, 2026-08-13).
            continue
        if "pass1" in manifest.get("layouts", {}):
            if combo.get("pass1") != "quarter":
                combo["pass1_k_tile"] = 2   # tile only applies to quarter
        if "pass2" in manifest.get("layouts", {}):
            if combo.get("pass2") != "odd-quarter":
                combo["pass2_k_tile"] = 1   # tile only applies to odd-quarter
        tag = "_".join("%s-%s" % (k, v) for k, v in combo.items())
        if tag in seen:
            continue
        seen.add(tag)
        cands.append((tag, combo))
    # Emit + source-hash dedup used to run serially; with ~500 raw combos
    # (dct32 axis subset) the emit phase was ~40% of search wall time, so
    # parallelize it across the same worker pool (map preserves order ->
    # dedup semantics identical to serial).
    t_emit0 = time.monotonic()
    if args.workers > 1 and len(cands) > 1:
        _pool = concurrent.futures.ProcessPoolExecutor(
            max_workers=args.workers,
            initializer=_init_emit_worker,
            initargs=(args.kernel, args.backend))
        _iter_src = _pool.map(_emit_worker,
                              (c for _, c in cands), chunksize=1)
    else:
        _pool = None
        _iter_src = (emit(c) for _, c in cands)
    for (tag, combo), src_text in zip(cands, _iter_src):
        src_hash = hashlib.sha256(src_text.encode()).hexdigest()
        if src_hash in src_seen:
            # Canonical dedup: identical generated source -> identical
            # object/counts; skip the redundant combo.
            print("%-24s DUP of %s" % (tag, src_seen[src_hash]))
            continue
        src_seen[src_hash] = tag
        # Build fingerprint (round-0017 咨询）：编译器/编译参数/后端改变
        # 后旧计数会误复用，因此并入缓存键；flag 扫描（--cxx/--opt-extra）
        # 自动得到独立缓存槽。
        buildfp = "|".join((cxx_for(combo), candidate_opt(combo),
                            _OPT_EXTRA,
                            candidate_march(combo), str(args.backend)))
        ckey = "%s|%s|%s" % (args.contract or manifest.get("contract", ""),
                             buildfp, src_hash)
        if args.backend == "ago":
            # counting method differs from other backends (whole-object
            # static counts, not wrapper-range trace); separate cache slot.
            ckey += "|count=whole-object-static"
        c_contract = _layout_contract(
            combo, args.contract, manifest.get("contract", "upstream-exact"))
        if ckey in cache and cache[ckey].get("counts"):
            ent = cache[ckey]
            results.append({
                "tag": tag, **combo,
                "contract": c_contract,
                "upstream_exact": (not combo.get("legacy_semantics")
                                   if ent.get("passed") else False),
                "passed": ent["passed"],
                "verify_mismatches": ent.get("verify_mismatches", 0),
                "verify": ent.get("verify", ""),
                "counts": ent.get("counts"),
                "range": ent.get("range"),
                "cached": True})
            print("%-24s CACHED (fused_adj=%s)"
                  % (tag, (ent.get("counts") or {}).get("vector_fused")))
            continue
        src = os.path.join(args.outdir, tag + ".cpp")
        with open(src, "w") as f:
            f.write(src_text)
        tasks.append((tag, combo, src_text, ckey, args.outdir, args.backend,
                      manifest, verify_src, driver_o, args.kernel,
                      c_contract,
                      args.full_cases if args.no_short_gate
                      else args.short_cases, args.full_cases, vl_bytes))
    if _pool is not None:
        _pool.shutdown()
    print("emit+dedup: %d combos -> %d unique sources (%.2fs)"
          % (len(cands), len(tasks), time.monotonic() - t_emit0))

    def _measure_all():
        if args.workers <= 1:
            for t in tasks:
                yield measure_layout_candidate(t)
            return
        with concurrent.futures.ProcessPoolExecutor(
                max_workers=args.workers) as ex:
            yield from ex.map(measure_layout_candidate, tasks)

    for task, (row, entry, stage) in zip(tasks, _measure_all()):
        tag = task[0]
        if entry is not None:
            cache[task[3]] = entry
        if row is None:
            print("%-24s %s" % (tag, stage))
            continue
        results.append(row)
        counts = row.get("counts")
        if counts:
            print("%-24s %s total=%d vector=%d movprfx=%d fused_adj=%d "
                  "sg=%d fused_uop=%d fusion_eligible=%s"
                  % (tag, stage, counts["total"], counts["vector"],
                     counts["movprfx"], counts["vector_fused"],
                     counts["scatter_gather"],
                     counts["vector_fused_uop"],
                     (row.get("fusion") or {}).get("eligible", "-")))
        else:
            print("%-24s %s passed=%s mism=%s"
                  % (tag, stage, row.get("passed"),
                     row.get("verify_mismatches")))

    json.dump(cache, open(cache_path, "w"), indent=1)
    def fu(r):
        """fused_uop count, tolerant of older results schemas."""
        c = r.get("counts") or {}
        return c.get("vector_fused_uop", c.get("vector_fused", 0))

    ok = [r for r in results if r.get("passed") and r.get("counts")]
    fused_key = fu
    ok.sort(key=fused_key)
    if args.rank_by == "ago" and ok:
        # AGO M2 ranker: compile each candidate, extract final-object
        # features, predict cycles from the target cost table.
        import json as _json
        import subprocess as _sp
        _opt = os.path.join(ROOT, "optimizer")
        if _opt not in sys.path:
            sys.path.insert(0, _opt)
        from ago.objfeatures import extract_features  # noqa: E402
        from ago.predict import predict_from_features  # noqa: E402
        from ago.calibration import load_calibration, apply_calibration  # noqa: E402
        _calib = load_calibration()
        if args.kernel == "satd-8":
            from ago.covers_satd8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sa8d":
            from ago.covers_sa8d8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sa8d16":
            from ago.covers_sa8d16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sa8d-32x32":
            from ago.covers_sa8d32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sa8d-64x64":
            from ago.covers_sa8d64x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8":
            from ago.covers_interp8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-64x64":
            from ago.covers_interp8_64x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-32":
            from ago.covers_interp8_32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-16x32":
            from ago.covers_interp8_16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-16x8":
            from ago.covers_interp8_16x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-8x16":
            from ago.covers_interp8_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "dct16":
            from ago.covers_dct16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "dct32":
            from ago.covers_dct32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "dct8":
            from ago.covers_dct8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-16":
            from ago.covers_satd16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-16x32":
            from ago.covers_satd16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-16x64":
            from ago.covers_satd16x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-32x16":
            from ago.covers_satd32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-32x32":
            from ago.covers_satd32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-64x16":
            from ago.covers_satd64x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-8x16":
            from ago.covers_satd_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-8x4":
            from ago.covers_satd_8x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-8x32":
            from ago.covers_satd_8x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-16x8":
            from ago.covers_satd_16x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sad":
            from ago.covers_sad import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "cost-coeff-nxn":
            from ago.covers_costcoeff import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-stats-e0":
            from ago.covers_sao_e0 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-stats-e2":
            from ago.covers_sao_stats_e2 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-stats-e3":
            from ago.covers_sao_stats_e3 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-b0":
            from ago.covers_sao_b0 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-e1":
            from ago.covers_sao_e1 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-e2":
            from ago.covers_sao_e2 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-e3":
            from ago.covers_sao_e3 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-stats-e1":
            from ago.covers_sao_stats_e1 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao-stats-bo":
            from ago.covers_sao_stats_bo import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "chroma-addavg-8x8":
            from ago.covers_chroma_addavg_8x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "cu-sub-ps":
            from ago.covers_cu_sub_ps import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "cu-add-ps":
            from ago.covers_cu_add_ps import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "cu-copy-pp":
            from ago.covers_cu_copy_pp import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "chroma-copy-ps-16x16":
            from ago.covers_chroma_copy_ps_16x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "chroma-copy-pp-32x32":
            from ago.covers_chroma_copy_pp_32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "chroma-copy-pp-8x8":
            from ago.covers_chroma_copy_pp_8x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "cu-copy-ss":
            from ago.covers_cu_copy_ss import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "cu-copy-sp":
            from ago.covers_cu_copy_sp import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "cu-copy-ps":
            from ago.covers_cu_copy_ps import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "chroma-copy-ss-16x16":
            from ago.covers_chroma_copy_ss_16x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "chroma-copy-sp-16x16":
            from ago.covers_chroma_copy_sp_16x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "chroma-copy-pp":
            from ago.covers_chroma_copy_pp import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "idct32":
            from ago.covers_idct32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "idct16":
            from ago.covers_idct16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-8x8":
            from ago.covers_interp8_vss_8x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-8x4":
            from ago.covers_interp8vpp_8x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-8x32":
            from ago.covers_interp8vpp_8x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-8x16":
            from ago.covers_interp8vpp_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-64x64":
            from ago.covers_interp8vpp_64x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-64x48":
            from ago.covers_interp8vpp_64x48 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-64x32":
            from ago.covers_interp8vpp_64x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-64x16":
            from ago.covers_interp8vpp_64x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-32x8":
            from ago.covers_interp8vpp_32x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-32x64":
            from ago.covers_interp8vpp_32x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-32x24":
            from ago.covers_interp8vpp_32x24 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-32x16":
            from ago.covers_interp8vpp_32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-32":
            from ago.covers_interp8vpp_32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-24x32":
            from ago.covers_interp8vpp_24x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-16x8":
            from ago.covers_interp8vpp_16x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-16x64":
            from ago.covers_interp8vpp_16x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-16x4":
            from ago.covers_interp8vpp_16x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-16x32":
            from ago.covers_interp8vpp_16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-16x12":
            from ago.covers_interp8vpp_16x12 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-16":
            from ago.covers_interp8vpp_16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8vpp-12x16":
            from ago.covers_interp8vpp_12x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-8x8":
            from ago.covers_interp4vpp_8x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-8x64":
            from ago.covers_interp4vpp_8x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-8x6":
            from ago.covers_interp4vpp_8x6 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-8x4":
            from ago.covers_interp4vpp_8x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-8x32":
            from ago.covers_interp4vpp_8x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-8x16":
            from ago.covers_interp4vpp_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-32x8":
            from ago.covers_interp4vpp_32x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-32x64":
            from ago.covers_interp4vpp_32x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-32x48":
            from ago.covers_interp4vpp_32x48 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-32x32":
            from ago.covers_interp4vpp_32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-32x24":
            from ago.covers_interp4vpp_32x24 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-32x16":
            from ago.covers_interp4vpp_32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-24x64":
            from ago.covers_interp4vpp_24x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-24x32":
            from ago.covers_interp4vpp_24x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-16x8":
            from ago.covers_interp4vpp_16x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-16x64":
            from ago.covers_interp4vpp_16x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-16x4":
            from ago.covers_interp4vpp_16x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-16x32":
            from ago.covers_interp4vpp_16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-16x24":
            from ago.covers_interp4vpp_16x24 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-16x12":
            from ago.covers_interp4vpp_16x12 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-16":
            from ago.covers_interp4vpp_16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-12x32":
            from ago.covers_interp4vpp_12x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp4vpp-12x16":
            from ago.covers_interp4vpp_12x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-8x4":
            from ago.covers_interp8_vss_8x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-8x16":
            from ago.covers_interp8_vss_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-32x32":
            from ago.covers_interp8_vss_32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-32x16":
            from ago.covers_interp8_vss_32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-16x4":
            from ago.covers_interp8_vss_16x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-16x32":
            from ago.covers_interp8_vss_16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vss-16x16":
            from ago.covers_interp8_vss_16x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vsp-8x8":
            from ago.covers_interp8_vsp_8x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vsp-8x16":
            from ago.covers_interp8_vsp_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vsp-32x32":
            from ago.covers_interp8_vsp_32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vsp-32x16":
            from ago.covers_interp8_vsp_32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vsp-16x32":
            from ago.covers_interp8_vsp_16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vsp-16x16":
            from ago.covers_interp8_vsp_16x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vps-8x8":
            from ago.covers_interp8_vps_8x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vps-8x16":
            from ago.covers_interp8_vps_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vps-32x32":
            from ago.covers_interp8_vps_32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vps-32x16":
            from ago.covers_interp8_vps_32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vps-16x32":
            from ago.covers_interp8_vps_16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-vps-16x16":
            from ago.covers_interp8_vps_16x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-8x32":
            from ago.covers_interp8_hps_8x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-8x16":
            from ago.covers_interp8_hps_8x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-32x8":
            from ago.covers_interp8_hps_32x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-32x32":
            from ago.covers_interp8_hps_32x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-32x16":
            from ago.covers_interp8_hps_32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-16x8":
            from ago.covers_interp8_hps_16x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-16x32":
            from ago.covers_interp8_hps_16x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-hps-16x16":
            from ago.covers_interp8_hps_16x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sao":
            from ago.covers_sao import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "find-pos-first-last":
            from ago.covers_find_pos_first_last import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "pel-filter-luma-strong":
            from ago.covers_pel_filter_luma_strong import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "scale2d":
            from ago.covers_scale2d import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sign":
            from ago.covers_sign import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "scan-pos-last":
            from ago.covers_scan_pos_last import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "pu-copy-pp":
            from ago.covers_pu_copy_pp import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "pu-addavg":
            from ago.covers_pu_addavg import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "sad-32":
            from ago.covers_sad_32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "ssd":
            from ago.covers_ssd import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "mc":
            from ago.covers_mc import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-64x32":
            from ago.covers_interp8_64x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-32x16":
            from ago.covers_interp8_32x16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "interp8-16":
            from ago.covers_interp8_16 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-32x64":
            from ago.covers_satd32x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-64x32":
            from ago.covers_satd64x32 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-64x48":
            from ago.covers_satd64x48 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-64x64":
            from ago.covers_satd64x64 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-16x4":
            from ago.covers_satd16x4 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "satd-32x8":
            from ago.covers_satd32x8 import cover_meta as _cmeta  # noqa: E402
        elif args.kernel == "psy-cost-16x16":
            from ago.covers_psycost import cover_meta as _cmeta  # noqa: E402
        else:
            raise ValueError("--rank-by ago: kernel %s has no cover_meta"
                             % args.kernel)
        tgt = args.mca_target or "NP1"
        table_path = {
            "920B": os.path.join(
                ROOT, "benchmarks/sve-timing-920b/timing-sve1-ago.json"),
            "NP1": os.path.join(
                ROOT, "benchmarks/neon-timing-n1/timing-n1.json"),
        }.get(tgt, os.path.join(ROOT,
                                "benchmarks/neon-timing-n1/timing-n1.json"))
        table = _json.load(open(table_path))
        meta = _cmeta()
        for r in ok:
            src = os.path.join(args.outdir, r["tag"] + ".cpp")
            obj = os.path.join(args.outdir, r["tag"] + ".ago.o")
            _ago_march = "armv8.2-a+sve2" if args.kernel in (
                "interp8", "interp8-8x16", "interp8-16x32", "dct16",
                "interp4vpp-12x16",
                "interp4vpp-12x32",
                "interp4vpp-16",
                "interp4vpp-16x12",
                "interp4vpp-16x24",
                "interp4vpp-16x32",
                "interp4vpp-16x4",
                "interp4vpp-16x64",
                "interp4vpp-16x8",
                "interp4vpp-24x32",
                "interp4vpp-24x64",
                "interp4vpp-32x16",
                "interp4vpp-32x24",
                "interp4vpp-32x32",
                "interp4vpp-32x48",
                "interp4vpp-32x64",
                "interp4vpp-32x8",
                "interp4vpp-8x16",
                "interp4vpp-8x32",
                "interp4vpp-8x4",
                "interp4vpp-8x6",
                "interp4vpp-8x64",
                "interp4vpp-8x8",
                "interp8vpp-12x16",
                "interp8vpp-16",
                "interp8vpp-16x12",
                "interp8vpp-16x32",
                "interp8vpp-16x4",
                "interp8vpp-16x64",
                "interp8vpp-16x8",
                "interp8vpp-24x32",
                "interp8vpp-32",
                "interp8vpp-32x16",
                "interp8vpp-32x24",
                "interp8vpp-32x64",
                "interp8vpp-32x8",
                "interp8vpp-64x16",
                "interp8vpp-64x32",
                "interp8vpp-64x48",
                "interp8vpp-64x64",
                "interp8vpp-8x16",
                "interp8vpp-8x32",
                "interp8vpp-8x4", "dct32", "dct8", "sa8d16", "sa8d-32x32", "sa8d-64x64", "satd-16", "satd-16x32",
                "satd-16x4",
                "satd-16x64",
                "satd-32x16",
                "satd-32x32",
                "satd-64x16",
                "satd-64x64",
                "satd-64x48",
                "satd-64x32",
                "satd-32x64",
                "satd-32x8",
                "sad", "psy-cost-16x16", "satd-8x4",
                "satd-8x32",
                "satd-8x16", "satd-16x8",
                "cost-coeff-nxn", "sao-stats-e0", "interp8-hps-16x16",
                "interp8-16",
                "interp8-32x16",
                "interp8-64x32",
                "mc",
                "ssd",
                "sad-32",
                "pu-addavg",
                "pu-copy-pp",
                "scan-pos-last",
                "sign",
                "scale2d",
                "pel-filter-luma-strong",
                "find-pos-first-last",
                "sao",
                "interp8-hps-16x32",
                "interp8-hps-16x8",
                "interp8-hps-32x16",
                "interp8-hps-32x32",
                "interp8-hps-32x8",
                "interp8-hps-8x16",
                "interp8-hps-8x32",
                "interp8-vps-16x16",
                "interp8-vps-16x32",
                "interp8-vps-32x16",
                "interp8-vps-32x32",
                "interp8-vps-8x16",
                "interp8-vps-8x8",
                "interp8-vsp-16x16",
                "interp8-vsp-16x32",
                "interp8-vsp-32x16",
                "interp8-vsp-32x32",
                "interp8-vsp-8x16",
                "interp8-vsp-8x8",
                "interp8-vss-16x16",
                "interp8-vss-16x32",
                "interp8-vss-16x4",
                "interp8-vss-32x16",
                "interp8-vss-32x32",
                "interp8-vss-8x16",
                "interp8-vss-8x4",
                "interp8-vss-8x8",
                "idct16",
                "idct32",
                "chroma-copy-pp",
                "chroma-copy-sp-16x16",
                "chroma-copy-ss-16x16",
                "cu-copy-ps",
                "cu-copy-sp",
                "cu-copy-ss",
                "chroma-copy-pp-8x8",
                "chroma-copy-pp-32x32",
                "chroma-copy-ps-16x16",
                "cu-copy-pp",
                "cu-add-ps",
                "cu-sub-ps",
                "chroma-addavg-8x8",
                "sao-stats-bo",
                "sao-stats-e3",
                "sao-b0",
                "sao-e1",
                "sao-e2",
                "sao-e3",
                "sao-stats-e1", "sao-stats-e2") \
                else "armv8.2-a+dotprod"
            # _CXX may be "clang --target=aarch64-linux-gnu" (dct8 special
            # case, docs/30 1.7); split so subprocess sees separate args.
            _sp.run((args.cxx or _CXX).split() +
                    ["-O3", "-DNDEBUG", "-std=c++17",
                     "-march=" + _ago_march, "-c", src, "-o", obj],
                    timeout=180, capture_output=True)
            feats = extract_features(obj, src)
            cover = r["tag"].split("-")[-1]
            p = predict_from_features(meta, cover, table, feats)
            r["ago_pred"] = apply_calibration(p["predicted_cyc"],
                                                args.kernel, _calib)
        print("rank by ago prediction (%s table):" % tgt)
        for r in sorted(ok, key=lambda r: r.get("ago_pred") or 1e9):
            print("  %-24s fused_uop=%d ago_pred=%.1f"
                  % (r["tag"], fu(r), r.get("ago_pred") or 0.0))
        ok.sort(key=lambda r: (r.get("ago_pred") is None,
                               r.get("ago_pred") or 1e9, fu(r)))
    if args.rank_by == "permute" and ok:
        # Permute-aware ranking (docs/79 P1): permute_depth_ratio has
        # rho=-1.000 vs 950 measured. Lower ratio = faster. Candidates
        # without static_counts data fall to the back.
        import subprocess as _sp
        _opt = os.path.join(ROOT, "optimizer")
        if _opt not in sys.path:
            sys.path.insert(0, _opt)
        from ago.objfeatures import extract_features  # noqa: E402
        for r in ok:
            src = os.path.join(args.outdir, r["tag"] + ".cpp")
            obj = os.path.join(args.outdir, r["tag"] + ".permute.o")
            _sp.run([args.cxx or _CXX, "-O3", "-DNDEBUG", "-std=c++17",
                     "-march=armv8.2-a+sve2", "-c", src, "-o", obj],
                    timeout=180, capture_output=True)
            feats = extract_features(obj, src)
            r["permute_ratio"] = feats.get("permute_depth_ratio")
            r["cp_lat_sc"] = feats.get("critical_path_latency")
            r["cp_len_sc"] = feats.get("critical_path_len")
        print("rank by permute_depth_ratio (rho=-1.000 vs 950):")
        for r in sorted(ok, key=lambda r: (r.get("permute_ratio") is None,
                                          r.get("permute_ratio") or 1e9)):
            ratio = r.get("permute_ratio")
            flag = " *** >30% ***" if ratio and ratio >= 0.30 else ""
            print("  %-24s fused_uop=%d permute_ratio=%.1f%% cp_lat=%s%s"
                  % (r["tag"], fu(r), (ratio or 0) * 100,
                     r.get("cp_lat_sc") or "-", flag))
        ok.sort(key=lambda r: (r.get("permute_ratio") is None,
                               r.get("permute_ratio") or 1e9, fu(r)))
    baseline = manifest.get("targets", {}).get("baseline_fused_uop")
    gate = manifest.get("targets", {}).get("halve_gate", 0.5)
    shape = manifest.get("shape", {})
    n_out = None
    if shape.get("kind") in (None, "dct"):
        n = shape.get("n", 16)
        n_out = n * n
    print("rank by uop-honest fused count (scatter/gather = %d uops at "
          "VL=%d, docs/17 2026-08-14 口径):"
          % (max(1, vl_bytes // 8), vl_bytes * 8))
    for r in ok:
        fuc = fu(r)
        mca = r.get("mca_cycles")
        ratio = fuc / baseline if baseline else None
        gate_mark = ""
        if ratio is not None:
            gate_mark = (" HALVED" if ratio <= gate else
                         " near-gate" if ratio <= gate * 1.25 else " NO")
        per_out = (" per_out=%.2f" % (fuc / n_out)) if n_out else ""
        mca_str = (" mca=%d" % mca) if mca is not None else ""
        print("  %-24s vector=%d fused_adj=%d sg=%d stk=%d fused_uop=%d%s%s%s"
              % (r["tag"], r["counts"]["vector"],
                 r["counts"]["vector_fused"],
                 r["counts"].get("scatter_gather", 0),
                 r["counts"].get("stack_vector", 0),
                 fuc, per_out, gate_mark, mca_str))
        if ratio is not None:
            r["baseline_ratio"] = ratio
            r["halve_gate_met"] = ratio <= gate
        if n_out:
            r["fused_uop_per_output"] = round(fuc / n_out, 3)
    if args.mca_top and ok:
        # 短名单 = top-N by fused ∪ top-K by low stack ∪ top-K by high
        # stack（round-0017 tooling-roadmap：MCA 需覆盖“fused 改善但
        # spill 恶化”的风险候选与低 spill 黑马，不能只取 fused top-N）。
        def stk(r):
            return (r.get("counts") or {}).get("stack_vector", 0)
        k = max(1, min(args.mca_top // 3, len(ok)))
        shortlist = set(id(r) for r in ok[:min(args.mca_top, len(ok))])
        shortlist |= set(id(r) for r in sorted(ok, key=stk)[:k])
        shortlist |= set(id(r)
                         for r in sorted(ok, key=stk, reverse=True)[:k])
        sel = [r for r in ok if id(r) in shortlist]
        print("llvm-mca second proxy on %d candidates (fused top-%d ∪ "
              "stack low/high top-%d, %s, complete dynamic stream):"
              % (len(sel), min(args.mca_top, len(ok)), k,
                 args.mca_mcpu))
        for r in sel:
            trace = os.path.join(args.outdir, r["tag"] + "-trace.log")
            rng = candidate_range(r, args.outdir, manifest, args.backend,
                                  args.kernel)
            if rng is None or not os.path.exists(trace):
                print("  %-24s no trace for MCA" % r["tag"])
                continue
            mca_s = os.path.join(args.outdir, r["tag"] + ".mca.s")
            fix_driver = None
            if is_sdot_compute(r.get("compute")):
                # repaired dynamic stream + patched llvm-mca (docs/26 §5)
                fix_driver = os.path.join(args.outdir,
                                          r["tag"] + "-trace-driver")
            mca_mattr = args.mca_mattr
            mca_arch = args.mca_arch
            if r.get("compute") == "sdot-h":
                # SVE2p3 (sdot.h): llvm-mc must know sve2p3 or it silently
                # skips sdot.h (docs/22 §5.3); custom llvm-mca needed.
                mca_mattr = "+sve2p3"
                mca_arch = mca_arch or "armv9.4-a+sve2p3"
            cycles, uops, total = run_dynamic_mca(
                trace, rng[0], rng[1], mca_s, args.mca_mcpu,
                mca_mattr, fix_driver=fix_driver,
                mca_bin=args.mca_bin, mca_arch=mca_arch)
            r["mca_cycles"] = cycles
            r["mca_uops"] = uops
            print("  %-24s fused_uop=%d dyn=%d mca_cycles=%s mca_uops=%s"
                  % (r["tag"], fu(r), total, cycles, uops))
        withmca = [r for r in ok if r.get("mca_cycles") is not None]
        if withmca:
            print("rank by mca_cycles:")
            for r in sorted(withmca, key=lambda r: r["mca_cycles"]):
                print("  %-24s fused_uop=%d mca_cycles=%d mca_uops=%d"
                      % (r["tag"], fu(r), r["mca_cycles"], r["mca_uops"]))
            if args.rank_by == "mca":
                # re-rank by the second proxy; finalize picks ok[0].
                ok.sort(key=lambda r: (r.get("mca_cycles") is None,
                                       r.get("mca_cycles") or 10 ** 9,
                                       fu(r)))
    if args.cost_top and ok:
        from optimizer.mca_targets import target as mca_target
        from optimizer.analysis.cost import TargetProfile, cycles_lb
        from parse_qemu_trace import parse_exec
        tgt = mca_target(args.mca_target)
        prof = TargetProfile(tgt["name"], issue_rate=tgt["issue_rate"],
                             **tgt["throughput"])
        print("target-throughput estimator on top-%d by fused_uop (%s, "
              "SVE %dx%d / NEON %dx%d):"
              % (min(args.cost_top, len(ok)), tgt["name"],
                 tgt["sve_pipes"], tgt["sve_vl_bits"],
                 tgt["neon_pipes"], tgt["neon_vl_bits"]))
        key = "est_cycles_" + tgt["name"]
        vkey = "vector_lb_" + tgt["name"]
        for r in ok[:min(args.cost_top, len(ok))]:
            trace = os.path.join(args.outdir, r["tag"] + "-trace.log")
            rng = candidate_range(r, args.outdir, manifest, args.backend,
                                  args.kernel)
            is_sdot = is_sdot_compute(r.get("compute"))
            if rng is None or (not is_sdot and not os.path.exists(trace)):
                print("  %-24s no trace for estimator" % r["tag"])
                continue
            hist = {}
            insns = None
            if is_sdot_compute(r.get("compute")):
                from static_counts import static_hist
                hist = static_hist(os.path.join(args.outdir,
                                                r["tag"] + ".o"))
                from static_counts import static_insns
                insns = static_insns(os.path.join(args.outdir,
                                                  r["tag"] + ".o"))
            else:
                insns = parse_exec(trace, rng[0], rng[1])
                for insn in insns:
                    hist[insn["mn"]] = hist.get(insn["mn"], 0) + 1
            lb, _ = cycles_lb(hist, prof)
            r[key] = lb
            sve, neon = vector_width_counts(insns or [])
            vlb = 0.0
            if sve:
                vlb = max(vlb, sve / tgt["sve_pipes"])
            if neon:
                vlb = max(vlb, neon / tgt["neon_pipes"])
            r[vkey] = vlb
            r["vector_sve_" + tgt["name"]] = sve
            r["vector_neon_" + tgt["name"]] = neon
            print("  %-24s fused_uop=%d %s=%.1f %s=%.1f (sve=%d neon=%d)"
                  % (r["tag"], fu(r), key, lb, vkey, vlb, sve, neon))
        withcost = [r for r in ok if r.get(key) is not None]
        if withcost:
            print("rank by %s:" % key)
            for r in sorted(withcost, key=lambda r: r[key]):
                print("  %-24s fused_uop=%d %s=%.1f"
                      % (r["tag"], fu(r), key, r[key]))
            if args.rank_by == "vector-lb":
                # NP1/920B 宽度口径：sve/neon 向量指令数 ÷ 各自 pipe 数
                # （docs/26 §5）。与 NV2 代理 MCA 并行对照。
                ok.sort(key=lambda r: (r.get(vkey) is None,
                                       r.get(vkey) or 10 ** 9, fu(r)))
    if args.cp_top and ok:
        from critical_path_dynamic import critical_path as cp_fn
        from optimizer.mca_targets import target as mca_target
        tgt = mca_target(args.mca_target)
        ckey = "cp_cycles_" + tgt["name"]
        print("critical-path estimator on top-%d by fused_uop (%s, "
              "NV2 latencies, dynamic stream):"
              % (min(args.cp_top, len(ok)), tgt["name"]))
        for r in ok[:min(args.cp_top, len(ok))]:
            trace = os.path.join(args.outdir, r["tag"] + "-trace.log")
            rng = candidate_range(r, args.outdir, manifest, args.backend,
                                  args.kernel)
            is_sdot = is_sdot_compute(r.get("compute"))
            if rng is None or (not is_sdot and not os.path.exists(trace)):
                print("  %-24s no trace for cp estimator" % r["tag"])
                continue
            if is_sdot_compute(r.get("compute")):
                # static stream: objdump disassembles sdot correctly;
                # estimate_critical_path consumes the same fmt_insns form.
                from critical_path_dynamic import fmt_insns, latency_table
                from static_counts import static_insns
                from optimizer.analysis.critical_path import (
                    estimate_critical_path)
                insns = static_insns(os.path.join(args.outdir,
                                                  r["tag"] + ".o"))
                cp, _, _, _ = estimate_critical_path(
                    fmt_insns(insns), latency_table(tgt))
            else:
                cp, _, _ = cp_fn(trace, hex(rng[0]), hex(rng[1]), tgt)
            r[ckey] = cp
            print("  %-24s fused_uop=%d %s=%.1f"
                  % (r["tag"], fu(r), ckey, cp))
        withcp = [r for r in ok if r.get(ckey) is not None]
        if withcp:
            print("rank by %s:" % ckey)
            for r in sorted(withcp, key=lambda r: r[ckey]):
                print("  %-24s fused_uop=%d %s=%.1f"
                      % (r["tag"], fu(r), ckey, r[ckey]))
            if args.rank_by == "cp":
                ok.sort(key=lambda r: (r.get(ckey) is None,
                                       r.get(ckey) or 10 ** 9, fu(r)))
    if args.lite_top and ok:
        gate = {"sa8d": "sa8d", "sa8d16": "sa8d16",
                "dct16": "dct16", "dct32": "dct32",
                "idct16": "idct16", "idct32": "idct32",
                "interp8": "interp8", "interp8-16": "interp8",
                "interp8-32": "interp8"}.get(args.kernel)
        seeds = [s.strip() for s in args.lite_seeds.split(",") if s.strip()]
        if gate is None or not seeds:
            print("lite gate unavailable for kernel %r or empty seeds"
                  % args.kernel, file=sys.stderr)
        else:
            lite_sh = os.path.join(ROOT, "scripts", "build-testbench-lite.sh")
            tb = os.path.join(ROOT, "build", "x265-8-testbench")
            print("TestBenchLite golden gate on top-%d by fused_uop "
                  "(%d seeds: %s):"
                  % (min(args.lite_top, len(ok)), len(seeds),
                     ",".join(seeds)))
            for r in ok[:min(args.lite_top, len(ok))]:
                obj = os.path.join(args.outdir, r["tag"] + ".o")
                if not os.path.exists(obj):
                    src = os.path.join(args.outdir, r["tag"] + ".cpp")
                    cc = ["aarch64-linux-gnu-g++",
                          candidate_opt(r), "-std=c++11",
                          "-march=" + candidate_march(r),
                          "-c", src, "-o", obj]
                    if args.backend == "op":
                        cc.insert(2, "-fno-tree-pre")
                    c = run(cc, timeout=120)
                    if c.returncode != 0:
                        print("  %-24s lite build FAIL" % r["tag"])
                        continue
                passes = 0
                fails = []
                for s in seeds:
                    try:
                        p = run([lite_sh, obj, tb, "--", "--gate", gate,
                                 "--seed", s], timeout=180)
                    except subprocess.TimeoutExpired:
                        fails.append(s + ":timeout")
                        continue
                    tail = (p.stdout or "") + (p.stderr or "")
                    # harness prints e.g. "dct32 PASS", "sa8d[16x16] PASS",
                    # "interp8[8x8 luma_hpp] PASS" -- use the generic marker.
                    if "PASS" in tail and "FAIL" not in tail:
                        passes += 1
                    else:
                        fails.append(s)
                r["lite_pass"] = passes == len(seeds)
                r["lite_passed"] = passes
                r["lite_fails"] = fails
                print("  %-24s fused_uop=%d lite=%d/%d %s"
                      % (r["tag"], fu(r), passes, len(seeds),
                         "PASS" if r["lite_pass"] else "FAIL " + str(fails)))
            if args.rank_by == "lite":
                ok.sort(key=lambda r: (r.get("lite_pass") is not True, fu(r)))
    if args.bench_920b and ok:
        import re
        host = args.bench_920b
        print("920B real-machine reference on top-%d candidates (%s, "
              "docs/29 §6; MCA remains primary):"
              % (min(args.bench_top, len(ok)), host))
        paired_dct = os.path.join(ROOT, "scripts", "bench-dct32-paired.sh")
        paired_gen = os.path.join(ROOT, "scripts", "bench-generic-paired.sh")
        if args.kernel in ("sa8d", "sa8d16"):
            shape = "16x16" if args.kernel == "sa8d16" else "8x8"
            sym16 = manifest["candidate"]["symbol"]
            mb_src = os.path.join(ROOT, "benchmarks/sa8d_microbench.cpp")
            for r in ok[:min(args.bench_top, len(ok))]:
                tag = r["tag"]
                obj = os.path.join(args.outdir, tag + ".o")
                binp = os.path.join(args.outdir, tag + "-sa8d-bench")
                cc = ["aarch64-linux-gnu-g++", "-O2", "-static", "-std=c++11",
                      "-DX265_NS=x265", "-DX265_DEPTH=8", "-DHIGH_BIT_DEPTH=0",
                      "-DDYNOPT_CANDIDATE=dynopt_sa8d_8x8_sve2",
                      "-DDYNOPT_CANDIDATE16=" + sym16,
                      ] + _OPT_EXTRA.split() + [
                      "-I", os.path.join(ROOT, "third_party/x265/source"),
                      "-I", os.path.join(ROOT, "third_party/x265/source/common"),
                      "-I", os.path.join(ROOT, "build/x265-8-cross-make"),
                      mb_src,
                      os.path.join(ROOT, "kernels/sa8d/candidates/best_sve2.o"),
                      obj,
                      "-Wl,--start-group",
                      os.path.join(ROOT, "build/x265-8-cross-make/libx265.a"),
                      "-Wl,--end-group", "-lpthread", "-ldl", "-o", binp]
                c = run(cc, timeout=300)
                if c.returncode != 0 or not os.path.exists(binp):
                    print("  %-24s sa8d bench build failed" % tag)
                    r["bench920_ratio"] = None
                    continue
                try:
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", binp,
                         host + ":/tmp/sv_" + tag], timeout=180,
                        capture_output=True)
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", paired_gen,
                         host + ":/tmp/bench-generic-paired.sh"],
                        timeout=60, capture_output=True)
                    rr = run(
                        ["ssh", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", host,
                         "bash /tmp/bench-generic-paired.sh /tmp/sv_%s %s "
                         "neon cand 20 8 /tmp/svpair_%s 2>&1 | grep 'neon/cand'"
                         % (tag, shape, tag)], timeout=600)
                    m = re.search(r"median=([0-9.]+)", rr.stdout)
                    ratio = float(m.group(1)) if m else None
                    r["bench920_ratio"] = ratio
                    print("  %-24s bench920 %s neon/cand ratio=%s"
                          % (tag, shape, ratio))
                except Exception as e:  # noqa: BLE001
                    print("  %-24s bench920 skipped: %s" % (tag, e))
        elif args.kernel in ("interp8", "interp8-16", "interp8-32"):
            shape_n = {"interp8": 8, "interp8-16": 16,
                       "interp8-32": 32}[args.kernel]
            shape = "%dx%d" % (shape_n, shape_n)
            for r in ok[:min(args.bench_top, len(ok))]:
                tag = r["tag"]
                binp = os.path.join(args.outdir, tag + "-sve1-bench")
                ok_b = run(
                    ["bash", os.path.join(ROOT, "scripts",
                                          "build-interp8-substituted-"
                                          "microbench.sh"),
                     str(shape_n), "sve1", binp], timeout=300)
                if ok_b.returncode != 0 or not os.path.exists(binp):
                    print("  %-24s sve1 build failed" % tag)
                    r["bench920_ratio"] = None
                    continue
                try:
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", binp,
                         host + ":/tmp/sv_" + tag], timeout=180,
                        capture_output=True)
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", paired_gen,
                         host + ":/tmp/bench-generic-paired.sh"],
                        timeout=60, capture_output=True)
                    rr = run(
                        ["ssh", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", host,
                         "bash /tmp/bench-generic-paired.sh /tmp/sv_%s %s "
                         "neon cand 20 8 /tmp/svpair_%s 2>&1 | grep 'neon/cand'"
                         % (tag, shape, tag)], timeout=600)
                    m = re.search(r"median=([0-9.]+)", rr.stdout)
                    ratio = float(m.group(1)) if m else None
                    r["bench920_ratio"] = ratio
                    print("  %-24s bench920 %s neon/cand ratio=%s"
                          % (tag, shape, ratio))
                except Exception as e:  # noqa: BLE001
                    print("  %-24s bench920 skipped: %s" % (tag, e))
        elif args.kernel in ("interp8-hps-16x16",
                "interp8-16",
                "interp8-32x16",
                "interp8-64x32",
                "mc",
                "ssd",
                "sad-32",
                "pu-addavg",
                "pu-copy-pp",
                "scan-pos-last",
                "sign",
                "scale2d",
                "pel-filter-luma-strong",
                "find-pos-first-last",
                "sao",
                "interp8-hps-16x32",
                "interp8-hps-16x8",
                "interp8-hps-32x16",
                "interp8-hps-32x32",
                "interp8-hps-32x8",
                "interp8-hps-8x16",
                "interp8-hps-8x32",
                "interp8-vps-16x16",
                "interp8-vps-16x32",
                "interp8-vps-32x16",
                "interp8-vps-32x32",
                "interp8-vps-8x16",
                "interp8-vps-8x8",
                "interp8-vsp-16x16",
                "interp8-vsp-16x32",
                "interp8-vsp-32x16",
                "interp8-vsp-32x32",
                "interp8-vsp-8x16",
                "interp8-vsp-8x8",
                "interp8-vss-16x16",
                "interp8-vss-16x32",
                "interp8-vss-16x4",
                "interp8-vss-32x16",
                "interp8-vss-32x32",
                "interp8-vss-8x16",
                "interp8-vss-8x4",
                "interp8-vss-8x8",
                "idct16", "idct32"):
            for r in ok[:min(args.bench_top, len(ok))]:
                tag = r["tag"]
                cpp = os.path.join(args.outdir, tag + ".cpp")
                if not os.path.exists(cpp):
                    print("  %-24s no candidate source" % tag)
                    continue
                binp = os.path.join(args.outdir, tag + "-sve1-bench")
                try:
                    build_substituted(args.kernel, cpp, binp)
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", binp,
                         host + ":/tmp/sv_" + tag], timeout=180,
                        capture_output=True)
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", paired_dct,
                         host + ":/tmp/bench-paired.sh"], timeout=60,
                        capture_output=True)
                    rr = run(
                        ["ssh", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", host,
                         "bash /tmp/bench-paired.sh /tmp/sv_%s neon cand "
                         "10 2 /tmp/svpair_%s 2>&1 | tail -1"
                         % (tag, tag)], timeout=600)
                    line = (rr.stdout.strip().splitlines()[-1]
                            if rr.stdout.strip() else "")
                    m = re.search(r"median=([0-9.]+)", line)
                    ratio = float(m.group(1)) if m else None
                    r["bench920_ratio"] = ratio
                    print("  %-24s bench920 neon/cand ratio=%s"
                          % (tag, ratio))
                except Exception as e:  # noqa: BLE001
                    print("  %-24s bench920 skipped: %s" % (tag, e))
        elif args.kernel == "dct8":
            for r in ok[:min(args.bench_top, len(ok))]:
                tag = r["tag"]
                cpp = os.path.join(args.outdir, tag + ".cpp")
                if not os.path.exists(cpp):
                    print("  %-24s no candidate source" % tag)
                    continue
                binp = os.path.join(args.outdir, tag + "-dct8-bench")
                try:
                    b = run(
                        ["bash", os.path.join(ROOT, "scripts",
                                              "build-dct8-microbench.sh"),
                         "build/x265-8-clang-sve", binp, cpp], timeout=300)
                    if b.returncode != 0 or not os.path.exists(binp):
                        print("  %-24s dct8 microbench build failed" % tag)
                        r["bench920_ratio"] = None
                        continue
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", binp,
                         host + ":/tmp/sv_" + tag], timeout=180,
                        capture_output=True)
                    subprocess.run(
                        ["scp", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", paired_dct,
                         host + ":/tmp/bench-paired.sh"], timeout=60,
                        capture_output=True)
                    rr = run(
                        ["ssh", "-o", "ConnectTimeout=10",
                         "-o", "BatchMode=yes", host,
                         "bash /tmp/bench-paired.sh /tmp/sv_%s neon cand "
                         "10 2 /tmp/svpair_%s 2>&1 | tail -1"
                         % (tag, tag)], timeout=600)
                    line = (rr.stdout.strip().splitlines()[-1]
                            if rr.stdout.strip() else "")
                    m = re.search(r"median=([0-9.]+)", line)
                    ratio = float(m.group(1)) if m else None
                    r["bench920_ratio"] = ratio
                    print("  %-24s bench920 neon/cand ratio=%s"
                          % (tag, ratio))
                except Exception as e:  # noqa: BLE001
                    print("  %-24s bench920 skipped: %s" % (tag, e))
        else:
            print("bench-920b: kernel %r has no microbenchmark; skipped"
                  % args.kernel, file=sys.stderr)
    if args.rank_by == "bench920" and ok:
        ok.sort(key=lambda r: (r.get("bench920_ratio") is None,
                               -(r.get("bench920_ratio") or 0.0),
                               fu(r)))
        print("rank by 920B CNTVCT neon/cand ratio "
              "(higher = candidate faster):")
        for r in ok:
            print("  %-24s ratio=%s fused_uop=%d"
                  % (r["tag"], r.get("bench920_ratio"), fu(r)))
    if args.rank_by == "consensus" and ok:
        tgt = None
        try:
            from optimizer.mca_targets import target as mca_target
            tgt = mca_target(args.mca_target)
        except Exception:
            pass
        ekey = "est_cycles_%s" % (tgt["name"] if tgt else "NP1")
        ckey = "cp_cycles_%s" % (tgt["name"] if tgt else "NP1")
        vkey = "vector_lb_%s" % (tgt["name"] if tgt else "NP1")
        proxies = [("fused_uop", fu),
                   ("mca_cycles", lambda r: r.get("mca_cycles")),
                   ("est_cycles", lambda r: r.get(ekey)),
                   ("vector_lb", lambda r: r.get(vkey)),
                   ("cp_cycles", lambda r: r.get(ckey)),
                   ("lite_pass", lambda r: 0.0 if r.get("lite_pass")
                    is True else 1.0)]
        n = len(ok)

        def rank(vals):
            # ascending rank with missing -> worst (n)
            order = sorted(range(n),
                           key=lambda i: (vals[i] is None,
                                          vals[i] if vals[i] is not None
                                          else 1e18))
            rk = [0] * n
            for pos, i in enumerate(order):
                rk[i] = pos
            return rk

        ranks = {}
        for name, getter in proxies:
            ranks[name] = rank([getter(r) for r in ok])
        for i, r in enumerate(ok):
            r["consensus_rank"] = sum(ranks[name][i]
                                      for name, _ in proxies) / len(proxies)
        print("rank by consensus (mean of normalized proxy ranks):")
        for i, r in enumerate(sorted(ok, key=lambda r: r["consensus_rank"])):
            print("  %-24s fu=%d mca=%s est=%s cp=%s lite=%s consensus=%.2f"
                  % (r["tag"], fu(r), r.get("mca_cycles"),
                     r.get(ekey), r.get(ckey),
                     "PASS" if r.get("lite_pass") is True else "FAIL",
                     r["consensus_rank"]))
        ok.sort(key=lambda r: r["consensus_rank"])
    # persist results after the MCA pass so mca_cycles/mca_uops survive
    # (previously dumped before --mca-top ran and MCA data was lost).
    json.dump(results, open(os.path.join(args.outdir, "results.json"), "w"),
              indent=1)
    if args.finalize and ok:
        if args.require_lite:
            ok = [r for r in ok if r.get("lite_pass") is True]
            if not ok:
                print("require-lite: no lite-passing candidate; "
                      "refusing to finalize", file=sys.stderr)
                json.dump(results,
                          open(os.path.join(args.outdir, "results.json"),
                               "w"), indent=1)
                return 1
        best = ok[0]
        cand_dir = os.path.join(ROOT, "kernels", args.kernel, "candidates")
        os.makedirs(cand_dir, exist_ok=True)
        stem = "best_sve1" if _ISA == "sve1" else "best_sve2"
        src_path = os.path.join(cand_dir, stem + ".cpp")
        s_path = os.path.join(cand_dir, stem + ".S")
        obj_path = os.path.join(cand_dir, stem + ".o")
        with open(src_path, "w") as f:
            meta = {"tag", "contract", "upstream_exact", "passed",
                    "verify_mismatches", "verify", "counts", "cached"}
            combo = {k: v for k, v in best.items() if k not in meta}
            f.write(emit(combo))
        run(cxx_for(best).split() + candidate_opt(best).split() + [
             "-march=" + candidate_march(best),
             "-S", src_path, "-o", s_path])
        c = run(cxx_for(best).split() + candidate_opt(best).split() + [
                 "-march=" + candidate_march(best),
                 "-c", src_path, "-o", obj_path])
        if c.returncode == 0:
            print("finalized %s (fused_uop=%d)" % (src_path, fu(best)))
            gate = {"sa8d": "sa8d", "sa8d16": "sa8d16",
                    "dct16": "dct16", "dct32": "dct32",
                    "idct16": "idct16", "idct32": "idct32",
                    "interp8": "interp8", "interp8-16": "interp8",
                    "interp8-32": "interp8"}.get(args.kernel)
            if gate:
                lite = run(["scripts/build-testbench-lite.sh", obj_path,
                            "build/x265-8-testbench", "--", "--gate", gate,
                            "--seed", "0x12345678"])
                tail = lite.stdout.strip().splitlines()
                print("  lite gate %s: %s"
                      % (gate, tail[-1] if tail else "no output"))
        else:
            print("finalize FAIL: best candidate did not compile")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
