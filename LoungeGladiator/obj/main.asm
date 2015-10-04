;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Sun Oct  4 14:10:55 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _loadMap
	.globl _game
	.globl _create_Player
	.globl _checkKeyboard
	.globl _checkColisions
	.globl _drawPlayers
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
	.globl _calloc
	.globl __assert
	.globl _scene
	.globl _mapa2
	.globl _mapa1
	.globl _g_palette
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scene::
	.ds 20
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
;src/main.c:30: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:31: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:32: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:33: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:34: cpct_setPalette(g_palette,4);
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
;src/main.c:38: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:40: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:42: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:43: cpct_drawStringM0("MENU",memptr,2,3);
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
;src/main.c:45: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:46: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:48: do{
00101$:
;src/main.c:49: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:50: }while(!cpct_isKeyPressed(Key_Enter));
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
;src/main.c:56: void drawMap(int t){
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
;src/main.c:60: if(t == 1){ 
	ld	a,4 (ix)
	dec	a
	jr	NZ,00103$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00103$
;src/main.c:61: for(x=0;x<height;x++){
	ld	de,#0x0000
00111$:
;src/main.c:62: scene[x] = mapa1[x];
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
;src/main.c:61: for(x=0;x<height;x++){
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
;src/main.c:66: if(t == 2){ 
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00128$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00128$
;src/main.c:67: for(x=0;x<height;x++){
	ld	bc,#0x0000
00113$:
;src/main.c:68: scene[x] = mapa2[x];
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
;src/main.c:67: for(x=0;x<height;x++){
	inc	bc
	ld	a,c
	sub	a, #0x0A
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00113$
;src/main.c:72: for(posY=0; posY<height;posY++){
00128$:
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;src/main.c:73: for(posX=0; posX<width;posX++){
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
;src/main.c:74: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
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
;src/main.c:75: if(scene[posY][posX] == 1){
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
;src/main.c:76: cpct_drawSolidBox(memptr, 3, 5, 20);
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
;src/main.c:73: for(posX=0; posX<width;posX++){
	inc	de
	ld	a,e
	sub	a, #0x10
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00115$
;src/main.c:72: for(posY=0; posY<height;posY++){
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
;src/main.c:84: void drawPlayers(TPlayer *p,TPlayer *e){
;	---------------------------------
; Function drawPlayers
; ---------------------------------
_drawPlayers::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:86: if(p->life > 0){
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	a,4 (iy)
	or	a, a
	jr	Z,00102$
;src/main.c:87: memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
	ld	l, e
	ld	h, d
	inc	hl
	ld	b,(hl)
	ld	a,(de)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	c, l
	ld	b, h
;src/main.c:88: cpct_drawSpriteMasked(p->sprite,memptr,p->size,16);
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-1 (ix),a
	ex	de,hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x10
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00102$:
;src/main.c:90: if(e->life > 0 ){
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
	ld	a,4 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:91: memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
	ld	l, e
	ld	h, d
	inc	hl
	ld	b,(hl)
	ld	a,(de)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	c, l
	ld	b, h
;src/main.c:92: cpct_drawSpriteMasked(e->sprite,memptr,e->size,16);
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-1 (ix),a
	ex	de,hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x10
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
	inc	sp
	pop	ix
	ret
;src/main.c:99: void checkColisions(u8 *x,u8 *y, u8 lx, u8 ly){
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
;src/main.c:101: u8 *posX = x;
	ld	a,4 (ix)
	ld	-6 (ix),a
	ld	a,5 (ix)
	ld	-5 (ix),a
;src/main.c:102: u8 *posY = y;
	ld	a,6 (ix)
	ld	-8 (ix),a
	ld	a,7 (ix)
	ld	-7 (ix),a
;src/main.c:113: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
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
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:114: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
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
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
;src/main.c:115: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	add	hl,de
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
	djnz	00122$
	ld	a,h
	or	a, a
	jr	Z,00101$
00122$:
;src/main.c:116: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
;src/main.c:119: *posX=lx;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:120: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:127: u8* checkKeyboard(u8 *x, u8 *y,int *finish,u8 *s,u8 *dir,u8 *size){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:129: u8 *sprite = s;
	ld	e,10 (ix)
	ld	d,11 (ix)
;src/main.c:130: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	push	de
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	c,l
	pop	de
	ld	l,4 (ix)
	ld	h,5 (ix)
;src/main.c:132: dir[0] = 6;
	ld	a,12 (ix)
	ld	-2 (ix),a
	ld	a,13 (ix)
	ld	-1 (ix),a
;src/main.c:133: size[0] = 4;
	ld	a,14 (ix)
	ld	-4 (ix),a
	ld	a,15 (ix)
	ld	-3 (ix),a
;src/main.c:130: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	ld	a,c
	or	a, a
	jr	Z,00125$
	ld	b,(hl)
	ld	a,b
	sub	a, #0x4C
	jr	NC,00125$
;src/main.c:131: x[0] += 1;
	inc	b
	ld	(hl),b
;src/main.c:132: dir[0] = 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
;src/main.c:133: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:134: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jp	00126$
00125$:
;src/main.c:135: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
	push	hl
	push	de
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	hl
	or	a, a
	jr	Z,00121$
	ld	a,(hl)
	or	a, a
	jr	Z,00121$
;src/main.c:136: x[0] -= 1;
	add	a,#0xFF
	ld	(hl),a
;src/main.c:137: dir[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:138: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:139: sprite = gladis_quieto_izda;
	ld	de,#_gladis_quieto_izda+0
	jp	00126$
00121$:
;src/main.c:140: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
	push	de
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	c,l
	pop	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	a,c
	or	a, a
	jr	Z,00117$
	ld	b,(hl)
	ld	a,b
	sub	a, #0xB4
	jr	NC,00117$
;src/main.c:141: y[0] += 2;
	inc	b
	inc	b
	ld	(hl),b
;src/main.c:142: dir[0] = 2;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
;src/main.c:143: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:144: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jr	00126$
00117$:
;src/main.c:145: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
	push	hl
	push	de
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	hl
	or	a, a
	jr	Z,00113$
	ld	a,(hl)
	or	a, a
	jr	Z,00113$
;src/main.c:146: y[0] -= 2;
	add	a,#0xFE
	ld	(hl),a
;src/main.c:147: dir[0] = 8;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x08
;src/main.c:148: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:149: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jr	00126$
00113$:
;src/main.c:150: }else  if(cpct_isKeyPressed(Key_Esc)){
	push	de
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00110$
;src/main.c:151: finish[0] = 1;
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jr	00126$
00110$:
;src/main.c:152: }else if(cpct_isKeyPressed(Key_Space)){
	push	de
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00126$
;src/main.c:153: size[0] = 5;
	pop	hl
	push	hl
	ld	(hl),#0x05
;src/main.c:154: if(dir[0] == 6) {sprite = gladis_atk_dcha;}
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	a,l
	sub	a, #0x06
	jr	NZ,00105$
	ld	de,#_gladis_atk_dcha+0
	jr	00126$
00105$:
;src/main.c:155: else if(dir[0] == 4) {sprite = gladis_atk_izda;}
	ld	a,l
	sub	a, #0x04
	jr	NZ,00102$
	ld	de,#_gladis_atk_izda+0
	jr	00126$
00102$:
;src/main.c:156: else {sprite = gladis_quieto_dcha;} 
	ld	de,#_gladis_quieto_dcha+0
00126$:
;src/main.c:158: return sprite;
	ex	de,hl
	ld	sp, ix
	pop	ix
	ret
;src/main.c:163: TPlayer *create_Player(u8 x,u8 y,u8 *sprite,u8 life,u8 dir,u8 size){
;	---------------------------------
; Function create_Player
; ---------------------------------
_create_Player::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:164: TPlayer *player = calloc(1,sizeof *player);
	ld	hl,#0x0007
	push	hl
	ld	l, #0x01
	push	hl
	call	_calloc
	pop	af
	pop	af
	ex	de,hl
;src/main.c:165: assert(player != NULL);
	ld	a,e
	or	a, d
	jr	NZ,00104$
	ld	hl,#___str_2
	push	de
	ld	bc,#0x00A5
	push	bc
	ld	bc,#___str_3
	push	bc
	push	hl
	call	__assert
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
00104$:
;src/main.c:167: player->x = x;
	ld	a,4 (ix)
	ld	(de),a
;src/main.c:168: player->y = y;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/main.c:169: player->sprite = sprite;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/main.c:170: player->life = life;
	ld	hl,#0x0004
	add	hl,de
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:171: player->dir = dir;
	ld	hl,#0x0005
	add	hl,de
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:172: player->size = size;
	ld	hl,#0x0006
	add	hl,de
	ld	a,10 (ix)
	ld	(hl),a
;src/main.c:174: return player;
	ex	de,hl
	pop	ix
	ret
___str_2:
	.ascii "player != NULL"
	.db 0x00
___str_3:
	.ascii "src/main.c"
	.db 0x00
;src/main.c:179: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;src/main.c:183: TPlayer *players = calloc(1,sizeof *players);
	ld	hl,#0x0007
	push	hl
	ld	l, #0x01
	push	hl
	call	_calloc
	pop	af
	pop	af
;src/main.c:186: TPlayer *p = create_Player(0,100,gladis_quieto_dcha,10,6,4);
	ld	de,#_gladis_quieto_dcha
	ld	hl,#0x0406
	push	hl
	ld	a,#0x0A
	push	af
	inc	sp
	push	de
	ld	hl,#0x6400
	push	hl
	call	_create_Player
	pop	af
	pop	af
	pop	af
	inc	sp
	ex	de,hl
;src/main.c:187: TPlayer *e = create_Player(10,110,chacho_quieto_dcha,10,6,4);
	ld	bc,#_chacho_quieto_dcha
	push	de
	ld	hl,#0x0406
	push	hl
	ld	a,#0x0A
	push	af
	inc	sp
	push	bc
	ld	hl,#0x6E0A
	push	hl
	call	_create_Player
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
	inc	sp
	inc	sp
	push	hl
;src/main.c:193: int finish = 0;
	ld	-11 (ix),#0x00
	ld	-10 (ix),#0x00
;src/main.c:198: cpct_clearScreen(0);
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
;src/main.c:201: while (1){
00104$:
;src/main.c:204: cpct_waitVSYNC();
	push	de
	call	_cpct_waitVSYNC
	pop	de
;src/main.c:207: memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
	ld	hl,#0x0001
	add	hl,de
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	b,(hl)
	ld	a,(de)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	c, l
	ld	b, h
;src/main.c:208: cpct_drawSolidBox(memptr,0,p->size,16);
	ld	hl,#0x0006
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
	push	de
	ld	a,#0x10
	push	af
	inc	sp
	ld	a,-3 (ix)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
;src/main.c:213: lx = p->x;
	ld	a,(de)
	ld	-12 (ix),a
;src/main.c:214: ly = p->y;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-13 (ix),a
;src/main.c:217: cpct_scanKeyboard_f();
	push	de
	call	_cpct_scanKeyboard_f
	pop	de
;src/main.c:218: p->sprite  = checkKeyboard(&p->x,&p->y,&finish,p->sprite,&p->dir,&p->size);
	ld	hl,#0x0002
	add	hl,de
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	hl,#0x0005
	add	hl,de
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	iy,#0x0004
	add	iy,sp
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	push	bc
	push	iy
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	push	de
	call	_checkKeyboard
	ld	iy,#12
	add	iy,sp
	ld	sp,iy
	ld	b,l
	ld	c,h
	pop	de
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),c
;src/main.c:221: checkColisions(&p->x,&p->y,lx,ly);
	push	de
	ld	h,-13 (ix)
	ld	l,-12 (ix)
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	push	de
	call	_checkColisions
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
;src/main.c:224: drawPlayers(p,e);
	push	de
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	push	de
	call	_drawPlayers
	pop	af
	pop	af
	pop	de
;src/main.c:230: if(finish == 1) {return;}
	ld	a,-11 (ix)
	dec	a
	jp	NZ,00104$
	ld	a,-10 (ix)
	or	a, a
	jp	NZ,00104$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:239: void loadMap(){
;	---------------------------------
; Function loadMap
; ---------------------------------
_loadMap::
;src/main.c:241: }
	ret
;src/main.c:246: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:248: init();
	call	_init
;src/main.c:252: while(1){
00102$:
;src/main.c:253: menu();
	call	_menu
;src/main.c:255: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
