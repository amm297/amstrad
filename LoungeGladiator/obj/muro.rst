                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct 20 17:34:45 2015
                              5 ;--------------------------------------------------------
                              6 	.module muro
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _g_tile_muro
                             13 	.globl _g_tile_tileset
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 	.area _CODE
   6E8F                      46 _g_tile_tileset:
   6E8F 91 6E                47 	.dw _g_tile_muro
   6E91                      48 _g_tile_muro:
   6E91 CC                   49 	.db #0xCC	; 204
   6E92 CC                   50 	.db #0xCC	; 204
   6E93 44                   51 	.db #0x44	; 68	'D'
   6E94 CC                   52 	.db #0xCC	; 204
   6E95 CC                   53 	.db #0xCC	; 204
   6E96 CC                   54 	.db #0xCC	; 204
   6E97 44                   55 	.db #0x44	; 68	'D'
   6E98 CC                   56 	.db #0xCC	; 204
   6E99 00                   57 	.db #0x00	; 0
   6E9A 00                   58 	.db #0x00	; 0
   6E9B 00                   59 	.db #0x00	; 0
   6E9C 00                   60 	.db #0x00	; 0
   6E9D CC                   61 	.db #0xCC	; 204
   6E9E 44                   62 	.db #0x44	; 68	'D'
   6E9F CC                   63 	.db #0xCC	; 204
   6EA0 44                   64 	.db #0x44	; 68	'D'
   6EA1 CC                   65 	.db #0xCC	; 204
   6EA2 44                   66 	.db #0x44	; 68	'D'
   6EA3 CC                   67 	.db #0xCC	; 204
   6EA4 44                   68 	.db #0x44	; 68	'D'
   6EA5 CC                   69 	.db #0xCC	; 204
   6EA6 44                   70 	.db #0x44	; 68	'D'
   6EA7 CC                   71 	.db #0xCC	; 204
   6EA8 44                   72 	.db #0x44	; 68	'D'
   6EA9 00                   73 	.db #0x00	; 0
   6EAA 00                   74 	.db #0x00	; 0
   6EAB 00                   75 	.db #0x00	; 0
   6EAC 00                   76 	.db #0x00	; 0
   6EAD CC                   77 	.db #0xCC	; 204
   6EAE CC                   78 	.db #0xCC	; 204
   6EAF 44                   79 	.db #0x44	; 68	'D'
   6EB0 CC                   80 	.db #0xCC	; 204
   6EB1 CC                   81 	.db #0xCC	; 204
   6EB2 CC                   82 	.db #0xCC	; 204
   6EB3 44                   83 	.db #0x44	; 68	'D'
   6EB4 CC                   84 	.db #0xCC	; 204
   6EB5 CC                   85 	.db #0xCC	; 204
   6EB6 CC                   86 	.db #0xCC	; 204
   6EB7 44                   87 	.db #0x44	; 68	'D'
   6EB8 CC                   88 	.db #0xCC	; 204
   6EB9 00                   89 	.db #0x00	; 0
   6EBA 00                   90 	.db #0x00	; 0
   6EBB 00                   91 	.db #0x00	; 0
   6EBC 00                   92 	.db #0x00	; 0
   6EBD CC                   93 	.db #0xCC	; 204
   6EBE 44                   94 	.db #0x44	; 68	'D'
   6EBF CC                   95 	.db #0xCC	; 204
   6EC0 44                   96 	.db #0x44	; 68	'D'
   6EC1 CC                   97 	.db #0xCC	; 204
   6EC2 44                   98 	.db #0x44	; 68	'D'
   6EC3 CC                   99 	.db #0xCC	; 204
   6EC4 44                  100 	.db #0x44	; 68	'D'
   6EC5 CC                  101 	.db #0xCC	; 204
   6EC6 44                  102 	.db #0x44	; 68	'D'
   6EC7 CC                  103 	.db #0xCC	; 204
   6EC8 44                  104 	.db #0x44	; 68	'D'
   6EC9 00                  105 	.db #0x00	; 0
   6ECA 00                  106 	.db #0x00	; 0
   6ECB 00                  107 	.db #0x00	; 0
   6ECC 00                  108 	.db #0x00	; 0
   6ECD CC                  109 	.db #0xCC	; 204
   6ECE CC                  110 	.db #0xCC	; 204
   6ECF 44                  111 	.db #0x44	; 68	'D'
   6ED0 CC                  112 	.db #0xCC	; 204
                            113 	.area _INITIALIZER
                            114 	.area _CABS (ABS)
