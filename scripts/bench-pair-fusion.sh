#!/usr/bin/env bash
# Randomized paired A/B for instruction-pair fusion (P5', weak evidence).
# For each pair, run chained/control in random order N times and report the
# per-run tick ratio with a bootstrap 95% CI. A ratio clearly below 1.0 is a
# weak fusion signal; retired instructions would still count two.
#
# Usage: scripts/bench-pair-fusion.sh <pair-bench-binary> <pair> <iters>
#          [samples=60] [outdir]
set -euo pipefail

BIN="${1:?usage: bench-pair-fusion.sh <bin> <pair> <iters> [samples] [out]}"
PAIR="${2:?}"
ITERS="${3:?}"
SAMPLES="${4:-60}"
OUT="${5:-experiments/m11-fusion/benchmark}"
mkdir -p "$OUT"

RAW="$OUT/$PAIR-paired.csv"
: > "$RAW"
for s in $(seq 1 "$SAMPLES"); do
  order=$((RANDOM % 2))
  if [ "$order" -eq 0 ]; then
    c=$("$BIN" "$PAIR" "$ITERS" chained | cut -d, -f4)
    n=$("$BIN" "$PAIR" "$ITERS" control | cut -d, -f4)
  else
    n=$("$BIN" "$PAIR" "$ITERS" control | cut -d, -f4)
    c=$("$BIN" "$PAIR" "$ITERS" chained | cut -d, -f4)
  fi
  echo "$s,$order,$c,$n" >> "$RAW"
done

python3 - "$RAW" "$OUT" "$PAIR" <<'PY'
import csv, json, random, statistics, sys
raw, out, pair = sys.argv[1], sys.argv[2], sys.argv[3]
ratios = []
with open(raw) as f:
    for r in csv.reader(f):
        if len(r) != 4 or not r[2] or not r[3]:
            continue
        c, n = float(r[2]), float(r[3])
        if c > 0 and n > 0:
            ratios.append(c / n)
med = statistics.median(ratios) if ratios else float("nan")
rng = random.Random(0xF0510)
B = 10000
bs = []
for _ in range(B):
    s = [ratios[rng.randrange(len(ratios))] for _ in ratios]
    bs.append(statistics.median(s))
bs.sort()
lo, hi = bs[int(0.025 * B)], bs[int(0.975 * B)]
print(json.dumps({"pair": pair, "samples": len(ratios),
                  "ratio_median": med, "bootstrap95": [lo, hi]}))
with open(f"{out}/{pair}-summary.txt", "w") as f:
    f.write("pair=%s samples=%d ratio_median=%.4f bootstrap95=[%.4f, %.4f]\n"
            % (pair, len(ratios), med, lo, hi))
PY
