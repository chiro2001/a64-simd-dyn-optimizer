"""Lane-granular def-use provenance for the fused8 op DAGs.

docs/65 §2: op inputs/out are whole-vector references; lane mapping is
implicit in op semantics. This module makes it explicit and checkable:
for every op it derives per-output-lane -> per-input-lane consumption
maps, then verifies (a) every consumed lane is defined and in range,
(b) every store lane back-traces through the def chain to load lanes
with no undefined or cyclic contributions.

Covered kinds are those emitted by the fused8 DAG builders
(dct16_op_ir.lower_pass1/2_fused8, dct32_fused8_op_ir).
"""

from __future__ import annotations

from typing import Dict, List, Optional, Tuple

from op_ir import Op


LaneSet = Tuple[int, ...]
LaneMap = Tuple[LaneSet, ...]          # per output lane: consumed input lanes
InputMaps = Tuple[LaneMap, ...]        # per input value


def _e(n: int) -> LaneMap:
    return tuple((i,) for i in range(n))


def lane_semantics(op: Op) -> Tuple[int, InputMaps]:
    """Per-op (n_out_lanes, per-input lane maps).

    map[i][j] = tuple of input-lane indices consumed to produce output
    lane j of input i; empty tuple means the lane is not consumed.
    """
    kind = op.kind
    attrs = op.attrs
    n_in = len(op.inputs)

    if kind == "load":
        return 8, ()
    if kind == "load_u8x16":
        return 16, ()
    if kind == "load_diff":
        return 8, ()
    if kind == "load_diff16":
        return 8, ()
    if kind == "dup16":
        return 8, ()
    if kind == "dup32":
        return 4, ()
    if kind == "dup8":
        return 16, ()
    if kind == "dup_u8":
        return 8, ()
    if kind == "dup64":
        return 2, ()
    if kind == "edge":
        return 16, ()
    if kind == "load32":
        return 4, ()
    if kind == "permute":
        pk = attrs["kind"]
        if pk == "rev16":
            return 8, (_e(8)[::-1],)
        if pk == "rev32":
            m = tuple((i,) for i in (3, 2, 1, 0))
            return 4, (m,)
        if pk == "zip1q":
            m0 = ((0,), (1,), (), ())
            m1 = ((), (), (0,), (1,))
            return 4, (m0, m1)
        if pk == "zip2q":
            m0 = ((2,), (3,), (), ())
            m1 = ((), (), (2,), (3,))
            return 4, (m0, m1)
        if pk == "rev64q":
            m = tuple((i,) for i in (1, 0, 3, 2))
            return 4, (m,)
        if pk == "trn1q_s16":
            m0 = ((0,), (), (1,), (), (2,), (), (3,), ())
            m1 = ((), (0,), (), (1,), (), (2,), (), (3,))
            return 8, (m0, m1)
        if pk == "trn2q_s16":
            m0 = ((4,), (), (5,), (), (6,), (), (7,), ())
            m1 = ((), (4,), (), (5,), (), (6,), (), (7,))
            return 8, (m0, m1)
        if pk == "trn1q_s32":
            m0 = ((0,), (1,), (), (), (4,), (5,), (), ())
            m1 = ((), (), (0,), (1,), (), (), (4,), (5,))
            return 8, (m0, m1)
        if pk == "trn2q_s32":
            m0 = ((2,), (3,), (), (), (6,), (7,), (), ())
            m1 = ((), (), (2,), (3,), (), (), (6,), (7,))
            return 8, (m0, m1)
        if pk == "trn1q_s64":
            m0 = ((0,), (1,), (2,), (3,), (), (), (), ())
            m1 = ((), (), (), (), (0,), (1,), (2,), (3,))
            return 8, (m0, m1)
        if pk == "trn2q_s64":
            m0 = ((), (), (), (), (4,), (5,), (6,), (7,))
            m1 = ((), (), (), (), (4,), (5,), (6,), (7,))
            return 8, (m0, m1)
        raise ValueError("lane semantics: permute %s" % pk)
    if kind == "vget":
        if attrs.get("elem") == "u8":
            base = 0 if attrs["which"] == "lo" else 8
            return 8, (tuple((base + i,) for i in range(8)),)
        base = 0 if attrs["which"] == "lo" else 4
        return 4, (tuple((base + i,) for i in range(4)),)
    if kind == "vabal":
        return 8, (_e(8), _e(8), _e(8))
    if kind == "rhadd":
        return 16, (_e(16), _e(16))
    if kind == "store_u8x16":
        return 16, (_e(16),)
    if kind == "vabdl_u8":
        return 8, (_e(8), _e(8))
    if kind in ("vsubl_u8", "vaddl_u8"):
        return 8, (_e(8), _e(8))
    if kind == "vadd_u16":
        return 8, (_e(8), _e(8))
    if kind in ("vmlal_u8", "vmlsl_u8"):
        return 8, (_e(8), _e(8), _e(8))
    if kind == "reinterpret_s16":
        return 8, (_e(8),)
    if kind == "vmlaq_n_s16":
        return 8, (_e(8), _e(8))
    if kind == "vqrshrun":
        return 8, (_e(8),)
    if kind == "combine_u8":
        m0 = ((0,), (1,), (2,), (3,), (4,), (5,), (6,), (7,),
              (), (), (), (), (), (), (), ())
        m1 = ((), (), (), (), (), (), (), (),
              (0,), (1,), (2,), (3,), (4,), (5,), (6,), (7,))
        return 16, (m0, m1)
    if kind in ("vmull_u16", "vmull_u8"):
        if kind == "vmull_u8":
            return 8, (_e(8), _e(8))
        return 4, (_e(4), _e(4))
    if kind == "vadd_u32":
        return 4, (_e(4), _e(4))
    if kind == "widen_add":
        return 4, (_e(4), _e(4))
    if kind == "abs":
        return 8, (_e(8),)
    if kind == "abd":
        return 8, (_e(8), _e(8))
    if kind == "max":
        return 8, (_e(8), _e(8))
    if kind == "vceq":
        return 16, (_e(16),)
    if kind in ("vpadal_s8", "vpadal_u8"):
        pairs = tuple((2 * j, 2 * j + 1) for j in range(8))
        return 8, (_e(8), pairs)
    if kind == "vzip1_s8":
        m0 = tuple((j // 2,) if j % 2 == 0 else () for j in range(16))
        m1 = tuple((j // 2,) if j % 2 == 1 else () for j in range(16))
        return 16, (m0, m1)
    if kind == "vzip2_s8":
        m0 = tuple((8 + j // 2,) if j % 2 == 0 else () for j in range(16))
        m1 = tuple((8 + j // 2,) if j % 2 == 1 else () for j in range(16))
        return 16, (m0, m1)
    if kind == "dot_stats":
        if op.attrs.get("target") == "sve":
            pairs = ((0, 1, 2, 3), (4, 5, 6, 7))
            return 2, (_e(2), pairs, pairs)
        if len(op.inputs) == 3:
            return 8, (_e(8), _e(8), _e(8))
        return 8, (_e(8), _e(8))
    if kind == "histseg_count":
        return 16, (_e(16), _e(16))
    if kind == "hist_count_reduce":
        return 4, (((0, 1), (2, 3), (4, 5), (6, 7)),)
    if kind == "store_add32":
        return 4, (_e(4), _e(4))
    if kind == "scalar_add_lane":
        return 1, (((8, 9),),)
    if kind == "vmovn_combine":
        return 4, (((0,), (1,), (), ()), ((), (), (0,), (1,)))
    if kind == "vaddv_s64":
        return 1, (((0, 1),),)
    if kind in ("vpadal_s16", "vpadal_u16"):
        pairs = tuple((2 * j, 2 * j + 1) for j in range(4))
        return 4, (_e(4), pairs, pairs)
    if kind in ("add", "sub"):
        n = 8 if attrs["elem"] in ("s16", "u16") else 4
        return n, (_e(n), _e(n))
    if kind == "vpadd_s16":
        m = ((0, 1), (2, 3), (4, 5), (6, 7), (), (), (), ())
        m2 = ((), (), (), (), (0, 1), (2, 3), (4, 5), (6, 7))
        return 8, (m, m2)
    if kind == "vpadd_s32":
        m = ((0, 1), (2, 3), (), ())
        m2 = ((), (), (0, 1), (2, 3))
        return 4, (m, m2)
    if kind in ("vpaddl_s16", "vpaddl_u16"):
        return 4, (((0, 1), (2, 3), (4, 5), (6, 7)),)
    if kind == "neon_narrow4":
        return 4, (_e(4),)
    if kind == "neon_combine":
        m0 = ((0,), (1,), (2,), (3,), (), (), (), ())
        m1 = ((), (), (), (), (0,), (1,), (2,), (3,))
        return 8, (m0, m1)
    if kind == "dot_segment":
        m = ((0, 1, 2, 3), (4, 5, 6, 7))
        return 2, (m,)
    if kind == "dot_accum":
        m_acc = ((0,), (1,))
        m_data = ((0, 1, 2, 3), (4, 5, 6, 7))
        return 2, (m_acc, m_data)
    if kind == "neon_reduce_narrow":
        maps = []
        for i in range(4):
            per = []
            for j in range(4):
                per.append((0, 1) if i == j else ())
            maps.append(tuple(per))
        return 4, tuple(maps)
    if kind == "neon_mul":
        return 4, (_e(4),)
    if kind == "neon_mla":
        return 4, (_e(4), _e(4))
    if kind == "neon_padd":
        m0 = ((0, 1), (2, 3), (), ())
        m1 = ((), (), (0, 1), (2, 3))
        return 4, (m0, m1)
    if kind == "neon_narrow":
        return 4, (_e(4),)
    if kind == "vpaddl":
        return 4, (((0, 1), (2, 3), (4, 5), (6, 7)),)
    if kind == "vpadal":
        return 4, (_e(4), ((0, 1), (2, 3), (4, 5), (6, 7)))
    if kind == "vaddv":
        return 1, (((0, 1, 2, 3),),)
    if kind == "vaddv_s16":
        return 1, (((0, 1, 2, 3, 4, 5, 6, 7),),)
    if kind == "vaddv_s32":
        return 1, (((0, 1, 2, 3),),)
    if kind == "vaddv_u32":
        return 1, (((0, 1, 2, 3),),)
    if kind == "vaddlv_u32":
        return 1, (((0, 1, 2, 3),),)
    if kind == "pack_var":
        return 1, ((), ())
    if kind == "vaddlv":
        return 1, (((0, 1, 2, 3, 4, 5, 6, 7),),)
    if kind == "store_sub32":
        return 4, (_e(4), _e(4))
    if kind == "scalar_sub":
        return 1, (((0,),),)
    if kind == "scalar_add2":
        return 1, (((0,),), ((0,),))
    if kind == "store":
        # store consumes all 4 input lanes (output lane coords in attrs).
        return 4, (_e(4),)
    raise ValueError("lane semantics: kind %s" % kind)


def defuse_report(ops: List[Op]) -> Dict:
    """Lane-level def-use validation over a fused8 DAG."""
    issues: List[str] = []
    n_lanes: Dict[str, int] = {}
    maps: Dict[str, InputMaps] = {}

    for op in ops:
        try:
            n_out, im = lane_semantics(op)
        except ValueError as e:
            issues.append("%s: %s" % (op.op_id, e))
            continue
        if op.out:
            n_lanes[op.out] = n_out
            maps[op.out] = im
        for idx, name in enumerate(op.inputs):
            if not name:
                continue
            if name not in n_lanes:
                issues.append("%s: input %s undefined" % (op.op_id, name))
                continue
            if idx >= len(im):
                issues.append("%s: missing lane map for input %s"
                              % (op.op_id, name))
                continue
            for j, consumed in enumerate(im[idx]):
                for lane in consumed:
                    if lane >= n_lanes[name]:
                        issues.append("%s: input %s lane %d out of range "
                                      "(n=%d)" % (op.op_id, name, lane,
                                                  n_lanes[name]))

    # Build op-by-op chains directly (map table is indexed by input
    # position, so back-trace needs the producing op's input names).
    producers: Dict[str, Op] = {}
    for op in ops:
        if op.out:
            producers[op.out] = op

    def trace2(name: str, lane: int, seen) -> Optional[str]:
        key = (name, lane)
        if key in seen:
            return "cycle at %s lane %d" % key
        seen = seen | {key}
        op = producers.get(name)
        if op is None:
            return None  # load root
        _, im = lane_semantics(op)
        for idx, iname in enumerate(op.inputs):
            if idx >= len(im):
                continue
            if iname == name:
                # Accumulate chain: the op redefines its own output name
                # (dot_accum over the dot_segment result). The self edge
                # is the previous value of the same chain, not a cycle.
                continue
            for cl in im[idx][lane]:
                err = trace2(iname, cl, seen)
                if err:
                    return err
        return None

    stores = [op for op in ops if op.kind == "store"]
    if stores:
        roots = stores
    else:
        # Scalar-return kernels (e.g. satd): root is the terminal op.
        consumed = {name for op in ops for name in op.inputs if name}
        roots = [op for op in ops if op.out and op.out not in consumed]
        if not roots:
            roots = [op for op in ops if op.kind == "vaddv"]
    if not roots:
        issues.append("no stores or terminal ops to validate")
    for op in roots:
        _, im = lane_semantics(op)
        n_l = len(im[0]) if im else 1
        for lane in range(n_l):
            err = trace2(op.inputs[0], lane, frozenset())
            if err:
                issues.append("%s: store lane %d: %s"
                              % (op.op_id, lane, err))

    return {
        "ops": len(ops),
        "stores": len(stores),
        "issues": issues,
        "ok": not issues,
    }


def annotate(ops: List[Op]) -> List[Op]:
    """Return ops with explicit lane edges attached as attributes.

    Each op gains `n_out` (output lane count) and `lane_in` (per input
    value, per output lane: list of consumed input lane indices), making
    the lane-granular def-use edges part of the DAG representation.
    """
    out = []
    for op in ops:
        try:
            n_out, im = lane_semantics(op)
        except ValueError:
            n_out, im = 0, ()
        attrs = dict(op.attrs)
        attrs["n_out"] = n_out
        attrs["lane_in"] = [[list(l) for l in m] for m in im]
        out.append(Op(op.op_id, op.kind, op.tile_id, op.out, op.inputs,
                      attrs))
    return out
