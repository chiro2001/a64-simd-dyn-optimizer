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

尝试 sdot 化 O/EO 时确认：**s16×s16→s32 的非 indexed SDOT 不是
SVE1/SVE2 指令**（GCC 16 的 `svdot_s32_s16`/`svdot_lane_s32_s16`
要求 sve2p1，汇编器拒绝 `sdot z.s, z.h, z.h`）；SVE1 只有
`svdot_lane_s64`（4-way indexed，.D 累加器，dct32 已用）。

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

两者都过减半门 7614。consensus 选 scatter（MCA/est 优），scalar 的
cp 最短；TestBenchLite idct32 gate 待加（先以 20k 差分为门禁）。
候选固化 `kernels/idct32/candidates/{scalar,scatter}_sve2.{cpp,S}`，
搜索结果 `experiments/m30-idct32-search/store-axis/results.json`。

### 8.5 工具修复（2026-08-14）

gen_verify 的 idct 模板缓冲区写死 `${n} * 32 + ${n}`，对
idct32+stride 64 越界（最大索引 2015 > 1056），导致假失配 15.47%。
改为按 manifest 最大 stride 分配（`${n} * ${maxstride} + ${n}`）；
修复后 20k 全零失配（此前的“IDCT32 失配”是 harness bug，非 kernel）。

### 8.6 下一步

1. zip32 转置/合并半块写回（scatter 的 cp 4170 偏高，需实机/模型校准）；
2. TestBenchLite idct32 gate（weak 符号）；
3. 950 实机 paired（scalar vs scatter）；sdot 化按 §7.1c 约束评估。
