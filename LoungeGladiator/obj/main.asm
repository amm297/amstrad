;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Tue Oct  6 17:18:25 2015
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
;src/main.c:49: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:50: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:51: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:52: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:53: cpct_setPalette(g_palette,4);
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
;src/main.c:57: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:59: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:61: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:62: cpct_drawStringM0("Super Menu",memptr,2,3);
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
;src/main.c:64: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:65: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:67: do{
00101$:
;src/main.c:68: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:69: }while(!cpct_isKeyPressed(Key_Enter));
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
;src/main.c:74: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk, u8 mode){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:75: u8 popX = pX + 4;
	ld	l,4 (ix)
	inc	l
	inc	l
	inc	l
	inc	l
;src/main.c:76: u8 popY = pY + 16;
	ld	a,5 (ix)
	add	a, #0x10
	ld	-5 (ix),a
;src/main.c:77: u8 eopX = eX + 4;
	ld	c,6 (ix)
	inc	c
	inc	c
	inc	c
	inc	c
;src/main.c:78: u8 eopY = eY + 16;
	ld	a,7 (ix)
	add	a, #0x10
	ld	-6 (ix),a
;src/main.c:80: if(atk >= 21 && mode == 0){
	ld	a,10 (ix)
	sub	a, #0x15
	ld	a,11 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	e,a
	or	a, a
	jr	NZ,00102$
	ld	a,12 (ix)
	or	a, a
	jr	NZ,00102$
;src/main.c:81: popX += 2;
	inc	l
	inc	l
00102$:
;src/main.c:84: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
	ld	a,c
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
	ld	a,l
	sub	a, c
	ld	a,#0x00
	rla
	ld	-2 (ix),a
	ld	a,7 (ix)
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	-3 (ix),a
	ld	a,-5 (ix)
	sub	a, 7 (ix)
	ld	a,#0x00
	rla
	ld	c,a
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00108$
	ld	a,-3 (ix)
	or	a,a
	jr	NZ,00108$
;src/main.c:85: if(atk >= 21)
	or	a,c
	jr	NZ,00108$
	or	a,e
	jr	NZ,00105$
;src/main.c:86: return 1;
	ld	hl,#0x0001
	jp	00136$
00105$:
;src/main.c:88: return 2;
	ld	hl,#0x0002
	jp	00136$
00108$:
;src/main.c:90: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
	ld	a,6 (ix)
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-4 (ix),a
	ld	a,l
	sub	a, 6 (ix)
	ld	a,#0x00
	rla
	ld	l,a
	ld	a,-4 (ix)
	or	a,a
	jr	NZ,00116$
	or	a,l
	jr	NZ,00116$
	ld	a,-3 (ix)
	or	a,a
	jr	NZ,00116$
;src/main.c:91: if(atk >= 21)
	or	a,c
	jr	NZ,00116$
	or	a,e
	jr	NZ,00113$
;src/main.c:92: return 1;
	ld	hl,#0x0001
	jr	00136$
00113$:
;src/main.c:94: return 2;
	ld	hl,#0x0002
	jr	00136$
00116$:
;src/main.c:96: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
	ld	a,-6 (ix)
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	c,a
	ld	a,-5 (ix)
	sub	a, -6 (ix)
	ld	a,#0x00
	rla
	ld	h,a
	ld	a,-4 (ix)
	or	a,a
	jr	NZ,00124$
	or	a,l
	jr	NZ,00124$
	or	a,c
	jr	NZ,00124$
;src/main.c:97: if(atk >= 21)
	or	a,h
	jr	NZ,00124$
	or	a,e
	jr	NZ,00121$
;src/main.c:98: return 1;
	ld	hl,#0x0001
	jr	00136$
00121$:
;src/main.c:100: return 2;
	ld	hl,#0x0002
	jr	00136$
00124$:
;src/main.c:102: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00132$
	ld	a,-2 (ix)
	or	a,a
	jr	NZ,00132$
	or	a,c
	jr	NZ,00132$
;src/main.c:103: if(atk >= 21)
	or	a,h
	jr	NZ,00132$
	or	a,e
	jr	NZ,00129$
;src/main.c:104: return 1;
	ld	hl,#0x0001
	jr	00136$
00129$:
;src/main.c:106: return 2;
	ld	hl,#0x0002
	jr	00136$
00132$:
;src/main.c:108: return 0;
	ld	hl,#0x0000
00136$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:111: u8* checkSprite(u8* atk, u8* dir){
;	---------------------------------
; Function checkSprite
; ---------------------------------
_checkSprite::
;src/main.c:112: if(atk <= 20)
	ld	a,#0x14
	ld	iy,#2
	add	iy,sp
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jr	C,00110$
;src/main.c:113: switch((int)dir){
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
;src/main.c:114: case 0:
	jp	(hl)
00131$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:115: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:117: case 1:
00102$:
;src/main.c:118: return gladis_quieto_izda;
	ld	hl,#_gladis_quieto_izda
	ret
;src/main.c:120: case 2:
00103$:
;src/main.c:121: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
;src/main.c:123: case 3:
00104$:
;src/main.c:124: return gladis_arriba_dcha;
	ld	hl,#_gladis_arriba_dcha
	ret
;src/main.c:125: }
00110$:
;src/main.c:126: else if(dir == 0){
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00107$
;src/main.c:127: return gladis_atk_dcha;
	ld	hl,#_gladis_atk_dcha
	ret
00107$:
;src/main.c:129: return gladis_atk_izda;
	ld	hl,#_gladis_atk_izda
	ret
;src/main.c:133: u8* checkSpriteFlecha(u8* dir){
;	---------------------------------
; Function checkSpriteFlecha
; ---------------------------------
_checkSpriteFlecha::
;src/main.c:134: switch((int)dir){
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
;src/main.c:135: case 0:
	jp	(hl)
00117$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:136: return flecha_dcha;
	ld	hl,#_flecha_dcha
	ret
;src/main.c:138: case 1:
00102$:
;src/main.c:139: return flecha_izda;
	ld	hl,#_flecha_izda
	ret
;src/main.c:141: case 2:
00103$:
;src/main.c:142: return flecha_abajo;
	ld	hl,#_flecha_abajo
	ret
;src/main.c:144: case 3:
00104$:
;src/main.c:145: return flecha_arriba;
	ld	hl,#_flecha_arriba
;src/main.c:147: }
	ret
;src/main.c:151: void drawFatiga(u8* atk, u8* memptr, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:152: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	NC,00102$
;src/main.c:153: col = 2;
	ld	8 (ix),#0x02
00102$:
;src/main.c:154: if(atk > 30 || atk <= 20){
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
;src/main.c:155: memptr = cpct_getScreenPtr(VMEM,4,160);
	push	de
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:156: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:158: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jr	C,00106$
	ld	a,d
	or	a, a
	jr	NZ,00107$
00106$:
;src/main.c:159: memptr = cpct_getScreenPtr(VMEM,7,160);
	push	de
	ld	hl,#0xA007
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:160: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:162: if(atk <= 20){
	ld	a,d
	or	a, a
	jr	NZ,00111$
;src/main.c:163: memptr = cpct_getScreenPtr(VMEM,10,160);
	ld	hl,#0xA00A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:164: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:169: void drawVida(u8* life, u8* memptr){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:170: if(life >= 1){
	ld	a,4 (ix)
	sub	a, #0x01
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00102$
;src/main.c:171: memptr = cpct_getScreenPtr(VMEM,55,160);
	ld	hl,#0xA037
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:172: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
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
;src/main.c:174: memptr = cpct_getScreenPtr(VMEM,60,160);
	ld	hl,#0xA03C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:172: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ld	c,l
	ld	b,h
;src/main.c:175: if(life >= 2)
	ld	a,4 (ix)
	sub	a, #0x02
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00104$
;src/main.c:176: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00105$
00104$:
;src/main.c:178: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	de,#_corazon_roto
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
;src/main.c:179: memptr = cpct_getScreenPtr(VMEM,65,160);
	ld	hl,#0xA041
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:172: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	6 (ix),l
	ld	7 (ix),h
	ex	de,hl
;src/main.c:180: if(life >= 3)
	ld	a,4 (ix)
	sub	a, #0x03
	ld	a,5 (ix)
	sbc	a, #0x00
	jr	C,00107$
;src/main.c:181: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	bc,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00109$
00107$:
;src/main.c:183: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	bc,#_corazon_roto+0
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00109$:
	pop	ix
	ret
;src/main.c:189: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-77
	add	hl,sp
	ld	sp,hl
;src/main.c:190: TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
	ld	hl,#0x000C
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x000C
	add	hl,sp
	ld	-19 (ix),l
	ld	-18 (ix),h
	ld	a,-19 (ix)
	add	a, #0x01
	ld	-39 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-38 (ix),a
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),#0x64
	ld	a,-19 (ix)
	add	a, #0x02
	ld	-6 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
	ld	a,-19 (ix)
	add	a, #0x03
	ld	-33 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-32 (ix),a
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	(hl),#0x64
	ld	a,-19 (ix)
	add	a, #0x04
	ld	-13 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-19 (ix)
	add	a, #0x06
	ld	-15 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-19 (ix)
	add	a, #0x08
	ld	-41 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-40 (ix),a
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-19 (ix)
	add	a, #0x0A
	ld	-17 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-19 (ix)
	add	a, #0x0C
	ld	-4 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;src/main.c:191: TEnemy  e = { 55,100,55,100,0,1 };
	ld	hl,#0x001A
	add	hl,sp
	ld	(hl),#0x37
	ld	hl,#0x001A
	add	hl,sp
	ld	-43 (ix),l
	ld	-42 (ix),h
	ld	a,-43 (ix)
	add	a, #0x01
	ld	-21 (ix),a
	ld	a,-42 (ix)
	adc	a, #0x00
	ld	-20 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	(hl),#0x64
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	inc	hl
	inc	hl
	ld	(hl),#0x37
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x64
	ld	a,-43 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	a,-42 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-43 (ix)
	add	a, #0x06
	ld	l,a
	ld	a,-42 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:192: TEnemy pr = { 0,0,0,0,1,0 };
	ld	hl,#0x0004
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0004
	add	hl,sp
	ld	-27 (ix),l
	ld	-26 (ix),h
	ld	a,-27 (ix)
	add	a, #0x01
	ld	-11 (ix),a
	ld	a,-26 (ix)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x00
	ld	a,-27 (ix)
	add	a, #0x02
	ld	-29 (ix),a
	ld	a,-26 (ix)
	adc	a, #0x00
	ld	-28 (ix),a
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	(hl),#0x00
	ld	a,-27 (ix)
	add	a, #0x03
	ld	-31 (ix),a
	ld	a,-26 (ix)
	adc	a, #0x00
	ld	-30 (ix),a
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	(hl),#0x00
	ld	a,-27 (ix)
	add	a, #0x04
	ld	-23 (ix),a
	ld	a,-26 (ix)
	adc	a, #0x00
	ld	-22 (ix),a
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	a,-27 (ix)
	add	a, #0x06
	ld	-25 (ix),a
	ld	a,-26 (ix)
	adc	a, #0x00
	ld	-24 (ix),a
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;src/main.c:194: u8* sprite = gladis_quieto_dcha;
	ld	-77 (ix),#<(_gladis_quieto_dcha)
	ld	-76 (ix),#>(_gladis_quieto_dcha)
;src/main.c:197: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:199: while (1){
00195$:
;src/main.c:202: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:205: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	b,(hl)
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-74 (ix),h
	ld	-75 (ix), l
	ld	-8 (ix), l
	ld	a,-74 (ix)
	ld	-7 (ix),a
;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
	ld	hl,#0x1004
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:208: if(e.vivo == 0){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix), a
	or	a,-8 (ix)
	jr	NZ,00102$
;src/main.c:209: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	a,(hl)
	ld	-8 (ix),a
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
	ld	h,-8 (ix)
	ld	l,-9 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-7 (ix),h
	ld	-8 (ix),l
;src/main.c:210: cpct_drawSolidBox(memptr, 18, 4, 16);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x12
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00102$:
;src/main.c:214: memptr = cpct_getScreenPtr(VMEM,pr.prevX,pr.prevY);
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	b,(hl)
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-7 (ix),h
	ld	-8 (ix),l
;src/main.c:215: if((int)pr.dir < 2)
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-34 (ix),a
;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:215: if((int)pr.dir < 2)
	ld	a,-35 (ix)
	sub	a, #0x02
	ld	a,-34 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00104$
;src/main.c:216: cpct_drawSolidBox(memptr, 0, 4, 4);
	ld	hl,#0x0404
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	jr	00105$
00104$:
;src/main.c:218: cpct_drawSolidBox(memptr, 0, 2, 8);
	ld	hl,#0x0802
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00105$:
;src/main.c:220: if(pr.vivo == 0){
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-34 (ix), a
	or	a,-35 (ix)
	jp	NZ,00110$
;src/main.c:221: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
	ld	h,-35 (ix)
	ld	l,-9 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-34 (ix),h
	ld	-35 (ix), l
	ld	-75 (ix), l
	ld	a,-34 (ix)
	ld	-74 (ix),a
;src/main.c:215: if((int)pr.dir < 2)
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-34 (ix),a
;src/main.c:222: if((int)pr.dir < 2)
	ld	a,-35 (ix)
	ld	-8 (ix),a
	ld	a,-34 (ix)
	ld	-7 (ix),a
;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
	ld	a,-75 (ix)
	ld	-37 (ix),a
	ld	a,-74 (ix)
	ld	-36 (ix),a
;src/main.c:222: if((int)pr.dir < 2)
	ld	a,-8 (ix)
	sub	a, #0x02
	ld	a,-7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00107$
;src/main.c:223: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 4, 4);
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	push	hl
	call	_checkSpriteFlecha
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	hl,#0x0404
	push	hl
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSpriteMasked
	jr	00110$
00107$:
;src/main.c:225: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 2, 8);
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	push	hl
	call	_checkSpriteFlecha
	pop	af
	ex	de,hl
	ld	hl,#0x0802
	push	hl
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	push	hl
	push	de
	call	_cpct_drawSpriteMasked
00110$:
;src/main.c:229: memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	b,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-36 (ix),h
	ld	-37 (ix),l
;src/main.c:230: if(p.prevAtk <= 20)
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-34 (ix),a
;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
	ld	e,-37 (ix)
	ld	d,-36 (ix)
;src/main.c:230: if(p.prevAtk <= 20)
	ld	a,#0x14
	cp	a, -35 (ix)
	ld	a,#0x00
	sbc	a, -34 (ix)
	jr	C,00112$
;src/main.c:231: cpct_drawSolidBox(memptr,0,4,16);
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
	jr	00113$
00112$:
;src/main.c:233: cpct_drawSolidBox(memptr,0,5,16);
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
00113$:
;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	b,(hl)
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:237: if(p.atk >= 21)
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a, (hl)
	inc	hl
	ld	l,(hl)
	ld	h,a
;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:238: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	pop	de
	push	de
;src/main.c:237: if(p.atk >= 21)
	ld	a,h
	sub	a, #0x15
	ld	a,l
	sbc	a, #0x00
	jr	C,00115$
;src/main.c:238: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	ld	hl,#0x1005
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00116$
00115$:
;src/main.c:240: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00116$:
;src/main.c:243: memptr = cpct_getScreenPtr(VMEM,60,160);
	ld	hl,#0xA03C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:244: cpct_drawSolidBox(memptr,0,10,16);
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
;src/main.c:246: drawVida(p.life, memptr);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	bc
	push	de
	call	_drawVida
	pop	af
	pop	af
	pop	bc
;src/main.c:237: if(p.atk >= 21)
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;src/main.c:249: if(p.atk < 20)
	ld	a,e
	sub	a, #0x14
	ld	a,d
	sbc	a, #0x00
	jr	NC,00121$
;src/main.c:250: drawFatiga(p.atk,memptr,2);
	ld	a,#0x02
	push	af
	inc	sp
	push	bc
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
	jr	00122$
00121$:
;src/main.c:251: else if(p.atk > 20)
	ld	a,#0x14
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jr	NC,00118$
;src/main.c:252: drawFatiga(p.atk,memptr,16);
	ld	a,#0x10
	push	af
	inc	sp
	push	bc
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
	jr	00122$
00118$:
;src/main.c:254: drawFatiga(p.atk,memptr,0);
	xor	a, a
	push	af
	inc	sp
	push	bc
	push	de
	call	_drawFatiga
	pop	af
	pop	af
	inc	sp
00122$:
;src/main.c:256: p.prevX = p.x;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/main.c:257: p.prevY = p.y;
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	(hl),a
;src/main.c:258: p.prevAtk = p.atk;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:261: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:262: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-37 (ix),l
;src/main.c:237: if(p.atk >= 21)
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-34 (ix),a
;src/main.c:249: if(p.atk < 20)
	ld	a,-35 (ix)
	sub	a, #0x14
	ld	a,-34 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	-9 (ix),a
;src/main.c:266: p.atk += 1;
	ld	a,-35 (ix)
	add	a, #0x01
	ld	-8 (ix),a
	ld	a,-34 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;src/main.c:262: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	a,-37 (ix)
	or	a, a
	jr	Z,00161$
	ld	a,-9 (ix)
	or	a, a
	jr	NZ,00161$
;src/main.c:263: if(p.atk >= 50)
	ld	a,-35 (ix)
	sub	a, #0x32
	ld	a,-34 (ix)
	sbc	a, #0x00
	jr	C,00124$
;src/main.c:264: p.atk = 0;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jr	00125$
00124$:
;src/main.c:266: p.atk += 1;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,-8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-7 (ix)
	ld	(hl),a
00125$:
;src/main.c:267: if(cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00129$
;src/main.c:268: p.dir = 0;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00162$
00129$:
;src/main.c:269: else if(cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00162$
;src/main.c:270: p.dir = 1;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00162$
00161$:
;src/main.c:272: if(p.atk < 20)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00132$
;src/main.c:273: p.atk += 1;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,-8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-7 (ix)
	ld	(hl),a
	jr	00133$
00132$:
;src/main.c:275: p.atk = 20;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
00133$:
;src/main.c:276: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00157$
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	-37 (ix), a
	sub	a, #0x4C
	jr	NC,00157$
;src/main.c:277: if(p.col != 2)
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00363$
	or	a,h
	jr	Z,00135$
00363$:
;src/main.c:278: p.x += 1;
	ld	a,-37 (ix)
	inc	a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),a
00135$:
;src/main.c:279: p.dir = 0;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00162$
00157$:
;src/main.c:280: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00153$
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	-37 (ix), a
	or	a, a
	jr	Z,00153$
;src/main.c:281: if(p.col != 2)
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00364$
	or	a,h
	jr	Z,00137$
00364$:
;src/main.c:282: p.x -= 1;
	ld	d,-37 (ix)
	dec	d
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),d
00137$:
;src/main.c:283: p.dir = 1;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00162$
00153$:
;src/main.c:284: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00149$
;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	d,(hl)
;src/main.c:284: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
	ld	a,d
	sub	a, #0xB8
	jr	NC,00149$
;src/main.c:285: p.y += 2;
	inc	d
	inc	d
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),d
;src/main.c:286: p.dir = 2;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
	jp	00162$
00149$:
;src/main.c:287: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00145$
;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
;src/main.c:287: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
	or	a, a
	jr	Z,00145$
;src/main.c:288: p.y -= 2;
	add	a,#0xFE
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),a
;src/main.c:289: p.dir = 3;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
	jr	00162$
00145$:
;src/main.c:290: }else if(cpct_isKeyPressed(Key_X) && pr.vivo == 1){
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00141$
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00141$
	ld	a,h
	or	a, a
	jr	NZ,00141$
;src/main.c:291: pr.vivo = 0;
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:292: pr.dir = p.dir;
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:293: pr.x = p.x+4;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	add	a, #0x04
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),a
;src/main.c:294: pr.y = p.y+8;
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	add	a, #0x08
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),a
	jr	00162$
00141$:
;src/main.c:295: }else  if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:296: return;
	jp	NZ,00197$
00162$:
;src/main.c:301: sprite = checkSprite(p.atk,p.dir);
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-13 (ix)
	ld	h,-12 (ix)
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
;src/main.c:303: if(pr.vivo == 0){
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	or	a,c
	jp	NZ,00184$
;src/main.c:304: pr.prevX = pr.x;
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	a,(hl)
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	(hl),a
;src/main.c:305: pr.prevY = pr.y;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	(hl),a
;src/main.c:306: switch((int)pr.dir){
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	bit	7, d
	jp	NZ,00180$
	ld	a,#0x03
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00367$
	xor	a, #0x80
00367$:
	jp	M,00180$
	ld	d,#0x00
	ld	hl,#00368$
	add	hl,de
	add	hl,de
;src/main.c:307: case 0:
	jp	(hl)
00368$:
	jr	00164$
	jr	00168$
	jr	00172$
	jr	00176$
00164$:
;src/main.c:308: if(pr.x<74)
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4A
	jr	NC,00166$
;src/main.c:309: pr.x++;
	inc	d
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),d
	jr	00180$
00166$:
;src/main.c:311: pr.vivo = 1;
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:312: break;
	jr	00180$
;src/main.c:313: case 1:
00168$:
;src/main.c:314: if(pr.x > 0)
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00170$
;src/main.c:315: pr.x--;
	add	a,#0xFF
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),a
	jr	00180$
00170$:
;src/main.c:317: pr.vivo = 1;
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:318: break;
	jr	00180$
;src/main.c:319: case 2:
00172$:
;src/main.c:221: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
;src/main.c:320: if(pr.y < 192)
	ld	a,d
	sub	a, #0xC0
	jr	NC,00174$
;src/main.c:321: pr.y+=2;
	inc	d
	inc	d
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),d
	jr	00180$
00174$:
;src/main.c:323: pr.vivo = 1;
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:324: break;
	jr	00180$
;src/main.c:325: case 3:
00176$:
;src/main.c:221: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
;src/main.c:326: if(pr.y > 0)
	or	a, a
	jr	Z,00178$
;src/main.c:327: pr.y-=2;
	add	a,#0xFE
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),a
	jr	00180$
00178$:
;src/main.c:329: pr.vivo = 1;
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:331: }
00180$:
;src/main.c:332: if(checkCollisions(pr.x,pr.y,e.x,e.y,pr.dir,21,1) == 1){
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	a,(hl)
	ld	-37 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-36 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	d,(hl)
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	ld	c,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	e,(hl)
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#0x0015
	push	hl
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	push	hl
	push	de
	inc	sp
	ld	d, c
	push	de
	ld	a,-35 (ix)
	push	af
	inc	sp
	call	_checkCollisions
	ld	iy,#9
	add	iy,sp
	ld	sp,iy
	dec	l
	jr	NZ,00184$
	ld	a,h
	or	a, a
	jr	NZ,00184$
;src/main.c:333: e.vivo = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;src/main.c:334: pr.vivo = 1;
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
00184$:
;src/main.c:338: if(p.col != 2 && e.vivo == 0){
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00371$
	or	a,h
	jp	Z,00190$
00371$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	inc	hl
	ld	a, (hl)
	or	a,d
	jp	NZ,00190$
;src/main.c:339: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk,0);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-37 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-36 (ix),a
	ld	l,-41 (ix)
	ld	h,-40 (ix)
	ld	a,(hl)
	ld	-35 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-34 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	d,(hl)
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	ld	e,(hl)
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	b,(hl)
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	c,(hl)
	xor	a, a
	push	af
	inc	sp
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	push	hl
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	push	hl
	push	de
	push	bc
	call	_checkCollisions
	ld	iy,#9
	add	iy,sp
	ld	sp,iy
	ld	d,l
	ld	e,h
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:340: if(p.col == 2){
	ld	a,d
	sub	a,#0x02
	jr	NZ,00190$
	or	a,e
	jr	NZ,00190$
;src/main.c:341: p.life--;
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
;src/main.c:342: p.x = 1;
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),#0x01
;src/main.c:343: p.y = 100;
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),#0x64
;src/main.c:344: p.col = 0;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:345: if(p.life == 0)
	ld	a,d
	or	a,e
;src/main.c:346: return;
	jr	Z,00197$
00190$:
;src/main.c:349: if(p.col == 1)
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jp	NZ,00195$
	ld	a,h
	or	a, a
	jp	NZ,00195$
;src/main.c:350: e.vivo = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00195$
00197$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:357: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:359: init();
	call	_init
;src/main.c:362: while(1){
00102$:
;src/main.c:363: menu();
	call	_menu
;src/main.c:364: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
