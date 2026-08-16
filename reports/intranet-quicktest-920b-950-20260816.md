# 920B internal-network quick test (2026-08-16, git 05cfa58)

Method: docs/49 + docs/63 §2 after `git pull origin main`. Shared Kunpeng
256-core node, strict SVE1 (VL=256; cpuinfo has no sve2 family), no PMU ->
CNTVCT, taskset -c 0, interleaved paired A/B (random order). ratio =
neon/cand median (>1 => candidate faster). Builds from current HEAD:
idct/interp8 substituted, dct8 (clang-22 native), sa8d16 (NEON best_sve1),
entropy (scan best_sve2 + cost best_sve2 + c1c2 + remain DFA emitters).
x265 ref lib build/x265-8-920b (b81f650).

## [paired] rows (paired, random-order)

| kernel | build | ratio | p50 neon/cand | cloud(ref) | note |
| --- | --- | ---: | ---: | ---: | --- |
| dct8 (native) | clang | 0.7500 | 4 / 5 (p50) | ~0.75 | == docs/31 |
| idct16 (sve1sub) | gcc15 | 0.8800 | - | ~0.905 | cand ~14% slower |
| idct32 (sve1sub) | gcc15 | 1.1727 | - | ~1.129 | cand ~17% faster |
| ipb8 (sve1sub) | clang | 0.5249 | 32 / 60 | ~0.543 | cand ~1.9x slower |
| ipb16 (sve1sub) | clang | 0.6497 | 83 / 128 | ~0.872 | cand ~1.5x slower (diverges >10%) |
| ipb32 (sve1sub) | clang | 0.5150 | 207 / 405 | ~0.591 | cand ~1.9x slower |
| sa8d16 (NEON 16x16) | - | 1.0381 / 1.0368 (lat/throughput) | - | 1.12/1.15 | cand == neon 20k on-machine; cloud NOT reproduced |

## [entropy] total_ticks per batch=4096, samples=60, medians of 5 rounds

| kernel | neon/cand | neon p50 | cand p50 | cloud(ref) | note |
| --- | --- | ---: | ---: | ---: | --- |
| scan | 1.46-1.54 | 5810-6507 | 3967-3978 | 1.04-1.14 | flip vs 08-15 (0.86); 20k diff bad=0 |
| cost | 1.02-1.03 | 13670-13722 | 13280-13505 | (was unusable) | REAL candidate now timed (stub bug fixed) |
| flag | 1.08-1.16 | 6200-7153 | 5490-6230 | ~1.68 | cand faster on all n=1..8, largest at big n |
| remain | 0.65 | 13940 (flat) | 21440-21500 | ~1.02 | DFA cand ~35% SLOWER on uniform corpus |

## [gates]

SVE2/SVE2p1/SVE2p3 candidates (sa8d best_sve2 8x8, dct16/32, idct16/32,
interp8 path-B) are not natively runnable on this SVE1 chip (SIGILL);
correctness stays on QEMU VL=256. On-machine differential:
scanPosLast 20k bad=0; sa8d16 16x16 cand==neon 20k OK.

## [deliverables / diffs vs 08-15]

1. bench_cost fix verified end-to-end: entropy_microbench cost mode now
   times the real costCoeffNxN candidate (was a link-time stub returning 0;
   that explained the old "median rounds to 0 / 439-tick stub" artifact).
   costCoeffNxN candidate is near-neutral (+2-3%) on this uniform corpus.
2. scanPosLast rbit + pext-nibble rewrite (pulled 08-16) is a large win in
   the numSig=1..16 sweep (~1.5x), a direction flip vs 08-15 (0.86),
   with 20k differential clean. Needs 30f E2E A/B to confirm wall-clock.
3. remain DFA candidate regresses ~35% on the uniform synthetic corpus on
   this node (cloud replay showed +20% on the real 1/2-heavy distribution)
   -> distribution-sensitive; recommend re-check before E2E injection.
4. sa8d16/scan cloud gains still do not fully reproduce on the shared node
   (sa8d16 ~+4% here vs +12% cloud), but scan is now a firm win here.

---

# 950 (920G) quick test - pull to 05cfa58

date: 2026-08-16 (Asia/Shanghai)
git: 05cfa58 (a64-simd-dyn-optimizer; prev reports add1a0f/becc57b kept)
uname: Linux 6.6.0-145.3.22.153.oe2403sp3.aarch64 aarch64
nproc: 384
ISA: SVE2 2x256 / NEON 4x128 (hwcap: sve2, **no** sve2p1/sve2p3 flags)
ref x265: b81f650, lib build/x265-8-950 (NEON+SVE2, I8MM=ON)
compiler: gcc-16 (GCC 15.3 + binutils 2.46.1) native, -march=armv8.2-a+sve2 -O3
method: CNTVCT latency paired (bench-dct32-paired.sh, taskset -c 0, p50 ratio)

## NEW THIS PULL (e28c369..05cfa58)

* IR width work (lane-granular def-use provenance, lane_defuse.py; IR target
  matrix SVE1/SVE2p3 gates; AGO_IR_SVE1 override; best_ir_sve8/neon8 for
  VL=128 machines). These are N1/920B/710 (VL=128) items, NOT 950 (VL=256)
  items -> no native 950 test to add from IR slices.
* dct16/dct32 op-backend candidates are the 950-relevant items (docs/63):
  dct16=best_sve2_op895, dct32=best_sve2_opbase (bit-exact) and
  best_sve2_op4032 (legacy-internal-exact, NOT bit-exact vs upstream).

## KEY: sdot.d is BASE SVE (SVE1), not SVE2p1; op candidates still need SVE2

Op candidates use SDOT Zda.D, Zn.H, Zm.H (4-way signed dot: each 64-bit lane
= sum of 4 16-bit products). It assembles under `-march=armv8.2-a+sve` (base
SVE, svdot_s64 ACLE) and runs natively on 950 with no SIGILL - confirmed by
canary (a=b=1..16 -> per-lane 1^2+2^2+3^2+4^2=30, 5..8=174, 9..12=446,
13..16=846). So the candidates' dot needs NO substitution on 950.
The candidates overall are still SVE2 (not SVE1): they also use SVE2
intrinsics svrshrnb (dct16 op895), svtbl2 (dct32 opbase), svaddlb
(dct32 op4032); revh/revw z.d are base SVE. So build with
-march=armv8.2-a+sve2 remains correct and docs/63 native flow is valid.

## Gates / correctness (native, gcc-16)

| candidate | TestBenchLite 5-seed | 20k diff vs upstream |
| --- | --- | --- |
| dct16 op895 | PASS | 0 mismatches |
| dct32 opbase | PASS | 0 mismatches |
| dct32 op4032 | PASS | 5300/20M lanes mismatch (matches C ref exactly; upstream SVE has its own tiny latent divergence; legacy-internal-exact) |

## Paired CNTVCT (ratio = baseline/cand; >1 = cand faster)

| kernel | baseline | median | bootstrap95 | fused_uop |
| --- | --- | ---: | ---: | ---: |
| dct16 op895 | sve (upstream) | 1.2917 | [1.2917,1.3333] | 895 |
| dct16 op895 | neon | 0.875 | [0.875,0.875] | - (NEON still faster) |
| dct32 opbase | sve (upstream) | 0.9955 | [0.9867,1.0138] | 8114 |
| dct32 opbase | neon | 0.8036 | [0.7991,0.8097] | - (slower than NEON) |
| dct32 op4032 | sve (upstream) | 1.7269 | [1.7071,1.8075] | 4032 |
| dct32 op4032 | neon | 1.3910 | [1.3712,1.5083] | - |

## Conclusions / interpretation

1. dct16 op895 is +29% over the SVE kernel x265 actually dispatches on 950
   (SVE overrides NEON in asm-primitives). NEON baseline still ~14% faster
   than op895, so E2E gain depends on whether dct16 is SVE-dispatched.
2. dct32 opbase (bit-exact, 8114 fused_uop) is PARITY-adjacent on 950
   (sve 0.9955); not a kernel-level win vs upstream SVE, and slower than
   NEON. Risk note: 8114 fused_uop reduction vs upstream does NOT convert
   to cycles on 950.
3. dct32 op4032 is a REAL win: +72.7% over upstream SVE dispatch and +39.1%
   over NEON. It matches C reference (TestBenchLite 5-seed PASS) but is NOT
   bit-exact vs upstream dct32_sve (5300/20M lanes) -> E2E bitstream would
   change; needs policy sign-off (docs/63 step 4).
4. No E2E run: /tmp/real_1080p_30f.yuv absent on this 950. Kernel-level
   numbers above are gated-verified per docs/63.
5. IR/VL128 items this pull are not 950-testable (VL=256 machine) - they
   target N1/920B/710 and were validated there upstream.

(note: conditional pairing of op4032 correctness: it equals C ref, the
upstream SVE asm differs -> candidate is the "correct" one; flag to author
for the small upstream SVE divergence.)
