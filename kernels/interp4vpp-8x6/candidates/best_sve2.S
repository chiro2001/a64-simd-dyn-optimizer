	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp4_8x6_sve2_vpp
	.type	dynopt_interp4_8x6_sve2_vpp, %function
dynopt_interp4_8x6_sve2_vpp:
.LFB3:
	.cfi_startproc
	ubfiz	x4, x4, 2, 3
	adrp	x5, .LANCHOR0
	ptrue	p7.b, all
	add	x5, x5, :lo12:.LANCHOR0
	ld1b	z1.h, p7/z, [x0]
	sub	z1.h, z1.h, #128
	add	x6, x5, x4
	ldrsb	w4, [x5, x4]
	mov	z31.h, w4
	lsl	x5, x1, 1
	ldrsb	w4, [x6, 1]
	mov	z30.h, w4
	ldrsb	w4, [x6, 2]
	mov	z29.h, w4
	ldrsb	w4, [x6, 3]
	mov	z28.h, w4
	sub	x4, x0, x1
	ld1b	z0.h, p7/z, [x4, x5]
	ld1b	z2.h, p7/z, [x4]
	add	x0, x4, x1, lsl 1
	add	x5, x2, x3
	ld1b	z24.h, p7/z, [x0, x1]
	add	x4, x0, x1
	sub	z24.h, z24.h, #128
	ld1b	z23.h, p7/z, [x1, x4]
	add	x0, x0, x1, lsl 1
	sub	z0.h, z0.h, #128
	ld1b	z22.h, p7/z, [x1, x0]
	sub	z2.h, z2.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z1.h, z30.h
	mla	z2.h, p7/m, z0.h, z29.h
	mla	z2.h, p7/m, z24.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	d2, [x2]
	add	x4, x1, x0
	sub	z23.h, z23.h, #128
	ld1b	z27.h, p7/z, [x1, x4]
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z0.h, z30.h
	mla	z1.h, p7/m, z24.h, z29.h
	mla	z1.h, p7/m, z23.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	d1, [x2, x3]
	add	x2, x2, x3, lsl 1
	add	x0, x0, x1, lsl 1
	sub	z22.h, z22.h, #128
	ld1b	z26.h, p7/z, [x1, x0]
	add	x4, x1, x0
	mul	z0.h, p7/m, z0.h, z31.h
	add	x0, x3, x2
	mla	z0.h, p7/m, z24.h, z30.h
	mla	z0.h, p7/m, z23.h, z29.h
	mla	z0.h, p7/m, z22.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	d0, [x5, x3]
	sub	z27.h, z27.h, #128
	ld1b	z25.h, p7/z, [x1, x4]
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z23.h, z30.h
	mla	z24.h, p7/m, z22.h, z29.h
	mla	z24.h, p7/m, z27.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	d24, [x3, x2]
	add	x2, x2, x3, lsl 1
	sub	z26.h, z26.h, #128
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z22.h, z30.h
	mla	z23.h, p7/m, z27.h, z29.h
	mla	z23.h, p7/m, z26.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	d23, [x3, x0]
	mul	z22.h, p7/m, z22.h, z31.h
	sub	z25.h, z25.h, #128
	mla	z22.h, p7/m, z27.h, z30.h
	mla	z22.h, p7/m, z26.h, z29.h
	mla	z22.h, p7/m, z25.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	d22, [x3, x2]
	ret
	.cfi_endproc
.LFE3:
	.size	dynopt_interp4_8x6_sve2_vpp, .-dynopt_interp4_8x6_sve2_vpp
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL8CHROMA_C, %object
	.size	_ZL8CHROMA_C, 32
_ZL8CHROMA_C:
	.base64	"AEAAAA=="
	.base64	"/joK/g=="
	.base64	"/DYQ/g=="
	.base64	"+i4c/A=="
	.base64	"/CQk/A=="
	.base64	"/Bwu+g=="
	.base64	"/hA2/A=="
	.base64	"/go6/g=="
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
