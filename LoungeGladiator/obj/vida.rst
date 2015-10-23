                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct 23 09:13:18 2015
                              5 ;--------------------------------------------------------
                              6 	.module vida
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _fatiga_full
                             13 	.globl _fatiga_nor
                             14 	.globl _corazon_roto
                             15 	.globl _corazon_lleno
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
   4A48                      48 _corazon_lleno:
   4A48 AA                   49 	.db #0xAA	; 170
   4A49 04                   50 	.db #0x04	; 4
   4A4A 55                   51 	.db #0x55	; 85	'U'
   4A4B 08                   52 	.db #0x08	; 8
   4A4C AA                   53 	.db #0xAA	; 170
   4A4D 04                   54 	.db #0x04	; 4
   4A4E 55                   55 	.db #0x55	; 85	'U'
   4A4F 08                   56 	.db #0x08	; 8
   4A50 00                   57 	.db #0x00	; 0
   4A51 0C                   58 	.db #0x0C	; 12
   4A52 00                   59 	.db #0x00	; 0
   4A53 0C                   60 	.db #0x0C	; 12
   4A54 00                   61 	.db #0x00	; 0
   4A55 0C                   62 	.db #0x0C	; 12
   4A56 00                   63 	.db #0x00	; 0
   4A57 0C                   64 	.db #0x0C	; 12
   4A58 00                   65 	.db #0x00	; 0
   4A59 0C                   66 	.db #0x0C	; 12
   4A5A 00                   67 	.db #0x00	; 0
   4A5B 0C                   68 	.db #0x0C	; 12
   4A5C 00                   69 	.db #0x00	; 0
   4A5D 0C                   70 	.db #0x0C	; 12
   4A5E 00                   71 	.db #0x00	; 0
   4A5F 0C                   72 	.db #0x0C	; 12
   4A60 00                   73 	.db #0x00	; 0
   4A61 0C                   74 	.db #0x0C	; 12
   4A62 00                   75 	.db #0x00	; 0
   4A63 0C                   76 	.db #0x0C	; 12
   4A64 00                   77 	.db #0x00	; 0
   4A65 0C                   78 	.db #0x0C	; 12
   4A66 00                   79 	.db #0x00	; 0
   4A67 0C                   80 	.db #0x0C	; 12
   4A68 00                   81 	.db #0x00	; 0
   4A69 0C                   82 	.db #0x0C	; 12
   4A6A 00                   83 	.db #0x00	; 0
   4A6B 0C                   84 	.db #0x0C	; 12
   4A6C 00                   85 	.db #0x00	; 0
   4A6D 0C                   86 	.db #0x0C	; 12
   4A6E 00                   87 	.db #0x00	; 0
   4A6F 0C                   88 	.db #0x0C	; 12
   4A70 AA                   89 	.db #0xAA	; 170
   4A71 04                   90 	.db #0x04	; 4
   4A72 00                   91 	.db #0x00	; 0
   4A73 0C                   92 	.db #0x0C	; 12
   4A74 00                   93 	.db #0x00	; 0
   4A75 0C                   94 	.db #0x0C	; 12
   4A76 55                   95 	.db #0x55	; 85	'U'
   4A77 08                   96 	.db #0x08	; 8
   4A78 FF                   97 	.db #0xFF	; 255
   4A79 00                   98 	.db #0x00	; 0
   4A7A 00                   99 	.db #0x00	; 0
   4A7B 0C                  100 	.db #0x0C	; 12
   4A7C 00                  101 	.db #0x00	; 0
   4A7D 0C                  102 	.db #0x0C	; 12
   4A7E FF                  103 	.db #0xFF	; 255
   4A7F 00                  104 	.db #0x00	; 0
   4A80 FF                  105 	.db #0xFF	; 255
   4A81 00                  106 	.db #0x00	; 0
   4A82 AA                  107 	.db #0xAA	; 170
   4A83 04                  108 	.db #0x04	; 4
   4A84 55                  109 	.db #0x55	; 85	'U'
   4A85 08                  110 	.db #0x08	; 8
   4A86 FF                  111 	.db #0xFF	; 255
   4A87 00                  112 	.db #0x00	; 0
   4A88                     113 _corazon_roto:
   4A88 AA                  114 	.db #0xAA	; 170
   4A89 04                  115 	.db #0x04	; 4
   4A8A 55                  116 	.db #0x55	; 85	'U'
   4A8B 08                  117 	.db #0x08	; 8
   4A8C AA                  118 	.db #0xAA	; 170
   4A8D 04                  119 	.db #0x04	; 4
   4A8E 55                  120 	.db #0x55	; 85	'U'
   4A8F 08                  121 	.db #0x08	; 8
   4A90 55                  122 	.db #0x55	; 85	'U'
   4A91 08                  123 	.db #0x08	; 8
   4A92 AA                  124 	.db #0xAA	; 170
   4A93 04                  125 	.db #0x04	; 4
   4A94 AA                  126 	.db #0xAA	; 170
   4A95 04                  127 	.db #0x04	; 4
   4A96 AA                  128 	.db #0xAA	; 170
   4A97 04                  129 	.db #0x04	; 4
   4A98 55                  130 	.db #0x55	; 85	'U'
   4A99 08                  131 	.db #0x08	; 8
   4A9A 55                  132 	.db #0x55	; 85	'U'
   4A9B 08                  133 	.db #0x08	; 8
   4A9C AA                  134 	.db #0xAA	; 170
   4A9D 04                  135 	.db #0x04	; 4
   4A9E AA                  136 	.db #0xAA	; 170
   4A9F 04                  137 	.db #0x04	; 4
   4AA0 55                  138 	.db #0x55	; 85	'U'
   4AA1 08                  139 	.db #0x08	; 8
   4AA2 55                  140 	.db #0x55	; 85	'U'
   4AA3 08                  141 	.db #0x08	; 8
   4AA4 55                  142 	.db #0x55	; 85	'U'
   4AA5 08                  143 	.db #0x08	; 8
   4AA6 AA                  144 	.db #0xAA	; 170
   4AA7 04                  145 	.db #0x04	; 4
   4AA8 55                  146 	.db #0x55	; 85	'U'
   4AA9 08                  147 	.db #0x08	; 8
   4AAA 55                  148 	.db #0x55	; 85	'U'
   4AAB 08                  149 	.db #0x08	; 8
   4AAC AA                  150 	.db #0xAA	; 170
   4AAD 04                  151 	.db #0x04	; 4
   4AAE AA                  152 	.db #0xAA	; 170
   4AAF 04                  153 	.db #0x04	; 4
   4AB0 AA                  154 	.db #0xAA	; 170
   4AB1 04                  155 	.db #0x04	; 4
   4AB2 AA                  156 	.db #0xAA	; 170
   4AB3 04                  157 	.db #0x04	; 4
   4AB4 AA                  158 	.db #0xAA	; 170
   4AB5 04                  159 	.db #0x04	; 4
   4AB6 55                  160 	.db #0x55	; 85	'U'
   4AB7 08                  161 	.db #0x08	; 8
   4AB8 FF                  162 	.db #0xFF	; 255
   4AB9 00                  163 	.db #0x00	; 0
   4ABA 00                  164 	.db #0x00	; 0
   4ABB 0C                  165 	.db #0x0C	; 12
   4ABC AA                  166 	.db #0xAA	; 170
   4ABD 04                  167 	.db #0x04	; 4
   4ABE FF                  168 	.db #0xFF	; 255
   4ABF 00                  169 	.db #0x00	; 0
   4AC0 FF                  170 	.db #0xFF	; 255
   4AC1 00                  171 	.db #0x00	; 0
   4AC2 AA                  172 	.db #0xAA	; 170
   4AC3 04                  173 	.db #0x04	; 4
   4AC4 FF                  174 	.db #0xFF	; 255
   4AC5 00                  175 	.db #0x00	; 0
   4AC6 FF                  176 	.db #0xFF	; 255
   4AC7 00                  177 	.db #0x00	; 0
   4AC8                     178 _fatiga_nor:
   4AC8 AA                  179 	.db #0xAA	; 170
   4AC9 40                  180 	.db #0x40	; 64
   4ACA FF                  181 	.db #0xFF	; 255
   4ACB 00                  182 	.db #0x00	; 0
   4ACC AA                  183 	.db #0xAA	; 170
   4ACD 40                  184 	.db #0x40	; 64
   4ACE FF                  185 	.db #0xFF	; 255
   4ACF 00                  186 	.db #0x00	; 0
   4AD0 AA                  187 	.db #0xAA	; 170
   4AD1 40                  188 	.db #0x40	; 64
   4AD2 FF                  189 	.db #0xFF	; 255
   4AD3 00                  190 	.db #0x00	; 0
   4AD4 AA                  191 	.db #0xAA	; 170
   4AD5 40                  192 	.db #0x40	; 64
   4AD6 FF                  193 	.db #0xFF	; 255
   4AD7 00                  194 	.db #0x00	; 0
   4AD8 AA                  195 	.db #0xAA	; 170
   4AD9 40                  196 	.db #0x40	; 64
   4ADA FF                  197 	.db #0xFF	; 255
   4ADB 00                  198 	.db #0x00	; 0
   4ADC 00                  199 	.db #0x00	; 0
   4ADD C0                  200 	.db #0xC0	; 192
   4ADE 55                  201 	.db #0x55	; 85	'U'
   4ADF 80                  202 	.db #0x80	; 128
   4AE0 AA                  203 	.db #0xAA	; 170
   4AE1 40                  204 	.db #0x40	; 64
   4AE2 FF                  205 	.db #0xFF	; 255
   4AE3 00                  206 	.db #0x00	; 0
   4AE4 AA                  207 	.db #0xAA	; 170
   4AE5 40                  208 	.db #0x40	; 64
   4AE6 FF                  209 	.db #0xFF	; 255
   4AE7 00                  210 	.db #0x00	; 0
   4AE8                     211 _fatiga_full:
   4AE8 AA                  212 	.db #0xAA	; 170
   4AE9 04                  213 	.db #0x04	; 4
   4AEA FF                  214 	.db #0xFF	; 255
   4AEB 00                  215 	.db #0x00	; 0
   4AEC AA                  216 	.db #0xAA	; 170
   4AED 04                  217 	.db #0x04	; 4
   4AEE FF                  218 	.db #0xFF	; 255
   4AEF 00                  219 	.db #0x00	; 0
   4AF0 AA                  220 	.db #0xAA	; 170
   4AF1 04                  221 	.db #0x04	; 4
   4AF2 FF                  222 	.db #0xFF	; 255
   4AF3 00                  223 	.db #0x00	; 0
   4AF4 AA                  224 	.db #0xAA	; 170
   4AF5 04                  225 	.db #0x04	; 4
   4AF6 FF                  226 	.db #0xFF	; 255
   4AF7 00                  227 	.db #0x00	; 0
   4AF8 AA                  228 	.db #0xAA	; 170
   4AF9 04                  229 	.db #0x04	; 4
   4AFA FF                  230 	.db #0xFF	; 255
   4AFB 00                  231 	.db #0x00	; 0
   4AFC 00                  232 	.db #0x00	; 0
   4AFD 0C                  233 	.db #0x0C	; 12
   4AFE 55                  234 	.db #0x55	; 85	'U'
   4AFF 08                  235 	.db #0x08	; 8
   4B00 AA                  236 	.db #0xAA	; 170
   4B01 04                  237 	.db #0x04	; 4
   4B02 FF                  238 	.db #0xFF	; 255
   4B03 00                  239 	.db #0x00	; 0
   4B04 AA                  240 	.db #0xAA	; 170
   4B05 04                  241 	.db #0x04	; 4
   4B06 FF                  242 	.db #0xFF	; 255
   4B07 00                  243 	.db #0x00	; 0
                            244 	.area _INITIALIZER
                            245 	.area _CABS (ABS)
