# SVE 指令真实版本核查与搜索目标对齐修正（2026-08-16）

对应请求：用 subagent 核查“SVE1 缺少的指令”的真实 SVE 版本，并检查
这些版本与当前搜索目标（sve1/sve2/sve2p1/sve2p3/sve2_bitperm）的
对齐准确度。

## 1. 结论

之前的缺失清单有 **3 类大错、1 处遗漏、1 处需要拆分**：

- 错误：ZIP/UZP/TRN、gather、LD2-4/ST2-4 均被列为“SVE1 缺少”，
  实际全是 **FEAT_SVE（SVE1）**。
- 遗漏：TBX（即使单寄存器形式）是 **SVE2**，不是 SVE1。
- 拆分：SDOT 16-bit 分三种——**.D,.H,.H（16→64）是 SVE1**；
  **.S,.H,.H（16→32）是 SVE2p1**；**.H,.B,.B（8→16）是 SVE2p3**。
- 同时发现 `tools/check_isa_level.py` 有 3 个可复现**假阴性**：
  `tbx` 单寄存器（SVE2）、`udot z.s,z.h,z.h`（SVE2p1）、
  `udot z.h,z.b,z.b`（SVE2p3）均能穿透 sve1 门禁；`fmlalb` 同类。

## 2. 权威版本表（subagent 报告 + 本地双工具链交叉验证）

完整推导见 `sve-instruction-version-audit-20260816.md`。本地独立证据：

| 指令 | 真实版本 | 本地证据 |
| --- | --- | --- |
| ZIP1/2、UZP1/2、TRN1/2 | SVE1 | clang-22/GCC-16.1 在 `+sve` 下编译通过；catalog `zip1_z_zz`/`uzp1_z_zz` = FEAT_SVE |
| CADD | SVE2 | 两工具链 `+sve` 拒绝、`+sve2` 通过；catalog `cadd_z_zz` = FEAT_SVE2 |
| SMULLB/T、SMLALB/T、UMULLB/T、UMLALB/T | SVE2 | 两工具链 `+sve` 拒绝（ACLE 报 requires sve2）；catalog = FEAT_SVE2 |
| TBL2 | SVE2 | catalog `tbl_z_zz` 两寄存器编码 = FEAT_SVE2 |
| TBX（单寄存器） | SVE2 | 两工具链 `+sve` 拒绝；catalog `tbx_z_zz` = FEAT_SVE2 |
| Gather（LD1* 标量+向量） | SVE1 | `+sve` 汇编通过；catalog = FEAT_SVE |
| LD2-4 / ST2-4 | SVE1 | `+sve` 汇编通过；catalog = FEAT_SVE |
| SDOT/UDOT 4-way .S,.B,.B | SVE1 | `+sve` 通过 |
| SDOT/UDOT 4-way .D,.H,.H | **SVE1** | clang-22 与 GCC-16.1 在 `+sve` 下均生成 `sdot z0.d, z1.h, z2.h`；catalog `sdot_z_zzz`/`sdot_z_zzzi` = FEAT_SVE（含 indexed 16→64） |
| SDOT/UDOT 2-way .S,.H,.H | SVE2p1 | clang 报 “requires sme2 or sve2p1”；GNU as `+sve2p1` 才接受；catalog `sdot_z32_zzz` = sve2p1 |
| SDOT/UDOT 2-way .H,.B,.B | SVE2p3 | clang 报 “requires sme2p3 or sve2p3”；catalog `sdot_z32_zzz` 含 FEAT_SVE2p3 |
| BEXT/BDEP/BGRP | SVE2 可选 FEAT_SVE_BitPerm | 需显式 `+sve2-bitperm`；catalog = FEAT_SVE_BitPerm |
| EOR3/BCAX（SVE 形式） | SVE2 | `+sve2` 通过；catalog = FEAT_SVE2（NEON 形式才是 FEAT_SHA3） |
| PMULLB/T | SVE2（128-bit 形式另需 FEAT_SVE_PMULL128） | catalog = FEAT_SVE2 + FEAT_SVE_PMULL128 |
| HISTCNT/HISTSEG、MATCH/NMATCH | SVE2 | catalog = FEAT_SVE2 |
| SQADD/UQADD 无谓词 | SVE1 | `+sve` 通过；catalog `sqadd_z_zz` = FEAT_SVE（谓词合并形式才是 SVE2） |
| ADDP（SVE 向量） | SVE2（仅谓词整向量形式） | GNU as `+sve` 拒绝、`+sve2` 接受；catalog `addp_z_p_zz` = FEAT_SVE2 |
| UADDV、TBL 单寄存器 | SVE1 | `+sve` 通过 |

版本号归属：LLVM `AArch64Features.td`（main）——SVE2=Armv9.0、
SVE2p1=Armv9.4、**SVE2p2=Armv9.6-A、SVE2p3=Armv9.7-A**。
仓库此前写“SVE2p3=Armv9.5”有误（GCC/clang 的 `-march` 接受范围较
宽松，不能反推版本号）。

## 3. 对齐准确度审计结果

### 3.1 指令库 `isa/aarch64/instructions.yaml` 的错误（已修复）

| 条目 | 原 feature | 真实 | 修正 |
| --- | --- | --- | --- |
| sve2-sdot-s64-s16 | sve2 | **sve**（SDOT .D,.H,.H 是 SVE1） | 改名 sve-sdot-s64-s16，feature=sve |
| sve2-uzp1-s16 / sve2-uzp2-s16 | sve2 | **sve** | 改名 sve-uzp1/2-s16，feature=sve |
| sve-addp-s64 | sve | **sve2**（SVE 无 SVE1 ADDP） | 改名 sve2-addp-s64，feature=sve2 |
| sve-umaxp-u16 | sve | **sve2**（SVE UMAXP 是 SVE2） | 删除（sve2-umaxp-u16 已存在并修正 intrinsic 为 svmaxp_u16_x） |
| （缺）SDOT/UDOT 2-way H→S | — | sve2p1 | 新增 sve2p1-sdot-s16-s32 / sve2p1-udot-s16-s32 |
| （缺）UDOT 2-way B→H | — | sve2p3 | 新增 sve2p3-udot-b2h |
| （缺）ZIP/TRN/UZP s16、SQADD/UQADD、gather、LD2/ST2 | — | sve | 新增 |
| （缺）CADD、TBX、宽乘族、EOR3/BCAX、PMULL、MATCH/NMATCH、HISTSEG | — | sve2 | 新增 |
| （缺）BEXT/BDEP/BGRP | — | sve2_bitperm（独立可选项） | 新增 |

### 3.2 门禁 `tools/check_isa_level.py` 的假阴性（已修复 + 回归测试）

- 新增 `udot` operand 规则（镜像 sdot：.s,.h→sve2p1；.h,.b→sve2p3；
  4-way .s,.b / .d,.h 保持 sve1）。
- 新增 `tbx` z 寄存器规则（单寄存器 TBX=SVE2；NEON tbx 不被误伤）。
- 新增 `fmlalb/fmlalt/fmlslb/fmlslt` z 寄存器规则（SVE2）。
- 回归测试 `tools/test_check_isa_level.py`：10 条，覆盖假阴性复现、
  SVE1 合法形式放行、NEON 同助记符不误伤。
- 现有 9 个 `best_sve1.o` 在加固后门禁下 9/9 PASS。

### 3.3 搜索目标版本定义的准确度

- `features.py` 的 sve/sve2/sve2p1/sve2p2/sve2p3/sve2_bitperm 依赖链
  正确（sve2_bitperm 独立于 sve2，符合 catalog）。
- `test_select.py` 的泄漏检查原先漏了 `sve2_bitperm`，已补。
- **遗留**：950（SVE2）接入前需记录 ID_AA64ZFR0_EL1 以确认可选特性
  （BitPerm/SHA3/PMULL128/F64MM）；`--level sve2` 目前会放行这些
  可选指令。已写入 docs/52 §4.3 与 docs/53 §6。
- catalog 自身小瑕疵（不影响本项目）：`sdot_z32_zzz` 的 asm 为 B→H
  但 feature_level 标 sve2p1（靠 operand 规则兜底）；4-way SDOT 目录
  feature 只有 FEAT_SVE（clang/GCC/catalog 一致，本审计按此认定，
  不额外要求 FEAT_DotProd）。

## 4. 对搜索方向的修正（重要）

1. **SVE1 有 zip/uzp/trn/gather/结构访问**：satd/dct 的转置/打包
   阶段在 920B 上不必只用 tbl 模拟，pack-2 慢的真正原因是
   cadd90 模拟链 + uaddv/ld1b 长依赖链，与重排指令缺失无关。
2. **SDOT .D,.H,.H 是 SVE1**：interp8 path-A 的 sdot.d 切片在 920B
   合法；dct/interp 的 s16 点积可以进 64 位累加器，不需要 SVE2。
3. SVE1 真正缺的是 CADD90、宽乘（16→32）、TBL2/TBX、2-way 点积、
   可选 BitPerm——后续 SVE1 搜索应优先用 zip/uzp/trn 与 sdot.d。

## 5. 文件变更

- `isa/aarch64/instructions.yaml`：SVE 指令 feature 标签修正 + 补齐
  缺失指令族（sve/sve2/sve2_bitperm/sve2p1/sve2p3）。
- `tools/check_isa_level.py`：udot/tbx/fmlalb operand 规则 + 文档说明。
- `tools/test_check_isa_level.py`：新增 10 条回归测试。
- `optimizer/targets/aarch64/test_select.py`：泄漏检查补 sve2_bitperm；
  新增 sdot 16→64/16→32、umaxp、bext 的 feature 门控断言。
- `docs/53-sve1-920b-evidence.md`、`docs/52-ago-plan-20260816.md`：
  修正错误主张，补 950 可选特性机器级验证要求。
