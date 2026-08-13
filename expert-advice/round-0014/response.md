已完成分析，并仅写入本轮要求的三个文件：

- [summary.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0014/summary.md)  
  主结论、瓶颈时间拆解、并行方案、SG 计数口径与验收指标。
- [tooling-roadmap.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0014/tooling-roadmap.md)  
  P0–P4 实施路线，涵盖进程池、隔离缓存、失败缓存、依赖剪枝、两级差分、MCA 漏斗、批量 verify 与流式 trace。
- [verification.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0014/verification.md)  
  串行/并行等价性、缓存失效矩阵、短门禁召回、剪枝完备性、trace 口径和 TestBench 验证方案。

核心建议是先实现“源码哈希任务去重 + 有界进程池 + coordinator 原子合并 + 分阶段持久化缓存”，再做 rewrite 依赖拓扑与规范化剪枝；MCA 和 2k→20k 漏斗先作为可校准的探索模式，不能未经召回率验证就硬剪枝。

本轮未修改源码、manifest 或实验产物；已完成 Markdown/diff 检查。