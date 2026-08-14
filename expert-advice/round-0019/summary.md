# QEMU SVE2p1/p2/p3 剩余指令补丁摘要（round-0019）

## 交付物

- 新补丁：`patches/qemu-sve2p1p3-remaining.patch`（相对 round-0018 已打补丁的
  `build/qemu-src` 状态；对 qemu-11.0.3 + round-0018 基线 `patch --dry-run` 通过）
- 验证程序：`build/qemu-verify/sve2p1p3-canary.S` / `.c` / 二进制
- 本摘要：`build/qemu-sve2p1p3-SUMMARY.md`

## 实现范围

### SVE2p3

- `SDOT` / `UDOT`，8-bit → 16-bit（BtoH），vector 形式：
  `sdot/udot z.h, z.b, z.b`
- `SDOT` / `UDOT`，BtoH indexed 形式：
  `sdot/udot z.h, z.b, z.b[idx]`
- `SABAL` / `UABAL` 2-way long accumulate：
  BtoH、HtoS、StoD 共 6 条
- Saturating shift-right-narrow-and-interleave：
  - HtoB：`sqrshrn`、`sqrshrun`、`sqshrn`、`sqshrun`、`uqrshrn`、`uqshrn`
  - StoH：`sqshrn`、`sqshrun`、`uqshrn`

### SVE2p2

- Zeroing 整数 unary：`cls`、`clz`、`cnt`、`cnot`、`not`、`abs`、`neg`、
  `sxtb/uxtb/sxth/uxth/sxtw/uxtw`、`sqabs`、`sqneg`、`urecpe`、`ursqrte`、
  `rbit`、`revb`、`revh`、`revw`、`revd`（q）
- 为区分 SVE2p3 的 shift-narrow-and-interleave，将原有单向量
  `SQSHRUNB/T ... UQRSHRNT` 的 bit23 从通配收紧为 0（ARM 编码中该位固定为 0，
  不影响任何合法旧指令）。

## 实现方式

- `helper-defs.h`：新增 dot/abal/shift/zeroing helper 声明。
- `vec_helper.c`：新增 `gvec_udot_2b`、BtoH indexed dot（按 16-byte 段内
  `idx*2` 取 2 个 8-bit 操作数）、`gvec_{s,u}abal_{h,s,d}`。
- `sve_helper.c`：新增 SVE2p2 zeroing 宏与实例、`sve2p3_*` shift-narrow-
  interleave helper（scratch 避免原地覆盖，`clear_tail` 收尾）。
- `sve.decode`：新增 SVE2p2 zeroing 模式、BtoH dot/udot vector+indexed、
  SABAL/UABAL、9 条 shift-narrow-interleave 模式。
- `translate-sve.c`：新增对应 `TRANS_FEAT`，特性门控 `aa64_sve2p2` /
  `aa64_sve2p3`（沿用 round-0018 的 `SVEVER>=3/4` 判断）。

## 构建

```sh
cd /home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-build
PATH=/home/chiro/projects/a64-simd-dyn-optimizer/build/ninja-root.uBSwLB/bin:$PATH \
  make -j8 qemu-aarch64
```

构建成功（静态 aarch64-linux-user；仅 glibc 静态链接 warning）。

## 验证

`build/qemu-verify/sve2p1p3-canary`（汇编经 `/usr/bin/llvm-mc -mattr=+sve2p3`
生成，C 端逐 lane 校验，VL=256）：

```text
$ build/qemu-build/qemu-aarch64 -L /usr/aarch64-linux-gnu \
    -cpu max,sve-max-vq=2 build/qemu-verify/sve2p1p3-canary
SVE2p1p3 canary: PASS
```

覆盖：
- BtoH dot/udot vector 与 indexed；
- SABAL/UABAL 三种宽度；
- 9 条 shift-narrow-interleave；
- SVE2p2 zeroing：abs/cls/cnot、sxtb/sxtw、sqabs、rbit/revb/revh/revw/revd。

回归：

```text
SVE2p1 sdot.s regression: PASS
SVE2p3 sdot.h canary: PASS (executor implements FEAT_SVE2p3)
```

## 未实现 / 跳过

以下 SVE2p1/p2/p3 指令未在本补丁实现，便于后续按需补充：

- SVE2p3：`ADDQP`、`ADDSUBP`、`SUBP`、`FCVTZSN`、`FCVTZUN`、
  `SCVTF/SCVTFLT/UCVTF/UCVTFLT`、`LUTI6`；
- SVE2p2：FP zeroing（`fabs/fneg`、`fcvt*`、`frint*`、`fsqrt`、`frecpx`、
  `flogb`、`fcvtx*`、`bfcvt*`）、`frint32/64z/x`、`expand`、`compact`、
  `firstp`、`lastp`、`fmmla`；
- `BFMMLA` 依赖的 `FEAT_SVE_B16MM` 未单独评估。

## 限制

- indexed BtoH dot 按“每个 16-byte 段内 `idx` 指向 2 字节组”实现，与 LLVM
  编码/寄存器约束一致；未在真机硬件上对照。
- `urecpe` / `ursqrte` 的查表结果未纳入 canary 数值校验（仅完成解码与 helper
  接线）。
- 只在本机静态构建和 `-cpu max,sve-max-vq=2` 下验证。
