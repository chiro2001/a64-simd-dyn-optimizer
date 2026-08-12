"""Linear-form evaluator over PackIR lane provenance.

Each linear lane is a dict {(row, col): signed_coefficient} in units of
D = A - B (pix1 contributes +1, pix2 contributes -1). Nonlinear ops
(abs/sabd/umax) mark a value nonlinear; the evaluator then refuses to
propagate through them, so the IR-level guard catches any candidate that
feeds nonlinear ops from unproven/unknown lanes.
"""

from functools import lru_cache


def _linear_from_pixel(lane):
    if lane.get("kind") != "pixel":
        return None
    sign = 1 if lane["base"] == "pix1" else -1
    return {(lane["row"], lane["col"]): sign}


def _add_forms(a, b, sign_b=1):
    out = dict(a)
    for k, v in b.items():
        out[k] = out.get(k, 0) + sign_b * v
    return {k: v for k, v in out.items() if v}


class LaneEvaluator:
    def __init__(self, pack_values):
        self.lanes = {v["id"]: v["lanes"] for v in pack_values}

    @lru_cache(maxsize=None)
    def eval(self, vid, lane_idx):
        lane = self.lanes[vid][lane_idx]
        if "from" in lane:
            return self.eval(lane["from"], lane["lane"])
        if "kind" in lane and lane["kind"] == "pixel":
            return _linear_from_pixel(lane)
        if "arith" in lane:
            arith = lane["arith"]
            if arith in ("add", "sub"):
                a = self.eval(lane["a"]["from"], lane["a"]["lane"])
                if a is None:
                    return None
                if "b" not in lane:
                    return a
                b = self.eval(lane["b"]["from"], lane["b"]["lane"])
                if b is None:
                    return None
                return _add_forms(a, b, -1 if arith == "sub" else 1)
            if arith in ("abs", "sabd", "umax"):
                return None  # nonlinear
        return None

    def is_linear(self, vid):
        return all(self.eval(vid, i) is not None
                   for i in range(len(self.lanes[vid])))


def summarize(pack_ir_doc):
    """Return per-value linearity and max coefficient magnitude."""
    ev = LaneEvaluator(pack_ir_doc["values"])
    out = {}
    for vid, lanes in ev.lanes.items():
        forms = [ev.eval(vid, i) for i in range(len(lanes))]
        linear = all(f is not None for f in forms)
        maxc = 0
        if linear:
            for f in forms:
                maxc = max(maxc, *(abs(v) for v in f.values()))
        out[vid] = {"lanes": len(lanes), "linear": linear, "max_coef": maxc}
    return out
