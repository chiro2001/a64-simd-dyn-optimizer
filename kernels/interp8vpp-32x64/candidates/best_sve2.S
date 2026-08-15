	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_32x64_sve2_vpp
	.type	dynopt_interp8_32x64_sve2_vpp, %function
dynopt_interp8_32x64_sve2_vpp:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -208]!
	.cfi_def_cfa_offset 208
	.cfi_offset 29, -208
	.cfi_offset 30, -200
	sub	w5, w4, #1
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d12, d13, [sp, 96]
	stp	d14, d15, [sp, 112]
	.cfi_offset 19, -192
	.cfi_offset 20, -184
	.cfi_offset 21, -176
	.cfi_offset 22, -168
	.cfi_offset 23, -160
	.cfi_offset 24, -152
	.cfi_offset 25, -144
	.cfi_offset 26, -136
	.cfi_offset 27, -128
	.cfi_offset 28, -120
	.cfi_offset 76, -112
	.cfi_offset 77, -104
	.cfi_offset 78, -96
	.cfi_offset 79, -88
	cmp	w5, 2
	bhi	.L3
	cmp	w4, 1
	beq	.L4
	mov	z31.b, #-1
	mov	z30.h, #4
	cmp	w4, 3
	bne	.L7
	mov	z29.h, #-10
	mov	z28.h, #58
	mov	z27.h, #17
	mov	z26.h, #-5
	mov	z25.h, #1
	movi	d24, #0
	b	.L2
	.p2align 2,,3
.L3:
	mov	z31.b, #-1
	mov	z30.h, #4
.L7:
	mov	z29.h, #-11
	mov	z28.h, #40
	mov	z26.d, z29.d
	mov	z27.d, z28.d
	mov	z25.d, z30.d
	mov	z24.d, z31.d
.L2:
	add	x12, x1, x1, lsl 1
	ptrue	p7.b, all
	lsl	x4, x1, 1
	sub	x5, x0, x12
	ld1b	z17.h, p7/z, [x0]
	add	x4, x4, 16
	add	x6, x5, 16
	ld1b	z22.h, p7/z, [x6]
	add	x0, x0, 16
	add	x6, x5, x1
	ld1b	z19.h, p7/z, [x6, x1]
	ld1b	z18.h, p7/z, [x5, x4]
	lsl	x6, x1, 2
	ld1b	z16.h, p7/z, [x0]
	add	x4, x5, x1, lsl 2
	add	x0, x6, 16
	ld1b	z6.h, p7/z, [x5, x0]
	ld1b	z5.h, p7/z, [x4, x1]
	add	x0, x4, x1
	ld1b	z3.h, p7/z, [x1, x0]
	add	x4, x4, x1, lsl 1
	lsl	x0, x12, 1
	lsl	x25, x1, 3
	ld1b	z7.h, p7/z, [x5, x6]
	add	x0, x0, 16
	ld1b	z2.h, p7/z, [x5, x0]
	add	x6, x6, x1
	add	x0, x1, x4
	sub	x15, x25, x1
	ld1b	z15.h, p7/z, [x1, x0]
	add	x7, x1, 16
	add	x0, x25, 16
	mov	z13.h, #4096
	add	x25, x25, x1
	ld1b	z20.h, p7/z, [x5, x7]
	ld1b	z14.h, p7/z, [x5, x0]
	ld1b	z23.h, p7/z, [x5]
	sub	z3.h, z3.h, #128
	sub	z2.h, z2.h, #128
	sub	z7.h, z7.h, #128
	sub	z6.h, z6.h, #128
	add	x7, x6, 16
	add	x0, x25, 16
	sub	z19.h, z19.h, #128
	sub	z18.h, z18.h, #128
	sub	z23.h, z23.h, #128
	sub	z22.h, z22.h, #128
	mad	z23.h, p7/m, z24.h, z13.h
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z23.h, p7/m, z3.h, z30.h
	mla	z22.h, p7/m, z2.h, z30.h
	ld1b	z1.h, p7/z, [x1, x4]
	ld1b	z21.h, p7/z, [x5, x1]
	ld1b	z4.h, p7/z, [x5, x7]
	sub	z1.h, z1.h, #128
	sub	z5.h, z5.h, #128
	sub	z4.h, z4.h, #128
	sub	z17.h, z17.h, #128
	sub	z16.h, z16.h, #128
	add	x7, x15, 16
	sub	z21.h, z21.h, #128
	ld1b	z0.h, p7/z, [x5, x7]
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	sub	z0.h, z0.h, #128
	mla	z12.h, p7/m, z17.h, z27.h
	sub	z20.h, z20.h, #128
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z12.h, p7/m, z1.h, z31.h
	add	z12.h, z23.h, z12.h
	movprfx	z23, z13
	mla	z23.h, p7/m, z20.h, z25.h
	sqrshrunb	z12.b, z12.h, #6
	mla	z23.h, p7/m, z16.h, z27.h
	uzp1	z12.b, z12.b, z12.b
	mla	z23.h, p7/m, z4.h, z29.h
	mla	z23.h, p7/m, z0.h, z31.h
	add	z23.h, z22.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	stp	q12, q23, [x2]
	ld1b	z22.h, p7/z, [x5, x0]
	add	x0, x2, x3
	sub	z15.h, z15.h, #128
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	add	x4, x4, x1, lsl 1
	lsl	x16, x6, 1
	ld1b	z12.h, p7/z, [x1, x4]
	add	x7, x1, x4
	mad	z21.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z23.h, p7/m, z3.h, z29.h
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z23.h, p7/m, z15.h, z31.h
	mla	z21.h, p7/m, z1.h, z30.h
	add	z23.h, z21.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x2, x3]
	sub	z14.h, z14.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z18.h, z25.h
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z6.h, z27.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z21.h, p7/m, z2.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z21.h, p7/m, z14.h, z31.h
	mla	z20.h, p7/m, z0.h, z30.h
	add	z21.h, z20.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x0, 16]
	ld1b	z23.h, p7/z, [x1, x7]
	add	x7, x16, 16
	ld1b	z20.h, p7/z, [x5, x7]
	add	x7, x2, x3, lsl 1
	sub	z12.h, z12.h, #128
	add	x16, x16, x1
	add	x8, x0, x3
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	add	x9, x16, 16
	mad	z19.h, p7/m, z24.h, z13.h
	mad	z18.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z19.h, p7/m, z15.h, z30.h
	mla	z18.h, p7/m, z14.h, z30.h
	mla	z21.h, p7/m, z5.h, z27.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z21.h, p7/m, z12.h, z31.h
	add	z21.h, z19.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x0, x3]
	sub	z22.h, z22.h, #128
	movprfx	z19, z13
	mla	z19.h, p7/m, z16.h, z25.h
	mla	z19.h, p7/m, z4.h, z27.h
	mla	z19.h, p7/m, z0.h, z29.h
	mla	z19.h, p7/m, z22.h, z31.h
	add	z19.h, z18.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x7, 16]
	ld1b	z18.h, p7/z, [x5, x9]
	add	x9, x3, x3, lsl 1
	sub	z23.h, z23.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	ld1b	z21.h, p7/z, [x1, x4]
	mad	z17.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z19.h, p7/m, z15.h, z29.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z19.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z12.h, z30.h
	add	z19.h, z17.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x8]
	add	x8, x2, x9
	sub	z20.h, z20.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z6.h, z25.h
	add	x0, x0, x3, lsl 1
	add	x7, x1, x4
	mad	z16.h, p7/m, z24.h, z13.h
	lsl	x10, x12, 2
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z17.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z17.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z22.h, z30.h
	mla	z17.h, p7/m, z20.h, z31.h
	add	z17.h, z16.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x8, 16]
	add	x8, x2, x3, lsl 2
	ld1b	z19.h, p7/z, [x1, x7]
	add	x7, x10, 16
	ld1b	z16.h, p7/z, [x5, x7]
	add	x7, x3, x0
	sub	z21.h, z21.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	mad	z7.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z1.h, z27.h
	mla	z7.h, p7/m, z3.h, z26.h
	mla	z17.h, p7/m, z12.h, z29.h
	mla	z7.h, p7/m, z15.h, z28.h
	mla	z17.h, p7/m, z21.h, z31.h
	mla	z7.h, p7/m, z23.h, z30.h
	add	z17.h, z7.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x0]
	sub	z18.h, z18.h, #128
	add	x10, x10, x1
	movprfx	z7, z13
	mla	z7.h, p7/m, z4.h, z25.h
	mad	z6.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z2.h, z26.h
	mla	z7.h, p7/m, z22.h, z29.h
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z7.h, p7/m, z18.h, z31.h
	mla	z6.h, p7/m, z20.h, z30.h
	add	z7.h, z6.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x8, 16]
	sub	z19.h, z19.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z7, z13
	mla	z7.h, p7/m, z3.h, z25.h
	ld1b	z17.h, p7/z, [x1, x4]
	add	x11, x10, 16
	mad	z5.h, p7/m, z24.h, z13.h
	ld1b	z6.h, p7/z, [x5, x11]
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z7.h, p7/m, z15.h, z27.h
	mla	z5.h, p7/m, z12.h, z28.h
	mla	z7.h, p7/m, z23.h, z29.h
	mla	z5.h, p7/m, z21.h, z30.h
	mla	z7.h, p7/m, z19.h, z31.h
	add	z7.h, z5.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x7]
	add	x7, x3, x3, lsl 2
	sub	z16.h, z16.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z2.h, z25.h
	add	x11, x2, x7
	add	x8, x1, x4
	mad	z4.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z5.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z5.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z18.h, z30.h
	add	z5.h, z4.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x11, 16]
	ld1b	z7.h, p7/z, [x1, x8]
	lsl	x8, x15, 1
	add	x0, x0, x3, lsl 1
	sub	z17.h, z17.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z1.h, z25.h
	add	x8, x8, 16
	ld1b	z4.h, p7/z, [x5, x8]
	add	x11, x3, x0
	add	x8, x2, x9, lsl 1
	mad	z3.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z12.h, z27.h
	mla	z3.h, p7/m, z15.h, z26.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z3.h, p7/m, z19.h, z30.h
	add	z5.h, z3.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	sub	z6.h, z6.h, #128
	movprfx	z3, z13
	mla	z3.h, p7/m, z0.h, z25.h
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z22.h, z27.h
	mla	z2.h, p7/m, z14.h, z26.h
	mla	z3.h, p7/m, z18.h, z29.h
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z3.h, p7/m, z6.h, z31.h
	mla	z2.h, p7/m, z16.h, z30.h
	add	z3.h, z2.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x8, 16]
	lsl	x8, x1, 4
	sub	z7.h, z7.h, #128
	sub	x14, x8, x1
	movprfx	z3, z13
	mla	z3.h, p7/m, z15.h, z25.h
	mad	z1.h, p7/m, z24.h, z13.h
	add	x4, x4, x1, lsl 1
	add	x17, x14, 16
	ld1b	z5.h, p7/z, [x1, x4]
	ld1b	z2.h, p7/z, [x5, x17]
	mla	z1.h, p7/m, z12.h, z26.h
	mla	z3.h, p7/m, z23.h, z27.h
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z3.h, p7/m, z19.h, z29.h
	mla	z1.h, p7/m, z17.h, z30.h
	mla	z3.h, p7/m, z7.h, z31.h
	add	z3.h, z1.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x11]
	lsl	x11, x3, 3
	sub	x18, x11, x3
	sub	z4.h, z4.h, #128
	movprfx	z1, z13
	mla	z1.h, p7/m, z14.h, z25.h
	add	x17, x2, x18
	add	x13, x1, x4
	mad	z0.h, p7/m, z24.h, z13.h
	add	x0, x0, x3, lsl 1
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z1.h, p7/m, z20.h, z27.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z1.h, p7/m, z16.h, z29.h
	mla	z0.h, p7/m, z6.h, z30.h
	mla	z1.h, p7/m, z4.h, z31.h
	add	z1.h, z0.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x17, 16]
	ld1b	z3.h, p7/z, [x1, x13]
	add	x13, x8, 16
	ld1b	z0.h, p7/z, [x5, x13]
	sub	z5.h, z5.h, #128
	add	x13, x2, x11
	add	x17, x3, x0
	movprfx	z1, z13
	mla	z1.h, p7/m, z12.h, z25.h
	mad	z15.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z21.h, z27.h
	mla	z15.h, p7/m, z23.h, z26.h
	mla	z1.h, p7/m, z17.h, z29.h
	mla	z15.h, p7/m, z19.h, z28.h
	mla	z1.h, p7/m, z5.h, z31.h
	mla	z15.h, p7/m, z7.h, z30.h
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z2.h, z2.h, #128
	add	x11, x11, x3
	movprfx	z15, z13
	mla	z15.h, p7/m, z22.h, z25.h
	mad	z14.h, p7/m, z24.h, z13.h
	add	x8, x8, x1
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z15.h, p7/m, z18.h, z27.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z15.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z4.h, z30.h
	mla	z15.h, p7/m, z2.h, z31.h
	add	z15.h, z14.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x13, 16]
	sub	z3.h, z3.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z15, z13
	mla	z15.h, p7/m, z23.h, z25.h
	ld1b	z1.h, p7/z, [x1, x4]
	add	x19, x8, 16
	mad	z12.h, p7/m, z24.h, z13.h
	ld1b	z14.h, p7/z, [x5, x19]
	mla	z12.h, p7/m, z21.h, z26.h
	mla	z15.h, p7/m, z19.h, z27.h
	mla	z12.h, p7/m, z17.h, z28.h
	mla	z15.h, p7/m, z7.h, z29.h
	mla	z12.h, p7/m, z5.h, z30.h
	mla	z15.h, p7/m, z3.h, z31.h
	add	z15.h, z12.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x17]
	add	x17, x2, x11
	sub	z0.h, z0.h, #128
	add	x13, x1, x4
	movprfx	z12, z13
	mla	z12.h, p7/m, z20.h, z25.h
	mad	z22.h, p7/m, z24.h, z13.h
	lsl	x24, x25, 1
	add	x0, x0, x3, lsl 1
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z12.h, p7/m, z16.h, z27.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z12.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z2.h, z30.h
	mla	z12.h, p7/m, z0.h, z31.h
	add	z12.h, z22.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x17, 16]
	ld1b	z15.h, p7/z, [x1, x13]
	add	x13, x24, 16
	ld1b	z22.h, p7/z, [x5, x13]
	add	x13, x2, x7, lsl 1
	add	x17, x3, x0
	sub	z1.h, z1.h, #128
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	mad	z23.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z17.h, z27.h
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z12.h, p7/m, z1.h, z31.h
	mla	z23.h, p7/m, z3.h, z30.h
	add	z12.h, z23.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x0]
	sub	z14.h, z14.h, #128
	add	x30, x3, x7, lsl 1
	movprfx	z23, z13
	mla	z23.h, p7/m, z18.h, z25.h
	add	x24, x24, x1
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z6.h, z27.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z23.h, p7/m, z2.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z23.h, p7/m, z14.h, z31.h
	mla	z20.h, p7/m, z0.h, z30.h
	add	z23.h, z20.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x13, 16]
	sub	z15.h, z15.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	ld1b	z12.h, p7/z, [x1, x4]
	add	x19, x24, 16
	mad	z21.h, p7/m, z24.h, z13.h
	ld1b	z20.h, p7/z, [x5, x19]
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z23.h, p7/m, z3.h, z29.h
	mla	z21.h, p7/m, z1.h, z30.h
	mla	z23.h, p7/m, z15.h, z31.h
	add	z23.h, z21.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x17]
	add	x17, x2, x30
	lsl	x27, x6, 2
	sub	z22.h, z22.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z16.h, z25.h
	add	x13, x1, x4
	add	x0, x0, x3, lsl 1
	mad	z18.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z4.h, z27.h
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z21.h, p7/m, z0.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z21.h, p7/m, z22.h, z31.h
	mla	z18.h, p7/m, z14.h, z30.h
	add	z21.h, z18.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x17, 16]
	ld1b	z23.h, p7/z, [x1, x13]
	add	x13, x27, 16
	ld1b	z18.h, p7/z, [x5, x13]
	add	x13, x2, x9, lsl 2
	sub	z12.h, z12.h, #128
	add	x19, x27, x1
	add	x17, x3, x0
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	add	x20, x19, 16
	mad	z19.h, p7/m, z24.h, z13.h
	mad	z16.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z19.h, p7/m, z15.h, z30.h
	mla	z16.h, p7/m, z22.h, z30.h
	mla	z21.h, p7/m, z5.h, z27.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z21.h, p7/m, z12.h, z31.h
	add	z21.h, z19.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x0]
	sub	z20.h, z20.h, #128
	movprfx	z19, z13
	mla	z19.h, p7/m, z6.h, z25.h
	mla	z19.h, p7/m, z2.h, z27.h
	mla	z19.h, p7/m, z14.h, z29.h
	mla	z19.h, p7/m, z20.h, z31.h
	add	z19.h, z16.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x13, 16]
	ld1b	z16.h, p7/z, [x5, x20]
	add	x20, x3, x9, lsl 2
	sub	z23.h, z23.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	ld1b	z21.h, p7/z, [x1, x4]
	mad	z17.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z19.h, p7/m, z15.h, z29.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z19.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z12.h, z30.h
	add	z19.h, z17.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x17]
	add	x17, x2, x20
	sub	z18.h, z18.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z4.h, z25.h
	add	x0, x0, x3, lsl 1
	add	x13, x1, x4
	mad	z6.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z2.h, z26.h
	mla	z17.h, p7/m, z22.h, z29.h
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z17.h, p7/m, z18.h, z31.h
	mla	z6.h, p7/m, z20.h, z30.h
	add	z17.h, z6.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x17, 16]
	add	x17, x2, x18, lsl 1
	ld1b	z19.h, p7/z, [x1, x13]
	lsl	x13, x16, 1
	sub	z21.h, z21.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	lsl	x26, x12, 3
	add	x13, x13, 16
	mad	z7.h, p7/m, z24.h, z13.h
	ld1b	z6.h, p7/z, [x5, x13]
	sub	x22, x26, x1
	add	x13, x3, x0
	mla	z7.h, p7/m, z3.h, z26.h
	mla	z17.h, p7/m, z1.h, z27.h
	mla	z7.h, p7/m, z15.h, z28.h
	mla	z17.h, p7/m, z12.h, z29.h
	mla	z7.h, p7/m, z23.h, z30.h
	mla	z17.h, p7/m, z21.h, z31.h
	add	z17.h, z7.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x0]
	sub	z16.h, z16.h, #128
	movprfx	z7, z13
	mla	z7.h, p7/m, z2.h, z25.h
	mad	z4.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z7.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z7.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z18.h, z30.h
	add	z7.h, z4.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x17, 16]
	add	x17, x22, 16
	ld1b	z4.h, p7/z, [x5, x17]
	lsl	x17, x3, 4
	sub	z19.h, z19.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z7, z13
	mla	z7.h, p7/m, z3.h, z25.h
	ld1b	z17.h, p7/z, [x1, x4]
	mad	z5.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z15.h, z27.h
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z7.h, p7/m, z23.h, z29.h
	mla	z5.h, p7/m, z12.h, z28.h
	mla	z7.h, p7/m, z19.h, z31.h
	mla	z5.h, p7/m, z21.h, z30.h
	add	z7.h, z5.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x13]
	sub	x13, x17, x3
	add	x23, x2, x13
	sub	z6.h, z6.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z0.h, z25.h
	add	x21, x1, x4
	add	x0, x0, x3, lsl 1
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z22.h, z27.h
	mla	z2.h, p7/m, z14.h, z26.h
	mla	z5.h, p7/m, z18.h, z29.h
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z5.h, p7/m, z6.h, z31.h
	mla	z2.h, p7/m, z16.h, z30.h
	add	z5.h, z2.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x23, 16]
	ld1b	z7.h, p7/z, [x1, x21]
	add	x21, x26, 16
	ld1b	z2.h, p7/z, [x5, x21]
	add	x21, x2, x17
	sub	z17.h, z17.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z1.h, z25.h
	mad	z3.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z12.h, z27.h
	mla	z3.h, p7/m, z15.h, z26.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z3.h, p7/m, z19.h, z30.h
	add	z5.h, z3.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	sub	z4.h, z4.h, #128
	add	x23, x3, x0
	movprfx	z3, z13
	mla	z3.h, p7/m, z14.h, z25.h
	mad	z0.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z20.h, z27.h
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z3.h, p7/m, z16.h, z29.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z3.h, p7/m, z4.h, z31.h
	mla	z0.h, p7/m, z6.h, z30.h
	add	z3.h, z0.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x21, 16]
	add	x4, x4, x1, lsl 1
	add	x27, x6, x27
	ld1b	z5.h, p7/z, [x1, x4]
	sub	z7.h, z7.h, #128
	str	x27, [sp, 136]
	add	x17, x17, x3
	movprfx	z3, z13
	mla	z3.h, p7/m, z15.h, z25.h
	mad	z1.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z23.h, z27.h
	mla	z1.h, p7/m, z12.h, z26.h
	mla	z3.h, p7/m, z19.h, z29.h
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z3.h, p7/m, z7.h, z31.h
	mla	z1.h, p7/m, z17.h, z30.h
	add	x27, x27, 16
	add	z3.h, z1.h, z3.h
	ld1b	z0.h, p7/z, [x5, x27]
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x23]
	add	x23, x2, x17
	sub	z2.h, z2.h, #128
	add	x21, x1, x4
	movprfx	z1, z13
	mla	z1.h, p7/m, z22.h, z25.h
	mad	z14.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z18.h, z27.h
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z1.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z1.h, p7/m, z2.h, z31.h
	mla	z14.h, p7/m, z4.h, z30.h
	add	z1.h, z14.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x23, 16]
	ld1b	z3.h, p7/z, [x1, x21]
	lsl	x21, x10, 1
	add	x0, x0, x3, lsl 1
	sub	z5.h, z5.h, #128
	movprfx	z1, z13
	mla	z1.h, p7/m, z12.h, z25.h
	add	x21, x21, 16
	ld1b	z14.h, p7/z, [x5, x21]
	mad	z15.h, p7/m, z24.h, z13.h
	add	x21, x2, x11, lsl 1
	mla	z15.h, p7/m, z23.h, z26.h
	mla	z1.h, p7/m, z21.h, z27.h
	mla	z15.h, p7/m, z19.h, z28.h
	mla	z1.h, p7/m, z17.h, z29.h
	mla	z15.h, p7/m, z7.h, z30.h
	mla	z1.h, p7/m, z5.h, z31.h
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z0.h, z0.h, #128
	add	x23, x3, x0
	movprfx	z15, z13
	mla	z15.h, p7/m, z20.h, z25.h
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z16.h, z27.h
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z15.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z15.h, p7/m, z0.h, z31.h
	mla	z22.h, p7/m, z2.h, z30.h
	add	z15.h, z22.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x21, 16]
	add	x4, x4, x1, lsl 1
	ld1b	z1.h, p7/z, [x1, x4]
	add	x26, x12, x26
	sub	z3.h, z3.h, #128
	movprfx	z15, z13
	mla	z15.h, p7/m, z23.h, z25.h
	str	x26, [sp, 144]
	mad	z12.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z19.h, z27.h
	mla	z12.h, p7/m, z21.h, z26.h
	mla	z15.h, p7/m, z7.h, z29.h
	mla	z12.h, p7/m, z17.h, z28.h
	mla	z15.h, p7/m, z3.h, z31.h
	mla	z12.h, p7/m, z5.h, z30.h
	add	x26, x26, 16
	add	z15.h, z12.h, z15.h
	ld1b	z22.h, p7/z, [x5, x26]
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x23]
	add	x23, x3, x11, lsl 1
	add	x0, x0, x3, lsl 1
	sub	z14.h, z14.h, #128
	movprfx	z12, z13
	mla	z12.h, p7/m, z18.h, z25.h
	str	x23, [sp, 152]
	add	x23, x2, x23
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z6.h, z27.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z12.h, p7/m, z2.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z12.h, p7/m, z14.h, z31.h
	mla	z20.h, p7/m, z0.h, z30.h
	add	z12.h, z20.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x23, 16]
	add	x23, x2, x7, lsl 2
	sub	z1.h, z1.h, #128
	add	x21, x1, x4
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	ld1b	z15.h, p7/z, [x1, x21]
	lsl	x26, x15, 2
	mad	z23.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z17.h, z27.h
	add	x21, x26, 16
	mla	z23.h, p7/m, z19.h, z26.h
	ld1b	z20.h, p7/z, [x5, x21]
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z3.h, z30.h
	mla	z12.h, p7/m, z1.h, z31.h
	add	z12.h, z23.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x0]
	sub	z22.h, z22.h, #128
	add	x21, x3, x0
	movprfx	z23, z13
	mla	z23.h, p7/m, z16.h, z25.h
	mad	z18.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z4.h, z27.h
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z23.h, p7/m, z0.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z23.h, p7/m, z22.h, z31.h
	mla	z18.h, p7/m, z14.h, z30.h
	add	z23.h, z18.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x23, 16]
	add	x4, x4, x1, lsl 1
	ld1b	z12.h, p7/z, [x1, x4]
	add	x28, x26, x1
	sub	z15.h, z15.h, #128
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	str	x28, [sp, 160]
	add	x26, x28, 16
	mad	z21.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z23.h, p7/m, z3.h, z29.h
	ld1b	z18.h, p7/z, [x5, x26]
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z23.h, p7/m, z15.h, z31.h
	mla	z21.h, p7/m, z1.h, z30.h
	add	z23.h, z21.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x21]
	add	x21, x3, x7, lsl 2
	add	x26, x2, x21
	sub	z20.h, z20.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z6.h, z25.h
	add	x0, x0, x3, lsl 1
	add	x23, x1, x4
	mad	z16.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z21.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z21.h, p7/m, z20.h, z31.h
	mla	z16.h, p7/m, z22.h, z30.h
	add	z21.h, z16.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x26, 16]
	add	x26, x2, x30, lsl 1
	ld1b	z23.h, p7/z, [x1, x23]
	lsl	x23, x14, 1
	sub	z12.h, z12.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	mad	z19.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z5.h, z27.h
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z21.h, p7/m, z12.h, z31.h
	mla	z19.h, p7/m, z15.h, z30.h
	add	x23, x23, 16
	add	z21.h, z19.h, z21.h
	ld1b	z16.h, p7/z, [x5, x23]
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x0]
	sub	z18.h, z18.h, #128
	lsl	x28, x1, 5
	add	x23, x3, x0
	movprfx	z19, z13
	mla	z19.h, p7/m, z4.h, z25.h
	mad	z6.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z2.h, z26.h
	mla	z19.h, p7/m, z22.h, z29.h
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z19.h, p7/m, z18.h, z31.h
	mla	z6.h, p7/m, z20.h, z30.h
	add	z19.h, z6.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x26, 16]
	add	x4, x4, x1, lsl 1
	ld1b	z21.h, p7/z, [x1, x4]
	sub	x27, x28, x1
	sub	z23.h, z23.h, #128
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	str	x27, [sp, 168]
	mad	z17.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z19.h, p7/m, z15.h, z29.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z19.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z12.h, z30.h
	add	x27, x27, 16
	add	z19.h, z17.h, z19.h
	ld1b	z6.h, p7/z, [x5, x27]
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x23]
	lsl	x23, x9, 3
	sub	x27, x23, x3
	sub	z16.h, z16.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z2.h, z25.h
	str	x27, [sp, 176]
	add	x27, x2, x27
	mad	z4.h, p7/m, z24.h, z13.h
	add	x26, x1, x4
	add	x0, x0, x3, lsl 1
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z17.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z17.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z18.h, z30.h
	mla	z17.h, p7/m, z16.h, z31.h
	add	z17.h, z4.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x27, 16]
	ld1b	z19.h, p7/z, [x1, x26]
	add	x26, x28, 16
	ld1b	z4.h, p7/z, [x5, x26]
	add	x26, x2, x23
	sub	z21.h, z21.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	mad	z7.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z1.h, z27.h
	mla	z7.h, p7/m, z3.h, z26.h
	mla	z17.h, p7/m, z12.h, z29.h
	mla	z7.h, p7/m, z15.h, z28.h
	mla	z17.h, p7/m, z21.h, z31.h
	mla	z7.h, p7/m, z23.h, z30.h
	add	z17.h, z7.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x0]
	sub	z6.h, z6.h, #128
	movprfx	z7, z13
	mla	z7.h, p7/m, z0.h, z25.h
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z22.h, z27.h
	mla	z2.h, p7/m, z14.h, z26.h
	mla	z7.h, p7/m, z18.h, z29.h
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z7.h, p7/m, z6.h, z31.h
	mla	z2.h, p7/m, z16.h, z30.h
	add	z7.h, z2.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x26, 16]
	add	x4, x4, x1, lsl 1
	ld1b	z17.h, p7/z, [x1, x4]
	sub	z19.h, z19.h, #128
	add	x27, x3, x0
	add	x28, x28, x1
	movprfx	z7, z13
	mla	z7.h, p7/m, z3.h, z25.h
	str	x28, [sp, 184]
	add	x28, x28, 16
	mad	z5.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z15.h, z27.h
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z7.h, p7/m, z23.h, z29.h
	ld1b	z2.h, p7/z, [x5, x28]
	add	x28, x7, x7, lsl 2
	mla	z5.h, p7/m, z12.h, z28.h
	mla	z7.h, p7/m, z19.h, z31.h
	mla	z5.h, p7/m, z21.h, z30.h
	add	z7.h, z5.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x27]
	add	x27, x2, x28
	sub	z4.h, z4.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z14.h, z25.h
	str	x28, [sp, 192]
	add	x26, x1, x4
	mad	z0.h, p7/m, z24.h, z13.h
	lsl	x28, x8, 1
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z5.h, p7/m, z20.h, z27.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z5.h, p7/m, z16.h, z29.h
	mla	z0.h, p7/m, z6.h, z30.h
	mla	z5.h, p7/m, z4.h, z31.h
	add	z5.h, z0.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x27, 16]
	ld1b	z7.h, p7/z, [x1, x26]
	add	x26, x28, 16
	ld1b	z0.h, p7/z, [x5, x26]
	mad	z3.h, p7/m, z24.h, z13.h
	add	x0, x0, x3, lsl 1
	add	x26, x2, x20, lsl 1
	mla	z3.h, p7/m, z15.h, z26.h
	mla	z3.h, p7/m, z23.h, z28.h
	mla	z3.h, p7/m, z19.h, z30.h
	sub	z17.h, z17.h, #128
	sub	z2.h, z2.h, #128
	add	x27, x3, x0
	movprfx	z5, z13
	mla	z5.h, p7/m, z1.h, z25.h
	mad	z14.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z12.h, z27.h
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z14.h, p7/m, z4.h, z30.h
	add	z5.h, z3.h, z5.h
	movprfx	z3, z13
	mla	z3.h, p7/m, z22.h, z25.h
	sqrshrunb	z5.b, z5.h, #6
	mla	z3.h, p7/m, z18.h, z27.h
	uzp1	z5.b, z5.b, z5.b
	mla	z3.h, p7/m, z6.h, z29.h
	mla	z3.h, p7/m, z2.h, z31.h
	add	z3.h, z14.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q5, [x3, x0]
	add	x4, x4, x1, lsl 1
	sub	z7.h, z7.h, #128
	mad	z1.h, p7/m, z24.h, z13.h
	str	q3, [x26, 16]
	add	x28, x28, x1
	ld1b	z5.h, p7/z, [x1, x4]
	add	x23, x9, x23
	movprfx	z3, z13
	mla	z3.h, p7/m, z15.h, z25.h
	mla	z1.h, p7/m, z12.h, z26.h
	str	x28, [sp, 200]
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z3.h, p7/m, z23.h, z27.h
	mla	z1.h, p7/m, z17.h, z30.h
	mla	z3.h, p7/m, z19.h, z29.h
	add	x28, x28, 16
	mla	z3.h, p7/m, z7.h, z31.h
	ld1b	z14.h, p7/z, [x5, x28]
	add	z3.h, z1.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x27]
	add	x27, x2, x23
	sub	z0.h, z0.h, #128
	movprfx	z1, z13
	mla	z1.h, p7/m, z20.h, z25.h
	add	x26, x1, x4
	lsl	x25, x25, 2
	mad	z22.h, p7/m, z24.h, z13.h
	add	x0, x0, x3, lsl 1
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z1.h, p7/m, z16.h, z27.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z1.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z2.h, z30.h
	mla	z1.h, p7/m, z0.h, z31.h
	add	z1.h, z22.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x27, 16]
	ld1b	z3.h, p7/z, [x1, x26]
	add	x26, x25, 16
	ld1b	z22.h, p7/z, [x5, x26]
	sub	z5.h, z5.h, #128
	add	x26, x2, x18, lsl 2
	add	x27, x3, x0
	movprfx	z1, z13
	mla	z1.h, p7/m, z12.h, z25.h
	add	x25, x25, x1
	mad	z15.h, p7/m, z24.h, z13.h
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z23.h, z26.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z15.h, p7/m, z19.h, z28.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z15.h, p7/m, z7.h, z30.h
	mla	z20.h, p7/m, z0.h, z30.h
	mla	z1.h, p7/m, z21.h, z27.h
	add	x25, x25, 16
	mla	z1.h, p7/m, z17.h, z29.h
	mla	z1.h, p7/m, z5.h, z31.h
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z14.h, z14.h, #128
	movprfx	z15, z13
	mla	z15.h, p7/m, z18.h, z25.h
	mla	z15.h, p7/m, z6.h, z27.h
	mla	z15.h, p7/m, z2.h, z29.h
	mla	z15.h, p7/m, z14.h, z31.h
	add	z15.h, z20.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x26, 16]
	ld1b	z20.h, p7/z, [x5, x25]
	add	x25, x3, x18, lsl 2
	sub	z3.h, z3.h, #128
	movprfx	z15, z13
	mla	z15.h, p7/m, z23.h, z25.h
	add	x4, x4, x1, lsl 1
	mad	z12.h, p7/m, z24.h, z13.h
	ld1b	z1.h, p7/z, [x1, x4]
	mla	z12.h, p7/m, z21.h, z26.h
	mla	z15.h, p7/m, z19.h, z27.h
	mla	z12.h, p7/m, z17.h, z28.h
	mla	z15.h, p7/m, z7.h, z29.h
	mla	z12.h, p7/m, z5.h, z30.h
	mla	z15.h, p7/m, z3.h, z31.h
	add	z15.h, z12.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x27]
	add	x27, x2, x25
	sub	z22.h, z22.h, #128
	add	x0, x0, x3, lsl 1
	movprfx	z12, z13
	mla	z12.h, p7/m, z16.h, z25.h
	mad	z18.h, p7/m, z24.h, z13.h
	add	x26, x1, x4
	lsl	x24, x24, 1
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z12.h, p7/m, z4.h, z27.h
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z12.h, p7/m, z0.h, z29.h
	mla	z18.h, p7/m, z14.h, z30.h
	mla	z12.h, p7/m, z22.h, z31.h
	add	x24, x24, 16
	add	z12.h, z18.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x27, 16]
	ld1b	z15.h, p7/z, [x1, x26]
	add	x26, x2, x13, lsl 1
	ld1b	z18.h, p7/z, [x5, x24]
	add	x24, x3, x0
	sub	z1.h, z1.h, #128
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	lsl	x6, x6, 3
	mad	z23.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z17.h, z27.h
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z12.h, p7/m, z1.h, z31.h
	mla	z23.h, p7/m, z3.h, z30.h
	add	z12.h, z23.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x0]
	sub	z20.h, z20.h, #128
	movprfx	z23, z13
	mla	z23.h, p7/m, z6.h, z25.h
	sub	x27, x6, x1
	mad	z16.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z23.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z23.h, p7/m, z20.h, z31.h
	mla	z16.h, p7/m, z22.h, z30.h
	add	z23.h, z16.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x26, 16]
	sub	z15.h, z15.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	ld1b	z12.h, p7/z, [x1, x4]
	mad	z21.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z23.h, p7/m, z3.h, z29.h
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z23.h, p7/m, z15.h, z31.h
	mla	z21.h, p7/m, z1.h, z30.h
	add	x27, x27, 16
	add	z23.h, z21.h, z23.h
	ld1b	z16.h, p7/z, [x5, x27]
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x24]
	lsl	x24, x3, 5
	sub	x27, x24, x3
	sub	z18.h, z18.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z4.h, z25.h
	add	x28, x2, x27
	add	x26, x1, x4
	mad	z6.h, p7/m, z24.h, z13.h
	add	x0, x0, x3, lsl 1
	mla	z6.h, p7/m, z2.h, z26.h
	mla	z21.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z21.h, p7/m, z22.h, z29.h
	mla	z6.h, p7/m, z20.h, z30.h
	mla	z21.h, p7/m, z18.h, z31.h
	add	z21.h, z6.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x28, 16]
	ld1b	z23.h, p7/z, [x1, x26]
	add	x26, x6, 16
	ld1b	z6.h, p7/z, [x5, x26]
	sub	z12.h, z12.h, #128
	add	x26, x2, x24
	add	x28, x3, x0
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	add	x24, x24, x3
	mad	z19.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z5.h, z27.h
	add	x24, x2, x24
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z21.h, p7/m, z12.h, z31.h
	mla	z19.h, p7/m, z15.h, z30.h
	add	x6, x6, x1
	add	z21.h, z19.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x0]
	sub	z16.h, z16.h, #128
	movprfx	z19, z13
	mla	z19.h, p7/m, z2.h, z25.h
	mad	z4.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z19.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z19.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z18.h, z30.h
	lsl	x19, x19, 1
	add	x6, x6, 16
	add	z19.h, z4.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x26, 16]
	sub	z23.h, z23.h, #128
	ld1b	z4.h, p7/z, [x5, x6]
	add	x4, x4, x1, lsl 1
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	ld1b	z21.h, p7/z, [x1, x4]
	add	x6, x19, 16
	mad	z17.h, p7/m, z24.h, z13.h
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z2.h, p7/m, z14.h, z26.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z17.h, p7/m, z12.h, z30.h
	mla	z2.h, p7/m, z16.h, z30.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z19.h, p7/m, z15.h, z29.h
	mla	z19.h, p7/m, z23.h, z31.h
	add	z19.h, z17.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x28]
	sub	z6.h, z6.h, #128
	add	x0, x0, x3, lsl 1
	movprfx	z17, z13
	mla	z17.h, p7/m, z0.h, z25.h
	mla	z17.h, p7/m, z22.h, z27.h
	mla	z17.h, p7/m, z18.h, z29.h
	mla	z17.h, p7/m, z6.h, z31.h
	add	z17.h, z2.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x24, 16]
	ld1b	z2.h, p7/z, [x5, x6]
	add	x6, x2, x17, lsl 1
	mad	z7.h, p7/m, z24.h, z13.h
	add	x24, x3, x0
	add	x17, x3, x17, lsl 1
	mla	z7.h, p7/m, z3.h, z26.h
	add	x17, x2, x17
	mla	z7.h, p7/m, z15.h, z28.h
	add	x19, x19, x1
	mla	z7.h, p7/m, z23.h, z30.h
	sub	z21.h, z21.h, #128
	sub	z4.h, z4.h, #128
	add	x26, x1, x4
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	ld1b	z19.h, p7/z, [x1, x26]
	add	x4, x4, x1, lsl 1
	mad	z0.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z1.h, z27.h
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z17.h, p7/m, z12.h, z29.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z17.h, p7/m, z21.h, z31.h
	mla	z0.h, p7/m, z6.h, z30.h
	add	x19, x19, 16
	add	z17.h, z7.h, z17.h
	movprfx	z7, z13
	mla	z7.h, p7/m, z14.h, z25.h
	sqrshrunb	z17.b, z17.h, #6
	mla	z7.h, p7/m, z20.h, z27.h
	uzp1	z17.b, z17.b, z17.b
	mla	z7.h, p7/m, z16.h, z29.h
	mla	z7.h, p7/m, z4.h, z31.h
	add	z7.h, z0.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q17, [x3, x0]
	sub	z19.h, z19.h, #128
	mad	z5.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z5.h, p7/m, z12.h, z28.h
	str	q7, [x6, 16]
	mla	z5.h, p7/m, z21.h, z30.h
	ld1b	z17.h, p7/z, [x1, x4]
	ld1b	z0.h, p7/z, [x5, x19]
	add	x6, x1, x4
	movprfx	z7, z13
	mla	z7.h, p7/m, z3.h, z25.h
	lsl	x19, x16, 2
	mla	z7.h, p7/m, z15.h, z27.h
	mla	z7.h, p7/m, z23.h, z29.h
	mla	z7.h, p7/m, z19.h, z31.h
	add	z7.h, z5.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x24]
	sub	z2.h, z2.h, #128
	add	x0, x0, x3, lsl 1
	movprfx	z5, z13
	mla	z5.h, p7/m, z22.h, z25.h
	mad	z14.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z18.h, z27.h
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z5.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z5.h, p7/m, z2.h, z31.h
	mla	z14.h, p7/m, z4.h, z30.h
	add	z5.h, z14.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x17, 16]
	ld1b	z7.h, p7/z, [x1, x6]
	add	x6, x19, 16
	ld1b	z14.h, p7/z, [x5, x6]
	add	x6, x2, x11, lsl 2
	sub	z17.h, z17.h, #128
	add	x26, x3, x0
	movprfx	z5, z13
	mla	z5.h, p7/m, z1.h, z25.h
	mad	z3.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z12.h, z27.h
	mla	z3.h, p7/m, z15.h, z26.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z3.h, p7/m, z19.h, z30.h
	add	x11, x3, x11, lsl 2
	add	z5.h, z3.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	sub	z0.h, z0.h, #128
	movprfx	z3, z13
	mla	z3.h, p7/m, z20.h, z25.h
	add	x11, x2, x11
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z16.h, z27.h
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z3.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z3.h, p7/m, z0.h, z31.h
	mla	z22.h, p7/m, z2.h, z30.h
	add	z3.h, z22.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x6, 16]
	lsl	x6, x12, 4
	sub	z7.h, z7.h, #128
	add	x0, x0, x3, lsl 1
	movprfx	z3, z13
	mla	z3.h, p7/m, z15.h, z25.h
	mad	z1.h, p7/m, z24.h, z13.h
	sub	x17, x6, x12
	add	x4, x4, x1, lsl 1
	mla	z1.h, p7/m, z12.h, z26.h
	ld1b	z5.h, p7/z, [x1, x4]
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z3.h, p7/m, z23.h, z27.h
	mla	z1.h, p7/m, z17.h, z30.h
	mla	z3.h, p7/m, z19.h, z29.h
	add	x17, x17, 16
	mla	z3.h, p7/m, z7.h, z31.h
	ld1b	z22.h, p7/z, [x5, x17]
	add	z3.h, z1.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x26]
	sub	z14.h, z14.h, #128
	movprfx	z1, z13
	mla	z1.h, p7/m, z18.h, z25.h
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z6.h, z27.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z1.h, p7/m, z2.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z1.h, p7/m, z14.h, z31.h
	mla	z20.h, p7/m, z0.h, z30.h
	lsl	x22, x22, 1
	add	z1.h, z20.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x11, 16]
	sub	z5.h, z5.h, #128
	add	x24, x1, x4
	movprfx	z1, z13
	mla	z1.h, p7/m, z12.h, z25.h
	ld1b	z3.h, p7/z, [x1, x24]
	mad	z15.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z21.h, z27.h
	mla	z15.h, p7/m, z23.h, z26.h
	mla	z1.h, p7/m, z17.h, z29.h
	mla	z15.h, p7/m, z19.h, z28.h
	mla	z1.h, p7/m, z5.h, z31.h
	mla	z15.h, p7/m, z7.h, z30.h
	add	x22, x22, 16
	add	z1.h, z15.h, z1.h
	ld1b	z20.h, p7/z, [x5, x22]
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	add	x11, x3, x0
	sub	z22.h, z22.h, #128
	movprfx	z15, z13
	mla	z15.h, p7/m, z16.h, z25.h
	lsl	x7, x7, 3
	mad	z18.h, p7/m, z24.h, z13.h
	ldr	x17, [sp, 152]
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z15.h, p7/m, z4.h, z27.h
	sub	x22, x6, x1
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z15.h, p7/m, z0.h, z29.h
	mla	z18.h, p7/m, z14.h, z30.h
	mla	z15.h, p7/m, z22.h, z31.h
	add	z15.h, z18.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	sub	z3.h, z3.h, #128
	add	x17, x2, x17, lsl 1
	add	x4, x4, x1, lsl 1
	mad	z12.h, p7/m, z24.h, z13.h
	add	x22, x22, 16
	mla	z12.h, p7/m, z21.h, z26.h
	mla	z12.h, p7/m, z17.h, z28.h
	mla	z12.h, p7/m, z5.h, z30.h
	sub	z20.h, z20.h, #128
	add	x0, x0, x3, lsl 1
	str	q15, [x17, 16]
	movprfx	z15, z13
	mla	z15.h, p7/m, z23.h, z25.h
	ld1b	z1.h, p7/z, [x1, x4]
	ld1b	z18.h, p7/z, [x5, x22]
	mla	z15.h, p7/m, z19.h, z27.h
	mla	z15.h, p7/m, z7.h, z29.h
	mla	z15.h, p7/m, z3.h, z31.h
	add	z15.h, z12.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x11]
	sub	x11, x7, x3
	add	x11, x2, x11
	movprfx	z12, z13
	mla	z12.h, p7/m, z6.h, z25.h
	mad	z16.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z12.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z12.h, p7/m, z20.h, z31.h
	mla	z16.h, p7/m, z22.h, z30.h
	add	z12.h, z16.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x11, 16]
	add	x11, x6, 16
	ld1b	z16.h, p7/z, [x5, x11]
	add	x11, x2, x7
	sub	z1.h, z1.h, #128
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	add	x22, x3, x0
	add	x7, x7, x3
	mad	z23.h, p7/m, z24.h, z13.h
	add	x17, x1, x4
	add	x7, x2, x7
	ld1b	z15.h, p7/z, [x1, x17]
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z12.h, p7/m, z17.h, z27.h
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z3.h, z30.h
	mla	z12.h, p7/m, z1.h, z31.h
	add	z12.h, z23.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x0]
	sub	z18.h, z18.h, #128
	movprfx	z23, z13
	mla	z23.h, p7/m, z4.h, z25.h
	mad	z6.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z2.h, z26.h
	mla	z23.h, p7/m, z22.h, z29.h
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z23.h, p7/m, z18.h, z31.h
	mla	z6.h, p7/m, z20.h, z30.h
	add	z23.h, z6.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x11, 16]
	add	x11, x6, x1
	sub	z15.h, z15.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	ld1b	z12.h, p7/z, [x1, x4]
	mad	z21.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z23.h, p7/m, z3.h, z29.h
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z23.h, p7/m, z15.h, z31.h
	mla	z21.h, p7/m, z1.h, z30.h
	add	x11, x11, 16
	add	z23.h, z21.h, z23.h
	ld1b	z6.h, p7/z, [x5, x11]
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x22]
	sub	z16.h, z16.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z2.h, z25.h
	mad	z4.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z21.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z21.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z18.h, z30.h
	add	z21.h, z4.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x7, 16]
	add	x0, x0, x3, lsl 1
	sub	z12.h, z12.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	ldr	x7, [sp, 136]
	mad	z19.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z5.h, z27.h
	add	x17, x1, x4
	ld1b	z23.h, p7/z, [x1, x17]
	mla	z19.h, p7/m, z7.h, z26.h
	add	x11, x3, x0
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z15.h, z30.h
	mla	z21.h, p7/m, z12.h, z31.h
	add	z21.h, z19.h, z21.h
	lsl	x7, x7, 1
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	add	x7, x7, 16
	ld1b	z4.h, p7/z, [x5, x7]
	str	q21, [x3, x0]
	add	x7, x2, x21, lsl 1
	sub	z6.h, z6.h, #128
	movprfx	z19, z13
	mla	z19.h, p7/m, z0.h, z25.h
	add	x21, x3, x21, lsl 1
	add	x4, x4, x1, lsl 1
	mad	z2.h, p7/m, z24.h, z13.h
	add	x21, x2, x21
	mla	z2.h, p7/m, z14.h, z26.h
	mla	z19.h, p7/m, z22.h, z27.h
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z19.h, p7/m, z18.h, z29.h
	mla	z2.h, p7/m, z16.h, z30.h
	mla	z19.h, p7/m, z6.h, z31.h
	add	x12, x12, x6
	add	z19.h, z2.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x7, 16]
	sub	z23.h, z23.h, #128
	ld1b	z21.h, p7/z, [x1, x4]
	add	x0, x0, x3, lsl 1
	add	x7, x1, x4
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	mad	z17.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z19.h, p7/m, z15.h, z29.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z19.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z12.h, z30.h
	lsl	x10, x10, 2
	add	x12, x12, 16
	add	z19.h, z17.h, z19.h
	ld1b	z2.h, p7/z, [x5, x12]
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x11]
	sub	z4.h, z4.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z14.h, z25.h
	add	x6, x10, 16
	mad	z0.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z20.h, z27.h
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z17.h, p7/m, z16.h, z29.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z17.h, p7/m, z4.h, z31.h
	mla	z0.h, p7/m, z6.h, z30.h
	add	z17.h, z0.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x21, 16]
	ld1b	z19.h, p7/z, [x1, x7]
	add	x7, x2, x30, lsl 2
	ld1b	z0.h, p7/z, [x5, x6]
	add	x6, x3, x0
	sub	z21.h, z21.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	mad	z7.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z1.h, z27.h
	mla	z7.h, p7/m, z3.h, z26.h
	mla	z17.h, p7/m, z12.h, z29.h
	mla	z7.h, p7/m, z15.h, z28.h
	mla	z17.h, p7/m, z21.h, z31.h
	mla	z7.h, p7/m, z23.h, z30.h
	add	z17.h, z7.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x0]
	sub	z2.h, z2.h, #128
	movprfx	z7, z13
	mla	z7.h, p7/m, z22.h, z25.h
	mad	z14.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z18.h, z27.h
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z7.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z7.h, p7/m, z2.h, z31.h
	mla	z14.h, p7/m, z4.h, z30.h
	add	x10, x10, x1
	add	z7.h, z14.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x7, 16]
	sub	z19.h, z19.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z7, z13
	mla	z7.h, p7/m, z3.h, z25.h
	ld1b	z17.h, p7/z, [x1, x4]
	mad	z5.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z15.h, z27.h
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z7.h, p7/m, z23.h, z29.h
	mla	z5.h, p7/m, z12.h, z28.h
	mla	z7.h, p7/m, z19.h, z31.h
	mla	z5.h, p7/m, z21.h, z30.h
	add	x10, x10, 16
	add	z7.h, z5.h, z7.h
	ld1b	z14.h, p7/z, [x5, x10]
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x6]
	lsl	x6, x9, 4
	sub	z0.h, z0.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z20.h, z25.h
	sub	x10, x6, x9
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z16.h, z27.h
	add	x10, x2, x10
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z5.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z5.h, p7/m, z0.h, z31.h
	mla	z22.h, p7/m, z2.h, z30.h
	add	z5.h, z22.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x10, 16]
	add	x0, x0, x3, lsl 1
	sub	z17.h, z17.h, #128
	add	x7, x1, x4
	ld1b	z7.h, p7/z, [x1, x7]
	movprfx	z5, z13
	mla	z5.h, p7/m, z1.h, z25.h
	ldr	x26, [sp, 144]
	mad	z3.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z12.h, z27.h
	mla	z3.h, p7/m, z15.h, z26.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z3.h, p7/m, z19.h, z30.h
	add	z5.h, z3.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	add	x10, x3, x0
	lsl	x7, x26, 1
	sub	z14.h, z14.h, #128
	movprfx	z3, z13
	mla	z3.h, p7/m, z18.h, z25.h
	add	x7, x7, 16
	ld1b	z22.h, p7/z, [x5, x7]
	str	q5, [x3, x0]
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z6.h, z27.h
	mla	z20.h, p7/m, z16.h, z26.h
	ldr	x7, [sp, 176]
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z3.h, p7/m, z2.h, z29.h
	mla	z20.h, p7/m, z0.h, z30.h
	mla	z3.h, p7/m, z14.h, z31.h
	add	x16, x16, x19
	add	z3.h, z20.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	sub	z7.h, z7.h, #128
	add	x4, x4, x1, lsl 1
	mad	z1.h, p7/m, z24.h, z13.h
	add	x7, x2, x7, lsl 1
	mla	z1.h, p7/m, z12.h, z26.h
	add	x16, x16, 16
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z1.h, p7/m, z17.h, z30.h
	add	x0, x0, x3, lsl 1
	lsl	x15, x15, 3
	sub	z22.h, z22.h, #128
	mad	z18.h, p7/m, z24.h, z13.h
	str	q3, [x7, 16]
	movprfx	z3, z13
	mla	z3.h, p7/m, z15.h, z25.h
	ld1b	z5.h, p7/z, [x1, x4]
	ld1b	z20.h, p7/z, [x5, x16]
	mla	z3.h, p7/m, z23.h, z27.h
	mla	z3.h, p7/m, z19.h, z29.h
	mla	z3.h, p7/m, z7.h, z31.h
	add	z3.h, z1.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x10]
	sub	x10, x6, x3
	add	x10, x2, x10
	movprfx	z1, z13
	mla	z1.h, p7/m, z16.h, z25.h
	mla	z18.h, p7/m, z6.h, z26.h
	add	x7, x1, x4
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z1.h, p7/m, z4.h, z27.h
	mla	z18.h, p7/m, z14.h, z30.h
	mla	z1.h, p7/m, z0.h, z29.h
	mla	z1.h, p7/m, z22.h, z31.h
	add	z1.h, z18.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x10, 16]
	add	x10, x2, x6
	ld1b	z3.h, p7/z, [x1, x7]
	add	x7, x15, 16
	ld1b	z18.h, p7/z, [x5, x7]
	sub	z5.h, z5.h, #128
	add	x7, x3, x0
	movprfx	z1, z13
	mla	z1.h, p7/m, z12.h, z25.h
	mad	z15.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z21.h, z27.h
	mla	z15.h, p7/m, z23.h, z26.h
	mla	z1.h, p7/m, z17.h, z29.h
	mla	z15.h, p7/m, z19.h, z28.h
	mla	z1.h, p7/m, z5.h, z31.h
	mla	z15.h, p7/m, z7.h, z30.h
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z20.h, z20.h, #128
	movprfx	z15, z13
	mla	z15.h, p7/m, z6.h, z25.h
	mad	z16.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z15.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z15.h, p7/m, z20.h, z31.h
	mla	z16.h, p7/m, z22.h, z30.h
	add	x15, x15, x1
	add	z15.h, z16.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x10, 16]
	sub	z3.h, z3.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z15, z13
	mla	z15.h, p7/m, z23.h, z25.h
	ld1b	z1.h, p7/z, [x1, x4]
	mad	z12.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z19.h, z27.h
	mla	z12.h, p7/m, z21.h, z26.h
	mla	z15.h, p7/m, z7.h, z29.h
	mla	z12.h, p7/m, z17.h, z28.h
	mla	z15.h, p7/m, z3.h, z31.h
	mla	z12.h, p7/m, z5.h, z30.h
	add	x15, x15, 16
	add	z15.h, z12.h, z15.h
	ld1b	z16.h, p7/z, [x5, x15]
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x7]
	add	x7, x6, x3
	add	x7, x2, x7
	sub	z18.h, z18.h, #128
	movprfx	z12, z13
	mla	z12.h, p7/m, z4.h, z25.h
	mad	z6.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z2.h, z26.h
	mla	z12.h, p7/m, z22.h, z29.h
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z12.h, p7/m, z18.h, z31.h
	mla	z6.h, p7/m, z20.h, z30.h
	add	z12.h, z6.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x7, 16]
	add	x0, x0, x3, lsl 1
	sub	z1.h, z1.h, #128
	add	x10, x1, x4
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	ldr	x28, [sp, 160]
	ld1b	z15.h, p7/z, [x1, x10]
	mad	z23.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z17.h, z27.h
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z12.h, p7/m, z1.h, z31.h
	mla	z23.h, p7/m, z3.h, z30.h
	add	z12.h, z23.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	lsl	x7, x28, 1
	add	x11, x3, x0
	sub	z16.h, z16.h, #128
	add	x7, x7, 16
	ld1b	z6.h, p7/z, [x5, x7]
	str	q12, [x3, x0]
	add	x9, x9, x6
	movprfx	z23, z13
	mla	z23.h, p7/m, z2.h, z25.h
	mad	z4.h, p7/m, z24.h, z13.h
	ldr	x7, [sp, 192]
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z23.h, p7/m, z14.h, z27.h
	lsl	x14, x14, 2
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z23.h, p7/m, z20.h, z29.h
	add	x9, x2, x9
	mla	z4.h, p7/m, z18.h, z30.h
	mla	z23.h, p7/m, z16.h, z31.h
	add	z23.h, z4.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	add	x7, x2, x7, lsl 1
	sub	z15.h, z15.h, #128
	add	x4, x4, x1, lsl 1
	add	x0, x0, x3, lsl 1
	add	x6, x14, 16
	mad	z21.h, p7/m, z24.h, z13.h
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z2.h, p7/m, z14.h, z26.h
	str	q23, [x7, 16]
	sub	x7, x14, x1
	ld1b	z12.h, p7/z, [x1, x4]
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z21.h, p7/m, z1.h, z30.h
	mla	z2.h, p7/m, z16.h, z30.h
	mla	z23.h, p7/m, z7.h, z27.h
	add	x7, x7, 16
	mla	z23.h, p7/m, z3.h, z29.h
	ld1b	z4.h, p7/z, [x5, x7]
	mla	z23.h, p7/m, z15.h, z31.h
	add	z23.h, z21.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x11]
	sub	z6.h, z6.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z0.h, z25.h
	mla	z21.h, p7/m, z22.h, z27.h
	mla	z21.h, p7/m, z18.h, z29.h
	mla	z21.h, p7/m, z6.h, z31.h
	add	z21.h, z2.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x9, 16]
	ld1b	z2.h, p7/z, [x5, x6]
	add	x6, x2, x20, lsl 2
	sub	z12.h, z12.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	add	x7, x3, x0
	add	x20, x3, x20, lsl 2
	mad	z19.h, p7/m, z24.h, z13.h
	add	x10, x1, x4
	add	x20, x2, x20
	ld1b	z23.h, p7/z, [x1, x10]
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z21.h, p7/m, z5.h, z27.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z15.h, z30.h
	mla	z21.h, p7/m, z12.h, z31.h
	add	z21.h, z19.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x0]
	sub	z4.h, z4.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z19, z13
	mla	z19.h, p7/m, z14.h, z25.h
	mad	z0.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z20.h, z27.h
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z19.h, p7/m, z16.h, z29.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z19.h, p7/m, z4.h, z31.h
	mla	z0.h, p7/m, z6.h, z30.h
	add	x14, x14, x1
	add	z19.h, z0.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x6, 16]
	sub	z23.h, z23.h, #128
	ld1b	z21.h, p7/z, [x1, x4]
	add	x6, x1, x4
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	mad	z17.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z19.h, p7/m, z15.h, z29.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z19.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z12.h, z30.h
	add	x14, x14, 16
	add	z19.h, z17.h, z19.h
	ld1b	z0.h, p7/z, [x5, x14]
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x7]
	sub	z2.h, z2.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z22.h, z25.h
	mad	z14.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z18.h, z27.h
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z17.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z17.h, p7/m, z2.h, z31.h
	mla	z14.h, p7/m, z4.h, z30.h
	add	z17.h, z14.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x20, 16]
	ld1b	z19.h, p7/z, [x1, x6]
	add	x0, x0, x3, lsl 1
	add	x23, x2, x23, lsl 1
	sub	z21.h, z21.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	ldr	x6, [sp, 168]
	mad	z7.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z1.h, z27.h
	add	x10, x3, x0
	mla	z7.h, p7/m, z3.h, z26.h
	mla	z17.h, p7/m, z12.h, z29.h
	add	x30, x30, x30, lsl 2
	mla	z7.h, p7/m, z15.h, z28.h
	mla	z17.h, p7/m, z21.h, z31.h
	mla	z7.h, p7/m, z23.h, z30.h
	add	x30, x2, x30
	add	z17.h, z7.h, z17.h
	lsl	x6, x6, 1
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	add	x6, x6, 16
	ld1b	z14.h, p7/z, [x5, x6]
	str	q17, [x3, x0]
	lsl	x6, x1, 6
	sub	z0.h, z0.h, #128
	movprfx	z7, z13
	mla	z7.h, p7/m, z20.h, z25.h
	sub	x7, x6, x1
	add	x4, x4, x1, lsl 1
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z16.h, z27.h
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z7.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z7.h, p7/m, z0.h, z31.h
	mla	z22.h, p7/m, z2.h, z30.h
	add	x7, x7, 16
	add	z7.h, z22.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x23, 16]
	sub	z19.h, z19.h, #128
	ld1b	z17.h, p7/z, [x1, x4]
	ld1b	z22.h, p7/z, [x5, x7]
	add	x9, x1, x4
	add	x0, x0, x3, lsl 1
	movprfx	z7, z13
	mla	z7.h, p7/m, z3.h, z25.h
	add	x7, x6, 16
	mad	z5.h, p7/m, z24.h, z13.h
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z5.h, p7/m, z12.h, z28.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z5.h, p7/m, z21.h, z30.h
	mla	z20.h, p7/m, z0.h, z30.h
	mla	z7.h, p7/m, z15.h, z27.h
	mla	z7.h, p7/m, z23.h, z29.h
	mla	z7.h, p7/m, z19.h, z31.h
	add	z7.h, z5.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x10]
	sub	z14.h, z14.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z18.h, z25.h
	mla	z5.h, p7/m, z6.h, z27.h
	mla	z5.h, p7/m, z2.h, z29.h
	mla	z5.h, p7/m, z14.h, z31.h
	add	z5.h, z20.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x30, 16]
	ld1b	z7.h, p7/z, [x1, x9]
	ld1b	z20.h, p7/z, [x5, x7]
	add	x9, x3, x0
	add	x7, x2, x18, lsl 3
	add	x18, x3, x18, lsl 3
	mad	z3.h, p7/m, z24.h, z13.h
	add	x18, x2, x18
	mla	z3.h, p7/m, z15.h, z26.h
	mla	z3.h, p7/m, z23.h, z28.h
	mla	z3.h, p7/m, z19.h, z30.h
	sub	z17.h, z17.h, #128
	sub	z22.h, z22.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z1.h, z25.h
	mad	z18.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z12.h, z27.h
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z18.h, p7/m, z14.h, z30.h
	add	x6, x6, x1
	add	z5.h, z3.h, z5.h
	movprfx	z3, z13
	mla	z3.h, p7/m, z16.h, z25.h
	sqrshrunb	z5.b, z5.h, #6
	mla	z3.h, p7/m, z4.h, z27.h
	uzp1	z5.b, z5.b, z5.b
	mla	z3.h, p7/m, z0.h, z29.h
	mla	z3.h, p7/m, z22.h, z31.h
	add	z3.h, z18.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q5, [x3, x0]
	sub	z7.h, z7.h, #128
	add	x4, x4, x1, lsl 1
	mad	z1.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z12.h, z26.h
	add	x6, x6, 16
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z1.h, p7/m, z17.h, z30.h
	str	q3, [x7, 16]
	movprfx	z3, z13
	mla	z3.h, p7/m, z15.h, z25.h
	ld1b	z5.h, p7/z, [x1, x4]
	mla	z3.h, p7/m, z23.h, z27.h
	ld1b	z18.h, p7/z, [x5, x6]
	mla	z3.h, p7/m, z19.h, z29.h
	mla	z3.h, p7/m, z7.h, z31.h
	add	z3.h, z1.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x9]
	sub	z20.h, z20.h, #128
	movprfx	z1, z13
	mla	z1.h, p7/m, z6.h, z25.h
	mad	z16.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z1.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z1.h, p7/m, z20.h, z31.h
	mla	z16.h, p7/m, z22.h, z30.h
	add	z1.h, z16.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x18, 16]
	add	x0, x0, x3, lsl 1
	sub	z5.h, z5.h, #128
	movprfx	z1, z13
	mla	z1.h, p7/m, z12.h, z25.h
	ldr	x28, [sp, 184]
	mad	z15.h, p7/m, z24.h, z13.h
	mad	z6.h, p7/m, z24.h, z13.h
	lsl	x8, x8, 2
	mla	z15.h, p7/m, z23.h, z26.h
	mla	z6.h, p7/m, z2.h, z26.h
	add	x25, x2, x25, lsl 1
	add	x7, x1, x4
	mla	z15.h, p7/m, z19.h, z28.h
	ld1b	z3.h, p7/z, [x1, x7]
	mla	z15.h, p7/m, z7.h, z30.h
	lsl	x13, x13, 2
	lsl	x6, x28, 1
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z1.h, p7/m, z21.h, z27.h
	add	x6, x6, 16
	ld1b	z16.h, p7/z, [x5, x6]
	mla	z6.h, p7/m, z20.h, z30.h
	sub	x6, x8, x1
	mla	z1.h, p7/m, z17.h, z29.h
	mla	z1.h, p7/m, z5.h, z31.h
	add	x6, x6, 16
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z18.h, z18.h, #128
	movprfx	z15, z13
	mla	z15.h, p7/m, z4.h, z25.h
	add	x9, x3, x0
	mla	z15.h, p7/m, z0.h, z27.h
	mla	z15.h, p7/m, z22.h, z29.h
	mla	z15.h, p7/m, z18.h, z31.h
	add	z15.h, z6.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x25, 16]
	ld1b	z6.h, p7/z, [x5, x6]
	sub	x6, x13, x3
	sub	z3.h, z3.h, #128
	add	x6, x2, x6
	add	x4, x4, x1, lsl 1
	movprfx	z15, z13
	mla	z15.h, p7/m, z23.h, z25.h
	ld1b	z1.h, p7/z, [x1, x4]
	mad	z12.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z19.h, z27.h
	mla	z12.h, p7/m, z21.h, z26.h
	mla	z15.h, p7/m, z7.h, z29.h
	mla	z12.h, p7/m, z17.h, z28.h
	mla	z15.h, p7/m, z3.h, z31.h
	mla	z12.h, p7/m, z5.h, z30.h
	add	z15.h, z12.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x9]
	sub	z16.h, z16.h, #128
	add	x0, x0, x3, lsl 1
	movprfx	z12, z13
	mla	z12.h, p7/m, z2.h, z25.h
	mad	z4.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z12.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z12.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z18.h, z30.h
	add	z12.h, z4.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x6, 16]
	add	x6, x8, 16
	add	x7, x1, x4
	ld1b	z4.h, p7/z, [x5, x6]
	ld1b	z15.h, p7/z, [x1, x7]
	add	x6, x2, x13
	add	x7, x3, x0
	sub	z1.h, z1.h, #128
	add	x13, x13, x3
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	mad	z23.h, p7/m, z24.h, z13.h
	add	x13, x2, x13
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z12.h, p7/m, z17.h, z27.h
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z3.h, z30.h
	mla	z12.h, p7/m, z1.h, z31.h
	add	z12.h, z23.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x0]
	sub	z6.h, z6.h, #128
	movprfx	z23, z13
	mla	z23.h, p7/m, z0.h, z25.h
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z22.h, z27.h
	mla	z2.h, p7/m, z14.h, z26.h
	add	x8, x8, x1
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z23.h, p7/m, z18.h, z29.h
	mla	z2.h, p7/m, z16.h, z30.h
	mla	z23.h, p7/m, z6.h, z31.h
	add	z23.h, z2.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x6, 16]
	add	x4, x4, x1, lsl 1
	sub	z15.h, z15.h, #128
	ld1b	z12.h, p7/z, [x1, x4]
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	mad	z21.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z21.h, p7/m, z17.h, z26.h
	add	x8, x8, 16
	mla	z21.h, p7/m, z5.h, z28.h
	ld1b	z2.h, p7/z, [x5, x8]
	mla	z21.h, p7/m, z1.h, z30.h
	mla	z23.h, p7/m, z3.h, z29.h
	mla	z23.h, p7/m, z15.h, z31.h
	add	z23.h, z21.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x7]
	sub	z4.h, z4.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z14.h, z25.h
	mad	z0.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z20.h, z27.h
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z21.h, p7/m, z16.h, z29.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z21.h, p7/m, z4.h, z31.h
	mla	z0.h, p7/m, z6.h, z30.h
	add	z21.h, z0.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x13, 16]
	add	x0, x0, x3, lsl 1
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	add	x6, x1, x4
	ld1b	z23.h, p7/z, [x1, x6]
	sub	z12.h, z12.h, #128
	ldr	x28, [sp, 200]
	mad	z19.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z5.h, z27.h
	add	x27, x2, x27, lsl 1
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z21.h, p7/m, z1.h, z29.h
	add	x2, x2, x3, lsl 6
	mla	z21.h, p7/m, z12.h, z31.h
	mla	z19.h, p7/m, z3.h, z28.h
	sub	x2, x2, x3
	mla	z19.h, p7/m, z15.h, z30.h
	add	z21.h, z19.h, z21.h
	lsl	x1, x28, 1
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	add	x1, x1, 16
	ld1b	z0.h, p7/z, [x5, x1]
	str	q21, [x3, x0]
	add	x1, x3, x0
	movprfx	z21, z13
	mla	z21.h, p7/m, z22.h, z25.h
	sub	z2.h, z2.h, #128
	mad	z14.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z18.h, z27.h
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z21.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z21.h, p7/m, z2.h, z31.h
	mla	z14.h, p7/m, z4.h, z30.h
	add	z21.h, z14.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x27, 16]
	mad	z7.h, p7/m, z25.h, z13.h
	mad	z17.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z3.h, z27.h
	sub	z23.h, z23.h, #128
	mla	z7.h, p7/m, z15.h, z29.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z7.h, p7/m, z23.h, z31.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z17.h, p7/m, z12.h, z30.h
	add	z7.h, z17.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x1]
	mad	z20.h, p7/m, z25.h, z13.h
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z20.h, p7/m, z16.h, z27.h
	sub	z0.h, z0.h, #128
	mla	z20.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z20.h, p7/m, z0.h, z31.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z22.h, p7/m, z2.h, z30.h
	add	z20.h, z22.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x2, 16]
	ldp	d12, d13, [sp, 96]
	ldp	d14, d15, [sp, 112]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
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
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L4:
	.cfi_restore_state
	movi	d31, #0
	mov	z30.h, #1
	mov	z29.h, #-5
	mov	z28.h, #17
	mov	z27.h, #58
	mov	z26.h, #-10
	mov	z25.h, #4
	mov	z24.b, #-1
	b	.L2
	.cfi_endproc
.LFE3:
	.size	dynopt_interp8_32x64_sve2_vpp, .-dynopt_interp8_32x64_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
