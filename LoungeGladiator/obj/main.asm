;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Mon Oct  5 18:28:44 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _drawSomething
	.globl _create_Player
	.globl _move
	.globl _checkKeyboard
	.globl _checkEnemiesCollisions
	.globl _checkBoundsCollisions
	.globl _initPlayers
	.globl _drawPlayers
	.globl _cleanScreenPlayers
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
	.globl _rand
	.globl _free
	.globl _malloc
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
	.ds 24
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
;src/main.c:34: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:35: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:36: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:37: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:38: cpct_setPalette(g_palette,4);
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
	.dw #0x0000
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
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
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
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
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
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
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
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
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
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0005
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
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
	.dw #0x0006
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
	.dw #0x0001
	.dw #0x0001
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
	.dw #0x0006
	.dw #0x0001
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
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
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
	.dw #0x0000
	.dw #0x0005
	.dw #0x0001
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
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0005
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0005
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0005
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
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
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0005
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
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
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
;src/main.c:42: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:44: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:46: memptr = cpct_getScreenPtr(VMEM,20,10);
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:47: cpct_drawStringM0("MENU",memptr,2,3);
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
;src/main.c:49: memptr = cpct_getScreenPtr(VMEM,18,180);
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:50: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
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
;src/main.c:52: do{
00101$:
;src/main.c:53: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:54: }while(!cpct_isKeyPressed(Key_Enter));
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
;src/main.c:60: void drawMap(int t){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;src/main.c:64: if(t == 1){ 
	ld	a,4 (ix)
	dec	a
	jr	NZ,00103$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00103$
;src/main.c:65: for(x=0;x<height;x++){
	ld	de,#0x0000
	ld	bc,#0x0000
00115$:
;src/main.c:66: scene[x] = mapa1[x];
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	l,a
	ld	a,#>(_scene)
	adc	a, h
	ld	h,a
	ld	iy,#_mapa1
	add	iy, bc
	push	iy
	pop	af
	ld	-3 (ix),a
	push	iy
	dec	sp
	pop	af
	inc	sp
	ld	-4 (ix), a
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;src/main.c:65: for(x=0;x<height;x++){
	ld	hl,#0x0028
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	de
	ld	a,e
	sub	a, #0x0C
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00115$
00103$:
;src/main.c:70: if(t == 2){ 
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00134$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00134$
;src/main.c:71: for(x=0;x<height;x++){
	ld	bc,#0x0000
	ld	de,#0x0000
00117$:
;src/main.c:72: scene[x] = mapa2[x];
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	iy,#_scene
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	hl,#_mapa2
	add	hl,de
	ld	0 (iy),l
	ld	1 (iy),h
;src/main.c:71: for(x=0;x<height;x++){
	ld	hl,#0x0028
	add	hl,de
	ex	de,hl
	inc	bc
	ld	a,c
	sub	a, #0x0C
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00117$
;src/main.c:76: for(posY=0; posY<height;posY++){
00134$:
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
;src/main.c:77: for(posX=0; posX<width;posX++){
00132$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	add	hl, hl
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,#<(_scene)
	add	a, l
	ld	-8 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-2 (ix),a
	ld	a,-7 (ix)
	ld	-1 (ix),a
	ld	hl,#0x0000
	ex	(sp), hl
00119$:
;src/main.c:78: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight); 
	ld	a,-12 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-14 (ix)
	add	a, a
	add	a, a
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:79: if(scene[posY][posX] == 1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,-14 (ix)
	ld	-6 (ix),a
	ld	a,-13 (ix)
	ld	-5 (ix),a
	sla	-6 (ix)
	rl	-5 (ix)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
;src/main.c:80: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	-10 (ix),c
	ld	-9 (ix),b
;src/main.c:79: if(scene[posY][posX] == 1){
	dec	d
	jr	NZ,00108$
	ld	a,h
	or	a, a
	jr	NZ,00108$
;src/main.c:80: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00108$:
;src/main.c:82: if(scene[posY][posX] == 5){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x05
	jr	NZ,00110$
	or	a,h
	jr	NZ,00110$
;src/main.c:83: cpct_drawSolidBox(memptr, 5, tilewidth, tileheight);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x05
	push	af
	inc	sp
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00110$:
;src/main.c:85: if(scene[posY][posX] == 6){
	ld	a,#<(_scene)
	add	a, -4 (ix)
	ld	l,a
	ld	a,#>(_scene)
	adc	a, -3 (ix)
	ld	h,a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x06
	jr	NZ,00120$
	or	a,h
	jr	NZ,00120$
;src/main.c:86: cpct_drawSolidBox(memptr, 6, tilewidth, tileheight);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x06
	push	af
	inc	sp
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00120$:
;src/main.c:77: for(posX=0; posX<width;posX++){
	inc	-14 (ix)
	jr	NZ,00181$
	inc	-13 (ix)
00181$:
	ld	a,-14 (ix)
	sub	a, #0x14
	ld	a,-13 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00119$
;src/main.c:76: for(posY=0; posY<height;posY++){
	inc	-12 (ix)
	jr	NZ,00182$
	inc	-11 (ix)
00182$:
	ld	a,-12 (ix)
	sub	a, #0x0C
	ld	a,-11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00132$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:93: void cleanScreenPlayers(TPlayer *p,TPlayer *e){
;	---------------------------------
; Function cleanScreenPlayers
; ---------------------------------
_cleanScreenPlayers::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:95: if(p->life > 0){
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	a,4 (iy)
	or	a, a
	jr	Z,00102$
;src/main.c:96: memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
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
;src/main.c:97: cpct_drawSolidBox(memptr,0,p->size,16);
	ex	de,hl
	ld	de, #0x0006
	add	hl, de
	ld	e,(hl)
	ld	d,#0x10
	push	de
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00102$:
;src/main.c:99: if(e->life > 0 ){
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
	ld	a,4 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:100: memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
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
;src/main.c:101: cpct_drawSolidBox(memptr,0,e->size,16);
	ex	de,hl
	ld	de, #0x0006
	add	hl, de
	ld	e,(hl)
	ld	d,#0x10
	push	de
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00105$:
	pop	ix
	ret
;src/main.c:106: void drawPlayers(TPlayer *p,TPlayer *e){
;	---------------------------------
; Function drawPlayers
; ---------------------------------
_drawPlayers::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:108: if(p->life > 0){
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	a,4 (iy)
	or	a, a
	jr	Z,00102$
;src/main.c:109: memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
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
;src/main.c:110: cpct_drawSpriteMasked(p->sprite,memptr,p->size,16);
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
;src/main.c:112: if(e->life > 0 ){
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
	ld	a,4 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:113: memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
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
;src/main.c:114: cpct_drawSpriteMasked(e->sprite,memptr,e->size,16);
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
;src/main.c:118: void initPlayers(){
;	---------------------------------
; Function initPlayers
; ---------------------------------
_initPlayers::
;src/main.c:120: }
	ret
;src/main.c:125: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly){
;	---------------------------------
; Function checkBoundsCollisions
; ---------------------------------
_checkBoundsCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-17
	add	hl,sp
	ld	sp,hl
;src/main.c:127: u8 *posX = x;
	ld	a,4 (ix)
	ld	-17 (ix),a
	ld	a,5 (ix)
	ld	-16 (ix),a
;src/main.c:128: u8 *posY = y;
	ld	a,6 (ix)
	ld	-15 (ix),a
	ld	a,7 (ix)
	ld	-14 (ix),a
;src/main.c:129: u8 bound = 0;
	ld	-13 (ix),#0x00
;src/main.c:130: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-1 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	a,(hl)
	ld	-5 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-4 (ix),a
	pop	hl
	push	hl
	ld	c,(hl)
	ld	l,c
	srl	l
	srl	l
	ld	h,#0x00
	add	hl, hl
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,-5 (ix)
	add	a, -12 (ix)
	ld	l,a
	ld	a,-4 (ix)
	adc	a, -11 (ix)
	ld	h,a
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00177$
	ld	a,h
	or	a, a
	jp	Z,00101$
00177$:
;src/main.c:131: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
	ld	b,#0x00
	ld	hl,#0x0003
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	a,-3 (ix)
	ld	-7 (ix),a
	ld	a,-2 (ix)
	ld	-6 (ix),a
	ld	a,-2 (ix)
	rlca
	and	a,#0x01
	ld	-10 (ix),a
	ld	hl,#0x0006
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00113$
	ld	a,-9 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-6 (ix),a
00113$:
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00178$
	ld	a,h
	or	a, a
	jp	Z,00101$
00178$:
;src/main.c:132: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
	ld	e,-1 (ix)
	ld	d,#0x00
	ld	hl,#0x000E
	add	hl,de
	ld	c,l
	ld	b,h
	ld	l, c
	ld	a,b
	ld	h,a
	rlca
	and	a,#0x01
	ld	-7 (ix),a
	ld	a,e
	add	a, #0x1D
	ld	-5 (ix),a
	ld	a,d
	adc	a, #0x00
	ld	-4 (ix),a
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00114$
	ld	l,-5 (ix)
	ld	h,-4 (ix)
00114$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00179$
	ld	a,h
	or	a, a
	jr	Z,00101$
00179$:
;src/main.c:133: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00115$
	ld	c,-5 (ix)
	ld	b,-4 (ix)
00115$:
	ld	l, c
	ld	h, b
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00116$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
00116$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	e
	jr	NZ,00102$
	ld	a,d
	or	a, a
	jr	NZ,00102$
00101$:
;src/main.c:136: *posX=lx;
	pop	hl
	push	hl
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:137: *posY=ly;
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:138: bound = 1;
	ld	-13 (ix),#0x01
00102$:
;src/main.c:140: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6   
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-9 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	a,(hl)
	ld	-7 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-6 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-10 (ix), a
	ld	l, a
	srl	l
	srl	l
	ld	h,#0x00
	add	hl, hl
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	a,-7 (ix)
	add	a, -3 (ix)
	ld	l,a
	ld	a,-6 (ix)
	adc	a, -2 (ix)
	ld	h,a
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x06
	jr	NZ,00182$
	or	a,h
	jp	Z,00106$
00182$:
;src/main.c:141: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
	ld	d,-10 (ix)
	ld	e,#0x00
	ld	c, d
	ld	b, e
	inc	bc
	inc	bc
	inc	bc
	ld	l, c
	ld	a,b
	ld	h,a
	rlca
	and	a,#0x01
	ld	-10 (ix),a
	ld	a,d
	add	a, #0x06
	ld	-12 (ix),a
	ld	a,e
	adc	a, #0x00
	ld	-11 (ix),a
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00117$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00117$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x06
	jr	NZ,00183$
	or	a,h
	jp	Z,00106$
00183$:
;src/main.c:142: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 6
	ld	e,-9 (ix)
	ld	d,#0x00
	ld	hl,#0x000E
	add	hl,de
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,-8 (ix)
	rlca
	and	a,#0x01
	ld	-7 (ix),a
	ld	a,e
	add	a, #0x1D
	ld	-5 (ix),a
	ld	a,d
	adc	a, #0x00
	ld	-4 (ix),a
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00118$
	ld	l,-5 (ix)
	ld	h,-4 (ix)
00118$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,#0x06
	jr	NZ,00184$
	or	a,d
	jr	Z,00106$
00184$:
;src/main.c:143: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00119$
	ld	l,-5 (ix)
	ld	h,-4 (ix)
00119$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	a,(hl)
	ld	-9 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-8 (ix),a
	ld	-7 (ix),c
	ld	-6 (ix),b
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00120$
	ld	a,-12 (ix)
	ld	-7 (ix),a
	ld	a,-11 (ix)
	ld	-6 (ix),a
00120$:
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x06
	jr	NZ,00107$
	or	a,h
	jr	NZ,00107$
00106$:
;src/main.c:145: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:146: drawMap(2);
	ld	hl,#0x0002
	push	hl
	call	_drawMap
	pop	af
00107$:
;src/main.c:148: return bound;
	ld	l,-13 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:151: void checkEnemiesCollisions(){
;	---------------------------------
; Function checkEnemiesCollisions
; ---------------------------------
_checkEnemiesCollisions::
;src/main.c:154: }
	ret
;src/main.c:158: u8* checkKeyboard(u8 *x, u8 *y,int *finish,u8 *s,u8 *dir,u8 *size){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:160: u8 *sprite = s;
	ld	e,10 (ix)
	ld	d,11 (ix)
;src/main.c:161: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	push	de
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	c,l
	pop	de
	ld	l,4 (ix)
	ld	h,5 (ix)
;src/main.c:163: dir[0] = 6;
	ld	a,12 (ix)
	ld	-2 (ix),a
	ld	a,13 (ix)
	ld	-1 (ix),a
;src/main.c:164: size[0] = 4;
	ld	a,14 (ix)
	ld	-4 (ix),a
	ld	a,15 (ix)
	ld	-3 (ix),a
;src/main.c:161: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	ld	a,c
	or	a, a
	jr	Z,00125$
	ld	b,(hl)
	ld	a,b
	sub	a, #0x4C
	jr	NC,00125$
;src/main.c:162: x[0] += 1;
	inc	b
	ld	(hl),b
;src/main.c:163: dir[0] = 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
;src/main.c:164: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:165: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jp	00126$
00125$:
;src/main.c:166: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
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
;src/main.c:167: x[0] -= 1;
	add	a,#0xFF
	ld	(hl),a
;src/main.c:168: dir[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:169: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:170: sprite = gladis_quieto_izda;
	ld	de,#_gladis_quieto_izda+0
	jp	00126$
00121$:
;src/main.c:171: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
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
;src/main.c:172: y[0] += 2;
	inc	b
	inc	b
	ld	(hl),b
;src/main.c:173: dir[0] = 2;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
;src/main.c:174: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:175: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jr	00126$
00117$:
;src/main.c:176: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
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
;src/main.c:177: y[0] -= 2;
	add	a,#0xFE
	ld	(hl),a
;src/main.c:178: dir[0] = 8;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x08
;src/main.c:179: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:180: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jr	00126$
00113$:
;src/main.c:181: }else  if(cpct_isKeyPressed(Key_Esc)){
	push	de
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00110$
;src/main.c:182: finish[0] = 1;
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jr	00126$
00110$:
;src/main.c:183: }else if(cpct_isKeyPressed(Key_Space)){
	push	de
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00126$
;src/main.c:184: size[0] = 5;
	pop	hl
	push	hl
	ld	(hl),#0x05
;src/main.c:185: if(dir[0] == 6) {sprite = gladis_atk_dcha;}
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	a,l
	sub	a, #0x06
	jr	NZ,00105$
	ld	de,#_gladis_atk_dcha+0
	jr	00126$
00105$:
;src/main.c:186: else if(dir[0] == 4) {sprite = gladis_atk_izda;}
	ld	a,l
	sub	a, #0x04
	jr	NZ,00102$
	ld	de,#_gladis_atk_izda+0
	jr	00126$
00102$:
;src/main.c:187: else {sprite = gladis_quieto_dcha;} 
	ld	de,#_gladis_quieto_dcha+0
00126$:
;src/main.c:189: return sprite;
	ex	de,hl
	ld	sp, ix
	pop	ix
	ret
;src/main.c:193: u8* move(u8 *x,u8 *y,u8 *s,u8 bound,u8 *dir,u8 *size){
;	---------------------------------
; Function move
; ---------------------------------
_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-23
	add	hl,sp
	ld	sp,hl
;src/main.c:194: int px = x[0];
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
;src/main.c:195: int py = y[0];
	ld	a,6 (ix)
	ld	-13 (ix),a
	ld	a,7 (ix)
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
;src/main.c:196: u8 *sprite = s;
	ld	a,8 (ix)
	ld	-8 (ix),a
	ld	a,9 (ix)
	ld	-7 (ix),a
;src/main.c:199: switch(dir[0]){
	ld	a,11 (ix)
	ld	-10 (ix),a
	ld	a,12 (ix)
	ld	-9 (ix),a
;src/main.c:198: if(bound == 1){
	ld	a,10 (ix)
	dec	a
	jr	NZ,00126$
;src/main.c:199: switch(dir[0]){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a, (hl)
	cp	a,#0x02
	jr	Z,00101$
	cp	a,#0x04
	jr	Z,00104$
	cp	a,#0x06
	jr	Z,00102$
	sub	a, #0x08
	jr	Z,00103$
	jp	00127$
;src/main.c:200: case 2: 
00101$:
;src/main.c:201: dir[0] = 8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/main.c:202: y[0] -= 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:203: break;
	jp	00127$
;src/main.c:204: case 6:
00102$:
;src/main.c:205: dir[0] = 4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/main.c:206: x[0] -= 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:207: break;
	jp	00127$
;src/main.c:208: case 8:
00103$:
;src/main.c:209: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:210: y[0] += 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x02
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:211: break;
	jp	00127$
;src/main.c:212: case 4:
00104$:
;src/main.c:213: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:214: x[0] += 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	(hl)
;src/main.c:216: }
	jp	00127$
00126$:
;src/main.c:219: int rnd = (rand()%4)+1;
	call	_rand
	ld	bc,#0x0004
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	inc	hl
	ex	(sp), hl
;src/main.c:222: if(scene[py/tileheight][px/tilewidth] == 2 ){
	ld	a,-5 (ix)
	rlca
	and	a,#0x01
	ld	-11 (ix),a
	ld	a,-6 (ix)
	add	a, #0x0F
	ld	-15 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
;src/main.c:226: size[0] = 4;
	ld	a,13 (ix)
	ld	-17 (ix),a
	ld	a,14 (ix)
	ld	-16 (ix),a
;src/main.c:220: if(rnd == 4){
	ld	a,-23 (ix)
	sub	a, #0x04
	jp	NZ,00123$
	ld	a,-22 (ix)
	or	a, a
	jp	NZ,00123$
;src/main.c:221: px +=1;
	ld	a,-4 (ix)
	add	a, #0x01
	ld	-21 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-20 (ix),a
;src/main.c:222: if(scene[py/tileheight][px/tilewidth] == 2 ){
	ld	a,-6 (ix)
	ld	-19 (ix),a
	ld	a,-5 (ix)
	ld	-18 (ix),a
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00130$
	ld	a,-15 (ix)
	ld	-19 (ix),a
	ld	a,-14 (ix)
	ld	-18 (ix),a
00130$:
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	pop	de
	pop	hl
	push	hl
	push	de
	bit	7, -20 (ix)
	jr	Z,00131$
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	inc	hl
	inc	hl
	inc	hl
00131$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl,bc
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jp	NZ,00127$
	or	a,h
	jp	NZ,00127$
;src/main.c:223: sprite = chacho_quieto_dcha;
	ld	-8 (ix),#<(_chacho_quieto_dcha)
	ld	-7 (ix),#>(_chacho_quieto_dcha)
;src/main.c:224: x[0] += 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	(hl)
;src/main.c:225: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:226: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
	jp	00127$
00123$:
;src/main.c:228: }else if(rnd == 3){
	ld	a,-23 (ix)
	sub	a, #0x03
	jp	NZ,00120$
	ld	a,-22 (ix)
	or	a, a
	jp	NZ,00120$
;src/main.c:229: px -=1;
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	dec	bc
;src/main.c:230: if(scene[py/tileheight][px/tilewidth] == 2 ){
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00132$
	ld	l,-15 (ix)
	ld	h,-14 (ix)
00132$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	h,c
	ld	l,b
	bit	7, b
	jr	Z,00133$
	inc	bc
	inc	bc
	inc	bc
	ld	h,c
	ld	l,b
00133$:
	ld	a, l
	ld	l,h
	ld	h,a
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jp	NZ,00127$
	or	a,h
	jp	NZ,00127$
;src/main.c:231: sprite = chacho_quieto_izda;
	ld	-8 (ix),#<(_chacho_quieto_izda)
	ld	-7 (ix),#>(_chacho_quieto_izda)
;src/main.c:232: x[0] -= 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:233: dir[0] = 4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/main.c:234: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
	jp	00127$
00120$:
;src/main.c:222: if(scene[py/tileheight][px/tilewidth] == 2 ){
	ld	a,-3 (ix)
	rlca
	and	a,#0x01
	ld	-19 (ix),a
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	inc	bc
	inc	bc
	inc	bc
;src/main.c:236: }else if(rnd == 2){
	ld	a,-23 (ix)
	sub	a, #0x02
	jr	NZ,00117$
	ld	a,-22 (ix)
	or	a, a
	jr	NZ,00117$
;src/main.c:237: py -=1;
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	dec	de
;src/main.c:238: if(scene[py/tileheight][px/tilewidth] == 2 ){
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00134$
	ld	hl,#0x000F
	add	hl,de
00134$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00135$
	ld	l, c
	ld	h, b
00135$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jp	NZ,00127$
	or	a,h
	jp	NZ,00127$
;src/main.c:239: y[0] += 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x02
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:240: dir[0] = 2;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x02
;src/main.c:241: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
	jp	00127$
00117$:
;src/main.c:243: }else if(rnd == 1){
	ld	a,-23 (ix)
	dec	a
	jp	NZ,00127$
	ld	a,-22 (ix)
	or	a, a
	jr	NZ,00127$
;src/main.c:244: py +=1;
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	inc	de
;src/main.c:245: if(scene[py/tileheight][px/tilewidth] == 2 ){
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00136$
	ld	hl,#0x000F
	add	hl,de
00136$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	a,(hl)
	ld	-15 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-14 (ix),a
	ld	e,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00137$
	ld	e,c
	ld	h,b
00137$:
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x02
	jr	NZ,00127$
	or	a,h
	jr	NZ,00127$
;src/main.c:246: y[0] -= 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:247: dir[0] = 8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/main.c:248: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
00127$:
;src/main.c:255: return sprite;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:260: TPlayer *create_Player(u8 x,u8 y,u8 *sprite,u8 life,u8 dir,u8 size){
;	---------------------------------
; Function create_Player
; ---------------------------------
_create_Player::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:261: TPlayer *player = malloc(sizeof *player);
	ld	hl,#0x0007
	push	hl
	call	_malloc
	pop	af
	ex	de,hl
;src/main.c:262: assert(player != NULL);
	ld	a,e
	or	a, d
	jr	NZ,00104$
	ld	hl,#___str_2
	push	de
	ld	bc,#0x0106
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
;src/main.c:264: player->x = x;
	ld	a,4 (ix)
	ld	(de),a
;src/main.c:265: player->y = y;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/main.c:266: player->sprite = sprite;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/main.c:267: player->life = life;
	ld	hl,#0x0004
	add	hl,de
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:268: player->dir = dir;
	ld	hl,#0x0005
	add	hl,de
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:269: player->size = size;
	ld	hl,#0x0006
	add	hl,de
	ld	a,10 (ix)
	ld	(hl),a
;src/main.c:271: return player;
	ex	de,hl
	pop	ix
	ret
___str_2:
	.ascii "player != NULL"
	.db 0x00
___str_3:
	.ascii "src/main.c"
	.db 0x00
;src/main.c:276: void drawSomething(){
;	---------------------------------
; Function drawSomething
; ---------------------------------
_drawSomething::
;src/main.c:278: }
	ret
;src/main.c:282: void game(){  
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
;src/main.c:283: TPlayer *p = create_Player(0,80,gladis_quieto_dcha,10,6,4);
	ld	de,#_gladis_quieto_dcha
	ld	hl,#0x0406
	push	hl
	ld	a,#0x0A
	push	af
	inc	sp
	push	de
	ld	hl,#0x5000
	push	hl
	call	_create_Player
	pop	af
	pop	af
	pop	af
	inc	sp
	ex	de,hl
;src/main.c:284: TPlayer *e = create_Player(15,120,chacho_quieto_dcha,10,6,4);
	ld	bc,#_chacho_quieto_dcha
	push	de
	ld	hl,#0x0406
	push	hl
	ld	a,#0x0A
	push	af
	inc	sp
	push	bc
	ld	hl,#0x780F
	push	hl
	call	_create_Player
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
	ld	-17 (ix),l
	ld	-16 (ix),h
;src/main.c:288: int finish = 0,i=1;
	ld	-15 (ix),#0x00
	ld	-14 (ix),#0x00
;src/main.c:294: u8 bound =0;;
	ld	-1 (ix),#0x00
;src/main.c:299: cpct_clearScreen(0);
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
;src/main.c:302: while (1){
00104$:
;src/main.c:305: cpct_waitVSYNC();
	push	de
	call	_cpct_waitVSYNC
	pop	de
;src/main.c:307: cleanScreenPlayers(p,e);
	push	de
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	push	de
	call	_cleanScreenPlayers
	pop	af
	pop	af
	pop	de
;src/main.c:309: lx = p->x;
	ld	a,(de)
	ld	-18 (ix),a
;src/main.c:310: ly = p->y;
	ld	hl,#0x0001
	add	hl,de
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
;src/main.c:311: lex = e->x;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
;src/main.c:312: ley = e->y;
	ld	a,-17 (ix)
	add	a, #0x01
	ld	-3 (ix),a
	ld	a,-16 (ix)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-13 (ix),a
;src/main.c:314: cpct_scanKeyboard_f();
	push	de
	call	_cpct_scanKeyboard_f
	pop	de
;src/main.c:315: p->sprite  = checkKeyboard(&p->x,&p->y,&finish,p->sprite,&p->dir,&p->size);
	ld	hl,#0x0002
	add	hl,de
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#0x0005
	add	hl,de
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-11 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-10 (ix),a
	ld	hl,#0x0004
	add	hl,sp
	push	de
	push	bc
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	push	bc
	ld	c,-11 (ix)
	ld	b,-10 (ix)
	push	bc
	push	hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	push	de
	call	_checkKeyboard
	ld	iy,#12
	add	iy,sp
	ld	sp,iy
	ld	b,l
	ld	c,h
	pop	de
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),c
;src/main.c:316: e->sprite = move(&e->x,&e->y,e->sprite,bound,&e->dir,&e->size);
	ld	a,-17 (ix)
	add	a, #0x02
	ld	-11 (ix),a
	ld	a,-16 (ix)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	iy,#0x0006
	ld	c,-17 (ix)
	ld	b,-16 (ix)
	add	iy, bc
	ld	a,-17 (ix)
	add	a, #0x05
	ld	-9 (ix),a
	ld	a,-16 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	push	iy
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	bc
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	call	_move
	ld	iy,#11
	add	iy,sp
	ld	sp,iy
	ld	b,l
	ld	c,h
	pop	de
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),c
;src/main.c:318: checkBoundsCollisions(&p->x,&p->y,lx,ly);
	push	de
	ld	h,-19 (ix)
	ld	l,-18 (ix)
	push	hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	push	de
	call	_checkBoundsCollisions
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	h,-13 (ix)
	ld	l,-12 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	call	_checkBoundsCollisions
	pop	af
	pop	af
	pop	af
	pop	de
	ld	-1 (ix),l
;src/main.c:322: drawPlayers(p,e);
	push	de
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	push	de
	call	_drawPlayers
	pop	af
	pop	af
	pop	de
;src/main.c:325: if(finish == 1) {
	ld	a,-15 (ix)
	dec	a
	jp	NZ,00104$
	ld	a,-14 (ix)
	or	a, a
	jp	NZ,00104$
;src/main.c:326: free(p);
	push	de
	call	_free
	pop	af
;src/main.c:327: free(e);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_free
;src/main.c:328: return;}
	ld	sp,ix
	pop	ix
	ret
;src/main.c:336: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:338: init();
	call	_init
;src/main.c:342: while(1){
00102$:
;src/main.c:343: menu();
	call	_menu
;src/main.c:345: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
