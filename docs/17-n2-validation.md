# N+2（鲲鹏 960）SVE2 验证合同（2026-08-13）

状态：**预注册**。当前只有 QEMU（`-cpu max,sve-max-vq=2`）验证与
true-dynamic 计数；920B 是 SVE1，无法执行本项目的 s16→s64 SDOT
（SVE2），因此**中间档 920B 只对 NEON 候选有效**，SVE2 候选直接以
960 为验收目标。

> **2026-08-14 硬件现实更新：960 尚未流片**，实机 paired PMU 验收无法
> 在近期执行。流片前验收口径调整为：**以 QEMU fused_adj（movprfx 融合
> 后的向量指令数）为验收代理**；达到指标即标记“指令数达标（QEMU 口径）”，
> 实机 cycles 验证挂起至 960 硅片可用。若期间可访问其他 SVE2 平台
> （如 Graviton4 / Neoverse V2 级），可先做早期校准，但正式验收仍以
> 960 为准。

> **2026-08-14 口径修正（用户裁定）：gather/scatter 在 ARM 上会拆分为
> 多个 ldst uops，效率低下；禁止为了表面指令数使用 gather/scatter 类
> 指令。** 指标增加 uop 等效口径：`fused_uop = fused_adj + 3 ×
> (gather+scatter 条数)`（即每条按 4 个 ldst uops 计）。搜索排名与
> 验收代理均以 fused_uop 为准；fused_adj 仅作参考。内部参考按同口径
> 折算：内部 fused_adj=731 / sg=32 / **fused_uop=827**；本项目 legacy
> best fused_adj=692 / sg=4 / **fused_uop=704**——诚实口径下领先内部
> 更多（704 < 827）。

## 1. 目标与基线

| 档位 | 基线（同机冻结） | 保留 | 优秀 |
| --- | --- | ---: | ---: |
| b：NEON→SVE256 | 同机最佳 NEON（dct16_neon） | speedup > 2.10 | >= 2.30 |
| c：SVE256→SVE256 | 同机最佳 SVE256（上游 dct16_sve 或本项目 best） | speedup > 1.10 | >= 2.30 |

指令数口径（预注册）：true-dynamic fused_adj（movprfx 融合后）；宽度
标准：相对 128-bit 有效上游 SVE 应减半（当前 best 1292/1911=0.68，
回收 65% 减半空间）。

## 2. 运行合同

- 固定 VL=256：候选注册前 `prctl(PR_SVE_SET_VL, 32)` 并断言返回值；
  线程池继承由 x265 dispatch 层负责，注册时校验 worker VL；
- 同一 binary 内函数指针 A/B（候选/上游），或分 binary 时严格同
  compiler/flags/layout 并记录 binary hash；
- corpus：manifest 声明（stride {16,17,32}、[-255,255]、随机 seed
  固定）；每轮加 guard-page 与 canary 边界；
- paired 协议：warmup→empty→A→B 与 B→A 交替，≥30 有效 pair、跨 3
  进程，报 median/p05/p95/MAD + bootstrap 95% CI；
- cycles 用 PMU（CNTVCT 或 perf），不拿 TestBench ticks 当 cycles；
- 正确性：上游位级一致（manifest 生成 harness，200k 例 0 分歧）+
  x265 transforms TestBench + 单线程 deterministic encode 回归
  （QEMU 口径；960 流片后补实机）。

## 3. 候选注册条件（960 接入前可完成的静态门禁）

- `tools/pipeline.py --all` 全绿（baseline/search/report）；
- `pipeline.py finalize` 固化产物并通过 200k 上游差分；
- `tools/check_isa_level.py` 确认指令集 <= SVE2.3、VL 相关指令合规；
- 循环恢复报告无异常展开（loop_report 健康度）；
- `tools/fusion_analysis.py` 融合清单与 fused_adj 口径一致。

## 4. 决策

- 960 实测保留门槛未过：保留负结果与成本误差，不注入；
- b/c 档优秀门槛达到：标记"工具已优秀"并全量存档；
- 实机与 fused_adj 预测偏差 >20%：以实机为准，回填成本模型数据
  （docs/09 resource lower bound）。

## 5. 验收黄金标准：x265 TestBench 自测（2026-08-13 落盘）

**结论：验收合同的黄金标准 = 通过 x265 官方 TestBench 功能自测
（`--testbench transforms --nobench`）。** 差分 harness 有疑问（例如只有
部分用例未通过）时，以该黄金标准裁决，不猜。

运行方式：

```sh
# 完整黄金标准（构造 + 注入 + 静态校验 + QEMU 执行），退出码 0 = 通过
scripts/build-testbench-inject.sh [candidate.o] [outdir]

# 开发期快速门禁（复用 MBDstHarness 数据与 C 参考，秒级，不重建 libx265）
scripts/build-testbench-lite.sh [candidate.o] [outdir] [-- --seed N]
```

约定与已验证事实：
- 注入点：`testbench.cpp` 文件作用域声明候选（C 链接不能写在函数体内），
  `setupIntrinsicPrimitives/setupAliasPrimitives` 之后替换
  `vecprim.cu[BLOCK_16x16].dct`；`MBDstHarness`（transforms）对 16x16
  dct 槽跑 128 轮 × 3 组随机缓冲，与 C 参考 `dct16_c` 逐字节对比；
- 静态校验：构建后 `nm -u testbench.cpp.o | grep dynopt` 必须出现未定义
  引用（调用点真实编译进）；只链入符号不等于被调用；
- 负向对照已验证：注入故意错误的候选 → `dct16x16 failed`、非零退出；
- 候选 .o 通过 linker flags 传入时，`cmake --build` 不会因 .o 内容变化
  自动重链，脚本先删除 TestBench 二进制强制重链；
- SVE2 CPU 标签说明：本机交叉工具链缺 `arm_neon_sve_bridge.h`，x265
  CMake 禁用 SVE/SVE2 编译，`--cpuid SVE2` 报 Invalid；门禁以
  `NEON,Neon_DotProd,Neon_I8MM` 标签运行，注入的 SVE2 候选在 QEMU
  `-cpu max,sve-max-vq=2`（VL=256）下真实执行。920B/960 实机接入后改用
  原生 SVE2 标签复跑一次；
- lite 门禁与完整 TestBench 共用同一 `MBDstHarness`/`check_dct_primitive`
  与同一 C 参考，因此 lite 通过是快速信号，完整 TestBench 通过才是验收。

## 6. legacy-internal-exact 合同的验收口径（2026-08-13 增补）

- **指标口径**：当前统一用 `fused_adj` = SIMD（向量）指令数 − movprfx
  （movprfx 视为与下条融合）；除 movprfx 外暂不假定任何其他指令融合
  实现。内部参考 731 与候选 928/933/1015 同口径比较。
- **裁决标准**：legacy 候选通过完整 TestBench `transforms --nobench`
  即验收（已验：k_tile=1 连续 6 次全过，k_tile=2 另过 1 次）。其与
  `dct16_c` 的分歧率 0.0452% 与内部算子已知分歧特征一致，视为
  “忠实复现内部语义”，不要求与 C 位级一致（与 §5 黄金标准不矛盾：
  TestBench 随机数据未命中该分歧路径，通过即验收）。
- **标量 legacy oracle 定位**：开发期代理，不要求位级一致；搜索驱动对
  legacy 组合接受 `mismatches <= 5120`（20000 例，<=0.1%）并记录分歧率。
