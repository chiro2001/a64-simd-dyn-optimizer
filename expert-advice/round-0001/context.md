# Round 0001 context

- 本轮是第一个“实际优化迭代完成验证与 benchmark”的求助，符合
  `docs/06-agent-iteration-protocol.md`：每个实际优化 iteration 最多一次。
- 命令形状（本机已核对 CLI）：

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s read-only \
  -C "$PWD" \
  exec -o expert-advice/round-0001/response.md - < expert-advice/round-0001/prompt.md
```

- 关键文件（相对仓库根）：
  - `experiments/m4-search/iteration.md`
  - `experiments/m2-seed/iteration.md`
  - `generated/sa8d/roundtrip_sa8d_8x8.cpp`
  - `kernels/sa8d/candidates/cand-0001-balanced-reduction.cpp`
  - `experiments/m2-seed/imported/{machine-ir,pack-ir}.json`
  - `experiments/m0-foundation/benchmark/{summary.csv,pmu/net-per-call.csv}`
  - `experiments/m3-cost/static/*.json`
  - `isa/aarch64/sa8d-seed-ops.yaml`
  - `docs/02-system-architecture.md`、`docs/03-sa8d-end-to-end.md`、
    `docs/04-validation-benchmark.md`、`docs/05-roadmap.md`
- 环境：Oracle Cloud 2 vCPU Neoverse-N1（NEON/DotProd，无 I8MM/SVE），
  GCC 13.3.0，noise gate CV≤10%、taskset CPU0、5 进程×30 样本。
