	.arch armv8.2-a+crc+sve2
	.file	"store-scatter.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct16_sve2_shared
	.type	dynopt_idct16_sve2_shared, %function
dynopt_idct16_sve2_shared:
.LFB4:
	.cfi_startproc
	addvl	sp, sp, #-2
	.cfi_escape 0xf,0x8,0x8f,0,0x92,0x2e,0,0x40,0x1e,0x22
	add	x3, x0, 32
	ptrue	p7.b, all
	sub	sp, sp, #576
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x40,0x1e,0x23,0xc0,0x4,0x22
	mov	z25.s, #57
	mov	z20.s, #-43
	mov	z19.s, #-87
	mov	z30.s, #80
	mov	z28.s, #9
	mov	z0.s, #70
	mov	z21.s, #-25
	mov	z1.s, #87
	stp	d8, d9, [sp]
	mov	z27.s, #-70
	mov	z26.s, #-80
	mov	z24.s, #90
	mov	z22.s, #25
	mov	z18.s, #-90
	stp	d10, d11, [sp, 16]
	mov	z23.s, #43
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
	ld1sh	z7.s, p7/z, [x3]
	add	x3, x0, 96
	ld1sh	z5.s, p7/z, [x3]
	add	x3, x0, 128
	ld1sh	z9.s, p7/z, [x3]
	movprfx	z31, z2
	mul	z31.s, z31.s, #90
	add	x3, x0, 160
	ld1sh	z10.s, p7/z, [x3]
	mla	z31.s, p7/m, z5.s, z1.s
	add	x3, x0, 192
	ld1sh	z8.s, p7/z, [x3]
	mla	z31.s, p7/m, z10.s, z30.s
	add	x3, x0, 224
	ld1sh	z11.s, p7/z, [x3]
	movprfx	z30, z2
	mul	z30.s, p7/m, z30.s, z1.s
	add	x3, x0, 256
	ld1sh	z3.s, p7/z, [x3]
	mla	z31.s, p7/m, z11.s, z0.s
	add	x3, x0, 288
	ld1sh	z16.s, p7/z, [x3]
	mla	z30.s, p7/m, z5.s, z25.s
	add	x3, x0, 320
	ld1sh	z12.s, p7/z, [x3]
	mla	z31.s, p7/m, z16.s, z25.s
	add	x3, x0, 352
	ld1sh	z13.s, p7/z, [x3]
	mla	z30.s, p7/m, z10.s, z28.s
	add	x3, x0, 384
	ld1sh	z4.s, p7/z, [x3]
	mla	z30.s, p7/m, z11.s, z20.s
	add	x3, x0, 416
	movprfx	z29, z2
	mul	z29.s, z29.s, #80
	ld1sh	z15.s, p7/z, [x3]
	mla	z29.s, p7/m, z5.s, z28.s
	add	x3, x0, 448
	mla	z29.s, p7/m, z10.s, z27.s
	mla	z29.s, p7/m, z11.s, z19.s
	mla	z29.s, p7/m, z16.s, z21.s
	mla	z29.s, p7/m, z13.s, z25.s
	movprfx	z25, z2
	mul	z25.s, p7/m, z25.s, z0.s
	mla	z25.s, p7/m, z5.s, z20.s
	mov	z20.s, #-57
	mla	z25.s, p7/m, z10.s, z19.s
	mov	z19.s, #-9
	ld1sh	z6.s, p7/z, [x3]
	mla	z25.s, p7/m, z11.s, z28.s
	add	x3, x0, 480
	mla	z25.s, p7/m, z16.s, z24.s
	ld1sh	z14.s, p7/z, [x3]
	mla	z25.s, p7/m, z13.s, z22.s
	mla	z25.s, p7/m, z15.s, z26.s
	mla	z25.s, p7/m, z14.s, z20.s
	movprfx	z20, z2
	mul	z20.s, z20.s, #57
	mla	z20.s, p7/m, z5.s, z26.s
	mla	z20.s, p7/m, z10.s, z21.s
	mla	z20.s, p7/m, z11.s, z24.s
	mla	z20.s, p7/m, z16.s, z19.s
	mov	z19.s, #-87
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z20.s, p7/m, z13.s, z19.s
	mla	z30.s, p7/m, z13.s, z18.s
	movprfx	z19, z2
	mul	z19.s, p7/m, z19.s, z23.s
	mla	z19.s, p7/m, z5.s, z18.s
	mov	z18.s, #57
	mla	z19.s, p7/m, z10.s, z18.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z18.s, #-87
	mla	z19.s, p7/m, z11.s, z22.s
	mla	z19.s, p7/m, z16.s, z18.s
	movprfx	z18, z2
	mul	z18.s, p7/m, z18.s, z22.s
	mul	z2.s, p7/m, z2.s, z28.s
	mla	z18.s, p7/m, z5.s, z27.s
	mad	z5.s, p7/m, z21.s, z2.s
	mla	z18.s, p7/m, z10.s, z24.s
	mov	z27.s, #-57
	mad	z10.s, p7/m, z23.s, z5.s
	mla	z18.s, p7/m, z11.s, z26.s
	mad	z11.s, p7/m, z27.s, z10.s
	mla	z31.s, p7/m, z13.s, z23.s
	mla	z29.s, p7/m, z15.s, z24.s
	mla	z31.s, p7/m, z15.s, z22.s
	mla	z20.s, p7/m, z15.s, z23.s
	mla	z19.s, p7/m, z13.s, z0.s
	mla	z18.s, p7/m, z16.s, z23.s
	mla	z19.s, p7/m, z15.s, z28.s
	mad	z16.s, p7/m, z0.s, z11.s
	mla	z18.s, p7/m, z13.s, z28.s
	mov	z11.s, #50
	mad	z13.s, p7/m, z26.s, z16.s
	mla	z18.s, p7/m, z15.s, z27.s
	mov	z10.s, #-18
	mad	z15.s, p7/m, z1.s, z13.s
	mla	z31.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z14.s, z21.s
	mla	z29.s, p7/m, z14.s, z23.s
	mla	z20.s, p7/m, z14.s, z0.s
	mla	z19.s, p7/m, z14.s, z26.s
	mla	z18.s, p7/m, z14.s, z1.s
	mov	z16.s, #-90
	movprfx	z13, z7
	mul	z13.s, z13.s, #89
	mad	z14.s, p7/m, z16.s, z15.s
	mov	z15.s, #75
	mla	z13.s, p7/m, z8.s, z15.s
	mla	z13.s, p7/m, z12.s, z11.s
	movprfx	z11, z7
	mul	z11.s, p7/m, z11.s, z15.s
	mla	z11.s, p7/m, z8.s, z10.s
	mov	z10.s, #-50
	mov	z2.s, #18
	mov	z5.s, #-89
	mov	z1.d, z10.d
	mla	z11.s, p7/m, z12.s, z5.s
	mla	z11.s, p7/m, z6.s, z10.s
	movprfx	z10, z7
	mul	z10.s, z10.s, #50
	mul	z7.s, p7/m, z7.s, z2.s
	mla	z10.s, p7/m, z8.s, z5.s
	mad	z8.s, p7/m, z1.s, z7.s
	mla	z10.s, p7/m, z12.s, z2.s
	mov	z7.s, #36
	mad	z12.s, p7/m, z15.s, z8.s
	mov	w3, 8
	mov	z8.s, #64
	whilelo	p6.s, wzr, w3
	ld1sh	z17.s, p7/z, [x0]
	mla	z10.s, p7/m, z6.s, z15.s
	mla	z12.s, p7/m, z6.s, z5.s
	lsl	z16.s, z17.s, #6
	mov	w3, 16
	movprfx	z5, z16
	mla	z5.s, p7/m, z8.s, z3.s
	movprfx	z15, z9
	mul	z15.s, z15.s, #83
	mov	z8.s, #-64
	mla	z15.s, p7/m, z4.s, z7.s
	mla	z16.s, p7/m, z3.s, z8.s
	mul	z9.s, p7/m, z9.s, z7.s
	mov	z7.s, #-83
	mla	z9.s, p7/m, z4.s, z7.s
	add	z1.s, z16.s, z9.s
	sub	z16.s, z16.s, z9.s
	add	z3.s, z16.s, z10.s
	sub	z16.s, z16.s, z10.s
	add	z4.s, z1.s, z11.s
	add	z8.s, z3.s, z29.s
	sub	z1.s, z1.s, z11.s
	add	z11.s, z16.s, z19.s
	sub	z19.s, z16.s, z19.s
	sub	z16.s, z3.s, z29.s
	index	z29.s, #0, w3
	addvl	x3, sp, #2
	mla	z13.s, p7/m, z6.s, z2.s
	add	x3, x3, 64
	add	z17.s, z5.s, z15.s
	add	z7.s, z4.s, z30.s
	sub	z5.s, z5.s, z15.s
	add	z15.s, z17.s, z13.s
	sub	z17.s, z17.s, z13.s
	add	z6.s, z15.s, z31.s
	add	z13.s, z17.s, z14.s
	sub	z15.s, z15.s, z31.s
	sub	z17.s, z17.s, z14.s
	mov	z31.s, #32767
	sub	z14.s, z4.s, z30.s
	add	z6.s, z6.s, #64
	mov	z30.s, #-32768
	asr	z6.s, z6.s, #7
	smax	z6.s, p7/m, z6.s, z30.s
	smin	z6.s, p7/m, z6.s, z31.s
	st1h	z6.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z7.s, z7.s, #64
	add	x3, x3, 66
	asr	z7.s, z7.s, #7
	smax	z7.s, p7/m, z7.s, z30.s
	smin	z7.s, p7/m, z7.s, z31.s
	st1h	z7.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	x3, x3, 68
	add	z8.s, z8.s, #64
	asr	z8.s, z8.s, #7
	smax	z8.s, p7/m, z8.s, z30.s
	smin	z8.s, p7/m, z8.s, z31.s
	st1h	z8.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z2.s, z5.s, z12.s
	add	z9.s, z2.s, z25.s
	add	x3, x3, 70
	add	z9.s, z9.s, #64
	asr	z9.s, z9.s, #7
	smax	z9.s, p7/m, z9.s, z30.s
	smin	z9.s, p7/m, z9.s, z31.s
	st1h	z9.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	sub	z5.s, z5.s, z12.s
	add	z10.s, z5.s, z20.s
	add	x3, x3, 72
	add	z10.s, z10.s, #64
	asr	z10.s, z10.s, #7
	smax	z10.s, p7/m, z10.s, z30.s
	smin	z10.s, p7/m, z10.s, z31.s
	st1h	z10.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z11.s, z11.s, #64
	asr	z11.s, z11.s, #7
	add	x3, x3, 74
	smax	z11.s, p7/m, z11.s, z30.s
	smin	z11.s, p7/m, z11.s, z31.s
	st1h	z11.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z12.s, z1.s, z18.s
	add	x3, x3, 76
	add	z12.s, z12.s, #64
	asr	z12.s, z12.s, #7
	smax	z12.s, p7/m, z12.s, z30.s
	smin	z12.s, p7/m, z12.s, z31.s
	st1h	z12.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z13.s, z13.s, #64
	asr	z13.s, z13.s, #7
	add	x3, x3, 78
	smax	z13.s, p7/m, z13.s, z30.s
	smin	z13.s, p7/m, z13.s, z31.s
	st1h	z13.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z17.s, z17.s, #64
	add	x3, x3, 80
	asr	z17.s, z17.s, #7
	smax	z17.s, p7/m, z17.s, z30.s
	smin	z17.s, p7/m, z17.s, z31.s
	st1h	z17.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	x3, x3, 82
	sub	z18.s, z1.s, z18.s
	add	z18.s, z18.s, #64
	asr	z18.s, z18.s, #7
	smax	z18.s, p7/m, z18.s, z30.s
	smin	z18.s, p7/m, z18.s, z31.s
	st1h	z18.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z19.s, z19.s, #64
	add	x3, x3, 84
	asr	z19.s, z19.s, #7
	smax	z19.s, p7/m, z19.s, z30.s
	smin	z19.s, p7/m, z19.s, z31.s
	st1h	z19.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	x3, x3, 86
	sub	z20.s, z5.s, z20.s
	add	z20.s, z20.s, #64
	asr	z20.s, z20.s, #7
	smax	z20.s, p7/m, z20.s, z30.s
	smin	z20.s, p7/m, z20.s, z31.s
	st1h	z20.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	sub	z25.s, z2.s, z25.s
	add	x3, x3, 88
	add	z25.s, z25.s, #64
	asr	z25.s, z25.s, #7
	smax	z25.s, p7/m, z25.s, z30.s
	smin	z25.s, p7/m, z25.s, z31.s
	st1h	z25.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z16.s, z16.s, #64
	asr	z16.s, z16.s, #7
	add	x3, x3, 90
	smax	z16.s, p7/m, z16.s, z30.s
	smin	z16.s, p7/m, z16.s, z31.s
	st1h	z16.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	z14.s, z14.s, #64
	add	x3, x3, 92
	asr	z14.s, z14.s, #7
	smax	z14.s, p7/m, z14.s, z30.s
	smin	z14.s, p7/m, z14.s, z31.s
	st1h	z14.s, p6, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	x3, x3, 94
	add	z15.s, z15.s, #64
	asr	z15.s, z15.s, #7
	smax	z15.s, p7/m, z15.s, z30.s
	smin	z15.s, p7/m, z15.s, z31.s
	st1h	z15.s, p6, [x3, z29.s, sxtw 1]
	add	x3, x0, 16
	ld1sh	z1.s, p7/z, [x3]
	mov	z19.s, #87
	add	x3, x0, 48
	ld1sh	z2.s, p7/z, [x3]
	mov	z18.s, #80
	add	x3, x0, 80
	ld1sh	z8.s, p7/z, [x3]
	movprfx	z20, z2
	mul	z20.s, p7/m, z20.s, z24.s
	add	x3, x0, 112
	ld1sh	z3.s, p7/z, [x3]
	mla	z20.s, p7/m, z3.s, z19.s
	add	x3, x0, 144
	ld1sh	z10.s, p7/z, [x3]
	mov	z19.s, #57
	add	x3, x0, 176
	ld1sh	z25.s, p7/z, [x3]
	mla	z20.s, p7/m, z25.s, z18.s
	add	x3, x0, 208
	ld1sh	z9.s, p7/z, [x3]
	mov	z16.s, #-90
	add	x3, x0, 240
	ld1sh	z12.s, p7/z, [x3]
	mla	z20.s, p7/m, z12.s, z0.s
	add	x3, x0, 272
	ld1sh	z4.s, p7/z, [x3]
	mov	z17.s, #-70
	add	x3, x0, 304
	ld1sh	z13.s, p7/z, [x3]
	mla	z20.s, p7/m, z13.s, z19.s
	add	x3, x0, 336
	ld1sh	z11.s, p7/z, [x3]
	mov	z18.d, z22.d
	add	x3, x0, 368
	ld1sh	z14.s, p7/z, [x3]
	mla	z20.s, p7/m, z14.s, z23.s
	add	x3, x0, 400
	ld1sh	z6.s, p7/z, [x3]
	add	x3, x0, 432
	ld1sh	z15.s, p7/z, [x3]
	mla	z20.s, p7/m, z15.s, z22.s
	add	x3, x0, 464
	add	x0, x0, 496
	ld1sh	z5.s, p7/z, [x0]
	addvl	x0, sp, #1
	mla	z20.s, p7/m, z5.s, z28.s
	ld1sh	z7.s, p7/z, [x3]
	add	x0, x0, 64
	str	z20, [x0]
	movprfx	z20, z2
	mul	z20.s, z20.s, #87
	mla	z20.s, p7/m, z3.s, z19.s
	mov	z19.s, #-43
	mla	z20.s, p7/m, z25.s, z28.s
	mla	z20.s, p7/m, z12.s, z19.s
	mla	z20.s, p7/m, z13.s, z26.s
	mla	z20.s, p7/m, z14.s, z16.s
	mla	z20.s, p7/m, z15.s, z17.s
	mla	z20.s, p7/m, z5.s, z21.s
	add	x0, sp, 64
	mov	z19.s, #57
	str	z20, [x0]
	movprfx	z20, z2
	mul	z20.s, z20.s, #80
	mla	z20.s, p7/m, z3.s, z28.s
	mla	z20.s, p7/m, z25.s, z17.s
	mov	z17.s, #-87
	mov	z22.d, z16.d
	mla	z20.s, p7/m, z12.s, z17.s
	mov	z16.s, #-43
	mla	z20.s, p7/m, z13.s, z21.s
	mla	z20.s, p7/m, z14.s, z19.s
	movprfx	z19, z2
	mul	z19.s, p7/m, z19.s, z0.s
	mla	z19.s, p7/m, z3.s, z16.s
	mla	z19.s, p7/m, z25.s, z17.s
	mov	z17.s, #-9
	mla	z19.s, p7/m, z12.s, z28.s
	mla	z19.s, p7/m, z13.s, z24.s
	mla	z19.s, p7/m, z14.s, z18.s
	mla	z19.s, p7/m, z15.s, z26.s
	mla	z19.s, p7/m, z5.s, z27.s
	mov	z27.s, #-87
	mov	z16.d, z18.d
	movprfx	z18, z2
	mul	z18.s, z18.s, #57
	mla	z18.s, p7/m, z3.s, z26.s
	mla	z18.s, p7/m, z25.s, z21.s
	mla	z18.s, p7/m, z12.s, z24.s
	mla	z18.s, p7/m, z13.s, z17.s
	movprfx	z17, z2
	mul	z17.s, p7/m, z17.s, z23.s
	mla	z18.s, p7/m, z14.s, z27.s
	mla	z17.s, p7/m, z3.s, z22.s
	mov	z22.s, #57
	mla	z17.s, p7/m, z25.s, z22.s
	mla	z17.s, p7/m, z12.s, z16.s
	mla	z17.s, p7/m, z13.s, z27.s
	mov	z27.s, #-70
	mla	z17.s, p7/m, z14.s, z0.s
	addvl	x0, sp, #1
	movprfx	z16, z2
	mul	z16.s, z16.s, #25
	mul	z2.s, p7/m, z2.s, z28.s
	mla	z16.s, p7/m, z3.s, z27.s
	mad	z3.s, p7/m, z21.s, z2.s
	mla	z16.s, p7/m, z25.s, z24.s
	mov	z27.s, #-57
	mad	z25.s, p7/m, z23.s, z3.s
	mla	z16.s, p7/m, z12.s, z26.s
	mad	z12.s, p7/m, z27.s, z25.s
	mla	z16.s, p7/m, z13.s, z23.s
	mad	z13.s, p7/m, z0.s, z12.s
	mla	z16.s, p7/m, z14.s, z28.s
	mad	z14.s, p7/m, z26.s, z13.s
	mla	z20.s, p7/m, z15.s, z24.s
	mla	z18.s, p7/m, z15.s, z23.s
	mla	z17.s, p7/m, z15.s, z28.s
	mla	z16.s, p7/m, z15.s, z27.s
	mov	z22.s, #87
	add	x0, x0, 64
	mad	z15.s, p7/m, z22.s, z14.s
	mov	z25.s, #-90
	mov	z14.s, #50
	mov	z13.s, #-18
	mla	z20.s, p7/m, z5.s, z23.s
	mla	z17.s, p7/m, z5.s, z26.s
	mla	z16.s, p7/m, z5.s, z22.s
	ldr	z22, [x0]
	mla	z18.s, p7/m, z5.s, z0.s
	mov	z12.s, #75
	mad	z5.s, p7/m, z25.s, z15.s
	mov	z2.s, #18
	add	x0, sp, 64
	mov	z3.s, #-89
	mov	z25.s, #-50
	movprfx	z15, z8
	mul	z15.s, z15.s, #89
	mla	z15.s, p7/m, z9.s, z12.s
	mla	z15.s, p7/m, z11.s, z14.s
	movprfx	z14, z8
	mul	z14.s, p7/m, z14.s, z12.s
	mla	z14.s, p7/m, z9.s, z13.s
	movprfx	z13, z8
	mul	z13.s, z13.s, #50
	mla	z14.s, p7/m, z11.s, z3.s
	mla	z13.s, p7/m, z9.s, z3.s
	mul	z8.s, p7/m, z8.s, z2.s
	mla	z13.s, p7/m, z11.s, z2.s
	mad	z9.s, p7/m, z25.s, z8.s
	mad	z11.s, p7/m, z12.s, z9.s
	mla	z14.s, p7/m, z7.s, z25.s
	mla	z13.s, p7/m, z7.s, z12.s
	mad	z3.s, p7/m, z7.s, z11.s
	lsl	z25.s, z1.s, #6
	mov	z11.s, #64
	mov	z8.s, #-64
	movprfx	z12, z25
	mla	z12.s, p7/m, z11.s, z4.s
	mla	z25.s, p7/m, z4.s, z8.s
	ldr	z4, [x0]
	addvl	x0, sp, #1
	mla	z15.s, p7/m, z7.s, z2.s
	mov	z9.s, #36
	add	x0, x0, 64
	movprfx	z11, z10
	mul	z11.s, z11.s, #83
	mov	z7.s, #-83
	mul	z10.s, p7/m, z10.s, z9.s
	mla	z10.s, p7/m, z6.s, z7.s
	mla	z11.s, p7/m, z6.s, z9.s
	add	z7.s, z25.s, z10.s
	add	z6.s, z12.s, z11.s
	sub	z25.s, z25.s, z10.s
	sub	z12.s, z12.s, z11.s
	add	z9.s, z25.s, z13.s
	add	z8.s, z12.s, z3.s
	add	z10.s, z7.s, z14.s
	sub	z7.s, z7.s, z14.s
	add	z14.s, z10.s, z4.s
	add	z4.s, z8.s, z19.s
	str	z4, [x0]
	add	x0, sp, 64
	add	z11.s, z6.s, z15.s
	sub	z12.s, z12.s, z3.s
	sub	z6.s, z6.s, z15.s
	add	z3.s, z7.s, z16.s
	add	z15.s, z9.s, z20.s
	sub	z7.s, z7.s, z16.s
	sub	z16.s, z9.s, z20.s
	ldr	z9, [x0]
	addvl	x0, sp, #2
	sub	z25.s, z25.s, z13.s
	add	x0, x0, 320
	add	z13.s, z11.s, z22.s
	add	z13.s, z13.s, #64
	asr	z13.s, z13.s, #7
	smax	z13.s, p7/m, z13.s, z30.s
	smin	z13.s, p7/m, z13.s, z31.s
	st1h	z13.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z14.s, z14.s, #64
	add	x0, x0, 322
	asr	z14.s, z14.s, #7
	smax	z14.s, p7/m, z14.s, z30.s
	smin	z14.s, p7/m, z14.s, z31.s
	st1h	z14.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	x0, x0, 324
	add	z15.s, z15.s, #64
	asr	z15.s, z15.s, #7
	smax	z15.s, p7/m, z15.s, z30.s
	smin	z15.s, p7/m, z15.s, z31.s
	st1h	z15.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #1
	add	z2.s, z25.s, z17.s
	sub	z25.s, z25.s, z17.s
	add	x0, x0, 64
	sub	z17.s, z11.s, z22.s
	ldr	z11, [x0]
	addvl	x0, sp, #2
	movprfx	z15, z11
	add	z15.s, z15.s, #64
	asr	z15.s, z15.s, #7
	add	x0, x0, 326
	smax	z15.s, p7/m, z15.s, z30.s
	smin	z15.s, p7/m, z15.s, z31.s
	st1h	z15.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z1.s, z12.s, z18.s
	add	x0, x0, 328
	add	z1.s, z1.s, #64
	asr	z1.s, z1.s, #7
	smax	z1.s, p7/m, z1.s, z30.s
	smin	z1.s, p7/m, z1.s, z31.s
	st1h	z1.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z2.s, z2.s, #64
	asr	z2.s, z2.s, #7
	add	x0, x0, 330
	smax	z2.s, p7/m, z2.s, z30.s
	smin	z2.s, p7/m, z2.s, z31.s
	st1h	z2.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z3.s, z3.s, #64
	add	x0, x0, 332
	asr	z3.s, z3.s, #7
	smax	z3.s, p7/m, z3.s, z30.s
	smin	z3.s, p7/m, z3.s, z31.s
	st1h	z3.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	x0, x0, 334
	add	z4.s, z6.s, z5.s
	add	z4.s, z4.s, #64
	asr	z4.s, z4.s, #7
	smax	z4.s, p7/m, z4.s, z30.s
	smin	z4.s, p7/m, z4.s, z31.s
	st1h	z4.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	sub	z6.s, z6.s, z5.s
	add	x0, x0, 336
	add	z6.s, z6.s, #64
	asr	z6.s, z6.s, #7
	smax	z6.s, p7/m, z6.s, z30.s
	smin	z6.s, p7/m, z6.s, z31.s
	st1h	z6.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z7.s, z7.s, #64
	asr	z7.s, z7.s, #7
	add	x0, x0, 338
	smax	z7.s, p7/m, z7.s, z30.s
	smin	z7.s, p7/m, z7.s, z31.s
	st1h	z7.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z25.s, z25.s, #64
	add	x0, x0, 340
	asr	z25.s, z25.s, #7
	smax	z25.s, p7/m, z25.s, z30.s
	smin	z25.s, p7/m, z25.s, z31.s
	st1h	z25.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	x0, x0, 342
	sub	z18.s, z12.s, z18.s
	add	z18.s, z18.s, #64
	asr	z18.s, z18.s, #7
	smax	z18.s, p7/m, z18.s, z30.s
	smin	z18.s, p7/m, z18.s, z31.s
	st1h	z18.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	sub	z19.s, z8.s, z19.s
	add	x0, x0, 344
	add	z19.s, z19.s, #64
	asr	z19.s, z19.s, #7
	smax	z19.s, p7/m, z19.s, z30.s
	smin	z19.s, p7/m, z19.s, z31.s
	st1h	z19.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z16.s, z16.s, #64
	asr	z16.s, z16.s, #7
	add	x0, x0, 346
	smax	z16.s, p7/m, z16.s, z30.s
	smin	z16.s, p7/m, z16.s, z31.s
	st1h	z16.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	sub	z20.s, z10.s, z9.s
	add	x0, x0, 348
	add	z20.s, z20.s, #64
	asr	z20.s, z20.s, #7
	smax	z20.s, p7/m, z20.s, z30.s
	smin	z20.s, p7/m, z20.s, z31.s
	st1h	z20.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	z17.s, z17.s, #64
	asr	z17.s, z17.s, #7
	add	x0, x0, 350
	smax	z17.s, p7/m, z17.s, z30.s
	smin	z17.s, p7/m, z17.s, z31.s
	st1h	z17.s, p6, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	mov	z22.s, #25
	add	x0, x0, 64
	ld1sh	z2.s, p7/z, [x0]
	mov	z1.s, #87
	addvl	x0, sp, #2
	mov	z18.s, #80
	mov	z20.s, #57
	add	x0, x0, 96
	ld1sh	z5.s, p7/z, [x0]
	movprfx	z25, z5
	mul	z25.s, p7/m, z25.s, z24.s
	addvl	x0, sp, #2
	mov	z19.s, #-43
	mov	z17.s, #-90
	add	x0, x0, 128
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 160
	ld1sh	z10.s, p7/z, [x0]
	mla	z25.s, p7/m, z10.s, z1.s
	addvl	x0, sp, #2
	add	x0, x0, 192
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 224
	ld1sh	z29.s, p7/z, [x0]
	mla	z25.s, p7/m, z29.s, z18.s
	addvl	x0, sp, #2
	add	x0, x0, 256
	ld1sh	z8.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 288
	ld1sh	z12.s, p7/z, [x0]
	mla	z25.s, p7/m, z12.s, z0.s
	addvl	x0, sp, #2
	add	x0, x0, 320
	ld1sh	z3.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 352
	ld1sh	z13.s, p7/z, [x0]
	mla	z25.s, p7/m, z13.s, z20.s
	addvl	x0, sp, #2
	add	x0, x0, 384
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 416
	ld1sh	z15.s, p7/z, [x0]
	mla	z25.s, p7/m, z15.s, z23.s
	addvl	x0, sp, #2
	add	x0, x0, 448
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 480
	ld1sh	z16.s, p7/z, [x0]
	mla	z25.s, p7/m, z16.s, z22.s
	addvl	x0, sp, #2
	add	x0, x0, 512
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 544
	ld1sh	z14.s, p7/z, [x0]
	mla	z25.s, p7/m, z14.s, z28.s
	add	x0, sp, 64
	str	z25, [x0]
	movprfx	z25, z5
	mul	z25.s, p7/m, z25.s, z1.s
	addvl	x0, sp, #1
	mla	z25.s, p7/m, z10.s, z20.s
	mov	z20.s, #-70
	mla	z25.s, p7/m, z29.s, z28.s
	mla	z25.s, p7/m, z12.s, z19.s
	mla	z25.s, p7/m, z13.s, z26.s
	mla	z25.s, p7/m, z15.s, z17.s
	mla	z25.s, p7/m, z16.s, z20.s
	mla	z25.s, p7/m, z14.s, z21.s
	add	x0, x0, 64
	str	z25, [x0]
	movprfx	z25, z5
	mul	z25.s, p7/m, z25.s, z18.s
	mov	z18.s, #-87
	mla	z25.s, p7/m, z10.s, z28.s
	mla	z25.s, p7/m, z29.s, z20.s
	mov	z20.s, #57
	mla	z25.s, p7/m, z12.s, z18.s
	mla	z25.s, p7/m, z13.s, z21.s
	mla	z25.s, p7/m, z15.s, z20.s
	movprfx	z20, z5
	mul	z20.s, p7/m, z20.s, z0.s
	mla	z20.s, p7/m, z10.s, z19.s
	mla	z20.s, p7/m, z29.s, z18.s
	mov	z18.s, #-9
	mla	z20.s, p7/m, z12.s, z28.s
	mla	z20.s, p7/m, z13.s, z24.s
	mla	z20.s, p7/m, z15.s, z22.s
	mla	z20.s, p7/m, z16.s, z26.s
	mla	z20.s, p7/m, z14.s, z27.s
	mov	z27.s, #-87
	movprfx	z19, z5
	mul	z19.s, z19.s, #57
	mla	z19.s, p7/m, z10.s, z26.s
	mla	z19.s, p7/m, z29.s, z21.s
	mla	z19.s, p7/m, z12.s, z24.s
	mla	z19.s, p7/m, z13.s, z18.s
	movprfx	z18, z5
	mul	z18.s, p7/m, z18.s, z23.s
	mla	z19.s, p7/m, z15.s, z27.s
	mla	z18.s, p7/m, z10.s, z17.s
	mov	z17.s, #57
	mla	z18.s, p7/m, z29.s, z17.s
	mla	z18.s, p7/m, z12.s, z22.s
	mla	z18.s, p7/m, z13.s, z27.s
	mov	z27.s, #-70
	movprfx	z17, z5
	mul	z17.s, p7/m, z17.s, z22.s
	mul	z5.s, p7/m, z5.s, z28.s
	mla	z17.s, p7/m, z10.s, z27.s
	mad	z10.s, p7/m, z21.s, z5.s
	mla	z17.s, p7/m, z29.s, z24.s
	mov	z27.s, #-57
	mad	z29.s, p7/m, z23.s, z10.s
	mla	z17.s, p7/m, z12.s, z26.s
	mad	z12.s, p7/m, z27.s, z29.s
	mla	z18.s, p7/m, z15.s, z0.s
	mla	z17.s, p7/m, z13.s, z23.s
	mov	z10.s, #-18
	mad	z13.s, p7/m, z0.s, z12.s
	mla	z17.s, p7/m, z15.s, z28.s
	mov	z12.s, #50
	mad	z15.s, p7/m, z26.s, z13.s
	mla	z25.s, p7/m, z16.s, z24.s
	mla	z19.s, p7/m, z16.s, z23.s
	mla	z18.s, p7/m, z16.s, z28.s
	mla	z17.s, p7/m, z16.s, z27.s
	mov	z29.s, #-90
	mad	z16.s, p7/m, z1.s, z15.s
	movprfx	z13, z7
	mul	z13.s, z13.s, #89
	mov	z15.s, #75
	mla	z13.s, p7/m, z8.s, z15.s
	mla	z13.s, p7/m, z11.s, z12.s
	movprfx	z12, z7
	mul	z12.s, p7/m, z12.s, z15.s
	mla	z12.s, p7/m, z8.s, z10.s
	mov	z10.s, #-50
	mla	z25.s, p7/m, z14.s, z23.s
	mla	z18.s, p7/m, z14.s, z26.s
	mla	z17.s, p7/m, z14.s, z1.s
	mla	z19.s, p7/m, z14.s, z0.s
	mov	z5.s, #-89
	mad	z14.s, p7/m, z29.s, z16.s
	mla	z12.s, p7/m, z11.s, z5.s
	mov	z29.s, #18
	mla	z12.s, p7/m, z6.s, z10.s
	mov	z16.d, z10.d
	movprfx	z10, z7
	mul	z10.s, z10.s, #50
	mul	z7.s, p7/m, z7.s, z29.s
	mla	z10.s, p7/m, z8.s, z5.s
	mad	z8.s, p7/m, z16.s, z7.s
	mla	z10.s, p7/m, z11.s, z29.s
	add	x0, sp, 64
	mad	z11.s, p7/m, z15.s, z8.s
	mov	z8.s, #-64
	mla	z13.s, p7/m, z6.s, z29.s
	mla	z10.s, p7/m, z6.s, z15.s
	mla	z11.s, p7/m, z6.s, z5.s
	lsl	z29.s, z2.s, #6
	mov	z6.s, #36
	mov	z2.s, #64
	mov	z7.s, #-83
	movprfx	z5, z29
	mla	z5.s, p7/m, z2.s, z3.s
	mla	z29.s, p7/m, z3.s, z8.s
	movprfx	z8, z9
	mul	z8.s, z8.s, #83
	mul	z9.s, p7/m, z9.s, z6.s
	mla	z9.s, p7/m, z4.s, z7.s
	add	z16.s, z29.s, z9.s
	add	z3.s, z16.s, z12.s
	sub	z16.s, z16.s, z12.s
	ldr	z12, [x0]
	addvl	x0, sp, #1
	mla	z8.s, p7/m, z4.s, z6.s
	sub	z29.s, z29.s, z9.s
	add	x0, x0, 64
	add	z2.s, z29.s, z10.s
	add	z15.s, z5.s, z8.s
	sub	z5.s, z5.s, z8.s
	add	z4.s, z15.s, z13.s
	add	z1.s, z5.s, z11.s
	add	z8.s, z2.s, z25.s
	sub	z5.s, z5.s, z11.s
	ldr	z11, [x0]
	sub	z15.s, z15.s, z13.s
	add	z13.s, z15.s, z14.s
	sub	z15.s, z15.s, z14.s
	sub	z14.s, z2.s, z25.s
	ldr	z2, [x0]
	add	x0, sp, 64
	ldr	z25, [x0]
	add	z6.s, z4.s, z12.s
	add	x0, x1, 2
	add	z12.s, z16.s, z17.s
	add	z6.s, z6.s, #2048
	sub	z16.s, z16.s, z17.s
	asr	z6.s, z6.s, #12
	sub	z17.s, z4.s, z25.s
	smax	z6.s, p7/m, z6.s, z30.s
	index	z25.s, #0, w2
	smin	z6.s, p7/m, z6.s, z31.s
	st1h	z6.s, p6, [x1, z25.s, sxtw 1]
	add	z7.s, z3.s, z11.s
	add	z7.s, z7.s, #2048
	asr	z7.s, z7.s, #12
	smax	z7.s, p7/m, z7.s, z30.s
	smin	z7.s, p7/m, z7.s, z31.s
	st1h	z7.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 4
	add	z8.s, z8.s, #2048
	asr	z8.s, z8.s, #12
	smax	z8.s, p7/m, z8.s, z30.s
	smin	z8.s, p7/m, z8.s, z31.s
	st1h	z8.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 6
	add	z9.s, z1.s, z20.s
	add	z9.s, z9.s, #2048
	asr	z9.s, z9.s, #12
	smax	z9.s, p7/m, z9.s, z30.s
	smin	z9.s, p7/m, z9.s, z31.s
	st1h	z9.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 8
	sub	z29.s, z29.s, z10.s
	add	z10.s, z5.s, z19.s
	add	z10.s, z10.s, #2048
	asr	z10.s, z10.s, #12
	smax	z10.s, p7/m, z10.s, z30.s
	smin	z10.s, p7/m, z10.s, z31.s
	st1h	z10.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 10
	add	z11.s, z29.s, z18.s
	add	z11.s, z11.s, #2048
	asr	z11.s, z11.s, #12
	smax	z11.s, p7/m, z11.s, z30.s
	smin	z11.s, p7/m, z11.s, z31.s
	st1h	z11.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 12
	add	z12.s, z12.s, #2048
	asr	z12.s, z12.s, #12
	smax	z12.s, p7/m, z12.s, z30.s
	smin	z12.s, p7/m, z12.s, z31.s
	st1h	z12.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 14
	add	z13.s, z13.s, #2048
	asr	z13.s, z13.s, #12
	smax	z13.s, p7/m, z13.s, z30.s
	smin	z13.s, p7/m, z13.s, z31.s
	st1h	z13.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 16
	add	z15.s, z15.s, #2048
	asr	z15.s, z15.s, #12
	smax	z15.s, p7/m, z15.s, z30.s
	smin	z15.s, p7/m, z15.s, z31.s
	st1h	z15.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 18
	add	z16.s, z16.s, #2048
	asr	z16.s, z16.s, #12
	smax	z16.s, p7/m, z16.s, z30.s
	smin	z16.s, p7/m, z16.s, z31.s
	st1h	z16.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 20
	sub	z29.s, z29.s, z18.s
	add	z29.s, z29.s, #2048
	asr	z29.s, z29.s, #12
	smax	z29.s, p7/m, z29.s, z30.s
	smin	z29.s, p7/m, z29.s, z31.s
	st1h	z29.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 22
	sub	z19.s, z5.s, z19.s
	add	z19.s, z19.s, #2048
	asr	z19.s, z19.s, #12
	smax	z19.s, p7/m, z19.s, z30.s
	smin	z19.s, p7/m, z19.s, z31.s
	st1h	z19.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 24
	sub	z20.s, z1.s, z20.s
	add	z20.s, z20.s, #2048
	asr	z20.s, z20.s, #12
	smax	z20.s, p7/m, z20.s, z30.s
	smin	z20.s, p7/m, z20.s, z31.s
	st1h	z20.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 26
	add	z14.s, z14.s, #2048
	asr	z14.s, z14.s, #12
	smax	z14.s, p7/m, z14.s, z30.s
	smin	z14.s, p7/m, z14.s, z31.s
	st1h	z14.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 28
	sub	z18.s, z3.s, z2.s
	add	z18.s, z18.s, #2048
	asr	z18.s, z18.s, #12
	smax	z18.s, p7/m, z18.s, z30.s
	smin	z18.s, p7/m, z18.s, z31.s
	st1h	z18.s, p6, [x0, z25.s, sxtw 1]
	add	x0, x1, 30
	add	z17.s, z17.s, #2048
	asr	z17.s, z17.s, #12
	smax	z17.s, p7/m, z17.s, z30.s
	smin	z17.s, p7/m, z17.s, z31.s
	st1h	z17.s, p6, [x0, z25.s, sxtw 1]
	addvl	x0, sp, #2
	add	x0, x0, 80
	ld1sh	z20.s, p7/z, [x0]
	mov	z18.s, #80
	add	x0, sp, 64
	str	z20, [x0]
	mov	z1.s, #87
	addvl	x0, sp, #2
	mov	z17.s, #-90
	mov	z16.s, #-70
	add	x0, x0, 112
	ld1sh	z9.s, p7/z, [x0]
	movprfx	z20, z9
	mul	z20.s, p7/m, z20.s, z24.s
	addvl	x0, sp, #2
	movprfx	z19, z9
	mul	z19.s, p7/m, z19.s, z1.s
	add	x0, x0, 144
	ld1sh	z5.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 176
	ld1sh	z10.s, p7/z, [x0]
	mla	z20.s, p7/m, z10.s, z1.s
	addvl	x0, sp, #2
	add	x0, x0, 208
	ld1sh	z3.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 240
	ld1sh	z11.s, p7/z, [x0]
	mla	z20.s, p7/m, z11.s, z18.s
	addvl	x0, sp, #2
	mov	z18.s, #57
	mla	z19.s, p7/m, z10.s, z18.s
	add	x0, x0, 272
	ld1sh	z6.s, p7/z, [x0]
	mla	z19.s, p7/m, z11.s, z28.s
	addvl	x0, sp, #2
	add	x0, x0, 304
	ld1sh	z12.s, p7/z, [x0]
	mla	z20.s, p7/m, z12.s, z0.s
	addvl	x0, sp, #2
	add	x0, x0, 336
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 368
	ld1sh	z13.s, p7/z, [x0]
	mla	z20.s, p7/m, z13.s, z18.s
	addvl	x0, sp, #2
	mov	z18.s, #-43
	mla	z19.s, p7/m, z12.s, z18.s
	add	x0, x0, 400
	ld1sh	z8.s, p7/z, [x0]
	mla	z19.s, p7/m, z13.s, z26.s
	addvl	x0, sp, #2
	mov	z1.d, z18.d
	movprfx	z18, z9
	mul	z18.s, z18.s, #80
	add	x0, x0, 432
	ld1sh	z14.s, p7/z, [x0]
	mla	z19.s, p7/m, z14.s, z17.s
	addvl	x0, sp, #2
	mov	z17.s, #57
	mla	z18.s, p7/m, z10.s, z28.s
	add	x0, x0, 464
	ld1sh	z4.s, p7/z, [x0]
	mla	z18.s, p7/m, z11.s, z16.s
	addvl	x0, sp, #2
	mla	z20.s, p7/m, z14.s, z23.s
	add	x0, x0, 496
	ld1sh	z15.s, p7/z, [x0]
	mla	z19.s, p7/m, z15.s, z16.s
	addvl	x0, sp, #2
	mov	z16.s, #-87
	mla	z18.s, p7/m, z12.s, z16.s
	add	x0, x0, 528
	mla	z18.s, p7/m, z13.s, z21.s
	ld1sh	z2.s, p7/z, [x0]
	mla	z18.s, p7/m, z14.s, z17.s
	addvl	x0, sp, #2
	movprfx	z17, z9
	mul	z17.s, p7/m, z17.s, z0.s
	mla	z17.s, p7/m, z10.s, z1.s
	mov	z1.d, z16.d
	mla	z20.s, p7/m, z15.s, z22.s
	mla	z17.s, p7/m, z11.s, z16.s
	add	x0, x0, 560
	mla	z17.s, p7/m, z12.s, z28.s
	ld1sh	z7.s, p7/z, [x0]
	mla	z17.s, p7/m, z13.s, z24.s
	movprfx	z16, z9
	mul	z16.s, z16.s, #57
	mla	z17.s, p7/m, z14.s, z22.s
	mla	z16.s, p7/m, z10.s, z26.s
	mla	z17.s, p7/m, z15.s, z26.s
	mla	z16.s, p7/m, z11.s, z21.s
	mla	z17.s, p7/m, z7.s, z27.s
	mla	z16.s, p7/m, z12.s, z24.s
	mov	z27.s, #-9
	mov	z22.s, #-90
	mla	z16.s, p7/m, z13.s, z27.s
	mla	z16.s, p7/m, z14.s, z1.s
	movprfx	z1, z9
	mul	z1.s, p7/m, z1.s, z23.s
	mla	z1.s, p7/m, z10.s, z22.s
	mov	z22.s, #57
	mad	z22.s, p7/m, z11.s, z1.s
	mov	z1.s, #25
	mla	z22.s, p7/m, z12.s, z1.s
	mov	z27.s, #-87
	mad	z27.s, p7/m, z13.s, z22.s
	movprfx	z22, z9
	mul	z22.s, p7/m, z22.s, z1.s
	mov	z1.s, #-70
	mla	z22.s, p7/m, z10.s, z1.s
	mla	z18.s, p7/m, z15.s, z24.s
	mad	z24.s, p7/m, z11.s, z22.s
	mov	z22.s, #-90
	mla	z24.s, p7/m, z12.s, z26.s
	mla	z24.s, p7/m, z13.s, z23.s
	mla	z20.s, p7/m, z7.s, z28.s
	mla	z16.s, p7/m, z15.s, z23.s
	mla	z27.s, p7/m, z14.s, z0.s
	mov	z1.s, #-57
	mla	z27.s, p7/m, z15.s, z28.s
	mul	z9.s, z9.s, #9
	mla	z27.s, p7/m, z7.s, z26.s
	mad	z10.s, p7/m, z21.s, z9.s
	mad	z28.s, p7/m, z14.s, z24.s
	mad	z11.s, p7/m, z23.s, z10.s
	mla	z28.s, p7/m, z15.s, z1.s
	mad	z12.s, p7/m, z1.s, z11.s
	mov	z24.s, #87
	mad	z13.s, p7/m, z0.s, z12.s
	mad	z14.s, p7/m, z26.s, z13.s
	movprfx	z26, z5
	mul	z26.s, z26.s, #89
	mad	z15.s, p7/m, z24.s, z14.s
	mla	z15.s, p7/m, z7.s, z22.s
	mov	z22.s, #75
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z28.s, p7/m, z7.s, z24.s
	mov	z24.s, #50
	mad	z24.s, p7/m, z8.s, z26.s
	movprfx	z26, z5
	mul	z26.s, p7/m, z26.s, z22.s
	mla	z19.s, p7/m, z7.s, z21.s
	mla	z18.s, p7/m, z7.s, z23.s
	mov	z14.s, #-89
	mov	z21.s, #18
	mov	z23.s, #-18
	mad	z23.s, p7/m, z6.s, z26.s
	movprfx	z26, z5
	mul	z26.s, z26.s, #50
	mla	z26.s, p7/m, z6.s, z14.s
	mla	z26.s, p7/m, z8.s, z21.s
	mla	z24.s, p7/m, z2.s, z21.s
	mla	z23.s, p7/m, z8.s, z14.s
	movprfx	z21, z26
	mla	z21.s, p7/m, z22.s, z2.s
	add	x0, sp, 64
	ldr	z26, [x0]
	mov	z13.s, #-50
	mul	z5.s, z5.s, #18
	mad	z6.s, p7/m, z13.s, z5.s
	mad	z8.s, p7/m, z22.s, z6.s
	mov	z22.s, #-64
	mla	z16.s, p7/m, z7.s, z0.s
	add	x0, x1, x2, lsl 4
	lsl	z0.s, z26.s, #6
	mov	z7.s, #-83
	mov	z26.s, #64
	mad	z26.s, p7/m, z29.s, z0.s
	mad	z29.s, p7/m, z22.s, z0.s
	movprfx	z22, z3
	mul	z22.s, z22.s, #83
	mla	z23.s, p7/m, z2.s, z13.s
	mla	z8.s, p7/m, z2.s, z14.s
	mul	z3.s, z3.s, #36
	mov	z14.s, #36
	mad	z14.s, p7/m, z4.s, z22.s
	mad	z4.s, p7/m, z7.s, z3.s
	add	z22.s, z26.s, z14.s
	add	z2.s, z22.s, z24.s
	add	z7.s, z2.s, z20.s
	add	z7.s, z7.s, #2048
	asr	z7.s, z7.s, #12
	smax	z7.s, p7/m, z7.s, z30.s
	smin	z7.s, p7/m, z7.s, z31.s
	st1h	z7.s, p6, [x0, z25.s, sxtw 1]
	lsl	x0, x2, 4
	add	z13.s, z29.s, z4.s
	add	x0, x0, 2
	add	z1.s, z13.s, z23.s
	add	z9.s, z1.s, z19.s
	add	x3, x1, x0
	add	z9.s, z9.s, #2048
	asr	z9.s, z9.s, #12
	smax	z9.s, p7/m, z9.s, z30.s
	smin	z9.s, p7/m, z9.s, z31.s
	st1h	z9.s, p6, [x3, z25.s, sxtw 1]
	add	x3, x0, 2
	sub	z29.s, z29.s, z4.s
	add	z0.s, z29.s, z21.s
	add	x3, x1, x3
	add	z10.s, z0.s, z18.s
	add	z10.s, z10.s, #2048
	asr	z10.s, z10.s, #12
	smax	z10.s, p7/m, z10.s, z30.s
	smin	z10.s, p7/m, z10.s, z31.s
	st1h	z10.s, p6, [x3, z25.s, sxtw 1]
	add	x3, x0, 4
	sub	z26.s, z26.s, z14.s
	add	x3, x1, x3
	add	z5.s, z26.s, z8.s
	add	z11.s, z5.s, z17.s
	add	z11.s, z11.s, #2048
	asr	z11.s, z11.s, #12
	smax	z11.s, p7/m, z11.s, z30.s
	smin	z11.s, p7/m, z11.s, z31.s
	st1h	z11.s, p6, [x3, z25.s, sxtw 1]
	add	x3, x0, 6
	add	x3, x1, x3
	sub	z8.s, z26.s, z8.s
	add	z12.s, z8.s, z16.s
	add	z12.s, z12.s, #2048
	asr	z12.s, z12.s, #12
	smax	z12.s, p7/m, z12.s, z30.s
	smin	z12.s, p7/m, z12.s, z31.s
	st1h	z12.s, p6, [x3, z25.s, sxtw 1]
	add	x3, x0, 8
	add	x3, x1, x3
	sub	z29.s, z29.s, z21.s
	sub	z23.s, z13.s, z23.s
	add	z13.s, z29.s, z27.s
	add	z13.s, z13.s, #2048
	asr	z13.s, z13.s, #12
	smax	z13.s, p7/m, z13.s, z30.s
	smin	z13.s, p7/m, z13.s, z31.s
	st1h	z13.s, p6, [x3, z25.s, sxtw 1]
	add	x3, x0, 10
	add	z14.s, z23.s, z28.s
	add	x2, x1, x2, lsl 4
	add	x3, x1, x3
	add	z14.s, z14.s, #2048
	asr	z14.s, z14.s, #12
	smax	z14.s, p7/m, z14.s, z30.s
	smin	z14.s, p7/m, z14.s, z31.s
	st1h	z14.s, p6, [x3, z25.s, sxtw 1]
	add	x3, x0, 12
	sub	z22.s, z22.s, z24.s
	add	x2, x2, 16
	add	x3, x1, x3
	add	z21.s, z22.s, z15.s
	add	z21.s, z21.s, #2048
	asr	z21.s, z21.s, #12
	smax	z21.s, p7/m, z21.s, z30.s
	smin	z21.s, p7/m, z21.s, z31.s
	st1h	z21.s, p6, [x3, z25.s, sxtw 1]
	sub	z22.s, z22.s, z15.s
	add	z22.s, z22.s, #2048
	asr	z22.s, z22.s, #12
	smax	z22.s, p7/m, z22.s, z30.s
	smin	z22.s, p7/m, z22.s, z31.s
	st1h	z22.s, p6, [x2, z25.s, sxtw 1]
	add	x2, x0, 16
	sub	z23.s, z23.s, z28.s
	add	x2, x1, x2
	add	z23.s, z23.s, #2048
	asr	z23.s, z23.s, #12
	smax	z23.s, p7/m, z23.s, z30.s
	smin	z23.s, p7/m, z23.s, z31.s
	st1h	z23.s, p6, [x2, z25.s, sxtw 1]
	add	x2, x0, 18
	sub	z24.s, z29.s, z27.s
	add	z24.s, z24.s, #2048
	add	x2, x1, x2
	asr	z24.s, z24.s, #12
	smax	z24.s, p7/m, z24.s, z30.s
	smin	z24.s, p7/m, z24.s, z31.s
	st1h	z24.s, p6, [x2, z25.s, sxtw 1]
	add	x2, x0, 20
	add	x2, x1, x2
	sub	z8.s, z8.s, z16.s
	add	z8.s, z8.s, #2048
	asr	z8.s, z8.s, #12
	smax	z8.s, p7/m, z8.s, z30.s
	smin	z8.s, p7/m, z8.s, z31.s
	st1h	z8.s, p6, [x2, z25.s, sxtw 1]
	add	x2, x0, 22
	sub	z26.s, z5.s, z17.s
	add	x2, x1, x2
	add	z26.s, z26.s, #2048
	asr	z26.s, z26.s, #12
	smax	z26.s, p7/m, z26.s, z30.s
	smin	z26.s, p7/m, z26.s, z31.s
	st1h	z26.s, p6, [x2, z25.s, sxtw 1]
	add	x2, x0, 24
	sub	z27.s, z0.s, z18.s
	add	z27.s, z27.s, #2048
	add	x2, x1, x2
	asr	z27.s, z27.s, #12
	smax	z27.s, p7/m, z27.s, z30.s
	smin	z27.s, p7/m, z27.s, z31.s
	st1h	z27.s, p6, [x2, z25.s, sxtw 1]
	add	x2, x0, 26
	add	x2, x1, x2
	add	x0, x0, 28
	sub	z28.s, z1.s, z19.s
	add	z28.s, z28.s, #2048
	asr	z28.s, z28.s, #12
	smax	z28.s, p7/m, z28.s, z30.s
	smin	z28.s, p7/m, z28.s, z31.s
	st1h	z28.s, p6, [x2, z25.s, sxtw 1]
	add	x1, x1, x0
	sub	z29.s, z2.s, z20.s
	add	z29.s, z29.s, #2048
	asr	z29.s, z29.s, #12
	smax	z30.s, p7/m, z30.s, z29.s
	smin	z31.s, p7/m, z31.s, z30.s
	st1h	z31.s, p6, [x1, z25.s, sxtw 1]
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
	addvl	sp, sp, #2
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
