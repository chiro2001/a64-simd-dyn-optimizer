# docs/85: 950 实机验证清单（2026-08-20，用户侧）

> 目标：把自动搜索选出的候选在 950（SVE2 2x256）上做 kernel 级微基准
> 与 E2E 仲裁，并用实测数据回流入 Feedback Loop（`feedback_calibrate.py`）
> 校准 ago_pred——完成"自动搜索超过手写"的最终硬件确认。
> 工具侧已全部就绪（143 kernel 全门禁、docs/84 语料总览）。

## 0. 前置

- 950 上拉取最新代码（三端 main 已同步）：
  `git pull origin main`（或 scp 工作树）
- 确认 SVE2：`lscpu | grep -i sve`（应见 sve2/sve2p1）
- 测试媒体：GitHub release `e2e-media-20260816`（docs/63 §0）；
  100f 必须用 `/tmp/real_1080p_100f_b.yuv`（30f 文件只有 30 帧，
  `--frames 100` 不补帧）

## 1. kernel 级微基准（裁决静态排序）

- interp8 hpp svdot32 vs best_sve2（docs/80 旗舰）：
  ```sh
  bash scripts/microbench-950-interp8.sh user@host
  ```
  预期：svdot32（ago_pred 更低）应快于 best_sve2
- dct16 op895 / dct32 loop / sa8d16 / psy-cost cadd / sao block32 /
  satd 家族：各 kernel 的 `preload_verify_*.cpp` + CNTVCT harness
  （docs/79 的 microbench 模式可仿 microbench-950-interp8.sh）
- 产出：每 kernel 每 cover 的 cycles 均值 → JSON：
  ```json
  [{"kernel": "dct16", "cover": "op895", "measured_cyc": 95.0}, ...]
  ```

## 2. Feedback Loop 校准（把实测回流工具）

```sh
python3 tools/feedback_calibrate.py --ingest /tmp/measurements.json \
    --out build/calibration.json
```
- 产出每 kernel 的 scale（measured/predicted 中位）；rank-by ago
  自动加载并乘上（`$DYNOPT_CALIBRATION` 可指定）
- 复核：校准后 `search_sve2_layouts --backend ago --kernel <k>
  --target 950 --rank-by ago` 的 ago_pred 应贴近实测

## 3. E2E 仲裁（发布集）

- sve16 bundle（docs/78 新主线）：
  ```sh
  AGO_IR_SVE16=1 python3 tools/build_preload_so.py --isa sve2 --vl 32 \
      --kernels dct16,dct32,satd-16 ... --out build/dynopt-sve16.so
  ```
- 注入法交错 A/B（interleaved-inject-ab.sh 或 freeze-four-arm 模式）：
  ```sh
  KERNELS=... scripts/freeze-950-dct.sh user@host   # dct 家族
  ```
- 门禁：同机码流 md5 bit-exact；5+5（或 5+5+5）交错取中位
- 重点仲裁项（docs/84 §3）：
  - dct16：op895 vs neon_bridge_fused（score 已按 950 实证修正）
  - sa8d16 / psy-cost：cadd 版 vs 手写（ago_pred 4.4x 差）
  - sao stats/重建：block32 vs best_sve2（2x 差）
  - interp8：svdot32 vs best_sve2（docs/80）
  - sad：**cover D（svadalp 宽累加，r33 新增）vs best_sve2（A）**——
    920B 实测揭示 A 每行归约弱点，D 每行 1 条 UADALP；
    QEMU 20000 例 0 失配、cp_lat=22 最短、ago_pred 0.707（快 29%）
    （kernels/sad/candidates/best_sve2_adalp.cpp）
  - sad-32：**cover A 已在 920B 实证赢 4-7%**（r34，全宽 VL=256 带宽
    优势）——950 只需验证 cover B（uadalp，ago_pred 0.754）；
    cover B 见 kernels/sad-32/candidates/best_sve2_adalp.cpp

## 4. 结果入库（AGENTS.md 强制）

```sh
python3 tools/kernel_db.py add 'kernel=<k> variant=<v> machine=950 \
  kernel_value=<cycles> ...'
python3 tools/kernel_db.py export-md
```
- 报告放 reports/，DB 行与报告同 commit，推送三端

## 5. 通过标准

- 至少一个家族的 950 实测确认 ago_pred 排序方向（"自动搜索 > 手写"
  的硬件证据）
- Feedback Loop 校准后排序不劣化（或修正）
- 发布集 bit-exact、CI 不跨零
