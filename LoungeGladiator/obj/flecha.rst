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
   6CC8                      48 _flecha_arriba:
   6CC8 FF                   49 	.db #0xFF	; 255
   6CC9 00                   50 	.db #0x00	; 0
   6CCA 55                   51 	.db #0x55	; 85	'U'
   6CCB 80                   52 	.db #0x80	; 128
   6CCC AA                   53 	.db #0xAA	; 170
   6CCD 40                   54 	.db #0x40	; 64
   6CCE AA                   55 	.db #0xAA	; 170
   6CCF 40                   56 	.db #0x40	; 64
   6CD0 FF                   57 	.db #0xFF	; 255
   6CD1 00                   58 	.db #0x00	; 0
   6CD2 55                   59 	.db #0x55	; 85	'U'
   6CD3 80                   60 	.db #0x80	; 128
   6CD4 FF                   61 	.db #0xFF	; 255
   6CD5 00                   62 	.db #0x00	; 0
   6CD6 55                   63 	.db #0x55	; 85	'U'
   6CD7 80                   64 	.db #0x80	; 128
   6CD8 FF                   65 	.db #0xFF	; 255
   6CD9 00                   66 	.db #0x00	; 0
   6CDA 55                   67 	.db #0x55	; 85	'U'
   6CDB 80                   68 	.db #0x80	; 128
   6CDC FF                   69 	.db #0xFF	; 255
   6CDD 00                   70 	.db #0x00	; 0
   6CDE 55                   71 	.db #0x55	; 85	'U'
   6CDF 80                   72 	.db #0x80	; 128
   6CE0 FF                   73 	.db #0xFF	; 255
   6CE1 00                   74 	.db #0x00	; 0
   6CE2 55                   75 	.db #0x55	; 85	'U'
   6CE3 80                   76 	.db #0x80	; 128
   6CE4 FF                   77 	.db #0xFF	; 255
   6CE5 00                   78 	.db #0x00	; 0
   6CE6 55                   79 	.db #0x55	; 85	'U'
   6CE7 80                   80 	.db #0x80	; 128
   6CE8                      81 _flecha_abajo:
   6CE8 AA                   82 	.db #0xAA	; 170
   6CE9 40                   83 	.db #0x40	; 64
   6CEA FF                   84 	.db #0xFF	; 255
   6CEB 00                   85 	.db #0x00	; 0
   6CEC AA                   86 	.db #0xAA	; 170
   6CED 40                   87 	.db #0x40	; 64
   6CEE FF                   88 	.db #0xFF	; 255
   6CEF 00                   89 	.db #0x00	; 0
   6CF0 AA                   90 	.db #0xAA	; 170
   6CF1 40                   91 	.db #0x40	; 64
   6CF2 FF                   92 	.db #0xFF	; 255
   6CF3 00                   93 	.db #0x00	; 0
   6CF4 AA                   94 	.db #0xAA	; 170
   6CF5 40                   95 	.db #0x40	; 64
   6CF6 FF                   96 	.db #0xFF	; 255
   6CF7 00                   97 	.db #0x00	; 0
   6CF8 AA                   98 	.db #0xAA	; 170
   6CF9 40                   99 	.db #0x40	; 64
   6CFA FF                  100 	.db #0xFF	; 255
   6CFB 00                  101 	.db #0x00	; 0
   6CFC AA                  102 	.db #0xAA	; 170
   6CFD 40                  103 	.db #0x40	; 64
   6CFE FF                  104 	.db #0xFF	; 255
   6CFF 00                  105 	.db #0x00	; 0
   6D00 55                  106 	.db #0x55	; 85	'U'
   6D01 80                  107 	.db #0x80	; 128
   6D02 55                  108 	.db #0x55	; 85	'U'
   6D03 80                  109 	.db #0x80	; 128
   6D04 AA                  110 	.db #0xAA	; 170
   6D05 40                  111 	.db #0x40	; 64
   6D06 FF                  112 	.db #0xFF	; 255
   6D07 00                  113 	.db #0x00	; 0
   6D08                     114 _flecha_dcha:
   6D08 FF                  115 	.db #0xFF	; 255
   6D09 00                  116 	.db #0x00	; 0
   6D0A FF                  117 	.db #0xFF	; 255
   6D0B 00                  118 	.db #0x00	; 0
   6D0C FF                  119 	.db #0xFF	; 255
   6D0D 00                  120 	.db #0x00	; 0
   6D0E FF                  121 	.db #0xFF	; 255
   6D0F 00                  122 	.db #0x00	; 0
   6D10 FF                  123 	.db #0xFF	; 255
   6D11 00                  124 	.db #0x00	; 0
   6D12 FF                  125 	.db #0xFF	; 255
   6D13 00                  126 	.db #0x00	; 0
   6D14 FF                  127 	.db #0xFF	; 255
   6D15 00                  128 	.db #0x00	; 0
   6D16 55                  129 	.db #0x55	; 85	'U'
   6D17 80                  130 	.db #0x80	; 128
   6D18 00                  131 	.db #0x00	; 0
   6D19 C0                  132 	.db #0xC0	; 192
   6D1A 00                  133 	.db #0x00	; 0
   6D1B C0                  134 	.db #0xC0	; 192
   6D1C 00                  135 	.db #0x00	; 0
   6D1D C0                  136 	.db #0xC0	; 192
   6D1E AA                  137 	.db #0xAA	; 170
   6D1F 40                  138 	.db #0x40	; 64
   6D20 FF                  139 	.db #0xFF	; 255
   6D21 00                  140 	.db #0x00	; 0
   6D22 FF                  141 	.db #0xFF	; 255
   6D23 00                  142 	.db #0x00	; 0
   6D24 FF                  143 	.db #0xFF	; 255
   6D25 00                  144 	.db #0x00	; 0
   6D26 55                  145 	.db #0x55	; 85	'U'
   6D27 80                  146 	.db #0x80	; 128
   6D28                     147 _flecha_izda:
   6D28 FF                  148 	.db #0xFF	; 255
   6D29 00                  149 	.db #0x00	; 0
   6D2A FF                  150 	.db #0xFF	; 255
   6D2B 00                  151 	.db #0x00	; 0
   6D2C FF                  152 	.db #0xFF	; 255
   6D2D 00                  153 	.db #0x00	; 0
   6D2E FF                  154 	.db #0xFF	; 255
   6D2F 00                  155 	.db #0x00	; 0
   6D30 AA                  156 	.db #0xAA	; 170
   6D31 40                  157 	.db #0x40	; 64
   6D32 FF                  158 	.db #0xFF	; 255
   6D33 00                  159 	.db #0x00	; 0
   6D34 FF                  160 	.db #0xFF	; 255
   6D35 00                  161 	.db #0x00	; 0
   6D36 FF                  162 	.db #0xFF	; 255
   6D37 00                  163 	.db #0x00	; 0
   6D38 55                  164 	.db #0x55	; 85	'U'
   6D39 80                  165 	.db #0x80	; 128
   6D3A 00                  166 	.db #0x00	; 0
   6D3B C0                  167 	.db #0xC0	; 192
   6D3C 00                  168 	.db #0x00	; 0
   6D3D C0                  169 	.db #0xC0	; 192
   6D3E 00                  170 	.db #0x00	; 0
   6D3F C0                  171 	.db #0xC0	; 192
   6D40 AA                  172 	.db #0xAA	; 170
   6D41 40                  173 	.db #0x40	; 64
   6D42 FF                  174 	.db #0xFF	; 255
   6D43 00                  175 	.db #0x00	; 0
   6D44 FF                  176 	.db #0xFF	; 255
   6D45 00                  177 	.db #0x00	; 0
   6D46 FF                  178 	.db #0xFF	; 255
   6D47 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
