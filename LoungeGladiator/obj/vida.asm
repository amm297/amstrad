;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Mon Oct 19 09:43:57 2015
;--------------------------------------------------------
	.module vida
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fatiga_full
	.globl _fatiga_nor
	.globl _corazon_roto
	.globl _corazon_lleno
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
	.area _CODE
_corazon_lleno:
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
_corazon_roto:
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
_fatiga_nor:
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
_fatiga_full:
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
