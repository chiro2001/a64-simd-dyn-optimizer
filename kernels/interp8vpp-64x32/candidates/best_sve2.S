	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_64x32_sve2_vpp
	.type	dynopt_interp8_64x32_sve2_vpp, %function
dynopt_interp8_64x32_sve2_vpp:
.LFB3:
	.cfi_startproc
	addvl	sp, sp, #-19
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x98,0x1e,0x22
	sub	w5, w4, #1
	sub	sp, sp, #144
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x98,0x1e,0x23,0x90,0x1,0x22
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	stp	d8, d9, [sp, 80]
	stp	d10, d11, [sp, 96]
	stp	d12, d13, [sp, 112]
	stp	d14, d15, [sp, 128]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x48,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x88,0x1
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
	add	x16, x1, x1, lsl 1
	ptrue	p7.b, all
	lsl	x5, x1, 1
	sub	x4, x0, x16
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
	addvl	x5, sp, #4
	ld1b	z0.h, p7/z, [x4, x7]
	ld1b	z2.h, p7/z, [x4, x6]
	add	x5, x5, 144
	sub	z31.h, z31.h, #128
	str	z31, [x5]
	add	x5, x0, 16
	ld1b	z4.h, p7/z, [x0]
	ld1b	z6.h, p7/z, [x5]
	add	x5, x0, 32
	add	x0, x0, 48
	ld1b	z31.h, p7/z, [x0]
	addvl	x0, sp, #14
	lsl	x7, x1, 2
	ld1b	z5.h, p7/z, [x5]
	add	x0, x0, 144
	sub	z31.h, z31.h, #128
	str	z31, [x0]
	add	x0, x7, 16
	ld1b	z16.h, p7/z, [x4, x0]
	ld1b	z7.h, p7/z, [x4, x7]
	add	x0, x7, 32
	ld1b	z31.h, p7/z, [x4, x0]
	sub	z31.h, z31.h, #128
	addvl	x0, sp, #16
	add	x5, x4, x1, lsl 2
	sub	z7.h, z7.h, #128
	add	x0, x0, 144
	str	z31, [x0]
	add	x6, x5, x1
	add	x0, x7, 48
	ld1b	z31.h, p7/z, [x4, x0]
	add	x7, x7, x1
	addvl	x0, sp, #13
	sub	z31.h, z31.h, #128
	sub	z4.h, z4.h, #128
	add	x0, x0, 144
	str	z31, [x0]
	ld1b	z17.h, p7/z, [x5, x1]
	add	x0, x7, 16
	ld1b	z18.h, p7/z, [x4, x0]
	add	x5, x5, x1, lsl 1
	add	x0, x7, 32
	ld1b	z31.h, p7/z, [x4, x0]
	sub	z31.h, z31.h, #128
	addvl	x0, sp, #10
	sub	z17.h, z17.h, #128
	sub	z1.h, z1.h, #128
	add	x0, x0, 144
	str	z31, [x0]
	sub	z13.h, z13.h, #128
	add	x0, x7, 48
	ld1b	z31.h, p7/z, [x4, x0]
	sub	z31.h, z31.h, #128
	addvl	x0, sp, #1
	sub	z10.h, z10.h, #128
	sub	z18.h, z18.h, #128
	add	x0, x0, 144
	str	z31, [x0]
	ld1b	z19.h, p7/z, [x1, x6]
	lsl	x0, x16, 1
	sub	z19.h, z19.h, #128
	sub	z16.h, z16.h, #128
	add	x6, x0, 16
	ld1b	z20.h, p7/z, [x4, x6]
	sub	z6.h, z6.h, #128
	add	x6, x0, 32
	add	x0, x0, 48
	ld1b	z31.h, p7/z, [x4, x6]
	addvl	x6, sp, #2
	sub	z31.h, z31.h, #128
	sub	z20.h, z20.h, #128
	add	x6, x6, 144
	str	z31, [x6]
	ld1b	z31.h, p7/z, [x4, x0]
	addvl	x0, sp, #7
	sub	z31.h, z31.h, #128
	add	x6, x1, x5
	add	x0, x0, 144
	str	z31, [x0]
	ld1b	z21.h, p7/z, [x1, x5]
	lsl	x0, x1, 3
	sub	z21.h, z21.h, #128
	sub	z3.h, z3.h, #128
	sub	x13, x0, x1
	sub	z15.h, z15.h, #128
	sub	z9.h, z9.h, #128
	add	x8, x13, 16
	ld1b	z22.h, p7/z, [x4, x8]
	sub	z22.h, z22.h, #128
	add	x8, x13, 32
	ld1b	z31.h, p7/z, [x4, x8]
	sub	z31.h, z31.h, #128
	addvl	x8, sp, #5
	sub	z2.h, z2.h, #128
	sub	z12.h, z12.h, #128
	add	x8, x8, 144
	str	z31, [x8]
	sub	z5.h, z5.h, #128
	add	x8, x13, 48
	ld1b	z31.h, p7/z, [x4, x8]
	movprfx	z8, z31
	sub	z8.h, z8.h, #128
	add	x8, sp, 144
	str	z8, [x8]
	ld1b	z31.h, p7/z, [x1, x6]
	addvl	x6, sp, #12
	sub	z31.h, z31.h, #128
	sub	z14.h, z14.h, #128
	add	x6, x6, 144
	str	z31, [x6]
	sub	z11.h, z11.h, #128
	add	x6, x0, 16
	ld1b	z31.h, p7/z, [x4, x6]
	sub	z31.h, z31.h, #128
	addvl	x6, sp, #3
	sub	z0.h, z0.h, #128
	add	x5, x5, x1, lsl 1
	add	x6, x6, 144
	str	z31, [x6]
	addvl	x9, sp, #3
	add	x6, x0, 32
	ld1b	z31.h, p7/z, [x4, x6]
	sub	z31.h, z31.h, #128
	addvl	x6, sp, #9
	add	x9, x9, 144
	add	x6, x6, 144
	str	z31, [x6]
	lsl	x10, x7, 1
	add	x6, x0, 48
	ld1b	z31.h, p7/z, [x4, x6]
	movprfx	z8, z31
	sub	z8.h, z8.h, #128
	addvl	x6, sp, #17
	mov	z31.h, #4096
	mad	z10.h, p7/m, z23.h, z31.h
	add	x6, x6, 144
	str	z8, [x6]
	mla	z10.h, p7/m, z1.h, z24.h
	addvl	x6, sp, #16
	mla	z10.h, p7/m, z7.h, z27.h
	movprfx	z8, z31
	mla	z8.h, p7/m, z13.h, z25.h
	mla	z10.h, p7/m, z19.h, z28.h
	mla	z8.h, p7/m, z4.h, z26.h
	add	x6, x6, 144
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
	ldr	z10, [x6]
	addvl	x6, sp, #2
	mad	z12.h, p7/m, z23.h, z31.h
	mla	z12.h, p7/m, z2.h, z24.h
	add	x6, x6, 144
	mla	z12.h, p7/m, z10.h, z27.h
	ldr	z10, [x6]
	addvl	x6, sp, #10
	mla	z12.h, p7/m, z10.h, z28.h
	movprfx	z10, z31
	mla	z10.h, p7/m, z14.h, z25.h
	add	x6, x6, 144
	ldr	z9, [x6]
	mla	z10.h, p7/m, z5.h, z26.h
	addvl	x6, sp, #5
	mla	z10.h, p7/m, z9.h, z29.h
	mad	z11.h, p7/m, z23.h, z31.h
	add	x6, x6, 144
	ldr	z9, [x6]
	mla	z10.h, p7/m, z9.h, z30.h
	addvl	x6, sp, #4
	add	z12.h, z12.h, z10.h
	add	x0, x0, x1
	add	x6, x6, 144
	ldr	z10, [x6]
	mla	z11.h, p7/m, z10.h, z24.h
	addvl	x6, sp, #13
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	add	x6, x6, 144
	ldr	z10, [x6]
	mla	z11.h, p7/m, z10.h, z27.h
	addvl	x6, sp, #7
	mad	z13.h, p7/m, z23.h, z31.h
	mla	z13.h, p7/m, z4.h, z24.h
	add	x6, x6, 144
	ldr	z10, [x6]
	mla	z11.h, p7/m, z10.h, z28.h
	addvl	x6, sp, #14
	movprfx	z10, z31
	mla	z10.h, p7/m, z0.h, z25.h
	mla	z13.h, p7/m, z17.h, z27.h
	add	x6, x6, 144
	ldr	z8, [x6]
	mla	z10.h, p7/m, z8.h, z26.h
	addvl	x6, sp, #1
	mla	z13.h, p7/m, z21.h, z28.h
	mad	z15.h, p7/m, z23.h, z31.h
	add	x6, x6, 144
	ldr	z8, [x6]
	mla	z10.h, p7/m, z8.h, z29.h
	addvl	x6, sp, #6
	ldr	z8, [x8]
	mla	z10.h, p7/m, z8.h, z30.h
	add	x6, x6, 144
	add	z11.h, z11.h, z10.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	stp	q12, q11, [x2, 32]
	ld1b	z12.h, p7/z, [x1, x5]
	sub	z12.h, z12.h, #128
	str	z12, [x6]
	add	x6, x0, 16
	ld1b	z12.h, p7/z, [x4, x6]
	add	x6, x0, 32
	movprfx	z10, z12
	sub	z10.h, z10.h, #128
	ld1b	z12.h, p7/z, [x4, x6]
	add	x6, sp, 144
	sub	z12.h, z12.h, #128
	str	z12, [x6]
	add	x6, x0, 48
	ld1b	z12.h, p7/z, [x4, x6]
	addvl	x6, sp, #11
	sub	z12.h, z12.h, #128
	mla	z15.h, p7/m, z6.h, z24.h
	add	x6, x6, 144
	str	z12, [x6]
	movprfx	z12, z31
	mla	z12.h, p7/m, z1.h, z25.h
	addvl	x6, sp, #12
	mla	z12.h, p7/m, z7.h, z26.h
	mla	z12.h, p7/m, z19.h, z29.h
	add	x6, x6, 144
	ldr	z11, [x6]
	mla	z12.h, p7/m, z11.h, z30.h
	add	z13.h, z13.h, z12.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x2, x3]
	ldr	z12, [x9]
	addvl	x9, sp, #10
	movprfx	z13, z31
	mla	z13.h, p7/m, z3.h, z25.h
	add	x9, x9, 144
	mla	z13.h, p7/m, z16.h, z26.h
	mla	z13.h, p7/m, z20.h, z29.h
	mla	z13.h, p7/m, z12.h, z30.h
	mla	z15.h, p7/m, z18.h, z27.h
	mla	z15.h, p7/m, z22.h, z28.h
	add	z15.h, z15.h, z13.h
	ldr	z13, [x9]
	addvl	x9, sp, #16
	mov	z12.d, z9.d
	mad	z14.h, p7/m, z23.h, z31.h
	add	x9, x9, 144
	mla	z14.h, p7/m, z5.h, z24.h
	mla	z14.h, p7/m, z13.h, z27.h
	mla	z14.h, p7/m, z9.h, z28.h
	ldr	z9, [x9]
	addvl	x9, sp, #2
	add	x9, x9, 144
	movprfx	z13, z31
	mla	z13.h, p7/m, z2.h, z25.h
	mla	z13.h, p7/m, z9.h, z26.h
	ldr	z9, [x9]
	addvl	x9, sp, #9
	add	x6, x2, x3
	add	x9, x9, 144
	mla	z13.h, p7/m, z9.h, z29.h
	ldr	z9, [x9]
	addvl	x9, sp, #14
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	add	x9, x9, 144
	mla	z13.h, p7/m, z9.h, z30.h
	add	z14.h, z14.h, z13.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	stp	q15, q14, [x6, 16]
	ldr	z15, [x9]
	addvl	x9, sp, #1
	mad	z0.h, p7/m, z23.h, z31.h
	add	x9, x9, 144
	mla	z0.h, p7/m, z15.h, z24.h
	ldr	z15, [x9]
	addvl	x9, sp, #4
	mla	z0.h, p7/m, z15.h, z27.h
	add	x8, x1, x5
	add	x9, x9, 144
	ldr	z14, [x9]
	movprfx	z15, z31
	mla	z15.h, p7/m, z14.h, z25.h
	addvl	x9, sp, #13
	mla	z0.h, p7/m, z8.h, z28.h
	mov	z9.d, z8.d
	add	x9, x9, 144
	ldr	z14, [x9]
	mla	z15.h, p7/m, z14.h, z26.h
	addvl	x9, sp, #7
	mad	z1.h, p7/m, z23.h, z31.h
	mla	z1.h, p7/m, z7.h, z24.h
	add	x9, x9, 144
	ldr	z14, [x9]
	mla	z15.h, p7/m, z14.h, z29.h
	addvl	x9, sp, #17
	mla	z1.h, p7/m, z19.h, z27.h
	mla	z1.h, p7/m, z11.h, z28.h
	add	x9, x9, 144
	ldr	z13, [x9]
	mla	z15.h, p7/m, z13.h, z30.h
	add	z0.h, z0.h, z15.h
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x6, 48]
	ld1b	z15.h, p7/z, [x1, x8]
	addvl	x8, sp, #5
	add	x8, x8, 144
	sub	z15.h, z15.h, #128
	str	z15, [x8]
	add	x8, x10, 16
	ld1b	z15.h, p7/z, [x4, x8]
	movprfx	z8, z15
	sub	z8.h, z8.h, #128
	add	x8, x10, 32
	ld1b	z15.h, p7/z, [x4, x8]
	movprfx	z0, z15
	sub	z0.h, z0.h, #128
	add	x8, x10, 48
	ld1b	z15.h, p7/z, [x4, x8]
	sub	z15.h, z15.h, #128
	addvl	x8, sp, #8
	addvl	x9, sp, #16
	mad	z3.h, p7/m, z23.h, z31.h
	add	x8, x8, 144
	str	z15, [x8]
	movprfx	z15, z31
	mla	z15.h, p7/m, z4.h, z25.h
	addvl	x8, sp, #6
	mla	z15.h, p7/m, z17.h, z26.h
	mla	z15.h, p7/m, z21.h, z29.h
	add	x8, x8, 144
	ldr	z14, [x8]
	mla	z15.h, p7/m, z14.h, z30.h
	addvl	x8, sp, #3
	add	z1.h, z1.h, z15.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	mla	z3.h, p7/m, z16.h, z24.h
	add	x9, x9, 144
	mla	z3.h, p7/m, z20.h, z27.h
	add	x8, x8, 144
	str	q1, [x6, x3]
	ldr	z1, [x8]
	mla	z3.h, p7/m, z1.h, z28.h
	movprfx	z15, z31
	mla	z15.h, p7/m, z6.h, z25.h
	mla	z15.h, p7/m, z18.h, z26.h
	mla	z15.h, p7/m, z22.h, z29.h
	mla	z15.h, p7/m, z10.h, z30.h
	add	z15.h, z3.h, z15.h
	ldr	z3, [x9]
	addvl	x9, sp, #2
	add	x9, x9, 144
	ldr	z14, [x9]
	mad	z2.h, p7/m, z23.h, z31.h
	addvl	x9, sp, #9
	mla	z2.h, p7/m, z3.h, z24.h
	mla	z2.h, p7/m, z14.h, z27.h
	add	x9, x9, 144
	ldr	z14, [x9]
	add	x8, x2, x3, lsl 1
	addvl	x9, sp, #10
	mla	z2.h, p7/m, z14.h, z28.h
	movprfx	z14, z31
	mla	z14.h, p7/m, z5.h, z25.h
	add	x9, x9, 144
	ldr	z3, [x9]
	mla	z14.h, p7/m, z3.h, z26.h
	add	x9, sp, 144
	ldr	z3, [x9]
	mla	z14.h, p7/m, z12.h, z29.h
	addvl	x9, sp, #4
	mla	z14.h, p7/m, z3.h, z30.h
	add	z2.h, z2.h, z14.h
	add	x9, x9, 144
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	stp	q15, q2, [x8, 16]
	ldr	z2, [x9]
	addvl	x9, sp, #13
	movprfx	z15, z31
	mla	z15.h, p7/m, z2.h, z23.h
	add	x9, x9, 144
	ldr	z2, [x9]
	mla	z15.h, p7/m, z2.h, z24.h
	addvl	x9, sp, #7
	add	x10, x10, x1
	mad	z4.h, p7/m, z23.h, z31.h
	add	x9, x9, 144
	ldr	z3, [x9]
	mla	z15.h, p7/m, z3.h, z27.h
	addvl	x9, sp, #14
	mla	z15.h, p7/m, z13.h, z28.h
	add	x5, x5, x1, lsl 1
	add	x9, x9, 144
	ldr	z14, [x9]
	mad	z14.h, p7/m, z25.h, z31.h
	addvl	x9, sp, #1
	add	x12, x6, x3
	mla	z4.h, p7/m, z17.h, z24.h
	add	x9, x9, 144
	ldr	z2, [x9]
	mla	z14.h, p7/m, z2.h, z26.h
	addvl	x9, sp, #11
	mla	z14.h, p7/m, z9.h, z29.h
	mla	z4.h, p7/m, z21.h, z27.h
	add	x9, x9, 144
	ldr	z2, [x9]
	mla	z14.h, p7/m, z2.h, z30.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x8, 48]
	add	x8, x10, 16
	ld1b	z15.h, p7/z, [x1, x5]
	movprfx	z14, z15
	sub	z14.h, z14.h, #128
	ld1b	z15.h, p7/z, [x4, x8]
	add	x8, x10, 32
	movprfx	z3, z15
	sub	z3.h, z3.h, #128
	ld1b	z15.h, p7/z, [x4, x8]
	addvl	x8, sp, #4
	add	x8, x8, 144
	sub	z15.h, z15.h, #128
	str	z15, [x8]
	add	x8, x10, 48
	ld1b	z15.h, p7/z, [x4, x8]
	sub	z15.h, z15.h, #128
	addvl	x8, sp, #15
	mad	z5.h, p7/m, z23.h, z31.h
	mad	z6.h, p7/m, z23.h, z31.h
	add	x8, x8, 144
	str	z15, [x8]
	movprfx	z15, z31
	mla	z15.h, p7/m, z7.h, z25.h
	addvl	x8, sp, #6
	mla	z15.h, p7/m, z19.h, z26.h
	mla	z15.h, p7/m, z11.h, z29.h
	add	x8, x8, 144
	ldr	z2, [x8]
	mla	z4.h, p7/m, z2.h, z28.h
	addvl	x8, sp, #5
	mla	z6.h, p7/m, z18.h, z24.h
	mla	z6.h, p7/m, z22.h, z27.h
	add	x8, x8, 144
	ldr	z2, [x8]
	mla	z15.h, p7/m, z2.h, z30.h
	add	z4.h, z4.h, z15.h
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x3, x12]
	addvl	x12, sp, #10
	mla	z6.h, p7/m, z10.h, z28.h
	add	x12, x12, 144
	ldr	z4, [x12]
	mla	z5.h, p7/m, z4.h, z24.h
	add	x12, sp, 144
	mov	z4.d, z12.d
	mla	z5.h, p7/m, z12.h, z27.h
	ldr	z12, [x12]
	addvl	x12, sp, #16
	movprfx	z15, z31
	mla	z15.h, p7/m, z16.h, z25.h
	add	x12, x12, 144
	mla	z15.h, p7/m, z20.h, z26.h
	mla	z15.h, p7/m, z1.h, z29.h
	mla	z15.h, p7/m, z8.h, z30.h
	add	z15.h, z6.h, z15.h
	ldr	z6, [x12]
	addvl	x12, sp, #2
	addvl	x8, sp, #3
	mla	z5.h, p7/m, z12.h, z28.h
	add	x12, x12, 144
	ldr	z2, [x12]
	add	x11, x3, x3, lsl 1
	add	x8, x8, 144
	addvl	x12, sp, #9
	str	z1, [x8]
	add	x12, x12, 144
	add	x8, x2, x11
	movprfx	z12, z31
	mla	z12.h, p7/m, z6.h, z25.h
	ldr	z6, [x12]
	addvl	x12, sp, #14
	sqrshrunb	z15.b, z15.h, #6
	add	x12, x12, 144
	uzp1	z15.b, z15.b, z15.b
	mla	z12.h, p7/m, z2.h, z26.h
	mla	z12.h, p7/m, z6.h, z29.h
	mla	z12.h, p7/m, z0.h, z30.h
	add	z5.h, z5.h, z12.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	stp	q15, q5, [x8, 16]
	ldr	z15, [x12]
	addvl	x12, sp, #1
	mad	z15.h, p7/m, z23.h, z31.h
	add	x12, x12, 144
	ldr	z5, [x12]
	mla	z15.h, p7/m, z5.h, z24.h
	addvl	x12, sp, #11
	mov	z5.d, z9.d
	mla	z15.h, p7/m, z9.h, z27.h
	add	x12, x12, 144
	ldr	z9, [x12]
	lsl	x19, x16, 2
	addvl	x12, sp, #13
	mla	z15.h, p7/m, z9.h, z28.h
	add	x9, x1, x5
	add	x12, x12, 144
	ldr	z12, [x12]
	mad	z12.h, p7/m, z25.h, z31.h
	addvl	x12, sp, #7
	add	x6, x6, x3, lsl 1
	mad	z7.h, p7/m, z23.h, z31.h
	add	x12, x12, 144
	ldr	z9, [x12]
	mla	z12.h, p7/m, z9.h, z26.h
	addvl	x12, sp, #8
	mla	z12.h, p7/m, z13.h, z29.h
	mla	z7.h, p7/m, z19.h, z24.h
	add	x12, x12, 144
	ldr	z6, [x12]
	mla	z12.h, p7/m, z6.h, z30.h
	add	z15.h, z15.h, z12.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x8, 48]
	add	x8, x19, 16
	ld1b	z12.h, p7/z, [x4, x8]
	add	x8, x19, 32
	movprfx	z6, z12
	sub	z6.h, z6.h, #128
	ld1b	z12.h, p7/z, [x4, x8]
	add	x8, x19, 48
	movprfx	z1, z12
	sub	z1.h, z1.h, #128
	ld1b	z12.h, p7/z, [x4, x8]
	addvl	x8, sp, #14
	ld1b	z15.h, p7/z, [x1, x9]
	sub	z12.h, z12.h, #128
	add	x8, x8, 144
	str	z12, [x8]
	addvl	x9, sp, #16
	addvl	x8, sp, #12
	mla	z7.h, p7/m, z11.h, z27.h
	add	x9, x9, 144
	add	x8, x8, 144
	str	z11, [x8]
	mad	z16.h, p7/m, z23.h, z31.h
	addvl	x8, sp, #5
	mla	z16.h, p7/m, z20.h, z24.h
	add	x19, x19, x1
	add	x8, x8, 144
	ldr	z12, [x8]
	mla	z7.h, p7/m, z12.h, z28.h
	addvl	x8, sp, #6
	movprfx	z12, z31
	mla	z12.h, p7/m, z17.h, z25.h
	mla	z12.h, p7/m, z21.h, z26.h
	add	x8, x8, 144
	ldr	z11, [x8]
	mla	z12.h, p7/m, z11.h, z29.h
	mla	z12.h, p7/m, z14.h, z30.h
	add	z7.h, z7.h, z12.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x6]
	movprfx	z12, z31
	mla	z12.h, p7/m, z18.h, z25.h
	ldr	z7, [x9]
	addvl	x9, sp, #2
	mla	z12.h, p7/m, z22.h, z26.h
	add	x9, x9, 144
	str	z2, [x9]
	mla	z12.h, p7/m, z10.h, z29.h
	addvl	x9, sp, #9
	mla	z12.h, p7/m, z3.h, z30.h
	addvl	x8, sp, #3
	add	x9, x9, 144
	ldr	z9, [x9]
	add	x8, x8, 144
	addvl	x9, sp, #10
	ldr	z11, [x8]
	mla	z16.h, p7/m, z11.h, z27.h
	add	x9, x9, 144
	mla	z16.h, p7/m, z8.h, z28.h
	add	z16.h, z16.h, z12.h
	movprfx	z12, z31
	mla	z12.h, p7/m, z7.h, z23.h
	ldr	z7, [x9]
	add	x9, sp, 144
	mla	z12.h, p7/m, z2.h, z24.h
	mla	z12.h, p7/m, z9.h, z27.h
	movprfx	z9, z31
	mla	z9.h, p7/m, z7.h, z25.h
	ldr	z7, [x9]
	addvl	x9, sp, #4
	add	x8, x2, x3, lsl 2
	add	x9, x9, 144
	ldr	z2, [x9]
	sqrshrunb	z16.b, z16.h, #6
	addvl	x9, sp, #13
	uzp1	z16.b, z16.b, z16.b
	mla	z12.h, p7/m, z0.h, z28.h
	add	x9, x9, 144
	mla	z9.h, p7/m, z4.h, z26.h
	mla	z9.h, p7/m, z7.h, z29.h
	mla	z9.h, p7/m, z2.h, z30.h
	add	z12.h, z12.h, z9.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	stp	q16, q12, [x8, 16]
	ldr	z16, [x9]
	addvl	x9, sp, #7
	mad	z16.h, p7/m, z23.h, z31.h
	mov	z7.d, z5.d
	add	x9, x9, 144
	ldr	z12, [x9]
	mla	z16.h, p7/m, z12.h, z24.h
	addvl	x9, sp, #17
	mla	z16.h, p7/m, z13.h, z27.h
	add	x5, x5, x1, lsl 1
	add	x9, x9, 144
	str	z13, [x9]
	add	x12, x3, x6
	addvl	x9, sp, #8
	mad	z17.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z21.h, z24.h
	add	x9, x9, 144
	ldr	z12, [x9]
	mla	z16.h, p7/m, z12.h, z28.h
	addvl	x9, sp, #1
	sub	z15.h, z15.h, #128
	mad	z18.h, p7/m, z23.h, z31.h
	add	x9, x9, 144
	ldr	z2, [x9]
	movprfx	z12, z31
	mla	z12.h, p7/m, z2.h, z25.h
	addvl	x9, sp, #11
	mla	z12.h, p7/m, z5.h, z26.h
	mla	z18.h, p7/m, z22.h, z24.h
	add	x9, x9, 144
	ldr	z9, [x9]
	mla	z12.h, p7/m, z9.h, z29.h
	addvl	x9, sp, #15
	mla	z18.h, p7/m, z10.h, z27.h
	mla	z18.h, p7/m, z3.h, z28.h
	add	x9, x9, 144
	ldr	z5, [x9]
	mla	z12.h, p7/m, z5.h, z30.h
	add	z16.h, z16.h, z12.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x8, 48]
	add	x8, x19, 16
	ld1b	z12.h, p7/z, [x4, x8]
	add	x8, x19, 32
	movprfx	z9, z12
	sub	z9.h, z9.h, #128
	ld1b	z12.h, p7/z, [x4, x8]
	addvl	x8, sp, #3
	ld1b	z16.h, p7/z, [x1, x5]
	movprfx	z5, z12
	sub	z5.h, z5.h, #128
	add	x8, x8, 144
	str	z5, [x8]
	add	x14, x3, x3, lsl 2
	add	x8, x19, 48
	ld1b	z12.h, p7/z, [x4, x8]
	movprfx	z2, z12
	sub	z2.h, z2.h, #128
	addvl	x8, sp, #13
	movprfx	z12, z31
	mla	z12.h, p7/m, z19.h, z25.h
	add	x9, x1, x5
	add	x8, x8, 144
	str	z2, [x8]
	add	x6, x6, x3, lsl 1
	addvl	x8, sp, #6
	sub	z16.h, z16.h, #128
	mad	z19.h, p7/m, z23.h, z31.h
	add	x8, x8, 144
	ldr	z5, [x8]
	mla	z17.h, p7/m, z5.h, z27.h
	addvl	x8, sp, #12
	mla	z17.h, p7/m, z14.h, z28.h
	add	x5, x5, x1, lsl 1
	add	x8, x8, 144
	ldr	z5, [x8]
	mla	z12.h, p7/m, z5.h, z26.h
	addvl	x8, sp, #5
	mla	z19.h, p7/m, z5.h, z24.h
	add	x18, sp, 144
	add	x8, x8, 144
	ldr	z13, [x8]
	mla	z12.h, p7/m, z13.h, z29.h
	mla	z12.h, p7/m, z15.h, z30.h
	add	z17.h, z17.h, z12.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x12]
	addvl	x12, sp, #10
	movprfx	z17, z31
	mla	z17.h, p7/m, z20.h, z25.h
	add	x12, x12, 144
	mla	z17.h, p7/m, z11.h, z26.h
	mla	z17.h, p7/m, z8.h, z29.h
	mla	z17.h, p7/m, z6.h, z30.h
	add	z18.h, z18.h, z17.h
	ldr	z17, [x12]
	add	x12, sp, 144
	ldr	z12, [x12]
	addvl	x12, sp, #4
	mad	z17.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z4.h, z24.h
	add	x12, x12, 144
	ldr	z2, [x12]
	mla	z17.h, p7/m, z12.h, z27.h
	addvl	x12, sp, #2
	mla	z17.h, p7/m, z2.h, z28.h
	add	x8, x2, x14
	add	x12, x12, 144
	ldr	z2, [x12]
	sqrshrunb	z18.b, z18.h, #6
	addvl	x12, sp, #9
	uzp1	z18.b, z18.b, z18.b
	movprfx	z12, z31
	mla	z12.h, p7/m, z2.h, z25.h
	add	x12, x12, 144
	ldr	z13, [x12]
	mla	z12.h, p7/m, z13.h, z26.h
	addvl	x12, sp, #1
	mla	z12.h, p7/m, z0.h, z29.h
	mla	z12.h, p7/m, z1.h, z30.h
	add	x12, x12, 144
	add	z17.h, z17.h, z12.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	stp	q18, q17, [x8, 16]
	ldr	z18, [x12]
	addvl	x12, sp, #11
	mad	z18.h, p7/m, z23.h, z31.h
	mla	z18.h, p7/m, z7.h, z24.h
	add	x12, x12, 144
	ldr	z17, [x12]
	mla	z18.h, p7/m, z17.h, z27.h
	addvl	x12, sp, #15
	mad	z20.h, p7/m, z23.h, z31.h
	mla	z20.h, p7/m, z11.h, z24.h
	add	x12, x12, 144
	ldr	z17, [x12]
	mla	z18.h, p7/m, z17.h, z28.h
	addvl	x12, sp, #7
	mla	z20.h, p7/m, z8.h, z27.h
	mla	z20.h, p7/m, z6.h, z28.h
	add	x12, x12, 144
	ldr	z17, [x12]
	mad	z17.h, p7/m, z25.h, z31.h
	addvl	x12, sp, #17
	lsl	x30, x3, 3
	add	x12, x12, 144
	ldr	z12, [x12]
	mla	z17.h, p7/m, z12.h, z26.h
	addvl	x12, sp, #8
	add	x15, x1, x5
	add	x12, x12, 144
	ldr	z12, [x12]
	mla	z17.h, p7/m, z12.h, z29.h
	addvl	x12, sp, #14
	addvl	x22, sp, #1
	add	x12, x12, 144
	ldr	z12, [x12]
	mla	z17.h, p7/m, z12.h, z30.h
	add	z18.h, z18.h, z17.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x8, 48]
	lsl	x8, x13, 1
	ld1b	z17.h, p7/z, [x1, x9]
	add	x9, x8, 16
	ld1b	z18.h, p7/z, [x4, x9]
	sub	z17.h, z17.h, #128
	add	x9, x8, 32
	add	x8, x8, 48
	ld1b	z12.h, p7/z, [x4, x9]
	addvl	x9, sp, #1
	movprfx	z2, z12
	sub	z2.h, z2.h, #128
	addvl	x12, sp, #2
	add	x9, x9, 144
	str	z2, [x9]
	ld1b	z12.h, p7/z, [x4, x8]
	addvl	x8, sp, #16
	movprfx	z13, z12
	sub	z13.h, z13.h, #128
	movprfx	z12, z31
	mla	z12.h, p7/m, z21.h, z25.h
	add	x8, x8, 144
	str	z13, [x8]
	add	x12, x12, 144
	addvl	x8, sp, #5
	add	x9, x3, x6
	mad	z21.h, p7/m, z23.h, z31.h
	add	x8, x8, 144
	ldr	z13, [x8]
	mla	z19.h, p7/m, z13.h, z27.h
	addvl	x8, sp, #6
	mla	z19.h, p7/m, z15.h, z28.h
	sub	z18.h, z18.h, #128
	add	x8, x8, 144
	ldr	z13, [x8]
	mla	z12.h, p7/m, z13.h, z26.h
	mla	z12.h, p7/m, z14.h, z29.h
	mla	z12.h, p7/m, z16.h, z30.h
	add	z19.h, z19.h, z12.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x6]
	movprfx	z19, z31
	mla	z19.h, p7/m, z22.h, z25.h
	mla	z19.h, p7/m, z10.h, z26.h
	mla	z19.h, p7/m, z3.h, z29.h
	mla	z19.h, p7/m, z9.h, z30.h
	add	z20.h, z20.h, z19.h
	add	x8, x2, x11, lsl 1
	ldr	z19, [x12]
	addvl	x12, sp, #9
	mad	z19.h, p7/m, z23.h, z31.h
	add	x12, x12, 144
	ldr	z13, [x12]
	mla	z19.h, p7/m, z13.h, z24.h
	add	x12, sp, 144
	ldr	z13, [x12]
	movprfx	z12, z31
	mla	z12.h, p7/m, z4.h, z25.h
	addvl	x12, sp, #4
	mla	z12.h, p7/m, z13.h, z26.h
	sqrshrunb	z20.b, z20.h, #6
	add	x12, x12, 144
	ldr	z2, [x12]
	mla	z12.h, p7/m, z2.h, z29.h
	addvl	x12, sp, #3
	uzp1	z20.b, z20.b, z20.b
	mla	z19.h, p7/m, z0.h, z27.h
	add	x12, x12, 144
	ldr	z2, [x12]
	mla	z19.h, p7/m, z1.h, z28.h
	addvl	x12, sp, #7
	mla	z12.h, p7/m, z2.h, z30.h
	add	z19.h, z19.h, z12.h
	add	x12, x12, 144
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	stp	q20, q19, [x8, 16]
	ldr	z20, [x12]
	addvl	x12, sp, #17
	add	x12, x12, 144
	ldr	z12, [x12]
	mad	z20.h, p7/m, z23.h, z31.h
	addvl	x12, sp, #8
	mla	z20.h, p7/m, z12.h, z24.h
	mad	z22.h, p7/m, z23.h, z31.h
	add	x12, x12, 144
	ldr	z19, [x12]
	mla	z20.h, p7/m, z19.h, z27.h
	addvl	x12, sp, #14
	mla	z22.h, p7/m, z10.h, z24.h
	mla	z22.h, p7/m, z3.h, z27.h
	add	x12, x12, 144
	ldr	z19, [x12]
	mla	z20.h, p7/m, z19.h, z28.h
	addvl	x12, sp, #11
	movprfx	z19, z31
	mla	z19.h, p7/m, z7.h, z25.h
	mla	z22.h, p7/m, z9.h, z28.h
	add	x12, x12, 144
	ldr	z12, [x12]
	mla	z19.h, p7/m, z12.h, z26.h
	addvl	x12, sp, #15
	add	x6, x6, x3, lsl 1
	add	x12, x12, 144
	ldr	z12, [x12]
	mla	z19.h, p7/m, z12.h, z29.h
	addvl	x12, sp, #13
	add	x22, x22, 144
	add	x12, x12, 144
	ldr	z2, [x12]
	mla	z19.h, p7/m, z2.h, z30.h
	lsl	x12, x1, 4
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	sub	x17, x12, x1
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x8, 48]
	add	x8, x17, 16
	ld1b	z20.h, p7/z, [x4, x8]
	ld1b	z19.h, p7/z, [x1, x5]
	addvl	x8, sp, #2
	sub	z20.h, z20.h, #128
	sub	z19.h, z19.h, #128
	add	x8, x8, 144
	str	z20, [x8]
	add	x5, x5, x1, lsl 1
	add	x8, x17, 32
	ld1b	z12.h, p7/z, [x4, x8]
	sub	z12.h, z12.h, #128
	addvl	x8, sp, #10
	addvl	x23, sp, #3
	add	x8, x8, 144
	str	z12, [x8]
	add	x23, x23, 144
	add	x8, x17, 48
	ld1b	z12.h, p7/z, [x4, x8]
	movprfx	z2, z12
	sub	z2.h, z2.h, #128
	addvl	x8, sp, #7
	lsl	x10, x10, 1
	add	x8, x8, 144
	str	z2, [x8]
	addvl	x25, sp, #12
	addvl	x8, sp, #6
	add	x25, x25, 144
	add	x8, x8, 144
	ldr	z12, [x8]
	mla	z21.h, p7/m, z12.h, z24.h
	addvl	x8, sp, #12
	mla	z21.h, p7/m, z14.h, z27.h
	movprfx	z12, z31
	mla	z12.h, p7/m, z5.h, z25.h
	add	x8, x8, 144
	str	z5, [x8]
	mla	z21.h, p7/m, z16.h, z28.h
	addvl	x8, sp, #5
	add	x8, x8, 144
	ldr	z5, [x8]
	mla	z12.h, p7/m, z5.h, z26.h
	mla	z12.h, p7/m, z15.h, z29.h
	mla	z12.h, p7/m, z17.h, z30.h
	add	z21.h, z21.h, z12.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x9]
	str	z13, [x18]
	addvl	x18, sp, #4
	movprfx	z21, z31
	mla	z21.h, p7/m, z11.h, z25.h
	add	x18, x18, 144
	ldr	z2, [x18]
	mla	z21.h, p7/m, z8.h, z26.h
	addvl	x18, sp, #3
	mla	z21.h, p7/m, z6.h, z29.h
	mla	z21.h, p7/m, z18.h, z30.h
	add	x18, x18, 144
	add	z22.h, z22.h, z21.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z4.h, z23.h
	mla	z21.h, p7/m, z13.h, z24.h
	mla	z21.h, p7/m, z2.h, z27.h
	ldr	z2, [x18]
	addvl	x18, sp, #9
	sub	x8, x30, x3
	mla	z21.h, p7/m, z2.h, z28.h
	add	x18, x18, 144
	ldr	z4, [x18]
	add	x9, x2, x8
	addvl	x18, sp, #1
	movprfx	z12, z31
	mla	z12.h, p7/m, z4.h, z25.h
	mla	z12.h, p7/m, z0.h, z26.h
	add	x18, x18, 144
	ldr	z2, [x18]
	mla	z12.h, p7/m, z1.h, z29.h
	addvl	x18, sp, #11
	mla	z12.h, p7/m, z2.h, z30.h
	add	z21.h, z21.h, z12.h
	add	x18, x18, 144
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	stp	q22, q21, [x9, 16]
	ldr	z21, [x18]
	addvl	x18, sp, #15
	movprfx	z22, z31
	mla	z22.h, p7/m, z7.h, z23.h
	add	x18, x18, 144
	ldr	z7, [x18]
	mla	z22.h, p7/m, z21.h, z24.h
	addvl	x18, sp, #13
	mla	z22.h, p7/m, z7.h, z27.h
	add	x18, x18, 144
	ldr	z21, [x18]
	mla	z22.h, p7/m, z21.h, z28.h
	addvl	x18, sp, #17
	add	x18, x18, 144
	ldr	z13, [x18]
	movprfx	z21, z31
	mla	z21.h, p7/m, z13.h, z25.h
	addvl	x18, sp, #8
	add	x18, x18, 144
	ldr	z7, [x18]
	mla	z21.h, p7/m, z7.h, z26.h
	addvl	x18, sp, #14
	add	x18, x18, 144
	ldr	z12, [x18]
	mla	z21.h, p7/m, z12.h, z29.h
	addvl	x18, sp, #16
	add	x18, x18, 144
	ldr	z7, [x18]
	mla	z21.h, p7/m, z7.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x9, 48]
	add	x9, x12, 16
	ld1b	z7.h, p7/z, [x4, x9]
	add	x9, x12, 32
	ld1b	z22.h, p7/z, [x4, x9]
	ld1b	z5.h, p7/z, [x1, x15]
	addvl	x9, sp, #9
	sub	z22.h, z22.h, #128
	addvl	x15, sp, #1
	add	x9, x9, 144
	str	z22, [x9]
	add	x15, x15, 144
	add	x9, x12, 48
	ld1b	z22.h, p7/z, [x4, x9]
	movprfx	z20, z22
	sub	z20.h, z20.h, #128
	addvl	x9, sp, #12
	add	x12, x12, x1
	sub	z5.h, z5.h, #128
	add	x9, x9, 144
	ldr	z22, [x9]
	mad	z22.h, p7/m, z23.h, z31.h
	addvl	x9, sp, #5
	add	x18, x3, x6
	sub	z7.h, z7.h, #128
	add	x9, x9, 144
	ldr	z21, [x9]
	mla	z22.h, p7/m, z21.h, z24.h
	addvl	x9, sp, #6
	mla	z22.h, p7/m, z15.h, z27.h
	mla	z22.h, p7/m, z17.h, z28.h
	add	x9, x9, 144
	ldr	z21, [x9]
	mad	z21.h, p7/m, z25.h, z31.h
	addvl	x9, sp, #2
	mla	z21.h, p7/m, z14.h, z26.h
	mla	z21.h, p7/m, z16.h, z29.h
	mla	z21.h, p7/m, z19.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x6]
	add	x9, x9, 144
	ldr	z12, [x9]
	str	z2, [x15]
	add	x15, sp, 144
	movprfx	z21, z31
	mla	z21.h, p7/m, z10.h, z25.h
	mla	z21.h, p7/m, z3.h, z26.h
	mla	z21.h, p7/m, z9.h, z29.h
	mla	z21.h, p7/m, z12.h, z30.h
	ldr	z12, [x15]
	addvl	x15, sp, #4
	add	x15, x15, 144
	movprfx	z22, z31
	mla	z22.h, p7/m, z11.h, z23.h
	ldr	z11, [x15]
	addvl	x15, sp, #3
	mla	z22.h, p7/m, z8.h, z24.h
	mla	z22.h, p7/m, z6.h, z27.h
	add	x15, x15, 144
	mla	z22.h, p7/m, z18.h, z28.h
	add	z22.h, z22.h, z21.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z4.h, z23.h
	mla	z21.h, p7/m, z0.h, z24.h
	mla	z21.h, p7/m, z1.h, z27.h
	mla	z21.h, p7/m, z2.h, z28.h
	ldr	z2, [x15]
	addvl	x15, sp, #10
	add	x9, x2, x30
	add	x15, x15, 144
	ldr	z4, [x15]
	addvl	x15, sp, #8
	mad	z12.h, p7/m, z25.h, z31.h
	sqrshrunb	z22.b, z22.h, #6
	add	x15, x15, 144
	mla	z12.h, p7/m, z11.h, z26.h
	uzp1	z22.b, z22.b, z22.b
	mla	z12.h, p7/m, z2.h, z29.h
	mla	z12.h, p7/m, z4.h, z30.h
	add	z21.h, z21.h, z12.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x9, 16]
	ldr	z11, [x15]
	addvl	x15, sp, #14
	movprfx	z22, z31
	mla	z22.h, p7/m, z13.h, z23.h
	add	x15, x15, 144
	ldr	z4, [x15]
	mla	z22.h, p7/m, z11.h, z24.h
	addvl	x15, sp, #16
	mla	z22.h, p7/m, z4.h, z27.h
	mad	z10.h, p7/m, z23.h, z31.h
	add	x15, x15, 144
	ldr	z13, [x15]
	mla	z22.h, p7/m, z13.h, z28.h
	addvl	x15, sp, #11
	mla	z10.h, p7/m, z3.h, z24.h
	mla	z10.h, p7/m, z9.h, z27.h
	add	x15, x15, 144
	ldr	z13, [x15]
	movprfx	z21, z31
	mla	z21.h, p7/m, z13.h, z25.h
	addvl	x15, sp, #15
	add	x30, x30, x3
	add	x15, x15, 144
	ldr	z4, [x15]
	mla	z21.h, p7/m, z4.h, z26.h
	addvl	x15, sp, #13
	add	x6, x6, x3, lsl 1
	add	x15, x15, 144
	ldr	z11, [x15]
	mla	z21.h, p7/m, z11.h, z29.h
	addvl	x15, sp, #7
	add	x21, x3, x6
	add	x15, x15, 144
	ldr	z12, [x15]
	mla	z21.h, p7/m, z12.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x9, 48]
	add	x9, x12, 16
	ld1b	z12.h, p7/z, [x4, x9]
	add	x9, x12, 32
	ld1b	z22.h, p7/z, [x4, x9]
	ld1b	z4.h, p7/z, [x1, x5]
	addvl	x9, sp, #12
	sub	z22.h, z22.h, #128
	add	x15, x1, x5
	add	x9, x9, 144
	str	z22, [x9]
	sub	z4.h, z4.h, #128
	add	x9, x12, 48
	ld1b	z22.h, p7/z, [x4, x9]
	sub	z22.h, z22.h, #128
	addvl	x9, sp, #11
	sub	z12.h, z12.h, #128
	add	x5, x5, x1, lsl 1
	add	x9, x9, 144
	str	z22, [x9]
	add	x20, x1, x5
	addvl	x9, sp, #6
	add	x9, x9, 144
	ldr	z22, [x9]
	movprfx	z11, z31
	mla	z11.h, p7/m, z22.h, z23.h
	addvl	x9, sp, #5
	mla	z11.h, p7/m, z14.h, z24.h
	mla	z11.h, p7/m, z16.h, z27.h
	add	x9, x9, 144
	ldr	z22, [x9]
	mla	z11.h, p7/m, z19.h, z28.h
	mad	z22.h, p7/m, z25.h, z31.h
	mla	z22.h, p7/m, z15.h, z26.h
	mla	z22.h, p7/m, z17.h, z29.h
	mla	z22.h, p7/m, z5.h, z30.h
	add	z11.h, z11.h, z22.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x3, x18]
	add	x18, sp, 144
	ldr	z21, [x18]
	addvl	x18, sp, #4
	mad	z21.h, p7/m, z23.h, z31.h
	add	x18, x18, 144
	ldr	z11, [x18]
	addvl	x9, sp, #2
	addvl	x18, sp, #3
	add	x9, x9, 144
	ldr	z22, [x9]
	add	x18, x18, 144
	str	z2, [x18]
	mla	z10.h, p7/m, z22.h, z28.h
	addvl	x18, sp, #10
	movprfx	z22, z31
	mla	z22.h, p7/m, z8.h, z25.h
	mla	z22.h, p7/m, z6.h, z26.h
	add	x18, x18, 144
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z7.h, z30.h
	add	z22.h, z10.h, z22.h
	ldr	z10, [x18]
	addvl	x18, sp, #1
	add	x18, x18, 144
	mla	z21.h, p7/m, z11.h, z24.h
	mla	z21.h, p7/m, z2.h, z27.h
	ldr	z2, [x18]
	addvl	x18, sp, #9
	add	x9, x2, x30
	add	x18, x18, 144
	mla	z21.h, p7/m, z10.h, z28.h
	ldr	z10, [x18]
	addvl	x18, sp, #15
	movprfx	z11, z31
	mla	z11.h, p7/m, z0.h, z25.h
	mla	z11.h, p7/m, z1.h, z26.h
	add	x18, x18, 144
	mla	z11.h, p7/m, z2.h, z29.h
	mla	z11.h, p7/m, z10.h, z30.h
	add	z21.h, z21.h, z11.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	stp	q22, q21, [x9, 16]
	ldr	z21, [x18]
	addvl	x18, sp, #13
	movprfx	z22, z31
	mla	z22.h, p7/m, z13.h, z23.h
	add	x18, x18, 144
	ldr	z13, [x18]
	mla	z22.h, p7/m, z21.h, z24.h
	addvl	x18, sp, #7
	mla	z22.h, p7/m, z13.h, z27.h
	mad	z8.h, p7/m, z23.h, z31.h
	add	x18, x18, 144
	ldr	z21, [x18]
	mla	z22.h, p7/m, z21.h, z28.h
	addvl	x18, sp, #8
	mla	z8.h, p7/m, z6.h, z24.h
	mla	z8.h, p7/m, z18.h, z27.h
	add	x18, x18, 144
	ldr	z10, [x18]
	movprfx	z21, z31
	mla	z21.h, p7/m, z10.h, z25.h
	addvl	x18, sp, #14
	mla	z8.h, p7/m, z7.h, z28.h
	mad	z0.h, p7/m, z23.h, z31.h
	add	x18, x18, 144
	ldr	z13, [x18]
	mla	z21.h, p7/m, z13.h, z26.h
	addvl	x18, sp, #16
	mla	z0.h, p7/m, z1.h, z24.h
	mla	z0.h, p7/m, z2.h, z27.h
	add	x18, x18, 144
	ldr	z11, [x18]
	mla	z21.h, p7/m, z11.h, z29.h
	mla	z21.h, p7/m, z20.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x9, 48]
	lsl	x9, x0, 1
	ld1b	z11.h, p7/z, [x1, x15]
	add	x15, x9, 16
	ld1b	z21.h, p7/z, [x4, x15]
	add	x15, x9, 32
	ld1b	z22.h, p7/z, [x4, x15]
	sub	z22.h, z22.h, #128
	addvl	x15, sp, #8
	addvl	x18, sp, #1
	sub	z11.h, z11.h, #128
	add	x15, x15, 144
	str	z22, [x15]
	add	x18, x18, 144
	add	x15, x9, 48
	ld1b	z22.h, p7/z, [x4, x15]
	sub	z22.h, z22.h, #128
	addvl	x15, sp, #6
	add	x9, x9, x1
	sub	z21.h, z21.h, #128
	add	x15, x15, 144
	str	z22, [x15]
	movprfx	z22, z31
	mla	z22.h, p7/m, z14.h, z25.h
	addvl	x15, sp, #5
	mla	z22.h, p7/m, z16.h, z26.h
	mla	z22.h, p7/m, z19.h, z29.h
	add	x15, x15, 144
	ldr	z13, [x15]
	mla	z22.h, p7/m, z4.h, z30.h
	mad	z13.h, p7/m, z23.h, z31.h
	mla	z13.h, p7/m, z15.h, z24.h
	mla	z13.h, p7/m, z17.h, z27.h
	mla	z13.h, p7/m, z5.h, z28.h
	add	z13.h, z13.h, z22.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x3, x6]
	addvl	x15, sp, #2
	str	z2, [x18]
	addvl	x18, sp, #9
	movprfx	z22, z31
	mla	z22.h, p7/m, z3.h, z25.h
	add	x18, x18, 144
	mla	z22.h, p7/m, z9.h, z26.h
	add	x15, x15, 144
	ldr	z13, [x15]
	mla	z22.h, p7/m, z13.h, z29.h
	mla	z22.h, p7/m, z12.h, z30.h
	add	z22.h, z8.h, z22.h
	ldr	z8, [x18]
	addvl	x18, sp, #4
	add	x18, x18, 144
	ldr	z13, [x18]
	mla	z0.h, p7/m, z8.h, z28.h
	addvl	x18, sp, #3
	add	x15, x2, x14, lsl 1
	mad	z13.h, p7/m, z25.h, z31.h
	add	x18, x18, 144
	ldr	z2, [x18]
	mla	z13.h, p7/m, z2.h, z26.h
	addvl	x18, sp, #10
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	add	x18, x18, 144
	ldr	z8, [x18]
	mla	z13.h, p7/m, z8.h, z29.h
	addvl	x18, sp, #12
	mad	z14.h, p7/m, z23.h, z31.h
	mla	z14.h, p7/m, z16.h, z24.h
	add	x18, x18, 144
	ldr	z2, [x18]
	mla	z13.h, p7/m, z2.h, z30.h
	addvl	x18, sp, #14
	add	z0.h, z0.h, z13.h
	sqrshrunb	z0.b, z0.h, #6
	add	x18, x18, 144
	uzp1	z0.b, z0.b, z0.b
	stp	q22, q0, [x15, 16]
	ldr	z13, [x18]
	addvl	x18, sp, #16
	movprfx	z22, z31
	mla	z22.h, p7/m, z10.h, z23.h
	add	x18, x18, 144
	ldr	z0, [x18]
	mla	z22.h, p7/m, z13.h, z24.h
	addvl	x18, sp, #15
	mla	z22.h, p7/m, z0.h, z27.h
	mla	z22.h, p7/m, z20.h, z28.h
	add	x18, x18, 144
	ldr	z8, [x18]
	movprfx	z13, z31
	mla	z13.h, p7/m, z8.h, z25.h
	addvl	x18, sp, #13
	mla	z14.h, p7/m, z19.h, z27.h
	mla	z14.h, p7/m, z4.h, z28.h
	add	x18, x18, 144
	ldr	z0, [x18]
	mla	z13.h, p7/m, z0.h, z26.h
	addvl	x18, sp, #7
	mad	z3.h, p7/m, z23.h, z31.h
	mla	z3.h, p7/m, z9.h, z24.h
	add	x18, x18, 144
	ldr	z10, [x18]
	mla	z13.h, p7/m, z10.h, z29.h
	addvl	x18, sp, #11
	add	x6, x6, x3, lsl 1
	add	x18, x18, 144
	ldr	z0, [x18]
	mla	z13.h, p7/m, z0.h, z30.h
	add	z22.h, z22.h, z13.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x15, 48]
	add	x15, x9, 16
	ld1b	z22.h, p7/z, [x4, x15]
	add	x15, x9, 32
	ld1b	z10.h, p7/z, [x4, x15]
	movprfx	z0, z10
	sub	z0.h, z0.h, #128
	add	x15, x9, 48
	ld1b	z10.h, p7/z, [x4, x15]
	ld1b	z13.h, p7/z, [x1, x5]
	addvl	x15, sp, #5
	sub	z10.h, z10.h, #128
	add	x18, x3, x14, lsl 1
	add	x15, x15, 144
	str	z10, [x15]
	movprfx	z10, z31
	mla	z10.h, p7/m, z15.h, z25.h
	mla	z10.h, p7/m, z17.h, z26.h
	mla	z10.h, p7/m, z5.h, z29.h
	mla	z10.h, p7/m, z11.h, z30.h
	add	z14.h, z14.h, z10.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x3, x21]
	addvl	x21, sp, #4
	sub	z13.h, z13.h, #128
	add	x21, x21, 144
	ldr	z2, [x21]
	mad	z2.h, p7/m, z23.h, z31.h
	addvl	x21, sp, #3
	addvl	x15, sp, #2
	mad	z15.h, p7/m, z23.h, z31.h
	add	x21, x21, 144
	ldr	z10, [x21]
	mla	z2.h, p7/m, z10.h, z24.h
	addvl	x21, sp, #10
	add	x15, x15, 144
	ldr	z14, [x15]
	add	x21, x21, 144
	ldr	z10, [x21]
	mla	z3.h, p7/m, z14.h, z27.h
	addvl	x21, sp, #12
	mla	z3.h, p7/m, z12.h, z28.h
	movprfx	z14, z31
	mla	z14.h, p7/m, z6.h, z25.h
	add	x21, x21, 144
	mla	z14.h, p7/m, z18.h, z26.h
	mla	z14.h, p7/m, z7.h, z29.h
	mla	z14.h, p7/m, z21.h, z30.h
	add	z14.h, z3.h, z14.h
	ldr	z3, [x21]
	addvl	x21, sp, #1
	mla	z2.h, p7/m, z10.h, z27.h
	mla	z2.h, p7/m, z3.h, z28.h
	add	x21, x21, 144
	ldr	z3, [x21]
	movprfx	z10, z31
	mla	z10.h, p7/m, z1.h, z25.h
	addvl	x21, sp, #9
	mla	z10.h, p7/m, z3.h, z26.h
	add	x15, x2, x18
	add	x21, x21, 144
	ldr	z3, [x21]
	mla	z10.h, p7/m, z3.h, z29.h
	addvl	x21, sp, #8
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	add	x21, x21, 144
	ldr	z3, [x21]
	mla	z10.h, p7/m, z3.h, z30.h
	addvl	x21, sp, #13
	add	z2.h, z2.h, z10.h
	sqrshrunb	z2.b, z2.h, #6
	add	x21, x21, 144
	uzp1	z2.b, z2.b, z2.b
	stp	q14, q2, [x15, 16]
	movprfx	z14, z31
	mla	z14.h, p7/m, z8.h, z23.h
	ldr	z8, [x21]
	addvl	x21, sp, #7
	add	x21, x21, 144
	mla	z14.h, p7/m, z8.h, z24.h
	ldr	z8, [x21]
	addvl	x21, sp, #11
	mla	z14.h, p7/m, z8.h, z27.h
	mla	z15.h, p7/m, z17.h, z24.h
	add	x21, x21, 144
	ldr	z10, [x21]
	mla	z14.h, p7/m, z10.h, z28.h
	addvl	x21, sp, #14
	mla	z15.h, p7/m, z5.h, z27.h
	mla	z15.h, p7/m, z11.h, z28.h
	add	x21, x21, 144
	ldr	z3, [x21]
	movprfx	z10, z31
	mla	z10.h, p7/m, z3.h, z25.h
	addvl	x21, sp, #16
	mad	z6.h, p7/m, z23.h, z31.h
	mla	z6.h, p7/m, z18.h, z24.h
	add	x21, x21, 144
	ldr	z8, [x21]
	mla	z10.h, p7/m, z8.h, z26.h
	addvl	x21, sp, #6
	mla	z10.h, p7/m, z20.h, z29.h
	mla	z6.h, p7/m, z7.h, z27.h
	add	x21, x21, 144
	ldr	z2, [x21]
	mla	z10.h, p7/m, z2.h, z30.h
	lsl	x21, x7, 2
	add	z14.h, z14.h, z10.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x15, 48]
	add	x15, x21, 16
	ld1b	z14.h, p7/z, [x4, x15]
	add	x15, x21, 32
	movprfx	z8, z14
	sub	z8.h, z8.h, #128
	ld1b	z14.h, p7/z, [x4, x15]
	addvl	x15, sp, #17
	ld1b	z10.h, p7/z, [x1, x20]
	add	x15, x15, 144
	sub	z14.h, z14.h, #128
	str	z14, [x15]
	add	x15, x21, 48
	ld1b	z14.h, p7/z, [x4, x15]
	sub	z14.h, z14.h, #128
	add	x15, sp, 144
	str	z14, [x15]
	movprfx	z14, z31
	mla	z14.h, p7/m, z16.h, z25.h
	addvl	x15, sp, #2
	mla	z14.h, p7/m, z19.h, z26.h
	mla	z14.h, p7/m, z4.h, z29.h
	mla	z14.h, p7/m, z13.h, z30.h
	add	x15, x15, 144
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x6]
	ldr	z14, [x15]
	movprfx	z15, z31
	mla	z15.h, p7/m, z9.h, z25.h
	mla	z15.h, p7/m, z14.h, z26.h
	ldr	z14, [x22]
	addvl	x22, sp, #9
	mla	z6.h, p7/m, z21.h, z28.h
	add	x22, x22, 144
	sub	z22.h, z22.h, #128
	mla	z15.h, p7/m, z12.h, z29.h
	mla	z15.h, p7/m, z22.h, z30.h
	add	z15.h, z6.h, z15.h
	ldr	z6, [x22]
	addvl	x22, sp, #8
	mad	z1.h, p7/m, z23.h, z31.h
	mla	z1.h, p7/m, z14.h, z24.h
	add	x22, x22, 144
	ldr	z14, [x22]
	mla	z1.h, p7/m, z6.h, z27.h
	addvl	x22, sp, #3
	add	x15, x2, x11, lsl 2
	mla	z1.h, p7/m, z14.h, z28.h
	add	x22, x22, 144
	ldr	z2, [x22]
	movprfx	z14, z31
	mla	z14.h, p7/m, z2.h, z25.h
	addvl	x22, sp, #10
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	add	x22, x22, 144
	ldr	z6, [x22]
	mla	z14.h, p7/m, z6.h, z26.h
	addvl	x22, sp, #12
	add	x5, x5, x1, lsl 1
	sub	z10.h, z10.h, #128
	add	x22, x22, 144
	ldr	z6, [x22]
	mla	z14.h, p7/m, z6.h, z29.h
	addvl	x22, sp, #16
	mla	z14.h, p7/m, z0.h, z30.h
	add	z1.h, z1.h, z14.h
	add	x22, x22, 144
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	stp	q15, q1, [x15, 16]
	ldr	z1, [x22]
	addvl	x22, sp, #14
	add	x22, x22, 144
	str	z20, [x22]
	movprfx	z15, z31
	mla	z15.h, p7/m, z3.h, z23.h
	addvl	x22, sp, #6
	mla	z15.h, p7/m, z1.h, z24.h
	mla	z15.h, p7/m, z20.h, z27.h
	add	x22, x22, 144
	ldr	z3, [x22]
	mla	z15.h, p7/m, z3.h, z28.h
	addvl	x22, sp, #13
	add	x20, x3, x6
	mad	z16.h, p7/m, z23.h, z31.h
	add	x22, x22, 144
	ldr	z3, [x22]
	movprfx	z14, z31
	mla	z14.h, p7/m, z3.h, z25.h
	addvl	x22, sp, #7
	mla	z16.h, p7/m, z19.h, z24.h
	mla	z16.h, p7/m, z4.h, z27.h
	add	x22, x22, 144
	ldr	z6, [x22]
	mla	z14.h, p7/m, z6.h, z26.h
	addvl	x22, sp, #11
	mla	z16.h, p7/m, z13.h, z28.h
	mad	z9.h, p7/m, z23.h, z31.h
	add	x22, x22, 144
	ldr	z20, [x22]
	mla	z14.h, p7/m, z20.h, z29.h
	addvl	x22, sp, #5
	add	x6, x6, x3, lsl 1
	add	x22, x22, 144
	ldr	z6, [x22]
	mla	z14.h, p7/m, z6.h, z30.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x15, 48]
	add	x15, x21, x1
	ld1b	z15.h, p7/z, [x1, x5]
	sub	z15.h, z15.h, #128
	str	z15, [x23]
	add	x23, x15, 16
	ld1b	z14.h, p7/z, [x4, x23]
	add	x23, x15, 32
	movprfx	z6, z14
	sub	z6.h, z6.h, #128
	add	x15, x15, 48
	ld1b	z14.h, p7/z, [x4, x23]
	addvl	x23, sp, #18
	sub	z14.h, z14.h, #128
	add	x23, x23, 144
	str	z14, [x23]
	ld1b	z14.h, p7/z, [x4, x15]
	addvl	x15, sp, #4
	movprfx	z20, z14
	sub	z20.h, z20.h, #128
	add	x15, x15, 144
	str	z20, [x15]
	movprfx	z14, z31
	mla	z14.h, p7/m, z17.h, z25.h
	addvl	x23, sp, #10
	mla	z14.h, p7/m, z5.h, z26.h
	mla	z14.h, p7/m, z11.h, z29.h
	mla	z14.h, p7/m, z10.h, z30.h
	add	z16.h, z16.h, z14.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x3, x20]
	addvl	x20, sp, #2
	add	x20, x20, 144
	ldr	z16, [x20]
	mla	z9.h, p7/m, z16.h, z24.h
	add	x23, x23, 144
	mla	z9.h, p7/m, z12.h, z27.h
	mla	z9.h, p7/m, z22.h, z28.h
	movprfx	z16, z31
	mla	z16.h, p7/m, z18.h, z25.h
	mla	z16.h, p7/m, z7.h, z26.h
	mla	z16.h, p7/m, z21.h, z29.h
	mla	z16.h, p7/m, z8.h, z30.h
	add	z16.h, z9.h, z16.h
	ldr	z9, [x23]
	addvl	x23, sp, #12
	movprfx	z14, z31
	mla	z14.h, p7/m, z2.h, z23.h
	mla	z14.h, p7/m, z9.h, z24.h
	add	x23, x23, 144
	ldr	z9, [x23]
	add	x15, x3, x11, lsl 2
	addvl	x23, sp, #1
	mla	z14.h, p7/m, z9.h, z27.h
	add	x20, x2, x15
	add	x23, x23, 144
	ldr	z2, [x23]
	movprfx	z9, z31
	mla	z9.h, p7/m, z2.h, z25.h
	addvl	x23, sp, #9
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	add	x23, x23, 144
	ldr	z20, [x23]
	mla	z9.h, p7/m, z20.h, z26.h
	addvl	x23, sp, #8
	mla	z14.h, p7/m, z0.h, z28.h
	add	x22, x1, x5
	add	x23, x23, 144
	ldr	z20, [x23]
	mla	z9.h, p7/m, z20.h, z29.h
	addvl	x23, sp, #17
	mad	z17.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z5.h, z24.h
	add	x23, x23, 144
	ldr	z20, [x23]
	mla	z9.h, p7/m, z20.h, z30.h
	addvl	x23, sp, #7
	add	z14.h, z14.h, z9.h
	sqrshrunb	z14.b, z14.h, #6
	add	x23, x23, 144
	uzp1	z14.b, z14.b, z14.b
	stp	q16, q14, [x20, 16]
	movprfx	z16, z31
	mla	z16.h, p7/m, z3.h, z23.h
	ldr	z3, [x23]
	addvl	x23, sp, #11
	add	x23, x23, 144
	ldr	z14, [x23]
	mla	z16.h, p7/m, z3.h, z24.h
	addvl	x23, sp, #5
	mla	z16.h, p7/m, z14.h, z27.h
	movprfx	z14, z31
	mla	z14.h, p7/m, z1.h, z25.h
	add	x23, x23, 144
	ldr	z9, [x23]
	mla	z16.h, p7/m, z9.h, z28.h
	addvl	x23, sp, #14
	mla	z17.h, p7/m, z11.h, z27.h
	mla	z17.h, p7/m, z10.h, z28.h
	add	x23, x23, 144
	ldr	z20, [x23]
	mla	z14.h, p7/m, z20.h, z26.h
	addvl	x23, sp, #6
	mad	z18.h, p7/m, z23.h, z31.h
	mla	z18.h, p7/m, z7.h, z24.h
	add	x23, x23, 144
	ldr	z3, [x23]
	mla	z14.h, p7/m, z3.h, z29.h
	add	x23, sp, 144
	ldr	z3, [x23]
	mla	z14.h, p7/m, z3.h, z30.h
	add	z16.h, z16.h, z14.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x20, 48]
	add	x20, x10, 16
	ld1b	z16.h, p7/z, [x4, x20]
	add	x20, x10, 32
	movprfx	z3, z16
	sub	z3.h, z3.h, #128
	ld1b	z16.h, p7/z, [x4, x20]
	addvl	x20, sp, #1
	add	x10, x10, 48
	sub	z16.h, z16.h, #128
	add	x20, x20, 144
	ld1b	z9.h, p7/z, [x1, x22]
	str	z16, [x20]
	addvl	x20, sp, #9
	ld1b	z16.h, p7/z, [x4, x10]
	addvl	x10, sp, #3
	add	x10, x10, 144
	ldr	z20, [x10]
	add	x20, x20, 144
	movprfx	z15, z16
	sub	z15.h, z15.h, #128
	addvl	x10, sp, #2
	movprfx	z16, z31
	mla	z16.h, p7/m, z19.h, z25.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z16.h, p7/m, z13.h, z29.h
	mla	z16.h, p7/m, z20.h, z30.h
	add	z17.h, z17.h, z16.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x6]
	ldr	z20, [x20]
	addvl	x20, sp, #8
	add	x10, x10, 144
	ldr	z17, [x10]
	mad	z17.h, p7/m, z25.h, z31.h
	add	x20, x20, 144
	mla	z17.h, p7/m, z12.h, z26.h
	mla	z17.h, p7/m, z22.h, z29.h
	mla	z17.h, p7/m, z6.h, z30.h
	mla	z18.h, p7/m, z21.h, z27.h
	mla	z18.h, p7/m, z8.h, z28.h
	add	z18.h, z18.h, z17.h
	movprfx	z17, z31
	mla	z17.h, p7/m, z2.h, z23.h
	ldr	z2, [x20]
	addvl	x20, sp, #17
	mla	z17.h, p7/m, z20.h, z24.h
	mla	z17.h, p7/m, z2.h, z27.h
	add	x20, x20, 144
	ldr	z16, [x20]
	add	x10, x2, x8, lsl 1
	addvl	x20, sp, #10
	mla	z17.h, p7/m, z16.h, z28.h
	sqrshrunb	z18.b, z18.h, #6
	add	x20, x20, 144
	ldr	z14, [x20]
	movprfx	z16, z31
	mla	z16.h, p7/m, z14.h, z25.h
	addvl	x20, sp, #12
	uzp1	z18.b, z18.b, z18.b
	add	x5, x5, x1, lsl 1
	add	x20, x20, 144
	ldr	z2, [x20]
	mla	z16.h, p7/m, z2.h, z26.h
	addvl	x20, sp, #18
	mla	z16.h, p7/m, z0.h, z29.h
	add	x23, x3, x6
	add	x20, x20, 144
	ldr	z2, [x20]
	mla	z16.h, p7/m, z2.h, z30.h
	addvl	x20, sp, #14
	add	z17.h, z17.h, z16.h
	sqrshrunb	z17.b, z17.h, #6
	add	x20, x20, 144
	uzp1	z17.b, z17.b, z17.b
	stp	q18, q17, [x10, 16]
	ldr	z16, [x20]
	addvl	x20, sp, #6
	movprfx	z18, z31
	mla	z18.h, p7/m, z1.h, z23.h
	add	x20, x20, 144
	mla	z18.h, p7/m, z16.h, z24.h
	ldr	z16, [x20]
	add	x20, sp, 144
	ldr	z1, [x20]
	mla	z18.h, p7/m, z16.h, z27.h
	addvl	x20, sp, #7
	mla	z18.h, p7/m, z1.h, z28.h
	sub	z9.h, z9.h, #128
	add	x20, x20, 144
	ldr	z1, [x20]
	movprfx	z17, z31
	mla	z17.h, p7/m, z1.h, z25.h
	addvl	x20, sp, #11
	mad	z19.h, p7/m, z23.h, z31.h
	mla	z19.h, p7/m, z4.h, z24.h
	add	x20, x20, 144
	ldr	z16, [x20]
	mla	z17.h, p7/m, z16.h, z26.h
	addvl	x20, sp, #5
	mla	z19.h, p7/m, z13.h, z27.h
	add	x24, x1, x5
	add	x20, x20, 144
	ldr	z2, [x20]
	mla	z17.h, p7/m, z2.h, z29.h
	addvl	x20, sp, #4
	add	x6, x6, x3, lsl 1
	add	x20, x20, 144
	ldr	z20, [x20]
	mla	z17.h, p7/m, z20.h, z30.h
	lsl	x20, x16, 3
	add	z18.h, z18.h, z17.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x10, 48]
	sub	x10, x20, x1
	add	x22, x10, 16
	ld1b	z18.h, p7/z, [x4, x22]
	movprfx	z2, z18
	sub	z2.h, z2.h, #128
	add	x22, x10, 32
	add	x10, x10, 48
	ld1b	z18.h, p7/z, [x4, x22]
	addvl	x22, sp, #16
	sub	z18.h, z18.h, #128
	ld1b	z16.h, p7/z, [x1, x5]
	add	x22, x22, 144
	str	z18, [x22]
	ld1b	z18.h, p7/z, [x4, x10]
	addvl	x10, sp, #7
	sub	z18.h, z18.h, #128
	lsl	x22, x3, 4
	add	x10, x10, 144
	str	z18, [x10]
	movprfx	z18, z31
	mla	z18.h, p7/m, z5.h, z25.h
	addvl	x10, sp, #3
	mla	z18.h, p7/m, z11.h, z26.h
	mla	z18.h, p7/m, z10.h, z29.h
	add	x10, x10, 144
	ldr	z20, [x10]
	mla	z18.h, p7/m, z9.h, z30.h
	mla	z19.h, p7/m, z20.h, z28.h
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x23]
	addvl	x23, sp, #2
	add	x23, x23, 144
	ldr	z18, [x23]
	movprfx	z20, z31
	mla	z20.h, p7/m, z18.h, z23.h
	ldr	z18, [x25]
	addvl	x25, sp, #18
	movprfx	z19, z31
	mla	z19.h, p7/m, z7.h, z25.h
	add	x25, x25, 144
	mla	z19.h, p7/m, z21.h, z26.h
	mla	z19.h, p7/m, z8.h, z29.h
	mla	z19.h, p7/m, z3.h, z30.h
	mla	z20.h, p7/m, z12.h, z24.h
	mla	z20.h, p7/m, z22.h, z27.h
	mla	z20.h, p7/m, z6.h, z28.h
	add	z20.h, z20.h, z19.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z14.h, z23.h
	ldr	z14, [x25]
	addvl	x25, sp, #9
	mla	z19.h, p7/m, z18.h, z24.h
	add	x25, x25, 144
	ldr	z17, [x25]
	mla	z19.h, p7/m, z0.h, z27.h
	addvl	x25, sp, #8
	mla	z19.h, p7/m, z14.h, z28.h
	sub	x10, x22, x3
	add	x25, x25, 144
	ldr	z14, [x25]
	movprfx	z18, z31
	mla	z18.h, p7/m, z17.h, z25.h
	addvl	x25, sp, #17
	mla	z18.h, p7/m, z14.h, z26.h
	add	x23, x2, x10
	add	x25, x25, 144
	ldr	z14, [x25]
	mla	z18.h, p7/m, z14.h, z29.h
	addvl	x25, sp, #1
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	add	x25, x25, 144
	ldr	z14, [x25]
	mla	z18.h, p7/m, z14.h, z30.h
	addvl	x25, sp, #11
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	add	x25, x25, 144
	uzp1	z19.b, z19.b, z19.b
	stp	q20, q19, [x23, 16]
	ldr	z19, [x25]
	addvl	x25, sp, #5
	movprfx	z20, z31
	mla	z20.h, p7/m, z1.h, z23.h
	add	x25, x25, 144
	ldr	z1, [x25]
	mla	z20.h, p7/m, z19.h, z24.h
	addvl	x25, sp, #4
	mla	z20.h, p7/m, z1.h, z27.h
	sub	z16.h, z16.h, #128
	add	x25, x25, 144
	ldr	z19, [x25]
	mla	z20.h, p7/m, z19.h, z28.h
	addvl	x25, sp, #14
	mad	z7.h, p7/m, z23.h, z31.h
	mla	z7.h, p7/m, z21.h, z24.h
	add	x25, x25, 144
	ldr	z19, [x25]
	mad	z19.h, p7/m, z25.h, z31.h
	addvl	x25, sp, #6
	mla	z7.h, p7/m, z8.h, z27.h
	mla	z7.h, p7/m, z3.h, z28.h
	add	x25, x25, 144
	ldr	z1, [x25]
	mla	z19.h, p7/m, z1.h, z26.h
	add	x25, sp, 144
	ldr	z18, [x25]
	mla	z19.h, p7/m, z18.h, z29.h
	mla	z19.h, p7/m, z15.h, z30.h
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x23, 48]
	add	x23, x20, 16
	ld1b	z20.h, p7/z, [x4, x23]
	add	x23, x20, 32
	movprfx	z1, z20
	sub	z1.h, z1.h, #128
	ld1b	z20.h, p7/z, [x4, x23]
	addvl	x23, sp, #10
	ld1b	z14.h, p7/z, [x1, x24]
	add	x23, x23, 144
	sub	z20.h, z20.h, #128
	str	z20, [x23]
	add	x23, x20, 48
	ld1b	z20.h, p7/z, [x4, x23]
	addvl	x25, sp, #8
	addvl	x23, sp, #9
	sub	z20.h, z20.h, #128
	add	x25, x25, 144
	add	x23, x23, 144
	str	z20, [x23]
	movprfx	z20, z31
	mla	z20.h, p7/m, z4.h, z25.h
	addvl	x23, sp, #3
	mla	z20.h, p7/m, z13.h, z26.h
	mad	z5.h, p7/m, z23.h, z31.h
	add	x23, x23, 144
	ldr	z19, [x23]
	mla	z20.h, p7/m, z19.h, z29.h
	mla	z20.h, p7/m, z16.h, z30.h
	mla	z5.h, p7/m, z11.h, z24.h
	mla	z5.h, p7/m, z10.h, z27.h
	mla	z5.h, p7/m, z9.h, z28.h
	add	z5.h, z5.h, z20.h
	movprfx	z20, z31
	mla	z20.h, p7/m, z12.h, z25.h
	sqrshrunb	z5.b, z5.h, #6
	mla	z20.h, p7/m, z22.h, z26.h
	uzp1	z5.b, z5.b, z5.b
	mla	z20.h, p7/m, z6.h, z29.h
	mla	z20.h, p7/m, z2.h, z30.h
	add	z20.h, z7.h, z20.h
	str	q5, [x3, x6]
	ldr	z7, [x25]
	addvl	x25, sp, #17
	add	x25, x25, 144
	ldr	z18, [x25]
	movprfx	z19, z31
	mla	z19.h, p7/m, z17.h, z23.h
	addvl	x25, sp, #1
	mla	z19.h, p7/m, z7.h, z24.h
	mla	z19.h, p7/m, z18.h, z27.h
	add	x25, x25, 144
	ldr	z17, [x25]
	mla	z19.h, p7/m, z17.h, z28.h
	addvl	x25, sp, #12
	add	x23, x2, x22
	sqrshrunb	z20.b, z20.h, #6
	add	x25, x25, 144
	ldr	z17, [x25]
	uzp1	z20.b, z20.b, z20.b
	addvl	x25, sp, #18
	movprfx	z18, z31
	mla	z18.h, p7/m, z17.h, z25.h
	mla	z18.h, p7/m, z0.h, z26.h
	add	x25, x25, 144
	ldr	z7, [x25]
	mla	z18.h, p7/m, z7.h, z29.h
	addvl	x25, sp, #16
	add	x7, x7, x21
	sub	z14.h, z14.h, #128
	add	x25, x25, 144
	ldr	z5, [x25]
	mla	z18.h, p7/m, z5.h, z30.h
	addvl	x25, sp, #14
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	add	x25, x25, 144
	uzp1	z19.b, z19.b, z19.b
	stp	q20, q19, [x23, 16]
	ldr	z20, [x25]
	addvl	x25, sp, #6
	mad	z20.h, p7/m, z23.h, z31.h
	add	x25, x25, 144
	ldr	z18, [x25]
	mla	z20.h, p7/m, z18.h, z24.h
	add	x25, sp, 144
	ldr	z19, [x25]
	add	x21, x7, 16
	addvl	x25, sp, #11
	mla	z20.h, p7/m, z19.h, z27.h
	mla	z20.h, p7/m, z15.h, z28.h
	add	x25, x25, 144
	ldr	z5, [x25]
	movprfx	z19, z31
	mla	z19.h, p7/m, z5.h, z25.h
	addvl	x25, sp, #5
	add	x5, x5, x1, lsl 1
	mad	z4.h, p7/m, z23.h, z31.h
	add	x25, x25, 144
	ldr	z18, [x25]
	mla	z19.h, p7/m, z18.h, z26.h
	addvl	x25, sp, #4
	add	x24, x3, x6
	mla	z4.h, p7/m, z13.h, z24.h
	add	x25, x25, 144
	ldr	z7, [x25]
	mla	z19.h, p7/m, z7.h, z29.h
	addvl	x25, sp, #7
	mad	z12.h, p7/m, z23.h, z31.h
	mla	z12.h, p7/m, z22.h, z24.h
	add	x25, x25, 144
	ldr	z7, [x25]
	mla	z19.h, p7/m, z7.h, z30.h
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x23, 48]
	ld1b	z20.h, p7/z, [x4, x21]
	add	x21, x7, 32
	movprfx	z7, z20
	sub	z7.h, z7.h, #128
	add	x7, x7, 48
	ld1b	z20.h, p7/z, [x4, x21]
	addvl	x21, sp, #15
	sub	z20.h, z20.h, #128
	ld1b	z18.h, p7/z, [x1, x5]
	add	x21, x21, 144
	str	z20, [x21]
	ld1b	z20.h, p7/z, [x4, x7]
	addvl	x7, sp, #14
	sub	z20.h, z20.h, #128
	add	x21, x6, x3, lsl 1
	add	x7, x7, 144
	str	z20, [x7]
	addvl	x6, sp, #18
	addvl	x7, sp, #3
	mla	z12.h, p7/m, z6.h, z27.h
	add	x6, x6, 144
	add	x7, x7, 144
	ldr	z20, [x7]
	mla	z12.h, p7/m, z2.h, z28.h
	mla	z4.h, p7/m, z20.h, z27.h
	movprfx	z20, z31
	mla	z20.h, p7/m, z11.h, z25.h
	mla	z20.h, p7/m, z10.h, z26.h
	mla	z20.h, p7/m, z9.h, z29.h
	mla	z20.h, p7/m, z14.h, z30.h
	mla	z4.h, p7/m, z16.h, z28.h
	add	z4.h, z4.h, z20.h
	movprfx	z20, z31
	mla	z20.h, p7/m, z21.h, z25.h
	sqrshrunb	z4.b, z4.h, #6
	mla	z20.h, p7/m, z8.h, z26.h
	uzp1	z4.b, z4.b, z4.b
	mla	z20.h, p7/m, z3.h, z29.h
	mla	z20.h, p7/m, z1.h, z30.h
	add	z20.h, z12.h, z20.h
	str	q4, [x3, x24]
	ldr	z12, [x6]
	addvl	x6, sp, #16
	movprfx	z19, z31
	mla	z19.h, p7/m, z17.h, z23.h
	add	x6, x6, 144
	mla	z19.h, p7/m, z0.h, z24.h
	mla	z19.h, p7/m, z12.h, z27.h
	ldr	z12, [x6]
	addvl	x6, sp, #8
	mla	z19.h, p7/m, z12.h, z28.h
	add	x6, x6, 144
	ldr	z4, [x6]
	add	x7, x22, x3
	addvl	x6, sp, #17
	movprfx	z17, z31
	mla	z17.h, p7/m, z4.h, z25.h
	add	x7, x2, x7
	add	x6, x6, 144
	ldr	z12, [x6]
	mla	z17.h, p7/m, z12.h, z26.h
	addvl	x6, sp, #1
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	add	x6, x6, 144
	ldr	z12, [x6]
	mla	z17.h, p7/m, z12.h, z29.h
	addvl	x6, sp, #10
	add	x23, x1, x5
	sub	z18.h, z18.h, #128
	add	x6, x6, 144
	ldr	z12, [x6]
	mla	z17.h, p7/m, z12.h, z30.h
	addvl	x6, sp, #5
	add	z19.h, z19.h, z17.h
	sqrshrunb	z19.b, z19.h, #6
	add	x6, x6, 144
	uzp1	z19.b, z19.b, z19.b
	stp	q20, q19, [x7, 16]
	ldr	z17, [x6]
	addvl	x6, sp, #4
	movprfx	z20, z31
	mla	z20.h, p7/m, z5.h, z23.h
	add	x6, x6, 144
	ldr	z19, [x6]
	ldr	z5, [x25]
	addvl	x6, sp, #6
	mla	z20.h, p7/m, z17.h, z24.h
	mla	z20.h, p7/m, z19.h, z27.h
	add	x6, x6, 144
	mla	z20.h, p7/m, z5.h, z28.h
	ldr	z5, [x6]
	add	x6, sp, 144
	ldr	z12, [x6]
	movprfx	z19, z31
	mla	z19.h, p7/m, z5.h, z25.h
	addvl	x6, sp, #9
	mla	z19.h, p7/m, z12.h, z26.h
	mla	z19.h, p7/m, z15.h, z29.h
	add	x6, x6, 144
	ldr	z17, [x6]
	mla	z19.h, p7/m, z17.h, z30.h
	lsl	x6, x19, 1
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x7, 48]
	add	x7, x6, 16
	ld1b	z19.h, p7/z, [x4, x7]
	add	x7, x6, 32
	movprfx	z12, z19
	sub	z12.h, z12.h, #128
	add	x6, x6, 48
	ld1b	z19.h, p7/z, [x4, x7]
	addvl	x7, sp, #13
	sub	z19.h, z19.h, #128
	ld1b	z20.h, p7/z, [x1, x23]
	add	x7, x7, 144
	str	z19, [x7]
	ld1b	z19.h, p7/z, [x4, x6]
	addvl	x6, sp, #12
	add	x6, x6, 144
	addvl	x7, sp, #17
	sub	z19.h, z19.h, #128
	str	z19, [x6]
	addvl	x6, sp, #3
	mad	z11.h, p7/m, z23.h, z31.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z13.h, z25.h
	mla	z11.h, p7/m, z10.h, z24.h
	add	x6, x6, 144
	ldr	z17, [x6]
	mla	z11.h, p7/m, z9.h, z27.h
	mla	z19.h, p7/m, z17.h, z26.h
	mla	z11.h, p7/m, z14.h, z28.h
	mla	z19.h, p7/m, z16.h, z29.h
	add	x7, x7, 144
	mla	z19.h, p7/m, z18.h, z30.h
	add	z11.h, z11.h, z19.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x3, x21]
	movprfx	z19, z31
	mla	z19.h, p7/m, z22.h, z25.h
	ldr	z11, [x7]
	addvl	x7, sp, #1
	mla	z19.h, p7/m, z6.h, z26.h
	add	x7, x7, 144
	mla	z19.h, p7/m, z2.h, z29.h
	mla	z19.h, p7/m, z7.h, z30.h
	mad	z21.h, p7/m, z23.h, z31.h
	mla	z21.h, p7/m, z8.h, z24.h
	mla	z21.h, p7/m, z3.h, z27.h
	mla	z21.h, p7/m, z1.h, z28.h
	add	z21.h, z21.h, z19.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z4.h, z23.h
	ldr	z4, [x7]
	addvl	x7, sp, #10
	mla	z19.h, p7/m, z11.h, z24.h
	add	x7, x7, 144
	ldr	z17, [x7]
	mla	z19.h, p7/m, z4.h, z27.h
	addvl	x7, sp, #18
	add	x6, x2, x30, lsl 1
	mla	z19.h, p7/m, z17.h, z28.h
	add	x7, x7, 144
	ldr	z4, [x7]
	movprfx	z17, z31
	mla	z17.h, p7/m, z0.h, z25.h
	addvl	x7, sp, #16
	mla	z17.h, p7/m, z4.h, z26.h
	sqrshrunb	z21.b, z21.h, #6
	add	x7, x7, 144
	ldr	z4, [x7]
	mla	z17.h, p7/m, z4.h, z29.h
	addvl	x7, sp, #15
	uzp1	z21.b, z21.b, z21.b
	add	x5, x5, x1, lsl 1
	add	x7, x7, 144
	ldr	z4, [x7]
	mla	z17.h, p7/m, z4.h, z30.h
	add	x7, sp, 144
	add	z19.h, z19.h, z17.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	stp	q21, q19, [x6, 16]
	ldr	z4, [x7]
	addvl	x7, sp, #8
	movprfx	z21, z31
	mla	z21.h, p7/m, z5.h, z23.h
	mla	z21.h, p7/m, z4.h, z24.h
	add	x7, x7, 144
	str	z15, [x7]
	mla	z21.h, p7/m, z15.h, z27.h
	addvl	x7, sp, #9
	add	x22, x3, x21
	sub	z20.h, z20.h, #128
	add	x7, x7, 144
	ldr	z19, [x7]
	mla	z21.h, p7/m, z19.h, z28.h
	addvl	x7, sp, #5
	mad	z13.h, p7/m, z23.h, z31.h
	mad	z22.h, p7/m, z23.h, z31.h
	add	x7, x7, 144
	ldr	z17, [x7]
	movprfx	z19, z31
	mla	z19.h, p7/m, z17.h, z25.h
	addvl	x7, sp, #4
	mla	z22.h, p7/m, z6.h, z24.h
	mla	z22.h, p7/m, z2.h, z27.h
	add	x7, x7, 144
	ldr	z5, [x7]
	mla	z19.h, p7/m, z5.h, z26.h
	addvl	x7, sp, #14
	ldr	z5, [x25]
	mla	z19.h, p7/m, z5.h, z29.h
	add	x7, x7, 144
	ldr	z5, [x7]
	mla	z19.h, p7/m, z5.h, z30.h
	add	x7, x16, x20
	add	z21.h, z21.h, z19.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x6, 48]
	add	x6, x7, 16
	ld1b	z21.h, p7/z, [x4, x6]
	add	x6, x7, 32
	movprfx	z5, z21
	sub	z5.h, z5.h, #128
	ld1b	z21.h, p7/z, [x4, x6]
	addvl	x6, sp, #17
	ld1b	z19.h, p7/z, [x1, x5]
	add	x6, x6, 144
	sub	z21.h, z21.h, #128
	str	z21, [x6]
	addvl	x6, sp, #6
	add	x7, x7, 48
	ld1b	z21.h, p7/z, [x4, x7]
	add	x6, x6, 144
	sub	z21.h, z21.h, #128
	str	z21, [x6]
	addvl	x6, sp, #3
	movprfx	z21, z31
	mla	z21.h, p7/m, z10.h, z25.h
	mla	z21.h, p7/m, z9.h, z26.h
	add	x6, x6, 144
	ldr	z15, [x6]
	mla	z21.h, p7/m, z14.h, z29.h
	addvl	x6, sp, #18
	mla	z13.h, p7/m, z15.h, z24.h
	mla	z21.h, p7/m, z20.h, z30.h
	mla	z13.h, p7/m, z16.h, z27.h
	add	x6, x6, 144
	mla	z13.h, p7/m, z18.h, z28.h
	add	z13.h, z13.h, z21.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x3, x22]
	ldr	z13, [x6]
	addvl	x6, sp, #16
	movprfx	z21, z31
	mla	z21.h, p7/m, z8.h, z25.h
	add	x6, x6, 144
	mla	z21.h, p7/m, z3.h, z26.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z21.h, p7/m, z12.h, z30.h
	mla	z22.h, p7/m, z7.h, z28.h
	add	z22.h, z22.h, z21.h
	ldr	z21, [x6]
	addvl	x6, sp, #15
	add	x6, x6, 144
	mad	z0.h, p7/m, z23.h, z31.h
	mla	z0.h, p7/m, z13.h, z24.h
	mla	z0.h, p7/m, z21.h, z27.h
	ldr	z21, [x6]
	addvl	x6, sp, #1
	add	x6, x6, 144
	ldr	z15, [x6]
	mla	z0.h, p7/m, z21.h, z28.h
	addvl	x6, sp, #10
	movprfx	z21, z31
	mla	z21.h, p7/m, z11.h, z25.h
	add	x30, x3, x30, lsl 1
	add	x6, x6, 144
	mla	z21.h, p7/m, z15.h, z26.h
	ldr	z15, [x6]
	addvl	x6, sp, #13
	add	x30, x2, x30
	mla	z21.h, p7/m, z15.h, z29.h
	add	x6, x6, 144
	ldr	z15, [x6]
	mla	z21.h, p7/m, z15.h, z30.h
	addvl	x6, sp, #4
	add	z0.h, z0.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	add	x6, x6, 144
	uzp1	z22.b, z22.b, z22.b
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	stp	q22, q0, [x30, 16]
	ldr	z21, [x6]
	addvl	x6, sp, #14
	movprfx	z22, z31
	mla	z22.h, p7/m, z17.h, z23.h
	ldr	z17, [x25]
	add	x6, x6, 144
	ldr	z0, [x6]
	mla	z22.h, p7/m, z21.h, z24.h
	add	x6, sp, 144
	str	z4, [x6]
	mla	z22.h, p7/m, z17.h, z27.h
	addvl	x6, sp, #8
	mla	z22.h, p7/m, z0.h, z28.h
	add	x7, x5, x1, lsl 1
	add	x6, x6, 144
	ldr	z15, [x6]
	add	x19, x1, x5
	addvl	x6, sp, #9
	movprfx	z21, z31
	mla	z21.h, p7/m, z4.h, z25.h
	mla	z21.h, p7/m, z15.h, z26.h
	add	x6, x6, 144
	ldr	z0, [x6]
	mla	z21.h, p7/m, z0.h, z29.h
	addvl	x6, sp, #12
	add	x16, x21, x3, lsl 1
	sub	z19.h, z19.h, #128
	add	x6, x6, 144
	ldr	z17, [x6]
	mla	z21.h, p7/m, z17.h, z30.h
	lsl	x6, x13, 2
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	add	x5, x6, 16
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x30, 48]
	ld1b	z22.h, p7/z, [x4, x5]
	add	x5, x6, 32
	movprfx	z4, z22
	sub	z4.h, z4.h, #128
	ld1b	z22.h, p7/z, [x4, x5]
	add	x5, x6, 48
	movprfx	z0, z22
	sub	z0.h, z0.h, #128
	ld1b	z22.h, p7/z, [x4, x5]
	addvl	x5, sp, #5
	ld1b	z21.h, p7/z, [x1, x19]
	add	x5, x5, 144
	addvl	x19, sp, #1
	sub	z22.h, z22.h, #128
	str	z22, [x5]
	addvl	x5, sp, #3
	mad	z8.h, p7/m, z23.h, z31.h
	add	x5, x5, 144
	ldr	z22, [x5]
	mla	z8.h, p7/m, z3.h, z24.h
	add	x19, x19, 144
	mla	z8.h, p7/m, z1.h, z27.h
	mad	z22.h, p7/m, z25.h, z31.h
	mla	z8.h, p7/m, z12.h, z28.h
	mla	z22.h, p7/m, z16.h, z26.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z19.h, z30.h
	mad	z10.h, p7/m, z23.h, z31.h
	mla	z10.h, p7/m, z9.h, z24.h
	mla	z10.h, p7/m, z14.h, z27.h
	mla	z10.h, p7/m, z20.h, z28.h
	add	z10.h, z10.h, z22.h
	movprfx	z22, z31
	mla	z22.h, p7/m, z6.h, z25.h
	sqrshrunb	z10.b, z10.h, #6
	mla	z22.h, p7/m, z2.h, z26.h
	uzp1	z10.b, z10.b, z10.b
	mla	z22.h, p7/m, z7.h, z29.h
	mla	z22.h, p7/m, z5.h, z30.h
	add	z22.h, z8.h, z22.h
	str	q10, [x3, x16]
	ldr	z8, [x19]
	addvl	x19, sp, #10
	movprfx	z17, z31
	mla	z17.h, p7/m, z11.h, z23.h
	mla	z17.h, p7/m, z8.h, z24.h
	add	x19, x19, 144
	ldr	z11, [x19]
	mla	z17.h, p7/m, z11.h, z27.h
	addvl	x19, sp, #13
	add	x5, x2, x14, lsl 2
	sqrshrunb	z22.b, z22.h, #6
	add	x19, x19, 144
	ldr	z11, [x19]
	mla	z17.h, p7/m, z11.h, z28.h
	addvl	x19, sp, #16
	mov	z11.d, z13.d
	mad	z13.h, p7/m, z25.h, z31.h
	add	x19, x19, 144
	ldr	z10, [x19]
	mla	z13.h, p7/m, z10.h, z26.h
	addvl	x19, sp, #15
	uzp1	z22.b, z22.b, z22.b
	add	x6, x6, x1
	add	x19, x19, 144
	ldr	z10, [x19]
	mla	z13.h, p7/m, z10.h, z29.h
	addvl	x19, sp, #17
	add	x13, x3, x16
	sub	z21.h, z21.h, #128
	add	x19, x19, 144
	ldr	z10, [x19]
	mla	z13.h, p7/m, z10.h, z30.h
	add	x19, sp, 144
	add	z17.h, z17.h, z13.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	stp	q22, q17, [x5, 16]
	ldr	z22, [x19]
	addvl	x19, sp, #8
	mad	z22.h, p7/m, z23.h, z31.h
	mla	z22.h, p7/m, z15.h, z24.h
	add	x19, x19, 144
	str	z15, [x19]
	mad	z6.h, p7/m, z23.h, z31.h
	addvl	x19, sp, #9
	mla	z6.h, p7/m, z2.h, z24.h
	mla	z6.h, p7/m, z7.h, z27.h
	add	x19, x19, 144
	ldr	z13, [x19]
	mla	z22.h, p7/m, z13.h, z27.h
	addvl	x19, sp, #12
	ldr	z13, [x25]
	mla	z6.h, p7/m, z5.h, z28.h
	add	x19, x19, 144
	ldr	z17, [x19]
	mla	z22.h, p7/m, z17.h, z28.h
	addvl	x19, sp, #4
	add	x18, x2, x18, lsl 1
	add	x19, x19, 144
	ldr	z10, [x19]
	movprfx	z17, z31
	mla	z17.h, p7/m, z10.h, z25.h
	addvl	x19, sp, #14
	mla	z17.h, p7/m, z13.h, z26.h
	add	x15, x2, x15, lsl 1
	add	x19, x19, 144
	ldr	z15, [x19]
	mla	z17.h, p7/m, z15.h, z29.h
	addvl	x19, sp, #6
	lsl	x0, x0, 2
	add	x19, x19, 144
	ldr	z13, [x19]
	mla	z17.h, p7/m, z13.h, z30.h
	add	z22.h, z22.h, z17.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x5, 48]
	add	x5, x6, 16
	ld1b	z17.h, p7/z, [x4, x5]
	addvl	x5, sp, #11
	ld1b	z22.h, p7/z, [x1, x7]
	sub	z17.h, z17.h, #128
	add	x5, x5, 144
	str	z17, [x5]
	add	x19, x1, x7
	add	x5, x6, 32
	ld1b	z17.h, p7/z, [x4, x5]
	sub	z17.h, z17.h, #128
	addvl	x5, sp, #2
	add	x6, x6, 48
	sub	z22.h, z22.h, #128
	add	x5, x5, 144
	str	z17, [x5]
	ld1b	z17.h, p7/z, [x4, x6]
	addvl	x5, sp, #1
	sub	z17.h, z17.h, #128
	add	x6, x16, x3, lsl 1
	add	x5, x5, 144
	str	z17, [x5]
	movprfx	z17, z31
	mla	z17.h, p7/m, z9.h, z25.h
	addvl	x5, sp, #3
	mla	z17.h, p7/m, z14.h, z26.h
	mla	z17.h, p7/m, z20.h, z29.h
	add	x5, x5, 144
	ldr	z15, [x5]
	mla	z17.h, p7/m, z21.h, z30.h
	mad	z15.h, p7/m, z23.h, z31.h
	mla	z15.h, p7/m, z16.h, z24.h
	mla	z15.h, p7/m, z18.h, z27.h
	mla	z15.h, p7/m, z19.h, z28.h
	add	z15.h, z15.h, z17.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x13]
	addvl	x13, sp, #16
	add	x13, x13, 144
	ldr	z13, [x13]
	movprfx	z17, z31
	mla	z17.h, p7/m, z3.h, z25.h
	addvl	x13, sp, #15
	mla	z17.h, p7/m, z1.h, z26.h
	mla	z17.h, p7/m, z12.h, z29.h
	add	x13, x13, 144
	mla	z17.h, p7/m, z4.h, z30.h
	add	z17.h, z6.h, z17.h
	ldr	z6, [x13]
	addvl	x13, sp, #17
	movprfx	z15, z31
	mla	z15.h, p7/m, z11.h, z23.h
	add	x13, x13, 144
	mla	z15.h, p7/m, z13.h, z24.h
	mla	z15.h, p7/m, z6.h, z27.h
	ldr	z6, [x13]
	addvl	x13, sp, #10
	add	x5, x3, x14, lsl 2
	add	x13, x13, 144
	mla	z15.h, p7/m, z6.h, z28.h
	ldr	z6, [x13]
	addvl	x13, sp, #13
	add	x5, x2, x5
	movprfx	z13, z31
	mla	z13.h, p7/m, z8.h, z25.h
	add	x13, x13, 144
	ldr	z11, [x13]
	mla	z13.h, p7/m, z6.h, z26.h
	addvl	x13, sp, #14
	mla	z13.h, p7/m, z11.h, z29.h
	sqrshrunb	z17.b, z17.h, #6
	add	x13, x13, 144
	mla	z13.h, p7/m, z0.h, z30.h
	uzp1	z17.b, z17.b, z17.b
	add	z15.h, z15.h, z13.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	stp	q17, q15, [x5, 16]
	ldr	z11, [x13]
	addvl	x13, sp, #6
	add	x13, x13, 144
	ldr	z13, [x13]
	ldr	z6, [x25]
	addvl	x13, sp, #8
	movprfx	z17, z31
	mla	z17.h, p7/m, z10.h, z23.h
	mla	z17.h, p7/m, z6.h, z24.h
	add	x13, x13, 144
	mla	z17.h, p7/m, z11.h, z27.h
	ldr	z11, [x13]
	addvl	x13, sp, #9
	mla	z17.h, p7/m, z13.h, z28.h
	movprfx	z15, z31
	mla	z15.h, p7/m, z11.h, z25.h
	add	x13, x13, 144
	ldr	z13, [x13]
	mla	z15.h, p7/m, z13.h, z26.h
	addvl	x13, sp, #12
	mad	z9.h, p7/m, z23.h, z31.h
	mla	z9.h, p7/m, z14.h, z24.h
	add	x13, x13, 144
	ldr	z10, [x13]
	mla	z15.h, p7/m, z10.h, z29.h
	addvl	x13, sp, #5
	mla	z9.h, p7/m, z20.h, z27.h
	mla	z9.h, p7/m, z21.h, z28.h
	add	x13, x13, 144
	ldr	z6, [x13]
	mla	z15.h, p7/m, z6.h, z30.h
	lsl	x13, x17, 1
	add	z17.h, z17.h, z15.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x5, 48]
	add	x5, sp, 144
	ld1b	z17.h, p7/z, [x1, x19]
	movprfx	z15, z17
	sub	z15.h, z15.h, #128
	str	z15, [x5]
	add	x5, x13, 16
	ld1b	z17.h, p7/z, [x4, x5]
	movprfx	z15, z17
	sub	z15.h, z15.h, #128
	addvl	x5, sp, #8
	mad	z3.h, p7/m, z23.h, z31.h
	mla	z3.h, p7/m, z1.h, z24.h
	add	x5, x5, 144
	str	z15, [x5]
	mla	z3.h, p7/m, z12.h, z27.h
	add	x5, x13, 32
	ld1b	z17.h, p7/z, [x4, x5]
	sub	z17.h, z17.h, #128
	addvl	x5, sp, #4
	add	x13, x13, 48
	mla	z3.h, p7/m, z4.h, z28.h
	add	x5, x5, 144
	str	z17, [x5]
	ld1b	z17.h, p7/z, [x4, x13]
	addvl	x5, sp, #3
	sub	z17.h, z17.h, #128
	lsl	x17, x1, 5
	add	x5, x5, 144
	str	z17, [x5]
	movprfx	z17, z31
	mla	z17.h, p7/m, z16.h, z25.h
	addvl	x5, sp, #11
	mla	z17.h, p7/m, z18.h, z26.h
	mla	z17.h, p7/m, z19.h, z29.h
	add	x5, x5, 144
	mla	z17.h, p7/m, z22.h, z30.h
	add	z9.h, z9.h, z17.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x3, x6]
	ldr	z15, [x5]
	addvl	x5, sp, #10
	movprfx	z17, z31
	mla	z17.h, p7/m, z2.h, z25.h
	add	x5, x5, 144
	ldr	z9, [x5]
	mla	z17.h, p7/m, z7.h, z26.h
	addvl	x5, sp, #13
	mla	z17.h, p7/m, z5.h, z29.h
	mla	z17.h, p7/m, z15.h, z30.h
	add	x5, x5, 144
	movprfx	z15, z31
	mla	z15.h, p7/m, z8.h, z23.h
	ldr	z8, [x5]
	addvl	x5, sp, #16
	mla	z15.h, p7/m, z9.h, z24.h
	mla	z15.h, p7/m, z8.h, z27.h
	add	x5, x5, 144
	ldr	z10, [x5]
	add	z17.h, z3.h, z17.h
	addvl	x5, sp, #15
	movprfx	z13, z31
	mla	z13.h, p7/m, z10.h, z25.h
	mla	z15.h, p7/m, z0.h, z28.h
	add	x5, x5, 144
	ldr	z8, [x5]
	mla	z13.h, p7/m, z8.h, z26.h
	addvl	x5, sp, #17
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	add	x5, x5, 144
	ldr	z3, [x5]
	mla	z13.h, p7/m, z3.h, z29.h
	addvl	x5, sp, #2
	add	x7, x7, x1, lsl 1
	mad	z16.h, p7/m, z23.h, z31.h
	add	x5, x5, 144
	ldr	z8, [x5]
	mla	z13.h, p7/m, z8.h, z30.h
	addvl	x5, sp, #9
	add	z15.h, z15.h, z13.h
	sqrshrunb	z15.b, z15.h, #6
	add	x5, x5, 144
	uzp1	z15.b, z15.b, z15.b
	stp	q17, q15, [x18, 16]
	ldr	z13, [x5]
	addvl	x5, sp, #12
	movprfx	z17, z31
	mla	z17.h, p7/m, z11.h, z23.h
	add	x5, x5, 144
	ldr	z3, [x5]
	mla	z17.h, p7/m, z13.h, z24.h
	addvl	x5, sp, #5
	mla	z17.h, p7/m, z3.h, z27.h
	ldr	z11, [x25]
	add	x5, x5, 144
	str	z6, [x5]
	movprfx	z15, z31
	mla	z15.h, p7/m, z11.h, z25.h
	addvl	x5, sp, #14
	mla	z17.h, p7/m, z6.h, z28.h
	add	x16, x3, x6
	add	x5, x5, 144
	ldr	z3, [x5]
	mla	z15.h, p7/m, z3.h, z26.h
	addvl	x5, sp, #6
	mla	z16.h, p7/m, z18.h, z24.h
	mla	z16.h, p7/m, z19.h, z27.h
	add	x5, x5, 144
	ldr	z3, [x5]
	mla	z15.h, p7/m, z3.h, z29.h
	addvl	x5, sp, #1
	mla	z16.h, p7/m, z22.h, z28.h
	mad	z2.h, p7/m, z23.h, z31.h
	add	x5, x5, 144
	ldr	z6, [x5]
	mla	z15.h, p7/m, z6.h, z30.h
	sub	x5, x17, x1
	add	z17.h, z17.h, z15.h
	sqrshrunb	z17.b, z17.h, #6
	add	x13, x5, 16
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x18, 48]
	ld1b	z15.h, p7/z, [x4, x13]
	sub	z15.h, z15.h, #128
	ld1b	z17.h, p7/z, [x1, x7]
	add	x13, x5, 32
	add	x5, x5, 48
	str	z15, [x25]
	ld1b	z15.h, p7/z, [x4, x13]
	movprfx	z9, z15
	sub	z9.h, z9.h, #128
	add	x13, x6, x3, lsl 1
	ld1b	z15.h, p7/z, [x4, x5]
	addvl	x5, sp, #16
	addvl	x6, sp, #11
	add	x5, x5, 144
	sub	z15.h, z15.h, #128
	add	x6, x6, 144
	str	z15, [x5]
	add	x5, sp, 144
	ldr	z13, [x5]
	movprfx	z15, z31
	mla	z15.h, p7/m, z14.h, z25.h
	mla	z15.h, p7/m, z20.h, z26.h
	mla	z15.h, p7/m, z21.h, z29.h
	mla	z15.h, p7/m, z13.h, z30.h
	add	z16.h, z16.h, z15.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x3, x16]
	mla	z2.h, p7/m, z7.h, z24.h
	ldr	z16, [x6]
	addvl	x6, sp, #8
	mla	z2.h, p7/m, z5.h, z27.h
	add	x6, x6, 144
	ldr	z15, [x6]
	mla	z2.h, p7/m, z16.h, z28.h
	addvl	x6, sp, #15
	movprfx	z16, z31
	mla	z16.h, p7/m, z1.h, z25.h
	mla	z16.h, p7/m, z12.h, z26.h
	add	x6, x6, 144
	mla	z16.h, p7/m, z4.h, z29.h
	mla	z16.h, p7/m, z15.h, z30.h
	add	z16.h, z2.h, z16.h
	ldr	z2, [x6]
	addvl	x6, sp, #17
	add	x6, x6, 144
	movprfx	z15, z31
	mla	z15.h, p7/m, z10.h, z23.h
	mla	z15.h, p7/m, z2.h, z24.h
	ldr	z2, [x6]
	addvl	x6, sp, #2
	lsl	x18, x11, 3
	add	x6, x6, 144
	str	z8, [x6]
	mla	z15.h, p7/m, z2.h, z27.h
	addvl	x6, sp, #10
	sub	x5, x18, x3
	mla	z15.h, p7/m, z8.h, z28.h
	add	x6, x6, 144
	ldr	z10, [x6]
	add	x5, x2, x5
	addvl	x6, sp, #13
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	add	x6, x6, 144
	ldr	z2, [x6]
	movprfx	z13, z31
	mla	z13.h, p7/m, z10.h, z25.h
	addvl	x6, sp, #4
	mla	z13.h, p7/m, z2.h, z26.h
	mla	z13.h, p7/m, z0.h, z29.h
	add	x6, x6, 144
	ldr	z8, [x6]
	mla	z13.h, p7/m, z8.h, z30.h
	addvl	x6, sp, #14
	add	z15.h, z15.h, z13.h
	sqrshrunb	z15.b, z15.h, #6
	add	x6, x6, 144
	uzp1	z15.b, z15.b, z15.b
	stp	q16, q15, [x5, 16]
	movprfx	z16, z31
	mla	z16.h, p7/m, z11.h, z23.h
	ldr	z11, [x6]
	addvl	x6, sp, #6
	add	x6, x6, 144
	str	z3, [x6]
	mla	z16.h, p7/m, z11.h, z24.h
	addvl	x6, sp, #1
	mla	z16.h, p7/m, z3.h, z27.h
	mla	z16.h, p7/m, z6.h, z28.h
	add	x6, x6, 144
	str	z6, [x6]
	add	x19, x1, x7
	addvl	x6, sp, #9
	sub	z17.h, z17.h, #128
	mad	z14.h, p7/m, z23.h, z31.h
	add	x6, x6, 144
	ldr	z15, [x6]
	mad	z15.h, p7/m, z25.h, z31.h
	addvl	x6, sp, #12
	mla	z14.h, p7/m, z20.h, z24.h
	mla	z14.h, p7/m, z21.h, z27.h
	add	x6, x6, 144
	ldr	z13, [x6]
	mla	z15.h, p7/m, z13.h, z26.h
	addvl	x6, sp, #5
	movprfx	z13, z31
	mla	z13.h, p7/m, z18.h, z25.h
	mla	z13.h, p7/m, z19.h, z26.h
	add	x6, x6, 144
	ldr	z3, [x6]
	mla	z15.h, p7/m, z3.h, z29.h
	addvl	x6, sp, #3
	mla	z13.h, p7/m, z22.h, z29.h
	mla	z13.h, p7/m, z17.h, z30.h
	add	x6, x6, 144
	ldr	z6, [x6]
	mla	z15.h, p7/m, z6.h, z30.h
	add	z16.h, z16.h, z15.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x5, 48]
	add	x5, x17, 16
	ld1b	z16.h, p7/z, [x4, x5]
	addvl	x5, sp, #10
	ld1b	z15.h, p7/z, [x1, x19]
	sub	z16.h, z16.h, #128
	add	x5, x5, 144
	str	z16, [x5]
	addvl	x6, sp, #13
	add	x5, x17, 32
	ld1b	z16.h, p7/z, [x4, x5]
	movprfx	z2, z16
	sub	z2.h, z2.h, #128
	add	x5, x17, 48
	ld1b	z16.h, p7/z, [x4, x5]
	mad	z1.h, p7/m, z23.h, z31.h
	add	x5, sp, 144
	ldr	z11, [x5]
	mla	z14.h, p7/m, z11.h, z28.h
	addvl	x5, sp, #8
	add	z14.h, z14.h, z13.h
	sqrshrunb	z14.b, z14.h, #6
	add	x5, x5, 144
	uzp1	z14.b, z14.b, z14.b
	mla	z1.h, p7/m, z12.h, z24.h
	add	x6, x6, 144
	mla	z1.h, p7/m, z4.h, z27.h
	str	q14, [x3, x13]
	ldr	z14, [x5]
	addvl	x5, sp, #11
	mla	z1.h, p7/m, z14.h, z28.h
	ldr	z13, [x25]
	movprfx	z14, z31
	mla	z14.h, p7/m, z7.h, z25.h
	add	x5, x5, 144
	ldr	z11, [x5]
	mla	z14.h, p7/m, z5.h, z26.h
	mla	z14.h, p7/m, z11.h, z29.h
	mla	z14.h, p7/m, z13.h, z30.h
	add	z14.h, z1.h, z14.h
	ldr	z1, [x6]
	addvl	x6, sp, #4
	movprfx	z13, z31
	mla	z13.h, p7/m, z10.h, z23.h
	mla	z13.h, p7/m, z1.h, z24.h
	add	x6, x6, 144
	str	z8, [x6]
	add	x5, x2, x18
	addvl	x6, sp, #15
	mla	z13.h, p7/m, z0.h, z27.h
	mla	z13.h, p7/m, z8.h, z28.h
	add	x6, x6, 144
	ldr	z10, [x6]
	sqrshrunb	z14.b, z14.h, #6
	addvl	x6, sp, #17
	uzp1	z14.b, z14.b, z14.b
	movprfx	z11, z31
	mla	z11.h, p7/m, z10.h, z25.h
	add	x6, x6, 144
	ldr	z1, [x6]
	mla	z11.h, p7/m, z1.h, z26.h
	addvl	x6, sp, #2
	add	x16, x7, x1, lsl 1
	sub	z15.h, z15.h, #128
	add	x6, x6, 144
	ldr	z8, [x6]
	mla	z11.h, p7/m, z8.h, z29.h
	addvl	x6, sp, #9
	mla	z11.h, p7/m, z9.h, z30.h
	add	z13.h, z13.h, z11.h
	add	x6, x6, 144
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	stp	q14, q13, [x5, 16]
	ldr	z14, [x6]
	addvl	x6, sp, #12
	add	x6, x6, 144
	ldr	z13, [x6]
	mad	z14.h, p7/m, z23.h, z31.h
	addvl	x6, sp, #5
	mla	z14.h, p7/m, z13.h, z24.h
	mla	z14.h, p7/m, z3.h, z27.h
	add	x6, x6, 144
	str	z3, [x6]
	mla	z14.h, p7/m, z6.h, z28.h
	addvl	x6, sp, #3
	add	x7, x17, x1
	mad	z18.h, p7/m, z23.h, z31.h
	add	x6, x6, 144
	str	z6, [x6]
	add	x19, x3, x13
	addvl	x6, sp, #14
	mla	z18.h, p7/m, z19.h, z24.h
	mla	z18.h, p7/m, z22.h, z27.h
	add	x6, x6, 144
	ldr	z11, [x6]
	movprfx	z13, z31
	mla	z13.h, p7/m, z11.h, z25.h
	addvl	x6, sp, #6
	mla	z18.h, p7/m, z17.h, z28.h
	mad	z7.h, p7/m, z23.h, z31.h
	add	x6, x6, 144
	ldr	z1, [x6]
	mla	z13.h, p7/m, z1.h, z26.h
	addvl	x6, sp, #1
	mla	z7.h, p7/m, z5.h, z24.h
	sub	z16.h, z16.h, #128
	add	x6, x6, 144
	ldr	z3, [x6]
	mla	z13.h, p7/m, z3.h, z29.h
	addvl	x6, sp, #16
	add	x17, x1, x16
	add	x6, x6, 144
	ldr	z6, [x6]
	mla	z13.h, p7/m, z6.h, z30.h
	add	z14.h, z14.h, z13.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x5, 48]
	addvl	x5, sp, #14
	ld1b	z14.h, p7/z, [x1, x16]
	add	x5, x5, 144
	sub	z14.h, z14.h, #128
	str	z14, [x5]
	add	x5, x7, 16
	ld1b	z14.h, p7/z, [x4, x5]
	movprfx	z6, z14
	sub	z6.h, z6.h, #128
	addvl	x5, sp, #9
	add	x6, x14, x14, lsl 2
	add	x5, x5, 144
	str	z6, [x5]
	add	x6, x2, x6
	add	x5, x7, 32
	ld1b	z14.h, p7/z, [x4, x5]
	sub	z14.h, z14.h, #128
	addvl	x5, sp, #15
	add	x7, x7, 48
	add	x5, x5, 144
	str	z14, [x5]
	ld1b	z14.h, p7/z, [x4, x7]
	add	x5, sp, 144
	ldr	z6, [x5]
	movprfx	z1, z14
	sub	z1.h, z1.h, #128
	addvl	x5, sp, #11
	movprfx	z14, z31
	mla	z14.h, p7/m, z20.h, z25.h
	mla	z14.h, p7/m, z21.h, z26.h
	add	x5, x5, 144
	mla	z14.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z15.h, z30.h
	add	z18.h, z18.h, z14.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x3, x19]
	ldr	z18, [x5]
	addvl	x5, sp, #8
	add	x5, x5, 144
	ldr	z14, [x5]
	mla	z7.h, p7/m, z18.h, z27.h
	addvl	x5, sp, #10
	ldr	z18, [x25]
	mla	z7.h, p7/m, z18.h, z28.h
	add	x5, x5, 144
	movprfx	z18, z31
	mla	z18.h, p7/m, z12.h, z25.h
	mla	z18.h, p7/m, z4.h, z26.h
	mla	z18.h, p7/m, z14.h, z29.h
	ldr	z14, [x5]
	addvl	x5, sp, #17
	add	x5, x5, 144
	mla	z18.h, p7/m, z14.h, z30.h
	add	z18.h, z7.h, z18.h
	ldr	z7, [x5]
	addvl	x5, sp, #2
	movprfx	z14, z31
	mla	z14.h, p7/m, z10.h, z23.h
	add	x5, x5, 144
	str	z8, [x5]
	mla	z14.h, p7/m, z7.h, z24.h
	addvl	x5, sp, #13
	mla	z14.h, p7/m, z8.h, z27.h
	mla	z14.h, p7/m, z9.h, z28.h
	add	x5, x5, 144
	ldr	z10, [x5]
	movprfx	z13, z31
	mla	z13.h, p7/m, z10.h, z25.h
	addvl	x5, sp, #4
	mla	z13.h, p7/m, z0.h, z26.h
	sqrshrunb	z18.b, z18.h, #6
	add	x5, x5, 144
	ldr	z8, [x5]
	mla	z13.h, p7/m, z8.h, z29.h
	addvl	x5, sp, #6
	mla	z13.h, p7/m, z2.h, z30.h
	add	z14.h, z14.h, z13.h
	add	x5, x5, 144
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	uzp1	z18.b, z18.b, z18.b
	stp	q18, q14, [x6, 16]
	ldr	z14, [x5]
	addvl	x5, sp, #1
	movprfx	z18, z31
	mla	z18.h, p7/m, z11.h, z23.h
	mla	z18.h, p7/m, z14.h, z24.h
	add	x5, x5, 144
	str	z3, [x5]
	mla	z18.h, p7/m, z3.h, z27.h
	addvl	x5, sp, #16
	add	x13, x13, x3, lsl 1
	mad	z20.h, p7/m, z23.h, z31.h
	add	x5, x5, 144
	ldr	z8, [x5]
	mla	z18.h, p7/m, z8.h, z28.h
	addvl	x5, sp, #12
	mla	z20.h, p7/m, z21.h, z24.h
	mla	z20.h, p7/m, z6.h, z27.h
	add	x5, x5, 144
	ldr	z11, [x5]
	movprfx	z14, z31
	mla	z14.h, p7/m, z11.h, z25.h
	addvl	x5, sp, #5
	mla	z20.h, p7/m, z15.h, z28.h
	mad	z12.h, p7/m, z23.h, z31.h
	add	x5, x5, 144
	ldr	z13, [x5]
	mla	z14.h, p7/m, z13.h, z26.h
	addvl	x5, sp, #3
	mla	z12.h, p7/m, z4.h, z24.h
	add	x7, x16, x1, lsl 1
	add	x5, x5, 144
	ldr	z13, [x5]
	mla	z14.h, p7/m, z13.h, z29.h
	lsl	x5, x12, 1
	mla	z14.h, p7/m, z16.h, z30.h
	add	z18.h, z18.h, z14.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x6, 48]
	add	x6, x5, 16
	ld1b	z18.h, p7/z, [x4, x6]
	movprfx	z3, z18
	sub	z3.h, z3.h, #128
	add	x6, x5, 32
	ld1b	z18.h, p7/z, [x4, x6]
	ld1b	z13.h, p7/z, [x1, x17]
	addvl	x6, sp, #12
	sub	z18.h, z18.h, #128
	add	x14, x3, x13
	add	x6, x6, 144
	str	z18, [x6]
	movprfx	z18, z31
	mla	z18.h, p7/m, z19.h, z25.h
	add	x6, x5, 48
	ld1b	z14.h, p7/z, [x4, x6]
	mla	z18.h, p7/m, z22.h, z26.h
	add	x6, sp, 144
	str	z6, [x6]
	mla	z18.h, p7/m, z17.h, z29.h
	addvl	x6, sp, #14
	add	x5, x5, x1
	mad	z19.h, p7/m, z23.h, z31.h
	add	x6, x6, 144
	ldr	z6, [x6]
	mla	z18.h, p7/m, z6.h, z30.h
	addvl	x6, sp, #8
	add	z20.h, z20.h, z18.h
	sqrshrunb	z20.b, z20.h, #6
	add	x6, x6, 144
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x13]
	ldr	z20, [x6]
	addvl	x6, sp, #10
	mla	z12.h, p7/m, z20.h, z27.h
	add	x6, x6, 144
	ldr	z20, [x6]
	mla	z12.h, p7/m, z20.h, z28.h
	addvl	x6, sp, #11
	movprfx	z20, z31
	mla	z20.h, p7/m, z5.h, z25.h
	mla	z19.h, p7/m, z22.h, z24.h
	add	x6, x6, 144
	ldr	z18, [x6]
	mla	z20.h, p7/m, z18.h, z26.h
	addvl	x6, sp, #9
	ldr	z18, [x25]
	mla	z20.h, p7/m, z18.h, z29.h
	add	x6, x6, 144
	ldr	z6, [x6]
	mla	z20.h, p7/m, z6.h, z30.h
	addvl	x6, sp, #4
	add	z20.h, z12.h, z20.h
	movprfx	z18, z31
	mla	z18.h, p7/m, z10.h, z23.h
	add	x6, x6, 144
	ldr	z12, [x6]
	mla	z18.h, p7/m, z0.h, z24.h
	addvl	x6, sp, #2
	mla	z18.h, p7/m, z12.h, z27.h
	movprfx	z12, z31
	mla	z12.h, p7/m, z7.h, z25.h
	add	x6, x6, 144
	ldr	z10, [x6]
	mla	z12.h, p7/m, z10.h, z26.h
	addvl	x6, sp, #15
	mla	z12.h, p7/m, z9.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	add	x6, x6, 144
	ldr	z10, [x6]
	mla	z12.h, p7/m, z10.h, z30.h
	addvl	x6, sp, #5
	add	z18.h, z18.h, z12.h
	sqrshrunb	z18.b, z18.h, #6
	add	x6, x6, 144
	uzp1	z18.b, z18.b, z18.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	stp	q20, q18, [x15, 16]
	ldr	z18, [x6]
	addvl	x6, sp, #3
	movprfx	z20, z31
	mla	z20.h, p7/m, z11.h, z23.h
	mla	z20.h, p7/m, z18.h, z24.h
	add	x6, x6, 144
	ldr	z12, [x6]
	mla	z20.h, p7/m, z12.h, z27.h
	addvl	x6, sp, #6
	mla	z20.h, p7/m, z16.h, z28.h
	mla	z19.h, p7/m, z17.h, z27.h
	add	x6, x6, 144
	ldr	z18, [x6]
	mad	z18.h, p7/m, z25.h, z31.h
	addvl	x6, sp, #1
	sub	z13.h, z13.h, #128
	sub	z14.h, z14.h, #128
	add	x6, x6, 144
	ldr	z12, [x6]
	mla	z18.h, p7/m, z12.h, z26.h
	add	x6, x5, 16
	mla	z18.h, p7/m, z8.h, z29.h
	mla	z18.h, p7/m, z1.h, z30.h
	add	z20.h, z20.h, z18.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x15, 48]
	ld1b	z18.h, p7/z, [x4, x6]
	addvl	x6, sp, #13
	add	x6, x6, 144
	ld1b	z20.h, p7/z, [x1, x7]
	movprfx	z11, z18
	sub	z11.h, z11.h, #128
	str	z11, [x6]
	add	x6, x5, 32
	add	x5, x5, 48
	ld1b	z12.h, p7/z, [x4, x5]
	addvl	x5, sp, #14
	ld1b	z11.h, p7/z, [x4, x6]
	add	x5, x5, 144
	ldr	z6, [x5]
	mla	z19.h, p7/m, z6.h, z28.h
	add	x5, sp, 144
	ldr	z6, [x5]
	movprfx	z18, z31
	mla	z18.h, p7/m, z21.h, z25.h
	add	x5, x11, x18
	addvl	x11, sp, #11
	mla	z18.h, p7/m, z6.h, z26.h
	add	x11, x11, 144
	mla	z18.h, p7/m, z15.h, z29.h
	mla	z18.h, p7/m, z13.h, z30.h
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x14]
	ldr	z10, [x11]
	addvl	x11, sp, #9
	add	x11, x11, 144
	movprfx	z19, z31
	mla	z19.h, p7/m, z5.h, z23.h
	ldr	z5, [x11]
	addvl	x11, sp, #8
	ldr	z18, [x25]
	mla	z19.h, p7/m, z10.h, z24.h
	add	x11, x11, 144
	mla	z19.h, p7/m, z18.h, z27.h
	mla	z19.h, p7/m, z5.h, z28.h
	ldr	z5, [x11]
	addvl	x11, sp, #10
	movprfx	z18, z31
	mla	z18.h, p7/m, z4.h, z25.h
	add	x11, x11, 144
	mla	z18.h, p7/m, z5.h, z26.h
	ldr	z5, [x11]
	addvl	x11, sp, #2
	mla	z18.h, p7/m, z5.h, z29.h
	mla	z18.h, p7/m, z3.h, z30.h
	add	x11, x11, 144
	add	z19.h, z19.h, z18.h
	movprfx	z18, z31
	mla	z18.h, p7/m, z7.h, z23.h
	ldr	z7, [x11]
	addvl	x11, sp, #15
	mla	z18.h, p7/m, z7.h, z24.h
	add	x11, x11, 144
	ldr	z7, [x11]
	mla	z18.h, p7/m, z9.h, z27.h
	addvl	x11, sp, #4
	mla	z18.h, p7/m, z7.h, z28.h
	add	x5, x2, x5
	add	x11, x11, 144
	ldr	z7, [x11]
	movprfx	z10, z31
	mla	z10.h, p7/m, z0.h, z25.h
	addvl	x11, sp, #12
	mla	z10.h, p7/m, z7.h, z26.h
	sqrshrunb	z19.b, z19.h, #6
	add	x11, x11, 144
	ldr	z7, [x11]
	uzp1	z19.b, z19.b, z19.b
	addvl	x11, sp, #6
	mla	z10.h, p7/m, z2.h, z29.h
	mla	z10.h, p7/m, z7.h, z30.h
	add	x11, x11, 144
	add	z18.h, z18.h, z10.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q19, q18, [x5, 16]
	ldr	z19, [x11]
	addvl	x11, sp, #1
	mad	z19.h, p7/m, z23.h, z31.h
	mad	z21.h, p7/m, z23.h, z31.h
	add	x11, x11, 144
	ldr	z18, [x11]
	mla	z19.h, p7/m, z18.h, z24.h
	addvl	x11, sp, #5
	mla	z19.h, p7/m, z8.h, z27.h
	mla	z19.h, p7/m, z1.h, z28.h
	add	x11, x11, 144
	ldr	z5, [x11]
	movprfx	z18, z31
	mla	z18.h, p7/m, z5.h, z25.h
	addvl	x11, sp, #3
	add	x12, x1, x7
	mla	z21.h, p7/m, z6.h, z24.h
	add	x11, x11, 144
	ldr	z7, [x11]
	mla	z18.h, p7/m, z7.h, z26.h
	mla	z18.h, p7/m, z16.h, z29.h
	mla	z18.h, p7/m, z14.h, z30.h
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x5, 48]
	add	x5, x0, 16
	ld1b	z19.h, p7/z, [x4, x5]
	ld1b	z7.h, p7/z, [x1, x12]
	addvl	x5, sp, #5
	sub	z19.h, z19.h, #128
	add	x6, x13, x3, lsl 1
	add	x5, x5, 144
	str	z19, [x5]
	sub	z20.h, z20.h, #128
	add	x5, x0, 32
	ld1b	z19.h, p7/z, [x4, x5]
	sub	z19.h, z19.h, #128
	addvl	x5, sp, #6
	mla	z21.h, p7/m, z15.h, z27.h
	mla	z21.h, p7/m, z13.h, z28.h
	add	x5, x5, 144
	str	z19, [x5]
	movprfx	z19, z31
	mla	z19.h, p7/m, z22.h, z25.h
	add	x5, x0, 48
	ld1b	z10.h, p7/z, [x4, x5]
	mla	z19.h, p7/m, z17.h, z26.h
	add	x5, sp, 144
	str	z6, [x5]
	addvl	x12, sp, #4
	addvl	x5, sp, #14
	add	x12, x12, 144
	sub	z11.h, z11.h, #128
	add	x5, x5, 144
	ldr	z6, [x5]
	mla	z19.h, p7/m, z6.h, z29.h
	addvl	x5, sp, #8
	mla	z19.h, p7/m, z20.h, z30.h
	add	z21.h, z21.h, z19.h
	add	x5, x5, 144
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x6]
	ldr	z19, [x5]
	addvl	x5, sp, #10
	add	x5, x5, 144
	ldr	z18, [x5]
	movprfx	z21, z31
	mla	z21.h, p7/m, z4.h, z23.h
	addvl	x5, sp, #11
	mla	z21.h, p7/m, z19.h, z24.h
	mla	z21.h, p7/m, z18.h, z27.h
	add	x5, x5, 144
	ldr	z18, [x25]
	ldr	z4, [x5]
	addvl	x5, sp, #9
	movprfx	z19, z31
	mla	z19.h, p7/m, z4.h, z25.h
	mla	z19.h, p7/m, z18.h, z26.h
	add	x5, x5, 144
	ldr	z18, [x5]
	mla	z19.h, p7/m, z18.h, z29.h
	ldr	z18, [x12]
	addvl	x5, sp, #13
	addvl	x12, sp, #12
	add	x5, x5, 144
	ldr	z6, [x5]
	add	x12, x12, 144
	mla	z19.h, p7/m, z6.h, z30.h
	mla	z21.h, p7/m, z3.h, z28.h
	add	z21.h, z21.h, z19.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z0.h, z23.h
	ldr	z0, [x12]
	addvl	x12, sp, #2
	add	x12, x12, 144
	mla	z19.h, p7/m, z18.h, z24.h
	ldr	z18, [x12]
	addvl	x12, sp, #15
	add	x5, x2, x8, lsl 2
	mla	z19.h, p7/m, z2.h, z27.h
	add	x12, x12, 144
	mla	z19.h, p7/m, z0.h, z28.h
	ldr	z0, [x12]
	addvl	x12, sp, #3
	add	x7, x7, x1, lsl 1
	mad	z18.h, p7/m, z25.h, z31.h
	add	x12, x12, 144
	add	x0, x0, x1
	mla	z18.h, p7/m, z9.h, z26.h
	sqrshrunb	z21.b, z21.h, #6
	mla	z18.h, p7/m, z0.h, z29.h
	uzp1	z21.b, z21.b, z21.b
	mla	z18.h, p7/m, z11.h, z30.h
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	stp	q21, q19, [x5, 16]
	ldr	z0, [x12]
	addvl	x12, sp, #1
	sub	z12.h, z12.h, #128
	movprfx	z21, z31
	mla	z21.h, p7/m, z5.h, z23.h
	add	x12, x12, 144
	ldr	z19, [x12]
	mla	z21.h, p7/m, z0.h, z24.h
	mad	z19.h, p7/m, z25.h, z31.h
	mla	z21.h, p7/m, z16.h, z27.h
	mla	z19.h, p7/m, z8.h, z26.h
	mla	z21.h, p7/m, z14.h, z28.h
	mla	z19.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z12.h, z30.h
	add	z21.h, z21.h, z19.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x5, 48]
	add	x5, x1, x7
	ld1b	z0.h, p7/z, [x1, x7]
	add	x7, x0, 16
	ld1b	z21.h, p7/z, [x4, x7]
	sub	z21.h, z21.h, #128
	addvl	x7, sp, #11
	add	x11, x3, x6
	sub	z7.h, z7.h, #128
	add	x7, x7, 144
	str	z21, [x7]
	mad	z22.h, p7/m, z23.h, z31.h
	add	x7, x0, 32
	add	x0, x0, 48
	ld1b	z19.h, p7/z, [x4, x0]
	addvl	x0, sp, #14
	mla	z22.h, p7/m, z17.h, z24.h
	ld1b	z18.h, p7/z, [x4, x7]
	add	x0, x0, 144
	ldr	z6, [x0]
	mla	z22.h, p7/m, z6.h, z27.h
	add	x0, sp, 144
	ldr	z21, [x0]
	mla	z22.h, p7/m, z20.h, z28.h
	addvl	x0, sp, #9
	mad	z21.h, p7/m, z25.h, z31.h
	mla	z21.h, p7/m, z15.h, z26.h
	add	x0, x0, 144
	mla	z21.h, p7/m, z13.h, z29.h
	mla	z21.h, p7/m, z7.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x11]
	movprfx	z22, z31
	mla	z22.h, p7/m, z4.h, z23.h
	ldr	z4, [x0]
	addvl	x0, sp, #13
	ldr	z21, [x25]
	mla	z22.h, p7/m, z21.h, z24.h
	add	x0, x0, 144
	mla	z22.h, p7/m, z4.h, z27.h
	ldr	z4, [x0]
	addvl	x0, sp, #8
	mla	z22.h, p7/m, z4.h, z28.h
	add	x8, x3, x8, lsl 2
	add	x0, x0, 144
	ldr	z4, [x0]
	movprfx	z21, z31
	mla	z21.h, p7/m, z4.h, z25.h
	addvl	x0, sp, #10
	add	x8, x2, x8
	sub	z10.h, z10.h, #128
	add	x0, x0, 144
	ldr	z5, [x0]
	mla	z21.h, p7/m, z5.h, z26.h
	addvl	x0, sp, #5
	mla	z21.h, p7/m, z3.h, z29.h
	lsl	x9, x9, 1
	add	x0, x0, 144
	ldr	z5, [x0]
	mla	z21.h, p7/m, z5.h, z30.h
	addvl	x0, sp, #2
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	add	x0, x0, 144
	ldr	z21, [x0]
	mad	z21.h, p7/m, z23.h, z31.h
	addvl	x0, sp, #15
	mla	z21.h, p7/m, z9.h, z24.h
	uzp1	z22.b, z22.b, z22.b
	add	x0, x0, 144
	ldr	z5, [x0]
	mla	z21.h, p7/m, z5.h, z27.h
	addvl	x0, sp, #4
	mla	z21.h, p7/m, z11.h, z28.h
	add	x6, x6, x3, lsl 1
	add	x0, x0, 144
	ldr	z5, [x0]
	mad	z5.h, p7/m, z25.h, z31.h
	addvl	x0, sp, #12
	mla	z5.h, p7/m, z2.h, z26.h
	sub	z0.h, z0.h, #128
	add	x0, x0, 144
	ldr	z4, [x0]
	mla	z5.h, p7/m, z4.h, z29.h
	addvl	x0, sp, #6
	add	x10, x2, x10, lsl 1
	sub	z18.h, z18.h, #128
	add	x0, x0, 144
	ldr	z6, [x0]
	mla	z5.h, p7/m, z6.h, z30.h
	addvl	x0, sp, #3
	add	z21.h, z21.h, z5.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	add	x0, x0, 144
	stp	q22, q21, [x8, 16]
	ldr	z22, [x12]
	ldr	z21, [x0]
	mad	z22.h, p7/m, z23.h, z31.h
	mad	z21.h, p7/m, z25.h, z31.h
	mla	z22.h, p7/m, z8.h, z24.h
	mla	z21.h, p7/m, z16.h, z26.h
	mla	z22.h, p7/m, z1.h, z27.h
	mla	z21.h, p7/m, z14.h, z29.h
	mla	z22.h, p7/m, z12.h, z28.h
	mla	z21.h, p7/m, z10.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	add	x0, x9, 16
	str	q22, [x8, 48]
	ld1b	z22.h, p7/z, [x1, x5]
	sub	z22.h, z22.h, #128
	str	z22, [x12]
	ld1b	z22.h, p7/z, [x4, x0]
	addvl	x0, sp, #2
	movprfx	z21, z22
	sub	z21.h, z21.h, #128
	add	x0, x0, 144
	str	z21, [x0]
	movprfx	z21, z31
	mla	z21.h, p7/m, z17.h, z25.h
	add	x0, x9, 32
	ld1b	z4.h, p7/z, [x4, x0]
	add	x9, x9, 48
	add	x0, sp, 144
	ldr	z22, [x0]
	mad	z22.h, p7/m, z23.h, z31.h
	addvl	x0, sp, #14
	mla	z22.h, p7/m, z15.h, z24.h
	mla	z22.h, p7/m, z13.h, z27.h
	add	x0, x0, 144
	ldr	z6, [x0]
	mla	z22.h, p7/m, z7.h, z28.h
	addvl	x0, sp, #8
	mla	z21.h, p7/m, z6.h, z26.h
	mla	z21.h, p7/m, z20.h, z29.h
	add	x0, x0, 144
	mla	z21.h, p7/m, z0.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	ld1b	z5.h, p7/z, [x4, x9]
	str	q22, [x3, x6]
	ldr	z22, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 144
	ldr	z21, [x0]
	mad	z22.h, p7/m, z23.h, z31.h
	add	x0, sp, 144
	str	z3, [x0]
	mla	z22.h, p7/m, z21.h, z24.h
	addvl	x0, sp, #5
	mla	z22.h, p7/m, z3.h, z27.h
	add	x1, x3, x6
	add	x0, x0, 144
	ldr	z21, [x0]
	mla	z22.h, p7/m, z21.h, z28.h
	addvl	x0, sp, #9
	ldr	z21, [x25]
	mad	z21.h, p7/m, z25.h, z31.h
	add	x0, x0, 144
	ldr	z6, [x0]
	mla	z21.h, p7/m, z6.h, z26.h
	addvl	x0, sp, #13
	sub	z19.h, z19.h, #128
	mad	z17.h, p7/m, z23.h, z31.h
	add	x0, x0, 144
	ldr	z3, [x0]
	mla	z21.h, p7/m, z3.h, z29.h
	addvl	x0, sp, #11
	mad	z15.h, p7/m, z25.h, z31.h
	mad	z13.h, p7/m, z26.h, z15.h
	add	x0, x0, 144
	ldr	z3, [x0]
	mla	z21.h, p7/m, z3.h, z30.h
	addvl	x0, sp, #4
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	add	x0, x0, 144
	ldr	z21, [x0]
	mad	z21.h, p7/m, z23.h, z31.h
	addvl	x0, sp, #12
	mla	z21.h, p7/m, z2.h, z24.h
	uzp1	z22.b, z22.b, z22.b
	add	x0, x0, 144
	ldr	z3, [x0]
	mla	z21.h, p7/m, z3.h, z27.h
	addvl	x0, sp, #6
	mad	z7.h, p7/m, z29.h, z13.h
	sub	z4.h, z4.h, #128
	add	x0, x0, 144
	ldr	z6, [x0]
	mla	z21.h, p7/m, z6.h, z28.h
	addvl	x0, sp, #15
	movprfx	z6, z31
	mla	z6.h, p7/m, z9.h, z25.h
	sub	z5.h, z5.h, #128
	add	x0, x0, 144
	ldr	z3, [x0]
	mla	z6.h, p7/m, z3.h, z26.h
	addvl	x0, sp, #3
	mla	z6.h, p7/m, z11.h, z29.h
	mla	z6.h, p7/m, z18.h, z30.h
	add	x0, x0, 144
	add	z21.h, z21.h, z6.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x10, 16]
	ldr	z22, [x0]
	addvl	x0, sp, #16
	mad	z22.h, p7/m, z23.h, z31.h
	movprfx	z21, z31
	mla	z21.h, p7/m, z8.h, z25.h
	add	x0, x0, 144
	mla	z22.h, p7/m, z16.h, z24.h
	mla	z21.h, p7/m, z1.h, z26.h
	mla	z22.h, p7/m, z14.h, z27.h
	mla	z21.h, p7/m, z12.h, z29.h
	mla	z22.h, p7/m, z10.h, z28.h
	mla	z21.h, p7/m, z19.h, z30.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	z8, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 144
	str	q22, [x10, 48]
	ldr	z6, [x0]
	movprfx	z22, z17
	mla	z22.h, p7/m, z6.h, z24.h
	mad	z20.h, p7/m, z27.h, z22.h
	mla	z20.h, p7/m, z0.h, z28.h
	ldr	z22, [x12]
	mad	z22.h, p7/m, z30.h, z7.h
	add	z20.h, z20.h, z22.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x1]
	addvl	x1, sp, #9
	ldr	z22, [x25]
	mad	z22.h, p7/m, z23.h, z31.h
	add	x1, x1, 144
	ldr	z6, [x1]
	mla	z22.h, p7/m, z6.h, z24.h
	addvl	x1, sp, #13
	add	x0, x2, x3, lsl 5
	mad	z16.h, p7/m, z25.h, z31.h
	add	x1, x1, 144
	ldr	z21, [x1]
	mad	z21.h, p7/m, z27.h, z22.h
	addvl	x1, sp, #11
	sub	x0, x0, x3
	mad	z14.h, p7/m, z26.h, z16.h
	add	x1, x1, 144
	ldr	z17, [x1]
	mla	z21.h, p7/m, z17.h, z28.h
	addvl	x1, sp, #10
	mad	z10.h, p7/m, z29.h, z14.h
	mad	z5.h, p7/m, z30.h, z10.h
	add	x1, x1, 144
	ldr	z22, [x1]
	mad	z22.h, p7/m, z25.h, z31.h
	add	x1, sp, 144
	ldr	z20, [x1]
	mla	z22.h, p7/m, z20.h, z26.h
	addvl	x1, sp, #5
	add	x1, x1, 144
	ldr	z8, [x1]
	mad	z8.h, p7/m, z29.h, z22.h
	addvl	x1, sp, #2
	add	x1, x1, 144
	ldr	z22, [x1]
	mad	z22.h, p7/m, z30.h, z8.h
	addvl	x1, sp, #12
	add	z8.h, z21.h, z22.h
	movprfx	z22, z31
	mla	z22.h, p7/m, z9.h, z23.h
	add	x1, x1, 144
	mla	z22.h, p7/m, z3.h, z24.h
	ldr	z3, [x1]
	addvl	x1, sp, #6
	sqrshrunb	z8.b, z8.h, #6
	uzp1	z8.b, z8.b, z8.b
	add	x1, x1, 144
	ldr	z9, [x1]
	mad	z11.h, p7/m, z27.h, z22.h
	addvl	x1, sp, #16
	mad	z18.h, p7/m, z28.h, z11.h
	movprfx	z22, z31
	mla	z22.h, p7/m, z2.h, z25.h
	add	x1, x1, 144
	mla	z22.h, p7/m, z3.h, z26.h
	mad	z9.h, p7/m, z29.h, z22.h
	mad	z4.h, p7/m, z30.h, z9.h
	add	z18.h, z18.h, z4.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q8, q18, [x0, 16]
	ldr	z8, [x1]
	mad	z23.h, p7/m, z8.h, z31.h
	mad	z24.h, p7/m, z1.h, z23.h
	mad	z12.h, p7/m, z27.h, z24.h
	mad	z19.h, p7/m, z28.h, z12.h
	add	z19.h, z19.h, z5.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x0, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	d8, d9, [sp, 80]
	ldp	d10, d11, [sp, 96]
	ldp	d12, d13, [sp, 112]
	ldp	d14, d15, [sp, 128]
	.cfi_remember_state
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	addvl	sp, sp, #19
	.cfi_def_cfa_offset 144
	add	sp, sp, 144
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
	.size	dynopt_interp8_64x32_sve2_vpp, .-dynopt_interp8_64x32_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
