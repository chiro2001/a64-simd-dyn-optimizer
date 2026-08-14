	.arch armv8.2-a+crc+sve2
	.file	"store-zip16.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct16_sve2_shared
	.type	dynopt_idct16_sve2_shared, %function
dynopt_idct16_sve2_shared:
.LFB3:
	.cfi_startproc
	addvl	sp, sp, #-17
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x88,0x1e,0x22
	ptrue	p7.b, all
	mov	z28.s, #57
	sub	sp, sp, #576
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x88,0x1e,0x23,0xc0,0x4,0x22
	mov	z18.s, #-43
	mov	z17.s, #-90
	add	x3, sp, 64
	mov	z20.s, #-70
	mov	z19.s, #-57
	mov	z16.s, #-9
	mov	z27.s, #43
	mov	z29.s, #-80
	stp	d8, d9, [sp]
	mov	z25.s, #70
	mov	z24.s, #-25
	mov	z30.s, #-87
	mov	z26.s, #25
	mov	z0.s, #87
	stp	d10, d11, [sp, 16]
	ptrue	p6.h, vl8
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
	ld1sh	z31.s, p7/z, [x0]
	str	z31, [x3]
	add	x3, x0, 32
	ld1sh	z7.s, p7/z, [x3]
	add	x3, x0, 64
	ld1sh	z5.s, p7/z, [x3]
	mov	z31.s, #80
	add	x3, x0, 96
	ld1sh	z10.s, p7/z, [x3]
	movprfx	z22, z7
	mul	z22.s, p7/m, z22.s, z0.s
	add	x3, x0, 128
	ld1sh	z8.s, p7/z, [x3]
	mla	z22.s, p7/m, z10.s, z28.s
	add	x3, x0, 160
	ld1sh	z11.s, p7/z, [x3]
	movprfx	z23, z7
	mul	z23.s, z23.s, #90
	add	x3, x0, 192
	ld1sh	z6.s, p7/z, [x3]
	mla	z23.s, p7/m, z10.s, z0.s
	add	x3, x0, 224
	ld1sh	z12.s, p7/z, [x3]
	mla	z23.s, p7/m, z11.s, z31.s
	add	x3, x0, 256
	ld1sh	z2.s, p7/z, [x3]
	mov	z31.s, #9
	add	x3, x0, 288
	ld1sh	z13.s, p7/z, [x3]
	mla	z23.s, p7/m, z12.s, z25.s
	add	x3, x0, 320
	ld1sh	z9.s, p7/z, [x3]
	mla	z23.s, p7/m, z13.s, z28.s
	add	x3, x0, 352
	ld1sh	z14.s, p7/z, [x3]
	mla	z22.s, p7/m, z11.s, z31.s
	add	x3, x0, 384
	ld1sh	z3.s, p7/z, [x3]
	mla	z22.s, p7/m, z12.s, z18.s
	add	x3, x0, 416
	ld1sh	z15.s, p7/z, [x3]
	mla	z22.s, p7/m, z13.s, z29.s
	add	x3, x0, 448
	mla	z22.s, p7/m, z14.s, z17.s
	ld1sh	z4.s, p7/z, [x3]
	mla	z22.s, p7/m, z15.s, z20.s
	add	x3, x0, 480
	movprfx	z21, z7
	mul	z21.s, z21.s, #80
	ld1sh	z1.s, p7/z, [x3]
	mla	z21.s, p7/m, z10.s, z31.s
	mla	z21.s, p7/m, z11.s, z20.s
	movprfx	z20, z7
	mul	z20.s, p7/m, z20.s, z25.s
	mla	z21.s, p7/m, z12.s, z30.s
	mla	z20.s, p7/m, z10.s, z18.s
	mla	z21.s, p7/m, z13.s, z24.s
	mla	z20.s, p7/m, z11.s, z30.s
	mla	z21.s, p7/m, z14.s, z28.s
	mla	z20.s, p7/m, z12.s, z31.s
	mov	z28.s, #90
	movprfx	z18, z7
	mul	z18.s, p7/m, z18.s, z27.s
	mla	z20.s, p7/m, z13.s, z28.s
	mla	z18.s, p7/m, z10.s, z17.s
	mla	z20.s, p7/m, z14.s, z26.s
	mov	z17.s, #57
	mla	z20.s, p7/m, z15.s, z29.s
	mla	z20.s, p7/m, z1.s, z19.s
	movprfx	z19, z7
	mul	z19.s, z19.s, #57
	mla	z19.s, p7/m, z10.s, z29.s
	mla	z19.s, p7/m, z11.s, z24.s
	mla	z19.s, p7/m, z12.s, z28.s
	mla	z19.s, p7/m, z13.s, z16.s
	mov	z16.s, #-70
	mla	z23.s, p7/m, z14.s, z27.s
	mla	z19.s, p7/m, z14.s, z30.s
	mla	z18.s, p7/m, z11.s, z17.s
	movprfx	z17, z7
	mul	z17.s, p7/m, z17.s, z26.s
	mla	z18.s, p7/m, z12.s, z26.s
	mla	z17.s, p7/m, z10.s, z16.s
	mla	z18.s, p7/m, z13.s, z30.s
	mla	z17.s, p7/m, z11.s, z28.s
	mla	z18.s, p7/m, z14.s, z25.s
	mla	z17.s, p7/m, z12.s, z29.s
	mul	z7.s, p7/m, z7.s, z31.s
	mla	z17.s, p7/m, z13.s, z27.s
	mad	z10.s, p7/m, z24.s, z7.s
	mla	z17.s, p7/m, z14.s, z31.s
	mad	z11.s, p7/m, z27.s, z10.s
	mov	z16.s, #-57
	mad	z12.s, p7/m, z16.s, z11.s
	mad	z13.s, p7/m, z25.s, z12.s
	mad	z14.s, p7/m, z29.s, z13.s
	mla	z23.s, p7/m, z15.s, z26.s
	mla	z21.s, p7/m, z15.s, z28.s
	mla	z19.s, p7/m, z15.s, z27.s
	mla	z18.s, p7/m, z15.s, z31.s
	mla	z17.s, p7/m, z15.s, z16.s
	mov	z13.s, #50
	mad	z15.s, p7/m, z0.s, z14.s
	mov	z12.s, #-18
	mov	z14.s, #-90
	mov	z7.s, #-89
	mla	z23.s, p7/m, z1.s, z31.s
	mla	z18.s, p7/m, z1.s, z29.s
	mla	z22.s, p7/m, z1.s, z24.s
	mla	z21.s, p7/m, z1.s, z27.s
	mla	z19.s, p7/m, z1.s, z25.s
	mla	z17.s, p7/m, z1.s, z0.s
	mla	z15.s, p7/m, z1.s, z14.s
	mov	z11.s, #75
	mov	z10.s, #18
	mov	z1.s, #-50
	movprfx	z14, z5
	mul	z14.s, z14.s, #89
	mla	z14.s, p7/m, z6.s, z11.s
	mla	z14.s, p7/m, z9.s, z13.s
	movprfx	z13, z5
	mul	z13.s, p7/m, z13.s, z11.s
	mla	z13.s, p7/m, z6.s, z12.s
	movprfx	z12, z5
	mul	z12.s, z12.s, #50
	mul	z5.s, p7/m, z5.s, z10.s
	mla	z12.s, p7/m, z6.s, z7.s
	mad	z6.s, p7/m, z1.s, z5.s
	add	x3, sp, 64
	ldr	z16, [x3]
	mla	z12.s, p7/m, z9.s, z10.s
	mla	z13.s, p7/m, z9.s, z7.s
	lsl	z16.s, z16.s, #6
	mad	z9.s, p7/m, z11.s, z6.s
	mov	z5.s, #-64
	mla	z9.s, p7/m, z4.s, z7.s
	mov	z6.s, #64
	mad	z6.s, p7/m, z2.s, z16.s
	mla	z16.s, p7/m, z2.s, z5.s
	mov	z2.s, #36
	mla	z14.s, p7/m, z4.s, z10.s
	mla	z12.s, p7/m, z4.s, z11.s
	movprfx	z5, z8
	mul	z5.s, z5.s, #83
	mul	z8.s, p7/m, z8.s, z2.s
	mla	z5.s, p7/m, z3.s, z2.s
	mov	z2.s, #-83
	add	z10.s, z6.s, z5.s
	mla	z8.s, p7/m, z3.s, z2.s
	add	z11.s, z16.s, z8.s
	sub	z8.s, z16.s, z8.s
	sub	z16.s, z6.s, z5.s
	add	z6.s, z10.s, z14.s
	add	z3.s, z16.s, z9.s
	sub	z16.s, z16.s, z9.s
	add	z9.s, z6.s, z23.s
	str	z9, [x3]
	addvl	x3, sp, #1
	mla	z13.s, p7/m, z4.s, z1.s
	add	x3, x3, 64
	add	z5.s, z11.s, z13.s
	add	z9.s, z5.s, z22.s
	str	z9, [x3]
	addvl	x3, sp, #2
	add	z4.s, z8.s, z12.s
	add	x3, x3, 64
	add	z2.s, z4.s, z21.s
	str	z2, [x3]
	addvl	x3, sp, #3
	sub	z10.s, z10.s, z14.s
	add	z14.s, z3.s, z20.s
	add	x3, x3, 64
	str	z14, [x3]
	sub	z11.s, z11.s, z13.s
	addvl	x3, sp, #4
	add	z13.s, z16.s, z19.s
	sub	z8.s, z8.s, z12.s
	add	x3, x3, 64
	str	z13, [x3]
	add	z12.s, z8.s, z18.s
	addvl	x3, sp, #5
	add	z1.s, z11.s, z17.s
	add	z0.s, z10.s, z15.s
	add	x3, x3, 64
	str	z12, [x3]
	sub	z15.s, z10.s, z15.s
	addvl	x3, sp, #6
	sub	z17.s, z11.s, z17.s
	sub	z8.s, z8.s, z18.s
	add	x3, x3, 64
	str	z1, [x3]
	sub	z19.s, z16.s, z19.s
	addvl	x3, sp, #7
	sub	z3.s, z3.s, z20.s
	sub	z21.s, z4.s, z21.s
	add	x3, x3, 64
	str	z0, [x3]
	sub	z22.s, z5.s, z22.s
	addvl	x3, sp, #8
	mov	z18.s, #-43
	mov	z20.s, #-70
	add	x3, x3, 64
	str	z15, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 64
	str	z17, [x3]
	sub	z17.s, z6.s, z23.s
	addvl	x3, sp, #10
	add	x3, x3, 64
	str	z8, [x3]
	addvl	x3, sp, #11
	add	x3, x3, 64
	str	z19, [x3]
	mov	z19.d, z26.d
	addvl	x3, sp, #12
	add	x3, x3, 64
	str	z3, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	str	z21, [x3]
	mov	z21.s, #80
	addvl	x3, sp, #14
	add	x3, x3, 64
	str	z22, [x3]
	mov	z22.s, #87
	addvl	x3, sp, #15
	add	x3, x3, 64
	str	z17, [x3]
	mov	z17.s, #57
	add	x3, x0, 16
	ld1sh	z0.s, p7/z, [x3]
	add	x3, x0, 48
	ld1sh	z4.s, p7/z, [x3]
	movprfx	z23, z4
	mul	z23.s, p7/m, z23.s, z28.s
	add	x3, x0, 80
	ld1sh	z8.s, p7/z, [x3]
	add	x3, x0, 112
	ld1sh	z5.s, p7/z, [x3]
	mla	z23.s, p7/m, z5.s, z22.s
	add	x3, x0, 144
	ld1sh	z10.s, p7/z, [x3]
	movprfx	z22, z4
	mul	z22.s, z22.s, #87
	add	x3, x0, 176
	ld1sh	z16.s, p7/z, [x3]
	mla	z22.s, p7/m, z5.s, z17.s
	add	x3, x0, 208
	ld1sh	z9.s, p7/z, [x3]
	mla	z23.s, p7/m, z16.s, z21.s
	add	x3, x0, 240
	ld1sh	z12.s, p7/z, [x3]
	mla	z22.s, p7/m, z16.s, z31.s
	add	x3, x0, 272
	ld1sh	z1.s, p7/z, [x3]
	mla	z23.s, p7/m, z12.s, z25.s
	add	x3, x0, 304
	ld1sh	z13.s, p7/z, [x3]
	mla	z22.s, p7/m, z12.s, z18.s
	add	x3, x0, 336
	ld1sh	z11.s, p7/z, [x3]
	mla	z23.s, p7/m, z13.s, z17.s
	add	x3, x0, 368
	ld1sh	z14.s, p7/z, [x3]
	mla	z22.s, p7/m, z13.s, z29.s
	add	x3, x0, 400
	mla	z23.s, p7/m, z14.s, z27.s
	ld1sh	z2.s, p7/z, [x3]
	movprfx	z21, z4
	mul	z21.s, z21.s, #80
	add	x3, x0, 432
	mla	z21.s, p7/m, z5.s, z31.s
	ld1sh	z15.s, p7/z, [x3]
	mla	z21.s, p7/m, z16.s, z20.s
	mla	z23.s, p7/m, z15.s, z26.s
	mla	z21.s, p7/m, z12.s, z30.s
	mov	z26.s, #-90
	mla	z21.s, p7/m, z13.s, z24.s
	mla	z22.s, p7/m, z14.s, z26.s
	mla	z21.s, p7/m, z14.s, z17.s
	mla	z22.s, p7/m, z15.s, z20.s
	mov	z17.d, z19.d
	movprfx	z20, z4
	mul	z20.s, p7/m, z20.s, z25.s
	mla	z20.s, p7/m, z5.s, z18.s
	mov	z18.s, #-9
	mla	z20.s, p7/m, z16.s, z30.s
	mla	z20.s, p7/m, z12.s, z31.s
	mla	z20.s, p7/m, z13.s, z28.s
	mla	z20.s, p7/m, z14.s, z19.s
	mov	z19.s, #-57
	mla	z20.s, p7/m, z15.s, z29.s
	add	x3, x0, 464
	add	x0, x0, 496
	ld1sh	z6.s, p7/z, [x0]
	mla	z20.s, p7/m, z6.s, z19.s
	movprfx	z19, z4
	mul	z19.s, z19.s, #57
	mla	z19.s, p7/m, z5.s, z29.s
	mla	z19.s, p7/m, z16.s, z24.s
	mla	z19.s, p7/m, z12.s, z28.s
	mla	z19.s, p7/m, z13.s, z18.s
	movprfx	z18, z4
	mul	z18.s, p7/m, z18.s, z27.s
	mla	z18.s, p7/m, z5.s, z26.s
	mov	z26.s, #57
	mla	z18.s, p7/m, z16.s, z26.s
	mla	z18.s, p7/m, z12.s, z17.s
	mov	z26.s, #-70
	movprfx	z17, z4
	mul	z17.s, z17.s, #25
	mul	z4.s, p7/m, z4.s, z31.s
	mla	z17.s, p7/m, z5.s, z26.s
	mad	z5.s, p7/m, z24.s, z4.s
	mov	z26.s, #-57
	mla	z21.s, p7/m, z15.s, z28.s
	mla	z19.s, p7/m, z14.s, z30.s
	mla	z18.s, p7/m, z13.s, z30.s
	mla	z19.s, p7/m, z15.s, z27.s
	mla	z18.s, p7/m, z14.s, z25.s
	mla	z17.s, p7/m, z16.s, z28.s
	mla	z18.s, p7/m, z15.s, z31.s
	mad	z16.s, p7/m, z27.s, z5.s
	mla	z17.s, p7/m, z12.s, z29.s
	mov	z5.s, #-57
	mla	z17.s, p7/m, z13.s, z27.s
	mad	z12.s, p7/m, z5.s, z16.s
	mla	z17.s, p7/m, z14.s, z31.s
	mad	z13.s, p7/m, z25.s, z12.s
	mla	z17.s, p7/m, z15.s, z26.s
	mad	z14.s, p7/m, z29.s, z13.s
	mov	z26.s, #87
	mov	z4.s, #50
	mad	z15.s, p7/m, z26.s, z14.s
	mla	z23.s, p7/m, z6.s, z31.s
	mla	z22.s, p7/m, z6.s, z24.s
	mla	z19.s, p7/m, z6.s, z25.s
	mla	z18.s, p7/m, z6.s, z29.s
	mla	z21.s, p7/m, z6.s, z27.s
	mla	z17.s, p7/m, z6.s, z26.s
	mov	z12.s, #75
	mov	z16.s, #-90
	mad	z6.s, p7/m, z16.s, z15.s
	movprfx	z15, z8
	mul	z15.s, z15.s, #89
	mla	z15.s, p7/m, z9.s, z12.s
	mla	z15.s, p7/m, z11.s, z4.s
	mov	z4.s, #-18
	mov	z14.s, #18
	movprfx	z5, z8
	mul	z5.s, p7/m, z5.s, z12.s
	mov	z13.s, #-50
	mla	z5.s, p7/m, z9.s, z4.s
	movprfx	z4, z8
	mul	z4.s, z4.s, #50
	mla	z5.s, p7/m, z11.s, z7.s
	mul	z8.s, p7/m, z8.s, z14.s
	mla	z4.s, p7/m, z9.s, z7.s
	mad	z9.s, p7/m, z13.s, z8.s
	mla	z4.s, p7/m, z11.s, z14.s
	mad	z11.s, p7/m, z12.s, z9.s
	ld1sh	z3.s, p7/z, [x3]
	addvl	x0, sp, #16
	mla	z15.s, p7/m, z3.s, z14.s
	mla	z5.s, p7/m, z3.s, z13.s
	mla	z4.s, p7/m, z3.s, z12.s
	mad	z3.s, p7/m, z7.s, z11.s
	mov	z11.s, #64
	lsl	z16.s, z0.s, #6
	add	x0, x0, 64
	movprfx	z14, z16
	mla	z14.s, p7/m, z11.s, z1.s
	mov	z9.s, #-64
	movprfx	z11, z10
	mul	z11.s, z11.s, #83
	mla	z16.s, p7/m, z1.s, z9.s
	mov	z1.s, #36
	mla	z11.s, p7/m, z2.s, z1.s
	add	z12.s, z14.s, z11.s
	sub	z14.s, z14.s, z11.s
	add	z11.s, z12.s, z15.s
	sub	z12.s, z12.s, z15.s
	add	z26.s, z12.s, z6.s
	str	z26, [x0]
	add	x0, sp, 64
	add	z15.s, z11.s, z23.s
	sub	z11.s, z11.s, z23.s
	ldr	z23, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z23.s, z23.s, #64
	asr	z23.s, z23.s, #7
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	mul	z10.s, p7/m, z10.s, z1.s
	mov	z0.s, #-83
	add	z15.s, z15.s, #64
	mla	z10.s, p7/m, z2.s, z0.s
	asr	z15.s, z15.s, #7
	sqxtnb	z15.h, z15.s
	uzp1	z15.h, z15.h, z15.h
	movprfx	z26, z23
	splice	z26.h, p6, z26.h, z15.h
	ldr	z23, [x0]
	addvl	x0, sp, #2
	add	z13.s, z16.s, z10.s
	add	x0, x0, 64
	sub	z16.s, z16.s, z10.s
	add	z23.s, z23.s, #64
	add	z10.s, z13.s, z5.s
	add	z9.s, z16.s, z4.s
	add	z0.s, z10.s, z22.s
	asr	z23.s, z23.s, #7
	add	z0.s, z0.s, #64
	sqxtnb	z23.h, z23.s
	asr	z0.s, z0.s, #7
	uzp1	z23.h, z23.h, z23.h
	sqxtnb	z0.h, z0.s
	add	z1.s, z9.s, z21.s
	sub	z21.s, z9.s, z21.s
	sub	z9.s, z10.s, z22.s
	uzp1	z22.h, z0.h, z0.h
	movprfx	z0, z23
	splice	z0.h, p6, z0.h, z22.h
	ldr	z23, [x0]
	addvl	x0, sp, #3
	add	z23.s, z23.s, #64
	add	x0, x0, 64
	asr	z23.s, z23.s, #7
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	add	z1.s, z1.s, #64
	asr	z1.s, z1.s, #7
	sqxtnb	z1.h, z1.s
	uzp1	z1.h, z1.h, z1.h
	movprfx	z15, z23
	splice	z15.h, p6, z15.h, z1.h
	ldr	z23, [x0]
	addvl	x0, sp, #4
	add	z23.s, z23.s, #64
	add	x0, x0, 64
	asr	z23.s, z23.s, #7
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	add	z8.s, z14.s, z3.s
	add	z2.s, z8.s, z20.s
	add	z2.s, z2.s, #64
	asr	z2.s, z2.s, #7
	sqxtnb	z2.h, z2.s
	uzp1	z2.h, z2.h, z2.h
	movprfx	z1, z23
	splice	z1.h, p6, z1.h, z2.h
	ldr	z23, [x0]
	addvl	x0, sp, #5
	add	z23.s, z23.s, #64
	asr	z23.s, z23.s, #7
	add	x0, x0, 64
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	sub	z14.s, z14.s, z3.s
	add	z3.s, z14.s, z19.s
	add	z3.s, z3.s, #64
	asr	z3.s, z3.s, #7
	sqxtnb	z3.h, z3.s
	uzp1	z3.h, z3.h, z3.h
	movprfx	z2, z23
	splice	z2.h, p6, z2.h, z3.h
	ldr	z23, [x0]
	addvl	x0, sp, #6
	add	x0, x0, 64
	add	z23.s, z23.s, #64
	asr	z23.s, z23.s, #7
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	sub	z16.s, z16.s, z4.s
	add	z4.s, z16.s, z18.s
	add	z4.s, z4.s, #64
	asr	z4.s, z4.s, #7
	sqxtnb	z4.h, z4.s
	uzp1	z4.h, z4.h, z4.h
	movprfx	z3, z23
	splice	z3.h, p6, z3.h, z4.h
	ldr	z23, [x0]
	addvl	x0, sp, #7
	add	z23.s, z23.s, #64
	add	x0, x0, 64
	asr	z23.s, z23.s, #7
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	sub	z13.s, z13.s, z5.s
	add	z5.s, z13.s, z17.s
	add	z5.s, z5.s, #64
	asr	z5.s, z5.s, #7
	sqxtnb	z5.h, z5.s
	uzp1	z5.h, z5.h, z5.h
	movprfx	z10, z23
	splice	z10.h, p6, z10.h, z5.h
	ldr	z23, [x0]
	addvl	x0, sp, #16
	sub	z12.s, z12.s, z6.s
	add	z23.s, z23.s, #64
	add	x0, x0, 64
	ldr	z6, [x0]
	asr	z23.s, z23.s, #7
	addvl	x0, sp, #8
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	add	x0, x0, 64
	sub	z17.s, z13.s, z17.s
	movprfx	z22, z6
	add	z22.s, z22.s, #64
	sub	z13.s, z8.s, z20.s
	asr	z22.s, z22.s, #7
	sqxtnb	z22.h, z22.s
	uzp1	z22.h, z22.h, z22.h
	movprfx	z8, z23
	splice	z8.h, p6, z8.h, z22.h
	ldr	z23, [x0]
	addvl	x0, sp, #9
	movprfx	z20, z23
	add	z20.s, z20.s, #64
	add	z17.s, z17.s, #64
	add	x0, x0, 64
	ldr	z23, [x0]
	add	z23.s, z23.s, #64
	addvl	x0, sp, #10
	asr	z23.s, z23.s, #7
	asr	z22.s, z17.s, #7
	add	x0, x0, 64
	sqxtnb	z17.h, z23.s
	sqxtnb	z23.h, z22.s
	uzp1	z23.h, z23.h, z23.h
	uzp1	z17.h, z17.h, z17.h
	splice	z17.h, p6, z17.h, z23.h
	ldr	z23, [x0]
	addvl	x0, sp, #11
	sub	z16.s, z16.s, z18.s
	add	x0, x0, 64
	movprfx	z18, z23
	add	z18.s, z18.s, #64
	ldr	z23, [x0]
	addvl	x0, sp, #12
	sub	z14.s, z14.s, z19.s
	movprfx	z19, z23
	add	z19.s, z19.s, #64
	add	x0, x0, 64
	ldr	z6, [x0]
	add	z16.s, z16.s, #64
	addvl	x0, sp, #13
	asr	z16.s, z16.s, #7
	sqxtnb	z16.h, z16.s
	add	x0, x0, 64
	ldr	z23, [x0]
	uzp1	z16.h, z16.h, z16.h
	addvl	x0, sp, #14
	movprfx	z22, z23
	add	z22.s, z22.s, #64
	add	z12.s, z12.s, #64
	add	x0, x0, 64
	ldr	z23, [x0]
	asr	z12.s, z12.s, #7
	addvl	x0, sp, #15
	sqxtnb	z12.h, z12.s
	asr	z18.s, z18.s, #7
	add	x0, x0, 64
	uzp1	z12.h, z12.h, z12.h
	sqxtnb	z18.h, z18.s
	add	z14.s, z14.s, #64
	uzp1	z18.h, z18.h, z18.h
	asr	z14.s, z14.s, #7
	splice	z18.h, p6, z18.h, z16.h
	sqxtnb	z14.h, z14.s
	movprfx	z16, z11
	add	z16.s, z16.s, #64
	uzp1	z14.h, z14.h, z14.h
	add	z13.s, z13.s, #64
	add	z21.s, z21.s, #64
	asr	z13.s, z13.s, #7
	asr	z21.s, z21.s, #7
	sqxtnb	z13.h, z13.s
	sqxtnb	z21.h, z21.s
	uzp1	z13.h, z13.h, z13.h
	uzp1	z21.h, z21.h, z21.h
	add	z9.s, z9.s, #64
	asr	z16.s, z16.s, #7
	asr	z9.s, z9.s, #7
	sqxtnb	z16.h, z16.s
	sqxtnb	z9.h, z9.s
	uzp1	z16.h, z16.h, z16.h
	uzp1	z9.h, z9.h, z9.h
	asr	z20.s, z20.s, #7
	asr	z19.s, z19.s, #7
	sqxtnb	z20.h, z20.s
	sqxtnb	z19.h, z19.s
	uzp1	z20.h, z20.h, z20.h
	uzp1	z19.h, z19.h, z19.h
	splice	z20.h, p6, z20.h, z12.h
	splice	z19.h, p6, z19.h, z14.h
	zip1	z12.h, z0.h, z17.h
	add	z6.s, z6.s, #64
	zip2	z17.h, z0.h, z17.h
	asr	z6.s, z6.s, #7
	asr	z22.s, z22.s, #7
	sqxtnb	z6.h, z6.s
	sqxtnb	z22.h, z22.s
	uzp1	z6.h, z6.h, z6.h
	uzp1	z22.h, z22.h, z22.h
	splice	z6.h, p6, z6.h, z13.h
	splice	z22.h, p6, z22.h, z21.h
	ldr	z21, [x0]
	zip1	z14.h, z3.h, z22.h
	addvl	x0, sp, #17
	add	z23.s, z23.s, #64
	add	z21.s, z21.s, #64
	asr	z23.s, z23.s, #7
	asr	z21.s, z21.s, #7
	sqxtnb	z23.h, z23.s
	sqxtnb	z21.h, z21.s
	uzp1	z23.h, z23.h, z23.h
	uzp1	z21.h, z21.h, z21.h
	splice	z23.h, p6, z23.h, z9.h
	splice	z21.h, p6, z21.h, z16.h
	zip1	z9.h, z2.h, z6.h
	zip1	z13.h, z10.h, z23.h
	zip1	z16.h, z15.h, z18.h
	zip2	z6.h, z2.h, z6.h
	zip2	z18.h, z15.h, z18.h
	zip2	z23.h, z10.h, z23.h
	zip1	z10.h, z8.h, z21.h
	zip1	z11.h, z26.h, z20.h
	zip1	z15.h, z1.h, z19.h
	zip2	z20.h, z26.h, z20.h
	zip2	z19.h, z1.h, z19.h
	zip2	z22.h, z3.h, z22.h
	zip2	z21.h, z8.h, z21.h
	add	x0, x0, 64
	zip1	z8.h, z11.h, z9.h
	zip2	z11.h, z11.h, z9.h
	zip1	z9.h, z12.h, z14.h
	zip2	z12.h, z12.h, z14.h
	zip1	z14.h, z16.h, z13.h
	zip2	z16.h, z16.h, z13.h
	zip1	z13.h, z15.h, z10.h
	zip2	z15.h, z15.h, z10.h
	zip1	z10.h, z20.h, z6.h
	zip2	z20.h, z20.h, z6.h
	zip1	z6.h, z17.h, z22.h
	zip2	z22.h, z17.h, z22.h
	zip1	z17.h, z18.h, z23.h
	zip2	z23.h, z18.h, z23.h
	zip1	z18.h, z19.h, z21.h
	zip2	z21.h, z19.h, z21.h
	zip1	z19.h, z8.h, z14.h
	zip2	z14.h, z8.h, z14.h
	zip1	z8.h, z9.h, z13.h
	zip2	z13.h, z9.h, z13.h
	zip1	z9.h, z11.h, z16.h
	zip2	z16.h, z11.h, z16.h
	zip1	z11.h, z12.h, z15.h
	zip2	z15.h, z12.h, z15.h
	zip1	z12.h, z10.h, z17.h
	zip2	z17.h, z10.h, z17.h
	zip1	z10.h, z6.h, z18.h
	zip2	z18.h, z6.h, z18.h
	zip1	z6.h, z20.h, z23.h
	zip2	z23.h, z20.h, z23.h
	zip1	z20.h, z22.h, z21.h
	zip2	z22.h, z22.h, z21.h
	zip1	z21.h, z19.h, z8.h
	st1h	z21.h, p7, [x0]
	addvl	x0, sp, #17
	zip2	z19.h, z19.h, z8.h
	zip1	z21.h, z14.h, z13.h
	add	x0, x0, 96
	st1h	z19.h, p7, [x0]
	zip2	z14.h, z14.h, z13.h
	addvl	x0, sp, #17
	mov	z19.s, #25
	mov	z26.s, #87
	add	x0, x0, 128
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z9.h, z11.h
	addvl	x0, sp, #17
	zip2	z9.h, z9.h, z11.h
	add	x0, x0, 160
	st1h	z14.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 192
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z16.h, z15.h
	addvl	x0, sp, #17
	zip2	z16.h, z16.h, z15.h
	add	x0, x0, 224
	st1h	z9.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 256
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z12.h, z10.h
	addvl	x0, sp, #17
	zip2	z12.h, z12.h, z10.h
	add	x0, x0, 288
	st1h	z16.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 320
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z17.h, z18.h
	addvl	x0, sp, #17
	zip2	z17.h, z17.h, z18.h
	mov	z18.s, #-43
	add	x0, x0, 352
	st1h	z12.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 384
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z6.h, z20.h
	addvl	x0, sp, #17
	zip2	z6.h, z6.h, z20.h
	mov	z20.s, #-70
	add	x0, x0, 416
	st1h	z17.h, p7, [x0]
	mov	z17.s, #57
	addvl	x0, sp, #17
	add	x0, x0, 448
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z23.h, z22.h
	addvl	x0, sp, #17
	zip2	z23.h, z23.h, z22.h
	mov	z22.s, #80
	add	x0, x0, 480
	st1h	z6.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 512
	st1h	z21.h, p7, [x0]
	mov	z21.s, #-90
	addvl	x0, sp, #17
	add	x0, x0, 544
	st1h	z23.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	ld1sh	z0.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 96
	ld1sh	z10.s, p7/z, [x0]
	movprfx	z23, z10
	mul	z23.s, p7/m, z23.s, z28.s
	addvl	x0, sp, #17
	add	x0, x0, 128
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 160
	ld1sh	z11.s, p7/z, [x0]
	mla	z23.s, p7/m, z11.s, z26.s
	addvl	x0, sp, #17
	add	x0, x0, 192
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 224
	ld1sh	z12.s, p7/z, [x0]
	mla	z23.s, p7/m, z12.s, z22.s
	addvl	x0, sp, #17
	movprfx	z22, z10
	mul	z22.s, p7/m, z22.s, z26.s
	mov	z26.d, z21.d
	add	x0, x0, 256
	ld1sh	z5.s, p7/z, [x0]
	mla	z22.s, p7/m, z11.s, z17.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z12.s, z31.s
	add	x0, x0, 288
	ld1sh	z13.s, p7/z, [x0]
	mla	z23.s, p7/m, z13.s, z25.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z13.s, z18.s
	add	x0, x0, 320
	ld1sh	z1.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 352
	ld1sh	z14.s, p7/z, [x0]
	mla	z23.s, p7/m, z14.s, z17.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z14.s, z29.s
	add	x0, x0, 384
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 416
	ld1sh	z15.s, p7/z, [x0]
	mla	z23.s, p7/m, z15.s, z27.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z15.s, z21.s
	movprfx	z21, z10
	mul	z21.s, z21.s, #80
	add	x0, x0, 448
	ld1sh	z2.s, p7/z, [x0]
	mla	z21.s, p7/m, z11.s, z31.s
	addvl	x0, sp, #17
	mla	z21.s, p7/m, z12.s, z20.s
	mla	z21.s, p7/m, z13.s, z30.s
	add	x0, x0, 480
	ld1sh	z16.s, p7/z, [x0]
	mla	z21.s, p7/m, z14.s, z24.s
	addvl	x0, sp, #17
	mla	z23.s, p7/m, z16.s, z19.s
	mla	z22.s, p7/m, z16.s, z20.s
	add	x0, x0, 512
	mla	z21.s, p7/m, z15.s, z17.s
	ld1sh	z3.s, p7/z, [x0]
	movprfx	z20, z10
	mul	z20.s, p7/m, z20.s, z25.s
	mov	z17.d, z19.d
	mla	z20.s, p7/m, z11.s, z18.s
	addvl	x0, sp, #17
	mla	z20.s, p7/m, z12.s, z30.s
	mov	z18.s, #-9
	mla	z20.s, p7/m, z13.s, z31.s
	mla	z20.s, p7/m, z14.s, z28.s
	mla	z20.s, p7/m, z15.s, z19.s
	mov	z19.s, #-57
	mla	z20.s, p7/m, z16.s, z29.s
	add	x0, x0, 544
	ld1sh	z8.s, p7/z, [x0]
	mla	z20.s, p7/m, z8.s, z19.s
	movprfx	z19, z10
	mul	z19.s, z19.s, #57
	mla	z19.s, p7/m, z11.s, z29.s
	mla	z19.s, p7/m, z12.s, z24.s
	mla	z19.s, p7/m, z13.s, z28.s
	mla	z19.s, p7/m, z14.s, z18.s
	movprfx	z18, z10
	mul	z18.s, p7/m, z18.s, z27.s
	mla	z18.s, p7/m, z11.s, z26.s
	mov	z26.s, #57
	mla	z18.s, p7/m, z12.s, z26.s
	mla	z18.s, p7/m, z13.s, z17.s
	mov	z26.s, #-70
	movprfx	z17, z10
	mul	z17.s, z17.s, #25
	mul	z10.s, p7/m, z10.s, z31.s
	mla	z17.s, p7/m, z11.s, z26.s
	mad	z11.s, p7/m, z24.s, z10.s
	mla	z19.s, p7/m, z15.s, z30.s
	mla	z18.s, p7/m, z14.s, z30.s
	mla	z17.s, p7/m, z12.s, z28.s
	mla	z18.s, p7/m, z15.s, z25.s
	mad	z12.s, p7/m, z27.s, z11.s
	mla	z17.s, p7/m, z13.s, z29.s
	mov	z26.s, #-57
	mla	z17.s, p7/m, z14.s, z27.s
	mov	z11.s, #-57
	mla	z17.s, p7/m, z15.s, z31.s
	mad	z13.s, p7/m, z11.s, z12.s
	mad	z14.s, p7/m, z25.s, z13.s
	mad	z15.s, p7/m, z29.s, z14.s
	mla	z21.s, p7/m, z16.s, z28.s
	mla	z19.s, p7/m, z16.s, z27.s
	mla	z18.s, p7/m, z16.s, z31.s
	mla	z17.s, p7/m, z16.s, z26.s
	mov	z13.s, #-18
	mov	z26.s, #87
	mad	z16.s, p7/m, z26.s, z15.s
	mov	z15.s, #-90
	mla	z23.s, p7/m, z8.s, z31.s
	mla	z22.s, p7/m, z8.s, z24.s
	mla	z21.s, p7/m, z8.s, z27.s
	mla	z19.s, p7/m, z8.s, z25.s
	mla	z18.s, p7/m, z8.s, z29.s
	mla	z17.s, p7/m, z8.s, z26.s
	mla	z16.s, p7/m, z8.s, z15.s
	mov	z12.s, #75
	mov	z10.s, #18
	movprfx	z14, z4
	mul	z14.s, p7/m, z14.s, z12.s
	mov	z11.s, #50
	mla	z14.s, p7/m, z5.s, z13.s
	mov	z8.s, #-50
	movprfx	z13, z4
	mul	z13.s, p7/m, z13.s, z11.s
	movprfx	z15, z4
	mul	z15.s, z15.s, #89
	mla	z13.s, p7/m, z5.s, z7.s
	mla	z15.s, p7/m, z5.s, z12.s
	mul	z4.s, p7/m, z4.s, z10.s
	mad	z5.s, p7/m, z8.s, z4.s
	mla	z15.s, p7/m, z9.s, z11.s
	mla	z13.s, p7/m, z9.s, z10.s
	mla	z15.s, p7/m, z3.s, z10.s
	mla	z13.s, p7/m, z3.s, z12.s
	add	x0, sp, 64
	mla	z14.s, p7/m, z9.s, z7.s
	mad	z9.s, p7/m, z12.s, z5.s
	mla	z14.s, p7/m, z3.s, z8.s
	mla	z9.s, p7/m, z3.s, z7.s
	lsl	z5.s, z0.s, #6
	mov	z3.s, #-64
	movprfx	z8, z6
	mul	z8.s, z8.s, #83
	mov	z12.s, #64
	mad	z12.s, p7/m, z1.s, z5.s
	mla	z5.s, p7/m, z1.s, z3.s
	mov	z1.s, #36
	mla	z8.s, p7/m, z2.s, z1.s
	mul	z6.s, p7/m, z6.s, z1.s
	add	z10.s, z12.s, z8.s
	mov	z0.s, #-83
	sub	z12.s, z12.s, z8.s
	mla	z6.s, p7/m, z2.s, z0.s
	add	z8.s, z10.s, z15.s
	add	z11.s, z5.s, z6.s
	sub	z6.s, z5.s, z6.s
	add	z5.s, z11.s, z14.s
	sub	z11.s, z11.s, z14.s
	add	z14.s, z8.s, z23.s
	str	z14, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z3.s, z12.s, z9.s
	sub	z12.s, z12.s, z9.s
	add	z9.s, z5.s, z22.s
	str	z9, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 64
	add	z4.s, z6.s, z13.s
	sub	z10.s, z10.s, z15.s
	add	z15.s, z4.s, z21.s
	str	z15, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	add	z14.s, z3.s, z20.s
	str	z14, [x0]
	addvl	x0, sp, #4
	add	z9.s, z12.s, z19.s
	sub	z6.s, z6.s, z13.s
	add	x0, x0, 64
	str	z9, [x0]
	add	z1.s, z6.s, z18.s
	addvl	x0, sp, #5
	add	z0.s, z11.s, z17.s
	add	z15.s, z10.s, z16.s
	add	x0, x0, 64
	str	z1, [x0]
	sub	z16.s, z10.s, z16.s
	addvl	x0, sp, #6
	sub	z6.s, z6.s, z18.s
	sub	z3.s, z3.s, z20.s
	add	x0, x0, 64
	str	z0, [x0]
	sub	z0.s, z5.s, z22.s
	addvl	x0, sp, #7
	sub	z5.s, z8.s, z23.s
	mov	z20.s, #-70
	add	x0, x0, 64
	str	z15, [x0]
	mov	z22.s, #80
	addvl	x0, sp, #8
	add	z0.s, z0.s, #2048
	asr	z0.s, z0.s, #12
	add	x0, x0, 64
	str	z16, [x0]
	sub	z16.s, z11.s, z17.s
	addvl	x0, sp, #9
	sub	z17.s, z4.s, z21.s
	mov	z21.s, #-90
	add	x0, x0, 64
	str	z16, [x0]
	mov	z4.s, #-43
	addvl	x0, sp, #10
	sqxtnb	z0.h, z0.s
	uzp1	z0.h, z0.h, z0.h
	add	x0, x0, 64
	str	z6, [x0]
	sub	z6.s, z12.s, z19.s
	addvl	x0, sp, #11
	mov	z19.s, #25
	add	x0, x0, 64
	str	z6, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 64
	str	z3, [x0]
	addvl	x0, sp, #13
	add	x0, x0, 64
	str	z17, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	str	z5, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 80
	ld1sh	z1.s, p7/z, [x0]
	lsl	z1.s, z1.s, #6
	addvl	x0, sp, #17
	add	x0, x0, 112
	ld1sh	z12.s, p7/z, [x0]
	movprfx	z23, z12
	mul	z23.s, p7/m, z23.s, z28.s
	addvl	x0, sp, #17
	add	x0, x0, 144
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 176
	ld1sh	z13.s, p7/z, [x0]
	mla	z23.s, p7/m, z13.s, z26.s
	addvl	x0, sp, #17
	mov	z26.s, #57
	add	x0, x0, 208
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 240
	ld1sh	z14.s, p7/z, [x0]
	mla	z23.s, p7/m, z14.s, z22.s
	addvl	x0, sp, #17
	movprfx	z22, z12
	mul	z22.s, z22.s, #87
	mla	z22.s, p7/m, z13.s, z26.s
	add	x0, x0, 272
	ld1sh	z8.s, p7/z, [x0]
	mla	z22.s, p7/m, z14.s, z31.s
	addvl	x0, sp, #17
	add	x0, x0, 304
	ld1sh	z15.s, p7/z, [x0]
	mla	z23.s, p7/m, z15.s, z25.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z15.s, z4.s
	add	x0, x0, 336
	ld1sh	z2.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 368
	ld1sh	z16.s, p7/z, [x0]
	mla	z23.s, p7/m, z16.s, z26.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z16.s, z29.s
	mov	z26.d, z21.d
	add	x0, x0, 400
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 432
	ld1sh	z17.s, p7/z, [x0]
	mla	z22.s, p7/m, z17.s, z21.s
	addvl	x0, sp, #17
	movprfx	z21, z12
	mul	z21.s, z21.s, #80
	mla	z21.s, p7/m, z13.s, z31.s
	add	x0, x0, 464
	ld1sh	z3.s, p7/z, [x0]
	mla	z21.s, p7/m, z14.s, z20.s
	addvl	x0, sp, #17
	mla	z23.s, p7/m, z17.s, z27.s
	mla	z21.s, p7/m, z15.s, z30.s
	add	x0, x0, 496
	ld1sh	z18.s, p7/z, [x0]
	mla	z22.s, p7/m, z18.s, z20.s
	addvl	x0, sp, #17
	mov	z20.s, #57
	mla	z23.s, p7/m, z18.s, z19.s
	add	x0, x0, 528
	mla	z21.s, p7/m, z16.s, z24.s
	ld1sh	z5.s, p7/z, [x0]
	mla	z21.s, p7/m, z17.s, z20.s
	addvl	x0, sp, #17
	movprfx	z20, z12
	mul	z20.s, p7/m, z20.s, z25.s
	mla	z20.s, p7/m, z13.s, z4.s
	mov	z4.s, #-9
	mla	z20.s, p7/m, z14.s, z30.s
	mla	z20.s, p7/m, z15.s, z31.s
	mla	z20.s, p7/m, z16.s, z28.s
	mla	z20.s, p7/m, z17.s, z19.s
	mov	z19.s, #-57
	mla	z20.s, p7/m, z18.s, z29.s
	add	x0, x0, 560
	ld1sh	z10.s, p7/z, [x0]
	mla	z20.s, p7/m, z10.s, z19.s
	movprfx	z19, z12
	mul	z19.s, z19.s, #57
	mla	z19.s, p7/m, z13.s, z29.s
	mla	z19.s, p7/m, z14.s, z24.s
	mla	z19.s, p7/m, z15.s, z28.s
	mla	z19.s, p7/m, z16.s, z4.s
	movprfx	z4, z12
	mul	z4.s, p7/m, z4.s, z27.s
	mla	z4.s, p7/m, z13.s, z26.s
	mov	z26.s, #57
	mad	z26.s, p7/m, z14.s, z4.s
	mov	z4.s, #25
	mla	z26.s, p7/m, z15.s, z4.s
	mla	z21.s, p7/m, z18.s, z28.s
	mla	z19.s, p7/m, z17.s, z30.s
	mad	z30.s, p7/m, z16.s, z26.s
	movprfx	z26, z12
	mul	z26.s, p7/m, z26.s, z4.s
	mov	z4.s, #-70
	mla	z26.s, p7/m, z13.s, z4.s
	mad	z28.s, p7/m, z14.s, z26.s
	mla	z28.s, p7/m, z15.s, z29.s
	mla	z28.s, p7/m, z16.s, z27.s
	mla	z23.s, p7/m, z10.s, z31.s
	mla	z19.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z17.s, z25.s
	mla	z19.s, p7/m, z10.s, z25.s
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z4.s, #-57
	mla	z30.s, p7/m, z10.s, z29.s
	mad	z31.s, p7/m, z17.s, z28.s
	mul	z12.s, z12.s, #9
	mov	z28.s, #87
	mad	z13.s, p7/m, z24.s, z12.s
	mov	z26.s, #-90
	mad	z14.s, p7/m, z27.s, z13.s
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z25.s, z15.s
	mov	z25.s, #-50
	mad	z17.s, p7/m, z29.s, z16.s
	mov	z29.s, #75
	mla	z21.s, p7/m, z10.s, z27.s
	mla	z22.s, p7/m, z10.s, z24.s
	mla	z31.s, p7/m, z18.s, z4.s
	add	x0, sp, 64
	mla	z31.s, p7/m, z10.s, z28.s
	mad	z18.s, p7/m, z28.s, z17.s
	mov	z4.s, #50
	mla	z18.s, p7/m, z10.s, z26.s
	mov	z28.s, #18
	movprfx	z26, z6
	mul	z26.s, p7/m, z26.s, z29.s
	movprfx	z24, z6
	mul	z24.s, p7/m, z24.s, z4.s
	movprfx	z27, z6
	mul	z27.s, z27.s, #89
	mla	z24.s, p7/m, z8.s, z7.s
	mla	z27.s, p7/m, z8.s, z29.s
	mla	z24.s, p7/m, z11.s, z28.s
	mla	z27.s, p7/m, z11.s, z4.s
	mla	z24.s, p7/m, z5.s, z29.s
	mul	z6.s, p7/m, z6.s, z28.s
	mov	z13.s, #-18
	mla	z26.s, p7/m, z8.s, z13.s
	mad	z8.s, p7/m, z25.s, z6.s
	mla	z26.s, p7/m, z11.s, z7.s
	mad	z11.s, p7/m, z29.s, z8.s
	mla	z26.s, p7/m, z5.s, z25.s
	mov	z29.s, #-64
	mov	z25.s, #64
	movprfx	z14, z1
	mla	z14.s, p7/m, z25.s, z2.s
	mla	z1.s, p7/m, z2.s, z29.s
	mov	z2.s, #36
	movprfx	z25, z9
	mul	z25.s, z25.s, #83
	mul	z9.s, p7/m, z9.s, z2.s
	mla	z25.s, p7/m, z3.s, z2.s
	mov	z2.s, #-83
	mla	z9.s, p7/m, z3.s, z2.s
	add	z29.s, z1.s, z9.s
	add	z17.s, z29.s, z26.s
	sub	z29.s, z29.s, z26.s
	add	z26.s, z29.s, z31.s
	sub	z29.s, z29.s, z31.s
	ldr	z31, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z10.s, z17.s, z22.s
	sub	z17.s, z17.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #2
	mla	z27.s, p7/m, z5.s, z28.s
	add	x0, x0, 64
	mla	z11.s, p7/m, z5.s, z7.s
	add	z28.s, z14.s, z25.s
	sub	z14.s, z14.s, z25.s
	add	z15.s, z14.s, z11.s
	add	z13.s, z15.s, z20.s
	sub	z15.s, z15.s, z20.s
	ldr	z20, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	sub	z11.s, z14.s, z11.s
	add	z14.s, z11.s, z19.s
	sub	z11.s, z11.s, z19.s
	ldr	z19, [x0]
	addvl	x0, sp, #4
	add	x0, x0, 64
	sub	z1.s, z1.s, z9.s
	add	z16.s, z1.s, z24.s
	add	z12.s, z16.s, z21.s
	sub	z16.s, z16.s, z21.s
	ldr	z21, [x0]
	addvl	x0, sp, #5
	add	z25.s, z28.s, z27.s
	add	z9.s, z25.s, z23.s
	add	x0, x0, 64
	sub	z25.s, z25.s, z23.s
	ldr	z23, [x0]
	addvl	x0, sp, #6
	sub	z1.s, z1.s, z24.s
	add	z24.s, z1.s, z30.s
	add	x0, x0, 64
	add	z24.s, z24.s, #2048
	asr	z24.s, z24.s, #12
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	add	z23.s, z23.s, #2048
	asr	z23.s, z23.s, #12
	sqxtnb	z23.h, z23.s
	uzp1	z23.h, z23.h, z23.h
	splice	z23.h, p6, z23.h, z24.h
	ldr	z24, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 64
	add	z26.s, z26.s, #2048
	asr	z26.s, z26.s, #12
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	add	z24.s, z24.s, #2048
	asr	z24.s, z24.s, #12
	sqxtnb	z24.h, z24.s
	uzp1	z24.h, z24.h, z24.h
	splice	z24.h, p6, z24.h, z26.h
	ldr	z26, [x0]
	addvl	x0, sp, #8
	add	x0, x0, 64
	sub	z28.s, z28.s, z27.s
	add	z27.s, z28.s, z18.s
	sub	z28.s, z28.s, z18.s
	ldr	z18, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 64
	add	z27.s, z27.s, #2048
	asr	z27.s, z27.s, #12
	sqxtnb	z27.h, z27.s
	uzp1	z27.h, z27.h, z27.h
	add	z26.s, z26.s, #2048
	asr	z26.s, z26.s, #12
	sqxtnb	z26.h, z26.s
	uzp1	z26.h, z26.h, z26.h
	splice	z26.h, p6, z26.h, z27.h
	ldr	z27, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 64
	add	z28.s, z28.s, #2048
	asr	z28.s, z28.s, #12
	sqxtnb	z28.h, z28.s
	uzp1	z28.h, z28.h, z28.h
	add	z18.s, z18.s, #2048
	asr	z18.s, z18.s, #12
	sqxtnb	z18.h, z18.s
	uzp1	z18.h, z18.h, z18.h
	splice	z18.h, p6, z18.h, z28.h
	ldr	z28, [x0]
	addvl	x0, sp, #11
	add	x0, x0, 64
	sub	z1.s, z1.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #12
	add	z14.s, z14.s, #2048
	asr	z14.s, z14.s, #12
	add	x0, x0, 64
	sqxtnb	z14.h, z14.s
	uzp1	z14.h, z14.h, z14.h
	add	z21.s, z21.s, #2048
	asr	z21.s, z21.s, #12
	sqxtnb	z21.h, z21.s
	uzp1	z21.h, z21.h, z21.h
	splice	z21.h, p6, z21.h, z14.h
	ldr	z14, [x0]
	addvl	x0, sp, #13
	add	z15.s, z15.s, #2048
	asr	z15.s, z15.s, #12
	add	x0, x0, 64
	sqxtnb	z15.h, z15.s
	uzp1	z15.h, z15.h, z15.h
	add	z31.s, z31.s, #2048
	add	z9.s, z9.s, #2048
	asr	z31.s, z31.s, #12
	asr	z9.s, z9.s, #12
	sqxtnb	z31.h, z31.s
	sqxtnb	z9.h, z9.s
	uzp1	z31.h, z31.h, z31.h
	uzp1	z9.h, z9.h, z9.h
	add	z22.s, z22.s, #2048
	splice	z31.h, p6, z31.h, z9.h
	asr	z22.s, z22.s, #12
	add	z10.s, z10.s, #2048
	sqxtnb	z22.h, z22.s
	asr	z10.s, z10.s, #12
	uzp1	z22.h, z22.h, z22.h
	sqxtnb	z10.h, z10.s
	add	z19.s, z19.s, #2048
	uzp1	z10.h, z10.h, z10.h
	asr	z19.s, z19.s, #12
	splice	z22.h, p6, z22.h, z10.h
	add	z13.s, z13.s, #2048
	sqxtnb	z19.h, z19.s
	asr	z13.s, z13.s, #12
	uzp1	z19.h, z19.h, z19.h
	sqxtnb	z13.h, z13.s
	add	z29.s, z29.s, #2048
	uzp1	z13.h, z13.h, z13.h
	asr	z29.s, z29.s, #12
	splice	z19.h, p6, z19.h, z13.h
	sqxtnb	z29.h, z29.s
	add	z28.s, z28.s, #2048
	uzp1	z29.h, z29.h, z29.h
	asr	z28.s, z28.s, #12
	add	z1.s, z1.s, #2048
	sqxtnb	z28.h, z28.s
	asr	z1.s, z1.s, #12
	uzp1	z28.h, z28.h, z28.h
	sqxtnb	z1.h, z1.s
	add	z14.s, z14.s, #2048
	uzp1	z1.h, z1.h, z1.h
	asr	z14.s, z14.s, #12
	splice	z28.h, p6, z28.h, z1.h
	sqxtnb	z14.h, z14.s
	add	z16.s, z16.s, #2048
	uzp1	z14.h, z14.h, z14.h
	asr	z16.s, z16.s, #12
	splice	z14.h, p6, z14.h, z15.h
	ldr	z15, [x0]
	sqxtnb	z16.h, z16.s
	addvl	x0, sp, #14
	uzp1	z16.h, z16.h, z16.h
	add	z17.s, z17.s, #2048
	add	z25.s, z25.s, #2048
	asr	z17.s, z17.s, #12
	asr	z25.s, z25.s, #12
	sqxtnb	z17.h, z17.s
	sqxtnb	z25.h, z25.s
	uzp1	z17.h, z17.h, z17.h
	uzp1	z25.h, z25.h, z25.h
	zip1	z13.h, z31.h, z18.h
	splice	z0.h, p6, z0.h, z17.h
	zip2	z18.h, z31.h, z18.h
	add	x0, x0, 64
	add	z20.s, z20.s, #2048
	add	z12.s, z12.s, #2048
	asr	z20.s, z20.s, #12
	asr	z12.s, z12.s, #12
	sqxtnb	z20.h, z20.s
	sqxtnb	z12.h, z12.s
	uzp1	z20.h, z20.h, z20.h
	uzp1	z12.h, z12.h, z12.h
	add	z27.s, z27.s, #2048
	splice	z20.h, p6, z20.h, z12.h
	asr	z27.s, z27.s, #12
	zip1	z17.h, z20.h, z28.h
	zip2	z31.h, z20.h, z28.h
	sqxtnb	z27.h, z27.s
	add	z30.s, z30.s, #2048
	uzp1	z27.h, z27.h, z27.h
	asr	z30.s, z30.s, #12
	splice	z27.h, p6, z27.h, z29.h
	ldr	z29, [x0]
	add	z11.s, z11.s, #2048
	sqxtnb	z30.h, z30.s
	asr	z11.s, z11.s, #12
	uzp1	z30.h, z30.h, z30.h
	sqxtnb	z11.h, z11.s
	add	z15.s, z15.s, #2048
	uzp1	z11.h, z11.h, z11.h
	asr	z15.s, z15.s, #12
	splice	z30.h, p6, z30.h, z11.h
	sqxtnb	z15.h, z15.s
	zip1	z28.h, z19.h, z30.h
	uzp1	z15.h, z15.h, z15.h
	zip2	z30.h, z19.h, z30.h
	splice	z15.h, p6, z15.h, z16.h
	add	z29.s, z29.s, #2048
	zip1	z16.h, z23.h, z15.h
	asr	z29.s, z29.s, #12
	sqxtnb	z29.h, z29.s
	uzp1	z29.h, z29.h, z29.h
	splice	z29.h, p6, z29.h, z25.h
	zip1	z25.h, z22.h, z27.h
	zip1	z19.h, z26.h, z29.h
	zip2	z27.h, z22.h, z27.h
	zip1	z22.h, z21.h, z14.h
	zip2	z23.h, z23.h, z15.h
	zip1	z12.h, z13.h, z22.h
	zip2	z21.h, z21.h, z14.h
	zip1	z20.h, z24.h, z0.h
	zip2	z14.h, z13.h, z22.h
	zip1	z15.h, z17.h, z20.h
	zip2	z24.h, z24.h, z0.h
	zip2	z26.h, z26.h, z29.h
	zip1	z22.h, z25.h, z16.h
	zip2	z20.h, z17.h, z20.h
	zip2	z25.h, z25.h, z16.h
	zip1	z17.h, z31.h, z24.h
	zip1	z16.h, z28.h, z19.h
	zip2	z28.h, z28.h, z19.h
	zip1	z19.h, z30.h, z26.h
	zip2	z30.h, z30.h, z26.h
	zip1	z13.h, z18.h, z21.h
	zip1	z29.h, z27.h, z23.h
	zip2	z18.h, z18.h, z21.h
	zip2	z27.h, z27.h, z23.h
	zip1	z21.h, z12.h, z15.h
	zip2	z23.h, z12.h, z15.h
	zip2	z31.h, z31.h, z24.h
	zip1	z15.h, z22.h, z16.h
	zip1	z24.h, z14.h, z20.h
	zip2	z22.h, z22.h, z16.h
	zip2	z20.h, z14.h, z20.h
	zip1	z16.h, z25.h, z28.h
	zip1	z14.h, z13.h, z17.h
	zip2	z25.h, z25.h, z28.h
	zip2	z28.h, z13.h, z17.h
	zip1	z17.h, z29.h, z19.h
	zip2	z29.h, z29.h, z19.h
	zip1	z19.h, z27.h, z30.h
	zip2	z27.h, z27.h, z30.h
	zip1	z30.h, z21.h, z15.h
	st1h	z30.h, p7, [x1]
	zip2	z21.h, z21.h, z15.h
	st1h	z21.h, p7, [x1, x2, lsl 1]
	add	x0, x1, x2, lsl 2
	zip1	z30.h, z23.h, z22.h
	st1h	z30.h, p7, [x0]
	zip2	z23.h, z23.h, z22.h
	zip1	z30.h, z24.h, z16.h
	st1h	z23.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip2	z24.h, z24.h, z16.h
	st1h	z30.h, p7, [x0]
	zip1	z30.h, z20.h, z25.h
	zip2	z20.h, z20.h, z25.h
	st1h	z24.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip1	z26.h, z18.h, z31.h
	st1h	z30.h, p7, [x0]
	zip1	z30.h, z14.h, z17.h
	zip2	z31.h, z18.h, z31.h
	st1h	z20.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	st1h	z30.h, p7, [x0]
	zip2	z30.h, z14.h, z17.h
	st1h	z30.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip1	z30.h, z28.h, z29.h
	st1h	z30.h, p7, [x0]
	zip2	z28.h, z28.h, z29.h
	zip1	z30.h, z26.h, z19.h
	st1h	z28.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip2	z26.h, z26.h, z19.h
	st1h	z30.h, p7, [x0]
	zip1	z30.h, z31.h, z27.h
	zip2	z31.h, z31.h, z27.h
	st1h	z26.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	st1h	z30.h, p7, [x0]
	st1h	z31.h, p7, [x0, x2, lsl 1]
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
	addvl	sp, sp, #17
	.cfi_def_cfa_offset 576
	add	sp, sp, 576
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	dynopt_idct16_sve2_shared, .-dynopt_idct16_sve2_shared
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
