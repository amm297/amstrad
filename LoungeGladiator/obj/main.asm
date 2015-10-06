;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Tue Oct  6 10:25:41 2015
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
;src/main.c:48: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:49: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:50: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:51: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:52: cpct_setPalette(g_palette,4);
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
;src/main.c:56: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:58: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:60: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:61: cpct_drawStringM0("Super Menu",memptr,2,3);
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
;src/main.c:63: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:64: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:66: do{
00101$:
;src/main.c:67: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:68: }while(!cpct_isKeyPressed(Key_Enter));
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
;src/main.c:73: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:74: if((u8)atk >= 21)
	ld	a,10 (ix)
	ld	-1 (ix),a
;src/main.c:76: if(eX - pX > -1 && eX - pX < 11)
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
;src/main.c:74: if((u8)atk >= 21)
	ld	a,-1 (ix)
	sub	a, #0x15
	jr	C,00118$
;src/main.c:75: if(dir == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00110$
;src/main.c:76: if(eX - pX > -1 && eX - pX < 11)
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
;src/main.c:77: return 1;
	ld	hl,#0x0001
	jr	00120$
00102$:
;src/main.c:79: return 0;
	ld	hl,#0x0000
	jr	00120$
00110$:
;src/main.c:81: if(pX - eX > -1 && pX - eX < 11)
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
;src/main.c:82: return 1;
	ld	hl,#0x0001
	jr	00120$
00106$:
;src/main.c:84: return 0;
	ld	hl,#0x0000
	jr	00120$
00118$:
;src/main.c:86: if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
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
;src/main.c:87: return 2;
	ld	hl,#0x0002
	jr	00120$
00119$:
;src/main.c:89: return 0;
	ld	hl,#0x0000
00120$:
	inc	sp
	pop	ix
	ret
;src/main.c:92: u8* checkSprite(u8* atk, u8* dir){
;	---------------------------------
; Function checkSprite
; ---------------------------------
_checkSprite::
;src/main.c:93: if(atk <= 20)
	ld	a,#0x14
	ld	iy,#2
	add	iy,sp
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jr	C,00110$
;src/main.c:94: switch((int)dir){
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
;src/main.c:95: case 0:
	jp	(hl)
00131$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:96: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:98: case 1:
00102$:
;src/main.c:99: return gladis_quieto_izda;
	ld	hl,#_gladis_quieto_izda
	ret
;src/main.c:101: case 2:
00103$:
;src/main.c:102: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:104: case 3:
00104$:
;src/main.c:105: return gladis_arriba_dcha;
	ld	hl,#_gladis_arriba_dcha
	ret
;src/main.c:106: }
00110$:
;src/main.c:107: else if(dir == 0){
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00107$
;src/main.c:108: return gladis_atk_dcha;
	ld	hl,#_gladis_atk_dcha
	ret
00107$:
;src/main.c:110: return gladis_atk_izda;
	ld	hl,#_gladis_atk_izda
	ret
;src/main.c:115: void drawFatiga(u8* atk, u8* memptr, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:116: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	NC,00102$
;src/main.c:117: col = 2;
	ld	8 (ix),#0x02
00102$:
;src/main.c:118: if(atk > 30 || atk <= 20){
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
;src/main.c:119: memptr = cpct_getScreenPtr(VMEM,4,160);
	push	de
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:120: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:122: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jr	C,00106$
	ld	a,d
	or	a, a
	jr	NZ,00107$
00106$:
;src/main.c:123: memptr = cpct_getScreenPtr(VMEM,7,160);
	push	de
	ld	hl,#0xA007
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:124: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:126: if(atk <= 20){
	ld	a,d
	or	a, a
	jr	NZ,00111$
;src/main.c:127: memptr = cpct_getScreenPtr(VMEM,10,160);
	ld	hl,#0xA00A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:128: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:133: void drawVida(u8* life, u8* memptr){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:134: if(life >= 1){
	ld	a,4 (ix)
	sub	a, #0x01
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00102$
;src/main.c:135: memptr = cpct_getScreenPtr(VMEM,55,160);
	ld	hl,#0xA037
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
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
;src/main.c:138: memptr = cpct_getScreenPtr(VMEM,60,160);
	ld	hl,#0xA03C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ld	c,l
	ld	b,h
;src/main.c:139: if(life >= 2)
	ld	a,4 (ix)
	sub	a, #0x02
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00104$
;src/main.c:140: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00105$
00104$:
;src/main.c:142: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	de,#_corazon_roto
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
;src/main.c:143: memptr = cpct_getScreenPtr(VMEM,65,160);
	ld	hl,#0xA041
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ex	de,hl
;src/main.c:144: if(life >= 3)
	ld	a,4 (ix)
	sub	a, #0x03
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00107$
;src/main.c:145: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	bc,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00109$
00107$:
;src/main.c:147: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	bc,#_corazon_roto+0
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00109$:
	pop	ix
	ret
;src/main.c:153: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-62
	add	hl,sp
	ld	sp,hl
;src/main.c:154: TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
	ld	hl,#0x0000
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0000
	add	hl,sp
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,-4 (ix)
	add	a, #0x01
	ld	-2 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x64
	ld	a,-4 (ix)
	add	a, #0x02
	ld	-8 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
	ld	a,-4 (ix)
	add	a, #0x03
	ld	-28 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-27 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x64
	ld	a,-4 (ix)
	add	a, #0x04
	ld	-18 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-4 (ix)
	add	a, #0x06
	ld	-24 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-4 (ix)
	add	a, #0x08
	ld	-26 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-25 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-4 (ix)
	add	a, #0x0A
	ld	-32 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-31 (ix),a
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-4 (ix)
	add	a, #0x0C
	ld	-30 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
	ld	a,-4 (ix)
	add	a, #0x0E
	ld	-16 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
;src/main.c:155: TEnemy  e = { 55,100,0,0 };
	ld	hl,#0x0016
	add	hl,sp
	ld	(hl),#0x37
	ld	hl,#0x0016
	add	hl,sp
	ld	-22 (ix),l
	ld	-21 (ix),h
	ld	a,-22 (ix)
	add	a, #0x01
	ld	-14 (ix),a
	ld	a,-21 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x64
	ld	a,-22 (ix)
	add	a, #0x02
	ld	-6 (ix),a
	ld	a,-21 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-22 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-21 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;src/main.c:156: TEnemy pr = { 0,0,1,0 };
	ld	hl,#0x0010
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0010
	add	hl,sp
	ld	e,l
	ld	d,h
	inc	hl
	ld	(hl),#0x00
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;src/main.c:158: u8* sprite = gladis_quieto_dcha;
	ld	-34 (ix),#<(_gladis_quieto_dcha)
	ld	-33 (ix),#>(_gladis_quieto_dcha)
;src/main.c:161: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:163: while (1){
00169$:
;src/main.c:166: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:169: memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	b,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:170: if(p.prevAtk <= 20)
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
;src/main.c:171: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:170: if(p.prevAtk <= 20)
	ld	a,#0x14
	cp	a, b
	ld	a,#0x00
	sbc	a, h
	jr	C,00102$
;src/main.c:171: cpct_drawSolidBox(memptr,0,4,16);
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
;src/main.c:173: cpct_drawSolidBox(memptr,0,5,16);
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
;src/main.c:175: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:177: if(p.atk >= 21)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a, (hl)
	inc	hl
	ld	l,(hl)
	ld	h,a
;src/main.c:171: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	ld	e,-34 (ix)
	ld	d,-33 (ix)
;src/main.c:177: if(p.atk >= 21)
	ld	a,h
	sub	a, #0x15
	ld	a,l
	sbc	a, #0x00
	jr	C,00105$
;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	ld	hl,#0x1005
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00106$
00105$:
;src/main.c:180: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00106$:
;src/main.c:182: memptr = cpct_getScreenPtr(VMEM,60,160);
	ld	hl,#0xA03C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:183: cpct_drawSolidBox(memptr,0,10,16);
	ex	de,hl
	ld	hl,#0x100A
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:185: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	b,(hl)
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:186: if(e.vivo == 0)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d,(hl)
	inc	hl
	ld	a, (hl)
	or	a,d
	jr	NZ,00108$
;src/main.c:187: cpct_drawSolidBox(memptr,0,4,16);
	ld	e, c
	ld	d, b
	push	bc
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
	pop	bc
00108$:
;src/main.c:192: if(e.vivo == 0){
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,(hl)
	inc	hl
	ld	a, (hl)
	or	a,e
	jr	NZ,00110$
;src/main.c:193: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	b,(hl)
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:194: cpct_drawSolidBox(memptr, 18, 4, 16);
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
00110$:
;src/main.c:177: if(p.atk >= 21)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;src/main.c:197: if(p.atk < 20)
	ld	a,e
	sub	a, #0x14
	ld	a,d
	sbc	a, #0x00
	jr	NC,00115$
;src/main.c:198: drawFatiga(p.atk,memptr,2);
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
	jr	00116$
00115$:
;src/main.c:199: else if(p.atk > 20)
	ld	a,#0x14
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jr	NC,00112$
;src/main.c:200: drawFatiga(p.atk,memptr,16);
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
	jr	00116$
00112$:
;src/main.c:202: drawFatiga(p.atk,memptr,0);
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
00116$:
;src/main.c:204: drawVida(p.life, memptr);
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_drawVida
	pop	af
	pop	af
;src/main.c:206: p.prevX = p.x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),a
;src/main.c:207: p.prevY = p.y;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),a
;src/main.c:208: p.prevAtk = p.atk;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:210: if(p.col != 2){
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00297$
	or	a,h
	jp	Z,00157$
00297$:
;src/main.c:211: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:212: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-11 (ix),l
;src/main.c:177: if(p.atk >= 21)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-19 (ix),a
;src/main.c:197: if(p.atk < 20)
	ld	a,-20 (ix)
	sub	a, #0x14
	ld	a,-19 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	-12 (ix),a
;src/main.c:216: p.atk += 1;
	ld	a,-20 (ix)
	add	a, #0x01
	ld	-10 (ix),a
	ld	a,-19 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/main.c:212: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00151$
	ld	a,-12 (ix)
	or	a, a
	jr	NZ,00151$
;src/main.c:213: if(p.atk >= 50)
	ld	a,-20 (ix)
	sub	a, #0x32
	ld	a,-19 (ix)
	sbc	a, #0x00
	jr	C,00118$
;src/main.c:214: p.atk = 0;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jr	00119$
00118$:
;src/main.c:216: p.atk += 1;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,-10 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-9 (ix)
	ld	(hl),a
00119$:
;src/main.c:217: if(cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00123$
;src/main.c:218: p.dir = 0;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00158$
00123$:
;src/main.c:219: else if(cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00158$
;src/main.c:220: p.dir = 1;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00158$
00151$:
;src/main.c:222: if(p.atk < 20)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00126$
;src/main.c:223: p.atk += 1;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,-10 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-9 (ix)
	ld	(hl),a
	jr	00127$
00126$:
;src/main.c:225: p.atk = 20;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
00127$:
;src/main.c:226: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00147$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00147$
;src/main.c:227: if(p.col != 2)
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00298$
	or	a,h
	jr	Z,00129$
00298$:
;src/main.c:228: p.x += 1;
	inc	d
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),d
00129$:
;src/main.c:229: p.dir = 0;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00158$
00147$:
;src/main.c:230: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00143$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	ld	a,d
	or	a, a
	jr	Z,00143$
;src/main.c:231: if(p.col != 2)
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00299$
	or	a,h
	jr	Z,00131$
00299$:
;src/main.c:232: p.x -= 1;
	dec	d
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),d
00131$:
;src/main.c:233: p.dir = 1;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00158$
00143$:
;src/main.c:234: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00139$
;src/main.c:175: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
;src/main.c:234: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	a,d
	sub	a, #0xB8
	jr	NC,00139$
;src/main.c:235: p.y += 2;
	inc	d
	inc	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:236: p.dir = 2;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
	jr	00158$
00139$:
;src/main.c:237: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00135$
;src/main.c:175: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
;src/main.c:237: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	or	a, a
	jr	Z,00135$
;src/main.c:238: p.y -= 2;
	add	a,#0xFE
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/main.c:239: p.dir = 3;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
	jr	00158$
00135$:
;src/main.c:240: }else  if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00158$
;src/main.c:241: return;
	jp	00171$
00157$:
;src/main.c:245: p.x -= 2;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/main.c:246: p.rebote -= 2;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	de
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:247: if(p.rebote == 0){
	ld	a,d
	or	a,e
	jr	NZ,00158$
;src/main.c:248: p.rebote = 6;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;src/main.c:249: p.col = 0;
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00158$:
;src/main.c:254: sprite = checkSprite(p.atk,p.dir);
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_checkSprite
	pop	af
	pop	af
	ld	-34 (ix),l
	ld	-33 (ix),h
;src/main.c:256: if(p.col != 2 && e.vivo == 0){
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00300$
	or	a,h
	jp	Z,00164$
00300$:
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d,(hl)
	inc	hl
	ld	a, (hl)
	or	a,d
	jp	NZ,00164$
;src/main.c:257: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	e,(hl)
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	push	bc
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	ld	a,-12 (ix)
	push	af
	inc	sp
	ld	a,-20 (ix)
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
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:258: if(p.col == 2)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00160$
	or	a,e
	jr	NZ,00160$
;src/main.c:259: p.life--;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
00160$:
;src/main.c:260: if(p.life == 0)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	d,(hl)
	inc	hl
	ld	a, (hl)
	or	a,d
;src/main.c:261: return;
	jr	Z,00171$
00164$:
;src/main.c:263: if(p.col == 1)
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jp	NZ,00169$
	ld	a,h
	or	a, a
	jp	NZ,00169$
;src/main.c:264: e.vivo = 1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00169$
00171$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:271: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:273: init();
	call	_init
;src/main.c:276: while(1){
00102$:
;src/main.c:277: menu();
	call	_menu
;src/main.c:278: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
