# Round 0023 context

## Task

Review the AGO (AArch64 SIMD Graph Optimizer) plan
(docs/52-ago-plan-20260816.md): an automatic graph-optimization backend
for x265 SIMD kernels on 920B (SVE1 2x256 + NEON 4x128), leveraging a
Neoverse-N1 machine (PMU, NEON+dotprod only) for cost-model calibration
and tool validation.

## Current toolchain status (facts)

- Search driver: tools/search_sve2_layouts.py (backends acle/asm/op/gen),
  layout-axis cartesian search + emitters (60+ emit_*_sve2_shared.py),
  verification funnel (2k/20k QEMU differential + TestBenchLite),
  performance proxies (QEMU fused uop primary, LLVM-MCA NV2, target
  throughput lower bound, NV2 critical path), optional 920B CNTVCT
  paired ranking.
- OpIR (optimizer/ir/): per-kernel op DAG (dct16/dct32/interp8), manual
  spec plans, rewrite rules with ProofObligation/ProofCertificate,
  op_emit template lowering, asm_ir reverse analysis, permute_search.
  Graph is hand-built, not automatically derived from kernel semantics.
- Verification: 20k differential (QEMU/cross) + production per-call
  differential (18.96M real calls) + canary red-zones + real-distribution
  replay timing. Injection/freeze pipeline works (best7 = 21 slots,
  -1.4~-1.9% E2E, bitstream bit-exact).
- Known gap: generated code loses to hand-written upstream NEON on
  quant (3 attempts, 12-13 vs 9 ticks), dct32 (0.93-0.97 substituted),
  interp8, sad16 (1.8x), sa8d8 (0.434); wins came from manual algorithmic
  inventions (table PEXT, DFA state tables, full unroll, NEON tail
  semantics) that the search tool cannot discover.

## Target machines

- 920B: SVE1 2x256 + NEON 4x128, no PMU (CNTVCT only), shared noisy node.
- Neoverse-N1 (129.146.162.16): aarch64, CPU part 0xd0c, NEON 4x128 +
  dotprod (flags include asimd/asimddp), NO SVE; PMU works
  (`perf stat -e cycles,instructions` OK). LLVM source available with
  AArch64SchedNeoverseN1.td; GCC N1 model file not yet downloaded.

## Files to read

- `docs/52-ago-plan-20260816.md` (the plan under review)
- `docs/51-release-best6b-20260815.md`, `docs/49-quick-test-internal-20260815.md`
- `reports/negative-ledger-20260815.md`, `reports/end-to-end-comparison-20260815.txt`
- `optimizer/ir/*` (OpIR, rewrites_dct32, op_ir, asm_ir, permute_search)
- `optimizer/analysis/{cost,critical_path,fusion}.py`
- `tools/search_sve2_layouts.py`, `tools/search_rewrite_sequences.py`
- `tools/gen_sve2_emit.py` (family detection: fir/hadamard/planecopy)
