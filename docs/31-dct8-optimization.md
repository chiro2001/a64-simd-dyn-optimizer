# DCT8 优化设计（2026-08-14）

## 1. 现状与差距

clang 编译的当前 best（上游 partialButterfly8_sve 移植）：动态 310 /
MCA 77 / 920B p50 4；上游 NEON：920B p50 3。差距 ~33%（同宽 SVE vs
NEON）。

## 2. 根因

两趟 pass 间的中间量（O[0..3]（4×s16×8）、EE/EO[0..3]（8×s32×4）=
12 个 128-bit 向量）通过内存往返（clang 版约 24 条 str/ldr，GCC 版
更多），是首要可省开销。算法其余部分（sdot.d 8 条 + mul/padd/rshrn
12 条 + 装载）已是上游结构。

## 3. 方案 A：寄存器驻留中间量（首选）

把两个 pass 合并到一次调用内，pass1 的 O/EE/EO 留在 12 个 NEON 向量
寄存器中，pass2 直接消费（消除中间缓冲区与往返）。

- 预期：动态 310 → ~286，MCA 77 → ~65，920B p50 4 → 3~4；
- 实现：在 emit_dct8_sve2_shared.py 生成一个合并函数（pass1 输出
  具名向量 → pass2 直接引用），保留 shift 2/9 两趟语义；
- 验证：20k upstream-exact vs dct8_sve + 920B paired（dct8 全 SVE1/
  NEON，无需替换）。

## 4. 方案 B：若仍落后 NEON

- pass1 按 4 行/向量处理（8 列 × 4 行 = 32 s16 = 1 个 z 寄存器），
  减少行装载与 E/O 组合指令；
- 或对两趟 shift（2、9）做常数折叠/合并舍入（需保持 upstream 语义，
  注意 O 的 s16 wrap 契约）；
- 不做：单块 HtoS（8 列下 4-way sdot 只占 2/8 lane，不减指令，
  docs/30 §1.7 勘误）。

## 5. 工具侧

- dct8 搜索默认 clang（已完成，docs/30 §1.7）；
- `--bench-920b` 可直接用于 dct8 实机参考（微基准已就绪）。

## 6. 方案 A 结果（2026-08-14）：clang 下中性

实现 `emit_merged`（pass1 返回 8 个 s16 行向量，pass2 直接消费，
消除 coef 缓冲）：clang 编译 311 dyn / 291 fused / **MCA 78**
（2026-08-14 实测，vs best 77）/ 20k 0 失配——与未合并 clang 版
（310/289）几乎相同。原因：clang 的
-O3 已把两个 pass8 内联并保持中间量在寄存器（stack_vector 仅 9-12）。
方案 A 对 GCC 有意义（492→310 已由换 clang 达成），对 clang 无额外
收益。**结论**：当前 clang 版已是该算法结构下的实际最优（920B p50 4）；
追赶 NEON（p50 3）需方案 B 的算法级改动，优先级低于 QEMU/interp8。
