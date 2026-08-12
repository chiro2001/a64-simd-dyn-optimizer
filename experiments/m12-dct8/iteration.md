# M12-DCT8：DCT8 首轮闭环（tier a：NEON→NEON）

- run-id: `m12-dct8`
- state: `in-progress`
- date: 2026-08-13（Asia/Shanghai）
- hosts: ARM N1（`chiro@129.146.162.16`，NEON 4×128，无 SVE）与
  鲲鹏 920B（`chiro@124.70.206.229`，NEON 4×128 / SVE 2×256，无 PMU）

## 1. 为什么是 DCT8（用户输入，2026-08-13）

用户确认：内部测试里 DCT 算子相对开源基线的优化空间很大，鲲鹏上的内部
实现可比开源 x265 提升 **30%–60%**。因此 DCT8 是当前最有信息量的算子，
也直接对齐三档目标里的 **tier a（NEON→NEON，+30%）**；N1 与 920B 的
NEON 都是 4×128，两处都要跑 a 档闭环（920B 无硬件 PMU，cycles 用
CNTVCT_EL0 口径）。

## 2. 本轮试图证伪什么

1. 上游 `dct8_neon` 能否被独立差分验证器（自带 bit-exact 标量 oracle）
   复现（证伪"提取的 kernel 无法脱离 x265 独立验证"）；
2. N1 与 920B 上 c==neon、cand==neon 的同一二进制差分；
3. paired cycles 基线（neon vs c/empty），建立优化前的 a 档基线。

## 2b. 上游 NEON 与 C 参考的关系（2026-08-13 已定合同）

用户判定标准：**以开源 kernel 能否通过 x265 内部测试为准**。实测：

- `build/x265-8-gcc/test/TestBench --cpuid NEON --testbench transforms
  --nobench` **通过**（transforms harness 对 dct4/8/16/32 逐原语 memcmp，
  128 次迭代，无 `dct8x8 failed`，exit 0）；
- 但我们的全范围差分（[-255,255] 随机 20 万例）显示上游 `dct8_neon` 与
  `dct8_c` 在 **~0.87%** 输入上不一致（stride 无关、均匀分布；差异都是
  64 的倍数，集中在奇数列 k=1/3/5/7 的 j=5/6/7 行）。上游 128 次 smoke
  test 打不到这些输入；
- **本项目合同**：候选以 **C 参考（自备 oracle）为 bit-exact 基准**（更强、
  且保证 ARM/x86 跨平台一致）；上游 NEON 的 0.87% 分歧作为已知发现记录，
  不作为门禁失败。c==neon 在 dct8 上因此降级为分歧率报告。

## 3. kernel 形态（pinned x265 `b81f650`）

- C oracle：`dct8_c`（`common/dct.cpp`）→ `partialButterfly8` 两 pass
  （shift_1st=2、shift_2nd=9，8-bit），`g_t8[8][8]` 常量；
- NEON baseline：`dct8_neon`（`common/aarch64/dct-prim.cpp:2066`），
  输入逐行 `memcpy` + `partialButterfly8_neon<shift>`；
- NEON 指令形态：`ld1/rev64/addl/sub/zip1/zip2/vaddq/vmulq/vpaddq/vmull/
  vrshrn/st1`——含 widening multiply、rounding narrow、pairwise add，
  **当前 LLVM IR importer 尚不支持的 opcode 家族**（见 §6 gap）。

## 4. 门禁与结果（回填）

| 门禁 | 命令 | N1 | 920B |
| --- | --- | --- | --- |
| 独立差分 | `build/dct8_verify 200000`（oracle==C 必过；NEON 分歧率 ~0.87% 记录） | 待跑 | 已跑 |
| 上游 TestBench | `TestBench --cpuid NEON --testbench transforms --nobench` | 待跑 | 通过（exit 0） |
| cand==C | `dct8_microbench 8x8 cand latency 1 1 --verify-only` | 候选就绪后 | 候选就绪后 |
| paired cycles 基线 | `scripts/run-pmu-sa8d-paired.sh build/dct8_microbench 8x8 10 3 4096 ...` | 待跑 | 待跑 |

## 5. 目标与口径

- tier a：NEON→NEON，N1 与 920B 均实机 paired cycles，speedup >1.30 保留、
  >=1.30 优秀（docs/09 v0.4 三档）；用户内部参考为 +30%–60%，说明上游
  NEON DCT8 有可观余量；
- 指令数口径：`simd_insns + load_insns`（互斥分类），向量 load 不双计；
- 920B 无 PMU：`metric_source=cntvct`，N+2 有 PMU 时换 cycles:u。

## 6. 已知 importer gap（下一轮扩展）

DCT8 需要 importer 增加：`vmull`（widening mul）、`vmulq`、`vpaddq`
（pairwise add）、`vrshrn`（rounding narrow）、`rev64/zip1/zip2`（已有
shuffle 类别可映射）、`st1`（store，当前 importer 无 store 节点）。
这是"不断优化自动识别工具"的顺路收获：从 SA8D 的 add/sub/abs/umax 子集
扩到 DCT 的 MAC/narrow 家族。
