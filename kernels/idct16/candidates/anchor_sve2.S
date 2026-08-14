	.arch armv8.2-a+crc+sve2
	.file	"anchor_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct16_sve2_shared
	.type	dynopt_idct16_sve2_shared, %function
dynopt_idct16_sve2_shared:
.LFB5:
	.cfi_startproc
	addvl	sp, sp, #-3
	.cfi_escape 0xf,0x8,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x22
	ptrue	p7.b, all
	mov	z2.s, #43
	sub	sp, sp, #1088
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x23,0xc0,0x8,0x22
	mov	z27.s, #9
	mov	z5.s, #-80
	add	x3, sp, 64
	mov	z4.s, #57
	mov	z18.s, #90
	mov	z0.s, #25
	mov	z30.s, #80
	mov	z1.s, #-70
	stp	d8, d9, [sp]
	mov	z28.s, #-87
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	mov	z9.s, #-57
	addvl	x6, sp, #3
	stp	d10, d11, [sp, 16]
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	mov	z10.s, #87
	mov	z11.s, #-90
	addvl	x5, sp, #3
	stp	d12, d13, [sp, 32]
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	mov	z13.s, #70
	mov	z12.s, #-25
	add	x6, x6, 576
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ld1sh	z31.s, p7/z, [x0]
	add	x5, x5, 64
	str	z31, [x3]
	add	x3, x0, 32
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 64
	ld1sh	z6.s, p7/z, [x3]
	movprfx	z25, z19
	mul	z25.s, p7/m, z25.s, z13.s
	add	x3, x0, 96
	ld1sh	z20.s, p7/z, [x3]
	movprfx	z8, z19
	mul	z8.s, p7/m, z8.s, z4.s
	add	x3, x0, 128
	ld1sh	z15.s, p7/z, [x3]
	movprfx	z29, z19
	mul	z29.s, z29.s, #90
	add	x3, x0, 160
	ld1sh	z21.s, p7/z, [x3]
	mla	z29.s, p7/m, z20.s, z10.s
	add	x3, x0, 192
	ld1sh	z7.s, p7/z, [x3]
	mad	z30.s, p7/m, z21.s, z29.s
	add	x3, x0, 224
	ld1sh	z22.s, p7/z, [x3]
	mla	z8.s, p7/m, z20.s, z5.s
	add	x3, x0, 256
	ld1sh	z31.s, p7/z, [x3]
	mla	z30.s, p7/m, z22.s, z13.s
	add	x3, x0, 288
	ld1sh	z23.s, p7/z, [x3]
	mla	z8.s, p7/m, z21.s, z12.s
	add	x3, x0, 320
	ld1sh	z16.s, p7/z, [x3]
	mla	z8.s, p7/m, z22.s, z18.s
	add	x3, x0, 352
	ld1sh	z24.s, p7/z, [x3]
	mla	z30.s, p7/m, z23.s, z4.s
	add	x3, x0, 384
	ld1sh	z3.s, p7/z, [x3]
	mla	z30.s, p7/m, z24.s, z2.s
	add	x3, x0, 416
	ld1sh	z26.s, p7/z, [x3]
	mla	z30.s, p7/m, z26.s, z0.s
	add	x3, x0, 448
	ld1sh	z14.s, p7/z, [x3]
	movprfx	z29, z19
	mul	z29.s, p7/m, z29.s, z10.s
	add	x3, x0, 480
	ld1sh	z17.s, p7/z, [x3]
	mla	z30.s, p7/m, z17.s, z27.s
	addvl	x3, sp, #1
	mla	z29.s, p7/m, z20.s, z4.s
	mla	z29.s, p7/m, z21.s, z27.s
	add	x3, x3, 64
	str	z30, [x3]
	mov	z30.s, #-43
	addvl	x3, sp, #2
	mla	z29.s, p7/m, z22.s, z30.s
	mad	z30.s, p7/m, z20.s, z25.s
	mla	z29.s, p7/m, z23.s, z5.s
	mov	z25.s, #-9
	mla	z29.s, p7/m, z24.s, z11.s
	mad	z25.s, p7/m, z23.s, z8.s
	mla	z29.s, p7/m, z26.s, z1.s
	movprfx	z8, z19
	mul	z8.s, p7/m, z8.s, z2.s
	mla	z29.s, p7/m, z17.s, z12.s
	mla	z8.s, p7/m, z20.s, z11.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z25.s, p7/m, z24.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z23.s, z18.s
	mla	z30.s, p7/m, z24.s, z0.s
	str	z29, [x3]
	movprfx	z29, z19
	mul	z29.s, z29.s, #80
	mla	z29.s, p7/m, z20.s, z27.s
	mla	z29.s, p7/m, z21.s, z1.s
	mla	z29.s, p7/m, z22.s, z28.s
	mla	z29.s, p7/m, z23.s, z12.s
	mla	z29.s, p7/m, z24.s, z4.s
	mad	z4.s, p7/m, z21.s, z8.s
	mla	z29.s, p7/m, z26.s, z18.s
	movprfx	z8, z19
	mul	z8.s, z8.s, #25
	mad	z0.s, p7/m, z22.s, z4.s
	mad	z1.s, p7/m, z20.s, z8.s
	mad	z28.s, p7/m, z23.s, z0.s
	mad	z18.s, p7/m, z21.s, z1.s
	mla	z28.s, p7/m, z24.s, z13.s
	mla	z18.s, p7/m, z22.s, z5.s
	mla	z28.s, p7/m, z26.s, z27.s
	mla	z18.s, p7/m, z23.s, z2.s
	mul	z19.s, z19.s, #9
	mad	z27.s, p7/m, z24.s, z18.s
	mad	z20.s, p7/m, z12.s, z19.s
	mad	z21.s, p7/m, z2.s, z20.s
	mad	z22.s, p7/m, z9.s, z21.s
	mad	z23.s, p7/m, z13.s, z22.s
	mad	z24.s, p7/m, z5.s, z23.s
	mla	z27.s, p7/m, z26.s, z9.s
	mov	z23.s, #75
	mla	z30.s, p7/m, z26.s, z5.s
	mla	z25.s, p7/m, z26.s, z2.s
	mad	z26.s, p7/m, z10.s, z24.s
	movprfx	z24, z6
	mul	z24.s, z24.s, #89
	mla	z24.s, p7/m, z7.s, z23.s
	mov	z20.s, #50
	mad	z20.s, p7/m, z16.s, z24.s
	movprfx	z24, z6
	mul	z24.s, p7/m, z24.s, z23.s
	add	x3, sp, 64
	mov	z22.s, #-18
	mad	z22.s, p7/m, z7.s, z24.s
	mov	z24.s, #-89
	mla	z30.s, p7/m, z17.s, z9.s
	mla	z25.s, p7/m, z17.s, z13.s
	mla	z27.s, p7/m, z17.s, z10.s
	mla	z26.s, p7/m, z17.s, z11.s
	mla	z28.s, p7/m, z17.s, z5.s
	mla	z29.s, p7/m, z17.s, z2.s
	mla	z22.s, p7/m, z16.s, z24.s
	mov	z18.s, #-50
	mov	z21.s, #18
	movprfx	z19, z6
	mul	z19.s, z19.s, #50
	mla	z20.s, p7/m, z14.s, z21.s
	mla	z19.s, p7/m, z7.s, z24.s
	mul	z6.s, z6.s, #18
	mad	z21.s, p7/m, z16.s, z19.s
	mad	z7.s, p7/m, z18.s, z6.s
	mad	z16.s, p7/m, z23.s, z7.s
	movprfx	z17, z16
	mla	z17.s, p7/m, z14.s, z24.s
	ldr	z24, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z9, [x3]
	mov	z19.s, #-64
	addvl	x3, sp, #2
	mla	z21.s, p7/m, z14.s, z23.s
	lsl	z23.s, z24.s, #6
	add	x3, x3, 64
	ldr	z8, [x3]
	mov	z24.s, #64
	addvl	x3, sp, #3
	mad	z24.s, p7/m, z31.s, z23.s
	mad	z31.s, p7/m, z19.s, z23.s
	add	x3, x3, 576
	movprfx	z19, z15
	mul	z19.s, z19.s, #83
	mul	z15.s, z15.s, #36
	mla	z22.s, p7/m, z14.s, z18.s
	mov	z23.s, #36
	mad	z23.s, p7/m, z3.s, z19.s
	mov	z19.s, #-83
	add	z18.s, z24.s, z23.s
	mad	z3.s, p7/m, z19.s, z15.s
	add	z13.s, z18.s, z20.s
	add	z15.s, z13.s, z9.s
	add	z15.s, z15.s, #64
	asr	z15.s, z15.s, #7
	sqxtnb	z15.h, z15.s
	uzp1	z15.h, z15.h, z15.h
	st1h	z15.h, p7, [x3]
	addvl	x3, sp, #3
	add	z19.s, z31.s, z3.s
	add	x3, x3, 608
	add	z12.s, z19.s, z22.s
	add	z16.s, z12.s, z8.s
	add	z16.s, z16.s, #64
	asr	z16.s, z16.s, #7
	sqxtnb	z16.h, z16.s
	uzp1	z16.h, z16.h, z16.h
	st1h	z16.h, p7, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 640
	sub	z24.s, z24.s, z23.s
	sub	z31.s, z31.s, z3.s
	sub	z23.s, z24.s, z17.s
	add	z11.s, z31.s, z21.s
	add	z10.s, z24.s, z17.s
	add	z17.s, z11.s, z29.s
	add	z17.s, z17.s, #64
	asr	z17.s, z17.s, #7
	sqxtnb	z17.h, z17.s
	uzp1	z17.h, z17.h, z17.h
	st1h	z17.h, p7, [x3]
	addvl	x3, sp, #3
	sub	z24.s, z18.s, z20.s
	add	z18.s, z10.s, z30.s
	add	x3, x3, 672
	add	z18.s, z18.s, #64
	asr	z18.s, z18.s, #7
	sqxtnb	z18.h, z18.s
	uzp1	z18.h, z18.h, z18.h
	st1h	z18.h, p7, [x3]
	addvl	x3, sp, #3
	sub	z22.s, z19.s, z22.s
	add	z19.s, z23.s, z25.s
	add	x3, x3, 704
	add	z19.s, z19.s, #64
	asr	z19.s, z19.s, #7
	sqxtnb	z19.h, z19.s
	uzp1	z19.h, z19.h, z19.h
	st1h	z19.h, p7, [x3]
	addvl	x3, sp, #3
	sub	z31.s, z31.s, z21.s
	add	z20.s, z31.s, z28.s
	add	x3, x3, 736
	add	z20.s, z20.s, #64
	asr	z20.s, z20.s, #7
	sqxtnb	z20.h, z20.s
	uzp1	z20.h, z20.h, z20.h
	st1h	z20.h, p7, [x3]
	addvl	x3, sp, #3
	add	z21.s, z22.s, z27.s
	add	z21.s, z21.s, #64
	add	x3, x3, 768
	asr	z21.s, z21.s, #7
	sqxtnb	z21.h, z21.s
	uzp1	z21.h, z21.h, z21.h
	st1h	z21.h, p7, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 800
	add	z14.s, z24.s, z26.s
	sub	z22.s, z22.s, z27.s
	sub	z27.s, z23.s, z25.s
	movprfx	z23, z14
	add	z23.s, z23.s, #64
	asr	z23.s, z23.s, #7
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	st1h	z23.h, p7, [x3]
	addvl	x3, sp, #3
	sub	z24.s, z24.s, z26.s
	add	z24.s, z24.s, #64
	add	x3, x3, 832
	asr	z24.s, z24.s, #7
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	st1h	z24.h, p7, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 864
	movprfx	z25, z22
	add	z25.s, z25.s, #64
	asr	z25.s, z25.s, #7
	sqxtnb	z25.h, z25.s
	uzp1	z25.h, z25.h, z25.h
	st1h	z25.h, p7, [x3]
	addvl	x3, sp, #3
	sub	z26.s, z31.s, z28.s
	add	z26.s, z26.s, #64
	add	x3, x3, 896
	asr	z26.s, z26.s, #7
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	st1h	z26.h, p7, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 928
	add	z27.s, z27.s, #64
	asr	z27.s, z27.s, #7
	sqxtnb	z27.h, z27.s
	uzp1	z27.h, z27.h, z27.h
	st1h	z27.h, p7, [x3]
	addvl	x3, sp, #3
	sub	z28.s, z10.s, z30.s
	add	z28.s, z28.s, #64
	add	x3, x3, 960
	asr	z28.s, z28.s, #7
	sqxtnb	z28.h, z28.s
	uzp1	z28.h, z28.h, z28.h
	st1h	z28.h, p7, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 992
	sub	z29.s, z11.s, z29.s
	add	z29.s, z29.s, #64
	asr	z29.s, z29.s, #7
	sqxtnb	z29.h, z29.s
	uzp1	z29.h, z29.h, z29.h
	st1h	z29.h, p7, [x3]
	addvl	x3, sp, #3
	mov	x7, 0
	add	x3, x3, 1024
	sub	z30.s, z12.s, z8.s
	add	z30.s, z30.s, #64
	asr	z30.s, z30.s, #7
	sqxtnb	z30.h, z30.s
	uzp1	z30.h, z30.h, z30.h
	st1h	z30.h, p7, [x3]
	addvl	x3, sp, #3
	sub	z31.s, z13.s, z9.s
	add	x3, x3, 1056
	add	z31.s, z31.s, #64
	asr	z31.s, z31.s, #7
	sqxtnb	z31.h, z31.s
	uzp1	z31.h, z31.h, z31.h
	st1h	z31.h, p7, [x3]
	.p2align 5,,15
.L2:
	mov	x3, 0
	.p2align 5,,15
.L3:
	ubfiz	x4, x3, 5, 32
	ldrh	w4, [x6, x4]
	strh	w4, [x5, x3, lsl 1]
	add	x3, x3, 1
	cmp	x3, 16
	bne	.L3
	add	x7, x7, 16
	add	x6, x6, 2
	add	x5, x5, 32
	cmp	x7, 128
	bne	.L2
	add	x3, x0, 16
	ptrue	p7.b, all
	ld1sh	z31.s, p7/z, [x3]
	add	x3, sp, 64
	str	z31, [x3]
	mov	z10.s, #43
	add	x3, x0, 48
	ld1sh	z19.s, p7/z, [x3]
	mov	z27.s, #9
	add	x3, x0, 80
	ld1sh	z14.s, p7/z, [x3]
	mov	z5.s, #70
	add	x3, x0, 112
	ld1sh	z20.s, p7/z, [x3]
	mov	z12.s, #57
	add	x3, x0, 144
	ld1sh	z7.s, p7/z, [x3]
	mov	z2.s, #87
	add	x3, x0, 176
	ld1sh	z21.s, p7/z, [x3]
	mov	z8.s, #25
	add	x3, x0, 208
	ld1sh	z15.s, p7/z, [x3]
	movprfx	z29, z19
	mul	z29.s, z29.s, #90
	add	x3, x0, 240
	ld1sh	z22.s, p7/z, [x3]
	mla	z29.s, p7/m, z20.s, z2.s
	add	x3, x0, 272
	ld1sh	z31.s, p7/z, [x3]
	mov	z30.s, #80
	add	x3, x0, 304
	ld1sh	z23.s, p7/z, [x3]
	mad	z30.s, p7/m, z21.s, z29.s
	add	x3, x0, 336
	ld1sh	z16.s, p7/z, [x3]
	mla	z30.s, p7/m, z22.s, z5.s
	add	x3, x0, 368
	ld1sh	z24.s, p7/z, [x3]
	mla	z30.s, p7/m, z23.s, z12.s
	add	x3, x0, 400
	ld1sh	z11.s, p7/z, [x3]
	mla	z30.s, p7/m, z24.s, z10.s
	add	x3, x0, 432
	ld1sh	z26.s, p7/z, [x3]
	mla	z30.s, p7/m, z26.s, z8.s
	add	x3, x0, 464
	add	x0, x0, 496
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #1
	mla	z30.s, p7/m, z17.s, z27.s
	ld1sh	z6.s, p7/z, [x3]
	add	x0, x0, 64
	mov	z13.s, #-80
	mov	z4.s, #-25
	mov	z18.s, #90
	mov	z3.s, #-90
	mov	z9.s, #-70
	movprfx	z25, z19
	mul	z25.s, p7/m, z25.s, z5.s
	movprfx	z0, z19
	mul	z0.s, p7/m, z0.s, z12.s
	movprfx	z29, z19
	mul	z29.s, p7/m, z29.s, z2.s
	mla	z0.s, p7/m, z20.s, z13.s
	mla	z29.s, p7/m, z20.s, z12.s
	mla	z0.s, p7/m, z21.s, z4.s
	mla	z29.s, p7/m, z21.s, z27.s
	mla	z0.s, p7/m, z22.s, z18.s
	str	z30, [x0]
	mov	z30.s, #-43
	addvl	x0, sp, #2
	mla	z29.s, p7/m, z22.s, z30.s
	mla	z29.s, p7/m, z23.s, z13.s
	mla	z29.s, p7/m, z24.s, z3.s
	mla	z29.s, p7/m, z26.s, z9.s
	mla	z29.s, p7/m, z17.s, z4.s
	mov	z28.s, #-87
	mad	z30.s, p7/m, z20.s, z25.s
	add	x0, x0, 64
	mov	z25.s, #-9
	mad	z25.s, p7/m, z23.s, z0.s
	movprfx	z0, z19
	mul	z0.s, p7/m, z0.s, z10.s
	mla	z0.s, p7/m, z20.s, z3.s
	str	z29, [x0]
	movprfx	z29, z19
	mul	z29.s, z29.s, #80
	mla	z29.s, p7/m, z20.s, z27.s
	mla	z29.s, p7/m, z21.s, z9.s
	mla	z29.s, p7/m, z22.s, z28.s
	mla	z29.s, p7/m, z23.s, z4.s
	mla	z29.s, p7/m, z24.s, z12.s
	mad	z12.s, p7/m, z21.s, z0.s
	mla	z29.s, p7/m, z26.s, z18.s
	mla	z30.s, p7/m, z21.s, z28.s
	mov	z1.s, #-57
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z25.s, p7/m, z24.s, z28.s
	mla	z30.s, p7/m, z23.s, z18.s
	mla	z30.s, p7/m, z24.s, z8.s
	mad	z8.s, p7/m, z22.s, z12.s
	movprfx	z12, z19
	mul	z12.s, z12.s, #25
	mad	z28.s, p7/m, z23.s, z8.s
	mad	z9.s, p7/m, z20.s, z12.s
	mla	z28.s, p7/m, z24.s, z5.s
	mad	z18.s, p7/m, z21.s, z9.s
	mla	z28.s, p7/m, z26.s, z27.s
	mla	z18.s, p7/m, z22.s, z13.s
	mul	z19.s, z19.s, #9
	mla	z18.s, p7/m, z23.s, z10.s
	mad	z20.s, p7/m, z4.s, z19.s
	mad	z27.s, p7/m, z24.s, z18.s
	mad	z21.s, p7/m, z10.s, z20.s
	mad	z22.s, p7/m, z1.s, z21.s
	mad	z23.s, p7/m, z5.s, z22.s
	mad	z24.s, p7/m, z13.s, z23.s
	mla	z30.s, p7/m, z26.s, z13.s
	mov	z23.s, #75
	mla	z25.s, p7/m, z26.s, z10.s
	mla	z27.s, p7/m, z26.s, z1.s
	mad	z26.s, p7/m, z2.s, z24.s
	movprfx	z24, z14
	mul	z24.s, z24.s, #89
	mla	z24.s, p7/m, z15.s, z23.s
	mov	z20.s, #50
	mad	z20.s, p7/m, z16.s, z24.s
	movprfx	z24, z14
	mul	z24.s, p7/m, z24.s, z23.s
	add	x0, sp, 64
	mov	z22.s, #-18
	mad	z22.s, p7/m, z15.s, z24.s
	mov	z24.s, #-89
	mla	z28.s, p7/m, z17.s, z13.s
	mla	z29.s, p7/m, z17.s, z10.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z25.s, p7/m, z17.s, z5.s
	mla	z27.s, p7/m, z17.s, z2.s
	mla	z26.s, p7/m, z17.s, z3.s
	mla	z22.s, p7/m, z16.s, z24.s
	mov	z18.s, #-50
	mov	z21.s, #18
	movprfx	z19, z14
	mul	z19.s, z19.s, #50
	mla	z20.s, p7/m, z6.s, z21.s
	mla	z19.s, p7/m, z15.s, z24.s
	mul	z14.s, z14.s, #18
	mad	z21.s, p7/m, z16.s, z19.s
	mad	z15.s, p7/m, z18.s, z14.s
	mad	z16.s, p7/m, z23.s, z15.s
	movprfx	z17, z16
	mla	z17.s, p7/m, z6.s, z24.s
	ldr	z24, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z9, [x0]
	mla	z21.s, p7/m, z6.s, z23.s
	addvl	x0, sp, #2
	lsl	z23.s, z24.s, #6
	mov	z19.s, #-64
	add	x0, x0, 64
	ldr	z8, [x0]
	mla	z22.s, p7/m, z6.s, z18.s
	addvl	x0, sp, #3
	mov	z24.s, #64
	mad	z24.s, p7/m, z31.s, z23.s
	add	x0, x0, 576
	mad	z31.s, p7/m, z19.s, z23.s
	movprfx	z19, z7
	mul	z19.s, z19.s, #83
	mov	z23.s, #36
	mad	z23.s, p7/m, z11.s, z19.s
	add	z18.s, z24.s, z23.s
	add	z13.s, z18.s, z20.s
	add	z15.s, z13.s, z9.s
	add	z15.s, z15.s, #64
	asr	z15.s, z15.s, #7
	sqxtnb	z15.h, z15.s
	uzp1	z15.h, z15.h, z15.h
	st1h	z15.h, p7, [x0]
	addvl	x0, sp, #3
	mov	z19.s, #-83
	add	x0, x0, 608
	mul	z7.s, z7.s, #36
	mad	z11.s, p7/m, z19.s, z7.s
	add	z19.s, z31.s, z11.s
	add	z12.s, z19.s, z22.s
	add	z16.s, z12.s, z8.s
	add	z16.s, z16.s, #64
	asr	z16.s, z16.s, #7
	sqxtnb	z16.h, z16.s
	uzp1	z16.h, z16.h, z16.h
	st1h	z16.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 640
	sub	z24.s, z24.s, z23.s
	sub	z31.s, z31.s, z11.s
	sub	z23.s, z24.s, z17.s
	add	z11.s, z31.s, z21.s
	add	z10.s, z24.s, z17.s
	add	z17.s, z11.s, z29.s
	add	z17.s, z17.s, #64
	asr	z17.s, z17.s, #7
	sqxtnb	z17.h, z17.s
	uzp1	z17.h, z17.h, z17.h
	st1h	z17.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z24.s, z18.s, z20.s
	add	z18.s, z10.s, z30.s
	add	x0, x0, 672
	add	z18.s, z18.s, #64
	asr	z18.s, z18.s, #7
	sqxtnb	z18.h, z18.s
	uzp1	z18.h, z18.h, z18.h
	st1h	z18.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z22.s, z19.s, z22.s
	add	z19.s, z23.s, z25.s
	add	x0, x0, 704
	add	z19.s, z19.s, #64
	asr	z19.s, z19.s, #7
	sqxtnb	z19.h, z19.s
	uzp1	z19.h, z19.h, z19.h
	st1h	z19.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z31.s, z21.s
	add	z20.s, z31.s, z28.s
	add	x0, x0, 736
	add	z20.s, z20.s, #64
	asr	z20.s, z20.s, #7
	sqxtnb	z20.h, z20.s
	uzp1	z20.h, z20.h, z20.h
	st1h	z20.h, p7, [x0]
	addvl	x0, sp, #3
	add	z21.s, z22.s, z27.s
	add	z21.s, z21.s, #64
	add	x0, x0, 768
	asr	z21.s, z21.s, #7
	sqxtnb	z21.h, z21.s
	uzp1	z21.h, z21.h, z21.h
	st1h	z21.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 800
	add	z14.s, z24.s, z26.s
	sub	z22.s, z22.s, z27.s
	sub	z27.s, z23.s, z25.s
	movprfx	z23, z14
	add	z23.s, z23.s, #64
	asr	z23.s, z23.s, #7
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	st1h	z23.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z24.s, z24.s, z26.s
	add	z24.s, z24.s, #64
	add	x0, x0, 832
	asr	z24.s, z24.s, #7
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	st1h	z24.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 864
	movprfx	z25, z22
	add	z25.s, z25.s, #64
	asr	z25.s, z25.s, #7
	sqxtnb	z25.h, z25.s
	uzp1	z25.h, z25.h, z25.h
	st1h	z25.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z26.s, z31.s, z28.s
	add	z26.s, z26.s, #64
	add	x0, x0, 896
	asr	z26.s, z26.s, #7
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	st1h	z26.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 928
	add	z27.s, z27.s, #64
	asr	z27.s, z27.s, #7
	sqxtnb	z27.h, z27.s
	uzp1	z27.h, z27.h, z27.h
	st1h	z27.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z28.s, z10.s, z30.s
	add	z28.s, z28.s, #64
	add	x0, x0, 960
	asr	z28.s, z28.s, #7
	sqxtnb	z28.h, z28.s
	uzp1	z28.h, z28.h, z28.h
	st1h	z28.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 992
	addvl	x5, sp, #3
	sub	z29.s, z11.s, z29.s
	addvl	x4, sp, #3
	add	z29.s, z29.s, #64
	add	x5, x5, 576
	asr	z29.s, z29.s, #7
	add	x4, x4, 320
	sqxtnb	z29.h, z29.s
	uzp1	z29.h, z29.h, z29.h
	st1h	z29.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 1024
	sub	z30.s, z12.s, z8.s
	add	z30.s, z30.s, #64
	asr	z30.s, z30.s, #7
	sqxtnb	z30.h, z30.s
	uzp1	z30.h, z30.h, z30.h
	st1h	z30.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z13.s, z9.s
	add	x0, x0, 1056
	add	z31.s, z31.s, #64
	asr	z31.s, z31.s, #7
	sqxtnb	z31.h, z31.s
	uzp1	z31.h, z31.h, z31.h
	st1h	z31.h, p7, [x0]
	.p2align 5,,15
.L5:
	mov	x0, 0
	.p2align 5,,15
.L6:
	ubfiz	x3, x0, 5, 32
	ldrh	w3, [x5, x3]
	strh	w3, [x4, x0, lsl 1]
	add	x0, x0, 1
	cmp	x0, 16
	bne	.L6
	add	x7, x7, 16
	add	x5, x5, 2
	add	x4, x4, 32
	cmp	x7, 256
	bne	.L5
	addvl	x0, sp, #3
	ptrue	p7.b, all
	mov	z10.s, #43
	add	x0, x0, 64
	ld1sh	z31.s, p7/z, [x0]
	mov	z27.s, #9
	add	x0, sp, 64
	str	z31, [x0]
	mov	z5.s, #70
	addvl	x0, sp, #3
	mov	z12.s, #57
	mov	z2.s, #87
	add	x0, x0, 96
	ld1sh	z19.s, p7/z, [x0]
	mov	z8.s, #25
	addvl	x0, sp, #3
	movprfx	z29, z19
	mul	z29.s, z29.s, #90
	mov	z30.s, #80
	add	x0, x0, 128
	ld1sh	z14.s, p7/z, [x0]
	mov	z13.s, #-80
	addvl	x0, sp, #3
	mov	z4.s, #-25
	mov	z18.s, #90
	add	x0, x0, 160
	ld1sh	z20.s, p7/z, [x0]
	mla	z29.s, p7/m, z20.s, z2.s
	addvl	x0, sp, #3
	mov	z3.s, #-90
	mov	z9.s, #-70
	add	x0, x0, 192
	ld1sh	z7.s, p7/z, [x0]
	movprfx	z25, z19
	mul	z25.s, p7/m, z25.s, z5.s
	addvl	x0, sp, #3
	movprfx	z0, z19
	mul	z0.s, p7/m, z0.s, z12.s
	mla	z0.s, p7/m, z20.s, z13.s
	add	x0, x0, 224
	ld1sh	z21.s, p7/z, [x0]
	mad	z30.s, p7/m, z21.s, z29.s
	addvl	x0, sp, #3
	movprfx	z29, z19
	mul	z29.s, p7/m, z29.s, z2.s
	mla	z0.s, p7/m, z21.s, z4.s
	add	x0, x0, 256
	ld1sh	z15.s, p7/z, [x0]
	mla	z29.s, p7/m, z20.s, z12.s
	addvl	x0, sp, #3
	mla	z29.s, p7/m, z21.s, z27.s
	mov	z28.s, #-87
	add	x0, x0, 288
	ld1sh	z22.s, p7/z, [x0]
	mla	z30.s, p7/m, z22.s, z5.s
	addvl	x0, sp, #3
	mla	z0.s, p7/m, z22.s, z18.s
	mov	z1.s, #-57
	add	x0, x0, 320
	ld1sh	z31.s, p7/z, [x0]
	addvl	x6, sp, #3
	addvl	x0, sp, #3
	addvl	x7, sp, #3
	add	x0, x0, 352
	ld1sh	z23.s, p7/z, [x0]
	mla	z30.s, p7/m, z23.s, z12.s
	addvl	x0, sp, #3
	add	x6, x6, 576
	add	x0, x0, 384
	ld1sh	z16.s, p7/z, [x0]
	add	x5, x1, 32
	addvl	x0, sp, #3
	add	x7, x7, 592
	add	x0, x0, 416
	ld1sh	z24.s, p7/z, [x0]
	mla	z30.s, p7/m, z24.s, z10.s
	addvl	x0, sp, #3
	add	x0, x0, 448
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 480
	ld1sh	z26.s, p7/z, [x0]
	mla	z30.s, p7/m, z26.s, z8.s
	addvl	x0, sp, #3
	add	x0, x0, 512
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 544
	ld1sh	z17.s, p7/z, [x0]
	mla	z30.s, p7/m, z17.s, z27.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.s, #-43
	addvl	x0, sp, #2
	mla	z29.s, p7/m, z22.s, z30.s
	mla	z29.s, p7/m, z23.s, z13.s
	mla	z29.s, p7/m, z24.s, z3.s
	mla	z29.s, p7/m, z26.s, z9.s
	mla	z29.s, p7/m, z17.s, z4.s
	mad	z30.s, p7/m, z20.s, z25.s
	add	x0, x0, 64
	mov	z25.s, #-9
	mad	z25.s, p7/m, z23.s, z0.s
	movprfx	z0, z19
	mul	z0.s, p7/m, z0.s, z10.s
	mla	z0.s, p7/m, z20.s, z3.s
	str	z29, [x0]
	movprfx	z29, z19
	mul	z29.s, z29.s, #80
	mla	z29.s, p7/m, z20.s, z27.s
	mla	z29.s, p7/m, z21.s, z9.s
	mla	z29.s, p7/m, z22.s, z28.s
	mla	z29.s, p7/m, z23.s, z4.s
	mla	z29.s, p7/m, z24.s, z12.s
	mad	z12.s, p7/m, z21.s, z0.s
	mla	z29.s, p7/m, z26.s, z18.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z25.s, p7/m, z24.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z18.s
	mla	z30.s, p7/m, z24.s, z8.s
	mad	z8.s, p7/m, z22.s, z12.s
	movprfx	z12, z19
	mul	z12.s, z12.s, #25
	mad	z28.s, p7/m, z23.s, z8.s
	mad	z9.s, p7/m, z20.s, z12.s
	mla	z28.s, p7/m, z24.s, z5.s
	mad	z18.s, p7/m, z21.s, z9.s
	mla	z28.s, p7/m, z26.s, z27.s
	mla	z18.s, p7/m, z22.s, z13.s
	mul	z19.s, z19.s, #9
	mla	z18.s, p7/m, z23.s, z10.s
	mad	z20.s, p7/m, z4.s, z19.s
	mad	z27.s, p7/m, z24.s, z18.s
	mad	z21.s, p7/m, z10.s, z20.s
	mad	z22.s, p7/m, z1.s, z21.s
	mad	z23.s, p7/m, z5.s, z22.s
	mad	z24.s, p7/m, z13.s, z23.s
	mla	z30.s, p7/m, z26.s, z13.s
	mov	z23.s, #75
	mla	z25.s, p7/m, z26.s, z10.s
	mla	z27.s, p7/m, z26.s, z1.s
	mad	z26.s, p7/m, z2.s, z24.s
	movprfx	z24, z14
	mul	z24.s, z24.s, #89
	mla	z24.s, p7/m, z15.s, z23.s
	mov	z20.s, #50
	mad	z20.s, p7/m, z16.s, z24.s
	movprfx	z24, z14
	mul	z24.s, p7/m, z24.s, z23.s
	add	x0, sp, 64
	mov	z22.s, #-18
	mad	z22.s, p7/m, z15.s, z24.s
	mov	z24.s, #-89
	mla	z28.s, p7/m, z17.s, z13.s
	mla	z29.s, p7/m, z17.s, z10.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z25.s, p7/m, z17.s, z5.s
	mla	z27.s, p7/m, z17.s, z2.s
	mla	z26.s, p7/m, z17.s, z3.s
	mla	z22.s, p7/m, z16.s, z24.s
	mov	z18.s, #-50
	mov	z21.s, #18
	movprfx	z19, z14
	mul	z19.s, z19.s, #50
	mla	z20.s, p7/m, z6.s, z21.s
	mla	z19.s, p7/m, z15.s, z24.s
	mul	z14.s, z14.s, #18
	mad	z21.s, p7/m, z16.s, z19.s
	mad	z15.s, p7/m, z18.s, z14.s
	mad	z16.s, p7/m, z23.s, z15.s
	movprfx	z17, z16
	mla	z17.s, p7/m, z6.s, z24.s
	ldr	z24, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z9, [x0]
	mla	z21.s, p7/m, z6.s, z23.s
	addvl	x0, sp, #2
	lsl	z23.s, z24.s, #6
	mov	z19.s, #-64
	add	x0, x0, 64
	ldr	z8, [x0]
	mla	z22.s, p7/m, z6.s, z18.s
	addvl	x0, sp, #3
	mov	z24.s, #64
	mad	z24.s, p7/m, z31.s, z23.s
	add	x0, x0, 576
	mad	z31.s, p7/m, z19.s, z23.s
	movprfx	z19, z7
	mul	z19.s, z19.s, #83
	mov	z23.s, #36
	mad	z23.s, p7/m, z11.s, z19.s
	add	z18.s, z24.s, z23.s
	add	z13.s, z18.s, z20.s
	add	z15.s, z13.s, z9.s
	add	z15.s, z15.s, #2048
	asr	z15.s, z15.s, #12
	sqxtnb	z15.h, z15.s
	uzp1	z15.h, z15.h, z15.h
	st1h	z15.h, p7, [x0]
	addvl	x0, sp, #3
	mov	z19.s, #-83
	add	x0, x0, 608
	mul	z7.s, z7.s, #36
	mad	z11.s, p7/m, z19.s, z7.s
	add	z19.s, z31.s, z11.s
	add	z12.s, z19.s, z22.s
	add	z16.s, z12.s, z8.s
	add	z16.s, z16.s, #2048
	asr	z16.s, z16.s, #12
	sqxtnb	z16.h, z16.s
	uzp1	z16.h, z16.h, z16.h
	st1h	z16.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 640
	sub	z24.s, z24.s, z23.s
	sub	z31.s, z31.s, z11.s
	sub	z23.s, z24.s, z17.s
	add	z11.s, z31.s, z21.s
	add	z10.s, z24.s, z17.s
	add	z17.s, z11.s, z29.s
	add	z17.s, z17.s, #2048
	asr	z17.s, z17.s, #12
	sqxtnb	z17.h, z17.s
	uzp1	z17.h, z17.h, z17.h
	st1h	z17.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z24.s, z18.s, z20.s
	add	z18.s, z10.s, z30.s
	add	x0, x0, 672
	add	z18.s, z18.s, #2048
	asr	z18.s, z18.s, #12
	sqxtnb	z18.h, z18.s
	uzp1	z18.h, z18.h, z18.h
	st1h	z18.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z22.s, z19.s, z22.s
	add	z19.s, z23.s, z25.s
	add	x0, x0, 704
	add	z19.s, z19.s, #2048
	asr	z19.s, z19.s, #12
	sqxtnb	z19.h, z19.s
	uzp1	z19.h, z19.h, z19.h
	st1h	z19.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z31.s, z21.s
	add	z20.s, z31.s, z28.s
	add	x0, x0, 736
	add	z20.s, z20.s, #2048
	asr	z20.s, z20.s, #12
	sqxtnb	z20.h, z20.s
	uzp1	z20.h, z20.h, z20.h
	st1h	z20.h, p7, [x0]
	addvl	x0, sp, #3
	add	z21.s, z22.s, z27.s
	add	z21.s, z21.s, #2048
	add	x0, x0, 768
	asr	z21.s, z21.s, #12
	sqxtnb	z21.h, z21.s
	uzp1	z21.h, z21.h, z21.h
	st1h	z21.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 800
	add	z14.s, z24.s, z26.s
	sub	z22.s, z22.s, z27.s
	sub	z27.s, z23.s, z25.s
	movprfx	z23, z14
	add	z23.s, z23.s, #2048
	asr	z23.s, z23.s, #12
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	st1h	z23.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z24.s, z24.s, z26.s
	add	z24.s, z24.s, #2048
	add	x0, x0, 832
	asr	z24.s, z24.s, #12
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	st1h	z24.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 864
	movprfx	z25, z22
	add	z25.s, z25.s, #2048
	asr	z25.s, z25.s, #12
	sqxtnb	z25.h, z25.s
	uzp1	z25.h, z25.h, z25.h
	st1h	z25.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z26.s, z31.s, z28.s
	add	z26.s, z26.s, #2048
	add	x0, x0, 896
	asr	z26.s, z26.s, #12
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	st1h	z26.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 928
	add	z27.s, z27.s, #2048
	asr	z27.s, z27.s, #12
	sqxtnb	z27.h, z27.s
	uzp1	z27.h, z27.h, z27.h
	st1h	z27.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z28.s, z10.s, z30.s
	add	z28.s, z28.s, #2048
	add	x0, x0, 960
	asr	z28.s, z28.s, #12
	sqxtnb	z28.h, z28.s
	uzp1	z28.h, z28.h, z28.h
	st1h	z28.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 992
	sub	z29.s, z11.s, z29.s
	add	z29.s, z29.s, #2048
	asr	z29.s, z29.s, #12
	sqxtnb	z29.h, z29.s
	uzp1	z29.h, z29.h, z29.h
	st1h	z29.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z30.s, z12.s, z8.s
	add	x0, x0, 1024
	add	z30.s, z30.s, #2048
	asr	z30.s, z30.s, #12
	sqxtnb	z30.h, z30.s
	uzp1	z30.h, z30.h, z30.h
	st1h	z30.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z13.s, z9.s
	add	z31.s, z31.s, #2048
	add	x0, x0, 1056
	asr	z31.s, z31.s, #12
	sqxtnb	z31.h, z31.s
	uzp1	z31.h, z31.h, z31.h
	st1h	z31.h, p7, [x0]
	.p2align 5,,15
.L8:
	sub	x0, x5, #32
	mov	x3, x6
	.p2align 5,,15
.L9:
	ldrh	w4, [x3], 32
	strh	w4, [x0], 2
	cmp	x0, x5
	bne	.L9
	add	x6, x6, 2
	add	x5, x0, x2, lsl 1
	cmp	x6, x7
	bne	.L8
	addvl	x0, sp, #3
	ptrue	p7.b, all
	mov	z10.s, #43
	add	x0, x0, 80
	ld1sh	z31.s, p7/z, [x0]
	mov	z27.s, #9
	add	x0, sp, 64
	str	z31, [x0]
	mov	z5.s, #70
	addvl	x0, sp, #3
	mov	z12.s, #57
	mov	z2.s, #87
	add	x0, x0, 112
	ld1sh	z19.s, p7/z, [x0]
	mov	z8.s, #25
	addvl	x0, sp, #3
	movprfx	z29, z19
	mul	z29.s, z29.s, #90
	mov	z30.s, #80
	add	x0, x0, 144
	ld1sh	z14.s, p7/z, [x0]
	mov	z13.s, #-80
	addvl	x0, sp, #3
	mov	z4.s, #-25
	mov	z18.s, #90
	add	x0, x0, 176
	ld1sh	z20.s, p7/z, [x0]
	mla	z29.s, p7/m, z20.s, z2.s
	addvl	x0, sp, #3
	mov	z3.s, #-90
	mov	z9.s, #-70
	add	x0, x0, 208
	ld1sh	z7.s, p7/z, [x0]
	movprfx	z25, z19
	mul	z25.s, p7/m, z25.s, z5.s
	addvl	x0, sp, #3
	movprfx	z0, z19
	mul	z0.s, p7/m, z0.s, z12.s
	mla	z0.s, p7/m, z20.s, z13.s
	add	x0, x0, 240
	ld1sh	z21.s, p7/z, [x0]
	mad	z30.s, p7/m, z21.s, z29.s
	addvl	x0, sp, #3
	movprfx	z29, z19
	mul	z29.s, p7/m, z29.s, z2.s
	mla	z0.s, p7/m, z21.s, z4.s
	add	x0, x0, 272
	ld1sh	z15.s, p7/z, [x0]
	mla	z29.s, p7/m, z20.s, z12.s
	addvl	x0, sp, #3
	mla	z29.s, p7/m, z21.s, z27.s
	mov	z28.s, #-87
	add	x0, x0, 304
	ld1sh	z22.s, p7/z, [x0]
	mla	z30.s, p7/m, z22.s, z5.s
	addvl	x0, sp, #3
	mla	z0.s, p7/m, z22.s, z18.s
	mov	z1.s, #-57
	add	x0, x0, 336
	ld1sh	z31.s, p7/z, [x0]
	addvl	x5, sp, #3
	addvl	x0, sp, #3
	add	x1, x1, x2, lsl 4
	add	x0, x0, 368
	ld1sh	z23.s, p7/z, [x0]
	mla	z30.s, p7/m, z23.s, z12.s
	addvl	x0, sp, #3
	add	x5, x5, 576
	add	x0, x0, 400
	ld1sh	z16.s, p7/z, [x0]
	add	x4, x1, 32
	addvl	x0, sp, #3
	add	x0, x0, 432
	ld1sh	z24.s, p7/z, [x0]
	mla	z30.s, p7/m, z24.s, z10.s
	addvl	x0, sp, #3
	add	x0, x0, 464
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 496
	ld1sh	z26.s, p7/z, [x0]
	mla	z30.s, p7/m, z26.s, z8.s
	addvl	x0, sp, #3
	add	x0, x0, 528
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 560
	ld1sh	z17.s, p7/z, [x0]
	mla	z30.s, p7/m, z17.s, z27.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.s, #-43
	addvl	x0, sp, #2
	mla	z29.s, p7/m, z22.s, z30.s
	mla	z29.s, p7/m, z23.s, z13.s
	mla	z29.s, p7/m, z24.s, z3.s
	mla	z29.s, p7/m, z26.s, z9.s
	mla	z29.s, p7/m, z17.s, z4.s
	mad	z30.s, p7/m, z20.s, z25.s
	add	x0, x0, 64
	mov	z25.s, #-9
	mad	z25.s, p7/m, z23.s, z0.s
	movprfx	z0, z19
	mul	z0.s, p7/m, z0.s, z10.s
	mla	z0.s, p7/m, z20.s, z3.s
	str	z29, [x0]
	movprfx	z29, z19
	mul	z29.s, z29.s, #80
	mla	z29.s, p7/m, z20.s, z27.s
	mla	z29.s, p7/m, z21.s, z9.s
	mla	z29.s, p7/m, z22.s, z28.s
	mla	z29.s, p7/m, z23.s, z4.s
	mla	z29.s, p7/m, z24.s, z12.s
	mad	z12.s, p7/m, z21.s, z0.s
	mla	z29.s, p7/m, z26.s, z18.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z25.s, p7/m, z24.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z18.s
	mla	z30.s, p7/m, z24.s, z8.s
	mad	z8.s, p7/m, z22.s, z12.s
	movprfx	z12, z19
	mul	z12.s, z12.s, #25
	mad	z28.s, p7/m, z23.s, z8.s
	mad	z9.s, p7/m, z20.s, z12.s
	mla	z28.s, p7/m, z24.s, z5.s
	mad	z18.s, p7/m, z21.s, z9.s
	mla	z28.s, p7/m, z26.s, z27.s
	mla	z18.s, p7/m, z22.s, z13.s
	mul	z19.s, z19.s, #9
	mla	z18.s, p7/m, z23.s, z10.s
	mad	z20.s, p7/m, z4.s, z19.s
	mad	z27.s, p7/m, z24.s, z18.s
	mad	z21.s, p7/m, z10.s, z20.s
	mad	z22.s, p7/m, z1.s, z21.s
	mad	z23.s, p7/m, z5.s, z22.s
	mad	z24.s, p7/m, z13.s, z23.s
	mla	z30.s, p7/m, z26.s, z13.s
	mov	z23.s, #75
	mla	z25.s, p7/m, z26.s, z10.s
	mla	z27.s, p7/m, z26.s, z1.s
	mad	z26.s, p7/m, z2.s, z24.s
	movprfx	z24, z14
	mul	z24.s, z24.s, #89
	mla	z24.s, p7/m, z15.s, z23.s
	mov	z20.s, #50
	mad	z20.s, p7/m, z16.s, z24.s
	movprfx	z24, z14
	mul	z24.s, p7/m, z24.s, z23.s
	add	x0, sp, 64
	mov	z22.s, #-18
	mad	z22.s, p7/m, z15.s, z24.s
	mov	z24.s, #-89
	mla	z28.s, p7/m, z17.s, z13.s
	mla	z29.s, p7/m, z17.s, z10.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z25.s, p7/m, z17.s, z5.s
	mla	z27.s, p7/m, z17.s, z2.s
	mla	z26.s, p7/m, z17.s, z3.s
	mla	z22.s, p7/m, z16.s, z24.s
	mov	z18.s, #-50
	mov	z21.s, #18
	movprfx	z19, z14
	mul	z19.s, z19.s, #50
	mla	z20.s, p7/m, z6.s, z21.s
	mla	z19.s, p7/m, z15.s, z24.s
	mul	z14.s, z14.s, #18
	mad	z21.s, p7/m, z16.s, z19.s
	mad	z15.s, p7/m, z18.s, z14.s
	mad	z16.s, p7/m, z23.s, z15.s
	movprfx	z17, z16
	mla	z17.s, p7/m, z6.s, z24.s
	ldr	z24, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z9, [x0]
	mla	z21.s, p7/m, z6.s, z23.s
	addvl	x0, sp, #2
	lsl	z23.s, z24.s, #6
	mov	z19.s, #-64
	add	x0, x0, 64
	ldr	z8, [x0]
	mla	z22.s, p7/m, z6.s, z18.s
	addvl	x0, sp, #3
	mov	z24.s, #64
	mad	z24.s, p7/m, z31.s, z23.s
	add	x0, x0, 576
	mad	z31.s, p7/m, z19.s, z23.s
	movprfx	z19, z7
	mul	z19.s, z19.s, #83
	mov	z23.s, #36
	mad	z23.s, p7/m, z11.s, z19.s
	add	z18.s, z24.s, z23.s
	add	z13.s, z18.s, z20.s
	add	z15.s, z13.s, z9.s
	add	z15.s, z15.s, #2048
	asr	z15.s, z15.s, #12
	sqxtnb	z15.h, z15.s
	uzp1	z15.h, z15.h, z15.h
	st1h	z15.h, p7, [x0]
	addvl	x0, sp, #3
	mov	z19.s, #-83
	add	x0, x0, 608
	mul	z7.s, z7.s, #36
	mad	z11.s, p7/m, z19.s, z7.s
	add	z19.s, z31.s, z11.s
	add	z12.s, z19.s, z22.s
	add	z16.s, z12.s, z8.s
	add	z16.s, z16.s, #2048
	asr	z16.s, z16.s, #12
	sqxtnb	z16.h, z16.s
	uzp1	z16.h, z16.h, z16.h
	st1h	z16.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 640
	sub	z24.s, z24.s, z23.s
	sub	z31.s, z31.s, z11.s
	sub	z23.s, z24.s, z17.s
	add	z11.s, z31.s, z21.s
	add	z10.s, z24.s, z17.s
	add	z17.s, z11.s, z29.s
	add	z17.s, z17.s, #2048
	asr	z17.s, z17.s, #12
	sqxtnb	z17.h, z17.s
	uzp1	z17.h, z17.h, z17.h
	st1h	z17.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z24.s, z18.s, z20.s
	add	z18.s, z10.s, z30.s
	add	x0, x0, 672
	add	z18.s, z18.s, #2048
	asr	z18.s, z18.s, #12
	sqxtnb	z18.h, z18.s
	uzp1	z18.h, z18.h, z18.h
	st1h	z18.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z22.s, z19.s, z22.s
	add	z19.s, z23.s, z25.s
	add	x0, x0, 704
	add	z19.s, z19.s, #2048
	asr	z19.s, z19.s, #12
	sqxtnb	z19.h, z19.s
	uzp1	z19.h, z19.h, z19.h
	st1h	z19.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z31.s, z21.s
	add	z20.s, z31.s, z28.s
	add	x0, x0, 736
	add	z20.s, z20.s, #2048
	asr	z20.s, z20.s, #12
	sqxtnb	z20.h, z20.s
	uzp1	z20.h, z20.h, z20.h
	st1h	z20.h, p7, [x0]
	addvl	x0, sp, #3
	add	z21.s, z22.s, z27.s
	add	z21.s, z21.s, #2048
	add	x0, x0, 768
	asr	z21.s, z21.s, #12
	sqxtnb	z21.h, z21.s
	uzp1	z21.h, z21.h, z21.h
	st1h	z21.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 800
	add	z14.s, z24.s, z26.s
	sub	z22.s, z22.s, z27.s
	sub	z27.s, z23.s, z25.s
	movprfx	z23, z14
	add	z23.s, z23.s, #2048
	asr	z23.s, z23.s, #12
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	st1h	z23.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z24.s, z24.s, z26.s
	add	z24.s, z24.s, #2048
	add	x0, x0, 832
	asr	z24.s, z24.s, #12
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	st1h	z24.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 864
	movprfx	z25, z22
	add	z25.s, z25.s, #2048
	asr	z25.s, z25.s, #12
	sqxtnb	z25.h, z25.s
	uzp1	z25.h, z25.h, z25.h
	st1h	z25.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z26.s, z31.s, z28.s
	add	z26.s, z26.s, #2048
	add	x0, x0, 896
	asr	z26.s, z26.s, #12
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	st1h	z26.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 928
	add	z27.s, z27.s, #2048
	asr	z27.s, z27.s, #12
	sqxtnb	z27.h, z27.s
	uzp1	z27.h, z27.h, z27.h
	st1h	z27.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z28.s, z10.s, z30.s
	add	z28.s, z28.s, #2048
	add	x0, x0, 960
	asr	z28.s, z28.s, #12
	sqxtnb	z28.h, z28.s
	uzp1	z28.h, z28.h, z28.h
	st1h	z28.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 992
	sub	z29.s, z11.s, z29.s
	add	z29.s, z29.s, #2048
	asr	z29.s, z29.s, #12
	sqxtnb	z29.h, z29.s
	uzp1	z29.h, z29.h, z29.h
	st1h	z29.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z30.s, z12.s, z8.s
	add	x0, x0, 1024
	add	z30.s, z30.s, #2048
	asr	z30.s, z30.s, #12
	sqxtnb	z30.h, z30.s
	uzp1	z30.h, z30.h, z30.h
	st1h	z30.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z13.s, z9.s
	add	z31.s, z31.s, #2048
	add	x0, x0, 1056
	asr	z31.s, z31.s, #12
	sqxtnb	z31.h, z31.s
	uzp1	z31.h, z31.h, z31.h
	st1h	z31.h, p7, [x0]
	.p2align 5,,15
.L11:
	sub	x0, x4, #32
	mov	x1, x5
	.p2align 5,,15
.L12:
	ldrh	w3, [x1], 32
	strh	w3, [x0], 2
	cmp	x4, x0
	bne	.L12
	add	x5, x5, 2
	add	x4, x4, x2, lsl 1
	cmp	x7, x5
	bne	.L11
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
	addvl	sp, sp, #3
	.cfi_def_cfa_offset 1088
	add	sp, sp, 1088
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	dynopt_idct16_sve2_shared, .-dynopt_idct16_sve2_shared
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
