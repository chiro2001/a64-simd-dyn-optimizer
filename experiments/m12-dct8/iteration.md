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
| 独立差分 | `build/dct8_verify 200000`（oracle==C 必过；NEON 分歧率 ~0.87% 记录） | 已跑（1733/200000，oracle==C 0） | 已跑（同左） |
| 上游 TestBench | `TestBench --cpuid NEON --testbench transforms --nobench` | 未跑（920B 已证） | 通过（exit 0） |
| cand==C（widened） | `dct8_microbench_widen 8x8 cand latency 1 1 --verify-only` | 通过（20k） | 通过（20k） |
| paired 基线 neon-vs-c | cntvct latency | **0.807×** | **0.961×** |
| paired widened-vs-neon | cntvct latency（M14） | **0.891×** | **0.981×** |

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

## 7. M27：DCT8 SVE2 backend 打通并 bit-exact（2026-08-13）

新增 `optimizer/ir/codegen.py::emit_dct8_sve2_intrinsics()`：在固定
VL=256 下把 DCT8 seed MachineIR 直接降到 SVE2 ACLE。本地 qemu-aarch64
（`-cpu max`）200k 例、四种 stride（8/16/17/32）、输入统一 [-255,255]：

- `candidate_mismatches = 0`（cand 与自备 C oracle 完全一致）；
- `candidate_vs_neon_mismatches = 1803`，与"上游 NEON vs C"的 1803 例
  完全重合——即候选只在上游 NEON 自身就与 C 分歧的已知输入上与其不同，
  候选与 C 严格一致；
- 验证器新增 `DYNOPT_SVE_VL=32`（字节）编译开关，二进制启动时
  `prctl(PR_SVE_SET_VL)` 固定 VL=256bit，qemu-user 与 Linux 同语义。

本轮修复的 SVE lane 语义（对后续所有 SVE codegen 都适用，与早期笔记
不一致的地方以本节为准）：

1. **`svtbl2` 索引空间是整寄存器宽度**：VL=256 时 `svcreate2_s32(a,b)`
   的 tuple 是 `[a0..a7, b0..b7]`（16 个 s32 lane），不是 4+4。NEON 4 宽
   mask 条目 `m>=4` 选 b 时，SVE 索引必须写 `8+(m-4)`（s16 则为
   `16+(m-4)`）。`_dct8_sve_tbl()` 已按此映射。
2. **SVE2 有非饱和 rounding narrow**：`svrshrnb_n_s32` /
   `svrshrnt_n_s32` 存在，语义即 NEON `vrshrn_n_s32`（(x+(1<<(s-1)))>>s）。
   早期笔记"无 RSHRNB/RSHRNT ACLE、需手工 add+shrn"是错的，已改回
   原生指令（每个 rshrn 少 1 条 add）。
3. **`svshrnt_n_s32(even, src, imm)` 的 odd lane 来自 src 的全部 s32
   lane**（不是仅 top half）：even lane 保留 `even` 操作数，odd lane =
   逐个 narrow(src 全部 lane)。因此 `svrshrnb` 填偶数 lane（bottom 4 个
   s32 的 rounding narrow），`svrshrnt` 把同 4 个值填进奇数 lane，最终
   布局 `[n0,n0,n1,n1,n2,n2,n3,n3,...]`，`svtbl {0,2,4,6}` 压回
   `[n0,n1,n2,n3]`。
4. `svaddp_s32_x(p, a, b)` = `[a0+a1, b0+b1, a2+a3, b2+b3]`，需
   `svtbl {0,2,1,3}` 才等于 NEON `vpaddq`。

静态指令数（直接 lowering，未做 pack-2 平铺/搜索）：

| 形态 | 向量调用点 | load | store |
| --- | --- | --- | --- |
| NEON seed（`emit_dct8_c_intrinsics`） | 308 | 44 | 16 |
| SVE2 直降（widen 后） | 520 | — | — |

当前 SVE2 直降只是正确性基座：单 tile 占 4/16 lane，smull→
unpk+unpk+mul、shuffle→create+tbl、rshrn→rshrnb+rshrnt+tbl 都有膨胀。
下一轮把 2 个 8×8 tile 平铺进一个 SVE256 寄存器（pack-2），并让搜索在
重排/tree_to_mla/宽加载目录上枚举，才是 b/c 档"指令数减半起步"的路径；
实测性能待 N+2（960，SVE2.3 4×256）环境接入，920B 无 SVE2 只能跑 SVE1
子集。

## 8. M28：DCT8 双 tile SVE256 pack（x2）——C-exact + 静态口径
（2026-08-13）

新增 `kernels/dct8/dct8x2_sve2.cpp`：把两个**水平相邻** 8×8 tile 打进
一个固定 VL=256 的 SVE 寄存器（tile A 低半、tile B 高半），每个 elementwise
op 同时算两块，无跨 tile shuffle。接口合同：

- `srcStride >= 16` s16，tile A = 每行第 0–7 列、tile B = 第 8–15 列；
- 最终输出 `dst` 连续 128 个 s16：`dstA = dst[0..63]`、
  `dstB = dst[64..127]`；
- pass1 中间 buffer 用 16 宽交错行 `[A 行, B 行]`（模板参数
  `ROW_STRIDE/B_OFF`），pass2 以 stride 16 消费；
- 入口前 `prctl(PR_SVE_SET_VL, 32)`（字节）。

正确性：`kernels/dct8/dct8x2_verify.cpp` 对自备 C oracle 逐 tile 差分，
输入统一 [-255,255]、stride {16,17,32}：

```text
qemu-aarch64 -cpu max build/dct8x2_verify 200000
cases=200000 mismatches=0
```

结构：stage-1 用 `svaddlb/svsublb`（widening，消除 pass2 的 s16 wrap，即
上游 0.87% 分歧根因）；odd 列按 proto_b（M15）做 4×4 转置 + 4 深
`svmla_s32_x` 链；even 列保持上游 mul+addp 结构。乘法用无谓词 3 寄存器
`MUL`（inline asm）避免 ACLE 破坏式 `svmul` 的 60 个 `movprfx`。

静态指令（`-O2 -march=armv8.2-a+sve2`，objdump 全函数）：

| 形态 | 指令数（2 tile / 两次 pass） | 每 tile |
| --- | ---: | ---: |
| 上游 `dct8_neon`（非 C-exact，341 条） | — | 341 |
| x2 SVE256（本候选，C-exact） | 598 | 299 |

每 tile 299 vs 上游 341 ≈ **1.14x**，远低于"宽度倍增→指令减半"的直觉。
原因已逐项定位：SVE2 的 `svaddp` 交错语义需要 `svtbl` 修复、窄化
`svrshrnb/svrshrnt` 结果交叠需要第三次 `svtbl`（每输出 3 条 vs NEON
`vrshrn` 1 条）、以及 GCC 对 `pg4hi`（非前缀谓词）store 的寻址开销。
结论：**DCT8 的 pairwise-add/narrow 结构对 SVE256 宽度倍增不友好，单靠
双 tile pack 只能到 ~1.1–1.3x**；b/c 档 +130% 需要新整数分解、pass 间
布局消除或 DCT→quant 融合，这是给搜索器和 N+2 阶段的明确结构边界。

调试中修正/确认的 SVE 语义（对后续所有 codegen 有效）：

1. `svwhilelt_b16(a, b)` 是 `(a + lane) < b`，`whilelt(4,8)` 选 lane 0–3，
   不是 4–7；lane 4–7 要用 `svbic(svptrue, whilelt(0,8), whilelt(0,4))`。
2. `svst1` 按活动 lane 编号偏移基址：`pg4hi`（lane 4–7）写
   `base+4..7` 个元素，B 半 store 的基址要减 4。
3. `svtbl2` 索引空间是整寄存器宽：VL=256 时 tuple 为 16 个 s32 lane，
   B 寄存器从 8 开始（qemu 默认 VL=64 字节时是 32，探针必须先定 VL）。
4. `svrshrnb` 把 bottom 4 个 s32 放偶数 s16 lane、top 4 个放偶数 lane
   8–15；`svrshrnt` 把全部 8 个 s32 放奇数 lane，最终交叠布局
   `[n0,n0,n1,n1,...]` 用 `svtbl {0,2,4,6,9,11,13,15}` 压回 8 个连续值。
5. GCC/clang 均未暴露 SVE2 的 16-bit-offset s16 gather（`LD1H`），stage-1
   的 lo/hi 拆分仍用 `ld1h + svtbl`。

依据 round-0007 专家建议（`expert-advice/round-0007/decision.md`）：
本候选属于"双块 pack 静态准备"交付，不做进一步 SVE2 性能调优；拿到
N+2（960）实机或确认合法连续多块调用点后再进入完整 codegen/搜索。
