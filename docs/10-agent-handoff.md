# Agent 交接上下文（2026-08-13，M11/M12/M13 后）

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
- **M13（本轮，accepted）**：LLVM importer 扩展 + DCT8 NEON roundtrip：
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

1. **P3' 继续：DCT8 首轮优化（tier a，当前最高价值）**：
   - 先做 C-exact 修复：pass2 奇数列 O 用 `vsubl_s16` 提升 s32（消除
     上游 s16 回绕 bug），回归 oracle==cand（候选门禁从“复现 NEON”升级
     为“==C 参考”）；修完才有资格上 N1/920B paired；
   - 再做指令选择/布局搜索：`vmull+vpaddq` 配对链、`rev64/zip` 重排、
     常量复用；目标 N1/920B paired latency 从 0.807×/0.961× 向 1.30×
     推进。
2. round-0006 response 落盘后写 decision.md，按建议优先级排下一轮实验。
3. **P4'**：融合静态 inventory（互斥分类 + `structurally_eligible`；
   空融合表时节省为 unknown，不驱动排序/搜索）。
4. **P5'~P6'**：目标融合对验证（instruction-pair 微基准）→ 有
   `hw_supported` 证据后才排序 → 相关性验证后进搜索主循环。
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
