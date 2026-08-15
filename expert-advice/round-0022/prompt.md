# Round 0022: production-verified kernel wins exist but E2E is -1.9%;
what structural move can actually reach +15% on 920B?

You are acting as an AArch64/compiler/performance review expert. Do not
modify the repository; write your analysis and recommendations only into
this round directory (`response.md`, `decision.md`).

## Facts (supported by files in context.md)

- 920B: SVE1 2x256 + NEON 4x128, no SVE2, no PMU. Operator-level
  replacement only; encoding flow fixed; no internal reference.
- The pipeline now verifies every candidate call-by-call against the
  production static lib (18.96M real calls) and times it on the real
  call mix. 6 kernels win and are injected in a 20-slot batch.
- E2E: bitstream identical, median 8061 vs 8210 ms = -1.9% (reproduced).
- Remaining hotspots where generated code cannot beat upstream hand asm:
  quant 2.7% (3 attempts), dct32 2.3%, dct16 1.8%, dct8 1.4%, interp
  ~4%, intrapred ~2.4%, sad (1.8x slower), sao 1.4%.
- Non-primitive hotspots: motionEstimate 4.6%, psyCost 1.9%,
  estimateResidualQT 1.3%, encodeBin 2.2%, codeCoeffNxN 1.9%,
  signBitHidingHDQ 1.5%.
- sve2 (950) build gate passes for all injected kernels.

## Questions

1. Given six real wins only move E2E -1.9%, quantify what a realistic
   "next batch" of kernel-level wins (e.g., dct32 parity, quant parity,
   sad parity, interp/intra parity) would add, and state whether any
   operator-level combination can plausibly reach +15% on THIS profile.
2. The largest remaining untapped cost is in non-primitive C++ methods
   (motionEstimate, psyCost, mode decisions). Within the operator-level
   constraint, which primitive slots used by those methods (sad/satd
   shapes, pixel_avg, psyCost's internal satd) have the largest leverage,
   and which concrete algorithm could beat the hand NEON asm?
3. For dct32/dct16/dct8 on NEON 4x128: propose the specific dataflow
   that could beat upstream (e.g., partial-butterfly reuse, SDOT-free
   factorization, 16-bit pairwise transforms), with expected cycle
   budgets per shape. Which is the highest-information single experiment?
4. If +15% on 920B is not achievable at operator level, rank the
   structural alternatives: (a) 950/960 ISA headroom, (b) multi-threaded
   lookahead settings allowed by the user, (c) accepting -2% and
   publishing, (d) tool credibility deliverables. What would you do next
   with a fixed 2-week budget?
5. Audit our verification methodology: is the per-call production
   differential + real-mix replay + bitstream-md5 E2E enough to trust a
   kernel win? What blind spots remain (e.g., input-dependent branch
   costs, cache state, call-site context)?

Separate claims into: (a) supported by the cited files, (b) your
inference, (c) needs experiment.
