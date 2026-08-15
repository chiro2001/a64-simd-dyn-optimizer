	.arch armv8.2-a+dotprod+crc+sve
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_cost_coeff_nxn_sve2
	.type	dynopt_cost_coeff_nxn_sve2, %function
dynopt_cost_coeff_nxn_sve2:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	lsl	x8, x2, 1
	add	x2, x1, x2, lsl 1
	add	x10, x2, x8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	add	x16, sp, 32
	ldr	w9, [sp, 64]
	ldr	d29, [x1, x8]
	adrp	x19, .LANCHOR0
	ldr	d30, [x2, x8]
	cmp	w9, 14
	ldr	d31, [x10, x8]
	cset	w14, le
	ldr	d28, [x1]
	abs	v0.4h, v29.4h
	abs	v1.4h, v30.4h
	ldr	w18, [sp, 72]
	abs	v2.4h, v31.4h
	mov	w10, w14
	abs	v3.4h, v28.4h
	sxtw	x2, w9
	cmp	w18, 0
	orr	w11, w10, w2
	cset	w17, eq
	uxtw	x1, w10
	cmp	w11, 0
	stp	d1, d2, [sp, 48]
	add	x19, x19, :lo12:.LANCHOR0
	stp	d3, d0, [sp, 32]
	mov	x30, x14
	ldrh	w11, [x0, x2, lsl 1]
	and	w12, w5, 1
	sub	x1, x1, x14
	ccmp	w17, 0, 0, eq
	mov	w13, 0
	mov	w20, 34297
	beq	.L9
.L2:
	ldrb	w15, [x4, w11, uxtw]
	cmn	w18, w2
	add	w8, w15, w7
	csel	w8, w8, wzr, ne
	ldrb	w9, [x6, w8, uxtw]
	and	w15, w9, 1
	eor	w9, w9, w12
	cmp	w9, 1
	beq	.L4
	add	w10, w10, w12
	ldr	w12, [x19, w9, uxtw 2]
	ldrh	w11, [x16, w11, uxtw 1]
	sub	x2, x2, #1
	add	w13, w13, w12
	add	w15, w15, w12, lsr 24
	strb	w15, [x6, w8, uxtw]
	strh	w11, [x3, x1, lsl 1]
	tbnz	w2, #31, .L3
	lsr	w5, w5, 1
.L10:
	orr	w11, w10, w2
	uxtw	x1, w10
	cmp	w11, 0
	and	w12, w5, 1
	ldrh	w11, [x0, x2, lsl 1]
	sub	x1, x1, x14
	ccmp	w17, 0, 0, eq
	bne	.L2
.L9:
	cmp	w30, 0
	ubfiz	x4, x11, 1, 16
	mov	x0, -2
	csel	x5, x0, xzr, ne
	ldrh	w6, [x16, x4]
	strh	w6, [x3, x5]
.L3:
	ldp	x19, x20, [sp, 16]
	and	w0, w13, 16777215
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L4:
	.cfi_restore_state
	uxtw	x1, w10
	strb	w12, [x6, w8, uxtw]
	sub	x9, x1, x14
	ldrh	w8, [x16, w11, uxtw 1]
	add	w10, w10, w12
	add	w13, w13, w20
	sub	x2, x2, #1
	strh	w8, [x3, x9, lsl 1]
	tbnz	w2, #31, .L3
	lsr	w5, w5, 1
	b	.L10
	.cfi_endproc
.LFE0:
	.size	dynopt_cost_coeff_nxn_sve2, .-dynopt_cost_coeff_nxn_sve2
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL7ENTROPY, %object
	.size	_ZL7ENTROPY, 512
_ZL7ENTROPY:
	.word	33585955
	.word	34297
	.word	67138720
	.word	36028
	.word	100691684
	.word	33592148
	.word	134244340
	.word	67148827
	.word	167796912
	.word	67151402
	.word	201349788
	.word	134262619
	.word	234902669
	.word	134265173
	.word	268455766
	.word	167821993
	.word	302008967
	.word	201378807
	.word	335562198
	.word	234935747
	.word	369115460
	.word	268492827
	.word	402668936
	.word	302049591
	.word	436222432
	.word	302052045
	.word	469775971
	.word	369163422
	.word	503329607
	.word	369165824
	.word	536883280
	.word	402722709
	.word	570436941
	.word	436279810
	.word	603990739
	.word	436282163
	.word	637544558
	.word	503393453
	.word	671098372
	.word	503396063
	.word	704652325
	.word	536952648
	.word	738206196
	.word	536955332
	.word	771760190
	.word	604066427
	.word	805314125
	.word	604069120
	.word	838868121
	.word	637626078
	.word	872422168
	.word	637628439
	.word	905976229
	.word	704739720
	.word	939530305
	.word	704742183
	.word	973084383
	.word	738299216
	.word	1006638553
	.word	738301255
	.word	1040192636
	.word	771858563
	.word	1073746830
	.word	805415075
	.word	1107300945
	.word	805418008
	.word	1140855142
	.word	838974759
	.word	1174409320
	.word	872531835
	.word	1207963519
	.word	872534414
	.word	1241517786
	.word	906090778
	.word	1275072025
	.word	906093140
	.word	1308626255
	.word	939650202
	.word	1342180496
	.word	973207264
	.word	1375734785
	.word	973209336
	.word	1409289055
	.word	1006766257
	.word	1442843318
	.word	1006768994
	.word	1476397589
	.word	1006771782
	.word	1509951880
	.word	1040328797
	.word	1543506228
	.word	1073884840
	.word	1577060520
	.word	1073887666
	.word	1610614813
	.word	1107445111
	.word	1644169161
	.word	1107447014
	.word	1677723491
	.word	1107449443
	.word	1711277840
	.word	1141005967
	.word	1744832160
	.word	1141008934
	.word	1778386546
	.word	1174564643
	.word	1811940840
	.word	1174568696
	.word	1845495226
	.word	1174570165
	.word	1879049566
	.word	1208127575
	.word	1912603916
	.word	1208130475
	.word	1946158273
	.word	1208133236
	.word	1979712679
	.word	1241688670
	.word	2013267055
	.word	1241690927
	.word	2046821407
	.word	1241694381
	.word	2080375783
	.word	1275251341
	.word	2080375738
	.word	1275253539
	.word	2113929484
	.word	2114174907
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
