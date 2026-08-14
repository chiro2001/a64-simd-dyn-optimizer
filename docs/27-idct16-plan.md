# IDCT16 SVE2 优化规划（2026-08-14）

## 1. 目标与口径

- x265 上游**没有 SVE IDCT**（只有 C 参考 + NEON），因此
  `x265::idct16_c` 是 bit-exact oracle（与 dct16 的“上游 SVE 为契约”
  不同）。
- 目标：SVE2（VL=256）IDCT16 通过 TestBenchLite（gate `idct16`），
  指令数相对 C 参考减半（fused 2830 → ≤1415 为硬门），再用
  MCA/结构成本/critical-path/consensus 选优；950/960 实机 paired。

## 2. C 参考基线（QEMU VL=256，2026-08-14）

| 指标 | 值 |
| --- | ---: |
| dynamic total | 2995 |
| vector | 2830 |
| fused_uop | **2830**（无 movprfx） |

注意：idct16_c 只 trace 包装函数会漏掉 static
`partialButterflyInverse16`；完整范围 =
`_ZN4x2658idct16_cEPKsPsl` 起 + `_ZL25partialButterflyInverse16PKsPsii`
 止（0x405234..0x406130，clang 自动向量化）。

## 3. 算法结构（partialButterflyInverse16 x2）

- 第一趟（shift 7）：按输入列的 16 个系数做逆蝶形+点乘
  （O[k]=Σ odd 行×g_t16、EO/EEE/EEO 分层），写 coef（转置布局）；
- 第二趟（shift 12 = 12-(X265_DEPTH-8)，depth=8）：同样处理 coef，
  写 dst（行 stride）；
- 常量表 g_t16（16×16，dct.cpp）与 dct32 共用；
- 每级 `(x + 2^(shift-1)) >> shift` + clip16。

## 4. 工具链脚手架（已完成）

- `kernels/idct16/manifest.yaml`（contract=upstream-exact，ref
  idct16_c，baseline_fused_uop=2830）；
- `kernels/idct16/idct16_verify.cpp`（20k 随机系数差分 vs idct16_c）；
- `kernels/idct16/trace_driver{,_upstream}.cpp`；
- TestBenchLite 新增 `--gate idct16`（weak 符号，无候选时拒绝）。

## 5. 下一步

1. 首个 SVE2 idct16 发射器（正确性锚点）：16-lane 行向量 + sdot
   布局（参考 dct32 leaf），先过 verify 再进搜索；
2. 布局轴：常量预排（g_t16 转置/复制）、EO/EEE 合并、两趟融合、
   row_group/acc_split；
3. 接入全代理搜索（--mca-top/--cost-top/--cp-top/--lite-top/
   consensus）与 pipeline.py；
4. 目标：fused ≤1415（减半门），950 实机 paired。

## 6. 首个 SVE2 发射器（2026-08-14，正确性锚点，已交付）

`tools/emit_idct16_sve2_shared.py`：16 列按两个 8 列半块（VL=256 的
s32 只有 8 lane）并行处理；O/EO/EEE/EE/E 全部向量化；舍入右移 +
qxtnb 饱和窄化；输出转置目前是标量写回（锚点，后续优化）。

| 指标 | C 参考 idct16_c | 锚点 SVE2 | 相对 |
| --- | ---: | ---: | ---: |
| dynamic | 2995 | 3699 | 1.24× |
| vector | 2830 | 1060 | 0.37× |
| fused_uop | **2830** | **980** | **0.35×**（已过减半门 1415） |
| MCA cycles | - | 925 | - |
| NP1 est | - | 2892（转置标量写回偏大） | - |
| cp (NV2) | - | 181 | - |
| 20k 差分 | - | **0 mismatches** | - |
| TestBenchLite idct16 | - | **5 seed 全 PASS** | - |

已固化 `kernels/idct16/candidates/anchor_sve2.{cpp,S}`；搜索发射器
已注册 idct16（`--kernel idct16`，当前单轴 phase:a），gen_verify 新增
`kind: idct`（src 连续、dst 带 stride），lite gate 接入搜索
（`--lite-top`）。

下一步（优化）：常量表用内存 load 替代 160 次 dup、标量转置改为
zip 树/连续 st1h、sdot 化 O/EO（当前 mla+mad 288 条）、两趟融合。

## 7. store 轴：scalar / scatter / zip16（2026-08-14）

把“输出转置写回”抽象为可搜索轴（`store`），发射器
`tools/emit_idct16_sve2_shared.py` 支持三种实现：

- `scalar`：锚点，`o[16][16]` 向量暂存 + 8×16 标量循环写回；
- `scatter`：保持两半计算，`svst1h_scatter_s32index_s32` 一次指令写回
  8 个列元素（`svindex_s32(0, stride)` 生成偏移，s32 通道低 16 位即
  结果，配合 smax/smin 饱和，等价 qxtnb）；
- `zip16`：两半合并为 16-lane 行向量（`svsplice_s16(p8h, nA, nB)`），
  再用 `optimizer/ir/permute_search.py` 自动发现并 QEMU 验证的
  zip 蝴蝶树（距离序 8,4,2,1，64 条 zip1/zip2）做 16×16 转置，
  最后 16 条连续 st1h 写 16 行。

### 7.1 全代理结果（搜索闭环，experiments/m30-idct16-search/store-axis）

### 7.1b rshrnb 舍入（2026-08-14，全部路径默认启用）

把 `add(1<<(SHIFT-1)) + asr + qxtnb`（3 条）换成 SVE2 `svqrshrnb_n_s32`
（饱和+舍入+右移+窄化，1 条，注意是 **SQRSHRNB** 而非 RSHRNB——后者
不饱和，81% 失配）。每行/半块省 2 条，共 -128 fused。scatter 路径改为
`qrshrnb + uzp1 + unpklo + scatter`（4 条，原来 add/asr/max/min/scatter
5 条）。

| 候选 | fused_uop | MCA | est NP1 | cp | lite 5 seed | consensus |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| scalar（锚点，addasr） | 980 | 925 | 2892 | 181 | PASS | 1.20 |
| scalar（rshrnb） | 852 | 895 | 2746 | 180 | PASS | - |
| **zip16（rshrnb）** | 1025 | **438** | **286** | 99 | PASS | **0.60** |
| scatter（rshrnb） | 1090 | 483 | 312 | **82** | PASS | 1.20 |

结论（rshrnb 版）：zip16 相对锚点 MCA/est/cp 降 53%/90%/45%，
scatter 的 cp 最短（82）。consensus 仍选 zip16；950/960 实机 paired
待测。候选固化
`kernels/idct16/candidates/{anchor,zip16,scatter}_sve2.{cpp,S}`。

### 7.1c SVE1/SVE2 sdot 约束（2026-08-14，探针结论）

尝试 sdot 化 O/EO 时确认：**s16×s16→s32 的 SDOT 不是 SVE1/SVE2
指令**。ARM ISA 2026-06 中该变体是独立条目 `sdot_z32_zzz`
（`SDOT Zda.S, Zn.H, Zm.H`，2-way vectors）与 `sdot_z32_zzzi`
（`SDOT Zda.S, Zn.H, Zm.H[imm]`，2-way indexed），arch variant =
`FEAT_SME2 || FEAT_SVE2p1`（v9Ap3/v9Ap4）；而
`SDOT Zda.H, Zn.B, Zm.B`（b→h）更晚，属 SVE2p3。SVE1/SVE2 只有
`svdot_lane_s64`（4-way indexed，.D 累加器，dct32 已用），没有
h→s 变体；`-march=armv8.2-a+sve` 与 `armv9-a+sve2` 汇编器均拒绝
`sdot z.s, z.h, z.h`。

**2026-08-14 实测（重要更新）**：binutils 2.47 在
`-march=armv9.4-a+sve2p1` 下接受上述两条指令，**QEMU 11.0.3
（`-cpu max,sve-max-vq=2`）可执行且语义正确**（探针
`experiments/m31-idct32-sdot/probe_sdot_z32.c`，VL=256）：
- vectors 形式：lane e = `d[2e]*c[2e] + d[2e+1]*c[2e+1]`，s32 wrap；
- indexed 形式：每 128-bit 段内 4 个 s32 lane 共享同一对常量
  `c[2*imm], c[2*imm+1]`（imm 2-bit，每段独立），且 **Zm 限 z0-z7**；
- GCC 16.1 ACLE 没有 s16 输入的 `svdot`（`svdot_s32` 只接受
  svint8_t），发射 sdot_z32 必须走 asm 路径；
- 920B（SVE1）与 950/920G（SVE2，ARMv8.2 基础）无 SVE2p1，该轴
  只能以 960（SVE2.3）为验收目标；QEMU 可用于 TestBenchLite
  正确性门禁。

**`svdot_lane_s64` 精确语义（VL=256，基向量探针 /tmp/sdotl_map）**：
lane e（seg=e>>1，sub=e&1）累加
`Σ_{k=0..3} d[seg*8 + sub*4 + k] * c[seg*8 + idx*4 + k]`：
同一 128-bit 段内两条 lane 共享同一组 4 个常量（lane0/1 用 c0..3，
lane2/3 用 c8..11，idx 选 c4..7 / c12..15）。

因此 IDCT16 的 O_k（每输出列独立常量）若用 sdot，必须把数据打包成
“4 行 × 同列”的 lane 组，且段内两 lane 只能共享常量（可放 A/B 两个
半块的同一列，或接受额外打包）。按 dct32 的 64-bit 段打包布局估算，
每 half O/EO 约 64 条 mul/mla → 6~8 条 sdot_lane + 12~18 条
zip/load 打包，净收益仅 -50~-150 fused/趟，且布局搜索空间大——暂缓
手写，留作搜索轴。

**其他阴性结论**：
- `svrshrnb_n_s32`（RSHRNB）是截断窄化，不饱和，直接替换
  add+asr+qxtnb 会 81% 失配；必须用 `svqrshrnb_n_s32`（SQRSHRNB）。
- `svmullb_lane_s32`（SMLALB）只消费偶 lane（result lane l =
  r[2l]*c[imm]），s16→s32 加宽 indexed 不能覆盖全部 8 列。
- `svmul_lane_s32`/`svmla_lane_s32` 的 lane 索引在 128-bit 段内有效
  （0..3），且把常量按段广播；本算子常量是 (row,k) 标量广播，
  无法用 lane 索引向量替代 dup。

### 7.2 IR 自动匹配能力（本次新增）

`optimizer/ir/permute_search.py` 是可复用的 lane 排列匹配器：编码
SVE VL=256 的 zip1/zip2/trn1/trn2/uzp1/uzp2 语义，枚举 xor 距离
蝴蝶网络自动搜索目标排列（例如 16×16 转置），输出指令序列并生成
QEMU 探针验证。`optimizer/ir/patterns.py` 补了 `<16 x i16>` 的
trn/zip mask 分类，MachineIR shuffle 可直接映射到 SVE 指令形式。
后续 sa8d16 H 合并轴、dct32 常量布局、idct32 数据重排均可复用该
匹配器，而不是手写序列。

### 7.3 下一步

1. sdot 化 O/EO（当前每 half 64 mul/mla 可降至 16 sdot），需要先建立
   16-lane s16 行数据布局（zip16 的 splice 已铺路；注意只能用
   `svdot_lane_s64`，非 indexed s16→s32 是 SVE2p1）；
2. 常量表内存 load 替代每项 dup；
3. 950 实机 paired（zip16 vs scatter vs anchor）。

## 8. IDCT32 规划（2026-08-14，scaffold）

### 8.1 C 参考基线（QEMU VL=256）

| 指标 | 值 |
| --- | ---: |
| dynamic total | 17638 |
| vector | 15228 |
| fused_uop | **15228**（无 movprfx） |
| 减半门 | 7614 |

范围 = `_ZN4x2658idct32_cEPKsPsl`（0x406130）起 +
`_ZL25partialButterflyInverse32PKsPsii`（0x4064e8..0x406b08）止。
结构：O[16]（16 奇行×16 输出）、EO[8]（8 行×8 输出）、
EEO[4]、EEEE[2]/EEEO[2]，dst[0..15]=E+O、dst[16..31]=E[15-k]-O[15-k]。

### 8.2 脚手架（已完成）

- `kernels/idct32/manifest.yaml`（contract=upstream-exact，ref idct32_c，
  baseline_fused_uop=15228，halve_gate=0.5）；
- `kernels/idct32/trace_driver{,_upstream}.cpp`（候选/C 参考单次调用）；
- gen_verify 的 `kind: idct` 已按 shape.n 参数化，n=32 直接可用；
- TestBenchLite 尚无 idct32 gate（后续加 weak 符号，或先以 20k 差分为
  门禁，同 IDCT16 锚点阶段）。

### 8.3 下一步

### 8.4 首个 SVE2 发射器（2026-08-14，已交付）

`tools/emit_idct32_sve2_shared.py`：32 列按 4×8 列 chunk
（off=0/8/16/24）并行处理；O[16]/EO[8]/EEO[4]/EEEE/EEEO 全向量化；
SQRSHRNB 舍入；写回支持 scalar（o[][] 标量转置）与 scatter
（`svst1h_scatter_s32index_s32`）。g_t32 表由发射器从
`third_party/x265/source/common/constants.cpp` 自动提取。

| 指标 | C 参考 idct32_c | scalar | scatter |
| --- | ---: | ---: | ---: |
| dynamic | 17638 | 17053 | 9095 |
| fused_uop（honest） | 15228 | **5932**（0.39×） | 7329（0.48×） |
| MCA cycles | - | 5141 | **3456** |
| est NP1 | - | 9866 | **1935** |
| cp | - | **136** | 4170 |
| 20k 差分 | - | 0 mismatches | 0 mismatches |
| TestBenchLite idct32 | - | **5/5 PASS** | **5/5 PASS** |

两者都过减半门 7614。consensus 选 scatter（MCA/est 优），scalar 的
cp 最短；TestBenchLite idct32 gate 已加（tools/testbench_lite.cpp，
weak 符号同 idct16），两个候选 5 seed 全 PASS。
候选固化 `kernels/idct32/candidates/{scalar,scatter}_sve2.{cpp,S}`，
搜索结果 `experiments/m30-idct32-search/store-axis/results.json`。

### 8.5 工具修复（2026-08-14）

gen_verify 的 idct 模板缓冲区写死 `${n} * 32 + ${n}`，对
idct32+stride 64 越界（最大索引 2015 > 1056），导致假失配 15.47%。
改为按 manifest 最大 stride 分配（`${n} * ${maxstride} + ${n}`）；
修复后 20k 全零失配（此前的“IDCT32 失配”是 harness bug，非 kernel）。

### 8.6 下一步

1. zip32 转置/合并半块写回（scatter 的 cp 4170 偏高，需实机/模型校准）；
2. 950 实机 paired（scalar vs scatter）；sdot 化按 §7.1c 约束评估。

### 8.7 IDCT32 sdot 化配方（2026-08-14，探针已验证）

scatter 版指令构成：mla/mad/mul **2720**、spill/mov/addvl ~3000、
写回 1028。sdot 化 O/EO 是最大杠杆（2720 → 预计 ~700）。

利用 `svdot_lane_s64` 的“段内两 lane 共享常量”语义，把同列的两个
chunk（cols 0..7 与 8..15，同一条 16-lane s16 行向量的低/高半）放进
lane0/1，列 k+2 的同样两个 chunk 放进 lane2/3。每个 4 行组 × 列对
`(k, k+2)` 的打包（探针
`experiments/m31-idct32-sdot/tbl2_sdot_pack.cpp`，QEMU bad=0）：

```
T1 = svtbl2_s16({r_a, r_b}, idx); T2 = svtbl2_s16({r_c, r_d}, idx);
D  = svzip1_s16(T1, T2);
acc = svdot_lane_s64(acc, D, C, 0);   // idx=0：段0 用 col k 常量、段1 用 col k+2
idx lanes 0..7 = [k, 16+k, 8+k, 24+k, k+2, 16+k+2, 8+k+2, 24+k+2]
C lanes 0..3 = [g_a[k], g_c[k], g_b[k], g_d[k]]（zip1 行序 a,c,b,d）
```

每 stage：O 16 奇行=4 行组 × 8 列对 × (2 tbl2+1 zip+1 sdot)=128；
EO 2 行组 × 4 列对 × 4=32；EEO 1 行组 × 2 列对 × 4=8；EEEE/EEEO
保持 mul/mla。行按 16-lane s16 加载（32 行 × 2 半 = 64 ld1h/趟，替代
128 ld1sh）。s64 累加器低 32 位经 `svuzp1_s32` 提取，保持 s32 wrap
语义。预计 fused scalar 5932 → ~3700、scatter 7329 → ~5100（约 -22%）。

> **2026-08-14 核算勘误（§8.7 的 128/32/8 是“单个输出行 k”的打包
> 量，不是整 stage）**：O 有 16 个输出行，每行需 4 行组 × 8 列对 =
> 32 sdot + 64 tbl2 + 32 zip = 128 条 → 整 stage 16×128 = 2048 条
> （512 sdot + 1024 tbl2 + 512 zip）；EO 8×32=256、EEO 4×8=32。
> 仅 O/EO/EEO 每 stage 2336 条、两 stage 4672，已超过 sdot-s32 直算
> （O/EO/EEO sdot 1376 + zip 128，真实 fused 5462/6079）。**s64 打包
> 因 tbl2+zip 开销（每 sdot 2 tbl2 + 1 zip）不优于 sdot-s32**，从
> 8.11 候选轴中降级为“仅当 950 实机需要 SVE2-only 版本时再评估”。

编译标志阴性：IDCT32 scatter 用 -O3 反而更差（fused 6561→7902，
spill 增多）；-fno-tree-pre/-fweb/-frename-registers 无改善。

**lane 常量向量阴性（2026-08-14）**：把每项 `svdup_n_s32` 换成
quad-dup 内存常量向量 + `svmla_lane_s32`（每行 4 组 [g4h..g4h+3 ×2]，
`svmla_lane_s32(acc, r, CT[m][h], k%4)` 的段内广播正好还原标量常量
语义，20k 正确）。但 GCC 不会跨 chunk CSE 常量加载：每 chunk 128 条
ld1_s32（128×4×2=1024/趟），且 128 个常量向量同时存活导致 spill 爆炸：
scalar fused 5932→10603、scatter 6561→7422，est 1935→6518。结论：
常量必须“按需立即数”或由 sdot 打包复用，不能预载成寄存器向量。

### 8.8 950 实机 paired（2026-08-14，保留）

在 950（内部保密机型，SVE2 2×256 / NEON 4×128）实测近期 idct32 候选：
scalar（fused 5932）与 scatter（fused 7329，QEMU 口径均过减半门）
**相对 x265 NEON/C 参考约慢 1.08×**。结论与 dct32 一致：QEMU 指令数
代理（fused_uop 减半）在 950 上未转化为周期优势；SVE2 2×256 无法靠
指令数减半赢过 NEON。

**验收口径修订（用户裁定，2026-08-14）**：
1. 950 的 idct32 周期不再作为验收门槛；950 数据仅保留作成本模型校准。
2. IDCT32 允许使用 SVE2p1/SVE2p3 指令（如 `sdot z.s, z.h, z.h`、
   `sdot z.h, z.b, z.b`），正确性以 QEMU（VL=256，SVE2p1 可执行）+
   TestBenchLite 为门禁；SVE2p3 指令仍只能 semantic-only（QEMU 11.0.3
   未实现 SVE2p3）。
3. 2p1/2p3 指令的使用本身就是“960 必须支持 SVE2p3”的证据链：在
   950（仅 SVE2）上打不过 NEON，而 960 若开放 SVE2p3 才可能由
   sdot 化/2-way dot 等获得实机优势。

### 8.9 下一步（更新）

### 8.10 sdot-s32 轴实现（2026-08-14，SVE2p1 直算）

`tools/emit_idct32_sve2_shared.py --compute sdot-s32`（布局与 mul 版
完全一致，蝴蝶/写回复用）：每 2 行 zip1 一次并复用 8 个 k，sdot
`z.s,z.h,z.h` 按 8 列逐 lane 累加 2 行；常量从 CDOT_* 表 ld1h 加载
（替代原 1182 条常量 dup/mov）。行按 16-lane s16 加载（每 chunk
32 ld1h）。GCC 16.1 无 s16 版 ACLE，用内联 asm 发射；编译
`-march=armv9.4-a+sve2p1`，QEMU 11.0.3 可执行。

| 指标 | 原 scalar | 原 scatter | sdot scalar | sdot scatter |
| --- | ---: | ---: | ---: | ---: |
| fused_adj（objdump 口径） | 5932 | 6561 | **4704** | **5110** |
| fused_uop | 5932 | 7329 | 4704 | **5878** |
| est（920B/NP1 吞吐模型） | 9866 | 1935 | 2738 | 3325 |
| cp（NV2 延迟模型） | 136 | 4170 | 71（见注） | 128 |
| 20k 差分 | 0 | 0 | 0 mismatches | 0 mismatches |
| TestBenchLite idct32 | 5/5 | 5/5 | **5/5 PASS** | **5/5 PASS** |

**统计口径勘误（2026-08-14）**：QEMU 11.0.3 的 in_asm 反汇编器不识别
SVE2p1 `sdot z.s,z.h,z.h`，把 1376 条 sdot 打成 `.byte`，parse_qemu_trace
的 vector 统计因此漏掉全部 sdot（此前 4770/4224 为错误值）。真实动态
指令数改用 `aarch64-linux-gnu-objdump` 静态流（kernel 无循环，静态=动态）：
scalar 6146 / scatter 5600。**llvm-mca 亦因 neoverse-v2 模型缺
sdot_z32 调度条目而无法评估**（`-skip-unsupported-instructions=lack-sched`
会跳过 sdot 使结果失真）——这是自定义 mca target 的待补项。est/cp
自定义模型可分类 sdot→dot，数据有效。

**编译 flag 实测**：sdot 版必须用 `-O3`（scalar 6146→5462、scatter
5600→5311，spill 减少）；`-O2` 下 GCC 的部分 CSE 被寄存器压力抵消。

**spill 消除（volatile C 加载，2026-08-14）**：把 CDOT 加载改成
volatile asm `ld1h`，阻断 GCC 跨 chunk CSE（此前 8 个 C 向量跨 chunk
存活 → ~1650 条 spill ld/str）：scalar fused 5462→**4704**、scatter
6079→**5878**（spill ldr_z 1854→280/355、str_z 748→280/71）。
结论：sdot-s32 相对 mul 版 scalar -21%（5932→4704）、scatter -20%
（fused_uop 7329→5878），相对 NEON 上游 fused 10214 **-54%/-42%**。
这是首个 SVE2p1 指令的 IDCT32 候选，作为“960 需要 SVE2p3 系指令”
证据链的组成部分。

> cp 注：sdot scalar cp=71 可疑偏低（依赖图未解析 sdot 的 .s/.h
> 寄存器 def-use，把 sdot 累加链当作独立节点）；cp 数据仅作参考，
> 需修复 critical_path 对 sdot 的解析。

候选固化 `kernels/idct32/candidates/sdot_{scalar,scatter}_sve2p1.{cpp,S,o}`。

### 8.12 NEON 基线 vs 当前优化（2026-08-14，对比口径）

NEON 上游 `x265::idct32_neon`（partialButterflyInverse32_neon ×2）在
QEMU VL=256 下动态 10920 / vector 10214 / fused_uop 10214（无
scatter）。当前 sdot-s32（volatile）候选与 NEON 对比：

| 指标 | NEON 上游 | sdot scalar | sdot scatter |
| --- | ---: | ---: | ---: |
| fused_uop（objdump 口径） | 10214 | **4704（-54%）** | **5878（-42%）** |
| llvm-mca cycles（静态流²，全函数 objdump） | 3319 | 3404 | 3065（失真 +61%） |
| llvm-mca cycles（动态流²，QEMU 修复 trace） | 3319 | 3518 | **1900（-43%）** |
| est 资源下界（scalar 主导，仅粗排） | 5903 | 2738 | 3325 |
| vector_lb（宽度感知吞吐下界³，920B） | 2553.5 | — | 2510（1.02×，同宽） |
| vector_lb（宽度感知吞吐下界³，NP1） | 2553.5 | — | **1255（2.03×，SVE 2× 宽）** |
| cp（NV2 延迟模型） | 539 | 71（不可靠） | 128 |

² 已给 llvm 22.1.8 Neoverse-V2 模型补 sdot_z32（HtoS）与 sdot.h
（BtoH）调度条目（4c V02，同 HtoD 口径），补丁+构建脚本见
`patches/llvm-22.1.8-aarch64-sdot-z32-sched.patch` 与
`scripts/build-custom-llvm-mca.sh`（docs/26 §5）。动态流经
`tools/fix_dynamic_trace.py` 修复 QEMU 的 .byte 反汇编；静态流仅作
粗筛（scalar 差 ~3%，scatter 高估 +61%，见 docs/26 §5 实测对比）。
³ `tools/estimate_cycles.py --profile 920B|NP1 --fix-driver ...` 新增
宽度感知向量吞吐下界（sve/neon 向量指令数 ÷ 各自 pipe 数），
口径说明见 docs/26 §5。

结论：动态流 MCA（当前 NP1 最强代理）下 sdot-s32 scatter 已相对
NEON -43%（1900 vs 3319），scalar 仍 +6%（3518）——写回方式决定
周期差异；est/cp 结构模型只作粗排。**双目标验收口径（用户
2026-08-14）**：NP1(960) 的 SVE256 算力是 NEON 的 2 倍，vector_lb
理论减半（2553.5→1255），NP1 评估应追求 **≥50% cycle 缩减**，当前
NV2 代理 1.75×（3319→1900）方向一致但偏保守；920B 的 SVE 2×256 与
NEON 4×128 同宽（vector_lb 1.02×），只作保守对照。960 实机
（SVE2.3）paired 仍是最终验收，但 MCA 已成为等不到实机期间的主要
预测工具。

**四候选双代理对照（2026-08-14，搜索工具新增 vector_lb 排序）**：

| 候选 | fused_uop | NV2 MCA | vector_lb NP1 | NP1 减半门（≥50%） |
| --- | ---: | ---: | ---: | ---: |
| NEON 上游 | 10214 | 3319 | 2553.5 | 基线 |
| sdot-s32 scalar | 4704 | 3518（+6%） | **1106（-56.7%）** | 宽度口径过；NV2 代理不过 |
| sdot-s32 scatter（best） | 5878 | **1900（-43%）** | 1255（-50.9%） | 宽度口径过；NV2 代理差 7pp |
| mul scalar | 5932 | 5141 | 1491（-41.6%） | 不过 |
| mul scatter | 7329 | 3456 | 1701（-33.4%） | 不过 |

vector_lb 与 NV2 代理在 **scalar vs scatter** 上不一致：宽度口径认为
scalar（向量指令更少，1106）优于 scatter（1255）；NV2 端口模拟认为
scatter（1900）远优于 scalar（3518，写回路径/端口压力）。960 实机
前维持 scatter 为 best（NV2 代理仍是主要预测器），但搜索工具已支持
`--rank-by vector-lb --cost-top N --mca-target NP1|920B` 并行对照；
若后续拿到 960 实机 paired，用实机裁决这一分歧。NP1 宽度口径下
只有 sdot 系候选过减半门，mul 系全部不达标——继续优化方向应聚焦
sdot 累加器拆分/交织与写回路径。

### 8.11 下一步（更新）

**已完成（2026-08-14）**：
1. 搜索工具接入 sve2p1：`candidate_march/candidate_opt` 按 compute 轴
   选 `armv9.4-a+sve2p1 + -O3`（2026-08-14 起 sdot 系加
   `-frename-registers`，见下方 flag 扫描），manifest 新增
   `compute: [mul, sdot-s32]`；
   4 组合（store × compute）全跑通。注意 **QEMU 11.0.3 反汇编把 sdot
   打成 .byte，搜索工具的 fused 排名对 sdot 候选偏低**（sdot scalar
   4086 vs 真实 5462），排名方向仍正确（sdot 更优），最终候选以
   objdump 静态流口径复核。
2. **C 常量复用部分由 GCC 自动完成**（-O3 下 4 chunk 中约 2 组共享
   C 加载，C ldr 约 688/趟）；剩余显式 stage 级 k 循环复用会因 64 个
   O 累加器同时存活而 spill 增加，暂不实施。
3. s64 打包轴按 §8.7 核算勘误降级。

**chunk 对共享 C 阴性（2026-08-14，emitter `sdot-s32-pair`）**：
把 CDOT 常量改为每 k 加载一次、两个 chunk 共享（ld1h 1376→704）：
pair_scalar fused 4704→**5660（+20%，spill 大增）**；pair_scatter
fused_uop 5878→5583（-5%）但动态 MCA **1900→1940（+2%）**。
指令数收益被 2 倍累加器存活的寄存器压力抵消，且 MCA 更差——**不
采用**，保持每 sdot 一条 volatile ld1h 的单 chunk 方案（这也是一次
“fused 更优但 MCA 更差 → 拒绝”的 MCA 指导决策）。

**累加器拆分阴性（2026-08-14，emitter `sdot-s32-split`）**：O 8 链
→2×4、EO 4 链→2×2（链深减半，+192 adds/chunk×4×2）：scalar fused
4704→**5136（+432）**、MCA 3518→3586（+2%）；scatter fused
5878→6252（+374）、MCA 1900→1957（+3%）、vector_lb NP1
1255→1367（+9%）。依赖链不是瓶颈（16 条独立 O 链已交错），拆分只
增加指令与寄存器压力——**不采用**（4 组合均过 20k/lite，仅作阴性
记录，emitter 保留该轴，manifest 不启用）。

**zip32 写回转置暂停（2026-08-14）**：emitter `--store zip32` 实现
32×8 寄存器转置（splice 列对 + uzp 蝶形 order 1,2,4 + 连续 st1h，
写回地址与 scatter 相同）。转置模式已用独立 QEMU 探针验证正确
（synthetic n 与 kernel 同构 n 均 bad=0），但**集成到 kernel 后
20k 差分 ~89% 失配**（GCC 16 与 Clang 22 均错）；现象：前 8 行
0-7 列正确、其余全错，且错值来自后续 chunk 的 n 向量。coef 加
padding 未修复。round-0017 咨询把“越界 UB”列为头号假设，实测用
8-lane 谓词加载（p8h）消除越界后**仍失配**——UB 假设被否定。
**真正根因（2026-08-14 定位）**：`chunk_store_zip32` 的写回地址把
`off` 当元素偏移而非行乘数——`dst + (off + r*stride)` 应为
`dst + ((off + r)*stride)`。off=0 的 chunk0 恰好正确（所以前 8 行
0-7 列对），chunk1-3 则覆盖第 0-7 行的 8-31 列，行 8-31 未写。
修复后 20k 0 失配 + lite 5/5，成为新 best（见下）。

**zip32 新 best（2026-08-14，vnum + rename + off 修复）**：

| 版本 | fused_uop | 动态 MCA | 相对 NEON 3319 |
| --- | ---: | ---: | ---: |
| sdot-s32 zip32（best） | **5249** | **1185** | **-64.3%** |
| sdot-s32 scatter | 5847 | 1550 | -53.3% |
| sdot-s32 scalar | 4697 | 3195 | -3.7% |

全 6 组合过 20k + lite 5/5；best 已固化
`kernels/idct32/candidates/best_sve2.{cpp,S}`（fused 5249 /
MCA 1185 / vector_lb NP1 ~1306）。写回路径收益：去掉 256 条
scatter（1024 uops），换 64 条连续 st1h + 128 splice + 384 uzp，
总 uOps 8405→6822。

**IDCT16 sdot-s32 轴（2026-08-14，制胜配方推广）**：idct16 emitter
新增 `compute: [mul, sdot-s32]`（SVE2p1 sdot z.s,z.h,z.h + vnum 常量
寻址，O 4 对 / EO 2 对 / EEE / EEO 结构，8-lane s16 行加载）。全 6
组合 20k 0 失配 + lite 5/5：

| 版本 | fused_uop | 动态 MCA |
| --- | ---: | ---: |
| zip16 + sdot-s32（新 best） | 976 | **245** |
| zip16 + mul（旧 best） | 1025 | 438 |
| scalar + sdot-s32 | 1066 | 258 |
| scatter + sdot-s32 | 1077 | 312 |

新 best 已固化 `kernels/idct16/candidates/best_sve2.{cpp,S}`（MCA
245，-44% vs 旧 mul 438）。搜索工具缓存键加入 build fingerprint
（编译器+编译参数+后端，round-0017 咨询），flag/编译器轴扫描不再
误复用旧计数。

**sched-pressure-algorithm=1（2026-08-14，round-0017 咨询实验 2）**：
在 sdot 系 `-O3 -frename-registers` 基础上追加
`--param=sched-pressure-algorithm=1`（比默认算法 2 更保守限制压力）：
idct32 zip32 sdot fused 5249→**5111**、stack 594→455、动态 MCA
1185→**1171**（对 NEON -64.7%）、uOps 6822→6383，20k/lite PASS；
idct16 zip16 sdot 基本持平（fused 976→978、MCA 245→247）。已写入
搜索工具 sdot 默认参数并重新固化两 kernel best。G1
（-msve-vector-bits=256）与 G2（-flive-range-shrinkage）无改善。
round-0017 完整结论见 expert-advice/round-0017/
（summary.md / tooling-roadmap.md / verification.md）。

**输入行按需装入（2026-08-14，round-0017 P1 落地）**：每行输入只
属于一个分解族（O/EO/EEO/EEEO/EEEE 行集互不相交），sdot 发射器改为
逐 row-pair `load→zip→sdot(active accs)`，行与 d 立即死亡，峰值活跃
从 ~40 降到 ~17。`tools/peak_live.py` 实测动态流峰值活跃 Z（P1
baseline）：idct32 zip32 best **31**（live_area 79181）、scatter 30、
idct16 zip16 31——GCC 已把峰值压在 32 预算内（咨询对 transpose 区
48+ 的估计不成立，直接 asm 原型从“压峰值”降级为“压标量/permute
开销”）。效果（idct32 官方搜索口径）：zip32 sdot fused
5111→**5085**、stack 455→430、MCA 1171→**1164**（对 NEON
-64.9%）、uOps 6383→6172；scatter/scalar 也各降 ~1%；idct16 持平
（噪声内）。两 kernel best 已重新固化。

**O k_block=8 阴性（2026-08-14）**：emitter 支持 `--k-block 8`
（16 个 O 累加器分两组、每组重走输入行，低峰值活跃换重复行 load）：
fused 5085→5083、stack 430→428，但手动 MCA 1301→**1310（+9）**、
峰值活跃仍 31——重复 load 的代价超过 spill 节省，**不采用**，默认
k_block=16。

**Clang profile 阴性（2026-08-14）**：修复后 clang 已正确（20k 0
失配），C1-C3 关键档（-msve-vector-bits=256、greedy +
split-spill-mode=speed + eviction-cutoff=1000）在 JIT zip32 上
fused 5358（GCC 5085）、stack 298 更少但向量指令更多——不敌 GCC，
按 round-0017 路线图停止枚举编译器隐藏 flag。

**DCT32 压力诊断（2026-08-14，peak_live 复测）**：

| kernel | 峰值活跃 Z | live-area |
| --- | ---: | ---: |
| dct32 cand4002（本项目） | 30 | 53497 |
| dct32 内部手写 | 21 | 41734 |
| dct32 上游 | 31 | 303845 |

本项目 dct32 峰值已在预算内，live-area 比内部高 ~28%（调度/寿命略
长），但 MCA 已持平内部（1041 vs 1048，docs/20 §6.17 950 实机
985~995 最快）；无明显 spill 大头，维持 -O2/op 后端现状。

**zip-fuse 中性（2026-08-14）**：emitter `--zip-fuse` 把 zip32 写回
改为逐对 round+splice 融合（n 立即死亡）：fused 5085→5087、stack
430、手动 MCA 1301→1299、uOps 7026→7039——全部噪声内，GCC SSA
调度已等效实现该融合。**不单独采用**，作为搜索轴保留（后续如与
k_block/直接 asm 组合可再评估）。

**转置最小性（2026-08-14，permute 模拟）**：32×8 拆成两个 16×8 块
（8 个 splice 后 8 向量）同样需要 uzp 3 层 (1,2,4)——每 chunk 仍 64
permute；8×8 分块（16 uzp + 16 splice 合并）更差。当前 zip32 写回
（16 splice + 48 uzp + 16 st1h/chunk）在 splice/zip/trn/uzp 方案族
中已最小，640 permute 属算法固有，不再搜索该方向。

**编译 flag 扫描（2026-08-14，sdot-s32 候选）**：

| flag | scalar fused | scatter fused | 备注 |
| --- | ---: | ---: | ---: |
| -O3（基线） | 4704 | 5878 | — |
| -O3 -frename-registers | **4697** | **5849** | scatter MCA 1900→1883；20k/lite PASS |
| -O3 -fweb | 4704 | 5878 | 无改善 |
| -O3 -fsched-pressure | 4704 | 5878 | 无改善 |
| -O3 -fipa-ra | 4704 | 5878 | 无改善 |
| -O3 -fno-sched-pressure | — | 5941 | 更差 |
| -O2 | 5000 | 6077 | spill 更多（stk 848/611），已弃 |

结论：sdot 系搜索编译参数最终为
`-O3 -frename-registers --param=sched-pressure-algorithm=1`（搜索工具
`candidate_opt` 已更新；G3 见上文）；其余 flag 已按 round-0017
结论停止深挖（Clang C1-C3 阴性、-msve-vector-bits=256 阴性）。

**950/960 验收命令（SVE2p1 候选，等实机）**：

```sh
# 20k 差分（QEMU VL=256，本地即可）
python3 tools/gen_verify.py --manifest kernels/idct32/manifest.yaml --out /tmp/v.cpp
# TestBenchLite 5 seed（实机/本地均可）
bash scripts/build-testbench-lite.sh kernels/idct32/candidates/best_sve2.o \
  build/x265-8-testbench -- --gate idct32 --seed 1
# 950/960 实机 paired：CNTVCT 微基准（同 dct32_microbench 模式）对比
# 上游 NEON idct32 vs best_sve2；NP1(960) 口径 vector_lb ≤1276.75。
# 微基准（2026-08-14 新增，本地 QEMU 已验证 0 失配）：
bash scripts/build-idct-microbench.sh idct32 build/idct32_microbench
bash scripts/bench-dct32-paired.sh build/idct32_microbench neon cand
bash scripts/build-idct-microbench.sh idct16 build/idct16_microbench
bash scripts/bench-dct32-paired.sh build/idct16_microbench neon cand
```

注意：950（920G）实测早期 sdot 候选曾 1.08× 慢于 NEON，需用当前
best（MCA 1164）复测；960（SVE2.3，NP1 4×256）为最终验收机。

**C 常量 vnum 立即数寻址（2026-08-14，正收益）**：`load_c` 改为
`asm volatile("ld1h %0.h, %1/z, [%2, #%3, MUL VL]")`，base =
`CDOT_X[k][0]`、vnum = p（每行 1 VL，p∈[0,7] 在 LD1H MUL VL
立即数范围内）。效果（sdot scatter，-O3 -frename-registers）：

| 指标 | 旧（指针寻址） | 新（vnum） | 变化 |
| --- | ---: | ---: | ---: |
| adrp（静态） | 944 | 95 | -849 |
| 动态指令（trace 口径） | 8501 | 7386 | -13% |
| fused_uop | 5849 | **5847** | -2（SIMD 口径几乎不动） |
| 动态 MCA（全搜索确认） | 1900 | **1550（-18.4%）** | 相对 NEON 3319 **-53.3%**，过 NP1 减半门 |
| 20k / lite | 0 失配 / PASS | 0 失配 / PASS | 保持 |

scalar 写回变体 MCA 3518→3334（改善但写回路径仍拖后腿，不及
scatter 1688）。要点：**spill/地址算术多是指令流里的标量部分，
fused_uop（SIMD 口径）看不到，必须用动态 MCA/总指令数评估**——
这正好是 round-0017 咨询关注的 regspill 收敛口径。emitter 已默认
采用 vnum 寻址；搜索已重跑并固化 best（sdot scatter：
fused 5847 / MCA 1550 / vector_lb NP1 1266 / lite 5/5，scalar
变体 MCA 3195）。另修复 finalize 对多 token candidate_opt 的编译
（`.split()`）。

**下一步**：

已完成（2026-08-14，§8.11 更新）：QEMU trace 修复（fix_dynamic_trace
+ .byte 补丁）、自定义 llvm-mca sdot_z32 调度、vnum 常量寻址、
zip32 写回（off 地址修复）、sdot 系 G3/rename 编译参数、idct16
sdot-s32 轴、搜索缓存 build fingerprint、MCA 短名单并集。

**下一步（按 round-0017 路线图重排）**：
1. **直接 asm pressure-budgeted 原型**（咨询实验 3）：k_block=4/8、
   in-place 蝶形（EEEE/EEEO→EEE→EE→E 覆盖已死输入）、round+splice
   融合、linear scan（K=24/32）后嵌回两 stage；目标动态 MCA 低于
   当前 1164（idct32）且 peak-live ≤24~32；设计蓝图见
   docs/28-direct-asm-prototype.md。**M1 完成（O 阶段固定寄存器汇编，
   bad=0）；M2 成本分析停止**：t/u 蝶形在位化需 48 ops/chunk（C++
   32），spill 节省 ~54/chunk 不足以抵消，预期收益 ≤3-5%——原型
   按止损规则终止，机制与工具保留；
2. **950/960 实机 paired**（SVE2p1 候选无法在 920B 跑；920G 内部已有
   早期 1.08× 慢于 NEON 的记录，需用新 best 复测）；
3. **低价值不优先**：Clang C2-C4（PBQP/ilpmin）诊断、dct32/dct16
   mul 系 flag 矩阵（-O2 已最优）、920B SVE1 paired（best_sve1 已
   测：慢上游 ~16%，记录在 docs/10 §0.3）。
