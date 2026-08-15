	.arch armv8.2-a+crc+sve
	.file	"best_sve1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp4_16x16_sve2
	.type	dynopt_interp4_16x16_sve2, %function
dynopt_interp4_16x16_sve2:
.LFB3886:
	.cfi_startproc
	adrp	x5, .LANCHOR0
	cmp	w4, 7
	bhi	.L4
	add	x6, x5, :lo12:.LANCHOR0
	add	x4, x6, w4, uxtw 3
.L2:
	ldr	q5, [x4]
	mov	z27.s, #8192
	add	x4, x5, :lo12:.LANCHOR0
	add	x5, x4, 64
	ldr	z30, [x5]
	sub	x8, x0, #1
	add	x5, x4, 80
	add	x0, x0, 7
	ldr	z29, [x5]
	xtn	v5.8b, v5.8h
	add	x4, x4, 96
	ldr	z28, [x4]
	add	x7, x2, 8
	mov	w6, 16
	mov	x5, 0
	mov	x4, 0
	tbl	z30.b, {z5.b}, z30.b
	.p2align 5,,15
.L3:
	ldr	q3, [x8, x4]
	add	z3.b, z3.b, #128
	tbl	z4.b, {z3.b}, z29.b
	tbl	z3.b, {z3.b}, z28.b
	movprfx	z2, z27
	sdot	z2.s, z4.b, z30.b
	movprfx	z1, z27
	sdot	z1.s, z3.b, z30.b
	uzp1	v1.8h, v2.8h, v1.8h
	subs	w6, w6, #1
	sqrshrun	v1.8b, v1.8h, 6
	str	d1, [x2, x5]
	ldr	q26, [x0, x4]
	add	z26.b, z26.b, #128
	tbl	z0.b, {z26.b}, z29.b
	tbl	z26.b, {z26.b}, z28.b
	movprfx	z25, z27
	sdot	z25.s, z0.b, z30.b
	movprfx	z31, z27
	sdot	z31.s, z26.b, z30.b
	uzp1	v31.8h, v25.8h, v31.8h
	add	x4, x4, x1
	sqrshrun	v31.8b, v31.8h, 6
	str	d31, [x7, x5]
	add	x5, x5, x3
	bne	.L3
	ret
	.p2align 2,,3
.L4:
	add	x4, x5, :lo12:.LANCHOR0
	b	.L2
	.cfi_endproc
.LFE3886:
	.size	dynopt_interp4_16x16_sve2, .-dynopt_interp4_16x16_sve2
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL4CTBL, %object
	.size	_ZL4CTBL, 64
_ZL4CTBL:
	.hword	0
	.hword	64
	.hword	0
	.hword	0
	.hword	-2
	.hword	58
	.hword	10
	.hword	-2
	.hword	-4
	.hword	54
	.hword	16
	.hword	-2
	.hword	-6
	.hword	46
	.hword	28
	.hword	-4
	.hword	-4
	.hword	36
	.hword	36
	.hword	-4
	.hword	-4
	.hword	28
	.hword	46
	.hword	-6
	.hword	-2
	.hword	16
	.hword	54
	.hword	-4
	.hword	-2
	.hword	10
	.hword	58
	.hword	-2
	.type	_ZL6IDX_B0, %object
	.size	_ZL6IDX_B0, 16
_ZL6IDX_B0:
	.base64	"AAECAwABAgMAAQIDAAECAw=="
	.type	_ZL4IDX0, %object
	.size	_ZL4IDX0, 16
_ZL4IDX0:
	.base64	"AAECAwECAwQCAwQFAwQFBg=="
	.type	_ZL4IDX1, %object
	.size	_ZL4IDX1, 16
_ZL4IDX1:
	.base64	"BAUGBwUGBwgGBwgJBwgJCg=="
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
