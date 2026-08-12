# m17-fusion-feasibility：DCT→quant 跨 primitive 融合可行性（分析）

- run-id: `m17-fusion-feasibility`
- state: `foundation-only`（只读分析；未实现融合 kernel）
- date: 2026-08-13（Asia/Shanghai）

## 1. 数据流（pinned x265 b81f650，`common/quant.cpp`）

```text
quant.cpp:432  p.cu[sizeIdx].dct(residual, m_resiDctCoeff, resiStride)
quant.cpp:469  p.quant(m_resiDctCoeff, quantCoeff, deltaU, coeff, qbits, add, numCoeff)
```

`quant_t(const int16_t* coef, const int32_t* quantCoeff, int32_t* deltaU,
int16_t* qCoef, int qBits, int add, int numCoeff)`。DCT 输出 64×s16 直接
进入 quant 的 coef 参数。

## 2. 结论：直接融合收益小，不建议现在实现

1. **中间缓冲必须保留**：RDO 路径后续要用 `m_resiDctCoeff` 做反量化/
   逆变换，DCT 侧的 store 无法消除；融合只能省 quant 侧的 64×s16 重载
   （约 8 条 ld1 + 寻址），约几个 cycle。
2. **合同复杂度高**：quant 有 qBits/add/numCoeff 三种运行参数与 deltaU
   边带，融合 kernel 必须对全部模式 bit-exact；差分测试矩阵成倍膨胀。
3. **风险不对称**：编码器变换/量化是全局 bit-exact 关键路径，融合引入的
   rounding 偏差会以码流差异扩散，验证成本远超当前收益。

## 3. 更值得做的融合方向（下一轮候选）

- **residual→DCT 的输入复用**：dct 输入 residual 通常有 stride，且相邻
  TU 的 residual 来自同一预测差缓冲——但 call contract 是单块，收益同样
  受限；
- **双块批处理**不匹配单块 call contract；
- 结论：单 primitive 内部的结构优化空间已近耗尽（M15/M16 证据），跨
  primitive 融合的收益在 DCT+quant 上不成立。**建议把 tier-a 的重点移回
  其他算子（interp8_hpp 是 load-heavy 但 round-0005 明确可优化的典型），
  或在拿到内部 30-60% 参考实现的指令直方图后校准搜索空间。**
