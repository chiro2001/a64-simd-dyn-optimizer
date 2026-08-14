# 不支持指令的形状等价替换（2026-08-14）

## 1. 思想（用户 2026-08-14）

SVE2p1/SVE2p3 指令（如 `sdot z.s,z.h,z.h`）无法在 950（仅 SVE2）与
920B（仅 SVE1）上运行。大部分 kernel 的控制流/数据流与具体指令
无关（指令间依赖形状相同），因此可以在生成阶段用参数把**暂不支持
的指令替换为相同寄存器依赖类型**（同读/写寄存器数、同类流水行为）
的指令，使 kernel 能在当代机 / 920B 上直接运行，用 CNTVCT 预估
SVE 2×256 性能（用户评估替换误差 <5%）。

**关键约束**：替换后数值不保真，只用于性能预估；禁止用作正确性
验收（正确性仍以 20k 差分 + TestBenchLite 为准）。

**判定条件（用户 2026-08-14 补充）**：判断数据流/控制流与指令语义
无关的标准是——**在先前随机测试中动态指令数保持不变**；并且
**指令数相同 → SIMD 计算指令数相同**（计算形状固定）。满足该条件
的 kernel 才允许替换。验证工具：

```sh
python3 tools/check_flow_independence.py idct32 --seeds 1,2,3,4,5
python3 tools/check_flow_independence.py idct16 --seeds 1,2,3,4,5
```

结果（2026-08-14）：idct32 动态 5995 / 向量 3727、idct16 动态 1182
/ 向量 804，5 个随机种子全部不变 → PASS，两 kernel 均可替换。

## 2. 替换表

| 原指令（SVE2p1/2p3） | 替换（SVE1/SVE2 合法） | 形状 | 备注 |
| --- | --- | --- | --- |
| `sdot zD.s, zA.h, zB.h` | `sdot zD.s, zA.b, zB.b` | 3 寄存器、32-bit 累加 dot | BtoS 是 SVE1 原生；每 lane 乘积数可能多于 HtoS（见 §4 保守性） |
| `sdot zD.h, zA.b, zB.b`（SVE2p3 BtoH） | `sdot zD.s, zA.b, zB.b` | 3 寄存器 dot（1 def/2 use） | 目标宽度 h→s 不同，依赖形状保留；BtoS 每 lane 4 乘积 vs BtoH 2 乘积，**高估更显著**（见 §4 interp8 行） |
| `sqrshrnb zD.h, zS.s, #imm`（仅 sve1 目标） | `asr zS.s, zS.s, #imm` + `uzp1 zD.h, zS.h, zS.h` | 移位 + 1 def/2 use 窄化形状 | SVE1 无饱和窄化；仅保依赖形状 |
| `sqrshrunb zD.b, zS.h, #imm`（仅 sve1 目标） | `asr zS.h, zS.h, #imm` + `uzp1 zD.b, zS.b, zS.b` | 移位 + 1 def/2 use 窄化形状 | 同 sqrshrnb 处理（interp8 path B 用） |

## 3. 流程

```sh
# 1) C++ -> .S（完整 SVE2p1 特性集；inline sdot 原样透传）
aarch64-linux-gnu-g++ -O3 -frename-registers \
  --param=sched-pressure-algorithm=1 -march=armv9.4-a+sve2p1 \
  -std=c++11 -S kernels/idct32/candidates/best_sve2.cpp -o /tmp/k.s
# 2) 替换 + 改写 .arch（tools/substitute_unsupported.py）
python3 tools/substitute_unsupported.py /tmp/k.s /tmp/k.sub.s --target sve1
# 3) 按目标 ISA 汇编
aarch64-linux-gnu-as -march=armv8.2-a+sve -o /tmp/k.o /tmp/k.sub.s
# 4) 链接微基准 + 实机 paired
bash scripts/build-substituted-microbench.sh idct32 sve1 /tmp/mb
bash scripts/bench-dct32-paired.sh /tmp/mb neon cand
```

实现：`tools/substitute_unsupported.py`（替换 + .arch 改写）、
`scripts/build-substituted-microbench.sh`（S→汇编→链接一步到位；
`--target sve1|sve2`，sve1 的 march 是 `armv8.2-a+sve`）。

## 4. 920B 实机结果（2026-08-14，CNTVCT paired，taskset -c 0）

替换版（形状 = 当前 SVE2p1 best）vs 上游 NEON：

| kernel | 920B paired（NEON/cand） | 说明 |
| --- | ---: | --- |
| idct32 | **1.129**（bootstrap95 1.121-1.130） | 替换版比 NEON 快 ~13% |
| idct16 | **0.905**（bootstrap95 0.905-0.907） | 替换版比 NEON 慢 ~9.5% |
| interp8 path-B（BtoH→BtoS） | **0.5425**（60 对，min 0.348/max 0.783） | 替换版比 NEON 慢 ~1.84x，**高估上界**：BtoS 每 lane 4 乘积 vs 真实 BtoH 2 乘积，dot 工作量翻倍；真实 SVE2p3 kernel 应显著更好（指令数 -28%，MCA 与 NEON 持平），需 950/960 确认 |

保守性：BtoS 每 lane 的乘积数可能多于 HtoS（byte 4-way vs halfword
2-way 语义），替换版可能**高估**真实工作量——因此 idct32 的 +13%
是真实 SVE2p1 kernel 的下界估计，idct16 的 -9.5% 是上界估计
（真实 kernel 应更好）。920B 与 950 同为 SVE 2×256（与 NEON 4×128
总宽相等），NP1(960) SVE 4×256 的宽度收益需 960 实机。

## 5. 限制

- 数值不保真：substituted 二进制 `verify` 必然失配，不能进 20k/lite；
- 替换误差依赖指令对流水行为的近似程度（用户评估 <5%），需更多
  kernel 积累对照（950 支持 SVE2 时用 sve2 目标可去掉 sqrshrnb
  替换项，更接近真实）；
- 最终验收仍以 950/960 实机 paired 为准（docs/27 命令）。

## 6. 路线：920B 实机耗时参考接入搜索（用户 2026-08-14）

替换路径跑通后，当 920B 作为可运行远程服务器存在时，可以把算力寻优
方向扩展到实机：

- 搜索流程中，对 top 候选（fused/MCA 短名单）**动态生成替换版 kernel
  并推到 920B 跑 CNTVCT paired**，得到实机耗时参考；
- 排序仍**优先 MCA**，920B 实机只作为**指引搜索测试方向**的次级信号
  （例如 MCA 并列时用实机打破平局，或验证 MCA 与实机趋势一致性）；
- 注意替换版是 BtoS 形状（可能高估真实 HtoS 工作量），实机参考对
  趋势/相对排序可信，绝对值按 docs/29 §4 保守解读；
- 实现建议：`search_sve2_layouts.py` 加 `--bench-920b <host>` 钩子，
  在 mca/lite 之后对 top-N 调 `build-substituted-microbench.sh` +
  `bench-dct32-paired.sh`（920B 侧），结果写入 results.json 的
  `bench920_cycles` 字段。

**已实现（2026-08-14）**：`search_sve2_layouts.py --bench-920b
<user@host> [--bench-top N]`，对 top-N 候选自动：编译候选 .cpp →
替换 SVE2p1 指令（sve1 目标）→ 汇编 → 链接 idct 微基准 → scp 到
920B → CNTVCT paired vs NEON，结果写 `bench920_ratio`。实测（JIT
时代候选）：zip32 sdot **1.1208**、scalar sdot 0.7597——实机信号与
MCA 排序一致（zip32 快、scalar 慢），可作为次级指引；MCA 仍为主。
