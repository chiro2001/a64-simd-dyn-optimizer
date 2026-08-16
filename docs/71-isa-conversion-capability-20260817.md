# ISA 转换能力：kernel 输入 → 优化输出（2026-08-17）

## 目的

回答“我们的工具能不能把某指令集的 kernel 快速优化成另一指令集”，
以及“NEON kernel → SVE 优化”这条主路径的成熟度。本文只描述工具
能力与证据，不涉及具体未公开机器规格。

## 输入/输出能力矩阵

行 = 输入 kernel 的来源指令集；列 = 优化产物的目标指令集。

| 输入 kernel ISA | → NEON | → SVE1 | → SVE2 | → SVE2p3 |
| --- | --- | --- | --- | --- |
| C 参考 | ✅ 已实现+验证：satd/sa8d/熵族 IR（N1/920B） | ✅ 已实现+门禁：搜索 gen 后端（CADD90 替换、NEON-bridge），920B 实机未发布 | ✅ 已实现+验证：dct/sao IR（710/950） | ⚠️ 门禁通过（QEMU vq=2），无实机 |
| NEON | ✅ 已实现+验证：NEON→NEON（satd8/sa8d16/scan，N1/920B） | ⚠️ 部分：当前产物是 NEON+SVE 混合（sdot bridge）；纯 SVE 开关待做 | ✅ 已实现+验证：dct16/32 IR sve8（710 E2E +1.15%，与 best9 叠加 +2.32%） | ⚠️ 门禁通过；纯 SVE 待做 |
| SVE1 | ✅ NEON 兜底/对比路径 | ✅ 宽度/后端适配 | ⚠️ 未系统做（按需） | ⚠️ 未系统做 |
| SVE2 | ✅ NEON 兜底/对比路径 | ⚠️ 降级路径未系统做 | ⚠️ 宽度参数化：VL128→VL256 需 16-lane 发射器（待做） | ⚠️ QEMU 门禁有，无实机 |

图例：✅ = 已有门禁 + 至少一处实机证据；⚠️ = 有门禁或部分实现，
存在明确缺口。

## NEON → SVE 快速优化路径

目标：给定上游 NEON kernel，快速产出 SVE1/SVE2/SVE2p3 候选。

| 步骤 | 内容 | 状态 |
| --- | --- | --- |
| 1. 建 DAG | 从上游 NEON asm/C 提取宽度无关、lane 粒度 DAG（defuse 自描述） | ✅ 通用管线（dag_pipeline / lane_defuse） |
| 2. 选目标 | 指定 SVE1 / SVE2 / SVE2p3 | ✅ 目标矩阵已通（26 组合门禁） |
| 3. 发射 | 当前 = NEON+SVE 混合（sv* + NEON bridge）；纯 SVE 模式 = 开关禁 NEON | ⚠️ 混合版已实现；**纯 SVE 发射器 dct16/32 均已完成**（0 NEON SIMD、20k VL=128 差分 0 失配） |
| 4. 门禁 | 20k 差分 vq=1/2 + TestBenchLite；（纯 SVE 时）禁 NEON 指令检查 | ✅ 门禁体系已有；禁 NEON 检查已落地（check_isa_level --no-neon，2026-08-17） |
| 5. 实机 | 注入法交错 A/B（bit-exact + bootstrap CI） | ✅ 流程就绪（interleaved-inject-ab.sh） |

## 当前限制与缺口

1. **纯 SVE 发射模式**：禁 NEON 门禁已落地（`check_isa_level
   --no-neon` + `AGO_PURE_SVE=1` 注入门禁，允许编译器栈溢出的
   NEON 访存编码，禁所有 NEON 数据指令）；纯 SVE 原语集与
   **dct16/32 发射器均已完成**（0 NEON SIMD、20k VL=128 差分
   0 失配、与 neon8 数值一致）；TestBenchLite 与推广待做；
   当前限定 VL=128。
2. **16-lane 发射器**：dct fused8 发射器固定 8-lane（VL128）；VL256
   宽度需要 emit_acle(vl=32) 参数化（同图不同宽）。
3. **SVE2p3 实机验证**：目前只有 QEMU vq=2 门禁，无对应实机；按
   统一晋级门（bit-exact、100f CI 不跨零、双段同向）补齐前不发布。
4. SVE1/SVE2 之间、SVE2→SVE2p3 的降级/升宽路径未系统化（按需接入）。

## 证据与维护

- 相关数据：`data/kernel-test-db.csv`（72 行）、`data/contract-corpus.csv`
- 相关文档：docs/59（交接）、docs/65（IR 宽度无关）、docs/66（目标
  矩阵）、docs/70（backlog）、AGENTS.md（维护契约）
- 更新：能力状态变化时同步本文档与 docs/70；新实机证据入库后再改 ✅。
