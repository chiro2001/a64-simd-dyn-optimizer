# interp8（8-bit 水平 8-tap）评估（2026-08-13）

> `interp8_hpp` 只存在于 HIGH_BIT_DEPTH 构建；8-bit 库的对应原语是
> `x265::interp_horiz_pp_neon<8, W, H>`（filter-prim.cpp），本节评估
> 8x8 实例（luma 8-tap 水平）。

## 基线（QEMU VL=256，true-dynamic，单次调用）

| 指标 | 值 |
| --- | ---: |
| dynamic total | 162 |
| 向量 raw | 141 |
| 其中 load（ld1/ldr/ldp/ldur） | 56 |
| 计算（umull/uaddw/umlal/umlsl/sqrshrun/movi 等） | ~106 |

- **计算 bound 成立**（SIMD 计算 106 > load 56，满足用户规则）；
- 指令构成：umull 16 + uaddw 16 + umlal 16 + umlsl 8 + sqrshrun 8 +
  movi 5 + ldur 47 + ldr 9 + str 8 + 标量地址 ~30。

## SVE256 机会（v3 切片技术的直接应用）

8-tap FIR 每输出 = 8 项点积；与 DCT32 v3 同构：
- 4 个输出位置的 4-tap 切片打包进 16-lane 寄存器，
  `sdot .d`（s16 系数 × u8 数据，注意符号扩展）+ 双份常量；
- 归约 uzp1+rshrnb+向量存储；
- 两个 4-tap 半程共享同一数据窗（卷积的滑动窗口），
  切片可跨输出复用；
- 预估 fused 141 → ~70-90（接近减半）。

## 状态与下一步

- 已具备接入条件：manifest/gen_verify 需扩展 filter 形状
  （u8→u8、stride×2、coeffIdx 参数）；
- 下一步：建立 kernels/interp8 manifest + 差分（vs
  `interp_horiz_pp_neon<8,8,8>`）+ v3 切片发射器；
- 实机验收仍等 960/950；920B 为 SVE1，仅可跑 NEON 对照。
