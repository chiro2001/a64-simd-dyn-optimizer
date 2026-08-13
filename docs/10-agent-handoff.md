# Agent 交接上下文（2026-08-14，M30 工具链完成）

本文件供上下文压缩后接手的执行 Agent 使用。开始前按“必读清单”读取下列
文件，并以仓库当前状态为准；不要凭对话记忆下结论。

## 0. 2026-08-14 交接状态（最新优先，接手先读）

### 0.1 当前 best 与验收

- **DCT32 op 后端 best = 4480 fused_uop**（vector 4940 / movprfx 460 /
  stack 520 / 零 scatter），相对上游 12710 = 0.352×，**低于内部参考
  4827 = 0.928×**（fused_adj 4251 口径 = 1.054×）。由 row16 合并
  存储 + k0_merge8 + k0 先发射 + pass1 专用 k0 E-pack +
  **indexed sdot 常量共享（sdot_indexed 轴）+ odd 切片复用 k0 pack
  （odd_from_k0packs 轴，pack(rv) 等价配对 + L−R 子）**达成
  （5390→4480，-16.9%），全布局搜索 416 候选确认（best 含
  k0_shared_mul=1，与 sdot_indexed 交互后由负转正），
  **TestBenchLite dct32 5 seed 全 PASS（黄金标准已闭合）**；
  k0_even_sdot 全 s16 方案被探针否决（docs/20 §6.4）；
  k0_shared_mul 在 row16 下反增 16（调度差异），k0_merge8 仅在
  shared=0 时净收益。

### 0.11 下一主项（2026-08-14 深夜更新）

- 设计文档已落盘：**docs/24-dct32-pass2-shared-pack.md**——pass2
  共享打包/转置换位（内部结构方向），预期 -250~-330（fused_adj 口径
  逼近内部 4251）。实现前必做探针已列明（s32 E 链共享派生、常量反转
  吸收、k2/k4 切片派生）。
- 本轮已完成的探针：`probe_odd_slice.cpp`（pack(O) q0/q1==X0/X1、
  q2r/q3r==revh(X2/X3)，可折进常量）；`probe_k4_slice.cpp`
  （slice(rev8) 非切片内置换，§6.9）；`probe_k0_epack.cpp`
  （E-pack 仅 pass1，§6.8）。
- 阴性：per-pass row_group 混合（16/8、8/16 均 >4682）、k4 常量折叠
  （数学不成立）、clang 后端（5292）、g 循环 unroll（4991）、GCC
  调度标志（无差异）——全部记录 docs/20 §6.9。
- DCT16 best 705（含 4 scatter）/ 零 scatter 895（超内部 731）。
- DCT32 rewrite 序列搜索（剪枝后）：781→219 计划键、31 唯一源，
  best `[legacy_k2, legacy_k4, merge_narrow8, k0_even_sve]` = 6322。

### 0.2 工具链（全部完成并验证，均已 push）

- **P0 并行搜索**：`search_sve2_layouts.py` / `search_rewrite_sequences.py`
  支持 `--workers N`（默认 1）。W=1/W=4 结果逐字段一致；dct16 布局搜索
  6:21→1:44（3.7×）。W-scan（dct32 31 源）：W=1/2/4/8/12 =
  118/74.5/53/47.7/45.3 s，~4-5 worker IO 饱和（8 worker 达不到 5×）。
- **P1.1 rewrite 依赖剪枝**：`prune_sequence()`（k2 必须先于 k4、
  merge_narrow8 至多一次、k0_even_sve 需 k2/k4 前置；dct16 tbl2/merge
  至多一次），全宇宙源码哈希覆盖审计 100%。
- **P1.3 两级差分**：`--short-cases 2000` → `--full-cases 20000`，
  `--no-short-gate` 关闭；同一 RNG 流前缀 → fail→pass=0 构造保证；
  short 失败行记 2k mismatch + `gate:"short"`。
- **P3 流式 trace**：`parse_qemu_trace.py --stream`（不物化指令列表），
  348 个真实日志（含 36 scatter）与旧 parser 零差异；`true_dynamic`
  默认 fast path。
- **专家咨询 round-0014** 已落盘（summary/tooling-roadmap/verification/
  decision），结论优先级 = 并行 → 剪枝 → 漏斗。

### 0.3 已否定的方向（别再重复）

- **const_inline**（dot/K0EVEN 常量内联到指令处）：GCC 对常量加载位置
  不敏感，计数完全不变（5390 相同）。
- **narrow_store_pred**（偶 lane 谓词直接 st1h 省 uzp1_s16）：**SVE
  连续谓词 ld/st 是 lane 索引映射、不压缩**（VL=256 探针实证：
  even4h 存储得到 `10,0,12,0,14,0,16,0`）；生成内核 k0 全零 + 全量
  差分段错误。`rshrnb`+`uzp1_s16` 是必要组合。想压缩只能 vector-offset
  scatter（用户已禁用）。
- 两个轴均已回滚；实验代码在 `git stash list`（
  “narrow_store_pred+const_inline WIP”）可查。

### 0.4 DCT32 差距分解与下一主项（docs/20 §6）

5390 vs 内部 4251（向量 raw）：sdot 1344 vs 1376（持平）；ld1h 736 vs
864；uzp1 592 vs 480；str 422 vs 192 st1d（+230，scatter 禁）；zip1/2
336/192 vs 152/152；rshrnb 288 vs 256；ldr 257 vs 0（GCC 常量栈
spill 重载，const_inline 已证无法消除）；tbl/trn/revh/mov ~+300；
mul+addp（k0 偶路径）64/64 vs 32/0。

**下一主项 = k0_even_sdot 轴**：s16 域重建 E 链（saddlb/saddlt 是
128-bit 段低半选择，s16 版用 `pg4h` 谓词等价、只是不加宽），
EEp/EOp 变 s16 后用 `K0EVEN` s16 双份切片 + sdot.d 同时算 4 行
2-term dot，替换 mul+addp+uzp1s。k0 语义已用数值探针确认：每行输出
`(c0*e0+c1*e1)>>4`，EEp 按行交错。
**重要坑：探针必须 `-cpu max,sve-max-vq=2`（VL=256）**，否则 lane
布局结论无效（本次在 VL=512 上拿错过数据）。实现顺序：独立数值探针
验证 s16 链分歧率 ~0.104%（legacy 合同 ≤0.11%）→ 并入 op DAG +
发射器 → 搜索验证（目标 5390→<5150）→ TestBenchLite。

### 0.5 环境与关键命令

- 本地 x86：交叉 g++ 16.1.0、qemu 11.0.3、`QEMU_LD_PREFIX=/usr/aarch64-linux-gnu`。
- 差分：`qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 <verify> 20000`
  （dct32 legacy 接受 mism ≤ 22528，实测 7268 = 0.0355%）。
- lite：`scripts/build-testbench-lite.sh <obj> build/x265-8-testbench -- --gate dct32 --seed 0x12345678`。
- 搜索：`python3 tools/search_sve2_layouts.py --backend op --kernel dct32 --workers 8 --outdir <dir>`
  （72 候选约 3 min）；`python3 tools/search_rewrite_sequences.py --kernel dct32 --workers 4 --outdir <dir>`。
- 920B：`chiro@124.70.206.229`（SVE1 无 SVE2，rshrnb 等跑不了；可能被
  用户启停）；N1 origin：`chiro@129.146.162.16`；GitHub 主 remote。
- 咨询：docs/06，每 3 个实际迭代 1 次，后台 `codex -p sss -c model="gpt-5.6-sol" ...`
  非阻塞，落盘 expert-advice/round-NNNN；不要用 dsv4pro。
- 信息安全：**严禁把 /tmp 下内部算子代码/反汇编入库**，只留 docs/18、
  docs/20 聚合指标。
- 无后台咨询在跑；你自己就是 codex，不要 kill 自己的进程树。

## 0.9 2026-08-13 历史状态（供追溯，已被 §0 取代）

- **DCT32 best（full-call fused_uop）**：op 后端 row8+legacy(k2/k4)+zip
  + **k0_even_sve** = **5814**（raw 6286，MCA 411 cyc/2231 uops，
  2026-08-13 晚新增，-10.1%）；纯 rewrite 序列 `[legacy_k2,
  legacy_k4, merge_narrow8, tbl2_to_zip]` 从基础 plan 重发现 6456；
  相对上游 12710 = 0.457×，距内部 4827 = **1.204×**。
- **k0_even_sve 机制**（docs/20 §5.12）：数值探针发现
  EEp=[P0,Q0,...]/EOp=[R0,S0,...]，k0 = addp(EEp/EOp×K0EVEN)；
  **s16 回绕坑**：E 必须 lo/hi 分 pack 在 s32 域成形
  （e0=saddlb(lo_q0,revh(hi_q3))+saddlb(lo_q3,hi_q0) 等），否则
  常量 ±255 输入在 pass2 回绕致 lite FAIL；RSHRNB 结果在偶 lane 需
  uzp1_s16 压缩。manifest 轴 `k0_even_sve`（要求 k2_slice+legacy_ex+
  legacy_k4）。
- **DCT16 全链完成**：op DAG + rewrite（tbl2_to_zip/merge_narrow8/
  legacy_even_sve）+ 参数化序列搜索（--kernel dct16），best 705
  fused_uop（超内部 731），零 scatter 895。
- **E1-B 达成**：`optimizer/ir/dct32_op_ir.py` + `dct32_op_emit.py`
  （-O2 -fno-tree-pre）不调用 grouped 块，8283 ≤ Go 8292，20k=0、lite PASS。
- **P0 完成**：op 级原子 rewrite 引擎（`dct32_rewrites.py`）：
  `tbl2_to_zip / legacy_k2 / legacy_k4 / merge_narrow8`；序列搜索
  `tools/search_rewrite_sequences.py`（625→341 唯一）自动重发现 6456；
  LLVM-MCA 第二代理（best 516 cycles / 2838 uops，排名与 fused 一致）。
- **已知关键坑（别再踩）**：full-call 指标（3962 只是 pass1）、WAW
  吞吐、`svlasta` 语义偏移（用 `svlastb`）、zip/trn lane 语义、
  EEO16 = rev16/rev8 映射、K4S 行 8k+4、op_id 跨 rewrite 冲突、
  `_parse_m` 新命名（X1_0_b0/k2EX1_0_b0）、legacy verify rc=1。
- **实机数据**：920B paired：v2-SVE1 vs 上游 sve +4%（CI 不含 1）、
  v3.1-SVE1 -14%、NEON 仍快；Yitian(Neoverse-N2, VL=128) 基线
  c/neon/sve = 402/118/83；960 未流片。
- **下一步**：DCT32 rshrnb 8 行合并窄化（512→256 方向，剩余最大差
  距）、k0_even_sve 做成原子 rewrite（DCT16 legacy_even_sve 同款）、
  常量预排列（tbl/zip 削减）、960/920G paired 第三代理。

## 1. 仓库与同步（必须遵守）

- 本地（主工作机，代码优先本地改）：`/home/chiro/projects/a64-simd-dyn-optimizer`
- GitHub（`github` remote）：`https://github.com/chiro2001/a64-simd-dyn-optimizer.git`
- ARM N1（`origin` remote，非裸仓库）：`chiro@129.146.162.16:projects/a64-simd-dyn-optimizer`
- 鲲鹏 920B 云实例（可能被用户启停/销毁，接手先探活）：`chiro@124.70.206.229`
- 用户工作流：1) 代码优先本地修改，本地验证后再同步；2) 重计算优先本地
  x86（`aarch64-linux-gnu-g++ 16.1.0` + `qemu-aarch64 11.0.3` +
  `QEMU_LD_PREFIX=/usr/aarch64-linux-gnu`）；3) 服务器同步 N1 用
  `git fetch github main && git merge --ff-only FETCH_HEAD`（有未提交变更
  先 stash，完成后 drop）；920B 无 GitHub 直连且禁 TCP 转发，用 rsync
  （工作树排除 `.git/build/.venv/third_party/x265/.git`，再 rsync `.git/`，
  远端 `git reset -q --hard HEAD`）；未提交小改动 `scripts/sync-up.sh`
  （`SYNC_REMOTE` 可覆盖目标）。
- **本地交叉 x265 已建好**：`build/x265-8-cross-make/libx265.a`（cmake
  Makefiles，`-DAARCH64_RUNTIME_CPU_DETECT=OFF -DHAVE_STRTOK_R=1`，
  `-DENABLE_CLI/TESTS=OFF`）；本地无 ninja、无 apt，链接用 `SKIP_NUMA=1`。

## 2. 三档目标与验收（docs/09 v0.4，已冻结）

| 档位 | 迁移 | 机器 | 目标 |
| --- | --- | --- | --- |
| a | NEON → NEON | **N1 与 920B 都要测**（用户 2026-08-13 明确） | +30%（1.30×） |
| b | NEON/SVE128 → SVE256 | 鲲鹏 N+2 | +130%（2.30×） |
| c | SVE256 → SVE256 | 鲲鹏 N+2 | +130%（2.30×） |

保留门槛（paired 中心估计与 bootstrap 95% CI 下界都须超过）：920B 对同机
NEON >1.10；N+2 b 档对同机冻结 NEON/SVE128 >2.10；N+2 c 档对最佳上游
SVE256 >1.10；优秀一律 2.30。所有候选全量记录，达标者额外展示。

## 3. 环境关键事实

| 环境 | 关键事实 |
| --- | --- |
| 本地 x86 | 交叉 g++ 16.1.0、qemu 11.0.3、sysroot `/usr/aarch64-linux-gnu`；无 ninja/apt/libnuma-cross；cmake 4.4.2 |
| ARM N1（129.146.162.16） | Ubuntu 24.04、2 vCPU Neoverse-N1、GCC 13.3、NEON+DotProd（无 SVE）、`build/x265-8-gcc`、perf 有但小 kernel 用 CNTVCT |
| 鲲鹏 920B（124.70.206.229） | openEuler 24.03、2 vCPU、SVE1（无 sve2）、VL=256（svcntb=32）、NEON 4×128 / SVE 2×256、**无硬件 PMU（root 也没有）**；GCC 12.3.1、cmake/ninja/git/perf/libasan/libubsan/rsync 已装；`build/x265-8-gcc` 已建 |
| 鲲鹏 N+2（960） | SVE2.3、SVE 4×256、NEON 4×128，尚未定型 |

## 4. 已完成里程碑（截至最新）

- M0：N1 NEON 基线（8x8 26.3ns/80.4cyc/115.9insn；16x16 275/487.8）
- M1/M2：SpecIR/MachineIR(167)/PackIR(149) + NEON roundtrip 0 diff
- M4：NEON 搜索三轮负结果
- M7：官方 ARM ISA XML 覆盖 + dotprod/i8mm 补齐
- M8/M9：SVE 双 tile 打包 + typed TRN lowering（24 tbl2+48 ld1h+24 mad → 24 trn）
- M10：16x16 两次 wave wrapper，长门禁本地全过
- **P1'（本轮）**：真实 VL<256 dispatch 拒绝（`kernels/sa8d/sve_dispatch.h`
  + `sve_verify.cpp`：VL=128 时打包候选 registered=0/calls=0，
  `rejection_audit=pass`）；ASan/UBSan 在 920B 原生过
- **M11（本轮）**：920B SVE256 闭环，功能门禁全过、**性能负结果**：
  SA8D 8x8 latency 0.897/tp 0.932、16x16 latency 0.886/tp 0.681（对 NEON，
  CNTVCT）均 REJECT。原因：920B SVE 2×256 与 NEON 4×128 位宽容量相等，
  指令减半（16x16 动态 481→257，-47%）不换算成周期。归档见
  `experiments/m11-sve-920b/`；候选身份冻结见 `candidates/identity.yaml`
- **M12（本轮，foundation-only）**：DCT8 首轮闭环（tier a）：
  - 独立差分器 `kernels/dct8/dct8_verify.cpp`（oracle==dct8_c 精确）；
  - **发现**：上游 `dct8_neon` 与 C 参考在 [-255,255] 内有 ~0.86% 分歧
    （172/20000 微基准口径、1733/200000 差分器口径，N1/920B/本地 qemu
    一致、stride 无关；差异为 64 的倍数，集中在奇数列 k=1/3/5/7 的
    j=5/6/7 行），而 x265 自身 TestBench transforms（128 迭代）通过 →
    潜在上游 bug，**候选合同定为 C 参考 bit-exact**；
  - 基线：上游 NEON 比 C 慢 **N1 19%（0.807×）/ 920B 4%（0.961×）**；
  - 微基准 `benchmarks/dct8_microbench.cpp` + `scripts/build-dct8-*.sh`；
  - 本地交叉+qemu 迭代路径已通。
- **M13（accepted）**：LLVM importer 扩展 + DCT8 NEON roundtrip：
  - importer 新增 store/sext/mul（含逐 lane 常量向量）/splat 立即数/i16
    gep/内联常量 gep/intrinsic 有序 args（`optimizer/ir/machine_ir.py`，
    单测 `optimizer/ir/test_machine_ir.py`）；
  - codegen 新增 `emit_dct8_c_intrinsics()`（符号化 stride 寻址、常量池、
    `vcombine_s32(vget_low/high)` 修正 zip1q_s64 语义）；
  - `kernels/dct8/gen_roundtrip.py` + seed
    `experiments/m12-dct8/llvm-ir/dct8-neon-seed.ll`（clang 22 -O2）+
    `imported/machine-ir.json`（380 节点）；
  - **roundtrip 与上游 dct8_neon bit-exact（20 万例 0 差异）**，并精确
    复现上游 0.87% 分歧；
  - **上游 bug 根因已定位**（round-0006 独立印证）：pass2 用 `vsub_s16`
    在 s16 域算 O，`|coef[k]-coef[7-k]|>32767` 时回绕（实测
    -33288→+32248），C 在 int32 域；pass1 输入范围小不触发。修复方向：
    pass2 O 用 `vsubl_s16` 提 s32 后做奇数列点积。
- **M14（accepted）**：C-exact 修复落地：`optimizer/ir/rewrites.py::
  widen_dct8_pass2_odd`（s32 奇数列 + `vmulq_s32`），cand==C oracle 本地
  20 万例 / N1·920B 各 2 万例全 0；静态 347/282（上游 341）；paired vs
  上游 NEON：N1 0.891×、920B 0.981×（修复的账，搜索要赚回来）。
- **M15（rejected-performance）**：proto_b 四列并行标量广播 mul/mla 奇数
  列：C-exact、静态 229/128（-34%），但 latency N1 0.858×、920B 1.019×；
  mla 把树形归约线性化（深度 4），N1 s32 标量乘法代价大——计数不换算收益。
- **M16（rejected-performance，止损触发）**：proto_c 全宽 stride 加载 +
  coef 往返转置 + 树形奇数列：C-exact、静态 254/118，latency N1 0.829×、
  920B 0.953×，tp 920B 1.036×。三原型总账（N1/920B latency vs 上游
  NEON）：widened 0.891/0.981、proto_b 0.858/1.019、proto_c 0.829/0.953
  ——**无一达到 round-0006 止损线（中心>1.05 且 CI 下界>1.00）**，
  “上游 NEON 局部 peephole”family 停止。
- **成本模型 v0**：`optimizer/analysis/cost.py`（资源分类 + cycles_lb 骨架
  + N1/920B seed profiles）、`tools/calibrate_cost.py`（线性拟合）。用
  M14-M16 的 4 候选×2 机 latency 校准：**线性吞吐模型 R²<0**——latency 由
  依赖链关键路径主导，下一步必须加 `critical_path_latency` 依赖图估计器；
  在此之前禁止用线性模型排序候选。
- **关键路径估计器 v0（本轮）**：`optimizer/analysis/critical_path.py` +
  `tools/critical_path.py`（寄存器+栈槽 `sp#offset` def-use 最长前向链；
  `--chain` 打印最长路径、`--fit=name:tick,... --out f.json` 逐机拟合逐
  指令延迟）。校准：**920B R²=0.982、N1 R²=0.814**（fitted-n1/920b.json）。
  种子表对 920B 排名基本正确；N1 需要拟合（mla/mul 延迟高于种子假设）。
- **P4' 融合静态 inventory（本轮，accepted）**：
  `optimizer/analysis/fusion.py`（互斥分类、C3 端口预算、C4 dest-chaining/
  窗口可观察性/谓词一致/重排位置）、`tools/fusion_analysis.py`（docs/09
  §4.2 报告）、7 个单测。报告：sve-x2raw 2 对、dct8-upstream 99 对、
   dct8-protob 34 对 structurally_eligible；融合表为空 → hw_supported=0、
  节省 unknown、不驱动搜索（`experiments/m11-fusion/`）。
- **range-aware 值域分析（本轮）**：`optimizer/analysis/range.py` +
  `tools/range_analysis.py` 对 MachineIR 前向整数区间传播，静态标记超出
  存储位宽的运算；对 dct8 seed 精确命中 8 个 pass2-O s16 回绕 sub（含
  4 个精确上界 [-65280,65280]）+ 6 个 rev64 shuffle，pass1 无假阳性——
  此前该定位需 20 万例差分。这是 round-0006 建议的 range-aware IR 核心；
  限制：区间乘上近似，下一增量做 dot-product 紧界（Σ|g_i|·max|O_i|）。
- **round-0006 已归档**：response.md + decision.md（独立印证 s16 回绕；
  三原型 (a/b/c) 与止损点；纠错 vrshrn 非饱和、PR_SVE_SET_VL 单位为字节、
  m12 合同改 C 参考、微基准 checksum 移出依赖链）。

## 5. 代码/工具入口

- SA8D 生成：`kernels/sa8d/gen_roundtrip.py <machine-ir.json> <out.cpp>
  --backend sve2 [--pack x2] [--raw] [--shape 8x8|16x16]`
- SA8D 构建门禁：`scripts/build-sve-sa8d.sh`（`NATIVE=1` 裸机、
  `CXXFLAGS` 覆盖、`SVE_MARCH=armv8-a+sve`、ISA 等级门禁已并入）
- DCT8：`kernels/dct8/dct8_verify.cpp`（三方诊断）、
  `benchmarks/dct8_microbench.cpp`（c/neon/empty/cand，CSV ticks 列 7）、
  `scripts/build-dct8-verify.sh`、`scripts/build-dct8-microbench.sh`、
  `kernels/dct8/gen_roundtrip.py`（seed 生成）
- paired cycles：`scripts/run-pmu-sa8d-paired.sh <bench> <shape> [pairs]
  [procs] [batch] [out] [mode]`（`IMPL_A/IMPL_B`、`METRIC=cntvct|perf|auto`
  可覆盖；auto 默认 **cntvct**，小 kernel 不用 whole-process perf）
- ISA 等级门禁：`tools/check_isa_level.py --object f.o --level sve1`
  （官方 catalog + TBL2 双寄存器表操作数规则；GNU/LLVM objdump 均可）
- 微基准 64x64 校验的 `maxOff=0` div-by-zero UB 已修（dct8/sa8d 两处）
- `optimizer/targets/aarch64/features.py`：`sve_vl256()` 等 profile

## 6. 专家建议归档与频率

- round-0001~0005 已按旧频率归档（`expert-advice/`）。
- 新频率：**每完成三个实际优化迭代请求一次**，只读后台异步；主流程继续。
- **round-0006 已异步发起（本轮，后台 session 可能仍在跑）**：
  `expert-advice/round-0006/prompt.md`+`context.md`，命令见 context.md；
  response 落盘到 `response.md` 后，下一个自然检查点写 `decision.md`；
  失败只记 `blocked.md`，不伪造。
- 命令：`codex -p sss -c 'model="gpt-5.6-sol"' -c
  'model_reasoning_effort="max"' -s read-only -C "$PWD" exec -o
  expert-advice/round-NNNN/response.md - < prompt.md`。

## 7. 下一步任务（P 顺序）

1. **P3'/M17+：止损后的 pivot（round-0006 执行中）**：
   - (a)(b)(c) 三原型已完成并归档（M14-M16），均未达保留门槛；
   - 下一步按优先级：①已给成本模型加 `critical_path_latency`（920B
     R²=0.98、N1 0.81，可用于 920B 排序；N1 用拟合权重）；②用校准模型
     引导下一候选：寄存器常驻分解 / 双块 DCT8 批处理 / residual→DCT、
     DCT→quant 跨 primitive 融合；③range-aware fixed-point transform IR；
   - 若能拿到内部 30-60% 实现的反汇编/指令直方图，优先校准搜索空间；
   - 保留候选全量记录：920B tp 上 proto_c 已达 1.036×、proto_b latency
     1.019×（未达 1.10 保留线，但可作未来组合的素材）。
2. 基准重建（round-0006）：throughput 四路独立 dst、latency 预筛 C==NEON
   输入链、归档 impl_a/impl_b + CNTFRQ（微基准 checksum 已移出依赖链；
   CNTFRQ 双机不同，只做机内比较）。
3. **P4'（已完成）**：融合静态 inventory 入库并出报告（见上）。
4. **P5'（已完成）**：instruction-pair 微基准（`kernels/fusion/
   pair_microbench.cpp` + `scripts/bench-pair-fusion.sh`）在 920B/N1 各 60
   样本验证三对代表 pair：**无跨机一致融合信号**（ziprev 920B 0.92 vs N1
   1.00；muladdp/sve_addchain 的 chained 因依赖链串行反而慢）。未获得
   `hw_supported` 证据 → 融合不进入排序/搜索（空融合表语义保持）。
5. **P6'**：无 hw_supported 融合对，排序/相关性验证阶段暂无输入（等目标
   融合表或更强的实机证据后再启）。
   - **P6' 成本模型相关性验证（本轮完成，未过）**：7 候选×双机，DCT8
     拟合权重外推 interp8 失败（sdot/tbl/smlal 无覆盖），留一法 Spearman
     N1=-0.214/920B=0.607；家族内 920B R²=0.98。结论：模型仅家族内可用，
     搜索主循环排序继续 gated；改进=按 lane 位宽/指令家族分组延迟 +
     吞吐/端口项 + 更多实测点（`experiments/m19-cost-validation/`）。
   - **m20 搜索主循环 v0（本轮完成）**：`tools/search_driver.py` 家族限定
     搜索驱动（rewrite→codegen→编译→反汇编→成本→排序，920B 家族内可信）。
     rewrite 目录={widen, shift64, nop}，组合枚举，widen+shift64 候选
     C-exact（20k 0 mismatch）；核心增长点=把 M15/M16 结构选择（树↔
     mla、全宽加载、转置/常量复用）编码为 IR rewrite 展开搜索空间。
   - **hvpp 入口（未实现）**：`filter_hvpp_t(src, stride, dst, stride,
     idxX, idxY)`，C=`ipfilter.cpp:363 interp_hv_pp_c`（hps+1 垂直 sp），
     上游=`filter-prim.cpp:2014/4756 interp8_hv_pp_neon`；是剩余唯一有
     结构性复用空间的方向，但函数类型不同，需先扩微基准 harness。
   - **M18 hvpp 差分（本轮）**：`kernels/interp8/hvpp_verify.cpp` 三方
     差分；首版 oracle 漏逐行推进，误报“上游 0.01% 分歧”，修复后
     **20000 例×9 idx 全 0 mismatch（oracle==C==NEON）**，无上游分歧。
     hvpp 候选合同定 C 参考 bit-exact，下一步做 hvpp C-exact 候选。
   - **M18 终态**：`proto_hvdot`（121 条）C-exact，但 vs 上游 N1 0.674/
     920B 0.683（滑窗 vmlal 远弱于上游二维复用）。interp8 家族：hpp
     1.014–1.044×（唯一接近）、vpp 0.92–0.97、hvpp 0.67–0.68——上游用
     dotprod/i8mm + 转置 sdot 双向结构；tier-a 在 interp8 的现实空间
     仅 hpp 的 2–4%。
6. **P3''/M18 起：interp8_hpp（tier-a 新目标）**：DCT→quant 融合经分析
   收益小（中间缓冲必须保留给 RDO、quant 参数矩阵大、bit-exact 风险
   不对称，见 `experiments/m17-fusion-feasibility/`）。转向
   `filter_pp_t`：
   - 合同：`void(const pixel* src, intptr_t srcStride, pixel* dst,
     intptr_t dstStride, int coeffIdx)`，8-tap 水平 pixel→pixel；
   - 上游 NEON：`common/aarch64/filter-prim.cpp:769
     interp8_horiz_pp_neon`（width/height 模板）；
   - C 参考：`common/ipfilter.cpp:80 interp_horiz_pp_c<8,W,H>`；
   - oracle：`test/ipfilterharness`；
   - 复用 M12 DCT8 的闭环配方（独立差分 + 微基准 + paired + importer/
     range/关键路径工具链）；interp8 是 load-heavy 典型（round-0005 明确
     可优化）。
   - **M18 foundation 已完成**：`benchmarks/interp8_microbench.cpp` +
     `scripts/build-interp8-microbench.sh`；基线（paired latency，ratio=
     neon/c<1 表示 NEON 快）：8x8 N1 0.516/920B 0.514，16x16 N1 0.434/
     920B 0.582——上游 NEON 快 C ~1.9-2.3×，tier-a +30% 基线很强；
   - **上游分歧发现**：N1 的 dotprod 变体 `interp8_horiz_pp_dotprod` 在
     **phase=0**（单位滤波器）与 C 参考不一致（want=0 vs got=65），920B
     的 i8mm 变体通过；与 DCT8 同类潜在 bug，下一轮最小化反例 + importer
     扩 udot/sdot/usdot dot 家族 + roundtrip→C-exact 候选。
   - **纠错**：上述“phase=0 分歧”是 harness 的 strided-write/dense-read
     bug 假阳性；改 `dstStride=shape` 后三处 c==neon 全过。
   - **M18 进展**：dotprod seed IR 提取 + importer 扩（extractvalue/trunc/
     xor）→ 136 节点导入；`proto_dot` C-exact 8x8 候选（4 行批量 76 条）
     对上游 NEON N1 1.014×/920B 1.024×。**8x8 上游 dotprod 已近下限**，
     +30% 转向 16x16+ 或垂直/hvpp 路径。
   - **M18 后续**：`proto_dot16`（16x16、128 条/32 sdot）N1 1.024×/
     920B 1.044×；水平 PP 双机均近下限。下一候选：垂直 vpp / 二维 hvpp
     （更多数据复用）或 residual→subpel 融合。坑：rsync 拉取远端
     experiments 目录会覆盖本地 doc，只拉 benchmark 子目录。
   - **M18 垂直**：微基准加 8x8v/16x16v + vc/vneon/vcand；上游基座垂直
     NEON 对 coeffIdx==0 无 case（不写输出，已记录）；`proto_vdot`
     （滑窗 8 行 + vmlal_s8，70 条）C-exact 全 4 相位，实测对上游垂直
     N1 0.965×/920B 0.918×——上游垂直（基座/i8mm）更强。追赶需 i8mm 式
     转置 4x4 + vusdotq；hvpp 是唯一仍有结构性复用空间的方向。
5. **P7'**：N+2 profile（4×256、SVE2.3、融合表）与 b/c 分档验收。
6. 920B 存活期内补做 DCT8 候选的 a 档实机验证（工具链/微基准已就绪）。

## 8. 关键坑（本轮新增）

- **PR_SVE_SET_VL 单位**：920B 内核与 qemu-user 都按**字节**解释参数
  （16→16B、≥48 钳到 32B；手册写 bit）。拒绝门禁只测 VL=128，用值 16 在
  两处都得到 16B；新线程**继承**调用者 VL（920B 实测），生产 dispatch
  仍建议每 worker 显式设置/断言 svcntb()==32。
- **920B 无硬件 PMU**（root 也没有）：cycles 用 CNTVCT_EL0 ticks；
  N1 有 perf 但小 kernel 的 whole-process cycles 分辨率不足（30 对全
  1.0），一律 `METRIC=cntvct`。
- **上游 dct8 分歧**：0.86% 输入 NEON≠C；cand 必须对 C 参考 bit-exact，
  不要对 NEON 逐位对齐（否则继承上游 bug 且跨平台不一致）。根因见 M13。
- x265 16/32/64 的 dct 槽被 `setupAliasPrimitives` 换成 lowpass_dct，
  DCT8 harness 只测 8x8；N1 上 shape 16 的 lowpass 路径会崩，勿混入。
- 云实例生命周期：920B 结论绑定 M11/M12 环境快照，销毁后不复用。
- 服务器同步：920B 禁 TCP 转发且 GitHub 直连超时，用 rsync（见 §1）。

## 9. 必读清单（压缩后先读）

1. `docs/README.md`（必读顺序与三档目标）
2. `docs/09-instruction-fusion-analysis.md`（需求 v0.4、P0'~P7'）
3. `docs/06-agent-iteration-protocol.md`（迭代协议 + 咨询新频率）
4. `experiments/m11-sve-920b/iteration.md` 与 `manifest.yaml`
5. `experiments/m12-dct8/iteration.md` 与 `manifest.yaml`
6. `candidates/identity.yaml`
7. `expert-advice/round-0006/context.md`（response 若已落盘也读）
8. `git status` / `git log --oneline -5` 确认基线与工作树状态
