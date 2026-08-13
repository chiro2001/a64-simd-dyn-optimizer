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

## 5. IR 级差距量化（2026-08-13 深夜，内部 731 vs 当前最优 887/791）

同口径（QEMU VL=256、true-dynamic、单次调用 stride=32）三方对比：

| 指标 | 内部 | upstream-exact best | legacy best |
| --- | ---: | ---: | ---: |
| 配置 | — | quarter/p1k4/odd-quarter/p2k1/nm1/sm16/factor/zip2 | 同左 + legacy/p2k2 |
| total | 983 | 1155 | 1031 |
| 向量 raw | 843 | 997 | 916 |
| movprfx | 112 | 110 | 125 |
| **fused_adj** | **731** | **887** | **692** |
| **fused_uop（sg×4 惩罚）** | **827** | 887 | **704** |

指令类别直方图（向量 raw 计数，逐 mnemonic 合计）：

| 类别（mn 明细） | 内部 | upstream best(887) | legacy best(692) |
| --- | ---: | ---: | ---: |
| dot：sdot | 176 | 160 | 176 |
| 载入：ld1h/ld1d/ld1w/ldp/ldr/ldur | 122 | 121 | ~110 |
| 存储：st1d/stp/str/stur | 36 | 48 | 24（含 4 条散布 st1d） |
| 窄化：sqrshrnb / rshrnb+rshrn / +xtn | 64 | 80 | 64 |
| 置换/搬移：tbl+tbx / mov / rev 系 / zip+uzp1 | 0+0 / 1 / 32 / 148 | 0+16 / 0 / 44 / 152 | 0+16 / 0 / 56 / 148 |
| 算术：add / sub / mul / addp / saddl 系 / shl | 40/32/16/8/16/0 | 32/48/88/64/32/4 | 24/32/16/8/0/0 |
| movprfx | 112 | 110 | 131 |

**差距分解（legacy best 692 vs 内部 731，-39，已低于内部参考）**：

1. **置换/搬移链 ~-80**：内部常量预排列，运行期只保留 zip1/zip2+uzp1+rev
   （148+32），无 tbl/tbx/mov；legacy 仍有 tbl 62 + tbx 32 + mov 54
   （打包链 ~148）。方向：把打包索引折进常量表/加载布局，消除运行期 tbl；
2. **偶数路径 ~-40**：内部全部 s16 域 sdot + sqrshrnb（mul 16 + addp 8，
   无 xtn/rshrn）；legacy 对 k=0/4/8/12 仍保留 s32 NEON 段（mul 24 +
   addp 16 + saddl 32 + sqrshrn 16 + xtn 16）。方向：k=0/4/8/12 也 s16
   sdot 化（legacy 合同内），或常量对称性复用；
3. **存储 ~-2**：内部 st1d 32 条；legacy 经 store_merge16 已到 str 18 +
   stp 20 = 38（sm16 前 58）。剩余为 4-lane NEON 偶数路径存储；
4. **sdot 密度（已收敛）**：pass1_even_factor 轴把 pass1 的 8 个偶数 k
   改为 EE/EO 4 项点积（`revh z.d` 每 64-bit 反转 + 单条 CQ_LO 点积），
   sdot 从 208 降到 176（与内部持平）；upstream 192→160。pass1 输入是
   像素（E≤510），EE/EO 无溢出，位级等价（200k 差分 0 分歧）；
5. **movprfx +23**：内部 112，legacy 135。方向：sdot 累加形式
   （svdot 就地累加 vs movprfx+dot 两指令）的布局选择。

结论：`pass2_even_sve` 轴（2026-08-14）复刻内部 s32 偶数路径后，
**legacy fused_adj=692，首次低于内部参考 731（-39）**；按用户口径对
gather/scatter 做 uop 惩罚后（每条 +3），legacy **fused_uop=704** 仍
低于内部 **827**（内部有 32 条散布 st1d，我们仅 4 条）。mul/addp/sqrshrnb
计数与内部完全一致（16/8/64），NEON T8E 段（xtn/sqrshrn/saddl）整体
消失，偶数输出用 4 条散布 st1d 写出。验证：20 万例 legacy 差分
0.0448%（与基线一致），TestBench 6/6。注意：a) 散布 st1d 按用户裁定
以 uop 惩罚计（fused_uop），不再以表面指令数邀功；b) movprfx 131 vs
内部 112 仍多 19；c) 该轴仅对 legacy 合同有效（upstream 的 k=2/6/10/14
必须保留 s32 路径，位级一致要求）。

> 2026-08-13 晚 store_merge16 轴：利用 rshrnb 输出偶 lane 布局 + 单次
> uzp1，把每 k 的 2×(8-lane 窄化+存储) 合并为 1×16-lane 存储。
> upstream 1015→999（200k 差分 0 分歧）、legacy 928→908（分歧率保持
> 0.045078%，TestBench 6/6）。best_sve2.* 与 best.json 已按
> upstream+sm16（999）重新固化。

> 2026-08-13 深夜 pass1_even_factor 轴：pass1 偶数 k 用 E 因子化
> （对称行 EE / 反称行 EO，`revh z.d` 一步反转每 64-bit 的 4×h），
> 只消耗 CQ_LO 单常量 4 项点积；sdot 密度与内部持平（176/160 vs 176），
> upstream 999→971、legacy 908→878（分歧率 0.045078% 不变，TestBench
> 4/4）。best_sve2.* 与 best.json 已按 upstream+sm16+factor（971）重新
> 固化。剩余 147 条差距主要落在 tbl/tbx/mov 打包链（~80）与窄化/存储
> 收敛（~60）。

> 2026-08-14 凌晨 pass1/pass2 pack_zip 轴：pass1 用内部同款 zip1/zip2.d
> + revh 构建（8 zip + 2-3 revh 直接产出行切片 O/E/EE/EO）；pass2 的
> QO 打包（8 zip）与 legacy QEOW 打包（3 zip）同样 zip 化。**tbl 62→0、
> mov 54→0**。upstream 971→887、legacy 878→791（分歧率 0.045078%
> 不变，TestBench 4/4）。距离内部 731 仅剩 **60**。

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

## 7. 打包链分析：tbl/tbx/mov 的真实成本与 zip 方案可行性（2026-08-13 晚）

对 legacy best（fused 928）的 tbl/tbx/mov 逐指令定位：

- **tbl 62**：pass1 quarter 打包链（24，t01/t23/P0/P1 两段 tbl2）、
  pass2 QO 打包（16，pack_group）、pass2 QEOW 打包（12）等；
- **tbx 32**：NEON `vqtbx1` 实现的 rev16/rev32（行反转），改用 SVE
  `svrev_s16/svrev_s32` 可等量换成 rev（不省条数，但去掉 tbx 依赖）；
- **mov 54**：绝大部分是 `svtbl2` 要求两个表寄存器成对（zN/zN+1）
  编译器插入的搬移——**消除 tbl 才能连带消掉 mov**。

用新增的 `tools/search_permute.py`（zip1/zip2/uzp1/uzp2/trn1/trn2，
深度≤6、临时寄存器≤3）搜索 sdot 原生“行切片”四分之一打包
（`[r0[0..3], r1[0..3], r2[0..3], r3[0..3]]`）：**未找到短序列**。
列切片（zip/trn 天然可得，5 步）无法直接喂 sdot（D-lane 收缩方向
相反）。结论：行切片布局用 zip/uzp 替换 tbl2 不构成净收益；内部算子
的 zip/uzp 优势来自**结构换位**（对称矩阵可转置 + 2 行/操作数打包，
使 pass2 奇数路径每 k 用 4 条 sdot 而非 8 条），这是下一步设计轴，
不是发射器指令级替换。

剩余 197 差距的最新归因：pass2 奇数路径 2 行打包（-32 sdot）、mov/tbl
结构性消除（-50~-80，需配合换位）、存储合并（-20）、窄化收敛（-24）。

## 8. 内部 pass2 偶数路径结构解析（2026-08-14，剩余 60 差距的定位）

内部 dct16 反汇编（仅本机分析，不入库）显示 pass2 偶数路径与我们的
NEON T8E 路径结构不同：

- **构建**：`zip1/zip2.d` 两级 8 zip + `revh`×2 后，用
  `saddlb/saddlt`（s16→s32 宽化）×4、`.s` 级 `zip1/zip2`×4、
  `revw`×2、`add/sub.s`×4、`uzp1/uzp2`×3、`revw`+`add/sub.s`×2，
  一次性得到：O 行切片 s16（z24/z25）、EO s16 打包（z26，1 条 uzp1）、
  EE'/EO' s32（z21/z22）；
- **点积**：k=0/4/8/12 用 `mul.s`×4（EE'/EO' × 4 组常量）+ `addp`×2 +
  `sqrshrnb`×2 + `uzp1` + `st1d`，每 16 输出约 **12 条**；我们的 NEON
  T8E 路径（vaddl/rev32/EEE/EEO 构建 + vmul/vpadd/vqrshrn/vst1）每
  16 输出约 **100 条**；
- **顺带收益**：EO s16 打包（k=2/6/10/14 的 QEOW 等价物）只需 1 条
  `uzp1`，我们当前是 vmovn + vcombine + 3 zip ≈ 11 条。

实现方案（下一迭代轴 `pass2_even_sve`）：用内部同款 SVE 构建替换
rowpair 的 NEON E00/E01/EEE/EEO 与 T8E 段，预计 **-40~-50**，使
legacy 791 → ~745-755（逼近内部 731）。正确性以 200k 差分 + TestBench
为准；注意 EE'/EO' 在 s32 域无回绕风险（与已否决的 s16 全 sdot 不同）。

## 9. pass2_even_sve 实现前置探针结论（2026-08-14）

为复刻内部偶数路径所做的语义探针（QEMU 实测）与常量解出（仅本机）：

- `saddlb/saddlt`：把 16 个 s16 按偶/奇 lane 宽化相加为 8 个 s32；
- `addp z.s, p/m, z.s, zm.s`：目标寄存器必须等于第一源；语义为
  `out[2k]=a[2k]+a[2k+1]`、`out[2k+1]=b[2k]+b[2k+1]`；
- `zip1/zip2.s`：低/高半交错；`revw z.d`：每 64-bit 内 32-bit 对反转；
- 内部偶数路径的 s32 常量就是我们的 T8E 表（64 / 83,36 / 64,-64 /
  36,-83），按 8-lane 向量 ×2 复制；
- **关键发现**：内部偶数路径的 16 输出用**一条散布 `st1d`** 写出
  （load_offset 偏移表 [32,96,160,224] 等，把 4 个 D-lane 写到
  k=0/4/8/12 的对应行）。散布存储在指令数口径里算 1 条，但实机
  scatter 代价可能高于连续存储；复刻时需评估是否改用连续存储 +
  逐 k 布局，或保留 scatter 以对齐内部指令数。

结论：pass2_even_sve 是下一迭代主轴，但需先决定“对齐内部指令数
（scatter store）”还是“对齐实机性能（连续存储）”的口径。
