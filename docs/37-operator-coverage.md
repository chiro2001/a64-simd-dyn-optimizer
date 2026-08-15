# 全算子覆盖搜索方法（2026-08-14）

> 用户方向：研究如何**快速**对所有算子完成覆盖搜索和优化。本项目无
> 960 实机（MCA/950 校准 + QEMU 为最终代理），覆盖的价值 = 找到更多
> “指令数/MCA 双赢”的候选，供 950 实机与内部注入。

## 1. 覆盖清点（tools/enumerate_x265_simd.py）

顶层 EncoderPrimitives 字段清点（aarch64 有实现 = aa64）：

| family | aa64 字段 | 本项目覆盖 | 说明 |
| --- | ---: | ---: | ---: |
| dct/idct | 2（dct/idct 数组 + dst/idst4x4） | dct8/16/32、idct16/32 | 缺 idct8、dst4x4/idst4x4 |
| sa8d/satd | （嵌套） | sa8d 8/16；**satd 19 形状 ✅（通用 hadamard 配方：4x4 37/57、4x8 63/62、8x4 47/43、8x8 52/53、8x16 102/69、8x32 202/91、16x4 36/43、16x8 72/53、16x16 140/74、16x32 276/106、16x64 548/174、32x8 141/68、32x16 281/101、32x32 561/166、32x64 1121/298、64x16 561/168、64x32 1121/298、48x64 1681/426、64x48 1681/427）** | 其余大形状（24x32、64x64 等） |
| interp8 | （嵌套 luma_*） | hpp 8/16/32；**vpp 8/16/32 ✅（通用 vertical-fir 配方）**；**hps 8x8/8x16/16x16/32x32 ✅（fir-ps 配方）**；**vps 16x16/32x32 ✅（vertical-ps 配方：16x16 214/136、32x32 808/479）** | 缺 vsp/vss 与 isRowExt=1 契约（docs/40 §36） |
| interp4 | （嵌套 chroma filter_*） | hpp 16/32、vpp 16 | 缺 8x8/8x16/32x16 等 |
| **quant** | 4（quant/nquant/dequant_scaling/dequant_normal） | **全部 ✅**：dequant_normal 130/57、dequant_scaling gt 210/75 / le 193/72、quant 508/169、nquant 329/131 | 纯汇编，走 C/ACLE seed 模式（docs/44） |
| **sao** | 10（saoCuOrg*/Stats*） | **全族 ✅（10/10）**：saoCuOrg E0 305/133、B0 386/126、E1 610/171、E1_2Rows 306/103、E2 154/74、E3 135/73；Stats E0 block16 165/62（block32 101/70）、E1 block16 180/64（112/71）、E2 block16 181/65（112/71）、E3 block16 180/65（112/71）、BO 0vector/137（无优化空间） | docs/45 §10 |
| pixel-util | 2（scale1D/2D） | **scale1D_128to64 ✅（24/21）；scale2D_64to32 ✅（1664/378，正确但结构劣于 NEON uaddlp）** | pixel-util 收齐（2026-08-15） |
| ssim | 1（ssim_4x4x2_core） | **ssim ✅（45 fused / MCA 47）** | 简单（2026-08-15） |
| misc | findPosFirstLast/costCoeffNxN/scanPosLast/weight_pp/planecopy | 无 | 小算子，收益低 |
| sad | （嵌套，aa64 有 dotprod 实现） | **sad 16x16/32x32 ✅**（80/160 fused，MCA 69/118） | 无优化空间，纯覆盖（2026-08-15） |
| intra | （嵌套，aa64 有实现） | 无 | 复杂，收益不确定 |

## 2. 快速覆盖方法（让每个新算子 30-60 分钟进搜索）

1. **manifest**：复制最接近的现有 manifest，改 kernel/reference
   symbol/corpus/strides（注意 32 宽块 strides≥32）；
2. **gen_verify**：复制 interp8/interp4 模板（改 kind、相位数、
   边距），一次生成 20k 差分；
3. **emitter**：从“配方库”复用已验证结构：
   - 8-tap/4-tap 水平 → `sdot.h 切片 + addp 对和`（docs/22 §5.7）；
   - 垂直 → `滑动行管线 + MLA/累加器拆分`（docs/22 §5.6/5.10）；
   - 差分类（sad/satd）→ `abd/abs + addp/折减`（sa8d16 经验）；
4. **search 注册**：make_emitter 加一个 hook（3 行）；manifest 的
   layouts 给出轴（compute/pairsum/acc_split/unroll）；
5. **门禁**：20k 差分必需；lite gate 可选（IPFilter/MBDst/Pixel
   harness 按族接入）；
6. **固化**：搜索出 best 后复制 kernels/<name>/candidates/，更新
   known_kernels.json + docs/10 表。

这套流程已用 interp4（hpp/vpp）验证：从零到固化约 1-2 个会话。

### sad 覆盖记录（2026-08-15）

- 上游 aarch64 sad 是纯汇编（sad-neon-dotprod.S），抽取层按 docs/41
  的“C/ACLE 语义 seed + 对照汇编参考”模式：`kernels/sad/seed.cpp` /
  `kernels/sad-32/seed.cpp`（u8 绝对值差分 + uaddlv 行内归约，全直线），
  roundtrip 门禁 20k 例 0 失配（对照 `x265_pixel_sad_16x16/32x32_
  neon_dotprod`）；
- codegen 扩展（通用，非 sad 专属）：`uabd`（u8x16）、`uaddlv`
  （按源类型 u8x16→uint16 / s16x8→uint32）、标量 add/and/zext、
  GEP `nuw/nusw` 标志、**GEP 常量偏移按字节而非 stride 倍数**（sad-32
  的 `+16` 半行偏移暴露了 sa8d 时代 coef-only 模型的错误）；`and`
  导入支持（ACLE uint16 返回类型产生的 `and i32, 65535` 掩码）；
- 流水线：sad-16x16 best **80 fused / 69 MCA**；sad-32x32 best
  **160 fused / 118 MCA**（1 候选，diff-sum 族，axis_seed
  reduce=sve）。预期无优化空间，列为覆盖项。

## 3. 优先级建议（按“收益/成本”）

1. **quant（quant/nquant/dequant）**：4x4/8x8/16x16 形状，标量重但
   x265 有 C 基线可对照；先用 16x16 探收益（SVE256 宽度利用）；
2. **sad 16x16/32x32**：简单、宽形状、dotprod 上游已存在（可对齐
   NEON baseline），收益预期高；
3. **sao**：band/edge 是查表+累加，SVE 可行但先看上游复杂度；
4. **scale1D/2D、ssim**：小算子，快速收编；
5. **intra（DC/planar）**：复杂度高，放最后。

## 4. 覆盖的验收口径

- 每个新算子：20k 差分 0 失配（upstream-exact）+ 指令数/MCA 记录 +
  950 可测族（SVE2）上 paired；
- 无 960：SVE2p3-only 内核（interp8 path-B、interp4）以 MCA/950 校准
  模型为代理，标注“内部保留”；
- 全量清点工具定期重跑（`tools/enumerate_x265_simd.py`），把
  “todo” 项逐个消掉。
