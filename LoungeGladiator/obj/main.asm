;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Wed Oct 21 23:59:57 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _credits
	.globl _game
	.globl _enemyIa
	.globl _move
	.globl _arrowCheckings
	.globl _shoot
	.globl _vissionSensor
	.globl _followPlayer
	.globl _checkBoundsCollisions
	.globl _checkBoundsCollisionsEnemy
	.globl _moveObject
	.globl _menu
	.globl _gameOver
	.globl _initEnemies
	.globl _initPlayer
	.globl _init
	.globl _checkKeyboard
	.globl _checkArrowCollisions
	.globl _checkCollisions
	.globl _patrol
	.globl _movement
	.globl _setDirection
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
	.globl _enemy
	.globl _player
	.globl _earrow
	.globl _parrow
	.globl _archer
	.globl _bounds
	.globl _bound
	.globl _following
	.globl _shooted
	.globl _arrow
	.globl _finish
	.globl _path
	.globl _map
	.globl _temp
	.globl _scene
	.globl _mapa2
	.globl _mapa1
	.globl _origins
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
_shooted::
	.ds 1
_following::
	.ds 1
_bound::
	.ds 1
_bounds::
	.ds 1
_archer::
	.ds 1
_parrow::
	.ds 10
_earrow::
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
;src/draws.h:14: void drawMap(u8 t){
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
;src/draws.h:18: if(t == 1){
	ld	a,4 (ix)
	dec	a
	jp	NZ,00104$
;src/draws.h:19: for(y=0;y<height;y++){
	ld	hl,#0x0000
	ex	(sp), hl
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x00
;src/draws.h:20: for(x=0;x<width;x++){
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
;src/draws.h:21: scene[y][x] = mapa1[y][x];
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
;src/draws.h:20: for(x=0;x<width;x++){
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
;src/draws.h:19: for(y=0;y<height;y++){
	ld	a,-8 (ix)
	add	a, #0x14
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	inc	-16 (ix)
	jr	NZ,00190$
	inc	-15 (ix)
00190$:
	ld	a,-16 (ix)
	sub	a, #0x0C
	ld	a,-15 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00130$
00104$:
;src/draws.h:26: if(t == 2){
	ld	a,4 (ix)
	sub	a, #0x02
	jp	NZ,00141$
;src/draws.h:27: for(y=0;y<height;y++){
	ld	hl,#0x0000
	ex	(sp), hl
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
;src/draws.h:28: for(x=0;x<width;x++){
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
;src/draws.h:29: scene[y][x] = mapa2[y][x];
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
;src/draws.h:28: for(x=0;x<width;x++){
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
;src/draws.h:27: for(y=0;y<height;y++){
	ld	a,-10 (ix)
	add	a, #0x14
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	inc	-16 (ix)
	jr	NZ,00194$
	inc	-15 (ix)
00194$:
	ld	a,-16 (ix)
	sub	a, #0x0C
	ld	a,-15 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00134$
;src/draws.h:34: for(posY=0; posY<height;posY++){
00141$:
	ld	bc,#0x0000
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	de,#0x0000
;src/draws.h:35: for(posX=0; posX<width;posX++){
00139$:
	ld	hl,#_scene
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
00123$:
;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	h,a
	ld	a,-12 (ix)
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
;src/draws.h:37: if(scene[posY][posX] == 1){
	ld	a,-4 (ix)
	add	a, -12 (ix)
	ld	l,a
	ld	a,-3 (ix)
	adc	a, -11 (ix)
	ld	h,a
	ld	h,(hl)
;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
	push	iy
	pop	af
	ld	-5 (ix),a
	push	iy
	dec	sp
	pop	af
	inc	sp
	ld	-6 (ix),a
;src/draws.h:37: if(scene[posY][posX] == 1){
	dec	h
	jr	NZ,00110$
;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
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
00110$:
;src/draws.h:40: if(scene[posY][posX] == 9){
	ld	a,#<(_scene)
	add	a, -10 (ix)
	ld	l,a
	ld	a,#>(_scene)
	adc	a, -9 (ix)
	ld	h,a
	ld	a,l
	add	a, -12 (ix)
	ld	l,a
	ld	a,h
	adc	a, -11 (ix)
	ld	h,a
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00124$
;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
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
;src/draws.h:35: for(posX=0; posX<width;posX++){
	inc	-12 (ix)
	jr	NZ,00199$
	inc	-11 (ix)
00199$:
	ld	a,-12 (ix)
	sub	a, #0x14
	ld	a,-11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00123$
;src/draws.h:34: for(posY=0; posY<height;posY++){
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
_g_palette:
	.db #0x00	; 0
	.db #0x1A	; 26
	.db #0x06	; 6
	.db #0x0D	; 13
	.db 0x00
_origins:
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x34	; 52	'4'
	.db #0x50	; 80	'P'
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
;src/draws.h:48: void drawVida(u8 life,u8 pos){
;	---------------------------------
; Function drawVida
; ---------------------------------
_drawVida::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/draws.h:51: u8 p = pos;
	ld	d,5 (ix)
;src/draws.h:53: for(i=1;i<=3;i++){
	ld	e,#0x01
00105$:
;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/draws.h:55: p+=5;
	ld	a,d
	add	a, #0x05
	ld	d,a
;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
	ld	c, l
	ld	b, h
	ld	a,4 (ix)
	sub	a, e
	jr	C,00102$
	push	de
	ld	hl,#0x0804
	push	hl
	push	bc
	ld	hl,#_corazon_lleno
	push	hl
	call	_cpct_drawSpriteMasked
	pop	de
	jr	00106$
00102$:
;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
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
;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
	push	de
	ld	hl,#0x0804
	push	hl
	push	bc
	ld	hl,#_corazon_roto
	push	hl
	call	_cpct_drawSpriteMasked
	pop	de
00106$:
;src/draws.h:53: for(i=1;i<=3;i++){
	inc	e
	ld	a,#0x03
	sub	a, e
	jr	NC,00105$
	pop	ix
	ret
;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
;	---------------------------------
; Function drawBullets
; ---------------------------------
_drawBullets::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/draws.h:67: int p = pos;
	ld	c,5 (ix)
	ld	b,#0x00
;src/draws.h:69: for(i=1;i<=3;i++){
	ld	-1 (ix),#0x01
00105$:
;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
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
;src/draws.h:71: p+=3;
	inc	bc
	inc	bc
	inc	bc
;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
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
;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
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
;src/draws.h:69: for(i=1;i<=3;i++){
	inc	-1 (ix)
	ld	a,#0x03
	sub	a, -1 (ix)
	jr	NC,00105$
	inc	sp
	pop	ix
	ret
;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/draws.h:84: switch(mode){
	ld	a,#0x02
	ld	iy,#6
	add	iy,sp
	sub	a, 0 (iy)
	ret	C
;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;src/draws.h:84: switch(mode){
	push	de
	ld	iy,#8
	add	iy,sp
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00111$
	add	hl,de
	add	hl,de
;src/draws.h:85: case 0:
	pop	de
	jp	(hl)
00111$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
;src/draws.h:87: break;
	ret
;src/draws.h:88: case 1:
00102$:
;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
	ld	hl,#0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
;src/draws.h:90: break;
	ret
;src/draws.h:91: case 2:
00103$:
;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
	ld	hl,#0x0404
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
;src/draws.h:94: }
	ret
;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
;	---------------------------------
; Function erase
; ---------------------------------
_erase::
;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
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
;src/draws.h:102: switch(mode){
	ld	a,#0x02
	ld	iy,#4
	add	iy,sp
	sub	a, 0 (iy)
	ret	C
;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
;src/draws.h:102: switch(mode){
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00111$
	add	hl,de
	add	hl,de
;src/draws.h:103: case 0:
	jp	(hl)
00111$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
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
;src/draws.h:105: break;
	ret
;src/draws.h:106: case 1:
00102$:
;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
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
;src/draws.h:108: break;
	ret
;src/draws.h:109: case 2:
00103$:
;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
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
;src/draws.h:112: }
	ret
;src/draws.h:115: void drawStats(){
;	---------------------------------
; Function drawStats
; ---------------------------------
_drawStats::
;src/draws.h:116: drawVida(player.life,1);
	ld	hl, #_player + 6
	ld	d,(hl)
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawVida
	pop	af
;src/draws.h:117: drawBullets(player.bullets,16);
	ld	hl, #_player + 10
	ld	d,(hl)
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawBullets
	pop	af
;src/draws.h:118: drawBullets(enemy.bullets,56);
	ld	hl, #_enemy + 10
	ld	d,(hl)
	ld	a,#0x38
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawBullets
	pop	af
;src/draws.h:119: drawVida(enemy.life,65);
	ld	hl, #_enemy + 8
	ld	d,(hl)
	ld	a,#0x41
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawVida
	pop	af
	ret
;src/draws.h:124: void draws(){
;	---------------------------------
; Function draws
; ---------------------------------
_draws::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/draws.h:126: if(temp%2 == 0)
	ld	iy,#_temp
	bit	0, 0 (iy)
	jr	NZ,00102$
;src/draws.h:127: draw(player.x,player.y,player.sprite,0);
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
;src/draws.h:128: if(enemy.life > 0 && temp%2 == 1)
	ld	de,#_enemy+0
	ld	a, (#_enemy + 8)
	or	a, a
	jr	Z,00104$
	ld	a,(#_temp + 0)
	and	a, #0x01
	dec	a
	jr	NZ,00104$
;src/draws.h:129: draw(enemy.x,enemy.y,enemy.sprite,0);
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
;src/draws.h:130: if(arrow == 1){
	ld	a,(#_arrow + 0)
	dec	a
	jr	NZ,00116$
;src/draws.h:131: if(parrow.dir == 4 || parrow.dir == 6 && parrow.vivo == 1)
	ld	hl, #_parrow + 7
	ld	e,(hl)
;src/draws.h:132: draw(parrow.x,parrow.y,parrow.sprite,2);
	ld	bc,#_parrow + 1
;src/draws.h:131: if(parrow.dir == 4 || parrow.dir == 6 && parrow.vivo == 1)
	ld	a,e
	sub	a, #0x04
	jr	Z,00110$
	ld	hl,#_parrow + 6
	ld	a,e
	sub	a, #0x06
	jr	NZ,00111$
	ld	a,(hl)
	dec	a
	jr	NZ,00111$
00110$:
;src/draws.h:132: draw(parrow.x,parrow.y,parrow.sprite,2);
	ld	de, (#(_parrow + 0x0004) + 0)
	ld	a,(bc)
	ld	-1 (ix),a
	ld	hl, #_parrow + 0
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
;src/draws.h:133: else if(parrow.dir == 2 || parrow.dir == 8 && parrow.vivo == 1)
	ld	a,e
	sub	a, #0x02
	jr	Z,00106$
	ld	a,e
	sub	a, #0x08
	jr	NZ,00116$
	ld	a,(hl)
	dec	a
	jr	NZ,00116$
00106$:
;src/draws.h:134: draw(parrow.x,parrow.y,parrow.sprite,1);
	ld	de, (#(_parrow + 0x0004) + 0)
	ld	a,(bc)
	ld	b,a
	ld	hl, #_parrow + 0
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
;src/draws.h:136: if(shooted == 1){
	ld	a,(#_shooted + 0)
	dec	a
	jr	NZ,00127$
;src/draws.h:137: if(earrow.dir == 4 || earrow.dir == 6 && earrow.vivo == 1)
	ld	hl, #_earrow + 7
	ld	e,(hl)
;src/draws.h:138: draw(earrow.x,earrow.y,earrow.sprite,2);
	ld	bc,#_earrow + 1
;src/draws.h:137: if(earrow.dir == 4 || earrow.dir == 6 && earrow.vivo == 1)
	ld	a,e
	sub	a, #0x04
	jr	Z,00121$
	ld	hl,#_earrow + 6
	ld	a,e
	sub	a, #0x06
	jr	NZ,00122$
	ld	a,(hl)
	dec	a
	jr	NZ,00122$
00121$:
;src/draws.h:138: draw(earrow.x,earrow.y,earrow.sprite,2);
	ld	de, (#(_earrow + 0x0004) + 0)
	ld	a,(bc)
	ld	-1 (ix),a
	ld	hl, #_earrow + 0
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
	jr	00127$
00122$:
;src/draws.h:139: else if(earrow.dir == 2 || earrow.dir == 8 && earrow.vivo == 1)
	ld	a,e
	sub	a, #0x02
	jr	Z,00117$
	ld	a,e
	sub	a, #0x08
	jr	NZ,00127$
	ld	a,(hl)
	dec	a
	jr	NZ,00127$
00117$:
;src/draws.h:140: draw(earrow.x,earrow.y,earrow.sprite,1);
	ld	de, (#(_earrow + 0x0004) + 0)
	ld	a,(bc)
	ld	b,a
	ld	hl, #_earrow + 0
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
00127$:
;src/draws.h:142: drawStats();
	call	_drawStats
	inc	sp
	pop	ix
	ret
;src/draws.h:145: void erases(){
;	---------------------------------
; Function erases
; ---------------------------------
_erases::
;src/draws.h:147: if(temp%2 == 0) erase(player.lx,player.ly,0);
	ld	iy,#_temp
	bit	0, 0 (iy)
	jr	NZ,00102$
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
;src/draws.h:148: if(temp%2 == 1) erase(enemy.lx,enemy.ly,0);
	ld	a,(#_temp + 0)
	and	a, #0x01
	dec	a
	jr	NZ,00104$
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
;src/draws.h:149: if(arrow == 1){
	ld	a,(#_arrow + 0)
	dec	a
	jr	NZ,00112$
;src/draws.h:150: if(parrow.dir == 4 || parrow.dir == 6) erase(parrow.lx,parrow.ly,2);
	ld	hl, #_parrow + 7
	ld	e,(hl)
	ld	hl, #_parrow + 3
	ld	d,(hl)
	ld	hl, #_parrow + 2
	ld	b,(hl)
	ld	a,e
	cp	a,#0x04
	jr	Z,00105$
	sub	a, #0x06
	jr	NZ,00106$
00105$:
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
	jr	00107$
00106$:
;src/draws.h:151: else erase(parrow.lx,parrow.ly,1);
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
00107$:
;src/draws.h:152: if(bound == 1) arrow = 0;
	ld	a,(#_bound + 0)
	dec	a
	jr	NZ,00112$
	ld	hl,#_arrow + 0
	ld	(hl), #0x00
00112$:
;src/draws.h:154: if(shooted == 1){
	ld	a,(#_shooted + 0)
	dec	a
	ret	NZ
;src/draws.h:155: if(earrow.dir == 4 || earrow.dir == 6) erase(earrow.lx,earrow.ly,2);
	ld	hl, #_earrow + 7
	ld	e,(hl)
	ld	hl, #_earrow + 3
	ld	d,(hl)
	ld	hl, #_earrow + 2
	ld	b,(hl)
	ld	a,e
	cp	a,#0x04
	jr	Z,00113$
	sub	a, #0x06
	jr	NZ,00114$
00113$:
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
	jr	00115$
00114$:
;src/draws.h:156: else erase(earrow.lx,earrow.ly,1);
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
00115$:
;src/draws.h:157: if(bounds == 1) shooted = 0;
	ld	a,(#_bounds + 0)
	dec	a
	ret	NZ
	ld	hl,#_shooted + 0
	ld	(hl), #0x00
	ret
;src/draws.h:164: void drawFatiga(u8 atk, u8 col){
;	---------------------------------
; Function drawFatiga
; ---------------------------------
_drawFatiga::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/draws.h:166: if(atk < 20)
	ld	a,4 (ix)
	sub	a, #0x14
	jr	NC,00102$
;src/draws.h:167: col = 2;
	ld	5 (ix),#0x02
00102$:
;src/draws.h:168: if(atk > 30 || atk <= 20){
	ld	a,#0x14
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	-1 (ix),a
;src/draws.h:170: switch(col){
	ld	a,#0x02
	sub	a, 5 (ix)
	ld	a,#0x00
	rla
	ld	-2 (ix),a
;src/draws.h:168: if(atk > 30 || atk <= 20){
	ld	a,#0x1E
	sub	a, 4 (ix)
	jr	C,00107$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
00107$:
;src/draws.h:169: memptr = cpct_getScreenPtr(VMEM,28,192);
	ld	hl,#0xC01C
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:170: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00108$
;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/draws.h:170: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00156$
	add	hl,de
	add	hl,de
;src/draws.h:171: case 0:
	jp	(hl)
00156$:
	jr	00103$
	jr	00104$
	jr	00105$
00103$:
;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/draws.h:173: break;
	jr	00108$
;src/draws.h:174: case 1:
00104$:
;src/draws.h:175: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:176: break;
	jr	00108$
;src/draws.h:177: case 2:
00105$:
;src/draws.h:178: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:179: }
00108$:
;src/draws.h:181: if(atk > 40 || atk <= 20){
	ld	a,#0x28
	sub	a, 4 (ix)
	jr	C,00114$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00115$
00114$:
;src/draws.h:182: memptr = cpct_getScreenPtr(VMEM,31,192);
	ld	hl,#0xC01F
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:183: switch(col){
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00115$
;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/draws.h:183: switch(col){
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00157$
	add	hl,de
	add	hl,de
;src/draws.h:184: case 0:
	jp	(hl)
00157$:
	jr	00110$
	jr	00111$
	jr	00112$
00110$:
;src/draws.h:185: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/draws.h:186: break;
	jr	00115$
;src/draws.h:187: case 1:
00111$:
;src/draws.h:188: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
	ld	de,#_fatiga_nor
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:189: break;
	jr	00115$
;src/draws.h:190: case 2:
00112$:
;src/draws.h:191: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:192: }
00115$:
;src/draws.h:194: if(atk <= 20){
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00122$
;src/draws.h:195: memptr = cpct_getScreenPtr(VMEM,34,192);
	ld	hl,#0xC022
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
	ld	c, l
	ld	b, h
;src/draws.h:196: switch(col){
	ld	a,5 (ix)
	or	a, a
	jr	Z,00117$
	ld	a,5 (ix)
	sub	a, #0x02
	jr	Z,00118$
	jr	00122$
;src/draws.h:197: case 0:
00117$:
;src/draws.h:198: cpct_drawSolidBox(memptr, col, 2, 8);
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
;src/draws.h:199: break;
	jr	00122$
;src/draws.h:200: case 2:
00118$:
;src/draws.h:201: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
	ld	de,#_fatiga_full
	ld	hl,#0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
;src/draws.h:202: }
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/draws.h:207: void drawPickUps(u8 corazon, u8 bullet){
;	---------------------------------
; Function drawPickUps
; ---------------------------------
_drawPickUps::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/draws.h:210: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
	ld	hl,#0xA004
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	c, l
	ld	b, h
;src/draws.h:211: if(corazon == 0)
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00102$
;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ld	de,#_corazon_lleno
	ld	hl,#0x0804
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	jr	00103$
00102$:
;src/draws.h:214: cpct_drawSolidBox(memptr, 0, 4, 8);
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
;src/draws.h:216: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
	ld	hl,#0x1008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
	ex	de,hl
;src/draws.h:217: if(bullet == 0)
	ld	a,5 (ix)
	or	a, a
	jr	NZ,00105$
;src/draws.h:218: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
	ld	bc,#_flecha_arriba
	ld	hl,#0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00107$
00105$:
;src/draws.h:220: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/ia.h:40: void movement(u8 dir){
;	---------------------------------
; Function movement
; ---------------------------------
_movement::
;src/ia.h:41: switch(dir){
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
;src/ia.h:42: case 6: enemy.x += 1; break;
00101$:
	ld	hl,#_enemy+0
	inc	(hl)
	ret
;src/ia.h:43: case 4: enemy.x -= 1; break;
00102$:
	ld	de,#_enemy+0
	ld	a,(de)
	add	a,#0xFF
	ld	(de),a
	ret
;src/ia.h:44: case 8: enemy.y -= 2; break;
00103$:
	ld	de,#_enemy+1
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
	ret
;src/ia.h:45: case 2: enemy.y += 2; break;
00104$:
	ld	hl,#_enemy+1
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
;src/ia.h:46: }
	ret
;src/ia.h:50: void patrol(){
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
;src/ia.h:52: movement(enemy.dir);
	ld	a, (#(_enemy + 0x0009) + 0)
	push	af
	inc	sp
	call	_movement
	inc	sp
;src/ia.h:54: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
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
	ld	a,(#_enemy + 11)
	ld	-3 (ix),a
	ld	a,(de)
	ld	d,a
	ld	a,-3 (ix)
	sub	a, d
	jp	NZ,00106$
;src/ia.h:55: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
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
;src/ia.h:56: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
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
;src/ia.h:57: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
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
;src/ia.h:59: switch(enemy.dir){
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
;src/ia.h:60: case 4: movement(6); break;
00101$:
	ld	a,#0x06
	push	af
	inc	sp
	call	_movement
	inc	sp
	jr	00111$
;src/ia.h:61: case 6: movement(4); break;
00102$:
	ld	a,#0x04
	push	af
	inc	sp
	call	_movement
	inc	sp
	jr	00111$
;src/ia.h:62: case 2: movement(8); break;
00103$:
	ld	a,#0x08
	push	af
	inc	sp
	call	_movement
	inc	sp
	jr	00111$
;src/ia.h:63: case 8: movement(2); break;
00104$:
	ld	a,#0x02
	push	af
	inc	sp
	call	_movement
	inc	sp
;src/ia.h:64: }
00111$:
	ld	sp, ix
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
;src/CalcColision.h:59: u8 checkArrowCollisions(){
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
;src/CalcColision.h:82: u8 bound =0;
	ld	-12 (ix),#0x00
;src/CalcColision.h:83: if(    scene[(parrow.y)/tileheight][(parrow.x)/tilewidth] == 1
	ld	a,(#(_parrow + 0x0001) + 0)
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
	ld	-4 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-3 (ix),a
	ld	hl, #_parrow + 0
	ld	c,(hl)
	ld	a,c
	rrca
	rrca
	and	a,#0x3F
	ld	-6 (ix),a
	ld	a,-4 (ix)
	add	a, -6 (ix)
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	dec	a
	jp	Z,00101$
;src/CalcColision.h:84: || scene[(parrow.y)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
	ld	b,#0x00
	ld	hl,#0x0003
	add	hl,bc
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	a,-10 (ix)
	ld	-2 (ix),a
	ld	a,-9 (ix)
	ld	-1 (ix),a
	ld	a,-9 (ix)
	rlca
	and	a,#0x01
	ld	-11 (ix),a
	ld	hl,#0x0006
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00108$
	ld	a,-8 (ix)
	ld	-2 (ix),a
	ld	a,-7 (ix)
	ld	-1 (ix),a
00108$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00101$
;src/CalcColision.h:85: || scene[(parrow.y+tileheight-2)/tileheight][(parrow.x)/tilewidth] == 1
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
	ld	-2 (ix),a
	ld	a,e
	add	a, #0x1D
	ld	-4 (ix),a
	ld	a,d
	adc	a, #0x00
	ld	-3 (ix),a
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00109$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	e,-6 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00101$
;src/CalcColision.h:86: || scene[(parrow.y+tileheight-2)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00110$
	ld	c,-4 (ix)
	ld	b,-3 (ix)
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
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-1 (ix),a
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00111$
	ld	l,-8 (ix)
	ld	h,-7 (ix)
00111$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00102$
00101$:
;src/CalcColision.h:88: parrow.x=parrow.lx;
	ld	a, (#_parrow + 2)
	ld	(#_parrow),a
;src/CalcColision.h:89: parrow.y=parrow.ly;
	ld	a, (#_parrow + 3)
	ld	(#(_parrow + 0x0001)),a
;src/CalcColision.h:90: bound = 1;
	ld	-12 (ix),#0x01
00102$:
;src/CalcColision.h:93: return bound;
	ld	l,-12 (ix)
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
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00147$
	ld	hl, #(_player + 0x0008) + 0
	ld	a,(hl)
	ld	-3 (ix), a
	sub	a, #0x14
	jr	C,00147$
;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
	ld	a,-3 (ix)
	sub	a, #0x32
	jr	C,00102$
	ld	hl,#(_player + 0x0008)
	ld	(hl),#0x00
	jr	00103$
00102$:
;src/keyboard.h:17: else player.atk += 1;
	ld	a,-3 (ix)
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
	jp	00148$
;src/keyboard.h:19: case 4:
00104$:
;src/keyboard.h:20: s = gladis_atk_izda;
	ld	-2 (ix),#<(_gladis_atk_izda)
	ld	-1 (ix),#>(_gladis_atk_izda)
;src/keyboard.h:21: break;
	jp	00148$
;src/keyboard.h:22: case 6:
00105$:
;src/keyboard.h:23: s = gladis_atk_dcha;
	ld	-2 (ix),#<(_gladis_atk_dcha)
	ld	-1 (ix),#>(_gladis_atk_dcha)
;src/keyboard.h:24: break;
	jp	00148$
;src/keyboard.h:25: case 8:
00106$:
;src/keyboard.h:26: s = gladis_atk_arriba;
	ld	-2 (ix),#<(_gladis_atk_arriba)
	ld	-1 (ix),#>(_gladis_atk_arriba)
;src/keyboard.h:27: break;
	jp	00148$
;src/keyboard.h:28: case 2:
00107$:
;src/keyboard.h:29: s = gladis_atk_abajo;
	ld	-2 (ix),#<(_gladis_atk_abajo)
	ld	-1 (ix),#>(_gladis_atk_abajo)
;src/keyboard.h:31: }
	jp	00148$
00147$:
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
	jr	Z,00143$
	ld	hl, #_player + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00143$
;src/keyboard.h:36: player.x += 1;
	inc	d
	ld	hl,#_player
	ld	(hl),d
;src/keyboard.h:37: player.dir = 6;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x06
;src/keyboard.h:38: s = gladis_quieto_dcha;
	ld	-2 (ix),#<(_gladis_quieto_dcha)
	ld	-1 (ix),#>(_gladis_quieto_dcha)
	jp	00148$
00143$:
;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00139$
	ld	a, (#_player + 0)
	or	a, a
	jr	Z,00139$
;src/keyboard.h:40: player.x -= 1;
	add	a,#0xFF
	ld	(#_player),a
;src/keyboard.h:41: player.dir = 4;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x04
;src/keyboard.h:42: s = gladis_quieto_izda;
	ld	-2 (ix),#<(_gladis_quieto_izda)
	ld	-1 (ix),#>(_gladis_quieto_izda)
	jp	00148$
00139$:
;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	bc,#_player + 1
	ld	a,l
	or	a, a
	jr	Z,00135$
	ld	a,(bc)
	ld	h,a
	sub	a, #0xB4
	jr	NC,00135$
;src/keyboard.h:44: player.y += 2;
	ld	a,h
	add	a, #0x02
	ld	(bc),a
;src/keyboard.h:45: player.dir = 2;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x02
;src/keyboard.h:46: s = gladis_abajo;
	ld	-2 (ix),#<(_gladis_abajo)
	ld	-1 (ix),#>(_gladis_abajo)
	jp	00148$
00135$:
;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
	push	bc
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00131$
	ld	a,(bc)
	or	a, a
	jr	Z,00131$
;src/keyboard.h:48: player.y -= 2;
	add	a,#0xFE
	ld	(bc),a
;src/keyboard.h:49: player.dir = 8;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x08
;src/keyboard.h:50: s = gladis_arriba;
	ld	-2 (ix),#<(_gladis_arriba)
	ld	-1 (ix),#>(_gladis_arriba)
	jp	00148$
00131$:
;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
	push	bc
	ld	hl,#0x8007
	call	_cpct_isKeyPressed
	ld	a,l
	pop	bc
	or	a, a
	jp	Z,00125$
	ld	a,(#_arrow + 0)
	or	a, a
	jp	NZ,00125$
	ld	a, (#(_player + 0x0008) + 0)
	sub	a, #0x14
	jp	NZ,00125$
	ld	a, (#(_player + 0x000a) + 0)
	or	a, a
	jp	Z,00125$
;src/keyboard.h:52: if(player.bullets> 0){
	or	a, a
	jp	Z,00118$
;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
	ld	-5 (ix),#<(_flecha_dcha)
	ld	-4 (ix),#>(_flecha_dcha)
	ld	-6 (ix),#0x02
	ld	e,#0x08
;src/keyboard.h:54: switch(player.dir){
	ld	hl, #(_player + 0x0007) + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0x02
	jr	Z,00114$
	ld	a,d
	sub	a, #0x04
	jr	Z,00113$
	ld	a,d
	sub	a, #0x06
	jr	Z,00112$
	ld	a,d
	sub	a, #0x08
	jr	Z,00115$
	jr	00116$
;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
00112$:
	ld	-5 (ix),#<(_flecha_dcha)
	ld	-4 (ix),#>(_flecha_dcha)
	ld	-6 (ix),#0x04
	ld	e,#0x04
	jr	00116$
;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
00113$:
	ld	-5 (ix),#<(_flecha_izda)
	ld	-4 (ix),#>(_flecha_izda)
	ld	-6 (ix),#0x04
	ld	e,#0x04
	jr	00116$
;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
00114$:
	ld	-5 (ix),#<(_flecha_abajo)
	ld	-4 (ix),#>(_flecha_abajo)
	ld	-6 (ix),#0x02
	ld	e,#0x08
	jr	00116$
;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
00115$:
	ld	-5 (ix),#<(_flecha_arriba)
	ld	-4 (ix),#>(_flecha_arriba)
	ld	-6 (ix),#0x02
	ld	e,#0x08
;src/keyboard.h:59: }
00116$:
;src/keyboard.h:60: player.atk = 0;
	ld	hl,#(_player + 0x0008)
	ld	(hl),#0x00
;src/keyboard.h:61: parrow.x = player.x;
	ld	a, (#_player + 0)
	ld	(#_parrow),a
;src/keyboard.h:62: parrow.y = player.y+8;
	ld	a,(bc)
	add	a, #0x08
	ld	(#(_parrow + 0x0001)),a
;src/keyboard.h:63: parrow.x = parrow.x;
	ld	hl, #_parrow + 0
	ld	d,(hl)
	ld	hl,#_parrow
	ld	(hl),d
;src/keyboard.h:64: parrow.y = parrow.y;
	ld	(#(_parrow + 0x0001)),a
;src/keyboard.h:65: parrow.sprite = spr;
	ld	hl,#_parrow + 4
	ld	a,-5 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-4 (ix)
	ld	(hl),a
;src/keyboard.h:66: parrow.vivo = 1;
	ld	hl,#_parrow + 6
	ld	(hl),#0x01
;src/keyboard.h:67: parrow.dir = player.dir;
	ld	bc,#_parrow + 7
	ld	a, (#(_player + 0x0007) + 0)
	ld	(bc),a
;src/keyboard.h:68: parrow.sizeX = xs;
	ld	hl,#_parrow + 8
	ld	a,-6 (ix)
	ld	(hl),a
;src/keyboard.h:69: parrow.sizeY = ys;
	ld	hl,#_parrow + 9
	ld	(hl),e
;src/keyboard.h:70: player.bullets--;
	ld	a, (#(_player + 0x000a) + 0)
	add	a,#0xFF
	ld	(#(_player + 0x000a)),a
00118$:
;src/keyboard.h:72: arrow=1;
	ld	hl,#_arrow + 0
	ld	(hl), #0x01
	jr	00148$
00125$:
;src/keyboard.h:74: switch(player.dir){
	ld	hl, #(_player + 0x0007) + 0
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
	jr	00148$
;src/keyboard.h:75: case 4:
00119$:
;src/keyboard.h:76: s = gladis_quieto_izda;
	ld	-2 (ix),#<(_gladis_quieto_izda)
	ld	-1 (ix),#>(_gladis_quieto_izda)
;src/keyboard.h:77: break;
	jr	00148$
;src/keyboard.h:78: case 6:
00120$:
;src/keyboard.h:79: s = gladis_quieto_dcha;
	ld	-2 (ix),#<(_gladis_quieto_dcha)
	ld	-1 (ix),#>(_gladis_quieto_dcha)
;src/keyboard.h:80: break;
	jr	00148$
;src/keyboard.h:81: case 8:
00121$:
;src/keyboard.h:82: s = gladis_arriba;
	ld	-2 (ix),#<(_gladis_arriba)
	ld	-1 (ix),#>(_gladis_arriba)
;src/keyboard.h:83: break;
	jr	00148$
;src/keyboard.h:84: case 2:
00122$:
;src/keyboard.h:85: s = gladis_abajo;
	ld	-2 (ix),#<(_gladis_abajo)
	ld	-1 (ix),#>(_gladis_abajo)
;src/keyboard.h:87: }
00148$:
;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00151$
;src/keyboard.h:94: arrow = 0;
	ld	hl,#_arrow + 0
	ld	(hl), #0x00
00151$:
;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00153$
;src/keyboard.h:97: finish = 1;
	ld	hl,#_finish + 0
	ld	(hl), #0x01
00153$:
;src/keyboard.h:99: return s;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:37: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:38: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:39: cpct_setVideoMode(0);
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:40: cpct_fw2hw(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:41: cpct_setPalette(g_palette,4);
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
	ret
;src/main.c:44: void initPlayer(){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
;src/main.c:46: player.x = origins[0][0];
	ld	bc,#_origins+0
	ld	a,(bc)
	ld	(#_player),a
;src/main.c:47: player.y = origins[0][1];
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_player + 0x0001)),a
;src/main.c:48: player.lx = origins[0][0];
	ld	a,(bc)
	ld	(#(_player + 0x0002)),a
;src/main.c:49: player.ly = origins[0][1];
	ld	a,(de)
	ld	(#(_player + 0x0003)),a
;src/main.c:50: player.sprite = sprite;
	ld	hl,#_gladis_quieto_dcha
	ld	((_player + 0x0004)), hl
;src/main.c:51: player.life = 3;
	ld	hl,#_player + 6
	ld	(hl),#0x03
;src/main.c:52: player.dir = 6;
	ld	hl,#_player + 7
	ld	(hl),#0x06
;src/main.c:53: player.atk = 20;
	ld	hl,#_player + 8
	ld	(hl),#0x14
;src/main.c:54: player.latk = 20;
	ld	hl,#_player + 9
	ld	(hl),#0x14
;src/main.c:55: player.bullets = 3;
	ld	hl,#_player + 10
	ld	(hl),#0x03
	ret
;src/main.c:58: void initEnemies(){
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
;src/main.c:59: u8 *sprite = chacho_dcha;
;src/main.c:60: enemy.x = origins[1][0];
	ld	bc,#_origins + 2
	ld	a,(bc)
	ld	(#_enemy),a
;src/main.c:61: enemy.y = origins[1][1];
	ld	de,#_origins + 3
	ld	a,(de)
	ld	(#(_enemy + 0x0001)),a
;src/main.c:62: enemy.lx = origins[1][0];
	ld	a,(bc)
	ld	(#(_enemy + 0x0002)),a
;src/main.c:63: enemy.ly = origins[1][1];
	ld	a,(de)
	ld	(#(_enemy + 0x0003)),a
;src/main.c:64: enemy.ox = origins[1][0];
	ld	a,(bc)
	ld	(#(_enemy + 0x0004)),a
;src/main.c:65: enemy.oy = origins[1][1];
	ld	a,(de)
	ld	(#(_enemy + 0x0005)),a
;src/main.c:66: enemy.sprite = sprite;
	ld	hl,#_chacho_dcha
	ld	((_enemy + 0x0006)), hl
;src/main.c:67: enemy.life = 3;
	ld	hl,#_enemy + 8
	ld	(hl),#0x03
;src/main.c:68: enemy.dir = 6;
	ld	hl,#_enemy + 9
	ld	(hl),#0x06
;src/main.c:69: enemy.bullets = 3;
	ld	hl,#_enemy + 10
	ld	(hl),#0x03
;src/main.c:70: enemy.room = 3;
	ld	hl,#_enemy + 11
	ld	(hl),#0x03
	ret
;src/main.c:75: void gameOver(){
;	---------------------------------
; Function gameOver
; ---------------------------------
_gameOver::
;src/main.c:77: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:78: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:79: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:80: while(1){
00102$:
	jr	00102$
___str_0:
	.ascii "Lounge Gladiator"
	.db 0x00
;src/main.c:87: int menu(){
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
;src/main.c:89: int init = 50;
	ld	-4 (ix),#0x32
	ld	-3 (ix),#0x00
;src/main.c:90: int pushed =0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/main.c:91: int cont =0;
	ld	de,#0x0000
;src/main.c:92: cpct_clearScreen(0);
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
;src/main.c:95: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
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
;src/main.c:99: cpct_drawStringM0("Nueva Partida",memptr,1,0);
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
;src/main.c:102: cpct_drawStringM0("Creditos",memptr,1,0);
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
;src/main.c:95: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:105: cpct_drawStringM0("Salir",memptr,1,0);
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
;src/main.c:111: while(1){
00118$:
;src/main.c:113: cpct_scanKeyboard();
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
;src/main.c:115: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:116: pushed ++;
	inc	-6 (ix)
	jr	NZ,00163$
	inc	-5 (ix)
00163$:
;src/main.c:117: cont =0;
	ld	de,#0x0000
00102$:
;src/main.c:119: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
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
;src/main.c:120: cpct_drawSolidBox(memptr, 0, 2, 8);
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
;src/main.c:121: pushed --;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
;src/main.c:122: cont = 0;
	ld	de,#0x0000
00105$:
;src/main.c:125: switch (pushed){
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
;src/main.c:126: case 0: init = 50;break;
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
;src/main.c:127: case 1: init = 70;break;
00108$:
	ld	-4 (ix),#0x46
	ld	-3 (ix),#0x00
	jr	00110$
;src/main.c:128: case 2: init = 90;break;
00109$:
	ld	-4 (ix),#0x5A
	ld	-3 (ix),#0x00
;src/main.c:129: }
00110$:
;src/main.c:130: memptr = cpct_getScreenPtr(VMEM,15,init);
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
;src/main.c:95: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:131: cpct_drawSolidBox(memptr, 3, 2, 8);
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
;src/main.c:133: switch (pushed){
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
;src/main.c:134: case 0: return 1;break;
	jp	(hl)
00167$:
	jr	00111$
	jr	00112$
	jr	00113$
00111$:
	ld	hl,#0x0001
	jr	00120$
;src/main.c:135: case 1: return 2;break;
00112$:
	ld	hl,#0x0002
	jr	00120$
;src/main.c:136: case 2: return 0;break;
00113$:
	ld	hl,#0x0000
	jr	00120$
;src/main.c:137: }
00116$:
;src/main.c:139: cont++;
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
;src/main.c:152: void moveObject(u8 c){
;	---------------------------------
; Function moveObject
; ---------------------------------
_moveObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:153: if(c == 0){
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00112$
;src/main.c:154: parrow.lx = parrow.x;
	ld	de,#_parrow+0
	ld	a,(de)
	ld	(#(_parrow + 0x0002)),a
;src/main.c:155: parrow.ly = parrow.y;
	ld	c, e
	ld	b, d
	inc	bc
	ld	a,(bc)
	ld	(#(_parrow + 0x0003)),a
;src/main.c:156: switch(parrow.dir){
	ld	a,(#_parrow + 7)
	cp	a,#0x02
	jr	Z,00103$
	cp	a,#0x04
	jr	Z,00102$
	cp	a,#0x06
	jr	Z,00101$
	sub	a, #0x08
	jr	Z,00104$
	jr	00114$
;src/main.c:157: case 6: parrow.x += 1; break;
00101$:
	ld	a,(de)
	inc	a
	ld	(de),a
	jr	00114$
;src/main.c:158: case 4: parrow.x -= 1; break;
00102$:
	ld	a,(de)
	add	a,#0xFF
	ld	(de),a
	jr	00114$
;src/main.c:159: case 2: parrow.y += 2; break;
00103$:
	ld	a,(bc)
	add	a, #0x02
	ld	(bc),a
	jr	00114$
;src/main.c:160: case 8: parrow.y -= 2; break;
00104$:
	ld	a,(bc)
	add	a,#0xFE
	ld	(bc),a
;src/main.c:161: }
	jr	00114$
00112$:
;src/main.c:164: earrow.lx = earrow.x;
	ld	bc,#_earrow+0
	ld	a,(bc)
	ld	(#(_earrow + 0x0002)),a
;src/main.c:165: earrow.ly = earrow.y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	(#(_earrow + 0x0003)),a
;src/main.c:166: switch(earrow.dir){
	ld	a,(#_earrow + 7)
	cp	a,#0x02
	jr	Z,00108$
	cp	a,#0x04
	jr	Z,00107$
	cp	a,#0x06
	jr	Z,00106$
	sub	a, #0x08
	jr	Z,00109$
	jr	00114$
;src/main.c:167: case 6: earrow.x += 1; break;
00106$:
	ld	a,(bc)
	inc	a
	ld	(bc),a
	jr	00114$
;src/main.c:168: case 4: earrow.x -= 1; break;
00107$:
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	jr	00114$
;src/main.c:169: case 2: earrow.y += 2; break;
00108$:
	ld	a,(de)
	add	a, #0x02
	ld	(de),a
	jr	00114$
;src/main.c:170: case 8: earrow.y -= 2; break;
00109$:
	ld	a,(de)
	add	a,#0xFE
	ld	(de),a
;src/main.c:171: }
00114$:
	pop	ix
	ret
;src/main.c:179: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
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
;src/main.c:181: u8 *posX = x;
	ld	a,4 (ix)
	ld	-18 (ix),a
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/main.c:182: u8 *posY = y;
	ld	a,6 (ix)
	ld	-20 (ix),a
	ld	a,7 (ix)
	ld	-19 (ix),a
;src/main.c:183: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:184: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:185: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
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
;src/main.c:186: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
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
;src/main.c:188: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:189: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
	jp	00112$
00107$:
;src/main.c:191: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
	ld	a,-8 (ix)
	sub	a, #0x03
	jp	NZ,00101$
;src/main.c:192: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:193: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
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
;src/main.c:194: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
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
;src/main.c:196: *posX=lx;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	a,8 (ix)
	ld	(hl),a
;src/main.c:197: *posY=ly;
	pop	hl
	push	hl
	ld	a,9 (ix)
	ld	(hl),a
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:203: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
;	---------------------------------
; Function checkBoundsCollisions
; ---------------------------------
_checkBoundsCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;src/main.c:204: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
	ld	a,(#(_player + 0x0001) + 0)
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
	ld	-12 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-11 (ix),a
	ld	hl, #_player + 0
	ld	c,(hl)
	ld	a,c
	rrca
	rrca
	and	a,#0x3F
	ld	-9 (ix), a
	add	a, -12 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -11 (ix)
	ld	h,a
	ld	a,(hl)
	ld	-10 (ix), a
	dec	a
	jp	Z,00124$
;src/main.c:205: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
	ld	b,#0x00
	ld	hl,#0x0003
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	a,-5 (ix)
	ld	-2 (ix),a
	ld	a,-4 (ix)
	ld	-1 (ix),a
	ld	a,-4 (ix)
	rlca
	and	a,#0x01
	ld	-3 (ix),a
	ld	hl,#0x0006
	add	hl,bc
	ex	(sp), hl
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00132$
	ld	a,-14 (ix)
	ld	-2 (ix),a
	ld	a,-13 (ix)
	ld	-1 (ix),a
00132$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jp	Z,00124$
;src/main.c:206: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
	ld	e,-8 (ix)
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
	ld	-8 (ix),a
	ld	hl,#0x001D
	add	hl,de
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00133$
	ld	a,-7 (ix)
	ld	-2 (ix),a
	ld	a,-6 (ix)
	ld	-1 (ix),a
00133$:
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
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de,#_scene
	add	hl,de
	ld	e,-9 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00124$
;src/main.c:207: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
	ld	-2 (ix),c
	ld	-1 (ix),b
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00134$
	ld	a,-7 (ix)
	ld	-2 (ix),a
	ld	a,-6 (ix)
	ld	-1 (ix),a
00134$:
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
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a,#<(_scene)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-1 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00135$
	pop	hl
	push	hl
00135$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	NZ,00125$
00124$:
;src/main.c:209: player.x=player.lx;
	ld	a, (#_player + 2)
	ld	hl,#_player
	ld	(hl),a
;src/main.c:210: player.y=player.ly;
	ld	a, (#_player + 3)
	ld	(#(_player + 0x0001)),a
	jp	00130$
00125$:
;src/main.c:212: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
	ld	a,-10 (ix)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:213: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00136$
	pop	hl
	push	hl
00136$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jp	Z,00118$
;src/main.c:214: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
	ld	l, c
	ld	h, b
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00137$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
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
	ld	e,-9 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00118$
;src/main.c:215: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
	ld	l, c
	ld	h, b
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00138$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
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
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00139$
	pop	hl
	push	hl
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
;src/main.c:217: if(player.life < 3 && *corazon == 0){
	ld	iy,#_player + 6
	ld	e, 0 (iy)
	ld	a,e
	sub	a, #0x03
	jp	NC,00130$
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00130$
;src/main.c:218: player.life += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:219: *corazon = 1;
	ld	(hl),#0x01
	jp	00130$
00119$:
;src/main.c:222: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
	ld	a,-10 (ix)
	sub	a, #0x05
	jp	Z,00112$
;src/main.c:223: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00140$
	pop	hl
	push	hl
00140$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00112$
;src/main.c:224: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00141$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
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
	ld	e,-9 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x05
	jr	Z,00112$
;src/main.c:225: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
	ld	l, c
	ld	h, b
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00142$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
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
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00143$
	pop	hl
	push	hl
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
;src/main.c:227: if(player.bullets < 3 && *flecha == 0){
	ld	iy,#_player + 10
	ld	e, 0 (iy)
	ld	a,e
	sub	a, #0x03
	jp	NC,00130$
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00130$
;src/main.c:228: player.bullets += 1;
	inc	e
	ld	0 (iy), e
;src/main.c:229: *flecha = 1;
	ld	(hl),#0x01
	jp	00130$
00113$:
;src/main.c:231: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
	ld	a,-10 (ix)
	sub	a, #0x09
	jp	Z,00107$
;src/main.c:232: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00144$
	pop	hl
	push	hl
00144$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jp	Z,00107$
;src/main.c:233: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
	ld	l, c
	ld	h, b
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00145$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
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
	ld	e,-9 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	Z,00107$
;src/main.c:234: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00146$
	ld	c,-7 (ix)
	ld	b,-6 (ix)
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
	ld	-7 (ix),a
	ld	a,#>(_scene)
	adc	a, h
	ld	-6 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00147$
	pop	hl
	push	hl
00147$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	a,(hl)
	sub	a, #0x09
	jr	NZ,00130$
00107$:
;src/main.c:237: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:238: map+=1;
	ld	hl, #_map+0
	inc	(hl)
;src/main.c:239: drawMap(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_drawMap
	inc	sp
00130$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:248: void followPlayer(){
;	---------------------------------
; Function followPlayer
; ---------------------------------
_followPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/main.c:251: if(detectPlayerRoom(player.x,player.y) != enemy.room){
	ld	hl, #(_player + 0x0001) + 0
	ld	d,(hl)
	ld	a, (#_player + 0)
	push	de
	inc	sp
	push	af
	inc	sp
	call	_detectPlayerRoom
	pop	af
	ld	-3 (ix),l
	ld	hl, #_enemy + 11
	ld	d,(hl)
	ld	a,-3 (ix)
	sub	a, d
	jr	Z,00102$
;src/main.c:252: auxX = enemy.seenX;
	ld	a,(#_enemy + 12)
	ld	-3 (ix),a
;src/main.c:253: auxY = enemy.seenY;
	ld	hl, #_enemy + 13
	ld	c,(hl)
	jr	00103$
00102$:
;src/main.c:255: auxX = player.x;
	ld	hl, #_player + 0
	ld	a,(hl)
	ld	-3 (ix),a
;src/main.c:256: auxY = player.y;
	ld	hl, #(_player + 0x0001) + 0
	ld	c,(hl)
00103$:
;src/main.c:292: if(temp%2==0){
	ld	a,(#_temp + 0)
	and	a, #0x01
	ld	-4 (ix),a
;src/main.c:293: if(auxX < enemy.x){
	ld	hl, #_enemy + 0
	ld	e,(hl)
;src/main.c:294: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.x-=1;
	ld	a,(#(_enemy + 0x0001) + 0)
	ld	-2 (ix),a
	ld	a,e
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix),a
;src/main.c:297: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1) enemy.x+=1;
	ld	-6 (ix),e
	ld	-5 (ix),#0x00
;src/main.c:294: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.x-=1;
	ld	a,-2 (ix)
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
	ld	-8 (ix),l
	ld	-7 (ix),h
;src/main.c:292: if(temp%2==0){
	ld	a,-4 (ix)
	or	a, a
	jr	NZ,00119$
;src/main.c:293: if(auxX < enemy.x){
	ld	a,-3 (ix)
	sub	a, e
	jr	NC,00109$
;src/main.c:294: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.x-=1;
	ld	hl,#_scene+0
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	add	hl,bc
	ld	c,-1 (ix)
	ld	b,#0x00
	add	hl,bc
	ld	a,(hl)
	dec	a
	jp	Z,00121$
	dec	e
	ld	hl,#_enemy
	ld	(hl),e
	jp	00121$
00109$:
;src/main.c:297: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1) enemy.x+=1;
	ld	a,-8 (ix)
	add	a, #<(_scene)
	ld	c,a
	ld	a,-7 (ix)
	adc	a, #>(_scene)
	ld	b,a
	ld	a,-6 (ix)
	add	a, #0x04
	ld	-10 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	pop	hl
	push	hl
	bit	7, -9 (ix)
	jr	Z,00123$
	ld	a,-6 (ix)
	add	a, #0x07
	ld	l,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	h,a
00123$:
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl,bc
	ld	a,(hl)
	dec	a
	jp	Z,00121$
	inc	e
	ld	hl,#_enemy
	ld	(hl),e
	jp	00121$
00119$:
;src/main.c:300: if(auxY < enemy.y){
	ld	a,c
	sub	a, -2 (ix)
	jr	NC,00116$
;src/main.c:301: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.y-=1;
	ld	hl,#_scene+0
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	e,-1 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00121$
	ld	d,-2 (ix)
	dec	d
	ld	hl,#(_enemy + 0x0001)
	ld	(hl),d
	jr	00121$
00116$:
;src/main.c:304: if(scene[(enemy.y+tilewidth)/tileheight][(enemy.x-1)/tilewidth] != 1) enemy.y+=1;
	ld	c,-2 (ix)
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ld	e,h
	bit	7, e
	jr	Z,00124$
	ld	hl,#0x0013
	add	hl,bc
00124$:
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
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	dec	bc
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z,00125$
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	inc	de
	inc	de
00125$:
	sra	d
	rr	e
	sra	d
	rr	e
	add	hl,de
	ld	a,(hl)
	dec	a
	jr	Z,00121$
	ld	a,-2 (ix)
	inc	a
	ld	(#(_enemy + 0x0001)),a
00121$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:311: u8 vissionSensor(){
;	---------------------------------
; Function vissionSensor
; ---------------------------------
_vissionSensor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/main.c:312: u8 following = 0;
	ld	-4 (ix),#0x00
;src/main.c:313: u8 cx = enemy.x/tilewidth;
	ld	a, (#_enemy + 0)
	rrca
	rrca
	and	a,#0x3F
	ld	-7 (ix),a
;src/main.c:314: u8 cy = enemy.y/tilewidth;
	ld	a, (#(_enemy + 0x0001) + 0)
	rrca
	rrca
	and	a,#0x3F
	ld	c,a
;src/main.c:315: u8 pcx = player.x/tilewidth;
	ld	a, (#_player + 0)
	rrca
	rrca
	and	a,#0x3F
	ld	-1 (ix),a
;src/main.c:316: u8 pcy = player.y/tilewidth;
	ld	a, (#(_player + 0x0001) + 0)
	rrca
	rrca
	and	a,#0x3F
	ld	-2 (ix),a
;src/main.c:319: for(i=0;i<3;i++){
	ld	e,#0x00
00107$:
;src/main.c:320: lex = cx - i;
	ld	a,-7 (ix)
	sub	a, e
	ld	-3 (ix),a
;src/main.c:321: ley = cy - i;
	ld	a,c
	sub	a, e
	ld	-6 (ix),a
;src/main.c:322: mex = cx + i;
	ld	a,-7 (ix)
	add	a, e
	ld	-5 (ix),a
;src/main.c:323: mey = cy + i;
	ld	a,c
	add	a, e
	ld	d,a
;src/main.c:324: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
	ld	a,-3 (ix)
	sub	a, -1 (ix)
	jr	Z,00101$
	ld	a,-6 (ix)
	sub	a, -2 (ix)
	jr	Z,00101$
	ld	a,-5 (ix)
	sub	a, -1 (ix)
	jr	Z,00101$
	ld	a,-2 (ix)
	sub	a, d
	jr	NZ,00108$
00101$:
;src/main.c:325: following = 1;
	ld	-4 (ix),#0x01
00108$:
;src/main.c:319: for(i=0;i<3;i++){
	inc	e
	ld	a,e
	sub	a, #0x03
	jr	C,00107$
;src/main.c:329: return following;
	ld	l,-4 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:333: void shoot(){
;	---------------------------------
; Function shoot
; ---------------------------------
_shoot::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:334: u8 *spr = flecha_dcha,xs=2,ys=8;
	ld	bc,#_flecha_dcha
	ld	e,#0x02
	ld	-1 (ix),#0x08
;src/main.c:335: switch(enemy.dir){
	ld	a,(#(_enemy + 0x0009) + 0)
	cp	a,#0x02
	jr	Z,00103$
	cp	a,#0x04
	jr	Z,00102$
	cp	a,#0x06
	jr	Z,00101$
	sub	a, #0x08
	jr	Z,00104$
	jr	00105$
;src/main.c:336: case 6: spr = flecha_dcha; xs=4;ys=4; break;
00101$:
	ld	bc,#_flecha_dcha
	ld	e,#0x04
	ld	-1 (ix),#0x04
	jr	00105$
;src/main.c:337: case 4: spr = flecha_izda; xs=4;ys=4; break;
00102$:
	ld	bc,#_flecha_izda+0
	ld	e,#0x04
	ld	-1 (ix),#0x04
	jr	00105$
;src/main.c:338: case 2: spr = flecha_abajo; xs=2;ys=8; break;
00103$:
	ld	bc,#_flecha_abajo+0
	ld	e,#0x02
	ld	-1 (ix),#0x08
	jr	00105$
;src/main.c:339: case 8: spr = flecha_arriba; xs=2;ys=8; break;
00104$:
	ld	bc,#_flecha_arriba+0
	ld	e,#0x02
	ld	-1 (ix),#0x08
;src/main.c:340: }
00105$:
;src/main.c:341: earrow.x = enemy.x;
	ld	a, (#_enemy + 0)
	ld	(#_earrow),a
;src/main.c:342: earrow.y = enemy.y+8;
	ld	a, (#_enemy + 1)
	add	a, #0x08
	ld	(#(_earrow + 0x0001)),a
;src/main.c:343: earrow.x = earrow.x;
	ld	hl, #_earrow + 0
	ld	d,(hl)
	ld	hl,#_earrow
	ld	(hl),d
;src/main.c:344: earrow.y = earrow.y;
	ld	(#(_earrow + 0x0001)),a
;src/main.c:345: earrow.sprite = spr;
	ld	((_earrow + 0x0004)), bc
;src/main.c:346: earrow.vivo = 1;
	ld	hl,#_earrow + 6
	ld	(hl),#0x01
;src/main.c:347: earrow.dir = enemy.dir;
	ld	bc,#_earrow + 7
	ld	a, (#(_enemy + 0x0009) + 0)
	ld	(bc),a
;src/main.c:348: earrow.sizeX = xs;
	ld	hl,#_earrow + 8
	ld	(hl),e
;src/main.c:349: earrow.sizeY = ys;
	ld	hl,#_earrow + 9
	ld	a,-1 (ix)
	ld	(hl),a
;src/main.c:350: enemy.bullets--;
	ld	hl,#_enemy + 10
	ld	d,(hl)
	dec	d
	ld	(hl),d
;src/main.c:351: shooted = 1;
	ld	hl,#_shooted + 0
	ld	(hl), #0x01
	inc	sp
	pop	ix
	ret
;src/main.c:360: void arrowCheckings(u8 c){
;	---------------------------------
; Function arrowCheckings
; ---------------------------------
_arrowCheckings::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:362: if(c == 0){
	ld	a,4 (ix)
	or	a, a
	jp	NZ,00122$
;src/main.c:363: if(arrow == 1){
	ld	a,(#_arrow + 0)
	dec	a
	jp	NZ,00124$
;src/main.c:364: moveObject(0);
	xor	a, a
	push	af
	inc	sp
	call	_moveObject
	inc	sp
;src/main.c:365: bound = checkArrowCollisions();
	call	_checkArrowCollisions
	ld	iy,#_bound
	ld	0 (iy),l
;src/main.c:367: if(parrow.dir == 2 || parrow.dir == 8) atkObj = 21;
	ld	a,(#_parrow + 7)
	cp	a,#0x02
	jr	Z,00101$
	sub	a, #0x08
	jr	NZ,00102$
00101$:
	ld	c,#0x15
	jr	00103$
00102$:
;src/main.c:368: else atkObj = 22;
	ld	c,#0x16
00103$:
;src/main.c:370: if(enemy.life > 0 && checkCollisions(parrow.x, parrow.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
	ld	a, (#(_enemy + 0x0008) + 0)
	or	a, a
	jp	Z,00124$
	ld	hl, #(_enemy + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_enemy + 0
	ld	e,(hl)
	ld	a,(#_parrow + 1)
	ld	-1 (ix),a
	ld	hl, #_parrow + 0
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_checkCollisions
	pop	af
	pop	af
	inc	sp
	dec	l
	jp	NZ,00124$
	ld	a,(#_bound + 0)
	or	a, a
	jp	NZ,00124$
;src/main.c:371: enemy.life -= 1;
	ld	a, (#(_enemy + 0x0008) + 0)
	add	a,#0xFF
	ld	(#(_enemy + 0x0008)),a
;src/main.c:372: enemy.x = enemy.ox;
	ld	a, (#_enemy + 4)
	ld	(#_enemy),a
;src/main.c:373: enemy.y = enemy.oy;
	ld	a, (#_enemy + 5)
	ld	(#(_enemy + 0x0001)),a
;src/main.c:374: parrow.vivo = 0;
	ld	hl,#_parrow + 6
	ld	(hl),#0x00
;src/main.c:375: bound = 1;
	ld	hl,#_bound + 0
	ld	(hl), #0x01
	jp	00124$
00122$:
;src/main.c:380: if(shooted == 1){
	ld	a,(#_shooted + 0)
	dec	a
	jr	NZ,00124$
;src/main.c:381: moveObject(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_moveObject
	inc	sp
;src/main.c:382: bounds = checkArrowCollisions();
	call	_checkArrowCollisions
	ld	iy,#_bounds
	ld	0 (iy),l
;src/main.c:384: if(earrow.dir == 2 || earrow.dir == 8) atkObj = 21;
	ld	hl, #_earrow + 7
	ld	h,(hl)
	ld	a,h
	sub	a, #0x02
	jr	Z,00111$
	ld	a,h
	sub	a, #0x08
	jr	NZ,00112$
00111$:
	ld	c,#0x15
	jr	00113$
00112$:
;src/main.c:385: else atkObj = 22;
	ld	c,#0x16
00113$:
;src/main.c:387: if(player.life > 0 && checkCollisions(earrow.x, earrow.y, player.x, player.y, atkObj) == 1 && bounds == 0){
	ld	a, (#(_player + 0x0006) + 0)
	or	a, a
	jr	Z,00124$
	ld	hl, #(_player + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_player + 0
	ld	e,(hl)
	ld	a,(#_earrow + 1)
	ld	-1 (ix),a
	ld	hl, #_earrow + 0
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_checkCollisions
	pop	af
	pop	af
	inc	sp
	dec	l
	jr	NZ,00124$
	ld	a,(#_bounds + 0)
	or	a, a
	jr	NZ,00124$
;src/main.c:388: player.life -= 1;
	ld	a, (#(_player + 0x0006) + 0)
	add	a,#0xFF
	ld	(#(_player + 0x0006)),a
;src/main.c:389: player.x = 0;
	ld	hl,#_player
	ld	(hl),#0x00
;src/main.c:390: player.y = 80;
	ld	hl,#(_player + 0x0001)
	ld	(hl),#0x50
;src/main.c:391: earrow.vivo = 0;
	ld	hl,#_earrow + 6
	ld	(hl),#0x00
;src/main.c:392: bounds = 1;
	ld	hl,#_bounds + 0
	ld	(hl), #0x01
00124$:
	inc	sp
	pop	ix
	ret
;src/main.c:400: void move(){
;	---------------------------------
; Function move
; ---------------------------------
_move::
;src/main.c:402: if(temp > 10){
	ld	a,#0x0A
	ld	iy,#_temp
	sub	a, 0 (iy)
	jr	NC,00123$
;src/main.c:403: enemy.dir = chooseDirection();
	call	_chooseDirection
	ld	a,l
	ld	hl,#(_enemy + 0x0009)
	ld	(hl),a
;src/main.c:404: following = detectPlayerRoom(player.x,player.y);
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
;src/main.c:409: if(following == enemy.room || enemy.pursue != 0){
	ld	hl, #_enemy + 11
	ld	c,(hl)
	ld	de,#_enemy + 14
	ld	a,(de)
	ld	b,a
	ld	a,(#_following + 0)
	sub	a, c
	jr	Z,00106$
	ld	a,b
	or	a, a
	jr	Z,00107$
00106$:
;src/main.c:410: if(enemy.pursue == 0)
	ld	a,b
	or	a, a
	jr	NZ,00104$
;src/main.c:411: enemy.pursue = 3;
	ld	a,#0x03
	ld	(de),a
	jr	00107$
00104$:
;src/main.c:412: else if(enemy.pursue > 1)
	ld	a,#0x01
	sub	a, b
	jr	NC,00107$
;src/main.c:413: enemy.pursue -=1;
	dec	b
	ld	a,b
	ld	(de),a
00107$:
;src/main.c:415: temp = 0;
	ld	hl,#_temp + 0
	ld	(hl), #0x00
	jr	00124$
00123$:
;src/main.c:417: if(enemy.pursue >= 1){
	ld	a,(#(_enemy + 0x000e) + 0)
	sub	a, #0x01
	jr	C,00120$
;src/main.c:418: if(archer >= 2 && enemy.bullets > 0 && shooted == 0){
	ld	a,(#_archer + 0)
	sub	a, #0x02
	jr	C,00115$
	ld	a, (#_enemy + 10)
	or	a, a
	jr	Z,00115$
	ld	a,(#_shooted + 0)
	or	a, a
	jr	NZ,00115$
;src/main.c:419: shoot();
	call	_shoot
;src/main.c:420: archer =0;
	ld	hl,#_archer + 0
	ld	(hl), #0x00
	jr	00124$
00115$:
;src/main.c:423: followPlayer();
	call	_followPlayer
;src/main.c:424: if(shooted == 1) arrowCheckings(1);
	ld	a,(#_shooted + 0)
	dec	a
	jr	NZ,00110$
	ld	a,#0x01
	push	af
	inc	sp
	call	_arrowCheckings
	inc	sp
00110$:
;src/main.c:425: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y){
	ld	hl, #_enemy + 12
	ld	d,(hl)
	ld	hl, #_enemy + 0
	ld	e,(hl)
	ld	a,d
	sub	a, e
	jr	NZ,00124$
	ld	hl, #_enemy + 13
	ld	d,(hl)
	ld	hl, #_enemy + 1
	ld	e,(hl)
	ld	a,d
	sub	a, e
	jr	NZ,00124$
;src/main.c:426: enemy.pursue = 0;
	ld	hl,#(_enemy + 0x000e)
	ld	(hl),#0x00
;src/main.c:427: archer++;
	ld	hl, #_archer+0
	inc	(hl)
	jr	00124$
00120$:
;src/main.c:432: patrol();
	call	_patrol
00124$:
;src/main.c:435: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
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
	ld	a, (#(_player + 0x0001) + 0)
	ld	hl, #_player + 0
	ld	b,(hl)
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_detectPlayerRoom
	pop	af
	ld	b,l
	pop	de
	ld	a,d
	sub	a, b
	jr	Z,00125$
	ld	hl, #_enemy + 14
	ld	h,(hl)
	ld	a,#0x01
	sub	a, h
	jr	NC,00126$
00125$:
;src/main.c:436: enemy.seenX = player.x;
	ld	de,#_enemy + 12
	ld	a, (#_player + 0)
	ld	(de),a
;src/main.c:437: enemy.seenY = player.y;
	ld	de,#_enemy + 13
	ld	a, (#(_player + 0x0001) + 0)
	ld	(de),a
00126$:
;src/main.c:439: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
	ld	a, (#_enemy + 1)
	ld	hl, #_enemy + 0
	ld	d,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_detectPlayerRoom
	pop	af
	ld	a,l
	ld	(#(_enemy + 0x000b)),a
;src/main.c:440: temp += 1;
	ld	hl, #_temp+0
	inc	(hl)
	ret
;src/main.c:444: void enemyIa(){
;	---------------------------------
; Function enemyIa
; ---------------------------------
_enemyIa::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:445: if(enemy.life > 0){
	ld	a,(#(_enemy + 0x0008) + 0)
	or	a, a
	jr	Z,00110$
;src/main.c:446: if(temp%2 == 1){
	ld	a,(#_temp + 0)
	and	a, #0x01
	ld	h,a
;src/main.c:448: enemy.ly = enemy.y;
;src/main.c:446: if(temp%2 == 1){
	dec	h
	jr	NZ,00102$
;src/main.c:447: enemy.lx = enemy.x;
	ld	a, (#_enemy + 0)
	ld	(#(_enemy + 0x0002)),a
;src/main.c:448: enemy.ly = enemy.y;
	ld	de,#_enemy + 3
	ld	a, (#(_enemy + 0x0001) + 0)
	ld	(de),a
00102$:
;src/main.c:451: move();
	call	_move
;src/main.c:453: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
	ld	hl, #_player + 8
	ld	d,(hl)
	ld	hl, #(_enemy + 0x0001) + 0
	ld	e,(hl)
	ld	hl, #_enemy + 0
	ld	b,(hl)
	ld	hl, #(_player + 0x0001) + 0
	ld	c,(hl)
	ld	a,(#_player + 0)
	ld	-1 (ix),a
	push	de
	push	bc
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_checkCollisions
	pop	af
	pop	af
	inc	sp
	ld	a,l
	dec	a
	jr	Z,00103$
	ld	a,l
	sub	a, #0x02
	jr	Z,00104$
	jr	00110$
;src/main.c:454: case 1:
00103$:
;src/main.c:455: enemy.x = enemy.ox;
	ld	a, (#_enemy + 4)
	ld	(#_enemy),a
;src/main.c:456: enemy.y = enemy.oy;
	ld	a, (#_enemy + 5)
	ld	(#(_enemy + 0x0001)),a
;src/main.c:457: enemy.life -= 1;
	ld	a, (#(_enemy + 0x0008) + 0)
	add	a,#0xFF
	ld	(#(_enemy + 0x0008)),a
;src/main.c:458: break;
	jr	00110$
;src/main.c:459: case 2:
00104$:
;src/main.c:460: player.x = 0;
	ld	hl,#_player
	ld	(hl),#0x00
;src/main.c:461: player.y = 80;
	ld	hl,#(_player + 0x0001)
	ld	(hl),#0x50
;src/main.c:462: player.life -= 1;
	ld	hl,#_player + 6
	ld	a,(hl)
	add	a,#0xFF
	ld	(hl),a
;src/main.c:463: if(player.life == 0){
	or	a, a
	jr	NZ,00110$
;src/main.c:464: gameOver();
	call	_gameOver
;src/main.c:468: }
00110$:
	inc	sp
	pop	ix
	ret
;src/main.c:480: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;src/main.c:482: TNivel n = {0,0,0};
	ld	hl,#0x0000
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x0000
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
	ld	-9 (ix),e
	ld	-8 (ix),d
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/main.c:483: bound =0;
	ld	hl,#_bound + 0
	ld	(hl), #0x00
;src/main.c:484: temp = 0;
	ld	hl,#_temp + 0
	ld	(hl), #0x00
;src/main.c:485: map = 1;
	ld	hl,#_map + 0
	ld	(hl), #0x01
;src/main.c:486: arrow =0;
	ld	hl,#_arrow + 0
	ld	(hl), #0x00
;src/main.c:487: finish =0;
	ld	hl,#_finish + 0
	ld	(hl), #0x00
;src/main.c:488: following =0;
	ld	hl,#_following + 0
	ld	(hl), #0x00
;src/main.c:489: archer = 0;
	ld	hl,#_archer + 0
	ld	(hl), #0x00
;src/main.c:490: shooted =0;
	ld	hl,#_shooted + 0
	ld	(hl), #0x00
;src/main.c:492: initPlayer();
	call	_initPlayer
;src/main.c:493: initEnemies();
	call	_initEnemies
;src/main.c:495: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:496: drawMap(map);
	ld	a,(_map)
	push	af
	inc	sp
	call	_drawMap
	inc	sp
;src/main.c:502: while (1){
	ld	a,-9 (ix)
	ld	-5 (ix),a
	ld	a,-8 (ix)
	ld	-4 (ix),a
	ld	a,-7 (ix)
	ld	-2 (ix),a
	ld	a,-6 (ix)
	ld	-1 (ix),a
00116$:
;src/main.c:505: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:508: erases();
	call	_erases
;src/main.c:511: if(temp == 10)
	ld	a,(#_temp + 0)
	sub	a, #0x0A
	jr	NZ,00102$
;src/main.c:512: drawPickUps(n.corazon,n.bullet);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d,(hl)
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawPickUps
	pop	af
00102$:
;src/main.c:515: draws();
	call	_draws
;src/main.c:518: if(temp == 10){
	ld	a,(#_temp + 0)
	sub	a, #0x0A
	jr	NZ,00110$
;src/main.c:519: if(player.atk < 20) drawFatiga(player.atk,2);
	ld	hl, #(_player + 0x0008) + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0x14
	jr	NC,00107$
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00110$
00107$:
;src/main.c:520: else if(player.atk > 20) drawFatiga(player.atk,1);
	ld	a,#0x14
	sub	a, d
	jr	NC,00104$
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
	jr	00110$
00104$:
;src/main.c:521: else drawFatiga(player.atk,0);
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_drawFatiga
	pop	af
00110$:
;src/main.c:526: if(temp%2 == 0){
	ld	iy,#_temp
	bit	0, 0 (iy)
	jr	NZ,00112$
;src/main.c:527: player.lx = player.x;
	ld	a, (#_player + 0)
	ld	hl,#(_player + 0x0002)
	ld	(hl),a
;src/main.c:528: player.ly = player.y;
	ld	de,#_player + 3
	ld	a, (#_player + 1)
	ld	(de),a
00112$:
;src/main.c:531: enemyIa();
	call	_enemyIa
;src/main.c:532: player.latk = player.atk;
	ld	de,#_player + 9
	ld	a, (#(_player + 0x0008) + 0)
	ld	(de),a
;src/main.c:537: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:538: player.sprite = checkKeyboard();
	call	_checkKeyboard
	ld	e,l
	ld	d,h
	ld	((_player + 0x0004)), de
;src/main.c:539: checkBoundsCollisions(&n.corazon,&n.bullet);
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	push	hl
	push	de
	call	_checkBoundsCollisions
	pop	af
	pop	af
;src/main.c:541: arrowCheckings(0);
	xor	a, a
	push	af
	inc	sp
	call	_arrowCheckings
	inc	sp
;src/main.c:543: if(finish == 1) return;
	ld	a,(#_finish + 0)
	dec	a
	jp	NZ,00116$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:550: void credits(){
;	---------------------------------
; Function credits
; ---------------------------------
_credits::
;src/main.c:552: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:553: memptr = cpct_getScreenPtr(VMEM,10,10);
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:554: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
	ex	de,hl
	ld	bc,#___str_5
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
;src/main.c:556: while (1){
00104$:
;src/main.c:558: cpct_scanKeyboard_f();
	push	de
	call	_cpct_scanKeyboard_f
	pop	de
;src/main.c:559: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
	ld	bc,#___str_6
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
;src/main.c:560: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
	ld	bc,#___str_7
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
;src/main.c:564: return;
	ret
___str_5:
	.ascii "Lounge Gladiator"
	.db 0x00
___str_6:
	.ascii "Josep Domenech Mingot"
	.db 0x00
___str_7:
	.ascii "Alberto Martinez Martinez"
	.db 0x00
;src/main.c:574: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:578: init();
	call	_init
;src/main.c:581: while(1){
00106$:
;src/main.c:582: x=menu();
	call	_menu
	ld	e, l
	ld	d, h
;src/main.c:583: switch(x){
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
;src/main.c:584: case 0: return;break;
;src/main.c:585: case 1: game(); break;
	jp	(hl)
00123$:
	jr	00108$
	jr	00102$
	jr	00103$
	jr	00108$
00102$:
	call	_game
	jr	00106$
;src/main.c:586: case 2: credits();break;
00103$:
	call	_credits
;src/main.c:587: }
	jr	00106$
00108$:
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
