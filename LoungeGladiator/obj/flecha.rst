                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct 13 11:39:08 2015
                              5 ;--------------------------------------------------------
                              6 	.module flecha
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _flecha_izda
                             13 	.globl _flecha_dcha
                             14 	.globl _flecha_abajo
                             15 	.globl _flecha_arriba
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 	.area _CODE
   6ED1                      48 _flecha_arriba:
   6ED1 FF                   49 	.db #0xFF	; 255
   6ED2 00                   50 	.db #0x00	; 0
   6ED3 55                   51 	.db #0x55	; 85	'U'
   6ED4 80                   52 	.db #0x80	; 128
   6ED5 AA                   53 	.db #0xAA	; 170
   6ED6 40                   54 	.db #0x40	; 64
   6ED7 AA                   55 	.db #0xAA	; 170
   6ED8 40                   56 	.db #0x40	; 64
   6ED9 FF                   57 	.db #0xFF	; 255
   6EDA 00                   58 	.db #0x00	; 0
   6EDB 55                   59 	.db #0x55	; 85	'U'
   6EDC 80                   60 	.db #0x80	; 128
   6EDD FF                   61 	.db #0xFF	; 255
   6EDE 00                   62 	.db #0x00	; 0
   6EDF 55                   63 	.db #0x55	; 85	'U'
   6EE0 80                   64 	.db #0x80	; 128
   6EE1 FF                   65 	.db #0xFF	; 255
   6EE2 00                   66 	.db #0x00	; 0
   6EE3 55                   67 	.db #0x55	; 85	'U'
   6EE4 80                   68 	.db #0x80	; 128
   6EE5 FF                   69 	.db #0xFF	; 255
   6EE6 00                   70 	.db #0x00	; 0
   6EE7 55                   71 	.db #0x55	; 85	'U'
   6EE8 80                   72 	.db #0x80	; 128
   6EE9 FF                   73 	.db #0xFF	; 255
   6EEA 00                   74 	.db #0x00	; 0
   6EEB 55                   75 	.db #0x55	; 85	'U'
   6EEC 80                   76 	.db #0x80	; 128
   6EED FF                   77 	.db #0xFF	; 255
   6EEE 00                   78 	.db #0x00	; 0
   6EEF 55                   79 	.db #0x55	; 85	'U'
   6EF0 80                   80 	.db #0x80	; 128
   6EF1                      81 _flecha_abajo:
   6EF1 AA                   82 	.db #0xAA	; 170
   6EF2 40                   83 	.db #0x40	; 64
   6EF3 FF                   84 	.db #0xFF	; 255
   6EF4 00                   85 	.db #0x00	; 0
   6EF5 AA                   86 	.db #0xAA	; 170
   6EF6 40                   87 	.db #0x40	; 64
   6EF7 FF                   88 	.db #0xFF	; 255
   6EF8 00                   89 	.db #0x00	; 0
   6EF9 AA                   90 	.db #0xAA	; 170
   6EFA 40                   91 	.db #0x40	; 64
   6EFB FF                   92 	.db #0xFF	; 255
   6EFC 00                   93 	.db #0x00	; 0
   6EFD AA                   94 	.db #0xAA	; 170
   6EFE 40                   95 	.db #0x40	; 64
   6EFF FF                   96 	.db #0xFF	; 255
   6F00 00                   97 	.db #0x00	; 0
   6F01 AA                   98 	.db #0xAA	; 170
   6F02 40                   99 	.db #0x40	; 64
   6F03 FF                  100 	.db #0xFF	; 255
   6F04 00                  101 	.db #0x00	; 0
   6F05 AA                  102 	.db #0xAA	; 170
   6F06 40                  103 	.db #0x40	; 64
   6F07 FF                  104 	.db #0xFF	; 255
   6F08 00                  105 	.db #0x00	; 0
   6F09 55                  106 	.db #0x55	; 85	'U'
   6F0A 80                  107 	.db #0x80	; 128
   6F0B 55                  108 	.db #0x55	; 85	'U'
   6F0C 80                  109 	.db #0x80	; 128
   6F0D AA                  110 	.db #0xAA	; 170
   6F0E 40                  111 	.db #0x40	; 64
   6F0F FF                  112 	.db #0xFF	; 255
   6F10 00                  113 	.db #0x00	; 0
   6F11                     114 _flecha_dcha:
   6F11 FF                  115 	.db #0xFF	; 255
   6F12 00                  116 	.db #0x00	; 0
   6F13 FF                  117 	.db #0xFF	; 255
   6F14 00                  118 	.db #0x00	; 0
   6F15 FF                  119 	.db #0xFF	; 255
   6F16 00                  120 	.db #0x00	; 0
   6F17 FF                  121 	.db #0xFF	; 255
   6F18 00                  122 	.db #0x00	; 0
   6F19 FF                  123 	.db #0xFF	; 255
   6F1A 00                  124 	.db #0x00	; 0
   6F1B FF                  125 	.db #0xFF	; 255
   6F1C 00                  126 	.db #0x00	; 0
   6F1D FF                  127 	.db #0xFF	; 255
   6F1E 00                  128 	.db #0x00	; 0
   6F1F 55                  129 	.db #0x55	; 85	'U'
   6F20 80                  130 	.db #0x80	; 128
   6F21 00                  131 	.db #0x00	; 0
   6F22 C0                  132 	.db #0xC0	; 192
   6F23 00                  133 	.db #0x00	; 0
   6F24 C0                  134 	.db #0xC0	; 192
   6F25 00                  135 	.db #0x00	; 0
   6F26 C0                  136 	.db #0xC0	; 192
   6F27 AA                  137 	.db #0xAA	; 170
   6F28 40                  138 	.db #0x40	; 64
   6F29 FF                  139 	.db #0xFF	; 255
   6F2A 00                  140 	.db #0x00	; 0
   6F2B FF                  141 	.db #0xFF	; 255
   6F2C 00                  142 	.db #0x00	; 0
   6F2D FF                  143 	.db #0xFF	; 255
   6F2E 00                  144 	.db #0x00	; 0
   6F2F 55                  145 	.db #0x55	; 85	'U'
   6F30 80                  146 	.db #0x80	; 128
   6F31                     147 _flecha_izda:
   6F31 FF                  148 	.db #0xFF	; 255
   6F32 00                  149 	.db #0x00	; 0
   6F33 FF                  150 	.db #0xFF	; 255
   6F34 00                  151 	.db #0x00	; 0
   6F35 FF                  152 	.db #0xFF	; 255
   6F36 00                  153 	.db #0x00	; 0
   6F37 FF                  154 	.db #0xFF	; 255
   6F38 00                  155 	.db #0x00	; 0
   6F39 AA                  156 	.db #0xAA	; 170
   6F3A 40                  157 	.db #0x40	; 64
   6F3B FF                  158 	.db #0xFF	; 255
   6F3C 00                  159 	.db #0x00	; 0
   6F3D FF                  160 	.db #0xFF	; 255
   6F3E 00                  161 	.db #0x00	; 0
   6F3F FF                  162 	.db #0xFF	; 255
   6F40 00                  163 	.db #0x00	; 0
   6F41 55                  164 	.db #0x55	; 85	'U'
   6F42 80                  165 	.db #0x80	; 128
   6F43 00                  166 	.db #0x00	; 0
   6F44 C0                  167 	.db #0xC0	; 192
   6F45 00                  168 	.db #0x00	; 0
   6F46 C0                  169 	.db #0xC0	; 192
   6F47 00                  170 	.db #0x00	; 0
   6F48 C0                  171 	.db #0xC0	; 192
   6F49 AA                  172 	.db #0xAA	; 170
   6F4A 40                  173 	.db #0x40	; 64
   6F4B FF                  174 	.db #0xFF	; 255
   6F4C 00                  175 	.db #0x00	; 0
   6F4D FF                  176 	.db #0xFF	; 255
   6F4E 00                  177 	.db #0x00	; 0
   6F4F FF                  178 	.db #0xFF	; 255
   6F50 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
