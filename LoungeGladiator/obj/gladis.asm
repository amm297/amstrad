;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
; This file was generated Mon Oct 19 10:39:35 2015
;--------------------------------------------------------
	.module gladis
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gladis_atk_arriba
	.globl _gladis_atk_abajo
	.globl _gladis_abajo
	.globl _gladis_arriba
	.globl _gladis_atk_izda
	.globl _gladis_atk_dcha
	.globl _gladis_quieto_izda
	.globl _gladis_quieto_dcha
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
_gladis_quieto_dcha:
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
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0xFF	; 255
	.db #0x00	; 0
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
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
_gladis_quieto_izda:
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
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
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
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x80	; 128
_gladis_atk_dcha:
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0xFF	; 255
	.db #0x00	; 0
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
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
_gladis_atk_izda:
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
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
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
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0C	; 12
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
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
_gladis_arriba:
	.db #0xFF	; 255
	.db #0x00	; 0
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
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x80	; 128
_gladis_abajo:
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
_gladis_atk_abajo:
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
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
_gladis_atk_arriba:
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xC8	; 200
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xAA	; 170
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x80	; 128
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
	.area _INITIALIZER
	.area _CABS (ABS)
