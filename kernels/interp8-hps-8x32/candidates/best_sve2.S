	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_hps_8x32_sve2
	.type	dynopt_interp8_hps_8x32_sve2, %function
dynopt_interp8_hps_8x32_sve2:
.LFB3886:
	.cfi_startproc
	sub	w5, w4, #1
	sub	w6, w4, #1
	movi	d25, #0
	mov	x4, 16
	cmp	w6, 3
	lsl	x5, x5, 4
	sub	x0, x0, #3
	csel	x5, x5, x4, cc
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	ldr	q1, [x4, x5]
	add	x5, x4, 48
	ldr	z30, [x5]
	add	x5, x4, 64
	ldr	z29, [x5]
	add	x5, x4, 80
	ldr	z28, [x5]
	xtn	v1.8b, v1.8h
	add	x5, x4, 96
	ldr	z27, [x5]
	add	x4, x4, 112
	ldr	z26, [x4]
	mov	w4, 32
	tbl	z30.b, {z1.b}, z30.b
	tbl	z27.b, {z1.b}, z27.b
	.p2align 5,,15
.L3:
	ldr	q24, [x0]
	add	z24.b, z24.b, #128
	tbl	z22.b, {z24.b}, z28.b
	tbl	z0.b, {z24.b}, z29.b
	movprfx	z23, z25
	sdot	z23.s, z22.b, z30.b
	movprfx	z31, z25
	sdot	z31.s, z0.b, z30.b
	tbl	z24.b, {z24.b}, z26.b
	sdot	z31.s, z22.b, z27.b
	sdot	z23.s, z24.b, z27.b
	uzp1	v23.8h, v31.8h, v23.8h
	subs	w4, w4, #1
	add	x0, x0, x1
	str	q23, [x2]
	add	x2, x2, x3, lsl 1
	bne	.L3
	ret
	.cfi_endproc
.LFE3886:
	.size	dynopt_interp8_hps_8x32_sve2, .-dynopt_interp8_hps_8x32_sve2
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
