	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_16x8_sve2_vpp
	.type	dynopt_interp8_16x8_sve2_vpp, %function
dynopt_interp8_16x8_sve2_vpp:
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
	ld1b	z0.h, p7/z, [x0]
	sub	x4, x0, x4
	ld1b	z4.h, p7/z, [x4]
	ld1b	z22.h, p7/z, [x4, x1]
	add	x5, x4, x1, lsl 1
	add	x7, x4, x1
	mov	z6.h, #4096
	add	x4, x4, x1, lsl 2
	ld1b	z1.h, p7/z, [x1, x4]
	ld1b	z2.h, p7/z, [x7, x1]
	add	x0, x1, x4
	add	x4, x4, x1, lsl 1
	ld1b	z17.h, p7/z, [x1, x0]
	add	x0, x1, x4
	ld1b	z16.h, p7/z, [x1, x4]
	ld1b	z7.h, p7/z, [x1, x0]
	sub	z16.h, z16.h, #128
	sub	z17.h, z17.h, #128
	sub	z1.h, z1.h, #128
	add	x0, x2, x3
	sub	z0.h, z0.h, #128
	sub	z2.h, z2.h, #128
	lsl	x6, x1, 1
	sub	z22.h, z22.h, #128
	ld1b	z3.h, p7/z, [x6, x5]
	movprfx	z5, z6
	mla	z5.h, p7/m, z22.h, z25.h
	sub	z3.h, z3.h, #128
	mla	z5.h, p7/m, z0.h, z27.h
	sub	z4.h, z4.h, #128
	mla	z5.h, p7/m, z1.h, z29.h
	mad	z4.h, p7/m, z24.h, z6.h
	mla	z5.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z2.h, z26.h
	mla	z4.h, p7/m, z3.h, z28.h
	mla	z4.h, p7/m, z17.h, z30.h
	add	z5.h, z4.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x2]
	sub	z7.h, z7.h, #128
	add	x4, x4, x1, lsl 1
	movprfx	z4, z6
	mla	z4.h, p7/m, z2.h, z25.h
	ld1b	z23.h, p7/z, [x1, x4]
	mad	z22.h, p7/m, z24.h, z6.h
	mla	z4.h, p7/m, z3.h, z27.h
	mla	z22.h, p7/m, z0.h, z26.h
	mla	z4.h, p7/m, z17.h, z29.h
	mla	z22.h, p7/m, z1.h, z28.h
	mla	z4.h, p7/m, z7.h, z31.h
	mla	z22.h, p7/m, z16.h, z30.h
	add	z4.h, z22.h, z4.h
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x2, x3]
	add	x2, x2, x3, lsl 1
	sub	z23.h, z23.h, #128
	add	x5, x1, x4
	movprfx	z5, z6
	mla	z5.h, p7/m, z0.h, z25.h
	ld1b	z22.h, p7/z, [x1, x5]
	mad	z2.h, p7/m, z24.h, z6.h
	mla	z5.h, p7/m, z1.h, z27.h
	mla	z2.h, p7/m, z3.h, z26.h
	mla	z5.h, p7/m, z16.h, z29.h
	mla	z2.h, p7/m, z17.h, z28.h
	mla	z5.h, p7/m, z23.h, z31.h
	mla	z2.h, p7/m, z7.h, z30.h
	add	z5.h, z2.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x0, x3]
	add	x0, x3, x2
	sub	z22.h, z22.h, #128
	movprfx	z4, z6
	mla	z4.h, p7/m, z3.h, z25.h
	add	x4, x4, x1, lsl 1
	mad	z0.h, p7/m, z24.h, z6.h
	ld1b	z21.h, p7/z, [x1, x4]
	mla	z0.h, p7/m, z1.h, z26.h
	mla	z4.h, p7/m, z17.h, z27.h
	mla	z0.h, p7/m, z16.h, z28.h
	mla	z4.h, p7/m, z7.h, z29.h
	mla	z0.h, p7/m, z23.h, z30.h
	mla	z4.h, p7/m, z22.h, z31.h
	add	z4.h, z0.h, z4.h
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x3, x2]
	add	x2, x2, x3, lsl 1
	sub	z21.h, z21.h, #128
	add	x5, x1, x4
	movprfx	z2, z6
	mla	z2.h, p7/m, z1.h, z25.h
	ld1b	z20.h, p7/z, [x1, x5]
	mad	z3.h, p7/m, z24.h, z6.h
	mla	z2.h, p7/m, z16.h, z27.h
	mla	z3.h, p7/m, z17.h, z26.h
	mla	z2.h, p7/m, z23.h, z29.h
	mla	z3.h, p7/m, z7.h, z28.h
	mla	z2.h, p7/m, z21.h, z31.h
	mla	z3.h, p7/m, z22.h, z30.h
	add	z2.h, z3.h, z2.h
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x3, x0]
	add	x0, x3, x2
	sub	z20.h, z20.h, #128
	movprfx	z0, z6
	mla	z0.h, p7/m, z17.h, z25.h
	add	x4, x4, x1, lsl 1
	mad	z1.h, p7/m, z24.h, z6.h
	ld1b	z19.h, p7/z, [x1, x4]
	mla	z1.h, p7/m, z16.h, z26.h
	mla	z0.h, p7/m, z7.h, z27.h
	mla	z1.h, p7/m, z23.h, z28.h
	mla	z0.h, p7/m, z22.h, z29.h
	mla	z1.h, p7/m, z21.h, z30.h
	mla	z0.h, p7/m, z20.h, z31.h
	add	z0.h, z1.h, z0.h
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x3, x2]
	add	x2, x2, x3, lsl 1
	movprfx	z5, z6
	mla	z5.h, p7/m, z16.h, z25.h
	sub	z19.h, z19.h, #128
	mad	z17.h, p7/m, z24.h, z6.h
	add	x5, x1, x4
	mla	z17.h, p7/m, z7.h, z26.h
	ld1b	z18.h, p7/z, [x1, x5]
	mla	z17.h, p7/m, z22.h, z28.h
	mla	z5.h, p7/m, z23.h, z27.h
	mla	z17.h, p7/m, z20.h, z30.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z5.h, p7/m, z19.h, z31.h
	add	z5.h, z17.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	mad	z16.h, p7/m, z24.h, z6.h
	sub	z18.h, z18.h, #128
	mla	z16.h, p7/m, z23.h, z26.h
	mla	z6.h, p7/m, z7.h, z25.h
	mla	z16.h, p7/m, z21.h, z28.h
	mla	z6.h, p7/m, z22.h, z27.h
	mla	z16.h, p7/m, z19.h, z30.h
	mla	z6.h, p7/m, z20.h, z29.h
	mla	z6.h, p7/m, z18.h, z31.h
	add	z6.h, z16.h, z6.h
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x3, x2]
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
	.size	dynopt_interp8_16x8_sve2_vpp, .-dynopt_interp8_16x8_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
