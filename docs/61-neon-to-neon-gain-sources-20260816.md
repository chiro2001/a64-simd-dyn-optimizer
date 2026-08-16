# NEON → 优化后 NEON：收益来源分析

> 2026-08-16 整理。主题：基线=上游 NEON（或 C 参考）、候选=纯 NEON
> 实现时，算子增益来自哪里。这是 920B/N1 发布 bundle 的主力，也是
> 与“指令集演进增益”（docs/60）互补的另一类收益。

## 1. 数据总表

| kernel | 增益 | 证据类型 | 来源 |
| --- | ---: | --- | --- |
| satd 族（8/16/32/64、8x16/16x8） | **+40%**（代表值）；16x16 等 ~1.5x | 回放 / paired | docs/56；reports/satd16-inline-gain-analysis-20260816.txt |
| interp8-vps（6 形状） | **+55%**（代表值）；16x16 ~1.5x（ratio 0.66） | 回放 / paired | docs/56；reports/interp8-vps16-inline-20260816.txt |
| cost-coeff-nxn | **+10.1%**（920B non-unroll）；**+9.8%**（710 unroll） | 微基准（生产语料） | 本会话 |
| sa8d16 | 回放 ~0%；微基准 **+12~15%**；710 32x32 包装 **+19%** | 回放 / paired | docs/56、docs/49、本会话 |
| scan-pos-last | 回放 **+27%**；微基准 单 CG +4% / 多 CG +10~14% | 回放 / paired | docs/56、docs/49 |
| psyCost | 0%（内联无收益，排除） | paired | reports/e2e-best6b-perf-20260816.txt |
| sad | 无候选 | — | docs/57 |

顺带（基线为 C 参考，候选 NEON，属于“NEON 化”）：

| kernel | 增益 | 证据 | 来源 |
| --- | ---: | --- | --- |
| cost-c1c2-flag | **+30%**（r29 全展开叶子，n 桶 1.10–1.49x） | 回放 | reports/c1c2-r29-best5-20260815.txt |
| cost-coeff-remain | **+20%**（回放）；微基准 ~1.02x | 回放 / paired | docs/56、docs/49 |

## 2. 收益来源分类

### 2.1 代码布局：GCC helper 外链修复（最大单一来源，~1.5x）

- 现象：上游 NEON 模板把 `filter8`/`hadamard` 等 helper 外链（每次
  调用 1–2 次 bl），候选将其内联进主函数。
- 证据：satd16 注入候选 1.5x；用 g++12 独立编译对照排除编译器版本
  因素，收益来自源码布局/编译上下文（
  reports/satd16-inline-gain-analysis-20260816.txt）。
- 影响算子：satd 16x16/8x16/16x8、interp8-vps 全形状（各 ~1.5x）。

### 2.2 reduce 变体搜索（加法归约指令选择）

- 同一算法可选的归约：vaddlv / vpaddl+vaddv / vaddv / vpadal，以及
  quad 顺序（seq/pair）。不同变体在真实分布下差异可达 ±10%+。
- 证据：sa8d16 vaddlv-pair 微基准 1.12x 延迟 / 1.15x 吞吐（docs/49），
  但真实分布回放约持平（调用混合吃掉增益）；本会话在 710 上裁定
  `vaddlv_seq`（2.87）优于 `vaddlv_pair`（3.04）、`vaddv`（3.38）。
- 影响算子：sa8d16、satd 族。

### 2.3 全展开 / 扫描顺序 / unroll（控制流与访存布局）

- cost-coeff-nxn：`emit_neon(unroll=True)` 在 710 上 1.11 vs 1.23
  ticks（+9.8%）；但 920B 上 unroll 反而慢（2.68 vs 2.28），最终按
  机器选择 non-unroll（+10.1%）——**机器相关**，需微基准裁决。
- c1c2 r29：把 n=1..8 叶子路径全展开，替代 run-cache，合计回放
  1.30x（n8 桶 1.49x）。
- scan-pos-last：NEON tail 变体（单 CG 1.04x、多 CG 1.10–1.14x）。

### 2.4 语义等价重排与形状包装

- 710 上 sa8d16 的 32x32/64x64 槽用 16x16 实现包装：32x32 微基准
  11.81 vs 14.62（**+19%**，因避免上游多次调用/额外开销）。
- 适配器回退：只在契约形状（endX==64 等）走候选，其余交还上游，
  保证正确性同时保留收益（SAO 族同款模式）。

### 2.5 排除项（实测负收益，作为反例）

- psyCost 内联：已验证无收益（排除）；
- 920B satd 小形状、710 sdoth hpp、satd8/16 NEON vs SVE2：均经
  E2E A/B 或微基准裁定为负，已排除/交还上游。

## 3. NEON→NEON 与 ISA 级增益的关系

- NEON→NEON 赢在“同一指令集内的代码质量”（布局/reduce/unroll/
  展开），单算子 +10~55%，安全、跨机可迁移，但集中在低占比算子，
  920B/N1 E2E 只有 ~2%。
- SVE2 结构指令（CADD90/HISTSEG/宽乘）单算子 +25~81%，但只适用
  SVE2 机器。两者互补：前者是发布 bundle 的基础盘，后者是 710/950
  的结构增量。
- 方法论含义：NEON→NEON 的收益无法用 ISA/MCA 预估，必须用
  “真实分布回放 + paired 微基准 + E2E A/B”三层裁决；且变体优劣
  机器相关（920B vs 710 的 cost-coeff unroll 相反）。

## 4. 证据来源

- docs/49（内部 quick test）、docs/56（目标审计）、docs/57（最终
  状态）、reports/satd16-inline-gain-analysis-20260816.txt、
  reports/interp8-vps16-inline-20260816.txt、
  reports/c1c2-r29-best5-20260815.txt、
  reports/entropy-replay-920b-20260815.txt、docs/59（本会话
  Yitian 微基准与 A/B 记录）。
