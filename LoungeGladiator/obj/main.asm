;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Sun Oct  4 18:22:27 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
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
;src/main.c:43: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:44: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:45: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:46: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:47: cpct_setPalette(g_palette,4);
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
;src/main.c:51: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:53: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:55: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:56: cpct_drawStringM0("Super Menu",memptr,2,3);
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
;src/main.c:58: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:59: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:61: do{
00101$:
;src/main.c:62: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:63: }while(!cpct_isKeyPressed(Key_Enter));
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
;src/main.c:68: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:71: if(eX - pX > -1 && eX - pX < 11)
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
;src/main.c:69: if(atk >= 21)
	ld	a,10 (ix)
	sub	a, #0x15
	ld	a,11 (ix)
	sbc	a, #0x00
	jr	C,00116$
;src/main.c:70: if(dir == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00110$
;src/main.c:71: if(eX - pX > -1 && eX - pX < 11)
	ld	a,#0xFF
	cp	a, e
	sbc	a, d
	jp	PO, 00152$
	xor	a, #0x80
00152$:
	jp	P,00102$
	ld	a,e
	sub	a, #0x0B
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
;src/main.c:72: return 1;
	ld	hl,#0x0001
	jr	00118$
00102$:
;src/main.c:74: return 0;
	ld	hl,#0x0000
	jr	00118$
00110$:
;src/main.c:76: if(pX - eX > -1 && pX - eX < 11)
	cp	a, a
	sbc	hl, bc
	ld	a,#0xFF
	cp	a, l
	sbc	a, h
	jp	PO, 00153$
	xor	a, #0x80
00153$:
	jp	P,00106$
	ld	de, #0x800B
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	NC,00106$
;src/main.c:77: return 1;
	ld	hl,#0x0001
	jr	00118$
00106$:
;src/main.c:79: return 0;
	ld	hl,#0x0000
	jr	00118$
00116$:
;src/main.c:81: if(eX - pX > 0 && eX - pX < 4)
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00154$
	xor	a, #0x80
00154$:
	jp	P,00117$
	ld	a,e
	sub	a, #0x04
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00117$
;src/main.c:82: return 2;
	ld	hl,#0x0002
	jr	00118$
00117$:
;src/main.c:84: return 0;
	ld	hl,#0x0000
00118$:
	pop	ix
	ret
;src/main.c:87: u8* checkSprite(u8* atk, u8* dir){
;	---------------------------------
; Function checkSprite
; ---------------------------------
_checkSprite::
;src/main.c:88: if(atk <= 20)
	ld	a,#0x14
	ld	iy,#2
	add	iy,sp
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jr	C,00108$
;src/main.c:89: if(dir == 0)
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00102$
;src/main.c:90: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
00102$:
;src/main.c:92: return gladis_quieto_izda;
	ld	hl,#_gladis_quieto_izda
	ret
00108$:
;src/main.c:93: else if(dir == 0){
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00105$
;src/main.c:94: return gladis_atk_dcha;
	ld	hl,#_gladis_atk_dcha
	ret
00105$:
;src/main.c:96: return gladis_atk_izda;
	ld	hl,#_gladis_atk_izda
	ret
;src/main.c:102: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-37
	add	hl,sp
	ld	sp,hl
;src/main.c:103: TPlayer p = { 0,100,20,0,0,6 };
	ld	hl,#0x0003
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0003
	add	hl,sp
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,-8 (ix)
	add	a, #0x01
	ld	-4 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x64
	ld	a,-8 (ix)
	add	a, #0x02
	ld	-2 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
	ld	a,-8 (ix)
	add	a, #0x04
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-8 (ix)
	add	a, #0x06
	ld	-16 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,-8 (ix)
	add	a, #0x08
	ld	-18 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;src/main.c:104: TEnemy  e = { 55,100,0 };
	ld	hl,#0x0000
	add	hl,sp
	ld	(hl),#0x37
	ld	hl,#0x0000
	add	hl,sp
	ld	-20 (ix),l
	ld	-19 (ix),h
	ld	a,-20 (ix)
	add	a, #0x01
	ld	-14 (ix),a
	ld	a,-19 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x64
	ld	a,-20 (ix)
	add	a, #0x02
	ld	-10 (ix),a
	ld	a,-19 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x00
;src/main.c:109: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:111: while (1){
00151$:
;src/main.c:114: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:117: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:118: if(p.atk <= 20)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:118: if(p.atk <= 20)
	ld	a,#0x14
	cp	a, b
	ld	a,#0x00
	sbc	a, h
	jr	C,00102$
;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
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
;src/main.c:121: cpct_drawSolidBox(memptr,0,5,16);
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
;src/main.c:123: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	b,(hl)
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:124: if(e.vivo == 0)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00105$
;src/main.c:125: cpct_drawSolidBox(memptr,0,4,16);
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
;src/main.c:128: if(p.col != 2){
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00247$
	or	a,h
	jp	Z,00138$
00247$:
;src/main.c:129: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:130: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-21 (ix),l
;src/main.c:118: if(p.atk <= 20)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
;src/main.c:130: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	a,-12 (ix)
	sub	a, #0x14
	ld	a,-11 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	-22 (ix),a
;src/main.c:134: p.atk += 1;
	ld	a,-12 (ix)
	add	a, #0x01
	ld	-24 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
;src/main.c:130: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
	ld	a,-21 (ix)
	or	a, a
	jr	Z,00132$
	ld	a,-22 (ix)
	or	a, a
	jr	NZ,00132$
;src/main.c:131: if(p.atk >= 50)
	ld	a,-12 (ix)
	sub	a, #0x32
	ld	a,-11 (ix)
	sbc	a, #0x00
	jr	C,00107$
;src/main.c:132: p.atk = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jr	00108$
00107$:
;src/main.c:134: p.atk += 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-24 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-23 (ix)
	ld	(hl),a
00108$:
;src/main.c:135: if(cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00112$
;src/main.c:136: p.dir = 0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00139$
00112$:
;src/main.c:137: else if(cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00139$
;src/main.c:138: p.dir = 1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jp	00139$
00132$:
;src/main.c:140: if(p.atk < 20)
	ld	a,-22 (ix)
	or	a, a
	jr	Z,00115$
;src/main.c:141: p.atk += 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-24 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-23 (ix)
	ld	(hl),a
	jr	00116$
00115$:
;src/main.c:143: p.atk = 20;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
00116$:
;src/main.c:144: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00128$
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00128$
;src/main.c:145: if(p.col != 2)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00248$
	or	a,h
	jr	Z,00118$
00248$:
;src/main.c:146: p.x += 1;
	inc	d
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),d
00118$:
;src/main.c:147: p.dir = 0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00139$
00128$:
;src/main.c:148: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00124$
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	ld	a,d
	or	a, a
	jr	Z,00124$
;src/main.c:149: if(p.col != 2)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a,#0x02
	jr	NZ,00249$
	or	a,h
	jr	Z,00120$
00249$:
;src/main.c:150: p.x -= 1;
	dec	d
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),d
00120$:
;src/main.c:151: p.dir = 1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jr	00139$
00124$:
;src/main.c:152: }else  if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00139$
;src/main.c:153: return;
	jp	00153$
00138$:
;src/main.c:157: p.x -= 2;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),a
;src/main.c:158: p.rebote -= 2;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	de
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:159: if(p.rebote == 0){
	ld	a,d
	or	a,e
	jr	NZ,00139$
;src/main.c:160: p.rebote = 6;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;src/main.c:161: p.col = 0;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00139$:
;src/main.c:166: sprite = checkSprite(p.atk,p.dir);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_checkSprite
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;src/main.c:168: if(p.col != 2 && e.vivo == 0)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00250$
	or	a,h
	jr	Z,00141$
00250$:
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00141$
;src/main.c:169: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-24 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-23 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	e,(hl)
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-22 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-21 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	push	bc
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	ld	a,-22 (ix)
	push	af
	inc	sp
	ld	a,-21 (ix)
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
	pop	bc
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
00141$:
;src/main.c:170: if(p.col == 1)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00144$
	ld	a,h
	or	a, a
	jr	NZ,00144$
;src/main.c:171: e.vivo = 1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x01
00144$:
;src/main.c:174: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ex	de,hl
;src/main.c:177: if(p.atk >= 21)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	inc	hl
	ld	l,(hl)
;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
;src/main.c:177: if(p.atk >= 21)
	sub	a, #0x15
	ld	a,l
	sbc	a, #0x00
	jr	C,00146$
;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	ld	hl,#0x1005
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00147$
00146$:
;src/main.c:180: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00147$:
;src/main.c:183: if(e.vivo == 0){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00151$
;src/main.c:184: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	d,(hl)
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:185: cpct_drawSolidBox(memptr, 18, 4, 16);
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
	jp	00151$
00153$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:192: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:194: init();
	call	_init
;src/main.c:197: while(1){
00102$:
;src/main.c:198: menu();
	call	_menu
;src/main.c:199: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
