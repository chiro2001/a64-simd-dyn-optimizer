	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_64x16_sve2_vpp
	.type	dynopt_interp8_64x16_sve2_vpp, %function
dynopt_interp8_64x16_sve2_vpp:
.LFB3:
	.cfi_startproc
	addvl	sp, sp, #-20
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xa0,0x1e,0x22
	sub	w5, w4, #1
	sub	sp, sp, #64
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0xa0,0x1e,0x23,0x40,0x22
	stp	d8, d9, [sp]
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
	cmp	w5, 2
	bhi	.L3
	cmp	w4, 1
	beq	.L4
	mov	z30.b, #-1
	mov	z28.h, #4
	cmp	w4, 3
	bne	.L7
	mov	z29.h, #-10
	mov	z27.h, #58
	mov	z26.h, #17
	mov	z24.h, #-5
	mov	z25.h, #1
	movi	d23, #0
	b	.L2
	.p2align 2,,3
.L3:
	mov	z30.b, #-1
	mov	z28.h, #4
.L7:
	mov	z29.h, #-11
	mov	z27.h, #40
	mov	z24.d, z29.d
	mov	z26.d, z27.d
	mov	z25.d, z28.d
	mov	z23.d, z30.d
.L2:
	add	x9, x1, x1, lsl 1
	ptrue	p7.b, all
	lsl	x5, x1, 1
	sub	x4, x0, x9
	add	x7, x1, 16
	ld1b	z15.h, p7/z, [x4, x7]
	add	x6, x4, 16
	ld1b	z9.h, p7/z, [x6]
	add	x7, x1, 32
	add	x6, x4, 32
	ld1b	z12.h, p7/z, [x6]
	ld1b	z13.h, p7/z, [x4, x1]
	add	x6, x4, 48
	ld1b	z11.h, p7/z, [x6]
	ld1b	z14.h, p7/z, [x4, x7]
	add	x6, x4, x1
	ld1b	z1.h, p7/z, [x6, x1]
	ld1b	z10.h, p7/z, [x4]
	add	x6, x5, 16
	ld1b	z3.h, p7/z, [x4, x6]
	add	x7, x1, 48
	add	x6, x5, 32
	add	x5, x5, 48
	ld1b	z31.h, p7/z, [x4, x5]
	addvl	x5, sp, #13
	ld1b	z0.h, p7/z, [x4, x7]
	ld1b	z2.h, p7/z, [x4, x6]
	add	x5, x5, 64
	sub	z31.h, z31.h, #128
	str	z31, [x5]
	add	x5, x0, 16
	ld1b	z4.h, p7/z, [x0]
	ld1b	z6.h, p7/z, [x5]
	lsl	x6, x1, 2
	add	x5, x0, 32
	ld1b	z5.h, p7/z, [x5]
	add	x0, x0, 48
	add	x5, x6, 16
	ld1b	z31.h, p7/z, [x0]
	addvl	x0, sp, #11
	sub	z31.h, z31.h, #128
	sub	z4.h, z4.h, #128
	add	x0, x0, 64
	str	z31, [x0]
	ld1b	z16.h, p7/z, [x4, x5]
	add	x5, x6, 32
	ld1b	z31.h, p7/z, [x4, x5]
	ld1b	z7.h, p7/z, [x4, x6]
	addvl	x5, sp, #7
	sub	z31.h, z31.h, #128
	add	x0, x4, x1, lsl 2
	add	x5, x5, 64
	str	z31, [x5]
	add	x7, x0, x1
	add	x5, x6, 48
	ld1b	z31.h, p7/z, [x4, x5]
	add	x6, x6, x1
	addvl	x5, sp, #6
	sub	z31.h, z31.h, #128
	sub	z7.h, z7.h, #128
	add	x5, x5, 64
	str	z31, [x5]
	ld1b	z17.h, p7/z, [x0, x1]
	add	x5, x6, 16
	ld1b	z18.h, p7/z, [x4, x5]
	add	x0, x0, x1, lsl 1
	add	x5, x6, 32
	ld1b	z31.h, p7/z, [x4, x5]
	sub	z31.h, z31.h, #128
	add	x5, sp, 64
	str	z31, [x5]
	sub	z17.h, z17.h, #128
	add	x5, x6, 48
	ld1b	z31.h, p7/z, [x4, x5]
	sub	z31.h, z31.h, #128
	addvl	x5, sp, #2
	sub	z1.h, z1.h, #128
	sub	z13.h, z13.h, #128
	add	x5, x5, 64
	str	z31, [x5]
	ld1b	z19.h, p7/z, [x1, x7]
	lsl	x5, x9, 1
	sub	z19.h, z19.h, #128
	sub	z10.h, z10.h, #128
	add	x7, x5, 16
	ld1b	z20.h, p7/z, [x4, x7]
	sub	z18.h, z18.h, #128
	add	x7, x5, 32
	ld1b	z31.h, p7/z, [x4, x7]
	sub	z31.h, z31.h, #128
	addvl	x7, sp, #5
	add	x5, x5, 48
	sub	z20.h, z20.h, #128
	add	x7, x7, 64
	str	z31, [x7]
	ld1b	z31.h, p7/z, [x4, x5]
	lsl	x7, x1, 3
	addvl	x5, sp, #4
	sub	z31.h, z31.h, #128
	sub	x11, x7, x1
	add	x5, x5, 64
	str	z31, [x5]
	add	x8, x11, 16
	ld1b	z22.h, p7/z, [x4, x8]
	ld1b	z21.h, p7/z, [x1, x0]
	add	x8, x11, 32
	ld1b	z31.h, p7/z, [x4, x8]
	sub	z31.h, z31.h, #128
	addvl	x8, sp, #8
	add	x5, x1, x0
	sub	z21.h, z21.h, #128
	add	x8, x8, 64
	str	z31, [x8]
	sub	z22.h, z22.h, #128
	add	x8, x11, 48
	ld1b	z31.h, p7/z, [x4, x8]
	sub	z31.h, z31.h, #128
	addvl	x8, sp, #12
	sub	z16.h, z16.h, #128
	sub	z6.h, z6.h, #128
	add	x8, x8, 64
	str	z31, [x8]
	ld1b	z31.h, p7/z, [x1, x5]
	addvl	x5, sp, #1
	sub	z31.h, z31.h, #128
	sub	z3.h, z3.h, #128
	add	x5, x5, 64
	str	z31, [x5]
	sub	z15.h, z15.h, #128
	add	x5, x7, 16
	ld1b	z31.h, p7/z, [x4, x5]
	movprfx	z8, z31
	sub	z8.h, z8.h, #128
	addvl	x5, sp, #10
	sub	z9.h, z9.h, #128
	sub	z2.h, z2.h, #128
	add	x5, x5, 64
	str	z8, [x5]
	sub	z12.h, z12.h, #128
	add	x5, x7, 32
	ld1b	z31.h, p7/z, [x4, x5]
	sub	z31.h, z31.h, #128
	addvl	x5, sp, #9
	sub	z5.h, z5.h, #128
	sub	z14.h, z14.h, #128
	add	x5, x5, 64
	str	z31, [x5]
	sub	z11.h, z11.h, #128
	add	x5, x7, 48
	ld1b	z31.h, p7/z, [x4, x5]
	movprfx	z8, z31
	sub	z8.h, z8.h, #128
	addvl	x5, sp, #3
	mov	z31.h, #4096
	mad	z10.h, p7/m, z23.h, z31.h
	add	x5, x5, 64
	str	z8, [x5]
	mla	z10.h, p7/m, z1.h, z24.h
	addvl	x5, sp, #7
	mla	z10.h, p7/m, z7.h, z27.h
	movprfx	z8, z31
	mla	z8.h, p7/m, z13.h, z25.h
	mla	z10.h, p7/m, z19.h, z28.h
	mla	z8.h, p7/m, z4.h, z26.h
	add	x5, x5, 64
	mla	z8.h, p7/m, z17.h, z29.h
	mla	z8.h, p7/m, z21.h, z30.h
	add	z10.h, z10.h, z8.h
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	mad	z9.h, p7/m, z23.h, z31.h
	movprfx	z8, z31
	mla	z8.h, p7/m, z15.h, z25.h
	mla	z9.h, p7/m, z3.h, z24.h
	mla	z8.h, p7/m, z6.h, z26.h
	mla	z9.h, p7/m, z16.h, z27.h
	mla	z8.h, p7/m, z18.h, z29.h
	mla	z9.h, p7/m, z20.h, z28.h
	mla	z8.h, p7/m, z22.h, z30.h
	add	z9.h, z9.h, z8.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	stp	q10, q9, [x2]
	ldr	z10, [x5]
	addvl	x5, sp, #5
	mad	z12.h, p7/m, z23.h, z31.h
	mla	z12.h, p7/m, z2.h, z24.h
	add	x5, x5, 64
	mla	z12.h, p7/m, z10.h, z27.h
	ldr	z10, [x5]
	add	x5, sp, 64
	ldr	z9, [x5]
	mla	z12.h, p7/m, z10.h, z28.h
	addvl	x5, sp, #8
	movprfx	z10, z31
	mla	z10.h, p7/m, z14.h, z25.h
	mla	z10.h, p7/m, z5.h, z26.h
	add	x5, x5, 64
	ldr	z8, [x5]
	mla	z10.h, p7/m, z9.h, z29.h
	addvl	x5, sp, #13
	mla	z10.h, p7/m, z8.h, z30.h
	add	z12.h, z12.h, z10.h
	add	x5, x5, 64
	ldr	z9, [x5]
	mad	z11.h, p7/m, z23.h, z31.h
	addvl	x5, sp, #6
	mla	z11.h, p7/m, z9.h, z24.h
	add	x7, x7, x1
	add	x5, x5, 64
	ldr	z10, [x5]
	mla	z11.h, p7/m, z10.h, z27.h
	addvl	x5, sp, #4
	sub	z0.h, z0.h, #128
	sqrshrunb	z12.b, z12.h, #6
	add	x5, x5, 64
	ldr	z9, [x5]
	mla	z11.h, p7/m, z9.h, z28.h
	addvl	x5, sp, #11
	movprfx	z10, z31
	mla	z10.h, p7/m, z0.h, z25.h
	uzp1	z12.b, z12.b, z12.b
	add	x5, x5, 64
	ldr	z9, [x5]
	mla	z10.h, p7/m, z9.h, z26.h
	addvl	x5, sp, #2
	add	x0, x0, x1, lsl 1
	mad	z13.h, p7/m, z23.h, z31.h
	add	x5, x5, 64
	ldr	z9, [x5]
	mla	z10.h, p7/m, z9.h, z29.h
	ldr	z9, [x8]
	add	x5, x7, 16
	mla	z10.h, p7/m, z9.h, z30.h
	add	z11.h, z11.h, z10.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	stp	q12, q11, [x2, 32]
	ld1b	z12.h, p7/z, [x1, x0]
	movprfx	z11, z12
	sub	z11.h, z11.h, #128
	ld1b	z12.h, p7/z, [x4, x5]
	add	x5, x7, 32
	movprfx	z9, z12
	sub	z9.h, z9.h, #128
	ld1b	z12.h, p7/z, [x4, x5]
	addvl	x5, sp, #16
	sub	z12.h, z12.h, #128
	add	x5, x5, 64
	str	z12, [x5]
	addvl	x8, sp, #10
	add	x5, x7, 48
	ld1b	z12.h, p7/z, [x4, x5]
	sub	z12.h, z12.h, #128
	addvl	x5, sp, #8
	mla	z13.h, p7/m, z4.h, z24.h
	add	x8, x8, 64
	add	x5, x5, 64
	str	z12, [x5]
	mla	z13.h, p7/m, z17.h, z27.h
	addvl	x5, sp, #1
	mla	z13.h, p7/m, z21.h, z28.h
	movprfx	z12, z31
	mla	z12.h, p7/m, z1.h, z25.h
	add	x5, x5, 64
	ldr	z10, [x5]
	mla	z12.h, p7/m, z7.h, z26.h
	mla	z12.h, p7/m, z19.h, z29.h
	mla	z12.h, p7/m, z10.h, z30.h
	add	z13.h, z13.h, z12.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x2, x3]
	ldr	z12, [x8]
	movprfx	z13, z31
	mla	z13.h, p7/m, z3.h, z25.h
	add	x8, sp, 64
	mla	z13.h, p7/m, z16.h, z26.h
	mla	z13.h, p7/m, z20.h, z29.h
	mla	z13.h, p7/m, z12.h, z30.h
	mad	z15.h, p7/m, z23.h, z31.h
	mla	z15.h, p7/m, z6.h, z24.h
	mla	z15.h, p7/m, z18.h, z27.h
	mla	z15.h, p7/m, z22.h, z28.h
	add	z15.h, z15.h, z13.h
	ldr	z13, [x8]
	addvl	x8, sp, #7
	mov	z10.d, z8.d
	mad	z14.h, p7/m, z23.h, z31.h
	add	x8, x8, 64
	mla	z14.h, p7/m, z5.h, z24.h
	mla	z14.h, p7/m, z13.h, z27.h
	mla	z14.h, p7/m, z8.h, z28.h
	ldr	z8, [x8]
	addvl	x8, sp, #5
	add	x8, x8, 64
	movprfx	z13, z31
	mla	z13.h, p7/m, z2.h, z25.h
	mla	z13.h, p7/m, z8.h, z26.h
	ldr	z8, [x8]
	addvl	x8, sp, #9
	add	x5, x2, x3
	add	x8, x8, 64
	mla	z13.h, p7/m, z8.h, z29.h
	ldr	z8, [x8]
	addvl	x8, sp, #11
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	add	x8, x8, 64
	mla	z13.h, p7/m, z8.h, z30.h
	add	z14.h, z14.h, z13.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	stp	q15, q14, [x5, 16]
	ldr	z15, [x8]
	addvl	x8, sp, #2
	mad	z0.h, p7/m, z23.h, z31.h
	add	x8, x8, 64
	mla	z0.h, p7/m, z15.h, z24.h
	ldr	z15, [x8]
	addvl	x8, sp, #12
	mla	z0.h, p7/m, z15.h, z27.h
	add	x10, x1, x0
	add	x8, x8, 64
	ldr	z15, [x8]
	mla	z0.h, p7/m, z15.h, z28.h
	addvl	x8, sp, #13
	addvl	x13, sp, #7
	mad	z1.h, p7/m, z23.h, z31.h
	add	x8, x8, 64
	ldr	z14, [x8]
	movprfx	z15, z31
	mla	z15.h, p7/m, z14.h, z25.h
	addvl	x8, sp, #6
	mla	z1.h, p7/m, z7.h, z24.h
	mad	z3.h, p7/m, z23.h, z31.h
	add	x8, x8, 64
	ldr	z14, [x8]
	mla	z15.h, p7/m, z14.h, z26.h
	addvl	x8, sp, #4
	mla	z3.h, p7/m, z16.h, z24.h
	mla	z1.h, p7/m, z19.h, z27.h
	add	x8, x8, 64
	ldr	z13, [x8]
	mla	z15.h, p7/m, z13.h, z29.h
	addvl	x8, sp, #3
	mla	z3.h, p7/m, z20.h, z27.h
	add	x13, x13, 64
	add	x8, x8, 64
	ldr	z14, [x8]
	mla	z15.h, p7/m, z14.h, z30.h
	lsl	x8, x6, 1
	add	z0.h, z0.h, z15.h
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x5, 48]
	ld1b	z15.h, p7/z, [x1, x10]
	add	x10, x8, 16
	movprfx	z12, z15
	sub	z12.h, z12.h, #128
	ld1b	z15.h, p7/z, [x4, x10]
	add	x10, x8, 32
	movprfx	z8, z15
	sub	z8.h, z8.h, #128
	ld1b	z15.h, p7/z, [x4, x10]
	add	x10, x8, 48
	movprfx	z0, z15
	sub	z0.h, z0.h, #128
	ld1b	z15.h, p7/z, [x4, x10]
	addvl	x10, sp, #15
	sub	z15.h, z15.h, #128
	mad	z2.h, p7/m, z23.h, z31.h
	add	x10, x10, 64
	str	z15, [x10]
	movprfx	z15, z31
	mla	z15.h, p7/m, z4.h, z25.h
	addvl	x10, sp, #1
	mla	z15.h, p7/m, z17.h, z26.h
	mla	z15.h, p7/m, z21.h, z29.h
	add	x10, x10, 64
	ldr	z14, [x10]
	mla	z15.h, p7/m, z11.h, z30.h
	addvl	x10, sp, #10
	mla	z1.h, p7/m, z14.h, z28.h
	add	z1.h, z1.h, z15.h
	add	x10, x10, 64
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x5, x3]
	ldr	z13, [x10]
	mla	z3.h, p7/m, z13.h, z28.h
	movprfx	z15, z31
	mla	z15.h, p7/m, z6.h, z25.h
	mla	z15.h, p7/m, z18.h, z26.h
	mla	z15.h, p7/m, z22.h, z29.h
	mla	z15.h, p7/m, z9.h, z30.h
	add	z15.h, z3.h, z15.h
	ldr	z3, [x13]
	addvl	x13, sp, #5
	mla	z2.h, p7/m, z3.h, z24.h
	add	x10, x2, x3, lsl 1
	add	x13, x13, 64
	ldr	z3, [x13]
	mla	z2.h, p7/m, z3.h, z27.h
	addvl	x13, sp, #9
	movprfx	z14, z31
	mla	z14.h, p7/m, z5.h, z25.h
	sqrshrunb	z15.b, z15.h, #6
	add	x13, x13, 64
	ldr	z3, [x13]
	mla	z2.h, p7/m, z3.h, z28.h
	add	x13, sp, 64
	ldr	z1, [x13]
	mla	z14.h, p7/m, z1.h, z26.h
	addvl	x13, sp, #16
	mla	z14.h, p7/m, z10.h, z29.h
	uzp1	z15.b, z15.b, z15.b
	add	x13, x13, 64
	ldr	z1, [x13]
	mla	z14.h, p7/m, z1.h, z30.h
	addvl	x13, sp, #13
	add	z2.h, z2.h, z14.h
	sqrshrunb	z2.b, z2.h, #6
	add	x13, x13, 64
	uzp1	z2.b, z2.b, z2.b
	stp	q15, q2, [x10, 16]
	ldr	z2, [x13]
	addvl	x13, sp, #6
	mov	z13.d, z10.d
	add	x13, x13, 64
	ldr	z10, [x13]
	movprfx	z15, z31
	mla	z15.h, p7/m, z2.h, z23.h
	addvl	x13, sp, #4
	mla	z15.h, p7/m, z10.h, z24.h
	add	x8, x8, x1
	add	x13, x13, 64
	ldr	z10, [x13]
	mla	z15.h, p7/m, z10.h, z27.h
	addvl	x13, sp, #3
	add	x0, x0, x1, lsl 1
	mad	z4.h, p7/m, z23.h, z31.h
	add	x13, x13, 64
	ldr	z1, [x13]
	mla	z15.h, p7/m, z1.h, z28.h
	addvl	x13, sp, #11
	add	x12, x5, x3
	mla	z4.h, p7/m, z17.h, z24.h
	add	x13, x13, 64
	ldr	z2, [x13]
	movprfx	z14, z31
	mla	z14.h, p7/m, z2.h, z25.h
	addvl	x13, sp, #2
	add	x14, sp, 64
	mla	z4.h, p7/m, z21.h, z27.h
	add	x13, x13, 64
	ldr	z2, [x13]
	mla	z14.h, p7/m, z2.h, z26.h
	addvl	x13, sp, #12
	mla	z4.h, p7/m, z11.h, z28.h
	mad	z6.h, p7/m, z23.h, z31.h
	add	x13, x13, 64
	ldr	z2, [x13]
	mla	z14.h, p7/m, z2.h, z29.h
	addvl	x13, sp, #8
	mla	z6.h, p7/m, z18.h, z24.h
	mla	z6.h, p7/m, z22.h, z27.h
	add	x13, x13, 64
	ldr	z10, [x13]
	mla	z14.h, p7/m, z10.h, z30.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x10, 48]
	add	x10, x8, 16
	ld1b	z15.h, p7/z, [x1, x0]
	movprfx	z10, z15
	sub	z10.h, z10.h, #128
	ld1b	z15.h, p7/z, [x4, x10]
	add	x10, x8, 32
	movprfx	z3, z15
	sub	z3.h, z3.h, #128
	ld1b	z15.h, p7/z, [x4, x10]
	add	x10, x8, 48
	movprfx	z1, z15
	sub	z1.h, z1.h, #128
	ld1b	z15.h, p7/z, [x4, x10]
	addvl	x10, sp, #14
	add	x10, x10, 64
	sub	z15.h, z15.h, #128
	str	z15, [x10]
	addvl	x10, sp, #1
	mla	z6.h, p7/m, z9.h, z28.h
	movprfx	z15, z31
	mla	z15.h, p7/m, z7.h, z25.h
	add	x10, x10, 64
	ldr	z14, [x10]
	mla	z15.h, p7/m, z19.h, z26.h
	mla	z15.h, p7/m, z14.h, z29.h
	mla	z15.h, p7/m, z12.h, z30.h
	add	z4.h, z4.h, z15.h
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x3, x12]
	addvl	x12, sp, #10
	movprfx	z15, z31
	mla	z15.h, p7/m, z16.h, z25.h
	mla	z15.h, p7/m, z20.h, z26.h
	add	x12, x12, 64
	ldr	z4, [x12]
	mla	z15.h, p7/m, z4.h, z29.h
	mla	z15.h, p7/m, z8.h, z30.h
	add	z15.h, z6.h, z15.h
	ldr	z6, [x14]
	addvl	x14, sp, #16
	mad	z5.h, p7/m, z23.h, z31.h
	mla	z5.h, p7/m, z6.h, z24.h
	add	x14, x14, 64
	ldr	z6, [x14]
	add	x10, x3, x3, lsl 1
	addvl	x14, sp, #7
	mla	z5.h, p7/m, z13.h, z27.h
	mla	z5.h, p7/m, z6.h, z28.h
	add	x14, x14, 64
	ldr	z4, [x14]
	add	x12, x2, x10
	addvl	x14, sp, #5
	movprfx	z14, z31
	mla	z14.h, p7/m, z4.h, z25.h
	sqrshrunb	z15.b, z15.h, #6
	add	x14, x14, 64
	ldr	z6, [x14]
	mla	z14.h, p7/m, z6.h, z26.h
	addvl	x14, sp, #9
	uzp1	z15.b, z15.b, z15.b
	lsl	x9, x9, 2
	add	x14, x14, 64
	ldr	z6, [x14]
	mla	z14.h, p7/m, z6.h, z29.h
	addvl	x14, sp, #11
	mla	z14.h, p7/m, z0.h, z30.h
	add	z5.h, z5.h, z14.h
	add	x14, x14, 64
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	stp	q15, q5, [x12, 16]
	ldr	z5, [x14]
	addvl	x14, sp, #2
	add	x14, x14, 64
	movprfx	z15, z31
	mla	z15.h, p7/m, z5.h, z23.h
	ldr	z5, [x14]
	addvl	x14, sp, #8
	mla	z15.h, p7/m, z5.h, z24.h
	mov	z5.d, z2.d
	add	x14, x14, 64
	mla	z15.h, p7/m, z2.h, z27.h
	ldr	z2, [x14]
	addvl	x14, sp, #6
	mla	z15.h, p7/m, z2.h, z28.h
	add	x13, x1, x0
	add	x14, x14, 64
	ldr	z14, [x14]
	mad	z14.h, p7/m, z25.h, z31.h
	addvl	x14, sp, #4
	add	x5, x5, x3, lsl 1
	mad	z7.h, p7/m, z23.h, z31.h
	add	x14, x14, 64
	ldr	z2, [x14]
	mla	z14.h, p7/m, z2.h, z26.h
	addvl	x14, sp, #3
	mla	z7.h, p7/m, z19.h, z24.h
	mad	z16.h, p7/m, z23.h, z31.h
	add	x14, x14, 64
	ldr	z2, [x14]
	mla	z14.h, p7/m, z2.h, z29.h
	addvl	x14, sp, #15
	mla	z16.h, p7/m, z20.h, z24.h
	add	x0, x0, x1, lsl 1
	add	x14, x14, 64
	ldr	z4, [x14]
	mla	z14.h, p7/m, z4.h, z30.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x12, 48]
	ld1b	z15.h, p7/z, [x1, x13]
	add	x12, x9, 16
	movprfx	z6, z15
	sub	z6.h, z6.h, #128
	ld1b	z15.h, p7/z, [x4, x12]
	add	x12, x9, 32
	movprfx	z4, z15
	sub	z4.h, z4.h, #128
	ld1b	z15.h, p7/z, [x4, x12]
	addvl	x12, sp, #19
	add	x12, x12, 64
	sub	z15.h, z15.h, #128
	str	z15, [x12]
	add	x12, x9, 48
	ld1b	z15.h, p7/z, [x4, x12]
	sub	z15.h, z15.h, #128
	addvl	x12, sp, #13
	addvl	x13, sp, #7
	add	x12, x12, 64
	str	z15, [x12]
	add	x13, x13, 64
	addvl	x12, sp, #1
	movprfx	z15, z31
	mla	z15.h, p7/m, z17.h, z25.h
	mla	z15.h, p7/m, z21.h, z26.h
	add	x12, x12, 64
	ldr	z14, [x12]
	mla	z15.h, p7/m, z11.h, z29.h
	mla	z7.h, p7/m, z14.h, z27.h
	mla	z15.h, p7/m, z10.h, z30.h
	mla	z7.h, p7/m, z12.h, z28.h
	addvl	x12, sp, #10
	add	z7.h, z7.h, z15.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	add	x12, x12, 64
	str	q7, [x3, x5]
	ldr	z15, [x12]
	ldr	z7, [x13]
	addvl	x13, sp, #5
	mla	z16.h, p7/m, z15.h, z27.h
	add	x13, x13, 64
	movprfx	z15, z31
	mla	z15.h, p7/m, z18.h, z25.h
	mla	z15.h, p7/m, z22.h, z26.h
	mla	z15.h, p7/m, z9.h, z29.h
	mla	z15.h, p7/m, z3.h, z30.h
	mla	z16.h, p7/m, z8.h, z28.h
	add	z16.h, z16.h, z15.h
	movprfx	z15, z31
	mla	z15.h, p7/m, z7.h, z23.h
	ldr	z7, [x13]
	addvl	x13, sp, #9
	add	x12, x2, x3, lsl 2
	add	x13, x13, 64
	ldr	z2, [x13]
	mla	z15.h, p7/m, z7.h, z24.h
	add	x13, sp, 64
	ldr	z14, [x13]
	sqrshrunb	z16.b, z16.h, #6
	addvl	x13, sp, #16
	uzp1	z16.b, z16.b, z16.b
	mla	z15.h, p7/m, z2.h, z27.h
	add	x13, x13, 64
	ldr	z7, [x13]
	mla	z15.h, p7/m, z0.h, z28.h
	addvl	x13, sp, #6
	mad	z14.h, p7/m, z25.h, z31.h
	mla	z14.h, p7/m, z13.h, z26.h
	add	x13, x13, 64
	mla	z14.h, p7/m, z7.h, z29.h
	mla	z14.h, p7/m, z1.h, z30.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	stp	q16, q15, [x12, 16]
	ldr	z16, [x13]
	addvl	x13, sp, #4
	add	x13, x13, 64
	ldr	z14, [x13]
	mad	z16.h, p7/m, z23.h, z31.h
	addvl	x13, sp, #3
	mla	z16.h, p7/m, z14.h, z24.h
	mov	z14.d, z5.d
	add	x13, x13, 64
	ldr	z2, [x13]
	mla	z16.h, p7/m, z2.h, z27.h
	addvl	x13, sp, #15
	add	x9, x9, x1
	mad	z17.h, p7/m, z23.h, z31.h
	add	x13, x13, 64
	ldr	z15, [x13]
	mla	z16.h, p7/m, z15.h, z28.h
	addvl	x13, sp, #2
	add	x14, x3, x5
	mla	z17.h, p7/m, z21.h, z24.h
	add	x13, x13, 64
	ldr	z2, [x13]
	movprfx	z15, z31
	mla	z15.h, p7/m, z2.h, z25.h
	addvl	x13, sp, #8
	mla	z15.h, p7/m, z5.h, z26.h
	mla	z17.h, p7/m, z11.h, z27.h
	add	x13, x13, 64
	ldr	z5, [x13]
	mla	z15.h, p7/m, z5.h, z29.h
	addvl	x13, sp, #14
	mla	z17.h, p7/m, z10.h, z28.h
	mad	z18.h, p7/m, z23.h, z31.h
	add	x13, x13, 64
	ldr	z5, [x13]
	mla	z15.h, p7/m, z5.h, z30.h
	add	z16.h, z16.h, z15.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x12, 48]
	addvl	x12, sp, #7
	ld1b	z16.h, p7/z, [x1, x0]
	add	x12, x12, 64
	sub	z16.h, z16.h, #128
	str	z16, [x12]
	add	x12, x9, 16
	ld1b	z16.h, p7/z, [x4, x12]
	sub	z16.h, z16.h, #128
	addvl	x12, sp, #6
	mla	z18.h, p7/m, z22.h, z24.h
	mla	z18.h, p7/m, z9.h, z27.h
	add	x12, x12, 64
	str	z16, [x12]
	mla	z18.h, p7/m, z3.h, z28.h
	add	x12, x9, 32
	add	x9, x9, 48
	ld1b	z16.h, p7/z, [x4, x12]
	addvl	x12, sp, #17
	sub	z16.h, z16.h, #128
	lsl	x11, x11, 1
	add	x12, x12, 64
	str	z16, [x12]
	ld1b	z16.h, p7/z, [x4, x9]
	addvl	x9, sp, #1
	movprfx	z5, z16
	sub	z5.h, z5.h, #128
	movprfx	z16, z31
	mla	z16.h, p7/m, z19.h, z25.h
	add	x9, x9, 64
	ldr	z7, [x9]
	mla	z16.h, p7/m, z7.h, z26.h
	addvl	x9, sp, #10
	mla	z16.h, p7/m, z12.h, z29.h
	mla	z16.h, p7/m, z6.h, z30.h
	add	z17.h, z17.h, z16.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	add	x9, x9, 64
	str	q17, [x3, x14]
	ldr	z15, [x9]
	add	x14, sp, 64
	movprfx	z17, z31
	mla	z17.h, p7/m, z20.h, z25.h
	mla	z17.h, p7/m, z15.h, z26.h
	mla	z17.h, p7/m, z8.h, z29.h
	mla	z17.h, p7/m, z4.h, z30.h
	add	z18.h, z18.h, z17.h
	ldr	z17, [x14]
	addvl	x14, sp, #16
	mad	z17.h, p7/m, z23.h, z31.h
	add	x14, x14, 64
	ldr	z16, [x14]
	mla	z17.h, p7/m, z13.h, z24.h
	addvl	x14, sp, #5
	mla	z17.h, p7/m, z16.h, z27.h
	add	x12, x3, x3, lsl 2
	add	x14, x14, 64
	ldr	z16, [x14]
	mov	z15.d, z13.d
	addvl	x14, sp, #9
	add	x9, x2, x12
	mad	z16.h, p7/m, z25.h, z31.h
	add	x14, x14, 64
	ldr	z13, [x14]
	mla	z16.h, p7/m, z13.h, z26.h
	addvl	x14, sp, #19
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z16.h, p7/m, z0.h, z29.h
	add	x14, x14, 64
	ldr	z13, [x14]
	mla	z16.h, p7/m, z13.h, z30.h
	addvl	x14, sp, #8
	add	z17.h, z17.h, z16.h
	sqrshrunb	z17.b, z17.h, #6
	add	x14, x14, 64
	uzp1	z17.b, z17.b, z17.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q18, q17, [x9, 16]
	ldr	z17, [x14]
	addvl	x14, sp, #14
	movprfx	z18, z31
	mla	z18.h, p7/m, z2.h, z23.h
	mla	z18.h, p7/m, z14.h, z24.h
	add	x14, x14, 64
	mla	z18.h, p7/m, z17.h, z27.h
	ldr	z17, [x14]
	addvl	x14, sp, #4
	mla	z18.h, p7/m, z17.h, z28.h
	mov	z16.d, z14.d
	add	x14, x14, 64
	ldr	z17, [x14]
	mad	z17.h, p7/m, z25.h, z31.h
	addvl	x14, sp, #3
	add	x13, x1, x0
	mad	z19.h, p7/m, z23.h, z31.h
	add	x14, x14, 64
	ldr	z14, [x14]
	mla	z17.h, p7/m, z14.h, z26.h
	addvl	x14, sp, #15
	add	x5, x5, x3, lsl 1
	mla	z19.h, p7/m, z7.h, z24.h
	add	x14, x14, 64
	ldr	z13, [x14]
	mla	z17.h, p7/m, z13.h, z29.h
	addvl	x14, sp, #13
	mla	z19.h, p7/m, z12.h, z27.h
	mla	z19.h, p7/m, z6.h, z28.h
	add	x14, x14, 64
	ldr	z13, [x14]
	mla	z17.h, p7/m, z13.h, z30.h
	add	z18.h, z18.h, z17.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x9, 48]
	addvl	x9, sp, #2
	ld1b	z18.h, p7/z, [x1, x13]
	add	x9, x9, 64
	sub	z18.h, z18.h, #128
	str	z18, [x9]
	add	x9, x11, 16
	ld1b	z18.h, p7/z, [x4, x9]
	sub	z18.h, z18.h, #128
	addvl	x9, sp, #1
	mad	z20.h, p7/m, z23.h, z31.h
	add	x0, x0, x1, lsl 1
	add	x9, x9, 64
	str	z18, [x9]
	add	x14, x3, x5
	add	x9, x11, 32
	ld1b	z18.h, p7/z, [x4, x9]
	movprfx	z2, z18
	sub	z2.h, z2.h, #128
	add	x9, sp, 64
	str	z2, [x9]
	add	x11, x11, 48
	addvl	x9, sp, #7
	ld1b	z18.h, p7/z, [x4, x11]
	movprfx	z13, z18
	sub	z13.h, z13.h, #128
	add	x9, x9, 64
	ldr	z17, [x9]
	movprfx	z18, z31
	mla	z18.h, p7/m, z21.h, z25.h
	addvl	x9, sp, #10
	mla	z18.h, p7/m, z11.h, z26.h
	mla	z18.h, p7/m, z10.h, z29.h
	add	x9, x9, 64
	mla	z18.h, p7/m, z17.h, z30.h
	addvl	x11, sp, #5
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x5]
	ldr	z18, [x9]
	addvl	x9, sp, #6
	mla	z20.h, p7/m, z18.h, z24.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z22.h, z25.h
	add	x9, x9, 64
	ldr	z18, [x9]
	mla	z19.h, p7/m, z9.h, z26.h
	add	x11, x11, 64
	mla	z19.h, p7/m, z3.h, z29.h
	mla	z19.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z8.h, z27.h
	mla	z20.h, p7/m, z4.h, z28.h
	add	z20.h, z20.h, z19.h
	ldr	z19, [x11]
	addvl	x11, sp, #9
	mad	z19.h, p7/m, z23.h, z31.h
	add	x9, x2, x10, lsl 1
	add	x11, x11, 64
	ldr	z17, [x11]
	mla	z19.h, p7/m, z17.h, z24.h
	addvl	x11, sp, #19
	mov	z2.d, z7.d
	sqrshrunb	z20.b, z20.h, #6
	add	x11, x11, 64
	ldr	z18, [x11]
	uzp1	z20.b, z20.b, z20.b
	addvl	x11, sp, #16
	mla	z19.h, p7/m, z0.h, z27.h
	mla	z19.h, p7/m, z18.h, z28.h
	add	x11, x11, 64
	ldr	z17, [x11]
	movprfx	z18, z31
	mla	z18.h, p7/m, z15.h, z25.h
	addvl	x11, sp, #17
	mla	z18.h, p7/m, z17.h, z26.h
	mla	z18.h, p7/m, z1.h, z29.h
	add	x11, x11, 64
	ldr	z7, [x11]
	mla	z18.h, p7/m, z7.h, z30.h
	addvl	x11, sp, #4
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	add	x11, x11, 64
	uzp1	z19.b, z19.b, z19.b
	stp	q20, q19, [x9, 16]
	ldr	z20, [x11]
	addvl	x11, sp, #3
	mad	z20.h, p7/m, z23.h, z31.h
	add	x11, x11, 64
	str	z14, [x11]
	mla	z20.h, p7/m, z14.h, z24.h
	addvl	x11, sp, #15
	mad	z21.h, p7/m, z23.h, z31.h
	mla	z21.h, p7/m, z11.h, z24.h
	add	x11, x11, 64
	ldr	z18, [x11]
	mla	z20.h, p7/m, z18.h, z27.h
	addvl	x11, sp, #13
	mla	z21.h, p7/m, z10.h, z27.h
	addvl	x16, sp, #16
	add	x11, x11, 64
	ldr	z19, [x11]
	mla	z20.h, p7/m, z19.h, z28.h
	addvl	x11, sp, #8
	movprfx	z19, z31
	mla	z19.h, p7/m, z16.h, z25.h
	mad	z22.h, p7/m, z23.h, z31.h
	add	x11, x11, 64
	ldr	z18, [x11]
	mla	z19.h, p7/m, z18.h, z26.h
	addvl	x11, sp, #14
	mla	z22.h, p7/m, z9.h, z24.h
	add	x16, x16, 64
	add	x11, x11, 64
	ldr	z7, [x11]
	mla	z19.h, p7/m, z7.h, z29.h
	mla	z19.h, p7/m, z5.h, z30.h
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x9, 48]
	lsl	x9, x1, 4
	sub	x11, x9, x1
	ld1b	z17.h, p7/z, [x1, x0]
	mla	z22.h, p7/m, z3.h, z27.h
	add	x13, x11, 16
	ld1b	z20.h, p7/z, [x4, x13]
	movprfx	z14, z20
	sub	z14.h, z14.h, #128
	add	x13, x11, 32
	add	x11, x11, 48
	ld1b	z20.h, p7/z, [x4, x13]
	movprfx	z18, z20
	sub	z18.h, z18.h, #128
	ld1b	z20.h, p7/z, [x4, x11]
	addvl	x11, sp, #5
	add	x11, x11, 64
	sub	z20.h, z20.h, #128
	str	z20, [x11]
	addvl	x11, sp, #7
	movprfx	z20, z31
	mla	z20.h, p7/m, z2.h, z25.h
	mla	z20.h, p7/m, z12.h, z26.h
	add	x11, x11, 64
	ldr	z19, [x11]
	mla	z20.h, p7/m, z6.h, z29.h
	addvl	x11, sp, #2
	mla	z21.h, p7/m, z19.h, z28.h
	mov	z19.d, z2.d
	add	x11, x11, 64
	ldr	z2, [x11]
	mla	z20.h, p7/m, z2.h, z30.h
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x14]
	addvl	x14, sp, #6
	sub	z17.h, z17.h, #128
	add	x14, x14, 64
	ldr	z20, [x14]
	mla	z22.h, p7/m, z20.h, z28.h
	addvl	x14, sp, #10
	lsl	x13, x3, 3
	add	x14, x14, 64
	ldr	z21, [x14]
	mad	z21.h, p7/m, z25.h, z31.h
	addvl	x14, sp, #1
	mla	z21.h, p7/m, z8.h, z26.h
	mla	z21.h, p7/m, z4.h, z29.h
	add	x14, x14, 64
	ldr	z20, [x14]
	mla	z21.h, p7/m, z20.h, z30.h
	ldr	z20, [x16]
	addvl	x16, sp, #17
	add	z22.h, z22.h, z21.h
	add	x16, x16, 64
	movprfx	z21, z31
	mla	z21.h, p7/m, z15.h, z23.h
	ldr	z15, [x16]
	addvl	x16, sp, #9
	mla	z21.h, p7/m, z20.h, z24.h
	sub	x11, x13, x3
	add	x16, x16, 64
	ldr	z20, [x16]
	add	x14, x2, x11
	addvl	x16, sp, #19
	mla	z21.h, p7/m, z1.h, z27.h
	mla	z21.h, p7/m, z15.h, z28.h
	add	x16, x16, 64
	ldr	z15, [x16]
	mad	z20.h, p7/m, z25.h, z31.h
	add	x16, sp, 64
	ldr	z2, [x16]
	mla	z20.h, p7/m, z0.h, z26.h
	addvl	x16, sp, #8
	mla	z20.h, p7/m, z15.h, z29.h
	sqrshrunb	z22.b, z22.h, #6
	add	x16, x16, 64
	mla	z20.h, p7/m, z2.h, z30.h
	uzp1	z22.b, z22.b, z22.b
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x14, 16]
	ldr	z15, [x16]
	addvl	x16, sp, #14
	add	x16, x16, 64
	str	z7, [x16]
	movprfx	z22, z31
	mla	z22.h, p7/m, z16.h, z23.h
	addvl	x16, sp, #18
	mla	z22.h, p7/m, z15.h, z24.h
	mla	z22.h, p7/m, z7.h, z27.h
	add	x16, x16, 64
	str	z5, [x16]
	mla	z22.h, p7/m, z5.h, z28.h
	addvl	x16, sp, #3
	add	x15, x1, x0
	add	x16, x16, 64
	ldr	z16, [x16]
	movprfx	z21, z31
	mla	z21.h, p7/m, z16.h, z25.h
	addvl	x16, sp, #15
	add	x5, x5, x3, lsl 1
	add	x16, x16, 64
	ldr	z16, [x16]
	mla	z21.h, p7/m, z16.h, z26.h
	addvl	x16, sp, #13
	add	x0, x0, x1, lsl 1
	add	x16, x16, 64
	ldr	z7, [x16]
	mla	z21.h, p7/m, z7.h, z29.h
	mla	z21.h, p7/m, z13.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x14, 48]
	add	x14, x9, 16
	ld1b	z22.h, p7/z, [x4, x14]
	addvl	x14, sp, #4
	ld1b	z15.h, p7/z, [x1, x15]
	add	x14, x14, 64
	sub	z22.h, z22.h, #128
	str	z22, [x14]
	add	x14, x9, 32
	ld1b	z22.h, p7/z, [x4, x14]
	sub	z22.h, z22.h, #128
	addvl	x14, sp, #12
	movprfx	z21, z31
	mla	z21.h, p7/m, z11.h, z25.h
	mla	z21.h, p7/m, z10.h, z26.h
	add	x14, x14, 64
	str	z22, [x14]
	movprfx	z22, z31
	mla	z22.h, p7/m, z19.h, z23.h
	add	x14, x9, 48
	ld1b	z16.h, p7/z, [x4, x14]
	sub	z16.h, z16.h, #128
	addvl	x14, sp, #11
	mla	z22.h, p7/m, z12.h, z24.h
	mla	z22.h, p7/m, z6.h, z27.h
	add	x14, x14, 64
	str	z16, [x14]
	addvl	x16, sp, #9
	addvl	x14, sp, #2
	add	x16, x16, 64
	sub	z15.h, z15.h, #128
	add	x14, x14, 64
	ldr	z2, [x14]
	mla	z22.h, p7/m, z2.h, z28.h
	addvl	x14, sp, #7
	add	x9, x9, x1
	mad	z11.h, p7/m, z23.h, z31.h
	add	x14, x14, 64
	ldr	z5, [x14]
	mla	z21.h, p7/m, z5.h, z29.h
	addvl	x14, sp, #10
	mla	z21.h, p7/m, z17.h, z30.h
	add	z22.h, z22.h, z21.h
	add	x14, x14, 64
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x5]
	ldr	z22, [x14]
	addvl	x14, sp, #1
	add	x14, x14, 64
	ldr	z21, [x14]
	mad	z22.h, p7/m, z23.h, z31.h
	addvl	x14, sp, #6
	mla	z22.h, p7/m, z8.h, z24.h
	mla	z22.h, p7/m, z4.h, z27.h
	add	x14, x14, 64
	ldr	z20, [x14]
	mla	z22.h, p7/m, z21.h, z28.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z9.h, z25.h
	mla	z21.h, p7/m, z3.h, z26.h
	mla	z21.h, p7/m, z20.h, z29.h
	mla	z21.h, p7/m, z14.h, z30.h
	add	z22.h, z22.h, z21.h
	add	x14, x2, x13
	ldr	z21, [x16]
	addvl	x16, sp, #19
	mad	z21.h, p7/m, z23.h, z31.h
	add	x16, x16, 64
	ldr	z20, [x16]
	mla	z21.h, p7/m, z0.h, z24.h
	add	x16, sp, 64
	ldr	z19, [x16]
	mla	z21.h, p7/m, z20.h, z27.h
	addvl	x16, sp, #16
	mla	z21.h, p7/m, z19.h, z28.h
	sqrshrunb	z22.b, z22.h, #6
	add	x16, x16, 64
	ldr	z19, [x16]
	uzp1	z22.b, z22.b, z22.b
	addvl	x16, sp, #17
	movprfx	z20, z31
	mla	z20.h, p7/m, z19.h, z25.h
	mla	z20.h, p7/m, z1.h, z26.h
	add	x16, x16, 64
	ldr	z5, [x16]
	mla	z20.h, p7/m, z5.h, z29.h
	addvl	x16, sp, #3
	mla	z20.h, p7/m, z18.h, z30.h
	add	z21.h, z21.h, z20.h
	add	x16, x16, 64
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x14, 16]
	ldr	z22, [x16]
	addvl	x16, sp, #15
	add	x16, x16, 64
	ldr	z21, [x16]
	mad	z22.h, p7/m, z23.h, z31.h
	addvl	x16, sp, #13
	mla	z22.h, p7/m, z21.h, z24.h
	mla	z22.h, p7/m, z7.h, z27.h
	add	x16, x16, 64
	str	z7, [x16]
	mla	z22.h, p7/m, z13.h, z28.h
	addvl	x16, sp, #8
	add	x15, x3, x5
	mla	z11.h, p7/m, z10.h, z24.h
	add	x16, x16, 64
	ldr	z21, [x16]
	mad	z21.h, p7/m, z25.h, z31.h
	addvl	x16, sp, #14
	mad	z9.h, p7/m, z23.h, z31.h
	mla	z9.h, p7/m, z3.h, z24.h
	add	x16, x16, 64
	ldr	z20, [x16]
	mla	z21.h, p7/m, z20.h, z26.h
	addvl	x16, sp, #18
	add	x13, x13, x3
	movprfx	z20, z31
	mla	z20.h, p7/m, z0.h, z25.h
	add	x16, x16, 64
	ldr	z16, [x16]
	mla	z21.h, p7/m, z16.h, z29.h
	addvl	x16, sp, #5
	add	x13, x2, x13
	add	x16, x16, 64
	ldr	z7, [x16]
	mla	z21.h, p7/m, z7.h, z30.h
	addvl	x16, sp, #3
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	add	x16, x16, 64
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x14, 48]
	ld1b	z22.h, p7/z, [x1, x0]
	sub	z22.h, z22.h, #128
	str	z22, [x16]
	add	x16, x9, 16
	ld1b	z22.h, p7/z, [x4, x16]
	sub	z22.h, z22.h, #128
	addvl	x16, sp, #10
	lsl	x7, x7, 1
	add	x16, x16, 64
	str	z22, [x16]
	add	x14, x1, x0
	add	x16, x9, 32
	add	x9, x9, 48
	ld1b	z22.h, p7/z, [x4, x16]
	addvl	x16, sp, #9
	movprfx	z21, z22
	sub	z21.h, z21.h, #128
	add	x5, x5, x3, lsl 1
	add	x16, x16, 64
	str	z21, [x16]
	ld1b	z22.h, p7/z, [x4, x9]
	addvl	x9, sp, #7
	movprfx	z7, z22
	sub	z7.h, z7.h, #128
	movprfx	z22, z31
	mla	z22.h, p7/m, z12.h, z25.h
	add	x9, x9, 64
	ldr	z5, [x9]
	mla	z22.h, p7/m, z6.h, z26.h
	addvl	x9, sp, #6
	mla	z11.h, p7/m, z5.h, z27.h
	mla	z22.h, p7/m, z2.h, z29.h
	add	x9, x9, 64
	mla	z22.h, p7/m, z15.h, z30.h
	mla	z11.h, p7/m, z17.h, z28.h
	add	z11.h, z11.h, z22.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x3, x15]
	ldr	z21, [x9]
	addvl	x9, sp, #1
	add	x9, x9, 64
	ldr	z11, [x9]
	movprfx	z22, z31
	mla	z22.h, p7/m, z8.h, z25.h
	addvl	x9, sp, #4
	mla	z22.h, p7/m, z4.h, z26.h
	mla	z22.h, p7/m, z11.h, z29.h
	add	x9, x9, 64
	ldr	z11, [x9]
	mla	z9.h, p7/m, z21.h, z27.h
	addvl	x9, sp, #17
	mla	z9.h, p7/m, z14.h, z28.h
	mla	z22.h, p7/m, z11.h, z30.h
	add	x9, x9, 64
	ldr	z5, [x9]
	add	z22.h, z9.h, z22.h
	addvl	x9, sp, #19
	movprfx	z21, z31
	mla	z21.h, p7/m, z19.h, z23.h
	sqrshrunb	z22.b, z22.h, #6
	add	x9, x9, 64
	ldr	z9, [x9]
	mla	z20.h, p7/m, z9.h, z26.h
	add	x9, sp, 64
	ldr	z19, [x9]
	mla	z20.h, p7/m, z19.h, z29.h
	addvl	x9, sp, #12
	uzp1	z22.b, z22.b, z22.b
	mla	z21.h, p7/m, z1.h, z24.h
	add	x9, x9, 64
	ldr	z19, [x9]
	mla	z21.h, p7/m, z5.h, z27.h
	addvl	x9, sp, #8
	mla	z20.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z18.h, z28.h
	add	x9, x9, 64
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x13, 16]
	ldr	z22, [x9]
	addvl	x9, sp, #14
	mad	z22.h, p7/m, z23.h, z31.h
	mad	z12.h, p7/m, z23.h, z31.h
	add	x9, x9, 64
	ldr	z11, [x9]
	mla	z22.h, p7/m, z11.h, z24.h
	addvl	x9, sp, #18
	mla	z22.h, p7/m, z16.h, z27.h
	mla	z12.h, p7/m, z6.h, z24.h
	add	x9, x9, 64
	str	z16, [x9]
	mla	z12.h, p7/m, z2.h, z27.h
	addvl	x9, sp, #5
	mla	z12.h, p7/m, z15.h, z28.h
	mad	z8.h, p7/m, z23.h, z31.h
	add	x9, x9, 64
	ldr	z19, [x9]
	mla	z22.h, p7/m, z19.h, z28.h
	addvl	x9, sp, #15
	mla	z8.h, p7/m, z4.h, z24.h
	add	x0, x0, x1, lsl 1
	add	x9, x9, 64
	ldr	z19, [x9]
	movprfx	z21, z31
	mla	z21.h, p7/m, z19.h, z25.h
	addvl	x9, sp, #13
	lsl	x6, x6, 2
	add	x9, x9, 64
	ldr	z20, [x9]
	mla	z21.h, p7/m, z20.h, z26.h
	addvl	x9, sp, #11
	mla	z21.h, p7/m, z13.h, z29.h
	movprfx	z20, z31
	mla	z20.h, p7/m, z1.h, z25.h
	add	x9, x9, 64
	ldr	z16, [x9]
	mla	z21.h, p7/m, z16.h, z30.h
	addvl	x9, sp, #14
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	add	x9, x9, 64
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x13, 48]
	ld1b	z22.h, p7/z, [x1, x14]
	movprfx	z21, z22
	sub	z21.h, z21.h, #128
	str	z21, [x9]
	add	x9, x7, 16
	ld1b	z22.h, p7/z, [x4, x9]
	movprfx	z16, z22
	sub	z16.h, z16.h, #128
	addvl	x9, sp, #16
	add	x14, sp, 64
	add	x9, x9, 64
	str	z16, [x9]
	add	x13, x3, x5
	add	x9, x7, 32
	ld1b	z22.h, p7/z, [x4, x9]
	movprfx	z16, z22
	sub	z16.h, z16.h, #128
	addvl	x9, sp, #8
	lsl	x8, x8, 1
	add	x9, x9, 64
	str	z16, [x9]
	add	x11, x2, x11, lsl 1
	add	x9, x7, 48
	ld1b	z22.h, p7/z, [x4, x9]
	movprfx	z16, z22
	sub	z16.h, z16.h, #128
	addvl	x9, sp, #2
	movprfx	z22, z31
	mla	z22.h, p7/m, z10.h, z25.h
	add	x7, x7, x1
	add	x9, x9, 64
	str	z2, [x9]
	mad	z10.h, p7/m, z23.h, z31.h
	addvl	x9, sp, #7
	add	x9, x9, 64
	ldr	z5, [x9]
	mla	z22.h, p7/m, z5.h, z26.h
	addvl	x9, sp, #3
	mla	z22.h, p7/m, z17.h, z29.h
	add	x9, x9, 64
	ldr	z2, [x9]
	mla	z22.h, p7/m, z2.h, z30.h
	addvl	x9, sp, #1
	add	z12.h, z12.h, z22.h
	sqrshrunb	z12.b, z12.h, #6
	add	x9, x9, 64
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x5]
	ldr	z22, [x9]
	addvl	x9, sp, #4
	mla	z8.h, p7/m, z22.h, z27.h
	add	x9, x9, 64
	ldr	z21, [x9]
	mla	z8.h, p7/m, z21.h, z28.h
	addvl	x9, sp, #6
	movprfx	z22, z31
	mla	z22.h, p7/m, z3.h, z25.h
	add	x5, x5, x3, lsl 1
	add	x9, x9, 64
	ldr	z21, [x9]
	mla	z22.h, p7/m, z21.h, z26.h
	addvl	x9, sp, #10
	mla	z22.h, p7/m, z14.h, z29.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z0.h, z23.h
	add	x9, x9, 64
	ldr	z12, [x9]
	mla	z22.h, p7/m, z12.h, z30.h
	ldr	z12, [x14]
	addvl	x14, sp, #12
	mla	z21.h, p7/m, z9.h, z24.h
	add	x14, x14, 64
	add	z22.h, z8.h, z22.h
	mov	z8.d, z9.d
	ldr	z9, [x14]
	addvl	x14, sp, #17
	add	x9, x2, x12, lsl 1
	add	x14, x14, 64
	ldr	z5, [x14]
	mla	z21.h, p7/m, z12.h, z27.h
	addvl	x14, sp, #13
	mla	z21.h, p7/m, z9.h, z28.h
	ldr	z9, [x16]
	add	x14, x14, 64
	mla	z20.h, p7/m, z5.h, z26.h
	sqrshrunb	z22.b, z22.h, #6
	mla	z20.h, p7/m, z18.h, z29.h
	uzp1	z22.b, z22.b, z22.b
	mla	z20.h, p7/m, z9.h, z30.h
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x9, 16]
	ldr	z0, [x14]
	addvl	x14, sp, #11
	add	x14, x14, 64
	ldr	z20, [x14]
	movprfx	z22, z31
	mla	z22.h, p7/m, z19.h, z23.h
	addvl	x14, sp, #18
	mla	z22.h, p7/m, z0.h, z24.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z11.h, z25.h
	add	x14, x14, 64
	ldr	z5, [x14]
	mla	z22.h, p7/m, z13.h, z27.h
	addvl	x14, sp, #5
	mla	z22.h, p7/m, z20.h, z28.h
	mla	z21.h, p7/m, z5.h, z26.h
	add	x14, x14, 64
	ldr	z19, [x14]
	mla	z21.h, p7/m, z19.h, z29.h
	add	x14, x7, 16
	mla	z21.h, p7/m, z7.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x9, 48]
	ld1b	z22.h, p7/z, [x4, x14]
	addvl	x14, sp, #13
	ld1b	z20.h, p7/z, [x1, x0]
	add	x14, x14, 64
	mov	z9.d, z11.d
	movprfx	z11, z22
	sub	z11.h, z11.h, #128
	str	z11, [x14]
	add	x14, x7, 32
	add	x7, x7, 48
	ld1b	z12.h, p7/z, [x4, x7]
	addvl	x7, sp, #7
	ld1b	z11.h, p7/z, [x4, x14]
	add	x7, x7, 64
	ldr	z22, [x7]
	mla	z10.h, p7/m, z22.h, z24.h
	addvl	x7, sp, #3
	mla	z10.h, p7/m, z17.h, z27.h
	mla	z10.h, p7/m, z2.h, z28.h
	add	x7, x7, 64
	str	z2, [x7]
	movprfx	z22, z31
	mla	z22.h, p7/m, z6.h, z25.h
	addvl	x7, sp, #2
	add	x12, x3, x12, lsl 1
	mad	z6.h, p7/m, z23.h, z31.h
	add	x7, x7, 64
	ldr	z2, [x7]
	mla	z22.h, p7/m, z2.h, z26.h
	addvl	x7, sp, #14
	mla	z22.h, p7/m, z15.h, z29.h
	add	x12, x2, x12
	add	x7, x7, 64
	ldr	z21, [x7]
	mla	z22.h, p7/m, z21.h, z30.h
	addvl	x7, sp, #6
	add	z10.h, z10.h, z22.h
	sqrshrunb	z10.b, z10.h, #6
	add	x7, x7, 64
	uzp1	z10.b, z10.b, z10.b
	str	q10, [x3, x13]
	ldr	z21, [x7]
	addvl	x7, sp, #10
	movprfx	z22, z31
	mla	z22.h, p7/m, z3.h, z23.h
	add	x7, x7, 64
	ldr	z10, [x7]
	mla	z22.h, p7/m, z21.h, z24.h
	addvl	x7, sp, #1
	mla	z22.h, p7/m, z14.h, z27.h
	mla	z22.h, p7/m, z10.h, z28.h
	add	x7, x7, 64
	ldr	z19, [x7]
	movprfx	z21, z31
	mla	z21.h, p7/m, z4.h, z25.h
	addvl	x7, sp, #4
	mla	z21.h, p7/m, z19.h, z26.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z8.h, z25.h
	add	x7, x7, 64
	ldr	z10, [x7]
	mla	z21.h, p7/m, z10.h, z29.h
	addvl	x7, sp, #16
	add	x9, x1, x0
	mla	z6.h, p7/m, z2.h, z24.h
	add	x7, x7, 64
	ldr	z3, [x7]
	mla	z21.h, p7/m, z3.h, z30.h
	addvl	x7, sp, #17
	add	z22.h, z22.h, z21.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z1.h, z23.h
	add	x7, x7, 64
	ldr	z1, [x7]
	ldr	z3, [x16]
	add	x7, sp, 64
	ldr	z10, [x7]
	mla	z21.h, p7/m, z1.h, z24.h
	addvl	x7, sp, #12
	mla	z21.h, p7/m, z18.h, z27.h
	mla	z21.h, p7/m, z3.h, z28.h
	add	x7, x7, 64
	mov	z3.d, z8.d
	ldr	z8, [x7]
	addvl	x7, sp, #8
	mla	z19.h, p7/m, z10.h, z26.h
	mla	z19.h, p7/m, z8.h, z29.h
	add	x7, x7, 64
	ldr	z8, [x7]
	mla	z19.h, p7/m, z8.h, z30.h
	addvl	x7, sp, #5
	add	z21.h, z21.h, z19.h
	sqrshrunb	z22.b, z22.h, #6
	add	x7, x7, 64
	uzp1	z22.b, z22.b, z22.b
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x12, 16]
	ldr	z19, [x7]
	addvl	x7, sp, #11
	movprfx	z22, z31
	mla	z22.h, p7/m, z9.h, z23.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z0.h, z25.h
	add	x7, x7, 64
	ldr	z10, [x7]
	mla	z22.h, p7/m, z5.h, z24.h
	addvl	x7, sp, #17
	mla	z22.h, p7/m, z19.h, z27.h
	mla	z21.h, p7/m, z13.h, z26.h
	mla	z22.h, p7/m, z7.h, z28.h
	mla	z21.h, p7/m, z10.h, z29.h
	add	x7, x7, 64
	mla	z21.h, p7/m, z16.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x12, 48]
	mla	z6.h, p7/m, z15.h, z27.h
	ld1b	z22.h, p7/z, [x1, x9]
	sub	z22.h, z22.h, #128
	str	z22, [x7]
	add	x7, x6, 16
	ld1b	z8.h, p7/z, [x4, x7]
	sub	z20.h, z20.h, #128
	add	x7, x6, 32
	ld1b	z9.h, p7/z, [x4, x7]
	add	x12, sp, 64
	add	x7, x6, 48
	ld1b	z10.h, p7/z, [x4, x7]
	sub	z11.h, z11.h, #128
	addvl	x7, sp, #2
	add	x0, x0, x1, lsl 1
	sub	z12.h, z12.h, #128
	add	x7, x7, 64
	str	z2, [x7]
	add	x6, x6, x1
	addvl	x7, sp, #14
	add	x9, x3, x5
	sub	z8.h, z8.h, #128
	add	x7, x7, 64
	ldr	z21, [x7]
	mla	z6.h, p7/m, z21.h, z28.h
	addvl	x7, sp, #7
	sub	z9.h, z9.h, #128
	sub	z10.h, z10.h, #128
	add	x7, x7, 64
	ldr	z22, [x7]
	mad	z22.h, p7/m, z25.h, z31.h
	addvl	x7, sp, #3
	mla	z22.h, p7/m, z17.h, z26.h
	add	x7, x7, 64
	ldr	z21, [x7]
	mla	z22.h, p7/m, z21.h, z29.h
	addvl	x7, sp, #1
	mla	z22.h, p7/m, z20.h, z30.h
	add	z6.h, z6.h, z22.h
	add	x7, x7, 64
	movprfx	z22, z31
	mla	z22.h, p7/m, z4.h, z23.h
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x3, x5]
	ldr	z4, [x7]
	addvl	x7, sp, #4
	mla	z22.h, p7/m, z4.h, z24.h
	add	x7, x7, 64
	ldr	z2, [x7]
	mla	z22.h, p7/m, z2.h, z27.h
	addvl	x7, sp, #16
	add	x5, x5, x3, lsl 1
	add	x7, x7, 64
	ldr	z19, [x7]
	mla	z22.h, p7/m, z19.h, z28.h
	addvl	x7, sp, #6
	add	x7, x7, 64
	ldr	z21, [x7]
	mad	z21.h, p7/m, z25.h, z31.h
	addvl	x7, sp, #10
	mla	z21.h, p7/m, z14.h, z26.h
	add	x7, x7, 64
	ldr	z19, [x7]
	mla	z21.h, p7/m, z19.h, z29.h
	addvl	x7, sp, #13
	add	x7, x7, 64
	ldr	z6, [x7]
	mla	z21.h, p7/m, z6.h, z30.h
	add	z22.h, z22.h, z21.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z3.h, z23.h
	ldr	z3, [x12]
	addvl	x12, sp, #12
	add	x7, x2, x10, lsl 2
	mla	z21.h, p7/m, z3.h, z24.h
	add	x12, x12, 64
	ldr	z19, [x12]
	mla	z21.h, p7/m, z19.h, z27.h
	addvl	x12, sp, #8
	movprfx	z19, z31
	mla	z19.h, p7/m, z1.h, z25.h
	sqrshrunb	z22.b, z22.h, #6
	add	x12, x12, 64
	ldr	z6, [x12]
	mla	z21.h, p7/m, z6.h, z28.h
	addvl	x12, sp, #11
	mov	z6.d, z1.d
	ldr	z1, [x16]
	add	x12, x12, 64
	mla	z19.h, p7/m, z18.h, z26.h
	uzp1	z22.b, z22.b, z22.b
	mla	z19.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z11.h, z30.h
	add	z21.h, z21.h, z19.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x7, 16]
	ldr	z1, [x12]
	addvl	x12, sp, #15
	movprfx	z22, z31
	mla	z22.h, p7/m, z0.h, z23.h
	add	x12, x12, 64
	str	z16, [x12]
	mla	z22.h, p7/m, z13.h, z24.h
	addvl	x12, sp, #5
	mla	z22.h, p7/m, z1.h, z27.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z5.h, z25.h
	add	x12, x12, 64
	ldr	z19, [x12]
	mla	z22.h, p7/m, z16.h, z28.h
	mla	z21.h, p7/m, z19.h, z26.h
	mla	z21.h, p7/m, z7.h, z29.h
	mla	z21.h, p7/m, z12.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x7, 48]
	add	x7, x1, x0
	ld1b	z0.h, p7/z, [x1, x0]
	add	x0, x6, 16
	ld1b	z1.h, p7/z, [x4, x0]
	sub	z0.h, z0.h, #128
	add	x0, x6, 32
	ld1b	z22.h, p7/z, [x4, x0]
	sub	z22.h, z22.h, #128
	addvl	x0, sp, #18
	add	x6, x6, 48
	sub	z1.h, z1.h, #128
	add	x0, x0, 64
	str	z22, [x0]
	ld1b	z19.h, p7/z, [x4, x6]
	addvl	x0, sp, #7
	add	x10, x3, x10, lsl 2
	sub	z19.h, z19.h, #128
	add	x0, x0, 64
	ldr	z22, [x0]
	mad	z22.h, p7/m, z23.h, z31.h
	addvl	x0, sp, #3
	mla	z22.h, p7/m, z17.h, z24.h
	add	x10, x2, x10
	add	x0, x0, 64
	ldr	z21, [x0]
	mla	z22.h, p7/m, z21.h, z27.h
	addvl	x0, sp, #2
	mla	z22.h, p7/m, z20.h, z28.h
	add	x2, x2, x3, lsl 4
	add	x0, x0, 64
	ldr	z21, [x0]
	mad	z21.h, p7/m, z25.h, z31.h
	addvl	x0, sp, #14
	mla	z21.h, p7/m, z15.h, z26.h
	sub	x2, x2, x3
	add	x0, x0, 64
	ldr	z16, [x0]
	mla	z21.h, p7/m, z16.h, z29.h
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z16, [x0]
	mla	z21.h, p7/m, z16.h, z30.h
	addvl	x0, sp, #6
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	add	x0, x0, 64
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x9]
	ldr	z22, [x0]
	addvl	x0, sp, #10
	mad	z22.h, p7/m, z23.h, z31.h
	add	x0, x0, 64
	ldr	z21, [x0]
	mla	z22.h, p7/m, z14.h, z24.h
	addvl	x0, sp, #13
	mla	z22.h, p7/m, z21.h, z27.h
	add	x0, x0, 64
	ldr	z21, [x0]
	mla	z22.h, p7/m, z21.h, z28.h
	addvl	x0, sp, #1
	movprfx	z21, z31
	mla	z21.h, p7/m, z4.h, z25.h
	mla	z21.h, p7/m, z2.h, z26.h
	add	x0, x0, 64
	str	z4, [x0]
	addvl	x0, sp, #4
	add	x0, x0, 64
	str	z2, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z4, [x0]
	mla	z21.h, p7/m, z4.h, z29.h
	add	x0, sp, 64
	str	z3, [x0]
	mla	z21.h, p7/m, z8.h, z30.h
	addvl	x0, sp, #12
	add	z22.h, z22.h, z21.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z6.h, z23.h
	add	x0, x0, 64
	ldr	z4, [x0]
	ldr	z6, [x16]
	addvl	x0, sp, #8
	mla	z21.h, p7/m, z18.h, z24.h
	mla	z21.h, p7/m, z6.h, z27.h
	add	x0, x0, 64
	movprfx	z6, z31
	mla	z6.h, p7/m, z3.h, z25.h
	ldr	z3, [x0]
	addvl	x0, sp, #6
	mla	z21.h, p7/m, z11.h, z28.h
	mla	z6.h, p7/m, z4.h, z26.h
	add	x0, x0, 64
	mla	z6.h, p7/m, z3.h, z29.h
	sqrshrunb	z22.b, z22.h, #6
	mla	z6.h, p7/m, z9.h, z30.h
	uzp1	z22.b, z22.b, z22.b
	add	z21.h, z21.h, z6.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x10, 16]
	str	z7, [x0]
	addvl	x0, sp, #11
	ldr	z21, [x12]
	add	x0, x0, 64
	ldr	z16, [x0]
	movprfx	z22, z31
	mla	z22.h, p7/m, z5.h, z23.h
	addvl	x0, sp, #15
	mla	z22.h, p7/m, z21.h, z24.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z13.h, z25.h
	add	x0, x0, 64
	ldr	z5, [x0]
	mla	z22.h, p7/m, z7.h, z27.h
	add	x0, x8, 16
	mla	z22.h, p7/m, z12.h, z28.h
	mla	z21.h, p7/m, z16.h, z26.h
	mla	z21.h, p7/m, z5.h, z29.h
	mla	z21.h, p7/m, z10.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x10, 48]
	ld1b	z3.h, p7/z, [x4, x0]
	add	x0, x8, 32
	ld1b	z4.h, p7/z, [x4, x0]
	addvl	x0, sp, #2
	ld1b	z2.h, p7/z, [x1, x7]
	addvl	x1, sp, #1
	add	x0, x0, 64
	ldr	z22, [x0]
	movprfx	z21, z31
	mla	z21.h, p7/m, z17.h, z25.h
	addvl	x0, sp, #14
	mad	z22.h, p7/m, z23.h, z31.h
	add	x1, x1, 64
	add	x0, x0, 64
	ldr	z16, [x0]
	mla	z22.h, p7/m, z15.h, z24.h
	addvl	x0, sp, #17
	mla	z22.h, p7/m, z16.h, z27.h
	add	x8, x8, 48
	add	x0, x0, 64
	ldr	z7, [x0]
	mla	z22.h, p7/m, z7.h, z28.h
	addvl	x0, sp, #3
	ld1b	z5.h, p7/z, [x4, x8]
	mad	z17.h, p7/m, z23.h, z31.h
	add	x0, x0, 64
	ldr	z6, [x0]
	mla	z21.h, p7/m, z6.h, z26.h
	mla	z21.h, p7/m, z20.h, z29.h
	mla	z21.h, p7/m, z0.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x5]
	ldr	z22, [x1]
	addvl	x1, sp, #4
	mad	z22.h, p7/m, z23.h, z31.h
	add	x1, x1, 64
	ldr	z21, [x1]
	mla	z22.h, p7/m, z21.h, z24.h
	addvl	x1, sp, #16
	movprfx	z21, z31
	mla	z21.h, p7/m, z14.h, z25.h
	add	x0, x3, x5
	add	x1, x1, 64
	ldr	z16, [x1]
	mla	z22.h, p7/m, z16.h, z27.h
	addvl	x1, sp, #10
	mla	z22.h, p7/m, z8.h, z28.h
	mad	z15.h, p7/m, z25.h, z31.h
	add	x1, x1, 64
	ldr	z6, [x1]
	mla	z21.h, p7/m, z6.h, z26.h
	addvl	x1, sp, #13
	sub	z2.h, z2.h, #128
	sub	z3.h, z3.h, #128
	add	x1, x1, 64
	ldr	z7, [x1]
	mla	z21.h, p7/m, z7.h, z29.h
	add	x1, sp, 64
	mla	z21.h, p7/m, z1.h, z30.h
	add	z22.h, z22.h, z21.h
	ldr	z21, [x1]
	addvl	x1, sp, #12
	mad	z21.h, p7/m, z23.h, z31.h
	add	x1, x1, 64
	ldr	z6, [x1]
	mla	z21.h, p7/m, z6.h, z24.h
	addvl	x1, sp, #8
	movprfx	z6, z31
	mla	z6.h, p7/m, z18.h, z25.h
	sqrshrunb	z22.b, z22.h, #6
	add	x1, x1, 64
	ldr	z7, [x1]
	mla	z21.h, p7/m, z7.h, z27.h
	addvl	x1, sp, #18
	ldr	z7, [x16]
	mla	z6.h, p7/m, z7.h, z26.h
	add	x1, x1, 64
	ldr	z7, [x1]
	uzp1	z22.b, z22.b, z22.b
	addvl	x1, sp, #11
	mla	z21.h, p7/m, z9.h, z28.h
	mla	z6.h, p7/m, z11.h, z29.h
	add	x1, x1, 64
	mla	z6.h, p7/m, z7.h, z30.h
	add	z21.h, z21.h, z6.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x11, 16]
	movprfx	z22, z31
	mla	z22.h, p7/m, z13.h, z23.h
	ldr	z13, [x1]
	addvl	x1, sp, #15
	add	x1, x1, 64
	ldr	z21, [x1]
	mla	z22.h, p7/m, z13.h, z24.h
	addvl	x1, sp, #6
	mla	z22.h, p7/m, z21.h, z27.h
	ldr	z21, [x12]
	add	x1, x1, 64
	ldr	z6, [x1]
	mla	z22.h, p7/m, z10.h, z28.h
	addvl	x1, sp, #3
	mad	z21.h, p7/m, z25.h, z31.h
	mla	z21.h, p7/m, z6.h, z26.h
	add	x1, x1, 64
	mla	z21.h, p7/m, z12.h, z29.h
	mla	z21.h, p7/m, z19.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x11, 48]
	ldr	z22, [x1]
	addvl	x1, sp, #14
	add	x1, x1, 64
	ldr	z13, [x1]
	mad	z22.h, p7/m, z24.h, z17.h
	addvl	x1, sp, #17
	mad	z13.h, p7/m, z26.h, z15.h
	mad	z20.h, p7/m, z27.h, z22.h
	add	x1, x1, 64
	ldr	z22, [x1]
	mla	z20.h, p7/m, z0.h, z28.h
	mad	z22.h, p7/m, z29.h, z13.h
	mad	z2.h, p7/m, z30.h, z22.h
	add	z20.h, z20.h, z2.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x0]
	addvl	x0, sp, #10
	movprfx	z22, z31
	mla	z22.h, p7/m, z14.h, z23.h
	ldr	z7, [x16]
	add	x0, x0, 64
	ldr	z20, [x0]
	mla	z22.h, p7/m, z20.h, z24.h
	addvl	x0, sp, #13
	sub	z4.h, z4.h, #128
	sub	z5.h, z5.h, #128
	add	x0, x0, 64
	ldr	z20, [x0]
	movprfx	z21, z22
	mla	z21.h, p7/m, z20.h, z27.h
	addvl	x0, sp, #4
	mla	z21.h, p7/m, z1.h, z28.h
	add	x0, x0, 64
	ldr	z22, [x0]
	mad	z22.h, p7/m, z25.h, z31.h
	addvl	x0, sp, #18
	mla	z22.h, p7/m, z16.h, z26.h
	mad	z8.h, p7/m, z29.h, z22.h
	add	x0, x0, 64
	mad	z3.h, p7/m, z30.h, z8.h
	add	z8.h, z21.h, z3.h
	ldr	z21, [x0]
	addvl	x0, sp, #12
	movprfx	z22, z31
	mla	z22.h, p7/m, z18.h, z23.h
	add	x0, x0, 64
	mla	z22.h, p7/m, z7.h, z24.h
	mad	z11.h, p7/m, z27.h, z22.h
	ldr	z22, [x0]
	addvl	x0, sp, #8
	mad	z21.h, p7/m, z28.h, z11.h
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z22.h, p7/m, z25.h, z31.h
	addvl	x0, sp, #11
	mla	z22.h, p7/m, z7.h, z26.h
	sqrshrunb	z8.b, z8.h, #6
	add	x0, x0, 64
	mad	z9.h, p7/m, z29.h, z22.h
	uzp1	z8.b, z8.b, z8.b
	mad	z4.h, p7/m, z30.h, z9.h
	add	z18.h, z21.h, z4.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q8, q18, [x2, 16]
	ldr	z16, [x0]
	addvl	x0, sp, #15
	ldr	z22, [x12]
	mad	z16.h, p7/m, z25.h, z31.h
	add	x0, x0, 64
	ldr	z14, [x0]
	mad	z23.h, p7/m, z22.h, z31.h
	mad	z14.h, p7/m, z26.h, z16.h
	mad	z24.h, p7/m, z6.h, z23.h
	mad	z10.h, p7/m, z29.h, z14.h
	mad	z12.h, p7/m, z27.h, z24.h
	mad	z5.h, p7/m, z30.h, z10.h
	mad	z19.h, p7/m, z28.h, z12.h
	add	z19.h, z19.h, z5.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x2, 48]
	ldp	d8, d9, [sp]
	ldp	d10, d11, [sp, 16]
	ldp	d12, d13, [sp, 32]
	ldp	d14, d15, [sp, 48]
	.cfi_remember_state
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	addvl	sp, sp, #20
	.cfi_def_cfa_offset 64
	add	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L4:
	.cfi_restore_state
	movi	d30, #0
	mov	z28.h, #1
	mov	z29.h, #-5
	mov	z27.h, #17
	mov	z26.h, #58
	mov	z24.h, #-10
	mov	z25.h, #4
	mov	z23.b, #-1
	b	.L2
	.cfi_endproc
.LFE3:
	.size	dynopt_interp8_64x16_sve2_vpp, .-dynopt_interp8_64x16_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
