# NEON/SVE → SVE2-256 优化计划与交接（2026-08-17）

执行者：下一个 agent（按本文档独立推进，不需要再问方向）。
来源：用户指令"NEON/SVE kernel → SVE2 256，优化这个 pattern，做计划并
交接"。权威协议见 `AGENTS.md` 与 `docs/59-handoff-20260816.md`。

## 0. 一句话目标

让"从 NEON/SVE 家族 kernel 生成 SVE2 VL=256（2x256，950/920G 形态）
候选"这条 lowering 管线产出的候选，在 950 实机上**真正比上游 dispatch
快**（kernel ratio CI 下界 >1.05，最好 >1.10 + Amdahl ≥0.3pp），并沉淀为
可复用的 region-schedule 模板；若在给定预算内无法做到，则归档并给出
按机回退方案（NEON/op-backend/frozen best9）。

## 1. 已知事实（必须作为输入，不要重蹈）

### 1.1 950 sve16 实机负结论（reports/950-sve16-dual-lane-20260817.txt，DB 8 行）

- `kernels/dct16|dct32/candidates/best_ir_sve16.cpp`（dual-group 16-lane，
  VL=256，0 NEON）在 950 上：TestBenchLite 6-seed 双编译器全 PASS，
  但实机明显更慢：
  - dct16：vs 上游 SVE 慢 2.19x（gcc16）/2.06x（clang22），vs NEON
    慢 3.49x/3.29x；
  - dct32：vs SVE 慢 1.70x/1.49x，vs NEON 慢 2.30x/1.86x。
- 静态 fused_uop 反而更少：dct16 sve16 640 vs op895 952（-33%）；
  dct32 sve16 897 vs opbase 1129（-21%）。**静态赢、实机输**。

### 1.2 950 op-backend 正控（同机 CNTVCT）

- dct16 op895 p50 ~172 vs sve ~250 / neon ~159：+45% vs SVE（但 NEON
  仍快 14%，x265 默认 SVE dispatch）。
- dct32 opbase ~2117 vs sve ~2179 / neon ~2280：parity。
- dct32 op4032 历史 +71% vs SVE / +40% vs NEON（非 bit-exact，等 C
  ref，策略门控，默认不发布）。
- 950 E2E：dct8/16/32 opbase 注入 30f **+0.79%**（bit-exact，
  bootstrap95 [54,98] ms）。

### 1.3 E2E 预估（回答"NEON→SVE256 性能"）

- **没有 sve16 家族 E2E 实测**。仅有的实机点：dct16/32 kernel 级为负。
- 按 dct 实测慢的倍数 × perf 占比粗估：若把 sve16 dct16/32 注入 950，
  E2E 预计 **-1.5%~-3%**（倒退），不是收益。
- 其余 15 个 sve16 候选（mc/sad/ssd/satd/sa8d/interp8）无实机数据；
  静态 fused_uop 是 NEON 的 1.6-6x（sad 0.17、ssd 0.20、interp8 64x64
  0.45），方向为负，不给数值承诺。
- 历史反例：satd pure-SVE（710 E2E -2.63%）、i8mm（920B kernel ratio
  0.31、E2E +0.87% 慢）、sao QEMU-only。历史正例：op-backend 融合形态、
  scan rbit+pext ~1.5x、best9 三机 +2.0~2.7%。

### 1.4 根因假设（需要实验验证，不是结论）

1. **TBL/打包关键链**：dual-group 的 tbl2/uzp/zip/unpk/combine4 增加
   延迟链，即使总 uop 更少（与 round-0029 推断一致）。
2. **未保留生产调度**：上游 SVE/NEON 用"4 行批处理 + perm 复用"；
   sve16 按 16-lane 双组逐块映射，pack 开销大。
3. **宽度原生替代**：VL=256 下 u8 原生就是 32 lane、s16 是 16 lane、
   s32 是 8 lane；dual-group 16-lane 设计可能只是 VL=128 兼容性的产物，
   在 2x256 上应优先试**单组全宽**（u8x32/s16x16/s32x8）布局，避免打包。
4. **编译器轴**：gcc16 vs clang22 方向一致但 clang 更接近基线；
   需对比 -O2/-O3 与关键原语内联 asm（load/归约已用 asm，tbl/打包未试）。

## 2. 计划（按信息增益排序，每阶段有门禁与退出）

### P0 基准与 harness 校准（950 可用时，约 0.5 天）

- 用现有 `benchmarks/preload_verify_dct.cpp` 同款 CNTVCT paired 法，
  在 950 上把当前 sve16 全族（17 候选）vs 各自上游 dispatch（SVE/NEON）
  跑一遍并入库；harness 必须先用 **op895 正控**验证（期望 ~1.45x vs
  SVE），正控不过则 harness 无效。
- 产物：reports/950-sve16-family-microbench-*.txt + DB 17-34 行。
- 退出：确认当前族全部负收益（预计），进入 P1；若意外出现 kernel 赢
  家，直接进 P4。

### P1 关键链原语微基准 + 静态特征（可本地并行，约 1 天）

- 950（或 920B/710 先跑）对 TBL/TBL2、ZIP/UZP、UNPK、SDOT（HtoS/BtoH）、
  窄化、LD/ST 分别测**串行依赖链 vs 8 路独立链**，VL128/256 各一组；
  数据回答"哪个原语是该机的延迟瓶颈"。
- 本地部分（不依赖实机）：扩展 `tools/static_counts.py` 输出
  **关键路径 permute 深度**（final-object def-use，参考
  `optimizer/ir/lane_defuse.py` 的 lane 粒度 def-use），作为候选特征。
- 产物：reports/sve2-256-primitive-latency-*.txt、static_counts 新字段、
  DB 行。

### P2 region-schedule 模板与宽度原生 lowering（核心，约 3-5 天）

1. **反推 op-backend 模板**：从 `kernels/dct16/candidates/best_sve2_op895.cpp`
   与 `kernels/dct32/candidates/best_sve2_opbase.cpp` 提取
   quarter/odd-quarter、row-group、pack/系数复用、dot→归约→窄化→连续
   store 的结构，写成 `optimizer/ir/` 下的 region 模板（参考
   `optimizer/ir/dual_sve16.py` 结构）；门禁：TestBenchLite 6-seed +
   20k diff + 0 NEON，**先复现 op895/opbase 的 bit-exact 输出**。
2. **宽度原生 lowering**：新增单组全宽 schedule（u8x32/s16x16/s32x8），
   与 dual-group 并列；目标是消灭 tbl2/pack 关键链。
3. **搜索轴**：跨行 batch、预排系数、窗口/pack 复用、shuffle 消除、
   归约树、窄化/store 融合；lane 宽度只作一轴。dct16 与 dct32 各生成
   ≤32 个合法候选，要求 0 失配、0 非预期 spill。
4. 门禁命令参考：
   `AGO_IR_SVE16=1 python3 tools/build_preload_so.py --isa sve2 --vl 32
   --kernels dct16,dct32 --opt=-O3 --out build/dct-sve16-v2.so`
   以及 `python3 -m unittest tools.test_dual_sve16 -v`。

### P3 实机门（950，约 1-2 天）

- CNTVCT paired direct-call，vs **实际 dispatch 基线**（950 上 SVE
  覆盖 NEON；dct16 也单独对比 NEON，因为 NEON 快于 op895）。
- 晋级门：ratio bootstrap95 下界 ≥1.10 且 Amdahl 投影 ≥0.3pp；
  先用 op895 正控校准阈值（若 1.10 过严则记录并放宽到 1.05，写明理由）。
- 负控必须失败：当前 sve16、satd pure-SVE、i8mm、sao（任一负控被
  放行即证伪该门）。

### P4 950 E2E A/B（0.5-1 天）

- 赢家候选打包注入（`AGO_IR_SVE16=1 --isa sve2 --vl 32`），30f/100f
  paired + bit-exact md5 门；基线 = frozen best9+dct IR 或上游。
- 期望：kernel 级赢 → E2E 增量 ≥0.2pp 且 CI 不跨零；否则按 P3 归档。
- 入库 + docs/63/72/77/78 更新 + 三端推送。

### P5 通用性验证（interp8-hpp，1-2 周内）

- 把 dct region 模板迁移到 interp8-hpp：复现上游 dotprod 的
  "4 行批处理 + perm 复用"（上游实机 1.6%→注入版 i8mm 3.7% 的教训：
  不能和简化基线比）。
- 验收：两批 bit-exact、kernel CI 下界 >1、E2E 增量 ≥0.2pp 且 CI
  不跨零。失败即归档，不铺新家族。

### 总退出条件

两家族各 ≤32 候选后仍无 bit-exact 候选在 950 上 kernel ratio CI 下界
>1.05，或 Amdahl 投影均 <0.3pp → 冻结 sve16 扩展，输出按机回退：
- 950：dct16 保持 NEON dispatch（NEON 比 SVE 快 14%），dct32 用
  opbase，可选 op4032（策略门控）；
- N1/710/920B：维持 frozen best9+dct IR（docs/73）；
- 960（SVE2p3 4x256）：interp4/interp8 path-B 等 SVE2p3 候选单独评估。

## 3. 执行 agent 协议（必须遵守）

- 先读：`AGENTS.md`、`docs/59`、`docs/70 §0b`、`docs/72`、`docs/77`、
  `expert-advice/round-0029/{response,decision}.md`、
  `reports/950-sve16-dual-lane-20260817.txt`。
- 任何测量先 `python3 tools/kernel_db.py add '...'` 再 `export-md`；
  DB 行、报告、docs 同一 commit，推 origin/yitian/github 三端。
- 代码改动提交前跑三套回归：
  `python3 -m unittest discover -s tools -p 'test_*.py'`、
  `-s optimizer/ir`、`-s optimizer/ago`。
- 950 访问在用户侧：`FROZEN=1 scripts/freeze-950-dct.sh user@host`
  （E2E）；kernel 微基准直接 scp .so / 二进制后 CNTVCT paired。
- 机器红线：N1 工作树禁 checkout/reset；920B 是 SVE1（sve2p1/p3
  SIGILL），100f 用 `/tmp/real_1080p_100f_b.yuv`；710 直接
  `git push yitian`；950 媒体从 GitHub release `e2e-media-20260816`
  下载（docs/63 §0）。

## 4. 关键文件索引

- lowering 引擎：`optimizer/ir/dual_sve16.py`、`dual_sve16_families.py`
- 现有候选：`kernels/*/candidates/best_ir_sve16.cpp`（17 个）
- op-backend 正例：`kernels/dct16/candidates/best_sve2_op895.cpp`、
  `kernels/dct32/candidates/best_sve2_opbase.cpp`、`op4032.cpp`
- 门禁/打包：`tools/build_preload_so.py`（AGO_IR_SVE16）、
  `tools/check_isa_level.py`（--no-neon/--level）、
  `tools/testbench_lite.cpp`、`tools/test_dual_sve16.py`
- DB/协议：`data/kernel-test-db.csv`、`tools/kernel_db.py`、
  `AGENTS.md`、`docs/67`
- 规划：`docs/70 §0b`、`docs/72`、`docs/77`、
  `expert-advice/round-0029/`
