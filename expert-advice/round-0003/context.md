# Round 0003 context

- 触发：`m8-sve-pack`（accepted，功能 + 静态指令证据）完成验证，符合协议
  “实际优化迭代结束后单次求助”。
- 命令（本机已核对，沿用 round-0002 形态；如 `-s read-only` 因沙箱配置
  不可用，记录实际失败原因到 `blocked.md`，不得伪造回复）：

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s read-only \
  -C "$PWD" \
  exec -o expert-advice/round-0003/response.md - < expert-advice/round-0003/prompt.md
```

- 本轮不围绕回复继续 resume/追问；`decision.md` 记录采纳/拒绝/延期。
- 上一轮 round-0002 的决策已在本仓库落实（UMAXP 布局、语义库、sve2p1-p3
  覆盖检查等），见 `expert-advice/round-0002/decision.md`。
