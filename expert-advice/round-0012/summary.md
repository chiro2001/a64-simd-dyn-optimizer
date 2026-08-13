# 结论摘要

- 【事实】DCT32 v3.1 以 3962 fused_uop、零 scatter、200k 零分歧超越内部聚合参考 4251/4827；内部参考不是语义 oracle。
- 【事实】docs/18、docs/20 支持的可迁移机制是常量预排列、lane-per-output dot、批量窄化/连续存储、4/8 行分块及结构化置换。
- 【事实】当前 DCT32 搜索只在 `v1/v2/v2b/v3` 复合模板间选择，`v3` 发射器实际内含 v3.1；工具尚未主动合成这些机制。
- 【推断】最大差距是缺少能同时表达 lane map、位宽/值域、舍入屏障、constant map、地址图和目标 ISA 的 typed LayoutIR。
- 【建议·P0】先把 v3.1 拆为行组、k-family lowering、lane ownership、常量复制、窄化批次、存储拓扑和调度轴，并将 scatter 设为硬禁用。
- 【建议·P1】仅实现 DCT32 所需的 3 个证明化 rewrite：输出 lane 分配、常量 map 派生、批量 round-narrow-store；再做分层 Pareto 搜索。
- 【建议·反馈】用两个已知反例归纳硬规则：DCT16 全 s16 dot 的值域失败，以及 DCT32 跨 pass 延迟舍入的 3.87% 分歧。
- 【下一轮】依次做 DCT32 盲重发现、SVE2p3 `sdot.h` 执行 canary→interp8 path-B、NEON→NEON 同算力调度/窄化消融。
