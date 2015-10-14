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
   6EA4                      48 _flecha_arriba:
   6EA4 FF                   49 	.db #0xFF	; 255
   6EA5 00                   50 	.db #0x00	; 0
   6EA6 55                   51 	.db #0x55	; 85	'U'
   6EA7 80                   52 	.db #0x80	; 128
   6EA8 AA                   53 	.db #0xAA	; 170
   6EA9 40                   54 	.db #0x40	; 64
   6EAA AA                   55 	.db #0xAA	; 170
   6EAB 40                   56 	.db #0x40	; 64
   6EAC FF                   57 	.db #0xFF	; 255
   6EAD 00                   58 	.db #0x00	; 0
   6EAE 55                   59 	.db #0x55	; 85	'U'
   6EAF 80                   60 	.db #0x80	; 128
   6EB0 FF                   61 	.db #0xFF	; 255
   6EB1 00                   62 	.db #0x00	; 0
   6EB2 55                   63 	.db #0x55	; 85	'U'
   6EB3 80                   64 	.db #0x80	; 128
   6EB4 FF                   65 	.db #0xFF	; 255
   6EB5 00                   66 	.db #0x00	; 0
   6EB6 55                   67 	.db #0x55	; 85	'U'
   6EB7 80                   68 	.db #0x80	; 128
   6EB8 FF                   69 	.db #0xFF	; 255
   6EB9 00                   70 	.db #0x00	; 0
   6EBA 55                   71 	.db #0x55	; 85	'U'
   6EBB 80                   72 	.db #0x80	; 128
   6EBC FF                   73 	.db #0xFF	; 255
   6EBD 00                   74 	.db #0x00	; 0
   6EBE 55                   75 	.db #0x55	; 85	'U'
   6EBF 80                   76 	.db #0x80	; 128
   6EC0 FF                   77 	.db #0xFF	; 255
   6EC1 00                   78 	.db #0x00	; 0
   6EC2 55                   79 	.db #0x55	; 85	'U'
   6EC3 80                   80 	.db #0x80	; 128
   6EC4                      81 _flecha_abajo:
   6EC4 AA                   82 	.db #0xAA	; 170
   6EC5 40                   83 	.db #0x40	; 64
   6EC6 FF                   84 	.db #0xFF	; 255
   6EC7 00                   85 	.db #0x00	; 0
   6EC8 AA                   86 	.db #0xAA	; 170
   6EC9 40                   87 	.db #0x40	; 64
   6ECA FF                   88 	.db #0xFF	; 255
   6ECB 00                   89 	.db #0x00	; 0
   6ECC AA                   90 	.db #0xAA	; 170
   6ECD 40                   91 	.db #0x40	; 64
   6ECE FF                   92 	.db #0xFF	; 255
   6ECF 00                   93 	.db #0x00	; 0
   6ED0 AA                   94 	.db #0xAA	; 170
   6ED1 40                   95 	.db #0x40	; 64
   6ED2 FF                   96 	.db #0xFF	; 255
   6ED3 00                   97 	.db #0x00	; 0
   6ED4 AA                   98 	.db #0xAA	; 170
   6ED5 40                   99 	.db #0x40	; 64
   6ED6 FF                  100 	.db #0xFF	; 255
   6ED7 00                  101 	.db #0x00	; 0
   6ED8 AA                  102 	.db #0xAA	; 170
   6ED9 40                  103 	.db #0x40	; 64
   6EDA FF                  104 	.db #0xFF	; 255
   6EDB 00                  105 	.db #0x00	; 0
   6EDC 55                  106 	.db #0x55	; 85	'U'
   6EDD 80                  107 	.db #0x80	; 128
   6EDE 55                  108 	.db #0x55	; 85	'U'
   6EDF 80                  109 	.db #0x80	; 128
   6EE0 AA                  110 	.db #0xAA	; 170
   6EE1 40                  111 	.db #0x40	; 64
   6EE2 FF                  112 	.db #0xFF	; 255
   6EE3 00                  113 	.db #0x00	; 0
   6EE4                     114 _flecha_dcha:
   6EE4 FF                  115 	.db #0xFF	; 255
   6EE5 00                  116 	.db #0x00	; 0
   6EE6 FF                  117 	.db #0xFF	; 255
   6EE7 00                  118 	.db #0x00	; 0
   6EE8 FF                  119 	.db #0xFF	; 255
   6EE9 00                  120 	.db #0x00	; 0
   6EEA FF                  121 	.db #0xFF	; 255
   6EEB 00                  122 	.db #0x00	; 0
   6EEC FF                  123 	.db #0xFF	; 255
   6EED 00                  124 	.db #0x00	; 0
   6EEE FF                  125 	.db #0xFF	; 255
   6EEF 00                  126 	.db #0x00	; 0
   6EF0 FF                  127 	.db #0xFF	; 255
   6EF1 00                  128 	.db #0x00	; 0
   6EF2 55                  129 	.db #0x55	; 85	'U'
   6EF3 80                  130 	.db #0x80	; 128
   6EF4 00                  131 	.db #0x00	; 0
   6EF5 C0                  132 	.db #0xC0	; 192
   6EF6 00                  133 	.db #0x00	; 0
   6EF7 C0                  134 	.db #0xC0	; 192
   6EF8 00                  135 	.db #0x00	; 0
   6EF9 C0                  136 	.db #0xC0	; 192
   6EFA AA                  137 	.db #0xAA	; 170
   6EFB 40                  138 	.db #0x40	; 64
   6EFC FF                  139 	.db #0xFF	; 255
   6EFD 00                  140 	.db #0x00	; 0
   6EFE FF                  141 	.db #0xFF	; 255
   6EFF 00                  142 	.db #0x00	; 0
   6F00 FF                  143 	.db #0xFF	; 255
   6F01 00                  144 	.db #0x00	; 0
   6F02 55                  145 	.db #0x55	; 85	'U'
   6F03 80                  146 	.db #0x80	; 128
   6F04                     147 _flecha_izda:
   6F04 FF                  148 	.db #0xFF	; 255
   6F05 00                  149 	.db #0x00	; 0
   6F06 FF                  150 	.db #0xFF	; 255
   6F07 00                  151 	.db #0x00	; 0
   6F08 FF                  152 	.db #0xFF	; 255
   6F09 00                  153 	.db #0x00	; 0
   6F0A FF                  154 	.db #0xFF	; 255
   6F0B 00                  155 	.db #0x00	; 0
   6F0C AA                  156 	.db #0xAA	; 170
   6F0D 40                  157 	.db #0x40	; 64
   6F0E FF                  158 	.db #0xFF	; 255
   6F0F 00                  159 	.db #0x00	; 0
   6F10 FF                  160 	.db #0xFF	; 255
   6F11 00                  161 	.db #0x00	; 0
   6F12 FF                  162 	.db #0xFF	; 255
   6F13 00                  163 	.db #0x00	; 0
   6F14 55                  164 	.db #0x55	; 85	'U'
   6F15 80                  165 	.db #0x80	; 128
   6F16 00                  166 	.db #0x00	; 0
   6F17 C0                  167 	.db #0xC0	; 192
   6F18 00                  168 	.db #0x00	; 0
   6F19 C0                  169 	.db #0xC0	; 192
   6F1A 00                  170 	.db #0x00	; 0
   6F1B C0                  171 	.db #0xC0	; 192
   6F1C AA                  172 	.db #0xAA	; 170
   6F1D 40                  173 	.db #0x40	; 64
   6F1E FF                  174 	.db #0xFF	; 255
   6F1F 00                  175 	.db #0x00	; 0
   6F20 FF                  176 	.db #0xFF	; 255
   6F21 00                  177 	.db #0x00	; 0
   6F22 FF                  178 	.db #0xFF	; 255
   6F23 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
