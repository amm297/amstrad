;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Tue Oct  6 12:07:54 2015
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
	.globl _checkSpriteFlecha
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
;src/main.c:50: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:51: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:52: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:53: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:54: cpct_setPalette(g_palette,4);
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
;src/main.c:58: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:60: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:62: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:63: cpct_drawStringM0("Super Menu",memptr,2,3);
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
;src/main.c:65: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:66: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:68: do{
00101$:
;src/main.c:69: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:70: }while(!cpct_isKeyPressed(Key_Enter));
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
;src/main.c:75: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:76: if((u8)atk >= 21)
	ld	a,10 (ix)
	ld	-1 (ix),a
;src/main.c:78: if(eX - pX > -1 && eX - pX < 11)
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
;src/main.c:76: if((u8)atk >= 21)
	ld	a,-1 (ix)
	sub	a, #0x15
	jr	C,00118$
;src/main.c:77: if(dir == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00110$
;src/main.c:78: if(eX - pX > -1 && eX - pX < 11)
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
;src/main.c:79: return 1;
	ld	hl,#0x0001
	jr	00120$
00102$:
;src/main.c:81: return 0;
	ld	hl,#0x0000
	jr	00120$
00110$:
;src/main.c:83: if(pX - eX > -1 && pX - eX < 11)
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
;src/main.c:84: return 1;
	ld	hl,#0x0001
	jr	00120$
00106$:
;src/main.c:86: return 0;
	ld	hl,#0x0000
	jr	00120$
00118$:
;src/main.c:88: if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
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
;src/main.c:89: return 2;
	ld	hl,#0x0002
	jr	00120$
00119$:
;src/main.c:91: return 0;
	ld	hl,#0x0000
00120$:
	inc	sp
	pop	ix
	ret
;src/main.c:94: u8* checkSprite(u8* atk, u8* dir){
;	---------------------------------
; Function checkSprite
; ---------------------------------
_checkSprite::
;src/main.c:95: if(atk <= 20)
	ld	a,#0x14
	ld	iy,#2
	add	iy,sp
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jr	C,00110$
;src/main.c:96: switch((int)dir){
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
;src/main.c:97: case 0:
	jp	(hl)
00131$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:98: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:100: case 1:
00102$:
;src/main.c:101: return gladis_quieto_izda;
	ld	hl,#_gladis_quieto_izda
	ret
;src/main.c:103: case 2:
00103$:
;src/main.c:104: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:106: case 3:
00104$:
;src/main.c:107: return gladis_arriba_dcha;
	ld	hl,#_gladis_arriba_dcha
	ret
;src/main.c:108: }
00110$:
;src/main.c:109: else if(dir == 0){
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00107$
;src/main.c:110: return gladis_atk_dcha;
	ld	hl,#_gladis_atk_dcha
	ret
00107$:
;src/main.c:112: return gladis_atk_izda;
	ld	hl,#_gladis_atk_izda
	ret
;src/main.c:116: u8* checkSpriteFlecha(u8* dir){
;	---------------------------------
; Function checkSpriteFlecha
; ---------------------------------
_checkSpriteFlecha::
;src/main.c:117: switch((int)dir){
	pop	bc
	pop	de
	push	de
	push	bc
	bit	7, d
	ret	NZ
	ld	a,#0x03
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	M
	ld	d,#0x00
	ld	hl,#00117$
	add	hl,de
	add	hl,de
;src/main.c:118: case 0:
	jp	(hl)
00117$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:119: return flecha_dcha;
	ld	hl,#_flecha_dcha
	ret
;src/main.c:121: case 1:
00102$:
;src/main.c:122: return flecha_izda;
	ld	hl,#_flecha_izda
	ret
;src/main.c:124: case 2:
00103$:
;src/main.c:125: return flecha_abajo;
	ld	hl,#_flecha_abajo
	ret
;src/main.c:127: case 3:
00104$:
;src/main.c:128: return flecha_arriba;
	ld	hl,#_flecha_arriba
;src/main.c:130: }
	ret
;src/main.c:134: void drawFatiga(u8* atk, u8* memptr, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:135: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	NC,00102$
;src/main.c:136: col = 2;
	ld	8 (ix),#0x02
00102$:
;src/main.c:137: if(atk > 30 || atk <= 20){
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
;src/main.c:138: memptr = cpct_getScreenPtr(VMEM,4,160);
	push	de
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:139: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:141: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jr	C,00106$
	ld	a,d
	or	a, a
	jr	NZ,00107$
00106$:
;src/main.c:142: memptr = cpct_getScreenPtr(VMEM,7,160);
	push	de
	ld	hl,#0xA007
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:143: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:145: if(atk <= 20){
	ld	a,d
	or	a, a
	jr	NZ,00111$
;src/main.c:146: memptr = cpct_getScreenPtr(VMEM,10,160);
	ld	hl,#0xA00A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:147: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:152: void drawVida(u8* life, u8* memptr){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:153: if(life >= 1){
	ld	a,4 (ix)
	sub	a, #0x01
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00102$
;src/main.c:154: memptr = cpct_getScreenPtr(VMEM,55,160);
	ld	hl,#0xA037
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:155: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
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
;src/main.c:157: memptr = cpct_getScreenPtr(VMEM,60,160);
	ld	hl,#0xA03C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:155: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ld	c,l
	ld	b,h
;src/main.c:158: if(life >= 2)
	ld	a,4 (ix)
	sub	a, #0x02
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00104$
;src/main.c:159: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00105$
00104$:
;src/main.c:161: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	de,#_corazon_roto
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
;src/main.c:162: memptr = cpct_getScreenPtr(VMEM,65,160);
	ld	hl,#0xA041
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:155: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ex	de,hl
;src/main.c:163: if(life >= 3)
	ld	a,4 (ix)
	sub	a, #0x03
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00107$
;src/main.c:164: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	bc,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00109$
00107$:
;src/main.c:166: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	bc,#_corazon_roto+0
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00109$:
	pop	ix
	ret
;src/main.c:172: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-79
	add	hl,sp
	ld	sp,hl
;src/main.c:173: TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
	ld	hl,#0x000A
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x000A
	add	hl,sp
	ld	-39 (ix),l
	ld	-38 (ix),h
	ld	a,-39 (ix)
	add	a, #0x01
	ld	-41 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-40 (ix),a
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	(hl),#0x64
	ld	a,-39 (ix)
	add	a, #0x02
	ld	-43 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-42 (ix),a
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	ld	(hl),#0x00
	ld	a,-39 (ix)
	add	a, #0x03
	ld	-45 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-44 (ix),a
	ld	l,-45 (ix)
	ld	h,-44 (ix)
	ld	(hl),#0x64
	ld	a,-39 (ix)
	add	a, #0x04
	ld	-31 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-30 (ix),a
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-39 (ix)
	add	a, #0x06
	ld	-33 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-32 (ix),a
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-39 (ix)
	add	a, #0x08
	ld	-35 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-34 (ix),a
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-39 (ix)
	add	a, #0x0A
	ld	-37 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-36 (ix),a
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-39 (ix)
	add	a, #0x0C
	ld	-21 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-20 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
	ld	a,-39 (ix)
	add	a, #0x0E
	ld	-23 (ix),a
	ld	a,-38 (ix)
	adc	a, #0x00
	ld	-22 (ix),a
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
;src/main.c:174: TEnemy  e = { 55,100,55,100,0,0 };
	ld	hl,#0x001A
	add	hl,sp
	ld	(hl),#0x37
	ld	hl,#0x001A
	add	hl,sp
	ld	-25 (ix),l
	ld	-24 (ix),h
	ld	a,-25 (ix)
	add	a, #0x01
	ld	-27 (ix),a
	ld	a,-24 (ix)
	adc	a, #0x00
	ld	-26 (ix),a
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),#0x64
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	inc	hl
	inc	hl
	ld	(hl),#0x37
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x64
	ld	a,-25 (ix)
	add	a, #0x04
	ld	-29 (ix),a
	ld	a,-24 (ix)
	adc	a, #0x00
	ld	-28 (ix),a
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-25 (ix)
	add	a, #0x06
	ld	l,a
	ld	a,-24 (ix)
	adc	a, #0x00
	ld	h,a
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:175: TEnemy pr = { 0,0,0,0,1,0 };
	ld	hl,#0x0002
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0002
	add	hl,sp
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
	ld	a,-2 (ix)
	add	a, #0x02
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
	ld	a,-2 (ix)
	add	a, #0x03
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	a,-2 (ix)
	add	a, #0x06
	ld	-12 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;src/main.c:177: u8* sprite = gladis_quieto_dcha;
	ld	-79 (ix),#<(_gladis_quieto_dcha)
	ld	-78 (ix),#>(_gladis_quieto_dcha)
;src/main.c:180: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:182: while (1){
00198$:
;src/main.c:185: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:188: memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
	ld	l,-45 (ix)
	ld	h,-44 (ix)
	ld	b,(hl)
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:189: if(p.prevAtk <= 20)
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:189: if(p.prevAtk <= 20)
	ld	a,#0x14
	cp	a, b
	ld	a,#0x00
	sbc	a, h
	jr	C,00102$
;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
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
;src/main.c:192: cpct_drawSolidBox(memptr,0,5,16);
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
;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	b,(hl)
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:196: if(p.atk >= 21)
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	a, (hl)
	inc	hl
	ld	l,(hl)
	ld	h,a
;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:197: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	pop	de
	push	de
;src/main.c:196: if(p.atk >= 21)
	ld	a,h
	sub	a, #0x15
	ld	a,l
	sbc	a, #0x00
	jr	C,00105$
;src/main.c:197: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	ld	hl,#0x1005
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00106$
00105$:
;src/main.c:199: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00106$:
;src/main.c:202: memptr = cpct_getScreenPtr(VMEM,60,160);
	ld	hl,#0xA03C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:203: cpct_drawSolidBox(memptr,0,10,16);
	ld	e, c
	ld	d, b
	push	bc
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
	pop	bc
;src/main.c:205: drawVida(p.life, memptr);
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_drawVida
	pop	af
	pop	af
;src/main.c:208: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	b,(hl)
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:209: cpct_drawSolidBox(memptr,0,4,16);
	ex	de,hl
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
;src/main.c:211: if(e.vivo == 0){
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	c,(hl)
	inc	hl
	ld	a, (hl)
	or	a,c
	jr	NZ,00108$
;src/main.c:212: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	b,(hl)
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:213: cpct_drawSolidBox(memptr, 18, 4, 16);
	ex	de,hl
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
00108$:
;src/main.c:217: memptr = cpct_getScreenPtr(VMEM,pr.prevX,pr.prevY);
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	b,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-14 (ix),l
	ld	-13 (ix),h
;src/main.c:218: if((int)pr.dir < 2)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
	ld	e,-14 (ix)
	ld	d,-13 (ix)
;src/main.c:218: if((int)pr.dir < 2)
	ld	a,c
	sub	a, #0x02
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00110$
;src/main.c:219: cpct_drawSolidBox(memptr, 0, 4, 4);
	ld	hl,#0x0404
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	jr	00111$
00110$:
;src/main.c:221: cpct_drawSolidBox(memptr, 0, 2, 8);
	ld	hl,#0x0802
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00111$:
;src/main.c:223: if(pr.vivo == 0){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
	inc	hl
	ld	a, (hl)
	or	a,c
	jr	NZ,00116$
;src/main.c:224: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-14 (ix),l
	ld	-13 (ix),h
;src/main.c:218: if((int)pr.dir < 2)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;src/main.c:225: if((int)pr.dir < 2)
	ld	h,e
	ld	l,d
;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
	ld	c,-14 (ix)
	ld	b,-13 (ix)
;src/main.c:225: if((int)pr.dir < 2)
	ld	a,h
	sub	a, #0x02
	ld	a,l
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00113$
;src/main.c:226: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 4, 4);
	push	bc
	push	de
	call	_checkSpriteFlecha
	pop	af
	pop	bc
	ex	de,hl
	ld	hl,#0x0404
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00116$
00113$:
;src/main.c:228: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 2, 8);
	push	bc
	push	de
	call	_checkSpriteFlecha
	pop	af
	pop	bc
	ex	de,hl
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00116$:
;src/main.c:196: if(p.atk >= 21)
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;src/main.c:232: if(p.atk < 20)
	ld	a,e
	sub	a, #0x14
	ld	a,d
	sbc	a, #0x00
	jr	NC,00121$
;src/main.c:233: drawFatiga(p.atk,memptr,2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
	jr	00122$
00121$:
;src/main.c:234: else if(p.atk > 20)
	ld	a,#0x14
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jr	NC,00118$
;src/main.c:235: drawFatiga(p.atk,memptr,16);
	ld	a,#0x10
	push	af
	inc	sp
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
	jr	00122$
00118$:
;src/main.c:237: drawFatiga(p.atk,memptr,0);
	xor	a, a
	push	af
	inc	sp
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
00122$:
;src/main.c:239: p.prevX = p.x;
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	ld	(hl),a
;src/main.c:240: p.prevY = p.y;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	a,(hl)
	ld	l,-45 (ix)
	ld	h,-44 (ix)
	ld	(hl),a
;src/main.c:241: p.prevAtk = p.atk;
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:243: if(p.col != 2){
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00370$
	or	a,h
	jp	Z,00167$
00370$:
;src/main.c:244: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:245: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-14 (ix),l
;src/main.c:196: if(p.atk >= 21)
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	a,(hl)
	ld	-16 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-15 (ix),a
;src/main.c:232: if(p.atk < 20)
	ld	a,-16 (ix)
	sub	a, #0x14
	ld	a,-15 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	-17 (ix),a
;src/main.c:249: p.atk += 1;
	ld	a,-16 (ix)
	add	a, #0x01
	ld	-19 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
;src/main.c:245: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	a,-14 (ix)
	or	a, a
	jr	Z,00161$
	ld	a,-17 (ix)
	or	a, a
	jr	NZ,00161$
;src/main.c:246: if(p.atk >= 50)
	ld	a,-16 (ix)
	sub	a, #0x32
	ld	a,-15 (ix)
	sbc	a, #0x00
	jr	C,00124$
;src/main.c:247: p.atk = 0;
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jr	00125$
00124$:
;src/main.c:249: p.atk += 1;
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	a,-19 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-18 (ix)
	ld	(hl),a
00125$:
;src/main.c:250: if(cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00129$
;src/main.c:251: p.dir = 0;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00168$
00129$:
;src/main.c:252: else if(cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00168$
;src/main.c:253: p.dir = 1;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00168$
00161$:
;src/main.c:255: if(p.atk < 20)
	ld	a,-17 (ix)
	or	a, a
	jr	Z,00132$
;src/main.c:256: p.atk += 1;
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	a,-19 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-18 (ix)
	ld	(hl),a
	jr	00133$
00132$:
;src/main.c:258: p.atk = 20;
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
00133$:
;src/main.c:259: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00157$
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00157$
;src/main.c:260: if(p.col != 2)
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00371$
	or	a,h
	jr	Z,00135$
00371$:
;src/main.c:261: p.x += 1;
	inc	d
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),d
00135$:
;src/main.c:262: p.dir = 0;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00168$
00157$:
;src/main.c:263: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00153$
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	d,(hl)
	ld	a,d
	or	a, a
	jr	Z,00153$
;src/main.c:264: if(p.col != 2)
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00372$
	or	a,h
	jr	Z,00137$
00372$:
;src/main.c:265: p.x -= 1;
	dec	d
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),d
00137$:
;src/main.c:266: p.dir = 1;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00168$
00153$:
;src/main.c:267: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00149$
;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	d,(hl)
;src/main.c:267: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	a,d
	sub	a, #0xB8
	jr	NC,00149$
;src/main.c:268: p.y += 2;
	inc	d
	inc	d
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	(hl),d
;src/main.c:269: p.dir = 2;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
	jp	00168$
00149$:
;src/main.c:270: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00145$
;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	a,(hl)
;src/main.c:270: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	or	a, a
	jr	Z,00145$
;src/main.c:271: p.y -= 2;
	add	a,#0xFE
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	(hl),a
;src/main.c:272: p.dir = 3;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
	jp	00168$
00145$:
;src/main.c:273: }else if(cpct_isKeyPressed(Key_X) && pr.vivo == 1){
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00141$
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00141$
	ld	a,h
	or	a, a
	jr	NZ,00141$
;src/main.c:274: pr.vivo = 0;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:275: pr.dir = p.dir;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:276: pr.x = p.x+4;
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	add	a, #0x04
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/main.c:277: pr.y = p.y+8;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	a,(hl)
	add	a, #0x08
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
	jr	00168$
00141$:
;src/main.c:278: }else  if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00168$
;src/main.c:279: return;
	jp	00200$
00167$:
;src/main.c:283: p.x -= 2;
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),a
;src/main.c:284: p.rebote -= 2;
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	de
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:285: if(p.rebote == 0){
	ld	a,d
	or	a,e
	jr	NZ,00168$
;src/main.c:286: p.rebote = 6;
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;src/main.c:287: p.col = 0;
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00168$:
;src/main.c:292: sprite = checkSprite(p.atk,p.dir);
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_checkSprite
	pop	af
	pop	af
	inc	sp
	inc	sp
	push	hl
;src/main.c:294: if(pr.vivo == 0){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix), a
	or	a,-19 (ix)
	jp	NZ,00187$
;src/main.c:295: pr.prevX = pr.x;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,-19 (ix)
	ld	(hl),a
;src/main.c:296: pr.prevY = pr.y;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,-19 (ix)
	ld	(hl),a
;src/main.c:297: switch((int)pr.dir){
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	bit	7, -18 (ix)
	jp	NZ,00187$
	ld	a,#0x03
	cp	a, -19 (ix)
	ld	a,#0x00
	sbc	a, -18 (ix)
	jp	PO, 00375$
	xor	a, #0x80
00375$:
	jp	M,00187$
	ld	e,-19 (ix)
	ld	d,#0x00
	ld	hl,#00376$
	add	hl,de
	add	hl,de
;src/main.c:298: case 0:
	jp	(hl)
00376$:
	jr	00169$
	jr	00173$
	jr	00177$
	jr	00181$
00169$:
;src/main.c:299: if(pr.x<72)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x48
	jr	NC,00171$
;src/main.c:300: pr.x++;
	inc	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
	jr	00187$
00171$:
;src/main.c:302: pr.vivo = 1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:303: break;
	jr	00187$
;src/main.c:304: case 1:
00173$:
;src/main.c:305: if(pr.x > 0)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00175$
;src/main.c:306: pr.x--;
	add	a,#0xFF
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
	jr	00187$
00175$:
;src/main.c:308: pr.vivo = 1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:309: break;
	jr	00187$
;src/main.c:310: case 2:
00177$:
;src/main.c:224: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
;src/main.c:311: if(pr.y < 192)
	ld	a,d
	sub	a, #0xC0
	jr	NC,00179$
;src/main.c:312: pr.y+=2;
	inc	d
	inc	d
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),d
	jr	00187$
00179$:
;src/main.c:314: pr.vivo = 1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:315: break;
	jr	00187$
;src/main.c:316: case 3:
00181$:
;src/main.c:224: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
;src/main.c:317: if(pr.y > 0)
	or	a, a
	jr	Z,00183$
;src/main.c:318: pr.y-=2;
	add	a,#0xFE
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
	jr	00187$
00183$:
;src/main.c:320: pr.vivo = 1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:322: }
00187$:
;src/main.c:325: if(p.col != 2 && e.vivo == 0){
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00377$
	or	a,h
	jp	Z,00193$
00377$:
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	d,(hl)
	inc	hl
	ld	a, (hl)
	or	a,d
	jp	NZ,00193$
;src/main.c:326: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	e,(hl)
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	a,(hl)
	ld	-17 (ix),a
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	a,(hl)
	ld	-16 (ix),a
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	d,(hl)
	push	bc
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	ld	a,-17 (ix)
	push	af
	inc	sp
	ld	a,-16 (ix)
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
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:327: if(p.col == 2)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00189$
	or	a,e
	jr	NZ,00189$
;src/main.c:328: p.life--;
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
00189$:
;src/main.c:329: if(p.life == 0)
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	d,(hl)
	inc	hl
	ld	a, (hl)
	or	a,d
;src/main.c:330: return;
	jr	Z,00200$
00193$:
;src/main.c:332: if(p.col == 1)
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jp	NZ,00198$
	ld	a,h
	or	a, a
	jp	NZ,00198$
;src/main.c:333: e.vivo = 1;
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00198$
00200$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:340: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:342: init();
	call	_init
;src/main.c:345: while(1){
00102$:
;src/main.c:346: menu();
	call	_menu
;src/main.c:347: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
