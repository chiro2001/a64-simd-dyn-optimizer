# M0：SA8D 8x8 垂直切片（round-0023）

目标：不追求加速，先证明 AGO 流水线能端到端复现上游 SA8D 8x8 NEON：
契约 → 图 → cover/schedule/allocation → final object → 基线性能复现。

## 前置（round-0023 审计项）

- 修复 `scripts/run-pmu-sa8d-paired.sh`：默认 CNTVCT、PMU 路径解析
  `perf -x,` field 4（先用 N1 验证 perf 输出格式）；
- 重建 `benchmarks/sve-timing-920b/timing-920b.json`：CNTVCT 批量微基准
  实测（当前为假设的 1-cycle 校准 + 零字段）；
- 在 N1 与 920B 各测一遍基线噪声带（预注册 M0 性能门）。

## 垂直切片步骤

- 写 SA8D 8x8 语义契约（受限 DSL：输入 u8 4x4/8x8 块，输出 s32 satd
  语义；以 x265 C 参考为自语义权威）；
- 导入/手工建 SA8D 8x8 图（MachineIR：load/abs/sub/hadamard/reduce），
  存入 `optimizer/ago/graphs/sa8d8_graph.py`；
- cover：NEON 指令子集模板（vabd/vadd/vaddl/vpadd 等）覆盖图节点，
  上游指令序列必须可选中；
- schedule：固定 phase 顺序 + 可执行前后检查（节点→指令映射完整、
  无重复、形状匹配）；
- allocation：真实寄存器分配 + spill 代价（先复用/适配现有 peak_live
  思路，作为 M0 最小实现）；
- lowering：直接汇编路径与 intrinsic 路径各出一版；
- final object 校验：反汇编合法、ABI 正确、guard-page 越界检查；
- 复现验证：N1 PMU 与 920B CNTVCT paired，上游 vs AGO 产物在预注册
  噪声带内。

## 出 M0 条件

- 基线可选（上游 NEON 始终在候选集）；
- 合法 final object、ABI/guard-page 正确；
- 基线性能复现（无加速要求）；
- 全部门禁在结果前预注册。
