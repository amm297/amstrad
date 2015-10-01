;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
<<<<<<< HEAD
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Tue Sep 29 18:54:00 2015
=======
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Tue Sep 29 21:11:55 2015
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _loadMap
	.globl _game
<<<<<<< HEAD
	.globl _checkCollisions
	.globl _checkIntersect
=======
	.globl _drawMap
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
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
	.globl _g_palette
	.globl _mapa
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
<<<<<<< HEAD
;src/main.c:40: void init(){
=======
;src/main.c:47: void init(){
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
;	---------------------------------
; Function init
; ---------------------------------
_init::
<<<<<<< HEAD
;src/main.c:41: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:42: cpct_setVideoMode(0);
=======
;src/main.c:48: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:49: cpct_setVideoMode(0);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
<<<<<<< HEAD
;src/main.c:43: cpct_fw2hw(g_palette,4);
=======
;src/main.c:50: cpct_fw2hw(g_palette,4);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
<<<<<<< HEAD
;src/main.c:44: cpct_setPalette(g_palette,4);
=======
;src/main.c:51: cpct_setPalette(g_palette,4);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	de,#_g_palette
	ld	a,#0x04
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
	ret
_mapa:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_palette:
	.db #0x00	; 0
	.db #0x1A	; 26
	.db #0x06	; 6
	.db #0x12	; 18
<<<<<<< HEAD
;src/main.c:48: void menu(){
=======
;src/main.c:55: void menu(){
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
<<<<<<< HEAD
;src/main.c:50: cpct_clearScreen(0);
=======
;src/main.c:57: cpct_clearScreen(0);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
<<<<<<< HEAD
;src/main.c:52: memptr = cpct_getScreenPtr(VMEM,20,10);
=======
;src/main.c:59: memptr = cpct_getScreenPtr(VMEM,20,10);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	hl,#0x0A14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
<<<<<<< HEAD
;src/main.c:53: cpct_drawStringM0("Super Menu",memptr,2,3);
=======
;src/main.c:60: cpct_drawStringM0("MENU",memptr,2,3);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
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
<<<<<<< HEAD
;src/main.c:55: memptr = cpct_getScreenPtr(VMEM,18,180);
=======
;src/main.c:62: memptr = cpct_getScreenPtr(VMEM,18,180);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	hl,#0xB412
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
<<<<<<< HEAD
;src/main.c:56: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
=======
;src/main.c:63: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
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
<<<<<<< HEAD
;src/main.c:58: do{
00101$:
;src/main.c:59: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:60: }while(!cpct_isKeyPressed(Key_Enter));
=======
;src/main.c:65: do{
00101$:
;src/main.c:66: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:67: }while(!cpct_isKeyPressed(Key_Enter));
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
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
<<<<<<< HEAD
;src/main.c:64: u8 checkIntersect(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir){
;	---------------------------------
; Function checkIntersect
; ---------------------------------
_checkIntersect::
;src/main.c:66: }
	ret
;src/main.c:69: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:72: if(eX - pX > -1 && eX - pX < 11)
	ld	c,6 (ix)
	ld	b,#0x00
	ld	l,4 (ix)
	ld	h,#0x00
	ld	a,c
	sub	a, l
	ld	e,a
	ld	a,b
	sbc	a, h
	ld	d,a
;src/main.c:70: if(atk == 1)
	ld	a,10 (ix)
	dec	a
	jr	NZ,00116$
	ld	a,11 (ix)
	or	a, a
	jr	NZ,00116$
;src/main.c:71: if(dir == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00110$
;src/main.c:72: if(eX - pX > -1 && eX - pX < 11)
	ld	a,#0xFF
	cp	a, e
	sbc	a, d
	jp	PO, 00154$
	xor	a, #0x80
00154$:
	jp	P,00102$
	ld	a,e
	sub	a, #0x0B
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
;src/main.c:73: return 1;
	ld	hl,#0x0001
	jr	00118$
00102$:
;src/main.c:75: return 0;
	ld	hl,#0x0000
	jr	00118$
00110$:
;src/main.c:77: if(pX - eX > -1 && pX - eX < 11)
	cp	a, a
	sbc	hl, bc
	ld	a,#0xFF
	cp	a, l
	sbc	a, h
	jp	PO, 00155$
	xor	a, #0x80
00155$:
	jp	P,00106$
	ld	de, #0x800B
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	NC,00106$
;src/main.c:78: return 1;
	ld	hl,#0x0001
	jr	00118$
00106$:
;src/main.c:80: return 0;
	ld	hl,#0x0000
	jr	00118$
00116$:
;src/main.c:82: if(eX - pX > 0 && eX - pX < 4)
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00156$
	xor	a, #0x80
00156$:
	jp	P,00117$
	ld	a,e
	sub	a, #0x04
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00117$
;src/main.c:83: return 2;
	ld	hl,#0x0002
	jr	00118$
00117$:
;src/main.c:85: return 0;
	ld	hl,#0x0000
00118$:
	pop	ix
	ret
;src/main.c:90: void game(){
=======
;src/main.c:73: void drawMap(){
;	---------------------------------
; Function drawMap
; ---------------------------------
_drawMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:77: for(posY=0; posY<height;posY++){
	ld	c,#0x00
	ld	e,#0x00
;src/main.c:78: for(posX=0; posX<width;posX++){
00112$:
	ld	-4 (ix),#0x00
	ld	-1 (ix),#0x00
00105$:
;src/main.c:79: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
	push	bc
	push	de
	ld	a,e
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	ld	-3 (ix),l
	ld	-2 (ix),h
;src/main.c:80: if(mapa[posY][posX] == 1){
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_mapa)
	add	a, l
	ld	l,a
	ld	a,#>(_mapa)
	adc	a, h
	ld	h,a
	ld	a,l
	add	a, -4 (ix)
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	dec	a
	jr	NZ,00106$
;src/main.c:81: cpct_drawSolidBox(memptr, 3, 5, 20);
	ld	d,-3 (ix)
	ld	b,-2 (ix)
	push	bc
	push	de
	ld	hl,#0x1405
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	c,d
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
00106$:
;src/main.c:78: for(posX=0; posX<width;posX++){
	ld	a,-1 (ix)
	add	a, #0x05
	ld	-1 (ix),a
	inc	-4 (ix)
	ld	a,-4 (ix)
	sub	a, #0x10
	jr	C,00105$
;src/main.c:77: for(posY=0; posY<height;posY++){
	ld	a,e
	add	a, #0x14
	ld	e,a
	inc	c
	ld	a,c
	sub	a, #0x0A
	jr	C,00112$
	ld	sp, ix
	pop	ix
	ret
;src/main.c:89: void game(){
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-28
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:91: TPlayer p = { 0,100 };
	ld	hl,#0x000D
=======
;src/main.c:90: TPlayer p = { 0,100 };
	ld	hl,#0x0000
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	add	hl,sp
	ld	(hl),#0x00
	ld	hl,#0x000D
	add	hl,sp
<<<<<<< HEAD
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	a,-11 (ix)
	add	a, #0x01
	ld	-13 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x64
;src/main.c:92: TEnemy  e = { 50,100,0 };
	ld	hl,#0x000A
	add	hl,sp
	ld	(hl),#0x32
	ld	hl,#0x000A
	add	hl,sp
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
=======
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x64
<<<<<<< HEAD
	ld	a,-2 (ix)
	add	a, #0x02
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
;src/main.c:95: u8* dir = 0;
	ld	-20 (ix),#0x00
	ld	-19 (ix),#0x00
;src/main.c:96: u8* atk = 0;
	ld	-22 (ix),#0x00
	ld	-21 (ix),#0x00
;src/main.c:97: u8* col = 0;
	ld	-24 (ix),#0x00
	ld	-23 (ix),#0x00
;src/main.c:98: u8* rebote = 12;
	ld	-26 (ix),#0x0C
	ld	-25 (ix),#0x00
;src/main.c:99: cpct_clearScreen(0);
=======
;src/main.c:92: u8* sprite = gladis_quieto_dcha;
	ld	-6 (ix),#<(_gladis_quieto_dcha)
	ld	-5 (ix),#>(_gladis_quieto_dcha)
;src/main.c:93: cpct_clearScreen(0);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
<<<<<<< HEAD
;src/main.c:101: while (1){
00152$:
;src/main.c:104: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:107: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	b,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	-27 (ix),h
	ld	-28 (ix), l
	ld	-8 (ix), l
	ld	a,-27 (ix)
	ld	-7 (ix),a
;src/main.c:109: cpct_drawSolidBox(memptr,0,4,16);
;src/main.c:108: if(atk == 0)
	ld	a,-21 (ix)
	or	a,-22 (ix)
	jr	NZ,00102$
;src/main.c:109: cpct_drawSolidBox(memptr,0,4,16);
	ld	hl,#0x1004
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	jr	00103$
00102$:
;src/main.c:111: cpct_drawSolidBox(memptr,0,5,16);
	ld	hl,#0x1005
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00103$:
;src/main.c:113: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
=======
;src/main.c:94: drawMap();
	call	_drawMap
;src/main.c:95: while (1){
00112$:
;src/main.c:98: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:101: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
<<<<<<< HEAD
	ld	c, l
	ld	b, h
;src/main.c:114: if(e.vivo == 0)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00105$
;src/main.c:115: cpct_drawSolidBox(memptr,0,4,16);
=======
;src/main.c:102: cpct_drawSolidBox(memptr,0,4,16);
	ex	de,hl
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
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
<<<<<<< HEAD
00105$:
;src/main.c:117: atk = 0;
	ld	-22 (ix),#0x00
	ld	-21 (ix),#0x00
;src/main.c:119: if(col != 2){
	ld	a,-24 (ix)
	sub	a, #0x02
	jr	NZ,00244$
	ld	a,-23 (ix)
	or	a, a
	jr	NZ,00244$
	ld	a,#0x01
	jr	00245$
00244$:
	xor	a,a
00245$:
	ld	c,a
	or	a, a
	jp	NZ,00131$
;src/main.c:120: cpct_scanKeyboard_f();
	push	bc
	call	_cpct_scanKeyboard_f
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00126$
;src/main.c:122: atk = 1;
	ld	-22 (ix),#0x01
	ld	-21 (ix),#0x00
;src/main.c:123: if(cpct_isKeyPressed(Key_CursorRight))
=======
;src/main.c:106: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:107: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
<<<<<<< HEAD
	jr	Z,00109$
;src/main.c:124: dir = 0;
	ld	-20 (ix),#0x00
	ld	-19 (ix),#0x00
	jp	00132$
00109$:
;src/main.c:125: else if(cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00132$
;src/main.c:126: dir = 1;
	ld	-20 (ix),#0x01
	ld	-19 (ix),#0x00
	jp	00132$
00126$:
;src/main.c:127: }else if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
	push	bc
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00122$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00122$
;src/main.c:128: if(col != 2)
	ld	a,c
	or	a, a
	jr	NZ,00112$
;src/main.c:129: p.x += 1;
	inc	d
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),d
00112$:
;src/main.c:130: dir = 0;
	ld	-20 (ix),#0x00
	ld	-19 (ix),#0x00
	jp	00132$
00122$:
;src/main.c:131: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
	push	bc
=======
	jr	Z,00108$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x4C
	jr	NC,00108$
;src/main.c:108: p.x += 1;
	inc	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;src/main.c:109: sprite = gladis_quieto_dcha;
	ld	-6 (ix),#<(_gladis_quieto_dcha)
	ld	-5 (ix),#>(_gladis_quieto_dcha)
	jr	00109$
00108$:
;src/main.c:110: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	pop	bc
	or	a, a
<<<<<<< HEAD
	jr	Z,00118$
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	ld	a,d
	or	a, a
	jr	Z,00118$
;src/main.c:132: if(col != 2)
	ld	a,c
	or	a, a
	jr	NZ,00114$
;src/main.c:133: p.x -= 1;
	dec	d
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),d
00114$:
;src/main.c:134: dir = 1;
	ld	-20 (ix),#0x01
	ld	-19 (ix),#0x00
	jr	00132$
00118$:
;src/main.c:135: }else  if(cpct_isKeyPressed(Key_Esc)){
=======
	jr	Z,00104$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00104$
;src/main.c:111: p.x -= 1;
	add	a,#0xFF
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/main.c:112: sprite = gladis_quieto_izda;
	ld	-6 (ix),#<(_gladis_quieto_izda)
	ld	-5 (ix),#>(_gladis_quieto_izda)
	jr	00109$
00104$:
;src/main.c:113: }else  if(cpct_isKeyPressed(Key_Esc)){
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
<<<<<<< HEAD
	jr	Z,00132$
;src/main.c:136: return;
	jp	00154$
00131$:
;src/main.c:139: p.x -= 2;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	add	a,#0xFE
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),a
;src/main.c:140: rebote -= 2;
	ld	a,-26 (ix)
	add	a,#0xFE
	ld	-8 (ix),a
	ld	a,-25 (ix)
	adc	a,#0xFF
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-26 (ix),a
	ld	a,-7 (ix)
	ld	-25 (ix),a
;src/main.c:141: if(rebote == 0){
	ld	a,-7 (ix)
	or	a,-8 (ix)
	jr	NZ,00132$
;src/main.c:142: rebote = 12;
	ld	-26 (ix),#0x0C
	ld	-25 (ix),#0x00
;src/main.c:143: col = 0;
	ld	-24 (ix),#0x00
	ld	-23 (ix),#0x00
00132$:
;src/main.c:148: if(atk == 0)
	ld	a,-21 (ix)
	or	a,-22 (ix)
	jr	NZ,00140$
;src/main.c:149: if(dir == 0)
	ld	a,-19 (ix)
	or	a,-20 (ix)
	jr	NZ,00134$
;src/main.c:150: sprite = gladis_quieto_dcha;
	ld	bc,#_gladis_quieto_dcha
	jr	00141$
00134$:
;src/main.c:152: sprite = gladis_quieto_izda;
	ld	bc,#_gladis_quieto_izda
	jr	00141$
00140$:
;src/main.c:153: else if(dir == 0){
	ld	a,-19 (ix)
	or	a,-20 (ix)
	jr	NZ,00137$
;src/main.c:154: sprite = gladis_atk_dcha;
	ld	bc,#_gladis_atk_dcha
	jr	00141$
00137$:
;src/main.c:156: sprite = gladis_atk_izda;
	ld	bc,#_gladis_atk_izda
00141$:
;src/main.c:159: if(col != 2)
	ld	a,-24 (ix)
	sub	a, #0x02
	jr	NZ,00246$
	ld	a,-23 (ix)
	or	a, a
	jr	Z,00143$
00246$:
;src/main.c:160: col = checkCollisions(p.x,p.y,e.x,e.y,dir,atk);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-8 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	push	bc
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	ld	a,-8 (ix)
	push	af
	inc	sp
	ld	a,-9 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_checkCollisions
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	-24 (ix),l
	ld	-23 (ix),h
00143$:
;src/main.c:161: if(col == 1)
	ld	a,-24 (ix)
	dec	a
	jr	NZ,00145$
	ld	a,-23 (ix)
	or	a, a
	jr	NZ,00145$
;src/main.c:162: e.vivo = 1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
00145$:
;src/main.c:165: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/main.c:109: cpct_drawSolidBox(memptr,0,4,16);
	ex	de,hl
;src/main.c:168: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
;src/main.c:167: if(atk == 1)
	ld	a,-22 (ix)
	dec	a
	jr	NZ,00147$
	ld	a,-21 (ix)
	or	a, a
	jr	NZ,00147$
;src/main.c:168: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
	ld	hl,#0x1005
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
	jr	00148$
00147$:
;src/main.c:170: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
	ld	hl,#0x1004
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMasked
00148$:
;src/main.c:172: if(e.vivo == 0){
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00152$
;src/main.c:173: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
=======
;src/main.c:114: return;
	jr	NZ,00114$
00109$:
;src/main.c:119: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
<<<<<<< HEAD
;src/main.c:174: cpct_drawSolidBox(memptr, 18, 4, 16);
=======
;src/main.c:120: cpct_drawSpriteMasked(sprite,memptr,4,16);
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	ex	de,hl
	ld	hl,#0x1004
	push	hl
	ld	a,#0x12
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	jp	00152$
00154$:
	ld	sp, ix
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:184: void loadMap(){
=======
;src/main.c:131: void loadMap(){
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
;	---------------------------------
; Function loadMap
; ---------------------------------
_loadMap::
<<<<<<< HEAD
;src/main.c:186: }
	ret
;src/main.c:191: void main(void) {
=======
;src/main.c:133: }
	ret
;src/main.c:138: void main(void) {
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
;	---------------------------------
; Function main
; ---------------------------------
_main::
<<<<<<< HEAD
;src/main.c:193: init();
	call	_init
;src/main.c:196: while(1){
00102$:
;src/main.c:197: menu();
	call	_menu
;src/main.c:198: game();
=======
;src/main.c:140: init();
	call	_init
;src/main.c:144: while(1){
00102$:
;src/main.c:145: menu();
	call	_menu
;src/main.c:147: game();
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
