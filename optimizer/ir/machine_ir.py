"""MachineIR: target-aware instruction graph imported from LLVM IR / asm.

Each node records opcode, operand references, vector widths, shuffle masks,
and (later) lane semantics. This is the layer where instructions still exist;
PackIR is the abstraction that removes them.
"""

import json
import re
import sys

SCHEMA_VERSION = "0.1"


class MachineIR:
    def __init__(self, function=None, nodes=None, values=None):
        self.function = function
        self.nodes = nodes if nodes is not None else []
        self.values = values if values is not None else {}

    def add(self, node):
        node = dict(node)
        node["id"] = len(self.nodes)
        self.nodes.append(node)
        if "dst" in node:
            self.values[node["dst"]] = node["id"]
        return node

    def to_dict(self):
        return {
            "schema_version": SCHEMA_VERSION,
            "function": self.function,
            "nodes": self.nodes,
        }

    def to_json(self):
        return json.dumps(self.to_dict(), indent=2, sort_keys=True)


_INSN_RE = re.compile(
    r"^\s*%([A-Za-z0-9._]+)\s*=\s*(.*)$"
)


def _type_width(t):
    m = re.match(r"<(\d+) x (i\d+)>", t)
    if m:
        return int(m.group(1)), int(m.group(2)[1:])
    m = re.match(r"(i\d+)", t)
    if m:
        return 1, int(m.group(1)[1:])
    return None, None


def _parse_shuffle_mask(args):
    m = re.search(r"<(\d+) x i32>\s+(zeroinitializer|<(.+)>)", args)
    if not m:
        return None
    if m.group(2) == "zeroinitializer":
        return [0] * int(m.group(1))
    parts = [int(x.strip()) for x in m.group(3).replace("i32", "").split(",")]
    return parts


def _shuffle_result_type(args):
    """Result vector type of a shufflevector = the mask vector's type."""
    src = re.match(r"shufflevector\s+<(\d+) x (i\d+)>\s*%", args)
    if not src:
        return None
    elem = src.group(2)
    mask_lens = re.findall(r"<(\d+) x i32>", args)
    if not mask_lens:
        return None
    return "<%s x %s>" % (mask_lens[-1], elem)


def _parse_operands(args):
    """Return %name references in order."""
    return re.findall(r"%([A-Za-z0-9._]+)", args)


def _op_type(args):
    m = re.search(r"(<\d+ x i\d+>|i\d+)\s+%", args)
    return m.group(1) if m else None


def _parse_imm(text):
    """Parse an LLVM immediate: plain integer or `splat (i32 N)`."""
    text = text.strip()
    m = re.match(r"splat \(i\d+\s+(-?\d+)\)", text)
    if m:
        return int(m.group(1))
    return int(text)


def _parse_neon_intrinsic(rhs, dst):
    """Parse an llvm.aarch64.neon.* call line into an intrinsic node.
    Works for both assigned (`%x = tail call <...> @llvm...`) and void
    (`tail call void @llvm...`) forms (dst=None for the latter)."""
    name = re.search(r"@llvm\.aarch64\.neon\.([a-z0-9_]+)", rhs).group(1)
    t = re.sub(r"^\s*(?:tail\s+)?call\s+(?:noundef\s+)?", "",
               rhs.split("@llvm", 1)[0]).strip()
    if not (t.startswith("<") or t.startswith("{")):
        t = None
    ops = _parse_operands(rhs)
    args = []
    call_args = rhs.split("(", 1)[1].rsplit(")", 1)[0]
    # split on top-level commas (not inside <> vector constants)
    for a in re.split(r",(?![^<]*>)", call_args):
        a = a.strip()
        vm = re.match(r"<(\d+) x i(\d+)>\s*<(.+)>", a)
        if vm:
            vals = []
            for part in vm.group(3).split(","):
                part = part.strip()
                mm = re.match(r"i\d+\s+(-?\d+)", part)
                if mm:
                    vals.append(int(mm.group(1)))
            args.append({"imm_vec": vals})
            continue
        ref = re.search(r"%([A-Za-z0-9._]+)", a)
        if ref:
            args.append({"ref": ref.group(1)})
            continue
        imm = re.search(r"i\d+\s+(-?\d+)", a)
        if imm:
            args.append({"imm": int(imm.group(1))})
            continue
        args.append({"raw": a})
    return {"op": "intrinsic", "intrinsic": name,
            "type": t if t and (t.startswith("<") or t.startswith("{"))
            else None,
            "src": ops, "args": args, "dst": dst}


def _parse_vector_const(rhs):
    """Parse a trailing `<i32 a, i32 b, ...>` vector constant operand."""
    m = re.search(r",\s*<\s*i\d+\s+(.+?)>\s*$", rhs)
    if not m:
        return None
    out = []
    for part in m.group(1).split(","):
        part = part.strip()
        if part.startswith("i"):
            part = part.split(None, 1)[1]
        out.append(int(part))
    return out


def import_llvm_ir_text(ir_text, function=None):
    """Import the restricted LLVM IR shape emitted for x265 AArch64 kernels.

    This is intentionally a narrow parser: it understands the op patterns that
    appear in the extracted SA8D seed (load/zext/sub/add/shuffle/bitcast/
    AArch64 NEON intrinsics/lshr/ret). Unknown instructions raise ValueError
    so the seed never silently loses semantics.
    """
    ir = MachineIR(function=function)
    for raw in ir_text.splitlines():
        line = raw.strip()
        if not line or line.startswith(";") or line.startswith("declare") \
           or line.startswith("attributes") or line.startswith("!") \
           or line.startswith("source_filename") or line.startswith("target") \
           or line.startswith("module") or line.startswith("define") \
           or line.endswith(":") or line == "}" \
           or re.match(r"^\d+:\s*(;.*)?$", line):
            continue
        if "llvm.lifetime.start" in line or "llvm.lifetime.end" in line:
            continue    # stack lifetime annotations, no runtime semantics
        if line.startswith("@") and "=" in line:
            continue    # global constant/alias declaration
        m = _INSN_RE.match(line)
        if not m:
            if line.startswith("store"):
                t = line.split("store", 1)[1].split(",", 1)[0].strip()
                tm = re.match(r"\s*(<\d+\s+x\s+i\d+>|i\d+)", t)
                val = re.search(r"%([A-Za-z0-9._]+)\s*,\s*ptr", line)
                ptr = re.search(r"ptr\s+%([A-Za-z0-9._]+)", line)
                ir.add({"op": "store",
                        "type": tm.group(1) if tm else t,
                        "src": val.group(1) if val else None,
                        "ptr": ptr.group(1) if ptr else None})
                continue
            if line.startswith("ret"):
                m2 = re.match(r"ret\s+(\S+)\s+%([A-Za-z0-9._]+)", line)
                if m2:
                    ir.add({"op": "ret", "type": m2.group(1),
                            "operand": m2.group(2)})
                continue
            if (line.startswith("tail call") or line.startswith("call")) \
                    and "llvm.aarch64.neon." in line:
                # void intrinsic calls (e.g. st4) have no dst assignment
                ir.add(_parse_neon_intrinsic(line, None))
                continue
            raise ValueError("unhandled IR line: %r" % line)
        dst, rhs = m.group(1), m.group(2)
        if rhs.startswith("alloca"):
            am = re.match(
                r"alloca\s+\[(\d+)\s+x\s+(<\d+ x i\d+>|i\d+)\],\s*align\s+\d+",
                rhs)
            if am:
                # fixed-size vector array on the stack (e.g. DCT16's O[16]):
                # later constant-indexed getelementptr/load/store reference
                # its elements through the recorded allocation.
                ir.add({"op": "alloca", "type": am.group(2),
                        "count": int(am.group(1)), "dst": dst})
                continue
            raise ValueError("unsupported alloca: %r" % rhs)
        if rhs.startswith("load"):
            t = rhs.split("load", 1)[1].split(",")[0].strip()
            ptr = re.search(r"ptr %([A-Za-z0-9._]+)", rhs)
            node = {"op": "load", "type": t, "dst": dst}
            if ptr:
                node["ptr"] = ptr.group(1)
            else:
                gp = re.search(
                    r"ptr getelementptr inbounds nuw \(i8, ptr "
                    r"@([A-Za-z0-9._]+), i64 (\d+)\)", rhs)
                if gp:
                    node["const_name"] = gp.group(1)
                    node["const_off"] = int(gp.group(2))
                else:
                    raise ValueError("unsupported load ptr: %r" % rhs)
            ir.add(node)
        elif rhs.startswith("getelementptr"):
            ir.add({"op": "addr", "type": "ptr", "rhs": rhs, "dst": dst})
        elif rhs.startswith("zext"):
            ops = _parse_operands(rhs)
            t = rhs.split("to", 1)[1].strip()
            ir.add({"op": "zext", "type": t, "src": ops[0] if ops else None,
                    "dst": dst})
        elif rhs.startswith("sext"):
            ops = _parse_operands(rhs)
            t = rhs.split("to", 1)[1].strip()
            ir.add({"op": "sext", "type": t, "src": ops[0] if ops else None,
                    "dst": dst})
        elif rhs.startswith("trunc"):
            ops = _parse_operands(rhs)
            t = rhs.split("to", 1)[1].strip()
            ir.add({"op": "trunc", "type": t, "src": ops[0] if ops else None,
                    "dst": dst})
        elif rhs.startswith("extractvalue"):
            ops = _parse_operands(rhs)
            idx = int(rhs.rsplit(",", 1)[1].strip())
            ir.add({"op": "extractvalue", "src": ops, "index": idx,
                    "dst": dst})
        elif rhs.startswith("extractelement"):
            ops = _parse_operands(rhs)
            t = re.search(r"extractelement\s+<\d+\s+x\s+(i\d+)>", rhs)
            idx = int(re.search(r"i\d+\s+(-?\d+)\s*$", rhs).group(1))
            ir.add({"op": "extractelement", "type": t.group(1) if t else None,
                    "src": ops, "index": idx, "dst": dst})
        elif rhs.startswith("insertelement"):
            ops = _parse_operands(rhs)
            vm = re.match(r"insertelement\s+(<\d+\s+x\s+i\d+>)\s+poison,",
                          rhs)
            im = re.search(r"i\d+\s+(-?\d+)\s*$", rhs)
            ir.add({"op": "insertelement",
                    "type": vm.group(1) if vm else None,
                    "src": ops,
                    "index": int(im.group(1)) if im else None,
                    "dst": dst})
        elif rhs.startswith("trunc"):
            ops = _parse_operands(rhs)
            t = rhs.split(" to ", 1)[1].strip()
            ir.add({"op": "trunc", "type": t, "src": ops, "dst": dst})
        elif rhs.startswith("xor"):
            ops = _parse_operands(rhs)
            node = {"op": "xor", "type": _op_type(rhs), "src": ops,
                    "dst": dst}
            cm = re.search(r",\s*(-?\d+)\s*$", rhs)
            if cm:
                node["const"] = int(cm.group(1))
            imm = _parse_imm(rhs.rsplit(",", 1)[1]) \
                if "," in rhs and "splat" in rhs else None
            if imm is not None:
                node["imm"] = imm
            ir.add(node)
        elif rhs.startswith("and"):
            ops = _parse_operands(rhs)
            node = {"op": "and", "type": _op_type(rhs), "src": ops,
                    "dst": dst}
            cm = re.search(r",\s*(-?\d+)\s*$", rhs)
            if cm:
                node["const"] = int(cm.group(1))
            ir.add(node)
        elif rhs.startswith("sub"):
            ops = _parse_operands(rhs)
            node = {"op": "sub", "type": _op_type(rhs), "src": ops, "dst": dst}
            if node["type"] is None:
                vt = re.match(
                    r"sub(?:\s+(?:nsw|nuw))*\s+(<\d+\s+x\s+i\d+>|i\d+)", rhs)
                if vt:
                    node["type"] = vt.group(1)
            if len(ops) == 1:
                cm = re.search(r",\s*(-?\d+)\s*$", rhs)
                if cm:
                    node["const"] = int(cm.group(1))
                else:
                    # `sub nsw i32 0, %x` (negation): constant is the
                    # FIRST operand.
                    lm = re.match(
                        r"sub(?:\s+(?:nsw|nuw))*\s+(?:i\d+|<\d+\s+x\s+i\d+>)"
                        r"\s+(?:zeroinitializer|(-?\d+)),\s*%", rhs)
                    if lm:
                        node["const"] = (0 if lm.group(1) is None
                                         else int(lm.group(1)))
                        node["const_first"] = True
            ir.add(node)
        elif rhs.startswith("add"):
            ops = _parse_operands(rhs)
            node = {"op": "add", "type": _op_type(rhs), "src": ops, "dst": dst}
            if len(ops) == 1:
                cm = re.search(r",\s*(-?\d+)\s*$", rhs)
                node["const"] = int(cm.group(1)) if cm else None
            ir.add(node)
        elif rhs.startswith("mul"):
            ops = _parse_operands(rhs)
            node = {"op": "mul", "type": _op_type(rhs), "src": ops, "dst": dst}
            cv = _parse_vector_const(rhs)
            if cv is not None:
                node["const_vec"] = cv
            elif len(ops) == 1:
                cm = re.search(r",\s*(-?\d+)\s*$", rhs)
                if cm:
                    node["const"] = int(cm.group(1))
                else:
                    # splat constants and `<>` vector constants (x265 coeff
                    # vectors, possibly with poison lanes): take the first
                    # valid value as an all-lane splat. Safe for roundtrip
                    # because poison lanes are never observable here.
                    sm = re.search(r"splat\s+\(i\d+\s+(-?\d+)\)", rhs)
                    if sm:
                        node["const"] = int(sm.group(1))
                    else:
                        vm = re.search(r"<i\d+\s+(-?\d+)", rhs)
                        if vm:
                            node["const"] = int(vm.group(1))
            ir.add(node)
        elif rhs.startswith("shufflevector"):
            ops = _parse_operands(rhs)
            mask = _parse_shuffle_mask(rhs)
            ir.add({"op": "shuffle", "type": _shuffle_result_type(rhs),
                    "src": ops, "mask": mask, "dst": dst})
        elif rhs.startswith("bitcast"):
            ops = _parse_operands(rhs)
            t = rhs.split("to", 1)[1].strip()
            sm = re.match(r"bitcast\s+(<\d+\s+x\s+i\d+>|i\d+)\s+%[A-Za-z0-9._]+ to", rhs)
            ir.add({"op": "bitcast", "type": t,
                    "src_type": sm.group(1) if sm else None,
                    "src": ops[0] if ops else None, "dst": dst})
        elif "llvm.aarch64.neon." in rhs:
            ir.add(_parse_neon_intrinsic(rhs, dst))
        elif rhs.startswith("lshr"):
            ops = _parse_operands(rhs)
            ir.add({"op": "lshr", "type": _op_type(rhs),
                    "src": ops, "amt": _parse_imm(rhs.rsplit(",", 1)[1]),
                    "dst": dst})
        elif rhs.startswith("shl"):
            ops = _parse_operands(rhs)
            tail = rhs.rsplit(",", 1)[1].strip()
            node = {"op": "shl", "type": _op_type(rhs), "src": ops,
                    "dst": dst}
            if tail.startswith("%"):
                # variable shift count: `shl nuw i32 1, %count`
                bm = re.match(
                    r"shl(?:\s+(?:nuw|nsw))*\s+i\d+\s+(-?\d+),\s*%", rhs)
                if bm:
                    node["const"] = int(bm.group(1))
                node["amt"] = None
            else:
                node["amt"] = _parse_imm(tail)
            ir.add(node)
        elif rhs.startswith("icmp"):
            ops = _parse_operands(rhs)
            pred = re.search(r"icmp\s+(\w+)", rhs).group(1)
            vt = re.search(r"icmp\s+\w+\s+(<\d+\s+x\s+i\d+>)", rhs)
            node = {"op": "icmp", "type": "i1", "pred": pred,
                    "vec_type": vt.group(1) if vt else None,
                    "src": ops, "dst": dst}
            if len(ops) == 1:
                cm = re.search(r",\s*(-?\d+)\s*$", rhs)
                if cm:
                    node["const"] = int(cm.group(1))
            if re.search(r"zeroinitializer\s*$", rhs):
                node["cmp_zero"] = True
            ir.add(node)
        elif rhs.startswith("select"):
            ops = _parse_operands(rhs)
            mt = re.search(r"select\s+(<\d+\s+x\s+i1>)\s+%", rhs)
            ot = re.search(r"select\s+<\d+\s+x\s+i1>\s+%[A-Za-z0-9._]+,\s*"
                           r"(<\d+\s+x\s+i\d+>|i\d+)\s+%", rhs)
            ir.add({"op": "select", "type": ot.group(1) if ot else None,
                    "mask_type": mt.group(1) if mt else None,
                    "src": ops, "dst": dst})
        else:
            raise ValueError("unhandled RHS: %r" % rhs)
    return ir


def import_llvm_ir_structured(ir_text, function=None):
    """Structured CFG importer for loop-free block DAGs (post opt_unroll).

    Models the function as a list of block nodes (DAG; loops rejected):

      {"op": "block", "label": <n>, "body": [nodes...],
       "phis": {dst: {"type": T, "incoming": {pred_label: value}}},
       "term": {"kind": "jump"|"cond"|"ret", ...}}

    Control flow is left for the codegen-side recursive emitter (tail
    duplication), per docs/42 §10.
    """
    ir = MachineIR(function=function)
    lines = [ln.rstrip() for ln in ir_text.splitlines()]
    blocks = {}
    order = []
    cur = "entry"
    blocks[cur] = []
    order.append(cur)
    for ln in lines:
        s = ln.strip()
        mm = re.match(r"^(\d+):", s)
        if mm:
            cur = mm.group(1)
            blocks[cur] = []
            order.append(cur)
        elif s and not s.startswith(";"):
            blocks[cur].append(ln)

    # The LLVM IR printer omits the entry block's label line, but phis/brs
    # still reference it by its numeric label. Discover it as the referenced
    # label that is never defined by a `N:` line, and use it for "entry".
    defined = set(blocks)
    referenced = set()
    for b, ins in blocks.items():
        for s in ins:
            for mm in re.finditer(r"label %(\d+)", s):
                referenced.add(mm.group(1))
            for mm in re.finditer(r",\s*%(\d+)\s*\]", s):
                referenced.add(mm.group(1))
    missing = referenced - defined
    if missing:
        if len(missing) != 1:
            raise ValueError("entry label ambiguous: %s" % sorted(missing))
        entry_label = missing.pop()
        blocks[entry_label] = blocks.pop("entry")
        order[0] = entry_label

    def succ(b):
        t = []
        for s in blocks[b]:
            if s.strip().startswith("br label %"):
                t.append(s.split("%")[1])
            elif s.strip().startswith("br i1"):
                mm = re.search(r"label %(\d+), label %(\d+)", s)
                if mm:
                    t += [mm.group(1), mm.group(2)]
        return t

    # acyclicity check (Tarjan): loops -> unsupported
    sys.setrecursionlimit(10000)
    index, low, stack, on = {}, {}, [], set()
    idx = [0]

    def strong(v):
        index[v] = low[v] = idx[0]
        idx[0] += 1
        stack.append(v)
        on.add(v)
        for w in succ(v):
            if w not in blocks:
                continue
            if w not in index:
                strong(w)
                low[v] = min(low[v], low[w])
            elif w in on:
                low[v] = min(low[v], index[w])
        if low[v] == index[v]:
            scc = []
            while True:
                w = stack.pop()
                on.discard(w)
                scc.append(w)
                if w == v:
                    break
            if len(scc) > 1 or v in succ(v):
                raise ValueError("structured import: loop at block %s" % v)

    for v in blocks:
        if v not in index:
            strong(v)

    def flat_nodes(ins):
        text = "\n".join(ins) + "\n"
        tmp = import_llvm_ir_text(text)
        return [dict(n) for n in tmp.nodes]

    out = []
    for b in order:
        ins = blocks[b]
        phis = {}
        body = []
        term = None
        for s in ins:
            s = s.strip()
            if "= phi" in s:
                mm = re.match(r"%([\w.]+) = phi (\S+) (.*)", s)
                dst, typ, pairs = mm.group(1), mm.group(2), mm.group(3)
                vals = re.findall(r"\[\s*(\S+?)\s*,\s*%(\d+)\s*\]", pairs)
                phis[dst] = {"type": typ,
                             "incoming": {bl: v for v, bl in vals}}
            elif s.startswith("br ") or s.startswith("ret"):
                if s.startswith("br label %"):
                    term = {"kind": "jump", "target": s.split("%")[1]}
                elif s.startswith("br i1"):
                    mm = re.search(
                        r"br i1 %([\w.]+), label %(\d+), label %(\d+)", s)
                    term = {"kind": "cond", "cond": mm.group(1),
                            "then": mm.group(2), "else": mm.group(3)}
                else:
                    term = {"kind": "ret"}
            else:
                body.append(s)
        out.append({"op": "block", "label": b, "body": flat_nodes(body),
                    "phis": phis, "term": term})
    ir.nodes = out
    return ir
