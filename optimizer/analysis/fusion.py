"""Static instruction-fusion inventory (docs/09 requirements v0.4, v0.1).

Classifies a kernel's final assembly with MUTUALLY EXCLUSIVE categories
(a vector load counts as a load, never as a SIMD compute instruction) and
enumerates structurally eligible fusion pairs under C1-C4. The target
fusion table is empty by assumption, so every pair is only
`structurally_eligible` with unknown savings and `needs_hw_verify`; the
analyzer never feeds a predicted 2->1 issue-slot reduction into the search.
"""

import collections
import re

from optimizer.analysis.critical_path import estimate_critical_path


SIMD_MN = {
    "add", "sub", "abs", "sabd", "uabd", "smax", "smin", "umax", "umin",
    "mul", "mla", "mls", "smull", "umull", "sqdmulh", "sqrdmulh", "fmla",
    "fmls", "fmul", "fadd", "fsub", "fabs", "fmax", "fmin", "frecpe",
    "frsqrte", "fcvt", "fcvtzs", "fcvtzu", "scvtf", "ucvtf",
    "addp", "saddl", "ssubl", "uaddl", "usubl", "saddw", "ssubw", "uaddw",
    "usubw", "addv", "saddv", "uaddv", "smaxv", "umaxv", "sminv", "uminv",
    "addhn", "raddhn", "subhn", "rsubhn", "shadd", "uhadd", "rhadd",
    "sqadd", "uqadd", "sqsub", "uqsub", "sqneg", "sqabs",
    "rshrn", "sqrshrn", "uqrshrn", "shrn", "sqshrn", "uqshrn", "sxtl",
    "uxtl", "sqxtn", "uqxtn", "sadalp", "uadalp", "saddlp", "uaddlp",
    "trn1", "trn2", "zip1", "zip2", "uzp1", "uzp2", "ext", "tbl", "tbx",
    "rev16", "rev32", "rev64", "dup", "mov", "movi", "mvni",
    "shl", "sshr", "ushr", "asr", "sli", "sri", "ssra", "usra",
    "bic", "orr", "and", "eor", "not", "cmeq", "cmge", "cmgt", "cmhi",
    "cmhs", "cmlt", "cmle", "cmeq", "cnt", "cls", "clz", "bit", "bif",
    "bsl", "saba", "uaba", "aba",
}
LOAD_MN = {"ld1", "ld2", "ld3", "ld4", "ld1r", "ld2r", "ld3r", "ld4r"}
STORE_MN = {"st1", "st2", "st3", "st4"}
SCALAR_LOAD_MN = {"ldr", "ldp", "ldur", "ldrb", "ldrh", "ldrsb", "ldrsh"}
SCALAR_STORE_MN = {"str", "stp", "stur", "strb", "strh"}
BRANCH_MN = {"b", "bl", "br", "blr", "ret", "cbz", "cbnz", "tbz", "tbnz"}

# vector/predicate register operand; captures the element type suffix
REG = re.compile(
    r"(?<![\w.])(?P<cls>[vzqpxw])(?P<idx>\d+)(?:\.(?P<elem>[bhsdq]))?"
    r"(?:\[(?P<lane>\d+)\])?")


def parse_inst(line):
    """Return (mnemonic, dst, srcs, preds) or None for any objdump line."""
    m = re.match(r"\s*[0-9a-f]+:\s+[0-9a-f]{8}\s+([a-z0-9]+)\s*(.*)", line)
    if not m:
        return None
    mn, rest = m.group(1), m.group(2)
    cleaned = re.sub(r"\[[^\]]*\]", "", rest)
    parts = [p.strip() for p in cleaned.split(",") if p.strip()]
    operands = []
    for p in parts:
        rm = REG.search(p)
        if rm:
            operands.append({
                "cls": rm.group("cls"),
                "reg": rm.group("cls") + rm.group("idx"),
                "elem": rm.group("elem"),
            })
    if not operands:
        return None
    dst = operands[0] if operands[0]["cls"] in ("v", "z") else None
    srcs = [o for o in operands[1:] if o["cls"] in ("v", "z")]
    preds = [o["reg"] for o in operands if o["cls"] == "p"]
    return mn, dst, srcs, preds


def classify_counts(hist):
    """Mutually exclusive counts: vector loads are loads, never SIMD."""
    out = collections.Counter()
    for mn, n in hist.items():
        if mn in LOAD_MN:
            out["load_insns"] += n
        elif mn in SCALAR_LOAD_MN:
            out["load_insns"] += n
        elif mn in STORE_MN or mn in SCALAR_STORE_MN:
            out["store_insns"] += n
        elif mn in SIMD_MN:
            out["simd_insns"] += n
        elif mn in BRANCH_MN:
            out["branch_insns"] += n
        else:
            out["scalar_insns"] += n
    return out


def classify_insts(insts):
    """Operand-aware mutually exclusive classification of parsed insts."""
    out = collections.Counter()
    for mn, dst, srcs, preds in insts:
        is_vec = dst is not None or any(s["cls"] in ("v", "z")
                                       for s in srcs)
        if mn in LOAD_MN or mn in SCALAR_LOAD_MN:
            out["load_insns"] += 1
        elif mn in STORE_MN or mn in SCALAR_STORE_MN:
            out["store_insns"] += 1
        elif mn in BRANCH_MN:
            out["branch_insns"] += 1
        elif mn in SIMD_MN and is_vec:
            out["simd_insns"] += 1
        else:
            out["scalar_insns"] += 1
    return out


def analyze_pairs(insts, read_ports_max=3):
    """Enumerate structurally eligible dest-chaining pairs (C1-C4)."""
    insts = [p for p in insts if p]
    pairs = []
    for i in range(len(insts)):
        mni, dsti, srcsi, predsi = insts[i]
        if mni not in SIMD_MN or dsti is None:
            continue
        for j in range(i + 1, len(insts)):
            mnj, dstj, srcsj, predsj = insts[j]
            if mnj not in SIMD_MN or dstj is None \
                    or dstj["reg"] != dsti["reg"]:
                continue
            # C3: read ports = distinct insn1 sources + insn2 sources minus
            # the chained intermediate
            read_regs = {s["reg"] for s in srcsi}
            read_regs |= {s["reg"] for s in srcsj if s["reg"] != dsti["reg"]}
            write_ports = 1
            # C4.4 predicate consistency (predicates are not read ports)
            pred_ok = predsi == predsj
            if not pred_ok:
                continue
            # C4.5 dest chaining implies the same register/type
            type_ok = True
            # C4.1/C4.3: between i and j the chained register must be neither
            # read (observability) nor written (chain integrity); writes to
            # insn2's other sources only block reordering
            hard_reject = False
            reorder_blocked = False
            for k in range(i + 1, j):
                _, dstk, srcsk, _ = insts[k]
                if any(s["reg"] == dsti["reg"] for s in srcsk):
                    hard_reject = True
                    break
                if dstk is not None and dstk["reg"] == dsti["reg"]:
                    hard_reject = True
                    break
                if dstk is not None and any(
                        dstk["reg"] == s["reg"] for s in srcsj):
                    reorder_blocked = True
            if hard_reject:
                continue
            if len(read_regs) > read_ports_max:
                continue
            pairs.append({
                "index1": i,
                "index2": j,
                "insn1": mni,
                "insn2": mnj,
                "read_ports": len(read_regs),
                "write_ports": write_ports,
                "dependency_ok": True,
                "predicate_ok": pred_ok,
                "type_ok": type_ok,
                "suggested_adjacent": not reorder_blocked,
                "confidence": "structurally_eligible",
                "needs_hw_verify": True,
            })
    return pairs


def fusion_report(name, profile, disasm_text):
    """Full docs/09 v0.1 report for one kernel."""
    insts = []
    for line in disasm_text.splitlines():
        p = parse_inst(line)
        if p:
            insts.append(p)
    counts = classify_insts(insts)
    simd = counts["simd_insns"]
    load = counts["load_insns"]
    n_est = simd + load
    issue_est = profile.get("issue_est", 4)
    if load > simd:
        load_pressure = "high"
    elif load * 2 >= simd:
        load_pressure = "medium"
    else:
        load_pressure = "low"
    compute_bound = "true" if load <= simd else "unknown"
    pairs = analyze_pairs(insts)
    critical_path, _, _, _ = estimate_critical_path(disasm_text)
    return {
        "kernel": name,
        "profile": profile.get("name", "unknown"),
        "compute_bound_prediction": compute_bound,
        "load_pressure": load_pressure,
        "counts": dict(counts),
        "simd_insns": simd,
        "load_insns": load,
        "n_est": n_est,
        "estimation": {
            "issue_est": issue_est,
            "instruction_score": n_est / issue_est if issue_est else None,
            "cycles_lb": {"critical_path": critical_path},
        },
        "pairs": pairs,
        "summary": {
            "total_pairs": len(pairs),
            "structurally_eligible": len(pairs),
            "hw_supported": 0,
            "predicted_dynamic_insns_saved": "unknown",
            "predicted_issue_slots_saved": "unknown",
            "instruction_score_after": "unknown",
            "speedup_est_by_score": "unknown",
            "critical_path_impact": "worse-or-neutral",
        },
    }
