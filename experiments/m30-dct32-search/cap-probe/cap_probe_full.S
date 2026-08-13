// Full instruction-capability probe for 920B (SVE1) vs 920G/960 (SVE2).
// Each function executes exactly one interesting instruction and stores a
// lane to memory; the C driver forks so an illegal instruction becomes a
// clean SIGILL report instead of killing the whole probe.
	.arch armv8.2-a+sve
	.text

// SVE v1: sdot z.d <- z.h x z.h (4-way, s16 -> s64)
	.global probe_sdot_d
	.type probe_sdot_d, %function
probe_sdot_d:
	ptrue	p0.b
	ld1h	z1.h, p0/z, [x0]
	ld1h	z2.h, p0/z, [x1]
	mov	z0.d, #0
	sdot	z0.d, z1.h, z2.h
	st1h	z0.h, p0, [x2]
	ret
	.size probe_sdot_d, .-probe_sdot_d

// SVE v1: unpredicated uzp1 (narrowing).
	.global probe_uzp1
	.type probe_uzp1, %function
probe_uzp1:
	ptrue	p0.b
	ld1w	z1.s, p0/z, [x0]
	uzp1	z0.s, z1.s, z1.s
	st1w	z0.s, p0, [x2]
	ret
	.size probe_uzp1, .-probe_uzp1

// SVE v1: sunpklo (sign-extending unpack).
	.global probe_sunpklo
	.type probe_sunpklo, %function
probe_sunpklo:
	ptrue	p0.b
	ld1h	z1.h, p0/z, [x0]
	sunpklo	z0.s, z1.h
	st1w	z0.s, p0, [x2]
	ret
	.size probe_sunpklo, .-probe_sunpklo

	.arch armv8.2-a+sve2

// SVE2: rshrnb (rounding shift-right narrow, immediate).
	.global probe_rshrnb
	.type probe_rshrnb, %function
probe_rshrnb:
	ptrue	p0.b
	ld1w	z1.s, p0/z, [x0]
	rshrnb	z0.h, z1.s, #4
	st1h	z0.h, p0, [x2]
	ret
	.size probe_rshrnb, .-probe_rshrnb

// SVE2: multi-vector TBL (two consecutive table registers).
	.global probe_tbl2
	.type probe_tbl2, %function
probe_tbl2:
	ptrue	p0.b
	ld1h	z1.h, p0/z, [x0]
	ld1h	z2.h, p0/z, [x1]
	mov	z3.h, #0
	tbl	z0.h, {z1.h - z2.h}, z3.h
	st1h	z0.h, p0, [x2]
	ret
	.size probe_tbl2, .-probe_tbl2

