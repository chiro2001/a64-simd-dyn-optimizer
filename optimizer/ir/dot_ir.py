"""Typed dot-product canonicalization for AGO (dct16/dct32 family).

Motivation (docs/62): SDOT.d, SMULLB/SMLALB, VMULL/VMLAL and
unpk+SMUL + mul+saddv all compute the SAME exact-integer dot product

    dot4(acc, a, b) = acc + a0*b0 + a1*b1 + a2*b2 + a3*b3

for 16-bit inputs.  They differ only in operand typing, accumulator
width, coefficient layout and the contract family (upstream-exact vs
legacy-internal-exact adjudicated by TestBenchLite).  This module
canonicalizes `dot_segment` / `mul_reduce` / `neon_mul` op-DAG nodes
into one `dot` node kind carrying typed attrs, and provides the
legality/cost table used by instruction search to choose a lowering.
"""

from __future__ import annotations

from typing import Dict, List, Tuple

from op_ir import Op  # noqa: F401  (re-export for back-compat)


# name -> (a_ty, b_ty, acc_ty, terms_per_op, isa, contract, uop_est)
DOT_LOWERINGS: Dict[str, Tuple[str, str, str, int, str, str, int]] = {
    # SVE1/SVE2 native 4-way widening dot (16-bit -> 64-bit accumulator).
    "sdot.d":      ("s16", "s16", "s64", 4, "sve1", "both", 1),
    # SVE2 widening multiply-accumulate (16-bit -> 32-bit).
    "smullb_smlalb": ("s16", "s16", "s32", 2, "sve2", "both", 2),
    # NEON widening multiply-accumulate (16-bit -> 32-bit).
    "vmull_vmlal": ("s16", "s16", "s32", 2, "neon", "both", 2),
    # SVE1 fallback: unpack s16->s32 then multiply (no widening mul).
    "unpk_svmul":  ("s16", "s16", "s32", 1, "sve1", "both", 2),
    # Generic s32 multiply + horizontal add (pass2 E chain keeps s32).
    "mul_saddv":   ("s32", "s32", "s32", 4, "any", "upstream-exact", 4),
}

# Which contract family a lowering satisfies.  `sdot.d` on pass2 s16
# slices can wrap in rare inputs (0.000078% on 20k), so it needs the
# legacy-internal-exact family + TestBenchLite gate.
CONTRACT_FAMILIES = ("upstream-exact", "legacy-internal-exact")


def make_dot(op_id: str, tile_id: str, terms: Tuple[str, ...],
             acc_ty: str, a_ty: str, b_ty: str, lowering: str,
             out: str = "", lane_owner: str = "output",
             legacy_kind: str = "") -> Op:
    """Build a canonical typed dot node."""
    return Op(op_id, "dot", tile_id, out, terms,
              {"acc_ty": acc_ty, "a_ty": a_ty, "b_ty": b_ty,
               "lowering": lowering, "lane_owner": lane_owner,
               "legacy_kind": legacy_kind})


def canonicalize_dot_ops(ops: List[Op]) -> List[Op]:
    """Normalize dot_segment / mul_reduce / neon_mul nodes to `dot`.

    dot_segment (sdot.d) -> dot(s16,s16,s64,lowering=sdot.d)
    mul_reduce (s32 mul+addv) -> dot(s32,s32,s32,lowering=mul_saddv)
    neon_mul (NEON vmul tree) -> dot(s16,s16,s32,lowering=vmull_vmlal)

    Other node kinds pass through unchanged.  The canonical view is used
    by search/ranking; `expand_dot_lowering` can re-emit legacy kinds.
    """
    out: List[Op] = []
    for op in ops:
        if op.kind == "dot_segment":
            terms = tuple(op.attrs.get("terms", ())) or op.inputs
            out.append(make_dot(
                op.op_id, op.tile_id, terms, "s64", "s16", "s16",
                "sdot.d", op.out, op.attrs.get("lane_owner", "output"),
                legacy_kind="dot_segment"))
        elif op.kind == "mul_reduce":
            out.append(make_dot(
                op.op_id, op.tile_id, op.inputs, "s32", "s32", "s32",
                "mul_saddv", op.out, op.attrs.get("lane_owner", "output"),
                legacy_kind="mul_reduce"))
        elif op.kind == "neon_mul":
            out.append(make_dot(
                op.op_id, op.tile_id, op.inputs, "s32", "s16", "s16",
                "vmull_vmlal", op.out,
                op.attrs.get("lane_owner", "output"),
                legacy_kind="neon_mul"))
        else:
            out.append(op)
    return out


def legal_lowerings(dot: Op, isa: str, contract: str,
                    sve2: bool = False) -> List[Tuple[str, int]]:
    """Return [(lowering, uop_est)] legal for this dot node on target."""
    a_ty = dot.attrs.get("a_ty", "s16")
    b_ty = dot.attrs.get("b_ty", "s16")
    acc_ty = dot.attrs.get("acc_ty", "s64")
    res = []
    for name, (la, lb, lacc, _n, lisa, lcontract, uop) in \
            sorted(DOT_LOWERINGS.items(), key=lambda kv: kv[1][-1]):
        if la != a_ty or lb != b_ty or lacc != acc_ty:
            continue
        if lisa == "sve2" and not sve2:
            continue
        if lisa == "neon" and isa not in ("neon", "sve1"):
            continue
        # SVE2 is a superset of SVE1: sdot.d legal on both.
        if lisa == "sve1" and isa not in ("sve1", "sve2"):
            continue
        # legacy-internal-exact is a superset: upstream-exact lowerings
        # remain legal under it (mul_saddv still allowed, sdot.d added).
        legal = (lcontract == "both" or lcontract == contract or
                 (contract == "legacy-internal-exact" and
                  lcontract == "upstream-exact"))
        if not legal:
            continue
        res.append((name, uop))
    return res


def expand_dot_lowering(dot: Op) -> Op:
    """Re-emit the legacy node kind for existing consumers."""
    kind = dot.attrs.get("legacy_kind")
    if kind in ("dot_segment", "mul_reduce", "neon_mul"):
        return Op(dot.op_id, kind, dot.tile_id, dot.out, dot.inputs,
                  dict(dot.attrs))
    return dot


def dot_summary(ops: List[Op]) -> Dict[str, int]:
    """Count canonical dots by (lowering, acc_ty) for reports."""
    from collections import Counter
    c: Counter = Counter()
    for op in canonicalize_dot_ops(ops):
        if op.kind == "dot":
            c["%s/%s" % (op.attrs["lowering"], op.attrs["acc_ty"])] += 1
    return dict(c)


def select_dot_lowerings(ops: List[Op], isa: str, contract: str,
                         sve2: bool = False) -> Tuple[List[Op], Dict]:
    """Instruction-search scheme: assign each canonical dot node its
    cheapest legal lowering for the target (ISA, contract).

    Returns (ops with attrs['lowering'] set, report dict with per-node
    alternatives and total uop estimate).  Nodes without a legal
    lowering keep their current lowering and are flagged in the report.
    """
    canon = canonicalize_dot_ops(ops)
    report = {"nodes": 0, "selected": {}, "no_legal": [], "total_uop": 0}
    for op in canon:
        if op.kind != "dot":
            continue
        report["nodes"] += 1
        alts = legal_lowerings(op, isa, contract, sve2)
        if not alts:
            report["no_legal"].append(op.tile_id)
            report["selected"][op.tile_id] = op.attrs["lowering"]
            continue
        best = min(alts, key=lambda kv: kv[1])
        op.attrs["lowering"] = best[0]
        report["selected"][op.tile_id] = best[0]
        report["total_uop"] += best[1]
    return canon, report


def dot_lowering_report(ops: List[Op]) -> Dict:
    """Per-dot lowering counts plus legal alternatives for reporting."""
    canon = canonicalize_dot_ops(ops)
    report = {"dots": dot_summary(canon)}
    report["alternatives"] = {}
    for op in canon:
        if op.kind != "dot":
            continue
        key = "%s/%s/%s" % (op.attrs["a_ty"], op.attrs["b_ty"],
                            op.attrs["acc_ty"])
        report["alternatives"].setdefault(key, set()).add(
            op.attrs["lowering"])
    report["alternatives"] = {
        k: sorted(v) for k, v in report["alternatives"].items()}
    return report


def register_canonicalize_dot(rewrites: Dict):
    """Register the canonicalize_dot pass into a REWRITES registry."""
    def rewrite(ops: List[Op]) -> List[Op]:
        return canonicalize_dot_ops(ops)
    rewrites["canonicalize_dot"] = rewrite
    return rewrite


def derive_dot_lowering_flags(canon: List[Op]) -> Dict[str, int]:
    """Translate selected dot lowerings back to emitter plan flags.

    The grouped emitter parameterizes the same decisions as
    `legacy_ex` (pass2 k2 via s16 sdot.d) and `legacy_k4` (pass2 k4 via
    s16 sdot.d).  This closes the loop:
      graph -> canonicalize -> select_dot_lowerings -> flags -> emitter.
    """
    flags = {"legacy_ex": 0, "legacy_k4": 0}
    for op in canon:
        if op.kind != "dot" or op.attrs.get("lowering") != "sdot.d":
            continue
        tid = op.tile_id
        if tid.startswith("p2.k2"):
            flags["legacy_ex"] = 1
        elif tid.startswith("p2.k4"):
            flags["legacy_k4"] = 1
    return flags
