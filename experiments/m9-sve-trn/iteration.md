# M9-SVE-TRN：typed TRN lowering + raw half-R8 x2 helper

- run-id: `m9-sve-trn`
- state: `blocked-environment`（功能 + 静态指令证据；性能必须等真实
  SVE2 VL=256 硬件）
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`（aarch64 编译）+ `qemu-aarch64 -cpu max,sve-max-vq=2/4`

## 1. 本轮试图证伪什么

round-0003 建议：MachineIR 的 24 个 shuffle 恰好是 i16/i32/i64 三种粒度的
`TRN1/TRN2`，直接 lowering 为 SVE `svtrn1/2_*` 可删除全部索引装载与索引
计算。本轮证伪“typed TRN 会破坏 lane 语义或无法保持打包正确性”，并同时
验证 raw half-R8 x2 helper（两块未舍入半和，供 16x16 统一舍入）。

## 2. 什么变了

- `optimizer/ir/codegen.py`：
  - 新增 `_sve_trn_spec()`：识别六种 `TRN1/TRN2` mask（i16/i32/i64），
    直接生成 `svtrn1/2_u16/u32/u64`（u32/u64 经零成本 reinterpret）；
  - SVE TRN 在全向量上按元素粒度交错，VL=256 时低 16 lane 的两个 8-lane
    tile 独立变换，天然等价于此前 tbl2 索引数组；
  - 未知 mask 保留 `svtbl2` 回退；
  - 新增 `raw=True`：pack=2 时归约尾部跳过 `+1 >> 1`，直接返回两块
    half-R8 之和（`p_a + p_b`）。
- `kernels/sa8d/gen_roundtrip.py`：新增 `--raw`（要求 `--pack x2`），
  函数名 `dynopt_sa8d_8x8x2raw_neon_sve2`。
- `kernels/sa8d/sve_verify.cpp`：抽出 `sa8d8_raw()`（完整 R8），新增
  x2raw oracle：期望值 `(R8_A + R8_B) / 2`（先断言 R8 之和为偶数）。
- `scripts/build-sve-sa8d.sh`：生成/编译/计数/验证三个候选。

## 3. 正确性证据

```text
qemu-aarch64 -cpu max,sve-max-vq=2 build/sve_verify 100000   # VL=256
cases=100000 mismatches=0
x2_cases=100000 mismatches=0
x2raw_cases=100000 mismatches=0
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 100000   # VL=512
cases=100000 mismatches=0
x2_cases=100000 mismatches=0
x2raw_cases=100000 mismatches=0
```

原始输出：`correctness/vl256-512-qemu-100k.log`。

## 4. 静态指令证据（-O2 编译产物）

| 候选 | total | SIMD | 对应工作 | 每 tile total | 每 tile SIMD |
|---|---:|---:|---|---:|---:|
| single-tile | 117 | 101 | 1 × 8x8 | 117 | 101 |
| two-tile pack | 125 | 103 | 2 × 8x8 | 62.5 | 51.5 |
| two-tile raw | 116 | 101 | 2 × 8x8 | 58 | 50.5 |

相对 M8 的每 tile 数值（148.5 total / 112.5 SIMD）：

- x2 pack：total -58%，SIMD -54%；
- x2 raw：total -61%，SIMD -55%；
- 相对 single-tile：x2 raw 每 tile total -50%。

明细见 `static/sve1-insns.txt`、`sve2-insns.txt`、`sve3-insns.txt`。
`ld1h/mad/adrp/tbl` 索引机制全部消失，仅剩 12×`trn1` + 12×`trn2`。

## 5. 性能状态

`blocked-environment`：N1 无 SVE，性能必须等真实 SVE2 VL=256 硬件。静态
指令是早期筛选代理，不宣称周期/吞吐收益。

## 6. 下一轮最有信息量的一个实验

把两次 x2raw 调用组合成合法 16x16：顶部两 tile 一个 raw wave、底部两
tile 一个 raw wave，累加后统一 `(sum + 1) >> 1`，与 `sa8d16x16` 差分；
同时补零号门禁（guard-page/ASan、实际 `svcntb()` 日志、QEMU guest 动态
指令计数、生产 flags 最终 linked symbol 与 spill/峰值 live Z/P）。之后按
round-0003 结论冻结 M6 为 `blocked-environment`，转向可由 N1 实测的
DCT8/interp8（未 profile 时默认 DCT8）。

## 产物索引

- `generated/sa8d/sve_roundtrip_sa8d_8x8.cpp`
- `generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp`
- `generated/sa8d/sve_roundtrip_sa8d_8x8x2raw.cpp`
- `correctness/vl256-512-qemu-100k.log`、`static/*.txt`
