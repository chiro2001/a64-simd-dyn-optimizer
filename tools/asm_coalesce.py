#!/usr/bin/env python3
"""Conservative SVE register copy propagation on generated .S files.

The compiler often emits `mov zX.d, zY.d` just to route a value into the
register the next op expects. When zX is defined only by that move and all
its uses occur before zY is redefined, the pass substitutes zX -> zY and
deletes the move. It is conservative: stops at branches, handles only
full-width `mov z.d, z.d`, and treats any z in the first operand of a
non-mov vector op as a definition. Every candidate built from the result
still must pass the upstream differential.

Usage:
  python3 tools/asm_coalesce.py in.S out.S
"""

import re
import sys


INS = re.compile(r"^\s*([a-z0-9.]+)(?:\s+(.*))?$")
ZRE = re.compile(r"\bz(\d+)(?:\.\S+)?")


def parse(lines):
    out = []
    for line in lines:
        m = INS.match(line.strip())
        if not m:
            out.append((line, None, "", [], False, None, None))
            continue
        mn = m.group(1)
        ops = (m.group(2) or "").strip()
        if line.strip().startswith((".", "//", "#")):
            out.append((line, None, "", [], False, None, None))
            continue
        zs = [int(x) for x in ZRE.findall(ops)]
        if "{" in ops:
            zs = []   # register lists: keep conservatively untouched
        src = dst = None
        if mn.startswith("mov") and not mn.startswith("movprfx"):
            parts = [p.strip() for p in ops.split(",")]
            if len(parts) >= 2:
                md = re.match(r"z(\d+)(?:\.d)?$", parts[0])
                ms = re.match(r"z(\d+)(?:\.d)?$", parts[1])
                if md and ms:
                    dst, src = int(md.group(1)), int(ms.group(1))
        is_br = mn in ("b", "bl", "br", "blr", "ret", "cbz", "cbnz",
                       "tbz", "tbnz") or mn.startswith("b.")
        out.append((line, mn, ops, zs, is_br, src, dst))
    return out


def coalesce(lines):
    ins = parse(lines)
    rewritten = {}
    def_pos = {}
    for i, (_, mn, _, zs, _, src, dst) in enumerate(ins):
        if mn is None:
            continue
        d = dst if dst is not None else (zs[0] if zs else None)
        if d is not None:
            def_pos.setdefault(d, []).append(i)

    for i, (_, mn, ops, zs, is_br, src, dst) in enumerate(ins):
        if dst is None or src is None:
            continue
        if any(p < i for p in def_pos.get(dst, [])):
            continue
        nxt = [p for p in def_pos.get(src, []) if p > i]
        limit = nxt[0] if nxt else len(ins)
        substituted = False
        ok = True
        for j in range(i + 1, limit):
            _, mj, oj, zj, bj, _, _ = ins[j]
            if mj is None:
                continue
            if bj:
                ok = False
                break
            if dst in zj:
                newops = re.sub(r"\bz%d\b" % dst, "z%d" % src, oj)
                stripped = ins[j][0].strip()
                indent = ins[j][0][:len(ins[j][0]) - len(ins[j][0].lstrip())]
                # rebuild "mnemonic operands" keeping register suffixes
                rewritten[j] = indent + mj + " " + newops + "\n"
                substituted = True
        if not ok:
            continue
        if substituted:
            rewritten[i] = None
    out = []
    changed = False
    for i, line in enumerate(lines):
        if i in rewritten:
            if rewritten[i] is None:
                changed = True
                continue
            changed = True
            out.append(rewritten[i])
        else:
            out.append(line)
    return out, changed


def main():
    src, dst = sys.argv[1], sys.argv[2]
    lines = open(src).read().splitlines(True)
    for _ in range(8):
        lines, changed = coalesce(lines)
        if not changed:
            break
    with open(dst, "w") as f:
        f.writelines(lines)
    print("coalesced %s -> %s" % (src, dst))
    return 0


if __name__ == "__main__":
    sys.exit(main())
