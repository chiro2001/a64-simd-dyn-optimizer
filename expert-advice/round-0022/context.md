# Round 0022 context

## Run summary

Since round-0021 (which concluded "no single operator can credibly give
+15% E2E on 920B"), the pipeline delivered real, production-verified
kernel wins and the first reproducible positive E2E result:

- real-call trace replay + production per-call differential (P0 done):
  18.96M calls captured on the cloud 920B; every candidate is verified
  against the production static lib call-by-call (bad=0), then timed on
  the real call mix.
- 6 kernels now beat upstream on the real distribution and are injected
  in one 20-slot batch (best6b): costC1C2Flag +30%, scanPosLast +27%,
  costCoeffRemain +20%, costCoeffNxN +9.7%, satd8 +8%, sa8d16 ~parity.
- E2E (30f 1080p, single-thread, bitstream md5 identical ee5db7):
  best6b median 8061 ms vs baseline 8210 ms = **-1.9%**, reproduced
  twice.

## What has been tried and failed since round-0021 (all documented)

- ccn (costCoeffNxN) soff-unrolled switch variant: +7.5% < looped +9.7%.
- quant: three independent rounds (SVE1, NEON full-unroll, NEON pair
  + upstream-style count): 12-13 vs upstream 9 ticks; upstream hand asm
  not reachable by generated code. qo narrow must be truncating vmovn
  (saturating vqmovn mismatches at small qBits).
- dct32: generated SVE2 layouts shape-substituted to SVE1 run at
  0.93-0.97 latency / ~1.00 throughput vs upstream NEON.
- interp8 path-B SVE1 substitution: 0.55-0.87 (not injectable).
- sad16 SVE1 candidate: 78 vs upstream 43 ticks (1.8x slower).
- costC1C2Flag run-cache/NEON-mask paths: replaced by n=1..8 unrolled
  leaves (+30%).
- dct8/16, idct16/32, intrapred: no generated candidate beats upstream
  on 920B; idct32 SVE2p1-shape estimate is +13% but no correct native
  SVE1 candidate exists.

## Baseline hotspot shares (clean build, perf cpu-clock)

motionEstimate 4.6%, costCoeffNxN 4.2% (won), scanPosLast 3.2% (won),
quant 2.7% (lost), sa8d16 2.3% (parity), dct32 2.3% (lost), encodeBin
2.2%, codeCoeffNxN 1.9%, psyCost 1.9%, dct16 1.8%, interp_hv 1.7%,
interp8_horiz 1.6%, costC1C2Flag 1.5% (won), signBitHidingHDQ 1.5%,
dct8 1.4%, saoCuStatsBO 1.4%, estimateResidualQT 1.3%, transformNxN
1.2%, pixel_avg 1.1%, satd8 2.0% (won), idct16/32 ~1.9%, interp family
~4%, intrapred ~2.4%.

## Constraint reminders

- 920B: SVE1 2x256 + NEON 4x128, no SVE2, no PMU.
- Only operator-level replacement; encoding flow fixed.
- No internal handwritten reference available.
- Goal: average kernel +30%, E2E +15%, unrestricted-ISA results not
  worse. sve2 (950) build gate passes for all 6 injected kernels.

## Files to read

- `reports/end-to-end-comparison-20260815.txt` (headline numbers)
- `reports/entropy-replay-920b-20260815.txt` (replay/verify methodology)
- `reports/c1c2-r29-best5-20260815.txt` (batch E2E details)
- `docs/49-quick-test-internal-20260815.md` (repro commands)
- `tools/trace_entropy_calls.py`, `benchmarks/entropy_trace_replay.cpp`
- `tools/emit_cost_c1c2_flag_sve2_shared.py` (leaf generator)
- `tools/emit_scan_pos_last_sve2_shared.py` (nibble PEXT)
- `tools/emit_cost_remain_sve2_shared.py` (DFA)
- `tools/emit_cost_coeff_nxn_sve2_shared.py` (NEON loop + unroll)
- `tools/search_sve2_layouts.py`, `tools/build_preload_so.py`
