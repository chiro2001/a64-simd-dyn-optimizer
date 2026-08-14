#!/usr/bin/env bash
# Generic CNTVCT paired A/B for the project microbenches (dct/idct/dct8/
# interp8/sa8d all print one CSV line per sample with a ticks column).
# Usage: bench-generic-paired.sh <bin> <shape> <implA> <implB>
#                                [samples=30] [batch=16] [out=csv]
set -euo pipefail

BIN="${1:?usage: bench-generic-paired.sh <bin> <shape> <implA> <implB> [samples] [batch] [out]}"
SHAPE="${2:?}"
IA="${3:?}"
IB="${4:?}"
SAMPLES="${5:-30}"
BATCH="${6:-16}"
OUT="${7:-/tmp/generic-paired.csv}"

: > "$OUT"
run_one() {
  taskset -c 0 "$BIN" "$SHAPE" "$1" latency 1 "$BATCH" --noverify \
    2>/dev/null | tail -1 | cut -d, -f7
}
for p in 1 2 3 4 5; do
  for s in $(seq 1 "$((SAMPLES / 5))"); do
    order=$((RANDOM % 2))
    if [ "$order" -eq 0 ]; then
      a=$(run_one "$IA"); b=$(run_one "$IB")
    else
      b=$(run_one "$IB"); a=$(run_one "$IA")
    fi
    echo "$p,$s,$order,$a,$b" >> "$OUT"
  done
done
python3 - "$OUT" "$IA" "$IB" <<'PY'
import csv, statistics, sys
rows = []
for r in csv.reader(open(sys.argv[1])):
    if r[3] and r[4]:
        rows.append((float(r[3]), float(r[4])))
if not rows:
    print("no measurements")
    sys.exit(1)
rat = [a / b for a, b in rows]
print("%s/%s pairs=%d median=%.4f geomean=%.4f min=%.4f max=%.4f"
      % (sys.argv[2], sys.argv[3], len(rat), statistics.median(rat),
         statistics.geometric_mean(rat), min(rat), max(rat)))
print("A(=%s) median=%.1f  B(=%s) median=%.1f"
      % (sys.argv[2], statistics.median([a for a, _ in rows]),
         sys.argv[3], statistics.median([b for _, b in rows])))
PY
