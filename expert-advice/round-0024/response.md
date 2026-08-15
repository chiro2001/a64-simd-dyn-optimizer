# Round 0024 review: AGO M2–M4 and the N1 cost model

## Executive verdict

**Conditional GO for M2, with a smaller first gate.**  SATD 8×8 is the right
second anchor: it shares the input width and arithmetic domain with SA8D, but
has a genuinely different two-quadrant 4×4 dataflow.  It is therefore a useful
test of whether AGO can reuse a representation, rather than merely reproduce
one 8-point Hadamard lowering.  The shared worktree advanced during this
review from the prompt's `1accad9` snapshot to `5f9ae14`, which adds a narrow
A/B/C SATD8 tail-cover gate.  That gate is a useful foundation result, but not
yet evidence for a general held-out ranker.  The next plan should therefore be:

1. Finish and freeze a SATD8 baseline reproduction (contract, graph, one legal
   NEON cover, 20k/ABI/guard-page/object checks).
2. Build the candidate manifest, final-object feature extractor, noise probe,
   and rank evaluator on hand-written covers.  This is the first M2 gate; it
   does not require a speedup.
3. Expand the bounded SATD8 enumerator beyond the common-prefix tail and run a
   real region/family-held-out rank gate.

Do **not** make M2 a general graph-discovery project, a learned cost-model
project, or a custom register-allocation project.  A small schedule search and
real compiler/assembler allocation are in scope; a new allocator is not.
The N1 model is a useful prior and calibration target, but LLVM/GCC tables plus
the current timing programs are not yet a ranking oracle.  The 920B should be
treated as a separate, on-target validation profile, not as an N1 clone merely
because both have 128-bit NEON lanes.

## A. Facts supported by the repository

### A.1 AGO status and the actual gap

- The accepted sequence is already narrow: typed semantic/Pack/Machine IR,
  SA8D reproduction through cover/schedule/real allocation/final-object
  checks, restricted frontend, then a second anchor and bounded cover search
  with a held-out ranking gate [docs/52-ago-plan-20260816.md:20-38].  M2's
  stated acceptance is a deterministic bounded candidate set, real RA/spill
  accounting, and a rank-quality gate fixed before results
  [docs/52-ago-plan-20260816.md:78-86].
- M0 did what it was supposed to do: the upstream NEON baseline remains
  selectable, the final object was legal and ABI-clean, the 20k oracle had no
  mismatches, and the paired medians were 0.985 on N1 and 1.006 on 920B
  [reports/ago-m0-sa8d8-20260816.txt:3-20].  That is evidence of reproduction,
  not evidence that a search or cost model works.
- The current SATD8 contract describes the C `satd_8x4`-twice semantics and
  explicitly records the no-final-shift NEON identity
  [optimizer/ago/contracts/satd8.py:8-19].  The C reference is two 4-row
  bands [third_party/x265/source/common/pixel.cpp:238-289], while the upstream
  NEON path is `load_diff_u8x8x8 -> hadamard_4x4_quad -> vaddq -> vaddlvq`
  [third_party/x265/source/common/aarch64/pixel-prim.cpp:516-528].  The
  imported AGO graph preserves the two 4-row quadrants
  [optimizer/ago/graphs/satd8_graph.py:24-75].
- The graph-to-source code is still a fixed lowering.  `_build_satd8_source`
  asserts node counts and then emits one hard-coded sequence of helper calls,
  `vmax`, `vadd`, and `vaddlv`; it does not enumerate layouts, covers, or
  schedules [optimizer/ago/cover_neon.py:196-262].  The SA8D path has the same
  shape [optimizer/ago/cover_neon.py:151-193].  The SATD8 frontend tests check
  deterministic/structural reconstruction and source substrings, not a
  candidate ranking experiment [optimizer/ago/test_frontend.py:39-67].
- The current HEAD also has `covers_satd8.py`, but all three covers share the
  same load/Hadamard/`vmax` prefix and vary only the final add/reduce tail
  [optimizer/ago/covers_satd8.py:1-20, 65-90].  The accompanying report calls
  the A/B/C result a pass, but explicitly says it did not test full-region
  layout, scheduling, or register allocation [reports/ago-m2-satd8-covers-20260816.txt:19-32, 52-61].
- The report's “held-out” gate used three covers, three CNTVCT medians per
  target, a fixed 2% separability rule, and only two informative comparisons
  (A<C and B<C); A/B was intentionally a tie
  [reports/ago-m2-satd8-covers-20260816.txt:34-50].  This is a valid smoke gate
  for the plumbing, but it is not a family-held-out generalization test.

### A.2 What M1 does and does not type

- `Shape` has element, lane count, and vector bits; `Value` has a kind and
  optional stride; `Op` has a free-form kind and dictionary attributes
  [optimizer/ago/ir.py:16-43].  There is no result-value/type table for op
  outputs.  `canonical_hash()` includes the contract, input shapes, op names,
  operands, outputs, and attributes, but not output shapes, input kind/stride,
  or graph metadata [optimizer/ago/ir.py:45-69].
- The frontend is intentionally a restricted regex DSL with a finite set of
  recognized operations and fail-closed errors [optimizer/ago/frontend.py:8-18,
  43-134].  That demonstrates a deterministic importer; it is not yet an
  analyzer that discovers arbitrary kernel inputs, effects, packs, or compute
  nodes.
- There is a contract/implementation discrepancy worth resolving before
  extending the search.  The pass module says “no global fixed-point
  iteration” [optimizer/ago/passes.py:1-9], but `Pipeline.run()` currently
  reruns the complete pass list until the hash repeats, a cycle is found, or a
  budget expires [optimizer/ago/passes.py:83-112].  That may be a useful safety
  loop, but it is not the same observable protocol as a phase-by-phase
  one-pass pipeline.

### A.3 Measurement facts and known noise

- The plan identifies N1 as a PMU-capable 4×128 NEON target and 920B as
  SVE1+NEON with no PMU [docs/52-ago-plan-20260816.md:61-76].  The 920B timing
  README says its CNTVCT programs are an approximation based on one dependent
  chain and eight independent chains, with min-of-seven samples, and explicitly
  says they do not model VL-dependent split-uop costs
  [benchmarks/sve-timing-920b/README.md:6-36].
- The N1 program also uses min-of-seven CNTVCT runs.  Its nominal latency
  macro executes two vector operations per loop iteration (one on `a`, one on
  `b`), and its throughput macro uses eight independent chains
  [benchmarks/neon-timing-n1/neon_timing.c:36-99].  It reports `lat/calib` and
  `thr/calib`; it does not subtract a matched empty vector loop from each
  result [benchmarks/neon-timing-n1/neon_timing.c:282-327].  Thus the current
  JSON is a first, compiler-shaped sequence table, not a demonstrated isolated
  single-instruction latency/throughput table [benchmarks/neon-timing-n1/timing-n1.json:1-15].
- The paired script currently defaults to CNTVCT even when PMU is available;
  PMU must be requested explicitly [scripts/run-pmu-sa8d-paired.sh:37-47].
  Its current CSV parser correctly takes the count from field 1
  [scripts/run-pmu-sa8d-paired.sh:58-70], whereas the prose in the plan still
  describes the old field-4 audit item [docs/52-ago-plan-20260816.md:88-94].
  The documentation and the executable script should be kept in sync.
- Existing target guidance already says to use total CNTVCT ticks rather than
  per-call rounding and to use batches of at least 4096 on 920B
  [docs/49-quick-test-internal-20260815.md:245-253].  Real replay also found
  shared-node noise of roughly 5–10%, first-touch page faults of about 5×, and
  the need to warm caches and verify the binary hash
  [reports/entropy-replay-920b-20260815.txt:102-116].
- The repository has direct evidence that a good kernel microbenchmark is not
  an end-to-end gate: the best6b paired result has a broad shared-node CI even
  with only five plus five runs [reports/end-to-end-comparison-20260815.txt:42-55],
  while real-distribution replay was necessary to reverse several conclusions
  made by uniform synthetic inputs [reports/entropy-replay-920b-20260815.txt:54-68].
- The new cover benchmark runs three outer repetitions and takes a median, but
  invokes the baseline and candidate sequentially inside each cover binary;
  it does not randomize paired order or create independent process blocks
  [scripts/bench-ago-satd8-covers.sh:72-81, benchmarks/ago_satd8_microbench.cpp:54-73].

## B. Inference and recommended decisions

### B.1 M2 scope and the held-out ranking gate

The proposed ingredients are right, but “SATD8 + search + ranking” should not
be accepted as one undifferentiated milestone.  The newly recorded A/B/C gate
has passed its **narrow, pre-registered smoke criterion**; it should be marked
M2-foundation/conditional rather than promoted to a general rank-quality
claim.  SATD8 is informative because
its two 4×4 quadrants exercise grouping, scratch reuse, horizontal absolute
values, and a different reduction shape.  It is still small enough that every
candidate can be fully verified and inspected.

The next gate should measure **ordering quality**, not whether an arbitrary SATD8
candidate beats the upstream implementation.  Keep the upstream MachineIR/
NEON baseline in every corpus and let a candidate lose without failing M2.
The minimum corpus I would preregister for the *expanded* gate is:

| Item | Minimum for a meaningful gate |
| --- | --- |
| Region instances | 8 independent instances spanning SA8D/SATD subregions or shape/pack variants; two whole-kernel objects alone are too few |
| Covers per instance | Baseline plus two semantically distinct NEON covers (different layout/reduction/order, not just renamed source) |
| Final objects | At least 24 unique object hashes after compiler deduplication; otherwise report `foundation-only` |
| Split | Hold out one region or cover family (about one third of the corpus), not random variants of the same object |
| Informative comparisons | At least 30 pairwise comparisons whose measured confidence interval is outside the noise tie band |

The current A/B/C result is exactly the smaller case: it validates plumbing and
the direction of the obviously more expensive dual-reduce tail, but it has
only two informative pairs.  If the expanded budget cannot supply eight
instances, retain that result as `foundation-only` and explicitly defer the
rank claim.  Repeating one SATD8 function many times does not create
independent evidence.

For each candidate, freeze an immutable manifest containing contract hash,
region/node IDs, template and parameters, target ISA, compiler/version/flags,
source and final-object hashes, and verification evidence.  Reject before
timing if any of the following fails: semantic differential (including
boundary/stride/alias cases), ABI/guard-page checks, ISA check, unresolved call,
unexpected memory access, or spill/reload policy.  A candidate that compiles
to the same final object as another candidate is deduplicated, not counted as
search diversity.

Use a simple analytical model first.  A useful form for a straight-line
region is

```text
predicted cycles = max(critical-path latency,
                       max_resource(issued uops / resource capacity))
                   + load/store term
                   + spill/reload and branch penalties
                   + uncertainty
```

Do not multiply latency by throughput.  They are alternative bounds on the
same schedule, and multiplication double-counts work.  The model may be a
small monotone regression over opcode/resource/live-range features, but the
feature schema and coefficients must be frozen before the held-out split is
opened.  A ranker that can abstain on near ties is preferable to a forced
total order.

The present A/B/C predictor is below this bar: it sums a small tail opcode
multiset and uses `add_u16`, `maxv_u8`, and `paddl_u16` as proxies for different
width/type operations [optimizer/ago/covers_satd8.py:16-19, 85-116].  That is
fine for a smoke test, but it cannot predict a layout or schedule change in
the common prefix.  A and B are tied in that feature space by construction,
so their measured tie is not evidence that the model can distinguish two
schedules.

#### Noise-normalized pass/fail rule

First run a baseline-versus-identical-baseline probe with the exact binary,
batch, CPU pinning, compiler, and cache state used for candidates.  Let

```text
q_target = 95th percentile of |log(time_A/time_B)| for those duplicate pairs
MDE      = max(2*q_target, 1%)
```

These quantities are recorded before candidate results; the constants below
are fixed at that point, not chosen after seeing winners.  A pair whose 95%
paired interval lies within `±MDE` is a **tie** and is removed from rank-score
denominators.

For the N1 primary gate, require all of:

* at least 30 informative held-out pairwise comparisons;
* pairwise direction accuracy at least 0.75, with a block-bootstrap lower 95%
  bound of at least 0.60;
* tie-aware Kendall tau at least 0.60 (or Spearman rho at least 0.70, chosen
  before the run); and
* median top-1 regret per held-out region no larger than
  `max(2*q_target, 3%)`, with no statistically separable regression against
  the always-available baseline.

“Regret” is measured cycles of the chosen candidate minus the best measured
  candidate in that held-out region, not source instruction count.  If the
  baseline duplicate probe itself has a wide interval (for example, a shared
  host makes `MDE > 5%`), the result is `inconclusive-noise`, not a failed
  model and not permission to lower the threshold.

On N1, use randomized paired A/B blocks, pin to one CPU, warm the code and
input pages, alternate order, and run several independent process launches.
Bootstrap at the process/launch block level, not as if every batch were an
independent observation.  Record PMU scaling, migrations, frequency/governor
state, and binary hashes.  Use `METRIC=pmu` explicitly for the PMU arm and
retain CNTVCT as a second timing column.

On 920B, use the same corpus and split but total CNTVCT ticks, warmed buffers,
and batches of at least 4096.  Maintain a separate `q_920b`; do not use its
whole-kernel residual to edit an N1 per-op weight.  Treat 920B as a transfer
check: require at least ten informative pairs, at least 0.60 sign agreement
with the measured held-out ordering, and no confidence-separated regression
against baseline.  If fewer pairs survive the tie filter, report “transfer
unknown”; M2's tool-ranking result remains an N1 result.

### B.2 Minimal viable instruction-selection engine

The smallest useful engine is a deterministic finite pipeline, not a general
superoptimizer:

```text
typed region + boundary/effect summary
        -> pattern match and bindings
        -> finite layout/pack choices
        -> CoverTemplate emits typed MachineIR (or intrinsic/asm source)
        -> two or three explicit schedules
        -> compiler/assembler allocation
        -> final-object verifier and feature extractor
        -> cost/rank evaluator
```

The region boundary must carry input/output shapes, lane maps, strides and
alias assumptions, overflow/rounding mode, memory effects, and target
preconditions.  The current `Shape`/free-form `Op` vocabulary is not enough to
prove those properties once a cover introduces a reinterpret, pack, or tail;
extend the contract before adding a broad search.

Each `CoverTemplate` needs only:

* a canonical ID and parameter schema;
* a typed pattern and a fail-closed `match` predicate;
* an emitter for intrinsic/DSL and, where exact ordering matters, direct asm;
* a finite target/ISA/precondition declaration;
* covered node IDs and output mapping;
* an estimated feature vector (opcode/resource classes, bytes moved, live
  vectors, branches), later replaced by final-object measurements.

For SATD8, reasonable finite axes are quadrant/load order, horizontal
Hadamard schedule, and reduction form.  Keep the baseline and two alternatives
as first-class templates.  Enumerate in a canonical order with hard limits on
templates, live vectors, source size, compile time, and candidate count.

**Scheduling is minimally in scope.**  Enumerate a few explicit topological
orders (for example, finish one quadrant versus interleave both, and two
reduction trees), then inspect what the compiler actually schedules.  This is
enough to test whether the region/cover interface exposes a meaningful choice.

**A custom register allocator is deferred.**  Real compiler/assembler
allocation is nevertheless mandatory: disassemble the final object, extract
peak live registers and spill/reload counts, and reject an illegal or spilled
candidate according to a predeclared policy.  A candidate whose source looks
shorter but spills is not a low-cost candidate.  Add a custom allocator only
after a corpus demonstrates that allocation, rather than cover semantics, is
the dominant unexplained error.

This keeps M2's measurement about the tool.  If the compiler canonicalizes all
three templates to one object, the correct result is “cover space has no
diversity,” not a fabricated rank win.

### B.3 N1 cost model and PMU protocol

Extracting LLVM's N1 scheduling record and GCC's N1 DFA/resource model is the
right **starting representation**.  It is not safe to merge the two tables by
averaging numbers.  Normalize each source into an internal record with opcode
class, operand/width variant, latency, reciprocal throughput, resource mask,
load/store class, source version, and an uncertainty flag.  Keep disagreements
visible.  Calibrate only the opcode classes present in the candidate corpus,
then validate the model on held-out sequences.

The analytical split between latency, throughput, and resource pressure should
be measured as follows:

| Quantity | Controlled sequence | Primary observation |
| --- | --- | --- |
| Latency | Hand-written, one-destination dependency chain; enough unrolling to amortize loop/timer overhead | core cycles per dependent operation; verify retired instruction count and exact disassembly |
| Reciprocal throughput | Sweep 1, 2, 4, 8, and more independent chains until saturation | cycles per operation at the plateau; the knee exposes issue/resource limits |
| Resource/port pressure | Pair or mix opcode classes in a full-factorial small matrix, using the same independent-chain protocol | deviations from additive throughput plus target stall/resource events; fit resource vectors, do not infer a port from one opcode |
| Memory | Separate L1-hot, L2-hot, and streaming/load-use tests | load-to-use and bandwidth terms; never fold cache state into an arithmetic opcode weight |

Use `cycles:u` and `instructions:u` as the architectural baseline.  Add the
N1 events that `perf list` actually exposes for ASIMD/vector retirement,
frontend/backend stalls, L1D/L2D refills, and branch misses; record exact event
names/encodings and counter scaling.  There may be no public per-port counter,
so “port pressure” is normally a combination of static LLVM/GCC resource data,
mixed-op saturation, and stall evidence.  Do not invent a port count when the
PMU does not expose one.  Run event groups without multiplexing where possible,
or record `time_running/time_enabled` and reject badly scaled samples.

The current N1 benchmark needs an audit before it supplies coefficients: its
latency macro contains two operations per iteration and changing operands, and
its reported values include loop/reduction/extraction code.  A hand-assembled
microbenchmark with a matched empty loop is the clean calibration arm.  The
same issue is why the 920B SVE table cannot be used as a NEON instruction table;
it measures selected SVE forms and explicitly leaves some latency/throughput
fields null [benchmarks/sve-timing-920b/timing-920b.json:1-15].

N1-to-920B transfer is a hypothesis, not a consequence of width equality.
Different execution ports, reduction units, load/store queues, compiler
lowering, and frequency behavior can reorder covers with identical 128-bit
instruction counts.  Use N1 to provide a prior and a candidate shortlist;
update the 920B profile only from paired on-target measurements at kernel or
region granularity.  A rank correlation/transfer check such as the 920B rule
above is more honest than claiming that N1 latency numbers transfer.

### B.4 Closing the ideal-paradigm gap

The desired paradigm is best approached in three layers, with an observable
artifact at every boundary:

1. **Semantic layer:** a typed region DAG with explicit packs, lane maps,
   effects, and proof obligations.  Automatic discovery can remain restricted
   to DSL/LLVM/C patterns until this contract is stable.
2. **Search layer:** deterministic pattern matching over a finite layout/cover
   grammar, with schedule choices and the upstream baseline always present.
3. **Machine layer:** final-object allocation/disassembly, target-specific
   cost features, paired measurements, and an abstaining ranker.

The highest-information order is cost/rank infrastructure on hand-written
covers first, then the SATD8 finite enumerator, then one semantic rewrite
through the same machinery.  Building a full region→layout→cover→schedule→
allocate search before knowing whether the ranker can order hand-written
covers would conflate graph errors, compiler allocation, and measurement noise.
The architecture can expose all five stages now, but only SATD8-sized finite
domains should be implemented in M2.

The pass-loop discrepancy noted in §A.2 should be resolved by recording an
explicit phase ID and applying each phase once per pipeline invocation (or by
documenting the bounded repetition as part of the contract).  In either case,
record pass provenance and before/after canonical hashes in every candidate;
otherwise a rank result cannot be attributed to one rewrite.

### B.5 M3: rewrite rules versus cover templates

The known wins are mixed and should not all be put in one library:

| Win | Semantic status | Target implementation |
| --- | --- | --- |
| 4-bit PEXT table | A data-representation/control rewrite from mask compression to a finite table lookup, with alignment/size/precondition | NEON/scalar/table-lookup cover templates; guarded fallback |
| DFA state table | A semantic `state × symbol -> (next, add)` rewrite with finite transition proof and a large-value fallback | Parameterized table-load/index cover; target-specific alternatives |
| Full unroll | A bounded structural loop transform parameterized by trip count and code-size budget | Schedule/cover template for the resulting straight-line region |
| NEON tail semantics | A lowering contract describing exact tail lanes, pointer footprint, and no-overread/guard behavior | Tail cover template plus canary/guard-page verifier |

The smallest composable interface is two typed protocols sharing one proof
object, rather than a single opaque callback:

```text
Pattern.match(region) -> bindings or no-match
RewriteRule.apply(region, bindings) -> new_region + ProofObligations
CoverTemplate.emit(region, bindings, target) -> MachineIR + ProofObligations
Verifier.check(contract, artifact, obligations) -> evidence or failure
```

Every rule/template also declares `id`, phase, effect summary, shape/alias
preconditions, a decreasing/bounded measure, canonical parameter serialization,
and a fallback.  The candidate manifest records the chain of rule/template IDs
and bindings.  Finite tables get exhaustive domain checks; stateful rewrites
get production per-call differential; tail templates get guard-page and
canary checks.  This lets a PEXT rewrite compose with a NEON cover without
letting target-specific assembly silently become semantic authority.

### B.6 M2/M3 failure modes and preregistration

| Failure mode | Early observable | Pre-register now |
| --- | --- | --- |
| Shared-host noise dominates | Duplicate-baseline `q_target` exceeds the planned MDE; rank flips under order reversal | Noise probe, batch size, CPU pinning, warm-up, block bootstrap, and an `inconclusive-noise` verdict |
| Cover space is a clone | All alternatives have one final-object hash or identical feature vectors | Minimum object-hash diversity and a required axis/region split; otherwise `foundation-only` |
| N1 model overfits | Good training rank, poor leave-family-out rank or 920B sign reversal | Immutable train/held-out split, model/version hash, no held-out timing as a feature, transfer-abstain rule |
| Static count hides RA/ports | Fewer source instructions but more spills, backend stalls, or cycles | Final-object disassembly, live-register/spill features, and no-spill/ABI/ISA rejection |
| Timing harness measures compiler artifacts | Assembly differs from intended chain; instruction count is not the expected count | Hand-asm calibration, exact disassembly check, matched empty loop, event scaling record |
| SATD/NEON boundary mistake | Max-contrast/checkerboard/stride/alias or guard-page mismatch | Correctness before timing; adversarial corpus, 20k random, ABI, red-zone/canary, and production differential before M3 |
| Pass ordering/cycle or search explosion | Canonical hash oscillation, nondeterministic candidate IDs, RSS/time growth | Phase order, strict measure/budget, hash/provenance logging, and hard candidate/time/RSS caps |
| Correct rank but no encoder gain | Region rank is positive while hot-call share is small or E2E CI overlaps zero | Do not make E2E speed a M2 gate; require real-distribution replay and non-inferiority only in M3/M4 |

The existing protocol already says to stop benchmarking at the first
correctness failure and to distinguish `inconclusive-noise` from a rejected
performance result [docs/06-agent-iteration-protocol.md:67-89].  That should be
the explicit M2/M3 ledger, rather than silently changing a threshold after a
noisy run.

## C. Suggestions needing experiment: three next experiments

### 1. Noise probe plus held-out rank audit on hand-written final objects

**Information gain:** highest; it isolates the rank tool from SATD8 graph
construction.

Build the minimum corpus above from existing SA8D/SATD NEON forms and two
deliberately different reduction/load schedules per region.  Freeze features,
the analytical model, the split, and the constants  before opening candidate
timings.  On N1, collect randomized paired PMU cycles/instructions and CNTVCT
with at least three process blocks; on 920B, collect warmed total CNTVCT ticks
with the same split.  First collect duplicate-baseline pairs to obtain
`q_N1` and `q_920b`.

**Falsifiable outcome:** N1 passes only if the four rank criteria (30
informative pairs, 0.75 pairwise accuracy with the stated lower bound, tau/rho,
and top-1 regret) all pass.  If not, classify the result as `rank-failed` (or
`inconclusive-noise` when the duplicate probe is too wide) and do not start a
larger search.  The 920B result is either `transfer-supported` under its sign
rule or `transfer-unknown`; no N1-based speedup claim is allowed.

### 2. Clean N1 PMU calibration and cross-target transfer matrix

**Information gain:** identifies whether a bad rank is a model problem or a
measurement problem.

For only the NEON opcode classes used by the corpus, compare (a) LLVM resource/
latency data, (b) GCC DFA data, (c) hand-assembled dependency chains, (d)
independent-chain saturation sweeps, and (e) mixed-op resource probes.  Run
cycles/instructions plus whichever ASIMD, stall, and cache events the target
actually exposes.  Use matched empty loops and save disassembly and event
scaling.  Apply the frozen model to the same final objects on N1 and then
measure the held-out ordering on 920B by CNTVCT.

**Falsifiable outcome:** the model is usable only if isolated-chain residuals
are stable across repeats and its held-out N1 ordering meets Experiment 1's
thresholds.  If LLVM and GCC disagree materially or N1 and 920B rank
correlation is below the preregistered transfer threshold, retain separate
profiles and require on-target ranking; do not average the tables or infer
920B instruction costs from whole-kernel residuals.

### 3. Bounded SATD8 region→layout→cover→schedule experiment

**Information gain:** tests the actual AGO search boundary after ranking and
measurement are trustworthy.

Use the imported SATD8 graph, enumerate exactly two alternative cover families
and a small fixed set of quadrant/load/reduction schedules, include the
upstream baseline, and cap the total at a predeclared number (for example 24
final candidates).  Lower through both intrinsic and direct-assembly paths
where available, perform the full correctness/ABI/ISA/guard funnel, and record
final-object hashes, live registers, spills, static features, predicted cost,
and measured rank.  Do not add a custom allocator or an M3 table rewrite in
this experiment.

**Falsifiable outcome:** M2 search is a success only if it emits at least three
distinct legal final objects, remains deterministic under rerun, has no
unaccepted spills/calls, and its held-out ordering satisfies Experiment 1.  A
single object, an exhausted budget, or a rank failure is a useful negative
result: the next change must target the cover grammar, type/effect contract,
or cost model rather than silently enlarging the search.

No M2 experiment should claim an end-to-end encoder win.  M3 can promote a
template only after finite-domain/transition proof, production differential and
canary checks, real-distribution replay, and non-inferiority to the frozen
emitter; M4 then remains the clean-rebuild/dispatch/freeze integration gate
specified in the plan [docs/52-ago-plan-20260816.md:80-86].
