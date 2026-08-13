	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_dct16_sve2_shared
	.type	dynopt_dct16_sve2_shared, %function
dynopt_dct16_sve2_shared:
.LFB3895:
	.cfi_startproc
	ptrue	p7.b, all
	ld1h	z26.h, p7/z, [x0, x2, lsl 1]
	ld1h	z21.h, p7/z, [x0]
	mov	z29.d, z26.d
	mov	z28.d, z21.d
	add	x0, x0, x2, lsl 2
	adrp	x6, .LANCHOR0
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	ld1h	z22.h, p7/z, [x0]
	add	x3, x6, :lo12:.LANCHOR0
	ld1h	z24.h, p7/z, [x3]
	tbl	z23.h, {z28.h - z29.h}, z24.h
	mov	z28.d, z22.d
	mov	z29.d, z27.d
	tbl	z25.h, {z28.h - z29.h}, z24.h
	rev	z28.h, z21.h
	rev	z29.h, z26.h
	tbl	z26.h, {z28.h - z29.h}, z24.h
	rev	z28.h, z22.h
	rev	z29.h, z27.h
	adrp	x4, _ZN12_GLOBAL__N_1L6idx_qaE
	tbl	z27.h, {z28.h - z29.h}, z24.h
	add	x4, x4, :lo12:_ZN12_GLOBAL__N_1L6idx_qaE
	mov	z28.d, z23.d
	mov	z29.d, z25.d
	ld1h	z31.h, p7/z, [x4]
	add	x0, x0, x2, lsl 2
	tbl	z20.h, {z28.h - z29.h}, z31.h
	adrp	x4, _ZN12_GLOBAL__N_1L6idx_qbE
	add	x4, x4, :lo12:_ZN12_GLOBAL__N_1L6idx_qbE
	ld1h	z30.h, p7/z, [x4]
	tbl	z25.h, {z28.h - z29.h}, z30.h
	mov	z29.d, z27.d
	mov	z28.d, z26.d
	tbl	z23.h, {z28.h - z29.h}, z31.h
	tbl	z28.h, {z28.h - z29.h}, z30.h
	ld1h	z22.h, p7/z, [x0]
	add	z4.h, z20.h, z23.h
	add	z5.h, z25.h, z28.h
	sub	z20.h, z20.h, z23.h
	sub	z25.h, z25.h, z28.h
	ld1h	z23.h, p7/z, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	mov	z19.d, z23.d
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	ld1h	z26.h, p7/z, [x0]
	mov	z29.d, z27.d
	mov	z28.d, z26.d
	mov	z18.d, z22.d
	tbl	z18.h, {z18.h - z19.h}, z24.h
	tbl	z19.h, {z28.h - z29.h}, z24.h
	rev	z29.h, z23.h
	rev	z28.h, z22.h
	tbl	z22.h, {z28.h - z29.h}, z24.h
	rev	z28.h, z26.h
	rev	z29.h, z27.h
	mov	z27.d, z19.d
	tbl	z23.h, {z28.h - z29.h}, z24.h
	mov	z26.d, z18.d
	mov	z29.d, z23.d
	tbl	z21.h, {z26.h - z27.h}, z31.h
	mov	z28.d, z22.d
	tbl	z26.h, {z26.h - z27.h}, z30.h
	tbl	z27.h, {z28.h - z29.h}, z31.h
	tbl	z28.h, {z28.h - z29.h}, z30.h
	add	x0, x0, x2, lsl 2
	add	z7.h, z26.h, z28.h
	ld1h	z19.h, p7/z, [x0, x2, lsl 1]
	ld1h	z17.h, p7/z, [x0]
	mov	z29.d, z19.d
	sub	z26.h, z26.h, z28.h
	mov	z28.d, z17.d
	add	x0, x0, x2, lsl 2
	tbl	z18.h, {z28.h - z29.h}, z24.h
	ld1h	z23.h, p7/z, [x0, x2, lsl 1]
	ld1h	z22.h, p7/z, [x0]
	mov	z29.d, z23.d
	mov	z28.d, z22.d
	add	z6.h, z21.h, z27.h
	sub	z21.h, z21.h, z27.h
	tbl	z27.h, {z28.h - z29.h}, z24.h
	rev	z28.h, z17.h
	rev	z29.h, z19.h
	tbl	z19.h, {z28.h - z29.h}, z24.h
	rev	z28.h, z22.h
	rev	z29.h, z23.h
	add	x0, x0, x2, lsl 2
	tbl	z23.h, {z28.h - z29.h}, z24.h
	mov	z28.d, z18.d
	mov	z29.d, z27.d
	ld1h	z2.h, p7/z, [x0, x2, lsl 1]
	tbl	z22.h, {z28.h - z29.h}, z31.h
	tbl	z27.h, {z28.h - z29.h}, z30.h
	ld1h	z1.h, p7/z, [x0]
	mov	z29.d, z23.d
	add	x0, x0, x2, lsl 2
	mov	z28.d, z19.d
	sub	sp, sp, #1280
	.cfi_def_cfa_offset 1280
	tbl	z18.h, {z28.h - z29.h}, z31.h
	tbl	z28.h, {z28.h - z29.h}, z30.h
	ld1h	z23.h, p7/z, [x0, x2, lsl 1]
	ld1h	z3.h, p7/z, [x0]
	mov	z19.d, z2.d
	mov	z29.d, z23.d
	add	z17.h, z27.h, z28.h
	add	x4, x3, 32
	add	x0, sp, 768
	sub	z27.h, z27.h, z28.h
	add	x3, x3, 544
	mov	z28.d, z3.d
	add	z16.h, z22.h, z18.h
	mov	x7, x3
	sub	z22.h, z22.h, z18.h
	mov	x2, x0
	mov	z18.d, z1.d
	tbl	z18.h, {z18.h - z19.h}, z24.h
	tbl	z19.h, {z28.h - z29.h}, z24.h
	rev	z28.h, z1.h
	rev	z29.h, z2.h
	tbl	z2.h, {z28.h - z29.h}, z24.h
	rev	z29.h, z23.h
	rev	z28.h, z3.h
	tbl	z3.h, {z28.h - z29.h}, z24.h
	mov	z28.d, z18.d
	mov	z29.d, z19.d
	mov	z18.d, z2.d
	tbl	z23.h, {z28.h - z29.h}, z31.h
	mov	z19.d, z3.d
	tbl	z31.h, {z18.h - z19.h}, z31.h
	tbl	z28.h, {z28.h - z29.h}, z30.h
	tbl	z30.h, {z18.h - z19.h}, z30.h
	add	z18.h, z23.h, z31.h
	add	z19.h, z28.h, z30.h
	sub	z23.h, z23.h, z31.h
	sub	z28.h, z28.h, z30.h
	movi	d31, #0
.L2:
	ld1h	z2.h, p7/z, [x4]
	ld1h	z3.h, p7/z, [x3]
	movprfx	z30, z31
	sdot	z30.d, z4.h, z2.h
	movprfx	z29, z31
	sdot	z29.d, z6.h, z2.h
	sdot	z30.d, z5.h, z3.h
	sdot	z29.d, z7.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	add	x5, x4, 32
	stp	d30, d29, [x2]
	movprfx	z30, z31
	sdot	z30.d, z16.h, z2.h
	movprfx	z29, z31
	sdot	z29.d, z18.h, z2.h
	sdot	z30.d, z17.h, z3.h
	sdot	z29.d, z19.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	stp	d30, d29, [x2, 16]
	ld1h	z2.h, p7/z, [x5]
	add	x5, x3, 32
	movprfx	z30, z31
	sdot	z30.d, z20.h, z2.h
	ld1h	z3.h, p7/z, [x5]
	movprfx	z29, z31
	sdot	z29.d, z21.h, z2.h
	sdot	z30.d, z25.h, z3.h
	sdot	z29.d, z26.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	add	x5, x4, 64
	stp	d30, d29, [x2, 32]
	movprfx	z30, z31
	sdot	z30.d, z22.h, z2.h
	movprfx	z29, z31
	sdot	z29.d, z23.h, z2.h
	sdot	z30.d, z27.h, z3.h
	sdot	z29.d, z28.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	stp	d30, d29, [x2, 48]
	ld1h	z2.h, p7/z, [x5]
	add	x5, x3, 64
	movprfx	z30, z31
	sdot	z30.d, z4.h, z2.h
	ld1h	z3.h, p7/z, [x5]
	movprfx	z29, z31
	sdot	z29.d, z6.h, z2.h
	sdot	z30.d, z5.h, z3.h
	sdot	z29.d, z7.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	add	x5, x4, 96
	stp	d30, d29, [x2, 64]
	movprfx	z30, z31
	sdot	z30.d, z16.h, z2.h
	movprfx	z29, z31
	sdot	z29.d, z18.h, z2.h
	sdot	z30.d, z17.h, z3.h
	sdot	z29.d, z19.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	stp	d30, d29, [x2, 80]
	ld1h	z2.h, p7/z, [x5]
	add	x5, x3, 96
	movprfx	z30, z31
	sdot	z30.d, z20.h, z2.h
	ld1h	z3.h, p7/z, [x5]
	movprfx	z29, z31
	sdot	z29.d, z21.h, z2.h
	sdot	z30.d, z25.h, z3.h
	sdot	z29.d, z26.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	add	x4, x4, 128
	stp	d30, d29, [x2, 96]
	movprfx	z30, z31
	sdot	z30.d, z22.h, z2.h
	movprfx	z29, z31
	sdot	z29.d, z23.h, z2.h
	sdot	z30.d, z27.h, z3.h
	sdot	z29.d, z28.h, z3.h
	uzp1	z30.s, z30.s, z30.s
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	stp	d30, d29, [x2, 112]
	add	x3, x3, 128
	add	x2, x2, 128
	cmp	x7, x4
	bne	.L2
	add	x9, x6, :lo12:.LANCHOR0
	add	x5, sp, 256
	add	x4, sp, 512
	add	x7, sp, 128
	mov	w3, 0
	ldr	q21, [x9, 1056]
	ldr	q22, [x9, 1072]
	.p2align 5,,15
.L3:
	asr	w2, w3, 1
	ldp	q25, q29, [x0]
	sbfiz	x2, x2, 4, 32
	ldp	q23, q30, [x0, 32]
	add	w3, w3, 2
	tbx	v29.16b, {v29.16b}, v21.16b
	add	x0, x0, 64
	tbx	v30.16b, {v30.16b}, v21.16b
	saddl2	v26.4s, v25.8h, v29.8h
	saddl	v31.4s, v25.4h, v29.4h
	saddl2	v27.4s, v23.8h, v30.8h
	saddl	v28.4s, v23.4h, v30.4h
	sub	v25.8h, v25.8h, v29.8h
	sub	v23.8h, v23.8h, v30.8h
	mov	v29.16b, v26.16b
	mov	v30.16b, v27.16b
	stp	q25, q23, [x5], 32
	tbx	v29.16b, {v26.16b}, v22.16b
	tbx	v30.16b, {v27.16b}, v22.16b
	sub	v26.4s, v31.4s, v29.4s
	sub	v27.4s, v28.4s, v30.4s
	add	v31.4s, v31.4s, v29.4s
	add	v30.4s, v28.4s, v30.4s
	stp	q26, q27, [x4], 32
	zip1	v29.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	rev64	v31.4s, v31.4s
	add	v30.4s, v31.4s, v29.4s
	sub	v29.4s, v29.4s, v31.4s
	str	q30, [sp, x2]
	str	q29, [x7, x2]
	cmp	w3, 16
	bne	.L3
	ldp	q3, q23, [sp, 256]
	mov	z17.d, z23.d
	mov	z16.d, z3.d
	add	x3, x6, :lo12:.LANCHOR0
	ptrue	p7.b, all
	ldp	q18, q31, [sp, 288]
	add	x0, x9, 1088
	ld1h	z30.h, p7/z, [x0]
	ldp	q4, q5, [sp, 320]
	tbl	z23.h, {z16.h - z17.h}, z24.h
	mov	z17.d, z31.d
	add	x7, x1, 32
	mov	z16.d, z18.d
	ldp	q6, q7, [sp, 352]
	tbl	z31.h, {z16.h - z17.h}, z24.h
	mov	z17.d, z31.d
	add	x5, x3, 64
	mov	z16.d, z23.d
	tbl	z3.h, {z16.h - z17.h}, z30.h
	ldp	q19, q20, [sp, 384]
	add	x4, x3, 576
	ldp	q21, q22, [sp, 416]
	mov	x0, 0
	ldp	q25, q26, [sp, 448]
	add	x9, x9, 1120
	ld1h	z29.h, p7/z, [x9]
	tbl	z16.h, {z16.h - z17.h}, z29.h
	ldp	q27, q28, [sp, 480]
	movi	d17, #0
	.p2align 5,,15
.L4:
	lsl	x2, x0, 1
	ld1h	z23.h, p7/z, [x5, x0, lsl 1]
	ld1h	z18.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z31, z17
	sdot	z31.d, z16.h, z18.h
	sdot	z31.d, z3.h, z23.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x7, x2]
	cmp	x0, 256
	bne	.L4
	ldr	q23, [x3, 1152]
	add	x3, x3, 1184
	ldp	q2, q3, [sp, 512]
	add	x0, x1, 192
	ldp	q16, q17, [sp, 544]
	add	x4, x1, 576
	mul	v18.4s, v3.4s, v23.4s
	mov	x2, x3
	mul	v31.4s, v2.4s, v23.4s
	addp	v31.4s, v31.4s, v18.4s
	mul	v18.4s, v16.4s, v23.4s
	mul	v23.4s, v17.4s, v23.4s
	addp	v23.4s, v18.4s, v23.4s
	addp	v31.4s, v31.4s, v23.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 64]
.L5:
	ldr	q23, [x2], 16
	mul	v18.4s, v3.4s, v23.4s
	mul	v31.4s, v2.4s, v23.4s
	addp	v31.4s, v31.4s, v18.4s
	mul	v18.4s, v16.4s, v23.4s
	mul	v23.4s, v17.4s, v23.4s
	addp	v23.4s, v18.4s, v23.4s
	addp	v31.4s, v31.4s, v23.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x0], 128
	cmp	x4, x0
	bne	.L5
	ldp	q31, q18, [sp]
	ptrue	p7.b, all
	add	x8, x6, :lo12:.LANCHOR0
	add	x7, x1, 40
	add	x5, x8, 64
	add	x4, x8, 576
	mov	x0, 0
	addp	v23.4s, v31.4s, v18.4s
	ldr	q3, [x8, 1232]
	shl	v23.4s, v23.4s, 6
	rshrn	v23.4h, v23.4s, 10
	str	d23, [x1]
	ldp	q23, q16, [sp, 128]
	mul	v17.4s, v23.4s, v3.4s
	mul	v3.4s, v16.4s, v3.4s
	addp	v17.4s, v17.4s, v3.4s
	rshrn	v17.4h, v17.4s, 10
	str	d17, [x1, 128]
	ldr	q17, [x8, 1248]
	mul	v18.4s, v18.4s, v17.4s
	mul	v31.4s, v31.4s, v17.4s
	mov	z17.d, z5.d
	addp	v31.4s, v31.4s, v18.4s
	ldr	q18, [x8, 1264]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 256]
	mul	v31.4s, v23.4s, v18.4s
	mul	v23.4s, v16.4s, v18.4s
	mov	z16.d, z4.d
	addp	v31.4s, v31.4s, v23.4s
	tbl	z23.h, {z16.h - z17.h}, z24.h
	mov	z17.d, z7.d
	mov	z16.d, z6.d
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 384]
	tbl	z31.h, {z16.h - z17.h}, z24.h
	mov	z17.d, z31.d
	mov	z16.d, z23.d
	tbl	z7.h, {z16.h - z17.h}, z30.h
	tbl	z16.h, {z16.h - z17.h}, z29.h
	movi	d17, #0
	.p2align 5,,15
.L6:
	lsl	x2, x0, 1
	ld1h	z23.h, p7/z, [x5, x0, lsl 1]
	ld1h	z18.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z31, z17
	sdot	z31.d, z16.h, z18.h
	sdot	z31.d, z7.h, z23.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x7, x2]
	cmp	x0, 256
	bne	.L6
	ldr	q23, [x8, 1152]
	add	x0, x1, 200
	ldp	q6, q7, [sp, 576]
	add	x4, x1, 584
	ldp	q16, q17, [sp, 608]
	mov	x2, x3
	mul	v18.4s, v7.4s, v23.4s
	mul	v31.4s, v6.4s, v23.4s
	addp	v31.4s, v31.4s, v18.4s
	mul	v18.4s, v16.4s, v23.4s
	mul	v23.4s, v17.4s, v23.4s
	addp	v23.4s, v18.4s, v23.4s
	addp	v31.4s, v31.4s, v23.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 72]
.L7:
	ldr	q23, [x2], 16
	mul	v18.4s, v7.4s, v23.4s
	mul	v31.4s, v6.4s, v23.4s
	addp	v31.4s, v31.4s, v18.4s
	mul	v18.4s, v16.4s, v23.4s
	mul	v23.4s, v17.4s, v23.4s
	addp	v23.4s, v18.4s, v23.4s
	addp	v31.4s, v31.4s, v23.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x0], 128
	cmp	x0, x4
	bne	.L7
	ldp	q31, q18, [sp, 32]
	ptrue	p7.b, all
	add	x8, x6, :lo12:.LANCHOR0
	add	x7, x1, 48
	add	x5, x8, 64
	add	x4, x8, 576
	mov	x0, 0
	addp	v23.4s, v31.4s, v18.4s
	ldr	q7, [x8, 1232]
	shl	v23.4s, v23.4s, 6
	rshrn	v23.4h, v23.4s, 10
	str	d23, [x1, 8]
	ldp	q23, q16, [sp, 160]
	mul	v17.4s, v23.4s, v7.4s
	mul	v7.4s, v16.4s, v7.4s
	addp	v17.4s, v17.4s, v7.4s
	rshrn	v17.4h, v17.4s, 10
	str	d17, [x1, 136]
	ldr	q17, [x8, 1248]
	mul	v18.4s, v18.4s, v17.4s
	mul	v31.4s, v31.4s, v17.4s
	mov	z17.d, z20.d
	movi	d20, #0
	addp	v31.4s, v31.4s, v18.4s
	ldr	q18, [x8, 1264]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 264]
	mul	v31.4s, v23.4s, v18.4s
	mul	v23.4s, v16.4s, v18.4s
	mov	z16.d, z19.d
	mov	z19.d, z22.d
	tbl	z22.h, {z16.h - z17.h}, z24.h
	mov	z18.d, z21.d
	tbl	z18.h, {z18.h - z19.h}, z24.h
	addp	v31.4s, v31.4s, v23.4s
	mov	z23.d, z18.d
	tbl	z19.h, {z22.h - z23.h}, z30.h
	tbl	z22.h, {z16.h - z17.h}, z24.h
	tbl	z22.h, {z22.h - z23.h}, z29.h
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 392]
	.p2align 5,,15
.L8:
	lsl	x2, x0, 1
	ld1h	z23.h, p7/z, [x5, x0, lsl 1]
	ld1h	z21.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z31, z20
	sdot	z31.d, z22.h, z21.h
	sdot	z31.d, z19.h, z23.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x7, x2]
	cmp	x0, 256
	bne	.L8
	ldr	q23, [x8, 1152]
	add	x0, x1, 208
	ldp	q18, q19, [sp, 640]
	add	x4, x1, 592
	ldp	q20, q21, [sp, 672]
	mov	x2, x3
	mul	v22.4s, v19.4s, v23.4s
	mul	v31.4s, v18.4s, v23.4s
	addp	v31.4s, v31.4s, v22.4s
	mul	v22.4s, v20.4s, v23.4s
	mul	v23.4s, v21.4s, v23.4s
	addp	v23.4s, v22.4s, v23.4s
	addp	v31.4s, v31.4s, v23.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 80]
.L9:
	ldr	q23, [x2], 16
	mul	v22.4s, v19.4s, v23.4s
	mul	v31.4s, v18.4s, v23.4s
	addp	v31.4s, v31.4s, v22.4s
	mul	v22.4s, v20.4s, v23.4s
	mul	v23.4s, v21.4s, v23.4s
	addp	v23.4s, v22.4s, v23.4s
	addp	v31.4s, v31.4s, v23.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x0], 128
	cmp	x0, x4
	bne	.L9
	ldp	q31, q22, [sp, 64]
	ptrue	p7.b, all
	add	x8, x6, :lo12:.LANCHOR0
	add	x7, x1, 56
	add	x5, x8, 64
	add	x4, x8, 576
	mov	x0, 0
	addp	v23.4s, v31.4s, v22.4s
	ldr	q19, [x8, 1232]
	shl	v23.4s, v23.4s, 6
	rshrn	v23.4h, v23.4s, 10
	str	d23, [x1, 16]
	ldp	q23, q20, [sp, 192]
	mul	v21.4s, v23.4s, v19.4s
	mul	v19.4s, v20.4s, v19.4s
	addp	v21.4s, v21.4s, v19.4s
	rshrn	v21.4h, v21.4s, 10
	str	d21, [x1, 144]
	ldr	q21, [x8, 1248]
	mul	v22.4s, v22.4s, v21.4s
	mul	v31.4s, v31.4s, v21.4s
	addp	v31.4s, v31.4s, v22.4s
	ldr	q22, [x8, 1264]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 272]
	mul	v31.4s, v23.4s, v22.4s
	mul	v23.4s, v20.4s, v22.4s
	mov	z22.d, z25.d
	addp	v31.4s, v31.4s, v23.4s
	mov	z23.d, z26.d
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 400]
	tbl	z31.h, {z22.h - z23.h}, z24.h
	mov	z22.d, z27.d
	mov	z23.d, z28.d
	tbl	z27.h, {z22.h - z23.h}, z24.h
	mov	z26.d, z31.d
	tbl	z30.h, {z26.h - z27.h}, z30.h
	tbl	z27.h, {z22.h - z23.h}, z24.h
	tbl	z26.h, {z26.h - z27.h}, z29.h
	movi	d27, #0
	.p2align 5,,15
.L10:
	lsl	x2, x0, 1
	ld1h	z29.h, p7/z, [x5, x0, lsl 1]
	ld1h	z28.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z31, z27
	sdot	z31.d, z26.h, z28.h
	sdot	z31.d, z30.h, z29.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x7, x2]
	cmp	x0, 256
	bne	.L10
	ldr	q1, [x8, 1152]
	add	x0, x1, 216
	ldp	q31, q30, [sp, 704]
	add	x2, x1, 600
	ldp	q29, q28, [sp, 736]
	mul	v4.4s, v31.4s, v1.4s
	mul	v3.4s, v30.4s, v1.4s
	mul	v2.4s, v29.4s, v1.4s
	mul	v1.4s, v28.4s, v1.4s
	addp	v3.4s, v4.4s, v3.4s
	addp	v1.4s, v2.4s, v1.4s
	addp	v1.4s, v3.4s, v1.4s
	rshrn	v1.4h, v1.4s, 10
	str	d1, [x1, 88]
.L11:
	ldr	q25, [x3], 16
	mul	v0.4s, v31.4s, v25.4s
	mul	v27.4s, v30.4s, v25.4s
	mul	v26.4s, v29.4s, v25.4s
	mul	v25.4s, v28.4s, v25.4s
	addp	v27.4s, v0.4s, v27.4s
	addp	v25.4s, v26.4s, v25.4s
	addp	v25.4s, v27.4s, v25.4s
	rshrn	v25.4h, v25.4s, 10
	str	d25, [x0], 128
	cmp	x0, x2
	bne	.L11
	add	x6, x6, :lo12:.LANCHOR0
	ldp	q21, q20, [sp, 224]
	ldr	q6, [x6, 1232]
	ldr	q5, [x6, 1248]
	ldr	q19, [x6, 1264]
	ldp	q24, q23, [sp, 96]
	mul	v22.4s, v21.4s, v6.4s
	mul	v21.4s, v21.4s, v19.4s
	addp	v7.4s, v24.4s, v23.4s
	mul	v6.4s, v20.4s, v6.4s
	mul	v24.4s, v24.4s, v5.4s
	mul	v19.4s, v20.4s, v19.4s
	mul	v5.4s, v23.4s, v5.4s
	addp	v6.4s, v22.4s, v6.4s
	shl	v7.4s, v7.4s, 6
	addp	v19.4s, v21.4s, v19.4s
	addp	v5.4s, v24.4s, v5.4s
	rshrn	v6.4h, v6.4s, 10
	rshrn	v7.4h, v7.4s, 10
	rshrn	v19.4h, v19.4s, 10
	rshrn	v5.4h, v5.4s, 10
	str	d6, [x1, 152]
	str	d7, [x1, 24]
	str	d19, [x1, 408]
	str	d5, [x1, 280]
	add	sp, sp, 1280
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3895:
	.size	dynopt_dct16_sve2_shared, .-dynopt_dct16_sve2_shared
	.set	_ZN12_GLOBAL__N_1L6idx_qbE,_ZN12_GLOBAL__N_1L6idx_q1E
	.set	_ZN12_GLOBAL__N_1L6idx_qaE,_ZN12_GLOBAL__N_1L6idx_q0E
	.section	.rodata
	.align	4
	.set	.LANCHOR0,. + 0
	.type	_ZN12_GLOBAL__N_1L6idx_loE, %object
	.size	_ZN12_GLOBAL__N_1L6idx_loE, 32
_ZN12_GLOBAL__N_1L6idx_loE:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.type	_ZN12_GLOBAL__N_1L5CQ_LOE, %object
	.size	_ZN12_GLOBAL__N_1L5CQ_LOE, 512
_ZN12_GLOBAL__N_1L5CQ_LOE:
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.type	_ZN12_GLOBAL__N_1L5CQ_HIE, %object
	.size	_ZN12_GLOBAL__N_1L5CQ_HIE, 512
_ZN12_GLOBAL__N_1L5CQ_HIE:
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
.LC0:
	.byte	14
	.byte	15
	.byte	12
	.byte	13
	.byte	10
	.byte	11
	.byte	8
	.byte	9
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	2
	.byte	3
	.byte	0
	.byte	1
.LC1:
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.type	_ZN12_GLOBAL__N_1L6idx_q0E, %object
	.size	_ZN12_GLOBAL__N_1L6idx_q0E, 32
_ZN12_GLOBAL__N_1L6idx_q0E:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	24
	.hword	25
	.hword	26
	.hword	27
	.type	_ZN12_GLOBAL__N_1L6idx_q1E, %object
	.size	_ZN12_GLOBAL__N_1L6idx_q1E, 32
_ZN12_GLOBAL__N_1L6idx_q1E:
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.hword	28
	.hword	29
	.hword	30
	.hword	31
.LC2:
	.word	89
	.word	75
	.word	50
	.word	18
	.type	_ZN12_GLOBAL__N_1L8GT16_S32E, %object
	.size	_ZN12_GLOBAL__N_1L8GT16_S32E, 64
_ZN12_GLOBAL__N_1L8GT16_S32E:
	.word	89
	.word	75
	.word	50
	.word	18
	.word	75
	.word	-18
	.word	-89
	.word	-50
	.word	50
	.word	-89
	.word	18
	.word	75
	.word	18
	.word	-50
	.word	75
	.word	-89
.LC3:
	.word	83
	.word	36
	.word	83
	.word	36
.LC4:
	.word	64
	.word	-64
	.word	64
	.word	-64
.LC5:
	.word	36
	.word	-83
	.word	36
	.word	-83
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
