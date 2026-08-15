# SVE 指令真实版本核查与搜索目标对齐审计（2026-08-16）

作者：subagent `arm_isa_versions2`（独立核查，未修改仓库代码）

## 0. 一句话结论

之前“SVE1 缺少的指令”清单里有 **3 类大错**：`ZIP/UZP/TRN`、gather、`LD2/3/4/ST2/3/4` 其实都是 **base SVE（FEAT_SVE）就有** 的指令；另有 **1 处遗漏**：`TBX`（即使单寄存器形式）是 **SVE2**，不是 SVE1。同时发现 `tools/check_isa_level.py` 门禁存在 **2 个可复现的假阴性**（`tbx` 单寄存器、`udot` 2-way），会把 SVE2/SVE2p1/SVE2p3 指令放行到 sve1 目标。

## 1. 方法

- 本地经验验证：`aarch64-linux-gnu-as`（GCC 16.1.0 / binutils 2.46）分别用
  `-march=armv8.2-a+sve` / `+sve2` / `+sve2p1` / `+sve2p3` / `+sve2-bitperm` /
  `+sve2-sha3` 汇编每一条指令（正确操作数语法），记录接受/拒绝。
- ACLE 编译验证：`svzip1` intrinsic 在 `-march=armv8.2-a+sve` 下编译出 `zip1`。
- 仓库目录交叉验证：`experiments/m7-isa-coverage/isa-catalog.json`
  （来源 ISA_A64_xml_A_profile-2026-06）。
- 权威文档：ARM DDI0602（2026-03 rel）镜像页、LLVM/binutils 提交记录。

## 2. 指令真实版本表（每条给判定）

| 指令/主张 | 此前主张 | 真实版本 | 判定 | 证据 |
| --- | --- | --- | --- | --- |
| ZIP1/ZIP2/UZP1/UZP2/TRN1/TRN2（SVE 向量） | SVE1 缺少，SVE2 才有 | **SVE1（FEAT_SVE）**，仅 .Q（128-bit 元素）形式需 FEAT_F64MM | **错误** | as 在 `+sve` 下接受全部 6 条；svzip1 ACLE 在 `+sve` 下编译通过；catalog `zip1_z_zz` = FEAT_SVE；ARM DDI0602 ZIP1/ZIP2 编码类标注 `(FEAT_SVE \|\| FEAT_SME)`；gem5 提交“128-bit 元素编码由 Armv8.2 SVE 新增” |
| CADD #90/#270 | SVE2 | **SVE2** | 正确 | as `+sve2` 接受、`+sve` 拒绝；catalog `cadd_z_zz` = FEAT_SVE2 |
| SMULLB/T、SMLALB/T、UMULLB/T（宽乘） | SVE2 | **SVE2** | 正确 | as `+sve2` 接受（SMLALB 为 3 操作数 `zda.s, zn.h, zm.h`）；catalog 全部 FEAT_SVE2 |
| TBL2（两寄存器查表） | SVE2 | **SVE2** | 正确 | as `tbl z0.s,{z1.s,z2.s},z3.s` 仅 `+sve2` 接受；catalog `tbl_z_zz` 两寄存器编码 = FEAT_SVE2；ARM DDI0602 “Two register table (FEAT_SVE2 \|\| FEAT_SME)” |
| TBX（含单寄存器形式） | 与 TBL 一起列为 SVE1 | **SVE2（FEAT_SVE2）** | **错误（此前低估）** | as `tbx z0.s,z1.s,z2.s` 仅 `+sve2` 接受；catalog `tbx_z_zz` = FEAT_SVE2；ARM DDI0602 TBX 页标注 SVE2；LLVM 提交 “TBX is a new instruction with its own definition”（SVE2 新增） |
| Gather 装载（LD1B/H/W/D scalar+vector） | SVE1 缺少 | **SVE1（FEAT_SVE）** | **错误** | as `ld1b z0.s,p0/z,[x0,z1.s,uxtw]` 在 `+sve` 下接受；catalog `ld1b_z_p_bz`/`ld1w_z_p_bz` 等 = FEAT_SVE；ARM DDI0602 LD1B (scalar plus vector) 标注 FEAT_SVE |
| LD2/LD3/LD4、ST2/ST3/ST4（多结构） | SVE1 缺少 | **SVE1（FEAT_SVE）** | **错误** | as `ld2b/ld3b/ld4b/st2b` 在 `+sve` 下接受；catalog `ld2b_z_p_*` 等 = FEAT_SVE |
| SDOT 4-way（z.s=z.b×z.b；z.d=z.h×z.h） | SVE1 可用（依赖 dotprod） | **SVE1 + FEAT_DotProd** | 正确 | as `+sve` 下两种 4-way 均接受；catalog `sdot_z_zzz` = sve；注：目录 feature_exprs 漏了 FEAT_DotProd（见 §4） |
| SDOT 2-way H→S（z.s=z.h×z.h） | SVE2p1 | **SVE2p1（FEAT_SVE2p1）** | 正确 | as 仅 `+sve2p1` 接受；ARM DDI0602 SDOT (2-way) 16→32 编码 = `FEAT_SME2 \|\| FEAT_SVE2p1` |
| SDOT 2-way B→H（z.h=z.b×z.b） | SVE2p3 | **SVE2p3（FEAT_SVE2p3）** | 正确 | as 仅 `+sve2p3` 接受；catalog `sdot_z32_zzz`（asm 为 .H,.B,.B）feature 含 FEAT_SVE2p3 |
| UDOT 2-way（H→S 与 B→H） | （此前未单列） | **同 SDOT：H→S=SVE2p1，B→H=SVE2p3** | 新增 | as 验证 `udot z.s,z.h,z.h`=`+sve2p1`、`udot z.h,z.b,z.b`=`+sve2p3`；catalog 缺 H→S 条目（见 §4） |
| BEXT/BDEP/BGRP | SVE2（FEAT_SVE_BitPerm） | **SVE2 可选特性 FEAT_SVE_BitPerm** | 正确（注意是可选项） | as 需 `+sve2-bitperm`；catalog `bext_z_zz` 等 = FEAT_SVE_BitPerm；OpenJDK “BITPERM is an optional feature in SVE2” |
| EOR3/BCAX（SVE 形式） | SVE2 | **SVE2（FEAT_SVE2 基础内）** | 正确 | as `+sve2` 接受（正确语法 `z0.d,z0.d,z1.d,z2.d`）；catalog = FEAT_SVE2；NEON EOR3/BCAX 才是 FEAT_SHA3 |
| PMULLB/T | SVE2 | **SVE2 基础（16/64-bit 元素）；128-bit 元素需 FEAT_SVE_PMULL128** | 基本正确（补一个可选项） | as `pmullb z0.d,z1.s,z2.s` 仅 `+sve2` 接受；`pmullb z0.q,z1.d,z2.d` 需 `+sve2-pmull128`；catalog 含 FEAT_SVE_PMULL128 |
| HISTCNT/HISTSEG | SVE2 | **SVE2** | 正确 | as + catalog 均 FEAT_SVE2 |
| MATCH/NMATCH | SVE2 | **SVE2** | 正确 | as 语法 `match p0.b,p1/z,z0.b,z1.b` 仅 `+sve2`；catalog FEAT_SVE2 |
| ADDP（向量） | SVE1 不可用，需 uzp 替代 | **SVE2（谓词形式 `Zdn, Pg/M, Zdn, Zm`）** | 正确 | as 谓词形式仅 `+sve2`；catalog `addp_z_p_zz` = FEAT_SVE2；注意不存在无谓词/交织形式的 SVE ADDP（as 全版本拒绝） |
| UADDV | SVE1 | **SVE1** | 正确 | as `+sve` 接受；catalog FEAT_SVE |
| TBL 单寄存器 | SVE1 | **SVE1** | 正确 | as `+sve` 接受；catalog FEAT_SVE |
| RSHRNB/RSHRNT、SQRShRUNB | SVE2 | **SVE2** | 正确 | as + catalog 均 FEAT_SVE2 |

## 3. 对“当前搜索目标版本”贴合度的实测结论

### 3.1 现有 sve1 候选对象

对仓库全部 9 个 `*sve1*.o`（sa8d / interp8 / sa8d16 / dct32 / interp8-16 /
interp8vpp-16 / interp4 / satd-8 / satd-16）实际跑
`check_isa_level.py --level sve1`：**9/9 PASS，未发现 SVE2+ 指令泄漏**。

### 3.2 门禁假阴性（构造测试复现）

用真实 SVE2 对象逐条过 sve1 门禁（对象由 as `+sve2/+sve2p1/+sve2p3` 汇编）：

| 指令（真实版本） | sve1 门禁结果 | 判定 |
| --- | --- | --- |
| `tbx z0.s, z1.s, z2.s`（SVE2） | **PASS** | **假阴性** |
| `udot z0.s, z1.h, z2.h`（SVE2p1） | **PASS** | **假阴性** |
| `udot z0.h, z1.b, z2.b`（SVE2p3） | **PASS** | **假阴性** |
| `fmlalb z0.s, z1.h, z2.h`（SVE2） | **PASS** | 假阴性（同类，当前算子未用到） |
| `sdot z0.s, z1.h, z2.h`（SVE2p1） | FAIL | 正确拦截 |
| `sdot z0.h, z1.b, z2.b`（SVE2p3） | FAIL | 正确拦截 |
| `cadd / smullb / tbl2reg / addp / rshrnb` | FAIL | 正确拦截 |
| `sdot z.s,z.b`、`ld1b gather`、`uzp1` | PASS | 正确放行（SVE1） |

根因（`tools/check_isa_level.py` + `isa-catalog.json`）：
1. `levels[mnem]` 取目录内该助记符**所有编码的最小等级**。`tbx` 有 NEON
   （FEAT_AdvSIMD，等级 0）条目，把等级压到 0；`operand_level` 只对
   `tbl/tbx` 的**两寄存器**形式（`{z1,z2}`）提级，单寄存器 SVE2 TBX 漏网。
2. `operand_level` 只特判 `sdot`，没有特判 `udot`；目录里 SVE UDOT 只有
   4-way（等级 sve），2-way H→S（SVE2p1）/ B→H（SVE2p3）条目缺失，
   所以 2-way UDOT 以等级 0/1 放行。
3. 同类模式（NEON 同助记符 + SVE2 新编码）还会影响 `fmlalb` 等；
   当前算子集合未用，但门禁原则上是漏的。

### 3.3 目录本身的问题（不影响当前候选，但应修）

- `isa-catalog.json` 缺 SVE `SDOT/UDOT (2-way, 16→32)`（SVE2p1）条目；
  `sdot_z32_zzz` 的 asm 是 B→H 但 `feature_level` 标成 `sve2p1`（真实
  FEAT_SVE2p3），靠 `operand_level` 兜底才没出错。
- SVE 4-way `SDOT/UDOT` 条目 feature_exprs 只有 `FEAT_SVE`，漏
  `FEAT_DotProd`（对 920B 无实际影响，因为 920B 支持 dotprod，但目录不严谨）。
- 门禁不校验机器可选特性：`bext/bdep/bgrp`（FEAT_SVE_BitPerm）在
  `--level sve2` 下会放行，但 950 是否实现 FEAT_SVE_BitPerm 未在仓库留证
  （无 ID_AA64ZFR0_EL1 记录）；同理 SVE_SHA3、SVE_PMULL128、F64MM。

## 4. 对 docs/53 及此前表格的修正建议

1. `docs/53-sve1-920b-evidence.md` 第 3 节表格行
   “SVE1 无 zip/uzp/trn/cadd/smullb | 需 tbl+常数模拟，链长翻倍”：
   **改为“SVE1 有 zip/uzp/trn（FEAT_SVE）；无 cadd/smullb/smlalb/umullb/
   tbl2/tbx（FEAT_SVE2）**”，并把“链长翻倍”的原因限定在
   cadd90 模拟（tbl+符号+乘+加）与 tbl2 单寄存器拼接，而不是 zip/uzp/trn。
2. 此前“SVE1 缺少的指令”表格中三行必须改正：
   - ZIP/UZP/TRN：SVE1 已有（.Q 形式才需 F64MM）；
   - Gather：SVE1 已有（LD1B/H/W/D scalar+vector 是 FEAT_SVE）；
   - LD2/LD3/LD4、ST2/ST3/ST4：SVE1 已有。
3. “TBL/TBX（单寄存器表）：SVE1”改为“TBL 单寄存器：SVE1；TBX：SVE2”。
4. 说明 SVE1 真实缺少的宽乘类指令是 SMULLB/T、SMLALB/T、UMULLB/T、
   SMLSLB/T、UMULL 等 16→32 位宽乘（FEAT_SVE2），而不是“宽乘”笼统说法。
5. 记录门禁假阴性：`tbx`、`udot 2-way`、`fmlalb` 需在
   `operand_level` 或目录中补规则；建议给 `tbx` 加
   “z 寄存器操作数 → sve2”，给 `udot` 复制 `sdot` 的宽度特判。
6. docs/52 §4.3 的 sve1 目标定义（armv8.2-a+sve+dotprod）本身正确，
   与 920B 实测特性一致；建议同时把“可选 SVE2 特性需要机器级验证”
   写进 sve2 目标的门禁说明（950 首次接入前记录 ID_AA64ZFR0_EL1）。

## 5. 对搜索/优化方向的提示

- 920B 的 SVE1 其实有 zip/uzp/trn/gather/ld2-4/st2-4，之前“结构性缺
  重排/结构访问”的判断需要弱化；SVE1 上真正缺的是 CADD90、宽乘、
  TBL2/TBX、2-way 点积、BitPerm 这类。
- 这意味着 satd/dct 的**转置/打包阶段**在 SVE1 上并不一定非要 tbl 模拟：
  可以用 zip/uzp/trn 直接做。之前 pack-2 慢的根因分析（cadd90 模拟链 +
  uaddv 13cyc + ld1b load-use 24cyc）仍然成立，但“zip/uzp/trn 也缺失”
  这部分解释是错误的，后续 SVE1 搜索应优先使用 zip/uzp/trn 重排。
- 当前 9 个 sve1 候选无 SVE2+ 泄漏（门禁对现状成立），但门禁必须先修
  tbx/udot/fmlalb 假阴性，才能作为未来 SVE1 候选的可靠防线。
