	.arch armv8.2-a+crc+sve2
	.file	"scatter.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct16_sve2_shared
	.type	dynopt_idct16_sve2_shared, %function
dynopt_idct16_sve2_shared:
.LFB4:
	.cfi_startproc
	addvl	sp, sp, #-1
	.cfi_escape 0xf,0x8,0x8f,0,0x92,0x2e,0,0x38,0x1e,0x22
	add	x3, x0, 32
	ptrue	p7.b, all
	sub	sp, sp, #576
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x38,0x1e,0x23,0xc0,0x4,0x22
	mov	z27.s, #57
	mov	z17.s, #25
	mov	z16.s, #-43
	mov	z29.s, #-90
	mov	z18.s, #-70
	mov	z30.s, #80
	mov	z25.s, #43
	mov	z28.s, #-80
	stp	d8, d9, [sp]
	mov	z22.s, #70
	mov	z21.s, #-25
	mov	z0.s, #87
	mov	z24.d, z29.d
	mov	z7.d, z17.d
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
	ld1sh	z2.s, p7/z, [x3]
	add	x3, x0, 64
	ld1sh	z9.s, p7/z, [x3]
	add	x3, x0, 96
	ld1sh	z3.s, p7/z, [x3]
	add	x3, x0, 128
	ld1sh	z11.s, p7/z, [x3]
	movprfx	z20, z2
	mul	z20.s, p7/m, z20.s, z0.s
	add	x3, x0, 160
	ld1sh	z12.s, p7/z, [x3]
	mla	z20.s, p7/m, z3.s, z27.s
	add	x3, x0, 192
	ld1sh	z10.s, p7/z, [x3]
	movprfx	z23, z2
	mul	z23.s, z23.s, #90
	add	x3, x0, 224
	ld1sh	z13.s, p7/z, [x3]
	mla	z23.s, p7/m, z3.s, z0.s
	add	x3, x0, 256
	ld1sh	z4.s, p7/z, [x3]
	mla	z23.s, p7/m, z12.s, z30.s
	add	x3, x0, 288
	ld1sh	z31.s, p7/z, [x3]
	mov	z30.s, #9
	add	x3, x0, 320
	ld1sh	z14.s, p7/z, [x3]
	mla	z23.s, p7/m, z13.s, z22.s
	add	x3, x0, 352
	ld1sh	z15.s, p7/z, [x3]
	mla	z23.s, p7/m, z31.s, z27.s
	add	x3, x0, 384
	ld1sh	z5.s, p7/z, [x3]
	mla	z23.s, p7/m, z15.s, z25.s
	add	x3, x0, 416
	mla	z20.s, p7/m, z12.s, z30.s
	ld1sh	z26.s, p7/z, [x3]
	mla	z20.s, p7/m, z13.s, z16.s
	mla	z23.s, p7/m, z26.s, z17.s
	mla	z20.s, p7/m, z31.s, z28.s
	add	x3, x0, 448
	mla	z20.s, p7/m, z15.s, z29.s
	movprfx	z19, z2
	mul	z19.s, z19.s, #80
	mov	z29.s, #-87
	mla	z20.s, p7/m, z26.s, z18.s
	mla	z19.s, p7/m, z3.s, z30.s
	mla	z19.s, p7/m, z12.s, z18.s
	movprfx	z18, z2
	mul	z18.s, p7/m, z18.s, z22.s
	mla	z19.s, p7/m, z13.s, z29.s
	mla	z18.s, p7/m, z3.s, z16.s
	mla	z19.s, p7/m, z31.s, z21.s
	mla	z18.s, p7/m, z12.s, z29.s
	mla	z19.s, p7/m, z15.s, z27.s
	mla	z18.s, p7/m, z13.s, z30.s
	mov	z27.s, #90
	mov	z16.s, #-9
	mla	z18.s, p7/m, z31.s, z27.s
	mla	z18.s, p7/m, z15.s, z17.s
	mov	z17.s, #-57
	ld1sh	z6.s, p7/z, [x3]
	mla	z18.s, p7/m, z26.s, z28.s
	add	x3, x0, 480
	ld1sh	z8.s, p7/z, [x3]
	mla	z18.s, p7/m, z8.s, z17.s
	movprfx	z17, z2
	mul	z17.s, z17.s, #57
	mla	z17.s, p7/m, z3.s, z28.s
	mla	z17.s, p7/m, z12.s, z21.s
	mla	z17.s, p7/m, z13.s, z27.s
	mla	z17.s, p7/m, z31.s, z16.s
	movprfx	z16, z2
	mul	z16.s, p7/m, z16.s, z25.s
	mla	z16.s, p7/m, z3.s, z24.s
	mov	z24.s, #57
	mla	z16.s, p7/m, z12.s, z24.s
	mov	z24.s, #-70
	mla	z16.s, p7/m, z13.s, z7.s
	movprfx	z7, z2
	mul	z7.s, z7.s, #25
	mla	z16.s, p7/m, z31.s, z29.s
	mla	z7.s, p7/m, z3.s, z24.s
	mul	z2.s, p7/m, z2.s, z30.s
	mla	z7.s, p7/m, z12.s, z27.s
	mad	z3.s, p7/m, z21.s, z2.s
	mla	z7.s, p7/m, z13.s, z28.s
	mad	z12.s, p7/m, z25.s, z3.s
	mla	z7.s, p7/m, z31.s, z25.s
	mov	z24.s, #-57
	mad	z13.s, p7/m, z24.s, z12.s
	mad	z31.s, p7/m, z22.s, z13.s
	mla	z19.s, p7/m, z26.s, z27.s
	mla	z17.s, p7/m, z15.s, z29.s
	mla	z16.s, p7/m, z15.s, z22.s
	mla	z17.s, p7/m, z26.s, z25.s
	mla	z16.s, p7/m, z26.s, z30.s
	mla	z7.s, p7/m, z15.s, z30.s
	mad	z15.s, p7/m, z28.s, z31.s
	mla	z7.s, p7/m, z26.s, z24.s
	mov	z31.s, #50
	mad	z26.s, p7/m, z0.s, z15.s
	mla	z23.s, p7/m, z8.s, z30.s
	mla	z20.s, p7/m, z8.s, z21.s
	mla	z19.s, p7/m, z8.s, z25.s
	mla	z17.s, p7/m, z8.s, z22.s
	mla	z7.s, p7/m, z8.s, z0.s
	mla	z16.s, p7/m, z8.s, z28.s
	mov	z24.s, #-90
	movprfx	z15, z9
	mul	z15.s, z15.s, #89
	mad	z8.s, p7/m, z24.s, z26.s
	mov	z12.s, #-18
	mov	z26.s, #75
	mla	z15.s, p7/m, z10.s, z26.s
	mla	z15.s, p7/m, z14.s, z31.s
	mov	z31.s, #18
	movprfx	z13, z9
	mul	z13.s, p7/m, z13.s, z26.s
	mla	z15.s, p7/m, z6.s, z31.s
	mov	z3.d, z31.d
	mla	z13.s, p7/m, z10.s, z12.s
	mov	z31.s, #-89
	mov	z2.s, #-50
	movprfx	z12, z9
	mul	z12.s, z12.s, #50
	mul	z9.s, p7/m, z9.s, z3.s
	mla	z12.s, p7/m, z10.s, z31.s
	mad	z10.s, p7/m, z2.s, z9.s
	mla	z13.s, p7/m, z14.s, z31.s
	mla	z12.s, p7/m, z14.s, z3.s
	mad	z14.s, p7/m, z26.s, z10.s
	mov	z10.s, #64
	ld1sh	z1.s, p7/z, [x0]
	mla	z13.s, p7/m, z6.s, z2.s
	mla	z12.s, p7/m, z6.s, z26.s
	mla	z14.s, p7/m, z6.s, z31.s
	mov	w3, 8
	lsl	z31.s, z1.s, #6
	mov	z6.s, #-83
	movprfx	z26, z31
	mla	z26.s, p7/m, z10.s, z4.s
	mov	z10.s, #-64
	whilelo	p6.s, wzr, w3
	mla	z31.s, p7/m, z4.s, z10.s
	mov	z9.s, #36
	mov	w3, 16
	movprfx	z10, z11
	mul	z10.s, z10.s, #83
	mul	z11.s, p7/m, z11.s, z9.s
	mla	z11.s, p7/m, z5.s, z6.s
	add	z6.s, z31.s, z11.s
	sub	z31.s, z31.s, z11.s
	add	z2.s, z31.s, z12.s
	sub	z31.s, z31.s, z12.s
	mla	z10.s, p7/m, z5.s, z9.s
	add	z5.s, z26.s, z10.s
	sub	z26.s, z26.s, z10.s
	add	z1.s, z26.s, z14.s
	sub	z26.s, z26.s, z14.s
	add	z14.s, z31.s, z16.s
	sub	z16.s, z31.s, z16.s
	index	z31.s, #0, w3
	addvl	x3, sp, #1
	add	x3, x3, 64
	add	z4.s, z5.s, z15.s
	add	z9.s, z4.s, z23.s
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	z3.s, z6.s, z13.s
	add	x3, x3, 66
	add	z10.s, z3.s, z20.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	z11.s, z2.s, z19.s
	sqrshrnb	z11.h, z11.s, #7
	add	x3, x3, 68
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	z12.s, z1.s, z18.s
	add	x3, x3, 70
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	x3, x3, 72
	sub	z6.s, z6.s, z13.s
	add	z13.s, z26.s, z17.s
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sqrshrnb	z14.h, z14.s, #7
	add	x3, x3, 74
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z5.s, z5.s, z15.s
	add	x3, x3, 76
	add	z15.s, z6.s, z7.s
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	z0.s, z5.s, z8.s
	sqrshrnb	z0.h, z0.s, #7
	add	x3, x3, 78
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z5.s, z5.s, z8.s
	add	x3, x3, 80
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	x3, x3, 82
	sub	z6.s, z6.s, z7.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	add	x3, x3, 84
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z26.s, z26.s, z17.s
	sqrshrnb	z26.h, z26.s, #7
	add	x3, x3, 86
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z1.s, z1.s, z18.s
	add	x3, x3, 88
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	x3, x3, 90
	sub	z2.s, z2.s, z19.s
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z3.s, z3.s, z20.s
	sqrshrnb	z3.h, z3.s, #7
	add	x3, x3, 92
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z4.s, z4.s, z23.s
	add	x3, x3, 94
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 16
	ld1sh	z2.s, p7/z, [x3]
	add	x3, x0, 48
	ld1sh	z3.s, p7/z, [x3]
	add	x3, x0, 80
	ld1sh	z9.s, p7/z, [x3]
	mov	z1.s, #87
	add	x3, x0, 112
	ld1sh	z4.s, p7/z, [x3]
	movprfx	z20, z3
	mul	z20.s, p7/m, z20.s, z27.s
	add	x3, x0, 144
	ld1sh	z11.s, p7/z, [x3]
	mla	z20.s, p7/m, z4.s, z1.s
	add	x3, x0, 176
	ld1sh	z26.s, p7/z, [x3]
	mov	z7.s, #57
	add	x3, x0, 208
	ld1sh	z10.s, p7/z, [x3]
	mov	z17.s, #25
	add	x3, x0, 240
	ld1sh	z13.s, p7/z, [x3]
	mov	z16.s, #-43
	add	x3, x0, 272
	ld1sh	z5.s, p7/z, [x3]
	mov	z18.s, #-70
	add	x3, x0, 304
	ld1sh	z14.s, p7/z, [x3]
	mov	z19.s, #80
	add	x3, x0, 336
	ld1sh	z12.s, p7/z, [x3]
	mla	z20.s, p7/m, z26.s, z19.s
	add	x3, x0, 368
	ld1sh	z15.s, p7/z, [x3]
	mla	z20.s, p7/m, z13.s, z22.s
	add	x3, x0, 400
	ld1sh	z6.s, p7/z, [x3]
	mla	z20.s, p7/m, z14.s, z7.s
	add	x3, x0, 432
	mla	z20.s, p7/m, z15.s, z25.s
	ld1sh	z23.s, p7/z, [x3]
	add	x3, x0, 464
	mla	z20.s, p7/m, z23.s, z17.s
	add	x0, x0, 496
	ld1sh	z0.s, p7/z, [x0]
	mla	z20.s, p7/m, z0.s, z30.s
	ld1sh	z8.s, p7/z, [x3]
	add	x0, sp, 64
	movprfx	z19, z3
	mul	z19.s, z19.s, #80
	mla	z19.s, p7/m, z4.s, z30.s
	mla	z19.s, p7/m, z26.s, z18.s
	mla	z19.s, p7/m, z13.s, z29.s
	mla	z19.s, p7/m, z14.s, z21.s
	mla	z19.s, p7/m, z15.s, z7.s
	str	z20, [x0]
	movprfx	z20, z3
	mul	z20.s, p7/m, z20.s, z1.s
	mla	z20.s, p7/m, z4.s, z7.s
	mov	z7.d, z17.d
	mla	z20.s, p7/m, z26.s, z30.s
	mla	z20.s, p7/m, z13.s, z16.s
	mla	z20.s, p7/m, z14.s, z28.s
	mla	z20.s, p7/m, z15.s, z24.s
	mla	z20.s, p7/m, z23.s, z18.s
	movprfx	z18, z3
	mul	z18.s, p7/m, z18.s, z22.s
	mla	z18.s, p7/m, z4.s, z16.s
	mov	z16.s, #-9
	mla	z18.s, p7/m, z26.s, z29.s
	mla	z18.s, p7/m, z13.s, z30.s
	mla	z18.s, p7/m, z14.s, z27.s
	mla	z18.s, p7/m, z15.s, z17.s
	mov	z17.s, #-57
	mla	z18.s, p7/m, z23.s, z28.s
	mla	z18.s, p7/m, z0.s, z17.s
	movprfx	z17, z3
	mul	z17.s, z17.s, #57
	mla	z17.s, p7/m, z4.s, z28.s
	mla	z17.s, p7/m, z26.s, z21.s
	mla	z17.s, p7/m, z13.s, z27.s
	mla	z17.s, p7/m, z14.s, z16.s
	movprfx	z16, z3
	mul	z16.s, p7/m, z16.s, z25.s
	mla	z16.s, p7/m, z4.s, z24.s
	mov	z24.s, #57
	mla	z16.s, p7/m, z26.s, z24.s
	mla	z16.s, p7/m, z13.s, z7.s
	mov	z24.s, #-70
	mla	z16.s, p7/m, z14.s, z29.s
	movprfx	z7, z3
	mul	z7.s, z7.s, #25
	mul	z3.s, p7/m, z3.s, z30.s
	mla	z7.s, p7/m, z4.s, z24.s
	mad	z4.s, p7/m, z21.s, z3.s
	mla	z7.s, p7/m, z26.s, z27.s
	mov	z24.s, #-57
	mad	z26.s, p7/m, z25.s, z4.s
	mla	z7.s, p7/m, z13.s, z28.s
	mad	z13.s, p7/m, z24.s, z26.s
	mla	z7.s, p7/m, z14.s, z25.s
	mad	z14.s, p7/m, z22.s, z13.s
	mla	z19.s, p7/m, z23.s, z27.s
	mla	z17.s, p7/m, z15.s, z29.s
	mla	z16.s, p7/m, z15.s, z22.s
	mla	z17.s, p7/m, z23.s, z25.s
	mla	z16.s, p7/m, z23.s, z30.s
	mla	z7.s, p7/m, z15.s, z30.s
	mov	z13.s, #50
	mad	z15.s, p7/m, z28.s, z14.s
	mla	z7.s, p7/m, z23.s, z24.s
	mov	z14.s, #18
	mad	z23.s, p7/m, z1.s, z15.s
	mov	z3.s, #-18
	mla	z20.s, p7/m, z0.s, z21.s
	mla	z19.s, p7/m, z0.s, z25.s
	mla	z17.s, p7/m, z0.s, z22.s
	mla	z16.s, p7/m, z0.s, z28.s
	mla	z7.s, p7/m, z0.s, z1.s
	mov	z26.s, #75
	mov	z4.d, z14.d
	mov	z24.s, #-90
	movprfx	z15, z9
	mul	z15.s, z15.s, #89
	mad	z0.s, p7/m, z24.s, z23.s
	mla	z15.s, p7/m, z10.s, z26.s
	mov	z23.s, #-89
	mla	z15.s, p7/m, z12.s, z13.s
	movprfx	z13, z9
	mul	z13.s, z13.s, #50
	mla	z15.s, p7/m, z8.s, z14.s
	mla	z13.s, p7/m, z10.s, z23.s
	movprfx	z14, z9
	mul	z14.s, p7/m, z14.s, z26.s
	mul	z9.s, p7/m, z9.s, z4.s
	mla	z14.s, p7/m, z10.s, z3.s
	mov	z3.s, #-50
	mad	z10.s, p7/m, z3.s, z9.s
	mla	z14.s, p7/m, z12.s, z23.s
	mla	z13.s, p7/m, z12.s, z4.s
	mad	z12.s, p7/m, z26.s, z10.s
	mov	z10.s, #-64
	mla	z13.s, p7/m, z8.s, z26.s
	mla	z12.s, p7/m, z8.s, z23.s
	mla	z14.s, p7/m, z8.s, z3.s
	lsl	z26.s, z2.s, #6
	mov	z9.s, #36
	mov	z2.s, #64
	mov	z8.s, #-83
	movprfx	z23, z26
	mla	z23.s, p7/m, z2.s, z5.s
	mla	z26.s, p7/m, z5.s, z10.s
	movprfx	z10, z11
	mul	z10.s, z10.s, #83
	mul	z11.s, p7/m, z11.s, z9.s
	mla	z11.s, p7/m, z6.s, z8.s
	mla	z10.s, p7/m, z6.s, z9.s
	add	z6.s, z26.s, z11.s
	sub	z26.s, z26.s, z11.s
	ldr	z11, [x0]
	add	z3.s, z6.s, z14.s
	add	z9.s, z3.s, z20.s
	sub	z3.s, z3.s, z20.s
	ldr	z20, [x0]
	addvl	x0, sp, #1
	add	z5.s, z23.s, z10.s
	add	x0, x0, 320
	add	z4.s, z5.s, z15.s
	add	z8.s, z4.s, z11.s
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sqrshrnb	z9.h, z9.s, #7
	add	x0, x0, 322
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	z2.s, z26.s, z13.s
	add	x0, x0, 324
	sub	z23.s, z23.s, z10.s
	add	z10.s, z2.s, z19.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	z1.s, z23.s, z12.s
	add	x0, x0, 326
	add	z11.s, z1.s, z18.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z23.s, z23.s, z12.s
	add	z12.s, z23.s, z17.s
	add	x0, x0, 328
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 330
	sub	z26.s, z26.s, z13.s
	add	z13.s, z26.s, z16.s
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z6.s, z6.s, z14.s
	add	x0, x0, 332
	add	z14.s, z6.s, z7.s
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z5.s, z5.s, z15.s
	add	z15.s, z5.s, z0.s
	add	x0, x0, 334
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 336
	sub	z5.s, z5.s, z0.s
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z6.s, z6.s, z7.s
	sqrshrnb	z6.h, z6.s, #7
	add	x0, x0, 338
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z26.s, z26.s, z16.s
	add	x0, x0, 340
	sqrshrnb	z26.h, z26.s, #7
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 342
	sub	z23.s, z23.s, z17.s
	sqrshrnb	z23.h, z23.s, #7
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	st1h	z23.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z1.s, z1.s, z18.s
	sqrshrnb	z1.h, z1.s, #7
	add	x0, x0, 344
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z2.s, z2.s, z19.s
	add	x0, x0, 346
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 348
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 350
	sub	z4.s, z4.s, z20.s
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	mov	z19.s, #80
	mov	z6.s, #87
	add	x0, x0, 64
	ld1sh	z1.s, p7/z, [x0]
	mov	z17.s, #25
	addvl	x0, sp, #1
	mov	z16.s, #-43
	mov	z18.s, #-70
	add	x0, x0, 96
	ld1sh	z7.s, p7/z, [x0]
	movprfx	z23, z7
	mul	z23.s, p7/m, z23.s, z27.s
	addvl	x0, sp, #1
	movprfx	z20, z7
	mul	z20.s, z20.s, #80
	mov	z24.s, #-90
	add	x0, x0, 128
	ld1sh	z5.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 160
	ld1sh	z8.s, p7/z, [x0]
	mla	z23.s, p7/m, z8.s, z6.s
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z8.s, z30.s
	add	x0, x0, 192
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 224
	ld1sh	z31.s, p7/z, [x0]
	mla	z23.s, p7/m, z31.s, z19.s
	addvl	x0, sp, #1
	mov	z19.s, #57
	mla	z20.s, p7/m, z31.s, z18.s
	add	x0, x0, 256
	ld1sh	z10.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 288
	ld1sh	z13.s, p7/z, [x0]
	mla	z23.s, p7/m, z13.s, z22.s
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z13.s, z29.s
	add	x0, x0, 320
	ld1sh	z2.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 352
	ld1sh	z14.s, p7/z, [x0]
	mla	z23.s, p7/m, z14.s, z19.s
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z14.s, z21.s
	add	x0, x0, 384
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 416
	ld1sh	z15.s, p7/z, [x0]
	mla	z23.s, p7/m, z15.s, z25.s
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z15.s, z19.s
	add	x0, x0, 448
	ld1sh	z3.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 480
	ld1sh	z26.s, p7/z, [x0]
	mla	z23.s, p7/m, z26.s, z17.s
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z26.s, z27.s
	add	x0, x0, 512
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 544
	ld1sh	z9.s, p7/z, [x0]
	movprfx	z0, z23
	mla	z0.s, p7/m, z9.s, z30.s
	movprfx	z23, z7
	mul	z23.s, p7/m, z23.s, z6.s
	mla	z23.s, p7/m, z8.s, z19.s
	movprfx	z19, z7
	mul	z19.s, p7/m, z19.s, z22.s
	mla	z23.s, p7/m, z31.s, z30.s
	mla	z19.s, p7/m, z8.s, z16.s
	mla	z23.s, p7/m, z13.s, z16.s
	mla	z19.s, p7/m, z31.s, z29.s
	mov	z16.d, z17.d
	mla	z19.s, p7/m, z13.s, z30.s
	mla	z19.s, p7/m, z14.s, z27.s
	mla	z19.s, p7/m, z15.s, z17.s
	mov	z17.s, #-57
	mla	z19.s, p7/m, z26.s, z28.s
	mla	z19.s, p7/m, z9.s, z17.s
	mov	z17.s, #-9
	mla	z23.s, p7/m, z14.s, z28.s
	mla	z23.s, p7/m, z15.s, z24.s
	mla	z23.s, p7/m, z26.s, z18.s
	movprfx	z18, z7
	mul	z18.s, z18.s, #57
	mla	z18.s, p7/m, z8.s, z28.s
	mla	z18.s, p7/m, z31.s, z21.s
	mla	z18.s, p7/m, z13.s, z27.s
	mla	z18.s, p7/m, z14.s, z17.s
	movprfx	z17, z7
	mul	z17.s, p7/m, z17.s, z25.s
	mla	z17.s, p7/m, z8.s, z24.s
	mov	z24.s, #57
	mla	z17.s, p7/m, z31.s, z24.s
	mov	z24.s, #-70
	mla	z17.s, p7/m, z13.s, z16.s
	movprfx	z16, z7
	mul	z16.s, z16.s, #25
	mul	z7.s, p7/m, z7.s, z30.s
	mla	z16.s, p7/m, z8.s, z24.s
	mad	z8.s, p7/m, z21.s, z7.s
	mla	z16.s, p7/m, z31.s, z27.s
	mov	z24.s, #-57
	mad	z31.s, p7/m, z25.s, z8.s
	mla	z16.s, p7/m, z13.s, z28.s
	mad	z13.s, p7/m, z24.s, z31.s
	mla	z17.s, p7/m, z14.s, z29.s
	mla	z16.s, p7/m, z14.s, z25.s
	mad	z14.s, p7/m, z22.s, z13.s
	mov	z13.s, #50
	mov	z31.s, #75
	mla	z18.s, p7/m, z15.s, z29.s
	mla	z17.s, p7/m, z15.s, z22.s
	mla	z18.s, p7/m, z26.s, z25.s
	mla	z17.s, p7/m, z26.s, z30.s
	mla	z16.s, p7/m, z15.s, z30.s
	movprfx	z8, z5
	mul	z8.s, z8.s, #89
	mad	z15.s, p7/m, z28.s, z14.s
	mla	z16.s, p7/m, z26.s, z24.s
	mla	z8.s, p7/m, z10.s, z31.s
	mad	z26.s, p7/m, z6.s, z15.s
	mla	z8.s, p7/m, z12.s, z13.s
	mov	z13.s, #-18
	mla	z23.s, p7/m, z9.s, z21.s
	mla	z20.s, p7/m, z9.s, z25.s
	mla	z18.s, p7/m, z9.s, z22.s
	mla	z17.s, p7/m, z9.s, z28.s
	mla	z16.s, p7/m, z9.s, z6.s
	mov	z24.s, #-90
	mov	z14.s, #18
	mad	z9.s, p7/m, z24.s, z26.s
	movprfx	z7, z5
	mul	z7.s, p7/m, z7.s, z31.s
	mov	z26.s, #-89
	mla	z7.s, p7/m, z10.s, z13.s
	mov	z15.s, #-50
	mla	z7.s, p7/m, z12.s, z26.s
	movprfx	z6, z5
	mul	z6.s, z6.s, #50
	mov	z13.s, #64
	mla	z6.s, p7/m, z10.s, z26.s
	mul	z5.s, p7/m, z5.s, z14.s
	mla	z6.s, p7/m, z12.s, z14.s
	mad	z10.s, p7/m, z15.s, z5.s
	mad	z12.s, p7/m, z31.s, z10.s
	mla	z6.s, p7/m, z4.s, z31.s
	movprfx	z5, z12
	mla	z5.s, p7/m, z26.s, z4.s
	lsl	z31.s, z1.s, #6
	mov	z12.s, #36
	movprfx	z26, z31
	mla	z26.s, p7/m, z13.s, z2.s
	movprfx	z13, z11
	mul	z13.s, z13.s, #83
	mla	z13.s, p7/m, z3.s, z12.s
	mla	z8.s, p7/m, z4.s, z14.s
	mla	z7.s, p7/m, z4.s, z15.s
	add	x0, x1, 2
	mul	z11.s, p7/m, z11.s, z12.s
	add	z14.s, z26.s, z13.s
	mov	z10.s, #-64
	sub	z26.s, z26.s, z13.s
	mla	z31.s, p7/m, z2.s, z10.s
	add	z13.s, z14.s, z8.s
	mov	z4.s, #-83
	add	z1.s, z13.s, z0.s
	mla	z11.s, p7/m, z3.s, z4.s
	sqrshrnb	z1.h, z1.s, #12
	add	z15.s, z31.s, z11.s
	uzp1	z1.h, z1.h, z1.h
	add	z12.s, z15.s, z7.s
	sunpklo	z1.s, z1.h
	add	z2.s, z12.s, z23.s
	sub	z12.s, z12.s, z23.s
	index	z23.s, #0, w2
	st1h	z1.s, p6, [x1, z23.s, sxtw 1]
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 4
	sub	z31.s, z31.s, z11.s
	add	z11.s, z31.s, z6.s
	add	z3.s, z11.s, z20.s
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 6
	add	z10.s, z26.s, z5.s
	add	z4.s, z10.s, z19.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 8
	sub	z26.s, z26.s, z5.s
	add	z5.s, z26.s, z18.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 10
	sub	z31.s, z31.s, z6.s
	add	z6.s, z31.s, z17.s
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 12
	sub	z15.s, z15.s, z7.s
	add	z7.s, z15.s, z16.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 14
	sub	z14.s, z14.s, z8.s
	add	z8.s, z14.s, z9.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 16
	sub	z14.s, z14.s, z9.s
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 18
	sub	z15.s, z15.s, z16.s
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 20
	sub	z31.s, z31.s, z17.s
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	sunpklo	z31.s, z31.h
	st1h	z31.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 22
	sub	z26.s, z26.s, z18.s
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 24
	sub	z10.s, z10.s, z19.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 26
	sub	z11.s, z11.s, z20.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 28
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x0, z23.s, sxtw 1]
	add	x0, x1, 30
	sub	z13.s, z13.s, z0.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x0, z23.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 80
	ld1sh	z1.s, p7/z, [x0]
	mov	z19.s, #80
	addvl	x0, sp, #1
	mov	z0.s, #87
	mov	z18.s, #-70
	add	x0, x0, 112
	ld1sh	z10.s, p7/z, [x0]
	movprfx	z26, z10
	mul	z26.s, p7/m, z26.s, z27.s
	addvl	x0, sp, #1
	mov	z17.s, #25
	movprfx	z20, z10
	mul	z20.s, p7/m, z20.s, z0.s
	add	x0, x0, 144
	ld1sh	z6.s, p7/z, [x0]
	mov	z2.s, #-43
	addvl	x0, sp, #1
	lsl	z1.s, z1.s, #6
	add	x0, x0, 176
	ld1sh	z11.s, p7/z, [x0]
	mla	z26.s, p7/m, z11.s, z0.s
	addvl	x0, sp, #1
	add	x0, x0, 208
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 240
	ld1sh	z12.s, p7/z, [x0]
	mla	z26.s, p7/m, z12.s, z19.s
	addvl	x0, sp, #1
	mov	z19.s, #57
	mla	z20.s, p7/m, z11.s, z19.s
	add	x0, x0, 272
	ld1sh	z7.s, p7/z, [x0]
	mla	z20.s, p7/m, z12.s, z30.s
	addvl	x0, sp, #1
	add	x0, x0, 304
	ld1sh	z13.s, p7/z, [x0]
	mla	z26.s, p7/m, z13.s, z22.s
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z13.s, z2.s
	add	x0, x0, 336
	ld1sh	z31.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 368
	ld1sh	z14.s, p7/z, [x0]
	mla	z26.s, p7/m, z14.s, z19.s
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z14.s, z28.s
	movprfx	z19, z10
	mul	z19.s, z19.s, #80
	add	x0, x0, 400
	ld1sh	z9.s, p7/z, [x0]
	mla	z19.s, p7/m, z11.s, z30.s
	addvl	x0, sp, #1
	mla	z19.s, p7/m, z12.s, z18.s
	mla	z19.s, p7/m, z13.s, z29.s
	add	x0, x0, 432
	ld1sh	z15.s, p7/z, [x0]
	mla	z20.s, p7/m, z15.s, z24.s
	addvl	x0, sp, #1
	mla	z26.s, p7/m, z15.s, z25.s
	mla	z19.s, p7/m, z14.s, z21.s
	add	x0, x0, 464
	ld1sh	z5.s, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 496
	ld1sh	z16.s, p7/z, [x0]
	mla	z20.s, p7/m, z16.s, z18.s
	addvl	x0, sp, #1
	mov	z18.s, #57
	mla	z26.s, p7/m, z16.s, z17.s
	add	x0, x0, 528
	mla	z19.s, p7/m, z15.s, z18.s
	ld1sh	z3.s, p7/z, [x0]
	movprfx	z18, z10
	mul	z18.s, p7/m, z18.s, z22.s
	addvl	x0, sp, #1
	mla	z18.s, p7/m, z11.s, z2.s
	mov	z2.s, #-9
	mla	z18.s, p7/m, z12.s, z29.s
	mla	z18.s, p7/m, z13.s, z30.s
	mla	z18.s, p7/m, z14.s, z27.s
	mla	z18.s, p7/m, z15.s, z17.s
	mov	z17.s, #-57
	mla	z18.s, p7/m, z16.s, z28.s
	add	x0, x0, 560
	ld1sh	z8.s, p7/z, [x0]
	mla	z18.s, p7/m, z8.s, z17.s
	movprfx	z17, z10
	mul	z17.s, z17.s, #57
	mla	z17.s, p7/m, z11.s, z28.s
	mla	z17.s, p7/m, z12.s, z21.s
	mla	z17.s, p7/m, z13.s, z27.s
	mla	z17.s, p7/m, z14.s, z2.s
	movprfx	z2, z10
	mul	z2.s, p7/m, z2.s, z25.s
	mla	z2.s, p7/m, z11.s, z24.s
	mov	z24.s, #57
	mad	z24.s, p7/m, z12.s, z2.s
	mov	z2.s, #25
	mla	z24.s, p7/m, z13.s, z2.s
	mla	z19.s, p7/m, z16.s, z27.s
	mla	z17.s, p7/m, z15.s, z29.s
	mad	z29.s, p7/m, z14.s, z24.s
	movprfx	z24, z10
	mul	z24.s, p7/m, z24.s, z2.s
	mov	z2.s, #-70
	mla	z24.s, p7/m, z11.s, z2.s
	mad	z27.s, p7/m, z12.s, z24.s
	mla	z27.s, p7/m, z13.s, z28.s
	mla	z27.s, p7/m, z14.s, z25.s
	mla	z26.s, p7/m, z8.s, z30.s
	mla	z17.s, p7/m, z16.s, z25.s
	mla	z29.s, p7/m, z15.s, z22.s
	mla	z17.s, p7/m, z8.s, z22.s
	mla	z29.s, p7/m, z16.s, z30.s
	mul	z10.s, z10.s, #9
	mla	z29.s, p7/m, z8.s, z28.s
	mad	z11.s, p7/m, z21.s, z10.s
	mad	z30.s, p7/m, z15.s, z27.s
	mad	z12.s, p7/m, z25.s, z11.s
	mov	z27.s, #-57
	mad	z13.s, p7/m, z27.s, z12.s
	mad	z14.s, p7/m, z22.s, z13.s
	mov	z22.s, #75
	mad	z15.s, p7/m, z28.s, z14.s
	movprfx	z28, z6
	mul	z28.s, z28.s, #89
	mla	z28.s, p7/m, z7.s, z22.s
	mla	z30.s, p7/m, z16.s, z27.s
	mov	z27.s, #50
	mad	z27.s, p7/m, z9.s, z28.s
	movprfx	z28, z6
	mul	z28.s, p7/m, z28.s, z22.s
	mla	z20.s, p7/m, z8.s, z21.s
	mla	z19.s, p7/m, z8.s, z25.s
	mov	z21.s, #-89
	mad	z16.s, p7/m, z0.s, z15.s
	mov	z24.s, #-90
	mov	z15.s, #-50
	mov	z25.s, #-18
	mad	z25.s, p7/m, z7.s, z28.s
	movprfx	z28, z6
	mul	z28.s, z28.s, #50
	mla	z28.s, p7/m, z7.s, z21.s
	mla	z30.s, p7/m, z8.s, z0.s
	mla	z16.s, p7/m, z8.s, z24.s
	add	x0, x1, x2, lsl 4
	mov	z14.s, #18
	mla	z25.s, p7/m, z9.s, z21.s
	mla	z27.s, p7/m, z3.s, z14.s
	movprfx	z24, z28
	mla	z24.s, p7/m, z14.s, z9.s
	mla	z25.s, p7/m, z3.s, z15.s
	mla	z24.s, p7/m, z3.s, z22.s
	mul	z6.s, p7/m, z6.s, z14.s
	mov	z12.s, #36
	mad	z7.s, p7/m, z15.s, z6.s
	mov	z10.s, #-64
	mad	z9.s, p7/m, z22.s, z7.s
	mov	z8.s, #-83
	movprfx	z22, z4
	mul	z22.s, z22.s, #83
	mov	z28.s, #64
	mla	z22.s, p7/m, z5.s, z12.s
	mad	z28.s, p7/m, z31.s, z1.s
	mul	z4.s, p7/m, z4.s, z12.s
	add	z15.s, z28.s, z22.s
	mad	z5.s, p7/m, z8.s, z4.s
	mla	z9.s, p7/m, z3.s, z21.s
	mad	z31.s, p7/m, z10.s, z1.s
	add	z10.s, z15.s, z27.s
	add	z21.s, z31.s, z5.s
	sub	z31.s, z31.s, z5.s
	add	z5.s, z10.s, z26.s
	add	z7.s, z31.s, z24.s
	sub	z31.s, z31.s, z24.s
	add	z12.s, z7.s, z19.s
	sub	z24.s, z15.s, z27.s
	add	z15.s, z31.s, z29.s
	sub	z27.s, z31.s, z29.s
	sub	z29.s, z7.s, z19.s
	sqrshrnb	z19.h, z5.s, #12
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	st1h	z19.s, p6, [x0, z23.s, sxtw 1]
	lsl	x0, x2, 4
	add	z8.s, z21.s, z25.s
	add	x0, x0, 2
	add	z11.s, z8.s, z20.s
	sub	z25.s, z21.s, z25.s
	add	x3, x1, x0
	add	z21.s, z25.s, z30.s
	sub	z25.s, z25.s, z30.s
	sub	z30.s, z8.s, z20.s
	sqrshrnb	z20.h, z11.s, #12
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	st1h	z20.s, p6, [x3, z23.s, sxtw 1]
	add	x3, x0, 2
	add	x3, x1, x3
	sub	z31.s, z10.s, z26.s
	sqrshrnb	z26.h, z12.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x3, z23.s, sxtw 1]
	add	x3, x0, 4
	sub	z28.s, z28.s, z22.s
	add	z6.s, z28.s, z9.s
	add	x3, x1, x3
	add	z13.s, z6.s, z18.s
	sqrshrnb	z26.h, z13.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x3, z23.s, sxtw 1]
	add	x3, x0, 6
	sub	z9.s, z28.s, z9.s
	add	z14.s, z9.s, z17.s
	add	x3, x1, x3
	sqrshrnb	z26.h, z14.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x3, z23.s, sxtw 1]
	add	x3, x0, 8
	add	x3, x1, x3
	sqrshrnb	z26.h, z15.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x3, z23.s, sxtw 1]
	add	x3, x0, 10
	add	x3, x1, x3
	add	x2, x1, x2, lsl 4
	sqrshrnb	z26.h, z21.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x3, z23.s, sxtw 1]
	add	x3, x0, 12
	add	z22.s, z24.s, z16.s
	add	x2, x2, 16
	add	x3, x1, x3
	sqrshrnb	z26.h, z22.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x3, z23.s, sxtw 1]
	sub	z24.s, z24.s, z16.s
	sqrshrnb	z26.h, z24.s, #12
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x2, z23.s, sxtw 1]
	add	x2, x0, 16
	sqrshrnb	z26.h, z25.s, #12
	add	x2, x1, x2
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	st1h	z26.s, p6, [x2, z23.s, sxtw 1]
	add	x2, x0, 18
	sqrshrnb	z27.h, z27.s, #12
	add	x2, x1, x2
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	st1h	z27.s, p6, [x2, z23.s, sxtw 1]
	add	x2, x0, 20
	sub	z9.s, z9.s, z17.s
	add	x2, x1, x2
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x2, z23.s, sxtw 1]
	add	x2, x0, 22
	add	x2, x1, x2
	sub	z28.s, z6.s, z18.s
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	st1h	z28.s, p6, [x2, z23.s, sxtw 1]
	add	x2, x0, 24
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	add	x2, x1, x2
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x2, z23.s, sxtw 1]
	add	x2, x0, 26
	sqrshrnb	z30.h, z30.s, #12
	add	x0, x0, 28
	add	x2, x1, x2
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p6, [x2, z23.s, sxtw 1]
	add	x1, x1, x0
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	sunpklo	z31.s, z31.h
	st1h	z31.s, p6, [x1, z23.s, sxtw 1]
	ldp	d8, d9, [sp]
	ldp	d10, d11, [sp, 16]
	ldp	d12, d13, [sp, 32]
	ldp	d14, d15, [sp, 48]
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	addvl	sp, sp, #1
	.cfi_def_cfa_offset 576
	add	sp, sp, 576
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	dynopt_idct16_sve2_shared, .-dynopt_idct16_sve2_shared
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
