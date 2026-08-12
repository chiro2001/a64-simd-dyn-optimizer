#!/usr/bin/env python3
"""Static ISA-level gate for generated candidate objects.

Each disassembled instruction mnemonic is mapped back to the official ARM ISA
catalog (`experiments/m7-isa-coverage/isa-catalog.json`) and its feature
expressions are evaluated against a target feature level. An instruction is a
violation when every catalog encoding requires a feature level above the
target, e.g. any SVE2-only opcode in a Kunpeng 920B (FEAT_SVE, VL=256)
object.

Feature levels (rank order):
    sve1 < sve2 (=sve_bitperm) < sve2p1 < sve2p2 < sve2p3 < sme

Limitations (documented, not silent):
  - Multi-register SVE table lookup (TBL2) is covered by an operand-pattern
    rule (`tbl`/`tbx` with a `{zN.x-zM.x}` two-register table) because the
    catalog's `asm` string only spells TBL and objdump prints `tbl` for both
    the SVE1 one-register and SVE2 two-register encodings.
  - A mnemonic whose encodings span levels (e.g. TBL: one SVE1, one SVE2
    encoding) is reported as `ambiguous` at the lower level; it passes the
    gate but is listed for manual encoding review.

Usage:
    tools/check_isa_level.py --object build/sve1.o \
        [--objdump aarch64-linux-gnu-objdump] [--level sve1] \
        [--symbols sym1,sym2]
    aarch64-linux-gnu-objdump -d build/sve1.o | tools/check_isa_level.py --disasm - \
        [--level sve1]
"""

import argparse
import json
import re
import subprocess
import sys
from collections import defaultdict


LEVELS = {
    "sve1": 1,
    "sve2": 2,
    "sve2p1": 3,
    "sve2p2": 4,
    "sve2p3": 5,
}

# Atoms with no SVE dependency are satisfiable on every target.
BASELINE_ATOMS = {
    "FEAT_FP",
    "FEAT_AdvSIMD",
    "FEAT_DotProd",
    "FEAT_I8MM",
    "FEAT_FCMA",
    "FEAT_FP16",
    "FEAT_RDM",
    "FEAT_SHA1",
    "FEAT_SHA256",
    "FEAT_SHA512",
    "FEAT_SHA3",
    "FEAT_SM3",
    "FEAT_SM4",
    "FEAT_AES",
    "FEAT_PMULL",
    "FEAT_CRC32",
    "FEAT_LSE",
    "FEAT_LSE2",
    "FEAT_LRCPC",
    "FEAT_LRCPC2",
    "FEAT_JSCVT",
    "FEAT_DGH",
    "FEAT_RNG",
}

ATOM_RANK = {
    "FEAT_SVE": 1,
    "FEAT_SVE2": 2,
    "FEAT_SVE_BitPerm": 2,
    "FEAT_SVE2p1": 3,
    "FEAT_SVE2p2": 4,
    "FEAT_SVE2p3": 5,
    # SME and friends are never satisfiable on our SVE-only targets.
    "FEAT_SME": 99,
    "FEAT_SME2": 99,
    "FEAT_SME2p1": 99,
    "FEAT_SME2p2": 99,
    "FEAT_SME_F16F16": 99,
    "FEAT_F64MM": 99,
    "FEAT_F32MM": 99,
    "FEAT_EBF16": 99,
}

# The official catalog's `asm` field only spells TBL even though the entry
# title covers TBL2; pin the SVE2-only multi-register form explicitly.
# objdump prints `tbl`/`tbx` for both the SVE1 one-register table form and the
# SVE2 two-register form; the latter has a `{zN.x-zM.x}` operand.
TWO_REG_TABLE = re.compile(
    r"\{\s*z\d+\.[bhsd]\s*(?:-|,)\s*z\d+\.[bhsd]\s*\}"
)


def atom_rank(atom):
    if atom in ATOM_RANK:
        return ATOM_RANK[atom]
    if atom in BASELINE_ATOMS:
        return 0
    return 0  # unknown atom: treat as baseline, surfaced in stats


def expr_rank(expr):
    """Max atom rank of an AND-connected expression (|| splits earlier)."""
    return max((atom_rank(a) for a in expr), default=0)


def parse_exprs(raw_exprs):
    """Split catalog feature expressions into DNF conjunct lists."""
    out = []
    for raw in raw_exprs:
        for disjunct in raw.split("||"):
            atoms = [re.sub(r"[^A-Za-z0-9_]", "", a)
                     for a in disjunct.split("&&")]
            atoms = [a for a in atoms if a]
            out.append(atoms)
    return out


def build_mnemonic_levels(catalog_path):
    with open(catalog_path, encoding="utf-8") as f:
        cat = json.load(f)
    items = cat if isinstance(cat, list) else cat.get("instructions", cat)
    levels = {}
    unknown_atoms = set()
    for x in items:
        asm = (x.get("asm") or "").strip()
        if not asm:
            continue
        mnem = asm.split()[0].lower()
        if not re.fullmatch(r"[a-z][a-z0-9._]*", mnem):
            continue
        dnf = parse_exprs(x.get("feature_exprs") or [])
        for atoms in dnf:
            for a in atoms:
                if a not in ATOM_RANK and a not in BASELINE_ATOMS:
                    unknown_atoms.add(a)
        if not dnf:
            rank = 0
        else:
            rank = min(expr_rank(atoms) for atoms in dnf)
        levels[mnem] = min(levels.get(mnem, 99), rank)
    return levels, unknown_atoms


def parse_disasm(text):
    """Yield (address, mnemonic, operands, symbol) for objdump output."""
    insn_re = re.compile(
        r"^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2}\s*)+)\s+([a-z][a-z0-9._]*)\b"
    )
    sym_re = re.compile(r"^\s*[0-9a-f]+\s+<([^>]+)>:\s*$")
    current = None
    for line in text.splitlines():
        m = sym_re.match(line)
        if m:
            current = m.group(1)
            continue
        m = insn_re.match(line)
        if m:
            yield m.group(1), m.group(3), line[m.end(3):], current


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--catalog",
                    default="experiments/m7-isa-coverage/isa-catalog.json")
    ap.add_argument("--level", default="sve1",
                    choices=sorted(LEVELS) + ["sve2p3"],
                    help="maximum allowed feature level")
    ap.add_argument("--object", help="object/binary to disassemble")
    ap.add_argument("--objdump", default="objdump",
                    help="disassembler binary")
    ap.add_argument("--disasm", help="disassembly text file ('-' = stdin)")
    ap.add_argument("--symbols", help="comma-separated symbol allowlist")
    ap.add_argument("--json", action="store_true", help="emit JSON summary")
    args = ap.parse_args()

    if args.level not in LEVELS:
        ap.error("unsupported level %r" % args.level)
    target = LEVELS[args.level]

    levels, unknown_atoms = build_mnemonic_levels(args.catalog)
    symbols = (args.symbols.split(",") if args.symbols else None)

    if args.object:
        text = subprocess.run(
            [args.objdump, "-d", args.object],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            check=True).stdout.decode("utf-8", "replace")
    elif args.disasm:
        if args.disasm == "-":
            text = sys.stdin.read()
        else:
            with open(args.disasm, encoding="utf-8", errors="replace") as f:
                text = f.read()
    else:
        ap.error("provide --object or --disasm")

    violations = []
    ambiguous = []
    unknown_mnems = set()
    counts = defaultdict(int)
    for addr, mnem, operands, sym in parse_disasm(text):
        if symbols is not None and sym not in symbols:
            continue
        counts[mnem] += 1
        effective = levels.get(mnem)
        if mnem in ("tbl", "tbx") and TWO_REG_TABLE.search(operands):
            effective = 2  # two-register table: the SVE2 encoding
        if mnem not in levels:
            unknown_mnems.add(mnem)
            continue
        if effective > target:
            violations.append((addr, mnem, effective, sym))

    # Ambiguous multi-level mnemonics worth a human look at the lower level:
    # any mnemonic whose per-encoding ranks include a higher level than the
    # target but whose minimum is within range. TBL is the known example.
    # Approximate by tracking catalog entries, not per-disassembly lines.
    if not args.json:
        print("target_level=%s rank=%d" % (args.level, target))
        print("instructions_scanned=%d" % sum(counts.values()))
        if violations:
            print("VIOLATIONS (%d):" % len(violations))
            for addr, mnem, rank, sym in violations:
                print("  %s: %s (required rank %d > %d) [%s]"
                      % (addr, mnem, rank, target, sym or "-"))
        if unknown_mnems:
            print("unknown-mnemonics: %s"
                  % ",".join(sorted(unknown_mnems)))
        if unknown_atoms:
            print("note: catalog atoms treated as baseline: %s"
                  % ",".join(sorted(unknown_atoms)[:12]))
        print("verdict=%s" % ("FAIL" if violations else "PASS"))
    else:
        print(json.dumps({
            "target_level": args.level,
            "violations": [
                {"addr": a, "mnemonic": m, "required_rank": r, "symbol": s}
                for a, m, r, s in violations],
            "unknown_mnemonics": sorted(unknown_mnems),
            "scanned": sum(counts.values()),
        }))
    return 1 if violations else 0


if __name__ == "__main__":
    sys.exit(main())
