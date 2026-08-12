## 总判定

窄义确认，广义仍不成立：typed TRN lowering 已通过很强的功能与结构性筛选，但不能据此宣称生产性能或可部署性。M9 保持 `blocked-environment` 是正确状态。

## 1. typed TRN 与静态计数

- [事实] MachineIR 确有 24 个 shuffle、六种唯一 mask、各四次；它们精确对应 i16/i32/i64 的 TRN1/TRN2。[识别代码](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/codegen.py:206)是白名单匹配，不是在泛化任意 shuffle。

- [事实] 对每个 128-bit tile，元素数分别为 8/4/2，均为偶数；SVE TRN 输出的相应前缀只依赖同一前缀输入。因此 VL≥256 时，前 16 个 halfword 中的两个 tile 不会互相串 lane。u32/u64 reinterpret 是位视图变化，归档计数也没有对应实体指令。

- [事实] 等语义的干净比较已经足够支持“静态大幅下降”：

  - single：290/224 → 117/101，即 total -59.7%、SIMD -54.9%；
  - x2 rounded：297/225 → 125/103，即 total -57.9%、SIMD -54.2%；
  - 48 `ld1h`、24 `mad`、24 `tbl` 及常量地址机制消失，换成24条 TRN。

- [事实] x2raw 的 116/101 相对 M8 的 -61%/-55%不是纯 typed-TRN 消融，因为还删除了逐 tile rounding；它是有用的候选工作量计数，但归因应以 single/x2 rounded 的比较为主。

- [推断] 这些函数是无循环直线路径，因此静态 total 是很强的早筛信号；但 TRN/UADDV 的端口、延迟和目标 CPU 调度成本不能由条数推出。

独立 `.o` 还缺：

- [事实] M9 未归档 compiler/linker 版本、完整环境、`.o`/最终 binary hash 或完整 disassembly；构建只是泛化的 `-O2 -march=armv8-a+sve2`，[不是生产 x265 flags](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/build-sve-sa8d.sh:25)。

- [事实] 计数器默认统计对象内全部函数，SIMD 分类只是操作数含 `z/p/v` 的正则；total 比“SIMD”子计数更可信。[计数器](/home/chiro/projects/a64-simd-dyn-optimizer/tools/count_asm_insns.py:14)

- [需实验] 用实际 GCC/Clang版本、`-O3`、PIC/LTO、真实 `-mcpu`/tune、固定或 scalable VL flags，检查最终合法 16x16 linked symbol，而不是把 standalone raw helper 的116条简单乘二。必须同时报告 code bytes、rodata、stack spill、峰值 live Z/P、BTI/unwind和最终 hash。

- [需实验] QEMU execution plugin统计最终 wrapper 的 guest instructions/call，可验证调用、链接和实际执行路径；不能把QEMU墙钟时间当性能。最终仍需真实 SVE2 VL=256 与上游最佳 SVE2实现 paired A/B。

## 2. correctness、VL、内存与 ABI 风险

### raw scaling 与统一舍入

- [事实] raw helper实际返回的不是完整 raw R8，而是“half-R8 sum”：

  \[
  H_{top}=(R8_{00}+R8_{01})/2
  \]

  两次 wave 后：

  \[
  (H_{top}+H_{bottom}+1)>>1
  =(\Sigma R8+2)>>2
  \]

  精确等于16x16合同。[16x16合同](/home/chiro/projects/a64-simd-dyn-optimizer/docs/03-sa8d-end-to-end.md:66)

- [事实] `R8` 必为偶数：所有 Hadamard 系数模2都等于输入差值总和的奇偶性，绝对值保持奇偶性，而 R8 累加64个系数。因此除2是精确缩放，不是舍入。

- [风险] 当前验证器只在随机 corpus 上检查“两 tile 的 raw_sum 为偶数”，并未固化上述证明，而且两个奇数相加也会通过该检查。[当前 oracle](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/sve_verify.cpp:155)

- [风险] `raw=True` 在 codegen 中会跳过任意 pair scalar add/sub 和 lshr，并未断言尾部恰为 `+1, >>1`。[raw特判](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/codegen.py:299) 对当前 seed 正确，但未来 MachineIR 尾部变化可能静默误编译。生产前应把 `scale=R8/2`、tile-pack、footprint和rounding boundary显式放进IR/contract，或至少精确匹配预期尾部。

### VL

- [事实] VL=128时 `svwhilelt_b16(0,16)`只能激活8 lane，x2raw静默返回 tile A 的 half-R8，绝不是降级实现。

- [风险] manifest写 `sve2-vl256`，codegen注释却允许 VL≥256。应明确二选一：

  - 固定目标：dispatch要求 `svcntb()==32`；
  - VLA-minimum：要求 `svcntb()>=32`，并补VL=384及更大VL的前缀闭包验证。

- [事实] 当前日志没有打印实际 `svcntb()`；`sve-max-vq`是QEMU CPU最大能力参数，不能替代进程实际VL记录。构建脚本还把 `vq=4` 注释成“VL≤256”，而 vq=4实际是512 bit。[脚本](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/build-sve-sa8d.sh:40)

- [需实验] 测 worker/thread-pool 的VL继承和运行时dispatch；在 vq=1 上验证候选绝不被注册，而不是仅依赖调用纪律。

### 两次 wave 的地址与 footprint

- [事实] 正确调用形状是：

  - 顶部：`raw(a, sa, b, sb)`，覆盖行0–7、列0–15；
  - 底部：`raw(a + 8*sa, sa, b + 8*sb, sb)`，覆盖行8–15、列0–15。

  底部不能再加列偏移8，否则会读到列8–23。正 stride 下完整footprint是 `{r*stride+c | r=0..15,c=0..15}`。

- [事实] 当前测试分配了宽松padding，只覆盖正 stride 16/17/64/65；没有恰好边界或guard page。[分配方式](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/sve_verify.cpp:69)

- [风险] SpecIR的 `min_stride:16`看起来排除了负stride，应把“必须为正”写清并审计调用点。若负stride需要支持，当前 `(size_t)row * stride` 会触发无符号转换和潜在C++指针UB；生成代码和scalar oracle都有此形状，不能直接加负stride测试后宣称支持。

- [需实验] A/B分别做guard page，覆盖最小stride、非对齐、每个关键行恰好结束于页边界；若允许负stride，则使用有定义的有符号地址计算并在footprint两端布guard。ASan/UBSan不能替代guard page。

### 一条 UADDV 与 ABI

- [事实] 这不是必须依赖“lane重排”的神奇优化。源码最后是：

  ```text
  low + (full - low) == full
  ```

  且变量为 `uint64_t`，模算术下也恒等，所以编译器可直接删除低半归约。[生成尾部](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/sve_roundtrip_sa8d_8x8x2raw.cpp:156)

- [事实] 本次只读复编观察中，GCC 16.1和Clang 22在O1–O3均生成一条UADDV；GCC O0保留两条并产生大量stack traffic。

- [推断] 结果正确性不依赖该优化，但116条静态形状依赖编译器。跨GCC版本、优化级别没有指令形状保证。若“一条UADDV”是性能门禁，raw模式应直接表达一次full reduction，并对最终对象设置非脆弱的“UADDV上限/禁止spill”检查。

- [推断] ABI本身风险较低：接口只有指针、`intptr_t`和`int`，没有sizeless SVE类型跨函数边界；8-bit范围也确保返回值不溢出int。仍需在最终binary检查AAPCS64 callee-saved、SP、BTI、unwind、feature/VL dispatch，以及禁止10/12-bit误注册。

## 3. 下一轮按信息增益排序

1. **合法16x16 correctness/memory/VL门禁。** 构造上述两次wave并统一`(sum+1)>>1`，直接对冻结x265 16x16 oracle和canonical spec做固定边界+至少百万随机差分；加入parity/scale lemma、guard-page、ASan/UBSan、实际`svcntb()`日志，并以vq=1验证dispatch拒绝。这是最高信息增益，因为它决定helper是否真的能进入任何生产shape。

2. **生产最终symbol与动态指令实验。** 用真实x265 compile/link flags生成最终16x16 symbol，与上游最佳SVE2 16x16等语义比较；归档V0身份、完整disassembly、code+rodata、spill/live Z/P。再用QEMU plugin统计guest instructions/call，并做生产GCC版本及相邻版本/Clang的代码形状漂移检查。

3. **随后冻结M6并转向N1可测family。** 若前两项通过，保留该候选为`blocked-environment`，停止继续枚举SVE静态赢家；真实SVE2硬件到位后再恢复paired A/B。现在先profile决定DCT8还是interp8；没有profile时，DCT8只是基于工具复用度的默认选择，不是已证明热点。[路线图](/home/chiro/projects/a64-simd-dyn-optimizer/docs/05-roadmap.md:143)

本次仅做只读审阅，未修改仓库。