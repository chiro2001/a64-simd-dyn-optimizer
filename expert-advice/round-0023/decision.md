# Round 0023 decision

## Status

**[I]** **Conditional GO for AGO as a narrow sidecar backend. NO-GO for the M0–M2 sequence in docs/52 as written.**

**[F]** The proposed sequence begins with automatic GraphBuilder work, uses global fixed-point passes and a multiplicative cost expression, then requires an N1 win and a 1.15× 920B win as early gates ([docs/52:24](/home/chiro/projects/a64-simd-dyn-optimizer/docs/52-ago-plan-20260816.md:24), [docs/52:26](/home/chiro/projects/a64-simd-dyn-optimizer/docs/52-ago-plan-20260816.md:26), [docs/52:62](/home/chiro/projects/a64-simd-dyn-optimizer/docs/52-ago-plan-20260816.md:62)).

**[I]** Replace it with this order:

1. Minimal typed semantic/Pack/Machine IR contract.
2. SA8D 8×8 hand/imported graph and upstream-NEON reproduction through cover, scheduling, real allocation, and final-object validation.
3. Restricted automatic frontend that reconstructs the same graph.
4. Second dataflow anchor plus bounded layout/cover search and held-out cost-ranking validation.
5. Explicit loop/FSM templates for PEXT, DFA, and small-trip specialization.
6. Existing `--backend ago` validation/injection/freeze integration.

## P0 decisions

- **[I]** Contract plus canonical DSL/restricted C own semantics. Intrinsics, assembly, disassembly, and traces are seeds/evidence, not semantic authorities.
- **[I]** Verification occurs after import, every risky rewrite, and lowering; performance feedback never overrides an unclosed correctness obligation.
- **[I]** Replace global fixed-point iteration with phase ordering, executable pre/post checks, deterministic canonical hashes, decreasing measures, cycle detection, and hard budgets.
- **[I]** Replace tree-only tiling with bounded region → layout → cover → schedule → allocation search. The upstream MachineIR baseline must always be selectable.
- **[I]** Keep both intrinsic/DSL and direct-assembly lowering; final linked-object disassembly and spills are gates.
- **[I]** Keep N1 and 920B cost profiles separate. Whole-kernel residuals must not directly rewrite per-instruction latency/throughput.
- **[I]** Audit measurement tooling before calibration. **[F]** The N1 script defaults to CNTVCT and its explicit PMU path reads field 4 of `perf -x,` output ([PMU script:42](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/run-pmu-sa8d-paired.sh:42), [PMU script:66](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/run-pmu-sa8d-paired.sh:66)); the current 920B table uses an assumed one-cycle calibration and contains zero fields ([SVE timing:73](/home/chiro/projects/a64-simd-dyn-optimizer/benchmarks/sve-timing-920b/timing_sve.c:73), [timing table:12](/home/chiro/projects/a64-simd-dyn-optimizer/benchmarks/sve-timing-920b/timing-920b.json:12)).

## Acceptance and stop gates

- **[I] M0:** exact oracle/seed behavior, guard-page/ABI correctness, legal final object, baseline selectable, and baseline performance reproduced within a preregistered noise-derived band. No speedup required.
- **[I] M1:** fail-closed restricted frontend; deterministic canonical graph; pass idempotence/no oscillation; graph/time/RSS caps.
- **[I] M2:** deterministic bounded candidate set; real RA/spill cost; second dataflow kernel; held-out prediction/rank gate fixed before results.
- **[I] M3:** exhaustive finite-table/transition checks where possible, guarded fallback, production per-call differential and canaries, real-distribution replay, and non-inferiority to frozen emitters.
- **[I] M4:** clean-checkout manifest-identical reconstruction, target/VL/ABI dispatch, bit-exact encoder output, and paired target non-inferiority.

**[E]** Fix numeric M0 performance and M2 rank-quality thresholds only after measuring harness noise and collecting a candidate corpus; preregister them before evaluating AGO output.

## Transition policy

**[I]** Coexist with layout search until each family independently satisfies clean rebuild, complete correctness/ABI/ISA gates, bounded deterministic search, and target non-inferiority for two releases. Then remove its old emitter from the active registry, but retain the frozen implementation and tests as regression oracles. Do not retire emitters after an arbitrary kernel count.

## Rationale

**[F]** Current generated/search code still loses to upstream hand assembly on quant ([end-to-end report:33](/home/chiro/projects/a64-simd-dyn-optimizer/reports/end-to-end-comparison-20260815.txt:33)); current search spaces already require strong manual pruning ([search driver:1414](/home/chiro/projects/a64-simd-dyn-optimizer/tools/search_sve2_layouts.py:1414)); and production differential found 92,999 state-update mismatches missed by the earlier reference route ([entropy replay:92](/home/chiro/projects/a64-simd-dyn-optimizer/reports/entropy-replay-920b-20260815.txt:92)). At the same time, the existing frozen release is bit-exact and measurably faster end to end ([release:10](/home/chiro/projects/a64-simd-dyn-optimizer/docs/51-release-best6b-20260815.md:10), [release:31](/home/chiro/projects/a64-simd-dyn-optimizer/docs/51-release-best6b-20260815.md:31)).

**[I]** This evidence favors a cautious transition: AGO should first match the frozen release’s standard, then replace it incrementally.
