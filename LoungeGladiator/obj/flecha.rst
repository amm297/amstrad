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
   6BBD                      48 _flecha_arriba:
   6BBD FF                   49 	.db #0xFF	; 255
   6BBE 00                   50 	.db #0x00	; 0
   6BBF 55                   51 	.db #0x55	; 85	'U'
   6BC0 80                   52 	.db #0x80	; 128
   6BC1 AA                   53 	.db #0xAA	; 170
   6BC2 40                   54 	.db #0x40	; 64
   6BC3 AA                   55 	.db #0xAA	; 170
   6BC4 40                   56 	.db #0x40	; 64
   6BC5 FF                   57 	.db #0xFF	; 255
   6BC6 00                   58 	.db #0x00	; 0
   6BC7 55                   59 	.db #0x55	; 85	'U'
   6BC8 80                   60 	.db #0x80	; 128
   6BC9 FF                   61 	.db #0xFF	; 255
   6BCA 00                   62 	.db #0x00	; 0
   6BCB 55                   63 	.db #0x55	; 85	'U'
   6BCC 80                   64 	.db #0x80	; 128
   6BCD FF                   65 	.db #0xFF	; 255
   6BCE 00                   66 	.db #0x00	; 0
   6BCF 55                   67 	.db #0x55	; 85	'U'
   6BD0 80                   68 	.db #0x80	; 128
   6BD1 FF                   69 	.db #0xFF	; 255
   6BD2 00                   70 	.db #0x00	; 0
   6BD3 55                   71 	.db #0x55	; 85	'U'
   6BD4 80                   72 	.db #0x80	; 128
   6BD5 FF                   73 	.db #0xFF	; 255
   6BD6 00                   74 	.db #0x00	; 0
   6BD7 55                   75 	.db #0x55	; 85	'U'
   6BD8 80                   76 	.db #0x80	; 128
   6BD9 FF                   77 	.db #0xFF	; 255
   6BDA 00                   78 	.db #0x00	; 0
   6BDB 55                   79 	.db #0x55	; 85	'U'
   6BDC 80                   80 	.db #0x80	; 128
   6BDD                      81 _flecha_abajo:
   6BDD AA                   82 	.db #0xAA	; 170
   6BDE 40                   83 	.db #0x40	; 64
   6BDF FF                   84 	.db #0xFF	; 255
   6BE0 00                   85 	.db #0x00	; 0
   6BE1 AA                   86 	.db #0xAA	; 170
   6BE2 40                   87 	.db #0x40	; 64
   6BE3 FF                   88 	.db #0xFF	; 255
   6BE4 00                   89 	.db #0x00	; 0
   6BE5 AA                   90 	.db #0xAA	; 170
   6BE6 40                   91 	.db #0x40	; 64
   6BE7 FF                   92 	.db #0xFF	; 255
   6BE8 00                   93 	.db #0x00	; 0
   6BE9 AA                   94 	.db #0xAA	; 170
   6BEA 40                   95 	.db #0x40	; 64
   6BEB FF                   96 	.db #0xFF	; 255
   6BEC 00                   97 	.db #0x00	; 0
   6BED AA                   98 	.db #0xAA	; 170
   6BEE 40                   99 	.db #0x40	; 64
   6BEF FF                  100 	.db #0xFF	; 255
   6BF0 00                  101 	.db #0x00	; 0
   6BF1 AA                  102 	.db #0xAA	; 170
   6BF2 40                  103 	.db #0x40	; 64
   6BF3 FF                  104 	.db #0xFF	; 255
   6BF4 00                  105 	.db #0x00	; 0
   6BF5 55                  106 	.db #0x55	; 85	'U'
   6BF6 80                  107 	.db #0x80	; 128
   6BF7 55                  108 	.db #0x55	; 85	'U'
   6BF8 80                  109 	.db #0x80	; 128
   6BF9 AA                  110 	.db #0xAA	; 170
   6BFA 40                  111 	.db #0x40	; 64
   6BFB FF                  112 	.db #0xFF	; 255
   6BFC 00                  113 	.db #0x00	; 0
   6BFD                     114 _flecha_dcha:
   6BFD FF                  115 	.db #0xFF	; 255
   6BFE 00                  116 	.db #0x00	; 0
   6BFF FF                  117 	.db #0xFF	; 255
   6C00 00                  118 	.db #0x00	; 0
   6C01 FF                  119 	.db #0xFF	; 255
   6C02 00                  120 	.db #0x00	; 0
   6C03 FF                  121 	.db #0xFF	; 255
   6C04 00                  122 	.db #0x00	; 0
   6C05 FF                  123 	.db #0xFF	; 255
   6C06 00                  124 	.db #0x00	; 0
   6C07 FF                  125 	.db #0xFF	; 255
   6C08 00                  126 	.db #0x00	; 0
   6C09 FF                  127 	.db #0xFF	; 255
   6C0A 00                  128 	.db #0x00	; 0
   6C0B 55                  129 	.db #0x55	; 85	'U'
   6C0C 80                  130 	.db #0x80	; 128
   6C0D 00                  131 	.db #0x00	; 0
   6C0E C0                  132 	.db #0xC0	; 192
   6C0F 00                  133 	.db #0x00	; 0
   6C10 C0                  134 	.db #0xC0	; 192
   6C11 00                  135 	.db #0x00	; 0
   6C12 C0                  136 	.db #0xC0	; 192
   6C13 AA                  137 	.db #0xAA	; 170
   6C14 40                  138 	.db #0x40	; 64
   6C15 FF                  139 	.db #0xFF	; 255
   6C16 00                  140 	.db #0x00	; 0
   6C17 FF                  141 	.db #0xFF	; 255
   6C18 00                  142 	.db #0x00	; 0
   6C19 FF                  143 	.db #0xFF	; 255
   6C1A 00                  144 	.db #0x00	; 0
   6C1B 55                  145 	.db #0x55	; 85	'U'
   6C1C 80                  146 	.db #0x80	; 128
   6C1D                     147 _flecha_izda:
   6C1D FF                  148 	.db #0xFF	; 255
   6C1E 00                  149 	.db #0x00	; 0
   6C1F FF                  150 	.db #0xFF	; 255
   6C20 00                  151 	.db #0x00	; 0
   6C21 FF                  152 	.db #0xFF	; 255
   6C22 00                  153 	.db #0x00	; 0
   6C23 FF                  154 	.db #0xFF	; 255
   6C24 00                  155 	.db #0x00	; 0
   6C25 AA                  156 	.db #0xAA	; 170
   6C26 40                  157 	.db #0x40	; 64
   6C27 FF                  158 	.db #0xFF	; 255
   6C28 00                  159 	.db #0x00	; 0
   6C29 FF                  160 	.db #0xFF	; 255
   6C2A 00                  161 	.db #0x00	; 0
   6C2B FF                  162 	.db #0xFF	; 255
   6C2C 00                  163 	.db #0x00	; 0
   6C2D 55                  164 	.db #0x55	; 85	'U'
   6C2E 80                  165 	.db #0x80	; 128
   6C2F 00                  166 	.db #0x00	; 0
   6C30 C0                  167 	.db #0xC0	; 192
   6C31 00                  168 	.db #0x00	; 0
   6C32 C0                  169 	.db #0xC0	; 192
   6C33 00                  170 	.db #0x00	; 0
   6C34 C0                  171 	.db #0xC0	; 192
   6C35 AA                  172 	.db #0xAA	; 170
   6C36 40                  173 	.db #0x40	; 64
   6C37 FF                  174 	.db #0xFF	; 255
   6C38 00                  175 	.db #0x00	; 0
   6C39 FF                  176 	.db #0xFF	; 255
   6C3A 00                  177 	.db #0x00	; 0
   6C3B FF                  178 	.db #0xFF	; 255
   6C3C 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
