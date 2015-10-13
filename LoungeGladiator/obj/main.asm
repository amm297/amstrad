;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Tue Oct 13 15:46:51 2015
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
	.globl _vissionSensor
	.globl _patrol
	.globl _followPlayer
	.globl _moveObject
	.globl _checkKeyboard
	.globl _checkBoundsCollisions
	.globl _checkArrowCollisions
	.globl _checkBoundsCollisionsEnemy
	.globl _drawBullets
	.globl _drawVida
	.globl _drawFatiga
	.globl _erasePlayer
	.globl _drawPlayer
	.globl _drawMap
	.globl _menu
	.globl _gameOver
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
	.globl _path
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
_path::
	.ds 1
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
	.db #0x0A	; 10
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
;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
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
;src/CalcColision.h:8: u8 popX = pX + tilewidth;
	ld	l,4 (ix)
	inc	l
	inc	l
	inc	l
	inc	l
;src/CalcColision.h:9: u8 popY = pY + tileheight;
	ld	a,5 (ix)
	add	a, #0x10
	ld	-5 (ix),a
;src/CalcColision.h:10: u8 eopX = eX + tilewidth;
	ld	e,6 (ix)
	inc	e
	inc	e
	inc	e
	inc	e
;src/CalcColision.h:11: u8 eopY = eY + tileheight;
	ld	a,7 (ix)
	add	a, #0x10
	ld	-6 (ix),a
;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
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
;src/CalcColision.h:14: if(atk >= 21)
	ld	a,8 (ix)
	sub	a, #0x15
	ld	a,#0x00
	rla
	ld	-3 (ix),a
;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
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
;src/CalcColision.h:14: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00102$
;src/CalcColision.h:15: return 1;
	ld	l,#0x01
	jp	00133$
00102$:
;src/CalcColision.h:17: return 2;
	ld	l,#0x02
	jp	00133$
00105$:
;src/CalcColision.h:19: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
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
;src/CalcColision.h:20: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00110$
;src/CalcColision.h:21: return 1;
	ld	l,#0x01
	jr	00133$
00110$:
;src/CalcColision.h:23: return 2;
	ld	l,#0x02
	jr	00133$
00113$:
;src/CalcColision.h:25: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
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
;src/CalcColision.h:26: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00118$
;src/CalcColision.h:27: return 1;
	ld	l,#0x01
	jr	00133$
00118$:
;src/CalcColision.h:29: return 2;
	ld	l,#0x02
	jr	00133$
00121$:
;src/CalcColision.h:31: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
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
;src/CalcColision.h:32: if(atk >= 21)
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00126$
;src/CalcColision.h:33: return 1;
	ld	l,#0x01
	jr	00133$
00126$:
;src/CalcColision.h:35: return 2;
	ld	l,#0x02
	jr	00133$
00129$:
;src/CalcColision.h:37: return 0;
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
;src/main.c:42: void gameOver(){
;	---------------------------------
; Function gameOver
; ---------------------------------
_gameOver::
;src/main.c:44: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:45: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:46: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	c, l
	ld	b, h
	ld	de,#___str_0
	ld	hl,#0x0001
	push	hl
	push	bc
	push	de
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ret
___str_0:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:51: int menu(){
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
;src/main.c:53: int init = 50;
	ld	-4 (ix),#0x32
	ld	-3 (ix),#0x00
;src/main.c:54: int pushed =0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:55: int cont =0;
	ld	de,#0x0000
;src/main.c:56: cpct_clearScreen(0);
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
;src/main.c:59: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
	ld	hl,#0x3214
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:63: cpct_drawStringM0("Nueva Partida",memptr,1,0);
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
	ld	hl,#0x4614
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:66: cpct_drawStringM0("Creditos",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_3
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
;src/main.c:59: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:69: cpct_drawStringM0("Salir",memptr,1,0);
	ld	bc,#___str_4
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
;src/main.c:75: while(1){
00118$:
;src/main.c:77: cpct_scanKeyboard();
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
;src/main.c:79: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:80: pushed ++;
	inc	-6 (ix)
	jr	NZ,00163$
	inc	-5 (ix)
00163$:
;src/main.c:81: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:83: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
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
;src/main.c:84: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:85: pushed --;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
;src/main.c:86: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:89: switch (pushed){
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
;src/main.c:90: case 0: init = 50;break;
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
;src/main.c:91: case 1: init = 70;break;
00108$:
	ld	-4 (ix),#0x46
	ld	-3 (ix),#0x00
	jr	00110$
;src/main.c:92: case 2: init = 90;break;
00109$:
	ld	-4 (ix),#0x5A
	ld	-3 (ix),#0x00
;src/main.c:93: }
00110$:
;src/main.c:94: memptr = cpct_getScreenPtr(VMEM,15,init);
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
;src/main.c:59: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:95: cpct_drawSolidBox(memptr, 3, 2, 8);
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
;src/main.c:97: switch (pushed){
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
;src/main.c:98: case 0: return 1;break;
	jp	(hl)
00167$:
	jr	00111$
	jr	00112$
	jr	00113$
00111$:
	ld	hl,#0x0001
	jr	00120$
;src/main.c:99: case 1: return 2;break;
00112$:
	ld	hl,#0x0002
	jr	00120$
;src/main.c:100: case 2: return 0;break;
00113$:
	ld	hl,#0x0000
	jr	00120$
;src/main.c:101: }
00116$:
;src/main.c:103: cont++;
	inc	de
	jp	00118$
00120$:
	ld	sp, ix
	pop	ix
	ret
___str_1:
	.ascii "Lounge Gladiator"
	.db 0x00
___str_2:
	.ascii "Nueva Partida"
	.db 0x00
___str_3:
	.ascii "Creditos"
	.db 0x00
___str_4:
	.ascii "Salir"
	.db 0x00
;src/main.c:118: void drawMap(u8 t){
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
;src/main.c:122: if(t == 1){
	ld	a,4 (ix)
	dec	a
	jp	NZ,00104$
;src/main.c:123: for(y=0;y<height;y++){
	ld	hl,#0x0000
	ex	(sp), hl
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;src/main.c:124: for(x=0;x<width;x++){
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
;src/main.c:125: scene[y][x] = mapa1[y][x];
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
;src/main.c:124: for(x=0;x<width;x++){
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
;src/main.c:123: for(y=0;y<height;y++){
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
;src/main.c:130: if(t == 2){
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00141$
;src/main.c:131: for(y=0;y<height;y++){
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
;src/main.c:132: for(x=0;x<width;x++){
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
;src/main.c:133: scene[y][x] = mapa2[y][x];
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
;src/main.c:132: for(x=0;x<width;x++){
	inc	bc
	ld	a,c
	sub	a, #0x14
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00119$
;src/main.c:131: for(y=0;y<height;y++){
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
;src/main.c:138: for(posY=0; posY<height;posY++){
00141$:
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
;src/main.c:139: for(posX=0; posX<width;posX++){
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
;src/main.c:140: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
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
;src/main.c:141: if(scene[posY][posX] == 1){
	ld	a,-10 (ix)
	add	a, -12 (ix)
	ld	l,a
	ld	a,-9 (ix)
	adc	a, -11 (ix)
	ld	h,a
	ld	h,(hl)
;src/main.c:142: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	-8 (ix),e
	ld	-7 (ix),d
;src/main.c:141: if(scene[posY][posX] == 1){
	dec	h
	jr	NZ,00110$
;src/main.c:142: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
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
;src/main.c:144: if(scene[posY][posX] == 9){
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
;src/main.c:145: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
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
;src/main.c:139: for(posX=0; posX<width;posX++){
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
;src/main.c:138: for(posY=0; posY<height;posY++){
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
;src/main.c:153: void drawPlayer(u8 x,u8 y,u8 *sprite,u8 sizeX,u8 sizeY,u8 life){
;	---------------------------------
; Function drawPlayer
; ---------------------------------
_drawPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:155: if(life > 0){
	ld	a,10 (ix)
	or	a, a
	jr	Z,00103$
;src/main.c:156: memptr = cpct_getScreenPtr(VMEM,x,y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:157: cpct_drawSpriteMasked(sprite, memptr, sizeX, sizeY);
	ld	c, l
	ld	b, h
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00103$:
	pop	ix
	ret
;src/main.c:161: void erasePlayer(u8 x,u8 y,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function erasePlayer
; ---------------------------------
_erasePlayer::
;src/main.c:164: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/main.c:165: cpct_drawSolidBox(memptr,0,sizeX,sizeY);
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
;src/main.c:173: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:175: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/main.c:176: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/main.c:177: if(atk > 30 || atk <= 20){
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
;src/main.c:178: memptr = cpct_getScreenPtr(VMEM,4,192);
	push	de
	ld	hl,#0xC004
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:179: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:181: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00106$
	ld	a,d
	or	a, a
	jr	NZ,00107$
00106$:
;src/main.c:182: memptr = cpct_getScreenPtr(VMEM,7,192);
	push	de
	ld	hl,#0xC007
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:183: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:185: if(atk <= 20){
	ld	a,d
	or	a, a
	jr	NZ,00111$
;src/main.c:186: memptr = cpct_getScreenPtr(VMEM,10,192);
	ld	hl,#0xC00A
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:187: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:192: void drawVida(u8 life){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:194: if(life >= 1){
	ld	a,4 (ix)
	sub	a, #0x01
	jr	C,00102$
;src/main.c:195: memptr = cpct_getScreenPtr(VMEM,65,192);
	ld	hl,#0xC041
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:196: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00102$:
;src/main.c:198: memptr = cpct_getScreenPtr(VMEM,70,192);
	ld	hl,#0xC046
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:196: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
;src/main.c:199: if(life >= 2)
	ld	a,4 (ix)
	sub	a, #0x02
	jr	C,00104$
;src/main.c:200: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00105$
00104$:
;src/main.c:202: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	de,#_corazon_roto
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
00105$:
;src/main.c:203: memptr = cpct_getScreenPtr(VMEM,75,192);
	ld	hl,#0xC04B
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:196: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ex	de,hl
;src/main.c:204: if(life >= 3)
	ld	a,4 (ix)
	sub	a, #0x03
	jr	C,00107$
;src/main.c:205: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	bc,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00109$
00107$:
;src/main.c:207: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	ld	bc,#_corazon_roto+0
	ld	hl,#0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00109$:
	pop	ix
	ret
;src/main.c:211: void drawBullets(u8 bullet){
;	---------------------------------
; Function drawBullets
; ---------------------------------
_drawBullets::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:215: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0032
00105$:
;src/main.c:216: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/main.c:217: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:218: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
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
;src/main.c:219: else  cpct_drawSolidBox(memptr,0,2,8);
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
;src/main.c:215: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:242: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
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
;src/main.c:244: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:245: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:246: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:247: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:248: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:249: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:251: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:252: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
	jp	00112$
00107$:
;src/main.c:254: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
	ld	a,-8 (ix)
	sub	a, #0x03
	jp	NZ,00101$
;src/main.c:255: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:256: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
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
;src/main.c:257: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:259: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:260: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:264: void checkArrowCollisions(u8 *arrow){
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
;src/main.c:266: u8 posX = object.x;
	ld	a,(#_object+0)
	ld	-12 (ix),a
;src/main.c:267: u8 posY = object.y;
	ld	a,(#_object + 1)
;src/main.c:268: if(    scene[(posY)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:269: || scene[(posY)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:270: || scene[(posY+object.sizeY-2)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:271: || scene[(posY+object.sizeY-2)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:273: arrow[0] = 0;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x00
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:277: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
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
;src/main.c:279: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:280: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:281: u8 bound = 0;
	ld	-21 (ix),#0x00
;src/main.c:282: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:283: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:284: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:285: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:287: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:288: *posY=ly;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:289: bound = 1;
	ld	-21 (ix),#0x01
	jp	00126$
00125$:
;src/main.c:291: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 2
	ld	a,-13 (ix)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:292: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
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
;src/main.c:293: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 2
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
;src/main.c:294: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
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
;src/main.c:297: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:298: *posY=ly;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,9 (ix)
	ld	(hl),a
	jp	00126$
00119$:
;src/main.c:300: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6
	ld	a,-13 (ix)
	sub	a, #0x06
	jp	Z,00126$
;src/main.c:301: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 6
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
;src/main.c:302: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 6
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
;src/main.c:303: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 6
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
;src/main.c:306: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5
	ld	a,-13 (ix)
	sub	a, #0x05
	jp	Z,00126$
;src/main.c:307: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
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
;src/main.c:308: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 5
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
;src/main.c:309: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
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
;src/main.c:312: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9
	ld	a,-13 (ix)
	sub	a, #0x09
	jp	Z,00101$
;src/main.c:313: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
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
;src/main.c:314: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 9
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
;src/main.c:315: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
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
;src/main.c:317: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:318: drawMap(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_drawMap
	inc	sp
00126$:
;src/main.c:320: return bound;
	ld	l,-21 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:325: u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *bullets,u8 *finish,u8 *arrow){
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
;src/main.c:327: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
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
;src/main.c:328: size[0] = 5;
	ld	a,14 (ix)
	ld	-17 (ix),a
	ld	a,15 (ix)
	ld	-16 (ix),a
;src/main.c:331: if(dir[0] == 6) {s = gladis_atk_dcha;}
	ld	a,10 (ix)
	ld	-8 (ix),a
	ld	a,11 (ix)
	ld	-7 (ix),a
;src/main.c:356: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
	ld	a,20 (ix)
	ld	-13 (ix),a
	ld	a,21 (ix)
	ld	-12 (ix),a
;src/main.c:327: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
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
;src/main.c:328: size[0] = 5;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x05
;src/main.c:329: if(atk[0] >= 50) atk[0] =0;
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
;src/main.c:330: else atk[0] += 1;
	ld	a,-11 (ix)
	inc	a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
00103$:
;src/main.c:331: if(dir[0] == 6) {s = gladis_atk_dcha;}
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
;src/main.c:332: else if(dir[0] == 4) {s = gladis_atk_izda;}
	ld	a,-11 (ix)
	sub	a, #0x04
	jp	NZ,00141$
	ld	12 (ix),#<(_gladis_atk_izda)
	ld	13 (ix),#>(_gladis_atk_izda)
	jp	00141$
00140$:
;src/main.c:334: if(atk[0] < 20) atk[0] += 1;
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
;src/main.c:335: else atk[0] = 20;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x14
00111$:
;src/main.c:336: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
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
;src/main.c:337: x[0] += 1;
	inc	d
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),d
;src/main.c:338: dir[0] = 6;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x06
;src/main.c:339: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:340: sprite = gladis_quieto_dcha;
	jp	00141$
00136$:
;src/main.c:341: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
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
;src/main.c:342: x[0] -= 1;
	add	a,#0xFF
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/main.c:343: dir[0] = 4;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x04
;src/main.c:344: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:345: sprite = gladis_quieto_izda;
	jp	00141$
00132$:
;src/main.c:346: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
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
;src/main.c:347: y[0] += 2;
	inc	d
	inc	d
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),d
;src/main.c:348: dir[0] = 2;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x02
;src/main.c:349: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:350: sprite = gladis_quieto_dcha;
	jp	00141$
00128$:
;src/main.c:351: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
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
;src/main.c:352: y[0] -= 2;
	add	a,#0xFE
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	(hl),a
;src/main.c:353: dir[0] = 8;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x08
;src/main.c:354: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:355: sprite = gladis_arriba_dcha;
	jp	00141$
00124$:
;src/main.c:356: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
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
;src/main.c:357: if(bullets[0] > 0){
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
;src/main.c:359: u8 *spr = flecha_dcha,xs=2,ys=8;
	ld	-4 (ix),#<(_flecha_dcha)
	ld	-3 (ix),#>(_flecha_dcha)
	ld	-18 (ix),#0x02
	ld	-19 (ix),#0x08
;src/main.c:360: switch(dir[0]){
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
;src/main.c:361: case 6: spr = flecha_dcha; xs=4;ys=4; break;
00112$:
	ld	-4 (ix),#<(_flecha_dcha)
	ld	-3 (ix),#>(_flecha_dcha)
	ld	-18 (ix),#0x04
	ld	-19 (ix),#0x04
	jr	00116$
;src/main.c:362: case 4: spr = flecha_izda; xs=4;ys=4; break;
00113$:
	ld	-4 (ix),#<(_flecha_izda)
	ld	-3 (ix),#>(_flecha_izda)
	ld	-18 (ix),#0x04
	ld	-19 (ix),#0x04
	jr	00116$
;src/main.c:363: case 2: spr = flecha_abajo; xs=2;ys=8; break;
00114$:
	ld	-4 (ix),#<(_flecha_abajo)
	ld	-3 (ix),#>(_flecha_abajo)
	ld	-18 (ix),#0x02
	ld	-19 (ix),#0x08
	jr	00116$
;src/main.c:364: case 8: spr = flecha_arriba; xs=2;ys=8; break;
00115$:
	ld	-4 (ix),#<(_flecha_arriba)
	ld	-3 (ix),#>(_flecha_arriba)
	ld	-18 (ix),#0x02
	ld	-19 (ix),#0x08
;src/main.c:365: }
00116$:
;src/main.c:366: object.x = x[0]+4;
	ld	de,#_object+0
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	add	a, #0x04
	ld	(de),a
;src/main.c:367: object.y = y[0]+8;
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	add	a, #0x08
	ld	(#(_object + 0x0001)),a
;src/main.c:368: object.x = object.x;
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	hl,#_object
	ld	(hl),d
;src/main.c:369: object.y = object.y;
	ld	(#(_object + 0x0001)),a
;src/main.c:370: object.sprite = spr;
	ld	hl,#(_object + 0x0004)
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;src/main.c:371: object.vivo = 0;
	ld	hl,#(_object + 0x0006)
	ld	(hl),#0x00
;src/main.c:372: object.dir = dir[0];
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	(#(_object + 0x0007)),a
;src/main.c:373: object.sizeX = xs;
	ld	hl,#(_object + 0x0008)
	ld	a,-18 (ix)
	ld	(hl),a
;src/main.c:374: object.sizeY = ys;
	ld	hl,#(_object + 0x0009)
	ld	a,-19 (ix)
	ld	(hl),a
;src/main.c:375: bullets[0]--;
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
;src/main.c:377: arrow[0]=1;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x01
	jr	00141$
00120$:
;src/main.c:379: size[0] = 4;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x04
;src/main.c:380: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
00141$:
;src/main.c:385: if(cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00144$
;src/main.c:386: arrow[0] = 0;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x00
00144$:
;src/main.c:388: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00146$
;src/main.c:389: finish[0] = 1;
	ld	l,18 (ix)
	ld	h,19 (ix)
	ld	(hl),#0x01
00146$:
;src/main.c:392: return s;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:395: void moveObject(){
;	---------------------------------
; Function moveObject
; ---------------------------------
_moveObject::
;src/main.c:396: object.lx = object.x;
	ld	bc,#_object+0
	ld	a,(bc)
	ld	(#(_object + 0x0002)),a
;src/main.c:397: object.ly = object.y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_object + 0x0003)),a
;src/main.c:398: switch(object.dir){
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
;src/main.c:399: case 6: object.x += 1; break;
00101$:
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
;src/main.c:400: case 4: object.x -= 1; break;
00102$:
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
;src/main.c:401: case 2: object.y += 2; break;
00103$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	ret
;src/main.c:402: case 8: object.y -= 2; break;
00104$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/main.c:403: }
	ret
;src/main.c:409: u8 followPlayer(u8 px,u8 py,u8 *x,u8 *y,u8 lx,u8 ly,u8 *dir,u8 room,u8 sizeX,u8 sizeY){
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
;src/main.c:411: dir[0] = setDirection(px,py,x[0],y[0]);
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
;src/main.c:412: movement(dir[0],&x[0],&y[0]);
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
;src/main.c:413: if(scene[(y[0])/tileheight][(x[0])/tilewidth] == 1
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
;src/main.c:414: || scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:415: || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] == 1
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
;src/main.c:416: || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:418: *x=lx;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,10 (ix)
	ld	(hl),a
;src/main.c:419: *y=ly;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,11 (ix)
	ld	(hl),a
00102$:
;src/main.c:422: return following;
	ld	l,#0x01
	ld	sp, ix
	pop	ix
	ret
;src/main.c:426: void patrol(u8 dir,u8 lx,u8 ly,u8 *x,u8 *y,u8 room,u8 sizeX,u8 sizeY){
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
;src/main.c:427: scene[(y[0])/tileheight][(x[0])/tilewidth] = room;
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
;src/main.c:429: movement(dir,&x[0],&y[0]);
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
;src/main.c:431: if(scene[(y[0])/tileheight][(x[0])/tilewidth] != room
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
;src/main.c:432: || scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] != room
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
;src/main.c:433: || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] != room
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
;src/main.c:434: || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] != room
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
;src/main.c:436: *x=lx;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/main.c:437: *y=ly;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,6 (ix)
	ld	(hl),a
00102$:
;src/main.c:439: scene[(y[0])/tileheight][(x[0])/tilewidth] = 2;
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
;src/main.c:442: u8 vissionSensor(u8 x,u8 y,u8 px,u8 py){
;	---------------------------------
; Function vissionSensor
; ---------------------------------
_vissionSensor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/main.c:443: u8 following = 0;
	ld	-10 (ix),#0x00
;src/main.c:444: u8 cx = x/tilewidth;
	ld	a,4 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-5 (ix),a
;src/main.c:445: u8 cy = y/tilewidth;
	ld	a,5 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-9 (ix),a
;src/main.c:446: u8 pcx = px/tilewidth;
	ld	a,6 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-6 (ix),a
;src/main.c:447: u8 pcy = py/tilewidth;
	ld	a,7 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-7 (ix),a
;src/main.c:450: for(i=0;i<3;i++){
	ld	-3 (ix),#0x00
00107$:
;src/main.c:451: lex = cx - i;
	ld	a,-5 (ix)
	sub	a, -3 (ix)
	ld	-8 (ix),a
;src/main.c:452: ley = cy - i;
	ld	a,-9 (ix)
	sub	a, -3 (ix)
	ld	-4 (ix),a
;src/main.c:453: mex = cx + i;
	ld	a,-5 (ix)
	add	a, -3 (ix)
	ld	-1 (ix),a
;src/main.c:454: mey = cy + i;
	ld	a,-9 (ix)
	add	a, -3 (ix)
	ld	-2 (ix), a
	ld	d, a
;src/main.c:455: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
	ld	a,-8 (ix)
	sub	a, -6 (ix)
	jr	Z,00101$
	ld	a,-4 (ix)
	sub	a, -7 (ix)
	jr	Z,00101$
	ld	a,-1 (ix)
	sub	a, -6 (ix)
	jr	Z,00101$
	ld	a,-7 (ix)
	sub	a, d
	jr	NZ,00108$
00101$:
;src/main.c:456: following = 1;
	ld	-10 (ix),#0x01
00108$:
;src/main.c:450: for(i=0;i<3;i++){
	inc	-3 (ix)
	ld	a,-3 (ix)
	sub	a, #0x03
	jr	C,00107$
;src/main.c:460: return following;
	ld	l,-10 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:465: u8* move(u8 *x,u8 *y,u8 lx, u8 ly,u8 sizeX,u8 sizeY,u8 *dir,u8 *s,u8 room,u8 px,u8 py,u8 *following){
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
;src/main.c:466: u8 *sprite = s;
	ld	a,14 (ix)
	ld	-23 (ix),a
	ld	a,15 (ix)
	ld	-22 (ix),a
;src/main.c:469: dir[0] = chooseDirection(dir[0]);
	ld	a,12 (ix)
	ld	-14 (ix),a
	ld	a,13 (ix)
	ld	-13 (ix),a
;src/main.c:468: if(temp > 36){
	ld	a,#0x24
	ld	iy,#_temp
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_temp
	sbc	a, 1 (iy)
	jp	PO, 00163$
	xor	a, #0x80
00163$:
	jp	P,00115$
;src/main.c:469: dir[0] = chooseDirection(dir[0]);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_chooseDirection
	inc	sp
	ld	a,l
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),a
;src/main.c:470: temp = 0;
	ld	hl,#0x0000
	ld	(_temp),hl
	jp	00116$
00115$:
;src/main.c:473: if(temp%6== 0){
	ld	hl,#0x0006
	push	hl
	ld	hl,(_temp)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	a,h
	or	a,l
	jp	NZ,00116$
;src/main.c:474: detected = detectPlayerRoom(px,py,room);
	ld	h,16 (ix)
	ld	l,18 (ix)
	push	hl
	ld	a,17 (ix)
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	inc	sp
;src/main.c:476: if(following[0] == 1){
	ld	a,19 (ix)
	ld	-16 (ix),a
	ld	a,20 (ix)
	ld	-15 (ix),a
;src/main.c:477: followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	a,6 (ix)
	ld	-3 (ix),a
	ld	a,7 (ix)
	ld	-2 (ix),a
	ld	a,4 (ix)
	ld	-21 (ix),a
	ld	a,5 (ix)
	ld	-20 (ix),a
;src/main.c:475: if(detected == 0){
	ld	a,l
	or	a, a
	jp	NZ,00110$
;src/main.c:476: if(following[0] == 1){
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	dec	a
	jr	NZ,00107$
;src/main.c:477: followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	h,11 (ix)
	ld	l,10 (ix)
	push	hl
	ld	a,16 (ix)
	push	af
	inc	sp
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	ld	h,18 (ix)
	ld	l,17 (ix)
	push	hl
	call	_followPlayer
	ld	hl,#13
	add	hl,sp
	ld	sp,hl
;src/main.c:478: following[0] = vissionSensor(x[0],y[0],px,py);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	b,(hl)
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	d,(hl)
	ld	h,18 (ix)
	ld	l,17 (ix)
	push	hl
	ld	c, d
	push	bc
	call	_vissionSensor
	pop	af
	pop	af
	ld	a,l
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),a
	jp	00116$
00107$:
;src/main.c:480: if(scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] != 0
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-1 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	-17 (ix), a
	ld	c, a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	a,#<(_scene)
	add	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,#>(_scene)
	adc	a, -6 (ix)
	ld	-6 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	a,(hl)
	ld	-17 (ix), a
	ld	-12 (ix),a
	ld	-11 (ix),#0x00
	ld	a,10 (ix)
	ld	-19 (ix),a
	ld	-18 (ix),#0x00
	ld	a,-12 (ix)
	add	a, -19 (ix)
	ld	-19 (ix),a
	ld	a,-11 (ix)
	adc	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,-19 (ix)
	add	a,#0xFF
	ld	-12 (ix),a
	ld	a,-18 (ix)
	adc	a,#0xFF
	ld	-11 (ix),a
	ld	a,-12 (ix)
	ld	-9 (ix),a
	ld	a,-11 (ix)
	ld	-8 (ix),a
	ld	a,-11 (ix)
	rlca
	and	a,#0x01
	ld	-10 (ix),a
	ld	a,-19 (ix)
	add	a, #0x02
	ld	-19 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00119$
	ld	a,-19 (ix)
	ld	-9 (ix),a
	ld	a,-18 (ix)
	ld	-8 (ix),a
00119$:
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	a,(hl)
	or	a, a
	jp	NZ,00101$
;src/main.c:481: || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] != 0 
	ld	a,-1 (ix)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
	ld	a,11 (ix)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	a,-9 (ix)
	add	a, -7 (ix)
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a, -6 (ix)
	ld	-8 (ix),a
	ld	a,-9 (ix)
	add	a,#0xFE
	ld	-7 (ix),a
	ld	a,-8 (ix)
	adc	a,#0xFF
	ld	-6 (ix),a
	ld	a,-7 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-6 (ix)
	rlca
	and	a,#0x01
	ld	-1 (ix),a
	ld	a,-9 (ix)
	add	a, #0x0D
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00120$
	ld	a,-9 (ix)
	ld	-5 (ix),a
	ld	a,-8 (ix)
	ld	-4 (ix),a
00120$:
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	a,-5 (ix)
	add	a, #<(_scene)
	ld	-5 (ix),a
	ld	a,-4 (ix)
	adc	a, #>(_scene)
	ld	-4 (ix),a
	ld	a,-17 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-17 (ix), a
	add	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,#0x00
	adc	a, -4 (ix)
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-5 (ix), a
	or	a, a
	jp	NZ,00101$
;src/main.c:482: || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] != 0){
	ld	a,-7 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00121$
	ld	a,-9 (ix)
	ld	-5 (ix),a
	ld	a,-8 (ix)
	ld	-4 (ix),a
00121$:
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	a,#<(_scene)
	add	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,#>(_scene)
	adc	a, -4 (ix)
	ld	-4 (ix),a
	ld	a,-12 (ix)
	ld	-9 (ix),a
	ld	a,-11 (ix)
	ld	-8 (ix),a
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00122$
	ld	a,-19 (ix)
	ld	-9 (ix),a
	ld	a,-18 (ix)
	ld	-8 (ix),a
00122$:
	sra	-8 (ix)
	rr	-9 (ix)
	sra	-8 (ix)
	rr	-9 (ix)
	ld	a,-9 (ix)
	add	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,-8 (ix)
	adc	a, -4 (ix)
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-5 (ix), a
	or	a, a
	jr	Z,00102$
00101$:
;src/main.c:483: patrol(dir[0],lx,ly,&x[0],&y[0],room,sizeX,sizeY);   
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	d,(hl)
	ld	h,11 (ix)
	ld	l,10 (ix)
	push	hl
	ld	a,16 (ix)
	push	af
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	de
	inc	sp
	call	_patrol
	ld	hl,#10
	add	hl,sp
	ld	sp,hl
	jr	00116$
00102$:
;src/main.c:487: x[0] = 52;
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	(hl),#0x34
;src/main.c:488: y[0] = 80;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x50
	jr	00116$
00110$:
;src/main.c:496: following[0] = followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	h,11 (ix)
	ld	l,10 (ix)
	push	hl
	ld	a,16 (ix)
	push	af
	inc	sp
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	ld	h,18 (ix)
	ld	l,17 (ix)
	push	hl
	call	_followPlayer
	ld	iy,#13
	add	iy,sp
	ld	sp,iy
	ld	a,l
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),a
00116$:
;src/main.c:501: temp += 2;
	ld	hl,#_temp
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;src/main.c:502: return sprite;
	pop	hl
	push	hl
	ld	sp, ix
	pop	ix
	ret
;src/main.c:509: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-118
	add	hl,sp
	ld	sp,hl
;src/main.c:510: TPlayer p = {0,80,0,80,gladis_quieto_dcha,3,6,4,16,4,0,0,3,0,0};
	ld	hl,#0x0001
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0001
	add	hl,sp
	ld	-69 (ix),l
	ld	-68 (ix),h
	ld	a,-69 (ix)
	add	a, #0x01
	ld	-10 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x50
	ld	a,-69 (ix)
	add	a, #0x02
	ld	-71 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-70 (ix),a
	ld	l,-71 (ix)
	ld	h,-70 (ix)
	ld	(hl),#0x00
	ld	a,-69 (ix)
	add	a, #0x03
	ld	-81 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-80 (ix),a
	ld	l,-81 (ix)
	ld	h,-80 (ix)
	ld	(hl),#0x50
	ld	a,-69 (ix)
	add	a, #0x04
	ld	-73 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-72 (ix),a
	ld	l,-73 (ix)
	ld	h,-72 (ix)
	ld	(hl),#<(_gladis_quieto_dcha)
	inc	hl
	ld	(hl),#>(_gladis_quieto_dcha)
	ld	a,-69 (ix)
	add	a, #0x06
	ld	-75 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-74 (ix),a
	ld	l,-75 (ix)
	ld	h,-74 (ix)
	ld	(hl),#0x03
	ld	a,-69 (ix)
	add	a, #0x07
	ld	c,a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,#0x06
	ld	(bc),a
	ld	a,-69 (ix)
	add	a, #0x08
	ld	-14 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x04
	ld	a,-69 (ix)
	add	a, #0x09
	ld	-22 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#0x10
	ld	a,-69 (ix)
	add	a, #0x0A
	ld	-37 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-36 (ix),a
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	(hl),#0x04
	ld	a,-69 (ix)
	add	a, #0x0B
	ld	-2 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
	ld	a,-69 (ix)
	add	a, #0x0C
	ld	-20 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-19 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#0x00
	ld	a,-69 (ix)
	add	a, #0x0D
	ld	-12 (ix),a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x03
	ld	a,-69 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-69 (ix)
	add	a, #0x0F
	ld	l,a
	ld	a,-68 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/main.c:511: TPlayer e = {52,80,52,80,chacho_quieto_dcha,3,6,4,16,4,0,0,0,1,3};
	ld	hl,#0x0011
	add	hl,sp
	ld	(hl),#0x34
	ld	hl,#0x0011
	add	hl,sp
	ld	-60 (ix),l
	ld	-59 (ix),h
	ld	a,-60 (ix)
	add	a, #0x01
	ld	-67 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-66 (ix),a
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	(hl),#0x50
	ld	a,-60 (ix)
	add	a, #0x02
	ld	-83 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-82 (ix),a
	ld	l,-83 (ix)
	ld	h,-82 (ix)
	ld	(hl),#0x34
	ld	a,-60 (ix)
	add	a, #0x03
	ld	-8 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x50
	ld	a,-60 (ix)
	add	a, #0x04
	ld	-79 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-78 (ix),a
	ld	l,-79 (ix)
	ld	h,-78 (ix)
	ld	(hl),#<(_chacho_quieto_dcha)
	inc	hl
	ld	(hl),#>(_chacho_quieto_dcha)
	ld	a,-60 (ix)
	add	a, #0x06
	ld	-65 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-64 (ix),a
	ld	l,-65 (ix)
	ld	h,-64 (ix)
	ld	(hl),#0x03
	ld	a,-60 (ix)
	add	a, #0x07
	ld	e,a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,#0x06
	ld	(de),a
	ld	a,-60 (ix)
	add	a, #0x08
	ld	-24 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#0x04
	ld	a,-60 (ix)
	add	a, #0x09
	ld	-77 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-76 (ix),a
	ld	l,-77 (ix)
	ld	h,-76 (ix)
	ld	(hl),#0x10
	ld	a,-60 (ix)
	add	a, #0x0A
	ld	-49 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-48 (ix),a
	ld	l,-49 (ix)
	ld	h,-48 (ix)
	ld	(hl),#0x04
	ld	a,-60 (ix)
	add	a, #0x0B
	ld	l,a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-60 (ix)
	add	a, #0x0C
	ld	l,a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-60 (ix)
	add	a, #0x0D
	ld	l,a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-60 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x01
	ld	a,-60 (ix)
	add	a, #0x0F
	ld	-39 (ix),a
	ld	a,-59 (ix)
	adc	a, #0x00
	ld	-38 (ix),a
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),#0x03
;src/main.c:517: u8 finish = 0,i=1,arrow=0,following = 0;
	ld	-118 (ix),#0x00
	ld	-85 (ix),#0x00
	ld	-84 (ix),#0x00
;src/main.c:519: u8 bound =0;
	ld	-29 (ix),#0x00
;src/main.c:520: temp = 0;
	ld	hl,#0x0000
	ld	(_temp),hl
;src/main.c:522: cpct_clearScreen(0);
	push	bc
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
	pop	bc
;src/main.c:527: while (1){
	ld	a,-12 (ix)
	ld	-31 (ix),a
	ld	a,-11 (ix)
	ld	-30 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-13 (ix)
	ld	-15 (ix),a
	ld	-18 (ix),c
	ld	-17 (ix),b
	ld	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	ld	-3 (ix),a
	ld	a,-10 (ix)
	ld	-6 (ix),a
	ld	a,-9 (ix)
	ld	-5 (ix),a
	ld	a,-69 (ix)
	ld	-26 (ix),a
	ld	a,-68 (ix)
	ld	-25 (ix),a
	ld	a,-10 (ix)
	ld	-28 (ix),a
	ld	a,-9 (ix)
	ld	-27 (ix),a
	ld	a,-69 (ix)
	ld	-55 (ix),a
	ld	a,-68 (ix)
	ld	-54 (ix),a
	ld	-57 (ix),e
	ld	-56 (ix),d
	ld	a,-67 (ix)
	ld	-33 (ix),a
	ld	a,-66 (ix)
	ld	-32 (ix),a
	ld	a,-60 (ix)
	ld	-35 (ix),a
	ld	a,-59 (ix)
	ld	-34 (ix),a
00125$:
;src/main.c:530: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:533: erasePlayer(p.lx,p.ly,p.lsize,p.sizeY);
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	b,(hl)
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	a,(hl)
	ld	l,-81 (ix)
	ld	h,-80 (ix)
	ld	e,(hl)
	ld	l,-71 (ix)
	ld	h,-70 (ix)
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
;src/main.c:534: erasePlayer(e.lx,e.ly,e.lsize,e.sizeY);
	ld	l,-77 (ix)
	ld	h,-76 (ix)
	ld	b,(hl)
	ld	l,-49 (ix)
	ld	h,-48 (ix)
	ld	a,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	l,-83 (ix)
	ld	h,-82 (ix)
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
;src/main.c:535: if(arrow == 1){
	ld	a,-85 (ix)
	dec	a
	jr	NZ,00104$
;src/main.c:536: erasePlayer(object.lx,object.ly,object.sizeX,object.sizeY);
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
;src/main.c:537: if(bound == 1) arrow = 0;
	ld	a,-29 (ix)
	dec	a
	jr	NZ,00104$
	ld	-85 (ix),#0x00
00104$:
;src/main.c:541: drawPlayer(p.x,p.y,p.sprite,p.sizeX,p.sizeY,p.life);
	ld	l,-75 (ix)
	ld	h,-74 (ix)
	ld	b,(hl)
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	a,(hl)
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	c,(hl)
	ld	l,-73 (ix)
	ld	h,-72 (ix)
	push	af
	ld	a,(hl)
	ld	-45 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-44 (ix),a
	pop	af
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	ld	l,-69 (ix)
	ld	h,-68 (ix)
	ld	d,(hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	l,-45 (ix)
	ld	h,-44 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/main.c:542: drawPlayer(e.x,e.y,e.sprite,e.sizeX,e.sizeY,e.life);
	ld	l,-65 (ix)
	ld	h,-64 (ix)
	ld	a,(hl)
	ld	l,-77 (ix)
	ld	h,-76 (ix)
	ld	c,(hl)
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	b,(hl)
	ld	l,-79 (ix)
	ld	h,-78 (ix)
	push	af
	ld	a,(hl)
	ld	-45 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-44 (ix),a
	pop	af
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	e,(hl)
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	d,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,-45 (ix)
	ld	h,-44 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/main.c:543: if(arrow == 1) drawPlayer(object.x,object.y,object.sprite,object.sizeX,object.sizeY,object.vivo);
	ld	a,-85 (ix)
	dec	a
	jr	NZ,00106$
	ld	a, (#_object + 6)
	ld	hl, #(_object + 0x0009) + 0
	ld	d,(hl)
	ld	hl, #(_object + 0x0008) + 0
	ld	e,(hl)
	ld	hl, #_object + 4
	push	af
	ld	a,(hl)
	ld	-45 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-44 (ix),a
	pop	af
	ld	hl, #(_object + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_object + 0
	ld	c,(hl)
	push	af
	inc	sp
	push	de
	ld	l,-45 (ix)
	ld	h,-44 (ix)
	push	hl
	push	bc
	call	_drawPlayer
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
00106$:
;src/main.c:546: drawVida(p.life);
	ld	l,-75 (ix)
	ld	h,-74 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawVida
	inc	sp
;src/main.c:547: drawBullets(p.bullets);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawBullets
	inc	sp
;src/main.c:550: if(p.atk < 20) drawFatiga(p.atk,2);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
;src/main.c:551: else if(p.atk > 20) drawFatiga(p.atk,16);
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
;src/main.c:552: else drawFatiga(p.atk,0);
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
00112$:
;src/main.c:555: p.lx = p.x;
	ld	l,-69 (ix)
	ld	h,-68 (ix)
	ld	a,(hl)
	ld	l,-71 (ix)
	ld	h,-70 (ix)
	ld	(hl),a
;src/main.c:556: p.ly = p.y;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	l,-81 (ix)
	ld	h,-80 (ix)
	ld	(hl),a
;src/main.c:557: e.lx = e.x;
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	a,(hl)
	ld	l,-83 (ix)
	ld	h,-82 (ix)
	ld	(hl),a
;src/main.c:558: e.ly = e.y;
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	a,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),a
;src/main.c:559: p.latk = p.atk;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),a
;src/main.c:560: p.lsize = p.sizeX;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,(hl)
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	ld	(hl),a
;src/main.c:563: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:564: p.sprite = checkKeyboard(&p.x,&p.y,&p.atk,&p.dir,p.sprite,&p.sizeX,&p.bullets,&finish,&arrow);
	ld	hl,#0x0021
	add	hl,sp
	ex	de,hl
	ld	hl,#0x0000
	add	hl,sp
	ld	-45 (ix),l
	ld	-44 (ix),h
	ld	c,-31 (ix)
	ld	b,-30 (ix)
	ld	a,-16 (ix)
	ld	-47 (ix),a
	ld	a,-15 (ix)
	ld	-46 (ix),a
	ld	l,-73 (ix)
	ld	h,-72 (ix)
	ld	a,(hl)
	ld	-41 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-40 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,-4 (ix)
	ld	-43 (ix),a
	ld	a,-3 (ix)
	ld	-42 (ix),a
	ld	a,-6 (ix)
	ld	-51 (ix),a
	ld	a,-5 (ix)
	ld	-50 (ix),a
	ld	a,-26 (ix)
	ld	-53 (ix),a
	ld	a,-25 (ix)
	ld	-52 (ix),a
	push	de
	ld	e,-45 (ix)
	ld	d,-44 (ix)
	push	de
	push	bc
	ld	c,-47 (ix)
	ld	b,-46 (ix)
	push	bc
	ld	c,-41 (ix)
	ld	b,-40 (ix)
	push	bc
	push	hl
	ld	l,-43 (ix)
	ld	h,-42 (ix)
	push	hl
	ld	l,-51 (ix)
	ld	h,-50 (ix)
	push	hl
	ld	l,-53 (ix)
	ld	h,-52 (ix)
	push	hl
	call	_checkKeyboard
	ld	iy,#18
	add	iy,sp
	ld	sp,iy
	ld	d,l
	ld	e,h
	ld	l,-73 (ix)
	ld	h,-72 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:565: checkBoundsCollisions(&p.x,&p.y,p.lx,p.ly,p.sizeX,p.sizeY);
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	d,(hl)
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	e,(hl)
	ld	l,-81 (ix)
	ld	h,-80 (ix)
	ld	a,(hl)
	ld	-53 (ix),a
	ld	l,-71 (ix)
	ld	h,-70 (ix)
	ld	a,(hl)
	ld	-51 (ix),a
	ld	c,-28 (ix)
	ld	b,-27 (ix)
	push	bc
	pop	iy
	ld	c,-55 (ix)
	ld	b,-54 (ix)
	push	de
	ld	h,-53 (ix)
	ld	l,-51 (ix)
	push	hl
	push	iy
	push	bc
	call	_checkBoundsCollisions
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
;src/main.c:566: e.sprite = move(&e.x,&e.y,e.lx,e.ly,e.sizeX,e.sizeY,&e.dir,e.sprite,e.room,p.x,p.y,&following);
	ld	hl,#0x0022
	add	hl,sp
	ld	-53 (ix),l
	ld	-52 (ix),h
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-51 (ix),a
	ld	l,-69 (ix)
	ld	h,-68 (ix)
	ld	a,(hl)
	ld	-43 (ix),a
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	ld	-41 (ix),a
	ld	l,-79 (ix)
	ld	h,-78 (ix)
	ld	a,(hl)
	ld	-47 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-46 (ix),a
	ld	a,-57 (ix)
	ld	-45 (ix),a
	ld	a,-56 (ix)
	ld	-44 (ix),a
	ld	l,-77 (ix)
	ld	h,-76 (ix)
	ld	a,(hl)
	ld	-61 (ix),a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	a,(hl)
	ld	-62 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-63 (ix),a
	ld	l,-83 (ix)
	ld	h,-82 (ix)
	ld	a,(hl)
	ld	-58 (ix),a
	ld	e,-33 (ix)
	ld	d,-32 (ix)
	ld	c,-35 (ix)
	ld	b,-34 (ix)
	ld	l,-53 (ix)
	ld	h,-52 (ix)
	push	hl
	ld	h,-51 (ix)
	ld	l,-43 (ix)
	push	hl
	ld	a,-41 (ix)
	push	af
	inc	sp
	ld	l,-47 (ix)
	ld	h,-46 (ix)
	push	hl
	ld	l,-45 (ix)
	ld	h,-44 (ix)
	push	hl
	ld	h,-61 (ix)
	ld	l,-62 (ix)
	push	hl
	ld	h,-63 (ix)
	ld	l,-58 (ix)
	push	hl
	push	de
	push	bc
	call	_move
	ld	iy,#17
	add	iy,sp
	ld	sp,iy
	ld	d,l
	ld	e,h
	ld	l,-79 (ix)
	ld	h,-78 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:568: if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 2){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	d,(hl)
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	e,(hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
	ld	l,-69 (ix)
	ld	h,-68 (ix)
	ld	c,(hl)
	push	af
	inc	sp
	push	de
	push	bc
	call	_checkCollisions
	pop	af
	pop	af
	inc	sp
	ld	a,l
	sub	a, #0x02
	jr	NZ,00118$
;src/main.c:569: p.x = 0;
	ld	l,-69 (ix)
	ld	h,-68 (ix)
	ld	(hl),#0x00
;src/main.c:570: p.y = 80;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x50
;src/main.c:571: p.life--;
	ld	l,-75 (ix)
	ld	h,-74 (ix)
	ld	a,(hl)
	add	a,#0xFF
	ld	l,-75 (ix)
	ld	h,-74 (ix)
	ld	(hl),a
;src/main.c:572: if(p.life == 0)
	or	a, a
	jr	NZ,00119$
;src/main.c:573: gameOver();
	call	_gameOver
	jr	00119$
00118$:
;src/main.c:574: }else if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	c,(hl)
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	ld	b,(hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	ld	l,-69 (ix)
	ld	h,-68 (ix)
	ld	d,(hl)
	push	af
	inc	sp
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
	inc	sp
	dec	l
	jr	NZ,00119$
;src/main.c:575: e.life =0;
	ld	l,-65 (ix)
	ld	h,-64 (ix)
	ld	(hl),#0x00
00119$:
;src/main.c:579: if(arrow == 1){
	ld	a,-85 (ix)
	dec	a
	jr	NZ,00121$
;src/main.c:580: moveObject();
	call	_moveObject
;src/main.c:581: bound = checkBoundsCollisions(&object.x,&object.y,object.lx,object.ly,object.sizeX,object.sizeY);
	ld	hl, #(_object + 0x0009) + 0
	ld	c,(hl)
	ld	hl, #(_object + 0x0008) + 0
	ld	e,(hl)
	ld	a,(#(_object + 0x0003) + 0)
	ld	-58 (ix),a
	ld	hl, #(_object + 0x0002) + 0
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	a,-58 (ix)
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
	ld	-29 (ix),l
00121$:
;src/main.c:586: if(finish == 1) return;
	ld	a,-118 (ix)
	dec	a
	jp	NZ,00125$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:593: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:595: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:596: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:597: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_5+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:599: while (1){
00104$:
;src/main.c:601: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:605: if(cpct_isKeyPressed(Key_Esc)) {
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:607: return;
	ret
___str_5:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:617: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:621: init();
	call	_init
;src/main.c:624: while(1){
00106$:
;src/main.c:625: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:626: switch(x){
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
;src/main.c:627: case 0: return;break;
;src/main.c:628: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:629: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:630: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
