#!/usr/bin/env bash
# Randomized paired A/B benchmark for dct32_microbench with bootstrap CI.
# Usage:
#   scripts/bench-dct32-paired.sh <bench-binary> <implA> <implB>
#       [samples=30] [procs=5] [outdir] [latency|throughput] [batch]
set -euo pipefail

BIN="${1:?usage: bench-dct32-paired.sh <bench-binary> <implA> <implB> ...}"
IA="${2:?implA}"
IB="${3:?implB}"
SAMPLES="${4:-30}"
PROCS="${5:-5}"
OUT="${6:-experiments/dct32-paired}"
MODE="${7:-latency}"
BATCH="${8:-8}"
INNER="${9:-50}"
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
      taskset -c 0 "$BIN" "$1" "$MODE" "$INNER" "$BATCH" 2>/dev/null \
        | tail -n 1 | sed -n 's/.*p50=\([0-9]*\).*/\1/p'
    }
    if [ "$order" -eq 0 ]; then
      a=$(run_one "$IA")
      b=$(run_one "$IB")
    else
      b=$(run_one "$IB")
      a=$(run_one "$IA")
    fi
    echo "$p,$s,$order,$a,$b" >> "$OUT/paired-raw.csv"
  done
done

python3 - "$OUT/paired-raw.csv" "$SAMPLES" "$PROCS" "$IA" "$IB" <<'PY'
import csv, random, statistics, sys
path, samples, procs, ia, ib = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), sys.argv[4], sys.argv[5]
rows = []
for r in csv.reader(open(path)):
    rows.append((float(r[3]), float(r[4])))
if not rows:
    print("no measurements", file=sys.stderr)
    sys.exit(1)
# ratio = A/B; >1 means A faster than B.
ratios = [a / b for a, b in rows]
med = statistics.median(ratios)
geo = statistics.geometric_mean(ratios)
rng = random.Random(0xD32C)
B = 10000
bs = []
for _ in range(B):
    sample = [ratios[rng.randrange(len(ratios))] for _ in ratios]
    bs.append(statistics.median(sample))
bs.sort()
lo, hi = bs[int(0.025 * B)], bs[int(0.975 * B)]
print("%s/%s pairs=%d median=%.4f geomean=%.4f bootstrap95=[%.4f, %.4f]"
      % (ia, ib, len(ratios), med, geo, lo, hi))
with open(path + ".summary", "w") as f:
    f.write("%s/%s pairs=%d median=%.4f geomean=%.4f bootstrap95=[%.4f, %.4f]\n"
            % (ia, ib, len(ratios), med, geo, lo, hi))
PY
