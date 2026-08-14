已完成。补丁、静态构建和验证均交付：

- 补丁：[qemu-sve2p3-sdot-btoh.patch](/home/chiro/projects/a64-simd-dyn-optimizer/patches/qemu-sve2p3-sdot-btoh.patch)（仓库新增唯一文件，`git apply --check` 通过）
- 摘要：[qemu-sve2p3-SUMMARY.md](/home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-sve2p3-SUMMARY.md)
- 二进制：[qemu-aarch64](/home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-build/qemu-aarch64)（static-pie）

# QEMU SVE2p3 SDOT BtoH 补丁摘要

## QEMU 版本

- QEMU 11.0.3（`build/qemu-src/VERSION` = `11.0.3`；源码来自 `/home/chiro/downloads/qemu-11.0.3.tar.xz`，解包时间戳 2026-07-25）。
- 源码包不带 git 元数据，因此无上游提交号。

## 改动文件

- `target/arm/cpu-features.h`：新增 `isar_feature_aa64_sve2p2`（SVEVER >= 3）与 `isar_feature_aa64_sve2p3`（SVEVER >= 4）。
- `target/arm/tcg/cpu64.c`：max CPU 的 `ID_AA64ZFR0_EL1.SVEver` 从 2 提升到 4（FEAT_SVE2p1..p3）。
- `target/arm/tcg/helper-defs.h`：声明 `gvec_sdot_2b` helper。
- `target/arm/tcg/vec_helper.c`：新增 `gvec_sdot_2b`（int8×int8 → int16，2-way 点积累加）。
- `target/arm/tcg/sve.decode`：新增 `SDOT_zzzz_2h` `01000100 01 0 ..... 000000 ..... .....`。
- `target/arm/tcg/translate-sve.c`：`TRANS_FEAT(SDOT_zzzz_2h, aa64_sve2p3, ...)`，调用 `gen_helper_gvec_sdot_2b`。

## 构建命令

```sh
mkdir -p /home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-build
cd /home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-build
PATH=/home/chiro/projects/a64-simd-dyn-optimizer/build/ninja-root.uBSwLB/bin:$PATH \
  ../qemu-src/configure \
  --target-list=aarch64-linux-user --static --disable-system \
  --disable-capstone \
  --extra-ldflags=-L/home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-static-libs
PATH=/home/chiro/projects/a64-simd-dyn-optimizer/build/ninja-root.uBSwLB/bin:$PATH \
  make -j8 qemu-aarch64
```

构建环境备注：系统未装 `ninja`，从 conda 缓存离线解包到 `build/ninja-root.uBSwLB/bin/ninja`；系统缺 `libcapstone.a`，故 `--disable-capstone`；系统缺 `libz.a`，故在 `build/qemu-static-libs/libz.a` 提供 zlib 兼容的 CRC-32 实现，并用标准向量验证。

## 验证输出

SVE2p3 canary（`sdot z2.h, z0.b, z1.b`，VL=128）：

```text
$ build/qemu-build/qemu-aarch64 -L /usr/aarch64-linux-gnu \
    -cpu max,sve-max-vq=2 build/qemu-verify/sve2p3-canary
SVE2p3 sdot.h canary: PASS (executor implements FEAT_SVE2p3)
```

`-d op` 确认实际调用新 helper：

```text
call gvec_sdot_2b,$0x1,$0,tmp17,tmp18,tmp19,tmp20,$0x203
```

SVE2p1 回归（`sdot z.s,z.h,z.h`，VL=128）：

```text
SVE2p1 sdot.s regression: PASS
```

SVE2 回归（`kernels/sa8d/sve_smoke.cpp`，VL=256）：

```text
sum=40
```

CRC-32 stub 已知向量测试：

```text
crc32 empty: 00000000 OK
crc32 123456789: cbf43926 OK
crc32 0..255: 29058c73 OK
crc32 hello x10: e8b88597 OK
```

## 语义说明

ARM 官方 “SDOT (2-way, vectors), 8-bit to 16-bit” 语义是每个 16-bit 目的 lane 累加两对 8-bit 有符号乘积：`out.h[i] += a.b[2i]*b.b[2i] + a.b[2i+1]*b.b[2i+1]`。本实现与该语义及仓库已有 canary/LLVM 调度补丁一致。任务文本中的 “4-way” 与 ARM 语义不一致，补丁按 ARM 语义实现。

## 已知限制

- 只实现 unpredicated vector 形式 `sdot z.h,z.b,z.b`；未加 indexed 形式、UDOT BtoH、SME2p3 门控。
- 特性门控仅检查 SVE2p3（`SVEver >= 4`）。
- 新增了 `sve2p2` 谓词但未实现 SVE2p2 的其他指令。
- 只在本机静态构建和 `-cpu max,sve-max-vq=2/4` 下验证。

## 交付状态

- 仓库新增唯一文件：`patches/qemu-sve2p3-sdot-btoh.patch`。
- 未提交；QEMU 源码/构建均位于被 `.gitignore` 忽略的 `build/` 下。