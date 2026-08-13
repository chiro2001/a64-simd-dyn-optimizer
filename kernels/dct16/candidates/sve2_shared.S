	.arch armv8.2-a+crc+sve2
	.file	"sve2_shared.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_dct16_sve2_shared
	.type	dynopt_dct16_sve2_shared, %function
dynopt_dct16_sve2_shared:
.LFB3895:
	.cfi_startproc
	sub	sp, sp, #1312
	.cfi_def_cfa_offset 1312
	ptrue	p7.b, all
	adrp	x9, .LANCHOR0
	add	x6, x9, :lo12:.LANCHOR0
	ld1h	z29.h, p7/z, [x6]
	add	x11, sp, 808
	add	x3, x6, 32
	ld1h	z28.h, p7/z, [x3]
	add	x7, x6, 96
	stp	d13, d14, [sp]
	ld1h	z25.h, p7/z, [x0, x2, lsl 1]
	ld1h	z21.h, p7/z, [x0]
	rev	z18.h, z25.h
	rev	z17.h, z21.h
	add	z31.h, z25.h, z18.h
	add	z30.h, z21.h, z17.h
	add	x0, x0, x2, lsl 2
	tbl	z23.h, {z30.h - z31.h}, z29.h
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	ld1h	z22.h, p7/z, [x0]
	rev	z20.h, z27.h
	rev	z19.h, z22.h
	add	z31.h, z27.h, z20.h
	add	z30.h, z22.h, z19.h
	tbl	z24.h, {z30.h - z31.h}, z29.h
	sub	z30.h, z21.h, z17.h
	sub	z31.h, z25.h, z18.h
	tbl	z25.h, {z30.h - z31.h}, z29.h
	sub	z30.h, z22.h, z19.h
	sub	z31.h, z27.h, z20.h
	add	x0, x0, x2, lsl 2
	tbl	z27.h, {z30.h - z31.h}, z29.h
	mov	z30.d, z23.d
	mov	z31.d, z24.d
	mov	z21.d, z27.d
	add	x3, x6, 64
	mov	z20.d, z25.d
	ld1h	z26.h, p7/z, [x3]
	ld1h	z25.h, p7/z, [x0, x2, lsl 1]
	tbl	z3.h, {z30.h - z31.h}, z28.h
	rev	z16.h, z25.h
	tbl	z19.h, {z30.h - z31.h}, z26.h
	tbl	z4.h, {z20.h - z21.h}, z28.h
	add	z31.h, z25.h, z16.h
	tbl	z20.h, {z20.h - z21.h}, z26.h
	ld1h	z21.h, p7/z, [x0]
	add	x0, x0, x2, lsl 2
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	ld1h	z22.h, p7/z, [x0]
	str	d15, [sp, 16]
	.cfi_offset 77, -1312
	.cfi_offset 78, -1304
	.cfi_offset 79, -1296
	rev	z15.h, z21.h
	add	z30.h, z21.h, z15.h
	rev	z17.h, z22.h
	rev	z18.h, z27.h
	tbl	z23.h, {z30.h - z31.h}, z29.h
	add	z30.h, z22.h, z17.h
	add	z31.h, z27.h, z18.h
	tbl	z24.h, {z30.h - z31.h}, z29.h
	sub	z30.h, z21.h, z15.h
	sub	z31.h, z25.h, z16.h
	tbl	z25.h, {z30.h - z31.h}, z29.h
	sub	z30.h, z22.h, z17.h
	sub	z31.h, z27.h, z18.h
	add	x0, x0, x2, lsl 2
	tbl	z27.h, {z30.h - z31.h}, z29.h
	mov	z30.d, z23.d
	mov	z31.d, z24.d
	mov	z23.d, z27.d
	ld1h	z18.h, p7/z, [x0, x2, lsl 1]
	ld1h	z17.h, p7/z, [x0]
	rev	z14.h, z18.h
	add	x0, x0, x2, lsl 2
	mov	z22.d, z25.d
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	add	z25.h, z18.h, z14.h
	rev	z16.h, z27.h
	tbl	z5.h, {z30.h - z31.h}, z28.h
	tbl	z21.h, {z30.h - z31.h}, z26.h
	tbl	z6.h, {z22.h - z23.h}, z28.h
	add	z31.h, z27.h, z16.h
	tbl	z22.h, {z22.h - z23.h}, z26.h
	ld1h	z23.h, p7/z, [x0]
	rev	z15.h, z23.h
	add	z30.h, z23.h, z15.h
	rev	z13.h, z17.h
	add	z24.h, z17.h, z13.h
	tbl	z24.h, {z24.h - z25.h}, z29.h
	tbl	z25.h, {z30.h - z31.h}, z29.h
	sub	z30.h, z17.h, z13.h
	sub	z31.h, z18.h, z14.h
	tbl	z18.h, {z30.h - z31.h}, z29.h
	sub	z30.h, z23.h, z15.h
	sub	z31.h, z27.h, z16.h
	tbl	z27.h, {z30.h - z31.h}, z29.h
	mov	z30.d, z24.d
	mov	z31.d, z25.d
	mov	z25.d, z27.d
	add	x0, x0, x2, lsl 2
	mov	z24.d, z18.d
	tbl	z7.h, {z30.h - z31.h}, z28.h
	tbl	z23.h, {z30.h - z31.h}, z26.h
	tbl	z16.h, {z24.h - z25.h}, z28.h
	tbl	z24.h, {z24.h - z25.h}, z26.h
	ld1h	z25.h, p7/z, [x0]
	rev	z13.h, z25.h
	add	z30.h, z25.h, z13.h
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	rev	z2.h, z27.h
	ld1h	z1.h, p7/z, [x0]
	add	z31.h, z27.h, z2.h
	rev	z14.h, z1.h
	tbl	z0.h, {z30.h - z31.h}, z29.h
	add	z30.h, z1.h, z14.h
	ld1h	z17.h, p7/z, [x0, x2, lsl 1]
	add	x3, sp, 800
	rev	z15.h, z17.h
	add	z31.h, z17.h, z15.h
	tbl	z18.h, {z30.h - z31.h}, z29.h
	sub	z30.h, z25.h, z13.h
	sub	z31.h, z27.h, z2.h
	mov	x5, x3
	tbl	z2.h, {z30.h - z31.h}, z29.h
	add	x10, sp, 816
	sub	z30.h, z1.h, z14.h
	add	x8, sp, 824
	add	x6, x6, 608
	sub	z31.h, z17.h, z15.h
	mov	x0, 0
	tbl	z27.h, {z30.h - z31.h}, z29.h
	mov	w2, 0
	mov	z30.d, z0.d
	mov	z31.d, z18.d
	tbl	z17.h, {z30.h - z31.h}, z28.h
	tbl	z25.h, {z30.h - z31.h}, z26.h
	mov	z30.d, z2.d
	mov	z31.d, z27.d
	tbl	z18.h, {z30.h - z31.h}, z28.h
	tbl	z27.h, {z30.h - z31.h}, z26.h
	movi	d30, #0
	.p2align 5,,15
.L4:
	ld1h	z1.h, p7/z, [x7, x0, lsl 1]
	ld1h	z2.h, p7/z, [x6, x0, lsl 1]
	tbz	x2, 0, .L31
.L2:
	lsl	x4, x0, 1
	movprfx	z31, z30
	sdot	z31.d, z4.h, z1.h
	sdot	z31.d, z20.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x5]
	movprfx	z31, z30
	sdot	z31.d, z6.h, z1.h
	sdot	z31.d, z22.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x11, x4]
	movprfx	z31, z30
	sdot	z31.d, z16.h, z1.h
	sdot	z31.d, z24.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x10, x4]
	add	w2, w2, 1
	movprfx	z31, z30
	sdot	z31.d, z18.h, z1.h
	sdot	z31.d, z27.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x8, x4]
	cmp	w2, 16
	beq	.L32
	add	x0, x0, 16
	add	x5, x5, 32
	ld1h	z1.h, p7/z, [x7, x0, lsl 1]
	ld1h	z2.h, p7/z, [x6, x0, lsl 1]
	tbnz	x2, 0, .L2
.L31:
	lsl	x4, x0, 1
	movprfx	z31, z30
	sdot	z31.d, z3.h, z1.h
	sdot	z31.d, z19.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x5], 32
	movprfx	z31, z30
	sdot	z31.d, z5.h, z1.h
	sdot	z31.d, z21.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x11, x4]
	movprfx	z31, z30
	sdot	z31.d, z7.h, z1.h
	sdot	z31.d, z23.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x10, x4]
	add	w2, w2, 1
	movprfx	z31, z30
	sdot	z31.d, z17.h, z1.h
	add	x0, x0, 16
	sdot	z31.d, z25.h, z2.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x8, x4]
	b	.L4
	.p2align 2,,3
.L32:
	add	x0, x9, :lo12:.LANCHOR0
	add	x5, sp, 288
	add	x4, sp, 544
	add	x7, sp, 32
	add	x6, sp, 160
	mov	w2, 0
	ldr	q19, [x0, 1120]
	ldr	q20, [x0, 1136]
	.p2align 5,,15
.L5:
	asr	w0, w2, 1
	ldp	q22, q27, [x3]
	sbfiz	x0, x0, 4, 32
	ldp	q21, q30, [x3, 32]
	add	w2, w2, 2
	tbx	v27.16b, {v27.16b}, v19.16b
	add	x3, x3, 64
	tbx	v30.16b, {v30.16b}, v19.16b
	saddl2	v23.4s, v22.8h, v27.8h
	saddl	v31.4s, v22.4h, v27.4h
	saddl2	v24.4s, v21.8h, v30.8h
	saddl	v25.4s, v21.4h, v30.4h
	sub	v22.8h, v22.8h, v27.8h
	sub	v21.8h, v21.8h, v30.8h
	mov	v27.16b, v23.16b
	mov	v30.16b, v24.16b
	stp	q22, q21, [x5], 32
	tbx	v27.16b, {v23.16b}, v20.16b
	tbx	v30.16b, {v24.16b}, v20.16b
	sub	v23.4s, v31.4s, v27.4s
	sub	v24.4s, v25.4s, v30.4s
	add	v31.4s, v31.4s, v27.4s
	add	v30.4s, v25.4s, v30.4s
	stp	q23, q24, [x4], 32
	zip1	v27.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	rev64	v31.4s, v31.4s
	add	v30.4s, v31.4s, v27.4s
	sub	v27.4s, v27.4s, v31.4s
	str	q30, [x7, x0]
	str	q27, [x6, x0]
	cmp	w2, 16
	bne	.L5
	ldp	q15, q23, [sp, 288]
	mov	z17.d, z23.d
	mov	z16.d, z15.d
	add	x3, x9, :lo12:.LANCHOR0
	ptrue	p7.b, all
	ldp	q18, q31, [sp, 320]
	add	x6, x1, 32
	ldp	q4, q5, [sp, 352]
	tbl	z23.h, {z16.h - z17.h}, z29.h
	mov	z17.d, z31.d
	add	x5, x3, 128
	mov	z16.d, z18.d
	ldp	q6, q7, [sp, 384]
	tbl	z31.h, {z16.h - z17.h}, z29.h
	mov	z17.d, z31.d
	add	x4, x3, 640
	mov	z16.d, z23.d
	tbl	z3.h, {z16.h - z17.h}, z28.h
	ldp	q19, q20, [sp, 416]
	tbl	z16.h, {z16.h - z17.h}, z26.h
	movi	d17, #0
	mov	x0, 0
	ldp	q21, q22, [sp, 448]
	ldp	q24, q25, [sp, 480]
	ldp	q27, q30, [sp, 512]
	.p2align 5,,15
.L6:
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
	str	d31, [x6, x2]
	cmp	x0, 256
	bne	.L6
	ldr	q23, [x3, 1152]
	add	x3, x3, 1184
	ldp	q2, q3, [sp, 544]
	add	x0, x1, 192
	ldp	q16, q17, [sp, 576]
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
.L7:
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
	bne	.L7
	ldp	q31, q18, [sp, 32]
	ptrue	p7.b, all
	add	x7, x9, :lo12:.LANCHOR0
	add	x6, x1, 40
	add	x5, x7, 128
	add	x4, x7, 640
	mov	x0, 0
	addp	v23.4s, v31.4s, v18.4s
	ldr	q3, [x7, 1232]
	shl	v23.4s, v23.4s, 6
	rshrn	v23.4h, v23.4s, 10
	str	d23, [x1]
	ldp	q23, q16, [sp, 160]
	mul	v17.4s, v23.4s, v3.4s
	mul	v3.4s, v16.4s, v3.4s
	addp	v17.4s, v17.4s, v3.4s
	rshrn	v17.4h, v17.4s, 10
	str	d17, [x1, 128]
	ldr	q17, [x7, 1248]
	mul	v18.4s, v18.4s, v17.4s
	mul	v31.4s, v31.4s, v17.4s
	mov	z17.d, z5.d
	addp	v31.4s, v31.4s, v18.4s
	ldr	q18, [x7, 1264]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 256]
	mul	v31.4s, v23.4s, v18.4s
	mul	v23.4s, v16.4s, v18.4s
	mov	z16.d, z4.d
	addp	v31.4s, v31.4s, v23.4s
	tbl	z23.h, {z16.h - z17.h}, z29.h
	mov	z17.d, z7.d
	mov	z16.d, z6.d
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 384]
	tbl	z31.h, {z16.h - z17.h}, z29.h
	mov	z17.d, z31.d
	mov	z16.d, z23.d
	tbl	z7.h, {z16.h - z17.h}, z28.h
	tbl	z16.h, {z16.h - z17.h}, z26.h
	movi	d17, #0
	.p2align 5,,15
.L8:
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
	str	d31, [x6, x2]
	cmp	x0, 256
	bne	.L8
	ldr	q23, [x7, 1152]
	add	x0, x1, 200
	ldp	q6, q7, [sp, 608]
	add	x4, x1, 584
	ldp	q16, q17, [sp, 640]
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
.L9:
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
	bne	.L9
	ldp	q31, q18, [sp, 64]
	ptrue	p7.b, all
	add	x7, x9, :lo12:.LANCHOR0
	add	x6, x1, 48
	add	x5, x7, 128
	add	x4, x7, 640
	mov	x0, 0
	addp	v23.4s, v31.4s, v18.4s
	ldr	q7, [x7, 1232]
	shl	v23.4s, v23.4s, 6
	rshrn	v23.4h, v23.4s, 10
	str	d23, [x1, 8]
	ldp	q23, q16, [sp, 192]
	mul	v17.4s, v23.4s, v7.4s
	mul	v7.4s, v16.4s, v7.4s
	addp	v17.4s, v17.4s, v7.4s
	rshrn	v17.4h, v17.4s, 10
	str	d17, [x1, 136]
	ldr	q17, [x7, 1248]
	mul	v18.4s, v18.4s, v17.4s
	mul	v31.4s, v31.4s, v17.4s
	mov	z17.d, z20.d
	movi	d20, #0
	addp	v31.4s, v31.4s, v18.4s
	ldr	q18, [x7, 1264]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 264]
	mul	v31.4s, v23.4s, v18.4s
	mul	v23.4s, v16.4s, v18.4s
	mov	z16.d, z19.d
	mov	z19.d, z22.d
	tbl	z22.h, {z16.h - z17.h}, z29.h
	mov	z18.d, z21.d
	tbl	z18.h, {z18.h - z19.h}, z29.h
	addp	v31.4s, v31.4s, v23.4s
	mov	z23.d, z18.d
	tbl	z19.h, {z22.h - z23.h}, z28.h
	tbl	z22.h, {z16.h - z17.h}, z29.h
	tbl	z22.h, {z22.h - z23.h}, z26.h
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 392]
	.p2align 5,,15
.L10:
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
	str	d31, [x6, x2]
	cmp	x0, 256
	bne	.L10
	ldr	q23, [x7, 1152]
	add	x0, x1, 208
	ldp	q18, q19, [sp, 672]
	add	x4, x1, 592
	ldp	q20, q21, [sp, 704]
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
.L11:
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
	bne	.L11
	ldp	q31, q22, [sp, 96]
	ptrue	p7.b, all
	add	x7, x9, :lo12:.LANCHOR0
	add	x6, x1, 56
	add	x5, x7, 128
	add	x4, x7, 640
	mov	x0, 0
	addp	v23.4s, v31.4s, v22.4s
	ldr	q19, [x7, 1232]
	shl	v23.4s, v23.4s, 6
	rshrn	v23.4h, v23.4s, 10
	str	d23, [x1, 16]
	ldp	q23, q20, [sp, 224]
	mul	v21.4s, v23.4s, v19.4s
	mul	v19.4s, v20.4s, v19.4s
	addp	v21.4s, v21.4s, v19.4s
	rshrn	v21.4h, v21.4s, 10
	str	d21, [x1, 144]
	ldr	q21, [x7, 1248]
	mul	v22.4s, v22.4s, v21.4s
	mul	v31.4s, v31.4s, v21.4s
	addp	v31.4s, v31.4s, v22.4s
	ldr	q22, [x7, 1264]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 272]
	mul	v31.4s, v23.4s, v22.4s
	mul	v23.4s, v20.4s, v22.4s
	mov	z22.d, z24.d
	mov	z24.d, z27.d
	addp	v31.4s, v31.4s, v23.4s
	mov	z23.d, z25.d
	mov	z25.d, z30.d
	tbl	z30.h, {z22.h - z23.h}, z29.h
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 400]
	tbl	z31.h, {z24.h - z25.h}, z29.h
	tbl	z28.h, {z30.h - z31.h}, z28.h
	tbl	z30.h, {z22.h - z23.h}, z29.h
	tbl	z31.h, {z24.h - z25.h}, z29.h
	tbl	z30.h, {z30.h - z31.h}, z26.h
	movi	d26, #0
	.p2align 5,,15
.L12:
	lsl	x2, x0, 1
	ld1h	z29.h, p7/z, [x5, x0, lsl 1]
	ld1h	z27.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z31, z26
	sdot	z31.d, z30.h, z27.h
	sdot	z31.d, z28.h, z29.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x6, x2]
	cmp	x0, 256
	bne	.L12
	ldr	q1, [x7, 1152]
	add	x0, x1, 216
	ldp	q31, q30, [sp, 736]
	add	x2, x1, 600
	ldp	q29, q28, [sp, 768]
	mul	v4.4s, v31.4s, v1.4s
	mul	v3.4s, v30.4s, v1.4s
	mul	v2.4s, v29.4s, v1.4s
	mul	v1.4s, v28.4s, v1.4s
	addp	v3.4s, v4.4s, v3.4s
	addp	v1.4s, v2.4s, v1.4s
	addp	v1.4s, v3.4s, v1.4s
	rshrn	v1.4h, v1.4s, 10
	str	d1, [x1, 88]
.L13:
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
	bne	.L13
	add	x9, x9, :lo12:.LANCHOR0
	ldr	d15, [sp, 16]
	ldp	q21, q20, [sp, 256]
	ldr	q6, [x9, 1232]
	ldr	q5, [x9, 1248]
	ldr	q19, [x9, 1264]
	ldp	q24, q23, [sp, 128]
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
	ldp	d13, d14, [sp]
	add	sp, sp, 1312
	.cfi_restore 79
	.cfi_restore 77
	.cfi_restore 78
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3895:
	.size	dynopt_dct16_sve2_shared, .-dynopt_dct16_sve2_shared
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
