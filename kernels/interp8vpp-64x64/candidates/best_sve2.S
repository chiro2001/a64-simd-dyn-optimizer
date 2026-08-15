	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_64x64_sve2_vpp
	.type	dynopt_interp8_64x64_sve2_vpp, %function
dynopt_interp8_64x64_sve2_vpp:
.LFB3:
	.cfi_startproc
	addvl	sp, sp, #-24
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xc0,0x1e,0x22
	sub	w5, w4, #1
	sub	sp, sp, #240
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xc0,0x1e,0x23,0xf0,0x1,0x22
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
	mov	z24.h, #4
	cmp	w4, 3
	bne	.L7
	mov	z2.h, #-10
	mov	z4.h, #58
	mov	z8.h, #17
	mov	z16.h, #-5
	mov	z3.h, #1
	movi	d26, #0
	b	.L2
	.p2align 2,,3
.L3:
	mov	z0.b, #-1
	mov	z24.h, #4
.L7:
	mov	z2.h, #-11
	mov	z4.h, #40
	mov	z16.d, z2.d
	mov	z8.d, z4.d
	mov	z3.d, z24.d
	mov	z26.d, z0.d
.L2:
	add	x24, x1, x1, lsl 1
	add	x7, x1, 16
	ptrue	p7.b, all
	sub	x4, x0, x24
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
	lsl	x5, x1, 1
	add	x6, x4, x1
	ld1b	z13.h, p7/z, [x4, x1]
	addvl	x7, sp, #13
	ld1b	z10.h, p7/z, [x4]
	sub	z31.h, z31.h, #128
	add	x7, x7, 240
	str	z31, [x7]
	ld1b	z1.h, p7/z, [x6, x1]
	add	x6, x5, 16
	ld1b	z31.h, p7/z, [x4, x6]
	sub	z31.h, z31.h, #128
	addvl	x6, sp, #15
	lsl	x8, x1, 3
	sub	z9.h, z9.h, #128
	add	x6, x6, 240
	str	z31, [x6]
	sub	x11, x8, x1
	add	x6, x5, 32
	add	x5, x5, 48
	ld1b	z31.h, p7/z, [x4, x6]
	addvl	x6, sp, #6
	sub	z31.h, z31.h, #128
	sub	z1.h, z1.h, #128
	add	x6, x6, 240
	str	z31, [x6]
	ld1b	z31.h, p7/z, [x4, x5]
	addvl	x5, sp, #4
	movprfx	z30, z31
	sub	z30.h, z30.h, #128
	lsl	x6, x1, 2
	add	x5, x5, 240
	str	z30, [x5]
	ld1b	z5.h, p7/z, [x0]
	add	x5, x0, 16
	ld1b	z7.h, p7/z, [x5]
	sub	z5.h, z5.h, #128
	add	x5, x0, 32
	ld1b	z6.h, p7/z, [x5]
	add	x0, x0, 48
	addvl	x5, sp, #12
	ld1b	z31.h, p7/z, [x0]
	sub	z31.h, z31.h, #128
	add	x5, x5, 240
	add	x0, sp, 240
	str	z31, [x0]
	ld1b	z31.h, p7/z, [x4, x6]
	sub	z31.h, z31.h, #128
	str	z31, [x5]
	add	x5, x6, 16
	ld1b	z18.h, p7/z, [x4, x5]
	add	x0, x4, x1, lsl 2
	add	x5, x6, 32
	ld1b	z17.h, p7/z, [x4, x5]
	ld1b	z20.h, p7/z, [x0, x1]
	add	x5, x6, 48
	add	x6, x6, x1
	ld1b	z19.h, p7/z, [x4, x5]
	add	x5, x6, 16
	ld1b	z22.h, p7/z, [x4, x5]
	add	x7, x0, x1
	add	x5, x6, 32
	ld1b	z21.h, p7/z, [x4, x5]
	add	x0, x0, x1, lsl 1
	add	x5, x6, 48
	ld1b	z31.h, p7/z, [x4, x5]
	sub	z31.h, z31.h, #128
	addvl	x5, sp, #11
	sub	z20.h, z20.h, #128
	sub	z13.h, z13.h, #128
	add	x5, x5, 240
	str	z31, [x5]
	ld1b	z23.h, p7/z, [x1, x7]
	lsl	x5, x24, 1
	sub	z23.h, z23.h, #128
	sub	z10.h, z10.h, #128
	add	x7, x5, 16
	ld1b	z25.h, p7/z, [x4, x7]
	sub	z22.h, z22.h, #128
	add	x7, x5, 32
	ld1b	z31.h, p7/z, [x4, x7]
	add	x5, x5, 48
	addvl	x7, sp, #10
	sub	z31.h, z31.h, #128
	sub	z25.h, z25.h, #128
	add	x7, x7, 240
	str	z31, [x7]
	ld1b	z31.h, p7/z, [x4, x5]
	add	x7, x11, 16
	addvl	x5, sp, #3
	movprfx	z28, z31
	sub	z28.h, z28.h, #128
	add	x5, x5, 240
	str	z28, [x5]
	ld1b	z29.h, p7/z, [x4, x7]
	addvl	x7, sp, #9
	ld1b	z27.h, p7/z, [x1, x0]
	sub	z29.h, z29.h, #128
	add	x7, x7, 240
	str	z29, [x7]
	add	x5, x1, x0
	add	x7, x11, 32
	ld1b	z28.h, p7/z, [x4, x7]
	sub	z28.h, z28.h, #128
	addvl	x7, sp, #2
	sub	z27.h, z27.h, #128
	sub	z18.h, z18.h, #128
	add	x7, x7, 240
	str	z28, [x7]
	ld1b	z31.h, p7/z, [x1, x5]
	addvl	x5, sp, #5
	add	x7, x11, 48
	sub	z31.h, z31.h, #128
	add	x5, x5, 240
	ld1b	z30.h, p7/z, [x4, x7]
	str	z31, [x5]
	add	x5, x8, 16
	ld1b	z31.h, p7/z, [x4, x5]
	sub	z31.h, z31.h, #128
	addvl	x5, sp, #17
	sub	z7.h, z7.h, #128
	sub	z15.h, z15.h, #128
	add	x5, x5, 240
	str	z31, [x5]
	sub	z21.h, z21.h, #128
	add	x5, x8, 32
	ld1b	z31.h, p7/z, [x4, x5]
	sub	z31.h, z31.h, #128
	addvl	x5, sp, #1
	sub	z6.h, z6.h, #128
	sub	z14.h, z14.h, #128
	add	x5, x5, 240
	str	z31, [x5]
	sub	z12.h, z12.h, #128
	add	x5, x8, 48
	ld1b	z31.h, p7/z, [x4, x5]
	sub	z31.h, z31.h, #128
	addvl	x5, sp, #8
	sub	z17.h, z17.h, #128
	sub	z11.h, z11.h, #128
	add	x5, x5, 240
	str	z31, [x5]
	mov	z31.h, #4096
	addvl	x5, sp, #12
	mad	z9.h, p7/m, z26.h, z31.h
	mad	z10.h, p7/m, z26.h, z31.h
	add	x5, x5, 240
	ldr	z29, [x5]
	mla	z10.h, p7/m, z1.h, z16.h
	addvl	x5, sp, #15
	mla	z10.h, p7/m, z29.h, z4.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z13.h, z3.h
	add	x5, x5, 240
	ldr	z28, [x5]
	mla	z9.h, p7/m, z28.h, z16.h
	addvl	x5, sp, #9
	mla	z29.h, p7/m, z5.h, z8.h
	mla	z10.h, p7/m, z23.h, z24.h
	add	x5, x5, 240
	ldr	z28, [x5]
	mla	z29.h, p7/m, z20.h, z2.h
	addvl	x5, sp, #6
	mla	z29.h, p7/m, z27.h, z0.h
	add	z10.h, z10.h, z29.h
	add	x5, x5, 240
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	mla	z9.h, p7/m, z18.h, z4.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z15.h, z3.h
	mla	z9.h, p7/m, z25.h, z24.h
	mla	z29.h, p7/m, z7.h, z8.h
	mla	z29.h, p7/m, z22.h, z2.h
	mla	z29.h, p7/m, z28.h, z0.h
	add	z9.h, z9.h, z29.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	stp	q10, q9, [x2]
	ldr	z10, [x5]
	addvl	x5, sp, #10
	add	x5, x5, 240
	ldr	z29, [x5]
	mad	z12.h, p7/m, z26.h, z31.h
	addvl	x5, sp, #2
	mla	z12.h, p7/m, z10.h, z16.h
	movprfx	z10, z31
	mla	z10.h, p7/m, z14.h, z3.h
	add	x5, x5, 240
	ldr	z28, [x5]
	mla	z10.h, p7/m, z6.h, z8.h
	addvl	x5, sp, #4
	mla	z10.h, p7/m, z21.h, z2.h
	mla	z10.h, p7/m, z28.h, z0.h
	add	x5, x5, 240
	mla	z12.h, p7/m, z17.h, z4.h
	mla	z12.h, p7/m, z29.h, z24.h
	add	z12.h, z12.h, z10.h
	ldr	z10, [x5]
	addvl	x5, sp, #3
	add	x5, x5, 240
	ldr	z28, [x5]
	mad	z11.h, p7/m, z26.h, z31.h
	addvl	x5, sp, #13
	mla	z11.h, p7/m, z10.h, z16.h
	add	x8, x8, x1
	add	x5, x5, 240
	ldr	z10, [x5]
	sub	z30.h, z30.h, #128
	add	x5, sp, 240
	ldr	z9, [x5]
	sub	z19.h, z19.h, #128
	addvl	x5, sp, #11
	mla	z11.h, p7/m, z19.h, z4.h
	mad	z10.h, p7/m, z3.h, z31.h
	add	x5, x5, 240
	ldr	z29, [x5]
	mla	z10.h, p7/m, z9.h, z8.h
	add	x5, x8, 16
	mla	z11.h, p7/m, z28.h, z24.h
	mla	z10.h, p7/m, z29.h, z2.h
	sqrshrunb	z12.b, z12.h, #6
	mla	z10.h, p7/m, z30.h, z0.h
	uzp1	z12.b, z12.b, z12.b
	add	z11.h, z11.h, z10.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	add	x0, x0, x1, lsl 1
	stp	q12, q11, [x2, 32]
	ld1b	z12.h, p7/z, [x1, x0]
	ld1b	z11.h, p7/z, [x4, x5]
	add	x5, x8, 32
	movprfx	z10, z11
	sub	z10.h, z10.h, #128
	ld1b	z11.h, p7/z, [x4, x5]
	add	x5, x8, 48
	movprfx	z29, z11
	sub	z29.h, z29.h, #128
	ld1b	z11.h, p7/z, [x4, x5]
	addvl	x5, sp, #7
	sub	z11.h, z11.h, #128
	add	x5, x5, 240
	str	z11, [x5]
	addvl	x9, sp, #9
	addvl	x5, sp, #12
	movprfx	z11, z31
	mla	z11.h, p7/m, z1.h, z3.h
	add	x9, x9, 240
	add	x5, x5, 240
	ldr	z9, [x5]
	mla	z11.h, p7/m, z9.h, z8.h
	addvl	x5, sp, #5
	mad	z13.h, p7/m, z26.h, z31.h
	mla	z11.h, p7/m, z23.h, z2.h
	add	x5, x5, 240
	ldr	z9, [x5]
	mla	z13.h, p7/m, z5.h, z16.h
	mla	z11.h, p7/m, z9.h, z0.h
	mla	z13.h, p7/m, z20.h, z4.h
	mla	z13.h, p7/m, z27.h, z24.h
	add	z13.h, z13.h, z11.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x2, x3]
	ldr	z9, [x9]
	addvl	x9, sp, #15
	add	x9, x9, 240
	ldr	z13, [x9]
	mad	z13.h, p7/m, z3.h, z31.h
	addvl	x9, sp, #17
	mla	z13.h, p7/m, z18.h, z8.h
	mla	z13.h, p7/m, z25.h, z2.h
	add	x9, x9, 240
	ldr	z11, [x9]
	mla	z13.h, p7/m, z11.h, z0.h
	addvl	x9, sp, #2
	mad	z15.h, p7/m, z26.h, z31.h
	mla	z15.h, p7/m, z7.h, z16.h
	add	x9, x9, 240
	mla	z15.h, p7/m, z22.h, z4.h
	mla	z15.h, p7/m, z9.h, z24.h
	add	z15.h, z15.h, z13.h
	ldr	z13, [x9]
	addvl	x9, sp, #6
	add	x9, x9, 240
	mad	z14.h, p7/m, z26.h, z31.h
	mla	z14.h, p7/m, z6.h, z16.h
	mla	z14.h, p7/m, z21.h, z4.h
	mla	z14.h, p7/m, z13.h, z24.h
	ldr	z13, [x9]
	addvl	x9, sp, #10
	add	x5, x2, x3
	mad	z13.h, p7/m, z3.h, z31.h
	add	x9, x9, 240
	ldr	z9, [x9]
	mla	z13.h, p7/m, z17.h, z8.h
	addvl	x9, sp, #1
	mla	z13.h, p7/m, z9.h, z2.h
	sqrshrunb	z15.b, z15.h, #6
	add	x9, x9, 240
	ldr	z9, [x9]
	uzp1	z15.b, z15.b, z15.b
	addvl	x9, sp, #13
	mla	z13.h, p7/m, z9.h, z0.h
	add	z14.h, z14.h, z13.h
	add	x9, x9, 240
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	stp	q15, q14, [x5, 16]
	ldr	z15, [x9]
	add	x9, sp, 240
	ldr	z14, [x9]
	addvl	x9, sp, #11
	mad	z15.h, p7/m, z26.h, z31.h
	add	x9, x9, 240
	mla	z15.h, p7/m, z14.h, z16.h
	ldr	z14, [x9]
	addvl	x9, sp, #4
	mla	z15.h, p7/m, z14.h, z4.h
	movprfx	z14, z15
	mla	z14.h, p7/m, z30.h, z24.h
	add	x9, x9, 240
	ldr	z15, [x9]
	lsl	x12, x6, 1
	addvl	x9, sp, #3
	add	x7, x1, x0
	mad	z15.h, p7/m, z3.h, z31.h
	add	x9, x9, 240
	str	z28, [x9]
	mla	z15.h, p7/m, z19.h, z8.h
	addvl	x9, sp, #8
	mla	z15.h, p7/m, z28.h, z2.h
	sub	z12.h, z12.h, #128
	add	x9, x9, 240
	ldr	z13, [x9]
	mla	z15.h, p7/m, z13.h, z0.h
	add	z15.h, z14.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x5, 48]
	ld1b	z14.h, p7/z, [x1, x7]
	add	x7, x12, 16
	ld1b	z15.h, p7/z, [x4, x7]
	add	x7, x12, 32
	ld1b	z13.h, p7/z, [x4, x7]
	addvl	x7, sp, #14
	sub	z13.h, z13.h, #128
	mad	z1.h, p7/m, z26.h, z31.h
	add	x7, x7, 240
	str	z13, [x7]
	addvl	x10, sp, #6
	add	x7, x12, 48
	ld1b	z13.h, p7/z, [x4, x7]
	sub	z13.h, z13.h, #128
	addvl	x7, sp, #13
	add	x10, x10, 240
	sub	z14.h, z14.h, #128
	add	x7, x7, 240
	str	z13, [x7]
	add	x12, x12, x1
	addvl	x7, sp, #12
	add	x0, x0, x1, lsl 1
	sub	z15.h, z15.h, #128
	add	x7, x7, 240
	ldr	z28, [x7]
	mla	z1.h, p7/m, z28.h, z16.h
	addvl	x7, sp, #5
	mla	z1.h, p7/m, z23.h, z4.h
	add	x9, x5, x3
	add	x7, x7, 240
	ldr	z13, [x7]
	mla	z1.h, p7/m, z13.h, z24.h
	addvl	x7, sp, #15
	movprfx	z13, z31
	mla	z13.h, p7/m, z5.h, z3.h
	mla	z13.h, p7/m, z20.h, z8.h
	mla	z13.h, p7/m, z27.h, z2.h
	mla	z13.h, p7/m, z12.h, z0.h
	add	z1.h, z1.h, z13.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	add	x7, x7, 240
	str	q1, [x5, x3]
	ldr	z1, [x7]
	addvl	x7, sp, #9
	movprfx	z13, z31
	mla	z13.h, p7/m, z1.h, z26.h
	mov	z1.d, z11.d
	mla	z13.h, p7/m, z18.h, z16.h
	mla	z13.h, p7/m, z25.h, z4.h
	mad	z11.h, p7/m, z24.h, z13.h
	add	x7, x7, 240
	ldr	z28, [x7]
	movprfx	z13, z31
	mla	z13.h, p7/m, z7.h, z3.h
	mla	z13.h, p7/m, z22.h, z8.h
	mla	z13.h, p7/m, z28.h, z2.h
	mla	z13.h, p7/m, z10.h, z0.h
	add	z13.h, z11.h, z13.h
	ldr	z11, [x10]
	addvl	x10, sp, #10
	mad	z11.h, p7/m, z26.h, z31.h
	add	x10, x10, 240
	ldr	z28, [x10]
	mla	z11.h, p7/m, z17.h, z16.h
	addvl	x10, sp, #1
	mla	z11.h, p7/m, z28.h, z4.h
	add	x7, x2, x3, lsl 1
	add	x10, x10, 240
	str	z9, [x10]
	mad	z9.h, p7/m, z24.h, z11.h
	addvl	x10, sp, #2
	movprfx	z11, z31
	mla	z11.h, p7/m, z6.h, z3.h
	mla	z11.h, p7/m, z21.h, z8.h
	add	x10, x10, 240
	ldr	z28, [x10]
	mla	z11.h, p7/m, z28.h, z2.h
	addvl	x10, sp, #15
	mla	z11.h, p7/m, z29.h, z0.h
	add	z11.h, z9.h, z11.h
	add	x10, x10, 240
	str	z29, [x10]
	sqrshrunb	z11.b, z11.h, #6
	addvl	x10, sp, #4
	uzp1	z11.b, z11.b, z11.b
	sqrshrunb	z13.b, z13.h, #6
	add	x10, x10, 240
	uzp1	z13.b, z13.b, z13.b
	stp	q13, q11, [x7, 16]
	ldr	z11, [x10]
	addvl	x10, sp, #3
	movprfx	z13, z31
	mla	z13.h, p7/m, z11.h, z26.h
	add	x10, x10, 240
	ldr	z11, [x10]
	mla	z13.h, p7/m, z19.h, z16.h
	addvl	x10, sp, #8
	mla	z13.h, p7/m, z11.h, z4.h
	mad	z5.h, p7/m, z26.h, z31.h
	add	x10, x10, 240
	ldr	z11, [x10]
	mad	z11.h, p7/m, z24.h, z13.h
	add	x10, sp, 240
	ldr	z13, [x10]
	mad	z13.h, p7/m, z3.h, z31.h
	addvl	x10, sp, #11
	mla	z5.h, p7/m, z20.h, z16.h
	mla	z5.h, p7/m, z27.h, z4.h
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z13.h, p7/m, z29.h, z8.h
	addvl	x10, sp, #7
	mla	z13.h, p7/m, z30.h, z2.h
	mla	z5.h, p7/m, z12.h, z24.h
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z13.h, p7/m, z29.h, z0.h
	add	z13.h, z11.h, z13.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x7, 48]
	add	x7, x12, 16
	ld1b	z13.h, p7/z, [x4, x7]
	add	x7, x12, 32
	ld1b	z9.h, p7/z, [x4, x7]
	ld1b	z11.h, p7/z, [x1, x0]
	addvl	x7, sp, #6
	sub	z9.h, z9.h, #128
	mad	z7.h, p7/m, z26.h, z31.h
	add	x7, x7, 240
	str	z9, [x7]
	mla	z7.h, p7/m, z22.h, z16.h
	add	x7, x12, 48
	ld1b	z9.h, p7/z, [x4, x7]
	sub	z9.h, z9.h, #128
	addvl	x7, sp, #4
	mad	z6.h, p7/m, z26.h, z31.h
	mla	z6.h, p7/m, z21.h, z16.h
	add	x7, x7, 240
	str	z9, [x7]
	add	x18, x3, x3, lsl 1
	addvl	x7, sp, #12
	add	x10, x1, x0
	sub	z11.h, z11.h, #128
	add	x7, x7, 240
	ldr	z28, [x7]
	movprfx	z9, z31
	mla	z9.h, p7/m, z28.h, z3.h
	addvl	x7, sp, #5
	mla	z9.h, p7/m, z23.h, z8.h
	add	x5, x5, x3, lsl 1
	add	x7, x7, 240
	ldr	z29, [x7]
	mla	z9.h, p7/m, z29.h, z2.h
	mla	z9.h, p7/m, z14.h, z0.h
	add	z5.h, z5.h, z9.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x9]
	addvl	x9, sp, #2
	add	x9, x9, 240
	ldr	z28, [x9]
	mla	z6.h, p7/m, z28.h, z4.h
	addvl	x7, sp, #9
	addvl	x9, sp, #15
	sub	z13.h, z13.h, #128
	add	x7, x7, 240
	ldr	z9, [x7]
	add	x9, x9, 240
	mla	z7.h, p7/m, z9.h, z4.h
	mla	z7.h, p7/m, z10.h, z24.h
	movprfx	z9, z31
	mla	z9.h, p7/m, z18.h, z3.h
	mla	z9.h, p7/m, z25.h, z8.h
	mla	z9.h, p7/m, z1.h, z2.h
	mla	z9.h, p7/m, z15.h, z0.h
	add	z9.h, z7.h, z9.h
	ldr	z7, [x9]
	addvl	x9, sp, #10
	add	x9, x9, 240
	ldr	z28, [x9]
	addvl	x7, sp, #17
	addvl	x9, sp, #1
	add	x7, x7, 240
	str	z1, [x7]
	add	x9, x9, 240
	ldr	z5, [x9]
	add	x7, x2, x18
	addvl	x9, sp, #14
	mla	z6.h, p7/m, z7.h, z24.h
	movprfx	z7, z31
	mla	z7.h, p7/m, z17.h, z3.h
	add	x9, x9, 240
	mla	z7.h, p7/m, z28.h, z8.h
	mla	z7.h, p7/m, z5.h, z2.h
	ldr	z5, [x9]
	add	x9, sp, 240
	mla	z7.h, p7/m, z5.h, z0.h
	sqrshrunb	z9.b, z9.h, #6
	add	z6.h, z6.h, z7.h
	uzp1	z9.b, z9.b, z9.b
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	stp	q9, q6, [x7, 16]
	ldr	z7, [x9]
	addvl	x9, sp, #11
	movprfx	z9, z31
	mla	z9.h, p7/m, z7.h, z26.h
	add	x9, x9, 240
	ldr	z7, [x9]
	mla	z9.h, p7/m, z7.h, z16.h
	addvl	x9, sp, #7
	mla	z9.h, p7/m, z30.h, z4.h
	mad	z17.h, p7/m, z26.h, z31.h
	add	x9, x9, 240
	ldr	z7, [x9]
	mla	z9.h, p7/m, z7.h, z24.h
	addvl	x9, sp, #3
	movprfx	z7, z31
	mla	z7.h, p7/m, z19.h, z3.h
	mad	z18.h, p7/m, z26.h, z31.h
	add	x9, x9, 240
	ldr	z28, [x9]
	mla	z7.h, p7/m, z28.h, z8.h
	addvl	x9, sp, #8
	mla	z18.h, p7/m, z25.h, z16.h
	mad	z19.h, p7/m, z26.h, z31.h
	add	x9, x9, 240
	ldr	z5, [x9]
	mla	z7.h, p7/m, z5.h, z2.h
	addvl	x9, sp, #13
	add	x0, x0, x1, lsl 1
	add	x9, x9, 240
	ldr	z6, [x9]
	mla	z7.h, p7/m, z6.h, z0.h
	lsl	x9, x24, 2
	add	z9.h, z9.h, z7.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x7, 48]
	add	x7, x9, 16
	ld1b	z9.h, p7/z, [x4, x7]
	add	x7, x9, 32
	ld1b	z6.h, p7/z, [x4, x7]
	add	x7, x9, 48
	movprfx	z5, z6
	sub	z5.h, z5.h, #128
	ld1b	z6.h, p7/z, [x4, x7]
	add	x7, sp, 240
	ld1b	z7.h, p7/z, [x1, x10]
	sub	z6.h, z6.h, #128
	str	z6, [x7]
	addvl	x7, sp, #12
	addvl	x10, sp, #10
	add	x7, x7, 240
	ldr	z1, [x7]
	add	x10, x10, 240
	addvl	x7, sp, #5
	movprfx	z6, z31
	mla	z6.h, p7/m, z1.h, z26.h
	mla	z6.h, p7/m, z23.h, z16.h
	add	x7, x7, 240
	mla	z6.h, p7/m, z29.h, z4.h
	str	z29, [x7]
	movprfx	z1, z6
	mla	z1.h, p7/m, z14.h, z24.h
	movprfx	z6, z31
	mla	z6.h, p7/m, z20.h, z3.h
	mla	z6.h, p7/m, z27.h, z8.h
	mla	z6.h, p7/m, z12.h, z2.h
	mla	z6.h, p7/m, z11.h, z0.h
	add	z6.h, z1.h, z6.h
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x3, x5]
	ldr	z28, [x10]
	addvl	x10, sp, #1
	mla	z17.h, p7/m, z28.h, z16.h
	add	x10, x10, 240
	ldr	z1, [x10]
	mla	z17.h, p7/m, z1.h, z4.h
	addvl	x10, sp, #14
	addvl	x7, sp, #17
	sub	z7.h, z7.h, #128
	add	x10, x10, 240
	ldr	z1, [x10]
	add	x7, x7, 240
	addvl	x10, sp, #2
	ldr	z6, [x7]
	addvl	x7, sp, #9
	add	x10, x10, 240
	ldr	z28, [x10]
	mla	z17.h, p7/m, z1.h, z24.h
	addvl	x10, sp, #15
	add	x7, x7, 240
	ldr	z29, [x7]
	add	x10, x10, 240
	ldr	z1, [x10]
	add	x7, x2, x3, lsl 2
	addvl	x10, sp, #6
	mla	z18.h, p7/m, z6.h, z4.h
	movprfx	z6, z31
	mla	z6.h, p7/m, z22.h, z3.h
	add	x10, x10, 240
	mla	z6.h, p7/m, z29.h, z8.h
	mla	z6.h, p7/m, z10.h, z2.h
	mla	z6.h, p7/m, z13.h, z0.h
	mla	z18.h, p7/m, z15.h, z24.h
	add	z18.h, z18.h, z6.h
	movprfx	z6, z31
	mla	z6.h, p7/m, z21.h, z3.h
	mla	z6.h, p7/m, z28.h, z8.h
	ldr	z28, [x10]
	addvl	x10, sp, #3
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	add	x10, x10, 240
	mla	z6.h, p7/m, z1.h, z2.h
	mla	z6.h, p7/m, z28.h, z0.h
	add	z17.h, z17.h, z6.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	stp	q18, q17, [x7, 16]
	ldr	z18, [x10]
	addvl	x10, sp, #8
	add	x10, x10, 240
	mla	z19.h, p7/m, z18.h, z16.h
	ldr	z18, [x10]
	addvl	x10, sp, #13
	mla	z19.h, p7/m, z18.h, z4.h
	add	x9, x9, x1
	add	x10, x10, 240
	ldr	z17, [x10]
	mla	z19.h, p7/m, z17.h, z24.h
	addvl	x10, sp, #11
	add	x14, x3, x5
	mad	z20.h, p7/m, z26.h, z31.h
	add	x10, x10, 240
	ldr	z18, [x10]
	mad	z18.h, p7/m, z3.h, z31.h
	addvl	x10, sp, #7
	mla	z18.h, p7/m, z30.h, z8.h
	mla	z20.h, p7/m, z27.h, z16.h
	add	x10, x10, 240
	ldr	z17, [x10]
	mla	z18.h, p7/m, z17.h, z2.h
	addvl	x10, sp, #4
	mla	z20.h, p7/m, z12.h, z4.h
	mla	z20.h, p7/m, z11.h, z24.h
	add	x10, x10, 240
	ldr	z17, [x10]
	mla	z18.h, p7/m, z17.h, z0.h
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x7, 48]
	add	x7, x9, 16
	ld1b	z18.h, p7/z, [x1, x0]
	ld1b	z19.h, p7/z, [x4, x7]
	addvl	x7, sp, #12
	sub	z19.h, z19.h, #128
	add	x7, x7, 240
	str	z19, [x7]
	sub	z9.h, z9.h, #128
	add	x7, x9, 32
	ld1b	z17.h, p7/z, [x4, x7]
	sub	z17.h, z17.h, #128
	addvl	x7, sp, #16
	mad	z22.h, p7/m, z26.h, z31.h
	add	x13, x3, x3, lsl 2
	add	x7, x7, 240
	str	z17, [x7]
	mad	z21.h, p7/m, z26.h, z31.h
	add	x7, x9, 48
	ld1b	z17.h, p7/z, [x4, x7]
	movprfx	z1, z17
	sub	z1.h, z1.h, #128
	addvl	x7, sp, #5
	movprfx	z17, z31
	mla	z17.h, p7/m, z23.h, z3.h
	add	x10, x1, x0
	add	x7, x7, 240
	ldr	z29, [x7]
	mla	z17.h, p7/m, z29.h, z8.h
	addvl	x7, sp, #9
	mla	z17.h, p7/m, z14.h, z2.h
	mla	z17.h, p7/m, z7.h, z0.h
	add	x7, x7, 240
	add	z20.h, z20.h, z17.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x14]
	ldr	z17, [x7]
	addvl	x14, sp, #2
	movprfx	z20, z31
	mla	z20.h, p7/m, z25.h, z3.h
	mla	z22.h, p7/m, z17.h, z16.h
	addvl	x7, sp, #17
	add	x14, x14, 240
	mla	z22.h, p7/m, z10.h, z4.h
	add	x7, x7, 240
	ldr	z6, [x7]
	mla	z20.h, p7/m, z6.h, z8.h
	mla	z20.h, p7/m, z15.h, z2.h
	mla	z20.h, p7/m, z9.h, z0.h
	mla	z22.h, p7/m, z13.h, z24.h
	add	z22.h, z22.h, z20.h
	ldr	z20, [x14]
	addvl	x14, sp, #15
	add	x14, x14, 240
	ldr	z17, [x14]
	mla	z21.h, p7/m, z20.h, z16.h
	addvl	x14, sp, #6
	mla	z21.h, p7/m, z17.h, z4.h
	add	x7, x2, x13
	add	x14, x14, 240
	str	z28, [x14]
	sqrshrunb	z22.b, z22.h, #6
	addvl	x14, sp, #10
	uzp1	z22.b, z22.b, z22.b
	mla	z21.h, p7/m, z28.h, z24.h
	add	x14, x14, 240
	ldr	z19, [x14]
	movprfx	z20, z31
	mla	z20.h, p7/m, z19.h, z3.h
	addvl	x14, sp, #1
	add	x5, x5, x3, lsl 1
	sub	z18.h, z18.h, #128
	add	x14, x14, 240
	ldr	z17, [x14]
	mla	z20.h, p7/m, z17.h, z8.h
	addvl	x14, sp, #14
	mad	z23.h, p7/m, z26.h, z31.h
	mad	z25.h, p7/m, z26.h, z31.h
	add	x14, x14, 240
	ldr	z29, [x14]
	mla	z20.h, p7/m, z29.h, z2.h
	addvl	x14, sp, #11
	mla	z20.h, p7/m, z5.h, z0.h
	add	z21.h, z21.h, z20.h
	add	x14, x14, 240
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x7, 16]
	ldr	z22, [x14]
	addvl	x14, sp, #7
	add	x14, x14, 240
	ldr	z21, [x14]
	mad	z22.h, p7/m, z26.h, z31.h
	addvl	x14, sp, #4
	mla	z22.h, p7/m, z30.h, z16.h
	mla	z22.h, p7/m, z21.h, z4.h
	add	x14, x14, 240
	ldr	z21, [x14]
	mla	z22.h, p7/m, z21.h, z24.h
	addvl	x14, sp, #3
	mla	z25.h, p7/m, z6.h, z16.h
	mla	z25.h, p7/m, z15.h, z4.h
	add	x14, x14, 240
	ldr	z28, [x14]
	movprfx	z21, z31
	mla	z21.h, p7/m, z28.h, z3.h
	addvl	x14, sp, #8
	mla	z25.h, p7/m, z9.h, z24.h
	addvl	x16, sp, #17
	add	x14, x14, 240
	ldr	z20, [x14]
	mla	z21.h, p7/m, z20.h, z8.h
	addvl	x14, sp, #13
	add	x16, x16, 240
	add	x14, x14, 240
	ldr	z20, [x14]
	mla	z21.h, p7/m, z20.h, z2.h
	add	x14, sp, 240
	ldr	z20, [x14]
	mla	z21.h, p7/m, z20.h, z0.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x7, 48]
	lsl	x7, x11, 1
	ld1b	z20.h, p7/z, [x1, x10]
	add	x10, x7, 16
	ld1b	z22.h, p7/z, [x4, x10]
	sub	z20.h, z20.h, #128
	add	x10, x7, 32
	add	x7, x7, 48
	ld1b	z17.h, p7/z, [x4, x7]
	addvl	x7, sp, #18
	ld1b	z21.h, p7/z, [x4, x10]
	movprfx	z29, z17
	sub	z29.h, z29.h, #128
	add	x7, x7, 240
	str	z29, [x7]
	movprfx	z17, z31
	mla	z17.h, p7/m, z27.h, z3.h
	addvl	x7, sp, #5
	mla	z17.h, p7/m, z12.h, z8.h
	addvl	x10, sp, #1
	add	x7, x7, 240
	ldr	z29, [x7]
	mla	z17.h, p7/m, z11.h, z2.h
	addvl	x7, sp, #9
	mla	z23.h, p7/m, z29.h, z16.h
	mla	z17.h, p7/m, z18.h, z0.h
	mla	z23.h, p7/m, z14.h, z4.h
	add	x7, x7, 240
	mla	z23.h, p7/m, z7.h, z24.h
	add	z23.h, z23.h, z17.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	add	x10, x10, 240
	str	q23, [x3, x5]
	ldr	z23, [x7]
	addvl	x7, sp, #12
	mad	z23.h, p7/m, z3.h, z31.h
	mla	z23.h, p7/m, z10.h, z8.h
	add	x7, x7, 240
	ldr	z29, [x7]
	ldr	z17, [x10]
	addvl	x10, sp, #14
	mla	z23.h, p7/m, z13.h, z2.h
	mla	z23.h, p7/m, z29.h, z0.h
	add	x10, x10, 240
	ldr	z29, [x10]
	add	z25.h, z25.h, z23.h
	addvl	x10, sp, #2
	movprfx	z23, z31
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z23.h, p7/m, z17.h, z16.h
	add	x10, x10, 240
	mla	z23.h, p7/m, z29.h, z4.h
	movprfx	z17, z23
	mla	z17.h, p7/m, z5.h, z24.h
	ldr	z23, [x10]
	addvl	x10, sp, #15
	mad	z23.h, p7/m, z3.h, z31.h
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z23.h, p7/m, z29.h, z8.h
	addvl	x10, sp, #6
	add	x7, x2, x18, lsl 1
	sqrshrunb	z25.b, z25.h, #6
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z23.h, p7/m, z29.h, z2.h
	addvl	x10, sp, #16
	uzp1	z25.b, z25.b, z25.b
	add	x0, x0, x1, lsl 1
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z23.h, p7/m, z29.h, z0.h
	addvl	x10, sp, #8
	add	z23.h, z17.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	add	x10, x10, 240
	uzp1	z23.b, z23.b, z23.b
	stp	q25, q23, [x7, 16]
	ldr	z23, [x10]
	addvl	x10, sp, #13
	movprfx	z25, z31
	mla	z25.h, p7/m, z28.h, z26.h
	add	x10, x10, 240
	mla	z25.h, p7/m, z23.h, z16.h
	ldr	z23, [x10]
	add	x10, sp, 240
	mla	z25.h, p7/m, z23.h, z4.h
	ldr	z23, [x10]
	addvl	x10, sp, #7
	mad	z23.h, p7/m, z24.h, z25.h
	movprfx	z25, z31
	mla	z25.h, p7/m, z30.h, z3.h
	add	x10, x10, 240
	ldr	z17, [x10]
	mla	z25.h, p7/m, z17.h, z8.h
	addvl	x10, sp, #4
	add	x14, x3, x5
	mad	z27.h, p7/m, z26.h, z31.h
	add	x10, x10, 240
	ldr	z19, [x10]
	mla	z25.h, p7/m, z19.h, z2.h
	mla	z25.h, p7/m, z1.h, z0.h
	add	z25.h, z23.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x7, 48]
	lsl	x7, x1, 4
	sub	x10, x7, x1
	ld1b	z25.h, p7/z, [x1, x0]
	sub	z25.h, z25.h, #128
	str	z25, [x16]
	add	x16, x10, 16
	ld1b	z25.h, p7/z, [x4, x16]
	addvl	x16, sp, #11
	sub	z25.h, z25.h, #128
	mla	z27.h, p7/m, z12.h, z16.h
	add	x16, x16, 240
	str	z25, [x16]
	mla	z27.h, p7/m, z11.h, z4.h
	add	x16, x10, 32
	ld1b	z25.h, p7/z, [x4, x16]
	sub	z25.h, z25.h, #128
	addvl	x16, sp, #19
	mla	z27.h, p7/m, z18.h, z24.h
	sub	z22.h, z22.h, #128
	add	x16, x16, 240
	str	z25, [x16]
	lsl	x30, x3, 3
	add	x16, x10, 48
	ld1b	z23.h, p7/z, [x4, x16]
	sub	z23.h, z23.h, #128
	addvl	x16, sp, #3
	sub	x20, x30, x3
	sub	z21.h, z21.h, #128
	add	x16, x16, 240
	str	z23, [x16]
	mad	z30.h, p7/m, z26.h, z31.h
	addvl	x16, sp, #5
	add	x15, x1, x0
	add	x16, x16, 240
	ldr	z29, [x16]
	movprfx	z23, z31
	mla	z23.h, p7/m, z29.h, z3.h
	mla	z23.h, p7/m, z14.h, z8.h
	mla	z23.h, p7/m, z7.h, z2.h
	mla	z23.h, p7/m, z20.h, z0.h
	add	z27.h, z27.h, z23.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x14]
	addvl	x14, sp, #9
	movprfx	z27, z31
	mla	z27.h, p7/m, z6.h, z3.h
	add	x14, x14, 240
	ldr	z29, [x14]
	mad	z29.h, p7/m, z26.h, z31.h
	addvl	x14, sp, #12
	addvl	x16, sp, #2
	mla	z29.h, p7/m, z10.h, z16.h
	add	x14, x14, 240
	ldr	z28, [x14]
	add	x16, x16, 240
	mla	z29.h, p7/m, z13.h, z4.h
	mla	z29.h, p7/m, z28.h, z24.h
	ldr	z28, [x16]
	addvl	x16, sp, #15
	mla	z27.h, p7/m, z15.h, z8.h
	mla	z27.h, p7/m, z9.h, z2.h
	add	x16, x16, 240
	mla	z27.h, p7/m, z22.h, z0.h
	add	z29.h, z29.h, z27.h
	ldr	z27, [x16]
	addvl	x16, sp, #6
	mad	z28.h, p7/m, z26.h, z31.h
	add	x16, x16, 240
	mla	z28.h, p7/m, z27.h, z16.h
	ldr	z27, [x16]
	addvl	x16, sp, #16
	mla	z28.h, p7/m, z27.h, z4.h
	add	x14, x2, x20
	add	x16, x16, 240
	ldr	z27, [x16]
	mla	z28.h, p7/m, z27.h, z24.h
	addvl	x16, sp, #1
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	add	x16, x16, 240
	ldr	z17, [x16]
	movprfx	z27, z31
	mla	z27.h, p7/m, z17.h, z3.h
	addvl	x16, sp, #14
	add	x5, x5, x3, lsl 1
	add	x16, x16, 240
	ldr	z23, [x16]
	mla	z27.h, p7/m, z23.h, z8.h
	addvl	x16, sp, #7
	mla	z27.h, p7/m, z5.h, z2.h
	mla	z27.h, p7/m, z21.h, z0.h
	add	x16, x16, 240
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	stp	q29, q28, [x14, 16]
	movprfx	z23, z31
	mla	z23.h, p7/m, z12.h, z3.h
	ldr	z28, [x16]
	addvl	x16, sp, #4
	mla	z30.h, p7/m, z28.h, z16.h
	add	x16, x16, 240
	str	z19, [x16]
	mla	z30.h, p7/m, z19.h, z4.h
	addvl	x16, sp, #8
	mla	z30.h, p7/m, z1.h, z24.h
	mla	z23.h, p7/m, z11.h, z8.h
	add	x16, x16, 240
	ldr	z29, [x16]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x16, sp, #13
	mla	z23.h, p7/m, z18.h, z2.h
	add	x0, x0, x1, lsl 1
	add	x16, x16, 240
	ldr	z28, [x16]
	mla	z29.h, p7/m, z28.h, z8.h
	add	x16, sp, 240
	ldr	z19, [x16]
	mla	z29.h, p7/m, z19.h, z2.h
	addvl	x16, sp, #18
	mad	z12.h, p7/m, z26.h, z31.h
	mla	z12.h, p7/m, z11.h, z16.h
	add	x16, x16, 240
	ldr	z25, [x16]
	mla	z29.h, p7/m, z25.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x14, 48]
	add	x14, x7, 16
	ld1b	z30.h, p7/z, [x4, x14]
	addvl	x14, sp, #10
	ld1b	z28.h, p7/z, [x1, x15]
	sub	z30.h, z30.h, #128
	add	x14, x14, 240
	str	z30, [x14]
	addvl	x15, sp, #14
	add	x14, x7, 32
	ld1b	z29.h, p7/z, [x4, x14]
	sub	z29.h, z29.h, #128
	addvl	x14, sp, #2
	add	x15, x15, 240
	sub	z28.h, z28.h, #128
	add	x14, x14, 240
	str	z29, [x14]
	add	x16, x3, x5
	add	x14, x7, 48
	ld1b	z27.h, p7/z, [x4, x14]
	movprfx	z30, z27
	sub	z30.h, z30.h, #128
	addvl	x14, sp, #1
	add	x7, x7, x1
	mla	z12.h, p7/m, z18.h, z4.h
	add	x14, x14, 240
	str	z30, [x14]
	lsl	x17, x8, 1
	addvl	x14, sp, #5
	add	x21, x3, x13, lsl 1
	add	x14, x14, 240
	ldr	z30, [x14]
	movprfx	z27, z31
	mla	z27.h, p7/m, z30.h, z26.h
	addvl	x14, sp, #17
	mla	z27.h, p7/m, z14.h, z16.h
	mla	z27.h, p7/m, z7.h, z4.h
	add	x14, x14, 240
	ldr	z29, [x14]
	mla	z27.h, p7/m, z20.h, z24.h
	addvl	x14, sp, #12
	mla	z23.h, p7/m, z29.h, z0.h
	add	z27.h, z27.h, z23.h
	add	x14, x14, 240
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x5]
	movprfx	z27, z31
	mla	z27.h, p7/m, z6.h, z26.h
	ldr	z6, [x14]
	addvl	x14, sp, #11
	movprfx	z23, z31
	mla	z23.h, p7/m, z10.h, z3.h
	mla	z23.h, p7/m, z13.h, z8.h
	add	x14, x14, 240
	mla	z23.h, p7/m, z6.h, z2.h
	ldr	z6, [x14]
	mla	z23.h, p7/m, z6.h, z0.h
	ldr	z6, [x15]
	addvl	x15, sp, #15
	add	x15, x15, 240
	ldr	z30, [x15]
	mla	z27.h, p7/m, z15.h, z16.h
	addvl	x15, sp, #6
	mla	z27.h, p7/m, z9.h, z4.h
	mla	z27.h, p7/m, z22.h, z24.h
	add	x15, x15, 240
	add	z27.h, z27.h, z23.h
	movprfx	z23, z31
	mla	z23.h, p7/m, z17.h, z26.h
	mla	z23.h, p7/m, z6.h, z16.h
	ldr	z6, [x15]
	addvl	x15, sp, #16
	add	x15, x15, 240
	movprfx	z17, z31
	mla	z17.h, p7/m, z30.h, z3.h
	mla	z17.h, p7/m, z6.h, z8.h
	ldr	z6, [x15]
	addvl	x15, sp, #19
	add	x14, x2, x30
	add	x15, x15, 240
	mla	z17.h, p7/m, z6.h, z2.h
	ldr	z6, [x15]
	addvl	x15, sp, #8
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	add	x15, x15, 240
	mla	z17.h, p7/m, z6.h, z0.h
	mla	z23.h, p7/m, z5.h, z4.h
	mla	z23.h, p7/m, z21.h, z24.h
	add	z23.h, z23.h, z17.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	stp	q27, q23, [x14, 16]
	ldr	z27, [x15]
	addvl	x15, sp, #13
	mad	z27.h, p7/m, z26.h, z31.h
	mla	z12.h, p7/m, z29.h, z24.h
	add	x15, x15, 240
	ldr	z6, [x15]
	mla	z27.h, p7/m, z6.h, z16.h
	add	x15, sp, 240
	str	z19, [x15]
	mla	z27.h, p7/m, z19.h, z4.h
	addvl	x15, sp, #7
	mla	z27.h, p7/m, z25.h, z24.h
	mad	z10.h, p7/m, z26.h, z31.h
	add	x15, x15, 240
	ldr	z17, [x15]
	movprfx	z23, z31
	mla	z23.h, p7/m, z17.h, z3.h
	addvl	x15, sp, #4
	mla	z10.h, p7/m, z13.h, z16.h
	add	x30, x30, x3
	add	x15, x15, 240
	ldr	z17, [x15]
	mla	z23.h, p7/m, z17.h, z8.h
	addvl	x15, sp, #3
	mla	z23.h, p7/m, z1.h, z2.h
	add	x5, x5, x3, lsl 1
	add	x15, x15, 240
	ldr	z19, [x15]
	mla	z23.h, p7/m, z19.h, z0.h
	add	z27.h, z27.h, z23.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x14, 48]
	add	x14, x7, 16
	ld1b	z17.h, p7/z, [x1, x0]
	ld1b	z27.h, p7/z, [x4, x14]
	addvl	x14, sp, #9
	sub	z27.h, z27.h, #128
	add	x14, x14, 240
	str	z27, [x14]
	add	x15, x1, x0
	add	x14, x7, 32
	ld1b	z23.h, p7/z, [x4, x14]
	sub	z17.h, z17.h, #128
	add	x14, x7, 48
	ld1b	z6.h, p7/z, [x4, x14]
	sub	z6.h, z6.h, #128
	addvl	x14, sp, #8
	sub	z23.h, z23.h, #128
	add	x0, x0, x1, lsl 1
	add	x14, x14, 240
	str	z6, [x14]
	movprfx	z6, z31
	mla	z6.h, p7/m, z14.h, z3.h
	addvl	x14, sp, #12
	mla	z6.h, p7/m, z7.h, z8.h
	mla	z6.h, p7/m, z20.h, z2.h
	add	x14, x14, 240
	mla	z6.h, p7/m, z28.h, z0.h
	add	z12.h, z12.h, z6.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x16]
	ldr	z12, [x14]
	addvl	x14, sp, #11
	mla	z10.h, p7/m, z12.h, z4.h
	add	x14, x14, 240
	addvl	x16, sp, #6
	ldr	z12, [x14]
	add	x16, x16, 240
	mla	z10.h, p7/m, z12.h, z24.h
	addvl	x14, sp, #10
	movprfx	z12, z31
	mla	z12.h, p7/m, z15.h, z3.h
	add	x14, x14, 240
	ldr	z27, [x14]
	mla	z12.h, p7/m, z9.h, z8.h
	mla	z12.h, p7/m, z22.h, z2.h
	mla	z12.h, p7/m, z27.h, z0.h
	add	z12.h, z10.h, z12.h
	movprfx	z10, z31
	mla	z10.h, p7/m, z30.h, z26.h
	ldr	z30, [x16]
	addvl	x16, sp, #16
	mla	z10.h, p7/m, z30.h, z16.h
	add	x14, x2, x30
	add	x16, x16, 240
	ldr	z30, [x16]
	mla	z10.h, p7/m, z30.h, z4.h
	addvl	x16, sp, #19
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	add	x16, x16, 240
	ldr	z6, [x16]
	mad	z6.h, p7/m, z24.h, z10.h
	addvl	x16, sp, #14
	mad	z14.h, p7/m, z26.h, z31.h
	mla	z14.h, p7/m, z7.h, z16.h
	add	x16, x16, 240
	ldr	z30, [x16]
	movprfx	z10, z31
	mla	z10.h, p7/m, z30.h, z3.h
	addvl	x16, sp, #2
	mla	z10.h, p7/m, z5.h, z8.h
	mla	z10.h, p7/m, z21.h, z2.h
	add	x16, x16, 240
	ldr	z27, [x16]
	mla	z10.h, p7/m, z27.h, z0.h
	addvl	x16, sp, #7
	add	z10.h, z6.h, z10.h
	sqrshrunb	z10.b, z10.h, #6
	add	x16, x16, 240
	uzp1	z10.b, z10.b, z10.b
	stp	q12, q10, [x14, 16]
	ldr	z12, [x16]
	addvl	x16, sp, #4
	mad	z12.h, p7/m, z26.h, z31.h
	add	x16, x16, 240
	ldr	z10, [x16]
	mla	z12.h, p7/m, z10.h, z16.h
	addvl	x16, sp, #3
	mla	z12.h, p7/m, z1.h, z4.h
	mla	z12.h, p7/m, z19.h, z24.h
	add	x16, x16, 240
	str	z19, [x16]
	mla	z14.h, p7/m, z20.h, z4.h
	addvl	x16, sp, #13
	mla	z14.h, p7/m, z28.h, z24.h
	mad	z15.h, p7/m, z26.h, z31.h
	add	x16, x16, 240
	ldr	z10, [x16]
	mad	z10.h, p7/m, z3.h, z31.h
	add	x16, sp, 240
	ldr	z6, [x16]
	mla	z10.h, p7/m, z6.h, z8.h
	addvl	x16, sp, #18
	mla	z10.h, p7/m, z25.h, z2.h
	mla	z15.h, p7/m, z9.h, z16.h
	add	x16, x16, 240
	str	z25, [x16]
	mla	z15.h, p7/m, z22.h, z4.h
	addvl	x16, sp, #1
	add	x28, x3, x18, lsl 2
	add	x16, x16, 240
	ldr	z19, [x16]
	mla	z10.h, p7/m, z19.h, z0.h
	add	z12.h, z12.h, z10.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x14, 48]
	addvl	x14, sp, #7
	ld1b	z12.h, p7/z, [x1, x15]
	add	x14, x14, 240
	sub	z12.h, z12.h, #128
	str	z12, [x14]
	add	x14, x17, 16
	ld1b	z12.h, p7/z, [x4, x14]
	addvl	x16, sp, #2
	add	x14, x17, 32
	ld1b	z10.h, p7/z, [x4, x14]
	add	x16, x16, 240
	add	x14, x17, 48
	ld1b	z6.h, p7/z, [x4, x14]
	sub	z6.h, z6.h, #128
	addvl	x14, sp, #15
	add	x17, x17, x1
	sub	z12.h, z12.h, #128
	add	x14, x14, 240
	str	z6, [x14]
	movprfx	z6, z31
	mla	z6.h, p7/m, z11.h, z3.h
	addvl	x14, sp, #10
	mla	z6.h, p7/m, z18.h, z8.h
	mla	z6.h, p7/m, z29.h, z2.h
	add	x14, x14, 240
	mla	z6.h, p7/m, z17.h, z0.h
	add	z14.h, z14.h, z6.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x3, x5]
	ldr	z25, [x14]
	addvl	x14, sp, #12
	mla	z15.h, p7/m, z25.h, z24.h
	add	x14, x14, 240
	ldr	z25, [x14]
	movprfx	z14, z31
	mla	z14.h, p7/m, z13.h, z3.h
	addvl	x14, sp, #11
	mla	z14.h, p7/m, z25.h, z8.h
	str	z27, [x16]
	add	x14, x14, 240
	ldr	z25, [x14]
	addvl	x16, sp, #6
	addvl	x14, sp, #9
	mla	z14.h, p7/m, z25.h, z2.h
	add	x16, x16, 240
	add	x14, x14, 240
	ldr	z25, [x14]
	mla	z14.h, p7/m, z25.h, z0.h
	add	z15.h, z15.h, z14.h
	movprfx	z14, z31
	mla	z14.h, p7/m, z30.h, z26.h
	ldr	z30, [x16]
	addvl	x16, sp, #16
	add	x14, x2, x13, lsl 1
	mla	z14.h, p7/m, z5.h, z16.h
	add	x16, x16, 240
	ldr	z25, [x16]
	mla	z14.h, p7/m, z21.h, z4.h
	addvl	x16, sp, #19
	movprfx	z6, z14
	mla	z6.h, p7/m, z27.h, z24.h
	sqrshrunb	z15.b, z15.h, #6
	add	x16, x16, 240
	ldr	z27, [x16]
	uzp1	z15.b, z15.b, z15.b
	addvl	x16, sp, #13
	movprfx	z14, z31
	mla	z14.h, p7/m, z30.h, z3.h
	mla	z14.h, p7/m, z25.h, z8.h
	add	x16, x16, 240
	mla	z14.h, p7/m, z27.h, z2.h
	mla	z14.h, p7/m, z23.h, z0.h
	add	z14.h, z6.h, z14.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	stp	q15, q14, [x14, 16]
	ldr	z15, [x16]
	add	x16, sp, 240
	ldr	z6, [x16]
	addvl	x16, sp, #18
	mad	z15.h, p7/m, z26.h, z31.h
	add	x16, x16, 240
	ldr	z14, [x16]
	mla	z15.h, p7/m, z6.h, z16.h
	addvl	x16, sp, #1
	mla	z15.h, p7/m, z14.h, z4.h
	mla	z15.h, p7/m, z19.h, z24.h
	add	x16, x16, 240
	str	z19, [x16]
	add	x15, x3, x5
	addvl	x16, sp, #4
	mad	z11.h, p7/m, z26.h, z31.h
	mla	z11.h, p7/m, z18.h, z16.h
	add	x16, x16, 240
	ldr	z14, [x16]
	mad	z14.h, p7/m, z3.h, z31.h
	addvl	x16, sp, #3
	mla	z14.h, p7/m, z1.h, z8.h
	mla	z11.h, p7/m, z29.h, z4.h
	add	x16, x16, 240
	ldr	z6, [x16]
	mla	z14.h, p7/m, z6.h, z2.h
	addvl	x16, sp, #8
	mla	z11.h, p7/m, z17.h, z24.h
	mad	z13.h, p7/m, z26.h, z31.h
	add	x16, x16, 240
	ldr	z6, [x16]
	mla	z14.h, p7/m, z6.h, z0.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x14, 48]
	add	x14, x17, 16
	ld1b	z15.h, p7/z, [x4, x14]
	add	x14, x17, 32
	ld1b	z14.h, p7/z, [x4, x14]
	ld1b	z6.h, p7/z, [x1, x0]
	add	x14, x17, 48
	ld1b	z19.h, p7/z, [x4, x14]
	sub	z10.h, z10.h, #128
	addvl	x14, sp, #17
	add	x16, x1, x0
	sub	z6.h, z6.h, #128
	add	x14, x14, 240
	str	z29, [x14]
	movprfx	z29, z31
	mla	z29.h, p7/m, z7.h, z3.h
	addvl	x14, sp, #7
	mla	z29.h, p7/m, z20.h, z8.h
	mla	z29.h, p7/m, z28.h, z2.h
	add	x14, x14, 240
	ldr	z25, [x14]
	mla	z29.h, p7/m, z25.h, z0.h
	addvl	x14, sp, #12
	add	z11.h, z11.h, z29.h
	sqrshrunb	z11.b, z11.h, #6
	add	x14, x14, 240
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x3, x15]
	ldr	z11, [x14]
	addvl	x14, sp, #11
	mla	z13.h, p7/m, z11.h, z16.h
	add	x14, x14, 240
	ldr	z11, [x14]
	addvl	x15, sp, #16
	addvl	x14, sp, #9
	add	x15, x15, 240
	ldr	z25, [x15]
	add	x14, x14, 240
	ldr	z29, [x14]
	addvl	x15, sp, #2
	addvl	x14, sp, #10
	mla	z13.h, p7/m, z11.h, z4.h
	add	x15, x15, 240
	add	x14, x14, 240
	mla	z13.h, p7/m, z29.h, z24.h
	ldr	z29, [x14]
	movprfx	z11, z31
	mla	z11.h, p7/m, z9.h, z3.h
	add	x14, x2, x21
	mla	z11.h, p7/m, z22.h, z8.h
	mla	z11.h, p7/m, z29.h, z2.h
	mla	z11.h, p7/m, z12.h, z0.h
	add	z13.h, z13.h, z11.h
	movprfx	z11, z31
	mla	z11.h, p7/m, z30.h, z26.h
	ldr	z30, [x15]
	addvl	x15, sp, #4
	mla	z11.h, p7/m, z25.h, z16.h
	add	x15, x15, 240
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	movprfx	z29, z11
	mla	z29.h, p7/m, z27.h, z4.h
	movprfx	z11, z31
	mla	z11.h, p7/m, z5.h, z3.h
	mla	z29.h, p7/m, z23.h, z24.h
	mla	z11.h, p7/m, z21.h, z8.h
	mla	z11.h, p7/m, z30.h, z2.h
	mla	z11.h, p7/m, z10.h, z0.h
	add	z11.h, z29.h, z11.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	stp	q13, q11, [x14, 16]
	ldr	z13, [x15]
	addvl	x15, sp, #3
	mad	z13.h, p7/m, z26.h, z31.h
	mla	z13.h, p7/m, z1.h, z16.h
	add	x15, x15, 240
	ldr	z11, [x15]
	mla	z13.h, p7/m, z11.h, z4.h
	addvl	x15, sp, #8
	add	x5, x5, x3, lsl 1
	mad	z7.h, p7/m, z26.h, z31.h
	add	x15, x15, 240
	ldr	z11, [x15]
	mad	z11.h, p7/m, z24.h, z13.h
	add	x15, sp, 240
	ldr	z13, [x15]
	mad	z13.h, p7/m, z3.h, z31.h
	addvl	x15, sp, #18
	mla	z7.h, p7/m, z20.h, z16.h
	mla	z7.h, p7/m, z28.h, z4.h
	add	x15, x15, 240
	ldr	z25, [x15]
	mla	z13.h, p7/m, z25.h, z8.h
	addvl	x15, sp, #1
	movprfx	z29, z31
	mla	z29.h, p7/m, z18.h, z3.h
	sub	z15.h, z15.h, #128
	add	x15, x15, 240
	ldr	z30, [x15]
	mla	z13.h, p7/m, z30.h, z2.h
	addvl	x15, sp, #15
	mad	z9.h, p7/m, z26.h, z31.h
	mad	z5.h, p7/m, z26.h, z31.h
	add	x15, x15, 240
	ldr	z30, [x15]
	mla	z13.h, p7/m, z30.h, z0.h
	add	z13.h, z11.h, z13.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x14, 48]
	addvl	x14, sp, #21
	ld1b	z13.h, p7/z, [x1, x16]
	lsl	x15, x6, 2
	sub	z13.h, z13.h, #128
	mla	z9.h, p7/m, z22.h, z16.h
	add	x14, x14, 240
	str	z13, [x14]
	addvl	x16, sp, #2
	add	x14, x15, 16
	ld1b	z13.h, p7/z, [x4, x14]
	add	x16, x16, 240
	add	x14, x15, 32
	ld1b	z11.h, p7/z, [x4, x14]
	mla	z5.h, p7/m, z21.h, z16.h
	add	x14, x15, 48
	ld1b	z30.h, p7/z, [x4, x14]
	sub	z30.h, z30.h, #128
	addvl	x14, sp, #14
	sub	z14.h, z14.h, #128
	sub	z19.h, z19.h, #128
	add	x14, x14, 240
	str	z30, [x14]
	add	x0, x0, x1, lsl 1
	addvl	x14, sp, #7
	add	x22, x3, x5
	mad	z18.h, p7/m, z26.h, z31.h
	add	x14, x14, 240
	ldr	z30, [x14]
	mla	z7.h, p7/m, z30.h, z24.h
	addvl	x14, sp, #17
	sub	z13.h, z13.h, #128
	sub	z11.h, z11.h, #128
	add	x14, x14, 240
	ldr	z30, [x14]
	mla	z29.h, p7/m, z30.h, z8.h
	addvl	x14, sp, #10
	mla	z29.h, p7/m, z17.h, z2.h
	mla	z29.h, p7/m, z6.h, z0.h
	add	x14, x14, 240
	add	z7.h, z7.h, z29.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x5]
	ldr	z29, [x14]
	addvl	x14, sp, #12
	mla	z9.h, p7/m, z29.h, z4.h
	mla	z9.h, p7/m, z12.h, z24.h
	add	x14, x14, 240
	ldr	z7, [x14]
	mad	z7.h, p7/m, z3.h, z31.h
	addvl	x14, sp, #11
	add	x19, x1, x0
	add	x14, x14, 240
	ldr	z30, [x14]
	mla	z7.h, p7/m, z30.h, z8.h
	addvl	x14, sp, #9
	add	x5, x5, x3, lsl 1
	add	x14, x14, 240
	ldr	z30, [x14]
	mla	z7.h, p7/m, z30.h, z2.h
	ldr	z30, [x16]
	add	x14, x2, x18, lsl 2
	addvl	x16, sp, #16
	add	x16, x16, 240
	mla	z7.h, p7/m, z15.h, z0.h
	mla	z5.h, p7/m, z30.h, z4.h
	ldr	z30, [x16]
	add	z9.h, z9.h, z7.h
	add	x16, sp, 240
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	mla	z5.h, p7/m, z10.h, z24.h
	movprfx	z7, z31
	mla	z7.h, p7/m, z30.h, z3.h
	mla	z7.h, p7/m, z27.h, z8.h
	mla	z7.h, p7/m, z23.h, z2.h
	mla	z7.h, p7/m, z14.h, z0.h
	add	z5.h, z5.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	stp	q9, q5, [x14, 16]
	ldr	z9, [x16]
	addvl	x16, sp, #1
	mad	z9.h, p7/m, z26.h, z31.h
	mla	z9.h, p7/m, z25.h, z16.h
	add	x16, x16, 240
	ldr	z7, [x16]
	mla	z9.h, p7/m, z7.h, z4.h
	addvl	x16, sp, #15
	add	x25, x3, x5
	add	x16, x16, 240
	ldr	z7, [x16]
	mad	z7.h, p7/m, z24.h, z9.h
	addvl	x16, sp, #3
	movprfx	z9, z31
	mla	z9.h, p7/m, z1.h, z3.h
	mad	z1.h, p7/m, z26.h, z31.h
	add	x16, x16, 240
	ldr	z5, [x16]
	mla	z9.h, p7/m, z5.h, z8.h
	addvl	x16, sp, #8
	lsl	x8, x8, 2
	add	x16, x16, 240
	ldr	z5, [x16]
	mla	z9.h, p7/m, z5.h, z2.h
	add	x16, x15, x1
	mla	z9.h, p7/m, z19.h, z0.h
	add	z9.h, z7.h, z9.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x14, 48]
	add	x14, x16, 16
	ld1b	z9.h, p7/z, [x1, x0]
	movprfx	z7, z9
	sub	z7.h, z7.h, #128
	ld1b	z9.h, p7/z, [x4, x14]
	addvl	x14, sp, #6
	sub	z9.h, z9.h, #128
	add	x14, x14, 240
	str	z9, [x14]
	mov	z5.d, z19.d
	add	x14, x16, 32
	ld1b	z9.h, p7/z, [x4, x14]
	sub	z9.h, z9.h, #128
	addvl	x14, sp, #5
	add	x0, x0, x1, lsl 1
	add	x14, x14, 240
	str	z9, [x14]
	lsl	x17, x17, 1
	add	x14, x16, 48
	ld1b	z9.h, p7/z, [x4, x14]
	sub	z9.h, z9.h, #128
	addvl	x14, sp, #16
	lsl	x16, x16, 1
	add	x14, x14, 240
	str	z9, [x14]
	addvl	x14, sp, #17
	add	x14, x14, 240
	ldr	z9, [x14]
	mla	z18.h, p7/m, z9.h, z16.h
	addvl	x14, sp, #7
	mla	z18.h, p7/m, z17.h, z4.h
	movprfx	z9, z31
	mla	z9.h, p7/m, z20.h, z3.h
	add	x14, x14, 240
	ldr	z19, [x14]
	mla	z9.h, p7/m, z28.h, z8.h
	addvl	x14, sp, #21
	mla	z18.h, p7/m, z6.h, z24.h
	mla	z9.h, p7/m, z19.h, z2.h
	add	x14, x14, 240
	ldr	z29, [x14]
	mla	z9.h, p7/m, z29.h, z0.h
	addvl	x14, sp, #12
	add	z18.h, z18.h, z9.h
	sqrshrunb	z18.b, z18.h, #6
	add	x14, x14, 240
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x3, x22]
	ldr	z19, [x14]
	addvl	x14, sp, #11
	mad	z19.h, p7/m, z26.h, z31.h
	add	x14, x14, 240
	ldr	z18, [x14]
	mla	z19.h, p7/m, z18.h, z16.h
	addvl	x14, sp, #9
	addvl	x22, sp, #2
	mad	z20.h, p7/m, z26.h, z31.h
	add	x14, x14, 240
	ldr	z18, [x14]
	add	x22, x22, 240
	addvl	x14, sp, #10
	mla	z19.h, p7/m, z18.h, z4.h
	movprfx	z18, z31
	mla	z18.h, p7/m, z22.h, z3.h
	add	x14, x14, 240
	ldr	z9, [x14]
	mla	z18.h, p7/m, z9.h, z8.h
	add	x14, x2, x28
	mla	z18.h, p7/m, z12.h, z2.h
	mla	z18.h, p7/m, z13.h, z0.h
	mla	z19.h, p7/m, z15.h, z24.h
	add	z19.h, z19.h, z18.h
	movprfx	z18, z31
	mla	z18.h, p7/m, z30.h, z26.h
	ldr	z30, [x22]
	addvl	x22, sp, #3
	mla	z18.h, p7/m, z27.h, z16.h
	add	x22, x22, 240
	mla	z18.h, p7/m, z23.h, z4.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	movprfx	z9, z18
	mla	z9.h, p7/m, z14.h, z24.h
	movprfx	z18, z31
	mla	z18.h, p7/m, z21.h, z3.h
	mla	z18.h, p7/m, z30.h, z8.h
	mla	z18.h, p7/m, z10.h, z2.h
	mla	z18.h, p7/m, z11.h, z0.h
	add	z18.h, z9.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q19, q18, [x14, 16]
	ldr	z19, [x22]
	addvl	x22, sp, #8
	add	x22, x22, 240
	mla	z1.h, p7/m, z19.h, z16.h
	ldr	z19, [x22]
	addvl	x22, sp, #12
	mla	z1.h, p7/m, z19.h, z4.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z25.h, z3.h
	add	x22, x22, 240
	str	z5, [x22]
	mla	z1.h, p7/m, z5.h, z24.h
	addvl	x22, sp, #1
	mla	z20.h, p7/m, z28.h, z16.h
	mad	z22.h, p7/m, z26.h, z31.h
	add	x22, x22, 240
	ldr	z18, [x22]
	mla	z19.h, p7/m, z18.h, z8.h
	addvl	x22, sp, #15
	mad	z21.h, p7/m, z26.h, z31.h
	add	x22, x22, 240
	ldr	z30, [x22]
	mla	z19.h, p7/m, z30.h, z2.h
	addvl	x22, sp, #14
	add	x22, x22, 240
	ldr	z9, [x22]
	mla	z19.h, p7/m, z9.h, z0.h
	add	z1.h, z1.h, z19.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x14, 48]
	lsl	x14, x12, 1
	ld1b	z19.h, p7/z, [x1, x19]
	add	x19, x14, 16
	movprfx	z18, z19
	sub	z18.h, z18.h, #128
	ld1b	z19.h, p7/z, [x4, x19]
	add	x19, x14, 32
	movprfx	z5, z19
	sub	z5.h, z5.h, #128
	add	x14, x14, 48
	ld1b	z19.h, p7/z, [x4, x19]
	movprfx	z9, z19
	sub	z9.h, z9.h, #128
	mov	z1.d, z29.d
	ld1b	z19.h, p7/z, [x4, x14]
	add	x14, sp, 240
	sub	z19.h, z19.h, #128
	str	z19, [x14]
	addvl	x14, sp, #7
	addvl	x19, sp, #2
	add	x14, x14, 240
	ldr	z19, [x14]
	mla	z20.h, p7/m, z19.h, z4.h
	addvl	x14, sp, #17
	mla	z20.h, p7/m, z29.h, z24.h
	add	x19, x19, 240
	add	x14, x14, 240
	ldr	z29, [x14]
	movprfx	z19, z31
	mla	z19.h, p7/m, z29.h, z3.h
	addvl	x14, sp, #10
	mla	z19.h, p7/m, z17.h, z8.h
	mla	z19.h, p7/m, z6.h, z2.h
	add	x14, x14, 240
	mla	z19.h, p7/m, z7.h, z0.h
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x5]
	ldr	z20, [x14]
	addvl	x14, sp, #11
	mla	z22.h, p7/m, z20.h, z16.h
	add	x14, x14, 240
	ldr	z20, [x14]
	mad	z20.h, p7/m, z3.h, z31.h
	addvl	x14, sp, #9
	mla	z22.h, p7/m, z12.h, z4.h
	mla	z22.h, p7/m, z13.h, z24.h
	add	x14, x14, 240
	ldr	z30, [x14]
	mla	z20.h, p7/m, z30.h, z8.h
	addvl	x14, sp, #6
	ldr	z30, [x19]
	addvl	x19, sp, #5
	add	x14, x14, 240
	ldr	z19, [x14]
	add	x19, x19, 240
	add	x14, x2, x20, lsl 1
	mla	z21.h, p7/m, z30.h, z16.h
	ldr	z30, [x19]
	addvl	x19, sp, #1
	mla	z20.h, p7/m, z15.h, z2.h
	mla	z20.h, p7/m, z19.h, z0.h
	add	x19, x19, 240
	add	z22.h, z22.h, z20.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	mla	z21.h, p7/m, z10.h, z4.h
	movprfx	z20, z31
	mla	z20.h, p7/m, z27.h, z3.h
	mla	z21.h, p7/m, z11.h, z24.h
	mla	z20.h, p7/m, z23.h, z8.h
	mla	z20.h, p7/m, z14.h, z2.h
	mla	z20.h, p7/m, z30.h, z0.h
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	stp	q22, q21, [x14, 16]
	movprfx	z22, z31
	mla	z22.h, p7/m, z25.h, z26.h
	ldr	z25, [x19]
	addvl	x19, sp, #15
	ldr	z21, [x22]
	add	x19, x19, 240
	ldr	z30, [x19]
	mla	z22.h, p7/m, z25.h, z16.h
	addvl	x19, sp, #3
	mla	z22.h, p7/m, z30.h, z4.h
	mla	z22.h, p7/m, z21.h, z24.h
	add	x19, x19, 240
	ldr	z21, [x19]
	mad	z21.h, p7/m, z3.h, z31.h
	addvl	x19, sp, #8
	add	x22, x1, x0
	add	x19, x19, 240
	ldr	z19, [x19]
	mla	z21.h, p7/m, z19.h, z8.h
	addvl	x19, sp, #12
	add	x5, x5, x3, lsl 1
	add	x19, x19, 240
	ldr	z20, [x19]
	mla	z21.h, p7/m, z20.h, z2.h
	addvl	x19, sp, #16
	add	x19, x19, 240
	ldr	z30, [x19]
	mla	z21.h, p7/m, z30.h, z0.h
	add	z22.h, z22.h, z21.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x14, 48]
	lsl	x14, x24, 3
	ld1b	z22.h, p7/z, [x1, x0]
	sub	x23, x14, x1
	movprfx	z21, z22
	sub	z21.h, z21.h, #128
	add	x19, x23, 16
	ld1b	z22.h, p7/z, [x4, x19]
	movprfx	z20, z22
	sub	z20.h, z20.h, #128
	add	x19, x23, 32
	ld1b	z22.h, p7/z, [x4, x19]
	movprfx	z19, z22
	sub	z19.h, z19.h, #128
	add	x19, x23, 48
	ld1b	z22.h, p7/z, [x4, x19]
	sub	z22.h, z22.h, #128
	addvl	x19, sp, #4
	add	x0, x0, x1, lsl 1
	add	x19, x19, 240
	str	z22, [x19]
	movprfx	z22, z31
	mla	z22.h, p7/m, z29.h, z26.h
	addvl	x19, sp, #7
	mla	z22.h, p7/m, z17.h, z16.h
	movprfx	z29, z22
	mla	z29.h, p7/m, z6.h, z4.h
	add	x19, x19, 240
	ldr	z25, [x19]
	mla	z29.h, p7/m, z7.h, z24.h
	movprfx	z22, z31
	mla	z22.h, p7/m, z28.h, z3.h
	mla	z22.h, p7/m, z25.h, z8.h
	mla	z22.h, p7/m, z1.h, z2.h
	mla	z22.h, p7/m, z18.h, z0.h
	add	z22.h, z29.h, z22.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x25]
	addvl	x25, sp, #11
	add	x25, x25, 240
	ldr	z22, [x25]
	mad	z22.h, p7/m, z26.h, z31.h
	addvl	x25, sp, #9
	lsl	x19, x3, 4
	mad	z28.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	ldr	z29, [x25]
	mla	z22.h, p7/m, z29.h, z16.h
	addvl	x25, sp, #6
	movprfx	z29, z22
	mla	z29.h, p7/m, z15.h, z4.h
	sub	x26, x19, x3
	add	x25, x25, 240
	ldr	z25, [x25]
	str	x26, [sp, 160]
	addvl	x25, sp, #10
	mla	z29.h, p7/m, z25.h, z24.h
	movprfx	z25, z31
	mla	z25.h, p7/m, z27.h, z26.h
	add	x25, x25, 240
	ldr	z22, [x25]
	mad	z22.h, p7/m, z3.h, z31.h
	addvl	x25, sp, #19
	mla	z22.h, p7/m, z12.h, z8.h
	mla	z22.h, p7/m, z13.h, z2.h
	add	x25, x25, 240
	str	z5, [x25]
	mla	z22.h, p7/m, z5.h, z0.h
	add	x25, x2, x26
	addvl	x26, sp, #5
	mla	z25.h, p7/m, z23.h, z16.h
	add	x26, x26, 240
	ldr	z5, [x26]
	mla	z25.h, p7/m, z14.h, z4.h
	addvl	x26, sp, #2
	mla	z25.h, p7/m, z5.h, z24.h
	add	z22.h, z29.h, z22.h
	add	x26, x26, 240
	ldr	z5, [x26]
	movprfx	z29, z31
	mla	z29.h, p7/m, z5.h, z3.h
	addvl	x26, sp, #3
	mla	z29.h, p7/m, z10.h, z8.h
	mla	z29.h, p7/m, z11.h, z2.h
	add	x26, x26, 240
	mla	z29.h, p7/m, z9.h, z0.h
	add	z25.h, z25.h, z29.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	stp	q22, q25, [x25, 16]
	ldr	z25, [x26]
	addvl	x26, sp, #8
	mad	z25.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	ldr	z22, [x26]
	mla	z25.h, p7/m, z22.h, z16.h
	addvl	x26, sp, #12
	lsl	x23, x23, 1
	add	x26, x26, 240
	ldr	z22, [x26]
	mla	z25.h, p7/m, z22.h, z4.h
	addvl	x26, sp, #16
	movprfx	z22, z25
	mla	z22.h, p7/m, z30.h, z24.h
	add	x26, x26, 240
	str	z30, [x26]
	addvl	x26, sp, #1
	add	x26, x26, 240
	ldr	z25, [x26]
	mad	z25.h, p7/m, z3.h, z31.h
	addvl	x26, sp, #15
	add	x26, x26, 240
	ldr	z30, [x26]
	mla	z25.h, p7/m, z30.h, z8.h
	addvl	x26, sp, #14
	add	x26, x26, 240
	ldr	z30, [x26]
	mla	z25.h, p7/m, z30.h, z2.h
	add	x26, sp, 240
	ldr	z27, [x26]
	mla	z25.h, p7/m, z27.h, z0.h
	add	z25.h, z22.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x25, 48]
	ld1b	z25.h, p7/z, [x1, x22]
	add	x22, x14, 16
	ld1b	z22.h, p7/z, [x4, x22]
	addvl	x22, sp, #23
	sub	z22.h, z22.h, #128
	add	x22, x22, 240
	str	z22, [x22]
	addvl	x25, sp, #10
	add	x22, x14, 32
	ld1b	z22.h, p7/z, [x4, x22]
	add	x25, x25, 240
	add	x22, x14, 48
	ld1b	z5.h, p7/z, [x4, x22]
	sub	z5.h, z5.h, #128
	addvl	x22, sp, #20
	addvl	x26, sp, #2
	sub	z25.h, z25.h, #128
	add	x22, x22, 240
	str	z5, [x22]
	add	x26, x26, 240
	addvl	x22, sp, #7
	sub	z22.h, z22.h, #128
	add	x22, x22, 240
	ldr	z30, [x22]
	mla	z28.h, p7/m, z30.h, z16.h
	addvl	x22, sp, #21
	mla	z28.h, p7/m, z1.h, z4.h
	mla	z28.h, p7/m, z18.h, z24.h
	add	x22, x22, 240
	str	z1, [x22]
	movprfx	z1, z31
	mla	z1.h, p7/m, z17.h, z3.h
	mla	z1.h, p7/m, z6.h, z8.h
	mla	z1.h, p7/m, z7.h, z2.h
	mla	z1.h, p7/m, z21.h, z0.h
	add	z28.h, z28.h, z1.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x5]
	ldr	z30, [x25]
	addvl	x25, sp, #19
	add	x25, x25, 240
	ldr	z28, [x25]
	mad	z30.h, p7/m, z26.h, z31.h
	addvl	x25, sp, #9
	mla	z30.h, p7/m, z12.h, z16.h
	mla	z30.h, p7/m, z13.h, z4.h
	add	x25, x25, 240
	mla	z30.h, p7/m, z28.h, z24.h
	ldr	z28, [x25]
	addvl	x25, sp, #6
	ldr	z29, [x26]
	addvl	x26, sp, #5
	add	x25, x25, 240
	ldr	z1, [x25]
	add	x26, x26, 240
	add	x25, x2, x19
	ldr	z5, [x26]
	mad	z28.h, p7/m, z3.h, z31.h
	addvl	x26, sp, #1
	mla	z28.h, p7/m, z15.h, z8.h
	mla	z28.h, p7/m, z1.h, z2.h
	mla	z28.h, p7/m, z20.h, z0.h
	mad	z29.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	mla	z29.h, p7/m, z10.h, z16.h
	add	z30.h, z30.h, z28.h
	mla	z29.h, p7/m, z11.h, z4.h
	movprfx	z28, z31
	mla	z28.h, p7/m, z23.h, z3.h
	mla	z29.h, p7/m, z9.h, z24.h
	mla	z28.h, p7/m, z14.h, z8.h
	mla	z28.h, p7/m, z5.h, z2.h
	mla	z28.h, p7/m, z19.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	stp	q30, q29, [x25, 16]
	ldr	z29, [x26]
	addvl	x26, sp, #15
	movprfx	z30, z31
	mla	z30.h, p7/m, z29.h, z26.h
	mad	z17.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	ldr	z29, [x26]
	mla	z30.h, p7/m, z29.h, z16.h
	addvl	x26, sp, #14
	add	x22, x3, x5
	mla	z17.h, p7/m, z6.h, z16.h
	add	x26, x26, 240
	ldr	z28, [x26]
	mla	z30.h, p7/m, z28.h, z4.h
	add	x26, sp, 240
	str	z27, [x26]
	mla	z30.h, p7/m, z27.h, z24.h
	addvl	x26, sp, #8
	mla	z17.h, p7/m, z7.h, z4.h
	mla	z17.h, p7/m, z21.h, z24.h
	add	x26, x26, 240
	ldr	z29, [x26]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x26, sp, #12
	add	x19, x19, x3
	mad	z23.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	ldr	z28, [x26]
	mla	z29.h, p7/m, z28.h, z8.h
	addvl	x26, sp, #16
	mla	z23.h, p7/m, z14.h, z16.h
	add	x5, x5, x3, lsl 1
	add	x26, x26, 240
	ldr	z28, [x26]
	mla	z29.h, p7/m, z28.h, z2.h
	addvl	x26, sp, #4
	add	x26, x26, 240
	ldr	z1, [x26]
	mla	z29.h, p7/m, z1.h, z0.h
	add	x26, x6, x15
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x25, 48]
	add	x25, x26, 16
	ld1b	z30.h, p7/z, [x1, x0]
	movprfx	z28, z30
	sub	z28.h, z28.h, #128
	add	x15, x1, x0
	ld1b	z30.h, p7/z, [x4, x25]
	addvl	x25, sp, #11
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	add	x25, x25, 240
	str	z29, [x25]
	add	x0, x0, x1, lsl 1
	add	x25, x26, 32
	ld1b	z30.h, p7/z, [x4, x25]
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	addvl	x25, sp, #2
	lsl	x6, x6, 3
	add	x25, x25, 240
	str	z29, [x25]
	str	x26, [sp, 176]
	add	x25, x26, 48
	ld1b	z30.h, p7/z, [x4, x25]
	addvl	x25, sp, #22
	sub	z30.h, z30.h, #128
	add	x25, x25, 240
	str	z30, [x25]
	addvl	x25, sp, #7
	add	x25, x25, 240
	ldr	z30, [x25]
	mad	z30.h, p7/m, z3.h, z31.h
	addvl	x25, sp, #21
	add	x25, x25, 240
	ldr	z29, [x25]
	mla	z30.h, p7/m, z29.h, z8.h
	mla	z30.h, p7/m, z18.h, z2.h
	mla	z30.h, p7/m, z25.h, z0.h
	add	z17.h, z17.h, z30.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x22]
	addvl	x22, sp, #9
	movprfx	z30, z31
	mla	z30.h, p7/m, z12.h, z3.h
	mla	z30.h, p7/m, z13.h, z8.h
	add	x22, x22, 240
	ldr	z27, [x22]
	addvl	x25, sp, #5
	addvl	x22, sp, #6
	add	x25, x25, 240
	ldr	z5, [x25]
	add	x22, x22, 240
	ldr	z29, [x22]
	addvl	x25, sp, #8
	addvl	x22, sp, #19
	mad	z27.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	add	x22, x22, 240
	ldr	z17, [x22]
	mla	z30.h, p7/m, z17.h, z2.h
	addvl	x22, sp, #23
	mla	z27.h, p7/m, z15.h, z16.h
	mla	z27.h, p7/m, z29.h, z4.h
	add	x22, x22, 240
	ldr	z17, [x22]
	mla	z27.h, p7/m, z20.h, z24.h
	add	x22, x2, x19
	mla	z30.h, p7/m, z17.h, z0.h
	add	z30.h, z27.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	mla	z23.h, p7/m, z5.h, z4.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z10.h, z3.h
	mla	z23.h, p7/m, z19.h, z24.h
	mla	z29.h, p7/m, z11.h, z8.h
	mla	z29.h, p7/m, z9.h, z2.h
	mla	z29.h, p7/m, z22.h, z0.h
	add	z23.h, z23.h, z29.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	stp	q30, q23, [x22, 16]
	ldr	z30, [x25]
	addvl	x25, sp, #12
	mad	z30.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	ldr	z23, [x25]
	mla	z30.h, p7/m, z23.h, z16.h
	addvl	x25, sp, #16
	mad	z12.h, p7/m, z26.h, z31.h
	mla	z12.h, p7/m, z13.h, z16.h
	add	x25, x25, 240
	ldr	z23, [x25]
	mla	z30.h, p7/m, z23.h, z4.h
	addvl	x25, sp, #4
	mla	z30.h, p7/m, z1.h, z24.h
	mad	z10.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	str	z1, [x25]
	mla	z10.h, p7/m, z11.h, z16.h
	addvl	x25, sp, #15
	mla	z10.h, p7/m, z9.h, z4.h
	mla	z10.h, p7/m, z22.h, z24.h
	add	x25, x25, 240
	ldr	z27, [x25]
	movprfx	z29, z31
	mla	z29.h, p7/m, z27.h, z3.h
	addvl	x25, sp, #14
	add	x25, x25, 240
	ldr	z17, [x25]
	mla	z29.h, p7/m, z17.h, z8.h
	add	x25, sp, 240
	ldr	z23, [x25]
	mla	z29.h, p7/m, z23.h, z2.h
	addvl	x25, sp, #20
	add	x25, x25, 240
	ldr	z1, [x25]
	mla	z29.h, p7/m, z1.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x22, 48]
	lsl	x22, x9, 1
	ld1b	z30.h, p7/z, [x1, x15]
	add	x15, x22, 16
	movprfx	z23, z30
	sub	z23.h, z23.h, #128
	ld1b	z30.h, p7/z, [x4, x15]
	add	x15, x22, 32
	movprfx	z17, z30
	sub	z17.h, z17.h, #128
	ld1b	z30.h, p7/z, [x4, x15]
	addvl	x15, sp, #13
	sub	z30.h, z30.h, #128
	add	x22, x22, 48
	add	x15, x15, 240
	str	z30, [x15]
	ld1b	z30.h, p7/z, [x4, x22]
	addvl	x15, sp, #1
	sub	z30.h, z30.h, #128
	addvl	x22, sp, #19
	add	x15, x15, 240
	str	z30, [x15]
	add	x22, x22, 240
	addvl	x15, sp, #7
	addvl	x25, sp, #2
	add	x15, x15, 240
	ldr	z30, [x15]
	mad	z30.h, p7/m, z26.h, z31.h
	addvl	x15, sp, #21
	add	x25, x25, 240
	add	x15, x15, 240
	ldr	z29, [x15]
	mla	z30.h, p7/m, z29.h, z16.h
	mla	z30.h, p7/m, z18.h, z4.h
	movprfx	z29, z30
	mla	z29.h, p7/m, z25.h, z24.h
	add	x15, x3, x5
	movprfx	z30, z31
	mla	z30.h, p7/m, z6.h, z3.h
	mla	z30.h, p7/m, z7.h, z8.h
	mla	z30.h, p7/m, z21.h, z2.h
	mla	z30.h, p7/m, z28.h, z0.h
	add	z30.h, z29.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x5]
	ldr	z29, [x22]
	addvl	x22, sp, #23
	mla	z12.h, p7/m, z29.h, z4.h
	mad	z6.h, p7/m, z26.h, z31.h
	add	x22, x22, 240
	ldr	z30, [x22]
	mla	z12.h, p7/m, z30.h, z24.h
	addvl	x22, sp, #6
	movprfx	z30, z31
	mla	z30.h, p7/m, z15.h, z3.h
	mla	z6.h, p7/m, z7.h, z16.h
	add	x22, x22, 240
	ldr	z29, [x22]
	mla	z30.h, p7/m, z29.h, z8.h
	addvl	x22, sp, #11
	mla	z30.h, p7/m, z20.h, z2.h
	mla	z6.h, p7/m, z21.h, z4.h
	add	x22, x22, 240
	ldr	z29, [x22]
	mla	z30.h, p7/m, z29.h, z0.h
	add	x22, x2, x30, lsl 1
	add	z30.h, z12.h, z30.h
	ldr	z12, [x25]
	addvl	x25, sp, #14
	movprfx	z29, z31
	mla	z29.h, p7/m, z14.h, z3.h
	sqrshrunb	z30.b, z30.h, #6
	add	x25, x25, 240
	mla	z29.h, p7/m, z5.h, z8.h
	uzp1	z30.b, z30.b, z30.b
	mla	z29.h, p7/m, z19.h, z2.h
	mla	z29.h, p7/m, z12.h, z0.h
	add	z10.h, z10.h, z29.h
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	stp	q30, q10, [x22, 16]
	ldr	z12, [x25]
	add	x25, sp, 240
	ldr	z29, [x25]
	addvl	x25, sp, #20
	movprfx	z30, z31
	mla	z30.h, p7/m, z27.h, z26.h
	mla	z30.h, p7/m, z12.h, z16.h
	add	x25, x25, 240
	str	z1, [x25]
	mla	z30.h, p7/m, z29.h, z4.h
	addvl	x25, sp, #12
	mla	z30.h, p7/m, z1.h, z24.h
	mla	z6.h, p7/m, z28.h, z24.h
	add	x25, x25, 240
	ldr	z29, [x25]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x25, sp, #16
	mad	z15.h, p7/m, z26.h, z31.h
	mad	z14.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	ldr	z27, [x25]
	mla	z29.h, p7/m, z27.h, z8.h
	addvl	x25, sp, #4
	mla	z14.h, p7/m, z5.h, z16.h
	mla	z14.h, p7/m, z19.h, z4.h
	add	x25, x25, 240
	ldr	z10, [x25]
	mla	z29.h, p7/m, z10.h, z2.h
	addvl	x25, sp, #22
	add	x5, x5, x3, lsl 1
	add	x25, x25, 240
	ldr	z12, [x25]
	mla	z29.h, p7/m, z12.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x22, 48]
	addvl	x22, sp, #18
	ld1b	z30.h, p7/z, [x1, x0]
	add	x25, x24, x14
	movprfx	z10, z30
	sub	z10.h, z10.h, #128
	movprfx	z29, z31
	mla	z29.h, p7/m, z11.h, z3.h
	add	x22, x22, 240
	str	z10, [x22]
	mla	z29.h, p7/m, z9.h, z8.h
	add	x22, x25, 16
	ld1b	z30.h, p7/z, [x4, x22]
	movprfx	z1, z30
	sub	z1.h, z1.h, #128
	addvl	x22, sp, #17
	mla	z29.h, p7/m, z22.h, z2.h
	add	x14, x1, x0
	add	x22, x22, 240
	str	z1, [x22]
	mad	z11.h, p7/m, z26.h, z31.h
	add	x22, x25, 32
	ld1b	z30.h, p7/z, [x4, x22]
	str	x25, [sp, 184]
	add	x22, x25, 48
	movprfx	z12, z30
	sub	z12.h, z12.h, #128
	addvl	x25, sp, #13
	ld1b	z30.h, p7/z, [x4, x22]
	addvl	x22, sp, #21
	movprfx	z10, z30
	sub	z10.h, z10.h, #128
	add	x22, x22, 240
	ldr	z1, [x22]
	movprfx	z30, z31
	mla	z30.h, p7/m, z1.h, z3.h
	mla	z30.h, p7/m, z18.h, z8.h
	mla	z30.h, p7/m, z25.h, z2.h
	mla	z30.h, p7/m, z23.h, z0.h
	add	z6.h, z6.h, z30.h
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x3, x15]
	addvl	x15, sp, #6
	mla	z11.h, p7/m, z9.h, z16.h
	add	x15, x15, 240
	ldr	z30, [x15]
	mla	z15.h, p7/m, z30.h, z16.h
	addvl	x15, sp, #11
	mla	z15.h, p7/m, z20.h, z4.h
	add	x22, x3, x30, lsl 1
	add	x15, x15, 240
	ldr	z6, [x15]
	mla	z15.h, p7/m, z6.h, z24.h
	addvl	x15, sp, #19
	movprfx	z30, z31
	mla	z30.h, p7/m, z13.h, z3.h
	str	x22, [sp, 192]
	add	x15, x15, 240
	ldr	z6, [x15]
	mla	z30.h, p7/m, z6.h, z8.h
	addvl	x15, sp, #23
	mad	z13.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	add	x15, x15, 240
	ldr	z6, [x15]
	mla	z30.h, p7/m, z6.h, z2.h
	add	x15, x2, x22
	addvl	x22, sp, #5
	mla	z30.h, p7/m, z17.h, z0.h
	add	x22, x22, 240
	str	z5, [x22]
	add	z30.h, z15.h, z30.h
	addvl	x22, sp, #2
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	add	x22, x22, 240
	ldr	z15, [x22]
	mla	z14.h, p7/m, z15.h, z24.h
	addvl	x22, sp, #13
	mla	z11.h, p7/m, z22.h, z4.h
	add	x0, x0, x1, lsl 1
	add	x22, x22, 240
	ldr	z15, [x22]
	mla	z29.h, p7/m, z15.h, z0.h
	addvl	x22, sp, #12
	add	z14.h, z14.h, z29.h
	sqrshrunb	z14.b, z14.h, #6
	add	x22, x22, 240
	uzp1	z14.b, z14.b, z14.b
	stp	q30, q14, [x15, 16]
	ldr	z29, [x22]
	addvl	x22, sp, #4
	movprfx	z30, z31
	mla	z30.h, p7/m, z29.h, z26.h
	add	x22, x22, 240
	ldr	z5, [x22]
	mla	z30.h, p7/m, z27.h, z16.h
	addvl	x22, sp, #22
	mla	z30.h, p7/m, z5.h, z4.h
	lsl	x9, x9, 2
	add	x22, x22, 240
	ldr	z14, [x22]
	mla	z30.h, p7/m, z14.h, z24.h
	addvl	x22, sp, #14
	add	x22, x22, 240
	ldr	z14, [x22]
	movprfx	z29, z31
	mla	z29.h, p7/m, z14.h, z3.h
	add	x22, sp, 240
	ldr	z15, [x22]
	mla	z29.h, p7/m, z15.h, z8.h
	addvl	x22, sp, #20
	add	x22, x22, 240
	ldr	z15, [x22]
	mla	z29.h, p7/m, z15.h, z2.h
	addvl	x22, sp, #1
	add	x22, x22, 240
	ldr	z15, [x22]
	mla	z29.h, p7/m, z15.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x15, 48]
	ld1b	z30.h, p7/z, [x1, x14]
	addvl	x14, sp, #3
	lsl	x15, x11, 2
	sub	z30.h, z30.h, #128
	add	x14, x14, 240
	str	z30, [x14]
	add	x27, x15, x1
	add	x14, x15, 16
	ld1b	z30.h, p7/z, [x4, x14]
	movprfx	z6, z30
	sub	z6.h, z6.h, #128
	add	x14, x15, 32
	ld1b	z30.h, p7/z, [x4, x14]
	sub	z30.h, z30.h, #128
	addvl	x14, sp, #12
	lsl	x11, x11, 3
	add	x14, x14, 240
	str	z30, [x14]
	add	x14, x15, 48
	ld1b	z30.h, p7/z, [x4, x14]
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	addvl	x14, sp, #18
	movprfx	z30, z31
	mla	z30.h, p7/m, z1.h, z26.h
	mla	z30.h, p7/m, z18.h, z16.h
	mla	z30.h, p7/m, z25.h, z4.h
	str	z29, [x22]
	addvl	x22, sp, #19
	movprfx	z29, z30
	mla	z29.h, p7/m, z23.h, z24.h
	add	x14, x14, 240
	ldr	z1, [x14]
	movprfx	z30, z31
	mla	z30.h, p7/m, z7.h, z3.h
	add	x22, x22, 240
	mla	z30.h, p7/m, z21.h, z8.h
	mla	z30.h, p7/m, z28.h, z2.h
	mla	z30.h, p7/m, z1.h, z0.h
	add	z30.h, z29.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x5]
	ldr	z30, [x22]
	addvl	x22, sp, #23
	mla	z13.h, p7/m, z30.h, z16.h
	add	x22, x22, 240
	ldr	z30, [x22]
	mla	z13.h, p7/m, z30.h, z4.h
	addvl	x22, sp, #6
	mla	z13.h, p7/m, z17.h, z24.h
	add	x14, x3, x5
	add	x22, x22, 240
	ldr	z30, [x22]
	mad	z30.h, p7/m, z3.h, z31.h
	addvl	x22, sp, #11
	mla	z30.h, p7/m, z20.h, z8.h
	mad	z7.h, p7/m, z26.h, z31.h
	add	x22, x22, 240
	ldr	z29, [x22]
	mla	z30.h, p7/m, z29.h, z2.h
	addvl	x22, sp, #17
	mla	z7.h, p7/m, z21.h, z16.h
	mla	z7.h, p7/m, z28.h, z4.h
	add	x22, x22, 240
	ldr	z1, [x22]
	mla	z30.h, p7/m, z1.h, z0.h
	add	z30.h, z13.h, z30.h
	ldr	z13, [x25]
	addvl	x25, sp, #5
	add	x25, x25, 240
	ldr	z29, [x25]
	add	x22, x2, x13, lsl 2
	addvl	x25, sp, #2
	mla	z11.h, p7/m, z13.h, z24.h
	mad	z29.h, p7/m, z3.h, z31.h
	add	x25, x25, 240
	ldr	z13, [x25]
	mla	z29.h, p7/m, z19.h, z8.h
	add	x25, sp, 240
	mla	z29.h, p7/m, z13.h, z2.h
	sqrshrunb	z30.b, z30.h, #6
	mla	z29.h, p7/m, z12.h, z0.h
	uzp1	z30.b, z30.b, z30.b
	add	z11.h, z11.h, z29.h
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	stp	q30, q11, [x22, 16]
	ldr	z1, [x25]
	addvl	x25, sp, #20
	movprfx	z30, z31
	mla	z30.h, p7/m, z14.h, z26.h
	add	x25, x25, 240
	ldr	z14, [x25]
	mla	z30.h, p7/m, z1.h, z16.h
	addvl	x25, sp, #4
	mla	z30.h, p7/m, z14.h, z4.h
	mov	z14.d, z27.d
	add	x25, x25, 240
	str	z5, [x25]
	movprfx	z29, z30
	mla	z29.h, p7/m, z15.h, z24.h
	addvl	x25, sp, #22
	movprfx	z30, z31
	mla	z30.h, p7/m, z27.h, z3.h
	mla	z30.h, p7/m, z5.h, z8.h
	add	x25, x25, 240
	ldr	z27, [x25]
	mla	z30.h, p7/m, z27.h, z2.h
	mla	z30.h, p7/m, z10.h, z0.h
	add	z30.h, z29.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x22, 48]
	add	x22, x27, 16
	ld1b	z30.h, p7/z, [x1, x0]
	movprfx	z27, z30
	sub	z27.h, z27.h, #128
	mov	z13.d, z15.d
	ld1b	z30.h, p7/z, [x4, x22]
	addvl	x22, sp, #16
	movprfx	z15, z30
	sub	z15.h, z15.h, #128
	add	x22, x22, 240
	str	z15, [x22]
	add	x15, x1, x0
	add	x22, x27, 32
	ld1b	z30.h, p7/z, [x4, x22]
	str	x27, [sp, 200]
	addvl	x22, sp, #15
	movprfx	z11, z30
	sub	z11.h, z11.h, #128
	add	x5, x5, x3, lsl 1
	add	x22, x22, 240
	str	z11, [x22]
	add	x0, x0, x1, lsl 1
	add	x22, x27, 48
	ld1b	z30.h, p7/z, [x4, x22]
	movprfx	z15, z30
	sub	z15.h, z15.h, #128
	addvl	x22, sp, #14
	movprfx	z30, z31
	mla	z30.h, p7/m, z18.h, z3.h
	mla	z30.h, p7/m, z25.h, z8.h
	add	x22, x22, 240
	str	z15, [x22]
	mla	z30.h, p7/m, z23.h, z2.h
	addvl	x22, sp, #18
	mad	z18.h, p7/m, z26.h, z31.h
	mla	z18.h, p7/m, z25.h, z16.h
	add	x22, x22, 240
	ldr	z1, [x22]
	mla	z7.h, p7/m, z1.h, z24.h
	addvl	x22, sp, #3
	mla	z18.h, p7/m, z23.h, z4.h
	add	x26, x3, x5
	add	x22, x22, 240
	ldr	z1, [x22]
	mla	z30.h, p7/m, z1.h, z0.h
	add	z7.h, z7.h, z30.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x14]
	addvl	x14, sp, #6
	mla	z18.h, p7/m, z1.h, z24.h
	add	x14, x14, 240
	ldr	z5, [x14]
	mad	z5.h, p7/m, z26.h, z31.h
	addvl	x14, sp, #11
	mla	z5.h, p7/m, z20.h, z16.h
	add	x22, x3, x13, lsl 2
	add	x14, x14, 240
	ldr	z15, [x14]
	mla	z5.h, p7/m, z15.h, z4.h
	addvl	x14, sp, #17
	str	x22, [sp, 208]
	add	x14, x14, 240
	ldr	z15, [x14]
	mla	z5.h, p7/m, z15.h, z24.h
	addvl	x14, sp, #19
	add	x14, x14, 240
	ldr	z11, [x14]
	movprfx	z30, z31
	mla	z30.h, p7/m, z11.h, z3.h
	addvl	x14, sp, #23
	add	x14, x14, 240
	ldr	z7, [x14]
	mla	z30.h, p7/m, z7.h, z8.h
	add	x14, x2, x22
	addvl	x22, sp, #5
	mla	z30.h, p7/m, z17.h, z2.h
	add	x22, x22, 240
	ldr	z29, [x22]
	mla	z30.h, p7/m, z6.h, z0.h
	addvl	x22, sp, #2
	add	z30.h, z5.h, z30.h
	mad	z29.h, p7/m, z26.h, z31.h
	add	x22, x22, 240
	ldr	z15, [x22]
	mla	z29.h, p7/m, z19.h, z16.h
	addvl	x22, sp, #13
	mla	z29.h, p7/m, z15.h, z4.h
	movprfx	z15, z29
	mla	z15.h, p7/m, z12.h, z24.h
	add	x22, x22, 240
	ldr	z5, [x22]
	movprfx	z29, z31
	mla	z29.h, p7/m, z9.h, z3.h
	addvl	x22, sp, #12
	mla	z29.h, p7/m, z22.h, z8.h
	mla	z29.h, p7/m, z5.h, z2.h
	add	x22, x22, 240
	ldr	z5, [x22]
	sqrshrunb	z30.b, z30.h, #6
	addvl	x22, sp, #4
	mla	z29.h, p7/m, z5.h, z0.h
	uzp1	z30.b, z30.b, z30.b
	add	x22, x22, 240
	add	z29.h, z15.h, z29.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x14, 16]
	movprfx	z30, z31
	mla	z30.h, p7/m, z14.h, z26.h
	ldr	z29, [x25]
	ldr	z14, [x22]
	add	x22, sp, 240
	mla	z30.h, p7/m, z14.h, z16.h
	mla	z30.h, p7/m, z29.h, z4.h
	movprfx	z29, z30
	mla	z29.h, p7/m, z10.h, z24.h
	ldr	z30, [x22]
	addvl	x22, sp, #20
	mad	z30.h, p7/m, z3.h, z31.h
	add	x22, x22, 240
	ldr	z5, [x22]
	mla	z30.h, p7/m, z5.h, z8.h
	addvl	x22, sp, #1
	mla	z30.h, p7/m, z13.h, z2.h
	mad	z9.h, p7/m, z26.h, z31.h
	add	x22, x22, 240
	ldr	z15, [x22]
	mla	z30.h, p7/m, z15.h, z0.h
	add	z30.h, z29.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x14, 48]
	ld1b	z30.h, p7/z, [x1, x15]
	addvl	x15, sp, #10
	lsl	x14, x10, 1
	sub	z30.h, z30.h, #128
	mla	z9.h, p7/m, z22.h, z16.h
	add	x15, x15, 240
	str	z30, [x15]
	lsl	x10, x10, 2
	add	x15, x14, 16
	ld1b	z30.h, p7/z, [x4, x15]
	movprfx	z15, z30
	sub	z15.h, z15.h, #128
	add	x15, x14, 32
	add	x14, x14, 48
	ld1b	z30.h, p7/z, [x4, x15]
	addvl	x15, sp, #9
	sub	z30.h, z30.h, #128
	add	x15, x15, 240
	str	z30, [x15]
	ld1b	z30.h, p7/z, [x4, x14]
	addvl	x14, sp, #8
	sub	z30.h, z30.h, #128
	addvl	x15, sp, #13
	add	x14, x14, 240
	str	z30, [x14]
	movprfx	z30, z31
	mla	z30.h, p7/m, z21.h, z3.h
	addvl	x14, sp, #3
	mla	z30.h, p7/m, z28.h, z8.h
	add	x15, x15, 240
	add	x14, x14, 240
	str	z1, [x14]
	mad	z21.h, p7/m, z26.h, z31.h
	addvl	x14, sp, #18
	mla	z21.h, p7/m, z28.h, z16.h
	add	x14, x14, 240
	ldr	z1, [x14]
	mla	z30.h, p7/m, z1.h, z2.h
	addvl	x14, sp, #11
	mla	z30.h, p7/m, z27.h, z0.h
	add	z18.h, z18.h, z30.h
	add	x14, x14, 240
	movprfx	z30, z31
	mla	z30.h, p7/m, z11.h, z26.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x3, x5]
	ldr	z11, [x14]
	addvl	x14, sp, #17
	mov	z18.d, z7.d
	mla	z30.h, p7/m, z7.h, z16.h
	add	x14, x14, 240
	ldr	z7, [x14]
	mla	z30.h, p7/m, z17.h, z4.h
	addvl	x14, sp, #16
	movprfx	z29, z30
	mla	z29.h, p7/m, z6.h, z24.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z20.h, z3.h
	add	x14, x14, 240
	mla	z30.h, p7/m, z11.h, z8.h
	mla	z30.h, p7/m, z7.h, z2.h
	ldr	z7, [x14]
	mla	z30.h, p7/m, z7.h, z0.h
	add	z30.h, z29.h, z30.h
	ldr	z29, [x15]
	addvl	x15, sp, #12
	add	x14, x2, x21, lsl 1
	add	x15, x15, 240
	ldr	z7, [x15]
	mla	z9.h, p7/m, z29.h, z4.h
	addvl	x15, sp, #2
	mla	z9.h, p7/m, z7.h, z24.h
	sqrshrunb	z30.b, z30.h, #6
	add	x15, x15, 240
	ldr	z7, [x15]
	uzp1	z30.b, z30.b, z30.b
	addvl	x15, sp, #15
	movprfx	z29, z31
	mla	z29.h, p7/m, z19.h, z3.h
	mla	z29.h, p7/m, z7.h, z8.h
	add	x15, x15, 240
	ldr	z1, [x15]
	mla	z29.h, p7/m, z12.h, z2.h
	add	x15, sp, 240
	mla	z29.h, p7/m, z1.h, z0.h
	add	z9.h, z9.h, z29.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	stp	q30, q9, [x14, 16]
	ldr	z30, [x22]
	ldr	z1, [x15]
	addvl	x15, sp, #14
	mov	z9.d, z5.d
	mad	z1.h, p7/m, z26.h, z31.h
	add	x15, x15, 240
	ldr	z29, [x15]
	mla	z1.h, p7/m, z5.h, z16.h
	ldr	z5, [x25]
	mla	z1.h, p7/m, z13.h, z4.h
	mla	z1.h, p7/m, z30.h, z24.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z14.h, z3.h
	mla	z30.h, p7/m, z5.h, z8.h
	mla	z30.h, p7/m, z10.h, z2.h
	mla	z30.h, p7/m, z29.h, z0.h
	add	z1.h, z1.h, z30.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x14, 48]
	lsl	x14, x1, 5
	ld1b	z1.h, p7/z, [x1, x0]
	sub	x22, x14, x1
	mad	z20.h, p7/m, z26.h, z31.h
	mla	z20.h, p7/m, z11.h, z16.h
	add	x25, x22, 16
	ld1b	z30.h, p7/z, [x4, x25]
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	addvl	x25, sp, #7
	mad	z19.h, p7/m, z26.h, z31.h
	mla	z19.h, p7/m, z7.h, z16.h
	add	x25, x25, 240
	str	z29, [x25]
	mla	z19.h, p7/m, z12.h, z4.h
	add	x25, x22, 32
	ld1b	z30.h, p7/z, [x4, x25]
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	addvl	x25, sp, #6
	add	x15, x1, x0
	sub	z1.h, z1.h, #128
	add	x25, x25, 240
	str	z29, [x25]
	add	x5, x5, x3, lsl 1
	add	x25, x22, 48
	ld1b	z30.h, p7/z, [x4, x25]
	sub	z30.h, z30.h, #128
	addvl	x25, sp, #5
	add	x0, x0, x1, lsl 1
	add	x25, x25, 240
	str	z30, [x25]
	lsl	x22, x22, 1
	addvl	x25, sp, #18
	add	x25, x25, 240
	ldr	z30, [x25]
	mla	z21.h, p7/m, z30.h, z4.h
	addvl	x25, sp, #3
	mla	z21.h, p7/m, z27.h, z24.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z25.h, z3.h
	add	x25, x25, 240
	ldr	z29, [x25]
	mla	z30.h, p7/m, z23.h, z8.h
	addvl	x25, sp, #10
	mla	z30.h, p7/m, z29.h, z2.h
	mad	z25.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	ldr	z29, [x25]
	mla	z30.h, p7/m, z29.h, z0.h
	add	z21.h, z21.h, z30.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x26]
	addvl	x26, sp, #11
	movprfx	z30, z31
	mla	z30.h, p7/m, z18.h, z3.h
	add	x26, x26, 240
	str	z11, [x26]
	mla	z30.h, p7/m, z17.h, z8.h
	addvl	x26, sp, #17
	lsl	x25, x18, 3
	mla	z30.h, p7/m, z6.h, z2.h
	add	x26, x26, 240
	ldr	z21, [x26]
	sub	x27, x25, x3
	addvl	x26, sp, #16
	mla	z20.h, p7/m, z21.h, z4.h
	str	x27, [sp, 216]
	add	x26, x26, 240
	ldr	z21, [x26]
	mla	z20.h, p7/m, z21.h, z24.h
	add	x26, x2, x27
	addvl	x27, sp, #2
	mla	z30.h, p7/m, z15.h, z0.h
	add	x27, x27, 240
	str	z7, [x27]
	add	z30.h, z20.h, z30.h
	addvl	x27, sp, #15
	movprfx	z29, z31
	mla	z29.h, p7/m, z22.h, z3.h
	sqrshrunb	z30.b, z30.h, #6
	add	x27, x27, 240
	ldr	z20, [x27]
	mla	z19.h, p7/m, z20.h, z24.h
	addvl	x27, sp, #13
	uzp1	z30.b, z30.b, z30.b
	mla	z25.h, p7/m, z23.h, z16.h
	add	x27, x27, 240
	ldr	z21, [x27]
	mla	z29.h, p7/m, z21.h, z8.h
	addvl	x27, sp, #12
	mov	z21.d, z10.d
	mad	z22.h, p7/m, z26.h, z31.h
	add	x27, x27, 240
	ldr	z20, [x27]
	mla	z29.h, p7/m, z20.h, z2.h
	addvl	x27, sp, #9
	mov	z20.d, z6.d
	add	x27, x27, 240
	ldr	z6, [x27]
	mla	z29.h, p7/m, z6.h, z0.h
	addvl	x27, sp, #14
	add	z19.h, z19.h, z29.h
	sqrshrunb	z19.b, z19.h, #6
	add	x27, x27, 240
	uzp1	z19.b, z19.b, z19.b
	stp	q30, q19, [x26, 16]
	ldr	z6, [x27]
	addvl	x27, sp, #1
	movprfx	z30, z31
	mla	z30.h, p7/m, z14.h, z26.h
	add	x27, x27, 240
	mla	z30.h, p7/m, z5.h, z16.h
	mla	z30.h, p7/m, z10.h, z4.h
	ldr	z10, [x27]
	addvl	x27, sp, #8
	mov	z14.d, z5.d
	add	x27, x27, 240
	ldr	z5, [x27]
	mla	z30.h, p7/m, z6.h, z24.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z9.h, z3.h
	mla	z29.h, p7/m, z13.h, z8.h
	mla	z29.h, p7/m, z10.h, z2.h
	mla	z29.h, p7/m, z5.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x26, 48]
	ld1b	z5.h, p7/z, [x1, x15]
	add	x15, x14, 16
	ld1b	z7.h, p7/z, [x4, x15]
	sub	z5.h, z5.h, #128
	add	x15, x14, 32
	ld1b	z6.h, p7/z, [x4, x15]
	addvl	x26, sp, #11
	add	x15, x14, 48
	ld1b	z30.h, p7/z, [x4, x15]
	movprfx	z19, z30
	sub	z19.h, z19.h, #128
	addvl	x15, sp, #4
	add	x26, x26, 240
	movprfx	z30, z31
	mla	z30.h, p7/m, z28.h, z3.h
	add	x15, x15, 240
	str	z19, [x15]
	addvl	x27, sp, #13
	addvl	x15, sp, #3
	add	x27, x27, 240
	mad	z28.h, p7/m, z26.h, z31.h
	add	x15, x15, 240
	ldr	z29, [x15]
	mla	z25.h, p7/m, z29.h, z4.h
	addvl	x15, sp, #10
	add	x14, x14, x1
	sub	z7.h, z7.h, #128
	add	x15, x15, 240
	ldr	z19, [x15]
	mla	z25.h, p7/m, z19.h, z24.h
	addvl	x15, sp, #18
	sub	z6.h, z6.h, #128
	add	x15, x15, 240
	ldr	z29, [x15]
	mla	z30.h, p7/m, z29.h, z8.h
	mla	z30.h, p7/m, z27.h, z2.h
	mla	z30.h, p7/m, z1.h, z0.h
	add	z25.h, z25.h, z30.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x5]
	ldr	z19, [x26]
	addvl	x26, sp, #17
	movprfx	z30, z31
	mla	z30.h, p7/m, z18.h, z26.h
	add	x26, x26, 240
	ldr	z25, [x26]
	mla	z30.h, p7/m, z17.h, z16.h
	addvl	x26, sp, #16
	mla	z30.h, p7/m, z20.h, z4.h
	movprfx	z29, z30
	mla	z29.h, p7/m, z15.h, z24.h
	add	x26, x26, 240
	ldr	z11, [x26]
	movprfx	z30, z31
	mla	z30.h, p7/m, z19.h, z3.h
	addvl	x26, sp, #7
	mla	z30.h, p7/m, z25.h, z8.h
	mla	z30.h, p7/m, z11.h, z2.h
	add	x26, x26, 240
	ldr	z25, [x26]
	mla	z30.h, p7/m, z25.h, z0.h
	add	z30.h, z29.h, z30.h
	ldr	z29, [x27]
	addvl	x27, sp, #12
	add	x27, x27, 240
	ldr	z11, [x27]
	add	x26, x2, x25
	addvl	x27, sp, #9
	mla	z22.h, p7/m, z29.h, z16.h
	mla	z22.h, p7/m, z11.h, z4.h
	add	x27, x27, 240
	ldr	z25, [x27]
	mla	z22.h, p7/m, z25.h, z24.h
	addvl	x27, sp, #2
	mov	z25.d, z12.d
	sqrshrunb	z30.b, z30.h, #6
	add	x27, x27, 240
	ldr	z18, [x27]
	movprfx	z29, z31
	mla	z29.h, p7/m, z18.h, z3.h
	addvl	x27, sp, #15
	mla	z29.h, p7/m, z12.h, z8.h
	uzp1	z30.b, z30.b, z30.b
	add	x27, x27, 240
	ldr	z12, [x27]
	mla	z29.h, p7/m, z12.h, z2.h
	addvl	x27, sp, #6
	add	x15, x3, x5
	add	x27, x27, 240
	ldr	z12, [x27]
	mla	z29.h, p7/m, z12.h, z0.h
	addvl	x27, sp, #1
	add	z22.h, z22.h, z29.h
	sqrshrunb	z22.b, z22.h, #6
	add	x27, x27, 240
	uzp1	z22.b, z22.b, z22.b
	stp	q30, q22, [x26, 16]
	str	z10, [x27]
	addvl	x27, sp, #8
	movprfx	z30, z31
	mla	z30.h, p7/m, z9.h, z26.h
	add	x27, x27, 240
	ldr	z9, [x27]
	mla	z30.h, p7/m, z13.h, z16.h
	addvl	x27, sp, #14
	mla	z30.h, p7/m, z10.h, z4.h
	mla	z30.h, p7/m, z9.h, z24.h
	add	x27, x27, 240
	ldr	z9, [x27]
	movprfx	z29, z31
	mla	z29.h, p7/m, z14.h, z3.h
	addvl	x27, sp, #5
	mla	z29.h, p7/m, z21.h, z8.h
	mla	z29.h, p7/m, z9.h, z2.h
	add	x27, x27, 240
	ldr	z22, [x27]
	mla	z29.h, p7/m, z22.h, z0.h
	add	x27, x14, 16
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x26, 48]
	ld1b	z11.h, p7/z, [x4, x27]
	add	x27, x14, 32
	ld1b	z10.h, p7/z, [x4, x27]
	ld1b	z9.h, p7/z, [x1, x0]
	add	x27, x14, 48
	ld1b	z12.h, p7/z, [x4, x27]
	movprfx	z29, z31
	mla	z29.h, p7/m, z17.h, z3.h
	addvl	x27, sp, #18
	mla	z29.h, p7/m, z20.h, z8.h
	mla	z29.h, p7/m, z15.h, z2.h
	add	x27, x27, 240
	ldr	z30, [x27]
	mla	z28.h, p7/m, z30.h, z16.h
	addvl	x27, sp, #3
	mla	z28.h, p7/m, z27.h, z4.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z23.h, z3.h
	add	x27, x27, 240
	ldr	z22, [x27]
	mla	z28.h, p7/m, z1.h, z24.h
	addvl	x27, sp, #10
	mla	z30.h, p7/m, z22.h, z8.h
	mla	z29.h, p7/m, z7.h, z0.h
	add	x27, x27, 240
	ldr	z22, [x27]
	mla	z30.h, p7/m, z22.h, z2.h
	mla	z30.h, p7/m, z5.h, z0.h
	add	z28.h, z28.h, z30.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x15]
	addvl	x15, sp, #17
	add	x15, x15, 240
	movprfx	z30, z31
	mla	z30.h, p7/m, z19.h, z26.h
	ldr	z19, [x15]
	addvl	x15, sp, #16
	add	x27, x13, x13, lsl 2
	mla	z30.h, p7/m, z19.h, z16.h
	add	x15, x15, 240
	ldr	z28, [x15]
	mla	z30.h, p7/m, z28.h, z4.h
	addvl	x15, sp, #7
	str	x27, [sp, 224]
	mov	z19.d, z15.d
	add	x15, x15, 240
	ldr	z28, [x15]
	mla	z30.h, p7/m, z28.h, z24.h
	add	x15, x2, x27
	addvl	x27, sp, #15
	add	z30.h, z30.h, z29.h
	add	x27, x27, 240
	ldr	z15, [x27]
	movprfx	z29, z31
	mla	z29.h, p7/m, z18.h, z26.h
	addvl	x27, sp, #6
	mla	z29.h, p7/m, z25.h, z16.h
	mla	z29.h, p7/m, z15.h, z4.h
	add	x27, x27, 240
	ldr	z18, [x27]
	mla	z29.h, p7/m, z18.h, z24.h
	addvl	x27, sp, #13
	mov	z22.d, z25.d
	sqrshrunb	z30.b, z30.h, #6
	add	x27, x27, 240
	ldr	z18, [x27]
	uzp1	z30.b, z30.b, z30.b
	addvl	x27, sp, #12
	movprfx	z28, z31
	mla	z28.h, p7/m, z18.h, z3.h
	add	x26, x1, x0
	add	x27, x27, 240
	ldr	z15, [x27]
	mla	z28.h, p7/m, z15.h, z8.h
	addvl	x27, sp, #9
	add	x5, x5, x3, lsl 1
	sub	z9.h, z9.h, #128
	add	x27, x27, 240
	ldr	z25, [x27]
	mla	z28.h, p7/m, z25.h, z2.h
	addvl	x27, sp, #14
	mla	z28.h, p7/m, z6.h, z0.h
	add	z29.h, z29.h, z28.h
	add	x27, x27, 240
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x15, 16]
	movprfx	z30, z31
	mla	z30.h, p7/m, z14.h, z26.h
	ldr	z14, [x27]
	addvl	x27, sp, #5
	mla	z30.h, p7/m, z21.h, z16.h
	mla	z30.h, p7/m, z14.h, z4.h
	add	x27, x27, 240
	ldr	z14, [x27]
	mov	z25.d, z13.d
	addvl	x27, sp, #1
	movprfx	z29, z31
	mla	z29.h, p7/m, z13.h, z3.h
	mla	z30.h, p7/m, z14.h, z24.h
	add	x27, x27, 240
	ldr	z28, [x27]
	mla	z29.h, p7/m, z28.h, z8.h
	addvl	x27, sp, #8
	sub	z11.h, z11.h, #128
	sub	z10.h, z10.h, #128
	add	x27, x27, 240
	ldr	z13, [x27]
	mla	z29.h, p7/m, z13.h, z2.h
	addvl	x27, sp, #4
	sub	z12.h, z12.h, #128
	add	x0, x0, x1, lsl 1
	add	x27, x27, 240
	ldr	z13, [x27]
	mla	z29.h, p7/m, z13.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x15, 48]
	lsl	x15, x7, 1
	ld1b	z13.h, p7/z, [x1, x26]
	add	x26, x15, 16
	ld1b	z15.h, p7/z, [x4, x26]
	sub	z15.h, z15.h, #128
	addvl	x26, sp, #13
	add	x27, x3, x5
	sub	z13.h, z13.h, #128
	add	x26, x26, 240
	str	z15, [x26]
	lsl	x13, x13, 3
	add	x26, x15, 32
	ld1b	z14.h, p7/z, [x4, x26]
	sub	z14.h, z14.h, #128
	add	x26, x15, 48
	ld1b	z30.h, p7/z, [x4, x26]
	sub	z30.h, z30.h, #128
	addvl	x26, sp, #2
	add	x15, x15, x1
	add	x26, x26, 240
	str	z30, [x26]
	movprfx	z30, z31
	mla	z30.h, p7/m, z23.h, z26.h
	addvl	x26, sp, #3
	lsl	x14, x14, 1
	add	x26, x26, 240
	ldr	z28, [x26]
	mla	z30.h, p7/m, z28.h, z16.h
	addvl	x26, sp, #10
	movprfx	z28, z31
	mla	z28.h, p7/m, z22.h, z3.h
	lsl	x7, x7, 2
	add	x26, x26, 240
	ldr	z23, [x26]
	mla	z30.h, p7/m, z23.h, z4.h
	addvl	x26, sp, #18
	mla	z30.h, p7/m, z5.h, z24.h
	mov	z23.d, z20.d
	add	x26, x26, 240
	ldr	z15, [x26]
	movprfx	z29, z31
	mla	z29.h, p7/m, z15.h, z3.h
	addvl	x26, sp, #17
	mla	z29.h, p7/m, z27.h, z8.h
	mla	z29.h, p7/m, z1.h, z2.h
	add	x26, x26, 240
	mla	z29.h, p7/m, z9.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x5]
	movprfx	z30, z31
	mla	z30.h, p7/m, z17.h, z26.h
	mla	z30.h, p7/m, z20.h, z16.h
	mov	z20.d, z19.d
	mla	z30.h, p7/m, z19.h, z4.h
	ldr	z19, [x26]
	addvl	x26, sp, #16
	add	x26, x26, 240
	ldr	z17, [x26]
	movprfx	z29, z31
	mla	z29.h, p7/m, z19.h, z3.h
	addvl	x26, sp, #7
	mla	z29.h, p7/m, z17.h, z8.h
	str	x28, [sp, 168]
	add	x26, x26, 240
	ldr	z17, [x26]
	mla	z29.h, p7/m, z17.h, z2.h
	add	x26, x2, x28, lsl 1
	addvl	x28, sp, #12
	mla	z29.h, p7/m, z11.h, z0.h
	add	x28, x28, 240
	mla	z30.h, p7/m, z7.h, z24.h
	add	z30.h, z30.h, z29.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z18.h, z26.h
	ldr	z18, [x28]
	addvl	x28, sp, #9
	add	x28, x28, 240
	mla	z29.h, p7/m, z18.h, z16.h
	ldr	z18, [x28]
	addvl	x28, sp, #15
	mla	z29.h, p7/m, z18.h, z4.h
	sqrshrunb	z30.b, z30.h, #6
	add	x28, x28, 240
	ldr	z18, [x28]
	uzp1	z30.b, z30.b, z30.b
	addvl	x28, sp, #6
	mla	z28.h, p7/m, z18.h, z8.h
	mla	z29.h, p7/m, z6.h, z24.h
	add	x28, x28, 240
	ldr	z17, [x28]
	mla	z28.h, p7/m, z17.h, z2.h
	addvl	x28, sp, #1
	mla	z28.h, p7/m, z10.h, z0.h
	add	z29.h, z29.h, z28.h
	add	x28, x28, 240
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x26, 16]
	movprfx	z30, z31
	mla	z30.h, p7/m, z25.h, z26.h
	ldr	z25, [x28]
	addvl	x28, sp, #8
	mla	z30.h, p7/m, z25.h, z16.h
	add	x28, x28, 240
	ldr	z17, [x28]
	mla	z30.h, p7/m, z17.h, z4.h
	addvl	x28, sp, #4
	add	x5, x5, x3, lsl 1
	add	x28, x28, 240
	ldr	z29, [x28]
	mla	z30.h, p7/m, z29.h, z24.h
	addvl	x28, sp, #14
	movprfx	z29, z31
	mla	z29.h, p7/m, z21.h, z3.h
	add	x28, x28, 240
	ldr	z25, [x28]
	mla	z29.h, p7/m, z25.h, z8.h
	addvl	x28, sp, #5
	mov	z25.d, z20.d
	add	x28, x28, 240
	ldr	z28, [x28]
	mla	z29.h, p7/m, z28.h, z2.h
	add	x28, sp, 240
	mla	z29.h, p7/m, z12.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x26, 48]
	ld1b	z30.h, p7/z, [x1, x0]
	sub	z30.h, z30.h, #128
	str	z30, [x28]
	add	x28, x15, 16
	ld1b	z18.h, p7/z, [x4, x28]
	add	x26, x1, x0
	add	x28, x15, 32
	ld1b	z17.h, p7/z, [x4, x28]
	sub	z18.h, z18.h, #128
	add	x28, x15, 48
	ld1b	z30.h, p7/z, [x4, x28]
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	addvl	x28, sp, #18
	movprfx	z30, z31
	mla	z30.h, p7/m, z15.h, z26.h
	mla	z30.h, p7/m, z27.h, z16.h
	add	x28, x28, 240
	str	z29, [x28]
	mla	z30.h, p7/m, z1.h, z4.h
	addvl	x28, sp, #3
	mla	z30.h, p7/m, z9.h, z24.h
	sub	z17.h, z17.h, #128
	add	x28, x28, 240
	ldr	z29, [x28]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x28, sp, #10
	add	x0, x0, x1, lsl 1
	add	x28, x28, 240
	ldr	z15, [x28]
	mla	z29.h, p7/m, z15.h, z8.h
	add	x28, x18, x25
	addvl	x25, sp, #16
	mla	z29.h, p7/m, z5.h, z2.h
	add	x25, x25, 240
	mla	z29.h, p7/m, z13.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x27]
	ldr	z28, [x25]
	addvl	x27, sp, #15
	movprfx	z30, z31
	mla	z30.h, p7/m, z19.h, z26.h
	addvl	x25, sp, #7
	add	x27, x27, 240
	movprfx	z29, z31
	mla	z29.h, p7/m, z23.h, z3.h
	add	x25, x25, 240
	ldr	z19, [x25]
	mla	z29.h, p7/m, z20.h, z8.h
	ldr	z20, [x27]
	addvl	x25, sp, #13
	addvl	x27, sp, #6
	mla	z30.h, p7/m, z28.h, z16.h
	mla	z29.h, p7/m, z7.h, z2.h
	add	x25, x25, 240
	ldr	z28, [x25]
	add	x27, x27, 240
	mla	z29.h, p7/m, z28.h, z0.h
	mla	z30.h, p7/m, z19.h, z4.h
	mla	z30.h, p7/m, z11.h, z24.h
	add	z30.h, z30.h, z29.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z22.h, z26.h
	ldr	z22, [x27]
	addvl	x27, sp, #12
	add	x27, x27, 240
	mla	z29.h, p7/m, z20.h, z16.h
	mla	z29.h, p7/m, z22.h, z4.h
	ldr	z22, [x27]
	addvl	x27, sp, #9
	add	x25, x2, x28
	add	x27, x27, 240
	ldr	z19, [x27]
	sqrshrunb	z30.b, z30.h, #6
	addvl	x27, sp, #14
	uzp1	z30.b, z30.b, z30.b
	mla	z29.h, p7/m, z10.h, z24.h
	add	x27, x27, 240
	movprfx	z28, z31
	mla	z28.h, p7/m, z22.h, z3.h
	mla	z28.h, p7/m, z19.h, z8.h
	mla	z28.h, p7/m, z6.h, z2.h
	mla	z28.h, p7/m, z14.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x25, 16]
	movprfx	z30, z31
	mla	z30.h, p7/m, z21.h, z26.h
	ldr	z21, [x27]
	addvl	x27, sp, #5
	add	x27, x27, 240
	ldr	z29, [x27]
	mla	z30.h, p7/m, z21.h, z16.h
	addvl	x27, sp, #1
	mla	z30.h, p7/m, z29.h, z4.h
	mla	z30.h, p7/m, z12.h, z24.h
	add	x27, x27, 240
	ldr	z29, [x27]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x27, sp, #8
	add	x28, x2, x28, lsl 1
	add	x27, x27, 240
	ldr	z21, [x27]
	mla	z29.h, p7/m, z21.h, z8.h
	addvl	x27, sp, #4
	lsl	x15, x15, 1
	add	x27, x27, 240
	ldr	z20, [x27]
	mla	z29.h, p7/m, z20.h, z2.h
	addvl	x27, sp, #2
	add	x27, x27, 240
	ldr	z21, [x27]
	mla	z29.h, p7/m, z21.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x25, 48]
	add	x25, x8, 16
	ld1b	z21.h, p7/z, [x4, x25]
	add	x25, x8, 32
	ld1b	z20.h, p7/z, [x4, x25]
	ld1b	z19.h, p7/z, [x1, x26]
	add	x25, x8, 48
	ld1b	z30.h, p7/z, [x4, x25]
	sub	z30.h, z30.h, #128
	addvl	x25, sp, #12
	movprfx	z29, z31
	mla	z29.h, p7/m, z27.h, z3.h
	mla	z29.h, p7/m, z1.h, z8.h
	add	x25, x25, 240
	str	z30, [x25]
	mla	z29.h, p7/m, z9.h, z2.h
	addvl	x25, sp, #3
	addvl	x27, sp, #9
	sub	z19.h, z19.h, #128
	add	x25, x25, 240
	ldr	z30, [x25]
	mad	z30.h, p7/m, z26.h, z31.h
	addvl	x25, sp, #10
	mla	z30.h, p7/m, z15.h, z16.h
	mla	z30.h, p7/m, z5.h, z4.h
	add	x25, x25, 240
	str	z15, [x25]
	mla	z30.h, p7/m, z13.h, z24.h
	add	x25, sp, 240
	ldr	z15, [x25]
	mla	z29.h, p7/m, z15.h, z0.h
	addvl	x25, sp, #13
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	add	x25, x25, 240
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x5]
	ldr	z28, [x25]
	addvl	x25, sp, #16
	movprfx	z30, z31
	mla	z30.h, p7/m, z23.h, z26.h
	add	x25, x25, 240
	ldr	z29, [x25]
	add	x27, x27, 240
	addvl	x25, sp, #7
	mad	z29.h, p7/m, z3.h, z31.h
	mla	z30.h, p7/m, z25.h, z16.h
	add	x25, x25, 240
	ldr	z23, [x25]
	mla	z29.h, p7/m, z23.h, z8.h
	ldr	z23, [x27]
	addvl	x27, sp, #15
	mla	z30.h, p7/m, z7.h, z4.h
	add	x27, x27, 240
	mla	z30.h, p7/m, z28.h, z24.h
	ldr	z28, [x27]
	addvl	x27, sp, #6
	add	x25, x2, x20, lsl 2
	mla	z29.h, p7/m, z11.h, z2.h
	add	x27, x27, 240
	mla	z29.h, p7/m, z18.h, z0.h
	add	z30.h, z30.h, z29.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z22.h, z26.h
	ldr	z22, [x27]
	addvl	x27, sp, #1
	add	x27, x27, 240
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	mla	z29.h, p7/m, z23.h, z16.h
	mad	z28.h, p7/m, z3.h, z31.h
	mla	z29.h, p7/m, z6.h, z4.h
	mla	z28.h, p7/m, z22.h, z8.h
	mla	z29.h, p7/m, z14.h, z24.h
	mla	z28.h, p7/m, z10.h, z2.h
	mla	z28.h, p7/m, z17.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x25, 16]
	ldr	z30, [x27]
	addvl	x27, sp, #8
	mad	z30.h, p7/m, z26.h, z31.h
	sub	z21.h, z21.h, #128
	add	x27, x27, 240
	ldr	z22, [x27]
	mla	z30.h, p7/m, z22.h, z16.h
	addvl	x27, sp, #4
	add	x8, x8, x1
	sub	z20.h, z20.h, #128
	add	x27, x27, 240
	ldr	z23, [x27]
	mla	z30.h, p7/m, z23.h, z4.h
	addvl	x27, sp, #2
	add	x26, x3, x5
	add	x27, x27, 240
	ldr	z22, [x27]
	mla	z30.h, p7/m, z22.h, z24.h
	addvl	x27, sp, #14
	add	x5, x5, x3, lsl 1
	add	x27, x27, 240
	ldr	z29, [x27]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x27, sp, #5
	add	x27, x27, 240
	ldr	z23, [x27]
	mla	z29.h, p7/m, z23.h, z8.h
	addvl	x27, sp, #18
	mla	z29.h, p7/m, z12.h, z2.h
	add	x27, x27, 240
	ldr	z22, [x27]
	mla	z29.h, p7/m, z22.h, z0.h
	add	x27, x8, 16
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x25, 48]
	ld1b	z22.h, p7/z, [x1, x0]
	ld1b	z30.h, p7/z, [x4, x27]
	addvl	x27, sp, #11
	sub	z30.h, z30.h, #128
	add	x27, x27, 240
	str	z30, [x27]
	add	x25, x1, x0
	add	x27, x8, 32
	add	x8, x8, 48
	ld1b	z30.h, p7/z, [x4, x8]
	addvl	x8, sp, #17
	ld1b	z23.h, p7/z, [x4, x27]
	sub	z30.h, z30.h, #128
	add	x8, x8, 240
	str	z30, [x8]
	movprfx	z30, z31
	mla	z30.h, p7/m, z27.h, z26.h
	add	x8, sp, 240
	str	z15, [x8]
	mla	z30.h, p7/m, z1.h, z16.h
	addvl	x8, sp, #10
	mla	z30.h, p7/m, z9.h, z4.h
	mla	z30.h, p7/m, z15.h, z24.h
	add	x8, x8, 240
	ldr	z15, [x8]
	movprfx	z29, z31
	mla	z29.h, p7/m, z15.h, z3.h
	mla	z29.h, p7/m, z5.h, z8.h
	mla	z29.h, p7/m, z13.h, z2.h
	mla	z29.h, p7/m, z19.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x26]
	addvl	x26, sp, #16
	sub	z22.h, z22.h, #128
	add	x26, x26, 240
	ldr	z30, [x26]
	mad	z30.h, p7/m, z26.h, z31.h
	addvl	x26, sp, #7
	add	x8, x3, x20, lsl 2
	sub	z23.h, z23.h, #128
	add	x26, x26, 240
	ldr	z29, [x26]
	mla	z30.h, p7/m, z29.h, z16.h
	addvl	x26, sp, #3
	movprfx	z29, z31
	mla	z29.h, p7/m, z25.h, z3.h
	mla	z29.h, p7/m, z7.h, z8.h
	add	x26, x26, 240
	str	z25, [x26]
	mla	z30.h, p7/m, z11.h, z4.h
	addvl	x26, sp, #13
	mla	z30.h, p7/m, z18.h, z24.h
	str	x8, [sp, 232]
	add	x26, x26, 240
	ldr	z28, [x26]
	mla	z29.h, p7/m, z28.h, z2.h
	addvl	x26, sp, #15
	mla	z29.h, p7/m, z21.h, z0.h
	add	z30.h, z30.h, z29.h
	add	x26, x26, 240
	ldr	z28, [x26]
	movprfx	z29, z31
	mla	z29.h, p7/m, z28.h, z26.h
	addvl	x26, sp, #6
	add	x8, x2, x8
	sqrshrunb	z30.b, z30.h, #6
	add	x26, x26, 240
	ldr	z28, [x26]
	mla	z29.h, p7/m, z28.h, z16.h
	addvl	x26, sp, #9
	uzp1	z30.b, z30.b, z30.b
	mla	z29.h, p7/m, z10.h, z4.h
	add	x26, x26, 240
	ldr	z28, [x26]
	mla	z29.h, p7/m, z17.h, z24.h
	addvl	x26, sp, #14
	mad	z28.h, p7/m, z3.h, z31.h
	mla	z28.h, p7/m, z6.h, z8.h
	add	x26, x26, 240
	mla	z28.h, p7/m, z14.h, z2.h
	mla	z28.h, p7/m, z20.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x8, 16]
	ldr	z30, [x26]
	addvl	x26, sp, #5
	add	x26, x26, 240
	ldr	z27, [x26]
	mad	z30.h, p7/m, z26.h, z31.h
	addvl	x26, sp, #18
	mla	z30.h, p7/m, z27.h, z16.h
	mla	z30.h, p7/m, z12.h, z4.h
	add	x26, x26, 240
	ldr	z25, [x26]
	mla	z30.h, p7/m, z25.h, z24.h
	addvl	x26, sp, #8
	add	x0, x0, x1, lsl 1
	add	x26, x26, 240
	ldr	z29, [x26]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x26, sp, #4
	add	x26, x26, 240
	ldr	z25, [x26]
	mla	z29.h, p7/m, z25.h, z8.h
	addvl	x26, sp, #2
	add	x26, x26, 240
	ldr	z27, [x26]
	mla	z29.h, p7/m, z27.h, z2.h
	addvl	x26, sp, #12
	add	x26, x26, 240
	ldr	z25, [x26]
	mla	z29.h, p7/m, z25.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x8, 48]
	add	x8, x17, 16
	ld1b	z27.h, p7/z, [x4, x8]
	add	x8, x17, 32
	ld1b	z30.h, p7/z, [x4, x8]
	ld1b	z25.h, p7/z, [x1, x25]
	addvl	x8, sp, #10
	sub	z30.h, z30.h, #128
	add	x17, x17, 48
	add	x8, x8, 240
	str	z30, [x8]
	ld1b	z30.h, p7/z, [x4, x17]
	addvl	x8, sp, #1
	sub	z30.h, z30.h, #128
	movprfx	z29, z31
	mla	z29.h, p7/m, z1.h, z3.h
	add	x8, x8, 240
	str	z30, [x8]
	movprfx	z30, z31
	mla	z30.h, p7/m, z15.h, z26.h
	add	x8, sp, 240
	ldr	z15, [x8]
	mla	z29.h, p7/m, z9.h, z8.h
	addvl	x8, sp, #3
	mla	z30.h, p7/m, z5.h, z16.h
	mla	z29.h, p7/m, z15.h, z2.h
	mla	z30.h, p7/m, z13.h, z4.h
	mla	z29.h, p7/m, z22.h, z0.h
	mla	z30.h, p7/m, z19.h, z24.h
	add	x8, x8, 240
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x5]
	addvl	x25, sp, #9
	ldr	z30, [x8]
	addvl	x8, sp, #13
	mad	z30.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z29, [x8]
	mla	z30.h, p7/m, z7.h, z16.h
	addvl	x8, sp, #7
	mla	z30.h, p7/m, z29.h, z4.h
	add	x25, x25, 240
	add	x8, x8, 240
	ldr	z29, [x8]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #11
	mla	z29.h, p7/m, z11.h, z8.h
	mla	z29.h, p7/m, z18.h, z2.h
	add	x8, x8, 240
	ldr	z28, [x8]
	mla	z29.h, p7/m, z28.h, z0.h
	ldr	x8, [sp, 160]
	ldr	z28, [x25]
	mla	z30.h, p7/m, z21.h, z24.h
	addvl	x25, sp, #6
	add	z30.h, z30.h, z29.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z28.h, z26.h
	add	x25, x25, 240
	ldr	z28, [x25]
	sqrshrunb	z30.b, z30.h, #6
	addvl	x25, sp, #8
	uzp1	z30.b, z30.b, z30.b
	mla	z29.h, p7/m, z6.h, z16.h
	add	x8, x2, x8, lsl 1
	add	x25, x25, 240
	mla	z29.h, p7/m, z14.h, z4.h
	mad	z28.h, p7/m, z3.h, z31.h
	mla	z29.h, p7/m, z20.h, z24.h
	mla	z28.h, p7/m, z10.h, z8.h
	mla	z28.h, p7/m, z17.h, z2.h
	mla	z28.h, p7/m, z23.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x8, 16]
	ldr	z30, [x25]
	addvl	x25, sp, #4
	mad	z30.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	ldr	z28, [x25]
	mla	z30.h, p7/m, z28.h, z16.h
	addvl	x25, sp, #2
	ldr	z28, [x26]
	add	x17, x3, x5
	add	x25, x25, 240
	ldr	z29, [x25]
	mla	z30.h, p7/m, z29.h, z4.h
	addvl	x25, sp, #5
	mla	z30.h, p7/m, z28.h, z24.h
	sub	z25.h, z25.h, #128
	add	x25, x25, 240
	ldr	z29, [x25]
	mad	z29.h, p7/m, z3.h, z31.h
	addvl	x25, sp, #18
	mla	z29.h, p7/m, z12.h, z8.h
	mad	z1.h, p7/m, z26.h, z31.h
	add	x25, x25, 240
	ldr	z28, [x25]
	mla	z29.h, p7/m, z28.h, z2.h
	addvl	x25, sp, #17
	mla	z1.h, p7/m, z9.h, z16.h
	mla	z1.h, p7/m, z15.h, z4.h
	add	x25, x25, 240
	ldr	z28, [x25]
	mla	z29.h, p7/m, z28.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x8, 48]
	sub	x8, x6, x1
	ld1b	z28.h, p7/z, [x1, x0]
	add	x26, x8, 16
	ld1b	z30.h, p7/z, [x4, x26]
	mla	z1.h, p7/m, z22.h, z24.h
	add	x26, x8, 32
	add	x8, x8, 48
	ld1b	z29.h, p7/z, [x4, x26]
	addvl	x26, sp, #9
	sub	z29.h, z29.h, #128
	sub	z27.h, z27.h, #128
	add	x26, x26, 240
	str	z29, [x26]
	ld1b	z29.h, p7/z, [x4, x8]
	addvl	x8, sp, #16
	sub	z29.h, z29.h, #128
	addvl	x26, sp, #3
	add	x8, x8, 240
	str	z29, [x8]
	add	x26, x26, 240
	add	x8, sp, 240
	str	z15, [x8]
	movprfx	z15, z31
	mla	z15.h, p7/m, z5.h, z3.h
	mla	z15.h, p7/m, z13.h, z8.h
	mla	z15.h, p7/m, z19.h, z2.h
	mla	z15.h, p7/m, z25.h, z0.h
	add	z1.h, z1.h, z15.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x17]
	addvl	x17, sp, #7
	sub	z28.h, z28.h, #128
	add	x17, x17, 240
	ldr	z1, [x17]
	mad	z1.h, p7/m, z26.h, z31.h
	addvl	x17, sp, #11
	mla	z1.h, p7/m, z11.h, z16.h
	movprfx	z15, z1
	mla	z15.h, p7/m, z18.h, z4.h
	add	x17, x17, 240
	ldr	z1, [x17]
	mla	z15.h, p7/m, z1.h, z24.h
	addvl	x17, sp, #13
	movprfx	z1, z31
	mla	z1.h, p7/m, z7.h, z3.h
	lsl	x8, x3, 5
	add	x17, x17, 240
	ldr	z29, [x17]
	mla	z1.h, p7/m, z29.h, z8.h
	mla	z1.h, p7/m, z21.h, z2.h
	mla	z1.h, p7/m, z27.h, z0.h
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z15.b, z1.b, z1.b
	str	z15, [x26]
	addvl	x26, sp, #6
	sub	x27, x8, x3
	mad	z5.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	ldr	z1, [x26]
	mad	z1.h, p7/m, z26.h, z31.h
	addvl	x26, sp, #10
	mla	z1.h, p7/m, z10.h, z16.h
	movprfx	z15, z1
	mla	z15.h, p7/m, z17.h, z4.h
	add	x26, x26, 240
	ldr	z29, [x26]
	mla	z15.h, p7/m, z23.h, z24.h
	addvl	x26, sp, #3
	movprfx	z1, z31
	mla	z1.h, p7/m, z6.h, z3.h
	mla	z1.h, p7/m, z14.h, z8.h
	add	x26, x26, 240
	mla	z1.h, p7/m, z20.h, z2.h
	mla	z1.h, p7/m, z29.h, z0.h
	add	z1.h, z15.h, z1.h
	add	x17, x2, x27
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	add	x25, x1, x0
	add	x5, x5, x3, lsl 1
	ldr	q15, [x26]
	mla	z5.h, p7/m, z13.h, z16.h
	mla	z5.h, p7/m, z19.h, z4.h
	addvl	x26, sp, #5
	mla	z5.h, p7/m, z25.h, z24.h
	sub	z30.h, z30.h, #128
	add	x26, x26, 240
	mad	z7.h, p7/m, z26.h, z31.h
	mad	z6.h, p7/m, z26.h, z31.h
	mla	z6.h, p7/m, z14.h, z16.h
	mla	z6.h, p7/m, z20.h, z4.h
	add	x0, x0, x1, lsl 1
	stp	q15, q1, [x17, 16]
	ldr	z1, [x26]
	addvl	x26, sp, #18
	add	x26, x26, 240
	ldr	z29, [x26]
	mad	z1.h, p7/m, z26.h, z31.h
	addvl	x26, sp, #17
	mla	z1.h, p7/m, z12.h, z16.h
	movprfx	z15, z1
	mla	z15.h, p7/m, z29.h, z4.h
	add	x26, x26, 240
	ldr	z1, [x26]
	mla	z15.h, p7/m, z1.h, z24.h
	addvl	x26, sp, #4
	add	x27, x2, x27, lsl 1
	add	x26, x26, 240
	ldr	z1, [x26]
	mad	z1.h, p7/m, z3.h, z31.h
	addvl	x26, sp, #2
	add	x26, x26, 240
	ldr	z29, [x26]
	mla	z1.h, p7/m, z29.h, z8.h
	addvl	x26, sp, #12
	add	x26, x26, 240
	ldr	z29, [x26]
	mla	z1.h, p7/m, z29.h, z2.h
	addvl	x26, sp, #1
	add	x26, x26, 240
	ldr	z29, [x26]
	mla	z1.h, p7/m, z29.h, z0.h
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x17, 48]
	addvl	x17, sp, #8
	ld1b	z1.h, p7/z, [x1, x25]
	add	x17, x17, 240
	sub	z1.h, z1.h, #128
	str	z1, [x17]
	add	x17, x6, 16
	ld1b	z1.h, p7/z, [x4, x17]
	movprfx	z15, z1
	sub	z15.h, z15.h, #128
	addvl	x17, sp, #15
	addvl	x26, sp, #10
	add	x17, x17, 240
	str	z15, [x17]
	add	x26, x26, 240
	add	x17, x6, 32
	ld1b	z1.h, p7/z, [x4, x17]
	movprfx	z15, z1
	sub	z15.h, z15.h, #128
	addvl	x17, sp, #7
	add	x25, x3, x5
	add	x17, x17, 240
	str	z15, [x17]
	add	x17, x6, 48
	ld1b	z1.h, p7/z, [x4, x17]
	sub	z1.h, z1.h, #128
	addvl	x17, sp, #6
	add	x6, x6, x1
	add	x17, x17, 240
	str	z1, [x17]
	movprfx	z1, z31
	mla	z1.h, p7/m, z9.h, z3.h
	add	x17, sp, 240
	ldr	z15, [x17]
	mla	z1.h, p7/m, z15.h, z8.h
	addvl	x17, sp, #13
	mla	z1.h, p7/m, z22.h, z2.h
	mla	z1.h, p7/m, z28.h, z0.h
	add	x17, x17, 240
	add	z5.h, z5.h, z1.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x5]
	mad	z9.h, p7/m, z26.h, z31.h
	ldr	z5, [x17]
	addvl	x17, sp, #11
	mla	z7.h, p7/m, z5.h, z16.h
	add	x17, x17, 240
	ldr	z1, [x17]
	movprfx	z5, z31
	mla	z5.h, p7/m, z11.h, z3.h
	mla	z5.h, p7/m, z18.h, z8.h
	mla	z5.h, p7/m, z1.h, z2.h
	mla	z5.h, p7/m, z30.h, z0.h
	mla	z7.h, p7/m, z21.h, z4.h
	mla	z7.h, p7/m, z27.h, z24.h
	add	z7.h, z7.h, z5.h
	ldr	z5, [x26]
	addvl	x26, sp, #9
	add	x17, x2, x8
	add	x26, x26, 240
	ldr	z29, [x26]
	sqrshrunb	z7.b, z7.h, #6
	addvl	x26, sp, #4
	uzp1	z7.b, z7.b, z7.b
	mla	z6.h, p7/m, z5.h, z24.h
	add	x26, x26, 240
	movprfx	z5, z31
	mla	z5.h, p7/m, z10.h, z3.h
	mla	z5.h, p7/m, z17.h, z8.h
	mla	z5.h, p7/m, z23.h, z2.h
	mla	z5.h, p7/m, z29.h, z0.h
	add	z6.h, z6.h, z5.h
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	stp	q7, q6, [x17, 16]
	ldr	z7, [x26]
	addvl	x26, sp, #2
	mad	z7.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	ldr	z29, [x26]
	mla	z7.h, p7/m, z29.h, z16.h
	addvl	x26, sp, #12
	mla	z9.h, p7/m, z15.h, z16.h
	mla	z9.h, p7/m, z22.h, z4.h
	add	x26, x26, 240
	ldr	z6, [x26]
	mla	z7.h, p7/m, z6.h, z4.h
	addvl	x26, sp, #1
	mla	z9.h, p7/m, z28.h, z24.h
	mad	z11.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	ldr	z6, [x26]
	mad	z6.h, p7/m, z24.h, z7.h
	addvl	x26, sp, #18
	movprfx	z7, z31
	mla	z7.h, p7/m, z12.h, z3.h
	mla	z11.h, p7/m, z18.h, z16.h
	add	x26, x26, 240
	ldr	z1, [x26]
	mla	z7.h, p7/m, z1.h, z8.h
	addvl	x26, sp, #17
	add	x8, x8, x3
	mad	z10.h, p7/m, z26.h, z31.h
	add	x26, x26, 240
	ldr	z5, [x26]
	mla	z7.h, p7/m, z5.h, z2.h
	addvl	x26, sp, #16
	add	x8, x2, x8
	mla	z10.h, p7/m, z17.h, z16.h
	add	x26, x26, 240
	ldr	z5, [x26]
	mla	z7.h, p7/m, z5.h, z0.h
	add	x26, x6, 16
	add	z7.h, z6.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x17, 48]
	ld1b	z6.h, p7/z, [x1, x0]
	ld1b	z7.h, p7/z, [x4, x26]
	addvl	x26, sp, #14
	sub	z7.h, z7.h, #128
	add	x26, x26, 240
	str	z7, [x26]
	mla	z10.h, p7/m, z23.h, z4.h
	add	x26, x6, 32
	add	x6, x6, 48
	ld1b	z5.h, p7/z, [x4, x6]
	add	x6, sp, 240
	ld1b	z7.h, p7/z, [x4, x26]
	str	z15, [x6]
	addvl	x6, sp, #8
	movprfx	z1, z5
	sub	z1.h, z1.h, #128
	movprfx	z5, z31
	mla	z5.h, p7/m, z13.h, z3.h
	add	x6, x6, 240
	ldr	z15, [x6]
	mla	z5.h, p7/m, z19.h, z8.h
	addvl	x6, sp, #11
	mla	z5.h, p7/m, z25.h, z2.h
	mla	z5.h, p7/m, z15.h, z0.h
	add	x6, x6, 240
	add	z9.h, z9.h, z5.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	str	q9, [x3, x25]
	mad	z12.h, p7/m, z26.h, z31.h
	ldr	z9, [x6]
	addvl	x6, sp, #13
	mla	z11.h, p7/m, z9.h, z4.h
	add	x6, x6, 240
	ldr	z9, [x6]
	mad	z9.h, p7/m, z3.h, z31.h
	addvl	x6, sp, #15
	mla	z9.h, p7/m, z21.h, z8.h
	mla	z9.h, p7/m, z27.h, z2.h
	add	x6, x6, 240
	ldr	z15, [x6]
	mla	z9.h, p7/m, z15.h, z0.h
	addvl	x6, sp, #9
	mla	z11.h, p7/m, z30.h, z24.h
	add	z11.h, z11.h, z9.h
	add	x6, x6, 240
	ldr	z15, [x6]
	mla	z10.h, p7/m, z15.h, z24.h
	addvl	x6, sp, #10
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	add	x6, x6, 240
	ldr	z5, [x6]
	movprfx	z9, z31
	mla	z9.h, p7/m, z14.h, z3.h
	addvl	x6, sp, #7
	mla	z9.h, p7/m, z20.h, z8.h
	mla	z9.h, p7/m, z5.h, z2.h
	add	x6, x6, 240
	ldr	z15, [x6]
	mla	z9.h, p7/m, z15.h, z0.h
	addvl	x6, sp, #18
	add	z10.h, z10.h, z9.h
	sqrshrunb	z10.b, z10.h, #6
	add	x6, x6, 240
	uzp1	z10.b, z10.b, z10.b
	stp	q11, q10, [x8, 16]
	ldr	z11, [x6]
	addvl	x6, sp, #17
	mla	z12.h, p7/m, z11.h, z16.h
	add	x6, x6, 240
	ldr	z10, [x6]
	mla	z12.h, p7/m, z10.h, z4.h
	addvl	x6, sp, #16
	add	x17, x1, x0
	sub	z6.h, z6.h, #128
	add	x6, x6, 240
	ldr	z11, [x6]
	mla	z12.h, p7/m, z11.h, z24.h
	addvl	x6, sp, #2
	movprfx	z11, z31
	mla	z11.h, p7/m, z29.h, z3.h
	add	x5, x5, x3, lsl 1
	add	x6, x6, 240
	str	z29, [x6]
	mad	z13.h, p7/m, z26.h, z31.h
	addvl	x6, sp, #12
	mla	z13.h, p7/m, z19.h, z16.h
	mla	z13.h, p7/m, z25.h, z4.h
	add	x6, x6, 240
	ldr	z10, [x6]
	mla	z11.h, p7/m, z10.h, z8.h
	addvl	x6, sp, #1
	sub	z7.h, z7.h, #128
	mad	z14.h, p7/m, z26.h, z31.h
	add	x6, x6, 240
	ldr	z29, [x6]
	mla	z11.h, p7/m, z29.h, z2.h
	addvl	x6, sp, #6
	mla	z14.h, p7/m, z20.h, z16.h
	add	x0, x0, x1, lsl 1
	add	x6, x6, 240
	ldr	z9, [x6]
	mla	z11.h, p7/m, z9.h, z0.h
	addvl	x6, sp, #5
	add	z12.h, z12.h, z11.h
	sqrshrunb	z12.b, z12.h, #6
	add	x6, x6, 240
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x8, 48]
	ld1b	z12.h, p7/z, [x1, x17]
	sub	z12.h, z12.h, #128
	str	z12, [x6]
	add	x6, x16, 16
	ld1b	z11.h, p7/z, [x4, x6]
	sub	z11.h, z11.h, #128
	addvl	x6, sp, #4
	addvl	x17, sp, #10
	add	x6, x6, 240
	str	z11, [x6]
	add	x17, x17, 240
	add	x6, x16, 32
	ld1b	z11.h, p7/z, [x4, x6]
	movprfx	z9, z11
	sub	z9.h, z9.h, #128
	add	x6, x16, 48
	ld1b	z11.h, p7/z, [x4, x6]
	movprfx	z5, z11
	sub	z5.h, z5.h, #128
	addvl	x6, sp, #8
	add	x16, x16, x1
	add	x6, x6, 240
	ldr	z15, [x6]
	mla	z13.h, p7/m, z15.h, z24.h
	add	x6, sp, 240
	ldr	z11, [x6]
	mad	z11.h, p7/m, z3.h, z31.h
	addvl	x6, sp, #13
	mla	z11.h, p7/m, z22.h, z8.h
	mla	z11.h, p7/m, z28.h, z2.h
	add	x6, x6, 240
	mla	z11.h, p7/m, z6.h, z0.h
	add	z13.h, z13.h, z11.h
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x3, x5]
	ldr	z10, [x6]
	addvl	x6, sp, #15
	movprfx	z15, z31
	mla	z15.h, p7/m, z10.h, z26.h
	add	x6, x6, 240
	ldr	z10, [x6]
	movprfx	z13, z31
	mla	z13.h, p7/m, z18.h, z3.h
	addvl	x6, sp, #11
	mla	z15.h, p7/m, z21.h, z16.h
	mla	z15.h, p7/m, z27.h, z4.h
	add	x6, x6, 240
	ldr	z11, [x6]
	mla	z13.h, p7/m, z11.h, z8.h
	addvl	x6, sp, #14
	mla	z13.h, p7/m, z30.h, z2.h
	mla	z15.h, p7/m, z10.h, z24.h
	add	x6, x6, 240
	ldr	z12, [x6]
	mla	z13.h, p7/m, z12.h, z0.h
	add	z15.h, z15.h, z13.h
	ldr	z13, [x17]
	addvl	x17, sp, #7
	add	x17, x17, 240
	ldr	z12, [x17]
	add	x6, x2, x19, lsl 1
	addvl	x17, sp, #9
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	add	x17, x17, 240
	ldr	z11, [x17]
	mla	z14.h, p7/m, z13.h, z4.h
	addvl	x17, sp, #2
	mla	z14.h, p7/m, z12.h, z24.h
	movprfx	z13, z31
	mla	z13.h, p7/m, z17.h, z3.h
	add	x17, x17, 240
	mla	z13.h, p7/m, z23.h, z8.h
	mla	z13.h, p7/m, z11.h, z2.h
	mla	z13.h, p7/m, z7.h, z0.h
	add	z14.h, z14.h, z13.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	stp	q15, q14, [x6, 16]
	ldr	z15, [x17]
	addvl	x17, sp, #12
	mad	z15.h, p7/m, z26.h, z31.h
	mad	z18.h, p7/m, z26.h, z31.h
	add	x17, x17, 240
	ldr	z14, [x17]
	mla	z15.h, p7/m, z14.h, z16.h
	addvl	x17, sp, #1
	mla	z15.h, p7/m, z29.h, z4.h
	add	x8, x3, x5
	add	x17, x17, 240
	str	z29, [x17]
	add	x19, x3, x19, lsl 1
	addvl	x17, sp, #6
	add	x19, x2, x19
	mad	z17.h, p7/m, z26.h, z31.h
	add	x17, x17, 240
	ldr	z14, [x17]
	mla	z15.h, p7/m, z14.h, z24.h
	addvl	x17, sp, #18
	mla	z17.h, p7/m, z23.h, z16.h
	add	x5, x5, x3, lsl 1
	add	x17, x17, 240
	ldr	z29, [x17]
	movprfx	z14, z31
	mla	z14.h, p7/m, z29.h, z3.h
	addvl	x17, sp, #17
	add	x17, x17, 240
	ldr	z13, [x17]
	mla	z14.h, p7/m, z13.h, z8.h
	addvl	x17, sp, #16
	add	x17, x17, 240
	ldr	z12, [x17]
	mla	z14.h, p7/m, z12.h, z2.h
	mla	z14.h, p7/m, z1.h, z0.h
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	add	x17, x16, 16
	str	q15, [x6, 48]
	ld1b	z15.h, p7/z, [x1, x0]
	movprfx	z14, z15
	sub	z14.h, z14.h, #128
	add	x6, x1, x0
	ld1b	z15.h, p7/z, [x4, x17]
	addvl	x17, sp, #3
	sub	z15.h, z15.h, #128
	add	x17, x17, 240
	str	z15, [x17]
	add	x0, x0, x1, lsl 1
	add	x17, x16, 32
	add	x16, x16, 48
	ld1b	z15.h, p7/z, [x4, x17]
	movprfx	z11, z15
	sub	z11.h, z11.h, #128
	ld1b	z15.h, p7/z, [x4, x16]
	addvl	x16, sp, #2
	add	x16, x16, 240
	sub	z15.h, z15.h, #128
	str	z15, [x16]
	add	x16, sp, 240
	ldr	z15, [x16]
	mad	z15.h, p7/m, z26.h, z31.h
	addvl	x16, sp, #8
	mla	z15.h, p7/m, z22.h, z16.h
	movprfx	z13, z15
	mla	z13.h, p7/m, z28.h, z4.h
	add	x16, x16, 240
	ldr	z12, [x16]
	mla	z13.h, p7/m, z6.h, z24.h
	addvl	x16, sp, #5
	movprfx	z15, z31
	mla	z15.h, p7/m, z19.h, z3.h
	mla	z15.h, p7/m, z25.h, z8.h
	add	x16, x16, 240
	mla	z15.h, p7/m, z12.h, z2.h
	ldr	z12, [x16]
	mla	z15.h, p7/m, z12.h, z0.h
	add	z15.h, z13.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x8]
	addvl	x8, sp, #11
	add	x8, x8, 240
	ldr	z15, [x8]
	mla	z18.h, p7/m, z15.h, z16.h
	addvl	x8, sp, #14
	mla	z18.h, p7/m, z30.h, z4.h
	lsl	x16, x12, 2
	add	x8, x8, 240
	ldr	z15, [x8]
	mla	z18.h, p7/m, z15.h, z24.h
	addvl	x8, sp, #4
	movprfx	z15, z31
	mla	z15.h, p7/m, z21.h, z3.h
	mla	z15.h, p7/m, z27.h, z8.h
	add	x8, x8, 240
	ldr	z13, [x8]
	mla	z15.h, p7/m, z10.h, z2.h
	addvl	x8, sp, #9
	mla	z15.h, p7/m, z13.h, z0.h
	add	z18.h, z18.h, z15.h
	add	x8, x8, 240
	ldr	z15, [x8]
	mla	z17.h, p7/m, z15.h, z4.h
	addvl	x8, sp, #10
	movprfx	z15, z31
	mla	z15.h, p7/m, z20.h, z3.h
	mla	z17.h, p7/m, z7.h, z24.h
	add	x8, x8, 240
	ldr	z12, [x8]
	mla	z15.h, p7/m, z12.h, z8.h
	addvl	x8, sp, #7
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	add	x8, x8, 240
	ldr	z12, [x8]
	mla	z15.h, p7/m, z12.h, z2.h
	addvl	x8, sp, #17
	mla	z15.h, p7/m, z9.h, z0.h
	add	z17.h, z17.h, z15.h
	add	x8, x8, 240
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	stp	q18, q17, [x19, 16]
	ldr	z17, [x8]
	addvl	x8, sp, #16
	add	x8, x8, 240
	ldr	z12, [x8]
	movprfx	z18, z31
	mla	z18.h, p7/m, z29.h, z26.h
	addvl	x8, sp, #12
	mla	z18.h, p7/m, z17.h, z16.h
	mla	z18.h, p7/m, z12.h, z4.h
	add	x8, x8, 240
	ldr	z17, [x8]
	mla	z18.h, p7/m, z1.h, z24.h
	addvl	x8, sp, #1
	mad	z17.h, p7/m, z3.h, z31.h
	mad	z19.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z29, [x8]
	mla	z17.h, p7/m, z29.h, z8.h
	addvl	x8, sp, #6
	mla	z19.h, p7/m, z25.h, z16.h
	mad	z21.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z13, [x8]
	mla	z17.h, p7/m, z13.h, z2.h
	mla	z17.h, p7/m, z5.h, z0.h
	add	z18.h, z18.h, z17.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x19, 48]
	mla	z21.h, p7/m, z27.h, z16.h
	ld1b	z18.h, p7/z, [x1, x6]
	add	x6, x16, 16
	movprfx	z17, z18
	sub	z17.h, z17.h, #128
	ld1b	z18.h, p7/z, [x4, x6]
	addvl	x6, sp, #18
	sub	z18.h, z18.h, #128
	add	x6, x6, 240
	str	z18, [x6]
	mla	z21.h, p7/m, z10.h, z4.h
	add	x6, x16, 32
	ld1b	z18.h, p7/z, [x4, x6]
	movprfx	z15, z18
	sub	z15.h, z15.h, #128
	add	x6, x16, 48
	ld1b	z18.h, p7/z, [x4, x6]
	sub	z18.h, z18.h, #128
	add	x6, sp, 240
	str	z18, [x6]
	addvl	x8, sp, #10
	addvl	x6, sp, #8
	add	x8, x8, 240
	mad	z20.h, p7/m, z26.h, z31.h
	add	x6, x6, 240
	ldr	z18, [x6]
	mla	z19.h, p7/m, z18.h, z4.h
	addvl	x6, sp, #5
	movprfx	z18, z31
	mla	z18.h, p7/m, z22.h, z3.h
	mla	z18.h, p7/m, z28.h, z8.h
	add	x6, x6, 240
	ldr	z12, [x6]
	mla	z18.h, p7/m, z6.h, z2.h
	addvl	x6, sp, #15
	mla	z18.h, p7/m, z14.h, z0.h
	mla	z19.h, p7/m, z12.h, z24.h
	add	x6, x6, 240
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x5]
	ldr	z12, [x8]
	str	z10, [x6]
	addvl	x6, sp, #4
	mla	z20.h, p7/m, z12.h, z16.h
	add	x6, x6, 240
	ldr	z10, [x6]
	addvl	x8, sp, #7
	addvl	x6, sp, #11
	add	x8, x8, 240
	mla	z21.h, p7/m, z10.h, z24.h
	add	x6, x6, 240
	ldr	z19, [x6]
	mad	z19.h, p7/m, z3.h, z31.h
	addvl	x6, sp, #14
	mla	z19.h, p7/m, z30.h, z8.h
	add	x19, x3, x5
	add	x6, x6, 240
	ldr	z18, [x6]
	mla	z19.h, p7/m, z18.h, z2.h
	addvl	x6, sp, #3
	mad	z22.h, p7/m, z26.h, z31.h
	mla	z22.h, p7/m, z28.h, z16.h
	add	x6, x6, 240
	ldr	z18, [x6]
	mla	z19.h, p7/m, z18.h, z0.h
	add	z21.h, z21.h, z19.h
	ldr	z19, [x8]
	addvl	x8, sp, #9
	add	x6, x2, x30, lsl 2
	add	x8, x8, 240
	ldr	z18, [x8]
	addvl	x8, sp, #12
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	add	x8, x8, 240
	mla	z20.h, p7/m, z19.h, z4.h
	movprfx	z19, z31
	mla	z19.h, p7/m, z23.h, z3.h
	mla	z20.h, p7/m, z9.h, z24.h
	mla	z19.h, p7/m, z18.h, z8.h
	mla	z19.h, p7/m, z7.h, z2.h
	mla	z19.h, p7/m, z11.h, z0.h
	add	z20.h, z20.h, z19.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	stp	q21, q20, [x6, 16]
	ldr	z21, [x8]
	addvl	x8, sp, #1
	mad	z21.h, p7/m, z26.h, z31.h
	mla	z21.h, p7/m, z29.h, z16.h
	add	x8, x8, 240
	str	z29, [x8]
	mla	z21.h, p7/m, z13.h, z4.h
	addvl	x8, sp, #6
	mla	z21.h, p7/m, z5.h, z24.h
	mla	z22.h, p7/m, z6.h, z4.h
	add	x8, x8, 240
	str	z13, [x8]
	mla	z22.h, p7/m, z14.h, z24.h
	addvl	x8, sp, #17
	add	x30, x3, x30, lsl 2
	mad	z23.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z13, [x8]
	movprfx	z20, z31
	mla	z20.h, p7/m, z13.h, z3.h
	addvl	x8, sp, #16
	add	x30, x2, x30
	add	x8, x8, 240
	ldr	z12, [x8]
	mla	z20.h, p7/m, z12.h, z8.h
	addvl	x8, sp, #2
	mla	z20.h, p7/m, z1.h, z2.h
	add	x17, x1, x0
	add	x8, x8, 240
	ldr	z29, [x8]
	mla	z20.h, p7/m, z29.h, z0.h
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x6, 48]
	lsl	x6, x24, 4
	ld1b	z21.h, p7/z, [x1, x0]
	sub	x8, x6, x24
	movprfx	z20, z21
	sub	z20.h, z20.h, #128
	add	x25, x8, 16
	ld1b	z21.h, p7/z, [x4, x25]
	movprfx	z19, z21
	sub	z19.h, z19.h, #128
	add	x25, x8, 32
	add	x8, x8, 48
	ld1b	z21.h, p7/z, [x4, x25]
	movprfx	z18, z21
	sub	z18.h, z18.h, #128
	ld1b	z21.h, p7/z, [x4, x8]
	addvl	x8, sp, #19
	add	x8, x8, 240
	sub	z21.h, z21.h, #128
	str	z21, [x8]
	addvl	x8, sp, #8
	movprfx	z21, z31
	mla	z21.h, p7/m, z25.h, z3.h
	add	x5, x5, x3, lsl 1
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z21.h, p7/m, z10.h, z8.h
	addvl	x8, sp, #5
	mad	z25.h, p7/m, z26.h, z31.h
	add	x0, x0, x1, lsl 1
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z21.h, p7/m, z10.h, z2.h
	addvl	x8, sp, #11
	mla	z21.h, p7/m, z17.h, z0.h
	add	z22.h, z22.h, z21.h
	add	x8, x8, 240
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x19]
	ldr	z22, [x8]
	addvl	x8, sp, #14
	add	x8, x8, 240
	ldr	z21, [x8]
	mad	z22.h, p7/m, z26.h, z31.h
	addvl	x8, sp, #3
	mla	z22.h, p7/m, z30.h, z16.h
	mla	z22.h, p7/m, z21.h, z4.h
	add	x8, x8, 240
	ldr	z21, [x8]
	mad	z21.h, p7/m, z24.h, z22.h
	addvl	x8, sp, #15
	movprfx	z22, z31
	mla	z22.h, p7/m, z27.h, z3.h
	mad	z27.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z22.h, p7/m, z10.h, z8.h
	addvl	x8, sp, #4
	addvl	x19, sp, #10
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z22.h, p7/m, z10.h, z2.h
	addvl	x8, sp, #18
	add	x19, x19, 240
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z22.h, p7/m, z10.h, z0.h
	addvl	x8, sp, #9
	add	z22.h, z21.h, z22.h
	sqrshrunb	z22.b, z22.h, #6
	add	x8, x8, 240
	uzp1	z21.b, z22.b, z22.b
	ldr	z22, [x8]
	addvl	x8, sp, #10
	mla	z23.h, p7/m, z22.h, z16.h
	mla	z23.h, p7/m, z7.h, z4.h
	add	x8, x8, 240
	ldr	z22, [x8]
	mla	z23.h, p7/m, z11.h, z24.h
	addvl	x8, sp, #7
	mad	z22.h, p7/m, z3.h, z31.h
	add	x12, x12, x16
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z22.h, p7/m, z10.h, z8.h
	addvl	x8, sp, #1
	mla	z22.h, p7/m, z9.h, z2.h
	mla	z22.h, p7/m, z15.h, z0.h
	add	z23.h, z23.h, z22.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	add	x8, x8, 240
	stp	q21, q23, [x30, 16]
	movprfx	z23, z31
	mla	z23.h, p7/m, z13.h, z26.h
	mla	z23.h, p7/m, z12.h, z16.h
	mla	z23.h, p7/m, z1.h, z4.h
	movprfx	z22, z23
	mla	z22.h, p7/m, z29.h, z24.h
	ldr	z23, [x8]
	addvl	x8, sp, #6
	mad	z23.h, p7/m, z3.h, z31.h
	add	x8, x8, 240
	ldr	z21, [x8]
	mla	z23.h, p7/m, z21.h, z8.h
	add	x8, sp, 240
	ldr	z13, [x8]
	mla	z23.h, p7/m, z5.h, z2.h
	mla	z23.h, p7/m, z13.h, z0.h
	add	z23.h, z22.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	add	x8, x23, 16
	str	q23, [x30, 48]
	ld1b	z23.h, p7/z, [x1, x17]
	movprfx	z21, z23
	sub	z21.h, z21.h, #128
	add	x17, x3, x5
	ld1b	z23.h, p7/z, [x4, x8]
	add	x8, x23, 32
	movprfx	z22, z23
	sub	z22.h, z22.h, #128
	ld1b	z23.h, p7/z, [x4, x8]
	addvl	x8, sp, #11
	sub	z23.h, z23.h, #128
	add	x8, x8, 240
	str	z23, [x8]
	add	x23, x23, 48
	addvl	x8, sp, #2
	ld1b	z23.h, p7/z, [x4, x23]
	sub	z23.h, z23.h, #128
	add	x8, x8, 240
	str	z23, [x8]
	addvl	x8, sp, #8
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z25.h, p7/m, z10.h, z16.h
	addvl	x8, sp, #5
	add	x8, x8, 240
	ldr	z23, [x8]
	mla	z25.h, p7/m, z23.h, z4.h
	addvl	x8, sp, #15
	mla	z25.h, p7/m, z17.h, z24.h
	movprfx	z23, z31
	mla	z23.h, p7/m, z28.h, z3.h
	add	x8, x8, 240
	mla	z23.h, p7/m, z6.h, z8.h
	mla	z23.h, p7/m, z14.h, z2.h
	mla	z23.h, p7/m, z20.h, z0.h
	add	z25.h, z25.h, z23.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x5]
	ldr	z10, [x8]
	addvl	x8, sp, #4
	mla	z27.h, p7/m, z10.h, z16.h
	mad	z28.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z27.h, p7/m, z25.h, z4.h
	addvl	x8, sp, #18
	mla	z28.h, p7/m, z6.h, z16.h
	mla	z28.h, p7/m, z14.h, z4.h
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z27.h, p7/m, z25.h, z24.h
	addvl	x8, sp, #14
	movprfx	z25, z31
	mla	z25.h, p7/m, z30.h, z3.h
	mla	z28.h, p7/m, z20.h, z24.h
	add	x8, x8, 240
	ldr	z23, [x8]
	mla	z25.h, p7/m, z23.h, z8.h
	addvl	x8, sp, #3
	mad	z30.h, p7/m, z26.h, z31.h
	add	x5, x5, x3, lsl 1
	ldr	x23, [sp, 192]
	add	x8, x8, 240
	ldr	z23, [x8]
	mla	z25.h, p7/m, z23.h, z2.h
	mla	z25.h, p7/m, z19.h, z0.h
	add	z27.h, z27.h, z25.h
	sqrshrunb	z27.b, z27.h, #6
	ldr	z25, [x19]
	addvl	x19, sp, #7
	mad	z25.h, p7/m, z26.h, z31.h
	add	x19, x19, 240
	ldr	z23, [x19]
	add	x8, x2, x23, lsl 1
	addvl	x19, sp, #9
	mla	z25.h, p7/m, z23.h, z16.h
	mla	z25.h, p7/m, z9.h, z4.h
	add	x19, x19, 240
	movprfx	z23, z25
	mla	z23.h, p7/m, z15.h, z24.h
	ldr	z25, [x19]
	addvl	x19, sp, #1
	uzp1	z27.b, z27.b, z27.b
	mad	z25.h, p7/m, z3.h, z31.h
	add	x19, x19, 240
	mla	z25.h, p7/m, z7.h, z8.h
	mla	z25.h, p7/m, z11.h, z2.h
	mla	z25.h, p7/m, z18.h, z0.h
	add	z25.h, z23.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	stp	q27, q25, [x8, 16]
	ldr	z27, [x19]
	addvl	x19, sp, #6
	mov	z23.d, z29.d
	mad	z27.h, p7/m, z26.h, z31.h
	add	x19, x19, 240
	ldr	z25, [x19]
	mla	z27.h, p7/m, z25.h, z16.h
	add	x19, sp, 240
	str	z13, [x19]
	mla	z27.h, p7/m, z5.h, z4.h
	addvl	x19, sp, #19
	mla	z27.h, p7/m, z13.h, z24.h
	movprfx	z25, z31
	mla	z25.h, p7/m, z12.h, z3.h
	add	x19, x19, 240
	mla	z25.h, p7/m, z1.h, z8.h
	mla	z25.h, p7/m, z29.h, z2.h
	ldr	z29, [x19]
	sub	x19, x6, x1
	mla	z25.h, p7/m, z29.h, z0.h
	add	z27.h, z27.h, z25.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	add	x23, x19, 16
	str	q27, [x8, 48]
	ld1b	z27.h, p7/z, [x1, x0]
	movprfx	z25, z27
	sub	z25.h, z25.h, #128
	ld1b	z27.h, p7/z, [x4, x23]
	addvl	x23, sp, #1
	add	x23, x23, 240
	sub	z27.h, z27.h, #128
	str	z27, [x23]
	add	x23, x19, 32
	add	x19, x19, 48
	ld1b	z27.h, p7/z, [x4, x23]
	addvl	x23, sp, #22
	sub	z27.h, z27.h, #128
	add	x8, x1, x0
	add	x23, x23, 240
	str	z27, [x23]
	ld1b	z27.h, p7/z, [x4, x19]
	addvl	x19, sp, #21
	movprfx	z13, z27
	sub	z13.h, z13.h, #128
	add	x0, x0, x1, lsl 1
	add	x19, x19, 240
	str	z13, [x19]
	addvl	x19, sp, #8
	add	x19, x19, 240
	ldr	z29, [x19]
	movprfx	z27, z31
	mla	z27.h, p7/m, z29.h, z3.h
	addvl	x19, sp, #5
	add	x19, x19, 240
	ldr	z29, [x19]
	mla	z27.h, p7/m, z29.h, z8.h
	mla	z27.h, p7/m, z17.h, z2.h
	mla	z27.h, p7/m, z21.h, z0.h
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x17]
	addvl	x17, sp, #14
	add	x17, x17, 240
	ldr	z28, [x17]
	mla	z30.h, p7/m, z28.h, z16.h
	addvl	x17, sp, #3
	movprfx	z28, z31
	mla	z28.h, p7/m, z10.h, z3.h
	sub	x19, x13, x3
	add	x17, x17, 240
	ldr	z13, [x17]
	mla	z30.h, p7/m, z13.h, z4.h
	addvl	x17, sp, #4
	mla	z30.h, p7/m, z19.h, z24.h
	add	x19, x2, x19
	add	x17, x17, 240
	ldr	z29, [x17]
	mla	z28.h, p7/m, z29.h, z8.h
	addvl	x17, sp, #18
	add	x17, x17, 240
	ldr	z29, [x17]
	mla	z28.h, p7/m, z29.h, z2.h
	addvl	x17, sp, #9
	mla	z28.h, p7/m, z22.h, z0.h
	add	z30.h, z30.h, z28.h
	add	x17, x17, 240
	ldr	z27, [x17]
	movprfx	z29, z31
	mla	z29.h, p7/m, z27.h, z26.h
	addvl	x17, sp, #7
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	add	x17, x17, 240
	ldr	z28, [x17]
	mla	z29.h, p7/m, z7.h, z16.h
	addvl	x17, sp, #11
	mla	z29.h, p7/m, z11.h, z4.h
	mad	z28.h, p7/m, z3.h, z31.h
	add	x17, x17, 240
	ldr	z27, [x17]
	mla	z28.h, p7/m, z9.h, z8.h
	addvl	x17, sp, #19
	mla	z29.h, p7/m, z18.h, z24.h
	mla	z28.h, p7/m, z15.h, z2.h
	add	x17, x17, 240
	mla	z28.h, p7/m, z27.h, z0.h
	add	z29.h, z29.h, z28.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x19, 16]
	movprfx	z30, z31
	mla	z30.h, p7/m, z12.h, z26.h
	ldr	z12, [x17]
	addvl	x17, sp, #6
	add	x17, x17, 240
	mla	z30.h, p7/m, z1.h, z16.h
	mla	z30.h, p7/m, z23.h, z4.h
	mla	z30.h, p7/m, z12.h, z24.h
	ldr	z12, [x17]
	add	x17, sp, 240
	ldr	z28, [x17]
	addvl	x17, sp, #2
	movprfx	z29, z31
	mla	z29.h, p7/m, z12.h, z3.h
	add	x17, x17, 240
	mla	z29.h, p7/m, z5.h, z8.h
	mla	z29.h, p7/m, z28.h, z2.h
	ldr	z28, [x17]
	mla	z29.h, p7/m, z28.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x19, 48]
	ld1b	z30.h, p7/z, [x1, x8]
	addvl	x8, sp, #20
	sub	z30.h, z30.h, #128
	add	x8, x8, 240
	str	z30, [x8]
	addvl	x17, sp, #7
	add	x8, x6, 16
	ld1b	z30.h, p7/z, [x4, x8]
	sub	z30.h, z30.h, #128
	addvl	x8, sp, #17
	add	x17, x17, 240
	mov	z27.d, z23.d
	add	x8, x8, 240
	str	z30, [x8]
	add	x19, x3, x5
	add	x8, x6, 32
	ld1b	z30.h, p7/z, [x4, x8]
	movprfx	z13, z30
	sub	z13.h, z13.h, #128
	addvl	x8, sp, #12
	add	x8, x8, 240
	str	z13, [x8]
	add	x8, x6, 48
	ld1b	z30.h, p7/z, [x4, x8]
	sub	z30.h, z30.h, #128
	addvl	x8, sp, #13
	add	x8, x8, 240
	str	z30, [x8]
	addvl	x8, sp, #8
	add	x8, x8, 240
	ldr	z30, [x8]
	mad	z30.h, p7/m, z26.h, z31.h
	addvl	x8, sp, #5
	add	x8, x8, 240
	ldr	z28, [x8]
	mla	z30.h, p7/m, z28.h, z16.h
	addvl	x8, sp, #4
	mla	z30.h, p7/m, z17.h, z4.h
	movprfx	z29, z30
	mla	z29.h, p7/m, z21.h, z24.h
	add	x8, x8, 240
	movprfx	z30, z31
	mla	z30.h, p7/m, z6.h, z3.h
	mla	z30.h, p7/m, z14.h, z8.h
	mla	z30.h, p7/m, z20.h, z2.h
	mla	z30.h, p7/m, z25.h, z0.h
	add	z30.h, z29.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x5]
	movprfx	z30, z31
	mla	z30.h, p7/m, z10.h, z26.h
	ldr	z10, [x8]
	addvl	x8, sp, #18
	add	x8, x8, 240
	ldr	z29, [x8]
	mla	z30.h, p7/m, z10.h, z16.h
	addvl	x8, sp, #14
	mla	z30.h, p7/m, z29.h, z4.h
	movprfx	z29, z30
	mla	z29.h, p7/m, z22.h, z24.h
	add	x8, x8, 240
	ldr	z10, [x8]
	movprfx	z30, z31
	mla	z30.h, p7/m, z10.h, z3.h
	addvl	x8, sp, #3
	mad	z6.h, p7/m, z26.h, z31.h
	mla	z6.h, p7/m, z14.h, z16.h
	add	x8, x8, 240
	ldr	z13, [x8]
	mla	z30.h, p7/m, z13.h, z8.h
	addvl	x8, sp, #1
	mla	z30.h, p7/m, z19.h, z2.h
	ldr	z13, [x23]
	add	x8, x8, 240
	ldr	z28, [x8]
	mla	z30.h, p7/m, z28.h, z0.h
	add	x8, x2, x13
	add	z30.h, z29.h, z30.h
	ldr	z29, [x17]
	addvl	x17, sp, #11
	mad	z29.h, p7/m, z26.h, z31.h
	sqrshrunb	z30.b, z30.h, #6
	add	x17, x17, 240
	ldr	z23, [x17]
	mla	z29.h, p7/m, z9.h, z16.h
	add	x17, sp, 240
	mla	z29.h, p7/m, z15.h, z4.h
	uzp1	z30.b, z30.b, z30.b
	movprfx	z28, z29
	mla	z28.h, p7/m, z23.h, z24.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z7.h, z3.h
	mla	z29.h, p7/m, z11.h, z8.h
	mla	z29.h, p7/m, z18.h, z2.h
	mla	z29.h, p7/m, z13.h, z0.h
	add	z29.h, z28.h, z29.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x8, 16]
	movprfx	z30, z31
	mla	z30.h, p7/m, z12.h, z26.h
	ldr	z12, [x17]
	addvl	x17, sp, #2
	add	x17, x17, 240
	ldr	z29, [x17]
	mla	z30.h, p7/m, z5.h, z16.h
	addvl	x17, sp, #19
	mla	z30.h, p7/m, z12.h, z4.h
	mov	z28.d, z27.d
	add	x17, x17, 240
	mad	z29.h, p7/m, z24.h, z30.h
	addvl	x23, sp, #11
	movprfx	z30, z31
	mla	z30.h, p7/m, z1.h, z3.h
	mla	z30.h, p7/m, z27.h, z8.h
	ldr	z27, [x17]
	addvl	x17, sp, #21
	mla	z30.h, p7/m, z27.h, z2.h
	add	x23, x23, 240
	add	x17, x17, 240
	ldr	z13, [x17]
	mla	z30.h, p7/m, z13.h, z0.h
	add	z30.h, z29.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x8, 48]
	add	x8, x6, x1
	ld1b	z30.h, p7/z, [x1, x0]
	movprfx	z27, z30
	sub	z27.h, z27.h, #128
	str	z27, [x23]
	add	x23, x8, 16
	ld1b	z30.h, p7/z, [x4, x23]
	addvl	x23, sp, #16
	movprfx	z12, z30
	sub	z12.h, z12.h, #128
	add	x23, x23, 240
	str	z12, [x23]
	mla	z6.h, p7/m, z20.h, z4.h
	add	x23, x8, 32
	add	x8, x8, 48
	ld1b	z30.h, p7/z, [x4, x23]
	addvl	x23, sp, #10
	sub	z30.h, z30.h, #128
	mla	z6.h, p7/m, z25.h, z24.h
	add	x23, x23, 240
	str	z30, [x23]
	ld1b	z30.h, p7/z, [x4, x8]
	addvl	x8, sp, #15
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	add	x13, x13, x3
	add	x8, x8, 240
	str	z29, [x8]
	add	x13, x2, x13
	addvl	x8, sp, #5
	mad	z7.h, p7/m, z26.h, z31.h
	mla	z7.h, p7/m, z11.h, z16.h
	add	x8, x8, 240
	ldr	z30, [x8]
	mad	z30.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #20
	mla	z30.h, p7/m, z17.h, z8.h
	mla	z30.h, p7/m, z21.h, z2.h
	add	x8, x8, 240
	ldr	z27, [x8]
	mla	z30.h, p7/m, z27.h, z0.h
	addvl	x8, sp, #3
	add	z6.h, z6.h, z30.h
	sqrshrunb	z6.b, z6.h, #6
	add	x8, x8, 240
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x3, x19]
	ldr	z13, [x8]
	addvl	x8, sp, #1
	movprfx	z30, z31
	mla	z30.h, p7/m, z10.h, z26.h
	add	x8, x8, 240
	ldr	z6, [x8]
	mla	z30.h, p7/m, z13.h, z16.h
	addvl	x8, sp, #4
	mla	z30.h, p7/m, z19.h, z4.h
	movprfx	z29, z30
	mla	z29.h, p7/m, z6.h, z24.h
	add	x8, x8, 240
	ldr	z30, [x8]
	mla	z7.h, p7/m, z18.h, z4.h
	addvl	x8, sp, #18
	mad	z30.h, p7/m, z3.h, z31.h
	mad	z1.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z12, [x8]
	mla	z30.h, p7/m, z12.h, z8.h
	addvl	x8, sp, #17
	mla	z30.h, p7/m, z22.h, z2.h
	mla	z1.h, p7/m, z28.h, z16.h
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z30.h, p7/m, z10.h, z0.h
	addvl	x8, sp, #22
	add	z30.h, z29.h, z30.h
	sqrshrunb	z30.b, z30.h, #6
	add	x8, x8, 240
	ldr	z13, [x8]
	mla	z7.h, p7/m, z13.h, z24.h
	addvl	x8, sp, #12
	uzp1	z30.b, z30.b, z30.b
	movprfx	z29, z31
	mla	z29.h, p7/m, z9.h, z3.h
	add	x8, x8, 240
	ldr	z13, [x8]
	mla	z29.h, p7/m, z15.h, z8.h
	addvl	x8, sp, #19
	mla	z29.h, p7/m, z23.h, z2.h
	mla	z29.h, p7/m, z13.h, z0.h
	add	x8, x8, 240
	add	z7.h, z7.h, z29.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	stp	q30, q7, [x13, 16]
	ldr	z30, [x8]
	addvl	x8, sp, #21
	mla	z1.h, p7/m, z30.h, z4.h
	mov	z27.d, z23.d
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z1.h, p7/m, z10.h, z24.h
	add	x8, sp, 240
	ldr	z10, [x8]
	movprfx	z30, z31
	mla	z30.h, p7/m, z5.h, z3.h
	addvl	x8, sp, #2
	mla	z30.h, p7/m, z10.h, z8.h
	add	x17, x1, x0
	add	x8, x8, 240
	ldr	z23, [x8]
	mla	z30.h, p7/m, z23.h, z2.h
	addvl	x8, sp, #13
	add	x5, x5, x3, lsl 1
	mad	z9.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z7, [x8]
	mla	z30.h, p7/m, z7.h, z0.h
	add	z1.h, z1.h, z30.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x13, 48]
	addvl	x13, sp, #9
	ld1b	z30.h, p7/z, [x1, x17]
	add	x13, x13, 240
	movprfx	z7, z30
	sub	z7.h, z7.h, #128
	str	z7, [x13]
	ldr	x26, [sp, 176]
	mla	z9.h, p7/m, z15.h, z16.h
	mla	z9.h, p7/m, z27.h, z4.h
	addvl	x17, sp, #12
	mla	z9.h, p7/m, z13.h, z24.h
	mad	z5.h, p7/m, z26.h, z31.h
	add	x17, x17, 240
	add	x6, x24, x6
	add	x0, x0, x1, lsl 1
	lsl	x8, x26, 1
	add	x13, x8, 16
	ld1b	z30.h, p7/z, [x4, x13]
	movprfx	z7, z30
	sub	z7.h, z7.h, #128
	add	x13, x8, 32
	add	x8, x8, 48
	ld1b	z30.h, p7/z, [x4, x13]
	addvl	x13, sp, #2
	movprfx	z1, z30
	sub	z1.h, z1.h, #128
	add	x13, x13, 240
	str	z1, [x13]
	ld1b	z30.h, p7/z, [x4, x8]
	addvl	x8, sp, #1
	sub	z30.h, z30.h, #128
	addvl	x13, sp, #4
	add	x8, x8, 240
	str	z30, [x8]
	add	x13, x13, 240
	addvl	x8, sp, #5
	movprfx	z30, z31
	mla	z30.h, p7/m, z14.h, z3.h
	mla	z30.h, p7/m, z20.h, z8.h
	add	x8, x8, 240
	ldr	z12, [x8]
	mla	z30.h, p7/m, z25.h, z2.h
	addvl	x8, sp, #20
	mad	z12.h, p7/m, z26.h, z31.h
	mla	z12.h, p7/m, z17.h, z16.h
	add	x8, x8, 240
	ldr	z29, [x8]
	mla	z12.h, p7/m, z21.h, z4.h
	addvl	x8, sp, #11
	mla	z12.h, p7/m, z29.h, z24.h
	mad	z14.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z1, [x8]
	mla	z30.h, p7/m, z1.h, z0.h
	add	z12.h, z12.h, z30.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x5]
	ldr	z10, [x13]
	addvl	x13, sp, #18
	add	x13, x13, 240
	ldr	z12, [x13]
	mad	z10.h, p7/m, z26.h, z31.h
	addvl	x13, sp, #17
	mla	z10.h, p7/m, z12.h, z16.h
	mla	z10.h, p7/m, z22.h, z4.h
	add	x13, x13, 240
	ldr	z30, [x13]
	mla	z10.h, p7/m, z30.h, z24.h
	ldr	x19, [sp, 208]
	str	z13, [x17]
	mla	z14.h, p7/m, z20.h, z16.h
	addvl	x13, sp, #3
	mla	z14.h, p7/m, z25.h, z4.h
	add	x13, x13, 240
	ldr	z30, [x13]
	addvl	x17, sp, #22
	addvl	x13, sp, #16
	add	x17, x17, 240
	ldr	z13, [x17]
	add	x13, x13, 240
	ldr	z29, [x13]
	add	x17, sp, 240
	add	x13, x2, x19, lsl 1
	mad	z30.h, p7/m, z3.h, z31.h
	mla	z30.h, p7/m, z19.h, z8.h
	mla	z30.h, p7/m, z6.h, z2.h
	mla	z30.h, p7/m, z29.h, z0.h
	movprfx	z29, z31
	mla	z29.h, p7/m, z11.h, z3.h
	add	z30.h, z10.h, z30.h
	ldr	z10, [x23]
	mla	z29.h, p7/m, z18.h, z8.h
	mla	z29.h, p7/m, z13.h, z2.h
	mla	z29.h, p7/m, z10.h, z0.h
	add	z9.h, z9.h, z29.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	stp	q30, q9, [x13, 16]
	ldr	z9, [x17]
	addvl	x17, sp, #13
	mla	z5.h, p7/m, z9.h, z16.h
	mla	z5.h, p7/m, z23.h, z4.h
	add	x17, x17, 240
	ldr	z10, [x17]
	mla	z5.h, p7/m, z10.h, z24.h
	addvl	x17, sp, #19
	movprfx	z30, z31
	mla	z30.h, p7/m, z28.h, z3.h
	add	x8, x3, x5
	add	x17, x17, 240
	ldr	z1, [x17]
	mla	z30.h, p7/m, z1.h, z8.h
	addvl	x17, sp, #21
	mad	z11.h, p7/m, z26.h, z31.h
	mla	z11.h, p7/m, z18.h, z16.h
	add	x17, x17, 240
	ldr	z29, [x17]
	mla	z30.h, p7/m, z29.h, z2.h
	addvl	x17, sp, #15
	movprfx	z29, z31
	mla	z29.h, p7/m, z15.h, z3.h
	mla	z29.h, p7/m, z27.h, z8.h
	add	x17, x17, 240
	ldr	z10, [x17]
	mla	z30.h, p7/m, z10.h, z0.h
	addvl	x17, sp, #8
	add	z5.h, z5.h, z30.h
	sqrshrunb	z5.b, z5.h, #6
	add	x17, x17, 240
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x13, 48]
	ld1b	z30.h, p7/z, [x1, x0]
	movprfx	z5, z30
	sub	z5.h, z5.h, #128
	str	z5, [x17]
	add	x17, x6, 16
	ld1b	z30.h, p7/z, [x4, x17]
	sub	z30.h, z30.h, #128
	addvl	x17, sp, #7
	add	x13, x1, x0
	mad	z15.h, p7/m, z26.h, z31.h
	add	x17, x17, 240
	str	z30, [x17]
	add	x5, x5, x3, lsl 1
	add	x17, x6, 32
	add	x6, x6, 48
	ld1b	z30.h, p7/z, [x4, x17]
	addvl	x17, sp, #6
	movprfx	z5, z30
	sub	z5.h, z5.h, #128
	mla	z15.h, p7/m, z27.h, z16.h
	add	x17, x17, 240
	str	z5, [x17]
	ld1b	z30.h, p7/z, [x4, x6]
	add	x6, sp, 240
	sub	z30.h, z30.h, #128
	str	z30, [x6]
	addvl	x6, sp, #11
	movprfx	z30, z31
	mla	z30.h, p7/m, z17.h, z3.h
	mla	z30.h, p7/m, z21.h, z8.h
	add	x6, x6, 240
	ldr	z5, [x6]
	mla	z14.h, p7/m, z5.h, z24.h
	addvl	x6, sp, #20
	mad	z17.h, p7/m, z26.h, z31.h
	mla	z17.h, p7/m, z21.h, z16.h
	add	x6, x6, 240
	ldr	z10, [x6]
	mla	z30.h, p7/m, z10.h, z2.h
	addvl	x6, sp, #9
	mov	z10.d, z12.d
	add	x0, x0, x1, lsl 1
	add	x6, x6, 240
	ldr	z5, [x6]
	mla	z30.h, p7/m, z5.h, z0.h
	add	z14.h, z14.h, z30.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x3, x8]
	addvl	x8, sp, #3
	mov	z14.d, z6.d
	add	x8, x8, 240
	ldr	z13, [x8]
	mad	z13.h, p7/m, z26.h, z31.h
	addvl	x8, sp, #16
	mla	z13.h, p7/m, z19.h, z16.h
	mla	z13.h, p7/m, z6.h, z4.h
	add	x8, x8, 240
	ldr	z30, [x8]
	mla	z13.h, p7/m, z30.h, z24.h
	addvl	x8, sp, #17
	movprfx	z30, z31
	mla	z30.h, p7/m, z12.h, z3.h
	mov	z12.d, z7.d
	add	x8, x8, 240
	ldr	z6, [x8]
	mla	z30.h, p7/m, z22.h, z8.h
	addvl	x8, sp, #22
	mla	z30.h, p7/m, z6.h, z2.h
	mla	z30.h, p7/m, z7.h, z0.h
	add	x8, x8, 240
	ldr	z7, [x8]
	ldr	z5, [x23]
	addvl	x8, sp, #12
	add	x6, x3, x19, lsl 1
	add	z30.h, z13.h, z30.h
	add	x8, x8, 240
	ldr	z13, [x8]
	add	x6, x2, x6
	addvl	x8, sp, #2
	mla	z29.h, p7/m, z13.h, z2.h
	mla	z11.h, p7/m, z7.h, z4.h
	add	x8, x8, 240
	ldr	z13, [x8]
	mla	z11.h, p7/m, z5.h, z24.h
	addvl	x8, sp, #21
	mla	z29.h, p7/m, z13.h, z0.h
	add	z11.h, z11.h, z29.h
	add	x8, x8, 240
	sqrshrunb	z11.b, z11.h, #6
	uzp1	z11.b, z11.b, z11.b
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	stp	q30, q11, [x6, 16]
	ldr	z11, [x8]
	addvl	x8, sp, #15
	movprfx	z30, z31
	mla	z30.h, p7/m, z28.h, z26.h
	add	x8, x8, 240
	ldr	z28, [x8]
	mla	z30.h, p7/m, z1.h, z16.h
	addvl	x8, sp, #13
	mla	z30.h, p7/m, z11.h, z4.h
	mla	z30.h, p7/m, z28.h, z24.h
	add	x8, x8, 240
	ldr	z28, [x8]
	movprfx	z29, z31
	mla	z29.h, p7/m, z9.h, z3.h
	addvl	x8, sp, #1
	mla	z29.h, p7/m, z23.h, z8.h
	mla	z29.h, p7/m, z28.h, z2.h
	add	x8, x8, 240
	ldr	z28, [x8]
	mla	z29.h, p7/m, z28.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x6, 48]
	addvl	x6, sp, #5
	mov	z13.d, z1.d
	add	x6, x6, 240
	ld1b	z1.h, p7/z, [x1, x13]
	sub	z1.h, z1.h, #128
	str	z1, [x6]
	add	x6, x9, 16
	ld1b	z5.h, p7/z, [x4, x6]
	add	x6, x9, 32
	ld1b	z30.h, p7/z, [x4, x6]
	movprfx	z29, z30
	sub	z29.h, z29.h, #128
	addvl	x6, sp, #4
	addvl	x8, sp, #12
	sub	z5.h, z5.h, #128
	add	x6, x6, 240
	str	z29, [x6]
	add	x8, x8, 240
	add	x6, x9, 48
	ld1b	z29.h, p7/z, [x4, x6]
	add	x9, x9, x1
	addvl	x6, sp, #20
	add	x17, x3, x5
	sub	z29.h, z29.h, #128
	add	x6, x6, 240
	ldr	z1, [x6]
	mla	z17.h, p7/m, z1.h, z4.h
	addvl	x6, sp, #9
	add	x13, x1, x0
	add	x6, x6, 240
	ldr	z30, [x6]
	mla	z17.h, p7/m, z30.h, z24.h
	addvl	x6, sp, #11
	movprfx	z30, z31
	mla	z30.h, p7/m, z20.h, z3.h
	mla	z30.h, p7/m, z25.h, z8.h
	add	x6, x6, 240
	ldr	z28, [x6]
	mla	z30.h, p7/m, z28.h, z2.h
	addvl	x6, sp, #8
	mad	z20.h, p7/m, z26.h, z31.h
	mla	z20.h, p7/m, z25.h, z16.h
	add	x6, x6, 240
	ldr	z28, [x6]
	mla	z30.h, p7/m, z28.h, z0.h
	addvl	x6, sp, #17
	add	z17.h, z17.h, z30.h
	sqrshrunb	z17.b, z17.h, #6
	add	x6, x6, 240
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x5]
	str	z6, [x6]
	addvl	x6, sp, #16
	movprfx	z30, z31
	mla	z30.h, p7/m, z10.h, z26.h
	add	x6, x6, 240
	ldr	z17, [x6]
	mla	z30.h, p7/m, z22.h, z16.h
	addvl	x6, sp, #7
	mla	z30.h, p7/m, z6.h, z4.h
	movprfx	z28, z30
	mla	z28.h, p7/m, z12.h, z24.h
	add	x6, x6, 240
	movprfx	z30, z31
	mla	z30.h, p7/m, z19.h, z3.h
	mla	z30.h, p7/m, z14.h, z8.h
	mla	z30.h, p7/m, z17.h, z2.h
	ldr	z17, [x6]
	mla	z30.h, p7/m, z17.h, z0.h
	add	z30.h, z28.h, z30.h
	ldr	z28, [x8]
	addvl	x8, sp, #2
	add	x8, x8, 240
	ldr	z17, [x8]
	add	x6, x2, x21, lsl 2
	addvl	x8, sp, #6
	mov	z10.d, z7.d
	mla	z15.h, p7/m, z28.h, z4.h
	add	x8, x8, 240
	movprfx	z28, z31
	mla	z28.h, p7/m, z18.h, z3.h
	mla	z28.h, p7/m, z7.h, z8.h
	ldr	z7, [x23]
	mla	z28.h, p7/m, z7.h, z2.h
	mla	z15.h, p7/m, z17.h, z24.h
	ldr	z7, [x8]
	addvl	x8, sp, #13
	mla	z28.h, p7/m, z7.h, z0.h
	add	x8, x8, 240
	add	z15.h, z15.h, z28.h
	sqrshrunb	z30.b, z30.h, #6
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z30.b, z30.b, z30.b
	uzp1	z15.b, z15.b, z15.b
	stp	q30, q15, [x6, 16]
	ldr	z17, [x8]
	addvl	x8, sp, #1
	add	x8, x8, 240
	ldr	z15, [x8]
	movprfx	z30, z31
	mla	z30.h, p7/m, z9.h, z26.h
	addvl	x8, sp, #15
	mla	z30.h, p7/m, z23.h, z16.h
	movprfx	z28, z31
	mla	z28.h, p7/m, z13.h, z3.h
	add	x8, x8, 240
	mla	z28.h, p7/m, z11.h, z8.h
	mla	z30.h, p7/m, z17.h, z4.h
	mla	z30.h, p7/m, z15.h, z24.h
	ldr	z15, [x8]
	add	x8, sp, 240
	ldr	z9, [x8]
	mla	z28.h, p7/m, z15.h, z2.h
	mla	z28.h, p7/m, z9.h, z0.h
	add	z30.h, z30.h, z28.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x6, 48]
	add	x6, x9, 16
	ld1b	z7.h, p7/z, [x4, x6]
	add	x6, x9, 32
	ld1b	z6.h, p7/z, [x4, x6]
	ld1b	z30.h, p7/z, [x1, x0]
	addvl	x6, sp, #19
	movprfx	z17, z30
	sub	z17.h, z17.h, #128
	add	x9, x9, 48
	add	x6, x6, 240
	ld1b	z30.h, p7/z, [x4, x9]
	sub	z30.h, z30.h, #128
	str	z30, [x6]
	addvl	x6, sp, #11
	movprfx	z28, z31
	mla	z28.h, p7/m, z21.h, z3.h
	add	x6, x6, 240
	ldr	z15, [x6]
	mla	z28.h, p7/m, z1.h, z8.h
	addvl	x6, sp, #8
	mla	z20.h, p7/m, z15.h, z4.h
	addvl	x9, sp, #16
	add	x6, x6, 240
	ldr	z9, [x6]
	mla	z20.h, p7/m, z9.h, z24.h
	addvl	x6, sp, #9
	mov	z9.d, z1.d
	add	x9, x9, 240
	add	x6, x6, 240
	ldr	z1, [x6]
	mla	z28.h, p7/m, z1.h, z2.h
	addvl	x6, sp, #5
	mad	z19.h, p7/m, z26.h, z31.h
	mla	z19.h, p7/m, z14.h, z16.h
	add	x6, x6, 240
	ldr	z15, [x6]
	mla	z28.h, p7/m, z15.h, z0.h
	add	z20.h, z20.h, z28.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x17]
	ldr	z20, [x9]
	addvl	x9, sp, #7
	add	x9, x9, 240
	mov	z15.d, z14.d
	ldr	z14, [x9]
	addvl	x9, sp, #17
	mla	z19.h, p7/m, z20.h, z4.h
	mla	z19.h, p7/m, z14.h, z24.h
	add	x9, x9, 240
	ldr	z1, [x9]
	movprfx	z28, z31
	mla	z28.h, p7/m, z22.h, z3.h
	addvl	x9, sp, #6
	mla	z28.h, p7/m, z1.h, z8.h
	mla	z28.h, p7/m, z12.h, z2.h
	add	x9, x9, 240
	mla	z28.h, p7/m, z5.h, z0.h
	add	z28.h, z19.h, z28.h
	ldr	z19, [x9]
	addvl	x9, sp, #12
	lsl	x6, x18, 4
	add	x9, x9, 240
	ldr	z14, [x9]
	mov	z20.d, z22.d
	addvl	x9, sp, #2
	ldr	z22, [x23]
	sub	x8, x6, x18
	add	x9, x9, 240
	mad	z18.h, p7/m, z26.h, z31.h
	mla	z18.h, p7/m, z10.h, z16.h
	mla	z18.h, p7/m, z22.h, z4.h
	ldr	z22, [x9]
	addvl	x9, sp, #4
	add	x8, x2, x8
	add	x9, x9, 240
	mla	z18.h, p7/m, z19.h, z24.h
	mov	z19.d, z27.d
	mad	z27.h, p7/m, z3.h, z31.h
	mla	z27.h, p7/m, z14.h, z8.h
	mla	z27.h, p7/m, z22.h, z2.h
	ldr	z22, [x9]
	addvl	x9, sp, #15
	mla	z27.h, p7/m, z22.h, z0.h
	add	x9, x9, 240
	add	z18.h, z18.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z28.b, z28.b, z28.b
	uzp1	z18.b, z18.b, z18.b
	stp	q28, q18, [x8, 16]
	ldr	z27, [x9]
	add	x9, sp, 240
	movprfx	z28, z31
	mla	z28.h, p7/m, z13.h, z26.h
	mov	z13.d, z11.d
	mla	z28.h, p7/m, z11.h, z16.h
	ldr	z11, [x9]
	addvl	x9, sp, #13
	add	x9, x9, 240
	mla	z28.h, p7/m, z27.h, z4.h
	mov	z18.d, z23.d
	movprfx	z27, z31
	mla	z27.h, p7/m, z23.h, z3.h
	ldr	z23, [x9]
	addvl	x9, sp, #1
	mla	z27.h, p7/m, z23.h, z8.h
	mla	z28.h, p7/m, z11.h, z24.h
	add	x9, x9, 240
	ldr	z30, [x9]
	mla	z27.h, p7/m, z30.h, z2.h
	mla	z27.h, p7/m, z29.h, z0.h
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x8, 48]
	ld1b	z11.h, p7/z, [x1, x13]
	mad	z21.h, p7/m, z26.h, z31.h
	mla	z21.h, p7/m, z9.h, z16.h
	add	x5, x5, x3, lsl 1
	sub	z7.h, z7.h, #128
	ldr	x25, [sp, 184]
	sub	z6.h, z6.h, #128
	sub	z11.h, z11.h, #128
	addvl	x13, sp, #12
	add	x13, x13, 240
	add	x0, x0, x1, lsl 1
	add	x18, x18, x6
	add	x21, x21, x21, lsl 2
	lsl	x8, x25, 1
	add	x18, x2, x18
	add	x9, x8, 16
	ld1b	z23.h, p7/z, [x4, x9]
	sub	z23.h, z23.h, #128
	addvl	x9, sp, #3
	add	x21, x2, x21
	add	x9, x9, 240
	str	z23, [x9]
	add	x9, x8, 32
	add	x8, x8, 48
	ld1b	z28.h, p7/z, [x4, x8]
	addvl	x8, sp, #14
	ld1b	z22.h, p7/z, [x4, x9]
	sub	z28.h, z28.h, #128
	add	x8, x8, 240
	str	z28, [x8]
	addvl	x9, sp, #16
	addvl	x8, sp, #9
	movprfx	z28, z31
	mla	z28.h, p7/m, z25.h, z3.h
	add	x9, x9, 240
	add	x8, x8, 240
	ldr	z27, [x8]
	mla	z21.h, p7/m, z27.h, z4.h
	addvl	x8, sp, #5
	mad	z25.h, p7/m, z26.h, z31.h
	sub	z22.h, z22.h, #128
	add	x8, x8, 240
	ldr	z27, [x8]
	mla	z21.h, p7/m, z27.h, z24.h
	addvl	x8, sp, #11
	add	x8, x8, 240
	ldr	z27, [x8]
	mla	z28.h, p7/m, z27.h, z8.h
	addvl	x8, sp, #8
	movprfx	z27, z31
	mla	z27.h, p7/m, z15.h, z3.h
	add	x8, x8, 240
	ldr	z14, [x8]
	mla	z28.h, p7/m, z14.h, z2.h
	mla	z28.h, p7/m, z17.h, z0.h
	add	z21.h, z21.h, z28.h
	sqrshrunb	z21.b, z21.h, #6
	movprfx	z28, z31
	mla	z28.h, p7/m, z20.h, z26.h
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x5]
	ldr	z20, [x9]
	addvl	x9, sp, #7
	mla	z27.h, p7/m, z20.h, z8.h
	add	x9, x9, 240
	ldr	z21, [x9]
	mla	z27.h, p7/m, z21.h, z2.h
	ldr	z21, [x13]
	addvl	x13, sp, #2
	mla	z27.h, p7/m, z7.h, z0.h
	ldr	x9, [sp, 216]
	mla	z28.h, p7/m, z1.h, z16.h
	mla	z28.h, p7/m, z12.h, z4.h
	add	x13, x13, 240
	mla	z28.h, p7/m, z5.h, z24.h
	add	z28.h, z28.h, z27.h
	movprfx	z27, z31
	mla	z27.h, p7/m, z19.h, z26.h
	ldr	z19, [x13]
	addvl	x13, sp, #4
	add	x13, x13, 240
	ldr	z20, [x13]
	mla	z27.h, p7/m, z21.h, z16.h
	addvl	x13, sp, #6
	add	x9, x2, x9, lsl 1
	mla	z27.h, p7/m, z19.h, z4.h
	add	x13, x13, 240
	mla	z27.h, p7/m, z20.h, z24.h
	ldr	z20, [x13]
	addvl	x13, sp, #13
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	add	x13, x13, 240
	ldr	z19, [x23]
	movprfx	z21, z31
	mla	z21.h, p7/m, z10.h, z3.h
	mla	z21.h, p7/m, z19.h, z8.h
	mla	z21.h, p7/m, z20.h, z2.h
	mla	z21.h, p7/m, z6.h, z0.h
	add	z27.h, z27.h, z21.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	stp	q28, q27, [x9, 16]
	movprfx	z28, z31
	mla	z28.h, p7/m, z18.h, z26.h
	ldr	z18, [x13]
	addvl	x13, sp, #1
	mov	z19.d, z13.d
	movprfx	z27, z31
	mla	z27.h, p7/m, z13.h, z3.h
	add	x13, x13, 240
	str	z30, [x13]
	mla	z28.h, p7/m, z18.h, z16.h
	addvl	x13, sp, #15
	mla	z28.h, p7/m, z30.h, z4.h
	mla	z28.h, p7/m, z29.h, z24.h
	add	x13, x13, 240
	ldr	z13, [x13]
	mla	z27.h, p7/m, z13.h, z8.h
	add	x13, sp, 240
	ldr	z30, [x13]
	mla	z27.h, p7/m, z30.h, z2.h
	addvl	x13, sp, #19
	add	x8, x3, x5
	mov	z14.d, z15.d
	add	x13, x13, 240
	ldr	z23, [x13]
	mla	z27.h, p7/m, z23.h, z0.h
	add	x13, x12, 16
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x9, 48]
	ld1b	z21.h, p7/z, [x4, x13]
	add	x13, x12, 32
	ld1b	z13.h, p7/z, [x1, x0]
	ld1b	z20.h, p7/z, [x4, x13]
	add	x12, x12, 48
	ld1b	z28.h, p7/z, [x4, x12]
	sub	z28.h, z28.h, #128
	addvl	x12, sp, #13
	mov	z15.d, z17.d
	add	x9, x1, x0
	add	x12, x12, 240
	str	z28, [x12]
	add	x5, x5, x3, lsl 1
	addvl	x12, sp, #11
	sub	z13.h, z13.h, #128
	sub	z21.h, z21.h, #128
	add	x12, x12, 240
	ldr	z27, [x12]
	mla	z25.h, p7/m, z27.h, z16.h
	addvl	x12, sp, #8
	sub	z20.h, z20.h, #128
	add	x0, x0, x1, lsl 1
	add	x12, x12, 240
	ldr	z28, [x12]
	mla	z25.h, p7/m, z28.h, z4.h
	addvl	x12, sp, #9
	mla	z25.h, p7/m, z17.h, z24.h
	movprfx	z28, z31
	mla	z28.h, p7/m, z9.h, z3.h
	add	x12, x12, 240
	ldr	z17, [x12]
	mla	z28.h, p7/m, z17.h, z8.h
	addvl	x12, sp, #5
	add	x12, x12, 240
	ldr	z27, [x12]
	mla	z28.h, p7/m, z27.h, z2.h
	mla	z28.h, p7/m, z11.h, z0.h
	add	z25.h, z25.h, z28.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x8]
	addvl	x8, sp, #16
	add	x8, x8, 240
	ldr	z25, [x8]
	movprfx	z28, z31
	mla	z28.h, p7/m, z14.h, z26.h
	addvl	x8, sp, #7
	mla	z28.h, p7/m, z25.h, z16.h
	sub	x12, x6, x3
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z28.h, p7/m, z25.h, z4.h
	addvl	x8, sp, #3
	movprfx	z27, z31
	mla	z27.h, p7/m, z1.h, z3.h
	mla	z27.h, p7/m, z12.h, z8.h
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z27.h, p7/m, z5.h, z2.h
	add	x8, x2, x12
	addvl	x12, sp, #6
	mla	z27.h, p7/m, z25.h, z0.h
	add	x12, x12, 240
	ldr	z17, [x23]
	mla	z28.h, p7/m, z7.h, z24.h
	add	z28.h, z28.h, z27.h
	movprfx	z27, z31
	mla	z27.h, p7/m, z10.h, z26.h
	ldr	z10, [x12]
	addvl	x12, sp, #12
	mla	z27.h, p7/m, z17.h, z16.h
	mla	z27.h, p7/m, z10.h, z4.h
	add	x12, x12, 240
	ldr	z14, [x12]
	mla	z27.h, p7/m, z6.h, z24.h
	addvl	x12, sp, #2
	movprfx	z25, z31
	mla	z25.h, p7/m, z14.h, z3.h
	sqrshrunb	z28.b, z28.h, #6
	add	x12, x12, 240
	ldr	z10, [x12]
	uzp1	z28.b, z28.b, z28.b
	addvl	x12, sp, #4
	mla	z25.h, p7/m, z10.h, z8.h
	add	x12, x12, 240
	ldr	z17, [x12]
	mla	z25.h, p7/m, z17.h, z2.h
	addvl	x12, sp, #15
	mla	z25.h, p7/m, z22.h, z0.h
	add	z27.h, z27.h, z25.h
	add	x12, x12, 240
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	stp	q28, q27, [x8, 16]
	ldr	z10, [x12]
	add	x12, sp, 240
	str	z30, [x12]
	addvl	x12, sp, #1
	movprfx	z28, z31
	mla	z28.h, p7/m, z19.h, z26.h
	add	x12, x12, 240
	mla	z28.h, p7/m, z10.h, z16.h
	movprfx	z27, z31
	mla	z27.h, p7/m, z18.h, z3.h
	mov	z10.d, z18.d
	ldr	z18, [x12]
	addvl	x12, sp, #14
	mla	z27.h, p7/m, z18.h, z8.h
	mla	z28.h, p7/m, z30.h, z4.h
	mla	z27.h, p7/m, z29.h, z2.h
	mla	z28.h, p7/m, z23.h, z24.h
	add	x12, x12, 240
	ldr	z30, [x12]
	mla	z27.h, p7/m, z30.h, z0.h
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x8, 48]
	add	x8, x11, 16
	ld1b	z19.h, p7/z, [x4, x8]
	add	x8, x11, 32
	ld1b	z18.h, p7/z, [x4, x8]
	add	x8, x11, 48
	ld1b	z28.h, p7/z, [x4, x8]
	ld1b	z17.h, p7/z, [x1, x9]
	addvl	x8, sp, #12
	sub	z28.h, z28.h, #128
	addvl	x9, sp, #2
	add	x8, x8, 240
	str	z28, [x8]
	movprfx	z28, z31
	mla	z28.h, p7/m, z9.h, z26.h
	addvl	x8, sp, #9
	add	x9, x9, 240
	sub	z17.h, z17.h, #128
	add	x8, x8, 240
	ldr	z9, [x8]
	mla	z28.h, p7/m, z9.h, z16.h
	addvl	x8, sp, #5
	mov	z9.d, z15.d
	add	x11, x11, x1
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z28.h, p7/m, z25.h, z4.h
	addvl	x8, sp, #11
	mla	z28.h, p7/m, z11.h, z24.h
	add	x12, x3, x5
	add	x8, x8, 240
	ldr	z27, [x8]
	mad	z27.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #8
	sub	z19.h, z19.h, #128
	sub	z18.h, z18.h, #128
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z27.h, p7/m, z25.h, z8.h
	addvl	x8, sp, #3
	mla	z27.h, p7/m, z15.h, z2.h
	mla	z27.h, p7/m, z13.h, z0.h
	add	x8, x8, 240
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x5]
	ldr	z27, [x8]
	addvl	x8, sp, #16
	movprfx	z28, z31
	mla	z28.h, p7/m, z1.h, z26.h
	mla	z28.h, p7/m, z12.h, z16.h
	add	x8, x8, 240
	ldr	z1, [x8]
	mla	z28.h, p7/m, z5.h, z4.h
	addvl	x8, sp, #7
	mla	z28.h, p7/m, z27.h, z24.h
	movprfx	z27, z31
	mla	z27.h, p7/m, z1.h, z3.h
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z27.h, p7/m, z25.h, z8.h
	ldr	z25, [x9]
	addvl	x9, sp, #4
	mla	z27.h, p7/m, z7.h, z2.h
	add	x9, x9, 240
	mla	z27.h, p7/m, z21.h, z0.h
	add	z28.h, z28.h, z27.h
	movprfx	z27, z31
	mla	z27.h, p7/m, z14.h, z26.h
	ldr	z14, [x9]
	addvl	x9, sp, #6
	add	x8, x2, x6
	add	x9, x9, 240
	mla	z27.h, p7/m, z25.h, z16.h
	mla	z27.h, p7/m, z14.h, z4.h
	ldr	z14, [x9]
	addvl	x9, sp, #1
	add	x9, x9, 240
	ldr	z25, [x23]
	mla	z27.h, p7/m, z22.h, z24.h
	mad	z25.h, p7/m, z3.h, z31.h
	sqrshrunb	z28.b, z28.h, #6
	mla	z25.h, p7/m, z14.h, z8.h
	uzp1	z28.b, z28.b, z28.b
	mla	z25.h, p7/m, z6.h, z2.h
	mla	z25.h, p7/m, z20.h, z0.h
	add	z27.h, z27.h, z25.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	stp	q28, q27, [x8, 16]
	ldr	z15, [x9]
	addvl	x9, sp, #14
	add	x9, x9, 240
	str	z30, [x9]
	movprfx	z28, z31
	mla	z28.h, p7/m, z10.h, z26.h
	addvl	x9, sp, #15
	mla	z28.h, p7/m, z15.h, z16.h
	mla	z28.h, p7/m, z29.h, z4.h
	add	x9, x9, 240
	ldr	z10, [x9]
	mla	z28.h, p7/m, z30.h, z24.h
	add	x9, sp, 240
	ldr	z14, [x9]
	movprfx	z27, z31
	mla	z27.h, p7/m, z10.h, z3.h
	addvl	x9, sp, #13
	mla	z27.h, p7/m, z14.h, z8.h
	mla	z27.h, p7/m, z23.h, z2.h
	add	x9, x9, 240
	ldr	z30, [x9]
	mla	z27.h, p7/m, z30.h, z0.h
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x8, 48]
	add	x8, x11, 16
	ld1b	z28.h, p7/z, [x4, x8]
	addvl	x8, sp, #18
	ld1b	z14.h, p7/z, [x1, x0]
	sub	z28.h, z28.h, #128
	add	x8, x8, 240
	str	z28, [x8]
	add	x9, x1, x0
	add	x8, x11, 32
	ld1b	z15.h, p7/z, [x4, x8]
	add	x11, x11, 48
	addvl	x8, sp, #17
	ld1b	z28.h, p7/z, [x4, x11]
	movprfx	z27, z28
	sub	z27.h, z27.h, #128
	add	x8, x8, 240
	str	z27, [x8]
	addvl	x11, sp, #7
	addvl	x8, sp, #11
	add	x11, x11, 240
	sub	z14.h, z14.h, #128
	add	x8, x8, 240
	ldr	z28, [x8]
	mad	z28.h, p7/m, z26.h, z31.h
	addvl	x8, sp, #8
	add	x5, x5, x3, lsl 1
	sub	z15.h, z15.h, #128
	add	x8, x8, 240
	ldr	z27, [x8]
	mla	z28.h, p7/m, z27.h, z16.h
	addvl	x8, sp, #9
	mla	z28.h, p7/m, z9.h, z4.h
	mla	z28.h, p7/m, z13.h, z24.h
	add	x8, x8, 240
	ldr	z27, [x8]
	mad	z27.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #5
	add	x0, x0, x1, lsl 1
	add	x8, x8, 240
	ldr	z25, [x8]
	mla	z27.h, p7/m, z25.h, z8.h
	mla	z27.h, p7/m, z11.h, z2.h
	mla	z27.h, p7/m, z17.h, z0.h
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x3, x12]
	movprfx	z28, z31
	mla	z28.h, p7/m, z1.h, z26.h
	ldr	z1, [x11]
	addvl	x11, sp, #3
	add	x11, x11, 240
	ldr	z25, [x11]
	mla	z28.h, p7/m, z1.h, z16.h
	addvl	x11, sp, #6
	mov	z1.d, z12.d
	movprfx	z27, z31
	mla	z27.h, p7/m, z12.h, z3.h
	add	x11, x11, 240
	ldr	z12, [x11]
	mla	z27.h, p7/m, z5.h, z8.h
	addvl	x11, sp, #2
	add	x8, x6, x3
	mla	z27.h, p7/m, z25.h, z2.h
	add	x11, x11, 240
	mla	z27.h, p7/m, z19.h, z0.h
	add	x8, x2, x8
	mla	z28.h, p7/m, z7.h, z4.h
	mla	z28.h, p7/m, z21.h, z24.h
	add	z28.h, z28.h, z27.h
	ldr	z27, [x23]
	mad	z27.h, p7/m, z26.h, z31.h
	mla	z27.h, p7/m, z12.h, z16.h
	ldr	z12, [x11]
	addvl	x11, sp, #4
	movprfx	z25, z31
	mla	z25.h, p7/m, z12.h, z3.h
	add	x11, x11, 240
	ldr	z12, [x11]
	sqrshrunb	z28.b, z28.h, #6
	add	x11, sp, 240
	uzp1	z28.b, z28.b, z28.b
	mla	z25.h, p7/m, z12.h, z8.h
	mla	z27.h, p7/m, z6.h, z4.h
	mla	z25.h, p7/m, z22.h, z2.h
	mla	z27.h, p7/m, z20.h, z24.h
	mla	z25.h, p7/m, z18.h, z0.h
	add	z27.h, z27.h, z25.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	stp	q28, q27, [x8, 16]
	movprfx	z28, z31
	mla	z28.h, p7/m, z10.h, z26.h
	ldr	z10, [x11]
	addvl	x11, sp, #13
	mla	z28.h, p7/m, z10.h, z16.h
	add	x11, x11, 240
	str	z30, [x11]
	mla	z28.h, p7/m, z23.h, z4.h
	addvl	x11, sp, #1
	mla	z28.h, p7/m, z30.h, z24.h
	addvl	x12, sp, #2
	add	x11, x11, 240
	ldr	z27, [x11]
	mad	z27.h, p7/m, z3.h, z31.h
	addvl	x11, sp, #14
	mla	z27.h, p7/m, z29.h, z8.h
	add	x12, x12, 240
	add	x11, x11, 240
	ldr	z10, [x11]
	mla	z27.h, p7/m, z10.h, z2.h
	addvl	x11, sp, #12
	addvl	x6, sp, #7
	add	x11, x11, 240
	ldr	z30, [x11]
	mla	z27.h, p7/m, z30.h, z0.h
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x8, 48]
	ld1b	z12.h, p7/z, [x1, x9]
	add	x11, x3, x5
	sub	z12.h, z12.h, #128
	add	x6, x6, 240
	ldr	x8, [sp, 200]
	lsl	x8, x8, 1
	add	x9, x8, 16
	ld1b	z28.h, p7/z, [x4, x9]
	sub	z28.h, z28.h, #128
	add	x9, x8, 32
	add	x8, x8, 48
	ld1b	z25.h, p7/z, [x4, x8]
	addvl	x8, sp, #16
	ld1b	z27.h, p7/z, [x4, x9]
	sub	z25.h, z25.h, #128
	add	x8, x8, 240
	str	z25, [x8]
	sub	z27.h, z27.h, #128
	addvl	x8, sp, #9
	add	x8, x8, 240
	ldr	z25, [x8]
	mad	z25.h, p7/m, z26.h, z31.h
	addvl	x8, sp, #5
	add	x8, x8, 240
	ldr	z10, [x8]
	mla	z25.h, p7/m, z10.h, z16.h
	addvl	x8, sp, #8
	mla	z25.h, p7/m, z11.h, z4.h
	mla	z25.h, p7/m, z17.h, z24.h
	add	x8, x8, 240
	ldr	z10, [x8]
	mad	z10.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #20
	mla	z10.h, p7/m, z9.h, z8.h
	mla	z10.h, p7/m, z13.h, z2.h
	add	x8, x8, 240
	str	z9, [x8]
	mla	z10.h, p7/m, z14.h, z0.h
	addvl	x8, sp, #3
	add	z25.h, z25.h, z10.h
	sqrshrunb	z25.b, z25.h, #6
	add	x8, x8, 240
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x5]
	ldr	z10, [x8]
	addvl	x8, sp, #7
	movprfx	z25, z31
	mla	z25.h, p7/m, z1.h, z26.h
	ldr	x9, [sp, 224]
	mla	z25.h, p7/m, z5.h, z16.h
	mla	z25.h, p7/m, z10.h, z4.h
	add	x8, x8, 240
	ldr	z10, [x8]
	mad	z10.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #18
	mla	z10.h, p7/m, z7.h, z8.h
	mla	z10.h, p7/m, z21.h, z2.h
	add	x8, x8, 240
	ldr	z1, [x8]
	mla	z10.h, p7/m, z1.h, z0.h
	add	x8, x2, x9, lsl 1
	addvl	x9, sp, #2
	mla	z25.h, p7/m, z19.h, z24.h
	add	x9, x9, 240
	add	z25.h, z25.h, z10.h
	ldr	z10, [x9]
	addvl	x9, sp, #4
	mad	z10.h, p7/m, z26.h, z31.h
	sqrshrunb	z25.b, z25.h, #6
	add	x9, x9, 240
	ldr	z1, [x9]
	mla	z10.h, p7/m, z1.h, z16.h
	addvl	x9, sp, #6
	uzp1	z25.b, z25.b, z25.b
	mla	z10.h, p7/m, z22.h, z4.h
	add	x9, x9, 240
	ldr	z1, [x9]
	mla	z10.h, p7/m, z18.h, z24.h
	addvl	x9, sp, #1
	movprfx	z9, z31
	mla	z9.h, p7/m, z1.h, z3.h
	mla	z9.h, p7/m, z6.h, z8.h
	add	x9, x9, 240
	mla	z9.h, p7/m, z20.h, z2.h
	mla	z9.h, p7/m, z15.h, z0.h
	add	z10.h, z10.h, z9.h
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	stp	q25, q10, [x8, 16]
	ldr	z25, [x9]
	addvl	x9, sp, #14
	add	x9, x9, 240
	ldr	z9, [x9]
	mad	z25.h, p7/m, z26.h, z31.h
	addvl	x9, sp, #12
	mla	z25.h, p7/m, z29.h, z16.h
	mla	z25.h, p7/m, z9.h, z4.h
	add	x9, x9, 240
	str	z30, [x9]
	mla	z25.h, p7/m, z30.h, z24.h
	add	x9, sp, 240
	ldr	z10, [x9]
	mad	z10.h, p7/m, z3.h, z31.h
	addvl	x9, sp, #13
	mla	z10.h, p7/m, z23.h, z8.h
	add	x5, x5, x3, lsl 1
	add	x9, x9, 240
	ldr	z9, [x9]
	mla	z10.h, p7/m, z9.h, z2.h
	addvl	x9, sp, #17
	add	x9, x9, 240
	ldr	z1, [x9]
	mla	z10.h, p7/m, z1.h, z0.h
	add	z25.h, z25.h, z10.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x8, 48]
	sub	x8, x10, x1
	ld1b	z25.h, p7/z, [x1, x0]
	movprfx	z10, z25
	sub	z10.h, z10.h, #128
	str	z10, [x12]
	add	x12, x8, 16
	ld1b	z10.h, p7/z, [x4, x12]
	add	x12, x8, 32
	add	x8, x8, 48
	ld1b	z25.h, p7/z, [x4, x8]
	addvl	x8, sp, #15
	ld1b	z9.h, p7/z, [x4, x12]
	add	x8, x8, 240
	movprfx	z30, z25
	sub	z30.h, z30.h, #128
	str	z30, [x8]
	addvl	x8, sp, #8
	add	x9, x1, x0
	sub	z10.h, z10.h, #128
	add	x8, x8, 240
	ldr	z25, [x8]
	mad	z25.h, p7/m, z26.h, z31.h
	addvl	x8, sp, #20
	sub	z9.h, z9.h, #128
	add	x0, x0, x1, lsl 1
	add	x8, x8, 240
	ldr	z1, [x8]
	mla	z25.h, p7/m, z1.h, z16.h
	addvl	x8, sp, #5
	mla	z25.h, p7/m, z13.h, z4.h
	mla	z25.h, p7/m, z14.h, z24.h
	add	x8, x8, 240
	ldr	z30, [x8]
	mad	z30.h, p7/m, z3.h, z31.h
	mla	z30.h, p7/m, z11.h, z8.h
	mla	z30.h, p7/m, z17.h, z2.h
	mla	z30.h, p7/m, z12.h, z0.h
	add	z25.h, z25.h, z30.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x11]
	ldr	z25, [x6]
	addvl	x6, sp, #18
	add	x6, x6, 240
	ldr	z1, [x6]
	mad	z25.h, p7/m, z26.h, z31.h
	addvl	x6, sp, #3
	mla	z25.h, p7/m, z7.h, z16.h
	mla	z25.h, p7/m, z21.h, z4.h
	add	x6, x6, 240
	mla	z25.h, p7/m, z1.h, z24.h
	ldr	z1, [x6]
	addvl	x6, sp, #6
	movprfx	z30, z31
	mla	z30.h, p7/m, z5.h, z3.h
	mla	z30.h, p7/m, z1.h, z8.h
	add	x6, x6, 240
	mla	z30.h, p7/m, z19.h, z2.h
	mla	z30.h, p7/m, z28.h, z0.h
	add	z25.h, z25.h, z30.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z1.b, z25.b, z25.b
	ldr	z25, [x6]
	addvl	x6, sp, #4
	mad	z25.h, p7/m, z26.h, z31.h
	add	x6, x6, 240
	mla	z25.h, p7/m, z6.h, z16.h
	movprfx	z30, z25
	mla	z30.h, p7/m, z20.h, z4.h
	ldr	z25, [x6]
	mla	z30.h, p7/m, z15.h, z24.h
	add	x6, sp, 240
	mad	z25.h, p7/m, z3.h, z31.h
	mla	z25.h, p7/m, z22.h, z8.h
	mla	z25.h, p7/m, z18.h, z2.h
	mla	z25.h, p7/m, z27.h, z0.h
	add	z25.h, z30.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	stp	q1, q25, [x18, 16]
	mad	z5.h, p7/m, z26.h, z31.h
	ldr	z25, [x6]
	addvl	x6, sp, #19
	mad	z25.h, p7/m, z26.h, z31.h
	add	x6, x6, 240
	str	z23, [x6]
	mla	z25.h, p7/m, z23.h, z16.h
	addvl	x6, sp, #13
	add	x6, x6, 240
	ldr	z1, [x6]
	movprfx	z30, z25
	mla	z30.h, p7/m, z1.h, z4.h
	addvl	x6, sp, #17
	add	x6, x6, 240
	ldr	z25, [x6]
	mla	z30.h, p7/m, z25.h, z24.h
	addvl	x6, sp, #14
	movprfx	z25, z31
	mla	z25.h, p7/m, z29.h, z3.h
	mad	z29.h, p7/m, z26.h, z31.h
	add	x6, x6, 240
	ldr	z1, [x6]
	mla	z25.h, p7/m, z1.h, z8.h
	addvl	x6, sp, #12
	add	x6, x6, 240
	ldr	z1, [x6]
	mla	z25.h, p7/m, z1.h, z2.h
	addvl	x6, sp, #16
	add	x6, x6, 240
	ldr	z1, [x6]
	mla	z25.h, p7/m, z1.h, z0.h
	add	x6, x10, 16
	add	z25.h, z30.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x18, 48]
	ld1b	z30.h, p7/z, [x4, x6]
	add	x6, x10, 32
	sub	z30.h, z30.h, #128
	ld1b	z25.h, p7/z, [x1, x9]
	str	z30, [x23]
	ld1b	z30.h, p7/z, [x4, x6]
	addvl	x6, sp, #9
	add	x6, x6, 240
	sub	z30.h, z30.h, #128
	str	z30, [x6]
	add	x6, x10, 48
	movprfx	z23, z25
	sub	z23.h, z23.h, #128
	ld1b	z25.h, p7/z, [x4, x6]
	addvl	x6, sp, #11
	sub	z25.h, z25.h, #128
	ldr	z1, [x8]
	add	x6, x6, 240
	str	z25, [x6]
	mad	z1.h, p7/m, z26.h, z31.h
	addvl	x6, sp, #20
	mla	z1.h, p7/m, z11.h, z16.h
	mla	z1.h, p7/m, z17.h, z4.h
	add	x6, x6, 240
	ldr	z25, [x6]
	mla	z1.h, p7/m, z12.h, z24.h
	addvl	x6, sp, #2
	mad	z25.h, p7/m, z3.h, z31.h
	mla	z25.h, p7/m, z13.h, z8.h
	add	x6, x6, 240
	ldr	z30, [x6]
	mla	z25.h, p7/m, z14.h, z2.h
	addvl	x6, sp, #3
	mla	z25.h, p7/m, z30.h, z0.h
	add	z1.h, z1.h, z25.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x5]
	add	x6, x6, 240
	ldr	z30, [x6]
	movprfx	z1, z31
	mla	z1.h, p7/m, z7.h, z3.h
	ldr	x11, [sp, 168]
	mla	z1.h, p7/m, z21.h, z8.h
	mla	z5.h, p7/m, z30.h, z16.h
	addvl	x6, sp, #18
	mla	z5.h, p7/m, z19.h, z4.h
	mla	z5.h, p7/m, z28.h, z24.h
	add	x6, x6, 240
	addvl	x8, sp, #4
	ldr	z25, [x6]
	add	x8, x8, 240
	mla	z1.h, p7/m, z25.h, z2.h
	mla	z1.h, p7/m, z10.h, z0.h
	add	x6, x2, x11, lsl 2
	add	z5.h, z5.h, z1.h
	ldr	z1, [x8]
	addvl	x8, sp, #14
	mad	z1.h, p7/m, z26.h, z31.h
	mla	z1.h, p7/m, z22.h, z16.h
	add	x8, x8, 240
	movprfx	z30, z1
	mla	z30.h, p7/m, z18.h, z4.h
	sqrshrunb	z5.b, z5.h, #6
	mla	z30.h, p7/m, z27.h, z24.h
	movprfx	z1, z31
	mla	z1.h, p7/m, z6.h, z3.h
	uzp1	z5.b, z5.b, z5.b
	mla	z1.h, p7/m, z20.h, z8.h
	mla	z1.h, p7/m, z15.h, z2.h
	mla	z1.h, p7/m, z9.h, z0.h
	add	z1.h, z30.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	stp	q5, q1, [x6, 16]
	ldr	z25, [x8]
	addvl	x8, sp, #12
	add	x8, x8, 240
	ldr	z5, [x8]
	mla	z29.h, p7/m, z25.h, z16.h
	addvl	x8, sp, #16
	mla	z29.h, p7/m, z5.h, z4.h
	add	x10, x10, x1
	add	x8, x8, 240
	ldr	z5, [x8]
	mla	z29.h, p7/m, z5.h, z24.h
	addvl	x8, sp, #19
	add	x9, x3, x5
	mad	z7.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z5, [x8]
	mad	z5.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #13
	mla	z7.h, p7/m, z21.h, z16.h
	mad	z6.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z1, [x8]
	mla	z5.h, p7/m, z1.h, z8.h
	addvl	x8, sp, #17
	mla	z6.h, p7/m, z20.h, z16.h
	mla	z6.h, p7/m, z15.h, z4.h
	add	x8, x8, 240
	ldr	z1, [x8]
	mla	z5.h, p7/m, z1.h, z2.h
	addvl	x8, sp, #15
	mla	z6.h, p7/m, z9.h, z24.h
	add	x5, x5, x3, lsl 1
	add	x8, x8, 240
	ldr	z30, [x8]
	mla	z5.h, p7/m, z30.h, z0.h
	add	x8, sp, 240
	add	z29.h, z29.h, z5.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x6, 48]
	add	x6, x1, x0
	ld1b	z29.h, p7/z, [x1, x0]
	sub	z29.h, z29.h, #128
	str	z29, [x8]
	add	x8, x10, 16
	ld1b	z5.h, p7/z, [x4, x8]
	sub	z5.h, z5.h, #128
	add	x8, x10, 32
	ld1b	z1.h, p7/z, [x4, x8]
	movprfx	z29, z1
	sub	z29.h, z29.h, #128
	addvl	x8, sp, #8
	add	x10, x10, 48
	add	x8, x8, 240
	str	z29, [x8]
	ld1b	z1.h, p7/z, [x4, x10]
	addvl	x8, sp, #7
	movprfx	z29, z1
	sub	z29.h, z29.h, #128
	add	x0, x0, x1, lsl 1
	add	x8, x8, 240
	str	z29, [x8]
	add	x10, x3, x5
	addvl	x8, sp, #20
	add	x8, x8, 240
	ldr	z1, [x8]
	mad	z1.h, p7/m, z26.h, z31.h
	addvl	x8, sp, #2
	mla	z1.h, p7/m, z13.h, z16.h
	movprfx	z29, z1
	mla	z29.h, p7/m, z14.h, z4.h
	add	x8, x8, 240
	ldr	z30, [x8]
	movprfx	z1, z31
	mla	z1.h, p7/m, z11.h, z3.h
	mla	z29.h, p7/m, z30.h, z24.h
	mla	z1.h, p7/m, z17.h, z8.h
	mla	z1.h, p7/m, z12.h, z2.h
	mla	z1.h, p7/m, z23.h, z0.h
	add	z1.h, z29.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x9]
	addvl	x9, sp, #18
	add	x9, x9, 240
	ldr	z1, [x9]
	mla	z7.h, p7/m, z1.h, z4.h
	addvl	x9, sp, #3
	add	x8, x3, x11, lsl 2
	ldr	z29, [x23]
	add	x9, x9, 240
	ldr	z1, [x9]
	add	x8, x2, x8
	addvl	x9, sp, #9
	mad	z1.h, p7/m, z3.h, z31.h
	mla	z1.h, p7/m, z19.h, z8.h
	add	x9, x9, 240
	mla	z1.h, p7/m, z28.h, z2.h
	mla	z1.h, p7/m, z29.h, z0.h
	ldr	z29, [x9]
	addvl	x9, sp, #19
	mla	z7.h, p7/m, z10.h, z24.h
	add	x9, x9, 240
	add	z7.h, z7.h, z1.h
	movprfx	z1, z31
	mla	z1.h, p7/m, z22.h, z3.h
	sqrshrunb	z7.b, z7.h, #6
	mla	z1.h, p7/m, z18.h, z8.h
	uzp1	z7.b, z7.b, z7.b
	mla	z1.h, p7/m, z27.h, z2.h
	mla	z1.h, p7/m, z29.h, z0.h
	add	z6.h, z6.h, z1.h
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	stp	q7, q6, [x8, 16]
	ldr	z30, [x9]
	addvl	x9, sp, #13
	mad	z30.h, p7/m, z26.h, z31.h
	add	x9, x9, 240
	ldr	z1, [x9]
	mla	z30.h, p7/m, z1.h, z16.h
	addvl	x9, sp, #17
	mad	z11.h, p7/m, z26.h, z31.h
	mla	z11.h, p7/m, z17.h, z16.h
	add	x9, x9, 240
	ldr	z7, [x9]
	mla	z30.h, p7/m, z7.h, z4.h
	addvl	x9, sp, #15
	movprfx	z7, z31
	mla	z7.h, p7/m, z25.h, z3.h
	mla	z11.h, p7/m, z12.h, z4.h
	add	x9, x9, 240
	ldr	z6, [x9]
	mla	z30.h, p7/m, z6.h, z24.h
	addvl	x9, sp, #12
	mov	z6.d, z25.d
	mla	z11.h, p7/m, z23.h, z24.h
	add	x9, x9, 240
	ldr	z25, [x9]
	mla	z7.h, p7/m, z25.h, z8.h
	addvl	x9, sp, #16
	mad	z22.h, p7/m, z26.h, z31.h
	mla	z22.h, p7/m, z18.h, z16.h
	add	x9, x9, 240
	ldr	z25, [x9]
	mla	z7.h, p7/m, z25.h, z2.h
	addvl	x9, sp, #11
	mla	z22.h, p7/m, z27.h, z4.h
	add	x9, x9, 240
	ldr	z25, [x9]
	mla	z7.h, p7/m, z25.h, z0.h
	add	z30.h, z30.h, z7.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x8, 48]
	ld1b	z30.h, p7/z, [x1, x6]
	add	x6, x22, 16
	ld1b	z7.h, p7/z, [x4, x6]
	addvl	x6, sp, #6
	sub	z7.h, z7.h, #128
	add	x6, x6, 240
	str	z7, [x6]
	sub	z30.h, z30.h, #128
	add	x6, x22, 32
	ld1b	z7.h, p7/z, [x4, x6]
	sub	z7.h, z7.h, #128
	addvl	x6, sp, #5
	add	x22, x22, 48
	add	x6, x6, 240
	str	z7, [x6]
	ld1b	z7.h, p7/z, [x4, x22]
	addvl	x6, sp, #1
	sub	z7.h, z7.h, #128
	str	z23, [x9]
	add	x6, x6, 240
	str	z7, [x6]
	movprfx	z7, z31
	mla	z7.h, p7/m, z13.h, z3.h
	addvl	x6, sp, #2
	mla	z7.h, p7/m, z14.h, z8.h
	mad	z13.h, p7/m, z26.h, z31.h
	add	x6, x6, 240
	ldr	z29, [x6]
	mla	z7.h, p7/m, z29.h, z2.h
	add	x6, sp, 240
	ldr	z23, [x6]
	mla	z7.h, p7/m, z23.h, z0.h
	addvl	x6, sp, #3
	add	z11.h, z11.h, z7.h
	sqrshrunb	z11.b, z11.h, #6
	add	x6, x6, 240
	uzp1	z11.b, z11.b, z11.b
	str	q11, [x3, x5]
	ldr	z23, [x6]
	addvl	x6, sp, #18
	ldr	z11, [x23]
	add	x6, x6, 240
	ldr	z7, [x6]
	mad	z23.h, p7/m, z26.h, z31.h
	addvl	x6, sp, #9
	mla	z23.h, p7/m, z19.h, z16.h
	mla	z23.h, p7/m, z28.h, z4.h
	add	x6, x6, 240
	mla	z23.h, p7/m, z11.h, z24.h
	movprfx	z11, z31
	mla	z11.h, p7/m, z21.h, z3.h
	mla	z11.h, p7/m, z7.h, z8.h
	mla	z11.h, p7/m, z10.h, z2.h
	mla	z11.h, p7/m, z5.h, z0.h
	add	z23.h, z23.h, z11.h
	ldr	z11, [x6]
	addvl	x6, sp, #8
	add	x6, x6, 240
	ldr	z7, [x6]
	sqrshrunb	z23.b, z23.h, #6
	addvl	x6, sp, #12
	uzp1	z23.b, z23.b, z23.b
	mla	z22.h, p7/m, z11.h, z24.h
	add	x6, x6, 240
	movprfx	z11, z31
	mla	z11.h, p7/m, z20.h, z3.h
	mla	z11.h, p7/m, z15.h, z8.h
	mla	z11.h, p7/m, z9.h, z2.h
	mla	z11.h, p7/m, z7.h, z0.h
	add	z22.h, z22.h, z11.h
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	stp	q23, q22, [x28, 16]
	movprfx	z23, z31
	mla	z23.h, p7/m, z6.h, z26.h
	ldr	z6, [x6]
	addvl	x6, sp, #16
	add	x6, x6, 240
	ldr	z22, [x6]
	mla	z23.h, p7/m, z6.h, z16.h
	addvl	x6, sp, #17
	mla	z23.h, p7/m, z22.h, z4.h
	mov	z7.d, z1.d
	add	x6, x6, 240
	movprfx	z22, z23
	mla	z22.h, p7/m, z25.h, z24.h
	movprfx	z23, z31
	mla	z23.h, p7/m, z1.h, z3.h
	ldr	z1, [x6]
	addvl	x6, sp, #15
	mla	z23.h, p7/m, z1.h, z8.h
	add	x6, x6, 240
	ldr	z11, [x6]
	mla	z23.h, p7/m, z11.h, z2.h
	addvl	x6, sp, #7
	mla	z13.h, p7/m, z14.h, z16.h
	mla	z13.h, p7/m, z29.h, z4.h
	add	x6, x6, 240
	ldr	z1, [x6]
	mla	z23.h, p7/m, z1.h, z0.h
	lsl	x6, x1, 6
	add	z23.h, z22.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	sub	x8, x6, x1
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x28, 48]
	add	x11, x8, 16
	ld1b	z23.h, p7/z, [x4, x11]
	ld1b	z22.h, p7/z, [x1, x0]
	addvl	x11, sp, #4
	sub	z23.h, z23.h, #128
	mad	z21.h, p7/m, z26.h, z31.h
	add	x11, x11, 240
	str	z23, [x11]
	mad	z20.h, p7/m, z26.h, z31.h
	add	x11, x8, 32
	add	x8, x8, 48
	ld1b	z11.h, p7/z, [x4, x11]
	addvl	x11, sp, #14
	movprfx	z1, z11
	sub	z1.h, z1.h, #128
	mla	z20.h, p7/m, z15.h, z16.h
	add	x11, x11, 240
	str	z1, [x11]
	ld1b	z11.h, p7/z, [x4, x8]
	addvl	x8, sp, #3
	sub	z11.h, z11.h, #128
	mla	z20.h, p7/m, z9.h, z4.h
	add	x8, x8, 240
	str	z11, [x8]
	movprfx	z11, z31
	mla	z11.h, p7/m, z17.h, z3.h
	addvl	x8, sp, #2
	mla	z11.h, p7/m, z12.h, z8.h
	add	x9, x1, x0
	add	x8, x8, 240
	str	z29, [x8]
	add	x5, x5, x3, lsl 1
	add	x8, sp, 240
	ldr	z1, [x8]
	mla	z13.h, p7/m, z1.h, z24.h
	addvl	x8, sp, #11
	sub	z22.h, z22.h, #128
	mad	z17.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z1, [x8]
	mla	z11.h, p7/m, z1.h, z2.h
	addvl	x8, sp, #18
	mla	z11.h, p7/m, z30.h, z0.h
	add	z13.h, z13.h, z11.h
	add	x8, x8, 240
	sqrshrunb	z13.b, z13.h, #6
	uzp1	z13.b, z13.b, z13.b
	str	q13, [x3, x10]
	ldr	z11, [x8]
	addvl	x8, sp, #6
	ldr	z29, [x23]
	add	x8, x8, 240
	movprfx	z13, z31
	mla	z13.h, p7/m, z19.h, z3.h
	mla	z13.h, p7/m, z28.h, z8.h
	mla	z13.h, p7/m, z29.h, z2.h
	ldr	z29, [x8]
	addvl	x8, sp, #8
	mla	z13.h, p7/m, z29.h, z0.h
	mla	z21.h, p7/m, z11.h, z16.h
	add	x8, x8, 240
	mla	z21.h, p7/m, z10.h, z4.h
	mla	z21.h, p7/m, z5.h, z24.h
	add	z21.h, z21.h, z13.h
	ldr	z13, [x8]
	addvl	x8, sp, #9
	add	x8, x8, 240
	ldr	z29, [x8]
	mla	z20.h, p7/m, z13.h, z24.h
	addvl	x8, sp, #5
	movprfx	z13, z31
	mla	z13.h, p7/m, z18.h, z3.h
	mla	z13.h, p7/m, z27.h, z8.h
	add	x8, x8, 240
	mla	z13.h, p7/m, z29.h, z2.h
	ldr	z29, [x8]
	addvl	x8, sp, #17
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	add	x8, x8, 240
	mla	z13.h, p7/m, z29.h, z0.h
	add	z20.h, z20.h, z13.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	stp	q21, q20, [x21, 16]
	movprfx	z21, z31
	mla	z21.h, p7/m, z7.h, z26.h
	ldr	z7, [x8]
	addvl	x8, sp, #15
	add	x8, x8, 240
	ldr	z20, [x8]
	mla	z21.h, p7/m, z7.h, z16.h
	addvl	x8, sp, #7
	mla	z21.h, p7/m, z20.h, z4.h
	mla	z17.h, p7/m, z12.h, z16.h
	add	x8, x8, 240
	ldr	z20, [x8]
	mla	z21.h, p7/m, z20.h, z24.h
	addvl	x8, sp, #16
	movprfx	z20, z31
	mla	z20.h, p7/m, z6.h, z3.h
	mla	z17.h, p7/m, z1.h, z4.h
	add	x8, x8, 240
	ldr	z13, [x8]
	mla	z20.h, p7/m, z13.h, z8.h
	addvl	x8, sp, #1
	mla	z20.h, p7/m, z25.h, z2.h
	mla	z17.h, p7/m, z30.h, z24.h
	add	x8, x8, 240
	ldr	z23, [x8]
	mla	z20.h, p7/m, z23.h, z0.h
	add	x8, x6, 16
	add	z21.h, z21.h, z20.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x21, 48]
	ld1b	z20.h, p7/z, [x1, x9]
	ld1b	z21.h, p7/z, [x4, x8]
	addvl	x8, sp, #12
	sub	z21.h, z21.h, #128
	add	x8, x8, 240
	str	z21, [x8]
	movprfx	z13, z31
	mla	z13.h, p7/m, z14.h, z3.h
	add	x8, x6, 32
	ld1b	z21.h, p7/z, [x4, x8]
	sub	z21.h, z21.h, #128
	addvl	x8, sp, #13
	mad	z19.h, p7/m, z26.h, z31.h
	addvl	x10, sp, #9
	add	x8, x8, 240
	str	z21, [x8]
	mla	z19.h, p7/m, z28.h, z16.h
	add	x8, x6, 48
	ld1b	z21.h, p7/z, [x4, x8]
	add	x10, x10, 240
	addvl	x8, sp, #11
	mad	z18.h, p7/m, z26.h, z31.h
	mla	z18.h, p7/m, z27.h, z16.h
	add	x8, x8, 240
	str	z1, [x8]
	add	x6, x6, x1
	addvl	x8, sp, #2
	add	x0, x0, x1, lsl 1
	mad	z14.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	ldr	z29, [x8]
	mla	z13.h, p7/m, z29.h, z8.h
	add	x8, sp, 240
	ldr	z1, [x8]
	mla	z13.h, p7/m, z1.h, z2.h
	addvl	x8, sp, #6
	mla	z13.h, p7/m, z22.h, z0.h
	add	z17.h, z17.h, z13.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	add	x8, x8, 240
	str	q17, [x3, x5]
	ldr	z17, [x23]
	mla	z19.h, p7/m, z17.h, z4.h
	ldr	z17, [x8]
	addvl	x8, sp, #4
	mla	z19.h, p7/m, z17.h, z24.h
	add	x8, x8, 240
	ldr	z13, [x8]
	movprfx	z17, z31
	mla	z17.h, p7/m, z11.h, z3.h
	mla	z17.h, p7/m, z10.h, z8.h
	mla	z17.h, p7/m, z5.h, z2.h
	mla	z17.h, p7/m, z13.h, z0.h
	add	z19.h, z19.h, z17.h
	ldr	z17, [x10]
	addvl	x10, sp, #5
	add	x10, x10, 240
	ldr	z13, [x10]
	add	x8, x2, x20, lsl 3
	addvl	x10, sp, #8
	mla	z18.h, p7/m, z17.h, z4.h
	mla	z18.h, p7/m, z13.h, z24.h
	add	x10, x10, 240
	ldr	z13, [x10]
	sqrshrunb	z19.b, z19.h, #6
	addvl	x10, sp, #16
	uzp1	z19.b, z19.b, z19.b
	movprfx	z17, z31
	mla	z17.h, p7/m, z15.h, z3.h
	add	x10, x10, 240
	mla	z17.h, p7/m, z9.h, z8.h
	mla	z17.h, p7/m, z13.h, z2.h
	ldr	z13, [x11]
	mla	z17.h, p7/m, z13.h, z0.h
	add	z18.h, z18.h, z17.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	stp	q19, q18, [x8, 16]
	movprfx	z19, z31
	mla	z19.h, p7/m, z6.h, z26.h
	ldr	z6, [x10]
	addvl	x10, sp, #1
	add	x10, x10, 240
	str	z23, [x10]
	mla	z19.h, p7/m, z6.h, z16.h
	addvl	x10, sp, #15
	mla	z19.h, p7/m, z25.h, z4.h
	movprfx	z18, z31
	mla	z18.h, p7/m, z7.h, z3.h
	add	x10, x10, 240
	ldr	z17, [x10]
	mla	z19.h, p7/m, z23.h, z24.h
	addvl	x10, sp, #7
	mla	z18.h, p7/m, z17.h, z8.h
	add	x9, x3, x5
	add	x10, x10, 240
	ldr	z13, [x10]
	mla	z18.h, p7/m, z13.h, z2.h
	addvl	x10, sp, #3
	mla	z14.h, p7/m, z29.h, z16.h
	mla	z14.h, p7/m, z1.h, z4.h
	add	x10, x10, 240
	ldr	z23, [x10]
	mla	z18.h, p7/m, z23.h, z0.h
	add	x10, x6, 16
	add	z19.h, z19.h, z18.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x8, 48]
	ld1b	z17.h, p7/z, [x1, x0]
	ld1b	z19.h, p7/z, [x4, x10]
	add	x10, x6, 32
	movprfx	z23, z19
	sub	z23.h, z23.h, #128
	add	x6, x6, 48
	ld1b	z19.h, p7/z, [x4, x6]
	ld1b	z18.h, p7/z, [x4, x10]
	addvl	x6, sp, #2
	sub	z20.h, z20.h, #128
	movprfx	z13, z31
	mla	z13.h, p7/m, z12.h, z3.h
	add	x6, x6, 240
	str	z29, [x6]
	mla	z14.h, p7/m, z22.h, z24.h
	add	x6, sp, 240
	str	z1, [x6]
	add	x20, x3, x20, lsl 3
	addvl	x6, sp, #11
	add	x20, x2, x20
	mad	z15.h, p7/m, z26.h, z31.h
	add	x6, x6, 240
	ldr	z1, [x6]
	mla	z13.h, p7/m, z1.h, z8.h
	add	x6, x5, x3, lsl 1
	addvl	x5, sp, #4
	mla	z13.h, p7/m, z30.h, z2.h
	add	x5, x5, 240
	mla	z13.h, p7/m, z20.h, z0.h
	add	z14.h, z14.h, z13.h
	sqrshrunb	z14.b, z14.h, #6
	uzp1	z14.b, z14.b, z14.b
	str	q14, [x3, x9]
	ldr	z13, [x5]
	addvl	x5, sp, #6
	movprfx	z14, z31
	mla	z14.h, p7/m, z11.h, z26.h
	ldr	z11, [x23]
	mla	z14.h, p7/m, z10.h, z16.h
	add	x5, x5, 240
	mla	z14.h, p7/m, z5.h, z4.h
	mad	z13.h, p7/m, z24.h, z14.h
	mla	z15.h, p7/m, z9.h, z16.h
	movprfx	z14, z31
	mla	z14.h, p7/m, z28.h, z3.h
	mla	z14.h, p7/m, z11.h, z8.h
	ldr	z11, [x5]
	addvl	x5, sp, #12
	mla	z14.h, p7/m, z11.h, z2.h
	sub	z21.h, z21.h, #128
	add	x5, x5, 240
	ldr	z11, [x5]
	mla	z14.h, p7/m, z11.h, z0.h
	addvl	x5, sp, #8
	add	z14.h, z13.h, z14.h
	sqrshrunb	z14.b, z14.h, #6
	add	x5, x5, 240
	uzp1	z13.b, z14.b, z14.b
	ldr	z14, [x5]
	addvl	x5, sp, #9
	mla	z15.h, p7/m, z14.h, z4.h
	ldr	z14, [x11]
	add	x5, x5, 240
	ldr	z11, [x5]
	mla	z15.h, p7/m, z14.h, z24.h
	addvl	x5, sp, #5
	movprfx	z14, z31
	mla	z14.h, p7/m, z27.h, z3.h
	mla	z14.h, p7/m, z11.h, z8.h
	add	x5, x5, 240
	ldr	z29, [x5]
	mla	z14.h, p7/m, z29.h, z2.h
	addvl	x5, sp, #13
	add	x8, x1, x0
	mad	z12.h, p7/m, z26.h, z31.h
	add	x5, x5, 240
	ldr	z29, [x5]
	mla	z14.h, p7/m, z29.h, z0.h
	addvl	x5, sp, #15
	add	z15.h, z15.h, z14.h
	sqrshrunb	z15.b, z15.h, #6
	add	x5, x5, 240
	uzp1	z15.b, z15.b, z15.b
	stp	q13, q15, [x20, 16]
	ldr	z29, [x5]
	addvl	x5, sp, #7
	movprfx	z15, z31
	mla	z15.h, p7/m, z7.h, z26.h
	add	x5, x5, 240
	ldr	z13, [x5]
	mla	z15.h, p7/m, z29.h, z16.h
	addvl	x5, sp, #3
	mla	z15.h, p7/m, z13.h, z4.h
	mla	z12.h, p7/m, z1.h, z16.h
	add	x5, x5, 240
	ldr	z14, [x5]
	mad	z14.h, p7/m, z24.h, z15.h
	addvl	x5, sp, #1
	movprfx	z15, z31
	mla	z15.h, p7/m, z6.h, z3.h
	mla	z15.h, p7/m, z25.h, z8.h
	add	x5, x5, 240
	ldr	z7, [x5]
	mla	z15.h, p7/m, z7.h, z2.h
	add	x5, x14, 16
	mla	z15.h, p7/m, z21.h, z0.h
	add	z15.h, z14.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x20, 48]
	ld1b	z14.h, p7/z, [x4, x5]
	add	x5, x14, 32
	ld1b	z15.h, p7/z, [x4, x5]
	addvl	x5, sp, #15
	ld1b	z13.h, p7/z, [x1, x8]
	add	x14, x14, 48
	add	x5, x5, 240
	ld1b	z11.h, p7/z, [x4, x14]
	movprfx	z7, z11
	sub	z7.h, z7.h, #128
	str	z7, [x5]
	addvl	x5, sp, #11
	sub	z17.h, z17.h, #128
	add	x5, x5, 240
	str	z1, [x5]
	mla	z12.h, p7/m, z30.h, z4.h
	addvl	x5, sp, #2
	mla	z12.h, p7/m, z20.h, z24.h
	mad	z28.h, p7/m, z26.h, z31.h
	add	x5, x5, 240
	ldr	z7, [x5]
	movprfx	z11, z31
	mla	z11.h, p7/m, z7.h, z3.h
	add	x5, sp, 240
	ldr	z1, [x5]
	mla	z11.h, p7/m, z1.h, z8.h
	addvl	x5, sp, #6
	mla	z11.h, p7/m, z22.h, z2.h
	mla	z11.h, p7/m, z17.h, z0.h
	add	x5, x5, 240
	add	z12.h, z12.h, z11.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x6]
	ldr	z11, [x23]
	ldr	z12, [x5]
	addvl	x5, sp, #12
	mla	z28.h, p7/m, z11.h, z16.h
	add	x5, x5, 240
	mla	z28.h, p7/m, z12.h, z4.h
	ldr	z12, [x5]
	addvl	x8, sp, #9
	addvl	x5, sp, #4
	mla	z28.h, p7/m, z12.h, z24.h
	add	x5, x5, 240
	ldr	z11, [x5]
	movprfx	z12, z31
	mla	z12.h, p7/m, z10.h, z3.h
	add	x8, x8, 240
	mla	z12.h, p7/m, z5.h, z8.h
	mla	z12.h, p7/m, z11.h, z2.h
	mla	z12.h, p7/m, z23.h, z0.h
	add	z28.h, z28.h, z12.h
	ldr	x5, [sp, 232]
	ldr	z12, [x8]
	addvl	x8, sp, #5
	mad	z27.h, p7/m, z26.h, z31.h
	add	x8, x8, 240
	mla	z27.h, p7/m, z12.h, z16.h
	ldr	z12, [x8]
	addvl	x8, sp, #13
	mla	z27.h, p7/m, z12.h, z4.h
	sub	z18.h, z18.h, #128
	add	x8, x8, 240
	ldr	z11, [x8]
	add	x5, x2, x5, lsl 1
	addvl	x8, sp, #8
	mla	z27.h, p7/m, z11.h, z24.h
	movprfx	z12, z31
	mla	z12.h, p7/m, z9.h, z3.h
	add	x8, x8, 240
	ldr	z11, [x8]
	mla	z12.h, p7/m, z11.h, z8.h
	addvl	x8, sp, #1
	ldr	z11, [x11]
	mla	z12.h, p7/m, z11.h, z2.h
	add	x8, x8, 240
	mla	z12.h, p7/m, z18.h, z0.h
	add	z27.h, z27.h, z12.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	stp	q28, q27, [x5, 16]
	ldr	z27, [x8]
	addvl	x8, sp, #7
	movprfx	z28, z31
	mla	z28.h, p7/m, z6.h, z26.h
	sub	z19.h, z19.h, #128
	add	x8, x8, 240
	ldr	z6, [x8]
	mla	z28.h, p7/m, z25.h, z16.h
	addvl	x8, sp, #3
	mla	z28.h, p7/m, z27.h, z4.h
	movprfx	z27, z31
	mla	z27.h, p7/m, z29.h, z3.h
	mla	z28.h, p7/m, z21.h, z24.h
	mla	z27.h, p7/m, z6.h, z8.h
	add	x8, x8, 240
	ldr	z12, [x8]
	mla	z27.h, p7/m, z12.h, z2.h
	mla	z27.h, p7/m, z19.h, z0.h
	add	z28.h, z28.h, z27.h
	sqrshrunb	z28.b, z28.h, #6
	uzp1	z28.b, z28.b, z28.b
	str	q28, [x5, 48]
	sub	x5, x7, x1
	mad	z7.h, p7/m, z26.h, z31.h
	add	x8, x5, 16
	ld1b	z28.h, p7/z, [x4, x8]
	mla	z7.h, p7/m, z1.h, z16.h
	add	x10, x3, x6
	add	x8, x5, 32
	mla	z7.h, p7/m, z22.h, z4.h
	add	x5, x5, 48
	ld1b	z12.h, p7/z, [x4, x5]
	ld1b	z11.h, p7/z, [x4, x8]
	add	x5, sp, 240
	add	x0, x0, x1, lsl 1
	ld1b	z27.h, p7/z, [x1, x0]
	str	z1, [x5]
	addvl	x5, sp, #11
	sub	z13.h, z13.h, #128
	ldr	x8, [sp, 160]
	movprfx	z6, z7
	mla	z6.h, p7/m, z17.h, z24.h
	mad	z10.h, p7/m, z26.h, z31.h
	add	x5, x5, 240
	ldr	z1, [x5]
	movprfx	z7, z31
	mla	z7.h, p7/m, z1.h, z3.h
	mla	z7.h, p7/m, z30.h, z8.h
	mla	z7.h, p7/m, z20.h, z2.h
	mla	z7.h, p7/m, z13.h, z0.h
	add	z7.h, z6.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x10]
	addvl	x10, sp, #4
	mla	z10.h, p7/m, z5.h, z16.h
	add	x10, x10, 240
	ldr	z7, [x10]
	mla	z10.h, p7/m, z7.h, z4.h
	addvl	x10, sp, #6
	ldr	z7, [x23]
	mad	z7.h, p7/m, z3.h, z31.h
	add	x10, x10, 240
	ldr	z6, [x10]
	mla	z7.h, p7/m, z6.h, z8.h
	addvl	x10, sp, #12
	sub	z14.h, z14.h, #128
	mla	z10.h, p7/m, z23.h, z24.h
	add	x10, x10, 240
	ldr	z6, [x10]
	mla	z7.h, p7/m, z6.h, z2.h
	addvl	x10, sp, #8
	mla	z7.h, p7/m, z14.h, z0.h
	add	z10.h, z10.h, z7.h
	add	x10, x10, 240
	ldr	z6, [x10]
	ldr	z7, [x11]
	addvl	x10, sp, #9
	mad	z9.h, p7/m, z26.h, z31.h
	mla	z9.h, p7/m, z6.h, z16.h
	add	x10, x10, 240
	mla	z9.h, p7/m, z7.h, z4.h
	ldr	z7, [x10]
	addvl	x10, sp, #5
	lsl	x5, x8, 2
	mad	z7.h, p7/m, z3.h, z31.h
	add	x10, x10, 240
	ldr	z6, [x10]
	sub	x8, x5, x3
	addvl	x10, sp, #13
	add	x8, x2, x8
	mla	z7.h, p7/m, z6.h, z8.h
	add	x10, x10, 240
	ldr	z6, [x10]
	sub	z15.h, z15.h, #128
	addvl	x10, sp, #7
	mla	z9.h, p7/m, z18.h, z24.h
	mla	z7.h, p7/m, z6.h, z2.h
	add	x10, x10, 240
	mla	z7.h, p7/m, z15.h, z0.h
	add	z9.h, z9.h, z7.h
	sqrshrunb	z9.b, z9.h, #6
	uzp1	z9.b, z9.b, z9.b
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	stp	q10, q9, [x8, 16]
	ldr	z9, [x10]
	addvl	x10, sp, #3
	movprfx	z10, z31
	mla	z10.h, p7/m, z29.h, z26.h
	mla	z10.h, p7/m, z9.h, z16.h
	add	x10, x10, 240
	ldr	z29, [x10]
	movprfx	z9, z31
	mla	z9.h, p7/m, z25.h, z3.h
	addvl	x10, sp, #11
	mla	z10.h, p7/m, z29.h, z4.h
	mla	z10.h, p7/m, z19.h, z24.h
	add	x10, x10, 240
	str	z25, [x10]
	add	x9, x1, x0
	addvl	x10, sp, #1
	add	x6, x6, x3, lsl 1
	sub	z27.h, z27.h, #128
	add	x10, x10, 240
	ldr	z7, [x10]
	mla	z9.h, p7/m, z7.h, z8.h
	addvl	x10, sp, #15
	mla	z9.h, p7/m, z21.h, z2.h
	movprfx	z25, z31
	mla	z25.h, p7/m, z1.h, z26.h
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z9.h, p7/m, z29.h, z0.h
	add	z10.h, z10.h, z9.h
	sqrshrunb	z10.b, z10.h, #6
	uzp1	z10.b, z10.b, z10.b
	str	q10, [x8, 48]
	add	x8, x7, 16
	ld1b	z10.h, p7/z, [x4, x8]
	addvl	x8, sp, #2
	ld1b	z7.h, p7/z, [x1, x9]
	sub	z10.h, z10.h, #128
	add	x8, x8, 240
	str	z10, [x8]
	mla	z25.h, p7/m, z30.h, z16.h
	add	x8, x7, 32
	ld1b	z9.h, p7/z, [x4, x8]
	mla	z25.h, p7/m, z20.h, z4.h
	add	x8, x7, 48
	ld1b	z10.h, p7/z, [x4, x8]
	mla	z25.h, p7/m, z13.h, z24.h
	add	x8, sp, 240
	ldr	z6, [x8]
	mad	z6.h, p7/m, z3.h, z31.h
	addvl	x8, sp, #6
	mla	z6.h, p7/m, z22.h, z8.h
	mla	z6.h, p7/m, z17.h, z2.h
	add	x8, x8, 240
	mla	z6.h, p7/m, z27.h, z0.h
	add	z25.h, z25.h, z6.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x6]
	ldr	z29, [x23]
	movprfx	z25, z31
	mla	z25.h, p7/m, z29.h, z26.h
	addvl	x10, sp, #9
	ldr	z29, [x8]
	addvl	x8, sp, #12
	mla	z25.h, p7/m, z29.h, z16.h
	add	x8, x8, 240
	ldr	z29, [x8]
	add	x10, x10, 240
	addvl	x8, sp, #4
	mla	z25.h, p7/m, z29.h, z4.h
	movprfx	z6, z25
	mla	z6.h, p7/m, z14.h, z24.h
	add	x8, x8, 240
	ldr	z29, [x8]
	movprfx	z25, z31
	mla	z25.h, p7/m, z5.h, z3.h
	mla	z25.h, p7/m, z29.h, z8.h
	ldr	z29, [x10]
	addvl	x10, sp, #5
	sub	z28.h, z28.h, #128
	mla	z25.h, p7/m, z23.h, z2.h
	add	x10, x10, 240
	mla	z25.h, p7/m, z28.h, z0.h
	add	z25.h, z6.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z6.b, z25.b, z25.b
	movprfx	z25, z31
	mla	z25.h, p7/m, z29.h, z26.h
	ldr	z29, [x10]
	addvl	x10, sp, #13
	mla	z25.h, p7/m, z29.h, z16.h
	add	x8, x2, x5
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z25.h, p7/m, z29.h, z4.h
	addvl	x10, sp, #9
	mla	z25.h, p7/m, z15.h, z24.h
	ldr	z1, [x11]
	add	x10, x10, 240
	str	z25, [x10]
	sub	z11.h, z11.h, #128
	addvl	x10, sp, #8
	add	x0, x0, x1, lsl 1
	sub	z12.h, z12.h, #128
	add	x10, x10, 240
	ldr	z29, [x10]
	movprfx	z25, z31
	mla	z25.h, p7/m, z29.h, z3.h
	addvl	x10, sp, #9
	mla	z25.h, p7/m, z1.h, z8.h
	mla	z25.h, p7/m, z18.h, z2.h
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z25.h, p7/m, z11.h, z0.h
	addvl	x10, sp, #11
	add	z25.h, z29.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	add	x10, x10, 240
	uzp1	z25.b, z25.b, z25.b
	stp	q6, q25, [x8, 16]
	ldr	z25, [x10]
	addvl	x10, sp, #1
	mad	z25.h, p7/m, z26.h, z31.h
	add	x10, x10, 240
	ldr	z6, [x10]
	mla	z25.h, p7/m, z6.h, z16.h
	addvl	x10, sp, #15
	mla	z25.h, p7/m, z21.h, z4.h
	add	x7, x7, x1
	add	x10, x10, 240
	ldr	z6, [x10]
	mad	z6.h, p7/m, z24.h, z25.h
	addvl	x10, sp, #7
	add	x9, x3, x6
	sub	z7.h, z7.h, #128
	add	x10, x10, 240
	ldr	z25, [x10]
	mad	z25.h, p7/m, z3.h, z31.h
	addvl	x10, sp, #3
	mad	z5.h, p7/m, z26.h, z31.h
	add	x5, x5, x3
	add	x10, x10, 240
	ldr	z29, [x10]
	mla	z25.h, p7/m, z29.h, z8.h
	mla	z25.h, p7/m, z19.h, z2.h
	mla	z25.h, p7/m, z12.h, z0.h
	add	z25.h, z6.h, z25.h
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x8, 48]
	add	x8, x1, x0
	ld1b	z25.h, p7/z, [x1, x0]
	sub	z25.h, z25.h, #128
	addvl	x0, sp, #9
	add	x5, x2, x5
	sub	z9.h, z9.h, #128
	add	x0, x0, 240
	str	z25, [x0]
	sub	z10.h, z10.h, #128
	add	x0, x7, 16
	ld1b	z25.h, p7/z, [x4, x0]
	sub	z25.h, z25.h, #128
	add	x0, x7, 32
	str	z25, [x23]
	ld1b	z25.h, p7/z, [x4, x0]
	addvl	x0, sp, #11
	add	x7, x7, 48
	ld1b	z6.h, p7/z, [x4, x7]
	add	x0, x0, 240
	sub	z6.h, z6.h, #128
	str	z6, [x0]
	add	x0, sp, 240
	ldr	z6, [x0]
	movprfx	z29, z31
	mla	z29.h, p7/m, z6.h, z26.h
	addvl	x0, sp, #4
	mla	z29.h, p7/m, z22.h, z16.h
	movprfx	z6, z31
	mla	z6.h, p7/m, z30.h, z3.h
	mla	z29.h, p7/m, z17.h, z4.h
	mla	z6.h, p7/m, z20.h, z8.h
	mla	z29.h, p7/m, z27.h, z24.h
	mla	z6.h, p7/m, z13.h, z2.h
	add	x0, x0, 240
	mla	z6.h, p7/m, z7.h, z0.h
	add	z29.h, z29.h, z6.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x3, x9]
	ldr	z29, [x0]
	add	x0, sp, 240
	str	z23, [x0]
	addvl	x0, sp, #6
	mla	z5.h, p7/m, z29.h, z16.h
	add	x0, x0, 240
	ldr	z29, [x0]
	mla	z5.h, p7/m, z23.h, z4.h
	addvl	x0, sp, #12
	mad	z29.h, p7/m, z3.h, z31.h
	mla	z5.h, p7/m, z28.h, z24.h
	add	x0, x0, 240
	ldr	z6, [x0]
	mla	z29.h, p7/m, z6.h, z8.h
	addvl	x0, sp, #2
	mla	z29.h, p7/m, z14.h, z2.h
	add	x6, x6, x3, lsl 1
	add	x0, x0, 240
	ldr	z23, [x0]
	mla	z29.h, p7/m, z23.h, z0.h
	addvl	x0, sp, #8
	add	z29.h, z5.h, z29.h
	sqrshrunb	z29.b, z29.h, #6
	add	x0, x0, 240
	ldr	z6, [x0]
	uzp1	z29.b, z29.b, z29.b
	addvl	x0, sp, #5
	mad	z6.h, p7/m, z26.h, z31.h
	mla	z6.h, p7/m, z1.h, z16.h
	add	x0, x0, 240
	ldr	z5, [x0]
	mla	z6.h, p7/m, z18.h, z4.h
	addvl	x0, sp, #13
	mla	z6.h, p7/m, z11.h, z24.h
	mad	z5.h, p7/m, z3.h, z31.h
	add	x0, x0, 240
	ldr	z23, [x0]
	mla	z5.h, p7/m, z23.h, z8.h
	addvl	x0, sp, #7
	mla	z5.h, p7/m, z15.h, z2.h
	mla	z5.h, p7/m, z9.h, z0.h
	add	x0, x0, 240
	add	z6.h, z6.h, z5.h
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	stp	q29, q6, [x5, 16]
	ldr	z29, [x0]
	addvl	x0, sp, #1
	ldr	z23, [x10]
	mad	z29.h, p7/m, z26.h, z31.h
	add	x0, x0, 240
	ldr	z6, [x0]
	mla	z29.h, p7/m, z23.h, z16.h
	addvl	x0, sp, #15
	mla	z29.h, p7/m, z19.h, z4.h
	mad	z6.h, p7/m, z3.h, z31.h
	add	x0, x0, 240
	ldr	z5, [x0]
	mla	z6.h, p7/m, z21.h, z8.h
	addvl	x0, sp, #7
	mla	z29.h, p7/m, z12.h, z24.h
	mla	z6.h, p7/m, z5.h, z2.h
	add	x0, x0, 240
	mla	z6.h, p7/m, z10.h, z0.h
	add	z29.h, z29.h, z6.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	str	q29, [x5, 48]
	ld1b	z29.h, p7/z, [x1, x8]
	movprfx	z5, z29
	sub	z5.h, z5.h, #128
	str	z5, [x0]
	add	x0, x15, 16
	ld1b	z29.h, p7/z, [x4, x0]
	sub	z29.h, z29.h, #128
	addvl	x0, sp, #8
	addvl	x1, sp, #6
	mad	z30.h, p7/m, z26.h, z31.h
	add	x0, x0, 240
	str	z29, [x0]
	mla	z30.h, p7/m, z20.h, z16.h
	add	x0, x15, 32
	ld1b	z29.h, p7/z, [x4, x0]
	sub	z29.h, z29.h, #128
	addvl	x0, sp, #9
	mla	z30.h, p7/m, z13.h, z4.h
	add	x15, x15, 48
	mla	z30.h, p7/m, z7.h, z24.h
	add	x0, x0, 240
	add	x1, x1, 240
	str	z29, [x11]
	movprfx	z29, z31
	mla	z29.h, p7/m, z22.h, z3.h
	ld1b	z5.h, p7/z, [x4, x15]
	ldr	z6, [x0]
	mla	z29.h, p7/m, z17.h, z8.h
	mla	z29.h, p7/m, z27.h, z2.h
	mla	z29.h, p7/m, z6.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x3, x6]
	sub	z25.h, z25.h, #128
	ldr	z30, [x1]
	addvl	x1, sp, #12
	mad	z30.h, p7/m, z26.h, z31.h
	add	x1, x1, 240
	ldr	z6, [x1]
	mla	z30.h, p7/m, z6.h, z16.h
	addvl	x1, sp, #2
	mla	z30.h, p7/m, z14.h, z4.h
	movprfx	z6, z31
	mla	z6.h, p7/m, z1.h, z3.h
	add	x1, x1, 240
	ldr	z29, [x1]
	mla	z30.h, p7/m, z29.h, z24.h
	addvl	x1, sp, #4
	mla	z6.h, p7/m, z18.h, z8.h
	mla	z6.h, p7/m, z11.h, z2.h
	add	x1, x1, 240
	ldr	z29, [x1]
	mad	z29.h, p7/m, z3.h, z31.h
	add	x1, sp, 240
	ldr	z23, [x1]
	mla	z29.h, p7/m, z23.h, z8.h
	addvl	x1, sp, #5
	ldr	z23, [x23]
	mla	z29.h, p7/m, z28.h, z2.h
	add	x1, x1, 240
	mla	z29.h, p7/m, z23.h, z0.h
	add	z30.h, z30.h, z29.h
	ldr	z29, [x1]
	addvl	x1, sp, #13
	sqrshrunb	z30.b, z30.h, #6
	add	x1, x1, 240
	ldr	z23, [x1]
	uzp1	z30.b, z30.b, z30.b
	addvl	x1, sp, #1
	mla	z6.h, p7/m, z25.h, z0.h
	mad	z29.h, p7/m, z26.h, z31.h
	add	x1, x1, 240
	mla	z29.h, p7/m, z23.h, z16.h
	mla	z29.h, p7/m, z15.h, z4.h
	mla	z29.h, p7/m, z9.h, z24.h
	add	z29.h, z29.h, z6.h
	sqrshrunb	z29.b, z29.h, #6
	uzp1	z29.b, z29.b, z29.b
	stp	q30, q29, [x27, 16]
	ldr	z30, [x1]
	addvl	x1, sp, #15
	mad	z22.h, p7/m, z26.h, z31.h
	ldr	z29, [x10]
	add	x1, x1, 240
	ldr	z6, [x1]
	add	x0, x3, x6
	addvl	x1, sp, #11
	mad	z17.h, p7/m, z16.h, z22.h
	mad	z30.h, p7/m, z26.h, z31.h
	add	x1, x1, 240
	ldr	z23, [x1]
	mla	z30.h, p7/m, z21.h, z16.h
	addvl	x1, sp, #9
	mla	z30.h, p7/m, z6.h, z4.h
	mad	z29.h, p7/m, z3.h, z31.h
	add	x1, x1, 240
	mla	z29.h, p7/m, z19.h, z8.h
	mla	z30.h, p7/m, z10.h, z24.h
	mla	z29.h, p7/m, z12.h, z2.h
	mla	z29.h, p7/m, z23.h, z0.h
	add	z30.h, z30.h, z29.h
	sqrshrunb	z30.b, z30.h, #6
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x27, 48]
	ldr	z22, [x1]
	addvl	x1, sp, #7
	mad	z20.h, p7/m, z3.h, z31.h
	add	x1, x1, 240
	mad	z13.h, p7/m, z8.h, z20.h
	mad	z27.h, p7/m, z4.h, z17.h
	mad	z7.h, p7/m, z2.h, z13.h
	mla	z27.h, p7/m, z22.h, z24.h
	ldr	z22, [x1]
	movprfx	z30, z7
	mla	z30.h, p7/m, z22.h, z0.h
	add	z27.h, z27.h, z30.h
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x0]
	addvl	x0, sp, #4
	add	x0, x0, 240
	ldr	z23, [x0]
	mad	z23.h, p7/m, z26.h, z31.h
	add	x0, sp, 240
	ldr	z29, [x0]
	movprfx	z30, z23
	mla	z30.h, p7/m, z29.h, z16.h
	addvl	x0, sp, #12
	mad	z28.h, p7/m, z4.h, z30.h
	ldr	z27, [x23]
	add	x0, x0, 240
	ldr	z30, [x0]
	mad	z30.h, p7/m, z3.h, z31.h
	addvl	x0, sp, #2
	mad	z14.h, p7/m, z8.h, z30.h
	mla	z28.h, p7/m, z27.h, z24.h
	add	x0, x0, 240
	ldr	z29, [x0]
	add	x2, x2, x3, lsl 6
	addvl	x0, sp, #8
	movprfx	z30, z14
	mla	z30.h, p7/m, z29.h, z2.h
	sub	x2, x2, x3
	add	x0, x0, 240
	ldr	z27, [x0]
	mla	z30.h, p7/m, z27.h, z0.h
	addvl	x0, sp, #13
	add	z28.h, z28.h, z30.h
	movprfx	z30, z31
	mla	z30.h, p7/m, z1.h, z26.h
	add	x0, x0, 240
	mad	z18.h, p7/m, z16.h, z30.h
	ldr	z30, [x0]
	mad	z30.h, p7/m, z3.h, z31.h
	mad	z15.h, p7/m, z8.h, z30.h
	mad	z9.h, p7/m, z2.h, z15.h
	ldr	z30, [x11]
	mad	z30.h, p7/m, z0.h, z9.h
	mad	z11.h, p7/m, z4.h, z18.h
	addvl	x0, sp, #11
	mad	z25.h, p7/m, z24.h, z11.h
	mad	z21.h, p7/m, z3.h, z31.h
	add	z25.h, z25.h, z30.h
	sqrshrunb	z28.b, z28.h, #6
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z28.b, z28.b, z28.b
	uzp1	z25.b, z25.b, z25.b
	stp	q28, q25, [x2, 16]
	ldr	z30, [x10]
	mad	z30.h, p7/m, z26.h, z31.h
	mad	z19.h, p7/m, z16.h, z30.h
	movprfx	z16, z21
	mla	z16.h, p7/m, z6.h, z8.h
	mad	z12.h, p7/m, z4.h, z19.h
	mad	z10.h, p7/m, z2.h, z16.h
	add	x0, x0, 240
	ldr	z26, [x0]
	sub	z5.h, z5.h, #128
	mad	z26.h, p7/m, z24.h, z12.h
	mad	z5.h, p7/m, z0.h, z10.h
	add	z26.h, z26.h, z5.h
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x2, 48]
	ldp	d8, d9, [sp, 96]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
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
	addvl	sp, sp, #24
	.cfi_def_cfa_offset 240
	add	sp, sp, 240
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L4:
	.cfi_restore_state
	movi	d0, #0
	mov	z24.h, #1
	mov	z2.h, #-5
	mov	z4.h, #17
	mov	z8.h, #58
	mov	z16.h, #-10
	mov	z3.h, #4
	mov	z26.b, #-1
	b	.L2
	.cfi_endproc
.LFE3:
	.size	dynopt_interp8_64x64_sve2_vpp, .-dynopt_interp8_64x64_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
