# Agent 交接上下文（2026-08-13，M11~M16 后）

本文件供上下文压缩后接手的执行 Agent 使用。开始前按“必读清单”读取下列
文件，并以仓库当前状态为准；不要凭对话记忆下结论。

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
