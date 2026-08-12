"""Value-range / bit-width analysis over MachineIR (range-aware IR core).

The upstream dct8 bug was only found via a 200k-case differential: pass 2
computed O = coef[k] - coef[7-k] in s16 while the true range is [-65280,
65280]. This pass propagates integer value ranges forward through the
MachineIR and flags every operation whose computed range cannot be
represented by its storage type. On the dct8 seed it must flag exactly the
eight pass-2 O subtractions.

Intervals are computed with exact integer arithmetic (Python ints); no
wrapping is modeled, which is the point: a range outside the type width is an
overflow risk by construction.
"""

import re


class ValueRange:
    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi):
        self.lo = lo
        self.hi = hi

    def __repr__(self):
        return "[%d, %d]" % (self.lo, self.hi)


def _type_bits(t):
    m = re.match(r"<(\d+) x i(\d+)>", t or "")
    if m:
        return int(m.group(2))
    m = re.match(r"i(\d+)", t or "")
    if m:
        return int(m.group(1))
    return None


def _add(a, b):
    return ValueRange(a.lo + b.lo, a.hi + b.hi)


def _sub(a, b):
    return ValueRange(a.lo - b.hi, a.hi - b.lo)


def _mul(a, b):
    if isinstance(b, int):
        lo, hi = a.lo * b, a.hi * b
        return ValueRange(min(lo, hi), max(lo, hi))
    corners = (a.lo * b.lo, a.lo * b.hi, a.hi * b.lo, a.hi * b.hi)
    return ValueRange(min(corners), max(corners))


def _shl(a, amt):
    f = 1 << amt
    return ValueRange(a.lo * f, a.hi * f)


def _rsh(a, shift):
    r = 1 << (shift - 1)
    # arithmetic shift (floor), matching rshrn rounding semantics
    return ValueRange((a.lo + r) >> shift, (a.hi + r) >> shift)


def analyze(ir, input_range=(-255, 255), constants=None):
    """Return (ranges_by_dst, overflow_risks).

    constants maps a global name (the importer's `const_name`) to a flat list
    of int16 values; a load with `const_off` (bytes) resolves to the four
    elements starting there, giving the exact per-lane value range.
    """
    ranges = {}
    risks = []
    bydst = {}
    for n in ir.nodes:
        if n.get("dst") is not None:
            bydst[n["dst"]] = n

    def rng(ref):
        if ref in ranges:
            return ranges[ref]
        if ref.startswith("%"):
            raise ValueError("value %s used before defined" % ref)
        raise ValueError("unknown operand %r" % ref)

    for n in ir.nodes:
        op = n["op"]
        dst = n.get("dst")
        if dst is None:
            continue
        if op in ("addr", "store", "ret"):
            continue
        t = n.get("type")
        if t and "<" not in t:
            # scalar GPR address math: unknown but never s16-relevant
            ranges[dst] = ValueRange(0, (1 << 63) - 1)
            continue
        if op == "load":
            if n.get("const_name") and constants \
                    and n["const_name"] in constants:
                base = n["const_off"] // 2
                vals = constants[n["const_name"]][base:base + 4]
                r = ValueRange(min(vals), max(vals))
            else:
                r = ValueRange(*input_range)
        elif op == "sext":
            r = rng(n["src"][0] if isinstance(n["src"], list)
                    else n["src"])
        elif op == "add":
            a = rng(n["src"][0])
            if len(n["src"]) == 2:
                r = _add(a, rng(n["src"][1]))
            else:
                r = _add(a, ValueRange(n.get("const", 0),
                                       n.get("const", 0)))
        elif op == "sub":
            a = rng(n["src"][0])
            if len(n["src"]) == 2:
                r = _sub(a, rng(n["src"][1]))
            else:
                c = n.get("const", 0)
                r = _sub(a, ValueRange(c, c))
        elif op == "mul":
            a = rng(n["src"][0])
            if "const_vec" in n:
                cv = n["const_vec"]
                r = _mul(a, ValueRange(min(cv), max(cv)))
            elif n.get("const") is not None:
                r = _mul(a, n["const"])
            else:
                r = _mul(a, rng(n["src"][1]))
        elif op == "shl":
            r = _shl(rng(n["src"][0]), n["amt"])
        elif op == "shuffle":
            r = rng(n["src"][0])
        elif op == "intrinsic":
            name = n["intrinsic"]
            refs = [a["ref"] for a in n.get("args", []) if "ref" in a]
            if name == "rshrn":
                r = _rsh(rng(refs[0]), next(
                    a["imm"] for a in n["args"] if "imm" in a))
            elif name == "smull":
                r = _mul(rng(refs[0]), rng(refs[1]))
            elif name == "addp":
                a = rng(refs[0])
                r = ValueRange(2 * a.lo, 2 * a.hi)
            else:
                raise ValueError("range analysis: unknown intrinsic %r"
                                 % name)
        else:
            raise ValueError("range analysis: unsupported op %r" % op)
        ranges[dst] = r
        bits = _type_bits(n.get("type"))
        if bits and (r.lo < -(1 << (bits - 1)) or r.hi >= (1 << (bits - 1))):
            risks.append({
                "id": n["id"],
                "dst": dst,
                "op": op,
                "type": n.get("type"),
                "bits": bits,
                "range": [r.lo, r.hi],
            })
    return ranges, risks
