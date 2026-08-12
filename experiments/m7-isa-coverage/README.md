# M7：官方 AArch64 ISA 覆盖检查（NEON / SVE / SVE2..SVE2p3）

## 目的

验证“机器指令库是否齐全”这一前提：搜索工具要能按 `TargetFeatures`
（如 `sve2-vl256`）自动匹配最合适的机器指令，第一步先确认我们掌握的
指令清单与 ARM 官方 A64 ISA 一致，并量化语义库（`isa/aarch64/instructions.yaml`）
的覆盖缺口。

## 数据源

- 官方 ARM A64 ISA XML（A-Profile，2025-12）：
  `https://developer.arm.com/-/cdn-downloads/permalink/Exploration-Tools-A64-ISA/ISA_A64/ISA_A64_xml_A_profile-2025-12.tar.gz`
- SHA-256：`845ed227a6692ddb6b602da2ecbbac776620195a9c001ec576ced3a9a53dc26b`
- 下载后解压到任意目录（约 34.7 MB / 2299 个 XML），解析脚本不要求固定路径。

## 复现

```sh
curl -L --fail -o /tmp/ISA_A64_xml_A_profile-2025-12.tar.gz \
  'https://developer.arm.com/-/cdn-downloads/permalink/Exploration-Tools-A64-ISA/ISA_A64/ISA_A64_xml_A_profile-2025-12.tar.gz'
mkdir -p /tmp/arm-isa-xml && tar -xzf /tmp/ISA_A64_xml_A_profile-2025-12.tar.gz -C /tmp/arm-isa-xml

python3 tools/isa_catalog.py \
  --isa-dir /tmp/arm-isa-xml/ISA_A64_xml_A_profile-2025-12 \
  --out experiments/m7-isa-coverage/isa-catalog.json
python3 tools/isa_coverage_report.py \
  --catalog experiments/m7-isa-coverage/isa-catalog.json \
  --db isa/aarch64/instructions.yaml \
  --out experiments/m7-isa-coverage
```

## 结论摘要

1. **官方 SIMD 指令总量**：解析到 2291 条 A64 指令；其中 `instr-class ∈
   advsimd/sve/sve2` 的 SIMD 指令共 1339 条，在当前 TargetFeatures 模型
   （NEON/DotProd/I8MM/SVE/SVE2..p3/BitPerm）内可满足的有 1152 条。
2. **语义库远未齐全**：`instructions.yaml` 只按助记符覆盖了
   NEON 16/221、SVE 11/262、SVE2 2/197 个助记符；SVE2p1/p2/p3 与
   SVE_BitPerm 目前 0 覆盖。
3. **DotProd / I8MM 已在本轮补齐**（NEON + SVE 共 4/2、6/5、6/5 助记符全
   覆盖），并为指令库引入 `requires` 组合特性门控（如 `sve-smmla` 需要
   `sve + i8mm`）。
4. **SVE2p1/p3 存在对 x265 整数算子高价值的新指令**，是下一步语义绑定
   优先级：
   - SVE2p1：`ADDQV/ANDQV/ORQV/EORQV/SMAXQV/UMAXQV/SMINQV/UMINQV`
     （按 128-bit 段归约）、`EXTQ/DUPQ/ZIPQ1-2/UZPQ1-2/TBLQ/TBXQ`
     （128-bit 段内重排）、`SCLAMP/UCLAMP`、`LD1Q/ST1Q/LD2Q..4Q`
     （按 128-bit 段加载/存储）。
   - SVE2p3：`SABAL/UABAL`（宽绝对值差累加，SA8D 的直接候选）、
     `ADDQP/ADDSUBP/SUBP`（128-bit 段内成对加/减）、`SQSHRN/SQSHRUN/UQSHRN`
     （饱和窄化）、`LUTI6`。
   - SVE_BitPerm：`BDEP/BEXT/BGRP`（位抽取/展开/分组）。
5. **模型之外的 SIMD**：另有 187 条 SIMD 指令需要 FP16/BF16/FHM/加密
   （AES/SHA/SM）/SME/FP8/LUT 等特性，当前 `TargetFeatures` 未建模；后续
   若扩展到这些特性，只需扩展 `features.py` 与 `FEATURE_LEVELS`。

## 架构建议（供后续搜索工具）

- `experiments/m7-isa-coverage/isa-catalog.json` 作为**权威指令清单**
  （id、助记符、instr-class、特性表达式、编码数、汇编形式），由官方 XML
  自动生成，可随时重跑刷新。
- `isa/aarch64/instructions.yaml` 继续作为**语义模式绑定层**：每条可生成
  候选必须同时有 `pattern`（MachineIR 语义）与 `intrinsic`（ACLE 代码生成），
  `status: verify` 的条目在实机/工具链验证前不得进入 benchmark 漏斗。
- 搜索工具先读 `instructions.yaml`（已绑语义），未绑定的官方指令从
  `isa-catalog.json` 按 feature 表达式过滤后进入“待绑定”队列，按 kernel
  暴露的模式逐条补充。

## 产物

- `isa-catalog.json`：官方 2291 条指令的标准化目录（含特性分类）。
- `coverage-report.json`：机器可读的覆盖/缺口数据。
- `coverage-report.md`：按特性级别与指令的完整缺口清单。
- `tools/isa_catalog.py`：官方 XML → 目录。
- `tools/isa_coverage_report.py`：目录 → 覆盖报告。
