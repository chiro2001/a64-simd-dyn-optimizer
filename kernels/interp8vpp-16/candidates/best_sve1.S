	.arch armv8.2-a+crc+sve
	.file	"best_sve1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_16x16_sve2_vpp
	.type	dynopt_interp8_16x16_sve2_vpp, %function
dynopt_interp8_16x16_sve2_vpp:
.LFB3886:
	.cfi_startproc
	sub	w6, w4, #1
	sub	x8, x1, x1, lsl 2
	ptrue	p7.b, all
	cmp	w6, 3
	adrp	x6, .LANCHOR0
	add	x6, x6, :lo12:.LANCHOR0
	stp	d14, d15, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 78, -16
	.cfi_offset 79, -8
	add	x7, x6, 48
	ld1h	z31.h, p7/z, [x7]
	add	x7, x0, x8
	sub	w5, w4, #1
	ldr	q30, [x0, x8]
	uunpklo	z30.h, z30.b
	add	x8, x7, x1
	ldr	q27, [x0]
	uunpklo	z27.h, z27.b
	add	x0, x7, x1, lsl 2
	ldr	q28, [x8, x1]
	uunpklo	z28.h, z28.b
	lsl	x8, x1, 2
	ldr	q29, [x7, x1]
	uunpklo	z29.h, z29.b
	lsl	x5, x5, 4
	ldr	q26, [x8, x7]
	uunpklo	z26.h, z26.b
	add	x7, x0, x1
	ldr	q25, [x0, x1]
	uunpklo	z25.h, z25.b
	add	x0, x0, x1, lsl 1
	ldr	q24, [x7, x1]
	uunpklo	z24.h, z24.b
	add	x7, x0, x1
	ldr	q23, [x0, x1]
	uunpklo	z23.h, z23.b
	add	x0, x0, x1, lsl 1
	ldr	q22, [x7, x1]
	uunpklo	z22.h, z22.b
	add	x7, x0, x1
	ldr	q21, [x0, x1]
	uunpklo	z21.h, z21.b
	add	x0, x0, x1, lsl 1
	ldr	q20, [x7, x1]
	uunpklo	z20.h, z20.b
	add	x7, x0, x1
	ldr	q19, [x0, x1]
	uunpklo	z19.h, z19.b
	add	x0, x0, x1, lsl 1
	ldr	q18, [x7, x1]
	uunpklo	z18.h, z18.b
	add	x7, x0, x1
	ldr	q17, [x0, x1]
	uunpklo	z17.h, z17.b
	add	x0, x0, x1, lsl 1
	ldr	q16, [x7, x1]
	uunpklo	z16.h, z16.b
	add	x7, x0, x1
	ldr	q7, [x0, x1]
	uunpklo	z7.h, z7.b
	add	x0, x0, x1, lsl 1
	ldr	q6, [x7, x1]
	uunpklo	z6.h, z6.b
	add	x7, x0, x1
	ldr	q5, [x0, x1]
	uunpklo	z5.h, z5.b
	add	x0, x0, x1, lsl 1
	ldr	q4, [x7, x1]
	uunpklo	z4.h, z4.b
	add	x7, x0, x1
	ldr	q3, [x0, x1]
	uunpklo	z3.h, z3.b
	add	x0, x0, x1, lsl 1
	mov	x4, 16
	csel	x5, x5, x4, cc
	ldr	q2, [x7, x1]
	uunpklo	z2.h, z2.b
	add	x7, x0, x1
	ldr	q1, [x0, x1]
	uunpklo	z1.h, z1.b
	add	x4, x6, x5
	ldrsh	w0, [x6, x5]
	ldr	q0, [x7, x1]
	uunpklo	z0.h, z0.b
	cmp	w0, 0
	ble	.L3
	mov	z15.h, w0
	mul	z15.h, p7/m, z15.h, z30.h
.L4:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L5
.L278:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z29.h, z14.h
.L6:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L7
.L279:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z28.h, z14.h
.L8:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L9
.L280:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z27.h, z14.h
.L10:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L11
.L281:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z26.h, z14.h
.L12:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L13
.L282:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z25.h, z14.h
.L14:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L15
.L283:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z24.h, z14.h
.L16:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L17
.L284:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z23.h, z14.h
.L18:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x2]
	cmp	w0, 0
	ble	.L19
.L285:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z29.h
.L20:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L21
.L286:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z28.h, z14.h
.L22:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L23
.L287:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z27.h, z14.h
.L24:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L25
.L288:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z26.h, z14.h
.L26:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L27
.L289:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z25.h, z14.h
.L28:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L29
.L290:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z24.h, z14.h
.L30:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L31
.L291:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z23.h, z14.h
.L32:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L33
.L292:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z22.h, z14.h
.L34:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x6, x2, x3
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x2, x3]
	cmp	w0, 0
	ble	.L35
.L293:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z28.h
.L36:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L37
.L294:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z27.h, z14.h
.L38:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L39
.L295:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z26.h, z14.h
.L40:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L41
.L296:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z25.h, z14.h
.L42:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L43
.L297:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z24.h, z14.h
.L44:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L45
.L298:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z23.h, z14.h
.L46:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L47
.L299:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z22.h, z14.h
.L48:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L49
.L300:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z21.h, z14.h
.L50:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x6, x3
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x6, x3]
	cmp	w0, 0
	ble	.L51
.L301:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z27.h
.L52:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L53
.L302:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z26.h, z14.h
.L54:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L55
.L303:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z25.h, z14.h
.L56:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L57
.L304:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z24.h, z14.h
.L58:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L59
.L305:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z23.h, z14.h
.L60:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L61
.L306:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z22.h, z14.h
.L62:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L63
.L307:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z21.h, z14.h
.L64:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L65
.L308:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z20.h, z14.h
.L66:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	ble	.L67
.L309:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z26.h
.L68:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L69
.L310:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z25.h, z14.h
.L70:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L71
.L311:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z24.h, z14.h
.L72:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L73
.L312:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z23.h, z14.h
.L74:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L75
.L313:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z22.h, z14.h
.L76:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L77
.L314:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z21.h, z14.h
.L78:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L79
.L315:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z20.h, z14.h
.L80:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L81
.L316:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z19.h, z14.h
.L82:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	ble	.L83
.L317:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z25.h
.L84:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L85
.L318:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z24.h, z14.h
.L86:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L87
.L319:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z23.h, z14.h
.L88:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L89
.L320:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z22.h, z14.h
.L90:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L91
.L321:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z21.h, z14.h
.L92:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L93
.L322:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z20.h, z14.h
.L94:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L95
.L323:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z19.h, z14.h
.L96:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L97
.L324:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z18.h, z14.h
.L98:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	ble	.L99
.L325:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z24.h
.L100:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L101
.L326:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z23.h, z14.h
.L102:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L103
.L327:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z22.h, z14.h
.L104:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L105
.L328:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z21.h, z14.h
.L106:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L107
.L329:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z20.h, z14.h
.L108:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L109
.L330:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z19.h, z14.h
.L110:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L111
.L331:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z18.h, z14.h
.L112:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L113
.L332:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z17.h, z14.h
.L114:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	ble	.L115
.L333:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z23.h
.L116:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L117
.L334:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z22.h, z14.h
.L118:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L119
.L335:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z21.h, z14.h
.L120:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L121
.L336:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z20.h, z14.h
.L122:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L123
.L337:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z19.h, z14.h
.L124:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L125
.L338:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z18.h, z14.h
.L126:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L127
.L339:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z17.h, z14.h
.L128:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L129
.L340:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z16.h, z14.h
.L130:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	ble	.L131
.L341:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z22.h
.L132:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L133
.L342:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z21.h, z14.h
.L134:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L135
.L343:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z20.h, z14.h
.L136:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L137
.L344:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z19.h, z14.h
.L138:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L139
.L345:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z18.h, z14.h
.L140:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L141
.L346:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z17.h, z14.h
.L142:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L143
.L347:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z16.h, z14.h
.L144:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L145
.L348:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z7.h, z14.h
.L146:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	ble	.L147
.L349:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z21.h
.L148:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L149
.L350:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z20.h, z14.h
.L150:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L151
.L351:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z19.h, z14.h
.L152:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L153
.L352:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z18.h, z14.h
.L154:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L155
.L353:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z17.h, z14.h
.L156:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L157
.L354:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z16.h, z14.h
.L158:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L159
.L355:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z7.h, z14.h
.L160:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L161
.L356:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z6.h, z14.h
.L162:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	ble	.L163
.L357:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z20.h
.L164:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L165
.L358:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z19.h, z14.h
.L166:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L167
.L359:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z18.h, z14.h
.L168:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L169
.L360:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z17.h, z14.h
.L170:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L171
.L361:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z16.h, z14.h
.L172:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L173
.L362:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z7.h, z14.h
.L174:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L175
.L363:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z6.h, z14.h
.L176:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L177
.L364:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z5.h, z14.h
.L178:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	ble	.L179
.L365:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z19.h
.L180:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L181
.L366:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z18.h, z14.h
.L182:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L183
.L367:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z17.h, z14.h
.L184:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L185
.L368:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z16.h, z14.h
.L186:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L187
.L369:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z7.h, z14.h
.L188:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L189
.L370:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z6.h, z14.h
.L190:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L191
.L371:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z5.h, z14.h
.L192:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L193
.L372:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z4.h, z14.h
.L194:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	ble	.L195
.L373:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z18.h
.L196:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L197
.L374:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z17.h, z14.h
.L198:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L199
.L375:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z16.h, z14.h
.L200:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L201
.L376:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z7.h, z14.h
.L202:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L203
.L377:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z6.h, z14.h
.L204:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L205
.L378:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z5.h, z14.h
.L206:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L207
.L379:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z4.h, z14.h
.L208:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L209
.L380:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z3.h, z14.h
.L210:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	ble	.L211
.L381:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z17.h
.L212:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L213
.L382:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z16.h, z14.h
.L214:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L215
.L383:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z7.h, z14.h
.L216:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L217
.L384:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z6.h, z14.h
.L218:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L219
.L385:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z5.h, z14.h
.L220:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L221
.L386:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z4.h, z14.h
.L222:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L223
.L387:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z3.h, z14.h
.L224:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L225
.L388:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z2.h, z14.h
.L226:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	ble	.L227
.L389:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z16.h
.L228:
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	ble	.L229
.L390:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z7.h, z14.h
.L230:
	ldrsh	w1, [x4, 4]
	cmp	w1, 0
	ble	.L231
.L391:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z6.h, z14.h
.L232:
	ldrsh	w1, [x4, 6]
	cmp	w1, 0
	ble	.L233
.L392:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z5.h, z14.h
.L234:
	ldrsh	w1, [x4, 8]
	cmp	w1, 0
	ble	.L235
.L393:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z4.h, z14.h
.L236:
	ldrsh	w1, [x4, 10]
	cmp	w1, 0
	ble	.L237
.L394:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z3.h, z14.h
.L238:
	ldrsh	w1, [x4, 12]
	cmp	w1, 0
	ble	.L239
.L395:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z2.h, z14.h
.L240:
	ldrsh	w1, [x4, 14]
	cmp	w1, 0
	ble	.L241
.L396:
	mov	z14.h, w1
	ptrue	p7.b, all
	mla	z15.h, p7/m, z1.h, z14.h
.L242:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x1, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	ble	.L243
.L397:
	mov	z15.h, w0
	ptrue	p7.b, all
	mul	z15.h, p7/m, z15.h, z7.h
.L244:
	ldrsh	w0, [x4, 2]
	cmp	w0, 0
	ble	.L245
.L398:
	mov	z14.h, w0
	ptrue	p7.b, all
	mla	z15.h, p7/m, z6.h, z14.h
.L246:
	ldrsh	w0, [x4, 4]
	cmp	w0, 0
	ble	.L247
.L399:
	mov	z14.h, w0
	ptrue	p7.b, all
	mla	z15.h, p7/m, z5.h, z14.h
.L248:
	ldrsh	w0, [x4, 6]
	cmp	w0, 0
	ble	.L249
.L400:
	mov	z14.h, w0
	ptrue	p7.b, all
	mla	z15.h, p7/m, z4.h, z14.h
.L250:
	ldrsh	w0, [x4, 8]
	cmp	w0, 0
	ble	.L251
.L401:
	mov	z14.h, w0
	ptrue	p7.b, all
	mla	z15.h, p7/m, z3.h, z14.h
.L252:
	ldrsh	w0, [x4, 10]
	cmp	w0, 0
	ble	.L253
.L402:
	mov	z14.h, w0
	ptrue	p7.b, all
	mla	z15.h, p7/m, z2.h, z14.h
.L254:
	ldrsh	w0, [x4, 12]
	cmp	w0, 0
	ble	.L255
.L403:
	mov	z14.h, w0
	ptrue	p7.b, all
	mla	z15.h, p7/m, z1.h, z14.h
.L256:
	ldrsh	w0, [x4, 14]
	cmp	w0, 0
	ble	.L257
.L404:
	mov	z14.h, w0
	ptrue	p7.b, all
	mla	z15.h, p7/m, z0.h, z14.h
.L258:
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x1]
	ldp	d14, d15, [sp], 16
	.cfi_remember_state
	.cfi_restore 79
	.cfi_restore 78
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3:
	.cfi_restore_state
	movi	d15, #0
	beq	.L4
	neg	w1, w0
	mov	z14.h, w1
	mls	z15.h, p7/m, z30.h, z14.h
	ldrsh	w1, [x4, 2]
	cmp	w1, 0
	bgt	.L278
.L5:
	beq	.L6
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z29.h, z14.h
	cmp	w1, 0
	bgt	.L279
.L7:
	beq	.L8
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z28.h, z14.h
	cmp	w1, 0
	bgt	.L280
.L9:
	beq	.L10
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z27.h, z14.h
	cmp	w1, 0
	bgt	.L281
.L11:
	beq	.L12
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z26.h, z14.h
	cmp	w1, 0
	bgt	.L282
.L13:
	beq	.L14
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z25.h, z14.h
	cmp	w1, 0
	bgt	.L283
.L15:
	beq	.L16
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z24.h, z14.h
	cmp	w1, 0
	bgt	.L284
.L17:
	beq	.L18
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z23.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x2]
	cmp	w0, 0
	bgt	.L285
.L19:
	movi	d15, #0
	beq	.L20
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z29.h, z14.h
	cmp	w1, 0
	bgt	.L286
.L21:
	beq	.L22
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z28.h, z14.h
	cmp	w1, 0
	bgt	.L287
.L23:
	beq	.L24
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z27.h, z14.h
	cmp	w1, 0
	bgt	.L288
.L25:
	beq	.L26
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z26.h, z14.h
	cmp	w1, 0
	bgt	.L289
.L27:
	beq	.L28
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z25.h, z14.h
	cmp	w1, 0
	bgt	.L290
.L29:
	beq	.L30
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z24.h, z14.h
	cmp	w1, 0
	bgt	.L291
.L31:
	beq	.L32
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z23.h, z14.h
	cmp	w1, 0
	bgt	.L292
.L33:
	beq	.L34
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z22.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x6, x2, x3
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x2, x3]
	cmp	w0, 0
	bgt	.L293
.L35:
	movi	d15, #0
	beq	.L36
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z28.h, z14.h
	cmp	w1, 0
	bgt	.L294
.L37:
	beq	.L38
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z27.h, z14.h
	cmp	w1, 0
	bgt	.L295
.L39:
	beq	.L40
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z26.h, z14.h
	cmp	w1, 0
	bgt	.L296
.L41:
	beq	.L42
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z25.h, z14.h
	cmp	w1, 0
	bgt	.L297
.L43:
	beq	.L44
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z24.h, z14.h
	cmp	w1, 0
	bgt	.L298
.L45:
	beq	.L46
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z23.h, z14.h
	cmp	w1, 0
	bgt	.L299
.L47:
	beq	.L48
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z22.h, z14.h
	cmp	w1, 0
	bgt	.L300
.L49:
	beq	.L50
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z21.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x6, x3
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x6, x3]
	cmp	w0, 0
	bgt	.L301
.L51:
	movi	d15, #0
	beq	.L52
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z27.h, z14.h
	cmp	w1, 0
	bgt	.L302
.L53:
	beq	.L54
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z26.h, z14.h
	cmp	w1, 0
	bgt	.L303
.L55:
	beq	.L56
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z25.h, z14.h
	cmp	w1, 0
	bgt	.L304
.L57:
	beq	.L58
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z24.h, z14.h
	cmp	w1, 0
	bgt	.L305
.L59:
	beq	.L60
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z23.h, z14.h
	cmp	w1, 0
	bgt	.L306
.L61:
	beq	.L62
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z22.h, z14.h
	cmp	w1, 0
	bgt	.L307
.L63:
	beq	.L64
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z21.h, z14.h
	cmp	w1, 0
	bgt	.L308
.L65:
	beq	.L66
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z20.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	bgt	.L309
.L67:
	movi	d15, #0
	beq	.L68
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z26.h, z14.h
	cmp	w1, 0
	bgt	.L310
.L69:
	beq	.L70
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z25.h, z14.h
	cmp	w1, 0
	bgt	.L311
.L71:
	beq	.L72
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z24.h, z14.h
	cmp	w1, 0
	bgt	.L312
.L73:
	beq	.L74
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z23.h, z14.h
	cmp	w1, 0
	bgt	.L313
.L75:
	beq	.L76
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z22.h, z14.h
	cmp	w1, 0
	bgt	.L314
.L77:
	beq	.L78
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z21.h, z14.h
	cmp	w1, 0
	bgt	.L315
.L79:
	beq	.L80
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z20.h, z14.h
	cmp	w1, 0
	bgt	.L316
.L81:
	beq	.L82
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z19.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	bgt	.L317
.L83:
	movi	d15, #0
	beq	.L84
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z25.h, z14.h
	cmp	w1, 0
	bgt	.L318
.L85:
	beq	.L86
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z24.h, z14.h
	cmp	w1, 0
	bgt	.L319
.L87:
	beq	.L88
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z23.h, z14.h
	cmp	w1, 0
	bgt	.L320
.L89:
	beq	.L90
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z22.h, z14.h
	cmp	w1, 0
	bgt	.L321
.L91:
	beq	.L92
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z21.h, z14.h
	cmp	w1, 0
	bgt	.L322
.L93:
	beq	.L94
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z20.h, z14.h
	cmp	w1, 0
	bgt	.L323
.L95:
	beq	.L96
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z19.h, z14.h
	cmp	w1, 0
	bgt	.L324
.L97:
	beq	.L98
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z18.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	bgt	.L325
.L99:
	movi	d15, #0
	beq	.L100
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z24.h, z14.h
	cmp	w1, 0
	bgt	.L326
.L101:
	beq	.L102
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z23.h, z14.h
	cmp	w1, 0
	bgt	.L327
.L103:
	beq	.L104
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z22.h, z14.h
	cmp	w1, 0
	bgt	.L328
.L105:
	beq	.L106
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z21.h, z14.h
	cmp	w1, 0
	bgt	.L329
.L107:
	beq	.L108
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z20.h, z14.h
	cmp	w1, 0
	bgt	.L330
.L109:
	beq	.L110
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z19.h, z14.h
	cmp	w1, 0
	bgt	.L331
.L111:
	beq	.L112
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z18.h, z14.h
	cmp	w1, 0
	bgt	.L332
.L113:
	beq	.L114
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z17.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	bgt	.L333
.L115:
	movi	d15, #0
	beq	.L116
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z23.h, z14.h
	cmp	w1, 0
	bgt	.L334
.L117:
	beq	.L118
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z22.h, z14.h
	cmp	w1, 0
	bgt	.L335
.L119:
	beq	.L120
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z21.h, z14.h
	cmp	w1, 0
	bgt	.L336
.L121:
	beq	.L122
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z20.h, z14.h
	cmp	w1, 0
	bgt	.L337
.L123:
	beq	.L124
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z19.h, z14.h
	cmp	w1, 0
	bgt	.L338
.L125:
	beq	.L126
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z18.h, z14.h
	cmp	w1, 0
	bgt	.L339
.L127:
	beq	.L128
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z17.h, z14.h
	cmp	w1, 0
	bgt	.L340
.L129:
	beq	.L130
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z16.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	bgt	.L341
.L131:
	movi	d15, #0
	beq	.L132
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z22.h, z14.h
	cmp	w1, 0
	bgt	.L342
.L133:
	beq	.L134
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z21.h, z14.h
	cmp	w1, 0
	bgt	.L343
.L135:
	beq	.L136
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z20.h, z14.h
	cmp	w1, 0
	bgt	.L344
.L137:
	beq	.L138
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z19.h, z14.h
	cmp	w1, 0
	bgt	.L345
.L139:
	beq	.L140
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z18.h, z14.h
	cmp	w1, 0
	bgt	.L346
.L141:
	beq	.L142
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z17.h, z14.h
	cmp	w1, 0
	bgt	.L347
.L143:
	beq	.L144
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z16.h, z14.h
	cmp	w1, 0
	bgt	.L348
.L145:
	beq	.L146
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z7.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	bgt	.L349
.L147:
	movi	d15, #0
	beq	.L148
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z21.h, z14.h
	cmp	w1, 0
	bgt	.L350
.L149:
	beq	.L150
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z20.h, z14.h
	cmp	w1, 0
	bgt	.L351
.L151:
	beq	.L152
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z19.h, z14.h
	cmp	w1, 0
	bgt	.L352
.L153:
	beq	.L154
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z18.h, z14.h
	cmp	w1, 0
	bgt	.L353
.L155:
	beq	.L156
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z17.h, z14.h
	cmp	w1, 0
	bgt	.L354
.L157:
	beq	.L158
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z16.h, z14.h
	cmp	w1, 0
	bgt	.L355
.L159:
	beq	.L160
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z7.h, z14.h
	cmp	w1, 0
	bgt	.L356
.L161:
	beq	.L162
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z6.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	bgt	.L357
.L163:
	movi	d15, #0
	beq	.L164
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z20.h, z14.h
	cmp	w1, 0
	bgt	.L358
.L165:
	beq	.L166
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z19.h, z14.h
	cmp	w1, 0
	bgt	.L359
.L167:
	beq	.L168
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z18.h, z14.h
	cmp	w1, 0
	bgt	.L360
.L169:
	beq	.L170
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z17.h, z14.h
	cmp	w1, 0
	bgt	.L361
.L171:
	beq	.L172
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z16.h, z14.h
	cmp	w1, 0
	bgt	.L362
.L173:
	beq	.L174
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z7.h, z14.h
	cmp	w1, 0
	bgt	.L363
.L175:
	beq	.L176
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z6.h, z14.h
	cmp	w1, 0
	bgt	.L364
.L177:
	beq	.L178
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z5.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	bgt	.L365
.L179:
	movi	d15, #0
	beq	.L180
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z19.h, z14.h
	cmp	w1, 0
	bgt	.L366
.L181:
	beq	.L182
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z18.h, z14.h
	cmp	w1, 0
	bgt	.L367
.L183:
	beq	.L184
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z17.h, z14.h
	cmp	w1, 0
	bgt	.L368
.L185:
	beq	.L186
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z16.h, z14.h
	cmp	w1, 0
	bgt	.L369
.L187:
	beq	.L188
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z7.h, z14.h
	cmp	w1, 0
	bgt	.L370
.L189:
	beq	.L190
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z6.h, z14.h
	cmp	w1, 0
	bgt	.L371
.L191:
	beq	.L192
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z5.h, z14.h
	cmp	w1, 0
	bgt	.L372
.L193:
	beq	.L194
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z4.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	bgt	.L373
.L195:
	movi	d15, #0
	beq	.L196
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z18.h, z14.h
	cmp	w1, 0
	bgt	.L374
.L197:
	beq	.L198
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z17.h, z14.h
	cmp	w1, 0
	bgt	.L375
.L199:
	beq	.L200
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z16.h, z14.h
	cmp	w1, 0
	bgt	.L376
.L201:
	beq	.L202
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z7.h, z14.h
	cmp	w1, 0
	bgt	.L377
.L203:
	beq	.L204
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z6.h, z14.h
	cmp	w1, 0
	bgt	.L378
.L205:
	beq	.L206
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z5.h, z14.h
	cmp	w1, 0
	bgt	.L379
.L207:
	beq	.L208
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z4.h, z14.h
	cmp	w1, 0
	bgt	.L380
.L209:
	beq	.L210
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z3.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x5, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	bgt	.L381
.L211:
	movi	d15, #0
	beq	.L212
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z17.h, z14.h
	cmp	w1, 0
	bgt	.L382
.L213:
	beq	.L214
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z16.h, z14.h
	cmp	w1, 0
	bgt	.L383
.L215:
	beq	.L216
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z7.h, z14.h
	cmp	w1, 0
	bgt	.L384
.L217:
	beq	.L218
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z6.h, z14.h
	cmp	w1, 0
	bgt	.L385
.L219:
	beq	.L220
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z5.h, z14.h
	cmp	w1, 0
	bgt	.L386
.L221:
	beq	.L222
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z4.h, z14.h
	cmp	w1, 0
	bgt	.L387
.L223:
	beq	.L224
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z3.h, z14.h
	cmp	w1, 0
	bgt	.L388
.L225:
	beq	.L226
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z2.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x2, x3, x5
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x5]
	cmp	w0, 0
	bgt	.L389
.L227:
	movi	d15, #0
	beq	.L228
	neg	w1, w0
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 2]
	mls	z15.h, p7/m, z16.h, z14.h
	cmp	w1, 0
	bgt	.L390
.L229:
	beq	.L230
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 4]
	mls	z15.h, p7/m, z7.h, z14.h
	cmp	w1, 0
	bgt	.L391
.L231:
	beq	.L232
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 6]
	mls	z15.h, p7/m, z6.h, z14.h
	cmp	w1, 0
	bgt	.L392
.L233:
	beq	.L234
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 8]
	mls	z15.h, p7/m, z5.h, z14.h
	cmp	w1, 0
	bgt	.L393
.L235:
	beq	.L236
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 10]
	mls	z15.h, p7/m, z4.h, z14.h
	cmp	w1, 0
	bgt	.L394
.L237:
	beq	.L238
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 12]
	mls	z15.h, p7/m, z3.h, z14.h
	cmp	w1, 0
	bgt	.L395
.L239:
	beq	.L240
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	ldrsh	w1, [x4, 14]
	mls	z15.h, p7/m, z2.h, z14.h
	cmp	w1, 0
	bgt	.L396
.L241:
	beq	.L242
	neg	w1, w1
	mov	z14.h, w1
	ptrue	p7.b, all
	mls	z15.h, p7/m, z1.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	add	x1, x3, x2
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x2]
	cmp	w0, 0
	bgt	.L397
.L243:
	movi	d15, #0
	beq	.L244
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	ldrsh	w0, [x4, 2]
	mls	z15.h, p7/m, z7.h, z14.h
	cmp	w0, 0
	bgt	.L398
.L245:
	beq	.L246
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	ldrsh	w0, [x4, 4]
	mls	z15.h, p7/m, z6.h, z14.h
	cmp	w0, 0
	bgt	.L399
.L247:
	beq	.L248
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	ldrsh	w0, [x4, 6]
	mls	z15.h, p7/m, z5.h, z14.h
	cmp	w0, 0
	bgt	.L400
.L249:
	beq	.L250
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	ldrsh	w0, [x4, 8]
	mls	z15.h, p7/m, z4.h, z14.h
	cmp	w0, 0
	bgt	.L401
.L251:
	beq	.L252
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	ldrsh	w0, [x4, 10]
	mls	z15.h, p7/m, z3.h, z14.h
	cmp	w0, 0
	bgt	.L402
.L253:
	beq	.L254
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	ldrsh	w0, [x4, 12]
	mls	z15.h, p7/m, z2.h, z14.h
	cmp	w0, 0
	bgt	.L403
.L255:
	beq	.L256
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	ldrsh	w0, [x4, 14]
	mls	z15.h, p7/m, z1.h, z14.h
	cmp	w0, 0
	bgt	.L404
.L257:
	beq	.L258
	neg	w0, w0
	mov	z14.h, w0
	ptrue	p7.b, all
	mls	z15.h, p7/m, z0.h, z14.h
	sqrshrun	v14.8b, v15.8h, 6
	tbl	z15.h, {z15.h}, z31.h
	sqrshrun2	v14.16b, v15.8h, 6
	str	q14, [x3, x1]
	ldp	d14, d15, [sp], 16
	.cfi_restore 79
	.cfi_restore 78
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3886:
	.size	dynopt_interp8_16x16_sve2_vpp, .-dynopt_interp8_16x16_sve2_vpp
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
	.type	_ZL7IDX_HI8, %object
	.size	_ZL7IDX_HI8, 32
_ZL7IDX_HI8:
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
