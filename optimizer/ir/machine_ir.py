"""MachineIR: target-aware instruction graph imported from LLVM IR / asm.

Each node records opcode, operand references, vector widths, shuffle masks,
and (later) lane semantics. This is the layer where instructions still exist;
PackIR is the abstraction that removes them.
"""

import json
import re

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
    types = re.findall(r"<(\d+) x i\d+>", args)
    return "<%s x i32>" % types[-1] if types else None


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
           or line.endswith(":") or line == "}":
            continue
        if "llvm.lifetime.start" in line or "llvm.lifetime.end" in line:
            continue    # stack lifetime annotations, no runtime semantics
        if line.startswith("@") and "=" in line:
            continue    # global constant/alias declaration
        m = _INSN_RE.match(line)
        if not m:
            if line.startswith("store"):
                t = line.split("store", 1)[1].split(",", 1)[0].strip()
                val = re.search(r"%([A-Za-z0-9._]+)\s*,\s*ptr", line)
                ptr = re.search(r"ptr\s+%([A-Za-z0-9._]+)", line)
                ir.add({"op": "store", "type": t,
                        "src": val.group(1) if val else None,
                        "ptr": ptr.group(1) if ptr else None})
                continue
            if line.startswith("ret"):
                m2 = re.match(r"ret\s+(\S+)\s+%([A-Za-z0-9._]+)", line)
                if m2:
                    ir.add({"op": "ret", "type": m2.group(1),
                            "operand": m2.group(2)})
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
        elif rhs.startswith("xor"):
            ops = _parse_operands(rhs)
            node = {"op": "xor", "type": _op_type(rhs), "src": ops,
                    "dst": dst}
            imm = _parse_imm(rhs.rsplit(",", 1)[1]) \
                if "," in rhs and "splat" in rhs else None
            if imm is not None:
                node["imm"] = imm
            ir.add(node)
        elif rhs.startswith("sub"):
            ops = _parse_operands(rhs)
            node = {"op": "sub", "type": _op_type(rhs), "src": ops, "dst": dst}
            if len(ops) == 1:
                cm = re.search(r",\s*(\d+)\s*$", rhs)
                node["const"] = int(cm.group(1)) if cm else None
            ir.add(node)
        elif rhs.startswith("add"):
            ops = _parse_operands(rhs)
            node = {"op": "add", "type": _op_type(rhs), "src": ops, "dst": dst}
            if len(ops) == 1:
                cm = re.search(r",\s*(\d+)\s*$", rhs)
                node["const"] = int(cm.group(1)) if cm else None
            ir.add(node)
        elif rhs.startswith("mul"):
            ops = _parse_operands(rhs)
            node = {"op": "mul", "type": _op_type(rhs), "src": ops, "dst": dst}
            cv = _parse_vector_const(rhs)
            if cv is not None:
                node["const_vec"] = cv
            elif len(ops) == 1:
                cm = re.search(r",\s*(\d+)\s*$", rhs)
                node["const"] = int(cm.group(1)) if cm else None
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
            name = re.search(r"@llvm\.aarch64\.neon\.([a-z0-9_]+)", rhs).group(1)
            ops = _parse_operands(rhs)
            args = []
            call_args = rhs.split("(", 1)[1].rsplit(")", 1)[0]
            for a in call_args.split(","):
                a = a.strip()
                ref = re.search(r"%([A-Za-z0-9._]+)", a)
                if ref:
                    args.append({"ref": ref.group(1)})
                    continue
                imm = re.search(r"i\d+\s+(-?\d+)", a)
                if imm:
                    args.append({"imm": int(imm.group(1))})
                    continue
                args.append({"raw": a})
            ir.add({"op": "intrinsic", "intrinsic": name,
                    "src": ops, "args": args, "dst": dst})
        elif rhs.startswith("lshr"):
            ops = _parse_operands(rhs)
            ir.add({"op": "lshr", "type": _op_type(rhs),
                    "src": ops, "amt": _parse_imm(rhs.rsplit(",", 1)[1]),
                    "dst": dst})
        elif rhs.startswith("shl"):
            ops = _parse_operands(rhs)
            ir.add({"op": "shl", "type": _op_type(rhs),
                    "src": ops, "amt": _parse_imm(rhs.rsplit(",", 1)[1]),
                    "dst": dst})
        else:
            raise ValueError("unhandled RHS: %r" % rhs)
    return ir
