# Round 0024 decision

状态：response.md 于 2026-08-16 落盘（487 行；会话按成本控制
在 ~385k tokens 截断，deliverable 已完整）。执行 Agent 处置如下。

| 建议 | 处置 | 证据/理由 | 对应下一轮 |
| --- | --- | --- | --- |
| M2 拆成两段：先冻结 SATD8 基线复现 + 候选清单/特征/噪声探针/排序评估（首个门，不要求加速）；再扩大枚举器做正式留出排序门 | **accept** | 本轮的 A/B/C 门只有 2 个可分辨对、共享前缀、无 layout/schedule/RA 变化，是 foundation 冒烟而非泛化排序证据；报告已写明边界（reports/ago-m2-satd8-covers-20260816.txt §5） | M2-expanded 门（TODO-M2 已更新） |
| 现有 A/B/C 结果记为 foundation/conditional，不升级为通用排序声称 | **accept** | 与报告结论一致 | README/TODO 措辞已修正 |
| 不做通用 graph-discovery、不学 cost model、不写自定义 RA；小规模 schedule 搜索 + 真实编译器分配在范围内 | **accept** | 与 round-0023 范围一致；自定义 RA 延迟到“分配是主导误差”的证据出现 | M2-expanded 保持 |
| N1 模型只是先验/排序候选项，不是 ranking oracle；920B 是独立 on-target profile，不能因同为 128-bit NEON 就当 N1 克隆 | **accept** | 920B 无 PMU、端口/load 队列/编译器 lowering 都可能重排；docs/52 §4 已是分表 | 920B 走 transfer 规则（≥10 可分辨对、≥0.60 符号一致、无 CI 分离回归，否则 transfer-unknown） |
| 扩大排序门的语料/指标：≥8 region 实例、每实例 3 cover、≥24 个不同 final object、按家族留出、≥30 可分辨对、q_target/MDE 噪声规则、0.75 成对准确率 + bootstrap 下界、tau≥0.60 或 rho≥0.70、top-1 regret≤max(2q,3%) | **accept（结构）** | 数值常数（q_target/MDE）只能在噪声探针后预注册；先接受协议结构，语料收集后冻结数值 | M2-expanded gate 预注册 |
| 候选 manifest 冻结：contract hash、region/node ID、模板参数、ISA、编译器版本/flags、源与 final-object hash、验证证据；同 final object 去重 | **accept** | 保证结果可归因，避免“同一对象算多样性” | M2-expanded 实现首项 |
| 解析代价公式：predicted = max(关键路径延迟, max_resource(uops/容量)) + load/store + spill/branch + 不确定性；禁止 latency×throughput | **accept** | 相乘双重计数；当前 tput_sum 仅是冒烟代理（covers_satd8.py 已注明） | 替换预测器（M2-expanded） |
| Pass 管线：phase-once + 显式 phase ID/来源记录；删除隐式重复直到稳定 | **accept（已实现）** | passes.py 改为单遍应用 + 固定点校验（不幂等即报错）；测试全绿 | 后续 pass 记录 before/after hash |
| N1 计时审计：当前 neon_timing.c 每轮 2 op、无 matched empty loop，JSON 标为“compiler-shaped 首版”，不是单指令表 | **accept** | 文件事实与专家一致；加入手写 asm 校准臂（matched empty loop） | 实验 2 |
| 920B SVE 表不能当 NEON 指令表（缺字段、只测选定 SVE 形态） | **accept** | 已是独立 SVE 表，不用于 NEON 单指令权重 | 维持现状 |
| 分层范式：语义层（typed region + packs/lane maps/effects）、搜索层（有限 layout/cover grammar + schedule + baseline）、机器层（final-object 分配/反汇编/成本特征 + abstaining ranker）；先做 cost/rank 基础设施，再有限枚举，再一个语义 rewrite | **accept** | 与 docs/52 愿景一致；信息增益排序合理 | M2-expanded → M3 |
| M3 已知赢法分类：PEXT/DFA 为语义 rewrite（带有限表证明/fallback），全展开为有界结构变换，NEON tail 为 lowering 契约 + guard-page/canary | **accept** | 避免目标专用 asm 变成语义权威 | TODO-M3 记录 |
| CoverTemplate 双协议接口：Pattern.match / RewriteRule.apply(+ProofObligations) / CoverTemplate.emit(+ProofObligations) / Verifier.check；每规则声明 id/phase/effect/precondition/度量/参数序列化/fallback | **accept（设计）** | 最小可组合接口，M3 实现 | TODO-M3 |
| 失败模式表（噪声、clone cover、过拟合、spill、计时伪影、边界、pass 爆炸、E2E 转化）作为 M2/M3 ledger，并区分 foundation-only / inconclusive-noise | **accept** | 与 docs/06 协议一致 | 后续 iteration 使用 |
| 三个实验排序：① 手写 cover 的噪声探针 + 留出排序审计；② N1 PMU 校准 + 跨目标转移矩阵；③ 有界 SATD8 region→layout→cover→schedule（≤24 候选） | **accept** | 先验证排序工具，再开搜索；③ 不写自定义 RA、不塞 M3 表 rewrite | 下一步：实验 ①+② 并行启动 |
| 不允许 M2 声称 E2E 编码收益 | **accept** | M3/M4 才有 replay/非劣性门 | 维持 |

## 未接受/延期的条目

- 专家建议“先手写 cover 再建枚举器，排序审计是第一个 M2 门”：接受其顺序，但
  我们已有 A/B/C 冒烟管线（foundation），不重复建设；直接在其上加语料/特征/
  噪声协议。
- “24 个最终对象”在 satd8 单一 kernel 上可能不可达：若语料不足，按协议记
  `foundation-only` 并明确推迟排序声称，不硬凑对象数。
