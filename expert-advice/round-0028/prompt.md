# Round 0028：AGO 搜索如何做得更好、能否数学证明、下一步

你是资深编译器/架构/形式化方法专家。请只读以下文档（不要修改除本
轮输出外的任何文件，输出只写 `expert-advice/round-0028/`）：

- `docs/52-ago-plan-20260816.md`、`docs/59-handoff-20260816.md`
- `docs/65-ir-granularity-audit-20260816.md`、
  `docs/66-multi-isa-kernels-survey-20260816.md`、
  `docs/67-kernel-test-db-20260816.md`、`docs/70-backlog-20260817.md`、
  `docs/71-isa-conversion-capability-20260817.md`、
  `docs/72-16lane-emitter-design-20260817.md`、`docs/73-*.md`
- `expert-advice/round-0026/`、`round-0027/` 的 response/decision
- `data/kernel-test-db.csv`、`data/contract-corpus.csv`
- `tools/ranker_eval.py`、`tools/calibrate_machine_cost.py`、
  `tools/m4_declaration.py`（可读源码）

背景要点（2026-08-17，git b6228a9）：AGO 已冻结发布集
best9-minus-remain + dct IR（N1/710/920B 三臂 +2.0~2.7%，bit-
exact）；950 上 dct8/16/32 opbase 注入 30f +0.79%。P3 ranker
family 留出已达标（acc 0.917/tau 0.871/regret 1.53pp，31 可分辨
对），带会弃权原型（λ=10%, coverage 83%）。四机成本模型
N1/920B LOOCV Spearman 0.88/0.91。P4 butterfly-quarter 模板
已覆盖 SVE2/NEON dct16/32 全 kernel。saoCuOrg E0/B0/E1 SVE2
落地（57/129 fused_uop vs NEON 219/517）。DB 174 行。M4 声明
只差 950 实机数据（用户侧）。

请回答：

1. 搜索怎么做得更好：给定现在的 DAG 搜索 + 静态 fused_uop 排序 +
  四机成本模型 + 残差 ranker（会弃权），在“搜什么”和“怎么选”上
  最有信息增益的 1-3 个具体改动是什么（例如搜索空间算子、
  MCA/实机成本联合代理、基于契约的候选生成、上下文 bandit）？
  每个给出最小可证伪实验与验收指标。
2. 数学上能证明什么：除已完成的 PEXT/DFA 穷举和 dot-fusion harness
  外，下一步最值得证明的声明是什么——例如带弃权 ranker 的 regret/
  coverage 界、成本模型在机器间的迁移界、B&B 搜索最优性、或模板
  lowering 的逐语句等价？哪些证明对 M4/发布有实际决策价值，哪些
  只是学术装饰？
3. 项目下一步：在不依赖 950 实机的前提下，AGO 未来 2-4 周最有价值
  的推进路径是什么（新 kernel 家族、纯 SVE 发射模式、搜索/ranker
  迭代、还是模板库扩张）？给出排序和退出条件。

用中文回答，结构化，1200-2000 字，结论可执行，明确区分事实/推断/
需实验验证。
