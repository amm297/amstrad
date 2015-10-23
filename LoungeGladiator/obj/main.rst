                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct 23 18:10:43 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _controles
                             14 	.globl _credits
                             15 	.globl _game
                             16 	.globl _menu
                             17 	.globl _gameOver
                             18 	.globl _moveObject
                             19 	.globl _checkKeyboard
                             20 	.globl _checkArrowCollisions
                             21 	.globl _checkBoundsCollisions
                             22 	.globl _checkCollisions
                             23 	.globl _move
                             24 	.globl _patrol
                             25 	.globl _followPlayer
                             26 	.globl _movement
                             27 	.globl _chooseDirection
                             28 	.globl _detectPlayerRoom
                             29 	.globl _drawPickUps
                             30 	.globl _drawFatiga
                             31 	.globl _erases
                             32 	.globl _draws
                             33 	.globl _drawStats
                             34 	.globl _erase
                             35 	.globl _draw
                             36 	.globl _drawBullets
                             37 	.globl _drawVida
                             38 	.globl _drawMap
                             39 	.globl _mapSelector
                             40 	.globl _vaciar
                             41 	.globl _endGame
                             42 	.globl _initVariables
                             43 	.globl _initNivel
                             44 	.globl _initEnemies
                             45 	.globl _restartPlayer
                             46 	.globl _initPlayer
                             47 	.globl _init
                             48 	.globl _cpct_getScreenPtr
                             49 	.globl _cpct_setPalette
                             50 	.globl _cpct_fw2hw
                             51 	.globl _cpct_waitVSYNC
                             52 	.globl _cpct_setVideoMode
                             53 	.globl _cpct_drawStringM0
                             54 	.globl _cpct_drawSolidBox
                             55 	.globl _cpct_drawSpriteMasked
                             56 	.globl _cpct_drawSprite
                             57 	.globl _cpct_isKeyPressed
                             58 	.globl _cpct_scanKeyboard_f
                             59 	.globl _cpct_scanKeyboard
                             60 	.globl _cpct_memset
                             61 	.globl _cpct_disableFirmware
                             62 	.globl _rand
                             63 	.globl _enemy
                             64 	.globl _player
                             65 	.globl _object
                             66 	.globl _n
                             67 	.globl _dead
                             68 	.globl _archer
                             69 	.globl _bound
                             70 	.globl _following
                             71 	.globl _arrow
                             72 	.globl _finish
                             73 	.globl _path
                             74 	.globl _map
                             75 	.globl _temp
                             76 	.globl _scene
                             77 	.globl _mapa2
                             78 	.globl _mapa1
                             79 	.globl _originsu
                             80 	.globl _originse
                             81 	.globl _originsp
                             82 	.globl _g_palette
                             83 ;--------------------------------------------------------
                             84 ; special function registers
                             85 ;--------------------------------------------------------
                             86 ;--------------------------------------------------------
                             87 ; ram data
                             88 ;--------------------------------------------------------
                             89 	.area _DATA
   8FE0                      90 _scene::
   8FE0                      91 	.ds 240
   90D0                      92 _temp::
   90D0                      93 	.ds 1
   90D1                      94 _map::
   90D1                      95 	.ds 1
   90D2                      96 _path::
   90D2                      97 	.ds 1
   90D3                      98 _finish::
   90D3                      99 	.ds 1
   90D4                     100 _arrow::
   90D4                     101 	.ds 1
   90D5                     102 _following::
   90D5                     103 	.ds 1
   90D6                     104 _bound::
   90D6                     105 	.ds 1
   90D7                     106 _archer::
   90D7                     107 	.ds 1
   90D8                     108 _dead::
   90D8                     109 	.ds 1
   90D9                     110 _n::
   90D9                     111 	.ds 3
   90DC                     112 _object::
   90DC                     113 	.ds 10
   90E6                     114 _player::
   90E6                     115 	.ds 11
   90F1                     116 _enemy::
   90F1                     117 	.ds 15
                            118 ;--------------------------------------------------------
                            119 ; ram data
                            120 ;--------------------------------------------------------
                            121 	.area _INITIALIZED
                            122 ;--------------------------------------------------------
                            123 ; absolute external ram data
                            124 ;--------------------------------------------------------
                            125 	.area _DABS (ABS)
                            126 ;--------------------------------------------------------
                            127 ; global & static initialisations
                            128 ;--------------------------------------------------------
                            129 	.area _HOME
                            130 	.area _GSINIT
                            131 	.area _GSFINAL
                            132 	.area _GSINIT
                            133 ;--------------------------------------------------------
                            134 ; Home
                            135 ;--------------------------------------------------------
                            136 	.area _HOME
                            137 	.area _HOME
                            138 ;--------------------------------------------------------
                            139 ; code
                            140 ;--------------------------------------------------------
                            141 	.area _CODE
                            142 ;src/init.h:13: void init(){
                            143 ;	---------------------------------
                            144 ; Function init
                            145 ; ---------------------------------
   4B08                     146 _init::
                            147 ;src/init.h:14: cpct_disableFirmware();
   4B08 CD 08 8E      [17]  148 	call	_cpct_disableFirmware
                            149 ;src/init.h:15: cpct_setVideoMode(0);
   4B0B AF            [ 4]  150 	xor	a, a
   4B0C F5            [11]  151 	push	af
   4B0D 33            [ 6]  152 	inc	sp
   4B0E CD E5 8D      [17]  153 	call	_cpct_setVideoMode
   4B11 33            [ 6]  154 	inc	sp
                            155 ;src/init.h:16: cpct_fw2hw(g_palette,4);
   4B12 11 2D 4B      [10]  156 	ld	de,#_g_palette
   4B15 3E 04         [ 7]  157 	ld	a,#0x04
   4B17 F5            [11]  158 	push	af
   4B18 33            [ 6]  159 	inc	sp
   4B19 D5            [11]  160 	push	de
   4B1A CD 6F 8D      [17]  161 	call	_cpct_fw2hw
   4B1D F1            [10]  162 	pop	af
   4B1E 33            [ 6]  163 	inc	sp
                            164 ;src/init.h:17: cpct_setPalette(g_palette,4);
   4B1F 11 2D 4B      [10]  165 	ld	de,#_g_palette
   4B22 3E 04         [ 7]  166 	ld	a,#0x04
   4B24 F5            [11]  167 	push	af
   4B25 33            [ 6]  168 	inc	sp
   4B26 D5            [11]  169 	push	de
   4B27 CD F8 8A      [17]  170 	call	_cpct_setPalette
   4B2A F1            [10]  171 	pop	af
   4B2B 33            [ 6]  172 	inc	sp
   4B2C C9            [10]  173 	ret
   4B2D                     174 _g_palette:
   4B2D 00                  175 	.db #0x00	; 0
   4B2E 1A                  176 	.db #0x1A	; 26
   4B2F 06                  177 	.db #0x06	; 6
   4B30 0D                  178 	.db #0x0D	; 13
   4B31                     179 _originsp:
   4B31 00                  180 	.db #0x00	; 0
   4B32 50                  181 	.db #0x50	; 80	'P'
   4B33 40                  182 	.db #0x40	; 64
   4B34 B0                  183 	.db #0xB0	; 176
   4B35 00                  184 	.db #0x00	; 0
   4B36 60                  185 	.db #0x60	; 96
   4B37 40                  186 	.db #0x40	; 64
   4B38 00                  187 	.db #0x00	; 0
   4B39                     188 _originse:
   4B39 3C                  189 	.db #0x3C	; 60
   4B3A 50                  190 	.db #0x50	; 80	'P'
   4B3B 10                  191 	.db #0x10	; 16
   4B3C 10                  192 	.db #0x10	; 16
   4B3D 10                  193 	.db #0x10	; 16
   4B3E 80                  194 	.db #0x80	; 128
   4B3F 0C                  195 	.db #0x0C	; 12
   4B40 60                  196 	.db #0x60	; 96
   4B41 34                  197 	.db #0x34	; 52	'4'
   4B42 60                  198 	.db #0x60	; 96
   4B43 30                  199 	.db #0x30	; 48	'0'
   4B44 30                  200 	.db #0x30	; 48	'0'
   4B45 34                  201 	.db #0x34	; 52	'4'
   4B46 50                  202 	.db #0x50	; 80	'P'
   4B47 10                  203 	.db #0x10	; 16
   4B48 A0                  204 	.db #0xA0	; 160
   4B49 10                  205 	.db #0x10	; 16
   4B4A 30                  206 	.db #0x30	; 48	'0'
   4B4B 0C                  207 	.db #0x0C	; 12
   4B4C 60                  208 	.db #0x60	; 96
   4B4D 34                  209 	.db #0x34	; 52	'4'
   4B4E 60                  210 	.db #0x60	; 96
   4B4F 30                  211 	.db #0x30	; 48	'0'
   4B50 90                  212 	.db #0x90	; 144
   4B51                     213 _originsu:
   4B51 04                  214 	.db #0x04	; 4
   4B52 A0                  215 	.db #0xA0	; 160
   4B53 08                  216 	.db #0x08	; 8
   4B54 10                  217 	.db #0x10	; 16
   4B55 0C                  218 	.db #0x0C	; 12
   4B56 20                  219 	.db #0x20	; 32
   4B57 49                  220 	.db #0x49	; 73	'I'
   4B58 60                  221 	.db #0x60	; 96
   4B59 04                  222 	.db #0x04	; 4
   4B5A 10                  223 	.db #0x10	; 16
   4B5B 08                  224 	.db #0x08	; 8
   4B5C A0                  225 	.db #0xA0	; 160
   4B5D 0C                  226 	.db #0x0C	; 12
   4B5E 90                  227 	.db #0x90	; 144
   4B5F 49                  228 	.db #0x49	; 73	'I'
   4B60 5C                  229 	.db #0x5C	; 92
   4B61                     230 _mapa1:
   4B61 01                  231 	.db #0x01	; 1
   4B62 01                  232 	.db #0x01	; 1
   4B63 01                  233 	.db #0x01	; 1
   4B64 01                  234 	.db #0x01	; 1
   4B65 01                  235 	.db #0x01	; 1
   4B66 01                  236 	.db #0x01	; 1
   4B67 01                  237 	.db #0x01	; 1
   4B68 01                  238 	.db #0x01	; 1
   4B69 01                  239 	.db #0x01	; 1
   4B6A 01                  240 	.db #0x01	; 1
   4B6B 01                  241 	.db #0x01	; 1
   4B6C 01                  242 	.db #0x01	; 1
   4B6D 01                  243 	.db #0x01	; 1
   4B6E 01                  244 	.db #0x01	; 1
   4B6F 01                  245 	.db #0x01	; 1
   4B70 01                  246 	.db #0x01	; 1
   4B71 01                  247 	.db #0x01	; 1
   4B72 01                  248 	.db #0x01	; 1
   4B73 01                  249 	.db #0x01	; 1
   4B74 01                  250 	.db #0x01	; 1
   4B75 01                  251 	.db #0x01	; 1
   4B76 07                  252 	.db #0x07	; 7
   4B77 05                  253 	.db #0x05	; 5
   4B78 07                  254 	.db #0x07	; 7
   4B79 07                  255 	.db #0x07	; 7
   4B7A 07                  256 	.db #0x07	; 7
   4B7B 07                  257 	.db #0x07	; 7
   4B7C 07                  258 	.db #0x07	; 7
   4B7D 07                  259 	.db #0x07	; 7
   4B7E 07                  260 	.db #0x07	; 7
   4B7F 07                  261 	.db #0x07	; 7
   4B80 07                  262 	.db #0x07	; 7
   4B81 07                  263 	.db #0x07	; 7
   4B82 07                  264 	.db #0x07	; 7
   4B83 07                  265 	.db #0x07	; 7
   4B84 07                  266 	.db #0x07	; 7
   4B85 07                  267 	.db #0x07	; 7
   4B86 07                  268 	.db #0x07	; 7
   4B87 07                  269 	.db #0x07	; 7
   4B88 01                  270 	.db #0x01	; 1
   4B89 01                  271 	.db #0x01	; 1
   4B8A 07                  272 	.db #0x07	; 7
   4B8B 07                  273 	.db #0x07	; 7
   4B8C 07                  274 	.db #0x07	; 7
   4B8D 07                  275 	.db #0x07	; 7
   4B8E 07                  276 	.db #0x07	; 7
   4B8F 07                  277 	.db #0x07	; 7
   4B90 07                  278 	.db #0x07	; 7
   4B91 07                  279 	.db #0x07	; 7
   4B92 07                  280 	.db #0x07	; 7
   4B93 07                  281 	.db #0x07	; 7
   4B94 07                  282 	.db #0x07	; 7
   4B95 07                  283 	.db #0x07	; 7
   4B96 07                  284 	.db #0x07	; 7
   4B97 07                  285 	.db #0x07	; 7
   4B98 07                  286 	.db #0x07	; 7
   4B99 07                  287 	.db #0x07	; 7
   4B9A 07                  288 	.db #0x07	; 7
   4B9B 07                  289 	.db #0x07	; 7
   4B9C 01                  290 	.db #0x01	; 1
   4B9D 01                  291 	.db #0x01	; 1
   4B9E 01                  292 	.db #0x01	; 1
   4B9F 01                  293 	.db #0x01	; 1
   4BA0 01                  294 	.db #0x01	; 1
   4BA1 01                  295 	.db #0x01	; 1
   4BA2 01                  296 	.db #0x01	; 1
   4BA3 01                  297 	.db #0x01	; 1
   4BA4 01                  298 	.db #0x01	; 1
   4BA5 01                  299 	.db #0x01	; 1
   4BA6 07                  300 	.db #0x07	; 7
   4BA7 07                  301 	.db #0x07	; 7
   4BA8 01                  302 	.db #0x01	; 1
   4BA9 01                  303 	.db #0x01	; 1
   4BAA 01                  304 	.db #0x01	; 1
   4BAB 01                  305 	.db #0x01	; 1
   4BAC 07                  306 	.db #0x07	; 7
   4BAD 07                  307 	.db #0x07	; 7
   4BAE 01                  308 	.db #0x01	; 1
   4BAF 01                  309 	.db #0x01	; 1
   4BB0 01                  310 	.db #0x01	; 1
   4BB1 01                  311 	.db #0x01	; 1
   4BB2 00                  312 	.db #0x00	; 0
   4BB3 00                  313 	.db #0x00	; 0
   4BB4 00                  314 	.db #0x00	; 0
   4BB5 00                  315 	.db #0x00	; 0
   4BB6 06                  316 	.db #0x06	; 6
   4BB7 06                  317 	.db #0x06	; 6
   4BB8 06                  318 	.db #0x06	; 6
   4BB9 06                  319 	.db #0x06	; 6
   4BBA 06                  320 	.db #0x06	; 6
   4BBB 06                  321 	.db #0x06	; 6
   4BBC 01                  322 	.db #0x01	; 1
   4BBD 03                  323 	.db #0x03	; 3
   4BBE 03                  324 	.db #0x03	; 3
   4BBF 03                  325 	.db #0x03	; 3
   4BC0 03                  326 	.db #0x03	; 3
   4BC1 03                  327 	.db #0x03	; 3
   4BC2 03                  328 	.db #0x03	; 3
   4BC3 03                  329 	.db #0x03	; 3
   4BC4 01                  330 	.db #0x01	; 1
   4BC5 00                  331 	.db #0x00	; 0
   4BC6 00                  332 	.db #0x00	; 0
   4BC7 01                  333 	.db #0x01	; 1
   4BC8 01                  334 	.db #0x01	; 1
   4BC9 01                  335 	.db #0x01	; 1
   4BCA 04                  336 	.db #0x04	; 4
   4BCB 04                  337 	.db #0x04	; 4
   4BCC 01                  338 	.db #0x01	; 1
   4BCD 06                  339 	.db #0x06	; 6
   4BCE 06                  340 	.db #0x06	; 6
   4BCF 06                  341 	.db #0x06	; 6
   4BD0 01                  342 	.db #0x01	; 1
   4BD1 03                  343 	.db #0x03	; 3
   4BD2 03                  344 	.db #0x03	; 3
   4BD3 03                  345 	.db #0x03	; 3
   4BD4 03                  346 	.db #0x03	; 3
   4BD5 03                  347 	.db #0x03	; 3
   4BD6 03                  348 	.db #0x03	; 3
   4BD7 03                  349 	.db #0x03	; 3
   4BD8 01                  350 	.db #0x01	; 1
   4BD9 01                  351 	.db #0x01	; 1
   4BDA 00                  352 	.db #0x00	; 0
   4BDB 01                  353 	.db #0x01	; 1
   4BDC 04                  354 	.db #0x04	; 4
   4BDD 04                  355 	.db #0x04	; 4
   4BDE 04                  356 	.db #0x04	; 4
   4BDF 04                  357 	.db #0x04	; 4
   4BE0 01                  358 	.db #0x01	; 1
   4BE1 06                  359 	.db #0x06	; 6
   4BE2 06                  360 	.db #0x06	; 6
   4BE3 06                  361 	.db #0x06	; 6
   4BE4 01                  362 	.db #0x01	; 1
   4BE5 03                  363 	.db #0x03	; 3
   4BE6 03                  364 	.db #0x03	; 3
   4BE7 03                  365 	.db #0x03	; 3
   4BE8 03                  366 	.db #0x03	; 3
   4BE9 03                  367 	.db #0x03	; 3
   4BEA 03                  368 	.db #0x03	; 3
   4BEB 03                  369 	.db #0x03	; 3
   4BEC 01                  370 	.db #0x01	; 1
   4BED 01                  371 	.db #0x01	; 1
   4BEE 00                  372 	.db #0x00	; 0
   4BEF 01                  373 	.db #0x01	; 1
   4BF0 04                  374 	.db #0x04	; 4
   4BF1 04                  375 	.db #0x04	; 4
   4BF2 04                  376 	.db #0x04	; 4
   4BF3 04                  377 	.db #0x04	; 4
   4BF4 01                  378 	.db #0x01	; 1
   4BF5 06                  379 	.db #0x06	; 6
   4BF6 06                  380 	.db #0x06	; 6
   4BF7 06                  381 	.db #0x06	; 6
   4BF8 01                  382 	.db #0x01	; 1
   4BF9 03                  383 	.db #0x03	; 3
   4BFA 03                  384 	.db #0x03	; 3
   4BFB 03                  385 	.db #0x03	; 3
   4BFC 03                  386 	.db #0x03	; 3
   4BFD 03                  387 	.db #0x03	; 3
   4BFE 03                  388 	.db #0x03	; 3
   4BFF 03                  389 	.db #0x03	; 3
   4C00 01                  390 	.db #0x01	; 1
   4C01 01                  391 	.db #0x01	; 1
   4C02 00                  392 	.db #0x00	; 0
   4C03 01                  393 	.db #0x01	; 1
   4C04 04                  394 	.db #0x04	; 4
   4C05 04                  395 	.db #0x04	; 4
   4C06 04                  396 	.db #0x04	; 4
   4C07 04                  397 	.db #0x04	; 4
   4C08 01                  398 	.db #0x01	; 1
   4C09 06                  399 	.db #0x06	; 6
   4C0A 06                  400 	.db #0x06	; 6
   4C0B 06                  401 	.db #0x06	; 6
   4C0C 01                  402 	.db #0x01	; 1
   4C0D 03                  403 	.db #0x03	; 3
   4C0E 03                  404 	.db #0x03	; 3
   4C0F 03                  405 	.db #0x03	; 3
   4C10 03                  406 	.db #0x03	; 3
   4C11 03                  407 	.db #0x03	; 3
   4C12 03                  408 	.db #0x03	; 3
   4C13 03                  409 	.db #0x03	; 3
   4C14 01                  410 	.db #0x01	; 1
   4C15 01                  411 	.db #0x01	; 1
   4C16 00                  412 	.db #0x00	; 0
   4C17 01                  413 	.db #0x01	; 1
   4C18 04                  414 	.db #0x04	; 4
   4C19 04                  415 	.db #0x04	; 4
   4C1A 04                  416 	.db #0x04	; 4
   4C1B 04                  417 	.db #0x04	; 4
   4C1C 01                  418 	.db #0x01	; 1
   4C1D 06                  419 	.db #0x06	; 6
   4C1E 06                  420 	.db #0x06	; 6
   4C1F 06                  421 	.db #0x06	; 6
   4C20 03                  422 	.db #0x03	; 3
   4C21 03                  423 	.db #0x03	; 3
   4C22 03                  424 	.db #0x03	; 3
   4C23 03                  425 	.db #0x03	; 3
   4C24 03                  426 	.db #0x03	; 3
   4C25 03                  427 	.db #0x03	; 3
   4C26 03                  428 	.db #0x03	; 3
   4C27 03                  429 	.db #0x03	; 3
   4C28 01                  430 	.db #0x01	; 1
   4C29 01                  431 	.db #0x01	; 1
   4C2A 02                  432 	.db #0x02	; 2
   4C2B 01                  433 	.db #0x01	; 1
   4C2C 04                  434 	.db #0x04	; 4
   4C2D 04                  435 	.db #0x04	; 4
   4C2E 04                  436 	.db #0x04	; 4
   4C2F 04                  437 	.db #0x04	; 4
   4C30 01                  438 	.db #0x01	; 1
   4C31 06                  439 	.db #0x06	; 6
   4C32 06                  440 	.db #0x06	; 6
   4C33 06                  441 	.db #0x06	; 6
   4C34 03                  442 	.db #0x03	; 3
   4C35 03                  443 	.db #0x03	; 3
   4C36 03                  444 	.db #0x03	; 3
   4C37 03                  445 	.db #0x03	; 3
   4C38 03                  446 	.db #0x03	; 3
   4C39 03                  447 	.db #0x03	; 3
   4C3A 03                  448 	.db #0x03	; 3
   4C3B 03                  449 	.db #0x03	; 3
   4C3C 01                  450 	.db #0x01	; 1
   4C3D 01                  451 	.db #0x01	; 1
   4C3E 01                  452 	.db #0x01	; 1
   4C3F 01                  453 	.db #0x01	; 1
   4C40 01                  454 	.db #0x01	; 1
   4C41 01                  455 	.db #0x01	; 1
   4C42 01                  456 	.db #0x01	; 1
   4C43 01                  457 	.db #0x01	; 1
   4C44 01                  458 	.db #0x01	; 1
   4C45 01                  459 	.db #0x01	; 1
   4C46 01                  460 	.db #0x01	; 1
   4C47 01                  461 	.db #0x01	; 1
   4C48 01                  462 	.db #0x01	; 1
   4C49 01                  463 	.db #0x01	; 1
   4C4A 01                  464 	.db #0x01	; 1
   4C4B 01                  465 	.db #0x01	; 1
   4C4C 09                  466 	.db #0x09	; 9
   4C4D 09                  467 	.db #0x09	; 9
   4C4E 01                  468 	.db #0x01	; 1
   4C4F 01                  469 	.db #0x01	; 1
   4C50 01                  470 	.db #0x01	; 1
   4C51                     471 _mapa2:
   4C51 01                  472 	.db #0x01	; 1
   4C52 01                  473 	.db #0x01	; 1
   4C53 09                  474 	.db #0x09	; 9
   4C54 09                  475 	.db #0x09	; 9
   4C55 01                  476 	.db #0x01	; 1
   4C56 01                  477 	.db #0x01	; 1
   4C57 01                  478 	.db #0x01	; 1
   4C58 01                  479 	.db #0x01	; 1
   4C59 01                  480 	.db #0x01	; 1
   4C5A 01                  481 	.db #0x01	; 1
   4C5B 01                  482 	.db #0x01	; 1
   4C5C 01                  483 	.db #0x01	; 1
   4C5D 01                  484 	.db #0x01	; 1
   4C5E 01                  485 	.db #0x01	; 1
   4C5F 01                  486 	.db #0x01	; 1
   4C60 01                  487 	.db #0x01	; 1
   4C61 01                  488 	.db #0x01	; 1
   4C62 01                  489 	.db #0x01	; 1
   4C63 01                  490 	.db #0x01	; 1
   4C64 01                  491 	.db #0x01	; 1
   4C65 01                  492 	.db #0x01	; 1
   4C66 00                  493 	.db #0x00	; 0
   4C67 00                  494 	.db #0x00	; 0
   4C68 00                  495 	.db #0x00	; 0
   4C69 00                  496 	.db #0x00	; 0
   4C6A 00                  497 	.db #0x00	; 0
   4C6B 01                  498 	.db #0x01	; 1
   4C6C 06                  499 	.db #0x06	; 6
   4C6D 06                  500 	.db #0x06	; 6
   4C6E 06                  501 	.db #0x06	; 6
   4C6F 06                  502 	.db #0x06	; 6
   4C70 06                  503 	.db #0x06	; 6
   4C71 06                  504 	.db #0x06	; 6
   4C72 06                  505 	.db #0x06	; 6
   4C73 06                  506 	.db #0x06	; 6
   4C74 06                  507 	.db #0x06	; 6
   4C75 06                  508 	.db #0x06	; 6
   4C76 00                  509 	.db #0x00	; 0
   4C77 00                  510 	.db #0x00	; 0
   4C78 01                  511 	.db #0x01	; 1
   4C79 01                  512 	.db #0x01	; 1
   4C7A 00                  513 	.db #0x00	; 0
   4C7B 00                  514 	.db #0x00	; 0
   4C7C 02                  515 	.db #0x02	; 2
   4C7D 00                  516 	.db #0x00	; 0
   4C7E 00                  517 	.db #0x00	; 0
   4C7F 01                  518 	.db #0x01	; 1
   4C80 06                  519 	.db #0x06	; 6
   4C81 06                  520 	.db #0x06	; 6
   4C82 06                  521 	.db #0x06	; 6
   4C83 06                  522 	.db #0x06	; 6
   4C84 06                  523 	.db #0x06	; 6
   4C85 06                  524 	.db #0x06	; 6
   4C86 06                  525 	.db #0x06	; 6
   4C87 06                  526 	.db #0x06	; 6
   4C88 06                  527 	.db #0x06	; 6
   4C89 06                  528 	.db #0x06	; 6
   4C8A 01                  529 	.db #0x01	; 1
   4C8B 00                  530 	.db #0x00	; 0
   4C8C 01                  531 	.db #0x01	; 1
   4C8D 01                  532 	.db #0x01	; 1
   4C8E 00                  533 	.db #0x00	; 0
   4C8F 00                  534 	.db #0x00	; 0
   4C90 00                  535 	.db #0x00	; 0
   4C91 00                  536 	.db #0x00	; 0
   4C92 00                  537 	.db #0x00	; 0
   4C93 01                  538 	.db #0x01	; 1
   4C94 06                  539 	.db #0x06	; 6
   4C95 06                  540 	.db #0x06	; 6
   4C96 06                  541 	.db #0x06	; 6
   4C97 06                  542 	.db #0x06	; 6
   4C98 06                  543 	.db #0x06	; 6
   4C99 06                  544 	.db #0x06	; 6
   4C9A 06                  545 	.db #0x06	; 6
   4C9B 06                  546 	.db #0x06	; 6
   4C9C 06                  547 	.db #0x06	; 6
   4C9D 06                  548 	.db #0x06	; 6
   4C9E 01                  549 	.db #0x01	; 1
   4C9F 00                  550 	.db #0x00	; 0
   4CA0 01                  551 	.db #0x01	; 1
   4CA1 01                  552 	.db #0x01	; 1
   4CA2 01                  553 	.db #0x01	; 1
   4CA3 01                  554 	.db #0x01	; 1
   4CA4 01                  555 	.db #0x01	; 1
   4CA5 00                  556 	.db #0x00	; 0
   4CA6 00                  557 	.db #0x00	; 0
   4CA7 01                  558 	.db #0x01	; 1
   4CA8 04                  559 	.db #0x04	; 4
   4CA9 04                  560 	.db #0x04	; 4
   4CAA 01                  561 	.db #0x01	; 1
   4CAB 01                  562 	.db #0x01	; 1
   4CAC 01                  563 	.db #0x01	; 1
   4CAD 01                  564 	.db #0x01	; 1
   4CAE 01                  565 	.db #0x01	; 1
   4CAF 01                  566 	.db #0x01	; 1
   4CB0 00                  567 	.db #0x00	; 0
   4CB1 00                  568 	.db #0x00	; 0
   4CB2 01                  569 	.db #0x01	; 1
   4CB3 00                  570 	.db #0x00	; 0
   4CB4 01                  571 	.db #0x01	; 1
   4CB5 01                  572 	.db #0x01	; 1
   4CB6 03                  573 	.db #0x03	; 3
   4CB7 03                  574 	.db #0x03	; 3
   4CB8 03                  575 	.db #0x03	; 3
   4CB9 03                  576 	.db #0x03	; 3
   4CBA 03                  577 	.db #0x03	; 3
   4CBB 01                  578 	.db #0x01	; 1
   4CBC 04                  579 	.db #0x04	; 4
   4CBD 04                  580 	.db #0x04	; 4
   4CBE 04                  581 	.db #0x04	; 4
   4CBF 04                  582 	.db #0x04	; 4
   4CC0 04                  583 	.db #0x04	; 4
   4CC1 04                  584 	.db #0x04	; 4
   4CC2 04                  585 	.db #0x04	; 4
   4CC3 01                  586 	.db #0x01	; 1
   4CC4 00                  587 	.db #0x00	; 0
   4CC5 00                  588 	.db #0x00	; 0
   4CC6 01                  589 	.db #0x01	; 1
   4CC7 00                  590 	.db #0x00	; 0
   4CC8 01                  591 	.db #0x01	; 1
   4CC9 01                  592 	.db #0x01	; 1
   4CCA 03                  593 	.db #0x03	; 3
   4CCB 03                  594 	.db #0x03	; 3
   4CCC 03                  595 	.db #0x03	; 3
   4CCD 03                  596 	.db #0x03	; 3
   4CCE 03                  597 	.db #0x03	; 3
   4CCF 01                  598 	.db #0x01	; 1
   4CD0 04                  599 	.db #0x04	; 4
   4CD1 04                  600 	.db #0x04	; 4
   4CD2 04                  601 	.db #0x04	; 4
   4CD3 04                  602 	.db #0x04	; 4
   4CD4 04                  603 	.db #0x04	; 4
   4CD5 04                  604 	.db #0x04	; 4
   4CD6 04                  605 	.db #0x04	; 4
   4CD7 01                  606 	.db #0x01	; 1
   4CD8 00                  607 	.db #0x00	; 0
   4CD9 00                  608 	.db #0x00	; 0
   4CDA 01                  609 	.db #0x01	; 1
   4CDB 05                  610 	.db #0x05	; 5
   4CDC 01                  611 	.db #0x01	; 1
   4CDD 01                  612 	.db #0x01	; 1
   4CDE 03                  613 	.db #0x03	; 3
   4CDF 03                  614 	.db #0x03	; 3
   4CE0 03                  615 	.db #0x03	; 3
   4CE1 03                  616 	.db #0x03	; 3
   4CE2 03                  617 	.db #0x03	; 3
   4CE3 01                  618 	.db #0x01	; 1
   4CE4 01                  619 	.db #0x01	; 1
   4CE5 01                  620 	.db #0x01	; 1
   4CE6 01                  621 	.db #0x01	; 1
   4CE7 01                  622 	.db #0x01	; 1
   4CE8 01                  623 	.db #0x01	; 1
   4CE9 00                  624 	.db #0x00	; 0
   4CEA 00                  625 	.db #0x00	; 0
   4CEB 01                  626 	.db #0x01	; 1
   4CEC 00                  627 	.db #0x00	; 0
   4CED 00                  628 	.db #0x00	; 0
   4CEE 01                  629 	.db #0x01	; 1
   4CEF 01                  630 	.db #0x01	; 1
   4CF0 01                  631 	.db #0x01	; 1
   4CF1 01                  632 	.db #0x01	; 1
   4CF2 03                  633 	.db #0x03	; 3
   4CF3 03                  634 	.db #0x03	; 3
   4CF4 03                  635 	.db #0x03	; 3
   4CF5 03                  636 	.db #0x03	; 3
   4CF6 03                  637 	.db #0x03	; 3
   4CF7 03                  638 	.db #0x03	; 3
   4CF8 03                  639 	.db #0x03	; 3
   4CF9 03                  640 	.db #0x03	; 3
   4CFA 03                  641 	.db #0x03	; 3
   4CFB 03                  642 	.db #0x03	; 3
   4CFC 03                  643 	.db #0x03	; 3
   4CFD 03                  644 	.db #0x03	; 3
   4CFE 03                  645 	.db #0x03	; 3
   4CFF 01                  646 	.db #0x01	; 1
   4D00 00                  647 	.db #0x00	; 0
   4D01 00                  648 	.db #0x00	; 0
   4D02 00                  649 	.db #0x00	; 0
   4D03 00                  650 	.db #0x00	; 0
   4D04 01                  651 	.db #0x01	; 1
   4D05 01                  652 	.db #0x01	; 1
   4D06 03                  653 	.db #0x03	; 3
   4D07 03                  654 	.db #0x03	; 3
   4D08 03                  655 	.db #0x03	; 3
   4D09 03                  656 	.db #0x03	; 3
   4D0A 03                  657 	.db #0x03	; 3
   4D0B 03                  658 	.db #0x03	; 3
   4D0C 03                  659 	.db #0x03	; 3
   4D0D 03                  660 	.db #0x03	; 3
   4D0E 03                  661 	.db #0x03	; 3
   4D0F 03                  662 	.db #0x03	; 3
   4D10 03                  663 	.db #0x03	; 3
   4D11 03                  664 	.db #0x03	; 3
   4D12 03                  665 	.db #0x03	; 3
   4D13 01                  666 	.db #0x01	; 1
   4D14 00                  667 	.db #0x00	; 0
   4D15 00                  668 	.db #0x00	; 0
   4D16 00                  669 	.db #0x00	; 0
   4D17 00                  670 	.db #0x00	; 0
   4D18 01                  671 	.db #0x01	; 1
   4D19 01                  672 	.db #0x01	; 1
   4D1A 03                  673 	.db #0x03	; 3
   4D1B 03                  674 	.db #0x03	; 3
   4D1C 03                  675 	.db #0x03	; 3
   4D1D 03                  676 	.db #0x03	; 3
   4D1E 03                  677 	.db #0x03	; 3
   4D1F 03                  678 	.db #0x03	; 3
   4D20 03                  679 	.db #0x03	; 3
   4D21 03                  680 	.db #0x03	; 3
   4D22 03                  681 	.db #0x03	; 3
   4D23 03                  682 	.db #0x03	; 3
   4D24 03                  683 	.db #0x03	; 3
   4D25 03                  684 	.db #0x03	; 3
   4D26 03                  685 	.db #0x03	; 3
   4D27 01                  686 	.db #0x01	; 1
   4D28 00                  687 	.db #0x00	; 0
   4D29 00                  688 	.db #0x00	; 0
   4D2A 00                  689 	.db #0x00	; 0
   4D2B 00                  690 	.db #0x00	; 0
   4D2C 01                  691 	.db #0x01	; 1
   4D2D 01                  692 	.db #0x01	; 1
   4D2E 01                  693 	.db #0x01	; 1
   4D2F 01                  694 	.db #0x01	; 1
   4D30 01                  695 	.db #0x01	; 1
   4D31 01                  696 	.db #0x01	; 1
   4D32 01                  697 	.db #0x01	; 1
   4D33 01                  698 	.db #0x01	; 1
   4D34 01                  699 	.db #0x01	; 1
   4D35 01                  700 	.db #0x01	; 1
   4D36 01                  701 	.db #0x01	; 1
   4D37 01                  702 	.db #0x01	; 1
   4D38 01                  703 	.db #0x01	; 1
   4D39 01                  704 	.db #0x01	; 1
   4D3A 01                  705 	.db #0x01	; 1
   4D3B 01                  706 	.db #0x01	; 1
   4D3C 01                  707 	.db #0x01	; 1
   4D3D 00                  708 	.db #0x00	; 0
   4D3E 01                  709 	.db #0x01	; 1
   4D3F 01                  710 	.db #0x01	; 1
   4D40 01                  711 	.db #0x01	; 1
                            712 ;src/init.h:20: void initPlayer(u8 p){
                            713 ;	---------------------------------
                            714 ; Function initPlayer
                            715 ; ---------------------------------
   4D41                     716 _initPlayer::
   4D41 DD E5         [15]  717 	push	ix
   4D43 DD 21 00 00   [14]  718 	ld	ix,#0
   4D47 DD 39         [15]  719 	add	ix,sp
                            720 ;src/init.h:21: u8 *sprite = gladis_quieto_dcha;
                            721 ;src/init.h:22: player.x = originsp[p-1][0];
   4D49 11 31 4B      [10]  722 	ld	de,#_originsp+0
   4D4C DD 6E 04      [19]  723 	ld	l,4 (ix)
   4D4F 2D            [ 4]  724 	dec	l
   4D50 26 00         [ 7]  725 	ld	h,#0x00
   4D52 29            [11]  726 	add	hl, hl
   4D53 19            [11]  727 	add	hl,de
   4D54 4D            [ 4]  728 	ld	c,l
   4D55 44            [ 4]  729 	ld	b,h
   4D56 0A            [ 7]  730 	ld	a,(bc)
   4D57 32 E6 90      [13]  731 	ld	(#_player),a
                            732 ;src/init.h:23: player.y = originsp[p-1][1];
   4D5A 59            [ 4]  733 	ld	e, c
   4D5B 50            [ 4]  734 	ld	d, b
   4D5C 13            [ 6]  735 	inc	de
   4D5D 1A            [ 7]  736 	ld	a,(de)
   4D5E 32 E7 90      [13]  737 	ld	(#(_player + 0x0001)),a
                            738 ;src/init.h:24: player.lx = originsp[p-1][0];
   4D61 0A            [ 7]  739 	ld	a,(bc)
   4D62 32 E8 90      [13]  740 	ld	(#(_player + 0x0002)),a
                            741 ;src/init.h:25: player.ly = originsp[p-1][1];
   4D65 1A            [ 7]  742 	ld	a,(de)
   4D66 32 E9 90      [13]  743 	ld	(#(_player + 0x0003)),a
                            744 ;src/init.h:26: player.sprite = sprite;
   4D69 21 00 40      [10]  745 	ld	hl,#_gladis_quieto_dcha
   4D6C 22 EA 90      [16]  746 	ld	((_player + 0x0004)), hl
                            747 ;src/init.h:27: player.life = 3;
   4D6F 21 EC 90      [10]  748 	ld	hl,#_player + 6
   4D72 36 03         [10]  749 	ld	(hl),#0x03
                            750 ;src/init.h:28: player.dir = 6;
   4D74 21 ED 90      [10]  751 	ld	hl,#_player + 7
   4D77 36 06         [10]  752 	ld	(hl),#0x06
                            753 ;src/init.h:29: player.atk = 20;
   4D79 21 EE 90      [10]  754 	ld	hl,#_player + 8
   4D7C 36 14         [10]  755 	ld	(hl),#0x14
                            756 ;src/init.h:30: player.latk = 20;
   4D7E 21 EF 90      [10]  757 	ld	hl,#_player + 9
   4D81 36 14         [10]  758 	ld	(hl),#0x14
                            759 ;src/init.h:31: player.bullets = 3;
   4D83 21 F0 90      [10]  760 	ld	hl,#_player + 10
   4D86 36 03         [10]  761 	ld	(hl),#0x03
   4D88 DD E1         [14]  762 	pop	ix
   4D8A C9            [10]  763 	ret
                            764 ;src/init.h:34: void restartPlayer(u8 p){
                            765 ;	---------------------------------
                            766 ; Function restartPlayer
                            767 ; ---------------------------------
   4D8B                     768 _restartPlayer::
   4D8B DD E5         [15]  769 	push	ix
   4D8D DD 21 00 00   [14]  770 	ld	ix,#0
   4D91 DD 39         [15]  771 	add	ix,sp
                            772 ;src/init.h:35: u8 *sprite = gladis_quieto_dcha;
                            773 ;src/init.h:36: player.x = originsp[p-1][0];
   4D93 11 31 4B      [10]  774 	ld	de,#_originsp+0
   4D96 DD 6E 04      [19]  775 	ld	l,4 (ix)
   4D99 2D            [ 4]  776 	dec	l
   4D9A 26 00         [ 7]  777 	ld	h,#0x00
   4D9C 29            [11]  778 	add	hl, hl
   4D9D 19            [11]  779 	add	hl,de
   4D9E 4D            [ 4]  780 	ld	c,l
   4D9F 44            [ 4]  781 	ld	b,h
   4DA0 0A            [ 7]  782 	ld	a,(bc)
   4DA1 32 E6 90      [13]  783 	ld	(#_player),a
                            784 ;src/init.h:37: player.y = originsp[p-1][1];
   4DA4 59            [ 4]  785 	ld	e, c
   4DA5 50            [ 4]  786 	ld	d, b
   4DA6 13            [ 6]  787 	inc	de
   4DA7 1A            [ 7]  788 	ld	a,(de)
   4DA8 32 E7 90      [13]  789 	ld	(#(_player + 0x0001)),a
                            790 ;src/init.h:38: player.lx = originsp[p-1][0];
   4DAB 0A            [ 7]  791 	ld	a,(bc)
   4DAC 32 E8 90      [13]  792 	ld	(#(_player + 0x0002)),a
                            793 ;src/init.h:39: player.ly = originsp[p-1][1];
   4DAF 1A            [ 7]  794 	ld	a,(de)
   4DB0 32 E9 90      [13]  795 	ld	(#(_player + 0x0003)),a
                            796 ;src/init.h:40: player.sprite = sprite;
   4DB3 21 00 40      [10]  797 	ld	hl,#_gladis_quieto_dcha
   4DB6 22 EA 90      [16]  798 	ld	((_player + 0x0004)), hl
                            799 ;src/init.h:41: player.dir = 6;
   4DB9 21 ED 90      [10]  800 	ld	hl,#_player + 7
   4DBC 36 06         [10]  801 	ld	(hl),#0x06
                            802 ;src/init.h:42: player.atk = 20;
   4DBE 21 EE 90      [10]  803 	ld	hl,#_player + 8
   4DC1 36 14         [10]  804 	ld	(hl),#0x14
                            805 ;src/init.h:43: player.latk = 20;
   4DC3 21 EF 90      [10]  806 	ld	hl,#_player + 9
   4DC6 36 14         [10]  807 	ld	(hl),#0x14
   4DC8 DD E1         [14]  808 	pop	ix
   4DCA C9            [10]  809 	ret
                            810 ;src/init.h:46: void initEnemies(u8 p){
                            811 ;	---------------------------------
                            812 ; Function initEnemies
                            813 ; ---------------------------------
   4DCB                     814 _initEnemies::
   4DCB DD E5         [15]  815 	push	ix
   4DCD DD 21 00 00   [14]  816 	ld	ix,#0
   4DD1 DD 39         [15]  817 	add	ix,sp
                            818 ;src/init.h:47: u8 *sprite = chacho_dcha;
                            819 ;src/init.h:48: enemy.x = originse[p-1][0];
   4DD3 11 39 4B      [10]  820 	ld	de,#_originse+0
   4DD6 DD 4E 04      [19]  821 	ld	c,4 (ix)
   4DD9 0D            [ 4]  822 	dec	c
   4DDA 06 00         [ 7]  823 	ld	b,#0x00
   4DDC 69            [ 4]  824 	ld	l, c
   4DDD 60            [ 4]  825 	ld	h, b
   4DDE 29            [11]  826 	add	hl, hl
   4DDF 09            [11]  827 	add	hl, bc
   4DE0 29            [11]  828 	add	hl, hl
   4DE1 19            [11]  829 	add	hl,de
   4DE2 EB            [ 4]  830 	ex	de,hl
   4DE3 1A            [ 7]  831 	ld	a,(de)
   4DE4 32 F1 90      [13]  832 	ld	(#_enemy),a
                            833 ;src/init.h:49: enemy.y = originse[p-1][1];
   4DE7 D5            [11]  834 	push	de
   4DE8 FD E1         [14]  835 	pop	iy
   4DEA FD 23         [10]  836 	inc	iy
   4DEC FD 7E 00      [19]  837 	ld	a, 0 (iy)
   4DEF 32 F2 90      [13]  838 	ld	(#(_enemy + 0x0001)),a
                            839 ;src/init.h:50: enemy.lx = originse[p-1][0];
   4DF2 1A            [ 7]  840 	ld	a,(de)
   4DF3 32 F3 90      [13]  841 	ld	(#(_enemy + 0x0002)),a
                            842 ;src/init.h:51: enemy.ly = originse[p-1][1];
   4DF6 FD 7E 00      [19]  843 	ld	a, 0 (iy)
   4DF9 32 F4 90      [13]  844 	ld	(#(_enemy + 0x0003)),a
                            845 ;src/init.h:52: enemy.ox = originse[p-1][2];
   4DFC 6B            [ 4]  846 	ld	l, e
   4DFD 62            [ 4]  847 	ld	h, d
   4DFE 23            [ 6]  848 	inc	hl
   4DFF 23            [ 6]  849 	inc	hl
   4E00 7E            [ 7]  850 	ld	a,(hl)
   4E01 32 F5 90      [13]  851 	ld	(#(_enemy + 0x0004)),a
                            852 ;src/init.h:53: enemy.oy = originse[p-1][3];
   4E04 D5            [11]  853 	push	de
   4E05 FD E1         [14]  854 	pop	iy
   4E07 FD 7E 03      [19]  855 	ld	a,3 (iy)
   4E0A 32 F6 90      [13]  856 	ld	(#(_enemy + 0x0005)),a
                            857 ;src/init.h:54: enemy.sprite = sprite;
   4E0D 21 80 44      [10]  858 	ld	hl,#_chacho_dcha
   4E10 22 F7 90      [16]  859 	ld	((_enemy + 0x0006)), hl
                            860 ;src/init.h:55: enemy.life = p;
   4E13 21 F9 90      [10]  861 	ld	hl,#_enemy + 8
   4E16 DD 7E 04      [19]  862 	ld	a,4 (ix)
   4E19 77            [ 7]  863 	ld	(hl),a
                            864 ;src/init.h:56: enemy.dir = 6;
   4E1A 21 FA 90      [10]  865 	ld	hl,#_enemy + 9
   4E1D 36 06         [10]  866 	ld	(hl),#0x06
                            867 ;src/init.h:57: enemy.room = 3;
   4E1F 21 FB 90      [10]  868 	ld	hl,#_enemy + 10
   4E22 36 03         [10]  869 	ld	(hl),#0x03
                            870 ;src/init.h:58: enemy.lp = 75 - ((p-1)*5);
   4E24 69            [ 4]  871 	ld	l,c
   4E25 29            [11]  872 	add	hl, hl
   4E26 29            [11]  873 	add	hl, hl
   4E27 09            [11]  874 	add	hl, bc
   4E28 3E 4B         [ 7]  875 	ld	a,#0x4B
   4E2A 95            [ 4]  876 	sub	a, l
   4E2B 32 FF 90      [13]  877 	ld	(#(_enemy + 0x000e)),a
   4E2E DD E1         [14]  878 	pop	ix
   4E30 C9            [10]  879 	ret
                            880 ;src/init.h:61: void initNivel(){
                            881 ;	---------------------------------
                            882 ; Function initNivel
                            883 ; ---------------------------------
   4E31                     884 _initNivel::
                            885 ;src/init.h:62: n.num=0;
   4E31 21 D9 90      [10]  886 	ld	hl,#_n+0
   4E34 36 00         [10]  887 	ld	(hl),#0x00
                            888 ;src/init.h:63: n.corazon=0;
   4E36 21 DA 90      [10]  889 	ld	hl,#_n + 1
   4E39 36 00         [10]  890 	ld	(hl),#0x00
                            891 ;src/init.h:64: n.bullet=0;
   4E3B 21 DB 90      [10]  892 	ld	hl,#_n + 2
   4E3E 36 00         [10]  893 	ld	(hl),#0x00
   4E40 C9            [10]  894 	ret
                            895 ;src/init.h:67: void initVariables(u8 m){
                            896 ;	---------------------------------
                            897 ; Function initVariables
                            898 ; ---------------------------------
   4E41                     899 _initVariables::
                            900 ;src/init.h:68: bound =0;
   4E41 21 D6 90      [10]  901 	ld	hl,#_bound + 0
   4E44 36 00         [10]  902 	ld	(hl), #0x00
                            903 ;src/init.h:69: temp = 0;
   4E46 21 D0 90      [10]  904 	ld	hl,#_temp + 0
   4E49 36 00         [10]  905 	ld	(hl), #0x00
                            906 ;src/init.h:70: map = m;
   4E4B 21 02 00      [10]  907 	ld	hl, #2+0
   4E4E 39            [11]  908 	add	hl, sp
   4E4F 7E            [ 7]  909 	ld	a, (hl)
   4E50 32 D1 90      [13]  910 	ld	(#_map + 0),a
                            911 ;src/init.h:71: arrow =0;
   4E53 21 D4 90      [10]  912 	ld	hl,#_arrow + 0
   4E56 36 00         [10]  913 	ld	(hl), #0x00
                            914 ;src/init.h:72: finish =0;
   4E58 21 D3 90      [10]  915 	ld	hl,#_finish + 0
   4E5B 36 00         [10]  916 	ld	(hl), #0x00
                            917 ;src/init.h:73: following =0;
   4E5D 21 D5 90      [10]  918 	ld	hl,#_following + 0
   4E60 36 00         [10]  919 	ld	(hl), #0x00
                            920 ;src/init.h:74: archer = 0;
   4E62 21 D7 90      [10]  921 	ld	hl,#_archer + 0
   4E65 36 00         [10]  922 	ld	(hl), #0x00
                            923 ;src/init.h:75: dead =0;
   4E67 21 D8 90      [10]  924 	ld	hl,#_dead + 0
   4E6A 36 00         [10]  925 	ld	(hl), #0x00
   4E6C C9            [10]  926 	ret
                            927 ;src/draws.h:12: void endGame(){
                            928 ;	---------------------------------
                            929 ; Function endGame
                            930 ; ---------------------------------
   4E6D                     931 _endGame::
                            932 ;src/draws.h:14: cpct_clearScreen(0);
   4E6D 21 00 40      [10]  933 	ld	hl,#0x4000
   4E70 E5            [11]  934 	push	hl
   4E71 AF            [ 4]  935 	xor	a, a
   4E72 F5            [11]  936 	push	af
   4E73 33            [ 6]  937 	inc	sp
   4E74 26 C0         [ 7]  938 	ld	h, #0xC0
   4E76 E5            [11]  939 	push	hl
   4E77 CD F7 8D      [17]  940 	call	_cpct_memset
                            941 ;src/draws.h:15: memptr = cpct_getScreenPtr(VMEM,10,10);
   4E7A 21 0A 0A      [10]  942 	ld	hl,#0x0A0A
   4E7D E5            [11]  943 	push	hl
   4E7E 21 00 C0      [10]  944 	ld	hl,#0xC000
   4E81 E5            [11]  945 	push	hl
   4E82 CD EA 8E      [17]  946 	call	_cpct_getScreenPtr
                            947 ;src/draws.h:16: cpct_drawStringM0("Congratulations",memptr,1,0);
   4E85 EB            [ 4]  948 	ex	de,hl
   4E86 01 DA 4E      [10]  949 	ld	bc,#___str_0+0
   4E89 21 01 00      [10]  950 	ld	hl,#0x0001
   4E8C E5            [11]  951 	push	hl
   4E8D D5            [11]  952 	push	de
   4E8E C5            [11]  953 	push	bc
   4E8F CD 09 8C      [17]  954 	call	_cpct_drawStringM0
   4E92 21 06 00      [10]  955 	ld	hl,#6
   4E95 39            [11]  956 	add	hl,sp
   4E96 F9            [ 6]  957 	ld	sp,hl
                            958 ;src/draws.h:18: memptr = cpct_getScreenPtr(VMEM,29,82);
   4E97 21 1D 52      [10]  959 	ld	hl,#0x521D
   4E9A E5            [11]  960 	push	hl
   4E9B 21 00 C0      [10]  961 	ld	hl,#0xC000
   4E9E E5            [11]  962 	push	hl
   4E9F CD EA 8E      [17]  963 	call	_cpct_getScreenPtr
                            964 ;src/draws.h:19: cpct_drawSprite(cup,memptr,22,44);
   4EA2 EB            [ 4]  965 	ex	de,hl
   4EA3 01 80 46      [10]  966 	ld	bc,#_cup+0
   4EA6 21 16 2C      [10]  967 	ld	hl,#0x2C16
   4EA9 E5            [11]  968 	push	hl
   4EAA D5            [11]  969 	push	de
   4EAB C5            [11]  970 	push	bc
   4EAC CD 2D 8C      [17]  971 	call	_cpct_drawSprite
                            972 ;src/draws.h:22: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   4EAF 21 0C AF      [10]  973 	ld	hl,#0xAF0C
   4EB2 E5            [11]  974 	push	hl
   4EB3 21 00 C0      [10]  975 	ld	hl,#0xC000
   4EB6 E5            [11]  976 	push	hl
   4EB7 CD EA 8E      [17]  977 	call	_cpct_getScreenPtr
                            978 ;src/draws.h:23: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   4EBA EB            [ 4]  979 	ex	de,hl
   4EBB 01 EA 4E      [10]  980 	ld	bc,#___str_1+0
   4EBE 21 01 00      [10]  981 	ld	hl,#0x0001
   4EC1 E5            [11]  982 	push	hl
   4EC2 D5            [11]  983 	push	de
   4EC3 C5            [11]  984 	push	bc
   4EC4 CD 09 8C      [17]  985 	call	_cpct_drawStringM0
   4EC7 21 06 00      [10]  986 	ld	hl,#6
   4ECA 39            [11]  987 	add	hl,sp
   4ECB F9            [ 6]  988 	ld	sp,hl
                            989 ;src/draws.h:25: while(1){
   4ECC                     990 00104$:
                            991 ;src/draws.h:26: cpct_scanKeyboard_f();
   4ECC CD 28 8B      [17]  992 	call	_cpct_scanKeyboard_f
                            993 ;src/draws.h:27: if(cpct_isKeyPressed(Key_Space)) return;
   4ECF 21 05 80      [10]  994 	ld	hl,#0x8005
   4ED2 CD 1C 8B      [17]  995 	call	_cpct_isKeyPressed
   4ED5 7D            [ 4]  996 	ld	a,l
   4ED6 B7            [ 4]  997 	or	a, a
   4ED7 28 F3         [12]  998 	jr	Z,00104$
   4ED9 C9            [10]  999 	ret
   4EDA                    1000 ___str_0:
   4EDA 43 6F 6E 67 72 61  1001 	.ascii "Congratulations"
        74 75 6C 61 74 69
        6F 6E 73
   4EE9 00                 1002 	.db 0x00
   4EEA                    1003 ___str_1:
   4EEA 50 75 6C 73 61 20  1004 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   4EF7 00                 1005 	.db 0x00
                           1006 ;src/draws.h:32: void vaciar(){
                           1007 ;	---------------------------------
                           1008 ; Function vaciar
                           1009 ; ---------------------------------
   4EF8                    1010 _vaciar::
                           1011 ;src/draws.h:34: for(y=0;y<height;y++){
   4EF8 06 00         [ 7] 1012 	ld	b,#0x00
   4EFA 11 00 00      [10] 1013 	ld	de,#0x0000
                           1014 ;src/draws.h:35: for(x=0;x<width;x++){
   4EFD                    1015 00109$:
   4EFD 21 E0 8F      [10] 1016 	ld	hl,#_scene
   4F00 19            [11] 1017 	add	hl,de
   4F01 0E 00         [ 7] 1018 	ld	c,#0x00
   4F03                    1019 00103$:
                           1020 ;src/draws.h:36: scene[y][x] = 0;
   4F03 E5            [11] 1021 	push	hl
   4F04 69            [ 4] 1022 	ld	l,c
   4F05 26 00         [ 7] 1023 	ld	h,#0x00
   4F07 E5            [11] 1024 	push	hl
   4F08 FD E1         [14] 1025 	pop	iy
   4F0A E1            [10] 1026 	pop	hl
   4F0B C5            [11] 1027 	push	bc
   4F0C 4D            [ 4] 1028 	ld	c, l
   4F0D 44            [ 4] 1029 	ld	b, h
   4F0E FD 09         [15] 1030 	add	iy, bc
   4F10 C1            [10] 1031 	pop	bc
   4F11 FD 36 00 00   [19] 1032 	ld	0 (iy), #0x00
                           1033 ;src/draws.h:35: for(x=0;x<width;x++){
   4F15 0C            [ 4] 1034 	inc	c
   4F16 79            [ 4] 1035 	ld	a,c
   4F17 D6 14         [ 7] 1036 	sub	a, #0x14
   4F19 38 E8         [12] 1037 	jr	C,00103$
                           1038 ;src/draws.h:34: for(y=0;y<height;y++){
   4F1B 21 14 00      [10] 1039 	ld	hl,#0x0014
   4F1E 19            [11] 1040 	add	hl,de
   4F1F EB            [ 4] 1041 	ex	de,hl
   4F20 04            [ 4] 1042 	inc	b
   4F21 78            [ 4] 1043 	ld	a,b
   4F22 D6 0C         [ 7] 1044 	sub	a, #0x0C
   4F24 38 D7         [12] 1045 	jr	C,00109$
   4F26 C9            [10] 1046 	ret
                           1047 ;src/draws.h:42: void mapSelector(u8 t){
                           1048 ;	---------------------------------
                           1049 ; Function mapSelector
                           1050 ; ---------------------------------
   4F27                    1051 _mapSelector::
   4F27 DD E5         [15] 1052 	push	ix
   4F29 DD 21 00 00   [14] 1053 	ld	ix,#0
   4F2D DD 39         [15] 1054 	add	ix,sp
   4F2F 21 F3 FF      [10] 1055 	ld	hl,#-13
   4F32 39            [11] 1056 	add	hl,sp
   4F33 F9            [ 6] 1057 	ld	sp,hl
                           1058 ;src/draws.h:44: vaciar();
   4F34 CD F8 4E      [17] 1059 	call	_vaciar
                           1060 ;src/draws.h:45: switch(t){
   4F37 DD 7E 04      [19] 1061 	ld	a,4 (ix)
   4F3A D6 01         [ 7] 1062 	sub	a, #0x01
   4F3C DA B9 51      [10] 1063 	jp	C,00136$
   4F3F 3E 04         [ 7] 1064 	ld	a,#0x04
   4F41 DD 96 04      [19] 1065 	sub	a, 4 (ix)
   4F44 DA B9 51      [10] 1066 	jp	C,00136$
   4F47 DD 5E 04      [19] 1067 	ld	e,4 (ix)
   4F4A 1D            [ 4] 1068 	dec	e
   4F4B 16 00         [ 7] 1069 	ld	d,#0x00
   4F4D 21 54 4F      [10] 1070 	ld	hl,#00232$
   4F50 19            [11] 1071 	add	hl,de
   4F51 19            [11] 1072 	add	hl,de
   4F52 19            [11] 1073 	add	hl,de
   4F53 E9            [ 4] 1074 	jp	(hl)
   4F54                    1075 00232$:
   4F54 C3 60 4F      [10] 1076 	jp	00101$
   4F57 C3 E7 4F      [10] 1077 	jp	00104$
   4F5A C3 6E 50      [10] 1078 	jp	00107$
   4F5D C3 11 51      [10] 1079 	jp	00111$
                           1080 ;src/draws.h:46: case 1: 
   4F60                    1081 00101$:
                           1082 ;src/draws.h:47: for(y=0;y<height;y++){
   4F60 DD 36 F3 00   [19] 1083 	ld	-13 (ix),#0x00
   4F64 DD 36 FC 00   [19] 1084 	ld	-4 (ix),#0x00
   4F68 DD 36 FD 00   [19] 1085 	ld	-3 (ix),#0x00
                           1086 ;src/draws.h:48: for(x=0;x<width;x++){
   4F6C                    1087 00140$:
   4F6C 3E E0         [ 7] 1088 	ld	a,#<(_scene)
   4F6E DD 86 FC      [19] 1089 	add	a, -4 (ix)
   4F71 DD 77 FA      [19] 1090 	ld	-6 (ix),a
   4F74 3E 8F         [ 7] 1091 	ld	a,#>(_scene)
   4F76 DD 8E FD      [19] 1092 	adc	a, -3 (ix)
   4F79 DD 77 FB      [19] 1093 	ld	-5 (ix),a
   4F7C 3E 61         [ 7] 1094 	ld	a,#<(_mapa1)
   4F7E DD 86 FC      [19] 1095 	add	a, -4 (ix)
   4F81 DD 77 FE      [19] 1096 	ld	-2 (ix),a
   4F84 3E 4B         [ 7] 1097 	ld	a,#>(_mapa1)
   4F86 DD 8E FD      [19] 1098 	adc	a, -3 (ix)
   4F89 DD 77 FF      [19] 1099 	ld	-1 (ix),a
   4F8C DD 36 F5 00   [19] 1100 	ld	-11 (ix),#0x00
   4F90                    1101 00116$:
                           1102 ;src/draws.h:49: scene[y][x] = mapa1[y][x];
   4F90 DD 7E FA      [19] 1103 	ld	a,-6 (ix)
   4F93 DD 86 F5      [19] 1104 	add	a, -11 (ix)
   4F96 DD 77 F8      [19] 1105 	ld	-8 (ix),a
   4F99 DD 7E FB      [19] 1106 	ld	a,-5 (ix)
   4F9C CE 00         [ 7] 1107 	adc	a, #0x00
   4F9E DD 77 F9      [19] 1108 	ld	-7 (ix),a
   4FA1 DD 7E FE      [19] 1109 	ld	a,-2 (ix)
   4FA4 DD 86 F5      [19] 1110 	add	a, -11 (ix)
   4FA7 DD 77 F6      [19] 1111 	ld	-10 (ix),a
   4FAA DD 7E FF      [19] 1112 	ld	a,-1 (ix)
   4FAD CE 00         [ 7] 1113 	adc	a, #0x00
   4FAF DD 77 F7      [19] 1114 	ld	-9 (ix),a
   4FB2 DD 6E F6      [19] 1115 	ld	l,-10 (ix)
   4FB5 DD 66 F7      [19] 1116 	ld	h,-9 (ix)
   4FB8 7E            [ 7] 1117 	ld	a,(hl)
   4FB9 DD 6E F8      [19] 1118 	ld	l,-8 (ix)
   4FBC DD 66 F9      [19] 1119 	ld	h,-7 (ix)
   4FBF 77            [ 7] 1120 	ld	(hl),a
                           1121 ;src/draws.h:48: for(x=0;x<width;x++){
   4FC0 DD 34 F5      [23] 1122 	inc	-11 (ix)
   4FC3 DD 7E F5      [19] 1123 	ld	a,-11 (ix)
   4FC6 D6 14         [ 7] 1124 	sub	a, #0x14
   4FC8 38 C6         [12] 1125 	jr	C,00116$
                           1126 ;src/draws.h:47: for(y=0;y<height;y++){
   4FCA DD 7E FC      [19] 1127 	ld	a,-4 (ix)
   4FCD C6 14         [ 7] 1128 	add	a, #0x14
   4FCF DD 77 FC      [19] 1129 	ld	-4 (ix),a
   4FD2 DD 7E FD      [19] 1130 	ld	a,-3 (ix)
   4FD5 CE 00         [ 7] 1131 	adc	a, #0x00
   4FD7 DD 77 FD      [19] 1132 	ld	-3 (ix),a
   4FDA DD 34 F3      [23] 1133 	inc	-13 (ix)
   4FDD DD 7E F3      [19] 1134 	ld	a,-13 (ix)
   4FE0 D6 0C         [ 7] 1135 	sub	a, #0x0C
   4FE2 38 88         [12] 1136 	jr	C,00140$
                           1137 ;src/draws.h:52: break;
   4FE4 C3 B9 51      [10] 1138 	jp	00136$
                           1139 ;src/draws.h:53: case 2:
   4FE7                    1140 00104$:
                           1141 ;src/draws.h:54: for(y=0;y<height;y++){
   4FE7 DD 36 F3 00   [19] 1142 	ld	-13 (ix),#0x00
   4FEB DD 36 F6 00   [19] 1143 	ld	-10 (ix),#0x00
   4FEF DD 36 F7 00   [19] 1144 	ld	-9 (ix),#0x00
                           1145 ;src/draws.h:55: for(x=0;x<width;x++){
   4FF3                    1146 00144$:
   4FF3 3E E0         [ 7] 1147 	ld	a,#<(_scene)
   4FF5 DD 86 F6      [19] 1148 	add	a, -10 (ix)
   4FF8 DD 77 F8      [19] 1149 	ld	-8 (ix),a
   4FFB 3E 8F         [ 7] 1150 	ld	a,#>(_scene)
   4FFD DD 8E F7      [19] 1151 	adc	a, -9 (ix)
   5000 DD 77 F9      [19] 1152 	ld	-7 (ix),a
   5003 3E 51         [ 7] 1153 	ld	a,#<(_mapa2)
   5005 DD 86 F6      [19] 1154 	add	a, -10 (ix)
   5008 DD 77 FE      [19] 1155 	ld	-2 (ix),a
   500B 3E 4C         [ 7] 1156 	ld	a,#>(_mapa2)
   500D DD 8E F7      [19] 1157 	adc	a, -9 (ix)
   5010 DD 77 FF      [19] 1158 	ld	-1 (ix),a
   5013 DD 36 F5 00   [19] 1159 	ld	-11 (ix),#0x00
   5017                    1160 00120$:
                           1161 ;src/draws.h:56: scene[y][x] = mapa2[y][x];
   5017 DD 7E F8      [19] 1162 	ld	a,-8 (ix)
   501A DD 86 F5      [19] 1163 	add	a, -11 (ix)
   501D DD 77 FA      [19] 1164 	ld	-6 (ix),a
   5020 DD 7E F9      [19] 1165 	ld	a,-7 (ix)
   5023 CE 00         [ 7] 1166 	adc	a, #0x00
   5025 DD 77 FB      [19] 1167 	ld	-5 (ix),a
   5028 DD 7E FE      [19] 1168 	ld	a,-2 (ix)
   502B DD 86 F5      [19] 1169 	add	a, -11 (ix)
   502E DD 77 FC      [19] 1170 	ld	-4 (ix),a
   5031 DD 7E FF      [19] 1171 	ld	a,-1 (ix)
   5034 CE 00         [ 7] 1172 	adc	a, #0x00
   5036 DD 77 FD      [19] 1173 	ld	-3 (ix),a
   5039 DD 6E FC      [19] 1174 	ld	l,-4 (ix)
   503C DD 66 FD      [19] 1175 	ld	h,-3 (ix)
   503F 7E            [ 7] 1176 	ld	a,(hl)
   5040 DD 6E FA      [19] 1177 	ld	l,-6 (ix)
   5043 DD 66 FB      [19] 1178 	ld	h,-5 (ix)
   5046 77            [ 7] 1179 	ld	(hl),a
                           1180 ;src/draws.h:55: for(x=0;x<width;x++){
   5047 DD 34 F5      [23] 1181 	inc	-11 (ix)
   504A DD 7E F5      [19] 1182 	ld	a,-11 (ix)
   504D D6 14         [ 7] 1183 	sub	a, #0x14
   504F 38 C6         [12] 1184 	jr	C,00120$
                           1185 ;src/draws.h:54: for(y=0;y<height;y++){
   5051 DD 7E F6      [19] 1186 	ld	a,-10 (ix)
   5054 C6 14         [ 7] 1187 	add	a, #0x14
   5056 DD 77 F6      [19] 1188 	ld	-10 (ix),a
   5059 DD 7E F7      [19] 1189 	ld	a,-9 (ix)
   505C CE 00         [ 7] 1190 	adc	a, #0x00
   505E DD 77 F7      [19] 1191 	ld	-9 (ix),a
   5061 DD 34 F3      [23] 1192 	inc	-13 (ix)
   5064 DD 7E F3      [19] 1193 	ld	a,-13 (ix)
   5067 D6 0C         [ 7] 1194 	sub	a, #0x0C
   5069 38 88         [12] 1195 	jr	C,00144$
                           1196 ;src/draws.h:59: break;
   506B C3 B9 51      [10] 1197 	jp	00136$
                           1198 ;src/draws.h:60: case 3: 
   506E                    1199 00107$:
                           1200 ;src/draws.h:61: for(y=height-1;y!=0;y--){
   506E DD 36 F4 00   [19] 1201 	ld	-12 (ix),#0x00
   5072 DD 36 F3 0B   [19] 1202 	ld	-13 (ix),#0x0B
   5076 01 00 00      [10] 1203 	ld	bc,#0x0000
   5079 11 DC 00      [10] 1204 	ld	de,#0x00DC
                           1205 ;src/draws.h:62: for(x=0;x<width;x++){
   507C                    1206 00148$:
   507C 21 E0 8F      [10] 1207 	ld	hl,#_scene
   507F 09            [11] 1208 	add	hl,bc
   5080 DD 75 F6      [19] 1209 	ld	-10 (ix),l
   5083 DD 74 F7      [19] 1210 	ld	-9 (ix),h
   5086 21 61 4B      [10] 1211 	ld	hl,#_mapa1
   5089 19            [11] 1212 	add	hl,de
   508A DD 75 F8      [19] 1213 	ld	-8 (ix),l
   508D DD 74 F9      [19] 1214 	ld	-7 (ix),h
   5090 DD 36 F5 00   [19] 1215 	ld	-11 (ix),#0x00
   5094                    1216 00124$:
                           1217 ;src/draws.h:63: scene[aux][x] = mapa1[y][x];
   5094 DD 7E F6      [19] 1218 	ld	a,-10 (ix)
   5097 DD 86 F5      [19] 1219 	add	a, -11 (ix)
   509A DD 77 FE      [19] 1220 	ld	-2 (ix),a
   509D DD 7E F7      [19] 1221 	ld	a,-9 (ix)
   50A0 CE 00         [ 7] 1222 	adc	a, #0x00
   50A2 DD 77 FF      [19] 1223 	ld	-1 (ix),a
   50A5 DD 7E F8      [19] 1224 	ld	a,-8 (ix)
   50A8 DD 86 F5      [19] 1225 	add	a, -11 (ix)
   50AB 6F            [ 4] 1226 	ld	l,a
   50AC DD 7E F9      [19] 1227 	ld	a,-7 (ix)
   50AF CE 00         [ 7] 1228 	adc	a, #0x00
   50B1 67            [ 4] 1229 	ld	h,a
   50B2 7E            [ 7] 1230 	ld	a,(hl)
   50B3 DD 6E FE      [19] 1231 	ld	l,-2 (ix)
   50B6 DD 66 FF      [19] 1232 	ld	h,-1 (ix)
   50B9 77            [ 7] 1233 	ld	(hl),a
                           1234 ;src/draws.h:62: for(x=0;x<width;x++){
   50BA DD 34 F5      [23] 1235 	inc	-11 (ix)
   50BD DD 7E F5      [19] 1236 	ld	a,-11 (ix)
   50C0 D6 14         [ 7] 1237 	sub	a, #0x14
   50C2 38 D0         [12] 1238 	jr	C,00124$
                           1239 ;src/draws.h:65: aux++;
   50C4 21 14 00      [10] 1240 	ld	hl,#0x0014
   50C7 09            [11] 1241 	add	hl,bc
   50C8 4D            [ 4] 1242 	ld	c,l
   50C9 44            [ 4] 1243 	ld	b,h
   50CA DD 34 F4      [23] 1244 	inc	-12 (ix)
                           1245 ;src/draws.h:61: for(y=height-1;y!=0;y--){
   50CD 7B            [ 4] 1246 	ld	a,e
   50CE C6 EC         [ 7] 1247 	add	a,#0xEC
   50D0 5F            [ 4] 1248 	ld	e,a
   50D1 7A            [ 4] 1249 	ld	a,d
   50D2 CE FF         [ 7] 1250 	adc	a,#0xFF
   50D4 57            [ 4] 1251 	ld	d,a
   50D5 DD 35 F3      [23] 1252 	dec	-13 (ix)
   50D8 DD 7E F3      [19] 1253 	ld	a,-13 (ix)
   50DB B7            [ 4] 1254 	or	a, a
   50DC 20 9E         [12] 1255 	jr	NZ,00148$
                           1256 ;src/draws.h:67: for(x=0;x<width;x++){
   50DE DD 4E F4      [19] 1257 	ld	c,-12 (ix)
   50E1 06 00         [ 7] 1258 	ld	b,#0x00
   50E3 69            [ 4] 1259 	ld	l, c
   50E4 60            [ 4] 1260 	ld	h, b
   50E5 29            [11] 1261 	add	hl, hl
   50E6 29            [11] 1262 	add	hl, hl
   50E7 09            [11] 1263 	add	hl, bc
   50E8 29            [11] 1264 	add	hl, hl
   50E9 29            [11] 1265 	add	hl, hl
   50EA 3E E0         [ 7] 1266 	ld	a,#<(_scene)
   50EC 85            [ 4] 1267 	add	a, l
   50ED 4F            [ 4] 1268 	ld	c,a
   50EE 3E 8F         [ 7] 1269 	ld	a,#>(_scene)
   50F0 8C            [ 4] 1270 	adc	a, h
   50F1 47            [ 4] 1271 	ld	b,a
   50F2 1E 00         [ 7] 1272 	ld	e,#0x00
   50F4                    1273 00128$:
                           1274 ;src/draws.h:68: scene[aux][x] = mapa1[0][x];
   50F4 E5            [11] 1275 	push	hl
   50F5 6B            [ 4] 1276 	ld	l,e
   50F6 26 00         [ 7] 1277 	ld	h,#0x00
   50F8 E5            [11] 1278 	push	hl
   50F9 FD E1         [14] 1279 	pop	iy
   50FB E1            [10] 1280 	pop	hl
   50FC FD 09         [15] 1281 	add	iy, bc
   50FE 21 61 4B      [10] 1282 	ld	hl,#_mapa1
   5101 16 00         [ 7] 1283 	ld	d,#0x00
   5103 19            [11] 1284 	add	hl, de
   5104 7E            [ 7] 1285 	ld	a,(hl)
   5105 FD 77 00      [19] 1286 	ld	0 (iy), a
                           1287 ;src/draws.h:67: for(x=0;x<width;x++){
   5108 1C            [ 4] 1288 	inc	e
   5109 7B            [ 4] 1289 	ld	a,e
   510A D6 14         [ 7] 1290 	sub	a, #0x14
   510C 38 E6         [12] 1291 	jr	C,00128$
                           1292 ;src/draws.h:70: break;
   510E C3 B9 51      [10] 1293 	jp	00136$
                           1294 ;src/draws.h:71: case 4:
   5111                    1295 00111$:
                           1296 ;src/draws.h:72: for(y=height-1;y!=0;y--){
   5111 DD 36 F4 00   [19] 1297 	ld	-12 (ix),#0x00
   5115 DD 36 F3 0B   [19] 1298 	ld	-13 (ix),#0x0B
   5119 01 00 00      [10] 1299 	ld	bc,#0x0000
   511C 11 DC 00      [10] 1300 	ld	de,#0x00DC
                           1301 ;src/draws.h:73: for(x=0;x<width;x++){
   511F                    1302 00154$:
   511F 21 E0 8F      [10] 1303 	ld	hl,#_scene
   5122 09            [11] 1304 	add	hl,bc
   5123 DD 75 F6      [19] 1305 	ld	-10 (ix),l
   5126 DD 74 F7      [19] 1306 	ld	-9 (ix),h
   5129 21 51 4C      [10] 1307 	ld	hl,#_mapa2
   512C 19            [11] 1308 	add	hl,de
   512D DD 75 F8      [19] 1309 	ld	-8 (ix),l
   5130 DD 74 F9      [19] 1310 	ld	-7 (ix),h
   5133 DD 36 F5 00   [19] 1311 	ld	-11 (ix),#0x00
   5137                    1312 00130$:
                           1313 ;src/draws.h:74: scene[aux][x] = mapa2[y][x];
   5137 DD 7E F6      [19] 1314 	ld	a,-10 (ix)
   513A DD 86 F5      [19] 1315 	add	a, -11 (ix)
   513D DD 77 FE      [19] 1316 	ld	-2 (ix),a
   5140 DD 7E F7      [19] 1317 	ld	a,-9 (ix)
   5143 CE 00         [ 7] 1318 	adc	a, #0x00
   5145 DD 77 FF      [19] 1319 	ld	-1 (ix),a
   5148 DD 7E F8      [19] 1320 	ld	a,-8 (ix)
   514B DD 86 F5      [19] 1321 	add	a, -11 (ix)
   514E 6F            [ 4] 1322 	ld	l,a
   514F DD 7E F9      [19] 1323 	ld	a,-7 (ix)
   5152 CE 00         [ 7] 1324 	adc	a, #0x00
   5154 67            [ 4] 1325 	ld	h,a
   5155 7E            [ 7] 1326 	ld	a,(hl)
   5156 DD 6E FE      [19] 1327 	ld	l,-2 (ix)
   5159 DD 66 FF      [19] 1328 	ld	h,-1 (ix)
   515C 77            [ 7] 1329 	ld	(hl),a
                           1330 ;src/draws.h:73: for(x=0;x<width;x++){
   515D DD 34 F5      [23] 1331 	inc	-11 (ix)
   5160 DD 7E F5      [19] 1332 	ld	a,-11 (ix)
   5163 D6 14         [ 7] 1333 	sub	a, #0x14
   5165 38 D0         [12] 1334 	jr	C,00130$
                           1335 ;src/draws.h:76: aux++;
   5167 21 14 00      [10] 1336 	ld	hl,#0x0014
   516A 09            [11] 1337 	add	hl,bc
   516B 4D            [ 4] 1338 	ld	c,l
   516C 44            [ 4] 1339 	ld	b,h
   516D DD 34 F4      [23] 1340 	inc	-12 (ix)
                           1341 ;src/draws.h:72: for(y=height-1;y!=0;y--){
   5170 7B            [ 4] 1342 	ld	a,e
   5171 C6 EC         [ 7] 1343 	add	a,#0xEC
   5173 5F            [ 4] 1344 	ld	e,a
   5174 7A            [ 4] 1345 	ld	a,d
   5175 CE FF         [ 7] 1346 	adc	a,#0xFF
   5177 57            [ 4] 1347 	ld	d,a
   5178 DD 35 F3      [23] 1348 	dec	-13 (ix)
   517B DD 7E F3      [19] 1349 	ld	a,-13 (ix)
   517E B7            [ 4] 1350 	or	a, a
   517F 20 9E         [12] 1351 	jr	NZ,00154$
                           1352 ;src/draws.h:78: for(x=0;x<width;x++){
   5181 DD 4E F4      [19] 1353 	ld	c,-12 (ix)
   5184 06 00         [ 7] 1354 	ld	b,#0x00
   5186 69            [ 4] 1355 	ld	l, c
   5187 60            [ 4] 1356 	ld	h, b
   5188 29            [11] 1357 	add	hl, hl
   5189 29            [11] 1358 	add	hl, hl
   518A 09            [11] 1359 	add	hl, bc
   518B 29            [11] 1360 	add	hl, hl
   518C 29            [11] 1361 	add	hl, hl
   518D 3E E0         [ 7] 1362 	ld	a,#<(_scene)
   518F 85            [ 4] 1363 	add	a, l
   5190 5F            [ 4] 1364 	ld	e,a
   5191 3E 8F         [ 7] 1365 	ld	a,#>(_scene)
   5193 8C            [ 4] 1366 	adc	a, h
   5194 57            [ 4] 1367 	ld	d,a
   5195 DD 36 F5 00   [19] 1368 	ld	-11 (ix),#0x00
   5199                    1369 00134$:
                           1370 ;src/draws.h:79: scene[aux][x] = mapa2[0][x];
   5199 7B            [ 4] 1371 	ld	a,e
   519A DD 86 F5      [19] 1372 	add	a, -11 (ix)
   519D 4F            [ 4] 1373 	ld	c,a
   519E 7A            [ 4] 1374 	ld	a,d
   519F CE 00         [ 7] 1375 	adc	a, #0x00
   51A1 47            [ 4] 1376 	ld	b,a
   51A2 3E 51         [ 7] 1377 	ld	a,#<(_mapa2)
   51A4 DD 86 F5      [19] 1378 	add	a, -11 (ix)
   51A7 6F            [ 4] 1379 	ld	l,a
   51A8 3E 4C         [ 7] 1380 	ld	a,#>(_mapa2)
   51AA CE 00         [ 7] 1381 	adc	a, #0x00
   51AC 67            [ 4] 1382 	ld	h,a
   51AD 7E            [ 7] 1383 	ld	a,(hl)
   51AE 02            [ 7] 1384 	ld	(bc),a
                           1385 ;src/draws.h:78: for(x=0;x<width;x++){
   51AF DD 34 F5      [23] 1386 	inc	-11 (ix)
   51B2 DD 7E F5      [19] 1387 	ld	a,-11 (ix)
   51B5 D6 14         [ 7] 1388 	sub	a, #0x14
   51B7 38 E0         [12] 1389 	jr	C,00134$
                           1390 ;src/draws.h:82: }
   51B9                    1391 00136$:
   51B9 DD F9         [10] 1392 	ld	sp, ix
   51BB DD E1         [14] 1393 	pop	ix
   51BD C9            [10] 1394 	ret
                           1395 ;src/draws.h:85: void drawMap(u8 t){
                           1396 ;	---------------------------------
                           1397 ; Function drawMap
                           1398 ; ---------------------------------
   51BE                    1399 _drawMap::
   51BE DD E5         [15] 1400 	push	ix
   51C0 DD 21 00 00   [14] 1401 	ld	ix,#0
   51C4 DD 39         [15] 1402 	add	ix,sp
   51C6 21 F7 FF      [10] 1403 	ld	hl,#-9
   51C9 39            [11] 1404 	add	hl,sp
   51CA F9            [ 6] 1405 	ld	sp,hl
                           1406 ;src/draws.h:87: u8 aux = 0;
   51CB 0E 00         [ 7] 1407 	ld	c,#0x00
                           1408 ;src/draws.h:90: mapSelector(t);
   51CD C5            [11] 1409 	push	bc
   51CE DD 7E 04      [19] 1410 	ld	a,4 (ix)
   51D1 F5            [11] 1411 	push	af
   51D2 33            [ 6] 1412 	inc	sp
   51D3 CD 27 4F      [17] 1413 	call	_mapSelector
   51D6 33            [ 6] 1414 	inc	sp
   51D7 C1            [10] 1415 	pop	bc
                           1416 ;src/draws.h:92: for(posY=0; posY<height;posY++){
   51D8 DD 36 F7 00   [19] 1417 	ld	-9 (ix),#0x00
   51DC DD 36 FC 00   [19] 1418 	ld	-4 (ix),#0x00
   51E0 DD 36 FD 00   [19] 1419 	ld	-3 (ix),#0x00
   51E4 11 00 00      [10] 1420 	ld	de,#0x0000
                           1421 ;src/draws.h:93: for(posX=0; posX<width;posX++){
   51E7                    1422 00119$:
   51E7 DD 7E F7      [19] 1423 	ld	a,-9 (ix)
   51EA 07            [ 4] 1424 	rlca
   51EB 07            [ 4] 1425 	rlca
   51EC 07            [ 4] 1426 	rlca
   51ED 07            [ 4] 1427 	rlca
   51EE E6 F0         [ 7] 1428 	and	a,#0xF0
   51F0 DD 77 FE      [19] 1429 	ld	-2 (ix),a
   51F3 21 E0 8F      [10] 1430 	ld	hl,#_scene
   51F6 19            [11] 1431 	add	hl,de
   51F7 DD 75 F8      [19] 1432 	ld	-8 (ix),l
   51FA DD 74 F9      [19] 1433 	ld	-7 (ix),h
   51FD 06 00         [ 7] 1434 	ld	b,#0x00
   51FF                    1435 00110$:
                           1436 ;src/draws.h:94: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   51FF 78            [ 4] 1437 	ld	a,b
   5200 87            [ 4] 1438 	add	a, a
   5201 87            [ 4] 1439 	add	a, a
   5202 DD 77 FF      [19] 1440 	ld	-1 (ix),a
   5205 C5            [11] 1441 	push	bc
   5206 D5            [11] 1442 	push	de
   5207 DD 66 FE      [19] 1443 	ld	h,-2 (ix)
   520A DD 6E FF      [19] 1444 	ld	l,-1 (ix)
   520D E5            [11] 1445 	push	hl
   520E 21 00 C0      [10] 1446 	ld	hl,#0xC000
   5211 E5            [11] 1447 	push	hl
   5212 CD EA 8E      [17] 1448 	call	_cpct_getScreenPtr
   5215 D1            [10] 1449 	pop	de
   5216 C1            [10] 1450 	pop	bc
   5217 E5            [11] 1451 	push	hl
   5218 FD E1         [14] 1452 	pop	iy
                           1453 ;src/draws.h:95: if(scene[posY][posX] == 1){
   521A DD 7E F8      [19] 1454 	ld	a,-8 (ix)
   521D 80            [ 4] 1455 	add	a, b
   521E 6F            [ 4] 1456 	ld	l,a
   521F DD 7E F9      [19] 1457 	ld	a,-7 (ix)
   5222 CE 00         [ 7] 1458 	adc	a, #0x00
   5224 67            [ 4] 1459 	ld	h,a
   5225 66            [ 7] 1460 	ld	h,(hl)
                           1461 ;src/draws.h:96: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   5226 FD E5         [15] 1462 	push	iy
   5228 F1            [10] 1463 	pop	af
   5229 DD 77 FB      [19] 1464 	ld	-5 (ix),a
   522C FD E5         [15] 1465 	push	iy
   522E 3B            [ 6] 1466 	dec	sp
   522F F1            [10] 1467 	pop	af
   5230 33            [ 6] 1468 	inc	sp
   5231 DD 77 FA      [19] 1469 	ld	-6 (ix),a
                           1470 ;src/draws.h:95: if(scene[posY][posX] == 1){
   5234 25            [ 4] 1471 	dec	h
   5235 20 16         [12] 1472 	jr	NZ,00102$
                           1473 ;src/draws.h:96: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   5237 C5            [11] 1474 	push	bc
   5238 D5            [11] 1475 	push	de
   5239 21 04 10      [10] 1476 	ld	hl,#0x1004
   523C E5            [11] 1477 	push	hl
   523D DD 6E FA      [19] 1478 	ld	l,-6 (ix)
   5240 DD 66 FB      [19] 1479 	ld	h,-5 (ix)
   5243 E5            [11] 1480 	push	hl
   5244 21 88 75      [10] 1481 	ld	hl,#_muro
   5247 E5            [11] 1482 	push	hl
   5248 CD 2D 8C      [17] 1483 	call	_cpct_drawSprite
   524B D1            [10] 1484 	pop	de
   524C C1            [10] 1485 	pop	bc
   524D                    1486 00102$:
                           1487 ;src/draws.h:98: if(scene[posY][posX] == 9){
   524D 3E E0         [ 7] 1488 	ld	a,#<(_scene)
   524F DD 86 FC      [19] 1489 	add	a, -4 (ix)
   5252 6F            [ 4] 1490 	ld	l,a
   5253 3E 8F         [ 7] 1491 	ld	a,#>(_scene)
   5255 DD 8E FD      [19] 1492 	adc	a, -3 (ix)
   5258 67            [ 4] 1493 	ld	h,a
   5259 7D            [ 4] 1494 	ld	a,l
   525A 80            [ 4] 1495 	add	a, b
   525B 6F            [ 4] 1496 	ld	l,a
   525C 7C            [ 4] 1497 	ld	a,h
   525D CE 00         [ 7] 1498 	adc	a, #0x00
   525F 67            [ 4] 1499 	ld	h,a
   5260 7E            [ 7] 1500 	ld	a,(hl)
                           1501 ;src/draws.h:99: if(aux == 0){
   5261 D6 09         [ 7] 1502 	sub	a,#0x09
   5263 20 32         [12] 1503 	jr	NZ,00111$
   5265 B1            [ 4] 1504 	or	a,c
   5266 20 19         [12] 1505 	jr	NZ,00104$
                           1506 ;src/draws.h:100: cpct_drawSprite(g_tile_puerta_0,memptr,tilewidth, tileheight);
   5268 C5            [11] 1507 	push	bc
   5269 D5            [11] 1508 	push	de
   526A 21 04 10      [10] 1509 	ld	hl,#0x1004
   526D E5            [11] 1510 	push	hl
   526E DD 6E FA      [19] 1511 	ld	l,-6 (ix)
   5271 DD 66 FB      [19] 1512 	ld	h,-5 (ix)
   5274 E5            [11] 1513 	push	hl
   5275 21 00 44      [10] 1514 	ld	hl,#_g_tile_puerta_0
   5278 E5            [11] 1515 	push	hl
   5279 CD 2D 8C      [17] 1516 	call	_cpct_drawSprite
   527C D1            [10] 1517 	pop	de
   527D C1            [10] 1518 	pop	bc
                           1519 ;src/draws.h:101: aux += 1;
   527E 0C            [ 4] 1520 	inc	c
   527F 18 16         [12] 1521 	jr	00111$
   5281                    1522 00104$:
                           1523 ;src/draws.h:103: else cpct_drawSprite(g_tile_puerta_1,memptr,tilewidth, tileheight);
   5281 C5            [11] 1524 	push	bc
   5282 D5            [11] 1525 	push	de
   5283 21 04 10      [10] 1526 	ld	hl,#0x1004
   5286 E5            [11] 1527 	push	hl
   5287 DD 6E FA      [19] 1528 	ld	l,-6 (ix)
   528A DD 66 FB      [19] 1529 	ld	h,-5 (ix)
   528D E5            [11] 1530 	push	hl
   528E 21 40 44      [10] 1531 	ld	hl,#_g_tile_puerta_1
   5291 E5            [11] 1532 	push	hl
   5292 CD 2D 8C      [17] 1533 	call	_cpct_drawSprite
   5295 D1            [10] 1534 	pop	de
   5296 C1            [10] 1535 	pop	bc
   5297                    1536 00111$:
                           1537 ;src/draws.h:93: for(posX=0; posX<width;posX++){
   5297 04            [ 4] 1538 	inc	b
   5298 78            [ 4] 1539 	ld	a,b
   5299 D6 14         [ 7] 1540 	sub	a, #0x14
   529B DA FF 51      [10] 1541 	jp	C,00110$
                           1542 ;src/draws.h:92: for(posY=0; posY<height;posY++){
   529E DD 7E FC      [19] 1543 	ld	a,-4 (ix)
   52A1 C6 14         [ 7] 1544 	add	a, #0x14
   52A3 DD 77 FC      [19] 1545 	ld	-4 (ix),a
   52A6 DD 7E FD      [19] 1546 	ld	a,-3 (ix)
   52A9 CE 00         [ 7] 1547 	adc	a, #0x00
   52AB DD 77 FD      [19] 1548 	ld	-3 (ix),a
   52AE 21 14 00      [10] 1549 	ld	hl,#0x0014
   52B1 19            [11] 1550 	add	hl,de
   52B2 EB            [ 4] 1551 	ex	de,hl
   52B3 DD 34 F7      [23] 1552 	inc	-9 (ix)
   52B6 DD 7E F7      [19] 1553 	ld	a,-9 (ix)
   52B9 D6 0C         [ 7] 1554 	sub	a, #0x0C
   52BB DA E7 51      [10] 1555 	jp	C,00119$
   52BE DD F9         [10] 1556 	ld	sp, ix
   52C0 DD E1         [14] 1557 	pop	ix
   52C2 C9            [10] 1558 	ret
                           1559 ;src/draws.h:110: void drawVida(u8 life,u8 pos,u8 lim){
                           1560 ;	---------------------------------
                           1561 ; Function drawVida
                           1562 ; ---------------------------------
   52C3                    1563 _drawVida::
   52C3 DD E5         [15] 1564 	push	ix
   52C5 DD 21 00 00   [14] 1565 	ld	ix,#0
   52C9 DD 39         [15] 1566 	add	ix,sp
                           1567 ;src/draws.h:113: u8 p = pos;
   52CB DD 56 05      [19] 1568 	ld	d,5 (ix)
                           1569 ;src/draws.h:115: for(i=1;i<=5;i++){
   52CE 1E 01         [ 7] 1570 	ld	e,#0x01
   52D0                    1571 00107$:
                           1572 ;src/draws.h:116: memptr = cpct_getScreenPtr(VMEM,p,192);
   52D0 D5            [11] 1573 	push	de
   52D1 3E C0         [ 7] 1574 	ld	a,#0xC0
   52D3 F5            [11] 1575 	push	af
   52D4 33            [ 6] 1576 	inc	sp
   52D5 D5            [11] 1577 	push	de
   52D6 33            [ 6] 1578 	inc	sp
   52D7 21 00 C0      [10] 1579 	ld	hl,#0xC000
   52DA E5            [11] 1580 	push	hl
   52DB CD EA 8E      [17] 1581 	call	_cpct_getScreenPtr
   52DE D1            [10] 1582 	pop	de
                           1583 ;src/draws.h:117: p+=5;
   52DF 7A            [ 4] 1584 	ld	a,d
   52E0 C6 05         [ 7] 1585 	add	a, #0x05
   52E2 57            [ 4] 1586 	ld	d,a
                           1587 ;src/draws.h:118: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   52E3 4D            [ 4] 1588 	ld	c, l
   52E4 44            [ 4] 1589 	ld	b, h
   52E5 DD 7E 04      [19] 1590 	ld	a,4 (ix)
   52E8 93            [ 4] 1591 	sub	a, e
   52E9 38 10         [12] 1592 	jr	C,00104$
   52EB D5            [11] 1593 	push	de
   52EC 21 04 08      [10] 1594 	ld	hl,#0x0804
   52EF E5            [11] 1595 	push	hl
   52F0 C5            [11] 1596 	push	bc
   52F1 21 48 4A      [10] 1597 	ld	hl,#_corazon_lleno
   52F4 E5            [11] 1598 	push	hl
   52F5 CD 93 8D      [17] 1599 	call	_cpct_drawSpriteMasked
   52F8 D1            [10] 1600 	pop	de
   52F9 18 26         [12] 1601 	jr	00108$
   52FB                    1602 00104$:
                           1603 ;src/draws.h:120: if(i<=lim){
   52FB DD 7E 06      [19] 1604 	ld	a,6 (ix)
   52FE 93            [ 4] 1605 	sub	a, e
   52FF 38 20         [12] 1606 	jr	C,00108$
                           1607 ;src/draws.h:121: cpct_drawSolidBox(memptr,0,4,8);
   5301 C5            [11] 1608 	push	bc
   5302 D5            [11] 1609 	push	de
   5303 21 04 08      [10] 1610 	ld	hl,#0x0804
   5306 E5            [11] 1611 	push	hl
   5307 AF            [ 4] 1612 	xor	a, a
   5308 F5            [11] 1613 	push	af
   5309 33            [ 6] 1614 	inc	sp
   530A C5            [11] 1615 	push	bc
   530B CD 19 8E      [17] 1616 	call	_cpct_drawSolidBox
   530E F1            [10] 1617 	pop	af
   530F F1            [10] 1618 	pop	af
   5310 33            [ 6] 1619 	inc	sp
   5311 D1            [10] 1620 	pop	de
   5312 C1            [10] 1621 	pop	bc
                           1622 ;src/draws.h:122: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   5313 D5            [11] 1623 	push	de
   5314 21 04 08      [10] 1624 	ld	hl,#0x0804
   5317 E5            [11] 1625 	push	hl
   5318 C5            [11] 1626 	push	bc
   5319 21 88 4A      [10] 1627 	ld	hl,#_corazon_roto
   531C E5            [11] 1628 	push	hl
   531D CD 93 8D      [17] 1629 	call	_cpct_drawSpriteMasked
   5320 D1            [10] 1630 	pop	de
   5321                    1631 00108$:
                           1632 ;src/draws.h:115: for(i=1;i<=5;i++){
   5321 1C            [ 4] 1633 	inc	e
   5322 3E 05         [ 7] 1634 	ld	a,#0x05
   5324 93            [ 4] 1635 	sub	a, e
   5325 30 A9         [12] 1636 	jr	NC,00107$
   5327 DD E1         [14] 1637 	pop	ix
   5329 C9            [10] 1638 	ret
                           1639 ;src/draws.h:129: void drawBullets(u8 bullet,u8 pos){
                           1640 ;	---------------------------------
                           1641 ; Function drawBullets
                           1642 ; ---------------------------------
   532A                    1643 _drawBullets::
   532A DD E5         [15] 1644 	push	ix
   532C DD 21 00 00   [14] 1645 	ld	ix,#0
   5330 DD 39         [15] 1646 	add	ix,sp
   5332 3B            [ 6] 1647 	dec	sp
                           1648 ;src/draws.h:131: int p = pos;
   5333 DD 4E 05      [19] 1649 	ld	c,5 (ix)
   5336 06 00         [ 7] 1650 	ld	b,#0x00
                           1651 ;src/draws.h:133: for(i=1;i<=3;i++){
   5338 DD 36 FF 01   [19] 1652 	ld	-1 (ix),#0x01
   533C                    1653 00105$:
                           1654 ;src/draws.h:134: memptr = cpct_getScreenPtr(VMEM,p,192);
   533C 51            [ 4] 1655 	ld	d,c
   533D C5            [11] 1656 	push	bc
   533E 3E C0         [ 7] 1657 	ld	a,#0xC0
   5340 F5            [11] 1658 	push	af
   5341 33            [ 6] 1659 	inc	sp
   5342 D5            [11] 1660 	push	de
   5343 33            [ 6] 1661 	inc	sp
   5344 21 00 C0      [10] 1662 	ld	hl,#0xC000
   5347 E5            [11] 1663 	push	hl
   5348 CD EA 8E      [17] 1664 	call	_cpct_getScreenPtr
   534B C1            [10] 1665 	pop	bc
                           1666 ;src/draws.h:135: p+=3;
   534C 03            [ 6] 1667 	inc	bc
   534D 03            [ 6] 1668 	inc	bc
   534E 03            [ 6] 1669 	inc	bc
                           1670 ;src/draws.h:136: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   534F EB            [ 4] 1671 	ex	de,hl
   5350 DD 7E 04      [19] 1672 	ld	a,4 (ix)
   5353 DD 96 FF      [19] 1673 	sub	a, -1 (ix)
   5356 38 10         [12] 1674 	jr	C,00102$
   5358 C5            [11] 1675 	push	bc
   5359 21 02 08      [10] 1676 	ld	hl,#0x0802
   535C E5            [11] 1677 	push	hl
   535D D5            [11] 1678 	push	de
   535E 21 C8 75      [10] 1679 	ld	hl,#_flecha_arriba
   5361 E5            [11] 1680 	push	hl
   5362 CD 93 8D      [17] 1681 	call	_cpct_drawSpriteMasked
   5365 C1            [10] 1682 	pop	bc
   5366 18 10         [12] 1683 	jr	00106$
   5368                    1684 00102$:
                           1685 ;src/draws.h:137: else  cpct_drawSolidBox(memptr,0,2,8);
   5368 C5            [11] 1686 	push	bc
   5369 21 02 08      [10] 1687 	ld	hl,#0x0802
   536C E5            [11] 1688 	push	hl
   536D AF            [ 4] 1689 	xor	a, a
   536E F5            [11] 1690 	push	af
   536F 33            [ 6] 1691 	inc	sp
   5370 D5            [11] 1692 	push	de
   5371 CD 19 8E      [17] 1693 	call	_cpct_drawSolidBox
   5374 F1            [10] 1694 	pop	af
   5375 F1            [10] 1695 	pop	af
   5376 33            [ 6] 1696 	inc	sp
   5377 C1            [10] 1697 	pop	bc
   5378                    1698 00106$:
                           1699 ;src/draws.h:133: for(i=1;i<=3;i++){
   5378 DD 34 FF      [23] 1700 	inc	-1 (ix)
   537B 3E 03         [ 7] 1701 	ld	a,#0x03
   537D DD 96 FF      [19] 1702 	sub	a, -1 (ix)
   5380 30 BA         [12] 1703 	jr	NC,00105$
   5382 33            [ 6] 1704 	inc	sp
   5383 DD E1         [14] 1705 	pop	ix
   5385 C9            [10] 1706 	ret
                           1707 ;src/draws.h:145: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1708 ;	---------------------------------
                           1709 ; Function draw
                           1710 ; ---------------------------------
   5386                    1711 _draw::
                           1712 ;src/draws.h:147: memptr = cpct_getScreenPtr(VMEM,x,y);
   5386 21 03 00      [10] 1713 	ld	hl, #3+0
   5389 39            [11] 1714 	add	hl, sp
   538A 7E            [ 7] 1715 	ld	a, (hl)
   538B F5            [11] 1716 	push	af
   538C 33            [ 6] 1717 	inc	sp
   538D 21 03 00      [10] 1718 	ld	hl, #3+0
   5390 39            [11] 1719 	add	hl, sp
   5391 7E            [ 7] 1720 	ld	a, (hl)
   5392 F5            [11] 1721 	push	af
   5393 33            [ 6] 1722 	inc	sp
   5394 21 00 C0      [10] 1723 	ld	hl,#0xC000
   5397 E5            [11] 1724 	push	hl
   5398 CD EA 8E      [17] 1725 	call	_cpct_getScreenPtr
   539B EB            [ 4] 1726 	ex	de,hl
                           1727 ;src/draws.h:148: switch(mode){
   539C 3E 02         [ 7] 1728 	ld	a,#0x02
   539E FD 21 06 00   [14] 1729 	ld	iy,#6
   53A2 FD 39         [15] 1730 	add	iy,sp
   53A4 FD 96 00      [19] 1731 	sub	a, 0 (iy)
   53A7 D8            [11] 1732 	ret	C
                           1733 ;src/draws.h:150: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   53A8 21 04 00      [10] 1734 	ld	hl, #4
   53AB 39            [11] 1735 	add	hl, sp
   53AC 4E            [ 7] 1736 	ld	c, (hl)
   53AD 23            [ 6] 1737 	inc	hl
   53AE 46            [ 7] 1738 	ld	b, (hl)
                           1739 ;src/draws.h:148: switch(mode){
   53AF D5            [11] 1740 	push	de
   53B0 FD 21 08 00   [14] 1741 	ld	iy,#8
   53B4 FD 39         [15] 1742 	add	iy,sp
   53B6 FD 5E 00      [19] 1743 	ld	e,0 (iy)
   53B9 16 00         [ 7] 1744 	ld	d,#0x00
   53BB 21 C2 53      [10] 1745 	ld	hl,#00111$
   53BE 19            [11] 1746 	add	hl,de
   53BF 19            [11] 1747 	add	hl,de
                           1748 ;src/draws.h:149: case 0:
   53C0 D1            [10] 1749 	pop	de
   53C1 E9            [ 4] 1750 	jp	(hl)
   53C2                    1751 00111$:
   53C2 18 04         [12] 1752 	jr	00101$
   53C4 18 0C         [12] 1753 	jr	00102$
   53C6 18 14         [12] 1754 	jr	00103$
   53C8                    1755 00101$:
                           1756 ;src/draws.h:150: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   53C8 21 04 10      [10] 1757 	ld	hl,#0x1004
   53CB E5            [11] 1758 	push	hl
   53CC D5            [11] 1759 	push	de
   53CD C5            [11] 1760 	push	bc
   53CE CD 93 8D      [17] 1761 	call	_cpct_drawSpriteMasked
                           1762 ;src/draws.h:151: break;
   53D1 C9            [10] 1763 	ret
                           1764 ;src/draws.h:152: case 1:
   53D2                    1765 00102$:
                           1766 ;src/draws.h:153: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   53D2 21 02 08      [10] 1767 	ld	hl,#0x0802
   53D5 E5            [11] 1768 	push	hl
   53D6 D5            [11] 1769 	push	de
   53D7 C5            [11] 1770 	push	bc
   53D8 CD 93 8D      [17] 1771 	call	_cpct_drawSpriteMasked
                           1772 ;src/draws.h:154: break;
   53DB C9            [10] 1773 	ret
                           1774 ;src/draws.h:155: case 2:
   53DC                    1775 00103$:
                           1776 ;src/draws.h:156: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   53DC 21 04 04      [10] 1777 	ld	hl,#0x0404
   53DF E5            [11] 1778 	push	hl
   53E0 D5            [11] 1779 	push	de
   53E1 C5            [11] 1780 	push	bc
   53E2 CD 93 8D      [17] 1781 	call	_cpct_drawSpriteMasked
                           1782 ;src/draws.h:158: }
   53E5 C9            [10] 1783 	ret
                           1784 ;src/draws.h:162: void erase(u8 x,u8 y,u8 mode){
                           1785 ;	---------------------------------
                           1786 ; Function erase
                           1787 ; ---------------------------------
   53E6                    1788 _erase::
                           1789 ;src/draws.h:165: memptr = cpct_getScreenPtr(VMEM,x,y);
   53E6 21 03 00      [10] 1790 	ld	hl, #3+0
   53E9 39            [11] 1791 	add	hl, sp
   53EA 7E            [ 7] 1792 	ld	a, (hl)
   53EB F5            [11] 1793 	push	af
   53EC 33            [ 6] 1794 	inc	sp
   53ED 21 03 00      [10] 1795 	ld	hl, #3+0
   53F0 39            [11] 1796 	add	hl, sp
   53F1 7E            [ 7] 1797 	ld	a, (hl)
   53F2 F5            [11] 1798 	push	af
   53F3 33            [ 6] 1799 	inc	sp
   53F4 21 00 C0      [10] 1800 	ld	hl,#0xC000
   53F7 E5            [11] 1801 	push	hl
   53F8 CD EA 8E      [17] 1802 	call	_cpct_getScreenPtr
   53FB 4D            [ 4] 1803 	ld	c, l
   53FC 44            [ 4] 1804 	ld	b, h
                           1805 ;src/draws.h:166: switch(mode){
   53FD 3E 02         [ 7] 1806 	ld	a,#0x02
   53FF FD 21 04 00   [14] 1807 	ld	iy,#4
   5403 FD 39         [15] 1808 	add	iy,sp
   5405 FD 96 00      [19] 1809 	sub	a, 0 (iy)
   5408 D8            [11] 1810 	ret	C
                           1811 ;src/draws.h:168: cpct_drawSolidBox(memptr,0,4,16);
                           1812 ;src/draws.h:166: switch(mode){
   5409 FD 5E 00      [19] 1813 	ld	e,0 (iy)
   540C 16 00         [ 7] 1814 	ld	d,#0x00
   540E 21 14 54      [10] 1815 	ld	hl,#00111$
   5411 19            [11] 1816 	add	hl,de
   5412 19            [11] 1817 	add	hl,de
                           1818 ;src/draws.h:167: case 0:
   5413 E9            [ 4] 1819 	jp	(hl)
   5414                    1820 00111$:
   5414 18 04         [12] 1821 	jr	00101$
   5416 18 11         [12] 1822 	jr	00102$
   5418 18 1E         [12] 1823 	jr	00103$
   541A                    1824 00101$:
                           1825 ;src/draws.h:168: cpct_drawSolidBox(memptr,0,4,16);
   541A 21 04 10      [10] 1826 	ld	hl,#0x1004
   541D E5            [11] 1827 	push	hl
   541E AF            [ 4] 1828 	xor	a, a
   541F F5            [11] 1829 	push	af
   5420 33            [ 6] 1830 	inc	sp
   5421 C5            [11] 1831 	push	bc
   5422 CD 19 8E      [17] 1832 	call	_cpct_drawSolidBox
   5425 F1            [10] 1833 	pop	af
   5426 F1            [10] 1834 	pop	af
   5427 33            [ 6] 1835 	inc	sp
                           1836 ;src/draws.h:169: break;
   5428 C9            [10] 1837 	ret
                           1838 ;src/draws.h:170: case 1:
   5429                    1839 00102$:
                           1840 ;src/draws.h:171: cpct_drawSolidBox(memptr,0,2,8);
   5429 21 02 08      [10] 1841 	ld	hl,#0x0802
   542C E5            [11] 1842 	push	hl
   542D AF            [ 4] 1843 	xor	a, a
   542E F5            [11] 1844 	push	af
   542F 33            [ 6] 1845 	inc	sp
   5430 C5            [11] 1846 	push	bc
   5431 CD 19 8E      [17] 1847 	call	_cpct_drawSolidBox
   5434 F1            [10] 1848 	pop	af
   5435 F1            [10] 1849 	pop	af
   5436 33            [ 6] 1850 	inc	sp
                           1851 ;src/draws.h:172: break;
   5437 C9            [10] 1852 	ret
                           1853 ;src/draws.h:173: case 2:
   5438                    1854 00103$:
                           1855 ;src/draws.h:174: cpct_drawSolidBox(memptr,0,4,4);
   5438 21 04 04      [10] 1856 	ld	hl,#0x0404
   543B E5            [11] 1857 	push	hl
   543C AF            [ 4] 1858 	xor	a, a
   543D F5            [11] 1859 	push	af
   543E 33            [ 6] 1860 	inc	sp
   543F C5            [11] 1861 	push	bc
   5440 CD 19 8E      [17] 1862 	call	_cpct_drawSolidBox
   5443 F1            [10] 1863 	pop	af
   5444 F1            [10] 1864 	pop	af
   5445 33            [ 6] 1865 	inc	sp
                           1866 ;src/draws.h:176: }
   5446 C9            [10] 1867 	ret
                           1868 ;src/draws.h:179: void drawStats(){
                           1869 ;	---------------------------------
                           1870 ; Function drawStats
                           1871 ; ---------------------------------
   5447                    1872 _drawStats::
                           1873 ;src/draws.h:180: drawVida(player.life,1,3);
   5447 21 EC 90      [10] 1874 	ld	hl, #_player + 6
   544A 56            [ 7] 1875 	ld	d,(hl)
   544B 21 01 03      [10] 1876 	ld	hl,#0x0301
   544E E5            [11] 1877 	push	hl
   544F D5            [11] 1878 	push	de
   5450 33            [ 6] 1879 	inc	sp
   5451 CD C3 52      [17] 1880 	call	_drawVida
   5454 F1            [10] 1881 	pop	af
   5455 33            [ 6] 1882 	inc	sp
                           1883 ;src/draws.h:181: drawBullets(player.bullets,16);
   5456 21 F0 90      [10] 1884 	ld	hl, #_player + 10
   5459 56            [ 7] 1885 	ld	d,(hl)
   545A 3E 10         [ 7] 1886 	ld	a,#0x10
   545C F5            [11] 1887 	push	af
   545D 33            [ 6] 1888 	inc	sp
   545E D5            [11] 1889 	push	de
   545F 33            [ 6] 1890 	inc	sp
   5460 CD 2A 53      [17] 1891 	call	_drawBullets
   5463 F1            [10] 1892 	pop	af
                           1893 ;src/draws.h:182: drawVida(enemy.life,enemy.lp,map);
   5464 21 FF 90      [10] 1894 	ld	hl, #_enemy + 14
   5467 56            [ 7] 1895 	ld	d,(hl)
   5468 21 F9 90      [10] 1896 	ld	hl, #_enemy + 8
   546B 46            [ 7] 1897 	ld	b,(hl)
   546C 3A D1 90      [13] 1898 	ld	a,(_map)
   546F F5            [11] 1899 	push	af
   5470 33            [ 6] 1900 	inc	sp
   5471 D5            [11] 1901 	push	de
   5472 33            [ 6] 1902 	inc	sp
   5473 C5            [11] 1903 	push	bc
   5474 33            [ 6] 1904 	inc	sp
   5475 CD C3 52      [17] 1905 	call	_drawVida
   5478 F1            [10] 1906 	pop	af
   5479 33            [ 6] 1907 	inc	sp
   547A C9            [10] 1908 	ret
                           1909 ;src/draws.h:187: void draws(){
                           1910 ;	---------------------------------
                           1911 ; Function draws
                           1912 ; ---------------------------------
   547B                    1913 _draws::
   547B DD E5         [15] 1914 	push	ix
   547D DD 21 00 00   [14] 1915 	ld	ix,#0
   5481 DD 39         [15] 1916 	add	ix,sp
   5483 3B            [ 6] 1917 	dec	sp
                           1918 ;src/draws.h:189: if(temp%2 == 0)
   5484 FD 21 D0 90   [14] 1919 	ld	iy,#_temp
   5488 FD CB 00 46   [20] 1920 	bit	0, 0 (iy)
   548C 20 17         [12] 1921 	jr	NZ,00102$
                           1922 ;src/draws.h:190: draw(player.x,player.y,player.sprite,0);
   548E ED 5B EA 90   [20] 1923 	ld	de, (#_player + 4)
   5492 21 E7 90      [10] 1924 	ld	hl, #_player + 1
   5495 46            [ 7] 1925 	ld	b,(hl)
   5496 21 E6 90      [10] 1926 	ld	hl, #_player + 0
   5499 4E            [ 7] 1927 	ld	c,(hl)
   549A AF            [ 4] 1928 	xor	a, a
   549B F5            [11] 1929 	push	af
   549C 33            [ 6] 1930 	inc	sp
   549D D5            [11] 1931 	push	de
   549E C5            [11] 1932 	push	bc
   549F CD 86 53      [17] 1933 	call	_draw
   54A2 F1            [10] 1934 	pop	af
   54A3 F1            [10] 1935 	pop	af
   54A4 33            [ 6] 1936 	inc	sp
   54A5                    1937 00102$:
                           1938 ;src/draws.h:191: if(enemy.life > 0 && temp%2 == 1)
   54A5 11 F1 90      [10] 1939 	ld	de,#_enemy+0
   54A8 3A F9 90      [13] 1940 	ld	a, (#_enemy + 8)
   54AB B7            [ 4] 1941 	or	a, a
   54AC 28 23         [12] 1942 	jr	Z,00104$
   54AE 3A D0 90      [13] 1943 	ld	a,(#_temp + 0)
   54B1 E6 01         [ 7] 1944 	and	a, #0x01
   54B3 3D            [ 4] 1945 	dec	a
   54B4 20 1B         [12] 1946 	jr	NZ,00104$
                           1947 ;src/draws.h:192: draw(enemy.x,enemy.y,enemy.sprite,0);
   54B6 ED 4B F7 90   [20] 1948 	ld	bc, (#_enemy + 6)
   54BA 6B            [ 4] 1949 	ld	l, e
   54BB 62            [ 4] 1950 	ld	h, d
   54BC 23            [ 6] 1951 	inc	hl
   54BD 7E            [ 7] 1952 	ld	a,(hl)
   54BE DD 77 FF      [19] 1953 	ld	-1 (ix),a
   54C1 1A            [ 7] 1954 	ld	a,(de)
   54C2 5F            [ 4] 1955 	ld	e,a
   54C3 AF            [ 4] 1956 	xor	a, a
   54C4 F5            [11] 1957 	push	af
   54C5 33            [ 6] 1958 	inc	sp
   54C6 C5            [11] 1959 	push	bc
   54C7 DD 56 FF      [19] 1960 	ld	d, -1 (ix)
   54CA D5            [11] 1961 	push	de
   54CB CD 86 53      [17] 1962 	call	_draw
   54CE F1            [10] 1963 	pop	af
   54CF F1            [10] 1964 	pop	af
   54D0 33            [ 6] 1965 	inc	sp
   54D1                    1966 00104$:
                           1967 ;src/draws.h:193: if(arrow == 1){
   54D1 3A D4 90      [13] 1968 	ld	a,(#_arrow + 0)
   54D4 3D            [ 4] 1969 	dec	a
   54D5 20 5C         [12] 1970 	jr	NZ,00116$
                           1971 ;src/draws.h:194: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   54D7 21 E3 90      [10] 1972 	ld	hl, #_object + 7
   54DA 5E            [ 7] 1973 	ld	e,(hl)
                           1974 ;src/draws.h:195: draw(object.x,object.y,object.sprite,2);
   54DB 01 DD 90      [10] 1975 	ld	bc,#_object + 1
                           1976 ;src/draws.h:194: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   54DE 7B            [ 4] 1977 	ld	a,e
   54DF D6 04         [ 7] 1978 	sub	a, #0x04
   54E1 28 0C         [12] 1979 	jr	Z,00110$
   54E3 21 E2 90      [10] 1980 	ld	hl,#_object + 6
   54E6 7B            [ 4] 1981 	ld	a,e
   54E7 D6 06         [ 7] 1982 	sub	a, #0x06
   54E9 20 25         [12] 1983 	jr	NZ,00111$
   54EB 7E            [ 7] 1984 	ld	a,(hl)
   54EC 3D            [ 4] 1985 	dec	a
   54ED 20 21         [12] 1986 	jr	NZ,00111$
   54EF                    1987 00110$:
                           1988 ;src/draws.h:195: draw(object.x,object.y,object.sprite,2);
   54EF ED 5B E0 90   [20] 1989 	ld	de, (#(_object + 0x0004) + 0)
   54F3 0A            [ 7] 1990 	ld	a,(bc)
   54F4 DD 77 FF      [19] 1991 	ld	-1 (ix),a
   54F7 21 DC 90      [10] 1992 	ld	hl, #_object + 0
   54FA 4E            [ 7] 1993 	ld	c,(hl)
   54FB 3E 02         [ 7] 1994 	ld	a,#0x02
   54FD F5            [11] 1995 	push	af
   54FE 33            [ 6] 1996 	inc	sp
   54FF D5            [11] 1997 	push	de
   5500 DD 7E FF      [19] 1998 	ld	a,-1 (ix)
   5503 F5            [11] 1999 	push	af
   5504 33            [ 6] 2000 	inc	sp
   5505 79            [ 4] 2001 	ld	a,c
   5506 F5            [11] 2002 	push	af
   5507 33            [ 6] 2003 	inc	sp
   5508 CD 86 53      [17] 2004 	call	_draw
   550B F1            [10] 2005 	pop	af
   550C F1            [10] 2006 	pop	af
   550D 33            [ 6] 2007 	inc	sp
   550E 18 23         [12] 2008 	jr	00116$
   5510                    2009 00111$:
                           2010 ;src/draws.h:196: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   5510 7B            [ 4] 2011 	ld	a,e
   5511 FE 02         [ 7] 2012 	cp	a,#0x02
   5513 28 08         [12] 2013 	jr	Z,00106$
   5515 D6 08         [ 7] 2014 	sub	a, #0x08
   5517 20 1A         [12] 2015 	jr	NZ,00116$
   5519 7E            [ 7] 2016 	ld	a,(hl)
   551A 3D            [ 4] 2017 	dec	a
   551B 20 16         [12] 2018 	jr	NZ,00116$
   551D                    2019 00106$:
                           2020 ;src/draws.h:197: draw(object.x,object.y,object.sprite,1);
   551D ED 5B E0 90   [20] 2021 	ld	de, (#(_object + 0x0004) + 0)
   5521 0A            [ 7] 2022 	ld	a,(bc)
   5522 47            [ 4] 2023 	ld	b,a
   5523 21 DC 90      [10] 2024 	ld	hl, #_object + 0
   5526 4E            [ 7] 2025 	ld	c,(hl)
   5527 3E 01         [ 7] 2026 	ld	a,#0x01
   5529 F5            [11] 2027 	push	af
   552A 33            [ 6] 2028 	inc	sp
   552B D5            [11] 2029 	push	de
   552C C5            [11] 2030 	push	bc
   552D CD 86 53      [17] 2031 	call	_draw
   5530 F1            [10] 2032 	pop	af
   5531 F1            [10] 2033 	pop	af
   5532 33            [ 6] 2034 	inc	sp
   5533                    2035 00116$:
                           2036 ;src/draws.h:199: drawStats();
   5533 CD 47 54      [17] 2037 	call	_drawStats
   5536 33            [ 6] 2038 	inc	sp
   5537 DD E1         [14] 2039 	pop	ix
   5539 C9            [10] 2040 	ret
                           2041 ;src/draws.h:202: void erases(){
                           2042 ;	---------------------------------
                           2043 ; Function erases
                           2044 ; ---------------------------------
   553A                    2045 _erases::
                           2046 ;src/draws.h:204: if(temp%2 == 0)
   553A FD 21 D0 90   [14] 2047 	ld	iy,#_temp
   553E FD CB 00 46   [20] 2048 	bit	0, 0 (iy)
   5542 20 14         [12] 2049 	jr	NZ,00102$
                           2050 ;src/draws.h:205: erase(player.lx,player.ly,0);
   5544 21 E9 90      [10] 2051 	ld	hl, #_player + 3
   5547 56            [ 7] 2052 	ld	d,(hl)
   5548 21 E8 90      [10] 2053 	ld	hl, #_player + 2
   554B 46            [ 7] 2054 	ld	b,(hl)
   554C AF            [ 4] 2055 	xor	a, a
   554D F5            [11] 2056 	push	af
   554E 33            [ 6] 2057 	inc	sp
   554F D5            [11] 2058 	push	de
   5550 33            [ 6] 2059 	inc	sp
   5551 C5            [11] 2060 	push	bc
   5552 33            [ 6] 2061 	inc	sp
   5553 CD E6 53      [17] 2062 	call	_erase
   5556 F1            [10] 2063 	pop	af
   5557 33            [ 6] 2064 	inc	sp
   5558                    2065 00102$:
                           2066 ;src/draws.h:206: if(temp%2 == 1 && enemy.life > 0)
   5558 3A D0 90      [13] 2067 	ld	a,(#_temp + 0)
   555B E6 01         [ 7] 2068 	and	a, #0x01
   555D 3D            [ 4] 2069 	dec	a
   555E 20 1A         [12] 2070 	jr	NZ,00104$
   5560 3A F9 90      [13] 2071 	ld	a, (#_enemy + 8)
   5563 B7            [ 4] 2072 	or	a, a
   5564 28 14         [12] 2073 	jr	Z,00104$
                           2074 ;src/draws.h:207: erase(enemy.lx,enemy.ly,0);
   5566 21 F4 90      [10] 2075 	ld	hl, #_enemy + 3
   5569 56            [ 7] 2076 	ld	d,(hl)
   556A 21 F3 90      [10] 2077 	ld	hl, #_enemy + 2
   556D 46            [ 7] 2078 	ld	b,(hl)
   556E AF            [ 4] 2079 	xor	a, a
   556F F5            [11] 2080 	push	af
   5570 33            [ 6] 2081 	inc	sp
   5571 D5            [11] 2082 	push	de
   5572 33            [ 6] 2083 	inc	sp
   5573 C5            [11] 2084 	push	bc
   5574 33            [ 6] 2085 	inc	sp
   5575 CD E6 53      [17] 2086 	call	_erase
   5578 F1            [10] 2087 	pop	af
   5579 33            [ 6] 2088 	inc	sp
   557A                    2089 00104$:
                           2090 ;src/draws.h:208: if(arrow == 1){
   557A 3A D4 90      [13] 2091 	ld	a,(#_arrow + 0)
   557D 3D            [ 4] 2092 	dec	a
   557E C0            [11] 2093 	ret	NZ
                           2094 ;src/draws.h:209: if(object.dir == 4 || object.dir == 6)
   557F 21 E3 90      [10] 2095 	ld	hl, #_object + 7
   5582 5E            [ 7] 2096 	ld	e,(hl)
                           2097 ;src/draws.h:210: erase(object.lx,object.ly,2);
   5583 21 DF 90      [10] 2098 	ld	hl, #_object + 3
   5586 56            [ 7] 2099 	ld	d,(hl)
   5587 21 DE 90      [10] 2100 	ld	hl, #_object + 2
   558A 46            [ 7] 2101 	ld	b,(hl)
                           2102 ;src/draws.h:209: if(object.dir == 4 || object.dir == 6)
   558B 7B            [ 4] 2103 	ld	a,e
   558C FE 04         [ 7] 2104 	cp	a,#0x04
   558E 28 04         [12] 2105 	jr	Z,00106$
   5590 D6 06         [ 7] 2106 	sub	a, #0x06
   5592 20 0F         [12] 2107 	jr	NZ,00107$
   5594                    2108 00106$:
                           2109 ;src/draws.h:210: erase(object.lx,object.ly,2);
   5594 3E 02         [ 7] 2110 	ld	a,#0x02
   5596 F5            [11] 2111 	push	af
   5597 33            [ 6] 2112 	inc	sp
   5598 D5            [11] 2113 	push	de
   5599 33            [ 6] 2114 	inc	sp
   559A C5            [11] 2115 	push	bc
   559B 33            [ 6] 2116 	inc	sp
   559C CD E6 53      [17] 2117 	call	_erase
   559F F1            [10] 2118 	pop	af
   55A0 33            [ 6] 2119 	inc	sp
   55A1 18 0D         [12] 2120 	jr	00108$
   55A3                    2121 00107$:
                           2122 ;src/draws.h:212: erase(object.lx,object.ly,1);
   55A3 3E 01         [ 7] 2123 	ld	a,#0x01
   55A5 F5            [11] 2124 	push	af
   55A6 33            [ 6] 2125 	inc	sp
   55A7 D5            [11] 2126 	push	de
   55A8 33            [ 6] 2127 	inc	sp
   55A9 C5            [11] 2128 	push	bc
   55AA 33            [ 6] 2129 	inc	sp
   55AB CD E6 53      [17] 2130 	call	_erase
   55AE F1            [10] 2131 	pop	af
   55AF 33            [ 6] 2132 	inc	sp
   55B0                    2133 00108$:
                           2134 ;src/draws.h:213: if(bound == 1) arrow = 0;
   55B0 3A D6 90      [13] 2135 	ld	a,(#_bound + 0)
   55B3 3D            [ 4] 2136 	dec	a
   55B4 C0            [11] 2137 	ret	NZ
   55B5 21 D4 90      [10] 2138 	ld	hl,#_arrow + 0
   55B8 36 00         [10] 2139 	ld	(hl), #0x00
   55BA C9            [10] 2140 	ret
                           2141 ;src/draws.h:220: void drawFatiga(u8 atk, u8 col){
                           2142 ;	---------------------------------
                           2143 ; Function drawFatiga
                           2144 ; ---------------------------------
   55BB                    2145 _drawFatiga::
   55BB DD E5         [15] 2146 	push	ix
   55BD DD 21 00 00   [14] 2147 	ld	ix,#0
   55C1 DD 39         [15] 2148 	add	ix,sp
   55C3 F5            [11] 2149 	push	af
                           2150 ;src/draws.h:222: if(atk < 20)
   55C4 DD 7E 04      [19] 2151 	ld	a,4 (ix)
   55C7 D6 14         [ 7] 2152 	sub	a, #0x14
   55C9 30 04         [12] 2153 	jr	NC,00102$
                           2154 ;src/draws.h:223: col = 2;
   55CB DD 36 05 02   [19] 2155 	ld	5 (ix),#0x02
   55CF                    2156 00102$:
                           2157 ;src/draws.h:224: if(atk > 30 || atk <= 20){
   55CF 3E 14         [ 7] 2158 	ld	a,#0x14
   55D1 DD 96 04      [19] 2159 	sub	a, 4 (ix)
   55D4 3E 00         [ 7] 2160 	ld	a,#0x00
   55D6 17            [ 4] 2161 	rla
   55D7 DD 77 FF      [19] 2162 	ld	-1 (ix),a
                           2163 ;src/draws.h:226: switch(col){
   55DA 3E 02         [ 7] 2164 	ld	a,#0x02
   55DC DD 96 05      [19] 2165 	sub	a, 5 (ix)
   55DF 3E 00         [ 7] 2166 	ld	a,#0x00
   55E1 17            [ 4] 2167 	rla
   55E2 DD 77 FE      [19] 2168 	ld	-2 (ix),a
                           2169 ;src/draws.h:224: if(atk > 30 || atk <= 20){
   55E5 3E 1E         [ 7] 2170 	ld	a,#0x1E
   55E7 DD 96 04      [19] 2171 	sub	a, 4 (ix)
   55EA 38 06         [12] 2172 	jr	C,00107$
   55EC DD 7E FF      [19] 2173 	ld	a,-1 (ix)
   55EF B7            [ 4] 2174 	or	a, a
   55F0 20 4F         [12] 2175 	jr	NZ,00108$
   55F2                    2176 00107$:
                           2177 ;src/draws.h:225: memptr = cpct_getScreenPtr(VMEM,28,192);
   55F2 21 1C C0      [10] 2178 	ld	hl,#0xC01C
   55F5 E5            [11] 2179 	push	hl
   55F6 2E 00         [ 7] 2180 	ld	l, #0x00
   55F8 E5            [11] 2181 	push	hl
   55F9 CD EA 8E      [17] 2182 	call	_cpct_getScreenPtr
                           2183 ;src/draws.h:226: switch(col){
   55FC DD 7E FE      [19] 2184 	ld	a,-2 (ix)
   55FF B7            [ 4] 2185 	or	a, a
   5600 20 3F         [12] 2186 	jr	NZ,00108$
                           2187 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   5602 4D            [ 4] 2188 	ld	c, l
   5603 44            [ 4] 2189 	ld	b, h
                           2190 ;src/draws.h:226: switch(col){
   5604 DD 5E 05      [19] 2191 	ld	e,5 (ix)
   5607 16 00         [ 7] 2192 	ld	d,#0x00
   5609 21 0F 56      [10] 2193 	ld	hl,#00156$
   560C 19            [11] 2194 	add	hl,de
   560D 19            [11] 2195 	add	hl,de
                           2196 ;src/draws.h:227: case 0:
   560E E9            [ 4] 2197 	jp	(hl)
   560F                    2198 00156$:
   560F 18 04         [12] 2199 	jr	00103$
   5611 18 14         [12] 2200 	jr	00104$
   5613 18 20         [12] 2201 	jr	00105$
   5615                    2202 00103$:
                           2203 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   5615 21 02 08      [10] 2204 	ld	hl,#0x0802
   5618 E5            [11] 2205 	push	hl
   5619 DD 7E 05      [19] 2206 	ld	a,5 (ix)
   561C F5            [11] 2207 	push	af
   561D 33            [ 6] 2208 	inc	sp
   561E C5            [11] 2209 	push	bc
   561F CD 19 8E      [17] 2210 	call	_cpct_drawSolidBox
   5622 F1            [10] 2211 	pop	af
   5623 F1            [10] 2212 	pop	af
   5624 33            [ 6] 2213 	inc	sp
                           2214 ;src/draws.h:229: break;
   5625 18 1A         [12] 2215 	jr	00108$
                           2216 ;src/draws.h:230: case 1:
   5627                    2217 00104$:
                           2218 ;src/draws.h:231: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   5627 11 C8 4A      [10] 2219 	ld	de,#_fatiga_nor
   562A 21 02 08      [10] 2220 	ld	hl,#0x0802
   562D E5            [11] 2221 	push	hl
   562E C5            [11] 2222 	push	bc
   562F D5            [11] 2223 	push	de
   5630 CD 93 8D      [17] 2224 	call	_cpct_drawSpriteMasked
                           2225 ;src/draws.h:232: break;
   5633 18 0C         [12] 2226 	jr	00108$
                           2227 ;src/draws.h:233: case 2:
   5635                    2228 00105$:
                           2229 ;src/draws.h:234: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   5635 11 E8 4A      [10] 2230 	ld	de,#_fatiga_full
   5638 21 02 08      [10] 2231 	ld	hl,#0x0802
   563B E5            [11] 2232 	push	hl
   563C C5            [11] 2233 	push	bc
   563D D5            [11] 2234 	push	de
   563E CD 93 8D      [17] 2235 	call	_cpct_drawSpriteMasked
                           2236 ;src/draws.h:235: }
   5641                    2237 00108$:
                           2238 ;src/draws.h:237: if(atk > 40 || atk <= 20){
   5641 3E 28         [ 7] 2239 	ld	a,#0x28
   5643 DD 96 04      [19] 2240 	sub	a, 4 (ix)
   5646 38 06         [12] 2241 	jr	C,00114$
   5648 DD 7E FF      [19] 2242 	ld	a,-1 (ix)
   564B B7            [ 4] 2243 	or	a, a
   564C 20 4F         [12] 2244 	jr	NZ,00115$
   564E                    2245 00114$:
                           2246 ;src/draws.h:238: memptr = cpct_getScreenPtr(VMEM,31,192);
   564E 21 1F C0      [10] 2247 	ld	hl,#0xC01F
   5651 E5            [11] 2248 	push	hl
   5652 2E 00         [ 7] 2249 	ld	l, #0x00
   5654 E5            [11] 2250 	push	hl
   5655 CD EA 8E      [17] 2251 	call	_cpct_getScreenPtr
                           2252 ;src/draws.h:239: switch(col){
   5658 DD 7E FE      [19] 2253 	ld	a,-2 (ix)
   565B B7            [ 4] 2254 	or	a, a
   565C 20 3F         [12] 2255 	jr	NZ,00115$
                           2256 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   565E 4D            [ 4] 2257 	ld	c, l
   565F 44            [ 4] 2258 	ld	b, h
                           2259 ;src/draws.h:239: switch(col){
   5660 DD 5E 05      [19] 2260 	ld	e,5 (ix)
   5663 16 00         [ 7] 2261 	ld	d,#0x00
   5665 21 6B 56      [10] 2262 	ld	hl,#00157$
   5668 19            [11] 2263 	add	hl,de
   5669 19            [11] 2264 	add	hl,de
                           2265 ;src/draws.h:240: case 0:
   566A E9            [ 4] 2266 	jp	(hl)
   566B                    2267 00157$:
   566B 18 04         [12] 2268 	jr	00110$
   566D 18 14         [12] 2269 	jr	00111$
   566F 18 20         [12] 2270 	jr	00112$
   5671                    2271 00110$:
                           2272 ;src/draws.h:241: cpct_drawSolidBox(memptr, col, 2, 8);
   5671 21 02 08      [10] 2273 	ld	hl,#0x0802
   5674 E5            [11] 2274 	push	hl
   5675 DD 7E 05      [19] 2275 	ld	a,5 (ix)
   5678 F5            [11] 2276 	push	af
   5679 33            [ 6] 2277 	inc	sp
   567A C5            [11] 2278 	push	bc
   567B CD 19 8E      [17] 2279 	call	_cpct_drawSolidBox
   567E F1            [10] 2280 	pop	af
   567F F1            [10] 2281 	pop	af
   5680 33            [ 6] 2282 	inc	sp
                           2283 ;src/draws.h:242: break;
   5681 18 1A         [12] 2284 	jr	00115$
                           2285 ;src/draws.h:243: case 1:
   5683                    2286 00111$:
                           2287 ;src/draws.h:244: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   5683 11 C8 4A      [10] 2288 	ld	de,#_fatiga_nor
   5686 21 02 08      [10] 2289 	ld	hl,#0x0802
   5689 E5            [11] 2290 	push	hl
   568A C5            [11] 2291 	push	bc
   568B D5            [11] 2292 	push	de
   568C CD 93 8D      [17] 2293 	call	_cpct_drawSpriteMasked
                           2294 ;src/draws.h:245: break;
   568F 18 0C         [12] 2295 	jr	00115$
                           2296 ;src/draws.h:246: case 2:
   5691                    2297 00112$:
                           2298 ;src/draws.h:247: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   5691 11 E8 4A      [10] 2299 	ld	de,#_fatiga_full
   5694 21 02 08      [10] 2300 	ld	hl,#0x0802
   5697 E5            [11] 2301 	push	hl
   5698 C5            [11] 2302 	push	bc
   5699 D5            [11] 2303 	push	de
   569A CD 93 8D      [17] 2304 	call	_cpct_drawSpriteMasked
                           2305 ;src/draws.h:248: }
   569D                    2306 00115$:
                           2307 ;src/draws.h:250: if(atk <= 20){
   569D DD 7E FF      [19] 2308 	ld	a,-1 (ix)
   56A0 B7            [ 4] 2309 	or	a, a
   56A1 20 39         [12] 2310 	jr	NZ,00122$
                           2311 ;src/draws.h:251: memptr = cpct_getScreenPtr(VMEM,34,192);
   56A3 21 22 C0      [10] 2312 	ld	hl,#0xC022
   56A6 E5            [11] 2313 	push	hl
   56A7 2E 00         [ 7] 2314 	ld	l, #0x00
   56A9 E5            [11] 2315 	push	hl
   56AA CD EA 8E      [17] 2316 	call	_cpct_getScreenPtr
                           2317 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   56AD 4D            [ 4] 2318 	ld	c, l
   56AE 44            [ 4] 2319 	ld	b, h
                           2320 ;src/draws.h:252: switch(col){
   56AF DD 7E 05      [19] 2321 	ld	a,5 (ix)
   56B2 B7            [ 4] 2322 	or	a, a
   56B3 28 09         [12] 2323 	jr	Z,00117$
   56B5 DD 7E 05      [19] 2324 	ld	a,5 (ix)
   56B8 D6 02         [ 7] 2325 	sub	a, #0x02
   56BA 28 14         [12] 2326 	jr	Z,00118$
   56BC 18 1E         [12] 2327 	jr	00122$
                           2328 ;src/draws.h:253: case 0:
   56BE                    2329 00117$:
                           2330 ;src/draws.h:254: cpct_drawSolidBox(memptr, col, 2, 8);
   56BE 21 02 08      [10] 2331 	ld	hl,#0x0802
   56C1 E5            [11] 2332 	push	hl
   56C2 DD 7E 05      [19] 2333 	ld	a,5 (ix)
   56C5 F5            [11] 2334 	push	af
   56C6 33            [ 6] 2335 	inc	sp
   56C7 C5            [11] 2336 	push	bc
   56C8 CD 19 8E      [17] 2337 	call	_cpct_drawSolidBox
   56CB F1            [10] 2338 	pop	af
   56CC F1            [10] 2339 	pop	af
   56CD 33            [ 6] 2340 	inc	sp
                           2341 ;src/draws.h:255: break;
   56CE 18 0C         [12] 2342 	jr	00122$
                           2343 ;src/draws.h:256: case 2:
   56D0                    2344 00118$:
                           2345 ;src/draws.h:257: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   56D0 11 E8 4A      [10] 2346 	ld	de,#_fatiga_full
   56D3 21 02 08      [10] 2347 	ld	hl,#0x0802
   56D6 E5            [11] 2348 	push	hl
   56D7 C5            [11] 2349 	push	bc
   56D8 D5            [11] 2350 	push	de
   56D9 CD 93 8D      [17] 2351 	call	_cpct_drawSpriteMasked
                           2352 ;src/draws.h:258: }
   56DC                    2353 00122$:
   56DC DD F9         [10] 2354 	ld	sp, ix
   56DE DD E1         [14] 2355 	pop	ix
   56E0 C9            [10] 2356 	ret
                           2357 ;src/draws.h:263: void drawPickUps(u8 corazon, u8 bullet){
                           2358 ;	---------------------------------
                           2359 ; Function drawPickUps
                           2360 ; ---------------------------------
   56E1                    2361 _drawPickUps::
   56E1 DD E5         [15] 2362 	push	ix
   56E3 DD 21 00 00   [14] 2363 	ld	ix,#0
   56E7 DD 39         [15] 2364 	add	ix,sp
                           2365 ;src/draws.h:266: memptr = cpct_getScreenPtr(VMEM, originsu[map-1][0],originsu[map-1][1] );
   56E9 01 51 4B      [10] 2366 	ld	bc,#_originsu+0
   56EC 21 D1 90      [10] 2367 	ld	hl,#_map + 0
   56EF 56            [ 7] 2368 	ld	d, (hl)
   56F0 15            [ 4] 2369 	dec	d
   56F1 6A            [ 4] 2370 	ld	l,d
   56F2 26 00         [ 7] 2371 	ld	h,#0x00
   56F4 29            [11] 2372 	add	hl, hl
   56F5 29            [11] 2373 	add	hl, hl
   56F6 09            [11] 2374 	add	hl, bc
   56F7 E5            [11] 2375 	push	hl
   56F8 FD E1         [14] 2376 	pop	iy
   56FA FD E5         [15] 2377 	push	iy
   56FC E1            [10] 2378 	pop	hl
   56FD 23            [ 6] 2379 	inc	hl
   56FE 56            [ 7] 2380 	ld	d,(hl)
   56FF FD 7E 00      [19] 2381 	ld	a, 0 (iy)
   5702 C5            [11] 2382 	push	bc
   5703 D5            [11] 2383 	push	de
   5704 33            [ 6] 2384 	inc	sp
   5705 F5            [11] 2385 	push	af
   5706 33            [ 6] 2386 	inc	sp
   5707 21 00 C0      [10] 2387 	ld	hl,#0xC000
   570A E5            [11] 2388 	push	hl
   570B CD EA 8E      [17] 2389 	call	_cpct_getScreenPtr
   570E C1            [10] 2390 	pop	bc
                           2391 ;src/draws.h:268: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   570F EB            [ 4] 2392 	ex	de,hl
                           2393 ;src/draws.h:267: if(corazon == 0)
   5710 DD 7E 04      [19] 2394 	ld	a,4 (ix)
   5713 B7            [ 4] 2395 	or	a, a
   5714 20 10         [12] 2396 	jr	NZ,00102$
                           2397 ;src/draws.h:268: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   5716 C5            [11] 2398 	push	bc
   5717 21 04 08      [10] 2399 	ld	hl,#0x0804
   571A E5            [11] 2400 	push	hl
   571B D5            [11] 2401 	push	de
   571C 21 48 4A      [10] 2402 	ld	hl,#_corazon_lleno
   571F E5            [11] 2403 	push	hl
   5720 CD 93 8D      [17] 2404 	call	_cpct_drawSpriteMasked
   5723 C1            [10] 2405 	pop	bc
   5724 18 10         [12] 2406 	jr	00103$
   5726                    2407 00102$:
                           2408 ;src/draws.h:270: cpct_drawSolidBox(memptr, 0, 4, 8);
   5726 C5            [11] 2409 	push	bc
   5727 21 04 08      [10] 2410 	ld	hl,#0x0804
   572A E5            [11] 2411 	push	hl
   572B AF            [ 4] 2412 	xor	a, a
   572C F5            [11] 2413 	push	af
   572D 33            [ 6] 2414 	inc	sp
   572E D5            [11] 2415 	push	de
   572F CD 19 8E      [17] 2416 	call	_cpct_drawSolidBox
   5732 F1            [10] 2417 	pop	af
   5733 F1            [10] 2418 	pop	af
   5734 33            [ 6] 2419 	inc	sp
   5735 C1            [10] 2420 	pop	bc
   5736                    2421 00103$:
                           2422 ;src/draws.h:272: memptr = cpct_getScreenPtr(VMEM, originsu[map-1][2],originsu[map-1][3]);
   5736 21 D1 90      [10] 2423 	ld	hl,#_map + 0
   5739 56            [ 7] 2424 	ld	d, (hl)
   573A 15            [ 4] 2425 	dec	d
   573B 6A            [ 4] 2426 	ld	l,d
   573C 26 00         [ 7] 2427 	ld	h,#0x00
   573E 29            [11] 2428 	add	hl, hl
   573F 29            [11] 2429 	add	hl, hl
   5740 09            [11] 2430 	add	hl,bc
   5741 5D            [ 4] 2431 	ld	e,l
   5742 54            [ 4] 2432 	ld	d,h
   5743 23            [ 6] 2433 	inc	hl
   5744 23            [ 6] 2434 	inc	hl
   5745 23            [ 6] 2435 	inc	hl
   5746 46            [ 7] 2436 	ld	b,(hl)
   5747 EB            [ 4] 2437 	ex	de,hl
   5748 23            [ 6] 2438 	inc	hl
   5749 23            [ 6] 2439 	inc	hl
   574A 4E            [ 7] 2440 	ld	c, (hl)
   574B C5            [11] 2441 	push	bc
   574C 21 00 C0      [10] 2442 	ld	hl,#0xC000
   574F E5            [11] 2443 	push	hl
   5750 CD EA 8E      [17] 2444 	call	_cpct_getScreenPtr
                           2445 ;src/draws.h:268: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   5753 EB            [ 4] 2446 	ex	de,hl
                           2447 ;src/draws.h:273: if(bullet == 0)
   5754 DD 7E 05      [19] 2448 	ld	a,5 (ix)
   5757 B7            [ 4] 2449 	or	a, a
   5758 20 0E         [12] 2450 	jr	NZ,00105$
                           2451 ;src/draws.h:274: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   575A 01 C8 75      [10] 2452 	ld	bc,#_flecha_arriba
   575D 21 02 08      [10] 2453 	ld	hl,#0x0802
   5760 E5            [11] 2454 	push	hl
   5761 D5            [11] 2455 	push	de
   5762 C5            [11] 2456 	push	bc
   5763 CD 93 8D      [17] 2457 	call	_cpct_drawSpriteMasked
   5766 18 0E         [12] 2458 	jr	00107$
   5768                    2459 00105$:
                           2460 ;src/draws.h:276: cpct_drawSolidBox(memptr, 0, 2, 8);
   5768 21 02 08      [10] 2461 	ld	hl,#0x0802
   576B E5            [11] 2462 	push	hl
   576C AF            [ 4] 2463 	xor	a, a
   576D F5            [11] 2464 	push	af
   576E 33            [ 6] 2465 	inc	sp
   576F D5            [11] 2466 	push	de
   5770 CD 19 8E      [17] 2467 	call	_cpct_drawSolidBox
   5773 F1            [10] 2468 	pop	af
   5774 F1            [10] 2469 	pop	af
   5775 33            [ 6] 2470 	inc	sp
   5776                    2471 00107$:
   5776 DD E1         [14] 2472 	pop	ix
   5778 C9            [10] 2473 	ret
                           2474 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           2475 ;	---------------------------------
                           2476 ; Function detectPlayerRoom
                           2477 ; ---------------------------------
   5779                    2478 _detectPlayerRoom::
   5779 DD E5         [15] 2479 	push	ix
   577B DD 21 00 00   [14] 2480 	ld	ix,#0
   577F DD 39         [15] 2481 	add	ix,sp
                           2482 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   5781 11 E0 8F      [10] 2483 	ld	de,#_scene+0
   5784 DD 7E 05      [19] 2484 	ld	a,5 (ix)
   5787 07            [ 4] 2485 	rlca
   5788 07            [ 4] 2486 	rlca
   5789 07            [ 4] 2487 	rlca
   578A 07            [ 4] 2488 	rlca
   578B E6 0F         [ 7] 2489 	and	a,#0x0F
   578D 4F            [ 4] 2490 	ld	c,a
   578E 06 00         [ 7] 2491 	ld	b,#0x00
   5790 69            [ 4] 2492 	ld	l, c
   5791 60            [ 4] 2493 	ld	h, b
   5792 29            [11] 2494 	add	hl, hl
   5793 29            [11] 2495 	add	hl, hl
   5794 09            [11] 2496 	add	hl, bc
   5795 29            [11] 2497 	add	hl, hl
   5796 29            [11] 2498 	add	hl, hl
   5797 19            [11] 2499 	add	hl,de
   5798 DD 5E 04      [19] 2500 	ld	e,4 (ix)
   579B CB 3B         [ 8] 2501 	srl	e
   579D CB 3B         [ 8] 2502 	srl	e
   579F 16 00         [ 7] 2503 	ld	d,#0x00
   57A1 19            [11] 2504 	add	hl,de
   57A2 6E            [ 7] 2505 	ld	l,(hl)
   57A3 DD E1         [14] 2506 	pop	ix
   57A5 C9            [10] 2507 	ret
                           2508 ;src/ia.h:16: u8 chooseDirection(){
                           2509 ;	---------------------------------
                           2510 ; Function chooseDirection
                           2511 ; ---------------------------------
   57A6                    2512 _chooseDirection::
                           2513 ;src/ia.h:18: u8 dir = 0;
   57A6 16 00         [ 7] 2514 	ld	d,#0x00
                           2515 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   57A8 D5            [11] 2516 	push	de
   57A9 CD 92 8B      [17] 2517 	call	_rand
   57AC 01 04 00      [10] 2518 	ld	bc,#0x0004
   57AF C5            [11] 2519 	push	bc
   57B0 E5            [11] 2520 	push	hl
   57B1 CD DE 8E      [17] 2521 	call	__modsint
   57B4 F1            [10] 2522 	pop	af
   57B5 F1            [10] 2523 	pop	af
   57B6 D1            [10] 2524 	pop	de
   57B7 5D            [ 4] 2525 	ld	e,l
   57B8 1C            [ 4] 2526 	inc	e
                           2527 ;src/ia.h:20: switch(rnd){
   57B9 7B            [ 4] 2528 	ld	a,e
   57BA D6 01         [ 7] 2529 	sub	a, #0x01
   57BC 38 24         [12] 2530 	jr	C,00105$
   57BE 3E 04         [ 7] 2531 	ld	a,#0x04
   57C0 93            [ 4] 2532 	sub	a, e
   57C1 38 1F         [12] 2533 	jr	C,00105$
   57C3 1D            [ 4] 2534 	dec	e
   57C4 16 00         [ 7] 2535 	ld	d,#0x00
   57C6 21 CC 57      [10] 2536 	ld	hl,#00116$
   57C9 19            [11] 2537 	add	hl,de
   57CA 19            [11] 2538 	add	hl,de
                           2539 ;src/ia.h:21: case 4: dir = 6;break;
   57CB E9            [ 4] 2540 	jp	(hl)
   57CC                    2541 00116$:
   57CC 18 12         [12] 2542 	jr	00104$
   57CE 18 0C         [12] 2543 	jr	00103$
   57D0 18 06         [12] 2544 	jr	00102$
   57D2 18 00         [12] 2545 	jr	00101$
   57D4                    2546 00101$:
   57D4 16 06         [ 7] 2547 	ld	d,#0x06
   57D6 18 0A         [12] 2548 	jr	00105$
                           2549 ;src/ia.h:22: case 3: dir = 4;break;
   57D8                    2550 00102$:
   57D8 16 04         [ 7] 2551 	ld	d,#0x04
   57DA 18 06         [12] 2552 	jr	00105$
                           2553 ;src/ia.h:23: case 2: dir = 2;break;
   57DC                    2554 00103$:
   57DC 16 02         [ 7] 2555 	ld	d,#0x02
   57DE 18 02         [12] 2556 	jr	00105$
                           2557 ;src/ia.h:24: case 1: dir = 8;break;
   57E0                    2558 00104$:
   57E0 16 08         [ 7] 2559 	ld	d,#0x08
                           2560 ;src/ia.h:25: }
   57E2                    2561 00105$:
                           2562 ;src/ia.h:27: return dir;
   57E2 6A            [ 4] 2563 	ld	l,d
   57E3 C9            [10] 2564 	ret
                           2565 ;src/ia.h:30: void movement(u8 dir){
                           2566 ;	---------------------------------
                           2567 ; Function movement
                           2568 ; ---------------------------------
   57E4                    2569 _movement::
                           2570 ;src/ia.h:31: switch(dir){
   57E4 FD 21 02 00   [14] 2571 	ld	iy,#2
   57E8 FD 39         [15] 2572 	add	iy,sp
   57EA FD 7E 00      [19] 2573 	ld	a,0 (iy)
   57ED D6 02         [ 7] 2574 	sub	a, #0x02
   57EF 28 2B         [12] 2575 	jr	Z,00104$
   57F1 FD 7E 00      [19] 2576 	ld	a,0 (iy)
   57F4 D6 04         [ 7] 2577 	sub	a, #0x04
   57F6 28 14         [12] 2578 	jr	Z,00102$
   57F8 FD 7E 00      [19] 2579 	ld	a,0 (iy)
   57FB D6 06         [ 7] 2580 	sub	a, #0x06
   57FD 28 08         [12] 2581 	jr	Z,00101$
   57FF FD 7E 00      [19] 2582 	ld	a,0 (iy)
   5802 D6 08         [ 7] 2583 	sub	a, #0x08
   5804 28 0E         [12] 2584 	jr	Z,00103$
   5806 C9            [10] 2585 	ret
                           2586 ;src/ia.h:32: case 6: enemy.x += 1; break;
   5807                    2587 00101$:
   5807 21 F1 90      [10] 2588 	ld	hl,#_enemy+0
   580A 34            [11] 2589 	inc	(hl)
   580B C9            [10] 2590 	ret
                           2591 ;src/ia.h:33: case 4: enemy.x -= 1; break;
   580C                    2592 00102$:
   580C 11 F1 90      [10] 2593 	ld	de,#_enemy+0
   580F 1A            [ 7] 2594 	ld	a,(de)
   5810 C6 FF         [ 7] 2595 	add	a,#0xFF
   5812 12            [ 7] 2596 	ld	(de),a
   5813 C9            [10] 2597 	ret
                           2598 ;src/ia.h:34: case 8: enemy.y -= 2; break;
   5814                    2599 00103$:
   5814 11 F2 90      [10] 2600 	ld	de,#_enemy+1
   5817 1A            [ 7] 2601 	ld	a,(de)
   5818 C6 FE         [ 7] 2602 	add	a,#0xFE
   581A 12            [ 7] 2603 	ld	(de),a
   581B C9            [10] 2604 	ret
                           2605 ;src/ia.h:35: case 2: enemy.y += 2; break;
   581C                    2606 00104$:
   581C 21 F2 90      [10] 2607 	ld	hl,#_enemy+1
   581F 7E            [ 7] 2608 	ld	a,(hl)
   5820 C6 02         [ 7] 2609 	add	a, #0x02
   5822 77            [ 7] 2610 	ld	(hl),a
                           2611 ;src/ia.h:36: }
   5823 C9            [10] 2612 	ret
                           2613 ;src/ia.h:39: void followPlayer(){
                           2614 ;	---------------------------------
                           2615 ; Function followPlayer
                           2616 ; ---------------------------------
   5824                    2617 _followPlayer::
   5824 DD E5         [15] 2618 	push	ix
   5826 DD 21 00 00   [14] 2619 	ld	ix,#0
   582A DD 39         [15] 2620 	add	ix,sp
   582C 21 E1 FF      [10] 2621 	ld	hl,#-31
   582F 39            [11] 2622 	add	hl,sp
   5830 F9            [ 6] 2623 	ld	sp,hl
                           2624 ;src/ia.h:42: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   5831 21 E7 90      [10] 2625 	ld	hl, #(_player + 0x0001) + 0
   5834 56            [ 7] 2626 	ld	d,(hl)
   5835 3A E6 90      [13] 2627 	ld	a, (#_player + 0)
   5838 D5            [11] 2628 	push	de
   5839 33            [ 6] 2629 	inc	sp
   583A F5            [11] 2630 	push	af
   583B 33            [ 6] 2631 	inc	sp
   583C CD 79 57      [17] 2632 	call	_detectPlayerRoom
   583F F1            [10] 2633 	pop	af
   5840 DD 75 E3      [19] 2634 	ld	-29 (ix),l
   5843 21 FB 90      [10] 2635 	ld	hl, #_enemy + 10
   5846 DD 7E E3      [19] 2636 	ld	a,-29 (ix)
   5849 96            [ 7] 2637 	sub	a,(hl)
   584A 28 0E         [12] 2638 	jr	Z,00102$
                           2639 ;src/ia.h:43: auxX = enemy.seenX;
   584C 3A FC 90      [13] 2640 	ld	a,(#_enemy + 11)
   584F DD 77 E2      [19] 2641 	ld	-30 (ix),a
                           2642 ;src/ia.h:44: auxY = enemy.seenY;
   5852 3A FD 90      [13] 2643 	ld	a,(#_enemy + 12)
   5855 DD 77 E1      [19] 2644 	ld	-31 (ix),a
   5858 18 0C         [12] 2645 	jr	00103$
   585A                    2646 00102$:
                           2647 ;src/ia.h:46: auxX = player.x;
   585A 3A E6 90      [13] 2648 	ld	a,(#_player + 0)
   585D DD 77 E2      [19] 2649 	ld	-30 (ix),a
                           2650 ;src/ia.h:47: auxY = player.y;
   5860 3A E7 90      [13] 2651 	ld	a,(#(_player + 0x0001) + 0)
   5863 DD 77 E1      [19] 2652 	ld	-31 (ix),a
   5866                    2653 00103$:
                           2654 ;src/ia.h:49: if(auxX < enemy.x){
   5866 3A F1 90      [13] 2655 	ld	a,(#_enemy + 0)
                           2656 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5869 DD 77 E3      [19] 2657 	ld	-29 (ix), a
   586C DD 77 E4      [19] 2658 	ld	-28 (ix),a
   586F DD 36 E5 00   [19] 2659 	ld	-27 (ix),#0x00
   5873 DD 7E E4      [19] 2660 	ld	a,-28 (ix)
   5876 C6 02         [ 7] 2661 	add	a, #0x02
   5878 DD 77 E8      [19] 2662 	ld	-24 (ix),a
   587B DD 7E E5      [19] 2663 	ld	a,-27 (ix)
   587E CE 00         [ 7] 2664 	adc	a, #0x00
   5880 DD 77 E9      [19] 2665 	ld	-23 (ix),a
                           2666 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5883 DD 7E E3      [19] 2667 	ld	a,-29 (ix)
   5886 0F            [ 4] 2668 	rrca
   5887 0F            [ 4] 2669 	rrca
   5888 E6 3F         [ 7] 2670 	and	a,#0x3F
   588A DD 77 FD      [19] 2671 	ld	-3 (ix),a
                           2672 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   588D 3A F2 90      [13] 2673 	ld	a,(#(_enemy + 0x0001) + 0)
   5890 DD 77 F4      [19] 2674 	ld	-12 (ix),a
   5893 DD 7E E4      [19] 2675 	ld	a,-28 (ix)
   5896 C6 FF         [ 7] 2676 	add	a,#0xFF
   5898 DD 77 EA      [19] 2677 	ld	-22 (ix),a
   589B DD 7E E5      [19] 2678 	ld	a,-27 (ix)
   589E CE FF         [ 7] 2679 	adc	a,#0xFF
   58A0 DD 77 EB      [19] 2680 	ld	-21 (ix),a
   58A3 DD 7E F4      [19] 2681 	ld	a,-12 (ix)
   58A6 07            [ 4] 2682 	rlca
   58A7 07            [ 4] 2683 	rlca
   58A8 07            [ 4] 2684 	rlca
   58A9 07            [ 4] 2685 	rlca
   58AA E6 0F         [ 7] 2686 	and	a,#0x0F
   58AC DD 77 FE      [19] 2687 	ld	-2 (ix),a
   58AF DD 7E EB      [19] 2688 	ld	a,-21 (ix)
   58B2 07            [ 4] 2689 	rlca
   58B3 E6 01         [ 7] 2690 	and	a,#0x01
   58B5 DD 77 F5      [19] 2691 	ld	-11 (ix),a
                           2692 ;src/ia.h:53: }else if(auxY < enemy.y){
   58B8 DD 7E E1      [19] 2693 	ld	a,-31 (ix)
   58BB DD 96 F4      [19] 2694 	sub	a, -12 (ix)
   58BE 3E 00         [ 7] 2695 	ld	a,#0x00
   58C0 17            [ 4] 2696 	rla
   58C1 DD 77 FF      [19] 2697 	ld	-1 (ix),a
                           2698 ;src/ia.h:55: enemy.y-=1;
   58C4 DD 7E F4      [19] 2699 	ld	a,-12 (ix)
   58C7 C6 FF         [ 7] 2700 	add	a,#0xFF
   58C9 DD 77 ED      [19] 2701 	ld	-19 (ix),a
                           2702 ;src/ia.h:58: enemy.y+=1;
   58CC DD 7E F4      [19] 2703 	ld	a,-12 (ix)
   58CF 3C            [ 4] 2704 	inc	a
   58D0 DD 77 EC      [19] 2705 	ld	-20 (ix),a
                           2706 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   58D3 DD 7E F4      [19] 2707 	ld	a,-12 (ix)
   58D6 DD 77 F2      [19] 2708 	ld	-14 (ix),a
   58D9 DD 36 F3 00   [19] 2709 	ld	-13 (ix),#0x00
                           2710 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   58DD DD 4E FE      [19] 2711 	ld	c,-2 (ix)
   58E0 06 00         [ 7] 2712 	ld	b,#0x00
   58E2 69            [ 4] 2713 	ld	l, c
   58E3 60            [ 4] 2714 	ld	h, b
   58E4 29            [11] 2715 	add	hl, hl
   58E5 29            [11] 2716 	add	hl, hl
   58E6 09            [11] 2717 	add	hl, bc
   58E7 29            [11] 2718 	add	hl, hl
   58E8 29            [11] 2719 	add	hl, hl
   58E9 DD 75 F6      [19] 2720 	ld	-10 (ix),l
   58EC DD 74 F7      [19] 2721 	ld	-9 (ix),h
                           2722 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   58EF DD 7E F2      [19] 2723 	ld	a,-14 (ix)
   58F2 C6 FF         [ 7] 2724 	add	a,#0xFF
   58F4 DD 77 FB      [19] 2725 	ld	-5 (ix),a
   58F7 DD 7E F3      [19] 2726 	ld	a,-13 (ix)
   58FA CE FF         [ 7] 2727 	adc	a,#0xFF
   58FC DD 77 FC      [19] 2728 	ld	-4 (ix),a
   58FF DD 7E F2      [19] 2729 	ld	a,-14 (ix)
   5902 C6 0E         [ 7] 2730 	add	a, #0x0E
   5904 DD 77 F8      [19] 2731 	ld	-8 (ix),a
   5907 DD 7E F3      [19] 2732 	ld	a,-13 (ix)
   590A CE 00         [ 7] 2733 	adc	a, #0x00
   590C DD 77 F9      [19] 2734 	ld	-7 (ix),a
                           2735 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   590F DD 7E F2      [19] 2736 	ld	a,-14 (ix)
   5912 C6 10         [ 7] 2737 	add	a, #0x10
   5914 DD 77 E6      [19] 2738 	ld	-26 (ix),a
   5917 DD 7E F3      [19] 2739 	ld	a,-13 (ix)
   591A CE 00         [ 7] 2740 	adc	a, #0x00
   591C DD 77 E7      [19] 2741 	ld	-25 (ix),a
   591F DD 7E F2      [19] 2742 	ld	a,-14 (ix)
   5922 C6 1F         [ 7] 2743 	add	a, #0x1F
   5924 DD 77 F2      [19] 2744 	ld	-14 (ix),a
   5927 DD 7E F3      [19] 2745 	ld	a,-13 (ix)
   592A CE 00         [ 7] 2746 	adc	a, #0x00
   592C DD 77 F3      [19] 2747 	ld	-13 (ix),a
                           2748 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   592F DD 7E FC      [19] 2749 	ld	a,-4 (ix)
   5932 07            [ 4] 2750 	rlca
   5933 E6 01         [ 7] 2751 	and	a,#0x01
   5935 DD 77 FE      [19] 2752 	ld	-2 (ix),a
                           2753 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5938 DD 7E E7      [19] 2754 	ld	a,-25 (ix)
   593B 07            [ 4] 2755 	rlca
   593C E6 01         [ 7] 2756 	and	a,#0x01
   593E DD 77 F4      [19] 2757 	ld	-12 (ix),a
                           2758 ;src/ia.h:49: if(auxX < enemy.x){
   5941 DD 7E E2      [19] 2759 	ld	a,-30 (ix)
   5944 DD 96 E3      [19] 2760 	sub	a, -29 (ix)
   5947 D2 70 5B      [10] 2761 	jp	NC,00137$
                           2762 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   594A DD 7E F6      [19] 2763 	ld	a,-10 (ix)
   594D C6 E0         [ 7] 2764 	add	a, #<(_scene)
   594F DD 77 F0      [19] 2765 	ld	-16 (ix),a
   5952 DD 7E F7      [19] 2766 	ld	a,-9 (ix)
   5955 CE 8F         [ 7] 2767 	adc	a, #>(_scene)
   5957 DD 77 F1      [19] 2768 	ld	-15 (ix),a
   595A DD 7E EA      [19] 2769 	ld	a,-22 (ix)
   595D DD 77 EE      [19] 2770 	ld	-18 (ix),a
   5960 DD 7E EB      [19] 2771 	ld	a,-21 (ix)
   5963 DD 77 EF      [19] 2772 	ld	-17 (ix),a
   5966 DD 7E F5      [19] 2773 	ld	a,-11 (ix)
   5969 B7            [ 4] 2774 	or	a, a
   596A 28 0C         [12] 2775 	jr	Z,00141$
   596C DD 7E E8      [19] 2776 	ld	a,-24 (ix)
   596F DD 77 EE      [19] 2777 	ld	-18 (ix),a
   5972 DD 7E E9      [19] 2778 	ld	a,-23 (ix)
   5975 DD 77 EF      [19] 2779 	ld	-17 (ix),a
   5978                    2780 00141$:
   5978 DD CB EF 2E   [23] 2781 	sra	-17 (ix)
   597C DD CB EE 1E   [23] 2782 	rr	-18 (ix)
   5980 DD CB EF 2E   [23] 2783 	sra	-17 (ix)
   5984 DD CB EE 1E   [23] 2784 	rr	-18 (ix)
   5988 DD 7E F0      [19] 2785 	ld	a,-16 (ix)
   598B DD 86 EE      [19] 2786 	add	a, -18 (ix)
   598E DD 77 EE      [19] 2787 	ld	-18 (ix),a
   5991 DD 7E F1      [19] 2788 	ld	a,-15 (ix)
   5994 DD 8E EF      [19] 2789 	adc	a, -17 (ix)
   5997 DD 77 EF      [19] 2790 	ld	-17 (ix),a
   599A DD 6E EE      [19] 2791 	ld	l,-18 (ix)
   599D DD 66 EF      [19] 2792 	ld	h,-17 (ix)
   59A0 7E            [ 7] 2793 	ld	a,(hl)
   59A1 3D            [ 4] 2794 	dec	a
   59A2 CA 5B 5A      [10] 2795 	jp	Z,00112$
                           2796 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   59A5 DD 7E E6      [19] 2797 	ld	a,-26 (ix)
   59A8 DD 77 EE      [19] 2798 	ld	-18 (ix),a
   59AB DD 7E E7      [19] 2799 	ld	a,-25 (ix)
   59AE DD 77 EF      [19] 2800 	ld	-17 (ix),a
   59B1 DD 7E F4      [19] 2801 	ld	a,-12 (ix)
   59B4 B7            [ 4] 2802 	or	a, a
   59B5 28 0C         [12] 2803 	jr	Z,00142$
   59B7 DD 7E F2      [19] 2804 	ld	a,-14 (ix)
   59BA DD 77 EE      [19] 2805 	ld	-18 (ix),a
   59BD DD 7E F3      [19] 2806 	ld	a,-13 (ix)
   59C0 DD 77 EF      [19] 2807 	ld	-17 (ix),a
   59C3                    2808 00142$:
   59C3 DD CB EF 2E   [23] 2809 	sra	-17 (ix)
   59C7 DD CB EE 1E   [23] 2810 	rr	-18 (ix)
   59CB DD CB EF 2E   [23] 2811 	sra	-17 (ix)
   59CF DD CB EE 1E   [23] 2812 	rr	-18 (ix)
   59D3 DD CB EF 2E   [23] 2813 	sra	-17 (ix)
   59D7 DD CB EE 1E   [23] 2814 	rr	-18 (ix)
   59DB DD CB EF 2E   [23] 2815 	sra	-17 (ix)
   59DF DD CB EE 1E   [23] 2816 	rr	-18 (ix)
   59E3 DD 4E EE      [19] 2817 	ld	c,-18 (ix)
   59E6 DD 46 EF      [19] 2818 	ld	b,-17 (ix)
   59E9 69            [ 4] 2819 	ld	l, c
   59EA 60            [ 4] 2820 	ld	h, b
   59EB 29            [11] 2821 	add	hl, hl
   59EC 29            [11] 2822 	add	hl, hl
   59ED 09            [11] 2823 	add	hl, bc
   59EE 29            [11] 2824 	add	hl, hl
   59EF 29            [11] 2825 	add	hl, hl
   59F0 DD 75 EE      [19] 2826 	ld	-18 (ix),l
   59F3 DD 74 EF      [19] 2827 	ld	-17 (ix),h
   59F6 3E E0         [ 7] 2828 	ld	a,#<(_scene)
   59F8 DD 86 EE      [19] 2829 	add	a, -18 (ix)
   59FB DD 77 EE      [19] 2830 	ld	-18 (ix),a
   59FE 3E 8F         [ 7] 2831 	ld	a,#>(_scene)
   5A00 DD 8E EF      [19] 2832 	adc	a, -17 (ix)
   5A03 DD 77 EF      [19] 2833 	ld	-17 (ix),a
   5A06 DD 7E EA      [19] 2834 	ld	a,-22 (ix)
   5A09 DD 77 F0      [19] 2835 	ld	-16 (ix),a
   5A0C DD 7E EB      [19] 2836 	ld	a,-21 (ix)
   5A0F DD 77 F1      [19] 2837 	ld	-15 (ix),a
   5A12 DD 7E F5      [19] 2838 	ld	a,-11 (ix)
   5A15 B7            [ 4] 2839 	or	a, a
   5A16 28 0C         [12] 2840 	jr	Z,00143$
   5A18 DD 7E E8      [19] 2841 	ld	a,-24 (ix)
   5A1B DD 77 F0      [19] 2842 	ld	-16 (ix),a
   5A1E DD 7E E9      [19] 2843 	ld	a,-23 (ix)
   5A21 DD 77 F1      [19] 2844 	ld	-15 (ix),a
   5A24                    2845 00143$:
   5A24 DD CB F1 2E   [23] 2846 	sra	-15 (ix)
   5A28 DD CB F0 1E   [23] 2847 	rr	-16 (ix)
   5A2C DD CB F1 2E   [23] 2848 	sra	-15 (ix)
   5A30 DD CB F0 1E   [23] 2849 	rr	-16 (ix)
   5A34 DD 7E EE      [19] 2850 	ld	a,-18 (ix)
   5A37 DD 86 F0      [19] 2851 	add	a, -16 (ix)
   5A3A DD 77 EE      [19] 2852 	ld	-18 (ix),a
   5A3D DD 7E EF      [19] 2853 	ld	a,-17 (ix)
   5A40 DD 8E F1      [19] 2854 	adc	a, -15 (ix)
   5A43 DD 77 EF      [19] 2855 	ld	-17 (ix),a
   5A46 DD 6E EE      [19] 2856 	ld	l,-18 (ix)
   5A49 DD 66 EF      [19] 2857 	ld	h,-17 (ix)
   5A4C 7E            [ 7] 2858 	ld	a,(hl)
   5A4D 3D            [ 4] 2859 	dec	a
   5A4E 28 0B         [12] 2860 	jr	Z,00112$
                           2861 ;src/ia.h:52: enemy.x-=1;
   5A50 DD 56 E3      [19] 2862 	ld	d,-29 (ix)
   5A53 15            [ 4] 2863 	dec	d
   5A54 21 F1 90      [10] 2864 	ld	hl,#_enemy
   5A57 72            [ 7] 2865 	ld	(hl),d
   5A58 C3 95 5E      [10] 2866 	jp	00139$
   5A5B                    2867 00112$:
                           2868 ;src/ia.h:53: }else if(auxY < enemy.y){
   5A5B DD 7E FF      [19] 2869 	ld	a,-1 (ix)
   5A5E B7            [ 4] 2870 	or	a, a
   5A5F CA E9 5A      [10] 2871 	jp	Z,00109$
                           2872 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5A62 DD 7E FB      [19] 2873 	ld	a,-5 (ix)
   5A65 DD 77 EE      [19] 2874 	ld	-18 (ix),a
   5A68 DD 7E FC      [19] 2875 	ld	a,-4 (ix)
   5A6B DD 77 EF      [19] 2876 	ld	-17 (ix),a
   5A6E DD 7E FE      [19] 2877 	ld	a,-2 (ix)
   5A71 B7            [ 4] 2878 	or	a, a
   5A72 28 0C         [12] 2879 	jr	Z,00144$
   5A74 DD 7E F8      [19] 2880 	ld	a,-8 (ix)
   5A77 DD 77 EE      [19] 2881 	ld	-18 (ix),a
   5A7A DD 7E F9      [19] 2882 	ld	a,-7 (ix)
   5A7D DD 77 EF      [19] 2883 	ld	-17 (ix),a
   5A80                    2884 00144$:
   5A80 DD CB EF 2E   [23] 2885 	sra	-17 (ix)
   5A84 DD CB EE 1E   [23] 2886 	rr	-18 (ix)
   5A88 DD CB EF 2E   [23] 2887 	sra	-17 (ix)
   5A8C DD CB EE 1E   [23] 2888 	rr	-18 (ix)
   5A90 DD CB EF 2E   [23] 2889 	sra	-17 (ix)
   5A94 DD CB EE 1E   [23] 2890 	rr	-18 (ix)
   5A98 DD CB EF 2E   [23] 2891 	sra	-17 (ix)
   5A9C DD CB EE 1E   [23] 2892 	rr	-18 (ix)
   5AA0 DD 4E EE      [19] 2893 	ld	c,-18 (ix)
   5AA3 DD 46 EF      [19] 2894 	ld	b,-17 (ix)
   5AA6 69            [ 4] 2895 	ld	l, c
   5AA7 60            [ 4] 2896 	ld	h, b
   5AA8 29            [11] 2897 	add	hl, hl
   5AA9 29            [11] 2898 	add	hl, hl
   5AAA 09            [11] 2899 	add	hl, bc
   5AAB 29            [11] 2900 	add	hl, hl
   5AAC 29            [11] 2901 	add	hl, hl
   5AAD DD 75 EE      [19] 2902 	ld	-18 (ix),l
   5AB0 DD 74 EF      [19] 2903 	ld	-17 (ix),h
   5AB3 3E E0         [ 7] 2904 	ld	a,#<(_scene)
   5AB5 DD 86 EE      [19] 2905 	add	a, -18 (ix)
   5AB8 DD 77 EE      [19] 2906 	ld	-18 (ix),a
   5ABB 3E 8F         [ 7] 2907 	ld	a,#>(_scene)
   5ABD DD 8E EF      [19] 2908 	adc	a, -17 (ix)
   5AC0 DD 77 EF      [19] 2909 	ld	-17 (ix),a
   5AC3 DD 7E FD      [19] 2910 	ld	a,-3 (ix)
   5AC6 DD 86 EE      [19] 2911 	add	a, -18 (ix)
   5AC9 DD 77 EE      [19] 2912 	ld	-18 (ix),a
   5ACC 3E 00         [ 7] 2913 	ld	a,#0x00
   5ACE DD 8E EF      [19] 2914 	adc	a, -17 (ix)
   5AD1 DD 77 EF      [19] 2915 	ld	-17 (ix),a
   5AD4 DD 6E EE      [19] 2916 	ld	l,-18 (ix)
   5AD7 DD 66 EF      [19] 2917 	ld	h,-17 (ix)
   5ADA 7E            [ 7] 2918 	ld	a,(hl)
   5ADB 3D            [ 4] 2919 	dec	a
   5ADC CA 95 5E      [10] 2920 	jp	Z,00139$
                           2921 ;src/ia.h:55: enemy.y-=1;
   5ADF 21 F2 90      [10] 2922 	ld	hl,#(_enemy + 0x0001)
   5AE2 DD 7E ED      [19] 2923 	ld	a,-19 (ix)
   5AE5 77            [ 7] 2924 	ld	(hl),a
   5AE6 C3 95 5E      [10] 2925 	jp	00139$
   5AE9                    2926 00109$:
                           2927 ;src/ia.h:57: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5AE9 DD 7E E6      [19] 2928 	ld	a,-26 (ix)
   5AEC DD 77 EE      [19] 2929 	ld	-18 (ix),a
   5AEF DD 7E E7      [19] 2930 	ld	a,-25 (ix)
   5AF2 DD 77 EF      [19] 2931 	ld	-17 (ix),a
   5AF5 DD 7E F4      [19] 2932 	ld	a,-12 (ix)
   5AF8 B7            [ 4] 2933 	or	a, a
   5AF9 28 0C         [12] 2934 	jr	Z,00145$
   5AFB DD 7E F2      [19] 2935 	ld	a,-14 (ix)
   5AFE DD 77 EE      [19] 2936 	ld	-18 (ix),a
   5B01 DD 7E F3      [19] 2937 	ld	a,-13 (ix)
   5B04 DD 77 EF      [19] 2938 	ld	-17 (ix),a
   5B07                    2939 00145$:
   5B07 DD CB EF 2E   [23] 2940 	sra	-17 (ix)
   5B0B DD CB EE 1E   [23] 2941 	rr	-18 (ix)
   5B0F DD CB EF 2E   [23] 2942 	sra	-17 (ix)
   5B13 DD CB EE 1E   [23] 2943 	rr	-18 (ix)
   5B17 DD CB EF 2E   [23] 2944 	sra	-17 (ix)
   5B1B DD CB EE 1E   [23] 2945 	rr	-18 (ix)
   5B1F DD CB EF 2E   [23] 2946 	sra	-17 (ix)
   5B23 DD CB EE 1E   [23] 2947 	rr	-18 (ix)
   5B27 DD 4E EE      [19] 2948 	ld	c,-18 (ix)
   5B2A DD 46 EF      [19] 2949 	ld	b,-17 (ix)
   5B2D 69            [ 4] 2950 	ld	l, c
   5B2E 60            [ 4] 2951 	ld	h, b
   5B2F 29            [11] 2952 	add	hl, hl
   5B30 29            [11] 2953 	add	hl, hl
   5B31 09            [11] 2954 	add	hl, bc
   5B32 29            [11] 2955 	add	hl, hl
   5B33 29            [11] 2956 	add	hl, hl
   5B34 DD 75 EE      [19] 2957 	ld	-18 (ix),l
   5B37 DD 74 EF      [19] 2958 	ld	-17 (ix),h
   5B3A 3E E0         [ 7] 2959 	ld	a,#<(_scene)
   5B3C DD 86 EE      [19] 2960 	add	a, -18 (ix)
   5B3F DD 77 EE      [19] 2961 	ld	-18 (ix),a
   5B42 3E 8F         [ 7] 2962 	ld	a,#>(_scene)
   5B44 DD 8E EF      [19] 2963 	adc	a, -17 (ix)
   5B47 DD 77 EF      [19] 2964 	ld	-17 (ix),a
   5B4A DD 7E FD      [19] 2965 	ld	a,-3 (ix)
   5B4D DD 86 EE      [19] 2966 	add	a, -18 (ix)
   5B50 DD 77 EE      [19] 2967 	ld	-18 (ix),a
   5B53 3E 00         [ 7] 2968 	ld	a,#0x00
   5B55 DD 8E EF      [19] 2969 	adc	a, -17 (ix)
   5B58 DD 77 EF      [19] 2970 	ld	-17 (ix),a
   5B5B DD 6E EE      [19] 2971 	ld	l,-18 (ix)
   5B5E DD 66 EF      [19] 2972 	ld	h,-17 (ix)
   5B61 7E            [ 7] 2973 	ld	a,(hl)
   5B62 3D            [ 4] 2974 	dec	a
   5B63 CA 95 5E      [10] 2975 	jp	Z,00139$
                           2976 ;src/ia.h:58: enemy.y+=1;
   5B66 21 F2 90      [10] 2977 	ld	hl,#(_enemy + 0x0001)
   5B69 DD 7E EC      [19] 2978 	ld	a,-20 (ix)
   5B6C 77            [ 7] 2979 	ld	(hl),a
   5B6D C3 95 5E      [10] 2980 	jp	00139$
   5B70                    2981 00137$:
                           2982 ;src/ia.h:60: }else if(auxX > enemy.x){
   5B70 DD 7E E3      [19] 2983 	ld	a,-29 (ix)
   5B73 DD 96 E2      [19] 2984 	sub	a, -30 (ix)
   5B76 D2 7E 5D      [10] 2985 	jp	NC,00134$
                           2986 ;src/ia.h:61: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
   5B79 3E E0         [ 7] 2987 	ld	a,#<(_scene)
   5B7B DD 86 F6      [19] 2988 	add	a, -10 (ix)
   5B7E DD 77 EE      [19] 2989 	ld	-18 (ix),a
   5B81 3E 8F         [ 7] 2990 	ld	a,#>(_scene)
   5B83 DD 8E F7      [19] 2991 	adc	a, -9 (ix)
   5B86 DD 77 EF      [19] 2992 	ld	-17 (ix),a
   5B89 DD 7E E4      [19] 2993 	ld	a,-28 (ix)
   5B8C C6 04         [ 7] 2994 	add	a, #0x04
   5B8E DD 77 F0      [19] 2995 	ld	-16 (ix),a
   5B91 DD 7E E5      [19] 2996 	ld	a,-27 (ix)
   5B94 CE 00         [ 7] 2997 	adc	a, #0x00
   5B96 DD 77 F1      [19] 2998 	ld	-15 (ix),a
   5B99 DD 7E F0      [19] 2999 	ld	a,-16 (ix)
   5B9C DD 77 F6      [19] 3000 	ld	-10 (ix),a
   5B9F DD 7E F1      [19] 3001 	ld	a,-15 (ix)
   5BA2 DD 77 F7      [19] 3002 	ld	-9 (ix),a
   5BA5 DD 7E F1      [19] 3003 	ld	a,-15 (ix)
   5BA8 07            [ 4] 3004 	rlca
   5BA9 E6 01         [ 7] 3005 	and	a,#0x01
   5BAB DD 77 FA      [19] 3006 	ld	-6 (ix),a
   5BAE DD 7E E4      [19] 3007 	ld	a,-28 (ix)
   5BB1 C6 07         [ 7] 3008 	add	a, #0x07
   5BB3 DD 77 E4      [19] 3009 	ld	-28 (ix),a
   5BB6 DD 7E E5      [19] 3010 	ld	a,-27 (ix)
   5BB9 CE 00         [ 7] 3011 	adc	a, #0x00
   5BBB DD 77 E5      [19] 3012 	ld	-27 (ix),a
   5BBE DD 7E FA      [19] 3013 	ld	a,-6 (ix)
   5BC1 B7            [ 4] 3014 	or	a, a
   5BC2 28 0C         [12] 3015 	jr	Z,00146$
   5BC4 DD 7E E4      [19] 3016 	ld	a,-28 (ix)
   5BC7 DD 77 F6      [19] 3017 	ld	-10 (ix),a
   5BCA DD 7E E5      [19] 3018 	ld	a,-27 (ix)
   5BCD DD 77 F7      [19] 3019 	ld	-9 (ix),a
   5BD0                    3020 00146$:
   5BD0 DD 6E F6      [19] 3021 	ld	l,-10 (ix)
   5BD3 DD 66 F7      [19] 3022 	ld	h,-9 (ix)
   5BD6 CB 2C         [ 8] 3023 	sra	h
   5BD8 CB 1D         [ 8] 3024 	rr	l
   5BDA CB 2C         [ 8] 3025 	sra	h
   5BDC CB 1D         [ 8] 3026 	rr	l
   5BDE DD 5E EE      [19] 3027 	ld	e,-18 (ix)
   5BE1 DD 56 EF      [19] 3028 	ld	d,-17 (ix)
   5BE4 19            [11] 3029 	add	hl,de
   5BE5 7E            [ 7] 3030 	ld	a,(hl)
   5BE6 3D            [ 4] 3031 	dec	a
   5BE7 CA 96 5C      [10] 3032 	jp	Z,00123$
                           3033 ;src/ia.h:62: && scene[(enemy.y+tileheight)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   5BEA DD 7E E6      [19] 3034 	ld	a,-26 (ix)
   5BED DD 77 F6      [19] 3035 	ld	-10 (ix),a
   5BF0 DD 7E E7      [19] 3036 	ld	a,-25 (ix)
   5BF3 DD 77 F7      [19] 3037 	ld	-9 (ix),a
   5BF6 DD 7E F4      [19] 3038 	ld	a,-12 (ix)
   5BF9 B7            [ 4] 3039 	or	a, a
   5BFA 28 0C         [12] 3040 	jr	Z,00147$
   5BFC DD 7E F2      [19] 3041 	ld	a,-14 (ix)
   5BFF DD 77 F6      [19] 3042 	ld	-10 (ix),a
   5C02 DD 7E F3      [19] 3043 	ld	a,-13 (ix)
   5C05 DD 77 F7      [19] 3044 	ld	-9 (ix),a
   5C08                    3045 00147$:
   5C08 DD CB F7 2E   [23] 3046 	sra	-9 (ix)
   5C0C DD CB F6 1E   [23] 3047 	rr	-10 (ix)
   5C10 DD CB F7 2E   [23] 3048 	sra	-9 (ix)
   5C14 DD CB F6 1E   [23] 3049 	rr	-10 (ix)
   5C18 DD CB F7 2E   [23] 3050 	sra	-9 (ix)
   5C1C DD CB F6 1E   [23] 3051 	rr	-10 (ix)
   5C20 DD CB F7 2E   [23] 3052 	sra	-9 (ix)
   5C24 DD CB F6 1E   [23] 3053 	rr	-10 (ix)
   5C28 DD 4E F6      [19] 3054 	ld	c,-10 (ix)
   5C2B DD 46 F7      [19] 3055 	ld	b,-9 (ix)
   5C2E 69            [ 4] 3056 	ld	l, c
   5C2F 60            [ 4] 3057 	ld	h, b
   5C30 29            [11] 3058 	add	hl, hl
   5C31 29            [11] 3059 	add	hl, hl
   5C32 09            [11] 3060 	add	hl, bc
   5C33 29            [11] 3061 	add	hl, hl
   5C34 29            [11] 3062 	add	hl, hl
   5C35 DD 75 F6      [19] 3063 	ld	-10 (ix),l
   5C38 DD 74 F7      [19] 3064 	ld	-9 (ix),h
   5C3B 3E E0         [ 7] 3065 	ld	a,#<(_scene)
   5C3D DD 86 F6      [19] 3066 	add	a, -10 (ix)
   5C40 DD 77 F6      [19] 3067 	ld	-10 (ix),a
   5C43 3E 8F         [ 7] 3068 	ld	a,#>(_scene)
   5C45 DD 8E F7      [19] 3069 	adc	a, -9 (ix)
   5C48 DD 77 F7      [19] 3070 	ld	-9 (ix),a
   5C4B DD 7E FA      [19] 3071 	ld	a,-6 (ix)
   5C4E B7            [ 4] 3072 	or	a, a
   5C4F 28 0C         [12] 3073 	jr	Z,00148$
   5C51 DD 7E E4      [19] 3074 	ld	a,-28 (ix)
   5C54 DD 77 F0      [19] 3075 	ld	-16 (ix),a
   5C57 DD 7E E5      [19] 3076 	ld	a,-27 (ix)
   5C5A DD 77 F1      [19] 3077 	ld	-15 (ix),a
   5C5D                    3078 00148$:
   5C5D DD CB F1 2E   [23] 3079 	sra	-15 (ix)
   5C61 DD CB F0 1E   [23] 3080 	rr	-16 (ix)
   5C65 DD CB F1 2E   [23] 3081 	sra	-15 (ix)
   5C69 DD CB F0 1E   [23] 3082 	rr	-16 (ix)
   5C6D DD 7E F6      [19] 3083 	ld	a,-10 (ix)
   5C70 DD 86 F0      [19] 3084 	add	a, -16 (ix)
   5C73 DD 77 F0      [19] 3085 	ld	-16 (ix),a
   5C76 DD 7E F7      [19] 3086 	ld	a,-9 (ix)
   5C79 DD 8E F1      [19] 3087 	adc	a, -15 (ix)
   5C7C DD 77 F1      [19] 3088 	ld	-15 (ix),a
   5C7F DD 6E F0      [19] 3089 	ld	l,-16 (ix)
   5C82 DD 66 F1      [19] 3090 	ld	h,-15 (ix)
   5C85 7E            [ 7] 3091 	ld	a,(hl)
   5C86 DD 77 FA      [19] 3092 	ld	-6 (ix), a
   5C89 3D            [ 4] 3093 	dec	a
   5C8A 28 0A         [12] 3094 	jr	Z,00123$
                           3095 ;src/ia.h:63: enemy.x+=1;
   5C8C DD 7E E3      [19] 3096 	ld	a,-29 (ix)
   5C8F 3C            [ 4] 3097 	inc	a
   5C90 32 F1 90      [13] 3098 	ld	(#_enemy),a
   5C93 C3 95 5E      [10] 3099 	jp	00139$
   5C96                    3100 00123$:
                           3101 ;src/ia.h:64: }else if(auxY < enemy.y){
   5C96 DD 7E FF      [19] 3102 	ld	a,-1 (ix)
   5C99 B7            [ 4] 3103 	or	a, a
   5C9A 28 58         [12] 3104 	jr	Z,00120$
                           3105 ;src/ia.h:65: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   5C9C DD 7E EA      [19] 3106 	ld	a,-22 (ix)
   5C9F DD 77 F0      [19] 3107 	ld	-16 (ix),a
   5CA2 DD 7E EB      [19] 3108 	ld	a,-21 (ix)
   5CA5 DD 77 F1      [19] 3109 	ld	-15 (ix),a
   5CA8 DD 7E F5      [19] 3110 	ld	a,-11 (ix)
   5CAB B7            [ 4] 3111 	or	a, a
   5CAC 28 0C         [12] 3112 	jr	Z,00149$
   5CAE DD 7E E8      [19] 3113 	ld	a,-24 (ix)
   5CB1 DD 77 F0      [19] 3114 	ld	-16 (ix),a
   5CB4 DD 7E E9      [19] 3115 	ld	a,-23 (ix)
   5CB7 DD 77 F1      [19] 3116 	ld	-15 (ix),a
   5CBA                    3117 00149$:
   5CBA DD CB F1 2E   [23] 3118 	sra	-15 (ix)
   5CBE DD CB F0 1E   [23] 3119 	rr	-16 (ix)
   5CC2 DD CB F1 2E   [23] 3120 	sra	-15 (ix)
   5CC6 DD CB F0 1E   [23] 3121 	rr	-16 (ix)
   5CCA DD 7E F0      [19] 3122 	ld	a,-16 (ix)
   5CCD DD 86 EE      [19] 3123 	add	a, -18 (ix)
   5CD0 DD 77 EE      [19] 3124 	ld	-18 (ix),a
   5CD3 DD 7E F1      [19] 3125 	ld	a,-15 (ix)
   5CD6 DD 8E EF      [19] 3126 	adc	a, -17 (ix)
   5CD9 DD 77 EF      [19] 3127 	ld	-17 (ix),a
   5CDC DD 6E EE      [19] 3128 	ld	l,-18 (ix)
   5CDF DD 66 EF      [19] 3129 	ld	h,-17 (ix)
   5CE2 7E            [ 7] 3130 	ld	a,(hl)
   5CE3 DD 77 FA      [19] 3131 	ld	-6 (ix), a
   5CE6 3D            [ 4] 3132 	dec	a
   5CE7 CA 95 5E      [10] 3133 	jp	Z,00139$
                           3134 ;src/ia.h:66: enemy.y-=1;
   5CEA 21 F2 90      [10] 3135 	ld	hl,#(_enemy + 0x0001)
   5CED DD 7E ED      [19] 3136 	ld	a,-19 (ix)
   5CF0 77            [ 7] 3137 	ld	(hl),a
   5CF1 C3 95 5E      [10] 3138 	jp	00139$
   5CF4                    3139 00120$:
                           3140 ;src/ia.h:68: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5CF4 DD 7E E6      [19] 3141 	ld	a,-26 (ix)
   5CF7 DD 77 EE      [19] 3142 	ld	-18 (ix),a
   5CFA DD 7E E7      [19] 3143 	ld	a,-25 (ix)
   5CFD DD 77 EF      [19] 3144 	ld	-17 (ix),a
   5D00 DD 7E F4      [19] 3145 	ld	a,-12 (ix)
   5D03 B7            [ 4] 3146 	or	a, a
   5D04 28 0C         [12] 3147 	jr	Z,00150$
   5D06 DD 7E F2      [19] 3148 	ld	a,-14 (ix)
   5D09 DD 77 EE      [19] 3149 	ld	-18 (ix),a
   5D0C DD 7E F3      [19] 3150 	ld	a,-13 (ix)
   5D0F DD 77 EF      [19] 3151 	ld	-17 (ix),a
   5D12                    3152 00150$:
   5D12 DD CB EF 2E   [23] 3153 	sra	-17 (ix)
   5D16 DD CB EE 1E   [23] 3154 	rr	-18 (ix)
   5D1A DD CB EF 2E   [23] 3155 	sra	-17 (ix)
   5D1E DD CB EE 1E   [23] 3156 	rr	-18 (ix)
   5D22 DD CB EF 2E   [23] 3157 	sra	-17 (ix)
   5D26 DD CB EE 1E   [23] 3158 	rr	-18 (ix)
   5D2A DD CB EF 2E   [23] 3159 	sra	-17 (ix)
   5D2E DD CB EE 1E   [23] 3160 	rr	-18 (ix)
   5D32 DD 4E EE      [19] 3161 	ld	c,-18 (ix)
   5D35 DD 46 EF      [19] 3162 	ld	b,-17 (ix)
   5D38 69            [ 4] 3163 	ld	l, c
   5D39 60            [ 4] 3164 	ld	h, b
   5D3A 29            [11] 3165 	add	hl, hl
   5D3B 29            [11] 3166 	add	hl, hl
   5D3C 09            [11] 3167 	add	hl, bc
   5D3D 29            [11] 3168 	add	hl, hl
   5D3E 29            [11] 3169 	add	hl, hl
   5D3F DD 75 EE      [19] 3170 	ld	-18 (ix),l
   5D42 DD 74 EF      [19] 3171 	ld	-17 (ix),h
   5D45 3E E0         [ 7] 3172 	ld	a,#<(_scene)
   5D47 DD 86 EE      [19] 3173 	add	a, -18 (ix)
   5D4A DD 77 EE      [19] 3174 	ld	-18 (ix),a
   5D4D 3E 8F         [ 7] 3175 	ld	a,#>(_scene)
   5D4F DD 8E EF      [19] 3176 	adc	a, -17 (ix)
   5D52 DD 77 EF      [19] 3177 	ld	-17 (ix),a
   5D55 DD 7E EE      [19] 3178 	ld	a,-18 (ix)
   5D58 DD 86 FD      [19] 3179 	add	a, -3 (ix)
   5D5B DD 77 EE      [19] 3180 	ld	-18 (ix),a
   5D5E DD 7E EF      [19] 3181 	ld	a,-17 (ix)
   5D61 CE 00         [ 7] 3182 	adc	a, #0x00
   5D63 DD 77 EF      [19] 3183 	ld	-17 (ix),a
   5D66 DD 6E EE      [19] 3184 	ld	l,-18 (ix)
   5D69 DD 66 EF      [19] 3185 	ld	h,-17 (ix)
   5D6C 7E            [ 7] 3186 	ld	a,(hl)
   5D6D DD 77 FA      [19] 3187 	ld	-6 (ix), a
   5D70 3D            [ 4] 3188 	dec	a
   5D71 CA 95 5E      [10] 3189 	jp	Z,00139$
                           3190 ;src/ia.h:69: enemy.y+=1;
   5D74 21 F2 90      [10] 3191 	ld	hl,#(_enemy + 0x0001)
   5D77 DD 7E EC      [19] 3192 	ld	a,-20 (ix)
   5D7A 77            [ 7] 3193 	ld	(hl),a
   5D7B C3 95 5E      [10] 3194 	jp	00139$
   5D7E                    3195 00134$:
                           3196 ;src/ia.h:73: if(auxY < enemy.y){
   5D7E DD 7E FF      [19] 3197 	ld	a,-1 (ix)
   5D81 B7            [ 4] 3198 	or	a, a
   5D82 CA 0F 5E      [10] 3199 	jp	Z,00131$
                           3200 ;src/ia.h:74: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5D85 DD 7E FB      [19] 3201 	ld	a,-5 (ix)
   5D88 DD 77 EE      [19] 3202 	ld	-18 (ix),a
   5D8B DD 7E FC      [19] 3203 	ld	a,-4 (ix)
   5D8E DD 77 EF      [19] 3204 	ld	-17 (ix),a
   5D91 DD 7E FE      [19] 3205 	ld	a,-2 (ix)
   5D94 B7            [ 4] 3206 	or	a, a
   5D95 28 0C         [12] 3207 	jr	Z,00151$
   5D97 DD 7E F8      [19] 3208 	ld	a,-8 (ix)
   5D9A DD 77 EE      [19] 3209 	ld	-18 (ix),a
   5D9D DD 7E F9      [19] 3210 	ld	a,-7 (ix)
   5DA0 DD 77 EF      [19] 3211 	ld	-17 (ix),a
   5DA3                    3212 00151$:
   5DA3 DD CB EF 2E   [23] 3213 	sra	-17 (ix)
   5DA7 DD CB EE 1E   [23] 3214 	rr	-18 (ix)
   5DAB DD CB EF 2E   [23] 3215 	sra	-17 (ix)
   5DAF DD CB EE 1E   [23] 3216 	rr	-18 (ix)
   5DB3 DD CB EF 2E   [23] 3217 	sra	-17 (ix)
   5DB7 DD CB EE 1E   [23] 3218 	rr	-18 (ix)
   5DBB DD CB EF 2E   [23] 3219 	sra	-17 (ix)
   5DBF DD CB EE 1E   [23] 3220 	rr	-18 (ix)
   5DC3 DD 4E EE      [19] 3221 	ld	c,-18 (ix)
   5DC6 DD 46 EF      [19] 3222 	ld	b,-17 (ix)
   5DC9 69            [ 4] 3223 	ld	l, c
   5DCA 60            [ 4] 3224 	ld	h, b
   5DCB 29            [11] 3225 	add	hl, hl
   5DCC 29            [11] 3226 	add	hl, hl
   5DCD 09            [11] 3227 	add	hl, bc
   5DCE 29            [11] 3228 	add	hl, hl
   5DCF 29            [11] 3229 	add	hl, hl
   5DD0 DD 75 EE      [19] 3230 	ld	-18 (ix),l
   5DD3 DD 74 EF      [19] 3231 	ld	-17 (ix),h
   5DD6 3E E0         [ 7] 3232 	ld	a,#<(_scene)
   5DD8 DD 86 EE      [19] 3233 	add	a, -18 (ix)
   5DDB DD 77 EE      [19] 3234 	ld	-18 (ix),a
   5DDE 3E 8F         [ 7] 3235 	ld	a,#>(_scene)
   5DE0 DD 8E EF      [19] 3236 	adc	a, -17 (ix)
   5DE3 DD 77 EF      [19] 3237 	ld	-17 (ix),a
   5DE6 DD 7E EE      [19] 3238 	ld	a,-18 (ix)
   5DE9 DD 86 FD      [19] 3239 	add	a, -3 (ix)
   5DEC DD 77 EE      [19] 3240 	ld	-18 (ix),a
   5DEF DD 7E EF      [19] 3241 	ld	a,-17 (ix)
   5DF2 CE 00         [ 7] 3242 	adc	a, #0x00
   5DF4 DD 77 EF      [19] 3243 	ld	-17 (ix),a
   5DF7 DD 6E EE      [19] 3244 	ld	l,-18 (ix)
   5DFA DD 66 EF      [19] 3245 	ld	h,-17 (ix)
   5DFD 7E            [ 7] 3246 	ld	a,(hl)
   5DFE DD 77 FA      [19] 3247 	ld	-6 (ix), a
   5E01 3D            [ 4] 3248 	dec	a
   5E02 CA 95 5E      [10] 3249 	jp	Z,00139$
                           3250 ;src/ia.h:75: enemy.y-=1;
   5E05 21 F2 90      [10] 3251 	ld	hl,#(_enemy + 0x0001)
   5E08 DD 7E ED      [19] 3252 	ld	a,-19 (ix)
   5E0B 77            [ 7] 3253 	ld	(hl),a
   5E0C C3 95 5E      [10] 3254 	jp	00139$
   5E0F                    3255 00131$:
                           3256 ;src/ia.h:77: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5E0F DD 7E E6      [19] 3257 	ld	a,-26 (ix)
   5E12 DD 77 EE      [19] 3258 	ld	-18 (ix),a
   5E15 DD 7E E7      [19] 3259 	ld	a,-25 (ix)
   5E18 DD 77 EF      [19] 3260 	ld	-17 (ix),a
   5E1B DD 7E F4      [19] 3261 	ld	a,-12 (ix)
   5E1E B7            [ 4] 3262 	or	a, a
   5E1F 28 0C         [12] 3263 	jr	Z,00152$
   5E21 DD 7E F2      [19] 3264 	ld	a,-14 (ix)
   5E24 DD 77 EE      [19] 3265 	ld	-18 (ix),a
   5E27 DD 7E F3      [19] 3266 	ld	a,-13 (ix)
   5E2A DD 77 EF      [19] 3267 	ld	-17 (ix),a
   5E2D                    3268 00152$:
   5E2D DD CB EF 2E   [23] 3269 	sra	-17 (ix)
   5E31 DD CB EE 1E   [23] 3270 	rr	-18 (ix)
   5E35 DD CB EF 2E   [23] 3271 	sra	-17 (ix)
   5E39 DD CB EE 1E   [23] 3272 	rr	-18 (ix)
   5E3D DD CB EF 2E   [23] 3273 	sra	-17 (ix)
   5E41 DD CB EE 1E   [23] 3274 	rr	-18 (ix)
   5E45 DD CB EF 2E   [23] 3275 	sra	-17 (ix)
   5E49 DD CB EE 1E   [23] 3276 	rr	-18 (ix)
   5E4D DD 4E EE      [19] 3277 	ld	c,-18 (ix)
   5E50 DD 46 EF      [19] 3278 	ld	b,-17 (ix)
   5E53 69            [ 4] 3279 	ld	l, c
   5E54 60            [ 4] 3280 	ld	h, b
   5E55 29            [11] 3281 	add	hl, hl
   5E56 29            [11] 3282 	add	hl, hl
   5E57 09            [11] 3283 	add	hl, bc
   5E58 29            [11] 3284 	add	hl, hl
   5E59 29            [11] 3285 	add	hl, hl
   5E5A DD 75 EE      [19] 3286 	ld	-18 (ix),l
   5E5D DD 74 EF      [19] 3287 	ld	-17 (ix),h
   5E60 3E E0         [ 7] 3288 	ld	a,#<(_scene)
   5E62 DD 86 EE      [19] 3289 	add	a, -18 (ix)
   5E65 DD 77 EE      [19] 3290 	ld	-18 (ix),a
   5E68 3E 8F         [ 7] 3291 	ld	a,#>(_scene)
   5E6A DD 8E EF      [19] 3292 	adc	a, -17 (ix)
   5E6D DD 77 EF      [19] 3293 	ld	-17 (ix),a
   5E70 DD 7E FD      [19] 3294 	ld	a,-3 (ix)
   5E73 DD 86 EE      [19] 3295 	add	a, -18 (ix)
   5E76 DD 77 EE      [19] 3296 	ld	-18 (ix),a
   5E79 3E 00         [ 7] 3297 	ld	a,#0x00
   5E7B DD 8E EF      [19] 3298 	adc	a, -17 (ix)
   5E7E DD 77 EF      [19] 3299 	ld	-17 (ix),a
   5E81 DD 6E EE      [19] 3300 	ld	l,-18 (ix)
   5E84 DD 66 EF      [19] 3301 	ld	h,-17 (ix)
   5E87 7E            [ 7] 3302 	ld	a,(hl)
   5E88 DD 77 FA      [19] 3303 	ld	-6 (ix), a
   5E8B 3D            [ 4] 3304 	dec	a
   5E8C 28 07         [12] 3305 	jr	Z,00139$
                           3306 ;src/ia.h:78: enemy.y+=1;
   5E8E 21 F2 90      [10] 3307 	ld	hl,#(_enemy + 0x0001)
   5E91 DD 7E EC      [19] 3308 	ld	a,-20 (ix)
   5E94 77            [ 7] 3309 	ld	(hl),a
   5E95                    3310 00139$:
   5E95 DD F9         [10] 3311 	ld	sp, ix
   5E97 DD E1         [14] 3312 	pop	ix
   5E99 C9            [10] 3313 	ret
                           3314 ;src/ia.h:83: void patrol(){
                           3315 ;	---------------------------------
                           3316 ; Function patrol
                           3317 ; ---------------------------------
   5E9A                    3318 _patrol::
   5E9A DD E5         [15] 3319 	push	ix
   5E9C DD 21 00 00   [14] 3320 	ld	ix,#0
   5EA0 DD 39         [15] 3321 	add	ix,sp
   5EA2 21 F4 FF      [10] 3322 	ld	hl,#-12
   5EA5 39            [11] 3323 	add	hl,sp
   5EA6 F9            [ 6] 3324 	ld	sp,hl
                           3325 ;src/ia.h:84: movement(enemy.dir);
   5EA7 3A FA 90      [13] 3326 	ld	a, (#(_enemy + 0x0009) + 0)
   5EAA F5            [11] 3327 	push	af
   5EAB 33            [ 6] 3328 	inc	sp
   5EAC CD E4 57      [17] 3329 	call	_movement
   5EAF 33            [ 6] 3330 	inc	sp
                           3331 ;src/ia.h:86: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   5EB0 3A F2 90      [13] 3332 	ld	a,(#_enemy + 1)
   5EB3 DD 77 F6      [19] 3333 	ld	-10 (ix), a
   5EB6 07            [ 4] 3334 	rlca
   5EB7 07            [ 4] 3335 	rlca
   5EB8 07            [ 4] 3336 	rlca
   5EB9 07            [ 4] 3337 	rlca
   5EBA E6 0F         [ 7] 3338 	and	a,#0x0F
   5EBC 4F            [ 4] 3339 	ld	c,a
   5EBD 06 00         [ 7] 3340 	ld	b,#0x00
   5EBF 69            [ 4] 3341 	ld	l, c
   5EC0 60            [ 4] 3342 	ld	h, b
   5EC1 29            [11] 3343 	add	hl, hl
   5EC2 29            [11] 3344 	add	hl, hl
   5EC3 09            [11] 3345 	add	hl, bc
   5EC4 29            [11] 3346 	add	hl, hl
   5EC5 29            [11] 3347 	add	hl, hl
   5EC6 3E E0         [ 7] 3348 	ld	a,#<(_scene)
   5EC8 85            [ 4] 3349 	add	a, l
   5EC9 DD 77 F4      [19] 3350 	ld	-12 (ix),a
   5ECC 3E 8F         [ 7] 3351 	ld	a,#>(_scene)
   5ECE 8C            [ 4] 3352 	adc	a, h
   5ECF DD 77 F5      [19] 3353 	ld	-11 (ix),a
   5ED2 3A F1 90      [13] 3354 	ld	a,(#_enemy + 0)
   5ED5 DD 77 FC      [19] 3355 	ld	-4 (ix), a
   5ED8 0F            [ 4] 3356 	rrca
   5ED9 0F            [ 4] 3357 	rrca
   5EDA E6 3F         [ 7] 3358 	and	a,#0x3F
   5EDC DD 77 F9      [19] 3359 	ld	-7 (ix),a
   5EDF DD 7E F4      [19] 3360 	ld	a,-12 (ix)
   5EE2 DD 86 F9      [19] 3361 	add	a, -7 (ix)
   5EE5 5F            [ 4] 3362 	ld	e,a
   5EE6 DD 7E F5      [19] 3363 	ld	a,-11 (ix)
   5EE9 CE 00         [ 7] 3364 	adc	a, #0x00
   5EEB 57            [ 4] 3365 	ld	d,a
   5EEC 3A FB 90      [13] 3366 	ld	a,(#_enemy + 10)
   5EEF DD 77 FD      [19] 3367 	ld	-3 (ix),a
   5EF2 1A            [ 7] 3368 	ld	a,(de)
   5EF3 57            [ 4] 3369 	ld	d,a
   5EF4 DD 7E FD      [19] 3370 	ld	a,-3 (ix)
   5EF7 92            [ 4] 3371 	sub	a, d
   5EF8 C2 F4 5F      [10] 3372 	jp	NZ,00106$
                           3373 ;src/ia.h:87: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5EFB DD 5E FC      [19] 3374 	ld	e,-4 (ix)
   5EFE 16 00         [ 7] 3375 	ld	d,#0x00
   5F00 21 03 00      [10] 3376 	ld	hl,#0x0003
   5F03 19            [11] 3377 	add	hl,de
   5F04 DD 75 F7      [19] 3378 	ld	-9 (ix),l
   5F07 DD 74 F8      [19] 3379 	ld	-8 (ix),h
   5F0A DD 7E F7      [19] 3380 	ld	a,-9 (ix)
   5F0D DD 77 FE      [19] 3381 	ld	-2 (ix),a
   5F10 DD 7E F8      [19] 3382 	ld	a,-8 (ix)
   5F13 DD 77 FF      [19] 3383 	ld	-1 (ix),a
   5F16 DD 7E F8      [19] 3384 	ld	a,-8 (ix)
   5F19 07            [ 4] 3385 	rlca
   5F1A E6 01         [ 7] 3386 	and	a,#0x01
   5F1C DD 77 FC      [19] 3387 	ld	-4 (ix),a
   5F1F 21 06 00      [10] 3388 	ld	hl,#0x0006
   5F22 19            [11] 3389 	add	hl,de
   5F23 DD 75 FA      [19] 3390 	ld	-6 (ix),l
   5F26 DD 74 FB      [19] 3391 	ld	-5 (ix),h
   5F29 DD 7E FC      [19] 3392 	ld	a,-4 (ix)
   5F2C B7            [ 4] 3393 	or	a, a
   5F2D 28 0C         [12] 3394 	jr	Z,00113$
   5F2F DD 7E FA      [19] 3395 	ld	a,-6 (ix)
   5F32 DD 77 FE      [19] 3396 	ld	-2 (ix),a
   5F35 DD 7E FB      [19] 3397 	ld	a,-5 (ix)
   5F38 DD 77 FF      [19] 3398 	ld	-1 (ix),a
   5F3B                    3399 00113$:
   5F3B DD 6E FE      [19] 3400 	ld	l,-2 (ix)
   5F3E DD 66 FF      [19] 3401 	ld	h,-1 (ix)
   5F41 CB 2C         [ 8] 3402 	sra	h
   5F43 CB 1D         [ 8] 3403 	rr	l
   5F45 CB 2C         [ 8] 3404 	sra	h
   5F47 CB 1D         [ 8] 3405 	rr	l
   5F49 D1            [10] 3406 	pop	de
   5F4A D5            [11] 3407 	push	de
   5F4B 19            [11] 3408 	add	hl,de
   5F4C DD 7E FD      [19] 3409 	ld	a,-3 (ix)
   5F4F 96            [ 7] 3410 	sub	a,(hl)
   5F50 C2 F4 5F      [10] 3411 	jp	NZ,00106$
                           3412 ;src/ia.h:88: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   5F53 DD 5E F6      [19] 3413 	ld	e,-10 (ix)
   5F56 16 00         [ 7] 3414 	ld	d,#0x00
   5F58 21 0E 00      [10] 3415 	ld	hl,#0x000E
   5F5B 19            [11] 3416 	add	hl,de
   5F5C 4D            [ 4] 3417 	ld	c,l
   5F5D 44            [ 4] 3418 	ld	b,h
   5F5E 69            [ 4] 3419 	ld	l, c
   5F5F 78            [ 4] 3420 	ld	a,b
   5F60 67            [ 4] 3421 	ld	h,a
   5F61 07            [ 4] 3422 	rlca
   5F62 E6 01         [ 7] 3423 	and	a,#0x01
   5F64 DD 77 FE      [19] 3424 	ld	-2 (ix),a
   5F67 7B            [ 4] 3425 	ld	a,e
   5F68 C6 1D         [ 7] 3426 	add	a, #0x1D
   5F6A DD 77 F4      [19] 3427 	ld	-12 (ix),a
   5F6D 7A            [ 4] 3428 	ld	a,d
   5F6E CE 00         [ 7] 3429 	adc	a, #0x00
   5F70 DD 77 F5      [19] 3430 	ld	-11 (ix),a
   5F73 DD 7E FE      [19] 3431 	ld	a,-2 (ix)
   5F76 B7            [ 4] 3432 	or	a, a
   5F77 28 02         [12] 3433 	jr	Z,00114$
   5F79 E1            [10] 3434 	pop	hl
   5F7A E5            [11] 3435 	push	hl
   5F7B                    3436 00114$:
   5F7B CB 2C         [ 8] 3437 	sra	h
   5F7D CB 1D         [ 8] 3438 	rr	l
   5F7F CB 2C         [ 8] 3439 	sra	h
   5F81 CB 1D         [ 8] 3440 	rr	l
   5F83 CB 2C         [ 8] 3441 	sra	h
   5F85 CB 1D         [ 8] 3442 	rr	l
   5F87 CB 2C         [ 8] 3443 	sra	h
   5F89 CB 1D         [ 8] 3444 	rr	l
   5F8B 5D            [ 4] 3445 	ld	e, l
   5F8C 54            [ 4] 3446 	ld	d, h
   5F8D 29            [11] 3447 	add	hl, hl
   5F8E 29            [11] 3448 	add	hl, hl
   5F8F 19            [11] 3449 	add	hl, de
   5F90 29            [11] 3450 	add	hl, hl
   5F91 29            [11] 3451 	add	hl, hl
   5F92 11 E0 8F      [10] 3452 	ld	de,#_scene
   5F95 19            [11] 3453 	add	hl,de
   5F96 DD 5E F9      [19] 3454 	ld	e,-7 (ix)
   5F99 16 00         [ 7] 3455 	ld	d,#0x00
   5F9B 19            [11] 3456 	add	hl,de
   5F9C DD 7E FD      [19] 3457 	ld	a,-3 (ix)
   5F9F 96            [ 7] 3458 	sub	a,(hl)
   5FA0 20 52         [12] 3459 	jr	NZ,00106$
                           3460 ;src/ia.h:89: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5FA2 DD 7E FE      [19] 3461 	ld	a,-2 (ix)
   5FA5 B7            [ 4] 3462 	or	a, a
   5FA6 28 02         [12] 3463 	jr	Z,00115$
   5FA8 C1            [10] 3464 	pop	bc
   5FA9 C5            [11] 3465 	push	bc
   5FAA                    3466 00115$:
   5FAA CB 28         [ 8] 3467 	sra	b
   5FAC CB 19         [ 8] 3468 	rr	c
   5FAE CB 28         [ 8] 3469 	sra	b
   5FB0 CB 19         [ 8] 3470 	rr	c
   5FB2 CB 28         [ 8] 3471 	sra	b
   5FB4 CB 19         [ 8] 3472 	rr	c
   5FB6 CB 28         [ 8] 3473 	sra	b
   5FB8 CB 19         [ 8] 3474 	rr	c
   5FBA 69            [ 4] 3475 	ld	l, c
   5FBB 60            [ 4] 3476 	ld	h, b
   5FBC 29            [11] 3477 	add	hl, hl
   5FBD 29            [11] 3478 	add	hl, hl
   5FBE 09            [11] 3479 	add	hl, bc
   5FBF 29            [11] 3480 	add	hl, hl
   5FC0 29            [11] 3481 	add	hl, hl
   5FC1 3E E0         [ 7] 3482 	ld	a,#<(_scene)
   5FC3 85            [ 4] 3483 	add	a, l
   5FC4 DD 77 FE      [19] 3484 	ld	-2 (ix),a
   5FC7 3E 8F         [ 7] 3485 	ld	a,#>(_scene)
   5FC9 8C            [ 4] 3486 	adc	a, h
   5FCA DD 77 FF      [19] 3487 	ld	-1 (ix),a
   5FCD DD 5E F7      [19] 3488 	ld	e,-9 (ix)
   5FD0 DD 56 F8      [19] 3489 	ld	d,-8 (ix)
   5FD3 DD 7E FC      [19] 3490 	ld	a,-4 (ix)
   5FD6 B7            [ 4] 3491 	or	a, a
   5FD7 28 06         [12] 3492 	jr	Z,00116$
   5FD9 DD 5E FA      [19] 3493 	ld	e,-6 (ix)
   5FDC DD 56 FB      [19] 3494 	ld	d,-5 (ix)
   5FDF                    3495 00116$:
   5FDF CB 2A         [ 8] 3496 	sra	d
   5FE1 CB 1B         [ 8] 3497 	rr	e
   5FE3 CB 2A         [ 8] 3498 	sra	d
   5FE5 CB 1B         [ 8] 3499 	rr	e
   5FE7 DD 6E FE      [19] 3500 	ld	l,-2 (ix)
   5FEA DD 66 FF      [19] 3501 	ld	h,-1 (ix)
   5FED 19            [11] 3502 	add	hl,de
   5FEE DD 7E FD      [19] 3503 	ld	a,-3 (ix)
   5FF1 96            [ 7] 3504 	sub	a,(hl)
   5FF2 28 3B         [12] 3505 	jr	Z,00111$
   5FF4                    3506 00106$:
                           3507 ;src/ia.h:91: switch(enemy.dir){
   5FF4 3A FA 90      [13] 3508 	ld	a,(#(_enemy + 0x0009) + 0)
   5FF7 FE 02         [ 7] 3509 	cp	a,#0x02
   5FF9 28 22         [12] 3510 	jr	Z,00103$
   5FFB FE 04         [ 7] 3511 	cp	a,#0x04
   5FFD 28 0A         [12] 3512 	jr	Z,00101$
   5FFF FE 06         [ 7] 3513 	cp	a,#0x06
   6001 28 10         [12] 3514 	jr	Z,00102$
   6003 D6 08         [ 7] 3515 	sub	a, #0x08
   6005 28 20         [12] 3516 	jr	Z,00104$
   6007 18 26         [12] 3517 	jr	00111$
                           3518 ;src/ia.h:92: case 4:
   6009                    3519 00101$:
                           3520 ;src/ia.h:93: movement(6);
   6009 3E 06         [ 7] 3521 	ld	a,#0x06
   600B F5            [11] 3522 	push	af
   600C 33            [ 6] 3523 	inc	sp
   600D CD E4 57      [17] 3524 	call	_movement
   6010 33            [ 6] 3525 	inc	sp
                           3526 ;src/ia.h:94: break;
   6011 18 1C         [12] 3527 	jr	00111$
                           3528 ;src/ia.h:95: case 6:
   6013                    3529 00102$:
                           3530 ;src/ia.h:96: movement(4);
   6013 3E 04         [ 7] 3531 	ld	a,#0x04
   6015 F5            [11] 3532 	push	af
   6016 33            [ 6] 3533 	inc	sp
   6017 CD E4 57      [17] 3534 	call	_movement
   601A 33            [ 6] 3535 	inc	sp
                           3536 ;src/ia.h:97: break;
   601B 18 12         [12] 3537 	jr	00111$
                           3538 ;src/ia.h:98: case 2:
   601D                    3539 00103$:
                           3540 ;src/ia.h:99: movement(8);
   601D 3E 08         [ 7] 3541 	ld	a,#0x08
   601F F5            [11] 3542 	push	af
   6020 33            [ 6] 3543 	inc	sp
   6021 CD E4 57      [17] 3544 	call	_movement
   6024 33            [ 6] 3545 	inc	sp
                           3546 ;src/ia.h:100: break;
   6025 18 08         [12] 3547 	jr	00111$
                           3548 ;src/ia.h:101: case 8:
   6027                    3549 00104$:
                           3550 ;src/ia.h:102: movement(2);
   6027 3E 02         [ 7] 3551 	ld	a,#0x02
   6029 F5            [11] 3552 	push	af
   602A 33            [ 6] 3553 	inc	sp
   602B CD E4 57      [17] 3554 	call	_movement
   602E 33            [ 6] 3555 	inc	sp
                           3556 ;src/ia.h:104: }
   602F                    3557 00111$:
   602F DD F9         [10] 3558 	ld	sp, ix
   6031 DD E1         [14] 3559 	pop	ix
   6033 C9            [10] 3560 	ret
                           3561 ;src/ia.h:108: void move(){
                           3562 ;	---------------------------------
                           3563 ; Function move
                           3564 ; ---------------------------------
   6034                    3565 _move::
                           3566 ;src/ia.h:110: if(temp > 10){
   6034 3E 0A         [ 7] 3567 	ld	a,#0x0A
   6036 FD 21 D0 90   [14] 3568 	ld	iy,#_temp
   603A FD 96 00      [19] 3569 	sub	a, 0 (iy)
   603D 30 45         [12] 3570 	jr	NC,00117$
                           3571 ;src/ia.h:111: following = detectPlayerRoom(player.x,player.y);
   603F 3A E7 90      [13] 3572 	ld	a, (#_player + 1)
   6042 21 E6 90      [10] 3573 	ld	hl, #_player + 0
   6045 56            [ 7] 3574 	ld	d,(hl)
   6046 F5            [11] 3575 	push	af
   6047 33            [ 6] 3576 	inc	sp
   6048 D5            [11] 3577 	push	de
   6049 33            [ 6] 3578 	inc	sp
   604A CD 79 57      [17] 3579 	call	_detectPlayerRoom
   604D F1            [10] 3580 	pop	af
   604E FD 21 D5 90   [14] 3581 	ld	iy,#_following
   6052 FD 75 00      [19] 3582 	ld	0 (iy),l
                           3583 ;src/ia.h:112: if(following == enemy.room || enemy.pursue != 0){
   6055 21 FB 90      [10] 3584 	ld	hl, #_enemy + 10
   6058 56            [ 7] 3585 	ld	d,(hl)
   6059 01 FE 90      [10] 3586 	ld	bc,#_enemy + 13
   605C 0A            [ 7] 3587 	ld	a,(bc)
   605D 5F            [ 4] 3588 	ld	e,a
   605E 3A D5 90      [13] 3589 	ld	a,(#_following + 0)
   6061 92            [ 4] 3590 	sub	a, d
   6062 28 04         [12] 3591 	jr	Z,00106$
   6064 7B            [ 4] 3592 	ld	a,e
   6065 B7            [ 4] 3593 	or	a, a
   6066 28 13         [12] 3594 	jr	Z,00107$
   6068                    3595 00106$:
                           3596 ;src/ia.h:113: if(enemy.pursue == 0)
   6068 7B            [ 4] 3597 	ld	a,e
   6069 B7            [ 4] 3598 	or	a, a
   606A 20 05         [12] 3599 	jr	NZ,00104$
                           3600 ;src/ia.h:114: enemy.pursue = 4;
   606C 3E 04         [ 7] 3601 	ld	a,#0x04
   606E 02            [ 7] 3602 	ld	(bc),a
   606F 18 3F         [12] 3603 	jr	00118$
   6071                    3604 00104$:
                           3605 ;src/ia.h:115: else if(enemy.pursue > 1)
   6071 3E 01         [ 7] 3606 	ld	a,#0x01
   6073 93            [ 4] 3607 	sub	a, e
   6074 30 3A         [12] 3608 	jr	NC,00118$
                           3609 ;src/ia.h:116: enemy.pursue -=1;
   6076 1D            [ 4] 3610 	dec	e
   6077 7B            [ 4] 3611 	ld	a,e
   6078 02            [ 7] 3612 	ld	(bc),a
   6079 18 35         [12] 3613 	jr	00118$
   607B                    3614 00107$:
                           3615 ;src/ia.h:118: enemy.dir = chooseDirection();
   607B CD A6 57      [17] 3616 	call	_chooseDirection
   607E 7D            [ 4] 3617 	ld	a,l
   607F 32 FA 90      [13] 3618 	ld	(#(_enemy + 0x0009)),a
   6082 18 2C         [12] 3619 	jr	00118$
   6084                    3620 00117$:
                           3621 ;src/ia.h:121: if(enemy.pursue >= 1){
   6084 3A FE 90      [13] 3622 	ld	a,(#(_enemy + 0x000d) + 0)
   6087 D6 01         [ 7] 3623 	sub	a, #0x01
   6089 38 22         [12] 3624 	jr	C,00114$
                           3625 ;src/ia.h:122: followPlayer();
   608B CD 24 58      [17] 3626 	call	_followPlayer
                           3627 ;src/ia.h:123: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   608E 21 FC 90      [10] 3628 	ld	hl, #_enemy + 11
   6091 56            [ 7] 3629 	ld	d,(hl)
   6092 21 F1 90      [10] 3630 	ld	hl, #_enemy + 0
   6095 5E            [ 7] 3631 	ld	e,(hl)
   6096 7A            [ 4] 3632 	ld	a,d
   6097 93            [ 4] 3633 	sub	a, e
   6098 20 16         [12] 3634 	jr	NZ,00118$
   609A 21 FD 90      [10] 3635 	ld	hl, #_enemy + 12
   609D 56            [ 7] 3636 	ld	d,(hl)
   609E 21 F2 90      [10] 3637 	ld	hl, #_enemy + 1
   60A1 5E            [ 7] 3638 	ld	e,(hl)
   60A2 7A            [ 4] 3639 	ld	a,d
   60A3 93            [ 4] 3640 	sub	a, e
   60A4 20 0A         [12] 3641 	jr	NZ,00118$
                           3642 ;src/ia.h:124: enemy.pursue = 0;
   60A6 21 FE 90      [10] 3643 	ld	hl,#(_enemy + 0x000d)
   60A9 36 00         [10] 3644 	ld	(hl),#0x00
   60AB 18 03         [12] 3645 	jr	00118$
   60AD                    3646 00114$:
                           3647 ;src/ia.h:126: patrol();
   60AD CD 9A 5E      [17] 3648 	call	_patrol
   60B0                    3649 00118$:
                           3650 ;src/ia.h:129: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   60B0 21 F4 90      [10] 3651 	ld	hl, #_enemy + 3
   60B3 56            [ 7] 3652 	ld	d,(hl)
   60B4 3A F3 90      [13] 3653 	ld	a, (#_enemy + 2)
   60B7 D5            [11] 3654 	push	de
   60B8 33            [ 6] 3655 	inc	sp
   60B9 F5            [11] 3656 	push	af
   60BA 33            [ 6] 3657 	inc	sp
   60BB CD 79 57      [17] 3658 	call	_detectPlayerRoom
   60BE F1            [10] 3659 	pop	af
   60BF 55            [ 4] 3660 	ld	d,l
   60C0 3A E7 90      [13] 3661 	ld	a, (#(_player + 0x0001) + 0)
   60C3 21 E6 90      [10] 3662 	ld	hl, #_player + 0
   60C6 46            [ 7] 3663 	ld	b,(hl)
   60C7 D5            [11] 3664 	push	de
   60C8 F5            [11] 3665 	push	af
   60C9 33            [ 6] 3666 	inc	sp
   60CA C5            [11] 3667 	push	bc
   60CB 33            [ 6] 3668 	inc	sp
   60CC CD 79 57      [17] 3669 	call	_detectPlayerRoom
   60CF F1            [10] 3670 	pop	af
   60D0 45            [ 4] 3671 	ld	b,l
   60D1 D1            [10] 3672 	pop	de
   60D2 7A            [ 4] 3673 	ld	a,d
   60D3 90            [ 4] 3674 	sub	a, b
   60D4 28 09         [12] 3675 	jr	Z,00119$
   60D6 21 FE 90      [10] 3676 	ld	hl, #_enemy + 13
   60D9 66            [ 7] 3677 	ld	h,(hl)
   60DA 3E 01         [ 7] 3678 	ld	a,#0x01
   60DC 94            [ 4] 3679 	sub	a, h
   60DD 30 0E         [12] 3680 	jr	NC,00120$
   60DF                    3681 00119$:
                           3682 ;src/ia.h:130: enemy.seenX = player.x;
   60DF 11 FC 90      [10] 3683 	ld	de,#_enemy + 11
   60E2 3A E6 90      [13] 3684 	ld	a, (#_player + 0)
   60E5 12            [ 7] 3685 	ld	(de),a
                           3686 ;src/ia.h:131: enemy.seenY = player.y;
   60E6 11 FD 90      [10] 3687 	ld	de,#_enemy + 12
   60E9 3A E7 90      [13] 3688 	ld	a, (#(_player + 0x0001) + 0)
   60EC 12            [ 7] 3689 	ld	(de),a
   60ED                    3690 00120$:
                           3691 ;src/ia.h:133: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   60ED 3A F2 90      [13] 3692 	ld	a, (#_enemy + 1)
   60F0 21 F1 90      [10] 3693 	ld	hl, #_enemy + 0
   60F3 56            [ 7] 3694 	ld	d,(hl)
   60F4 F5            [11] 3695 	push	af
   60F5 33            [ 6] 3696 	inc	sp
   60F6 D5            [11] 3697 	push	de
   60F7 33            [ 6] 3698 	inc	sp
   60F8 CD 79 57      [17] 3699 	call	_detectPlayerRoom
   60FB F1            [10] 3700 	pop	af
   60FC 7D            [ 4] 3701 	ld	a,l
   60FD 32 FB 90      [13] 3702 	ld	(#(_enemy + 0x000a)),a
   6100 C9            [10] 3703 	ret
                           3704 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           3705 ;	---------------------------------
                           3706 ; Function checkCollisions
                           3707 ; ---------------------------------
   6101                    3708 _checkCollisions::
   6101 DD E5         [15] 3709 	push	ix
   6103 DD 21 00 00   [14] 3710 	ld	ix,#0
   6107 DD 39         [15] 3711 	add	ix,sp
                           3712 ;src/CalcColision.h:14: switch(atk){
   6109 DD 7E 08      [19] 3713 	ld	a,8 (ix)
   610C D6 15         [ 7] 3714 	sub	a, #0x15
   610E 28 09         [12] 3715 	jr	Z,00101$
   6110 DD 7E 08      [19] 3716 	ld	a,8 (ix)
   6113 D6 16         [ 7] 3717 	sub	a, #0x16
   6115 28 07         [12] 3718 	jr	Z,00102$
   6117 18 0A         [12] 3719 	jr	00103$
                           3720 ;src/CalcColision.h:15: case 21:
   6119                    3721 00101$:
                           3722 ;src/CalcColision.h:16: auxX = 2;
                           3723 ;src/CalcColision.h:17: auxY = 8;
   6119 21 08 02      [10] 3724 	ld	hl,#0x0208
                           3725 ;src/CalcColision.h:18: break;
   611C 18 08         [12] 3726 	jr	00104$
                           3727 ;src/CalcColision.h:19: case 22:
   611E                    3728 00102$:
                           3729 ;src/CalcColision.h:20: auxX = 4;
                           3730 ;src/CalcColision.h:21: auxY = 4;
   611E 21 04 04      [10] 3731 	ld	hl,#0x0404
                           3732 ;src/CalcColision.h:22: break;
   6121 18 03         [12] 3733 	jr	00104$
                           3734 ;src/CalcColision.h:23: default:
   6123                    3735 00103$:
                           3736 ;src/CalcColision.h:24: auxX = tilewidth;
                           3737 ;src/CalcColision.h:25: auxY = tileheight;
   6123 21 10 04      [10] 3738 	ld	hl,#0x0410
                           3739 ;src/CalcColision.h:26: }
   6126                    3740 00104$:
                           3741 ;src/CalcColision.h:27: popX = pX + auxX;
   6126 DD 7E 04      [19] 3742 	ld	a,4 (ix)
   6129 84            [ 4] 3743 	add	a, h
   612A 67            [ 4] 3744 	ld	h,a
                           3745 ;src/CalcColision.h:28: popY = pY + auxY;
   612B DD 7E 05      [19] 3746 	ld	a,5 (ix)
   612E 85            [ 4] 3747 	add	a, l
   612F 6F            [ 4] 3748 	ld	l,a
                           3749 ;src/CalcColision.h:29: eopX = eX + tilewidth;
   6130 DD 56 06      [19] 3750 	ld	d,6 (ix)
   6133 14            [ 4] 3751 	inc	d
   6134 14            [ 4] 3752 	inc	d
   6135 14            [ 4] 3753 	inc	d
   6136 14            [ 4] 3754 	inc	d
                           3755 ;src/CalcColision.h:30: eopY = eY + tileheight;
   6137 DD 7E 07      [19] 3756 	ld	a,7 (ix)
   613A C6 10         [ 7] 3757 	add	a, #0x10
   613C 5F            [ 4] 3758 	ld	e,a
                           3759 ;src/CalcColision.h:33: if(eY <= pY  && eopY>= pY || eY <= popY  && eopY>= popY ){
   613D DD 7E 05      [19] 3760 	ld	a,5 (ix)
   6140 DD 96 07      [19] 3761 	sub	a, 7 (ix)
   6143 38 06         [12] 3762 	jr	C,00117$
   6145 7B            [ 4] 3763 	ld	a,e
   6146 DD 96 05      [19] 3764 	sub	a, 5 (ix)
   6149 30 0A         [12] 3765 	jr	NC,00113$
   614B                    3766 00117$:
   614B 7D            [ 4] 3767 	ld	a,l
   614C DD 96 07      [19] 3768 	sub	a, 7 (ix)
   614F 38 2B         [12] 3769 	jr	C,00114$
   6151 7B            [ 4] 3770 	ld	a,e
   6152 95            [ 4] 3771 	sub	a, l
   6153 38 27         [12] 3772 	jr	C,00114$
   6155                    3773 00113$:
                           3774 ;src/CalcColision.h:34: if(eX <= pX && eopX>= pX || eX <= popX &&  eopX >= popX){
   6155 DD 7E 04      [19] 3775 	ld	a,4 (ix)
   6158 DD 96 06      [19] 3776 	sub	a, 6 (ix)
   615B 38 06         [12] 3777 	jr	C,00112$
   615D 7A            [ 4] 3778 	ld	a,d
   615E DD 96 04      [19] 3779 	sub	a, 4 (ix)
   6161 30 0A         [12] 3780 	jr	NC,00108$
   6163                    3781 00112$:
   6163 7C            [ 4] 3782 	ld	a,h
   6164 DD 96 06      [19] 3783 	sub	a, 6 (ix)
   6167 38 13         [12] 3784 	jr	C,00114$
   6169 7A            [ 4] 3785 	ld	a,d
   616A 94            [ 4] 3786 	sub	a, h
   616B 38 0F         [12] 3787 	jr	C,00114$
   616D                    3788 00108$:
                           3789 ;src/CalcColision.h:35: if(atk >= 21) return 1;
   616D DD 7E 08      [19] 3790 	ld	a,8 (ix)
   6170 D6 15         [ 7] 3791 	sub	a, #0x15
   6172 38 04         [12] 3792 	jr	C,00106$
   6174 2E 01         [ 7] 3793 	ld	l,#0x01
   6176 18 06         [12] 3794 	jr	00118$
   6178                    3795 00106$:
                           3796 ;src/CalcColision.h:36: else return 2;
   6178 2E 02         [ 7] 3797 	ld	l,#0x02
   617A 18 02         [12] 3798 	jr	00118$
   617C                    3799 00114$:
                           3800 ;src/CalcColision.h:40: return 0;
   617C 2E 00         [ 7] 3801 	ld	l,#0x00
   617E                    3802 00118$:
   617E DD E1         [14] 3803 	pop	ix
   6180 C9            [10] 3804 	ret
                           3805 ;src/CalcColision.h:44: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3806 ;	---------------------------------
                           3807 ; Function checkBoundsCollisions
                           3808 ; ---------------------------------
   6181                    3809 _checkBoundsCollisions::
   6181 DD E5         [15] 3810 	push	ix
   6183 DD 21 00 00   [14] 3811 	ld	ix,#0
   6187 DD 39         [15] 3812 	add	ix,sp
   6189 21 ED FF      [10] 3813 	ld	hl,#-19
   618C 39            [11] 3814 	add	hl,sp
   618D F9            [ 6] 3815 	ld	sp,hl
                           3816 ;src/CalcColision.h:45: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   618E 3A E7 90      [13] 3817 	ld	a,(#(_player + 0x0001) + 0)
   6191 DD 77 EE      [19] 3818 	ld	-18 (ix), a
   6194 07            [ 4] 3819 	rlca
   6195 07            [ 4] 3820 	rlca
   6196 07            [ 4] 3821 	rlca
   6197 07            [ 4] 3822 	rlca
   6198 E6 0F         [ 7] 3823 	and	a,#0x0F
   619A 4F            [ 4] 3824 	ld	c,a
   619B 06 00         [ 7] 3825 	ld	b,#0x00
   619D 69            [ 4] 3826 	ld	l, c
   619E 60            [ 4] 3827 	ld	h, b
   619F 29            [11] 3828 	add	hl, hl
   61A0 29            [11] 3829 	add	hl, hl
   61A1 09            [11] 3830 	add	hl, bc
   61A2 29            [11] 3831 	add	hl, hl
   61A3 29            [11] 3832 	add	hl, hl
   61A4 3E E0         [ 7] 3833 	ld	a,#<(_scene)
   61A6 85            [ 4] 3834 	add	a, l
   61A7 DD 77 F9      [19] 3835 	ld	-7 (ix),a
   61AA 3E 8F         [ 7] 3836 	ld	a,#>(_scene)
   61AC 8C            [ 4] 3837 	adc	a, h
   61AD DD 77 FA      [19] 3838 	ld	-6 (ix),a
   61B0 3A E6 90      [13] 3839 	ld	a,(#_player + 0)
   61B3 DD 77 ED      [19] 3840 	ld	-19 (ix), a
   61B6 0F            [ 4] 3841 	rrca
   61B7 0F            [ 4] 3842 	rrca
   61B8 E6 3F         [ 7] 3843 	and	a,#0x3F
   61BA DD 77 FF      [19] 3844 	ld	-1 (ix), a
   61BD DD 86 F9      [19] 3845 	add	a, -7 (ix)
   61C0 6F            [ 4] 3846 	ld	l,a
   61C1 3E 00         [ 7] 3847 	ld	a,#0x00
   61C3 DD 8E FA      [19] 3848 	adc	a, -6 (ix)
   61C6 67            [ 4] 3849 	ld	h,a
   61C7 7E            [ 7] 3850 	ld	a,(hl)
                           3851 ;src/CalcColision.h:50: player.x=player.lx;
                           3852 ;src/CalcColision.h:51: player.y=player.ly;
                           3853 ;src/CalcColision.h:45: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   61C8 DD 77 F3      [19] 3854 	ld	-13 (ix), a
   61CB 3D            [ 4] 3855 	dec	a
   61CC CA 84 63      [10] 3856 	jp	Z,00129$
                           3857 ;src/CalcColision.h:46: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   61CF DD 5E ED      [19] 3858 	ld	e,-19 (ix)
   61D2 16 00         [ 7] 3859 	ld	d,#0x00
   61D4 21 03 00      [10] 3860 	ld	hl,#0x0003
   61D7 19            [11] 3861 	add	hl,de
   61D8 DD 75 F6      [19] 3862 	ld	-10 (ix),l
   61DB DD 74 F7      [19] 3863 	ld	-9 (ix),h
   61DE DD 7E F6      [19] 3864 	ld	a,-10 (ix)
   61E1 DD 77 FD      [19] 3865 	ld	-3 (ix),a
   61E4 DD 7E F7      [19] 3866 	ld	a,-9 (ix)
   61E7 DD 77 FE      [19] 3867 	ld	-2 (ix),a
   61EA DD 7E F7      [19] 3868 	ld	a,-9 (ix)
   61ED 07            [ 4] 3869 	rlca
   61EE E6 01         [ 7] 3870 	and	a,#0x01
   61F0 DD 77 ED      [19] 3871 	ld	-19 (ix),a
   61F3 21 06 00      [10] 3872 	ld	hl,#0x0006
   61F6 19            [11] 3873 	add	hl,de
   61F7 DD 75 FB      [19] 3874 	ld	-5 (ix),l
   61FA DD 74 FC      [19] 3875 	ld	-4 (ix),h
   61FD DD 7E ED      [19] 3876 	ld	a,-19 (ix)
   6200 B7            [ 4] 3877 	or	a, a
   6201 28 0C         [12] 3878 	jr	Z,00137$
   6203 DD 7E FB      [19] 3879 	ld	a,-5 (ix)
   6206 DD 77 FD      [19] 3880 	ld	-3 (ix),a
   6209 DD 7E FC      [19] 3881 	ld	a,-4 (ix)
   620C DD 77 FE      [19] 3882 	ld	-2 (ix),a
   620F                    3883 00137$:
   620F DD 6E FD      [19] 3884 	ld	l,-3 (ix)
   6212 DD 66 FE      [19] 3885 	ld	h,-2 (ix)
   6215 CB 2C         [ 8] 3886 	sra	h
   6217 CB 1D         [ 8] 3887 	rr	l
   6219 CB 2C         [ 8] 3888 	sra	h
   621B CB 1D         [ 8] 3889 	rr	l
   621D DD 5E F9      [19] 3890 	ld	e,-7 (ix)
   6220 DD 56 FA      [19] 3891 	ld	d,-6 (ix)
   6223 19            [11] 3892 	add	hl,de
   6224 7E            [ 7] 3893 	ld	a,(hl)
   6225 3D            [ 4] 3894 	dec	a
   6226 CA 84 63      [10] 3895 	jp	Z,00129$
                           3896 ;src/CalcColision.h:47: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   6229 DD 7E EE      [19] 3897 	ld	a,-18 (ix)
   622C DD 77 FD      [19] 3898 	ld	-3 (ix),a
   622F DD 36 FE 00   [19] 3899 	ld	-2 (ix),#0x00
   6233 DD 7E FD      [19] 3900 	ld	a,-3 (ix)
   6236 C6 0E         [ 7] 3901 	add	a, #0x0E
   6238 DD 77 F1      [19] 3902 	ld	-15 (ix),a
   623B DD 7E FE      [19] 3903 	ld	a,-2 (ix)
   623E CE 00         [ 7] 3904 	adc	a, #0x00
   6240 DD 77 F2      [19] 3905 	ld	-14 (ix),a
   6243 DD 7E F1      [19] 3906 	ld	a,-15 (ix)
   6246 DD 77 F4      [19] 3907 	ld	-12 (ix),a
   6249 DD 7E F2      [19] 3908 	ld	a,-14 (ix)
   624C DD 77 F5      [19] 3909 	ld	-11 (ix),a
   624F DD 7E F2      [19] 3910 	ld	a,-14 (ix)
   6252 07            [ 4] 3911 	rlca
   6253 E6 01         [ 7] 3912 	and	a,#0x01
   6255 DD 77 EE      [19] 3913 	ld	-18 (ix),a
   6258 DD 7E FD      [19] 3914 	ld	a,-3 (ix)
   625B C6 1D         [ 7] 3915 	add	a, #0x1D
   625D DD 77 FD      [19] 3916 	ld	-3 (ix),a
   6260 DD 7E FE      [19] 3917 	ld	a,-2 (ix)
   6263 CE 00         [ 7] 3918 	adc	a, #0x00
   6265 DD 77 FE      [19] 3919 	ld	-2 (ix),a
   6268 DD 7E EE      [19] 3920 	ld	a,-18 (ix)
   626B B7            [ 4] 3921 	or	a, a
   626C 28 0C         [12] 3922 	jr	Z,00138$
   626E DD 7E FD      [19] 3923 	ld	a,-3 (ix)
   6271 DD 77 F4      [19] 3924 	ld	-12 (ix),a
   6274 DD 7E FE      [19] 3925 	ld	a,-2 (ix)
   6277 DD 77 F5      [19] 3926 	ld	-11 (ix),a
   627A                    3927 00138$:
   627A DD CB F5 2E   [23] 3928 	sra	-11 (ix)
   627E DD CB F4 1E   [23] 3929 	rr	-12 (ix)
   6282 DD CB F5 2E   [23] 3930 	sra	-11 (ix)
   6286 DD CB F4 1E   [23] 3931 	rr	-12 (ix)
   628A DD CB F5 2E   [23] 3932 	sra	-11 (ix)
   628E DD CB F4 1E   [23] 3933 	rr	-12 (ix)
   6292 DD CB F5 2E   [23] 3934 	sra	-11 (ix)
   6296 DD CB F4 1E   [23] 3935 	rr	-12 (ix)
   629A DD 4E F4      [19] 3936 	ld	c,-12 (ix)
   629D DD 46 F5      [19] 3937 	ld	b,-11 (ix)
   62A0 69            [ 4] 3938 	ld	l, c
   62A1 60            [ 4] 3939 	ld	h, b
   62A2 29            [11] 3940 	add	hl, hl
   62A3 29            [11] 3941 	add	hl, hl
   62A4 09            [11] 3942 	add	hl, bc
   62A5 29            [11] 3943 	add	hl, hl
   62A6 29            [11] 3944 	add	hl, hl
   62A7 DD 75 F4      [19] 3945 	ld	-12 (ix),l
   62AA DD 74 F5      [19] 3946 	ld	-11 (ix),h
   62AD 3E E0         [ 7] 3947 	ld	a,#<(_scene)
   62AF DD 86 F4      [19] 3948 	add	a, -12 (ix)
   62B2 DD 77 F4      [19] 3949 	ld	-12 (ix),a
   62B5 3E 8F         [ 7] 3950 	ld	a,#>(_scene)
   62B7 DD 8E F5      [19] 3951 	adc	a, -11 (ix)
   62BA DD 77 F5      [19] 3952 	ld	-11 (ix),a
   62BD DD 7E F4      [19] 3953 	ld	a,-12 (ix)
   62C0 DD 86 FF      [19] 3954 	add	a, -1 (ix)
   62C3 DD 77 F4      [19] 3955 	ld	-12 (ix),a
   62C6 DD 7E F5      [19] 3956 	ld	a,-11 (ix)
   62C9 CE 00         [ 7] 3957 	adc	a, #0x00
   62CB DD 77 F5      [19] 3958 	ld	-11 (ix),a
   62CE DD 6E F4      [19] 3959 	ld	l,-12 (ix)
   62D1 DD 66 F5      [19] 3960 	ld	h,-11 (ix)
   62D4 7E            [ 7] 3961 	ld	a,(hl)
   62D5 3D            [ 4] 3962 	dec	a
   62D6 CA 84 63      [10] 3963 	jp	Z,00129$
                           3964 ;src/CalcColision.h:48: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   62D9 DD 7E F1      [19] 3965 	ld	a,-15 (ix)
   62DC DD 77 F4      [19] 3966 	ld	-12 (ix),a
   62DF DD 7E F2      [19] 3967 	ld	a,-14 (ix)
   62E2 DD 77 F5      [19] 3968 	ld	-11 (ix),a
   62E5 DD 7E EE      [19] 3969 	ld	a,-18 (ix)
   62E8 B7            [ 4] 3970 	or	a, a
   62E9 28 0C         [12] 3971 	jr	Z,00139$
   62EB DD 7E FD      [19] 3972 	ld	a,-3 (ix)
   62EE DD 77 F4      [19] 3973 	ld	-12 (ix),a
   62F1 DD 7E FE      [19] 3974 	ld	a,-2 (ix)
   62F4 DD 77 F5      [19] 3975 	ld	-11 (ix),a
   62F7                    3976 00139$:
   62F7 DD CB F5 2E   [23] 3977 	sra	-11 (ix)
   62FB DD CB F4 1E   [23] 3978 	rr	-12 (ix)
   62FF DD CB F5 2E   [23] 3979 	sra	-11 (ix)
   6303 DD CB F4 1E   [23] 3980 	rr	-12 (ix)
   6307 DD CB F5 2E   [23] 3981 	sra	-11 (ix)
   630B DD CB F4 1E   [23] 3982 	rr	-12 (ix)
   630F DD CB F5 2E   [23] 3983 	sra	-11 (ix)
   6313 DD CB F4 1E   [23] 3984 	rr	-12 (ix)
   6317 DD 4E F4      [19] 3985 	ld	c,-12 (ix)
   631A DD 46 F5      [19] 3986 	ld	b,-11 (ix)
   631D 69            [ 4] 3987 	ld	l, c
   631E 60            [ 4] 3988 	ld	h, b
   631F 29            [11] 3989 	add	hl, hl
   6320 29            [11] 3990 	add	hl, hl
   6321 09            [11] 3991 	add	hl, bc
   6322 29            [11] 3992 	add	hl, hl
   6323 29            [11] 3993 	add	hl, hl
   6324 DD 75 F4      [19] 3994 	ld	-12 (ix),l
   6327 DD 74 F5      [19] 3995 	ld	-11 (ix),h
   632A 3E E0         [ 7] 3996 	ld	a,#<(_scene)
   632C DD 86 F4      [19] 3997 	add	a, -12 (ix)
   632F DD 77 F4      [19] 3998 	ld	-12 (ix),a
   6332 3E 8F         [ 7] 3999 	ld	a,#>(_scene)
   6334 DD 8E F5      [19] 4000 	adc	a, -11 (ix)
   6337 DD 77 F5      [19] 4001 	ld	-11 (ix),a
   633A DD 7E F6      [19] 4002 	ld	a,-10 (ix)
   633D DD 77 EF      [19] 4003 	ld	-17 (ix),a
   6340 DD 7E F7      [19] 4004 	ld	a,-9 (ix)
   6343 DD 77 F0      [19] 4005 	ld	-16 (ix),a
   6346 DD 7E ED      [19] 4006 	ld	a,-19 (ix)
   6349 B7            [ 4] 4007 	or	a, a
   634A 28 0C         [12] 4008 	jr	Z,00140$
   634C DD 7E FB      [19] 4009 	ld	a,-5 (ix)
   634F DD 77 EF      [19] 4010 	ld	-17 (ix),a
   6352 DD 7E FC      [19] 4011 	ld	a,-4 (ix)
   6355 DD 77 F0      [19] 4012 	ld	-16 (ix),a
   6358                    4013 00140$:
   6358 DD CB F0 2E   [23] 4014 	sra	-16 (ix)
   635C DD CB EF 1E   [23] 4015 	rr	-17 (ix)
   6360 DD CB F0 2E   [23] 4016 	sra	-16 (ix)
   6364 DD CB EF 1E   [23] 4017 	rr	-17 (ix)
   6368 DD 7E F4      [19] 4018 	ld	a,-12 (ix)
   636B DD 86 EF      [19] 4019 	add	a, -17 (ix)
   636E DD 77 EF      [19] 4020 	ld	-17 (ix),a
   6371 DD 7E F5      [19] 4021 	ld	a,-11 (ix)
   6374 DD 8E F0      [19] 4022 	adc	a, -16 (ix)
   6377 DD 77 F0      [19] 4023 	ld	-16 (ix),a
   637A DD 6E EF      [19] 4024 	ld	l,-17 (ix)
   637D DD 66 F0      [19] 4025 	ld	h,-16 (ix)
   6380 7E            [ 7] 4026 	ld	a,(hl)
   6381 3D            [ 4] 4027 	dec	a
   6382 20 10         [12] 4028 	jr	NZ,00130$
   6384                    4029 00129$:
                           4030 ;src/CalcColision.h:50: player.x=player.lx;
   6384 3A E8 90      [13] 4031 	ld	a, (#(_player + 0x0002) + 0)
   6387 21 E6 90      [10] 4032 	ld	hl,#_player
   638A 77            [ 7] 4033 	ld	(hl),a
                           4034 ;src/CalcColision.h:51: player.y=player.ly;
   638B 3A E9 90      [13] 4035 	ld	a, (#(_player + 0x0003) + 0)
   638E 32 E7 90      [13] 4036 	ld	(#(_player + 0x0001)),a
   6391 C3 84 68      [10] 4037 	jp	00135$
   6394                    4038 00130$:
                           4039 ;src/CalcColision.h:53: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   6394 DD 7E F3      [19] 4040 	ld	a,-13 (ix)
   6397 D6 02         [ 7] 4041 	sub	a, #0x02
   6399 CA 12 65      [10] 4042 	jp	Z,00123$
                           4043 ;src/CalcColision.h:54: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   639C DD 7E F6      [19] 4044 	ld	a,-10 (ix)
   639F DD 77 EF      [19] 4045 	ld	-17 (ix),a
   63A2 DD 7E F7      [19] 4046 	ld	a,-9 (ix)
   63A5 DD 77 F0      [19] 4047 	ld	-16 (ix),a
   63A8 DD 7E ED      [19] 4048 	ld	a,-19 (ix)
   63AB B7            [ 4] 4049 	or	a, a
   63AC 28 0C         [12] 4050 	jr	Z,00141$
   63AE DD 7E FB      [19] 4051 	ld	a,-5 (ix)
   63B1 DD 77 EF      [19] 4052 	ld	-17 (ix),a
   63B4 DD 7E FC      [19] 4053 	ld	a,-4 (ix)
   63B7 DD 77 F0      [19] 4054 	ld	-16 (ix),a
   63BA                    4055 00141$:
   63BA DD CB F0 2E   [23] 4056 	sra	-16 (ix)
   63BE DD CB EF 1E   [23] 4057 	rr	-17 (ix)
   63C2 DD CB F0 2E   [23] 4058 	sra	-16 (ix)
   63C6 DD CB EF 1E   [23] 4059 	rr	-17 (ix)
   63CA DD 7E F9      [19] 4060 	ld	a,-7 (ix)
   63CD DD 86 EF      [19] 4061 	add	a, -17 (ix)
   63D0 DD 77 EF      [19] 4062 	ld	-17 (ix),a
   63D3 DD 7E FA      [19] 4063 	ld	a,-6 (ix)
   63D6 DD 8E F0      [19] 4064 	adc	a, -16 (ix)
   63D9 DD 77 F0      [19] 4065 	ld	-16 (ix),a
   63DC DD 6E EF      [19] 4066 	ld	l,-17 (ix)
   63DF DD 66 F0      [19] 4067 	ld	h,-16 (ix)
   63E2 7E            [ 7] 4068 	ld	a,(hl)
   63E3 D6 02         [ 7] 4069 	sub	a, #0x02
   63E5 CA 12 65      [10] 4070 	jp	Z,00123$
                           4071 ;src/CalcColision.h:55: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   63E8 DD 7E F1      [19] 4072 	ld	a,-15 (ix)
   63EB DD 77 EF      [19] 4073 	ld	-17 (ix),a
   63EE DD 7E F2      [19] 4074 	ld	a,-14 (ix)
   63F1 DD 77 F0      [19] 4075 	ld	-16 (ix),a
   63F4 DD 7E EE      [19] 4076 	ld	a,-18 (ix)
   63F7 B7            [ 4] 4077 	or	a, a
   63F8 28 0C         [12] 4078 	jr	Z,00142$
   63FA DD 7E FD      [19] 4079 	ld	a,-3 (ix)
   63FD DD 77 EF      [19] 4080 	ld	-17 (ix),a
   6400 DD 7E FE      [19] 4081 	ld	a,-2 (ix)
   6403 DD 77 F0      [19] 4082 	ld	-16 (ix),a
   6406                    4083 00142$:
   6406 DD CB F0 2E   [23] 4084 	sra	-16 (ix)
   640A DD CB EF 1E   [23] 4085 	rr	-17 (ix)
   640E DD CB F0 2E   [23] 4086 	sra	-16 (ix)
   6412 DD CB EF 1E   [23] 4087 	rr	-17 (ix)
   6416 DD CB F0 2E   [23] 4088 	sra	-16 (ix)
   641A DD CB EF 1E   [23] 4089 	rr	-17 (ix)
   641E DD CB F0 2E   [23] 4090 	sra	-16 (ix)
   6422 DD CB EF 1E   [23] 4091 	rr	-17 (ix)
   6426 DD 4E EF      [19] 4092 	ld	c,-17 (ix)
   6429 DD 46 F0      [19] 4093 	ld	b,-16 (ix)
   642C 69            [ 4] 4094 	ld	l, c
   642D 60            [ 4] 4095 	ld	h, b
   642E 29            [11] 4096 	add	hl, hl
   642F 29            [11] 4097 	add	hl, hl
   6430 09            [11] 4098 	add	hl, bc
   6431 29            [11] 4099 	add	hl, hl
   6432 29            [11] 4100 	add	hl, hl
   6433 DD 75 EF      [19] 4101 	ld	-17 (ix),l
   6436 DD 74 F0      [19] 4102 	ld	-16 (ix),h
   6439 3E E0         [ 7] 4103 	ld	a,#<(_scene)
   643B DD 86 EF      [19] 4104 	add	a, -17 (ix)
   643E DD 77 EF      [19] 4105 	ld	-17 (ix),a
   6441 3E 8F         [ 7] 4106 	ld	a,#>(_scene)
   6443 DD 8E F0      [19] 4107 	adc	a, -16 (ix)
   6446 DD 77 F0      [19] 4108 	ld	-16 (ix),a
   6449 DD 7E EF      [19] 4109 	ld	a,-17 (ix)
   644C DD 86 FF      [19] 4110 	add	a, -1 (ix)
   644F DD 77 EF      [19] 4111 	ld	-17 (ix),a
   6452 DD 7E F0      [19] 4112 	ld	a,-16 (ix)
   6455 CE 00         [ 7] 4113 	adc	a, #0x00
   6457 DD 77 F0      [19] 4114 	ld	-16 (ix),a
   645A DD 6E EF      [19] 4115 	ld	l,-17 (ix)
   645D DD 66 F0      [19] 4116 	ld	h,-16 (ix)
   6460 7E            [ 7] 4117 	ld	a,(hl)
   6461 D6 02         [ 7] 4118 	sub	a, #0x02
   6463 CA 12 65      [10] 4119 	jp	Z,00123$
                           4120 ;src/CalcColision.h:56: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   6466 DD 7E F1      [19] 4121 	ld	a,-15 (ix)
   6469 DD 77 EF      [19] 4122 	ld	-17 (ix),a
   646C DD 7E F2      [19] 4123 	ld	a,-14 (ix)
   646F DD 77 F0      [19] 4124 	ld	-16 (ix),a
   6472 DD 7E EE      [19] 4125 	ld	a,-18 (ix)
   6475 B7            [ 4] 4126 	or	a, a
   6476 28 0C         [12] 4127 	jr	Z,00143$
   6478 DD 7E FD      [19] 4128 	ld	a,-3 (ix)
   647B DD 77 EF      [19] 4129 	ld	-17 (ix),a
   647E DD 7E FE      [19] 4130 	ld	a,-2 (ix)
   6481 DD 77 F0      [19] 4131 	ld	-16 (ix),a
   6484                    4132 00143$:
   6484 DD CB F0 2E   [23] 4133 	sra	-16 (ix)
   6488 DD CB EF 1E   [23] 4134 	rr	-17 (ix)
   648C DD CB F0 2E   [23] 4135 	sra	-16 (ix)
   6490 DD CB EF 1E   [23] 4136 	rr	-17 (ix)
   6494 DD CB F0 2E   [23] 4137 	sra	-16 (ix)
   6498 DD CB EF 1E   [23] 4138 	rr	-17 (ix)
   649C DD CB F0 2E   [23] 4139 	sra	-16 (ix)
   64A0 DD CB EF 1E   [23] 4140 	rr	-17 (ix)
   64A4 DD 4E EF      [19] 4141 	ld	c,-17 (ix)
   64A7 DD 46 F0      [19] 4142 	ld	b,-16 (ix)
   64AA 69            [ 4] 4143 	ld	l, c
   64AB 60            [ 4] 4144 	ld	h, b
   64AC 29            [11] 4145 	add	hl, hl
   64AD 29            [11] 4146 	add	hl, hl
   64AE 09            [11] 4147 	add	hl, bc
   64AF 29            [11] 4148 	add	hl, hl
   64B0 29            [11] 4149 	add	hl, hl
   64B1 DD 75 EF      [19] 4150 	ld	-17 (ix),l
   64B4 DD 74 F0      [19] 4151 	ld	-16 (ix),h
   64B7 3E E0         [ 7] 4152 	ld	a,#<(_scene)
   64B9 DD 86 EF      [19] 4153 	add	a, -17 (ix)
   64BC DD 77 EF      [19] 4154 	ld	-17 (ix),a
   64BF 3E 8F         [ 7] 4155 	ld	a,#>(_scene)
   64C1 DD 8E F0      [19] 4156 	adc	a, -16 (ix)
   64C4 DD 77 F0      [19] 4157 	ld	-16 (ix),a
   64C7 DD 7E F6      [19] 4158 	ld	a,-10 (ix)
   64CA DD 77 F4      [19] 4159 	ld	-12 (ix),a
   64CD DD 7E F7      [19] 4160 	ld	a,-9 (ix)
   64D0 DD 77 F5      [19] 4161 	ld	-11 (ix),a
   64D3 DD 7E ED      [19] 4162 	ld	a,-19 (ix)
   64D6 B7            [ 4] 4163 	or	a, a
   64D7 28 0C         [12] 4164 	jr	Z,00144$
   64D9 DD 7E FB      [19] 4165 	ld	a,-5 (ix)
   64DC DD 77 F4      [19] 4166 	ld	-12 (ix),a
   64DF DD 7E FC      [19] 4167 	ld	a,-4 (ix)
   64E2 DD 77 F5      [19] 4168 	ld	-11 (ix),a
   64E5                    4169 00144$:
   64E5 DD CB F5 2E   [23] 4170 	sra	-11 (ix)
   64E9 DD CB F4 1E   [23] 4171 	rr	-12 (ix)
   64ED DD CB F5 2E   [23] 4172 	sra	-11 (ix)
   64F1 DD CB F4 1E   [23] 4173 	rr	-12 (ix)
   64F5 DD 7E EF      [19] 4174 	ld	a,-17 (ix)
   64F8 DD 86 F4      [19] 4175 	add	a, -12 (ix)
   64FB DD 77 EF      [19] 4176 	ld	-17 (ix),a
   64FE DD 7E F0      [19] 4177 	ld	a,-16 (ix)
   6501 DD 8E F5      [19] 4178 	adc	a, -11 (ix)
   6504 DD 77 F0      [19] 4179 	ld	-16 (ix),a
   6507 DD 6E EF      [19] 4180 	ld	l,-17 (ix)
   650A DD 66 F0      [19] 4181 	ld	h,-16 (ix)
   650D 7E            [ 7] 4182 	ld	a,(hl)
   650E D6 02         [ 7] 4183 	sub	a, #0x02
   6510 20 37         [12] 4184 	jr	NZ,00124$
   6512                    4185 00123$:
                           4186 ;src/CalcColision.h:58: if(player.life < 3 && *corazon == 0){
   6512 3A EC 90      [13] 4187 	ld	a,(#(_player + 0x0006) + 0)
   6515 DD 77 EF      [19] 4188 	ld	-17 (ix), a
   6518 D6 03         [ 7] 4189 	sub	a, #0x03
   651A D2 84 68      [10] 4190 	jp	NC,00135$
   651D DD 7E 04      [19] 4191 	ld	a,4 (ix)
   6520 DD 77 F4      [19] 4192 	ld	-12 (ix),a
   6523 DD 7E 05      [19] 4193 	ld	a,5 (ix)
   6526 DD 77 F5      [19] 4194 	ld	-11 (ix),a
   6529 DD 6E F4      [19] 4195 	ld	l,-12 (ix)
   652C DD 66 F5      [19] 4196 	ld	h,-11 (ix)
   652F 7E            [ 7] 4197 	ld	a,(hl)
   6530 DD 77 F8      [19] 4198 	ld	-8 (ix), a
   6533 B7            [ 4] 4199 	or	a, a
   6534 C2 84 68      [10] 4200 	jp	NZ,00135$
                           4201 ;src/CalcColision.h:59: player.life += 1;
   6537 DD 7E EF      [19] 4202 	ld	a,-17 (ix)
   653A 3C            [ 4] 4203 	inc	a
   653B 32 EC 90      [13] 4204 	ld	(#(_player + 0x0006)),a
                           4205 ;src/CalcColision.h:60: *corazon = 1;
   653E DD 6E F4      [19] 4206 	ld	l,-12 (ix)
   6541 DD 66 F5      [19] 4207 	ld	h,-11 (ix)
   6544 36 01         [10] 4208 	ld	(hl),#0x01
   6546 C3 84 68      [10] 4209 	jp	00135$
   6549                    4210 00124$:
                           4211 ;src/CalcColision.h:63: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   6549 DD 7E F3      [19] 4212 	ld	a,-13 (ix)
   654C D6 05         [ 7] 4213 	sub	a, #0x05
   654E CA 64 66      [10] 4214 	jp	Z,00117$
                           4215 ;src/CalcColision.h:64: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   6551 DD 7E F6      [19] 4216 	ld	a,-10 (ix)
   6554 DD 77 EF      [19] 4217 	ld	-17 (ix),a
   6557 DD 7E F7      [19] 4218 	ld	a,-9 (ix)
   655A DD 77 F0      [19] 4219 	ld	-16 (ix),a
   655D DD 7E ED      [19] 4220 	ld	a,-19 (ix)
   6560 B7            [ 4] 4221 	or	a, a
   6561 28 0C         [12] 4222 	jr	Z,00145$
   6563 DD 7E FB      [19] 4223 	ld	a,-5 (ix)
   6566 DD 77 EF      [19] 4224 	ld	-17 (ix),a
   6569 DD 7E FC      [19] 4225 	ld	a,-4 (ix)
   656C DD 77 F0      [19] 4226 	ld	-16 (ix),a
   656F                    4227 00145$:
   656F C1            [10] 4228 	pop	bc
   6570 E1            [10] 4229 	pop	hl
   6571 E5            [11] 4230 	push	hl
   6572 C5            [11] 4231 	push	bc
   6573 CB 2C         [ 8] 4232 	sra	h
   6575 CB 1D         [ 8] 4233 	rr	l
   6577 CB 2C         [ 8] 4234 	sra	h
   6579 CB 1D         [ 8] 4235 	rr	l
   657B DD 5E F9      [19] 4236 	ld	e,-7 (ix)
   657E DD 56 FA      [19] 4237 	ld	d,-6 (ix)
   6581 19            [11] 4238 	add	hl,de
   6582 7E            [ 7] 4239 	ld	a,(hl)
   6583 D6 05         [ 7] 4240 	sub	a, #0x05
   6585 CA 64 66      [10] 4241 	jp	Z,00117$
                           4242 ;src/CalcColision.h:65: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   6588 DD 7E F1      [19] 4243 	ld	a,-15 (ix)
   658B DD 77 EF      [19] 4244 	ld	-17 (ix),a
   658E DD 7E F2      [19] 4245 	ld	a,-14 (ix)
   6591 DD 77 F0      [19] 4246 	ld	-16 (ix),a
   6594 DD 7E EE      [19] 4247 	ld	a,-18 (ix)
   6597 B7            [ 4] 4248 	or	a, a
   6598 28 0C         [12] 4249 	jr	Z,00146$
   659A DD 7E FD      [19] 4250 	ld	a,-3 (ix)
   659D DD 77 EF      [19] 4251 	ld	-17 (ix),a
   65A0 DD 7E FE      [19] 4252 	ld	a,-2 (ix)
   65A3 DD 77 F0      [19] 4253 	ld	-16 (ix),a
   65A6                    4254 00146$:
   65A6 C1            [10] 4255 	pop	bc
   65A7 E1            [10] 4256 	pop	hl
   65A8 E5            [11] 4257 	push	hl
   65A9 C5            [11] 4258 	push	bc
   65AA CB 2C         [ 8] 4259 	sra	h
   65AC CB 1D         [ 8] 4260 	rr	l
   65AE CB 2C         [ 8] 4261 	sra	h
   65B0 CB 1D         [ 8] 4262 	rr	l
   65B2 CB 2C         [ 8] 4263 	sra	h
   65B4 CB 1D         [ 8] 4264 	rr	l
   65B6 CB 2C         [ 8] 4265 	sra	h
   65B8 CB 1D         [ 8] 4266 	rr	l
   65BA 4D            [ 4] 4267 	ld	c, l
   65BB 44            [ 4] 4268 	ld	b, h
   65BC 29            [11] 4269 	add	hl, hl
   65BD 29            [11] 4270 	add	hl, hl
   65BE 09            [11] 4271 	add	hl, bc
   65BF 29            [11] 4272 	add	hl, hl
   65C0 29            [11] 4273 	add	hl, hl
   65C1 11 E0 8F      [10] 4274 	ld	de,#_scene
   65C4 19            [11] 4275 	add	hl,de
   65C5 DD 5E FF      [19] 4276 	ld	e,-1 (ix)
   65C8 16 00         [ 7] 4277 	ld	d,#0x00
   65CA 19            [11] 4278 	add	hl,de
   65CB 7E            [ 7] 4279 	ld	a,(hl)
   65CC D6 05         [ 7] 4280 	sub	a, #0x05
   65CE CA 64 66      [10] 4281 	jp	Z,00117$
                           4282 ;src/CalcColision.h:66: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   65D1 DD 7E F1      [19] 4283 	ld	a,-15 (ix)
   65D4 DD 77 EF      [19] 4284 	ld	-17 (ix),a
   65D7 DD 7E F2      [19] 4285 	ld	a,-14 (ix)
   65DA DD 77 F0      [19] 4286 	ld	-16 (ix),a
   65DD DD 7E EE      [19] 4287 	ld	a,-18 (ix)
   65E0 B7            [ 4] 4288 	or	a, a
   65E1 28 0C         [12] 4289 	jr	Z,00147$
   65E3 DD 7E FD      [19] 4290 	ld	a,-3 (ix)
   65E6 DD 77 EF      [19] 4291 	ld	-17 (ix),a
   65E9 DD 7E FE      [19] 4292 	ld	a,-2 (ix)
   65EC DD 77 F0      [19] 4293 	ld	-16 (ix),a
   65EF                    4294 00147$:
   65EF C1            [10] 4295 	pop	bc
   65F0 E1            [10] 4296 	pop	hl
   65F1 E5            [11] 4297 	push	hl
   65F2 C5            [11] 4298 	push	bc
   65F3 CB 2C         [ 8] 4299 	sra	h
   65F5 CB 1D         [ 8] 4300 	rr	l
   65F7 CB 2C         [ 8] 4301 	sra	h
   65F9 CB 1D         [ 8] 4302 	rr	l
   65FB CB 2C         [ 8] 4303 	sra	h
   65FD CB 1D         [ 8] 4304 	rr	l
   65FF CB 2C         [ 8] 4305 	sra	h
   6601 CB 1D         [ 8] 4306 	rr	l
   6603 4D            [ 4] 4307 	ld	c, l
   6604 44            [ 4] 4308 	ld	b, h
   6605 29            [11] 4309 	add	hl, hl
   6606 29            [11] 4310 	add	hl, hl
   6607 09            [11] 4311 	add	hl, bc
   6608 29            [11] 4312 	add	hl, hl
   6609 29            [11] 4313 	add	hl, hl
   660A 3E E0         [ 7] 4314 	ld	a,#<(_scene)
   660C 85            [ 4] 4315 	add	a, l
   660D DD 77 EF      [19] 4316 	ld	-17 (ix),a
   6610 3E 8F         [ 7] 4317 	ld	a,#>(_scene)
   6612 8C            [ 4] 4318 	adc	a, h
   6613 DD 77 F0      [19] 4319 	ld	-16 (ix),a
   6616 DD 7E F6      [19] 4320 	ld	a,-10 (ix)
   6619 DD 77 F4      [19] 4321 	ld	-12 (ix),a
   661C DD 7E F7      [19] 4322 	ld	a,-9 (ix)
   661F DD 77 F5      [19] 4323 	ld	-11 (ix),a
   6622 DD 7E ED      [19] 4324 	ld	a,-19 (ix)
   6625 B7            [ 4] 4325 	or	a, a
   6626 28 0C         [12] 4326 	jr	Z,00148$
   6628 DD 7E FB      [19] 4327 	ld	a,-5 (ix)
   662B DD 77 F4      [19] 4328 	ld	-12 (ix),a
   662E DD 7E FC      [19] 4329 	ld	a,-4 (ix)
   6631 DD 77 F5      [19] 4330 	ld	-11 (ix),a
   6634                    4331 00148$:
   6634 DD CB F5 2E   [23] 4332 	sra	-11 (ix)
   6638 DD CB F4 1E   [23] 4333 	rr	-12 (ix)
   663C DD CB F5 2E   [23] 4334 	sra	-11 (ix)
   6640 DD CB F4 1E   [23] 4335 	rr	-12 (ix)
   6644 DD 7E F4      [19] 4336 	ld	a,-12 (ix)
   6647 DD 86 EF      [19] 4337 	add	a, -17 (ix)
   664A DD 77 EF      [19] 4338 	ld	-17 (ix),a
   664D DD 7E F5      [19] 4339 	ld	a,-11 (ix)
   6650 DD 8E F0      [19] 4340 	adc	a, -16 (ix)
   6653 DD 77 F0      [19] 4341 	ld	-16 (ix),a
   6656 DD 6E EF      [19] 4342 	ld	l,-17 (ix)
   6659 DD 66 F0      [19] 4343 	ld	h,-16 (ix)
   665C 7E            [ 7] 4344 	ld	a,(hl)
   665D DD 77 F8      [19] 4345 	ld	-8 (ix), a
   6660 D6 05         [ 7] 4346 	sub	a, #0x05
   6662 20 37         [12] 4347 	jr	NZ,00118$
   6664                    4348 00117$:
                           4349 ;src/CalcColision.h:68: if(player.bullets < 3 && *flecha == 0){
   6664 3A F0 90      [13] 4350 	ld	a,(#(_player + 0x000a) + 0)
   6667 DD 77 F8      [19] 4351 	ld	-8 (ix), a
   666A D6 03         [ 7] 4352 	sub	a, #0x03
   666C D2 84 68      [10] 4353 	jp	NC,00135$
   666F DD 7E 06      [19] 4354 	ld	a,6 (ix)
   6672 DD 77 EF      [19] 4355 	ld	-17 (ix),a
   6675 DD 7E 07      [19] 4356 	ld	a,7 (ix)
   6678 DD 77 F0      [19] 4357 	ld	-16 (ix),a
   667B DD 6E EF      [19] 4358 	ld	l,-17 (ix)
   667E DD 66 F0      [19] 4359 	ld	h,-16 (ix)
   6681 7E            [ 7] 4360 	ld	a,(hl)
   6682 B7            [ 4] 4361 	or	a, a
   6683 C2 84 68      [10] 4362 	jp	NZ,00135$
                           4363 ;src/CalcColision.h:69: player.bullets += 1;
   6686 DD 34 F8      [23] 4364 	inc	-8 (ix)
   6689 21 F0 90      [10] 4365 	ld	hl,#(_player + 0x000a)
   668C DD 7E F8      [19] 4366 	ld	a,-8 (ix)
   668F 77            [ 7] 4367 	ld	(hl),a
                           4368 ;src/CalcColision.h:70: *flecha = 1;
   6690 DD 6E EF      [19] 4369 	ld	l,-17 (ix)
   6693 DD 66 F0      [19] 4370 	ld	h,-16 (ix)
   6696 36 01         [10] 4371 	ld	(hl),#0x01
   6698 C3 84 68      [10] 4372 	jp	00135$
   669B                    4373 00118$:
                           4374 ;src/CalcColision.h:72: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   669B DD 7E F3      [19] 4375 	ld	a,-13 (ix)
   669E D6 09         [ 7] 4376 	sub	a, #0x09
   66A0 CA 22 68      [10] 4377 	jp	Z,00112$
                           4378 ;src/CalcColision.h:73: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   66A3 DD 7E F6      [19] 4379 	ld	a,-10 (ix)
   66A6 DD 77 EF      [19] 4380 	ld	-17 (ix),a
   66A9 DD 7E F7      [19] 4381 	ld	a,-9 (ix)
   66AC DD 77 F0      [19] 4382 	ld	-16 (ix),a
   66AF DD 7E ED      [19] 4383 	ld	a,-19 (ix)
   66B2 B7            [ 4] 4384 	or	a, a
   66B3 28 0C         [12] 4385 	jr	Z,00149$
   66B5 DD 7E FB      [19] 4386 	ld	a,-5 (ix)
   66B8 DD 77 EF      [19] 4387 	ld	-17 (ix),a
   66BB DD 7E FC      [19] 4388 	ld	a,-4 (ix)
   66BE DD 77 F0      [19] 4389 	ld	-16 (ix),a
   66C1                    4390 00149$:
   66C1 DD CB F0 2E   [23] 4391 	sra	-16 (ix)
   66C5 DD CB EF 1E   [23] 4392 	rr	-17 (ix)
   66C9 DD CB F0 2E   [23] 4393 	sra	-16 (ix)
   66CD DD CB EF 1E   [23] 4394 	rr	-17 (ix)
   66D1 DD 7E EF      [19] 4395 	ld	a,-17 (ix)
   66D4 DD 86 F9      [19] 4396 	add	a, -7 (ix)
   66D7 DD 77 EF      [19] 4397 	ld	-17 (ix),a
   66DA DD 7E F0      [19] 4398 	ld	a,-16 (ix)
   66DD DD 8E FA      [19] 4399 	adc	a, -6 (ix)
   66E0 DD 77 F0      [19] 4400 	ld	-16 (ix),a
   66E3 DD 6E EF      [19] 4401 	ld	l,-17 (ix)
   66E6 DD 66 F0      [19] 4402 	ld	h,-16 (ix)
   66E9 7E            [ 7] 4403 	ld	a,(hl)
   66EA DD 77 F8      [19] 4404 	ld	-8 (ix), a
   66ED D6 09         [ 7] 4405 	sub	a, #0x09
   66EF CA 22 68      [10] 4406 	jp	Z,00112$
                           4407 ;src/CalcColision.h:74: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   66F2 DD 7E F1      [19] 4408 	ld	a,-15 (ix)
   66F5 DD 77 EF      [19] 4409 	ld	-17 (ix),a
   66F8 DD 7E F2      [19] 4410 	ld	a,-14 (ix)
   66FB DD 77 F0      [19] 4411 	ld	-16 (ix),a
   66FE DD 7E EE      [19] 4412 	ld	a,-18 (ix)
   6701 B7            [ 4] 4413 	or	a, a
   6702 28 0C         [12] 4414 	jr	Z,00150$
   6704 DD 7E FD      [19] 4415 	ld	a,-3 (ix)
   6707 DD 77 EF      [19] 4416 	ld	-17 (ix),a
   670A DD 7E FE      [19] 4417 	ld	a,-2 (ix)
   670D DD 77 F0      [19] 4418 	ld	-16 (ix),a
   6710                    4419 00150$:
   6710 DD CB F0 2E   [23] 4420 	sra	-16 (ix)
   6714 DD CB EF 1E   [23] 4421 	rr	-17 (ix)
   6718 DD CB F0 2E   [23] 4422 	sra	-16 (ix)
   671C DD CB EF 1E   [23] 4423 	rr	-17 (ix)
   6720 DD CB F0 2E   [23] 4424 	sra	-16 (ix)
   6724 DD CB EF 1E   [23] 4425 	rr	-17 (ix)
   6728 DD CB F0 2E   [23] 4426 	sra	-16 (ix)
   672C DD CB EF 1E   [23] 4427 	rr	-17 (ix)
   6730 DD 4E EF      [19] 4428 	ld	c,-17 (ix)
   6733 DD 46 F0      [19] 4429 	ld	b,-16 (ix)
   6736 69            [ 4] 4430 	ld	l, c
   6737 60            [ 4] 4431 	ld	h, b
   6738 29            [11] 4432 	add	hl, hl
   6739 29            [11] 4433 	add	hl, hl
   673A 09            [11] 4434 	add	hl, bc
   673B 29            [11] 4435 	add	hl, hl
   673C 29            [11] 4436 	add	hl, hl
   673D DD 75 EF      [19] 4437 	ld	-17 (ix),l
   6740 DD 74 F0      [19] 4438 	ld	-16 (ix),h
   6743 DD 7E EF      [19] 4439 	ld	a,-17 (ix)
   6746 C6 E0         [ 7] 4440 	add	a, #<(_scene)
   6748 DD 77 EF      [19] 4441 	ld	-17 (ix),a
   674B DD 7E F0      [19] 4442 	ld	a,-16 (ix)
   674E CE 8F         [ 7] 4443 	adc	a, #>(_scene)
   6750 DD 77 F0      [19] 4444 	ld	-16 (ix),a
   6753 DD 7E EF      [19] 4445 	ld	a,-17 (ix)
   6756 DD 86 FF      [19] 4446 	add	a, -1 (ix)
   6759 DD 77 EF      [19] 4447 	ld	-17 (ix),a
   675C DD 7E F0      [19] 4448 	ld	a,-16 (ix)
   675F CE 00         [ 7] 4449 	adc	a, #0x00
   6761 DD 77 F0      [19] 4450 	ld	-16 (ix),a
   6764 DD 6E EF      [19] 4451 	ld	l,-17 (ix)
   6767 DD 66 F0      [19] 4452 	ld	h,-16 (ix)
   676A 7E            [ 7] 4453 	ld	a,(hl)
   676B DD 77 F8      [19] 4454 	ld	-8 (ix), a
   676E D6 09         [ 7] 4455 	sub	a, #0x09
   6770 CA 22 68      [10] 4456 	jp	Z,00112$
                           4457 ;src/CalcColision.h:75: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   6773 DD 7E F1      [19] 4458 	ld	a,-15 (ix)
   6776 DD 77 EF      [19] 4459 	ld	-17 (ix),a
   6779 DD 7E F2      [19] 4460 	ld	a,-14 (ix)
   677C DD 77 F0      [19] 4461 	ld	-16 (ix),a
   677F DD 7E EE      [19] 4462 	ld	a,-18 (ix)
   6782 B7            [ 4] 4463 	or	a, a
   6783 28 0C         [12] 4464 	jr	Z,00151$
   6785 DD 7E FD      [19] 4465 	ld	a,-3 (ix)
   6788 DD 77 EF      [19] 4466 	ld	-17 (ix),a
   678B DD 7E FE      [19] 4467 	ld	a,-2 (ix)
   678E DD 77 F0      [19] 4468 	ld	-16 (ix),a
   6791                    4469 00151$:
   6791 DD CB F0 2E   [23] 4470 	sra	-16 (ix)
   6795 DD CB EF 1E   [23] 4471 	rr	-17 (ix)
   6799 DD CB F0 2E   [23] 4472 	sra	-16 (ix)
   679D DD CB EF 1E   [23] 4473 	rr	-17 (ix)
   67A1 DD CB F0 2E   [23] 4474 	sra	-16 (ix)
   67A5 DD CB EF 1E   [23] 4475 	rr	-17 (ix)
   67A9 DD CB F0 2E   [23] 4476 	sra	-16 (ix)
   67AD DD CB EF 1E   [23] 4477 	rr	-17 (ix)
   67B1 DD 4E EF      [19] 4478 	ld	c,-17 (ix)
   67B4 DD 46 F0      [19] 4479 	ld	b,-16 (ix)
   67B7 69            [ 4] 4480 	ld	l, c
   67B8 60            [ 4] 4481 	ld	h, b
   67B9 29            [11] 4482 	add	hl, hl
   67BA 29            [11] 4483 	add	hl, hl
   67BB 09            [11] 4484 	add	hl, bc
   67BC 29            [11] 4485 	add	hl, hl
   67BD 29            [11] 4486 	add	hl, hl
   67BE DD 75 EF      [19] 4487 	ld	-17 (ix),l
   67C1 DD 74 F0      [19] 4488 	ld	-16 (ix),h
   67C4 3E E0         [ 7] 4489 	ld	a,#<(_scene)
   67C6 DD 86 EF      [19] 4490 	add	a, -17 (ix)
   67C9 DD 77 EF      [19] 4491 	ld	-17 (ix),a
   67CC 3E 8F         [ 7] 4492 	ld	a,#>(_scene)
   67CE DD 8E F0      [19] 4493 	adc	a, -16 (ix)
   67D1 DD 77 F0      [19] 4494 	ld	-16 (ix),a
   67D4 DD 7E F6      [19] 4495 	ld	a,-10 (ix)
   67D7 DD 77 F4      [19] 4496 	ld	-12 (ix),a
   67DA DD 7E F7      [19] 4497 	ld	a,-9 (ix)
   67DD DD 77 F5      [19] 4498 	ld	-11 (ix),a
   67E0 DD 7E ED      [19] 4499 	ld	a,-19 (ix)
   67E3 B7            [ 4] 4500 	or	a, a
   67E4 28 0C         [12] 4501 	jr	Z,00152$
   67E6 DD 7E FB      [19] 4502 	ld	a,-5 (ix)
   67E9 DD 77 F4      [19] 4503 	ld	-12 (ix),a
   67EC DD 7E FC      [19] 4504 	ld	a,-4 (ix)
   67EF DD 77 F5      [19] 4505 	ld	-11 (ix),a
   67F2                    4506 00152$:
   67F2 DD CB F5 2E   [23] 4507 	sra	-11 (ix)
   67F6 DD CB F4 1E   [23] 4508 	rr	-12 (ix)
   67FA DD CB F5 2E   [23] 4509 	sra	-11 (ix)
   67FE DD CB F4 1E   [23] 4510 	rr	-12 (ix)
   6802 DD 7E F4      [19] 4511 	ld	a,-12 (ix)
   6805 DD 86 EF      [19] 4512 	add	a, -17 (ix)
   6808 DD 77 EF      [19] 4513 	ld	-17 (ix),a
   680B DD 7E F5      [19] 4514 	ld	a,-11 (ix)
   680E DD 8E F0      [19] 4515 	adc	a, -16 (ix)
   6811 DD 77 F0      [19] 4516 	ld	-16 (ix),a
   6814 DD 6E EF      [19] 4517 	ld	l,-17 (ix)
   6817 DD 66 F0      [19] 4518 	ld	h,-16 (ix)
   681A 7E            [ 7] 4519 	ld	a,(hl)
   681B DD 77 F8      [19] 4520 	ld	-8 (ix), a
   681E D6 09         [ 7] 4521 	sub	a, #0x09
   6820 20 62         [12] 4522 	jr	NZ,00135$
   6822                    4523 00112$:
                           4524 ;src/CalcColision.h:78: if(enemy.life == 0){
   6822 3A F9 90      [13] 4525 	ld	a, (#(_enemy + 0x0008) + 0)
   6825 B7            [ 4] 4526 	or	a, a
   6826 20 4F         [12] 4527 	jr	NZ,00110$
                           4528 ;src/CalcColision.h:79: map+=1;
   6828 21 D1 90      [10] 4529 	ld	hl, #_map+0
   682B 34            [11] 4530 	inc	(hl)
                           4531 ;src/CalcColision.h:80: if(map > maps){
   682C 3E 04         [ 7] 4532 	ld	a,#0x04
   682E FD 21 D1 90   [14] 4533 	ld	iy,#_map
   6832 FD 96 00      [19] 4534 	sub	a, 0 (iy)
   6835 30 0A         [12] 4535 	jr	NC,00108$
                           4536 ;src/CalcColision.h:81: endGame();
   6837 CD 6D 4E      [17] 4537 	call	_endGame
                           4538 ;src/CalcColision.h:82: finish = 1;
   683A 21 D3 90      [10] 4539 	ld	hl,#_finish + 0
   683D 36 01         [10] 4540 	ld	(hl), #0x01
                           4541 ;src/CalcColision.h:83: return;
   683F 18 43         [12] 4542 	jr	00135$
   6841                    4543 00108$:
                           4544 ;src/CalcColision.h:86: initVariables(map);
   6841 3A D1 90      [13] 4545 	ld	a,(_map)
   6844 F5            [11] 4546 	push	af
   6845 33            [ 6] 4547 	inc	sp
   6846 CD 41 4E      [17] 4548 	call	_initVariables
   6849 33            [ 6] 4549 	inc	sp
                           4550 ;src/CalcColision.h:87: restartPlayer(map);
   684A 3A D1 90      [13] 4551 	ld	a,(_map)
   684D F5            [11] 4552 	push	af
   684E 33            [ 6] 4553 	inc	sp
   684F CD 8B 4D      [17] 4554 	call	_restartPlayer
   6852 33            [ 6] 4555 	inc	sp
                           4556 ;src/CalcColision.h:88: initNivel();
   6853 CD 31 4E      [17] 4557 	call	_initNivel
                           4558 ;src/CalcColision.h:89: initEnemies(map);
   6856 3A D1 90      [13] 4559 	ld	a,(_map)
   6859 F5            [11] 4560 	push	af
   685A 33            [ 6] 4561 	inc	sp
   685B CD CB 4D      [17] 4562 	call	_initEnemies
   685E 33            [ 6] 4563 	inc	sp
                           4564 ;src/CalcColision.h:91: cpct_clearScreen(0);
   685F 21 00 40      [10] 4565 	ld	hl,#0x4000
   6862 E5            [11] 4566 	push	hl
   6863 AF            [ 4] 4567 	xor	a, a
   6864 F5            [11] 4568 	push	af
   6865 33            [ 6] 4569 	inc	sp
   6866 26 C0         [ 7] 4570 	ld	h, #0xC0
   6868 E5            [11] 4571 	push	hl
   6869 CD F7 8D      [17] 4572 	call	_cpct_memset
                           4573 ;src/CalcColision.h:93: drawMap(map);
   686C 3A D1 90      [13] 4574 	ld	a,(_map)
   686F F5            [11] 4575 	push	af
   6870 33            [ 6] 4576 	inc	sp
   6871 CD BE 51      [17] 4577 	call	_drawMap
   6874 33            [ 6] 4578 	inc	sp
   6875 18 0D         [12] 4579 	jr	00135$
   6877                    4580 00110$:
                           4581 ;src/CalcColision.h:95: player.x=player.lx;
   6877 3A E8 90      [13] 4582 	ld	a, (#(_player + 0x0002) + 0)
   687A 21 E6 90      [10] 4583 	ld	hl,#_player
   687D 77            [ 7] 4584 	ld	(hl),a
                           4585 ;src/CalcColision.h:96: player.y=player.ly;
   687E 3A E9 90      [13] 4586 	ld	a, (#(_player + 0x0003) + 0)
   6881 32 E7 90      [13] 4587 	ld	(#(_player + 0x0001)),a
   6884                    4588 00135$:
   6884 DD F9         [10] 4589 	ld	sp, ix
   6886 DD E1         [14] 4590 	pop	ix
   6888 C9            [10] 4591 	ret
                           4592 ;src/CalcColision.h:102: u8 checkArrowCollisions(){
                           4593 ;	---------------------------------
                           4594 ; Function checkArrowCollisions
                           4595 ; ---------------------------------
   6889                    4596 _checkArrowCollisions::
   6889 DD E5         [15] 4597 	push	ix
   688B DD 21 00 00   [14] 4598 	ld	ix,#0
   688F DD 39         [15] 4599 	add	ix,sp
   6891 21 F2 FF      [10] 4600 	ld	hl,#-14
   6894 39            [11] 4601 	add	hl,sp
   6895 F9            [ 6] 4602 	ld	sp,hl
                           4603 ;src/CalcColision.h:105: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   6896 3A DD 90      [13] 4604 	ld	a,(#(_object + 0x0001) + 0)
   6899 DD 77 F3      [19] 4605 	ld	-13 (ix), a
   689C 07            [ 4] 4606 	rlca
   689D 07            [ 4] 4607 	rlca
   689E 07            [ 4] 4608 	rlca
   689F 07            [ 4] 4609 	rlca
   68A0 E6 0F         [ 7] 4610 	and	a,#0x0F
   68A2 4F            [ 4] 4611 	ld	c,a
   68A3 06 00         [ 7] 4612 	ld	b,#0x00
   68A5 69            [ 4] 4613 	ld	l, c
   68A6 60            [ 4] 4614 	ld	h, b
   68A7 29            [11] 4615 	add	hl, hl
   68A8 29            [11] 4616 	add	hl, hl
   68A9 09            [11] 4617 	add	hl, bc
   68AA 29            [11] 4618 	add	hl, hl
   68AB 29            [11] 4619 	add	hl, hl
   68AC 3E E0         [ 7] 4620 	ld	a,#<(_scene)
   68AE 85            [ 4] 4621 	add	a, l
   68AF DD 77 F6      [19] 4622 	ld	-10 (ix),a
   68B2 3E 8F         [ 7] 4623 	ld	a,#>(_scene)
   68B4 8C            [ 4] 4624 	adc	a, h
   68B5 DD 77 F7      [19] 4625 	ld	-9 (ix),a
   68B8 21 DC 90      [10] 4626 	ld	hl, #_object + 0
   68BB 4E            [ 7] 4627 	ld	c,(hl)
   68BC 79            [ 4] 4628 	ld	a,c
   68BD 0F            [ 4] 4629 	rrca
   68BE 0F            [ 4] 4630 	rrca
   68BF E6 3F         [ 7] 4631 	and	a,#0x3F
   68C1 DD 77 F2      [19] 4632 	ld	-14 (ix), a
   68C4 DD 86 F6      [19] 4633 	add	a, -10 (ix)
   68C7 6F            [ 4] 4634 	ld	l,a
   68C8 3E 00         [ 7] 4635 	ld	a,#0x00
   68CA DD 8E F7      [19] 4636 	adc	a, -9 (ix)
   68CD 67            [ 4] 4637 	ld	h,a
   68CE 7E            [ 7] 4638 	ld	a,(hl)
                           4639 ;src/CalcColision.h:110: object.x=object.lx;
                           4640 ;src/CalcColision.h:111: object.y=object.ly;
                           4641 ;src/CalcColision.h:105: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   68CF DD 77 F4      [19] 4642 	ld	-12 (ix), a
   68D2 3D            [ 4] 4643 	dec	a
   68D3 CA F2 69      [10] 4644 	jp	Z,00101$
                           4645 ;src/CalcColision.h:106: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   68D6 06 00         [ 7] 4646 	ld	b,#0x00
   68D8 21 03 00      [10] 4647 	ld	hl,#0x0003
   68DB 09            [11] 4648 	add	hl,bc
   68DC DD 75 FC      [19] 4649 	ld	-4 (ix),l
   68DF DD 74 FD      [19] 4650 	ld	-3 (ix),h
   68E2 DD 7E FC      [19] 4651 	ld	a,-4 (ix)
   68E5 DD 77 FA      [19] 4652 	ld	-6 (ix),a
   68E8 DD 7E FD      [19] 4653 	ld	a,-3 (ix)
   68EB DD 77 FB      [19] 4654 	ld	-5 (ix),a
   68EE DD 7E FD      [19] 4655 	ld	a,-3 (ix)
   68F1 07            [ 4] 4656 	rlca
   68F2 E6 01         [ 7] 4657 	and	a,#0x01
   68F4 DD 77 F5      [19] 4658 	ld	-11 (ix),a
   68F7 21 06 00      [10] 4659 	ld	hl,#0x0006
   68FA 09            [11] 4660 	add	hl,bc
   68FB DD 75 FE      [19] 4661 	ld	-2 (ix),l
   68FE DD 74 FF      [19] 4662 	ld	-1 (ix),h
   6901 DD 7E F5      [19] 4663 	ld	a,-11 (ix)
   6904 B7            [ 4] 4664 	or	a, a
   6905 28 0C         [12] 4665 	jr	Z,00113$
   6907 DD 7E FE      [19] 4666 	ld	a,-2 (ix)
   690A DD 77 FA      [19] 4667 	ld	-6 (ix),a
   690D DD 7E FF      [19] 4668 	ld	a,-1 (ix)
   6910 DD 77 FB      [19] 4669 	ld	-5 (ix),a
   6913                    4670 00113$:
   6913 DD 6E FA      [19] 4671 	ld	l,-6 (ix)
   6916 DD 66 FB      [19] 4672 	ld	h,-5 (ix)
   6919 CB 2C         [ 8] 4673 	sra	h
   691B CB 1D         [ 8] 4674 	rr	l
   691D CB 2C         [ 8] 4675 	sra	h
   691F CB 1D         [ 8] 4676 	rr	l
   6921 DD 5E F6      [19] 4677 	ld	e,-10 (ix)
   6924 DD 56 F7      [19] 4678 	ld	d,-9 (ix)
   6927 19            [11] 4679 	add	hl,de
   6928 7E            [ 7] 4680 	ld	a,(hl)
   6929 3D            [ 4] 4681 	dec	a
   692A CA F2 69      [10] 4682 	jp	Z,00101$
                           4683 ;src/CalcColision.h:107: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 1
   692D DD 5E F3      [19] 4684 	ld	e,-13 (ix)
   6930 16 00         [ 7] 4685 	ld	d,#0x00
   6932 21 06 00      [10] 4686 	ld	hl,#0x0006
   6935 19            [11] 4687 	add	hl,de
   6936 4D            [ 4] 4688 	ld	c,l
   6937 44            [ 4] 4689 	ld	b,h
   6938 DD 71 FA      [19] 4690 	ld	-6 (ix),c
   693B DD 70 FB      [19] 4691 	ld	-5 (ix),b
   693E 78            [ 4] 4692 	ld	a,b
   693F 07            [ 4] 4693 	rlca
   6940 E6 01         [ 7] 4694 	and	a,#0x01
   6942 DD 77 F3      [19] 4695 	ld	-13 (ix),a
   6945 21 15 00      [10] 4696 	ld	hl,#0x0015
   6948 19            [11] 4697 	add	hl,de
   6949 DD 75 F8      [19] 4698 	ld	-8 (ix),l
   694C DD 74 F9      [19] 4699 	ld	-7 (ix),h
   694F DD 7E F3      [19] 4700 	ld	a,-13 (ix)
   6952 B7            [ 4] 4701 	or	a, a
   6953 28 0C         [12] 4702 	jr	Z,00114$
   6955 DD 7E F8      [19] 4703 	ld	a,-8 (ix)
   6958 DD 77 FA      [19] 4704 	ld	-6 (ix),a
   695B DD 7E F9      [19] 4705 	ld	a,-7 (ix)
   695E DD 77 FB      [19] 4706 	ld	-5 (ix),a
   6961                    4707 00114$:
   6961 DD 6E FA      [19] 4708 	ld	l,-6 (ix)
   6964 DD 66 FB      [19] 4709 	ld	h,-5 (ix)
   6967 CB 2C         [ 8] 4710 	sra	h
   6969 CB 1D         [ 8] 4711 	rr	l
   696B CB 2C         [ 8] 4712 	sra	h
   696D CB 1D         [ 8] 4713 	rr	l
   696F CB 2C         [ 8] 4714 	sra	h
   6971 CB 1D         [ 8] 4715 	rr	l
   6973 CB 2C         [ 8] 4716 	sra	h
   6975 CB 1D         [ 8] 4717 	rr	l
   6977 5D            [ 4] 4718 	ld	e, l
   6978 54            [ 4] 4719 	ld	d, h
   6979 29            [11] 4720 	add	hl, hl
   697A 29            [11] 4721 	add	hl, hl
   697B 19            [11] 4722 	add	hl, de
   697C 29            [11] 4723 	add	hl, hl
   697D 29            [11] 4724 	add	hl, hl
   697E 11 E0 8F      [10] 4725 	ld	de,#_scene
   6981 19            [11] 4726 	add	hl,de
   6982 DD 5E F2      [19] 4727 	ld	e,-14 (ix)
   6985 16 00         [ 7] 4728 	ld	d,#0x00
   6987 19            [11] 4729 	add	hl,de
   6988 7E            [ 7] 4730 	ld	a,(hl)
   6989 3D            [ 4] 4731 	dec	a
   698A 28 66         [12] 4732 	jr	Z,00101$
                           4733 ;src/CalcColision.h:108: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   698C DD 71 FA      [19] 4734 	ld	-6 (ix),c
   698F DD 70 FB      [19] 4735 	ld	-5 (ix),b
   6992 DD 7E F3      [19] 4736 	ld	a,-13 (ix)
   6995 B7            [ 4] 4737 	or	a, a
   6996 28 0C         [12] 4738 	jr	Z,00115$
   6998 DD 7E F8      [19] 4739 	ld	a,-8 (ix)
   699B DD 77 FA      [19] 4740 	ld	-6 (ix),a
   699E DD 7E F9      [19] 4741 	ld	a,-7 (ix)
   69A1 DD 77 FB      [19] 4742 	ld	-5 (ix),a
   69A4                    4743 00115$:
   69A4 DD 6E FA      [19] 4744 	ld	l,-6 (ix)
   69A7 DD 66 FB      [19] 4745 	ld	h,-5 (ix)
   69AA CB 2C         [ 8] 4746 	sra	h
   69AC CB 1D         [ 8] 4747 	rr	l
   69AE CB 2C         [ 8] 4748 	sra	h
   69B0 CB 1D         [ 8] 4749 	rr	l
   69B2 CB 2C         [ 8] 4750 	sra	h
   69B4 CB 1D         [ 8] 4751 	rr	l
   69B6 CB 2C         [ 8] 4752 	sra	h
   69B8 CB 1D         [ 8] 4753 	rr	l
   69BA 5D            [ 4] 4754 	ld	e, l
   69BB 54            [ 4] 4755 	ld	d, h
   69BC 29            [11] 4756 	add	hl, hl
   69BD 29            [11] 4757 	add	hl, hl
   69BE 19            [11] 4758 	add	hl, de
   69BF 29            [11] 4759 	add	hl, hl
   69C0 29            [11] 4760 	add	hl, hl
   69C1 3E E0         [ 7] 4761 	ld	a,#<(_scene)
   69C3 85            [ 4] 4762 	add	a, l
   69C4 DD 77 FA      [19] 4763 	ld	-6 (ix),a
   69C7 3E 8F         [ 7] 4764 	ld	a,#>(_scene)
   69C9 8C            [ 4] 4765 	adc	a, h
   69CA DD 77 FB      [19] 4766 	ld	-5 (ix),a
   69CD DD 6E FC      [19] 4767 	ld	l,-4 (ix)
   69D0 DD 66 FD      [19] 4768 	ld	h,-3 (ix)
   69D3 DD 7E F5      [19] 4769 	ld	a,-11 (ix)
   69D6 B7            [ 4] 4770 	or	a, a
   69D7 28 06         [12] 4771 	jr	Z,00116$
   69D9 DD 6E FE      [19] 4772 	ld	l,-2 (ix)
   69DC DD 66 FF      [19] 4773 	ld	h,-1 (ix)
   69DF                    4774 00116$:
   69DF CB 2C         [ 8] 4775 	sra	h
   69E1 CB 1D         [ 8] 4776 	rr	l
   69E3 CB 2C         [ 8] 4777 	sra	h
   69E5 CB 1D         [ 8] 4778 	rr	l
   69E7 DD 5E FA      [19] 4779 	ld	e,-6 (ix)
   69EA DD 56 FB      [19] 4780 	ld	d,-5 (ix)
   69ED 19            [11] 4781 	add	hl,de
   69EE 7E            [ 7] 4782 	ld	a,(hl)
   69EF 3D            [ 4] 4783 	dec	a
   69F0 20 11         [12] 4784 	jr	NZ,00102$
   69F2                    4785 00101$:
                           4786 ;src/CalcColision.h:110: object.x=object.lx;
   69F2 3A DE 90      [13] 4787 	ld	a, (#(_object + 0x0002) + 0)
   69F5 32 DC 90      [13] 4788 	ld	(#_object),a
                           4789 ;src/CalcColision.h:111: object.y=object.ly;
   69F8 3A DF 90      [13] 4790 	ld	a, (#(_object + 0x0003) + 0)
   69FB 32 DD 90      [13] 4791 	ld	(#(_object + 0x0001)),a
                           4792 ;src/CalcColision.h:113: return bound;
   69FE 2E 01         [ 7] 4793 	ld	l,#0x01
   6A00 C3 CD 6A      [10] 4794 	jp	00111$
   6A03                    4795 00102$:
                           4796 ;src/CalcColision.h:116: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 9
   6A03 DD 7E F4      [19] 4797 	ld	a,-12 (ix)
   6A06 D6 09         [ 7] 4798 	sub	a, #0x09
   6A08 CA BB 6A      [10] 4799 	jp	Z,00106$
                           4800 ;src/CalcColision.h:117: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   6A0B DD 6E FC      [19] 4801 	ld	l,-4 (ix)
   6A0E DD 66 FD      [19] 4802 	ld	h,-3 (ix)
   6A11 DD 7E F5      [19] 4803 	ld	a,-11 (ix)
   6A14 B7            [ 4] 4804 	or	a, a
   6A15 28 06         [12] 4805 	jr	Z,00117$
   6A17 DD 6E FE      [19] 4806 	ld	l,-2 (ix)
   6A1A DD 66 FF      [19] 4807 	ld	h,-1 (ix)
   6A1D                    4808 00117$:
   6A1D CB 2C         [ 8] 4809 	sra	h
   6A1F CB 1D         [ 8] 4810 	rr	l
   6A21 CB 2C         [ 8] 4811 	sra	h
   6A23 CB 1D         [ 8] 4812 	rr	l
   6A25 DD 5E F6      [19] 4813 	ld	e,-10 (ix)
   6A28 DD 56 F7      [19] 4814 	ld	d,-9 (ix)
   6A2B 19            [11] 4815 	add	hl,de
   6A2C 7E            [ 7] 4816 	ld	a,(hl)
   6A2D D6 09         [ 7] 4817 	sub	a, #0x09
   6A2F CA BB 6A      [10] 4818 	jp	Z,00106$
                           4819 ;src/CalcColision.h:118: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 9
   6A32 69            [ 4] 4820 	ld	l, c
   6A33 60            [ 4] 4821 	ld	h, b
   6A34 DD 7E F3      [19] 4822 	ld	a,-13 (ix)
   6A37 B7            [ 4] 4823 	or	a, a
   6A38 28 06         [12] 4824 	jr	Z,00118$
   6A3A DD 6E F8      [19] 4825 	ld	l,-8 (ix)
   6A3D DD 66 F9      [19] 4826 	ld	h,-7 (ix)
   6A40                    4827 00118$:
   6A40 CB 2C         [ 8] 4828 	sra	h
   6A42 CB 1D         [ 8] 4829 	rr	l
   6A44 CB 2C         [ 8] 4830 	sra	h
   6A46 CB 1D         [ 8] 4831 	rr	l
   6A48 CB 2C         [ 8] 4832 	sra	h
   6A4A CB 1D         [ 8] 4833 	rr	l
   6A4C CB 2C         [ 8] 4834 	sra	h
   6A4E CB 1D         [ 8] 4835 	rr	l
   6A50 5D            [ 4] 4836 	ld	e, l
   6A51 54            [ 4] 4837 	ld	d, h
   6A52 29            [11] 4838 	add	hl, hl
   6A53 29            [11] 4839 	add	hl, hl
   6A54 19            [11] 4840 	add	hl, de
   6A55 29            [11] 4841 	add	hl, hl
   6A56 29            [11] 4842 	add	hl, hl
   6A57 11 E0 8F      [10] 4843 	ld	de,#_scene
   6A5A 19            [11] 4844 	add	hl,de
   6A5B DD 5E F2      [19] 4845 	ld	e,-14 (ix)
   6A5E 16 00         [ 7] 4846 	ld	d,#0x00
   6A60 19            [11] 4847 	add	hl,de
   6A61 7E            [ 7] 4848 	ld	a,(hl)
   6A62 D6 09         [ 7] 4849 	sub	a, #0x09
   6A64 28 55         [12] 4850 	jr	Z,00106$
                           4851 ;src/CalcColision.h:119: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   6A66 DD 7E F3      [19] 4852 	ld	a,-13 (ix)
   6A69 B7            [ 4] 4853 	or	a, a
   6A6A 28 06         [12] 4854 	jr	Z,00119$
   6A6C DD 4E F8      [19] 4855 	ld	c,-8 (ix)
   6A6F DD 46 F9      [19] 4856 	ld	b,-7 (ix)
   6A72                    4857 00119$:
   6A72 CB 28         [ 8] 4858 	sra	b
   6A74 CB 19         [ 8] 4859 	rr	c
   6A76 CB 28         [ 8] 4860 	sra	b
   6A78 CB 19         [ 8] 4861 	rr	c
   6A7A CB 28         [ 8] 4862 	sra	b
   6A7C CB 19         [ 8] 4863 	rr	c
   6A7E CB 28         [ 8] 4864 	sra	b
   6A80 CB 19         [ 8] 4865 	rr	c
   6A82 69            [ 4] 4866 	ld	l, c
   6A83 60            [ 4] 4867 	ld	h, b
   6A84 29            [11] 4868 	add	hl, hl
   6A85 29            [11] 4869 	add	hl, hl
   6A86 09            [11] 4870 	add	hl, bc
   6A87 29            [11] 4871 	add	hl, hl
   6A88 29            [11] 4872 	add	hl, hl
   6A89 3E E0         [ 7] 4873 	ld	a,#<(_scene)
   6A8B 85            [ 4] 4874 	add	a, l
   6A8C DD 77 F8      [19] 4875 	ld	-8 (ix),a
   6A8F 3E 8F         [ 7] 4876 	ld	a,#>(_scene)
   6A91 8C            [ 4] 4877 	adc	a, h
   6A92 DD 77 F9      [19] 4878 	ld	-7 (ix),a
   6A95 DD 6E FC      [19] 4879 	ld	l,-4 (ix)
   6A98 DD 66 FD      [19] 4880 	ld	h,-3 (ix)
   6A9B DD 7E F5      [19] 4881 	ld	a,-11 (ix)
   6A9E B7            [ 4] 4882 	or	a, a
   6A9F 28 06         [12] 4883 	jr	Z,00120$
   6AA1 DD 6E FE      [19] 4884 	ld	l,-2 (ix)
   6AA4 DD 66 FF      [19] 4885 	ld	h,-1 (ix)
   6AA7                    4886 00120$:
   6AA7 CB 2C         [ 8] 4887 	sra	h
   6AA9 CB 1D         [ 8] 4888 	rr	l
   6AAB CB 2C         [ 8] 4889 	sra	h
   6AAD CB 1D         [ 8] 4890 	rr	l
   6AAF DD 5E F8      [19] 4891 	ld	e,-8 (ix)
   6AB2 DD 56 F9      [19] 4892 	ld	d,-7 (ix)
   6AB5 19            [11] 4893 	add	hl,de
   6AB6 7E            [ 7] 4894 	ld	a,(hl)
   6AB7 D6 09         [ 7] 4895 	sub	a, #0x09
   6AB9 20 10         [12] 4896 	jr	NZ,00107$
   6ABB                    4897 00106$:
                           4898 ;src/CalcColision.h:121: object.x=object.lx;
   6ABB 3A DE 90      [13] 4899 	ld	a, (#(_object + 0x0002) + 0)
   6ABE 32 DC 90      [13] 4900 	ld	(#_object),a
                           4901 ;src/CalcColision.h:122: object.y=object.ly;
   6AC1 3A DF 90      [13] 4902 	ld	a, (#(_object + 0x0003) + 0)
   6AC4 32 DD 90      [13] 4903 	ld	(#(_object + 0x0001)),a
                           4904 ;src/CalcColision.h:124: return bound;
   6AC7 2E 01         [ 7] 4905 	ld	l,#0x01
   6AC9 18 02         [12] 4906 	jr	00111$
   6ACB                    4907 00107$:
                           4908 ;src/CalcColision.h:127: return bound;
   6ACB 2E 00         [ 7] 4909 	ld	l,#0x00
   6ACD                    4910 00111$:
   6ACD DD F9         [10] 4911 	ld	sp, ix
   6ACF DD E1         [14] 4912 	pop	ix
   6AD1 C9            [10] 4913 	ret
                           4914 ;src/keyboard.h:13: u8* checkKeyboard(){
                           4915 ;	---------------------------------
                           4916 ; Function checkKeyboard
                           4917 ; ---------------------------------
   6AD2                    4918 _checkKeyboard::
   6AD2 DD E5         [15] 4919 	push	ix
   6AD4 DD 21 00 00   [14] 4920 	ld	ix,#0
   6AD8 DD 39         [15] 4921 	add	ix,sp
   6ADA 21 FA FF      [10] 4922 	ld	hl,#-6
   6ADD 39            [11] 4923 	add	hl,sp
   6ADE F9            [ 6] 4924 	ld	sp,hl
                           4925 ;src/keyboard.h:14: u8 *s = NULL;
   6ADF DD 36 FE 00   [19] 4926 	ld	-2 (ix),#0x00
   6AE3 DD 36 FF 00   [19] 4927 	ld	-1 (ix),#0x00
                           4928 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   6AE7 21 05 80      [10] 4929 	ld	hl,#0x8005
   6AEA CD 1C 8B      [17] 4930 	call	_cpct_isKeyPressed
   6AED 4D            [ 4] 4931 	ld	c,l
   6AEE 79            [ 4] 4932 	ld	a,c
   6AEF B7            [ 4] 4933 	or	a, a
   6AF0 28 68         [12] 4934 	jr	Z,00145$
   6AF2 21 EE 90      [10] 4935 	ld	hl, #(_player + 0x0008) + 0
   6AF5 7E            [ 7] 4936 	ld	a,(hl)
   6AF6 DD 77 FB      [19] 4937 	ld	-5 (ix), a
   6AF9 D6 14         [ 7] 4938 	sub	a, #0x14
   6AFB 38 5D         [12] 4939 	jr	C,00145$
                           4940 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   6AFD DD 7E FB      [19] 4941 	ld	a,-5 (ix)
   6B00 D6 32         [ 7] 4942 	sub	a, #0x32
   6B02 38 07         [12] 4943 	jr	C,00102$
   6B04 21 EE 90      [10] 4944 	ld	hl,#(_player + 0x0008)
   6B07 36 00         [10] 4945 	ld	(hl),#0x00
   6B09 18 08         [12] 4946 	jr	00103$
   6B0B                    4947 00102$:
                           4948 ;src/keyboard.h:17: else player.atk += 1;
   6B0B DD 7E FB      [19] 4949 	ld	a,-5 (ix)
   6B0E 3C            [ 4] 4950 	inc	a
   6B0F 21 EE 90      [10] 4951 	ld	hl,#(_player + 0x0008)
   6B12 77            [ 7] 4952 	ld	(hl),a
   6B13                    4953 00103$:
                           4954 ;src/keyboard.h:18: switch(player.dir){
   6B13 21 ED 90      [10] 4955 	ld	hl, #_player + 7
   6B16 66            [ 7] 4956 	ld	h,(hl)
   6B17 7C            [ 4] 4957 	ld	a,h
   6B18 D6 02         [ 7] 4958 	sub	a, #0x02
   6B1A 28 33         [12] 4959 	jr	Z,00107$
   6B1C 7C            [ 4] 4960 	ld	a,h
   6B1D D6 04         [ 7] 4961 	sub	a, #0x04
   6B1F 28 0D         [12] 4962 	jr	Z,00104$
   6B21 7C            [ 4] 4963 	ld	a,h
   6B22 D6 06         [ 7] 4964 	sub	a, #0x06
   6B24 28 13         [12] 4965 	jr	Z,00105$
   6B26 7C            [ 4] 4966 	ld	a,h
   6B27 D6 08         [ 7] 4967 	sub	a, #0x08
   6B29 28 19         [12] 4968 	jr	Z,00106$
   6B2B C3 34 6D      [10] 4969 	jp	00146$
                           4970 ;src/keyboard.h:19: case 4:
   6B2E                    4971 00104$:
                           4972 ;src/keyboard.h:20: s = gladis_atk_izda;
   6B2E DD 36 FE 80   [19] 4973 	ld	-2 (ix),#<(_gladis_atk_izda)
   6B32 DD 36 FF 41   [19] 4974 	ld	-1 (ix),#>(_gladis_atk_izda)
                           4975 ;src/keyboard.h:21: break;
   6B36 C3 34 6D      [10] 4976 	jp	00146$
                           4977 ;src/keyboard.h:22: case 6:
   6B39                    4978 00105$:
                           4979 ;src/keyboard.h:23: s = gladis_atk_dcha;
   6B39 DD 36 FE 00   [19] 4980 	ld	-2 (ix),#<(_gladis_atk_dcha)
   6B3D DD 36 FF 41   [19] 4981 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           4982 ;src/keyboard.h:24: break;
   6B41 C3 34 6D      [10] 4983 	jp	00146$
                           4984 ;src/keyboard.h:25: case 8:
   6B44                    4985 00106$:
                           4986 ;src/keyboard.h:26: s = gladis_atk_arriba;
   6B44 DD 36 FE 80   [19] 4987 	ld	-2 (ix),#<(_gladis_atk_arriba)
   6B48 DD 36 FF 43   [19] 4988 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           4989 ;src/keyboard.h:27: break;
   6B4C C3 34 6D      [10] 4990 	jp	00146$
                           4991 ;src/keyboard.h:28: case 2:
   6B4F                    4992 00107$:
                           4993 ;src/keyboard.h:29: s = gladis_atk_abajo;
   6B4F DD 36 FE 00   [19] 4994 	ld	-2 (ix),#<(_gladis_atk_abajo)
   6B53 DD 36 FF 43   [19] 4995 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           4996 ;src/keyboard.h:31: }
   6B57 C3 34 6D      [10] 4997 	jp	00146$
   6B5A                    4998 00145$:
                           4999 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   6B5A 21 EE 90      [10] 5000 	ld	hl, #(_player + 0x0008) + 0
   6B5D 56            [ 7] 5001 	ld	d,(hl)
   6B5E 7A            [ 4] 5002 	ld	a,d
   6B5F D6 14         [ 7] 5003 	sub	a, #0x14
   6B61 30 07         [12] 5004 	jr	NC,00110$
   6B63 14            [ 4] 5005 	inc	d
   6B64 21 EE 90      [10] 5006 	ld	hl,#(_player + 0x0008)
   6B67 72            [ 7] 5007 	ld	(hl),d
   6B68 18 05         [12] 5008 	jr	00111$
   6B6A                    5009 00110$:
                           5010 ;src/keyboard.h:34: else player.atk = 20;
   6B6A 21 EE 90      [10] 5011 	ld	hl,#(_player + 0x0008)
   6B6D 36 14         [10] 5012 	ld	(hl),#0x14
   6B6F                    5013 00111$:
                           5014 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   6B6F 21 00 02      [10] 5015 	ld	hl,#0x0200
   6B72 CD 1C 8B      [17] 5016 	call	_cpct_isKeyPressed
                           5017 ;src/keyboard.h:37: player.dir = 6;
                           5018 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   6B75 7D            [ 4] 5019 	ld	a,l
   6B76 B7            [ 4] 5020 	or	a, a
   6B77 28 1E         [12] 5021 	jr	Z,00141$
   6B79 21 E6 90      [10] 5022 	ld	hl, #_player + 0
   6B7C 56            [ 7] 5023 	ld	d,(hl)
   6B7D 7A            [ 4] 5024 	ld	a,d
   6B7E D6 4C         [ 7] 5025 	sub	a, #0x4C
   6B80 30 15         [12] 5026 	jr	NC,00141$
                           5027 ;src/keyboard.h:36: player.x += 1;
   6B82 14            [ 4] 5028 	inc	d
   6B83 21 E6 90      [10] 5029 	ld	hl,#_player
   6B86 72            [ 7] 5030 	ld	(hl),d
                           5031 ;src/keyboard.h:37: player.dir = 6;
   6B87 21 ED 90      [10] 5032 	ld	hl,#(_player + 0x0007)
   6B8A 36 06         [10] 5033 	ld	(hl),#0x06
                           5034 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   6B8C DD 36 FE 00   [19] 5035 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   6B90 DD 36 FF 40   [19] 5036 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   6B94 C3 34 6D      [10] 5037 	jp	00146$
   6B97                    5038 00141$:
                           5039 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   6B97 21 01 01      [10] 5040 	ld	hl,#0x0101
   6B9A CD 1C 8B      [17] 5041 	call	_cpct_isKeyPressed
   6B9D 7D            [ 4] 5042 	ld	a,l
   6B9E B7            [ 4] 5043 	or	a, a
   6B9F 28 1B         [12] 5044 	jr	Z,00137$
   6BA1 3A E6 90      [13] 5045 	ld	a, (#_player + 0)
   6BA4 B7            [ 4] 5046 	or	a, a
   6BA5 28 15         [12] 5047 	jr	Z,00137$
                           5048 ;src/keyboard.h:40: player.x -= 1;
   6BA7 C6 FF         [ 7] 5049 	add	a,#0xFF
   6BA9 32 E6 90      [13] 5050 	ld	(#_player),a
                           5051 ;src/keyboard.h:41: player.dir = 4;
   6BAC 21 ED 90      [10] 5052 	ld	hl,#(_player + 0x0007)
   6BAF 36 04         [10] 5053 	ld	(hl),#0x04
                           5054 ;src/keyboard.h:42: s = gladis_quieto_izda;
   6BB1 DD 36 FE 80   [19] 5055 	ld	-2 (ix),#<(_gladis_quieto_izda)
   6BB5 DD 36 FF 40   [19] 5056 	ld	-1 (ix),#>(_gladis_quieto_izda)
   6BB9 C3 34 6D      [10] 5057 	jp	00146$
   6BBC                    5058 00137$:
                           5059 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   6BBC 21 00 04      [10] 5060 	ld	hl,#0x0400
   6BBF CD 1C 8B      [17] 5061 	call	_cpct_isKeyPressed
   6BC2 7D            [ 4] 5062 	ld	a,l
   6BC3 B7            [ 4] 5063 	or	a, a
   6BC4 28 1F         [12] 5064 	jr	Z,00133$
   6BC6 21 E7 90      [10] 5065 	ld	hl, #(_player + 0x0001) + 0
   6BC9 56            [ 7] 5066 	ld	d,(hl)
   6BCA 7A            [ 4] 5067 	ld	a,d
   6BCB D6 B4         [ 7] 5068 	sub	a, #0xB4
   6BCD 30 16         [12] 5069 	jr	NC,00133$
                           5070 ;src/keyboard.h:44: player.y += 2;
   6BCF 14            [ 4] 5071 	inc	d
   6BD0 14            [ 4] 5072 	inc	d
   6BD1 21 E7 90      [10] 5073 	ld	hl,#(_player + 0x0001)
   6BD4 72            [ 7] 5074 	ld	(hl),d
                           5075 ;src/keyboard.h:45: player.dir = 2;
   6BD5 21 ED 90      [10] 5076 	ld	hl,#(_player + 0x0007)
   6BD8 36 02         [10] 5077 	ld	(hl),#0x02
                           5078 ;src/keyboard.h:46: s = gladis_abajo;
   6BDA DD 36 FE 80   [19] 5079 	ld	-2 (ix),#<(_gladis_abajo)
   6BDE DD 36 FF 42   [19] 5080 	ld	-1 (ix),#>(_gladis_abajo)
   6BE2 C3 34 6D      [10] 5081 	jp	00146$
   6BE5                    5082 00133$:
                           5083 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   6BE5 21 00 01      [10] 5084 	ld	hl,#0x0100
   6BE8 CD 1C 8B      [17] 5085 	call	_cpct_isKeyPressed
   6BEB 7D            [ 4] 5086 	ld	a,l
   6BEC B7            [ 4] 5087 	or	a, a
   6BED 28 1B         [12] 5088 	jr	Z,00129$
   6BEF 3A E7 90      [13] 5089 	ld	a, (#(_player + 0x0001) + 0)
   6BF2 B7            [ 4] 5090 	or	a, a
   6BF3 28 15         [12] 5091 	jr	Z,00129$
                           5092 ;src/keyboard.h:48: player.y -= 2;
   6BF5 C6 FE         [ 7] 5093 	add	a,#0xFE
   6BF7 32 E7 90      [13] 5094 	ld	(#(_player + 0x0001)),a
                           5095 ;src/keyboard.h:49: player.dir = 8;
   6BFA 21 ED 90      [10] 5096 	ld	hl,#(_player + 0x0007)
   6BFD 36 08         [10] 5097 	ld	(hl),#0x08
                           5098 ;src/keyboard.h:50: s = gladis_arriba;
   6BFF DD 36 FE 00   [19] 5099 	ld	-2 (ix),#<(_gladis_arriba)
   6C03 DD 36 FF 42   [19] 5100 	ld	-1 (ix),#>(_gladis_arriba)
   6C07 C3 34 6D      [10] 5101 	jp	00146$
   6C0A                    5102 00129$:
                           5103 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   6C0A 21 07 80      [10] 5104 	ld	hl,#0x8007
   6C0D CD 1C 8B      [17] 5105 	call	_cpct_isKeyPressed
   6C10 5D            [ 4] 5106 	ld	e,l
                           5107 ;src/keyboard.h:53: switch(player.dir){
   6C11 21 ED 90      [10] 5108 	ld	hl, #(_player + 0x0007) + 0
   6C14 6E            [ 7] 5109 	ld	l,(hl)
   6C15 7D            [ 4] 5110 	ld	a,l
   6C16 D6 02         [ 7] 5111 	sub	a, #0x02
   6C18 20 04         [12] 5112 	jr	NZ,00272$
   6C1A 3E 01         [ 7] 5113 	ld	a,#0x01
   6C1C 18 01         [12] 5114 	jr	00273$
   6C1E                    5115 00272$:
   6C1E AF            [ 4] 5116 	xor	a,a
   6C1F                    5117 00273$:
   6C1F 4F            [ 4] 5118 	ld	c,a
   6C20 7D            [ 4] 5119 	ld	a,l
   6C21 D6 04         [ 7] 5120 	sub	a, #0x04
   6C23 20 04         [12] 5121 	jr	NZ,00274$
   6C25 3E 01         [ 7] 5122 	ld	a,#0x01
   6C27 18 01         [12] 5123 	jr	00275$
   6C29                    5124 00274$:
   6C29 AF            [ 4] 5125 	xor	a,a
   6C2A                    5126 00275$:
   6C2A DD 77 FB      [19] 5127 	ld	-5 (ix),a
   6C2D 7D            [ 4] 5128 	ld	a,l
   6C2E D6 06         [ 7] 5129 	sub	a, #0x06
   6C30 20 04         [12] 5130 	jr	NZ,00276$
   6C32 3E 01         [ 7] 5131 	ld	a,#0x01
   6C34 18 01         [12] 5132 	jr	00277$
   6C36                    5133 00276$:
   6C36 AF            [ 4] 5134 	xor	a,a
   6C37                    5135 00277$:
   6C37 DD 77 FC      [19] 5136 	ld	-4 (ix),a
   6C3A 7D            [ 4] 5137 	ld	a,l
   6C3B D6 08         [ 7] 5138 	sub	a, #0x08
   6C3D 20 04         [12] 5139 	jr	NZ,00278$
   6C3F 3E 01         [ 7] 5140 	ld	a,#0x01
   6C41 18 01         [12] 5141 	jr	00279$
   6C43                    5142 00278$:
   6C43 AF            [ 4] 5143 	xor	a,a
   6C44                    5144 00279$:
   6C44 DD 77 FD      [19] 5145 	ld	-3 (ix),a
                           5146 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   6C47 7B            [ 4] 5147 	ld	a,e
   6C48 B7            [ 4] 5148 	or	a, a
   6C49 CA F6 6C      [10] 5149 	jp	Z,00123$
   6C4C 3A D4 90      [13] 5150 	ld	a,(#_arrow + 0)
   6C4F B7            [ 4] 5151 	or	a, a
   6C50 C2 F6 6C      [10] 5152 	jp	NZ,00123$
   6C53 3A EE 90      [13] 5153 	ld	a, (#(_player + 0x0008) + 0)
   6C56 D6 14         [ 7] 5154 	sub	a, #0x14
   6C58 C2 F6 6C      [10] 5155 	jp	NZ,00123$
   6C5B 3A F0 90      [13] 5156 	ld	a, (#(_player + 0x000a) + 0)
   6C5E B7            [ 4] 5157 	or	a, a
   6C5F CA F6 6C      [10] 5158 	jp	Z,00123$
                           5159 ;src/keyboard.h:52: u8 *spr = flecha_dcha,xs=2,ys=8;
   6C62 11 08 76      [10] 5160 	ld	de,#_flecha_dcha
   6C65 DD 36 FA 02   [19] 5161 	ld	-6 (ix),#0x02
   6C69 06 08         [ 7] 5162 	ld	b,#0x08
                           5163 ;src/keyboard.h:53: switch(player.dir){
   6C6B 79            [ 4] 5164 	ld	a,c
   6C6C B7            [ 4] 5165 	or	a, a
   6C6D 20 2A         [12] 5166 	jr	NZ,00114$
   6C6F DD 7E FB      [19] 5167 	ld	a,-5 (ix)
   6C72 B7            [ 4] 5168 	or	a, a
   6C73 20 19         [12] 5169 	jr	NZ,00113$
   6C75 DD 7E FC      [19] 5170 	ld	a,-4 (ix)
   6C78 B7            [ 4] 5171 	or	a, a
   6C79 20 08         [12] 5172 	jr	NZ,00112$
   6C7B DD 7E FD      [19] 5173 	ld	a,-3 (ix)
   6C7E B7            [ 4] 5174 	or	a, a
   6C7F 20 23         [12] 5175 	jr	NZ,00115$
   6C81 18 2A         [12] 5176 	jr	00116$
                           5177 ;src/keyboard.h:54: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   6C83                    5178 00112$:
   6C83 11 08 76      [10] 5179 	ld	de,#_flecha_dcha
   6C86 DD 36 FA 04   [19] 5180 	ld	-6 (ix),#0x04
   6C8A 06 04         [ 7] 5181 	ld	b,#0x04
   6C8C 18 1F         [12] 5182 	jr	00116$
                           5183 ;src/keyboard.h:55: case 4: spr = flecha_izda; xs=4;ys=4; break;
   6C8E                    5184 00113$:
   6C8E 11 28 76      [10] 5185 	ld	de,#_flecha_izda+0
   6C91 DD 36 FA 04   [19] 5186 	ld	-6 (ix),#0x04
   6C95 06 04         [ 7] 5187 	ld	b,#0x04
   6C97 18 14         [12] 5188 	jr	00116$
                           5189 ;src/keyboard.h:56: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   6C99                    5190 00114$:
   6C99 11 E8 75      [10] 5191 	ld	de,#_flecha_abajo+0
   6C9C DD 36 FA 02   [19] 5192 	ld	-6 (ix),#0x02
   6CA0 06 08         [ 7] 5193 	ld	b,#0x08
   6CA2 18 09         [12] 5194 	jr	00116$
                           5195 ;src/keyboard.h:57: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   6CA4                    5196 00115$:
   6CA4 11 C8 75      [10] 5197 	ld	de,#_flecha_arriba+0
   6CA7 DD 36 FA 02   [19] 5198 	ld	-6 (ix),#0x02
   6CAB 06 08         [ 7] 5199 	ld	b,#0x08
                           5200 ;src/keyboard.h:58: }
   6CAD                    5201 00116$:
                           5202 ;src/keyboard.h:59: player.atk = 0;
   6CAD 21 EE 90      [10] 5203 	ld	hl,#(_player + 0x0008)
   6CB0 36 00         [10] 5204 	ld	(hl),#0x00
                           5205 ;src/keyboard.h:60: object.x = player.x;
   6CB2 3A E6 90      [13] 5206 	ld	a, (#_player + 0)
   6CB5 21 DC 90      [10] 5207 	ld	hl,#_object
   6CB8 77            [ 7] 5208 	ld	(hl),a
                           5209 ;src/keyboard.h:61: object.y = player.y+8;
   6CB9 3A E7 90      [13] 5210 	ld	a, (#(_player + 0x0001) + 0)
   6CBC C6 08         [ 7] 5211 	add	a, #0x08
   6CBE 32 DD 90      [13] 5212 	ld	(#(_object + 0x0001)),a
                           5213 ;src/keyboard.h:62: object.x = object.x;
   6CC1 21 DC 90      [10] 5214 	ld	hl, #_object + 0
   6CC4 4E            [ 7] 5215 	ld	c,(hl)
   6CC5 21 DC 90      [10] 5216 	ld	hl,#_object
   6CC8 71            [ 7] 5217 	ld	(hl),c
                           5218 ;src/keyboard.h:63: object.y = object.y;
   6CC9 32 DD 90      [13] 5219 	ld	(#(_object + 0x0001)),a
                           5220 ;src/keyboard.h:64: object.sprite = spr;
   6CCC ED 53 E0 90   [20] 5221 	ld	((_object + 0x0004)), de
                           5222 ;src/keyboard.h:65: object.vivo = 1;
   6CD0 21 E2 90      [10] 5223 	ld	hl,#_object + 6
   6CD3 36 01         [10] 5224 	ld	(hl),#0x01
                           5225 ;src/keyboard.h:66: object.dir = player.dir;
   6CD5 11 E3 90      [10] 5226 	ld	de,#_object + 7
   6CD8 3A ED 90      [13] 5227 	ld	a, (#(_player + 0x0007) + 0)
   6CDB 12            [ 7] 5228 	ld	(de),a
                           5229 ;src/keyboard.h:67: object.sizeX = xs;
   6CDC 21 E4 90      [10] 5230 	ld	hl,#_object + 8
   6CDF DD 7E FA      [19] 5231 	ld	a,-6 (ix)
   6CE2 77            [ 7] 5232 	ld	(hl),a
                           5233 ;src/keyboard.h:68: object.sizeY = ys;
   6CE3 21 E5 90      [10] 5234 	ld	hl,#_object + 9
   6CE6 70            [ 7] 5235 	ld	(hl),b
                           5236 ;src/keyboard.h:69: player.bullets--;
   6CE7 3A F0 90      [13] 5237 	ld	a, (#(_player + 0x000a) + 0)
   6CEA C6 FF         [ 7] 5238 	add	a,#0xFF
   6CEC 32 F0 90      [13] 5239 	ld	(#(_player + 0x000a)),a
                           5240 ;src/keyboard.h:70: arrow=1;
   6CEF 21 D4 90      [10] 5241 	ld	hl,#_arrow + 0
   6CF2 36 01         [10] 5242 	ld	(hl), #0x01
   6CF4 18 3E         [12] 5243 	jr	00146$
   6CF6                    5244 00123$:
                           5245 ;src/keyboard.h:72: switch(player.dir){
   6CF6 79            [ 4] 5246 	ld	a,c
   6CF7 B7            [ 4] 5247 	or	a, a
   6CF8 20 32         [12] 5248 	jr	NZ,00120$
   6CFA DD 7E FB      [19] 5249 	ld	a,-5 (ix)
   6CFD B7            [ 4] 5250 	or	a, a
   6CFE 20 0E         [12] 5251 	jr	NZ,00117$
   6D00 DD 7E FC      [19] 5252 	ld	a,-4 (ix)
   6D03 B7            [ 4] 5253 	or	a, a
   6D04 20 12         [12] 5254 	jr	NZ,00118$
   6D06 DD 7E FD      [19] 5255 	ld	a,-3 (ix)
   6D09 B7            [ 4] 5256 	or	a, a
   6D0A 20 16         [12] 5257 	jr	NZ,00119$
   6D0C 18 26         [12] 5258 	jr	00146$
                           5259 ;src/keyboard.h:73: case 4:
   6D0E                    5260 00117$:
                           5261 ;src/keyboard.h:74: s = gladis_quieto_izda;
   6D0E DD 36 FE 80   [19] 5262 	ld	-2 (ix),#<(_gladis_quieto_izda)
   6D12 DD 36 FF 40   [19] 5263 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           5264 ;src/keyboard.h:75: break;
   6D16 18 1C         [12] 5265 	jr	00146$
                           5266 ;src/keyboard.h:76: case 6:
   6D18                    5267 00118$:
                           5268 ;src/keyboard.h:77: s = gladis_quieto_dcha;
   6D18 DD 36 FE 00   [19] 5269 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   6D1C DD 36 FF 40   [19] 5270 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           5271 ;src/keyboard.h:78: break;
   6D20 18 12         [12] 5272 	jr	00146$
                           5273 ;src/keyboard.h:79: case 8:
   6D22                    5274 00119$:
                           5275 ;src/keyboard.h:80: s = gladis_arriba;
   6D22 DD 36 FE 00   [19] 5276 	ld	-2 (ix),#<(_gladis_arriba)
   6D26 DD 36 FF 42   [19] 5277 	ld	-1 (ix),#>(_gladis_arriba)
                           5278 ;src/keyboard.h:81: break;
   6D2A 18 08         [12] 5279 	jr	00146$
                           5280 ;src/keyboard.h:82: case 2:
   6D2C                    5281 00120$:
                           5282 ;src/keyboard.h:83: s = gladis_abajo;
   6D2C DD 36 FE 80   [19] 5283 	ld	-2 (ix),#<(_gladis_abajo)
   6D30 DD 36 FF 42   [19] 5284 	ld	-1 (ix),#>(_gladis_abajo)
                           5285 ;src/keyboard.h:85: }
   6D34                    5286 00146$:
                           5287 ;src/keyboard.h:90: if(cpct_isKeyPressed(Key_Esc)){
   6D34 21 08 04      [10] 5288 	ld	hl,#0x0408
   6D37 CD 1C 8B      [17] 5289 	call	_cpct_isKeyPressed
   6D3A 7D            [ 4] 5290 	ld	a,l
   6D3B B7            [ 4] 5291 	or	a, a
   6D3C 28 05         [12] 5292 	jr	Z,00149$
                           5293 ;src/keyboard.h:91: finish = 1;
   6D3E 21 D3 90      [10] 5294 	ld	hl,#_finish + 0
   6D41 36 01         [10] 5295 	ld	(hl), #0x01
   6D43                    5296 00149$:
                           5297 ;src/keyboard.h:93: return s;
   6D43 DD 6E FE      [19] 5298 	ld	l,-2 (ix)
   6D46 DD 66 FF      [19] 5299 	ld	h,-1 (ix)
   6D49 DD F9         [10] 5300 	ld	sp, ix
   6D4B DD E1         [14] 5301 	pop	ix
   6D4D C9            [10] 5302 	ret
                           5303 ;src/keyboard.h:96: void moveObject(){
                           5304 ;	---------------------------------
                           5305 ; Function moveObject
                           5306 ; ---------------------------------
   6D4E                    5307 _moveObject::
                           5308 ;src/keyboard.h:97: object.lx = object.x;
   6D4E 01 DC 90      [10] 5309 	ld	bc,#_object+0
   6D51 0A            [ 7] 5310 	ld	a,(bc)
   6D52 32 DE 90      [13] 5311 	ld	(#(_object + 0x0002)),a
                           5312 ;src/keyboard.h:98: object.ly = object.y;
   6D55 59            [ 4] 5313 	ld	e, c
   6D56 50            [ 4] 5314 	ld	d, b
   6D57 13            [ 6] 5315 	inc	de
   6D58 1A            [ 7] 5316 	ld	a,(de)
   6D59 32 DF 90      [13] 5317 	ld	(#(_object + 0x0003)),a
                           5318 ;src/keyboard.h:99: switch(object.dir){
   6D5C 3A E3 90      [13] 5319 	ld	a,(#_object + 7)
   6D5F FE 02         [ 7] 5320 	cp	a,#0x02
   6D61 28 16         [12] 5321 	jr	Z,00103$
   6D63 FE 04         [ 7] 5322 	cp	a,#0x04
   6D65 28 0D         [12] 5323 	jr	Z,00102$
   6D67 FE 06         [ 7] 5324 	cp	a,#0x06
   6D69 28 05         [12] 5325 	jr	Z,00101$
   6D6B D6 08         [ 7] 5326 	sub	a, #0x08
   6D6D 28 0F         [12] 5327 	jr	Z,00104$
   6D6F C9            [10] 5328 	ret
                           5329 ;src/keyboard.h:100: case 6: object.x += 1; break;
   6D70                    5330 00101$:
   6D70 0A            [ 7] 5331 	ld	a,(bc)
   6D71 3C            [ 4] 5332 	inc	a
   6D72 02            [ 7] 5333 	ld	(bc),a
   6D73 C9            [10] 5334 	ret
                           5335 ;src/keyboard.h:101: case 4: object.x -= 1; break;
   6D74                    5336 00102$:
   6D74 0A            [ 7] 5337 	ld	a,(bc)
   6D75 C6 FF         [ 7] 5338 	add	a,#0xFF
   6D77 02            [ 7] 5339 	ld	(bc),a
   6D78 C9            [10] 5340 	ret
                           5341 ;src/keyboard.h:102: case 2: object.y += 2; break;
   6D79                    5342 00103$:
   6D79 1A            [ 7] 5343 	ld	a,(de)
   6D7A C6 02         [ 7] 5344 	add	a, #0x02
   6D7C 12            [ 7] 5345 	ld	(de),a
   6D7D C9            [10] 5346 	ret
                           5347 ;src/keyboard.h:103: case 8: object.y -= 2; break;
   6D7E                    5348 00104$:
   6D7E 1A            [ 7] 5349 	ld	a,(de)
   6D7F C6 FE         [ 7] 5350 	add	a,#0xFE
   6D81 12            [ 7] 5351 	ld	(de),a
                           5352 ;src/keyboard.h:104: }
   6D82 C9            [10] 5353 	ret
                           5354 ;src/main.c:44: void gameOver(){
                           5355 ;	---------------------------------
                           5356 ; Function gameOver
                           5357 ; ---------------------------------
   6D83                    5358 _gameOver::
                           5359 ;src/main.c:46: cpct_clearScreen(0);
   6D83 21 00 40      [10] 5360 	ld	hl,#0x4000
   6D86 E5            [11] 5361 	push	hl
   6D87 AF            [ 4] 5362 	xor	a, a
   6D88 F5            [11] 5363 	push	af
   6D89 33            [ 6] 5364 	inc	sp
   6D8A 26 C0         [ 7] 5365 	ld	h, #0xC0
   6D8C E5            [11] 5366 	push	hl
   6D8D CD F7 8D      [17] 5367 	call	_cpct_memset
                           5368 ;src/main.c:47: memptr = cpct_getScreenPtr(VMEM,10,10);
   6D90 21 0A 0A      [10] 5369 	ld	hl,#0x0A0A
   6D93 E5            [11] 5370 	push	hl
   6D94 21 00 C0      [10] 5371 	ld	hl,#0xC000
   6D97 E5            [11] 5372 	push	hl
   6D98 CD EA 8E      [17] 5373 	call	_cpct_getScreenPtr
                           5374 ;src/main.c:48: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6D9B EB            [ 4] 5375 	ex	de,hl
   6D9C 01 F0 6D      [10] 5376 	ld	bc,#___str_2+0
   6D9F 21 01 00      [10] 5377 	ld	hl,#0x0001
   6DA2 E5            [11] 5378 	push	hl
   6DA3 D5            [11] 5379 	push	de
   6DA4 C5            [11] 5380 	push	bc
   6DA5 CD 09 8C      [17] 5381 	call	_cpct_drawStringM0
   6DA8 21 06 00      [10] 5382 	ld	hl,#6
   6DAB 39            [11] 5383 	add	hl,sp
   6DAC F9            [ 6] 5384 	ld	sp,hl
                           5385 ;src/main.c:50: memptr = cpct_getScreenPtr(VMEM,10,50);
   6DAD 21 0A 32      [10] 5386 	ld	hl,#0x320A
   6DB0 E5            [11] 5387 	push	hl
   6DB1 21 00 C0      [10] 5388 	ld	hl,#0xC000
   6DB4 E5            [11] 5389 	push	hl
   6DB5 CD EA 8E      [17] 5390 	call	_cpct_getScreenPtr
                           5391 ;src/main.c:51: cpct_drawSprite(gameover,memptr,60,28);
   6DB8 EB            [ 4] 5392 	ex	de,hl
   6DB9 01 58 76      [10] 5393 	ld	bc,#_gameover+0
   6DBC 21 3C 1C      [10] 5394 	ld	hl,#0x1C3C
   6DBF E5            [11] 5395 	push	hl
   6DC0 D5            [11] 5396 	push	de
   6DC1 C5            [11] 5397 	push	bc
   6DC2 CD 2D 8C      [17] 5398 	call	_cpct_drawSprite
                           5399 ;src/main.c:54: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   6DC5 21 0C AF      [10] 5400 	ld	hl,#0xAF0C
   6DC8 E5            [11] 5401 	push	hl
   6DC9 21 00 C0      [10] 5402 	ld	hl,#0xC000
   6DCC E5            [11] 5403 	push	hl
   6DCD CD EA 8E      [17] 5404 	call	_cpct_getScreenPtr
                           5405 ;src/main.c:55: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   6DD0 EB            [ 4] 5406 	ex	de,hl
   6DD1 01 01 6E      [10] 5407 	ld	bc,#___str_3+0
   6DD4 21 01 00      [10] 5408 	ld	hl,#0x0001
   6DD7 E5            [11] 5409 	push	hl
   6DD8 D5            [11] 5410 	push	de
   6DD9 C5            [11] 5411 	push	bc
   6DDA CD 09 8C      [17] 5412 	call	_cpct_drawStringM0
   6DDD 21 06 00      [10] 5413 	ld	hl,#6
   6DE0 39            [11] 5414 	add	hl,sp
   6DE1 F9            [ 6] 5415 	ld	sp,hl
                           5416 ;src/main.c:59: while (1){
   6DE2                    5417 00104$:
                           5418 ;src/main.c:60: cpct_scanKeyboard_f();
   6DE2 CD 28 8B      [17] 5419 	call	_cpct_scanKeyboard_f
                           5420 ;src/main.c:61: if(cpct_isKeyPressed(Key_Space)) {
   6DE5 21 05 80      [10] 5421 	ld	hl,#0x8005
   6DE8 CD 1C 8B      [17] 5422 	call	_cpct_isKeyPressed
   6DEB 7D            [ 4] 5423 	ld	a,l
   6DEC B7            [ 4] 5424 	or	a, a
   6DED 28 F3         [12] 5425 	jr	Z,00104$
                           5426 ;src/main.c:63: return;
   6DEF C9            [10] 5427 	ret
   6DF0                    5428 ___str_2:
   6DF0 4C 6F 75 6E 67 65  5429 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   6E00 00                 5430 	.db 0x00
   6E01                    5431 ___str_3:
   6E01 50 75 6C 73 61 20  5432 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   6E0E 00                 5433 	.db 0x00
                           5434 ;src/main.c:70: int menu(){
                           5435 ;	---------------------------------
                           5436 ; Function menu
                           5437 ; ---------------------------------
   6E0F                    5438 _menu::
   6E0F DD E5         [15] 5439 	push	ix
   6E11 DD 21 00 00   [14] 5440 	ld	ix,#0
   6E15 DD 39         [15] 5441 	add	ix,sp
   6E17 21 FA FF      [10] 5442 	ld	hl,#-6
   6E1A 39            [11] 5443 	add	hl,sp
   6E1B F9            [ 6] 5444 	ld	sp,hl
                           5445 ;src/main.c:72: int init = 50;
   6E1C DD 36 FC 32   [19] 5446 	ld	-4 (ix),#0x32
   6E20 DD 36 FD 00   [19] 5447 	ld	-3 (ix),#0x00
                           5448 ;src/main.c:73: int pushed =0;
   6E24 11 00 00      [10] 5449 	ld	de,#0x0000
                           5450 ;src/main.c:74: int cont =0;
   6E27 21 00 00      [10] 5451 	ld	hl,#0x0000
   6E2A E3            [19] 5452 	ex	(sp), hl
                           5453 ;src/main.c:75: cpct_clearScreen(0);
   6E2B D5            [11] 5454 	push	de
   6E2C 21 00 40      [10] 5455 	ld	hl,#0x4000
   6E2F E5            [11] 5456 	push	hl
   6E30 AF            [ 4] 5457 	xor	a, a
   6E31 F5            [11] 5458 	push	af
   6E32 33            [ 6] 5459 	inc	sp
   6E33 26 C0         [ 7] 5460 	ld	h, #0xC0
   6E35 E5            [11] 5461 	push	hl
   6E36 CD F7 8D      [17] 5462 	call	_cpct_memset
   6E39 21 0A 0A      [10] 5463 	ld	hl,#0x0A0A
   6E3C E5            [11] 5464 	push	hl
   6E3D 21 00 C0      [10] 5465 	ld	hl,#0xC000
   6E40 E5            [11] 5466 	push	hl
   6E41 CD EA 8E      [17] 5467 	call	_cpct_getScreenPtr
   6E44 D1            [10] 5468 	pop	de
                           5469 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6E45 4D            [ 4] 5470 	ld	c, l
   6E46 44            [ 4] 5471 	ld	b, h
   6E47 D5            [11] 5472 	push	de
   6E48 21 3C 3C      [10] 5473 	ld	hl,#0x3C3C
   6E4B E5            [11] 5474 	push	hl
   6E4C C5            [11] 5475 	push	bc
   6E4D 21 E8 7C      [10] 5476 	ld	hl,#_portada1
   6E50 E5            [11] 5477 	push	hl
   6E51 CD 2D 8C      [17] 5478 	call	_cpct_drawSprite
   6E54 21 14 5A      [10] 5479 	ld	hl,#0x5A14
   6E57 E5            [11] 5480 	push	hl
   6E58 21 00 C0      [10] 5481 	ld	hl,#0xC000
   6E5B E5            [11] 5482 	push	hl
   6E5C CD EA 8E      [17] 5483 	call	_cpct_getScreenPtr
   6E5F D1            [10] 5484 	pop	de
                           5485 ;src/main.c:82: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   6E60 4D            [ 4] 5486 	ld	c, l
   6E61 44            [ 4] 5487 	ld	b, h
   6E62 D5            [11] 5488 	push	de
   6E63 21 01 00      [10] 5489 	ld	hl,#0x0001
   6E66 E5            [11] 5490 	push	hl
   6E67 C5            [11] 5491 	push	bc
   6E68 21 31 70      [10] 5492 	ld	hl,#___str_4
   6E6B E5            [11] 5493 	push	hl
   6E6C CD 09 8C      [17] 5494 	call	_cpct_drawStringM0
   6E6F 21 06 00      [10] 5495 	ld	hl,#6
   6E72 39            [11] 5496 	add	hl,sp
   6E73 F9            [ 6] 5497 	ld	sp,hl
   6E74 21 14 6E      [10] 5498 	ld	hl,#0x6E14
   6E77 E5            [11] 5499 	push	hl
   6E78 21 00 C0      [10] 5500 	ld	hl,#0xC000
   6E7B E5            [11] 5501 	push	hl
   6E7C CD EA 8E      [17] 5502 	call	_cpct_getScreenPtr
   6E7F D1            [10] 5503 	pop	de
                           5504 ;src/main.c:85: cpct_drawStringM0("Creditos",memptr,1,0);
   6E80 4D            [ 4] 5505 	ld	c, l
   6E81 44            [ 4] 5506 	ld	b, h
   6E82 D5            [11] 5507 	push	de
   6E83 21 01 00      [10] 5508 	ld	hl,#0x0001
   6E86 E5            [11] 5509 	push	hl
   6E87 C5            [11] 5510 	push	bc
   6E88 21 3F 70      [10] 5511 	ld	hl,#___str_5
   6E8B E5            [11] 5512 	push	hl
   6E8C CD 09 8C      [17] 5513 	call	_cpct_drawStringM0
   6E8F 21 06 00      [10] 5514 	ld	hl,#6
   6E92 39            [11] 5515 	add	hl,sp
   6E93 F9            [ 6] 5516 	ld	sp,hl
   6E94 21 14 82      [10] 5517 	ld	hl,#0x8214
   6E97 E5            [11] 5518 	push	hl
   6E98 21 00 C0      [10] 5519 	ld	hl,#0xC000
   6E9B E5            [11] 5520 	push	hl
   6E9C CD EA 8E      [17] 5521 	call	_cpct_getScreenPtr
   6E9F D1            [10] 5522 	pop	de
                           5523 ;src/main.c:88: cpct_drawStringM0("Constroles",memptr,1,0);
   6EA0 4D            [ 4] 5524 	ld	c, l
   6EA1 44            [ 4] 5525 	ld	b, h
   6EA2 D5            [11] 5526 	push	de
   6EA3 21 01 00      [10] 5527 	ld	hl,#0x0001
   6EA6 E5            [11] 5528 	push	hl
   6EA7 C5            [11] 5529 	push	bc
   6EA8 21 48 70      [10] 5530 	ld	hl,#___str_6
   6EAB E5            [11] 5531 	push	hl
   6EAC CD 09 8C      [17] 5532 	call	_cpct_drawStringM0
   6EAF 21 06 00      [10] 5533 	ld	hl,#6
   6EB2 39            [11] 5534 	add	hl,sp
   6EB3 F9            [ 6] 5535 	ld	sp,hl
   6EB4 21 14 96      [10] 5536 	ld	hl,#0x9614
   6EB7 E5            [11] 5537 	push	hl
   6EB8 21 00 C0      [10] 5538 	ld	hl,#0xC000
   6EBB E5            [11] 5539 	push	hl
   6EBC CD EA 8E      [17] 5540 	call	_cpct_getScreenPtr
   6EBF D1            [10] 5541 	pop	de
                           5542 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6EC0 DD 75 FE      [19] 5543 	ld	-2 (ix),l
   6EC3 DD 74 FF      [19] 5544 	ld	-1 (ix),h
                           5545 ;src/main.c:91: cpct_drawStringM0("Salir",memptr,1,0);
   6EC6 01 53 70      [10] 5546 	ld	bc,#___str_7
   6EC9 D5            [11] 5547 	push	de
   6ECA 21 01 00      [10] 5548 	ld	hl,#0x0001
   6ECD E5            [11] 5549 	push	hl
   6ECE DD 6E FE      [19] 5550 	ld	l,-2 (ix)
   6ED1 DD 66 FF      [19] 5551 	ld	h,-1 (ix)
   6ED4 E5            [11] 5552 	push	hl
   6ED5 C5            [11] 5553 	push	bc
   6ED6 CD 09 8C      [17] 5554 	call	_cpct_drawStringM0
   6ED9 21 06 00      [10] 5555 	ld	hl,#6
   6EDC 39            [11] 5556 	add	hl,sp
   6EDD F9            [ 6] 5557 	ld	sp,hl
   6EDE D1            [10] 5558 	pop	de
                           5559 ;src/main.c:97: while(1){
   6EDF                    5560 00124$:
                           5561 ;src/main.c:99: cpct_scanKeyboard();
   6EDF D5            [11] 5562 	push	de
   6EE0 CD 0A 8F      [17] 5563 	call	_cpct_scanKeyboard
   6EE3 21 00 04      [10] 5564 	ld	hl,#0x0400
   6EE6 CD 1C 8B      [17] 5565 	call	_cpct_isKeyPressed
   6EE9 7D            [ 4] 5566 	ld	a,l
   6EEA D1            [10] 5567 	pop	de
   6EEB B7            [ 4] 5568 	or	a, a
   6EEC 28 38         [12] 5569 	jr	Z,00104$
   6EEE 3E 96         [ 7] 5570 	ld	a,#0x96
   6EF0 DD BE FA      [19] 5571 	cp	a, -6 (ix)
   6EF3 3E 00         [ 7] 5572 	ld	a,#0x00
   6EF5 DD 9E FB      [19] 5573 	sbc	a, -5 (ix)
   6EF8 E2 FD 6E      [10] 5574 	jp	PO, 00176$
   6EFB EE 80         [ 7] 5575 	xor	a, #0x80
   6EFD                    5576 00176$:
   6EFD F2 26 6F      [10] 5577 	jp	P,00104$
                           5578 ;src/main.c:101: cpct_drawSolidBox(memptr, 0, 2, 8);
   6F00 D5            [11] 5579 	push	de
   6F01 21 02 08      [10] 5580 	ld	hl,#0x0802
   6F04 E5            [11] 5581 	push	hl
   6F05 AF            [ 4] 5582 	xor	a, a
   6F06 F5            [11] 5583 	push	af
   6F07 33            [ 6] 5584 	inc	sp
   6F08 DD 6E FE      [19] 5585 	ld	l,-2 (ix)
   6F0B DD 66 FF      [19] 5586 	ld	h,-1 (ix)
   6F0E E5            [11] 5587 	push	hl
   6F0F CD 19 8E      [17] 5588 	call	_cpct_drawSolidBox
   6F12 F1            [10] 5589 	pop	af
   6F13 F1            [10] 5590 	pop	af
   6F14 33            [ 6] 5591 	inc	sp
   6F15 D1            [10] 5592 	pop	de
                           5593 ;src/main.c:102: if(pushed<3) pushed ++;
   6F16 7B            [ 4] 5594 	ld	a,e
   6F17 D6 03         [ 7] 5595 	sub	a, #0x03
   6F19 7A            [ 4] 5596 	ld	a,d
   6F1A 17            [ 4] 5597 	rla
   6F1B 3F            [ 4] 5598 	ccf
   6F1C 1F            [ 4] 5599 	rra
   6F1D DE 80         [ 7] 5600 	sbc	a, #0x80
   6F1F 30 01         [12] 5601 	jr	NC,00102$
   6F21 13            [ 6] 5602 	inc	de
   6F22                    5603 00102$:
                           5604 ;src/main.c:103: cont =0;
   6F22 21 00 00      [10] 5605 	ld	hl,#0x0000
   6F25 E3            [19] 5606 	ex	(sp), hl
   6F26                    5607 00104$:
                           5608 ;src/main.c:105: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   6F26 D5            [11] 5609 	push	de
   6F27 21 00 01      [10] 5610 	ld	hl,#0x0100
   6F2A CD 1C 8B      [17] 5611 	call	_cpct_isKeyPressed
   6F2D 7D            [ 4] 5612 	ld	a,l
   6F2E D1            [10] 5613 	pop	de
   6F2F B7            [ 4] 5614 	or	a, a
   6F30 28 38         [12] 5615 	jr	Z,00109$
   6F32 3E 96         [ 7] 5616 	ld	a,#0x96
   6F34 DD BE FA      [19] 5617 	cp	a, -6 (ix)
   6F37 3E 00         [ 7] 5618 	ld	a,#0x00
   6F39 DD 9E FB      [19] 5619 	sbc	a, -5 (ix)
   6F3C E2 41 6F      [10] 5620 	jp	PO, 00177$
   6F3F EE 80         [ 7] 5621 	xor	a, #0x80
   6F41                    5622 00177$:
   6F41 F2 6A 6F      [10] 5623 	jp	P,00109$
                           5624 ;src/main.c:106: cpct_drawSolidBox(memptr, 0, 2, 8);
   6F44 D5            [11] 5625 	push	de
   6F45 21 02 08      [10] 5626 	ld	hl,#0x0802
   6F48 E5            [11] 5627 	push	hl
   6F49 AF            [ 4] 5628 	xor	a, a
   6F4A F5            [11] 5629 	push	af
   6F4B 33            [ 6] 5630 	inc	sp
   6F4C DD 6E FE      [19] 5631 	ld	l,-2 (ix)
   6F4F DD 66 FF      [19] 5632 	ld	h,-1 (ix)
   6F52 E5            [11] 5633 	push	hl
   6F53 CD 19 8E      [17] 5634 	call	_cpct_drawSolidBox
   6F56 F1            [10] 5635 	pop	af
   6F57 F1            [10] 5636 	pop	af
   6F58 33            [ 6] 5637 	inc	sp
   6F59 D1            [10] 5638 	pop	de
                           5639 ;src/main.c:107: if(pushed>0) pushed --;
   6F5A AF            [ 4] 5640 	xor	a, a
   6F5B BB            [ 4] 5641 	cp	a, e
   6F5C 9A            [ 4] 5642 	sbc	a, d
   6F5D E2 62 6F      [10] 5643 	jp	PO, 00178$
   6F60 EE 80         [ 7] 5644 	xor	a, #0x80
   6F62                    5645 00178$:
   6F62 F2 66 6F      [10] 5646 	jp	P,00107$
   6F65 1B            [ 6] 5647 	dec	de
   6F66                    5648 00107$:
                           5649 ;src/main.c:108: cont = 0;
   6F66 21 00 00      [10] 5650 	ld	hl,#0x0000
   6F69 E3            [19] 5651 	ex	(sp), hl
   6F6A                    5652 00109$:
                           5653 ;src/main.c:111: switch (pushed){
   6F6A 7A            [ 4] 5654 	ld	a,d
   6F6B 07            [ 4] 5655 	rlca
   6F6C E6 01         [ 7] 5656 	and	a,#0x01
   6F6E 47            [ 4] 5657 	ld	b,a
   6F6F 3E 03         [ 7] 5658 	ld	a,#0x03
   6F71 BB            [ 4] 5659 	cp	a, e
   6F72 3E 00         [ 7] 5660 	ld	a,#0x00
   6F74 9A            [ 4] 5661 	sbc	a, d
   6F75 E2 7A 6F      [10] 5662 	jp	PO, 00179$
   6F78 EE 80         [ 7] 5663 	xor	a, #0x80
   6F7A                    5664 00179$:
   6F7A 07            [ 4] 5665 	rlca
   6F7B E6 01         [ 7] 5666 	and	a,#0x01
   6F7D 4F            [ 4] 5667 	ld	c,a
   6F7E 78            [ 4] 5668 	ld	a,b
   6F7F B7            [ 4] 5669 	or	a,a
   6F80 20 3A         [12] 5670 	jr	NZ,00115$
   6F82 B1            [ 4] 5671 	or	a,c
   6F83 20 37         [12] 5672 	jr	NZ,00115$
   6F85 D5            [11] 5673 	push	de
   6F86 57            [ 4] 5674 	ld	d,a
   6F87 21 8E 6F      [10] 5675 	ld	hl,#00180$
   6F8A 19            [11] 5676 	add	hl,de
   6F8B 19            [11] 5677 	add	hl,de
                           5678 ;src/main.c:112: case 0: init = 90;break;
   6F8C D1            [10] 5679 	pop	de
   6F8D E9            [ 4] 5680 	jp	(hl)
   6F8E                    5681 00180$:
   6F8E 18 06         [12] 5682 	jr	00111$
   6F90 18 0E         [12] 5683 	jr	00112$
   6F92 18 16         [12] 5684 	jr	00113$
   6F94 18 1E         [12] 5685 	jr	00114$
   6F96                    5686 00111$:
   6F96 DD 36 FC 5A   [19] 5687 	ld	-4 (ix),#0x5A
   6F9A DD 36 FD 00   [19] 5688 	ld	-3 (ix),#0x00
   6F9E 18 1C         [12] 5689 	jr	00115$
                           5690 ;src/main.c:113: case 1: init = 110;break;
   6FA0                    5691 00112$:
   6FA0 DD 36 FC 6E   [19] 5692 	ld	-4 (ix),#0x6E
   6FA4 DD 36 FD 00   [19] 5693 	ld	-3 (ix),#0x00
   6FA8 18 12         [12] 5694 	jr	00115$
                           5695 ;src/main.c:114: case 2: init = 130;break;
   6FAA                    5696 00113$:
   6FAA DD 36 FC 82   [19] 5697 	ld	-4 (ix),#0x82
   6FAE DD 36 FD 00   [19] 5698 	ld	-3 (ix),#0x00
   6FB2 18 08         [12] 5699 	jr	00115$
                           5700 ;src/main.c:115: case 3: init = 150;break;
   6FB4                    5701 00114$:
   6FB4 DD 36 FC 96   [19] 5702 	ld	-4 (ix),#0x96
   6FB8 DD 36 FD 00   [19] 5703 	ld	-3 (ix),#0x00
                           5704 ;src/main.c:116: }
   6FBC                    5705 00115$:
                           5706 ;src/main.c:117: memptr = cpct_getScreenPtr(VMEM,15,init);
   6FBC DD 66 FC      [19] 5707 	ld	h,-4 (ix)
   6FBF C5            [11] 5708 	push	bc
   6FC0 D5            [11] 5709 	push	de
   6FC1 E5            [11] 5710 	push	hl
   6FC2 33            [ 6] 5711 	inc	sp
   6FC3 3E 0F         [ 7] 5712 	ld	a,#0x0F
   6FC5 F5            [11] 5713 	push	af
   6FC6 33            [ 6] 5714 	inc	sp
   6FC7 21 00 C0      [10] 5715 	ld	hl,#0xC000
   6FCA E5            [11] 5716 	push	hl
   6FCB CD EA 8E      [17] 5717 	call	_cpct_getScreenPtr
   6FCE D1            [10] 5718 	pop	de
   6FCF C1            [10] 5719 	pop	bc
                           5720 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6FD0 DD 75 FE      [19] 5721 	ld	-2 (ix),l
   6FD3 DD 74 FF      [19] 5722 	ld	-1 (ix),h
                           5723 ;src/main.c:118: cpct_drawSprite(marcador,memptr, 2, 8);
   6FD6 C5            [11] 5724 	push	bc
   6FD7 D5            [11] 5725 	push	de
   6FD8 21 02 08      [10] 5726 	ld	hl,#0x0802
   6FDB E5            [11] 5727 	push	hl
   6FDC DD 6E FE      [19] 5728 	ld	l,-2 (ix)
   6FDF DD 66 FF      [19] 5729 	ld	h,-1 (ix)
   6FE2 E5            [11] 5730 	push	hl
   6FE3 21 48 76      [10] 5731 	ld	hl,#_marcador
   6FE6 E5            [11] 5732 	push	hl
   6FE7 CD 2D 8C      [17] 5733 	call	_cpct_drawSprite
   6FEA 21 05 80      [10] 5734 	ld	hl,#0x8005
   6FED CD 1C 8B      [17] 5735 	call	_cpct_isKeyPressed
   6FF0 7D            [ 4] 5736 	ld	a,l
   6FF1 D1            [10] 5737 	pop	de
   6FF2 C1            [10] 5738 	pop	bc
   6FF3 B7            [ 4] 5739 	or	a, a
   6FF4 28 2A         [12] 5740 	jr	Z,00122$
                           5741 ;src/main.c:120: switch (pushed){
   6FF6 78            [ 4] 5742 	ld	a,b
   6FF7 B7            [ 4] 5743 	or	a,a
   6FF8 20 26         [12] 5744 	jr	NZ,00122$
   6FFA B1            [ 4] 5745 	or	a,c
   6FFB 20 23         [12] 5746 	jr	NZ,00122$
   6FFD 57            [ 4] 5747 	ld	d,a
   6FFE 21 04 70      [10] 5748 	ld	hl,#00181$
   7001 19            [11] 5749 	add	hl,de
   7002 19            [11] 5750 	add	hl,de
                           5751 ;src/main.c:121: case 0: return 1;break;
   7003 E9            [ 4] 5752 	jp	(hl)
   7004                    5753 00181$:
   7004 18 06         [12] 5754 	jr	00116$
   7006 18 09         [12] 5755 	jr	00117$
   7008 18 0C         [12] 5756 	jr	00118$
   700A 18 0F         [12] 5757 	jr	00119$
   700C                    5758 00116$:
   700C 21 01 00      [10] 5759 	ld	hl,#0x0001
   700F 18 1B         [12] 5760 	jr	00126$
                           5761 ;src/main.c:122: case 1: return 2;break;
   7011                    5762 00117$:
   7011 21 02 00      [10] 5763 	ld	hl,#0x0002
   7014 18 16         [12] 5764 	jr	00126$
                           5765 ;src/main.c:123: case 2: return 3;break;
   7016                    5766 00118$:
   7016 21 03 00      [10] 5767 	ld	hl,#0x0003
   7019 18 11         [12] 5768 	jr	00126$
                           5769 ;src/main.c:124: case 3: return 0;break;
   701B                    5770 00119$:
   701B 21 00 00      [10] 5771 	ld	hl,#0x0000
   701E 18 0C         [12] 5772 	jr	00126$
                           5773 ;src/main.c:125: }
   7020                    5774 00122$:
                           5775 ;src/main.c:127: cont++;
   7020 DD 34 FA      [23] 5776 	inc	-6 (ix)
   7023 C2 DF 6E      [10] 5777 	jp	NZ,00124$
   7026 DD 34 FB      [23] 5778 	inc	-5 (ix)
   7029 C3 DF 6E      [10] 5779 	jp	00124$
   702C                    5780 00126$:
   702C DD F9         [10] 5781 	ld	sp, ix
   702E DD E1         [14] 5782 	pop	ix
   7030 C9            [10] 5783 	ret
   7031                    5784 ___str_4:
   7031 4E 75 65 76 61 20  5785 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   703E 00                 5786 	.db 0x00
   703F                    5787 ___str_5:
   703F 43 72 65 64 69 74  5788 	.ascii "Creditos"
        6F 73
   7047 00                 5789 	.db 0x00
   7048                    5790 ___str_6:
   7048 43 6F 6E 73 74 72  5791 	.ascii "Constroles"
        6F 6C 65 73
   7052 00                 5792 	.db 0x00
   7053                    5793 ___str_7:
   7053 53 61 6C 69 72     5794 	.ascii "Salir"
   7058 00                 5795 	.db 0x00
                           5796 ;src/main.c:132: void game(){
                           5797 ;	---------------------------------
                           5798 ; Function game
                           5799 ; ---------------------------------
   7059                    5800 _game::
                           5801 ;src/main.c:135: initVariables(1);
   7059 3E 01         [ 7] 5802 	ld	a,#0x01
   705B F5            [11] 5803 	push	af
   705C 33            [ 6] 5804 	inc	sp
   705D CD 41 4E      [17] 5805 	call	_initVariables
   7060 33            [ 6] 5806 	inc	sp
                           5807 ;src/main.c:136: initPlayer(map);
   7061 3A D1 90      [13] 5808 	ld	a,(_map)
   7064 F5            [11] 5809 	push	af
   7065 33            [ 6] 5810 	inc	sp
   7066 CD 41 4D      [17] 5811 	call	_initPlayer
   7069 33            [ 6] 5812 	inc	sp
                           5813 ;src/main.c:137: initNivel();
   706A CD 31 4E      [17] 5814 	call	_initNivel
                           5815 ;src/main.c:138: initEnemies(map);
   706D 3A D1 90      [13] 5816 	ld	a,(_map)
   7070 F5            [11] 5817 	push	af
   7071 33            [ 6] 5818 	inc	sp
   7072 CD CB 4D      [17] 5819 	call	_initEnemies
   7075 33            [ 6] 5820 	inc	sp
                           5821 ;src/main.c:140: cpct_clearScreen(0);
   7076 21 00 40      [10] 5822 	ld	hl,#0x4000
   7079 E5            [11] 5823 	push	hl
   707A AF            [ 4] 5824 	xor	a, a
   707B F5            [11] 5825 	push	af
   707C 33            [ 6] 5826 	inc	sp
   707D 26 C0         [ 7] 5827 	ld	h, #0xC0
   707F E5            [11] 5828 	push	hl
   7080 CD F7 8D      [17] 5829 	call	_cpct_memset
                           5830 ;src/main.c:141: drawMap(map);
   7083 3A D1 90      [13] 5831 	ld	a,(_map)
   7086 F5            [11] 5832 	push	af
   7087 33            [ 6] 5833 	inc	sp
   7088 CD BE 51      [17] 5834 	call	_drawMap
   708B 33            [ 6] 5835 	inc	sp
                           5836 ;src/main.c:142: while (1){
   708C                    5837 00137$:
                           5838 ;src/main.c:143: if(finish == 1) return;
   708C 3A D3 90      [13] 5839 	ld	a,(#_finish + 0)
   708F 3D            [ 4] 5840 	dec	a
   7090 C8            [11] 5841 	ret	Z
   7091 18 00         [12] 5842 	jr	00102$
   7093                    5843 00102$:
                           5844 ;src/main.c:145: cpct_waitVSYNC();
   7093 CD DD 8D      [17] 5845 	call	_cpct_waitVSYNC
                           5846 ;src/main.c:148: erases();
   7096 CD 3A 55      [17] 5847 	call	_erases
                           5848 ;src/main.c:151: if(temp == 10)
   7099 3A D0 90      [13] 5849 	ld	a,(#_temp + 0)
   709C D6 0A         [ 7] 5850 	sub	a, #0x0A
   709E 20 0F         [12] 5851 	jr	NZ,00104$
                           5852 ;src/main.c:152: drawPickUps(n.corazon,n.bullet);
   70A0 21 DB 90      [10] 5853 	ld	hl, #(_n + 0x0002) + 0
   70A3 56            [ 7] 5854 	ld	d,(hl)
   70A4 3A DA 90      [13] 5855 	ld	a, (#(_n + 0x0001) + 0)
   70A7 D5            [11] 5856 	push	de
   70A8 33            [ 6] 5857 	inc	sp
   70A9 F5            [11] 5858 	push	af
   70AA 33            [ 6] 5859 	inc	sp
   70AB CD E1 56      [17] 5860 	call	_drawPickUps
   70AE F1            [10] 5861 	pop	af
   70AF                    5862 00104$:
                           5863 ;src/main.c:155: draws();
   70AF CD 7B 54      [17] 5864 	call	_draws
                           5865 ;src/main.c:158: if(temp == 10){
   70B2 3A D0 90      [13] 5866 	ld	a,(#_temp + 0)
   70B5 D6 0A         [ 7] 5867 	sub	a, #0x0A
   70B7 20 2F         [12] 5868 	jr	NZ,00112$
                           5869 ;src/main.c:159: if(player.atk < 20) drawFatiga(player.atk,2);
   70B9 21 EE 90      [10] 5870 	ld	hl, #(_player + 0x0008) + 0
   70BC 56            [ 7] 5871 	ld	d,(hl)
   70BD 7A            [ 4] 5872 	ld	a,d
   70BE D6 14         [ 7] 5873 	sub	a, #0x14
   70C0 30 0C         [12] 5874 	jr	NC,00109$
   70C2 3E 02         [ 7] 5875 	ld	a,#0x02
   70C4 F5            [11] 5876 	push	af
   70C5 33            [ 6] 5877 	inc	sp
   70C6 D5            [11] 5878 	push	de
   70C7 33            [ 6] 5879 	inc	sp
   70C8 CD BB 55      [17] 5880 	call	_drawFatiga
   70CB F1            [10] 5881 	pop	af
   70CC 18 1A         [12] 5882 	jr	00112$
   70CE                    5883 00109$:
                           5884 ;src/main.c:160: else if(player.atk > 20) drawFatiga(player.atk,1);
   70CE 3E 14         [ 7] 5885 	ld	a,#0x14
   70D0 92            [ 4] 5886 	sub	a, d
   70D1 30 0C         [12] 5887 	jr	NC,00106$
   70D3 3E 01         [ 7] 5888 	ld	a,#0x01
   70D5 F5            [11] 5889 	push	af
   70D6 33            [ 6] 5890 	inc	sp
   70D7 D5            [11] 5891 	push	de
   70D8 33            [ 6] 5892 	inc	sp
   70D9 CD BB 55      [17] 5893 	call	_drawFatiga
   70DC F1            [10] 5894 	pop	af
   70DD 18 09         [12] 5895 	jr	00112$
   70DF                    5896 00106$:
                           5897 ;src/main.c:161: else drawFatiga(player.atk,0);
   70DF AF            [ 4] 5898 	xor	a, a
   70E0 F5            [11] 5899 	push	af
   70E1 33            [ 6] 5900 	inc	sp
   70E2 D5            [11] 5901 	push	de
   70E3 33            [ 6] 5902 	inc	sp
   70E4 CD BB 55      [17] 5903 	call	_drawFatiga
   70E7 F1            [10] 5904 	pop	af
   70E8                    5905 00112$:
                           5906 ;src/main.c:164: if(temp%2 == 0){
   70E8 3A D0 90      [13] 5907 	ld	a,(#_temp + 0)
                           5908 ;src/main.c:165: player.lx = player.x;
                           5909 ;src/main.c:166: player.ly = player.y;
                           5910 ;src/main.c:164: if(temp%2 == 0){
   70EB E6 01         [ 7] 5911 	and	a,#0x01
   70ED 20 0D         [12] 5912 	jr	NZ,00114$
                           5913 ;src/main.c:165: player.lx = player.x;
   70EF 3A E6 90      [13] 5914 	ld	a, (#_player + 0)
   70F2 21 E8 90      [10] 5915 	ld	hl,#(_player + 0x0002)
   70F5 77            [ 7] 5916 	ld	(hl),a
                           5917 ;src/main.c:166: player.ly = player.y;
   70F6 3A E7 90      [13] 5918 	ld	a, (#(_player + 0x0001) + 0)
   70F9 32 E9 90      [13] 5919 	ld	(#(_player + 0x0003)),a
   70FC                    5920 00114$:
                           5921 ;src/main.c:169: if(enemy.life > 0){
   70FC 21 F9 90      [10] 5922 	ld	hl, #(_enemy + 0x0008) + 0
   70FF 6E            [ 7] 5923 	ld	l,(hl)
                           5924 ;src/main.c:171: enemy.lx = enemy.x;
                           5925 ;src/main.c:172: enemy.ly = enemy.y;
                           5926 ;src/main.c:179: enemy.x = enemy.ox;
                           5927 ;src/main.c:180: enemy.y = enemy.oy;
                           5928 ;src/main.c:187: enemy.pursue = 0;
                           5929 ;src/main.c:169: if(enemy.life > 0){
   7100 7D            [ 4] 5930 	ld	a,l
   7101 B7            [ 4] 5931 	or	a, a
   7102 CA 22 72      [10] 5932 	jp	Z,00121$
                           5933 ;src/main.c:170: if(temp%2 == 1){
   7105 3A D0 90      [13] 5934 	ld	a,(#_temp + 0)
   7108 E6 01         [ 7] 5935 	and	a, #0x01
   710A 3D            [ 4] 5936 	dec	a
   710B 20 0C         [12] 5937 	jr	NZ,00116$
                           5938 ;src/main.c:171: enemy.lx = enemy.x;
   710D 3A F1 90      [13] 5939 	ld	a, (#_enemy + 0)
   7110 32 F3 90      [13] 5940 	ld	(#(_enemy + 0x0002)),a
                           5941 ;src/main.c:172: enemy.ly = enemy.y;
   7113 3A F2 90      [13] 5942 	ld	a, (#(_enemy + 0x0001) + 0)
   7116 32 F4 90      [13] 5943 	ld	(#(_enemy + 0x0003)),a
   7119                    5944 00116$:
                           5945 ;src/main.c:175: move();
   7119 CD 34 60      [17] 5946 	call	_move
                           5947 ;src/main.c:176: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   711C 21 EE 90      [10] 5948 	ld	hl, #(_player + 0x0008) + 0
   711F 56            [ 7] 5949 	ld	d,(hl)
   7120 3A F2 90      [13] 5950 	ld	a, (#(_enemy + 0x0001) + 0)
   7123 21 F1 90      [10] 5951 	ld	hl, #_enemy + 0
   7126 5E            [ 7] 5952 	ld	e,(hl)
   7127 21 E7 90      [10] 5953 	ld	hl, #(_player + 0x0001) + 0
   712A 46            [ 7] 5954 	ld	b,(hl)
   712B 21 E6 90      [10] 5955 	ld	hl, #_player + 0
   712E 4E            [ 7] 5956 	ld	c,(hl)
   712F D5            [11] 5957 	push	de
   7130 33            [ 6] 5958 	inc	sp
   7131 57            [ 4] 5959 	ld	d,a
   7132 D5            [11] 5960 	push	de
   7133 C5            [11] 5961 	push	bc
   7134 CD 01 61      [17] 5962 	call	_checkCollisions
   7137 F1            [10] 5963 	pop	af
   7138 F1            [10] 5964 	pop	af
   7139 33            [ 6] 5965 	inc	sp
   713A 7D            [ 4] 5966 	ld	a,l
   713B 3D            [ 4] 5967 	dec	a
   713C 28 08         [12] 5968 	jr	Z,00117$
   713E 7D            [ 4] 5969 	ld	a,l
   713F D6 02         [ 7] 5970 	sub	a, #0x02
   7141 28 72         [12] 5971 	jr	Z,00118$
   7143 C3 22 72      [10] 5972 	jp	00121$
                           5973 ;src/main.c:177: case 1:
   7146                    5974 00117$:
                           5975 ;src/main.c:178: erase(enemy.lx,enemy.ly,0);
   7146 21 F4 90      [10] 5976 	ld	hl, #(_enemy + 0x0003) + 0
   7149 56            [ 7] 5977 	ld	d,(hl)
   714A 21 F3 90      [10] 5978 	ld	hl, #(_enemy + 0x0002) + 0
   714D 46            [ 7] 5979 	ld	b,(hl)
   714E AF            [ 4] 5980 	xor	a, a
   714F F5            [11] 5981 	push	af
   7150 33            [ 6] 5982 	inc	sp
   7151 D5            [11] 5983 	push	de
   7152 33            [ 6] 5984 	inc	sp
   7153 C5            [11] 5985 	push	bc
   7154 33            [ 6] 5986 	inc	sp
   7155 CD E6 53      [17] 5987 	call	_erase
   7158 F1            [10] 5988 	pop	af
   7159 33            [ 6] 5989 	inc	sp
                           5990 ;src/main.c:179: enemy.x = enemy.ox;
   715A 3A F5 90      [13] 5991 	ld	a, (#(_enemy + 0x0004) + 0)
   715D 32 F1 90      [13] 5992 	ld	(#_enemy),a
                           5993 ;src/main.c:180: enemy.y = enemy.oy;
   7160 21 F6 90      [10] 5994 	ld	hl, #(_enemy + 0x0005) + 0
   7163 56            [ 7] 5995 	ld	d,(hl)
   7164 21 F2 90      [10] 5996 	ld	hl,#(_enemy + 0x0001)
   7167 72            [ 7] 5997 	ld	(hl),d
                           5998 ;src/main.c:181: enemy.lx = enemy.x;
   7168 32 F3 90      [13] 5999 	ld	(#(_enemy + 0x0002)),a
                           6000 ;src/main.c:182: enemy.ly = enemy.y;
   716B 21 F4 90      [10] 6001 	ld	hl,#(_enemy + 0x0003)
   716E 72            [ 7] 6002 	ld	(hl),d
                           6003 ;src/main.c:183: enemy.ox = originse[map-1][4];
   716F 21 D1 90      [10] 6004 	ld	hl,#_map + 0
   7172 56            [ 7] 6005 	ld	d, (hl)
   7173 15            [ 4] 6006 	dec	d
   7174 4A            [ 4] 6007 	ld	c,d
   7175 06 00         [ 7] 6008 	ld	b,#0x00
   7177 69            [ 4] 6009 	ld	l, c
   7178 60            [ 4] 6010 	ld	h, b
   7179 29            [11] 6011 	add	hl, hl
   717A 09            [11] 6012 	add	hl, bc
   717B 29            [11] 6013 	add	hl, hl
   717C 11 39 4B      [10] 6014 	ld	de,#_originse
   717F 19            [11] 6015 	add	hl,de
   7180 11 04 00      [10] 6016 	ld	de, #0x0004
   7183 19            [11] 6017 	add	hl, de
   7184 7E            [ 7] 6018 	ld	a,(hl)
   7185 32 F5 90      [13] 6019 	ld	(#(_enemy + 0x0004)),a
                           6020 ;src/main.c:184: enemy.oy = originse[map-1][5];
   7188 21 D1 90      [10] 6021 	ld	hl,#_map + 0
   718B 56            [ 7] 6022 	ld	d, (hl)
   718C 15            [ 4] 6023 	dec	d
   718D 4A            [ 4] 6024 	ld	c,d
   718E 06 00         [ 7] 6025 	ld	b,#0x00
   7190 69            [ 4] 6026 	ld	l, c
   7191 60            [ 4] 6027 	ld	h, b
   7192 29            [11] 6028 	add	hl, hl
   7193 09            [11] 6029 	add	hl, bc
   7194 29            [11] 6030 	add	hl, hl
   7195 11 39 4B      [10] 6031 	ld	de,#_originse
   7198 19            [11] 6032 	add	hl,de
   7199 11 05 00      [10] 6033 	ld	de, #0x0005
   719C 19            [11] 6034 	add	hl, de
   719D 7E            [ 7] 6035 	ld	a,(hl)
   719E 32 F6 90      [13] 6036 	ld	(#(_enemy + 0x0005)),a
                           6037 ;src/main.c:185: enemy.life -= 1;
   71A1 3A F9 90      [13] 6038 	ld	a, (#(_enemy + 0x0008) + 0)
   71A4 C6 FF         [ 7] 6039 	add	a,#0xFF
   71A6 32 F9 90      [13] 6040 	ld	(#(_enemy + 0x0008)),a
                           6041 ;src/main.c:186: player.atk = 20;
   71A9 21 EE 90      [10] 6042 	ld	hl,#(_player + 0x0008)
   71AC 36 14         [10] 6043 	ld	(hl),#0x14
                           6044 ;src/main.c:187: enemy.pursue = 0;
   71AE 21 FE 90      [10] 6045 	ld	hl,#(_enemy + 0x000d)
   71B1 36 00         [10] 6046 	ld	(hl),#0x00
                           6047 ;src/main.c:188: break;
   71B3 18 6D         [12] 6048 	jr	00121$
                           6049 ;src/main.c:189: case 2:
   71B5                    6050 00118$:
                           6051 ;src/main.c:190: erase(player.lx,player.ly,0);
   71B5 21 E9 90      [10] 6052 	ld	hl, #(_player + 0x0003) + 0
   71B8 56            [ 7] 6053 	ld	d,(hl)
   71B9 21 E8 90      [10] 6054 	ld	hl, #(_player + 0x0002) + 0
   71BC 46            [ 7] 6055 	ld	b,(hl)
   71BD AF            [ 4] 6056 	xor	a, a
   71BE F5            [11] 6057 	push	af
   71BF 33            [ 6] 6058 	inc	sp
   71C0 D5            [11] 6059 	push	de
   71C1 33            [ 6] 6060 	inc	sp
   71C2 C5            [11] 6061 	push	bc
   71C3 33            [ 6] 6062 	inc	sp
   71C4 CD E6 53      [17] 6063 	call	_erase
   71C7 F1            [10] 6064 	pop	af
   71C8 33            [ 6] 6065 	inc	sp
                           6066 ;src/main.c:191: player.x =originsp[map-1][0];
   71C9 21 D1 90      [10] 6067 	ld	hl,#_map + 0
   71CC 56            [ 7] 6068 	ld	d, (hl)
   71CD 15            [ 4] 6069 	dec	d
   71CE 6A            [ 4] 6070 	ld	l,d
   71CF 26 00         [ 7] 6071 	ld	h,#0x00
   71D1 29            [11] 6072 	add	hl, hl
   71D2 11 31 4B      [10] 6073 	ld	de,#_originsp
   71D5 19            [11] 6074 	add	hl,de
   71D6 7E            [ 7] 6075 	ld	a,(hl)
   71D7 32 E6 90      [13] 6076 	ld	(#_player),a
                           6077 ;src/main.c:192: player.y = originsp[map-1][1];
   71DA 21 D1 90      [10] 6078 	ld	hl,#_map + 0
   71DD 56            [ 7] 6079 	ld	d, (hl)
   71DE 15            [ 4] 6080 	dec	d
   71DF 6A            [ 4] 6081 	ld	l,d
   71E0 26 00         [ 7] 6082 	ld	h,#0x00
   71E2 29            [11] 6083 	add	hl, hl
   71E3 11 31 4B      [10] 6084 	ld	de,#_originsp
   71E6 19            [11] 6085 	add	hl,de
   71E7 23            [ 6] 6086 	inc	hl
   71E8 7E            [ 7] 6087 	ld	a,(hl)
   71E9 32 E7 90      [13] 6088 	ld	(#(_player + 0x0001)),a
                           6089 ;src/main.c:193: player.lx =originsp[map-1][0];
   71EC 21 D1 90      [10] 6090 	ld	hl,#_map + 0
   71EF 56            [ 7] 6091 	ld	d, (hl)
   71F0 15            [ 4] 6092 	dec	d
   71F1 6A            [ 4] 6093 	ld	l,d
   71F2 26 00         [ 7] 6094 	ld	h,#0x00
   71F4 29            [11] 6095 	add	hl, hl
   71F5 11 31 4B      [10] 6096 	ld	de,#_originsp
   71F8 19            [11] 6097 	add	hl,de
   71F9 7E            [ 7] 6098 	ld	a,(hl)
   71FA 32 E8 90      [13] 6099 	ld	(#(_player + 0x0002)),a
                           6100 ;src/main.c:194: player.ly = originsp[map-1][1];
   71FD 21 D1 90      [10] 6101 	ld	hl,#_map + 0
   7200 56            [ 7] 6102 	ld	d, (hl)
   7201 15            [ 4] 6103 	dec	d
   7202 6A            [ 4] 6104 	ld	l,d
   7203 26 00         [ 7] 6105 	ld	h,#0x00
   7205 29            [11] 6106 	add	hl, hl
   7206 11 31 4B      [10] 6107 	ld	de,#_originsp
   7209 19            [11] 6108 	add	hl,de
   720A 23            [ 6] 6109 	inc	hl
   720B 7E            [ 7] 6110 	ld	a,(hl)
   720C 21 E9 90      [10] 6111 	ld	hl,#(_player + 0x0003)
   720F 77            [ 7] 6112 	ld	(hl),a
                           6113 ;src/main.c:195: player.life -= 1;
   7210 3A EC 90      [13] 6114 	ld	a, (#(_player + 0x0006) + 0)
   7213 C6 FF         [ 7] 6115 	add	a,#0xFF
   7215 32 EC 90      [13] 6116 	ld	(#(_player + 0x0006)),a
                           6117 ;src/main.c:196: player.atk = 20;
   7218 21 EE 90      [10] 6118 	ld	hl,#(_player + 0x0008)
   721B 36 14         [10] 6119 	ld	(hl),#0x14
                           6120 ;src/main.c:197: enemy.pursue = 0;
   721D 21 FE 90      [10] 6121 	ld	hl,#(_enemy + 0x000d)
   7220 36 00         [10] 6122 	ld	(hl),#0x00
                           6123 ;src/main.c:199: }
   7222                    6124 00121$:
                           6125 ;src/main.c:201: if(temp > 10)
   7222 3E 0A         [ 7] 6126 	ld	a,#0x0A
   7224 FD 21 D0 90   [14] 6127 	ld	iy,#_temp
   7228 FD 96 00      [19] 6128 	sub	a, 0 (iy)
   722B 30 08         [12] 6129 	jr	NC,00123$
                           6130 ;src/main.c:202: temp = 0;
   722D FD 21 D0 90   [14] 6131 	ld	iy,#_temp
   7231 FD 36 00 00   [19] 6132 	ld	0 (iy),#0x00
   7235                    6133 00123$:
                           6134 ;src/main.c:203: temp += 1;
   7235 FD 21 D0 90   [14] 6135 	ld	iy,#_temp
   7239 FD 34 00      [23] 6136 	inc	0 (iy)
                           6137 ;src/main.c:204: player.latk = player.atk;
   723C 11 EF 90      [10] 6138 	ld	de,#_player + 9
   723F 3A EE 90      [13] 6139 	ld	a, (#(_player + 0x0008) + 0)
   7242 12            [ 7] 6140 	ld	(de),a
                           6141 ;src/main.c:206: cpct_scanKeyboard_f();
   7243 CD 28 8B      [17] 6142 	call	_cpct_scanKeyboard_f
                           6143 ;src/main.c:207: player.sprite = checkKeyboard();
   7246 CD D2 6A      [17] 6144 	call	_checkKeyboard
   7249 5D            [ 4] 6145 	ld	e,l
   724A 54            [ 4] 6146 	ld	d,h
   724B ED 53 EA 90   [20] 6147 	ld	((_player + 0x0004)), de
                           6148 ;src/main.c:208: checkBoundsCollisions(&n.corazon,&n.bullet);
   724F 21 DB 90      [10] 6149 	ld	hl,#(_n + 0x0002)
   7252 11 DA 90      [10] 6150 	ld	de,#(_n + 0x0001)
   7255 E5            [11] 6151 	push	hl
   7256 D5            [11] 6152 	push	de
   7257 CD 81 61      [17] 6153 	call	_checkBoundsCollisions
   725A F1            [10] 6154 	pop	af
   725B F1            [10] 6155 	pop	af
                           6156 ;src/main.c:210: if(arrow == 1){
   725C 3A D4 90      [13] 6157 	ld	a,(#_arrow + 0)
   725F 3D            [ 4] 6158 	dec	a
   7260 C2 F3 72      [10] 6159 	jp	NZ,00133$
                           6160 ;src/main.c:211: moveObject();
   7263 CD 4E 6D      [17] 6161 	call	_moveObject
                           6162 ;src/main.c:212: bound = checkArrowCollisions();
   7266 CD 89 68      [17] 6163 	call	_checkArrowCollisions
   7269 FD 21 D6 90   [14] 6164 	ld	iy,#_bound
   726D FD 75 00      [19] 6165 	ld	0 (iy),l
                           6166 ;src/main.c:213: if(object.dir == 2 || object.dir == 8)
   7270 21 E3 90      [10] 6167 	ld	hl, #_object + 7
   7273 7E            [ 7] 6168 	ld	a, (hl)
   7274 FE 02         [ 7] 6169 	cp	a,#0x02
   7276 28 04         [12] 6170 	jr	Z,00124$
   7278 D6 08         [ 7] 6171 	sub	a, #0x08
   727A 20 04         [12] 6172 	jr	NZ,00125$
   727C                    6173 00124$:
                           6174 ;src/main.c:214: atkObj = 21;
   727C 06 15         [ 7] 6175 	ld	b,#0x15
   727E 18 02         [12] 6176 	jr	00126$
   7280                    6177 00125$:
                           6178 ;src/main.c:216: atkObj = 22;
   7280 06 16         [ 7] 6179 	ld	b,#0x16
   7282                    6180 00126$:
                           6181 ;src/main.c:217: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
   7282 3A F9 90      [13] 6182 	ld	a, (#(_enemy + 0x0008) + 0)
   7285 B7            [ 4] 6183 	or	a, a
   7286 28 6B         [12] 6184 	jr	Z,00133$
   7288 3A F2 90      [13] 6185 	ld	a, (#(_enemy + 0x0001) + 0)
   728B 21 F1 90      [10] 6186 	ld	hl, #_enemy + 0
   728E 4E            [ 7] 6187 	ld	c,(hl)
   728F 21 DD 90      [10] 6188 	ld	hl, #_object + 1
   7292 5E            [ 7] 6189 	ld	e,(hl)
   7293 21 DC 90      [10] 6190 	ld	hl, #_object + 0
   7296 56            [ 7] 6191 	ld	d,(hl)
   7297 C5            [11] 6192 	push	bc
   7298 33            [ 6] 6193 	inc	sp
   7299 F5            [11] 6194 	push	af
   729A 33            [ 6] 6195 	inc	sp
   729B 79            [ 4] 6196 	ld	a,c
   729C F5            [11] 6197 	push	af
   729D 33            [ 6] 6198 	inc	sp
   729E 7B            [ 4] 6199 	ld	a,e
   729F F5            [11] 6200 	push	af
   72A0 33            [ 6] 6201 	inc	sp
   72A1 D5            [11] 6202 	push	de
   72A2 33            [ 6] 6203 	inc	sp
   72A3 CD 01 61      [17] 6204 	call	_checkCollisions
   72A6 F1            [10] 6205 	pop	af
   72A7 F1            [10] 6206 	pop	af
   72A8 33            [ 6] 6207 	inc	sp
   72A9 2D            [ 4] 6208 	dec	l
   72AA 20 47         [12] 6209 	jr	NZ,00133$
   72AC 3A D6 90      [13] 6210 	ld	a,(#_bound + 0)
   72AF B7            [ 4] 6211 	or	a, a
   72B0 20 41         [12] 6212 	jr	NZ,00133$
                           6213 ;src/main.c:218: enemy.life -= 1;
   72B2 3A F9 90      [13] 6214 	ld	a, (#(_enemy + 0x0008) + 0)
   72B5 C6 FF         [ 7] 6215 	add	a,#0xFF
   72B7 32 F9 90      [13] 6216 	ld	(#(_enemy + 0x0008)),a
                           6217 ;src/main.c:219: erase(enemy.lx,enemy.ly,0);
   72BA 21 F4 90      [10] 6218 	ld	hl, #(_enemy + 0x0003) + 0
   72BD 46            [ 7] 6219 	ld	b,(hl)
   72BE 21 F3 90      [10] 6220 	ld	hl, #(_enemy + 0x0002) + 0
   72C1 56            [ 7] 6221 	ld	d,(hl)
   72C2 AF            [ 4] 6222 	xor	a, a
   72C3 F5            [11] 6223 	push	af
   72C4 33            [ 6] 6224 	inc	sp
   72C5 4A            [ 4] 6225 	ld	c, d
   72C6 C5            [11] 6226 	push	bc
   72C7 CD E6 53      [17] 6227 	call	_erase
   72CA F1            [10] 6228 	pop	af
   72CB 33            [ 6] 6229 	inc	sp
                           6230 ;src/main.c:220: enemy.x = enemy.ox;
   72CC 21 F5 90      [10] 6231 	ld	hl, #(_enemy + 0x0004) + 0
   72CF 56            [ 7] 6232 	ld	d,(hl)
   72D0 21 F1 90      [10] 6233 	ld	hl,#_enemy
   72D3 72            [ 7] 6234 	ld	(hl),d
                           6235 ;src/main.c:221: enemy.y = enemy.oy;
   72D4 3A F6 90      [13] 6236 	ld	a, (#(_enemy + 0x0005) + 0)
   72D7 32 F2 90      [13] 6237 	ld	(#(_enemy + 0x0001)),a
                           6238 ;src/main.c:222: enemy.lx = enemy.x;
   72DA 21 F3 90      [10] 6239 	ld	hl,#(_enemy + 0x0002)
   72DD 72            [ 7] 6240 	ld	(hl),d
                           6241 ;src/main.c:223: enemy.ly = enemy.y;
   72DE 32 F4 90      [13] 6242 	ld	(#(_enemy + 0x0003)),a
                           6243 ;src/main.c:224: enemy.pursue = 0;
   72E1 21 FE 90      [10] 6244 	ld	hl,#(_enemy + 0x000d)
   72E4 36 00         [10] 6245 	ld	(hl),#0x00
                           6246 ;src/main.c:225: object.vivo = 0;
   72E6 21 E2 90      [10] 6247 	ld	hl,#_object + 6
   72E9 36 00         [10] 6248 	ld	(hl),#0x00
                           6249 ;src/main.c:226: bound = 1;
   72EB FD 21 D6 90   [14] 6250 	ld	iy,#_bound
   72EF FD 36 00 01   [19] 6251 	ld	0 (iy),#0x01
   72F3                    6252 00133$:
                           6253 ;src/main.c:230: if(player.life == 0){
   72F3 3A EC 90      [13] 6254 	ld	a, (#(_player + 0x0006) + 0)
   72F6 B7            [ 4] 6255 	or	a, a
   72F7 C2 8C 70      [10] 6256 	jp	NZ,00137$
                           6257 ;src/main.c:231: gameOver();
   72FA CD 83 6D      [17] 6258 	call	_gameOver
                           6259 ;src/main.c:232: finish = 1;
   72FD 21 D3 90      [10] 6260 	ld	hl,#_finish + 0
   7300 36 01         [10] 6261 	ld	(hl), #0x01
   7302 C3 8C 70      [10] 6262 	jp	00137$
                           6263 ;src/main.c:241: void credits(){
                           6264 ;	---------------------------------
                           6265 ; Function credits
                           6266 ; ---------------------------------
   7305                    6267 _credits::
                           6268 ;src/main.c:243: cpct_clearScreen(0);
   7305 21 00 40      [10] 6269 	ld	hl,#0x4000
   7308 E5            [11] 6270 	push	hl
   7309 AF            [ 4] 6271 	xor	a, a
   730A F5            [11] 6272 	push	af
   730B 33            [ 6] 6273 	inc	sp
   730C 26 C0         [ 7] 6274 	ld	h, #0xC0
   730E E5            [11] 6275 	push	hl
   730F CD F7 8D      [17] 6276 	call	_cpct_memset
                           6277 ;src/main.c:245: memptr = cpct_getScreenPtr(VMEM, 18, 30); 
   7312 21 12 1E      [10] 6278 	ld	hl,#0x1E12
   7315 E5            [11] 6279 	push	hl
   7316 21 00 C0      [10] 6280 	ld	hl,#0xC000
   7319 E5            [11] 6281 	push	hl
   731A CD EA 8E      [17] 6282 	call	_cpct_getScreenPtr
                           6283 ;src/main.c:246: cpct_drawStringM0("Grupo Pyxis", memptr, 1, 0); 
   731D EB            [ 4] 6284 	ex	de,hl
   731E 01 EB 73      [10] 6285 	ld	bc,#___str_8+0
   7321 21 01 00      [10] 6286 	ld	hl,#0x0001
   7324 E5            [11] 6287 	push	hl
   7325 D5            [11] 6288 	push	de
   7326 C5            [11] 6289 	push	bc
   7327 CD 09 8C      [17] 6290 	call	_cpct_drawStringM0
   732A 21 06 00      [10] 6291 	ld	hl,#6
   732D 39            [11] 6292 	add	hl,sp
   732E F9            [ 6] 6293 	ld	sp,hl
                           6294 ;src/main.c:248: memptr = cpct_getScreenPtr(VMEM, 23, 60); 
   732F 21 17 3C      [10] 6295 	ld	hl,#0x3C17
   7332 E5            [11] 6296 	push	hl
   7333 21 00 C0      [10] 6297 	ld	hl,#0xC000
   7336 E5            [11] 6298 	push	hl
   7337 CD EA 8E      [17] 6299 	call	_cpct_getScreenPtr
                           6300 ;src/main.c:249: cpct_drawStringM0("Miembros:", memptr, 1, 0); 
   733A EB            [ 4] 6301 	ex	de,hl
   733B 01 F7 73      [10] 6302 	ld	bc,#___str_9+0
   733E 21 01 00      [10] 6303 	ld	hl,#0x0001
   7341 E5            [11] 6304 	push	hl
   7342 D5            [11] 6305 	push	de
   7343 C5            [11] 6306 	push	bc
   7344 CD 09 8C      [17] 6307 	call	_cpct_drawStringM0
   7347 21 06 00      [10] 6308 	ld	hl,#6
   734A 39            [11] 6309 	add	hl,sp
   734B F9            [ 6] 6310 	ld	sp,hl
                           6311 ;src/main.c:251: memptr = cpct_getScreenPtr(VMEM, 10, 80); 
   734C 21 0A 50      [10] 6312 	ld	hl,#0x500A
   734F E5            [11] 6313 	push	hl
   7350 21 00 C0      [10] 6314 	ld	hl,#0xC000
   7353 E5            [11] 6315 	push	hl
   7354 CD EA 8E      [17] 6316 	call	_cpct_getScreenPtr
                           6317 ;src/main.c:252: cpct_drawStringM0("Alberto Martinez", memptr,2, 0); 
   7357 EB            [ 4] 6318 	ex	de,hl
   7358 01 01 74      [10] 6319 	ld	bc,#___str_10+0
   735B 21 02 00      [10] 6320 	ld	hl,#0x0002
   735E E5            [11] 6321 	push	hl
   735F D5            [11] 6322 	push	de
   7360 C5            [11] 6323 	push	bc
   7361 CD 09 8C      [17] 6324 	call	_cpct_drawStringM0
   7364 21 06 00      [10] 6325 	ld	hl,#6
   7367 39            [11] 6326 	add	hl,sp
   7368 F9            [ 6] 6327 	ld	sp,hl
                           6328 ;src/main.c:253: memptr = cpct_getScreenPtr(VMEM, 27, 95); 
   7369 21 1B 5F      [10] 6329 	ld	hl,#0x5F1B
   736C E5            [11] 6330 	push	hl
   736D 21 00 C0      [10] 6331 	ld	hl,#0xC000
   7370 E5            [11] 6332 	push	hl
   7371 CD EA 8E      [17] 6333 	call	_cpct_getScreenPtr
                           6334 ;src/main.c:254: cpct_drawStringM0("Martinez", memptr,2, 0); 
   7374 EB            [ 4] 6335 	ex	de,hl
   7375 01 12 74      [10] 6336 	ld	bc,#___str_11+0
   7378 21 02 00      [10] 6337 	ld	hl,#0x0002
   737B E5            [11] 6338 	push	hl
   737C D5            [11] 6339 	push	de
   737D C5            [11] 6340 	push	bc
   737E CD 09 8C      [17] 6341 	call	_cpct_drawStringM0
   7381 21 06 00      [10] 6342 	ld	hl,#6
   7384 39            [11] 6343 	add	hl,sp
   7385 F9            [ 6] 6344 	ld	sp,hl
                           6345 ;src/main.c:256: memptr = cpct_getScreenPtr(VMEM, 13, 115); 
   7386 21 0D 73      [10] 6346 	ld	hl,#0x730D
   7389 E5            [11] 6347 	push	hl
   738A 21 00 C0      [10] 6348 	ld	hl,#0xC000
   738D E5            [11] 6349 	push	hl
   738E CD EA 8E      [17] 6350 	call	_cpct_getScreenPtr
                           6351 ;src/main.c:257: cpct_drawStringM0("Josep Domenech", memptr,2, 0);
   7391 EB            [ 4] 6352 	ex	de,hl
   7392 01 1B 74      [10] 6353 	ld	bc,#___str_12+0
   7395 21 02 00      [10] 6354 	ld	hl,#0x0002
   7398 E5            [11] 6355 	push	hl
   7399 D5            [11] 6356 	push	de
   739A C5            [11] 6357 	push	bc
   739B CD 09 8C      [17] 6358 	call	_cpct_drawStringM0
   739E 21 06 00      [10] 6359 	ld	hl,#6
   73A1 39            [11] 6360 	add	hl,sp
   73A2 F9            [ 6] 6361 	ld	sp,hl
                           6362 ;src/main.c:258: memptr = cpct_getScreenPtr(VMEM, 27, 125); 
   73A3 21 1B 7D      [10] 6363 	ld	hl,#0x7D1B
   73A6 E5            [11] 6364 	push	hl
   73A7 21 00 C0      [10] 6365 	ld	hl,#0xC000
   73AA E5            [11] 6366 	push	hl
   73AB CD EA 8E      [17] 6367 	call	_cpct_getScreenPtr
                           6368 ;src/main.c:259: cpct_drawStringM0("Mingot", memptr, 2, 0);  
   73AE EB            [ 4] 6369 	ex	de,hl
   73AF 01 2A 74      [10] 6370 	ld	bc,#___str_13+0
   73B2 21 02 00      [10] 6371 	ld	hl,#0x0002
   73B5 E5            [11] 6372 	push	hl
   73B6 D5            [11] 6373 	push	de
   73B7 C5            [11] 6374 	push	bc
   73B8 CD 09 8C      [17] 6375 	call	_cpct_drawStringM0
   73BB 21 06 00      [10] 6376 	ld	hl,#6
   73BE 39            [11] 6377 	add	hl,sp
   73BF F9            [ 6] 6378 	ld	sp,hl
                           6379 ;src/main.c:261: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   73C0 21 0C AF      [10] 6380 	ld	hl,#0xAF0C
   73C3 E5            [11] 6381 	push	hl
   73C4 21 00 C0      [10] 6382 	ld	hl,#0xC000
   73C7 E5            [11] 6383 	push	hl
   73C8 CD EA 8E      [17] 6384 	call	_cpct_getScreenPtr
                           6385 ;src/main.c:262: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   73CB EB            [ 4] 6386 	ex	de,hl
   73CC 01 31 74      [10] 6387 	ld	bc,#___str_14+0
   73CF 21 01 00      [10] 6388 	ld	hl,#0x0001
   73D2 E5            [11] 6389 	push	hl
   73D3 D5            [11] 6390 	push	de
   73D4 C5            [11] 6391 	push	bc
   73D5 CD 09 8C      [17] 6392 	call	_cpct_drawStringM0
   73D8 21 06 00      [10] 6393 	ld	hl,#6
   73DB 39            [11] 6394 	add	hl,sp
   73DC F9            [ 6] 6395 	ld	sp,hl
                           6396 ;src/main.c:266: while (1){
   73DD                    6397 00104$:
                           6398 ;src/main.c:267: cpct_scanKeyboard_f();
   73DD CD 28 8B      [17] 6399 	call	_cpct_scanKeyboard_f
                           6400 ;src/main.c:268: if(cpct_isKeyPressed(Key_Space)) {
   73E0 21 05 80      [10] 6401 	ld	hl,#0x8005
   73E3 CD 1C 8B      [17] 6402 	call	_cpct_isKeyPressed
   73E6 7D            [ 4] 6403 	ld	a,l
   73E7 B7            [ 4] 6404 	or	a, a
   73E8 28 F3         [12] 6405 	jr	Z,00104$
                           6406 ;src/main.c:270: return;
   73EA C9            [10] 6407 	ret
   73EB                    6408 ___str_8:
   73EB 47 72 75 70 6F 20  6409 	.ascii "Grupo Pyxis"
        50 79 78 69 73
   73F6 00                 6410 	.db 0x00
   73F7                    6411 ___str_9:
   73F7 4D 69 65 6D 62 72  6412 	.ascii "Miembros:"
        6F 73 3A
   7400 00                 6413 	.db 0x00
   7401                    6414 ___str_10:
   7401 41 6C 62 65 72 74  6415 	.ascii "Alberto Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A
   7411 00                 6416 	.db 0x00
   7412                    6417 ___str_11:
   7412 4D 61 72 74 69 6E  6418 	.ascii "Martinez"
        65 7A
   741A 00                 6419 	.db 0x00
   741B                    6420 ___str_12:
   741B 4A 6F 73 65 70 20  6421 	.ascii "Josep Domenech"
        44 6F 6D 65 6E 65
        63 68
   7429 00                 6422 	.db 0x00
   742A                    6423 ___str_13:
   742A 4D 69 6E 67 6F 74  6424 	.ascii "Mingot"
   7430 00                 6425 	.db 0x00
   7431                    6426 ___str_14:
   7431 50 75 6C 73 61 20  6427 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   743E 00                 6428 	.db 0x00
                           6429 ;src/main.c:279: void controles(){
                           6430 ;	---------------------------------
                           6431 ; Function controles
                           6432 ; ---------------------------------
   743F                    6433 _controles::
                           6434 ;src/main.c:281: cpct_clearScreen(0);
   743F 21 00 40      [10] 6435 	ld	hl,#0x4000
   7442 E5            [11] 6436 	push	hl
   7443 AF            [ 4] 6437 	xor	a, a
   7444 F5            [11] 6438 	push	af
   7445 33            [ 6] 6439 	inc	sp
   7446 26 C0         [ 7] 6440 	ld	h, #0xC0
   7448 E5            [11] 6441 	push	hl
   7449 CD F7 8D      [17] 6442 	call	_cpct_memset
                           6443 ;src/main.c:283: memptr = cpct_getScreenPtr(VMEM, 23, 60); 
   744C 21 17 3C      [10] 6444 	ld	hl,#0x3C17
   744F E5            [11] 6445 	push	hl
   7450 21 00 C0      [10] 6446 	ld	hl,#0xC000
   7453 E5            [11] 6447 	push	hl
   7454 CD EA 8E      [17] 6448 	call	_cpct_getScreenPtr
                           6449 ;src/main.c:284: cpct_drawStringM0("Controles:", memptr, 1, 0); 
   7457 EB            [ 4] 6450 	ex	de,hl
   7458 01 08 75      [10] 6451 	ld	bc,#___str_15+0
   745B 21 01 00      [10] 6452 	ld	hl,#0x0001
   745E E5            [11] 6453 	push	hl
   745F D5            [11] 6454 	push	de
   7460 C5            [11] 6455 	push	bc
   7461 CD 09 8C      [17] 6456 	call	_cpct_drawStringM0
   7464 21 06 00      [10] 6457 	ld	hl,#6
   7467 39            [11] 6458 	add	hl,sp
   7468 F9            [ 6] 6459 	ld	sp,hl
                           6460 ;src/main.c:286: memptr = cpct_getScreenPtr(VMEM, 11, 80); 
   7469 21 0B 50      [10] 6461 	ld	hl,#0x500B
   746C E5            [11] 6462 	push	hl
   746D 21 00 C0      [10] 6463 	ld	hl,#0xC000
   7470 E5            [11] 6464 	push	hl
   7471 CD EA 8E      [17] 6465 	call	_cpct_getScreenPtr
                           6466 ;src/main.c:287: cpct_drawStringM0("Movimiento: ", memptr, 2, 0); 
   7474 EB            [ 4] 6467 	ex	de,hl
   7475 01 13 75      [10] 6468 	ld	bc,#___str_16+0
   7478 21 02 00      [10] 6469 	ld	hl,#0x0002
   747B E5            [11] 6470 	push	hl
   747C D5            [11] 6471 	push	de
   747D C5            [11] 6472 	push	bc
   747E CD 09 8C      [17] 6473 	call	_cpct_drawStringM0
   7481 21 06 00      [10] 6474 	ld	hl,#6
   7484 39            [11] 6475 	add	hl,sp
   7485 F9            [ 6] 6476 	ld	sp,hl
                           6477 ;src/main.c:288: memptr = cpct_getScreenPtr(VMEM, 27, 95); 
   7486 21 1B 5F      [10] 6478 	ld	hl,#0x5F1B
   7489 E5            [11] 6479 	push	hl
   748A 21 00 C0      [10] 6480 	ld	hl,#0xC000
   748D E5            [11] 6481 	push	hl
   748E CD EA 8E      [17] 6482 	call	_cpct_getScreenPtr
                           6483 ;src/main.c:289: cpct_drawStringM0("Flechas", memptr, 2, 0); 
   7491 EB            [ 4] 6484 	ex	de,hl
   7492 01 20 75      [10] 6485 	ld	bc,#___str_17+0
   7495 21 02 00      [10] 6486 	ld	hl,#0x0002
   7498 E5            [11] 6487 	push	hl
   7499 D5            [11] 6488 	push	de
   749A C5            [11] 6489 	push	bc
   749B CD 09 8C      [17] 6490 	call	_cpct_drawStringM0
   749E 21 06 00      [10] 6491 	ld	hl,#6
   74A1 39            [11] 6492 	add	hl,sp
   74A2 F9            [ 6] 6493 	ld	sp,hl
                           6494 ;src/main.c:291: memptr = cpct_getScreenPtr(VMEM, 13, 115); 
   74A3 21 0D 73      [10] 6495 	ld	hl,#0x730D
   74A6 E5            [11] 6496 	push	hl
   74A7 21 00 C0      [10] 6497 	ld	hl,#0xC000
   74AA E5            [11] 6498 	push	hl
   74AB CD EA 8E      [17] 6499 	call	_cpct_getScreenPtr
                           6500 ;src/main.c:292: cpct_drawStringM0("Esc: Menu", memptr, 2, 0); 
   74AE EB            [ 4] 6501 	ex	de,hl
   74AF 01 28 75      [10] 6502 	ld	bc,#___str_18+0
   74B2 21 02 00      [10] 6503 	ld	hl,#0x0002
   74B5 E5            [11] 6504 	push	hl
   74B6 D5            [11] 6505 	push	de
   74B7 C5            [11] 6506 	push	bc
   74B8 CD 09 8C      [17] 6507 	call	_cpct_drawStringM0
   74BB 21 06 00      [10] 6508 	ld	hl,#6
   74BE 39            [11] 6509 	add	hl,sp
   74BF F9            [ 6] 6510 	ld	sp,hl
                           6511 ;src/main.c:293: memptr = cpct_getScreenPtr(VMEM, 13, 130); 
   74C0 21 0D 82      [10] 6512 	ld	hl,#0x820D
   74C3 E5            [11] 6513 	push	hl
   74C4 21 00 C0      [10] 6514 	ld	hl,#0xC000
   74C7 E5            [11] 6515 	push	hl
   74C8 CD EA 8E      [17] 6516 	call	_cpct_getScreenPtr
                           6517 ;src/main.c:294: cpct_drawStringM0("Disparar: X", memptr, 2, 0); 
   74CB EB            [ 4] 6518 	ex	de,hl
   74CC 01 32 75      [10] 6519 	ld	bc,#___str_19+0
   74CF 21 02 00      [10] 6520 	ld	hl,#0x0002
   74D2 E5            [11] 6521 	push	hl
   74D3 D5            [11] 6522 	push	de
   74D4 C5            [11] 6523 	push	bc
   74D5 CD 09 8C      [17] 6524 	call	_cpct_drawStringM0
   74D8 21 06 00      [10] 6525 	ld	hl,#6
   74DB 39            [11] 6526 	add	hl,sp
   74DC F9            [ 6] 6527 	ld	sp,hl
                           6528 ;src/main.c:296: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   74DD 21 0C AF      [10] 6529 	ld	hl,#0xAF0C
   74E0 E5            [11] 6530 	push	hl
   74E1 21 00 C0      [10] 6531 	ld	hl,#0xC000
   74E4 E5            [11] 6532 	push	hl
   74E5 CD EA 8E      [17] 6533 	call	_cpct_getScreenPtr
                           6534 ;src/main.c:297: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   74E8 EB            [ 4] 6535 	ex	de,hl
   74E9 01 3E 75      [10] 6536 	ld	bc,#___str_20+0
   74EC 21 01 00      [10] 6537 	ld	hl,#0x0001
   74EF E5            [11] 6538 	push	hl
   74F0 D5            [11] 6539 	push	de
   74F1 C5            [11] 6540 	push	bc
   74F2 CD 09 8C      [17] 6541 	call	_cpct_drawStringM0
   74F5 21 06 00      [10] 6542 	ld	hl,#6
   74F8 39            [11] 6543 	add	hl,sp
   74F9 F9            [ 6] 6544 	ld	sp,hl
                           6545 ;src/main.c:299: while (1){
   74FA                    6546 00104$:
                           6547 ;src/main.c:300: cpct_scanKeyboard_f();
   74FA CD 28 8B      [17] 6548 	call	_cpct_scanKeyboard_f
                           6549 ;src/main.c:301: if(cpct_isKeyPressed(Key_Space)) {
   74FD 21 05 80      [10] 6550 	ld	hl,#0x8005
   7500 CD 1C 8B      [17] 6551 	call	_cpct_isKeyPressed
   7503 7D            [ 4] 6552 	ld	a,l
   7504 B7            [ 4] 6553 	or	a, a
   7505 28 F3         [12] 6554 	jr	Z,00104$
                           6555 ;src/main.c:303: return;
   7507 C9            [10] 6556 	ret
   7508                    6557 ___str_15:
   7508 43 6F 6E 74 72 6F  6558 	.ascii "Controles:"
        6C 65 73 3A
   7512 00                 6559 	.db 0x00
   7513                    6560 ___str_16:
   7513 4D 6F 76 69 6D 69  6561 	.ascii "Movimiento: "
        65 6E 74 6F 3A 20
   751F 00                 6562 	.db 0x00
   7520                    6563 ___str_17:
   7520 46 6C 65 63 68 61  6564 	.ascii "Flechas"
        73
   7527 00                 6565 	.db 0x00
   7528                    6566 ___str_18:
   7528 45 73 63 3A 20 4D  6567 	.ascii "Esc: Menu"
        65 6E 75
   7531 00                 6568 	.db 0x00
   7532                    6569 ___str_19:
   7532 44 69 73 70 61 72  6570 	.ascii "Disparar: X"
        61 72 3A 20 58
   753D 00                 6571 	.db 0x00
   753E                    6572 ___str_20:
   753E 50 75 6C 73 61 20  6573 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   754B 00                 6574 	.db 0x00
                           6575 ;src/main.c:311: void main(void) {
                           6576 ;	---------------------------------
                           6577 ; Function main
                           6578 ; ---------------------------------
   754C                    6579 _main::
                           6580 ;src/main.c:313: init();
   754C CD 08 4B      [17] 6581 	call	_init
                           6582 ;src/main.c:316: while(1){
   754F                    6583 00107$:
                           6584 ;src/main.c:317: x=menu();
   754F CD 0F 6E      [17] 6585 	call	_menu
   7552 5D            [ 4] 6586 	ld	e, l
   7553 54            [ 4] 6587 	ld	d, h
                           6588 ;src/main.c:318: switch(x){
   7554 CB 7A         [ 8] 6589 	bit	7, d
   7556 20 F7         [12] 6590 	jr	NZ,00107$
   7558 3E 03         [ 7] 6591 	ld	a,#0x03
   755A BB            [ 4] 6592 	cp	a, e
   755B 3E 00         [ 7] 6593 	ld	a,#0x00
   755D 9A            [ 4] 6594 	sbc	a, d
   755E E2 63 75      [10] 6595 	jp	PO, 00123$
   7561 EE 80         [ 7] 6596 	xor	a, #0x80
   7563                    6597 00123$:
   7563 FA 4F 75      [10] 6598 	jp	M,00107$
   7566 16 00         [ 7] 6599 	ld	d,#0x00
   7568 21 6E 75      [10] 6600 	ld	hl,#00124$
   756B 19            [11] 6601 	add	hl,de
   756C 19            [11] 6602 	add	hl,de
                           6603 ;src/main.c:319: case 0: return;break;
                           6604 ;src/main.c:320: case 1: game(); break;
   756D E9            [ 4] 6605 	jp	(hl)
   756E                    6606 00124$:
   756E 18 17         [12] 6607 	jr	00109$
   7570 18 06         [12] 6608 	jr	00102$
   7572 18 09         [12] 6609 	jr	00103$
   7574 18 0C         [12] 6610 	jr	00104$
   7576 18 0F         [12] 6611 	jr	00109$
   7578                    6612 00102$:
   7578 CD 59 70      [17] 6613 	call	_game
   757B 18 D2         [12] 6614 	jr	00107$
                           6615 ;src/main.c:321: case 2: credits();break;
   757D                    6616 00103$:
   757D CD 05 73      [17] 6617 	call	_credits
   7580 18 CD         [12] 6618 	jr	00107$
                           6619 ;src/main.c:322: case 3: controles();break;
   7582                    6620 00104$:
   7582 CD 3F 74      [17] 6621 	call	_controles
                           6622 ;src/main.c:323: }
   7585 18 C8         [12] 6623 	jr	00107$
   7587                    6624 00109$:
   7587 C9            [10] 6625 	ret
                           6626 	.area _CODE
                           6627 	.area _INITIALIZER
                           6628 	.area _CABS (ABS)
