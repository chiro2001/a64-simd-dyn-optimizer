	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_hps_32x8_sve2
	.type	dynopt_interp8_hps_32x8_sve2, %function
dynopt_interp8_hps_32x8_sve2:
.LFB3886:
	.cfi_startproc
	sub	w5, w4, #1
	sub	w4, w4, #1
	movi	d25, #0
	cmp	w4, 3
	mov	x7, 16
	lsl	x5, x5, 4
	adrp	x6, .LANCHOR0
	csel	x5, x5, x7, cc
	add	x6, x6, :lo12:.LANCHOR0
	sub	x9, x0, #3
	add	x8, x0, 5
	add	x7, x0, 13
	mov	x4, 0
	ldr	q31, [x6, x5]
	add	x5, x0, 21
	mov	w0, 8
	add	x11, x6, 48
	ldr	z30, [x11]
	add	x10, x6, 96
	ldr	z27, [x10]
	add	x11, x6, 64
	xtn	v31.8b, v31.8h
	ldr	z29, [x11]
	add	x10, x6, 80
	ldr	z28, [x10]
	add	x6, x6, 112
	ldr	z26, [x6]
	tbl	z30.b, {z31.b}, z30.b
	tbl	z27.b, {z31.b}, z27.b
	.p2align 5,,15
.L3:
	ldr	q21, [x9, x4]
	add	z21.b, z21.b, #128
	tbl	z22.b, {z21.b}, z28.b
	tbl	z0.b, {z21.b}, z29.b
	movprfx	z19, z25
	sdot	z19.s, z22.b, z30.b
	movprfx	z20, z25
	sdot	z20.s, z0.b, z30.b
	tbl	z21.b, {z21.b}, z26.b
	sdot	z20.s, z22.b, z27.b
	sdot	z19.s, z21.b, z27.b
	uzp1	v19.8h, v20.8h, v19.8h
	subs	w0, w0, #1
	str	q19, [x2]
	ldr	q16, [x8, x4]
	add	z16.b, z16.b, #128
	tbl	z17.b, {z16.b}, z28.b
	tbl	z18.b, {z16.b}, z29.b
	movprfx	z6, z25
	sdot	z6.s, z17.b, z30.b
	movprfx	z7, z25
	sdot	z7.s, z18.b, z30.b
	tbl	z16.b, {z16.b}, z26.b
	sdot	z7.s, z17.b, z27.b
	sdot	z6.s, z16.b, z27.b
	uzp1	v6.8h, v7.8h, v6.8h
	str	q6, [x2, 16]
	ldr	q3, [x7, x4]
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
	str	q1, [x2, 32]
	ldr	q23, [x5, x4]
	add	z23.b, z23.b, #128
	tbl	z24.b, {z23.b}, z28.b
	tbl	z0.b, {z23.b}, z29.b
	movprfx	z31, z25
	sdot	z31.s, z24.b, z30.b
	movprfx	z22, z25
	sdot	z22.s, z0.b, z30.b
	tbl	z23.b, {z23.b}, z26.b
	sdot	z22.s, z24.b, z27.b
	sdot	z31.s, z23.b, z27.b
	uzp1	v31.8h, v22.8h, v31.8h
	add	x4, x4, x1
	str	q31, [x2, 48]
	add	x2, x2, x3, lsl 1
	bne	.L3
	ret
	.cfi_endproc
.LFE3886:
	.size	dynopt_interp8_hps_32x8_sve2, .-dynopt_interp8_hps_32x8_sve2
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
