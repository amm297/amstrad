                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct  6 11:16:36 2015
                              5 ;--------------------------------------------------------
                              6 	.module flecha_horizontal
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _flecha_izda
                             13 	.globl _flecha_dcha
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
   4F9E                      46 _flecha_dcha:
   4F9E FF                   47 	.db #0xFF	; 255
   4F9F 00                   48 	.db #0x00	; 0
   4FA0 FF                   49 	.db #0xFF	; 255
   4FA1 00                   50 	.db #0x00	; 0
   4FA2 FF                   51 	.db #0xFF	; 255
   4FA3 00                   52 	.db #0x00	; 0
   4FA4 FF                   53 	.db #0xFF	; 255
   4FA5 00                   54 	.db #0x00	; 0
   4FA6 FF                   55 	.db #0xFF	; 255
   4FA7 00                   56 	.db #0x00	; 0
   4FA8 FF                   57 	.db #0xFF	; 255
   4FA9 00                   58 	.db #0x00	; 0
   4FAA FF                   59 	.db #0xFF	; 255
   4FAB 00                   60 	.db #0x00	; 0
   4FAC 55                   61 	.db #0x55	; 85	'U'
   4FAD 80                   62 	.db #0x80	; 128
   4FAE 00                   63 	.db #0x00	; 0
   4FAF C0                   64 	.db #0xC0	; 192
   4FB0 00                   65 	.db #0x00	; 0
   4FB1 C0                   66 	.db #0xC0	; 192
   4FB2 00                   67 	.db #0x00	; 0
   4FB3 C0                   68 	.db #0xC0	; 192
   4FB4 AA                   69 	.db #0xAA	; 170
   4FB5 40                   70 	.db #0x40	; 64
   4FB6 FF                   71 	.db #0xFF	; 255
   4FB7 00                   72 	.db #0x00	; 0
   4FB8 FF                   73 	.db #0xFF	; 255
   4FB9 00                   74 	.db #0x00	; 0
   4FBA FF                   75 	.db #0xFF	; 255
   4FBB 00                   76 	.db #0x00	; 0
   4FBC 55                   77 	.db #0x55	; 85	'U'
   4FBD 80                   78 	.db #0x80	; 128
   4FBE                      79 _flecha_izda:
   4FBE FF                   80 	.db #0xFF	; 255
   4FBF 00                   81 	.db #0x00	; 0
   4FC0 FF                   82 	.db #0xFF	; 255
   4FC1 00                   83 	.db #0x00	; 0
   4FC2 FF                   84 	.db #0xFF	; 255
   4FC3 00                   85 	.db #0x00	; 0
   4FC4 FF                   86 	.db #0xFF	; 255
   4FC5 00                   87 	.db #0x00	; 0
   4FC6 AA                   88 	.db #0xAA	; 170
   4FC7 40                   89 	.db #0x40	; 64
   4FC8 FF                   90 	.db #0xFF	; 255
   4FC9 00                   91 	.db #0x00	; 0
   4FCA FF                   92 	.db #0xFF	; 255
   4FCB 00                   93 	.db #0x00	; 0
   4FCC FF                   94 	.db #0xFF	; 255
   4FCD 00                   95 	.db #0x00	; 0
   4FCE 55                   96 	.db #0x55	; 85	'U'
   4FCF 80                   97 	.db #0x80	; 128
   4FD0 00                   98 	.db #0x00	; 0
   4FD1 C0                   99 	.db #0xC0	; 192
   4FD2 00                  100 	.db #0x00	; 0
   4FD3 C0                  101 	.db #0xC0	; 192
   4FD4 00                  102 	.db #0x00	; 0
   4FD5 C0                  103 	.db #0xC0	; 192
   4FD6 AA                  104 	.db #0xAA	; 170
   4FD7 40                  105 	.db #0x40	; 64
   4FD8 FF                  106 	.db #0xFF	; 255
   4FD9 00                  107 	.db #0x00	; 0
   4FDA FF                  108 	.db #0xFF	; 255
   4FDB 00                  109 	.db #0x00	; 0
   4FDC FF                  110 	.db #0xFF	; 255
   4FDD 00                  111 	.db #0x00	; 0
                            112 	.area _INITIALIZER
                            113 	.area _CABS (ABS)
