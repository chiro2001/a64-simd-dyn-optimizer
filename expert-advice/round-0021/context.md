# Round 0021 context

## Run summary

Objective unchanged: on 920B (SVE1 2x256 + NEON 4x128), operator-level
search must find kernels averaging +30% vs upstream NEON and +15%
end-to-end, with no internal handwritten reference. Since round-0020 the
search/generator has been extended (NEON-only recipes for sa8d16/satd8/
scanPosLast, real-distribution entropy corpora, 920B CNTVCT ranking) and
several focused E2E injections were run. The tool can now find kernels
that win microbenchmarks, but **no single kernel produces a net positive
end-to-end result on the cloud 920B**, and the batch-4 injection is
exactly neutral.

## New evidence since round-0020 (all committed; cloud 920B = 124.70.206.229,
build/x265-8-gcc, b81f650, 30-frame 1080p, single-thread)

### E2E facts (bitstream md5 ee5db7384df974ba25e4f1df8178dcb6 / 7981.54
kb/s / QP 33.77, 5-run medians)

- batch4 (sa8d16 NEON + satd8 NEON + costCoeffNxN scalar + costCoeffRemain):
  bitstream identical, 8.14-8.18 s vs baseline 8.15-8.19 s => neutral.
- scanPosLast NEON-tail + rbit-tail (real-distribution microbench 1.017x):
  bitstream identical, E2E still ~0.3% slower; not injected.
- costC1C2Flag round-27 (n<=4 unrolled leafs + NEON run-cache n5-8):
  60k mixed-corpus diff clean, bitstream identical, E2E +0.7% slower;
  not injected. n=1 is ~41% of real calls and still ~10% slower than the
  C reference (uniform microbench ratio 0.91); n5-8 win 1.2-2.4x.
- dct32 generated layouts (best_op_mca / best_op_r16), shape-substituted
  to SVE1 (new substitution rows: rshrnb, saddlb/t, predicated addp,
  2-register tbl): latency neon/cand 0.9715 / 0.9295, throughput
  1.0149 / 1.0000 (was 0.60-0.73x before) => still not retainable.

### Hotspot shares (old gprof, 30-frame run, dynopt-injected build)

| function | share | upstream share |
| --- | ---: | ---: |
| costCoeffNxN | 15.4% | 18.1% (scalar cand faster) |
| scanPosLast | 14.6% | 11.9% (cand slower at that time) |
| signBitHidingHDQ | 9.8% | not a dispatch slot |
| costC1C2Flag (C scalar) | 7.7% | same |
| costCoeffRemain (C scalar) | 5.4% | same |

### Real-distribution facts

- costC1C2Flag: n=1 40.6%, n=2 16.5%, n=3 13.4%, n=4 11.4% (n<=4 ~82%);
  uniform-sweep microbench overstates wins (~2.1x vs real ~parity/negative).
- scanPosLast: 55% calls numSig<=4; 74% trSize in {8,32}; multi-CG /
  large-trSize remains behind upstream asm (our NEON transliteration).
- costCoeffNxN: trSize 4/8/32 ~8%/31%/60%, soff=15 56%, mask popcount<=4
  71%. NEON variant microbench 1.097x faster than scalar but injected
  bitstream differs (09841f vs ee5db7): upstream asm has a beyond-bound
  read for soff<15 that depends on build layout, so QEMU/cross ref cannot
  validate; only cloud E2E is authoritative.
- Shared 256-core internal node does NOT reproduce sa8d16 NEON 1.12x/1.15x
  (~1.00-1.03x) and reverses scanPosLast (0.86x); costC1C2Flag ~2.1x
  (n-sweep) reproduces.

## Files to read

- `reports/c1c2-920b-e2e-20260815.txt` (costC1C2Flag verdict + per-n table)
- `reports/dct32-sub-920b-20260815.txt` (substitution results)
- `reports/scanposlast-neon-920b-20260815.txt` (scanPosLast rounds)
- `reports/costcoeffnxn-neon-20260815.txt` (beyond-bound read issue)
- `reports/real-1080p-e2e-20260815.txt` (batch4 neutral)
- `reports/920b-internal-quick-test-20260815.txt` (shared-node divergence)
- `tools/emit_cost_c1c2_flag_sve2_shared.py` (round-27 emitter)
- `tools/emit_scan_pos_last_sve2_shared.py` (NEON-tail emitter)
- `tools/search_sve2_layouts.py` (search driver, --isa sve1/neon, bench920)
- `docs/48-preload-and-isa-profiles.md`, `docs/49-quick-test-internal-20260815.md`

## Constraints (unchanged)

- 920B: SVE1 2x256 + NEON 4x128, no SVE2, no PMU (CNTVCT + perf cpu-clock
  only).
- Only operator-level replacement is allowed; x265 encoding flow must not
  change.
- No internal handwritten implementation is available; quality must come
  from the search/generation tool.
