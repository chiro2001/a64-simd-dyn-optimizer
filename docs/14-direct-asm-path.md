# 直接汇编 kernel 路径（Direct Assembly Path）

状态：**v0.1 原型可用**（2026-08-13）。目标：让
`kernel → 优化 → kernel → 评估` 循环不再为每个候选经过 C/C++ ACLE
编译，从而更快地评估工具和优化 pass。

## 1. 现状与动机

原路径：

```text
布局参数 → Python 发射器 → C++ ACLE intrinsic → g++ -O2 → .o
        → QEMU 上游差分 → QEMU exec trace → raw/fused_adj 计数
```

ACLE 层的问题：

- 每个候选一次 `g++ -O2`（约 0.27s，比 `as` 慢 ~90 倍）；
- 编译器可能改写/重排指令，工具看到的“优化结果”是编译器 lowering
  后的产物，不是优化 pass 的直接输出；
- 依赖编译器对 SVE2/NEON bridge intrinsic 的支持（920B GCC 12 缺
  bridge 头文件，必须换 clang 22）。

## 2. 目标路径

```text
布局参数 → Python 发射器 → 指令流（SSA ops）→ GNU asm .S → as → .o
        → QEMU 上游差分 → QEMU exec trace → 计数
```

阶段划分：

| 阶段 | 说明 | 状态 |
| --- | --- | --- |
| P0 | 从已验证 C++ 候选 bootstrap 一次 `.S`（`g++ -S`），之后重建/评估纯 `as` | ✅ 原型 |
| P1 | 发射器直接输出指令流（op 列表 + 虚拟寄存器），asm 后端负责固定寄存器分配 | 规划 |
| P2 | 优化 pass 直接改写 `.S`/指令流（调度、融合、常量布局），无编译器参与 | 规划 |

## 3. P0 原型（已实现）

`tools/emit_dct16_sve2_asm.py`：

- `--bootstrap`：从发射器生成 C++，`g++ -S` 一次得到
  `kernels/dct16/candidates/sve2_shared.S`（含 `.rodata` 常量、函数
  标签、CFI）；
- `--assemble`：`as -march=armv8.2-a+sve2` 直接汇编；
- 链接用无 ACLE 的 C trace 驱动（`kernels/dct16/shared_trace_driver.c`）。

`tools/search_sve2_layouts.py --backend asm`：3 个布局候选全部过 20k
上游差分（0 分歧），true-dynamic 计数与 ACLE 路径完全一致
（1183/1246/1636，fused_adj 1054/1087/1252）。

2026-08-13 扩展到 DCT32/interp8：同一 `--backend asm` 通道
（bootstrap 一次 `.S`，之后纯 `as`）在 DCT32 全部 4 个布局
（v1/v2/v2b/v3）与 interp8 path-a 上复现 ACLE 计数完全一致
（DCT32 v3 = 3962，interp8 = 127），20k 差分 0 分歧。证明
“kernel→优化→kernel→评估”的纯汇编重建通道对所有当前 kernel
家族可用，P1/P2 的指令流后端可以在这条已验证骨架上叠加。

实测提速：

```text
候选编译：g++ -O2 -c   0.265s
         as -march=... 0.003s     ≈ 88x
```

端到端（3 候选搜索）目前被 QEMU 验证/抓取主导（~1s/候选）；候选数
增大后编译节省线性放大，且优化 pass 可以在无编译器噪音的条件下
直接评估。

## 4. P1：指令流 → asm 的固定寄存器后端（设计）

发射器将 C++ 模板改造成 op 列表：

```text
["ld1h z0.h, p7/z, [x0]", "rev z1.h, z0.h", ...]
```

寄存器分配策略（针对当前全展开 kernel，无通用 RA 需求）：

- 每行 E/O 叶子用临时区 z0-z15，打包后 quarter 寄存器常驻 z16-z23；
- 累加器/窄化临时 z24-z29，谓词/常量基址 x 寄存器固定；
- pass2 的 NEON 段用 v0-v31 同类策略（callee-saved v8-v15 不占用，
  或按 ABI 保存）；
- 约束：每个基本块内活跃 z 值 ≤ 30；超出时按组重算叶子（当前结构
  已满足）。

正确性保证不变：生成的 `.S` 必须通过同一个上游差分（QEMU
`dct16_sve_shared_verify`，0 分歧）与 true-dynamic 计数比对；asm 与
ACLE 两条后端共享同一套验证/计数漏斗。

## 5. P2：pass 直接在指令流/汇编上评估

- 布局/调度/fusion pass 输出指令流，直接生成 `.S`，无需 C++；
- 每个 pass 的评估 = as + 链接 + 20k 差分 + trace 计数，目标 <0.5s/
  pass/候选；
- movprfx 融合、tbl2 打包成本、常量复制等已在指令流层面可见并可
  被 pass 直接计费（docs/09 §1.5）。

## 6. 风险与边界

- P0 的 `.S` 由 GCC 生成，含编译器选择（如栈帧、CFI、lanchor 布局）；
  P1 的自产 asm 需自己处理 ABI（栈对齐、callee-saved、返回地址）；
- 固定寄存器分配在 kernel 变大（DCT32、interp8）后可能溢出，需按块
  重算或引入线性扫描；
- 汇编可读性/可维护性低于 ACLE，需保留发射器为唯一真源。
