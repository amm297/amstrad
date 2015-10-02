;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Fri Oct  2 18:22:59 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _loadMap
	.globl _game
	.globl _checkColisions
	.globl _drawMap
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
	.globl _sprite
	.globl _scene
	.globl _g_palette
	.globl _mapa2
	.globl _mapa1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scene::
	.ds 6
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_sprite::
	.ds 2
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
;src/main.c:67: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:68: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:69: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:70: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:71: cpct_setPalette(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
	ret
_mapa1:
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
_mapa2:
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
_g_palette:
	.db #0x00	; 0
	.db #0x1A	; 26
	.db #0x06	; 6
	.db #0x12	; 18
;src/main.c:75: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:77: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:79: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:80: cpct_drawStringM0("MENU",memptr,2,3);
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
;src/main.c:82: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:83: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:85: do{
00101$:
;src/main.c:86: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:87: }while(!cpct_isKeyPressed(Key_Enter));
	ld	hl,#0x4000
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
	ret
___str_0:
	.ascii "MENU"
	.db 0x00
___str_1:
	.ascii "Pulsa Intro"
	.db 0x00
;src/main.c:93: void drawMap(int t){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:97: if(t == 1){ 
	ld	a,4 (ix)
	dec	a
	jr	NZ,00103$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00103$
;src/main.c:98: for(x=0;x<height;x++){
	ld	de,#0x0000
00111$:
;src/main.c:99: scene[x] = mapa1[x];
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-1 (ix),a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_mapa1
	add	hl,bc
	ld	b,l
	ld	c,h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),c
;src/main.c:98: for(x=0;x<height;x++){
	inc	de
	ld	a,e
	sub	a, #0x0A
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00111$
00103$:
;src/main.c:103: if(t == 2){ 
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00128$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00128$
;src/main.c:104: for(x=0;x<height;x++){
	ld	bc,#0x0000
00113$:
;src/main.c:105: scene[x] = mapa2[x];
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	iy,#_scene
	ex	de,hl
	add	iy, de
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,#_mapa2
	add	hl,de
	ld	0 (iy),l
	ld	1 (iy),h
;src/main.c:104: for(x=0;x<height;x++){
	inc	bc
	ld	a,c
	sub	a, #0x0A
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00113$
;src/main.c:109: for(posY=0; posY<height;posY++){
00128$:
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;src/main.c:110: for(posX=0; posX<width;posX++){
00126$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-1 (ix),a
	ld	de,#0x0000
00115$:
;src/main.c:111: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
	ld	a,-4 (ix)
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	ld	b,a
	ld	c,e
	ld	a,c
	add	a, a
	add	a, a
	add	a, c
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	inc	sp
	inc	sp
	push	hl
;src/main.c:112: if(scene[posY][posX] == 1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl,bc
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
	djnz	00116$
	ld	a,h
	or	a, a
	jr	NZ,00116$
;src/main.c:113: cpct_drawSolidBox(memptr, 3, 5, 20);
	pop	bc
	push	bc
	push	de
	ld	hl,#0x1405
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
00116$:
;src/main.c:110: for(posX=0; posX<width;posX++){
	inc	de
	ld	a,e
	sub	a, #0x10
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00115$
;src/main.c:109: for(posY=0; posY<height;posY++){
	inc	-4 (ix)
	jr	NZ,00163$
	inc	-3 (ix)
00163$:
	ld	a,-4 (ix)
	sub	a, #0x0A
	ld	a,-3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00126$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:123: void checkColisions(u8 *x,u8 *y, u8 lx, u8 ly){
;	---------------------------------
; Function checkColisions
; ---------------------------------
_checkColisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/main.c:125: u8 *posX = x;
	ld	a,4 (ix)
	ld	-6 (ix),a
	ld	a,5 (ix)
	ld	-5 (ix),a
;src/main.c:126: u8 *posY = y;
	ld	a,6 (ix)
	ld	-8 (ix),a
	ld	a,7 (ix)
	ld	-7 (ix),a
;src/main.c:137: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
	pop	hl
	push	hl
	ld	e,(hl)
	push	de
	ld	d,#0x14
	push	de
	call	__divuchar
	pop	af
	pop	de
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_scene
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d,(hl)
	push	bc
	push	de
	ld	a,#0x05
	push	af
	inc	sp
	push	de
	inc	sp
	call	__divuchar
	pop	af
	pop	de
	pop	bc
	ld	h,#0x00
	add	hl, hl
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,bc
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	dec	l
	jr	NZ,00120$
	ld	a,h
	or	a, a
	jr	Z,00101$
00120$:
;src/main.c:138: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
	ld	l,d
	ld	h,#0x00
	inc	hl
	inc	hl
	inc	hl
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl,#0x0005
	push	hl
	push	iy
	call	__divsint
	pop	af
	pop	af
	pop	de
	pop	bc
	add	hl, hl
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	dec	c
	jr	NZ,00121$
	ld	a,h
	or	a, a
	jr	Z,00101$
00121$:
;src/main.c:139: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
	ld	d,#0x00
	ld	hl,#0x000E
	add	hl,de
	ld	bc,#0x0014
	push	bc
	push	hl
	call	__divsint
	pop	af
	pop	af
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,de
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
	djnz	00122$
	ld	a,h
	or	a, a
	jr	Z,00101$
00122$:
;src/main.c:140: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	dec	e
	jr	NZ,00106$
	ld	a,h
	or	a, a
	jr	NZ,00106$
00101$:
;src/main.c:144: *posX=lx;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:145: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:152: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/main.c:153: TPlayer p = { 0,100 };
	ld	hl,#0x0001
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0001
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0001
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x64
;src/main.c:155: int i =1;
	ld	de,#0x0001
;src/main.c:160: cpct_clearScreen(0);
	push	bc
	push	de
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
	ld	hl,#0x0001
	push	hl
	call	_drawMap
	pop	af
	pop	de
	pop	bc
;src/main.c:162: while (1){
	ld	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	ld	-3 (ix),a
	ld	-6 (ix),c
	ld	-5 (ix),b
00118$:
;src/main.c:165: cpct_waitVSYNC();
	push	bc
	push	de
	call	_cpct_waitVSYNC
	pop	de
	pop	bc
;src/main.c:168: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	push	af
	ld	a,(bc)
	ld	-7 (ix),a
	pop	af
	push	bc
	push	de
	push	af
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
;src/main.c:169: cpct_drawSolidBox(memptr,0,4,16);
	push	bc
	push	de
	ld	hl,#0x1004
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/main.c:174: lx = p.x;
	ld	a,(bc)
	ld	-10 (ix),a
;src/main.c:175: ly = p.y;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-13 (ix),a
;src/main.c:178: cpct_scanKeyboard_f();
	push	bc
	push	de
	call	_cpct_scanKeyboard_f
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00114$
	ld	a,(bc)
	ld	h,a
	sub	a, #0x4C
	jr	NC,00114$
;src/main.c:180: p.x += 1;
	ld	a,h
	inc	a
	ld	(bc),a
;src/main.c:181: sprite = gladis_quieto_dcha;
	ld	iy,#_sprite
	ld	0 (iy),#<(_gladis_quieto_dcha)
	ld	iy,#_sprite
	ld	1 (iy),#>(_gladis_quieto_dcha)
	jr	00115$
00114$:
;src/main.c:182: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	push	bc
	push	de
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00110$
	ld	a,(bc)
	or	a, a
	jr	Z,00110$
;src/main.c:183: p.x -= 1;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:184: sprite = gladis_quieto_izda;
	ld	iy,#_sprite
	ld	0 (iy),#<(_gladis_quieto_izda)
	ld	iy,#_sprite
	ld	1 (iy),#>(_gladis_quieto_izda)
	jr	00115$
00110$:
;src/main.c:185: }else  if(cpct_isKeyPressed(Key_Esc)){
	push	bc
	push	de
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
;src/main.c:186: return;
	jp	NZ,00120$
;src/main.c:187: }else if(cpct_isKeyPressed(Key_Space)){
	push	bc
	push	de
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00115$
;src/main.c:188: cpct_clearScreen(0);
	push	bc
	push	de
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
	pop	de
	pop	bc
;src/main.c:189: if(i ==1 ) {i++;}
	ld	a,e
	dec	a
	jr	NZ,00102$
	ld	a,d
	or	a, a
	jr	NZ,00102$
	inc	de
	jr	00103$
00102$:
;src/main.c:190: else {i--;}
	dec	de
00103$:
;src/main.c:191: drawMap(i);
	push	bc
	push	de
	push	de
	call	_drawMap
	pop	af
	pop	de
	pop	bc
00115$:
;src/main.c:195: checkColisions(&p.x,&p.y,lx,ly);
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	pop	iy
	pop	hl
	ld	a,-6 (ix)
	ld	-9 (ix),a
	ld	a,-5 (ix)
	ld	-8 (ix),a
	push	bc
	push	de
	ld	h,-13 (ix)
	ld	l,-10 (ix)
	push	hl
	push	iy
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_checkColisions
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
	pop	bc
;src/main.c:198: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	push	af
	ld	a,(bc)
	ld	-9 (ix),a
	pop	af
	push	bc
	push	de
	push	af
	inc	sp
	ld	a,-9 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/main.c:199: cpct_drawSpriteMasked(sprite,memptr,4,16);
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	iy,(_sprite)
	push	bc
	push	de
	ld	hl,#0x1004
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	push	iy
	call	_cpct_drawSpriteMasked
	pop	de
	pop	bc
	jp	00118$
00120$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:210: void loadMap(){
;	---------------------------------
; Function loadMap
; ---------------------------------
_loadMap::
;src/main.c:212: }
	ret
;src/main.c:217: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:219: init();
	call	_init
;src/main.c:223: while(1){
00102$:
;src/main.c:224: menu();
	call	_menu
;src/main.c:226: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
__xinit__sprite:
	.dw _gladis_quieto_dcha
	.area _CABS (ABS)
