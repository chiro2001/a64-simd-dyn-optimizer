# Experiment archive

Each run gets its own directory with the artifacts required by
[docs/06-agent-iteration-protocol.md](../docs/06-agent-iteration-protocol.md):

```text
experiments/<run-id>/
├── iteration.md
├── manifest.yaml
├── changes.patch
├── correctness/
├── benchmark/
├── disassembly/
└── expert-link.txt
```

M0 (`m0-foundation/`) is the environment + frozen-baseline foundation run;
its state is `foundation-only` and it does not trigger expert advice.
