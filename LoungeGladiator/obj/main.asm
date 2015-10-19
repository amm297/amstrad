;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Mon Oct 19 11:19:15 2015
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
	.globl _moveObject
	.globl _checkKeyboard
	.globl _checkBoundsCollisions
	.globl _checkArrowCollisions
	.globl _checkBoundsCollisionsEnemy
	.globl _drawBullets
	.globl _drawVida
	.globl _drawPickUps
	.globl _drawFatiga
	.globl _drawPlayers
	.globl _erasePlayers
	.globl _erasePlayer
	.globl _drawPlayer
	.globl _drawMap
	.globl _menu
	.globl _gameOver
	.globl _initEnemies
	.globl _initPlayer
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
	.globl _enemies
	.globl _player
	.globl _object
	.globl _path
	.globl _map
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
_map::
	.ds 1
_path::
	.ds 1
_object::
	.ds 10
_player::
	.ds 16
_enemies::
	.ds 48
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
	.db #0x00	; 0
	.db #0x05	; 5
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
	.db #0x02	; 2
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
;src/main.c:42: void initPlayer(){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;src/main.c:43: u8 *sprite = gladis_quieto_dcha;
;src/main.c:44: player.x = 0;
	ld	hl,#_player+0
	ld	(hl),#0x00
;src/main.c:45: player.y = 80;
	ld	hl,#_player + 1
	ld	(hl),#0x50
;src/main.c:46: player.lx = 0;
	ld	hl,#_player + 2
	ld	(hl),#0x00
;src/main.c:47: player.ly = 80;
	ld	hl,#_player + 3
	ld	(hl),#0x50
;src/main.c:48: player.sprite = sprite;
	ld	hl,#_gladis_quieto_dcha
	ld	((_player + 0x0004)), hl
;src/main.c:49: player.life = 3;
	ld	hl,#_player + 6
	ld	(hl),#0x03
;src/main.c:50: player.dir = 6;
	ld	hl,#_player + 7
	ld	(hl),#0x06
;src/main.c:51: player.sizeX = 4;
	ld	hl,#_player + 8
	ld	(hl),#0x04
;src/main.c:52: player.sizeY = 16;
	ld	hl,#_player + 9
	ld	(hl),#0x10
;src/main.c:53: player.lsize = 4;
	ld	hl,#_player + 10
	ld	(hl),#0x04
;src/main.c:54: player.atk = 20;
	ld	hl,#_player + 11
	ld	(hl),#0x14
;src/main.c:55: player.latk = 20;
	ld	hl,#_player + 12
	ld	(hl),#0x14
;src/main.c:56: player.bullets = 3;
	ld	hl,#_player + 13
	ld	(hl),#0x03
;src/main.c:57: player.type = 0;
	ld	hl,#_player + 14
	ld	(hl),#0x00
;src/main.c:58: player.room = 0;
	ld	hl,#_player + 15
	ld	(hl),#0x00
	ret
;src/main.c:61: void initEnemies(){
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
;src/main.c:62: u8 *sprite = chacho_dcha;
	ld	de,#_chacho_dcha
;src/main.c:63: enemies[0].x = 52;
	ld	hl,#_enemies+0
	ld	(hl),#0x34
;src/main.c:64: enemies[0].y = 80;
	ld	hl,#_enemies + 1
	ld	(hl),#0x50
;src/main.c:65: enemies[0].lx = 52;
	ld	hl,#_enemies + 2
	ld	(hl),#0x34
;src/main.c:66: enemies[0].ly = 80;
	ld	hl,#_enemies + 3
	ld	(hl),#0x50
;src/main.c:67: enemies[0].sprite = sprite;
	ld	((_enemies + 0x0004)), de
;src/main.c:68: enemies[0].life = 1;
	ld	hl,#_enemies + 6
	ld	(hl),#0x01
;src/main.c:69: enemies[0].dir = 6;
	ld	hl,#_enemies + 7
	ld	(hl),#0x06
;src/main.c:70: enemies[0].sizeX = 4;
	ld	hl,#_enemies + 8
	ld	(hl),#0x04
;src/main.c:71: enemies[0].sizeY = 16;
	ld	hl,#_enemies + 9
	ld	(hl),#0x10
;src/main.c:72: enemies[0].lsize = 4;
	ld	hl,#_enemies + 10
	ld	(hl),#0x04
;src/main.c:73: enemies[0].atk = 0;
	ld	hl,#_enemies + 11
	ld	(hl),#0x00
;src/main.c:74: enemies[0].latk = 0;
	ld	hl,#_enemies + 12
	ld	(hl),#0x00
;src/main.c:75: enemies[0].bullets = 0;
	ld	hl,#_enemies + 13
	ld	(hl),#0x00
;src/main.c:76: enemies[0].type = 1;
	ld	hl,#_enemies + 14
	ld	(hl),#0x01
;src/main.c:77: enemies[0].room = 3;
	ld	hl,#_enemies + 15
	ld	(hl),#0x03
;src/main.c:79: enemies[1].x = 40;
	ld	hl,#_enemies + 16
	ld	(hl),#0x28
;src/main.c:80: enemies[1].y = 64;
	ld	hl,#_enemies + 17
	ld	(hl),#0x40
;src/main.c:81: enemies[1].lx = 40;
	ld	hl,#_enemies + 18
	ld	(hl),#0x28
;src/main.c:82: enemies[1].ly = 64;
	ld	hl,#_enemies + 19
	ld	(hl),#0x40
;src/main.c:83: enemies[1].sprite = sprite;
	ld	((_enemies + 0x0014)), de
;src/main.c:84: enemies[1].life = 1;
	ld	hl,#_enemies + 22
	ld	(hl),#0x01
;src/main.c:85: enemies[1].dir = 6;
	ld	hl,#_enemies + 23
	ld	(hl),#0x06
;src/main.c:86: enemies[1].sizeX = 4;
	ld	hl,#_enemies + 24
	ld	(hl),#0x04
;src/main.c:87: enemies[1].sizeY = 16;
	ld	hl,#_enemies + 25
	ld	(hl),#0x10
;src/main.c:88: enemies[1].lsize = 4;
	ld	hl,#_enemies + 26
	ld	(hl),#0x04
;src/main.c:89: enemies[1].atk = 0;
	ld	hl,#_enemies + 27
	ld	(hl),#0x00
;src/main.c:90: enemies[1].latk = 0;
	ld	hl,#_enemies + 28
	ld	(hl),#0x00
;src/main.c:91: enemies[1].bullets = 1;
	ld	hl,#_enemies + 29
	ld	(hl),#0x01
;src/main.c:92: enemies[1].type = 2;
	ld	hl,#_enemies + 30
	ld	(hl),#0x02
;src/main.c:93: enemies[1].room = 0;
	ld	hl,#_enemies + 31
	ld	(hl),#0x00
;src/main.c:95: enemies[2].x = 16;
	ld	hl,#_enemies + 32
	ld	(hl),#0x10
;src/main.c:96: enemies[2].y = 96;
	ld	hl,#_enemies + 33
	ld	(hl),#0x60
;src/main.c:97: enemies[2].lx = 16;
	ld	hl,#_enemies + 34
	ld	(hl),#0x10
;src/main.c:98: enemies[2].ly = 96;
	ld	hl,#_enemies + 35
	ld	(hl),#0x60
;src/main.c:99: enemies[2].sprite = sprite;
	ld	((_enemies + 0x0024)), de
;src/main.c:100: enemies[2].life = 1;
	ld	hl,#_enemies + 38
	ld	(hl),#0x01
;src/main.c:101: enemies[2].dir = 6;
	ld	hl,#_enemies + 39
	ld	(hl),#0x06
;src/main.c:102: enemies[2].sizeX = 4;
	ld	hl,#_enemies + 40
	ld	(hl),#0x04
;src/main.c:103: enemies[2].sizeY = 16;
	ld	hl,#_enemies + 41
	ld	(hl),#0x10
;src/main.c:104: enemies[2].lsize = 4;
	ld	hl,#_enemies + 42
	ld	(hl),#0x04
;src/main.c:105: enemies[2].atk = 0;
	ld	hl,#_enemies + 43
	ld	(hl),#0x00
;src/main.c:106: enemies[2].latk = 0;
	ld	hl,#_enemies + 44
	ld	(hl),#0x00
;src/main.c:107: enemies[2].bullets = 0;
	ld	hl,#_enemies + 45
	ld	(hl),#0x00
;src/main.c:108: enemies[2].type = 1;
	ld	hl,#_enemies + 46
	ld	(hl),#0x01
;src/main.c:109: enemies[2].room = 3;
	ld	hl,#_enemies + 47
	ld	(hl),#0x03
	ret
;src/main.c:114: void gameOver(){
;	---------------------------------
; Function gameOver
; ---------------------------------
_gameOver::
;src/main.c:116: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:117: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:118: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:123: int menu(){
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
;src/main.c:125: int init = 50;
	ld	-4 (ix),#0x32
	ld	-3 (ix),#0x00
;src/main.c:126: int pushed =0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:127: int cont =0;
	ld	de,#0x0000
;src/main.c:128: cpct_clearScreen(0);
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
;src/main.c:131: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:135: cpct_drawStringM0("Nueva Partida",memptr,1,0);
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
;src/main.c:138: cpct_drawStringM0("Creditos",memptr,1,0);
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
;src/main.c:131: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:141: cpct_drawStringM0("Salir",memptr,1,0);
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
;src/main.c:147: while(1){
00118$:
;src/main.c:149: cpct_scanKeyboard();
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
;src/main.c:151: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:152: pushed ++;
	inc	-6 (ix)
	jr	NZ,00163$
	inc	-5 (ix)
00163$:
;src/main.c:153: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:155: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
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
;src/main.c:156: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:157: pushed --;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
;src/main.c:158: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:161: switch (pushed){
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
;src/main.c:162: case 0: init = 50;break;
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
;src/main.c:163: case 1: init = 70;break;
00108$:
	ld	-4 (ix),#0x46
	ld	-3 (ix),#0x00
	jr	00110$
;src/main.c:164: case 2: init = 90;break;
00109$:
	ld	-4 (ix),#0x5A
	ld	-3 (ix),#0x00
;src/main.c:165: }
00110$:
;src/main.c:166: memptr = cpct_getScreenPtr(VMEM,15,init);
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
;src/main.c:131: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:167: cpct_drawSolidBox(memptr, 3, 2, 8);
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
;src/main.c:169: switch (pushed){
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
;src/main.c:170: case 0: return 1;break;
	jp	(hl)
00167$:
	jr	00111$
	jr	00112$
	jr	00113$
00111$:
	ld	hl,#0x0001
	jr	00120$
;src/main.c:171: case 1: return 2;break;
00112$:
	ld	hl,#0x0002
	jr	00120$
;src/main.c:172: case 2: return 0;break;
00113$:
	ld	hl,#0x0000
	jr	00120$
;src/main.c:173: }
00116$:
;src/main.c:175: cont++;
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
;src/main.c:190: void drawMap(u8 t){
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
;src/main.c:194: if(t == 1){
	ld	a,4 (ix)
	dec	a
	jp	NZ,00104$
;src/main.c:195: for(y=0;y<height;y++){
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;src/main.c:196: for(x=0;x<width;x++){
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
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
00115$:
;src/main.c:197: scene[y][x] = mapa1[y][x];
	ld	a,-8 (ix)
	add	a, -14 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, -13 (ix)
	ld	-5 (ix),a
	ld	a,-10 (ix)
	add	a, -14 (ix)
	ld	-2 (ix),a
	ld	a,-9 (ix)
	adc	a, -13 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/main.c:196: for(x=0;x<width;x++){
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
;src/main.c:195: for(y=0;y<height;y++){
	ld	a,-4 (ix)
	add	a, #0x14
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
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
;src/main.c:202: if(t == 2){
	ld	a,4 (ix)
	sub	a, #0x02
	jr	NZ,00141$
;src/main.c:203: for(y=0;y<height;y++){
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	de,#0x0000
;src/main.c:204: for(x=0;x<width;x++){
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
;src/main.c:205: scene[y][x] = mapa2[y][x];
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
;src/main.c:204: for(x=0;x<width;x++){
	inc	bc
	ld	a,c
	sub	a, #0x14
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00119$
;src/main.c:203: for(y=0;y<height;y++){
	ld	hl,#0x0014
	add	hl,de
	ex	de,hl
	inc	-12 (ix)
	jr	NZ,00193$
	inc	-11 (ix)
00193$:
	ld	a,-12 (ix)
	sub	a, #0x0C
	ld	a,-11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00134$
;src/main.c:210: for(posY=0; posY<height;posY++){
00141$:
	ld	hl,#0x0000
	ex	(sp), hl
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
;src/main.c:211: for(posX=0; posX<width;posX++){
00139$:
	ld	a,#<(_scene)
	add	a, -6 (ix)
	ld	-10 (ix),a
	ld	a,#>(_scene)
	adc	a, -5 (ix)
	ld	-9 (ix),a
	ld	-16 (ix),#0x00
	ld	-15 (ix),#0x00
00123$:
;src/main.c:212: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
	ld	a,-18 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-16 (ix)
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
;src/main.c:213: if(scene[posY][posX] == 1){
	ld	a,-10 (ix)
	add	a, -16 (ix)
	ld	l,a
	ld	a,-9 (ix)
	adc	a, -15 (ix)
	ld	h,a
	ld	h,(hl)
;src/main.c:214: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
	ld	-8 (ix),e
	ld	-7 (ix),d
;src/main.c:213: if(scene[posY][posX] == 1){
	dec	h
	jr	NZ,00110$
;src/main.c:214: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
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
;src/main.c:216: if(scene[posY][posX] == 9){
	ld	a,#<(_scene)
	add	a, -2 (ix)
	ld	l,a
	ld	a,#>(_scene)
	adc	a, -1 (ix)
	ld	h,a
	ld	e,-16 (ix)
	ld	d,-15 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00124$
;src/main.c:217: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
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
;src/main.c:211: for(posX=0; posX<width;posX++){
	inc	-16 (ix)
	jr	NZ,00198$
	inc	-15 (ix)
00198$:
	ld	a,-16 (ix)
	sub	a, #0x14
	ld	a,-15 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00123$
;src/main.c:210: for(posY=0; posY<height;posY++){
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
	inc	-18 (ix)
	jr	NZ,00199$
	inc	-17 (ix)
00199$:
	ld	a,-18 (ix)
	sub	a, #0x0C
	ld	a,-17 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00139$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:225: void drawPlayer(u8 x,u8 y,u8 *sprite,u8 sizeX,u8 sizeY,u8 life){
;	---------------------------------
; Function drawPlayer
; ---------------------------------
_drawPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:227: if(life > 0){
	ld	a,10 (ix)
	or	a, a
	jr	Z,00103$
;src/main.c:228: memptr = cpct_getScreenPtr(VMEM,x,y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:229: cpct_drawSpriteMasked(sprite, memptr, sizeX, sizeY);
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
;src/main.c:233: void erasePlayer(u8 x,u8 y,u8 sizeX,u8 sizeY){
;	---------------------------------
; Function erasePlayer
; ---------------------------------
_erasePlayer::
;src/main.c:236: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/main.c:237: cpct_drawSolidBox(memptr,0,sizeX,sizeY);
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
;src/main.c:243: void erasePlayers(){
;	---------------------------------
; Function erasePlayers
; ---------------------------------
_erasePlayers::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:245: erasePlayer(player.lx,player.ly,player.lsize,player.sizeY);
	ld	hl, #_player + 9
	ld	c,(hl)
	ld	hl, #_player + 10
	ld	b,(hl)
	ld	hl, #_player + 3
	ld	e,(hl)
	ld	hl, #_player + 2
	ld	d,(hl)
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
	call	_erasePlayer
	pop	af
	pop	af
;src/main.c:246: for(i=0;i<numenemies;i++){
	ld	-1 (ix),#0x00
00104$:
;src/main.c:247: if(enemies[i].life > 0)
	ld	l,-1 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_enemies)
	add	a, l
	ld	e,a
	ld	a,#>(_enemies)
	adc	a, h
	ld	d,a
	push	de
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:248: erasePlayer(enemies[i].lx,enemies[i].ly,enemies[i].lsize,enemies[i].sizeY);
	push	de
	pop	iy
	ld	a,9 (iy)
	ld	l,e
	ld	h, d
	ld	bc, #0x000A
	add	hl, bc
	ld	c,(hl)
	ld	l,e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	b,(hl)
	ex	de,hl
	inc	hl
	inc	hl
	ld	e,(hl)
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
	call	_erasePlayer
	pop	af
	pop	af
00105$:
;src/main.c:246: for(i=0;i<numenemies;i++){
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x03
	jr	C,00104$
	inc	sp
	pop	ix
	ret
;src/main.c:252: void drawPlayers(){
;	---------------------------------
; Function drawPlayers
; ---------------------------------
_drawPlayers::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:254: drawPlayer(player.x,player.y,player.sprite,player.sizeX,player.sizeY,player.life);
	ld	hl, #_player + 6
	ld	e,(hl)
	ld	hl, #_player + 9
	ld	a,(hl)
	ld	-1 (ix),a
	ld	hl, #_player + 8
	ld	a,(hl)
	ld	-2 (ix),a
	ld	bc, (#_player + 4)
	ld	hl, #_player + 1
	ld	a,(hl)
	ld	-3 (ix),a
	ld	hl, #_player + 0
	ld	d,(hl)
	ld	a,e
	push	af
	inc	sp
	ld	h,-1 (ix)
	ld	l,-2 (ix)
	push	hl
	push	bc
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPlayer
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/main.c:255: for(i=0;i<numenemies;i++){
	ld	-6 (ix),#0x00
00104$:
;src/main.c:256: if(enemies[i].life > 0)
	ld	l,-6 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_enemies)
	add	a, l
	ld	e,a
	ld	a,#>(_enemies)
	adc	a, h
	ld	d,a
	push	de
	pop	iy
	ld	c,6 (iy)
	ld	a,c
	or	a, a
	jr	Z,00105$
;src/main.c:257: drawPlayer(enemies[i].x,enemies[i].y,enemies[i].sprite,enemies[i].sizeX,enemies[i].sizeY,enemies[i].life);
	push	de
	pop	iy
	ld	a,9 (iy)
	ld	-3 (ix),a
	push	de
	pop	iy
	ld	a,8 (iy)
	ld	-2 (ix),a
	push	de
	pop	iy
	ld	a,4 (iy)
	ld	-5 (ix),a
	ld	a,5 (iy)
	ld	-4 (ix),a
	ld	l, e
	ld	h, d
	inc	hl
	ld	b,(hl)
	ld	a,(de)
	ld	e,a
	ld	a,c
	push	af
	inc	sp
	ld	h,-3 (ix)
	ld	l,-2 (ix)
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_drawPlayer
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
00105$:
;src/main.c:255: for(i=0;i<numenemies;i++){
	inc	-6 (ix)
	ld	a,-6 (ix)
	sub	a, #0x03
	jr	C,00104$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:263: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:265: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/main.c:266: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/main.c:267: if(atk > 30 || atk <= 20){
	ld	a,#0x14
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
;src/main.c:269: switch(col){
	ld	a,#0x02
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	-2 (ix),a
;src/main.c:267: if(atk > 30 || atk <= 20){
	ld	a,#0x1E
	sub	a, 4 (ix)
	jr	C,00107$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
00107$:
;src/main.c:268: memptr = cpct_getScreenPtr(VMEM,4,192);
	ld	hl,#0xC004
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:269: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00108$
;src/main.c:271: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:269: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00156$
	add	hl,de
	add	hl,de
;src/main.c:270: case 0:
	jp	(hl)
00156$:
	jr	00103$
	jr	00104$
	jr	00105$
00103$:
;src/main.c:271: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:272: break;
	jr	00108$
;src/main.c:273: case 1:
00104$:
;src/main.c:274: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:275: break;
	jr	00108$
;src/main.c:276: case 2:
00105$:
;src/main.c:277: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:278: }
00108$:
;src/main.c:280: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00114$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00115$
00114$:
;src/main.c:281: memptr = cpct_getScreenPtr(VMEM,7,192);
	ld	hl,#0xC007
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:282: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00115$
;src/main.c:271: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:282: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00157$
	add	hl,de
	add	hl,de
;src/main.c:283: case 0:
	jp	(hl)
00157$:
	jr	00110$
	jr	00111$
	jr	00112$
00110$:
;src/main.c:284: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:285: break;
	jr	00115$
;src/main.c:286: case 1:
00111$:
;src/main.c:287: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:288: break;
	jr	00115$
;src/main.c:289: case 2:
00112$:
;src/main.c:290: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:291: }
00115$:
;src/main.c:293: if(atk <= 20){
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00122$
;src/main.c:294: memptr = cpct_getScreenPtr(VMEM,10,192);
	ld	hl,#0xC00A
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:271: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/main.c:295: switch(col){
	ld	a,5 (ix)
	or	a, a
	jr	Z,00117$
	ld	a,5 (ix)
	sub	a, #0x02
	jr	Z,00118$
	jr	00122$
;src/main.c:296: case 0:
00117$:
;src/main.c:297: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/main.c:298: break;
	jr	00122$
;src/main.c:299: case 2:
00118$:
;src/main.c:300: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/main.c:301: }
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:306: void drawPickUps(u8 corazon, u8 bullet){
;	---------------------------------
; Function drawPickUps
; ---------------------------------
_drawPickUps::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:309: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:311: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	c, l
	ld	b, h
;src/main.c:310: if(corazon == 0)
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00102$
;src/main.c:311: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00103$
00102$:
;src/main.c:313: cpct_drawSolidBox(memptr, 0, 4, 8);
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
;src/main.c:315: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
	ld	hl,#0x1008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:311: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ex	de,hl
;src/main.c:316: if(bullet == 0)
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00105$
;src/main.c:317: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
	ld	bc,#_flecha_arriba
	ld	hl,#0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00107$
00105$:
;src/main.c:319: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:324: void drawVida(u8 life){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:329: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0041
00105$:
;src/main.c:330: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/main.c:331: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:332: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
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
;src/main.c:334: cpct_drawSolidBox(memptr,0,4,8);
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
;src/main.c:329: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:341: void drawBullets(u8 bullet){
;	---------------------------------
; Function drawBullets
; ---------------------------------
_drawBullets::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:345: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
	ld	bc,#0x0032
00105$:
;src/main.c:346: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/main.c:347: p+=5;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/main.c:348: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
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
;src/main.c:349: else  cpct_drawSolidBox(memptr,0,2,8);
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
;src/main.c:345: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/main.c:358: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
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
;src/main.c:360: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:361: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:362: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:363: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:364: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:365: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:367: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:368: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
	jp	00112$
00107$:
;src/main.c:370: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
	ld	a,-8 (ix)
	sub	a, #0x03
	jp	NZ,00101$
;src/main.c:371: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:372: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
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
;src/main.c:373: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:375: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:376: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:380: void checkArrowCollisions(u8 *arrow){
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
;src/main.c:382: u8 posX = object.x;
	ld	a,(#_object+0)
	ld	-12 (ix),a
;src/main.c:383: u8 posY = object.y;
	ld	a,(#_object + 1)
;src/main.c:384: if(    scene[(posY)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:385: || scene[(posY)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:386: || scene[(posY+object.sizeY-2)/tileheight][(posX)/tilewidth] == 1
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
;src/main.c:387: || scene[(posY+object.sizeY-2)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
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
;src/main.c:389: arrow[0] = 0;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x00
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:393: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY,u8 *life,u8 *bullets,u8 *corazon, u8 *flecha){
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
;src/main.c:395: u8 *posX = x;
	ld	a,4 (ix)
	ld	-21 (ix),a
	ld	a,5 (ix)
	ld	-20 (ix),a
;src/main.c:396: u8 *posY = y;
	ld	a,6 (ix)
	ld	-18 (ix),a
	ld	a,7 (ix)
	ld	-17 (ix),a
;src/main.c:397: u8 bound = 0;
	ld	-19 (ix),#0x00
;src/main.c:398: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:399: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:400: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:401: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:403: *posX=lx;
	pop	hl
	push	hl
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:404: *posY=ly;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,9 (ix)
	ld	(hl),a
;src/main.c:405: bound = 1;
	ld	-19 (ix),#0x01
	jp	00126$
00125$:
;src/main.c:407: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 2
	ld	a,-2 (ix)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:408: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
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
;src/main.c:409: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 2
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
;src/main.c:410: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
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
;src/main.c:412: if(*life < 3 && *corazon == 0){
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
;src/main.c:413: *life += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:414: *corazon = 1;
	ld	(hl),#0x01
	jp	00126$
00119$:
;src/main.c:417: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5
	ld	a,-2 (ix)
	sub	a, #0x05
	jp	Z,00112$
;src/main.c:418: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
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
;src/main.c:419: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 5
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
;src/main.c:420: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
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
;src/main.c:422: if(*bullets < 3 && *flecha == 0){
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
;src/main.c:423: *bullets += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:424: *flecha = 1;
	ld	(hl),#0x01
	jp	00126$
00113$:
;src/main.c:426: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9
	ld	a,-2 (ix)
	sub	a, #0x09
	jp	Z,00107$
;src/main.c:427: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
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
;src/main.c:428: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 9
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
;src/main.c:429: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
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
;src/main.c:431: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:432: drawMap(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_drawMap
	inc	sp
00126$:
;src/main.c:434: return bound;
	ld	l,-19 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:439: u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *bullets,u8 *finish,u8 *arrow){
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
;src/main.c:441: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	d,l
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	a,(bc)
	ld	e,a
;src/main.c:442: size[0] = 5;
	ld	a,14 (ix)
	ld	-2 (ix),a
	ld	a,15 (ix)
	ld	-1 (ix),a
;src/main.c:445: switch(dir[0]){
	ld	a,10 (ix)
	ld	-10 (ix),a
	ld	a,11 (ix)
	ld	-9 (ix),a
;src/main.c:484: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
	ld	a,20 (ix)
	ld	-4 (ix),a
	ld	a,21 (ix)
	ld	-3 (ix),a
;src/main.c:441: if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
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
;src/main.c:442: size[0] = 5;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x05
;src/main.c:443: if(atk[0] >= 50) atk[0] =0;
	ld	a,(bc)
	ld	h,a
	sub	a, #0x32
	jr	C,00102$
	xor	a, a
	ld	(bc),a
	jr	00103$
00102$:
;src/main.c:444: else atk[0] += 1;
	ld	a,h
	inc	a
	ld	(bc),a
00103$:
;src/main.c:445: switch(dir[0]){
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
;src/main.c:446: case 4:
00104$:
;src/main.c:447: s = gladis_atk_izda;
	ld	12 (ix),#<(_gladis_atk_izda)
	ld	13 (ix),#>(_gladis_atk_izda)
;src/main.c:448: break;
	jp	00146$
;src/main.c:449: case 6:
00105$:
;src/main.c:450: s = gladis_atk_dcha;
	ld	12 (ix),#<(_gladis_atk_dcha)
	ld	13 (ix),#>(_gladis_atk_dcha)
;src/main.c:451: break;
	jp	00146$
;src/main.c:452: case 8:
00106$:
;src/main.c:453: s = gladis_atk_arriba;
	ld	12 (ix),#<(_gladis_atk_arriba)
	ld	13 (ix),#>(_gladis_atk_arriba)
;src/main.c:454: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:455: break;
	jp	00146$
;src/main.c:456: case 2:
00107$:
;src/main.c:457: s = gladis_atk_abajo;
	ld	12 (ix),#<(_gladis_atk_abajo)
	ld	13 (ix),#>(_gladis_atk_abajo)
;src/main.c:458: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:460: }
	jp	00146$
00145$:
;src/main.c:462: if(atk[0] < 20) atk[0] += 1;
	ld	a,l
	or	a, a
	jr	Z,00110$
	ld	a,e
	inc	a
	ld	(bc),a
	jr	00111$
00110$:
;src/main.c:463: else atk[0] = 20;
	ld	a,#0x14
	ld	(bc),a
00111$:
;src/main.c:464: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76){
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
;src/main.c:465: x[0] += 1;
	ld	a,h
	inc	a
	ld	(bc),a
;src/main.c:466: dir[0] = 6;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x06
;src/main.c:467: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:468: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
	jp	00146$
00141$:
;src/main.c:469: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0){
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
;src/main.c:470: x[0] -= 1;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:471: dir[0] = 4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/main.c:472: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:473: s = gladis_quieto_izda;
	ld	12 (ix),#<(_gladis_quieto_izda)
	ld	13 (ix),#>(_gladis_quieto_izda)
	jp	00146$
00137$:
;src/main.c:474: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
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
;src/main.c:475: y[0] += 2;
	ld	a,h
	add	a, #0x02
	ld	(de),a
;src/main.c:476: dir[0] = 2;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x02
;src/main.c:477: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:478: s = gladis_abajo;
	ld	12 (ix),#<(_gladis_abajo)
	ld	13 (ix),#>(_gladis_abajo)
	jp	00146$
00133$:
;src/main.c:479: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
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
;src/main.c:480: y[0] -= 2;
	add	a,#0xFE
	ld	(de),a
;src/main.c:481: dir[0] = 8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/main.c:482: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
;src/main.c:483: s = gladis_arriba;
	ld	12 (ix),#<(_gladis_arriba)
	ld	13 (ix),#>(_gladis_arriba)
	jp	00146$
00129$:
;src/main.c:484: }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
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
;src/main.c:485: if(bullets[0] > 0){
	ld	a,16 (ix)
	ld	-8 (ix),a
	ld	a,17 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00118$
;src/main.c:487: u8 *spr = flecha_dcha,xs=2,ys=8,ox=x[0]+4;
	ld	-6 (ix),#<(_flecha_dcha)
	ld	-5 (ix),#>(_flecha_dcha)
	ld	-11 (ix),#0x02
	ld	-12 (ix),#0x08
	ld	a,(bc)
	ld	b,a
	add	a, #0x04
	ld	-13 (ix), a
	ld	c, a
;src/main.c:488: switch(dir[0]){
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
;src/main.c:489: case 6: spr = flecha_dcha; xs=4;ys=4;ox=x[0]+4; break;
00112$:
	ld	-6 (ix),#<(_flecha_dcha)
	ld	-5 (ix),#>(_flecha_dcha)
	ld	-11 (ix),#0x04
	ld	-12 (ix),#0x04
	ld	c,-13 (ix)
	jr	00116$
;src/main.c:490: case 4: spr = flecha_izda; xs=4;ys=4;ox=x[0]-4; break;
00113$:
	ld	-6 (ix),#<(_flecha_izda)
	ld	-5 (ix),#>(_flecha_izda)
	ld	-11 (ix),#0x04
	ld	-12 (ix),#0x04
	ld	a,b
	add	a,#0xFC
	ld	c,a
	jr	00116$
;src/main.c:491: case 2: spr = flecha_abajo; xs=2;ys=8; break;
00114$:
	ld	-6 (ix),#<(_flecha_abajo)
	ld	-5 (ix),#>(_flecha_abajo)
	ld	-11 (ix),#0x02
	ld	-12 (ix),#0x08
	jr	00116$
;src/main.c:492: case 8: spr = flecha_arriba; xs=2;ys=8; break;
00115$:
	ld	-6 (ix),#<(_flecha_arriba)
	ld	-5 (ix),#>(_flecha_arriba)
	ld	-11 (ix),#0x02
	ld	-12 (ix),#0x08
;src/main.c:493: }
00116$:
;src/main.c:494: object.x = ox;
	ld	hl,#_object+0
	ld	(hl),c
;src/main.c:495: object.y = y[0]+8;
	ld	bc,#_object + 1
	ld	a,(de)
	add	a, #0x08
	ld	(bc),a
;src/main.c:496: object.x = object.x;
	ld	hl, #_object + 0
	ld	d,(hl)
	ld	hl,#_object
	ld	(hl),d
;src/main.c:497: object.y = object.y;
	ld	(bc),a
;src/main.c:498: object.sprite = spr;
	ld	hl,#_object + 4
	ld	a,-6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-5 (ix)
	ld	(hl),a
;src/main.c:499: object.vivo = 1;
	ld	hl,#_object + 6
	ld	(hl),#0x01
;src/main.c:500: object.dir = dir[0];
	ld	de,#_object + 7
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	(de),a
;src/main.c:501: object.sizeX = xs;
	ld	hl,#_object + 8
	ld	a,-11 (ix)
	ld	(hl),a
;src/main.c:502: object.sizeY = ys;
	ld	hl,#_object + 9
	ld	a,-12 (ix)
	ld	(hl),a
;src/main.c:503: bullets[0]--;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	dec	d
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),d
00118$:
;src/main.c:505: arrow[0]=1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
	jr	00146$
00125$:
;src/main.c:507: switch(dir[0]){
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
;src/main.c:508: case 4:
00119$:
;src/main.c:509: s = gladis_quieto_izda;
	ld	12 (ix),#<(_gladis_quieto_izda)
	ld	13 (ix),#>(_gladis_quieto_izda)
;src/main.c:510: break;
	jr	00123$
;src/main.c:511: case 6:
00120$:
;src/main.c:512: s = gladis_quieto_dcha;
	ld	12 (ix),#<(_gladis_quieto_dcha)
	ld	13 (ix),#>(_gladis_quieto_dcha)
;src/main.c:513: break;
	jr	00123$
;src/main.c:514: case 8:
00121$:
;src/main.c:515: s = gladis_arriba;
	ld	12 (ix),#<(_gladis_arriba)
	ld	13 (ix),#>(_gladis_arriba)
;src/main.c:516: break;
	jr	00123$
;src/main.c:517: case 2:
00122$:
;src/main.c:518: s = gladis_abajo;
	ld	12 (ix),#<(_gladis_abajo)
	ld	13 (ix),#>(_gladis_abajo)
;src/main.c:520: }
00123$:
;src/main.c:521: size[0] = 4;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x04
00146$:
;src/main.c:526: if(cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00149$
;src/main.c:527: arrow[0] = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
00149$:
;src/main.c:529: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00151$
;src/main.c:530: finish[0] = 1;
	ld	l,18 (ix)
	ld	h,19 (ix)
	ld	(hl),#0x01
00151$:
;src/main.c:533: return s;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:536: void moveObject(){
;	---------------------------------
; Function moveObject
; ---------------------------------
_moveObject::
;src/main.c:537: object.lx = object.x;
	ld	bc,#_object+0
	ld	a,(bc)
	ld	(#(_object + 0x0002)),a
;src/main.c:538: object.ly = object.y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_object + 0x0003)),a
;src/main.c:539: switch(object.dir){
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
;src/main.c:540: case 6: object.x += 1; break;
00101$:
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
;src/main.c:541: case 4: object.x -= 1; break;
00102$:
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
;src/main.c:542: case 2: object.y += 2; break;
00103$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	ret
;src/main.c:543: case 8: object.y -= 2; break;
00104$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/main.c:544: }
	ret
;src/main.c:549: u8* move(){
;	---------------------------------
; Function move
; ---------------------------------
_move::
;src/main.c:550: u8* sprite = chacho_dcha;
	ld	hl,#_chacho_dcha
;src/main.c:553: return sprite;
	ret
;src/main.c:558: void game(){
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
;src/main.c:559: TNivel n = {0,0,0};
	ld	hl,#0x0001
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0001
	add	hl,sp
	ld	e, l
	ld	d, h
	inc	hl
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x00
	inc	de
	inc	de
	ld	-10 (ix),e
	ld	-9 (ix),d
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x00
;src/main.c:560: u8 finish = 0,arrow=0,following = 0, bound =0,i=0;
	ld	-19 (ix),#0x00
	ld	-15 (ix),#0x00
	ld	-8 (ix),#0x00
;src/main.c:562: temp = 0;
	ld	hl,#0x0000
	ld	(_temp),hl
;src/main.c:563: map = 1;
	ld	hl,#_map + 0
	ld	(hl), #0x01
;src/main.c:565: initPlayer();
	call	_initPlayer
;src/main.c:566: initEnemies();
	call	_initEnemies
;src/main.c:567: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:568: drawMap(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_drawMap
	inc	sp
;src/main.c:572: while (1){
	ld	a,-10 (ix)
	ld	-13 (ix),a
	ld	a,-9 (ix)
	ld	-12 (ix),a
	ld	a,-7 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	ld	-4 (ix),a
00118$:
;src/main.c:575: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:578: erasePlayers();
	call	_erasePlayers
;src/main.c:580: if(arrow == 1){
	ld	a,-15 (ix)
	dec	a
	jr	NZ,00104$
;src/main.c:581: erasePlayer(object.lx,object.ly,object.sizeX,object.sizeY);
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
;src/main.c:582: if(bound == 1) arrow = 0;
	ld	a,-8 (ix)
	dec	a
	jr	NZ,00104$
	ld	-15 (ix),#0x00
00104$:
;src/main.c:586: drawPickUps(n.corazon,n.bullet);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	c, (hl)
	push	bc
	call	_drawPickUps
	pop	af
;src/main.c:589: drawPlayers();
	call	_drawPlayers
;src/main.c:590: if(arrow == 1) drawPlayer(object.x,object.y,object.sprite,object.sizeX,object.sizeY,object.vivo);
	ld	a,-15 (ix)
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
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	pop	af
	ld	hl, #(_object + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_object + 0
	ld	c,(hl)
	push	af
	inc	sp
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_drawPlayer
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
00106$:
;src/main.c:593: drawVida(player.life);
	ld	a, (#(_player + 0x0006) + 0)
	push	af
	inc	sp
	call	_drawVida
	inc	sp
;src/main.c:594: drawBullets(player.bullets);
	ld	a, (#(_player + 0x000d) + 0)
	push	af
	inc	sp
	call	_drawBullets
	inc	sp
;src/main.c:597: if(player.atk < 20) drawFatiga(player.atk,2);
	ld	hl, #(_player + 0x000b) + 0
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
;src/main.c:598: else if(player.atk > 20) drawFatiga(player.atk,1);
	ld	a,#0x14
	sub	a, d
	jr	NC,00108$
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00112$
00108$:
;src/main.c:599: else drawFatiga(player.atk,0);
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
00112$:
;src/main.c:602: player.lx = player.x;
	ld	a, (#_player + 0)
	ld	hl,#(_player + 0x0002)
	ld	(hl),a
;src/main.c:603: player.ly = player.y;
	ld	a, (#(_player + 0x0001) + 0)
	ld	hl,#(_player + 0x0003)
	ld	(hl),a
;src/main.c:604: player.latk = player.atk;
	ld	de,#_player + 12
	ld	a, (#(_player + 0x000b) + 0)
	ld	(de),a
;src/main.c:605: player.lsize = player.sizeX;
	ld	de,#_player + 10
	ld	a, (#(_player + 0x0008) + 0)
	ld	(de),a
;src/main.c:608: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:609: player.sprite = checkKeyboard(&player.x,&player.y,&player.atk,&player.dir,player.sprite,&player.sizeX,&player.bullets,&finish,&arrow);
	ld	hl,#0x0004
	add	hl,sp
	ex	de,hl
	ld	hl,#0x0000
	add	hl,sp
	ld	c, l
	ld	b, h
	ld	hl, (#(_player + 0x0004) + 0)
	push	de
	push	bc
	ld	bc,#(_player + 0x000d)
	push	bc
	ld	bc,#(_player + 0x0008)
	push	bc
	push	hl
	ld	hl,#(_player + 0x0007)
	push	hl
	ld	hl,#(_player + 0x000b)
	push	hl
	ld	hl,#(_player + 0x0001)
	push	hl
	ld	hl,#_player
	push	hl
	call	_checkKeyboard
	ld	iy,#18
	add	iy,sp
	ld	sp,iy
	ld	e,l
	ld	d,h
	ld	((_player + 0x0004)), de
;src/main.c:610: checkBoundsCollisions(&player.x,&player.y,player.lx,player.ly,player.sizeX,player.sizeY,&player.life,&player.bullets,&n.corazon,&n.bullet);
	ld	e,-13 (ix)
	ld	d,-12 (ix)
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	ld	a,(#_player + 9)
	ld	-2 (ix),a
	ld	a,(#(_player + 0x0008) + 0)
	ld	-14 (ix),a
	ld	a,(#(_player + 0x0003) + 0)
	ld	-3 (ix),a
	ld	a,(#(_player + 0x0002) + 0)
	ld	-11 (ix),a
	push	de
	push	bc
	ld	hl,#(_player + 0x000d)
	push	hl
	ld	hl,#(_player + 0x0006)
	push	hl
	ld	h,-2 (ix)
	ld	l,-14 (ix)
	push	hl
	ld	h,-3 (ix)
	ld	l,-11 (ix)
	push	hl
	ld	hl,#(_player + 0x0001)
	push	hl
	ld	hl,#_player
	push	hl
	call	_checkBoundsCollisions
	ld	hl,#16
	add	hl,sp
	ld	sp,hl
;src/main.c:612: if(arrow == 1){
	ld	a,-15 (ix)
	dec	a
	jr	NZ,00114$
;src/main.c:613: moveObject();
	call	_moveObject
;src/main.c:614: bound = checkBoundsCollisions(&object.x,&object.y,object.lx,object.ly,object.sizeX,object.sizeY,0,0,0,0);
	ld	hl, #(_object + 0x0009) + 0
	ld	e,(hl)
	ld	hl, #(_object + 0x0008) + 0
	ld	c,(hl)
	ld	a,(#(_object + 0x0003) + 0)
	ld	-11 (ix),a
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
	ld	a,-11 (ix)
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
	ld	-8 (ix),l
00114$:
;src/main.c:618: if(finish == 1) return;
	ld	a,-19 (ix)
	dec	a
	jp	NZ,00118$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:625: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:627: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:628: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:629: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:631: while (1){
00104$:
;src/main.c:633: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:637: if(cpct_isKeyPressed(Key_Esc)) {
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:639: return;
	ret
___str_5:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:649: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:653: init();
	call	_init
;src/main.c:656: while(1){
00106$:
;src/main.c:657: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:658: switch(x){
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
;src/main.c:659: case 0: return;break;
;src/main.c:660: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:661: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:662: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
