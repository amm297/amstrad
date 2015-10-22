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
   6CA1                      48 _flecha_arriba:
   6CA1 FF                   49 	.db #0xFF	; 255
   6CA2 00                   50 	.db #0x00	; 0
   6CA3 55                   51 	.db #0x55	; 85	'U'
   6CA4 80                   52 	.db #0x80	; 128
   6CA5 AA                   53 	.db #0xAA	; 170
   6CA6 40                   54 	.db #0x40	; 64
   6CA7 AA                   55 	.db #0xAA	; 170
   6CA8 40                   56 	.db #0x40	; 64
   6CA9 FF                   57 	.db #0xFF	; 255
   6CAA 00                   58 	.db #0x00	; 0
   6CAB 55                   59 	.db #0x55	; 85	'U'
   6CAC 80                   60 	.db #0x80	; 128
   6CAD FF                   61 	.db #0xFF	; 255
   6CAE 00                   62 	.db #0x00	; 0
   6CAF 55                   63 	.db #0x55	; 85	'U'
   6CB0 80                   64 	.db #0x80	; 128
   6CB1 FF                   65 	.db #0xFF	; 255
   6CB2 00                   66 	.db #0x00	; 0
   6CB3 55                   67 	.db #0x55	; 85	'U'
   6CB4 80                   68 	.db #0x80	; 128
   6CB5 FF                   69 	.db #0xFF	; 255
   6CB6 00                   70 	.db #0x00	; 0
   6CB7 55                   71 	.db #0x55	; 85	'U'
   6CB8 80                   72 	.db #0x80	; 128
   6CB9 FF                   73 	.db #0xFF	; 255
   6CBA 00                   74 	.db #0x00	; 0
   6CBB 55                   75 	.db #0x55	; 85	'U'
   6CBC 80                   76 	.db #0x80	; 128
   6CBD FF                   77 	.db #0xFF	; 255
   6CBE 00                   78 	.db #0x00	; 0
   6CBF 55                   79 	.db #0x55	; 85	'U'
   6CC0 80                   80 	.db #0x80	; 128
   6CC1                      81 _flecha_abajo:
   6CC1 AA                   82 	.db #0xAA	; 170
   6CC2 40                   83 	.db #0x40	; 64
   6CC3 FF                   84 	.db #0xFF	; 255
   6CC4 00                   85 	.db #0x00	; 0
   6CC5 AA                   86 	.db #0xAA	; 170
   6CC6 40                   87 	.db #0x40	; 64
   6CC7 FF                   88 	.db #0xFF	; 255
   6CC8 00                   89 	.db #0x00	; 0
   6CC9 AA                   90 	.db #0xAA	; 170
   6CCA 40                   91 	.db #0x40	; 64
   6CCB FF                   92 	.db #0xFF	; 255
   6CCC 00                   93 	.db #0x00	; 0
   6CCD AA                   94 	.db #0xAA	; 170
   6CCE 40                   95 	.db #0x40	; 64
   6CCF FF                   96 	.db #0xFF	; 255
   6CD0 00                   97 	.db #0x00	; 0
   6CD1 AA                   98 	.db #0xAA	; 170
   6CD2 40                   99 	.db #0x40	; 64
   6CD3 FF                  100 	.db #0xFF	; 255
   6CD4 00                  101 	.db #0x00	; 0
   6CD5 AA                  102 	.db #0xAA	; 170
   6CD6 40                  103 	.db #0x40	; 64
   6CD7 FF                  104 	.db #0xFF	; 255
   6CD8 00                  105 	.db #0x00	; 0
   6CD9 55                  106 	.db #0x55	; 85	'U'
   6CDA 80                  107 	.db #0x80	; 128
   6CDB 55                  108 	.db #0x55	; 85	'U'
   6CDC 80                  109 	.db #0x80	; 128
   6CDD AA                  110 	.db #0xAA	; 170
   6CDE 40                  111 	.db #0x40	; 64
   6CDF FF                  112 	.db #0xFF	; 255
   6CE0 00                  113 	.db #0x00	; 0
   6CE1                     114 _flecha_dcha:
   6CE1 FF                  115 	.db #0xFF	; 255
   6CE2 00                  116 	.db #0x00	; 0
   6CE3 FF                  117 	.db #0xFF	; 255
   6CE4 00                  118 	.db #0x00	; 0
   6CE5 FF                  119 	.db #0xFF	; 255
   6CE6 00                  120 	.db #0x00	; 0
   6CE7 FF                  121 	.db #0xFF	; 255
   6CE8 00                  122 	.db #0x00	; 0
   6CE9 FF                  123 	.db #0xFF	; 255
   6CEA 00                  124 	.db #0x00	; 0
   6CEB FF                  125 	.db #0xFF	; 255
   6CEC 00                  126 	.db #0x00	; 0
   6CED FF                  127 	.db #0xFF	; 255
   6CEE 00                  128 	.db #0x00	; 0
   6CEF 55                  129 	.db #0x55	; 85	'U'
   6CF0 80                  130 	.db #0x80	; 128
   6CF1 00                  131 	.db #0x00	; 0
   6CF2 C0                  132 	.db #0xC0	; 192
   6CF3 00                  133 	.db #0x00	; 0
   6CF4 C0                  134 	.db #0xC0	; 192
   6CF5 00                  135 	.db #0x00	; 0
   6CF6 C0                  136 	.db #0xC0	; 192
   6CF7 AA                  137 	.db #0xAA	; 170
   6CF8 40                  138 	.db #0x40	; 64
   6CF9 FF                  139 	.db #0xFF	; 255
   6CFA 00                  140 	.db #0x00	; 0
   6CFB FF                  141 	.db #0xFF	; 255
   6CFC 00                  142 	.db #0x00	; 0
   6CFD FF                  143 	.db #0xFF	; 255
   6CFE 00                  144 	.db #0x00	; 0
   6CFF 55                  145 	.db #0x55	; 85	'U'
   6D00 80                  146 	.db #0x80	; 128
   6D01                     147 _flecha_izda:
   6D01 FF                  148 	.db #0xFF	; 255
   6D02 00                  149 	.db #0x00	; 0
   6D03 FF                  150 	.db #0xFF	; 255
   6D04 00                  151 	.db #0x00	; 0
   6D05 FF                  152 	.db #0xFF	; 255
   6D06 00                  153 	.db #0x00	; 0
   6D07 FF                  154 	.db #0xFF	; 255
   6D08 00                  155 	.db #0x00	; 0
   6D09 AA                  156 	.db #0xAA	; 170
   6D0A 40                  157 	.db #0x40	; 64
   6D0B FF                  158 	.db #0xFF	; 255
   6D0C 00                  159 	.db #0x00	; 0
   6D0D FF                  160 	.db #0xFF	; 255
   6D0E 00                  161 	.db #0x00	; 0
   6D0F FF                  162 	.db #0xFF	; 255
   6D10 00                  163 	.db #0x00	; 0
   6D11 55                  164 	.db #0x55	; 85	'U'
   6D12 80                  165 	.db #0x80	; 128
   6D13 00                  166 	.db #0x00	; 0
   6D14 C0                  167 	.db #0xC0	; 192
   6D15 00                  168 	.db #0x00	; 0
   6D16 C0                  169 	.db #0xC0	; 192
   6D17 00                  170 	.db #0x00	; 0
   6D18 C0                  171 	.db #0xC0	; 192
   6D19 AA                  172 	.db #0xAA	; 170
   6D1A 40                  173 	.db #0x40	; 64
   6D1B FF                  174 	.db #0xFF	; 255
   6D1C 00                  175 	.db #0x00	; 0
   6D1D FF                  176 	.db #0xFF	; 255
   6D1E 00                  177 	.db #0x00	; 0
   6D1F FF                  178 	.db #0xFF	; 255
   6D20 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
