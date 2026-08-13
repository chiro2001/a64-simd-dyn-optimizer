# SA8D 优化空间评估（2026-08-14）

问题：用当前工具链看 SA8D，相比开源方案还有没有更好的优化？

## 1. 实测基线（QEMU，VL=256，true-dynamic，单次调用）

| 实现 | total | vector | fused_adj | 说明 |
| --- | ---: | ---: | ---: | ---: |
| 开源 NEON sa8d8（M0 实测） | ~116 | — | — | 每调用动态指令 |
| **开源 SVE2 `sa8d8_sve2<8,8>`** | **111** | **97** | **97** | 本次实测 |
| 开源 SVE2 `sa8d16_sve2<16,16>` | 423 | 373 | 373 | 本次实测（4×8x8+封装） |
| 项目候选 single（8x8） | 117 | 101 | 101 | roundtrip 生成 |
| 项目候选 two-tile（8x8x2） | 125 | 103 | 103 | 16-lane 尝试 |
| 项目候选 8x8x2raw | 116 | 101 | 101 | |

项目 4 个 SVE2 候选均通过 2 万例差分（0 分歧），但指令数**均未超过
开源 SVE2**（111）——M0 时代的 roundtrip 候选没有用上 DCT16 迭代的
优化经验。

## 2. 开源 SVE2 实现的结构（pixel-prim-sve2.cpp）

8x8 核心：`load_diff_u8x8x8`（8 行 × 8 像素，u8→s16）+ 3 级
`x265_caddq_s16<90>`（CADD 复加）+ 2 次 `vqtbl1q_s16` 重排 +
sumsub/abssumsub + umax/add + `udot` 归约。**所有操作都是 128-bit
NEON 视图**（每指令只处理一行 8 像素），仅借用了 SVE2 指令（cadd/udot）。

指令构成（8x8）：cadd 24、tbl 16、ldr 17、usubl 8、add 10、sub 4、
abs/sabd/umax 各 4、udot 2、misc 8。

## 3. 优化空间（结论：有，且不小）

1. **真 256-bit 化**：VL=256 一个寄存器可放两行（16 像素）。核心
   butterfly 的 cadd/tbl 可减半（24→12、16→8），diff 加载与归约同步
   变宽。静态估算 8x8：111 → **~75-85**（相对开源 -25%~-30%）。
2. **去掉 tbl**：用 DCT16 已验证的 zip1/zip2.d + revh 布局替代
   `vqtbl1` 重排（tbl 16→0，代价少量 zip），并可复用 pass1_even_factor
   式因子化思路。
3. 项目 two-tile 候选（16-lane）失败的原因是打包开销吃掉了收益
   （125 > 111）——这正是我们的搜索轴/uop 指标能系统优化的对象
   （行打包、重排方案、归约形态各设轴）。

## 4. 建议

- 把 SA8D 接入现有 search pipeline（manifest + 发射器轴：行打包
  single/two/raw、重排 zip-vs-tbl、归约/存储形态），正确性门 = 现有
  sve_verify 2 万例差分，指标门 = fused_uop（8x8 < 97 即超越开源）。
- 优先级：在 DCT16 已达成指标、960 未流片的空档，SA8D 是下一个
  收益明确（-25%~-30%）的工具链扩展目标。

## 5. 首轮 pair=2 候选结果（2026-08-13）

`tools/emit_sa8d_sve2_shared.py --pack 2` 生成的 `sve2_pair`：
两行/寄存器（16-lane）跑行内 Hadamard，cadd/tbl 减半
（24→12、16→8），之后仍用上游 128-bit 归约（upstream-exact）。

| 版本 | fused_adj | sg | fused_uop | 验证 |
| --- | ---: | ---: | ---: | --- |
| 开源 SVE2 sa8d8（基线） | 97 | 0 | 97 | x265 自带 |
| pair 循环版（diff[] 数组） | 98 | 0 | 98 | 2 万例差分 0 |
| **pair 手写展开版** | **86** | 0 | **86** | 2 万例差分 0 + 5000 例上游逐位 0 |

## 5b. 搜索轴扩展后的结果（2026-08-13，第二轮）

SA8D 已接入 `search_sve2_layouts.py`（manifest + `gen_verify` 的 sa8d
shape），新增两个发射器轴：

- `pack`：`pair`（[r0|r1]…）或 `evenpair`（[r0|r2],[r1|r3]…，级 1 列
  Hadamard 变成免费的 lane-wise add/sub）；
- `reduce`：`neon`（提取 8 行走上游 128-bit 归约）或 `sve`
  （全 SVE 列变换：TBL2 重打包 + 半区旋转 max + unpklo/addv 归约）。

| 组合 | fused_uop | 2 万例差分 |
| --- | ---: | --- |
| pack=pair, reduce=neon（上轮 best） | 86 | 0 |
| pack=evenpair, reduce=neon | 86 | 0 |
| pack=pair, reduce=sve | 84 | 0 |
| **pack=evenpair, reduce=sve（本轮 best）** | **79** | 0 |

- 相对开源 SVE2（97）**-18.6%**；`TestBenchLite --gate sa8d` PASS。
- **ISA 级别核查（2026-08-13）**：best 汇编只用 SVE1+SVE2
  （SVE2 独有：cadd、TBL2、uunpklo），编译目标 `-march=armv8.2-a+sve2`，
  **无 SVE2p3 指令**；因此 920B（SVE1）不能跑，需 SVE2 平台（960/920G）。
- 两个 SVE 归约变体的调试教训：`svdot_u64` 是累加指令，初值不能给
  `svundef`；`svtbl2` 的参数是 `svcreate2` 二元组；S 寄存器两半区重复
  同一 lane 和，归约只能取低 8 lane（unpklo+uaddv）。

## 5c. 16x16：SVE256 的结构性主场（2026-08-13，第三轮）

**验收口径（用户决策）**：开源 sa8d 是 128-bit 算法，SVE256 只有在
计算指令数真正减半时才有收益（不是 97→79 这种 -18.6%）。8x8 的 8 像素
行只是半个 256-bit 寄存器，打包（8×SEL）+ 拆半（4×TBL）+ TBL2 重排 +
半区旋转 max 是固有开销，难突破；**16x16 的 16 像素行天然等于一个
16-lane 寄存器，以上开销全部消失**。

新发射器 `emit_16x16`（VL=256）：
- 每行一次无谓词 16 字节 load（32 次 load + 16 次 16-lane sub）；
- 行 H：16 行 × (3 cadd + 2 tbl)，左右 8x8 象限同时处理；
- 列 H：跨 16 个行寄存器 lane-wise（SUMSUB 8 组、ABSSUB 8 组、
  smax 8、add 4、累加 3），无 TBL2、无旋转；
- 归约：1×udot（16-lane，显式 0 初值）+ addv。

| 实现 | dynamic | vector | fused_uop | 验证 |
| --- | ---: | ---: | ---: | ---: |
| 开源 SVE2 sa8d16（128-bit） | 423 | 373 | 373 | x265 自带 |
| **工具生成 sa8d16（256-bit）** | **227** | **193** | **189** | 2 万例差分 0 |

- 相对上游 **-49.3%**（vector 373→193，fused 373→189），达到“真减半”
  口径；`TestBenchLite --gate sa8d16` PASS。
- 约束：stride ≥ 16（一行正好 16 字节）；8x8 候选 79 仍保留为
  BLOCK_8x8 槽位用，16x16 是 BLOCK_16x16 槽位的主推形态。

- 展开版比开源少 **11 个 fused_uop（-11.3%）**，进入 docs §3 预估的
  ~75-85 区间上沿。
- 正确性：`kernels/sa8d/candidates/sve2_pair.o` 通过 2 万例差分
  （标量 oracle `((sum>>1)+1)>>1`）和 5000 例与开源
  `hadamard_8x8` 中间/最终值逐位对比；`TestBenchLite --gate sa8d`
  （复用 x265 PixelHarness + 从 pixel.cpp 原样搬来的 C 参照，ITERS=100）
  **PASS**。
- **验收口径（用户决策 2026-08-13）：SA8D 过 lite 即可，不要求全量
  TestBench 注入**。全量 `--testbench pixel --nobench` 仅 DCT16 保留。

## 6. 本轮工具/流程教训（写进发射器与搜索 pipeline）

1. **QEMU 默认 VL 不是 256**：`qemu-aarch64 -cpu max` 默认 VL=512
   （svcntb=64），必须显式 `-cpu max,sve-max-vq=2`；本项目所有
   指标/差分都固定 VL=256。此前若干“奇数行全错”是 512 下的假象。
2. **谓词 ld1ub 按字节偏移寻址**：`svld1ub_u16(pg_hi, p)` 的活跃 lane k
   读 `p+k`（不是 `p+2k`）。要把某行像素 0..7 载入 lane 8..15，地址必须
   前移 8 字节：`svld1ub_u16(pg_hi, row_start - 8)`。
3. **GCC 16.1 会把“同一 SVE 寄存器上两次互补谓词 load”错误合并**
   （只发一条 load，谓词/地址错乱）。必须两个寄存器分别 load + `svsel`
   合并。
4. **循环里用 `diff[i]` 数组会导致 12 条额外向量 store/load**
   （stur q×8 + ldp q×4）：改手写展开 + 固定局部变量后，SVE↔NEON
   bridge 的 `svget_neonq` 是零指令，fused_uop 98→86。
