# quant 族覆盖计划（2026-08-15）

> docs/37 优先级 1。aarch64 上 4 个字段全部是纯汇编
> （common/aarch64/pixel-util.S），无 ACLE 源码 → 沿用 sad 验证过的
> “C/ACLE 语义 seed + 对照汇编参考”模式（docs/41、docs/37 §sad 记录）。

## 1. 族清单与符号（libx265.a 已确认）

| 字段 | aarch64 符号 | 签名（fun-decls.h / arm/pixel-util.h） | 复杂度 |
| --- | --- | --- | --- |
| quant | `x265_quant_neon` | `uint32_t (const int16_t* coef, const int32_t* quantCoeff, int32_t* deltaU, int16_t* qCoef, int qBits, int add, int numCoeff)` | 中：scale+add+shift+符号+clamp+deltaU 累加 |
| nquant | `x265_nquant_neon` | `uint32_t (coef, quantCoeff, qCoef, qBits, add, numCoeff)` | 中：quant + 代价表 |
| dequant_scaling | `x265_dequant_scaling_neon` | `void (const int16_t* quantCoef, const int32_t* deQuantCoef, int16_t* coef, int num, int per, int shift)` | 低中：乘法+移位，per/num 两个循环 |
| dequant_normal | `x265_dequant_normal_neon` | `void (const int16_t* quantCoef, int16_t* coef, int num, int scale, int shift)` | **低：逐元素 (q*scale+8)>>shift；且有上游 SVE2 版 `x265_dequant_normal_sve2` 可对照** |

C 基线：common/quant.cpp（quant_c/nquant_c/dequant_*_c，随编译进
libx265.a）。黄金标准仍是 TestBenchLite（quant 在 TEncSearch/Quant
harness），过 lite 前先 20k 差分 0 失配。

## 2. 建议执行顺序（从最简到最复杂）

1. **dequant_normal**：固定 num=256（16x16 块）的 C/ACLE 直线 seed，
   每元素 `(int16_t)((q * scale + 8) >> shift)`；对照
   `x265_dequant_normal_neon`（或 sve2 版）。codegen 需要：
   - 标量 splat（runtime scale → `vdupq_n_s32`/`svdup`）+ `vmull`/
     `smull`（已有）+ `add const` + `asr`（标量/向量移位）+ 窄化
     （已有 rshrn 类可参考，这里可能是 `rshrn`/`sqrshrn`）；
   - 若 IR 出现 `ashr i32`：importer 需支持 `ashr`（当前只有 lshr）。
2. **dequant_scaling**：per（按 16 的倍数分组）与 num 双循环，seed 用
   固定 num=256/per=16 直线化；codegen 增加 per 分组偏移。
3. **quant**：符号保留 + clamp + deltaU 累加（`deltaU += abs(level)
   - (abs(coef)*scale >> qBits)` 类，需按 C 基线逐式核对）；
   seed 固定 qBits/add/numCoeff。
4. **nquant**：quant 之上叠加代价表（cost table 查表，常量源走
   `extract_x265_constants` 类似路径）。

### 执行记录 2026-08-15：dequant_normal ✅

- seed：`kernels/dequant/seed.cpp`（ACLE，256 元素直线，
  smull+sqrshl+sqxtn 链），roundtrip 门禁 20k 例 0 失配（对照
  `x265_dequant_normal_neon`；C 参考同 0 失配，信息项）；
- importer/codegen 新增通用资产：`trunc`、`insertelement`、
  `sub` 常量在前（`0 - shift`）、store 类型修正、GEP nuw/nusw、
  s16 load/store、`smull`/`sqrshl`/`sqxtn`、标量 splat shuffle、
  vget_low/high、vcombine、dequant ABI（void q/c/scale/shift）；
- 搜索层：`kernels/dequant/manifest.yaml` + `gen_verify` dequant 分支 +
  `tools/emit_dequant_normal_sve2_shared.py`（compute 两结构，SRSHL
  用内联汇编——ACLE 头无变量移位接口；qxtnb/qxtnt 是**交错语义**，
  smullb/t 偶/奇配对天然正确，ld1sh-mul 需 uzp1 还原顺序）；
- 结果：**compute-smull 130 fused / MCA 57**（= 上游 SVE2 形状），
  compute-ld1sh-mul 162 / 63（正确但更差）；20k 差分均 0 失配；
- 下一步：dequant_scaling（per/num 双循环）。

### 执行记录 2026-08-15：dequant_scaling ✅（双分支）

- 运行时分支 `shift+4 > per`（gt：加半舍入后算术右移）与
  `shift+4 <= per`（le：饱和窄化后饱和左移）拆成两个无分支 seed
  （`seed_scaling_gt/le.cpp`），各自 20k 例 0 失配（对照
  `x265_dequant_scaling_neon`，按分支约束 per/shift 取值）；
- codegen 新通用资产：scaling ABI（q/dq/c/shift/per）、s32 load、
  sext（vmovl）、vector mul（vmulq_s32）、sshl（vshlq_s32）、
  sqshl（vqshlq_s16）、变量移位 `shl 1, %cnt`、xor 常量；
- 搜索层两个 kernel（`dequant-scaling-gt/le`），widen 两结构：
  - **unpk**（svunpklo/hi + uzp1 恢复顺序）：gt **210 fused / 75
    MCA**，le **193 / 72**；
  - smull-ones（svmullb/t × ones + dq 偶/奇 uzp1/uzp2 配对）：gt
    227 / 82，le 210 / 77；
- 语义实测：SVE UNPKLO/HI 是连续半宽（非交错），qxtnb/qxtnt 是
  交错填充，svuzp1 可还原；SVE ASR 需正数位移量（NEON 的 sshl 用
  负数）；`do` 是 C++ 关键字；
- 待办：quant / nquant。

### 执行记录 2026-08-15：quant ✅

- seed：`kernels/quant/seed.cpp`（ACLE，abs→mul→add→ssh→mls→
  deltaU + 符号还原 + numSig），-O1 避免 clang 折叠；门禁 20k 例
  0 失配（对照 `x265_quant_neon`，约束 quantCoeff≤2^14、qBits 14..22
  使 level 落在 s16）；
- codegen 新通用资产：quant ABI、`select`（vbslq）、icmp→
  vceqzq/vcltzq mask + sext alias、`saddlv`（vaddlvq_s32）、
  abs 按源类型分派、sub 零向量（vneg）、s32 store、sub 向量类型
  解析修复；
- 搜索层 `kernels/quant`：widen 两结构均 20k 0 失配：
  - **unpk**（先加宽再 s32 abs + svmul）：**508 fused / MCA 169**；
  - smull-ones（svmullb/t + zip1/zip2 交织 deltaU）：573 / 192；
- 语义实测：`svmsb(a,b,c)=c-a*b`（参数顺序！）；SVE s16 ABS 对
  INT_MIN 回绕，必须先加宽到 s32 再 abs（参考用 SABDL 是精确的）；
  zip1/zip2 在 VL=256 各产出 8 lanes，交织偶/奇向量需要两次 store；
- 待办：nquant（quant 之上加代价表 + 绝对值输出）。

### 执行记录 2026-08-15：nquant ✅（quant 族收齐）

- seed：`kernels/nquant/seed.cpp`（无 deltaU，qCoef=|level|，numSig
  复用 saddlv 配方），门禁 20k 例 0 失配（对照 `x265_nquant_neon`）；
- 搜索层：**unpk 329 fused / MCA 131**；smull-ones 362 / 138；
- quant 族最终状态：
  dequant_normal 130/57、dequant_scaling gt 210/75 / le 193/72、
  quant 508/169、nquant 329/131——四个字段全部 seed+search 闭环，
  docs/37 覆盖表 quant 行 ✅；
- 后续：sao 族（10 字段，查表+累加）或 scale/ssim 小算子。

## 3. 搜索层需求（新结构族，需一次配方设计）

- `kernels/quant/manifest.yaml` 族：reference = 4 个 NEON 汇编符号，
  baseline = C 参考 + NEON；
- emitter 注册（make_emitter hook）：quant 的结构轴候选：
  `compute`（mul/add/asr vs smull+ssra）、`scale_splat`（dup vs
  ld1r）、`narrow`（rshrn vs sqrshrn+pack）、`delta`（quant 专用：
  标量链 vs 向量）、`unroll`（行/块分块）；
- 轴种子（recipe_seed）：quant 无共享常量矩阵，但 quantCoeff 是
  runtime 指针 → 结构检测按 op 直方图（smull+asr+add+clamp）给
  `compute/narrow/unroll` 建议；
- SVE2 上游已有 dequant_normal_sve2：先做“NEON→SVE256 指令数减半”
  口径（docs/20 同款），再谈超越。

## 4. 验收

- 每函数：seed roundtrip 20k 差分 0 失配（C 参考 + NEON 汇编参考）；
- search best 与上游 NEON 比 fused/MCA（920B/NP1 target）；SVE2-only
  变体 950 可跑则加 paired；
- quant 的 TestBenchLite：x265 的 Quant 相关 harness 接入后过 5 seed。

## 5. 风险

- quant/nquant 的 qBits/add/numCoeff 是 runtime 标量，seed 固定值后
  门禁只覆盖该形状；后续用多形状参数化（4x4/8x8/16x16/32x32）；
- `ashr`/`smax`/`smin`/`dup` 等 op 可能未进 importer/codegen，按
  “缺什么补什么”原则逐个加（sad 同款节奏，每个 op 是通用资产）。
