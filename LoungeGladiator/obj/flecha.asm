;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Fri Oct 23 09:13:30 2015
;--------------------------------------------------------
	.module flecha
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _flecha_izda
	.globl _flecha_dcha
	.globl _flecha_abajo
	.globl _flecha_arriba
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
_flecha_arriba:
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
_flecha_abajo:
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
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
_flecha_dcha:
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
_flecha_izda:
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
