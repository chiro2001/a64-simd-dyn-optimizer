# docs/83: AGO 自动搜索续接 — manifest 修复 + 家族扩展 (2026-08-18)

> 承接 docs/78-82 主线（NEON/SVE → SVE2-256 优化 + AGO 自动搜索）。
> 本文档记录本轮会话的本地可完成项；950 实机验证仍在用户侧。

## 0. 本轮改动摘要

1. **dct32 ago 后端 manifest 计数 bug 修复**（docs/82 "manifest 待修"
   闭环，详见 docs/82 文首更新节）：
   - 根因：ago cover 源把 kernel 放在 static `op_pass_4/op_pass_11`
     助手内，导出符号 `dynopt_dct16/32_sve2_shared` 只是薄 wrapper；
     `search_sve2_layouts.py` ago 后端按 wrapper 符号范围做 QEMU
     trace 只统计到 ~14 条指令（fused_uop=0、vector=0）。
   - 修复：ago+dct16/dct32 改走**全对象 static_counts**
     （`measure_layout_candidate` 专用分支），与 ago_auto_search 同源，
     匹配 docs/79 实测（dct32 761/1129、dct16 950/1019）；缓存键 bump
     `|count=whole-object-static` 防旧错误计数复用。
   - 验证：dct32 ago 排名 cover-A (loop) 416 vs cover-B (opbase) 1087
     （-O2 编译口径，-O3 为 761/1129），ago_pred NP1 890.2 vs 1701.2，
     cover-A 继续胜出，与 docs/79 一致。dct16/interp8 同步验证通过。

2. **家族扩展（docs/82 下一步 #4 完成）**：新增 3 个 cover 模板
   （包装现有候选）+ `ago_auto_search.py` 改为**免 manifest 直接
   发射**（psy-cost 无 manifest 也能跑）：
   - `optimizer/ago/covers_satd16.py`：A=best_sve1 (8.0%) 胜
     B=best_ir_sve16 (58.8%)
   - `optimizer/ago/covers_sad.py`：B=best_ir (0.0%,66) 胜
     A=best_sve2 (0.0%,80) 胜 C=best_ir_sve16 (54.7%)
   - `optimizer/ago/covers_psycost.py`：A=best_sve2 (30.8%) 胜
     B=best_ir_sve16 (42.6%)，⚠ 均 ≥30% 阈值
   - `search_sve2_layouts.py` ago 后端注册 sad/satd-16（有 manifest，
     全管线 QEMU 验证通过；sve16 封面因符号不匹配 manifest 合同
     LINK FAIL——语义正确）
   - 排序与 docs/81 scan 数据完全一致 → 自动搜索复现了手动结论。

3. **DB 入库（280 行）**：3 条 scan-permute（over30=25/11/5）+
   6 条 ago-auto-search 验证行（interp8/dct16/dct32/sad/satd-16/
   psy-cost）。`export-md` 已重生成。

4. **interp8 950 microbench 驱动就绪**（docs/80 下一步 #2）：
   `benchmarks/preload_verify_interp8.cpp` +
   `scripts/microbench-950-interp8.sh`（本地交叉编译语法验证通过；
   950 实机跑 `scripts/microbench-950-interp8.sh user@host`）。

## 1. 回归

- tools 80（含 QEMU 差分）+ ir 50 + ago 70（含 9 个新 cover 测试）
  全部 PASS。

## 2. 工具链漂移警告（docs/79 数字复核）

复核 docs/79 的 neon_bridge 静态数（950 fused / 12.0% permute）时发现
**当前工具链下不可复现**：`kernels/dct16/candidates/
best_wide_sve2_neon_bridge.cpp` 自 9730146 起未变、发射器输出一致，
但 gcc 16.1.0 `-O3 -march=armv8.2-a+sve2` 给出 1019/25.3%
（cp_lat=62、perm=25、cp_len=99）；`-O3 -frename-registers
--param=sched-pressure-algorithm=1` 918/25.0%（perm=7、cp_len=28）；
clang 22 1137/42.1%。均无法回到 docs/79 的 950/55/25/3/12.0%。
op895 用同一工具链精确复现（952/18.5%）——差异集中在 neon_bridge
的 pass2 代码生成，判断为 gcc 升级导致的调度/内联漂移。

影响：docs/79 的"neon_bridge permute 优于 op895（12.0% vs 18.5%）"
结论在现工具链下反转（25.3% vs 18.5%），但 **docs/82 的自动搜索排序
不受影响**（dct16 由 op895 胜出是两种工具链下的稳定结论；interp8
svdot32 20.5%、dct32 loop 19.4% 均精确复现）。950 实机仍是最终仲裁
（docs/79 门禁本来就是 kernel ratio CI 下界，不依赖静态数字）。
新候选的静态数一律以 ago_auto_search 现工具链输出为准。

## 3. 未提交批次清单（本次 commit 内容）

- docs/80（P5 interp8 svdot32）、docs/81（permute_ratio 全家族分析）、
  docs/82（AGO 自动搜索集成 + 本轮更新）、docs/83（本文档）
- interp8 svdot32 发射器 + 3 候选 + 测试
  （`optimizer/ir/interp8_wide_sve2.py`、
  `kernels/interp8/candidates/best_wide_sve2_svdot32{,_16x16,_32x32}.cpp`、
  `tools/test_interp8_wide_sve2.py`）
- AGO covers：interp8/dct16/dct32/sad/satd16/psycost + 测试
- `tools/ago_auto_search.py`、`tools/scan_permute_ratio.py`、
  `tools/test_scan_permute_ratio.py`、
  `optimizer/templates/`（loop_ksections/neon_bridge/svdot_s32_direct）
- `benchmarks/preload_verify_interp8.cpp` +
  `scripts/microbench-950-interp8.sh`
- `tools/search_sve2_layouts.py`（ago 后端 + manifest 修复 + 家族注册）
- `tools/build_preload_so.py`/`scripts/freeze-950-dct.sh`（AGO_WIDE_SVE2）
- `optimizer/ago/objfeatures.py`/`predict.py`（static_counts 桥接）
- scan-permute 报告 3 份 + DB/MD（280 行）
- `.gitignore` 增 `/tmp/`（P2 调试残留，被正式测试取代）

## 4. 下一步（优先级）

1. **950 实机（用户侧）**：`scripts/microbench-950-interp8.sh user@host`
   （svdot32 vs best_sve2 正负控）+ `AGO_WIDE_SVE2=1
   scripts/freeze-950-dct.sh user@host`（E2E A/B）→ 结果入库 + docs
   更新（docs/63/72/77/78/79/80）。
2. psy-cost 补 manifest（candidate symbol/verify src/trace driver），
   走全管线 QEMU 验证；若实测慢，做 svdot_s32 式宽度原生 lowering。
3. 代价表 Feedback Loop：把 950 实测 kernel 结果回流 NP1/920B 代价表
   （docs/82 下一步 #3），校准 ago_pred。
4. 自动 cover 发现（docs/82 下一步 #5）：按 region-schedule 模板枚举
   变体，而非预定义 A/B/C。
5. satd-16/sad 的 width-native 候选：satd-16 的 best_ir_sve16 58.8%
   与 dct16 sve16 同型（dual-group 高 permute），可套 dct16 的
   neon_bridge/loop 模板重做。
