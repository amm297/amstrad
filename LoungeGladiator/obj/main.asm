;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Tue Oct  6 12:25:12 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _credits
	.globl _game
	.globl _drawSomething
	.globl _create_Player
	.globl _move
	.globl _checkKeyboard
	.globl _checkEnemiesCollisions
	.globl _checkArrowCollisions
	.globl _checkBoundsCollisions
	.globl _initPlayers
	.globl _drawPlayers
	.globl _cleanScreenPlayers
	.globl _drawObjects
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
	.globl _cpct_scanKeyboard
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
	.dw #0x0006
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
	.dw #0x0009
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
;src/main.c:42: int menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:44: int init = 50;
	ld	-4 (ix),#0x32
	ld	-3 (ix),#0x00
;src/main.c:45: int pushed =0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:46: int cont =0;
	ld	de,#0x0000
;src/main.c:47: cpct_clearScreen(0);
	push	de
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:50: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x3214
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:54: cpct_drawStringM0("Nueva Partida",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x4614
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:57: cpct_drawStringM0("Creditos",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x5A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:50: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:60: cpct_drawStringM0("Salir",memptr,1,0);
	ld	bc,#___str_3
	push	de
	ld	hl,#0x0001
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
;src/main.c:69: while(1){
00118$:
;src/main.c:71: cpct_scanKeyboard();
	push	de
	call	_cpct_scanKeyboard
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00102$
	ld	a,#0x96
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	jp	P,00102$
;src/main.c:73: cpct_drawSolidBox(memptr, 0, 2, 8);
	ld	hl,#0x0802
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:74: pushed ++;
	inc	-6 (ix)
	jr	NZ,00163$
	inc	-5 (ix)
00163$:
;src/main.c:75: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:77: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
	push	de
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00105$
	ld	a,#0x96
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00164$
	xor	a, #0x80
00164$:
	jp	P,00105$
;src/main.c:78: cpct_drawSolidBox(memptr, 0, 2, 8);
	ld	hl,#0x0802
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:79: pushed --;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
;src/main.c:80: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:83: switch (pushed){
	ld	a,-5 (ix)
	rlca
	and	a,#0x01
	ld	b,a
	ld	a,#0x02
	cp	a, -6 (ix)
	ld	a,#0x00
	sbc	a, -5 (ix)
	jp	PO, 00165$
	xor	a, #0x80
00165$:
	rlca
	and	a,#0x01
	ld	c,a
	ld	a,b
	or	a,a
	jr	NZ,00110$
	or	a,c
	jr	NZ,00110$
	push	de
	ld	e,-6 (ix)
	ld	d,#0x00
	ld	hl,#00166$
	add	hl,de
	add	hl,de
;src/main.c:84: case 0: init = 50;break;
	pop	de
	jp	(hl)
00166$:
	jr	00107$
	jr	00108$
	jr	00109$
00107$:
	ld	-4 (ix),#0x32
	ld	-3 (ix),#0x00
	jr	00110$
;src/main.c:85: case 1: init = 70;break;
00108$:
	ld	-4 (ix),#0x46
	ld	-3 (ix),#0x00
	jr	00110$
;src/main.c:86: case 2: init = 90;break;
00109$:
	ld	-4 (ix),#0x5A
	ld	-3 (ix),#0x00
;src/main.c:87: }
00110$:
;src/main.c:88: memptr = cpct_getScreenPtr(VMEM,15,init);
	ld	h,-4 (ix)
	push	bc
	push	de
	push	hl
	inc	sp
	ld	a,#0x0F
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/main.c:50: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:89: cpct_drawSolidBox(memptr, 3, 2, 8);
	push	bc
	push	de
	ld	hl,#0x0802
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ld	hl,#0x4000
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00116$
;src/main.c:91: switch (pushed){
	ld	a,b
	or	a,a
	jr	NZ,00116$
	or	a,c
	jr	NZ,00116$
	ld	e,-6 (ix)
	ld	d,#0x00
	ld	hl,#00167$
	add	hl,de
	add	hl,de
;src/main.c:92: case 0: return 1;break;
	jp	(hl)
00167$:
	jr	00111$
	jr	00112$
	jr	00113$
00111$:
	ld	hl,#0x0001
	jr	00120$
;src/main.c:93: case 1: return 2;break;
00112$:
	ld	hl,#0x0002
	jr	00120$
;src/main.c:94: case 2: return 0;break;
00113$:
	ld	hl,#0x0000
	jr	00120$
;src/main.c:95: }
00116$:
;src/main.c:97: cont++;
	inc	de
	jp	00118$
00120$:
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "Lounge Gladiator"
	.db 0x00
___str_1:
	.ascii "Nueva Partida"
	.db 0x00
___str_2:
	.ascii "Creditos"
	.db 0x00
___str_3:
	.ascii "Salir"
	.db 0x00
;src/main.c:112: void drawMap(int t){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/main.c:116: if(t == 1){ 
	ld	a,4 (ix)
	dec	a
	jr	NZ,00103$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00103$
;src/main.c:117: for(x=0;x<height;x++){
	ld	de,#0x0000
	ld	bc,#0x0000
00113$:
;src/main.c:118: scene[x] = mapa1[x];
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
;src/main.c:117: for(x=0;x<height;x++){
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
	jr	C,00113$
00103$:
;src/main.c:122: if(t == 2){ 
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00131$
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00131$
;src/main.c:123: for(x=0;x<height;x++){
	ld	bc,#0x0000
	ld	de,#0x0000
00115$:
;src/main.c:124: scene[x] = mapa2[x];
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
;src/main.c:123: for(x=0;x<height;x++){
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
	jr	C,00115$
;src/main.c:128: for(posY=0; posY<height;posY++){
00131$:
	ld	bc,#0x0000
;src/main.c:129: for(posX=0; posX<width;posX++){
00129$:
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-4 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-3 (ix),a
	ld	a,-4 (ix)
	ld	-2 (ix),a
	ld	a,-3 (ix)
	ld	-1 (ix),a
	ld	hl,#0x0000
	ex	(sp), hl
00117$:
;src/main.c:130: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight); 
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-8 (ix)
	add	a, a
	add	a, a
	push	bc
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	push	hl
	pop	iy
;src/main.c:131: if(scene[posY][posX] == 1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,-8 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	ld	-5 (ix),a
	sla	-6 (ix)
	rl	-5 (ix)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	add	hl,de
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
;src/main.c:132: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	push	iy
	pop	de
;src/main.c:131: if(scene[posY][posX] == 1){
	dec	l
	jr	NZ,00108$
	ld	a,h
	or	a, a
	jr	NZ,00108$
;src/main.c:132: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	push	bc
	push	de
	ld	hl,#0x1004
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
00108$:
;src/main.c:134: if(scene[posY][posX] == 9){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-6 (ix)
	add	a, l
	ld	l,a
	ld	a,-5 (ix)
	adc	a, h
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	sub	a,#0x09
	jr	NZ,00118$
	or	a,h
	jr	NZ,00118$
;src/main.c:135: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
	push	bc
	ld	hl,#0x1004
	push	hl
	ld	a,#0x09
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
00118$:
;src/main.c:129: for(posX=0; posX<width;posX++){
	inc	-8 (ix)
	jr	NZ,00173$
	inc	-7 (ix)
00173$:
	ld	a,-8 (ix)
	sub	a, #0x14
	ld	a,-7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00117$
;src/main.c:128: for(posY=0; posY<height;posY++){
	inc	bc
	ld	a,c
	sub	a, #0x0C
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00129$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:143: void drawObjects(){
;	---------------------------------
; Function drawObjects
; ---------------------------------
_drawObjects::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/main.c:146: for(posY=0; posY<height;posY++){
	ld	bc,#0x0000
;src/main.c:147: for(posX=0; posX<width;posX++){
00115$:
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-1 (ix),a
	ld	a,-2 (ix)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	ld	-5 (ix),a
	ld	hl,#0x0000
	ex	(sp), hl
00107$:
;src/main.c:148: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-10 (ix)
	add	a, a
	add	a, a
	push	bc
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ex	de,hl
;src/main.c:149: if(scene[posY][posX] == 5){
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-10 (ix)
	ld	-8 (ix),a
	ld	a,-9 (ix)
	ld	-7 (ix),a
	sla	-8 (ix)
	rl	-7 (ix)
	ld	a,-8 (ix)
	add	a, l
	ld	l,a
	ld	a,-7 (ix)
	adc	a, h
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	l,(hl)
	ld	h,a
;src/main.c:150: cpct_drawSpriteMasked(flecha_abajo,memptr,4,4);
	ld	-4 (ix),e
	ld	-3 (ix),d
;src/main.c:149: if(scene[posY][posX] == 5){
	ld	a,h
	sub	a,#0x05
	jr	NZ,00102$
	or	a,l
	jr	NZ,00102$
;src/main.c:150: cpct_drawSpriteMasked(flecha_abajo,memptr,4,4);
	ld	de,#_flecha_abajo
	push	bc
	ld	hl,#0x0404
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	de
	call	_cpct_drawSpriteMasked
	pop	bc
00102$:
;src/main.c:152: if(scene[posY][posX] == 6){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,#0x06
	jr	NZ,00108$
	or	a,d
	jr	NZ,00108$
;src/main.c:153: cpct_drawSolidBox(memptr, 6, tilewidth, tileheight);
	push	bc
	ld	hl,#0x1004
	push	hl
	ld	a,#0x06
	push	af
	inc	sp
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
00108$:
;src/main.c:147: for(posX=0; posX<width;posX++){
	inc	-10 (ix)
	jr	NZ,00141$
	inc	-9 (ix)
00141$:
	ld	a,-10 (ix)
	sub	a, #0x14
	ld	a,-9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00107$
;src/main.c:146: for(posY=0; posY<height;posY++){
	inc	bc
	ld	a,c
	sub	a, #0x0C
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00115$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:160: void cleanScreenPlayers(TPlayer *p,TPlayer *e){
;	---------------------------------
; Function cleanScreenPlayers
; ---------------------------------
_cleanScreenPlayers::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:162: if(p->life > 0){
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00102$
;src/main.c:163: memptr = cpct_getScreenPtr(VMEM,p->lx,p->ly);
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	b,(hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
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
;src/main.c:164: cpct_drawSolidBox(memptr,0,p->size,16);
	ex	de,hl
	ld	de, #0x0008
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
;src/main.c:166: if(e->life > 0 ){
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:167: memptr = cpct_getScreenPtr(VMEM,e->lx,e->ly);
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	b,(hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
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
;src/main.c:168: cpct_drawSolidBox(memptr,0,e->size,16);
	ex	de,hl
	ld	de, #0x0008
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
;src/main.c:173: void drawPlayers(TPlayer *p,TPlayer *e){
;	---------------------------------
; Function drawPlayers
; ---------------------------------
_drawPlayers::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:175: if(p->life > 0){
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00102$
;src/main.c:176: memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
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
;src/main.c:177: cpct_drawSpriteMasked(p->sprite,memptr,p->size,16);
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0008
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-1 (ix),a
	ex	de,hl
	ld	de, #0x0004
	add	hl, de
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
;src/main.c:179: if(e->life > 0 ){
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:180: memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
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
;src/main.c:181: cpct_drawSpriteMasked(e->sprite,memptr,e->size,16);
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0008
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-1 (ix),a
	ex	de,hl
	ld	de, #0x0004
	add	hl, de
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
;src/main.c:185: void initPlayers(){
;	---------------------------------
; Function initPlayers
; ---------------------------------
_initPlayers::
;src/main.c:187: }
	ret
;src/main.c:192: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly){
;	---------------------------------
; Function checkBoundsCollisions
; ---------------------------------
_checkBoundsCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-21
	add	hl,sp
	ld	sp,hl
;src/main.c:194: u8 *posX = x;
	ld	a,4 (ix)
	ld	-21 (ix),a
	ld	a,5 (ix)
	ld	-20 (ix),a
;src/main.c:195: u8 *posY = y;
	ld	a,6 (ix)
	ld	-18 (ix),a
	ld	a,7 (ix)
	ld	-17 (ix),a
;src/main.c:196: u8 bound = 0;
	ld	-19 (ix),#0x00
;src/main.c:197: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-4 (ix), a
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
	ld	-6 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-5 (ix),a
	pop	hl
	push	hl
	ld	c,(hl)
	ld	l,c
	srl	l
	srl	l
	ld	h,#0x00
	add	hl, hl
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,-6 (ix)
	add	a, -8 (ix)
	ld	l,a
	ld	a,-5 (ix)
	adc	a, -7 (ix)
	ld	h,a
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	a,-10 (ix)
	dec	a
	jr	NZ,00262$
	ld	a,-9 (ix)
	or	a, a
	jp	Z,00118$
00262$:
;src/main.c:198: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
	ld	b,#0x00
	ld	hl,#0x0003
	add	hl,bc
	ld	-16 (ix),l
	ld	-15 (ix),h
	ld	a,-16 (ix)
	ld	-12 (ix),a
	ld	a,-15 (ix)
	ld	-11 (ix),a
	ld	a,-15 (ix)
	rlca
	and	a,#0x01
	ld	-3 (ix),a
	ld	hl,#0x0006
	add	hl,bc
	ld	-14 (ix),l
	ld	-13 (ix),h
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00126$
	ld	a,-14 (ix)
	ld	-12 (ix),a
	ld	a,-13 (ix)
	ld	-11 (ix),a
00126$:
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00263$
	ld	a,h
	or	a, a
	jp	Z,00118$
00263$:
;src/main.c:199: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
	ld	e,-4 (ix)
	ld	d,#0x00
	ld	hl,#0x000E
	add	hl,de
	ld	c,l
	ld	b,h
	ld	-12 (ix),c
	ld	-11 (ix),b
	ld	a,b
	rlca
	and	a,#0x01
	ld	-4 (ix),a
	ld	hl,#0x001D
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00127$
	ld	a,-2 (ix)
	ld	-12 (ix),a
	ld	a,-1 (ix)
	ld	-11 (ix),a
00127$:
	ld	l,-12 (ix)
	ld	h,-11 (ix)
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
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00264$
	ld	a,h
	or	a, a
	jr	Z,00118$
00264$:
;src/main.c:200: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
	ld	-12 (ix),c
	ld	-11 (ix),b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00128$
	ld	a,-2 (ix)
	ld	-12 (ix),a
	ld	a,-1 (ix)
	ld	-11 (ix),a
00128$:
	ld	l,-12 (ix)
	ld	h,-11 (ix)
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
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00129$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00129$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00119$
	ld	a,h
	or	a, a
	jr	NZ,00119$
00118$:
;src/main.c:202: *posX=lx;
	pop	hl
	push	hl
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:203: *posY=ly;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:204: bound = 1;
	ld	-19 (ix),#0x01
	jp	00120$
00119$:
;src/main.c:206: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6   
	ld	a,-10 (ix)
	sub	a, #0x06
	jr	NZ,00267$
	ld	a,-9 (ix)
	or	a, a
	jp	Z,00120$
00267$:
;src/main.c:207: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00130$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00130$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x06
	jr	NZ,00268$
	or	a,h
	jp	Z,00120$
00268$:
;src/main.c:208: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 6
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00131$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
00131$:
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
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x06
	jr	NZ,00269$
	or	a,h
	jp	Z,00120$
00269$:
;src/main.c:209: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00132$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00133$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00133$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,#0x06
	jr	NZ,00270$
	or	a,d
	jp	Z,00120$
00270$:
;src/main.c:212: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5   
	ld	a,-10 (ix)
	sub	a, #0x05
	jr	NZ,00271$
	ld	a,-9 (ix)
	or	a, a
	jp	Z,00120$
00271$:
;src/main.c:213: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 5
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00134$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00134$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x05
	jr	NZ,00272$
	or	a,h
	jp	Z,00120$
00272$:
;src/main.c:214: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00135$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
00135$:
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
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x05
	jr	NZ,00273$
	or	a,h
	jp	Z,00120$
00273$:
;src/main.c:215: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00136$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00137$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00137$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,#0x05
	jr	NZ,00274$
	or	a,d
	jp	Z,00120$
00274$:
;src/main.c:218: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9   
	ld	a,-10 (ix)
	sub	a, #0x09
	jr	NZ,00275$
	ld	a,-9 (ix)
	or	a, a
	jp	Z,00101$
00275$:
;src/main.c:219: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 9
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00138$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00138$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x09
	jr	NZ,00276$
	or	a,h
	jp	Z,00101$
00276$:
;src/main.c:220: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 9
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00139$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
00139$:
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
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x09
	jr	NZ,00277$
	or	a,h
	jr	Z,00101$
00277$:
;src/main.c:221: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 9
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00140$
	ld	c,-2 (ix)
	ld	b,-1 (ix)
00140$:
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
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	e,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00141$
	ld	e,-14 (ix)
	ld	h,-13 (ix)
00141$:
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a,#0x09
	jr	NZ,00120$
	or	a,h
	jr	NZ,00120$
00101$:
;src/main.c:223: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:224: drawMap(2);
	ld	hl,#0x0002
	push	hl
	call	_drawMap
	pop	af
00120$:
;src/main.c:226: return bound;
	ld	l,-19 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:229: void checkArrowCollisions(u8 *x,u8 *y, u8 *vivo,u8 w,u8 h){
;	---------------------------------
; Function checkArrowCollisions
; ---------------------------------
_checkArrowCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/main.c:231: u8 *posX = x;
	ld	e,4 (ix)
	ld	d,5 (ix)
;src/main.c:232: u8 *posY = y;
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/main.c:233: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
	ld	a,(bc)
	ld	-3 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_scene
	add	hl,bc
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	a,(de)
	ld	-4 (ix), a
	ld	l, a
	srl	l
	srl	l
	ld	h,#0x00
	add	hl, hl
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	a,-2 (ix)
	add	a, -6 (ix)
	ld	l,a
	ld	a,-1 (ix)
	adc	a, -5 (ix)
	ld	h,a
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00137$
	ld	a,h
	or	a, a
	jp	Z,00106$
00137$:
;src/main.c:234: || scene[(posY[0])/tileheight][(posX[0]+w-1)/tilewidth] == 1
	ld	l,-4 (ix)
	ld	h,#0x00
	ld	e,10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	e,l
	ld	d,h
	dec	de
	ld	c, e
	ld	a,d
	ld	b,a
	rlca
	and	a,#0x01
	ld	e,a
	inc	hl
	inc	hl
	ld	d,h
	ld	a,e
	or	a, a
	jr	Z,00108$
	ld	c, l
	ld	b, d
00108$:
	ld	l, c
	ld	h, b
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00138$
	ld	a,h
	or	a, a
	jr	Z,00106$
00138$:
;src/main.c:235: || scene[(posY[0]+h-2)/tileheight][(posX[0])/tilewidth] == 1 
	ld	l,-3 (ix)
	ld	h,#0x00
	ld	e,11 (ix)
	ld	d,#0x00
	add	hl,de
	ld	e,l
	ld	d,h
	dec	de
	dec	de
	ld	-2 (ix),e
	ld	-1 (ix),d
	ld	a,d
	rlca
	and	a,#0x01
	ld	-4 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-8 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-7 (ix),a
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00109$
	ld	a,-8 (ix)
	ld	-2 (ix),a
	ld	a,-7 (ix)
	ld	-1 (ix),a
00109$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	add	hl,de
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	dec	d
	jr	NZ,00139$
	ld	a,h
	or	a, a
	jr	Z,00140$
00139$:
	xor	a,a
00140$:
;src/main.c:238: vivo = 1;
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:242: void checkEnemiesCollisions(){
;	---------------------------------
; Function checkEnemiesCollisions
; ---------------------------------
_checkEnemiesCollisions::
;src/main.c:245: }
	ret
;src/main.c:249: u8* checkKeyboard(u8 *x, u8 *y,int *finish,u8 *s,u8 *dir,u8 *size){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:251: u8 *sprite = s;
	ld	e,10 (ix)
	ld	d,11 (ix)
;src/main.c:252: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	push	de
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	c,l
	pop	de
	ld	l,4 (ix)
	ld	h,5 (ix)
;src/main.c:254: dir[0] = 6;
	ld	a,12 (ix)
	ld	-2 (ix),a
	ld	a,13 (ix)
	ld	-1 (ix),a
;src/main.c:255: size[0] = 4;
	ld	a,14 (ix)
	ld	-4 (ix),a
	ld	a,15 (ix)
	ld	-3 (ix),a
;src/main.c:252: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	ld	a,c
	or	a, a
	jr	Z,00125$
	ld	b,(hl)
	ld	a,b
	sub	a, #0x4C
	jr	NC,00125$
;src/main.c:253: x[0] += 1;
	inc	b
	ld	(hl),b
;src/main.c:254: dir[0] = 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
;src/main.c:255: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:256: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jp	00126$
00125$:
;src/main.c:257: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
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
;src/main.c:258: x[0] -= 1;
	add	a,#0xFF
	ld	(hl),a
;src/main.c:259: dir[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:260: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:261: sprite = gladis_quieto_izda;
	ld	de,#_gladis_quieto_izda+0
	jp	00126$
00121$:
;src/main.c:262: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
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
;src/main.c:263: y[0] += 2;
	inc	b
	inc	b
	ld	(hl),b
;src/main.c:264: dir[0] = 2;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
;src/main.c:265: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:266: sprite = gladis_quieto_dcha;
	ld	de,#_gladis_quieto_dcha+0
	jr	00126$
00117$:
;src/main.c:267: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
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
;src/main.c:268: y[0] -= 2;
	add	a,#0xFE
	ld	(hl),a
;src/main.c:269: dir[0] = 8;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x08
;src/main.c:270: size[0] = 4;
	pop	hl
	push	hl
	ld	(hl),#0x04
;src/main.c:271: sprite = gladis_arriba_dcha;
	ld	de,#_gladis_arriba_dcha+0
	jr	00126$
00113$:
;src/main.c:272: }else  if(cpct_isKeyPressed(Key_Esc)){
	push	de
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00110$
;src/main.c:273: finish[0] = 1;
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	jr	00126$
00110$:
;src/main.c:274: }else if(cpct_isKeyPressed(Key_Space)){
	push	de
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00126$
;src/main.c:275: size[0] = 5;
	pop	hl
	push	hl
	ld	(hl),#0x05
;src/main.c:276: if(dir[0] == 6) {sprite = gladis_atk_dcha;}
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	a,l
	sub	a, #0x06
	jr	NZ,00105$
	ld	de,#_gladis_atk_dcha+0
	jr	00126$
00105$:
;src/main.c:277: else if(dir[0] == 4) {sprite = gladis_atk_izda;}
	ld	a,l
	sub	a, #0x04
	jr	NZ,00102$
	ld	de,#_gladis_atk_izda+0
	jr	00126$
00102$:
;src/main.c:278: else {sprite = gladis_quieto_dcha;} 
	ld	de,#_gladis_quieto_dcha+0
00126$:
;src/main.c:280: return sprite;
	ex	de,hl
	ld	sp, ix
	pop	ix
	ret
;src/main.c:284: u8* move(u8 *x,u8 *y,u8 *s,u8 bound,u8 *dir,u8 *size){
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
;src/main.c:285: int px = x[0];
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
;src/main.c:286: int py = y[0];
	ld	a,6 (ix)
	ld	-13 (ix),a
	ld	a,7 (ix)
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
;src/main.c:287: u8 *sprite = s;
	ld	a,8 (ix)
	ld	-8 (ix),a
	ld	a,9 (ix)
	ld	-7 (ix),a
;src/main.c:290: switch(dir[0]){
	ld	a,11 (ix)
	ld	-10 (ix),a
	ld	a,12 (ix)
	ld	-9 (ix),a
;src/main.c:289: if(bound == 1){
	ld	a,10 (ix)
	dec	a
	jr	NZ,00126$
;src/main.c:290: switch(dir[0]){
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
;src/main.c:291: case 2: 
00101$:
;src/main.c:292: dir[0] = 8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/main.c:293: y[0] -= 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:294: break;
	jp	00127$
;src/main.c:295: case 6:
00102$:
;src/main.c:296: dir[0] = 4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/main.c:297: x[0] -= 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:298: break;
	jp	00127$
;src/main.c:299: case 8:
00103$:
;src/main.c:300: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:301: y[0] += 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x02
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:302: break;
	jp	00127$
;src/main.c:303: case 4:
00104$:
;src/main.c:304: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:305: x[0] += 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	(hl)
;src/main.c:307: }
	jp	00127$
00126$:
;src/main.c:310: int rnd = (rand()%4)+1;
	call	_rand
	ld	bc,#0x0004
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	inc	hl
	ex	(sp), hl
;src/main.c:313: if(scene[py/tileheight][px/tilewidth] == 2 ){
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
;src/main.c:317: size[0] = 4;
	ld	a,13 (ix)
	ld	-17 (ix),a
	ld	a,14 (ix)
	ld	-16 (ix),a
;src/main.c:311: if(rnd == 4){
	ld	a,-23 (ix)
	sub	a, #0x04
	jp	NZ,00123$
	ld	a,-22 (ix)
	or	a, a
	jp	NZ,00123$
;src/main.c:312: px +=1;
	ld	a,-4 (ix)
	add	a, #0x01
	ld	-21 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-20 (ix),a
;src/main.c:313: if(scene[py/tileheight][px/tilewidth] == 2 ){
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
;src/main.c:314: sprite = chacho_quieto_dcha;
	ld	-8 (ix),#<(_chacho_quieto_dcha)
	ld	-7 (ix),#>(_chacho_quieto_dcha)
;src/main.c:315: x[0] += 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	(hl)
;src/main.c:316: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:317: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
	jp	00127$
00123$:
;src/main.c:319: }else if(rnd == 3){
	ld	a,-23 (ix)
	sub	a, #0x03
	jp	NZ,00120$
	ld	a,-22 (ix)
	or	a, a
	jp	NZ,00120$
;src/main.c:320: px -=1;
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	dec	bc
;src/main.c:321: if(scene[py/tileheight][px/tilewidth] == 2 ){
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
;src/main.c:322: sprite = chacho_quieto_izda;
	ld	-8 (ix),#<(_chacho_quieto_izda)
	ld	-7 (ix),#>(_chacho_quieto_izda)
;src/main.c:323: x[0] -= 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:324: dir[0] = 4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/main.c:325: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
	jp	00127$
00120$:
;src/main.c:313: if(scene[py/tileheight][px/tilewidth] == 2 ){
	ld	a,-3 (ix)
	rlca
	and	a,#0x01
	ld	-19 (ix),a
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	inc	bc
	inc	bc
	inc	bc
;src/main.c:327: }else if(rnd == 2){
	ld	a,-23 (ix)
	sub	a, #0x02
	jr	NZ,00117$
	ld	a,-22 (ix)
	or	a, a
	jr	NZ,00117$
;src/main.c:328: py -=1;
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	dec	de
;src/main.c:329: if(scene[py/tileheight][px/tilewidth] == 2 ){
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
;src/main.c:330: y[0] += 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x02
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:331: dir[0] = 2;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x02
;src/main.c:332: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
	jp	00127$
00117$:
;src/main.c:334: }else if(rnd == 1){
	ld	a,-23 (ix)
	dec	a
	jp	NZ,00127$
	ld	a,-22 (ix)
	or	a, a
	jr	NZ,00127$
;src/main.c:335: py +=1;
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	inc	de
;src/main.c:336: if(scene[py/tileheight][px/tilewidth] == 2 ){
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
;src/main.c:337: y[0] -= 2;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/main.c:338: dir[0] = 8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/main.c:339: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
00127$:
;src/main.c:346: return sprite;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:351: TPlayer *create_Player(u8 x,u8 y,u8 *sprite,u8 life,u8 dir,u8 size){
;	---------------------------------
; Function create_Player
; ---------------------------------
_create_Player::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:352: TPlayer *player = malloc(sizeof *player);
	ld	hl,#0x0009
	push	hl
	call	_malloc
	pop	af
	ex	de,hl
;src/main.c:353: assert(player != NULL);
	ld	a,e
	or	a, d
	jr	NZ,00104$
	ld	hl,#___str_4
	push	de
	ld	bc,#0x0161
	push	bc
	ld	bc,#___str_5
	push	bc
	push	hl
	call	__assert
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
00104$:
;src/main.c:355: player->x = x;
	ld	a,4 (ix)
	ld	(de),a
;src/main.c:356: player->y = y;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/main.c:357: player->sprite = sprite;
	ld	hl,#0x0004
	add	hl,de
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/main.c:358: player->life = life;
	ld	hl,#0x0006
	add	hl,de
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:359: player->dir = dir;
	ld	hl,#0x0007
	add	hl,de
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:360: player->size = size;
	ld	hl,#0x0008
	add	hl,de
	ld	a,10 (ix)
	ld	(hl),a
;src/main.c:362: return player;
	ex	de,hl
	pop	ix
	ret
___str_4:
	.ascii "player != NULL"
	.db 0x00
___str_5:
	.ascii "src/main.c"
	.db 0x00
;src/main.c:367: void drawSomething(){
;	---------------------------------
; Function drawSomething
; ---------------------------------
_drawSomething::
;src/main.c:369: }
	ret
;src/main.c:373: void game(){  
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-23
	add	hl,sp
	ld	sp,hl
;src/main.c:374: TPlayer *p = create_Player(0,80,gladis_quieto_dcha,10,6,4);
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
;src/main.c:375: TPlayer *e = create_Player(15,120,chacho_quieto_dcha,10,6,4);
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
	ld	-21 (ix),l
	ld	-20 (ix),h
;src/main.c:379: int finish = 0,i=1;
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:381: u8 bound =0;;
	ld	-1 (ix),#0x00
;src/main.c:386: cpct_clearScreen(0);
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
;src/main.c:389: while (1){
00104$:
;src/main.c:392: cpct_waitVSYNC();
	push	de
	call	_cpct_waitVSYNC
	pop	de
;src/main.c:395: cleanScreenPlayers(p,e);
	push	de
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	push	de
	call	_cleanScreenPlayers
	pop	af
	pop	af
	pop	de
;src/main.c:398: drawPlayers(p,e);
	push	de
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	push	de
	call	_drawPlayers
	pop	af
	pop	af
	pop	de
;src/main.c:405: p->lx = p->x;
	ld	hl,#0x0002
	add	hl,de
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	a,(de)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),a
;src/main.c:406: p->ly = p->y;
	ld	hl,#0x0003
	add	hl,de
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	hl,#0x0001
	add	hl,de
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),a
;src/main.c:407: e->lx = e->x;
	ld	a,-21 (ix)
	add	a, #0x02
	ld	-9 (ix),a
	ld	a,-20 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	a,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),a
;src/main.c:408: e->ly = e->y;
	ld	a,-21 (ix)
	add	a, #0x03
	ld	-11 (ix),a
	ld	a,-20 (ix)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	a,-21 (ix)
	add	a, #0x01
	ld	-13 (ix),a
	ld	a,-20 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),a
;src/main.c:411: cpct_scanKeyboard_f();
	push	de
	call	_cpct_scanKeyboard_f
	pop	de
;src/main.c:412: p->sprite  = checkKeyboard(&p->x,&p->y,&finish,p->sprite,&p->dir,&p->size);
	ld	hl,#0x0004
	add	hl,de
	ld	-15 (ix),l
	ld	-14 (ix),h
	ld	hl,#0x0008
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#0x0007
	add	hl,de
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	ld	hl,#0x0000
	add	hl,sp
	push	de
	push	bc
	ld	c,-17 (ix)
	ld	b,-16 (ix)
	push	bc
	ld	c,-19 (ix)
	ld	b,-18 (ix)
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
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),c
;src/main.c:413: e->sprite = move(&e->x,&e->y,e->sprite,bound,&e->dir,&e->size);
	ld	a,-21 (ix)
	add	a, #0x04
	ld	-19 (ix),a
	ld	a,-20 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
	ld	iy,#0x0008
	ld	c,-21 (ix)
	ld	b,-20 (ix)
	add	iy, bc
	ld	a,-21 (ix)
	add	a, #0x07
	ld	-17 (ix),a
	ld	a,-20 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	push	iy
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	bc
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	call	_move
	ld	iy,#11
	add	iy,sp
	ld	sp,iy
	ld	b,l
	ld	c,h
	pop	de
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),c
;src/main.c:416: checkBoundsCollisions(&p->x,&p->y,p->lx,p->ly);
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	b,(hl)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	push	de
	call	_checkBoundsCollisions
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
;src/main.c:417: bound = checkBoundsCollisions(&e->x,&e->y,e->lx,e->ly);
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	b,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	call	_checkBoundsCollisions
	pop	af
	pop	af
	pop	af
	pop	de
	ld	-1 (ix),l
;src/main.c:422: if(finish == 1) {
	ld	a,-23 (ix)
	dec	a
	jp	NZ,00104$
	ld	a,-22 (ix)
	or	a, a
	jp	NZ,00104$
;src/main.c:423: free(p);
	push	de
	call	_free
	pop	af
;src/main.c:424: free(e);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_free
;src/main.c:425: return;
	ld	sp,ix
	pop	ix
	ret
;src/main.c:433: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:435: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:436: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:437: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);  
	ex	de,hl
	ld	bc,#___str_6+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:439: while (1){
00104$:
;src/main.c:441: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:445: if(cpct_isKeyPressed(Key_Esc)) {
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:447: return;
	ret
___str_6:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:454: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:456: init();
	call	_init
;src/main.c:459: while(1){
00106$:
;src/main.c:460: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:461: switch(x){
	bit	7, d
	jr	NZ,00106$
	ld	a,#0x02
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	M,00106$
	ld	d,#0x00
	ld	hl,#00123$
	add	hl,de
	add	hl,de
;src/main.c:462: case 0: return;break;
;src/main.c:463: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:464: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:465: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
