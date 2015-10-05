;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Mon Oct  5 12:35:28 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _drawVida
	.globl _drawFatiga
	.globl _checkSprite
	.globl _checkCollisions
	.globl _menu
	.globl _init
	.globl _cpct_getScreenPtr
	.globl _cpct_setPalette
	.globl _cpct_fw2hw
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _cpct_disableFirmware
	.globl _g_palette
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:46: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:47: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:48: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:49: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:50: cpct_setPalette(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
	ret
_g_palette:
	.db #0x00	; 0
	.db #0x1A	; 26
	.db #0x06	; 6
	.db #0x12	; 18
;src/main.c:54: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:56: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:58: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:59: cpct_drawStringM0("Super Menu",memptr,2,3);
	ex	de,hl
	ld	bc,#___str_0+0
	ld	hl,#0x0302
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:61: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:62: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
	ex	de,hl
	ld	bc,#___str_1+0
	ld	hl,#0x0504
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:64: do{
00101$:
;src/main.c:65: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:66: }while(!cpct_isKeyPressed(Key_Enter));
	ld	hl,#0x4000
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
	ret
___str_0:
	.ascii "Super Menu"
	.db 0x00
___str_1:
	.ascii "Pulsa Intro"
	.db 0x00
;src/main.c:71: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:72: if((u8)atk >= 21)
	ld	a,10 (ix)
	ld	-1 (ix),a
;src/main.c:74: if(eX - pX > -1 && eX - pX < 11)
	ld	c,6 (ix)
	ld	b,#0x00
	ld	l,4 (ix)
	ld	h,#0x00
	ld	a,c
	sub	a, l
	ld	e,a
	ld	a,b
	sbc	a, h
	ld	d,a
;src/main.c:72: if((u8)atk >= 21)
	ld	a,-1 (ix)
	sub	a, #0x15
	jr	C,00118$
;src/main.c:73: if(dir == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00110$
;src/main.c:74: if(eX - pX > -1 && eX - pX < 11)
	ld	a,#0xFF
	cp	a, e
	sbc	a, d
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	jp	P,00102$
	ld	a,e
	sub	a, #0x0B
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
;src/main.c:75: return 1;
	ld	hl,#0x0001
	jr	00120$
00102$:
;src/main.c:77: return 0;
	ld	hl,#0x0000
	jr	00120$
00110$:
;src/main.c:79: if(pX - eX > -1 && pX - eX < 11)
	cp	a, a
	sbc	hl, bc
	ld	a,#0xFF
	cp	a, l
	sbc	a, h
	jp	PO, 00163$
	xor	a, #0x80
00163$:
	jp	P,00106$
	ld	de, #0x800B
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	NC,00106$
;src/main.c:80: return 1;
	ld	hl,#0x0001
	jr	00120$
00106$:
;src/main.c:82: return 0;
	ld	hl,#0x0000
	jr	00120$
00118$:
;src/main.c:84: if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00164$
	xor	a, #0x80
00164$:
	jp	P,00119$
	ld	a,e
	sub	a, #0x04
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00119$
	ld	l,7 (ix)
	ld	h,#0x00
	ld	e,5 (ix)
	ld	d,#0x00
	cp	a, a
	sbc	hl, de
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00165$
	xor	a, #0x80
00165$:
	jp	P,00119$
	ld	de, #0x8010
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	NC,00119$
;src/main.c:85: return 2;
	ld	hl,#0x0002
	jr	00120$
00119$:
;src/main.c:87: return 0;
	ld	hl,#0x0000
00120$:
	inc	sp
	pop	ix
	ret
;src/main.c:90: u8* checkSprite(u8* atk, u8* dir){
;	---------------------------------
; Function checkSprite
; ---------------------------------
_checkSprite::
;src/main.c:91: if(atk <= 20)
	ld	a,#0x14
	ld	iy,#2
	add	iy,sp
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jr	C,00110$
;src/main.c:92: switch((int)dir){
	ld	iy,#4
	add	iy,sp
	ld	e,0 (iy)
	ld	d,1 (iy)
	bit	7, d
	ret	NZ
	ld	a,#0x03
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	ret	M
	ld	d,#0x00
	ld	hl,#00131$
	add	hl,de
	add	hl,de
;src/main.c:93: case 0:
	jp	(hl)
00131$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:94: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:96: case 1:
00102$:
;src/main.c:97: return gladis_quieto_izda;
	ld	hl,#_gladis_quieto_izda
	ret
;src/main.c:99: case 2:
00103$:
;src/main.c:100: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:102: case 3:
00104$:
;src/main.c:103: return gladis_arriba_dcha;
	ld	hl,#_gladis_arriba_dcha
	ret
;src/main.c:104: }
00110$:
;src/main.c:105: else if(dir == 0){
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00107$
;src/main.c:106: return gladis_atk_dcha;
	ld	hl,#_gladis_atk_dcha
	ret
00107$:
;src/main.c:108: return gladis_atk_izda;
	ld	hl,#_gladis_atk_izda
	ret
;src/main.c:112: void drawFatiga(u8* atk, u8* memptr, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:113: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	NC,00102$
;src/main.c:114: col = 2;
	ld	8 (ix),#0x02
00102$:
;src/main.c:115: if(atk > 30 || atk <= 20){
	ld	a,#0x14
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	d,a
	ld	a,#0x1E
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jr	C,00103$
	ld	a,d
	or	a, a
	jr	NZ,00104$
00103$:
;src/main.c:116: memptr = cpct_getScreenPtr(VMEM,4,160);
	push	de
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:117: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ld	c,l
	ld	b,h
	push	de
	ld	hl,#0x0802
	push	hl
	ld	a,8 (ix)
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
00104$:
;src/main.c:119: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jr	C,00106$
	ld	a,d
	or	a, a
	jr	NZ,00107$
00106$:
;src/main.c:120: memptr = cpct_getScreenPtr(VMEM,7,160);
	push	de
	ld	hl,#0xA007
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:121: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ld	c,l
	ld	b,h
	push	de
	ld	hl,#0x0802
	push	hl
	ld	a,8 (ix)
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
00107$:
;src/main.c:123: if(atk <= 20){
	ld	a,d
	or	a, a
	jr	NZ,00111$
;src/main.c:124: memptr = cpct_getScreenPtr(VMEM,10,160);
	ld	hl,#0xA00A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:125: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ex	de,hl
	ld	hl,#0x0802
	push	hl
	ld	a,8 (ix)
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00111$:
	pop	ix
	ret
;src/main.c:129: void drawVida(u8* life, u8* memptr){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:130: if(life >= 1){
	ld	a,4 (ix)
	sub	a, #0x01
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00102$
;src/main.c:131: memptr = cpct_getScreenPtr(VMEM,55,160);
	ld	hl,#0xA037
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:132: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ld	c,l
	ld	b,h
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00102$:
;src/main.c:134: memptr = cpct_getScreenPtr(VMEM,60,160);
	ld	hl,#0xA03C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:132: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ld	c,l
	ld	b,h
;src/main.c:135: if(life >= 2)
	ld	a,4 (ix)
	sub	a, #0x02
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00104$
;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00105$
00104$:
;src/main.c:138: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	de,#_corazon_roto
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
;src/main.c:139: memptr = cpct_getScreenPtr(VMEM,65,160);
	ld	hl,#0xA041
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:132: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ex	de,hl
;src/main.c:140: if(life >= 3)
	ld	a,4 (ix)
	sub	a, #0x03
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00107$
;src/main.c:141: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	bc,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00109$
00107$:
;src/main.c:143: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	bc,#_corazon_roto+0
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00109$:
	pop	ix
	ret
;src/main.c:149: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-43
	add	hl,sp
	ld	sp,hl
;src/main.c:150: TPlayer p = { 0,100,20,0,0,6,3 };
	ld	hl,#0x0005
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0005
	add	hl,sp
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	a,-11 (ix)
	add	a, #0x01
	ld	-13 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x64
	ld	a,-11 (ix)
	add	a, #0x02
	ld	-9 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-11 (ix)
	add	a, #0x04
	ld	-19 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-11 (ix)
	add	a, #0x06
	ld	-15 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-11 (ix)
	add	a, #0x08
	ld	-2 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
	ld	a,-11 (ix)
	add	a, #0x0A
	ld	-4 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
;src/main.c:151: TEnemy  e = { 55,100,0 };
	ld	hl,#0x0000
	add	hl,sp
	ld	(hl),#0x37
	ld	hl,#0x0000
	add	hl,sp
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	a,-17 (ix)
	add	a, #0x01
	ld	-23 (ix),a
	ld	a,-16 (ix)
	adc	a, #0x00
	ld	-22 (ix),a
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x64
	ld	a,-17 (ix)
	add	a, #0x02
	ld	-21 (ix),a
	ld	a,-16 (ix)
	adc	a, #0x00
	ld	-20 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	(hl),#0x00
;src/main.c:156: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:158: while (1){
00169$:
;src/main.c:161: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:164: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	b,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:165: if(p.atk <= 20)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
;src/main.c:166: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:165: if(p.atk <= 20)
	ld	a,#0x14
	cp	a, b
	ld	a,#0x00
	sbc	a, h
	jr	C,00102$
;src/main.c:166: cpct_drawSolidBox(memptr,0,4,16);
	ld	hl,#0x1004
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	jr	00103$
00102$:
;src/main.c:168: cpct_drawSolidBox(memptr,0,5,16);
	ld	hl,#0x1005
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00103$:
;src/main.c:170: memptr = cpct_getScreenPtr(VMEM,55,160);
	ld	hl,#0xA037
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:171: cpct_drawSolidBox(memptr,0,15,16);
	ex	de,hl
	ld	hl,#0x100F
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:173: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	b,(hl)
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:174: if(e.vivo == 0)
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00105$
;src/main.c:175: cpct_drawSolidBox(memptr,0,4,16);
	ld	hl,#0x1004
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00105$:
;src/main.c:178: if(p.col != 2){
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00297$
	or	a,h
	jp	Z,00146$
00297$:
;src/main.c:179: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:180: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-5 (ix),l
;src/main.c:165: if(p.atk <= 20)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-6 (ix),a
;src/main.c:180: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	a,-7 (ix)
	sub	a, #0x14
	ld	a,-6 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	-26 (ix),a
;src/main.c:184: p.atk += 1;
	ld	a,-7 (ix)
	add	a, #0x01
	ld	-25 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-24 (ix),a
;src/main.c:180: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00140$
	ld	a,-26 (ix)
	or	a, a
	jr	NZ,00140$
;src/main.c:181: if(p.atk >= 50)
	ld	a,-7 (ix)
	sub	a, #0x32
	ld	a,-6 (ix)
	sbc	a, #0x00
	jr	C,00107$
;src/main.c:182: p.atk = 0;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jr	00108$
00107$:
;src/main.c:184: p.atk += 1;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,-25 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-24 (ix)
	ld	(hl),a
00108$:
;src/main.c:185: if(cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00112$
;src/main.c:186: p.dir = 0;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00147$
00112$:
;src/main.c:187: else if(cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00147$
;src/main.c:188: p.dir = 1;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00147$
00140$:
;src/main.c:190: if(p.atk < 20)
	ld	a,-26 (ix)
	or	a, a
	jr	Z,00115$
;src/main.c:191: p.atk += 1;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,-25 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-24 (ix)
	ld	(hl),a
	jr	00116$
00115$:
;src/main.c:193: p.atk = 20;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
00116$:
;src/main.c:194: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00136$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00136$
;src/main.c:195: if(p.col != 2)
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00298$
	or	a,h
	jr	Z,00118$
00298$:
;src/main.c:196: p.x += 1;
	inc	d
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),d
00118$:
;src/main.c:197: p.dir = 0;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00147$
00136$:
;src/main.c:198: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00132$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	ld	a,d
	or	a, a
	jr	Z,00132$
;src/main.c:199: if(p.col != 2)
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00299$
	or	a,h
	jr	Z,00120$
00299$:
;src/main.c:200: p.x -= 1;
	dec	d
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),d
00120$:
;src/main.c:201: p.dir = 1;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00147$
00132$:
;src/main.c:202: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00128$
;src/main.c:164: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	d,(hl)
;src/main.c:202: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	a,d
	sub	a, #0xB8
	jr	NC,00128$
;src/main.c:203: p.y += 2;
	inc	d
	inc	d
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),d
;src/main.c:204: p.dir = 2;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
	jr	00147$
00128$:
;src/main.c:205: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00124$
;src/main.c:164: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
;src/main.c:205: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	or	a, a
	jr	Z,00124$
;src/main.c:206: p.y -= 2;
	add	a,#0xFE
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:207: p.dir = 3;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
	jr	00147$
00124$:
;src/main.c:208: }else  if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00147$
;src/main.c:209: return;
	jp	00171$
00146$:
;src/main.c:213: p.x -= 2;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),a
;src/main.c:214: p.rebote -= 2;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:215: if(p.rebote == 0){
	ld	a,d
	or	a,e
	jr	NZ,00147$
;src/main.c:216: p.rebote = 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;src/main.c:217: p.col = 0;
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00147$:
;src/main.c:222: sprite = checkSprite(p.atk,p.dir);
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_checkSprite
	pop	af
	pop	af
	ld	-40 (ix),l
	ld	-39 (ix),h
;src/main.c:224: if(p.col != 2 && e.vivo == 0){
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00300$
	or	a,h
	jp	Z,00153$
00300$:
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00153$
;src/main.c:225: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	-25 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-24 (ix),a
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	e,(hl)
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-26 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	push	bc
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	ld	a,-26 (ix)
	push	af
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_checkCollisions
	pop	af
	pop	af
	pop	af
	pop	af
	ld	d,l
	ld	e,h
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:226: if(p.col == 2)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00149$
	or	a,e
	jr	NZ,00149$
;src/main.c:227: p.life--;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
00149$:
;src/main.c:228: if(p.life == 0)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	inc	hl
	ld	a, (hl)
	or	a,d
;src/main.c:229: return;
	jp	Z,00171$
00153$:
;src/main.c:231: if(p.col == 1)
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00156$
	ld	a,h
	or	a, a
	jr	NZ,00156$
;src/main.c:232: e.vivo = 1;
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	(hl),#0x01
00156$:
;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	b,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:238: if(p.atk >= 21)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
;src/main.c:166: cpct_drawSolidBox(memptr,0,4,16);
	push	bc
	pop	iy
;src/main.c:239: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	ld	e,-40 (ix)
	ld	d,-39 (ix)
;src/main.c:238: if(p.atk >= 21)
	ld	a,l
	sub	a, #0x15
	ld	a,h
	sbc	a, #0x00
	jr	C,00158$
;src/main.c:239: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	push	bc
	ld	hl,#0x1005
	push	hl
	push	iy
	push	de
	call	_cpct_drawSpriteMasked
	pop	bc
	jr	00159$
00158$:
;src/main.c:241: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	push	bc
	ld	hl,#0x1004
	push	hl
	push	iy
	push	de
	call	_cpct_drawSpriteMasked
	pop	bc
00159$:
;src/main.c:244: if(e.vivo == 0){
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00161$
;src/main.c:245: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	b,(hl)
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:246: cpct_drawSolidBox(memptr, 18, 4, 16);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl,#0x1004
	push	hl
	ld	a,#0x12
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
00161$:
;src/main.c:165: if(p.atk <= 20)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;src/main.c:249: if(p.atk < 20)
	ld	a,e
	sub	a, #0x14
	ld	a,d
	sbc	a, #0x00
	jr	NC,00166$
;src/main.c:250: drawFatiga(p.atk,memptr,2);
	push	bc
	ld	a,#0x02
	push	af
	inc	sp
	push	bc
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
	pop	bc
	jr	00167$
00166$:
;src/main.c:251: else if(p.atk > 20)
	ld	a,#0x14
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jr	NC,00163$
;src/main.c:252: drawFatiga(p.atk,memptr,16);
	push	bc
	ld	a,#0x10
	push	af
	inc	sp
	push	bc
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
	pop	bc
	jr	00167$
00163$:
;src/main.c:254: drawFatiga(p.atk,memptr,0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	bc
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
	pop	bc
00167$:
;src/main.c:256: drawVida(p.life, memptr);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_drawVida
	pop	af
	pop	af
	jp	00169$
00171$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:263: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:265: init();
	call	_init
;src/main.c:268: while(1){
00102$:
;src/main.c:269: menu();
	call	_menu
;src/main.c:270: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
