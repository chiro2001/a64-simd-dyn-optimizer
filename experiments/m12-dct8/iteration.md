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
