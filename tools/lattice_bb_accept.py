#!/usr/bin/env python3
"""Run the generic lattice B&B acceptance on a measured combo table.

Accepts a JSON file that is either a list of rows with a cost field
("fused") or {"combo": [..], "fused": ..}, or a dict {"combos": ...}.
For the satd dataset the combo is (shape, reduce, abs); for dct32 it is
the row's "combo" list.

Usage:
  python3 tools/lattice_bb_accept.py experiments/m31-satd8-axis-search/results.json
  python3 tools/lattice_bb_accept.py build/dct32-axis-bb/results.json
"""

import json
import sys

from lattice_bb import acceptance, bb_search


def load_combos(path):
    data = json.load(open(path))
    combos = {}
    for row in data:
        if "combo" in row:
            combo = tuple(row["combo"])
        elif "shape" in row:
            combo = (row["shape"], row["reduce"], row["abs"])
        else:
            combo = (row.get("tag"),)
        cost = row.get("fused", row.get("cost"))
        if cost is None:
            counts = row.get("counts") or {}
            cost = counts.get("vector_fused_uop")
        if cost is None:
            continue
        combos[combo] = int(cost)
    return combos


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    combos = load_combos(sys.argv[1])
    rep = acceptance(combos)
    print("candidates=%d full_best=%d bb_best=%s same_best=%s "
          "explored=%d pruned=%d node_reduction=%.2fx gate_met=%s"
          % (rep["candidates"], rep["full_best"], rep["bb_best"],
             rep["same_best"], rep["explored"], rep["pruned"],
             rep["node_reduction"], rep["gate_met"]))
    return 0 if rep["gate_met"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
