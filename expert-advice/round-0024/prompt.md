# Round 0024: AGO M2-M4 execution plan, N1 cost model, and the ideal graph-optimization paradigm

You are acting as an AArch64 SIMD / compiler / ML-systems review expert.
Do not modify source code, manifests, experiments, or build artifacts.
Write your final analysis only into this round directory
(`response.md`, optionally `summary.md`/`tooling-roadmap.md`), and keep
the session bounded (~150k tokens max; if you cannot finish, write your
partial conclusions into `response.md` and stop).

## Context you can trust

- `docs/52-ago-plan-20260816.md`: the AGO plan, revised by round-0023.
- `expert-advice/round-0023/`: the previous review (prompt/context/
  response/decision). Its decisions were accepted and are the current
  contract for AGO.
- `optimizer/ago/`: current AGO implementation (ir.py, frontend.py,
  passes.py, cover_neon.py, contracts/, graphs/).
- `reports/ago-m0-sa8d8-20260816.txt`: M0 acceptance (SA8D 8x8 vertical
  slice reproduced on N1 and 920B).
- `benchmarks/ago_sa8d_microbench.cpp`, `scripts/verify-ago-sa8d8.sh`:
  M0 gate patterns.
- `benchmarks/neon-timing-n1/timing-n1.json`,
  `benchmarks/sve-timing-920b/timing-920b.json`: first-cost-table
  versions, already rebuilt per round-0023 audit.
- Current HEAD: 1accad9 (M1 done); M2 in progress: satd8 8x8 second
  anchor (contract/graph/cover/verify/microbench), with uncommitted
  cover_neon.py helper additions.

## Current status (facts)

1. M0 (SA8D 8x8): pass. AGO cover reproduces upstream NEON within noise
   on N1 (0.985) and 920B (1.006); 20k oracle differential clean;
   final object legal/ABI-clean.
2. M1: pass. Restricted fail-closed DSL frontend reconstructs the same
   graph; deterministic canonical hash; pass pipeline with pre/post
   checks, decreasing measure, cycle detection, hard budget.
3. M2 in progress: satd8 8x8. We confirmed by simulation (20k random
   cases) that C `satd8<8,8>` (two SWAR `satd_8x4` bands) is
   numerically identical to upstream NEON `pixel_satd_8x8_neon`
   (`load_diff_u8x8x8 -> hadamard_4x4_quad -> vaddq -> vaddlvq`, no
   final shift).
4. User's stated ideal paradigm: automatically analyze kernel
   inputs/outputs/compute nodes, apply one pass at a time, then perform
   instruction matching with the fewest instructions (or minimal MCA
   cost). Current gap: graph is hand-imported or DSL-reconstructed;
   instruction selection is a single hard-coded NEON cover; passes are
   structural only (normalize/remove-unused).

## Questions

1. M2 scope: is "second dataflow anchor (satd8 8x8) + bounded cover
   search (2-3 NEON covers) + held-out cost-ranking gate" the right
   next step, or should something smaller/larger be done first? What
   should the held-out ranking gate concretely be (candidate corpus,
   noise protocol, pass/fail threshold), given N1 is a shared machine
   and 920B has no PMU?
2. Instruction selection: what is the minimal viable engine that turns
   an AGO IR region into 2-3 legal NEON covers with predicted cost, so
   that M2's held-out gate measures the *tool* rather than the kernel?
   Should scheduling/register allocation be in scope for M2 or deferred?
3. Cost model: is extracting LLVM `AArch64SchedNeoverseN1.td` + GCC
   `aarch64-sched-neoverse-n1.cc` + calibrating on N1 PMU the right
   way to rank NEON covers? What PMU events/protocol give latency vs
   throughput vs port pressure, and how should shared-machine noise be
   handled? How much does N1 ranking transfer to 920B NEON (same 4x128
   width, different microarchitecture)?
4. Paradigm gap: between the current hard-coded cover and the user's
   ideal (per-region pass + cost-driven instruction matching), what are
   the 2-3 highest-information steps? Should we build a real
   region->layout->cover->schedule->allocate search for satd8, or
   first build the cost/rank infrastructure and measure ranking
   quality on hand-written covers?
5. Known wins (PEXT table, DFA state table, full unroll, NEON-tail
   semantics) are M3 templates. Do they belong in the pass library
   (rewrite rules) or as parameterized cover templates? What is the
   smallest interface that keeps them composable and verifiable?
6. Failure modes for M2/M3: what is most likely to make this phase
   produce no measurable tool improvement (e.g., ranking gate too
   noisy, cover space too small, cost model overfit)? What should be
   pre-registered now to detect it early?

## Output requirements

- Separate (a) facts supported by cited files, (b) your inference, (c)
  suggestions needing experiment.
- Give at most 3 next experiments ranked by information gain, each with
  a falsifiable outcome.
- Do not modify the repository; only write to this round directory.
