;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
; This file was generated Tue Oct 20 17:34:45 2015
;--------------------------------------------------------
	.module muro
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_tile_muro
	.globl _g_tile_tileset
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
_g_tile_tileset:
	.dw _g_tile_muro
_g_tile_muro:
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0xCC	; 204
	.area _INITIALIZER
	.area _CABS (ABS)
