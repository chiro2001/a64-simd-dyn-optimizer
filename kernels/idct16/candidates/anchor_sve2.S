	.arch armv8.2-a+crc+sve2
	.file	"anchor_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_Z11idct16_halfILi12EEvPKsPsli, %function
_Z11idct16_halfILi12EEvPKsPsli:
.LFB9:
	.cfi_startproc
	addvl	sp, sp, #-3
	.cfi_escape 0xf,0x8,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x22
	ubfiz	x4, x3, 1, 32
	ptrue	p7.b, all
	sub	sp, sp, #576
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x23,0xc0,0x4,0x22
	add	x5, x0, x4
	mov	z2.s, #43
	mov	z27.s, #9
	mov	z5.s, #-80
	mov	z4.s, #57
	mov	z18.s, #90
	mov	z0.s, #25
	mov	z30.s, #80
	stp	d8, d9, [sp]
	mov	z1.s, #-70
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
	add	x6, x6, 80
	stp	d12, d13, [sp, 32]
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	mov	z13.s, #70
	mov	z12.s, #-25
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ld1sh	z31.s, p7/z, [x5]
	add	x5, sp, 64
	str	z31, [x5]
	add	x5, x4, 32
	add	x5, x0, x5
	ld1sh	z19.s, p7/z, [x5]
	movprfx	z25, z19
	mul	z25.s, p7/m, z25.s, z13.s
	add	x5, x4, 64
	movprfx	z8, z19
	mul	z8.s, p7/m, z8.s, z4.s
	movprfx	z29, z19
	mul	z29.s, z29.s, #90
	add	x5, x0, x5
	ld1sh	z6.s, p7/z, [x5]
	add	x5, x4, 96
	add	x5, x0, x5
	ld1sh	z20.s, p7/z, [x5]
	mla	z29.s, p7/m, z20.s, z10.s
	add	x5, x4, 128
	mla	z8.s, p7/m, z20.s, z5.s
	add	x5, x0, x5
	ld1sh	z15.s, p7/z, [x5]
	add	x5, x4, 160
	add	x5, x0, x5
	ld1sh	z21.s, p7/z, [x5]
	mad	z30.s, p7/m, z21.s, z29.s
	add	x5, x4, 192
	mla	z8.s, p7/m, z21.s, z12.s
	movprfx	z29, z19
	mul	z29.s, p7/m, z29.s, z10.s
	add	x5, x0, x5
	ld1sh	z7.s, p7/z, [x5]
	mla	z29.s, p7/m, z20.s, z4.s
	add	x5, x4, 224
	mla	z29.s, p7/m, z21.s, z27.s
	add	x5, x0, x5
	ld1sh	z22.s, p7/z, [x5]
	mla	z8.s, p7/m, z22.s, z18.s
	add	x5, x4, 256
	mla	z30.s, p7/m, z22.s, z13.s
	add	x5, x0, x5
	ld1sh	z31.s, p7/z, [x5]
	add	x5, x4, 288
	add	x5, x0, x5
	ld1sh	z23.s, p7/z, [x5]
	mla	z30.s, p7/m, z23.s, z4.s
	add	x5, x4, 320
	add	x5, x0, x5
	ld1sh	z16.s, p7/z, [x5]
	add	x5, x4, 352
	add	x5, x0, x5
	ld1sh	z24.s, p7/z, [x5]
	mla	z30.s, p7/m, z24.s, z2.s
	add	x5, x4, 384
	add	x5, x0, x5
	ld1sh	z3.s, p7/z, [x5]
	add	x5, x4, 416
	add	x5, x0, x5
	ld1sh	z26.s, p7/z, [x5]
	mla	z30.s, p7/m, z26.s, z0.s
	add	x5, x4, 448
	add	x4, x4, 480
	add	x5, x0, x5
	add	x0, x0, x4
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #1
	mla	z30.s, p7/m, z17.s, z27.s
	ld1sh	z14.s, p7/z, [x5]
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.s, #-43
	addvl	x0, sp, #2
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
	add	x0, x0, 64
	mla	z30.s, p7/m, z23.s, z18.s
	mla	z30.s, p7/m, z24.s, z0.s
	str	z29, [x0]
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
	add	x0, sp, 64
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
	ldr	z24, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z9, [x0]
	mov	z19.s, #-64
	addvl	x0, sp, #2
	mla	z21.s, p7/m, z14.s, z23.s
	lsl	z23.s, z24.s, #6
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z24.s, #64
	addvl	x0, sp, #3
	mad	z24.s, p7/m, z31.s, z23.s
	mad	z31.s, p7/m, z19.s, z23.s
	add	x0, x0, 64
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
	add	z15.s, z15.s, #2048
	asr	z15.s, z15.s, #12
	sqxtnb	z15.h, z15.s
	uzp1	z15.h, z15.h, z15.h
	st1h	z15.h, p7, [x0]
	addvl	x0, sp, #3
	add	z19.s, z31.s, z3.s
	add	x0, x0, 96
	add	z12.s, z19.s, z22.s
	add	z16.s, z12.s, z8.s
	add	z16.s, z16.s, #2048
	asr	z16.s, z16.s, #12
	sqxtnb	z16.h, z16.s
	uzp1	z16.h, z16.h, z16.h
	st1h	z16.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 128
	sub	z24.s, z24.s, z23.s
	sub	z31.s, z31.s, z3.s
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
	add	x0, x0, 160
	add	z18.s, z18.s, #2048
	asr	z18.s, z18.s, #12
	sqxtnb	z18.h, z18.s
	uzp1	z18.h, z18.h, z18.h
	st1h	z18.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z22.s, z19.s, z22.s
	add	z19.s, z23.s, z25.s
	add	x0, x0, 192
	add	z19.s, z19.s, #2048
	asr	z19.s, z19.s, #12
	sqxtnb	z19.h, z19.s
	uzp1	z19.h, z19.h, z19.h
	st1h	z19.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z31.s, z21.s
	add	z20.s, z31.s, z28.s
	add	x0, x0, 224
	add	z20.s, z20.s, #2048
	asr	z20.s, z20.s, #12
	sqxtnb	z20.h, z20.s
	uzp1	z20.h, z20.h, z20.h
	st1h	z20.h, p7, [x0]
	addvl	x0, sp, #3
	add	z21.s, z22.s, z27.s
	add	z21.s, z21.s, #2048
	add	x0, x0, 256
	asr	z21.s, z21.s, #12
	sqxtnb	z21.h, z21.s
	uzp1	z21.h, z21.h, z21.h
	st1h	z21.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 288
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
	add	x0, x0, 320
	asr	z24.s, z24.s, #12
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	st1h	z24.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 352
	movprfx	z25, z22
	add	z25.s, z25.s, #2048
	asr	z25.s, z25.s, #12
	sqxtnb	z25.h, z25.s
	uzp1	z25.h, z25.h, z25.h
	st1h	z25.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z26.s, z31.s, z28.s
	add	z26.s, z26.s, #2048
	add	x0, x0, 384
	asr	z26.s, z26.s, #12
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	st1h	z26.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 416
	add	z27.s, z27.s, #2048
	asr	z27.s, z27.s, #12
	sqxtnb	z27.h, z27.s
	uzp1	z27.h, z27.h, z27.h
	st1h	z27.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z28.s, z10.s, z30.s
	add	z28.s, z28.s, #2048
	add	x0, x0, 448
	asr	z28.s, z28.s, #12
	sqxtnb	z28.h, z28.s
	uzp1	z28.h, z28.h, z28.h
	st1h	z28.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 480
	sxtw	x4, w3
	sub	z29.s, z11.s, z29.s
	add	z29.s, z29.s, #2048
	asr	z29.s, z29.s, #12
	sqxtnb	z29.h, z29.s
	uzp1	z29.h, z29.h, z29.h
	st1h	z29.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 512
	mul	x4, x4, x2
	sub	z30.s, z12.s, z8.s
	add	z30.s, z30.s, #2048
	asr	z30.s, z30.s, #12
	sqxtnb	z30.h, z30.s
	uzp1	z30.h, z30.h, z30.h
	st1h	z30.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 544
	addvl	x5, sp, #3
	sub	z31.s, z13.s, z9.s
	add	z31.s, z31.s, #2048
	asr	z31.s, z31.s, #12
	sqxtnb	z31.h, z31.s
	uzp1	z31.h, z31.h, z31.h
	st1h	z31.h, p7, [x0]
	add	x0, x1, 32
	add	x5, x5, 64
	add	x4, x0, x4, lsl 1
	.p2align 5,,15
.L2:
	sub	x0, x4, #32
	mov	x1, x5
	.p2align 5,,15
.L3:
	ldrh	w3, [x1], 32
	strh	w3, [x0], 2
	cmp	x4, x0
	bne	.L3
	add	x5, x5, 2
	add	x4, x4, x2, lsl 1
	cmp	x6, x5
	bne	.L2
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
	.cfi_def_cfa_offset 576
	add	sp, sp, 576
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	_Z11idct16_halfILi12EEvPKsPsli, .-_Z11idct16_halfILi12EEvPKsPsli
	.align	2
	.p2align 5,,15
	.type	_Z11idct16_halfILi7EEvPKsPsli.constprop.0, %function
_Z11idct16_halfILi7EEvPKsPsli.constprop.0:
.LFB12:
	.cfi_startproc
	addvl	sp, sp, #-3
	.cfi_escape 0xf,0x8,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x22
	ubfiz	x3, x2, 1, 32
	ptrue	p7.b, all
	sub	sp, sp, #576
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x23,0xc0,0x4,0x22
	add	x4, x0, x3
	mov	z2.s, #43
	mov	z27.s, #9
	mov	z5.s, #-80
	mov	z4.s, #57
	mov	z18.s, #90
	mov	z0.s, #25
	mov	z30.s, #80
	stp	d8, d9, [sp]
	mov	z1.s, #-70
	mov	z28.s, #-87
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	mov	z9.s, #-57
	addvl	x5, sp, #3
	stp	d10, d11, [sp, 16]
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	mov	z10.s, #87
	mov	z11.s, #-90
	mov	x6, 128
	stp	d12, d13, [sp, 32]
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	mov	z13.s, #70
	mov	z12.s, #-25
	add	x5, x5, 64
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ld1sh	z31.s, p7/z, [x4]
	add	x4, sp, 64
	str	z31, [x4]
	add	x4, x3, 32
	add	x4, x0, x4
	ld1sh	z19.s, p7/z, [x4]
	movprfx	z25, z19
	mul	z25.s, p7/m, z25.s, z13.s
	add	x4, x3, 64
	movprfx	z8, z19
	mul	z8.s, p7/m, z8.s, z4.s
	movprfx	z29, z19
	mul	z29.s, z29.s, #90
	add	x4, x0, x4
	ld1sh	z6.s, p7/z, [x4]
	add	x4, x3, 96
	add	x4, x0, x4
	ld1sh	z20.s, p7/z, [x4]
	mla	z29.s, p7/m, z20.s, z10.s
	add	x4, x3, 128
	mla	z8.s, p7/m, z20.s, z5.s
	add	x4, x0, x4
	ld1sh	z15.s, p7/z, [x4]
	add	x4, x3, 160
	add	x4, x0, x4
	ld1sh	z21.s, p7/z, [x4]
	mad	z30.s, p7/m, z21.s, z29.s
	add	x4, x3, 192
	mla	z8.s, p7/m, z21.s, z12.s
	movprfx	z29, z19
	mul	z29.s, p7/m, z29.s, z10.s
	add	x4, x0, x4
	ld1sh	z7.s, p7/z, [x4]
	mla	z29.s, p7/m, z20.s, z4.s
	add	x4, x3, 224
	mla	z29.s, p7/m, z21.s, z27.s
	add	x4, x0, x4
	ld1sh	z22.s, p7/z, [x4]
	mla	z8.s, p7/m, z22.s, z18.s
	add	x4, x3, 256
	mla	z30.s, p7/m, z22.s, z13.s
	add	x4, x0, x4
	ld1sh	z31.s, p7/z, [x4]
	add	x4, x3, 288
	add	x4, x0, x4
	ld1sh	z23.s, p7/z, [x4]
	mla	z30.s, p7/m, z23.s, z4.s
	add	x4, x3, 320
	add	x4, x0, x4
	ld1sh	z16.s, p7/z, [x4]
	add	x4, x3, 352
	add	x4, x0, x4
	ld1sh	z24.s, p7/z, [x4]
	mla	z30.s, p7/m, z24.s, z2.s
	add	x4, x3, 384
	add	x4, x0, x4
	ld1sh	z3.s, p7/z, [x4]
	add	x4, x3, 416
	add	x4, x0, x4
	ld1sh	z26.s, p7/z, [x4]
	mla	z30.s, p7/m, z26.s, z0.s
	add	x4, x3, 448
	add	x3, x3, 480
	add	x4, x0, x4
	add	x0, x0, x3
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #1
	mla	z30.s, p7/m, z17.s, z27.s
	ld1sh	z14.s, p7/z, [x4]
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.s, #-43
	addvl	x0, sp, #2
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
	add	x0, x0, 64
	mla	z30.s, p7/m, z23.s, z18.s
	mla	z30.s, p7/m, z24.s, z0.s
	str	z29, [x0]
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
	add	x0, sp, 64
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
	ldr	z24, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z9, [x0]
	mov	z19.s, #-64
	addvl	x0, sp, #2
	mla	z21.s, p7/m, z14.s, z23.s
	lsl	z23.s, z24.s, #6
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z24.s, #64
	addvl	x0, sp, #3
	mad	z24.s, p7/m, z31.s, z23.s
	mad	z31.s, p7/m, z19.s, z23.s
	add	x0, x0, 64
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
	st1h	z15.h, p7, [x0]
	addvl	x0, sp, #3
	add	z19.s, z31.s, z3.s
	add	x0, x0, 96
	add	z12.s, z19.s, z22.s
	add	z16.s, z12.s, z8.s
	add	z16.s, z16.s, #64
	asr	z16.s, z16.s, #7
	sqxtnb	z16.h, z16.s
	uzp1	z16.h, z16.h, z16.h
	st1h	z16.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 128
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
	st1h	z17.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z24.s, z18.s, z20.s
	add	z18.s, z10.s, z30.s
	add	x0, x0, 160
	add	z18.s, z18.s, #64
	asr	z18.s, z18.s, #7
	sqxtnb	z18.h, z18.s
	uzp1	z18.h, z18.h, z18.h
	st1h	z18.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z22.s, z19.s, z22.s
	add	z19.s, z23.s, z25.s
	add	x0, x0, 192
	add	z19.s, z19.s, #64
	asr	z19.s, z19.s, #7
	sqxtnb	z19.h, z19.s
	uzp1	z19.h, z19.h, z19.h
	st1h	z19.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z31.s, z21.s
	add	z20.s, z31.s, z28.s
	add	x0, x0, 224
	add	z20.s, z20.s, #64
	asr	z20.s, z20.s, #7
	sqxtnb	z20.h, z20.s
	uzp1	z20.h, z20.h, z20.h
	st1h	z20.h, p7, [x0]
	addvl	x0, sp, #3
	add	z21.s, z22.s, z27.s
	add	z21.s, z21.s, #64
	add	x0, x0, 256
	asr	z21.s, z21.s, #7
	sqxtnb	z21.h, z21.s
	uzp1	z21.h, z21.h, z21.h
	st1h	z21.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 288
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
	add	x0, x0, 320
	asr	z24.s, z24.s, #7
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	st1h	z24.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 352
	movprfx	z25, z22
	add	z25.s, z25.s, #64
	asr	z25.s, z25.s, #7
	sqxtnb	z25.h, z25.s
	uzp1	z25.h, z25.h, z25.h
	st1h	z25.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z26.s, z31.s, z28.s
	add	z26.s, z26.s, #64
	add	x0, x0, 384
	asr	z26.s, z26.s, #7
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	st1h	z26.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 416
	add	z27.s, z27.s, #64
	asr	z27.s, z27.s, #7
	sqxtnb	z27.h, z27.s
	uzp1	z27.h, z27.h, z27.h
	st1h	z27.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z28.s, z10.s, z30.s
	add	z28.s, z28.s, #64
	add	x0, x0, 448
	asr	z28.s, z28.s, #7
	sqxtnb	z28.h, z28.s
	uzp1	z28.h, z28.h, z28.h
	st1h	z28.h, p7, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 480
	sub	z29.s, z11.s, z29.s
	add	z29.s, z29.s, #64
	asr	z29.s, z29.s, #7
	sqxtnb	z29.h, z29.s
	uzp1	z29.h, z29.h, z29.h
	st1h	z29.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z30.s, z12.s, z8.s
	add	x0, x0, 512
	add	z30.s, z30.s, #64
	asr	z30.s, z30.s, #7
	sqxtnb	z30.h, z30.s
	uzp1	z30.h, z30.h, z30.h
	st1h	z30.h, p7, [x0]
	addvl	x0, sp, #3
	sub	z31.s, z13.s, z9.s
	add	z31.s, z31.s, #64
	add	x0, x0, 544
	asr	z31.s, z31.s, #7
	sqxtnb	z31.h, z31.s
	uzp1	z31.h, z31.h, z31.h
	st1h	z31.h, p7, [x0]
	add	x0, x1, 32
	ubfiz	x4, x2, 4, 32
	mov	w1, 32
	cmp	x4, 0
	umaddl	x3, w2, w1, x0
	mov	x0, 256
	csel	x6, x6, x0, eq
	.p2align 5,,15
.L9:
	sub	x0, x3, #32
	mov	x1, x5
	.p2align 5,,15
.L10:
	ldrh	w2, [x1], 32
	strh	w2, [x0], 2
	cmp	x3, x0
	bne	.L10
	add	x4, x4, 16
	add	x5, x5, 2
	add	x3, x3, 32
	cmp	x6, x4
	bne	.L9
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
	.cfi_def_cfa_offset 576
	add	sp, sp, 576
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE12:
	.size	_Z11idct16_halfILi7EEvPKsPsli.constprop.0, .-_Z11idct16_halfILi7EEvPKsPsli.constprop.0
	.align	2
	.p2align 5,,15
	.global	dynopt_idct16_sve2_shared
	.type	dynopt_idct16_sve2_shared, %function
dynopt_idct16_sve2_shared:
.LFB5:
	.cfi_startproc
	sub	sp, sp, #528
	.cfi_def_cfa_offset 528
	mov	x7, x1
	mov	x9, x0
	mov	x8, x2
	add	x1, sp, 16
	mov	w2, 0
	stp	x29, x30, [sp]
	.cfi_offset 29, -528
	.cfi_offset 30, -520
	mov	x29, sp
	bl	_Z11idct16_halfILi7EEvPKsPsli.constprop.0
	add	x1, sp, 16
	mov	x0, x9
	mov	w2, 8
	bl	_Z11idct16_halfILi7EEvPKsPsli.constprop.0
	mov	x2, x8
	mov	x1, x7
	add	x0, sp, 16
	mov	w3, 0
	bl	_Z11idct16_halfILi12EEvPKsPsli
	add	x0, sp, 16
	mov	x1, x7
	mov	w3, 8
	bl	_Z11idct16_halfILi12EEvPKsPsli
	ldp	x29, x30, [sp]
	add	sp, sp, 528
	.cfi_restore 29
	.cfi_restore 30
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
