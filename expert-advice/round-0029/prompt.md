# Round 0029：AGO 下一步方向、生成算子性能提升、优化通用性扩展

你是资深编译器/微架构/向量指令优化专家。请先读 `expert-advice/round-0029/context.md`
（含最新事实与文件路径），并按需阅读下列文件（不要无限深挖；控制总阅读量，
优先 context、DB、docs/72、docs/73、docs/77、round-0028 的 response/decision）：

- `docs/52-ago-plan-20260816.md`、`docs/59-handoff-20260816.md`
- `docs/65-ir-granularity-audit-20260816.md`、`docs/66-multi-isa-kernels-survey-20260816.md`
- `docs/70-backlog-20260817.md`、`docs/71-isa-conversion-capability-20260817.md`
- `docs/72-16lane-emitter-design-20260817.md`、`docs/73-best9-irdct-freeze-20260817.md`
- `docs/77-dual-sve16-coverage-20260817.md`、`reports/950-sve16-dual-lane-20260817.txt`
- `expert-advice/round-0028/response.md`、`expert-advice/round-0028/decision.md`
- `data/kernel-test-db.csv`（264 行，含 950 sve16 8 行）
- 工具源码可按需查看：`tools/ranker_eval.py`、`tools/calibrate_machine_cost.py`、
  `tools/m4_declaration.py`、`optimizer/ir/dual_sve16.py`

背景要点（2026-08-17，git df3ca35）：
- 发布冻结集 best9-minus-remain + dct IR：N1/710/920B 三臂 +2.0~2.7%、
  bit-exact、CI 不跨零；950 上 dct8/16/32 opbase 30f +0.79%（bit-exact）。
- 950 最新实机：sve16 双组 16-lane 纯 SVE dct16/dct32 全门禁 PASS，
  但比上游 SVE/NEON 慢 1.5-3.5x——静态 fused_uop 优势不转实机周期。
- 950 op-backend 仍是 kernel 级赢家：dct16 op895 +29% vs SVE（NEON 仍快
  ~14%）；dct32 op4032 +71% vs SVE/+40% vs NEON（非 bit-exact，策略门控）。
- 反复出现的教训：静态指令数/MCA 低 ≠ 实机快（sao/satd/pure-SVE/i8mm
  均出现过“静态赢、实机输或消失”）；op-backend 的融合形态是少见的
  静态与实机都赢的例外。
- M4 声明只差 950 E2E（30f/100f 冻结集）；自主侧已收敛。

请回答三个问题（用中文，结构化，1200-2000 字，结论可执行）：

1. **项目发展方向**：在 950 E2E 完成后，AGO 最值得投入的 2-4 周方向是
   什么？给出排序与退出条件（例如：搜索/成本代理、op-fusion 后端、
   新 kernel 家族、模板库、形式化证明）。
2. **如何进一步提升生成算子的性能**：针对“静态赢、实机输”这一核心
   问题，最有信息增益的 1-3 个具体改动是什么（例如实机延迟代理、
   关键路径/lane 宽度建模、融合后端优先、微基准门禁前移）？每个给出
   最小可证伪实验与验收指标。
3. **如何进一步扩展优化通用性**：目前 IR 覆盖 NEON/SVE1/SVE2/SVE2p3、
   多 kernel 家族；下一步扩通用性的最高杠杆是什么（新 kernel 族、
   自动多 ISA 生成、跨机器迁移、还是通用 fused 后端）？给出理由。

明确区分“由已有文件支持的事实”“推断”“需要实验验证的建议”。
不要修改仓库；只把最终建议写入 `expert-advice/round-0029/`（可以写
`response.md`，如需可另写 `summary.md`/`tooling-roadmap.md`/
`verification.md`）。不要探索无关历史文档。
