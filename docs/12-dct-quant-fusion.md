# DCT→quant 融合可行性分析（round-0007 转向方向，v0）

## 1. 边界与语义（pinned x265 b81f650，8-bit）

非 RDOQ（HDQ）路径，`common/quant.cpp`：

```cpp
primitives.cu[sizeIdx].dct(residual, m_resiDctCoeff, resiStride);
...
uint32_t numSig = primitives.quant(m_resiDctCoeff, quantCoeff, deltaU,
                                   coeff, qbits, add, numCoeff);
```

`quant_c`（`common/dct.cpp:666`）逐系数：

```c
level    = coef[pos];                       // int16（DCT 输出）
sign     = level < 0 ? -1 : 1;
tmplevel = abs(level) * quantCoeff[pos];    // int32
level    = (tmplevel + add) >> qBits;
deltaU   = (tmplevel - (level << qBits)) >> (qBits - 8);
qCoef    = clip3(-32768, 32767, level * sign);
```

上游 NEON `quant_neon`（`aarch64/pixel-util.S`）每 8 系数 ≈23 条指令
（2 ld1 + 2 sabdl 宽化取绝对值 + 2 mul + 2 add + 2 sshl + 2 mls 算
deltaU + 2 sshl + 2 st1 + uzp1/cmeq/add 计数 + cmlt/eor/sub 符号 +
循环头），64 系数约 8×23+prologue ≈ **196 条**。DCT8 上游约 **341 条**，
两者合计约 **537 条/8×8 block**。

## 2. 融合位置

DCT8 pass2 的最后一步是 `vrshrn_n_s32(x, 9)`（rounding narrow，s16
截断），quant 随后把 s16 重新 `sabdl` 宽化到 s32 再乘 Q。融合点即把
pass2 的 16 个 `vrshrn` 结果直接留在寄存器里做 quant，而不是先
`st1` 到 `m_resiDctCoeff` 再被 quant `ld1` 回来。

## 3. 位级等价性：s16 截断是必须保留的屏障

pass2 累加器 `pre` 的范围（奇数列）可达
`4 × 65534 × 89 ≈ 23.3M`；`(pre+256)>>9 ≈ ±45.5k` **超出 s16
(±32767)**。C 参考用 `(int16_t)` 显式截断（回绕），且 uniform
[-255,255] 下确有输入落到该区间。因此：

- 融合必须保留一次 16 位截断（`vrshrn` 或其等价物），不能把
  `(pre+256)>>9` 与 quant 的 `>>qBits` 合并成单次移位——合并只在不截断
  的输入上等价，会破坏 C-exact 门禁；
- 融合的真实收益不是省掉窄化，而是省掉 16 条 `st1` + 16 条 `ld1`
  的中间内存往返，以及独立的 quant prologue/循环开销；
- 若产品接受"新合同"（禁止/接受回绕输出），可在合同级放宽后再做更深的
  shift 合并；当前 canonical C-exact 合同下不允许。

## 4. 静态收益量化（诚实口径）

| 项 | 指令 |
| --- | ---: |
| 当前 dct8 + quant_neon | 341 + 196 = 537 |
| 融合（pass2 输出直接进 quant，流式逐 res） | 约 495 |

即 **约 8% 的静态指令下降**（去掉 32 条内存往返 + ~10 条 prologue/循环
开销），外加依赖链缩短（store→load 往返消失，latency 口径有额外收益）。
注意：这不是 b/c 档 +130% 的杠杆，也不会把 tier-a 抬到 +30%；它是
编码管线级的小幅常数优化。

## 5. 实现成本与合同

1. 新 primitive（如 `dct8_quant`）需要带 `quantCoeff/deltaU/qBits/add`
   的签名，并在 `quant.cpp` 的非 RDOQ 分支替换两次调用；
2. RDOQ 路径（`nquant`）语义不同（无 deltaU、输出绝对级），需要单独
   变体或保持原样；
3. 必须过 C-exact 差分 + x265 官方 transforms/quant TestBench + 端到端
   encode 回归；
4. `quantCoeff` 逐位置缩放表依赖 scalingListType/QP，必须在 primitive
   内按位置加载，不能折叠成常量。

## 6. 判定

- 可行、可位级等价，静态收益约 8%，latency 有额外正向项；
- 收益不足以单独立项改变三档指标结论，但可作为"N+2 实机接入后、把
  DCT 与 quant 一起重构为 SVE256 宽 kernel"时的融合项；
- 优先级低于等待内部 DCT 参考（tier-a 结构差距）与 N+2 实机（b/c），
  作为可执行备选记录，不阻塞主线。
