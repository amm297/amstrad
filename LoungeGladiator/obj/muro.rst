                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct 20 17:29:28 2015
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
   6E25                      46 _g_tile_tileset:
   6E25 27 6E                47 	.dw _g_tile_muro
   6E27                      48 _g_tile_muro:
   6E27 CC                   49 	.db #0xCC	; 204
   6E28 CC                   50 	.db #0xCC	; 204
   6E29 CC                   51 	.db #0xCC	; 204
   6E2A CC                   52 	.db #0xCC	; 204
   6E2B CC                   53 	.db #0xCC	; 204
   6E2C CC                   54 	.db #0xCC	; 204
   6E2D CC                   55 	.db #0xCC	; 204
   6E2E CC                   56 	.db #0xCC	; 204
   6E2F 00                   57 	.db #0x00	; 0
   6E30 00                   58 	.db #0x00	; 0
   6E31 00                   59 	.db #0x00	; 0
   6E32 00                   60 	.db #0x00	; 0
   6E33 CC                   61 	.db #0xCC	; 204
   6E34 CC                   62 	.db #0xCC	; 204
   6E35 CC                   63 	.db #0xCC	; 204
   6E36 CC                   64 	.db #0xCC	; 204
   6E37 CC                   65 	.db #0xCC	; 204
   6E38 CC                   66 	.db #0xCC	; 204
   6E39 CC                   67 	.db #0xCC	; 204
   6E3A CC                   68 	.db #0xCC	; 204
   6E3B CC                   69 	.db #0xCC	; 204
   6E3C CC                   70 	.db #0xCC	; 204
   6E3D CC                   71 	.db #0xCC	; 204
   6E3E CC                   72 	.db #0xCC	; 204
   6E3F 00                   73 	.db #0x00	; 0
   6E40 00                   74 	.db #0x00	; 0
   6E41 00                   75 	.db #0x00	; 0
   6E42 00                   76 	.db #0x00	; 0
   6E43 CC                   77 	.db #0xCC	; 204
   6E44 CC                   78 	.db #0xCC	; 204
   6E45 CC                   79 	.db #0xCC	; 204
   6E46 CC                   80 	.db #0xCC	; 204
   6E47 CC                   81 	.db #0xCC	; 204
   6E48 CC                   82 	.db #0xCC	; 204
   6E49 CC                   83 	.db #0xCC	; 204
   6E4A CC                   84 	.db #0xCC	; 204
   6E4B CC                   85 	.db #0xCC	; 204
   6E4C CC                   86 	.db #0xCC	; 204
   6E4D CC                   87 	.db #0xCC	; 204
   6E4E CC                   88 	.db #0xCC	; 204
   6E4F 00                   89 	.db #0x00	; 0
   6E50 00                   90 	.db #0x00	; 0
   6E51 00                   91 	.db #0x00	; 0
   6E52 00                   92 	.db #0x00	; 0
   6E53 CC                   93 	.db #0xCC	; 204
   6E54 CC                   94 	.db #0xCC	; 204
   6E55 CC                   95 	.db #0xCC	; 204
   6E56 CC                   96 	.db #0xCC	; 204
   6E57 CC                   97 	.db #0xCC	; 204
   6E58 CC                   98 	.db #0xCC	; 204
   6E59 CC                   99 	.db #0xCC	; 204
   6E5A CC                  100 	.db #0xCC	; 204
   6E5B CC                  101 	.db #0xCC	; 204
   6E5C CC                  102 	.db #0xCC	; 204
   6E5D CC                  103 	.db #0xCC	; 204
   6E5E CC                  104 	.db #0xCC	; 204
   6E5F 00                  105 	.db #0x00	; 0
   6E60 00                  106 	.db #0x00	; 0
   6E61 00                  107 	.db #0x00	; 0
   6E62 00                  108 	.db #0x00	; 0
   6E63 CC                  109 	.db #0xCC	; 204
   6E64 CC                  110 	.db #0xCC	; 204
   6E65 CC                  111 	.db #0xCC	; 204
   6E66 CC                  112 	.db #0xCC	; 204
                            113 	.area _INITIALIZER
                            114 	.area _CABS (ABS)
