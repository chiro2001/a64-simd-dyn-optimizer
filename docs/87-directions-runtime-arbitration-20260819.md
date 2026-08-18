# docs/87: 双线开发下的外网侧方向 + 运行时分派闭环（2026-08-19）

> 本文档记录 2026-08-19 与用户讨论确定的方向、设计决策与目标 I/O
> 结构。状态：方向已定，落地顺序为"cover 注册表 → preset 协议 →
> interception 自检 → build_release 单入口"（外网侧自主推进，950
> 只做终验）。

## 0. 背景与判定

- 内网 950（SVE2 2x256）可直测，是性能裁决权威；外网侧无 950 权限，
  只有 N1/710/920B + QEMU + 全量工具链。
- 反复证据：MCA/静态指标（fused_uop、ago_pred 代价表）在 950 上
  系统性不可靠——sve16 静态少 33% uop、实机慢 2.2–3.5x；fused_uop
  与实测 ratio 的 Spearman rho=+0.800（反相关），permute_depth_ratio
  rho=-1.000（reports/sve2-256-critical-path-features-20260817.txt、
  reports/950-sve16-dual-lane-20260817.txt）。
- 结论：**静态/MCA 不再做发布裁决，只做候选生成与粗筛**；裁决权交给
  benchmark 模式 + 新门禁标准（x265 自有 TestBenchLite + 选定视频
  指定帧范围编码 md5）。

## 1. 新门禁标准（内网结论，外网需承接的推论）

- 发布标准 = **x265 自有 TestBenchLite 门控 + 选定视频、指定帧范围
  编码 md5 不变**。
- 依据：内网对加强版 TBL 做过强度工程——dct32 随机输入能触发 h265
  输出 md5 改变（说明工具敏感度真实），但任意常见视频均不触发，故
  加强版过严，已撤回。
- 推论 1：TBL ↔ 视频 md5 的关系需实验建立。做法：用真实视频编码录
  kernel 输入分布（注入器加录制模式），以真实输入构造 TBL 用例回放
  对比 upstream；或直接保持用 x265 自己的门控。
- 推论 2：视频 md5 只能做**同机回归**（历史三机 md5 本就不同）；跨机
  安全门仍是 TestBenchLite。
- 已完结：视频 md5 语料与基线治理——内网已通过文档 + freeze/搜索
  门控落地，外网不重复。

## 2. 主线 A：benchmark 模式 + preset 闭环（设计已定）

- `AGO_BENCH=1`：注入器进入 benchmark 模式，跑一轮 microbench，每
  kernel 选最快，打印 preset 字符串。
- 下次运行 `AGO_PRESET=<指纹>:<选路表>` 直接启用，跳过测量。
- 候选用**数字序号**表示（候选可能很多）：`0 = upstream 分派`，
  `1..N = cover 序号`。
- preset 必须带机器指纹（微架构 hwcap/VL/编译器/so 内容哈希）；不
  匹配则忽略并回退默认分派。
- **upstream 是正式参赛臂**：赢不了 upstream 就输出 0（显式放弃
  注入）——sve16 教训："在自己候选里选最快的"仍可能慢于上游。
- 工程要求：多次取中位 + 基线配对；时间盒限制；预设白名单解析（防
  env 注入）；拦截自检（未拦截输出 INVALID，不产生 preset）。
- 状态：外网实现 + 920B/710 验证，950 终验。

## 3. 主线 B：非 bit-exact 偏差画像与有界近似

1. **偏差画像**：QEMU 差分从 pass/fail 二元门改为输出偏差分布
   （max|dev|、中位、饱和钳位占比、触发上下文）；用新画像重跑已
   门控/已归档候选：op4032（950 +71% vs SVE / +40% vs NEON，
   5300/20000 mismatch）、sao、i8mm。
2. **TBL ↔ 视频 md5 关系实验**（见 §1）：录制模式 + 真实输入回放 TBL。
3. **有界非 bit-exact 搜索轴**：饱和优化/舍入替换/累加重排成为正式
   搜索轴，每个候选带外网可算的偏差上界；DB 记
   `bit_exact=no (bounded: max|dev|, p_mismatch)`。
4. **负控**：故意注入 off-by-one / 换操作数 / 错舍入的 kernel，断言
   TBL 必须拒绝，防止"门禁看着过了其实是门禁不够强"。

## 4. 主线 C：内网 ↔ 外网数据交换协议

内网只传少量结论，传输单元按信息密度设计：

1. **preset 字符串 / pairwise verdict**（如 `interp8: 上游>C>B`）：
   几十字节，直接作 ranker 标签与选路输入；
2. **指令代价表一张**（指令类/依赖链延迟/8 路独立吞吐/VL128/VL256）：
   一次传回，外网重评全部 142 kernel 排名，翻盘名单 = 下一轮送审
   名单；
3. **主动测量清单（active sensing）**：外网先算"哪个测量消除最多
   排名不确定度"，输出最小请求清单，内网只跑被点名的 kernel/指令。

## 5. 目标 I/O 结构（自动化）

```
输入:  {x265 源码, x265 二进制, 目标机配置, [AGO_PRESET], gate 语料}
输出:  {release-<machine>.so, preset-<machine>.txt, manifest.json,
        report + DB 行}
```

- **cover 注册表**：每 kernel 稳定数字序号（0=upstream），现有
  AGO_* 隐式选择器（AGO_IR_SVE16 / AGO_WIDE_SVE2 / AGO_PURE_SVE /
  AGO_I8MM / AGO_IR_DCT ...）并入 manifest 成为显式字段。
- **build_release.py 单入口**：src + bin + target (+preset) →
  release.so + preset 生成命令 + manifest.json；内网只跑
  run-release.sh。
- 部署契约：`AGO_PRESET=$(cat preset-950.txt) LD_PRELOAD=release.so
  x265 ...`。
- x265 二进制的新用途：ABI/符号提取、运行时拦截自检目标、E2E md5
  基线（此前构建只吃头文件）。

## 6. 其余已讨论方向（备选/并行）

- 指令级微基准套件（原语依赖链 vs 8 路独立吞吐）→ 一次传回一张表
  （并入主线 C-2）。
- 静态特征扩展 + 跨机迁移 ranker：弃权优先于错误排名。
- E2E 权重普查：真实调用计数/块尺寸分布 → 950 测量预算分配。
- 测量战役生成器：正控必过/负控必失败的自检 harness。
- region-schedule 模板 + 宽度原生 lowering（round-0029 P1/P2，
  继续按 docs/78 执行）。

## 7. 落地顺序

1. cover 注册表 schema（数字序号、偏差画像字段、preset 格式定义）。
2. preset 协议进 .so（AGO_BENCH / AGO_PRESET、指纹、白名单）。
3. interception 自检 + benchmark 骨架（920B 验证）。
4. build_release.py 串 P1–P4。
5. 偏差画像工具 + 重跑 op4032（新门禁下第一个高价值待决项）。

## 8. 关联文档

- 现状：docs/59（权威交接，本次增补）、docs/70（backlog）、
  docs/82–86（自动搜索 / 950 实机清单 / 校准闭环）。
- 主线依据：docs/78（SVE2-256 优化交接）、
  reports/sve2-256-critical-path-features-20260817.txt、
  reports/950-sve16-dual-lane-20260817.txt。
