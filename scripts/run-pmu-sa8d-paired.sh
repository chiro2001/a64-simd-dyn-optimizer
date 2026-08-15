#!/usr/bin/env bash
# Randomized paired PMU A/B for SA8D: candidate vs same-machine NEON.
#
# One valid pair = one perf-stat run of each impl (random order) on the
# pinned vCPU. When the hardware PMU is available, cycles:u and
# instructions:u are recorded; otherwise (e.g. a cloud VM without a virtual
# PMU) the script falls back to the microbench's own CNTVCT_EL0 `ticks`
# column, which is still real hardware time. ≥MIN_VALID pairs across ≥3
# processes are required; the bootstrap 95% CI of the per-pair speedup must
# have its lower bound above the keep threshold (default 1.10 for 920B
# NEON->SVE256).
#
# Usage: scripts/run-pmu-sa8d-paired.sh <bench-binary> <shape>
#          [pairs_per_proc=10] [procs=3] [batch=4096] [outdir] [mode=latency]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BIN="${1:?usage: run-pmu-sa8d-paired.sh <bench> <shape> [pairs] [procs] [batch] [out]}"
SHAPE="${2:?usage: run-pmu-sa8d-paired.sh <bench> <shape> [pairs] [procs] [batch] [out]}"
PAIRS="${3:-10}"
PROCS="${4:-3}"
BATCH="${5:-4096}"
OUT="${6:-experiments/m11-sve-920b/benchmark/pmu}"
MODE="${7:-latency}"
MIN_VALID="${MIN_VALID:-30}"
KEEP_LO="${KEEP_LO:-1.10}"
CPU="${CPU:-0}"
IMPL_A="${IMPL_A:-neon}"   # baseline (A) = numerator of speedup
IMPL_B="${IMPL_B:-cand}"   # candidate (B) = denominator of speedup

mkdir -p "$OUT"
RAW="$OUT/paired-pmu-raw.csv"
: > "$RAW"

METRIC="${METRIC:-auto}"
if [ "$METRIC" = "auto" ] && perf stat -e cycles:u true 2>&1 | grep -q "not supported"; then
  echo "[run-pmu-sa8d-paired] hardware PMU unavailable; metric=cntvct (microbench ticks)"
  METRIC="cntvct"
fi
if [ "$METRIC" = "auto" ]; then
  # Even with a hardware PMU, whole-process cycles dominate small kernels;
  # the microbench's own cntvct ticks measure only the batch loop. Prefer
  # cntvct unless a perf-based metric is explicitly requested.
  METRIC="cntvct"
fi

run_perf() {
  local impl="$1"
  local tmp
  tmp="$(mktemp)"
  if [ "$METRIC" = "cntvct" ]; then
    taskset -c "$CPU" "$BIN" "$SHAPE" "$impl" "$MODE" 1 "$BATCH" --noverify \
      2>/dev/null | tail -n 1 | awk -F, '{printf "%.0f", $7}'
    return 0
  fi
  if ! perf stat -x, -e cycles:u,instructions:u \
    taskset -c "$CPU" "$BIN" "$SHAPE" "$impl" "$MODE" 1 "$BATCH" --noverify \
      >/dev/null 2>"$tmp"; then
    cat "$tmp" >&2
    rm -f "$tmp"
    echo ","
    return 0
  fi
  # perf stat -x, CSV layout: <count>,<unit>,<event>,<interval>,... so
  # the count is field 1, NOT field 4 (round-0023 audit: N1 output verified
  # e.g. "158995,,cycles:u,375160,100.00,,").
  awk -F, '$3=="cycles:u"{c=$1} $3=="instructions:u"{i=$1} END{printf "%.0f,%.0f", c, i}' "$tmp"
  rm -f "$tmp"
}

for p in $(seq 1 "$PROCS"); do
  for s in $(seq 1 "$PAIRS"); do
    order=$((RANDOM % 2))
    if [ "$order" -eq 0 ]; then
      n=$(run_perf "$IMPL_A"); c=$(run_perf "$IMPL_B")
    else
      c=$(run_perf "$IMPL_B"); n=$(run_perf "$IMPL_A")
    fi
    echo "$p,$s,$order,$n,$c" >> "$RAW"
  done
done

python3 - "$RAW" "$OUT" "$MIN_VALID" "$KEEP_LO" "$BATCH" "$METRIC" "$MODE" <<'PY'
import csv, json, random, statistics, sys
raw, out, min_valid, keep_lo, batch, metric, mode = sys.argv[1:8]
min_valid, keep_lo, batch = int(min_valid), float(keep_lo), int(batch)

valid = []
with open(raw) as f:
    for r in csv.reader(f):
        if len(r) < 5 or not r[3] or not r[4]:
            continue
        a = [float(x) for x in r[3].split(",") if x.strip()]
        b = [float(x) for x in r[4].split(",") if x.strip()]
        if not a or not b or any(v <= 0 for v in a + b):
            continue
        neon_cyc = a[0] / batch
        cand_cyc = b[0] / batch
        neon_insn = a[1] / batch if len(a) > 1 else float("nan")
        cand_insn = b[1] / batch if len(b) > 1 else float("nan")
        valid.append((int(r[0]), int(r[1]), int(r[2]),
                      neon_cyc, neon_insn, cand_cyc, cand_insn))

ratios = [n[3] / n[5] for n in valid]          # speedup = neon_cyc / cand_cyc
rng = random.Random(0x920B)
B = 10000
bs = []
for _ in range(B):
    s = [ratios[rng.randrange(len(ratios))] for _ in ratios]
    bs.append(statistics.median(s))
bs.sort()
lo, hi = bs[int(0.025 * B)], bs[int(0.975 * B)]
med = statistics.median(ratios) if ratios else float("nan")
geo = statistics.geometric_mean(ratios) if ratios else float("nan")
nprocs = len(set(n[0] for n in valid))
ok = (len(valid) >= min_valid and lo > keep_lo and nprocs >= 3)

with open(f"{out}/paired-pmu-summary.txt", "w") as f:
    f.write("valid_pairs=%d procs=%d\n" % (len(valid), nprocs))
    f.write("metric_source=%s\n" % metric)
    f.write("mode=%s\n" % mode)
    f.write("speedup_median=%.4f geomean=%.4f bootstrap95=[%.4f, %.4f]\n"
            % (med, geo, lo, hi))
    f.write("keep_lo=%.3f min_valid=%d verdict=%s\n"
            % (keep_lo, min_valid, "KEEP" if ok else "REJECT"))

with open(f"{out}/paired-pmu-per-call.csv", "w") as f:
    f.write("proc,pair,order,neon_cyc,neon_insn,cand_cyc,cand_insn\n")
    for v in valid:
        f.write("%d,%d,%d,%.2f,%.2f,%.2f,%.2f\n" % v)

print(json.dumps({
    "valid_pairs": len(valid), "procs": nprocs,
    "speedup_median": med, "speedup_geomean": geo,
    "bootstrap95": [lo, hi], "keep_lo": keep_lo,
    "metric_source": metric,
    "mode": mode,
    "verdict": "KEEP" if ok else "REJECT",
}))
sys.exit(0 if ok else 1)
PY

echo "[run-pmu-sa8d-paired] wrote $OUT/paired-pmu-summary.txt"
