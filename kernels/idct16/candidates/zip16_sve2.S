	.arch armv8.2-a+crc+sve2
	.file	"zip16.cpp"
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
	mov	z19.s, #-70
	add	x3, sp, 64
	mov	z16.s, #-9
	mov	z29.s, #-80
	mov	z24.s, #70
	mov	z23.s, #-25
	mov	z30.s, #-87
	stp	d8, d9, [sp]
	mov	z0.s, #87
	mov	z17.s, #-90
	mov	z27.s, #43
	mov	z25.s, #25
	ptrue	p6.h, vl8
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
	ld1sh	z31.s, p7/z, [x0]
	str	z31, [x3]
	add	x3, x0, 32
	ld1sh	z2.s, p7/z, [x3]
	add	x3, x0, 64
	ld1sh	z6.s, p7/z, [x3]
	mov	z31.s, #80
	add	x3, x0, 96
	ld1sh	z10.s, p7/z, [x3]
	movprfx	z22, z2
	mul	z22.s, p7/m, z22.s, z0.s
	add	x3, x0, 128
	ld1sh	z8.s, p7/z, [x3]
	mla	z22.s, p7/m, z10.s, z28.s
	add	x3, x0, 160
	ld1sh	z11.s, p7/z, [x3]
	movprfx	z20, z2
	mul	z20.s, p7/m, z20.s, z24.s
	add	x3, x0, 192
	ld1sh	z7.s, p7/z, [x3]
	mla	z20.s, p7/m, z10.s, z18.s
	add	x3, x0, 224
	ld1sh	z12.s, p7/z, [x3]
	movprfx	z26, z2
	mul	z26.s, z26.s, #90
	add	x3, x0, 256
	ld1sh	z3.s, p7/z, [x3]
	mla	z26.s, p7/m, z10.s, z0.s
	add	x3, x0, 288
	ld1sh	z13.s, p7/z, [x3]
	mla	z26.s, p7/m, z11.s, z31.s
	add	x3, x0, 320
	ld1sh	z9.s, p7/z, [x3]
	mov	z31.s, #9
	add	x3, x0, 352
	ld1sh	z14.s, p7/z, [x3]
	mla	z26.s, p7/m, z12.s, z24.s
	add	x3, x0, 384
	ld1sh	z4.s, p7/z, [x3]
	mla	z26.s, p7/m, z13.s, z28.s
	add	x3, x0, 416
	mla	z22.s, p7/m, z11.s, z31.s
	ld1sh	z15.s, p7/z, [x3]
	mla	z22.s, p7/m, z12.s, z18.s
	add	x3, x0, 448
	mla	z22.s, p7/m, z13.s, z29.s
	movprfx	z21, z2
	mul	z21.s, z21.s, #80
	mla	z22.s, p7/m, z14.s, z17.s
	mla	z21.s, p7/m, z10.s, z31.s
	mla	z22.s, p7/m, z15.s, z19.s
	mla	z21.s, p7/m, z11.s, z19.s
	mov	z18.s, #-57
	mla	z21.s, p7/m, z12.s, z30.s
	movprfx	z19, z2
	mul	z19.s, z19.s, #57
	mla	z21.s, p7/m, z13.s, z23.s
	mla	z19.s, p7/m, z10.s, z29.s
	mla	z21.s, p7/m, z14.s, z28.s
	mla	z19.s, p7/m, z11.s, z23.s
	mov	z28.s, #90
	mla	z19.s, p7/m, z12.s, z28.s
	mla	z19.s, p7/m, z13.s, z16.s
	mov	z16.s, #57
	ld1sh	z5.s, p7/z, [x3]
	mla	z20.s, p7/m, z11.s, z30.s
	add	x3, x0, 480
	mla	z20.s, p7/m, z12.s, z31.s
	ld1sh	z1.s, p7/z, [x3]
	mla	z20.s, p7/m, z13.s, z28.s
	mla	z20.s, p7/m, z14.s, z25.s
	mla	z20.s, p7/m, z15.s, z29.s
	mla	z20.s, p7/m, z1.s, z18.s
	movprfx	z18, z2
	mul	z18.s, p7/m, z18.s, z27.s
	mla	z18.s, p7/m, z10.s, z17.s
	mla	z18.s, p7/m, z11.s, z16.s
	mov	z16.s, #-70
	mla	z26.s, p7/m, z14.s, z27.s
	mla	z19.s, p7/m, z14.s, z30.s
	mla	z18.s, p7/m, z12.s, z25.s
	movprfx	z17, z2
	mul	z17.s, p7/m, z17.s, z25.s
	mla	z18.s, p7/m, z13.s, z30.s
	mla	z17.s, p7/m, z10.s, z16.s
	mla	z18.s, p7/m, z14.s, z24.s
	mla	z17.s, p7/m, z11.s, z28.s
	mul	z2.s, p7/m, z2.s, z31.s
	mla	z17.s, p7/m, z12.s, z29.s
	mad	z10.s, p7/m, z23.s, z2.s
	mla	z17.s, p7/m, z13.s, z27.s
	mad	z11.s, p7/m, z27.s, z10.s
	mla	z17.s, p7/m, z14.s, z31.s
	mov	z16.s, #-57
	mad	z12.s, p7/m, z16.s, z11.s
	mad	z13.s, p7/m, z24.s, z12.s
	mad	z14.s, p7/m, z29.s, z13.s
	mla	z26.s, p7/m, z15.s, z25.s
	mla	z21.s, p7/m, z15.s, z28.s
	mla	z19.s, p7/m, z15.s, z27.s
	mla	z18.s, p7/m, z15.s, z31.s
	mla	z17.s, p7/m, z15.s, z16.s
	mov	z13.s, #50
	mad	z15.s, p7/m, z0.s, z14.s
	mov	z12.s, #-18
	mov	z14.s, #-90
	mla	z22.s, p7/m, z1.s, z23.s
	mla	z19.s, p7/m, z1.s, z24.s
	mla	z18.s, p7/m, z1.s, z29.s
	mla	z17.s, p7/m, z1.s, z0.s
	mla	z15.s, p7/m, z1.s, z14.s
	mla	z26.s, p7/m, z1.s, z31.s
	mla	z21.s, p7/m, z1.s, z27.s
	mov	z0.d, z14.d
	mov	z1.s, #75
	mov	z11.s, #18
	mov	z10.s, #-89
	mov	z2.s, #-50
	movprfx	z14, z6
	mul	z14.s, z14.s, #89
	mla	z14.s, p7/m, z7.s, z1.s
	mla	z14.s, p7/m, z9.s, z13.s
	movprfx	z13, z6
	mul	z13.s, p7/m, z13.s, z1.s
	mla	z13.s, p7/m, z7.s, z12.s
	movprfx	z12, z6
	mul	z12.s, z12.s, #50
	mul	z6.s, p7/m, z6.s, z11.s
	mla	z12.s, p7/m, z7.s, z10.s
	mad	z7.s, p7/m, z2.s, z6.s
	mla	z14.s, p7/m, z5.s, z11.s
	add	x3, sp, 64
	mla	z13.s, p7/m, z9.s, z10.s
	mla	z12.s, p7/m, z9.s, z11.s
	ldr	z11, [x3]
	mad	z9.s, p7/m, z1.s, z7.s
	lsl	z16.s, z11.s, #6
	mov	z6.s, #-64
	mov	z7.s, #64
	mad	z7.s, p7/m, z3.s, z16.s
	mla	z16.s, p7/m, z3.s, z6.s
	mla	z13.s, p7/m, z5.s, z2.s
	mla	z12.s, p7/m, z5.s, z1.s
	mla	z9.s, p7/m, z5.s, z10.s
	movprfx	z6, z8
	mul	z6.s, z6.s, #83
	mov	z5.s, #36
	mov	z3.s, #-83
	mla	z6.s, p7/m, z4.s, z5.s
	mul	z8.s, p7/m, z8.s, z5.s
	add	z10.s, z7.s, z6.s
	mla	z8.s, p7/m, z4.s, z3.s
	add	z11.s, z16.s, z8.s
	sub	z8.s, z16.s, z8.s
	sub	z16.s, z7.s, z6.s
	add	z7.s, z10.s, z14.s
	sub	z10.s, z10.s, z14.s
	add	z14.s, z7.s, z26.s
	str	z14, [x3]
	addvl	x3, sp, #1
	add	z6.s, z11.s, z13.s
	add	z4.s, z16.s, z9.s
	add	x3, x3, 64
	sub	z16.s, z16.s, z9.s
	add	z9.s, z6.s, z22.s
	str	z9, [x3]
	addvl	x3, sp, #2
	add	z5.s, z8.s, z12.s
	add	x3, x3, 64
	add	z14.s, z5.s, z21.s
	str	z14, [x3]
	addvl	x3, sp, #3
	sub	z11.s, z11.s, z13.s
	add	z13.s, z4.s, z20.s
	add	x3, x3, 64
	str	z13, [x3]
	add	z9.s, z16.s, z19.s
	addvl	x3, sp, #4
	sub	z8.s, z8.s, z12.s
	add	z3.s, z8.s, z18.s
	add	x3, x3, 64
	str	z9, [x3]
	add	z12.s, z11.s, z17.s
	addvl	x3, sp, #5
	add	z13.s, z10.s, z15.s
	sub	z10.s, z10.s, z15.s
	add	x3, x3, 64
	str	z3, [x3]
	sub	z15.s, z11.s, z17.s
	addvl	x3, sp, #6
	sub	z8.s, z8.s, z18.s
	sub	z4.s, z4.s, z20.s
	add	x3, x3, 64
	str	z12, [x3]
	sub	z21.s, z5.s, z21.s
	addvl	x3, sp, #7
	sub	z20.s, z6.s, z22.s
	sub	z26.s, z7.s, z26.s
	add	x3, x3, 64
	str	z13, [x3]
	mov	z18.d, z25.d
	addvl	x3, sp, #8
	mov	z17.s, #-43
	add	x3, x3, 64
	str	z10, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 64
	str	z15, [x3]
	addvl	x3, sp, #10
	add	x3, x3, 64
	str	z8, [x3]
	sub	z8.s, z16.s, z19.s
	addvl	x3, sp, #11
	mov	z16.s, #57
	mov	z19.s, #-70
	add	x3, x3, 64
	str	z8, [x3]
	addvl	x3, sp, #12
	add	x3, x3, 64
	str	z4, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	str	z21, [x3]
	mov	z21.s, #87
	addvl	x3, sp, #14
	add	x3, x3, 64
	str	z20, [x3]
	mov	z20.s, #80
	addvl	x3, sp, #15
	add	x3, x3, 64
	str	z26, [x3]
	add	x3, x0, 16
	ld1sh	z7.s, p7/z, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	str	z7, [x3]
	add	x3, x0, 48
	ld1sh	z2.s, p7/z, [x3]
	movprfx	z22, z2
	mul	z22.s, p7/m, z22.s, z28.s
	add	x3, x0, 80
	ld1sh	z8.s, p7/z, [x3]
	add	x3, x0, 112
	ld1sh	z3.s, p7/z, [x3]
	mla	z22.s, p7/m, z3.s, z21.s
	add	x3, x0, 144
	ld1sh	z10.s, p7/z, [x3]
	movprfx	z21, z2
	mul	z21.s, z21.s, #87
	add	x3, x0, 176
	ld1sh	z26.s, p7/z, [x3]
	mla	z21.s, p7/m, z3.s, z16.s
	add	x3, x0, 208
	ld1sh	z9.s, p7/z, [x3]
	mla	z22.s, p7/m, z26.s, z20.s
	add	x3, x0, 240
	ld1sh	z12.s, p7/z, [x3]
	mla	z21.s, p7/m, z26.s, z31.s
	add	x3, x0, 272
	ld1sh	z4.s, p7/z, [x3]
	mla	z22.s, p7/m, z12.s, z24.s
	add	x3, x0, 304
	ld1sh	z13.s, p7/z, [x3]
	mla	z21.s, p7/m, z12.s, z17.s
	add	x3, x0, 336
	ld1sh	z11.s, p7/z, [x3]
	mla	z22.s, p7/m, z13.s, z16.s
	add	x3, x0, 368
	ld1sh	z14.s, p7/z, [x3]
	mla	z21.s, p7/m, z13.s, z29.s
	add	x3, x0, 400
	mla	z22.s, p7/m, z14.s, z27.s
	ld1sh	z6.s, p7/z, [x3]
	mla	z21.s, p7/m, z14.s, z0.s
	add	x3, x0, 432
	movprfx	z20, z2
	mul	z20.s, z20.s, #80
	ld1sh	z15.s, p7/z, [x3]
	mla	z20.s, p7/m, z3.s, z31.s
	mla	z22.s, p7/m, z15.s, z25.s
	mla	z21.s, p7/m, z15.s, z19.s
	mla	z20.s, p7/m, z26.s, z19.s
	mov	z25.d, z0.d
	mla	z20.s, p7/m, z12.s, z30.s
	movprfx	z19, z2
	mul	z19.s, p7/m, z19.s, z24.s
	mla	z20.s, p7/m, z13.s, z23.s
	mla	z19.s, p7/m, z3.s, z17.s
	mla	z20.s, p7/m, z14.s, z16.s
	mla	z19.s, p7/m, z26.s, z30.s
	mov	z16.d, z18.d
	mla	z19.s, p7/m, z12.s, z31.s
	mov	z17.s, #-9
	mla	z19.s, p7/m, z13.s, z28.s
	mla	z19.s, p7/m, z14.s, z18.s
	mov	z18.s, #-57
	mla	z19.s, p7/m, z15.s, z29.s
	add	x3, x0, 464
	mov	z0.d, z18.d
	add	x0, x0, 496
	ld1sh	z5.s, p7/z, [x0]
	mla	z19.s, p7/m, z5.s, z18.s
	movprfx	z18, z2
	mul	z18.s, z18.s, #57
	mla	z18.s, p7/m, z3.s, z29.s
	mla	z18.s, p7/m, z26.s, z23.s
	mla	z18.s, p7/m, z12.s, z28.s
	mla	z18.s, p7/m, z13.s, z17.s
	movprfx	z17, z2
	mul	z17.s, p7/m, z17.s, z27.s
	mla	z17.s, p7/m, z3.s, z25.s
	mov	z25.s, #57
	mla	z17.s, p7/m, z26.s, z25.s
	mov	z25.s, #-70
	mla	z17.s, p7/m, z12.s, z16.s
	movprfx	z16, z2
	mul	z16.s, z16.s, #25
	mul	z2.s, p7/m, z2.s, z31.s
	mla	z16.s, p7/m, z3.s, z25.s
	mad	z3.s, p7/m, z23.s, z2.s
	mla	z16.s, p7/m, z26.s, z28.s
	mad	z26.s, p7/m, z27.s, z3.s
	mla	z17.s, p7/m, z13.s, z30.s
	mla	z16.s, p7/m, z12.s, z29.s
	addvl	x0, sp, #16
	mla	z16.s, p7/m, z13.s, z27.s
	mov	z3.s, #-57
	mad	z12.s, p7/m, z3.s, z26.s
	mov	z26.s, #-90
	mad	z13.s, p7/m, z24.s, z12.s
	ld1sh	z7.s, p7/z, [x3]
	mla	z22.s, p7/m, z5.s, z31.s
	mla	z21.s, p7/m, z5.s, z23.s
	mla	z20.s, p7/m, z15.s, z28.s
	mla	z18.s, p7/m, z14.s, z30.s
	mla	z20.s, p7/m, z5.s, z27.s
	mla	z18.s, p7/m, z15.s, z27.s
	mla	z17.s, p7/m, z14.s, z24.s
	mla	z18.s, p7/m, z5.s, z24.s
	mla	z17.s, p7/m, z15.s, z31.s
	mla	z16.s, p7/m, z14.s, z31.s
	mla	z17.s, p7/m, z5.s, z29.s
	mad	z14.s, p7/m, z29.s, z13.s
	mla	z16.s, p7/m, z15.s, z0.s
	mov	z25.s, #87
	add	x0, x0, 64
	mla	z16.s, p7/m, z5.s, z25.s
	mad	z15.s, p7/m, z25.s, z14.s
	mov	z13.s, #50
	mad	z5.s, p7/m, z26.s, z15.s
	mov	z26.s, #-18
	mov	z12.s, #18
	movprfx	z14, z8
	mul	z14.s, p7/m, z14.s, z1.s
	mov	z2.s, #-50
	mla	z14.s, p7/m, z9.s, z26.s
	movprfx	z15, z8
	mul	z15.s, z15.s, #89
	mov	z26.s, #-89
	mla	z15.s, p7/m, z9.s, z1.s
	mla	z14.s, p7/m, z11.s, z26.s
	mla	z15.s, p7/m, z11.s, z13.s
	mla	z14.s, p7/m, z7.s, z2.s
	mla	z15.s, p7/m, z7.s, z12.s
	movprfx	z13, z8
	mul	z13.s, z13.s, #50
	mul	z8.s, p7/m, z8.s, z12.s
	mla	z13.s, p7/m, z9.s, z26.s
	mad	z9.s, p7/m, z2.s, z8.s
	mla	z13.s, p7/m, z11.s, z12.s
	mad	z11.s, p7/m, z1.s, z9.s
	mla	z13.s, p7/m, z7.s, z1.s
	mla	z11.s, p7/m, z7.s, z26.s
	ldr	z7, [x0]
	add	x0, sp, 64
	lsl	z26.s, z7.s, #6
	mov	z9.s, #-64
	mov	z7.s, #36
	movprfx	z12, z10
	mul	z12.s, z12.s, #83
	mov	z3.s, #-83
	mla	z12.s, p7/m, z6.s, z7.s
	mul	z10.s, p7/m, z10.s, z7.s
	mov	z2.s, #64
	mla	z10.s, p7/m, z6.s, z3.s
	mad	z2.s, p7/m, z4.s, z26.s
	mla	z26.s, p7/m, z4.s, z9.s
	add	z6.s, z2.s, z12.s
	add	z4.s, z6.s, z15.s
	sub	z6.s, z6.s, z15.s
	add	z0.s, z6.s, z5.s
	sub	z6.s, z6.s, z5.s
	ldr	z5, [x0]
	addvl	x0, sp, #1
	add	z7.s, z26.s, z10.s
	sub	z2.s, z2.s, z12.s
	add	x0, x0, 64
	add	z8.s, z2.s, z11.s
	sub	z26.s, z26.s, z10.s
	sub	z2.s, z2.s, z11.s
	add	z10.s, z4.s, z22.s
	sub	z4.s, z4.s, z22.s
	sqrshrnb	z22.h, z5.s, #7
	ldr	z5, [x0]
	uzp1	z22.h, z22.h, z22.h
	addvl	x0, sp, #2
	add	z3.s, z7.s, z14.s
	sqrshrnb	z10.h, z10.s, #7
	sub	z7.s, z7.s, z14.s
	add	x0, x0, 64
	add	z14.s, z2.s, z18.s
	uzp1	z10.h, z10.h, z10.h
	sub	z18.s, z2.s, z18.s
	movprfx	z2, z22
	splice	z2.h, p6, z2.h, z10.h
	sqrshrnb	z22.h, z5.s, #7
	uzp1	z22.h, z22.h, z22.h
	add	z11.s, z3.s, z21.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	movprfx	z5, z22
	splice	z5.h, p6, z5.h, z11.h
	ldr	z22, [x0]
	addvl	x0, sp, #3
	add	z9.s, z26.s, z13.s
	add	x0, x0, 64
	sub	z26.s, z26.s, z13.s
	add	z15.s, z26.s, z17.s
	sub	z26.s, z26.s, z17.s
	sqrshrnb	z17.h, z22.s, #7
	ldr	z22, [x0]
	addvl	x0, sp, #4
	add	z12.s, z9.s, z20.s
	sub	z20.s, z9.s, z20.s
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z13.s, z8.s, z19.s
	addvl	x0, sp, #5
	sqrshrnb	z13.h, z13.s, #7
	sqrshrnb	z14.h, z14.s, #7
	add	x0, x0, 64
	uzp1	z13.h, z13.h, z13.h
	uzp1	z14.h, z14.h, z14.h
	add	z25.s, z7.s, z16.s
	sub	z7.s, z7.s, z16.s
	sqrshrnb	z16.h, z22.s, #7
	uzp1	z16.h, z16.h, z16.h
	splice	z16.h, p6, z16.h, z13.h
	sqrshrnb	z13.h, z9.s, #7
	uzp1	z13.h, z13.h, z13.h
	splice	z13.h, p6, z13.h, z14.h
	ldr	z14, [x0]
	addvl	x0, sp, #6
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	add	x0, x0, 64
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	splice	z14.h, p6, z14.h, z15.h
	ldr	z15, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 64
	sqrshrnb	z22.h, z25.s, #7
	uzp1	z22.h, z22.h, z22.h
	sqrshrnb	z12.h, z12.s, #7
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z12.h, z12.h, z12.h
	uzp1	z15.h, z15.h, z15.h
	splice	z15.h, p6, z15.h, z22.h
	ldr	z22, [x0]
	addvl	x0, sp, #8
	uzp1	z17.h, z17.h, z17.h
	splice	z17.h, p6, z17.h, z12.h
	add	x0, x0, 64
	sqrshrnb	z12.h, z22.s, #7
	sqrshrnb	z22.h, z0.s, #7
	uzp1	z22.h, z22.h, z22.h
	uzp1	z12.h, z12.h, z12.h
	splice	z12.h, p6, z12.h, z22.h
	ldr	z22, [x0]
	addvl	x0, sp, #9
	sqrshrnb	z6.h, z6.s, #7
	add	x0, x0, 64
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z11.h, z22.s, #7
	uzp1	z11.h, z11.h, z11.h
	splice	z11.h, p6, z11.h, z6.h
	ldr	z6, [x0]
	addvl	x0, sp, #10
	sqrshrnb	z10.h, z6.s, #7
	sub	z19.s, z8.s, z19.s
	add	x0, x0, 64
	ldr	z6, [x0]
	sqrshrnb	z9.h, z6.s, #7
	addvl	x0, sp, #11
	sqrshrnb	z18.h, z18.s, #7
	uzp1	z18.h, z18.h, z18.h
	add	x0, x0, 64
	ldr	z6, [x0]
	sqrshrnb	z8.h, z6.s, #7
	addvl	x0, sp, #12
	uzp1	z8.h, z8.h, z8.h
	splice	z8.h, p6, z8.h, z18.h
	add	x0, x0, 64
	ldr	z6, [x0]
	sqrshrnb	z18.h, z6.s, #7
	addvl	x0, sp, #13
	sqrshrnb	z7.h, z7.s, #7
	sqrshrnb	z26.h, z26.s, #7
	add	x0, x0, 64
	ldr	z6, [x0]
	sqrshrnb	z22.h, z6.s, #7
	addvl	x0, sp, #14
	uzp1	z7.h, z7.h, z7.h
	uzp1	z26.h, z26.h, z26.h
	add	x0, x0, 64
	ldr	z6, [x0]
	sqrshrnb	z19.h, z19.s, #7
	addvl	x0, sp, #15
	uzp1	z19.h, z19.h, z19.h
	sqrshrnb	z20.h, z20.s, #7
	add	x0, x0, 64
	uzp1	z20.h, z20.h, z20.h
	uzp1	z10.h, z10.h, z10.h
	uzp1	z9.h, z9.h, z9.h
	splice	z10.h, p6, z10.h, z7.h
	splice	z9.h, p6, z9.h, z26.h
	uzp1	z18.h, z18.h, z18.h
	zip1	z7.h, z17.h, z9.h
	splice	z18.h, p6, z18.h, z19.h
	zip2	z9.h, z17.h, z9.h
	zip1	z19.h, z5.h, z10.h
	zip1	z17.h, z16.h, z8.h
	zip2	z10.h, z5.h, z10.h
	sqrshrnb	z26.h, z6.s, #7
	ldr	z6, [x0]
	uzp1	z22.h, z22.h, z22.h
	addvl	x0, sp, #17
	splice	z22.h, p6, z22.h, z20.h
	zip1	z20.h, z2.h, z11.h
	zip2	z11.h, z2.h, z11.h
	zip2	z8.h, z16.h, z8.h
	add	x0, x0, 64
	zip1	z16.h, z13.h, z18.h
	sub	z3.s, z3.s, z21.s
	zip2	z18.h, z13.h, z18.h
	sqrshrnb	z21.h, z6.s, #7
	zip1	z13.h, z14.h, z22.h
	sqrshrnb	z3.h, z3.s, #7
	zip2	z22.h, z14.h, z22.h
	uzp1	z3.h, z3.h, z3.h
	uzp1	z26.h, z26.h, z26.h
	sqrshrnb	z4.h, z4.s, #7
	splice	z26.h, p6, z26.h, z3.h
	uzp1	z4.h, z4.h, z4.h
	zip1	z14.h, z15.h, z26.h
	uzp1	z21.h, z21.h, z21.h
	zip2	z26.h, z15.h, z26.h
	splice	z21.h, p6, z21.h, z4.h
	zip1	z15.h, z12.h, z21.h
	zip2	z21.h, z12.h, z21.h
	zip1	z12.h, z20.h, z16.h
	zip2	z16.h, z20.h, z16.h
	zip1	z20.h, z19.h, z13.h
	zip2	z13.h, z19.h, z13.h
	zip1	z19.h, z7.h, z14.h
	zip2	z14.h, z7.h, z14.h
	zip1	z7.h, z17.h, z15.h
	zip2	z15.h, z17.h, z15.h
	zip1	z17.h, z11.h, z18.h
	zip2	z18.h, z11.h, z18.h
	zip1	z11.h, z10.h, z22.h
	zip2	z22.h, z10.h, z22.h
	zip1	z10.h, z9.h, z26.h
	zip2	z26.h, z9.h, z26.h
	zip1	z9.h, z8.h, z21.h
	zip2	z21.h, z8.h, z21.h
	zip1	z8.h, z12.h, z19.h
	zip2	z19.h, z12.h, z19.h
	zip1	z12.h, z20.h, z7.h
	zip2	z7.h, z20.h, z7.h
	zip1	z20.h, z16.h, z14.h
	zip2	z14.h, z16.h, z14.h
	zip1	z16.h, z13.h, z15.h
	zip2	z15.h, z13.h, z15.h
	zip1	z13.h, z17.h, z10.h
	zip2	z10.h, z17.h, z10.h
	zip1	z17.h, z11.h, z9.h
	zip2	z9.h, z11.h, z9.h
	zip1	z11.h, z18.h, z26.h
	zip2	z26.h, z18.h, z26.h
	zip1	z18.h, z22.h, z21.h
	zip2	z22.h, z22.h, z21.h
	zip1	z21.h, z8.h, z12.h
	st1h	z21.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 96
	zip2	z8.h, z8.h, z12.h
	st1h	z8.h, p7, [x0]
	addvl	x0, sp, #17
	zip1	z21.h, z19.h, z7.h
	zip2	z19.h, z19.h, z7.h
	add	x0, x0, 128
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z20.h, z16.h
	addvl	x0, sp, #17
	zip2	z20.h, z20.h, z16.h
	mov	z25.s, #87
	add	x0, x0, 160
	st1h	z19.h, p7, [x0]
	mov	z19.s, #25
	addvl	x0, sp, #17
	add	x0, x0, 192
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z14.h, z15.h
	addvl	x0, sp, #17
	zip2	z14.h, z14.h, z15.h
	add	x0, x0, 224
	st1h	z20.h, p7, [x0]
	mov	z20.s, #-70
	addvl	x0, sp, #17
	add	x0, x0, 256
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z13.h, z17.h
	addvl	x0, sp, #17
	zip2	z13.h, z13.h, z17.h
	mov	z17.s, #57
	add	x0, x0, 288
	st1h	z14.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 320
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z10.h, z9.h
	addvl	x0, sp, #17
	zip2	z10.h, z10.h, z9.h
	add	x0, x0, 352
	st1h	z13.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 384
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z11.h, z18.h
	addvl	x0, sp, #17
	zip2	z11.h, z11.h, z18.h
	mov	z18.s, #-43
	add	x0, x0, 416
	st1h	z10.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 448
	st1h	z21.h, p7, [x0]
	zip1	z21.h, z26.h, z22.h
	addvl	x0, sp, #17
	zip2	z26.h, z26.h, z22.h
	mov	z22.s, #80
	add	x0, x0, 480
	st1h	z11.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 512
	st1h	z21.h, p7, [x0]
	mov	z21.s, #-90
	addvl	x0, sp, #17
	add	x0, x0, 544
	st1h	z26.h, p7, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	ld1sh	z0.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 96
	ld1sh	z10.s, p7/z, [x0]
	movprfx	z26, z10
	mul	z26.s, p7/m, z26.s, z28.s
	addvl	x0, sp, #17
	add	x0, x0, 128
	ld1sh	z5.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 160
	ld1sh	z11.s, p7/z, [x0]
	mla	z26.s, p7/m, z11.s, z25.s
	addvl	x0, sp, #17
	add	x0, x0, 192
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 224
	ld1sh	z12.s, p7/z, [x0]
	mla	z26.s, p7/m, z12.s, z22.s
	addvl	x0, sp, #17
	movprfx	z22, z10
	mul	z22.s, p7/m, z22.s, z25.s
	mov	z25.d, z21.d
	add	x0, x0, 256
	ld1sh	z6.s, p7/z, [x0]
	mla	z22.s, p7/m, z11.s, z17.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z12.s, z31.s
	add	x0, x0, 288
	ld1sh	z13.s, p7/z, [x0]
	mla	z26.s, p7/m, z13.s, z24.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z13.s, z18.s
	add	x0, x0, 320
	ld1sh	z2.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 352
	ld1sh	z14.s, p7/z, [x0]
	mla	z26.s, p7/m, z14.s, z17.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z14.s, z29.s
	add	x0, x0, 384
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 416
	ld1sh	z15.s, p7/z, [x0]
	mla	z26.s, p7/m, z15.s, z27.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z15.s, z21.s
	movprfx	z21, z10
	mul	z21.s, z21.s, #80
	add	x0, x0, 448
	ld1sh	z3.s, p7/z, [x0]
	mla	z21.s, p7/m, z11.s, z31.s
	addvl	x0, sp, #17
	mla	z21.s, p7/m, z12.s, z20.s
	mla	z21.s, p7/m, z13.s, z30.s
	add	x0, x0, 480
	ld1sh	z16.s, p7/z, [x0]
	mla	z21.s, p7/m, z14.s, z23.s
	addvl	x0, sp, #17
	mla	z26.s, p7/m, z16.s, z19.s
	mla	z22.s, p7/m, z16.s, z20.s
	add	x0, x0, 512
	mla	z21.s, p7/m, z15.s, z17.s
	ld1sh	z4.s, p7/z, [x0]
	movprfx	z20, z10
	mul	z20.s, p7/m, z20.s, z24.s
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
	mla	z19.s, p7/m, z12.s, z23.s
	mla	z19.s, p7/m, z13.s, z28.s
	mla	z19.s, p7/m, z14.s, z18.s
	movprfx	z18, z10
	mul	z18.s, p7/m, z18.s, z27.s
	mla	z18.s, p7/m, z11.s, z25.s
	mov	z25.s, #57
	mla	z18.s, p7/m, z12.s, z25.s
	mla	z18.s, p7/m, z13.s, z17.s
	mov	z25.s, #-70
	movprfx	z17, z10
	mul	z17.s, z17.s, #25
	mul	z10.s, p7/m, z10.s, z31.s
	mla	z17.s, p7/m, z11.s, z25.s
	mad	z11.s, p7/m, z23.s, z10.s
	mla	z19.s, p7/m, z15.s, z30.s
	mla	z18.s, p7/m, z14.s, z30.s
	mla	z17.s, p7/m, z12.s, z28.s
	mla	z18.s, p7/m, z15.s, z24.s
	mad	z12.s, p7/m, z27.s, z11.s
	mla	z17.s, p7/m, z13.s, z29.s
	mov	z25.s, #-57
	mla	z17.s, p7/m, z14.s, z27.s
	mov	z11.s, #-57
	mla	z17.s, p7/m, z15.s, z31.s
	mad	z13.s, p7/m, z11.s, z12.s
	mad	z14.s, p7/m, z24.s, z13.s
	mad	z15.s, p7/m, z29.s, z14.s
	mla	z21.s, p7/m, z16.s, z28.s
	mla	z19.s, p7/m, z16.s, z27.s
	mla	z18.s, p7/m, z16.s, z31.s
	mla	z17.s, p7/m, z16.s, z25.s
	mov	z13.s, #50
	mov	z25.s, #87
	mad	z16.s, p7/m, z25.s, z15.s
	mov	z15.s, #-90
	mla	z22.s, p7/m, z8.s, z23.s
	mla	z19.s, p7/m, z8.s, z24.s
	mla	z18.s, p7/m, z8.s, z29.s
	mla	z26.s, p7/m, z8.s, z31.s
	mla	z21.s, p7/m, z8.s, z27.s
	mla	z17.s, p7/m, z8.s, z25.s
	mla	z16.s, p7/m, z8.s, z15.s
	mov	z12.s, #18
	movprfx	z14, z5
	mul	z14.s, p7/m, z14.s, z1.s
	mov	z11.s, #-89
	mov	z10.s, #-50
	movprfx	z15, z5
	mul	z15.s, z15.s, #89
	mov	z8.s, #-18
	mla	z15.s, p7/m, z6.s, z1.s
	mla	z14.s, p7/m, z6.s, z8.s
	mla	z15.s, p7/m, z9.s, z13.s
	movprfx	z13, z5
	mul	z13.s, z13.s, #50
	mul	z5.s, p7/m, z5.s, z12.s
	mla	z13.s, p7/m, z6.s, z11.s
	mad	z6.s, p7/m, z10.s, z5.s
	mla	z15.s, p7/m, z4.s, z12.s
	mla	z14.s, p7/m, z9.s, z11.s
	mla	z13.s, p7/m, z9.s, z12.s
	mla	z14.s, p7/m, z4.s, z10.s
	mla	z13.s, p7/m, z4.s, z1.s
	mad	z9.s, p7/m, z1.s, z6.s
	add	x0, sp, 64
	mla	z9.s, p7/m, z4.s, z11.s
	lsl	z6.s, z0.s, #6
	mov	z4.s, #-64
	mov	z11.s, #-83
	mov	z12.s, #64
	mad	z12.s, p7/m, z2.s, z6.s
	mla	z6.s, p7/m, z2.s, z4.s
	movprfx	z8, z7
	mul	z8.s, z8.s, #83
	mov	z2.s, #36
	mul	z7.s, p7/m, z7.s, z2.s
	mla	z7.s, p7/m, z3.s, z11.s
	add	z11.s, z6.s, z7.s
	sub	z7.s, z6.s, z7.s
	add	z6.s, z11.s, z14.s
	sub	z11.s, z11.s, z14.s
	add	z14.s, z6.s, z22.s
	str	z14, [x0]
	addvl	x0, sp, #1
	mla	z8.s, p7/m, z3.s, z2.s
	add	x0, x0, 64
	add	z5.s, z7.s, z13.s
	add	z10.s, z12.s, z8.s
	sub	z12.s, z12.s, z8.s
	add	z4.s, z12.s, z9.s
	sub	z12.s, z12.s, z9.s
	add	z9.s, z5.s, z21.s
	str	z9, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 64
	add	z8.s, z10.s, z15.s
	sub	z10.s, z10.s, z15.s
	add	z15.s, z4.s, z20.s
	str	z15, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	add	z14.s, z12.s, z19.s
	str	z14, [x0]
	addvl	x0, sp, #4
	sub	z7.s, z7.s, z13.s
	add	z2.s, z7.s, z18.s
	add	x0, x0, 64
	str	z2, [x0]
	add	z3.s, z11.s, z17.s
	addvl	x0, sp, #5
	add	z15.s, z10.s, z16.s
	sub	z16.s, z10.s, z16.s
	add	x0, x0, 64
	str	z3, [x0]
	sub	z17.s, z11.s, z17.s
	addvl	x0, sp, #6
	sub	z7.s, z7.s, z18.s
	sub	z12.s, z12.s, z19.s
	add	x0, x0, 64
	str	z15, [x0]
	sub	z4.s, z4.s, z20.s
	addvl	x0, sp, #7
	sub	z21.s, z5.s, z21.s
	sub	z6.s, z6.s, z22.s
	add	x0, x0, 64
	str	z16, [x0]
	add	z0.s, z8.s, z26.s
	addvl	x0, sp, #8
	sub	z26.s, z8.s, z26.s
	mov	z20.s, #-70
	add	x0, x0, 64
	str	z17, [x0]
	mov	z22.s, #80
	addvl	x0, sp, #9
	mov	z19.s, #25
	mov	z5.s, #-43
	add	x0, x0, 64
	str	z7, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 64
	str	z12, [x0]
	addvl	x0, sp, #11
	add	x0, x0, 64
	str	z4, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 64
	str	z21, [x0]
	mov	z21.s, #-90
	addvl	x0, sp, #13
	add	x0, x0, 64
	str	z6, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	str	z26, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 80
	ld1sh	z2.s, p7/z, [x0]
	lsl	z2.s, z2.s, #6
	addvl	x0, sp, #17
	add	x0, x0, 112
	ld1sh	z12.s, p7/z, [x0]
	movprfx	z26, z12
	mul	z26.s, p7/m, z26.s, z28.s
	addvl	x0, sp, #17
	add	x0, x0, 144
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 176
	ld1sh	z13.s, p7/z, [x0]
	mla	z26.s, p7/m, z13.s, z25.s
	addvl	x0, sp, #17
	mov	z25.s, #57
	add	x0, x0, 208
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 240
	ld1sh	z14.s, p7/z, [x0]
	mla	z26.s, p7/m, z14.s, z22.s
	addvl	x0, sp, #17
	movprfx	z22, z12
	mul	z22.s, z22.s, #87
	mla	z22.s, p7/m, z13.s, z25.s
	add	x0, x0, 272
	ld1sh	z8.s, p7/z, [x0]
	mla	z22.s, p7/m, z14.s, z31.s
	addvl	x0, sp, #17
	add	x0, x0, 304
	ld1sh	z15.s, p7/z, [x0]
	mla	z26.s, p7/m, z15.s, z24.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z15.s, z5.s
	add	x0, x0, 336
	ld1sh	z3.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 368
	ld1sh	z16.s, p7/z, [x0]
	mla	z26.s, p7/m, z16.s, z25.s
	addvl	x0, sp, #17
	mla	z22.s, p7/m, z16.s, z29.s
	mov	z25.d, z21.d
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
	ld1sh	z4.s, p7/z, [x0]
	mla	z21.s, p7/m, z14.s, z20.s
	addvl	x0, sp, #17
	mla	z26.s, p7/m, z17.s, z27.s
	mla	z21.s, p7/m, z15.s, z30.s
	add	x0, x0, 496
	ld1sh	z18.s, p7/z, [x0]
	mla	z22.s, p7/m, z18.s, z20.s
	addvl	x0, sp, #17
	mov	z20.s, #57
	mla	z26.s, p7/m, z18.s, z19.s
	add	x0, x0, 528
	mla	z21.s, p7/m, z16.s, z23.s
	ld1sh	z6.s, p7/z, [x0]
	mla	z21.s, p7/m, z17.s, z20.s
	addvl	x0, sp, #17
	movprfx	z20, z12
	mul	z20.s, p7/m, z20.s, z24.s
	mla	z20.s, p7/m, z13.s, z5.s
	mov	z5.s, #-9
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
	mla	z19.s, p7/m, z14.s, z23.s
	mla	z19.s, p7/m, z15.s, z28.s
	mla	z19.s, p7/m, z16.s, z5.s
	movprfx	z5, z12
	mul	z5.s, p7/m, z5.s, z27.s
	mla	z5.s, p7/m, z13.s, z25.s
	mov	z25.s, #57
	mad	z25.s, p7/m, z14.s, z5.s
	mov	z5.s, #25
	mla	z25.s, p7/m, z15.s, z5.s
	mla	z19.s, p7/m, z17.s, z30.s
	mad	z30.s, p7/m, z16.s, z25.s
	movprfx	z25, z12
	mul	z25.s, p7/m, z25.s, z5.s
	mov	z5.s, #-70
	mla	z25.s, p7/m, z13.s, z5.s
	mla	z21.s, p7/m, z18.s, z28.s
	mad	z28.s, p7/m, z14.s, z25.s
	mov	z25.s, #-90
	mla	z28.s, p7/m, z15.s, z29.s
	mla	z28.s, p7/m, z16.s, z27.s
	mla	z26.s, p7/m, z10.s, z31.s
	mla	z21.s, p7/m, z10.s, z27.s
	mla	z19.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z17.s, z24.s
	mov	z5.s, #-57
	mla	z30.s, p7/m, z18.s, z31.s
	mul	z12.s, z12.s, #9
	mad	z31.s, p7/m, z17.s, z28.s
	mad	z13.s, p7/m, z23.s, z12.s
	mla	z31.s, p7/m, z18.s, z5.s
	mad	z14.s, p7/m, z27.s, z13.s
	mov	z28.s, #87
	mad	z15.s, p7/m, z5.s, z14.s
	mov	z27.s, #-18
	mad	z16.s, p7/m, z24.s, z15.s
	mad	z17.s, p7/m, z29.s, z16.s
	mad	z18.s, p7/m, z28.s, z17.s
	mla	z18.s, p7/m, z10.s, z25.s
	mov	z25.s, #18
	mla	z30.s, p7/m, z10.s, z29.s
	mla	z31.s, p7/m, z10.s, z28.s
	mla	z22.s, p7/m, z10.s, z23.s
	movprfx	z28, z7
	mul	z28.s, p7/m, z28.s, z1.s
	mov	z23.s, #-89
	mla	z28.s, p7/m, z8.s, z27.s
	mov	z13.s, #50
	movprfx	z29, z7
	mul	z29.s, z29.s, #89
	movprfx	z27, z7
	mul	z27.s, p7/m, z27.s, z13.s
	mla	z29.s, p7/m, z8.s, z1.s
	mla	z27.s, p7/m, z8.s, z23.s
	mla	z29.s, p7/m, z11.s, z13.s
	mla	z27.s, p7/m, z11.s, z25.s
	mla	z29.s, p7/m, z6.s, z25.s
	mul	z7.s, p7/m, z7.s, z25.s
	mov	z25.s, #-64
	mla	z19.s, p7/m, z10.s, z24.s
	add	x0, sp, 64
	mov	z24.s, #-50
	mov	z14.s, #64
	mad	z8.s, p7/m, z24.s, z7.s
	mad	z14.s, p7/m, z3.s, z2.s
	mov	z7.s, #36
	mla	z2.s, p7/m, z3.s, z25.s
	movprfx	z25, z9
	mul	z25.s, z25.s, #83
	mov	z3.s, #-83
	mul	z9.s, p7/m, z9.s, z7.s
	mla	z9.s, p7/m, z4.s, z3.s
	add	z15.s, z2.s, z9.s
	mla	z27.s, p7/m, z6.s, z1.s
	mla	z25.s, p7/m, z4.s, z7.s
	mla	z28.s, p7/m, z11.s, z23.s
	sub	z2.s, z2.s, z9.s
	mla	z28.s, p7/m, z6.s, z24.s
	mad	z11.s, p7/m, z1.s, z8.s
	add	z24.s, z15.s, z28.s
	mla	z11.s, p7/m, z6.s, z23.s
	sub	z28.s, z15.s, z28.s
	add	z23.s, z2.s, z27.s
	sub	z2.s, z2.s, z27.s
	add	z15.s, z2.s, z30.s
	sub	z2.s, z2.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #1
	add	z16.s, z14.s, z25.s
	add	x0, x0, 64
	sub	z14.s, z14.s, z25.s
	add	z25.s, z16.s, z29.s
	add	z9.s, z25.s, z26.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sub	z29.s, z16.s, z29.s
	add	z16.s, z28.s, z31.s
	sub	z28.s, z28.s, z31.s
	sqrshrnb	z31.h, z0.s, #12
	uzp1	z31.h, z31.h, z31.h
	splice	z31.h, p6, z31.h, z9.h
	ldr	z9, [x0]
	addvl	x0, sp, #2
	sub	z25.s, z25.s, z26.s
	add	x0, x0, 64
	sqrshrnb	z26.h, z30.s, #12
	ldr	z30, [x0]
	addvl	x0, sp, #3
	add	z17.s, z14.s, z11.s
	add	z13.s, z17.s, z20.s
	add	x0, x0, 64
	sub	z17.s, z17.s, z20.s
	sqrshrnb	z20.h, z30.s, #12
	ldr	z30, [x0]
	addvl	x0, sp, #4
	add	z27.s, z29.s, z18.s
	add	x0, x0, 64
	sub	z29.s, z29.s, z18.s
	sqrshrnb	z18.h, z30.s, #12
	ldr	z30, [x0]
	addvl	x0, sp, #5
	sub	z11.s, z14.s, z11.s
	add	x0, x0, 64
	ldr	z3, [x0]
	add	z14.s, z11.s, z19.s
	addvl	x0, sp, #6
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	add	x0, x0, 64
	uzp1	z18.h, z18.h, z18.h
	splice	z18.h, p6, z18.h, z14.h
	sqrshrnb	z14.h, z30.s, #12
	ldr	z30, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 64
	sqrshrnb	z15.h, z15.s, #12
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z15.h, z15.h, z15.h
	uzp1	z16.h, z16.h, z16.h
	uzp1	z14.h, z14.h, z14.h
	splice	z14.h, p6, z14.h, z15.h
	sqrshrnb	z15.h, z3.s, #12
	uzp1	z15.h, z15.h, z15.h
	splice	z15.h, p6, z15.h, z16.h
	ldr	z16, [x0]
	addvl	x0, sp, #8
	add	x0, x0, 64
	sub	z11.s, z11.s, z19.s
	sqrshrnb	z19.h, z30.s, #12
	ldr	z30, [x0]
	addvl	x0, sp, #9
	add	z12.s, z23.s, z21.s
	add	x0, x0, 64
	ldr	z7, [x0]
	sqrshrnb	z12.h, z12.s, #12
	addvl	x0, sp, #10
	uzp1	z12.h, z12.h, z12.h
	add	z10.s, z24.s, z22.s
	add	x0, x0, 64
	sub	z24.s, z24.s, z22.s
	sqrshrnb	z22.h, z9.s, #12
	uzp1	z22.h, z22.h, z22.h
	splice	z22.h, p6, z22.h, z12.h
	ldr	z12, [x0]
	addvl	x0, sp, #11
	sqrshrnb	z27.h, z27.s, #12
	sqrshrnb	z28.h, z28.s, #12
	add	x0, x0, 64
	ldr	z4, [x0]
	uzp1	z27.h, z27.h, z27.h
	addvl	x0, sp, #12
	uzp1	z28.h, z28.h, z28.h
	uzp1	z19.h, z19.h, z19.h
	add	x0, x0, 64
	splice	z19.h, p6, z19.h, z27.h
	sqrshrnb	z27.h, z30.s, #12
	uzp1	z27.h, z27.h, z27.h
	splice	z27.h, p6, z27.h, z28.h
	ldr	z28, [x0]
	addvl	x0, sp, #13
	sub	z23.s, z23.s, z21.s
	sqrshrnb	z29.h, z29.s, #12
	add	x0, x0, 64
	ldr	z6, [x0]
	uzp1	z29.h, z29.h, z29.h
	addvl	x0, sp, #14
	sqrshrnb	z28.h, z28.s, #12
	sqrshrnb	z23.h, z23.s, #12
	uzp1	z28.h, z28.h, z28.h
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z24.h, z24.s, #12
	splice	z28.h, p6, z28.h, z23.h
	uzp1	z24.h, z24.h, z24.h
	add	x0, x0, 64
	sqrshrnb	z21.h, z16.s, #12
	sqrshrnb	z30.h, z12.s, #12
	sqrshrnb	z16.h, z4.s, #12
	sqrshrnb	z1.h, z6.s, #12
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z26.h, z26.h, z26.h
	uzp1	z10.h, z10.h, z10.h
	sqrshrnb	z13.h, z13.s, #12
	splice	z26.h, p6, z26.h, z10.h
	uzp1	z13.h, z13.h, z13.h
	uzp1	z20.h, z20.h, z20.h
	uzp1	z21.h, z21.h, z21.h
	splice	z20.h, p6, z20.h, z13.h
	splice	z21.h, p6, z21.h, z29.h
	sqrshrnb	z2.h, z2.s, #12
	zip1	z12.h, z31.h, z21.h
	sqrshrnb	z29.h, z7.s, #12
	zip2	z21.h, z31.h, z21.h
	uzp1	z2.h, z2.h, z2.h
	uzp1	z29.h, z29.h, z29.h
	sqrshrnb	z17.h, z17.s, #12
	splice	z29.h, p6, z29.h, z2.h
	uzp1	z17.h, z17.h, z17.h
	zip1	z23.h, z22.h, z29.h
	zip2	z31.h, z22.h, z29.h
	uzp1	z16.h, z16.h, z16.h
	zip1	z22.h, z14.h, z28.h
	splice	z16.h, p6, z16.h, z17.h
	zip2	z14.h, z14.h, z28.h
	uzp1	z1.h, z1.h, z1.h
	sqrshrnb	z25.h, z25.s, #12
	splice	z1.h, p6, z1.h, z24.h
	ldr	z24, [x0]
	uzp1	z25.h, z25.h, z25.h
	sqrshrnb	z0.h, z24.s, #12
	uzp1	z0.h, z0.h, z0.h
	splice	z0.h, p6, z0.h, z25.h
	zip1	z28.h, z19.h, z0.h
	zip1	z24.h, z18.h, z16.h
	zip1	z25.h, z26.h, z27.h
	zip1	z17.h, z12.h, z24.h
	zip2	z18.h, z18.h, z16.h
	zip2	z19.h, z19.h, z0.h
	zip2	z27.h, z26.h, z27.h
	sqrshrnb	z11.h, z11.s, #12
	zip1	z26.h, z15.h, z1.h
	uzp1	z11.h, z11.h, z11.h
	zip2	z15.h, z15.h, z1.h
	uzp1	z30.h, z30.h, z30.h
	splice	z30.h, p6, z30.h, z11.h
	zip1	z29.h, z20.h, z30.h
	zip2	z30.h, z20.h, z30.h
	zip1	z16.h, z29.h, z28.h
	zip1	z20.h, z31.h, z15.h
	zip2	z29.h, z29.h, z28.h
	zip1	z28.h, z30.h, z19.h
	zip2	z30.h, z30.h, z19.h
	zip1	z11.h, z21.h, z18.h
	zip2	z13.h, z21.h, z18.h
	zip2	z12.h, z12.h, z24.h
	zip1	z24.h, z25.h, z22.h
	zip2	z25.h, z25.h, z22.h
	zip1	z22.h, z23.h, z26.h
	zip1	z18.h, z25.h, z29.h
	zip1	z21.h, z17.h, z22.h
	zip2	z25.h, z25.h, z29.h
	zip2	z23.h, z23.h, z26.h
	zip2	z29.h, z11.h, z20.h
	zip1	z26.h, z27.h, z14.h
	zip2	z22.h, z17.h, z22.h
	zip2	z27.h, z27.h, z14.h
	zip1	z17.h, z24.h, z16.h
	zip2	z24.h, z24.h, z16.h
	zip1	z16.h, z11.h, z20.h
	zip1	z20.h, z27.h, z30.h
	zip2	z27.h, z27.h, z30.h
	zip1	z30.h, z21.h, z17.h
	st1h	z30.h, p7, [x1]
	zip2	z21.h, z21.h, z17.h
	st1h	z21.h, p7, [x1, x2, lsl 1]
	add	x0, x1, x2, lsl 2
	zip1	z30.h, z22.h, z24.h
	st1h	z30.h, p7, [x0]
	zip2	z22.h, z22.h, z24.h
	st1h	z22.h, p7, [x0, x2, lsl 1]
	zip2	z31.h, z31.h, z15.h
	add	x0, x0, x2, lsl 2
	zip1	z15.h, z12.h, z23.h
	zip1	z30.h, z15.h, z18.h
	st1h	z30.h, p7, [x0]
	zip2	z24.h, z15.h, z18.h
	st1h	z24.h, p7, [x0, x2, lsl 1]
	zip2	z23.h, z12.h, z23.h
	add	x0, x0, x2, lsl 2
	zip1	z30.h, z23.h, z25.h
	st1h	z30.h, p7, [x0]
	zip1	z19.h, z26.h, z28.h
	zip2	z23.h, z23.h, z25.h
	zip1	z30.h, z16.h, z19.h
	st1h	z23.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip2	z26.h, z26.h, z28.h
	st1h	z30.h, p7, [x0]
	zip2	z30.h, z16.h, z19.h
	zip1	z28.h, z13.h, z31.h
	st1h	z30.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip1	z30.h, z29.h, z26.h
	st1h	z30.h, p7, [x0]
	zip2	z29.h, z29.h, z26.h
	zip1	z30.h, z28.h, z20.h
	st1h	z29.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip2	z28.h, z28.h, z20.h
	st1h	z30.h, p7, [x0]
	zip2	z31.h, z13.h, z31.h
	zip1	z30.h, z31.h, z27.h
	st1h	z28.h, p7, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	zip2	z31.h, z31.h, z27.h
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
