#!/usr/bin/env python3
"""Reproducible discovery report for the DCT16 shared-constant-matrix shape.

Inputs:
  - a QEMU dynamic trace JSON from tools/parse_qemu_trace.py
  - the traced ELF's .rodata dump (vaddr -> bytes), so constant loads and
    tbl index vectors resolve to numeric values

Output:
  - stdout summary: how many narrow outputs match
      out[i] = dot(C1, X_i) + dot(C2, Y_i)  (C1/C2 shared across lanes)
  - JSON report under experiments/...: every hit with its coefficient
    vectors, per-lane leaf ids, shared-leaf grouping, and the raw-load
    expansion each leaf maps to (the pre-permuted C' folding plan).

The report is the contract for the emitter: it must reproduce each hit's
coefficient vectors from raw loads only, so the runtime tbl/rev chains die.
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from optimizer.ir.asm_ir import import_asm_trace, resolve_constants
from optimizer.analysis.asm_linearize import (
    expand_to_raw, lane_forms_asm, shared_constant_matrix_outputs)


def load_rodata(path, vaddr):
    """Map every 16-byte window of a raw .rodata dump to its vaddr."""
    data = open(path, "rb").read()
    return {vaddr + i: data[i:i + 16] for i in range(0, len(data) - 15)}


def clean(c):
    """Coefficient floats that are integers stay integers in the report."""
    return int(c) if float(c).is_integer() else c


def raw_serializable(raw):
    """Turn {(leaf_id, lane): coeff} terms into JSON-safe string keys."""
    out = []
    for lane in raw:
        out.append([{"leaf": k[0], "lane": k[1], "coeff": clean(v)}
                    for k, v in sorted(lane.items())])
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("trace_json")
    ap.add_argument("rodata_bin")
    ap.add_argument("--rodata-vaddr", type=lambda x: int(x, 0),
                    default=0x457000)
    ap.add_argument("--out", default=None,
                    help="JSON report path (default: next to the trace)")
    args = ap.parse_args()

    trace = json.load(open(args.trace_json))
    rodata = load_rodata(args.rodata_bin, args.rodata_vaddr)
    nodes, vec, lw = import_asm_trace(trace["instructions"])
    resolve_constants(nodes, rodata)
    forms = lane_forms_asm(nodes)
    hits = shared_constant_matrix_outputs(nodes, forms)

    report = {
        "trace": args.trace_json,
        "dynamic_insns": len(nodes),
        "vector_insns": len(vec),
        "hits": [],
        "summary": {},
    }
    for h in hits:
        consts = [[clean(c) for c in v] for v in h["consts"]]
        raw_forms = []
        for lane in h["leaves"]:
            lane_raw = []
            for leaf_id, _ in lane:
                f = forms.get(leaf_id)
                lane_raw.append(expand_to_raw(f, nodes, forms)
                                if f is not None else [{}])
            raw_forms.append(lane_raw)
        report["hits"].append({
            "node_id": h["node_id"],
            "mn": h["mn"],
            "consts": consts,
            "leaves": h["leaves"],
            "raw": [[raw_serializable(l) for l in lane] for lane in raw_forms],
        })

    # shared-leaf grouping: which hits consume the same leaf ids
    by_leaf = {}
    for h in report["hits"]:
        for lane in h["leaves"]:
            for leaf_id, _ in lane:
                by_leaf.setdefault(leaf_id, []).append(h["node_id"])
    shared = {str(k): sorted(v) for k, v in by_leaf.items() if len(v) > 1}

    report["summary"] = {
        "hits": len(report["hits"]),
        "shared_leaf_ids": len(shared),
        "const_vecs": sorted({tuple(c) for h in report["hits"]
                              for c in h["consts"]}),
        "leaf_to_hits": shared,
    }

    out = args.out
    if out is None:
        base = os.path.dirname(os.path.abspath(args.trace_json))
        out = os.path.join(base, "shared-matrix-discovery.json")
    with open(out, "w") as f:
        json.dump(report, f, indent=1)

    print("dynamic=%d vector=%d hits=%d shared_leaf_ids=%d"
          % (len(nodes), len(vec), len(report["hits"]),
             report["summary"]["shared_leaf_ids"]))
    for c in report["summary"]["const_vecs"][:4]:
        print("  C = %s" % (list(c),))
    print("report -> %s" % out)


if __name__ == "__main__":
    main()
