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

sys.path.insert(0, os.path.join(ROOT, "tools"))
from codegen import (  # noqa: E402
    emit_c_intrinsics,
    emit_dct16_c_intrinsics,
)


CODEGEN_REGISTRY = {
    "emit_c_intrinsics": emit_c_intrinsics,
    "emit_dct16_c_intrinsics": emit_dct16_c_intrinsics,
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
        f.write(CODEGEN_REGISTRY[mode](ir))
    includes = " ".join("-I%s" % _resolve(ROOT, d)
                        for d in v.get("include_dirs", DEFAULT_INCLUDES))
    compile_cmd = ("aarch64-linux-gnu-g++ -O3 -DNDEBUG -std=c++11 "
                   "-DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 "
                   "%s %s %s %s -lpthread -ldl -o %s"
                   % (includes, harness, out_cpp, lib, out_bin))
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
    text = open(ll_path).read()
    body = find_function(text, recipe["target_function"])
    fn = recipe["target_function"].get("demangled") or \
        recipe["target_function"].get("mangled")
    try:
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
