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
    m = re.search(r"<(\d+) x i32> <(.+)>", args)
    if not m:
        return None
    parts = [int(x.strip()) for x in m.group(2).replace("i32", "").split(",")]
    return parts


def _parse_operands(args):
    """Return %name references in order."""
    return re.findall(r"%([A-Za-z0-9._]+)", args)


def _op_type(args):
    m = re.search(r"(<\d+ x i\d+>|i\d+)\s+%", args)
    return m.group(1) if m else None


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
        m = _INSN_RE.match(line)
        if not m:
            if line.startswith("ret"):
                m2 = re.match(r"ret\s+(\S+)\s+%([A-Za-z0-9._]+)", line)
                if m2:
                    ir.add({"op": "ret", "type": m2.group(1),
                            "operand": m2.group(2)})
                continue
            raise ValueError("unhandled IR line: %r" % line)
        dst, rhs = m.group(1), m.group(2)
        if rhs.startswith("load"):
            t = rhs.split("load", 1)[1].split(",")[0].strip()
            ptr = re.search(r"ptr %([A-Za-z0-9._]+)", rhs)
            ir.add({"op": "load", "type": t, "ptr": ptr.group(1) if ptr else None,
                    "dst": dst})
        elif rhs.startswith("getelementptr"):
            ir.add({"op": "addr", "type": "ptr", "rhs": rhs, "dst": dst})
        elif rhs.startswith("zext"):
            ops = _parse_operands(rhs)
            t = rhs.split("to", 1)[1].strip()
            ir.add({"op": "zext", "type": t, "src": ops[0] if ops else None,
                    "dst": dst})
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
        elif rhs.startswith("shufflevector"):
            ops = _parse_operands(rhs)
            mask = _parse_shuffle_mask(rhs)
            ir.add({"op": "shuffle", "type": _op_type(rhs),
                    "src": ops, "mask": mask, "dst": dst})
        elif rhs.startswith("bitcast"):
            ops = _parse_operands(rhs)
            t = rhs.split("to", 1)[1].strip()
            ir.add({"op": "bitcast", "type": t, "src": ops[0] if ops else None,
                    "dst": dst})
        elif "llvm.aarch64.neon." in rhs:
            name = re.search(r"@llvm\.aarch64\.neon\.([a-z0-9_]+)", rhs).group(1)
            ops = _parse_operands(rhs)
            ir.add({"op": "intrinsic", "intrinsic": name,
                    "src": ops, "dst": dst})
        elif rhs.startswith("lshr"):
            ops = _parse_operands(rhs)
            ir.add({"op": "lshr", "type": _op_type(rhs),
                    "src": ops, "amt": int(rhs.rsplit(",", 1)[1].strip()),
                    "dst": dst})
        elif rhs.startswith("shl"):
            ops = _parse_operands(rhs)
            ir.add({"op": "shl", "type": _op_type(rhs),
                    "src": ops, "amt": int(rhs.rsplit(",", 1)[1].strip()),
                    "dst": dst})
        else:
            raise ValueError("unhandled RHS: %r" % rhs)
    return ir
