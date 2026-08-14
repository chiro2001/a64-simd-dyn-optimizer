#!/usr/bin/env python3
"""Normalized kernel seed extraction: source + compile recipe + target
function -> machine-ir.json (docs/41).

Input is a seed recipe (YAML) that declares everything needed to reproduce
the extraction, independent of the host project (x265 or others):

    seed: dct16
    compiler: clang
    target: aarch64-linux-gnu
    source: third_party/x265/source/common/aarch64/dct-prim.cpp
    clang_args: [ -march=..., -O3, ..., -I... ]
    target_function:
      mangled: _ZN4x26510dct16_neonEPKsPsl
      demangled: x265::dct16_neon
    output:
      ll: experiments/<seed>/llvm-ir/<name>.ll
      json: experiments/<seed>/imported/machine-ir.json

The tool runs clang -S -emit-llvm, extracts the target function body by
mangled/demangled name, imports it with the restricted LLVM-IR parser
(import_llvm_ir_text), and writes the project MachineIR JSON with
reproducibility provenance (compiler version + source/IR hashes).

When the recipe declares a `verify:` section, the imported MachineIR is
round-tripped (codegen -> compile -> QEMU differential harness) as an
out-of-the-box semantic gate (docs/41): extraction fails if the generated
candidate does not match the project's reference bit-exactly.

Usage:
  python3 tools/extract_seed.py --recipe seeds/dct16.yaml [--compiler clang]
      [--no-verify]
"""

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
from collections import Counter

try:
    import yaml
except ImportError:
    yaml = None

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from machine_ir import import_llvm_ir_text  # noqa: E402
from machine_ir import import_llvm_ir_structured  # noqa: E402

sys.path.insert(0, os.path.join(ROOT, "tools"))
from memguard import install as install_memguard  # noqa: E402
from codegen import (  # noqa: E402
    emit_c_intrinsics,
    emit_dct8_c_intrinsics,
    emit_dct16_c_intrinsics,
    emit_dequant_normal_c_intrinsics,
    emit_dequant_scaling_c_intrinsics,
    emit_nquant_c_intrinsics,
    emit_quant_c_intrinsics,
    emit_ssim_c_intrinsics,
    emit_scale1d_c_intrinsics,
    emit_scale2d_c_intrinsics,
    emit_sao_e0_c_intrinsics,
    emit_sao_b0_c_intrinsics,
    emit_sao_e1_c_intrinsics,
    emit_interp8_c_intrinsics,
    emit_structured_neon_intrinsics,
)


CODEGEN_REGISTRY = {
    "emit_c_intrinsics": emit_c_intrinsics,
    "emit_dct8_c_intrinsics": emit_dct8_c_intrinsics,
    "emit_dct16_c_intrinsics": emit_dct16_c_intrinsics,
    "emit_dequant_normal_c_intrinsics": emit_dequant_normal_c_intrinsics,
    "emit_dequant_scaling_c_intrinsics": emit_dequant_scaling_c_intrinsics,
    "emit_nquant_c_intrinsics": emit_nquant_c_intrinsics,
    "emit_quant_c_intrinsics": emit_quant_c_intrinsics,
    "emit_ssim_c_intrinsics": emit_ssim_c_intrinsics,
    "emit_scale1d_c_intrinsics": emit_scale1d_c_intrinsics,
    "emit_scale2d_c_intrinsics": emit_scale2d_c_intrinsics,
    "emit_sao_e0_c_intrinsics": emit_sao_e0_c_intrinsics,
    "emit_sao_b0_c_intrinsics": emit_sao_b0_c_intrinsics,
    "emit_sao_e1_c_intrinsics": emit_sao_e1_c_intrinsics,
    # emit_interp8_c_intrinsics is the generic node-driven NEON roundtrip
    # emitter (hpp/vpp/interp4 all use it); expose a neutral alias.
    "emit_interp8_c_intrinsics": emit_interp8_c_intrinsics,
    "emit_neon_c_intrinsics": emit_interp8_c_intrinsics,
    "emit_structured_neon_intrinsics": emit_structured_neon_intrinsics,
}

DEFAULT_INCLUDES = [
    "third_party/x265/source",
    "third_party/x265/source/common",
    "build/x265-8-cross-make",
]


def _resolve(root, p):
    return p if os.path.isabs(p) else os.path.join(root, p)


def run_clang(recipe, compiler, root, ll_path):
    target = recipe.get("target", "aarch64-linux-gnu")
    args = list(recipe.get("clang_args", []))
    source = _resolve(root, recipe["source"])
    if not os.path.exists(source):
        raise SystemExit("source not found: %s" % source)
    cmd = [compiler, "-target", target] + args + [
        "-S", "-emit-llvm", source, "-o", ll_path]
    print("+ %s" % " ".join(cmd))
    subprocess.run(cmd, check=True)


def opt_unroll_llvm(ll_path, tables=None, opt_bin="opt"):
    """Strip `!llvm.loop` metadata (x265 pragma disables unrolling), inject
    source constant tables (g_t16 etc., optional), then run LLVM's full loop
    unroller + CFG simplification. Returns the path of the processed IR.

    Validated on idct16 (docs/42 §7): self-loops unroll cleanly after the
    metadata strip; data-dependent diamonds remain for the CFG lowering step.
    """
    text = open(ll_path).read()
    if tables:
        for name, t in tables.items():
            rows = t["rows"]
            row_len = t["row_len"]
            mangled = "_ZN4x265%d%sE" % (len(name), name)
            decl = re.search(
                r"@%s = external[^\n]*\n" % re.escape(mangled), text)
            if not decl:
                continue
            lines = ["@%s = constant [%d x [%d x i16]] [" % (
                mangled, len(rows), row_len)]
            for r in rows:
                body = ", ".join("i16 %d" % v for v in r)
                lines.append("  [%d x i16] [ %s ]," % (row_len, body))
            lines[-1] = lines[-1].rstrip(",")
            lines.append("]")
            text = text.replace(decl.group(0), "\n".join(lines) + "\n")
    text = re.sub(r",\s*!llvm\.loop\s*![0-9]+", "", text)
    work = ll_path + ".unroll.ll"
    with open(work, "w") as f:
        f.write(text)
    subprocess.run([opt_bin, "-passes=loop-unroll-full", "-S", work,
                    "-o", work], check=True)
    subprocess.run([opt_bin,
                    "-passes=function(sccp,instcombine,gvn,simplifycfg)",
                    "-S", work, "-o", work], check=True)
    return work


def find_function(text, target):
    """Locate the `define` line and balanced body for a target function."""
    mangled = target.get("mangled") or ""
    demangled = target.get("demangled") or ""
    pat = None
    for name in (mangled, demangled):
        if not name:
            continue
        pat = re.compile(r"define[^{]*@%s\s*\(" % re.escape(name))
        m = pat.search(text)
        if m:
            break
    if m is None:
        raise SystemExit(
            "target function not found in IR (mangled=%r demangled=%r)"
            % (mangled, demangled))
    start = m.end() - 1  # at the '(' -- body starts after the signature
    brace = text.find("{", start)
    if brace < 0:
        raise SystemExit("no function body found")
    depth = 0
    i = brace
    while i < len(text):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                break
        i += 1
    if depth != 0:
        raise SystemExit("unbalanced braces in IR")
    define_start = text.rfind("define", 0, brace)
    return text[define_start:i + 1]


def strip_uniform_branch(body):
    """Remove a uniform `if (arg == const) special_call; else straight-line`
    branch so the restricted straight-line importer can take the main path.

    Shape handled (interp4: phase==4 dispatches to another kernel):
        %x = icmp eq i32 %4, 4
        br i1 %x, label %T, label %E
      T:
        tail call ...            # special path (dropped)
        br label %M
      E:
        ...                      # main straight-line path (kept)
        br label %M
      M:
        ret void
    """
    lines = body.splitlines()
    icmp_i = next((i for i, ln in enumerate(lines)
                   if "icmp eq" in ln and "br " not in ln), None)
    if icmp_i is None:
        return body
    br = next((ln for ln in lines[icmp_i + 1:]
               if ln.strip().startswith("br i1")), None)
    if br is None:
        raise SystemExit("uniform branch: br i1 not found after icmp")
    m = re.search(r"label %(\d+), label %(\d+)", br)
    if not m:
        raise SystemExit("uniform branch: labels not found")
    then_label, else_label = m.group(1), m.group(2)
    out = []
    skip = False
    for i, ln in enumerate(lines):
        s = ln.strip()
        if i == icmp_i or s.startswith("br i1"):
            continue  # drop the condition + branch
        if s.startswith(then_label + ":"):
            skip = True
            continue
        if skip:
            if s.startswith("br label"):
                skip = False
            continue
        out.append(ln)
    # drop the final `br label %M` before `M: ret` (merge tail)
    for i in range(len(out) - 1, -1, -1):
        if out[i].strip().startswith("br label"):
            del out[i]
            break
    text = "\n".join(out)
    return _resolve_merge_phis(text, else_label) + "\n"


def _resolve_merge_phis(text, keep_block):
    """Resolve merge-block phis to the kept block's incoming values and
    substitute them at every later use (SSA dsts defined at the merge)."""
    phi_repl = {}
    for m in re.finditer(
            r"(%[A-Za-z0-9._]+)\s*=\s*phi\s+\S+\s+(.*)$", text, flags=re.M):
        pairs = re.findall(r"\[\s*(%[A-Za-z0-9._]+)\s*,\s*%(\d+)\s*\]",
                           m.group(2))
        val = next((v for v, b in pairs if b == keep_block), None)
        if val is None:
            raise SystemExit("merge phi %s no value for block %s"
                             % (m.group(1), keep_block))
        phi_repl[m.group(1)] = val
    text = "\n".join(ln for ln in text.splitlines()
                     if " = phi " not in ln)
    for dst, val in phi_repl.items():
        text = re.sub(re.escape(dst) + r"(?![A-Za-z0-9._])", val, text)
    return text


def strip_switch_take_case(body, case):
    """Take one case of a `switch i32 %arg, label %default [...]` where every
    case is a straight-line block ending in `br label %merge` and the merge
    block only contains phis + the tail stores (no loops).

    The phis are resolved to the chosen case's incoming values and the merge
    tail is kept; all remaining `br label` lines are dropped.
    """
    lines = body.splitlines()
    sw = next((i for i, ln in enumerate(lines)
               if ln.strip().startswith("switch i32")), None)
    if sw is None:
        return body
    # parse the switch block: switch line, cases..., ']'
    j = sw + 1
    cases = {}
    while j < len(lines) and "]" not in lines[j]:
        m = re.search(r"i32\s+(-?\d+),\s*label\s+%(\d+)", lines[j])
        if m:
            cases[int(m.group(1))] = m.group(2)
        j += 1
    if case not in cases:
        raise SystemExit("strip_switch: case %r not in %r" % (case, cases))
    keep = cases[case]
    drop = [lb for c, lb in cases.items() if c != case]
    # locate the merge block (target of each case's tail br)
    merge = None
    for i, ln in enumerate(lines):
        if ln.strip().startswith("br label") and i > sw:
            m = re.search(r"label\s+%(\d+)", ln)
            if m:
                merge = m.group(1)
            break
    # build the kept text
    out = []
    skip = False
    for i, ln in enumerate(lines):
        s = ln.strip()
        if sw <= i <= j:
            continue  # drop the whole switch statement
        if any(s.startswith(d + ":") for d in drop):
            skip = True
            continue
        if skip:
            if s.startswith("br label"):
                skip = False
            continue
        out.append(ln)
    text = "\n".join(out)
    text = _resolve_merge_phis(text, keep)
    # drop the remaining br label lines (case tail + merge tail)
    text = "\n".join(ln for ln in text.splitlines()
                     if not ln.strip().startswith("br label"))
    return text + "\n"


def sha256(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def verify_roundtrip(recipe, ir):
    """Codegen the imported MachineIR, compile against the project lib and
    run the differential harness under QEMU; fail loudly on any mismatch."""
    v = recipe.get("verify") or {}
    mode = v.get("codegen")
    if mode not in CODEGEN_REGISTRY:
        raise SystemExit("verify.codegen %r not in registry %s"
                         % (mode, sorted(CODEGEN_REGISTRY)))
    harness = _resolve(ROOT, v.get("harness", ""))
    lib = _resolve(ROOT, v.get("lib", "build/x265-8-clang-sve/libx265.a"))
    cases = v.get("cases", 100000)
    out_cpp = os.path.join(ROOT, "build", "seed-roundtrip-%s.cpp" % recipe["seed"])
    out_bin = os.path.join(ROOT, "build", "seed-roundtrip-%s" % recipe["seed"])
    with open(out_cpp, "w") as f:
        kwargs = {}
        if v.get("func_name"):
            kwargs["func_name"] = v["func_name"]
        f.write(CODEGEN_REGISTRY[mode](ir, **kwargs))
    if os.path.getsize(out_cpp) > 50 * 1024 * 1024:
        raise SystemExit("roundtrip codegen too large (%d bytes): aborting"
                         % os.path.getsize(out_cpp))
    includes = " ".join("-I%s" % _resolve(ROOT, d)
                        for d in v.get("include_dirs", DEFAULT_INCLUDES))
    extra_flags = " ".join(v.get("compile_flags", []))
    compile_cmd = ("aarch64-linux-gnu-g++ -O3 -DNDEBUG -std=c++11 %s "
                   "-DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 "
                   "%s %s %s %s -lpthread -ldl -o %s"
                   % (extra_flags, includes, harness, out_cpp, lib, out_bin))
    print("+ %s" % compile_cmd)
    subprocess.run(compile_cmd, shell=True, check=True)
    run = subprocess.run(
        ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu", out_bin,
         str(cases)],
        capture_output=True, text=True)
    print(run.stdout.strip())
    exact = "mismatches=0" in run.stdout
    neon_exact = "candidate_vs_neon_mismatches=0" in run.stdout
    if not (exact or neon_exact) or (run.returncode != 0 and not neon_exact):
        raise SystemExit("roundtrip gate FAILED (rc=%d): %s"
                         % (run.returncode, run.stderr.strip()[-400:]))
    print("roundtrip gate PASS (%d cases)" % cases)


def main():
    install_memguard()
    ap = argparse.ArgumentParser()
    ap.add_argument("--recipe", required=True)
    ap.add_argument("--compiler", default="clang")
    ap.add_argument("--out", default=None,
                    help="override machine-ir.json output path")
    ap.add_argument("--no-verify", action="store_true",
                    help="skip the recipe-declared roundtrip gate")
    args = ap.parse_args()
    if yaml is None:
        raise SystemExit("pyyaml required")
    recipe = yaml.safe_load(open(args.recipe))

    out = recipe["output"]
    ll_path = _resolve(ROOT, out["ll"])
    json_path = _resolve(ROOT, args.out or out["json"])
    os.makedirs(os.path.dirname(ll_path), exist_ok=True)
    os.makedirs(os.path.dirname(json_path), exist_ok=True)

    run_clang(recipe, args.compiler, ROOT, ll_path)
    if recipe.get("extract", {}).get("opt_unroll"):
        tables = None
        if recipe.get("extract", {}).get("inject_constants"):
            sys.path.insert(0, os.path.join(ROOT, "tools"))
            from extract_x265_constants import parse_int16_tables  # noqa
            cpp = os.path.join(
                ROOT, "third_party/x265/source/common/constants.cpp")
            tables = parse_int16_tables(open(cpp).read())
        ll_path = opt_unroll_llvm(ll_path, tables=tables)
    text = open(ll_path).read()
    body = find_function(text, recipe["target_function"])
    if recipe.get("extract", {}).get("strip_uniform_branch"):
        body = strip_uniform_branch(body)
    if recipe.get("extract", {}).get("strip_switch_case") is not None:
        body = strip_switch_take_case(
            body, recipe["extract"]["strip_switch_case"])
    fn = recipe["target_function"].get("demangled") or \
        recipe["target_function"].get("mangled")
    try:
        if recipe.get("extract", {}).get("import_mode") == "structured":
            ir = import_llvm_ir_structured(body, function=fn)
        else:
            ir = import_llvm_ir_text(body, function=fn)
    except ValueError as e:
        print("importer rejected IR: %s" % e, file=sys.stderr)
        return 3

    version = subprocess.run(
        [args.compiler, "--version"], capture_output=True,
        text=True).stdout.splitlines()[0] if args.compiler else ""
    doc = {
        "function": ir.function,
        "nodes": [dict(n) for n in ir.nodes],
        "provenance": {
            "recipe": os.path.abspath(args.recipe),
            "compiler": version,
            "source_sha256": sha256(_resolve(ROOT, recipe["source"])),
            "ir_sha256": sha256(ll_path),
            "target_function": recipe["target_function"],
        },
    }
    with open(json_path, "w") as f:
        json.dump(doc, f, indent=1)

    hist = Counter(n.get("op") for n in ir.nodes)
    print("imported %d nodes -> %s" % (len(ir.nodes), json_path))
    print("ops: %s" % dict(hist.most_common(10)))
    if not args.no_verify and recipe.get("verify"):
        verify_roundtrip(recipe, ir)
    return 0


if __name__ == "__main__":
    sys.exit(main())
