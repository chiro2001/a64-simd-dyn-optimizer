# docs/91: build_release.py 单入口（docs/87 步骤 4）

## 状态

步骤 4（build_release.py 单入口串 P1–P4）已完成并以 qemu 代理闭环验证
（dct16+dct32，两核全量 gate pass，bench 出 preset，manifest 生成）。

## 入口与产物

```
python3 tools/build_release.py --kernels dct16,dct32
```

输入：{x265 src, 注入版 libx265 目录, 目标机, [preset]}；输出目录
`release/<target>/`：

- `release.so` —— multicover .so（coarse screen 存活 cover）
- `preset-<target>.txt` —— 运行时分派结果（AGO_PRESET，无 --preset 时实测产生）
- `manifest.json` —— cover 注册表 schema + 每 cover 的 gate/编译/hash/排除状态
- `report.json` —— gate 明细、bench 各 arm、阶段日志

真实机器用法：`--target 920B --native --bin <注入 libx265 目录>`（920B/710/950
共用一套代码，qemu 代理机名用 `--target qemu`）。

## P1–P4 映射

| 阶段 | 实现 | 证据 |
|---|---|---|
| P1 候选生成 | `cover_registry.build_ago_registry` + `multicover.plan_covers`（稳定数字序号） | manifest kernels[].covers id 1..N |
| P2 粗筛 | 差分 gate：注入 lib 的真实上游 primitive vs 每 cover，确定性伪随机输入（9-bit 残差域），qemu/原生运行 | report.gates 每 cover pass/fail/not-gated |
| P3 编译 | 二次构建：仅含存活 cover 的 multicover .so（`--cover-ids` 按序号过滤，洞安全） | release.so 导出只有存活 cover；全 fail 时 fail-fast 拒绝 legacy 降级 |
| P4 运行时裁决 | LD_PRELOAD + 注入 lib + AGO_BENCH=1（仅真拦截下出 preset），或 `--preset` 直接校验登记 | preset-qemu.txt + Report.arms；preset 白名单经 CoverRegistry.validate |

## 踩坑与结论（本轮实测发现）

1. **gate 必须用 x265 真实调用契约**：dct16/dct32 的 stride 是块宽
   （16/32），不是 bench 用的 padded stride（64/128）。bench_specs 新增
   `call_scalars`，gate 用之；比较宽度为逻辑块（16x16 512B / 32x32 2048B），
   缓冲仍按 padded 分配防越界。
2. **输入域取 9-bit 残差域 [-256,255]**：全幅 int16 输入触发饱和语义分歧
   （人为的越界值，production 永不出现），导致全 cover 误杀；域修正后
   dct16/dct32 三臂全 bit-exact（与 x265 C/NEON/SVE 三参考实现互相一致
   交叉验证）。
3. **多行输出解析必须 re.M**（第一版只匹配到字符串结尾一行，arms/gates 全丢）。
4. **全 cover fail 时禁止静默降级 legacy .so**：P2 空存活集 → 明确报错
   （防“看起来成功”的非 multicover 产物）。
5. **未注册 multicover 候选的 kernel（如 satd-8：cover_meta() 无 covers）**
   P1 即报错并列出当前支持清单；satd 家族的多 size 覆盖属于步骤 5
   重新仲裁范畴，暂不进 build_release。

## 当前 gate 覆盖

bench_specs 中有 shape/ret/params/upstream/compare 的 kernel 走差分 gate；
本轮验证 dct16/dct32（bytes 比较）与 satd-8（return 比较，需候选就位后启用）。
其余 kernel 目前按 not-gated 进入 P4（registry/preset 照常）。

## manifest 字段（docs/88 schema 之上的扩展）

- 每 cover：`source_file`（相对路径）、`sha256`、`compile{isa}`、
  `gate{status,iters,mismatches}`、`excluded`
- 顶层：`machine{tag,cpu,native,qemu}`、`build{so,so_sha256,built_at}`、
  `preset`、`chosen{ord per kernel}`

## 下一步（衔接步骤 5/8）

- 偏差画像工具 + op4032/sao/i8mm 重跑仲裁（satd 候选生成后启用 satd gate）
- 有界非 bit-exact 候选：gate 改为“偏差上界内放行”，DB 记
  `bit_exact=no (bounded ...)`；build_release 暴露 `--gate-maxdiff` 类参数
- 950 终验闭环：manifest 直接对接 TBL/视频 md5 新门禁
