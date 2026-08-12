# M18-interp8：8-tap luma 水平插值首轮闭环（tier-a 新目标）

- run-id: `m18-interp8`
- state: `foundation-only`（脚手架 + 基线 + 一个上游分歧发现；候选待做）
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地交叉 + N1 + 920B

## 1. 合同与入口

- `filter_pp_t(const pixel* src, intptr_t srcStride, pixel* dst, intptr_t
  dstStride, int coeffIdx)`：8-tap 水平 pixel→pixel，src 左移 3，
  `val=clamp((Σ g_lumaFilter[coeffIdx][k]·src[k] + 32) >> 6, 0, 255)`，
  4 相位（g_lumaFilter[4]，coeffIdx 0..3）。
- C 参考：`common/ipfilter.cpp:80 interp_horiz_pp_c<8,W,H>`；
- 上游 NEON 分派（filter-prim.cpp / filter-neon-dotprod.cpp /
  filter-neon-i8mm.cpp）：
  - 920B（有 i8mm）：`interp8_horiz_pp_i8mm`（vusdotq + vqrshrun）；
  - N1（有 dotprod、无 i8mm）：`interp8_horiz_pp_dotprod`；
  - 基座：`interp_horiz_pp_neon<8,W,H>`。

## 2. 脚手架

- `benchmarks/interp8_microbench.cpp`（c/neon/empty/cand，4 相位差分 +
  cand==C 门禁；相位固定 coeffIdx=2 做 A/B）、
  `scripts/build-interp8-microbench.sh`；
- 本地交叉+qemu：c==neon 通过。

## 3. 基线（paired latency，cntvct，ratio=neon/c <1 表示 NEON 更快）

| 形状 | N1 | 920B |
| --- | ---: | ---: |
| 8x8 | 0.516（NEON ~1.9× C） | 0.514 |
| 16x16 | 0.434（NEON ~2.3× C） | 0.582 |

与 DCT8 相反：上游 NEON 插值明显快于 C，tier-a 的 +30% 基线很强。

## 4. 上游分歧发现（N1 dotprod 变体，phase=0）

N1 上 c==neon 差分在 **phase=0（单位滤波器）失败**（920B i8mm 变体与本地
qemu 通过）。首例：want=0、got=65，src 窗口
[221,180,92,221,221,178,33,119]。C 的 phase0 = src[col+3]（=180），而
dotprod 变体给出不同值——与 DCT8 同类：特殊化变体与 C 参考的潜在分歧，
上游 TestBench 打不到。待下一轮用最小反例定位 dotprod 变体的具体差异，
候选合同仍定 **C 参考 bit-exact**。

## 5. 下一轮

1. 最小化 N1 phase-0 反例，定位 `interp8_horiz_pp_dotprod` 的差异；
2. 提取 seed IR（dotprod 变体带 udot/sdot/usdot 新 opcode，importer 需
   扩展 dot 家族），roundtrip → C-exact 候选；
3. 结构：i8mm 变体已用 16 宽 vusdotq，可参照做 8x8/16x16 的全宽 dot 候选，
   目标对上游 NEON +30%。
