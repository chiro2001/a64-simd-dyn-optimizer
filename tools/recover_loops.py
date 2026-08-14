#!/usr/bin/env python3
"""Recover loop structure from a flat QEMU dynamic trace.

The exec+in_asm trace is the flat dynamic stream of one kernel invocation:
loop iterations appear as repeated instruction-address runs. This pass
reconstructs loop bodies, trip counts and nesting from address repetition,
bridging the gap between the flat trace and the structured kernel we want
to emit (docs/15).

Usage:
  python3 tools/recover_loops.py <trace.json> [--json out.json]

Output: for each detected loop: period (body length in instructions), trip
count, body address range, nesting depth, plus induction-variable and
memory-access pattern analysis (docs/15 step 4). Straight-line (non-loop)
code is the remaining sequence.
"""

import argparse
import json
import os
import sys


def detect_loops(insns):
    """Return loops found via backward branches, merged by body signature.

    A backward branch (b/b.eq/b.ne/tbz/tbnz/cbz/cbnz to a smaller address)
    closes a loop: the body runs from the branch target to the branch. Trip
    count = occurrences of the target address. Overlapping bodies with the
    same address signature are merged into one loop record.
    """
    import re

    seq = [n["addr"] for n in insns]
    pos_of = {}
    for i, a in enumerate(seq):
        pos_of.setdefault(a, []).append(i)

    BRANCH = re.compile(r"^(b|b\.eq|b\.ne|b\.any|b\.none|b\.lo|b\.hs|"
                        r"cbz|cbnz|tbz|tbnz)")
    TARGET = re.compile(r"#?0x([0-9a-f]+)")

    loops = []
    for i, n in enumerate(insns):
        m = BRANCH.match(n["mn"])
        if not m:
            continue
        t = TARGET.search(n["ops"])
        if not t:
            continue
        target = int(t.group(1), 16)
        if target >= n["addr"]:
            continue  # forward branch, not a loop back edge
        occ = pos_of.get(target)
        if not occ:
            continue
        # first occurrence of target at or before this branch
        starts = [p for p in occ if p < i]
        if not starts:
            continue
        start = starts[-1]          # iteration start (this branch's target)
        body = seq[start:i + 1]
        period = i + 1 - start
        trip = len([p for p in occ if p <= i])
        loops.append({
            "branch": n["addr"],
            "mn": n["mn"],
            "period": period,
            "trip": trip,
            "start": start,
            "end": i + 1,
            "depth": 0,
            "body": body,
        })

    # merge identical (branch, period, body) occurrences; keep max trip
    merged = []
    for l in loops:
        key = (l["branch"], l["period"], tuple(l["body"]))
        for m in merged:
            if (m["branch"], m["period"], tuple(m["body"])) == key:
                m["trip"] = max(m["trip"], l["trip"])
                break
        else:
            merged.append(l)
    # nesting depth
    for l in merged:
        inner = [o for o in merged
                 if o["start"] >= l["start"] and o["end"] <= l["end"]
                 and o is not l]
        l["depth"] = max((o["depth"] for o in inner), default=0) + 1
    merged.sort(key=lambda x: (x["start"], x["end"]))
    return merged


def analyze_loops(insns, loops):
    """Step 4 (prototype): per-loop induction variables and memory patterns.

    Induction: scalar add/sub with dst == src (e.g. `add x8, x8, #8`,
    `addvl x9, x9, #2`) -- the loop-carried counter. Memory: gather
    [base, #off] operands of ld/st instructions in the body, grouped by
    base register.
    """
    import re

    ADD = re.compile(
        r"^(?:add|sub|addvl|subvl|addv|subv)\s+([xw]\d+)\s*,\s*"
        r"([xw]\d+)\s*,\s*#(-?(?:0x[0-9a-f]+|\d+))")
    MEM = re.compile(r"\[([xw]\d+)(?:,\s*#(-?\d+))?\]")
    LD_ST = {"ldr", "str", "ldp", "stp", "ldur", "stur",
             "ld1b", "ld1h", "ld1w", "ld1d", "ld1ub", "ld1uh", "ld1uw",
             "st1b", "st1h", "st1w", "st1d", "ld1r"}

    out = []
    for l in loops:
        body = insns[l["start"]:l["end"]]
        ind = {}
        for n in body:
            m = ADD.match(n["mn"] + " " + n["ops"])
            if not m:
                continue
            dst, src, imm = m.group(1), m.group(2), int(m.group(3), 0)
            if dst != src:
                continue
            cur = ind.get(dst)
            if cur is None or abs(imm) > abs(cur["step"]):
                ind[dst] = {"reg": dst, "op": n["mn"], "step": imm}
        mem = {}
        for n in body:
            if n["mn"] not in LD_ST:
                continue
            for m in MEM.finditer(n["ops"]):
                base = m.group(1)
                off = int(m.group(2)) if m.group(2) else 0
                e = mem.setdefault(base, {"kind": n["mn"], "offsets": set(),
                                          "count": 0})
                e["offsets"].add(off)
                e["count"] += 1
        out.append({
            "branch": hex(l["branch"]), "trip": l["trip"],
            "period": l["period"], "depth": l["depth"],
            "induction": sorted(ind.values(), key=lambda e: e["reg"]),
            "mem": {k: {"kind": v["kind"],
                        "offsets": sorted(v["offsets"]),
                        "count": v["count"]}
                    for k, v in sorted(mem.items())},
        })
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("trace_json", nargs="?",
                    help="trace instructions JSON (from parse_qemu_trace "
                         "--json); omit when using --trace-log")
    ap.add_argument("--trace-log", default=None,
                    help="QEMU exec+in_asm log (parse with --exec); requires "
                         "--start/--end")
    ap.add_argument("--start", default=None, help="symbol range start (hex)")
    ap.add_argument("--end", default=None, help="symbol range end (hex)")
    ap.add_argument("--json", dest="out_json", default=None)
    args = ap.parse_args()

    if args.trace_log:
        if not args.start or not args.end:
            print("--trace-log requires --start and --end", file=sys.stderr)
            return 2
        sys.path.insert(0, os.path.dirname(
            os.path.dirname(os.path.abspath(__file__))))
        from parse_qemu_trace import parse_exec
        insns = parse_exec(args.trace_log,
                           int(args.start, 16), int(args.end, 16))
    else:
        if not args.trace_json:
            print("need trace_json or --trace-log", file=sys.stderr)
            return 2
        d = json.load(open(args.trace_json))
        insns = d["instructions"]
    loops = detect_loops(insns)
    analysis = analyze_loops(insns, loops)

    total_loop = sum(l["period"] * l["trip"] for l in loops
                     if l["depth"] == 1)
    print("instructions=%d detected_loops=%d"
          % (len(insns), len(loops)))
    for l in loops:
        print("  backedge@0x%x %s trip=%d period=%d depth=%d "
              "body=[0x%x..0x%x]"
              % (l["branch"], l["mn"], l["trip"], l["period"], l["depth"],
                 insns[l["start"]]["addr"],
                 insns[l["end"] - 1]["addr"]))
    for a in analysis:
        inds = ",".join("%s%s%+d" % (i["op"], i["reg"], i["step"])
                        for i in a["induction"]) or "-"
        mems = ",".join("%s[%s]" % (m["kind"], k)
                        for k, m in a["mem"].items()) or "-"
        print("  analysis@0x%s: induction=%s mem=%s"
              % (a["branch"][2:], inds, mems))

    if args.out_json:
        json.dump({"instructions": len(insns), "loops": loops,
                   "analysis": analysis},
                  open(args.out_json, "w"), indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
