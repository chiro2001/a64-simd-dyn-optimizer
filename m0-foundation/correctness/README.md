# Correctness artifacts

TestBench correctness logs are in `../testbench/`:

- `pixel-NEON-nobench.log` — `--testbench pixel --nobench`, exit 0
- `full-NEON-nobench.log` — all harnesses `--nobench`, exit 0

SA8D differential verification (C == NEON dispatch, 20k random cases per
shape) is produced by `build/sa8d_microbench --verify-only`; raw CSV baselines
in `../benchmark/` were measured after verification passed.
