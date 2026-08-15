# Round 0021 decision

## Decision

**NO-GO for a 920B +15% E2E claim and NO-GO for shipping any current new
kernel set.** No single allowed slot has practical Amdahl headroom: even the
largest slot would need an implausible multi-x speedup, and the current batch
is neutral.

| priority | action | disposition | hard gate |
| --- | --- | --- | --- |
| P0 | Real-call trace-replay corpus on 920B; rank absolute saved ticks | accept | Predict the sign of the known C1/C2, scan, sa8d16, and batch-4 outcomes without per-case fitting |
| P0 | Exact production-.so differential plus in-encoder shadow A/B for costCoeffNxN | accept | Millions of call-level comparisons clean, then identical E2E md5 |
| P1 | costCoeffNxN context-batched CABAC DFA; optimize `soff=15`, fall back to upstream otherwise | accept, bounded | <=0.769 of production trace time; existing batch target <=9,949 CNTVCT ticks |
| P1 | costC1C2Flag combined-state AArch64 leaves for n=1--4 | accept, bounded | Meet every per-n 1.30x budget and <=0.769 on the joint real trace |
| P2 | Paired-CG SVE1 gather/compact scanPosLast, with a non-regressing one-CG path | experiment once | one-CG <=8,119 and four-CG <=19,652 ticks; exact packed-output contract |
| P2 | Native factorized/tiled dct32, not SVE2 shape substitution | defer behind P1 | <=0.769 in both latency and throughput on 920B |
| P3 | costCoeffRemain DFA/table composition | defer until trace | >=90% compact-table hit rate and <=0.769 real-trace time |
| — | More layout sweeps or E2E runs for the current 1--15% micro-wins | reject | Insufficient signal and Amdahl value |

## Fallback order

1. Restore tool credibility with real-call replay and production-reference
   verification.
2. If hardware choice is flexible, pursue 950/960, where the ISA removes
   several 920B lowering penalties.
3. If 920B is mandatory, compose only trace-clean kernels by absolute saved
   ticks. Roughly 45% of runtime must average about 1.49x to reach +15% E2E.
4. Retain smaller micro-wins only as calibration data and future batch
   ingredients.

The program should stop treating “one operator at 1.30x” and “+15% E2E” as
the same acceptance target; the cited shares prove that they are not.
