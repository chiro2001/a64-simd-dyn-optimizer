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

## 4. 方案 A 实测（2026-08-13 深夜）

已落地 `kernels/interp8`（manifest + gen_verify interp8 shape + 发射器 +
搜索注册）：

| 实现 | dynamic | vector | movprfx | fused_uop |
| --- | ---: | ---: | ---: | ---: |
| 上游 interp_horiz_pp_neon<8,8,8> | 162 | 141 | 0 | 141 |
| 工具 path-a（sdot.d 切片，合并归约） | 193 | 143 | 16 | **127** |

- 2 万例 × 3 相位差分 0（upstream-exact）；fused_uop **-10%**；
- 第二次迭代（合并归约）：两个半程的 uzp1 结果经 tbl2_s32（注意 s32
  tbl2 索引 8-15 选第二个源，不是 16-23）合并成 8-lane 后一次
  rshrnb+uzp1_s16+vqmovun+整行存储，134 → 127；
- 实际收益仍低于预估（-16%）：ldur 47→8 的节省被 tbl 切片（每行 3）+
  sdot/归约开销抵消；
- 达标路径仍是方案 B（SVE2p1 sdot.h，预估 -35%，GCC 16.1 无 intrinsic，
  需 asm backend）；方案 A 保留为 SVE2 兼容基线。

### 4.1 存储越界修复与 lite 门禁（2026-08-13）

path-a 最初用整宽 SVE 存储：
`svst1_u8(p8b, dst, svset_neonq_u8(svundef_u8(), vcombine_u8(u, ...)))`。
VL=256 时该指令写 **32 字节/行**，只有低 8 字节有效，其余为未定义值，
构成越界写。此前 roundtrip 差分只比较每行前 8 字节，未能发现；
接入 IPFilterHarness 门禁后其**整缓冲 memcmp**（40000 字节，含 0xCD
哨兵）立即 FAIL。

修复：改为 NEON `vst1_u8(dst + r * dstStride, u)`，精确 8 字节/行。
修复后：TestBenchLite `--gate interp8` 5 个 seed 全 PASS、20k 差分 0、
fused_uop 仍 127。这是“lite 门禁比窄差分强”的实证：差分应保留为快速
筛选，验收门禁必须覆盖写足迹。

### 4.2 TestBenchLite interp8 门禁（2026-08-13）

- `tools/testbench_lite.cpp` 新增 `--gate interp8`：复用 x265
  `IPFilterHarness`（100 次 × 3 相位 × 随机/最小/最大输入模式，整缓冲
  比较）；ref = 上游 `interp_horiz_pp_neon<8,8,8>`（upstream-exact
  合同，用户裁定不需要 C ref）。
- `scripts/build-testbench-lite.sh` 编译并链接 `ipfilterharness.cpp`，
  自动携带 interp8 候选对象。
- 门禁接入后发现的越界写已修复（§4.1）。

## 5. 方案 B 工具链实测（2026-08-13）

- `sdot z0.h, z1.b, z2.b`（8-bit→16-bit，8 输出/指令）在
  `-march=armv9.5-a+sve2p3` 下**汇编器可接受**（该编码实际是 SVE2p3，
  不是 SVE2p1；ISA 目录已补 `sve2p3-sdot-h`）；
- **QEMU 11.0.3 执行 SIGILL**（max CPU 未实现 SVE2p3 sdot.h），本环境
  无法验证；需 960 实机或更新 QEMU；
- 方案 B 保持待验证状态，ACLE intrinsic 亦缺失（asm backend 就绪后
  可发射，但正确性门需要能执行它的环境）。

### 5.1 QEMU 更新路径核查（2026-08-13）

核查 QEMU 上游：2026-06-04 才出现 FEAT_SVE2p2（SVEVER>=3）补丁系列
（qemu-arm 邮件列表），GitHub `qemu/qemu` 仓库检索不到任何 SVE2p3
提交。因此**当前无法通过升级 QEMU 解锁 `sdot .h`**；方案 B 验证继续
挂起，等 960 实机或 QEMU SVE2p3 落地后恢复。

### 5.2 SVE2p3 执行 canary（2026-08-13）

- 已落地 `tools/sve2p3_canary.S/.c` + `scripts/sve2p3-canary.sh`：
  纯汇编 `sdot z2.h, z0.b, z1.b`，C 侧按 DDI0602 语义逐 lane 校验
  （连续正数 + 混合符号两组输入）；
- 实测：`aarch64-linux-gnu-as -march=armv9.5-a+sve2p3` 接受编码；
  QEMU 11.0.3 `-cpu max,sve-max-vq=2` 执行 SIGILL，脚本按 exit 3
  报告“执行器无 FEAT_SVE2p3”；
- 未来任一支持 SVE2p3 的执行器（新 QEMU/architectural model/960
  硅片）出现时，先跑 canary 再决定是否接入 interp8 path-B；canary
  不过则 path-B 只能标 `semantic-only`，不得称 upstream-exact。
