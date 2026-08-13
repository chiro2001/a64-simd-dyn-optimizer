# 内部 DCT16/DCT32 SVE256 算子评估纪要（2026-08-13）

> 信息安全说明：内部算子源码不进入本仓库（评估用临时文件已删除），
> 本纪要仅保留性能/指令数等量化信息与方向结论。

## 1. 评估结果（QEMU，VL=256，与本项目同口径 true-dynamic）

| 指标 | 上游 SVE | 本项目 best（v9） | 内部算子 |
| --- | ---: | ---: | ---: |
| dct16 动态 total | 2047 | 1698 | 983 |
| dct16 向量 raw | 1911 | 1365 | 843 |
| dct16 fused_adj（movprfx 融合后） | 1911 | 1269 | **731** |
| 相对上游（fused） | 1.00 | 0.664 | **0.383** |

- 内部 DCT16 实现约 **2.6x** 指令削减，超过"256 位相对 128 位有效
  上游减半"标准（0.5x）约 23%；
- DCT32：fused_adj 4251（2048 输出，2.08/输出；无同口径上游对照）。

正确性：dct16 对 C 参考分歧约 0.045%（与对上游 SVE 的分歧量级相同）；
dct32 对 C 约 0.104%。即内部实现既非 C-exact 也非上游位级一致，
属于独立行为合同（饱和窄化语义所致）。

## 2. 指令构成（仅计数信息，dct16 向量 843）

主要类别：sdot 176、movprfx 112、ld1h 104、uzp1 100、sqrshrnb 64、
zip1/zip2 40+40、add 40、sub 32、st1d 32、revh 20、mul 16、revw 12。

与项目 best（v9）对比的量化差距：窄化+存储链约 0.5 条/输出（项目
约 1 条/输出）；dot 数相近（内部 0.34/输出，项目 0.375/输出）。

## 3. 方向确认与提升潜力

内部实现确认了两个结构性方向：

1. **跨 4 行组的合并窄化**：把两组 4 行输出合并为 8-lane 窄化+存储，
   约 0.5 条/输出。此方向可用非饱和 `rshrnb` 实现，**保持本项目
   upstream-exact 合同**，预计 fused 1269 → ~1100-1200；
2. **常量预排列 + 4/8 行分组**：与项目已实现的 quarter+SDOT 方向
   一致，内部只是把行分组从 4 扩展到 8 并合并窄化。

提升潜力（upstream-exact 口径）：实现合并窄化 + 8 行分组后，预计
fused 约 1000-1100（相对上游 1911 约 0.52-0.58x）；若同时接受
饱和窄化的独立合同（新增 `legacy-internal-exact` 合同族），可逼近
内部算子的 731（约 0.38x）。

## 4. 工具落地项（按信息增益排序）

1. `narrow_merge` 轴：pass1/pass2 的 4 行组两两合并窄化+8-lane 存储
   （已开始实现，保持 rshrnb/upstream-exact）；
2. 偶数路径构建方案轴（zip 系 vs vaddl 系），作为 manifest 新轴；
3. 合同族扩展：`legacy-internal-exact` 与 `upstream-exact` 分离，
   搜索按合同过滤；
4. 行分组轴：4 行组 → 8 行组，配合窄化合并自然出现。

## 5. IR 级差距量化（2026-08-13 晚，内部 731 vs 当前最优 1015/928）

同口径（QEMU VL=256、true-dynamic、单次调用 stride=32）三方对比：

| 指标 | 内部 | upstream-exact best | legacy best |
| --- | ---: | ---: | ---: |
| 配置 | — | quarter/p1k4/odd-quarter/p2k1/nm1 | 同左 + legacy/p2k2 |
| total | 983 | 1283 | 1238 |
| 向量 raw | 843 | 1135 | 1063 |
| movprfx | 112 | 120 | 135 |
| **fused_adj** | **731** | **1015** | **928** |

指令类别直方图（向量 raw 计数，逐 mnemonic 合计）：

| 类别（mn 明细） | 内部 | upstream best | legacy best |
| --- | ---: | ---: | ---: |
| dot：sdot | 176 | 192 | 208 |
| 载入：ld1h/ld1d/ld1w/ldp/ldr/ldur | 122 | 121 | 116 |
| 存储：st1d/stp/str/stur | 36 | 64 | 58 |
| 窄化：sqrshrnb / rshrnb+rshrn / +xtn | 64 | 80 | 88 |
| 置换/搬移：tbl+tbx / mov / rev 系 / zip+uzp1 | 0+0 / 1 / 32 / 148 | 81 / 71 / 24 / 104 | 94 / 54 / 24 / 120 |
| 算术：add / sub / mul / addp / saddl 系 / shl | 40/32/16/8/16/0 | 32/48/88/64/32/4 | 32/48/24/16/32/4 |
| movprfx | 112 | 120 | 135 |

**差距分解（legacy best 928 vs 内部 731，-197）**：

1. **置换/搬移链 ~-80**：内部常量预排列，运行期只保留 zip1/zip2+uzp1+rev
   （148+32），无 tbl/tbx/mov；legacy 仍有 tbl 62 + tbx 32 + mov 54
   （打包链 ~148）。方向：把打包索引折进常量表/加载布局，消除运行期 tbl；
2. **偶数路径 ~-40**：内部全部 s16 域 sdot + sqrshrnb（mul 16 + addp 8，
   无 xtn/rshrn）；legacy 对 k=0/4/8/12 仍保留 s32 NEON 段（mul 24 +
   addp 16 + saddl 32 + sqrshrn 16 + xtn 16）。方向：k=0/4/8/12 也 s16
   sdot 化（legacy 合同内），或常量对称性复用；
3. **存储 ~-20**：内部 st1d 32 条；legacy str 34 + stp 24。方向：8-lane
   连续输出合并（st1h×2 或 st1d 视角）；
4. **sdot 密度 +32**：内部 176，legacy 208（奇数路径 176 + 偶数 s16 段
   32）。方向：偶数路径与奇数路径共享已打包的 QEOW/QO 布局，消除重复
   打包；
5. **movprfx +23**：内部 112，legacy 135。方向：sdot 累加形式
   （svdot 就地累加 vs movprfx+dot 两指令）的布局选择。

结论：剩余 ~197 中，约 **80 属常量预排列/打包方案**（纯工具轴）、约
**40 属偶数路径 s16 化收敛**（legacy 合同内）、约 **60 属窄化/存储合并
与 sdot 密度**。按工具优先原则，下一步实现"运行期 tbl 折叠进常量表"
（预计 -40~-60）与"偶数路径全 s16 sdot 化"（预计 -30~-40）。

> 2026-08-13 固化产物刷新：`kernels/dct16/candidates/best_sve2.cpp/.S/.o`
> 此前残留旧版（trace 出 fused 1269，与 best.json 的 1015 不符）；已用
> 当前发射器按 1015 配置重新生成并验证（200k 上游差分 0 分歧，trace
> fused 1015）。legacy best（928）为搜索最优，尚未固化到 candidates/。

## 6. 偶数路径全 s16 sdot 化——实测否决（2026-08-13 晚）

按 §5 差距分解尝试把 k=0/4/8/12 也走 s16 sdot（新增 `legacy_even_full`
搜索轴：EE16/QEEW 打包 + sdot + sqrshrnb，替换 NEON T8E s32 段）：

| 指标 | legacy best（k=2/6/10/14 走 s16） | +legacy_even_full |
| --- | ---: | ---: |
| fused_adj | 928 | 883（-45） |
| 与 legacy oracle 分歧率 | 0.045078% | 0.090234%（2 倍） |
| x265 TestBench transforms | 6/6 通过 | **首跑即失败（dct16x16 failed）** |

结论：**k=0/4/8/12 的对称行在 s16 域必然频繁回绕**（EE=E[j]+E[7-j] 常超
±32767），分歧率翻倍并被 TestBench 随机数据命中；内部算子 0.045% 的
分歧特征说明它同样只把反称行（k=2/6/10/14，EO=E[j]-E[7-j] 差值小）做成
s16 sdot，k=0/4/8/12 保留 s32 路径。该轴保留在搜索空间但被代理门禁
拒绝（见下），不作为可验收优化。

工具校准：搜索的 legacy 代理容差从 `mismatches<=5120`（0.1%）收紧为
`<=3072`（0.06%），依据：0.045% 通过 TestBench 6/6，0.090% 首跑失败。
这使搜索不会放行 TestBench 失败者，同时保留 0.045% 档。
