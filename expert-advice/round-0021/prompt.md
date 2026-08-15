# Round 0021: microbenchmark wins do not translate to E2E; which concrete
algorithm/search changes can break the impasse on 920B?

You are acting as an AArch64/compiler/performance review expert. Do not
modify the repository; write your analysis and recommendations only into
this round directory (`response.md`, `decision.md`).

## Facts (supported by files in context.md)

- 920B: SVE1 2x256 + NEON 4x128, no SVE2, no PMU.
- Only operator-level replacement is allowed; encoding flow is fixed.
- Real 30-frame 1080p E2E: baseline ~8.19 s. Batch4 injection
  (sa8d16+satd8+costCoeffNxN+costCoeffRemain) is bitstream-identical and
  exactly neutral. costC1C2Flag round-27 is bitstream-identical but
  +0.7% slower. scanPosLast rbit-tail is bitstream-identical but ~0.3%
  slower. No injected kernel set has produced a net E2E win yet.
- The search tool CAN now produce kernels that win real-distribution
  microbenchmarks (sa8d16 NEON 1.12x, costC1C2Flag n8 2.4x, dct32
  throughput 1.01x), but small-kernel wins do not show up in E2E because
  the hot functions are dominated by small-shape cases where the upstream
  C/NEON is already tight (costC1C2Flag n=1 41% of calls; scanPosLast
  numSig<=4 55%; costCoeffNxN mask popcount<=4 71%).
- The main hotspots by share: costCoeffNxN 15.4% (scalar candidate ~15%
  faster than upstream already), scanPosLast 14.6% (~parity), costC1C2Flag
  7.7% (C scalar; net-negative candidates), costCoeffRemain 5.4% (C
  scalar; neutral candidates).
- Verification trap: upstream costCoeffNxN asm reads beyond its 4x4 slice
  for soff<15; the read depends on build layout, so QEMU/cross differential
  cannot validate NEON candidates against the cloud production ref; only
  cloud E2E bitstream is authoritative.

## Questions

1. Given that small-shape cases dominate and upstream C/NEON is already
   tight there, which operators/functions still have enough per-call
   slack to yield >=30% kernel-level and >=15% E2E? Be concrete: propose
   specific algorithm changes (not layout sweeps) for scanPosLast,
   costCoeffNxN, costC1C2Flag, costCoeffRemain, dct32 on SVE1 2x256 +
   NEON 4x128, with expected cycle budgets.
2. For scanPosLast specifically: our candidate is a near-1:1 transliteration
   of upstream NEON and loses only on multi-CG/large-trSize. Propose a
   genuinely different algorithm (e.g., SVE1 2x256 processing two CGs per
   iteration, different sign-packing, avoiding the pext/clz loop) with
   correctness constraints (packed coeffSign/coeffFlag/coeffNum contract
   must stay bit-exact).
3. For costCoeffNxN: the NEON variant wins 9.7% in microbench but cannot
   be validated against the production ref due to the upstream
   beyond-bound read. How should we restructure verification (cloud-side
   differential harness against the production .so? per-call A/B in the
   encoder?) and is the 9.7% microbench win even worth chasing given the
   real distribution?
4. The search tool's microbenchmark ranking over-predicts E2E for
   small-shape-dominated kernels. What is the cheapest high-signal proxy
   between per-kernel CNTVCT and full E2E (e.g., weighted real-distribution
   corpora, gprof share scaling, trace-driven estimates)? Which proxy would
   have predicted the costC1C2Flag/scanPosLast failures?
5. If the answer to (1) is "no single operator can deliver +15% E2E at
   operator level", say so explicitly and rank the best fallback
   strategies (multi-kernel batch composition, 950/960 headroom, tool
   credibility work) rather than forcing a positive result.

Separate claims into: (a) supported by the cited files, (b) your
inference, (c) needs experiment.
