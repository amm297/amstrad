;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Fri Oct 23 15:17:18 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _controles
	.globl _credits
	.globl _game
	.globl _menu
	.globl _gameOver
	.globl _moveObject
	.globl _checkKeyboard
	.globl _checkArrowCollisions
	.globl _checkBoundsCollisions
	.globl _checkCollisions
	.globl _move
	.globl _patrol
	.globl _followPlayer
	.globl _movement
	.globl _chooseDirection
	.globl _detectPlayerRoom
	.globl _drawPickUps
	.globl _drawFatiga
	.globl _erases
	.globl _draws
	.globl _drawStats
	.globl _erase
	.globl _draw
	.globl _drawBullets
	.globl _drawVida
	.globl _drawMap
	.globl _mapSelector
	.globl _vaciar
	.globl _endGame
	.globl _initVariables
	.globl _initNivel
	.globl _initEnemies
	.globl _restartPlayer
	.globl _initPlayer
	.globl _init
	.globl _cpct_getScreenPtr
	.globl _cpct_setPalette
	.globl _cpct_fw2hw
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_scanKeyboard
	.globl _cpct_memset
	.globl _cpct_disableFirmware
	.globl _rand
	.globl _enemy
	.globl _player
	.globl _object
	.globl _n
	.globl _dead
	.globl _archer
	.globl _bound
	.globl _following
	.globl _arrow
	.globl _finish
	.globl _path
	.globl _map
	.globl _temp
	.globl _scene
	.globl _mapa2
	.globl _mapa1
	.globl _originsu
	.globl _originse
	.globl _originsp
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
_map::
	.ds 1
_path::
	.ds 1
_finish::
	.ds 1
_arrow::
	.ds 1
_following::
	.ds 1
_bound::
	.ds 1
_archer::
	.ds 1
_dead::
	.ds 1
_n::
	.ds 3
_object::
	.ds 10
_player::
	.ds 11
_enemy::
	.ds 15
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
;src/init.h:13: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/init.h:14: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/init.h:15: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/init.h:16: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/init.h:17: cpct_setPalette(g_palette,4);
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
	.db #0x0D	; 13
_originsp:
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0xB0	; 176
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x00	; 0
_originse:
	.db #0x34	; 52	'4'
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x0C	; 12
	.db #0x60	; 96
	.db #0x34	; 52	'4'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x0C	; 12
	.db #0x60	; 96
	.db #0x34	; 52	'4'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x90	; 144
_originsu:
	.db #0x04	; 4
	.db #0xA0	; 160
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x20	; 32
	.db #0x49	; 73	'I'
	.db #0x60	; 96
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0xA0	; 160
	.db #0x0C	; 12
	.db #0x90	; 144
	.db #0x49	; 73	'I'
	.db #0x5C	; 92
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
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
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
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
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
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
;src/init.h:20: void initPlayer(u8 p){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/init.h:21: u8 *sprite = gladis_quieto_dcha;
;src/init.h:22: player.x = originsp[p-1][0];
	ld	de,#_originsp+0
	ld	l,4 (ix)
	dec	l
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	(#_player),a
;src/init.h:23: player.y = originsp[p-1][1];
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_player + 0x0001)),a
;src/init.h:24: player.lx = originsp[p-1][0];
	ld	a,(bc)
	ld	(#(_player + 0x0002)),a
;src/init.h:25: player.ly = originsp[p-1][1];
	ld	a,(de)
	ld	(#(_player + 0x0003)),a
;src/init.h:26: player.sprite = sprite;
	ld	hl,#_gladis_quieto_dcha
	ld	((_player + 0x0004)), hl
;src/init.h:27: player.life = 3;
	ld	hl,#_player + 6
	ld	(hl),#0x03
;src/init.h:28: player.dir = 6;
	ld	hl,#_player + 7
	ld	(hl),#0x06
;src/init.h:29: player.atk = 20;
	ld	hl,#_player + 8
	ld	(hl),#0x14
;src/init.h:30: player.latk = 20;
	ld	hl,#_player + 9
	ld	(hl),#0x14
;src/init.h:31: player.bullets = 3;
	ld	hl,#_player + 10
	ld	(hl),#0x03
	pop	ix
	ret
;src/init.h:34: void restartPlayer(u8 p){
;	---------------------------------
; Function restartPlayer
; ---------------------------------
_restartPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/init.h:35: u8 *sprite = gladis_quieto_dcha;
;src/init.h:36: player.x = originsp[p-1][0];
	ld	de,#_originsp+0
	ld	l,4 (ix)
	dec	l
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	(#_player),a
;src/init.h:37: player.y = originsp[p-1][1];
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_player + 0x0001)),a
;src/init.h:38: player.lx = originsp[p-1][0];
	ld	a,(bc)
	ld	(#(_player + 0x0002)),a
;src/init.h:39: player.ly = originsp[p-1][1];
	ld	a,(de)
	ld	(#(_player + 0x0003)),a
;src/init.h:40: player.sprite = sprite;
	ld	hl,#_gladis_quieto_dcha
	ld	((_player + 0x0004)), hl
;src/init.h:41: player.dir = 6;
	ld	hl,#_player + 7
	ld	(hl),#0x06
;src/init.h:42: player.atk = 20;
	ld	hl,#_player + 8
	ld	(hl),#0x14
;src/init.h:43: player.latk = 20;
	ld	hl,#_player + 9
	ld	(hl),#0x14
	pop	ix
	ret
;src/init.h:46: void initEnemies(u8 p){
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/init.h:47: u8 *sprite = chacho_dcha;
;src/init.h:48: enemy.x = originse[p-1][0];
	ld	de,#_originse+0
	ld	c,4 (ix)
	dec	c
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl,de
	ex	de,hl
	ld	a,(de)
	ld	(#_enemy),a
;src/init.h:49: enemy.y = originse[p-1][1];
	push	de
	pop	iy
	inc	iy
	ld	a, 0 (iy)
	ld	(#(_enemy + 0x0001)),a
;src/init.h:50: enemy.lx = originse[p-1][0];
	ld	a,(de)
	ld	(#(_enemy + 0x0002)),a
;src/init.h:51: enemy.ly = originse[p-1][1];
	ld	a, 0 (iy)
	ld	(#(_enemy + 0x0003)),a
;src/init.h:52: enemy.ox = originse[p-1][2];
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	(#(_enemy + 0x0004)),a
;src/init.h:53: enemy.oy = originse[p-1][3];
	push	de
	pop	iy
	ld	a,3 (iy)
	ld	(#(_enemy + 0x0005)),a
;src/init.h:54: enemy.sprite = sprite;
	ld	hl,#_chacho_dcha
	ld	((_enemy + 0x0006)), hl
;src/init.h:55: enemy.life = 1;//p;
	ld	hl,#_enemy + 8
	ld	(hl),#0x01
;src/init.h:56: enemy.dir = 6;
	ld	hl,#_enemy + 9
	ld	(hl),#0x06
;src/init.h:57: enemy.room = 3;
	ld	hl,#_enemy + 10
	ld	(hl),#0x03
;src/init.h:58: enemy.lp = 75 - ((p-1)*5);
	ld	l,c
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a,#0x4B
	sub	a, l
	ld	(#(_enemy + 0x000e)),a
	pop	ix
	ret
;src/init.h:61: void initNivel(){
;	---------------------------------
; Function initNivel
; ---------------------------------
_initNivel::
;src/init.h:62: n.num=0;
	ld	hl,#_n+0
	ld	(hl),#0x00
;src/init.h:63: n.corazon=0;
	ld	hl,#_n + 1
	ld	(hl),#0x00
;src/init.h:64: n.bullet=0;
	ld	hl,#_n + 2
	ld	(hl),#0x00
	ret
;src/init.h:67: void initVariables(u8 m){
;	---------------------------------
; Function initVariables
; ---------------------------------
_initVariables::
;src/init.h:68: bound =0;
	ld	hl,#_bound + 0
	ld	(hl), #0x00
;src/init.h:69: temp = 0;
	ld	hl,#_temp + 0
	ld	(hl), #0x00
;src/init.h:70: map = m;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_map + 0),a
;src/init.h:71: arrow =0;
	ld	hl,#_arrow + 0
	ld	(hl), #0x00
;src/init.h:72: finish =0;
	ld	hl,#_finish + 0
	ld	(hl), #0x00
;src/init.h:73: following =0;
	ld	hl,#_following + 0
	ld	(hl), #0x00
;src/init.h:74: archer = 0;
	ld	hl,#_archer + 0
	ld	(hl), #0x00
;src/init.h:75: dead =0;
	ld	hl,#_dead + 0
	ld	(hl), #0x00
	ret
;src/draws.h:12: void endGame(){
;	---------------------------------
; Function endGame
; ---------------------------------
_endGame::
;src/draws.h:14: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/draws.h:15: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:16: cpct_drawStringM0("Congratulations",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_0+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/draws.h:18: memptr = cpct_getScreenPtr(VMEM,2,180);
	ld	hl,#0xB402
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:19: cpct_drawStringM0("Pulsa cualquier tecla",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_1+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/draws.h:21: while(1){
00104$:
;src/draws.h:22: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/draws.h:23: if(cpct_isKeyPressed(Key_Space)) return;
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
	ret
___str_0:
	.ascii "Congratulations"
	.db 0x00
___str_1:
	.ascii "Pulsa cualquier tecla"
	.db 0x00
;src/draws.h:28: void vaciar(){
;	---------------------------------
; Function vaciar
; ---------------------------------
_vaciar::
;src/draws.h:30: for(y=0;y<height;y++){
	ld	b,#0x00
	ld	de,#0x0000
;src/draws.h:31: for(x=0;x<width;x++){
00109$:
	ld	hl,#_scene
	add	hl,de
	ld	c,#0x00
00103$:
;src/draws.h:32: scene[y][x] = 0;
	push	hl
	ld	l,c
	ld	h,#0x00
	push	hl
	pop	iy
	pop	hl
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	0 (iy), #0x00
;src/draws.h:31: for(x=0;x<width;x++){
	inc	c
	ld	a,c
	sub	a, #0x14
	jr	C,00103$
;src/draws.h:30: for(y=0;y<height;y++){
	ld	hl,#0x0014
	add	hl,de
	ex	de,hl
	inc	b
	ld	a,b
	sub	a, #0x0C
	jr	C,00109$
	ret
;src/draws.h:38: void mapSelector(u8 t){
;	---------------------------------
; Function mapSelector
; ---------------------------------
_mapSelector::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/draws.h:40: vaciar();
	call	_vaciar
;src/draws.h:41: switch(t){
	ld	a,4 (ix)
	sub	a, #0x01
	jp	C,00136$
	ld	a,#0x04
	sub	a, 4 (ix)
	jp	C,00136$
	ld	e,4 (ix)
	dec	e
	ld	d,#0x00
	ld	hl,#00232$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00232$:
	jp	00101$
	jp	00104$
	jp	00107$
	jp	00111$
;src/draws.h:42: case 1: 
00101$:
;src/draws.h:43: for(y=0;y<height;y++){
	ld	-13 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;src/draws.h:44: for(x=0;x<width;x++){
00140$:
	ld	a,#<(_scene)
	add	a, -4 (ix)
	ld	-6 (ix),a
	ld	a,#>(_scene)
	adc	a, -3 (ix)
	ld	-5 (ix),a
	ld	a,#<(_mapa1)
	add	a, -4 (ix)
	ld	-2 (ix),a
	ld	a,#>(_mapa1)
	adc	a, -3 (ix)
	ld	-1 (ix),a
	ld	-11 (ix),#0x00
00116$:
;src/draws.h:45: scene[y][x] = mapa1[y][x];
	ld	a,-6 (ix)
	add	a, -11 (ix)
	ld	-8 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	a,-2 (ix)
	add	a, -11 (ix)
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),a
;src/draws.h:44: for(x=0;x<width;x++){
	inc	-11 (ix)
	ld	a,-11 (ix)
	sub	a, #0x14
	jr	C,00116$
;src/draws.h:43: for(y=0;y<height;y++){
	ld	a,-4 (ix)
	add	a, #0x14
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	inc	-13 (ix)
	ld	a,-13 (ix)
	sub	a, #0x0C
	jr	C,00140$
;src/draws.h:48: break;
	jp	00136$
;src/draws.h:49: case 2:
00104$:
;src/draws.h:50: for(y=0;y<height;y++){
	ld	-13 (ix),#0x00
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
;src/draws.h:51: for(x=0;x<width;x++){
00144$:
	ld	a,#<(_scene)
	add	a, -10 (ix)
	ld	-8 (ix),a
	ld	a,#>(_scene)
	adc	a, -9 (ix)
	ld	-7 (ix),a
	ld	a,#<(_mapa2)
	add	a, -10 (ix)
	ld	-2 (ix),a
	ld	a,#>(_mapa2)
	adc	a, -9 (ix)
	ld	-1 (ix),a
	ld	-11 (ix),#0x00
00120$:
;src/draws.h:52: scene[y][x] = mapa2[y][x];
	ld	a,-8 (ix)
	add	a, -11 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	a,-2 (ix)
	add	a, -11 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;src/draws.h:51: for(x=0;x<width;x++){
	inc	-11 (ix)
	ld	a,-11 (ix)
	sub	a, #0x14
	jr	C,00120$
;src/draws.h:50: for(y=0;y<height;y++){
	ld	a,-10 (ix)
	add	a, #0x14
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	inc	-13 (ix)
	ld	a,-13 (ix)
	sub	a, #0x0C
	jr	C,00144$
;src/draws.h:55: break;
	jp	00136$
;src/draws.h:56: case 3: 
00107$:
;src/draws.h:57: for(y=height-1;y!=0;y--){
	ld	-12 (ix),#0x00
	ld	-13 (ix),#0x0B
	ld	bc,#0x0000
	ld	de,#0x00DC
;src/draws.h:58: for(x=0;x<width;x++){
00148$:
	ld	hl,#_scene
	add	hl,bc
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	hl,#_mapa1
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	-11 (ix),#0x00
00124$:
;src/draws.h:59: scene[aux][x] = mapa1[y][x];
	ld	a,-10 (ix)
	add	a, -11 (ix)
	ld	-2 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,-8 (ix)
	add	a, -11 (ix)
	ld	l,a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/draws.h:58: for(x=0;x<width;x++){
	inc	-11 (ix)
	ld	a,-11 (ix)
	sub	a, #0x14
	jr	C,00124$
;src/draws.h:61: aux++;
	ld	hl,#0x0014
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	-12 (ix)
;src/draws.h:57: for(y=height-1;y!=0;y--){
	ld	a,e
	add	a,#0xEC
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	dec	-13 (ix)
	ld	a,-13 (ix)
	or	a, a
	jr	NZ,00148$
;src/draws.h:63: for(x=0;x<width;x++){
	ld	c,-12 (ix)
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
	ld	c,a
	ld	a,#>(_scene)
	adc	a, h
	ld	b,a
	ld	e,#0x00
00128$:
;src/draws.h:64: scene[aux][x] = mapa1[0][x];
	push	hl
	ld	l,e
	ld	h,#0x00
	push	hl
	pop	iy
	pop	hl
	add	iy, bc
	ld	hl,#_mapa1
	ld	d,#0x00
	add	hl, de
	ld	a,(hl)
	ld	0 (iy), a
;src/draws.h:63: for(x=0;x<width;x++){
	inc	e
	ld	a,e
	sub	a, #0x14
	jr	C,00128$
;src/draws.h:66: break;
	jp	00136$
;src/draws.h:67: case 4:
00111$:
;src/draws.h:68: for(y=height-1;y!=0;y--){
	ld	-12 (ix),#0x00
	ld	-13 (ix),#0x0B
	ld	bc,#0x0000
	ld	de,#0x00DC
;src/draws.h:69: for(x=0;x<width;x++){
00154$:
	ld	hl,#_scene
	add	hl,bc
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	hl,#_mapa2
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	-11 (ix),#0x00
00130$:
;src/draws.h:70: scene[aux][x] = mapa2[y][x];
	ld	a,-10 (ix)
	add	a, -11 (ix)
	ld	-2 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,-8 (ix)
	add	a, -11 (ix)
	ld	l,a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/draws.h:69: for(x=0;x<width;x++){
	inc	-11 (ix)
	ld	a,-11 (ix)
	sub	a, #0x14
	jr	C,00130$
;src/draws.h:72: aux++;
	ld	hl,#0x0014
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	-12 (ix)
;src/draws.h:68: for(y=height-1;y!=0;y--){
	ld	a,e
	add	a,#0xEC
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	dec	-13 (ix)
	ld	a,-13 (ix)
	or	a, a
	jr	NZ,00154$
;src/draws.h:74: for(x=0;x<width;x++){
	ld	c,-12 (ix)
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
	ld	-11 (ix),#0x00
00134$:
;src/draws.h:75: scene[aux][x] = mapa2[0][x];
	ld	a,e
	add	a, -11 (ix)
	ld	c,a
	ld	a,d
	adc	a, #0x00
	ld	b,a
	ld	a,#<(_mapa2)
	add	a, -11 (ix)
	ld	l,a
	ld	a,#>(_mapa2)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
;src/draws.h:74: for(x=0;x<width;x++){
	inc	-11 (ix)
	ld	a,-11 (ix)
	sub	a, #0x14
	jr	C,00134$
;src/draws.h:78: }
00136$:
	ld	sp, ix
	pop	ix
	ret
;src/draws.h:81: void drawMap(u8 t){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;src/draws.h:83: u8 aux = 0;
	ld	c,#0x00
;src/draws.h:86: mapSelector(t);
	push	bc
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_mapSelector
	inc	sp
	pop	bc
;src/draws.h:88: for(posY=0; posY<height;posY++){
	ld	-9 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
	ld	de,#0x0000
;src/draws.h:89: for(posX=0; posX<width;posX++){
00119$:
	ld	a,-9 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	-2 (ix),a
	ld	hl,#_scene
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	b,#0x00
00110$:
;src/draws.h:90: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
	ld	a,b
	add	a, a
	add	a, a
	ld	-1 (ix),a
	push	bc
	push	de
	ld	h,-2 (ix)
	ld	l,-1 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
;src/draws.h:91: if(scene[posY][posX] == 1){
	ld	a,-8 (ix)
	add	a, b
	ld	l,a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	h,a
	ld	h,(hl)
;src/draws.h:92: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
	push	iy
	pop	af
	ld	-5 (ix),a
	push	iy
	dec	sp
	pop	af
	inc	sp
	ld	-6 (ix),a
;src/draws.h:91: if(scene[posY][posX] == 1){
	dec	h
	jr	NZ,00102$
;src/draws.h:92: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
	push	bc
	push	de
	ld	hl,#0x1004
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	hl,#_muro
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
00102$:
;src/draws.h:94: if(scene[posY][posX] == 9){
	ld	a,#<(_scene)
	add	a, -4 (ix)
	ld	l,a
	ld	a,#>(_scene)
	adc	a, -3 (ix)
	ld	h,a
	ld	a,l
	add	a, b
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
;src/draws.h:95: if(aux == 0){
	sub	a,#0x09
	jr	NZ,00111$
	or	a,c
	jr	NZ,00104$
;src/draws.h:96: cpct_drawSprite(g_tile_puerta_0,memptr,tilewidth, tileheight);
	push	bc
	push	de
	ld	hl,#0x1004
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	hl,#_g_tile_puerta_0
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/draws.h:97: aux += 1;
	inc	c
	jr	00111$
00104$:
;src/draws.h:99: else cpct_drawSprite(g_tile_puerta_1,memptr,tilewidth, tileheight);
	push	bc
	push	de
	ld	hl,#0x1004
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	hl,#_g_tile_puerta_1
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
00111$:
;src/draws.h:89: for(posX=0; posX<width;posX++){
	inc	b
	ld	a,b
	sub	a, #0x14
	jp	C,00110$
;src/draws.h:88: for(posY=0; posY<height;posY++){
	ld	a,-4 (ix)
	add	a, #0x14
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	hl,#0x0014
	add	hl,de
	ex	de,hl
	inc	-9 (ix)
	ld	a,-9 (ix)
	sub	a, #0x0C
	jp	C,00119$
	ld	sp, ix
	pop	ix
	ret
;src/draws.h:106: void drawVida(u8 life,u8 pos,u8 lim){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/draws.h:109: u8 p = pos;
	ld	d,5 (ix)
;src/draws.h:111: for(i=1;i<=5;i++){
	ld	e,#0x01
00107$:
;src/draws.h:112: memptr = cpct_getScreenPtr(VMEM,p,192);
	push	de
	ld	a,#0xC0
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/draws.h:113: p+=5;
	ld	a,d
	add	a, #0x05
	ld	d,a
;src/draws.h:114: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
	ld	a,4 (ix)
	sub	a, e
	jr	C,00104$
	push	de
	ld	hl,#0x0804
	push	hl
	push	bc
	ld	hl,#_corazon_lleno
	push	hl
	call	_cpct_drawSpriteMasked
	pop	de
	jr	00108$
00104$:
;src/draws.h:116: if(i<=lim){
	ld	a,6 (ix)
	sub	a, e
	jr	C,00108$
;src/draws.h:117: cpct_drawSolidBox(memptr,0,4,8);
	push	bc
	push	de
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
	pop	de
	pop	bc
;src/draws.h:118: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	push	de
	ld	hl,#0x0804
	push	hl
	push	bc
	ld	hl,#_corazon_roto
	push	hl
	call	_cpct_drawSpriteMasked
	pop	de
00108$:
;src/draws.h:111: for(i=1;i<=5;i++){
	inc	e
	ld	a,#0x05
	sub	a, e
	jr	NC,00107$
	pop	ix
	ret
;src/draws.h:125: void drawBullets(u8 bullet,u8 pos){
;	---------------------------------
; Function drawBullets
; ---------------------------------
_drawBullets::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/draws.h:127: int p = pos;
	ld	c,5 (ix)
	ld	b,#0x00
;src/draws.h:129: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
00105$:
;src/draws.h:130: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/draws.h:131: p+=3;
	inc	bc
	inc	bc
	inc	bc
;src/draws.h:132: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
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
;src/draws.h:133: else  cpct_drawSolidBox(memptr,0,2,8);
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
;src/draws.h:129: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/draws.h:141: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src/draws.h:143: memptr = cpct_getScreenPtr(VMEM,x,y);
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
	ex	de,hl
;src/draws.h:144: switch(mode){
	ld	a,#0x02
	ld	iy,#6
	add	iy,sp
	sub	a, 0 (iy)
	ret	C
;src/draws.h:146: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;src/draws.h:144: switch(mode){
	push	de
	ld	iy,#8
	add	iy,sp
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00111$
	add	hl,de
	add	hl,de
;src/draws.h:145: case 0:
	pop	de
	jp	(hl)
00111$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/draws.h:146: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
;src/draws.h:147: break;
	ret
;src/draws.h:148: case 1:
00102$:
;src/draws.h:149: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
	ld	hl,#0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
;src/draws.h:150: break;
	ret
;src/draws.h:151: case 2:
00103$:
;src/draws.h:152: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
	ld	hl,#0x0404
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
;src/draws.h:154: }
	ret
;src/draws.h:158: void erase(u8 x,u8 y,u8 mode){
;	---------------------------------
; Function erase
; ---------------------------------
_erase::
;src/draws.h:161: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/draws.h:162: switch(mode){
	ld	a,#0x02
	ld	iy,#4
	add	iy,sp
	sub	a, 0 (iy)
	ret	C
;src/draws.h:164: cpct_drawSolidBox(memptr,0,4,16);
;src/draws.h:162: switch(mode){
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00111$
	add	hl,de
	add	hl,de
;src/draws.h:163: case 0:
	jp	(hl)
00111$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/draws.h:164: cpct_drawSolidBox(memptr,0,4,16);
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
;src/draws.h:165: break;
	ret
;src/draws.h:166: case 1:
00102$:
;src/draws.h:167: cpct_drawSolidBox(memptr,0,2,8);
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
;src/draws.h:168: break;
	ret
;src/draws.h:169: case 2:
00103$:
;src/draws.h:170: cpct_drawSolidBox(memptr,0,4,4);
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
;src/draws.h:172: }
	ret
;src/draws.h:175: void drawStats(){
;	---------------------------------
; Function drawStats
; ---------------------------------
_drawStats::
;src/draws.h:176: drawVida(player.life,1,3);
	ld	hl, #_player + 6
	ld	d,(hl)
	ld	hl,#0x0301
	push	hl
	push	de
	inc	sp
	call	_drawVida
	pop	af
	inc	sp
;src/draws.h:177: drawBullets(player.bullets,16);
	ld	hl, #_player + 10
	ld	d,(hl)
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawBullets
	pop	af
;src/draws.h:178: drawVida(enemy.life,enemy.lp,map);
	ld	hl, #_enemy + 14
	ld	d,(hl)
	ld	hl, #_enemy + 8
	ld	b,(hl)
	ld	a,(_map)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_drawVida
	pop	af
	inc	sp
	ret
;src/draws.h:183: void draws(){
;	---------------------------------
; Function draws
; ---------------------------------
_draws::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/draws.h:185: if(temp%2 == 0)
	ld	iy,#_temp
	bit	0, 0 (iy)
	jr	NZ,00102$
;src/draws.h:186: draw(player.x,player.y,player.sprite,0);
	ld	de, (#_player + 4)
	ld	hl, #_player + 1
	ld	b,(hl)
	ld	hl, #_player + 0
	ld	c,(hl)
	xor	a, a
	push	af
	inc	sp
	push	de
	push	bc
	call	_draw
	pop	af
	pop	af
	inc	sp
00102$:
;src/draws.h:187: if(enemy.life > 0 && temp%2 == 1)
	ld	de,#_enemy+0
	ld	a, (#_enemy + 8)
	or	a, a
	jr	Z,00104$
	ld	a,(#_temp + 0)
	and	a, #0x01
	dec	a
	jr	NZ,00104$
;src/draws.h:188: draw(enemy.x,enemy.y,enemy.sprite,0);
	ld	bc, (#_enemy + 6)
	ld	l, e
	ld	h, d
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	a,(de)
	ld	e,a
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	d, -1 (ix)
	push	de
	call	_draw
	pop	af
	pop	af
	inc	sp
00104$:
;src/draws.h:189: if(arrow == 1){
	ld	a,(#_arrow + 0)
	dec	a
	jr	NZ,00116$
;src/draws.h:190: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
	ld	hl, #_object + 7
	ld	e,(hl)
;src/draws.h:191: draw(object.x,object.y,object.sprite,2);
	ld	bc,#_object + 1
;src/draws.h:190: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
	ld	a,e
	sub	a, #0x04
	jr	Z,00110$
	ld	hl,#_object + 6
	ld	a,e
	sub	a, #0x06
	jr	NZ,00111$
	ld	a,(hl)
	dec	a
	jr	NZ,00111$
00110$:
;src/draws.h:191: draw(object.x,object.y,object.sprite,2);
	ld	de, (#(_object + 0x0004) + 0)
	ld	a,(bc)
	ld	-1 (ix),a
	ld	hl, #_object + 0
	ld	c,(hl)
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_draw
	pop	af
	pop	af
	inc	sp
	jr	00116$
00111$:
;src/draws.h:192: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
	ld	a,e
	cp	a,#0x02
	jr	Z,00106$
	sub	a, #0x08
	jr	NZ,00116$
	ld	a,(hl)
	dec	a
	jr	NZ,00116$
00106$:
;src/draws.h:193: draw(object.x,object.y,object.sprite,1);
	ld	de, (#(_object + 0x0004) + 0)
	ld	a,(bc)
	ld	b,a
	ld	hl, #_object + 0
	ld	c,(hl)
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	push	bc
	call	_draw
	pop	af
	pop	af
	inc	sp
00116$:
;src/draws.h:195: drawStats();
	call	_drawStats
	inc	sp
	pop	ix
	ret
;src/draws.h:198: void erases(){
;	---------------------------------
; Function erases
; ---------------------------------
_erases::
;src/draws.h:200: if(temp%2 == 0)
	ld	iy,#_temp
	bit	0, 0 (iy)
	jr	NZ,00102$
;src/draws.h:201: erase(player.lx,player.ly,0);
	ld	hl, #_player + 3
	ld	d,(hl)
	ld	hl, #_player + 2
	ld	b,(hl)
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_erase
	pop	af
	inc	sp
00102$:
;src/draws.h:202: if(temp%2 == 1 && enemy.life > 0)
	ld	a,(#_temp + 0)
	and	a, #0x01
	dec	a
	jr	NZ,00104$
	ld	a, (#_enemy + 8)
	or	a, a
	jr	Z,00104$
;src/draws.h:203: erase(enemy.lx,enemy.ly,0);
	ld	hl, #_enemy + 3
	ld	d,(hl)
	ld	hl, #_enemy + 2
	ld	b,(hl)
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_erase
	pop	af
	inc	sp
00104$:
;src/draws.h:204: if(arrow == 1){
	ld	a,(#_arrow + 0)
	dec	a
	ret	NZ
;src/draws.h:205: if(object.dir == 4 || object.dir == 6)
	ld	hl, #_object + 7
	ld	e,(hl)
;src/draws.h:206: erase(object.lx,object.ly,2);
	ld	hl, #_object + 3
	ld	d,(hl)
	ld	hl, #_object + 2
	ld	b,(hl)
;src/draws.h:205: if(object.dir == 4 || object.dir == 6)
	ld	a,e
	cp	a,#0x04
	jr	Z,00106$
	sub	a, #0x06
	jr	NZ,00107$
00106$:
;src/draws.h:206: erase(object.lx,object.ly,2);
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_erase
	pop	af
	inc	sp
	jr	00108$
00107$:
;src/draws.h:208: erase(object.lx,object.ly,1);
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_erase
	pop	af
	inc	sp
00108$:
;src/draws.h:209: if(bound == 1) arrow = 0;
	ld	a,(#_bound + 0)
	dec	a
	ret	NZ
	ld	hl,#_arrow + 0
	ld	(hl), #0x00
	ret
;src/draws.h:216: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/draws.h:218: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/draws.h:219: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/draws.h:220: if(atk > 30 || atk <= 20){
	ld	a,#0x14
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
;src/draws.h:222: switch(col){
	ld	a,#0x02
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	-2 (ix),a
;src/draws.h:220: if(atk > 30 || atk <= 20){
	ld	a,#0x1E
	sub	a, 4 (ix)
	jr	C,00107$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
00107$:
;src/draws.h:221: memptr = cpct_getScreenPtr(VMEM,28,192);
	ld	hl,#0xC01C
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:222: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00108$
;src/draws.h:224: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/draws.h:222: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00156$
	add	hl,de
	add	hl,de
;src/draws.h:223: case 0:
	jp	(hl)
00156$:
	jr	00103$
	jr	00104$
	jr	00105$
00103$:
;src/draws.h:224: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/draws.h:225: break;
	jr	00108$
;src/draws.h:226: case 1:
00104$:
;src/draws.h:227: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:228: break;
	jr	00108$
;src/draws.h:229: case 2:
00105$:
;src/draws.h:230: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:231: }
00108$:
;src/draws.h:233: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00114$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00115$
00114$:
;src/draws.h:234: memptr = cpct_getScreenPtr(VMEM,31,192);
	ld	hl,#0xC01F
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:235: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00115$
;src/draws.h:224: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/draws.h:235: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00157$
	add	hl,de
	add	hl,de
;src/draws.h:236: case 0:
	jp	(hl)
00157$:
	jr	00110$
	jr	00111$
	jr	00112$
00110$:
;src/draws.h:237: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/draws.h:238: break;
	jr	00115$
;src/draws.h:239: case 1:
00111$:
;src/draws.h:240: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:241: break;
	jr	00115$
;src/draws.h:242: case 2:
00112$:
;src/draws.h:243: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:244: }
00115$:
;src/draws.h:246: if(atk <= 20){
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00122$
;src/draws.h:247: memptr = cpct_getScreenPtr(VMEM,34,192);
	ld	hl,#0xC022
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:224: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/draws.h:248: switch(col){
	ld	a,5 (ix)
	or	a, a
	jr	Z,00117$
	ld	a,5 (ix)
	sub	a, #0x02
	jr	Z,00118$
	jr	00122$
;src/draws.h:249: case 0:
00117$:
;src/draws.h:250: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/draws.h:251: break;
	jr	00122$
;src/draws.h:252: case 2:
00118$:
;src/draws.h:253: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:254: }
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/draws.h:259: void drawPickUps(u8 corazon, u8 bullet){
;	---------------------------------
; Function drawPickUps
; ---------------------------------
_drawPickUps::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/draws.h:262: memptr = cpct_getScreenPtr(VMEM, originsu[map-1][0],originsu[map-1][1] );
	ld	bc,#_originsu+0
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	pop	iy
	push	iy
	pop	hl
	inc	hl
	ld	d,(hl)
	ld	a, 0 (iy)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/draws.h:264: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ex	de,hl
;src/draws.h:263: if(corazon == 0)
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00102$
;src/draws.h:264: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	push	bc
	ld	hl,#0x0804
	push	hl
	push	de
	ld	hl,#_corazon_lleno
	push	hl
	call	_cpct_drawSpriteMasked
	pop	bc
	jr	00103$
00102$:
;src/draws.h:266: cpct_drawSolidBox(memptr, 0, 4, 8);
	push	bc
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
	pop	bc
00103$:
;src/draws.h:268: memptr = cpct_getScreenPtr(VMEM, originsu[map-1][2],originsu[map-1][3]);
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl,bc
	ld	e,l
	ld	d,h
	inc	hl
	inc	hl
	inc	hl
	ld	b,(hl)
	ex	de,hl
	inc	hl
	inc	hl
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:264: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ex	de,hl
;src/draws.h:269: if(bullet == 0)
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00105$
;src/draws.h:270: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
	ld	bc,#_flecha_arriba
	ld	hl,#0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00107$
00105$:
;src/draws.h:272: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/ia.h:30: void movement(u8 dir){
;	---------------------------------
; Function movement
; ---------------------------------
_movement::
;src/ia.h:31: switch(dir){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x02
	jr	Z,00104$
	ld	a,0 (iy)
	sub	a, #0x04
	jr	Z,00102$
	ld	a,0 (iy)
	sub	a, #0x06
	jr	Z,00101$
	ld	a,0 (iy)
	sub	a, #0x08
	jr	Z,00103$
	ret
;src/ia.h:32: case 6: enemy.x += 1; break;
00101$:
	ld	hl,#_enemy+0
	inc	(hl)
	ret
;src/ia.h:33: case 4: enemy.x -= 1; break;
00102$:
	ld	de,#_enemy+0
	ld	a,(de)
	add	a,#0xFF
	ld	(de),a
	ret
;src/ia.h:34: case 8: enemy.y -= 2; break;
00103$:
	ld	de,#_enemy+1
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
	ret
;src/ia.h:35: case 2: enemy.y += 2; break;
00104$:
	ld	hl,#_enemy+1
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
;src/ia.h:36: }
	ret
;src/ia.h:39: void followPlayer(){
;	---------------------------------
; Function followPlayer
; ---------------------------------
_followPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-31
	add	hl,sp
	ld	sp,hl
;src/ia.h:42: if(detectPlayerRoom(player.x,player.y) != enemy.room){
	ld	hl, #(_player + 0x0001) + 0
	ld	d,(hl)
	ld	a, (#_player + 0)
	push	de
	inc	sp
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	ld	-29 (ix),l
	ld	hl, #_enemy + 10
	ld	a,-29 (ix)
	sub	a,(hl)
	jr	Z,00102$
;src/ia.h:43: auxX = enemy.seenX;
	ld	a,(#_enemy + 11)
	ld	-30 (ix),a
;src/ia.h:44: auxY = enemy.seenY;
	ld	a,(#_enemy + 12)
	ld	-31 (ix),a
	jr	00103$
00102$:
;src/ia.h:46: auxX = player.x;
	ld	a,(#_player + 0)
	ld	-30 (ix),a
;src/ia.h:47: auxY = player.y;
	ld	a,(#(_player + 0x0001) + 0)
	ld	-31 (ix),a
00103$:
;src/ia.h:49: if(auxX < enemy.x){
	ld	a,(#_enemy + 0)
;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
	ld	-29 (ix), a
	ld	-28 (ix),a
	ld	-27 (ix),#0x00
	ld	a,-28 (ix)
	add	a, #0x02
	ld	-24 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-29 (ix)
	rrca
	rrca
	and	a,#0x3F
	ld	-3 (ix),a
;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
	ld	a,(#(_enemy + 0x0001) + 0)
	ld	-12 (ix),a
	ld	a,-28 (ix)
	add	a,#0xFF
	ld	-22 (ix),a
	ld	a,-27 (ix)
	adc	a,#0xFF
	ld	-21 (ix),a
	ld	a,-12 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	-2 (ix),a
	ld	a,-21 (ix)
	rlca
	and	a,#0x01
	ld	-11 (ix),a
;src/ia.h:53: }else if(auxY < enemy.y){
	ld	a,-31 (ix)
	sub	a, -12 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
;src/ia.h:55: enemy.y-=1;
	ld	a,-12 (ix)
	add	a,#0xFF
	ld	-19 (ix),a
;src/ia.h:58: enemy.y+=1;
	ld	a,-12 (ix)
	inc	a
	ld	-20 (ix),a
;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
	ld	a,-12 (ix)
	ld	-14 (ix),a
	ld	-13 (ix),#0x00
;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
	ld	c,-2 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-10 (ix),l
	ld	-9 (ix),h
;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-14 (ix)
	add	a,#0xFF
	ld	-5 (ix),a
	ld	a,-13 (ix)
	adc	a,#0xFF
	ld	-4 (ix),a
	ld	a,-14 (ix)
	add	a, #0x0E
	ld	-8 (ix),a
	ld	a,-13 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
	ld	a,-14 (ix)
	add	a, #0x10
	ld	-26 (ix),a
	ld	a,-13 (ix)
	adc	a, #0x00
	ld	-25 (ix),a
	ld	a,-14 (ix)
	add	a, #0x1F
	ld	-14 (ix),a
	ld	a,-13 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-4 (ix)
	rlca
	and	a,#0x01
	ld	-2 (ix),a
;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
	ld	a,-25 (ix)
	rlca
	and	a,#0x01
	ld	-12 (ix),a
;src/ia.h:49: if(auxX < enemy.x){
	ld	a,-30 (ix)
	sub	a, -29 (ix)
	jp	NC,00137$
;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
	ld	a,-10 (ix)
	add	a, #<(_scene)
	ld	-16 (ix),a
	ld	a,-9 (ix)
	adc	a, #>(_scene)
	ld	-15 (ix),a
	ld	a,-22 (ix)
	ld	-18 (ix),a
	ld	a,-21 (ix)
	ld	-17 (ix),a
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00141$
	ld	a,-24 (ix)
	ld	-18 (ix),a
	ld	a,-23 (ix)
	ld	-17 (ix),a
00141$:
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	ld	a,-16 (ix)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,-15 (ix)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	dec	a
	jp	Z,00112$
;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
	ld	a,-26 (ix)
	ld	-18 (ix),a
	ld	a,-25 (ix)
	ld	-17 (ix),a
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00142$
	ld	a,-14 (ix)
	ld	-18 (ix),a
	ld	a,-13 (ix)
	ld	-17 (ix),a
00142$:
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	ld	c,-18 (ix)
	ld	b,-17 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	a,#<(_scene)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#>(_scene)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-22 (ix)
	ld	-16 (ix),a
	ld	a,-21 (ix)
	ld	-15 (ix),a
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00143$
	ld	a,-24 (ix)
	ld	-16 (ix),a
	ld	a,-23 (ix)
	ld	-15 (ix),a
00143$:
	sra	-15 (ix)
	rr	-16 (ix)
	sra	-15 (ix)
	rr	-16 (ix)
	ld	a,-18 (ix)
	add	a, -16 (ix)
	ld	-18 (ix),a
	ld	a,-17 (ix)
	adc	a, -15 (ix)
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	dec	a
	jr	Z,00112$
;src/ia.h:52: enemy.x-=1;
	ld	d,-29 (ix)
	dec	d
	ld	hl,#_enemy
	ld	(hl),d
	jp	00139$
00112$:
;src/ia.h:53: }else if(auxY < enemy.y){
	ld	a,-1 (ix)
	or	a, a
	jp	Z,00109$
;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-5 (ix)
	ld	-18 (ix),a
	ld	a,-4 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00144$
	ld	a,-8 (ix)
	ld	-18 (ix),a
	ld	a,-7 (ix)
	ld	-17 (ix),a
00144$:
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	ld	c,-18 (ix)
	ld	b,-17 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	a,#<(_scene)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#>(_scene)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-3 (ix)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#0x00
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	dec	a
	jp	Z,00139$
;src/ia.h:55: enemy.y-=1;
	ld	hl,#(_enemy + 0x0001)
	ld	a,-19 (ix)
	ld	(hl),a
	jp	00139$
00109$:
;src/ia.h:57: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-26 (ix)
	ld	-18 (ix),a
	ld	a,-25 (ix)
	ld	-17 (ix),a
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00145$
	ld	a,-14 (ix)
	ld	-18 (ix),a
	ld	a,-13 (ix)
	ld	-17 (ix),a
00145$:
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	ld	c,-18 (ix)
	ld	b,-17 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	a,#<(_scene)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#>(_scene)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-3 (ix)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#0x00
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	dec	a
	jp	Z,00139$
;src/ia.h:58: enemy.y+=1;
	ld	hl,#(_enemy + 0x0001)
	ld	a,-20 (ix)
	ld	(hl),a
	jp	00139$
00137$:
;src/ia.h:60: }else if(auxX > enemy.x){
	ld	a,-29 (ix)
	sub	a, -30 (ix)
	jp	NC,00134$
;src/ia.h:61: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
	ld	a,#<(_scene)
	add	a, -10 (ix)
	ld	-18 (ix),a
	ld	a,#>(_scene)
	adc	a, -9 (ix)
	ld	-17 (ix),a
	ld	a,-28 (ix)
	add	a, #0x04
	ld	-16 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
	ld	a,-16 (ix)
	ld	-10 (ix),a
	ld	a,-15 (ix)
	ld	-9 (ix),a
	ld	a,-15 (ix)
	rlca
	and	a,#0x01
	ld	-6 (ix),a
	ld	a,-28 (ix)
	add	a, #0x07
	ld	-28 (ix),a
	ld	a,-27 (ix)
	adc	a, #0x00
	ld	-27 (ix),a
	ld	a,-6 (ix)
	or	a, a
	jr	Z,00146$
	ld	a,-28 (ix)
	ld	-10 (ix),a
	ld	a,-27 (ix)
	ld	-9 (ix),a
00146$:
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-18 (ix)
	ld	d,-17 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00123$
;src/ia.h:62: && scene[(enemy.y+tileheight)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
	ld	a,-26 (ix)
	ld	-10 (ix),a
	ld	a,-25 (ix)
	ld	-9 (ix),a
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00147$
	ld	a,-14 (ix)
	ld	-10 (ix),a
	ld	a,-13 (ix)
	ld	-9 (ix),a
00147$:
	sra	-9 (ix)
	rr	-10 (ix)
	sra	-9 (ix)
	rr	-10 (ix)
	sra	-9 (ix)
	rr	-10 (ix)
	sra	-9 (ix)
	rr	-10 (ix)
	ld	c,-10 (ix)
	ld	b,-9 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	a,#<(_scene)
	add	a, -10 (ix)
	ld	-10 (ix),a
	ld	a,#>(_scene)
	adc	a, -9 (ix)
	ld	-9 (ix),a
	ld	a,-6 (ix)
	or	a, a
	jr	Z,00148$
	ld	a,-28 (ix)
	ld	-16 (ix),a
	ld	a,-27 (ix)
	ld	-15 (ix),a
00148$:
	sra	-15 (ix)
	rr	-16 (ix)
	sra	-15 (ix)
	rr	-16 (ix)
	ld	a,-10 (ix)
	add	a, -16 (ix)
	ld	-16 (ix),a
	ld	a,-9 (ix)
	adc	a, -15 (ix)
	ld	-15 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	ld	-6 (ix), a
	dec	a
	jr	Z,00123$
;src/ia.h:63: enemy.x+=1;
	ld	a,-29 (ix)
	inc	a
	ld	(#_enemy),a
	jp	00139$
00123$:
;src/ia.h:64: }else if(auxY < enemy.y){
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00120$
;src/ia.h:65: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
	ld	a,-22 (ix)
	ld	-16 (ix),a
	ld	a,-21 (ix)
	ld	-15 (ix),a
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00149$
	ld	a,-24 (ix)
	ld	-16 (ix),a
	ld	a,-23 (ix)
	ld	-15 (ix),a
00149$:
	sra	-15 (ix)
	rr	-16 (ix)
	sra	-15 (ix)
	rr	-16 (ix)
	ld	a,-16 (ix)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,-15 (ix)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-6 (ix), a
	dec	a
	jp	Z,00139$
;src/ia.h:66: enemy.y-=1;
	ld	hl,#(_enemy + 0x0001)
	ld	a,-19 (ix)
	ld	(hl),a
	jp	00139$
00120$:
;src/ia.h:68: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-26 (ix)
	ld	-18 (ix),a
	ld	a,-25 (ix)
	ld	-17 (ix),a
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00150$
	ld	a,-14 (ix)
	ld	-18 (ix),a
	ld	a,-13 (ix)
	ld	-17 (ix),a
00150$:
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	ld	c,-18 (ix)
	ld	b,-17 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	a,#<(_scene)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#>(_scene)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-18 (ix)
	add	a, -3 (ix)
	ld	-18 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-6 (ix), a
	dec	a
	jp	Z,00139$
;src/ia.h:69: enemy.y+=1;
	ld	hl,#(_enemy + 0x0001)
	ld	a,-20 (ix)
	ld	(hl),a
	jp	00139$
00134$:
;src/ia.h:73: if(auxY < enemy.y){
	ld	a,-1 (ix)
	or	a, a
	jp	Z,00131$
;src/ia.h:74: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-5 (ix)
	ld	-18 (ix),a
	ld	a,-4 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00151$
	ld	a,-8 (ix)
	ld	-18 (ix),a
	ld	a,-7 (ix)
	ld	-17 (ix),a
00151$:
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	ld	c,-18 (ix)
	ld	b,-17 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	a,#<(_scene)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#>(_scene)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-18 (ix)
	add	a, -3 (ix)
	ld	-18 (ix),a
	ld	a,-17 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-6 (ix), a
	dec	a
	jp	Z,00139$
;src/ia.h:75: enemy.y-=1;
	ld	hl,#(_enemy + 0x0001)
	ld	a,-19 (ix)
	ld	(hl),a
	jp	00139$
00131$:
;src/ia.h:77: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
	ld	a,-26 (ix)
	ld	-18 (ix),a
	ld	a,-25 (ix)
	ld	-17 (ix),a
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00152$
	ld	a,-14 (ix)
	ld	-18 (ix),a
	ld	a,-13 (ix)
	ld	-17 (ix),a
00152$:
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	sra	-17 (ix)
	rr	-18 (ix)
	ld	c,-18 (ix)
	ld	b,-17 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	a,#<(_scene)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#>(_scene)
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-3 (ix)
	add	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#0x00
	adc	a, -17 (ix)
	ld	-17 (ix),a
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,(hl)
	ld	-6 (ix), a
	dec	a
	jr	Z,00139$
;src/ia.h:78: enemy.y+=1;
	ld	hl,#(_enemy + 0x0001)
	ld	a,-20 (ix)
	ld	(hl),a
00139$:
	ld	sp, ix
	pop	ix
	ret
;src/ia.h:83: void patrol(){
;	---------------------------------
; Function patrol
; ---------------------------------
_patrol::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;src/ia.h:84: movement(enemy.dir);
	ld	a, (#(_enemy + 0x0009) + 0)
	push	af
	inc	sp
	call	_movement
	inc	sp
;src/ia.h:86: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
	ld	a,(#_enemy + 1)
	ld	-10 (ix), a
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
	ld	-12 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-11 (ix),a
	ld	a,(#_enemy + 0)
	ld	-4 (ix), a
	rrca
	rrca
	and	a,#0x3F
	ld	-7 (ix),a
	ld	a,-12 (ix)
	add	a, -7 (ix)
	ld	e,a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,(#_enemy + 10)
	ld	-3 (ix),a
	ld	a,(de)
	ld	d,a
	ld	a,-3 (ix)
	sub	a, d
	jp	NZ,00106$
;src/ia.h:87: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
	ld	e,-4 (ix)
	ld	d,#0x00
	ld	hl,#0x0003
	add	hl,de
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	a,-9 (ix)
	ld	-2 (ix),a
	ld	a,-8 (ix)
	ld	-1 (ix),a
	ld	a,-8 (ix)
	rlca
	and	a,#0x01
	ld	-4 (ix),a
	ld	hl,#0x0006
	add	hl,de
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00113$
	ld	a,-6 (ix)
	ld	-2 (ix),a
	ld	a,-5 (ix)
	ld	-1 (ix),a
00113$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	pop	de
	push	de
	add	hl,de
	ld	a,-3 (ix)
	sub	a,(hl)
	jp	NZ,00106$
;src/ia.h:88: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
	ld	e,-10 (ix)
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
	ld	-2 (ix),a
	ld	a,e
	add	a, #0x1D
	ld	-12 (ix),a
	ld	a,d
	adc	a, #0x00
	ld	-11 (ix),a
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00114$
	pop	hl
	push	hl
00114$:
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
	ld	e,-7 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,-3 (ix)
	sub	a,(hl)
	jr	NZ,00106$
;src/ia.h:89: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00115$
	pop	bc
	push	bc
00115$:
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
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-1 (ix),a
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00116$
	ld	e,-6 (ix)
	ld	d,-5 (ix)
00116$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,de
	ld	a,-3 (ix)
	sub	a,(hl)
	jr	Z,00111$
00106$:
;src/ia.h:91: switch(enemy.dir){
	ld	a,(#(_enemy + 0x0009) + 0)
	cp	a,#0x02
	jr	Z,00103$
	cp	a,#0x04
	jr	Z,00101$
	cp	a,#0x06
	jr	Z,00102$
	sub	a, #0x08
	jr	Z,00104$
	jr	00111$
;src/ia.h:92: case 4:
00101$:
;src/ia.h:93: movement(6);
	ld	a,#0x06
	push	af
	inc	sp
	call	_movement
	inc	sp
;src/ia.h:94: break;
	jr	00111$
;src/ia.h:95: case 6:
00102$:
;src/ia.h:96: movement(4);
	ld	a,#0x04
	push	af
	inc	sp
	call	_movement
	inc	sp
;src/ia.h:97: break;
	jr	00111$
;src/ia.h:98: case 2:
00103$:
;src/ia.h:99: movement(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_movement
	inc	sp
;src/ia.h:100: break;
	jr	00111$
;src/ia.h:101: case 8:
00104$:
;src/ia.h:102: movement(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_movement
	inc	sp
;src/ia.h:104: }
00111$:
	ld	sp, ix
	pop	ix
	ret
;src/ia.h:108: void move(){
;	---------------------------------
; Function move
; ---------------------------------
_move::
;src/ia.h:110: if(temp > 10){
	ld	a,#0x0A
	ld	iy,#_temp
	sub	a, 0 (iy)
	jr	NC,00117$
;src/ia.h:111: following = detectPlayerRoom(player.x,player.y);
	ld	hl, #_player + 1
	ld	d,(hl)
	ld	a, (#_player + 0)
	push	de
	inc	sp
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	ld	iy,#_following
	ld	0 (iy),l
;src/ia.h:112: if(following == enemy.room || enemy.pursue != 0){
	ld	hl, #_enemy + 10
	ld	c,(hl)
	ld	de,#_enemy + 13
	ld	a,(de)
	ld	b,a
	ld	a,(#_following + 0)
	sub	a, c
	jr	Z,00106$
	ld	a,b
	or	a, a
	jr	Z,00107$
00106$:
;src/ia.h:113: if(enemy.pursue == 0)
	ld	a,b
	or	a, a
	jr	NZ,00104$
;src/ia.h:114: enemy.pursue = 4;
	ld	a,#0x04
	ld	(de),a
	jr	00118$
00104$:
;src/ia.h:115: else if(enemy.pursue > 1)
	ld	a,#0x01
	sub	a, b
	jr	NC,00118$
;src/ia.h:116: enemy.pursue -=1;
	dec	b
	ld	a,b
	ld	(de),a
	jr	00118$
00107$:
;src/ia.h:118: enemy.dir = chooseDirection();
	call	_chooseDirection
	ld	a,l
	ld	(#(_enemy + 0x0009)),a
	jr	00118$
00117$:
;src/ia.h:121: if(enemy.pursue >= 1){
	ld	de,#_enemy + 13
	ld	a,(de)
	sub	a, #0x01
	jr	C,00114$
;src/ia.h:122: followPlayer();
	push	de
	call	_followPlayer
	pop	de
;src/ia.h:123: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
	ld	hl, #_enemy + 11
	ld	b,(hl)
	ld	hl, #_enemy + 0
	ld	c,(hl)
	ld	a,b
	sub	a, c
	jr	NZ,00118$
	ld	hl, #_enemy + 12
	ld	b,(hl)
	ld	hl, #_enemy + 1
	ld	c,(hl)
	ld	a,b
	sub	a, c
	jr	NZ,00118$
;src/ia.h:124: enemy.pursue = 0;
	xor	a, a
	ld	(de),a
	jr	00118$
00114$:
;src/ia.h:126: patrol();
	call	_patrol
00118$:
;src/ia.h:129: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
	ld	hl, #_enemy + 3
	ld	d,(hl)
	ld	a, (#_enemy + 2)
	push	de
	inc	sp
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	ld	d,l
	ld	hl, #(_player + 0x0001) + 0
	ld	b,(hl)
	ld	a, (#_player + 0)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	ld	b,l
	pop	de
	ld	a,d
	sub	a, b
	jr	Z,00119$
	ld	hl, #_enemy + 13
	ld	h,(hl)
	ld	a,#0x01
	sub	a, h
	ret	NC
00119$:
;src/ia.h:130: enemy.seenX = player.x;
	ld	a, (#_player + 0)
	ld	hl,#(_enemy + 0x000b)
	ld	(hl),a
;src/ia.h:131: enemy.seenY = player.y;
	ld	a, (#(_player + 0x0001) + 0)
	ld	(#(_enemy + 0x000c)),a
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
;src/CalcColision.h:14: switch(atk){
	ld	a,8 (ix)
	sub	a, #0x15
	jr	Z,00101$
	ld	a,8 (ix)
	sub	a, #0x16
	jr	Z,00102$
	jr	00103$
;src/CalcColision.h:15: case 21:
00101$:
;src/CalcColision.h:16: auxX = 2;
	ld	e,#0x02
;src/CalcColision.h:17: auxY = 8;
	ld	c,#0x08
;src/CalcColision.h:18: break;
	jr	00104$
;src/CalcColision.h:19: case 22:
00102$:
;src/CalcColision.h:20: auxX = 4;
	ld	e,#0x04
;src/CalcColision.h:21: auxY = 4;
	ld	c,#0x04
;src/CalcColision.h:22: break;
	jr	00104$
;src/CalcColision.h:23: default:
00103$:
;src/CalcColision.h:24: auxX = tilewidth;
	ld	e,#0x04
;src/CalcColision.h:25: auxY = tileheight;
	ld	c,#0x10
;src/CalcColision.h:26: }
00104$:
;src/CalcColision.h:27: popX = pX + auxX;
	ld	a,4 (ix)
	add	a, e
	ld	l,a
;src/CalcColision.h:28: popY = pY + auxY;
	ld	a,5 (ix)
	add	a, c
	ld	-6 (ix),a
;src/CalcColision.h:29: eopX = eX + auxX;
	ld	a,6 (ix)
	add	a, e
	ld	e,a
;src/CalcColision.h:30: eopY = eY + auxY;
	ld	a,7 (ix)
	add	a, c
	ld	-5 (ix),a
;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
	ld	a,e
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-4 (ix),a
	ld	a,l
	sub	a, e
	ld	a,#0x00
	rla
	ld	-3 (ix),a
	ld	a,7 (ix)
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	e,a
	ld	a,-6 (ix)
	sub	a, 7 (ix)
	ld	a,#0x00
	rla
	ld	c,a
;src/CalcColision.h:33: if(atk >= 21)
	ld	a,8 (ix)
	sub	a, #0x15
	ld	a,#0x00
	rla
	ld	-1 (ix),a
;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
	ld	a,-4 (ix)
	or	a, a
	jr	NZ,00109$
	ld	a,-3 (ix)
	or	a,a
	jr	NZ,00109$
	or	a,e
	jr	NZ,00109$
	or	a,c
	jr	NZ,00109$
;src/CalcColision.h:33: if(atk >= 21)
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00106$
;src/CalcColision.h:34: return 1;
	ld	l,#0x01
	jp	00137$
00106$:
;src/CalcColision.h:36: return 2;
	ld	l,#0x02
	jp	00137$
00109$:
;src/CalcColision.h:38: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
	ld	a,6 (ix)
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-2 (ix),a
	ld	a,l
	sub	a, 6 (ix)
	ld	a,#0x00
	rla
	ld	l,a
	ld	a,-2 (ix)
	or	a,a
	jr	NZ,00117$
	or	a,l
	jr	NZ,00117$
	or	a,e
	jr	NZ,00117$
	or	a,c
	jr	NZ,00117$
;src/CalcColision.h:39: if(atk >= 21)
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00114$
;src/CalcColision.h:40: return 1;
	ld	l,#0x01
	jr	00137$
00114$:
;src/CalcColision.h:42: return 2;
	ld	l,#0x02
	jr	00137$
00117$:
;src/CalcColision.h:44: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
	ld	a,-5 (ix)
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	e,a
	ld	a,-6 (ix)
	sub	a, -5 (ix)
	ld	a,#0x00
	rla
	ld	h,a
	ld	a,-2 (ix)
	or	a,a
	jr	NZ,00125$
	or	a,l
	jr	NZ,00125$
	or	a,e
	jr	NZ,00125$
	or	a,h
	jr	NZ,00125$
;src/CalcColision.h:45: if(atk >= 21)
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00122$
;src/CalcColision.h:46: return 1;
	ld	l,#0x01
	jr	00137$
00122$:
;src/CalcColision.h:48: return 2;
	ld	l,#0x02
	jr	00137$
00125$:
;src/CalcColision.h:50: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
	ld	a,-4 (ix)
	or	a, a
	jr	NZ,00133$
	ld	a,-3 (ix)
	or	a,a
	jr	NZ,00133$
	or	a,e
	jr	NZ,00133$
	or	a,h
	jr	NZ,00133$
;src/CalcColision.h:51: if(atk >= 21)
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00130$
;src/CalcColision.h:52: return 1;
	ld	l,#0x01
	jr	00137$
00130$:
;src/CalcColision.h:54: return 2;
	ld	l,#0x02
	jr	00137$
00133$:
;src/CalcColision.h:56: return 0;
	ld	l,#0x00
00137$:
	ld	sp, ix
	pop	ix
	ret
;src/CalcColision.h:60: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
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
;src/CalcColision.h:61: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
	ld	a,(#(_player + 0x0001) + 0)
	ld	-18 (ix), a
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
	ld	a,(#_player + 0)
	ld	-19 (ix), a
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
;src/CalcColision.h:66: player.x=player.lx;
;src/CalcColision.h:67: player.y=player.ly;
;src/CalcColision.h:61: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
	ld	-13 (ix), a
	dec	a
	jp	Z,00129$
;src/CalcColision.h:62: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
	ld	e,-19 (ix)
	ld	d,#0x00
	ld	hl,#0x0003
	add	hl,de
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	a,-10 (ix)
	ld	-3 (ix),a
	ld	a,-9 (ix)
	ld	-2 (ix),a
	ld	a,-9 (ix)
	rlca
	and	a,#0x01
	ld	-19 (ix),a
	ld	hl,#0x0006
	add	hl,de
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00137$
	ld	a,-5 (ix)
	ld	-3 (ix),a
	ld	a,-4 (ix)
	ld	-2 (ix),a
00137$:
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00129$
;src/CalcColision.h:63: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
	ld	a,-18 (ix)
	ld	-3 (ix),a
	ld	-2 (ix),#0x00
	ld	a,-3 (ix)
	add	a, #0x0E
	ld	-15 (ix),a
	ld	a,-2 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	a,-15 (ix)
	ld	-12 (ix),a
	ld	a,-14 (ix)
	ld	-11 (ix),a
	ld	a,-14 (ix)
	rlca
	and	a,#0x01
	ld	-18 (ix),a
	ld	a,-3 (ix)
	add	a, #0x1D
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00138$
	ld	a,-3 (ix)
	ld	-12 (ix),a
	ld	a,-2 (ix)
	ld	-11 (ix),a
00138$:
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	ld	c,-12 (ix)
	ld	b,-11 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,#<(_scene)
	add	a, -12 (ix)
	ld	-12 (ix),a
	ld	a,#>(_scene)
	adc	a, -11 (ix)
	ld	-11 (ix),a
	ld	a,-12 (ix)
	add	a, -1 (ix)
	ld	-12 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	dec	a
	jp	Z,00129$
;src/CalcColision.h:64: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
	ld	a,-15 (ix)
	ld	-12 (ix),a
	ld	a,-14 (ix)
	ld	-11 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00139$
	ld	a,-3 (ix)
	ld	-12 (ix),a
	ld	a,-2 (ix)
	ld	-11 (ix),a
00139$:
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	ld	c,-12 (ix)
	ld	b,-11 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,#<(_scene)
	add	a, -12 (ix)
	ld	-12 (ix),a
	ld	a,#>(_scene)
	adc	a, -11 (ix)
	ld	-11 (ix),a
	ld	a,-10 (ix)
	ld	-17 (ix),a
	ld	a,-9 (ix)
	ld	-16 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00140$
	ld	a,-5 (ix)
	ld	-17 (ix),a
	ld	a,-4 (ix)
	ld	-16 (ix),a
00140$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	a,-12 (ix)
	add	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-11 (ix)
	adc	a, -16 (ix)
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	dec	a
	jr	NZ,00130$
00129$:
;src/CalcColision.h:66: player.x=player.lx;
	ld	a, (#(_player + 0x0002) + 0)
	ld	hl,#_player
	ld	(hl),a
;src/CalcColision.h:67: player.y=player.ly;
	ld	a, (#(_player + 0x0003) + 0)
	ld	(#(_player + 0x0001)),a
	jp	00135$
00130$:
;src/CalcColision.h:69: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
	ld	a,-13 (ix)
	sub	a, #0x02
	jp	Z,00123$
;src/CalcColision.h:70: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
	ld	a,-10 (ix)
	ld	-17 (ix),a
	ld	a,-9 (ix)
	ld	-16 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00141$
	ld	a,-5 (ix)
	ld	-17 (ix),a
	ld	a,-4 (ix)
	ld	-16 (ix),a
00141$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	a,-7 (ix)
	add	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-6 (ix)
	adc	a, -16 (ix)
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	sub	a, #0x02
	jp	Z,00123$
;src/CalcColision.h:71: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
	ld	a,-15 (ix)
	ld	-17 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00142$
	ld	a,-3 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	ld	-16 (ix),a
00142$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	c,-17 (ix)
	ld	b,-16 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	a,#<(_scene)
	add	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,#>(_scene)
	adc	a, -16 (ix)
	ld	-16 (ix),a
	ld	a,-17 (ix)
	add	a, -1 (ix)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	sub	a, #0x02
	jp	Z,00123$
;src/CalcColision.h:72: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
	ld	a,-15 (ix)
	ld	-17 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00143$
	ld	a,-3 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	ld	-16 (ix),a
00143$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	c,-17 (ix)
	ld	b,-16 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	a,#<(_scene)
	add	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,#>(_scene)
	adc	a, -16 (ix)
	ld	-16 (ix),a
	ld	a,-10 (ix)
	ld	-12 (ix),a
	ld	a,-9 (ix)
	ld	-11 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00144$
	ld	a,-5 (ix)
	ld	-12 (ix),a
	ld	a,-4 (ix)
	ld	-11 (ix),a
00144$:
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	ld	a,-17 (ix)
	add	a, -12 (ix)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a, -11 (ix)
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00124$
00123$:
;src/CalcColision.h:74: if(player.life < 3 && *corazon == 0){
	ld	a,(#(_player + 0x0006) + 0)
	ld	-17 (ix), a
	sub	a, #0x03
	jp	NC,00135$
	ld	a,4 (ix)
	ld	-12 (ix),a
	ld	a,5 (ix)
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	ld	-8 (ix), a
	or	a, a
	jp	NZ,00135$
;src/CalcColision.h:75: player.life += 1;
	ld	a,-17 (ix)
	inc	a
	ld	(#(_player + 0x0006)),a
;src/CalcColision.h:76: *corazon = 1;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x01
	jp	00135$
00124$:
;src/CalcColision.h:79: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
	ld	a,-13 (ix)
	sub	a, #0x05
	jp	Z,00117$
;src/CalcColision.h:80: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
	ld	a,-10 (ix)
	ld	-17 (ix),a
	ld	a,-9 (ix)
	ld	-16 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00145$
	ld	a,-5 (ix)
	ld	-17 (ix),a
	ld	a,-4 (ix)
	ld	-16 (ix),a
00145$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00117$
;src/CalcColision.h:81: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
	ld	a,-15 (ix)
	ld	-17 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00146$
	ld	a,-3 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	ld	-16 (ix),a
00146$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-1 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00117$
;src/CalcColision.h:82: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
	ld	a,-15 (ix)
	ld	-17 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00147$
	ld	a,-3 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	ld	-16 (ix),a
00147$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-17 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-16 (ix),a
	ld	a,-10 (ix)
	ld	-12 (ix),a
	ld	a,-9 (ix)
	ld	-11 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00148$
	ld	a,-5 (ix)
	ld	-12 (ix),a
	ld	a,-4 (ix)
	ld	-11 (ix),a
00148$:
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	ld	a,-12 (ix)
	add	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-11 (ix)
	adc	a, -16 (ix)
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-8 (ix), a
	sub	a, #0x05
	jr	NZ,00118$
00117$:
;src/CalcColision.h:84: if(player.bullets < 3 && *flecha == 0){
	ld	a,(#(_player + 0x000a) + 0)
	ld	-8 (ix), a
	sub	a, #0x03
	jp	NC,00135$
	ld	a,6 (ix)
	ld	-17 (ix),a
	ld	a,7 (ix)
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00135$
;src/CalcColision.h:85: player.bullets += 1;
	inc	-8 (ix)
	ld	hl,#(_player + 0x000a)
	ld	a,-8 (ix)
	ld	(hl),a
;src/CalcColision.h:86: *flecha = 1;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),#0x01
	jp	00135$
00118$:
;src/CalcColision.h:88: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
	ld	a,-13 (ix)
	sub	a, #0x09
	jp	Z,00112$
;src/CalcColision.h:89: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
	ld	a,-10 (ix)
	ld	-17 (ix),a
	ld	a,-9 (ix)
	ld	-16 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00149$
	ld	a,-5 (ix)
	ld	-17 (ix),a
	ld	a,-4 (ix)
	ld	-16 (ix),a
00149$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	a,-17 (ix)
	add	a, -7 (ix)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a, -6 (ix)
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-8 (ix), a
	sub	a, #0x09
	jp	Z,00112$
;src/CalcColision.h:90: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
	ld	a,-15 (ix)
	ld	-17 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00150$
	ld	a,-3 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	ld	-16 (ix),a
00150$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	c,-17 (ix)
	ld	b,-16 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	a,-17 (ix)
	add	a, #<(_scene)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a, #>(_scene)
	ld	-16 (ix),a
	ld	a,-17 (ix)
	add	a, -1 (ix)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-8 (ix), a
	sub	a, #0x09
	jp	Z,00112$
;src/CalcColision.h:91: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
	ld	a,-15 (ix)
	ld	-17 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00151$
	ld	a,-3 (ix)
	ld	-17 (ix),a
	ld	a,-2 (ix)
	ld	-16 (ix),a
00151$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	c,-17 (ix)
	ld	b,-16 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	a,#<(_scene)
	add	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,#>(_scene)
	adc	a, -16 (ix)
	ld	-16 (ix),a
	ld	a,-10 (ix)
	ld	-12 (ix),a
	ld	a,-9 (ix)
	ld	-11 (ix),a
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00152$
	ld	a,-5 (ix)
	ld	-12 (ix),a
	ld	a,-4 (ix)
	ld	-11 (ix),a
00152$:
	sra	-11 (ix)
	rr	-12 (ix)
	sra	-11 (ix)
	rr	-12 (ix)
	ld	a,-12 (ix)
	add	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,-11 (ix)
	adc	a, -16 (ix)
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-8 (ix), a
	sub	a, #0x09
	jr	NZ,00135$
00112$:
;src/CalcColision.h:94: if(enemy.life == 0){
	ld	a, (#(_enemy + 0x0008) + 0)
	or	a, a
	jr	NZ,00110$
;src/CalcColision.h:95: map+=1;
	ld	hl, #_map+0
	inc	(hl)
;src/CalcColision.h:96: if(map > maps){
	ld	a,#0x04
	ld	iy,#_map
	sub	a, 0 (iy)
	jr	NC,00108$
;src/CalcColision.h:97: endGame();
	call	_endGame
;src/CalcColision.h:98: finish = 1;
	ld	hl,#_finish + 0
	ld	(hl), #0x01
;src/CalcColision.h:99: return;
	jr	00135$
00108$:
;src/CalcColision.h:102: initVariables(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_initVariables
	inc	sp
;src/CalcColision.h:103: restartPlayer(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_restartPlayer
	inc	sp
;src/CalcColision.h:104: initNivel();
	call	_initNivel
;src/CalcColision.h:105: initEnemies(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/CalcColision.h:107: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/CalcColision.h:109: drawMap(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_drawMap
	inc	sp
	jr	00135$
00110$:
;src/CalcColision.h:111: player.x=player.lx;
	ld	a, (#(_player + 0x0002) + 0)
	ld	hl,#_player
	ld	(hl),a
;src/CalcColision.h:112: player.y=player.ly;
	ld	a, (#(_player + 0x0003) + 0)
	ld	(#(_player + 0x0001)),a
00135$:
	ld	sp, ix
	pop	ix
	ret
;src/CalcColision.h:118: u8 checkArrowCollisions(){
;	---------------------------------
; Function checkArrowCollisions
; ---------------------------------
_checkArrowCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;src/CalcColision.h:121: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
	ld	a,(#(_object + 0x0001) + 0)
	ld	-13 (ix), a
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
	ld	-10 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-9 (ix),a
	ld	hl, #_object + 0
	ld	c,(hl)
	ld	a,c
	rrca
	rrca
	and	a,#0x3F
	ld	-14 (ix), a
	add	a, -10 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -9 (ix)
	ld	h,a
	ld	a,(hl)
;src/CalcColision.h:126: object.x=object.lx;
;src/CalcColision.h:127: object.y=object.ly;
;src/CalcColision.h:121: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
	ld	-12 (ix), a
	dec	a
	jp	Z,00101$
;src/CalcColision.h:122: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
	ld	b,#0x00
	ld	hl,#0x0003
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,-4 (ix)
	ld	-6 (ix),a
	ld	a,-3 (ix)
	ld	-5 (ix),a
	ld	a,-3 (ix)
	rlca
	and	a,#0x01
	ld	-11 (ix),a
	ld	hl,#0x0006
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00113$
	ld	a,-2 (ix)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	ld	-5 (ix),a
00113$:
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00101$
;src/CalcColision.h:123: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 1
	ld	e,-13 (ix)
	ld	d,#0x00
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	-6 (ix),c
	ld	-5 (ix),b
	ld	a,b
	rlca
	and	a,#0x01
	ld	-13 (ix),a
	ld	hl,#0x0015
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00114$
	ld	a,-8 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	ld	-5 (ix),a
00114$:
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	ld	e,-14 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00101$
;src/CalcColision.h:124: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
	ld	-6 (ix),c
	ld	-5 (ix),b
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00115$
	ld	a,-8 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	ld	-5 (ix),a
00115$:
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00116$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
00116$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00102$
00101$:
;src/CalcColision.h:126: object.x=object.lx;
	ld	a, (#(_object + 0x0002) + 0)
	ld	(#_object),a
;src/CalcColision.h:127: object.y=object.ly;
	ld	a, (#(_object + 0x0003) + 0)
	ld	(#(_object + 0x0001)),a
;src/CalcColision.h:129: return bound;
	ld	l,#0x01
	jp	00111$
00102$:
;src/CalcColision.h:132: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 9
	ld	a,-12 (ix)
	sub	a, #0x09
	jp	Z,00106$
;src/CalcColision.h:133: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00117$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
00117$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jp	Z,00106$
;src/CalcColision.h:134: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 9
	ld	l, c
	ld	h, b
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00118$
	ld	l,-8 (ix)
	ld	h,-7 (ix)
00118$:
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
	ld	e,-14 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	Z,00106$
;src/CalcColision.h:135: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00119$
	ld	c,-8 (ix)
	ld	b,-7 (ix)
00119$:
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00120$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
00120$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00107$
00106$:
;src/CalcColision.h:137: object.x=object.lx;
	ld	a, (#(_object + 0x0002) + 0)
	ld	(#_object),a
;src/CalcColision.h:138: object.y=object.ly;
	ld	a, (#(_object + 0x0003) + 0)
	ld	(#(_object + 0x0001)),a
;src/CalcColision.h:140: return bound;
	ld	l,#0x01
	jr	00111$
00107$:
;src/CalcColision.h:143: return bound;
	ld	l,#0x00
00111$:
	ld	sp, ix
	pop	ix
	ret
;src/keyboard.h:13: u8* checkKeyboard(){
;	---------------------------------
; Function checkKeyboard
; ---------------------------------
_checkKeyboard::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/keyboard.h:14: u8 *s = NULL;
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	c,l
	ld	a,c
	or	a, a
	jr	Z,00145$
	ld	hl, #(_player + 0x0008) + 0
	ld	a,(hl)
	ld	-4 (ix), a
	sub	a, #0x14
	jr	C,00145$
;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
	ld	a,-4 (ix)
	sub	a, #0x32
	jr	C,00102$
	ld	hl,#(_player + 0x0008)
	ld	(hl),#0x00
	jr	00103$
00102$:
;src/keyboard.h:17: else player.atk += 1;
	ld	a,-4 (ix)
	inc	a
	ld	hl,#(_player + 0x0008)
	ld	(hl),a
00103$:
;src/keyboard.h:18: switch(player.dir){
	ld	hl, #_player + 7
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
;src/keyboard.h:19: case 4:
00104$:
;src/keyboard.h:20: s = gladis_atk_izda;
	ld	-3 (ix),#<(_gladis_atk_izda)
	ld	-2 (ix),#>(_gladis_atk_izda)
;src/keyboard.h:21: break;
	jp	00146$
;src/keyboard.h:22: case 6:
00105$:
;src/keyboard.h:23: s = gladis_atk_dcha;
	ld	-3 (ix),#<(_gladis_atk_dcha)
	ld	-2 (ix),#>(_gladis_atk_dcha)
;src/keyboard.h:24: break;
	jp	00146$
;src/keyboard.h:25: case 8:
00106$:
;src/keyboard.h:26: s = gladis_atk_arriba;
	ld	-3 (ix),#<(_gladis_atk_arriba)
	ld	-2 (ix),#>(_gladis_atk_arriba)
;src/keyboard.h:27: break;
	jp	00146$
;src/keyboard.h:28: case 2:
00107$:
;src/keyboard.h:29: s = gladis_atk_abajo;
	ld	-3 (ix),#<(_gladis_atk_abajo)
	ld	-2 (ix),#>(_gladis_atk_abajo)
;src/keyboard.h:31: }
	jp	00146$
00145$:
;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
	ld	hl, #(_player + 0x0008) + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0x14
	jr	NC,00110$
	inc	d
	ld	hl,#(_player + 0x0008)
	ld	(hl),d
	jr	00111$
00110$:
;src/keyboard.h:34: else player.atk = 20;
	ld	hl,#(_player + 0x0008)
	ld	(hl),#0x14
00111$:
;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
;src/keyboard.h:37: player.dir = 6;
;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
	ld	a,l
	or	a, a
	jr	Z,00141$
	ld	hl, #_player + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00141$
;src/keyboard.h:36: player.x += 1;
	inc	d
	ld	hl,#_player
	ld	(hl),d
;src/keyboard.h:37: player.dir = 6;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x06
;src/keyboard.h:38: s = gladis_quieto_dcha;
	ld	-3 (ix),#<(_gladis_quieto_dcha)
	ld	-2 (ix),#>(_gladis_quieto_dcha)
	jp	00146$
00141$:
;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00137$
	ld	a, (#_player + 0)
	or	a, a
	jr	Z,00137$
;src/keyboard.h:40: player.x -= 1;
	add	a,#0xFF
	ld	(#_player),a
;src/keyboard.h:41: player.dir = 4;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x04
;src/keyboard.h:42: s = gladis_quieto_izda;
	ld	-3 (ix),#<(_gladis_quieto_izda)
	ld	-2 (ix),#>(_gladis_quieto_izda)
	jp	00146$
00137$:
;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00133$
	ld	hl, #(_player + 0x0001) + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0xB4
	jr	NC,00133$
;src/keyboard.h:44: player.y += 2;
	inc	d
	inc	d
	ld	hl,#(_player + 0x0001)
	ld	(hl),d
;src/keyboard.h:45: player.dir = 2;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x02
;src/keyboard.h:46: s = gladis_abajo;
	ld	-3 (ix),#<(_gladis_abajo)
	ld	-2 (ix),#>(_gladis_abajo)
	jp	00146$
00133$:
;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00129$
	ld	a, (#(_player + 0x0001) + 0)
	or	a, a
	jr	Z,00129$
;src/keyboard.h:48: player.y -= 2;
	add	a,#0xFE
	ld	(#(_player + 0x0001)),a
;src/keyboard.h:49: player.dir = 8;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x08
;src/keyboard.h:50: s = gladis_arriba;
	ld	-3 (ix),#<(_gladis_arriba)
	ld	-2 (ix),#>(_gladis_arriba)
	jp	00146$
00129$:
;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	e,l
;src/keyboard.h:53: switch(player.dir){
	ld	hl, #(_player + 0x0007) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, #0x02
	jr	NZ,00278$
	ld	a,#0x01
	jr	00279$
00278$:
	xor	a,a
00279$:
	ld	c,a
	ld	a,l
	sub	a, #0x04
	jr	NZ,00280$
	ld	a,#0x01
	jr	00281$
00280$:
	xor	a,a
00281$:
	ld	-4 (ix),a
	ld	a,l
	sub	a, #0x06
	jr	NZ,00282$
	ld	a,#0x01
	jr	00283$
00282$:
	xor	a,a
00283$:
	ld	-1 (ix),a
	ld	a,l
	sub	a, #0x08
	jr	NZ,00284$
	ld	a,#0x01
	jr	00285$
00284$:
	xor	a,a
00285$:
	ld	-5 (ix),a
;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
	ld	a,e
	or	a, a
	jp	Z,00123$
	ld	a,(#_arrow + 0)
	or	a, a
	jp	NZ,00123$
	ld	a, (#(_player + 0x0008) + 0)
	sub	a, #0x14
	jp	NZ,00123$
	ld	a, (#(_player + 0x000a) + 0)
	or	a, a
	jp	Z,00123$
;src/keyboard.h:52: u8 *spr = flecha_dcha,xs=2,ys=8;
	ld	de,#_flecha_dcha
	ld	-6 (ix),#0x02
	ld	b,#0x08
;src/keyboard.h:53: switch(player.dir){
	ld	a,c
	or	a, a
	jr	NZ,00114$
	ld	a,-4 (ix)
	or	a, a
	jr	NZ,00113$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00112$
	ld	a,-5 (ix)
	or	a, a
	jr	NZ,00115$
	jr	00116$
;src/keyboard.h:54: case 6: spr = flecha_dcha; xs=4;ys=4; break;
00112$:
	ld	de,#_flecha_dcha
	ld	-6 (ix),#0x04
	ld	b,#0x04
	jr	00116$
;src/keyboard.h:55: case 4: spr = flecha_izda; xs=4;ys=4; break;
00113$:
	ld	de,#_flecha_izda+0
	ld	-6 (ix),#0x04
	ld	b,#0x04
	jr	00116$
;src/keyboard.h:56: case 2: spr = flecha_abajo; xs=2;ys=8; break;
00114$:
	ld	de,#_flecha_abajo+0
	ld	-6 (ix),#0x02
	ld	b,#0x08
	jr	00116$
;src/keyboard.h:57: case 8: spr = flecha_arriba; xs=2;ys=8; break;
00115$:
	ld	de,#_flecha_arriba+0
	ld	-6 (ix),#0x02
	ld	b,#0x08
;src/keyboard.h:58: }
00116$:
;src/keyboard.h:59: player.atk = 0;
	ld	hl,#(_player + 0x0008)
	ld	(hl),#0x00
;src/keyboard.h:60: object.x = player.x;
	ld	a, (#_player + 0)
	ld	hl,#_object
	ld	(hl),a
;src/keyboard.h:61: object.y = player.y+8;
	ld	a, (#(_player + 0x0001) + 0)
	add	a, #0x08
	ld	(#(_object + 0x0001)),a
;src/keyboard.h:62: object.x = object.x;
	ld	hl, #_object + 0
	ld	c,(hl)
	ld	hl,#_object
	ld	(hl),c
;src/keyboard.h:63: object.y = object.y;
	ld	(#(_object + 0x0001)),a
;src/keyboard.h:64: object.sprite = spr;
	ld	((_object + 0x0004)), de
;src/keyboard.h:65: object.vivo = 1;
	ld	hl,#_object + 6
	ld	(hl),#0x01
;src/keyboard.h:66: object.dir = player.dir;
	ld	de,#_object + 7
	ld	a, (#(_player + 0x0007) + 0)
	ld	(de),a
;src/keyboard.h:67: object.sizeX = xs;
	ld	hl,#_object + 8
	ld	a,-6 (ix)
	ld	(hl),a
;src/keyboard.h:68: object.sizeY = ys;
	ld	hl,#_object + 9
	ld	(hl),b
;src/keyboard.h:69: player.bullets--;
	ld	a, (#(_player + 0x000a) + 0)
	add	a,#0xFF
	ld	(#(_player + 0x000a)),a
;src/keyboard.h:70: arrow=1;
	ld	hl,#_arrow + 0
	ld	(hl), #0x01
	jr	00146$
00123$:
;src/keyboard.h:72: switch(player.dir){
	ld	a,c
	or	a, a
	jr	NZ,00120$
	ld	a,-4 (ix)
	or	a, a
	jr	NZ,00117$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00118$
	ld	a,-5 (ix)
	or	a, a
	jr	NZ,00119$
	jr	00146$
;src/keyboard.h:73: case 4:
00117$:
;src/keyboard.h:74: s = gladis_quieto_izda;
	ld	-3 (ix),#<(_gladis_quieto_izda)
	ld	-2 (ix),#>(_gladis_quieto_izda)
;src/keyboard.h:75: break;
	jr	00146$
;src/keyboard.h:76: case 6:
00118$:
;src/keyboard.h:77: s = gladis_quieto_dcha;
	ld	-3 (ix),#<(_gladis_quieto_dcha)
	ld	-2 (ix),#>(_gladis_quieto_dcha)
;src/keyboard.h:78: break;
	jr	00146$
;src/keyboard.h:79: case 8:
00119$:
;src/keyboard.h:80: s = gladis_arriba;
	ld	-3 (ix),#<(_gladis_arriba)
	ld	-2 (ix),#>(_gladis_arriba)
;src/keyboard.h:81: break;
	jr	00146$
;src/keyboard.h:82: case 2:
00120$:
;src/keyboard.h:83: s = gladis_abajo;
	ld	-3 (ix),#<(_gladis_abajo)
	ld	-2 (ix),#>(_gladis_abajo)
;src/keyboard.h:85: }
00146$:
;src/keyboard.h:91: if(cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00149$
;src/keyboard.h:92: arrow = 0;
	ld	hl,#_arrow + 0
	ld	(hl), #0x00
00149$:
;src/keyboard.h:94: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00151$
;src/keyboard.h:95: finish = 1;
	ld	hl,#_finish + 0
	ld	(hl), #0x01
00151$:
;src/keyboard.h:97: return s;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/keyboard.h:100: void moveObject(){
;	---------------------------------
; Function moveObject
; ---------------------------------
_moveObject::
;src/keyboard.h:101: object.lx = object.x;
	ld	bc,#_object+0
	ld	a,(bc)
	ld	(#(_object + 0x0002)),a
;src/keyboard.h:102: object.ly = object.y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_object + 0x0003)),a
;src/keyboard.h:103: switch(object.dir){
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
;src/keyboard.h:104: case 6: object.x += 1; break;
00101$:
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
;src/keyboard.h:105: case 4: object.x -= 1; break;
00102$:
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
;src/keyboard.h:106: case 2: object.y += 2; break;
00103$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	ret
;src/keyboard.h:107: case 8: object.y -= 2; break;
00104$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/keyboard.h:108: }
	ret
;src/main.c:40: void gameOver(){
;	---------------------------------
; Function gameOver
; ---------------------------------
_gameOver::
;src/main.c:42: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:43: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:44: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_2+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:46: memptr = cpct_getScreenPtr(VMEM,2,180);
	ld	hl,#0xB402
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:47: cpct_drawStringM0("Pulsa cualquier tecla",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_3+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:49: while(1){
00104$:
;src/main.c:50: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:51: if(cpct_isAnyKeyPressed()) return;
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
	ret
___str_2:
	.ascii "Lounge Gladiator"
	.db 0x00
___str_3:
	.ascii "Pulsa cualquier tecla"
	.db 0x00
;src/main.c:56: int menu(){
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
;src/main.c:58: int init = 50;
	ld	-4 (ix),#0x32
	ld	-3 (ix),#0x00
;src/main.c:59: int pushed =0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:60: int cont =0;
	ld	de,#0x0000
;src/main.c:61: cpct_clearScreen(0);
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
;src/main.c:64: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_4
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
;src/main.c:68: cpct_drawStringM0("Nueva Partida",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_5
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x6E14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:71: cpct_drawStringM0("Creditos",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_6
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x8214
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:74: cpct_drawStringM0("Constroles",memptr,1,0);
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_7
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x9614
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/main.c:64: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:77: cpct_drawStringM0("Salir",memptr,1,0);
	ld	bc,#___str_8
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
;src/main.c:83: while(1){
00120$:
;src/main.c:85: cpct_scanKeyboard();
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
	jp	PO, 00164$
	xor	a, #0x80
00164$:
	jp	P,00102$
;src/main.c:87: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:88: pushed ++;
	inc	-6 (ix)
	jr	NZ,00165$
	inc	-5 (ix)
00165$:
;src/main.c:89: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:91: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
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
	jp	PO, 00166$
	xor	a, #0x80
00166$:
	jp	P,00105$
;src/main.c:92: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:93: pushed --;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
;src/main.c:94: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:97: switch (pushed){
	ld	a,-5 (ix)
	rlca
	and	a,#0x01
	ld	b,a
	ld	a,#0x03
	cp	a, -6 (ix)
	ld	a,#0x00
	sbc	a, -5 (ix)
	jp	PO, 00167$
	xor	a, #0x80
00167$:
	rlca
	and	a,#0x01
	ld	c,a
	ld	a,b
	or	a,a
	jr	NZ,00111$
	or	a,c
	jr	NZ,00111$
	push	de
	ld	e,-6 (ix)
	ld	d,#0x00
	ld	hl,#00168$
	add	hl,de
	add	hl,de
;src/main.c:98: case 0: init = 90;break;
	pop	de
	jp	(hl)
00168$:
	jr	00107$
	jr	00108$
	jr	00109$
	jr	00110$
00107$:
	ld	-4 (ix),#0x5A
	ld	-3 (ix),#0x00
	jr	00111$
;src/main.c:99: case 1: init = 110;break;
00108$:
	ld	-4 (ix),#0x6E
	ld	-3 (ix),#0x00
	jr	00111$
;src/main.c:100: case 2: init = 130;break;
00109$:
	ld	-4 (ix),#0x82
	ld	-3 (ix),#0x00
	jr	00111$
;src/main.c:101: case 3: init = 150;break;
00110$:
	ld	-4 (ix),#0x96
	ld	-3 (ix),#0x00
;src/main.c:102: }
00111$:
;src/main.c:103: memptr = cpct_getScreenPtr(VMEM,15,init);
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
;src/main.c:64: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:104: cpct_drawSolidBox(memptr, 3, 2, 8);
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
	jr	Z,00118$
;src/main.c:106: switch (pushed){
	ld	a,b
	or	a,a
	jr	NZ,00118$
	or	a,c
	jr	NZ,00118$
	ld	e,-6 (ix)
	ld	d,#0x00
	ld	hl,#00169$
	add	hl,de
	add	hl,de
;src/main.c:107: case 0: return 1;break;
	jp	(hl)
00169$:
	jr	00112$
	jr	00113$
	jr	00114$
	jr	00115$
00112$:
	ld	hl,#0x0001
	jr	00122$
;src/main.c:108: case 1: return 2;break;
00113$:
	ld	hl,#0x0002
	jr	00122$
;src/main.c:109: case 2: return 3;break;
00114$:
	ld	hl,#0x0003
	jr	00122$
;src/main.c:110: case 3: return 0;break;
00115$:
	ld	hl,#0x0000
	jr	00122$
;src/main.c:111: }
00118$:
;src/main.c:113: cont++;
	inc	de
	jp	00120$
00122$:
	ld	sp, ix
	pop	ix
	ret
___str_4:
	.ascii "Lounge Gladiator"
	.db 0x00
___str_5:
	.ascii "Nueva Partida"
	.db 0x00
___str_6:
	.ascii "Creditos"
	.db 0x00
___str_7:
	.ascii "Constroles"
	.db 0x00
___str_8:
	.ascii "Salir"
	.db 0x00
;src/main.c:119: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/main.c:122: initVariables(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_initVariables
	inc	sp
;src/main.c:123: initPlayer(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_initPlayer
	inc	sp
;src/main.c:124: initNivel();
	call	_initNivel
;src/main.c:125: initEnemies(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/main.c:127: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:128: drawMap(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_drawMap
	inc	sp
;src/main.c:129: while (1){
00137$:
;src/main.c:130: if(finish == 1) return;
	ld	a,(#_finish + 0)
	dec	a
	ret	Z
	jr	00102$
00102$:
;src/main.c:132: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:135: erases();
	call	_erases
;src/main.c:138: if(temp == 10)
	ld	a,(#_temp + 0)
	sub	a, #0x0A
	jr	NZ,00104$
;src/main.c:139: drawPickUps(n.corazon,n.bullet);
	ld	hl, #(_n + 0x0002) + 0
	ld	d,(hl)
	ld	a, (#(_n + 0x0001) + 0)
	push	de
	inc	sp
	push	af
	inc	sp
	call	_drawPickUps
	pop	af
00104$:
;src/main.c:142: draws();
	call	_draws
;src/main.c:145: if(temp == 10){
	ld	a,(#_temp + 0)
	sub	a, #0x0A
	jr	NZ,00112$
;src/main.c:146: if(player.atk < 20) drawFatiga(player.atk,2);
	ld	hl, #(_player + 0x0008) + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0x14
	jr	NC,00109$
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00112$
00109$:
;src/main.c:147: else if(player.atk > 20) drawFatiga(player.atk,1);
	ld	a,#0x14
	sub	a, d
	jr	NC,00106$
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00112$
00106$:
;src/main.c:148: else drawFatiga(player.atk,0);
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
00112$:
;src/main.c:151: if(temp%2 == 0){
	ld	a,(#_temp + 0)
;src/main.c:152: player.lx = player.x;
;src/main.c:153: player.ly = player.y;
;src/main.c:151: if(temp%2 == 0){
	and	a,#0x01
	jr	NZ,00114$
;src/main.c:152: player.lx = player.x;
	ld	a, (#_player + 0)
	ld	hl,#(_player + 0x0002)
	ld	(hl),a
;src/main.c:153: player.ly = player.y;
	ld	a, (#(_player + 0x0001) + 0)
	ld	(#(_player + 0x0003)),a
00114$:
;src/main.c:156: if(enemy.life > 0){
	ld	hl, #(_enemy + 0x0008) + 0
	ld	l,(hl)
;src/main.c:159: enemy.ly = enemy.y;
;src/main.c:167: enemy.x = enemy.ox;
;src/main.c:168: enemy.y = enemy.oy;
;src/main.c:156: if(enemy.life > 0){
	ld	a,l
	or	a, a
	jp	Z,00121$
;src/main.c:157: if(temp%2 == 1){
	ld	a,(#_temp + 0)
	and	a, #0x01
	ld	h,a
;src/main.c:158: enemy.lx = enemy.x;
;src/main.c:159: enemy.ly = enemy.y;
;src/main.c:157: if(temp%2 == 1){
	dec	h
	jr	NZ,00116$
;src/main.c:158: enemy.lx = enemy.x;
	ld	a, (#_enemy + 0)
	ld	(#(_enemy + 0x0002)),a
;src/main.c:159: enemy.ly = enemy.y;
	ld	a, (#(_enemy + 0x0001) + 0)
	ld	(#(_enemy + 0x0003)),a
00116$:
;src/main.c:162: move();
	call	_move
;src/main.c:164: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
	ld	hl, #(_player + 0x0008) + 0
	ld	d,(hl)
	ld	a, (#(_enemy + 0x0001) + 0)
	ld	hl, #_enemy + 0
	ld	e,(hl)
	ld	hl, #(_player + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_player + 0
	ld	c,(hl)
	push	de
	inc	sp
	ld	d,a
	push	de
	push	bc
	call	_checkCollisions
	pop	af
	pop	af
	inc	sp
;src/main.c:175: enemy.pursue = 0;
;src/main.c:164: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
	ld	a,l
	dec	a
	jr	Z,00117$
	ld	a,l
	sub	a, #0x02
	jr	Z,00118$
	jp	00121$
;src/main.c:165: case 1:
00117$:
;src/main.c:166: erase(enemy.lx,enemy.ly,0);
	ld	hl, #(_enemy + 0x0003) + 0
	ld	d,(hl)
	ld	hl, #(_enemy + 0x0002) + 0
	ld	b,(hl)
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_erase
	pop	af
	inc	sp
;src/main.c:167: enemy.x = enemy.ox;
	ld	a, (#(_enemy + 0x0004) + 0)
	ld	(#_enemy),a
;src/main.c:168: enemy.y = enemy.oy;
	ld	hl, #(_enemy + 0x0005) + 0
	ld	e,(hl)
	ld	hl,#(_enemy + 0x0001)
	ld	(hl),e
;src/main.c:169: enemy.lx = enemy.x;
	ld	(#(_enemy + 0x0002)),a
;src/main.c:170: enemy.ly = enemy.y;
	ld	hl,#(_enemy + 0x0003)
	ld	(hl),e
;src/main.c:171: enemy.ox = originse[map-1][4];
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	c,d
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de,#_originse
	add	hl,de
	ld	de, #0x0004
	add	hl, de
	ld	a,(hl)
	ld	(#(_enemy + 0x0004)),a
;src/main.c:172: enemy.oy = originse[map-1][5];
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	c,d
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de,#_originse
	add	hl,de
	ld	de, #0x0005
	add	hl, de
	ld	a,(hl)
	ld	(#(_enemy + 0x0005)),a
;src/main.c:173: enemy.life -= 1;
	ld	a, (#(_enemy + 0x0008) + 0)
	add	a,#0xFF
	ld	(#(_enemy + 0x0008)),a
;src/main.c:174: player.atk = 20;
	ld	hl,#(_player + 0x0008)
	ld	(hl),#0x14
;src/main.c:175: enemy.pursue = 0;
	ld	hl,#(_enemy + 0x000d)
	ld	(hl),#0x00
;src/main.c:176: break;
	jr	00121$
;src/main.c:177: case 2:
00118$:
;src/main.c:178: erase(player.lx,player.ly,0);
	ld	hl, #(_player + 0x0003) + 0
	ld	d,(hl)
	ld	hl, #(_player + 0x0002) + 0
	ld	b,(hl)
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_erase
	pop	af
	inc	sp
;src/main.c:179: player.x =originsp[map-1][0];
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	ld	de,#_originsp
	add	hl,de
	ld	a,(hl)
	ld	(#_player),a
;src/main.c:180: player.y = originsp[map-1][1];
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	ld	de,#_originsp
	add	hl,de
	inc	hl
	ld	a,(hl)
	ld	(#(_player + 0x0001)),a
;src/main.c:181: player.lx =originsp[map-1][0];
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	ld	de,#_originsp
	add	hl,de
	ld	a,(hl)
	ld	(#(_player + 0x0002)),a
;src/main.c:182: player.ly = originsp[map-1][1];
	ld	hl,#_map + 0
	ld	d, (hl)
	dec	d
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	ld	de,#_originsp
	add	hl,de
	inc	hl
	ld	a,(hl)
	ld	hl,#(_player + 0x0003)
	ld	(hl),a
;src/main.c:183: player.life -= 1;
	ld	a, (#(_player + 0x0006) + 0)
	add	a,#0xFF
	ld	(#(_player + 0x0006)),a
;src/main.c:184: player.atk = 20;
	ld	hl,#(_player + 0x0008)
	ld	(hl),#0x14
;src/main.c:185: enemy.pursue = 0;
	ld	hl,#(_enemy + 0x000d)
	ld	(hl),#0x00
;src/main.c:187: }
00121$:
;src/main.c:189: if(temp > 10)
	ld	a,#0x0A
	ld	iy,#_temp
	sub	a, 0 (iy)
	jr	NC,00123$
;src/main.c:190: temp = 0;
	ld	iy,#_temp
	ld	0 (iy),#0x00
00123$:
;src/main.c:191: temp += 1;
	ld	iy,#_temp
	inc	0 (iy)
;src/main.c:192: player.latk = player.atk;
	ld	de,#_player + 9
	ld	a, (#(_player + 0x0008) + 0)
	ld	(de),a
;src/main.c:194: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:195: player.sprite = checkKeyboard();
	call	_checkKeyboard
	ld	e,l
	ld	d,h
	ld	((_player + 0x0004)), de
;src/main.c:196: checkBoundsCollisions(&n.corazon,&n.bullet);
	ld	hl,#(_n + 0x0002)
	ld	de,#(_n + 0x0001)
	push	hl
	push	de
	call	_checkBoundsCollisions
	pop	af
	pop	af
;src/main.c:198: if(arrow == 1){
	ld	a,(#_arrow + 0)
	dec	a
	jr	NZ,00133$
;src/main.c:199: moveObject();
	call	_moveObject
;src/main.c:200: bound = checkArrowCollisions();
	call	_checkArrowCollisions
	ld	iy,#_bound
	ld	0 (iy),l
;src/main.c:201: if(object.dir == 2 || object.dir == 8)
	ld	hl, #_object + 7
	ld	a, (hl)
	cp	a,#0x02
	jr	Z,00124$
	sub	a, #0x08
	jr	NZ,00125$
00124$:
;src/main.c:202: atkObj = 21;
	ld	b,#0x15
	jr	00126$
00125$:
;src/main.c:204: atkObj = 22;
	ld	b,#0x16
00126$:
;src/main.c:205: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
	ld	a, (#(_enemy + 0x0008) + 0)
	or	a, a
	jr	Z,00133$
	ld	a, (#(_enemy + 0x0001) + 0)
	ld	hl, #_enemy + 0
	ld	c,(hl)
	ld	hl, #_object + 1
	ld	e,(hl)
	ld	hl, #_object + 0
	ld	d,(hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a,c
	push	af
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
	jr	NZ,00133$
	ld	a,(#_bound + 0)
	or	a, a
	jr	NZ,00133$
;src/main.c:206: enemy.life -= 1;
	ld	a, (#(_enemy + 0x0008) + 0)
	add	a,#0xFF
	ld	(#(_enemy + 0x0008)),a
;src/main.c:207: enemy.x = enemy.ox;
	ld	a, (#(_enemy + 0x0004) + 0)
	ld	(#_enemy),a
;src/main.c:208: enemy.y = enemy.oy;
	ld	a, (#(_enemy + 0x0005) + 0)
	ld	(#(_enemy + 0x0001)),a
;src/main.c:209: object.vivo = 0;
	ld	hl,#_object + 6
	ld	(hl),#0x00
;src/main.c:210: bound = 1;
	ld	iy,#_bound
	ld	0 (iy),#0x01
00133$:
;src/main.c:214: if(player.life == 0){
	ld	a, (#(_player + 0x0006) + 0)
	or	a, a
	jp	NZ,00137$
;src/main.c:215: gameOver();
	call	_gameOver
;src/main.c:216: finish = 1;
	ld	hl,#_finish + 0
	ld	(hl), #0x01
	jp	00137$
;src/main.c:225: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:227: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:228: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:229: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_9
	push	de
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
;src/main.c:231: while (1){
00104$:
;src/main.c:233: cpct_scanKeyboard_f();
	push	de
	call	_cpct_scanKeyboard_f
	pop	de
;src/main.c:234: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
	ld	bc,#___str_10
	push	de
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
;src/main.c:235: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
	ld	bc,#___str_11
	push	de
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00104$
;src/main.c:239: return;
	ret
___str_9:
	.ascii "Lounge Gladiator"
	.db 0x00
___str_10:
	.ascii "Josep Domenech Mingot"
	.db 0x00
___str_11:
	.ascii "Alberto Martinez Martinez"
	.db 0x00
;src/main.c:248: void controles(){
;	---------------------------------
; Function controles
; ---------------------------------
_controles::
;src/main.c:250: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:251: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:252: cpct_drawStringM0("Controles",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_12+0
	ld	hl,#0x0001
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:254: while (1){
00104$:
;src/main.c:257: if(cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/main.c:259: return;
	ret
___str_12:
	.ascii "Controles"
	.db 0x00
;src/main.c:267: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:269: init();
	call	_init
;src/main.c:272: while(1){
00107$:
;src/main.c:273: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:274: switch(x){
	bit	7, d
	jr	NZ,00107$
	ld	a,#0x03
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	M,00107$
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
;src/main.c:275: case 0: return;break;
;src/main.c:276: case 1: game(); break;
	jp	(hl)
00124$:
	jr	00109$
	jr	00102$
	jr	00103$
	jr	00104$
	jr	00109$
00102$:
	call	_game
	jr	00107$
;src/main.c:277: case 2: credits();break;
00103$:
	call	_credits
	jr	00107$
;src/main.c:278: case 3: controles();break;
00104$:
	call	_controles
;src/main.c:279: }
	jr	00107$
00109$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
