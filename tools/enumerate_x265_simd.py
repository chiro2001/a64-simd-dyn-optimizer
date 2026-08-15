#!/usr/bin/env python3
"""Enumerate x265 AArch64 SIMD operator coverage (docs/37).

Scans third_party/x265/source/common/primitives.h for EncoderPrimitives
fields, finds which are registered by the AArch64 setup files, and maps
them to this project's kernel coverage.

Usage:
  python3 tools/enumerate_x265_simd.py [--json out.json]
"""

import argparse
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
X265 = os.path.join(ROOT, "third_party/x265/source")
AARCH64 = os.path.join(X265, "common/aarch64")

# Family -> keywords used to map primitive fields to our kernels/ dirs.
FAMILY_KEYWORDS = {
    "dct": ["dct", "idct", "dst4x4", "idst4x4"],
    "sa8d/satd": ["sa8d", "satd", "pixel_sa8d", "sa8d_8x8", "sa8d_16x16"],
    "sad": ["sad", "pixel_sad", "sad_x", "sad_y"],
    "interp8": ["interp8", "luma_hpp", "luma_vpp", "luma_hps", "luma_vps",
                "luma_hsp", "luma_vsp", "luma_hvpp"],
    "interp4": ["interp4", "filter_hpp", "filter_vpp", "chroma_hpp",
                "chroma_vpp"],
    "quant": ["quant", "dequant", "nquant", "denoise"],
    "intra": ["intra", "intrapred", "predc"],
    "deblock": ["deblock", "loopfilter"],
    "sao": ["sao"],
    "ssim/psnr": ["ssim", "psnr"],
    "pixel-util": ["pixelavg", "pixeladd", "scale1D", "scale2D", "down2",
                   "variance", "var", "satd_"],
}


def parse_fields():
    fields = {}
    text = open(os.path.join(X265, "common/primitives.h")).read()
    m = re.search(r"struct EncoderPrimitives\s*\{(.*?)\};", text, re.S)
    if not m:
        return fields
    for line in m.group(1).splitlines():
        mm = re.match(r"\s*[\w:<>,\s]+\s+(\w+)\s*(?:\[[^\]]*\])?\s*;", line)
        if mm:
            name = mm.group(1)
            if name not in ("x265_", "EncoderPrimitives"):
                fields[name] = line.strip()
    return fields


def registered_fields():
    reg = set()
    pat = re.compile(r"\bp\.(\w+)\b")
    for fn in os.listdir(AARCH64):
        if not fn.endswith((".cpp", ".h")):
            continue
        text = open(os.path.join(AARCH64, fn), errors="ignore").read()
        for m in pat.finditer(text):
            reg.add(m.group(1))
    return reg


def our_coverage():
    cov = {}
    for d in os.listdir(os.path.join(ROOT, "kernels")):
        if os.path.isdir(os.path.join(ROOT, "kernels", d)):
            cov[d] = True
    return cov


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--json", default="")
    args = ap.parse_args()
    fields = parse_fields()
    reg = registered_fields()
    cov = our_coverage()
    rows = []
    for name in sorted(fields):
        fam = next((f for f, kws in FAMILY_KEYWORDS.items()
                    if any(k in name for k in kws)), "other")
        has_aarch64 = name in reg
        fam_dirs = {
            "dct": {"dct16", "dct32", "dct8", "idct16", "idct32"},
            "sa8d/satd": {"sa8d", "sa8d16", "satd-4", "satd-8",
                          "satd-16", "satd-4x8", "satd-8x16",
                          "satd-8x32", "satd-16x32", "satd-16x64",
                          "satd-32x8", "satd-32x16", "satd-32x32",
                          "satd-32x64", "satd-64x16", "satd-64x32",
                          "satd-24x32",
                          "satd-48x64", "satd-64x48", "satd-64x64"},
            "sad": {"sad", "sad-32"},
            "interp8": {"interp8", "interp8-16", "interp8-32",
                        "interp8vpp-16", "interp8vpp-32",
                        "interp8-hps-8", "interp8-hps-8x8-ext", "interp8-hps-8x16",
                        "interp8-hps-8x16-ext", "interp8-hps-16x16-ext",
                        "interp8-hps-32x32-ext",
                        "interp8-hps-16x16", "interp8-hps-32x32",
                        "interp8-vps-16x16", "interp8-vps-32x32",
                        "interp8-vss-16x16", "interp8-vss-32x32",
                        "interp8-vsp-8x8", "interp8-vsp-8x16", "interp8-vsp-16x16",
                        "interp8-vsp-32x32", "interp8-vsp-16x32", "interp8-vsp-32x16"},
            "interp4": {"interp4", "interp4-8", "interp4-32",
                        "interp4vpp-16"},
            "quant": {"quant", "nquant", "dequant",
                      "dequant-scaling-gt", "dequant-scaling-le"},
            "sao": {"sao", "sao-b0", "sao-e1", "sao-e1-2rows",
                    "sao-e2", "sao-e3", "sao-stats-e0"},
            "ssim/psnr": {"ssim"},
            "pixel-util": {"scale1d", "scale2d"},
        }
        done = any(d in cov for d in fam_dirs.get(fam, set()))
        rows.append({"field": name, "family": fam,
                     "aarch64": has_aarch64, "covered": done})
    by_family = {}
    for r in rows:
        by_family.setdefault(r["family"], []).append(r)
    print("%-14s %5s %5s %6s" % ("family", "fields", "aa64", "ours"))
    for fam, rs in sorted(by_family.items()):
        print("%-14s %5d %5d %6d"
              % (fam, len(rs), sum(1 for r in rs if r["aarch64"]),
                 sum(1 for r in rs if r["covered"])))
    print()
    print("AArch64-registered fields NOT covered by our kernels:")
    todo = [r for r in rows if r["aarch64"] and not r["covered"]]
    for r in todo:
        print("  %-40s %s" % (r["field"], r["family"]))
    print("total todo:", len(todo))
    if args.json:
        json.dump(rows, open(args.json, "w"), indent=1)
        print("wrote", args.json)


if __name__ == "__main__":
    sys.exit(main())
