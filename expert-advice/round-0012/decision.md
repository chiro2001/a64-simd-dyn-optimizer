# Round 0012 处置（执行 Agent）

会话状态：GPT-5.6-sol（sss profile，workspace-write 沙箱）已完成，三份
建议文档与最终答复均落盘（`summary.md` / `tooling-roadmap.md` /
`verification.md` / `response.md`）。咨询未修改任何源码/实验产物。

| 建议 | 处置 | 证据/理由 | 对应后续工作 |
| --- | --- | --- | --- |
| 事实确认：v3.1=3962 超越内部参考，但工具尚未主动合成机制 | accept | docs/20 与 results.json 支持；搜索域只有 4 个复合模板 | P0 轴解耦 |
| P0：先解耦 v3.1 复合轴（row_group/lane_owner/lowering/constant/narrow/store） | accept，分步实施 | 最低风险、最高信息增益；本批先落第一个独立轴 `pass1_k2_slice`（0/1 回放 4266/3962） | emit_dct32 轴化 + manifest 轴域 |
| P1：仅覆盖 DCT32 的 typed LayoutIR + 3 个原子 rewrite + layout_verify | accept，P0 之后 | 盲重发现的硬验收（禁用复合模板仍 <=3962）是唯一可信工具进化判据 | optimizer/ir/layout_ir.py、layout_verify.py |
| P2：分层搜索（语义→布局→lowering→测量），canonical key 基于逻辑 map | accept | 防止新轴退化为大笛卡尔积；沿用 <60s 穷举、超预算再 beam | kernel_manifest.layout_plans + 分层驱动 |
| P3：成本代理改“硬门 + Pareto 特征 + 实机校准” | accept | M23/M24 已否决单值静态排序；fused_uop 只作粗筛 | optimizer/analysis/layout_cost.py |
| P4：反例驱动的保守规则归纳 | accept | 首批回归：DCT16 全 s16 even-dot、DCT32 partial 直通、v3.1 正例、dct8 薄切片 | counterexamples.py + layout_legality.yaml |
| 硬约束：no-scatter 从排名惩罚改为硬禁用；SVE2p3 候选标 `unexecuted` | accept | 用户策略与 round-0011 一致 | search/rank 输出加 policy 标志 |
| E1：DCT32 v3.1 held-out 盲重发现（Go：<=3962、零 scatter、upstream-exact） | accept，作为 P0/P1 完成标准 | 工具进化的可证伪验收 | P0/P1 里程碑 Go/No-go |
| E2：SVE2p3 执行 canary → interp8 path-B | accept，分两段 | canary 先于一切集成；当前 QEMU 无 SVE2p3，path-B 只能 semantic-only | canary 程序 + ISA 语义解释器验证 |
| E3：NEON→NEON 窄化/调度 2×2 消融 | defer（环境允许时并行） | 需要 N1/920B 连续算力；先完成 P0/P1 再排 | 920B/N1 paired A/B |

执行 Agent 复核意见：P0 从 `pass1_k2_slice` 轴起步，是因为它在现有
v3 模板中已经是独立代码块，可以零语义风险切成 0/1 两个真实候选
（预期回放 4266/3962），而不是引入 `v3_like` 旗标。后续轴
（odd_lowering、lane_owner、narrow_batch、constant_layout）随模板
重构逐个拆出，每个轴单独跑搜索并记录消融。
