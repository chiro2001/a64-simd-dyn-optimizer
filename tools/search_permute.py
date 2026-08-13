#!/usr/bin/env python3
"""Search short SVE/NEON lane-permutation sequences for packing tasks.

Given input vectors (each VL/EL lanes, modelled as lists of lane indices)
and target layouts, BFS over {zip1, zip2, uzp1, uzp2, trn1, trn2, rev,
revh, revw} to find a sequence that produces the target. This is the
tool-side of the "fold runtime tbl/tbx packing into zip/uzp/rev" axis:
the emitter can then emit the found sequence instead of index-vector
table lookups.

Usage:
  python3 tools/search_permute.py --targets '0,1,2,3,16,17,18,19,...' \
      --depth 5

For VL=256 16-bit lanes, SVE zip/uzp/trn semantics are hard-coded below.
"""

import argparse
from collections import deque
import itertools
import sys


LANES = 16  # VL=256 / 16-bit


def _zip(a, b, high):
    base = LANES // 2 if high else 0
    out = []
    for k in range(LANES // 2):
        out.append(a[base + k])
        out.append(b[base + k])
    return out


def _uzp(a, b, odd):
    out = []
    for k in range(LANES // 2):
        out.append(a[2 * k + (1 if odd else 0)])
    for k in range(LANES // 2):
        out.append(b[2 * k + (1 if odd else 0)])
    return out


def _trn(a, b, odd):
    out = []
    for k in range(LANES // 2):
        out.append(a[2 * k + (1 if odd else 0)])
        out.append(b[2 * k + (1 if odd else 0)])
    return out


def rev(a):
    return list(reversed(a))


def revh(a):
    out = list(a)
    for k in range(0, LANES, 2):
        out[k], out[k + 1] = out[k + 1], out[k]
    return out


def revw(a):
    out = list(a)
    for k in range(0, LANES, 4):
        out[k:k + 4] = reversed(out[k:k + 4])
    return out


OPS = {
    "zip1": lambda a, b: _zip(a, b, False),
    "zip2": lambda a, b: _zip(a, b, True),
    "uzp1": lambda a, b: _uzp(a, b, False),
    "uzp2": lambda a, b: _uzp(a, b, True),
    "trn1": lambda a, b: _trn(a, b, False),
    "trn2": lambda a, b: _trn(a, b, True),
    "rev": lambda a, b: rev(a),
    "revh": lambda a, b: revh(a),
    "revw": lambda a, b: revw(a),
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--targets", required=True,
                    help="comma-separated target lane indices")
    ap.add_argument("--ninputs", type=int, default=4,
                    help="number of input vectors")
    ap.add_argument("--depth", type=int, default=5)
    ap.add_argument("--ops", default="zip1,zip2,uzp1,uzp2",
                    help="comma-separated ops to use")
    ap.add_argument("--keep", type=int, default=2,
                    help="number of live temporaries kept (register pressure)")
    args = ap.parse_args()

    target = tuple(int(x) for x in args.targets.split(","))
    if len(target) != LANES:
        print("target must have %d lanes, got %d" % (LANES, len(target)),
              file=sys.stderr)
        return 2

    # Inputs: vector i holds lane index i*LANES + j.
    pool = {}
    for i in range(args.ninputs):
        pool["r%d" % i] = tuple(i * LANES + j for j in range(LANES))

    active_ops = {k: OPS[k] for k in args.ops.split(",") if k in OPS}
    queue = deque([(pool, [])])
    seen = {tuple(pool[k] for k in sorted(pool))}
    while queue:
        cur, seq = queue.popleft()
        if len(seq) >= args.depth:
            continue
        names = sorted(cur)
        for op in active_ops:
            for x, y in itertools.product(names, repeat=2):
                nv = tuple(active_ops[op](cur[x], cur[y]))
                if nv == target:
                    print("FOUND (%d ops): %s -> %s"
                          % (len(seq) + 1, " ; ".join(seq + ["%s(%s,%s)" % (op, x, y)]),
                             target))
                    return 0
                newname = "t%d" % len(seq)
                nxt = dict(cur)
                nxt[newname] = nv
                # keep only the most recent temporaries (register pressure)
                temps = sorted(k for k in nxt if k.startswith("t"))
                for stale in temps[:-args.keep]:
                    del nxt[stale]
                key = tuple(nxt[k] for k in sorted(nxt))
                if key not in seen:
                    seen.add(key)
                    queue.append((nxt, seq + ["%s(%s,%s)" % (op, x, y)]))
    print("no sequence found at depth <= %d" % args.depth, file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
