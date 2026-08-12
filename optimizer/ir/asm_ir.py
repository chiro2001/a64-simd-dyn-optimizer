"""Assembly-level straight-line IR from a QEMU dynamic instruction trace.

The trace (tools/parse_qemu_trace.py output: `addr mnemonic operands`) is the
actually executed instruction stream of one kernel invocation. This module
turns it into register-SSA nodes: every write of a register starts a new
value, and operands reference the defining instruction. Unlike a
compiler-based unroll, this representation is robust to compiler version,
flags, and instruction-selection choices.

The constant pool (e.g. the rev16/rev32 tbl index vectors) is NOT resolved
here; a tbl node keeps its index register, and the resolving pass maps the
register back to the loaded .rodata bytes.
"""

import re


REG = re.compile(r"(?<![\w.])([vxqwdshb]\d+|sp)(?:\.\S+)?(?:\[\d+\])?")


def _norm(r):
    if len(r) > 1 and r[0] in ("q", "v", "d", "s", "h", "b") \
            and r[1].isdigit():
        return "v" + r[1:]
    if len(r) > 1 and r[0] == "w" and r[1].isdigit():
        return "x" + r[1:]
    return r


def _parse_operands(ops):
    """Return (dst list, read list) with register names, ignoring lists."""
    regs = REG.findall(ops)
    regs = [r for r in regs if r not in ("xzr", "wzr")]
    return [_norm(r) for r in regs]


def import_asm_trace(lines, start=None, end=None):
    """Import a dynamic trace into straight-line asm nodes.

    lines: iterable of "addr mnemonic operands" strings (or dicts from
    parse_qemu_trace). Returns (nodes, vector_nodes) where each node is
    {id, addr, mn, ops, dst, reads}; reads are defining node ids.
    """
    nodes0 = []
    writer = {}   # register -> (node_id, register_index), per point
    for item in lines:
        if isinstance(item, dict):
            addr, mn, ops = item["addr"], item["mn"], item["ops"]
        else:
            parts = item.strip().split(None, 2)
            if len(parts) < 2:
                continue
            addr = int(parts[0], 16) if parts[0].startswith("0x") \
                else int(parts[0])
            mn = parts[1]
            ops = parts[2] if len(parts) > 2 else ""
        if start is not None and addr < start:
            continue
        if end is not None and addr >= end:
            continue
        regs = _parse_operands(ops)
        # AArch64: the first register operand is usually the destination for
        # arithmetic instructions; loads have one dst, stores have none.
        STORE_MN = {"str", "st1", "stp", "stur"}
        LOAD_MN = {"ldr", "ld1", "ldp", "ldur"}
        RMW_MN = {"smlal", "smlal2", "saddw", "saddw2", "ssubw", "ssubw2",
                  "saba", "uaba", "sabal", "uabal", "mla", "mls"}
        dst, reads = [], []
        if mn in STORE_MN:
            reads = regs
        elif mn in LOAD_MN:
            if mn == "ldp":
                dst = regs[:2]
                reads = regs[2:]
            else:
                dst = regs[:1]
                reads = regs[1:]
        elif regs:
            dst = regs[:1]
            reads = regs[1:]
            if mn in RMW_MN:
                # read-modify-write accumulator: the destination register's
                # previous value is an implicit first read.
                reads = [dst[0]] + reads
        node = {"id": len(nodes0), "addr": addr, "mn": mn, "ops": ops,
                "dst": dst, "reads": [], "read_regs": reads,
                "read_ids": [], "prev": {}}
        for r in reads:
            w = writer.get(r)
            node["read_ids"].append(w)
            if w is not None:
                node["reads"].append(w)
        for i, d in enumerate(dst):
            node["prev"][d] = writer.get(d)
            writer[d] = (node["id"], i)
        node["is_vector"] = any(r.startswith("v") and r[1:].isdigit()
                                for r in dst + reads)
        nodes0.append(node)

    # split ldp into two single-register loads so each register is its own
    # 8-lane leaf (the pair loads two rows: row i and its mirror row)
    split = {}
    nodes = []
    for n in nodes0:
        if n["mn"] == "ldp" and len(n["dst"]) == 2:
            first = dict(n)
            second = dict(n)
            first["dst"] = n["dst"][:1]
            first["ops"] = re.sub(r",\s*%s[^,\[]*" % re.escape(n["dst"][1]),
                                  "", n["ops"], count=1)
            second["dst"] = n["dst"][1:]
            second["id"] = len(nodes0) + len(split)
            second["ops"] = n["ops"]
            split[(n["id"], 0)] = first["id"]
            split[(n["id"], 1)] = second["id"]
            nodes.append(first)
            nodes.append(second)
        else:
            nodes.append(n)
    # remap tuple read references created for ldp pairs
    for n in nodes:
        for i, ref in enumerate(n["read_ids"]):
            if isinstance(ref, tuple):
                n["read_ids"][i] = split.get(ref, ref[0])
        n["reads"] = [split.get(r, r[0]) if isinstance(r, tuple) else r
                      for r in n["reads"]]
        for k, v in n["prev"].items():
            if isinstance(v, tuple):
                n["prev"][k] = split.get(v, v[0])
    vector = [n for n in nodes if n["is_vector"]]
    last_writer = {}
    for n in nodes:
        for d in n["dst"]:
            last_writer[d] = n["id"]
    # renumber sequentially so node ids remain list indices
    renum = {n["id"]: i for i, n in enumerate(nodes)}
    for n in nodes:
        n["id"] = renum[n["id"]]
        n["read_ids"] = [renum.get(r, r) if isinstance(r, int) else r
                         for r in n["read_ids"]]
        n["reads"] = [renum.get(r, r) if isinstance(r, int) else r
                      for r in n["reads"]]
        n["prev"] = {k: renum.get(v, v) if isinstance(v, int) else v
                     for k, v in n["prev"].items()}
    last_writer = {r: renum[v] for r, v in last_writer.items()}
    return nodes, vector, last_writer


LOAD_MN = {"ldr", "ld1", "ld2", "ld3", "ld4", "ldp", "ldur", "ld1r"}
STORE_MN = {"str", "st1", "st2", "st3", "st4", "stp", "stur"}


def dynamic_counts(nodes):
    """User metric: SIMD + load instructions (vector loads not double
    counted; scalar loads count as loads; stores are excluded)."""
    simd = 0
    load = 0
    vector = 0
    for n in nodes:
        is_vec = n.get("is_vector", False)
        if is_vec:
            vector += 1
        if n["mn"] in LOAD_MN:
            load += 1
        elif is_vec and n["mn"] not in STORE_MN:
            simd += 1
    return {"total": len(nodes), "vector": vector, "simd": simd,
            "load": load, "simd_load": simd + load}


def _resolve_load_addr(nodes, rodata):
    """Annotate each constant load with its resolved .rodata address."""
    by_id = {n["id"]: n for n in nodes}
    # stack-slot tracking per instruction point: str qN, [sp, #imm] writes
    # the slot; a later ldr qM, [sp, #imm] reads the same value (constants
    # are spilled at function entry).
    slot = {}
    for n in nodes:
        if n["mn"] in ("str", "stp", "stur"):
            sm = re.search(r"\[sp,\s*#(-?\d+)\]", n["ops"])
            if sm:
                slot[int(sm.group(1))] = n
        if n["mn"] in ("ldr", "ldur"):
            sm = re.search(r"\[sp,\s*#(-?\d+)\]", n["ops"])
            if sm:
                n["slot"] = slot.get(int(sm.group(1)))

    def addr_of(node, seen):
        if node is None or node["id"] in seen:
            return None
        seen = seen | {node["id"]}
        if node["mn"] not in ("ldr", "ldur", "ldp") or not node["read_regs"]:
            return None
        bm = re.search(r"\[([xw]\d+|sp),\s*#(-?0x[0-9a-f]+|-\d+|\d+)\]",
                       node["ops"])
        if not bm:
            return None
        base_reg = _norm(bm.group(1))
        imm = int(bm.group(2), 0)
        if base_reg == "sp":
            src = node.get("slot")
            if src and src["reads"]:
                return addr_of(by_id.get(src["reads"][0]), seen)
            return None

        def resolve_addr(n, seen2):
            if n is None or n["id"] in seen2:
                return None
            seen2 = seen2 | {n["id"]}
            if n["mn"] == "adrp":
                am = re.search(r"#(0x[0-9a-f]+)", n["ops"])
                return (int(am.group(1), 16), 0) if am else None
            if n["mn"] in ("add", "sub") and n["read_ids"]:
                base = resolve_addr(by_id.get(n["read_ids"][0]), seen2)
                im = re.search(r"#(-?0x[0-9a-f]+|-\d+|\d+)", n["ops"])
                if base and im:
                    off = int(im.group(1), 0)
                    sign = -1 if n["mn"] == "sub" else 1
                    return (base[0], base[1] + sign * off)
            return None

        pos = node["read_regs"].index(base_reg) \
            if base_reg in node["read_regs"] else -1
        base_node = by_id.get(node["read_ids"][pos]) \
            if pos >= 0 and pos < len(node["read_ids"]) else None
        resolved = resolve_addr(base_node, set())
        if resolved and resolved[0] + resolved[1] + imm in rodata:
            return resolved[0] + resolved[1] + imm
        return None

    for n in nodes:
        if n["mn"] in ("ldr", "ldur", "ldp"):
            n["rodata_addr"] = addr_of(n, set())
    return nodes


def resolve_tbl_masks(nodes, rodata, last_writer):
    """Resolve each tbl's index vector to its 16 byte indices.

    rodata: {address: bytes-like} of the static binary's read-only data.
    Unresolvable chains keep `mask=None`.
    """
    by_id = {n["id"]: n for n in nodes}
    _resolve_load_addr(nodes, rodata)
    for n in nodes:
        if n["mn"] == "tbl":
            if len(n["read_ids"]) > 1:
                ldr = by_id.get(n["read_ids"][-1])
                if ldr is not None and ldr.get("rodata_addr") in rodata:
                    n["mask"] = list(rodata[ldr["rodata_addr"]][:16])
    return nodes


def resolve_constants(nodes, rodata):
    """Annotate .rodata loads with their resolved 16 bytes."""
    _resolve_load_addr(nodes, rodata)
    by_id = {n["id"]: n for n in nodes}
    for n in nodes:
        if n.get("rodata_addr") in rodata:
            n["const_bytes"] = rodata[n["rodata_addr"]][:16]
        if n["mn"] == "tbl" and len(n["read_ids"]) > 1:
            ldr = by_id.get(n["read_ids"][-1])
            if ldr is not None and ldr.get("rodata_addr") in rodata:
                n["mask"] = list(rodata[ldr["rodata_addr"]][:16])
    return nodes
