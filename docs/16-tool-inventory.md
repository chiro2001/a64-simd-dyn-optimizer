# 工具清单与流水线地图（2026-08-13）

目的：让后续优化/评估**直接走工具程序流程**。规范入口是
`tools/pipeline.py`；每个 kernel 用一份 manifest 声明接入信息；工具按
阶段归类，输入/输出明确，可单独运行也可被 pipeline 编排。

## 1. 流水线地图

```text
                    kernels/<name>/manifest.yaml
                              │
   kernel ──▶ ingest ──▶ discover ──▶ optimize ──▶ emit ──▶ evaluate
              │          │            │            │        │
          trace_kernel │ dct16_shared │ search_*  emit_*   parse_qemu
          (QEMU)       │ _discovery   │ (枚举)    (C++/.S)  + verify
              │        │            │            │        │
              ▼          ▼            ▼            ▼        ▼
          asm_ir/     lane-forms   布局参数/    kernel    fused_adj
          LoopIR      + 共享矩阵    rewrite     源码      + loop_report
```

## 2. 工具清单

### ingest（抓取/导入）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `tools/trace_kernel.sh` | kernel .o + 符号 → `-d exec,in_asm` trace 日志 | 通用 |
| `tools/parse_qemu_trace.py` | trace 日志 + 地址区间 → 指令流 JSON（true-dynamic，含 fused_adj） | 通用；`--exec` 为真实动态 |
| `optimizer/ir/asm_ir.py` | 指令流 → 寄存器 SSA asm-IR | DCT16 覆盖 |
| `optimizer/ir/layout_ir.py` | typed LayoutIR（ValueLayout/RoundBarrier/ConstantMap/MemoryMap/Tile/Plan + canonical key + verify_layout + lower 回放） | P1 第一增量；DCT32 v3.1 计划可回放 |
| `optimizer/ir/rewrites_dct32.py` | 原子 rewrite（assign_output_lanes/segment_dot/batch_round_narrow_store/derive_constant_map/k2_pass1_slice）+ ProofCertificate | P1 第二增量；rediscover_v31 精确复现 v3.1 plan |
| `tools/search_plans.py` | rewrite 子集 → plan → 分层漏斗（语义/canonical/源码）→ 编译 + 20k 差分 + trace 实测 | P1/P2；18 计划实测重发现 pass1 best 3962 / full 8292（2026-08-13 加 range_end 修正） |
| `optimizer/analysis/layout_verify.py` | `check_source(plan, src)`：pass32_impl 逐指令族计数与 plan 声明比对 + 零 scatter 硬门 | P1 增量 5；search_plans 编译前自动执行 |
| `tools/recover_loops.py` | 指令流 JSON → 循环骨架（trip/period/depth） | 原型，通用 |
| `tools/sve2p3_canary.S/.c` + `scripts/sve2p3-canary.sh` | SVE2p3 `sdot.h` 执行能力探针（汇编器接受 → 执行器逐 lane 校验；SIGILL → exit 3） | 纯汇编，不依赖 ACLE |

### discover（结构发现）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `tools/dct16_shared_discovery.py` | trace + .rodata → 共享常量矩阵报告 JSON | DCT16 专属 |
| `optimizer/analysis/asm_linearize.py` | asm-IR → lane 符号形式 / 共享矩阵命中 | DCT16 覆盖 |

### optimize / emit（生成）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `tools/emit_dct16_sve2_shared.py` | 布局参数 → C++ ACLE kernel | DCT16 专属；参数化 |
| `tools/emit_dct16_sve2_asm.py` | C++ → `.S`（bootstrap 一次）+ `as` | DCT16 专属；ACLE-free 重建 |
| `tools/emit_dct32_sve2_shared.py` / `emit_interp8_sve2_shared.py` | 布局参数 → C++ ACLE kernel | DCT32/interp8 专属；参数化 |
| `optimizer/ir/rewrites.py` | MachineIR → MachineIR（widen/tree_to_mla 等） | DCT8 覆盖，未接 SVE2 |
| `optimizer/ir/codegen.py` | MachineIR → NEON C++（dct8/dct16/sa8d/interp8） | 每 kernel 专属函数 |

### evaluate（评估）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `kernels/<name>/*_verify.cpp` | 候选 + 参考 → mismatch 报告 | 每 kernel 专属 harness |
| `tools/search_sve2_layouts.py` | 布局域 → 生成/编译/差分/计数/排名/finalize | dct16/dct32/sa8d/sa8d16/interp8；finalize 自动跑 TestBenchLite 门禁 |
| `tools/search_driver.py` | MachineIR + rewrite 组合 → 静态 Pareto 排名 | DCT8 通用 |
| `tools/count_asm_insns.py` / `classify_disasm.py` | object/disasm → 静态分类 | 通用 |
| `tools/fusion_analysis.py` | disasm + profile → 融合清单 | 通用 |
| `tools/recover_loops.py` | trace JSON → 循环健康度 | 通用 |
| `tools/search_permute.py` | 输入向量布局 + 目标布局 → SVE zip/uzp/trn/rev 置换序列（BFS，含寄存器压力约束） | 通用；用于打包方案搜索 |

### 编排与契约

| 工具 | 说明 |
| --- | --- |
| `tools/pipeline.py` | 一键骨架：baseline → search → report；读取 kernel manifest |
| `tools/pipeline.py finalize` | 固化最优候选：best_sve2.cpp/.S + 20 万例验证 + best.json |
| `tools/gen_verify.py` | 从 manifest 生成上游差分 harness（参考/corpus/VL） |
| `kernels/<name>/manifest.yaml` | kernel 接入契约：参考库/符号、driver、corpus、VL、布局域 |
| `tools/kernel_manifest.py` | manifest 加载 + `layout_plans()`：按 `layout_prune` 规则（requires）过滤轴组合，替代搜索驱动里的 kernel 专属硬编码依赖链（P2） |

### 验收门禁（x265 TestBench 黄金标准）

| 工具 | 说明 |
| --- | --- |
| `scripts/testbench-inject.patch` | 在 `testbench.cpp` 文件作用域声明候选符号，并在 `setupIntrinsicPrimitives` 后把 `vecprim.cu[BLOCK_16x16].dct` 替换为候选 |
| `scripts/build-testbench-inject.sh` | 打补丁 → 交叉构建完整 TestBench（候选 .o 经 linker flags 链入）→ 静态校验调用点 → QEMU VL=256 跑 `--testbench transforms --nobench`。**验收黄金标准** |
| `scripts/build-testbench-lite.sh` | 只编译 `MBDstHarness` + `tools/testbench_lite.cpp`，链接已有 `libx265.a` 与候选 .o，秒级跑同一套随机数据/128 轮差分。**开发期快速门禁** |
| `tools/testbench_lite.cpp` | lite 主程序：复用 x265 的 `MBDstHarness`（同缓冲生成、同 `check_dct_primitive`、同 C 参考 `dct16_c`），只接线指定 kernel 槽 |

要点：
- 完整 TestBench 通过 linker flags 链入候选 .o；**候选 .o 内容变化不会触发
  自动重链**，脚本必须 `rm -f TestBench` 强制重链，并在构建后用
  `nm -u testbench.cpp.o` 确认调用点已编译进（只出现符号不代表被调用）；
- 验证门禁真实性的负向对照：注入故意错误的候选必须 FAIL（当前已验：
  `dct16x16 failed` + 非零退出）；
- x265 本构建因缺 `arm_neon_sve_bridge.h` 禁用 SVE/SVE2 编译，`--cpuid
  SVE2` 无效，门禁用 `NEON,Neon_DotProd,Neon_I8MM` 标签；注入的函数仍为
  SVE2 候选，QEMU `-cpu max,sve-max-vq=2` 下以 VL=256 真实执行。
- `search_sve2_layouts.py --contract legacy-internal-exact`：legacy 组合
  按 TestBench 口径接受 `mismatches <= 3072`（20000 例，<=0.06% 代理
  容差，由实测校准：0.045% 通过 6/6、0.090% 首跑失败）并记录实际分歧率；
  upstream-exact 组合仍要求 0 分歧。指标 `fused_adj` 只含 movprfx 融合，
  其他融合对尚未实现。
- 搜索驱动带**持久验证缓存**（`<outdir>/verify_cache.json`，gitignored）：
  按 `contract|生成源码哈希` 复用已验证的 passed/mismatches/counts，
  仅源码或合同变化才重跑；增量重跑从 ~7.8 分钟降到 ~0.1 秒。另有源码
  哈希规范化去重（相同生成代码只验证一次）。
- 搜索驱动支持 `--workers N`（默认 1 串行）：`search_sve2_layouts.py`
  的编译/20k 差分/trace 由进程池并行；`search_rewrite_sequences.py`
  同样支持（另加 `--outdir`）。coordinator 在主进程完成枚举/去重/
  缓存读取，worker 只测新源，按枚举顺序稳定合并，`results.json` schema
  与串行完全一致（2026-08-14 已验：dct16 357 行 W=1/W=4 逐字段相等，
  4 worker 墙钟 6:21→1:44，约 3.7×）。
- 后端参数扫描（2026-08-14，round-0017 咨询配套）：
  `search_sve2_layouts.py --cxx <compiler>` 切换候选编译器（默认
  aarch64-linux-gnu-g++）；`--opt-extra "<flags>"` 在 candidate_opt
  之后追加任意编译选项（如 `--opt-extra "-frename-registers -fweb"`），
  用于 regalloc/调度 flag 快速对比；sdot 系默认已含
  `-frename-registers`（docs/27 §8.11 flag 扫描）。
- MCA 短名单（2026-08-14，round-0017 tooling-roadmap）：
  `--mca-top N` 不再只取 fused top-N，而是 fused top-N ∪ 低 stack
  top-K ∪ 高 stack top-K（K=N/3），覆盖“fused 改善但 spill 恶化”的
  风险候选与低 spill 黑马；最终仍按修复后动态流 MCA 排名。
- `tools/peak_live.py`（2026-08-14，round-0017 P1）：动态流峰值活跃
  Z 寄存器与 live-area（谓词不计），支持 `--fix-driver` 修复 SVE2p1
  sdot；用于 pressure-budgeted 原型的基线量化（idct32 best 峰值
  31，docs/27 §8.11）。
- `search_rewrite_sequences.py` 带 rewrite 依赖剪枝（`--no-prune` 关闭）：
  dct32 规则 = legacy_k2 必须先于 legacy_k4、merge_narrow8 至多一次、
  k0_even_sve 需要 k2/k4 前置；dct16 规则 = tbl2_to_zip/merge_narrow8
  至多一次。规则经全宇宙源码哈希覆盖审计（剪枝后每个唯一 source 仍有
  代表键，覆盖 100%）：dct32 781→219 计划键、31 唯一源（27 实测，
  best 6322）；dct16 121→45 计划键、4 唯一源。保留的非连续
  `tbl2_to_zip|legacy_k2|tbl2_to_zip|legacy_k4` 是有效候选（7282），
  未纳入“tbl2 至多一次”剪枝。
- 两级差分（`--short-cases 2000` → `--full-cases 20000`，`--no-short-gate`
  关闭）：harness 用同一 RNG 流，2k 是 20k 的严格前缀，因此
  fail→pass=0 自动成立；short 门失败的候选记录 2k mismatch 并带
  `gate:"short"` 标记，通过候选仍跑全量 20k 并记录完整计数。
- trace 计数 fast path：`parse_qemu_trace.py --stream` 不物化指令列表，
  直接流式产出与旧 parser 同 schema 的 counts；`true_dynamic` 默认走
  fast path。已在 348 个真实 QEMU 日志上逐字段一致（含 36 个 scatter
  样本，零差异）。
- **uop 口径（2026-08-14 用户裁定）**：gather/scatter 在 ARM 上拆分为
  多个 ldst uops，禁止为表面指令数使用。`parse_qemu_trace.py` 输出
  `scatter_gather` 与 `vector_fused_uop = fused_adj + 3×sg`；搜索按
  fused_uop 排名。
- **DCT8 已收敛到 upstream-exact（2026-08-14）**：旧 quarter 发射器
  pass2 用 s16 E/O 回绕（0.11% vs C，合同不满足）；改为逐条移植上游
  `partialButterfly8_sve`（E s32 不回绕、O s16 回绕、偶 k vmul/vpadd、
  奇 k sdot），2 万例与 `dct8_sve` 0 分歧（与 C 分歧 0.051% 即上游
  自身签名），fused_adj=323（上游基线等价）。trace driver 也修正为
  候选驱动。后续优化可从该基线应用 DCT16 的轴。

## 3. 现状判定

- **DCT16 纵切**：pipeline 一键可跑（~3.4s），优化只改 manifest 布局域 /
  发射器参数；finalize 输出稳定交付产物（best_sve2.cpp/.S）；
- **验收门禁**：完整 TestBench 注入已跑通（含负向对照），lite 门禁秒级
  可复跑，两者共用 x265 官方 harness 数据与 C 参考；
- **SA8D 评估（2026-08-14，见 docs/19）**：开源 SVE2 sa8d8=111 动态
  指令；项目 M0 候选 116-125 未超越；真 256-bit 化 + zip 重排预计
  ~75-85（-25%~-30%），是下一个收益明确的工具链扩展目标。
- **通用化缺口**：manifest 仅 dct16 一份；verify harness、lane 语义、
  发射器仍是 per-kernel；rewrites（MachineIR）未接到 SVE2 流程；
- **搜索空间**：当前 3 个布局组合穷举，耗时 <60s，暂不需要启发式算法；
  超过 60s 后再引入 beam/剪枝。

## 4. 下一步（按用户优先级：工具进化优先）

1. kernel manifest 成为所有阶段的输入契约（baseline/verify/搜索从
   manifest 读符号、参考、corpus、布局域）——✅ 已完成；
2. 布局搜索空间参数化：`search_sve2_layouts.py` 从 manifest 布局域自动
   枚举，新增布局只改 manifest——✅ 已完成（6 组合，~6.4s）；
3. 评估漏斗参数化：verify 从 manifest 选参考符号/corpus，去掉硬编码；
   ——✅ 已完成（gen_verify.py）；
4. LoopIR 接入发射器（docs/15），循环级布局进入搜索域；
5. rewrites 通用化后接到 SVE2 流程，优化 pass 真正可插拔。
