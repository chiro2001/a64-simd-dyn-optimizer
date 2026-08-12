# Round 0005 decision（需求与方案核实）

顶级模型回复见 `response.md`。总判定：v0.3 “修订后有条件通过”。逐项处置：

| 建议 | 处置 | 证据/理由 | 对应动作 |
| --- | --- | --- | --- |
| `cycles_est` 只能作搜索代理，不能称可靠 cycles 估算 | accept | 静态指令数不含 load/permute/归约端口差异、latency、spill、调用开销 | docs/09 v0.4：改名 `instruction_score`，另给资源下界模型 |
| `load > SIMD ⇒ 无优化价值` 不能作硬淘汰门 | accept | load 可重叠且可能 L1 hit；interp8 是典型 load-heavy 可优化 kernel | docs/09 v0.4：改为软信号 `load_pressure/compute_bound_prediction/optimization_route` |
| 跨 ISA 与同 ISA baseline 必须拆分 | accept | b 档对 NEON/SVE128、c 档对上游 SVE256 是两个独立指标 | docs/09 v0.4 + docs/04：b-neon/b-sve128/c 独立验收表 |
| 融合表为空时不得产生预测收益并驱动搜索 | accept | 空表下 `structurally_eligible=N, hw_supported=0, predicted=unknown`；否则搜索偏向虚构收益 | docs/09 v0.4：置信分层；先静态 inventory，目标融合对验证后才排序/进主循环 |
| 执行顺序：920B 原生闭环优先于融合分析器 | accept-as-procedure | 融合表空且 N+2 未定型；920B 一次闭环回答 SVE1/VL/PMU/噪声/估算偏差 | 修订 docs/09 §6 与 docs/05 路线 |
| vq=1 门禁必须是“dispatch 不注册候选、调用次数 0” | accept（后续实现） | 当前只有“禁止”注释，无运行时 dispatch；直接调用 mismatch 不能算通过 | P3：实现 feature/VL dispatch 后再验收 |
| 920B 用 `+sve` 严格重建、扫描禁止 SVE2 opcode、保存新 hash | accept | 归档产物用 `+sve2` 构建；函数名/manifest 仍标 SVE2 | 新增 `sve_vl256()` profile；920B 重建 + opcode 扫描 |
| `TargetFeatures` 增加真正的 `sve_vl256()` | accept（本轮实现） | 现只有 `sve_vla()`/`sve2_vl256()` | 本轮提交 |
| 计数器必须互斥分类（向量 load 会双计） | accept（P1 实现） | `ld1b` 已按 `z/p/v` 计入 SIMD | 融合分析器 v0.1 实现互斥分类 |
| 16x16 wrapper 23 条不含 raw helper 动态路径 | accept（P1 实现） | wrapper 只含两次 `bl` | 按调用图统计最终 linked symbol |
| openEuler 需要 dnf/rpm bootstrap 入口 | accept（P3 实现） | 现 bootstrap 是 apt/dpkg | 新增 openEuler 入口 |
| 920B 验收前 microbench 需支持 16x16 candidate | accept（P3 实现） | 现 harness 拒绝 16x16 candidate | 扩展 sa8d_microbench |
| 固定 VL=256 需 PR_SVE_SET_VL 检查与 worker 继承验证 | accept（P3 实现） | sysctl 默认值不是运行时合同 | 920B 接入时实现 |
| 10% gate 需中心估计与 CI 下界均 >1.10 | accept-as-procedure | 预注册保留门槛的统计条件 | 写入 docs/04 |
| workload 权重/baseline ID 冻结 | defer | 需要真实 x265 clip 调用统计 | 引入 clip 采样任务 |
