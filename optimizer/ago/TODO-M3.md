# M3：显式 loop/FSM 模板 + 生产差分 + 注入冻结（round-0023/0024）

## 已知赢法分类（round-0024 decision）

| 赢法 | 语义状态 | 目标实现 |
| --- | --- | --- |
| 4-bit PEXT 查表 | 数据表示/控制 rewrite（mask 压缩 → 有限表查找），带对齐/尺寸/前置条件 | NEON/scalar/查表 cover 模板 + guarded fallback |
| DFA 状态表 | 语义 `state × symbol -> (next, add)` rewrite，有限转移证明 + 大值 fallback | 参数化表加载/索引 cover；目标变体 |
| 全展开 | 有界结构变换，按 trip count / 代码尺寸预算 | 结果直线 region 的 schedule/cover 模板 |
| NEON tail 语义 | lowering 契约：精确 tail lanes、指针 footprint、无 over-read/guard | tail cover 模板 + canary/guard-page verifier |

## 最小可组合接口（round-0024）

```text
Pattern.match(region) -> bindings | no-match
RewriteRule.apply(region, bindings) -> new_region + ProofObligations
CoverTemplate.emit(region, bindings, target) -> MachineIR + ProofObligations
Verifier.check(contract, artifact, obligations) -> evidence | failure
```

每个 rule/template 声明：id、phase、effect summary、shape/alias
precondition、递减/有界度量、参数规范序列化、fallback。

## 验收（round-0023）

- [x] PEXT：穷举 3^16 对 bad=0 + scanPosLast 20k 差分双机 bad=0 +
  模板微基准 N1 1.6x / 920B 2.2x（reports/ago-m3-pext-template-20260816.txt）；
- [x] DFA：5x3x256 穷举 bad=0 + costCoeffRemain 20k 差分双机 bad=0 +
  微基准 N1 1.24x / 920B 1.38x（reports/ago-m3-dfa-template-20260816.txt）；
- [ ] 受保护回退（fallback）；
- [ ] 生产逐调用差分 + canary + 真实分布回放；
- [ ] 非劣于冻结发射器（best7）。

## 端到端现状（2026-08-16）

- 真实 1080p 30 帧 920B E2E：基线 8194 ms vs best6b 8046 ms
  （-1.61%，bootstrap [119,166] ms，bit-exact）；
- 优化版 perf 热点与下一步回归矩阵计划：
  reports/e2e-best6b-perf-20260816.txt。

## SVE1.0 搜索目标（2026-08-16 用户拍板）

- [x] docs/52 增补 sve1 为一等目标（ISA/成本表/门禁/候选来源）；
- [x] gen 后端 --isa sve1 首轮搜索 satd-8（pack-1/pack-2，20k 0 失配，
  SVE1-only 反汇编）；
- [x] 920B paired：pack-2 慢 1.87x（3609 vs 6731 ticks）→ 不可注入；
- [x] pack-2b（并行 uaddv 尾部）20k 差分 0 失配，实测仍 1.82x 慢
  （瓶颈在 cadd90/tbl/ld1ub 链）→ satd/sa8d 家族 920B 保持 NEON；
- [x] 记录 AGO 预测器 SVE1 失效（SVE 表过乐观）：
  reports/sve1-satd8-search-920b-20260816.txt；
- [x] 重建 920B SVE1 指令成本表 v1（sve1-class-timing.c ->
  timing-sve1-ago.json：add/sub/mul/abs/sabd/mla/uaddv/tbl/ld1b/sdot，
  依赖链 + 8 独立链，min-of-7）；
- [x] 实现 CP 感知 SVE1 预测器（predict_sve1，v1 表 + 依赖链注释）+
  单测；量化校准缺口：NEON 预测 132.6 vs 实测 25.6 cyc/call（5.2x
  过估），SVE1 预测 69.2 vs 47.6（1.45x 过估）——绝对跨 ISA 排序
  不可用，SVE1 内部相对排序 + 920B paired 兜底；
- [ ] 预注册 SVE1 排序门（候选语料形成后冻结）：语料 = SVE1 候选
  （pack-1/2/2b + 后续），真值 = 920B CNTVCT paired 中位（MDE=1%），
  通过 = 可分辨对 ≥2/3 与 predict_sve1 同向，且胜者实测非劣于
  上游 NEON 才允许注入；
- [ ] dct16/interp8 SVE1 搜索被工具缺口阻塞：gen 无 dct recipe、
  op 后端 sve1 过滤后全部 BUILD FAIL；需先补 SVE1-safe 发射模板
  （AGO cover 层 sve1 发射器），再搜索宽行家族；
- [x] **定位调整（docs/53）**：920B 全量 SVE1 证据均为负 → 920B 主攻
  NEON；SVE1 降级为“实测非劣才注入”特例；SVE2 方向以 950 为准。
- [x] SVE1 原生重排 satd8 探索（2026-08-16）：TBL 双层水平 hadamard
  方案 Python 模拟 5000/5000 正确（tools/ago_sve1_satd8_design.py），
  但指令预算 ~184 vs pack-2 92，不占优 → **SVE1 satd8 方向停止**；
  SVE1 只保留实测非劣特例，SVE2/950 继续。

## satd16 收益根因与内联修复推广（2026-08-16）

- [x] 根因定位：上游 16x16 慢 = GCC12 将 hadamard_4x4_quad 外链
  （4 次 bl + 栈往返）；候选全内联 → 1.51-1.63x 快（对照实验排除
  编译器版本）；报告 reports/satd16-inline-gain-analysis-20260816.txt；
- [ ] emit_satd_neon_shared 增加 satd 8x16/16x8 内联发射（预期类似
  收益）；20k 差分 + 920B paired + 注入 E2E；
- [ ] 扫描 lib 其它 NEON helper 外链（hadamard_4x4_dual/8x8、
  sa8d/sad 家族），批量生成内联候选。

## satd 8x16/16x8 内联候选（2026-08-16 完成）

- [x] emit_8x16/emit_16x8（全内联）+ build_preload_so 注册 + best_sve1
  重新生成（6 形状）；
- [x] 20k 三方对照（ref/dyn/oracle）双机 bad=0；920B paired
  8x16 1.34x / 16x8 1.33x；
- [x] E2E 注入复测：-1.61% → **-1.76%**（8061 vs 8200 ms，bit-exact
  ee5db7），报告 reports/satd-8x16-16x8-inline-20260816.txt；
- [ ] 全库 helper 外链扫描（hadamard_4x4_dual/8x8、sa8d/sad 家族）。

## helper 外链扫描结果（2026-08-16，reports/helper-bl-scan-920b）

- [x] 扫描完成：satd C 模板 205+74 处（非热点）、filter8_u8x16 244 处
  （interp8 vps 真实热点 ~5%）、filter4 114 处、sa8d16 30 处、
  hadamard_4x4_quad 7 处（已修复）；
- [ ] **interp8 vps 内联候选**（filter8_u8x16 全内联）：20k + 920B
  paired + 注入；
- [ ] interp4 filter4 / sa8d16 32/64 内联候选（次优先）。

## interp8 filter8 外链验证（2026-08-16 完成）

- [x] 微基准证实外链 vs 内联差距 **~2.0x**
  （reports/filter8-inline-gain-920b-20260816.txt）；
- [ ] interp8 vps/hps 内联候选（覆盖 luma_vps/luma_hps 热点形状）：
  20k + 920B paired + 注入 E2E（下一轮主任务）。

## interp8 vert_ps 16x16 内联验证（2026-08-16 完成）

- [x] 内联候选 20k 差分 bad=0；920B paired **~1.5x 快**
  （3630 vs 2400 ticks；reports/interp8-vps16-inline-20260816.txt）；
- [ ] 多形状 + coeffIdx 1/2/3 分派的内联候选注入（luma_vps 热点形状）
  + 20k + 920B paired + E2E。

## interp8 vps 内联注入（2026-08-16 完成）

- [x] 6 形状候选 + 60 万矩阵差分 0 失配 + 920B paired 1.30-1.81x；
- [x] best8 注入 E2E：**-1.92%**（8028 vs 8192 ms，bit-exact）；
  报告 reports/interp8-vps-inline-inject-20260816.txt；
- [ ] 同型跟进：interp8 hps/vsp/vss、interp4 filter4、sa8d 32/64。

## interp8 hps 验证（2026-08-16 负结果）

- [x] hps 内联候选 20k 干净，但 920B paired 仅 1.06x（无 filter8
  外链，不注入）；报告 helper-bl-scan 更新；
- [ ] interp4 filter4_sp/ss_s16x8 内联候选（58/56 次 bl，真实外链 +
  vert_sp 热点）：20k + 920B paired + 注入。
