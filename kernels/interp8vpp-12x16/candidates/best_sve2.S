	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_12x16_sve2_vpp
	.type	dynopt_interp8_12x16_sve2_vpp, %function
dynopt_interp8_12x16_sve2_vpp:
.LFB3:
	.cfi_startproc
	sub	w5, w4, #1
	cmp	w5, 2
	bhi	.L3
	cmp	w4, 1
	beq	.L4
	mov	z31.b, #-1
	mov	z30.h, #4
	cmp	w4, 3
	bne	.L6
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
.L6:
	mov	z29.h, #-11
	mov	z28.h, #40
	mov	z26.d, z29.d
	mov	z27.d, z28.d
	mov	z25.d, z30.d
	mov	z24.d, z31.d
.L2:
	add	x4, x1, x1, lsl 1
	ptrue	p7.b, all
	ld1b	z20.h, p7/z, [x0]
	sub	x4, x0, x4
	ld1b	z0.h, p7/z, [x4]
	ld1b	z22.h, p7/z, [x4, x1]
	add	x5, x4, x1, lsl 1
	add	x7, x4, x1
	mov	z6.h, #4096
	add	x4, x4, x1, lsl 2
	ld1b	z18.h, p7/z, [x1, x4]
	ld1b	z21.h, p7/z, [x7, x1]
	add	x0, x1, x4
	add	x4, x4, x1, lsl 1
	ld1b	z17.h, p7/z, [x1, x0]
	add	x0, x1, x4
	ld1b	z16.h, p7/z, [x1, x4]
	ld1b	z4.h, p7/z, [x1, x0]
	add	x4, x4, x1, lsl 1
	mov	x0, 12
	sub	z16.h, z16.h, #128
	whilelo	p6.b, xzr, x0
	sub	z4.h, z4.h, #128
	sub	z17.h, z17.h, #128
	sub	z18.h, z18.h, #128
	add	x0, x1, x4
	sub	z20.h, z20.h, #128
	sub	z21.h, z21.h, #128
	movprfx	z5, z6
	mla	z5.h, p7/m, z20.h, z25.h
	movprfx	z3, z6
	mla	z3.h, p7/m, z21.h, z25.h
	mla	z5.h, p7/m, z18.h, z27.h
	lsl	x6, x1, 1
	mla	z5.h, p7/m, z16.h, z29.h
	ld1b	z19.h, p7/z, [x6, x5]
	sub	z22.h, z22.h, #128
	sub	z19.h, z19.h, #128
	movprfx	z1, z6
	mla	z1.h, p7/m, z22.h, z25.h
	sub	z0.h, z0.h, #128
	mla	z1.h, p7/m, z20.h, z27.h
	mad	z0.h, p7/m, z24.h, z6.h
	mla	z1.h, p7/m, z18.h, z29.h
	mla	z0.h, p7/m, z21.h, z26.h
	mla	z1.h, p7/m, z16.h, z31.h
	mla	z0.h, p7/m, z19.h, z28.h
	mad	z21.h, p7/m, z24.h, z6.h
	mla	z0.h, p7/m, z17.h, z30.h
	mla	z21.h, p7/m, z19.h, z26.h
	add	z1.h, z0.h, z1.h
	mla	z21.h, p7/m, z17.h, z28.h
	sqrshrunb	z1.b, z1.h, #6
	mla	z21.h, p7/m, z4.h, z30.h
	uzp1	z1.b, z1.b, z1.b
	st1b	z1.b, p6, [x2]
	ld1b	z23.h, p7/z, [x1, x4]
	sub	z23.h, z23.h, #128
	mla	z5.h, p7/m, z23.h, z31.h
	add	z5.h, z21.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	add	x5, x2, x3
	add	x4, x4, x1, lsl 1
	mla	z3.h, p7/m, z19.h, z27.h
	movprfx	z1, z6
	mla	z1.h, p7/m, z19.h, z25.h
	mla	z3.h, p7/m, z17.h, z29.h
	mad	z22.h, p7/m, z24.h, z6.h
	mla	z3.h, p7/m, z4.h, z31.h
	mla	z22.h, p7/m, z20.h, z26.h
	mad	z19.h, p7/m, z24.h, z6.h
	mla	z22.h, p7/m, z18.h, z28.h
	mla	z19.h, p7/m, z17.h, z26.h
	mla	z22.h, p7/m, z16.h, z30.h
	mla	z19.h, p7/m, z4.h, z28.h
	add	z3.h, z22.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	st1b	z3.b, p6, [x2, x3]
	ld1b	z2.h, p7/z, [x1, x0]
	add	x0, x2, x3, lsl 1
	sub	z2.h, z2.h, #128
	mla	z19.h, p7/m, z2.h, z30.h
	st1b	z5.b, p6, [x5, x3]
	movprfx	z5, z6
	mla	z5.h, p7/m, z18.h, z25.h
	ld1b	z0.h, p7/z, [x1, x4]
	mla	z5.h, p7/m, z16.h, z27.h
	sub	z0.h, z0.h, #128
	mla	z5.h, p7/m, z23.h, z29.h
	mla	z5.h, p7/m, z0.h, z31.h
	add	z5.h, z19.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	add	x5, x1, x4
	add	x2, x3, x0
	mla	z1.h, p7/m, z17.h, z27.h
	add	x4, x4, x1, lsl 1
	mla	z1.h, p7/m, z4.h, z29.h
	mad	z20.h, p7/m, z24.h, z6.h
	mla	z1.h, p7/m, z2.h, z31.h
	mla	z20.h, p7/m, z18.h, z26.h
	mad	z18.h, p7/m, z24.h, z6.h
	mla	z20.h, p7/m, z16.h, z28.h
	mla	z18.h, p7/m, z16.h, z26.h
	mla	z20.h, p7/m, z23.h, z30.h
	mla	z18.h, p7/m, z23.h, z28.h
	add	z1.h, z20.h, z1.h
	mla	z18.h, p7/m, z0.h, z30.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	st1b	z1.b, p6, [x3, x0]
	add	x0, x0, x3, lsl 1
	ld1b	z3.h, p7/z, [x1, x5]
	sub	z3.h, z3.h, #128
	st1b	z5.b, p6, [x3, x2]
	movprfx	z5, z6
	mla	z5.h, p7/m, z17.h, z25.h
	mla	z5.h, p7/m, z4.h, z27.h
	mla	z5.h, p7/m, z2.h, z29.h
	mla	z5.h, p7/m, z3.h, z31.h
	add	z5.h, z18.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	ld1b	z1.h, p7/z, [x1, x4]
	add	x5, x1, x4
	sub	z1.h, z1.h, #128
	add	x2, x3, x0
	add	x4, x4, x1, lsl 1
	mad	z17.h, p7/m, z24.h, z6.h
	mla	z17.h, p7/m, z4.h, z26.h
	mla	z17.h, p7/m, z2.h, z28.h
	mla	z17.h, p7/m, z3.h, z30.h
	st1b	z5.b, p6, [x3, x0]
	add	x0, x0, x3, lsl 1
	movprfx	z5, z6
	mla	z5.h, p7/m, z16.h, z25.h
	mla	z5.h, p7/m, z23.h, z27.h
	mla	z5.h, p7/m, z0.h, z29.h
	mla	z5.h, p7/m, z1.h, z31.h
	add	z5.h, z17.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	ld1b	z18.h, p7/z, [x1, x5]
	mad	z16.h, p7/m, z24.h, z6.h
	sub	z18.h, z18.h, #128
	add	x5, x1, x4
	mla	z16.h, p7/m, z23.h, z26.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z16.h, p7/m, z1.h, z30.h
	st1b	z5.b, p6, [x3, x2]
	add	x2, x3, x0
	ld1b	z17.h, p7/z, [x1, x4]
	movprfx	z5, z6
	mla	z5.h, p7/m, z4.h, z25.h
	add	x4, x4, x1, lsl 1
	mla	z5.h, p7/m, z2.h, z27.h
	mad	z4.h, p7/m, z24.h, z6.h
	mla	z5.h, p7/m, z3.h, z29.h
	mla	z4.h, p7/m, z2.h, z26.h
	mla	z5.h, p7/m, z18.h, z31.h
	mla	z4.h, p7/m, z3.h, z28.h
	add	z5.h, z16.h, z5.h
	mla	z4.h, p7/m, z18.h, z30.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	z5.b, p6, [x3, x0]
	add	x0, x0, x3, lsl 1
	ld1b	z16.h, p7/z, [x1, x5]
	sub	z17.h, z17.h, #128
	sub	z16.h, z16.h, #128
	add	x5, x1, x4
	movprfx	z5, z6
	mla	z5.h, p7/m, z23.h, z25.h
	mad	z23.h, p7/m, z24.h, z6.h
	mla	z5.h, p7/m, z0.h, z27.h
	mla	z23.h, p7/m, z0.h, z26.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z23.h, p7/m, z1.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z23.h, p7/m, z17.h, z30.h
	add	z5.h, z4.h, z5.h
	movprfx	z4, z6
	mla	z4.h, p7/m, z2.h, z25.h
	sqrshrunb	z5.b, z5.h, #6
	mla	z4.h, p7/m, z3.h, z27.h
	uzp1	z5.b, z5.b, z5.b
	mla	z4.h, p7/m, z18.h, z29.h
	mla	z4.h, p7/m, z16.h, z31.h
	add	z4.h, z23.h, z4.h
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	st1b	z5.b, p6, [x3, x2]
	add	x2, x3, x0
	ld1b	z7.h, p7/z, [x1, x4]
	add	x4, x4, x1, lsl 1
	st1b	z4.b, p6, [x3, x0]
	add	x0, x0, x3, lsl 1
	ld1b	z23.h, p7/z, [x1, x5]
	sub	z7.h, z7.h, #128
	sub	z23.h, z23.h, #128
	add	x5, x1, x4
	movprfx	z5, z6
	mla	z5.h, p7/m, z0.h, z25.h
	movprfx	z4, z6
	mla	z4.h, p7/m, z3.h, z25.h
	mla	z5.h, p7/m, z1.h, z27.h
	mla	z4.h, p7/m, z18.h, z27.h
	mla	z5.h, p7/m, z17.h, z29.h
	mla	z4.h, p7/m, z16.h, z29.h
	mad	z2.h, p7/m, z24.h, z6.h
	mla	z5.h, p7/m, z7.h, z31.h
	mla	z2.h, p7/m, z3.h, z26.h
	mad	z0.h, p7/m, z24.h, z6.h
	mla	z2.h, p7/m, z18.h, z28.h
	mla	z0.h, p7/m, z1.h, z26.h
	mla	z2.h, p7/m, z16.h, z30.h
	mla	z0.h, p7/m, z17.h, z28.h
	add	z5.h, z2.h, z5.h
	mla	z0.h, p7/m, z7.h, z30.h
	mla	z4.h, p7/m, z23.h, z31.h
	sqrshrunb	z5.b, z5.h, #6
	add	z4.h, z0.h, z4.h
	uzp1	z5.b, z5.b, z5.b
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	st1b	z5.b, p6, [x3, x2]
	add	x2, x3, x0
	ld1b	z22.h, p7/z, [x1, x4]
	add	x4, x4, x1, lsl 1
	st1b	z4.b, p6, [x3, x0]
	add	x0, x0, x3, lsl 1
	ld1b	z21.h, p7/z, [x1, x5]
	sub	z22.h, z22.h, #128
	sub	z21.h, z21.h, #128
	movprfx	z2, z6
	mla	z2.h, p7/m, z1.h, z25.h
	movprfx	z0, z6
	mla	z0.h, p7/m, z18.h, z25.h
	mla	z2.h, p7/m, z17.h, z27.h
	mla	z0.h, p7/m, z16.h, z27.h
	movprfx	z5, z6
	mla	z5.h, p7/m, z17.h, z25.h
	add	x5, x1, x4
	mad	z3.h, p7/m, z24.h, z6.h
	mla	z2.h, p7/m, z7.h, z29.h
	mla	z3.h, p7/m, z18.h, z26.h
	mla	z2.h, p7/m, z22.h, z31.h
	mla	z3.h, p7/m, z16.h, z28.h
	mad	z1.h, p7/m, z24.h, z6.h
	mla	z3.h, p7/m, z23.h, z30.h
	mla	z1.h, p7/m, z17.h, z26.h
	add	z2.h, z3.h, z2.h
	mla	z1.h, p7/m, z7.h, z28.h
	mla	z0.h, p7/m, z23.h, z29.h
	mla	z1.h, p7/m, z22.h, z30.h
	mla	z0.h, p7/m, z21.h, z31.h
	mad	z18.h, p7/m, z24.h, z6.h
	add	z0.h, z1.h, z0.h
	mla	z18.h, p7/m, z16.h, z26.h
	mla	z5.h, p7/m, z7.h, z27.h
	mla	z18.h, p7/m, z23.h, z28.h
	mla	z5.h, p7/m, z22.h, z29.h
	mla	z18.h, p7/m, z21.h, z30.h
	mad	z17.h, p7/m, z24.h, z6.h
	mad	z16.h, p7/m, z25.h, z6.h
	mla	z17.h, p7/m, z7.h, z26.h
	mla	z16.h, p7/m, z23.h, z27.h
	mla	z17.h, p7/m, z22.h, z28.h
	mla	z16.h, p7/m, z21.h, z29.h
	sqrshrunb	z2.b, z2.h, #6
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z2.b, z2.b, z2.b
	uzp1	z0.b, z0.b, z0.b
	st1b	z2.b, p6, [x3, x2]
	add	x2, x3, x0
	ld1b	z20.h, p7/z, [x1, x4]
	sub	z20.h, z20.h, #128
	mla	z5.h, p7/m, z20.h, z31.h
	mla	z17.h, p7/m, z20.h, z30.h
	add	z5.h, z18.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	z0.b, p6, [x3, x0]
	add	x0, x0, x3, lsl 1
	ld1b	z19.h, p7/z, [x1, x5]
	sub	z19.h, z19.h, #128
	mla	z16.h, p7/m, z19.h, z31.h
	add	z16.h, z17.h, z16.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	z5.b, p6, [x3, x2]
	st1b	z16.b, p6, [x3, x0]
	ret
	.p2align 2,,3
.L4:
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
	.size	dynopt_interp8_12x16_sve2_vpp, .-dynopt_interp8_12x16_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
