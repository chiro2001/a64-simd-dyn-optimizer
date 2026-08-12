"""Critical-path latency estimator over AArch64 disassembly (v0).

The linear throughput cost model failed to rank the M14-M16 candidates
(R2 < 0): latency on these kernels is dominated by the dependency chain. This
module builds a register + stack-slot def-use graph from objdump text and
computes the longest forward latency path (no parallelism modeling), which is
an upper bound usable for *ranking* candidates within one kernel family.

Stack accesses are tracked as pseudo-registers `sp#offset`, so a
store-to-coef / load-from-coef round trip (proto_c) correctly contributes to
the chain.
"""

import re
from collections import defaultdict


MNEMONIC_LATENCY = {
    "mul": 3, "mla": 4, "mls": 4, "smull": 3, "umull": 3,
    "sqdmulh": 4, "sqrdmulh": 4,
    "add": 2, "sub": 2, "addp": 3, "saddl": 2, "ssubl": 2,
    "saddw": 2, "ssubw": 2, "uaddl": 2, "usubl": 2,
    "addv": 3, "saddv": 3, "uaddv": 3,
    "rshrn": 4, "sqrshrn": 4, "shrn": 3, "sqshrn": 4,
    "sxtl": 1, "uxtl": 1, "sxtl2": 1, "uxtl2": 1,
    "rev64": 2, "rev32": 2, "rev16": 2, "zip1": 2, "zip2": 2,
    "trn1": 2, "trn2": 2, "uzp1": 2, "uzp2": 2, "ext": 2,
    "tbl": 4, "tbx": 4, "mov": 1, "movi": 1, "mvni": 1, "dup": 2,
    "shl": 1, "sshr": 1, "ushr": 1, "asr": 1, "lsl": 1,
    "ld1": 4, "ld2": 4, "ld3": 4, "ld4": 4, "ldr": 4, "ldp": 4,
    "ldur": 4, "ld1r": 4,
    "st1": 1, "st2": 1, "st3": 1, "st4": 1, "str": 1, "stp": 1,
    "stur": 1,
    "cbz": 0, "cbnz": 0, "b": 0, "b.ne": 0, "b.eq": 0, "b.hi": 0,
    "b.lo": 0, "b.gt": 0, "b.le": 0, "b.ge": 0, "b.lt": 0,
    "ret": 0, "nop": 0, "cmp": 1, "tst": 1,
    "adrp": 1, "adr": 1, "adds": 2, "subs": 2, "csel": 2, "cinc": 2,
    "sbfiz": 1, "ubfiz": 1, "sbfx": 1, "ubfx": 1, "asrv": 1, "lslv": 1,
}

REG = re.compile(r"(?<![\w.])([vqzxwsdhb]\d+|sp)(?:\.\S+)?(?:\[\d+\])?")
STORE_MN = {"st1", "st2", "st3", "st4", "str", "stp", "stur"}
LOAD_MN = {"ld1", "ld2", "ld3", "ld4", "ldr", "ldp", "ldur", "ld1r"}
NO_DST_MN = {"st1", "st2", "st3", "st4", "str", "stp", "stur", "cmp", "tst",
             "cbz", "cbnz", "b", "b.ne", "b.eq", "b.hi", "b.lo", "b.gt",
             "b.le", "b.ge", "b.lt", "ret", "nop"}
# Instructions whose destination register is also an input (read-modify-write
# accumulator / fold forms). The old parser missed this edge, which severed
# the 4-deep vmlaq accumulator chain.
RMW_MN = {"mla", "mls", "madd", "msub", "smlal", "smlal2", "umlal",
          "umlal2", "smlsl", "smlsl2", "umlsl", "umlsl2", "saba", "uaba",
          "sabal", "sabal2", "uabal", "uabal2", "sadalp", "uadalp",
          "fmla", "fmls", "fmlal", "fmlal2", "fmlsl", "fmlsl2",
          "smaddl", "umaddl", "smsubl", "umsubl", "sbc", "adc", "ngc",
          "sqrdmlah", "sqrdmlsh"}
# Two-register pair loads have two destinations.
PAIR_LOAD_MN = {"ldp"}


def normalize_reg(reg):
    """Map architectural views of one register to a single pseudo-register.

    qN/vN/dN/sN/hN/bN are views of vector register vN; wN/xN are views of
    scalar register xN. Without this, `mov v0, v1` and `mov q0, q1` create
    disjoint live ranges and the chain breaks.
    """
    if reg is None:
        return None
    if reg[0] in ("q", "v", "d", "s", "h", "b") and len(reg) > 1 \
            and reg[1].isdigit():
        return "v" + reg[1:]
    if reg[0] == "w" and len(reg) > 1 and reg[1].isdigit():
        return "x" + reg[1:]
    return reg


def parse_inst(line):
    """Return (mnemonic, dsts, reads, mems) or None.

    dsts is a list (empty for stores); reads includes the accumulator
    operand for read-modify-write mnemonics and aliases d/q/v/s/h/b onto vN
    and w/x onto xN. mems lists memory references as (base, disp, is_store)
    so the caller can resolve stack-array aliasing through base registers
    derived from sp.
    """
    m = re.match(r"\s*[0-9a-f]+:\s+[0-9a-f]{8}\s+([a-z0-9]+)\s*(.*)", line)
    if not m:
        return None
    mn, rest = m.group(1), m.group(2)
    reads = []
    dsts = []
    mems = []

    # memory brackets: stack slots become pseudo-registers (sp#offset).
    # Handles [sp, #N], [sp, #N]! and [sp, #-N].
    for bm in re.finditer(r"\[([^\]]+)\]", rest):
        inner = bm.group(1).strip()
        spm = re.match(r"sp\s*,\s*#(-?\d+)", inner)
        genm = re.match(r"([xw]\d+)\s*,\s*#(-?\d+)", inner)
        genm0 = re.match(r"([xw]\d+)", inner)
        if spm:
            mems.append(("sp", int(spm.group(1)), mn in STORE_MN))
        elif genm:
            mems.append((normalize_reg(genm.group(1)),
                         int(genm.group(2)), mn in STORE_MN))
        elif genm0:
            mems.append((normalize_reg(genm0.group(1)), 0, mn in STORE_MN))

    regs = []
    cleaned = re.sub(r"\[[^\]]*\]", "", rest)
    parts = [p.strip() for p in cleaned.split(",") if p.strip()]
    for p in parts:
        for r in REG.findall(p):
            regs.append(r)
    if not regs:
        return mn, dsts, reads, mems

    first = regs[0]
    if mn in NO_DST_MN:
        reads.extend(regs)
    elif mn in LOAD_MN:
        if mn in PAIR_LOAD_MN:
            # ldp x0, x1, [sp, #N]: both registers are destinations.
            dsts.extend(regs[:2])
            reads.extend(regs[2:])
        else:
            dsts.append(first)
            reads.extend(regs[1:])
    else:
        dsts.append(first)
        reads.extend(regs[1:])

    # remove zero registers
    reads = [r for r in reads if r not in ("xzr", "wzr")]
    dsts = [normalize_reg(r) for r in dsts]
    reads = [normalize_reg(r) for r in reads]
    # RMW mnemonics read their destination's previous value.
    if mn in RMW_MN and dsts:
        reads.append(dsts[0])
    return mn, dsts, reads, mems


def estimate_critical_path(text, latency_table=None):
    """Return (critical_path, dist, lines, preds) over objdump text."""
    lat = latency_table or MNEMONIC_LATENCY
    insts = []
    lines = []
    for line in text.splitlines():
        p = parse_inst(line)
        if p:
            mn, dsts, reads, mems = p
            insts.append((mn, dsts, reads, mems, lat.get(mn, 1)))
            lines.append(line)

    last_writer = {}
    preds = [[] for _ in insts]
    stack_bases = set()
    for i, (mn, dsts, reads, mems, _) in enumerate(insts):
        # Track registers derived from sp (add/sub/mov/addvl), then treat
        # their indexed accesses as stack slots so a pass-1 store to the
        # coef array chains into the pass-2 load.
        if mn in ("add", "sub", "mov", "addvl") and "sp" in reads and dsts:
            for d in dsts:
                if d != "sp":
                    stack_bases.add(d)
        for base, disp, is_store in mems:
            # the address base register is an input to every memory access
            if base != "sp":
                reads = reads + [base]
            if base == "sp" or base in stack_bases:
                slot = "%s#%d" % (base, disp)
                if is_store:
                    dsts = dsts + [slot]
                else:
                    reads = reads + [slot]
        for r in reads:
            if r in last_writer:
                preds[i].append(last_writer[r])
        for d in dsts:
            last_writer[d] = i

    dist = []
    best = 0.0
    for i, (mn, dsts, reads, mems, l) in enumerate(insts):
        d = l + max((dist[p] for p in preds[i]), default=0)
        dist.append(d)
        best = max(best, d)
    return best, dist, lines, preds


def load_mnemonic_hist(text):
    hist = defaultdict(int)
    for line in text.splitlines():
        m = re.match(r"\s*[0-9a-f]+:\s+[0-9a-f]{8}\s+([a-z0-9]+)", line)
        if m:
            hist[m.group(1)] += 1
    return dict(hist)
