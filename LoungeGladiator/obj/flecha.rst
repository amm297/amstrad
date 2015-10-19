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
   6F9F                      48 _flecha_arriba:
   6F9F FF                   49 	.db #0xFF	; 255
   6FA0 00                   50 	.db #0x00	; 0
   6FA1 55                   51 	.db #0x55	; 85	'U'
   6FA2 80                   52 	.db #0x80	; 128
   6FA3 AA                   53 	.db #0xAA	; 170
   6FA4 40                   54 	.db #0x40	; 64
   6FA5 AA                   55 	.db #0xAA	; 170
   6FA6 40                   56 	.db #0x40	; 64
   6FA7 FF                   57 	.db #0xFF	; 255
   6FA8 00                   58 	.db #0x00	; 0
   6FA9 55                   59 	.db #0x55	; 85	'U'
   6FAA 80                   60 	.db #0x80	; 128
   6FAB FF                   61 	.db #0xFF	; 255
   6FAC 00                   62 	.db #0x00	; 0
   6FAD 55                   63 	.db #0x55	; 85	'U'
   6FAE 80                   64 	.db #0x80	; 128
   6FAF FF                   65 	.db #0xFF	; 255
   6FB0 00                   66 	.db #0x00	; 0
   6FB1 55                   67 	.db #0x55	; 85	'U'
   6FB2 80                   68 	.db #0x80	; 128
   6FB3 FF                   69 	.db #0xFF	; 255
   6FB4 00                   70 	.db #0x00	; 0
   6FB5 55                   71 	.db #0x55	; 85	'U'
   6FB6 80                   72 	.db #0x80	; 128
   6FB7 FF                   73 	.db #0xFF	; 255
   6FB8 00                   74 	.db #0x00	; 0
   6FB9 55                   75 	.db #0x55	; 85	'U'
   6FBA 80                   76 	.db #0x80	; 128
   6FBB FF                   77 	.db #0xFF	; 255
   6FBC 00                   78 	.db #0x00	; 0
   6FBD 55                   79 	.db #0x55	; 85	'U'
   6FBE 80                   80 	.db #0x80	; 128
   6FBF                      81 _flecha_abajo:
   6FBF AA                   82 	.db #0xAA	; 170
   6FC0 40                   83 	.db #0x40	; 64
   6FC1 FF                   84 	.db #0xFF	; 255
   6FC2 00                   85 	.db #0x00	; 0
   6FC3 AA                   86 	.db #0xAA	; 170
   6FC4 40                   87 	.db #0x40	; 64
   6FC5 FF                   88 	.db #0xFF	; 255
   6FC6 00                   89 	.db #0x00	; 0
   6FC7 AA                   90 	.db #0xAA	; 170
   6FC8 40                   91 	.db #0x40	; 64
   6FC9 FF                   92 	.db #0xFF	; 255
   6FCA 00                   93 	.db #0x00	; 0
   6FCB AA                   94 	.db #0xAA	; 170
   6FCC 40                   95 	.db #0x40	; 64
   6FCD FF                   96 	.db #0xFF	; 255
   6FCE 00                   97 	.db #0x00	; 0
   6FCF AA                   98 	.db #0xAA	; 170
   6FD0 40                   99 	.db #0x40	; 64
   6FD1 FF                  100 	.db #0xFF	; 255
   6FD2 00                  101 	.db #0x00	; 0
   6FD3 AA                  102 	.db #0xAA	; 170
   6FD4 40                  103 	.db #0x40	; 64
   6FD5 FF                  104 	.db #0xFF	; 255
   6FD6 00                  105 	.db #0x00	; 0
   6FD7 55                  106 	.db #0x55	; 85	'U'
   6FD8 80                  107 	.db #0x80	; 128
   6FD9 55                  108 	.db #0x55	; 85	'U'
   6FDA 80                  109 	.db #0x80	; 128
   6FDB AA                  110 	.db #0xAA	; 170
   6FDC 40                  111 	.db #0x40	; 64
   6FDD FF                  112 	.db #0xFF	; 255
   6FDE 00                  113 	.db #0x00	; 0
   6FDF                     114 _flecha_dcha:
   6FDF FF                  115 	.db #0xFF	; 255
   6FE0 00                  116 	.db #0x00	; 0
   6FE1 FF                  117 	.db #0xFF	; 255
   6FE2 00                  118 	.db #0x00	; 0
   6FE3 FF                  119 	.db #0xFF	; 255
   6FE4 00                  120 	.db #0x00	; 0
   6FE5 FF                  121 	.db #0xFF	; 255
   6FE6 00                  122 	.db #0x00	; 0
   6FE7 FF                  123 	.db #0xFF	; 255
   6FE8 00                  124 	.db #0x00	; 0
   6FE9 FF                  125 	.db #0xFF	; 255
   6FEA 00                  126 	.db #0x00	; 0
   6FEB FF                  127 	.db #0xFF	; 255
   6FEC 00                  128 	.db #0x00	; 0
   6FED 55                  129 	.db #0x55	; 85	'U'
   6FEE 80                  130 	.db #0x80	; 128
   6FEF 00                  131 	.db #0x00	; 0
   6FF0 C0                  132 	.db #0xC0	; 192
   6FF1 00                  133 	.db #0x00	; 0
   6FF2 C0                  134 	.db #0xC0	; 192
   6FF3 00                  135 	.db #0x00	; 0
   6FF4 C0                  136 	.db #0xC0	; 192
   6FF5 AA                  137 	.db #0xAA	; 170
   6FF6 40                  138 	.db #0x40	; 64
   6FF7 FF                  139 	.db #0xFF	; 255
   6FF8 00                  140 	.db #0x00	; 0
   6FF9 FF                  141 	.db #0xFF	; 255
   6FFA 00                  142 	.db #0x00	; 0
   6FFB FF                  143 	.db #0xFF	; 255
   6FFC 00                  144 	.db #0x00	; 0
   6FFD 55                  145 	.db #0x55	; 85	'U'
   6FFE 80                  146 	.db #0x80	; 128
   6FFF                     147 _flecha_izda:
   6FFF FF                  148 	.db #0xFF	; 255
   7000 00                  149 	.db #0x00	; 0
   7001 FF                  150 	.db #0xFF	; 255
   7002 00                  151 	.db #0x00	; 0
   7003 FF                  152 	.db #0xFF	; 255
   7004 00                  153 	.db #0x00	; 0
   7005 FF                  154 	.db #0xFF	; 255
   7006 00                  155 	.db #0x00	; 0
   7007 AA                  156 	.db #0xAA	; 170
   7008 40                  157 	.db #0x40	; 64
   7009 FF                  158 	.db #0xFF	; 255
   700A 00                  159 	.db #0x00	; 0
   700B FF                  160 	.db #0xFF	; 255
   700C 00                  161 	.db #0x00	; 0
   700D FF                  162 	.db #0xFF	; 255
   700E 00                  163 	.db #0x00	; 0
   700F 55                  164 	.db #0x55	; 85	'U'
   7010 80                  165 	.db #0x80	; 128
   7011 00                  166 	.db #0x00	; 0
   7012 C0                  167 	.db #0xC0	; 192
   7013 00                  168 	.db #0x00	; 0
   7014 C0                  169 	.db #0xC0	; 192
   7015 00                  170 	.db #0x00	; 0
   7016 C0                  171 	.db #0xC0	; 192
   7017 AA                  172 	.db #0xAA	; 170
   7018 40                  173 	.db #0x40	; 64
   7019 FF                  174 	.db #0xFF	; 255
   701A 00                  175 	.db #0x00	; 0
   701B FF                  176 	.db #0xFF	; 255
   701C 00                  177 	.db #0x00	; 0
   701D FF                  178 	.db #0xFF	; 255
   701E 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
