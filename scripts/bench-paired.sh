#!/usr/bin/env bash
# Randomized paired A/B benchmark with bootstrap CI.
# Usage: scripts/bench-paired.sh <bench-binary> [samples_per_proc=30]
#                                  [procs=5] [outdir] [latency|throughput]
set -euo pipefail

BIN="${1:?usage: bench-paired.sh <bench-binary> [samples] [procs] [outdir] [mode]}"
SAMPLES="${2:-30}"
PROCS="${3:-5}"
OUT="${4:-experiments/m4-search/benchmark}"
MODE="${5:-latency}"
case "$MODE" in
  latency|throughput) ;;
  *) echo "mode must be latency or throughput" >&2; exit 2 ;;
esac
mkdir -p "$OUT"

: > "$OUT/paired-raw.csv"
for p in $(seq 1 "$PROCS"); do
  for s in $(seq 1 "$SAMPLES"); do
    order=$((RANDOM % 2))
    run_one() {
      taskset -c 0 "$BIN" 8x8 "$1" "$MODE" 1 4096 --noverify 2>/dev/null \
        | tail -n 1 | cut -d, -f6
    }
    if [ "$order" -eq 0 ]; then
      n=$(run_one neon)
      c=$(run_one cand)
    else
      c=$(run_one cand)
      n=$(run_one neon)
    fi
    echo "$p,$s,$order,$n,$c" >> "$OUT/paired-raw.csv"
  done
done

python3 - "$OUT/paired-raw.csv" "$SAMPLES" "$PROCS" <<'PY'
import csv, random, statistics, sys
rows = []
for r in csv.reader(open(sys.argv[1])):
    rows.append((float(r[3]), float(r[4])))
ratios = [n / c for n, c in rows]
med = statistics.median(ratios)
geo = statistics.geometric_mean(ratios)
rng = random.Random(0xB0A7)
B = 10000
bs = []
for _ in range(B):
    sample = [ratios[rng.randrange(len(ratios))] for _ in ratios]
    bs.append(statistics.median(sample))
bs.sort()
lo, hi = bs[int(0.025 * B)], bs[int(0.975 * B)]
print("pairs=%d median=%.4f geomean=%.4f bootstrap95=[%.4f, %.4f]"
      % (len(ratios), med, geo, lo, hi))
with open(sys.argv[1] + ".summary", "w") as f:
    f.write("pairs=%d median=%.4f geomean=%.4f bootstrap95=[%.4f, %.4f]\n"
            % (len(ratios), med, geo, lo, hi))
PY
