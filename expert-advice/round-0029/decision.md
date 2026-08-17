# Round 0029 decision（2026-08-17，git df3ca35 + round-0029）

执行 Agent 对 round-0029 建议的逐项处置。专家基于其读取时刻状态
（950 sve16 负结论已入库）；处置时对照执行时最新事实（同）。

| 建议 | 处置 | 证据/理由 | 对应行动 |
| --- | --- | --- | --- |
| P1：通用 op-fusion/region-schedule 后端 | accept（主方向） | op-backend 是唯一"静态与实机都赢"的后端；dct 的 row-group/pack/系数复用已有 P4 butterfly-quarter 与 dual_sve16 基础，提取为契约模板的增量成本可控。 | 从 dct16/32 op-backend 候选反推 region 模板（quarter/odd-quarter、row-group、pack 复用），门禁复现 op895/opbase；再转 interp8-hpp。退出：两家族各 ≤32 候选仍无 ratio CI 下界 >1.05 或 Amdahl 均 <0.3pp 即冻结 |
| P2：每机实测代理 + 主动测量 | accept（分阶段） | ranker 目前只用 fused_uop/mca_total；静态特征可先扩展，950 结构标签依赖用户实机。 | 先扩展 static_counts：关键链 permute 深度/load-use/spill 特征并重评 ranker；950 依赖链/吞吐微基准待用户提供时补 |
| P3：一个非 dct 闭环（首选 interp8-hpp） | accept | interp8 是第二大 E2E 占比家族；i8mm 静态赢实机消失已证明 hpp 需要"四行批处理+perm 复用"。 | interp8-hpp region 模板 + 实机 A/B；验收两批 bit-exact、kernel CI 下界 >1、E2E ≥0.2pp 且 CI 不跨零；失败即归档 |
| 前移真实调度实机门（ratio CI 下界 ≥1.10 + Amdahl ≥0.3pp） | accept（阈值待校准） | 与"静态赢实机输"教训一致；但 ≥1.10 对小 kernel 可能过严（op895 对 NEON 为 -14%、sa8d16 实机 +4%），正控需先过门验证。 | docs/06 工作流加"实机 direct-call 门"；先以现有正控（op895/scan/entropy）校准阈值，再正式启用 |
| 显式测 lane 宽度与关键链 | accept（工具先行） | final-object def-use 分析可本地做；950 微基准待用户。 | 扩展 tools/static_counts.py 输出关键路径 permute 数；依赖链 harness 先跑 920B/710/N1 |
| 融合优先搜索（batch/pack 复用/shuffle 消除/归约树为轴） | accept | 与 P1 同源，sve16 教训证明纯扩 lane 低信息增益。 | 搜索轴扩展列入 optimizer/ir 计划；dct16 与 interp8-hpp 各 ≤32 候选对照 |
| 形式化证明只随 fusion rewrite 补局部等价；SVE2p3 扩面/全 VL 证明后置 | accept | 与 round-0028 决策一致；证明服务发布决策而非独立研究线。 | 新模板必须带等价/舍入/足迹义务（docs/74 grammar） |
