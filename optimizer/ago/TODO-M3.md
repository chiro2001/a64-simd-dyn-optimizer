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
- [x] 记录 AGO 预测器 SVE1 失效（SVE 表过乐观）：
  reports/sve1-satd8-search-920b-20260816.txt；
- [ ] 重建 920B SVE1 指令成本表（CNTVCT paired，依赖/独立链口径），
  重排 SVE1 候选并加入 sve1 排序门；
- [ ] AGO cover 层增加 sve1 发射模板（接 M2 排序器）。
