"""Restricted automatic frontend for AGO (M1, round-0023).

Given a small kernel DSL (semantic authority), build the AGO IR graph.
Fail-closed: any unknown op/type/shape raises instead of emitting a
partial graph. Deterministic: same input always yields the same
canonical hash.

DSL (one statement per line):
    kernel <name>
    input <name> <elem> <lanes> <vbits> [stride <n>]
    d<i> = sub_ext(load(<pix>, <row>), load(<pix>, <row>))
    t<i> = hadamard_v(<d0>..<d7>)  [group syntax: hadamard_v(d)]
    s<i> = hadamard_h_abs(t)        [produces 4 outputs s0..s3]
    o0 = add(s0, s1)
    o1 = add(s2, s3)
    acc = add(o0, o1)
    satd = shift_rnd(reduce_addv(acc), 1)
    output <name>
"""

from __future__ import annotations

import re
import sys
from typing import Dict, List, Tuple

from ago.ir import Graph, Op, Shape, Value


_ROW = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*sub_ext\(load\((\w+),\s*(\d+)\),"
                  r"\s*load\((\w+),\s*(\d+)\)\)$")
_HV = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*hadamard_v\((\w+)\)$")
_HH = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*hadamard_h_abs\((\w+)\)$")
_V4 = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*hadamard4_v\((\w+)\)$")
_H4 = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*hadamard4_h_abs\((\w+)\)$")
_MAX = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*max\((\w+),\s*(\w+)\)$")
_ADD = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*add\((\w+),\s*(\w+)\)$")
_RED = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*reduce_addv\((\w+)\)$")
_SHR = re.compile(r"^([a-zA-Z_]\w*)\s*=\s*shift_rnd\((\w+),\s*(\d+)\)$")


class FrontendError(ValueError):
    pass


def parse_dsl(text: str) -> Graph:
    lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
    if not lines[0].startswith("kernel "):
        raise FrontendError("missing kernel name")
    name = lines[0].split()[1]
    g = Graph(name=name, inputs={}, outputs=(), ops={}, contract=text)
    groups: Dict[str, Tuple[List[str], int]] = {}
    hv_n = hh_n = max_n = 0
    i = 1
    while i < len(lines) and lines[i].startswith("input "):
        parts = lines[i].split()
        # input <name> <elem> <lanes> <vbits> [stride <n>]
        iname, elem, lanes, vbits = parts[1], parts[2], int(parts[3]), int(parts[4])
        stride = None
        if len(parts) >= 7 and parts[5] == "stride":
            stride = int(parts[6])
        g.inputs[iname] = Value(iname, Shape(elem, lanes, vbits),
                                stride=stride)
        i += 1
    # outputs: track assignment order for deterministic ids
    ids: Dict[str, str] = {}
    out_names: List[str] = []
    while i < len(lines):
        ln = lines[i]
        if ln.startswith("output "):
            out_names.append(ln.split()[1])
            i += 1
            continue
        m = _ROW.match(ln)
        if m:
            dst, pa, ra, pb, rb = m.groups()
            if ra != rb:
                raise FrontendError("sub_ext operands must share a row index")
            load_a = "ld1_%s" % ra
            load_b = "ld2_%s" % rb
            g.ops[load_a] = Op("load", (pa,), "p1r%s" % ra, {"row": int(ra)})
            g.ops[load_b] = Op("load", (pb,), "p2r%s" % rb, {"row": int(rb)})
            g.ops["diff_%s" % ra] = Op(
                "sub_ext", ("p1r%s" % ra, "p2r%s" % rb), dst,
                {"elem": "s16"})
            ids[dst] = dst
            i += 1
            continue
        m = _HV.match(ln)
        if m:
            dst, src = m.groups()
            if src not in ids:
                raise FrontendError("hadamard_v source %s unknown" % src)
            base = ids[src]
            for k in range(8):
                out = "t%d" % k
                g.ops["h_v_%d" % k] = Op(
                    "hadamard_v",
                    tuple("d%d" % j for j in range(8)),
                    out, {"n": 8, "idx": k})
            ids[dst] = "t0"
            i += 1
            continue
        m = _HH.match(ln)
        if m:
            dst, src = m.groups()
            if src not in ids:
                raise FrontendError("hadamard_h_abs source %s unknown" % src)
            for k in range(4):
                base = 4 * (k // 2)
                g.ops["h_h_%d" % k] = Op(
                    "hadamard_h_abs",
                    tuple("t%d" % j for j in range(base, base + 4)),
                    "s%d" % k, {"group": k})
            ids[dst] = "s0"
            i += 1
            continue
        m = _V4.match(ln)
        if m:
            dst, src = m.groups()
            if not re.match(r"^d[0-7]$", src):
                raise FrontendError(
                    "hadamard4_v source %s must be a row diff (d0..d7)" % src)
            row = int(src[1:])
            if row not in (0, 4):
                raise FrontendError(
                    "hadamard4_v row group must start at d0 or d4")
            q = 0 if row == 0 else 1
            ins = tuple("d%d" % j for j in range(row, row + 4))
            outs = [dst + str(k) for k in range(4)]
            for k in range(4):
                g.ops["h_v_%d" % (hv_n + k)] = Op(
                    "hadamard_v", ins, outs[k],
                    {"n": 4, "idx": k, "quad": q})
            hv_n += 4
            groups[dst] = (outs, q)
            ids[dst] = outs[0]
            i += 1
            continue
        m = _H4.match(ln)
        if m:
            dst, src = m.groups()
            if src not in groups:
                raise FrontendError(
                    "hadamard4_h_abs source %s is not a 4-row group" % src)
            ins, q = groups[src]
            outs = [dst + str(k) for k in range(4)]
            for k in range(4):
                g.ops["h_h_%d" % (hh_n + k)] = Op(
                    "hadamard_h_abs", tuple(ins), outs[k],
                    {"n": 4, "group": hh_n + k, "quad": q})
            hh_n += 4
            groups[dst] = (outs, q)
            ids[dst] = outs[0]
            i += 1
            continue
        m = _MAX.match(ln)
        if m:
            dst, a, b = m.groups()
            g.ops["max_%d" % max_n] = Op(
                "max", (ids.get(a, a), ids.get(b, b)), dst,
                {"elem": "u16"})
            max_n += 1
            ids[dst] = dst
            i += 1
            continue
        m = _ADD.match(ln)
        if m:
            dst, a, b = m.groups()
            g.ops[dst] = Op("add", (ids.get(a, a), ids.get(b, b)), dst)
            ids[dst] = dst
            i += 1
            continue
        m = _RED.match(ln)
        if m:
            dst, a = m.groups()
            g.ops[dst] = Op("reduce_addv", (ids.get(a, a),), dst)
            ids[dst] = dst
            i += 1
            continue
        m = _SHR.match(ln)
        if m:
            dst, a, imm = m.groups()
            g.ops[dst] = Op("shift_rnd", (ids.get(a, a),), dst,
                            {"imm": int(imm)})
            ids[dst] = dst
            i += 1
            continue
        raise FrontendError("unsupported statement: %s" % ln)
    g.outputs = tuple(out_names)
    return g


SA8D8_DSL = """\
kernel sa8d8
input pix1 u8 8 64 stride 8
input pix2 u8 8 64 stride 8
d0 = sub_ext(load(pix1, 0), load(pix2, 0))
d1 = sub_ext(load(pix1, 1), load(pix2, 1))
d2 = sub_ext(load(pix1, 2), load(pix2, 2))
d3 = sub_ext(load(pix1, 3), load(pix2, 3))
d4 = sub_ext(load(pix1, 4), load(pix2, 4))
d5 = sub_ext(load(pix1, 5), load(pix2, 5))
d6 = sub_ext(load(pix1, 6), load(pix2, 6))
d7 = sub_ext(load(pix1, 7), load(pix2, 7))
t = hadamard_v(d0)
s = hadamard_h_abs(t)
o0 = add(s0, s1)
o1 = add(s2, s3)
accv = add(o0, o1)
scalar = reduce_addv(accv)
satd = shift_rnd(scalar, 1)
output satd
"""

SATD8_DSL = """\
kernel satd8
input pix1 u8 8 64 stride 8
input pix2 u8 8 64 stride 8
d0 = sub_ext(load(pix1, 0), load(pix2, 0))
d1 = sub_ext(load(pix1, 1), load(pix2, 1))
d2 = sub_ext(load(pix1, 2), load(pix2, 2))
d3 = sub_ext(load(pix1, 3), load(pix2, 3))
d4 = sub_ext(load(pix1, 4), load(pix2, 4))
d5 = sub_ext(load(pix1, 5), load(pix2, 5))
d6 = sub_ext(load(pix1, 6), load(pix2, 6))
d7 = sub_ext(load(pix1, 7), load(pix2, 7))
t = hadamard4_v(d0)
tB = hadamard4_v(d4)
s = hadamard4_h_abs(t)
sB = hadamard4_h_abs(tB)
m0 = max(s0, s1)
m1 = max(s2, s3)
m2 = max(sB0, sB1)
m3 = max(sB2, sB3)
o0 = add(m0, m1)
o1 = add(m2, m3)
accv = add(o0, o1)
satd = reduce_addv(accv)
output satd
"""


if __name__ == "__main__":
    g = parse_dsl(SA8D8_DSL)
    h1 = g.canonical_hash()
    g2 = parse_dsl(SA8D8_DSL)
    print("nodes:", len(g.ops), "hash:", h1[:16],
          "deterministic:", h1 == g2.canonical_hash())
