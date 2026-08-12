# 项目章程与成功标准

## 1. 问题定义

x265 的 AArch64 kernel 优化同时包含两个高度耦合的问题：

1. **计算选择**：哪些算术、变换、归约和饱和/舍入操作能实现目标函数。
2. **数据布局选择**：逻辑元素在寄存器 lane 中如何排列，何时转置、zip/unzip、table lookup、broadcast、widen/narrow，以及跨 128/256 位宽时如何分块。

人工优化往往从现有寄存器布局出发局部替换指令，容易被早期布局决策锁住。项目要把“逻辑元素关系”从“当前向量布局”中解耦，使优化器可以共同搜索布局、指令选择和调度，并用等价性验证与实机数据约束搜索。

## 2. v1 产品定义

v1 是一个面向小型、纯整数、边界明确的 x265 AArch64 kernel 的**离线超优化器**：

- 输入是 kernel 规格、现有实现、目标 ISA/微架构、ABI/内存契约和测试语料。
- 输出是一个或多个带完整 provenance 的 C/C++ intrinsics 或 AArch64 assembly 候选。
- 构建时把通过门禁的候选注入 x265；运行时继续沿用 x265 的 CPU feature dispatch。
- 优化器可以用实机 benchmark 反馈更新成本，但不在正常编码热路径中进行搜索或 JIT。

“动态”在 v1 中指搜索与目标反馈是动态的、候选可按 CPU/VL 多版本化，不代表在每次 x265 启动或每帧编码时在线生成机器码。只有在离线链路稳定后，才评估安装期 auto-tuning 或首次运行选择。

## 3. 目标

### G1：跑通一条可重复的 SA8D 纵向链路

对 8-bit `sa8d 8x8` 完成：

```text
规格提取 -> 元素级图 -> 现有 NEON 种子导入 -> 候选搜索 -> 代码生成
-> 独立正确性验证 -> x265 注入/dispatch -> TestBench -> 实机 microbench
-> 静态/动态指令分析 -> A/B 结论归档
```

随后复用同一机制覆盖 `16x16`、`32x32`、`64x64` 组合实现，而不是复制一次性脚本。

### G2：建立 NEON128 到 SVE/SVE2 VL=256 的迁移能力

迁移的含义是从同一个 SpecIR 重新选择 256-bit packing、谓词、load/store、归约和调度，而不是把 `q` 寄存器机械替换为 `z` 寄存器。输出必须声明：

- `neon128`、`sve-vla`、`sve-vl256`、`sve2-vla` 或 `sve2-vl256` 中的哪一种目标；
- 必需的 ISA feature 集；
- 是否依赖固定 VL=256，还是对所有合法 SVE VL 都正确；
- 小尺寸尾部和 inactive lane 的语义。

SVE 与 SVE2 不能混称。当前上游审计中，SA8D 的扩展实现位于 `pixel-prim-sve2.cpp`，并非普通 SVE 实现；优化器必须按实际指令特性标注目标。

### G3：在重点 kernel 上达到可审计的性能提升目标（三档口径）

重点范围为：

- SA8D：8/10/12-bit，主要 CU 尺寸；
- DCT/IDCT：优先从 dct8/dct16 中热点且可独立验证的 pass 开始；
- `interp8_hpp`：覆盖常见 width/height、系数索引和边界契约。

性能目标为三档（与 `docs/09-instruction-fusion-analysis.md` 一致）：

```text
a) NEON → NEON（同算力），ARM N1 实机：       speedup >= 1.30
b) NEON（或 SVE128）→ SVE256，鲲鹏 N+2 实机： speedup >= 2.30
c) SVE256 → SVE256，鲲鹏 N+2 实机：           speedup >= 2.30
```

正式定义为：

```text
speedup = baseline_median_time / candidate_median_time
通过条件：speedup >= 对应档位阈值（1.30 / 2.30 / 2.30）
```

其中 baseline 必须是同一 x265 commit、同一编译器与 flags、同一硬件、同一 ISA/VL、同一 bit depth/块尺寸/输入分布下，x265 dispatch 得到的最佳现有实现；跨 ISA 迁移（b 档）的 baseline 为迁移前的 NEON（或 SVE128）实现。报告同时给出 bootstrap 95% 置信区间，区间下界应大于 1.00；是否达到对应阈值以预先声明的聚合方式判断，不能事后只挑最快样本。

鲲鹏 N+2 未到位时，可用 SIMD 指令数估算（`cycles_est = n_est / pipe`，
`n_est = SIMD 指令数 + load 指令数`）作主口径；920B 实机 cycles 可作保留
验收（提升 >10%；NEON→SVE 4×256 时 >110%），最终目标验收仍在 N+2 实机。

项目方向目标允许分层验收：

- 单 kernel/shape 达到对应档位阈值；
- kernel family 的 workload-weighted geometric mean 达到对应档位阈值；
- x265 端到端编码速度记录为单独指标，不暗示会同步提升；
- 所有搜索候选全量记录；达到保留门槛（>10% / >110%）者额外展示；
  达到目标阈值者视为“工具已优秀”。

M0 时必须选定哪一层作为季度/版本承诺。默认推荐以“每个重点 family 的预注册 workload-weighted geometric mean”为主指标。

### G4：优化结果可解释、可复现、可回退

每个被接受的候选必须关联：规格图哈希、目标描述、规则/搜索版本、生成器版本、编译器版本、二进制符号哈希、正确性结果、性能原始数据、基线与 x265 commit。x265 集成默认关闭，能通过单一构建开关回退到上游实现。

## 4. 非目标

v1 明确不做以下事情：

- 任意 C++、任意循环或完整 x265 的自动向量化；
- 完整 AArch64 二进制 lifting 和全 ISA 形式化语义；
- 用 QEMU 指令时间预测真实 Neoverse/Ampere/Apple 核心性能；
- 只以“SIMD 指令条数最少”定义最优；
- 未声明固定 VL 却生成只在 SVE256 正确的代码；
- 在没有 bit-exact 证据时接受“视觉结果差不多”的编码结果；
- 第一阶段就在生产编码器内引入 JIT、在线搜索或自修改代码。

## 5. 统一术语

| 术语 | 本项目含义 |
| --- | --- |
| 规格（spec） | kernel 对合法输入和内存的精确可观察行为，通常来自标量 reference 与补充契约 |
| 逻辑元素 | 带来源、坐标、类型与范围的标量值，如 `pix1[row,col]` 或 `coeff[k]` |
| layout/packing | 逻辑元素到向量寄存器、lane、分片和谓词的映射 |
| 候选 | 一个已生成但尚未被正式接受的实现及其 manifest |
| baseline | 按预注册规则选择的当前最佳 x265 实现，不是任意较慢对照 |
| 静态指令数 | 目标 symbol 反汇编中的分类计数；对循环还需声明展开与迭代结构 |
| 动态指令数 | 固定调用数下由 PMU 观察并扣除 harness 的 retired instructions |
| kernel latency | 单线程、固定输入/shape 下每次调用的时间或周期/计数器 tick |
| VLA | vector-length agnostic；对所有受支持 SVE VL 正确 |
| VL=256 | 固定 256-bit 向量长度合同，必须在构建、dispatch 和测试中显式约束 |

## 6. 优先级和冲突裁决

候选比较采用以下词典序门禁：

1. ABI、内存安全和 bit-exact 正确；
2. 目标 feature/VL 合同正确；
3. 在预注册实机 workload 上无显著回退；
4. 优化主指标（延迟或吞吐）；
5. 动态 instructions、load/store、shuffle、分支、代码体积和可维护性。

如果“更少指令”和“更低实机延迟”冲突，以预注册性能主指标为准，并在报告中解释差异。若平均更快但关键 shape 回退超过门限，则生成多版本 dispatch 或拒绝候选，而不是隐藏回退。

## 7. 完成定义

项目的“首版完成”需要同时满足：

- SA8D 的提取、搜索、生成、验证、注入、dispatch 和 benchmark 全部由版本化命令复现；
- 至少 NEON128 和一个真实 SVE/SVE2 VL=256 目标通过；
- SA8D、DCT、`interp8_hpp` 均至少有一个自动生成候选进入 x265 并通过完整门禁；
- 重点 family 的对应档位性能指标已有预注册结果：达到则给出证据，未达到则给出负结果和瓶颈归因，不能用相对 C 的数字替代；
- 任一候选可从 manifest 重建，且禁用项目开关时恢复原始 x265 行为；
- 每轮实验和外部专家建议均独立归档，可追踪建议是否被采纳。
