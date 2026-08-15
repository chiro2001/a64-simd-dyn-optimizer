"""Analytical cost prediction for AGO covers (round-0024 formula).

predicted = max(critical_path_latency, throughput_resource_bound)
            + load/store term + spill/branch penalty

Never multiply latency by throughput. Throughput bound is the sum of
reciprocal-throughput cycles over all ops (resource use on a single
execution pipeline is a lower bound on the schedule length); the
critical path is the sum of latencies along the longest source-level
dependency chain. Op classes use the N1/920B cost-table keys with the
documented proxies (trn->add_u16, uaddlv->paddl_u16, vsubl->addl_u8,
vsubq->sub_u8, vabd->abd_u8, vmaxq->maxv_u8, scalar add->add_u8).
Missing keys fall back to the table "empty" cost.
"""

from __future__ import annotations

from typing import Dict


def _cost(table: Dict, op: str) -> Dict:
    empty = table.get("empty", {"latency_cyc": 1.0,
                                "throughput_cyc_per_op": 1.0})
    c = dict(table.get(op, empty))
    # null entries in the raw tables mean "not measured"; never treat
    # them as zero (round-0024). Fill with the empty-loop cost.
    for k in ("latency_cyc", "throughput_cyc_per_op"):
        if not c.get(k):
            c[k] = empty.get(k, 1.0)
    return c


def predict(cp_chain: list, tput_ops: list, table: Dict,
            spill_penalty: int = 0) -> Dict:
    cp_lat = sum(float(_cost(table, op).get("latency_cyc") or 0.0)
                 for op in cp_chain)
    tput = sum(float(_cost(table, op).get("throughput_cyc_per_op") or 0.0)
               for op in tput_ops)
    pred = max(cp_lat, tput) + float(spill_penalty)
    return {"cp_lat": round(cp_lat, 3), "tput_sum": round(tput, 3),
            "predicted_cyc": round(pred, 3),
            "spill_penalty": int(spill_penalty)}


def predict_cover(cover_meta: Dict, cover: str, table: Dict,
                  features: Dict = None) -> Dict:
    spill = 0
    if features:
        spill = int(features.get("spill_reload_heuristic", 0)) * 4
    return predict(cover_meta["cp_chains"][cover],
                   cover_meta["tail_ops"][cover], table, spill)


_CLASS_TABLE_KEY = {
    "ld_vec": "ld1_u8",
    "st_vec": "st1_u8",
    "add": "add_u16",
    "sub": "sub_u8",
    "abs": "abs_s16",
    "max": "maxv_u8",
    "trn": "add_u16",
    "mul": "sdot",
    "branch": "empty",
}


def predict_from_features(cover_meta: Dict, cover: str, table: Dict,
                          features: Dict) -> Dict:
    """Final-object prediction: throughput bound from the measured
    instruction mix (count x reciprocal throughput), critical path from
    the source-level chain. pred = max(cp, tput) + spill penalty."""
    tput_ops = []
    for cls, cnt in features.get("insn_by_class", {}).items():
        key = _CLASS_TABLE_KEY.get(cls)
        if key:
            tput_ops.extend([key] * int(cnt))
    cp_chain = cover_meta["cp_chains"][cover]
    spill = int(features.get("spill_reload_heuristic", 0)) * 4
    return predict(cp_chain, tput_ops, table, spill)
