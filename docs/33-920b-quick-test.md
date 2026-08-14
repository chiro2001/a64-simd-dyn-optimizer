# 920B 实机快速测试指南（2026-08-14）

> 目的：与“云主机”测试环境对齐真实 920B（鲲鹏 920，**SVE1 2×256 /
> NEON 4×128，无 SVE2**）。所有 SVE2/SVE2p1/SVE2p3 候选都必须先
> 替换成 SVE1 形状（docs/29），数值不保真，只用于 CNTVCT cycle 预估；
> 920B 无 PMU（docs/26），用 cntvct paired。

## 1. 测试矩阵

| 内核 | 920B 原生? | 方式 |
| --- | --- | --- |
| dct8 best | ✅（SVE1+NEON bridge） | 原生 paired |
| idct16/idct32 best | ❌（SVE2p1 sdot） | 替换 sve1（已有命令） |
| interp8 hpp path-B | ❌（SVE2p3 sdot.h） | 替换 sve1（含 sqrshrunb 替换） |
| interp8 vpp / sa8d16 / hpp path-A | ❌（SVE2 cadd/rshrnb） | 不可测（无 1:1 替换） |

## 2. 准备

```sh
cd <repo> && git pull && git log -1 --oneline
uname -m && lscpu | grep -E 'Model name|CPU max'
# x265 参考库：与 docs/32 §2 相同，但 CFLAGS 用 -march=armv8.2-a+sve
```

## 3. 门禁

920B 上只有 SVE1 兼容候选能跑 lite gate：

```sh
bash scripts/build-testbench-lite.sh kernels/sa8d/candidates/best_sve2.o \
  build/x265-8-920b -- --gate sa8d --seed 1
# interp8/dct/idct gate 会 SIGILL（候选为 SVE2+），属预期；
# 正确性一律以本地 QEMU 20k + lite 为准（已在仓库记录）。
```

## 4. paired（全部替换版，标注上界/下界）

### 4.1 idct16 / idct32（sve1 替换，已有实测样本 docs/29 §4）

```sh
bash scripts/build-substituted-microbench.sh idct16 sve1 build/idct16_sve1
bash scripts/bench-dct32-paired.sh build/idct16_sve1 neon cand
bash scripts/build-substituted-microbench.sh idct32 sve1 build/idct32_sve1
bash scripts/bench-dct32-paired.sh build/idct32_sve1 neon cand
```

### 4.2 dct8（原生 SVE1）

```sh
bash scripts/build-dct8-microbench.sh build/x265-8-920b build/dct8_mb \
  kernels/dct8/candidates/best_sve2.cpp
taskset -c 0 build/dct8_mb neon latency 1 64 --noverify 2>/dev/null | tail -1
taskset -c 0 build/dct8_mb cand latency 1 64 --noverify 2>/dev/null | tail -1
```

### 4.3 interp8 hpp path-B（sve1 替换，2026-08-14 云端已测 8x8）

```sh
# 一键构建（sve1 目标自动改用 uzp 对和源码，addp 无法 1:1 替换；
# sdot.h->sdot.s + sqrshrunb 替换）
BUILD=build/x265-8-920b bash scripts/build-interp8-substituted-microbench.sh \
  16 sve1 build/ipb16_mb
bash scripts/bench-generic-paired.sh build/ipb16_mb 16x16 neon cand 30 8 /tmp/ipb16.csv
# 32x32 同理（best_sve2_sdoth_32x32.cpp、32x32 shape）
```

## 5. 报告格式

```text
=== 920B real machine quick test ===
date / git-commit / uname / nproc
ISA: SVE1 2x256 / NEON 4x128 (no PMU, cntvct)

[paired] (neon/cand median)
kernel            fused  MCA  p50_neon p50_cand ratio  备注
dct8              ...    ...  ...      ...      ...    原生
idct16(sve1sub)   ...    ...  ...      ...      ...    上界
idct32(sve1sub)   ...    ...  ...      ...      ...    上界
ipb8(sve1sub)     ...    ...  ...      ...      ...    高估上界
ipb16(sve1sub)    ...    ...  ...      ...      ...    高估上界
ipb32(sve1sub)    ...    ...  ...      ...      ...    高估上界

[结论] 与云主机 124.70.206.229 的差异（>10% 波动需要关注）。
```

## 6. Agent 注意事项

1. 920B 无 SVE2：任何含 SVE2 指令的候选直接 SIGILL，先检查
   `aarch64-linux-gnu-objdump -d <cand.o> | grep -cE '\b(cadd|rshrnb|sqrshrunb|sdot.*\.h)'`；
2. 替换版报告必须注明“上界/下界”，禁止与原生结果直接比较；
3. 与云主机结果并列保存（旧云端样本：docs/29 §4 与 docs/22 §5.3/5.5）；
4. 报告文件整段贴回。
