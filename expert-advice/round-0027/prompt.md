# Round 0027: 16-lane 双组 lowering 已过门禁后的下一步方向

你是资深编译器/架构/形式化方法专家。请只读以下文档（不要修改除本
轮输出外的任何文件，输出只写 `expert-advice/round-0027/`）：

- `docs/52-ago-plan-20260816.md`（AGO 规划与 M0-M4 状态）
- `docs/59-handoff-20260816.md`（权威交接）
- `docs/70-backlog-20260817.md`（当前 backlog）
- `docs/71-isa-conversion-capability-20260817.md`（NEON→SVE 转换能力）
- `docs/72-16lane-emitter-design-20260817.md`（16-lane 双组发射器设计）
- `docs/65-ir-granularity-audit-20260816.md`、`docs/66-multi-isa-kernels-survey-20260816.md`
- `expert-advice/round-0026/decision.md` 与 `response.md`
- `reports/` 下最近实测：n1/710 freeze、pure-sve-dct-710、950 E2E
  regression、920B 内网 best9
- `data/kernel-test-db.csv`（测试数据库）

背景要点：AGO 已产出可发布集 best9-minus-remain + dct IR（N1/710
双批 +2.0~2.4%，bit-exact）；950 上 dct8/16/32 opbase 注入 +0.79%。
纯 SVE（VL=128）dct16/32 全门禁通过但 710 实机 E2E -2.63%（回归，
默认不注入）。16-lane 双组发射器（VL=256、0 NEON）刚通过
TestBenchLite 多 seed + 跨 VQ 20k 差分；dct32 同法尚未完成。P3
ranker 的 MCA 基线 acc=0.778/tau=0.556 未达门（缺“MCA+有效标签”
同组候选）。契约语料已到 100 行。

请回答：

1. 完成 dct32 16-lane 后，与 op-backend 同宽对比、950 实机注入的
   优先级，相对于纯 SVE（VL=128）性能调优、ranker 数据补齐、新
   kernel 家族（interp8/satd/sa8d 16-lane）分别如何排序？给出
   信息增益最高的 1-3 步及验收门禁。
2. 双组打包引入了较多 tbl2 洗牌（combine_g0/quad_pack）；VL=256
   下是否有更优数据布局可消除这些跨组打包，或这种打包在 950
   （SVE2 2x256）上是否可接受？如何用最小实验证伪？
3. 16-lane 发射器的正确性门禁现在依赖 TestBenchLite + 跨 VQ 差分；
   有没有更便宜或更强的等价性证明/测试策略（例如按 pass 插桩、
   只验证中间值、或用上游 C 参考做逐块差分）？
4. 数学上：除 M3 的 PEXT/DFA 穷举证明外，下一步最可证明、最有
   信息量的声明是什么（例如双组 lowering 相对 fused8 DAG 的逐
   语句等价、VL 无关性、或 ranker 的 regret 界）？

用中文回答，结构化，1200-1800 字，结论可执行，明确区分事实/推断/
需实验验证。
