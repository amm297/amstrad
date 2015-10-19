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
   6D7F                      48 _flecha_arriba:
   6D7F FF                   49 	.db #0xFF	; 255
   6D80 00                   50 	.db #0x00	; 0
   6D81 55                   51 	.db #0x55	; 85	'U'
   6D82 80                   52 	.db #0x80	; 128
   6D83 AA                   53 	.db #0xAA	; 170
   6D84 40                   54 	.db #0x40	; 64
   6D85 AA                   55 	.db #0xAA	; 170
   6D86 40                   56 	.db #0x40	; 64
   6D87 FF                   57 	.db #0xFF	; 255
   6D88 00                   58 	.db #0x00	; 0
   6D89 55                   59 	.db #0x55	; 85	'U'
   6D8A 80                   60 	.db #0x80	; 128
   6D8B FF                   61 	.db #0xFF	; 255
   6D8C 00                   62 	.db #0x00	; 0
   6D8D 55                   63 	.db #0x55	; 85	'U'
   6D8E 80                   64 	.db #0x80	; 128
   6D8F FF                   65 	.db #0xFF	; 255
   6D90 00                   66 	.db #0x00	; 0
   6D91 55                   67 	.db #0x55	; 85	'U'
   6D92 80                   68 	.db #0x80	; 128
   6D93 FF                   69 	.db #0xFF	; 255
   6D94 00                   70 	.db #0x00	; 0
   6D95 55                   71 	.db #0x55	; 85	'U'
   6D96 80                   72 	.db #0x80	; 128
   6D97 FF                   73 	.db #0xFF	; 255
   6D98 00                   74 	.db #0x00	; 0
   6D99 55                   75 	.db #0x55	; 85	'U'
   6D9A 80                   76 	.db #0x80	; 128
   6D9B FF                   77 	.db #0xFF	; 255
   6D9C 00                   78 	.db #0x00	; 0
   6D9D 55                   79 	.db #0x55	; 85	'U'
   6D9E 80                   80 	.db #0x80	; 128
   6D9F                      81 _flecha_abajo:
   6D9F AA                   82 	.db #0xAA	; 170
   6DA0 40                   83 	.db #0x40	; 64
   6DA1 FF                   84 	.db #0xFF	; 255
   6DA2 00                   85 	.db #0x00	; 0
   6DA3 AA                   86 	.db #0xAA	; 170
   6DA4 40                   87 	.db #0x40	; 64
   6DA5 FF                   88 	.db #0xFF	; 255
   6DA6 00                   89 	.db #0x00	; 0
   6DA7 AA                   90 	.db #0xAA	; 170
   6DA8 40                   91 	.db #0x40	; 64
   6DA9 FF                   92 	.db #0xFF	; 255
   6DAA 00                   93 	.db #0x00	; 0
   6DAB AA                   94 	.db #0xAA	; 170
   6DAC 40                   95 	.db #0x40	; 64
   6DAD FF                   96 	.db #0xFF	; 255
   6DAE 00                   97 	.db #0x00	; 0
   6DAF AA                   98 	.db #0xAA	; 170
   6DB0 40                   99 	.db #0x40	; 64
   6DB1 FF                  100 	.db #0xFF	; 255
   6DB2 00                  101 	.db #0x00	; 0
   6DB3 AA                  102 	.db #0xAA	; 170
   6DB4 40                  103 	.db #0x40	; 64
   6DB5 FF                  104 	.db #0xFF	; 255
   6DB6 00                  105 	.db #0x00	; 0
   6DB7 55                  106 	.db #0x55	; 85	'U'
   6DB8 80                  107 	.db #0x80	; 128
   6DB9 55                  108 	.db #0x55	; 85	'U'
   6DBA 80                  109 	.db #0x80	; 128
   6DBB AA                  110 	.db #0xAA	; 170
   6DBC 40                  111 	.db #0x40	; 64
   6DBD FF                  112 	.db #0xFF	; 255
   6DBE 00                  113 	.db #0x00	; 0
   6DBF                     114 _flecha_dcha:
   6DBF FF                  115 	.db #0xFF	; 255
   6DC0 00                  116 	.db #0x00	; 0
   6DC1 FF                  117 	.db #0xFF	; 255
   6DC2 00                  118 	.db #0x00	; 0
   6DC3 FF                  119 	.db #0xFF	; 255
   6DC4 00                  120 	.db #0x00	; 0
   6DC5 FF                  121 	.db #0xFF	; 255
   6DC6 00                  122 	.db #0x00	; 0
   6DC7 FF                  123 	.db #0xFF	; 255
   6DC8 00                  124 	.db #0x00	; 0
   6DC9 FF                  125 	.db #0xFF	; 255
   6DCA 00                  126 	.db #0x00	; 0
   6DCB FF                  127 	.db #0xFF	; 255
   6DCC 00                  128 	.db #0x00	; 0
   6DCD 55                  129 	.db #0x55	; 85	'U'
   6DCE 80                  130 	.db #0x80	; 128
   6DCF 00                  131 	.db #0x00	; 0
   6DD0 C0                  132 	.db #0xC0	; 192
   6DD1 00                  133 	.db #0x00	; 0
   6DD2 C0                  134 	.db #0xC0	; 192
   6DD3 00                  135 	.db #0x00	; 0
   6DD4 C0                  136 	.db #0xC0	; 192
   6DD5 AA                  137 	.db #0xAA	; 170
   6DD6 40                  138 	.db #0x40	; 64
   6DD7 FF                  139 	.db #0xFF	; 255
   6DD8 00                  140 	.db #0x00	; 0
   6DD9 FF                  141 	.db #0xFF	; 255
   6DDA 00                  142 	.db #0x00	; 0
   6DDB FF                  143 	.db #0xFF	; 255
   6DDC 00                  144 	.db #0x00	; 0
   6DDD 55                  145 	.db #0x55	; 85	'U'
   6DDE 80                  146 	.db #0x80	; 128
   6DDF                     147 _flecha_izda:
   6DDF FF                  148 	.db #0xFF	; 255
   6DE0 00                  149 	.db #0x00	; 0
   6DE1 FF                  150 	.db #0xFF	; 255
   6DE2 00                  151 	.db #0x00	; 0
   6DE3 FF                  152 	.db #0xFF	; 255
   6DE4 00                  153 	.db #0x00	; 0
   6DE5 FF                  154 	.db #0xFF	; 255
   6DE6 00                  155 	.db #0x00	; 0
   6DE7 AA                  156 	.db #0xAA	; 170
   6DE8 40                  157 	.db #0x40	; 64
   6DE9 FF                  158 	.db #0xFF	; 255
   6DEA 00                  159 	.db #0x00	; 0
   6DEB FF                  160 	.db #0xFF	; 255
   6DEC 00                  161 	.db #0x00	; 0
   6DED FF                  162 	.db #0xFF	; 255
   6DEE 00                  163 	.db #0x00	; 0
   6DEF 55                  164 	.db #0x55	; 85	'U'
   6DF0 80                  165 	.db #0x80	; 128
   6DF1 00                  166 	.db #0x00	; 0
   6DF2 C0                  167 	.db #0xC0	; 192
   6DF3 00                  168 	.db #0x00	; 0
   6DF4 C0                  169 	.db #0xC0	; 192
   6DF5 00                  170 	.db #0x00	; 0
   6DF6 C0                  171 	.db #0xC0	; 192
   6DF7 AA                  172 	.db #0xAA	; 170
   6DF8 40                  173 	.db #0x40	; 64
   6DF9 FF                  174 	.db #0xFF	; 255
   6DFA 00                  175 	.db #0x00	; 0
   6DFB FF                  176 	.db #0xFF	; 255
   6DFC 00                  177 	.db #0x00	; 0
   6DFD FF                  178 	.db #0xFF	; 255
   6DFE 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
