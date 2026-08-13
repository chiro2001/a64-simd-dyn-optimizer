# 项目状态与方向决策（2026-08-13，M0~M20 后）

本文是给用户的证据化状态报告 + 需要用户输入的决策点。

## 1. 已交付（全部有单测/实机证据）

工具链闭环（“自动识别 + 优化”主链）：

| 组件 | 位置 | 状态 |
| --- | --- | --- |
| LLVM IR → MachineIR 导入 | `optimizer/ir/machine_ir.py` | DCT8/SA8D/interp8 三族 opcode 全覆盖 |
| 值域分析（静态位宽溢出检测） | `optimizer/analysis/range.py` | 一步复现 DCT8 s16 回绕 bug |
| 范围驱动自动宽度修复 | `optimizer/ir/rewrites.py::widen_overflows` | 与手写 rewrite 逐节点一致 |
| 关键路径成本模型 | `optimizer/analysis/critical_path.py` | 依赖图已修复（MLA 链/别名/双目的/栈数组穿越）；P0 门禁失败 → 自动精排永久取消，只做静态粗筛 |
| 融合静态 inventory | `optimizer/analysis/fusion.py` | docs/09 v0.1 全验收项 |
| 搜索主循环 | `tools/search_driver.py` | rewrite 组合枚举 + C-exact 验证 |
| 差分/门禁/paired 微基准 | kernels/benchmarks/scripts | 三算子、双机、CNTVCT/PMU |

M22 更新：rewrite 目录现为 `{widen, shift64, wide_load, tree_to_mla}`，
可组合枚举 16 个候选；5 个 C-exact 候选 N1/920B paired latency 全部
0.86–1.00（无突破，与 M15/M16 一致）。

M25 更新：微基准测量缺陷（[-255,256] off-by-one、latency 序列未共享、
单 dst WAW、2D origin、empty UB）已全部修复并用修复后 harness 复测
M22：五候选两机仍全部 <1，结论不变。上游分歧率修订为 dct8 0.868%、
dct16 0.0045%。

M26 更新：原生 `-mcpu=native` 重编只把 N1 widen 从 0.878 提到 0.960、
920B 提到 0.986，仍全部 <1。编译调度敏感性约 2–9%，不改变“上游 NEON
接近局部下界”的结论。

M27/M28 更新：DCT8 SVE256 后端（单 tile）与双 tile pack（x2）均 C-exact
（qemu 20 万例 mismatches=0）；x2 每 tile 静态 299 条 vs 上游 NEON 341
（约 1.14x）。结论：DCT8 的 pairwise-add/narrow 结构对 SVE 宽度倍增
不友好，+130% 需要新分解或 DCT→quant 融合，不能靠机械宽度迁移。

M29/P0 更新（round-0007 门禁判定）：修复依赖图后重做一次性复验，两机
留一法/结构留出 Spearman 全部为负（N1 -0.80、920B -0.60），top-3 命中
0–1——**自动精排永久取消**。`search_driver` 只输出静态 Pareto 粗序并对
.text 去重，所有不同 .text 必须实机实测；详见
`experiments/m29-cost-model-p0/iteration.md`。

M29/P1 更新：两 pass 融合 DCT8（q 寄存器直通）C-exact，但 N1 0.815、
920B 0.906 双双负于上游；batching 审计确认 x265 无 dct8 连续多块调用
点。DCT8 tier-a 家族按止损线停止。

DCT→quant 融合分析（docs/12）：可行且可位级等价，静态约 -8% 指令 +
latency 正项，但不足以单独立项；作为 N+2 接入后的宽 kernel 融合项备选。

上游 bug 发现与修复：DCT8 pass2 `vsub_s16` 回绕（M14 修复，range 分析可
静态复现）；harness 两次假阳性（hpp stride、hvpp 行推进）已闭环并记录
教训。

## 2. 性能/指令数指标状态（诚实口径）

### 正确性合同新证据（M21，用户 2026-08-13 输入）

把 pinned `b81f650` 的上游 `dct4/8/16/32_neon` **原样**搬入本项目测试框架
（`kernels/dct8/upstream_contract.cpp` 复刻 x265 `MBDstHarness` 语义）：
- x265 内部 test 语义（128 次契约、200 个 seed 扫描、200k 压力）在
  qemu/N1/920B 三处全部通过，零分歧；
- 全范围 uniform 诊断下 dct8 与 C 参考分歧 0.868%、dct16 0.0045%
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
      按机器重拟合逐指令延迟已做（M23）：9 点全量拟合仅能粗排，**留一法
      为负**（920B -0.52 / N1 -0.83），线性关键路径回归否决；M24 又做了
      逐指令依赖链直接测量，替换种子表后路径排序仍为负（920B -0.08 /
      N1 -0.25）。结论：静态关键路径单项不足以排序，需 issue/port 项或
      退回“粗筛+实机复核”。

## 4. 建议的下一阶段（若无新输入）

- 把 M15/M16 的树↔mla、全宽加载编码为 IR rewrite，让 `search_driver`
  自动枚举 8+ 候选（当前 {widen, shift64} 目录太薄）；
- 用 920B 家族内模型对这些候选排序，取 top 实机复核；
- 每完成三个优化迭代按协议发起 round-0007 专家咨询（round-0006 后已
  完成 M14–M20 多个迭代，round-0007 已到期）。

## 5. M30 状态（2026-08-14）：DCT16 SVE2 指令数目标已超额达成

最新数值（fused_adj，VL=256，QEMU true-dynamic）：

| 合同 | 最优 | 相对内部参考 731 |
| --- | ---: | ---: |
| upstream-exact | 887 | +156 |
| legacy-internal-exact | **692** | **-39（已低于内部参考）** |

里程碑链条（本轮）：store_merge16 → pass1_even_factor →
pass1/pass2 pack_zip（tbl/mov 归零）→ pass2_even_sve（复刻内部 s32
偶数路径：saddlb/saddlt + mul/addp + 散布 st1d），legacy 791→692，
首次低于内部参考。验证：legacy 20 万例差分 0.0448%（与基线同签名）、
TestBench 6/6；upstream 200k 零分歧。

工具侧：manifest 现有 10 个布局轴；搜索驱动新增源码哈希规范化去重
（本轮 75 个重复组合跳过）；round-0009 顶级模型咨询完成（sss/gpt-5.6-
sol，见 expert-advice/round-0009），建议 typed LayoutIR、分层搜索、
连续/scatter 存储并列、960 PMU 实机口径。

剩余事项：
1. **实机验证阻塞（2026-08-14 确认：960 尚未流片）**：SVE2 实机
   验收挂起；流片前以 QEMU fused_adj 为验收代理，920B（SVE1）只对
   NEON 候选有效。scatter st1d 的实机代价、fused_adj→cycles 校准待
   960 硅片或可访问的其他 SVE2 平台；
2. 工具进化：typed LayoutIR（lane map/range proof/常量 map/存储地址
   图）与分层搜索（>60s 预算已触发，当前 ~7.5min）；
3. upstream 合同仍差 156（k=2/6/10/14 的 s32 位级一致约束下，sdot 化
   空间有限；可考虑 SVE s32 形式的 k2 路径）。
4. dct8：upstream-exact 已通过逐条移植上游 `partialButterfly8_sve`
   达成（2 万例 0 分歧，fused_adj=323，即上游基线等价实现）；后续
   可把 DCT16 的优化轴（zip 打包、even_factor、store_merge16）移植到
   dct8。
