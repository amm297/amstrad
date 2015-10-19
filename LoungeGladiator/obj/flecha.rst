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
   6E9F                      48 _flecha_arriba:
   6E9F FF                   49 	.db #0xFF	; 255
   6EA0 00                   50 	.db #0x00	; 0
   6EA1 55                   51 	.db #0x55	; 85	'U'
   6EA2 80                   52 	.db #0x80	; 128
   6EA3 AA                   53 	.db #0xAA	; 170
   6EA4 40                   54 	.db #0x40	; 64
   6EA5 AA                   55 	.db #0xAA	; 170
   6EA6 40                   56 	.db #0x40	; 64
   6EA7 FF                   57 	.db #0xFF	; 255
   6EA8 00                   58 	.db #0x00	; 0
   6EA9 55                   59 	.db #0x55	; 85	'U'
   6EAA 80                   60 	.db #0x80	; 128
   6EAB FF                   61 	.db #0xFF	; 255
   6EAC 00                   62 	.db #0x00	; 0
   6EAD 55                   63 	.db #0x55	; 85	'U'
   6EAE 80                   64 	.db #0x80	; 128
   6EAF FF                   65 	.db #0xFF	; 255
   6EB0 00                   66 	.db #0x00	; 0
   6EB1 55                   67 	.db #0x55	; 85	'U'
   6EB2 80                   68 	.db #0x80	; 128
   6EB3 FF                   69 	.db #0xFF	; 255
   6EB4 00                   70 	.db #0x00	; 0
   6EB5 55                   71 	.db #0x55	; 85	'U'
   6EB6 80                   72 	.db #0x80	; 128
   6EB7 FF                   73 	.db #0xFF	; 255
   6EB8 00                   74 	.db #0x00	; 0
   6EB9 55                   75 	.db #0x55	; 85	'U'
   6EBA 80                   76 	.db #0x80	; 128
   6EBB FF                   77 	.db #0xFF	; 255
   6EBC 00                   78 	.db #0x00	; 0
   6EBD 55                   79 	.db #0x55	; 85	'U'
   6EBE 80                   80 	.db #0x80	; 128
   6EBF                      81 _flecha_abajo:
   6EBF AA                   82 	.db #0xAA	; 170
   6EC0 40                   83 	.db #0x40	; 64
   6EC1 FF                   84 	.db #0xFF	; 255
   6EC2 00                   85 	.db #0x00	; 0
   6EC3 AA                   86 	.db #0xAA	; 170
   6EC4 40                   87 	.db #0x40	; 64
   6EC5 FF                   88 	.db #0xFF	; 255
   6EC6 00                   89 	.db #0x00	; 0
   6EC7 AA                   90 	.db #0xAA	; 170
   6EC8 40                   91 	.db #0x40	; 64
   6EC9 FF                   92 	.db #0xFF	; 255
   6ECA 00                   93 	.db #0x00	; 0
   6ECB AA                   94 	.db #0xAA	; 170
   6ECC 40                   95 	.db #0x40	; 64
   6ECD FF                   96 	.db #0xFF	; 255
   6ECE 00                   97 	.db #0x00	; 0
   6ECF AA                   98 	.db #0xAA	; 170
   6ED0 40                   99 	.db #0x40	; 64
   6ED1 FF                  100 	.db #0xFF	; 255
   6ED2 00                  101 	.db #0x00	; 0
   6ED3 AA                  102 	.db #0xAA	; 170
   6ED4 40                  103 	.db #0x40	; 64
   6ED5 FF                  104 	.db #0xFF	; 255
   6ED6 00                  105 	.db #0x00	; 0
   6ED7 55                  106 	.db #0x55	; 85	'U'
   6ED8 80                  107 	.db #0x80	; 128
   6ED9 55                  108 	.db #0x55	; 85	'U'
   6EDA 80                  109 	.db #0x80	; 128
   6EDB AA                  110 	.db #0xAA	; 170
   6EDC 40                  111 	.db #0x40	; 64
   6EDD FF                  112 	.db #0xFF	; 255
   6EDE 00                  113 	.db #0x00	; 0
   6EDF                     114 _flecha_dcha:
   6EDF FF                  115 	.db #0xFF	; 255
   6EE0 00                  116 	.db #0x00	; 0
   6EE1 FF                  117 	.db #0xFF	; 255
   6EE2 00                  118 	.db #0x00	; 0
   6EE3 FF                  119 	.db #0xFF	; 255
   6EE4 00                  120 	.db #0x00	; 0
   6EE5 FF                  121 	.db #0xFF	; 255
   6EE6 00                  122 	.db #0x00	; 0
   6EE7 FF                  123 	.db #0xFF	; 255
   6EE8 00                  124 	.db #0x00	; 0
   6EE9 FF                  125 	.db #0xFF	; 255
   6EEA 00                  126 	.db #0x00	; 0
   6EEB FF                  127 	.db #0xFF	; 255
   6EEC 00                  128 	.db #0x00	; 0
   6EED 55                  129 	.db #0x55	; 85	'U'
   6EEE 80                  130 	.db #0x80	; 128
   6EEF 00                  131 	.db #0x00	; 0
   6EF0 C0                  132 	.db #0xC0	; 192
   6EF1 00                  133 	.db #0x00	; 0
   6EF2 C0                  134 	.db #0xC0	; 192
   6EF3 00                  135 	.db #0x00	; 0
   6EF4 C0                  136 	.db #0xC0	; 192
   6EF5 AA                  137 	.db #0xAA	; 170
   6EF6 40                  138 	.db #0x40	; 64
   6EF7 FF                  139 	.db #0xFF	; 255
   6EF8 00                  140 	.db #0x00	; 0
   6EF9 FF                  141 	.db #0xFF	; 255
   6EFA 00                  142 	.db #0x00	; 0
   6EFB FF                  143 	.db #0xFF	; 255
   6EFC 00                  144 	.db #0x00	; 0
   6EFD 55                  145 	.db #0x55	; 85	'U'
   6EFE 80                  146 	.db #0x80	; 128
   6EFF                     147 _flecha_izda:
   6EFF FF                  148 	.db #0xFF	; 255
   6F00 00                  149 	.db #0x00	; 0
   6F01 FF                  150 	.db #0xFF	; 255
   6F02 00                  151 	.db #0x00	; 0
   6F03 FF                  152 	.db #0xFF	; 255
   6F04 00                  153 	.db #0x00	; 0
   6F05 FF                  154 	.db #0xFF	; 255
   6F06 00                  155 	.db #0x00	; 0
   6F07 AA                  156 	.db #0xAA	; 170
   6F08 40                  157 	.db #0x40	; 64
   6F09 FF                  158 	.db #0xFF	; 255
   6F0A 00                  159 	.db #0x00	; 0
   6F0B FF                  160 	.db #0xFF	; 255
   6F0C 00                  161 	.db #0x00	; 0
   6F0D FF                  162 	.db #0xFF	; 255
   6F0E 00                  163 	.db #0x00	; 0
   6F0F 55                  164 	.db #0x55	; 85	'U'
   6F10 80                  165 	.db #0x80	; 128
   6F11 00                  166 	.db #0x00	; 0
   6F12 C0                  167 	.db #0xC0	; 192
   6F13 00                  168 	.db #0x00	; 0
   6F14 C0                  169 	.db #0xC0	; 192
   6F15 00                  170 	.db #0x00	; 0
   6F16 C0                  171 	.db #0xC0	; 192
   6F17 AA                  172 	.db #0xAA	; 170
   6F18 40                  173 	.db #0x40	; 64
   6F19 FF                  174 	.db #0xFF	; 255
   6F1A 00                  175 	.db #0x00	; 0
   6F1B FF                  176 	.db #0xFF	; 255
   6F1C 00                  177 	.db #0x00	; 0
   6F1D FF                  178 	.db #0xFF	; 255
   6F1E 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
