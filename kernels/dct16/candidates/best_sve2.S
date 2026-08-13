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
	addvl	sp, sp, #-12
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x60,0x1e,0x22
	ptrue	p7.b, all
	adrp	x5, .LANCHOR0
	sub	sp, sp, #800
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x60,0x1e,0x23,0xa0,0x6,0x22
	add	x3, x5, :lo12:.LANCHOR0
	ld1h	z31.h, p7/z, [x3]
	adrp	x4, _ZN12_GLOBAL__N_1L6idx_qaE
	add	x4, x4, :lo12:_ZN12_GLOBAL__N_1L6idx_qaE
	ld1h	z30.h, p7/z, [x4]
	adrp	x4, _ZN12_GLOBAL__N_1L6idx_qbE
	add	x4, x4, :lo12:_ZN12_GLOBAL__N_1L6idx_qbE
	ld1h	z19.h, p7/z, [x4]
	stp	d8, d9, [sp]
	add	x4, x3, 32
	stp	d10, d11, [sp, 16]
	stp	d12, d13, [sp, 32]
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ld1h	z26.h, p7/z, [x0, x2, lsl 1]
	ld1h	z24.h, p7/z, [x0]
	mov	z23.d, z26.d
	add	x0, x0, x2, lsl 2
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	ld1h	z25.h, p7/z, [x0]
	mov	z29.d, z27.d
	mov	z28.d, z25.d
	mov	z22.d, z24.d
	tbl	z22.h, {z22.h - z23.h}, z31.h
	tbl	z23.h, {z28.h - z29.h}, z31.h
	rev	z28.h, z24.h
	rev	z29.h, z26.h
	tbl	z26.h, {z28.h - z29.h}, z31.h
	rev	z28.h, z25.h
	rev	z29.h, z27.h
	mov	z25.d, z23.d
	tbl	z27.h, {z28.h - z29.h}, z31.h
	mov	z24.d, z22.d
	mov	z29.d, z27.d
	tbl	z20.h, {z24.h - z25.h}, z30.h
	mov	z28.d, z26.d
	tbl	z24.h, {z24.h - z25.h}, z19.h
	tbl	z25.h, {z28.h - z29.h}, z30.h
	tbl	z28.h, {z28.h - z29.h}, z19.h
	add	x0, x0, x2, lsl 2
	add	z13.h, z24.h, z28.h
	ld1h	z26.h, p7/z, [x0, x2, lsl 1]
	ld1h	z21.h, p7/z, [x0]
	mov	z29.d, z26.d
	sub	z24.h, z24.h, z28.h
	mov	z28.d, z21.d
	add	x0, x0, x2, lsl 2
	tbl	z23.h, {z28.h - z29.h}, z31.h
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	ld1h	z22.h, p7/z, [x0]
	mov	z29.d, z27.d
	mov	z28.d, z22.d
	add	z12.h, z20.h, z25.h
	sub	z20.h, z20.h, z25.h
	tbl	z25.h, {z28.h - z29.h}, z31.h
	rev	z28.h, z21.h
	rev	z29.h, z26.h
	tbl	z26.h, {z28.h - z29.h}, z31.h
	rev	z28.h, z22.h
	rev	z29.h, z27.h
	tbl	z27.h, {z28.h - z29.h}, z31.h
	mov	z28.d, z23.d
	mov	z29.d, z25.d
	add	x0, x0, x2, lsl 2
	tbl	z21.h, {z28.h - z29.h}, z30.h
	tbl	z25.h, {z28.h - z29.h}, z19.h
	mov	z29.d, z27.d
	mov	z28.d, z26.d
	tbl	z23.h, {z28.h - z29.h}, z30.h
	tbl	z28.h, {z28.h - z29.h}, z19.h
	ld1h	z22.h, p7/z, [x0]
	add	z14.h, z21.h, z23.h
	add	z15.h, z25.h, z28.h
	sub	z21.h, z21.h, z23.h
	sub	z25.h, z25.h, z28.h
	ld1h	z23.h, p7/z, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	mov	z17.d, z23.d
	ld1h	z27.h, p7/z, [x0, x2, lsl 1]
	ld1h	z26.h, p7/z, [x0]
	mov	z29.d, z27.d
	mov	z28.d, z26.d
	mov	z16.d, z22.d
	tbl	z16.h, {z16.h - z17.h}, z31.h
	tbl	z17.h, {z28.h - z29.h}, z31.h
	rev	z28.h, z22.h
	rev	z29.h, z23.h
	tbl	z18.h, {z28.h - z29.h}, z31.h
	rev	z28.h, z26.h
	rev	z29.h, z27.h
	mov	z27.d, z17.d
	tbl	z23.h, {z28.h - z29.h}, z31.h
	mov	z26.d, z16.d
	mov	z29.d, z23.d
	tbl	z22.h, {z26.h - z27.h}, z30.h
	mov	z28.d, z18.d
	tbl	z26.h, {z26.h - z27.h}, z19.h
	tbl	z27.h, {z28.h - z29.h}, z30.h
	tbl	z28.h, {z28.h - z29.h}, z19.h
	add	x0, x0, x2, lsl 2
	add	z17.h, z26.h, z28.h
	ld1h	z11.h, p7/z, [x0, x2, lsl 1]
	ld1h	z9.h, p7/z, [x0]
	mov	z29.d, z11.d
	sub	z26.h, z26.h, z28.h
	mov	z28.d, z9.d
	add	x0, x0, x2, lsl 2
	tbl	z10.h, {z28.h - z29.h}, z31.h
	ld1h	z23.h, p7/z, [x0, x2, lsl 1]
	ld1h	z18.h, p7/z, [x0]
	mov	z29.d, z23.d
	mov	z28.d, z18.d
	add	z16.h, z22.h, z27.h
	add	x2, x3, 544
	addvl	x0, sp, #12
	sub	z22.h, z22.h, z27.h
	tbl	z27.h, {z28.h - z29.h}, z31.h
	rev	z28.h, z9.h
	rev	z29.h, z11.h
	add	x0, x0, 288
	tbl	z11.h, {z28.h - z29.h}, z31.h
	mov	x6, x2
	rev	z29.h, z23.h
	rev	z28.h, z18.h
	tbl	z18.h, {z28.h - z29.h}, z31.h
	mov	z28.d, z10.d
	mov	z29.d, z27.d
	tbl	z23.h, {z28.h - z29.h}, z30.h
	tbl	z27.h, {z28.h - z29.h}, z19.h
	mov	z29.d, z18.d
	mov	z28.d, z11.d
	tbl	z30.h, {z28.h - z29.h}, z30.h
	tbl	z28.h, {z28.h - z29.h}, z19.h
	add	z18.h, z23.h, z30.h
	add	z19.h, z27.h, z28.h
	sub	z23.h, z23.h, z30.h
	sub	z27.h, z27.h, z28.h
	movi	d30, #0
.L2:
	ld1h	z10.h, p7/z, [x4]
	ld1h	z11.h, p7/z, [x2]
	movprfx	z29, z30
	sdot	z29.d, z12.h, z10.h
	movprfx	z28, z30
	sdot	z28.d, z14.h, z10.h
	sdot	z29.d, z13.h, z11.h
	sdot	z28.d, z15.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	add	x3, x4, 32
	stp	d29, d28, [x0]
	movprfx	z29, z30
	sdot	z29.d, z16.h, z10.h
	movprfx	z28, z30
	sdot	z28.d, z18.h, z10.h
	sdot	z29.d, z17.h, z11.h
	sdot	z28.d, z19.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	stp	d29, d28, [x0, 16]
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 32
	movprfx	z29, z30
	sdot	z29.d, z20.h, z10.h
	ld1h	z11.h, p7/z, [x3]
	movprfx	z28, z30
	sdot	z28.d, z21.h, z10.h
	sdot	z29.d, z24.h, z11.h
	sdot	z28.d, z25.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	add	x3, x4, 64
	stp	d29, d28, [x0, 32]
	movprfx	z29, z30
	sdot	z29.d, z22.h, z10.h
	movprfx	z28, z30
	sdot	z28.d, z23.h, z10.h
	sdot	z29.d, z26.h, z11.h
	sdot	z28.d, z27.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	stp	d29, d28, [x0, 48]
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 64
	movprfx	z29, z30
	sdot	z29.d, z12.h, z10.h
	ld1h	z11.h, p7/z, [x3]
	movprfx	z28, z30
	sdot	z28.d, z14.h, z10.h
	sdot	z29.d, z13.h, z11.h
	sdot	z28.d, z15.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	add	x3, x4, 96
	stp	d29, d28, [x0, 64]
	movprfx	z29, z30
	sdot	z29.d, z16.h, z10.h
	movprfx	z28, z30
	sdot	z28.d, z18.h, z10.h
	sdot	z29.d, z17.h, z11.h
	sdot	z28.d, z19.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	stp	d29, d28, [x0, 80]
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 96
	movprfx	z29, z30
	sdot	z29.d, z20.h, z10.h
	ld1h	z11.h, p7/z, [x3]
	movprfx	z28, z30
	sdot	z28.d, z21.h, z10.h
	sdot	z29.d, z24.h, z11.h
	sdot	z28.d, z25.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	add	x4, x4, 128
	stp	d29, d28, [x0, 96]
	movprfx	z29, z30
	sdot	z29.d, z22.h, z10.h
	movprfx	z28, z30
	sdot	z28.d, z23.h, z10.h
	sdot	z29.d, z26.h, z11.h
	sdot	z28.d, z27.h, z11.h
	uzp1	z29.s, z29.s, z29.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z29.h, z29.s, #3
	rshrnb	z28.h, z28.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z28.h, z28.h, z28.h
	stp	d29, d28, [x0, 112]
	add	x2, x2, 128
	add	x0, x0, 128
	cmp	x6, x4
	bne	.L2
	addvl	x0, sp, #12
	add	x2, x5, :lo12:.LANCHOR0
	add	x0, x0, 288
	add	x7, x1, 32
	add	x6, x2, 64
	add	x4, x2, 576
	ldr	q11, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 304
	ldr	q29, [x2, 1056]
	ldr	q25, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 320
	ldr	q30, [x2, 1072]
	ldr	q12, [x0]
	addvl	x0, sp, #12
	tbx	v25.16b, {v25.16b}, v29.16b
	add	x0, x0, 336
	ldr	q26, [x0]
	addvl	x0, sp, #12
	saddl2	v23.4s, v11.8h, v25.8h
	add	x0, x0, 352
	saddl	v28.4s, v11.4h, v25.4h
	tbx	v26.16b, {v26.16b}, v29.16b
	ldr	q13, [x0]
	addvl	x0, sp, #12
	tbx	v23.16b, {v23.16b}, v30.16b
	add	x0, x0, 368
	saddl2	v24.4s, v12.8h, v26.8h
	saddl	v27.4s, v12.4h, v26.4h
	sub	v15.4s, v28.4s, v23.4s
	tbx	v24.16b, {v24.16b}, v30.16b
	add	v28.4s, v28.4s, v23.4s
	sub	v0.4s, v27.4s, v24.4s
	add	v27.4s, v27.4s, v24.4s
	zip1	v24.2d, v28.2d, v27.2d
	zip2	v28.2d, v28.2d, v27.2d
	rev64	v28.4s, v28.4s
	add	v27.4s, v28.4s, v24.4s
	sub	v28.4s, v24.4s, v28.4s
	stp	q27, q28, [sp, 64]
	ldr	q27, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 384
	ldr	q14, [x0]
	addvl	x0, sp, #12
	tbx	v27.16b, {v27.16b}, v29.16b
	add	x0, x0, 400
	ldr	q28, [x0]
	addvl	x0, sp, #12
	saddl2	v21.4s, v13.8h, v27.8h
	add	x0, x0, 416
	saddl	v24.4s, v13.4h, v27.4h
	tbx	v28.16b, {v28.16b}, v29.16b
	ldr	q17, [x0]
	addvl	x0, sp, #12
	tbx	v21.16b, {v21.16b}, v30.16b
	add	x0, x0, 432
	saddl2	v22.4s, v14.8h, v28.8h
	saddl	v23.4s, v14.4h, v28.4h
	sub	v1.4s, v24.4s, v21.4s
	tbx	v22.16b, {v22.16b}, v30.16b
	add	v24.4s, v24.4s, v21.4s
	sub	v2.4s, v23.4s, v22.4s
	add	v23.4s, v23.4s, v22.4s
	zip1	v22.2d, v24.2d, v23.2d
	zip2	v24.2d, v24.2d, v23.2d
	rev64	v24.4s, v24.4s
	add	v23.4s, v24.4s, v22.4s
	sub	v24.4s, v22.4s, v24.4s
	ldr	q22, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 448
	ldr	q18, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 464
	stp	q23, q24, [sp, 96]
	tbx	v22.16b, {v22.16b}, v29.16b
	ldr	q23, [x0]
	add	x0, sp, 288
	saddl2	v19.4s, v17.8h, v22.8h
	tbx	v23.16b, {v23.16b}, v29.16b
	saddl	v24.4s, v17.4h, v22.4h
	sub	z22.h, z17.h, z22.h
	str	z22, [x0]
	addvl	x0, sp, #1
	mov	v22.16b, v19.16b
	add	x0, x0, 288
	saddl2	v20.4s, v18.8h, v23.8h
	saddl	v21.4s, v18.4h, v23.4h
	sub	z23.h, z18.h, z23.h
	str	z23, [x0]
	addvl	x0, sp, #12
	tbx	v22.16b, {v19.16b}, v30.16b
	add	x0, x0, 480
	mov	v23.16b, v20.16b
	ldr	q17, [x0]
	addvl	x0, sp, #12
	sub	v3.4s, v24.4s, v22.4s
	add	x0, x0, 496
	tbx	v23.16b, {v20.16b}, v30.16b
	add	v24.4s, v24.4s, v22.4s
	sub	v4.4s, v21.4s, v23.4s
	add	v23.4s, v21.4s, v23.4s
	zip1	v22.2d, v24.2d, v23.2d
	zip2	v24.2d, v24.2d, v23.2d
	rev64	v24.4s, v24.4s
	add	v23.4s, v24.4s, v22.4s
	sub	v24.4s, v22.4s, v24.4s
	ldr	q22, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 512
	ldr	q18, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 528
	stp	q23, q24, [sp, 128]
	tbx	v22.16b, {v22.16b}, v29.16b
	ldr	q23, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 288
	saddl2	v24.4s, v17.8h, v22.8h
	tbx	v23.16b, {v23.16b}, v29.16b
	saddl	v19.4s, v17.4h, v22.4h
	sub	z22.h, z17.h, z22.h
	str	z22, [x0]
	addvl	x0, sp, #3
	tbx	v24.16b, {v24.16b}, v30.16b
	add	x0, x0, 288
	saddl2	v20.4s, v18.8h, v23.8h
	saddl	v21.4s, v18.4h, v23.4h
	sub	z23.h, z18.h, z23.h
	str	z23, [x0]
	addvl	x0, sp, #12
	sub	v5.4s, v19.4s, v24.4s
	add	x0, x0, 544
	tbx	v20.16b, {v20.16b}, v30.16b
	add	v24.4s, v19.4s, v24.4s
	ldr	q17, [x0]
	addvl	x0, sp, #12
	sub	v6.4s, v21.4s, v20.4s
	add	x0, x0, 560
	add	v21.4s, v21.4s, v20.4s
	zip1	v23.2d, v24.2d, v21.2d
	zip2	v24.2d, v24.2d, v21.2d
	rev64	v24.4s, v24.4s
	add	v22.4s, v24.4s, v23.4s
	sub	v24.4s, v23.4s, v24.4s
	stp	q22, q24, [sp, 160]
	ldr	q22, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 576
	ldr	q18, [x0]
	addvl	x0, sp, #12
	tbx	v22.16b, {v22.16b}, v29.16b
	add	x0, x0, 592
	ldr	q23, [x0]
	addvl	x0, sp, #4
	saddl2	v24.4s, v17.8h, v22.8h
	add	x0, x0, 288
	saddl	v19.4s, v17.4h, v22.4h
	sub	z22.h, z17.h, z22.h
	str	z22, [x0]
	tbx	v23.16b, {v23.16b}, v29.16b
	addvl	x0, sp, #5
	add	x0, x0, 288
	tbx	v24.16b, {v24.16b}, v30.16b
	saddl2	v20.4s, v18.8h, v23.8h
	saddl	v21.4s, v18.4h, v23.4h
	sub	z23.h, z18.h, z23.h
	str	z23, [x0]
	sub	v7.4s, v19.4s, v24.4s
	addvl	x0, sp, #12
	add	v24.4s, v19.4s, v24.4s
	add	x0, x0, 608
	tbx	v20.16b, {v20.16b}, v30.16b
	ldr	q17, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 624
	sub	v16.4s, v21.4s, v20.4s
	add	v21.4s, v21.4s, v20.4s
	zip1	v23.2d, v24.2d, v21.2d
	zip2	v24.2d, v24.2d, v21.2d
	rev64	v24.4s, v24.4s
	add	v22.4s, v24.4s, v23.4s
	sub	v24.4s, v23.4s, v24.4s
	stp	q22, q24, [sp, 192]
	ldr	q22, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 640
	ldr	q18, [x0]
	addvl	x0, sp, #12
	tbx	v22.16b, {v22.16b}, v29.16b
	add	x0, x0, 656
	ldr	q23, [x0]
	addvl	x0, sp, #6
	saddl2	v24.4s, v17.8h, v22.8h
	add	x0, x0, 288
	saddl	v19.4s, v17.4h, v22.4h
	sub	z22.h, z17.h, z22.h
	str	z22, [x0]
	tbx	v23.16b, {v23.16b}, v29.16b
	addvl	x0, sp, #7
	add	x0, x0, 288
	tbx	v24.16b, {v24.16b}, v30.16b
	saddl2	v20.4s, v18.8h, v23.8h
	saddl	v21.4s, v18.4h, v23.4h
	sub	z23.h, z18.h, z23.h
	str	z23, [x0]
	sub	v17.4s, v19.4s, v24.4s
	addvl	x0, sp, #12
	add	v24.4s, v19.4s, v24.4s
	add	x0, x0, 672
	tbx	v20.16b, {v20.16b}, v30.16b
	ldr	q9, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 688
	sub	v18.4s, v21.4s, v20.4s
	add	v21.4s, v21.4s, v20.4s
	zip1	v23.2d, v24.2d, v21.2d
	zip2	v24.2d, v24.2d, v21.2d
	rev64	v24.4s, v24.4s
	add	v22.4s, v24.4s, v23.4s
	sub	v24.4s, v23.4s, v24.4s
	stp	q22, q24, [sp, 224]
	ldr	q22, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 704
	ldr	q19, [x0]
	addvl	x0, sp, #12
	tbx	v22.16b, {v22.16b}, v29.16b
	add	x0, x0, 720
	ldr	q23, [x0]
	addvl	x0, sp, #8
	saddl	v10.4s, v9.4h, v22.4h
	add	x0, x0, 288
	saddl2	v24.4s, v9.8h, v22.8h
	sub	z22.h, z9.h, z22.h
	str	z22, [x0]
	tbx	v23.16b, {v23.16b}, v29.16b
	addvl	x0, sp, #9
	add	x0, x0, 288
	tbx	v24.16b, {v24.16b}, v30.16b
	saddl2	v20.4s, v19.8h, v23.8h
	saddl	v21.4s, v19.4h, v23.4h
	sub	z23.h, z19.h, z23.h
	str	z23, [x0]
	addvl	x0, sp, #12
	sub	v19.4s, v10.4s, v24.4s
	add	x0, x0, 736
	mov	v23.16b, v20.16b
	add	v24.4s, v10.4s, v24.4s
	ldr	q9, [x0]
	addvl	x0, sp, #12
	tbx	v23.16b, {v20.16b}, v30.16b
	add	x0, x0, 752
	sub	v20.4s, v21.4s, v23.4s
	add	v21.4s, v21.4s, v23.4s
	zip1	v23.2d, v24.2d, v21.2d
	zip2	v24.2d, v24.2d, v21.2d
	rev64	v24.4s, v24.4s
	add	v22.4s, v24.4s, v23.4s
	sub	v24.4s, v23.4s, v24.4s
	ldr	q23, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 768
	ldr	q10, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 784
	stp	q22, q24, [sp, 256]
	tbx	v23.16b, {v23.16b}, v29.16b
	ldr	q24, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 288
	saddl	v8.4s, v9.4h, v23.4h
	tbx	v24.16b, {v24.16b}, v29.16b
	saddl2	v29.4s, v9.8h, v23.8h
	sub	z23.h, z9.h, z23.h
	str	z23, [x0]
	addvl	x0, sp, #11
	sub	z9.h, z12.h, z26.h
	add	x0, x0, 288
	saddl2	v21.4s, v10.8h, v24.8h
	saddl	v22.4s, v10.4h, v24.4h
	sub	z24.h, z10.h, z24.h
	str	z24, [x0]
	tbx	v29.16b, {v29.16b}, v30.16b
	add	x0, x2, 1088
	tbx	v21.16b, {v21.16b}, v30.16b
	sub	v23.4s, v8.4s, v29.4s
	add	v29.4s, v8.4s, v29.4s
	sub	z8.h, z11.h, z25.h
	tbl	z26.h, {z8.h - z9.h}, z31.h
	sub	v10.4s, v22.4s, v21.4s
	sub	z8.h, z13.h, z27.h
	sub	z9.h, z14.h, z28.h
	add	v22.4s, v22.4s, v21.4s
	tbl	z13.h, {z8.h - z9.h}, z31.h
	mov	z12.d, z26.d
	movi	d14, #0
	zip1	v30.2d, v29.2d, v22.2d
	zip2	v29.2d, v29.2d, v22.2d
	rev64	v29.4s, v29.4s
	add	v24.4s, v29.4s, v30.4s
	sub	v29.4s, v30.4s, v29.4s
	ld1h	z30.h, p7/z, [x0]
	add	x0, x2, 1120
	ld1h	z22.h, p7/z, [x0]
	mov	x0, 0
	tbl	z21.h, {z12.h - z13.h}, z30.h
	ptrue	p7.b, all
	tbl	z13.h, {z8.h - z9.h}, z31.h
	tbl	z27.h, {z12.h - z13.h}, z22.h
	.p2align 5,,15
.L3:
	lsl	x3, x0, 1
	ld1h	z26.h, p7/z, [x6, x0, lsl 1]
	ld1h	z25.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z28, z14
	sdot	z28.d, z27.h, z25.h
	sdot	z28.d, z21.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #10
	uzp1	z28.h, z28.h, z28.h
	str	d28, [x7, x3]
	cmp	x0, 256
	bne	.L3
	ldr	q27, [x2, 1152]
	add	x2, x2, 1184
	add	x0, x1, 192
	add	x4, x1, 576
	mov	x3, x2
	mul	v26.4s, v0.4s, v27.4s
	mul	v28.4s, v15.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	mul	v26.4s, v1.4s, v27.4s
	mul	v27.4s, v2.4s, v27.4s
	addp	v26.4s, v26.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 64]
.L4:
	ldr	q27, [x3], 16
	mul	v26.4s, v0.4s, v27.4s
	mul	v28.4s, v15.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	mul	v26.4s, v1.4s, v27.4s
	mul	v27.4s, v2.4s, v27.4s
	addp	v27.4s, v26.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x0], 128
	cmp	x4, x0
	bne	.L4
	ldp	q26, q21, [sp, 64]
	ptrue	p7.b, all
	add	x8, x5, :lo12:.LANCHOR0
	ldp	q25, q15, [sp, 96]
	add	x0, sp, 288
	ldr	q27, [x8, 1232]
	add	x7, x1, 40
	addp	v28.4s, v26.4s, v25.4s
	add	x6, x8, 64
	add	x4, x8, 576
	shl	v28.4s, v28.4s, 6
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1]
	mul	v28.4s, v21.4s, v27.4s
	mul	v27.4s, v15.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 128]
	ldr	q28, [x8, 1248]
	mul	v27.4s, v26.4s, v28.4s
	ldr	z26, [x0]
	addvl	x0, sp, #1
	mul	v28.4s, v25.4s, v28.4s
	add	x0, x0, 288
	addp	v27.4s, v27.4s, v28.4s
	ldr	q28, [x8, 1264]
	rshrn	v27.4h, v27.4s, 10
	str	d27, [x1, 256]
	mul	v27.4s, v21.4s, v28.4s
	movi	d21, #0
	mul	v28.4s, v15.4s, v28.4s
	addp	v27.4s, v27.4s, v28.4s
	rshrn	v27.4h, v27.4s, 10
	str	d27, [x1, 384]
	ldr	z27, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 288
	ldr	z14, [x0]
	tbl	z12.h, {z26.h - z27.h}, z31.h
	addvl	x0, sp, #3
	add	x0, x0, 288
	ldr	z15, [x0]
	tbl	z14.h, {z14.h - z15.h}, z31.h
	mov	x0, 0
	mov	z13.d, z14.d
	tbl	z15.h, {z12.h - z13.h}, z30.h
	tbl	z12.h, {z26.h - z27.h}, z31.h
	tbl	z27.h, {z12.h - z13.h}, z22.h
	.p2align 5,,15
.L5:
	lsl	x3, x0, 1
	ld1h	z26.h, p7/z, [x6, x0, lsl 1]
	ld1h	z25.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z28, z21
	sdot	z28.d, z27.h, z25.h
	sdot	z28.d, z15.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #10
	uzp1	z28.h, z28.h, z28.h
	str	d28, [x7, x3]
	cmp	x0, 256
	bne	.L5
	ldr	q27, [x8, 1152]
	add	x0, x1, 200
	add	x4, x1, 584
	mov	x3, x2
	mul	v26.4s, v4.4s, v27.4s
	mul	v28.4s, v3.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	mul	v26.4s, v5.4s, v27.4s
	mul	v27.4s, v6.4s, v27.4s
	addp	v26.4s, v26.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 72]
.L6:
	ldr	q27, [x3], 16
	mul	v26.4s, v4.4s, v27.4s
	mul	v28.4s, v3.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	mul	v26.4s, v5.4s, v27.4s
	mul	v27.4s, v6.4s, v27.4s
	addp	v27.4s, v26.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x0], 128
	cmp	x0, x4
	bne	.L6
	ldp	q26, q21, [sp, 128]
	ptrue	p7.b, all
	add	x8, x5, :lo12:.LANCHOR0
	ldp	q25, q15, [sp, 160]
	addvl	x0, sp, #4
	ldr	q27, [x8, 1232]
	add	x0, x0, 288
	addp	v28.4s, v26.4s, v25.4s
	add	x7, x1, 48
	add	x6, x8, 64
	add	x4, x8, 576
	shl	v28.4s, v28.4s, 6
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 8]
	mul	v28.4s, v21.4s, v27.4s
	mul	v27.4s, v15.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 136]
	ldr	q28, [x8, 1248]
	mul	v27.4s, v26.4s, v28.4s
	ldr	z26, [x0]
	addvl	x0, sp, #5
	mul	v28.4s, v25.4s, v28.4s
	add	x0, x0, 288
	addp	v27.4s, v27.4s, v28.4s
	rshrn	v27.4h, v27.4s, 10
	str	d27, [x1, 264]
	ldr	q27, [x8, 1264]
	mul	v28.4s, v21.4s, v27.4s
	mul	v27.4s, v15.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	ldr	z27, [x0]
	addvl	x0, sp, #6
	add	x0, x0, 288
	tbl	z25.h, {z26.h - z27.h}, z31.h
	ldr	z26, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 288
	ldr	z27, [x0]
	rshrn	v28.4h, v28.4s, 10
	mov	x0, 0
	str	d28, [x1, 392]
	tbl	z28.h, {z26.h - z27.h}, z31.h
	mov	z26.d, z25.d
	mov	z27.d, z28.d
	movi	d25, #0
	tbl	z21.h, {z26.h - z27.h}, z30.h
	tbl	z27.h, {z26.h - z27.h}, z22.h
	.p2align 5,,15
.L7:
	lsl	x3, x0, 1
	ld1h	z26.h, p7/z, [x6, x0, lsl 1]
	ld1h	z15.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z28, z25
	sdot	z28.d, z27.h, z15.h
	sdot	z28.d, z21.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #10
	uzp1	z28.h, z28.h, z28.h
	str	d28, [x7, x3]
	cmp	x0, 256
	bne	.L7
	ldr	q27, [x8, 1152]
	add	x0, x1, 208
	add	x4, x1, 592
	mov	x3, x2
	mul	v26.4s, v16.4s, v27.4s
	mul	v28.4s, v7.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	mul	v26.4s, v17.4s, v27.4s
	mul	v27.4s, v18.4s, v27.4s
	addp	v27.4s, v26.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 80]
.L8:
	ldr	q27, [x3], 16
	mul	v26.4s, v16.4s, v27.4s
	mul	v28.4s, v7.4s, v27.4s
	addp	v28.4s, v28.4s, v26.4s
	mul	v26.4s, v17.4s, v27.4s
	mul	v27.4s, v18.4s, v27.4s
	addp	v27.4s, v26.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x0], 128
	cmp	x0, x4
	bne	.L8
	ldp	q26, q21, [sp, 192]
	ptrue	p7.b, all
	add	x8, x5, :lo12:.LANCHOR0
	ldp	q25, q18, [sp, 224]
	addvl	x0, sp, #8
	ldr	q27, [x8, 1232]
	add	x0, x0, 288
	addp	v28.4s, v26.4s, v25.4s
	add	x7, x1, 56
	add	x6, x8, 64
	add	x4, x8, 576
	shl	v28.4s, v28.4s, 6
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 16]
	mul	v28.4s, v21.4s, v27.4s
	mul	v27.4s, v18.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	ldr	q27, [x8, 1248]
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 144]
	mul	v28.4s, v26.4s, v27.4s
	ldr	z26, [x0]
	addvl	x0, sp, #9
	mul	v27.4s, v25.4s, v27.4s
	add	x0, x0, 288
	movi	d25, #0
	addp	v28.4s, v28.4s, v27.4s
	ldr	q27, [x8, 1264]
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 272]
	mul	v28.4s, v21.4s, v27.4s
	mul	v27.4s, v18.4s, v27.4s
	addp	v28.4s, v28.4s, v27.4s
	ldr	z27, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 288
	rshrn	v28.4h, v28.4s, 10
	str	d28, [x1, 400]
	tbl	z28.h, {z26.h - z27.h}, z31.h
	ldr	z26, [x0]
	addvl	x0, sp, #11
	add	x0, x0, 288
	ldr	z27, [x0]
	tbl	z31.h, {z26.h - z27.h}, z31.h
	mov	x0, 0
	mov	z26.d, z28.d
	mov	z27.d, z31.d
	tbl	z30.h, {z26.h - z27.h}, z30.h
	tbl	z26.h, {z26.h - z27.h}, z22.h
	.p2align 5,,15
.L9:
	lsl	x3, x0, 1
	ld1h	z28.h, p7/z, [x6, x0, lsl 1]
	ld1h	z27.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 32
	movprfx	z31, z25
	sdot	z31.d, z26.h, z27.h
	sdot	z31.d, z30.h, z28.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x7, x3]
	cmp	x0, 256
	bne	.L9
	ldr	q30, [x8, 1152]
	add	x0, x1, 216
	add	x3, x1, 600
	mul	v28.4s, v20.4s, v30.4s
	mul	v31.4s, v19.4s, v30.4s
	addp	v31.4s, v31.4s, v28.4s
	mul	v28.4s, v23.4s, v30.4s
	mul	v30.4s, v10.4s, v30.4s
	addp	v30.4s, v28.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 88]
.L10:
	ldr	q30, [x2], 16
	mul	v28.4s, v20.4s, v30.4s
	mul	v31.4s, v19.4s, v30.4s
	addp	v31.4s, v31.4s, v28.4s
	mul	v28.4s, v23.4s, v30.4s
	mul	v30.4s, v10.4s, v30.4s
	addp	v30.4s, v28.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x0], 128
	cmp	x3, x0
	bne	.L10
	ldp	q28, q27, [sp, 256]
	add	x5, x5, :lo12:.LANCHOR0
	ldp	d8, d9, [sp]
	addp	v31.4s, v28.4s, v24.4s
	ldr	q30, [x5, 1232]
	ldp	d10, d11, [sp, 16]
	shl	v31.4s, v31.4s, 6
	ldp	d12, d13, [sp, 32]
	ldp	d14, d15, [sp, 48]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 24]
	mul	v31.4s, v27.4s, v30.4s
	mul	v30.4s, v29.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x5, 1248]
	rshrn	v31.4h, v31.4s, 10
	mul	v24.4s, v24.4s, v30.4s
	str	d31, [x1, 152]
	mul	v31.4s, v28.4s, v30.4s
	ldr	q30, [x5, 1264]
	addp	v31.4s, v31.4s, v24.4s
	mul	v29.4s, v29.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 280]
	mul	v31.4s, v27.4s, v30.4s
	addp	v31.4s, v31.4s, v29.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 408]
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	addvl	sp, sp, #12
	.cfi_def_cfa_offset 800
	add	sp, sp, 800
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
