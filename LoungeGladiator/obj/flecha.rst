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
   6BC3                      48 _flecha_arriba:
   6BC3 FF                   49 	.db #0xFF	; 255
   6BC4 00                   50 	.db #0x00	; 0
   6BC5 55                   51 	.db #0x55	; 85	'U'
   6BC6 80                   52 	.db #0x80	; 128
   6BC7 AA                   53 	.db #0xAA	; 170
   6BC8 40                   54 	.db #0x40	; 64
   6BC9 AA                   55 	.db #0xAA	; 170
   6BCA 40                   56 	.db #0x40	; 64
   6BCB FF                   57 	.db #0xFF	; 255
   6BCC 00                   58 	.db #0x00	; 0
   6BCD 55                   59 	.db #0x55	; 85	'U'
   6BCE 80                   60 	.db #0x80	; 128
   6BCF FF                   61 	.db #0xFF	; 255
   6BD0 00                   62 	.db #0x00	; 0
   6BD1 55                   63 	.db #0x55	; 85	'U'
   6BD2 80                   64 	.db #0x80	; 128
   6BD3 FF                   65 	.db #0xFF	; 255
   6BD4 00                   66 	.db #0x00	; 0
   6BD5 55                   67 	.db #0x55	; 85	'U'
   6BD6 80                   68 	.db #0x80	; 128
   6BD7 FF                   69 	.db #0xFF	; 255
   6BD8 00                   70 	.db #0x00	; 0
   6BD9 55                   71 	.db #0x55	; 85	'U'
   6BDA 80                   72 	.db #0x80	; 128
   6BDB FF                   73 	.db #0xFF	; 255
   6BDC 00                   74 	.db #0x00	; 0
   6BDD 55                   75 	.db #0x55	; 85	'U'
   6BDE 80                   76 	.db #0x80	; 128
   6BDF FF                   77 	.db #0xFF	; 255
   6BE0 00                   78 	.db #0x00	; 0
   6BE1 55                   79 	.db #0x55	; 85	'U'
   6BE2 80                   80 	.db #0x80	; 128
   6BE3                      81 _flecha_abajo:
   6BE3 AA                   82 	.db #0xAA	; 170
   6BE4 40                   83 	.db #0x40	; 64
   6BE5 FF                   84 	.db #0xFF	; 255
   6BE6 00                   85 	.db #0x00	; 0
   6BE7 AA                   86 	.db #0xAA	; 170
   6BE8 40                   87 	.db #0x40	; 64
   6BE9 FF                   88 	.db #0xFF	; 255
   6BEA 00                   89 	.db #0x00	; 0
   6BEB AA                   90 	.db #0xAA	; 170
   6BEC 40                   91 	.db #0x40	; 64
   6BED FF                   92 	.db #0xFF	; 255
   6BEE 00                   93 	.db #0x00	; 0
   6BEF AA                   94 	.db #0xAA	; 170
   6BF0 40                   95 	.db #0x40	; 64
   6BF1 FF                   96 	.db #0xFF	; 255
   6BF2 00                   97 	.db #0x00	; 0
   6BF3 AA                   98 	.db #0xAA	; 170
   6BF4 40                   99 	.db #0x40	; 64
   6BF5 FF                  100 	.db #0xFF	; 255
   6BF6 00                  101 	.db #0x00	; 0
   6BF7 AA                  102 	.db #0xAA	; 170
   6BF8 40                  103 	.db #0x40	; 64
   6BF9 FF                  104 	.db #0xFF	; 255
   6BFA 00                  105 	.db #0x00	; 0
   6BFB 55                  106 	.db #0x55	; 85	'U'
   6BFC 80                  107 	.db #0x80	; 128
   6BFD 55                  108 	.db #0x55	; 85	'U'
   6BFE 80                  109 	.db #0x80	; 128
   6BFF AA                  110 	.db #0xAA	; 170
   6C00 40                  111 	.db #0x40	; 64
   6C01 FF                  112 	.db #0xFF	; 255
   6C02 00                  113 	.db #0x00	; 0
   6C03                     114 _flecha_dcha:
   6C03 FF                  115 	.db #0xFF	; 255
   6C04 00                  116 	.db #0x00	; 0
   6C05 FF                  117 	.db #0xFF	; 255
   6C06 00                  118 	.db #0x00	; 0
   6C07 FF                  119 	.db #0xFF	; 255
   6C08 00                  120 	.db #0x00	; 0
   6C09 FF                  121 	.db #0xFF	; 255
   6C0A 00                  122 	.db #0x00	; 0
   6C0B FF                  123 	.db #0xFF	; 255
   6C0C 00                  124 	.db #0x00	; 0
   6C0D FF                  125 	.db #0xFF	; 255
   6C0E 00                  126 	.db #0x00	; 0
   6C0F FF                  127 	.db #0xFF	; 255
   6C10 00                  128 	.db #0x00	; 0
   6C11 55                  129 	.db #0x55	; 85	'U'
   6C12 80                  130 	.db #0x80	; 128
   6C13 00                  131 	.db #0x00	; 0
   6C14 C0                  132 	.db #0xC0	; 192
   6C15 00                  133 	.db #0x00	; 0
   6C16 C0                  134 	.db #0xC0	; 192
   6C17 00                  135 	.db #0x00	; 0
   6C18 C0                  136 	.db #0xC0	; 192
   6C19 AA                  137 	.db #0xAA	; 170
   6C1A 40                  138 	.db #0x40	; 64
   6C1B FF                  139 	.db #0xFF	; 255
   6C1C 00                  140 	.db #0x00	; 0
   6C1D FF                  141 	.db #0xFF	; 255
   6C1E 00                  142 	.db #0x00	; 0
   6C1F FF                  143 	.db #0xFF	; 255
   6C20 00                  144 	.db #0x00	; 0
   6C21 55                  145 	.db #0x55	; 85	'U'
   6C22 80                  146 	.db #0x80	; 128
   6C23                     147 _flecha_izda:
   6C23 FF                  148 	.db #0xFF	; 255
   6C24 00                  149 	.db #0x00	; 0
   6C25 FF                  150 	.db #0xFF	; 255
   6C26 00                  151 	.db #0x00	; 0
   6C27 FF                  152 	.db #0xFF	; 255
   6C28 00                  153 	.db #0x00	; 0
   6C29 FF                  154 	.db #0xFF	; 255
   6C2A 00                  155 	.db #0x00	; 0
   6C2B AA                  156 	.db #0xAA	; 170
   6C2C 40                  157 	.db #0x40	; 64
   6C2D FF                  158 	.db #0xFF	; 255
   6C2E 00                  159 	.db #0x00	; 0
   6C2F FF                  160 	.db #0xFF	; 255
   6C30 00                  161 	.db #0x00	; 0
   6C31 FF                  162 	.db #0xFF	; 255
   6C32 00                  163 	.db #0x00	; 0
   6C33 55                  164 	.db #0x55	; 85	'U'
   6C34 80                  165 	.db #0x80	; 128
   6C35 00                  166 	.db #0x00	; 0
   6C36 C0                  167 	.db #0xC0	; 192
   6C37 00                  168 	.db #0x00	; 0
   6C38 C0                  169 	.db #0xC0	; 192
   6C39 00                  170 	.db #0x00	; 0
   6C3A C0                  171 	.db #0xC0	; 192
   6C3B AA                  172 	.db #0xAA	; 170
   6C3C 40                  173 	.db #0x40	; 64
   6C3D FF                  174 	.db #0xFF	; 255
   6C3E 00                  175 	.db #0x00	; 0
   6C3F FF                  176 	.db #0xFF	; 255
   6C40 00                  177 	.db #0x00	; 0
   6C41 FF                  178 	.db #0xFF	; 255
   6C42 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
