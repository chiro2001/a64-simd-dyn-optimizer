	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_64x48_sve2_vpp
	.type	dynopt_interp8_64x48_sve2_vpp, %function
dynopt_interp8_64x48_sve2_vpp:
.LFB3:
	.cfi_startproc
	addvl	sp, sp, #-21
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xa8,0x1e,0x22
	sub	w5, w4, #1
	sub	sp, sp, #192
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xa8,0x1e,0x23,0xc0,0x1,0x22
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	stp	d14, d15, [sp, 144]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x1a,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x1b,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x1c,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x48,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4d,0x3,0x8f,0x88,0x1
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x90,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x98,0x1
	cmp	w5, 2
	bhi	.L3
	cmp	w4, 1
	beq	.L4
	mov	z0.b, #-1
	mov	z6.h, #4
	cmp	w4, 3
	bne	.L7
	mov	z1.h, #-10
	mov	z25.h, #58
	mov	z4.h, #17
	mov	z16.h, #-5
	mov	z2.h, #1
	movi	d5, #0
	b	.L2
	.p2align 2,,3
.L3:
	mov	z0.b, #-1
	mov	z6.h, #4
.L7:
	mov	z1.h, #-11
	mov	z25.h, #40
	mov	z16.d, z1.d
	mov	z4.d, z25.d
	mov	z2.d, z6.d
	mov	z5.d, z0.d
.L2:
	add	x16, x1, x1, lsl 1
	add	x7, x1, 16
	ptrue	p7.b, all
	sub	x4, x0, x16
	ld1b	z15.h, p7/z, [x4, x7]
	add	x7, x1, 32
	add	x6, x4, 16
	ld1b	z9.h, p7/z, [x6]
	ld1b	z14.h, p7/z, [x4, x7]
	add	x6, x4, 32
	add	x7, x1, 48
	ld1b	z12.h, p7/z, [x6]
	add	x6, x4, 48
	ld1b	z31.h, p7/z, [x4, x7]
	ld1b	z11.h, p7/z, [x6]
	addvl	x7, sp, #2
	add	x6, x4, x1
	sub	z31.h, z31.h, #128
	ld1b	z13.h, p7/z, [x4, x1]
	ld1b	z10.h, p7/z, [x4]
	add	x7, x7, 192
	str	z31, [x7]
	ld1b	z31.h, p7/z, [x6, x1]
	addvl	x6, sp, #18
	lsl	x5, x1, 1
	add	x6, x6, 192
	sub	z31.h, z31.h, #128
	str	z31, [x6]
	add	x6, x5, 16
	ld1b	z3.h, p7/z, [x4, x6]
	addvl	x6, sp, #17
	sub	z3.h, z3.h, #128
	sub	z10.h, z10.h, #128
	add	x6, x6, 192
	str	z3, [x6]
	sub	z13.h, z13.h, #128
	add	x6, x5, 32
	add	x5, x5, 48
	ld1b	z31.h, p7/z, [x4, x6]
	addvl	x6, sp, #9
	sub	z31.h, z31.h, #128
	sub	z15.h, z15.h, #128
	add	x6, x6, 192
	str	z31, [x6]
	ld1b	z31.h, p7/z, [x4, x5]
	addvl	x5, sp, #1
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	lsl	x6, x1, 2
	add	x5, x5, 192
	str	z30, [x5]
	ld1b	z31.h, p7/z, [x0]
	addvl	x5, sp, #7
	sub	z31.h, z31.h, #128
	sub	z9.h, z9.h, #128
	add	x5, x5, 192
	str	z31, [x5]
	sub	z12.h, z12.h, #128
	add	x5, x0, 16
	ld1b	z7.h, p7/z, [x5]
	sub	z7.h, z7.h, #128
	add	x5, x0, 32
	add	x0, x0, 48
	ld1b	z31.h, p7/z, [x5]
	add	x5, sp, 192
	sub	z31.h, z31.h, #128
	str	z31, [x5]
	add	x5, x6, 16
	ld1b	z31.h, p7/z, [x0]
	addvl	x0, sp, #3
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	add	x0, x0, 192
	str	z30, [x0]
	ld1b	z19.h, p7/z, [x4, x5]
	add	x5, x6, 32
	ld1b	z17.h, p7/z, [x4, x6]
	ld1b	z18.h, p7/z, [x4, x5]
	add	x5, x6, 48
	add	x6, x6, x1
	ld1b	z20.h, p7/z, [x4, x5]
	add	x5, x6, 16
	ld1b	z23.h, p7/z, [x4, x5]
	add	x5, x6, 32
	ld1b	z22.h, p7/z, [x4, x5]
	add	x0, x4, x1, lsl 2
	add	x5, x6, 48
	ld1b	z31.h, p7/z, [x4, x5]
	ld1b	z21.h, p7/z, [x0, x1]
	addvl	x5, sp, #15
	add	x7, x0, x1
	sub	z31.h, z31.h, #128
	add	x5, x5, 192
	str	z31, [x5]
	ld1b	z24.h, p7/z, [x1, x7]
	lsl	x5, x16, 1
	add	x0, x0, x1, lsl 1
	sub	z21.h, z21.h, #128
	add	x7, x5, 16
	ld1b	z26.h, p7/z, [x4, x7]
	sub	z24.h, z24.h, #128
	add	x7, x5, 32
	add	x5, x5, 48
	ld1b	z31.h, p7/z, [x4, x7]
	addvl	x7, sp, #12
	sub	z31.h, z31.h, #128
	sub	z17.h, z17.h, #128
	add	x7, x7, 192
	str	z31, [x7]
	ld1b	z27.h, p7/z, [x4, x5]
	addvl	x5, sp, #5
	lsl	x7, x1, 3
	sub	z27.h, z27.h, #128
	add	x5, x5, 192
	sub	x22, x7, x1
	str	z27, [x5]
	add	x5, x1, x0
	add	x8, x22, 16
	ld1b	z8.h, p7/z, [x1, x5]
	addvl	x5, sp, #14
	ld1b	z30.h, p7/z, [x4, x8]
	add	x8, x22, 32
	add	x5, x5, 192
	ld1b	z28.h, p7/z, [x1, x0]
	ld1b	z29.h, p7/z, [x4, x8]
	sub	z8.h, z8.h, #128
	add	x8, x22, 48
	ld1b	z31.h, p7/z, [x4, x8]
	str	z8, [x5]
	add	x5, x7, 16
	ld1b	z8.h, p7/z, [x4, x5]
	addvl	x5, sp, #8
	sub	z8.h, z8.h, #128
	sub	z28.h, z28.h, #128
	add	x5, x5, 192
	str	z8, [x5]
	sub	z30.h, z30.h, #128
	add	x5, x7, 32
	ld1b	z8.h, p7/z, [x4, x5]
	movprfx	z3, z8
	sub	z3.h, z3.h, #128
	addvl	x5, sp, #4
	sub	z26.h, z26.h, #128
	sub	z23.h, z23.h, #128
	add	x5, x5, 192
	str	z3, [x5]
	mov	z3.h, #4096
	add	x5, x7, 48
	ld1b	z8.h, p7/z, [x4, x5]
	sub	z8.h, z8.h, #128
	addvl	x5, sp, #6
	mad	z10.h, p7/m, z5.h, z3.h
	sub	z19.h, z19.h, #128
	add	x5, x5, 192
	str	z8, [x5]
	movprfx	z8, z3
	mla	z8.h, p7/m, z13.h, z2.h
	addvl	x5, sp, #18
	mad	z9.h, p7/m, z5.h, z3.h
	mad	z12.h, p7/m, z5.h, z3.h
	add	x5, x5, 192
	ldr	z27, [x5]
	mla	z10.h, p7/m, z27.h, z16.h
	addvl	x5, sp, #7
	mla	z10.h, p7/m, z17.h, z25.h
	mla	z10.h, p7/m, z24.h, z6.h
	add	x5, x5, 192
	ldr	z27, [x5]
	mla	z8.h, p7/m, z27.h, z4.h
	addvl	x5, sp, #17
	mla	z8.h, p7/m, z21.h, z1.h
	mla	z8.h, p7/m, z28.h, z0.h
	add	x5, x5, 192
	add	z10.h, z10.h, z8.h
	ldr	z8, [x5]
	addvl	x5, sp, #9
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	add	x5, x5, 192
	mla	z9.h, p7/m, z8.h, z16.h
	movprfx	z8, z3
	mla	z8.h, p7/m, z15.h, z2.h
	mla	z9.h, p7/m, z19.h, z25.h
	mla	z8.h, p7/m, z7.h, z4.h
	mla	z9.h, p7/m, z26.h, z6.h
	mla	z8.h, p7/m, z23.h, z1.h
	mla	z8.h, p7/m, z30.h, z0.h
	add	z9.h, z9.h, z8.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	stp	q10, q9, [x2]
	ldr	z10, [x5]
	addvl	x5, sp, #12
	mla	z12.h, p7/m, z10.h, z16.h
	add	x5, x5, 192
	ldr	z10, [x5]
	sub	z29.h, z29.h, #128
	add	x5, sp, 192
	ldr	z27, [x5]
	sub	z22.h, z22.h, #128
	addvl	x5, sp, #1
	sub	z18.h, z18.h, #128
	sub	z14.h, z14.h, #128
	mla	z12.h, p7/m, z18.h, z25.h
	add	x5, x5, 192
	mla	z12.h, p7/m, z10.h, z6.h
	movprfx	z10, z3
	mla	z10.h, p7/m, z14.h, z2.h
	mla	z10.h, p7/m, z27.h, z4.h
	mla	z10.h, p7/m, z22.h, z1.h
	mla	z10.h, p7/m, z29.h, z0.h
	add	z12.h, z12.h, z10.h
	sub	z11.h, z11.h, #128
	ldr	z10, [x5]
	addvl	x5, sp, #5
	mad	z11.h, p7/m, z5.h, z3.h
	add	x5, x5, 192
	ldr	z27, [x5]
	mla	z11.h, p7/m, z10.h, z16.h
	addvl	x5, sp, #2
	sub	z31.h, z31.h, #128
	add	x7, x7, x1
	add	x5, x5, 192
	ldr	z10, [x5]
	mad	z10.h, p7/m, z2.h, z3.h
	addvl	x5, sp, #3
	sub	z20.h, z20.h, #128
	sqrshrunb	z12.b, z12.h, #6
	add	x5, x5, 192
	ldr	z9, [x5]
	mla	z10.h, p7/m, z9.h, z4.h
	addvl	x5, sp, #15
	mla	z11.h, p7/m, z20.h, z25.h
	uzp1	z12.b, z12.b, z12.b
	add	x5, x5, 192
	ldr	z9, [x5]
	mla	z11.h, p7/m, z27.h, z6.h
	addvl	x5, sp, #13
	mla	z10.h, p7/m, z9.h, z1.h
	mla	z10.h, p7/m, z31.h, z0.h
	add	x5, x5, 192
	add	z11.h, z11.h, z10.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	stp	q12, q11, [x2, 32]
	add	x0, x0, x1, lsl 1
	ld1b	z12.h, p7/z, [x1, x0]
	sub	z12.h, z12.h, #128
	str	z12, [x5]
	add	x5, x7, 16
	ld1b	z11.h, p7/z, [x4, x5]
	movprfx	z10, z11
	sub	z10.h, z10.h, #128
	add	x5, x7, 32
	ld1b	z11.h, p7/z, [x4, x5]
	movprfx	z8, z11
	sub	z8.h, z8.h, #128
	add	x5, x7, 48
	ld1b	z11.h, p7/z, [x4, x5]
	sub	z11.h, z11.h, #128
	addvl	x5, sp, #11
	addvl	x9, sp, #17
	mad	z13.h, p7/m, z5.h, z3.h
	add	x5, x5, 192
	str	z11, [x5]
	add	x9, x9, 192
	addvl	x5, sp, #7
	mad	z15.h, p7/m, z5.h, z3.h
	mla	z15.h, p7/m, z7.h, z16.h
	add	x5, x5, 192
	ldr	z27, [x5]
	mla	z13.h, p7/m, z27.h, z16.h
	addvl	x5, sp, #18
	mla	z13.h, p7/m, z21.h, z25.h
	mla	z13.h, p7/m, z28.h, z6.h
	add	x5, x5, 192
	ldr	z12, [x5]
	movprfx	z11, z3
	mla	z11.h, p7/m, z12.h, z2.h
	addvl	x5, sp, #14
	mla	z11.h, p7/m, z17.h, z4.h
	mla	z11.h, p7/m, z24.h, z1.h
	add	x5, x5, 192
	ldr	z9, [x5]
	mla	z11.h, p7/m, z9.h, z0.h
	add	z13.h, z13.h, z11.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x2, x3]
	ldr	z13, [x9]
	addvl	x9, sp, #8
	add	x9, x9, 192
	ldr	z11, [x9]
	mad	z13.h, p7/m, z2.h, z3.h
	add	x9, sp, 192
	ldr	z27, [x9]
	mla	z13.h, p7/m, z19.h, z4.h
	addvl	x9, sp, #9
	mla	z13.h, p7/m, z26.h, z1.h
	mla	z13.h, p7/m, z11.h, z0.h
	add	x9, x9, 192
	mla	z15.h, p7/m, z23.h, z25.h
	mla	z15.h, p7/m, z30.h, z6.h
	add	z15.h, z15.h, z13.h
	ldr	z13, [x9]
	addvl	x9, sp, #12
	add	x9, x9, 192
	ldr	z12, [x9]
	add	x5, x2, x3
	addvl	x9, sp, #4
	mad	z14.h, p7/m, z5.h, z3.h
	mad	z13.h, p7/m, z2.h, z3.h
	add	x9, x9, 192
	ldr	z11, [x9]
	mla	z14.h, p7/m, z27.h, z16.h
	addvl	x9, sp, #2
	mla	z14.h, p7/m, z22.h, z25.h
	mla	z13.h, p7/m, z18.h, z4.h
	mla	z14.h, p7/m, z29.h, z6.h
	mla	z13.h, p7/m, z12.h, z1.h
	add	x9, x9, 192
	mla	z13.h, p7/m, z11.h, z0.h
	add	z14.h, z14.h, z13.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	stp	q15, q14, [x5, 16]
	ldr	z14, [x9]
	addvl	x9, sp, #3
	add	x9, x9, 192
	movprfx	z15, z3
	mla	z15.h, p7/m, z14.h, z5.h
	ldr	z14, [x9]
	addvl	x9, sp, #15
	mla	z15.h, p7/m, z14.h, z16.h
	lsl	x13, x6, 1
	add	x9, x9, 192
	ldr	z14, [x9]
	mla	z15.h, p7/m, z14.h, z25.h
	addvl	x9, sp, #1
	movprfx	z14, z15
	mla	z14.h, p7/m, z31.h, z6.h
	add	x8, x1, x0
	add	x9, x9, 192
	ldr	z15, [x9]
	mad	z15.h, p7/m, z2.h, z3.h
	addvl	x9, sp, #5
	mla	z15.h, p7/m, z20.h, z4.h
	add	x0, x0, x1, lsl 1
	add	x9, x9, 192
	ldr	z13, [x9]
	mla	z15.h, p7/m, z13.h, z1.h
	addvl	x9, sp, #6
	add	x10, x5, x3
	add	x9, x9, 192
	ldr	z12, [x9]
	mla	z15.h, p7/m, z12.h, z0.h
	add	z15.h, z14.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x5, 48]
	ld1b	z14.h, p7/z, [x1, x8]
	add	x8, x13, 16
	ld1b	z15.h, p7/z, [x4, x8]
	addvl	x8, sp, #10
	sub	z15.h, z15.h, #128
	add	x8, x8, 192
	str	z15, [x8]
	addvl	x9, sp, #9
	add	x8, x13, 32
	ld1b	z13.h, p7/z, [x4, x8]
	sub	z13.h, z13.h, #128
	addvl	x8, sp, #2
	add	x9, x9, 192
	sub	z14.h, z14.h, #128
	add	x8, x8, 192
	str	z13, [x8]
	add	x18, x3, x3, lsl 1
	add	x8, x13, 48
	ld1b	z13.h, p7/z, [x4, x8]
	sub	z13.h, z13.h, #128
	addvl	x8, sp, #16
	add	x13, x13, x1
	add	x8, x8, 192
	str	z13, [x8]
	lsl	x17, x3, 3
	addvl	x8, sp, #18
	sub	x21, x17, x3
	add	x8, x8, 192
	ldr	z15, [x8]
	movprfx	z13, z3
	mla	z13.h, p7/m, z15.h, z5.h
	addvl	x8, sp, #14
	mla	z13.h, p7/m, z17.h, z16.h
	mla	z13.h, p7/m, z24.h, z25.h
	add	x8, x8, 192
	str	z9, [x8]
	movprfx	z11, z13
	mla	z11.h, p7/m, z9.h, z6.h
	addvl	x8, sp, #7
	lsl	x15, x7, 1
	add	x8, x8, 192
	ldr	z15, [x8]
	movprfx	z13, z3
	mla	z13.h, p7/m, z15.h, z2.h
	addvl	x8, sp, #13
	mla	z13.h, p7/m, z21.h, z4.h
	mla	z13.h, p7/m, z28.h, z1.h
	add	x8, x8, 192
	ldr	z9, [x8]
	mla	z13.h, p7/m, z9.h, z0.h
	addvl	x8, sp, #17
	add	z13.h, z11.h, z13.h
	sqrshrunb	z13.b, z13.h, #6
	add	x8, x8, 192
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x5, x3]
	ldr	z15, [x8]
	addvl	x8, sp, #8
	movprfx	z13, z3
	mla	z13.h, p7/m, z15.h, z5.h
	ldr	z15, [x9]
	addvl	x9, sp, #12
	mla	z13.h, p7/m, z19.h, z16.h
	add	x8, x8, 192
	ldr	z11, [x8]
	mla	z13.h, p7/m, z26.h, z25.h
	add	x9, x9, 192
	mad	z11.h, p7/m, z6.h, z13.h
	movprfx	z13, z3
	mla	z13.h, p7/m, z7.h, z2.h
	mla	z13.h, p7/m, z23.h, z4.h
	mla	z13.h, p7/m, z30.h, z1.h
	mla	z13.h, p7/m, z10.h, z0.h
	add	z13.h, z11.h, z13.h
	movprfx	z11, z3
	mla	z11.h, p7/m, z15.h, z5.h
	ldr	z15, [x9]
	addvl	x9, sp, #4
	add	x8, x2, x3, lsl 1
	mla	z11.h, p7/m, z18.h, z16.h
	add	x9, x9, 192
	ldr	z9, [x9]
	mla	z11.h, p7/m, z15.h, z25.h
	add	x9, sp, 192
	str	z27, [x9]
	mad	z9.h, p7/m, z6.h, z11.h
	addvl	x9, sp, #1
	movprfx	z11, z3
	mla	z11.h, p7/m, z27.h, z2.h
	sqrshrunb	z13.b, z13.h, #6
	add	x9, x9, 192
	mla	z11.h, p7/m, z22.h, z4.h
	uzp1	z13.b, z13.b, z13.b
	mla	z11.h, p7/m, z29.h, z1.h
	mla	z11.h, p7/m, z8.h, z0.h
	add	z11.h, z9.h, z11.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	stp	q13, q11, [x8, 16]
	ldr	z15, [x9]
	addvl	x9, sp, #5
	movprfx	z13, z3
	mla	z13.h, p7/m, z15.h, z5.h
	add	x9, x9, 192
	ldr	z27, [x9]
	mla	z13.h, p7/m, z20.h, z16.h
	addvl	x9, sp, #6
	mla	z13.h, p7/m, z27.h, z25.h
	movprfx	z11, z13
	mla	z11.h, p7/m, z12.h, z6.h
	add	x9, x9, 192
	str	z12, [x9]
	mad	z7.h, p7/m, z5.h, z3.h
	addvl	x9, sp, #3
	mla	z7.h, p7/m, z23.h, z16.h
	mla	z7.h, p7/m, z30.h, z25.h
	add	x9, x9, 192
	ldr	z13, [x9]
	mad	z13.h, p7/m, z2.h, z3.h
	addvl	x9, sp, #15
	mla	z7.h, p7/m, z10.h, z6.h
	add	x5, x5, x3, lsl 1
	add	x9, x9, 192
	ldr	z15, [x9]
	mla	z13.h, p7/m, z15.h, z4.h
	addvl	x9, sp, #11
	mla	z13.h, p7/m, z31.h, z1.h
	add	x12, x3, x5
	add	x9, x9, 192
	ldr	z9, [x9]
	mla	z13.h, p7/m, z9.h, z0.h
	add	z13.h, z11.h, z13.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x8, 48]
	add	x8, x13, 16
	ld1b	z13.h, p7/z, [x4, x8]
	addvl	x8, sp, #9
	ld1b	z11.h, p7/z, [x1, x0]
	sub	z13.h, z13.h, #128
	add	x8, x8, 192
	str	z13, [x8]
	add	x9, x1, x0
	add	x8, x13, 32
	ld1b	z9.h, p7/z, [x4, x8]
	sub	z9.h, z9.h, #128
	addvl	x8, sp, #1
	sub	z11.h, z11.h, #128
	add	x0, x0, x1, lsl 1
	add	x8, x8, 192
	str	z9, [x8]
	add	x11, x1, x0
	add	x8, x13, 48
	ld1b	z9.h, p7/z, [x4, x8]
	movprfx	z15, z9
	sub	z15.h, z15.h, #128
	addvl	x8, sp, #7
	lsl	x30, x3, 4
	add	x8, x8, 192
	ldr	z27, [x8]
	movprfx	z9, z3
	mla	z9.h, p7/m, z27.h, z5.h
	addvl	x8, sp, #13
	mla	z9.h, p7/m, z21.h, z16.h
	movprfx	z27, z9
	mla	z27.h, p7/m, z28.h, z25.h
	add	x8, x8, 192
	ldr	z9, [x8]
	mla	z27.h, p7/m, z9.h, z6.h
	addvl	x8, sp, #14
	movprfx	z9, z3
	mla	z9.h, p7/m, z17.h, z2.h
	mla	z9.h, p7/m, z24.h, z4.h
	add	x8, x8, 192
	ldr	z13, [x8]
	mla	z9.h, p7/m, z13.h, z1.h
	addvl	x8, sp, #8
	mla	z9.h, p7/m, z14.h, z0.h
	add	z9.h, z27.h, z9.h
	add	x8, x8, 192
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x3, x10]
	add	x10, sp, 192
	ldr	z13, [x8]
	ldr	z27, [x10]
	addvl	x8, sp, #10
	movprfx	z9, z3
	mla	z9.h, p7/m, z19.h, z2.h
	addvl	x10, sp, #12
	add	x8, x8, 192
	ldr	z12, [x8]
	add	x10, x10, 192
	mla	z9.h, p7/m, z26.h, z4.h
	mla	z9.h, p7/m, z13.h, z1.h
	mla	z9.h, p7/m, z12.h, z0.h
	ldr	z12, [x10]
	addvl	x10, sp, #4
	add	x10, x10, 192
	add	z9.h, z7.h, z9.h
	movprfx	z7, z3
	mla	z7.h, p7/m, z27.h, z5.h
	mla	z7.h, p7/m, z22.h, z16.h
	movprfx	z27, z7
	mla	z27.h, p7/m, z29.h, z25.h
	add	x8, x2, x18
	movprfx	z7, z3
	mla	z7.h, p7/m, z18.h, z2.h
	mla	z7.h, p7/m, z12.h, z4.h
	ldr	z12, [x10]
	addvl	x10, sp, #2
	mla	z7.h, p7/m, z12.h, z1.h
	mla	z27.h, p7/m, z8.h, z6.h
	add	x10, x10, 192
	ldr	z12, [x10]
	sqrshrunb	z9.b, z9.h, #6
	addvl	x10, sp, #3
	mla	z7.h, p7/m, z12.h, z0.h
	uzp1	z9.b, z9.b, z9.b
	add	x10, x10, 192
	add	z7.h, z27.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	stp	q9, q7, [x8, 16]
	ldr	z27, [x10]
	addvl	x10, sp, #15
	movprfx	z9, z3
	mla	z9.h, p7/m, z27.h, z5.h
	mad	z17.h, p7/m, z5.h, z3.h
	add	x10, x10, 192
	ldr	z7, [x10]
	mla	z9.h, p7/m, z7.h, z16.h
	addvl	x10, sp, #11
	mla	z9.h, p7/m, z31.h, z25.h
	mla	z17.h, p7/m, z24.h, z16.h
	add	x10, x10, 192
	ldr	z7, [x10]
	mad	z7.h, p7/m, z6.h, z9.h
	addvl	x10, sp, #5
	movprfx	z9, z3
	mla	z9.h, p7/m, z20.h, z2.h
	mad	z19.h, p7/m, z5.h, z3.h
	add	x10, x10, 192
	ldr	z27, [x10]
	mla	z9.h, p7/m, z27.h, z4.h
	addvl	x10, sp, #6
	mla	z19.h, p7/m, z26.h, z16.h
	mla	z19.h, p7/m, z13.h, z25.h
	add	x10, x10, 192
	ldr	z12, [x10]
	mla	z9.h, p7/m, z12.h, z1.h
	addvl	x10, sp, #16
	mad	z18.h, p7/m, z5.h, z3.h
	mad	z20.h, p7/m, z5.h, z3.h
	add	x10, x10, 192
	ldr	z12, [x10]
	mla	z9.h, p7/m, z12.h, z0.h
	add	z9.h, z7.h, z9.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x8, 48]
	lsl	x8, x16, 2
	ld1b	z9.h, p7/z, [x1, x9]
	add	x9, x8, 16
	ld1b	z7.h, p7/z, [x4, x9]
	sub	z7.h, z7.h, #128
	addvl	x9, sp, #8
	addvl	x10, sp, #12
	sub	z9.h, z9.h, #128
	add	x9, x9, 192
	str	z7, [x9]
	add	x10, x10, 192
	add	x9, x8, 32
	ld1b	z7.h, p7/z, [x4, x9]
	sub	z7.h, z7.h, #128
	add	x9, sp, 192
	str	z7, [x9]
	sub	x27, x30, x3
	add	x9, x8, 48
	ld1b	z7.h, p7/z, [x4, x9]
	sub	z7.h, z7.h, #128
	addvl	x9, sp, #3
	add	x8, x8, x1
	add	x9, x9, 192
	str	z7, [x9]
	lsl	x7, x7, 2
	addvl	x9, sp, #14
	add	x9, x9, 192
	ldr	z7, [x9]
	mla	z17.h, p7/m, z7.h, z25.h
	addvl	x9, sp, #13
	mla	z17.h, p7/m, z14.h, z6.h
	movprfx	z7, z3
	mla	z7.h, p7/m, z21.h, z2.h
	add	x9, x9, 192
	ldr	z27, [x9]
	mla	z7.h, p7/m, z28.h, z4.h
	addvl	x9, sp, #10
	mla	z7.h, p7/m, z27.h, z1.h
	mla	z7.h, p7/m, z11.h, z0.h
	add	x9, x9, 192
	add	z17.h, z17.h, z7.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x5]
	mad	z21.h, p7/m, z5.h, z3.h
	ldr	z17, [x9]
	addvl	x9, sp, #9
	mla	z19.h, p7/m, z17.h, z6.h
	add	x9, x9, 192
	ldr	z27, [x9]
	movprfx	z17, z3
	mla	z17.h, p7/m, z23.h, z2.h
	mla	z17.h, p7/m, z30.h, z4.h
	mla	z17.h, p7/m, z10.h, z1.h
	mla	z17.h, p7/m, z27.h, z0.h
	add	z19.h, z19.h, z17.h
	ldr	z17, [x10]
	addvl	x10, sp, #4
	add	x10, x10, 192
	ldr	z12, [x10]
	add	x9, x2, x3, lsl 2
	addvl	x10, sp, #2
	mla	z18.h, p7/m, z17.h, z16.h
	mla	z18.h, p7/m, z12.h, z25.h
	add	x10, x10, 192
	ldr	z27, [x10]
	sqrshrunb	z19.b, z19.h, #6
	addvl	x10, sp, #1
	uzp1	z19.b, z19.b, z19.b
	mla	z18.h, p7/m, z27.h, z6.h
	add	x10, x10, 192
	ldr	z12, [x10]
	movprfx	z17, z3
	mla	z17.h, p7/m, z22.h, z2.h
	addvl	x10, sp, #5
	mla	z17.h, p7/m, z29.h, z4.h
	mla	z17.h, p7/m, z8.h, z1.h
	add	x10, x10, 192
	mla	z17.h, p7/m, z12.h, z0.h
	add	z18.h, z18.h, z17.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q19, q18, [x9, 16]
	ldr	z19, [x10]
	addvl	x10, sp, #6
	mla	z20.h, p7/m, z19.h, z16.h
	add	x10, x10, 192
	ldr	z19, [x10]
	mla	z20.h, p7/m, z19.h, z25.h
	addvl	x10, sp, #16
	mla	z21.h, p7/m, z28.h, z16.h
	mad	z23.h, p7/m, z5.h, z3.h
	add	x10, x10, 192
	ldr	z19, [x10]
	mla	z20.h, p7/m, z19.h, z6.h
	addvl	x10, sp, #15
	mla	z23.h, p7/m, z30.h, z16.h
	mla	z23.h, p7/m, z10.h, z25.h
	add	x10, x10, 192
	ldr	z19, [x10]
	mad	z19.h, p7/m, z2.h, z3.h
	addvl	x10, sp, #11
	mla	z19.h, p7/m, z31.h, z4.h
	mad	z22.h, p7/m, z5.h, z3.h
	add	x10, x10, 192
	ldr	z17, [x10]
	mla	z19.h, p7/m, z17.h, z1.h
	mla	z19.h, p7/m, z15.h, z0.h
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x9, 48]
	add	x9, x8, 16
	ld1b	z20.h, p7/z, [x4, x9]
	add	x9, x8, 32
	ld1b	z19.h, p7/z, [x1, x0]
	ld1b	z18.h, p7/z, [x4, x9]
	add	x9, x8, 48
	movprfx	z17, z18
	sub	z17.h, z17.h, #128
	ld1b	z18.h, p7/z, [x4, x9]
	addvl	x9, sp, #7
	sub	z18.h, z18.h, #128
	add	x9, x9, 192
	str	z18, [x9]
	movprfx	z18, z3
	mla	z18.h, p7/m, z24.h, z2.h
	addvl	x9, sp, #13
	mla	z22.h, p7/m, z29.h, z16.h
	mla	z22.h, p7/m, z8.h, z25.h
	add	x9, x9, 192
	ldr	z7, [x9]
	mla	z21.h, p7/m, z7.h, z25.h
	addvl	x9, sp, #14
	mla	z21.h, p7/m, z11.h, z6.h
	mla	z22.h, p7/m, z12.h, z6.h
	add	x9, x9, 192
	ldr	z7, [x9]
	mla	z18.h, p7/m, z7.h, z4.h
	addvl	x9, sp, #9
	mla	z18.h, p7/m, z14.h, z1.h
	mla	z18.h, p7/m, z9.h, z0.h
	add	x9, x9, 192
	add	z21.h, z21.h, z18.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x12]
	ldr	z18, [x9]
	addvl	x12, sp, #1
	mla	z23.h, p7/m, z18.h, z6.h
	movprfx	z21, z3
	mla	z21.h, p7/m, z26.h, z2.h
	addvl	x9, sp, #10
	add	x12, x12, 192
	str	z12, [x12]
	add	x9, x9, 192
	ldr	z18, [x9]
	addvl	x12, sp, #12
	addvl	x9, sp, #8
	mla	z21.h, p7/m, z13.h, z4.h
	add	x12, x12, 192
	mla	z21.h, p7/m, z18.h, z1.h
	add	x9, x9, 192
	ldr	z18, [x9]
	mla	z21.h, p7/m, z18.h, z0.h
	add	z23.h, z23.h, z21.h
	add	x10, x3, x3, lsl 2
	ldr	z21, [x12]
	addvl	x12, sp, #4
	add	x9, x2, x10
	add	x12, x12, 192
	ldr	z12, [x12]
	mad	z21.h, p7/m, z2.h, z3.h
	addvl	x12, sp, #2
	mla	z21.h, p7/m, z12.h, z4.h
	mla	z21.h, p7/m, z27.h, z1.h
	add	x12, x12, 192
	str	z27, [x12]
	sqrshrunb	z23.b, z23.h, #6
	add	x12, sp, 192
	ldr	z27, [x12]
	uzp1	z23.b, z23.b, z23.b
	addvl	x12, sp, #15
	mla	z21.h, p7/m, z27.h, z0.h
	add	z22.h, z22.h, z21.h
	add	x12, x12, 192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	stp	q23, q22, [x9, 16]
	ldr	z23, [x12]
	addvl	x12, sp, #11
	add	x12, x12, 192
	ldr	z22, [x12]
	mad	z23.h, p7/m, z5.h, z3.h
	addvl	x12, sp, #14
	mla	z23.h, p7/m, z31.h, z16.h
	mla	z23.h, p7/m, z22.h, z25.h
	add	x12, x12, 192
	str	z15, [x12]
	mla	z23.h, p7/m, z15.h, z6.h
	addvl	x12, sp, #5
	add	x5, x5, x3, lsl 1
	sub	z19.h, z19.h, #128
	add	x12, x12, 192
	ldr	z22, [x12]
	mad	z22.h, p7/m, z2.h, z3.h
	addvl	x12, sp, #6
	mad	z24.h, p7/m, z5.h, z3.h
	mla	z24.h, p7/m, z7.h, z16.h
	add	x12, x12, 192
	ldr	z12, [x12]
	mla	z22.h, p7/m, z12.h, z4.h
	addvl	x12, sp, #16
	mla	z24.h, p7/m, z14.h, z25.h
	mla	z24.h, p7/m, z9.h, z6.h
	add	x12, x12, 192
	ldr	z21, [x12]
	mla	z22.h, p7/m, z21.h, z1.h
	addvl	x12, sp, #3
	mad	z26.h, p7/m, z5.h, z3.h
	mla	z26.h, p7/m, z13.h, z16.h
	add	x12, x12, 192
	ldr	z21, [x12]
	mla	z22.h, p7/m, z21.h, z0.h
	add	z23.h, z23.h, z22.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x9, 48]
	lsl	x9, x22, 1
	ld1b	z21.h, p7/z, [x1, x11]
	add	x11, x9, 16
	ld1b	z23.h, p7/z, [x4, x11]
	sub	z23.h, z23.h, #128
	addvl	x11, sp, #6
	addvl	x12, sp, #12
	sub	z20.h, z20.h, #128
	add	x11, x11, 192
	str	z23, [x11]
	add	x12, x12, 192
	add	x11, x9, 32
	add	x9, x9, 48
	ld1b	z18.h, p7/z, [x4, x9]
	addvl	x9, sp, #15
	ld1b	z22.h, p7/z, [x4, x11]
	movprfx	z15, z18
	sub	z15.h, z15.h, #128
	add	x9, x9, 192
	str	z15, [x9]
	movprfx	z18, z3
	mla	z18.h, p7/m, z28.h, z2.h
	addvl	x9, sp, #13
	add	x0, x0, x1, lsl 1
	sub	z21.h, z21.h, #128
	add	x9, x9, 192
	ldr	z15, [x9]
	mla	z18.h, p7/m, z15.h, z4.h
	addvl	x9, sp, #10
	mla	z18.h, p7/m, z11.h, z1.h
	mla	z18.h, p7/m, z19.h, z0.h
	add	x9, x9, 192
	add	z24.h, z24.h, z18.h
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x3, x5]
	ldr	z15, [x9]
	addvl	x9, sp, #8
	mla	z26.h, p7/m, z15.h, z25.h
	mad	z28.h, p7/m, z5.h, z3.h
	add	x9, x9, 192
	ldr	z24, [x9]
	ldr	z23, [x12]
	addvl	x9, sp, #9
	addvl	x12, sp, #4
	mla	z26.h, p7/m, z24.h, z6.h
	add	x9, x9, 192
	ldr	z18, [x9]
	add	x12, x12, 192
	movprfx	z24, z3
	mla	z24.h, p7/m, z30.h, z2.h
	mla	z24.h, p7/m, z10.h, z4.h
	mla	z24.h, p7/m, z18.h, z1.h
	ldr	z18, [x12]
	addvl	x12, sp, #2
	mla	z24.h, p7/m, z20.h, z0.h
	add	x12, x12, 192
	add	z26.h, z26.h, z24.h
	movprfx	z24, z3
	mla	z24.h, p7/m, z23.h, z5.h
	mla	z24.h, p7/m, z18.h, z16.h
	ldr	z18, [x12]
	add	x12, sp, 192
	str	z27, [x12]
	addvl	x12, sp, #1
	add	x9, x2, x18, lsl 1
	add	x12, x12, 192
	ldr	z15, [x12]
	mla	z24.h, p7/m, z18.h, z25.h
	addvl	x12, sp, #5
	movprfx	z18, z24
	mla	z18.h, p7/m, z27.h, z6.h
	sqrshrunb	z26.b, z26.h, #6
	add	x12, x12, 192
	movprfx	z24, z3
	mla	z24.h, p7/m, z29.h, z2.h
	uzp1	z26.b, z26.b, z26.b
	mla	z24.h, p7/m, z8.h, z4.h
	mla	z24.h, p7/m, z15.h, z1.h
	mla	z24.h, p7/m, z17.h, z0.h
	add	z24.h, z18.h, z24.h
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	stp	q26, q24, [x9, 16]
	ldr	z27, [x12]
	addvl	x12, sp, #16
	add	x12, x12, 192
	ldr	z26, [x12]
	mad	z27.h, p7/m, z5.h, z3.h
	addvl	x12, sp, #3
	mla	z27.h, p7/m, z12.h, z16.h
	mla	z27.h, p7/m, z26.h, z25.h
	add	x12, x12, 192
	ldr	z26, [x12]
	mla	z27.h, p7/m, z26.h, z6.h
	addvl	x12, sp, #11
	movprfx	z26, z3
	mla	z26.h, p7/m, z31.h, z2.h
	add	x11, x3, x5
	add	x12, x12, 192
	ldr	z24, [x12]
	mla	z26.h, p7/m, z24.h, z4.h
	addvl	x12, sp, #14
	mad	z30.h, p7/m, z5.h, z3.h
	mla	z30.h, p7/m, z10.h, z16.h
	add	x12, x12, 192
	ldr	z15, [x12]
	mla	z26.h, p7/m, z15.h, z1.h
	addvl	x12, sp, #7
	mad	z29.h, p7/m, z5.h, z3.h
	mla	z29.h, p7/m, z8.h, z16.h
	add	x12, x12, 192
	ldr	z24, [x12]
	mla	z26.h, p7/m, z24.h, z0.h
	add	z27.h, z27.h, z26.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x9, 48]
	lsl	x9, x1, 4
	ld1b	z27.h, p7/z, [x1, x0]
	sub	x19, x9, x1
	movprfx	z23, z27
	sub	z23.h, z23.h, #128
	sub	z22.h, z22.h, #128
	add	x14, x19, 16
	ld1b	z27.h, p7/z, [x4, x14]
	mad	z31.h, p7/m, z5.h, z3.h
	add	x14, x19, 32
	ld1b	z26.h, p7/z, [x4, x14]
	add	x12, x1, x0
	add	x14, x19, 48
	ld1b	z24.h, p7/z, [x4, x14]
	sub	z24.h, z24.h, #128
	addvl	x14, sp, #5
	add	x5, x5, x3, lsl 1
	sub	z27.h, z27.h, #128
	add	x14, x14, 192
	str	z24, [x14]
	sub	z26.h, z26.h, #128
	addvl	x14, sp, #13
	add	x0, x0, x1, lsl 1
	add	x14, x14, 192
	ldr	z24, [x14]
	mla	z28.h, p7/m, z24.h, z16.h
	movprfx	z24, z3
	mla	z24.h, p7/m, z7.h, z2.h
	mla	z28.h, p7/m, z11.h, z25.h
	mla	z24.h, p7/m, z14.h, z4.h
	mla	z28.h, p7/m, z19.h, z6.h
	mla	z24.h, p7/m, z9.h, z1.h
	mla	z24.h, p7/m, z21.h, z0.h
	add	z28.h, z28.h, z24.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x11]
	addvl	x11, sp, #9
	add	x11, x11, 192
	ldr	z28, [x11]
	mla	z30.h, p7/m, z28.h, z25.h
	addvl	x11, sp, #10
	addvl	x14, sp, #1
	movprfx	z28, z3
	mla	z28.h, p7/m, z13.h, z2.h
	add	x11, x11, 192
	ldr	z15, [x11]
	add	x14, x14, 192
	mla	z28.h, p7/m, z15.h, z4.h
	ldr	z15, [x14]
	addvl	x11, sp, #8
	addvl	x14, sp, #4
	add	x11, x11, 192
	ldr	z24, [x11]
	add	x14, x14, 192
	ldr	z18, [x14]
	addvl	x11, sp, #6
	addvl	x14, sp, #2
	mla	z28.h, p7/m, z24.h, z1.h
	add	x11, x11, 192
	ldr	z24, [x11]
	add	x14, x14, 192
	add	x11, x2, x21
	mla	z28.h, p7/m, z24.h, z0.h
	ldr	z24, [x14]
	add	x14, sp, 192
	mla	z29.h, p7/m, z15.h, z25.h
	ldr	z15, [x14]
	addvl	x14, sp, #11
	add	x14, x14, 192
	mla	z30.h, p7/m, z20.h, z6.h
	mla	z29.h, p7/m, z17.h, z6.h
	add	z30.h, z30.h, z28.h
	movprfx	z28, z3
	mla	z28.h, p7/m, z18.h, z2.h
	sqrshrunb	z30.b, z30.h, #6
	mla	z28.h, p7/m, z24.h, z4.h
	uzp1	z30.b, z30.b, z30.b
	mla	z28.h, p7/m, z15.h, z1.h
	mla	z28.h, p7/m, z22.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x11, 16]
	ldr	z24, [x14]
	addvl	x14, sp, #14
	mla	z31.h, p7/m, z24.h, z16.h
	add	x14, x14, 192
	ldr	z30, [x14]
	mla	z31.h, p7/m, z30.h, z25.h
	addvl	x14, sp, #7
	movprfx	z30, z3
	mla	z30.h, p7/m, z12.h, z2.h
	add	x24, x3, x10, lsl 1
	add	x14, x14, 192
	ldr	z29, [x14]
	mla	z31.h, p7/m, z29.h, z6.h
	addvl	x14, sp, #16
	lsl	x22, x22, 2
	add	x14, x14, 192
	ldr	z29, [x14]
	mla	z30.h, p7/m, z29.h, z4.h
	addvl	x14, sp, #3
	lsl	x19, x19, 1
	add	x14, x14, 192
	ldr	z28, [x14]
	mla	z30.h, p7/m, z28.h, z1.h
	addvl	x14, sp, #15
	add	x14, x14, 192
	ldr	z28, [x14]
	mla	z30.h, p7/m, z28.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x11, 48]
	add	x11, x9, 16
	ld1b	z31.h, p7/z, [x4, x11]
	addvl	x11, sp, #12
	ld1b	z29.h, p7/z, [x1, x12]
	sub	z31.h, z31.h, #128
	add	x11, x11, 192
	str	z31, [x11]
	addvl	x12, sp, #2
	add	x11, x9, 32
	ld1b	z30.h, p7/z, [x4, x11]
	add	x12, x12, 192
	add	x11, x9, 48
	ld1b	z28.h, p7/z, [x4, x11]
	sub	z28.h, z28.h, #128
	addvl	x11, sp, #4
	add	x9, x9, x1
	sub	z29.h, z29.h, #128
	add	x11, x11, 192
	str	z28, [x11]
	movprfx	z28, z3
	mla	z28.h, p7/m, z7.h, z5.h
	addvl	x11, sp, #13
	mla	z28.h, p7/m, z14.h, z16.h
	mla	z28.h, p7/m, z9.h, z25.h
	add	x11, x11, 192
	ldr	z24, [x11]
	mla	z28.h, p7/m, z21.h, z6.h
	addvl	x11, sp, #10
	mad	z24.h, p7/m, z2.h, z3.h
	mla	z24.h, p7/m, z11.h, z4.h
	add	x11, x11, 192
	mla	z24.h, p7/m, z19.h, z1.h
	mla	z24.h, p7/m, z23.h, z0.h
	add	z28.h, z28.h, z24.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x5]
	ldr	z7, [x11]
	addvl	x11, sp, #8
	add	x11, x11, 192
	movprfx	z28, z3
	mla	z28.h, p7/m, z13.h, z5.h
	mla	z28.h, p7/m, z7.h, z16.h
	ldr	z7, [x11]
	addvl	x11, sp, #6
	mla	z28.h, p7/m, z7.h, z25.h
	add	x11, x11, 192
	ldr	z7, [x12]
	ldr	z24, [x11]
	add	x12, sp, 192
	addvl	x11, sp, #9
	str	z15, [x12]
	add	x11, x11, 192
	addvl	x12, sp, #1
	ldr	z13, [x11]
	mla	z28.h, p7/m, z24.h, z6.h
	add	x11, x2, x17
	movprfx	z24, z3
	mla	z24.h, p7/m, z10.h, z2.h
	add	x12, x12, 192
	mla	z24.h, p7/m, z13.h, z4.h
	mla	z24.h, p7/m, z20.h, z1.h
	mla	z24.h, p7/m, z27.h, z0.h
	add	z28.h, z28.h, z24.h
	sqrshrunb	z28.b, z28.h, #6
	movprfx	z24, z3
	mla	z24.h, p7/m, z18.h, z5.h
	mla	z24.h, p7/m, z7.h, z16.h
	mla	z24.h, p7/m, z15.h, z25.h
	ldr	z15, [x12]
	addvl	x12, sp, #16
	uzp1	z28.b, z28.b, z28.b
	add	x12, x12, 192
	mla	z24.h, p7/m, z22.h, z6.h
	movprfx	z18, z3
	mla	z18.h, p7/m, z8.h, z2.h
	mla	z18.h, p7/m, z15.h, z4.h
	mla	z18.h, p7/m, z17.h, z1.h
	mla	z18.h, p7/m, z26.h, z0.h
	add	z24.h, z24.h, z18.h
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	stp	q28, q24, [x11, 16]
	movprfx	z28, z3
	mla	z28.h, p7/m, z12.h, z5.h
	ldr	z12, [x12]
	addvl	x12, sp, #3
	mla	z28.h, p7/m, z12.h, z16.h
	mad	z10.h, p7/m, z5.h, z3.h
	add	x12, x12, 192
	ldr	z12, [x12]
	mla	z28.h, p7/m, z12.h, z25.h
	addvl	x12, sp, #15
	add	x14, x3, x5
	sub	z30.h, z30.h, #128
	add	x12, x12, 192
	ldr	z18, [x12]
	mla	z28.h, p7/m, z18.h, z6.h
	addvl	x12, sp, #11
	add	x17, x17, x3
	mad	z8.h, p7/m, z5.h, z3.h
	add	x12, x12, 192
	ldr	z13, [x12]
	movprfx	z24, z3
	mla	z24.h, p7/m, z13.h, z2.h
	addvl	x12, sp, #14
	mla	z8.h, p7/m, z15.h, z16.h
	mla	z8.h, p7/m, z17.h, z25.h
	add	x12, x12, 192
	ldr	z12, [x12]
	mla	z24.h, p7/m, z12.h, z4.h
	addvl	x12, sp, #7
	mla	z8.h, p7/m, z26.h, z6.h
	add	x5, x5, x3, lsl 1
	add	x12, x12, 192
	ldr	z18, [x12]
	mla	z24.h, p7/m, z18.h, z1.h
	addvl	x12, sp, #5
	add	x28, x3, x17, lsl 1
	add	x12, x12, 192
	ldr	z31, [x12]
	mla	z24.h, p7/m, z31.h, z0.h
	add	z28.h, z28.h, z24.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x11, 48]
	add	x11, x9, 16
	ld1b	z28.h, p7/z, [x4, x11]
	add	x11, x9, 32
	ld1b	z18.h, p7/z, [x1, x0]
	ld1b	z24.h, p7/z, [x4, x11]
	add	x11, x9, 48
	ld1b	z7.h, p7/z, [x4, x11]
	sub	z7.h, z7.h, #128
	addvl	x11, sp, #11
	add	x12, x1, x0
	sub	z18.h, z18.h, #128
	add	x11, x11, 192
	str	z7, [x11]
	movprfx	z7, z3
	mla	z7.h, p7/m, z14.h, z2.h
	addvl	x11, sp, #13
	mla	z7.h, p7/m, z9.h, z4.h
	mla	z7.h, p7/m, z21.h, z1.h
	add	x11, x11, 192
	ldr	z12, [x11]
	mla	z7.h, p7/m, z29.h, z0.h
	addvl	x11, sp, #9
	mad	z12.h, p7/m, z5.h, z3.h
	mla	z12.h, p7/m, z11.h, z16.h
	add	x11, x11, 192
	mla	z12.h, p7/m, z19.h, z25.h
	mla	z12.h, p7/m, z23.h, z6.h
	add	z12.h, z12.h, z7.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x14]
	ldr	z12, [x11]
	addvl	x11, sp, #10
	add	x11, x11, 192
	mla	z10.h, p7/m, z12.h, z16.h
	ldr	z12, [x11]
	addvl	x11, sp, #8
	addvl	x14, sp, #1
	mad	z12.h, p7/m, z2.h, z3.h
	add	x11, x11, 192
	ldr	z7, [x11]
	add	x14, x14, 192
	addvl	x11, sp, #6
	mla	z12.h, p7/m, z7.h, z4.h
	str	z15, [x14]
	add	x11, x11, 192
	ldr	z7, [x11]
	addvl	x14, sp, #2
	addvl	x11, sp, #12
	mla	z10.h, p7/m, z20.h, z25.h
	add	x14, x14, 192
	mla	z10.h, p7/m, z27.h, z6.h
	add	x11, x11, 192
	mla	z12.h, p7/m, z7.h, z1.h
	ldr	z7, [x11]
	add	x11, x2, x17
	mla	z12.h, p7/m, z7.h, z0.h
	add	z12.h, z10.h, z12.h
	ldr	z10, [x14]
	add	x14, sp, 192
	ldr	z7, [x14]
	addvl	x14, sp, #14
	mad	z10.h, p7/m, z2.h, z3.h
	add	x14, x14, 192
	mla	z10.h, p7/m, z7.h, z4.h
	mla	z10.h, p7/m, z22.h, z1.h
	mla	z10.h, p7/m, z30.h, z0.h
	add	z8.h, z8.h, z10.h
	sqrshrunb	z8.b, z8.h, #6
	uzp1	z8.b, z8.b, z8.b
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	stp	q12, q8, [x11, 16]
	ldr	z8, [x14]
	addvl	x14, sp, #7
	add	x14, x14, 192
	ldr	z10, [x14]
	movprfx	z12, z3
	mla	z12.h, p7/m, z13.h, z5.h
	addvl	x14, sp, #5
	mla	z12.h, p7/m, z8.h, z16.h
	mla	z12.h, p7/m, z10.h, z25.h
	add	x14, x14, 192
	str	z31, [x14]
	mla	z12.h, p7/m, z31.h, z6.h
	addvl	x14, sp, #16
	mad	z14.h, p7/m, z5.h, z3.h
	mla	z14.h, p7/m, z9.h, z16.h
	add	x14, x14, 192
	ldr	z13, [x14]
	movprfx	z10, z3
	mla	z10.h, p7/m, z13.h, z2.h
	addvl	x14, sp, #3
	mla	z14.h, p7/m, z21.h, z25.h
	mla	z14.h, p7/m, z29.h, z6.h
	add	x14, x14, 192
	ldr	z8, [x14]
	mla	z10.h, p7/m, z8.h, z4.h
	addvl	x14, sp, #15
	sub	z28.h, z28.h, #128
	sub	z24.h, z24.h, #128
	add	x14, x14, 192
	ldr	z15, [x14]
	mla	z10.h, p7/m, z15.h, z1.h
	addvl	x14, sp, #4
	add	x0, x0, x1, lsl 1
	add	x14, x14, 192
	ldr	z31, [x14]
	mla	z10.h, p7/m, z31.h, z0.h
	add	z12.h, z12.h, z10.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x11, 48]
	add	x11, x15, 16
	ld1b	z12.h, p7/z, [x4, x11]
	add	x11, x15, 32
	ld1b	z10.h, p7/z, [x4, x11]
	ld1b	z8.h, p7/z, [x1, x12]
	add	x11, x15, 48
	ld1b	z7.h, p7/z, [x4, x11]
	movprfx	z15, z7
	sub	z15.h, z15.h, #128
	addvl	x11, sp, #16
	movprfx	z7, z3
	mla	z7.h, p7/m, z11.h, z2.h
	mla	z7.h, p7/m, z19.h, z4.h
	add	x11, x11, 192
	str	z15, [x11]
	mla	z7.h, p7/m, z23.h, z1.h
	addvl	x11, sp, #10
	mla	z7.h, p7/m, z18.h, z0.h
	add	z14.h, z14.h, z7.h
	add	x11, x11, 192
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x3, x5]
	ldr	z15, [x11]
	addvl	x11, sp, #8
	add	x11, x11, 192
	ldr	z14, [x11]
	mad	z15.h, p7/m, z5.h, z3.h
	addvl	x11, sp, #6
	mla	z15.h, p7/m, z14.h, z16.h
	addvl	x14, sp, #2
	add	x11, x11, 192
	ldr	z14, [x11]
	mla	z15.h, p7/m, z14.h, z25.h
	addvl	x11, sp, #12
	add	x14, x14, 192
	sub	z8.h, z8.h, #128
	add	x11, x11, 192
	ldr	z14, [x11]
	mla	z15.h, p7/m, z14.h, z6.h
	addvl	x11, sp, #9
	add	x15, x15, x1
	mad	z11.h, p7/m, z5.h, z3.h
	add	x11, x11, 192
	ldr	z7, [x11]
	movprfx	z14, z3
	mla	z14.h, p7/m, z7.h, z2.h
	mla	z14.h, p7/m, z20.h, z4.h
	mla	z14.h, p7/m, z27.h, z1.h
	mla	z14.h, p7/m, z28.h, z0.h
	add	z15.h, z15.h, z14.h
	ldr	z14, [x14]
	add	x14, sp, 192
	ldr	z7, [x14]
	addvl	x14, sp, #1
	add	x11, x2, x10, lsl 1
	add	x14, x14, 192
	mad	z14.h, p7/m, z5.h, z3.h
	mla	z14.h, p7/m, z7.h, z16.h
	mla	z14.h, p7/m, z22.h, z25.h
	movprfx	z7, z14
	mla	z7.h, p7/m, z30.h, z6.h
	sqrshrunb	z15.b, z15.h, #6
	ldr	z14, [x14]
	addvl	x14, sp, #3
	uzp1	z15.b, z15.b, z15.b
	add	x14, x14, 192
	mad	z14.h, p7/m, z2.h, z3.h
	mla	z14.h, p7/m, z17.h, z4.h
	mla	z14.h, p7/m, z26.h, z1.h
	mla	z14.h, p7/m, z24.h, z0.h
	add	z14.h, z7.h, z14.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	stp	q15, q14, [x11, 16]
	movprfx	z15, z3
	mla	z15.h, p7/m, z13.h, z5.h
	ldr	z13, [x14]
	addvl	x14, sp, #15
	add	x14, x14, 192
	ldr	z14, [x14]
	mla	z15.h, p7/m, z13.h, z16.h
	addvl	x14, sp, #4
	mla	z15.h, p7/m, z14.h, z25.h
	mla	z15.h, p7/m, z31.h, z6.h
	add	x14, x14, 192
	str	z31, [x14]
	add	x12, x3, x5
	addvl	x14, sp, #14
	mla	z11.h, p7/m, z19.h, z16.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z9.h, z2.h
	add	x14, x14, 192
	ldr	z14, [x14]
	mad	z14.h, p7/m, z2.h, z3.h
	addvl	x14, sp, #7
	mla	z11.h, p7/m, z23.h, z25.h
	mla	z31.h, p7/m, z21.h, z4.h
	add	x14, x14, 192
	ldr	z13, [x14]
	mla	z14.h, p7/m, z13.h, z4.h
	addvl	x14, sp, #5
	mla	z11.h, p7/m, z18.h, z6.h
	mla	z31.h, p7/m, z29.h, z1.h
	add	x14, x14, 192
	ldr	z7, [x14]
	mla	z14.h, p7/m, z7.h, z1.h
	addvl	x14, sp, #11
	mla	z31.h, p7/m, z8.h, z0.h
	add	z11.h, z11.h, z31.h
	add	x14, x14, 192
	ldr	z13, [x14]
	mla	z14.h, p7/m, z13.h, z0.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x11, 48]
	add	x11, x15, 16
	ld1b	z15.h, p7/z, [x4, x11]
	add	x11, x15, 32
	ld1b	z14.h, p7/z, [x4, x11]
	ld1b	z7.h, p7/z, [x1, x0]
	add	x11, x15, 48
	ld1b	z13.h, p7/z, [x4, x11]
	sub	z13.h, z13.h, #128
	addvl	x11, sp, #17
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	add	x11, x11, 192
	str	z13, [x11]
	sub	z12.h, z12.h, #128
	addvl	x11, sp, #13
	sub	z10.h, z10.h, #128
	add	x14, x1, x0
	add	x11, x11, 192
	str	z23, [x11]
	add	x5, x5, x3, lsl 1
	addvl	x11, sp, #9
	str	q11, [x3, x12]
	sub	z7.h, z7.h, #128
	add	x11, x11, 192
	ldr	z13, [x11]
	mad	z13.h, p7/m, z5.h, z3.h
	addvl	x11, sp, #8
	addvl	x12, sp, #1
	mla	z13.h, p7/m, z20.h, z16.h
	add	x11, x11, 192
	ldr	z11, [x11]
	add	x12, x12, 192
	addvl	x11, sp, #6
	mad	z11.h, p7/m, z2.h, z3.h
	mla	z13.h, p7/m, z27.h, z25.h
	add	x11, x11, 192
	ldr	z23, [x11]
	mla	z11.h, p7/m, z23.h, z4.h
	addvl	x11, sp, #12
	mla	z13.h, p7/m, z28.h, z6.h
	mad	z9.h, p7/m, z5.h, z3.h
	add	x11, x11, 192
	ldr	z31, [x11]
	mla	z11.h, p7/m, z31.h, z1.h
	mla	z11.h, p7/m, z12.h, z0.h
	add	x11, x2, x24
	add	z13.h, z13.h, z11.h
	ldr	z11, [x12]
	add	x12, sp, 192
	mad	z11.h, p7/m, z5.h, z3.h
	mla	z11.h, p7/m, z17.h, z16.h
	movprfx	z31, z11
	mla	z31.h, p7/m, z26.h, z25.h
	mla	z31.h, p7/m, z24.h, z6.h
	ldr	z11, [x12]
	addvl	x12, sp, #14
	mad	z11.h, p7/m, z2.h, z3.h
	add	x12, x12, 192
	mla	z11.h, p7/m, z22.h, z4.h
	mla	z11.h, p7/m, z30.h, z1.h
	mla	z11.h, p7/m, z10.h, z0.h
	add	z11.h, z31.h, z11.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	stp	q13, q11, [x11, 16]
	ldr	z11, [x12]
	addvl	x12, sp, #7
	add	x12, x12, 192
	movprfx	z13, z3
	mla	z13.h, p7/m, z11.h, z5.h
	ldr	z11, [x12]
	addvl	x12, sp, #5
	mla	z13.h, p7/m, z11.h, z16.h
	mla	z9.h, p7/m, z21.h, z16.h
	add	x12, x12, 192
	ldr	z11, [x12]
	mla	z13.h, p7/m, z11.h, z25.h
	addvl	x12, sp, #11
	mla	z9.h, p7/m, z29.h, z25.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z19.h, z2.h
	add	x12, x12, 192
	ldr	z11, [x12]
	mad	z11.h, p7/m, z6.h, z13.h
	addvl	x12, sp, #3
	mla	z9.h, p7/m, z8.h, z6.h
	sub	z15.h, z15.h, #128
	add	x12, x12, 192
	ldr	z13, [x12]
	mad	z13.h, p7/m, z2.h, z3.h
	addvl	x12, sp, #15
	sub	z14.h, z14.h, #128
	add	x0, x0, x1, lsl 1
	add	x12, x12, 192
	ldr	z23, [x12]
	mla	z13.h, p7/m, z23.h, z4.h
	addvl	x12, sp, #4
	add	x23, x3, x5
	mad	z19.h, p7/m, z5.h, z3.h
	add	x12, x12, 192
	ldr	z23, [x12]
	mla	z13.h, p7/m, z23.h, z1.h
	addvl	x12, sp, #16
	add	x20, x1, x0
	add	x12, x12, 192
	ldr	z23, [x12]
	mla	z13.h, p7/m, z23.h, z0.h
	add	z13.h, z11.h, z13.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x11, 48]
	addvl	x11, sp, #14
	ld1b	z13.h, p7/z, [x1, x14]
	lsl	x12, x6, 2
	movprfx	z11, z13
	sub	z11.h, z11.h, #128
	add	x11, x11, 192
	str	z11, [x11]
	add	x14, sp, 192
	add	x11, x12, 16
	ld1b	z13.h, p7/z, [x4, x11]
	sub	z13.h, z13.h, #128
	addvl	x11, sp, #10
	lsl	x9, x9, 1
	add	x11, x11, 192
	str	z13, [x11]
	lsl	x15, x15, 1
	add	x11, x12, 32
	ld1b	z11.h, p7/z, [x4, x11]
	sub	z11.h, z11.h, #128
	add	x11, x12, 48
	ld1b	z13.h, p7/z, [x4, x11]
	sub	z13.h, z13.h, #128
	addvl	x11, sp, #2
	add	x11, x11, 192
	str	z13, [x11]
	addvl	x11, sp, #13
	add	x11, x11, 192
	ldr	z23, [x11]
	mla	z31.h, p7/m, z23.h, z4.h
	addvl	x11, sp, #8
	mla	z31.h, p7/m, z18.h, z1.h
	mla	z31.h, p7/m, z7.h, z0.h
	add	x11, x11, 192
	add	z9.h, z9.h, z31.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x3, x5]
	add	x5, x5, x3, lsl 1
	ldr	z9, [x11]
	addvl	x11, sp, #6
	mad	z9.h, p7/m, z5.h, z3.h
	add	x11, x11, 192
	ldr	z23, [x11]
	mla	z9.h, p7/m, z23.h, z16.h
	addvl	x11, sp, #12
	add	x25, x3, x5
	add	x11, x11, 192
	ldr	z31, [x11]
	mad	z31.h, p7/m, z25.h, z9.h
	add	x11, x2, x18, lsl 2
	mla	z31.h, p7/m, z12.h, z6.h
	movprfx	z9, z3
	mla	z9.h, p7/m, z20.h, z2.h
	mla	z9.h, p7/m, z27.h, z4.h
	mla	z9.h, p7/m, z28.h, z1.h
	mla	z9.h, p7/m, z15.h, z0.h
	add	z9.h, z31.h, z9.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z23.b, z9.b, z9.b
	ldr	z9, [x14]
	addvl	x14, sp, #3
	mad	z9.h, p7/m, z5.h, z3.h
	mla	z9.h, p7/m, z22.h, z16.h
	add	x14, x14, 192
	movprfx	z31, z9
	mla	z31.h, p7/m, z30.h, z25.h
	movprfx	z9, z3
	mla	z9.h, p7/m, z17.h, z2.h
	mla	z31.h, p7/m, z10.h, z6.h
	mla	z9.h, p7/m, z26.h, z4.h
	mla	z9.h, p7/m, z24.h, z1.h
	mla	z9.h, p7/m, z14.h, z0.h
	add	z9.h, z31.h, z9.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	stp	q23, q9, [x11, 16]
	ldr	z9, [x14]
	addvl	x14, sp, #15
	mad	z9.h, p7/m, z5.h, z3.h
	add	x14, x14, 192
	ldr	z23, [x14]
	mla	z9.h, p7/m, z23.h, z16.h
	addvl	x14, sp, #4
	mad	z20.h, p7/m, z5.h, z3.h
	mla	z20.h, p7/m, z27.h, z16.h
	add	x14, x14, 192
	ldr	z23, [x14]
	movprfx	z31, z9
	mla	z31.h, p7/m, z23.h, z25.h
	addvl	x14, sp, #16
	mla	z20.h, p7/m, z28.h, z25.h
	mla	z20.h, p7/m, z15.h, z6.h
	add	x14, x14, 192
	ldr	z9, [x14]
	mla	z31.h, p7/m, z9.h, z6.h
	addvl	x14, sp, #7
	mad	z17.h, p7/m, z5.h, z3.h
	mla	z17.h, p7/m, z26.h, z16.h
	add	x14, x14, 192
	ldr	z9, [x14]
	mad	z9.h, p7/m, z2.h, z3.h
	addvl	x14, sp, #5
	mla	z17.h, p7/m, z24.h, z25.h
	mla	z17.h, p7/m, z14.h, z6.h
	add	x14, x14, 192
	ldr	z13, [x14]
	mla	z9.h, p7/m, z13.h, z4.h
	addvl	x14, sp, #11
	add	x14, x14, 192
	ldr	z13, [x14]
	mla	z9.h, p7/m, z13.h, z1.h
	addvl	x14, sp, #17
	add	x14, x14, 192
	ldr	z13, [x14]
	mla	z9.h, p7/m, z13.h, z0.h
	add	z9.h, z31.h, z9.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x11, 48]
	addvl	x11, sp, #9
	ld1b	z9.h, p7/z, [x1, x0]
	add	x14, x12, x1
	sub	z9.h, z9.h, #128
	add	x11, x11, 192
	str	z9, [x11]
	add	x0, x0, x1, lsl 1
	add	x11, x14, 16
	ld1b	z9.h, p7/z, [x4, x11]
	movprfx	z31, z9
	sub	z31.h, z31.h, #128
	add	x11, x14, 32
	ld1b	z9.h, p7/z, [x4, x11]
	sub	z9.h, z9.h, #128
	addvl	x11, sp, #8
	add	x12, x6, x12
	add	x11, x11, 192
	str	z9, [x11]
	lsl	x6, x6, 3
	add	x11, x14, 48
	ld1b	z9.h, p7/z, [x4, x11]
	sub	z9.h, z9.h, #128
	addvl	x11, sp, #3
	lsl	x14, x14, 1
	add	x11, x11, 192
	str	z9, [x11]
	movprfx	z9, z3
	mla	z9.h, p7/m, z21.h, z2.h
	addvl	x11, sp, #13
	mla	z9.h, p7/m, z29.h, z4.h
	mla	z9.h, p7/m, z8.h, z1.h
	add	x11, x11, 192
	ldr	z23, [x11]
	mla	z19.h, p7/m, z23.h, z16.h
	addvl	x11, sp, #14
	mla	z19.h, p7/m, z18.h, z25.h
	mla	z19.h, p7/m, z7.h, z6.h
	add	x11, x11, 192
	ldr	z13, [x11]
	mla	z9.h, p7/m, z13.h, z0.h
	add	z19.h, z19.h, z9.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x23]
	addvl	x23, sp, #6
	mad	z21.h, p7/m, z5.h, z3.h
	add	x23, x23, 192
	ldr	z19, [x23]
	mad	z19.h, p7/m, z2.h, z3.h
	addvl	x23, sp, #12
	add	x11, x3, x18, lsl 2
	mla	z21.h, p7/m, z29.h, z16.h
	add	x23, x23, 192
	ldr	z9, [x23]
	str	x11, [sp, 168]
	addvl	x23, sp, #10
	add	x11, x2, x11
	mla	z19.h, p7/m, z9.h, z4.h
	add	x23, x23, 192
	ldr	z13, [x23]
	mla	z19.h, p7/m, z12.h, z1.h
	addvl	x23, sp, #7
	mla	z19.h, p7/m, z13.h, z0.h
	add	z20.h, z20.h, z19.h
	add	x23, x23, 192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	movprfx	z19, z3
	mla	z19.h, p7/m, z22.h, z2.h
	mla	z19.h, p7/m, z30.h, z4.h
	mla	z19.h, p7/m, z10.h, z1.h
	mla	z19.h, p7/m, z11.h, z0.h
	add	z17.h, z17.h, z19.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	stp	q20, q17, [x11, 16]
	ldr	z20, [x23]
	addvl	x23, sp, #5
	mad	z20.h, p7/m, z5.h, z3.h
	mla	z21.h, p7/m, z8.h, z25.h
	add	x23, x23, 192
	ldr	z17, [x23]
	mla	z20.h, p7/m, z17.h, z16.h
	addvl	x23, sp, #11
	mad	z22.h, p7/m, z5.h, z3.h
	mla	z22.h, p7/m, z30.h, z16.h
	add	x23, x23, 192
	ldr	z13, [x23]
	mla	z20.h, p7/m, z13.h, z25.h
	addvl	x23, sp, #17
	mla	z22.h, p7/m, z10.h, z25.h
	mla	z22.h, p7/m, z11.h, z6.h
	add	x23, x23, 192
	ldr	z19, [x23]
	mad	z19.h, p7/m, z6.h, z20.h
	addvl	x23, sp, #15
	add	x23, x23, 192
	ldr	z13, [x23]
	movprfx	z20, z3
	mla	z20.h, p7/m, z13.h, z2.h
	addvl	x23, sp, #4
	add	x23, x23, 192
	ldr	z9, [x23]
	mla	z20.h, p7/m, z9.h, z4.h
	addvl	x23, sp, #16
	add	x23, x23, 192
	ldr	z9, [x23]
	mla	z20.h, p7/m, z9.h, z1.h
	addvl	x23, sp, #2
	add	x23, x23, 192
	ldr	z17, [x23]
	mla	z20.h, p7/m, z17.h, z0.h
	add	z20.h, z19.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x11, 48]
	lsl	x11, x13, 1
	ld1b	z20.h, p7/z, [x1, x20]
	add	x20, x11, 16
	movprfx	z19, z20
	sub	z19.h, z19.h, #128
	ld1b	z20.h, p7/z, [x4, x20]
	add	x20, x11, 32
	movprfx	z17, z20
	sub	z17.h, z17.h, #128
	add	x11, x11, 48
	ld1b	z20.h, p7/z, [x4, x20]
	movprfx	z9, z20
	sub	z9.h, z9.h, #128
	addvl	x20, sp, #8
	ld1b	z20.h, p7/z, [x4, x11]
	addvl	x11, sp, #7
	sub	z20.h, z20.h, #128
	add	x11, x11, 192
	str	z20, [x11]
	add	x20, x20, 192
	addvl	x11, sp, #14
	lsl	x13, x13, 2
	add	x11, x11, 192
	ldr	z20, [x11]
	mla	z21.h, p7/m, z20.h, z6.h
	addvl	x11, sp, #13
	movprfx	z20, z3
	mla	z20.h, p7/m, z23.h, z2.h
	mla	z20.h, p7/m, z18.h, z4.h
	add	x11, x11, 192
	str	z23, [x11]
	mla	z20.h, p7/m, z7.h, z1.h
	addvl	x11, sp, #9
	add	x11, x11, 192
	ldr	z23, [x11]
	mla	z20.h, p7/m, z23.h, z0.h
	addvl	x11, sp, #6
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	add	x11, x11, 192
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x5]
	ldr	z23, [x11]
	addvl	x11, sp, #12
	mad	z23.h, p7/m, z5.h, z3.h
	add	x11, x11, 192
	ldr	z20, [x11]
	mla	z23.h, p7/m, z20.h, z16.h
	addvl	x11, sp, #10
	ldr	z20, [x20]
	mla	z23.h, p7/m, z12.h, z25.h
	add	x11, x11, 192
	ldr	z21, [x11]
	addvl	x20, sp, #4
	add	x11, x2, x21, lsl 1
	mla	z23.h, p7/m, z21.h, z6.h
	movprfx	z21, z3
	mla	z21.h, p7/m, z27.h, z2.h
	mla	z21.h, p7/m, z28.h, z4.h
	mla	z21.h, p7/m, z15.h, z1.h
	mla	z21.h, p7/m, z31.h, z0.h
	add	x20, x20, 192
	add	z23.h, z23.h, z21.h
	movprfx	z21, z3
	mla	z21.h, p7/m, z26.h, z2.h
	mla	z21.h, p7/m, z24.h, z4.h
	mla	z21.h, p7/m, z14.h, z1.h
	mla	z21.h, p7/m, z20.h, z0.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	stp	q23, q22, [x11, 16]
	ldr	z22, [x20]
	addvl	x20, sp, #16
	movprfx	z23, z3
	mla	z23.h, p7/m, z13.h, z5.h
	add	x20, x20, 192
	ldr	z21, [x20]
	mla	z23.h, p7/m, z22.h, z16.h
	addvl	x20, sp, #5
	ldr	z22, [x23]
	mla	z23.h, p7/m, z21.h, z25.h
	add	x20, x20, 192
	ldr	z20, [x20]
	mla	z23.h, p7/m, z22.h, z6.h
	addvl	x20, sp, #11
	movprfx	z22, z3
	mla	z22.h, p7/m, z20.h, z2.h
	mad	z27.h, p7/m, z5.h, z3.h
	add	x20, x20, 192
	ldr	z13, [x20]
	mla	z22.h, p7/m, z13.h, z4.h
	addvl	x20, sp, #17
	mla	z27.h, p7/m, z28.h, z16.h
	mla	z27.h, p7/m, z15.h, z25.h
	add	x20, x20, 192
	ldr	z21, [x20]
	mla	z22.h, p7/m, z21.h, z1.h
	addvl	x20, sp, #3
	mla	z27.h, p7/m, z31.h, z6.h
	mad	z26.h, p7/m, z5.h, z3.h
	add	x20, x20, 192
	ldr	z21, [x20]
	mla	z22.h, p7/m, z21.h, z0.h
	add	z23.h, z23.h, z22.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x11, 48]
	lsl	x11, x16, 3
	ld1b	z23.h, p7/z, [x1, x0]
	sub	x20, x11, x1
	movprfx	z22, z23
	sub	z22.h, z22.h, #128
	mla	z26.h, p7/m, z24.h, z16.h
	add	x26, x20, 16
	ld1b	z23.h, p7/z, [x4, x26]
	movprfx	z21, z23
	sub	z21.h, z21.h, #128
	add	x26, x20, 32
	ld1b	z23.h, p7/z, [x4, x26]
	sub	z23.h, z23.h, #128
	addvl	x26, sp, #6
	mla	z26.h, p7/m, z14.h, z25.h
	add	x23, x1, x0
	add	x26, x26, 192
	str	z23, [x26]
	add	x5, x5, x3, lsl 1
	add	x26, x20, 48
	ld1b	z23.h, p7/z, [x4, x26]
	sub	z23.h, z23.h, #128
	addvl	x26, sp, #5
	add	x0, x0, x1, lsl 1
	add	x26, x26, 192
	str	z23, [x26]
	lsl	x20, x20, 1
	addvl	x26, sp, #13
	add	x26, x26, 192
	ldr	z23, [x26]
	mad	z23.h, p7/m, z5.h, z3.h
	addvl	x26, sp, #9
	mla	z23.h, p7/m, z18.h, z16.h
	movprfx	z13, z23
	mla	z13.h, p7/m, z7.h, z25.h
	add	x26, x26, 192
	ldr	z23, [x26]
	mla	z13.h, p7/m, z23.h, z6.h
	add	x26, sp, 192
	str	z13, [x26]
	movprfx	z23, z3
	mla	z23.h, p7/m, z29.h, z2.h
	addvl	x26, sp, #14
	mla	z23.h, p7/m, z8.h, z4.h
	mad	z29.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z13, [x26]
	mla	z23.h, p7/m, z13.h, z1.h
	add	x26, sp, 192
	ldr	z13, [x26]
	mla	z23.h, p7/m, z19.h, z0.h
	add	z23.h, z13.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x25]
	addvl	x25, sp, #13
	mla	z29.h, p7/m, z8.h, z16.h
	add	x25, x25, 192
	str	z31, [x25]
	addvl	x25, sp, #12
	addvl	x26, sp, #8
	add	x25, x25, 192
	ldr	z23, [x25]
	add	x26, x26, 192
	addvl	x25, sp, #10
	mad	z23.h, p7/m, z2.h, z3.h
	mla	z23.h, p7/m, z12.h, z4.h
	add	x25, x25, 192
	ldr	z31, [x25]
	mla	z23.h, p7/m, z31.h, z1.h
	add	x25, x2, x27
	mla	z23.h, p7/m, z17.h, z0.h
	add	z27.h, z27.h, z23.h
	ldr	z23, [x26]
	addvl	x26, sp, #11
	str	x27, [sp, 176]
	add	x26, x26, 192
	mla	z26.h, p7/m, z23.h, z6.h
	sqrshrunb	z27.b, z27.h, #6
	movprfx	z23, z3
	mla	z23.h, p7/m, z30.h, z2.h
	uzp1	z27.b, z27.b, z27.b
	mla	z23.h, p7/m, z10.h, z4.h
	mla	z23.h, p7/m, z11.h, z1.h
	mla	z23.h, p7/m, z9.h, z0.h
	add	z26.h, z26.h, z23.h
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	stp	q27, q26, [x25, 16]
	ldr	z13, [x26]
	addvl	x26, sp, #17
	movprfx	z27, z3
	mla	z27.h, p7/m, z20.h, z5.h
	add	x26, x26, 192
	mla	z27.h, p7/m, z13.h, z16.h
	ldr	z13, [x26]
	addvl	x26, sp, #3
	mla	z27.h, p7/m, z13.h, z25.h
	mad	z30.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z26, [x26]
	mla	z27.h, p7/m, z26.h, z6.h
	addvl	x26, sp, #4
	mla	z30.h, p7/m, z10.h, z16.h
	mla	z30.h, p7/m, z11.h, z25.h
	add	x26, x26, 192
	ldr	z20, [x26]
	movprfx	z26, z3
	mla	z26.h, p7/m, z20.h, z2.h
	addvl	x26, sp, #16
	mla	z30.h, p7/m, z9.h, z6.h
	add	x26, x26, 192
	ldr	z23, [x26]
	mla	z26.h, p7/m, z23.h, z4.h
	addvl	x26, sp, #2
	add	x26, x26, 192
	ldr	z23, [x26]
	mla	z26.h, p7/m, z23.h, z1.h
	addvl	x26, sp, #7
	add	x26, x26, 192
	ldr	z31, [x26]
	mla	z26.h, p7/m, z31.h, z0.h
	add	z27.h, z27.h, z26.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x25, 48]
	ld1b	z27.h, p7/z, [x1, x23]
	add	x23, x11, 16
	movprfx	z26, z27
	sub	z26.h, z26.h, #128
	ld1b	z27.h, p7/z, [x4, x23]
	addvl	x23, sp, #4
	add	x23, x23, 192
	sub	z27.h, z27.h, #128
	str	z27, [x23]
	add	x23, x11, 32
	ld1b	z27.h, p7/z, [x4, x23]
	movprfx	z23, z27
	sub	z23.h, z23.h, #128
	add	x23, x11, 48
	ld1b	z27.h, p7/z, [x4, x23]
	sub	z27.h, z27.h, #128
	add	x23, sp, 192
	str	z27, [x23]
	addvl	x26, sp, #8
	addvl	x23, sp, #14
	add	x26, x26, 192
	add	x23, x23, 192
	ldr	z27, [x23]
	mla	z29.h, p7/m, z27.h, z25.h
	addvl	x23, sp, #9
	mla	z29.h, p7/m, z19.h, z6.h
	movprfx	z27, z3
	mla	z27.h, p7/m, z18.h, z2.h
	add	x23, x23, 192
	ldr	z31, [x23]
	mla	z27.h, p7/m, z7.h, z4.h
	addvl	x23, sp, #12
	mla	z27.h, p7/m, z31.h, z1.h
	mla	z27.h, p7/m, z22.h, z0.h
	add	x23, x23, 192
	add	z29.h, z29.h, z27.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x5]
	ldr	z31, [x23]
	addvl	x23, sp, #10
	mad	z31.h, p7/m, z5.h, z3.h
	mla	z31.h, p7/m, z12.h, z16.h
	add	x23, x23, 192
	ldr	z29, [x23]
	mla	z31.h, p7/m, z29.h, z25.h
	addvl	x23, sp, #13
	movprfx	z29, z3
	mla	z29.h, p7/m, z28.h, z2.h
	mla	z29.h, p7/m, z15.h, z4.h
	add	x23, x23, 192
	ldr	z27, [x23]
	mla	z29.h, p7/m, z27.h, z1.h
	ldr	z27, [x26]
	addvl	x26, sp, #6
	add	x23, x2, x30
	mla	z29.h, p7/m, z21.h, z0.h
	add	x26, x26, 192
	mla	z31.h, p7/m, z17.h, z6.h
	add	z31.h, z31.h, z29.h
	movprfx	z29, z3
	mla	z29.h, p7/m, z24.h, z2.h
	mla	z29.h, p7/m, z14.h, z4.h
	mla	z29.h, p7/m, z27.h, z1.h
	ldr	z27, [x26]
	addvl	x26, sp, #16
	add	x26, x26, 192
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	mla	z29.h, p7/m, z27.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	stp	q31, q30, [x23, 16]
	movprfx	z31, z3
	mla	z31.h, p7/m, z20.h, z5.h
	ldr	z20, [x26]
	addvl	x26, sp, #2
	mla	z31.h, p7/m, z20.h, z16.h
	add	x26, x26, 192
	ldr	z29, [x26]
	mla	z31.h, p7/m, z29.h, z25.h
	addvl	x26, sp, #7
	add	x25, x3, x5
	mad	z18.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z30, [x26]
	mla	z31.h, p7/m, z30.h, z6.h
	addvl	x26, sp, #11
	mla	z18.h, p7/m, z7.h, z16.h
	mad	z28.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z30, [x26]
	mad	z30.h, p7/m, z2.h, z3.h
	addvl	x26, sp, #3
	mla	z30.h, p7/m, z13.h, z4.h
	mla	z28.h, p7/m, z15.h, z16.h
	add	x26, x26, 192
	ldr	z29, [x26]
	mla	z30.h, p7/m, z29.h, z1.h
	addvl	x26, sp, #5
	add	x30, x30, x3
	mad	z24.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z29, [x26]
	mla	z30.h, p7/m, z29.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	add	x26, x12, 16
	str	q31, [x23, 48]
	ld1b	z31.h, p7/z, [x1, x0]
	movprfx	z29, z31
	sub	z29.h, z29.h, #128
	ld1b	z31.h, p7/z, [x4, x26]
	add	x26, x12, 32
	movprfx	z27, z31
	sub	z27.h, z27.h, #128
	ld1b	z31.h, p7/z, [x4, x26]
	addvl	x26, sp, #1
	add	x26, x26, 192
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	str	z30, [x26]
	add	x26, x12, 48
	ld1b	z31.h, p7/z, [x4, x26]
	sub	z31.h, z31.h, #128
	addvl	x26, sp, #12
	mla	z24.h, p7/m, z14.h, z16.h
	add	x23, x1, x0
	add	x26, x26, 192
	str	z31, [x26]
	movprfx	z31, z3
	mla	z31.h, p7/m, z8.h, z2.h
	addvl	x26, sp, #9
	add	x5, x5, x3, lsl 1
	mad	z8.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z30, [x26]
	mla	z18.h, p7/m, z30.h, z25.h
	addvl	x26, sp, #14
	mla	z18.h, p7/m, z22.h, z6.h
	add	x11, x16, x11
	add	x26, x26, 192
	ldr	z30, [x26]
	mla	z31.h, p7/m, z30.h, z4.h
	mla	z31.h, p7/m, z19.h, z1.h
	mla	z31.h, p7/m, z26.h, z0.h
	add	z18.h, z18.h, z31.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x3, x25]
	addvl	x25, sp, #13
	movprfx	z31, z3
	mla	z31.h, p7/m, z12.h, z2.h
	mad	z12.h, p7/m, z5.h, z3.h
	add	x25, x25, 192
	ldr	z18, [x25]
	addvl	x26, sp, #8
	addvl	x25, sp, #10
	mla	z28.h, p7/m, z18.h, z25.h
	add	x26, x26, 192
	add	x25, x25, 192
	ldr	z18, [x25]
	mla	z28.h, p7/m, z21.h, z6.h
	addvl	x25, sp, #4
	mla	z31.h, p7/m, z18.h, z4.h
	mla	z31.h, p7/m, z17.h, z1.h
	add	x25, x25, 192
	ldr	z18, [x25]
	mla	z31.h, p7/m, z18.h, z0.h
	add	z31.h, z28.h, z31.h
	ldr	z28, [x26]
	addvl	x26, sp, #6
	add	x25, x2, x30
	add	x26, x26, 192
	ldr	z30, [x26]
	addvl	x26, sp, #11
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	add	x26, x26, 192
	mla	z24.h, p7/m, z28.h, z25.h
	mla	z24.h, p7/m, z30.h, z6.h
	movprfx	z30, z3
	mla	z30.h, p7/m, z10.h, z2.h
	mla	z30.h, p7/m, z11.h, z4.h
	mla	z30.h, p7/m, z9.h, z1.h
	mla	z30.h, p7/m, z23.h, z0.h
	add	z24.h, z24.h, z30.h
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	stp	q31, q24, [x25, 16]
	ldr	z31, [x26]
	addvl	x26, sp, #3
	mad	z31.h, p7/m, z5.h, z3.h
	mla	z31.h, p7/m, z13.h, z16.h
	add	x26, x26, 192
	ldr	z24, [x26]
	mla	z31.h, p7/m, z24.h, z25.h
	addvl	x26, sp, #5
	movprfx	z30, z3
	mla	z30.h, p7/m, z20.h, z2.h
	mad	z10.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z28, [x26]
	mla	z31.h, p7/m, z28.h, z6.h
	addvl	x26, sp, #2
	mla	z10.h, p7/m, z11.h, z16.h
	mla	z10.h, p7/m, z9.h, z25.h
	add	x26, x26, 192
	ldr	z28, [x26]
	mla	z30.h, p7/m, z28.h, z4.h
	addvl	x26, sp, #7
	mla	z10.h, p7/m, z23.h, z6.h
	add	x0, x0, x1, lsl 1
	add	x26, x26, 192
	ldr	z24, [x26]
	mla	z30.h, p7/m, z24.h, z1.h
	add	x26, sp, 192
	ldr	z24, [x26]
	mla	z30.h, p7/m, z24.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x25, 48]
	lsl	x25, x8, 1
	ld1b	z31.h, p7/z, [x1, x23]
	add	x23, x25, 16
	movprfx	z28, z31
	sub	z28.h, z28.h, #128
	ld1b	z31.h, p7/z, [x4, x23]
	add	x23, x25, 32
	movprfx	z24, z31
	sub	z24.h, z24.h, #128
	ld1b	z31.h, p7/z, [x4, x23]
	addvl	x23, sp, #11
	movprfx	z18, z31
	sub	z18.h, z18.h, #128
	add	x25, x25, 48
	add	x23, x23, 192
	ld1b	z31.h, p7/z, [x4, x25]
	sub	z31.h, z31.h, #128
	str	z31, [x23]
	addvl	x23, sp, #14
	movprfx	z31, z3
	mla	z31.h, p7/m, z7.h, z2.h
	add	x23, x23, 192
	ldr	z30, [x23]
	mla	z8.h, p7/m, z30.h, z16.h
	addvl	x23, sp, #9
	mla	z8.h, p7/m, z19.h, z25.h
	mla	z8.h, p7/m, z26.h, z6.h
	add	x23, x23, 192
	ldr	z30, [x23]
	mla	z31.h, p7/m, z30.h, z4.h
	addvl	x23, sp, #10
	mla	z31.h, p7/m, z22.h, z1.h
	mla	z31.h, p7/m, z29.h, z0.h
	add	x23, x23, 192
	add	z8.h, z8.h, z31.h
	sqrshrunb	z8.b, z8.h, #6
	uzp1	z8.b, z8.b, z8.b
	str	q8, [x3, x5]
	ldr	z31, [x23]
	addvl	x23, sp, #4
	mla	z12.h, p7/m, z31.h, z16.h
	mla	z12.h, p7/m, z17.h, z25.h
	addvl	x26, sp, #8
	add	x23, x23, 192
	ldr	z8, [x23]
	add	x26, x26, 192
	mla	z12.h, p7/m, z8.h, z6.h
	addvl	x23, sp, #13
	movprfx	z31, z3
	mla	z31.h, p7/m, z15.h, z2.h
	add	x23, x23, 192
	ldr	z8, [x23]
	mla	z31.h, p7/m, z8.h, z4.h
	mla	z31.h, p7/m, z21.h, z1.h
	mla	z31.h, p7/m, z27.h, z0.h
	add	z31.h, z12.h, z31.h
	ldr	z12, [x26]
	addvl	x26, sp, #6
	add	x26, x26, 192
	movprfx	z30, z3
	mla	z30.h, p7/m, z14.h, z2.h
	mla	z30.h, p7/m, z12.h, z4.h
	ldr	z12, [x26]
	addvl	x26, sp, #1
	add	x23, x2, x17, lsl 1
	add	x26, x26, 192
	mla	z30.h, p7/m, z12.h, z1.h
	ldr	z12, [x26]
	addvl	x26, sp, #2
	mla	z30.h, p7/m, z12.h, z0.h
	sqrshrunb	z31.b, z31.h, #6
	add	x26, x26, 192
	uzp1	z31.b, z31.b, z31.b
	add	z10.h, z10.h, z30.h
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	stp	q31, q10, [x23, 16]
	ldr	z12, [x26]
	addvl	x26, sp, #7
	movprfx	z31, z3
	mla	z31.h, p7/m, z20.h, z5.h
	add	x26, x26, 192
	ldr	z8, [x26]
	mla	z31.h, p7/m, z12.h, z16.h
	add	x26, sp, 192
	ldr	z10, [x26]
	mla	z31.h, p7/m, z8.h, z25.h
	addvl	x26, sp, #3
	mla	z31.h, p7/m, z10.h, z6.h
	movprfx	z30, z3
	mla	z30.h, p7/m, z13.h, z2.h
	add	x26, x26, 192
	ldr	z8, [x26]
	mla	z30.h, p7/m, z8.h, z4.h
	addvl	x26, sp, #5
	add	x25, x3, x5
	mad	z7.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z10, [x26]
	mla	z30.h, p7/m, z10.h, z1.h
	addvl	x26, sp, #12
	mad	z15.h, p7/m, z5.h, z3.h
	mad	z14.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z10, [x26]
	mla	z30.h, p7/m, z10.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	add	x26, x11, 16
	str	q31, [x23, 48]
	ld1b	z31.h, p7/z, [x1, x0]
	movprfx	z12, z31
	sub	z12.h, z12.h, #128
	ld1b	z31.h, p7/z, [x4, x26]
	add	x26, x11, 32
	movprfx	z8, z31
	sub	z8.h, z8.h, #128
	ld1b	z31.h, p7/z, [x4, x26]
	addvl	x26, sp, #15
	add	x26, x26, 192
	sub	z31.h, z31.h, #128
	str	z31, [x26]
	add	x26, x11, 48
	ld1b	z31.h, p7/z, [x4, x26]
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	addvl	x26, sp, #20
	add	x23, x1, x0
	add	x26, x26, 192
	str	z30, [x26]
	add	x5, x5, x3, lsl 1
	addvl	x26, sp, #9
	add	x0, x0, x1, lsl 1
	add	x26, x26, 192
	ldr	z20, [x26]
	mla	z7.h, p7/m, z20.h, z16.h
	addvl	x26, sp, #14
	mla	z7.h, p7/m, z22.h, z25.h
	mla	z7.h, p7/m, z29.h, z6.h
	add	x26, x26, 192
	ldr	z20, [x26]
	movprfx	z31, z3
	mla	z31.h, p7/m, z20.h, z2.h
	mla	z31.h, p7/m, z19.h, z4.h
	mla	z31.h, p7/m, z26.h, z1.h
	mla	z31.h, p7/m, z28.h, z0.h
	add	z7.h, z7.h, z31.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x25]
	addvl	x25, sp, #13
	add	x25, x25, 192
	ldr	z7, [x25]
	mla	z15.h, p7/m, z7.h, z16.h
	addvl	x25, sp, #10
	addvl	x26, sp, #8
	mla	z15.h, p7/m, z21.h, z25.h
	add	x25, x25, 192
	ldr	z31, [x25]
	mla	z15.h, p7/m, z27.h, z6.h
	addvl	x25, sp, #4
	add	x26, x26, 192
	mad	z31.h, p7/m, z2.h, z3.h
	add	x25, x25, 192
	ldr	z7, [x25]
	mla	z31.h, p7/m, z17.h, z4.h
	mla	z31.h, p7/m, z7.h, z1.h
	mla	z31.h, p7/m, z24.h, z0.h
	add	z31.h, z15.h, z31.h
	ldr	z15, [x26]
	addvl	x26, sp, #6
	add	x25, x2, x28
	add	x26, x26, 192
	ldr	z30, [x26]
	mla	z14.h, p7/m, z15.h, z16.h
	addvl	x26, sp, #1
	str	x28, [sp, 184]
	mla	z14.h, p7/m, z30.h, z25.h
	add	x26, x26, 192
	ldr	z15, [x26]
	movprfx	z30, z3
	mla	z30.h, p7/m, z11.h, z2.h
	addvl	x26, sp, #3
	mla	z14.h, p7/m, z15.h, z6.h
	mla	z30.h, p7/m, z9.h, z4.h
	add	x26, x26, 192
	mla	z30.h, p7/m, z23.h, z1.h
	mla	z30.h, p7/m, z18.h, z0.h
	add	z14.h, z14.h, z30.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	stp	q31, q14, [x25, 16]
	ldr	z14, [x26]
	addvl	x26, sp, #5
	movprfx	z31, z3
	mla	z31.h, p7/m, z13.h, z5.h
	add	x26, x26, 192
	ldr	z15, [x26]
	mla	z31.h, p7/m, z14.h, z16.h
	addvl	x26, sp, #2
	mla	z31.h, p7/m, z15.h, z25.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z10.h, z6.h
	add	x26, x26, 192
	ldr	z15, [x26]
	movprfx	z31, z3
	mla	z31.h, p7/m, z15.h, z2.h
	addvl	x26, sp, #7
	mad	z11.h, p7/m, z5.h, z3.h
	mla	z11.h, p7/m, z9.h, z16.h
	add	x26, x26, 192
	ldr	z14, [x26]
	mla	z31.h, p7/m, z14.h, z4.h
	add	x26, sp, 192
	ldr	z13, [x26]
	mla	z31.h, p7/m, z13.h, z1.h
	addvl	x26, sp, #11
	mla	z11.h, p7/m, z23.h, z25.h
	mla	z11.h, p7/m, z18.h, z6.h
	add	x26, x26, 192
	ldr	z15, [x26]
	mla	z31.h, p7/m, z15.h, z0.h
	add	z31.h, z30.h, z31.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x25, 48]
	ld1b	z31.h, p7/z, [x1, x23]
	add	x23, x22, 16
	movprfx	z15, z31
	sub	z15.h, z15.h, #128
	ld1b	z31.h, p7/z, [x4, x23]
	add	x23, x22, 32
	movprfx	z14, z31
	sub	z14.h, z14.h, #128
	ld1b	z31.h, p7/z, [x4, x23]
	add	x23, x22, 48
	movprfx	z7, z31
	sub	z7.h, z7.h, #128
	ld1b	z31.h, p7/z, [x4, x23]
	addvl	x23, sp, #12
	add	x23, x23, 192
	sub	z31.h, z31.h, #128
	str	z31, [x23]
	addvl	x23, sp, #9
	movprfx	z31, z3
	mla	z31.h, p7/m, z20.h, z5.h
	mla	z31.h, p7/m, z19.h, z16.h
	add	x23, x23, 192
	ldr	z13, [x23]
	mla	z31.h, p7/m, z26.h, z25.h
	addvl	x23, sp, #10
	movprfx	z30, z31
	mla	z30.h, p7/m, z28.h, z6.h
	addvl	x26, sp, #8
	add	x23, x23, 192
	movprfx	z31, z3
	mla	z31.h, p7/m, z13.h, z2.h
	mla	z31.h, p7/m, z22.h, z4.h
	mla	z31.h, p7/m, z29.h, z1.h
	mla	z31.h, p7/m, z12.h, z0.h
	add	z31.h, z30.h, z31.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x3, x5]
	ldr	z13, [x23]
	addvl	x23, sp, #4
	mad	z13.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	add	x23, x23, 192
	ldr	z20, [x26]
	ldr	z30, [x23]
	addvl	x26, sp, #6
	addvl	x23, sp, #13
	mla	z13.h, p7/m, z17.h, z16.h
	add	x23, x23, 192
	mla	z13.h, p7/m, z30.h, z25.h
	ldr	z30, [x23]
	add	x26, x26, 192
	movprfx	z31, z3
	mla	z31.h, p7/m, z30.h, z2.h
	movprfx	z30, z3
	mla	z30.h, p7/m, z20.h, z2.h
	ldr	z20, [x26]
	addvl	x26, sp, #1
	add	x26, x26, 192
	mla	z30.h, p7/m, z20.h, z4.h
	ldr	z20, [x26]
	addvl	x26, sp, #15
	add	x23, x2, x10, lsl 2
	mla	z13.h, p7/m, z24.h, z6.h
	add	x26, x26, 192
	mla	z31.h, p7/m, z21.h, z4.h
	mla	z31.h, p7/m, z27.h, z1.h
	mla	z31.h, p7/m, z8.h, z0.h
	add	z31.h, z13.h, z31.h
	ldr	z13, [x26]
	addvl	x26, sp, #2
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	add	x26, x26, 192
	mla	z30.h, p7/m, z20.h, z1.h
	mla	z30.h, p7/m, z13.h, z0.h
	add	z11.h, z11.h, z30.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	stp	q31, q11, [x23, 16]
	ldr	z31, [x26]
	addvl	x26, sp, #7
	add	x26, x26, 192
	ldr	z11, [x26]
	mad	z31.h, p7/m, z5.h, z3.h
	add	x26, sp, 192
	mla	z31.h, p7/m, z11.h, z16.h
	ldr	z11, [x26]
	addvl	x26, sp, #11
	mla	z31.h, p7/m, z11.h, z25.h
	add	x22, x22, x1
	add	x26, x26, 192
	ldr	z11, [x26]
	movprfx	z30, z31
	mla	z30.h, p7/m, z11.h, z6.h
	addvl	x26, sp, #3
	add	x25, x3, x5
	add	x26, x26, 192
	ldr	z31, [x26]
	mad	z31.h, p7/m, z2.h, z3.h
	addvl	x26, sp, #5
	add	x5, x5, x3, lsl 1
	add	x26, x26, 192
	ldr	z20, [x26]
	mla	z31.h, p7/m, z20.h, z4.h
	addvl	x26, sp, #20
	mla	z31.h, p7/m, z10.h, z1.h
	add	x27, x3, x5
	add	x26, x26, 192
	ldr	z20, [x26]
	mla	z31.h, p7/m, z20.h, z0.h
	addvl	x26, sp, #11
	add	z31.h, z30.h, z31.h
	sqrshrunb	z31.b, z31.h, #6
	add	x26, x26, 192
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x23, 48]
	ld1b	z31.h, p7/z, [x1, x0]
	sub	z31.h, z31.h, #128
	str	z31, [x26]
	add	x26, x22, 16
	ld1b	z31.h, p7/z, [x4, x26]
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	addvl	x26, sp, #19
	add	x23, x1, x0
	add	x26, x26, 192
	str	z30, [x26]
	add	x0, x0, x1, lsl 1
	add	x26, x22, 32
	add	x22, x22, 48
	ld1b	z31.h, p7/z, [x4, x26]
	addvl	x26, sp, #2
	sub	z31.h, z31.h, #128
	addvl	x28, sp, #6
	add	x26, x26, 192
	str	z31, [x26]
	ld1b	z31.h, p7/z, [x4, x22]
	addvl	x22, sp, #18
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	addvl	x26, sp, #8
	add	x22, x22, 192
	str	z30, [x22]
	add	x26, x26, 192
	addvl	x22, sp, #9
	add	x28, x28, 192
	add	x22, x22, 192
	ldr	z31, [x22]
	mad	z31.h, p7/m, z5.h, z3.h
	mla	z31.h, p7/m, z22.h, z16.h
	mla	z31.h, p7/m, z29.h, z25.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z12.h, z6.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z19.h, z2.h
	mla	z31.h, p7/m, z26.h, z4.h
	mla	z31.h, p7/m, z28.h, z1.h
	mla	z31.h, p7/m, z15.h, z0.h
	add	z31.h, z30.h, z31.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x3, x25]
	addvl	x25, sp, #13
	add	x25, x25, 192
	ldr	z30, [x25]
	movprfx	z31, z3
	mla	z31.h, p7/m, z30.h, z5.h
	addvl	x25, sp, #4
	mla	z31.h, p7/m, z21.h, z16.h
	mla	z31.h, p7/m, z27.h, z25.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z8.h, z6.h
	add	x25, x25, 192
	ldr	z20, [x25]
	movprfx	z31, z3
	mla	z31.h, p7/m, z17.h, z2.h
	mla	z31.h, p7/m, z20.h, z4.h
	mla	z31.h, p7/m, z24.h, z1.h
	mla	z31.h, p7/m, z14.h, z0.h
	add	z31.h, z30.h, z31.h
	ldr	z30, [x26]
	addvl	x26, sp, #6
	add	x22, x3, x10, lsl 2
	mad	z30.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z20, [x26]
	mla	z30.h, p7/m, z20.h, z16.h
	addvl	x26, sp, #1
	add	x25, x2, x22
	sqrshrunb	z31.b, z31.h, #6
	add	x26, x26, 192
	ldr	z20, [x26]
	uzp1	z31.b, z31.b, z31.b
	addvl	x26, sp, #15
	mla	z30.h, p7/m, z20.h, z25.h
	mad	z19.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	str	z13, [x26]
	mad	z13.h, p7/m, z6.h, z30.h
	addvl	x26, sp, #3
	movprfx	z30, z3
	mla	z30.h, p7/m, z9.h, z2.h
	mla	z30.h, p7/m, z23.h, z4.h
	add	x26, x26, 192
	mla	z30.h, p7/m, z18.h, z1.h
	mla	z30.h, p7/m, z7.h, z0.h
	add	z30.h, z13.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	stp	q31, q30, [x25, 16]
	ldr	z31, [x26]
	addvl	x26, sp, #5
	add	x26, x26, 192
	ldr	z30, [x26]
	mad	z31.h, p7/m, z5.h, z3.h
	addvl	x26, sp, #20
	mla	z31.h, p7/m, z30.h, z16.h
	mla	z31.h, p7/m, z10.h, z25.h
	add	x26, x26, 192
	ldr	z30, [x26]
	mad	z30.h, p7/m, z6.h, z31.h
	addvl	x26, sp, #7
	mov	z13.d, z10.d
	mla	z19.h, p7/m, z26.h, z16.h
	add	x26, x26, 192
	ldr	z31, [x26]
	mad	z31.h, p7/m, z2.h, z3.h
	add	x26, sp, 192
	ldr	z10, [x26]
	mla	z31.h, p7/m, z10.h, z4.h
	addvl	x26, sp, #12
	mla	z31.h, p7/m, z11.h, z1.h
	mla	z19.h, p7/m, z28.h, z25.h
	add	x26, x26, 192
	ldr	z20, [x26]
	mla	z31.h, p7/m, z20.h, z0.h
	add	z31.h, z30.h, z31.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x25, 48]
	ld1b	z31.h, p7/z, [x1, x23]
	addvl	x23, sp, #17
	add	x23, x23, 192
	movprfx	z10, z31
	sub	z10.h, z10.h, #128
	str	z10, [x23]
	add	x23, x19, 16
	ld1b	z31.h, p7/z, [x4, x23]
	sub	z31.h, z31.h, #128
	addvl	x23, sp, #16
	mla	z19.h, p7/m, z15.h, z6.h
	mad	z17.h, p7/m, z5.h, z3.h
	add	x23, x23, 192
	str	z31, [x23]
	mad	z9.h, p7/m, z5.h, z3.h
	add	x23, x19, 32
	add	x19, x19, 48
	ld1b	z31.h, p7/z, [x4, x23]
	addvl	x23, sp, #10
	movprfx	z10, z31
	sub	z10.h, z10.h, #128
	mla	z9.h, p7/m, z23.h, z16.h
	add	x23, x23, 192
	str	z10, [x23]
	ld1b	z31.h, p7/z, [x4, x19]
	addvl	x19, sp, #3
	sub	z31.h, z31.h, #128
	addvl	x23, sp, #6
	add	x19, x19, 192
	str	z31, [x19]
	add	x23, x23, 192
	addvl	x19, sp, #11
	movprfx	z31, z3
	mla	z31.h, p7/m, z22.h, z2.h
	mla	z31.h, p7/m, z29.h, z4.h
	add	x19, x19, 192
	ldr	z10, [x19]
	mla	z31.h, p7/m, z12.h, z1.h
	addvl	x19, sp, #4
	mla	z31.h, p7/m, z10.h, z0.h
	add	z19.h, z19.h, z31.h
	add	x19, x19, 192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x5]
	ldr	z30, [x23]
	addvl	x23, sp, #1
	ldr	z19, [x19]
	add	x23, x23, 192
	mla	z17.h, p7/m, z19.h, z16.h
	addvl	x19, sp, #19
	mla	z17.h, p7/m, z24.h, z25.h
	mla	z17.h, p7/m, z14.h, z6.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z21.h, z2.h
	add	x19, x19, 192
	ldr	z19, [x19]
	mla	z31.h, p7/m, z27.h, z4.h
	mla	z31.h, p7/m, z8.h, z1.h
	mla	z31.h, p7/m, z19.h, z0.h
	add	z31.h, z17.h, z31.h
	ldr	z17, [x23]
	addvl	x23, sp, #15
	add	x23, x23, 192
	ldr	z10, [x23]
	add	x19, x2, x24, lsl 1
	addvl	x23, sp, #2
	mad	z30.h, p7/m, z2.h, z3.h
	mla	z30.h, p7/m, z17.h, z4.h
	add	x23, x23, 192
	ldr	z17, [x23]
	sqrshrunb	z31.b, z31.h, #6
	addvl	x23, sp, #7
	uzp1	z31.b, z31.b, z31.b
	mla	z9.h, p7/m, z18.h, z25.h
	add	x23, x23, 192
	mla	z9.h, p7/m, z7.h, z6.h
	mla	z30.h, p7/m, z10.h, z1.h
	mla	z30.h, p7/m, z17.h, z0.h
	add	z9.h, z9.h, z30.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	stp	q31, q9, [x19, 16]
	ldr	z31, [x23]
	add	x23, sp, 192
	ldr	z17, [x23]
	mad	z31.h, p7/m, z5.h, z3.h
	addvl	x23, sp, #5
	mla	z31.h, p7/m, z17.h, z16.h
	mla	z31.h, p7/m, z11.h, z25.h
	add	x23, x23, 192
	movprfx	z30, z31
	mla	z30.h, p7/m, z20.h, z6.h
	ldr	z31, [x23]
	addvl	x23, sp, #20
	mov	z17.d, z11.d
	mad	z31.h, p7/m, z2.h, z3.h
	add	x23, x23, 192
	ldr	z9, [x23]
	mla	z31.h, p7/m, z13.h, z4.h
	addvl	x23, sp, #18
	mla	z31.h, p7/m, z9.h, z1.h
	str	z20, [x26]
	add	x23, x23, 192
	ldr	z11, [x23]
	mla	z31.h, p7/m, z11.h, z0.h
	add	z31.h, z30.h, z31.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x19, 48]
	lsl	x19, x1, 5
	ld1b	z31.h, p7/z, [x1, x0]
	sub	x23, x19, x1
	movprfx	z19, z31
	sub	z19.h, z19.h, #128
	mad	z22.h, p7/m, z5.h, z3.h
	add	x25, x23, 16
	ld1b	z31.h, p7/z, [x4, x25]
	movprfx	z11, z31
	sub	z11.h, z11.h, #128
	addvl	x25, sp, #15
	mla	z22.h, p7/m, z29.h, z16.h
	mla	z22.h, p7/m, z12.h, z25.h
	add	x25, x25, 192
	str	z11, [x25]
	mad	z21.h, p7/m, z5.h, z3.h
	add	x25, x23, 32
	add	x23, x23, 48
	ld1b	z31.h, p7/z, [x4, x25]
	addvl	x25, sp, #9
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	mla	z21.h, p7/m, z27.h, z16.h
	add	x25, x25, 192
	str	z30, [x25]
	ld1b	z31.h, p7/z, [x4, x23]
	addvl	x23, sp, #8
	movprfx	z11, z31
	sub	z11.h, z11.h, #128
	movprfx	z31, z3
	mla	z31.h, p7/m, z26.h, z2.h
	add	x23, x23, 192
	str	z11, [x23]
	mla	z31.h, p7/m, z28.h, z4.h
	addvl	x23, sp, #11
	mla	z31.h, p7/m, z15.h, z1.h
	mla	z21.h, p7/m, z8.h, z25.h
	add	x23, x23, 192
	ldr	z11, [x23]
	mla	z22.h, p7/m, z11.h, z6.h
	addvl	x23, sp, #17
	add	x26, x1, x0
	mad	z26.h, p7/m, z5.h, z3.h
	add	x23, x23, 192
	ldr	z11, [x23]
	mla	z31.h, p7/m, z11.h, z0.h
	add	z22.h, z22.h, z31.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x27]
	addvl	x27, sp, #19
	ldr	z20, [x28]
	add	x27, x27, 192
	ldr	z22, [x27]
	mla	z21.h, p7/m, z22.h, z6.h
	addvl	x27, sp, #4
	addvl	x28, sp, #1
	mad	z20.h, p7/m, z5.h, z3.h
	add	x27, x27, 192
	ldr	z22, [x27]
	add	x28, x28, 192
	addvl	x27, sp, #16
	movprfx	z31, z3
	mla	z31.h, p7/m, z22.h, z2.h
	mla	z31.h, p7/m, z24.h, z4.h
	add	x27, x27, 192
	ldr	z30, [x27]
	mla	z31.h, p7/m, z14.h, z1.h
	mla	z31.h, p7/m, z30.h, z0.h
	add	z31.h, z21.h, z31.h
	ldr	z21, [x28]
	addvl	x28, sp, #2
	lsl	x23, x18, 3
	mla	z20.h, p7/m, z21.h, z16.h
	add	x28, x28, 192
	ldr	z21, [x28]
	sub	x25, x23, x3
	addvl	x28, sp, #10
	add	x27, x2, x25
	sqrshrunb	z31.b, z31.h, #6
	add	x28, x28, 192
	ldr	z22, [x28]
	uzp1	z31.b, z31.b, z31.b
	addvl	x28, sp, #5
	mla	z20.h, p7/m, z10.h, z25.h
	movprfx	z30, z3
	mla	z30.h, p7/m, z23.h, z2.h
	add	x28, x28, 192
	mla	z20.h, p7/m, z21.h, z6.h
	mla	z30.h, p7/m, z18.h, z4.h
	mla	z30.h, p7/m, z7.h, z1.h
	mla	z30.h, p7/m, z22.h, z0.h
	add	z20.h, z20.h, z30.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	stp	q31, q20, [x27, 16]
	ldr	z31, [x28]
	addvl	x28, sp, #18
	mad	z31.h, p7/m, z5.h, z3.h
	add	x28, x28, 192
	ldr	z30, [x28]
	mla	z31.h, p7/m, z13.h, z16.h
	add	x28, sp, 192
	mla	z31.h, p7/m, z9.h, z25.h
	mla	z31.h, p7/m, z30.h, z6.h
	ldr	z30, [x28]
	addvl	x28, sp, #12
	mov	z11.d, z10.d
	add	x28, x28, 192
	ldr	z10, [x28]
	mad	z30.h, p7/m, z2.h, z3.h
	addvl	x28, sp, #3
	mla	z30.h, p7/m, z17.h, z4.h
	mla	z30.h, p7/m, z10.h, z1.h
	add	x28, x28, 192
	ldr	z20, [x28]
	mla	z30.h, p7/m, z20.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x27, 48]
	ld1b	z31.h, p7/z, [x1, x26]
	addvl	x26, sp, #14
	add	x26, x26, 192
	movprfx	z20, z31
	sub	z20.h, z20.h, #128
	str	z20, [x26]
	add	x26, x19, 16
	ld1b	z31.h, p7/z, [x4, x26]
	mov	z21.d, z17.d
	addvl	x26, sp, #13
	movprfx	z17, z31
	sub	z17.h, z17.h, #128
	mov	z22.d, z13.d
	add	x26, x26, 192
	str	z17, [x26]
	mov	z13.d, z9.d
	add	x26, x19, 32
	ld1b	z31.h, p7/z, [x4, x26]
	movprfx	z17, z31
	sub	z17.h, z17.h, #128
	add	x26, x19, 48
	ld1b	z31.h, p7/z, [x4, x26]
	movprfx	z9, z31
	sub	z9.h, z9.h, #128
	addvl	x26, sp, #7
	add	x5, x5, x3, lsl 1
	mla	z26.h, p7/m, z28.h, z16.h
	add	x26, x26, 192
	str	z9, [x26]
	mla	z26.h, p7/m, z15.h, z25.h
	addvl	x26, sp, #17
	movprfx	z31, z3
	mla	z31.h, p7/m, z29.h, z2.h
	mla	z31.h, p7/m, z12.h, z4.h
	add	x26, x26, 192
	ldr	z20, [x26]
	mla	z26.h, p7/m, z20.h, z6.h
	addvl	x26, sp, #11
	addvl	x28, sp, #10
	mad	z23.h, p7/m, z5.h, z3.h
	add	x26, x26, 192
	ldr	z20, [x26]
	mla	z31.h, p7/m, z20.h, z1.h
	addvl	x26, sp, #4
	mla	z31.h, p7/m, z19.h, z0.h
	add	z26.h, z26.h, z31.h
	add	x26, x26, 192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x3, x5]
	ldr	z31, [x26]
	addvl	x26, sp, #16
	add	x26, x26, 192
	ldr	z9, [x26]
	mad	z31.h, p7/m, z5.h, z3.h
	addvl	x26, sp, #19
	mla	z31.h, p7/m, z24.h, z16.h
	mla	z31.h, p7/m, z14.h, z25.h
	add	x26, x26, 192
	ldr	z26, [x26]
	movprfx	z30, z31
	mla	z30.h, p7/m, z9.h, z6.h
	addvl	x26, sp, #15
	movprfx	z31, z3
	mla	z31.h, p7/m, z27.h, z2.h
	add	x28, x28, 192
	mla	z31.h, p7/m, z8.h, z4.h
	add	x26, x26, 192
	mla	z31.h, p7/m, z26.h, z1.h
	ldr	z26, [x26]
	mla	z31.h, p7/m, z26.h, z0.h
	add	z31.h, z30.h, z31.h
	ldr	z26, [x28]
	addvl	x28, sp, #1
	add	x26, x2, x23
	add	x28, x28, 192
	ldr	z30, [x28]
	mov	z20.d, z11.d
	addvl	x28, sp, #2
	mad	z30.h, p7/m, z2.h, z3.h
	mla	z30.h, p7/m, z11.h, z4.h
	add	x28, x28, 192
	ldr	z11, [x28]
	mla	z23.h, p7/m, z18.h, z16.h
	addvl	x28, sp, #9
	mla	z23.h, p7/m, z7.h, z25.h
	sqrshrunb	z31.b, z31.h, #6
	add	x28, x28, 192
	mla	z23.h, p7/m, z26.h, z6.h
	ldr	z26, [x28]
	uzp1	z31.b, z31.b, z31.b
	add	x28, sp, 192
	mla	z30.h, p7/m, z11.h, z1.h
	mla	z30.h, p7/m, z26.h, z0.h
	add	z23.h, z23.h, z30.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	stp	q31, q23, [x26, 16]
	ldr	z31, [x28]
	addvl	x28, sp, #3
	movprfx	z30, z3
	mla	z30.h, p7/m, z22.h, z2.h
	mad	z31.h, p7/m, z5.h, z3.h
	add	x28, x28, 192
	ldr	z23, [x28]
	mla	z31.h, p7/m, z21.h, z16.h
	addvl	x28, sp, #18
	mla	z31.h, p7/m, z10.h, z25.h
	mla	z30.h, p7/m, z13.h, z4.h
	add	x28, x28, 192
	mla	z31.h, p7/m, z23.h, z6.h
	mov	z23.d, z13.d
	ldr	z13, [x28]
	addvl	x28, sp, #8
	add	x19, x19, x1
	mov	z26.d, z21.d
	mla	z30.h, p7/m, z13.h, z1.h
	mov	z21.d, z10.d
	add	x28, x28, 192
	ldr	z10, [x28]
	mla	z30.h, p7/m, z10.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	add	x0, x0, x1, lsl 1
	add	x28, x19, 16
	mad	z29.h, p7/m, z5.h, z3.h
	str	q31, [x26, 48]
	ld1b	z31.h, p7/z, [x1, x0]
	movprfx	z13, z31
	sub	z13.h, z13.h, #128
	ld1b	z31.h, p7/z, [x4, x28]
	add	x28, x19, 32
	movprfx	z11, z31
	sub	z11.h, z11.h, #128
	add	x19, x19, 48
	ld1b	z31.h, p7/z, [x4, x28]
	addvl	x28, sp, #6
	sub	z31.h, z31.h, #128
	add	x28, x28, 192
	str	z31, [x28]
	ld1b	z31.h, p7/z, [x4, x19]
	add	x19, sp, 192
	sub	z31.h, z31.h, #128
	str	z31, [x19]
	addvl	x19, sp, #11
	add	x27, x3, x5
	add	x19, x19, 192
	ldr	z31, [x19]
	mla	z29.h, p7/m, z12.h, z16.h
	addvl	x19, sp, #17
	mla	z29.h, p7/m, z31.h, z25.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z28.h, z2.h
	add	x19, x19, 192
	ldr	z10, [x19]
	mla	z29.h, p7/m, z19.h, z6.h
	addvl	x19, sp, #14
	mla	z31.h, p7/m, z15.h, z4.h
	mla	z31.h, p7/m, z10.h, z1.h
	add	x19, x19, 192
	ldr	z10, [x19]
	mla	z31.h, p7/m, z10.h, z0.h
	add	z29.h, z29.h, z31.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x27]
	addvl	x27, sp, #19
	mad	z27.h, p7/m, z5.h, z3.h
	add	x27, x27, 192
	ldr	z29, [x27]
	mla	z27.h, p7/m, z8.h, z16.h
	addvl	x27, sp, #15
	mla	z27.h, p7/m, z29.h, z25.h
	add	x19, x10, x10, lsl 2
	add	x27, x27, 192
	ldr	z31, [x27]
	mla	z27.h, p7/m, z31.h, z6.h
	addvl	x27, sp, #16
	movprfx	z31, z3
	mla	z31.h, p7/m, z24.h, z2.h
	mla	z31.h, p7/m, z14.h, z4.h
	add	x27, x27, 192
	str	z9, [x27]
	mla	z31.h, p7/m, z9.h, z1.h
	addvl	x27, sp, #13
	add	x19, x2, x19
	mad	z28.h, p7/m, z5.h, z3.h
	add	x27, x27, 192
	ldr	z29, [x27]
	mla	z31.h, p7/m, z29.h, z0.h
	addvl	x27, sp, #1
	add	z31.h, z27.h, z31.h
	sqrshrunb	z31.b, z31.h, #6
	add	x27, x27, 192
	ldr	z30, [x27]
	mad	z30.h, p7/m, z5.h, z3.h
	addvl	x27, sp, #2
	mla	z30.h, p7/m, z20.h, z16.h
	uzp1	z31.b, z31.b, z31.b
	add	x27, x27, 192
	ldr	z10, [x27]
	mla	z30.h, p7/m, z10.h, z25.h
	addvl	x27, sp, #9
	add	x26, x1, x0
	mov	z27.d, z20.d
	add	x27, x27, 192
	ldr	z29, [x27]
	mla	z30.h, p7/m, z29.h, z6.h
	addvl	x27, sp, #10
	movprfx	z29, z3
	mla	z29.h, p7/m, z18.h, z2.h
	mla	z29.h, p7/m, z7.h, z4.h
	add	x27, x27, 192
	ldr	z10, [x27]
	mla	z29.h, p7/m, z10.h, z1.h
	addvl	x27, sp, #18
	mla	z29.h, p7/m, z17.h, z0.h
	add	z30.h, z30.h, z29.h
	add	x27, x27, 192
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	stp	q31, q30, [x19, 16]
	ldr	z30, [x27]
	addvl	x27, sp, #8
	add	x27, x27, 192
	movprfx	z31, z3
	mla	z31.h, p7/m, z22.h, z5.h
	ldr	z22, [x27]
	addvl	x27, sp, #3
	mla	z31.h, p7/m, z23.h, z16.h
	mla	z31.h, p7/m, z30.h, z25.h
	add	x27, x27, 192
	mla	z31.h, p7/m, z22.h, z6.h
	ldr	z22, [x27]
	addvl	x27, sp, #7
	movprfx	z30, z3
	mla	z30.h, p7/m, z26.h, z2.h
	mla	z30.h, p7/m, z21.h, z4.h
	add	x27, x27, 192
	ldr	z9, [x27]
	mla	z30.h, p7/m, z22.h, z1.h
	mla	z30.h, p7/m, z9.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x19, 48]
	add	x19, x9, 16
	ld1b	z31.h, p7/z, [x1, x26]
	movprfx	z10, z31
	sub	z10.h, z10.h, #128
	add	x5, x5, x3, lsl 1
	ld1b	z31.h, p7/z, [x4, x19]
	add	x19, x9, 32
	movprfx	z9, z31
	sub	z9.h, z9.h, #128
	ld1b	z31.h, p7/z, [x4, x19]
	addvl	x19, sp, #5
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	add	x19, x19, 192
	str	z30, [x19]
	addvl	x26, sp, #16
	add	x19, x9, 48
	ld1b	z31.h, p7/z, [x4, x19]
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	addvl	x19, sp, #1
	add	x26, x26, 192
	mla	z28.h, p7/m, z15.h, z16.h
	add	x19, x19, 192
	str	z30, [x19]
	addvl	x27, sp, #10
	addvl	x19, sp, #17
	add	x27, x27, 192
	mad	z24.h, p7/m, z5.h, z3.h
	add	x19, x19, 192
	ldr	z31, [x19]
	mla	z28.h, p7/m, z31.h, z25.h
	addvl	x19, sp, #14
	movprfx	z31, z3
	mla	z31.h, p7/m, z12.h, z2.h
	mla	z24.h, p7/m, z14.h, z16.h
	add	x19, x19, 192
	ldr	z20, [x19]
	mla	z28.h, p7/m, z20.h, z6.h
	addvl	x19, sp, #11
	mad	z18.h, p7/m, z5.h, z3.h
	mla	z18.h, p7/m, z7.h, z16.h
	add	x19, x19, 192
	ldr	z20, [x19]
	mla	z31.h, p7/m, z20.h, z4.h
	mla	z31.h, p7/m, z19.h, z1.h
	mla	z31.h, p7/m, z13.h, z0.h
	add	z28.h, z28.h, z31.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x5]
	ldr	z22, [x26]
	addvl	x26, sp, #13
	mla	z24.h, p7/m, z22.h, z25.h
	add	x26, x26, 192
	ldr	z28, [x26]
	mla	z24.h, p7/m, z28.h, z6.h
	addvl	x26, sp, #19
	movprfx	z31, z3
	mla	z31.h, p7/m, z8.h, z2.h
	movprfx	z30, z3
	mla	z30.h, p7/m, z27.h, z2.h
	add	x26, x26, 192
	ldr	z29, [x26]
	mla	z31.h, p7/m, z29.h, z4.h
	addvl	x26, sp, #15
	mov	z29.d, z27.d
	add	x9, x9, x1
	add	x26, x26, 192
	ldr	z28, [x26]
	mla	z31.h, p7/m, z28.h, z1.h
	ldr	x26, [sp, 168]
	ldr	z28, [x27]
	mla	z18.h, p7/m, z28.h, z25.h
	addvl	x27, sp, #2
	mla	z18.h, p7/m, z17.h, z6.h
	mla	z31.h, p7/m, z11.h, z0.h
	add	x27, x27, 192
	ldr	z28, [x27]
	add	z31.h, z24.h, z31.h
	addvl	x27, sp, #9
	ldr	z24, [x28]
	mla	z30.h, p7/m, z28.h, z4.h
	add	x26, x2, x26, lsl 1
	add	x27, x27, 192
	ldr	z27, [x27]
	addvl	x27, sp, #3
	mla	z30.h, p7/m, z27.h, z1.h
	sqrshrunb	z31.b, z31.h, #6
	add	x27, x27, 192
	mla	z30.h, p7/m, z24.h, z0.h
	uzp1	z31.b, z31.b, z31.b
	add	z18.h, z18.h, z30.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q31, q18, [x26, 16]
	ldr	z27, [x27]
	addvl	x27, sp, #7
	add	x27, x27, 192
	movprfx	z31, z3
	mla	z31.h, p7/m, z26.h, z5.h
	ldr	z26, [x27]
	addvl	x27, sp, #18
	mla	z31.h, p7/m, z21.h, z16.h
	mla	z31.h, p7/m, z27.h, z25.h
	add	x27, x27, 192
	ldr	z27, [x27]
	mov	z24.d, z21.d
	addvl	x27, sp, #8
	mla	z31.h, p7/m, z26.h, z6.h
	movprfx	z30, z3
	mla	z30.h, p7/m, z23.h, z2.h
	add	x27, x27, 192
	ldr	z26, [x27]
	mla	z30.h, p7/m, z27.h, z4.h
	add	x27, sp, 192
	ldr	z21, [x27]
	mla	z30.h, p7/m, z26.h, z1.h
	mla	z30.h, p7/m, z21.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	add	x0, x0, x1, lsl 1
	add	x27, x9, 16
	str	q31, [x26, 48]
	ld1b	z31.h, p7/z, [x1, x0]
	movprfx	z28, z31
	sub	z28.h, z28.h, #128
	ld1b	z31.h, p7/z, [x4, x27]
	add	x27, x9, 32
	mov	z18.d, z20.d
	add	x9, x9, 48
	ld1b	z27.h, p7/z, [x4, x9]
	mad	z12.h, p7/m, z5.h, z3.h
	addvl	x9, sp, #17
	mla	z12.h, p7/m, z20.h, z16.h
	add	x19, x3, x5
	add	x9, x9, 192
	ldr	z20, [x9]
	movprfx	z21, z31
	sub	z21.h, z21.h, #128
	addvl	x9, sp, #14
	movprfx	z31, z3
	mla	z31.h, p7/m, z15.h, z2.h
	mla	z31.h, p7/m, z20.h, z4.h
	add	x9, x9, 192
	ldr	z20, [x9]
	mla	z31.h, p7/m, z20.h, z1.h
	addvl	x9, sp, #19
	mla	z31.h, p7/m, z10.h, z0.h
	ld1b	z26.h, p7/z, [x4, x27]
	add	x9, x9, 192
	mla	z12.h, p7/m, z19.h, z25.h
	mla	z12.h, p7/m, z13.h, z6.h
	add	z12.h, z12.h, z31.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x19]
	ldr	z31, [x9]
	addvl	x9, sp, #15
	add	x9, x9, 192
	ldr	z12, [x9]
	mad	z8.h, p7/m, z5.h, z3.h
	addvl	x9, sp, #13
	mla	z8.h, p7/m, z31.h, z16.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z14.h, z2.h
	add	x9, x9, 192
	mla	z8.h, p7/m, z12.h, z25.h
	mla	z31.h, p7/m, z22.h, z4.h
	mov	z12.d, z22.d
	ldr	z22, [x9]
	addvl	x9, sp, #2
	mla	z8.h, p7/m, z11.h, z6.h
	add	x9, x9, 192
	mla	z31.h, p7/m, z22.h, z1.h
	mla	z31.h, p7/m, z9.h, z0.h
	add	z31.h, z8.h, z31.h
	ldr	z8, [x9]
	addvl	x9, sp, #9
	movprfx	z30, z3
	mla	z30.h, p7/m, z29.h, z5.h
	add	x23, x18, x23
	add	x9, x9, 192
	ldr	z22, [x9]
	mla	z30.h, p7/m, z8.h, z16.h
	addvl	x9, sp, #10
	mla	z30.h, p7/m, z22.h, z25.h
	add	x23, x2, x23
	add	x9, x9, 192
	ldr	z22, [x9]
	ldr	z29, [x28]
	addvl	x9, sp, #5
	mla	z30.h, p7/m, z29.h, z6.h
	movprfx	z29, z3
	mla	z29.h, p7/m, z7.h, z2.h
	add	x9, x9, 192
	ldr	z20, [x9]
	mla	z29.h, p7/m, z22.h, z4.h
	addvl	x9, sp, #18
	mla	z29.h, p7/m, z17.h, z1.h
	mla	z29.h, p7/m, z20.h, z0.h
	add	x9, x9, 192
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	stp	q31, q30, [x23, 16]
	ldr	z30, [x9]
	addvl	x9, sp, #8
	add	x9, x9, 192
	movprfx	z31, z3
	mla	z31.h, p7/m, z23.h, z5.h
	ldr	z23, [x9]
	add	x9, sp, 192
	mla	z31.h, p7/m, z30.h, z16.h
	mla	z31.h, p7/m, z23.h, z25.h
	ldr	z23, [x9]
	addvl	x9, sp, #3
	mov	z20.d, z24.d
	add	x9, x9, 192
	movprfx	z30, z3
	mla	z30.h, p7/m, z24.h, z2.h
	ldr	z24, [x9]
	addvl	x9, sp, #7
	mla	z30.h, p7/m, z24.h, z4.h
	mla	z31.h, p7/m, z23.h, z6.h
	add	x9, x9, 192
	ldr	z24, [x9]
	mla	z30.h, p7/m, z24.h, z1.h
	addvl	x9, sp, #1
	add	x26, x1, x0
	mad	z15.h, p7/m, z5.h, z3.h
	add	x9, x9, 192
	ldr	z29, [x9]
	mla	z30.h, p7/m, z29.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	add	x9, x7, 16
	str	q31, [x23, 48]
	ld1b	z31.h, p7/z, [x1, x26]
	movprfx	z24, z31
	sub	z24.h, z24.h, #128
	ld1b	z31.h, p7/z, [x4, x9]
	add	x9, x7, 32
	movprfx	z23, z31
	sub	z23.h, z23.h, #128
	ld1b	z31.h, p7/z, [x4, x9]
	add	x9, x7, 48
	ld1b	z30.h, p7/z, [x4, x9]
	addvl	x9, sp, #4
	sub	z30.h, z30.h, #128
	add	x9, x9, 192
	str	z30, [x9]
	add	x5, x5, x3, lsl 1
	addvl	x9, sp, #17
	movprfx	z22, z31
	sub	z22.h, z22.h, #128
	addvl	x23, sp, #10
	add	x9, x9, 192
	ldr	z29, [x9]
	mla	z15.h, p7/m, z29.h, z16.h
	addvl	x9, sp, #14
	add	x23, x23, 192
	mad	z14.h, p7/m, z5.h, z3.h
	add	x9, x9, 192
	ldr	z31, [x9]
	mla	z15.h, p7/m, z31.h, z25.h
	addvl	x9, sp, #13
	mla	z15.h, p7/m, z10.h, z6.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z18.h, z2.h
	add	x9, x9, 192
	mla	z31.h, p7/m, z19.h, z4.h
	mla	z31.h, p7/m, z13.h, z1.h
	mla	z31.h, p7/m, z28.h, z0.h
	add	z15.h, z15.h, z31.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x5]
	mla	z14.h, p7/m, z12.h, z16.h
	ldr	z15, [x9]
	addvl	x9, sp, #19
	mla	z14.h, p7/m, z15.h, z25.h
	add	x9, x9, 192
	ldr	z31, [x9]
	mad	z31.h, p7/m, z2.h, z3.h
	addvl	x9, sp, #15
	mla	z14.h, p7/m, z9.h, z6.h
	mad	z7.h, p7/m, z5.h, z3.h
	add	x9, x9, 192
	ldr	z15, [x9]
	mla	z31.h, p7/m, z15.h, z4.h
	mov	z15.d, z21.d
	mla	z31.h, p7/m, z11.h, z1.h
	mla	z31.h, p7/m, z21.h, z0.h
	ldr	z21, [x23]
	addvl	x23, sp, #5
	add	z31.h, z14.h, z31.h
	add	x23, x23, 192
	ldr	z14, [x23]
	add	x9, x2, x21, lsl 2
	addvl	x23, sp, #2
	mla	z7.h, p7/m, z21.h, z16.h
	mla	z7.h, p7/m, z17.h, z25.h
	add	x23, x23, 192
	str	z8, [x23]
	mla	z7.h, p7/m, z14.h, z6.h
	addvl	x23, sp, #9
	movprfx	z29, z3
	mla	z29.h, p7/m, z8.h, z2.h
	sub	z26.h, z26.h, #128
	add	x23, x23, 192
	ldr	z14, [x23]
	mla	z29.h, p7/m, z14.h, z4.h
	addvl	x23, sp, #3
	ldr	z14, [x28]
	sqrshrunb	z31.b, z31.h, #6
	add	x23, x23, 192
	mla	z29.h, p7/m, z14.h, z1.h
	uzp1	z31.b, z31.b, z31.b
	mla	z29.h, p7/m, z26.h, z0.h
	add	z7.h, z7.h, z29.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	stp	q31, q7, [x9, 16]
	ldr	z14, [x23]
	addvl	x23, sp, #7
	movprfx	z31, z3
	mla	z31.h, p7/m, z20.h, z5.h
	mla	z31.h, p7/m, z14.h, z16.h
	add	x23, x23, 192
	ldr	z7, [x23]
	mla	z31.h, p7/m, z7.h, z25.h
	addvl	x23, sp, #1
	add	x7, x7, x1
	sub	z27.h, z27.h, #128
	add	x23, x23, 192
	ldr	z7, [x23]
	mla	z31.h, p7/m, z7.h, z6.h
	addvl	x23, sp, #18
	add	x0, x0, x1, lsl 1
	mov	z14.d, z15.d
	add	x23, x23, 192
	ldr	z20, [x23]
	movprfx	z29, z3
	mla	z29.h, p7/m, z20.h, z2.h
	addvl	x23, sp, #8
	add	x19, x3, x5
	add	x23, x23, 192
	ldr	z7, [x23]
	mla	z29.h, p7/m, z7.h, z4.h
	add	x23, sp, 192
	ldr	z30, [x23]
	mla	z29.h, p7/m, z30.h, z1.h
	add	x23, x7, 16
	mla	z29.h, p7/m, z27.h, z0.h
	add	z31.h, z31.h, z29.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x9, 48]
	ld1b	z8.h, p7/z, [x4, x23]
	addvl	x23, sp, #12
	ld1b	z31.h, p7/z, [x1, x0]
	add	x23, x23, 192
	sub	z8.h, z8.h, #128
	str	z8, [x23]
	add	x23, x7, 32
	add	x7, x7, 48
	movprfx	z21, z31
	sub	z21.h, z21.h, #128
	ld1b	z31.h, p7/z, [x4, x7]
	addvl	x7, sp, #11
	ld1b	z7.h, p7/z, [x4, x23]
	add	x7, x7, 192
	sub	z31.h, z31.h, #128
	str	z31, [x7]
	addvl	x7, sp, #17
	movprfx	z29, z3
	mla	z29.h, p7/m, z18.h, z5.h
	mov	z18.d, z28.d
	add	x7, x7, 192
	mla	z29.h, p7/m, z19.h, z16.h
	mla	z29.h, p7/m, z13.h, z25.h
	mla	z29.h, p7/m, z28.h, z6.h
	ldr	z28, [x7]
	addvl	x7, sp, #14
	add	x7, x7, 192
	ldr	z20, [x7]
	mad	z28.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #19
	mla	z28.h, p7/m, z20.h, z4.h
	mla	z28.h, p7/m, z10.h, z1.h
	add	x7, x7, 192
	mla	z28.h, p7/m, z24.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x19]
	ldr	z29, [x7]
	addvl	x7, sp, #15
	mad	z29.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z31, [x7]
	mla	z29.h, p7/m, z31.h, z16.h
	addvl	x7, sp, #16
	mla	z29.h, p7/m, z11.h, z25.h
	mla	z29.h, p7/m, z15.h, z6.h
	add	x7, x7, 192
	str	z12, [x7]
	mov	z31.d, z23.d
	addvl	x7, sp, #13
	movprfx	z28, z3
	mla	z28.h, p7/m, z12.h, z2.h
	mov	z20.d, z24.d
	add	x7, x7, 192
	ldr	z15, [x7]
	mla	z28.h, p7/m, z15.h, z4.h
	addvl	x7, sp, #2
	mla	z28.h, p7/m, z9.h, z1.h
	mla	z28.h, p7/m, z23.h, z0.h
	add	x7, x7, 192
	ldr	z8, [x7]
	add	x21, x3, x21, lsl 2
	addvl	x7, sp, #9
	add	x21, x2, x21
	add	z29.h, z29.h, z28.h
	add	x7, x7, 192
	ldr	z23, [x7]
	sqrshrunb	z29.b, z29.h, #6
	addvl	x7, sp, #10
	uzp1	z29.b, z29.b, z29.b
	movprfx	z28, z3
	mla	z28.h, p7/m, z8.h, z5.h
	add	x7, x7, 192
	ldr	z24, [x7]
	ldr	z8, [x28]
	addvl	x7, sp, #5
	mla	z28.h, p7/m, z23.h, z16.h
	mad	z24.h, p7/m, z2.h, z3.h
	add	x7, x7, 192
	ldr	z12, [x7]
	mla	z28.h, p7/m, z8.h, z25.h
	addvl	x7, sp, #18
	mla	z28.h, p7/m, z26.h, z6.h
	mla	z24.h, p7/m, z17.h, z4.h
	add	x7, x7, 192
	mla	z24.h, p7/m, z12.h, z1.h
	mla	z24.h, p7/m, z22.h, z0.h
	add	z28.h, z28.h, z24.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	stp	q29, q28, [x21, 16]
	ldr	z29, [x7]
	addvl	x7, sp, #8
	add	x7, x7, 192
	ldr	z8, [x7]
	mad	z29.h, p7/m, z5.h, z3.h
	add	x7, sp, 192
	str	z30, [x7]
	mla	z29.h, p7/m, z8.h, z16.h
	addvl	x7, sp, #3
	mla	z29.h, p7/m, z30.h, z25.h
	mla	z29.h, p7/m, z27.h, z6.h
	add	x7, x7, 192
	ldr	z23, [x7]
	movprfx	z28, z3
	mla	z28.h, p7/m, z23.h, z2.h
	addvl	x7, sp, #7
	add	x9, x1, x0
	mov	z8.d, z18.d
	add	x7, x7, 192
	ldr	z24, [x7]
	mla	z28.h, p7/m, z24.h, z4.h
	addvl	x7, sp, #1
	add	x5, x5, x3, lsl 1
	sub	z7.h, z7.h, #128
	add	x7, x7, 192
	ldr	z30, [x7]
	mla	z28.h, p7/m, z30.h, z1.h
	addvl	x7, sp, #4
	add	x0, x0, x1, lsl 1
	add	x7, x7, 192
	ldr	z24, [x7]
	mla	z28.h, p7/m, z24.h, z0.h
	add	x7, x15, 16
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x21, 48]
	ld1b	z24.h, p7/z, [x4, x7]
	add	x7, x15, 32
	ld1b	z23.h, p7/z, [x4, x7]
	ld1b	z12.h, p7/z, [x1, x9]
	addvl	x7, sp, #2
	add	x15, x15, 48
	ld1b	z29.h, p7/z, [x4, x15]
	add	x7, x7, 192
	sub	z29.h, z29.h, #128
	str	z29, [x7]
	addvl	x7, sp, #17
	movprfx	z28, z3
	mla	z28.h, p7/m, z19.h, z2.h
	mla	z28.h, p7/m, z13.h, z4.h
	add	x7, x7, 192
	ldr	z29, [x7]
	mla	z28.h, p7/m, z18.h, z1.h
	addvl	x7, sp, #14
	mla	z28.h, p7/m, z21.h, z0.h
	mad	z29.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z15, [x7]
	mla	z29.h, p7/m, z15.h, z16.h
	addvl	x7, sp, #16
	mla	z29.h, p7/m, z10.h, z25.h
	mla	z29.h, p7/m, z20.h, z6.h
	add	x7, x7, 192
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x5]
	mov	z15.d, z21.d
	ldr	z29, [x7]
	addvl	x7, sp, #13
	mad	z29.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z21, [x7]
	addvl	x9, sp, #10
	addvl	x7, sp, #15
	mla	z29.h, p7/m, z21.h, z16.h
	add	x9, x9, 192
	add	x7, x7, 192
	ldr	z28, [x7]
	mad	z28.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #18
	mla	z28.h, p7/m, z11.h, z4.h
	mla	z28.h, p7/m, z14.h, z1.h
	add	x7, x7, 192
	str	z14, [x7]
	mla	z29.h, p7/m, z9.h, z25.h
	addvl	x7, sp, #12
	mla	z29.h, p7/m, z31.h, z6.h
	add	x15, x3, x5
	ldr	x27, [sp, 176]
	sub	z12.h, z12.h, #128
	sub	z24.h, z24.h, #128
	add	x7, x7, 192
	ldr	z21, [x7]
	mla	z28.h, p7/m, z21.h, z0.h
	add	z29.h, z29.h, z28.h
	ldr	z28, [x9]
	addvl	x9, sp, #5
	add	x9, x9, 192
	ldr	z18, [x9]
	mad	z28.h, p7/m, z5.h, z3.h
	addvl	x9, sp, #9
	add	x7, x2, x27, lsl 1
	mla	z28.h, p7/m, z17.h, z16.h
	add	x9, x9, 192
	mla	z28.h, p7/m, z18.h, z25.h
	mov	z18.d, z22.d
	mla	z28.h, p7/m, z22.h, z6.h
	ldr	z22, [x9]
	addvl	x9, sp, #3
	add	x9, x9, 192
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	ldr	z21, [x28]
	mad	z22.h, p7/m, z2.h, z3.h
	mla	z22.h, p7/m, z21.h, z4.h
	mla	z22.h, p7/m, z26.h, z1.h
	mla	z22.h, p7/m, z7.h, z0.h
	add	z28.h, z28.h, z22.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	stp	q29, q28, [x7, 16]
	ldr	z29, [x9]
	addvl	x9, sp, #7
	mad	z29.h, p7/m, z5.h, z3.h
	add	x9, x9, 192
	ldr	z22, [x9]
	mla	z29.h, p7/m, z22.h, z16.h
	addvl	x9, sp, #1
	mla	z29.h, p7/m, z30.h, z25.h
	lsl	x19, x3, 5
	add	x9, x9, 192
	str	z30, [x9]
	sub	z23.h, z23.h, #128
	addvl	x9, sp, #4
	add	x21, x1, x0
	add	x9, x9, 192
	ldr	z30, [x9]
	mla	z29.h, p7/m, z30.h, z6.h
	addvl	x9, sp, #8
	lsl	x10, x10, 3
	add	x9, x9, 192
	ldr	z21, [x9]
	movprfx	z28, z3
	mla	z28.h, p7/m, z21.h, z2.h
	add	x9, sp, 192
	ldr	z30, [x9]
	mla	z28.h, p7/m, z30.h, z4.h
	addvl	x9, sp, #11
	mla	z28.h, p7/m, z27.h, z1.h
	lsl	x12, x12, 1
	add	x9, x9, 192
	ldr	z22, [x9]
	mla	z28.h, p7/m, z22.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x7, 48]
	sub	x7, x6, x1
	ld1b	z14.h, p7/z, [x1, x0]
	add	x9, x7, 16
	ld1b	z22.h, p7/z, [x4, x9]
	sub	z14.h, z14.h, #128
	add	x9, x7, 32
	add	x7, x7, 48
	ld1b	z29.h, p7/z, [x4, x7]
	addvl	x7, sp, #10
	ld1b	z21.h, p7/z, [x4, x9]
	sub	z29.h, z29.h, #128
	add	x7, x7, 192
	str	z29, [x7]
	add	x9, x5, x3, lsl 1
	addvl	x7, sp, #3
	addvl	x5, sp, #15
	movprfx	z29, z3
	mla	z29.h, p7/m, z19.h, z5.h
	add	x7, x7, 192
	str	z15, [x7]
	mla	z29.h, p7/m, z13.h, z16.h
	addvl	x7, sp, #14
	mla	z29.h, p7/m, z8.h, z25.h
	add	x5, x5, 192
	mla	z29.h, p7/m, z15.h, z6.h
	add	x7, x7, 192
	ldr	z19, [x7]
	movprfx	z28, z3
	mla	z28.h, p7/m, z19.h, z2.h
	mla	z28.h, p7/m, z10.h, z4.h
	mla	z28.h, p7/m, z20.h, z1.h
	mla	z28.h, p7/m, z12.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x15]
	mov	z15.d, z20.d
	ldr	z29, [x5]
	addvl	x5, sp, #18
	mad	z29.h, p7/m, z5.h, z3.h
	add	x5, x5, 192
	ldr	z28, [x5]
	mla	z29.h, p7/m, z11.h, z16.h
	addvl	x5, sp, #12
	mla	z29.h, p7/m, z28.h, z25.h
	sub	x7, x19, x3
	add	x5, x5, 192
	ldr	z28, [x5]
	mla	z29.h, p7/m, z28.h, z6.h
	addvl	x5, sp, #13
	add	x7, x2, x7
	sub	z22.h, z22.h, #128
	add	x5, x5, 192
	ldr	z28, [x5]
	mad	z28.h, p7/m, z2.h, z3.h
	addvl	x5, sp, #9
	mla	z28.h, p7/m, z9.h, z4.h
	mla	z28.h, p7/m, z31.h, z1.h
	add	x5, x5, 192
	ldr	z20, [x5]
	mla	z28.h, p7/m, z24.h, z0.h
	addvl	x5, sp, #5
	add	z29.h, z29.h, z28.h
	movprfx	z28, z3
	mla	z28.h, p7/m, z20.h, z5.h
	add	x5, x5, 192
	ldr	z19, [x5]
	ldr	z20, [x28]
	addvl	x5, sp, #17
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	add	x5, x5, 192
	str	z18, [x5]
	mla	z28.h, p7/m, z20.h, z16.h
	addvl	x5, sp, #8
	mla	z28.h, p7/m, z26.h, z25.h
	movprfx	z20, z3
	mla	z20.h, p7/m, z17.h, z2.h
	add	x5, x5, 192
	mla	z28.h, p7/m, z7.h, z6.h
	mla	z20.h, p7/m, z19.h, z4.h
	mla	z20.h, p7/m, z18.h, z1.h
	mla	z20.h, p7/m, z23.h, z0.h
	add	z28.h, z28.h, z20.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	stp	q29, q28, [x7, 16]
	ldr	z29, [x5]
	add	x5, sp, 192
	str	z30, [x5]
	addvl	x5, sp, #11
	mad	z29.h, p7/m, z5.h, z3.h
	mla	z29.h, p7/m, z30.h, z16.h
	add	x5, x5, 192
	ldr	z30, [x5]
	mla	z29.h, p7/m, z27.h, z25.h
	addvl	x5, sp, #7
	mla	z29.h, p7/m, z30.h, z6.h
	sub	z21.h, z21.h, #128
	add	x5, x5, 192
	ldr	z20, [x5]
	movprfx	z28, z3
	mla	z28.h, p7/m, z20.h, z2.h
	addvl	x5, sp, #1
	add	x0, x0, x1, lsl 1
	add	x5, x5, 192
	ldr	z19, [x5]
	mla	z28.h, p7/m, z19.h, z4.h
	addvl	x5, sp, #4
	add	x15, x1, x0
	add	x5, x5, 192
	ldr	z20, [x5]
	mla	z28.h, p7/m, z20.h, z1.h
	addvl	x5, sp, #2
	lsl	x8, x8, 2
	add	x5, x5, 192
	ldr	z30, [x5]
	mla	z28.h, p7/m, z30.h, z0.h
	add	x5, x6, 16
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x7, 48]
	ld1b	z20.h, p7/z, [x4, x5]
	addvl	x5, sp, #9
	ld1b	z18.h, p7/z, [x1, x21]
	sub	z20.h, z20.h, #128
	add	x5, x5, 192
	str	z20, [x5]
	movprfx	z28, z3
	mla	z28.h, p7/m, z13.h, z2.h
	add	x5, x6, 32
	ld1b	z19.h, p7/z, [x4, x5]
	mla	z28.h, p7/m, z8.h, z4.h
	add	x5, x6, 48
	ld1b	z29.h, p7/z, [x4, x5]
	sub	z29.h, z29.h, #128
	addvl	x5, sp, #8
	addvl	x7, sp, #5
	sub	z18.h, z18.h, #128
	add	x5, x5, 192
	str	z29, [x5]
	add	x7, x7, 192
	addvl	x5, sp, #14
	add	x6, x6, x1
	sub	z19.h, z19.h, #128
	add	x5, x5, 192
	ldr	z29, [x5]
	mad	z29.h, p7/m, z5.h, z3.h
	addvl	x5, sp, #19
	mla	z29.h, p7/m, z10.h, z16.h
	mla	z29.h, p7/m, z15.h, z25.h
	add	x5, x5, 192
	str	z15, [x5]
	mla	z29.h, p7/m, z12.h, z6.h
	addvl	x5, sp, #3
	add	x21, x3, x9
	add	x5, x5, 192
	ldr	z20, [x5]
	mla	z28.h, p7/m, z20.h, z1.h
	addvl	x5, sp, #13
	mla	z28.h, p7/m, z14.h, z0.h
	add	z29.h, z29.h, z28.h
	add	x5, x5, 192
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x9]
	ldr	z29, [x5]
	mad	z29.h, p7/m, z5.h, z3.h
	str	z31, [x5]
	addvl	x5, sp, #18
	mla	z29.h, p7/m, z9.h, z16.h
	add	x5, x5, 192
	mla	z29.h, p7/m, z31.h, z25.h
	ldr	z31, [x5]
	addvl	x5, sp, #12
	movprfx	z28, z3
	mla	z28.h, p7/m, z11.h, z2.h
	mla	z28.h, p7/m, z31.h, z4.h
	add	x5, x5, 192
	ldr	z15, [x5]
	mla	z28.h, p7/m, z15.h, z1.h
	mla	z28.h, p7/m, z22.h, z0.h
	mla	z29.h, p7/m, z24.h, z6.h
	add	z29.h, z29.h, z28.h
	movprfx	z28, z3
	mla	z28.h, p7/m, z17.h, z5.h
	ldr	z17, [x7]
	addvl	x7, sp, #17
	add	x5, x2, x19
	add	x7, x7, 192
	mla	z28.h, p7/m, z17.h, z16.h
	ldr	z17, [x7]
	addvl	x7, sp, #7
	sqrshrunb	z29.b, z29.h, #6
	add	x7, x7, 192
	uzp1	z29.b, z29.b, z29.b
	mla	z28.h, p7/m, z17.h, z25.h
	ldr	z17, [x28]
	mla	z28.h, p7/m, z23.h, z6.h
	mad	z17.h, p7/m, z2.h, z3.h
	mla	z17.h, p7/m, z26.h, z4.h
	mla	z17.h, p7/m, z7.h, z1.h
	mla	z17.h, p7/m, z21.h, z0.h
	add	z28.h, z28.h, z17.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	stp	q29, q28, [x5, 16]
	ldr	z29, [x7]
	addvl	x7, sp, #1
	add	x7, x7, 192
	ldr	z28, [x7]
	mad	z29.h, p7/m, z5.h, z3.h
	addvl	x7, sp, #4
	mla	z29.h, p7/m, z28.h, z16.h
	add	x24, x2, x24, lsl 2
	add	x7, x7, 192
	ldr	z28, [x7]
	mla	z29.h, p7/m, z28.h, z25.h
	addvl	x7, sp, #2
	mla	z29.h, p7/m, z30.h, z6.h
	lsl	x11, x11, 1
	add	x7, x7, 192
	str	z30, [x7]
	add	x25, x2, x25, lsl 1
	add	x7, sp, 192
	ldr	z28, [x7]
	mad	z28.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #11
	mla	z28.h, p7/m, z27.h, z4.h
	add	x7, x7, 192
	ldr	z30, [x7]
	mla	z28.h, p7/m, z30.h, z1.h
	addvl	x7, sp, #10
	add	x7, x7, 192
	ldr	z17, [x7]
	mla	z28.h, p7/m, z17.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x5, 48]
	add	x5, x6, 16
	ld1b	z17.h, p7/z, [x4, x5]
	add	x5, x6, 32
	ld1b	z29.h, p7/z, [x4, x5]
	ld1b	z15.h, p7/z, [x1, x0]
	addvl	x5, sp, #16
	sub	z29.h, z29.h, #128
	add	x6, x6, 48
	add	x5, x5, 192
	str	z29, [x5]
	ld1b	z29.h, p7/z, [x4, x6]
	addvl	x5, sp, #7
	movprfx	z30, z29
	sub	z30.h, z30.h, #128
	movprfx	z29, z3
	mla	z29.h, p7/m, z13.h, z5.h
	add	x5, x5, 192
	str	z30, [x5]
	mla	z29.h, p7/m, z8.h, z16.h
	addvl	x5, sp, #3
	mla	z29.h, p7/m, z20.h, z25.h
	movprfx	z28, z3
	mla	z28.h, p7/m, z10.h, z2.h
	add	x5, x5, 192
	str	z20, [x5]
	mla	z29.h, p7/m, z14.h, z6.h
	addvl	x5, sp, #19
	add	x6, x19, x3
	sub	z15.h, z15.h, #128
	add	x5, x5, 192
	ldr	z20, [x5]
	mla	z28.h, p7/m, z20.h, z4.h
	addvl	x5, sp, #18
	mla	z28.h, p7/m, z12.h, z1.h
	mla	z28.h, p7/m, z18.h, z0.h
	add	x5, x5, 192
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x21]
	ldr	z28, [x5]
	addvl	x5, sp, #12
	movprfx	z29, z3
	mla	z29.h, p7/m, z11.h, z5.h
	mla	z29.h, p7/m, z28.h, z16.h
	add	x5, x5, 192
	ldr	z13, [x5]
	mla	z29.h, p7/m, z13.h, z25.h
	addvl	x5, sp, #13
	add	x6, x2, x6
	movprfx	z28, z3
	mla	z28.h, p7/m, z9.h, z2.h
	add	x5, x5, 192
	ldr	z13, [x5]
	mla	z28.h, p7/m, z13.h, z4.h
	addvl	x5, sp, #9
	mla	z29.h, p7/m, z22.h, z6.h
	mla	z28.h, p7/m, z24.h, z1.h
	add	x5, x5, 192
	ldr	z31, [x5]
	mla	z28.h, p7/m, z31.h, z0.h
	addvl	x5, sp, #5
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	add	x5, x5, 192
	ldr	z13, [x5]
	uzp1	z29.b, z29.b, z29.b
	addvl	x5, sp, #17
	ldr	z28, [x28]
	mad	z13.h, p7/m, z2.h, z3.h
	add	x5, x5, 192
	ldr	z30, [x5]
	mad	z28.h, p7/m, z5.h, z3.h
	add	x5, sp, 192
	mla	z28.h, p7/m, z26.h, z16.h
	mla	z13.h, p7/m, z30.h, z4.h
	mla	z28.h, p7/m, z7.h, z25.h
	mla	z13.h, p7/m, z23.h, z1.h
	mla	z28.h, p7/m, z21.h, z6.h
	mla	z13.h, p7/m, z19.h, z0.h
	add	z28.h, z28.h, z13.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	stp	q29, q28, [x6, 16]
	ldr	z29, [x5]
	addvl	x5, sp, #11
	mad	z29.h, p7/m, z5.h, z3.h
	mla	z29.h, p7/m, z27.h, z16.h
	add	x5, x5, 192
	ldr	z28, [x5]
	mla	z29.h, p7/m, z28.h, z25.h
	addvl	x5, sp, #10
	add	x7, x9, x3, lsl 1
	sub	z17.h, z17.h, #128
	add	x5, x5, 192
	ldr	z11, [x5]
	mla	z29.h, p7/m, z11.h, z6.h
	addvl	x5, sp, #1
	add	x9, x3, x7
	add	x5, x5, 192
	ldr	z28, [x5]
	mad	z28.h, p7/m, z2.h, z3.h
	addvl	x5, sp, #4
	add	x5, x5, 192
	ldr	z11, [x5]
	mla	z28.h, p7/m, z11.h, z4.h
	addvl	x5, sp, #2
	add	x5, x5, 192
	ldr	z13, [x5]
	mla	z28.h, p7/m, z13.h, z1.h
	addvl	x5, sp, #8
	add	x5, x5, 192
	ldr	z13, [x5]
	mla	z28.h, p7/m, z13.h, z0.h
	add	x5, x0, x1, lsl 1
	add	z29.h, z29.h, z28.h
	add	x0, x14, 16
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x6, 48]
	ld1b	z29.h, p7/z, [x4, x0]
	add	x0, x14, 32
	ld1b	z28.h, p7/z, [x4, x0]
	add	x0, x14, 48
	ld1b	z11.h, p7/z, [x4, x0]
	ld1b	z13.h, p7/z, [x1, x15]
	addvl	x0, sp, #15
	sub	z11.h, z11.h, #128
	addvl	x6, sp, #5
	add	x0, x0, 192
	str	z11, [x0]
	movprfx	z11, z3
	mla	z11.h, p7/m, z10.h, z5.h
	addvl	x0, sp, #3
	movprfx	z10, z3
	mla	z10.h, p7/m, z8.h, z2.h
	mla	z11.h, p7/m, z20.h, z16.h
	add	x0, x0, 192
	ldr	z31, [x0]
	mla	z10.h, p7/m, z31.h, z4.h
	addvl	x0, sp, #13
	mla	z10.h, p7/m, z14.h, z1.h
	mla	z10.h, p7/m, z15.h, z0.h
	add	x0, x0, 192
	mla	z11.h, p7/m, z12.h, z25.h
	mla	z11.h, p7/m, z18.h, z6.h
	add	z11.h, z11.h, z10.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x3, x7]
	ldr	z10, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 192
	movprfx	z11, z3
	mla	z11.h, p7/m, z9.h, z5.h
	mla	z11.h, p7/m, z10.h, z16.h
	ldr	z10, [x0]
	addvl	x0, sp, #18
	mla	z11.h, p7/m, z24.h, z25.h
	add	x0, x0, 192
	mla	z11.h, p7/m, z10.h, z6.h
	ldr	z10, [x0]
	addvl	x0, sp, #12
	add	x6, x6, 192
	mad	z10.h, p7/m, z2.h, z3.h
	add	x0, x0, 192
	ldr	z9, [x0]
	mla	z10.h, p7/m, z9.h, z4.h
	ldr	z9, [x6]
	addvl	x6, sp, #17
	add	x0, x2, x30, lsl 1
	add	x6, x6, 192
	str	z30, [x6]
	mla	z10.h, p7/m, z22.h, z1.h
	addvl	x6, sp, #16
	mla	z10.h, p7/m, z17.h, z0.h
	add	z11.h, z11.h, z10.h
	add	x6, x6, 192
	movprfx	z10, z3
	mla	z10.h, p7/m, z9.h, z5.h
	mla	z10.h, p7/m, z30.h, z16.h
	ldr	z30, [x6]
	addvl	x6, sp, #1
	sqrshrunb	z11.b, z11.h, #6
	add	x6, x6, 192
	uzp1	z11.b, z11.b, z11.b
	mla	z10.h, p7/m, z23.h, z25.h
	movprfx	z9, z3
	mla	z9.h, p7/m, z26.h, z2.h
	mla	z10.h, p7/m, z19.h, z6.h
	mla	z9.h, p7/m, z7.h, z4.h
	mla	z9.h, p7/m, z21.h, z1.h
	mla	z9.h, p7/m, z30.h, z0.h
	add	z10.h, z10.h, z9.h
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	stp	q11, q10, [x0, 16]
	ldr	z11, [x6]
	addvl	x6, sp, #4
	mad	z11.h, p7/m, z5.h, z3.h
	add	x6, x6, 192
	ldr	z30, [x6]
	mla	z11.h, p7/m, z30.h, z16.h
	addvl	x6, sp, #2
	add	x14, x14, x1
	mad	z8.h, p7/m, z5.h, z3.h
	add	x6, x6, 192
	ldr	z9, [x6]
	mla	z11.h, p7/m, z9.h, z25.h
	addvl	x6, sp, #8
	mla	z8.h, p7/m, z31.h, z16.h
	mla	z8.h, p7/m, z14.h, z25.h
	add	x6, x6, 192
	ldr	z10, [x6]
	mla	z11.h, p7/m, z10.h, z6.h
	addvl	x6, sp, #11
	movprfx	z10, z3
	mla	z10.h, p7/m, z27.h, z2.h
	mla	z8.h, p7/m, z15.h, z6.h
	add	x6, x6, 192
	ldr	z30, [x6]
	mla	z10.h, p7/m, z30.h, z4.h
	addvl	x6, sp, #10
	sub	z13.h, z13.h, #128
	add	x30, x3, x30, lsl 1
	add	x6, x6, 192
	ldr	z9, [x6]
	mla	z10.h, p7/m, z9.h, z1.h
	addvl	x6, sp, #7
	sub	z29.h, z29.h, #128
	add	x30, x2, x30
	add	x6, x6, 192
	ldr	z30, [x6]
	mla	z10.h, p7/m, z30.h, z0.h
	add	z11.h, z11.h, z10.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x0, 48]
	add	x0, x14, 16
	ld1b	z11.h, p7/z, [x4, x0]
	add	x0, x14, 32
	ld1b	z10.h, p7/z, [x4, x0]
	ld1b	z9.h, p7/z, [x1, x5]
	addvl	x0, sp, #14
	add	x14, x14, 48
	ld1b	z30.h, p7/z, [x4, x14]
	add	x0, x0, 192
	sub	z30.h, z30.h, #128
	str	z30, [x0]
	addvl	x0, sp, #3
	sub	z28.h, z28.h, #128
	mad	z26.h, p7/m, z5.h, z3.h
	add	x0, x0, 192
	str	z31, [x0]
	movprfx	z31, z3
	mla	z31.h, p7/m, z20.h, z2.h
	addvl	x0, sp, #19
	mla	z31.h, p7/m, z12.h, z4.h
	mla	z31.h, p7/m, z18.h, z1.h
	add	x0, x0, 192
	str	z20, [x0]
	mla	z31.h, p7/m, z13.h, z0.h
	add	x0, x7, x3, lsl 1
	addvl	x7, sp, #18
	add	z20.h, z8.h, z31.h
	add	x7, x7, 192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x9]
	ldr	z8, [x7]
	addvl	x7, sp, #12
	add	x7, x7, 192
	ldr	z31, [x7]
	mad	z8.h, p7/m, z5.h, z3.h
	addvl	x7, sp, #13
	mla	z8.h, p7/m, z31.h, z16.h
	mla	z8.h, p7/m, z22.h, z25.h
	add	x7, x7, 192
	ldr	z31, [x7]
	mad	z31.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #9
	mla	z31.h, p7/m, z24.h, z4.h
	mla	z8.h, p7/m, z17.h, z6.h
	add	x7, x7, 192
	ldr	z20, [x7]
	mla	z31.h, p7/m, z20.h, z1.h
	addvl	x7, sp, #16
	mla	z31.h, p7/m, z29.h, z0.h
	add	z20.h, z8.h, z31.h
	add	x7, x7, 192
	ldr	z30, [x7]
	mla	z26.h, p7/m, z7.h, z16.h
	addvl	x7, sp, #17
	mla	z26.h, p7/m, z21.h, z25.h
	sqrshrunb	z20.b, z20.h, #6
	add	x7, x7, 192
	ldr	z31, [x7]
	mad	z31.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #11
	mla	z31.h, p7/m, z23.h, z4.h
	mla	z31.h, p7/m, z19.h, z1.h
	add	x7, x7, 192
	mla	z31.h, p7/m, z28.h, z0.h
	mla	z26.h, p7/m, z30.h, z6.h
	uzp1	z20.b, z20.b, z20.b
	add	z26.h, z26.h, z31.h
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	stp	q20, q26, [x30, 16]
	ldr	z31, [x7]
	addvl	x7, sp, #10
	mad	z27.h, p7/m, z5.h, z3.h
	mla	z27.h, p7/m, z31.h, z16.h
	add	x7, x7, 192
	ldr	z26, [x7]
	mla	z27.h, p7/m, z26.h, z25.h
	addvl	x7, sp, #7
	add	x6, x1, x5
	sub	z9.h, z9.h, #128
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z27.h, p7/m, z8.h, z6.h
	addvl	x7, sp, #4
	sub	z11.h, z11.h, #128
	sub	z10.h, z10.h, #128
	add	x7, x7, 192
	ldr	z26, [x7]
	mad	z26.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #2
	add	x5, x5, x1, lsl 1
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z26.h, p7/m, z8.h, z4.h
	addvl	x7, sp, #8
	add	x9, x1, x5
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z26.h, p7/m, z8.h, z1.h
	addvl	x7, sp, #15
	add	x7, x7, 192
	ldr	z30, [x7]
	mla	z26.h, p7/m, z30.h, z0.h
	add	z27.h, z27.h, z26.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x30, 48]
	ld1b	z26.h, p7/z, [x1, x6]
	add	x6, x13, 16
	ld1b	z27.h, p7/z, [x4, x6]
	add	x6, x13, 32
	ld1b	z8.h, p7/z, [x4, x6]
	add	x6, sp, 192
	sub	z8.h, z8.h, #128
	add	x13, x13, 48
	str	z8, [x28]
	ld1b	z8.h, p7/z, [x4, x13]
	sub	z8.h, z8.h, #128
	str	z8, [x6]
	addvl	x6, sp, #19
	addvl	x7, sp, #17
	add	x6, x6, 192
	ldr	z31, [x6]
	mad	z31.h, p7/m, z5.h, z3.h
	addvl	x6, sp, #3
	mla	z31.h, p7/m, z12.h, z16.h
	mla	z31.h, p7/m, z18.h, z25.h
	add	x6, x6, 192
	movprfx	z30, z31
	mla	z30.h, p7/m, z13.h, z6.h
	ldr	z31, [x6]
	addvl	x6, sp, #13
	mad	z31.h, p7/m, z2.h, z3.h
	mla	z31.h, p7/m, z14.h, z4.h
	add	x6, x6, 192
	mla	z31.h, p7/m, z15.h, z1.h
	movprfx	z8, z31
	mla	z8.h, p7/m, z9.h, z0.h
	add	z20.h, z30.h, z8.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x0]
	ldr	z31, [x6]
	addvl	x6, sp, #9
	add	x6, x6, 192
	ldr	z20, [x6]
	mad	z31.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	mla	z31.h, p7/m, z24.h, z16.h
	addvl	x6, sp, #12
	mla	z31.h, p7/m, z20.h, z25.h
	mla	z31.h, p7/m, z29.h, z6.h
	add	x6, x6, 192
	ldr	z30, [x6]
	mad	z30.h, p7/m, z2.h, z3.h
	mla	z30.h, p7/m, z22.h, z4.h
	mla	z30.h, p7/m, z17.h, z1.h
	mla	z30.h, p7/m, z11.h, z0.h
	add	z20.h, z31.h, z30.h
	ldr	z31, [x7]
	addvl	x7, sp, #16
	add	x6, x2, x17, lsl 2
	movprfx	z30, z3
	mla	z30.h, p7/m, z7.h, z2.h
	add	x7, x7, 192
	movprfx	z8, z30
	mla	z8.h, p7/m, z21.h, z4.h
	ldr	z30, [x7]
	addvl	x7, sp, #4
	mad	z30.h, p7/m, z1.h, z8.h
	add	x7, x7, 192
	mla	z30.h, p7/m, z10.h, z0.h
	mad	z31.h, p7/m, z5.h, z3.h
	sqrshrunb	z20.b, z20.h, #6
	mla	z31.h, p7/m, z23.h, z16.h
	uzp1	z20.b, z20.b, z20.b
	mla	z31.h, p7/m, z19.h, z25.h
	mla	z31.h, p7/m, z28.h, z6.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	stp	q20, q31, [x6, 16]
	ldr	z30, [x7]
	addvl	x7, sp, #2
	mad	z30.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z30.h, p7/m, z8.h, z16.h
	addvl	x7, sp, #8
	add	x13, x3, x0
	sub	z26.h, z26.h, #128
	add	x7, x7, 192
	ldr	z31, [x7]
	mla	z30.h, p7/m, z31.h, z25.h
	addvl	x7, sp, #15
	add	x17, x3, x17, lsl 2
	sub	z27.h, z27.h, #128
	add	x7, x7, 192
	ldr	z31, [x7]
	mla	z30.h, p7/m, z31.h, z6.h
	addvl	x7, sp, #11
	add	x17, x2, x17
	mad	z7.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z8, [x7]
	mad	z8.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #10
	mla	z7.h, p7/m, z21.h, z16.h
	add	x0, x0, x3, lsl 1
	add	x7, x7, 192
	ldr	z31, [x7]
	mad	z31.h, p7/m, z4.h, z8.h
	addvl	x7, sp, #7
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z31.h, p7/m, z8.h, z1.h
	addvl	x7, sp, #14
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z31.h, p7/m, z8.h, z0.h
	add	z30.h, z30.h, z31.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x6, 48]
	lsl	x6, x16, 4
	ld1b	z30.h, p7/z, [x1, x5]
	sub	x7, x6, x16
	sub	z30.h, z30.h, #128
	add	x14, x7, 16
	ld1b	z31.h, p7/z, [x4, x14]
	sub	z31.h, z31.h, #128
	addvl	x14, sp, #5
	add	x5, x5, x1, lsl 1
	add	x14, x14, 192
	str	z31, [x14]
	add	x16, x16, x6
	add	x14, x7, 32
	add	x7, x7, 48
	ld1b	z8.h, p7/z, [x4, x14]
	addvl	x14, sp, #4
	sub	z8.h, z8.h, #128
	add	x14, x14, 192
	str	z8, [x14]
	ld1b	z31.h, p7/z, [x4, x7]
	addvl	x7, sp, #1
	sub	z31.h, z31.h, #128
	movprfx	z8, z3
	mla	z8.h, p7/m, z12.h, z2.h
	add	x7, x7, 192
	str	z31, [x7]
	mla	z8.h, p7/m, z18.h, z4.h
	addvl	x7, sp, #3
	mla	z8.h, p7/m, z13.h, z1.h
	mla	z8.h, p7/m, z26.h, z0.h
	add	x7, x7, 192
	ldr	z31, [x7]
	mad	z31.h, p7/m, z5.h, z3.h
	addvl	x7, sp, #12
	mla	z31.h, p7/m, z14.h, z16.h
	mla	z31.h, p7/m, z15.h, z25.h
	add	x7, x7, 192
	mla	z31.h, p7/m, z9.h, z6.h
	add	z20.h, z31.h, z8.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x13]
	ldr	z8, [x7]
	addvl	x7, sp, #9
	movprfx	z31, z3
	mla	z31.h, p7/m, z24.h, z2.h
	add	x7, x7, 192
	ldr	z20, [x7]
	mla	z31.h, p7/m, z20.h, z4.h
	addvl	x7, sp, #16
	mla	z31.h, p7/m, z29.h, z1.h
	mla	z31.h, p7/m, z27.h, z0.h
	add	x7, x7, 192
	mad	z8.h, p7/m, z5.h, z3.h
	mla	z8.h, p7/m, z22.h, z16.h
	mla	z8.h, p7/m, z17.h, z25.h
	mla	z8.h, p7/m, z11.h, z6.h
	add	z8.h, z8.h, z31.h
	ldr	z31, [x7]
	addvl	x7, sp, #11
	mla	z7.h, p7/m, z31.h, z25.h
	ldr	z31, [x28]
	add	x7, x7, 192
	mla	z7.h, p7/m, z10.h, z6.h
	movprfx	z20, z3
	mla	z20.h, p7/m, z23.h, z2.h
	sqrshrunb	z8.b, z8.h, #6
	mla	z20.h, p7/m, z19.h, z4.h
	uzp1	z8.b, z8.b, z8.b
	mla	z20.h, p7/m, z28.h, z1.h
	mla	z20.h, p7/m, z31.h, z0.h
	add	z7.h, z7.h, z20.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	stp	q8, q7, [x17, 16]
	ldr	z31, [x7]
	addvl	x7, sp, #10
	add	x7, x7, 192
	ldr	z7, [x7]
	mad	z31.h, p7/m, z5.h, z3.h
	addvl	x7, sp, #7
	mla	z31.h, p7/m, z7.h, z16.h
	mad	z12.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z7, [x7]
	mla	z31.h, p7/m, z7.h, z25.h
	addvl	x7, sp, #14
	mla	z12.h, p7/m, z18.h, z16.h
	mla	z12.h, p7/m, z13.h, z25.h
	add	x7, x7, 192
	ldr	z7, [x7]
	mla	z31.h, p7/m, z7.h, z6.h
	addvl	x7, sp, #2
	mla	z12.h, p7/m, z26.h, z6.h
	mad	z24.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z7, [x7]
	movprfx	z8, z3
	mla	z8.h, p7/m, z7.h, z2.h
	addvl	x7, sp, #8
	mad	z23.h, p7/m, z5.h, z3.h
	mla	z23.h, p7/m, z19.h, z16.h
	add	x7, x7, 192
	ldr	z7, [x7]
	mla	z8.h, p7/m, z7.h, z4.h
	addvl	x7, sp, #15
	mla	z23.h, p7/m, z28.h, z25.h
	add	x13, x3, x0
	add	x7, x7, 192
	ldr	z7, [x7]
	mla	z8.h, p7/m, z7.h, z1.h
	add	x7, sp, 192
	ldr	z20, [x7]
	mla	z8.h, p7/m, z20.h, z0.h
	add	x7, x20, 16
	add	z31.h, z31.h, z8.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x17, 48]
	ld1b	z8.h, p7/z, [x4, x7]
	addvl	x7, sp, #3
	ld1b	z31.h, p7/z, [x1, x9]
	sub	z8.h, z8.h, #128
	add	x7, x7, 192
	str	z8, [x7]
	addvl	x9, sp, #6
	add	x7, x20, 32
	ld1b	z8.h, p7/z, [x4, x7]
	add	x20, x20, 48
	addvl	x7, sp, #13
	movprfx	z7, z8
	sub	z7.h, z7.h, #128
	ld1b	z8.h, p7/z, [x4, x20]
	add	x7, x7, 192
	sub	z8.h, z8.h, #128
	str	z8, [x7]
	addvl	x7, sp, #9
	movprfx	z8, z3
	mla	z8.h, p7/m, z14.h, z2.h
	mla	z8.h, p7/m, z15.h, z4.h
	add	x7, x7, 192
	mla	z8.h, p7/m, z9.h, z1.h
	mla	z8.h, p7/m, z30.h, z0.h
	add	z12.h, z12.h, z8.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x0]
	ldr	z12, [x7]
	addvl	x7, sp, #5
	mla	z24.h, p7/m, z12.h, z16.h
	add	x7, x7, 192
	ldr	z8, [x7]
	ldr	x28, [sp, 184]
	movprfx	z12, z3
	mla	z12.h, p7/m, z22.h, z2.h
	mla	z12.h, p7/m, z17.h, z4.h
	add	x9, x9, 192
	mla	z12.h, p7/m, z11.h, z1.h
	mla	z12.h, p7/m, z8.h, z0.h
	mla	z24.h, p7/m, z29.h, z25.h
	mla	z24.h, p7/m, z27.h, z6.h
	add	z24.h, z24.h, z12.h
	ldr	z12, [x9]
	addvl	x9, sp, #16
	sqrshrunb	z24.b, z24.h, #6
	add	x7, x2, x28, lsl 1
	add	x9, x9, 192
	ldr	z8, [x9]
	addvl	x9, sp, #2
	uzp1	z24.b, z24.b, z24.b
	mla	z23.h, p7/m, z12.h, z6.h
	add	x9, x9, 192
	movprfx	z12, z3
	mla	z12.h, p7/m, z21.h, z2.h
	mla	z12.h, p7/m, z8.h, z4.h
	ldr	z8, [x14]
	mla	z12.h, p7/m, z10.h, z1.h
	mla	z12.h, p7/m, z8.h, z0.h
	add	z23.h, z23.h, z12.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	stp	q24, q23, [x7, 16]
	ldr	z24, [x9]
	addvl	x9, sp, #8
	add	x9, x9, 192
	ldr	z23, [x9]
	mad	z24.h, p7/m, z5.h, z3.h
	addvl	x9, sp, #15
	mla	z24.h, p7/m, z23.h, z16.h
	mov	z8.d, z20.d
	add	x9, x9, 192
	ldr	z12, [x9]
	mla	z24.h, p7/m, z12.h, z25.h
	addvl	x9, sp, #10
	movprfx	z23, z24
	mla	z23.h, p7/m, z20.h, z6.h
	sub	z31.h, z31.h, #128
	add	x9, x9, 192
	ldr	z24, [x9]
	mad	z24.h, p7/m, z2.h, z3.h
	addvl	x9, sp, #7
	mad	z14.h, p7/m, z5.h, z3.h
	mla	z14.h, p7/m, z15.h, z16.h
	add	x9, x9, 192
	ldr	z12, [x9]
	mla	z24.h, p7/m, z12.h, z4.h
	addvl	x9, sp, #14
	mla	z14.h, p7/m, z9.h, z25.h
	mla	z14.h, p7/m, z30.h, z6.h
	add	x9, x9, 192
	ldr	z12, [x9]
	mla	z24.h, p7/m, z12.h, z1.h
	addvl	x9, sp, #1
	mad	z22.h, p7/m, z5.h, z3.h
	mla	z22.h, p7/m, z17.h, z16.h
	add	x9, x9, 192
	ldr	z20, [x9]
	mla	z24.h, p7/m, z20.h, z0.h
	add	z24.h, z23.h, z24.h
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x7, 48]
	sub	x7, x6, x1
	ld1b	z23.h, p7/z, [x1, x5]
	add	x14, x7, 16
	ld1b	z24.h, p7/z, [x4, x14]
	mla	z22.h, p7/m, z11.h, z25.h
	add	x14, x7, 32
	add	x7, x7, 48
	ld1b	z12.h, p7/z, [x4, x14]
	sub	z12.h, z12.h, #128
	add	x14, sp, 192
	str	z12, [x14]
	ld1b	z12.h, p7/z, [x4, x7]
	addvl	x7, sp, #12
	sub	z12.h, z12.h, #128
	add	x7, x7, 192
	str	z12, [x7]
	movprfx	z12, z3
	mla	z12.h, p7/m, z18.h, z2.h
	mla	z12.h, p7/m, z13.h, z4.h
	mla	z12.h, p7/m, z26.h, z1.h
	mla	z12.h, p7/m, z31.h, z0.h
	add	z14.h, z14.h, z12.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x3, x13]
	addvl	x13, sp, #5
	mad	z21.h, p7/m, z5.h, z3.h
	add	x13, x13, 192
	ldr	z14, [x13]
	mla	z22.h, p7/m, z14.h, z6.h
	addvl	x13, sp, #9
	sub	x7, x10, x3
	sub	z23.h, z23.h, #128
	add	x13, x13, 192
	ldr	z14, [x13]
	mad	z14.h, p7/m, z2.h, z3.h
	addvl	x13, sp, #3
	mla	z14.h, p7/m, z29.h, z4.h
	mla	z14.h, p7/m, z27.h, z1.h
	add	x13, x13, 192
	ldr	z12, [x13]
	mla	z14.h, p7/m, z12.h, z0.h
	addvl	x13, sp, #16
	add	z22.h, z22.h, z14.h
	add	x7, x2, x7
	add	x13, x13, 192
	ldr	z14, [x13]
	mla	z21.h, p7/m, z14.h, z16.h
	addvl	x13, sp, #4
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	add	x13, x13, 192
	ldr	z14, [x13]
	mla	z21.h, p7/m, z10.h, z25.h
	addvl	x13, sp, #6
	mla	z21.h, p7/m, z14.h, z6.h
	movprfx	z14, z3
	mla	z14.h, p7/m, z19.h, z2.h
	add	x13, x13, 192
	ldr	z12, [x13]
	mla	z14.h, p7/m, z28.h, z4.h
	addvl	x13, sp, #10
	mla	z14.h, p7/m, z12.h, z1.h
	mla	z14.h, p7/m, z7.h, z0.h
	add	x13, x13, 192
	add	z21.h, z21.h, z14.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x7, 16]
	ldr	z22, [x13]
	addvl	x13, sp, #7
	mad	z22.h, p7/m, z5.h, z3.h
	mov	z12.d, z8.d
	add	x13, x13, 192
	ldr	z21, [x13]
	mla	z22.h, p7/m, z21.h, z16.h
	addvl	x13, sp, #14
	add	x9, x1, x5
	mad	z18.h, p7/m, z5.h, z3.h
	add	x13, x13, 192
	ldr	z21, [x13]
	mla	z22.h, p7/m, z21.h, z25.h
	addvl	x13, sp, #1
	mla	z22.h, p7/m, z20.h, z6.h
	add	x0, x0, x3, lsl 1
	add	x13, x13, 192
	str	z20, [x13]
	mla	z18.h, p7/m, z13.h, z16.h
	addvl	x13, sp, #8
	mla	z18.h, p7/m, z26.h, z25.h
	mla	z18.h, p7/m, z31.h, z6.h
	add	x13, x13, 192
	ldr	z21, [x13]
	mad	z21.h, p7/m, z2.h, z3.h
	addvl	x13, sp, #15
	sub	z24.h, z24.h, #128
	mad	z19.h, p7/m, z5.h, z3.h
	add	x13, x13, 192
	ldr	z14, [x13]
	mla	z21.h, p7/m, z14.h, z4.h
	addvl	x13, sp, #13
	mla	z21.h, p7/m, z8.h, z1.h
	movprfx	z14, z3
	mla	z14.h, p7/m, z15.h, z2.h
	add	x13, x13, 192
	ldr	z8, [x13]
	mla	z21.h, p7/m, z8.h, z0.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x7, 48]
	add	x7, x6, 16
	ld1b	z22.h, p7/z, [x4, x7]
	addvl	x7, sp, #11
	ld1b	z21.h, p7/z, [x1, x9]
	sub	z22.h, z22.h, #128
	add	x7, x7, 192
	str	z22, [x7]
	mla	z14.h, p7/m, z9.h, z4.h
	add	x7, x6, 32
	ld1b	z22.h, p7/z, [x4, x7]
	sub	z22.h, z22.h, #128
	addvl	x7, sp, #10
	mla	z14.h, p7/m, z30.h, z1.h
	mla	z14.h, p7/m, z23.h, z0.h
	add	x7, x7, 192
	str	z22, [x7]
	add	z18.h, z18.h, z14.h
	add	x7, x6, 48
	ld1b	z22.h, p7/z, [x4, x7]
	sub	z22.h, z22.h, #128
	addvl	x7, sp, #2
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	add	x7, x7, 192
	str	z22, [x7]
	str	q18, [x3, x0]
	addvl	x7, sp, #9
	mla	z19.h, p7/m, z28.h, z16.h
	sub	z21.h, z21.h, #128
	add	x7, x7, 192
	ldr	z20, [x7]
	addvl	x9, sp, #6
	addvl	x7, sp, #3
	add	x9, x9, 192
	mad	z20.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z18, [x7]
	mla	z20.h, p7/m, z29.h, z16.h
	addvl	x7, sp, #5
	mla	z20.h, p7/m, z27.h, z25.h
	mla	z20.h, p7/m, z18.h, z6.h
	add	x7, x7, 192
	ldr	z8, [x7]
	movprfx	z18, z3
	mla	z18.h, p7/m, z17.h, z2.h
	mla	z18.h, p7/m, z11.h, z4.h
	mla	z18.h, p7/m, z8.h, z1.h
	mla	z18.h, p7/m, z24.h, z0.h
	add	z20.h, z20.h, z18.h
	ldr	z18, [x9]
	addvl	x9, sp, #16
	add	x9, x9, 192
	ldr	z22, [x9]
	add	x7, x2, x10
	addvl	x9, sp, #4
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	add	x9, x9, 192
	ldr	z14, [x9]
	ldr	z8, [x14]
	addvl	x9, sp, #8
	mla	z19.h, p7/m, z18.h, z25.h
	movprfx	z18, z3
	mla	z18.h, p7/m, z22.h, z2.h
	add	x9, x9, 192
	mla	z19.h, p7/m, z7.h, z6.h
	mla	z18.h, p7/m, z10.h, z4.h
	mla	z18.h, p7/m, z14.h, z1.h
	mla	z18.h, p7/m, z8.h, z0.h
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	stp	q20, q19, [x7, 16]
	ldr	z20, [x9]
	addvl	x9, sp, #15
	mad	z20.h, p7/m, z5.h, z3.h
	add	x9, x9, 192
	ldr	z14, [x9]
	mla	z20.h, p7/m, z14.h, z16.h
	addvl	x9, sp, #13
	mla	z20.h, p7/m, z12.h, z25.h
	add	x5, x5, x1, lsl 1
	add	x9, x9, 192
	ldr	z19, [x9]
	mla	z20.h, p7/m, z19.h, z6.h
	addvl	x9, sp, #7
	add	x13, x3, x0
	movprfx	z14, z3
	mla	z14.h, p7/m, z13.h, z2.h
	add	x9, x9, 192
	ldr	z19, [x9]
	mad	z19.h, p7/m, z2.h, z3.h
	addvl	x9, sp, #14
	mla	z14.h, p7/m, z26.h, z4.h
	mad	z15.h, p7/m, z5.h, z3.h
	add	x9, x9, 192
	ldr	z18, [x9]
	mla	z19.h, p7/m, z18.h, z4.h
	addvl	x9, sp, #1
	mla	z15.h, p7/m, z9.h, z16.h
	mla	z14.h, p7/m, z31.h, z1.h
	add	x9, x9, 192
	ldr	z18, [x9]
	mla	z19.h, p7/m, z18.h, z1.h
	addvl	x9, sp, #12
	mla	z14.h, p7/m, z21.h, z0.h
	mla	z15.h, p7/m, z30.h, z25.h
	add	x9, x9, 192
	ldr	z18, [x9]
	mla	z19.h, p7/m, z18.h, z0.h
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x7, 48]
	add	x7, x6, x1
	ld1b	z18.h, p7/z, [x1, x5]
	add	x14, x7, 16
	ld1b	z20.h, p7/z, [x4, x14]
	sub	z20.h, z20.h, #128
	addvl	x14, sp, #8
	mla	z15.h, p7/m, z23.h, z6.h
	add	z15.h, z15.h, z14.h
	add	x14, x14, 192
	str	z20, [x14]
	sqrshrunb	z15.b, z15.h, #6
	add	x14, x7, 32
	add	x7, x7, 48
	ld1b	z20.h, p7/z, [x4, x7]
	addvl	x7, sp, #5
	uzp1	z15.b, z15.b, z15.b
	ld1b	z19.h, p7/z, [x4, x14]
	add	x7, x7, 192
	str	q15, [x3, x13]
	ldr	z15, [x7]
	addvl	x7, sp, #3
	mad	z17.h, p7/m, z5.h, z3.h
	mla	z17.h, p7/m, z11.h, z16.h
	add	x7, x7, 192
	ldr	z14, [x7]
	mla	z17.h, p7/m, z15.h, z25.h
	addvl	x7, sp, #11
	movprfx	z15, z3
	mla	z15.h, p7/m, z29.h, z2.h
	mla	z15.h, p7/m, z27.h, z4.h
	add	x7, x7, 192
	mla	z15.h, p7/m, z14.h, z1.h
	ldr	z14, [x7]
	addvl	x7, sp, #4
	mla	z15.h, p7/m, z14.h, z0.h
	mla	z17.h, p7/m, z24.h, z6.h
	add	x7, x7, 192
	ldr	z14, [x7]
	add	x10, x10, x3
	add	x7, sp, 192
	str	z8, [x7]
	add	z17.h, z17.h, z15.h
	addvl	x7, sp, #6
	movprfx	z15, z3
	mla	z15.h, p7/m, z22.h, z5.h
	mla	z15.h, p7/m, z10.h, z16.h
	add	x7, x7, 192
	mla	z15.h, p7/m, z14.h, z25.h
	movprfx	z14, z15
	mla	z14.h, p7/m, z8.h, z6.h
	ldr	z8, [x7]
	addvl	x7, sp, #10
	add	x10, x2, x10
	add	x7, x7, 192
	ldr	z22, [x7]
	sqrshrunb	z17.b, z17.h, #6
	addvl	x7, sp, #7
	uzp1	z17.b, z17.b, z17.b
	movprfx	z15, z3
	mla	z15.h, p7/m, z28.h, z2.h
	add	x7, x7, 192
	mla	z15.h, p7/m, z8.h, z4.h
	mla	z15.h, p7/m, z7.h, z1.h
	mla	z15.h, p7/m, z22.h, z0.h
	add	z15.h, z14.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	stp	q17, q15, [x10, 16]
	ldr	z17, [x7]
	addvl	x7, sp, #14
	mad	z17.h, p7/m, z5.h, z3.h
	mov	z8.d, z12.d
	add	x7, x7, 192
	ldr	z15, [x7]
	mla	z17.h, p7/m, z15.h, z16.h
	addvl	x7, sp, #1
	add	x9, x1, x5
	sub	z18.h, z18.h, #128
	add	x7, x7, 192
	ldr	z22, [x7]
	mla	z17.h, p7/m, z22.h, z25.h
	addvl	x7, sp, #12
	add	x0, x0, x3, lsl 1
	mad	z13.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z15, [x7]
	mla	z17.h, p7/m, z15.h, z6.h
	addvl	x7, sp, #15
	mla	z13.h, p7/m, z26.h, z16.h
	mla	z13.h, p7/m, z31.h, z25.h
	add	x7, x7, 192
	ldr	z22, [x7]
	movprfx	z15, z3
	mla	z15.h, p7/m, z22.h, z2.h
	addvl	x7, sp, #13
	mla	z15.h, p7/m, z12.h, z4.h
	mla	z13.h, p7/m, z21.h, z6.h
	add	x7, x7, 192
	ldr	z12, [x7]
	mla	z15.h, p7/m, z12.h, z1.h
	addvl	x7, sp, #2
	movprfx	z12, z3
	mla	z12.h, p7/m, z9.h, z2.h
	mla	z12.h, p7/m, z30.h, z4.h
	add	x7, x7, 192
	ldr	z14, [x7]
	mla	z15.h, p7/m, z14.h, z0.h
	add	x7, x12, 16
	add	z17.h, z17.h, z15.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x10, 48]
	ld1b	z15.h, p7/z, [x4, x7]
	add	x7, x12, 32
	ld1b	z17.h, p7/z, [x4, x7]
	ld1b	z14.h, p7/z, [x1, x9]
	addvl	x7, sp, #7
	sub	z17.h, z17.h, #128
	add	x12, x12, 48
	add	x7, x7, 192
	str	z17, [x7]
	ld1b	z17.h, p7/z, [x4, x12]
	addvl	x7, sp, #9
	sub	z17.h, z17.h, #128
	mla	z12.h, p7/m, z23.h, z1.h
	add	x7, x7, 192
	str	z17, [x7]
	mla	z12.h, p7/m, z18.h, z0.h
	addvl	x7, sp, #3
	add	z13.h, z13.h, z12.h
	sqrshrunb	z13.b, z13.h, #6
	add	x7, x7, 192
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x3, x0]
	ldr	z17, [x7]
	addvl	x7, sp, #11
	mad	z29.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z13, [x7]
	addvl	x10, sp, #6
	addvl	x7, sp, #5
	mla	z29.h, p7/m, z27.h, z16.h
	add	x10, x10, 192
	mla	z29.h, p7/m, z17.h, z25.h
	add	x7, x7, 192
	ldr	z17, [x7]
	mla	z29.h, p7/m, z13.h, z6.h
	addvl	x7, sp, #8
	movprfx	z13, z3
	mla	z13.h, p7/m, z11.h, z2.h
	mla	z13.h, p7/m, z17.h, z4.h
	ldr	z17, [x10]
	addvl	x10, sp, #10
	mla	z13.h, p7/m, z24.h, z1.h
	add	x7, x7, 192
	ldr	z12, [x7]
	add	x10, x10, 192
	mla	z13.h, p7/m, z12.h, z0.h
	add	z29.h, z29.h, z13.h
	ldr	z13, [x10]
	addvl	x10, sp, #4
	add	x7, x2, x22, lsl 1
	add	x10, x10, 192
	ldr	z12, [x10]
	mad	z28.h, p7/m, z5.h, z3.h
	add	x10, sp, 192
	mla	z28.h, p7/m, z17.h, z16.h
	ldr	z17, [x10]
	addvl	x10, sp, #13
	sub	z19.h, z19.h, #128
	mla	z28.h, p7/m, z7.h, z25.h
	add	x10, x10, 192
	mla	z28.h, p7/m, z13.h, z6.h
	movprfx	z13, z3
	mla	z13.h, p7/m, z10.h, z2.h
	mla	z13.h, p7/m, z12.h, z4.h
	mla	z13.h, p7/m, z17.h, z1.h
	mla	z13.h, p7/m, z19.h, z0.h
	add	z28.h, z28.h, z13.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q29, q28, [x7, 16]
	ldr	z28, [x10]
	addvl	x10, sp, #2
	movprfx	z29, z3
	mla	z29.h, p7/m, z22.h, z5.h
	add	x10, x10, 192
	ldr	z22, [x10]
	mla	z29.h, p7/m, z8.h, z16.h
	addvl	x10, sp, #14
	mla	z29.h, p7/m, z28.h, z25.h
	mla	z29.h, p7/m, z22.h, z6.h
	add	x10, x10, 192
	ldr	z22, [x10]
	sub	z20.h, z20.h, #128
	addvl	x10, sp, #1
	movprfx	z28, z3
	mla	z28.h, p7/m, z22.h, z2.h
	add	x9, x3, x0
	add	x10, x10, 192
	ldr	z13, [x10]
	mla	z28.h, p7/m, z13.h, z4.h
	addvl	x10, sp, #12
	sub	z14.h, z14.h, #128
	mov	z17.d, z8.d
	add	x10, x10, 192
	ldr	z13, [x10]
	mla	z28.h, p7/m, z13.h, z1.h
	mla	z28.h, p7/m, z20.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x7, 48]
	add	x7, x16, 16
	ld1b	z29.h, p7/z, [x4, x7]
	add	x7, x16, 32
	ld1b	z12.h, p7/z, [x4, x7]
	addvl	x7, sp, #5
	movprfx	z8, z3
	mla	z8.h, p7/m, z26.h, z2.h
	mad	z9.h, p7/m, z5.h, z3.h
	mla	z8.h, p7/m, z31.h, z4.h
	mla	z9.h, p7/m, z30.h, z16.h
	mla	z8.h, p7/m, z21.h, z1.h
	mla	z9.h, p7/m, z23.h, z25.h
	mla	z8.h, p7/m, z14.h, z0.h
	mla	z9.h, p7/m, z18.h, z6.h
	add	x7, x7, 192
	add	z9.h, z9.h, z8.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	add	x5, x5, x1, lsl 1
	add	x16, x16, 48
	ld1b	z28.h, p7/z, [x1, x5]
	ld1b	z13.h, p7/z, [x4, x16]
	str	q9, [x3, x9]
	ldr	z9, [x7]
	addvl	x7, sp, #8
	mad	z11.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	mla	z11.h, p7/m, z9.h, z16.h
	ldr	z9, [x7]
	addvl	x7, sp, #3
	mla	z11.h, p7/m, z24.h, z25.h
	mla	z11.h, p7/m, z9.h, z6.h
	add	x7, x7, 192
	ldr	z8, [x7]
	movprfx	z9, z3
	mla	z9.h, p7/m, z27.h, z2.h
	addvl	x7, sp, #11
	mla	z9.h, p7/m, z8.h, z4.h
	sub	z15.h, z15.h, #128
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z9.h, p7/m, z8.h, z1.h
	addvl	x7, sp, #4
	mla	z9.h, p7/m, z15.h, z0.h
	add	z11.h, z11.h, z9.h
	add	x7, x7, 192
	ldr	z9, [x7]
	mad	z10.h, p7/m, z5.h, z3.h
	add	x7, sp, 192
	ldr	z8, [x7]
	mla	z10.h, p7/m, z9.h, z16.h
	addvl	x7, sp, #6
	add	x22, x3, x22, lsl 1
	mla	z10.h, p7/m, z8.h, z25.h
	add	x7, x7, 192
	ldr	z9, [x7]
	mad	z9.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #14
	mla	z9.h, p7/m, z7.h, z4.h
	add	x22, x2, x22
	add	x7, x7, 192
	str	z7, [x7]
	sqrshrunb	z11.b, z11.h, #6
	addvl	x7, sp, #10
	uzp1	z11.b, z11.b, z11.b
	mla	z10.h, p7/m, z19.h, z6.h
	add	x7, x7, 192
	ldr	z7, [x7]
	mla	z9.h, p7/m, z7.h, z1.h
	addvl	x7, sp, #7
	add	x6, x1, x5
	sub	z28.h, z28.h, #128
	add	x7, x7, 192
	ldr	z8, [x7]
	mla	z9.h, p7/m, z8.h, z0.h
	addvl	x7, sp, #1
	add	z10.h, z10.h, z9.h
	sqrshrunb	z10.b, z10.h, #6
	add	x7, x7, 192
	uzp1	z10.b, z10.b, z10.b
	stp	q11, q10, [x22, 16]
	movprfx	z11, z3
	mla	z11.h, p7/m, z22.h, z5.h
	ldr	z22, [x7]
	addvl	x7, sp, #13
	add	x7, x7, 192
	mla	z11.h, p7/m, z22.h, z16.h
	ldr	z22, [x7]
	addvl	x7, sp, #2
	ldr	z10, [x10]
	mla	z11.h, p7/m, z10.h, z25.h
	add	x7, x7, 192
	movprfx	z10, z3
	mla	z10.h, p7/m, z17.h, z2.h
	mla	z10.h, p7/m, z22.h, z4.h
	ldr	z22, [x7]
	addvl	x7, sp, #9
	mla	z11.h, p7/m, z20.h, z6.h
	mla	z10.h, p7/m, z22.h, z1.h
	add	x7, x7, 192
	ldr	z9, [x7]
	mla	z10.h, p7/m, z9.h, z0.h
	add	z11.h, z11.h, z10.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x22, 48]
	ld1b	z8.h, p7/z, [x1, x6]
	add	x6, x8, 16
	ld1b	z9.h, p7/z, [x4, x6]
	movprfx	z7, z3
	mla	z7.h, p7/m, z30.h, z2.h
	add	x6, x8, 32
	add	x0, x0, x3, lsl 1
	ld1b	z10.h, p7/z, [x4, x6]
	add	x6, x8, 48
	ld1b	z11.h, p7/z, [x4, x6]
	mla	z7.h, p7/m, z23.h, z4.h
	addvl	x6, sp, #3
	mla	z7.h, p7/m, z18.h, z1.h
	mad	z26.h, p7/m, z5.h, z3.h
	mla	z7.h, p7/m, z28.h, z0.h
	mla	z26.h, p7/m, z31.h, z16.h
	add	x6, x6, 192
	mla	z26.h, p7/m, z21.h, z25.h
	mla	z26.h, p7/m, z14.h, z6.h
	add	z26.h, z26.h, z7.h
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x3, x0]
	ldr	z26, [x6]
	addvl	x6, sp, #11
	mad	z27.h, p7/m, z5.h, z3.h
	add	x6, x6, 192
	mla	z27.h, p7/m, z26.h, z16.h
	ldr	z26, [x6]
	addvl	x6, sp, #5
	mla	z27.h, p7/m, z26.h, z25.h
	sub	z29.h, z29.h, #128
	add	x6, x6, 192
	ldr	z26, [x6]
	mad	z26.h, p7/m, z2.h, z3.h
	addvl	x6, sp, #8
	mla	z26.h, p7/m, z24.h, z4.h
	mla	z27.h, p7/m, z15.h, z6.h
	add	x6, x6, 192
	ldr	z22, [x6]
	mla	z26.h, p7/m, z22.h, z1.h
	addvl	x6, sp, #6
	mla	z26.h, p7/m, z29.h, z0.h
	add	z27.h, z27.h, z26.h
	add	x6, x6, 192
	ldr	z26, [x6]
	mad	z26.h, p7/m, z5.h, z3.h
	addvl	x6, sp, #14
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	add	x6, x6, 192
	ldr	z7, [x6]
	mla	z26.h, p7/m, z7.h, z16.h
	addvl	x6, sp, #10
	sub	z12.h, z12.h, #128
	add	x5, x5, x1, lsl 1
	add	x6, x6, 192
	ldr	z7, [x6]
	mla	z26.h, p7/m, z7.h, z25.h
	addvl	x6, sp, #7
	sub	z13.h, z13.h, #128
	add	x8, x8, x1
	add	x6, x6, 192
	ldr	z7, [x6]
	mad	z7.h, p7/m, z6.h, z26.h
	addvl	x6, sp, #4
	add	x7, x3, x0
	sub	z8.h, z8.h, #128
	add	x6, x6, 192
	ldr	z26, [x6]
	mad	z26.h, p7/m, z2.h, z3.h
	add	x6, sp, 192
	ldr	z22, [x6]
	mla	z26.h, p7/m, z22.h, z4.h
	addvl	x6, sp, #13
	mla	z26.h, p7/m, z19.h, z1.h
	mla	z26.h, p7/m, z12.h, z0.h
	add	x6, x6, 192
	add	z26.h, z7.h, z26.h
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	stp	q27, q26, [x24, 16]
	movprfx	z27, z3
	mla	z27.h, p7/m, z17.h, z5.h
	ldr	z17, [x6]
	addvl	x6, sp, #2
	mla	z27.h, p7/m, z17.h, z16.h
	add	x6, x6, 192
	ldr	z17, [x6]
	mla	z27.h, p7/m, z17.h, z25.h
	addvl	x6, sp, #9
	ldr	z17, [x10]
	movprfx	z7, z3
	mla	z7.h, p7/m, z31.h, z2.h
	add	x6, x6, 192
	ldr	z26, [x6]
	mla	z27.h, p7/m, z26.h, z6.h
	addvl	x6, sp, #1
	mla	z7.h, p7/m, z21.h, z4.h
	mad	z30.h, p7/m, z5.h, z3.h
	add	x6, x6, 192
	ldr	z26, [x6]
	mad	z26.h, p7/m, z2.h, z3.h
	mla	z26.h, p7/m, z17.h, z4.h
	mla	z26.h, p7/m, z20.h, z1.h
	mla	z26.h, p7/m, z13.h, z0.h
	add	z27.h, z27.h, z26.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	add	x6, x1, x5
	str	q27, [x24, 48]
	ld1b	z27.h, p7/z, [x1, x5]
	addvl	x5, sp, #6
	sub	z27.h, z27.h, #128
	mla	z30.h, p7/m, z23.h, z16.h
	add	x5, x5, 192
	str	z27, [x5]
	mla	z30.h, p7/m, z18.h, z25.h
	add	x5, x8, 16
	ld1b	z27.h, p7/z, [x4, x5]
	sub	z27.h, z27.h, #128
	addvl	x5, sp, #15
	mla	z30.h, p7/m, z28.h, z6.h
	mla	z7.h, p7/m, z14.h, z1.h
	add	x5, x5, 192
	str	z27, [x5]
	mla	z7.h, p7/m, z8.h, z0.h
	add	x5, x8, 32
	add	z30.h, z30.h, z7.h
	ld1b	z26.h, p7/z, [x4, x5]
	add	x8, x8, 48
	sqrshrunb	z30.b, z30.h, #6
	ld1b	z27.h, p7/z, [x4, x8]
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x7]
	addvl	x7, sp, #5
	add	x7, x7, 192
	ldr	z30, [x7]
	mad	z30.h, p7/m, z5.h, z3.h
	addvl	x7, sp, #8
	mla	z30.h, p7/m, z24.h, z16.h
	sub	z9.h, z9.h, #128
	add	x7, x7, 192
	ldr	z17, [x7]
	mla	z30.h, p7/m, z17.h, z25.h
	addvl	x7, sp, #3
	movprfx	z7, z30
	mla	z7.h, p7/m, z29.h, z6.h
	lsl	x5, x18, 4
	add	x7, x7, 192
	ldr	z30, [x7]
	mad	z30.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #11
	sub	x18, x5, x18
	sub	z10.h, z10.h, #128
	add	x7, x7, 192
	ldr	z17, [x7]
	mla	z30.h, p7/m, z17.h, z4.h
	addvl	x7, sp, #4
	mla	z30.h, p7/m, z15.h, z1.h
	mla	z30.h, p7/m, z9.h, z0.h
	add	x7, x7, 192
	add	z30.h, z7.h, z30.h
	ldr	z7, [x7]
	add	x7, sp, 192
	str	z22, [x7]
	mad	z7.h, p7/m, z5.h, z3.h
	addvl	x7, sp, #14
	mla	z7.h, p7/m, z22.h, z16.h
	add	x18, x2, x18
	add	x7, x7, 192
	ldr	z17, [x7]
	mad	z17.h, p7/m, z2.h, z3.h
	addvl	x7, sp, #10
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	add	x7, x7, 192
	ldr	z22, [x7]
	mla	z17.h, p7/m, z22.h, z4.h
	addvl	x7, sp, #7
	mla	z7.h, p7/m, z19.h, z25.h
	mla	z7.h, p7/m, z12.h, z6.h
	add	x7, x7, 192
	ldr	z22, [x7]
	mla	z17.h, p7/m, z22.h, z1.h
	addvl	x7, sp, #1
	mla	z17.h, p7/m, z10.h, z0.h
	add	z7.h, z7.h, z17.h
	add	x7, x7, 192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	stp	q30, q7, [x18, 16]
	ldr	z30, [x7]
	addvl	x7, sp, #13
	add	x7, x7, 192
	ldr	z22, [x7]
	ldr	z7, [x10]
	addvl	x7, sp, #2
	sub	z11.h, z11.h, #128
	mad	z30.h, p7/m, z5.h, z3.h
	add	x7, x7, 192
	ldr	z17, [x7]
	mla	z30.h, p7/m, z7.h, z16.h
	addvl	x7, sp, #9
	mla	z30.h, p7/m, z20.h, z25.h
	movprfx	z7, z3
	mla	z7.h, p7/m, z22.h, z2.h
	add	x7, x7, 192
	mla	z30.h, p7/m, z13.h, z6.h
	mla	z7.h, p7/m, z17.h, z4.h
	ldr	z17, [x7]
	mla	z7.h, p7/m, z17.h, z1.h
	mla	z7.h, p7/m, z11.h, z0.h
	add	z30.h, z30.h, z7.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x18, 48]
	ld1b	z30.h, p7/z, [x1, x6]
	addvl	x1, sp, #1
	add	x1, x1, 192
	sub	z30.h, z30.h, #128
	str	z30, [x1]
	add	x1, x11, 16
	ld1b	z30.h, p7/z, [x4, x1]
	sub	z30.h, z30.h, #128
	addvl	x1, sp, #4
	add	x0, x0, x3, lsl 1
	mad	z31.h, p7/m, z5.h, z3.h
	add	x1, x1, 192
	str	z30, [x1]
	mla	z31.h, p7/m, z21.h, z16.h
	add	x1, x11, 32
	ld1b	z30.h, p7/z, [x4, x1]
	sub	z30.h, z30.h, #128
	addvl	x1, sp, #5
	add	x11, x11, 48
	mla	z31.h, p7/m, z14.h, z25.h
	add	x1, x1, 192
	str	z30, [x1]
	ld1b	z30.h, p7/z, [x4, x11]
	addvl	x1, sp, #13
	sub	z30.h, z30.h, #128
	mla	z31.h, p7/m, z8.h, z6.h
	add	x1, x1, 192
	str	z30, [x1]
	movprfx	z30, z3
	mla	z30.h, p7/m, z23.h, z2.h
	addvl	x1, sp, #6
	mla	z30.h, p7/m, z18.h, z4.h
	mla	z30.h, p7/m, z28.h, z1.h
	add	x1, x1, 192
	ldr	z7, [x1]
	mla	z30.h, p7/m, z7.h, z0.h
	add	x1, x3, x0
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x3, x0]
	addvl	x0, sp, #3
	add	x0, x0, 192
	ldr	z31, [x0]
	mad	z31.h, p7/m, z5.h, z3.h
	addvl	x0, sp, #11
	sub	z26.h, z26.h, #128
	mad	z23.h, p7/m, z5.h, z3.h
	add	x0, x0, 192
	ldr	z30, [x0]
	mla	z31.h, p7/m, z30.h, z16.h
	addvl	x0, sp, #8
	movprfx	z30, z3
	mla	z30.h, p7/m, z24.h, z2.h
	mla	z31.h, p7/m, z15.h, z25.h
	add	x0, x0, 192
	ldr	z17, [x0]
	mla	z30.h, p7/m, z17.h, z4.h
	addvl	x0, sp, #15
	mla	z30.h, p7/m, z29.h, z1.h
	mla	z31.h, p7/m, z9.h, z6.h
	add	x0, x0, 192
	ldr	z17, [x0]
	mla	z30.h, p7/m, z17.h, z0.h
	addvl	x0, sp, #14
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	add	x0, x0, 192
	ldr	z30, [x0]
	mad	z30.h, p7/m, z5.h, z3.h
	addvl	x0, sp, #10
	uzp1	z31.b, z31.b, z31.b
	mad	z18.h, p7/m, z16.h, z23.h
	add	x0, x0, 192
	ldr	z7, [x0]
	mla	z30.h, p7/m, z7.h, z16.h
	addvl	x0, sp, #7
	sub	z27.h, z27.h, #128
	mad	z28.h, p7/m, z25.h, z18.h
	add	x0, x0, 192
	ldr	z7, [x0]
	mla	z30.h, p7/m, z7.h, z25.h
	add	x0, sp, 192
	ldr	z17, [x0]
	mla	z30.h, p7/m, z10.h, z6.h
	addvl	x0, sp, #2
	movprfx	z7, z3
	mla	z7.h, p7/m, z17.h, z2.h
	mla	z7.h, p7/m, z19.h, z4.h
	add	x0, x0, 192
	mla	z7.h, p7/m, z12.h, z1.h
	mla	z7.h, p7/m, z26.h, z0.h
	add	z30.h, z30.h, z7.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	stp	q31, q30, [x25, 16]
	movprfx	z31, z3
	mla	z31.h, p7/m, z22.h, z5.h
	ldr	z22, [x0]
	addvl	x0, sp, #6
	ldr	z30, [x7]
	mla	z31.h, p7/m, z22.h, z16.h
	add	x0, x0, 192
	ldr	z22, [x10]
	mla	z31.h, p7/m, z30.h, z25.h
	movprfx	z30, z3
	mla	z30.h, p7/m, z22.h, z2.h
	mla	z31.h, p7/m, z11.h, z6.h
	mla	z30.h, p7/m, z20.h, z4.h
	mla	z30.h, p7/m, z13.h, z1.h
	mla	z30.h, p7/m, z27.h, z0.h
	add	z31.h, z31.h, z30.h
	sqrshrunb	z31.b, z31.h, #6
	uzp1	z31.b, z31.b, z31.b
	str	q31, [x25, 48]
	ldr	z23, [x0]
	addvl	x0, sp, #1
	mla	z28.h, p7/m, z23.h, z6.h
	add	x0, x0, 192
	ldr	z23, [x0]
	mad	z21.h, p7/m, z2.h, z3.h
	addvl	x0, sp, #8
	mad	z14.h, p7/m, z4.h, z21.h
	mad	z8.h, p7/m, z1.h, z14.h
	add	x0, x0, 192
	movprfx	z31, z8
	mla	z31.h, p7/m, z23.h, z0.h
	add	z28.h, z28.h, z31.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x1]
	ldr	z28, [x0]
	addvl	x0, sp, #15
	mad	z24.h, p7/m, z5.h, z3.h
	add	x0, x0, 192
	movprfx	z31, z24
	mla	z31.h, p7/m, z28.h, z16.h
	ldr	z28, [x0]
	addvl	x0, sp, #11
	mad	z29.h, p7/m, z25.h, z31.h
	mla	z29.h, p7/m, z28.h, z6.h
	add	x0, x0, 192
	ldr	z31, [x0]
	mad	z31.h, p7/m, z2.h, z3.h
	addvl	x0, sp, #4
	mad	z15.h, p7/m, z4.h, z31.h
	mad	z9.h, p7/m, z1.h, z15.h
	add	x0, x0, 192
	ldr	z30, [x0]
	movprfx	z31, z9
	mla	z31.h, p7/m, z30.h, z0.h
	addvl	x0, sp, #10
	add	z29.h, z29.h, z31.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z17.h, z5.h
	add	x0, x0, 192
	mad	z19.h, p7/m, z16.h, z31.h
	ldr	z31, [x0]
	addvl	x0, sp, #7
	sub	x5, x5, x3
	mad	z31.h, p7/m, z2.h, z3.h
	add	x0, x0, 192
	ldr	z7, [x0]
	add	x2, x2, x5
	addvl	x0, sp, #5
	mla	z31.h, p7/m, z7.h, z4.h
	mad	z10.h, p7/m, z1.h, z31.h
	add	x0, x0, 192
	ldr	z31, [x0]
	mad	z31.h, p7/m, z0.h, z10.h
	addvl	x0, sp, #2
	mad	z12.h, p7/m, z25.h, z19.h
	sqrshrunb	z29.b, z29.h, #6
	add	x0, x0, 192
	mad	z26.h, p7/m, z6.h, z12.h
	uzp1	z29.b, z29.b, z29.b
	add	z26.h, z26.h, z31.h
	movprfx	z31, z3
	mla	z31.h, p7/m, z22.h, z5.h
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	stp	q29, q26, [x2, 16]
	ldr	z22, [x0]
	addvl	x0, sp, #13
	ldr	z17, [x7]
	mad	z20.h, p7/m, z16.h, z31.h
	add	x0, x0, 192
	mad	z13.h, p7/m, z25.h, z20.h
	mad	z22.h, p7/m, z2.h, z3.h
	mad	z27.h, p7/m, z6.h, z13.h
	ldr	z6, [x0]
	mad	z17.h, p7/m, z4.h, z22.h
	mad	z11.h, p7/m, z1.h, z17.h
	mad	z6.h, p7/m, z0.h, z11.h
	add	z27.h, z27.h, z6.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x2, 48]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	ldp	d14, d15, [sp, 144]
	.cfi_remember_state
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
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
	addvl	sp, sp, #21
	.cfi_def_cfa_offset 192
	add	sp, sp, 192
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L4:
	.cfi_restore_state
	movi	d0, #0
	mov	z6.h, #1
	mov	z1.h, #-5
	mov	z25.h, #17
	mov	z4.h, #58
	mov	z16.h, #-10
	mov	z2.h, #4
	mov	z5.b, #-1
	b	.L2
	.cfi_endproc
.LFE3:
	.size	dynopt_interp8_64x48_sve2_vpp, .-dynopt_interp8_64x48_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
