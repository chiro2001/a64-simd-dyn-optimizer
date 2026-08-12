# M10-SVE-16x16：合法 16x16 两次 wave + 门禁基础

- run-id: `m10-sve-16x16`
- state: `blocked-environment`（功能门禁通过；1M/ASan 长门禁与 920B 实机
  待执行；性能必须等目标硬件）
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`（aarch64 编译）+ `qemu-aarch64 -cpu max,sve-max-vq=2/4`
- 新增环境：鲲鹏 920B（`chiro@124.70.206.229`，SVE v1、默认 VL=256）

## 1. 本轮试图证伪什么

round-0004 指出：x2raw helper 只有组合成合法 16x16 并对齐 x265 合同
（四个未舍入 R8 统一舍入）才有生产意义。本轮验证“两次 x2raw wave +
`(sum+1)>>1` 精确等于 sa8d16x16”，并建立 16x16 的 guard-page、VL 日志
与构建身份门禁基础。

## 2. 什么变了

- `optimizer/ir/codegen.py`：
  - 新增 `emit_sve_16x16_wrapper()`：顶部 wave
    `raw(a, sa, b, sb)` + 底部 wave `raw(a+8*sa, sa, b+8*sb, sb)`，
    返回 `(top+bottom+1)>>1`；
  - `raw=True` 尾部加固：跳过 pair 的 `add const 1` / `lshr 1` 前断言
    形状，未来 MachineIR 尾部变化不会静默误编译。
- `kernels/sa8d/gen_roundtrip.py`：新增 `--shape 16x16`（要求
  `--pack x2 --raw`）。
- `kernels/sa8d/sve_verify.cpp`：打印实际 `svcntb()`；x2raw oracle 改为
  逐 tile 断言 R8 为偶数（parity/scale lemma）；新增 16x16 oracle
  （四个 R8 统一 `(sum+2)>>2`）。
- `kernels/sa8d/sve_guard.cpp`：guard-page 精确边界测试（stride 16/17 ×
  offset 0/1/3/7，footprint 末端紧贴 PROT_NONE 页）。
- `scripts/build-sve-sa8d.sh`：生成/编译/计数/验证 4 个候选（single/x2/
  x2raw/16x16），输出构建身份（编译器版本 + object/binary SHA-256），
  运行 VL=512/256 差分与 guard。

## 3. 正确性证据

```text
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 20000   # VL=512
cases=20000 mismatches=0
x2_cases=20000 mismatches=0
x2raw_cases=20000 mismatches=0
16x16_cases=20000 mismatches=0
qemu-aarch64 -cpu max,sve-max-vq=2 build/sve_verify 20000   # VL=256
vl-bytes=32
cases=20000 mismatches=0
x2_cases=20000 mismatches=0
x2raw_cases=20000 mismatches=0
16x16_cases=20000 mismatches=0
qemu-aarch64 -cpu max,sve-max-vq=2 build/sve_guard
guard_cases=8 fails=0
```

原始输出：`correctness/qemu-vl256-512-20k.log`。

## 4. 静态与身份

- single 117 / 101 SIMD；x2 125 / 103；x2raw 116 / 101；16x16 wrapper
  23（两次 raw 调用 + 标量舍入）。
- 编译器 GCC 13.3.0，object/binary SHA-256 见
  `static/identity.txt`（满足 V0 身份要求）。

## 5. 性能状态

`blocked-environment`：N1 无 SVE；鲲鹏 920B（SVE v1、默认 VL=256、2×256
pipe）已探测可用但工具链未安装，实机 PMU 待环境接入。

## 6. 下一轮最有信息量的一个实验

按 round-0004 建议执行剩余门禁：VL=256 一百万例差分、VL=512 二十万例、
vq=1 预期失败记录（证明 dispatch 必须拒绝 VL<256）、ASan/UBSan，然后在
920B 上做 SVE256 实机差分 + PMU instructions/cycles，按保留门槛（>10%）
验收。之后冻结 SVE 静态候选并转向 N1 可测的 DCT8/interp8。

## 产物索引

- `generated/sa8d/sve_roundtrip_sa8d_16x16.cpp`
- `kernels/sa8d/sve_guard.cpp`
- `correctness/qemu-vl256-512-20k.log`、`static/*.txt`
- `kunpeng920b-environment.txt`（920B 环境探测）
