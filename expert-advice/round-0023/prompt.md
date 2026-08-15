# Round 0023: AGO - automatic graph optimization backend for x265 SIMD kernels

You are acting as a compiler/architecture/ML-systems review expert. Do not
modify the repository; write your analysis and recommendations only into
this round directory (`response.md`, `decision.md`).

## Proposed architecture (docs/52)

1. Frontend/GraphBuilder: kernel contract + C reference + seeds +
   disassembly -> typed dataflow graph (SSA DAG with shapes/stride/
   constants).
2. AGO IR: unified cross-kernel IR (entropy/pixel/transform).
3. Pass pipeline: normalization (constant folding, shape normalization),
   dataflow transforms (table-ization, DFA-ization, full unroll, fusion,
   permute coalescing), fixed-point iteration; each pass declares
   pre/post invariants and cost impact.
4. Instruction selection / tiling: Op nodes -> target ISA instruction
   cover (NEON subset first), candidates (templates/sdot/mla/table),
   cost = latency x throughput x register pressure/spill.
5. Cost model: extract latency/throughput from LLVM
   AArch64SchedNeoverseN1.td + GCC aarch64 model, calibrate with N1 PMU
   microbenchmarks, backfill 920B SVE costs via CNTVCT batch microbenches.
6. Verification: reuse 20k + production per-call differential + canary.
7. Feedback loop: candidates -> real-distribution replay / PMU -> cost
   table update -> re-select.

The backend would be added as `--backend ago` alongside existing
backends, not replacing the current search/injection/freeze pipeline.

## Questions

1. Architecture: is the linear flow "build graph -> passes -> selection ->
   verify -> feedback" the right skeleton? What are the 2-3 highest-risk
   components and how should they be sequenced (e.g., GraphBuilder first
   vs instruction selection first)?
2. GraphBuilder: for dataflow kernels (transform/interp/pixel) automatic
   graph construction from a C reference is plausible; for state-machine
   kernels (costC1C2Flag, costCoeffRemain, scanPosLast) how should AGO
   handle them? Should the frontend start with a narrow kernel class
   (e.g., pure dataflow) and encode the known wins (table PEXT, DFA) as
   parameterized templates rather than try to invent them?
3. Pass semantics: how should pass pre/post conditions and convergence
   be specified in practice? How should the existing OpIR rewrites
   (ProofObligation/ProofCertificate) evolve into a pass framework
   without a formal verifier?
4. Instruction selection: is covering tiling with a hand-built cost
   function the right approach, or should AGO emit a small DSL that
   GCC/clang compiles (given that compiler codegen lost to hand asm on
   quant)? What is the minimal instruction subset to start (NEON
   add/mla/load/permute/hadamard/dotprod) and how to avoid combinatorial
   explosion in candidate matching?
5. Cost model: how reliable is LLVM's AArch64SchedNeoverseN1.td as a
   starting point, and what is the cheapest calibration protocol on N1
   PMU (which events give latency vs throughput vs ports)? How should
   SVE1 2x256 costs on 920B be estimated without PMU?
6. Neoverse-N1 utilization: it has NEON+dotprod but no SVE and only 2
   visible cores (cgroup-limited?). Is it suitable for (a) calibrating
   NEON instruction costs, (b) validating AGO candidates against
   upstream NEON, (c) anything else? Any PMU caveats on shared/limited
   machines?
7. Milestones M0-M4 in docs/52: order, which can be parallelized, and
   acceptance gates. Should AGO coexist with layout search indefinitely,
   or have a defined transition (e.g., once N kernels are AGO-produced,
   retire per-kernel emitters)?
8. Failure modes: for this class of project, what are the most common
   ways it dies (unscalable frontend, pass non-convergence, cost model
   drift, selection explosion, verification gap) and what pre-commit
   gates should be set at each milestone?

Separate claims into (a) supported by cited files, (b) your inference,
(c) needs experiment.
