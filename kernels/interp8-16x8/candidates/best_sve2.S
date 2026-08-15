	.file	"best_sve2.cpp"
	.text
	.globl	dynopt_interp8_16x8_sve2        // -- Begin function dynopt_interp8_16x8_sve2
	.p2align	2
	.type	dynopt_interp8_16x8_sve2,@function
dynopt_interp8_16x8_sve2:               // @dynopt_interp8_16x8_sve2
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
	ptrue	p1.b
	cmp	w9, #3
	adrp	x12, _ZL3CB3
	add	x12, x12, :lo12:_ZL3CB3
	csel	x8, x10, x8, eq
	mov	x10, #-3                        // =0xfffffffffffffffd
	adrp	x11, _ZL3CB0
	add	x11, x11, :lo12:_ZL3CB0
	ld1b	{ z7.b }, p1/z, [x0, x10]
	adrp	x10, _ZL3CB5
	add	x10, x10, :lo12:_ZL3CB5
	mov	z2.h, #4096                     // =0x1000
	ptrue	p0.h
	csel	x10, x10, x12, eq
	cmp	w9, #1
	adrp	x9, _ZL4IX0B
	add	x9, x9, :lo12:_ZL4IX0B
	csel	x8, x11, x8, eq
	sub	z7.b, z7.b, #128                // =0x80
	ldr	z0, [x8]
	adrp	x8, _ZL3CB1
	add	x8, x8, :lo12:_ZL3CB1
	ldr	z5, [x9]
	adrp	x9, _ZL4IX1B
	add	x9, x9, :lo12:_ZL4IX1B
	csel	x8, x8, x10, eq
	ldr	z6, [x9]
	ptrue	p2.b, vl8
	ldr	z1, [x8]
	adrp	x8, _ZL5IX0B8
	add	x8, x8, :lo12:_ZL5IX0B8
	ldr	z3, [x8]
	adrp	x8, _ZL5IX1B8
	add	x8, x8, :lo12:_ZL5IX1B8
	tbl	z16.b, { z7.b }, z5.b
	ldr	z4, [x8]
	//APP
	movprfx	z18, z2
	sdot	z18.h, z16.b, z0.b
	//NO_APP
	tbl	z17.b, { z7.b }, z6.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	mov	w8, #8                          // =0x8
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z16.h, z18.h, z18.h
	tbl	z17.b, { z7.b }, z3.b
	tbl	z7.b, { z7.b }, z4.b
	sub	x9, x0, #3
	add	x10, x2, x3
	lsl	x11, x1, #1
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	{ z16.b }, p2, [x2]
	//APP
	movprfx	z16, z2
	sdot	z16.h, z17.b, z0.b
	//NO_APP
	//APP
	sdot	z16.h, z7.b, z1.b
	//NO_APP
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z7.h, z16.h, z16.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p2, [x2, x8]
	ld1b	{ z7.b }, p1/z, [x9, x1]
	sub	z7.b, z7.b, #128                // =0x80
	tbl	z16.b, { z7.b }, z5.b
	//APP
	movprfx	z18, z2
	sdot	z18.h, z16.b, z0.b
	//NO_APP
	tbl	z17.b, { z7.b }, z6.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	tbl	z17.b, { z7.b }, z3.b
	tbl	z7.b, { z7.b }, z4.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z16.h, z18.h, z18.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	{ z16.b }, p2, [x2, x3]
	//APP
	movprfx	z16, z2
	sdot	z16.h, z17.b, z0.b
	//NO_APP
	//APP
	sdot	z16.h, z7.b, z1.b
	//NO_APP
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z7.h, z16.h, z16.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p2, [x10, x8]
	lsl	x10, x3, #1
	ld1b	{ z7.b }, p1/z, [x9, x11]
	add	x11, x11, x1
	add	x12, x2, x10
	sub	z7.b, z7.b, #128                // =0x80
	tbl	z16.b, { z7.b }, z5.b
	//APP
	movprfx	z18, z2
	sdot	z18.h, z16.b, z0.b
	//NO_APP
	tbl	z17.b, { z7.b }, z6.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	tbl	z17.b, { z7.b }, z3.b
	tbl	z7.b, { z7.b }, z4.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z16.h, z18.h, z18.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	{ z16.b }, p2, [x2, x10]
	//APP
	movprfx	z16, z2
	sdot	z16.h, z17.b, z0.b
	//NO_APP
	add	x10, x10, x3
	//APP
	sdot	z16.h, z7.b, z1.b
	//NO_APP
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z7.h, z16.h, z16.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p2, [x12, x8]
	ld1b	{ z7.b }, p1/z, [x9, x11]
	lsl	x11, x1, #2
	sub	z7.b, z7.b, #128                // =0x80
	tbl	z16.b, { z7.b }, z5.b
	//APP
	movprfx	z18, z2
	sdot	z18.h, z16.b, z0.b
	//NO_APP
	tbl	z17.b, { z7.b }, z6.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	tbl	z17.b, { z7.b }, z3.b
	tbl	z7.b, { z7.b }, z4.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z16.h, z18.h, z18.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	{ z16.b }, p2, [x2, x10]
	//APP
	movprfx	z16, z2
	sdot	z16.h, z17.b, z0.b
	//NO_APP
	add	x10, x2, x10
	//APP
	sdot	z16.h, z7.b, z1.b
	//NO_APP
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z7.h, z16.h, z16.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p2, [x10, x8]
	lsl	x10, x3, #2
	ld1b	{ z7.b }, p1/z, [x9, x11]
	add	x11, x11, x1
	add	x12, x2, x10
	sub	z7.b, z7.b, #128                // =0x80
	tbl	z16.b, { z7.b }, z5.b
	//APP
	movprfx	z18, z2
	sdot	z18.h, z16.b, z0.b
	//NO_APP
	tbl	z17.b, { z7.b }, z6.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	tbl	z17.b, { z7.b }, z3.b
	tbl	z7.b, { z7.b }, z4.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z16.h, z18.h, z18.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	{ z16.b }, p2, [x2, x10]
	//APP
	movprfx	z16, z2
	sdot	z16.h, z17.b, z0.b
	//NO_APP
	add	x10, x10, x3
	//APP
	sdot	z16.h, z7.b, z1.b
	//NO_APP
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z7.h, z16.h, z16.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p2, [x12, x8]
	ld1b	{ z7.b }, p1/z, [x9, x11]
	mov	w11, #6                         // =0x6
	mul	x12, x1, x11
	sub	z7.b, z7.b, #128                // =0x80
	tbl	z16.b, { z7.b }, z5.b
	//APP
	movprfx	z18, z2
	sdot	z18.h, z16.b, z0.b
	//NO_APP
	tbl	z17.b, { z7.b }, z6.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	tbl	z17.b, { z7.b }, z3.b
	tbl	z7.b, { z7.b }, z4.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z16.h, z18.h, z18.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	{ z16.b }, p2, [x2, x10]
	//APP
	movprfx	z16, z2
	sdot	z16.h, z17.b, z0.b
	//NO_APP
	add	x10, x2, x10
	//APP
	sdot	z16.h, z7.b, z1.b
	//NO_APP
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z7.h, z16.h, z16.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p2, [x10, x8]
	mul	x10, x3, x11
	lsl	x11, x1, #3
	ld1b	{ z7.b }, p1/z, [x9, x12]
	sub	x9, x9, x1
	sub	z7.b, z7.b, #128                // =0x80
	tbl	z16.b, { z7.b }, z5.b
	//APP
	movprfx	z18, z2
	sdot	z18.h, z16.b, z0.b
	//NO_APP
	tbl	z17.b, { z7.b }, z6.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	tbl	z17.b, { z7.b }, z3.b
	tbl	z7.b, { z7.b }, z4.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z16.h, z18.h, z18.h
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	st1b	{ z16.b }, p2, [x2, x10]
	//APP
	movprfx	z16, z2
	sdot	z16.h, z17.b, z0.b
	//NO_APP
	add	x10, x2, x10
	//APP
	sdot	z16.h, z7.b, z1.b
	//NO_APP
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z7.h, z16.h, z16.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p2, [x10, x8]
	sub	x10, x2, x3
	ld1b	{ z7.b }, p1/z, [x9, x11]
	lsl	x9, x3, #3
	sub	z7.b, z7.b, #128                // =0x80
	tbl	z5.b, { z7.b }, z5.b
	//APP
	movprfx	z16, z2
	sdot	z16.h, z5.b, z0.b
	//NO_APP
	tbl	z6.b, { z7.b }, z6.b
	//APP
	sdot	z16.h, z6.b, z1.b
	//NO_APP
	tbl	z3.b, { z7.b }, z3.b
	tbl	z4.b, { z7.b }, z4.b
	//APP
	addp	z16.h, p0/m, z16.h, z16.h
	//NO_APP
	uzp1	z5.h, z16.h, z16.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p2, [x10, x9]
	//APP
	movprfx	z5, z2
	sdot	z5.h, z3.b, z0.b
	//NO_APP
	add	x9, x10, x9
	//APP
	sdot	z5.h, z4.b, z1.b
	//NO_APP
	//APP
	addp	z5.h, p0/m, z5.h, z5.h
	//NO_APP
	uzp1	z0.h, z5.h, z5.h
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	st1b	{ z0.b }, p2, [x9, x8]
	ret
.Lfunc_end0:
	.size	dynopt_interp8_16x8_sve2, .Lfunc_end0-dynopt_interp8_16x8_sve2
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

	.type	_ZL5IX0B8,@object               // @_ZL5IX0B8
_ZL5IX0B8:
	.ascii	"\b\t\n\013\t\n\013\f\n\013\f\r\013\f\r\016\f\r\016\017\r\016\017\020\016\017\020\021\017\020\021\022"
	.size	_ZL5IX0B8, 32

	.type	_ZL5IX1B8,@object               // @_ZL5IX1B8
_ZL5IX1B8:
	.ascii	"\f\r\016\017\r\016\017\020\016\017\020\021\017\020\021\022\020\021\022\023\021\022\023\024\022\023\024\025\023\024\025\026"
	.size	_ZL5IX1B8, 32

	.ident	"clang version 22.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
