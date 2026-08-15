	.arch armv8.2-a+crc+sve
	.file	"best_sve1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_16x16_sve2
	.type	dynopt_interp8_16x16_sve2, %function
dynopt_interp8_16x16_sve2:
.LFB3886:
	.cfi_startproc
	sub	w5, w4, #1
	sub	w7, w4, #1
	mov	z25.s, #8192
	cmp	w7, 3
	mov	x6, 16
	lsl	x5, x5, 4
	adrp	x4, .LANCHOR0
	csel	x5, x5, x6, cc
	add	x4, x4, :lo12:.LANCHOR0
	sub	x8, x0, #3
	add	x7, x2, 8
	add	x0, x0, 5
	ldr	q6, [x4, x5]
	add	x5, x4, 48
	ldr	z30, [x5]
	add	x5, x4, 64
	ldr	z29, [x5]
	add	x5, x4, 80
	ldr	z28, [x5]
	xtn	v6.8b, v6.8h
	add	x5, x4, 96
	ldr	z27, [x5]
	add	x4, x4, 112
	ldr	z26, [x4]
	mov	x5, 0
	mov	x4, 0
	tbl	z30.b, {z6.b}, z30.b
	tbl	z27.b, {z6.b}, z27.b
	.p2align 5,,15
.L3:
	ldr	q3, [x8, x4]
	add	z3.b, z3.b, #128
	tbl	z4.b, {z3.b}, z28.b
	tbl	z5.b, {z3.b}, z29.b
	movprfx	z1, z25
	sdot	z1.s, z4.b, z30.b
	movprfx	z2, z25
	sdot	z2.s, z5.b, z30.b
	tbl	z3.b, {z3.b}, z26.b
	sdot	z2.s, z4.b, z27.b
	sdot	z1.s, z3.b, z27.b
	uzp1	v1.8h, v2.8h, v1.8h
	subs	w6, w6, #1
	sqrshrun	v1.8b, v1.8h, 6
	str	d1, [x2, x5]
	ldr	q22, [x0, x4]
	add	z22.b, z22.b, #128
	tbl	z31.b, {z22.b}, z28.b
	tbl	z0.b, {z22.b}, z29.b
	movprfx	z24, z25
	sdot	z24.s, z31.b, z30.b
	movprfx	z23, z25
	sdot	z23.s, z0.b, z30.b
	tbl	z22.b, {z22.b}, z26.b
	sdot	z23.s, z31.b, z27.b
	sdot	z24.s, z22.b, z27.b
	uzp1	v24.8h, v23.8h, v24.8h
	add	x4, x4, x1
	sqrshrun	v24.8b, v24.8h, 6
	str	d24, [x7, x5]
	add	x5, x5, x3
	bne	.L3
	ret
	.cfi_endproc
.LFE3886:
	.size	dynopt_interp8_16x16_sve2, .-dynopt_interp8_16x16_sve2
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL4CTBL, %object
	.size	_ZL4CTBL, 48
_ZL4CTBL:
	.hword	-1
	.hword	4
	.hword	-10
	.hword	58
	.hword	17
	.hword	-5
	.hword	1
	.hword	0
	.hword	-1
	.hword	4
	.hword	-11
	.hword	40
	.hword	40
	.hword	-11
	.hword	4
	.hword	-1
	.hword	0
	.hword	1
	.hword	-5
	.hword	17
	.hword	58
	.hword	-10
	.hword	4
	.hword	-1
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
	.type	_ZL6IDX_B1, %object
	.size	_ZL6IDX_B1, 16
_ZL6IDX_B1:
	.base64	"BAUGBwQFBgcEBQYHBAUGBw=="
	.type	_ZL4IDX2, %object
	.size	_ZL4IDX2, 16
_ZL4IDX2:
	.base64	"CAkKCwkKCwwKCwwNCwwNDg=="
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
