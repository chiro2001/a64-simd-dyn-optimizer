# Round 0028：AGO 搜索与下一步

## 基线

**事实：**冻结集在 N1/710/920B 已有约 2.0–2.7% bit-exact E2E。M2 的 17 个 cover 只覆盖小域；N1/920B 成本模型 LOOCV Spearman 约 0.88/0.91。P3 弃权 ranker 为 acc=0.917、tau=0.871、regret=1.53pp、coverage 约 83%，特征仅 `fused_uop/mca_total`，710/950 标签稀疏。

**推断：**首要问题是候选语义和测量选择，而非扩大布局枚举。纯 SVE 在 710 回归 2.63%、interp8 IR 在 920B 回归，说明访存、shuffle、寄存器不能用 uop 数替代。

## 1. 搜索改动（每项可证伪）

以下结论均为**需实验验证**，门槛写在各项末尾。

1. **契约驱动生成（改“搜什么”）。**把 effects/alias/rounding/tail/VL/dataflow 映射为合法 grammar：pack、load 合并、归约树、dot/fusion、unroll、predicate-tail；状态机只生成有界 table/PEXT/DFA，基线保留，并按 ISA/VL 先过滤。对 satd/sa8d、dct、saoCuOrg、interp8-i8mm 各取一 region，每区 64 候选。若过 gate 比例不提高 2 倍，或最佳结果不能少测 30%，就不扩展；违规和失配必须为零。

2. **联合成本代理与弃权（改“怎么选”）。**每机把关键路径/端口、访存、peak-live、spill、分支/尺寸及 `fused_uop` 拟合 ticks 并给区间；下置信界优先，低置信度转 paired 实测。补 60 个跨 family、三机 pair，留一族/留一机验证，只测 25%。验收：acc/tau 下降≤0.02、regret≤1.0pp、coverage≥75%，未弃权时 regret>2pp 的 95% 上界≤5%；否则不自动放行。

3. **有限 B&B 加主动测量，暂不上端到端 bandit。**用关键路径、资源吞吐、必需访存最大值作下界，按契约/ISA/VL/哈希去重；Pareto 前沿按不确定度实测。先在 satd/sa8d 小域与全枚举对照，再在一个 saoCuOrg 形状与随机/MCA 同预算比较。要求最优哈希一致、无误剪枝、节点减半，或同 regret 少测 30%；否则退回 beam，约 100 groups 前不做 bandit。

## 2. 数学证明的取舍

**最高价值：双组 lowering 组合等价。**在 `svcntb()==32` 及契约的 alias、stride、tail、舍入前提下，证明 dct16/32 16-lane 程序等价于两个 fused8 DAG：store 的逻辑 lane、地址足迹和边界行为相同，guard 失败安全回退。用 bit-vector/array SMT 证原语，再沿 `lane_in/n_out` 无环图归纳；这是可用于 M4 的发布安全证书，不声明 VL 无关。

**次高：有限 grammar 的 B&B 最优性。**只证明给定 grammar、编译器和代价函数的域内最优，并保存上下界、剪枝原因、对象哈希；不能推出真实周期最优。若 ranker 跳过实测，再证明 `P(regret>2pp | 不弃权)≤0.05` 和 coverage 下界；当前 83% 只是点估计。跨机迁移界因数据和微架构参数不足暂缓；全球最优、全 VL 等价、15% E2E 上界属于学术装饰。

## 3. 无 950 的 2–4 周路线

1. **第 1 周：**契约 grammar、联合特征和三机交错标签入 DB；60 pair 后若 regret 仍>2pp 或 coverage<70%，冻结现有 ranker。
2. **第 1–3 周：**只测契约可运行的目标：三机上的 saoCuOrg NEON 种子，以及 ISA 检查通过的 interp8-i8mm（710 优先）；32B-only 的 saoCuOrg SVE2 只做静态/QEMU，不冒充实机证据。须 ratio 的 95% CI 下界>1、两批 bit-exact、E2E 增 0.2pp；否则归档。
3. **第 2–4 周：**完成双组等价和一个 region 的 B&B 证书，再把 tail/full-unroll/dot-fusion 模板复用到 sao；SMT 超预算则标为 `test-obligation`，不阻塞冻结集。
4. **纯 SVE 最后，仅作回退。**只有微基准先显示相对 NEON/混合≥10% 且 Amdahl 投影≥0.3pp 才重开；否则默认关闭。950 是独立外部门，未测前不宣称 M4 完成。
