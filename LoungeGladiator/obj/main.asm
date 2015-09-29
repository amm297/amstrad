;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Tue Sep 29 15:41:30 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _cpct_drawStringM1
	.globl _cpct_memset
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
;src/main.c:22: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:27: cpct_memset(video_memory_start, 0, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:30: cpct_drawStringM1("Welcome to CPCtelera!",
	ld	de,#___str_0
	ld	hl,#0x0001
	push	hl
	ld	hl,#0xC3C0
	push	hl
	push	de
	call	_cpct_drawStringM1
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:34: while (1);
00102$:
	jr	00102$
___str_0:
	.ascii "Welcome to CPCtelera!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
