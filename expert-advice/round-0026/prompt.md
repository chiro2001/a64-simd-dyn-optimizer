# Round 0026: AGO 搜索改进、数学可证性与下一步路线

你是一名资深编译器/架构/形式化方法专家。请以只读方式完整阅读以下
文档（不要修改任何文件）：

- `docs/52-ago-plan-20260816.md`（AGO 规划与 M0-M4 状态）
- `docs/59-handoff-20260816.md`（当前状态权威交接；历史细节再看
  `docs/59-history-20260816.md`）
- `docs/65-ir-granularity-audit-20260816.md`（IR 宽度无关链路）
- `docs/66-multi-isa-kernels-survey-20260816.md`（多 ISA 家族全景）
- `expert-advice/round-0024/decision.md` 与 `response.md`
- `reports/ago-m2-expanded-ranking-20260816.txt`、
  `reports/ago-m3-pext-template-20260816.txt`、
  `reports/ago-m3-dfa-template-20260816.txt`
- `data/kernel-test-db.csv`（测试结果数据库）

背景要点：AGO 是 x265 AArch64 kernel 的自动图优化 sidecar——宽度
无关 IR + 多目标 lowering（NEON/SVE1/SVE2/SVE2p3）+ 有限布局/cover
搜索 + 代价表排序；门禁 = 20k QEMU 差分 + TestBenchLite + 实机
bit-exact；目标机 N1（NEON-only）/920B（SVE1 VL256）/710（SVE2
VL128）/950（SVE2 2x256）。

现状：M0-M2 完成（SATD8 17 实例留出排序门：N1 acc 0.975 / tau
0.951、920B acc 1.000、N1→920B 成本表迁移 acc 1.000）；M3
PEXT/DFA 模板有穷举证明 + 真实回放收益（scan E2E -1.6~-1.8%、
remain +0.25pp）；M4 接口已存在但无独立 E2E 声明；best9 整包 E2E：
920B -2.06%/-2.02%、N1 -1.52%、710 -1.53%，距 15% 目标差 ~13pp。

请回答三个问题：

1. AGO 的搜索如何做得更好以逼近最优性能？请比较搜索空间设计、成本
   模型、模板/语义重写、学习式排序等方向的投入产出，给出最优先的
   组合。
2. 能否用数学证明？请明确什么能证明、什么不能（例如：给定搜索空间
   的最优性、排序一致性/regret 界、程序等价性与 bit-exact 证明、
   NP 困难性与剪枝界），并给出可落地的证明形式与实验设计。
3. AGO 项目下一步该做什么？按优先级给出可执行路线（6 个月尺度），
   每步写明门禁与验收标准。

用中文回答，结构化、控制在 1200-1800 字，结论要可执行。
