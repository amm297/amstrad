;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Mon Oct 19 09:49:48 2015
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
	.globl _backHome
	.globl _homeDirection
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
	.globl _drawPickUps
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
	.ds 1
_path::
	.ds 1
_object::
	.ds 10
_players::
	.ds 36
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
	.db #0x09	; 9
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
;src/main.c:159: void drawPlayer(u8 x,u8 y,u8 *sprite,u8 sizeX,u8 sizeY,u8 life){
;	---------------------------------
; Function drawPlayer
; ---------------------------------
_drawPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:161: if(life > 0){
	ld	a,10 (ix)
	or	a, a
	jr	Z,00103$
;src/main.c:162: memptr = cpct_getScreenPtr(VMEM,x,y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:163: cpct_drawSpriteMasked(sprite, memptr, sizeX, sizeY);
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
;src/main.c:167: void erasePlayer(u8 x,u8 y,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function erasePlayer
; ---------------------------------
_erasePlayer::
;src/main.c:170: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/main.c:171: cpct_drawSolidBox(memptr,0,sizeX,sizeY);
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
;src/main.c:179: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:181: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/main.c:182: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/main.c:183: if(atk > 30 || atk <= 20){
	ld	a,#0x14
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
;src/main.c:185: switch(col){
	ld	a,#0x02
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	-2 (ix),a
;src/main.c:183: if(atk > 30 || atk <= 20){
	ld	a,#0x1E
	sub	a, 4 (ix)
	jr	C,00107$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
00107$:
;src/main.c:184: memptr = cpct_getScreenPtr(VMEM,4,192);
	ld	hl,#0xC004
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:185: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00108$
;src/main.c:187: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:185: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00156$
	add	hl,de
	add	hl,de
;src/main.c:186: case 0:
	jp	(hl)
00156$:
	jr	00103$
	jr	00104$
	jr	00105$
00103$:
;src/main.c:187: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:188: break;
	jr	00108$
;src/main.c:189: case 1:
00104$:
;src/main.c:190: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:191: break;
	jr	00108$
;src/main.c:192: case 2:
00105$:
;src/main.c:193: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:194: }
00108$:
;src/main.c:196: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00114$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00115$
00114$:
;src/main.c:197: memptr = cpct_getScreenPtr(VMEM,7,192);
	ld	hl,#0xC007
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:198: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00115$
;src/main.c:187: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:198: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00157$
	add	hl,de
	add	hl,de
;src/main.c:199: case 0:
	jp	(hl)
00157$:
	jr	00110$
	jr	00111$
	jr	00112$
00110$:
;src/main.c:200: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:201: break;
	jr	00115$
;src/main.c:202: case 1:
00111$:
;src/main.c:203: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:204: break;
	jr	00115$
;src/main.c:205: case 2:
00112$:
;src/main.c:206: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:207: }
00115$:
;src/main.c:209: if(atk <= 20){
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00122$
;src/main.c:210: memptr = cpct_getScreenPtr(VMEM,10,192);
	ld	hl,#0xC00A
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:187: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:211: switch(col){
	ld	a,5 (ix)
	or	a, a
	jr	Z,00117$
	ld	a,5 (ix)
	sub	a, #0x02
	jr	Z,00118$
	jr	00122$
;src/main.c:212: case 0:
00117$:
;src/main.c:213: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:214: break;
	jr	00122$
;src/main.c:215: case 2:
00118$:
;src/main.c:216: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:217: }
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:222: void drawPickUps(u8 corazon, u8 bullet){
;	---------------------------------
; Function drawPickUps
; ---------------------------------
_drawPickUps::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:225: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:227: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	c, l
	ld	b, h
;src/main.c:226: if(corazon == 0)
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00102$
;src/main.c:227: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00103$
00102$:
;src/main.c:229: cpct_drawSolidBox(memptr, 0, 4, 8);
	ld	hl,#0x0804
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
;src/main.c:231: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
	ld	hl,#0x1008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:227: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ex	de,hl
;src/main.c:232: if(bullet == 0)
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00105$
;src/main.c:233: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
	ld	bc,#_flecha_arriba
	ld	hl,#0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00107$
00105$:
;src/main.c:235: cpct_drawSolidBox(memptr, 0, 2, 8);
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
00107$:
	pop	ix
	ret
;src/main.c:240: void drawVida(u8 life){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:245: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0041
00105$:
;src/main.c:246: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/main.c:247: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:248: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ex	de,hl
	ld	a,4 (ix)
	sub	a, -1 (ix)
	jr	C,00102$
	push	bc
	ld	hl,#0x0804
	push	hl
	push	de
	ld	hl,#_corazon_lleno
	push	hl
	call	_cpct_drawSpriteMasked
	pop	bc
	jr	00106$
00102$:
;src/main.c:250: cpct_drawSolidBox(memptr,0,4,8);
	push	bc
	push	de
	ld	hl,#0x0804
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	ld	hl,#0x0804
	push	hl
	push	de
	ld	hl,#_corazon_roto
	push	hl
	call	_cpct_drawSpriteMasked
	pop	bc
00106$:
;src/main.c:245: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:272: void drawBullets(u8 bullet){
;	---------------------------------
; Function drawBullets
; ---------------------------------
_drawBullets::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:276: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0032
00105$:
;src/main.c:277: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/main.c:278: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:279: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
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
;src/main.c:280: else  cpct_drawSolidBox(memptr,0,2,8);
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
;src/main.c:276: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:303: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
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
;src/main.c:305: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:306: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:307: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:308: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:309: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:310: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:312: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:313: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
	jp	00112$
00107$:
;src/main.c:315: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
	ld	a,-8 (ix)
	sub	a, #0x03
	jp	NZ,00101$
;src/main.c:316: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:317: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
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
;src/main.c:318: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:320: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:321: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:325: void checkArrowCollisions(u8 *arrow){
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
;src/main.c:327: u8 posX = object.x;
	ld	a,(#_object+0)
	ld	-12 (ix),a
;src/main.c:328: u8 posY = object.y;
	ld	a,(#_object + 1)
;src/main.c:329: if(    scene[(posY)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:330: || scene[(posY)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:331: || scene[(posY+object.sizeY-2)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:332: || scene[(posY+object.sizeY-2)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:334: arrow[0] = 0;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x00
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:338: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY,u8 *life,u8 *bullets,u8 *corazon, u8 *flecha){
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
;src/main.c:340: u8 *posX = x;
	ld	a,4 (ix)
	ld	-21 (ix),a
	ld	a,5 (ix)
	ld	-20 (ix),a
;src/main.c:341: u8 *posY = y;
	ld	a,6 (ix)
	ld	-18 (ix),a
	ld	a,7 (ix)
	ld	-17 (ix),a
;src/main.c:342: u8 bound = 0;
	ld	-19 (ix),#0x00
;src/main.c:343: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
	ld	l,-18 (ix)
	ld	h,-17 (ix)
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
	ld	-4 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-3 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-7 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-10 (ix),a
	ld	a,-4 (ix)
	add	a, -10 (ix)
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-2 (ix), a
	dec	a
	jp	Z,00124$
;src/main.c:344: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
	ld	l,-7 (ix)
	ld	h,#0x00
	ld	e,10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-14 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-13 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-13 (ix)
	ld	-15 (ix),a
	ld	a,-13 (ix)
	rlca
	and	a,#0x01
	ld	-7 (ix),a
	inc	hl
	inc	hl
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00132$
	ld	a,-12 (ix)
	ld	-16 (ix),a
	ld	a,-11 (ix)
	ld	-15 (ix),a
00132$:
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00124$
;src/main.c:345: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
	ld	l,-1 (ix)
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
	ld	-16 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-9 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-8 (ix),a
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00133$
	ld	e,-9 (ix)
	ld	d,-8 (ix)
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
	ld	e,-10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00124$
;src/main.c:346: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
	ld	l, c
	ld	h, b
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00134$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	-6 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-5 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00135$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00135$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00125$
00124$:
;src/main.c:348: *posX=lx;
	pop	hl
	push	hl
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:349: *posY=ly;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:350: bound = 1;
	ld	-19 (ix),#0x01
	jp	00126$
00125$:
;src/main.c:352: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 2
	ld	a,-2 (ix)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:353: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00136$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00136$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:354: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 2
	ld	l, c
	ld	h, b
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00137$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	e,-10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00118$
;src/main.c:355: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
	ld	l, c
	ld	h, b
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00138$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	e,a
	ld	a,#>(_scene)
	adc	a, h
	ld	d,a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00139$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00139$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00119$
00118$:
;src/main.c:357: if(*life < 3 && *corazon == 0){
	ld	c,12 (ix)
	ld	b,13 (ix)
	push	bc
	pop	iy
	ld	e, 0 (iy)
	ld	a,e
	sub	a, #0x03
	jp	NC,00126$
	ld	l,16 (ix)
	ld	h,17 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00126$
;src/main.c:358: *life += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:359: *corazon = 1;
	ld	(hl),#0x01
	jp	00126$
00119$:
;src/main.c:362: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5
	ld	a,-2 (ix)
	sub	a, #0x05
	jp	Z,00112$
;src/main.c:363: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00140$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00140$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00112$
;src/main.c:364: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00141$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	e,-10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jr	Z,00112$
;src/main.c:365: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00142$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00143$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00143$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jr	NZ,00113$
00112$:
;src/main.c:367: if(*bullets < 3 && *flecha == 0){
	ld	c,14 (ix)
	ld	b,15 (ix)
	push	bc
	pop	iy
	ld	e, 0 (iy)
	ld	a,e
	sub	a, #0x03
	jp	NC,00126$
	ld	l,18 (ix)
	ld	h,19 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00126$
;src/main.c:368: *bullets += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:369: *flecha = 1;
	ld	(hl),#0x01
	jp	00126$
00113$:
;src/main.c:371: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9
	ld	a,-2 (ix)
	sub	a, #0x09
	jp	Z,00107$
;src/main.c:372: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00144$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00144$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jp	Z,00107$
;src/main.c:373: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 9
	ld	l, c
	ld	h, b
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00145$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	e,-10 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	Z,00107$
;src/main.c:374: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
	ld	a,-16 (ix)
	or	a, a
	jr	Z,00146$
	ld	c,-9 (ix)
	ld	b,-8 (ix)
00146$:
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
	ld	-6 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-5 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00147$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
00147$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00126$
00107$:
;src/main.c:376: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:377: drawMap(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_drawMap
	inc	sp
00126$:
;src/main.c:379: return bound;
	ld	l,-19 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:384: u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *bullets,u8 *finish,u8 *arrow){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/main.c:386: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	d,l
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	a,(bc)
	ld	e,a
;src/main.c:387: size[0] = 5;
	ld	a,14 (ix)
	ld	-2 (ix),a
	ld	a,15 (ix)
	ld	-1 (ix),a
;src/main.c:390: switch(dir[0]){
	ld	a,10 (ix)
	ld	-10 (ix),a
	ld	a,11 (ix)
	ld	-9 (ix),a
;src/main.c:429: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
	ld	a,20 (ix)
	ld	-4 (ix),a
	ld	a,21 (ix)
	ld	-3 (ix),a
;src/main.c:386: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	a,e
	sub	a, #0x14
	ld	a,#0x00
	rla
	ld	l,a
	ld	a,d
	or	a, a
	jr	Z,00145$
	ld	a,l
	or	a, a
	jr	NZ,00145$
;src/main.c:387: size[0] = 5;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x05
;src/main.c:388: if(atk[0] >= 50) atk[0] =0;
	ld	a,(bc)
	ld	h,a
	sub	a, #0x32
	jr	C,00102$
	xor	a, a
	ld	(bc),a
	jr	00103$
00102$:
;src/main.c:389: else atk[0] += 1;
	ld	a,h
	inc	a
	ld	(bc),a
00103$:
;src/main.c:390: switch(dir[0]){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	h,(hl)
	ld	a,h
	sub	a, #0x02
	jr	Z,00107$
	ld	a,h
	sub	a, #0x04
	jr	Z,00104$
	ld	a,h
	sub	a, #0x06
	jr	Z,00105$
	ld	a,h
	sub	a, #0x08
	jr	Z,00106$
	jp	00146$
;src/main.c:391: case 4:
00104$:
;src/main.c:392: s = gladis_atk_izda;
	ld	12 (ix),#<(_gladis_atk_izda)
	ld	13 (ix),#>(_gladis_atk_izda)
;src/main.c:393: break;
	jp	00146$
;src/main.c:394: case 6:
00105$:
;src/main.c:395: s = gladis_atk_dcha;
	ld	12 (ix),#<(_gladis_atk_dcha)
	ld	13 (ix),#>(_gladis_atk_dcha)
;src/main.c:396: break;
	jp	00146$
;src/main.c:397: case 8:
00106$:
;src/main.c:398: s = gladis_atk_arriba;
	ld	12 (ix),#<(_gladis_atk_arriba)
	ld	13 (ix),#>(_gladis_atk_arriba)
;src/main.c:399: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:400: break;
	jp	00146$
;src/main.c:401: case 2:
00107$:
;src/main.c:402: s = gladis_atk_abajo;
	ld	12 (ix),#<(_gladis_atk_abajo)
	ld	13 (ix),#>(_gladis_atk_abajo)
;src/main.c:403: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:405: }
	jp	00146$
00145$:
;src/main.c:407: if(atk[0] < 20) atk[0] += 1;
	ld	a,l
	or	a, a
	jr	Z,00110$
	ld	a,e
	inc	a
	ld	(bc),a
	jr	00111$
00110$:
;src/main.c:408: else atk[0] = 20;
	ld	a,#0x14
	ld	(bc),a
00111$:
;src/main.c:409: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,l
	or	a, a
	jr	Z,00141$
	ld	a,(bc)
	ld	h,a
	sub	a, #0x4C
	jr	NC,00141$
;src/main.c:410: x[0] += 1;
	ld	a,h
	inc	a
	ld	(bc),a
;src/main.c:411: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:412: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:413: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
	jp	00146$
00141$:
;src/main.c:414: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0){
	push	bc
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00137$
	ld	a,(bc)
	or	a, a
	jr	Z,00137$
;src/main.c:415: x[0] -= 1;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:416: dir[0] = 4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/main.c:417: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:418: s = gladis_quieto_izda;
	ld	12 (ix),#<(_gladis_quieto_izda)
	ld	13 (ix),#>(_gladis_quieto_izda)
	jp	00146$
00137$:
;src/main.c:419: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
	push	bc
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	pop	bc
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	a,l
	or	a, a
	jr	Z,00133$
	ld	a,(de)
	ld	h,a
	sub	a, #0xB4
	jr	NC,00133$
;src/main.c:420: y[0] += 2;
	ld	a,h
	add	a, #0x02
	ld	(de),a
;src/main.c:421: dir[0] = 2;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x02
;src/main.c:422: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:423: s = gladis_abajo;
	ld	12 (ix),#<(_gladis_abajo)
	ld	13 (ix),#>(_gladis_abajo)
	jp	00146$
00133$:
;src/main.c:424: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
	push	bc
	push	de
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00129$
	ld	a,(de)
	or	a, a
	jr	Z,00129$
;src/main.c:425: y[0] -= 2;
	add	a,#0xFE
	ld	(de),a
;src/main.c:426: dir[0] = 8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/main.c:427: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:428: s = gladis_arriba;
	ld	12 (ix),#<(_gladis_arriba)
	ld	13 (ix),#>(_gladis_arriba)
	jp	00146$
00129$:
;src/main.c:429: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
	push	bc
	push	de
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jp	Z,00125$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00125$
;src/main.c:430: if(bullets[0] > 0){
	ld	a,16 (ix)
	ld	-8 (ix),a
	ld	a,17 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00118$
;src/main.c:432: u8 *spr = flecha_dcha,xs=2,ys=8,ox=x[0]+4;
	ld	-6 (ix),#<(_flecha_dcha)
	ld	-5 (ix),#>(_flecha_dcha)
	ld	-11 (ix),#0x02
	ld	-12 (ix),#0x08
	ld	a,(bc)
	ld	b,a
	add	a, #0x04
	ld	-13 (ix), a
	ld	c, a
;src/main.c:433: switch(dir[0]){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
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
;src/main.c:434: case 6: spr = flecha_dcha; xs=4;ys=4;ox=x[0]+4; break;
00112$:
	ld	-6 (ix),#<(_flecha_dcha)
	ld	-5 (ix),#>(_flecha_dcha)
	ld	-11 (ix),#0x04
	ld	-12 (ix),#0x04
	ld	c,-13 (ix)
	jr	00116$
;src/main.c:435: case 4: spr = flecha_izda; xs=4;ys=4;ox=x[0]-4; break;
00113$:
	ld	-6 (ix),#<(_flecha_izda)
	ld	-5 (ix),#>(_flecha_izda)
	ld	-11 (ix),#0x04
	ld	-12 (ix),#0x04
	ld	a,b
	add	a,#0xFC
	ld	c,a
	jr	00116$
;src/main.c:436: case 2: spr = flecha_abajo; xs=2;ys=8; break;
00114$:
	ld	-6 (ix),#<(_flecha_abajo)
	ld	-5 (ix),#>(_flecha_abajo)
	ld	-11 (ix),#0x02
	ld	-12 (ix),#0x08
	jr	00116$
;src/main.c:437: case 8: spr = flecha_arriba; xs=2;ys=8; break;
00115$:
	ld	-6 (ix),#<(_flecha_arriba)
	ld	-5 (ix),#>(_flecha_arriba)
	ld	-11 (ix),#0x02
	ld	-12 (ix),#0x08
;src/main.c:438: }
00116$:
;src/main.c:439: object.x = ox;
	ld	hl,#_object+0
	ld	(hl),c
;src/main.c:440: object.y = y[0]+8;
	ld	bc,#_object + 1
	ld	a,(de)
	add	a, #0x08
	ld	(bc),a
;src/main.c:441: object.x = object.x;
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	hl,#_object
	ld	(hl),d
;src/main.c:442: object.y = object.y;
	ld	(bc),a
;src/main.c:443: object.sprite = spr;
	ld	hl,#_object + 4
	ld	a,-6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-5 (ix)
	ld	(hl),a
;src/main.c:444: object.vivo = 1;
	ld	hl,#_object + 6
	ld	(hl),#0x01
;src/main.c:445: object.dir = dir[0];
	ld	de,#_object + 7
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	(de),a
;src/main.c:446: object.sizeX = xs;
	ld	hl,#_object + 8
	ld	a,-11 (ix)
	ld	(hl),a
;src/main.c:447: object.sizeY = ys;
	ld	hl,#_object + 9
	ld	a,-12 (ix)
	ld	(hl),a
;src/main.c:448: bullets[0]--;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	dec	d
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),d
00118$:
;src/main.c:450: arrow[0]=1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
	jr	00146$
00125$:
;src/main.c:452: switch(dir[0]){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	h,(hl)
	ld	a,h
	sub	a, #0x02
	jr	Z,00122$
	ld	a,h
	sub	a, #0x04
	jr	Z,00119$
	ld	a,h
	sub	a, #0x06
	jr	Z,00120$
	ld	a,h
	sub	a, #0x08
	jr	Z,00121$
	jr	00123$
;src/main.c:453: case 4:
00119$:
;src/main.c:454: s = gladis_quieto_izda;
	ld	12 (ix),#<(_gladis_quieto_izda)
	ld	13 (ix),#>(_gladis_quieto_izda)
;src/main.c:455: break;
	jr	00123$
;src/main.c:456: case 6:
00120$:
;src/main.c:457: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
;src/main.c:458: break;
	jr	00123$
;src/main.c:459: case 8:
00121$:
;src/main.c:460: s = gladis_arriba;
	ld	12 (ix),#<(_gladis_arriba)
	ld	13 (ix),#>(_gladis_arriba)
;src/main.c:461: break;
	jr	00123$
;src/main.c:462: case 2:
00122$:
;src/main.c:463: s = gladis_abajo;
	ld	12 (ix),#<(_gladis_abajo)
	ld	13 (ix),#>(_gladis_abajo)
;src/main.c:465: }
00123$:
;src/main.c:466: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
00146$:
;src/main.c:471: if(cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00149$
;src/main.c:472: arrow[0] = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
00149$:
;src/main.c:474: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00151$
;src/main.c:475: finish[0] = 1;
	ld	l,18 (ix)
	ld	h,19 (ix)
	ld	(hl),#0x01
00151$:
;src/main.c:478: return s;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:481: void moveObject(){
;	---------------------------------
; Function moveObject
; ---------------------------------
_moveObject::
;src/main.c:482: object.lx = object.x;
	ld	bc,#_object+0
	ld	a,(bc)
	ld	(#(_object + 0x0002)),a
;src/main.c:483: object.ly = object.y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_object + 0x0003)),a
;src/main.c:484: switch(object.dir){
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
;src/main.c:485: case 6: object.x += 1; break;
00101$:
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
;src/main.c:486: case 4: object.x -= 1; break;
00102$:
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
;src/main.c:487: case 2: object.y += 2; break;
00103$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	ret
;src/main.c:488: case 8: object.y -= 2; break;
00104$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/main.c:489: }
	ret
;src/main.c:494: u8 followPlayer(u8 px,u8 py,u8 *x,u8 *y,u8 lx,u8 ly,u8 *dir,u8 room,u8 sizeX,u8 sizeY){
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
;src/main.c:496: dir[0] = setDirection(px,py,x[0],y[0]);
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
;src/main.c:497: movement(dir[0],&x[0],&y[0]);
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
;src/main.c:498: if(scene[(y[0])/tileheight][(x[0])/tilewidth] == 1
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
;src/main.c:499: || scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:500: || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] == 1
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
;src/main.c:501: || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:503: *x=lx;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,10 (ix)
	ld	(hl),a
;src/main.c:504: *y=ly;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,11 (ix)
	ld	(hl),a
00102$:
;src/main.c:507: return following;
	ld	l,#0x01
	ld	sp, ix
	pop	ix
	ret
;src/main.c:511: void patrol(u8 dir,u8 lx,u8 ly,u8 *x,u8 *y,u8 room,u8 sizeX,u8 sizeY){
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
;src/main.c:514: movement(dir,&x[0],&y[0]);
	ld	a,9 (ix)
	ld	-11 (ix),a
	ld	a,10 (ix)
	ld	-10 (ix),a
	ld	a,7 (ix)
	ld	-5 (ix),a
	ld	a,8 (ix)
	ld	-4 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_movement
	pop	af
	pop	af
	inc	sp
;src/main.c:516: if(scene[(y[0])/tileheight][(x[0])/tilewidth] != room
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
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
	ld	-14 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-13 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-12 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-15 (ix), a
	add	a, -14 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -13 (ix)
	ld	h,a
	ld	a,11 (ix)
	sub	a,(hl)
	jp	NZ,00101$
;src/main.c:517: || scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] != room
	ld	l,-12 (ix)
	ld	h,#0x00
	ld	e,12 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,l
	add	a,#0xFF
	ld	-2 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	a,-2 (ix)
	ld	-7 (ix),a
	ld	a,-1 (ix)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	rlca
	and	a,#0x01
	ld	-12 (ix),a
	inc	hl
	inc	hl
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00108$
	ld	a,-9 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-6 (ix),a
00108$:
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jp	NZ,00101$
;src/main.c:518: || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] != room
	ld	l,-3 (ix)
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
	ld	-7 (ix),a
	ld	a,l
	add	a, #0x0D
	ld	-14 (ix),a
	ld	a,h
	adc	a, #0x00
	ld	-13 (ix),a
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00109$
	ld	e,-14 (ix)
	ld	d,-13 (ix)
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
	ld	e,-15 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jr	NZ,00101$
;src/main.c:519: || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] != room
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00110$
	ld	c,-14 (ix)
	ld	b,-13 (ix)
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
	ld	-7 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-6 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00111$
	ld	e,-9 (ix)
	ld	d,-8 (ix)
00111$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jr	Z,00106$
00101$:
;src/main.c:521: *x=lx;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/main.c:522: *y=ly;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,6 (ix)
	ld	(hl),a
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:527: u8 vissionSensor(u8 x,u8 y,u8 px,u8 py){
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
;src/main.c:528: u8 following = 0;
	ld	-5 (ix),#0x00
;src/main.c:529: u8 cx = x/tilewidth;
	ld	a,4 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-6 (ix),a
;src/main.c:530: u8 cy = y/tilewidth;
	ld	a,5 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-3 (ix),a
;src/main.c:531: u8 pcx = px/tilewidth;
	ld	a,6 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-7 (ix),a
;src/main.c:532: u8 pcy = py/tilewidth;
	ld	a,7 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix),a
;src/main.c:535: for(i=0;i<3;i++){
	ld	-4 (ix),#0x00
00107$:
;src/main.c:536: lex = cx - i;
	ld	a,-6 (ix)
	sub	a, -4 (ix)
	ld	-2 (ix),a
;src/main.c:537: ley = cy - i;
	ld	a,-3 (ix)
	sub	a, -4 (ix)
	ld	-9 (ix),a
;src/main.c:538: mex = cx + i;
	ld	a,-6 (ix)
	add	a, -4 (ix)
	ld	-8 (ix),a
;src/main.c:539: mey = cy + i;
	ld	a,-3 (ix)
	add	a, -4 (ix)
	ld	-10 (ix), a
	ld	d, a
;src/main.c:540: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
	ld	a,-2 (ix)
	sub	a, -7 (ix)
	jr	Z,00101$
	ld	a,-9 (ix)
	sub	a, -1 (ix)
	jr	Z,00101$
	ld	a,-8 (ix)
	sub	a, -7 (ix)
	jr	Z,00101$
	ld	a,-1 (ix)
	sub	a, d
	jr	NZ,00108$
00101$:
;src/main.c:541: following = 1;
	ld	-5 (ix),#0x01
00108$:
;src/main.c:535: for(i=0;i<3;i++){
	inc	-4 (ix)
	ld	a,-4 (ix)
	sub	a, #0x03
	jr	C,00107$
;src/main.c:545: return following;
	ld	l,-5 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:550: u8  homeDirection(u8 x,u8 y,u8 sizeX){
;	---------------------------------
; Function homeDirection
; ---------------------------------
_homeDirection::
;src/main.c:559: return dir;
	ld	l,#0x02
	ret
;src/main.c:562: void backHome(u8 *x,u8 *y,u8 ox,u8 oy,u8 lx,u8 ly,u8 sizeX,u8 sizeY,u8 *dir){
;	---------------------------------
; Function backHome
; ---------------------------------
_backHome::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:565: if(x[0] < ox){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	-6 (ix), a
	sub	a, 8 (ix)
	jp	NC,00110$
;src/main.c:566: if(scene[y[0]/tileheight][(x[0]+sizeX)/tilewidth] == 1){
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	a,(de)
	ld	-5 (ix), a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	push	de
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	a,#<(_scene)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-1 (ix),a
	ld	a,-6 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	l,12 (ix)
	ld	h,#0x00
	ld	a,-4 (ix)
	add	a, l
	ld	l,a
	ld	a,-3 (ix)
	adc	a, h
	ld	h,a
	ld	-4 (ix),l
	ld	-3 (ix),h
	bit	7, h
	jr	Z,00114$
	inc	hl
	inc	hl
	inc	hl
	ld	-4 (ix),l
	ld	-3 (ix),h
00114$:
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,l
	add	a, -2 (ix)
	ld	l,a
	ld	a,h
	adc	a, -1 (ix)
	ld	h,a
	ld	a,(hl)
	dec	a
	jr	NZ,00107$
;src/main.c:568: dir[0] = homeDirection(x[0],y[0],sizeX);
	ld	c,14 (ix)
	ld	b,15 (ix)
;src/main.c:567: if(path == 0){
	ld	a,(#_path + 0)
	or	a, a
	jr	NZ,00102$
;src/main.c:568: dir[0] = homeDirection(x[0],y[0],sizeX);
	push	bc
	push	de
	ld	h,12 (ix)
	ld	l,-5 (ix)
	push	hl
	ld	a,-6 (ix)
	push	af
	inc	sp
	call	_homeDirection
	pop	af
	inc	sp
	ld	a,l
	pop	de
	pop	bc
	ld	(bc),a
;src/main.c:569: path = 1;
	ld	hl,#_path + 0
	ld	(hl), #0x01
00102$:
;src/main.c:571: switch(dir[0]){
	ld	a,(bc)
	ld	h,a
	sub	a, #0x02
	jr	Z,00103$
	ld	a,h
	sub	a, #0x08
	jr	Z,00104$
	jr	00112$
;src/main.c:572: case 2: y[0] += 2; break;
00103$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	jr	00112$
;src/main.c:573: case 8: y[0] -= 2; break;
00104$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/main.c:574: }
	jr	00112$
00107$:
;src/main.c:576: x[0] += 1;
	ld	a,-6 (ix)
	inc	a
	ld	(bc),a
	jr	00112$
00110$:
;src/main.c:582: x[0] -= 1;
	ld	a,-6 (ix)
	add	a,#0xFF
	ld	(bc),a
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:587: u8* move(u8 *x,u8 *y,u8 lx, u8 ly,u8 ox,u8 oy,u8 sizeX,u8 sizeY,u8 *dir,u8 *s,u8 room,u8 px,u8 py,u8 *following){
;	---------------------------------
; Function move
; ---------------------------------
_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/main.c:588: u8 *sprite = s;
	ld	a,16 (ix)
	ld	-8 (ix),a
	ld	a,17 (ix)
	ld	-7 (ix),a
;src/main.c:591: dir[0] = chooseDirection(dir[0]);
	ld	e,14 (ix)
	ld	d,15 (ix)
;src/main.c:590: if(temp > 36){
	ld	a,#0x24
	ld	iy,#_temp
	sub	a, 0 (iy)
	jr	NC,00113$
;src/main.c:591: dir[0] = chooseDirection(dir[0]);
	ld	a,(de)
	push	de
	push	af
	inc	sp
	call	_chooseDirection
	inc	sp
	ld	a,l
	pop	de
	ld	(de),a
;src/main.c:592: temp = 0;
	ld	hl,#_temp + 0
	ld	(hl), #0x00
	jp	00114$
00113$:
;src/main.c:595: if(temp%6== 0){
	push	de
	ld	a,#0x06
	push	af
	inc	sp
	ld	a,(_temp)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	pop	de
	or	a, a
	jp	NZ,00114$
;src/main.c:596: detected = detectPlayerRoom(px,py,room);
	push	de
	ld	h,18 (ix)
	ld	l,20 (ix)
	push	hl
	ld	a,19 (ix)
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	inc	sp
	pop	de
;src/main.c:598: if(following[0] == 1){
	ld	a,21 (ix)
	ld	-4 (ix),a
	ld	a,22 (ix)
	ld	-3 (ix),a
;src/main.c:599: followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;src/main.c:597: if(detected == 0){
	ld	a,l
	or	a, a
	jp	NZ,00108$
;src/main.c:598: if(following[0] == 1){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	dec	a
	jr	NZ,00105$
;src/main.c:599: followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	push	bc
	ld	h,13 (ix)
	ld	l,12 (ix)
	push	hl
	ld	a,18 (ix)
	push	af
	inc	sp
	push	de
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	h,20 (ix)
	ld	l,19 (ix)
	push	hl
	call	_followPlayer
	ld	hl,#13
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:600: following[0] = vissionSensor(x[0],y[0],px,py);
	ld	a,(bc)
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
	ld	h,20 (ix)
	ld	l,19 (ix)
	push	hl
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_vissionSensor
	pop	af
	pop	af
	ld	a,l
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
	jp	00114$
00105$:
;src/main.c:602: if(scene[(y[0])/tileheight][(x[0])/tilewidth] == 3){
	ld	a,(bc)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	push	de
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	a,#<(_scene)
	add	a, l
	ld	-6 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-5 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	h,(hl)
	srl	h
	srl	h
	ld	a,-6 (ix)
	add	a, h
	ld	l,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	sub	a, #0x03
	jr	NZ,00102$
;src/main.c:603: patrol(dir[0],lx,ly,&x[0],&y[0],room,sizeX,sizeY);
	ld	a,(de)
	ld	d,a
	ld	h,13 (ix)
	ld	l,12 (ix)
	push	hl
	ld	a,18 (ix)
	push	af
	inc	sp
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
	jr	00114$
00102$:
;src/main.c:609: backHome(&x[0],&y[0],ox,oy,lx,ly,sizeX,sizeY,&dir[0]);
	push	de
	ld	h,13 (ix)
	ld	l,12 (ix)
	push	hl
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	ld	h,11 (ix)
	ld	l,10 (ix)
	push	hl
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_backHome
	ld	hl,#12
	add	hl,sp
	ld	sp,hl
	jr	00114$
00108$:
;src/main.c:616: following[0] = followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
	ld	h,13 (ix)
	ld	l,12 (ix)
	push	hl
	ld	a,18 (ix)
	push	af
	inc	sp
	push	de
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	h,20 (ix)
	ld	l,19 (ix)
	push	hl
	call	_followPlayer
	ld	iy,#13
	add	iy,sp
	ld	sp,iy
	ld	a,l
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
00114$:
;src/main.c:621: temp += 2;
	ld	hl, #_temp+0
	inc	(hl)
	ld	hl, #_temp+0
	inc	(hl)
;src/main.c:622: return sprite;
	pop	hl
	push	hl
	ld	sp, ix
	pop	ix
	ret
;src/main.c:630: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-143
	add	hl,sp
	ld	sp,hl
;src/main.c:631: TPlayer p = {0,80,0,80,0,80,gladis_quieto_dcha,3,6,4,16,4,0,0,3,0,0};
	ld	hl,#0x0017
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0017
	add	hl,sp
	ld	-28 (ix),l
	ld	-27 (ix),h
	ld	a,-28 (ix)
	add	a, #0x01
	ld	-10 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x50
	ld	a,-28 (ix)
	add	a, #0x02
	ld	-67 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-66 (ix),a
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	(hl),#0x00
	ld	a,-28 (ix)
	add	a, #0x03
	ld	-89 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-88 (ix),a
	ld	l,-89 (ix)
	ld	h,-88 (ix)
	ld	(hl),#0x50
	ld	a,-28 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-28 (ix)
	add	a, #0x05
	ld	l,a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x50
	ld	a,-28 (ix)
	add	a, #0x06
	ld	-2 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_gladis_quieto_dcha)
	inc	hl
	ld	(hl),#>(_gladis_quieto_dcha)
	ld	a,-28 (ix)
	add	a, #0x08
	ld	-101 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-100 (ix),a
	ld	l,-101 (ix)
	ld	h,-100 (ix)
	ld	(hl),#0x03
	ld	a,-28 (ix)
	add	a, #0x09
	ld	e,a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,#0x06
	ld	(de),a
	ld	a,-28 (ix)
	add	a, #0x0A
	ld	-63 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-62 (ix),a
	ld	l,-63 (ix)
	ld	h,-62 (ix)
	ld	(hl),#0x04
	ld	a,-28 (ix)
	add	a, #0x0B
	ld	-65 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-64 (ix),a
	ld	l,-65 (ix)
	ld	h,-64 (ix)
	ld	(hl),#0x10
	ld	a,-28 (ix)
	add	a, #0x0C
	ld	-91 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-90 (ix),a
	ld	l,-91 (ix)
	ld	h,-90 (ix)
	ld	(hl),#0x04
	ld	a,-28 (ix)
	add	a, #0x0D
	ld	-93 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-92 (ix),a
	ld	l,-93 (ix)
	ld	h,-92 (ix)
	ld	(hl),#0x00
	ld	a,-28 (ix)
	add	a, #0x0E
	ld	-12 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
	ld	a,-28 (ix)
	add	a, #0x0F
	ld	-14 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x03
	ld	a,-28 (ix)
	add	a, #0x10
	ld	l,a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-28 (ix)
	add	a, #0x11
	ld	l,a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/main.c:632: TPlayer e = {52,80,52,80,52,80,chacho_quieto_dcha,3,6,4,16,4,0,0,0,1,3};
	ld	hl,#0x0004
	add	hl,sp
	ld	(hl),#0x34
	ld	hl,#0x0004
	add	hl,sp
	ld	-16 (ix),l
	ld	-15 (ix),h
	ld	a,-16 (ix)
	add	a, #0x01
	ld	-95 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-94 (ix),a
	ld	l,-95 (ix)
	ld	h,-94 (ix)
	ld	(hl),#0x50
	ld	a,-16 (ix)
	add	a, #0x02
	ld	-97 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-96 (ix),a
	ld	l,-97 (ix)
	ld	h,-96 (ix)
	ld	(hl),#0x34
	ld	a,-16 (ix)
	add	a, #0x03
	ld	-99 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-98 (ix),a
	ld	l,-99 (ix)
	ld	h,-98 (ix)
	ld	(hl),#0x50
	ld	a,-16 (ix)
	add	a, #0x04
	ld	-30 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x34
	ld	a,-16 (ix)
	add	a, #0x05
	ld	-32 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-31 (ix),a
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	(hl),#0x50
	ld	a,-16 (ix)
	add	a, #0x06
	ld	-34 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-33 (ix),a
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),#<(_chacho_quieto_dcha)
	inc	hl
	ld	(hl),#>(_chacho_quieto_dcha)
	ld	a,-16 (ix)
	add	a, #0x08
	ld	-36 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-35 (ix),a
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	(hl),#0x03
	ld	a,-16 (ix)
	add	a, #0x09
	ld	-38 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-37 (ix),a
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	(hl),#0x06
	ld	a,-16 (ix)
	add	a, #0x0A
	ld	-40 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-39 (ix),a
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	(hl),#0x04
	ld	a,-16 (ix)
	add	a, #0x0B
	ld	-4 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x10
	ld	a,-16 (ix)
	add	a, #0x0C
	ld	-6 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x04
	ld	a,-16 (ix)
	add	a, #0x0D
	ld	l,a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-16 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-16 (ix)
	add	a, #0x0F
	ld	l,a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-16 (ix)
	add	a, #0x10
	ld	l,a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x01
	ld	a,-16 (ix)
	add	a, #0x11
	ld	-8 (ix),a
	ld	a,-15 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x03
;src/main.c:633: TNivel n = {0,0,0};
	ld	hl,#0x0001
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0001
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0001
	add	hl,bc
	ld	-42 (ix),l
	ld	-41 (ix),h
	ld	l,-42 (ix)
	ld	h,-41 (ix)
	ld	(hl),#0x00
	inc	bc
	inc	bc
	ld	-44 (ix),c
	ld	-43 (ix),b
	ld	l,-44 (ix)
	ld	h,-43 (ix)
	ld	(hl),#0x00
;src/main.c:639: u8 finish = 0,i=1,arrow=0,following = 0;
	ld	-121 (ix),#0x00
	ld	-102 (ix),#0x00
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),#0x00
;src/main.c:641: u8 bound =0;
	ld	-45 (ix),#0x00
;src/main.c:642: temp = 0;
	ld	hl,#_temp + 0
	ld	(hl), #0x00
;src/main.c:644: cpct_clearScreen(0);
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
;src/main.c:649: while (1){
	ld	a,-95 (ix)
	ld	-47 (ix),a
	ld	a,-94 (ix)
	ld	-46 (ix),a
	ld	a,-16 (ix)
	ld	-49 (ix),a
	ld	a,-15 (ix)
	ld	-48 (ix),a
	ld	a,-14 (ix)
	ld	-18 (ix),a
	ld	a,-13 (ix)
	ld	-17 (ix),a
	ld	a,-63 (ix)
	ld	-20 (ix),a
	ld	a,-62 (ix)
	ld	-19 (ix),a
	ld	-22 (ix),e
	ld	-21 (ix),d
	ld	a,-93 (ix)
	ld	-24 (ix),a
	ld	a,-92 (ix)
	ld	-23 (ix),a
	ld	a,-10 (ix)
	ld	-26 (ix),a
	ld	a,-9 (ix)
	ld	-25 (ix),a
	ld	a,-28 (ix)
	ld	-51 (ix),a
	ld	a,-27 (ix)
	ld	-50 (ix),a
	ld	a,-44 (ix)
	ld	-53 (ix),a
	ld	a,-43 (ix)
	ld	-52 (ix),a
	ld	a,-42 (ix)
	ld	-55 (ix),a
	ld	a,-41 (ix)
	ld	-54 (ix),a
	ld	a,-14 (ix)
	ld	-57 (ix),a
	ld	a,-13 (ix)
	ld	-56 (ix),a
	ld	a,-101 (ix)
	ld	-59 (ix),a
	ld	a,-100 (ix)
	ld	-58 (ix),a
	ld	a,-10 (ix)
	ld	-61 (ix),a
	ld	a,-9 (ix)
	ld	-60 (ix),a
	ld	a,-28 (ix)
	ld	-69 (ix),a
	ld	a,-27 (ix)
	ld	-68 (ix),a
00133$:
;src/main.c:652: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:655: erasePlayer(p.lx,p.ly,p.lsize,p.sizeY);
	ld	l,-65 (ix)
	ld	h,-64 (ix)
	ld	b,(hl)
	ld	l,-91 (ix)
	ld	h,-90 (ix)
	ld	a,(hl)
	ld	l,-89 (ix)
	ld	h,-88 (ix)
	ld	e,(hl)
	ld	l,-67 (ix)
	ld	h,-66 (ix)
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
;src/main.c:656: erasePlayer(e.lx,e.ly,e.lsize,e.sizeY);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	l,-99 (ix)
	ld	h,-98 (ix)
	ld	e,(hl)
	ld	l,-97 (ix)
	ld	h,-96 (ix)
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
;src/main.c:657: if(arrow == 1){
	ld	a,-102 (ix)
	dec	a
	jr	NZ,00104$
;src/main.c:658: erasePlayer(object.lx,object.ly,object.sizeX,object.sizeY);
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
;src/main.c:659: if(bound == 1) arrow = 0;
	ld	a,-45 (ix)
	dec	a
	jr	NZ,00104$
	ld	-102 (ix),#0x00
00104$:
;src/main.c:663: drawPickUps(n.corazon,n.bullet);
	ld	l,-44 (ix)
	ld	h,-43 (ix)
	ld	b,(hl)
	ld	l,-42 (ix)
	ld	h,-41 (ix)
	ld	c, (hl)
	push	bc
	call	_drawPickUps
	pop	af
;src/main.c:666: drawPlayer(p.x,p.y,p.sprite,p.sizeX,p.sizeY,p.life);
	ld	l,-101 (ix)
	ld	h,-100 (ix)
	ld	a,(hl)
	ld	l,-65 (ix)
	ld	h,-64 (ix)
	ld	c,(hl)
	ld	l,-63 (ix)
	ld	h,-62 (ix)
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	af
	ld	a,(hl)
	ld	-71 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-70 (ix),a
	pop	af
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	d,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,-71 (ix)
	ld	h,-70 (ix)
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
;src/main.c:667: if(e.life > 0) drawPlayer(e.x,e.y,e.sprite,e.sizeX,e.sizeY,e.life);
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	c,(hl)
	ld	a,c
	or	a, a
	jr	Z,00106$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	e,(hl)
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	a,(hl)
	ld	-71 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-70 (ix),a
	ld	l,-95 (ix)
	ld	h,-94 (ix)
	ld	a,(hl)
	ld	-72 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	l,-71 (ix)
	ld	h,-70 (ix)
	push	hl
	ld	a,-72 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
00106$:
;src/main.c:668: if(arrow == 1) drawPlayer(object.x,object.y,object.sprite,object.sizeX,object.sizeY,object.vivo);
	ld	a,-102 (ix)
	dec	a
	jr	NZ,00108$
	ld	a, (#(_object + 0x0006) + 0)
	ld	hl, #(_object + 0x0009) + 0
	ld	c,(hl)
	ld	hl, #(_object + 0x0008) + 0
	ld	b,(hl)
	ld	hl, #_object + 4
	push	af
	ld	a,(hl)
	ld	-71 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-70 (ix),a
	pop	af
	ld	hl, #(_object + 0x0001) + 0
	ld	e,(hl)
	ld	hl, #_object + 0
	ld	d,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,-71 (ix)
	ld	h,-70 (ix)
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
00108$:
;src/main.c:671: drawVida(p.life);
	ld	l,-101 (ix)
	ld	h,-100 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawVida
	inc	sp
;src/main.c:672: drawBullets(p.bullets);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawBullets
	inc	sp
;src/main.c:675: if(p.atk < 20) drawFatiga(p.atk,2);
	ld	l,-93 (ix)
	ld	h,-92 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x14
	jr	NC,00113$
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00114$
00113$:
;src/main.c:676: else if(p.atk > 20) drawFatiga(p.atk,1);
	ld	a,#0x14
	sub	a, d
	jr	NC,00110$
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00114$
00110$:
;src/main.c:677: else drawFatiga(p.atk,0);
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
00114$:
;src/main.c:680: p.lx = p.x;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	(hl),a
;src/main.c:681: p.ly = p.y;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	l,-89 (ix)
	ld	h,-88 (ix)
	ld	(hl),a
;src/main.c:682: e.lx = e.x;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	ld	l,-97 (ix)
	ld	h,-96 (ix)
	ld	(hl),a
;src/main.c:683: e.ly = e.y;
	ld	l,-95 (ix)
	ld	h,-94 (ix)
	ld	a,(hl)
	ld	l,-99 (ix)
	ld	h,-98 (ix)
	ld	(hl),a
;src/main.c:684: p.latk = p.atk;
	ld	l,-93 (ix)
	ld	h,-92 (ix)
	ld	a,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),a
;src/main.c:685: p.lsize = p.sizeX;
	ld	l,-63 (ix)
	ld	h,-62 (ix)
	ld	a,(hl)
	ld	l,-91 (ix)
	ld	h,-90 (ix)
	ld	(hl),a
;src/main.c:688: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:689: p.sprite = checkKeyboard(&p.x,&p.y,&p.atk,&p.dir,p.sprite,&p.sizeX,&p.bullets,&finish,&arrow);
	ld	hl,#0x0029
	add	hl,sp
	ld	c, l
	ld	b, h
	ld	hl,#0x0016
	add	hl,sp
	ld	-71 (ix),l
	ld	-70 (ix),h
	ld	e,-18 (ix)
	ld	d,-17 (ix)
	ld	a,-20 (ix)
	ld	-74 (ix),a
	ld	a,-19 (ix)
	ld	-73 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-76 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-75 (ix),a
	ld	a,-22 (ix)
	ld	-78 (ix),a
	ld	a,-21 (ix)
	ld	-77 (ix),a
	ld	a,-24 (ix)
	ld	-80 (ix),a
	ld	a,-23 (ix)
	ld	-79 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,-51 (ix)
	ld	-82 (ix),a
	ld	a,-50 (ix)
	ld	-81 (ix),a
	push	bc
	ld	c,-71 (ix)
	ld	b,-70 (ix)
	push	bc
	push	de
	ld	c,-74 (ix)
	ld	b,-73 (ix)
	push	bc
	ld	c,-76 (ix)
	ld	b,-75 (ix)
	push	bc
	ld	c,-78 (ix)
	ld	b,-77 (ix)
	push	bc
	ld	c,-80 (ix)
	ld	b,-79 (ix)
	push	bc
	push	hl
	ld	l,-82 (ix)
	ld	h,-81 (ix)
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
;src/main.c:690: checkBoundsCollisions(&p.x,&p.y,p.lx,p.ly,p.sizeX,p.sizeY,&p.life,&p.bullets,&n.corazon,&n.bullet);
	ld	c,-53 (ix)
	ld	b,-52 (ix)
	ld	e,-55 (ix)
	ld	d,-54 (ix)
	ld	a,-57 (ix)
	ld	-82 (ix),a
	ld	a,-56 (ix)
	ld	-81 (ix),a
	ld	a,-59 (ix)
	ld	-80 (ix),a
	ld	a,-58 (ix)
	ld	-79 (ix),a
	ld	l,-65 (ix)
	ld	h,-64 (ix)
	ld	a,(hl)
	ld	-78 (ix),a
	ld	l,-63 (ix)
	ld	h,-62 (ix)
	ld	a,(hl)
	ld	-76 (ix),a
	ld	l,-89 (ix)
	ld	h,-88 (ix)
	ld	a,(hl)
	ld	-74 (ix),a
	ld	l,-67 (ix)
	ld	h,-66 (ix)
	ld	a,(hl)
	ld	-72 (ix),a
	ld	a,-61 (ix)
	ld	-71 (ix),a
	ld	a,-60 (ix)
	ld	-70 (ix),a
	push	hl
	ld	l,-69 (ix)
	ld	h,-68 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	push	de
	ld	l,-82 (ix)
	ld	h,-81 (ix)
	push	hl
	ld	l,-80 (ix)
	ld	h,-79 (ix)
	push	hl
	ld	h,-78 (ix)
	ld	l,-76 (ix)
	push	hl
	ld	h,-74 (ix)
	ld	l,-72 (ix)
	push	hl
	ld	l,-71 (ix)
	ld	h,-70 (ix)
	push	hl
	push	iy
	call	_checkBoundsCollisions
	ld	hl,#16
	add	hl,sp
	ld	sp,hl
;src/main.c:691: if(e.life > 0)
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00116$
;src/main.c:692: e.sprite = move(&e.x,&e.y,e.lx,e.ly,e.ox,e.oy,e.sizeX,e.sizeY,&e.dir,e.sprite,e.room,p.x,p.y,&following);
	ld	hl,#0x0000
	add	hl,sp
	ld	-82 (ix),l
	ld	-81 (ix),h
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-80 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-78 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-76 (ix),a
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	a,(hl)
	ld	-74 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-73 (ix),a
	ld	a,-38 (ix)
	ld	-71 (ix),a
	ld	a,-37 (ix)
	ld	-70 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-72 (ix),a
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	a,(hl)
	ld	-83 (ix),a
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	a,(hl)
	ld	-84 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	a,(hl)
	ld	-85 (ix),a
	ld	l,-99 (ix)
	ld	h,-98 (ix)
	ld	a,(hl)
	ld	-86 (ix),a
	ld	l,-97 (ix)
	ld	h,-96 (ix)
	ld	a,(hl)
	ld	-87 (ix),a
	ld	e,-47 (ix)
	ld	d,-46 (ix)
	ld	c,-49 (ix)
	ld	b,-48 (ix)
	ld	l,-82 (ix)
	ld	h,-81 (ix)
	push	hl
	ld	h,-80 (ix)
	ld	l,-78 (ix)
	push	hl
	ld	a,-76 (ix)
	push	af
	inc	sp
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	push	hl
	ld	l,-71 (ix)
	ld	h,-70 (ix)
	push	hl
	ld	h,-72 (ix)
	ld	l,-83 (ix)
	push	hl
	ld	h,-84 (ix)
	ld	l,-85 (ix)
	push	hl
	ld	h,-86 (ix)
	ld	l,-87 (ix)
	push	hl
	push	de
	push	bc
	call	_move
	ld	iy,#19
	add	iy,sp
	ld	sp,iy
	ld	d,l
	ld	e,h
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
00116$:
;src/main.c:694: if(e.life > 0)
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	a, (hl)
	or	a, a
	jp	Z,00125$
;src/main.c:695: if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 2){
	ld	l,-93 (ix)
	ld	h,-92 (ix)
	ld	a,(hl)
	ld	l,-95 (ix)
	ld	h,-94 (ix)
	ld	c,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	b,(hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
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
	ld	a,l
	sub	a, #0x02
	jr	NZ,00122$
;src/main.c:696: p.x = 0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
;src/main.c:697: p.y = 80;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x50
;src/main.c:698: p.life -= 1;
	ld	l,-101 (ix)
	ld	h,-100 (ix)
	ld	a,(hl)
	add	a,#0xFF
	ld	l,-101 (ix)
	ld	h,-100 (ix)
	ld	(hl),a
;src/main.c:699: if(p.life == 0){
	or	a, a
	jr	NZ,00125$
;src/main.c:700: gameOver();
	call	_gameOver
;src/main.c:701: break;
	jp	00135$
00122$:
;src/main.c:703: }else if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 1){
	ld	l,-93 (ix)
	ld	h,-92 (ix)
	ld	a,(hl)
	ld	l,-95 (ix)
	ld	h,-94 (ix)
	ld	c,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	b,(hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
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
	jr	NZ,00125$
;src/main.c:704: e.life =0;
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	(hl),#0x00
00125$:
;src/main.c:708: if(arrow == 1){
	ld	a,-102 (ix)
	dec	a
	jp	NZ,00129$
;src/main.c:709: moveObject();
	call	_moveObject
;src/main.c:710: bound = checkBoundsCollisions(&object.x,&object.y,object.lx,object.ly,object.sizeX,object.sizeY,0,0,0,0);
	ld	hl, #(_object + 0x0009) + 0
	ld	e,(hl)
	ld	hl, #(_object + 0x0008) + 0
	ld	c,(hl)
	ld	a,(#(_object + 0x0003) + 0)
	ld	-87 (ix),a
	ld	hl, #(_object + 0x0002) + 0
	ld	d,(hl)
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	a,e
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,-87 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#(_object + 0x0001)
	push	hl
	ld	hl,#_object
	push	hl
	call	_checkBoundsCollisions
	ld	iy,#16
	add	iy,sp
	ld	sp,iy
	ld	-45 (ix),l
;src/main.c:711: if(checkCollisions(object.x, object.y, e.x, e.y, 21) == 1){
	ld	l,-95 (ix)
	ld	h,-94 (ix)
	ld	c,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	b,(hl)
	ld	hl, #(_object + 0x0001) + 0
	ld	e,(hl)
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	a,#0x15
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
	jr	NZ,00129$
;src/main.c:712: e.life = 0;
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	(hl),#0x00
;src/main.c:713: object.vivo = 0;
	ld	hl,#(_object + 0x0006)
	ld	(hl),#0x00
00129$:
;src/main.c:717: if(finish == 1) return;
	ld	a,-121 (ix)
	dec	a
	jp	NZ,00133$
00135$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:724: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:726: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:727: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:728: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:730: while (1){
00104$:
;src/main.c:732: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:736: if(cpct_isKeyPressed(Key_Esc)) {
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:738: return;
	ret
___str_5:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:748: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:752: init();
	call	_init
;src/main.c:755: while(1){
00106$:
;src/main.c:756: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:757: switch(x){
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
;src/main.c:758: case 0: return;break;
;src/main.c:759: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:760: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:761: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
