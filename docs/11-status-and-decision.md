# 项目状态与方向决策（2026-08-13，M0~M20 后）

本文是给用户的证据化状态报告 + 需要用户输入的决策点。

## 1. 已交付（全部有单测/实机证据）

工具链闭环（“自动识别 + 优化”主链）：

| 组件 | 位置 | 状态 |
| --- | --- | --- |
| LLVM IR → MachineIR 导入 | `optimizer/ir/machine_ir.py` | DCT8/SA8D/interp8 三族 opcode 全覆盖 |
| 值域分析（静态位宽溢出检测） | `optimizer/analysis/range.py` | 一步复现 DCT8 s16 回绕 bug |
| 范围驱动自动宽度修复 | `optimizer/ir/rewrites.py::widen_overflows` | 与手写 rewrite 逐节点一致 |
| 关键路径成本模型 + 双机校准 | `optimizer/analysis/critical_path.py` | 家族内 920B R²=0.98 |
| 融合静态 inventory | `optimizer/analysis/fusion.py` | docs/09 v0.1 全验收项 |
| 搜索主循环 | `tools/search_driver.py` | rewrite 组合枚举 + C-exact 验证 |
| 差分/门禁/paired 微基准 | kernels/benchmarks/scripts | 三算子、双机、CNTVCT/PMU |

M22 更新：rewrite 目录现为 `{widen, shift64, wide_load, tree_to_mla}`，
可组合枚举 16 个候选；5 个 C-exact 候选 N1/920B paired latency 全部
0.86–1.00（无突破，与 M15/M16 一致）。

上游 bug 发现与修复：DCT8 pass2 `vsub_s16` 回绕（M14 修复，range 分析可
静态复现）；harness 两次假阳性（hpp stride、hvpp 行推进）已闭环并记录
教训。

## 2. 性能/指令数指标状态（诚实口径）

### 正确性合同新证据（M21，用户 2026-08-13 输入）

把 pinned `b81f650` 的上游 `dct4/8/16/32_neon` **原样**搬入本项目测试框架
（`kernels/dct8/upstream_contract.cpp` 复刻 x265 `MBDstHarness` 语义）：
- x265 内部 test 语义（128 次契约、200 个 seed 扫描、200k 压力）在
  qemu/N1/920B 三处全部通过，零分歧；
- 全范围 uniform 诊断下 dct8 与 C 参考分歧 0.91%、dct16 0.0035%
  （dct16 为新发现），即分歧只在内部 test 不采样的极端输入上；
- 结论：C-exact 门禁是 x265 内部 test 的严格超集，继续作为候选硬门禁，
  除非用户明确放宽。

### 指令数（已达成部分）

- SA8D 16x16 动态：NEON 481 → SVE256 257（-47%），但 920B 周期无收益；
- DCT8 静态：proto_b 229（vs 上游 341，-34%），同样不换算周期。

### 三档实机目标（未达成）

| 档位 | 目标 | 现状 | 证据 |
| --- | --- | --- | --- |
| a NEON→NEON（N1/920B） | +30% | DCT8 最佳 0.89–1.02×；interp8 hpp 1.01–1.04×、vpp 0.92–0.97、hvpp 0.67–0.68 | M14–M18 |
| b NEON/SVE128→SVE256（N+2） | +130% | 920B（SVE 2×256）为负；N+2 未接入 | M11 |
| c SVE256→SVE256（N+2） | +130% | 无 N+2 | - |

### 归因（有证据）

1. 已探索单内核的上游 NEON 接近其 bit-exact 合同下限：DCT8 蝶形乘法
   不可约，interp8 上游已用 dotprod/i8mm 与转置 sdot 双向结构；
2. 920B SVE 2×256 与 NEON 4×128 位宽容量相等（512b/cycle），指令减半
   不换算周期；SVE 的 2× 宽度红利只在 N+2（4×256）成立；
3. 成本模型的跨家族泛化未通过（m19），搜索排序目前只家族内可信。

## 3. 需要用户输入的决策点

1. **N+2（960）实机接入**：b/c 档（+130%）必须在 SVE2.3、4×256 上验收；
   可否提供 SSH 环境（哪怕短暂）？
2. **内部 30–60% 参考实现**：哪怕只有指令直方图/反汇编，都能校准搜索
   空间并告诉我们"结构差距在哪"——这是当前信息增益最高的输入；
3. **下一方向优先级**（按当前证据的建议排序）：
   a. 等 N+2 做 SVE256 宽度迁移（对齐 b/c 目标）；
   b. 内部参考数据校准后，把"结构差距"编码为搜索 rewrite；
   c. residual→subpel / DCT→quant 跨 primitive 融合（收益需再评估）；
   d. ~~继续 encode M15/M16 结构为 IR rewrite~~ **已完成（M22）**；下一步
      按机器重拟合逐指令延迟（9 个实测校准点）并验证排序一致性。

## 4. 建议的下一阶段（若无新输入）

- 把 M15/M16 的树↔mla、全宽加载编码为 IR rewrite，让 `search_driver`
  自动枚举 8+ 候选（当前 {widen, shift64} 目录太薄）；
- 用 920B 家族内模型对这些候选排序，取 top 实机复核；
- 每完成三个优化迭代按协议发起 round-0007 专家咨询（round-0006 后已
  完成 M14–M20 多个迭代，round-0007 已到期）。
