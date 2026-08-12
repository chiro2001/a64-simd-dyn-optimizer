# Expert advice archive

此目录按轮次保存外部顶级 Codex 模型对**已经完成的实际优化迭代**所做的困难复盘和方向建议。初始规划、环境审计和纯基础建设不触发审核。咨询频率（2026-08-13 修订）：**每完成三个实际优化迭代（阶段）发起一次**，替代旧规则“每个 iteration 请求一次”。请求以只读模式在后台执行，主模型/执行 Agent 不阻塞等待，继续前台工作；响应落盘后在下一次自然检查点写 `decision.md`。历史 round-0001~0005 按旧频率执行，保持不可覆盖。它是顾问记录，不是优化器输入的隐式真相，也不阻塞主体流水线。

每轮使用不可覆盖的 `round-NNNN/`：

```text
prompt.md      请求与问题
context.md     commit、candidate、实验文件和实际命令
response.md    模型最终回复
session.jsonl  可选的完整事件流
decision.md    执行 Agent 对每条建议的 accept/reject/defer
```

执行规范、示例命令和故障处理见 [Agent 单轮迭代协议](../docs/06-agent-iteration-protocol.md#5-顶级模型困难求助批次触发与异步执行)。不要在本目录提交认证信息、环境变量值或未脱敏数据。
