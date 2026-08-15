# Round 0020 response (truncated consultation)

Status: the consultation ran 636,853 tokens and was interrupted before the
final `response.md` was written, per the cost-control rule in
`docs/06-agent-iteration-protocol.md` §5.2. The following is captured from
the session output; treat it as a direction, not a complete expert review.

## Captured conclusions

1. The evidence does **not** support "256-bit SVE is inherently bad on
   920B". The current SVE1 candidates lose to NEON because of a combination
   of:
   - width parity between SVE1 2x256 and NEON 4x128;
   - SVE1 instruction expansion (predication/permute/narrow overhead);
   - a cost model that does not represent 920B's mixed SVE/NEON resource
     balance.
2. The current `asm` backend is effectively a compiler bootstrap, not a
   true direct-assembly search backend. A real search that can rediscover
   the user-known 30%+ level likely needs:
   - NEON-only recipes as first-class candidates;
   - mixed SVE1+NEON layouts where SVE does wide loads/permutes and NEON
     does narrow/reduce;
   - a direct-assembly pressure-budget search (register allocation, spill
     budget, scheduling) instead of only ACLE/clang codegen.
3. Search ranking must use 920B real-machine CNTVCT as a primary axis, not
   only fused/MCA, because MCA uses a different microarchitecture and
   misranks SVE vs NEON on this target.

## Suggested next experiments (ranked)

1. Build a **NEON-only candidate axis** for sa8d16/dct32/costCoeffNxN by
   translating the existing C/seed into NEON intrinsics and letting the
   search sweep pack/permute/reduce layouts; benchmark with the existing
   CNTVCT microbenches.
2. Add a **direct-asm pressure-budget backend** for one hotspot (sa8d16 or
   dct32) with explicit register allocation and zero-spill budget, then
   compare against clang -O3 ACLE on 920B.
3. Add **real-machine ranking** into `search_sve2_layouts.py` so top-MCA
   candidates are automatically CNTVCT A/B'd on 920B and the search result
   is re-ranked by measured ratio.

These are inferences from the truncated session plus the project's own
measured data; they still need experiment.
