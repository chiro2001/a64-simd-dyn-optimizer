#!/usr/bin/env bash
# AGO M2-expanded gate runner (round-0024 experiment 1).
#
# Usage: scripts/ago-m2-gate.sh <n1|920b> [CXX] [BUILD_DIR]
#   Runs every corpus cover (experiments/ago-m2-expanded/src/*.cpp):
#   20k native oracle -> build microbench -> CNTVCT batch medians ->
#   evaluation vs the analytical predictions (predictions.json).
#
# Pre-registered (TODO-M2, 2026-08-16): MDE=1% (q=0 on both targets);
# informative pair = same-family, median ratio outside MDE; predicted
# pair = |pred| > 0.25 cyc; formal thresholds (30 informative pairs,
# 0.75 pairwise accuracy, tau>=0.60, top-1 regret<=3%) apply only when
# the corpus supplies >=30 informative pairs; otherwise the verdict is
# foundation-only and no general ranking claim is made.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

TARGET="${1:?usage: ago-m2-gate.sh <n1|920b> [CXX] [BUILD_DIR]}"
CXX="${2:-aarch64-linux-gnu-g++}"
BUILD_DIR="${3:-build/x265-8-gcc}"
EXP="experiments/ago-m2-expanded"
REPS="${AGO_REPS:-3}"
BATCH="${AGO_BATCH:-4096}"
SAMPLES="${AGO_SAMPLES:-20}"
MDE="0.01"
STATIC_FLAG="-static"
if [ "${AGO_LINK_STATIC:-1}" = "0" ]; then
    STATIC_FLAG=""
fi

mkdir -p "$EXP/bench"

echo "== 20k oracle (native) =="
for src in "$EXP"/src/*.cpp; do
    name="$(basename "$src" .cpp)"
    kernel="${name%%_*}"
    cover="${name##*_}"
    if [ "$kernel" = "satd8" ]; then
        if ! AGO_CXX="$CXX" AGO_NATIVE=1 scripts/verify-ago-satd8.sh \
             --cover "$cover" >/dev/null 2>&1; then
            echo "$name: oracle FAIL"; exit 1
        fi
    elif [ "$kernel" = "sa8d8" ]; then
        if ! AGO_CXX="$CXX" AGO_NATIVE=1 scripts/verify-ago-sa8d8.sh \
             --cover "$cover" >/dev/null 2>&1; then
            echo "$name: oracle FAIL"; exit 1
        fi
    else
        shape="${kernel#satd}"
        case "$kernel" in
            satd8x4) shape="8x4";;
            satd8x16) shape="8x16";;
            satd16x8) shape="16x8";;
        esac
        if ! AGO_CXX="$CXX" AGO_NATIVE=1 scripts/verify-ago-satd8.sh \
             --shape "$shape" --cover "$cover" >/dev/null 2>&1; then
            echo "$name: oracle FAIL"; exit 1
        fi
    fi
    echo "$name: oracle PASS"
done

echo "== build + measure =="
for src in "$EXP"/src/*.cpp; do
    name="$(basename "$src" .cpp)"
    kernel="${name%%_*}"
    case "$kernel" in
        sa8d8)
            mb="benchmarks/ago_sa8d_microbench.cpp"
            extra="";;
        satd8)
            mb="benchmarks/ago_satd_microbench.cpp"
            extra="-DAGO_PU=LUMA_8x8 -DAGO_FUNC=dynopt_ago_satd8";;
        satd8x4)
            mb="benchmarks/ago_satd_microbench.cpp"
            extra="-DAGO_PU=LUMA_8x4 -DAGO_FUNC=dynopt_ago_satd8x4";;
        satd8x16)
            mb="benchmarks/ago_satd_microbench.cpp"
            extra="-DAGO_PU=LUMA_8x16 -DAGO_FUNC=dynopt_ago_satd8x16";;
        satd16x8)
            mb="benchmarks/ago_satd_microbench.cpp"
            extra="-DAGO_PU=LUMA_16x8 -DAGO_FUNC=dynopt_ago_satd16x8";;
    esac
    "$CXX" -O3 $STATIC_FLAG -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 \
      -DX265_DEPTH=8 -DX265_NS=x265 \
      $extra -I third_party/x265/source -I third_party/x265/source/common \
      -I "$BUILD_DIR" "$mb" "$src" "$BUILD_DIR/libx265.a" \
      -lpthread -ldl -lnuma -o "$EXP/bench/$name" >/dev/null 2>&1
done

MEAS_DIR="$EXP/measurements-$TARGET"
mkdir -p "$MEAS_DIR"
rm -f "$MEAS_DIR"/*
for src in "$EXP"/src/*.cpp; do
    name="$(basename "$src" .cpp)"
    for i in $(seq "$REPS"); do
        "$EXP/bench/$name" neon "$SAMPLES" "$BATCH" >> "$MEAS_DIR/$name"
        "$EXP/bench/$name" cand "$SAMPLES" "$BATCH" >> "$MEAS_DIR/$name"
    done
done

echo "measurements -> $MEAS_DIR"
python3 - "$TARGET" "$MEAS_DIR" "$MDE" "$REPS" <<'PY'
import json, math, sys
from collections import defaultdict

target, meas_dir, mde, reps = (sys.argv[1], sys.argv[2],
                               float(sys.argv[3]), int(sys.argv[4]))
preds = {p["instance"]: p for p in json.load(
    open("experiments/ago-m2-expanded/predictions.json"))
    if p["table"] == ("n1" if target == "n1" else "920b")}

import os
names = sorted(preds)
per = {}
for n in names:
    per[n] = {"neon": [], "cand": []}
    for line in open(os.path.join(meas_dir, n)):
        parts = line.strip().split(",")
        mode = parts[1]
        ticks = int(parts[3].split("=")[1])
        per[n][mode].append(ticks)

def medv(xs):
    s = sorted(xs)
    return s[len(s) // 2]

results = {}
for n, d in per.items():
    results[n] = {"neon": medv(d["neon"]), "cand": medv(d["cand"])}

families = defaultdict(list)
for n in names:
    fam = "satd" if n.startswith("satd") else n.split("_")[0]
    families[fam].append(n)

informative = 0
correct = 0
evaled = 0
ties = 0
pairs_all = []
for fam, members in families.items():
    for i in range(len(members)):
        for j in range(i + 1, len(members)):
            a, b = members[i], members[j]
            pa, pb = preds[a]["predicted_cyc"], preds[b]["predicted_cyc"]
            ma, mb = results[a]["cand"], results[b]["cand"]
            pred_diff = pa - pb
            meas_diff = math.log(ma / mb)
            resolved = abs(meas_diff) > mde
            pred_distinct = abs(pred_diff) > 0.25
            pairs_all.append((a, b, pa, pb, ma, mb, pred_diff, meas_diff,
                              resolved, pred_distinct))
            if resolved and pred_distinct:
                informative += 1
                evaled += 1
                if (pred_diff > 0) == (meas_diff > 0):
                    correct += 1
            elif resolved and not pred_distinct:
                ties += 1

acc = correct / evaled if evaled else 0.0
concord = discord = 0
for fam, members in families.items():
    for i in range(len(members)):
        for j in range(i + 1, len(members)):
            a, b = members[i], members[j]
            pd = preds[a]["predicted_cyc"] - preds[b]["predicted_cyc"]
            md = math.log(results[a]["cand"] / results[b]["cand"])
            if abs(pd) <= 0.25 or abs(md) <= mde:
                continue
            if (pd > 0) == (md > 0):
                concord += 1
            else:
                discord += 1
tau = (concord - discord) / (concord + discord) if concord + discord else 0.0

# top-1 regret per family: predicted best vs measured best
regrets = []
for fam, members in families.items():
    pred_best = min(members, key=lambda n: preds[n]["predicted_cyc"])
    meas_best = min(members, key=lambda n: results[n]["cand"])
    r = (results[pred_best]["cand"] - results[meas_best]["cand"]) / \
        float(results[meas_best]["cand"])
    regrets.append(r)
regret = max(regrets) if regrets else 0.0

# block bootstrap over instances for the pairwise-accuracy lower bound
import random
instances = list(results)
random.seed(0xA608)
lows = []
for _ in range(1000):
    boot = [random.choice(instances) for _ in instances]
    fams = defaultdict(list)
    for n in boot:
        fam = "satd" if n.startswith("satd") else n.split("_")[0]
        fams[fam].append(n)
    ok = tot = 0
    for fam, members in fams.items():
        for i in range(len(members)):
            for j in range(i + 1, len(members)):
                a, b = members[i], members[j]
                pd = preds[a]["predicted_cyc"] - preds[b]["predicted_cyc"]
                md = math.log(results[a]["cand"] / results[b]["cand"])
                if abs(pd) <= 0.25 or abs(md) <= mde:
                    continue
                tot += 1
                ok += (pd > 0) == (md > 0)
    if tot:
        lows.append(ok / tot)
lows.sort()
lower = lows[int(len(lows) * 0.05)] if lows else 0.0

print("target=%s" % target)
for fam, members in families.items():
    print("  family %s: %s" % (fam, ", ".join(members)))
for a, b, pa, pb, ma, mb, pd, md, res, pdist in pairs_all:
    print("  pair %s/%s pred %.1f/%.1f meas %d/%d dir=%s%s" % (
        a, b, pa, pb, ma, mb,
        "ok" if (pd > 0) == (md > 0) else "BAD",
        "" if res else " (unresolved)"))
print("informative_predicted_pairs=%d evaluated=%d correct=%d acc=%.3f "
      "lower95=%.3f tau=%.3f top1_regret=%.3f ties=%d"
      % (informative, evaled, correct, acc, lower, tau, regret, ties))
if informative >= 30:
    ok = acc >= 0.75 and lower >= 0.60 and tau >= 0.60 and regret <= 0.03
    print("VERDICT: %s (acc>=0.75:%s lower>=0.60:%s tau>=0.60:%s "
          "regret<=0.03:%s)" % (
              "PASS" if ok else "RANK-FAILED",
              acc >= 0.75, lower >= 0.60, tau >= 0.60, regret <= 0.03))
else:
    print("VERDICT: FOUNDATION-ONLY (informative pairs %d < 30)" % informative)
PY
