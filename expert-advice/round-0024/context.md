# Round 0024 context

## Task

Review and optimize the AGO execution plan for M2-M4 (docs/52), the N1
cost-model path, and the gap between the current hard-coded NEON cover
and the user's ideal automatic graph-optimization paradigm.

## Status summary (facts)

- HEAD 1accad9; working tree has uncommitted `cover_neon.py` additions
  (hadamard_abs_4_h / hadamard_4x4_quad helpers for the satd8 anchor).
- M0 acceptance: `reports/ago-m0-sa8d8-20260816.txt` (N1 6759 vs 6861,
  920B 19830 vs 19718; verify_bad=0).
- M1 acceptance: commits 43dfc7e (frontend) + 1accad9 (passes), unit
  tests in `optimizer/ago/test_frontend.py`, `test_passes.py`.
- M2: satd8 8x8 in progress. Numeric identity C vs NEON confirmed by
  simulation (20k random cases, 0 mismatches): C `satd8<8,8>` = two
  `satd_8x4` SWAR bands; NEON = load_diff_u8x8x8 -> hadamard_4x4_quad
  -> `out[0]+=out[1]` -> `vaddlvq_u16` (no final shift).
- N1: 129.146.162.16 (Neoverse-N1, NEON 4x128 + dotprod, no SVE, PMU
  works); 920B: 124.70.206.229 (SVE1 2x256 + NEON 4x128, no PMU,
  CNTVCT 100MHz). Both used for M0 paired runs.
- First cost tables exist: `benchmarks/neon-timing-n1/timing-n1.json`,
  `benchmarks/sve-timing-920b/timing-920b.json`.

## Files to read

- `docs/52-ago-plan-20260816.md`
- `expert-advice/round-0023/prompt.md`, `context.md`, `response.md`,
  `decision.md`
- `optimizer/ago/ir.py`, `frontend.py`, `passes.py`, `cover_neon.py`,
  `contracts/sa8d8.py`, `graphs/sa8d8_graph.py`
- `optimizer/ago/test_frontend.py`, `test_passes.py`
- `scripts/verify-ago-sa8d8.sh`, `benchmarks/ago_sa8d_microbench.cpp`
- `reports/ago-m0-sa8d8-20260816.txt`
- `benchmarks/neon-timing-n1/neon_timing.c` + `timing-n1.json`
- `benchmarks/sve-timing-920b/timing_sve.c` + `timing-920b.json`
- `third_party/x265/source/common/pixel.cpp` (`satd_8x4`, `satd8<8,8>`)
- `third_party/x265/source/common/aarch64/pixel-prim.cpp`
  (`hadamard_4x4_quad`, `pixel_satd_8x8_neon`)
- `docs/06-agent-iteration-protocol.md` (expert-advice protocol)

## Launch command (recorded for audit)

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s workspace-write \
  -C "$PWD" \
  exec -o expert-advice/round-0024/response.md \
  - < expert-advice/round-0024/prompt.md
```
