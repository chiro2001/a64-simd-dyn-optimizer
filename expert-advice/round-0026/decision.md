# Round 0026 decision

状态：response.md 于 2026-08-16 落盘（bash `codex exec -p sss`，
gpt-5.6-sol / max，只读）。执行 Agent 处置：

| 建议 | 处置 | 对应动作 |
| --- | --- | --- |
| 投入分配：语义模板 40% / 测量与成本模型 30% / 有界搜索 20% / 学习式排序 10%；按 Amdahl 分数选目标 | **accept** | 后续迭代按此分配资源；热点目标用 hot_share×(1-1/speedup) 排序 |
| 数学证明边界：有限 grammar 域内最优可穷举/B&B 证明；bit-exact 需 SMT bit-vector/穷举；排序只有统计界（置信序列/经验 Bernstein），0.975 不是一致性证明 | **accept** | 新增候选附证明类型（穷举/SMT/测试义务）；排序声明改统计界表述 |
| 6 个月路线（profile/消融→契约语料→四机模型+弃权 ranker→有界搜索+模板→M4 独立声明） | **accept** | 更新当前 plan；M4 门：四机不回退且至少两机相对 best9 额外 ≥0.5pp、CI 不跨零 |
| 950 严格 bit-exact E2E 是 0-1 月第一优先 | **accept（外部依赖）** | 仍缺 950 host+yuv；流程/媒体/bundle 已备好 |
| op4032 只进政策分支 | **accept** | 维持“默认不发布、需策略签字” |

并行完成（咨询期间）：interp8 hpp IR 9 形状接入注入链
（AGO_IR_FILTER=1，0 skip，ISA 门禁过，commit e3d6412）。
