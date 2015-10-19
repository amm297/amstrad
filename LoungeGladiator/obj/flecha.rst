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
   6B6F                      48 _flecha_arriba:
   6B6F FF                   49 	.db #0xFF	; 255
   6B70 00                   50 	.db #0x00	; 0
   6B71 55                   51 	.db #0x55	; 85	'U'
   6B72 80                   52 	.db #0x80	; 128
   6B73 AA                   53 	.db #0xAA	; 170
   6B74 40                   54 	.db #0x40	; 64
   6B75 AA                   55 	.db #0xAA	; 170
   6B76 40                   56 	.db #0x40	; 64
   6B77 FF                   57 	.db #0xFF	; 255
   6B78 00                   58 	.db #0x00	; 0
   6B79 55                   59 	.db #0x55	; 85	'U'
   6B7A 80                   60 	.db #0x80	; 128
   6B7B FF                   61 	.db #0xFF	; 255
   6B7C 00                   62 	.db #0x00	; 0
   6B7D 55                   63 	.db #0x55	; 85	'U'
   6B7E 80                   64 	.db #0x80	; 128
   6B7F FF                   65 	.db #0xFF	; 255
   6B80 00                   66 	.db #0x00	; 0
   6B81 55                   67 	.db #0x55	; 85	'U'
   6B82 80                   68 	.db #0x80	; 128
   6B83 FF                   69 	.db #0xFF	; 255
   6B84 00                   70 	.db #0x00	; 0
   6B85 55                   71 	.db #0x55	; 85	'U'
   6B86 80                   72 	.db #0x80	; 128
   6B87 FF                   73 	.db #0xFF	; 255
   6B88 00                   74 	.db #0x00	; 0
   6B89 55                   75 	.db #0x55	; 85	'U'
   6B8A 80                   76 	.db #0x80	; 128
   6B8B FF                   77 	.db #0xFF	; 255
   6B8C 00                   78 	.db #0x00	; 0
   6B8D 55                   79 	.db #0x55	; 85	'U'
   6B8E 80                   80 	.db #0x80	; 128
   6B8F                      81 _flecha_abajo:
   6B8F AA                   82 	.db #0xAA	; 170
   6B90 40                   83 	.db #0x40	; 64
   6B91 FF                   84 	.db #0xFF	; 255
   6B92 00                   85 	.db #0x00	; 0
   6B93 AA                   86 	.db #0xAA	; 170
   6B94 40                   87 	.db #0x40	; 64
   6B95 FF                   88 	.db #0xFF	; 255
   6B96 00                   89 	.db #0x00	; 0
   6B97 AA                   90 	.db #0xAA	; 170
   6B98 40                   91 	.db #0x40	; 64
   6B99 FF                   92 	.db #0xFF	; 255
   6B9A 00                   93 	.db #0x00	; 0
   6B9B AA                   94 	.db #0xAA	; 170
   6B9C 40                   95 	.db #0x40	; 64
   6B9D FF                   96 	.db #0xFF	; 255
   6B9E 00                   97 	.db #0x00	; 0
   6B9F AA                   98 	.db #0xAA	; 170
   6BA0 40                   99 	.db #0x40	; 64
   6BA1 FF                  100 	.db #0xFF	; 255
   6BA2 00                  101 	.db #0x00	; 0
   6BA3 AA                  102 	.db #0xAA	; 170
   6BA4 40                  103 	.db #0x40	; 64
   6BA5 FF                  104 	.db #0xFF	; 255
   6BA6 00                  105 	.db #0x00	; 0
   6BA7 55                  106 	.db #0x55	; 85	'U'
   6BA8 80                  107 	.db #0x80	; 128
   6BA9 55                  108 	.db #0x55	; 85	'U'
   6BAA 80                  109 	.db #0x80	; 128
   6BAB AA                  110 	.db #0xAA	; 170
   6BAC 40                  111 	.db #0x40	; 64
   6BAD FF                  112 	.db #0xFF	; 255
   6BAE 00                  113 	.db #0x00	; 0
   6BAF                     114 _flecha_dcha:
   6BAF FF                  115 	.db #0xFF	; 255
   6BB0 00                  116 	.db #0x00	; 0
   6BB1 FF                  117 	.db #0xFF	; 255
   6BB2 00                  118 	.db #0x00	; 0
   6BB3 FF                  119 	.db #0xFF	; 255
   6BB4 00                  120 	.db #0x00	; 0
   6BB5 FF                  121 	.db #0xFF	; 255
   6BB6 00                  122 	.db #0x00	; 0
   6BB7 FF                  123 	.db #0xFF	; 255
   6BB8 00                  124 	.db #0x00	; 0
   6BB9 FF                  125 	.db #0xFF	; 255
   6BBA 00                  126 	.db #0x00	; 0
   6BBB FF                  127 	.db #0xFF	; 255
   6BBC 00                  128 	.db #0x00	; 0
   6BBD 55                  129 	.db #0x55	; 85	'U'
   6BBE 80                  130 	.db #0x80	; 128
   6BBF 00                  131 	.db #0x00	; 0
   6BC0 C0                  132 	.db #0xC0	; 192
   6BC1 00                  133 	.db #0x00	; 0
   6BC2 C0                  134 	.db #0xC0	; 192
   6BC3 00                  135 	.db #0x00	; 0
   6BC4 C0                  136 	.db #0xC0	; 192
   6BC5 AA                  137 	.db #0xAA	; 170
   6BC6 40                  138 	.db #0x40	; 64
   6BC7 FF                  139 	.db #0xFF	; 255
   6BC8 00                  140 	.db #0x00	; 0
   6BC9 FF                  141 	.db #0xFF	; 255
   6BCA 00                  142 	.db #0x00	; 0
   6BCB FF                  143 	.db #0xFF	; 255
   6BCC 00                  144 	.db #0x00	; 0
   6BCD 55                  145 	.db #0x55	; 85	'U'
   6BCE 80                  146 	.db #0x80	; 128
   6BCF                     147 _flecha_izda:
   6BCF FF                  148 	.db #0xFF	; 255
   6BD0 00                  149 	.db #0x00	; 0
   6BD1 FF                  150 	.db #0xFF	; 255
   6BD2 00                  151 	.db #0x00	; 0
   6BD3 FF                  152 	.db #0xFF	; 255
   6BD4 00                  153 	.db #0x00	; 0
   6BD5 FF                  154 	.db #0xFF	; 255
   6BD6 00                  155 	.db #0x00	; 0
   6BD7 AA                  156 	.db #0xAA	; 170
   6BD8 40                  157 	.db #0x40	; 64
   6BD9 FF                  158 	.db #0xFF	; 255
   6BDA 00                  159 	.db #0x00	; 0
   6BDB FF                  160 	.db #0xFF	; 255
   6BDC 00                  161 	.db #0x00	; 0
   6BDD FF                  162 	.db #0xFF	; 255
   6BDE 00                  163 	.db #0x00	; 0
   6BDF 55                  164 	.db #0x55	; 85	'U'
   6BE0 80                  165 	.db #0x80	; 128
   6BE1 00                  166 	.db #0x00	; 0
   6BE2 C0                  167 	.db #0xC0	; 192
   6BE3 00                  168 	.db #0x00	; 0
   6BE4 C0                  169 	.db #0xC0	; 192
   6BE5 00                  170 	.db #0x00	; 0
   6BE6 C0                  171 	.db #0xC0	; 192
   6BE7 AA                  172 	.db #0xAA	; 170
   6BE8 40                  173 	.db #0x40	; 64
   6BE9 FF                  174 	.db #0xFF	; 255
   6BEA 00                  175 	.db #0x00	; 0
   6BEB FF                  176 	.db #0xFF	; 255
   6BEC 00                  177 	.db #0x00	; 0
   6BED FF                  178 	.db #0xFF	; 255
   6BEE 00                  179 	.db #0x00	; 0
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
