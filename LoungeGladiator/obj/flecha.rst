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
   6F8F                      48 _flecha_arriba:
   6F8F FF                   49 	.db #0xFF	; 255
   6F90 00                   50 	.db #0x00	; 0
   6F91 55                   51 	.db #0x55	; 85	'U'
   6F92 80                   52 	.db #0x80	; 128
   6F93 AA                   53 	.db #0xAA	; 170
   6F94 40                   54 	.db #0x40	; 64
   6F95 AA                   55 	.db #0xAA	; 170
   6F96 40                   56 	.db #0x40	; 64
   6F97 FF                   57 	.db #0xFF	; 255
   6F98 00                   58 	.db #0x00	; 0
   6F99 55                   59 	.db #0x55	; 85	'U'
   6F9A 80                   60 	.db #0x80	; 128
   6F9B FF                   61 	.db #0xFF	; 255
   6F9C 00                   62 	.db #0x00	; 0
   6F9D 55                   63 	.db #0x55	; 85	'U'
   6F9E 80                   64 	.db #0x80	; 128
   6F9F FF                   65 	.db #0xFF	; 255
   6FA0 00                   66 	.db #0x00	; 0
   6FA1 55                   67 	.db #0x55	; 85	'U'
   6FA2 80                   68 	.db #0x80	; 128
   6FA3 FF                   69 	.db #0xFF	; 255
   6FA4 00                   70 	.db #0x00	; 0
   6FA5 55                   71 	.db #0x55	; 85	'U'
   6FA6 80                   72 	.db #0x80	; 128
   6FA7 FF                   73 	.db #0xFF	; 255
   6FA8 00                   74 	.db #0x00	; 0
   6FA9 55                   75 	.db #0x55	; 85	'U'
   6FAA 80                   76 	.db #0x80	; 128
   6FAB FF                   77 	.db #0xFF	; 255
   6FAC 00                   78 	.db #0x00	; 0
   6FAD 55                   79 	.db #0x55	; 85	'U'
   6FAE 80                   80 	.db #0x80	; 128
   6FAF                      81 _flecha_abajo:
   6FAF AA                   82 	.db #0xAA	; 170
   6FB0 40                   83 	.db #0x40	; 64
   6FB1 FF                   84 	.db #0xFF	; 255
   6FB2 00                   85 	.db #0x00	; 0
   6FB3 AA                   86 	.db #0xAA	; 170
   6FB4 40                   87 	.db #0x40	; 64
   6FB5 FF                   88 	.db #0xFF	; 255
   6FB6 00                   89 	.db #0x00	; 0
   6FB7 AA                   90 	.db #0xAA	; 170
   6FB8 40                   91 	.db #0x40	; 64
   6FB9 FF                   92 	.db #0xFF	; 255
   6FBA 00                   93 	.db #0x00	; 0
   6FBB AA                   94 	.db #0xAA	; 170
   6FBC 40                   95 	.db #0x40	; 64
   6FBD FF                   96 	.db #0xFF	; 255
   6FBE 00                   97 	.db #0x00	; 0
   6FBF AA                   98 	.db #0xAA	; 170
   6FC0 40                   99 	.db #0x40	; 64
   6FC1 FF                  100 	.db #0xFF	; 255
   6FC2 00                  101 	.db #0x00	; 0
   6FC3 AA                  102 	.db #0xAA	; 170
   6FC4 40                  103 	.db #0x40	; 64
   6FC5 FF                  104 	.db #0xFF	; 255
   6FC6 00                  105 	.db #0x00	; 0
   6FC7 55                  106 	.db #0x55	; 85	'U'
   6FC8 80                  107 	.db #0x80	; 128
   6FC9 55                  108 	.db #0x55	; 85	'U'
   6FCA 80                  109 	.db #0x80	; 128
   6FCB AA                  110 	.db #0xAA	; 170
   6FCC 40                  111 	.db #0x40	; 64
   6FCD FF                  112 	.db #0xFF	; 255
   6FCE 00                  113 	.db #0x00	; 0
   6FCF                     114 _flecha_dcha:
   6FCF FF                  115 	.db #0xFF	; 255
   6FD0 00                  116 	.db #0x00	; 0
   6FD1 FF                  117 	.db #0xFF	; 255
   6FD2 00                  118 	.db #0x00	; 0
   6FD3 FF                  119 	.db #0xFF	; 255
   6FD4 00                  120 	.db #0x00	; 0
   6FD5 FF                  121 	.db #0xFF	; 255
   6FD6 00                  122 	.db #0x00	; 0
   6FD7 FF                  123 	.db #0xFF	; 255
   6FD8 00                  124 	.db #0x00	; 0
   6FD9 FF                  125 	.db #0xFF	; 255
   6FDA 00                  126 	.db #0x00	; 0
   6FDB FF                  127 	.db #0xFF	; 255
   6FDC 00                  128 	.db #0x00	; 0
   6FDD 55                  129 	.db #0x55	; 85	'U'
   6FDE 80                  130 	.db #0x80	; 128
   6FDF 00                  131 	.db #0x00	; 0
   6FE0 C0                  132 	.db #0xC0	; 192
   6FE1 00                  133 	.db #0x00	; 0
   6FE2 C0                  134 	.db #0xC0	; 192
   6FE3 00                  135 	.db #0x00	; 0
   6FE4 C0                  136 	.db #0xC0	; 192
   6FE5 AA                  137 	.db #0xAA	; 170
   6FE6 40                  138 	.db #0x40	; 64
   6FE7 FF                  139 	.db #0xFF	; 255
   6FE8 00                  140 	.db #0x00	; 0
   6FE9 FF                  141 	.db #0xFF	; 255
   6FEA 00                  142 	.db #0x00	; 0
   6FEB FF                  143 	.db #0xFF	; 255
   6FEC 00                  144 	.db #0x00	; 0
   6FED 55                  145 	.db #0x55	; 85	'U'
   6FEE 80                  146 	.db #0x80	; 128
   6FEF                     147 _flecha_izda:
   6FEF FF                  148 	.db #0xFF	; 255
   6FF0 00                  149 	.db #0x00	; 0
   6FF1 FF                  150 	.db #0xFF	; 255
   6FF2 00                  151 	.db #0x00	; 0
   6FF3 FF                  152 	.db #0xFF	; 255
   6FF4 00                  153 	.db #0x00	; 0
   6FF5 FF                  154 	.db #0xFF	; 255
   6FF6 00                  155 	.db #0x00	; 0
   6FF7 AA                  156 	.db #0xAA	; 170
   6FF8 40                  157 	.db #0x40	; 64
   6FF9 FF                  158 	.db #0xFF	; 255
   6FFA 00                  159 	.db #0x00	; 0
   6FFB FF                  160 	.db #0xFF	; 255
   6FFC 00                  161 	.db #0x00	; 0
   6FFD FF                  162 	.db #0xFF	; 255
   6FFE 00                  163 	.db #0x00	; 0
   6FFF 55                  164 	.db #0x55	; 85	'U'
   7000 80                  165 	.db #0x80	; 128
   7001 00                  166 	.db #0x00	; 0
   7002 C0                  167 	.db #0xC0	; 192
   7003 00                  168 	.db #0x00	; 0
   7004 C0                  169 	.db #0xC0	; 192
   7005 00                  170 	.db #0x00	; 0
   7006 C0                  171 	.db #0xC0	; 192
   7007 AA                  172 	.db #0xAA	; 170
   7008 40                  173 	.db #0x40	; 64
   7009 FF                  174 	.db #0xFF	; 255
   700A 00                  175 	.db #0x00	; 0
   700B FF                  176 	.db #0xFF	; 255
   700C 00                  177 	.db #0x00	; 0
   700D FF                  178 	.db #0xFF	; 255
   700E 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
