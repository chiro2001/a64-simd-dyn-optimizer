# Round 0017 response（由会话日志整理，2026-08-14）

咨询进程（gpt-5.6-sol max，PID 99420）在落盘三份文档前退出
（~14 分钟、1.29MB 会话日志，与 round-0011 同款失败）。按 docs/06
§5.2/§5.3，从 `session.log` 提取已完成的结论如下；未完成的
summary/tooling-roadmap/verification 由本轮 decision 与后续实现
补齐。

## 已确认结论（会话日志原文要点）

1. **zip32 根因排序首位 = 越界/布局别名（UB），不是寄存器分配**：
   “zip32 的 sdot 路径对每行用全谓词 p16 从 src+off 载 16 个
   halfword，而 chunk 只需要低 8 lane；off=24 时会跨到下一行，
   最后一行再越过 32×32 缓冲。寄存器压力通常只导致性能退化，
   不应让 GCC 和 Clang 同时稳定地产生同一种错误值；因此把
   越界/布局别名问题放在 zip32 根因排序首位，并把‘先消除 UB，
   再讨论 RA’设为诊断门槛。”
2. **GCC 16 flag 事实**：`-fsched-pressure` 在 `-O2` 与 `-O3` 都已
   启用；只有 `-O3` 启用 pre-RA `-fschedule-insns`。因此单独追加
   `-fsched-pressure` 不会改变 `-O2`；`-O2 -fschedule-insns` 才是
   隔离 sdot 的 O3 收益来源的实验。
3. **搜索缓存缺口**：缓存键目前只有“合同 + 源码哈希”，若直接加入
   编译器/flag 轴会错误复用旧计数；路线图需先加完整 build
   fingerprint（编译器版本 + 全部编译参数）。

## 建议（会话给出的实验方向）

- 优先实验：把 sdot 行加载从全谓词 p16（16 lane）改成 8-lane 谓词
  （chunk 只消费低 8 lane），消除 off=24 越界；然后重测 zip32。
- 次优先：`-O2 -fschedule-insns` 对比，验证 O3 收益来源；
- 工具化：搜索缓存键加 build fingerprint，为编译器/flag 轴铺路。
