	.file	"best_sve2.cpp"
	.text
	.globl	dynopt_interp8_32x16_sve2       // -- Begin function dynopt_interp8_32x16_sve2
	.p2align	2
	.type	dynopt_interp8_32x16_sve2,@function
dynopt_interp8_32x16_sve2:              // @dynopt_interp8_32x16_sve2
	.cfi_startproc
// %bb.0:
	sub	w8, w4, #1
	adrp	x9, _ZL3CB2
	add	x9, x9, :lo12:_ZL3CB2
	cmp	w8, #3
	mov	w8, #2                          // =0x2
	adrp	x10, _ZL3CB4
	add	x10, x10, :lo12:_ZL3CB4
	csel	w8, w4, w8, lo
	adrp	x11, _ZL3CB3
	add	x11, x11, :lo12:_ZL3CB3
	cmp	w8, #3
	adrp	x12, _ZL3CB5
	add	x12, x12, :lo12:_ZL3CB5
	csel	x9, x10, x9, eq
	mov	z16.h, #4096                    // =0x1000
	csel	x10, x12, x11, eq
	cmp	w8, #1
	adrp	x8, _ZL3CB0
	add	x8, x8, :lo12:_ZL3CB0
	ptrue	p0.b, vl8
	mov	w11, #8                         // =0x8
	csel	x8, x8, x9, eq
	adrp	x9, _ZL3CB1
	add	x9, x9, :lo12:_ZL3CB1
	ldr	z0, [x8]
	adrp	x8, _ZL4IX0B
	add	x8, x8, :lo12:_ZL4IX0B
	ldr	z2, [x8]
	adrp	x8, _ZL4IX1B
	add	x8, x8, :lo12:_ZL4IX1B
	ldr	z3, [x8]
	adrp	x8, _ZL5IX0B8
	add	x8, x8, :lo12:_ZL5IX0B8
	ldr	z4, [x8]
	adrp	x8, _ZL5IX1B8
	add	x8, x8, :lo12:_ZL5IX1B8
	ldr	z5, [x8]
	adrp	x8, _ZL6IX0B16
	add	x8, x8, :lo12:_ZL6IX0B16
	csel	x9, x9, x10, eq
	ldr	z6, [x8]
	adrp	x8, _ZL6IX1B16
	add	x8, x8, :lo12:_ZL6IX1B16
	ldr	z1, [x9]
	ptrue	p1.h
	ldr	z7, [x8]
	ptrue	p2.b
	add	x8, x0, #21
	mov	w9, #16                         // =0x10
	mov	x10, #-24                       // =0xffffffffffffffe8
	mov	w12, #24                        // =0x18
	mov	w13, #16                        // =0x10
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	ld1b	{ z17.b }, p2/z, [x8, x10]
	ldr	z20, [x8]
	subs	x13, x13, #1
	add	x8, x8, x1
	sub	z17.b, z17.b, #128              // =0x80
	sub	z20.b, z20.b, #128              // =0x80
	tbl	z18.b, { z17.b }, z2.b
	//APP
	movprfx	z21, z16
	sdot	z21.h, z18.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z3.b
	//APP
	sdot	z21.h, z19.b, z1.b
	//NO_APP
	tbl	z19.b, { z17.b }, z4.b
	//APP
	addp	z21.h, p1/m, z21.h, z21.h
	//NO_APP
	uzp1	z18.h, z21.h, z21.h
	tbl	z21.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p0, [x2]
	//APP
	movprfx	z18, z16
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z6.b
	//APP
	sdot	z18.h, z21.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z7.b
	//APP
	addp	z18.h, p1/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p0, [x2, x11]
	//APP
	movprfx	z18, z16
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z20.b }, z3.b
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p1/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	tbl	z18.b, { z20.b }, z2.b
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p0, [x2, x9]
	//APP
	movprfx	z17, z16
	sdot	z17.h, z18.b, z0.b
	//NO_APP
	//APP
	sdot	z17.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z17.h, p1/m, z17.h, z17.h
	//NO_APP
	uzp1	z17.h, z17.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p0, [x2, x12]
	add	x2, x2, x3
	b.ne	.LBB0_1
// %bb.2:
	ret
.Lfunc_end0:
	.size	dynopt_interp8_32x16_sve2, .Lfunc_end0-dynopt_interp8_32x16_sve2
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

	.type	_ZL6IX0B16,@object              // @_ZL6IX0B16
_ZL6IX0B16:
	.ascii	"\020\021\022\023\021\022\023\024\022\023\024\025\023\024\025\026\024\025\026\027\025\026\027\030\026\027\030\031\027\030\031\032"
	.size	_ZL6IX0B16, 32

	.type	_ZL6IX1B16,@object              // @_ZL6IX1B16
_ZL6IX1B16:
	.ascii	"\024\025\026\027\025\026\027\030\026\027\030\031\027\030\031\032\030\031\032\033\031\032\033\034\032\033\034\035\033\034\035\036"
	.size	_ZL6IX1B16, 32

	.ident	"clang version 22.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
