# Round 0020: 920B SVE1/NEON operator search cannot find kernels that beat upstream NEON, despite user-verified internal handwritten kernels existing

You are acting as an AArch64/compiler/performance review expert. Do not
modify the repository; write your analysis and recommendations only into
this round directory (`summary.md`/`tooling-roadmap.md`/`verification.md`
or a single `response.md`).

## Facts (supported by files in context.md)

- Target: Kunpeng 920B, SVE1 2x256 + NEON 4x128, no SVE2, no PMU.
- Constraint from the user: only operator-level replacement/optimization
  is allowed; x265 encoding flow must not be changed.
- End-to-end real 1080p 30 frames: baseline 8129 ms, current 79-kernel
  injection 8983 ms (+10.5% slower).
- Per-operator real-machine CNTVCT ratios (NEON/cand, >1 means faster):
  sa8d16 0.81, dct32 0.73, interp8-8x8 0.72, satd16 1.0, quant ~0.75,
  copy family 1.0, costCoeffNxN/costCoeffRemain 1.0.
- Search/generation is `tools/search_sve2_layouts.py --isa sve1`; default
  now clang -O3. All generated candidates pass 20k differentials but none
  beat upstream NEON on 920B.
- User states that **it is known to be possible** for such operators to
  beat open-source NEON by >30% on 920B and make end-to-end +15% possible,
  **but we do not have the internal handwritten implementation as a
  reference**. We must rediscover that level of quality purely through the
  search/generation tool.

## Questions

1. Rebut our current approach and attribution: why would a 256-bit SVE1
   candidate systematically lose to 128-bit NEON on 920B, and what is the
   most likely missing factor (port balance, permutation cost, predication,
   load/store width, loop overhead)?
2. Without any reference implementation, how can the search/generator be
   redesigned to discover kernels at that quality level? Be concrete:
   layout axes, direct-asm backend, NEON-only recipes, constant
   pre-permutation, register pressure budgets, compiler flag axes.
3. Rank the 1-3 highest-information experiments for the next round,
   including how to validate on 920B without PMU (CNTVCT microbench /
   perf cpu-clock / paired encode).
4. If the search tool still cannot beat NEON after these, what structural
   change (IR, cost model, backend, workflow) should be made instead of
   continuing per-kernel layout sweeps?

Separate claims into: (a) supported by the cited files, (b) your
inference, (c) needs experiment.
