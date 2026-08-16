结论：最优组合不是把枚举器做大，而是“热点/真实分布驱动的语义模板＋类型化有限搜索＋分机型、会弃权的排序器”。M2的17实例只证明SATD/SA8D近邻cover排序可用（N1 acc 0.975、tau 0.951），未覆盖新家族、内存、RA和跨ISA泛化；7-kernel IR bundle E2E中性，而PEXT/DFA使scan达-1.6%～-1.8%、remain再贡献约0.25pp，说明最大杠杆在“搜什么”。

## 1. 如何逼近最优

- 搜索空间投入产出最高：按Amdahl分数 hot_share×(1-1/speedup)选目标；在带lane map、VL、溢出/舍入、alias/effect的region内，先枚举表示/表化/FSM/融合，再枚举layout、pack、tile、cover、少量schedule和unroll；基线永远入选。用规范哈希去重、支配关系和可采纳下界剪枝，最终对象交给真实编译器分配。
- 成本模型次之：每台机器/VL独立，采用max(关键路径，资源吞吐下界)+内存层级+spill/分支+代码尺寸/I-cache，并从final object取特征；N1→920B现有迁移只能作先验，710/950不能外推。
- 学习式排序排第三：达到数百个独立对象后，只学解析模型残差/成对次序和不确定度，按family留出；主动测量“高潜力且不确定”候选，近似项弃权实测。不要先做端到端RL、通用图发现或自研RA。建议投入：语义模板40%、测量/成本30%、有界搜索20%、学习10%。

## 2. 能证明到哪里

- 给定有限grammar、编译器版本和确定性代价，可用穷举或branch-and-bound证明域内最优；下界L=max(CP、各资源工作量/容量、必需访存)，仅当L≥当前上界才剪枝，并保存清单、哈希和剪枝证书。不能推出开放空间、真实硬件周期或x265全局最优。
- PEXT的3^16商空间、DFA的3840项属于穷举证明。定宽直线region可翻译为SMT bit-vector/array，证明“契约≠候选”为UNSAT；循环/FSM需不变量归纳，tail还需内存足迹、alias和guard前提。20k、TestBenchLite和实机bit-exact是强测试，不是全输入证明；C未定义行为、编译器误编译及完整编码器仍未被证明。
- DAG cover、资源受限调度、RA分别含NP难/图着色问题；这说明为何有界搜索，却不保证剪枝正确。带噪排序只能给统计界：随机交错process-block，以置信序列/经验Bernstein作有限候选校正，声明“以≥1-δ概率regret≤ε”；继续报告family-held-out acc/tau和top-1 regret，不能把0.975称为数学一致性证明。

## 3. 六个月路线

1. 第0～1月：四机profile、逐kernel消融并完成950严格bit-exact E2E；产出可替换热点和Amdahl上限。门：真实100f、随机交错、同机md5、95%CI、全部入DB；op4032只进政策分支。若上限仍低于15%，立即重设目标。
2. 第1～2月：补齐effect/alias/rounding/tail/VL契约，建≥4家族、≥50 region、≥100唯一final-object语料。门：确定性重建、基线可选、20k＋ABI/ISA/guard全过、对象去重。
3. 第2～3月：校准四机模型并训练会弃权的残差ranker。门：family留出acc≥0.80、tau≥0.70、top-1 regret≤2%，各机无CI可分辨的基线回退；不达标则停扩搜索。
4. 第3～5月：上线有界等价饱和/枚举与PEXT、DFA、全展开、tail模板，攻Amdahl贡献≥0.3pp的热点。门：小域与全穷举同最优；每候选有SMT/穷举或明确测试义务，20k＋生产逐调用差分，实机kernel显著非劣。
5. 第5～6月：做M4独立声明——AGO bundle对比冻结发射器及best9。门：干净重建、目标/VL/ABI分发、30f/100f bit-exact；四机均不回退，且至少两机相对best9额外≥0.5pp、CI不跨零，否则不发布、不宣称15%。