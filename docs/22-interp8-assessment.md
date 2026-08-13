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

## 3. 实现路径评估（2026-08-13 深夜）

语义：`src -= 3`；8-tap FIR；`vqrshrun_n_s16(d, IF_FILTER_PREC=6)`
（饱和舍入窄化 s16→u8）；coeffIdx=1/2/3 三相位。

方案 A（SVE2-safe，sdot .d）：每行 1 次 16 字节窗载入 +
4 tbl 切片 + 4 sdot .d + uzp1/rshrnb 归约 + NEON bridge
`vqrshrun_n_s16` 收窄。预估 **~136 vs 上游 162（-16%）**——
收益主要来自 8 行合计 47 条 ldur 降到 8 条 ld1h；tbl 打包成本
吃掉一半收益。

方案 B（SVE2p1，sdot .h）：`svdot_s16`（s8→s16，每指令 8 输出 ×
2 项）+ 每行 4 sdot.h + 1 次收窄，预估 **~100-105（-35%）**。
但 **GCC 16.1 缺失 `svdot_s16` 与 s16→s8 饱和窄化 intrinsic**
（svsqrshrunb_n_s8 等均不存在），需走 asm backend（参考
emit_dct16_sve2_asm.py），且目标必须是 SVE2p1（960 可，920G 未知）。

结论：interp8 值得投入但优先级低于已收敛的 dct 族；先做方案 A
（SVE2-safe，-16%）建立管线，SVE2p1 asm 路径作为后续轴。
