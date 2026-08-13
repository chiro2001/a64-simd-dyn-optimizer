# DCT32 partial 直通设计（2026-08-13，实现前置文档）

目标：dct32 v2（7190，0.566x）→ 跨过半数门 6355 → 逼近内部参考
4251/4827。本轮明确：批量窄化（padd 链）与常量 spill/惰性加载均为
净持平方向（已实验排除），主出路是 DCT16 式的 **s64 partial 跨 pass
流动**（内部参考无 uaddv/saddv，fused 4251 = 4.15/输出）。

## 1. 当前瓶颈（v2 实测）

- uaddv 1024 + saddv 768 + 向量侧 fmov 1984：每输出标量舍入/存储链；
- stack_vector（向量 ldr/str）338：4 个常量每行重载（~256）等；
- sdot 1024（0.5/输出，已是 16-lane 最小）；mul 768（k≡2/k≡4）。

## 2. 设计（最小可行切片）

### M1：pass1 odd-k 输出 partial 布局（pass2 不动）

- 每个奇数 k 的 4 行组：4×sdot（每行 4 个 s64 partial）→
  `svuzp1_s32` 取低半（1/行）→ 4 行 × 4 s32 = 16 lane，
  用 1-2 条 zip/tbl2 打包成 1-2 个 z 寄存器 → **每 4 输出 1-2 条向量存储**
  （替换 4×uaddv + 4×fmov + 4×标量 strh）；
- partial 先收窄到 s32（值域 ≤ ~90k，无饱和风险）再落内存
  （coef32[k][i][0..3]，4×1024 s32 = 16KB，两次 pass 间复用）；
- pass2 保持现结构：先读回 partial 并求和（每输出 3 条 s32 add +
  round），此阶段只验证“M1 存储/打包增量”是否小于省下的 uaddv/fmov
  （预期 -1~-1.5/输出 → 7190 → ~6000-6400）。

### M2：pass2 odd-k 消费 partial（去掉 M1 的求和回读）

- pass2 的 O2[j] = coef1[j][c] - coef1[31-j][c] 对 partial 线性：
  O2_partial[j][p] = coef1[j][c][p] - coef1[31-j][c][p]（4 份 s32 叶）；
- odd-k 输出 = Σ_j g[k][j]·O2[j] = Σ_j g[k][j]·Σ_p partial =
  Σ_p (Σ_j g[k][j]·O2_partial[j][p])——4 组 16-term dot（sdot .s）
  后 addp 合并，**无逐输出 uaddv**；寄存器峰值：4 组 partial 叶 +
  4 常量 ≈ 20-24，可行；
- 舍入口径：最后 (sum+add)>>shift 与上游 vrshrn 一致（各 partial 和
  先 s32 累计再 round，验证 20000 差分 0）。

### 修订切片（2026-08-13，实施范围收敛）

原 M1（pass2 不动）被否决：pass2 若回读 partial 需 3 条 s32 add/输出，
且行加载变 4×，净收益为负。收敛为 **odd-k-only 切片**：

- pass1 odd-k：sdot（4×s64 partial）→ `svuzp1_s32` 取低半（1/行）→
  按 4 行组以 st1 向量存储到 `coef32[k][i][0..3]`（16KB），**不再写
  s16 coef 奇数行**；pass1 偶 k（k≡2/4/0）路径不变，仍写 s16 coef；
- pass2 odd-k：从 coef32 读 partial（行加载 4×s32），E/O 叶按 partial
  平行构建（4 组），输出 = 4 组 16-term dot 的 addp 合并，**无逐输出
  uaddv**；
- pass2 偶 k：读 s16 coef，结构完全不变；
- 预期净变化：pass1 -1024（uaddv+fmov 换 uzp1+st1），pass2 变化待测
  （E/O 叶 ×4 vs 去掉 uaddv），目标 7190 → ≤6355。

### M3：k≡2/k≡4 族同构扩展 + k≡0 向量化

## 3. 验证与门槛（每 M 阶段）

- 正确性：2 万例差分 0（vs `x265::dct32_sve`）+ lite PASS；
- 指标：fused_uop 下降且 **stack_vector 不增**、峰值 Z 寄存器 ≤ 32
  （objdump 抽查 str/ldr z 条数）；
- 每阶段输出：新增 pack/zip/uzp 条数与净变化表（round-0011 要求）。

## 4. 风险

- partial 4× 数据量：若编译器 spill 到栈，M1 收益被吞（对策：4 行组
  内完成打包与单次存储，不保留全矩阵 partial 活寄存器）；
- s32 收窄与上游 s64 累计的舍入差：partial 各自截断后再求和 ≠ 先求和
  再截断——必须用差分验证；若失配，改 M1 存 s64（16KB×2）或最后统一
  舍入路径；
- 寄存器峰值：M2 的 4 组 partial 叶需 ≤24 活寄存器，否则按 k 分块。
