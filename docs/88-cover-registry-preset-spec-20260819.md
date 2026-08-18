# docs/88: cover 注册表与 preset 协议规格（2026-08-19，docs/87 step 1）

> 实现：`tools/cover_registry.py`（含 14 项单测
> `tools/test_cover_registry.py`）。本规格是 cover 数字序号、preset
> 字符串、机器指纹的唯一权威定义；步骤 2–4（preset 协议进 .so、
> interception 自检、build_release.py）按本规格实现。

## 1. 数字序号规则

- 每个 kernel 的 cover 空间是独立编号的整数：
  - `0` = upstream 分派（恒存在，永不注入）；
  - `1..N` = 该 kernel 的候选 cover，按稳定顺序分配。
- 顺序来源（`build_ago_registry`）：
  1. `optimizer/ago/covers_*.py` 的 `cover_meta()['covers']` 字母序
     （A/B/C/...）→ id 1..N；
  2. `include_static=True` 时，`kernels/<kernel>/candidates/` 下未被
     ago cover 引用的静态文件按文件名排序追加，kind=`static`，
     `selection_rule="manual"`（直到步骤 4 从 build_preload_so 的
     `candidate_sources()` 提取 flag 规则后显式化）。
- 序号变更会破坏旧 preset 的有效性，因此：**只追加、不重排、不删除**
  （废弃 cover 标记 `retired=true` 并保留 id）。

## 2. preset 字符串语法（AGO_PRESET, v1）

```
AGO_PRESET=v1:<指纹>:<kernel>=<ord>,<kernel>=<ord>,...
例：AGO_PRESET=v1:m1a2b3c4d:dct16=3,interp8=1,satd-8=0
```

- 指纹：`m` + 8 位 hex（见 §3）。
- kernel 名用注册表中的 `kernel` 字段（可含 `-`/数字）。
- 解析规则：严格白名单——未知 kernel、越界序号、坏 token 都使整个
  preset 无效（valid=False），加载器忽略并回退默认分派；不允许部分
  应用。解析失败（语法错误）等同无 preset。
- benchmark 模式（AGO_BENCH=1）的输出就是一行符合该语法的字符串，
  可直接写回 AGO_PRESET 复用。

## 3. 机器指纹

```
fp = sha256(machine|isa|vl|compiler|so_sha256|extra)[:8]
```

- 任意分量变化即指纹变化（保守策略：宁可不命中，不用错 preset）。
- 步骤 2 中 .so 在加载时自算指纹：hwcap/isa/vl 运行时探测，compiler
  与 `so_sha256` 构建时记录；`extra` 可带构建 flag 摘要。
- 指纹不匹配 → 忽略 preset（stderr 一行 warning），与"无 preset"
  行为一致。

## 4. 注册表 JSON schema（v1）

```json
{
  "schema_version": 1,
  "generated": "all-ago-covers",
  "kernels": [
    {
      "kernel": "dct16",
      "default_symbol": "dynopt_dct16_sve2_shared",
      "covers": [
        {"id": 0, "kind": "upstream", "label": "upstream dispatch"},
        {"id": 1, "kind": "ago", "label": "A",
         "name": "neon_bridge (SVE2+NEON vpaddq, permute=12.0%)",
         "source_module": "optimizer.ago.covers_dct16",
         "expected_permute_ratio": 0.12},
        {"id": 3, "kind": "ago", "label": "C",
         "name": "op895 (hand-written reference, permute=18.5%)",
         "source_module": "optimizer.ago.covers_dct16",
         "expected_permute_ratio": 0.185}
      ]
    }
  ]
}
```

- cover 可选字段（步骤 5 起填充）：`deviation`（max_dev / p_mismatch /
  saturation_pct / contexts）、`gate`（QEMU/TestBenchLite 记录）、
  `retired`。
- 静态 cover 附加：`source_file`、`selection_rule`（"manual" →
  "flags: {...}" 在步骤 4 显式化）。

## 5. 校验语义

- `CoverRegistry.validate()`：schema 版本、kernel 唯一、cover id 唯一、
  id 0 必须 kind=upstream、id ≥ 0。非法注册表拒绝保存/加载。
- `Preset.validate(registry, expect_fp)`：指纹匹配 + kernel 白名单 +
  序号存在。任一失败 → valid=False + 收集 warnings。
- 单测覆盖：roundtrip、指纹敏感度、坏语法、未知 kernel、越界序号、
  指纹不匹配、schema 完整性、id0 约束、重复 id。

## 6. 与后续步骤的接口

| 步骤 | 依赖本规格的接口 |
| --- | --- |
| 2 preset 协议进 .so | AGO_PRESET 解析/校验（可移植到 C++ 版实现；语义见 §2/§5） |
| 3 benchmark 骨架 | AGO_BENCH 输出 = Preset.serialize()；参赛臂含 id0=upstream |
| 4 build_release | manifest.json = 注册表 + 每条 cover 的编译/flag/哈希；序号生命周期规则 §1 生效 |
| 5 偏差画像 | 每 cover 填 deviation 字段；非 bit-exact 候选记 `bit_exact=no (bounded: ...)` |
| 8 数据交换 | 内网 verdict 直接翻译为 {kernel: ordinal}，与 preset 同构 |

## 7. CLI 速查

```sh
python3 tools/cover_registry.py --build build/cover-registry.json \
  --kernels dct16,sad --print
python3 tools/cover_registry.py --check-preset \
  "v1:m1a2b3c4d:dct16=3,sad=1" --registry build/cover-registry.json
python3 -m unittest discover -s tools -p 'test_cover_registry.py'
```
