# 顶级模型分析请求（round-0013，GPT-5.6-sol）：DCT32 工具化搜索验收与下一步

你是本项目的顶级模型分析顾问。请先阅读
`expert-advice/round-0013/context.md`，然后在本仓库
`/home/chiro/projects/a64-simd-dyn-optimizer` 内分析并产出建议。

## 沙箱与输出约束

- 可写会话（用户裁定 2026-08-13）：只允许写
  `expert-advice/round-0013/` 下的 `summary.md`、`tooling-roadmap.md`、
  `verification.md`；严禁改动源码、manifest、实验产物或其它文件。
- 严禁读取 `/tmp` 或仓库外文件；内部 DCT16/DCT32 参考只允许引用
  docs/18、docs/20 已脱敏聚合指标。

## 背景摘要（自 round-0012 以来）

round-0012 建议的 P0（轴解耦）/P1（typed LayoutIR + 原子 rewrite）已
推进到：

- P0 轴：pass1_k2_slice / odd_lowering / narrow_batch /
  constant_layout 全部独立可搜索，消融数据见 docs/20；
- P1：`optimizer/ir/layout_ir.py`（Plan + canonical_key + verify_layout）
  + `optimizer/ir/rewrites_dct32.py`（5 个原子 rewrite +
  ProofCertificate），`rediscover_v31(spec)` 精确复现 v3.1 plan；
- `tools/search_plans.py`：18 个 rewrite 子集 → 分层漏斗（语义 18 →
  canonical 18 → 唯一源码 12 → 实测 12），每个候选编译 + 20k 上游差分 +
  true-dynamic trace，best = 3962（零 scatter），全程无 `layout` 预设；
- `optimizer/analysis/layout_verify.py::check_source`：pass32_impl 逐指令族
  计数与 plan 声明比对 + 零 scatter 硬门，search_plans 编译前自动执行；
- 其他：interp8 接入 TestBenchLite 并修复整宽越界写（127）、SVE2p3
  canary 就绪（QEMU 11.0.3 SIGILL）、manifest `layout_prune` 通用轴依赖
  （P2 第一块，520/520 与旧硬编码等价）。

## 请输出

1. **E1 验收反驳/确认**：当前“搜索空间由 rewrite 定义、实测重发现
   3962”是否足以作为盲重发现验收？剩余差距（lower 仍用 C++ 块、
   canonical key 未在 codegen 前去重、tiles 语义未逐 op 化）哪些必须
   在下一批补齐，哪些可以延后？
2. **下一轮按信息增益排序 1-3 个实验**：例如 op 级原子后端、
   row_group=8（需要 accumulator 调度）、interp8 path-B 语义验证、
   NEON→NEON 同算力消融、或把分层搜索接入主搜索驱动。
3. **工具路线细化**：search_plans 与 search_sve2_layouts 如何合并
   （canonical-key 预去重、预算分层、多 kernel 推广），以及
   layout_verify 如何扩展成 ProofReport 驱动搜索剪枝。
4. 明确区分“事实 / 推断 / 需要实验验证的建议”。

## 输出文件（写到 expert-advice/round-0013/）

- `summary.md`：10 行以内结论摘要；
- `tooling-roadmap.md`：第 2-3 项详细路线（按收益/风险排序）；
- `verification.md`：每项建议的验证标准。

最终答复请给 10 行以内的要点版总结。
