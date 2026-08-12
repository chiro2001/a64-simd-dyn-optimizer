# Round 0007 context（M13–M22，重点 M21/M22）

## 本批 run-id 与关键文件

- `experiments/m13-dct8-roundtrip/iteration.md`（importer/codegen roundtrip
  与上游 bug 定位）
- `experiments/m14-dct8-cexact/iteration.md`（widen 修复 + 6 指令）
- `experiments/m15-dct8-protob/iteration.md`、
  `experiments/m16-dct8-protoc/iteration.md`（三手工原型与止损）
- `experiments/m17-fusion-feasibility/`（融合可行性）
- `experiments/m18-interp8/`（interp8 家族终态）
- `experiments/m19-cost-validation/`（跨家族成本模型 FAIL）
- `experiments/m20-search-loop/iteration.md`（搜索主循环 v0）
- `experiments/m21-dct8-upstream-contract/iteration.md`、
  `kernels/dct8/upstream_contract.cpp`（上游 kernel 通过 x265 内部 test；
  uniform 全范围 dct8 0.91%、dct16 0.0035% 分歧）
- `experiments/m22-dct8-structural-search/iteration.md`、`manifest.yaml`、
  `ranking.json`、`benchmark/{n1,920b}/`（本轮新 rewrite + 16 候选 + 5 候选
  实机 paired）
- `optimizer/ir/rewrites.py`（新增 `wide_loads`/`tree_to_mla`）、
  `optimizer/ir/codegen.py`（新增 vget_low/high、vtrn1/2q、vmlaq_n 路径）、
  `tools/search_driver.py`
- `experiments/m16-dct8-protoc/fitted-{n1,920b}.json`、
  `calibration-data.json`（现有成本模型校准）
- `docs/11-status-and-decision.md`（状态与决策点）
- `docs/09-instruction-fusion-analysis.md`（融合需求与 P0'–P7'）
- `expert-advice/round-0006/decision.md`（上一轮建议的处置）

## 关键事实摘要

- 三档目标与保留门槛见 docs/11；N+2（960）实机未接入；920B 无硬件 PMU，
  用 CNTVCT paired；N1 无 SVE。
- M22 新 rewrite 正确性：16 组合 codegen→编译→反汇编全过；含 widen 的
  5 候选本地 qemu 200k `candidate_mismatches=0`（C-exact）。
- M22 实机（90 pairs，latency，median neon/cand）：
  - N1：widen 0.8946 / +shift64 0.8906 / +wide_load 0.8638 /
    +tree_to_mla 0.8876 / all 0.8771；
  - 920B：0.9982 / 0.9971 / 0.9719 / 0.9823 / 0.9780。
  全部未达 round-0006 止损线（中心 >1.05 且 CI 下界 >1.00）。
- 静态条数：上游 343、widen 347、wide_load 335、tree_to_mla 345、
  all 337。计数下降不换算周期。
- 成本模型：family-scoped 关键路径逐 mnemonic 拟合（M16 4 点，920B
  R²=0.98、N1 0.81）；M19 跨家族留一法 Spearman N1=-0.21、920B=0.61。
  M22 新 mnemonic 权重缺省为 0，排序区分度不足。
- 上游 DCT8 pass2 `vsub_s16` 回绕 bug 已由 range 分析静态定位、
  `widen_overflows` 自动修复；pass1 无假阳性。
- 用户输入：内部鲲鹏 DCT 参考比开源快 30–60%（未提供反汇编/指令直方图）；
  920B 是 SVE1/VL=256/NEON4×128/SVE2×256，N+2(960) 是 SVE2.3/4×256。

## 命令形状（已核对 codex-cli 0.147.0）

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s read-only \
  -C "$PWD" \
  exec -o expert-advice/round-0007/response.md - < expert-advice/round-0007/prompt.md
```

只读后台异步执行；主流程不阻塞。响应落盘后写 `decision.md`；失败只记
`blocked.md`，不伪造。
