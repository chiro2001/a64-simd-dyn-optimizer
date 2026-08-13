# SA8D 优化空间评估（2026-08-14）

问题：用当前工具链看 SA8D，相比开源方案还有没有更好的优化？

## 1. 实测基线（QEMU，VL=256，true-dynamic，单次调用）

| 实现 | total | vector | fused_adj | 说明 |
| --- | ---: | ---: | ---: | ---: |
| 开源 NEON sa8d8（M0 实测） | ~116 | — | — | 每调用动态指令 |
| **开源 SVE2 `sa8d8_sve2<8,8>`** | **111** | **97** | **97** | 本次实测 |
| 开源 SVE2 `sa8d16_sve2<16,16>` | 423 | 373 | 373 | 本次实测（4×8x8+封装） |
| 项目候选 single（8x8） | 117 | 101 | 101 | roundtrip 生成 |
| 项目候选 two-tile（8x8x2） | 125 | 103 | 103 | 16-lane 尝试 |
| 项目候选 8x8x2raw | 116 | 101 | 101 | |

项目 4 个 SVE2 候选均通过 2 万例差分（0 分歧），但指令数**均未超过
开源 SVE2**（111）——M0 时代的 roundtrip 候选没有用上 DCT16 迭代的
优化经验。

## 2. 开源 SVE2 实现的结构（pixel-prim-sve2.cpp）

8x8 核心：`load_diff_u8x8x8`（8 行 × 8 像素，u8→s16）+ 3 级
`x265_caddq_s16<90>`（CADD 复加）+ 2 次 `vqtbl1q_s16` 重排 +
sumsub/abssumsub + umax/add + `udot` 归约。**所有操作都是 128-bit
NEON 视图**（每指令只处理一行 8 像素），仅借用了 SVE2 指令（cadd/udot）。

指令构成（8x8）：cadd 24、tbl 16、ldr 17、usubl 8、add 10、sub 4、
abs/sabd/umax 各 4、udot 2、misc 8。

## 3. 优化空间（结论：有，且不小）

1. **真 256-bit 化**：VL=256 一个寄存器可放两行（16 像素）。核心
   butterfly 的 cadd/tbl 可减半（24→12、16→8），diff 加载与归约同步
   变宽。静态估算 8x8：111 → **~75-85**（相对开源 -25%~-30%）。
2. **去掉 tbl**：用 DCT16 已验证的 zip1/zip2.d + revh 布局替代
   `vqtbl1` 重排（tbl 16→0，代价少量 zip），并可复用 pass1_even_factor
   式因子化思路。
3. 项目 two-tile 候选（16-lane）失败的原因是打包开销吃掉了收益
   （125 > 111）——这正是我们的搜索轴/uop 指标能系统优化的对象
   （行打包、重排方案、归约形态各设轴）。

## 4. 建议

- 把 SA8D 接入现有 search pipeline（manifest + 发射器轴：行打包
  single/two/raw、重排 zip-vs-tbl、归约/存储形态），正确性门 = 现有
  sve_verify 2 万例差分，指标门 = fused_uop（8x8 < 97 即超越开源）。
- 优先级：在 DCT16 已达成指标、960 未流片的空档，SA8D 是下一个
  收益明确（-25%~-30%）的工具链扩展目标。
