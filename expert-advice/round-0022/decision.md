# Round 0022 decision

## Decision

**NO-GO for a +15% operator-level claim on 920B. GO for freezing best6b as a
profile-specific 1.8--1.9% elapsed-time win, subject to broader replication.**

Parity with upstream adds zero over the clean baseline. The remaining quant +
DCT + interp + intra families cover 14.6%: even if every one became 1.20x
faster, they would add only 2.43 E2E points. Closing the approximately 13.1
points left to a 15% time reduction would require 9.73x across that set, or
about 3.22x even across an expanded 19% operator set. Those ratios are not
credible against the measured hand-NEON baselines.

## Priority and hard gates

| priority | action | disposition | hard gate |
| --- | --- | --- | --- |
| P0 | Authorized 920B thread/lookahead configuration matrix | pursue as a separate configuration result | >=15% lower paired wall time with CI above the threshold; accepted bitstream/quality/determinism contract; report CPU use and thread count |
| P0 | Freeze and replicate best6b | accept conditionally | exact objects/toolchain; byte-identical output; randomized paired CI on longer diverse clips and a second 920B |
| P1 | Native NEON dct32 `row8-fast16` plus exact fallback on ordered production trace | one bounded experiment | production differential clean; fast-path hit rate high; whole-trace >=1.15x with CI lower bound >=1.10; predicted E2E >=0.25 point |
| P1 | Trace SADx3/x4, SATD, `psy_cost_pp`, and `pixel_avg` by call site/shape/pointer delta | measure before generating | report exclusive ticks and absolute saved-tick ceiling; generate only buckets covering most cost |
| P1 | Native 950/960 real-mix and E2E | pursue only as a separate hardware target | native correctness, real-mix win, no regressing high-weight bucket, paired E2E; build gate alone is insufficient |
| P2 | Ordered replay, guard/red-zone checks, paired CIs, and negative-result ledger | accept as tool deliverable | reproducible package and explicit scope of each correctness/performance claim |
| -- | More quant attempts, SVE1 shape substitution, broad interp/intra parity sweeps | stop for this milestone | reopen only for a new algorithm with predicted >=0.25 E2E point |

## Structural ranking

1. Same-920B parallel settings, because this is the only listed route that can
   satisfy a same-machine 15% wall-time goal; it is not an operator win.
2. 950/960 ISA headroom, if changing the hardware target is acceptable.
3. Tool-credibility deliverables.
4. Publish the approximately 2% 920B win; combine this with item 3 rather than
   presenting it as the original 15% target.

## Two-week stop rule

Spend the first week on the thread matrix, native 950/960 E2E, primitive trace,
and the single dct32 experiment. At day 8, continue only a path that has either
crossed the 15% structural gate or predicts at least 0.25 additional E2E point
from measured saved ticks. Spend the second week validating and packaging the
winner. If none passes, publish best6b plus the production-differential/replay
toolchain and the negative ledger; do not start another layout sweep.

One audit correction is required in the final claim: the cited 18.96M real-call
production differential covers the four entropy kernels. The cited table lists
20k tests, not real-call trace counts, for satd8 and sa8d16. Their universal
claim needs real-call in-encoder shadowing, although the identical batch E2E
bitstream is strong evidence for the tested workload.
