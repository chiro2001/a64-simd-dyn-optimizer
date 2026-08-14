"""Structured LoopIR recovered from a flat QEMU dynamic trace (docs/15).

Step 5 of the flat-trace -> structured-kernel pipeline: package the loop
recovery output (back edges, trip counts, nesting) with induction-variable
and memory-pattern analysis into a reusable IR that a future emitter can
consume to regenerate a kernel with real control flow.

Usage (CLI: tools/loop_ir.py):
  python3 tools/loop_ir.py --trace-log <log> --start <hex> --end <hex>
      [--json out.json] [--full]     # --full includes instruction bodies
"""

import json
from dataclasses import dataclass, field, asdict


@dataclass
class Instruction:
    addr: int
    mn: str
    ops: str


@dataclass
class IndVar:
    reg: str
    op: str
    step: int


@dataclass
class MemPattern:
    base: str
    kind: str
    offsets: list = field(default_factory=list)
    count: int = 0


@dataclass
class LoopIR:
    branch: int
    branch_mn: str
    trip: int
    period: int
    depth: int
    start: int
    end: int
    induction: list = field(default_factory=list)      # IndVar
    mem: list = field(default_factory=list)            # MemPattern
    body: list = field(default_factory=list)           # Instruction

    def to_dict(self, include_body=False):
        d = {
            "branch": hex(self.branch),
            "branch_mn": self.branch_mn,
            "trip": self.trip,
            "period": self.period,
            "depth": self.depth,
            "start": self.start,
            "end": self.end,
            "induction": [asdict(i) for i in self.induction],
            "mem": [asdict(m) for m in self.mem],
        }
        if include_body:
            d["body"] = [{"addr": hex(i.addr), "mn": i.mn, "ops": i.ops}
                         for i in self.body]
        return d


def recover_trace(trace_log, start, end):
    """Parse a QEMU exec+in_asm log into a list of LoopIR."""
    import os
    import sys

    sys.path.insert(0, os.path.dirname(os.path.dirname(
        os.path.dirname(os.path.abspath(__file__)))))
    from parse_qemu_trace import parse_exec
    from recover_loops import analyze_loops, detect_loops

    insns = parse_exec(trace_log, int(start, 16), int(end, 16))
    loops = detect_loops(insns)
    analysis = analyze_loops(insns, loops)
    out = []
    for l, a in zip(loops, analysis):
        out.append(LoopIR(
            branch=l["branch"], branch_mn=l["mn"], trip=l["trip"],
            period=l["period"], depth=l["depth"], start=l["start"],
            end=l["end"],
            induction=[IndVar(**i) for i in a["induction"]],
            mem=[MemPattern(base=k, kind=v["kind"], offsets=v["offsets"],
                            count=v["count"]) for k, v in a["mem"].items()],
            body=[Instruction(addr=n["addr"], mn=n["mn"], ops=n["ops"])
                  for n in insns[l["start"]:l["end"]]],
        ))
    return out, len(insns)


def to_json(loops, total_insns, include_body=False):
    return {
        "total_insns": total_insns,
        "loops": [l.to_dict(include_body=include_body) for l in loops],
    }
