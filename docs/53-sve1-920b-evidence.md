# SVE1.0 on 920B：全量证据与定位调整（2026-08-16）

## 1. 结论先行

截至 2026-08-16，**920B 上所有已实测的 SVE1 候选都未超过上游 NEON**，
其中多数慢 1.5–1.9×。920B（Kunpeng 920）上 SVE1 的 2×256-bit 宽度
优势被三种结构代价抵消：uaddv 归约延迟 13cyc、ld1b load→use 延迟
24cyc、以及 SVE1 缺少 CADD90/宽乘/TBL2/TBX/2-way 点积。
（2026-08-16 ISA 核查修正：zip/uzp/trn、gather、LD2-4/ST2-4、
饱和算术、SDOT 16→64 都是 **SVE1 就有的**，详见 §6。）
因此 **SVE1 在 920B 不是可靠的 30% 算子收益来源**；920B 的优化路径
以 NEON 目标为主（M2 排序已验证 N1 表 transfer 到 920B），SVE1 保留
为 950（SVE2）方向的搜索轴。

## 2. 全量实测证据（paired，CNTVCT）

| kernel | SVE1 候选 vs 上游 NEON | 来源 |
| --- | --- | --- |
| satd8 8x8（gen pack-2） | **1.87× 慢** | reports/sve1-satd8-search-920b-20260816.txt |
| satd8 8x8（pack-2b 并行 uaddv） | **1.82× 慢** | 同上 |
| interp8 ipb8/16/32（sve1 替换） | 1.5–1.97× 慢 | reports/920b-intranet-20260814.txt |
| dct8（原生 SVE1） | 0.75×（慢 33%） | reports/920b-internal-quick-test-20260815.txt |
| dct32（sve1 替换） | 0.93–0.97×（慢 3–8%） | docs/49 |
| idct16（sve1 替换） | 0.85×（慢 17%） | reports/920b-intranet-20260814.txt |
| sa8d16 mixed（SVE1 宽装载+NEON H） | 0.92–0.95× | docs/49 |
| sad16（搜索候选） | ~1.8× 慢 | round-0023 context |

## 3. 为什么 SVE1 在 920B 赢不了（成本表 v1 解释）

benchmarks/sve-timing-920b/timing-sve1-ago.json：

| 现象 | 数值 |
| --- | ---: |
| add/sub 单指令吞吐 | 0.50 cyc/op（不慢） |
| uaddv 归约延迟 | 13.02 cyc |
| ld1b load→use 延迟 | 24.03 cyc |
| tbl（SVE1 最灵活的 permute，但非唯一：zip/uzp/trn 均在 SVE1） | 3.00 / 0.69 |
| SVE1 无 cadd/smullb/smlalb/umullb/tbl2/tbx（SVE2） | cadd90 需 tbl+符号+乘+加 4 条模拟；宽乘缺失使 dct 的 s32 中间精度需解包 |

候选实测 IPC：NEON satd8 ~3.5、SVE1 pack-2 ~1.9——SVE1 候选的指令
数没少（92 vs 90），但 permute/归约/load-use 依赖链让有效并行度减半。

## 4. 预测器校准结论

AGO 排序器跨 ISA 绝对预测不可用（NEON 过估 5.2×、SVE1 过估 1.45×，
方向错误）；SVE1 候选一律以 920B CNTVCT paired 为裁决。NEON 语料
内部排序（M2 门）仍然有效：N1 81 对 acc=0.975、920B acc=1.000。

## 5. 定位调整（docs/52 §4.3 更新）

- 920B：主攻 NEON 目标；SVE1 仅保留为“已实测非劣才注入”的特例；
- 950（SVE2）：SVE1/2 方向继续（dct8 +48%、ivpp16 +47%、c1c2 +81%
  均来自 SVE2/950 实测）；
- AGO 资源优先：NEON cover 搜索 + 真实视频热点的算子回归矩阵 +
  costCoeffNxN 等已注入内核的进一步优化。

## 6. ISA 对齐审计（2026-08-16，subagent + 本地双工具链交叉）

对“SVE1 缺少的指令”逐条核查（ARM catalog
`experiments/m7-isa-coverage/isa-catalog.json` + clang-22/GCC-16.1
编译/汇编矩阵 + LLVM AArch64Features.td），完整表见
reports/sve-instruction-version-audit-20260816.md：

| 此前错误主张 | 真实版本 |
| --- | --- |
| ZIP1/2、UZP1/2、TRN1/2 是 SVE2 | **SVE1（FEAT_SVE）**（.Q 128-bit 元素才需 F64MM） |
| Gather 装载是 SVE2 | **SVE1（FEAT_SVE）** |
| LD2/LD3/LD4、ST2/ST3/ST4 是 SVE2 | **SVE1（FEAT_SVE）** |
| 饱和算术是 SVE2 | SQADD/UQADD 无谓词形式是 **SVE1**（谓词合并形式才是 SVE2） |
| SDOT 16-bit 是 SVE2p1 | 分两种：**16→64（.D,.H,.H）是 SVE1**；16→32（.S,.H,.H）才是 SVE2p1；8→16（.H,.B,.B）是 SVE2p3 |
| TBL 单寄存器=TBX 单寄存器 | TBL 单寄存器 SVE1；**TBX（即使单寄存器）是 SVE2** |

确认无误的主张：CADD、SMULLB/T、SMLALB/T、UMULLB/T、TBL2、RSHRNB、
ADDP（SVE 无无谓词形式，谓词整向量形式是 SVE2）、HISTCNT/HISTSEG、
MATCH/NMATCH = SVE2；BEXT/BDEP/BGRP = **可选** FEAT_SVE_BitPerm；
PMULLB/T = SVE2（128-bit 形式另需 FEAT_SVE_PMULL128）。

**搜索目标对齐修正（已落地）**：

- `isa/aarch64/instructions.yaml`：`sve2-sdot-s64-s16` → `sve-sdot-s64-s16`
  （feature=sve）；`sve2-uzp1/2-s16` → `sve-uzp1/2-s16`（feature=sve）；
  `sve-addp-s64` 移到 sve2（SVE ADDP 是 SVE2）；删除 `sve-umaxp-u16`
  （SVE UMAXP 是 SVE2）；新增 trn1/2、sqadd/uqadd、gather、ld2/st2、
  cadd、宽乘族、tbx、eor3/bcax、pmullb/t、match/nmatch、histseg、
  bext/bdep/bgrp（sve2_bitperm）、sdot/udot 2-way（sve2p1/sve2p3）。
- `tools/check_isa_level.py`：新增 `udot`（镜像 sdot）、`tbx` 单寄存器、
  `fmlalb/fmlalt/fmlslb/fmlslt` 的 operand 规则，修复 3 个可复现假阴性
  （tbx/udot 2-way/fmlalb 曾可穿透 sve1 门禁）；回归测试
  `tools/test_check_isa_level.py` 10 条全绿。
- 现有 9 个 `best_sve1.o` 在加固后门禁下 9/9 仍 PASS（无 SVE2+ 泄漏）。

**对 SVE1 搜索方向的修正**：satd/dct 的转置/打包阶段在 920B 上可以用
zip/uzp/trn 直接做，不必只用 tbl 模拟；**SDOT .D,.H,.H（16→64 点积）
在 SVE1 可用**，interp8 path-A 的 sdot.d 切片不构成 SVE2 依赖。真正
限制 920B 的仍是 cadd90 模拟链、宽乘缺失与 uaddv/ld1b 长依赖链。

## 7. SVE2-128 同机隔离实测（2026-08-16，倚天710）

一台 **Neoverse-N2（SVE2，VL=128）** 上完成 SVE1→SVE2 指令集隔离实验
（协议 docs/58；报告 reports/isa-sve1-vs-sve2-128-20260816.txt）：

| 实现 | satd8 8x8 中位（CNTVCT） | 相对 NEON |
| --- | ---: | ---: |
| NEON 基线 | 2141 | 1.000 |
| SVE1 pack-2（CADD90 模拟） | 2286 | **1.068× 慢** |
| SVE2 pack-2（原生 svcadd x8） | 1720 | **0.803×（快 24.5%）** |

同机同宽下 SVE2 原生 CADD90 比 SVE1 模拟快 **1.33×**，直接验证了
“SVE1 缺 CADD90 是结构代价”的判断；SVE2 赢点不是单纯宽度红利。

**best9-950 在 VL=128 的 20k 正确性**（reports/vl128-best9-950-
correctness-20260816.txt）：dct8/interp8-16/32/interp8-vps/sa8d16/
熵族/sao-stats 全通过；**satd-8、interp8vpp-16/32 失败**，它们隐含
VL=256 假设。VL=128 机器部署须过滤这三项或改用纯 NEON/VL 自适应变体。
