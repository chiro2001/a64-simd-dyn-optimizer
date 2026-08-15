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

- [ ] 穷举有限表/转移检查（PEXT/DFA）；
- [ ] 受保护回退（fallback）；
- [ ] 生产逐调用差分 + canary + 真实分布回放；
- [ ] 非劣于冻结发射器（best7）。
