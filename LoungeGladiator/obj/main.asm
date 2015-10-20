;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Tue Oct 20 17:29:28 2015
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
	.globl _cpct_drawSprite
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
;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
;	---------------------------------
; Function detectPlayerRoom
; ---------------------------------
_detectPlayerRoom::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
	ld	de,#_scene+0
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
	add	hl,de
	ld	e,4 (ix)
	srl	e
	srl	e
	ld	d,#0x00
	add	hl,de
	ld	l,(hl)
	pop	ix
	ret
_g_palette:
	.db #0x00	; 0
	.db #0x1A	; 26
	.db #0x06	; 6
	.db #0x0D	; 13
	.db 0x00
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
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
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
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
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
;src/ia.h:16: u8 chooseDirection(){
;	---------------------------------
; Function chooseDirection
; ---------------------------------
_chooseDirection::
;src/ia.h:18: u8 dir = 0;
	ld	d,#0x00
;src/ia.h:19: u8 rnd = (rand()%4)+1;
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
;src/ia.h:20: switch(rnd){
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
;src/ia.h:21: case 4: dir = 6;break;
	jp	(hl)
00116$:
	jr	00104$
	jr	00103$
	jr	00102$
	jr	00101$
00101$:
	ld	d,#0x06
	jr	00105$
;src/ia.h:22: case 3: dir = 4;break;
00102$:
	ld	d,#0x04
	jr	00105$
;src/ia.h:23: case 2: dir = 2;break;
00103$:
	ld	d,#0x02
	jr	00105$
;src/ia.h:24: case 1: dir = 8;break;
00104$:
	ld	d,#0x08
;src/ia.h:25: }
00105$:
;src/ia.h:27: return dir;
	ld	l,d
	ret
;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
;	---------------------------------
; Function setDirection
; ---------------------------------
_setDirection::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/ia.h:33: if(px < x) dir = 4;
	ld	a,4 (ix)
	sub	a, 6 (ix)
	jr	NC,00108$
	ld	l,#0x04
	jr	00109$
00108$:
;src/ia.h:34: else if(py > y) dir = 2;
	ld	a,7 (ix)
	sub	a, 5 (ix)
	jr	NC,00105$
	ld	l,#0x02
	jr	00109$
00105$:
;src/ia.h:35: else if(px > x) dir = 6;
	ld	a,6 (ix)
	sub	a, 4 (ix)
	jr	NC,00102$
	ld	l,#0x06
	jr	00109$
00102$:
;src/ia.h:36: else dir = 8;
	ld	l,#0x08
00109$:
;src/ia.h:37: return dir;
	pop	ix
	ret
;src/ia.h:40: void movement(u8 dir,u8 *x,u8 *y){
;	---------------------------------
; Function movement
; ---------------------------------
_movement::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/ia.h:44: case 8: y[0] -= 2; break;
	ld	e,7 (ix)
	ld	d,8 (ix)
;src/ia.h:41: switch(dir){
	ld	a,4 (ix)
	sub	a, #0x02
	jr	Z,00104$
;src/ia.h:42: case 6: x[0] += 1; break;
	ld	l,5 (ix)
	ld	h,6 (ix)
;src/ia.h:41: switch(dir){
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
;src/ia.h:42: case 6: x[0] += 1; break;
00101$:
	inc	(hl)
	jr	00106$
;src/ia.h:43: case 4: x[0] -= 1; break;
00102$:
	ld	d,(hl)
	dec	d
	ld	(hl),d
	jr	00106$
;src/ia.h:44: case 8: y[0] -= 2; break;
00103$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
	jr	00106$
;src/ia.h:45: case 2: y[0] += 2; break;
00104$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
;src/ia.h:46: }
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
;src/main.c:35: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:36: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:37: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:38: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:39: cpct_setPalette(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
	ret
;src/main.c:43: void gameOver(){
;	---------------------------------
; Function gameOver
; ---------------------------------
_gameOver::
;src/main.c:45: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:46: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:47: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:52: int menu(){
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
;src/main.c:54: int init = 50;
	ld	hl,#0x0032
	ex	(sp), hl
;src/main.c:55: int pushed =0;
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;src/main.c:56: int cont =0;
	ld	de,#0x0000
;src/main.c:57: cpct_clearScreen(0);
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
;src/main.c:60: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:64: cpct_drawStringM0("Nueva Partida",memptr,1,0);
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
;src/main.c:67: cpct_drawStringM0("Creditos",memptr,1,0);
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
;src/main.c:60: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:70: cpct_drawStringM0("Salir",memptr,1,0);
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
;src/main.c:76: while(1){
00118$:
;src/main.c:78: cpct_scanKeyboard();
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
;src/main.c:80: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:81: pushed ++;
	inc	-4 (ix)
	jr	NZ,00163$
	inc	-3 (ix)
00163$:
;src/main.c:82: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:84: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
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
;src/main.c:85: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:86: pushed --;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	dec	hl
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:87: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:90: switch (pushed){
	ld	a,-3 (ix)
	rlca
	and	a,#0x01
	ld	b,a
	ld	a,#0x02
	cp	a, -4 (ix)
	ld	a,#0x00
	sbc	a, -3 (ix)
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
	ld	e,-4 (ix)
	ld	d,#0x00
	ld	hl,#00166$
	add	hl,de
	add	hl,de
;src/main.c:91: case 0: init = 50;break;
	pop	de
	jp	(hl)
00166$:
	jr	00107$
	jr	00108$
	jr	00109$
00107$:
	ld	hl,#0x0032
	ex	(sp), hl
	jr	00110$
;src/main.c:92: case 1: init = 70;break;
00108$:
	ld	hl,#0x0046
	ex	(sp), hl
	jr	00110$
;src/main.c:93: case 2: init = 90;break;
00109$:
	ld	hl,#0x005A
	ex	(sp), hl
;src/main.c:94: }
00110$:
;src/main.c:95: memptr = cpct_getScreenPtr(VMEM,15,init);
	ld	h,-6 (ix)
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
;src/main.c:60: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:96: cpct_drawSolidBox(memptr, 3, 2, 8);
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
;src/main.c:98: switch (pushed){
	ld	a,b
	or	a,a
	jr	NZ,00116$
	or	a,c
	jr	NZ,00116$
	ld	e,-4 (ix)
	ld	d,#0x00
	ld	hl,#00167$
	add	hl,de
	add	hl,de
;src/main.c:99: case 0: return 1;break;
	jp	(hl)
00167$:
	jr	00111$
	jr	00112$
	jr	00113$
00111$:
	ld	hl,#0x0001
	jr	00120$
;src/main.c:100: case 1: return 2;break;
00112$:
	ld	hl,#0x0002
	jr	00120$
;src/main.c:101: case 2: return 0;break;
00113$:
	ld	hl,#0x0000
	jr	00120$
;src/main.c:102: }
00116$:
;src/main.c:104: cont++;
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
;src/main.c:119: void drawMap(u8 t){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-16
	add	hl,sp
	ld	sp,hl
;src/main.c:123: if(t == 1){
	ld	a,4 (ix)
	dec	a
	jp	NZ,00104$
;src/main.c:124: for(y=0;y<height;y++){
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x00
;src/main.c:125: for(x=0;x<width;x++){
00130$:
	ld	a,#<(_scene)
	add	a, -8 (ix)
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, -7 (ix)
	ld	-1 (ix),a
	ld	a,#<(_mapa1)
	add	a, -8 (ix)
	ld	-6 (ix),a
	ld	a,#>(_mapa1)
	adc	a, -7 (ix)
	ld	-5 (ix),a
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
00115$:
;src/main.c:126: scene[y][x] = mapa1[y][x];
	ld	a,-2 (ix)
	add	a, -14 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, -13 (ix)
	ld	-3 (ix),a
	ld	a,-6 (ix)
	add	a, -14 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	adc	a, -13 (ix)
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/main.c:125: for(x=0;x<width;x++){
	inc	-14 (ix)
	jr	NZ,00189$
	inc	-13 (ix)
00189$:
	ld	a,-14 (ix)
	sub	a, #0x14
	ld	a,-13 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00115$
;src/main.c:124: for(y=0;y<height;y++){
	ld	a,-8 (ix)
	add	a, #0x14
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	inc	-12 (ix)
	jr	NZ,00190$
	inc	-11 (ix)
00190$:
	ld	a,-12 (ix)
	sub	a, #0x0C
	ld	a,-11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00130$
00104$:
;src/main.c:131: if(t == 2){
	ld	a,4 (ix)
	sub	a, #0x02
	jp	NZ,00141$
;src/main.c:132: for(y=0;y<height;y++){
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
;src/main.c:133: for(x=0;x<width;x++){
00134$:
	ld	a,#<(_scene)
	add	a, -10 (ix)
	ld	-4 (ix),a
	ld	a,#>(_scene)
	adc	a, -9 (ix)
	ld	-3 (ix),a
	ld	a,#<(_mapa2)
	add	a, -10 (ix)
	ld	-6 (ix),a
	ld	a,#>(_mapa2)
	adc	a, -9 (ix)
	ld	-5 (ix),a
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
00119$:
;src/main.c:134: scene[y][x] = mapa2[y][x];
	ld	a,-4 (ix)
	add	a, -14 (ix)
	ld	-2 (ix),a
	ld	a,-3 (ix)
	adc	a, -13 (ix)
	ld	-1 (ix),a
	ld	a,-6 (ix)
	add	a, -14 (ix)
	ld	-8 (ix),a
	ld	a,-5 (ix)
	adc	a, -13 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/main.c:133: for(x=0;x<width;x++){
	inc	-14 (ix)
	jr	NZ,00193$
	inc	-13 (ix)
00193$:
	ld	a,-14 (ix)
	sub	a, #0x14
	ld	a,-13 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00119$
;src/main.c:132: for(y=0;y<height;y++){
	ld	a,-10 (ix)
	add	a, #0x14
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	inc	-12 (ix)
	jr	NZ,00194$
	inc	-11 (ix)
00194$:
	ld	a,-12 (ix)
	sub	a, #0x0C
	ld	a,-11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00134$
;src/main.c:139: for(posY=0; posY<height;posY++){
00141$:
	ld	bc,#0x0000
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	de,#0x0000
;src/main.c:140: for(posX=0; posX<width;posX++){
00139$:
	ld	hl,#_scene
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	hl,#0x0000
	ex	(sp), hl
00123$:
;src/main.c:141: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-16 (ix)
	add	a, a
	add	a, a
	push	bc
	push	de
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
;src/main.c:142: if(scene[posY][posX] == 1){
	ld	a,-4 (ix)
	add	a, -16 (ix)
	ld	l,a
	ld	a,-3 (ix)
	adc	a, -15 (ix)
	ld	h,a
	ld	h,(hl)
;src/main.c:143: cpct_drawSprite(g_tile_muro, memptr,tilewidth,tileheight);
	push	iy
	pop	af
	ld	-5 (ix),a
	push	iy
	dec	sp
	pop	af
	inc	sp
	ld	-6 (ix),a
;src/main.c:142: if(scene[posY][posX] == 1){
	dec	h
	jr	NZ,00110$
;src/main.c:143: cpct_drawSprite(g_tile_muro, memptr,tilewidth,tileheight);
	push	bc
	push	de
	ld	hl,#0x1004
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	hl,#_g_tile_muro
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
00110$:
;src/main.c:145: if(scene[posY][posX] == 9){
	ld	a,#<(_scene)
	add	a, -10 (ix)
	ld	l,a
	ld	a,#>(_scene)
	adc	a, -9 (ix)
	ld	h,a
	ld	a,l
	add	a, -16 (ix)
	ld	l,a
	ld	a,h
	adc	a, -15 (ix)
	ld	h,a
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00124$
;src/main.c:146: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
	push	bc
	push	de
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
	pop	de
	pop	bc
00124$:
;src/main.c:140: for(posX=0; posX<width;posX++){
	inc	-16 (ix)
	jr	NZ,00199$
	inc	-15 (ix)
00199$:
	ld	a,-16 (ix)
	sub	a, #0x14
	ld	a,-15 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00123$
;src/main.c:139: for(posY=0; posY<height;posY++){
	ld	a,-10 (ix)
	add	a, #0x14
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
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
	jp	C,00139$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:160: void drawPlayer(u8 x,u8 y,u8 *sprite,u8 life,u8 mode){
;	---------------------------------
; Function drawPlayer
; ---------------------------------
_drawPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:162: if(life > 0){
	ld	a,8 (ix)
	or	a, a
	jr	Z,00107$
;src/main.c:163: memptr = cpct_getScreenPtr(VMEM,x,y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:164: switch(mode){
	ld	a,#0x02
	sub	a, 9 (ix)
	jr	C,00107$
;src/main.c:166: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	c, l
	ld	b, h
	ld	e,6 (ix)
	ld	d,7 (ix)
;src/main.c:164: switch(mode){
	push	de
	ld	e,9 (ix)
	ld	d,#0x00
	ld	hl,#00117$
	add	hl,de
	add	hl,de
;src/main.c:165: case 0:
	pop	de
	jp	(hl)
00117$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/main.c:166: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:167: break;
	jr	00107$
;src/main.c:168: case 1:
00102$:
;src/main.c:169: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:170: break;
	jr	00107$
;src/main.c:171: case 2:
00103$:
;src/main.c:172: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
	ld	hl,#0x0404
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:174: }
00107$:
	pop	ix
	ret
;src/main.c:178: void erasePlayer(u8 x,u8 y,u8 mode){
;	---------------------------------
; Function erasePlayer
; ---------------------------------
_erasePlayer::
;src/main.c:181: memptr = cpct_getScreenPtr(VMEM,x,y);
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
	ld	c, l
	ld	b, h
;src/main.c:182: switch(mode){
	ld	a,#0x02
	ld	iy,#4
	add	iy,sp
	sub	a, 0 (iy)
	ret	C
;src/main.c:184: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:182: switch(mode){
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00111$
	add	hl,de
	add	hl,de
;src/main.c:183: case 0:
	jp	(hl)
00111$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/main.c:184: cpct_drawSolidBox(memptr,0,4,16);
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
;src/main.c:185: break;
	ret
;src/main.c:186: case 1:
00102$:
;src/main.c:187: cpct_drawSolidBox(memptr,0,2,8);
	ld	hl,#0x0802
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:188: break;
	ret
;src/main.c:189: case 2:
00103$:
;src/main.c:190: cpct_drawSolidBox(memptr,0,4,4);
	ld	hl,#0x0404
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:192: }
	ret
;src/main.c:199: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:201: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/main.c:202: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/main.c:203: if(atk > 30 || atk <= 20){
	ld	a,#0x14
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
;src/main.c:205: switch(col){
	ld	a,#0x02
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	-2 (ix),a
;src/main.c:203: if(atk > 30 || atk <= 20){
	ld	a,#0x1E
	sub	a, 4 (ix)
	jr	C,00107$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
00107$:
;src/main.c:204: memptr = cpct_getScreenPtr(VMEM,4,192);
	ld	hl,#0xC004
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:205: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00108$
;src/main.c:207: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:205: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00156$
	add	hl,de
	add	hl,de
;src/main.c:206: case 0:
	jp	(hl)
00156$:
	jr	00103$
	jr	00104$
	jr	00105$
00103$:
;src/main.c:207: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:208: break;
	jr	00108$
;src/main.c:209: case 1:
00104$:
;src/main.c:210: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:211: break;
	jr	00108$
;src/main.c:212: case 2:
00105$:
;src/main.c:213: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:214: }
00108$:
;src/main.c:216: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00114$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00115$
00114$:
;src/main.c:217: memptr = cpct_getScreenPtr(VMEM,7,192);
	ld	hl,#0xC007
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:218: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00115$
;src/main.c:207: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:218: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00157$
	add	hl,de
	add	hl,de
;src/main.c:219: case 0:
	jp	(hl)
00157$:
	jr	00110$
	jr	00111$
	jr	00112$
00110$:
;src/main.c:220: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:221: break;
	jr	00115$
;src/main.c:222: case 1:
00111$:
;src/main.c:223: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:224: break;
	jr	00115$
;src/main.c:225: case 2:
00112$:
;src/main.c:226: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:227: }
00115$:
;src/main.c:229: if(atk <= 20){
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00122$
;src/main.c:230: memptr = cpct_getScreenPtr(VMEM,10,192);
	ld	hl,#0xC00A
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:207: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:231: switch(col){
	ld	a,5 (ix)
	or	a, a
	jr	Z,00117$
	ld	a,5 (ix)
	sub	a, #0x02
	jr	Z,00118$
	jr	00122$
;src/main.c:232: case 0:
00117$:
;src/main.c:233: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:234: break;
	jr	00122$
;src/main.c:235: case 2:
00118$:
;src/main.c:236: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:237: }
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:242: void drawPickUps(u8 corazon, u8 bullet){
;	---------------------------------
; Function drawPickUps
; ---------------------------------
_drawPickUps::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:245: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:247: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	c, l
	ld	b, h
;src/main.c:246: if(corazon == 0)
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00102$
;src/main.c:247: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00103$
00102$:
;src/main.c:249: cpct_drawSolidBox(memptr, 0, 4, 8);
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
;src/main.c:251: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
	ld	hl,#0x1008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:247: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ex	de,hl
;src/main.c:252: if(bullet == 0)
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00105$
;src/main.c:253: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
	ld	bc,#_flecha_arriba
	ld	hl,#0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00107$
00105$:
;src/main.c:255: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:260: void drawVida(u8 life){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:265: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0041
00105$:
;src/main.c:266: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/main.c:267: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:268: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
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
;src/main.c:270: cpct_drawSolidBox(memptr,0,4,8);
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
;src/main.c:265: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:292: void drawBullets(u8 bullet){
;	---------------------------------
; Function drawBullets
; ---------------------------------
_drawBullets::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:296: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0032
00105$:
;src/main.c:297: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/main.c:298: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:299: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
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
;src/main.c:300: else  cpct_drawSolidBox(memptr,0,2,8);
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
;src/main.c:296: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:323: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
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
;src/main.c:325: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:326: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:327: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:328: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:329: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:330: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:332: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:333: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
	jp	00112$
00107$:
;src/main.c:335: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
	ld	a,-8 (ix)
	sub	a, #0x03
	jp	NZ,00101$
;src/main.c:336: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:337: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
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
;src/main.c:338: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:340: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:341: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:345: void checkArrowCollisions(u8 *arrow){
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
;src/main.c:347: u8 posX = object.x;
	ld	a,(#_object+0)
	ld	-12 (ix),a
;src/main.c:348: u8 posY = object.y;
	ld	a,(#_object + 1)
;src/main.c:349: if(    scene[(posY)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:350: || scene[(posY)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:351: || scene[(posY+object.sizeY-2)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:352: || scene[(posY+object.sizeY-2)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:354: arrow[0] = 0;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x00
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:358: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY,u8 *life,u8 *bullets,u8 *corazon, u8 *flecha){
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
;src/main.c:360: u8 *posX = x;
	ld	a,4 (ix)
	ld	-21 (ix),a
	ld	a,5 (ix)
	ld	-20 (ix),a
;src/main.c:361: u8 *posY = y;
	ld	a,6 (ix)
	ld	-18 (ix),a
	ld	a,7 (ix)
	ld	-17 (ix),a
;src/main.c:362: u8 bound = 0;
	ld	-19 (ix),#0x00
;src/main.c:363: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:364: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:365: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:366: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:368: *posX=lx;
	pop	hl
	push	hl
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:369: *posY=ly;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:370: bound = 1;
	ld	-19 (ix),#0x01
	jp	00126$
00125$:
;src/main.c:372: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 2
	ld	a,-2 (ix)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:373: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
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
;src/main.c:374: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 2
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
;src/main.c:375: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
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
;src/main.c:377: if(*life < 3 && *corazon == 0){
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
;src/main.c:378: *life += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:379: *corazon = 1;
	ld	(hl),#0x01
	jp	00126$
00119$:
;src/main.c:382: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5
	ld	a,-2 (ix)
	sub	a, #0x05
	jp	Z,00112$
;src/main.c:383: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
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
;src/main.c:384: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 5
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
;src/main.c:385: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
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
;src/main.c:387: if(*bullets < 3 && *flecha == 0){
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
;src/main.c:388: *bullets += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:389: *flecha = 1;
	ld	(hl),#0x01
	jp	00126$
00113$:
;src/main.c:391: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9
	ld	a,-2 (ix)
	sub	a, #0x09
	jp	Z,00107$
;src/main.c:392: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
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
;src/main.c:393: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 9
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
;src/main.c:394: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
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
;src/main.c:396: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:397: drawMap(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_drawMap
	inc	sp
00126$:
;src/main.c:399: return bound;
	ld	l,-19 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:404: u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *bullets,u8 *finish,u8 *arrow){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-21
	add	hl,sp
	ld	sp,hl
;src/main.c:406: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	-3 (ix),l
	ld	a,8 (ix)
	ld	-16 (ix),a
	ld	a,9 (ix)
	ld	-15 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	ld	-10 (ix),a
;src/main.c:407: size[0] = 5;
	ld	a,14 (ix)
	ld	-9 (ix),a
	ld	a,15 (ix)
	ld	-8 (ix),a
;src/main.c:410: switch(dir[0]){
	ld	a,10 (ix)
	ld	-14 (ix),a
	ld	a,11 (ix)
	ld	-13 (ix),a
;src/main.c:449: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0 && atk[0] == 20){
	ld	a,20 (ix)
	ld	-12 (ix),a
	ld	a,21 (ix)
	ld	-11 (ix),a
;src/main.c:406: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	a,-10 (ix)
	sub	a, #0x14
	ld	a,#0x00
	rla
	ld	-19 (ix),a
	ld	a,-3 (ix)
	or	a, a
	jp	Z,00146$
	ld	a,-19 (ix)
	or	a, a
	jp	NZ,00146$
;src/main.c:407: size[0] = 5;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x05
;src/main.c:408: if(atk[0] >= 50) atk[0] =0;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	sub	a, #0x32
	jr	C,00102$
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#0x00
	jr	00103$
00102$:
;src/main.c:409: else atk[0] += 1;
	ld	a,-3 (ix)
	inc	a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),a
00103$:
;src/main.c:410: switch(dir[0]){
	ld	l,-14 (ix)
	ld	h,-13 (ix)
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
	jp	00147$
;src/main.c:411: case 4:
00104$:
;src/main.c:412: s = gladis_atk_izda;
	ld	12 (ix),#<(_gladis_atk_izda)
	ld	13 (ix),#>(_gladis_atk_izda)
;src/main.c:413: break;
	jp	00147$
;src/main.c:414: case 6:
00105$:
;src/main.c:415: s = gladis_atk_dcha;
	ld	12 (ix),#<(_gladis_atk_dcha)
	ld	13 (ix),#>(_gladis_atk_dcha)
;src/main.c:416: break;
	jp	00147$
;src/main.c:417: case 8:
00106$:
;src/main.c:418: s = gladis_atk_arriba;
	ld	12 (ix),#<(_gladis_atk_arriba)
	ld	13 (ix),#>(_gladis_atk_arriba)
;src/main.c:419: size[0] = 4;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x04
;src/main.c:420: break;
	jp	00147$
;src/main.c:421: case 2:
00107$:
;src/main.c:422: s = gladis_atk_abajo;
	ld	12 (ix),#<(_gladis_atk_abajo)
	ld	13 (ix),#>(_gladis_atk_abajo)
;src/main.c:423: size[0] = 4;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x04
;src/main.c:425: }
	jp	00147$
00146$:
;src/main.c:427: if(atk[0] < 20) atk[0] += 1;
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00110$
	ld	a,-10 (ix)
	inc	a
	ld	-19 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,-19 (ix)
	ld	(hl),a
	jr	00111$
00110$:
;src/main.c:428: else atk[0] = 20;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#0x14
00111$:
;src/main.c:429: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	-19 (ix),l
	ld	a,4 (ix)
	ld	-7 (ix),a
	ld	a,5 (ix)
	ld	-6 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00142$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-19 (ix), a
	sub	a, #0x4C
	jr	NC,00142$
;src/main.c:430: x[0] += 1;
	ld	a,-19 (ix)
	inc	a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),a
;src/main.c:431: dir[0] = 6;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x06
;src/main.c:432: size[0] = 4;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x04
;src/main.c:433: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
	jp	00147$
00142$:
;src/main.c:434: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00138$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00138$
;src/main.c:435: x[0] -= 1;
	add	a,#0xFF
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),a
;src/main.c:436: dir[0] = 4;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x04
;src/main.c:437: size[0] = 4;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x04
;src/main.c:438: s = gladis_quieto_izda;
	ld	12 (ix),#<(_gladis_quieto_izda)
	ld	13 (ix),#>(_gladis_quieto_izda)
	jp	00147$
00138$:
;src/main.c:439: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	-19 (ix),l
	ld	a,6 (ix)
	ld	-2 (ix),a
	ld	a,7 (ix)
	ld	-1 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00134$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0xB4
	jr	NC,00134$
;src/main.c:440: y[0] += 2;
	inc	d
	inc	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:441: dir[0] = 2;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x02
;src/main.c:442: size[0] = 4;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x04
;src/main.c:443: s = gladis_abajo;
	ld	12 (ix),#<(_gladis_abajo)
	ld	13 (ix),#>(_gladis_abajo)
	jp	00147$
00134$:
;src/main.c:444: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00130$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00130$
;src/main.c:445: y[0] -= 2;
	add	a,#0xFE
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/main.c:446: dir[0] = 8;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x08
;src/main.c:447: size[0] = 4;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x04
;src/main.c:448: s = gladis_arriba;
	ld	12 (ix),#<(_gladis_arriba)
	ld	13 (ix),#>(_gladis_arriba)
	jp	00147$
00130$:
;src/main.c:449: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0 && atk[0] == 20){
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00125$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00125$
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	sub	a, #0x14
	jp	NZ,00125$
;src/main.c:450: if(bullets[0] > 0){
	ld	a,16 (ix)
	ld	-5 (ix),a
	ld	a,17 (ix)
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-19 (ix), a
	or	a, a
	jp	Z,00118$
;src/main.c:451: u8 *spr = flecha_dcha,xs=2,ys=8,ox=x[0]+4;
	ld	-18 (ix),#<(_flecha_dcha)
	ld	-17 (ix),#>(_flecha_dcha)
	ld	-20 (ix),#0x02
	ld	-21 (ix),#0x08
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-7 (ix), a
	add	a, #0x04
	ld	-19 (ix),a
;src/main.c:452: switch(dir[0]){
	ld	l,-14 (ix)
	ld	h,-13 (ix)
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
;src/main.c:453: case 6: spr = flecha_dcha; xs=4;ys=4;ox=x[0]; break;
00112$:
	ld	-18 (ix),#<(_flecha_dcha)
	ld	-17 (ix),#>(_flecha_dcha)
	ld	-20 (ix),#0x04
	ld	-21 (ix),#0x04
	ld	a,-7 (ix)
	ld	-19 (ix),a
	jr	00116$
;src/main.c:454: case 4: spr = flecha_izda; xs=4;ys=4;ox=x[0]; break;
00113$:
	ld	-18 (ix),#<(_flecha_izda)
	ld	-17 (ix),#>(_flecha_izda)
	ld	-20 (ix),#0x04
	ld	-21 (ix),#0x04
	ld	a,-7 (ix)
	ld	-19 (ix),a
	jr	00116$
;src/main.c:455: case 2: spr = flecha_abajo; xs=2;ys=8;ox=x[0]; break;
00114$:
	ld	-18 (ix),#<(_flecha_abajo)
	ld	-17 (ix),#>(_flecha_abajo)
	ld	-20 (ix),#0x02
	ld	-21 (ix),#0x08
	ld	a,-7 (ix)
	ld	-19 (ix),a
	jr	00116$
;src/main.c:456: case 8: spr = flecha_arriba; xs=2;ys=8;ox=x[0]; break;
00115$:
	ld	-18 (ix),#<(_flecha_arriba)
	ld	-17 (ix),#>(_flecha_arriba)
	ld	-20 (ix),#0x02
	ld	-21 (ix),#0x08
	ld	a,-7 (ix)
	ld	-19 (ix),a
;src/main.c:457: }
00116$:
;src/main.c:458: atk[0] = 0;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#0x00
;src/main.c:459: object.x = ox;
	ld	hl,#_object+0
	ld	a,-19 (ix)
	ld	(hl),a
;src/main.c:460: object.y = y[0]+8;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	add	a, #0x08
	ld	(#(_object + 0x0001)),a
;src/main.c:461: object.x = object.x;
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	hl,#_object
	ld	(hl),d
;src/main.c:462: object.y = object.y;
	ld	(#(_object + 0x0001)),a
;src/main.c:463: object.sprite = spr;
	ld	hl,#(_object + 0x0004)
	ld	a,-18 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-17 (ix)
	ld	(hl),a
;src/main.c:464: object.vivo = 1;
	ld	hl,#(_object + 0x0006)
	ld	(hl),#0x01
;src/main.c:465: object.dir = dir[0];
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,(hl)
	ld	(#(_object + 0x0007)),a
;src/main.c:466: object.sizeX = xs;
	ld	hl,#(_object + 0x0008)
	ld	a,-20 (ix)
	ld	(hl),a
;src/main.c:467: object.sizeY = ys;
	ld	hl,#(_object + 0x0009)
	ld	a,-21 (ix)
	ld	(hl),a
;src/main.c:468: bullets[0]--;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-18 (ix), a
	ld	d, a
	dec	d
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),d
00118$:
;src/main.c:470: arrow[0]=1;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x01
	jr	00147$
00125$:
;src/main.c:472: switch(dir[0]){
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,(hl)
	ld	-18 (ix), a
	sub	a, #0x02
	jr	Z,00122$
	ld	a,-18 (ix)
	sub	a, #0x04
	jr	Z,00119$
	ld	a,-18 (ix)
	sub	a, #0x06
	jr	Z,00120$
	ld	a,-18 (ix)
	sub	a, #0x08
	jr	Z,00121$
	jr	00123$
;src/main.c:473: case 4:
00119$:
;src/main.c:474: s = gladis_quieto_izda;
	ld	12 (ix),#<(_gladis_quieto_izda)
	ld	13 (ix),#>(_gladis_quieto_izda)
;src/main.c:475: break;
	jr	00123$
;src/main.c:476: case 6:
00120$:
;src/main.c:477: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
;src/main.c:478: break;
	jr	00123$
;src/main.c:479: case 8:
00121$:
;src/main.c:480: s = gladis_arriba;
	ld	12 (ix),#<(_gladis_arriba)
	ld	13 (ix),#>(_gladis_arriba)
;src/main.c:481: break;
	jr	00123$
;src/main.c:482: case 2:
00122$:
;src/main.c:483: s = gladis_abajo;
	ld	12 (ix),#<(_gladis_abajo)
	ld	13 (ix),#>(_gladis_abajo)
;src/main.c:485: }
00123$:
;src/main.c:486: size[0] = 4;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x04
00147$:
;src/main.c:491: if(cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00150$
;src/main.c:492: arrow[0] = 0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
00150$:
;src/main.c:494: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00152$
;src/main.c:495: finish[0] = 1;
	ld	l,18 (ix)
	ld	h,19 (ix)
	ld	(hl),#0x01
00152$:
;src/main.c:498: return s;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:501: void moveObject(){
;	---------------------------------
; Function moveObject
; ---------------------------------
_moveObject::
;src/main.c:502: object.lx = object.x;
	ld	bc,#_object+0
	ld	a,(bc)
	ld	(#(_object + 0x0002)),a
;src/main.c:503: object.ly = object.y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_object + 0x0003)),a
;src/main.c:504: switch(object.dir){
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
;src/main.c:505: case 6: object.x += 1; break;
00101$:
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
;src/main.c:506: case 4: object.x -= 1; break;
00102$:
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
;src/main.c:507: case 2: object.y += 2; break;
00103$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	ret
;src/main.c:508: case 8: object.y -= 2; break;
00104$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/main.c:509: }
	ret
;src/main.c:515: void followPlayer(u8 px,u8 py,u8 *x,u8 *y,u8 seenX,u8 seenY,u8 room){
;	---------------------------------
; Function followPlayer
; ---------------------------------
_followPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-25
	add	hl,sp
	ld	sp,hl
;src/main.c:518: if(seenX < *x){
	ld	a,6 (ix)
	ld	-2 (ix),a
	ld	a,7 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
;src/main.c:520: if(scene[(y[0])/tileheight][(x[0]-1)/tilewidth] != 1){
	ld	a,8 (ix)
	ld	-5 (ix),a
	ld	a,9 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
;src/main.c:523: if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
	ld	a,-3 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-8 (ix),a
;src/main.c:531: if(scene[(y[0])/tileheight][(x[0]+tilewidth)/tilewidth] != 1){
	ld	a,-7 (ix)
	add	a, #0x07
	ld	-10 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/main.c:520: if(scene[(y[0])/tileheight][(x[0]-1)/tilewidth] != 1){
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	l,(hl)
;src/main.c:526: if(scene[(y[0]+tileheight)/tileheight][(x[0]+tilewidth)/tilewidth] != 1)
	ld	a,-7 (ix)
	add	a, #0x04
	ld	-12 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/main.c:520: if(scene[(y[0])/tileheight][(x[0]-1)/tilewidth] != 1){
	ld	a,l
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	h,a
;src/main.c:522: }else if(seenY < *y){
	ld	a,11 (ix)
	sub	a, l
	ld	a,#0x00
	rla
	ld	-13 (ix),a
;src/main.c:524: *y-=1;
	ld	a,l
	add	a,#0xFF
	ld	-14 (ix),a
;src/main.c:526: if(scene[(y[0]+tileheight)/tileheight][(x[0]+tilewidth)/tilewidth] != 1)
	ld	a,-11 (ix)
	rlca
	and	a,#0x01
	ld	-15 (ix),a
;src/main.c:527: *y+=1;
	ld	a,l
	inc	a
	ld	-16 (ix),a
;src/main.c:523: if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
	ld	-18 (ix),l
	ld	-17 (ix),#0x00
;src/main.c:520: if(scene[(y[0])/tileheight][(x[0]-1)/tilewidth] != 1){
	ld	c,h
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-20 (ix),l
	ld	-19 (ix),h
;src/main.c:523: if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
	ld	a,-18 (ix)
	add	a, #0x10
	ld	-22 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
	ld	a,-18 (ix)
	add	a, #0x1F
	ld	-24 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
	ld	a,-21 (ix)
	rlca
	and	a,#0x01
	ld	-25 (ix),a
;src/main.c:518: if(seenX < *x){
	ld	a,10 (ix)
	sub	a, -3 (ix)
	jp	NC,00132$
;src/main.c:520: if(scene[(y[0])/tileheight][(x[0]-1)/tilewidth] != 1){
	ld	bc,#_scene+0
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	pop	iy
	pop	hl
	add	iy, bc
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	dec	hl
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00136$
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	inc	de
	inc	de
00136$:
	sra	d
	rr	e
	sra	d
	rr	e
	add	iy, de
	ld	a, 0 (iy)
	dec	a
	jr	Z,00109$
;src/main.c:521: *x-=1;
	ld	d,-3 (ix)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
	jp	00134$
00109$:
;src/main.c:522: }else if(seenY < *y){
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00106$
;src/main.c:523: if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
	ld	e,-22 (ix)
	ld	d,-21 (ix)
	ld	a,-25 (ix)
	or	a, a
	jr	Z,00137$
	ld	e,-24 (ix)
	ld	d,-23 (ix)
00137$:
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
	add	hl,bc
	ld	e,-8 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00134$
;src/main.c:524: *y-=1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-14 (ix)
	ld	(hl),a
	jp	00134$
00106$:
;src/main.c:526: if(scene[(y[0]+tileheight)/tileheight][(x[0]+tilewidth)/tilewidth] != 1)
	ld	e,-22 (ix)
	ld	d,-21 (ix)
	ld	a,-25 (ix)
	or	a, a
	jr	Z,00138$
	ld	e,-24 (ix)
	ld	d,-23 (ix)
00138$:
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
	add	hl,bc
	ld	b,h
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	ld	a,-15 (ix)
	or	a, a
	jr	Z,00139$
	ld	e,-10 (ix)
	ld	d,-9 (ix)
00139$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	h, b
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00134$
;src/main.c:527: *y+=1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-16 (ix)
	ld	(hl),a
	jp	00134$
00132$:
;src/main.c:529: }else if(seenX > *x){
	ld	a,-3 (ix)
	sub	a, 10 (ix)
	jp	NC,00129$
;src/main.c:531: if(scene[(y[0])/tileheight][(x[0]+tilewidth)/tilewidth] != 1){
	ld	a,#<(_scene)
	add	a, -20 (ix)
	ld	-20 (ix),a
	ld	a,#>(_scene)
	adc	a, -19 (ix)
	ld	-19 (ix),a
	ld	a,-12 (ix)
	ld	-7 (ix),a
	ld	a,-11 (ix)
	ld	-6 (ix),a
	ld	a,-15 (ix)
	or	a, a
	jr	Z,00140$
	ld	a,-10 (ix)
	ld	-7 (ix),a
	ld	a,-9 (ix)
	ld	-6 (ix),a
00140$:
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-20 (ix)
	ld	d,-19 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00119$
;src/main.c:532: *x+=1;
	ld	a,-3 (ix)
	inc	a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
	jp	00134$
00119$:
;src/main.c:533: }else if(seenY < *y){
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00116$
;src/main.c:534: if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
	ld	c,-22 (ix)
	ld	b,-21 (ix)
	ld	a,-25 (ix)
	or	a, a
	jr	Z,00141$
	ld	c,-24 (ix)
	ld	b,-23 (ix)
00141$:
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
	ld	de,#_scene
	add	hl,de
	ld	e,-8 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00134$
;src/main.c:535: *y-=1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-14 (ix)
	ld	(hl),a
	jp	00134$
00116$:
;src/main.c:537: if(scene[(y[0]+tileheight)/tileheight][(x[0]+tilewidth)/tilewidth] != 1)
	ld	c,-22 (ix)
	ld	b,-21 (ix)
	ld	a,-25 (ix)
	or	a, a
	jr	Z,00142$
	ld	c,-24 (ix)
	ld	b,-23 (ix)
00142$:
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
	ld	de, #_scene
	add	hl, de
	ld	b,h
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	ld	a,-15 (ix)
	or	a, a
	jr	Z,00143$
	ld	e,-10 (ix)
	ld	d,-9 (ix)
00143$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	h, b
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00134$
;src/main.c:538: *y+=1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-16 (ix)
	ld	(hl),a
	jp	00134$
00129$:
;src/main.c:542: if(seenY < *y){
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00126$
;src/main.c:543: if(scene[(y[0]-1)/tileheight][(x[0])/tilewidth] != 1)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	dec	hl
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z,00144$
	ld	a,-18 (ix)
	add	a, #0x0E
	ld	c,a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	b,a
00144$:
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
	ld	de,#_scene
	add	hl,de
	ld	e,-8 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00134$
;src/main.c:544: *y-=1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-14 (ix)
	ld	(hl),a
	jr	00134$
00126$:
;src/main.c:546: if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
	ld	c,-22 (ix)
	ld	b,-21 (ix)
	ld	a,-25 (ix)
	or	a, a
	jr	Z,00145$
	ld	c,-24 (ix)
	ld	b,-23 (ix)
00145$:
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
	ld	de,#_scene
	add	hl,de
	ld	e,-8 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00134$
;src/main.c:547: *y+=1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-16 (ix)
	ld	(hl),a
00134$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:563: void patrol(u8 dir,u8 lx,u8 ly,u8 *x,u8 *y,u8 room){
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
;src/main.c:566: movement(dir,&x[0],&y[0]);
	ld	a,9 (ix)
	ld	-7 (ix),a
	ld	a,10 (ix)
	ld	-6 (ix),a
	ld	a,7 (ix)
	ld	-11 (ix),a
	ld	a,8 (ix)
	ld	-10 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_movement
	pop	af
	pop	af
	inc	sp
;src/main.c:568: if(scene[(y[0])/tileheight][(x[0])/tilewidth] != room
	ld	l,-7 (ix)
	ld	h,-6 (ix)
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
	ld	-9 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-8 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	c,(hl)
	ld	a,c
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix), a
	add	a, -9 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -8 (ix)
	ld	h,a
	ld	d,(hl)
	ld	a,11 (ix)
;src/main.c:569: || scene[(y[0])/tileheight][(x[0]+tilewidth-1)/tilewidth] != room
	sub	a,d
	jp	NZ,00101$
	ld	b,a
	ld	hl,#0x0003
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	a,-13 (ix)
	ld	-3 (ix),a
	ld	a,-12 (ix)
	ld	-2 (ix),a
	ld	a,-12 (ix)
	rlca
	and	a,#0x01
	ld	-4 (ix),a
	ld	hl,#0x0006
	add	hl,bc
	ex	(sp), hl
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00108$
	ld	a,-15 (ix)
	ld	-3 (ix),a
	ld	a,-14 (ix)
	ld	-2 (ix),a
00108$:
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jp	NZ,00101$
;src/main.c:570: || scene[(y[0]+tileheight-2)/tileheight][(x[0])/tilewidth] != room
	ld	e,-5 (ix)
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
	ld	-3 (ix),a
	ld	a,e
	add	a, #0x1D
	ld	-9 (ix),a
	ld	a,d
	adc	a, #0x00
	ld	-8 (ix),a
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00109$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
00109$:
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
	ld	a,11 (ix)
	sub	a,(hl)
	jr	NZ,00101$
;src/main.c:571: || scene[(y[0]+tileheight-2)/tileheight][(x[0]+tilewidth-1)/tilewidth] != room
	ld	a,-3 (ix)
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
	ld	-3 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-2 (ix),a
	pop	bc
	pop	de
	push	de
	push	bc
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00111$
	pop	de
	push	de
00111$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	add	hl,de
	ld	a,11 (ix)
	sub	a,(hl)
	jr	Z,00106$
00101$:
;src/main.c:573: *x=lx;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/main.c:574: *y=ly;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,6 (ix)
	ld	(hl),a
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:579: u8 vissionSensor(u8 x,u8 y,u8 px,u8 py){
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
;src/main.c:580: u8 following = 0;
	ld	-4 (ix),#0x00
;src/main.c:581: u8 cx = x/tilewidth;
	ld	a,4 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-5 (ix),a
;src/main.c:582: u8 cy = y/tilewidth;
	ld	a,5 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-6 (ix),a
;src/main.c:583: u8 pcx = px/tilewidth;
	ld	a,6 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-7 (ix),a
;src/main.c:584: u8 pcy = py/tilewidth;
	ld	a,7 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix),a
;src/main.c:587: for(i=0;i<3;i++){
	ld	-10 (ix),#0x00
00107$:
;src/main.c:588: lex = cx - i;
	ld	a,-5 (ix)
	sub	a, -10 (ix)
	ld	-2 (ix),a
;src/main.c:589: ley = cy - i;
	ld	a,-6 (ix)
	sub	a, -10 (ix)
	ld	-8 (ix),a
;src/main.c:590: mex = cx + i;
	ld	a,-5 (ix)
	add	a, -10 (ix)
	ld	-3 (ix),a
;src/main.c:591: mey = cy + i;
	ld	a,-6 (ix)
	add	a, -10 (ix)
	ld	-9 (ix), a
	ld	d, a
;src/main.c:592: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
	ld	a,-2 (ix)
	sub	a, -7 (ix)
	jr	Z,00101$
	ld	a,-8 (ix)
	sub	a, -1 (ix)
	jr	Z,00101$
	ld	a,-3 (ix)
	sub	a, -7 (ix)
	jr	Z,00101$
	ld	a,-1 (ix)
	sub	a, d
	jr	NZ,00108$
00101$:
;src/main.c:593: following = 1;
	ld	-4 (ix),#0x01
00108$:
;src/main.c:587: for(i=0;i<3;i++){
	inc	-10 (ix)
	ld	a,-10 (ix)
	sub	a, #0x03
	jr	C,00107$
;src/main.c:597: return following;
	ld	l,-4 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:602: void move(u8 *x,u8 *y,u8 lx, u8 ly,u8 *dir,u8 *s,u8 room,u8 px,u8 py,u8 *seenX,u8 *seenY,u8 *following,u8 *pursue){
;	---------------------------------
; Function move
; ---------------------------------
_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:604: dir[0] = chooseDirection();
	ld	e,10 (ix)
	ld	d,11 (ix)
;src/main.c:605: following[0] = detectPlayerRoom(px,py);
	ld	a,21 (ix)
	ld	-2 (ix),a
	ld	a,22 (ix)
	ld	-1 (ix),a
;src/main.c:607: *seenX = px;
	ld	c,17 (ix)
	ld	b,18 (ix)
;src/main.c:608: *seenY = py;
	ld	a,19 (ix)
	ld	-4 (ix),a
	ld	a,20 (ix)
	ld	-3 (ix),a
;src/main.c:603: if(temp > 20){
	ld	a,#0x14
	ld	iy,#_temp
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_temp
	sbc	a, 1 (iy)
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	P,00109$
;src/main.c:604: dir[0] = chooseDirection();
	push	bc
	push	de
	call	_chooseDirection
	ld	a,l
	pop	de
	pop	bc
	ld	(de),a
;src/main.c:605: following[0] = detectPlayerRoom(px,py);
	push	bc
	ld	h,16 (ix)
	ld	l,15 (ix)
	push	hl
	call	_detectPlayerRoom
	pop	af
	ld	d,l
	pop	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:606: if(following[0] == room){
	ld	a,14 (ix)
	sub	a, d
	jr	NZ,00102$
;src/main.c:607: *seenX = px;
	ld	a,15 (ix)
	ld	(bc),a
;src/main.c:608: *seenY = py;
	pop	hl
	push	hl
	ld	a,16 (ix)
	ld	(hl),a
00102$:
;src/main.c:610: temp = 0;
	ld	hl,#0x0000
	ld	(_temp),hl
	jp	00110$
00109$:
;src/main.c:612: if(temp%2 == 0)
	push	bc
	push	de
	ld	hl,#0x0002
	push	hl
	ld	hl,(_temp)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,h
	or	a,l
	jr	NZ,00110$
;src/main.c:613: if(following[0] == room)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
	ld	a,14 (ix)
	sub	a, -2 (ix)
	jr	NZ,00104$
;src/main.c:614: followPlayer(px,py,x,y,*seenX,*seenY,room);
	pop	hl
	push	hl
	ld	d,(hl)
	ld	a,(bc)
	ld	b,a
	ld	a,14 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	h,16 (ix)
	ld	l,15 (ix)
	push	hl
	call	_followPlayer
	ld	hl,#9
	add	hl,sp
	ld	sp,hl
	jr	00110$
00104$:
;src/main.c:616: patrol(dir[0],lx,ly,&x[0],&y[0],room);
	ld	c,6 (ix)
	ld	b,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	pop	iy
	pop	hl
	ld	a,(de)
	ld	d,a
	ld	a,14 (ix)
	push	af
	inc	sp
	push	bc
	push	iy
	ld	h,9 (ix)
	ld	l,8 (ix)
	push	hl
	push	de
	inc	sp
	call	_patrol
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
00110$:
;src/main.c:618: temp += 1;
	ld	hl, #_temp+0
	inc	(hl)
	jr	NZ,00134$
	ld	hl, #_temp+1
	inc	(hl)
00134$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:635: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-134
	add	hl,sp
;src/main.c:636: TPlayer p = {0,80,0,80,gladis_quieto_dcha,3,6,4,16,4,20,20,3};
	ld	sp, hl
	inc	hl
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002
	add	hl,sp
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	a,-18 (ix)
	add	a, #0x01
	ld	-68 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-67 (ix),a
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	ld	(hl),#0x50
	ld	a,-18 (ix)
	add	a, #0x02
	ld	-83 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-82 (ix),a
	ld	l,-83 (ix)
	ld	h,-82 (ix)
	ld	(hl),#0x00
	ld	a,-18 (ix)
	add	a, #0x03
	ld	-66 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-65 (ix),a
	ld	l,-66 (ix)
	ld	h,-65 (ix)
	ld	(hl),#0x50
	ld	a,-18 (ix)
	add	a, #0x04
	ld	-74 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-73 (ix),a
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	ld	(hl),#<(_gladis_quieto_dcha)
	inc	hl
	ld	(hl),#>(_gladis_quieto_dcha)
	ld	a,-18 (ix)
	add	a, #0x06
	ld	-85 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-84 (ix),a
	ld	l,-85 (ix)
	ld	h,-84 (ix)
	ld	(hl),#0x03
	ld	a,-18 (ix)
	add	a, #0x07
	ld	-47 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-46 (ix),a
	ld	l,-47 (ix)
	ld	h,-46 (ix)
	ld	(hl),#0x06
	ld	a,-18 (ix)
	add	a, #0x08
	ld	-49 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-48 (ix),a
	ld	l,-49 (ix)
	ld	h,-48 (ix)
	ld	(hl),#0x04
	ld	a,-18 (ix)
	add	a, #0x09
	ld	-87 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-86 (ix),a
	ld	l,-87 (ix)
	ld	h,-86 (ix)
	ld	(hl),#0x10
	ld	a,-18 (ix)
	add	a, #0x0A
	ld	-70 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-69 (ix),a
	ld	l,-70 (ix)
	ld	h,-69 (ix)
	ld	(hl),#0x04
	ld	a,-18 (ix)
	add	a, #0x0B
	ld	-72 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-71 (ix),a
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	ld	(hl),#0x14
	ld	a,-18 (ix)
	add	a, #0x0C
	ld	-6 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x14
	ld	a,-18 (ix)
	add	a, #0x0D
	ld	-8 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x03
	ld	a,-18 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-18 (ix)
	add	a, #0x0F
	ld	l,a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/main.c:637: TEnemy e = {52,80,52,80,52,80,chacho_dcha,3,2,3,3,0,0,0};
	ld	hl,#0x0012
	add	hl,sp
	ld	(hl),#0x34
	ld	hl,#0x0012
	add	hl,sp
	ld	-62 (ix),l
	ld	-61 (ix),h
	ld	a,-62 (ix)
	add	a, #0x01
	ld	-64 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-63 (ix),a
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	(hl),#0x50
	ld	a,-62 (ix)
	add	a, #0x02
	ld	-36 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-35 (ix),a
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	(hl),#0x34
	ld	a,-62 (ix)
	add	a, #0x03
	ld	-38 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-37 (ix),a
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	(hl),#0x50
	ld	a,-62 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x34
	ld	a,-62 (ix)
	add	a, #0x05
	ld	l,a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x50
	ld	a,-62 (ix)
	add	a, #0x06
	ld	-2 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_chacho_dcha)
	inc	hl
	ld	(hl),#>(_chacho_dcha)
	ld	a,-62 (ix)
	add	a, #0x08
	ld	-4 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
	ld	a,-62 (ix)
	add	a, #0x09
	ld	-28 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-27 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x02
	ld	a,-62 (ix)
	add	a, #0x0A
	ld	l,a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x03
	ld	a,-62 (ix)
	add	a, #0x0B
	ld	-30 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x03
	ld	a,-62 (ix)
	add	a, #0x0C
	ld	e,a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
	ld	a,-62 (ix)
	add	a, #0x0D
	ld	-32 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-31 (ix),a
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	(hl),#0x00
	ld	a,-62 (ix)
	add	a, #0x0E
	ld	-34 (ix),a
	ld	a,-61 (ix)
	adc	a, #0x00
	ld	-33 (ix),a
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),#0x00
;src/main.c:638: TNivel n = {0,0,0};
	ld	hl,#0x0021
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0021
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0001
	add	hl,bc
	ld	-40 (ix),l
	ld	-39 (ix),h
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	(hl),#0x00
	inc	bc
	inc	bc
	ld	-42 (ix),c
	ld	-41 (ix),b
	ld	l,-42 (ix)
	ld	h,-41 (ix)
	ld	(hl),#0x00
;src/main.c:644: u8 finish = 0,i=1,arrow=0,following = 0;
	ld	iy,#1
	add	iy,sp
	ld	0 (iy),#0x00
	ld	-98 (ix),#0x00
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),#0x00
;src/main.c:646: u8 bound = 0;
	ld	-43 (ix),#0x00
;src/main.c:647: temp = 0;
	ld	hl,#0x0000
	ld	(_temp),hl
;src/main.c:649: cpct_clearScreen(0);
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
;src/main.c:654: while (1){
	ld	-45 (ix),e
	ld	-44 (ix),d
	ld	a,-64 (ix)
	ld	-10 (ix),a
	ld	a,-63 (ix)
	ld	-9 (ix),a
	ld	a,-62 (ix)
	ld	-12 (ix),a
	ld	a,-61 (ix)
	ld	-11 (ix),a
	ld	a,-8 (ix)
	ld	-14 (ix),a
	ld	a,-7 (ix)
	ld	-13 (ix),a
	ld	a,-49 (ix)
	ld	-16 (ix),a
	ld	a,-48 (ix)
	ld	-15 (ix),a
	ld	a,-72 (ix)
	ld	-20 (ix),a
	ld	a,-71 (ix)
	ld	-19 (ix),a
	ld	a,-68 (ix)
	ld	-22 (ix),a
	ld	a,-67 (ix)
	ld	-21 (ix),a
	ld	a,-18 (ix)
	ld	-24 (ix),a
	ld	a,-17 (ix)
	ld	-23 (ix),a
	ld	a,-42 (ix)
	ld	-26 (ix),a
	ld	a,-41 (ix)
	ld	-25 (ix),a
	ld	a,-40 (ix)
	ld	-89 (ix),a
	ld	a,-39 (ix)
	ld	-88 (ix),a
	ld	a,-8 (ix)
	ld	-91 (ix),a
	ld	a,-7 (ix)
	ld	-90 (ix),a
	ld	a,-85 (ix)
	ld	-93 (ix),a
	ld	a,-84 (ix)
	ld	-92 (ix),a
	ld	a,-68 (ix)
	ld	-95 (ix),a
	ld	a,-67 (ix)
	ld	-94 (ix),a
	ld	a,-18 (ix)
	ld	-97 (ix),a
	ld	a,-17 (ix)
	ld	-96 (ix),a
00144$:
;src/main.c:657: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:660: erasePlayer(p.lx,p.ly,0);
	ld	l,-66 (ix)
	ld	h,-65 (ix)
	ld	b,(hl)
	ld	l,-83 (ix)
	ld	h,-82 (ix)
	ld	d,(hl)
	xor	a, a
	push	af
	inc	sp
	ld	c, d
	push	bc
	call	_erasePlayer
	pop	af
	inc	sp
;src/main.c:661: erasePlayer(e.lx,e.ly,0);
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	b,(hl)
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	d,(hl)
	xor	a, a
	push	af
	inc	sp
	ld	c, d
	push	bc
	call	_erasePlayer
	pop	af
	inc	sp
;src/main.c:662: if(arrow == 1){
	ld	a,-98 (ix)
	dec	a
	jr	NZ,00108$
;src/main.c:663: if(object.dir == 4 || object.dir == 6)
	ld	hl, #(_object + 0x0007) + 0
	ld	e,(hl)
;src/main.c:664: erasePlayer(object.lx,object.ly,2);
	ld	hl, #(_object + 0x0003) + 0
	ld	b,(hl)
	ld	hl, #(_object + 0x0002) + 0
	ld	d,(hl)
;src/main.c:663: if(object.dir == 4 || object.dir == 6)
	ld	a,e
	cp	a,#0x04
	jr	Z,00101$
	sub	a, #0x06
	jr	NZ,00102$
00101$:
;src/main.c:664: erasePlayer(object.lx,object.ly,2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	c, d
	push	bc
	call	_erasePlayer
	pop	af
	inc	sp
	jr	00103$
00102$:
;src/main.c:666: erasePlayer(object.lx,object.ly,1);
	ld	a,#0x01
	push	af
	inc	sp
	ld	c, d
	push	bc
	call	_erasePlayer
	pop	af
	inc	sp
00103$:
;src/main.c:667: if(bound == 1) arrow = 0;
	ld	a,-43 (ix)
	dec	a
	jr	NZ,00108$
	ld	-98 (ix),#0x00
00108$:
;src/main.c:671: drawPickUps(n.corazon,n.bullet);
	ld	l,-42 (ix)
	ld	h,-41 (ix)
	ld	b,(hl)
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	c, (hl)
	push	bc
	call	_drawPickUps
	pop	af
;src/main.c:674: drawPlayer(p.x,p.y,p.sprite,p.life,0);
	ld	l,-85 (ix)
	ld	h,-84 (ix)
	ld	b,(hl)
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	ld	a,(hl)
	ld	-50 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	d,(hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l, e
	ld	h, c
	push	hl
	ld	a,-50 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:675: if(e.life > 0) drawPlayer(e.x,e.y,e.sprite,e.life,0);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	ld	a,c
	or	a, a
	jr	Z,00110$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	a,(hl)
	ld	-50 (ix),a
	ld	l,-62 (ix)
	ld	h,-61 (ix)
	ld	b,(hl)
	xor	a, a
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	de
	ld	a,-50 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_drawPlayer
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00110$:
;src/main.c:677: if(arrow == 1){
	ld	a,-98 (ix)
	dec	a
	jr	NZ,00119$
;src/main.c:678: if(object.dir == 4 || object.dir == 6)
	ld	hl, #(_object + 0x0007) + 0
	ld	h,(hl)
	ld	a,h
	cp	a,#0x04
	jr	Z,00114$
	sub	a, #0x06
	jr	NZ,00115$
00114$:
;src/main.c:679: drawPlayer(object.x,object.y,object.sprite,object.vivo,2);
	ld	hl, #(_object + 0x0006) + 0
	ld	e,(hl)
	ld	bc, (#(_object + 0x0004) + 0)
	ld	a,(#(_object + 0x0001) + 0)
	ld	-50 (ix),a
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	a,#0x02
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	bc
	ld	a,-50 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	jr	00119$
00115$:
;src/main.c:680: else if(object.dir == 2 || object.dir == 8)
	ld	a,h
	cp	a,#0x02
	jr	Z,00111$
	sub	a, #0x08
	jr	NZ,00119$
00111$:
;src/main.c:681: drawPlayer(object.x,object.y,object.sprite,object.vivo,1);
	ld	hl, #(_object + 0x0006) + 0
	ld	e,(hl)
	ld	bc, (#(_object + 0x0004) + 0)
	ld	a,(#(_object + 0x0001) + 0)
	ld	-50 (ix),a
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	a,#0x01
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	bc
	ld	a,-50 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00119$:
;src/main.c:686: drawVida(p.life);
	ld	l,-85 (ix)
	ld	h,-84 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawVida
	inc	sp
;src/main.c:687: drawBullets(p.bullets);
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	h,(hl)
	push	hl
	inc	sp
	call	_drawBullets
	inc	sp
;src/main.c:690: if(p.atk < 20) drawFatiga(p.atk,2);
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x14
	jr	NC,00124$
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00125$
00124$:
;src/main.c:691: else if(p.atk > 20) drawFatiga(p.atk,1);
	ld	a,#0x14
	sub	a, d
	jr	NC,00121$
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00125$
00121$:
;src/main.c:692: else drawFatiga(p.atk,0);
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
00125$:
;src/main.c:695: p.lx = p.x;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	l,-83 (ix)
	ld	h,-82 (ix)
	ld	(hl),a
;src/main.c:696: p.ly = p.y;
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	ld	a,(hl)
	ld	l,-66 (ix)
	ld	h,-65 (ix)
	ld	(hl),a
;src/main.c:697: e.lx = e.x;
	ld	l,-62 (ix)
	ld	h,-61 (ix)
	ld	a,(hl)
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	(hl),a
;src/main.c:698: e.ly = e.y;
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	a,(hl)
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	(hl),a
;src/main.c:699: p.latk = p.atk;
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/main.c:700: p.lsize = p.sizeX;
	ld	l,-49 (ix)
	ld	h,-48 (ix)
	ld	a,(hl)
	ld	l,-70 (ix)
	ld	h,-69 (ix)
	ld	(hl),a
;src/main.c:703: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:704: p.sprite = checkKeyboard(&p.x,&p.y,&p.atk,&p.dir,p.sprite,&p.sizeX,&p.bullets,&finish,&arrow);
	ld	hl,#0x0024
	add	hl,sp
	ld	c, l
	ld	b, h
	ld	hl,#0x0001
	add	hl,sp
	ld	-52 (ix),l
	ld	-51 (ix),h
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	ld	a,-16 (ix)
	ld	-54 (ix),a
	ld	a,-15 (ix)
	ld	-53 (ix),a
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	ld	a,(hl)
	ld	-56 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-55 (ix),a
	ld	a,-47 (ix)
	ld	-58 (ix),a
	ld	a,-46 (ix)
	ld	-57 (ix),a
	ld	a,-20 (ix)
	ld	-60 (ix),a
	ld	a,-19 (ix)
	ld	-59 (ix),a
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	a,-24 (ix)
	ld	-76 (ix),a
	ld	a,-23 (ix)
	ld	-75 (ix),a
	push	bc
	ld	c,-52 (ix)
	ld	b,-51 (ix)
	push	bc
	push	de
	ld	c,-54 (ix)
	ld	b,-53 (ix)
	push	bc
	ld	c,-56 (ix)
	ld	b,-55 (ix)
	push	bc
	ld	c,-58 (ix)
	ld	b,-57 (ix)
	push	bc
	ld	c,-60 (ix)
	ld	b,-59 (ix)
	push	bc
	push	hl
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	push	hl
	call	_checkKeyboard
	ld	iy,#18
	add	iy,sp
	ld	sp,iy
	ld	d,l
	ld	e,h
	ld	l,-74 (ix)
	ld	h,-73 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),e
;src/main.c:705: checkBoundsCollisions(&p.x,&p.y,p.lx,p.ly,p.sizeX,p.sizeY,&p.life,&p.bullets,&n.corazon,&n.bullet);
	ld	c,-26 (ix)
	ld	b,-25 (ix)
	ld	e,-89 (ix)
	ld	d,-88 (ix)
	ld	a,-91 (ix)
	ld	-76 (ix),a
	ld	a,-90 (ix)
	ld	-75 (ix),a
	ld	a,-93 (ix)
	ld	-60 (ix),a
	ld	a,-92 (ix)
	ld	-59 (ix),a
	ld	l,-87 (ix)
	ld	h,-86 (ix)
	ld	a,(hl)
	ld	-58 (ix),a
	ld	l,-49 (ix)
	ld	h,-48 (ix)
	ld	a,(hl)
	ld	-56 (ix),a
	ld	l,-66 (ix)
	ld	h,-65 (ix)
	ld	a,(hl)
	ld	-54 (ix),a
	ld	l,-83 (ix)
	ld	h,-82 (ix)
	ld	a,(hl)
	ld	-52 (ix),a
	ld	a,-95 (ix)
	ld	-78 (ix),a
	ld	a,-94 (ix)
	ld	-77 (ix),a
	push	hl
	ld	l,-97 (ix)
	ld	h,-96 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	push	de
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	push	hl
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	push	hl
	ld	h,-58 (ix)
	ld	l,-56 (ix)
	push	hl
	ld	h,-54 (ix)
	ld	l,-52 (ix)
	push	hl
	ld	l,-78 (ix)
	ld	h,-77 (ix)
	push	hl
	push	iy
	call	_checkBoundsCollisions
	ld	hl,#16
	add	hl,sp
	ld	sp,hl
;src/main.c:706: if(e.life > 0)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00127$
;src/main.c:707: move(&e.x,&e.y,e.lx,e.ly,&e.dir,e.sprite,e.room,p.x,p.y,&e.seenX,&e.seenY,&following,&e.pursue);
	ld	a,-34 (ix)
	ld	-78 (ix),a
	ld	a,-33 (ix)
	ld	-77 (ix),a
	ld	iy,#0x0000
	add	iy,sp
	ld	a,-32 (ix)
	ld	-76 (ix),a
	ld	a,-31 (ix)
	ld	-75 (ix),a
	ld	a,-45 (ix)
	ld	-60 (ix),a
	ld	a,-44 (ix)
	ld	-59 (ix),a
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	ld	a,(hl)
	ld	-58 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-56 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	a,(hl)
	ld	-54 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-52 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-51 (ix),a
	ld	a,-28 (ix)
	ld	-80 (ix),a
	ld	a,-27 (ix)
	ld	-79 (ix),a
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	a,(hl)
	ld	-50 (ix),a
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	a,(hl)
	ld	-81 (ix),a
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	ld	c,-12 (ix)
	ld	b,-11 (ix)
	ld	l,-78 (ix)
	ld	h,-77 (ix)
	push	hl
	push	iy
	ld	l,-76 (ix)
	ld	h,-75 (ix)
	push	hl
	ld	l,-60 (ix)
	ld	h,-59 (ix)
	push	hl
	ld	h,-58 (ix)
	ld	l,-56 (ix)
	push	hl
	ld	a,-54 (ix)
	push	af
	inc	sp
	ld	l,-52 (ix)
	ld	h,-51 (ix)
	push	hl
	ld	l,-80 (ix)
	ld	h,-79 (ix)
	push	hl
	ld	h,-50 (ix)
	ld	l,-81 (ix)
	push	hl
	push	de
	push	bc
	call	_move
	ld	hl,#21
	add	hl,sp
	ld	sp,hl
00127$:
;src/main.c:709: if(e.life > 0)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	or	a, a
	jp	Z,00136$
;src/main.c:710: if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 2){
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	ld	a,(hl)
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	c,(hl)
	ld	l,-62 (ix)
	ld	h,-61 (ix)
	ld	b,(hl)
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	ld	e,(hl)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
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
	jr	NZ,00133$
;src/main.c:711: p.x = 0;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x00
;src/main.c:712: p.y = 80;
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	ld	(hl),#0x50
;src/main.c:713: p.life -= 1;
	ld	l,-85 (ix)
	ld	h,-84 (ix)
	ld	a,(hl)
	add	a,#0xFF
	ld	l,-85 (ix)
	ld	h,-84 (ix)
	ld	(hl),a
;src/main.c:714: if(p.life == 0){
	or	a, a
	jr	NZ,00136$
;src/main.c:715: gameOver();
	call	_gameOver
;src/main.c:716: break;
	jp	00146$
00133$:
;src/main.c:718: }else if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 1){
	ld	l,-72 (ix)
	ld	h,-71 (ix)
	ld	a,(hl)
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	c,(hl)
	ld	l,-62 (ix)
	ld	h,-61 (ix)
	ld	b,(hl)
	ld	l,-68 (ix)
	ld	h,-67 (ix)
	ld	e,(hl)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
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
	jr	NZ,00136$
;src/main.c:719: e.life =0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
00136$:
;src/main.c:723: if(arrow == 1){
	ld	a,-98 (ix)
	dec	a
	jp	NZ,00140$
;src/main.c:724: moveObject();
	call	_moveObject
;src/main.c:725: bound = checkBoundsCollisions(&object.x,&object.y,object.lx,object.ly,object.sizeX,object.sizeY,0,0,0,0);
	ld	hl, #_object + 9
	ld	e,(hl)
	ld	hl, #_object + 8
	ld	c,(hl)
	ld	a,(#(_object + 0x0003) + 0)
	ld	-81 (ix),a
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
	ld	a,-81 (ix)
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
	ld	-43 (ix),l
;src/main.c:726: if(checkCollisions(object.x, object.y, e.x, e.y, 21) == 1){
	ld	l,-64 (ix)
	ld	h,-63 (ix)
	ld	c,(hl)
	ld	l,-62 (ix)
	ld	h,-61 (ix)
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
	jr	NZ,00140$
;src/main.c:727: e.life = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:728: object.vivo = 0;
	ld	hl,#(_object + 0x0006)
	ld	(hl),#0x00
00140$:
;src/main.c:732: if(finish == 1) return;
	ld	hl, #1+0
	add	hl, sp
	ld	a, (hl)
	dec	a
	jp	NZ,00144$
00146$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:739: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:741: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:742: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:743: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:745: while (1){
00104$:
;src/main.c:747: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:751: if(cpct_isKeyPressed(Key_Esc)) {
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:753: return;
	ret
___str_5:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:763: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:767: init();
	call	_init
;src/main.c:770: while(1){
00106$:
;src/main.c:771: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:772: switch(x){
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
;src/main.c:773: case 0: return;break;
;src/main.c:774: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:775: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:776: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
