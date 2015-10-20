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
   6E67                      48 _flecha_arriba:
   6E67 FF                   49 	.db #0xFF	; 255
   6E68 00                   50 	.db #0x00	; 0
   6E69 55                   51 	.db #0x55	; 85	'U'
   6E6A 80                   52 	.db #0x80	; 128
   6E6B AA                   53 	.db #0xAA	; 170
   6E6C 40                   54 	.db #0x40	; 64
   6E6D AA                   55 	.db #0xAA	; 170
   6E6E 40                   56 	.db #0x40	; 64
   6E6F FF                   57 	.db #0xFF	; 255
   6E70 00                   58 	.db #0x00	; 0
   6E71 55                   59 	.db #0x55	; 85	'U'
   6E72 80                   60 	.db #0x80	; 128
   6E73 FF                   61 	.db #0xFF	; 255
   6E74 00                   62 	.db #0x00	; 0
   6E75 55                   63 	.db #0x55	; 85	'U'
   6E76 80                   64 	.db #0x80	; 128
   6E77 FF                   65 	.db #0xFF	; 255
   6E78 00                   66 	.db #0x00	; 0
   6E79 55                   67 	.db #0x55	; 85	'U'
   6E7A 80                   68 	.db #0x80	; 128
   6E7B FF                   69 	.db #0xFF	; 255
   6E7C 00                   70 	.db #0x00	; 0
   6E7D 55                   71 	.db #0x55	; 85	'U'
   6E7E 80                   72 	.db #0x80	; 128
   6E7F FF                   73 	.db #0xFF	; 255
   6E80 00                   74 	.db #0x00	; 0
   6E81 55                   75 	.db #0x55	; 85	'U'
   6E82 80                   76 	.db #0x80	; 128
   6E83 FF                   77 	.db #0xFF	; 255
   6E84 00                   78 	.db #0x00	; 0
   6E85 55                   79 	.db #0x55	; 85	'U'
   6E86 80                   80 	.db #0x80	; 128
   6E87                      81 _flecha_abajo:
   6E87 AA                   82 	.db #0xAA	; 170
   6E88 40                   83 	.db #0x40	; 64
   6E89 FF                   84 	.db #0xFF	; 255
   6E8A 00                   85 	.db #0x00	; 0
   6E8B AA                   86 	.db #0xAA	; 170
   6E8C 40                   87 	.db #0x40	; 64
   6E8D FF                   88 	.db #0xFF	; 255
   6E8E 00                   89 	.db #0x00	; 0
   6E8F AA                   90 	.db #0xAA	; 170
   6E90 40                   91 	.db #0x40	; 64
   6E91 FF                   92 	.db #0xFF	; 255
   6E92 00                   93 	.db #0x00	; 0
   6E93 AA                   94 	.db #0xAA	; 170
   6E94 40                   95 	.db #0x40	; 64
   6E95 FF                   96 	.db #0xFF	; 255
   6E96 00                   97 	.db #0x00	; 0
   6E97 AA                   98 	.db #0xAA	; 170
   6E98 40                   99 	.db #0x40	; 64
   6E99 FF                  100 	.db #0xFF	; 255
   6E9A 00                  101 	.db #0x00	; 0
   6E9B AA                  102 	.db #0xAA	; 170
   6E9C 40                  103 	.db #0x40	; 64
   6E9D FF                  104 	.db #0xFF	; 255
   6E9E 00                  105 	.db #0x00	; 0
   6E9F 55                  106 	.db #0x55	; 85	'U'
   6EA0 80                  107 	.db #0x80	; 128
   6EA1 55                  108 	.db #0x55	; 85	'U'
   6EA2 80                  109 	.db #0x80	; 128
   6EA3 AA                  110 	.db #0xAA	; 170
   6EA4 40                  111 	.db #0x40	; 64
   6EA5 FF                  112 	.db #0xFF	; 255
   6EA6 00                  113 	.db #0x00	; 0
   6EA7                     114 _flecha_dcha:
   6EA7 FF                  115 	.db #0xFF	; 255
   6EA8 00                  116 	.db #0x00	; 0
   6EA9 FF                  117 	.db #0xFF	; 255
   6EAA 00                  118 	.db #0x00	; 0
   6EAB FF                  119 	.db #0xFF	; 255
   6EAC 00                  120 	.db #0x00	; 0
   6EAD FF                  121 	.db #0xFF	; 255
   6EAE 00                  122 	.db #0x00	; 0
   6EAF FF                  123 	.db #0xFF	; 255
   6EB0 00                  124 	.db #0x00	; 0
   6EB1 FF                  125 	.db #0xFF	; 255
   6EB2 00                  126 	.db #0x00	; 0
   6EB3 FF                  127 	.db #0xFF	; 255
   6EB4 00                  128 	.db #0x00	; 0
   6EB5 55                  129 	.db #0x55	; 85	'U'
   6EB6 80                  130 	.db #0x80	; 128
   6EB7 00                  131 	.db #0x00	; 0
   6EB8 C0                  132 	.db #0xC0	; 192
   6EB9 00                  133 	.db #0x00	; 0
   6EBA C0                  134 	.db #0xC0	; 192
   6EBB 00                  135 	.db #0x00	; 0
   6EBC C0                  136 	.db #0xC0	; 192
   6EBD AA                  137 	.db #0xAA	; 170
   6EBE 40                  138 	.db #0x40	; 64
   6EBF FF                  139 	.db #0xFF	; 255
   6EC0 00                  140 	.db #0x00	; 0
   6EC1 FF                  141 	.db #0xFF	; 255
   6EC2 00                  142 	.db #0x00	; 0
   6EC3 FF                  143 	.db #0xFF	; 255
   6EC4 00                  144 	.db #0x00	; 0
   6EC5 55                  145 	.db #0x55	; 85	'U'
   6EC6 80                  146 	.db #0x80	; 128
   6EC7                     147 _flecha_izda:
   6EC7 FF                  148 	.db #0xFF	; 255
   6EC8 00                  149 	.db #0x00	; 0
   6EC9 FF                  150 	.db #0xFF	; 255
   6ECA 00                  151 	.db #0x00	; 0
   6ECB FF                  152 	.db #0xFF	; 255
   6ECC 00                  153 	.db #0x00	; 0
   6ECD FF                  154 	.db #0xFF	; 255
   6ECE 00                  155 	.db #0x00	; 0
   6ECF AA                  156 	.db #0xAA	; 170
   6ED0 40                  157 	.db #0x40	; 64
   6ED1 FF                  158 	.db #0xFF	; 255
   6ED2 00                  159 	.db #0x00	; 0
   6ED3 FF                  160 	.db #0xFF	; 255
   6ED4 00                  161 	.db #0x00	; 0
   6ED5 FF                  162 	.db #0xFF	; 255
   6ED6 00                  163 	.db #0x00	; 0
   6ED7 55                  164 	.db #0x55	; 85	'U'
   6ED8 80                  165 	.db #0x80	; 128
   6ED9 00                  166 	.db #0x00	; 0
   6EDA C0                  167 	.db #0xC0	; 192
   6EDB 00                  168 	.db #0x00	; 0
   6EDC C0                  169 	.db #0xC0	; 192
   6EDD 00                  170 	.db #0x00	; 0
   6EDE C0                  171 	.db #0xC0	; 192
   6EDF AA                  172 	.db #0xAA	; 170
   6EE0 40                  173 	.db #0x40	; 64
   6EE1 FF                  174 	.db #0xFF	; 255
   6EE2 00                  175 	.db #0x00	; 0
   6EE3 FF                  176 	.db #0xFF	; 255
   6EE4 00                  177 	.db #0x00	; 0
   6EE5 FF                  178 	.db #0xFF	; 255
   6EE6 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
