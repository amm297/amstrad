;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Fri Oct  2 10:07:54 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _drawMap
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
	.globl _mapa
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
;src/main.c:58: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:59: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:60: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:61: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:62: cpct_setPalette(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
	ret
_mapa:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_palette:
	.db #0x00	; 0
	.db #0x1A	; 26
	.db #0x06	; 6
	.db #0x12	; 18
;src/main.c:66: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:68: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:70: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:71: cpct_drawStringM0("Super Menu",memptr,2,3);
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
;src/main.c:73: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:74: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:76: do{
00101$:
;src/main.c:77: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:78: }while(!cpct_isKeyPressed(Key_Enter));
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
;src/main.c:83: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:86: if(eX - pX > -1 && eX - pX < 11)
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
;src/main.c:84: if(atk >= 21)
	ld	a,10 (ix)
	sub	a, #0x15
	ld	a,11 (ix)
	sbc	a, #0x00
	jr	C,00116$
;src/main.c:85: if(dir == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00110$
;src/main.c:86: if(eX - pX > -1 && eX - pX < 11)
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
;src/main.c:87: return 1;
	ld	hl,#0x0001
	jr	00118$
00102$:
;src/main.c:89: return 0;
	ld	hl,#0x0000
	jr	00118$
00110$:
;src/main.c:91: if(pX - eX > -1 && pX - eX < 11)
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
;src/main.c:92: return 1;
	ld	hl,#0x0001
	jr	00118$
00106$:
;src/main.c:94: return 0;
	ld	hl,#0x0000
	jr	00118$
00116$:
;src/main.c:96: if(eX - pX > 0 && eX - pX < 4)
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
;src/main.c:97: return 2;
	ld	hl,#0x0002
	jr	00118$
00117$:
;src/main.c:99: return 0;
	ld	hl,#0x0000
00118$:
	pop	ix
	ret
;src/main.c:102: u8* checkSprite(u8* atk, u8* dir){
;	---------------------------------
; Function checkSprite
; ---------------------------------
_checkSprite::
;src/main.c:103: if(atk <= 20)
	ld	a,#0x14
	ld	iy,#2
	add	iy,sp
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jr	C,00108$
;src/main.c:104: if(dir == 0)
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00102$
;src/main.c:105: return gladis_quieto_dcha;
	ld	hl,#_gladis_quieto_dcha
	ret
00102$:
;src/main.c:107: return gladis_quieto_izda;
	ld	hl,#_gladis_quieto_izda
	ret
00108$:
;src/main.c:108: else if(dir == 0){
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00105$
;src/main.c:109: return gladis_atk_dcha;
	ld	hl,#_gladis_atk_dcha
	ret
00105$:
;src/main.c:111: return gladis_atk_izda;
	ld	hl,#_gladis_atk_izda
	ret
;src/main.c:120: void drawMap(){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:124: for(posY=0; posY<height;posY++){
	ld	c,#0x00
	ld	e,#0x00
;src/main.c:125: for(posX=0; posX<width;posX++){
00112$:
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00105$:
;src/main.c:126: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
	push	bc
	push	de
	ld	a,e
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	inc	sp
	inc	sp
	push	hl
;src/main.c:127: if(mapa[posY][posX] == 1){
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_mapa)
	add	a, l
	ld	l,a
	ld	a,#>(_mapa)
	adc	a, h
	ld	h,a
	ld	a,l
	add	a, -2 (ix)
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	dec	a
	jr	NZ,00106$
;src/main.c:128: cpct_drawSolidBox(memptr, 3, 5, 20);
	ld	d,-4 (ix)
	ld	b,-3 (ix)
	push	bc
	push	de
	ld	hl,#0x1405
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	c,d
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
00106$:
;src/main.c:125: for(posX=0; posX<width;posX++){
	ld	a,-1 (ix)
	add	a, #0x05
	ld	-1 (ix),a
	inc	-2 (ix)
	ld	a,-2 (ix)
	sub	a, #0x10
	jr	C,00105$
;src/main.c:124: for(posY=0; posY<height;posY++){
	ld	a,e
	add	a, #0x14
	ld	e,a
	inc	c
	ld	a,c
	sub	a, #0x0A
	jr	C,00112$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:138: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-28
	add	hl,sp
	ld	sp,hl
;src/main.c:139: TPlayer p = { 0,100 };
	ld	hl,#0x0000
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0000
	add	hl,sp
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,-4 (ix)
	add	a, #0x01
	ld	-7 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x64
;src/main.c:140: TEnemy  e = { 55,100,0 };
	ld	hl,#0x0002
	add	hl,sp
	ld	(hl),#0x37
	ld	hl,#0x0002
	add	hl,sp
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x64
	ld	a,-2 (ix)
	add	a, #0x02
	ld	-15 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),#0x00
;src/main.c:143: u8* dir = 0;
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
;src/main.c:144: u8* atk = 20;
	ld	-19 (ix),#0x14
	ld	-18 (ix),#0x00
;src/main.c:145: u8* col = 0;
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
;src/main.c:146: u8* rebote = 6;
	ld	-23 (ix),#0x06
	ld	-22 (ix),#0x00
;src/main.c:148: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:149: drawMap();
	call	_drawMap
;src/main.c:150: while (1){
00154$:
;src/main.c:153: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:156: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	b,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:158: cpct_drawSolidBox(memptr,0,4,16);
	ld	c, l
	ld	b, h
;src/main.c:157: if(atk <= 20)
	ld	a,#0x14
	cp	a, -19 (ix)
	ld	a,#0x00
	sbc	a, -18 (ix)
	jr	C,00102$
;src/main.c:158: cpct_drawSolidBox(memptr,0,4,16);
	ld	hl,#0x1004
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	jr	00103$
00102$:
;src/main.c:160: cpct_drawSolidBox(memptr,0,5,16);
	ld	hl,#0x1005
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00103$:
;src/main.c:162: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:163: if(e.vivo == 0)
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00105$
;src/main.c:164: cpct_drawSolidBox(memptr,0,4,16);
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
;src/main.c:167: if(col != 2){
	ld	a,-21 (ix)
	sub	a, #0x02
	jr	NZ,00265$
	ld	a,-20 (ix)
	or	a, a
	jr	NZ,00265$
	ld	a,#0x01
	jr	00266$
00265$:
	xor	a,a
00266$:
	ld	-13 (ix), a
	or	a, a
	jp	NZ,00138$
;src/main.c:168: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:169: if(cpct_isKeyPressed(Key_Space) && atk >= 20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-8 (ix),l
	ld	a,-19 (ix)
	sub	a, #0x14
	ld	a,-18 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	-5 (ix),a
;src/main.c:173: atk += 1;
	ld	a,-19 (ix)
	add	a, #0x01
	ld	-12 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/main.c:169: if(cpct_isKeyPressed(Key_Space) && atk >= 20){
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00132$
	ld	a,-5 (ix)
	or	a, a
	jr	NZ,00132$
;src/main.c:170: if(atk >= 50)
	ld	a,-19 (ix)
	sub	a, #0x32
	ld	a,-18 (ix)
	sbc	a, #0x00
	jr	C,00107$
;src/main.c:171: atk = 0;
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
	jr	00108$
00107$:
;src/main.c:173: atk += 1;
	ld	a,-12 (ix)
	ld	-19 (ix),a
	ld	a,-11 (ix)
	ld	-18 (ix),a
00108$:
;src/main.c:174: if(cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00112$
;src/main.c:175: dir = 0;
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
	jp	00139$
00112$:
;src/main.c:176: else if(cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00139$
;src/main.c:177: dir = 1;
	ld	-17 (ix),#0x01
	ld	-16 (ix),#0x00
	jp	00139$
00132$:
;src/main.c:179: if(atk < 20)
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00115$
;src/main.c:180: atk += 1;
	ld	a,-12 (ix)
	ld	-19 (ix),a
	ld	a,-11 (ix)
	ld	-18 (ix),a
	jr	00116$
00115$:
;src/main.c:182: atk = 20;
	ld	-19 (ix),#0x14
	ld	-18 (ix),#0x00
00116$:
;src/main.c:183: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00128$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00128$
;src/main.c:184: if(col != 2)
	ld	a,-13 (ix)
	or	a, a
	jr	NZ,00118$
;src/main.c:185: p.x += 1;
	inc	d
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),d
00118$:
;src/main.c:186: dir = 0;
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
	jr	00139$
00128$:
;src/main.c:187: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00124$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	ld	a,d
	or	a, a
	jr	Z,00124$
;src/main.c:188: if(col != 2)
	ld	a,-13 (ix)
	or	a, a
	jr	NZ,00120$
;src/main.c:189: p.x -= 1;
	dec	d
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),d
00120$:
;src/main.c:190: dir = 1;
	ld	-17 (ix),#0x01
	ld	-16 (ix),#0x00
	jr	00139$
00124$:
;src/main.c:191: }else  if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00139$
;src/main.c:192: return;
	jp	00159$
00138$:
;src/main.c:196: p.x -= 2;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/main.c:197: rebote -= 2;
	ld	e,-23 (ix)
	ld	d,-22 (ix)
	dec	de
	dec	de
	ld	-23 (ix),e
	ld	-22 (ix),d
;src/main.c:198: if(rebote == 0){
	ld	a,d
	or	a,e
	jr	NZ,00139$
;src/main.c:199: rebote = 6;
	ld	-23 (ix),#0x06
	ld	-22 (ix),#0x00
;src/main.c:200: col = 0;
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
00139$:
;src/main.c:205: sprite = checkSprite(atk,dir);
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	call	_checkSprite
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;src/main.c:207: if(col != 2 && e.vivo == 0)
	ld	a,-21 (ix)
	sub	a, #0x02
	jr	NZ,00267$
	ld	a,-20 (ix)
	or	a, a
	jr	Z,00141$
00267$:
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00141$
;src/main.c:208: col = checkCollisions(p.x,p.y,e.x,e.y,dir,atk);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	push	bc
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	ld	a,-12 (ix)
	push	af
	inc	sp
	ld	a,-5 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_checkCollisions
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	-21 (ix),l
	ld	-20 (ix),h
00141$:
;src/main.c:209: if(col == 1)
	ld	a,-21 (ix)
	dec	a
	jr	NZ,00144$
	ld	a,-20 (ix)
	or	a, a
	jr	NZ,00144$
;src/main.c:210: e.vivo = 1;
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),#0x01
00144$:
;src/main.c:213: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:216: if(atk >= 21)
	ld	a,-19 (ix)
	sub	a, #0x15
	ld	a,-18 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	e,a
;src/main.c:158: cpct_drawSolidBox(memptr,0,4,16);
	ld	-12 (ix),l
	ld	-11 (ix),h
;src/main.c:217: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
;src/main.c:216: if(atk >= 21)
	ld	a,e
	or	a, a
	jr	NZ,00146$
;src/main.c:217: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	push	de
	ld	hl,#0x1005
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
	pop	de
	jr	00147$
00146$:
;src/main.c:219: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	push	de
	ld	hl,#0x1004
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
	pop	de
00147$:
;src/main.c:222: if(e.vivo == 0){
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ,00149$
;src/main.c:223: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	push	de
	ld	c, d
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:224: cpct_drawSolidBox(memptr, 18, 4, 16);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x1004
	push	hl
	ld	a,#0x12
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
00149$:
;src/main.c:227: memptr = cpct_getScreenPtr(VMEM, 6, 10);
	push	de
	ld	hl,#0x0A06
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:228: cpct_drawStringM0("FATIGA",memptr, 2, 0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
;src/main.c:230: if(atk >= 21)
	ld	a,e
;src/main.c:231: for(i=0; i<(*atk - 20)/10; i++){
	or	a,a
	jp	NZ,00154$
	ld	c,a
00157$:
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a, (hl)
	ld	e, #0x00
	add	a,#0xEC
	ld	l,a
	ld	a,e
	adc	a,#0xFF
	ld	h,a
	push	bc
	ld	de,#0x000A
	push	de
	push	hl
	call	__divsint
	pop	af
	pop	af
	pop	bc
	ld	d,c
	ld	e,#0x00
	ld	a,d
	sub	a, l
	ld	a,e
	sbc	a, h
	jp	PO, 00270$
	xor	a, #0x80
00270$:
	jp	P,00154$
;src/main.c:232: memptr = cpct_getScreenPtr(VMEM, 18+i*4, 10);
	ld	a,c
	add	a, a
	add	a, a
	add	a, #0x12
	ld	d,a
	push	bc
	ld	a,#0x0A
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/main.c:233: cpct_drawSolidBox(memptr, 18, 3, 10);
	ex	de,hl
	push	bc
	ld	hl,#0x0A03
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
;src/main.c:231: for(i=0; i<(*atk - 20)/10; i++){
	inc	c
	jr	00157$
00159$:
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "FATIGA"
	.db 0x00
;src/main.c:240: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:242: init();
	call	_init
;src/main.c:245: while(1){
00102$:
;src/main.c:246: menu();
	call	_menu
;src/main.c:247: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
