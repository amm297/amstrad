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
   4A9C                      46 _gladis_atk_dcha:
   4A9C FF                   47 	.db #0xFF	; 255
   4A9D 00                   48 	.db #0x00	; 0
   4A9E FF                   49 	.db #0xFF	; 255
   4A9F 00                   50 	.db #0x00	; 0
   4AA0 FF                   51 	.db #0xFF	; 255
   4AA1 00                   52 	.db #0x00	; 0
   4AA2 FF                   53 	.db #0xFF	; 255
   4AA3 00                   54 	.db #0x00	; 0
   4AA4 FF                   55 	.db #0xFF	; 255
   4AA5 00                   56 	.db #0x00	; 0
   4AA6 AA                   57 	.db #0xAA	; 170
   4AA7 40                   58 	.db #0x40	; 64
   4AA8 00                   59 	.db #0x00	; 0
   4AA9 C0                   60 	.db #0xC0	; 192
   4AAA 55                   61 	.db #0x55	; 85	'U'
   4AAB 80                   62 	.db #0x80	; 128
   4AAC FF                   63 	.db #0xFF	; 255
   4AAD 00                   64 	.db #0x00	; 0
   4AAE FF                   65 	.db #0xFF	; 255
   4AAF 00                   66 	.db #0x00	; 0
   4AB0 AA                   67 	.db #0xAA	; 170
   4AB1 40                   68 	.db #0x40	; 64
   4AB2 00                   69 	.db #0x00	; 0
   4AB3 C0                   70 	.db #0xC0	; 192
   4AB4 55                   71 	.db #0x55	; 85	'U'
   4AB5 80                   72 	.db #0x80	; 128
   4AB6 FF                   73 	.db #0xFF	; 255
   4AB7 00                   74 	.db #0x00	; 0
   4AB8 FF                   75 	.db #0xFF	; 255
   4AB9 00                   76 	.db #0x00	; 0
   4ABA AA                   77 	.db #0xAA	; 170
   4ABB 40                   78 	.db #0x40	; 64
   4ABC 55                   79 	.db #0x55	; 85	'U'
   4ABD 80                   80 	.db #0x80	; 128
   4ABE 55                   81 	.db #0x55	; 85	'U'
   4ABF 80                   82 	.db #0x80	; 128
   4AC0 FF                   83 	.db #0xFF	; 255
   4AC1 00                   84 	.db #0x00	; 0
   4AC2 FF                   85 	.db #0xFF	; 255
   4AC3 00                   86 	.db #0x00	; 0
   4AC4 AA                   87 	.db #0xAA	; 170
   4AC5 40                   88 	.db #0x40	; 64
   4AC6 00                   89 	.db #0x00	; 0
   4AC7 C0                   90 	.db #0xC0	; 192
   4AC8 55                   91 	.db #0x55	; 85	'U'
   4AC9 80                   92 	.db #0x80	; 128
   4ACA FF                   93 	.db #0xFF	; 255
   4ACB 00                   94 	.db #0x00	; 0
   4ACC FF                   95 	.db #0xFF	; 255
   4ACD 00                   96 	.db #0x00	; 0
   4ACE AA                   97 	.db #0xAA	; 170
   4ACF 40                   98 	.db #0x40	; 64
   4AD0 00                   99 	.db #0x00	; 0
   4AD1 C0                  100 	.db #0xC0	; 192
   4AD2 55                  101 	.db #0x55	; 85	'U'
   4AD3 80                  102 	.db #0x80	; 128
   4AD4 FF                  103 	.db #0xFF	; 255
   4AD5 00                  104 	.db #0x00	; 0
   4AD6 AA                  105 	.db #0xAA	; 170
   4AD7 40                  106 	.db #0x40	; 64
   4AD8 55                  107 	.db #0x55	; 85	'U'
   4AD9 80                  108 	.db #0x80	; 128
   4ADA 00                  109 	.db #0x00	; 0
   4ADB C0                  110 	.db #0xC0	; 192
   4ADC FF                  111 	.db #0xFF	; 255
   4ADD 00                  112 	.db #0x00	; 0
   4ADE 55                  113 	.db #0x55	; 85	'U'
   4ADF 80                  114 	.db #0x80	; 128
   4AE0 55                  115 	.db #0x55	; 85	'U'
   4AE1 80                  116 	.db #0x80	; 128
   4AE2 00                  117 	.db #0x00	; 0
   4AE3 C0                  118 	.db #0xC0	; 192
   4AE4 00                  119 	.db #0x00	; 0
   4AE5 C0                  120 	.db #0xC0	; 192
   4AE6 55                  121 	.db #0x55	; 85	'U'
   4AE7 80                  122 	.db #0x80	; 128
   4AE8 AA                  123 	.db #0xAA	; 170
   4AE9 40                  124 	.db #0x40	; 64
   4AEA FF                  125 	.db #0xFF	; 255
   4AEB 00                  126 	.db #0x00	; 0
   4AEC 00                  127 	.db #0x00	; 0
   4AED C0                  128 	.db #0xC0	; 192
   4AEE 00                  129 	.db #0x00	; 0
   4AEF C0                  130 	.db #0xC0	; 192
   4AF0 00                  131 	.db #0x00	; 0
   4AF1 C0                  132 	.db #0xC0	; 192
   4AF2 55                  133 	.db #0x55	; 85	'U'
   4AF3 80                  134 	.db #0x80	; 128
   4AF4 55                  135 	.db #0x55	; 85	'U'
   4AF5 80                  136 	.db #0x80	; 128
   4AF6 AA                  137 	.db #0xAA	; 170
   4AF7 40                  138 	.db #0x40	; 64
   4AF8 00                  139 	.db #0x00	; 0
   4AF9 C0                  140 	.db #0xC0	; 192
   4AFA 55                  141 	.db #0x55	; 85	'U'
   4AFB 80                  142 	.db #0x80	; 128
   4AFC FF                  143 	.db #0xFF	; 255
   4AFD 00                  144 	.db #0x00	; 0
   4AFE FF                  145 	.db #0xFF	; 255
   4AFF 00                  146 	.db #0x00	; 0
   4B00 AA                  147 	.db #0xAA	; 170
   4B01 40                  148 	.db #0x40	; 64
   4B02 00                  149 	.db #0x00	; 0
   4B03 C0                  150 	.db #0xC0	; 192
   4B04 55                  151 	.db #0x55	; 85	'U'
   4B05 80                  152 	.db #0x80	; 128
   4B06 FF                  153 	.db #0xFF	; 255
   4B07 00                  154 	.db #0x00	; 0
   4B08 FF                  155 	.db #0xFF	; 255
   4B09 00                  156 	.db #0x00	; 0
   4B0A AA                  157 	.db #0xAA	; 170
   4B0B 40                  158 	.db #0x40	; 64
   4B0C 00                  159 	.db #0x00	; 0
   4B0D C0                  160 	.db #0xC0	; 192
   4B0E 55                  161 	.db #0x55	; 85	'U'
   4B0F 80                  162 	.db #0x80	; 128
   4B10 FF                  163 	.db #0xFF	; 255
   4B11 00                  164 	.db #0x00	; 0
   4B12 FF                  165 	.db #0xFF	; 255
   4B13 00                  166 	.db #0x00	; 0
   4B14 AA                  167 	.db #0xAA	; 170
   4B15 40                  168 	.db #0x40	; 64
   4B16 FF                  169 	.db #0xFF	; 255
   4B17 00                  170 	.db #0x00	; 0
   4B18 55                  171 	.db #0x55	; 85	'U'
   4B19 80                  172 	.db #0x80	; 128
   4B1A FF                  173 	.db #0xFF	; 255
   4B1B 00                  174 	.db #0x00	; 0
   4B1C FF                  175 	.db #0xFF	; 255
   4B1D 00                  176 	.db #0x00	; 0
   4B1E 00                  177 	.db #0x00	; 0
   4B1F C0                  178 	.db #0xC0	; 192
   4B20 FF                  179 	.db #0xFF	; 255
   4B21 00                  180 	.db #0x00	; 0
   4B22 00                  181 	.db #0x00	; 0
   4B23 C0                  182 	.db #0xC0	; 192
   4B24 FF                  183 	.db #0xFF	; 255
   4B25 00                  184 	.db #0x00	; 0
   4B26 FF                  185 	.db #0xFF	; 255
   4B27 00                  186 	.db #0x00	; 0
   4B28 55                  187 	.db #0x55	; 85	'U'
   4B29 80                  188 	.db #0x80	; 128
   4B2A FF                  189 	.db #0xFF	; 255
   4B2B 00                  190 	.db #0x00	; 0
   4B2C AA                  191 	.db #0xAA	; 170
   4B2D 40                  192 	.db #0x40	; 64
   4B2E FF                  193 	.db #0xFF	; 255
   4B2F 00                  194 	.db #0x00	; 0
   4B30 FF                  195 	.db #0xFF	; 255
   4B31 00                  196 	.db #0x00	; 0
   4B32 00                  197 	.db #0x00	; 0
   4B33 C0                  198 	.db #0xC0	; 192
   4B34 FF                  199 	.db #0xFF	; 255
   4B35 00                  200 	.db #0x00	; 0
   4B36 AA                  201 	.db #0xAA	; 170
   4B37 40                  202 	.db #0x40	; 64
   4B38 55                  203 	.db #0x55	; 85	'U'
   4B39 80                  204 	.db #0x80	; 128
   4B3A FF                  205 	.db #0xFF	; 255
   4B3B 00                  206 	.db #0x00	; 0
   4B3C                     207 _gladis_atk_izda:
   4B3C FF                  208 	.db #0xFF	; 255
   4B3D 00                  209 	.db #0x00	; 0
   4B3E FF                  210 	.db #0xFF	; 255
   4B3F 00                  211 	.db #0x00	; 0
   4B40 FF                  212 	.db #0xFF	; 255
   4B41 00                  213 	.db #0x00	; 0
   4B42 FF                  214 	.db #0xFF	; 255
   4B43 00                  215 	.db #0x00	; 0
   4B44 FF                  216 	.db #0xFF	; 255
   4B45 00                  217 	.db #0x00	; 0
   4B46 FF                  218 	.db #0xFF	; 255
   4B47 00                  219 	.db #0x00	; 0
   4B48 FF                  220 	.db #0xFF	; 255
   4B49 00                  221 	.db #0x00	; 0
   4B4A AA                  222 	.db #0xAA	; 170
   4B4B 40                  223 	.db #0x40	; 64
   4B4C 00                  224 	.db #0x00	; 0
   4B4D C0                  225 	.db #0xC0	; 192
   4B4E 55                  226 	.db #0x55	; 85	'U'
   4B4F 80                  227 	.db #0x80	; 128
   4B50 FF                  228 	.db #0xFF	; 255
   4B51 00                  229 	.db #0x00	; 0
   4B52 FF                  230 	.db #0xFF	; 255
   4B53 00                  231 	.db #0x00	; 0
   4B54 AA                  232 	.db #0xAA	; 170
   4B55 40                  233 	.db #0x40	; 64
   4B56 00                  234 	.db #0x00	; 0
   4B57 C0                  235 	.db #0xC0	; 192
   4B58 55                  236 	.db #0x55	; 85	'U'
   4B59 80                  237 	.db #0x80	; 128
   4B5A FF                  238 	.db #0xFF	; 255
   4B5B 00                  239 	.db #0x00	; 0
   4B5C FF                  240 	.db #0xFF	; 255
   4B5D 00                  241 	.db #0x00	; 0
   4B5E AA                  242 	.db #0xAA	; 170
   4B5F 40                  243 	.db #0x40	; 64
   4B60 AA                  244 	.db #0xAA	; 170
   4B61 40                  245 	.db #0x40	; 64
   4B62 55                  246 	.db #0x55	; 85	'U'
   4B63 80                  247 	.db #0x80	; 128
   4B64 FF                  248 	.db #0xFF	; 255
   4B65 00                  249 	.db #0x00	; 0
   4B66 FF                  250 	.db #0xFF	; 255
   4B67 00                  251 	.db #0x00	; 0
   4B68 AA                  252 	.db #0xAA	; 170
   4B69 40                  253 	.db #0x40	; 64
   4B6A 00                  254 	.db #0x00	; 0
   4B6B C0                  255 	.db #0xC0	; 192
   4B6C 55                  256 	.db #0x55	; 85	'U'
   4B6D 80                  257 	.db #0x80	; 128
   4B6E 55                  258 	.db #0x55	; 85	'U'
   4B6F 80                  259 	.db #0x80	; 128
   4B70 FF                  260 	.db #0xFF	; 255
   4B71 00                  261 	.db #0x00	; 0
   4B72 AA                  262 	.db #0xAA	; 170
   4B73 40                  263 	.db #0x40	; 64
   4B74 00                  264 	.db #0x00	; 0
   4B75 C0                  265 	.db #0xC0	; 192
   4B76 55                  266 	.db #0x55	; 85	'U'
   4B77 80                  267 	.db #0x80	; 128
   4B78 AA                  268 	.db #0xAA	; 170
   4B79 40                  269 	.db #0x40	; 64
   4B7A AA                  270 	.db #0xAA	; 170
   4B7B 40                  271 	.db #0x40	; 64
   4B7C FF                  272 	.db #0xFF	; 255
   4B7D 00                  273 	.db #0x00	; 0
   4B7E 00                  274 	.db #0x00	; 0
   4B7F C0                  275 	.db #0xC0	; 192
   4B80 AA                  276 	.db #0xAA	; 170
   4B81 40                  277 	.db #0x40	; 64
   4B82 FF                  278 	.db #0xFF	; 255
   4B83 00                  279 	.db #0x00	; 0
   4B84 55                  280 	.db #0x55	; 85	'U'
   4B85 80                  281 	.db #0x80	; 128
   4B86 AA                  282 	.db #0xAA	; 170
   4B87 40                  283 	.db #0x40	; 64
   4B88 00                  284 	.db #0x00	; 0
   4B89 C0                  285 	.db #0xC0	; 192
   4B8A 00                  286 	.db #0x00	; 0
   4B8B C0                  287 	.db #0xC0	; 192
   4B8C AA                  288 	.db #0xAA	; 170
   4B8D 40                  289 	.db #0x40	; 64
   4B8E AA                  290 	.db #0xAA	; 170
   4B8F 40                  291 	.db #0x40	; 64
   4B90 00                  292 	.db #0x00	; 0
   4B91 C0                  293 	.db #0xC0	; 192
   4B92 00                  294 	.db #0x00	; 0
   4B93 C0                  295 	.db #0xC0	; 192
   4B94 00                  296 	.db #0x00	; 0
   4B95 C0                  297 	.db #0xC0	; 192
   4B96 FF                  298 	.db #0xFF	; 255
   4B97 00                  299 	.db #0x00	; 0
   4B98 FF                  300 	.db #0xFF	; 255
   4B99 00                  301 	.db #0x00	; 0
   4B9A AA                  302 	.db #0xAA	; 170
   4B9B 40                  303 	.db #0x40	; 64
   4B9C 00                  304 	.db #0x00	; 0
   4B9D C0                  305 	.db #0xC0	; 192
   4B9E 55                  306 	.db #0x55	; 85	'U'
   4B9F 80                  307 	.db #0x80	; 128
   4BA0 FF                  308 	.db #0xFF	; 255
   4BA1 00                  309 	.db #0x00	; 0
   4BA2 FF                  310 	.db #0xFF	; 255
   4BA3 00                  311 	.db #0x00	; 0
   4BA4 AA                  312 	.db #0xAA	; 170
   4BA5 40                  313 	.db #0x40	; 64
   4BA6 00                  314 	.db #0x00	; 0
   4BA7 C0                  315 	.db #0xC0	; 192
   4BA8 55                  316 	.db #0x55	; 85	'U'
   4BA9 80                  317 	.db #0x80	; 128
   4BAA FF                  318 	.db #0xFF	; 255
   4BAB 00                  319 	.db #0x00	; 0
   4BAC FF                  320 	.db #0xFF	; 255
   4BAD 00                  321 	.db #0x00	; 0
   4BAE AA                  322 	.db #0xAA	; 170
   4BAF 40                  323 	.db #0x40	; 64
   4BB0 00                  324 	.db #0x00	; 0
   4BB1 C0                  325 	.db #0xC0	; 192
   4BB2 55                  326 	.db #0x55	; 85	'U'
   4BB3 80                  327 	.db #0x80	; 128
   4BB4 FF                  328 	.db #0xFF	; 255
   4BB5 00                  329 	.db #0x00	; 0
   4BB6 FF                  330 	.db #0xFF	; 255
   4BB7 00                  331 	.db #0x00	; 0
   4BB8 AA                  332 	.db #0xAA	; 170
   4BB9 40                  333 	.db #0x40	; 64
   4BBA FF                  334 	.db #0xFF	; 255
   4BBB 00                  335 	.db #0x00	; 0
   4BBC 55                  336 	.db #0x55	; 85	'U'
   4BBD 80                  337 	.db #0x80	; 128
   4BBE FF                  338 	.db #0xFF	; 255
   4BBF 00                  339 	.db #0x00	; 0
   4BC0 FF                  340 	.db #0xFF	; 255
   4BC1 00                  341 	.db #0x00	; 0
   4BC2 00                  342 	.db #0x00	; 0
   4BC3 C0                  343 	.db #0xC0	; 192
   4BC4 FF                  344 	.db #0xFF	; 255
   4BC5 00                  345 	.db #0x00	; 0
   4BC6 00                  346 	.db #0x00	; 0
   4BC7 C0                  347 	.db #0xC0	; 192
   4BC8 FF                  348 	.db #0xFF	; 255
   4BC9 00                  349 	.db #0x00	; 0
   4BCA FF                  350 	.db #0xFF	; 255
   4BCB 00                  351 	.db #0x00	; 0
   4BCC 55                  352 	.db #0x55	; 85	'U'
   4BCD 80                  353 	.db #0x80	; 128
   4BCE FF                  354 	.db #0xFF	; 255
   4BCF 00                  355 	.db #0x00	; 0
   4BD0 AA                  356 	.db #0xAA	; 170
   4BD1 40                  357 	.db #0x40	; 64
   4BD2 FF                  358 	.db #0xFF	; 255
   4BD3 00                  359 	.db #0x00	; 0
   4BD4 AA                  360 	.db #0xAA	; 170
   4BD5 40                  361 	.db #0x40	; 64
   4BD6 55                  362 	.db #0x55	; 85	'U'
   4BD7 80                  363 	.db #0x80	; 128
   4BD8 FF                  364 	.db #0xFF	; 255
   4BD9 00                  365 	.db #0x00	; 0
   4BDA 00                  366 	.db #0x00	; 0
   4BDB C0                  367 	.db #0xC0	; 192
                            368 	.area _INITIALIZER
                            369 	.area _CABS (ABS)
