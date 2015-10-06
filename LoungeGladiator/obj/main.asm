;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Tue Oct  6 23:45:44 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _credits
	.globl _game
	.globl _checkKeyboard
	.globl _checkBoundsCollisions
	.globl _drawVida
	.globl _drawFatiga
	.globl _erasePlayer
	.globl _drawPlayer
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
	.globl _players
	.globl _object
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
_object::
	.ds 10
_players::
	.ds 26
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
;src/main.c:33: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:34: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:35: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:36: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:37: cpct_setPalette(g_palette,4);
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_mapa2:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x01	; 1
;src/main.c:41: int menu(){
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
;src/main.c:43: int init = 50;
	ld	-4 (ix),#0x32
	ld	-3 (ix),#0x00
;src/main.c:44: int pushed =0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:45: int cont =0;
	ld	de,#0x0000
;src/main.c:46: cpct_clearScreen(0);
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
;src/main.c:49: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:53: cpct_drawStringM0("Nueva Partida",memptr,1,0);
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
;src/main.c:56: cpct_drawStringM0("Creditos",memptr,1,0);
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
;src/main.c:49: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:59: cpct_drawStringM0("Salir",memptr,1,0);
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
;src/main.c:65: while(1){
00118$:
;src/main.c:67: cpct_scanKeyboard();
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
;src/main.c:69: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:70: pushed ++;
	inc	-6 (ix)
	jr	NZ,00163$
	inc	-5 (ix)
00163$:
;src/main.c:71: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:73: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
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
;src/main.c:74: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:75: pushed --;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
;src/main.c:76: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:79: switch (pushed){
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
;src/main.c:80: case 0: init = 50;break;
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
;src/main.c:81: case 1: init = 70;break;
00108$:
	ld	-4 (ix),#0x46
	ld	-3 (ix),#0x00
	jr	00110$
;src/main.c:82: case 2: init = 90;break;
00109$:
	ld	-4 (ix),#0x5A
	ld	-3 (ix),#0x00
;src/main.c:83: }
00110$:
;src/main.c:84: memptr = cpct_getScreenPtr(VMEM,15,init);
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
;src/main.c:49: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:85: cpct_drawSolidBox(memptr, 3, 2, 8);
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
;src/main.c:87: switch (pushed){
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
;src/main.c:88: case 0: return 1;break;
	jp	(hl)
00167$:
	jr	00111$
	jr	00112$
	jr	00113$
00111$:
	ld	hl,#0x0001
	jr	00120$
;src/main.c:89: case 1: return 2;break;
00112$:
	ld	hl,#0x0002
	jr	00120$
;src/main.c:90: case 2: return 0;break;
00113$:
	ld	hl,#0x0000
	jr	00120$
;src/main.c:91: }
00116$:
;src/main.c:93: cont++;
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
;src/main.c:108: void drawMap(u8 t){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/main.c:112: if(t == 1){ 
	ld	a,4 (ix)
	dec	a
	jr	NZ,00103$
;src/main.c:113: for(x=0;x<height;x++){
	ld	de,#0x0000
	ld	bc,#0x0000
00113$:
;src/main.c:114: scene[x] = mapa1[x];
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
;src/main.c:113: for(x=0;x<height;x++){
	ld	hl,#0x0014
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
;src/main.c:118: if(t == 2){ 
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00131$
;src/main.c:119: for(x=0;x<height;x++){
	ld	bc,#0x0000
	ld	de,#0x0000
00115$:
;src/main.c:120: scene[x] = mapa2[x];
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
;src/main.c:119: for(x=0;x<height;x++){
	ld	hl,#0x0014
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
;src/main.c:124: for(posY=0; posY<height;posY++){
00131$:
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:125: for(posX=0; posX<width;posX++){
00129$:
	pop	hl
	push	hl
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
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x00
00117$:
;src/main.c:126: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight); 
	ld	a,-10 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-8 (ix)
	add	a, a
	add	a, a
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	d,l
	ld	e,h
;src/main.c:127: if(scene[posY][posX] == 1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,bc
	ld	h,(hl)
;src/main.c:128: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	-6 (ix),d
	ld	-5 (ix),e
;src/main.c:127: if(scene[posY][posX] == 1){
	dec	h
	jr	NZ,00108$
;src/main.c:128: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00108$:
;src/main.c:130: if(scene[posY][posX] == 9){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00118$
;src/main.c:131: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x09
	push	af
	inc	sp
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00118$:
;src/main.c:125: for(posX=0; posX<width;posX++){
	inc	-8 (ix)
	jr	NZ,00171$
	inc	-7 (ix)
00171$:
	ld	a,-8 (ix)
	sub	a, #0x14
	ld	a,-7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00117$
;src/main.c:124: for(posY=0; posY<height;posY++){
	inc	-10 (ix)
	jr	NZ,00172$
	inc	-9 (ix)
00172$:
	ld	a,-10 (ix)
	sub	a, #0x0C
	ld	a,-9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00129$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:139: void drawPlayer(u8 x,u8 y,u8 *sprite,u8 size){
;	---------------------------------
; Function drawPlayer
; ---------------------------------
_drawPlayer::
;src/main.c:142: memptr = cpct_getScreenPtr(VMEM,x,y);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:143: cpct_drawSpriteMasked(sprite, memptr, size, 16);
	ld	c, l
	ld	b, h
	ld	hl, #4
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a,#0x10
	push	af
	inc	sp
	ld	hl, #7+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	ret
;src/main.c:147: void erasePlayer(u8 x,u8 y,u8 size){
;	---------------------------------
; Function erasePlayer
; ---------------------------------
_erasePlayer::
;src/main.c:150: memptr = cpct_getScreenPtr(VMEM,x,y);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:151: cpct_drawSolidBox(memptr,0,size,16);
	ex	de,hl
	ld	a,#0x10
	push	af
	inc	sp
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ret
;src/main.c:158: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:160: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/main.c:161: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/main.c:162: if(atk > 30 || atk <= 20){
	ld	a,#0x14
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	d,a
	ld	a,#0x1E
	sub	a, 4 (ix)
	jr	C,00103$
	ld	a,d
	or	a, a
	jr	NZ,00104$
00103$:
;src/main.c:163: memptr = cpct_getScreenPtr(VMEM,4,192);
	push	de
	ld	hl,#0xC004
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:164: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0802
	push	hl
	ld	a,5 (ix)
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
00104$:
;src/main.c:166: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00106$
	ld	a,d
	or	a, a
	jr	NZ,00107$
00106$:
;src/main.c:167: memptr = cpct_getScreenPtr(VMEM,7,192);
	push	de
	ld	hl,#0xC007
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:168: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0802
	push	hl
	ld	a,5 (ix)
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
00107$:
;src/main.c:170: if(atk <= 20){
	ld	a,d
	or	a, a
	jr	NZ,00111$
;src/main.c:171: memptr = cpct_getScreenPtr(VMEM,10,192);
	ld	hl,#0xC00A
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:172: cpct_drawSolidBox(memptr, col, 2, 8);
	ex	de,hl
	ld	hl,#0x0802
	push	hl
	ld	a,5 (ix)
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
;src/main.c:177: void drawVida(u8 life){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:179: if(life >= 1){
	ld	a,4 (ix)
	sub	a, #0x01
	jr	C,00102$
;src/main.c:180: memptr = cpct_getScreenPtr(VMEM,65,192);
	ld	hl,#0xC041
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:181: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00102$:
;src/main.c:183: memptr = cpct_getScreenPtr(VMEM,70,192);
	ld	hl,#0xC046
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:181: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
;src/main.c:184: if(life >= 2)
	ld	a,4 (ix)
	sub	a, #0x02
	jr	C,00104$
;src/main.c:185: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00105$
00104$:
;src/main.c:187: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	de,#_corazon_roto
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
;src/main.c:188: memptr = cpct_getScreenPtr(VMEM,75,192);
	ld	hl,#0xC04B
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:181: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ex	de,hl
;src/main.c:189: if(life >= 3)
	ld	a,4 (ix)
	sub	a, #0x03
	jr	C,00107$
;src/main.c:190: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	bc,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00109$
00107$:
;src/main.c:192: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	bc,#_corazon_roto+0
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00109$:
	pop	ix
	ret
;src/main.c:199: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 size){
;	---------------------------------
; Function checkBoundsCollisions
; ---------------------------------
_checkBoundsCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
;src/main.c:201: u8 *posX = x;
	ld	a,4 (ix)
	ld	-19 (ix),a
	ld	a,5 (ix)
	ld	-18 (ix),a
;src/main.c:202: u8 *posY = y;
	ld	a,6 (ix)
	ld	-16 (ix),a
	ld	a,7 (ix)
	ld	-15 (ix),a
;src/main.c:203: u8 bound = 0;
	ld	-17 (ix),#0x00
;src/main.c:204: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	ld	-7 (ix), a
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
	ld	-14 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-13 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-12 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-8 (ix),a
	ld	a,-14 (ix)
	add	a, -8 (ix)
	ld	l,a
	ld	a,-13 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-9 (ix), a
	dec	a
	jp	Z,00118$
;src/main.c:205: || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 1
	ld	l,-12 (ix)
	ld	h,#0x00
	ld	e,10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-11 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-10 (ix),a
	ld	a,-11 (ix)
	ld	-2 (ix),a
	ld	a,-10 (ix)
	ld	-1 (ix),a
	ld	a,-10 (ix)
	rlca
	and	a,#0x01
	ld	-12 (ix),a
	inc	hl
	inc	hl
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00126$
	ld	a,-6 (ix)
	ld	-2 (ix),a
	ld	a,-5 (ix)
	ld	-1 (ix),a
00126$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00118$
;src/main.c:206: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
	ld	e,-7 (ix)
	ld	d,#0x00
	ld	hl,#0x000E
	add	hl,de
	ld	c,l
	ld	b,h
	ld	-2 (ix),c
	ld	-1 (ix),b
	ld	a,b
	rlca
	and	a,#0x01
	ld	-7 (ix),a
	ld	hl,#0x001D
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00127$
	ld	a,-4 (ix)
	ld	-2 (ix),a
	ld	a,-3 (ix)
	ld	-1 (ix),a
00127$:
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
	ld	l,-8 (ix)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00118$
;src/main.c:207: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 1
	ld	-2 (ix),c
	ld	-1 (ix),b
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00128$
	ld	a,-4 (ix)
	ld	-2 (ix),a
	ld	a,-3 (ix)
	ld	-1 (ix),a
00128$:
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
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00129$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00129$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00119$
00118$:
;src/main.c:209: *posX=lx;
	pop	hl
	push	hl
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:210: *posY=ly;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:211: bound = 1;
	ld	-17 (ix),#0x01
	jp	00120$
00119$:
;src/main.c:213: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6   
	ld	a,-9 (ix)
	sub	a, #0x06
	jp	Z,00120$
;src/main.c:214: || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 6
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00130$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00130$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x06
	jp	Z,00120$
;src/main.c:215: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 6
	ld	l, c
	ld	h, b
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00131$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x06
	jp	Z,00120$
;src/main.c:216: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 6
	ld	l, c
	ld	h, b
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00132$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00133$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00133$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl,de
	ld	a,(hl)
	sub	a, #0x06
	jp	Z,00120$
;src/main.c:219: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5   
	ld	a,-9 (ix)
	sub	a, #0x05
	jp	Z,00120$
;src/main.c:220: || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 5
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00134$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00134$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00120$
;src/main.c:221: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00135$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00120$
;src/main.c:222: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00136$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00137$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00137$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00120$
;src/main.c:225: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9   
	ld	a,-9 (ix)
	sub	a, #0x09
	jp	Z,00101$
;src/main.c:226: || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 9
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00138$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00138$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jp	Z,00101$
;src/main.c:227: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 9
	ld	l, c
	ld	h, b
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00139$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	Z,00101$
;src/main.c:228: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 9
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00140$
	ld	c,-4 (ix)
	ld	b,-3 (ix)
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
	ld	-4 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-3 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00141$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00141$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00120$
00101$:
;src/main.c:230: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:231: drawMap(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_drawMap
	inc	sp
00120$:
;src/main.c:233: return bound;
	ld	l,-17 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:239: u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *finish,u8 *arrow){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-11
	add	hl,sp
	ld	sp,hl
;src/main.c:241: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-3 (ix),l
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	a,(bc)
	ld	e,a
;src/main.c:242: size[0] = 5;
	ld	a,14 (ix)
	ld	-7 (ix),a
	ld	a,15 (ix)
	ld	-6 (ix),a
;src/main.c:245: if(dir[0] == 6) {s = gladis_atk_dcha;}
	ld	a,10 (ix)
	ld	-2 (ix),a
	ld	a,11 (ix)
	ld	-1 (ix),a
;src/main.c:241: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	a,e
	sub	a, #0x14
	ld	a,#0x00
	rla
	ld	d,a
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00138$
	ld	a,d
	or	a, a
	jr	NZ,00138$
;src/main.c:242: size[0] = 5;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x05
;src/main.c:243: if(atk[0] >= 50) atk[0] =0;
	ld	a,(bc)
	ld	h,a
	sub	a, #0x32
	jr	C,00102$
	xor	a, a
	ld	(bc),a
	jr	00103$
00102$:
;src/main.c:244: else atk[0] += 1;
	ld	a,h
	inc	a
	ld	(bc),a
00103$:
;src/main.c:245: if(dir[0] == 6) {s = gladis_atk_dcha;}
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	h,(hl)
	ld	a,h
	sub	a, #0x06
	jr	NZ,00107$
	ld	12 (ix),#<(_gladis_atk_dcha)
	ld	13 (ix),#>(_gladis_atk_dcha)
	jp	00139$
00107$:
;src/main.c:246: else if(dir[0] == 4) {s = gladis_atk_izda;}     
	ld	a,h
	sub	a, #0x04
	jp	NZ,00139$
	ld	12 (ix),#<(_gladis_atk_izda)
	ld	13 (ix),#>(_gladis_atk_izda)
	jp	00139$
00138$:
;src/main.c:248: if(atk[0] < 20) atk[0] += 1;
	ld	a,d
	or	a, a
	jr	Z,00110$
	ld	a,e
	inc	a
	ld	(bc),a
	jr	00111$
00110$:
;src/main.c:249: else atk[0] = 20;
	ld	a,#0x14
	ld	(bc),a
00111$:
;src/main.c:250: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,l
	or	a, a
	jr	Z,00134$
	ld	a,(bc)
	ld	h,a
	sub	a, #0x4C
	jr	NC,00134$
;src/main.c:251: x[0] += 1;
	ld	a,h
	inc	a
	ld	(bc),a
;src/main.c:252: dir[0] = 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
;src/main.c:253: size[0] = 4;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x04
;src/main.c:254: sprite = gladis_quieto_dcha;
	jp	00139$
00134$:
;src/main.c:255: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
	push	bc
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00130$
	ld	a,(bc)
	or	a, a
	jr	Z,00130$
;src/main.c:256: x[0] -= 1;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:257: dir[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:258: size[0] = 4;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x04
;src/main.c:259: sprite = gladis_quieto_izda;
	jp	00139$
00130$:
;src/main.c:260: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
	push	bc
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	pop	bc
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	a,l
	or	a, a
	jr	Z,00126$
	ld	a,(de)
	ld	h,a
	sub	a, #0xB4
	jr	NC,00126$
;src/main.c:261: y[0] += 2;
	ld	a,h
	add	a, #0x02
	ld	(de),a
;src/main.c:262: dir[0] = 2;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
;src/main.c:263: size[0] = 4;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x04
;src/main.c:264: sprite = gladis_quieto_dcha;
	jp	00139$
00126$:
;src/main.c:265: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
	push	bc
	push	de
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00122$
	ld	a,(de)
	or	a, a
	jr	Z,00122$
;src/main.c:266: y[0] -= 2;
	add	a,#0xFE
	ld	(de),a
;src/main.c:267: dir[0] = 8;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x08
;src/main.c:268: size[0] = 4;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x04
;src/main.c:269: sprite = gladis_arriba_dcha;
	jp	00139$
00122$:
;src/main.c:270: }else if(cpct_isKeyPressed(Key_X) && arrow == 0){
	push	bc
	push	de
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jp	Z,00118$
	ld	a,19 (ix)
	or	a,18 (ix)
	jp	NZ,00118$
;src/main.c:273: switch(dir[0]){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	h,(hl)
	ld	a,h
	sub	a, #0x02
	jr	Z,00114$
	ld	a,h
	sub	a, #0x04
	jr	Z,00113$
	ld	a,h
	sub	a, #0x06
	jr	Z,00112$
	ld	a,h
	sub	a, #0x08
	jr	Z,00115$
	jr	00116$
;src/main.c:274: case 6: spr = flecha_dcha; xs=2;ys=8; break;
00112$:
	ld	-5 (ix),#<(_flecha_dcha)
	ld	-4 (ix),#>(_flecha_dcha)
	ld	-10 (ix),#0x02
	ld	-11 (ix),#0x08
	jr	00116$
;src/main.c:275: case 4: spr = flecha_izda; xs=2;ys=8; break;
00113$:
	ld	-5 (ix),#<(_flecha_izda)
	ld	-4 (ix),#>(_flecha_izda)
	ld	-10 (ix),#0x02
	ld	-11 (ix),#0x08
	jr	00116$
;src/main.c:276: case 2: spr = flecha_arriba; xs=4;ys=4; break;
00114$:
	ld	-5 (ix),#<(_flecha_arriba)
	ld	-4 (ix),#>(_flecha_arriba)
	ld	-10 (ix),#0x04
	ld	-11 (ix),#0x04
	jr	00116$
;src/main.c:277: case 8: spr = flecha_abajo; xs=4;ys=4; break;
00115$:
	ld	-5 (ix),#<(_flecha_abajo)
	ld	-4 (ix),#>(_flecha_abajo)
	ld	-10 (ix),#0x04
	ld	-11 (ix),#0x04
;src/main.c:278: }
00116$:
;src/main.c:279: object.x = x[0]+4;
	ld	a,(bc)
	add	a, #0x04
	ld	(#_object),a
;src/main.c:280: object.y = y[0]+8;
	ld	bc,#_object + 1
	ld	a,(de)
	add	a, #0x08
	ld	(bc),a
;src/main.c:281: object.x = object.x;
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	hl,#_object
	ld	(hl),d
;src/main.c:282: object.y = object.y;
	ld	(bc),a
;src/main.c:283: object.sprite = spr;
	ld	hl,#_object + 4
	ld	a,-5 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-4 (ix)
	ld	(hl),a
;src/main.c:284: object.vivo = 0;
	ld	hl,#_object + 6
	ld	(hl),#0x00
;src/main.c:285: object.dir = dir[0];
	ld	de,#_object + 7
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	(de),a
;src/main.c:286: object.xsize = xs;
	ld	hl,#_object + 8
	ld	a,-10 (ix)
	ld	(hl),a
;src/main.c:287: object.ysize = ys;
	ld	hl,#_object + 9
	ld	a,-11 (ix)
	ld	(hl),a
;src/main.c:288: arrow[0]=1;
	ld	l,18 (ix)
	ld	h,19 (ix)
	ld	(hl),#0x01
	jr	00139$
00118$:
;src/main.c:290: size[0] = 4;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x04
;src/main.c:291: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
00139$:
;src/main.c:295: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00142$
;src/main.c:296: finish[0] = 1;
	ld	l,16 (ix)
	ld	h,17 (ix)
	ld	(hl),#0x01
00142$:
;src/main.c:299: return s;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:304: void game(){  
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-49
	add	hl,sp
	ld	sp,hl
;src/main.c:305: TPlayer p = {0,80,0,80,gladis_quieto_dcha,3,6,4,4,0,0,2};
	ld	hl,#0x0000
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0000
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	inc	de
	ld	a,#0x50
	ld	(de),a
	ld	hl,#0x0002
	add	hl,bc
	ld	-28 (ix),l
	ld	-27 (ix),h
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
	ld	hl,#0x0003
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x50
	ld	hl,#0x0004
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_gladis_quieto_dcha)
	inc	hl
	ld	(hl),#>(_gladis_quieto_dcha)
	ld	hl,#0x0006
	add	hl,bc
	ld	-24 (ix),l
	ld	-23 (ix),h
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#0x03
	ld	hl,#0x0007
	add	hl,bc
	ld	-26 (ix),l
	ld	-25 (ix),h
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x06
	ld	hl,#0x0008
	add	hl,bc
	ld	-32 (ix),l
	ld	-31 (ix),h
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	(hl),#0x04
	ld	hl,#0x0009
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x04
	ld	hl,#0x000A
	add	hl,bc
	ld	-34 (ix),l
	ld	-33 (ix),h
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),#0x00
	ld	hl,#0x000B
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x02
;src/main.c:311: u8 finish = 0,i=1,arrow=0;
	ld	-36 (ix),#0x00
	ld	-35 (ix),#0x00
;src/main.c:316: cpct_clearScreen(0);
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
	ld	a,#0x01
	push	af
	inc	sp
	call	_drawMap
	inc	sp
	pop	de
	pop	bc
;src/main.c:319: while (1){
00108$:
;src/main.c:322: cpct_waitVSYNC();
	push	bc
	push	de
	call	_cpct_waitVSYNC
	pop	de
	pop	bc
;src/main.c:325: erasePlayer(p.lx,p.ly,p.lsize);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	af
	ld	a,(hl)
	ld	-29 (ix),a
	pop	af
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	push	af
	ld	a,(hl)
	ld	-30 (ix),a
	pop	af
	push	bc
	push	de
	push	af
	inc	sp
	ld	h,-29 (ix)
	ld	l,-30 (ix)
	push	hl
	call	_erasePlayer
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/main.c:328: drawPlayer(p.x,p.y,p.sprite,p.size);
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	a,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	af
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	pop	af
	push	af
	ld	a,(de)
	ld	-30 (ix),a
	pop	af
	push	af
	ld	a,(bc)
	ld	-29 (ix),a
	pop	af
	push	bc
	push	de
	push	af
	inc	sp
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	h,-30 (ix)
	ld	l,-29 (ix)
	push	hl
	call	_drawPlayer
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/main.c:331: drawVida(p.life);
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	h,(hl)
	push	bc
	push	de
	push	hl
	inc	sp
	call	_drawVida
	inc	sp
	pop	de
	pop	bc
;src/main.c:334: if(p.atk < 20) drawFatiga(p.atk,2);
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	a,(hl)
	ld	-10 (ix), a
	sub	a, #0x14
	jr	NC,00105$
	push	bc
	push	de
	ld	a,#0x02
	push	af
	inc	sp
	ld	a,-10 (ix)
	push	af
	inc	sp
	call	_drawFatiga
	pop	af
	pop	de
	pop	bc
	jr	00106$
00105$:
;src/main.c:335: else if(p.atk > 20) drawFatiga(p.atk,16);
	ld	a,#0x14
	sub	a, -10 (ix)
	jr	NC,00102$
	push	bc
	push	de
	ld	a,#0x10
	push	af
	inc	sp
	ld	a,-10 (ix)
	push	af
	inc	sp
	call	_drawFatiga
	pop	af
	pop	de
	pop	bc
	jr	00106$
00102$:
;src/main.c:336: else drawFatiga(p.atk,0);
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	a,-10 (ix)
	push	af
	inc	sp
	call	_drawFatiga
	pop	af
	pop	de
	pop	bc
00106$:
;src/main.c:339: p.lx = p.x;
	ld	a,(bc)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),a
;src/main.c:340: p.ly = p.y;
	ld	a,(de)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/main.c:341: p.latk = p.atk;
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	a,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),a
;src/main.c:342: p.lsize = p.size;
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/main.c:345: cpct_scanKeyboard_f();
	push	bc
	push	de
	call	_cpct_scanKeyboard_f
	pop	de
	pop	bc
;src/main.c:346: p.sprite = checkKeyboard(&p.x,&p.y,&p.atk,&p.dir,p.sprite,&p.size,&finish,&arrow);
	ld	hl,#0x000E
	add	hl,sp
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	hl,#0x000D
	add	hl,sp
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	h,-32 (ix)
	ld	l,-31 (ix)
	ld	-14 (ix),h
	ld	-13 (ix),l
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-16 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-15 (ix),a
	ld	h,-26 (ix)
	ld	l,-25 (ix)
	ld	-18 (ix),h
	ld	-17 (ix),l
	ld	h,-34 (ix)
	ld	l,-33 (ix)
	ld	-20 (ix),h
	ld	-19 (ix),l
	push	de
	pop	iy
	ld	-22 (ix), c
	ld	-21 (ix), b
	push	bc
	push	de
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	push	iy
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	push	hl
	call	_checkKeyboard
	ld	iy,#16
	add	iy,sp
	ld	sp,iy
	ld	-21 (ix),h
	ld	-22 (ix),l
	pop	de
	pop	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-22 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-21 (ix)
	ld	(hl),a
;src/main.c:347: checkBoundsCollisions(&p.x,&p.y,p.lx,p.ly,p.size);
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	a,(hl)
	ld	-22 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-18 (ix),a
	push	de
	pop	iy
	ld	-16 (ix), c
	ld	-15 (ix), b
	push	bc
	push	de
	ld	h,-22 (ix)
	ld	l,-20 (ix)
	push	hl
	ld	a,-18 (ix)
	push	af
	inc	sp
	push	iy
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	call	_checkBoundsCollisions
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	pop	de
	pop	bc
	jp	00108$
;src/main.c:356: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:358: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:359: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:360: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);  
	ex	de,hl
	ld	bc,#___str_4+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:362: while (1){
00104$:
;src/main.c:364: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:368: if(cpct_isKeyPressed(Key_Esc)) {
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:370: return;
	ret
___str_4:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:377: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:381: init();
	call	_init
;src/main.c:384: while(1){
00106$:
;src/main.c:385: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:386: switch(x){
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
;src/main.c:387: case 0: return;break;
;src/main.c:388: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:389: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:390: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
