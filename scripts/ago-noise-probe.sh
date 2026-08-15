#!/usr/bin/env bash
# AGO M2-expanded noise probe (round-0024 experiment 1, first step):
# duplicate-baseline q_target on a target machine.
#
# Usage: scripts/ago-noise-probe.sh BINARY [RUNS=10] [BATCH=4096]
#   BINARY  the ago microbench binary (e.g. build/ago_satd8_microbench)
#   RUNS    number of independent process launches (default 10; must be even)
#
# Prints raw medians and q_target = 95th percentile of |log(t2i/t2i+1)|
# over consecutive launch pairs. Preregistration rule (round-0024):
# MDE = max(2*q_target, 1%); if MDE > 5% on a shared host, the upcoming
# ranking verdict is inconclusive-noise, not a model failure.
set -euo pipefail

BIN="${1:?usage: ago-noise-probe.sh BINARY [RUNS] [BATCH]}"
RUNS="${2:-10}"
BATCH="${3:-4096}"

if [ $((RUNS % 2)) -ne 0 ]; then
    echo "RUNS must be even" >&2
    exit 2
fi

for _ in $(seq "$RUNS"); do
    "$BIN" neon 20 "$BATCH" | awk -F, '{print $4}' | cut -d= -f2
done | python3 -c '
import math, sys
vals = [int(x) for x in sys.stdin if x.strip()]
assert len(vals) % 2 == 0, "odd sample count"
pairs = [(vals[i], vals[i + 1]) for i in range(0, len(vals), 2)]
ratios = sorted(abs(math.log(a / b)) for a, b in pairs)
q = ratios[int(len(ratios) * 0.95) - 1] if ratios else 0.0
mde = max(2 * q, 0.01)
print("runs=%d pairs=%d" % (len(vals), len(pairs)))
for i, (a, b) in enumerate(pairs):
    print("pair%d %d %d ratio=%.4f" % (i, a, b, a / b))
print("q_target=%.4f MDE=%.4f (%s)" % (q, mde,
      "OK" if mde <= 0.05 else "INCONCLUSIVE-NOISE"))
'
