                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Sep 29 21:15:00 2015
                              5 ;--------------------------------------------------------
                              6 	.module gladis_atk
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _gladis_atk_izda
                             13 	.globl _gladis_atk_dcha
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 	.area _CODE
   4CA0                      46 _gladis_atk_dcha:
   4CA0 FF                   47 	.db #0xFF	; 255
   4CA1 00                   48 	.db #0x00	; 0
   4CA2 FF                   49 	.db #0xFF	; 255
   4CA3 00                   50 	.db #0x00	; 0
   4CA4 FF                   51 	.db #0xFF	; 255
   4CA5 00                   52 	.db #0x00	; 0
   4CA6 FF                   53 	.db #0xFF	; 255
   4CA7 00                   54 	.db #0x00	; 0
   4CA8 FF                   55 	.db #0xFF	; 255
   4CA9 00                   56 	.db #0x00	; 0
   4CAA AA                   57 	.db #0xAA	; 170
   4CAB 40                   58 	.db #0x40	; 64
   4CAC 00                   59 	.db #0x00	; 0
   4CAD C0                   60 	.db #0xC0	; 192
   4CAE 55                   61 	.db #0x55	; 85	'U'
   4CAF 80                   62 	.db #0x80	; 128
   4CB0 FF                   63 	.db #0xFF	; 255
   4CB1 00                   64 	.db #0x00	; 0
   4CB2 FF                   65 	.db #0xFF	; 255
   4CB3 00                   66 	.db #0x00	; 0
   4CB4 AA                   67 	.db #0xAA	; 170
   4CB5 40                   68 	.db #0x40	; 64
   4CB6 00                   69 	.db #0x00	; 0
   4CB7 C0                   70 	.db #0xC0	; 192
   4CB8 55                   71 	.db #0x55	; 85	'U'
   4CB9 80                   72 	.db #0x80	; 128
   4CBA FF                   73 	.db #0xFF	; 255
   4CBB 00                   74 	.db #0x00	; 0
   4CBC FF                   75 	.db #0xFF	; 255
   4CBD 00                   76 	.db #0x00	; 0
   4CBE AA                   77 	.db #0xAA	; 170
   4CBF 40                   78 	.db #0x40	; 64
   4CC0 55                   79 	.db #0x55	; 85	'U'
   4CC1 80                   80 	.db #0x80	; 128
   4CC2 55                   81 	.db #0x55	; 85	'U'
   4CC3 80                   82 	.db #0x80	; 128
   4CC4 FF                   83 	.db #0xFF	; 255
   4CC5 00                   84 	.db #0x00	; 0
   4CC6 FF                   85 	.db #0xFF	; 255
   4CC7 00                   86 	.db #0x00	; 0
   4CC8 AA                   87 	.db #0xAA	; 170
   4CC9 40                   88 	.db #0x40	; 64
   4CCA 00                   89 	.db #0x00	; 0
   4CCB C0                   90 	.db #0xC0	; 192
   4CCC 55                   91 	.db #0x55	; 85	'U'
   4CCD 80                   92 	.db #0x80	; 128
   4CCE FF                   93 	.db #0xFF	; 255
   4CCF 00                   94 	.db #0x00	; 0
   4CD0 FF                   95 	.db #0xFF	; 255
   4CD1 00                   96 	.db #0x00	; 0
   4CD2 AA                   97 	.db #0xAA	; 170
   4CD3 40                   98 	.db #0x40	; 64
   4CD4 00                   99 	.db #0x00	; 0
   4CD5 C0                  100 	.db #0xC0	; 192
   4CD6 55                  101 	.db #0x55	; 85	'U'
   4CD7 80                  102 	.db #0x80	; 128
   4CD8 FF                  103 	.db #0xFF	; 255
   4CD9 00                  104 	.db #0x00	; 0
   4CDA AA                  105 	.db #0xAA	; 170
   4CDB 40                  106 	.db #0x40	; 64
   4CDC 55                  107 	.db #0x55	; 85	'U'
   4CDD 80                  108 	.db #0x80	; 128
   4CDE 00                  109 	.db #0x00	; 0
   4CDF C0                  110 	.db #0xC0	; 192
   4CE0 FF                  111 	.db #0xFF	; 255
   4CE1 00                  112 	.db #0x00	; 0
   4CE2 55                  113 	.db #0x55	; 85	'U'
   4CE3 80                  114 	.db #0x80	; 128
   4CE4 55                  115 	.db #0x55	; 85	'U'
   4CE5 80                  116 	.db #0x80	; 128
   4CE6 00                  117 	.db #0x00	; 0
   4CE7 C0                  118 	.db #0xC0	; 192
   4CE8 00                  119 	.db #0x00	; 0
   4CE9 C0                  120 	.db #0xC0	; 192
   4CEA 55                  121 	.db #0x55	; 85	'U'
   4CEB 80                  122 	.db #0x80	; 128
   4CEC AA                  123 	.db #0xAA	; 170
   4CED 40                  124 	.db #0x40	; 64
   4CEE FF                  125 	.db #0xFF	; 255
   4CEF 00                  126 	.db #0x00	; 0
   4CF0 00                  127 	.db #0x00	; 0
   4CF1 C0                  128 	.db #0xC0	; 192
   4CF2 00                  129 	.db #0x00	; 0
   4CF3 C0                  130 	.db #0xC0	; 192
   4CF4 00                  131 	.db #0x00	; 0
   4CF5 C0                  132 	.db #0xC0	; 192
   4CF6 55                  133 	.db #0x55	; 85	'U'
   4CF7 80                  134 	.db #0x80	; 128
   4CF8 55                  135 	.db #0x55	; 85	'U'
   4CF9 80                  136 	.db #0x80	; 128
   4CFA AA                  137 	.db #0xAA	; 170
   4CFB 40                  138 	.db #0x40	; 64
   4CFC 00                  139 	.db #0x00	; 0
   4CFD C0                  140 	.db #0xC0	; 192
   4CFE 55                  141 	.db #0x55	; 85	'U'
   4CFF 80                  142 	.db #0x80	; 128
   4D00 FF                  143 	.db #0xFF	; 255
   4D01 00                  144 	.db #0x00	; 0
   4D02 FF                  145 	.db #0xFF	; 255
   4D03 00                  146 	.db #0x00	; 0
   4D04 AA                  147 	.db #0xAA	; 170
   4D05 40                  148 	.db #0x40	; 64
   4D06 00                  149 	.db #0x00	; 0
   4D07 C0                  150 	.db #0xC0	; 192
   4D08 55                  151 	.db #0x55	; 85	'U'
   4D09 80                  152 	.db #0x80	; 128
   4D0A FF                  153 	.db #0xFF	; 255
   4D0B 00                  154 	.db #0x00	; 0
   4D0C FF                  155 	.db #0xFF	; 255
   4D0D 00                  156 	.db #0x00	; 0
   4D0E AA                  157 	.db #0xAA	; 170
   4D0F 40                  158 	.db #0x40	; 64
   4D10 00                  159 	.db #0x00	; 0
   4D11 C0                  160 	.db #0xC0	; 192
   4D12 55                  161 	.db #0x55	; 85	'U'
   4D13 80                  162 	.db #0x80	; 128
   4D14 FF                  163 	.db #0xFF	; 255
   4D15 00                  164 	.db #0x00	; 0
   4D16 FF                  165 	.db #0xFF	; 255
   4D17 00                  166 	.db #0x00	; 0
   4D18 AA                  167 	.db #0xAA	; 170
   4D19 40                  168 	.db #0x40	; 64
   4D1A FF                  169 	.db #0xFF	; 255
   4D1B 00                  170 	.db #0x00	; 0
   4D1C 55                  171 	.db #0x55	; 85	'U'
   4D1D 80                  172 	.db #0x80	; 128
   4D1E FF                  173 	.db #0xFF	; 255
   4D1F 00                  174 	.db #0x00	; 0
   4D20 FF                  175 	.db #0xFF	; 255
   4D21 00                  176 	.db #0x00	; 0
   4D22 00                  177 	.db #0x00	; 0
   4D23 C0                  178 	.db #0xC0	; 192
   4D24 FF                  179 	.db #0xFF	; 255
   4D25 00                  180 	.db #0x00	; 0
   4D26 00                  181 	.db #0x00	; 0
   4D27 C0                  182 	.db #0xC0	; 192
   4D28 FF                  183 	.db #0xFF	; 255
   4D29 00                  184 	.db #0x00	; 0
   4D2A FF                  185 	.db #0xFF	; 255
   4D2B 00                  186 	.db #0x00	; 0
   4D2C 55                  187 	.db #0x55	; 85	'U'
   4D2D 80                  188 	.db #0x80	; 128
   4D2E FF                  189 	.db #0xFF	; 255
   4D2F 00                  190 	.db #0x00	; 0
   4D30 AA                  191 	.db #0xAA	; 170
   4D31 40                  192 	.db #0x40	; 64
   4D32 FF                  193 	.db #0xFF	; 255
   4D33 00                  194 	.db #0x00	; 0
   4D34 FF                  195 	.db #0xFF	; 255
   4D35 00                  196 	.db #0x00	; 0
   4D36 00                  197 	.db #0x00	; 0
   4D37 C0                  198 	.db #0xC0	; 192
   4D38 FF                  199 	.db #0xFF	; 255
   4D39 00                  200 	.db #0x00	; 0
   4D3A AA                  201 	.db #0xAA	; 170
   4D3B 40                  202 	.db #0x40	; 64
   4D3C 55                  203 	.db #0x55	; 85	'U'
   4D3D 80                  204 	.db #0x80	; 128
   4D3E FF                  205 	.db #0xFF	; 255
   4D3F 00                  206 	.db #0x00	; 0
   4D40                     207 _gladis_atk_izda:
   4D40 FF                  208 	.db #0xFF	; 255
   4D41 00                  209 	.db #0x00	; 0
   4D42 FF                  210 	.db #0xFF	; 255
   4D43 00                  211 	.db #0x00	; 0
   4D44 FF                  212 	.db #0xFF	; 255
   4D45 00                  213 	.db #0x00	; 0
   4D46 FF                  214 	.db #0xFF	; 255
   4D47 00                  215 	.db #0x00	; 0
   4D48 FF                  216 	.db #0xFF	; 255
   4D49 00                  217 	.db #0x00	; 0
   4D4A FF                  218 	.db #0xFF	; 255
   4D4B 00                  219 	.db #0x00	; 0
   4D4C FF                  220 	.db #0xFF	; 255
   4D4D 00                  221 	.db #0x00	; 0
   4D4E AA                  222 	.db #0xAA	; 170
   4D4F 40                  223 	.db #0x40	; 64
   4D50 00                  224 	.db #0x00	; 0
   4D51 C0                  225 	.db #0xC0	; 192
   4D52 55                  226 	.db #0x55	; 85	'U'
   4D53 80                  227 	.db #0x80	; 128
   4D54 FF                  228 	.db #0xFF	; 255
   4D55 00                  229 	.db #0x00	; 0
   4D56 FF                  230 	.db #0xFF	; 255
   4D57 00                  231 	.db #0x00	; 0
   4D58 AA                  232 	.db #0xAA	; 170
   4D59 40                  233 	.db #0x40	; 64
   4D5A 00                  234 	.db #0x00	; 0
   4D5B C0                  235 	.db #0xC0	; 192
   4D5C 55                  236 	.db #0x55	; 85	'U'
   4D5D 80                  237 	.db #0x80	; 128
   4D5E FF                  238 	.db #0xFF	; 255
   4D5F 00                  239 	.db #0x00	; 0
   4D60 FF                  240 	.db #0xFF	; 255
   4D61 00                  241 	.db #0x00	; 0
   4D62 AA                  242 	.db #0xAA	; 170
   4D63 40                  243 	.db #0x40	; 64
   4D64 AA                  244 	.db #0xAA	; 170
   4D65 40                  245 	.db #0x40	; 64
   4D66 55                  246 	.db #0x55	; 85	'U'
   4D67 80                  247 	.db #0x80	; 128
   4D68 FF                  248 	.db #0xFF	; 255
   4D69 00                  249 	.db #0x00	; 0
   4D6A FF                  250 	.db #0xFF	; 255
   4D6B 00                  251 	.db #0x00	; 0
   4D6C AA                  252 	.db #0xAA	; 170
   4D6D 40                  253 	.db #0x40	; 64
   4D6E 00                  254 	.db #0x00	; 0
   4D6F C0                  255 	.db #0xC0	; 192
   4D70 55                  256 	.db #0x55	; 85	'U'
   4D71 80                  257 	.db #0x80	; 128
   4D72 55                  258 	.db #0x55	; 85	'U'
   4D73 80                  259 	.db #0x80	; 128
   4D74 FF                  260 	.db #0xFF	; 255
   4D75 00                  261 	.db #0x00	; 0
   4D76 AA                  262 	.db #0xAA	; 170
   4D77 40                  263 	.db #0x40	; 64
   4D78 00                  264 	.db #0x00	; 0
   4D79 C0                  265 	.db #0xC0	; 192
   4D7A 55                  266 	.db #0x55	; 85	'U'
   4D7B 80                  267 	.db #0x80	; 128
   4D7C AA                  268 	.db #0xAA	; 170
   4D7D 40                  269 	.db #0x40	; 64
   4D7E AA                  270 	.db #0xAA	; 170
   4D7F 40                  271 	.db #0x40	; 64
   4D80 FF                  272 	.db #0xFF	; 255
   4D81 00                  273 	.db #0x00	; 0
   4D82 00                  274 	.db #0x00	; 0
   4D83 C0                  275 	.db #0xC0	; 192
   4D84 AA                  276 	.db #0xAA	; 170
   4D85 40                  277 	.db #0x40	; 64
   4D86 FF                  278 	.db #0xFF	; 255
   4D87 00                  279 	.db #0x00	; 0
   4D88 55                  280 	.db #0x55	; 85	'U'
   4D89 80                  281 	.db #0x80	; 128
   4D8A AA                  282 	.db #0xAA	; 170
   4D8B 40                  283 	.db #0x40	; 64
   4D8C 00                  284 	.db #0x00	; 0
   4D8D C0                  285 	.db #0xC0	; 192
   4D8E 00                  286 	.db #0x00	; 0
   4D8F C0                  287 	.db #0xC0	; 192
   4D90 AA                  288 	.db #0xAA	; 170
   4D91 40                  289 	.db #0x40	; 64
   4D92 AA                  290 	.db #0xAA	; 170
   4D93 40                  291 	.db #0x40	; 64
   4D94 00                  292 	.db #0x00	; 0
   4D95 C0                  293 	.db #0xC0	; 192
   4D96 00                  294 	.db #0x00	; 0
   4D97 C0                  295 	.db #0xC0	; 192
   4D98 00                  296 	.db #0x00	; 0
   4D99 C0                  297 	.db #0xC0	; 192
   4D9A FF                  298 	.db #0xFF	; 255
   4D9B 00                  299 	.db #0x00	; 0
   4D9C FF                  300 	.db #0xFF	; 255
   4D9D 00                  301 	.db #0x00	; 0
   4D9E AA                  302 	.db #0xAA	; 170
   4D9F 40                  303 	.db #0x40	; 64
   4DA0 00                  304 	.db #0x00	; 0
   4DA1 C0                  305 	.db #0xC0	; 192
   4DA2 55                  306 	.db #0x55	; 85	'U'
   4DA3 80                  307 	.db #0x80	; 128
   4DA4 FF                  308 	.db #0xFF	; 255
   4DA5 00                  309 	.db #0x00	; 0
   4DA6 FF                  310 	.db #0xFF	; 255
   4DA7 00                  311 	.db #0x00	; 0
   4DA8 AA                  312 	.db #0xAA	; 170
   4DA9 40                  313 	.db #0x40	; 64
   4DAA 00                  314 	.db #0x00	; 0
   4DAB C0                  315 	.db #0xC0	; 192
   4DAC 55                  316 	.db #0x55	; 85	'U'
   4DAD 80                  317 	.db #0x80	; 128
   4DAE FF                  318 	.db #0xFF	; 255
   4DAF 00                  319 	.db #0x00	; 0
   4DB0 FF                  320 	.db #0xFF	; 255
   4DB1 00                  321 	.db #0x00	; 0
   4DB2 AA                  322 	.db #0xAA	; 170
   4DB3 40                  323 	.db #0x40	; 64
   4DB4 00                  324 	.db #0x00	; 0
   4DB5 C0                  325 	.db #0xC0	; 192
   4DB6 55                  326 	.db #0x55	; 85	'U'
   4DB7 80                  327 	.db #0x80	; 128
   4DB8 FF                  328 	.db #0xFF	; 255
   4DB9 00                  329 	.db #0x00	; 0
   4DBA FF                  330 	.db #0xFF	; 255
   4DBB 00                  331 	.db #0x00	; 0
   4DBC AA                  332 	.db #0xAA	; 170
   4DBD 40                  333 	.db #0x40	; 64
   4DBE FF                  334 	.db #0xFF	; 255
   4DBF 00                  335 	.db #0x00	; 0
   4DC0 55                  336 	.db #0x55	; 85	'U'
   4DC1 80                  337 	.db #0x80	; 128
   4DC2 FF                  338 	.db #0xFF	; 255
   4DC3 00                  339 	.db #0x00	; 0
   4DC4 FF                  340 	.db #0xFF	; 255
   4DC5 00                  341 	.db #0x00	; 0
   4DC6 00                  342 	.db #0x00	; 0
   4DC7 C0                  343 	.db #0xC0	; 192
   4DC8 FF                  344 	.db #0xFF	; 255
   4DC9 00                  345 	.db #0x00	; 0
   4DCA 00                  346 	.db #0x00	; 0
   4DCB C0                  347 	.db #0xC0	; 192
   4DCC FF                  348 	.db #0xFF	; 255
   4DCD 00                  349 	.db #0x00	; 0
   4DCE FF                  350 	.db #0xFF	; 255
   4DCF 00                  351 	.db #0x00	; 0
   4DD0 55                  352 	.db #0x55	; 85	'U'
   4DD1 80                  353 	.db #0x80	; 128
   4DD2 FF                  354 	.db #0xFF	; 255
   4DD3 00                  355 	.db #0x00	; 0
   4DD4 AA                  356 	.db #0xAA	; 170
   4DD5 40                  357 	.db #0x40	; 64
   4DD6 FF                  358 	.db #0xFF	; 255
   4DD7 00                  359 	.db #0x00	; 0
   4DD8 AA                  360 	.db #0xAA	; 170
   4DD9 40                  361 	.db #0x40	; 64
   4DDA 55                  362 	.db #0x55	; 85	'U'
   4DDB 80                  363 	.db #0x80	; 128
   4DDC FF                  364 	.db #0xFF	; 255
   4DDD 00                  365 	.db #0x00	; 0
   4DDE 00                  366 	.db #0x00	; 0
   4DDF C0                  367 	.db #0xC0	; 192
                            368 	.area _INITIALIZER
                            369 	.area _CABS (ABS)
