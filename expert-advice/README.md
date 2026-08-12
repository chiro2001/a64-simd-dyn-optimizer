# Expert advice archive

此目录按轮次保存外部顶级 Codex 模型对**已经完成的实际优化迭代**所做的困难复盘和方向建议。初始规划、环境审计和纯基础建设不触发审核；每个实际优化 iteration 最多请求一次，不围绕回复继续多轮审阅。它是顾问记录，不是优化器输入的隐式真相，也不阻塞主体流水线。

每轮使用不可覆盖的 `round-NNNN/`：

```text
prompt.md      请求与问题
context.md     commit、candidate、实验文件和实际命令
response.md    模型最终回复
session.jsonl  可选的完整事件流
decision.md    执行 Agent 对每条建议的 accept/reject/defer
```

执行规范、示例命令和故障处理见 [Agent 单轮迭代协议](../docs/06-agent-iteration-protocol.md#5-实际优化迭代结束后的单次顶级模型困难求助)。不要在本目录提交认证信息、环境变量值或未脱敏数据。
