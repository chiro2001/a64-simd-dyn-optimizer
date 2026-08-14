# Agent 交接上下文（2026-08-14 深夜，DCT32 4002 / 工具链闭环 / 未来方向）

本文件是上下文压缩后接手的执行 Agent 的**唯一必读**。开始前按 §7 快速
清单走一遍；不要凭对话记忆下结论，以仓库当前状态为准。

## 0. 当前状态（最新优先）

### 0.1 DCT32 best = 4002 fused_uop（黄金标准闭合）

| 指标 | 数值 |
| --- | ---: |
| fused_uop（QEMU VL=256 true-dynamic） | **4002** |
| vector raw / movprfx / stack / sg | 4466 / 464 / 387 / 0 |
| 相对上游 12710 | **0.315×** |
| 相对内部 fused_uop 4827 / fused_adj 4251 | **0.829× / 0.941×** |
| 20k 差分 legacy 签名 | 7268（0.0355%，阈值 22528）不变 |
| TestBenchLite dct32 | 5 seed 全 PASS |
| 固化 | `kernels/dct32/candidates/best_op_r16.{cpp,S}` |

生成组合（`layout_ir.dct32_v31_plan` + lowering）：
`legacy_ex=1, legacy_k4=1, slice_kind=zip, row_group=16,
k0_even_sve=1, k0_shared_mul=0, k0_merge8=1, k0_epack=1,
sdot_indexed=1, odd_from_k0packs=1, k2k4_from_packs=1`；
发射顺序默认 `k0,odd,k2,k4`；编译 `-O2 -std=c++11
-march=armv8.2-a+sve2 -fno-tree-pre`。

### 0.2 LLVM-MCA 三方预估（experiments/m33-mca-dct32/）

口径：QEMU 完整动态执行流（VL=256）去分支后喂
`llvm-mca -mcpu=neoverse-v2 -mattr=+sve2 -iterations=1`：

| kernel | 动态指令 | MCA cycles | uops |
| --- | ---: | ---: | ---: |
| 上游 dct32_sve | 13362 | **2608** | 15009 |
| 内部 dct32_sve256 | 5381 | **1048** | 5800 |
| 本项目 4002 | 5619 | **1109** | 5893 |

tsv110（鲲鹏 920 核心）模型**无 SVE 调度覆盖**（跳过 41%/80%），
不可用；neoverse-v2 是 LLVM 能给出的最好 SVE 近似。

### 0.3 920B 实机配对（experiments/m33-mca-dct32/paired-920b/）

上游 SVE1 vs best_sve1（旧 SVE1 变体，150 对 bootstrap95）：
latency 0.8625 [0.8533,0.8805]、throughput 0.8509 [0.8444,0.8756]
（sve/cand，<1 表示上游更快）——best_sve1 慢 ~16-17.5%，是早期
实现，未含 SVE2 优化。

### 0.4 环境

- 本地 x86：`aarch64-linux-gnu-g++ 16.1.0`、`qemu-aarch64 11.0.3`
  （`-cpu max,sve-max-vq=2` 即 VL=256）、clang 22（`llvm-mca`）、
  QEMU_LD_PREFIX=/usr/aarch64-linux-gnu；12 核。
- GitHub remote 已 push（main @ a004178）；N1 origin：
  chiro@129.146.162.16；920B（SVE1/VL=256，无 PMU，CNTVCT）：
  chiro@124.70.206.229（可能被启停）。
- 内存教训：大搜索（父进程 ~3GB + 8 worker COW）与 codex 咨询并发
  曾打满 swap 并 OOM 杀掉咨询；已加 `scripts/monitor-resources.sh`
  后台监控（默认 10s → build/resource-monitor.log，gitignored）；
  **大搜索与咨询错峰执行**。

## 1. 实际工作流（docs/23 是权威描述，这里给执行速记）

```text
manifest 布局轴(笛卡尔积+layout_prune) → search_sve2_layouts.py
  → 每候选: op DAG(lower_plan_to_ops) → 发射器(emit_from_plan)
  → 编译(-O2 -fno-tree-pre) → 2 级差分(2k→20k, legacy 门≤22528)
  → QEMU true-dynamic trace(流式) → results.json 排名
  → 手工固化 best_op_r16 / TestBenchLite 5 seed
```

关键命令：

```sh
# 全布局搜索（op 后端跳过无效轴；608 候选约 8-12 min）
python3 tools/search_sve2_layouts.py --backend op --kernel dct32 \
  --workers 8 --skip-axes layout,odd_lowering,narrow_batch,constant_layout \
  --outdir experiments/m30-dct32-search/<tag>
# 单候选验证 + trace
qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 <verify> 20000
python3 - <<'PY'  # 或直接 tools 里的 true_dynamic()
from search_sve2_layouts import true_dynamic, symbol_range
PY
# lite 门禁
scripts/build-testbench-lite.sh <obj> build/x265-8-testbench \
  -- --gate dct32 --seed 0x12345678
# 生成 4002 候选（复现）
cd optimizer/ir && python3 -c "from layout_ir import dct32_v31_plan; \
from dct32_op_emit import emit_from_plan; p=dct32_v31_plan(); \
p.lowering.update({...}); open('/tmp/x.cpp','w').write(emit_from_plan(p,'dynopt_dct32_sve2_shared'))"
```

## 2. 成功技术（按收益排序，均可复用/迁移）

1. **row_group=16 + narrow16_merged**（-896 级）：odd/k2/k4 四 bank
   合并为 16-lane 存储；`2×uzp1_s32 + 2×rshrnb + uzp1_s16(a,b)`
   直接拼接偶 lane（替代 tbl2 常量）。坑：IR 与发射器的 g 循环都要
   `32//row_group`（曾越界 segfault）；k4 tbl2 切片与连续行不兼容，
   row16 归一化为 zip。
2. **k0_epack（pass1 专用）**（-192）：先按行算 E16=lo+rev(hi)
   （复用 leaf 的 e16！），单次 pack(E16) + 单个 saddlb/lt 项。
   **pass2 禁止**（E 回绕 → lite FAIL）。
3. **k0 先发射（emit_order）**（-70）：leaf→k0→odd/k2/k4 缩短
   lo/hi live-range，spill 大降。发射顺序已参数化（`emit_order`）。
4. **sdot_indexed**（-168）：SVE1 indexed SDOT
   `svdot_lane_s64(zero64, data, c, idx)`；常量两 k 打包进一个
   16-lane 向量 `[kA c0..3, kB c0..3, kA c0..3, kB c0..3]`
   （idx 每 128-bit 段选同一 64-bit 组，探针 probe_sdot_lane 实证；
   **SDOT 是 SVE1，不是 SVE2**）。ld1h 450→282。
5. **odd_from_k0packs**（-34）：k0 的 pack(hi) 换成 pack(rv)
   （e 链配对 H3≡R0/H0≡R3r/H2≡R1/H1≡R2r 等价），odd 切片 = L−R
   （X2/X3 需 revh 还原）。
6. **k2k4_from_packs（pass1+pass2）**（-246/-232）：E16-pack 切片
   t0=(L0+R0),t1,t2,t3；k2 EX0=t0−t3/EX1=t1−t2；
   k4 Xk4=(t0+t3)−revh(t1+t2)；pass1 用 E-pack 切片、pass2 用 L/R
   pack；**leaf 的 eo16/ee16/eeo16 链整体 DCE**。
7. **搜索发现非显然交互**：k0_shared_mul 在 4514 时代由负转正，
   在 4002 时代又转负（与 pass1 共享交互）——**不要手工预设轴
   好坏，让搜索裁决**。
8. **工具改进**：`--workers`（4-5 饱和）、`--skip-axes`（24k→768
   组合）、`layout_prune`、两级差分（2k 前缀）、流式 trace、
   `--outdir` 隔离、verify_cache 复用。

## 3. 关键阴性结果（勿重复）

- **k0_even_sdot（全 s16）**：两阶段仿真 1.34% 回绕 > 0.11% 门禁，
  lite FAIL；对称行（k0 族）在 pass2 必回绕，内部参考的 k0 也是
  s32 精确（docs/20 §6.4）。
- **E-pack pass2**：20k 随机零失配但 lite 5 seed 全 FAIL（结构化
  输入命中 E 回绕）；探针加了 wrap 量化（20k 随机 max|E|=22995
  不回绕，但 harness 分布会）。
- **k4_fold_rev8 常量折叠**：rev8 跨 s64-lane 组，逐 lane 常量不可
  表达（23.4% 失配，docs/20 §6.9）。
- **切片级 rev8 替换**：slice(rev8) 取 j4..7 数据，非切片内置换
  （probe_k4_slice）。
- **per-pass row_group 混合**（16/8、8/16）：均更差。
- **clang 22 后端**（5292 vs GCC 4682）、**g 循环 unroll**（4991）、
  GCC 调度标志（无差异）。
- **tsv110 MCA**：无 SVE 调度覆盖，跳过 41%/80%，不可用。
- **gather/scatter**：当前禁（SVE ld/st 拆多 uops）；**用户已表示
  后续会“一定程度放开”**——届时把 `+3×sg` 的 uop 口径改为按实际
  拆分数建模（见 §5）。

## 4. 探针资产（experiments/m31-dct32-k0-sdot/，均 VL=256）

- `probe_sdot_lane.cpp`：indexed SDOT 语义（idx 每段选同一 64-bit
  组）+ GCC 支持确认。
- `probe_odd_from_packs.cpp`：pack(rv) 等价配对 + L−R 切片。
- `probe_k2k4_from_packs.cpp`：k2/k4 切片派生恒等式。
- `probe_k0_epack.cpp`：E-pack 两阶段 + 结构化输入回归 + wrap 量化。
- `probe_odd_slice.cpp` / `probe_k4_slice.cpp` / `lane_probe.cpp`：
  lane 语义基础。

## 5. 未来方向（用户已确认，纳入计划）

1. **MCA cycle 纳入搜索**：把 llvm-mca（动态流或静态体，neoverse-v2）
   作为第二代理接入排名/剪枝（现在只手工跑；`search_rewrite_sequences`
   曾有 mca 字段可复用）。注意 MCA 输入应统一为“完整动态流”口径
   （上游全展开 vs 我们带循环，静态体不可比）。
2. **gather/scatter 适度放开**：把 scatter 的 uop 拆分数（按
   ld1d/st1d 的 64-bit 组数）建模进 fused_uop 口径，替代现在的
   “禁止 + 单列 SG”。放开后内部算子的 st1d（192 条）策略可复刻。
3. **自定义 llvm-mca target**：给鲲鹏 920/920G 建调度模型（当前
   tsv110 无 SVE）；或至少在 LLVM SchedulingModel 里补 SVE 指令
   延迟/吞吐，用实机（920B CNTVCT paired / 920G 内部）校准。
4. **实机路径**：920B 只能跑 SVE1（NEON tier-a 验收可用）；
   **倚天710 是 SVE2 但 VL=128**，本项目 op 后端候选固定 VL=256，
   不能直接跑（需 VL-agnostic 变体或 920G/960）。hip12（920C/G，
   SVE2 4×128/2×256）若有访问，是最佳 SVE2 实机。
5. **DCT16/其他算子迁移**：把 row16/narrow16/emit_order/
   sdot_indexed/pack 共享的洞察按 dct16_op_ir.py 的结构移植。

## 6. 咨询节奏

- docs/06：每 3 个实际迭代 1 次，后台
  `codex -p sss -c 'model="gpt-5.6-sol"' -c
  'model_reasoning_effort="max"' -s workspace-write -C "$PWD" exec -o
  expert-advice/round-NNNN/response.md - < prompt.md`，只写 round
  目录；**不要用 dsv4pro**。
- round-0015/0016 均因咨询超时或 OOM 未出 response（已按 docs/06
  截断补录 response/decision）；下次与搜索错峰、严格控制 prompt
  范围（避免模型无限深挖文件）。

## 7. 接手快速清单

1. `git status -uno --short --branch` + `git log --oneline -5`；
2. 读 `docs/20-dct32-optimization-assessment.md` §6.10–§6.13、
   `docs/24-dct32-pass2-shared-pack.md`、`kernels/dct32/manifest.yaml`；
3. 复现 4002：见 §0.1 组合（或直接取
   `kernels/dct32/candidates/best_op_r16.cpp`）；
4. 验门禁：20k 差分 7268 + lite 5 seed；
5. 下一主项按 §5 优先级（MCA 入搜索 / scatter 建模 / 自定义 target /
   920G 实机）。
