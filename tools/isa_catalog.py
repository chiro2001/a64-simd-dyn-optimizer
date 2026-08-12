#!/usr/bin/env python3
"""Extract a machine-readable instruction catalog from the official ARM A64
ISA XML distribution.

Usage:
    python3 tools/isa_catalog.py --isa-dir /path/to/ISA_A64_xml_A_profile-YYYY-MM \
        --out experiments/m7-isa-coverage/isa-catalog.json

The parser keeps every <instructionsection> from the XML package and records:
  - official instruction id / title / mnemonic
  - instr-class (advsimd / sve / sve2 / ...)
  - iclass names (NEON, SVE, SVE2, ...)
  - feature expressions from <arch_variant feature="...">
  - number of encodings and the first assembly template

It then evaluates each feature expression against the project's current
TargetFeatures model and reports the minimum feature level that makes the
instruction available, or marks it as needing other (out-of-model) features.
"""

import argparse
import json
import re
import sys
from pathlib import Path
import xml.etree.ElementTree as ET


# Feature levels, in dependency order. An instruction is assigned the first
# level whose feature set satisfies at least one of its feature expressions.
# This mirrors optimizer/targets/aarch64/features.py.
FEATURE_LEVELS = [
    ("neon",        {"neon": True}),
    ("dotprod",     {"neon": True, "dotprod": True}),
    ("i8mm",        {"neon": True, "dotprod": True, "i8mm": True}),
    ("sve",         {"neon": True, "sve": True}),
    ("sve_i8mm",    {"neon": True, "dotprod": True, "i8mm": True,
                     "sve": True}),
    ("sve2",        {"neon": True, "sve": True, "sve2": True}),
    ("sve2p1",      {"neon": True, "sve": True, "sve2": True, "sve2p1": True}),
    ("sve2p2",      {"neon": True, "sve": True, "sve2": True, "sve2p1": True,
                     "sve2p2": True}),
    ("sve2p3",      {"neon": True, "sve": True, "sve2": True, "sve2p1": True,
                     "sve2p2": True, "sve2p3": True}),
    ("sve2_bitperm", {"neon": True, "sve": True, "sve2": True,
                      "sve2_bitperm": True}),
]

# Features already represented in TargetFeatures (mapped from FEAT_* names).
KNOWN_FEATURES = {
    "FEAT_AdvSIMD": "neon",
    "FEAT_DotProd": "dotprod",
    "FEAT_I8MM": "i8mm",
    "FEAT_SVE": "sve",
    "FEAT_SVE2": "sve2",
    "FEAT_SVE2p1": "sve2p1",
    "FEAT_SVE2p2": "sve2p2",
    "FEAT_SVE2p3": "sve2p3",
    "FEAT_SVE_BitPerm": "sve2_bitperm",
}


_TOKEN_RE = re.compile(r"FEAT_[A-Za-z0-9_]+|[&|()]")


class FeatureExpr:
    """Small boolean expression over FEAT_* atoms."""

    def __init__(self, text):
        self.text = text
        self.ast = self._parse(list(_TOKEN_RE.findall(text)))

    def _parse(self, tokens):
        pos = 0

        def parse_or():
            nonlocal pos
            left = parse_and()
            while pos < len(tokens) and tokens[pos] == "|":
                pos += 1  # consume '|', next '|' handled by lexer as one token
                pos += 1
                right = parse_and()
                left = ("or", left, right)
            return left

        def parse_and():
            nonlocal pos
            left = parse_atom()
            while pos < len(tokens) and tokens[pos] == "&":
                pos += 1
                pos += 1
                right = parse_atom()
                left = ("and", left, right)
            return left

        def parse_atom():
            nonlocal pos
            if pos >= len(tokens):
                raise ValueError(f"unexpected end in {self.text!r}")
            tok = tokens[pos]
            if tok == "(":
                pos += 1
                node = parse_or()
                if pos >= len(tokens) or tokens[pos] != ")":
                    raise ValueError(f"missing ')' in {self.text!r}")
                pos += 1
                return node
            if tok.startswith("FEAT_"):
                pos += 1
                return ("feat", tok)
            raise ValueError(f"unexpected token {tok!r} in {self.text!r}")

        node = parse_or()
        if pos != len(tokens):
            raise ValueError(f"trailing tokens in {self.text!r}: {tokens[pos:]}")
        return node

    def eval(self, enabled_features):
        def ev(node):
            kind = node[0]
            if kind == "feat":
                return enabled_features.get(node[1], False)
            if kind == "and":
                return ev(node[1]) and ev(node[2])
            if kind == "or":
                return ev(node[1]) or ev(node[2])
            raise AssertionError(kind)

        return ev(self.ast)

    def features(self):
        return sorted({t for t in _TOKEN_RE.findall(self.text)
                       if t.startswith("FEAT_")})


def parse_instruction(path):
    tree = ET.parse(path)
    root = tree.getroot()
    if root.tag != "instructionsection":
        return None

    docvars = {}
    dv = root.find("docvars")
    if dv is not None:
        for var in dv.findall("docvar"):
            docvars[var.get("key")] = var.get("value")

    iclasses = []
    iclass_docvars = {}
    feature_exprs = []
    encodings = 0
    asm = None
    predicated = None
    for elem in root.iter():
        if elem.tag == "iclass":
            iclasses.append(elem.get("name"))
            icv = elem.find("docvars")
            if icv is not None and "instr-class" not in iclass_docvars:
                for var in icv.findall("docvar"):
                    iclass_docvars.setdefault(var.get("key"), var.get("value"))
        elif elem.tag == "arch_variant":
            feat = elem.get("feature")
            if feat and feat not in feature_exprs:
                feature_exprs.append(feat)
        elif elem.tag == "encoding":
            encodings += 1
        elif elem.tag == "asmtemplate" and asm is None:
            asm = "".join(elem.itertext()).strip()
        elif elem.tag == "predicated" and predicated is None:
            predicated = (elem.text or "").strip()

    return {
        "id": root.get("id"),
        "title": root.get("title"),
        "mnemonic": docvars.get("mnemonic"),
        "instr_class": docvars.get("instr-class")
                       or iclass_docvars.get("instr-class"),
        "iclasses": sorted(set(iclasses)),
        "feature_exprs": feature_exprs,
        "encodings": encodings,
        "asm": asm,
        "predicated": predicated,
    }


def evaluate(insn, enabled):
    """True if any feature expression is satisfied by `enabled`."""
    if not insn["feature_exprs"]:
        # Some instruction files carry no arch_variant at all; treat as unknown.
        return False, set()
    for text in insn["feature_exprs"]:
        expr = FeatureExpr(text)
        mapped = {f: enabled.get(KNOWN_FEATURES.get(f, f), False)
                  for f in expr.features()}
        if expr.eval(mapped):
            return True, set(expr.features())
    return False, set()


def classify(insn):
    """Return (level, unknown_features) for the instruction."""
    for level, enabled in FEATURE_LEVELS:
        ok, feats = evaluate(insn, enabled)
        if ok:
            return level, []
    # Not satisfiable by the current model: collect every FEAT_* referenced.
    unknown = set()
    for text in insn["feature_exprs"]:
        unknown.update(FeatureExpr(text).features())
    return "needs-other-features", sorted(unknown)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--isa-dir", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    isa_dir = Path(args.isa_dir)
    rows = []
    skipped = 0
    for path in sorted(isa_dir.glob("*.xml")):
        if path.name in ("encodingindex.xml", "shared_pseudocode.xml"):
            continue
        try:
            insn = parse_instruction(path)
        except ET.ParseError as exc:
            print(f"parse error {path.name}: {exc}", file=sys.stderr)
            skipped += 1
            continue
        if insn is None:
            continue
        level, unknown = classify(insn)
        insn["feature_level"] = level
        insn["unknown_features"] = unknown
        rows.append(insn)

    rows.sort(key=lambda r: (r["feature_level"], r["instr_class"] or "",
                             r["mnemonic"] or "", r["id"] or ""))
    out = {
        "source": "ISA_A64_xml_A_profile-2025-12",
        "schema_version": 1,
        "feature_levels": [name for name, _ in FEATURE_LEVELS],
        "count": len(rows),
        "skipped_parse_errors": skipped,
        "instructions": rows,
    }
    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    Path(args.out).write_text(json.dumps(out, indent=1))
    print(f"parsed {len(rows)} instructions -> {args.out} "
          f"(parse errors: {skipped})")


if __name__ == "__main__":
    main()
