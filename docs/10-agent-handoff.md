# Agent 交接上下文（2026-08-13）

本文件供上下文压缩后接手的执行 Agent 使用。开始前按“必读清单”读取下列
文件，并以仓库当前状态为准；不要凭对话记忆下结论。

## 1. 仓库与同步

- 本地工作目录：`/home/chiro/projects/a64-simd-dyn-optimizer`
- GitHub（`github` remote）：`https://github.com/chiro2001/a64-simd-dyn-optimizer.git`
- ARM N1（`origin` remote，非裸仓库）：
  `chiro@129.146.162.16:projects/a64-simd-dyn-optimizer`
- 鲲鹏 920B（云实例，可能被用户启停/销毁）：`chiro@124.70.206.229`

工作流（用户 2026-08-13 明确）：

1. **代码优先本地修改**，本地验证通过后再 git/rsync 同步；
2. **重计算优先本地 x86**：`aarch64-linux-gnu-g++` 交叉编译 +
   `qemu-aarch64` + `QEMU_LD_PREFIX=/usr/aarch64-linux-gnu`；远程 ARM
   只做必要的实机验证；
3. 服务器同步：`git fetch github main && git merge --ff-only FETCH_HEAD`
   （服务器工作树有未提交变更时先 `git stash push -u`，验证后 drop）；
   未提交小改动用 `scripts/sync-up.sh`（单源 rsync，多源会复制到仓库根）。

## 2. 性能目标与验收（docs/09 v0.4）

三档目标（实机口径）：

| 档位 | 迁移 | 机器 | 目标 |
| --- | --- | --- | --- |
| a | NEON → NEON | ARM N1 | +30%（1.30×） |
| b | NEON（或 SVE128）→ SVE256 | 鲲鹏 N+2 | +130%（2.30×） |
| c | SVE256 → SVE256 | 鲲鹏 N+2 | +130%（2.30×） |

保留门槛（paired speedup 中心估计与 bootstrap 95% CI 下界都要超过阈值）：

| 环境/档位 | baseline | 保留 | 优秀 |
| --- | --- | ---: | ---: |
| 920B 中间验证 | 同机上游 NEON | >1.10 | 不作 N+2 优秀判定 |
| N+2 b 档 | 同机冻结 NEON / SVE128（单列 b-neon/b-sve128） | >2.10 | >=2.30 |
| N+2 c 档 | 同机最佳现有 SVE256 | >1.10 | >=2.30 |

估算模型：`instruction_score = (simd_insns + load_insns) / issue_est`
（仅搜索代理，不叫 cycles 估算）；另维护资源下界 `cycles_lb`；
`load > SIMD` 是软信号（`load_pressure / compute_bound_prediction /
optimization_route`），不是硬淘汰。

## 3. 环境

| 环境 | 关键事实 |
| --- | --- |
| 本地 x86 | `aarch64-linux-gnu-g++` 16.1.0、`aarch64-linux-gnu-objdump`、`qemu-aarch64` 11.0.3、交叉 sysroot `/usr/aarch64-linux-gnu`（`QEMU_LD_PREFIX`） |
| ARM N1（129.146.162.16） | Ubuntu 24.04、2 vCPU Neoverse-N1、GCC 13.3.0、NEON+DotProd（无 SVE）、`build/x265-8-gcc`、perf 可用 |
| 鲲鹏 920B（124.70.206.229） | openEuler 24.03、2 vCPU HiSilicon、**SVE v1（无 sve2 flag）**、默认 VL=256（`sve_default_vector_length=32`）、NEON 4×128 / SVE 2×256；工具链仅 python3，sudo 免密；详见 `experiments/m10-sve-16x16/kunpeng920b-environment.txt` |
| 鲲鹏 N+2（960，目标） | SVE2.3、SVE 4×256、NEON 4×128，尚未定型 |

## 4. 已完成里程碑与证据

| 里程碑 | 结果 | 证据位置 |
| --- | --- | --- |
| M0 | N1 NEON 基线：8x8 26.3 ns / 80.4 cyc / 115.9 insn；16x16 275.0 / 487.8；TestBench 通过；静态 116 / 481 条 | `experiments/m0-foundation/` |
| M1 | SpecIR canonical + C oracle + range proof | `experiments/m1-contract/` |
| M2 | LLVM IR → MachineIR(167) → PackIR(149)；NEON roundtrip 116 条与上游一致，100k diff 0 | `experiments/m2-seed/` |
| M3 | AArch64 语义/成本/静态分类器 | `experiments/m3-cost/` |
| M4 | NEON 搜索三轮负结果（cand-0001/2/3、UMAXP 布局不可行）→ 转向 16x16/SVE | `experiments/m4-search/` |
| M6 | SVE2 功能基线（tbl2 后端，QEMU 100k） | `experiments/m6-sve/` |
| M7 | 官方 ARM ISA XML 覆盖检查；dotprod/i8mm 补齐；`requires` 组合门控 | `experiments/m7-isa-coverage/` |
| M8 | 16-lane 双 tile 打包 + VL=512 索引越界修复；`blocked-environment` | `experiments/m8-sve-pack/` |
| M9 | typed TRN lowering（24 tbl2+48 ld1h+24 mad → 24 trn）+ raw half-R8 x2 helper；静态 single 117 / x2 125 / x2raw 116 | `experiments/m9-sve-trn/` |
| M10 | 16x16 两次 wave wrapper（+23 条）；guard 8/8；VL 日志；identity；长门禁本地全过（VL=256 1M、VL=512 200k、vq=1 预期失败、guard 8/8）；ASan 待补 | `experiments/m10-sve-16x16/` |

提交基线：GitHub `main` 最新为 `ea2ec47`（交接文档提交后更新）。

## 5. 代码/工具入口

- 生成：`kernels/sa8d/gen_roundtrip.py <machine-ir.json> <out.cpp>
  --backend sve2 [--pack x2] [--raw] [--shape 8x8|16x16]`
- codegen：`optimizer/ir/codegen.py`（`emit_sve_intrinsics`、
  `_sve_trn_spec` 六种 TRN mask、`emit_sve_16x16_wrapper`、raw 尾部形状
  断言、索引装载用活跃谓词防 VL=512 越界）
- 验证：`kernels/sa8d/sve_verify.cpp`（打印 `svcntb()`；single/x2/x2raw/
  16x16 差分；R8 偶数 parity lemma）、`kernels/sa8d/sve_guard.cpp`
- 构建：`scripts/build-sve-sa8d.sh`（支持 `CXX`/`OBJDUMP`/`SVE_MARCH`/
  `QEMU_LD_PREFIX` 环境覆盖；本地交叉示例见 `experiments/m10-sve-16x16/
  manifest.yaml` commands）
- 计数：`tools/count_asm_insns.py`（`OBJDUMP` 可配；注意 SIMD 分类是
  `z/p/v` 正则，向量 load 会双计——融合分析器必须互斥分类）
- TargetFeatures：`optimizer/targets/aarch64/features.py`（含新增
  `sve_vl256()`；依赖自动生效）
- 指令库/目录：`isa/aarch64/instructions.yaml`、
  `experiments/m7-isa-coverage/isa-catalog.json`
- 其他工具：`tools/plan_report.py`、`tools/isa_catalog.py`、
  `tools/isa_coverage_report.py`、`kernels/sa8d/fold_synth.py`、
  `optimizer/ir/provenance.py`

## 6. 专家建议归档与频率

- `expert-advice/round-0001`：aborted（用户中断，无 response）
- `round-0002`：NEON 重排方向（语义/umax/rounding 修正、UMAXP 实验）
- `round-0003`：SVE 双 tile 打包审阅 → M8/M9
- `round-0004`：16x16 门禁建议 → M10
- `round-0005`：**需求 v0.3→v0.4 修订 + 执行顺序 P0'~P7'**（必读
  `response.md` 与 `decision.md`）

新频率（用户 2026-08-13 修订，已写入 docs/06 与两个 README）：

- **每完成三个实际优化迭代请求一次**（round-0006 起按批次，一个 round
  对应 3 个阶段）；
- 请求用 `codex -p sss -c 'model="gpt-5.6-sol"' -c
  'model_reasoning_effort="max"' -s read-only ... exec -o
  expert-advice/round-NNNN/response.md`；
- **只读后台异步**：主模型不阻塞等待，响应落盘后在下一次自然检查点写
  `decision.md`；不可用/失败只记 `blocked.md`，不得伪造。

## 7. 下一步任务（按 P0'~P7'）

1. **P1' 剩余门禁**：
   - ASan/UBSan（本地补 aarch64 libasan 或 920B 上跑）；
   - 真实 vq=1 dispatch 拒绝：实现运行时 feature/VL dispatch，验证
     VL<256 时候选注册数为 0、调用次数为 0（不能把“直接调用候选产生
     mismatch”当通过）。
2. **P2' 920B 实机闭环（最高优先级）**：
   - 安装最小工具链（openEuler dnf：gcc/g++/cmake/ninja/git/perf/
     libnuma 等）；新增 openEuler bootstrap 入口；
   - 同步仓库；**用 `-march=armv8-a+sve` 重建 4 个候选**（920B 是
     SVE1，不能用 `+sve2`）；扫描禁止 SVE2 opcode；保存新 compiler/
     flags/disassembly/hash；
   - native differential（确认 `svcntb()==32`；`PR_SVE_SET_VL` 请求与
     worker 线程 VL 继承验证）；
   - 扩展 `benchmarks/sa8d_microbench.cpp` 支持 16x16 candidate（当前
     只允许 8x8）；
   - paired PMU：candidate SVE256 vs 同机 NEON；保留门槛 >1.10 且
     CI 下界 >1.10；固定 vCPU、随机交替 A/B、≥30 个有效 pair、3 进程；
   - 确认 920B 是否有上游 SA8D SVE1 baseline（上游扩展在
     `pixel-prim-sve2.cpp`，大概率没有；以 configure/dispatch 为准）。
3. **P3'**：冻结 SA8D 源候选身份，启动 N1 可测 DCT8（默认 DCT8；若
   profile 显示 interp8 占比更高则服从 profile）。
4. **P4'**：融合静态 inventory（互斥分类 + `structurally_eligible`；
   融合表为空时预测节省为 `unknown`，不得驱动排序/搜索）。
5. **P5'~P6'**：目标融合对验证（专用 instruction-pair 微基准）→ 有
   `hw_supported` 证据后才排序 → 相关性验证后进搜索主循环。
6. **P7'**：N+2 profile（4×256、SVE2.3、融合表）与 b/c 分档验收。

## 8. 关键风险/坑

- **VL<256 静默错误**：`svwhilelt_b16(0,16)` 在 VL=128 只激活 8 lane，
  x2/x2raw/16x16 高半为 0；dispatch 必须拒绝 VL<256；
- **TBL2 fallback 是 SVE2**：未识别 shuffle 会生成 `svtbl2_u16`，
  920B（SVE1）不能跑；当前 SA8D 六种 mask 全部被 `_sve_trn_spec` 覆盖，
  但未来候选要按档位门控；
- **计数器双计**：`ld1b` 按 z 寄存器计入 SIMD，若再加 load_insns 会双计；
- **wrapper 23 条不含 raw helper**：16x16 动态成本须按最终 linked
  symbol/调用图统计；
- **raw 数学**：raw helper 返回 `(R8_A+R8_B)/2`（R8 恒为偶数）；
  16x16 = `(top+bottom+1)>>1`；
- **VL=512 索引越界**已修复（索引装载/运算用活跃谓词），勿回归；
- **920B 2 vCPU**：PMU 噪声大，固定 CPU、随机交替、多进程；
- **服务器同步**：origin 非 bare，用服务器 fetch+ff；rsync 多源会复制
  到仓库根，用 `scripts/sync-up.sh` 单源；
- **不伪造专家 response**；顶级模型只读后台运行，主流程继续；
- 云实例生命周期：920B 可能随时被用户停止/销毁，结果必须带实例存活期
  环境快照，销毁后不复用旧结果做验收。

## 9. 必读清单（压缩后先读）

1. `docs/README.md`（必读顺序与三档目标）
2. `docs/09-instruction-fusion-analysis.md`（需求 v0.4：估算、验收、融合
   条件、P0'~P7'）
3. `docs/06-agent-iteration-protocol.md`（迭代协议 + 专家咨询新频率）
4. `experiments/m10-sve-16x16/iteration.md` 与 `manifest.yaml`
5. `experiments/m10-sve-16x16/kunpeng920b-environment.txt`
6. `expert-advice/round-0005/response.md` 与 `decision.md`
7. `git status` 确认工作树干净；`git log --oneline -5` 确认基线
