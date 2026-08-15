	.file	"best_sve2.cpp"
	.text
	.globl	dynopt_interp8_8x16_sve2        // -- Begin function dynopt_interp8_8x16_sve2
	.p2align	2
	.type	dynopt_interp8_8x16_sve2,@function
dynopt_interp8_8x16_sve2:               // @dynopt_interp8_8x16_sve2
	.cfi_startproc
// %bb.0:
	sub	w8, w4, #1
	mov	w9, #2                          // =0x2
	adrp	x10, _ZL3CB4
	add	x10, x10, :lo12:_ZL3CB4
	cmp	w8, #3
	adrp	x8, _ZL3CB2
	add	x8, x8, :lo12:_ZL3CB2
	csel	w9, w4, w9, lo
	ptrue	p0.b
	cmp	w9, #3
	adrp	x12, _ZL3CB3
	add	x12, x12, :lo12:_ZL3CB3
	csel	x8, x10, x8, eq
	mov	x10, #-3                        // =0xfffffffffffffffd
	adrp	x11, _ZL3CB0
	add	x11, x11, :lo12:_ZL3CB0
	ld1b	{ z3.b }, p0/z, [x0, x10]
	adrp	x10, _ZL3CB5
	add	x10, x10, :lo12:_ZL3CB5
	mov	z4.h, #4096                     // =0x1000
	ptrue	p1.h
	csel	x10, x10, x12, eq
	cmp	w9, #1
	adrp	x9, _ZL4IX0B
	add	x9, x9, :lo12:_ZL4IX0B
	csel	x8, x11, x8, eq
	sub	z3.b, z3.b, #128                // =0x80
	ldr	z0, [x9]
	adrp	x9, _ZL4IX1B
	add	x9, x9, :lo12:_ZL4IX1B
	ldr	z2, [x9]
	ldr	z1, [x8]
	adrp	x8, _ZL3CB1
	add	x8, x8, :lo12:_ZL3CB1
	ptrue	p2.b, vl8
	lsl	x9, x1, #1
	csel	x8, x8, x10, eq
	tbl	z5.b, { z3.b }, z0.b
	lsl	x10, x3, #1
	tbl	z6.b, { z3.b }, z2.b
	ldr	z3, [x8]
	//APP
	movprfx	z7, z4
	sdot	z7.h, z5.b, z1.b
	//NO_APP
	//APP
	sdot	z7.h, z6.b, z3.b
	//NO_APP
	sub	x8, x0, #3
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2]
	ld1b	{ z5.b }, p0/z, [x8, x1]
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x3]
	ld1b	{ z5.b }, p0/z, [x8, x9]
	add	x9, x9, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x10]
	ld1b	{ z5.b }, p0/z, [x8, x9]
	add	x9, x10, x3
	lsl	x10, x1, #2
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	lsl	x9, x3, #2
	ld1b	{ z5.b }, p0/z, [x8, x10]
	add	x10, x10, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	add	x9, x9, x3
	ld1b	{ z5.b }, p0/z, [x8, x10]
	mov	w10, #6                         // =0x6
	mul	x11, x1, x10
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	mul	x9, x3, x10
	lsl	x10, x1, #3
	ld1b	{ z5.b }, p0/z, [x8, x11]
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	sub	x9, x10, x1
	ld1b	{ z5.b }, p0/z, [x8, x9]
	lsl	x9, x3, #3
	sub	x11, x9, x3
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x11]
	ld1b	{ z5.b }, p0/z, [x8, x10]
	add	x10, x10, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	add	x9, x9, x3
	ld1b	{ z5.b }, p0/z, [x8, x10]
	mov	w10, #10                        // =0xa
	mul	x11, x1, x10
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	mul	x9, x3, x10
	mov	w10, #11                        // =0xb
	ld1b	{ z5.b }, p0/z, [x8, x11]
	mul	x11, x1, x10
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	mul	x9, x3, x10
	mov	w10, #12                        // =0xc
	ld1b	{ z5.b }, p0/z, [x8, x11]
	mul	x11, x1, x10
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	mul	x9, x3, x10
	mov	w10, #13                        // =0xd
	ld1b	{ z5.b }, p0/z, [x8, x11]
	mul	x11, x1, x10
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	mul	x9, x3, x10
	mov	w10, #14                        // =0xe
	ld1b	{ z5.b }, p0/z, [x8, x11]
	mul	x11, x1, x10
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	mul	x9, x3, x10
	lsl	x10, x1, #4
	ld1b	{ z5.b }, p0/z, [x8, x11]
	sub	x8, x8, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z4
	sdot	z7.h, z6.b, z1.b
	//NO_APP
	tbl	z5.b, { z5.b }, z2.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	//APP
	addp	z7.h, p1/m, z7.h, z7.h
	//NO_APP
	uzp1	z5.h, z7.h, z7.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x2, x9]
	sub	x9, x2, x3
	ld1b	{ z5.b }, p0/z, [x8, x10]
	lsl	x8, x3, #4
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z0.b, { z5.b }, z0.b
	tbl	z2.b, { z5.b }, z2.b
	//APP
	movprfx	z5, z4
	sdot	z5.h, z0.b, z1.b
	//NO_APP
	//APP
	sdot	z5.h, z2.b, z3.b
	//NO_APP
	//APP
	addp	z5.h, p1/m, z5.h, z5.h
	//NO_APP
	uzp1	z0.h, z5.h, z5.h
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	st1b	{ z0.b }, p2, [x9, x8]
	ret
.Lfunc_end0:
	.size	dynopt_interp8_8x16_sve2, .Lfunc_end0-dynopt_interp8_8x16_sve2
	.cfi_endproc
                                        // -- End function
	.type	_ZL3CB0,@object                 // @_ZL3CB0
	.section	.rodata.cst32,"aM",@progbits,32
_ZL3CB0:
	.ascii	"\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:"
	.size	_ZL3CB0, 32

	.type	_ZL3CB4,@object                 // @_ZL3CB4
_ZL3CB4:
	.ascii	"\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021"
	.size	_ZL3CB4, 32

	.type	_ZL3CB2,@object                 // @_ZL3CB2
_ZL3CB2:
	.ascii	"\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365("
	.size	_ZL3CB2, 32

	.type	_ZL3CB1,@object                 // @_ZL3CB1
_ZL3CB1:
	.asciz	"\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001"
	.size	_ZL3CB1, 32

	.type	_ZL3CB5,@object                 // @_ZL3CB5
_ZL3CB5:
	.ascii	":\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377"
	.size	_ZL3CB5, 32

	.type	_ZL3CB3,@object                 // @_ZL3CB3
_ZL3CB3:
	.ascii	"(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377"
	.size	_ZL3CB3, 32

	.type	_ZL4IX0B,@object                // @_ZL4IX0B
_ZL4IX0B:
	.ascii	"\000\001\002\003\001\002\003\004\002\003\004\005\003\004\005\006\004\005\006\007\005\006\007\b\006\007\b\t\007\b\t\n"
	.size	_ZL4IX0B, 32

	.type	_ZL4IX1B,@object                // @_ZL4IX1B
_ZL4IX1B:
	.ascii	"\004\005\006\007\005\006\007\b\006\007\b\t\007\b\t\n\b\t\n\013\t\n\013\f\n\013\f\r\013\f\r\016"
	.size	_ZL4IX1B, 32

	.ident	"clang version 22.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
