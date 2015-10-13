;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Tue Oct 13 11:52:00 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _credits
	.globl _game
	.globl _move
	.globl _patrol
	.globl _followPlayer
	.globl _moveObject
	.globl _checkKeyboard
	.globl _checkArrowCollisions
	.globl _checkBoundsCollisionsEnemy
	.globl _checkBoundsCollisions
	.globl _drawBullets
	.globl _drawVida
	.globl _drawFatiga
	.globl _erasePlayer
	.globl _drawPlayer
	.globl _drawMap
	.globl _menu
	.globl _init
	.globl _checkCollisions
	.globl _movement
	.globl _setDirection
	.globl _chooseDirection
	.globl _detectPlayerRoom
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
	.globl _players
	.globl _object
	.globl _temp
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
	.ds 240
_temp::
	.ds 2
_object::
	.ds 10
_players::
	.ds 32
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
;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py,u8 room){
;	---------------------------------
; Function detectPlayerRoom
; ---------------------------------
_detectPlayerRoom::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/ia.h:13: u8 detected = 0; // no detectado
	ld	d,#0x00
;src/ia.h:14: if (scene[py/tileheight][px/tilewidth] == room) detected = 1;
	ld	a,5 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_scene
	add	hl,bc
	ld	e,4 (ix)
	srl	e
	srl	e
	ld	c,e
	ld	b,#0x00
	add	hl,bc
	ld	a,6 (ix)
	sub	a,(hl)
	jr	NZ,00102$
	ld	d,#0x01
00102$:
;src/ia.h:15: return detected;
	ld	l,d
	pop	ix
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
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
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
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
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
;src/ia.h:18: u8 chooseDirection(u8 d){
;	---------------------------------
; Function chooseDirection
; ---------------------------------
_chooseDirection::
;src/ia.h:20: u8 dir = 0;
	ld	d,#0x00
;src/ia.h:21: u8 rnd = (rand()%4)+1;
	push	de
	call	_rand
	ld	bc,#0x0004
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	ld	e,l
	inc	e
;src/ia.h:22: switch(rnd){
	ld	a,e
	sub	a, #0x01
	jr	C,00105$
	ld	a,#0x04
	sub	a, e
	jr	C,00105$
	dec	e
	ld	d,#0x00
	ld	hl,#00116$
	add	hl,de
	add	hl,de
;src/ia.h:23: case 4: dir = 6;break;
	jp	(hl)
00116$:
	jr	00104$
	jr	00103$
	jr	00102$
	jr	00101$
00101$:
	ld	d,#0x06
	jr	00105$
;src/ia.h:24: case 3: dir = 4;break;
00102$:
	ld	d,#0x04
	jr	00105$
;src/ia.h:25: case 2: dir = 2;break;
00103$:
	ld	d,#0x02
	jr	00105$
;src/ia.h:26: case 1: dir = 8;break;
00104$:
	ld	d,#0x08
;src/ia.h:27: }
00105$:
;src/ia.h:29: return dir;
	ld	l,d
	ret
;src/ia.h:33: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
;	---------------------------------
; Function setDirection
; ---------------------------------
_setDirection::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/ia.h:35: if(px < x) dir = 4;
	ld	a,4 (ix)
	sub	a, 6 (ix)
	jr	NC,00108$
	ld	l,#0x04
	jr	00109$
00108$:
;src/ia.h:36: else if(py > y) dir = 2;
	ld	a,7 (ix)
	sub	a, 5 (ix)
	jr	NC,00105$
	ld	l,#0x02
	jr	00109$
00105$:
;src/ia.h:37: else if(px > x) dir = 6;
	ld	a,6 (ix)
	sub	a, 4 (ix)
	jr	NC,00102$
	ld	l,#0x06
	jr	00109$
00102$:
;src/ia.h:38: else dir = 8;
	ld	l,#0x08
00109$:
;src/ia.h:39: return dir;
	pop	ix
	ret
;src/ia.h:42: void movement(u8 dir,u8 *x,u8 *y){
;	---------------------------------
; Function movement
; ---------------------------------
_movement::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/ia.h:46: case 8: y[0] -= 2; break;
	ld	e,7 (ix)
	ld	d,8 (ix)
;src/ia.h:43: switch(dir){
	ld	a,4 (ix)
	sub	a, #0x02
	jr	Z,00104$
;src/ia.h:44: case 6: x[0] += 1; break;
	ld	l,5 (ix)
	ld	h,6 (ix)
;src/ia.h:43: switch(dir){
	ld	a,4 (ix)
	sub	a, #0x04
	jr	Z,00102$
	ld	a,4 (ix)
	sub	a, #0x06
	jr	Z,00101$
	ld	a,4 (ix)
	sub	a, #0x08
	jr	Z,00103$
	jr	00106$
;src/ia.h:44: case 6: x[0] += 1; break;
00101$:
	inc	(hl)
	jr	00106$
;src/ia.h:45: case 4: x[0] -= 1; break; 
00102$:
	ld	d,(hl)
	dec	d
	ld	(hl),d
	jr	00106$
;src/ia.h:46: case 8: y[0] -= 2; break;
00103$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
	jr	00106$
;src/ia.h:47: case 2: y[0] += 2; break;
00104$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
;src/ia.h:48: }
00106$:
	pop	ix
	ret
;src/CalcColision.h:4: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
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
;src/CalcColision.h:5: u8 popX = pX + 4;
	ld	l,4 (ix)
	inc	l
	inc	l
	inc	l
	inc	l
;src/CalcColision.h:6: u8 popY = pY + 16;
	ld	a,5 (ix)
	add	a, #0x10
	ld	-5 (ix),a
;src/CalcColision.h:7: u8 eopX = eX + 4;
	ld	e,6 (ix)
	inc	e
	inc	e
	inc	e
	inc	e
;src/CalcColision.h:8: u8 eopY = eY + 16;
	ld	a,7 (ix)
	add	a, #0x10
	ld	-6 (ix),a
;src/CalcColision.h:10: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
	ld	a,e
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
	ld	a,l
	sub	a, e
	ld	a,#0x00
	rla
	ld	-2 (ix),a
	ld	a,7 (ix)
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	e,a
	ld	a,-5 (ix)
	sub	a, 7 (ix)
	ld	a,#0x00
	rla
	ld	c,a
;src/CalcColision.h:11: if(atk >= 21)
	ld	a,10 (ix)
	sub	a, #0x15
	ld	a,11 (ix)
	sbc	a, #0x00
	ld	a,#0x00
	rla
	ld	-3 (ix),a
;src/CalcColision.h:10: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00105$
	ld	a,-2 (ix)
	or	a,a
	jr	NZ,00105$
	or	a,e
	jr	NZ,00105$
	or	a,c
	jr	NZ,00105$
;src/CalcColision.h:11: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00102$
;src/CalcColision.h:12: return 1;
	ld	l,#0x01
	jp	00133$
00102$:
;src/CalcColision.h:14: return 2;
	ld	l,#0x02
	jp	00133$
00105$:
;src/CalcColision.h:16: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
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
	jr	NZ,00113$
	or	a,l
	jr	NZ,00113$
	or	a,e
	jr	NZ,00113$
	or	a,c
	jr	NZ,00113$
;src/CalcColision.h:17: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00110$
;src/CalcColision.h:18: return 1;
	ld	l,#0x01
	jr	00133$
00110$:
;src/CalcColision.h:20: return 2;
	ld	l,#0x02
	jr	00133$
00113$:
;src/CalcColision.h:22: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
	ld	a,-6 (ix)
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	e,a
	ld	a,-5 (ix)
	sub	a, -6 (ix)
	ld	a,#0x00
	rla
	ld	h,a
	ld	a,-4 (ix)
	or	a,a
	jr	NZ,00121$
	or	a,l
	jr	NZ,00121$
	or	a,e
	jr	NZ,00121$
	or	a,h
	jr	NZ,00121$
;src/CalcColision.h:23: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00118$
;src/CalcColision.h:24: return 1;
	ld	l,#0x01
	jr	00133$
00118$:
;src/CalcColision.h:26: return 2;
	ld	l,#0x02
	jr	00133$
00121$:
;src/CalcColision.h:28: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00129$
	ld	a,-2 (ix)
	or	a,a
	jr	NZ,00129$
	or	a,e
	jr	NZ,00129$
	or	a,h
	jr	NZ,00129$
;src/CalcColision.h:29: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00126$
;src/CalcColision.h:30: return 1;
	ld	l,#0x01
	jr	00133$
00126$:
;src/CalcColision.h:32: return 2;
	ld	l,#0x02
	jr	00133$
00129$:
;src/CalcColision.h:34: return 0;
	ld	l,#0x00
00133$:
	ld	sp, ix
	pop	ix
	ret
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
;src/main.c:66: while(1){
00118$:
;src/main.c:68: cpct_scanKeyboard();
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
;src/main.c:70: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:71: pushed ++;
	inc	-6 (ix)
	jr	NZ,00163$
	inc	-5 (ix)
00163$:
;src/main.c:72: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:74: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
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
;src/main.c:75: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:76: pushed --;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
;src/main.c:77: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:80: switch (pushed){
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
;src/main.c:81: case 0: init = 50;break;
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
;src/main.c:82: case 1: init = 70;break;
00108$:
	ld	-4 (ix),#0x46
	ld	-3 (ix),#0x00
	jr	00110$
;src/main.c:83: case 2: init = 90;break;
00109$:
	ld	-4 (ix),#0x5A
	ld	-3 (ix),#0x00
;src/main.c:84: }
00110$:
;src/main.c:85: memptr = cpct_getScreenPtr(VMEM,15,init);
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
;src/main.c:86: cpct_drawSolidBox(memptr, 3, 2, 8);
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
;src/main.c:88: switch (pushed){
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
;src/main.c:89: case 0: return 1;break;
	jp	(hl)
00167$:
	jr	00111$
	jr	00112$
	jr	00113$
00111$:
	ld	hl,#0x0001
	jr	00120$
;src/main.c:90: case 1: return 2;break;
00112$:
	ld	hl,#0x0002
	jr	00120$
;src/main.c:91: case 2: return 0;break;
00113$:
	ld	hl,#0x0000
	jr	00120$
;src/main.c:92: }
00116$:
;src/main.c:94: cont++;
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
;src/main.c:109: void drawMap(u8 t){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-18
	add	hl,sp
	ld	sp,hl
;src/main.c:113: if(t == 1){
	ld	a,4 (ix)
	dec	a
	jp	NZ,00104$
;src/main.c:114: for(y=0;y<height;y++){
	ld	hl,#0x0000
	ex	(sp), hl
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;src/main.c:115: for(x=0;x<width;x++){
00130$:
	ld	a,#<(_scene)
	add	a, -4 (ix)
	ld	-8 (ix),a
	ld	a,#>(_scene)
	adc	a, -3 (ix)
	ld	-7 (ix),a
	ld	a,#<(_mapa1)
	add	a, -4 (ix)
	ld	-10 (ix),a
	ld	a,#>(_mapa1)
	adc	a, -3 (ix)
	ld	-9 (ix),a
	ld	-16 (ix),#0x00
	ld	-15 (ix),#0x00
00115$:
;src/main.c:116: scene[y][x] = mapa1[y][x];
	ld	a,-8 (ix)
	add	a, -16 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, -15 (ix)
	ld	-5 (ix),a
	ld	a,-10 (ix)
	add	a, -16 (ix)
	ld	-2 (ix),a
	ld	a,-9 (ix)
	adc	a, -15 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/main.c:115: for(x=0;x<width;x++){
	inc	-16 (ix)
	jr	NZ,00189$
	inc	-15 (ix)
00189$:
	ld	a,-16 (ix)
	sub	a, #0x14
	ld	a,-15 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00115$
;src/main.c:114: for(y=0;y<height;y++){
	ld	a,-4 (ix)
	add	a, #0x14
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	inc	-18 (ix)
	jr	NZ,00190$
	inc	-17 (ix)
00190$:
	ld	a,-18 (ix)
	sub	a, #0x0C
	ld	a,-17 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00130$
00104$:
;src/main.c:121: if(t == 2){
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00141$
;src/main.c:122: for(y=0;y<height;y++){
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
;src/main.c:123: for(x=0;x<width;x++){
00134$:
	ld	hl,#_scene
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	hl,#_mapa2
	add	hl,de
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	bc,#0x0000
00119$:
;src/main.c:124: scene[y][x] = mapa2[y][x];
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	pop	iy
	pop	hl
	add	iy, bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	add	hl,bc
	ld	a,(hl)
	ld	0 (iy), a
;src/main.c:123: for(x=0;x<width;x++){
	inc	bc
	ld	a,c
	sub	a, #0x14
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00119$
;src/main.c:122: for(y=0;y<height;y++){
	ld	hl,#0x0014
	add	hl,de
	ld	e,l
	ld	d,h
	inc	-18 (ix)
	jr	NZ,00193$
	inc	-17 (ix)
00193$:
	ld	a,-18 (ix)
	sub	a, #0x0C
	ld	a,-17 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00134$
;src/main.c:129: for(posY=0; posY<height;posY++){
00141$:
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
;src/main.c:130: for(posX=0; posX<width;posX++){
00139$:
	ld	a,#<(_scene)
	add	a, -6 (ix)
	ld	-10 (ix),a
	ld	a,#>(_scene)
	adc	a, -5 (ix)
	ld	-9 (ix),a
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
00123$:
;src/main.c:131: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
	ld	a,-14 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-12 (ix)
	add	a, a
	add	a, a
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:132: if(scene[posY][posX] == 1){
	ld	a,-10 (ix)
	add	a, -12 (ix)
	ld	l,a
	ld	a,-9 (ix)
	adc	a, -11 (ix)
	ld	h,a
	ld	h,(hl)
;src/main.c:133: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	-8 (ix),e
	ld	-7 (ix),d
;src/main.c:132: if(scene[posY][posX] == 1){
	dec	h
	jr	NZ,00110$
;src/main.c:133: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00110$:
;src/main.c:135: if(scene[posY][posX] == 9){
	ld	a,#<(_scene)
	add	a, -2 (ix)
	ld	l,a
	ld	a,#>(_scene)
	adc	a, -1 (ix)
	ld	h,a
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00124$
;src/main.c:136: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
	ld	hl,#0x1004
	push	hl
	ld	a,#0x09
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00124$:
;src/main.c:130: for(posX=0; posX<width;posX++){
	inc	-12 (ix)
	jr	NZ,00198$
	inc	-11 (ix)
00198$:
	ld	a,-12 (ix)
	sub	a, #0x14
	ld	a,-11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00123$
;src/main.c:129: for(posY=0; posY<height;posY++){
	ld	a,-2 (ix)
	add	a, #0x14
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,-6 (ix)
	add	a, #0x14
	ld	-6 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	inc	-14 (ix)
	jr	NZ,00199$
	inc	-13 (ix)
00199$:
	ld	a,-14 (ix)
	sub	a, #0x0C
	ld	a,-13 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00139$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:144: void drawPlayer(u8 x,u8 y,u8 *sprite,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function drawPlayer
; ---------------------------------
_drawPlayer::
;src/main.c:147: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/main.c:148: cpct_drawSpriteMasked(sprite, memptr, sizeX, sizeY);
	ld	c, l
	ld	b, h
	ld	hl, #4
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #7+0
	add	hl, sp
	ld	a, (hl)
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
;src/main.c:152: void erasePlayer(u8 x,u8 y,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function erasePlayer
; ---------------------------------
_erasePlayer::
;src/main.c:155: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/main.c:156: cpct_drawSolidBox(memptr,0,sizeX,sizeY);
	ex	de,hl
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
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
;src/main.c:164: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:166: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/main.c:167: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/main.c:168: if(atk > 30 || atk <= 20){
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
;src/main.c:169: memptr = cpct_getScreenPtr(VMEM,4,192);
	push	de
	ld	hl,#0xC004
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:170: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:172: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00106$
	ld	a,d
	or	a, a
	jr	NZ,00107$
00106$:
;src/main.c:173: memptr = cpct_getScreenPtr(VMEM,7,192);
	push	de
	ld	hl,#0xC007
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:174: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:176: if(atk <= 20){
	ld	a,d
	or	a, a
	jr	NZ,00111$
;src/main.c:177: memptr = cpct_getScreenPtr(VMEM,10,192);
	ld	hl,#0xC00A
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:178: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:183: void drawVida(u8 life){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:185: if(life >= 1){
	ld	a,4 (ix)
	sub	a, #0x01
	jr	C,00102$
;src/main.c:186: memptr = cpct_getScreenPtr(VMEM,65,192);
	ld	hl,#0xC041
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:187: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00102$:
;src/main.c:189: memptr = cpct_getScreenPtr(VMEM,70,192);
	ld	hl,#0xC046
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:187: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
;src/main.c:190: if(life >= 2)
	ld	a,4 (ix)
	sub	a, #0x02
	jr	C,00104$
;src/main.c:191: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00105$
00104$:
;src/main.c:193: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	de,#_corazon_roto
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,75,192);
	ld	hl,#0xC04B
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:187: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ex	de,hl
;src/main.c:195: if(life >= 3)
	ld	a,4 (ix)
	sub	a, #0x03
	jr	C,00107$
;src/main.c:196: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	bc,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00109$
00107$:
;src/main.c:198: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	bc,#_corazon_roto+0
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00109$:
	pop	ix
	ret
;src/main.c:202: void drawBullets(u8 bullet){
;	---------------------------------
; Function drawBullets
; ---------------------------------
_drawBullets::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:206: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0032
00105$:
;src/main.c:207: memptr = cpct_getScreenPtr(VMEM,p,192);
	ld	d,c
	push	bc
	ld	a,#0xC0
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/main.c:208: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:209: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
	ex	de,hl
	ld	a,4 (ix)
	sub	a, -1 (ix)
	jr	C,00102$
	push	bc
	ld	hl,#0x0802
	push	hl
	push	de
	ld	hl,#_flecha_arriba
	push	hl
	call	_cpct_drawSpriteMasked
	pop	bc
	jr	00106$
00102$:
;src/main.c:210: else  cpct_drawSolidBox(memptr,0,2,8);
	push	bc
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
	pop	bc
00106$:
;src/main.c:206: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:232: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
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
;src/main.c:234: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:235: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:236: u8 bound = 0;
	ld	-21 (ix),#0x00
;src/main.c:237: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-16 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-15 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-14 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-9 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-12 (ix),a
	ld	a,-15 (ix)
	add	a, -12 (ix)
	ld	l,a
	ld	a,-14 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-13 (ix), a
	dec	a
	jp	Z,00124$
;src/main.c:238: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
	ld	l,-9 (ix)
	ld	h,#0x00
	ld	e,10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-2 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	ld	-3 (ix),a
	ld	a,-1 (ix)
	rlca
	and	a,#0x01
	ld	-9 (ix),a
	inc	hl
	inc	hl
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00132$
	ld	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-5 (ix)
	ld	-3 (ix),a
00132$:
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00124$
;src/main.c:239: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
	ld	l,-16 (ix)
	ld	h,#0x00
	ld	e,11 (ix)
	ld	d,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	dec	bc
	dec	bc
	ld	e, c
	ld	a,b
	ld	d,a
	rlca
	and	a,#0x01
	ld	-4 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-11 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-10 (ix),a
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00133$
	ld	e,-11 (ix)
	ld	d,-10 (ix)
00133$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-12 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00124$
;src/main.c:240: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00134$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00134$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-8 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-7 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00135$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00135$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00125$
00124$:
;src/main.c:242: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:243: *posY=ly;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:244: bound = 1;
	ld	-21 (ix),#0x01
	jp	00126$
00125$:
;src/main.c:246: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 2
	ld	a,-13 (ix)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:247: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00136$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00136$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:248: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 2
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00137$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00137$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-12 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00118$
;src/main.c:249: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00138$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00138$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-8 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-7 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00139$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00139$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00119$
00118$:
;src/main.c:252: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:253: *posY=ly;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,9 (ix)
	ld	(hl),a
	jp	00126$
00119$:
;src/main.c:255: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6
	ld	a,-13 (ix)
	sub	a, #0x06
	jp	Z,00126$
;src/main.c:256: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 6
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00140$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00140$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x06
	jp	Z,00126$
;src/main.c:257: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 6
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00141$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00141$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-12 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x06
	jp	Z,00126$
;src/main.c:258: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 6
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00142$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00142$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	e,a
	ld	a,#>(_scene)
	adc	a, h
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00143$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00143$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl,de
	ld	a,(hl)
	sub	a, #0x06
	jp	Z,00126$
;src/main.c:261: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5
	ld	a,-13 (ix)
	sub	a, #0x05
	jp	Z,00126$
;src/main.c:262: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00144$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00144$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00126$
;src/main.c:263: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00145$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00145$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-12 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00126$
;src/main.c:264: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00146$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00146$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	e,a
	ld	a,#>(_scene)
	adc	a, h
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00147$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00147$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00126$
;src/main.c:267: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9
	ld	a,-13 (ix)
	sub	a, #0x09
	jp	Z,00101$
;src/main.c:268: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00148$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00148$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jp	Z,00101$
;src/main.c:269: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 9
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00149$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
00149$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-12 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	Z,00101$
;src/main.c:270: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00150$
	ld	c,-11 (ix)
	ld	b,-10 (ix)
00150$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-8 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-7 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00151$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
00151$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00126$
00101$:
;src/main.c:272: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:273: drawMap(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_drawMap
	inc	sp
00126$:
;src/main.c:275: return bound;
	ld	l,-21 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:278: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function checkBoundsCollisionsEnemy
; ---------------------------------
_checkBoundsCollisionsEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-20
	add	hl,sp
	ld	sp,hl
;src/main.c:280: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:281: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:282: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-5 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-7 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-6 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix), a
	add	a, -7 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -6 (ix)
	ld	h,a
	ld	a,(hl)
	ld	-8 (ix), a
	dec	a
	jp	Z,00106$
;src/main.c:283: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
	ld	l,-2 (ix)
	ld	h,#0x00
	ld	e,10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-16 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-15 (ix),a
	ld	a,-16 (ix)
	ld	-10 (ix),a
	ld	a,-15 (ix)
	ld	-9 (ix),a
	ld	a,-15 (ix)
	rlca
	and	a,#0x01
	ld	-2 (ix),a
	inc	hl
	inc	hl
	ld	-14 (ix),l
	ld	-13 (ix),h
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00114$
	ld	a,-14 (ix)
	ld	-10 (ix),a
	ld	a,-13 (ix)
	ld	-9 (ix),a
00114$:
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00106$
;src/main.c:284: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
	ld	l,-5 (ix)
	ld	h,#0x00
	ld	e,11 (ix)
	ld	d,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	dec	bc
	dec	bc
	ld	e, c
	ld	a,b
	ld	d,a
	rlca
	and	a,#0x01
	ld	-10 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-4 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-3 (ix),a
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00115$
	ld	e,-4 (ix)
	ld	d,-3 (ix)
00115$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-1 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00106$
;src/main.c:285: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
	ld	l, c
	ld	h, b
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00116$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
00116$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-12 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-11 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00117$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00117$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00107$
00106$:
;src/main.c:287: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:288: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
	jp	00112$
00107$:
;src/main.c:290: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
	ld	a,-8 (ix)
	sub	a, #0x03
	jp	NZ,00101$
;src/main.c:291: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00118$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00118$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x03
	jp	NZ,00101$
;src/main.c:292: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
	ld	l, c
	ld	h, b
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00119$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
00119$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-1 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x03
	jr	NZ,00101$
;src/main.c:293: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00120$
	ld	c,-4 (ix)
	ld	b,-3 (ix)
00120$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-12 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-11 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00121$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
00121$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x03
	jr	Z,00112$
00101$:
;src/main.c:295: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:296: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:300: void checkArrowCollisions(u8 *arrow){
;	---------------------------------
; Function checkArrowCollisions
; ---------------------------------
_checkArrowCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;src/main.c:302: u8 posX = object.x;
	ld	a,(#_object+0)
	ld	-12 (ix),a
;src/main.c:303: u8 posY = object.y;
	ld	a,(#_object + 1)
;src/main.c:304: if(    scene[(posY)/tileheight][(posX)/tilewidth] == 1
	ld	-11 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-9 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-8 (ix),a
	ld	a,-12 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix), a
	add	a, -9 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -8 (ix)
	ld	h,a
	ld	a,(hl)
	dec	a
	jp	Z,00101$
;src/main.c:305: || scene[(posY)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
	ld	e,-12 (ix)
	ld	d,#0x00
	ld	a, (#_object + 8)
	ld	l,a
	ld	h,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-7 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-6 (ix),a
	ld	a,-7 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-6 (ix)
	rlca
	and	a,#0x01
	ld	-10 (ix),a
	inc	hl
	inc	hl
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00108$
	ld	a,-3 (ix)
	ld	-5 (ix),a
	ld	a,-2 (ix)
	ld	-4 (ix),a
00108$:
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00101$
;src/main.c:306: || scene[(posY+object.sizeY-2)/tileheight][(posX)/tilewidth] == 1
	ld	e,-11 (ix)
	ld	d,#0x00
	ld	a, (#_object + 9)
	ld	l,a
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	dec	bc
	dec	bc
	ld	e, c
	ld	a,b
	ld	d,a
	rlca
	and	a,#0x01
	ld	-5 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-9 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-8 (ix),a
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00109$
	ld	e,-9 (ix)
	ld	d,-8 (ix)
00109$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-1 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00101$
;src/main.c:307: || scene[(posY+object.sizeY-2)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00110$
	ld	c,-9 (ix)
	ld	b,-8 (ix)
00110$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-5 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-4 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00111$
	ld	l,-3 (ix)
	ld	h,-2 (ix)
00111$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00106$
00101$:
;src/main.c:309: arrow[0] = 0;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x00
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:315: u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *bullets,u8 *finish,u8 *arrow){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
;src/main.c:317: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-11 (ix),l
	ld	a,8 (ix)
	ld	-6 (ix),a
	ld	a,9 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-1 (ix),a
;src/main.c:318: size[0] = 5;
	ld	a,14 (ix)
	ld	-17 (ix),a
	ld	a,15 (ix)
	ld	-16 (ix),a
;src/main.c:321: if(dir[0] == 6) {s = gladis_atk_dcha;}
	ld	a,10 (ix)
	ld	-8 (ix),a
	ld	a,11 (ix)
	ld	-7 (ix),a
;src/main.c:346: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
	ld	a,20 (ix)
	ld	-13 (ix),a
	ld	a,21 (ix)
	ld	-12 (ix),a
;src/main.c:317: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	a,-1 (ix)
	sub	a, #0x14
	ld	a,#0x00
	rla
	ld	-2 (ix),a
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00140$
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00140$
;src/main.c:318: size[0] = 5;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x05
;src/main.c:319: if(atk[0] >= 50) atk[0] =0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-11 (ix), a
	sub	a, #0x32
	jr	C,00102$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
	jr	00103$
00102$:
;src/main.c:320: else atk[0] += 1;
	ld	a,-11 (ix)
	inc	a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
00103$:
;src/main.c:321: if(dir[0] == 6) {s = gladis_atk_dcha;}
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-11 (ix), a
	sub	a, #0x06
	jr	NZ,00107$
	ld	12 (ix),#<(_gladis_atk_dcha)
	ld	13 (ix),#>(_gladis_atk_dcha)
	jp	00141$
00107$:
;src/main.c:322: else if(dir[0] == 4) {s = gladis_atk_izda;}
	ld	a,-11 (ix)
	sub	a, #0x04
	jp	NZ,00141$
	ld	12 (ix),#<(_gladis_atk_izda)
	ld	13 (ix),#>(_gladis_atk_izda)
	jp	00141$
00140$:
;src/main.c:324: if(atk[0] < 20) atk[0] += 1;
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00110$
	ld	a,-1 (ix)
	inc	a
	ld	-2 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,-2 (ix)
	ld	(hl),a
	jr	00111$
00110$:
;src/main.c:325: else atk[0] = 20;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x14
00111$:
;src/main.c:326: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	-2 (ix),l
	ld	a,4 (ix)
	ld	-6 (ix),a
	ld	a,5 (ix)
	ld	-5 (ix),a
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00136$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00136$
;src/main.c:327: x[0] += 1;
	inc	d
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),d
;src/main.c:328: dir[0] = 6;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x06
;src/main.c:329: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:330: sprite = gladis_quieto_dcha;
	jp	00141$
00136$:
;src/main.c:331: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00132$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00132$
;src/main.c:332: x[0] -= 1;
	add	a,#0xFF
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/main.c:333: dir[0] = 4;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x04
;src/main.c:334: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:335: sprite = gladis_quieto_izda;
	jp	00141$
00132$:
;src/main.c:336: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	-2 (ix),l
	ld	a,6 (ix)
	ld	-15 (ix),a
	ld	a,7 (ix)
	ld	-14 (ix),a
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00128$
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0xB4
	jr	NC,00128$
;src/main.c:337: y[0] += 2;
	inc	d
	inc	d
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),d
;src/main.c:338: dir[0] = 2;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x02
;src/main.c:339: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:340: sprite = gladis_quieto_dcha;
	jp	00141$
00128$:
;src/main.c:341: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00124$
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00124$
;src/main.c:342: y[0] -= 2;
	add	a,#0xFE
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),a
;src/main.c:343: dir[0] = 8;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x08
;src/main.c:344: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:345: sprite = gladis_arriba_dcha;
	jp	00141$
00124$:
;src/main.c:346: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00120$
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	or	a, a
	jp	NZ,00120$
;src/main.c:347: if(bullets[0] > 0){
	ld	a,16 (ix)
	ld	-10 (ix),a
	ld	a,17 (ix)
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	or	a, a
	jp	Z,00118$
;src/main.c:349: u8 *spr = flecha_dcha,xs=2,ys=8;
	ld	-4 (ix),#<(_flecha_dcha)
	ld	-3 (ix),#>(_flecha_dcha)
	ld	-18 (ix),#0x02
	ld	-19 (ix),#0x08
;src/main.c:350: switch(dir[0]){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
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
;src/main.c:351: case 6: spr = flecha_dcha; xs=4;ys=4; break;
00112$:
	ld	-4 (ix),#<(_flecha_dcha)
	ld	-3 (ix),#>(_flecha_dcha)
	ld	-18 (ix),#0x04
	ld	-19 (ix),#0x04
	jr	00116$
;src/main.c:352: case 4: spr = flecha_izda; xs=4;ys=4; break;
00113$:
	ld	-4 (ix),#<(_flecha_izda)
	ld	-3 (ix),#>(_flecha_izda)
	ld	-18 (ix),#0x04
	ld	-19 (ix),#0x04
	jr	00116$
;src/main.c:353: case 2: spr = flecha_abajo; xs=2;ys=8; break;
00114$:
	ld	-4 (ix),#<(_flecha_abajo)
	ld	-3 (ix),#>(_flecha_abajo)
	ld	-18 (ix),#0x02
	ld	-19 (ix),#0x08
	jr	00116$
;src/main.c:354: case 8: spr = flecha_arriba; xs=2;ys=8; break;
00115$:
	ld	-4 (ix),#<(_flecha_arriba)
	ld	-3 (ix),#>(_flecha_arriba)
	ld	-18 (ix),#0x02
	ld	-19 (ix),#0x08
;src/main.c:355: }
00116$:
;src/main.c:356: object.x = x[0]+4;
	ld	de,#_object+0
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	add	a, #0x04
	ld	(de),a
;src/main.c:357: object.y = y[0]+8;
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	add	a, #0x08
	ld	(#(_object + 0x0001)),a
;src/main.c:358: object.x = object.x;
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	hl,#_object
	ld	(hl),d
;src/main.c:359: object.y = object.y;
	ld	(#(_object + 0x0001)),a
;src/main.c:360: object.sprite = spr;
	ld	hl,#(_object + 0x0004)
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;src/main.c:361: object.vivo = 0;
	ld	hl,#(_object + 0x0006)
	ld	(hl),#0x00
;src/main.c:362: object.dir = dir[0];
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	(#(_object + 0x0007)),a
;src/main.c:363: object.sizeX = xs;
	ld	hl,#(_object + 0x0008)
	ld	a,-18 (ix)
	ld	(hl),a
;src/main.c:364: object.sizeY = ys;
	ld	hl,#(_object + 0x0009)
	ld	a,-19 (ix)
	ld	(hl),a
;src/main.c:365: bullets[0]--;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-4 (ix), a
	ld	d, a
	dec	d
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),d
00118$:
;src/main.c:367: arrow[0]=1;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x01
	jr	00141$
00120$:
;src/main.c:369: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:370: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
00141$:
;src/main.c:375: if(cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00144$
;src/main.c:376: arrow[0] = 0;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x00
00144$:
;src/main.c:378: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00146$
;src/main.c:379: finish[0] = 1;
	ld	l,18 (ix)
	ld	h,19 (ix)
	ld	(hl),#0x01
00146$:
;src/main.c:382: return s;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:385: void moveObject(){
;	---------------------------------
; Function moveObject
; ---------------------------------
_moveObject::
;src/main.c:386: object.lx = object.x;
	ld	bc,#_object+0
	ld	a,(bc)
	ld	(#(_object + 0x0002)),a
;src/main.c:387: object.ly = object.y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_object + 0x0003)),a
;src/main.c:388: switch(object.dir){
	ld	a,(#_object + 7)
	cp	a,#0x02
	jr	Z,00103$
	cp	a,#0x04
	jr	Z,00102$
	cp	a,#0x06
	jr	Z,00101$
	sub	a, #0x08
	jr	Z,00104$
	ret
;src/main.c:389: case 6: object.x += 1; break;
00101$:
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
;src/main.c:390: case 4: object.x -= 1; break;
00102$:
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
;src/main.c:391: case 2: object.y += 2; break;
00103$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	ret
;src/main.c:392: case 8: object.y -= 2; break;
00104$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/main.c:393: }
	ret
;src/main.c:399: u8 followPlayer(u8 px,u8 py,u8 *x,u8 *y,u8 lx,u8 ly,u8 *dir,u8 room,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function followPlayer
; ---------------------------------
_followPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;src/main.c:401: dir[0] = setDirection(px,py,x[0],y[0]);
	ld	c,12 (ix)
	ld	b,13 (ix)
	ld	a,8 (ix)
	ld	-3 (ix),a
	ld	a,9 (ix)
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	d,(hl)
	ld	a,6 (ix)
	ld	-10 (ix),a
	ld	a,7 (ix)
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	call	_setDirection
	pop	af
	pop	af
	ld	d,l
	pop	bc
	ld	a,d
	ld	(bc),a
;src/main.c:402: movement(dir[0],&x[0],&y[0]);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	push	de
	inc	sp
	call	_movement
	pop	af
	pop	af
	inc	sp
;src/main.c:403: if(scene[(y[0])/tileheight][(x[0])/tilewidth] == 1
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-8 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-15 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-14 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-11 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix), a
	add	a, -15 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -14 (ix)
	ld	h,a
	ld	a,(hl)
	dec	a
	jp	Z,00101$
;src/main.c:404: || scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
	ld	l,-11 (ix)
	ld	h,#0x00
	ld	e,15 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-13 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-12 (ix),a
	ld	a,-13 (ix)
	ld	-5 (ix),a
	ld	a,-12 (ix)
	ld	-4 (ix),a
	ld	a,-12 (ix)
	rlca
	and	a,#0x01
	ld	-11 (ix),a
	inc	hl
	inc	hl
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00108$
	ld	a,-7 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	ld	-4 (ix),a
00108$:
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	pop	de
	push	de
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00101$
;src/main.c:405: || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] == 1
	ld	l,-8 (ix)
	ld	h,#0x00
	ld	e,16 (ix)
	ld	d,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	dec	bc
	dec	bc
	ld	e, c
	ld	a,b
	ld	d,a
	rlca
	and	a,#0x01
	ld	-5 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-15 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-14 (ix),a
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00109$
	pop	de
	push	de
00109$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-1 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00101$
;src/main.c:406: || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00110$
	pop	bc
	push	bc
00110$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-5 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-4 (ix),a
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00111$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
00111$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00102$
00101$:
;src/main.c:408: *x=lx;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,10 (ix)
	ld	(hl),a
;src/main.c:409: *y=ly;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,11 (ix)
	ld	(hl),a
00102$:
;src/main.c:412: return following;
	ld	l,#0x01
	ld	sp, ix
	pop	ix
	ret
;src/main.c:416: void patrol(u8 dir,u8 lx,u8 ly,u8 *x,u8 *y,u8 room,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function patrol
; ---------------------------------
_patrol::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;src/main.c:417: scene[(y[0])/tileheight][(x[0])/tilewidth] = room;
	ld	a,9 (ix)
	ld	-6 (ix),a
	ld	a,10 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	e,a
	ld	a,#>(_scene)
	adc	a, h
	ld	d,a
	ld	a,7 (ix)
	ld	-3 (ix),a
	ld	a,8 (ix)
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	l,(hl)
	srl	l
	srl	l
	ld	h,#0x00
	add	hl,de
	ld	a,11 (ix)
	ld	(hl),a
;src/main.c:419: movement(dir,&x[0],&y[0]);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_movement
	pop	af
	pop	af
	inc	sp
;src/main.c:421: if(scene[(y[0])/tileheight][(x[0])/tilewidth] != room
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-1 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-15 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-14 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-13 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-4 (ix), a
	add	a, -15 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -14 (ix)
	ld	h,a
	ld	a,11 (ix)
	sub	a,(hl)
	jp	NZ,00101$
;src/main.c:422: || scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] != room
	ld	l,-13 (ix)
	ld	h,#0x00
	ld	e,12 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-12 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-11 (ix),a
	ld	a,-12 (ix)
	ld	-8 (ix),a
	ld	a,-11 (ix)
	ld	-7 (ix),a
	ld	a,-11 (ix)
	rlca
	and	a,#0x01
	ld	-13 (ix),a
	inc	hl
	inc	hl
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00108$
	ld	a,-10 (ix)
	ld	-8 (ix),a
	ld	a,-9 (ix)
	ld	-7 (ix),a
00108$:
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	pop	de
	push	de
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jp	NZ,00101$
;src/main.c:423: || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] != room
	ld	l,-1 (ix)
	ld	h,#0x00
	ld	e,13 (ix)
	ld	d,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	dec	bc
	dec	bc
	ld	e, c
	ld	a,b
	ld	d,a
	rlca
	and	a,#0x01
	ld	-8 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-15 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-14 (ix),a
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00109$
	pop	de
	push	de
00109$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-4 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jr	NZ,00101$
;src/main.c:424: || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] != room
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00110$
	pop	bc
	push	bc
00110$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-8 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-7 (ix),a
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00111$
	ld	e,-10 (ix)
	ld	d,-9 (ix)
00111$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jr	Z,00102$
00101$:
;src/main.c:426: *x=lx;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/main.c:427: *y=ly;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,6 (ix)
	ld	(hl),a
00102$:
;src/main.c:429: scene[(y[0])/tileheight][(x[0])/tilewidth] = 2;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	e,a
	ld	a,#>(_scene)
	adc	a, h
	ld	d,a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	h,(hl)
	srl	h
	srl	h
	ld	l,h
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x02
	ld	sp, ix
	pop	ix
	ret
;src/main.c:455: u8* move(u8 *x,u8 *y,u8 lx, u8 ly,u8 sizeX,u8 sizeY,u8 *dir,u8 *s,u8 room,u8 px,u8 py,u8 *following){
;	---------------------------------
; Function move
; ---------------------------------
_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:456: u8 *sprite = s;
	ld	a,14 (ix)
	ld	-4 (ix),a
	ld	a,15 (ix)
	ld	-3 (ix),a
;src/main.c:459: dir[0] = chooseDirection(dir[0]);
	ld	e,12 (ix)
	ld	d,13 (ix)
;src/main.c:458: if(temp > 36){
	ld	a,#0x24
	ld	iy,#_temp
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_temp
	sbc	a, 1 (iy)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P,00110$
;src/main.c:459: dir[0] = chooseDirection(dir[0]);
	ld	a,(de)
	push	de
	push	af
	inc	sp
	call	_chooseDirection
	inc	sp
	ld	a,l
	pop	de
	ld	(de),a
;src/main.c:460: temp = 0;
	ld	hl,#0x0000
	ld	(_temp),hl
	jp	00111$
00110$:
;src/main.c:464: if(temp%6== 0){
	push	de
	ld	hl,#0x0006
	push	hl
	ld	hl,(_temp)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	ld	a,h
	or	a,l
	jp	NZ,00111$
;src/main.c:465: detected = detectPlayerRoom(px,py,room);
	push	de
	ld	h,16 (ix)
	ld	l,18 (ix)
	push	hl
	ld	a,17 (ix)
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	inc	sp
	pop	de
;src/main.c:467: if(following[0] == 1){
	ld	a,19 (ix)
	ld	-2 (ix),a
	ld	a,20 (ix)
	ld	-1 (ix),a
;src/main.c:468: followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	c,6 (ix)
	ld	b,7 (ix)
	push	bc
	pop	iy
	ld	c,4 (ix)
	ld	b,5 (ix)
;src/main.c:466: if(detected == 0){
	ld	a,l
	or	a, a
	jr	NZ,00105$
;src/main.c:467: if(following[0] == 1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	dec	a
	jr	NZ,00102$
;src/main.c:468: followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	h,11 (ix)
	ld	l,10 (ix)
	push	hl
	ld	a,16 (ix)
	push	af
	inc	sp
	push	de
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	iy
	push	bc
	ld	h,18 (ix)
	ld	l,17 (ix)
	push	hl
	call	_followPlayer
	ld	hl,#13
	add	hl,sp
	ld	sp,hl
	jr	00111$
00102$:
;src/main.c:470: patrol(dir[0],lx,ly,&x[0],&y[0],room,sizeX,sizeY);
	ld	a,(de)
	ld	d,a
	ld	h,11 (ix)
	ld	l,10 (ix)
	push	hl
	ld	a,16 (ix)
	push	af
	inc	sp
	push	iy
	push	bc
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	de
	inc	sp
	call	_patrol
	ld	hl,#10
	add	hl,sp
	ld	sp,hl
	jr	00111$
00105$:
;src/main.c:473: following[0] = followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	h,11 (ix)
	ld	l,10 (ix)
	push	hl
	ld	a,16 (ix)
	push	af
	inc	sp
	push	de
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	iy
	push	bc
	ld	h,18 (ix)
	ld	l,17 (ix)
	push	hl
	call	_followPlayer
	ld	iy,#13
	add	iy,sp
	ld	sp,iy
	ld	a,l
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
00111$:
;src/main.c:478: temp += 2;
	ld	hl,#_temp
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;src/main.c:479: return sprite;
	pop	hl
	push	hl
	ld	sp, ix
	pop	ix
	ret
;src/main.c:486: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-120
	add	hl,sp
	ld	sp,hl
;src/main.c:487: TPlayer p = {0,80,0,80,gladis_quieto_dcha,3,6,4,16,4,0,0,3,0,0};
	ld	hl,#0x0010
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0010
	add	hl,sp
	ld	-54 (ix),l
	ld	-53 (ix),h
	ld	a,-54 (ix)
	add	a, #0x01
	ld	-27 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-26 (ix),a
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),#0x50
	ld	a,-54 (ix)
	add	a, #0x02
	ld	-64 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-63 (ix),a
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	(hl),#0x00
	ld	a,-54 (ix)
	add	a, #0x03
	ld	-38 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-37 (ix),a
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	(hl),#0x50
	ld	a,-54 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_gladis_quieto_dcha)
	inc	hl
	ld	(hl),#>(_gladis_quieto_dcha)
	ld	a,-54 (ix)
	add	a, #0x06
	ld	-8 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x03
	ld	a,-54 (ix)
	add	a, #0x07
	ld	-62 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-61 (ix),a
	ld	l,-62 (ix)
	ld	h,-61 (ix)
	ld	(hl),#0x06
	ld	a,-54 (ix)
	add	a, #0x08
	ld	-80 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-79 (ix),a
	ld	l,-80 (ix)
	ld	h,-79 (ix)
	ld	(hl),#0x04
	ld	a,-54 (ix)
	add	a, #0x09
	ld	-14 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x10
	ld	a,-54 (ix)
	add	a, #0x0A
	ld	-74 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-73 (ix),a
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	ld	(hl),#0x04
	ld	a,-54 (ix)
	add	a, #0x0B
	ld	-76 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-75 (ix),a
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	ld	(hl),#0x00
	ld	a,-54 (ix)
	add	a, #0x0C
	ld	-66 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-65 (ix),a
	ld	l,-66 (ix)
	ld	h,-65 (ix)
	ld	(hl),#0x00
	ld	a,-54 (ix)
	add	a, #0x0D
	ld	-29 (ix),a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	-28 (ix),a
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	(hl),#0x03
	ld	a,-54 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-54 (ix)
	add	a, #0x0F
	ld	l,a
	ld	a,-53 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/main.c:488: TPlayer e = {52,80,52,80,chacho_quieto_dcha,3,6,4,16,4,0,0,0,1,3};
	ld	hl,#0x0000
	add	hl,sp
	ld	(hl),#0x34
	ld	hl,#0x0000
	add	hl,sp
	ld	-78 (ix),l
	ld	-77 (ix),h
	ld	a,-78 (ix)
	add	a, #0x01
	ld	-40 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-39 (ix),a
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	(hl),#0x50
	ld	a,-78 (ix)
	add	a, #0x02
	ld	-56 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-55 (ix),a
	ld	l,-56 (ix)
	ld	h,-55 (ix)
	ld	(hl),#0x34
	ld	a,-78 (ix)
	add	a, #0x03
	ld	-58 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-57 (ix),a
	ld	l,-58 (ix)
	ld	h,-57 (ix)
	ld	(hl),#0x50
	ld	a,-78 (ix)
	add	a, #0x04
	ld	-60 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-59 (ix),a
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	(hl),#<(_chacho_quieto_dcha)
	inc	hl
	ld	(hl),#>(_chacho_quieto_dcha)
	ld	a,-78 (ix)
	add	a, #0x06
	ld	-4 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
	ld	a,-78 (ix)
	add	a, #0x07
	ld	e,a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,#0x06
	ld	(de),a
	ld	a,-78 (ix)
	add	a, #0x08
	ld	-6 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x04
	ld	a,-78 (ix)
	add	a, #0x09
	ld	-34 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-33 (ix),a
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),#0x10
	ld	a,-78 (ix)
	add	a, #0x0A
	ld	-36 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-35 (ix),a
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	(hl),#0x04
	ld	a,-78 (ix)
	add	a, #0x0B
	ld	l,a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-78 (ix)
	add	a, #0x0C
	ld	l,a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-78 (ix)
	add	a, #0x0D
	ld	l,a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-78 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x01
	ld	a,-78 (ix)
	add	a, #0x0F
	ld	-20 (ix),a
	ld	a,-77 (ix)
	adc	a, #0x00
	ld	-19 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#0x03
;src/main.c:494: u8 finish = 0,i=1,arrow=0,following = 0;
	ld	-88 (ix),#0x00
	ld	-87 (ix),#0x00
	ld	-86 (ix),#0x00
;src/main.c:496: u8 bound =0;
	ld	-21 (ix),#0x00
;src/main.c:497: temp = 0;
	ld	hl,#0x0000
	ld	(_temp),hl
;src/main.c:499: cpct_clearScreen(0);
	push	de
	ld	h, #0x40
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
;src/main.c:504: while (1){
	ld	a,-29 (ix)
	ld	-23 (ix),a
	ld	a,-28 (ix)
	ld	-22 (ix),a
	ld	a,-80 (ix)
	ld	-25 (ix),a
	ld	a,-79 (ix)
	ld	-24 (ix),a
	ld	a,-62 (ix)
	ld	-16 (ix),a
	ld	a,-61 (ix)
	ld	-15 (ix),a
	ld	a,-76 (ix)
	ld	-18 (ix),a
	ld	a,-75 (ix)
	ld	-17 (ix),a
	ld	a,-27 (ix)
	ld	-10 (ix),a
	ld	a,-26 (ix)
	ld	-9 (ix),a
	ld	a,-54 (ix)
	ld	-12 (ix),a
	ld	a,-53 (ix)
	ld	-11 (ix),a
	ld	a,-27 (ix)
	ld	-48 (ix),a
	ld	a,-26 (ix)
	ld	-47 (ix),a
	ld	a,-54 (ix)
	ld	-50 (ix),a
	ld	a,-53 (ix)
	ld	-49 (ix),a
	ld	-52 (ix),e
	ld	-51 (ix),d
	ld	a,-40 (ix)
	ld	-82 (ix),a
	ld	a,-39 (ix)
	ld	-81 (ix),a
	ld	a,-78 (ix)
	ld	-84 (ix),a
	ld	a,-77 (ix)
	ld	-83 (ix),a
00125$:
;src/main.c:507: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:510: erasePlayer(p.lx,p.ly,p.lsize,p.sizeY);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	b,(hl)
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	ld	a,(hl)
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	e,(hl)
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	d,(hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_erasePlayer
	pop	af
	pop	af
;src/main.c:511: erasePlayer(e.lx,e.ly,e.lsize,e.sizeY);
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	b,(hl)
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	a,(hl)
	ld	l,-58 (ix)
	ld	h,-57 (ix)
	ld	e,(hl)
	ld	l,-56 (ix)
	ld	h,-55 (ix)
	ld	d,(hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_erasePlayer
	pop	af
	pop	af
;src/main.c:512: if(arrow == 1){
	ld	a,-87 (ix)
	dec	a
	jr	NZ,00104$
;src/main.c:513: erasePlayer(object.lx,object.ly,object.sizeX,object.sizeY);
	ld	hl, #(_object + 0x0009) + 0
	ld	b,(hl)
	ld	a, (#(_object + 0x0008) + 0)
	ld	hl, #(_object + 0x0003) + 0
	ld	e,(hl)
	ld	hl, #(_object + 0x0002) + 0
	ld	d,(hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_erasePlayer
	pop	af
	pop	af
;src/main.c:514: if(bound == 1) arrow = 0;
	ld	a,-21 (ix)
	dec	a
	jr	NZ,00104$
	ld	-87 (ix),#0x00
00104$:
;src/main.c:518: drawPlayer(p.x,p.y,p.sprite,p.sizeX,p.sizeY);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,(hl)
	ld	l,-80 (ix)
	ld	h,-79 (ix)
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	push	af
	ld	a,(hl)
	ld	-85 (ix),a
	pop	af
	ld	l,-54 (ix)
	ld	h,-53 (ix)
	ld	d,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	bc
	ld	a,-85 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:519: drawPlayer(e.x,e.y,e.sprite,e.sizeX,e.sizeY);
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,(hl)
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	push	af
	ld	a,(hl)
	ld	-85 (ix),a
	pop	af
	ld	l,-78 (ix)
	ld	h,-77 (ix)
	ld	d,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	bc
	ld	a,-85 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:520: if(arrow == 1) drawPlayer(object.x,object.y,object.sprite,object.sizeX,object.sizeY);
	ld	a,-87 (ix)
	dec	a
	jr	NZ,00106$
	ld	a, (#(_object + 0x0009) + 0)
	ld	hl, #(_object + 0x0008) + 0
	ld	d,(hl)
	ld	bc, (#_object + 4)
	ld	hl, #(_object + 0x0001) + 0
	ld	e,(hl)
	ld	hl, #_object + 0
	push	af
	ld	a,(hl)
	ld	-85 (ix),a
	pop	af
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	ld	a,e
	push	af
	inc	sp
	ld	a,-85 (ix)
	push	af
	inc	sp
	call	_drawPlayer
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00106$:
;src/main.c:523: drawVida(p.life);
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawVida
	inc	sp
;src/main.c:524: drawBullets(p.bullets);
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawBullets
	inc	sp
;src/main.c:527: if(p.atk < 20) drawFatiga(p.atk,2);
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x14
	jr	NC,00111$
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00112$
00111$:
;src/main.c:528: else if(p.atk > 20) drawFatiga(p.atk,16);
	ld	a,#0x14
	sub	a, d
	jr	NC,00108$
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00112$
00108$:
;src/main.c:529: else drawFatiga(p.atk,0);
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
00112$:
;src/main.c:532: p.lx = p.x;
	ld	l,-54 (ix)
	ld	h,-53 (ix)
	ld	a,(hl)
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	(hl),a
;src/main.c:533: p.ly = p.y;
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	a,(hl)
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	(hl),a
;src/main.c:534: e.lx = e.x;
	ld	l,-78 (ix)
	ld	h,-77 (ix)
	ld	a,(hl)
	ld	l,-56 (ix)
	ld	h,-55 (ix)
	ld	(hl),a
;src/main.c:535: e.ly = e.y;
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	a,(hl)
	ld	l,-58 (ix)
	ld	h,-57 (ix)
	ld	(hl),a
;src/main.c:536: p.latk = p.atk;
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	ld	a,(hl)
	ld	l,-66 (ix)
	ld	h,-65 (ix)
	ld	(hl),a
;src/main.c:537: p.lsize = p.sizeX;
	ld	l,-80 (ix)
	ld	h,-79 (ix)
	ld	a,(hl)
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	ld	(hl),a
;src/main.c:540: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:541: p.sprite = checkKeyboard(&p.x,&p.y,&p.atk,&p.dir,p.sprite,&p.sizeX,&p.bullets,&finish,&arrow);
	ld	hl,#0x0021
	add	hl,sp
	ex	de,hl
	ld	hl,#0x0020
	add	hl,sp
	ld	-42 (ix),l
	ld	-41 (ix),h
	ld	c,-23 (ix)
	ld	b,-22 (ix)
	ld	a,-25 (ix)
	ld	-44 (ix),a
	ld	a,-24 (ix)
	ld	-43 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-46 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-45 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-18 (ix)
	ld	-68 (ix),a
	ld	a,-17 (ix)
	ld	-67 (ix),a
	ld	a,-10 (ix)
	ld	-70 (ix),a
	ld	a,-9 (ix)
	ld	-69 (ix),a
	ld	a,-12 (ix)
	ld	-72 (ix),a
	ld	a,-11 (ix)
	ld	-71 (ix),a
	push	de
	ld	e,-42 (ix)
	ld	d,-41 (ix)
	push	de
	push	bc
	ld	c,-44 (ix)
	ld	b,-43 (ix)
	push	bc
	ld	c,-46 (ix)
	ld	b,-45 (ix)
	push	bc
	push	hl
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	push	hl
	ld	l,-70 (ix)
	ld	h,-69 (ix)
	push	hl
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	push	hl
	call	_checkKeyboard
	ld	iy,#18
	add	iy,sp
	ld	sp,iy
	ld	d,l
	ld	e,h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:542: checkBoundsCollisions(&p.x,&p.y,p.lx,p.ly,p.sizeX,p.sizeY);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	d,(hl)
	ld	l,-80 (ix)
	ld	h,-79 (ix)
	ld	e,(hl)
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	a,(hl)
	ld	-72 (ix),a
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	a,(hl)
	ld	-70 (ix),a
	ld	c,-48 (ix)
	ld	b,-47 (ix)
	push	bc
	pop	iy
	ld	c,-50 (ix)
	ld	b,-49 (ix)
	push	de
	ld	h,-72 (ix)
	ld	l,-70 (ix)
	push	hl
	push	iy
	push	bc
	call	_checkBoundsCollisions
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
;src/main.c:543: e.sprite = move(&e.x,&e.y,e.lx,e.ly,e.sizeX,e.sizeY,&e.dir,e.sprite,e.room,p.x,p.y,&following);
	ld	hl,#0x0022
	add	hl,sp
	ld	-72 (ix),l
	ld	-71 (ix),h
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	a,(hl)
	ld	-70 (ix),a
	ld	l,-54 (ix)
	ld	h,-53 (ix)
	ld	a,(hl)
	ld	-68 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-46 (ix),a
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	a,(hl)
	ld	-44 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-43 (ix),a
	ld	a,-52 (ix)
	ld	-42 (ix),a
	ld	a,-51 (ix)
	ld	-41 (ix),a
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	a,(hl)
	ld	-85 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	ld	l,-58 (ix)
	ld	h,-57 (ix)
	ld	a,(hl)
	ld	-31 (ix),a
	ld	l,-56 (ix)
	ld	h,-55 (ix)
	ld	a,(hl)
	ld	-32 (ix),a
	ld	e,-82 (ix)
	ld	d,-81 (ix)
	ld	c,-84 (ix)
	ld	b,-83 (ix)
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	push	hl
	ld	h,-70 (ix)
	ld	l,-68 (ix)
	push	hl
	ld	a,-46 (ix)
	push	af
	inc	sp
	ld	l,-44 (ix)
	ld	h,-43 (ix)
	push	hl
	ld	l,-42 (ix)
	ld	h,-41 (ix)
	push	hl
	ld	h,-85 (ix)
	ld	l,-30 (ix)
	push	hl
	ld	h,-31 (ix)
	ld	l,-32 (ix)
	push	hl
	push	de
	push	bc
	call	_move
	ld	iy,#17
	add	iy,sp
	ld	sp,iy
	ld	d,l
	ld	e,h
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:545: if(checkCollisions(p.x, p.y, e.x, e.y, p.dir, p.atk) == 2){
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	ld	a,(hl)
	ld	-72 (ix),a
	ld	-71 (ix),#0x00
	ld	l,-62 (ix)
	ld	h,-61 (ix)
	ld	a,(hl)
	ld	-70 (ix),a
	ld	-69 (ix),#0x00
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	d,(hl)
	ld	l,-78 (ix)
	ld	h,-77 (ix)
	ld	e,(hl)
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	b,(hl)
	ld	l,-54 (ix)
	ld	h,-53 (ix)
	ld	c,(hl)
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	push	hl
	ld	l,-70 (ix)
	ld	h,-69 (ix)
	push	hl
	push	de
	push	bc
	call	_checkCollisions
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	sub	a, #0x02
	jr	NZ,00118$
;src/main.c:546: p.x = 2;
	ld	l,-54 (ix)
	ld	h,-53 (ix)
	ld	(hl),#0x02
;src/main.c:547: p.y = 100;
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),#0x64
;src/main.c:548: p.life--;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a,#0xFF
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),a
;src/main.c:549: if(p.life == 0)
	or	a, a
	jr	NZ,00119$
;src/main.c:550: return;
	jp	00127$
00118$:
;src/main.c:551: }else if(checkCollisions(p.x, p.y, e.x, e.y, p.dir, p.atk) == 1)
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	ld	a,(hl)
	ld	-72 (ix),a
	ld	-71 (ix),#0x00
	ld	l,-62 (ix)
	ld	h,-61 (ix)
	ld	a,(hl)
	ld	-70 (ix),a
	ld	-69 (ix),#0x00
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	c,(hl)
	ld	l,-78 (ix)
	ld	h,-77 (ix)
	ld	b,(hl)
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	e,(hl)
	ld	l,-54 (ix)
	ld	h,-53 (ix)
	ld	d,(hl)
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	push	hl
	ld	l,-70 (ix)
	ld	h,-69 (ix)
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_checkCollisions
	pop	af
	pop	af
	pop	af
	pop	af
	dec	l
	jr	NZ,00119$
;src/main.c:552: e.life = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
00119$:
;src/main.c:554: if(arrow == 1){
	ld	a,-87 (ix)
	dec	a
	jr	NZ,00121$
;src/main.c:555: moveObject();
	call	_moveObject
;src/main.c:556: bound = checkBoundsCollisions(&object.x,&object.y,object.lx,object.ly,object.sizeX,object.sizeY);
	ld	hl, #(_object + 0x0009) + 0
	ld	c,(hl)
	ld	hl, #(_object + 0x0008) + 0
	ld	e,(hl)
	ld	a,(#(_object + 0x0003) + 0)
	ld	-32 (ix),a
	ld	hl, #(_object + 0x0002) + 0
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	a,-32 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#(_object + 0x0001)
	push	hl
	ld	hl,#_object
	push	hl
	call	_checkBoundsCollisions
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-21 (ix),l
00121$:
;src/main.c:559: if(finish == 1) return;
	ld	a,-88 (ix)
	dec	a
	jp	NZ,00125$
00127$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:566: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:568: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:569: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:570: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:572: while (1){
00104$:
;src/main.c:574: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:578: if(cpct_isKeyPressed(Key_Esc)) {
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:580: return;
	ret
___str_4:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:587: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:591: init();
	call	_init
;src/main.c:594: while(1){
00106$:
;src/main.c:595: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:596: switch(x){
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
;src/main.c:597: case 0: return;break;
;src/main.c:598: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:599: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:600: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
