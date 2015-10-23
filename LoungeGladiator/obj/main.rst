                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct 23 17:33:43 2015
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
   9036                      90 _scene::
   9036                      91 	.ds 240
   9126                      92 _temp::
   9126                      93 	.ds 1
   9127                      94 _map::
   9127                      95 	.ds 1
   9128                      96 _path::
   9128                      97 	.ds 1
   9129                      98 _finish::
   9129                      99 	.ds 1
   912A                     100 _arrow::
   912A                     101 	.ds 1
   912B                     102 _following::
   912B                     103 	.ds 1
   912C                     104 _bound::
   912C                     105 	.ds 1
   912D                     106 _archer::
   912D                     107 	.ds 1
   912E                     108 _dead::
   912E                     109 	.ds 1
   912F                     110 _n::
   912F                     111 	.ds 3
   9132                     112 _object::
   9132                     113 	.ds 10
   913C                     114 _player::
   913C                     115 	.ds 11
   9147                     116 _enemy::
   9147                     117 	.ds 15
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
   4B08 CD 5E 8E      [17]  148 	call	_cpct_disableFirmware
                            149 ;src/init.h:15: cpct_setVideoMode(0);
   4B0B AF            [ 4]  150 	xor	a, a
   4B0C F5            [11]  151 	push	af
   4B0D 33            [ 6]  152 	inc	sp
   4B0E CD 3B 8E      [17]  153 	call	_cpct_setVideoMode
   4B11 33            [ 6]  154 	inc	sp
                            155 ;src/init.h:16: cpct_fw2hw(g_palette,4);
   4B12 11 2D 4B      [10]  156 	ld	de,#_g_palette
   4B15 3E 04         [ 7]  157 	ld	a,#0x04
   4B17 F5            [11]  158 	push	af
   4B18 33            [ 6]  159 	inc	sp
   4B19 D5            [11]  160 	push	de
   4B1A CD C5 8D      [17]  161 	call	_cpct_fw2hw
   4B1D F1            [10]  162 	pop	af
   4B1E 33            [ 6]  163 	inc	sp
                            164 ;src/init.h:17: cpct_setPalette(g_palette,4);
   4B1F 11 2D 4B      [10]  165 	ld	de,#_g_palette
   4B22 3E 04         [ 7]  166 	ld	a,#0x04
   4B24 F5            [11]  167 	push	af
   4B25 33            [ 6]  168 	inc	sp
   4B26 D5            [11]  169 	push	de
   4B27 CD 4E 8B      [17]  170 	call	_cpct_setPalette
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
   4B39 34                  189 	.db #0x34	; 52	'4'
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
   4D57 32 3C 91      [13]  731 	ld	(#_player),a
                            732 ;src/init.h:23: player.y = originsp[p-1][1];
   4D5A 59            [ 4]  733 	ld	e, c
   4D5B 50            [ 4]  734 	ld	d, b
   4D5C 13            [ 6]  735 	inc	de
   4D5D 1A            [ 7]  736 	ld	a,(de)
   4D5E 32 3D 91      [13]  737 	ld	(#(_player + 0x0001)),a
                            738 ;src/init.h:24: player.lx = originsp[p-1][0];
   4D61 0A            [ 7]  739 	ld	a,(bc)
   4D62 32 3E 91      [13]  740 	ld	(#(_player + 0x0002)),a
                            741 ;src/init.h:25: player.ly = originsp[p-1][1];
   4D65 1A            [ 7]  742 	ld	a,(de)
   4D66 32 3F 91      [13]  743 	ld	(#(_player + 0x0003)),a
                            744 ;src/init.h:26: player.sprite = sprite;
   4D69 21 00 40      [10]  745 	ld	hl,#_gladis_quieto_dcha
   4D6C 22 40 91      [16]  746 	ld	((_player + 0x0004)), hl
                            747 ;src/init.h:27: player.life = 3;
   4D6F 21 42 91      [10]  748 	ld	hl,#_player + 6
   4D72 36 03         [10]  749 	ld	(hl),#0x03
                            750 ;src/init.h:28: player.dir = 6;
   4D74 21 43 91      [10]  751 	ld	hl,#_player + 7
   4D77 36 06         [10]  752 	ld	(hl),#0x06
                            753 ;src/init.h:29: player.atk = 20;
   4D79 21 44 91      [10]  754 	ld	hl,#_player + 8
   4D7C 36 14         [10]  755 	ld	(hl),#0x14
                            756 ;src/init.h:30: player.latk = 20;
   4D7E 21 45 91      [10]  757 	ld	hl,#_player + 9
   4D81 36 14         [10]  758 	ld	(hl),#0x14
                            759 ;src/init.h:31: player.bullets = 3;
   4D83 21 46 91      [10]  760 	ld	hl,#_player + 10
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
   4DA1 32 3C 91      [13]  783 	ld	(#_player),a
                            784 ;src/init.h:37: player.y = originsp[p-1][1];
   4DA4 59            [ 4]  785 	ld	e, c
   4DA5 50            [ 4]  786 	ld	d, b
   4DA6 13            [ 6]  787 	inc	de
   4DA7 1A            [ 7]  788 	ld	a,(de)
   4DA8 32 3D 91      [13]  789 	ld	(#(_player + 0x0001)),a
                            790 ;src/init.h:38: player.lx = originsp[p-1][0];
   4DAB 0A            [ 7]  791 	ld	a,(bc)
   4DAC 32 3E 91      [13]  792 	ld	(#(_player + 0x0002)),a
                            793 ;src/init.h:39: player.ly = originsp[p-1][1];
   4DAF 1A            [ 7]  794 	ld	a,(de)
   4DB0 32 3F 91      [13]  795 	ld	(#(_player + 0x0003)),a
                            796 ;src/init.h:40: player.sprite = sprite;
   4DB3 21 00 40      [10]  797 	ld	hl,#_gladis_quieto_dcha
   4DB6 22 40 91      [16]  798 	ld	((_player + 0x0004)), hl
                            799 ;src/init.h:41: player.dir = 6;
   4DB9 21 43 91      [10]  800 	ld	hl,#_player + 7
   4DBC 36 06         [10]  801 	ld	(hl),#0x06
                            802 ;src/init.h:42: player.atk = 20;
   4DBE 21 44 91      [10]  803 	ld	hl,#_player + 8
   4DC1 36 14         [10]  804 	ld	(hl),#0x14
                            805 ;src/init.h:43: player.latk = 20;
   4DC3 21 45 91      [10]  806 	ld	hl,#_player + 9
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
   4DE4 32 47 91      [13]  832 	ld	(#_enemy),a
                            833 ;src/init.h:49: enemy.y = originse[p-1][1];
   4DE7 D5            [11]  834 	push	de
   4DE8 FD E1         [14]  835 	pop	iy
   4DEA FD 23         [10]  836 	inc	iy
   4DEC FD 7E 00      [19]  837 	ld	a, 0 (iy)
   4DEF 32 48 91      [13]  838 	ld	(#(_enemy + 0x0001)),a
                            839 ;src/init.h:50: enemy.lx = originse[p-1][0];
   4DF2 1A            [ 7]  840 	ld	a,(de)
   4DF3 32 49 91      [13]  841 	ld	(#(_enemy + 0x0002)),a
                            842 ;src/init.h:51: enemy.ly = originse[p-1][1];
   4DF6 FD 7E 00      [19]  843 	ld	a, 0 (iy)
   4DF9 32 4A 91      [13]  844 	ld	(#(_enemy + 0x0003)),a
                            845 ;src/init.h:52: enemy.ox = originse[p-1][2];
   4DFC 6B            [ 4]  846 	ld	l, e
   4DFD 62            [ 4]  847 	ld	h, d
   4DFE 23            [ 6]  848 	inc	hl
   4DFF 23            [ 6]  849 	inc	hl
   4E00 7E            [ 7]  850 	ld	a,(hl)
   4E01 32 4B 91      [13]  851 	ld	(#(_enemy + 0x0004)),a
                            852 ;src/init.h:53: enemy.oy = originse[p-1][3];
   4E04 D5            [11]  853 	push	de
   4E05 FD E1         [14]  854 	pop	iy
   4E07 FD 7E 03      [19]  855 	ld	a,3 (iy)
   4E0A 32 4C 91      [13]  856 	ld	(#(_enemy + 0x0005)),a
                            857 ;src/init.h:54: enemy.sprite = sprite;
   4E0D 21 80 44      [10]  858 	ld	hl,#_chacho_dcha
   4E10 22 4D 91      [16]  859 	ld	((_enemy + 0x0006)), hl
                            860 ;src/init.h:55: enemy.life = 1;//p;
   4E13 21 4F 91      [10]  861 	ld	hl,#_enemy + 8
   4E16 36 01         [10]  862 	ld	(hl),#0x01
                            863 ;src/init.h:56: enemy.dir = 6;
   4E18 21 50 91      [10]  864 	ld	hl,#_enemy + 9
   4E1B 36 06         [10]  865 	ld	(hl),#0x06
                            866 ;src/init.h:57: enemy.room = 3;
   4E1D 21 51 91      [10]  867 	ld	hl,#_enemy + 10
   4E20 36 03         [10]  868 	ld	(hl),#0x03
                            869 ;src/init.h:58: enemy.lp = 75 - ((p-1)*5);
   4E22 69            [ 4]  870 	ld	l,c
   4E23 29            [11]  871 	add	hl, hl
   4E24 29            [11]  872 	add	hl, hl
   4E25 09            [11]  873 	add	hl, bc
   4E26 3E 4B         [ 7]  874 	ld	a,#0x4B
   4E28 95            [ 4]  875 	sub	a, l
   4E29 32 55 91      [13]  876 	ld	(#(_enemy + 0x000e)),a
   4E2C DD E1         [14]  877 	pop	ix
   4E2E C9            [10]  878 	ret
                            879 ;src/init.h:61: void initNivel(){
                            880 ;	---------------------------------
                            881 ; Function initNivel
                            882 ; ---------------------------------
   4E2F                     883 _initNivel::
                            884 ;src/init.h:62: n.num=0;
   4E2F 21 2F 91      [10]  885 	ld	hl,#_n+0
   4E32 36 00         [10]  886 	ld	(hl),#0x00
                            887 ;src/init.h:63: n.corazon=0;
   4E34 21 30 91      [10]  888 	ld	hl,#_n + 1
   4E37 36 00         [10]  889 	ld	(hl),#0x00
                            890 ;src/init.h:64: n.bullet=0;
   4E39 21 31 91      [10]  891 	ld	hl,#_n + 2
   4E3C 36 00         [10]  892 	ld	(hl),#0x00
   4E3E C9            [10]  893 	ret
                            894 ;src/init.h:67: void initVariables(u8 m){
                            895 ;	---------------------------------
                            896 ; Function initVariables
                            897 ; ---------------------------------
   4E3F                     898 _initVariables::
                            899 ;src/init.h:68: bound =0;
   4E3F 21 2C 91      [10]  900 	ld	hl,#_bound + 0
   4E42 36 00         [10]  901 	ld	(hl), #0x00
                            902 ;src/init.h:69: temp = 0;
   4E44 21 26 91      [10]  903 	ld	hl,#_temp + 0
   4E47 36 00         [10]  904 	ld	(hl), #0x00
                            905 ;src/init.h:70: map = m;
   4E49 21 02 00      [10]  906 	ld	hl, #2+0
   4E4C 39            [11]  907 	add	hl, sp
   4E4D 7E            [ 7]  908 	ld	a, (hl)
   4E4E 32 27 91      [13]  909 	ld	(#_map + 0),a
                            910 ;src/init.h:71: arrow =0;
   4E51 21 2A 91      [10]  911 	ld	hl,#_arrow + 0
   4E54 36 00         [10]  912 	ld	(hl), #0x00
                            913 ;src/init.h:72: finish =0;
   4E56 21 29 91      [10]  914 	ld	hl,#_finish + 0
   4E59 36 00         [10]  915 	ld	(hl), #0x00
                            916 ;src/init.h:73: following =0;
   4E5B 21 2B 91      [10]  917 	ld	hl,#_following + 0
   4E5E 36 00         [10]  918 	ld	(hl), #0x00
                            919 ;src/init.h:74: archer = 0;
   4E60 21 2D 91      [10]  920 	ld	hl,#_archer + 0
   4E63 36 00         [10]  921 	ld	(hl), #0x00
                            922 ;src/init.h:75: dead =0;
   4E65 21 2E 91      [10]  923 	ld	hl,#_dead + 0
   4E68 36 00         [10]  924 	ld	(hl), #0x00
   4E6A C9            [10]  925 	ret
                            926 ;src/draws.h:12: void endGame(){
                            927 ;	---------------------------------
                            928 ; Function endGame
                            929 ; ---------------------------------
   4E6B                     930 _endGame::
                            931 ;src/draws.h:14: cpct_clearScreen(0);
   4E6B 21 00 40      [10]  932 	ld	hl,#0x4000
   4E6E E5            [11]  933 	push	hl
   4E6F AF            [ 4]  934 	xor	a, a
   4E70 F5            [11]  935 	push	af
   4E71 33            [ 6]  936 	inc	sp
   4E72 26 C0         [ 7]  937 	ld	h, #0xC0
   4E74 E5            [11]  938 	push	hl
   4E75 CD 4D 8E      [17]  939 	call	_cpct_memset
                            940 ;src/draws.h:15: memptr = cpct_getScreenPtr(VMEM,10,10);
   4E78 21 0A 0A      [10]  941 	ld	hl,#0x0A0A
   4E7B E5            [11]  942 	push	hl
   4E7C 21 00 C0      [10]  943 	ld	hl,#0xC000
   4E7F E5            [11]  944 	push	hl
   4E80 CD 40 8F      [17]  945 	call	_cpct_getScreenPtr
                            946 ;src/draws.h:16: cpct_drawStringM0("Congratulations",memptr,1,0);
   4E83 EB            [ 4]  947 	ex	de,hl
   4E84 01 D8 4E      [10]  948 	ld	bc,#___str_0+0
   4E87 21 01 00      [10]  949 	ld	hl,#0x0001
   4E8A E5            [11]  950 	push	hl
   4E8B D5            [11]  951 	push	de
   4E8C C5            [11]  952 	push	bc
   4E8D CD 5F 8C      [17]  953 	call	_cpct_drawStringM0
   4E90 21 06 00      [10]  954 	ld	hl,#6
   4E93 39            [11]  955 	add	hl,sp
   4E94 F9            [ 6]  956 	ld	sp,hl
                            957 ;src/draws.h:18: memptr = cpct_getScreenPtr(VMEM,29,82);
   4E95 21 1D 52      [10]  958 	ld	hl,#0x521D
   4E98 E5            [11]  959 	push	hl
   4E99 21 00 C0      [10]  960 	ld	hl,#0xC000
   4E9C E5            [11]  961 	push	hl
   4E9D CD 40 8F      [17]  962 	call	_cpct_getScreenPtr
                            963 ;src/draws.h:19: cpct_drawSprite(cup,memptr,22,44);
   4EA0 EB            [ 4]  964 	ex	de,hl
   4EA1 01 80 46      [10]  965 	ld	bc,#_cup+0
   4EA4 21 16 2C      [10]  966 	ld	hl,#0x2C16
   4EA7 E5            [11]  967 	push	hl
   4EA8 D5            [11]  968 	push	de
   4EA9 C5            [11]  969 	push	bc
   4EAA CD 83 8C      [17]  970 	call	_cpct_drawSprite
                            971 ;src/draws.h:22: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   4EAD 21 0C AF      [10]  972 	ld	hl,#0xAF0C
   4EB0 E5            [11]  973 	push	hl
   4EB1 21 00 C0      [10]  974 	ld	hl,#0xC000
   4EB4 E5            [11]  975 	push	hl
   4EB5 CD 40 8F      [17]  976 	call	_cpct_getScreenPtr
                            977 ;src/draws.h:23: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   4EB8 EB            [ 4]  978 	ex	de,hl
   4EB9 01 E8 4E      [10]  979 	ld	bc,#___str_1+0
   4EBC 21 01 00      [10]  980 	ld	hl,#0x0001
   4EBF E5            [11]  981 	push	hl
   4EC0 D5            [11]  982 	push	de
   4EC1 C5            [11]  983 	push	bc
   4EC2 CD 5F 8C      [17]  984 	call	_cpct_drawStringM0
   4EC5 21 06 00      [10]  985 	ld	hl,#6
   4EC8 39            [11]  986 	add	hl,sp
   4EC9 F9            [ 6]  987 	ld	sp,hl
                            988 ;src/draws.h:25: while(1){
   4ECA                     989 00104$:
                            990 ;src/draws.h:26: cpct_scanKeyboard_f();
   4ECA CD 7E 8B      [17]  991 	call	_cpct_scanKeyboard_f
                            992 ;src/draws.h:27: if(cpct_isKeyPressed(Key_Space)) return;
   4ECD 21 05 80      [10]  993 	ld	hl,#0x8005
   4ED0 CD 72 8B      [17]  994 	call	_cpct_isKeyPressed
   4ED3 7D            [ 4]  995 	ld	a,l
   4ED4 B7            [ 4]  996 	or	a, a
   4ED5 28 F3         [12]  997 	jr	Z,00104$
   4ED7 C9            [10]  998 	ret
   4ED8                     999 ___str_0:
   4ED8 43 6F 6E 67 72 61  1000 	.ascii "Congratulations"
        74 75 6C 61 74 69
        6F 6E 73
   4EE7 00                 1001 	.db 0x00
   4EE8                    1002 ___str_1:
   4EE8 50 75 6C 73 61 20  1003 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   4EF5 00                 1004 	.db 0x00
                           1005 ;src/draws.h:32: void vaciar(){
                           1006 ;	---------------------------------
                           1007 ; Function vaciar
                           1008 ; ---------------------------------
   4EF6                    1009 _vaciar::
                           1010 ;src/draws.h:34: for(y=0;y<height;y++){
   4EF6 06 00         [ 7] 1011 	ld	b,#0x00
   4EF8 11 00 00      [10] 1012 	ld	de,#0x0000
                           1013 ;src/draws.h:35: for(x=0;x<width;x++){
   4EFB                    1014 00109$:
   4EFB 21 36 90      [10] 1015 	ld	hl,#_scene
   4EFE 19            [11] 1016 	add	hl,de
   4EFF 0E 00         [ 7] 1017 	ld	c,#0x00
   4F01                    1018 00103$:
                           1019 ;src/draws.h:36: scene[y][x] = 0;
   4F01 E5            [11] 1020 	push	hl
   4F02 69            [ 4] 1021 	ld	l,c
   4F03 26 00         [ 7] 1022 	ld	h,#0x00
   4F05 E5            [11] 1023 	push	hl
   4F06 FD E1         [14] 1024 	pop	iy
   4F08 E1            [10] 1025 	pop	hl
   4F09 C5            [11] 1026 	push	bc
   4F0A 4D            [ 4] 1027 	ld	c, l
   4F0B 44            [ 4] 1028 	ld	b, h
   4F0C FD 09         [15] 1029 	add	iy, bc
   4F0E C1            [10] 1030 	pop	bc
   4F0F FD 36 00 00   [19] 1031 	ld	0 (iy), #0x00
                           1032 ;src/draws.h:35: for(x=0;x<width;x++){
   4F13 0C            [ 4] 1033 	inc	c
   4F14 79            [ 4] 1034 	ld	a,c
   4F15 D6 14         [ 7] 1035 	sub	a, #0x14
   4F17 38 E8         [12] 1036 	jr	C,00103$
                           1037 ;src/draws.h:34: for(y=0;y<height;y++){
   4F19 21 14 00      [10] 1038 	ld	hl,#0x0014
   4F1C 19            [11] 1039 	add	hl,de
   4F1D EB            [ 4] 1040 	ex	de,hl
   4F1E 04            [ 4] 1041 	inc	b
   4F1F 78            [ 4] 1042 	ld	a,b
   4F20 D6 0C         [ 7] 1043 	sub	a, #0x0C
   4F22 38 D7         [12] 1044 	jr	C,00109$
   4F24 C9            [10] 1045 	ret
                           1046 ;src/draws.h:42: void mapSelector(u8 t){
                           1047 ;	---------------------------------
                           1048 ; Function mapSelector
                           1049 ; ---------------------------------
   4F25                    1050 _mapSelector::
   4F25 DD E5         [15] 1051 	push	ix
   4F27 DD 21 00 00   [14] 1052 	ld	ix,#0
   4F2B DD 39         [15] 1053 	add	ix,sp
   4F2D 21 F3 FF      [10] 1054 	ld	hl,#-13
   4F30 39            [11] 1055 	add	hl,sp
   4F31 F9            [ 6] 1056 	ld	sp,hl
                           1057 ;src/draws.h:44: vaciar();
   4F32 CD F6 4E      [17] 1058 	call	_vaciar
                           1059 ;src/draws.h:45: switch(t){
   4F35 DD 7E 04      [19] 1060 	ld	a,4 (ix)
   4F38 D6 01         [ 7] 1061 	sub	a, #0x01
   4F3A DA B7 51      [10] 1062 	jp	C,00136$
   4F3D 3E 04         [ 7] 1063 	ld	a,#0x04
   4F3F DD 96 04      [19] 1064 	sub	a, 4 (ix)
   4F42 DA B7 51      [10] 1065 	jp	C,00136$
   4F45 DD 5E 04      [19] 1066 	ld	e,4 (ix)
   4F48 1D            [ 4] 1067 	dec	e
   4F49 16 00         [ 7] 1068 	ld	d,#0x00
   4F4B 21 52 4F      [10] 1069 	ld	hl,#00232$
   4F4E 19            [11] 1070 	add	hl,de
   4F4F 19            [11] 1071 	add	hl,de
   4F50 19            [11] 1072 	add	hl,de
   4F51 E9            [ 4] 1073 	jp	(hl)
   4F52                    1074 00232$:
   4F52 C3 5E 4F      [10] 1075 	jp	00101$
   4F55 C3 E5 4F      [10] 1076 	jp	00104$
   4F58 C3 6C 50      [10] 1077 	jp	00107$
   4F5B C3 0F 51      [10] 1078 	jp	00111$
                           1079 ;src/draws.h:46: case 1: 
   4F5E                    1080 00101$:
                           1081 ;src/draws.h:47: for(y=0;y<height;y++){
   4F5E DD 36 F3 00   [19] 1082 	ld	-13 (ix),#0x00
   4F62 DD 36 FC 00   [19] 1083 	ld	-4 (ix),#0x00
   4F66 DD 36 FD 00   [19] 1084 	ld	-3 (ix),#0x00
                           1085 ;src/draws.h:48: for(x=0;x<width;x++){
   4F6A                    1086 00140$:
   4F6A 3E 36         [ 7] 1087 	ld	a,#<(_scene)
   4F6C DD 86 FC      [19] 1088 	add	a, -4 (ix)
   4F6F DD 77 FA      [19] 1089 	ld	-6 (ix),a
   4F72 3E 90         [ 7] 1090 	ld	a,#>(_scene)
   4F74 DD 8E FD      [19] 1091 	adc	a, -3 (ix)
   4F77 DD 77 FB      [19] 1092 	ld	-5 (ix),a
   4F7A 3E 61         [ 7] 1093 	ld	a,#<(_mapa1)
   4F7C DD 86 FC      [19] 1094 	add	a, -4 (ix)
   4F7F DD 77 FE      [19] 1095 	ld	-2 (ix),a
   4F82 3E 4B         [ 7] 1096 	ld	a,#>(_mapa1)
   4F84 DD 8E FD      [19] 1097 	adc	a, -3 (ix)
   4F87 DD 77 FF      [19] 1098 	ld	-1 (ix),a
   4F8A DD 36 F4 00   [19] 1099 	ld	-12 (ix),#0x00
   4F8E                    1100 00116$:
                           1101 ;src/draws.h:49: scene[y][x] = mapa1[y][x];
   4F8E DD 7E FA      [19] 1102 	ld	a,-6 (ix)
   4F91 DD 86 F4      [19] 1103 	add	a, -12 (ix)
   4F94 DD 77 F8      [19] 1104 	ld	-8 (ix),a
   4F97 DD 7E FB      [19] 1105 	ld	a,-5 (ix)
   4F9A CE 00         [ 7] 1106 	adc	a, #0x00
   4F9C DD 77 F9      [19] 1107 	ld	-7 (ix),a
   4F9F DD 7E FE      [19] 1108 	ld	a,-2 (ix)
   4FA2 DD 86 F4      [19] 1109 	add	a, -12 (ix)
   4FA5 DD 77 F6      [19] 1110 	ld	-10 (ix),a
   4FA8 DD 7E FF      [19] 1111 	ld	a,-1 (ix)
   4FAB CE 00         [ 7] 1112 	adc	a, #0x00
   4FAD DD 77 F7      [19] 1113 	ld	-9 (ix),a
   4FB0 DD 6E F6      [19] 1114 	ld	l,-10 (ix)
   4FB3 DD 66 F7      [19] 1115 	ld	h,-9 (ix)
   4FB6 7E            [ 7] 1116 	ld	a,(hl)
   4FB7 DD 6E F8      [19] 1117 	ld	l,-8 (ix)
   4FBA DD 66 F9      [19] 1118 	ld	h,-7 (ix)
   4FBD 77            [ 7] 1119 	ld	(hl),a
                           1120 ;src/draws.h:48: for(x=0;x<width;x++){
   4FBE DD 34 F4      [23] 1121 	inc	-12 (ix)
   4FC1 DD 7E F4      [19] 1122 	ld	a,-12 (ix)
   4FC4 D6 14         [ 7] 1123 	sub	a, #0x14
   4FC6 38 C6         [12] 1124 	jr	C,00116$
                           1125 ;src/draws.h:47: for(y=0;y<height;y++){
   4FC8 DD 7E FC      [19] 1126 	ld	a,-4 (ix)
   4FCB C6 14         [ 7] 1127 	add	a, #0x14
   4FCD DD 77 FC      [19] 1128 	ld	-4 (ix),a
   4FD0 DD 7E FD      [19] 1129 	ld	a,-3 (ix)
   4FD3 CE 00         [ 7] 1130 	adc	a, #0x00
   4FD5 DD 77 FD      [19] 1131 	ld	-3 (ix),a
   4FD8 DD 34 F3      [23] 1132 	inc	-13 (ix)
   4FDB DD 7E F3      [19] 1133 	ld	a,-13 (ix)
   4FDE D6 0C         [ 7] 1134 	sub	a, #0x0C
   4FE0 38 88         [12] 1135 	jr	C,00140$
                           1136 ;src/draws.h:52: break;
   4FE2 C3 B7 51      [10] 1137 	jp	00136$
                           1138 ;src/draws.h:53: case 2:
   4FE5                    1139 00104$:
                           1140 ;src/draws.h:54: for(y=0;y<height;y++){
   4FE5 DD 36 F3 00   [19] 1141 	ld	-13 (ix),#0x00
   4FE9 DD 36 F6 00   [19] 1142 	ld	-10 (ix),#0x00
   4FED DD 36 F7 00   [19] 1143 	ld	-9 (ix),#0x00
                           1144 ;src/draws.h:55: for(x=0;x<width;x++){
   4FF1                    1145 00144$:
   4FF1 3E 36         [ 7] 1146 	ld	a,#<(_scene)
   4FF3 DD 86 F6      [19] 1147 	add	a, -10 (ix)
   4FF6 DD 77 F8      [19] 1148 	ld	-8 (ix),a
   4FF9 3E 90         [ 7] 1149 	ld	a,#>(_scene)
   4FFB DD 8E F7      [19] 1150 	adc	a, -9 (ix)
   4FFE DD 77 F9      [19] 1151 	ld	-7 (ix),a
   5001 3E 51         [ 7] 1152 	ld	a,#<(_mapa2)
   5003 DD 86 F6      [19] 1153 	add	a, -10 (ix)
   5006 DD 77 FE      [19] 1154 	ld	-2 (ix),a
   5009 3E 4C         [ 7] 1155 	ld	a,#>(_mapa2)
   500B DD 8E F7      [19] 1156 	adc	a, -9 (ix)
   500E DD 77 FF      [19] 1157 	ld	-1 (ix),a
   5011 DD 36 F4 00   [19] 1158 	ld	-12 (ix),#0x00
   5015                    1159 00120$:
                           1160 ;src/draws.h:56: scene[y][x] = mapa2[y][x];
   5015 DD 7E F8      [19] 1161 	ld	a,-8 (ix)
   5018 DD 86 F4      [19] 1162 	add	a, -12 (ix)
   501B DD 77 FA      [19] 1163 	ld	-6 (ix),a
   501E DD 7E F9      [19] 1164 	ld	a,-7 (ix)
   5021 CE 00         [ 7] 1165 	adc	a, #0x00
   5023 DD 77 FB      [19] 1166 	ld	-5 (ix),a
   5026 DD 7E FE      [19] 1167 	ld	a,-2 (ix)
   5029 DD 86 F4      [19] 1168 	add	a, -12 (ix)
   502C DD 77 FC      [19] 1169 	ld	-4 (ix),a
   502F DD 7E FF      [19] 1170 	ld	a,-1 (ix)
   5032 CE 00         [ 7] 1171 	adc	a, #0x00
   5034 DD 77 FD      [19] 1172 	ld	-3 (ix),a
   5037 DD 6E FC      [19] 1173 	ld	l,-4 (ix)
   503A DD 66 FD      [19] 1174 	ld	h,-3 (ix)
   503D 7E            [ 7] 1175 	ld	a,(hl)
   503E DD 6E FA      [19] 1176 	ld	l,-6 (ix)
   5041 DD 66 FB      [19] 1177 	ld	h,-5 (ix)
   5044 77            [ 7] 1178 	ld	(hl),a
                           1179 ;src/draws.h:55: for(x=0;x<width;x++){
   5045 DD 34 F4      [23] 1180 	inc	-12 (ix)
   5048 DD 7E F4      [19] 1181 	ld	a,-12 (ix)
   504B D6 14         [ 7] 1182 	sub	a, #0x14
   504D 38 C6         [12] 1183 	jr	C,00120$
                           1184 ;src/draws.h:54: for(y=0;y<height;y++){
   504F DD 7E F6      [19] 1185 	ld	a,-10 (ix)
   5052 C6 14         [ 7] 1186 	add	a, #0x14
   5054 DD 77 F6      [19] 1187 	ld	-10 (ix),a
   5057 DD 7E F7      [19] 1188 	ld	a,-9 (ix)
   505A CE 00         [ 7] 1189 	adc	a, #0x00
   505C DD 77 F7      [19] 1190 	ld	-9 (ix),a
   505F DD 34 F3      [23] 1191 	inc	-13 (ix)
   5062 DD 7E F3      [19] 1192 	ld	a,-13 (ix)
   5065 D6 0C         [ 7] 1193 	sub	a, #0x0C
   5067 38 88         [12] 1194 	jr	C,00144$
                           1195 ;src/draws.h:59: break;
   5069 C3 B7 51      [10] 1196 	jp	00136$
                           1197 ;src/draws.h:60: case 3: 
   506C                    1198 00107$:
                           1199 ;src/draws.h:61: for(y=height-1;y!=0;y--){
   506C DD 36 F5 00   [19] 1200 	ld	-11 (ix),#0x00
   5070 DD 36 F3 0B   [19] 1201 	ld	-13 (ix),#0x0B
   5074 01 00 00      [10] 1202 	ld	bc,#0x0000
   5077 11 DC 00      [10] 1203 	ld	de,#0x00DC
                           1204 ;src/draws.h:62: for(x=0;x<width;x++){
   507A                    1205 00148$:
   507A 21 36 90      [10] 1206 	ld	hl,#_scene
   507D 09            [11] 1207 	add	hl,bc
   507E DD 75 F6      [19] 1208 	ld	-10 (ix),l
   5081 DD 74 F7      [19] 1209 	ld	-9 (ix),h
   5084 21 61 4B      [10] 1210 	ld	hl,#_mapa1
   5087 19            [11] 1211 	add	hl,de
   5088 DD 75 F8      [19] 1212 	ld	-8 (ix),l
   508B DD 74 F9      [19] 1213 	ld	-7 (ix),h
   508E DD 36 F4 00   [19] 1214 	ld	-12 (ix),#0x00
   5092                    1215 00124$:
                           1216 ;src/draws.h:63: scene[aux][x] = mapa1[y][x];
   5092 DD 7E F6      [19] 1217 	ld	a,-10 (ix)
   5095 DD 86 F4      [19] 1218 	add	a, -12 (ix)
   5098 DD 77 FE      [19] 1219 	ld	-2 (ix),a
   509B DD 7E F7      [19] 1220 	ld	a,-9 (ix)
   509E CE 00         [ 7] 1221 	adc	a, #0x00
   50A0 DD 77 FF      [19] 1222 	ld	-1 (ix),a
   50A3 DD 7E F8      [19] 1223 	ld	a,-8 (ix)
   50A6 DD 86 F4      [19] 1224 	add	a, -12 (ix)
   50A9 6F            [ 4] 1225 	ld	l,a
   50AA DD 7E F9      [19] 1226 	ld	a,-7 (ix)
   50AD CE 00         [ 7] 1227 	adc	a, #0x00
   50AF 67            [ 4] 1228 	ld	h,a
   50B0 7E            [ 7] 1229 	ld	a,(hl)
   50B1 DD 6E FE      [19] 1230 	ld	l,-2 (ix)
   50B4 DD 66 FF      [19] 1231 	ld	h,-1 (ix)
   50B7 77            [ 7] 1232 	ld	(hl),a
                           1233 ;src/draws.h:62: for(x=0;x<width;x++){
   50B8 DD 34 F4      [23] 1234 	inc	-12 (ix)
   50BB DD 7E F4      [19] 1235 	ld	a,-12 (ix)
   50BE D6 14         [ 7] 1236 	sub	a, #0x14
   50C0 38 D0         [12] 1237 	jr	C,00124$
                           1238 ;src/draws.h:65: aux++;
   50C2 21 14 00      [10] 1239 	ld	hl,#0x0014
   50C5 09            [11] 1240 	add	hl,bc
   50C6 4D            [ 4] 1241 	ld	c,l
   50C7 44            [ 4] 1242 	ld	b,h
   50C8 DD 34 F5      [23] 1243 	inc	-11 (ix)
                           1244 ;src/draws.h:61: for(y=height-1;y!=0;y--){
   50CB 7B            [ 4] 1245 	ld	a,e
   50CC C6 EC         [ 7] 1246 	add	a,#0xEC
   50CE 5F            [ 4] 1247 	ld	e,a
   50CF 7A            [ 4] 1248 	ld	a,d
   50D0 CE FF         [ 7] 1249 	adc	a,#0xFF
   50D2 57            [ 4] 1250 	ld	d,a
   50D3 DD 35 F3      [23] 1251 	dec	-13 (ix)
   50D6 DD 7E F3      [19] 1252 	ld	a,-13 (ix)
   50D9 B7            [ 4] 1253 	or	a, a
   50DA 20 9E         [12] 1254 	jr	NZ,00148$
                           1255 ;src/draws.h:67: for(x=0;x<width;x++){
   50DC DD 4E F5      [19] 1256 	ld	c,-11 (ix)
   50DF 06 00         [ 7] 1257 	ld	b,#0x00
   50E1 69            [ 4] 1258 	ld	l, c
   50E2 60            [ 4] 1259 	ld	h, b
   50E3 29            [11] 1260 	add	hl, hl
   50E4 29            [11] 1261 	add	hl, hl
   50E5 09            [11] 1262 	add	hl, bc
   50E6 29            [11] 1263 	add	hl, hl
   50E7 29            [11] 1264 	add	hl, hl
   50E8 3E 36         [ 7] 1265 	ld	a,#<(_scene)
   50EA 85            [ 4] 1266 	add	a, l
   50EB 4F            [ 4] 1267 	ld	c,a
   50EC 3E 90         [ 7] 1268 	ld	a,#>(_scene)
   50EE 8C            [ 4] 1269 	adc	a, h
   50EF 47            [ 4] 1270 	ld	b,a
   50F0 1E 00         [ 7] 1271 	ld	e,#0x00
   50F2                    1272 00128$:
                           1273 ;src/draws.h:68: scene[aux][x] = mapa1[0][x];
   50F2 E5            [11] 1274 	push	hl
   50F3 6B            [ 4] 1275 	ld	l,e
   50F4 26 00         [ 7] 1276 	ld	h,#0x00
   50F6 E5            [11] 1277 	push	hl
   50F7 FD E1         [14] 1278 	pop	iy
   50F9 E1            [10] 1279 	pop	hl
   50FA FD 09         [15] 1280 	add	iy, bc
   50FC 21 61 4B      [10] 1281 	ld	hl,#_mapa1
   50FF 16 00         [ 7] 1282 	ld	d,#0x00
   5101 19            [11] 1283 	add	hl, de
   5102 7E            [ 7] 1284 	ld	a,(hl)
   5103 FD 77 00      [19] 1285 	ld	0 (iy), a
                           1286 ;src/draws.h:67: for(x=0;x<width;x++){
   5106 1C            [ 4] 1287 	inc	e
   5107 7B            [ 4] 1288 	ld	a,e
   5108 D6 14         [ 7] 1289 	sub	a, #0x14
   510A 38 E6         [12] 1290 	jr	C,00128$
                           1291 ;src/draws.h:70: break;
   510C C3 B7 51      [10] 1292 	jp	00136$
                           1293 ;src/draws.h:71: case 4:
   510F                    1294 00111$:
                           1295 ;src/draws.h:72: for(y=height-1;y!=0;y--){
   510F DD 36 F5 00   [19] 1296 	ld	-11 (ix),#0x00
   5113 DD 36 F3 0B   [19] 1297 	ld	-13 (ix),#0x0B
   5117 01 00 00      [10] 1298 	ld	bc,#0x0000
   511A 11 DC 00      [10] 1299 	ld	de,#0x00DC
                           1300 ;src/draws.h:73: for(x=0;x<width;x++){
   511D                    1301 00154$:
   511D 21 36 90      [10] 1302 	ld	hl,#_scene
   5120 09            [11] 1303 	add	hl,bc
   5121 DD 75 F6      [19] 1304 	ld	-10 (ix),l
   5124 DD 74 F7      [19] 1305 	ld	-9 (ix),h
   5127 21 51 4C      [10] 1306 	ld	hl,#_mapa2
   512A 19            [11] 1307 	add	hl,de
   512B DD 75 F8      [19] 1308 	ld	-8 (ix),l
   512E DD 74 F9      [19] 1309 	ld	-7 (ix),h
   5131 DD 36 F4 00   [19] 1310 	ld	-12 (ix),#0x00
   5135                    1311 00130$:
                           1312 ;src/draws.h:74: scene[aux][x] = mapa2[y][x];
   5135 DD 7E F6      [19] 1313 	ld	a,-10 (ix)
   5138 DD 86 F4      [19] 1314 	add	a, -12 (ix)
   513B DD 77 FE      [19] 1315 	ld	-2 (ix),a
   513E DD 7E F7      [19] 1316 	ld	a,-9 (ix)
   5141 CE 00         [ 7] 1317 	adc	a, #0x00
   5143 DD 77 FF      [19] 1318 	ld	-1 (ix),a
   5146 DD 7E F8      [19] 1319 	ld	a,-8 (ix)
   5149 DD 86 F4      [19] 1320 	add	a, -12 (ix)
   514C 6F            [ 4] 1321 	ld	l,a
   514D DD 7E F9      [19] 1322 	ld	a,-7 (ix)
   5150 CE 00         [ 7] 1323 	adc	a, #0x00
   5152 67            [ 4] 1324 	ld	h,a
   5153 7E            [ 7] 1325 	ld	a,(hl)
   5154 DD 6E FE      [19] 1326 	ld	l,-2 (ix)
   5157 DD 66 FF      [19] 1327 	ld	h,-1 (ix)
   515A 77            [ 7] 1328 	ld	(hl),a
                           1329 ;src/draws.h:73: for(x=0;x<width;x++){
   515B DD 34 F4      [23] 1330 	inc	-12 (ix)
   515E DD 7E F4      [19] 1331 	ld	a,-12 (ix)
   5161 D6 14         [ 7] 1332 	sub	a, #0x14
   5163 38 D0         [12] 1333 	jr	C,00130$
                           1334 ;src/draws.h:76: aux++;
   5165 21 14 00      [10] 1335 	ld	hl,#0x0014
   5168 09            [11] 1336 	add	hl,bc
   5169 4D            [ 4] 1337 	ld	c,l
   516A 44            [ 4] 1338 	ld	b,h
   516B DD 34 F5      [23] 1339 	inc	-11 (ix)
                           1340 ;src/draws.h:72: for(y=height-1;y!=0;y--){
   516E 7B            [ 4] 1341 	ld	a,e
   516F C6 EC         [ 7] 1342 	add	a,#0xEC
   5171 5F            [ 4] 1343 	ld	e,a
   5172 7A            [ 4] 1344 	ld	a,d
   5173 CE FF         [ 7] 1345 	adc	a,#0xFF
   5175 57            [ 4] 1346 	ld	d,a
   5176 DD 35 F3      [23] 1347 	dec	-13 (ix)
   5179 DD 7E F3      [19] 1348 	ld	a,-13 (ix)
   517C B7            [ 4] 1349 	or	a, a
   517D 20 9E         [12] 1350 	jr	NZ,00154$
                           1351 ;src/draws.h:78: for(x=0;x<width;x++){
   517F DD 4E F5      [19] 1352 	ld	c,-11 (ix)
   5182 06 00         [ 7] 1353 	ld	b,#0x00
   5184 69            [ 4] 1354 	ld	l, c
   5185 60            [ 4] 1355 	ld	h, b
   5186 29            [11] 1356 	add	hl, hl
   5187 29            [11] 1357 	add	hl, hl
   5188 09            [11] 1358 	add	hl, bc
   5189 29            [11] 1359 	add	hl, hl
   518A 29            [11] 1360 	add	hl, hl
   518B 3E 36         [ 7] 1361 	ld	a,#<(_scene)
   518D 85            [ 4] 1362 	add	a, l
   518E 5F            [ 4] 1363 	ld	e,a
   518F 3E 90         [ 7] 1364 	ld	a,#>(_scene)
   5191 8C            [ 4] 1365 	adc	a, h
   5192 57            [ 4] 1366 	ld	d,a
   5193 DD 36 F4 00   [19] 1367 	ld	-12 (ix),#0x00
   5197                    1368 00134$:
                           1369 ;src/draws.h:79: scene[aux][x] = mapa2[0][x];
   5197 7B            [ 4] 1370 	ld	a,e
   5198 DD 86 F4      [19] 1371 	add	a, -12 (ix)
   519B 4F            [ 4] 1372 	ld	c,a
   519C 7A            [ 4] 1373 	ld	a,d
   519D CE 00         [ 7] 1374 	adc	a, #0x00
   519F 47            [ 4] 1375 	ld	b,a
   51A0 3E 51         [ 7] 1376 	ld	a,#<(_mapa2)
   51A2 DD 86 F4      [19] 1377 	add	a, -12 (ix)
   51A5 6F            [ 4] 1378 	ld	l,a
   51A6 3E 4C         [ 7] 1379 	ld	a,#>(_mapa2)
   51A8 CE 00         [ 7] 1380 	adc	a, #0x00
   51AA 67            [ 4] 1381 	ld	h,a
   51AB 7E            [ 7] 1382 	ld	a,(hl)
   51AC 02            [ 7] 1383 	ld	(bc),a
                           1384 ;src/draws.h:78: for(x=0;x<width;x++){
   51AD DD 34 F4      [23] 1385 	inc	-12 (ix)
   51B0 DD 7E F4      [19] 1386 	ld	a,-12 (ix)
   51B3 D6 14         [ 7] 1387 	sub	a, #0x14
   51B5 38 E0         [12] 1388 	jr	C,00134$
                           1389 ;src/draws.h:82: }
   51B7                    1390 00136$:
   51B7 DD F9         [10] 1391 	ld	sp, ix
   51B9 DD E1         [14] 1392 	pop	ix
   51BB C9            [10] 1393 	ret
                           1394 ;src/draws.h:85: void drawMap(u8 t){
                           1395 ;	---------------------------------
                           1396 ; Function drawMap
                           1397 ; ---------------------------------
   51BC                    1398 _drawMap::
   51BC DD E5         [15] 1399 	push	ix
   51BE DD 21 00 00   [14] 1400 	ld	ix,#0
   51C2 DD 39         [15] 1401 	add	ix,sp
   51C4 21 F7 FF      [10] 1402 	ld	hl,#-9
   51C7 39            [11] 1403 	add	hl,sp
   51C8 F9            [ 6] 1404 	ld	sp,hl
                           1405 ;src/draws.h:87: u8 aux = 0;
   51C9 0E 00         [ 7] 1406 	ld	c,#0x00
                           1407 ;src/draws.h:90: mapSelector(t);
   51CB C5            [11] 1408 	push	bc
   51CC DD 7E 04      [19] 1409 	ld	a,4 (ix)
   51CF F5            [11] 1410 	push	af
   51D0 33            [ 6] 1411 	inc	sp
   51D1 CD 25 4F      [17] 1412 	call	_mapSelector
   51D4 33            [ 6] 1413 	inc	sp
   51D5 C1            [10] 1414 	pop	bc
                           1415 ;src/draws.h:92: for(posY=0; posY<height;posY++){
   51D6 DD 36 F7 00   [19] 1416 	ld	-9 (ix),#0x00
   51DA DD 36 FC 00   [19] 1417 	ld	-4 (ix),#0x00
   51DE DD 36 FD 00   [19] 1418 	ld	-3 (ix),#0x00
   51E2 11 00 00      [10] 1419 	ld	de,#0x0000
                           1420 ;src/draws.h:93: for(posX=0; posX<width;posX++){
   51E5                    1421 00119$:
   51E5 DD 7E F7      [19] 1422 	ld	a,-9 (ix)
   51E8 07            [ 4] 1423 	rlca
   51E9 07            [ 4] 1424 	rlca
   51EA 07            [ 4] 1425 	rlca
   51EB 07            [ 4] 1426 	rlca
   51EC E6 F0         [ 7] 1427 	and	a,#0xF0
   51EE DD 77 FE      [19] 1428 	ld	-2 (ix),a
   51F1 21 36 90      [10] 1429 	ld	hl,#_scene
   51F4 19            [11] 1430 	add	hl,de
   51F5 DD 75 F8      [19] 1431 	ld	-8 (ix),l
   51F8 DD 74 F9      [19] 1432 	ld	-7 (ix),h
   51FB 06 00         [ 7] 1433 	ld	b,#0x00
   51FD                    1434 00110$:
                           1435 ;src/draws.h:94: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   51FD 78            [ 4] 1436 	ld	a,b
   51FE 87            [ 4] 1437 	add	a, a
   51FF 87            [ 4] 1438 	add	a, a
   5200 DD 77 FF      [19] 1439 	ld	-1 (ix),a
   5203 C5            [11] 1440 	push	bc
   5204 D5            [11] 1441 	push	de
   5205 DD 66 FE      [19] 1442 	ld	h,-2 (ix)
   5208 DD 6E FF      [19] 1443 	ld	l,-1 (ix)
   520B E5            [11] 1444 	push	hl
   520C 21 00 C0      [10] 1445 	ld	hl,#0xC000
   520F E5            [11] 1446 	push	hl
   5210 CD 40 8F      [17] 1447 	call	_cpct_getScreenPtr
   5213 D1            [10] 1448 	pop	de
   5214 C1            [10] 1449 	pop	bc
   5215 E5            [11] 1450 	push	hl
   5216 FD E1         [14] 1451 	pop	iy
                           1452 ;src/draws.h:95: if(scene[posY][posX] == 1){
   5218 DD 7E F8      [19] 1453 	ld	a,-8 (ix)
   521B 80            [ 4] 1454 	add	a, b
   521C 6F            [ 4] 1455 	ld	l,a
   521D DD 7E F9      [19] 1456 	ld	a,-7 (ix)
   5220 CE 00         [ 7] 1457 	adc	a, #0x00
   5222 67            [ 4] 1458 	ld	h,a
   5223 66            [ 7] 1459 	ld	h,(hl)
                           1460 ;src/draws.h:96: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   5224 FD E5         [15] 1461 	push	iy
   5226 F1            [10] 1462 	pop	af
   5227 DD 77 FB      [19] 1463 	ld	-5 (ix),a
   522A FD E5         [15] 1464 	push	iy
   522C 3B            [ 6] 1465 	dec	sp
   522D F1            [10] 1466 	pop	af
   522E 33            [ 6] 1467 	inc	sp
   522F DD 77 FA      [19] 1468 	ld	-6 (ix),a
                           1469 ;src/draws.h:95: if(scene[posY][posX] == 1){
   5232 25            [ 4] 1470 	dec	h
   5233 20 16         [12] 1471 	jr	NZ,00102$
                           1472 ;src/draws.h:96: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   5235 C5            [11] 1473 	push	bc
   5236 D5            [11] 1474 	push	de
   5237 21 04 10      [10] 1475 	ld	hl,#0x1004
   523A E5            [11] 1476 	push	hl
   523B DD 6E FA      [19] 1477 	ld	l,-6 (ix)
   523E DD 66 FB      [19] 1478 	ld	h,-5 (ix)
   5241 E5            [11] 1479 	push	hl
   5242 21 DE 75      [10] 1480 	ld	hl,#_muro
   5245 E5            [11] 1481 	push	hl
   5246 CD 83 8C      [17] 1482 	call	_cpct_drawSprite
   5249 D1            [10] 1483 	pop	de
   524A C1            [10] 1484 	pop	bc
   524B                    1485 00102$:
                           1486 ;src/draws.h:98: if(scene[posY][posX] == 9){
   524B 3E 36         [ 7] 1487 	ld	a,#<(_scene)
   524D DD 86 FC      [19] 1488 	add	a, -4 (ix)
   5250 6F            [ 4] 1489 	ld	l,a
   5251 3E 90         [ 7] 1490 	ld	a,#>(_scene)
   5253 DD 8E FD      [19] 1491 	adc	a, -3 (ix)
   5256 67            [ 4] 1492 	ld	h,a
   5257 7D            [ 4] 1493 	ld	a,l
   5258 80            [ 4] 1494 	add	a, b
   5259 6F            [ 4] 1495 	ld	l,a
   525A 7C            [ 4] 1496 	ld	a,h
   525B CE 00         [ 7] 1497 	adc	a, #0x00
   525D 67            [ 4] 1498 	ld	h,a
   525E 7E            [ 7] 1499 	ld	a,(hl)
                           1500 ;src/draws.h:99: if(aux == 0){
   525F D6 09         [ 7] 1501 	sub	a,#0x09
   5261 20 32         [12] 1502 	jr	NZ,00111$
   5263 B1            [ 4] 1503 	or	a,c
   5264 20 19         [12] 1504 	jr	NZ,00104$
                           1505 ;src/draws.h:100: cpct_drawSprite(g_tile_puerta_0,memptr,tilewidth, tileheight);
   5266 C5            [11] 1506 	push	bc
   5267 D5            [11] 1507 	push	de
   5268 21 04 10      [10] 1508 	ld	hl,#0x1004
   526B E5            [11] 1509 	push	hl
   526C DD 6E FA      [19] 1510 	ld	l,-6 (ix)
   526F DD 66 FB      [19] 1511 	ld	h,-5 (ix)
   5272 E5            [11] 1512 	push	hl
   5273 21 00 44      [10] 1513 	ld	hl,#_g_tile_puerta_0
   5276 E5            [11] 1514 	push	hl
   5277 CD 83 8C      [17] 1515 	call	_cpct_drawSprite
   527A D1            [10] 1516 	pop	de
   527B C1            [10] 1517 	pop	bc
                           1518 ;src/draws.h:101: aux += 1;
   527C 0C            [ 4] 1519 	inc	c
   527D 18 16         [12] 1520 	jr	00111$
   527F                    1521 00104$:
                           1522 ;src/draws.h:103: else cpct_drawSprite(g_tile_puerta_1,memptr,tilewidth, tileheight);
   527F C5            [11] 1523 	push	bc
   5280 D5            [11] 1524 	push	de
   5281 21 04 10      [10] 1525 	ld	hl,#0x1004
   5284 E5            [11] 1526 	push	hl
   5285 DD 6E FA      [19] 1527 	ld	l,-6 (ix)
   5288 DD 66 FB      [19] 1528 	ld	h,-5 (ix)
   528B E5            [11] 1529 	push	hl
   528C 21 40 44      [10] 1530 	ld	hl,#_g_tile_puerta_1
   528F E5            [11] 1531 	push	hl
   5290 CD 83 8C      [17] 1532 	call	_cpct_drawSprite
   5293 D1            [10] 1533 	pop	de
   5294 C1            [10] 1534 	pop	bc
   5295                    1535 00111$:
                           1536 ;src/draws.h:93: for(posX=0; posX<width;posX++){
   5295 04            [ 4] 1537 	inc	b
   5296 78            [ 4] 1538 	ld	a,b
   5297 D6 14         [ 7] 1539 	sub	a, #0x14
   5299 DA FD 51      [10] 1540 	jp	C,00110$
                           1541 ;src/draws.h:92: for(posY=0; posY<height;posY++){
   529C DD 7E FC      [19] 1542 	ld	a,-4 (ix)
   529F C6 14         [ 7] 1543 	add	a, #0x14
   52A1 DD 77 FC      [19] 1544 	ld	-4 (ix),a
   52A4 DD 7E FD      [19] 1545 	ld	a,-3 (ix)
   52A7 CE 00         [ 7] 1546 	adc	a, #0x00
   52A9 DD 77 FD      [19] 1547 	ld	-3 (ix),a
   52AC 21 14 00      [10] 1548 	ld	hl,#0x0014
   52AF 19            [11] 1549 	add	hl,de
   52B0 EB            [ 4] 1550 	ex	de,hl
   52B1 DD 34 F7      [23] 1551 	inc	-9 (ix)
   52B4 DD 7E F7      [19] 1552 	ld	a,-9 (ix)
   52B7 D6 0C         [ 7] 1553 	sub	a, #0x0C
   52B9 DA E5 51      [10] 1554 	jp	C,00119$
   52BC DD F9         [10] 1555 	ld	sp, ix
   52BE DD E1         [14] 1556 	pop	ix
   52C0 C9            [10] 1557 	ret
                           1558 ;src/draws.h:110: void drawVida(u8 life,u8 pos,u8 lim){
                           1559 ;	---------------------------------
                           1560 ; Function drawVida
                           1561 ; ---------------------------------
   52C1                    1562 _drawVida::
   52C1 DD E5         [15] 1563 	push	ix
   52C3 DD 21 00 00   [14] 1564 	ld	ix,#0
   52C7 DD 39         [15] 1565 	add	ix,sp
                           1566 ;src/draws.h:113: u8 p = pos;
   52C9 DD 56 05      [19] 1567 	ld	d,5 (ix)
                           1568 ;src/draws.h:115: for(i=1;i<=5;i++){
   52CC 1E 01         [ 7] 1569 	ld	e,#0x01
   52CE                    1570 00107$:
                           1571 ;src/draws.h:116: memptr = cpct_getScreenPtr(VMEM,p,192);
   52CE D5            [11] 1572 	push	de
   52CF 3E C0         [ 7] 1573 	ld	a,#0xC0
   52D1 F5            [11] 1574 	push	af
   52D2 33            [ 6] 1575 	inc	sp
   52D3 D5            [11] 1576 	push	de
   52D4 33            [ 6] 1577 	inc	sp
   52D5 21 00 C0      [10] 1578 	ld	hl,#0xC000
   52D8 E5            [11] 1579 	push	hl
   52D9 CD 40 8F      [17] 1580 	call	_cpct_getScreenPtr
   52DC D1            [10] 1581 	pop	de
                           1582 ;src/draws.h:117: p+=5;
   52DD 7A            [ 4] 1583 	ld	a,d
   52DE C6 05         [ 7] 1584 	add	a, #0x05
   52E0 57            [ 4] 1585 	ld	d,a
                           1586 ;src/draws.h:118: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   52E1 4D            [ 4] 1587 	ld	c, l
   52E2 44            [ 4] 1588 	ld	b, h
   52E3 DD 7E 04      [19] 1589 	ld	a,4 (ix)
   52E6 93            [ 4] 1590 	sub	a, e
   52E7 38 10         [12] 1591 	jr	C,00104$
   52E9 D5            [11] 1592 	push	de
   52EA 21 04 08      [10] 1593 	ld	hl,#0x0804
   52ED E5            [11] 1594 	push	hl
   52EE C5            [11] 1595 	push	bc
   52EF 21 48 4A      [10] 1596 	ld	hl,#_corazon_lleno
   52F2 E5            [11] 1597 	push	hl
   52F3 CD E9 8D      [17] 1598 	call	_cpct_drawSpriteMasked
   52F6 D1            [10] 1599 	pop	de
   52F7 18 26         [12] 1600 	jr	00108$
   52F9                    1601 00104$:
                           1602 ;src/draws.h:120: if(i<=lim){
   52F9 DD 7E 06      [19] 1603 	ld	a,6 (ix)
   52FC 93            [ 4] 1604 	sub	a, e
   52FD 38 20         [12] 1605 	jr	C,00108$
                           1606 ;src/draws.h:121: cpct_drawSolidBox(memptr,0,4,8);
   52FF C5            [11] 1607 	push	bc
   5300 D5            [11] 1608 	push	de
   5301 21 04 08      [10] 1609 	ld	hl,#0x0804
   5304 E5            [11] 1610 	push	hl
   5305 AF            [ 4] 1611 	xor	a, a
   5306 F5            [11] 1612 	push	af
   5307 33            [ 6] 1613 	inc	sp
   5308 C5            [11] 1614 	push	bc
   5309 CD 6F 8E      [17] 1615 	call	_cpct_drawSolidBox
   530C F1            [10] 1616 	pop	af
   530D F1            [10] 1617 	pop	af
   530E 33            [ 6] 1618 	inc	sp
   530F D1            [10] 1619 	pop	de
   5310 C1            [10] 1620 	pop	bc
                           1621 ;src/draws.h:122: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   5311 D5            [11] 1622 	push	de
   5312 21 04 08      [10] 1623 	ld	hl,#0x0804
   5315 E5            [11] 1624 	push	hl
   5316 C5            [11] 1625 	push	bc
   5317 21 88 4A      [10] 1626 	ld	hl,#_corazon_roto
   531A E5            [11] 1627 	push	hl
   531B CD E9 8D      [17] 1628 	call	_cpct_drawSpriteMasked
   531E D1            [10] 1629 	pop	de
   531F                    1630 00108$:
                           1631 ;src/draws.h:115: for(i=1;i<=5;i++){
   531F 1C            [ 4] 1632 	inc	e
   5320 3E 05         [ 7] 1633 	ld	a,#0x05
   5322 93            [ 4] 1634 	sub	a, e
   5323 30 A9         [12] 1635 	jr	NC,00107$
   5325 DD E1         [14] 1636 	pop	ix
   5327 C9            [10] 1637 	ret
                           1638 ;src/draws.h:129: void drawBullets(u8 bullet,u8 pos){
                           1639 ;	---------------------------------
                           1640 ; Function drawBullets
                           1641 ; ---------------------------------
   5328                    1642 _drawBullets::
   5328 DD E5         [15] 1643 	push	ix
   532A DD 21 00 00   [14] 1644 	ld	ix,#0
   532E DD 39         [15] 1645 	add	ix,sp
   5330 3B            [ 6] 1646 	dec	sp
                           1647 ;src/draws.h:131: int p = pos;
   5331 DD 4E 05      [19] 1648 	ld	c,5 (ix)
   5334 06 00         [ 7] 1649 	ld	b,#0x00
                           1650 ;src/draws.h:133: for(i=1;i<=3;i++){
   5336 DD 36 FF 01   [19] 1651 	ld	-1 (ix),#0x01
   533A                    1652 00105$:
                           1653 ;src/draws.h:134: memptr = cpct_getScreenPtr(VMEM,p,192);
   533A 51            [ 4] 1654 	ld	d,c
   533B C5            [11] 1655 	push	bc
   533C 3E C0         [ 7] 1656 	ld	a,#0xC0
   533E F5            [11] 1657 	push	af
   533F 33            [ 6] 1658 	inc	sp
   5340 D5            [11] 1659 	push	de
   5341 33            [ 6] 1660 	inc	sp
   5342 21 00 C0      [10] 1661 	ld	hl,#0xC000
   5345 E5            [11] 1662 	push	hl
   5346 CD 40 8F      [17] 1663 	call	_cpct_getScreenPtr
   5349 C1            [10] 1664 	pop	bc
                           1665 ;src/draws.h:135: p+=3;
   534A 03            [ 6] 1666 	inc	bc
   534B 03            [ 6] 1667 	inc	bc
   534C 03            [ 6] 1668 	inc	bc
                           1669 ;src/draws.h:136: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   534D EB            [ 4] 1670 	ex	de,hl
   534E DD 7E 04      [19] 1671 	ld	a,4 (ix)
   5351 DD 96 FF      [19] 1672 	sub	a, -1 (ix)
   5354 38 10         [12] 1673 	jr	C,00102$
   5356 C5            [11] 1674 	push	bc
   5357 21 02 08      [10] 1675 	ld	hl,#0x0802
   535A E5            [11] 1676 	push	hl
   535B D5            [11] 1677 	push	de
   535C 21 1E 76      [10] 1678 	ld	hl,#_flecha_arriba
   535F E5            [11] 1679 	push	hl
   5360 CD E9 8D      [17] 1680 	call	_cpct_drawSpriteMasked
   5363 C1            [10] 1681 	pop	bc
   5364 18 10         [12] 1682 	jr	00106$
   5366                    1683 00102$:
                           1684 ;src/draws.h:137: else  cpct_drawSolidBox(memptr,0,2,8);
   5366 C5            [11] 1685 	push	bc
   5367 21 02 08      [10] 1686 	ld	hl,#0x0802
   536A E5            [11] 1687 	push	hl
   536B AF            [ 4] 1688 	xor	a, a
   536C F5            [11] 1689 	push	af
   536D 33            [ 6] 1690 	inc	sp
   536E D5            [11] 1691 	push	de
   536F CD 6F 8E      [17] 1692 	call	_cpct_drawSolidBox
   5372 F1            [10] 1693 	pop	af
   5373 F1            [10] 1694 	pop	af
   5374 33            [ 6] 1695 	inc	sp
   5375 C1            [10] 1696 	pop	bc
   5376                    1697 00106$:
                           1698 ;src/draws.h:133: for(i=1;i<=3;i++){
   5376 DD 34 FF      [23] 1699 	inc	-1 (ix)
   5379 3E 03         [ 7] 1700 	ld	a,#0x03
   537B DD 96 FF      [19] 1701 	sub	a, -1 (ix)
   537E 30 BA         [12] 1702 	jr	NC,00105$
   5380 33            [ 6] 1703 	inc	sp
   5381 DD E1         [14] 1704 	pop	ix
   5383 C9            [10] 1705 	ret
                           1706 ;src/draws.h:145: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1707 ;	---------------------------------
                           1708 ; Function draw
                           1709 ; ---------------------------------
   5384                    1710 _draw::
                           1711 ;src/draws.h:147: memptr = cpct_getScreenPtr(VMEM,x,y);
   5384 21 03 00      [10] 1712 	ld	hl, #3+0
   5387 39            [11] 1713 	add	hl, sp
   5388 7E            [ 7] 1714 	ld	a, (hl)
   5389 F5            [11] 1715 	push	af
   538A 33            [ 6] 1716 	inc	sp
   538B 21 03 00      [10] 1717 	ld	hl, #3+0
   538E 39            [11] 1718 	add	hl, sp
   538F 7E            [ 7] 1719 	ld	a, (hl)
   5390 F5            [11] 1720 	push	af
   5391 33            [ 6] 1721 	inc	sp
   5392 21 00 C0      [10] 1722 	ld	hl,#0xC000
   5395 E5            [11] 1723 	push	hl
   5396 CD 40 8F      [17] 1724 	call	_cpct_getScreenPtr
   5399 EB            [ 4] 1725 	ex	de,hl
                           1726 ;src/draws.h:148: switch(mode){
   539A 3E 02         [ 7] 1727 	ld	a,#0x02
   539C FD 21 06 00   [14] 1728 	ld	iy,#6
   53A0 FD 39         [15] 1729 	add	iy,sp
   53A2 FD 96 00      [19] 1730 	sub	a, 0 (iy)
   53A5 D8            [11] 1731 	ret	C
                           1732 ;src/draws.h:150: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   53A6 21 04 00      [10] 1733 	ld	hl, #4
   53A9 39            [11] 1734 	add	hl, sp
   53AA 4E            [ 7] 1735 	ld	c, (hl)
   53AB 23            [ 6] 1736 	inc	hl
   53AC 46            [ 7] 1737 	ld	b, (hl)
                           1738 ;src/draws.h:148: switch(mode){
   53AD D5            [11] 1739 	push	de
   53AE FD 21 08 00   [14] 1740 	ld	iy,#8
   53B2 FD 39         [15] 1741 	add	iy,sp
   53B4 FD 5E 00      [19] 1742 	ld	e,0 (iy)
   53B7 16 00         [ 7] 1743 	ld	d,#0x00
   53B9 21 C0 53      [10] 1744 	ld	hl,#00111$
   53BC 19            [11] 1745 	add	hl,de
   53BD 19            [11] 1746 	add	hl,de
                           1747 ;src/draws.h:149: case 0:
   53BE D1            [10] 1748 	pop	de
   53BF E9            [ 4] 1749 	jp	(hl)
   53C0                    1750 00111$:
   53C0 18 04         [12] 1751 	jr	00101$
   53C2 18 0C         [12] 1752 	jr	00102$
   53C4 18 14         [12] 1753 	jr	00103$
   53C6                    1754 00101$:
                           1755 ;src/draws.h:150: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   53C6 21 04 10      [10] 1756 	ld	hl,#0x1004
   53C9 E5            [11] 1757 	push	hl
   53CA D5            [11] 1758 	push	de
   53CB C5            [11] 1759 	push	bc
   53CC CD E9 8D      [17] 1760 	call	_cpct_drawSpriteMasked
                           1761 ;src/draws.h:151: break;
   53CF C9            [10] 1762 	ret
                           1763 ;src/draws.h:152: case 1:
   53D0                    1764 00102$:
                           1765 ;src/draws.h:153: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   53D0 21 02 08      [10] 1766 	ld	hl,#0x0802
   53D3 E5            [11] 1767 	push	hl
   53D4 D5            [11] 1768 	push	de
   53D5 C5            [11] 1769 	push	bc
   53D6 CD E9 8D      [17] 1770 	call	_cpct_drawSpriteMasked
                           1771 ;src/draws.h:154: break;
   53D9 C9            [10] 1772 	ret
                           1773 ;src/draws.h:155: case 2:
   53DA                    1774 00103$:
                           1775 ;src/draws.h:156: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   53DA 21 04 04      [10] 1776 	ld	hl,#0x0404
   53DD E5            [11] 1777 	push	hl
   53DE D5            [11] 1778 	push	de
   53DF C5            [11] 1779 	push	bc
   53E0 CD E9 8D      [17] 1780 	call	_cpct_drawSpriteMasked
                           1781 ;src/draws.h:158: }
   53E3 C9            [10] 1782 	ret
                           1783 ;src/draws.h:162: void erase(u8 x,u8 y,u8 mode){
                           1784 ;	---------------------------------
                           1785 ; Function erase
                           1786 ; ---------------------------------
   53E4                    1787 _erase::
                           1788 ;src/draws.h:165: memptr = cpct_getScreenPtr(VMEM,x,y);
   53E4 21 03 00      [10] 1789 	ld	hl, #3+0
   53E7 39            [11] 1790 	add	hl, sp
   53E8 7E            [ 7] 1791 	ld	a, (hl)
   53E9 F5            [11] 1792 	push	af
   53EA 33            [ 6] 1793 	inc	sp
   53EB 21 03 00      [10] 1794 	ld	hl, #3+0
   53EE 39            [11] 1795 	add	hl, sp
   53EF 7E            [ 7] 1796 	ld	a, (hl)
   53F0 F5            [11] 1797 	push	af
   53F1 33            [ 6] 1798 	inc	sp
   53F2 21 00 C0      [10] 1799 	ld	hl,#0xC000
   53F5 E5            [11] 1800 	push	hl
   53F6 CD 40 8F      [17] 1801 	call	_cpct_getScreenPtr
   53F9 4D            [ 4] 1802 	ld	c, l
   53FA 44            [ 4] 1803 	ld	b, h
                           1804 ;src/draws.h:166: switch(mode){
   53FB 3E 02         [ 7] 1805 	ld	a,#0x02
   53FD FD 21 04 00   [14] 1806 	ld	iy,#4
   5401 FD 39         [15] 1807 	add	iy,sp
   5403 FD 96 00      [19] 1808 	sub	a, 0 (iy)
   5406 D8            [11] 1809 	ret	C
                           1810 ;src/draws.h:168: cpct_drawSolidBox(memptr,0,4,16);
                           1811 ;src/draws.h:166: switch(mode){
   5407 FD 5E 00      [19] 1812 	ld	e,0 (iy)
   540A 16 00         [ 7] 1813 	ld	d,#0x00
   540C 21 12 54      [10] 1814 	ld	hl,#00111$
   540F 19            [11] 1815 	add	hl,de
   5410 19            [11] 1816 	add	hl,de
                           1817 ;src/draws.h:167: case 0:
   5411 E9            [ 4] 1818 	jp	(hl)
   5412                    1819 00111$:
   5412 18 04         [12] 1820 	jr	00101$
   5414 18 11         [12] 1821 	jr	00102$
   5416 18 1E         [12] 1822 	jr	00103$
   5418                    1823 00101$:
                           1824 ;src/draws.h:168: cpct_drawSolidBox(memptr,0,4,16);
   5418 21 04 10      [10] 1825 	ld	hl,#0x1004
   541B E5            [11] 1826 	push	hl
   541C AF            [ 4] 1827 	xor	a, a
   541D F5            [11] 1828 	push	af
   541E 33            [ 6] 1829 	inc	sp
   541F C5            [11] 1830 	push	bc
   5420 CD 6F 8E      [17] 1831 	call	_cpct_drawSolidBox
   5423 F1            [10] 1832 	pop	af
   5424 F1            [10] 1833 	pop	af
   5425 33            [ 6] 1834 	inc	sp
                           1835 ;src/draws.h:169: break;
   5426 C9            [10] 1836 	ret
                           1837 ;src/draws.h:170: case 1:
   5427                    1838 00102$:
                           1839 ;src/draws.h:171: cpct_drawSolidBox(memptr,0,2,8);
   5427 21 02 08      [10] 1840 	ld	hl,#0x0802
   542A E5            [11] 1841 	push	hl
   542B AF            [ 4] 1842 	xor	a, a
   542C F5            [11] 1843 	push	af
   542D 33            [ 6] 1844 	inc	sp
   542E C5            [11] 1845 	push	bc
   542F CD 6F 8E      [17] 1846 	call	_cpct_drawSolidBox
   5432 F1            [10] 1847 	pop	af
   5433 F1            [10] 1848 	pop	af
   5434 33            [ 6] 1849 	inc	sp
                           1850 ;src/draws.h:172: break;
   5435 C9            [10] 1851 	ret
                           1852 ;src/draws.h:173: case 2:
   5436                    1853 00103$:
                           1854 ;src/draws.h:174: cpct_drawSolidBox(memptr,0,4,4);
   5436 21 04 04      [10] 1855 	ld	hl,#0x0404
   5439 E5            [11] 1856 	push	hl
   543A AF            [ 4] 1857 	xor	a, a
   543B F5            [11] 1858 	push	af
   543C 33            [ 6] 1859 	inc	sp
   543D C5            [11] 1860 	push	bc
   543E CD 6F 8E      [17] 1861 	call	_cpct_drawSolidBox
   5441 F1            [10] 1862 	pop	af
   5442 F1            [10] 1863 	pop	af
   5443 33            [ 6] 1864 	inc	sp
                           1865 ;src/draws.h:176: }
   5444 C9            [10] 1866 	ret
                           1867 ;src/draws.h:179: void drawStats(){
                           1868 ;	---------------------------------
                           1869 ; Function drawStats
                           1870 ; ---------------------------------
   5445                    1871 _drawStats::
                           1872 ;src/draws.h:180: drawVida(player.life,1,3);
   5445 21 42 91      [10] 1873 	ld	hl, #_player + 6
   5448 56            [ 7] 1874 	ld	d,(hl)
   5449 21 01 03      [10] 1875 	ld	hl,#0x0301
   544C E5            [11] 1876 	push	hl
   544D D5            [11] 1877 	push	de
   544E 33            [ 6] 1878 	inc	sp
   544F CD C1 52      [17] 1879 	call	_drawVida
   5452 F1            [10] 1880 	pop	af
   5453 33            [ 6] 1881 	inc	sp
                           1882 ;src/draws.h:181: drawBullets(player.bullets,16);
   5454 21 46 91      [10] 1883 	ld	hl, #_player + 10
   5457 56            [ 7] 1884 	ld	d,(hl)
   5458 3E 10         [ 7] 1885 	ld	a,#0x10
   545A F5            [11] 1886 	push	af
   545B 33            [ 6] 1887 	inc	sp
   545C D5            [11] 1888 	push	de
   545D 33            [ 6] 1889 	inc	sp
   545E CD 28 53      [17] 1890 	call	_drawBullets
   5461 F1            [10] 1891 	pop	af
                           1892 ;src/draws.h:182: drawVida(enemy.life,enemy.lp,map);
   5462 21 55 91      [10] 1893 	ld	hl, #_enemy + 14
   5465 56            [ 7] 1894 	ld	d,(hl)
   5466 21 4F 91      [10] 1895 	ld	hl, #_enemy + 8
   5469 46            [ 7] 1896 	ld	b,(hl)
   546A 3A 27 91      [13] 1897 	ld	a,(_map)
   546D F5            [11] 1898 	push	af
   546E 33            [ 6] 1899 	inc	sp
   546F D5            [11] 1900 	push	de
   5470 33            [ 6] 1901 	inc	sp
   5471 C5            [11] 1902 	push	bc
   5472 33            [ 6] 1903 	inc	sp
   5473 CD C1 52      [17] 1904 	call	_drawVida
   5476 F1            [10] 1905 	pop	af
   5477 33            [ 6] 1906 	inc	sp
   5478 C9            [10] 1907 	ret
                           1908 ;src/draws.h:187: void draws(){
                           1909 ;	---------------------------------
                           1910 ; Function draws
                           1911 ; ---------------------------------
   5479                    1912 _draws::
   5479 DD E5         [15] 1913 	push	ix
   547B DD 21 00 00   [14] 1914 	ld	ix,#0
   547F DD 39         [15] 1915 	add	ix,sp
   5481 3B            [ 6] 1916 	dec	sp
                           1917 ;src/draws.h:189: if(temp%2 == 0)
   5482 FD 21 26 91   [14] 1918 	ld	iy,#_temp
   5486 FD CB 00 46   [20] 1919 	bit	0, 0 (iy)
   548A 20 17         [12] 1920 	jr	NZ,00102$
                           1921 ;src/draws.h:190: draw(player.x,player.y,player.sprite,0);
   548C ED 5B 40 91   [20] 1922 	ld	de, (#_player + 4)
   5490 21 3D 91      [10] 1923 	ld	hl, #_player + 1
   5493 46            [ 7] 1924 	ld	b,(hl)
   5494 21 3C 91      [10] 1925 	ld	hl, #_player + 0
   5497 4E            [ 7] 1926 	ld	c,(hl)
   5498 AF            [ 4] 1927 	xor	a, a
   5499 F5            [11] 1928 	push	af
   549A 33            [ 6] 1929 	inc	sp
   549B D5            [11] 1930 	push	de
   549C C5            [11] 1931 	push	bc
   549D CD 84 53      [17] 1932 	call	_draw
   54A0 F1            [10] 1933 	pop	af
   54A1 F1            [10] 1934 	pop	af
   54A2 33            [ 6] 1935 	inc	sp
   54A3                    1936 00102$:
                           1937 ;src/draws.h:191: if(enemy.life > 0 && temp%2 == 1)
   54A3 11 47 91      [10] 1938 	ld	de,#_enemy+0
   54A6 3A 4F 91      [13] 1939 	ld	a, (#_enemy + 8)
   54A9 B7            [ 4] 1940 	or	a, a
   54AA 28 23         [12] 1941 	jr	Z,00104$
   54AC 3A 26 91      [13] 1942 	ld	a,(#_temp + 0)
   54AF E6 01         [ 7] 1943 	and	a, #0x01
   54B1 3D            [ 4] 1944 	dec	a
   54B2 20 1B         [12] 1945 	jr	NZ,00104$
                           1946 ;src/draws.h:192: draw(enemy.x,enemy.y,enemy.sprite,0);
   54B4 ED 4B 4D 91   [20] 1947 	ld	bc, (#_enemy + 6)
   54B8 6B            [ 4] 1948 	ld	l, e
   54B9 62            [ 4] 1949 	ld	h, d
   54BA 23            [ 6] 1950 	inc	hl
   54BB 7E            [ 7] 1951 	ld	a,(hl)
   54BC DD 77 FF      [19] 1952 	ld	-1 (ix),a
   54BF 1A            [ 7] 1953 	ld	a,(de)
   54C0 5F            [ 4] 1954 	ld	e,a
   54C1 AF            [ 4] 1955 	xor	a, a
   54C2 F5            [11] 1956 	push	af
   54C3 33            [ 6] 1957 	inc	sp
   54C4 C5            [11] 1958 	push	bc
   54C5 DD 56 FF      [19] 1959 	ld	d, -1 (ix)
   54C8 D5            [11] 1960 	push	de
   54C9 CD 84 53      [17] 1961 	call	_draw
   54CC F1            [10] 1962 	pop	af
   54CD F1            [10] 1963 	pop	af
   54CE 33            [ 6] 1964 	inc	sp
   54CF                    1965 00104$:
                           1966 ;src/draws.h:193: if(arrow == 1){
   54CF 3A 2A 91      [13] 1967 	ld	a,(#_arrow + 0)
   54D2 3D            [ 4] 1968 	dec	a
   54D3 20 5C         [12] 1969 	jr	NZ,00116$
                           1970 ;src/draws.h:194: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   54D5 21 39 91      [10] 1971 	ld	hl, #_object + 7
   54D8 5E            [ 7] 1972 	ld	e,(hl)
                           1973 ;src/draws.h:195: draw(object.x,object.y,object.sprite,2);
   54D9 01 33 91      [10] 1974 	ld	bc,#_object + 1
                           1975 ;src/draws.h:194: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   54DC 7B            [ 4] 1976 	ld	a,e
   54DD D6 04         [ 7] 1977 	sub	a, #0x04
   54DF 28 0C         [12] 1978 	jr	Z,00110$
   54E1 21 38 91      [10] 1979 	ld	hl,#_object + 6
   54E4 7B            [ 4] 1980 	ld	a,e
   54E5 D6 06         [ 7] 1981 	sub	a, #0x06
   54E7 20 25         [12] 1982 	jr	NZ,00111$
   54E9 7E            [ 7] 1983 	ld	a,(hl)
   54EA 3D            [ 4] 1984 	dec	a
   54EB 20 21         [12] 1985 	jr	NZ,00111$
   54ED                    1986 00110$:
                           1987 ;src/draws.h:195: draw(object.x,object.y,object.sprite,2);
   54ED ED 5B 36 91   [20] 1988 	ld	de, (#(_object + 0x0004) + 0)
   54F1 0A            [ 7] 1989 	ld	a,(bc)
   54F2 DD 77 FF      [19] 1990 	ld	-1 (ix),a
   54F5 21 32 91      [10] 1991 	ld	hl, #_object + 0
   54F8 4E            [ 7] 1992 	ld	c,(hl)
   54F9 3E 02         [ 7] 1993 	ld	a,#0x02
   54FB F5            [11] 1994 	push	af
   54FC 33            [ 6] 1995 	inc	sp
   54FD D5            [11] 1996 	push	de
   54FE DD 7E FF      [19] 1997 	ld	a,-1 (ix)
   5501 F5            [11] 1998 	push	af
   5502 33            [ 6] 1999 	inc	sp
   5503 79            [ 4] 2000 	ld	a,c
   5504 F5            [11] 2001 	push	af
   5505 33            [ 6] 2002 	inc	sp
   5506 CD 84 53      [17] 2003 	call	_draw
   5509 F1            [10] 2004 	pop	af
   550A F1            [10] 2005 	pop	af
   550B 33            [ 6] 2006 	inc	sp
   550C 18 23         [12] 2007 	jr	00116$
   550E                    2008 00111$:
                           2009 ;src/draws.h:196: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   550E 7B            [ 4] 2010 	ld	a,e
   550F FE 02         [ 7] 2011 	cp	a,#0x02
   5511 28 08         [12] 2012 	jr	Z,00106$
   5513 D6 08         [ 7] 2013 	sub	a, #0x08
   5515 20 1A         [12] 2014 	jr	NZ,00116$
   5517 7E            [ 7] 2015 	ld	a,(hl)
   5518 3D            [ 4] 2016 	dec	a
   5519 20 16         [12] 2017 	jr	NZ,00116$
   551B                    2018 00106$:
                           2019 ;src/draws.h:197: draw(object.x,object.y,object.sprite,1);
   551B ED 5B 36 91   [20] 2020 	ld	de, (#(_object + 0x0004) + 0)
   551F 0A            [ 7] 2021 	ld	a,(bc)
   5520 47            [ 4] 2022 	ld	b,a
   5521 21 32 91      [10] 2023 	ld	hl, #_object + 0
   5524 4E            [ 7] 2024 	ld	c,(hl)
   5525 3E 01         [ 7] 2025 	ld	a,#0x01
   5527 F5            [11] 2026 	push	af
   5528 33            [ 6] 2027 	inc	sp
   5529 D5            [11] 2028 	push	de
   552A C5            [11] 2029 	push	bc
   552B CD 84 53      [17] 2030 	call	_draw
   552E F1            [10] 2031 	pop	af
   552F F1            [10] 2032 	pop	af
   5530 33            [ 6] 2033 	inc	sp
   5531                    2034 00116$:
                           2035 ;src/draws.h:199: drawStats();
   5531 CD 45 54      [17] 2036 	call	_drawStats
   5534 33            [ 6] 2037 	inc	sp
   5535 DD E1         [14] 2038 	pop	ix
   5537 C9            [10] 2039 	ret
                           2040 ;src/draws.h:202: void erases(){
                           2041 ;	---------------------------------
                           2042 ; Function erases
                           2043 ; ---------------------------------
   5538                    2044 _erases::
                           2045 ;src/draws.h:204: if(temp%2 == 0)
   5538 FD 21 26 91   [14] 2046 	ld	iy,#_temp
   553C FD CB 00 46   [20] 2047 	bit	0, 0 (iy)
   5540 20 14         [12] 2048 	jr	NZ,00102$
                           2049 ;src/draws.h:205: erase(player.lx,player.ly,0);
   5542 21 3F 91      [10] 2050 	ld	hl, #_player + 3
   5545 56            [ 7] 2051 	ld	d,(hl)
   5546 21 3E 91      [10] 2052 	ld	hl, #_player + 2
   5549 46            [ 7] 2053 	ld	b,(hl)
   554A AF            [ 4] 2054 	xor	a, a
   554B F5            [11] 2055 	push	af
   554C 33            [ 6] 2056 	inc	sp
   554D D5            [11] 2057 	push	de
   554E 33            [ 6] 2058 	inc	sp
   554F C5            [11] 2059 	push	bc
   5550 33            [ 6] 2060 	inc	sp
   5551 CD E4 53      [17] 2061 	call	_erase
   5554 F1            [10] 2062 	pop	af
   5555 33            [ 6] 2063 	inc	sp
   5556                    2064 00102$:
                           2065 ;src/draws.h:206: if(temp%2 == 1 && enemy.life > 0)
   5556 3A 26 91      [13] 2066 	ld	a,(#_temp + 0)
   5559 E6 01         [ 7] 2067 	and	a, #0x01
   555B 3D            [ 4] 2068 	dec	a
   555C 20 1A         [12] 2069 	jr	NZ,00104$
   555E 3A 4F 91      [13] 2070 	ld	a, (#_enemy + 8)
   5561 B7            [ 4] 2071 	or	a, a
   5562 28 14         [12] 2072 	jr	Z,00104$
                           2073 ;src/draws.h:207: erase(enemy.lx,enemy.ly,0);
   5564 21 4A 91      [10] 2074 	ld	hl, #_enemy + 3
   5567 56            [ 7] 2075 	ld	d,(hl)
   5568 21 49 91      [10] 2076 	ld	hl, #_enemy + 2
   556B 46            [ 7] 2077 	ld	b,(hl)
   556C AF            [ 4] 2078 	xor	a, a
   556D F5            [11] 2079 	push	af
   556E 33            [ 6] 2080 	inc	sp
   556F D5            [11] 2081 	push	de
   5570 33            [ 6] 2082 	inc	sp
   5571 C5            [11] 2083 	push	bc
   5572 33            [ 6] 2084 	inc	sp
   5573 CD E4 53      [17] 2085 	call	_erase
   5576 F1            [10] 2086 	pop	af
   5577 33            [ 6] 2087 	inc	sp
   5578                    2088 00104$:
                           2089 ;src/draws.h:208: if(arrow == 1){
   5578 3A 2A 91      [13] 2090 	ld	a,(#_arrow + 0)
   557B 3D            [ 4] 2091 	dec	a
   557C C0            [11] 2092 	ret	NZ
                           2093 ;src/draws.h:209: if(object.dir == 4 || object.dir == 6)
   557D 21 39 91      [10] 2094 	ld	hl, #_object + 7
   5580 5E            [ 7] 2095 	ld	e,(hl)
                           2096 ;src/draws.h:210: erase(object.lx,object.ly,2);
   5581 21 35 91      [10] 2097 	ld	hl, #_object + 3
   5584 56            [ 7] 2098 	ld	d,(hl)
   5585 21 34 91      [10] 2099 	ld	hl, #_object + 2
   5588 46            [ 7] 2100 	ld	b,(hl)
                           2101 ;src/draws.h:209: if(object.dir == 4 || object.dir == 6)
   5589 7B            [ 4] 2102 	ld	a,e
   558A FE 04         [ 7] 2103 	cp	a,#0x04
   558C 28 04         [12] 2104 	jr	Z,00106$
   558E D6 06         [ 7] 2105 	sub	a, #0x06
   5590 20 0F         [12] 2106 	jr	NZ,00107$
   5592                    2107 00106$:
                           2108 ;src/draws.h:210: erase(object.lx,object.ly,2);
   5592 3E 02         [ 7] 2109 	ld	a,#0x02
   5594 F5            [11] 2110 	push	af
   5595 33            [ 6] 2111 	inc	sp
   5596 D5            [11] 2112 	push	de
   5597 33            [ 6] 2113 	inc	sp
   5598 C5            [11] 2114 	push	bc
   5599 33            [ 6] 2115 	inc	sp
   559A CD E4 53      [17] 2116 	call	_erase
   559D F1            [10] 2117 	pop	af
   559E 33            [ 6] 2118 	inc	sp
   559F 18 0D         [12] 2119 	jr	00108$
   55A1                    2120 00107$:
                           2121 ;src/draws.h:212: erase(object.lx,object.ly,1);
   55A1 3E 01         [ 7] 2122 	ld	a,#0x01
   55A3 F5            [11] 2123 	push	af
   55A4 33            [ 6] 2124 	inc	sp
   55A5 D5            [11] 2125 	push	de
   55A6 33            [ 6] 2126 	inc	sp
   55A7 C5            [11] 2127 	push	bc
   55A8 33            [ 6] 2128 	inc	sp
   55A9 CD E4 53      [17] 2129 	call	_erase
   55AC F1            [10] 2130 	pop	af
   55AD 33            [ 6] 2131 	inc	sp
   55AE                    2132 00108$:
                           2133 ;src/draws.h:213: if(bound == 1) arrow = 0;
   55AE 3A 2C 91      [13] 2134 	ld	a,(#_bound + 0)
   55B1 3D            [ 4] 2135 	dec	a
   55B2 C0            [11] 2136 	ret	NZ
   55B3 21 2A 91      [10] 2137 	ld	hl,#_arrow + 0
   55B6 36 00         [10] 2138 	ld	(hl), #0x00
   55B8 C9            [10] 2139 	ret
                           2140 ;src/draws.h:220: void drawFatiga(u8 atk, u8 col){
                           2141 ;	---------------------------------
                           2142 ; Function drawFatiga
                           2143 ; ---------------------------------
   55B9                    2144 _drawFatiga::
   55B9 DD E5         [15] 2145 	push	ix
   55BB DD 21 00 00   [14] 2146 	ld	ix,#0
   55BF DD 39         [15] 2147 	add	ix,sp
   55C1 F5            [11] 2148 	push	af
                           2149 ;src/draws.h:222: if(atk < 20)
   55C2 DD 7E 04      [19] 2150 	ld	a,4 (ix)
   55C5 D6 14         [ 7] 2151 	sub	a, #0x14
   55C7 30 04         [12] 2152 	jr	NC,00102$
                           2153 ;src/draws.h:223: col = 2;
   55C9 DD 36 05 02   [19] 2154 	ld	5 (ix),#0x02
   55CD                    2155 00102$:
                           2156 ;src/draws.h:224: if(atk > 30 || atk <= 20){
   55CD 3E 14         [ 7] 2157 	ld	a,#0x14
   55CF DD 96 04      [19] 2158 	sub	a, 4 (ix)
   55D2 3E 00         [ 7] 2159 	ld	a,#0x00
   55D4 17            [ 4] 2160 	rla
   55D5 DD 77 FF      [19] 2161 	ld	-1 (ix),a
                           2162 ;src/draws.h:226: switch(col){
   55D8 3E 02         [ 7] 2163 	ld	a,#0x02
   55DA DD 96 05      [19] 2164 	sub	a, 5 (ix)
   55DD 3E 00         [ 7] 2165 	ld	a,#0x00
   55DF 17            [ 4] 2166 	rla
   55E0 DD 77 FE      [19] 2167 	ld	-2 (ix),a
                           2168 ;src/draws.h:224: if(atk > 30 || atk <= 20){
   55E3 3E 1E         [ 7] 2169 	ld	a,#0x1E
   55E5 DD 96 04      [19] 2170 	sub	a, 4 (ix)
   55E8 38 06         [12] 2171 	jr	C,00107$
   55EA DD 7E FF      [19] 2172 	ld	a,-1 (ix)
   55ED B7            [ 4] 2173 	or	a, a
   55EE 20 4F         [12] 2174 	jr	NZ,00108$
   55F0                    2175 00107$:
                           2176 ;src/draws.h:225: memptr = cpct_getScreenPtr(VMEM,28,192);
   55F0 21 1C C0      [10] 2177 	ld	hl,#0xC01C
   55F3 E5            [11] 2178 	push	hl
   55F4 2E 00         [ 7] 2179 	ld	l, #0x00
   55F6 E5            [11] 2180 	push	hl
   55F7 CD 40 8F      [17] 2181 	call	_cpct_getScreenPtr
                           2182 ;src/draws.h:226: switch(col){
   55FA DD 7E FE      [19] 2183 	ld	a,-2 (ix)
   55FD B7            [ 4] 2184 	or	a, a
   55FE 20 3F         [12] 2185 	jr	NZ,00108$
                           2186 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   5600 4D            [ 4] 2187 	ld	c, l
   5601 44            [ 4] 2188 	ld	b, h
                           2189 ;src/draws.h:226: switch(col){
   5602 DD 5E 05      [19] 2190 	ld	e,5 (ix)
   5605 16 00         [ 7] 2191 	ld	d,#0x00
   5607 21 0D 56      [10] 2192 	ld	hl,#00156$
   560A 19            [11] 2193 	add	hl,de
   560B 19            [11] 2194 	add	hl,de
                           2195 ;src/draws.h:227: case 0:
   560C E9            [ 4] 2196 	jp	(hl)
   560D                    2197 00156$:
   560D 18 04         [12] 2198 	jr	00103$
   560F 18 14         [12] 2199 	jr	00104$
   5611 18 20         [12] 2200 	jr	00105$
   5613                    2201 00103$:
                           2202 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   5613 21 02 08      [10] 2203 	ld	hl,#0x0802
   5616 E5            [11] 2204 	push	hl
   5617 DD 7E 05      [19] 2205 	ld	a,5 (ix)
   561A F5            [11] 2206 	push	af
   561B 33            [ 6] 2207 	inc	sp
   561C C5            [11] 2208 	push	bc
   561D CD 6F 8E      [17] 2209 	call	_cpct_drawSolidBox
   5620 F1            [10] 2210 	pop	af
   5621 F1            [10] 2211 	pop	af
   5622 33            [ 6] 2212 	inc	sp
                           2213 ;src/draws.h:229: break;
   5623 18 1A         [12] 2214 	jr	00108$
                           2215 ;src/draws.h:230: case 1:
   5625                    2216 00104$:
                           2217 ;src/draws.h:231: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   5625 11 C8 4A      [10] 2218 	ld	de,#_fatiga_nor
   5628 21 02 08      [10] 2219 	ld	hl,#0x0802
   562B E5            [11] 2220 	push	hl
   562C C5            [11] 2221 	push	bc
   562D D5            [11] 2222 	push	de
   562E CD E9 8D      [17] 2223 	call	_cpct_drawSpriteMasked
                           2224 ;src/draws.h:232: break;
   5631 18 0C         [12] 2225 	jr	00108$
                           2226 ;src/draws.h:233: case 2:
   5633                    2227 00105$:
                           2228 ;src/draws.h:234: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   5633 11 E8 4A      [10] 2229 	ld	de,#_fatiga_full
   5636 21 02 08      [10] 2230 	ld	hl,#0x0802
   5639 E5            [11] 2231 	push	hl
   563A C5            [11] 2232 	push	bc
   563B D5            [11] 2233 	push	de
   563C CD E9 8D      [17] 2234 	call	_cpct_drawSpriteMasked
                           2235 ;src/draws.h:235: }
   563F                    2236 00108$:
                           2237 ;src/draws.h:237: if(atk > 40 || atk <= 20){
   563F 3E 28         [ 7] 2238 	ld	a,#0x28
   5641 DD 96 04      [19] 2239 	sub	a, 4 (ix)
   5644 38 06         [12] 2240 	jr	C,00114$
   5646 DD 7E FF      [19] 2241 	ld	a,-1 (ix)
   5649 B7            [ 4] 2242 	or	a, a
   564A 20 4F         [12] 2243 	jr	NZ,00115$
   564C                    2244 00114$:
                           2245 ;src/draws.h:238: memptr = cpct_getScreenPtr(VMEM,31,192);
   564C 21 1F C0      [10] 2246 	ld	hl,#0xC01F
   564F E5            [11] 2247 	push	hl
   5650 2E 00         [ 7] 2248 	ld	l, #0x00
   5652 E5            [11] 2249 	push	hl
   5653 CD 40 8F      [17] 2250 	call	_cpct_getScreenPtr
                           2251 ;src/draws.h:239: switch(col){
   5656 DD 7E FE      [19] 2252 	ld	a,-2 (ix)
   5659 B7            [ 4] 2253 	or	a, a
   565A 20 3F         [12] 2254 	jr	NZ,00115$
                           2255 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   565C 4D            [ 4] 2256 	ld	c, l
   565D 44            [ 4] 2257 	ld	b, h
                           2258 ;src/draws.h:239: switch(col){
   565E DD 5E 05      [19] 2259 	ld	e,5 (ix)
   5661 16 00         [ 7] 2260 	ld	d,#0x00
   5663 21 69 56      [10] 2261 	ld	hl,#00157$
   5666 19            [11] 2262 	add	hl,de
   5667 19            [11] 2263 	add	hl,de
                           2264 ;src/draws.h:240: case 0:
   5668 E9            [ 4] 2265 	jp	(hl)
   5669                    2266 00157$:
   5669 18 04         [12] 2267 	jr	00110$
   566B 18 14         [12] 2268 	jr	00111$
   566D 18 20         [12] 2269 	jr	00112$
   566F                    2270 00110$:
                           2271 ;src/draws.h:241: cpct_drawSolidBox(memptr, col, 2, 8);
   566F 21 02 08      [10] 2272 	ld	hl,#0x0802
   5672 E5            [11] 2273 	push	hl
   5673 DD 7E 05      [19] 2274 	ld	a,5 (ix)
   5676 F5            [11] 2275 	push	af
   5677 33            [ 6] 2276 	inc	sp
   5678 C5            [11] 2277 	push	bc
   5679 CD 6F 8E      [17] 2278 	call	_cpct_drawSolidBox
   567C F1            [10] 2279 	pop	af
   567D F1            [10] 2280 	pop	af
   567E 33            [ 6] 2281 	inc	sp
                           2282 ;src/draws.h:242: break;
   567F 18 1A         [12] 2283 	jr	00115$
                           2284 ;src/draws.h:243: case 1:
   5681                    2285 00111$:
                           2286 ;src/draws.h:244: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   5681 11 C8 4A      [10] 2287 	ld	de,#_fatiga_nor
   5684 21 02 08      [10] 2288 	ld	hl,#0x0802
   5687 E5            [11] 2289 	push	hl
   5688 C5            [11] 2290 	push	bc
   5689 D5            [11] 2291 	push	de
   568A CD E9 8D      [17] 2292 	call	_cpct_drawSpriteMasked
                           2293 ;src/draws.h:245: break;
   568D 18 0C         [12] 2294 	jr	00115$
                           2295 ;src/draws.h:246: case 2:
   568F                    2296 00112$:
                           2297 ;src/draws.h:247: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   568F 11 E8 4A      [10] 2298 	ld	de,#_fatiga_full
   5692 21 02 08      [10] 2299 	ld	hl,#0x0802
   5695 E5            [11] 2300 	push	hl
   5696 C5            [11] 2301 	push	bc
   5697 D5            [11] 2302 	push	de
   5698 CD E9 8D      [17] 2303 	call	_cpct_drawSpriteMasked
                           2304 ;src/draws.h:248: }
   569B                    2305 00115$:
                           2306 ;src/draws.h:250: if(atk <= 20){
   569B DD 7E FF      [19] 2307 	ld	a,-1 (ix)
   569E B7            [ 4] 2308 	or	a, a
   569F 20 39         [12] 2309 	jr	NZ,00122$
                           2310 ;src/draws.h:251: memptr = cpct_getScreenPtr(VMEM,34,192);
   56A1 21 22 C0      [10] 2311 	ld	hl,#0xC022
   56A4 E5            [11] 2312 	push	hl
   56A5 2E 00         [ 7] 2313 	ld	l, #0x00
   56A7 E5            [11] 2314 	push	hl
   56A8 CD 40 8F      [17] 2315 	call	_cpct_getScreenPtr
                           2316 ;src/draws.h:228: cpct_drawSolidBox(memptr, col, 2, 8);
   56AB 4D            [ 4] 2317 	ld	c, l
   56AC 44            [ 4] 2318 	ld	b, h
                           2319 ;src/draws.h:252: switch(col){
   56AD DD 7E 05      [19] 2320 	ld	a,5 (ix)
   56B0 B7            [ 4] 2321 	or	a, a
   56B1 28 09         [12] 2322 	jr	Z,00117$
   56B3 DD 7E 05      [19] 2323 	ld	a,5 (ix)
   56B6 D6 02         [ 7] 2324 	sub	a, #0x02
   56B8 28 14         [12] 2325 	jr	Z,00118$
   56BA 18 1E         [12] 2326 	jr	00122$
                           2327 ;src/draws.h:253: case 0:
   56BC                    2328 00117$:
                           2329 ;src/draws.h:254: cpct_drawSolidBox(memptr, col, 2, 8);
   56BC 21 02 08      [10] 2330 	ld	hl,#0x0802
   56BF E5            [11] 2331 	push	hl
   56C0 DD 7E 05      [19] 2332 	ld	a,5 (ix)
   56C3 F5            [11] 2333 	push	af
   56C4 33            [ 6] 2334 	inc	sp
   56C5 C5            [11] 2335 	push	bc
   56C6 CD 6F 8E      [17] 2336 	call	_cpct_drawSolidBox
   56C9 F1            [10] 2337 	pop	af
   56CA F1            [10] 2338 	pop	af
   56CB 33            [ 6] 2339 	inc	sp
                           2340 ;src/draws.h:255: break;
   56CC 18 0C         [12] 2341 	jr	00122$
                           2342 ;src/draws.h:256: case 2:
   56CE                    2343 00118$:
                           2344 ;src/draws.h:257: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   56CE 11 E8 4A      [10] 2345 	ld	de,#_fatiga_full
   56D1 21 02 08      [10] 2346 	ld	hl,#0x0802
   56D4 E5            [11] 2347 	push	hl
   56D5 C5            [11] 2348 	push	bc
   56D6 D5            [11] 2349 	push	de
   56D7 CD E9 8D      [17] 2350 	call	_cpct_drawSpriteMasked
                           2351 ;src/draws.h:258: }
   56DA                    2352 00122$:
   56DA DD F9         [10] 2353 	ld	sp, ix
   56DC DD E1         [14] 2354 	pop	ix
   56DE C9            [10] 2355 	ret
                           2356 ;src/draws.h:263: void drawPickUps(u8 corazon, u8 bullet){
                           2357 ;	---------------------------------
                           2358 ; Function drawPickUps
                           2359 ; ---------------------------------
   56DF                    2360 _drawPickUps::
   56DF DD E5         [15] 2361 	push	ix
   56E1 DD 21 00 00   [14] 2362 	ld	ix,#0
   56E5 DD 39         [15] 2363 	add	ix,sp
                           2364 ;src/draws.h:266: memptr = cpct_getScreenPtr(VMEM, originsu[map-1][0],originsu[map-1][1] );
   56E7 01 51 4B      [10] 2365 	ld	bc,#_originsu+0
   56EA 21 27 91      [10] 2366 	ld	hl,#_map + 0
   56ED 56            [ 7] 2367 	ld	d, (hl)
   56EE 15            [ 4] 2368 	dec	d
   56EF 6A            [ 4] 2369 	ld	l,d
   56F0 26 00         [ 7] 2370 	ld	h,#0x00
   56F2 29            [11] 2371 	add	hl, hl
   56F3 29            [11] 2372 	add	hl, hl
   56F4 09            [11] 2373 	add	hl, bc
   56F5 E5            [11] 2374 	push	hl
   56F6 FD E1         [14] 2375 	pop	iy
   56F8 FD E5         [15] 2376 	push	iy
   56FA E1            [10] 2377 	pop	hl
   56FB 23            [ 6] 2378 	inc	hl
   56FC 56            [ 7] 2379 	ld	d,(hl)
   56FD FD 7E 00      [19] 2380 	ld	a, 0 (iy)
   5700 C5            [11] 2381 	push	bc
   5701 D5            [11] 2382 	push	de
   5702 33            [ 6] 2383 	inc	sp
   5703 F5            [11] 2384 	push	af
   5704 33            [ 6] 2385 	inc	sp
   5705 21 00 C0      [10] 2386 	ld	hl,#0xC000
   5708 E5            [11] 2387 	push	hl
   5709 CD 40 8F      [17] 2388 	call	_cpct_getScreenPtr
   570C C1            [10] 2389 	pop	bc
                           2390 ;src/draws.h:268: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   570D EB            [ 4] 2391 	ex	de,hl
                           2392 ;src/draws.h:267: if(corazon == 0)
   570E DD 7E 04      [19] 2393 	ld	a,4 (ix)
   5711 B7            [ 4] 2394 	or	a, a
   5712 20 10         [12] 2395 	jr	NZ,00102$
                           2396 ;src/draws.h:268: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   5714 C5            [11] 2397 	push	bc
   5715 21 04 08      [10] 2398 	ld	hl,#0x0804
   5718 E5            [11] 2399 	push	hl
   5719 D5            [11] 2400 	push	de
   571A 21 48 4A      [10] 2401 	ld	hl,#_corazon_lleno
   571D E5            [11] 2402 	push	hl
   571E CD E9 8D      [17] 2403 	call	_cpct_drawSpriteMasked
   5721 C1            [10] 2404 	pop	bc
   5722 18 10         [12] 2405 	jr	00103$
   5724                    2406 00102$:
                           2407 ;src/draws.h:270: cpct_drawSolidBox(memptr, 0, 4, 8);
   5724 C5            [11] 2408 	push	bc
   5725 21 04 08      [10] 2409 	ld	hl,#0x0804
   5728 E5            [11] 2410 	push	hl
   5729 AF            [ 4] 2411 	xor	a, a
   572A F5            [11] 2412 	push	af
   572B 33            [ 6] 2413 	inc	sp
   572C D5            [11] 2414 	push	de
   572D CD 6F 8E      [17] 2415 	call	_cpct_drawSolidBox
   5730 F1            [10] 2416 	pop	af
   5731 F1            [10] 2417 	pop	af
   5732 33            [ 6] 2418 	inc	sp
   5733 C1            [10] 2419 	pop	bc
   5734                    2420 00103$:
                           2421 ;src/draws.h:272: memptr = cpct_getScreenPtr(VMEM, originsu[map-1][2],originsu[map-1][3]);
   5734 21 27 91      [10] 2422 	ld	hl,#_map + 0
   5737 56            [ 7] 2423 	ld	d, (hl)
   5738 15            [ 4] 2424 	dec	d
   5739 6A            [ 4] 2425 	ld	l,d
   573A 26 00         [ 7] 2426 	ld	h,#0x00
   573C 29            [11] 2427 	add	hl, hl
   573D 29            [11] 2428 	add	hl, hl
   573E 09            [11] 2429 	add	hl,bc
   573F 5D            [ 4] 2430 	ld	e,l
   5740 54            [ 4] 2431 	ld	d,h
   5741 23            [ 6] 2432 	inc	hl
   5742 23            [ 6] 2433 	inc	hl
   5743 23            [ 6] 2434 	inc	hl
   5744 46            [ 7] 2435 	ld	b,(hl)
   5745 EB            [ 4] 2436 	ex	de,hl
   5746 23            [ 6] 2437 	inc	hl
   5747 23            [ 6] 2438 	inc	hl
   5748 4E            [ 7] 2439 	ld	c, (hl)
   5749 C5            [11] 2440 	push	bc
   574A 21 00 C0      [10] 2441 	ld	hl,#0xC000
   574D E5            [11] 2442 	push	hl
   574E CD 40 8F      [17] 2443 	call	_cpct_getScreenPtr
                           2444 ;src/draws.h:268: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   5751 EB            [ 4] 2445 	ex	de,hl
                           2446 ;src/draws.h:273: if(bullet == 0)
   5752 DD 7E 05      [19] 2447 	ld	a,5 (ix)
   5755 B7            [ 4] 2448 	or	a, a
   5756 20 0E         [12] 2449 	jr	NZ,00105$
                           2450 ;src/draws.h:274: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   5758 01 1E 76      [10] 2451 	ld	bc,#_flecha_arriba
   575B 21 02 08      [10] 2452 	ld	hl,#0x0802
   575E E5            [11] 2453 	push	hl
   575F D5            [11] 2454 	push	de
   5760 C5            [11] 2455 	push	bc
   5761 CD E9 8D      [17] 2456 	call	_cpct_drawSpriteMasked
   5764 18 0E         [12] 2457 	jr	00107$
   5766                    2458 00105$:
                           2459 ;src/draws.h:276: cpct_drawSolidBox(memptr, 0, 2, 8);
   5766 21 02 08      [10] 2460 	ld	hl,#0x0802
   5769 E5            [11] 2461 	push	hl
   576A AF            [ 4] 2462 	xor	a, a
   576B F5            [11] 2463 	push	af
   576C 33            [ 6] 2464 	inc	sp
   576D D5            [11] 2465 	push	de
   576E CD 6F 8E      [17] 2466 	call	_cpct_drawSolidBox
   5771 F1            [10] 2467 	pop	af
   5772 F1            [10] 2468 	pop	af
   5773 33            [ 6] 2469 	inc	sp
   5774                    2470 00107$:
   5774 DD E1         [14] 2471 	pop	ix
   5776 C9            [10] 2472 	ret
                           2473 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           2474 ;	---------------------------------
                           2475 ; Function detectPlayerRoom
                           2476 ; ---------------------------------
   5777                    2477 _detectPlayerRoom::
   5777 DD E5         [15] 2478 	push	ix
   5779 DD 21 00 00   [14] 2479 	ld	ix,#0
   577D DD 39         [15] 2480 	add	ix,sp
                           2481 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   577F 11 36 90      [10] 2482 	ld	de,#_scene+0
   5782 DD 7E 05      [19] 2483 	ld	a,5 (ix)
   5785 07            [ 4] 2484 	rlca
   5786 07            [ 4] 2485 	rlca
   5787 07            [ 4] 2486 	rlca
   5788 07            [ 4] 2487 	rlca
   5789 E6 0F         [ 7] 2488 	and	a,#0x0F
   578B 4F            [ 4] 2489 	ld	c,a
   578C 06 00         [ 7] 2490 	ld	b,#0x00
   578E 69            [ 4] 2491 	ld	l, c
   578F 60            [ 4] 2492 	ld	h, b
   5790 29            [11] 2493 	add	hl, hl
   5791 29            [11] 2494 	add	hl, hl
   5792 09            [11] 2495 	add	hl, bc
   5793 29            [11] 2496 	add	hl, hl
   5794 29            [11] 2497 	add	hl, hl
   5795 19            [11] 2498 	add	hl,de
   5796 DD 5E 04      [19] 2499 	ld	e,4 (ix)
   5799 CB 3B         [ 8] 2500 	srl	e
   579B CB 3B         [ 8] 2501 	srl	e
   579D 16 00         [ 7] 2502 	ld	d,#0x00
   579F 19            [11] 2503 	add	hl,de
   57A0 6E            [ 7] 2504 	ld	l,(hl)
   57A1 DD E1         [14] 2505 	pop	ix
   57A3 C9            [10] 2506 	ret
                           2507 ;src/ia.h:16: u8 chooseDirection(){
                           2508 ;	---------------------------------
                           2509 ; Function chooseDirection
                           2510 ; ---------------------------------
   57A4                    2511 _chooseDirection::
                           2512 ;src/ia.h:18: u8 dir = 0;
   57A4 16 00         [ 7] 2513 	ld	d,#0x00
                           2514 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   57A6 D5            [11] 2515 	push	de
   57A7 CD E8 8B      [17] 2516 	call	_rand
   57AA 01 04 00      [10] 2517 	ld	bc,#0x0004
   57AD C5            [11] 2518 	push	bc
   57AE E5            [11] 2519 	push	hl
   57AF CD 34 8F      [17] 2520 	call	__modsint
   57B2 F1            [10] 2521 	pop	af
   57B3 F1            [10] 2522 	pop	af
   57B4 D1            [10] 2523 	pop	de
   57B5 5D            [ 4] 2524 	ld	e,l
   57B6 1C            [ 4] 2525 	inc	e
                           2526 ;src/ia.h:20: switch(rnd){
   57B7 7B            [ 4] 2527 	ld	a,e
   57B8 D6 01         [ 7] 2528 	sub	a, #0x01
   57BA 38 24         [12] 2529 	jr	C,00105$
   57BC 3E 04         [ 7] 2530 	ld	a,#0x04
   57BE 93            [ 4] 2531 	sub	a, e
   57BF 38 1F         [12] 2532 	jr	C,00105$
   57C1 1D            [ 4] 2533 	dec	e
   57C2 16 00         [ 7] 2534 	ld	d,#0x00
   57C4 21 CA 57      [10] 2535 	ld	hl,#00116$
   57C7 19            [11] 2536 	add	hl,de
   57C8 19            [11] 2537 	add	hl,de
                           2538 ;src/ia.h:21: case 4: dir = 6;break;
   57C9 E9            [ 4] 2539 	jp	(hl)
   57CA                    2540 00116$:
   57CA 18 12         [12] 2541 	jr	00104$
   57CC 18 0C         [12] 2542 	jr	00103$
   57CE 18 06         [12] 2543 	jr	00102$
   57D0 18 00         [12] 2544 	jr	00101$
   57D2                    2545 00101$:
   57D2 16 06         [ 7] 2546 	ld	d,#0x06
   57D4 18 0A         [12] 2547 	jr	00105$
                           2548 ;src/ia.h:22: case 3: dir = 4;break;
   57D6                    2549 00102$:
   57D6 16 04         [ 7] 2550 	ld	d,#0x04
   57D8 18 06         [12] 2551 	jr	00105$
                           2552 ;src/ia.h:23: case 2: dir = 2;break;
   57DA                    2553 00103$:
   57DA 16 02         [ 7] 2554 	ld	d,#0x02
   57DC 18 02         [12] 2555 	jr	00105$
                           2556 ;src/ia.h:24: case 1: dir = 8;break;
   57DE                    2557 00104$:
   57DE 16 08         [ 7] 2558 	ld	d,#0x08
                           2559 ;src/ia.h:25: }
   57E0                    2560 00105$:
                           2561 ;src/ia.h:27: return dir;
   57E0 6A            [ 4] 2562 	ld	l,d
   57E1 C9            [10] 2563 	ret
                           2564 ;src/ia.h:30: void movement(u8 dir){
                           2565 ;	---------------------------------
                           2566 ; Function movement
                           2567 ; ---------------------------------
   57E2                    2568 _movement::
                           2569 ;src/ia.h:31: switch(dir){
   57E2 FD 21 02 00   [14] 2570 	ld	iy,#2
   57E6 FD 39         [15] 2571 	add	iy,sp
   57E8 FD 7E 00      [19] 2572 	ld	a,0 (iy)
   57EB D6 02         [ 7] 2573 	sub	a, #0x02
   57ED 28 2B         [12] 2574 	jr	Z,00104$
   57EF FD 7E 00      [19] 2575 	ld	a,0 (iy)
   57F2 D6 04         [ 7] 2576 	sub	a, #0x04
   57F4 28 14         [12] 2577 	jr	Z,00102$
   57F6 FD 7E 00      [19] 2578 	ld	a,0 (iy)
   57F9 D6 06         [ 7] 2579 	sub	a, #0x06
   57FB 28 08         [12] 2580 	jr	Z,00101$
   57FD FD 7E 00      [19] 2581 	ld	a,0 (iy)
   5800 D6 08         [ 7] 2582 	sub	a, #0x08
   5802 28 0E         [12] 2583 	jr	Z,00103$
   5804 C9            [10] 2584 	ret
                           2585 ;src/ia.h:32: case 6: enemy.x += 1; break;
   5805                    2586 00101$:
   5805 21 47 91      [10] 2587 	ld	hl,#_enemy+0
   5808 34            [11] 2588 	inc	(hl)
   5809 C9            [10] 2589 	ret
                           2590 ;src/ia.h:33: case 4: enemy.x -= 1; break;
   580A                    2591 00102$:
   580A 11 47 91      [10] 2592 	ld	de,#_enemy+0
   580D 1A            [ 7] 2593 	ld	a,(de)
   580E C6 FF         [ 7] 2594 	add	a,#0xFF
   5810 12            [ 7] 2595 	ld	(de),a
   5811 C9            [10] 2596 	ret
                           2597 ;src/ia.h:34: case 8: enemy.y -= 2; break;
   5812                    2598 00103$:
   5812 11 48 91      [10] 2599 	ld	de,#_enemy+1
   5815 1A            [ 7] 2600 	ld	a,(de)
   5816 C6 FE         [ 7] 2601 	add	a,#0xFE
   5818 12            [ 7] 2602 	ld	(de),a
   5819 C9            [10] 2603 	ret
                           2604 ;src/ia.h:35: case 2: enemy.y += 2; break;
   581A                    2605 00104$:
   581A 21 48 91      [10] 2606 	ld	hl,#_enemy+1
   581D 7E            [ 7] 2607 	ld	a,(hl)
   581E C6 02         [ 7] 2608 	add	a, #0x02
   5820 77            [ 7] 2609 	ld	(hl),a
                           2610 ;src/ia.h:36: }
   5821 C9            [10] 2611 	ret
                           2612 ;src/ia.h:39: void followPlayer(){
                           2613 ;	---------------------------------
                           2614 ; Function followPlayer
                           2615 ; ---------------------------------
   5822                    2616 _followPlayer::
   5822 DD E5         [15] 2617 	push	ix
   5824 DD 21 00 00   [14] 2618 	ld	ix,#0
   5828 DD 39         [15] 2619 	add	ix,sp
   582A 21 E1 FF      [10] 2620 	ld	hl,#-31
   582D 39            [11] 2621 	add	hl,sp
   582E F9            [ 6] 2622 	ld	sp,hl
                           2623 ;src/ia.h:42: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   582F 21 3D 91      [10] 2624 	ld	hl, #(_player + 0x0001) + 0
   5832 56            [ 7] 2625 	ld	d,(hl)
   5833 3A 3C 91      [13] 2626 	ld	a, (#_player + 0)
   5836 D5            [11] 2627 	push	de
   5837 33            [ 6] 2628 	inc	sp
   5838 F5            [11] 2629 	push	af
   5839 33            [ 6] 2630 	inc	sp
   583A CD 77 57      [17] 2631 	call	_detectPlayerRoom
   583D F1            [10] 2632 	pop	af
   583E DD 75 E3      [19] 2633 	ld	-29 (ix),l
   5841 21 51 91      [10] 2634 	ld	hl, #_enemy + 10
   5844 DD 7E E3      [19] 2635 	ld	a,-29 (ix)
   5847 96            [ 7] 2636 	sub	a,(hl)
   5848 28 0E         [12] 2637 	jr	Z,00102$
                           2638 ;src/ia.h:43: auxX = enemy.seenX;
   584A 3A 52 91      [13] 2639 	ld	a,(#_enemy + 11)
   584D DD 77 E2      [19] 2640 	ld	-30 (ix),a
                           2641 ;src/ia.h:44: auxY = enemy.seenY;
   5850 3A 53 91      [13] 2642 	ld	a,(#_enemy + 12)
   5853 DD 77 E1      [19] 2643 	ld	-31 (ix),a
   5856 18 0C         [12] 2644 	jr	00103$
   5858                    2645 00102$:
                           2646 ;src/ia.h:46: auxX = player.x;
   5858 3A 3C 91      [13] 2647 	ld	a,(#_player + 0)
   585B DD 77 E2      [19] 2648 	ld	-30 (ix),a
                           2649 ;src/ia.h:47: auxY = player.y;
   585E 3A 3D 91      [13] 2650 	ld	a,(#(_player + 0x0001) + 0)
   5861 DD 77 E1      [19] 2651 	ld	-31 (ix),a
   5864                    2652 00103$:
                           2653 ;src/ia.h:49: if(auxX < enemy.x){
   5864 3A 47 91      [13] 2654 	ld	a,(#_enemy + 0)
                           2655 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5867 DD 77 E3      [19] 2656 	ld	-29 (ix), a
   586A DD 77 E4      [19] 2657 	ld	-28 (ix),a
   586D DD 36 E5 00   [19] 2658 	ld	-27 (ix),#0x00
   5871 DD 7E E4      [19] 2659 	ld	a,-28 (ix)
   5874 C6 02         [ 7] 2660 	add	a, #0x02
   5876 DD 77 E8      [19] 2661 	ld	-24 (ix),a
   5879 DD 7E E5      [19] 2662 	ld	a,-27 (ix)
   587C CE 00         [ 7] 2663 	adc	a, #0x00
   587E DD 77 E9      [19] 2664 	ld	-23 (ix),a
                           2665 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5881 DD 7E E3      [19] 2666 	ld	a,-29 (ix)
   5884 0F            [ 4] 2667 	rrca
   5885 0F            [ 4] 2668 	rrca
   5886 E6 3F         [ 7] 2669 	and	a,#0x3F
   5888 DD 77 FD      [19] 2670 	ld	-3 (ix),a
                           2671 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   588B 3A 48 91      [13] 2672 	ld	a,(#(_enemy + 0x0001) + 0)
   588E DD 77 F4      [19] 2673 	ld	-12 (ix),a
   5891 DD 7E E4      [19] 2674 	ld	a,-28 (ix)
   5894 C6 FF         [ 7] 2675 	add	a,#0xFF
   5896 DD 77 EA      [19] 2676 	ld	-22 (ix),a
   5899 DD 7E E5      [19] 2677 	ld	a,-27 (ix)
   589C CE FF         [ 7] 2678 	adc	a,#0xFF
   589E DD 77 EB      [19] 2679 	ld	-21 (ix),a
   58A1 DD 7E F4      [19] 2680 	ld	a,-12 (ix)
   58A4 07            [ 4] 2681 	rlca
   58A5 07            [ 4] 2682 	rlca
   58A6 07            [ 4] 2683 	rlca
   58A7 07            [ 4] 2684 	rlca
   58A8 E6 0F         [ 7] 2685 	and	a,#0x0F
   58AA DD 77 FE      [19] 2686 	ld	-2 (ix),a
   58AD DD 7E EB      [19] 2687 	ld	a,-21 (ix)
   58B0 07            [ 4] 2688 	rlca
   58B1 E6 01         [ 7] 2689 	and	a,#0x01
   58B3 DD 77 F5      [19] 2690 	ld	-11 (ix),a
                           2691 ;src/ia.h:53: }else if(auxY < enemy.y){
   58B6 DD 7E E1      [19] 2692 	ld	a,-31 (ix)
   58B9 DD 96 F4      [19] 2693 	sub	a, -12 (ix)
   58BC 3E 00         [ 7] 2694 	ld	a,#0x00
   58BE 17            [ 4] 2695 	rla
   58BF DD 77 FF      [19] 2696 	ld	-1 (ix),a
                           2697 ;src/ia.h:55: enemy.y-=1;
   58C2 DD 7E F4      [19] 2698 	ld	a,-12 (ix)
   58C5 C6 FF         [ 7] 2699 	add	a,#0xFF
   58C7 DD 77 ED      [19] 2700 	ld	-19 (ix),a
                           2701 ;src/ia.h:58: enemy.y+=1;
   58CA DD 7E F4      [19] 2702 	ld	a,-12 (ix)
   58CD 3C            [ 4] 2703 	inc	a
   58CE DD 77 EC      [19] 2704 	ld	-20 (ix),a
                           2705 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   58D1 DD 7E F4      [19] 2706 	ld	a,-12 (ix)
   58D4 DD 77 F2      [19] 2707 	ld	-14 (ix),a
   58D7 DD 36 F3 00   [19] 2708 	ld	-13 (ix),#0x00
                           2709 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   58DB DD 4E FE      [19] 2710 	ld	c,-2 (ix)
   58DE 06 00         [ 7] 2711 	ld	b,#0x00
   58E0 69            [ 4] 2712 	ld	l, c
   58E1 60            [ 4] 2713 	ld	h, b
   58E2 29            [11] 2714 	add	hl, hl
   58E3 29            [11] 2715 	add	hl, hl
   58E4 09            [11] 2716 	add	hl, bc
   58E5 29            [11] 2717 	add	hl, hl
   58E6 29            [11] 2718 	add	hl, hl
   58E7 DD 75 F6      [19] 2719 	ld	-10 (ix),l
   58EA DD 74 F7      [19] 2720 	ld	-9 (ix),h
                           2721 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   58ED DD 7E F2      [19] 2722 	ld	a,-14 (ix)
   58F0 C6 FF         [ 7] 2723 	add	a,#0xFF
   58F2 DD 77 FB      [19] 2724 	ld	-5 (ix),a
   58F5 DD 7E F3      [19] 2725 	ld	a,-13 (ix)
   58F8 CE FF         [ 7] 2726 	adc	a,#0xFF
   58FA DD 77 FC      [19] 2727 	ld	-4 (ix),a
   58FD DD 7E F2      [19] 2728 	ld	a,-14 (ix)
   5900 C6 0E         [ 7] 2729 	add	a, #0x0E
   5902 DD 77 F8      [19] 2730 	ld	-8 (ix),a
   5905 DD 7E F3      [19] 2731 	ld	a,-13 (ix)
   5908 CE 00         [ 7] 2732 	adc	a, #0x00
   590A DD 77 F9      [19] 2733 	ld	-7 (ix),a
                           2734 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   590D DD 7E F2      [19] 2735 	ld	a,-14 (ix)
   5910 C6 10         [ 7] 2736 	add	a, #0x10
   5912 DD 77 E6      [19] 2737 	ld	-26 (ix),a
   5915 DD 7E F3      [19] 2738 	ld	a,-13 (ix)
   5918 CE 00         [ 7] 2739 	adc	a, #0x00
   591A DD 77 E7      [19] 2740 	ld	-25 (ix),a
   591D DD 7E F2      [19] 2741 	ld	a,-14 (ix)
   5920 C6 1F         [ 7] 2742 	add	a, #0x1F
   5922 DD 77 F2      [19] 2743 	ld	-14 (ix),a
   5925 DD 7E F3      [19] 2744 	ld	a,-13 (ix)
   5928 CE 00         [ 7] 2745 	adc	a, #0x00
   592A DD 77 F3      [19] 2746 	ld	-13 (ix),a
                           2747 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   592D DD 7E FC      [19] 2748 	ld	a,-4 (ix)
   5930 07            [ 4] 2749 	rlca
   5931 E6 01         [ 7] 2750 	and	a,#0x01
   5933 DD 77 FE      [19] 2751 	ld	-2 (ix),a
                           2752 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5936 DD 7E E7      [19] 2753 	ld	a,-25 (ix)
   5939 07            [ 4] 2754 	rlca
   593A E6 01         [ 7] 2755 	and	a,#0x01
   593C DD 77 F4      [19] 2756 	ld	-12 (ix),a
                           2757 ;src/ia.h:49: if(auxX < enemy.x){
   593F DD 7E E2      [19] 2758 	ld	a,-30 (ix)
   5942 DD 96 E3      [19] 2759 	sub	a, -29 (ix)
   5945 D2 6E 5B      [10] 2760 	jp	NC,00137$
                           2761 ;src/ia.h:50: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5948 DD 7E F6      [19] 2762 	ld	a,-10 (ix)
   594B C6 36         [ 7] 2763 	add	a, #<(_scene)
   594D DD 77 F0      [19] 2764 	ld	-16 (ix),a
   5950 DD 7E F7      [19] 2765 	ld	a,-9 (ix)
   5953 CE 90         [ 7] 2766 	adc	a, #>(_scene)
   5955 DD 77 F1      [19] 2767 	ld	-15 (ix),a
   5958 DD 7E EA      [19] 2768 	ld	a,-22 (ix)
   595B DD 77 EE      [19] 2769 	ld	-18 (ix),a
   595E DD 7E EB      [19] 2770 	ld	a,-21 (ix)
   5961 DD 77 EF      [19] 2771 	ld	-17 (ix),a
   5964 DD 7E F5      [19] 2772 	ld	a,-11 (ix)
   5967 B7            [ 4] 2773 	or	a, a
   5968 28 0C         [12] 2774 	jr	Z,00141$
   596A DD 7E E8      [19] 2775 	ld	a,-24 (ix)
   596D DD 77 EE      [19] 2776 	ld	-18 (ix),a
   5970 DD 7E E9      [19] 2777 	ld	a,-23 (ix)
   5973 DD 77 EF      [19] 2778 	ld	-17 (ix),a
   5976                    2779 00141$:
   5976 DD CB EF 2E   [23] 2780 	sra	-17 (ix)
   597A DD CB EE 1E   [23] 2781 	rr	-18 (ix)
   597E DD CB EF 2E   [23] 2782 	sra	-17 (ix)
   5982 DD CB EE 1E   [23] 2783 	rr	-18 (ix)
   5986 DD 7E F0      [19] 2784 	ld	a,-16 (ix)
   5989 DD 86 EE      [19] 2785 	add	a, -18 (ix)
   598C DD 77 EE      [19] 2786 	ld	-18 (ix),a
   598F DD 7E F1      [19] 2787 	ld	a,-15 (ix)
   5992 DD 8E EF      [19] 2788 	adc	a, -17 (ix)
   5995 DD 77 EF      [19] 2789 	ld	-17 (ix),a
   5998 DD 6E EE      [19] 2790 	ld	l,-18 (ix)
   599B DD 66 EF      [19] 2791 	ld	h,-17 (ix)
   599E 7E            [ 7] 2792 	ld	a,(hl)
   599F 3D            [ 4] 2793 	dec	a
   59A0 CA 59 5A      [10] 2794 	jp	Z,00112$
                           2795 ;src/ia.h:51: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   59A3 DD 7E E6      [19] 2796 	ld	a,-26 (ix)
   59A6 DD 77 EE      [19] 2797 	ld	-18 (ix),a
   59A9 DD 7E E7      [19] 2798 	ld	a,-25 (ix)
   59AC DD 77 EF      [19] 2799 	ld	-17 (ix),a
   59AF DD 7E F4      [19] 2800 	ld	a,-12 (ix)
   59B2 B7            [ 4] 2801 	or	a, a
   59B3 28 0C         [12] 2802 	jr	Z,00142$
   59B5 DD 7E F2      [19] 2803 	ld	a,-14 (ix)
   59B8 DD 77 EE      [19] 2804 	ld	-18 (ix),a
   59BB DD 7E F3      [19] 2805 	ld	a,-13 (ix)
   59BE DD 77 EF      [19] 2806 	ld	-17 (ix),a
   59C1                    2807 00142$:
   59C1 DD CB EF 2E   [23] 2808 	sra	-17 (ix)
   59C5 DD CB EE 1E   [23] 2809 	rr	-18 (ix)
   59C9 DD CB EF 2E   [23] 2810 	sra	-17 (ix)
   59CD DD CB EE 1E   [23] 2811 	rr	-18 (ix)
   59D1 DD CB EF 2E   [23] 2812 	sra	-17 (ix)
   59D5 DD CB EE 1E   [23] 2813 	rr	-18 (ix)
   59D9 DD CB EF 2E   [23] 2814 	sra	-17 (ix)
   59DD DD CB EE 1E   [23] 2815 	rr	-18 (ix)
   59E1 DD 4E EE      [19] 2816 	ld	c,-18 (ix)
   59E4 DD 46 EF      [19] 2817 	ld	b,-17 (ix)
   59E7 69            [ 4] 2818 	ld	l, c
   59E8 60            [ 4] 2819 	ld	h, b
   59E9 29            [11] 2820 	add	hl, hl
   59EA 29            [11] 2821 	add	hl, hl
   59EB 09            [11] 2822 	add	hl, bc
   59EC 29            [11] 2823 	add	hl, hl
   59ED 29            [11] 2824 	add	hl, hl
   59EE DD 75 EE      [19] 2825 	ld	-18 (ix),l
   59F1 DD 74 EF      [19] 2826 	ld	-17 (ix),h
   59F4 3E 36         [ 7] 2827 	ld	a,#<(_scene)
   59F6 DD 86 EE      [19] 2828 	add	a, -18 (ix)
   59F9 DD 77 EE      [19] 2829 	ld	-18 (ix),a
   59FC 3E 90         [ 7] 2830 	ld	a,#>(_scene)
   59FE DD 8E EF      [19] 2831 	adc	a, -17 (ix)
   5A01 DD 77 EF      [19] 2832 	ld	-17 (ix),a
   5A04 DD 7E EA      [19] 2833 	ld	a,-22 (ix)
   5A07 DD 77 F0      [19] 2834 	ld	-16 (ix),a
   5A0A DD 7E EB      [19] 2835 	ld	a,-21 (ix)
   5A0D DD 77 F1      [19] 2836 	ld	-15 (ix),a
   5A10 DD 7E F5      [19] 2837 	ld	a,-11 (ix)
   5A13 B7            [ 4] 2838 	or	a, a
   5A14 28 0C         [12] 2839 	jr	Z,00143$
   5A16 DD 7E E8      [19] 2840 	ld	a,-24 (ix)
   5A19 DD 77 F0      [19] 2841 	ld	-16 (ix),a
   5A1C DD 7E E9      [19] 2842 	ld	a,-23 (ix)
   5A1F DD 77 F1      [19] 2843 	ld	-15 (ix),a
   5A22                    2844 00143$:
   5A22 DD CB F1 2E   [23] 2845 	sra	-15 (ix)
   5A26 DD CB F0 1E   [23] 2846 	rr	-16 (ix)
   5A2A DD CB F1 2E   [23] 2847 	sra	-15 (ix)
   5A2E DD CB F0 1E   [23] 2848 	rr	-16 (ix)
   5A32 DD 7E EE      [19] 2849 	ld	a,-18 (ix)
   5A35 DD 86 F0      [19] 2850 	add	a, -16 (ix)
   5A38 DD 77 EE      [19] 2851 	ld	-18 (ix),a
   5A3B DD 7E EF      [19] 2852 	ld	a,-17 (ix)
   5A3E DD 8E F1      [19] 2853 	adc	a, -15 (ix)
   5A41 DD 77 EF      [19] 2854 	ld	-17 (ix),a
   5A44 DD 6E EE      [19] 2855 	ld	l,-18 (ix)
   5A47 DD 66 EF      [19] 2856 	ld	h,-17 (ix)
   5A4A 7E            [ 7] 2857 	ld	a,(hl)
   5A4B 3D            [ 4] 2858 	dec	a
   5A4C 28 0B         [12] 2859 	jr	Z,00112$
                           2860 ;src/ia.h:52: enemy.x-=1;
   5A4E DD 56 E3      [19] 2861 	ld	d,-29 (ix)
   5A51 15            [ 4] 2862 	dec	d
   5A52 21 47 91      [10] 2863 	ld	hl,#_enemy
   5A55 72            [ 7] 2864 	ld	(hl),d
   5A56 C3 93 5E      [10] 2865 	jp	00139$
   5A59                    2866 00112$:
                           2867 ;src/ia.h:53: }else if(auxY < enemy.y){
   5A59 DD 7E FF      [19] 2868 	ld	a,-1 (ix)
   5A5C B7            [ 4] 2869 	or	a, a
   5A5D CA E7 5A      [10] 2870 	jp	Z,00109$
                           2871 ;src/ia.h:54: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5A60 DD 7E FB      [19] 2872 	ld	a,-5 (ix)
   5A63 DD 77 EE      [19] 2873 	ld	-18 (ix),a
   5A66 DD 7E FC      [19] 2874 	ld	a,-4 (ix)
   5A69 DD 77 EF      [19] 2875 	ld	-17 (ix),a
   5A6C DD 7E FE      [19] 2876 	ld	a,-2 (ix)
   5A6F B7            [ 4] 2877 	or	a, a
   5A70 28 0C         [12] 2878 	jr	Z,00144$
   5A72 DD 7E F8      [19] 2879 	ld	a,-8 (ix)
   5A75 DD 77 EE      [19] 2880 	ld	-18 (ix),a
   5A78 DD 7E F9      [19] 2881 	ld	a,-7 (ix)
   5A7B DD 77 EF      [19] 2882 	ld	-17 (ix),a
   5A7E                    2883 00144$:
   5A7E DD CB EF 2E   [23] 2884 	sra	-17 (ix)
   5A82 DD CB EE 1E   [23] 2885 	rr	-18 (ix)
   5A86 DD CB EF 2E   [23] 2886 	sra	-17 (ix)
   5A8A DD CB EE 1E   [23] 2887 	rr	-18 (ix)
   5A8E DD CB EF 2E   [23] 2888 	sra	-17 (ix)
   5A92 DD CB EE 1E   [23] 2889 	rr	-18 (ix)
   5A96 DD CB EF 2E   [23] 2890 	sra	-17 (ix)
   5A9A DD CB EE 1E   [23] 2891 	rr	-18 (ix)
   5A9E DD 4E EE      [19] 2892 	ld	c,-18 (ix)
   5AA1 DD 46 EF      [19] 2893 	ld	b,-17 (ix)
   5AA4 69            [ 4] 2894 	ld	l, c
   5AA5 60            [ 4] 2895 	ld	h, b
   5AA6 29            [11] 2896 	add	hl, hl
   5AA7 29            [11] 2897 	add	hl, hl
   5AA8 09            [11] 2898 	add	hl, bc
   5AA9 29            [11] 2899 	add	hl, hl
   5AAA 29            [11] 2900 	add	hl, hl
   5AAB DD 75 EE      [19] 2901 	ld	-18 (ix),l
   5AAE DD 74 EF      [19] 2902 	ld	-17 (ix),h
   5AB1 3E 36         [ 7] 2903 	ld	a,#<(_scene)
   5AB3 DD 86 EE      [19] 2904 	add	a, -18 (ix)
   5AB6 DD 77 EE      [19] 2905 	ld	-18 (ix),a
   5AB9 3E 90         [ 7] 2906 	ld	a,#>(_scene)
   5ABB DD 8E EF      [19] 2907 	adc	a, -17 (ix)
   5ABE DD 77 EF      [19] 2908 	ld	-17 (ix),a
   5AC1 DD 7E FD      [19] 2909 	ld	a,-3 (ix)
   5AC4 DD 86 EE      [19] 2910 	add	a, -18 (ix)
   5AC7 DD 77 EE      [19] 2911 	ld	-18 (ix),a
   5ACA 3E 00         [ 7] 2912 	ld	a,#0x00
   5ACC DD 8E EF      [19] 2913 	adc	a, -17 (ix)
   5ACF DD 77 EF      [19] 2914 	ld	-17 (ix),a
   5AD2 DD 6E EE      [19] 2915 	ld	l,-18 (ix)
   5AD5 DD 66 EF      [19] 2916 	ld	h,-17 (ix)
   5AD8 7E            [ 7] 2917 	ld	a,(hl)
   5AD9 3D            [ 4] 2918 	dec	a
   5ADA CA 93 5E      [10] 2919 	jp	Z,00139$
                           2920 ;src/ia.h:55: enemy.y-=1;
   5ADD 21 48 91      [10] 2921 	ld	hl,#(_enemy + 0x0001)
   5AE0 DD 7E ED      [19] 2922 	ld	a,-19 (ix)
   5AE3 77            [ 7] 2923 	ld	(hl),a
   5AE4 C3 93 5E      [10] 2924 	jp	00139$
   5AE7                    2925 00109$:
                           2926 ;src/ia.h:57: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5AE7 DD 7E E6      [19] 2927 	ld	a,-26 (ix)
   5AEA DD 77 EE      [19] 2928 	ld	-18 (ix),a
   5AED DD 7E E7      [19] 2929 	ld	a,-25 (ix)
   5AF0 DD 77 EF      [19] 2930 	ld	-17 (ix),a
   5AF3 DD 7E F4      [19] 2931 	ld	a,-12 (ix)
   5AF6 B7            [ 4] 2932 	or	a, a
   5AF7 28 0C         [12] 2933 	jr	Z,00145$
   5AF9 DD 7E F2      [19] 2934 	ld	a,-14 (ix)
   5AFC DD 77 EE      [19] 2935 	ld	-18 (ix),a
   5AFF DD 7E F3      [19] 2936 	ld	a,-13 (ix)
   5B02 DD 77 EF      [19] 2937 	ld	-17 (ix),a
   5B05                    2938 00145$:
   5B05 DD CB EF 2E   [23] 2939 	sra	-17 (ix)
   5B09 DD CB EE 1E   [23] 2940 	rr	-18 (ix)
   5B0D DD CB EF 2E   [23] 2941 	sra	-17 (ix)
   5B11 DD CB EE 1E   [23] 2942 	rr	-18 (ix)
   5B15 DD CB EF 2E   [23] 2943 	sra	-17 (ix)
   5B19 DD CB EE 1E   [23] 2944 	rr	-18 (ix)
   5B1D DD CB EF 2E   [23] 2945 	sra	-17 (ix)
   5B21 DD CB EE 1E   [23] 2946 	rr	-18 (ix)
   5B25 DD 4E EE      [19] 2947 	ld	c,-18 (ix)
   5B28 DD 46 EF      [19] 2948 	ld	b,-17 (ix)
   5B2B 69            [ 4] 2949 	ld	l, c
   5B2C 60            [ 4] 2950 	ld	h, b
   5B2D 29            [11] 2951 	add	hl, hl
   5B2E 29            [11] 2952 	add	hl, hl
   5B2F 09            [11] 2953 	add	hl, bc
   5B30 29            [11] 2954 	add	hl, hl
   5B31 29            [11] 2955 	add	hl, hl
   5B32 DD 75 EE      [19] 2956 	ld	-18 (ix),l
   5B35 DD 74 EF      [19] 2957 	ld	-17 (ix),h
   5B38 3E 36         [ 7] 2958 	ld	a,#<(_scene)
   5B3A DD 86 EE      [19] 2959 	add	a, -18 (ix)
   5B3D DD 77 EE      [19] 2960 	ld	-18 (ix),a
   5B40 3E 90         [ 7] 2961 	ld	a,#>(_scene)
   5B42 DD 8E EF      [19] 2962 	adc	a, -17 (ix)
   5B45 DD 77 EF      [19] 2963 	ld	-17 (ix),a
   5B48 DD 7E FD      [19] 2964 	ld	a,-3 (ix)
   5B4B DD 86 EE      [19] 2965 	add	a, -18 (ix)
   5B4E DD 77 EE      [19] 2966 	ld	-18 (ix),a
   5B51 3E 00         [ 7] 2967 	ld	a,#0x00
   5B53 DD 8E EF      [19] 2968 	adc	a, -17 (ix)
   5B56 DD 77 EF      [19] 2969 	ld	-17 (ix),a
   5B59 DD 6E EE      [19] 2970 	ld	l,-18 (ix)
   5B5C DD 66 EF      [19] 2971 	ld	h,-17 (ix)
   5B5F 7E            [ 7] 2972 	ld	a,(hl)
   5B60 3D            [ 4] 2973 	dec	a
   5B61 CA 93 5E      [10] 2974 	jp	Z,00139$
                           2975 ;src/ia.h:58: enemy.y+=1;
   5B64 21 48 91      [10] 2976 	ld	hl,#(_enemy + 0x0001)
   5B67 DD 7E EC      [19] 2977 	ld	a,-20 (ix)
   5B6A 77            [ 7] 2978 	ld	(hl),a
   5B6B C3 93 5E      [10] 2979 	jp	00139$
   5B6E                    2980 00137$:
                           2981 ;src/ia.h:60: }else if(auxX > enemy.x){
   5B6E DD 7E E3      [19] 2982 	ld	a,-29 (ix)
   5B71 DD 96 E2      [19] 2983 	sub	a, -30 (ix)
   5B74 D2 7C 5D      [10] 2984 	jp	NC,00134$
                           2985 ;src/ia.h:61: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
   5B77 3E 36         [ 7] 2986 	ld	a,#<(_scene)
   5B79 DD 86 F6      [19] 2987 	add	a, -10 (ix)
   5B7C DD 77 EE      [19] 2988 	ld	-18 (ix),a
   5B7F 3E 90         [ 7] 2989 	ld	a,#>(_scene)
   5B81 DD 8E F7      [19] 2990 	adc	a, -9 (ix)
   5B84 DD 77 EF      [19] 2991 	ld	-17 (ix),a
   5B87 DD 7E E4      [19] 2992 	ld	a,-28 (ix)
   5B8A C6 04         [ 7] 2993 	add	a, #0x04
   5B8C DD 77 F0      [19] 2994 	ld	-16 (ix),a
   5B8F DD 7E E5      [19] 2995 	ld	a,-27 (ix)
   5B92 CE 00         [ 7] 2996 	adc	a, #0x00
   5B94 DD 77 F1      [19] 2997 	ld	-15 (ix),a
   5B97 DD 7E F0      [19] 2998 	ld	a,-16 (ix)
   5B9A DD 77 F6      [19] 2999 	ld	-10 (ix),a
   5B9D DD 7E F1      [19] 3000 	ld	a,-15 (ix)
   5BA0 DD 77 F7      [19] 3001 	ld	-9 (ix),a
   5BA3 DD 7E F1      [19] 3002 	ld	a,-15 (ix)
   5BA6 07            [ 4] 3003 	rlca
   5BA7 E6 01         [ 7] 3004 	and	a,#0x01
   5BA9 DD 77 FA      [19] 3005 	ld	-6 (ix),a
   5BAC DD 7E E4      [19] 3006 	ld	a,-28 (ix)
   5BAF C6 07         [ 7] 3007 	add	a, #0x07
   5BB1 DD 77 E4      [19] 3008 	ld	-28 (ix),a
   5BB4 DD 7E E5      [19] 3009 	ld	a,-27 (ix)
   5BB7 CE 00         [ 7] 3010 	adc	a, #0x00
   5BB9 DD 77 E5      [19] 3011 	ld	-27 (ix),a
   5BBC DD 7E FA      [19] 3012 	ld	a,-6 (ix)
   5BBF B7            [ 4] 3013 	or	a, a
   5BC0 28 0C         [12] 3014 	jr	Z,00146$
   5BC2 DD 7E E4      [19] 3015 	ld	a,-28 (ix)
   5BC5 DD 77 F6      [19] 3016 	ld	-10 (ix),a
   5BC8 DD 7E E5      [19] 3017 	ld	a,-27 (ix)
   5BCB DD 77 F7      [19] 3018 	ld	-9 (ix),a
   5BCE                    3019 00146$:
   5BCE DD 6E F6      [19] 3020 	ld	l,-10 (ix)
   5BD1 DD 66 F7      [19] 3021 	ld	h,-9 (ix)
   5BD4 CB 2C         [ 8] 3022 	sra	h
   5BD6 CB 1D         [ 8] 3023 	rr	l
   5BD8 CB 2C         [ 8] 3024 	sra	h
   5BDA CB 1D         [ 8] 3025 	rr	l
   5BDC DD 5E EE      [19] 3026 	ld	e,-18 (ix)
   5BDF DD 56 EF      [19] 3027 	ld	d,-17 (ix)
   5BE2 19            [11] 3028 	add	hl,de
   5BE3 7E            [ 7] 3029 	ld	a,(hl)
   5BE4 3D            [ 4] 3030 	dec	a
   5BE5 CA 94 5C      [10] 3031 	jp	Z,00123$
                           3032 ;src/ia.h:62: && scene[(enemy.y+tileheight)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   5BE8 DD 7E E6      [19] 3033 	ld	a,-26 (ix)
   5BEB DD 77 F6      [19] 3034 	ld	-10 (ix),a
   5BEE DD 7E E7      [19] 3035 	ld	a,-25 (ix)
   5BF1 DD 77 F7      [19] 3036 	ld	-9 (ix),a
   5BF4 DD 7E F4      [19] 3037 	ld	a,-12 (ix)
   5BF7 B7            [ 4] 3038 	or	a, a
   5BF8 28 0C         [12] 3039 	jr	Z,00147$
   5BFA DD 7E F2      [19] 3040 	ld	a,-14 (ix)
   5BFD DD 77 F6      [19] 3041 	ld	-10 (ix),a
   5C00 DD 7E F3      [19] 3042 	ld	a,-13 (ix)
   5C03 DD 77 F7      [19] 3043 	ld	-9 (ix),a
   5C06                    3044 00147$:
   5C06 DD CB F7 2E   [23] 3045 	sra	-9 (ix)
   5C0A DD CB F6 1E   [23] 3046 	rr	-10 (ix)
   5C0E DD CB F7 2E   [23] 3047 	sra	-9 (ix)
   5C12 DD CB F6 1E   [23] 3048 	rr	-10 (ix)
   5C16 DD CB F7 2E   [23] 3049 	sra	-9 (ix)
   5C1A DD CB F6 1E   [23] 3050 	rr	-10 (ix)
   5C1E DD CB F7 2E   [23] 3051 	sra	-9 (ix)
   5C22 DD CB F6 1E   [23] 3052 	rr	-10 (ix)
   5C26 DD 4E F6      [19] 3053 	ld	c,-10 (ix)
   5C29 DD 46 F7      [19] 3054 	ld	b,-9 (ix)
   5C2C 69            [ 4] 3055 	ld	l, c
   5C2D 60            [ 4] 3056 	ld	h, b
   5C2E 29            [11] 3057 	add	hl, hl
   5C2F 29            [11] 3058 	add	hl, hl
   5C30 09            [11] 3059 	add	hl, bc
   5C31 29            [11] 3060 	add	hl, hl
   5C32 29            [11] 3061 	add	hl, hl
   5C33 DD 75 F6      [19] 3062 	ld	-10 (ix),l
   5C36 DD 74 F7      [19] 3063 	ld	-9 (ix),h
   5C39 3E 36         [ 7] 3064 	ld	a,#<(_scene)
   5C3B DD 86 F6      [19] 3065 	add	a, -10 (ix)
   5C3E DD 77 F6      [19] 3066 	ld	-10 (ix),a
   5C41 3E 90         [ 7] 3067 	ld	a,#>(_scene)
   5C43 DD 8E F7      [19] 3068 	adc	a, -9 (ix)
   5C46 DD 77 F7      [19] 3069 	ld	-9 (ix),a
   5C49 DD 7E FA      [19] 3070 	ld	a,-6 (ix)
   5C4C B7            [ 4] 3071 	or	a, a
   5C4D 28 0C         [12] 3072 	jr	Z,00148$
   5C4F DD 7E E4      [19] 3073 	ld	a,-28 (ix)
   5C52 DD 77 F0      [19] 3074 	ld	-16 (ix),a
   5C55 DD 7E E5      [19] 3075 	ld	a,-27 (ix)
   5C58 DD 77 F1      [19] 3076 	ld	-15 (ix),a
   5C5B                    3077 00148$:
   5C5B DD CB F1 2E   [23] 3078 	sra	-15 (ix)
   5C5F DD CB F0 1E   [23] 3079 	rr	-16 (ix)
   5C63 DD CB F1 2E   [23] 3080 	sra	-15 (ix)
   5C67 DD CB F0 1E   [23] 3081 	rr	-16 (ix)
   5C6B DD 7E F6      [19] 3082 	ld	a,-10 (ix)
   5C6E DD 86 F0      [19] 3083 	add	a, -16 (ix)
   5C71 DD 77 F0      [19] 3084 	ld	-16 (ix),a
   5C74 DD 7E F7      [19] 3085 	ld	a,-9 (ix)
   5C77 DD 8E F1      [19] 3086 	adc	a, -15 (ix)
   5C7A DD 77 F1      [19] 3087 	ld	-15 (ix),a
   5C7D DD 6E F0      [19] 3088 	ld	l,-16 (ix)
   5C80 DD 66 F1      [19] 3089 	ld	h,-15 (ix)
   5C83 7E            [ 7] 3090 	ld	a,(hl)
   5C84 DD 77 FA      [19] 3091 	ld	-6 (ix), a
   5C87 3D            [ 4] 3092 	dec	a
   5C88 28 0A         [12] 3093 	jr	Z,00123$
                           3094 ;src/ia.h:63: enemy.x+=1;
   5C8A DD 7E E3      [19] 3095 	ld	a,-29 (ix)
   5C8D 3C            [ 4] 3096 	inc	a
   5C8E 32 47 91      [13] 3097 	ld	(#_enemy),a
   5C91 C3 93 5E      [10] 3098 	jp	00139$
   5C94                    3099 00123$:
                           3100 ;src/ia.h:64: }else if(auxY < enemy.y){
   5C94 DD 7E FF      [19] 3101 	ld	a,-1 (ix)
   5C97 B7            [ 4] 3102 	or	a, a
   5C98 28 58         [12] 3103 	jr	Z,00120$
                           3104 ;src/ia.h:65: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   5C9A DD 7E EA      [19] 3105 	ld	a,-22 (ix)
   5C9D DD 77 F0      [19] 3106 	ld	-16 (ix),a
   5CA0 DD 7E EB      [19] 3107 	ld	a,-21 (ix)
   5CA3 DD 77 F1      [19] 3108 	ld	-15 (ix),a
   5CA6 DD 7E F5      [19] 3109 	ld	a,-11 (ix)
   5CA9 B7            [ 4] 3110 	or	a, a
   5CAA 28 0C         [12] 3111 	jr	Z,00149$
   5CAC DD 7E E8      [19] 3112 	ld	a,-24 (ix)
   5CAF DD 77 F0      [19] 3113 	ld	-16 (ix),a
   5CB2 DD 7E E9      [19] 3114 	ld	a,-23 (ix)
   5CB5 DD 77 F1      [19] 3115 	ld	-15 (ix),a
   5CB8                    3116 00149$:
   5CB8 DD CB F1 2E   [23] 3117 	sra	-15 (ix)
   5CBC DD CB F0 1E   [23] 3118 	rr	-16 (ix)
   5CC0 DD CB F1 2E   [23] 3119 	sra	-15 (ix)
   5CC4 DD CB F0 1E   [23] 3120 	rr	-16 (ix)
   5CC8 DD 7E F0      [19] 3121 	ld	a,-16 (ix)
   5CCB DD 86 EE      [19] 3122 	add	a, -18 (ix)
   5CCE DD 77 EE      [19] 3123 	ld	-18 (ix),a
   5CD1 DD 7E F1      [19] 3124 	ld	a,-15 (ix)
   5CD4 DD 8E EF      [19] 3125 	adc	a, -17 (ix)
   5CD7 DD 77 EF      [19] 3126 	ld	-17 (ix),a
   5CDA DD 6E EE      [19] 3127 	ld	l,-18 (ix)
   5CDD DD 66 EF      [19] 3128 	ld	h,-17 (ix)
   5CE0 7E            [ 7] 3129 	ld	a,(hl)
   5CE1 DD 77 FA      [19] 3130 	ld	-6 (ix), a
   5CE4 3D            [ 4] 3131 	dec	a
   5CE5 CA 93 5E      [10] 3132 	jp	Z,00139$
                           3133 ;src/ia.h:66: enemy.y-=1;
   5CE8 21 48 91      [10] 3134 	ld	hl,#(_enemy + 0x0001)
   5CEB DD 7E ED      [19] 3135 	ld	a,-19 (ix)
   5CEE 77            [ 7] 3136 	ld	(hl),a
   5CEF C3 93 5E      [10] 3137 	jp	00139$
   5CF2                    3138 00120$:
                           3139 ;src/ia.h:68: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5CF2 DD 7E E6      [19] 3140 	ld	a,-26 (ix)
   5CF5 DD 77 EE      [19] 3141 	ld	-18 (ix),a
   5CF8 DD 7E E7      [19] 3142 	ld	a,-25 (ix)
   5CFB DD 77 EF      [19] 3143 	ld	-17 (ix),a
   5CFE DD 7E F4      [19] 3144 	ld	a,-12 (ix)
   5D01 B7            [ 4] 3145 	or	a, a
   5D02 28 0C         [12] 3146 	jr	Z,00150$
   5D04 DD 7E F2      [19] 3147 	ld	a,-14 (ix)
   5D07 DD 77 EE      [19] 3148 	ld	-18 (ix),a
   5D0A DD 7E F3      [19] 3149 	ld	a,-13 (ix)
   5D0D DD 77 EF      [19] 3150 	ld	-17 (ix),a
   5D10                    3151 00150$:
   5D10 DD CB EF 2E   [23] 3152 	sra	-17 (ix)
   5D14 DD CB EE 1E   [23] 3153 	rr	-18 (ix)
   5D18 DD CB EF 2E   [23] 3154 	sra	-17 (ix)
   5D1C DD CB EE 1E   [23] 3155 	rr	-18 (ix)
   5D20 DD CB EF 2E   [23] 3156 	sra	-17 (ix)
   5D24 DD CB EE 1E   [23] 3157 	rr	-18 (ix)
   5D28 DD CB EF 2E   [23] 3158 	sra	-17 (ix)
   5D2C DD CB EE 1E   [23] 3159 	rr	-18 (ix)
   5D30 DD 4E EE      [19] 3160 	ld	c,-18 (ix)
   5D33 DD 46 EF      [19] 3161 	ld	b,-17 (ix)
   5D36 69            [ 4] 3162 	ld	l, c
   5D37 60            [ 4] 3163 	ld	h, b
   5D38 29            [11] 3164 	add	hl, hl
   5D39 29            [11] 3165 	add	hl, hl
   5D3A 09            [11] 3166 	add	hl, bc
   5D3B 29            [11] 3167 	add	hl, hl
   5D3C 29            [11] 3168 	add	hl, hl
   5D3D DD 75 EE      [19] 3169 	ld	-18 (ix),l
   5D40 DD 74 EF      [19] 3170 	ld	-17 (ix),h
   5D43 3E 36         [ 7] 3171 	ld	a,#<(_scene)
   5D45 DD 86 EE      [19] 3172 	add	a, -18 (ix)
   5D48 DD 77 EE      [19] 3173 	ld	-18 (ix),a
   5D4B 3E 90         [ 7] 3174 	ld	a,#>(_scene)
   5D4D DD 8E EF      [19] 3175 	adc	a, -17 (ix)
   5D50 DD 77 EF      [19] 3176 	ld	-17 (ix),a
   5D53 DD 7E EE      [19] 3177 	ld	a,-18 (ix)
   5D56 DD 86 FD      [19] 3178 	add	a, -3 (ix)
   5D59 DD 77 EE      [19] 3179 	ld	-18 (ix),a
   5D5C DD 7E EF      [19] 3180 	ld	a,-17 (ix)
   5D5F CE 00         [ 7] 3181 	adc	a, #0x00
   5D61 DD 77 EF      [19] 3182 	ld	-17 (ix),a
   5D64 DD 6E EE      [19] 3183 	ld	l,-18 (ix)
   5D67 DD 66 EF      [19] 3184 	ld	h,-17 (ix)
   5D6A 7E            [ 7] 3185 	ld	a,(hl)
   5D6B DD 77 FA      [19] 3186 	ld	-6 (ix), a
   5D6E 3D            [ 4] 3187 	dec	a
   5D6F CA 93 5E      [10] 3188 	jp	Z,00139$
                           3189 ;src/ia.h:69: enemy.y+=1;
   5D72 21 48 91      [10] 3190 	ld	hl,#(_enemy + 0x0001)
   5D75 DD 7E EC      [19] 3191 	ld	a,-20 (ix)
   5D78 77            [ 7] 3192 	ld	(hl),a
   5D79 C3 93 5E      [10] 3193 	jp	00139$
   5D7C                    3194 00134$:
                           3195 ;src/ia.h:73: if(auxY < enemy.y){
   5D7C DD 7E FF      [19] 3196 	ld	a,-1 (ix)
   5D7F B7            [ 4] 3197 	or	a, a
   5D80 CA 0D 5E      [10] 3198 	jp	Z,00131$
                           3199 ;src/ia.h:74: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5D83 DD 7E FB      [19] 3200 	ld	a,-5 (ix)
   5D86 DD 77 EE      [19] 3201 	ld	-18 (ix),a
   5D89 DD 7E FC      [19] 3202 	ld	a,-4 (ix)
   5D8C DD 77 EF      [19] 3203 	ld	-17 (ix),a
   5D8F DD 7E FE      [19] 3204 	ld	a,-2 (ix)
   5D92 B7            [ 4] 3205 	or	a, a
   5D93 28 0C         [12] 3206 	jr	Z,00151$
   5D95 DD 7E F8      [19] 3207 	ld	a,-8 (ix)
   5D98 DD 77 EE      [19] 3208 	ld	-18 (ix),a
   5D9B DD 7E F9      [19] 3209 	ld	a,-7 (ix)
   5D9E DD 77 EF      [19] 3210 	ld	-17 (ix),a
   5DA1                    3211 00151$:
   5DA1 DD CB EF 2E   [23] 3212 	sra	-17 (ix)
   5DA5 DD CB EE 1E   [23] 3213 	rr	-18 (ix)
   5DA9 DD CB EF 2E   [23] 3214 	sra	-17 (ix)
   5DAD DD CB EE 1E   [23] 3215 	rr	-18 (ix)
   5DB1 DD CB EF 2E   [23] 3216 	sra	-17 (ix)
   5DB5 DD CB EE 1E   [23] 3217 	rr	-18 (ix)
   5DB9 DD CB EF 2E   [23] 3218 	sra	-17 (ix)
   5DBD DD CB EE 1E   [23] 3219 	rr	-18 (ix)
   5DC1 DD 4E EE      [19] 3220 	ld	c,-18 (ix)
   5DC4 DD 46 EF      [19] 3221 	ld	b,-17 (ix)
   5DC7 69            [ 4] 3222 	ld	l, c
   5DC8 60            [ 4] 3223 	ld	h, b
   5DC9 29            [11] 3224 	add	hl, hl
   5DCA 29            [11] 3225 	add	hl, hl
   5DCB 09            [11] 3226 	add	hl, bc
   5DCC 29            [11] 3227 	add	hl, hl
   5DCD 29            [11] 3228 	add	hl, hl
   5DCE DD 75 EE      [19] 3229 	ld	-18 (ix),l
   5DD1 DD 74 EF      [19] 3230 	ld	-17 (ix),h
   5DD4 3E 36         [ 7] 3231 	ld	a,#<(_scene)
   5DD6 DD 86 EE      [19] 3232 	add	a, -18 (ix)
   5DD9 DD 77 EE      [19] 3233 	ld	-18 (ix),a
   5DDC 3E 90         [ 7] 3234 	ld	a,#>(_scene)
   5DDE DD 8E EF      [19] 3235 	adc	a, -17 (ix)
   5DE1 DD 77 EF      [19] 3236 	ld	-17 (ix),a
   5DE4 DD 7E EE      [19] 3237 	ld	a,-18 (ix)
   5DE7 DD 86 FD      [19] 3238 	add	a, -3 (ix)
   5DEA DD 77 EE      [19] 3239 	ld	-18 (ix),a
   5DED DD 7E EF      [19] 3240 	ld	a,-17 (ix)
   5DF0 CE 00         [ 7] 3241 	adc	a, #0x00
   5DF2 DD 77 EF      [19] 3242 	ld	-17 (ix),a
   5DF5 DD 6E EE      [19] 3243 	ld	l,-18 (ix)
   5DF8 DD 66 EF      [19] 3244 	ld	h,-17 (ix)
   5DFB 7E            [ 7] 3245 	ld	a,(hl)
   5DFC DD 77 FA      [19] 3246 	ld	-6 (ix), a
   5DFF 3D            [ 4] 3247 	dec	a
   5E00 CA 93 5E      [10] 3248 	jp	Z,00139$
                           3249 ;src/ia.h:75: enemy.y-=1;
   5E03 21 48 91      [10] 3250 	ld	hl,#(_enemy + 0x0001)
   5E06 DD 7E ED      [19] 3251 	ld	a,-19 (ix)
   5E09 77            [ 7] 3252 	ld	(hl),a
   5E0A C3 93 5E      [10] 3253 	jp	00139$
   5E0D                    3254 00131$:
                           3255 ;src/ia.h:77: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5E0D DD 7E E6      [19] 3256 	ld	a,-26 (ix)
   5E10 DD 77 EE      [19] 3257 	ld	-18 (ix),a
   5E13 DD 7E E7      [19] 3258 	ld	a,-25 (ix)
   5E16 DD 77 EF      [19] 3259 	ld	-17 (ix),a
   5E19 DD 7E F4      [19] 3260 	ld	a,-12 (ix)
   5E1C B7            [ 4] 3261 	or	a, a
   5E1D 28 0C         [12] 3262 	jr	Z,00152$
   5E1F DD 7E F2      [19] 3263 	ld	a,-14 (ix)
   5E22 DD 77 EE      [19] 3264 	ld	-18 (ix),a
   5E25 DD 7E F3      [19] 3265 	ld	a,-13 (ix)
   5E28 DD 77 EF      [19] 3266 	ld	-17 (ix),a
   5E2B                    3267 00152$:
   5E2B DD CB EF 2E   [23] 3268 	sra	-17 (ix)
   5E2F DD CB EE 1E   [23] 3269 	rr	-18 (ix)
   5E33 DD CB EF 2E   [23] 3270 	sra	-17 (ix)
   5E37 DD CB EE 1E   [23] 3271 	rr	-18 (ix)
   5E3B DD CB EF 2E   [23] 3272 	sra	-17 (ix)
   5E3F DD CB EE 1E   [23] 3273 	rr	-18 (ix)
   5E43 DD CB EF 2E   [23] 3274 	sra	-17 (ix)
   5E47 DD CB EE 1E   [23] 3275 	rr	-18 (ix)
   5E4B DD 4E EE      [19] 3276 	ld	c,-18 (ix)
   5E4E DD 46 EF      [19] 3277 	ld	b,-17 (ix)
   5E51 69            [ 4] 3278 	ld	l, c
   5E52 60            [ 4] 3279 	ld	h, b
   5E53 29            [11] 3280 	add	hl, hl
   5E54 29            [11] 3281 	add	hl, hl
   5E55 09            [11] 3282 	add	hl, bc
   5E56 29            [11] 3283 	add	hl, hl
   5E57 29            [11] 3284 	add	hl, hl
   5E58 DD 75 EE      [19] 3285 	ld	-18 (ix),l
   5E5B DD 74 EF      [19] 3286 	ld	-17 (ix),h
   5E5E 3E 36         [ 7] 3287 	ld	a,#<(_scene)
   5E60 DD 86 EE      [19] 3288 	add	a, -18 (ix)
   5E63 DD 77 EE      [19] 3289 	ld	-18 (ix),a
   5E66 3E 90         [ 7] 3290 	ld	a,#>(_scene)
   5E68 DD 8E EF      [19] 3291 	adc	a, -17 (ix)
   5E6B DD 77 EF      [19] 3292 	ld	-17 (ix),a
   5E6E DD 7E FD      [19] 3293 	ld	a,-3 (ix)
   5E71 DD 86 EE      [19] 3294 	add	a, -18 (ix)
   5E74 DD 77 EE      [19] 3295 	ld	-18 (ix),a
   5E77 3E 00         [ 7] 3296 	ld	a,#0x00
   5E79 DD 8E EF      [19] 3297 	adc	a, -17 (ix)
   5E7C DD 77 EF      [19] 3298 	ld	-17 (ix),a
   5E7F DD 6E EE      [19] 3299 	ld	l,-18 (ix)
   5E82 DD 66 EF      [19] 3300 	ld	h,-17 (ix)
   5E85 7E            [ 7] 3301 	ld	a,(hl)
   5E86 DD 77 FA      [19] 3302 	ld	-6 (ix), a
   5E89 3D            [ 4] 3303 	dec	a
   5E8A 28 07         [12] 3304 	jr	Z,00139$
                           3305 ;src/ia.h:78: enemy.y+=1;
   5E8C 21 48 91      [10] 3306 	ld	hl,#(_enemy + 0x0001)
   5E8F DD 7E EC      [19] 3307 	ld	a,-20 (ix)
   5E92 77            [ 7] 3308 	ld	(hl),a
   5E93                    3309 00139$:
   5E93 DD F9         [10] 3310 	ld	sp, ix
   5E95 DD E1         [14] 3311 	pop	ix
   5E97 C9            [10] 3312 	ret
                           3313 ;src/ia.h:83: void patrol(){
                           3314 ;	---------------------------------
                           3315 ; Function patrol
                           3316 ; ---------------------------------
   5E98                    3317 _patrol::
   5E98 DD E5         [15] 3318 	push	ix
   5E9A DD 21 00 00   [14] 3319 	ld	ix,#0
   5E9E DD 39         [15] 3320 	add	ix,sp
   5EA0 21 F4 FF      [10] 3321 	ld	hl,#-12
   5EA3 39            [11] 3322 	add	hl,sp
   5EA4 F9            [ 6] 3323 	ld	sp,hl
                           3324 ;src/ia.h:84: movement(enemy.dir);
   5EA5 3A 50 91      [13] 3325 	ld	a, (#(_enemy + 0x0009) + 0)
   5EA8 F5            [11] 3326 	push	af
   5EA9 33            [ 6] 3327 	inc	sp
   5EAA CD E2 57      [17] 3328 	call	_movement
   5EAD 33            [ 6] 3329 	inc	sp
                           3330 ;src/ia.h:86: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   5EAE 3A 48 91      [13] 3331 	ld	a,(#_enemy + 1)
   5EB1 DD 77 F6      [19] 3332 	ld	-10 (ix), a
   5EB4 07            [ 4] 3333 	rlca
   5EB5 07            [ 4] 3334 	rlca
   5EB6 07            [ 4] 3335 	rlca
   5EB7 07            [ 4] 3336 	rlca
   5EB8 E6 0F         [ 7] 3337 	and	a,#0x0F
   5EBA 4F            [ 4] 3338 	ld	c,a
   5EBB 06 00         [ 7] 3339 	ld	b,#0x00
   5EBD 69            [ 4] 3340 	ld	l, c
   5EBE 60            [ 4] 3341 	ld	h, b
   5EBF 29            [11] 3342 	add	hl, hl
   5EC0 29            [11] 3343 	add	hl, hl
   5EC1 09            [11] 3344 	add	hl, bc
   5EC2 29            [11] 3345 	add	hl, hl
   5EC3 29            [11] 3346 	add	hl, hl
   5EC4 3E 36         [ 7] 3347 	ld	a,#<(_scene)
   5EC6 85            [ 4] 3348 	add	a, l
   5EC7 DD 77 F4      [19] 3349 	ld	-12 (ix),a
   5ECA 3E 90         [ 7] 3350 	ld	a,#>(_scene)
   5ECC 8C            [ 4] 3351 	adc	a, h
   5ECD DD 77 F5      [19] 3352 	ld	-11 (ix),a
   5ED0 3A 47 91      [13] 3353 	ld	a,(#_enemy + 0)
   5ED3 DD 77 FC      [19] 3354 	ld	-4 (ix), a
   5ED6 0F            [ 4] 3355 	rrca
   5ED7 0F            [ 4] 3356 	rrca
   5ED8 E6 3F         [ 7] 3357 	and	a,#0x3F
   5EDA DD 77 F9      [19] 3358 	ld	-7 (ix),a
   5EDD DD 7E F4      [19] 3359 	ld	a,-12 (ix)
   5EE0 DD 86 F9      [19] 3360 	add	a, -7 (ix)
   5EE3 5F            [ 4] 3361 	ld	e,a
   5EE4 DD 7E F5      [19] 3362 	ld	a,-11 (ix)
   5EE7 CE 00         [ 7] 3363 	adc	a, #0x00
   5EE9 57            [ 4] 3364 	ld	d,a
   5EEA 3A 51 91      [13] 3365 	ld	a,(#_enemy + 10)
   5EED DD 77 FD      [19] 3366 	ld	-3 (ix),a
   5EF0 1A            [ 7] 3367 	ld	a,(de)
   5EF1 57            [ 4] 3368 	ld	d,a
   5EF2 DD 7E FD      [19] 3369 	ld	a,-3 (ix)
   5EF5 92            [ 4] 3370 	sub	a, d
   5EF6 C2 F2 5F      [10] 3371 	jp	NZ,00106$
                           3372 ;src/ia.h:87: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5EF9 DD 5E FC      [19] 3373 	ld	e,-4 (ix)
   5EFC 16 00         [ 7] 3374 	ld	d,#0x00
   5EFE 21 03 00      [10] 3375 	ld	hl,#0x0003
   5F01 19            [11] 3376 	add	hl,de
   5F02 DD 75 F7      [19] 3377 	ld	-9 (ix),l
   5F05 DD 74 F8      [19] 3378 	ld	-8 (ix),h
   5F08 DD 7E F7      [19] 3379 	ld	a,-9 (ix)
   5F0B DD 77 FE      [19] 3380 	ld	-2 (ix),a
   5F0E DD 7E F8      [19] 3381 	ld	a,-8 (ix)
   5F11 DD 77 FF      [19] 3382 	ld	-1 (ix),a
   5F14 DD 7E F8      [19] 3383 	ld	a,-8 (ix)
   5F17 07            [ 4] 3384 	rlca
   5F18 E6 01         [ 7] 3385 	and	a,#0x01
   5F1A DD 77 FC      [19] 3386 	ld	-4 (ix),a
   5F1D 21 06 00      [10] 3387 	ld	hl,#0x0006
   5F20 19            [11] 3388 	add	hl,de
   5F21 DD 75 FA      [19] 3389 	ld	-6 (ix),l
   5F24 DD 74 FB      [19] 3390 	ld	-5 (ix),h
   5F27 DD 7E FC      [19] 3391 	ld	a,-4 (ix)
   5F2A B7            [ 4] 3392 	or	a, a
   5F2B 28 0C         [12] 3393 	jr	Z,00113$
   5F2D DD 7E FA      [19] 3394 	ld	a,-6 (ix)
   5F30 DD 77 FE      [19] 3395 	ld	-2 (ix),a
   5F33 DD 7E FB      [19] 3396 	ld	a,-5 (ix)
   5F36 DD 77 FF      [19] 3397 	ld	-1 (ix),a
   5F39                    3398 00113$:
   5F39 DD 6E FE      [19] 3399 	ld	l,-2 (ix)
   5F3C DD 66 FF      [19] 3400 	ld	h,-1 (ix)
   5F3F CB 2C         [ 8] 3401 	sra	h
   5F41 CB 1D         [ 8] 3402 	rr	l
   5F43 CB 2C         [ 8] 3403 	sra	h
   5F45 CB 1D         [ 8] 3404 	rr	l
   5F47 D1            [10] 3405 	pop	de
   5F48 D5            [11] 3406 	push	de
   5F49 19            [11] 3407 	add	hl,de
   5F4A DD 7E FD      [19] 3408 	ld	a,-3 (ix)
   5F4D 96            [ 7] 3409 	sub	a,(hl)
   5F4E C2 F2 5F      [10] 3410 	jp	NZ,00106$
                           3411 ;src/ia.h:88: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   5F51 DD 5E F6      [19] 3412 	ld	e,-10 (ix)
   5F54 16 00         [ 7] 3413 	ld	d,#0x00
   5F56 21 0E 00      [10] 3414 	ld	hl,#0x000E
   5F59 19            [11] 3415 	add	hl,de
   5F5A 4D            [ 4] 3416 	ld	c,l
   5F5B 44            [ 4] 3417 	ld	b,h
   5F5C 69            [ 4] 3418 	ld	l, c
   5F5D 78            [ 4] 3419 	ld	a,b
   5F5E 67            [ 4] 3420 	ld	h,a
   5F5F 07            [ 4] 3421 	rlca
   5F60 E6 01         [ 7] 3422 	and	a,#0x01
   5F62 DD 77 FE      [19] 3423 	ld	-2 (ix),a
   5F65 7B            [ 4] 3424 	ld	a,e
   5F66 C6 1D         [ 7] 3425 	add	a, #0x1D
   5F68 DD 77 F4      [19] 3426 	ld	-12 (ix),a
   5F6B 7A            [ 4] 3427 	ld	a,d
   5F6C CE 00         [ 7] 3428 	adc	a, #0x00
   5F6E DD 77 F5      [19] 3429 	ld	-11 (ix),a
   5F71 DD 7E FE      [19] 3430 	ld	a,-2 (ix)
   5F74 B7            [ 4] 3431 	or	a, a
   5F75 28 02         [12] 3432 	jr	Z,00114$
   5F77 E1            [10] 3433 	pop	hl
   5F78 E5            [11] 3434 	push	hl
   5F79                    3435 00114$:
   5F79 CB 2C         [ 8] 3436 	sra	h
   5F7B CB 1D         [ 8] 3437 	rr	l
   5F7D CB 2C         [ 8] 3438 	sra	h
   5F7F CB 1D         [ 8] 3439 	rr	l
   5F81 CB 2C         [ 8] 3440 	sra	h
   5F83 CB 1D         [ 8] 3441 	rr	l
   5F85 CB 2C         [ 8] 3442 	sra	h
   5F87 CB 1D         [ 8] 3443 	rr	l
   5F89 5D            [ 4] 3444 	ld	e, l
   5F8A 54            [ 4] 3445 	ld	d, h
   5F8B 29            [11] 3446 	add	hl, hl
   5F8C 29            [11] 3447 	add	hl, hl
   5F8D 19            [11] 3448 	add	hl, de
   5F8E 29            [11] 3449 	add	hl, hl
   5F8F 29            [11] 3450 	add	hl, hl
   5F90 11 36 90      [10] 3451 	ld	de,#_scene
   5F93 19            [11] 3452 	add	hl,de
   5F94 DD 5E F9      [19] 3453 	ld	e,-7 (ix)
   5F97 16 00         [ 7] 3454 	ld	d,#0x00
   5F99 19            [11] 3455 	add	hl,de
   5F9A DD 7E FD      [19] 3456 	ld	a,-3 (ix)
   5F9D 96            [ 7] 3457 	sub	a,(hl)
   5F9E 20 52         [12] 3458 	jr	NZ,00106$
                           3459 ;src/ia.h:89: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5FA0 DD 7E FE      [19] 3460 	ld	a,-2 (ix)
   5FA3 B7            [ 4] 3461 	or	a, a
   5FA4 28 02         [12] 3462 	jr	Z,00115$
   5FA6 C1            [10] 3463 	pop	bc
   5FA7 C5            [11] 3464 	push	bc
   5FA8                    3465 00115$:
   5FA8 CB 28         [ 8] 3466 	sra	b
   5FAA CB 19         [ 8] 3467 	rr	c
   5FAC CB 28         [ 8] 3468 	sra	b
   5FAE CB 19         [ 8] 3469 	rr	c
   5FB0 CB 28         [ 8] 3470 	sra	b
   5FB2 CB 19         [ 8] 3471 	rr	c
   5FB4 CB 28         [ 8] 3472 	sra	b
   5FB6 CB 19         [ 8] 3473 	rr	c
   5FB8 69            [ 4] 3474 	ld	l, c
   5FB9 60            [ 4] 3475 	ld	h, b
   5FBA 29            [11] 3476 	add	hl, hl
   5FBB 29            [11] 3477 	add	hl, hl
   5FBC 09            [11] 3478 	add	hl, bc
   5FBD 29            [11] 3479 	add	hl, hl
   5FBE 29            [11] 3480 	add	hl, hl
   5FBF 3E 36         [ 7] 3481 	ld	a,#<(_scene)
   5FC1 85            [ 4] 3482 	add	a, l
   5FC2 DD 77 FE      [19] 3483 	ld	-2 (ix),a
   5FC5 3E 90         [ 7] 3484 	ld	a,#>(_scene)
   5FC7 8C            [ 4] 3485 	adc	a, h
   5FC8 DD 77 FF      [19] 3486 	ld	-1 (ix),a
   5FCB DD 5E F7      [19] 3487 	ld	e,-9 (ix)
   5FCE DD 56 F8      [19] 3488 	ld	d,-8 (ix)
   5FD1 DD 7E FC      [19] 3489 	ld	a,-4 (ix)
   5FD4 B7            [ 4] 3490 	or	a, a
   5FD5 28 06         [12] 3491 	jr	Z,00116$
   5FD7 DD 5E FA      [19] 3492 	ld	e,-6 (ix)
   5FDA DD 56 FB      [19] 3493 	ld	d,-5 (ix)
   5FDD                    3494 00116$:
   5FDD CB 2A         [ 8] 3495 	sra	d
   5FDF CB 1B         [ 8] 3496 	rr	e
   5FE1 CB 2A         [ 8] 3497 	sra	d
   5FE3 CB 1B         [ 8] 3498 	rr	e
   5FE5 DD 6E FE      [19] 3499 	ld	l,-2 (ix)
   5FE8 DD 66 FF      [19] 3500 	ld	h,-1 (ix)
   5FEB 19            [11] 3501 	add	hl,de
   5FEC DD 7E FD      [19] 3502 	ld	a,-3 (ix)
   5FEF 96            [ 7] 3503 	sub	a,(hl)
   5FF0 28 3B         [12] 3504 	jr	Z,00111$
   5FF2                    3505 00106$:
                           3506 ;src/ia.h:91: switch(enemy.dir){
   5FF2 3A 50 91      [13] 3507 	ld	a,(#(_enemy + 0x0009) + 0)
   5FF5 FE 02         [ 7] 3508 	cp	a,#0x02
   5FF7 28 22         [12] 3509 	jr	Z,00103$
   5FF9 FE 04         [ 7] 3510 	cp	a,#0x04
   5FFB 28 0A         [12] 3511 	jr	Z,00101$
   5FFD FE 06         [ 7] 3512 	cp	a,#0x06
   5FFF 28 10         [12] 3513 	jr	Z,00102$
   6001 D6 08         [ 7] 3514 	sub	a, #0x08
   6003 28 20         [12] 3515 	jr	Z,00104$
   6005 18 26         [12] 3516 	jr	00111$
                           3517 ;src/ia.h:92: case 4:
   6007                    3518 00101$:
                           3519 ;src/ia.h:93: movement(6);
   6007 3E 06         [ 7] 3520 	ld	a,#0x06
   6009 F5            [11] 3521 	push	af
   600A 33            [ 6] 3522 	inc	sp
   600B CD E2 57      [17] 3523 	call	_movement
   600E 33            [ 6] 3524 	inc	sp
                           3525 ;src/ia.h:94: break;
   600F 18 1C         [12] 3526 	jr	00111$
                           3527 ;src/ia.h:95: case 6:
   6011                    3528 00102$:
                           3529 ;src/ia.h:96: movement(4);
   6011 3E 04         [ 7] 3530 	ld	a,#0x04
   6013 F5            [11] 3531 	push	af
   6014 33            [ 6] 3532 	inc	sp
   6015 CD E2 57      [17] 3533 	call	_movement
   6018 33            [ 6] 3534 	inc	sp
                           3535 ;src/ia.h:97: break;
   6019 18 12         [12] 3536 	jr	00111$
                           3537 ;src/ia.h:98: case 2:
   601B                    3538 00103$:
                           3539 ;src/ia.h:99: movement(8);
   601B 3E 08         [ 7] 3540 	ld	a,#0x08
   601D F5            [11] 3541 	push	af
   601E 33            [ 6] 3542 	inc	sp
   601F CD E2 57      [17] 3543 	call	_movement
   6022 33            [ 6] 3544 	inc	sp
                           3545 ;src/ia.h:100: break;
   6023 18 08         [12] 3546 	jr	00111$
                           3547 ;src/ia.h:101: case 8:
   6025                    3548 00104$:
                           3549 ;src/ia.h:102: movement(2);
   6025 3E 02         [ 7] 3550 	ld	a,#0x02
   6027 F5            [11] 3551 	push	af
   6028 33            [ 6] 3552 	inc	sp
   6029 CD E2 57      [17] 3553 	call	_movement
   602C 33            [ 6] 3554 	inc	sp
                           3555 ;src/ia.h:104: }
   602D                    3556 00111$:
   602D DD F9         [10] 3557 	ld	sp, ix
   602F DD E1         [14] 3558 	pop	ix
   6031 C9            [10] 3559 	ret
                           3560 ;src/ia.h:108: void move(){
                           3561 ;	---------------------------------
                           3562 ; Function move
                           3563 ; ---------------------------------
   6032                    3564 _move::
                           3565 ;src/ia.h:110: if(temp > 10){
   6032 3E 0A         [ 7] 3566 	ld	a,#0x0A
   6034 FD 21 26 91   [14] 3567 	ld	iy,#_temp
   6038 FD 96 00      [19] 3568 	sub	a, 0 (iy)
   603B 30 45         [12] 3569 	jr	NC,00117$
                           3570 ;src/ia.h:111: following = detectPlayerRoom(player.x,player.y);
   603D 3A 3D 91      [13] 3571 	ld	a, (#_player + 1)
   6040 21 3C 91      [10] 3572 	ld	hl, #_player + 0
   6043 56            [ 7] 3573 	ld	d,(hl)
   6044 F5            [11] 3574 	push	af
   6045 33            [ 6] 3575 	inc	sp
   6046 D5            [11] 3576 	push	de
   6047 33            [ 6] 3577 	inc	sp
   6048 CD 77 57      [17] 3578 	call	_detectPlayerRoom
   604B F1            [10] 3579 	pop	af
   604C FD 21 2B 91   [14] 3580 	ld	iy,#_following
   6050 FD 75 00      [19] 3581 	ld	0 (iy),l
                           3582 ;src/ia.h:112: if(following == enemy.room || enemy.pursue != 0){
   6053 21 51 91      [10] 3583 	ld	hl, #_enemy + 10
   6056 56            [ 7] 3584 	ld	d,(hl)
   6057 01 54 91      [10] 3585 	ld	bc,#_enemy + 13
   605A 0A            [ 7] 3586 	ld	a,(bc)
   605B 5F            [ 4] 3587 	ld	e,a
   605C 3A 2B 91      [13] 3588 	ld	a,(#_following + 0)
   605F 92            [ 4] 3589 	sub	a, d
   6060 28 04         [12] 3590 	jr	Z,00106$
   6062 7B            [ 4] 3591 	ld	a,e
   6063 B7            [ 4] 3592 	or	a, a
   6064 28 13         [12] 3593 	jr	Z,00107$
   6066                    3594 00106$:
                           3595 ;src/ia.h:113: if(enemy.pursue == 0)
   6066 7B            [ 4] 3596 	ld	a,e
   6067 B7            [ 4] 3597 	or	a, a
   6068 20 05         [12] 3598 	jr	NZ,00104$
                           3599 ;src/ia.h:114: enemy.pursue = 4;
   606A 3E 04         [ 7] 3600 	ld	a,#0x04
   606C 02            [ 7] 3601 	ld	(bc),a
   606D 18 3F         [12] 3602 	jr	00118$
   606F                    3603 00104$:
                           3604 ;src/ia.h:115: else if(enemy.pursue > 1)
   606F 3E 01         [ 7] 3605 	ld	a,#0x01
   6071 93            [ 4] 3606 	sub	a, e
   6072 30 3A         [12] 3607 	jr	NC,00118$
                           3608 ;src/ia.h:116: enemy.pursue -=1;
   6074 1D            [ 4] 3609 	dec	e
   6075 7B            [ 4] 3610 	ld	a,e
   6076 02            [ 7] 3611 	ld	(bc),a
   6077 18 35         [12] 3612 	jr	00118$
   6079                    3613 00107$:
                           3614 ;src/ia.h:118: enemy.dir = chooseDirection();
   6079 CD A4 57      [17] 3615 	call	_chooseDirection
   607C 7D            [ 4] 3616 	ld	a,l
   607D 32 50 91      [13] 3617 	ld	(#(_enemy + 0x0009)),a
   6080 18 2C         [12] 3618 	jr	00118$
   6082                    3619 00117$:
                           3620 ;src/ia.h:121: if(enemy.pursue >= 1){
   6082 3A 54 91      [13] 3621 	ld	a,(#(_enemy + 0x000d) + 0)
   6085 D6 01         [ 7] 3622 	sub	a, #0x01
   6087 38 22         [12] 3623 	jr	C,00114$
                           3624 ;src/ia.h:122: followPlayer();
   6089 CD 22 58      [17] 3625 	call	_followPlayer
                           3626 ;src/ia.h:123: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   608C 21 52 91      [10] 3627 	ld	hl, #_enemy + 11
   608F 56            [ 7] 3628 	ld	d,(hl)
   6090 21 47 91      [10] 3629 	ld	hl, #_enemy + 0
   6093 5E            [ 7] 3630 	ld	e,(hl)
   6094 7A            [ 4] 3631 	ld	a,d
   6095 93            [ 4] 3632 	sub	a, e
   6096 20 16         [12] 3633 	jr	NZ,00118$
   6098 21 53 91      [10] 3634 	ld	hl, #_enemy + 12
   609B 56            [ 7] 3635 	ld	d,(hl)
   609C 21 48 91      [10] 3636 	ld	hl, #_enemy + 1
   609F 5E            [ 7] 3637 	ld	e,(hl)
   60A0 7A            [ 4] 3638 	ld	a,d
   60A1 93            [ 4] 3639 	sub	a, e
   60A2 20 0A         [12] 3640 	jr	NZ,00118$
                           3641 ;src/ia.h:124: enemy.pursue = 0;
   60A4 21 54 91      [10] 3642 	ld	hl,#(_enemy + 0x000d)
   60A7 36 00         [10] 3643 	ld	(hl),#0x00
   60A9 18 03         [12] 3644 	jr	00118$
   60AB                    3645 00114$:
                           3646 ;src/ia.h:126: patrol();
   60AB CD 98 5E      [17] 3647 	call	_patrol
   60AE                    3648 00118$:
                           3649 ;src/ia.h:129: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   60AE 21 4A 91      [10] 3650 	ld	hl, #_enemy + 3
   60B1 56            [ 7] 3651 	ld	d,(hl)
   60B2 3A 49 91      [13] 3652 	ld	a, (#_enemy + 2)
   60B5 D5            [11] 3653 	push	de
   60B6 33            [ 6] 3654 	inc	sp
   60B7 F5            [11] 3655 	push	af
   60B8 33            [ 6] 3656 	inc	sp
   60B9 CD 77 57      [17] 3657 	call	_detectPlayerRoom
   60BC F1            [10] 3658 	pop	af
   60BD 55            [ 4] 3659 	ld	d,l
   60BE 3A 3D 91      [13] 3660 	ld	a, (#(_player + 0x0001) + 0)
   60C1 21 3C 91      [10] 3661 	ld	hl, #_player + 0
   60C4 46            [ 7] 3662 	ld	b,(hl)
   60C5 D5            [11] 3663 	push	de
   60C6 F5            [11] 3664 	push	af
   60C7 33            [ 6] 3665 	inc	sp
   60C8 C5            [11] 3666 	push	bc
   60C9 33            [ 6] 3667 	inc	sp
   60CA CD 77 57      [17] 3668 	call	_detectPlayerRoom
   60CD F1            [10] 3669 	pop	af
   60CE 45            [ 4] 3670 	ld	b,l
   60CF D1            [10] 3671 	pop	de
   60D0 7A            [ 4] 3672 	ld	a,d
   60D1 90            [ 4] 3673 	sub	a, b
   60D2 28 09         [12] 3674 	jr	Z,00119$
   60D4 21 54 91      [10] 3675 	ld	hl, #_enemy + 13
   60D7 66            [ 7] 3676 	ld	h,(hl)
   60D8 3E 01         [ 7] 3677 	ld	a,#0x01
   60DA 94            [ 4] 3678 	sub	a, h
   60DB 30 0E         [12] 3679 	jr	NC,00120$
   60DD                    3680 00119$:
                           3681 ;src/ia.h:130: enemy.seenX = player.x;
   60DD 11 52 91      [10] 3682 	ld	de,#_enemy + 11
   60E0 3A 3C 91      [13] 3683 	ld	a, (#_player + 0)
   60E3 12            [ 7] 3684 	ld	(de),a
                           3685 ;src/ia.h:131: enemy.seenY = player.y;
   60E4 11 53 91      [10] 3686 	ld	de,#_enemy + 12
   60E7 3A 3D 91      [13] 3687 	ld	a, (#(_player + 0x0001) + 0)
   60EA 12            [ 7] 3688 	ld	(de),a
   60EB                    3689 00120$:
                           3690 ;src/ia.h:133: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   60EB 3A 48 91      [13] 3691 	ld	a, (#_enemy + 1)
   60EE 21 47 91      [10] 3692 	ld	hl, #_enemy + 0
   60F1 56            [ 7] 3693 	ld	d,(hl)
   60F2 F5            [11] 3694 	push	af
   60F3 33            [ 6] 3695 	inc	sp
   60F4 D5            [11] 3696 	push	de
   60F5 33            [ 6] 3697 	inc	sp
   60F6 CD 77 57      [17] 3698 	call	_detectPlayerRoom
   60F9 F1            [10] 3699 	pop	af
   60FA 7D            [ 4] 3700 	ld	a,l
   60FB 32 51 91      [13] 3701 	ld	(#(_enemy + 0x000a)),a
   60FE C9            [10] 3702 	ret
                           3703 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           3704 ;	---------------------------------
                           3705 ; Function checkCollisions
                           3706 ; ---------------------------------
   60FF                    3707 _checkCollisions::
   60FF DD E5         [15] 3708 	push	ix
   6101 DD 21 00 00   [14] 3709 	ld	ix,#0
   6105 DD 39         [15] 3710 	add	ix,sp
   6107 21 FA FF      [10] 3711 	ld	hl,#-6
   610A 39            [11] 3712 	add	hl,sp
   610B F9            [ 6] 3713 	ld	sp,hl
                           3714 ;src/CalcColision.h:14: switch(atk){
   610C DD 7E 08      [19] 3715 	ld	a,8 (ix)
   610F D6 15         [ 7] 3716 	sub	a, #0x15
   6111 28 09         [12] 3717 	jr	Z,00101$
   6113 DD 7E 08      [19] 3718 	ld	a,8 (ix)
   6116 D6 16         [ 7] 3719 	sub	a, #0x16
   6118 28 08         [12] 3720 	jr	Z,00102$
   611A 18 0C         [12] 3721 	jr	00103$
                           3722 ;src/CalcColision.h:15: case 21:
   611C                    3723 00101$:
                           3724 ;src/CalcColision.h:16: auxX = 2;
   611C 1E 02         [ 7] 3725 	ld	e,#0x02
                           3726 ;src/CalcColision.h:17: auxY = 8;
   611E 0E 08         [ 7] 3727 	ld	c,#0x08
                           3728 ;src/CalcColision.h:18: break;
   6120 18 0A         [12] 3729 	jr	00104$
                           3730 ;src/CalcColision.h:19: case 22:
   6122                    3731 00102$:
                           3732 ;src/CalcColision.h:20: auxX = 4;
   6122 1E 04         [ 7] 3733 	ld	e,#0x04
                           3734 ;src/CalcColision.h:21: auxY = 4;
   6124 0E 04         [ 7] 3735 	ld	c,#0x04
                           3736 ;src/CalcColision.h:22: break;
   6126 18 04         [12] 3737 	jr	00104$
                           3738 ;src/CalcColision.h:23: default:
   6128                    3739 00103$:
                           3740 ;src/CalcColision.h:24: auxX = tilewidth;
   6128 1E 04         [ 7] 3741 	ld	e,#0x04
                           3742 ;src/CalcColision.h:25: auxY = tileheight;
   612A 0E 10         [ 7] 3743 	ld	c,#0x10
                           3744 ;src/CalcColision.h:26: }
   612C                    3745 00104$:
                           3746 ;src/CalcColision.h:27: popX = pX + auxX;
   612C DD 7E 04      [19] 3747 	ld	a,4 (ix)
   612F 83            [ 4] 3748 	add	a, e
   6130 6F            [ 4] 3749 	ld	l,a
                           3750 ;src/CalcColision.h:28: popY = pY + auxY;
   6131 DD 7E 05      [19] 3751 	ld	a,5 (ix)
   6134 81            [ 4] 3752 	add	a, c
   6135 DD 77 FA      [19] 3753 	ld	-6 (ix),a
                           3754 ;src/CalcColision.h:29: eopX = eX + auxX;
   6138 DD 7E 06      [19] 3755 	ld	a,6 (ix)
   613B 83            [ 4] 3756 	add	a, e
   613C 5F            [ 4] 3757 	ld	e,a
                           3758 ;src/CalcColision.h:30: eopY = eY + auxY;
   613D DD 7E 07      [19] 3759 	ld	a,7 (ix)
   6140 81            [ 4] 3760 	add	a, c
   6141 DD 77 FB      [19] 3761 	ld	-5 (ix),a
                           3762 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   6144 7B            [ 4] 3763 	ld	a,e
   6145 DD 96 04      [19] 3764 	sub	a, 4 (ix)
   6148 3E 00         [ 7] 3765 	ld	a,#0x00
   614A 17            [ 4] 3766 	rla
   614B DD 77 FC      [19] 3767 	ld	-4 (ix),a
   614E 7D            [ 4] 3768 	ld	a,l
   614F 93            [ 4] 3769 	sub	a, e
   6150 3E 00         [ 7] 3770 	ld	a,#0x00
   6152 17            [ 4] 3771 	rla
   6153 DD 77 FD      [19] 3772 	ld	-3 (ix),a
   6156 DD 7E 07      [19] 3773 	ld	a,7 (ix)
   6159 DD 96 05      [19] 3774 	sub	a, 5 (ix)
   615C 3E 00         [ 7] 3775 	ld	a,#0x00
   615E 17            [ 4] 3776 	rla
   615F 5F            [ 4] 3777 	ld	e,a
   6160 DD 7E FA      [19] 3778 	ld	a,-6 (ix)
   6163 DD 96 07      [19] 3779 	sub	a, 7 (ix)
   6166 3E 00         [ 7] 3780 	ld	a,#0x00
   6168 17            [ 4] 3781 	rla
   6169 4F            [ 4] 3782 	ld	c,a
                           3783 ;src/CalcColision.h:33: if(atk >= 21)
   616A DD 7E 08      [19] 3784 	ld	a,8 (ix)
   616D D6 15         [ 7] 3785 	sub	a, #0x15
   616F 3E 00         [ 7] 3786 	ld	a,#0x00
   6171 17            [ 4] 3787 	rla
   6172 DD 77 FF      [19] 3788 	ld	-1 (ix),a
                           3789 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   6175 DD 7E FC      [19] 3790 	ld	a,-4 (ix)
   6178 B7            [ 4] 3791 	or	a, a
   6179 20 1C         [12] 3792 	jr	NZ,00109$
   617B DD 7E FD      [19] 3793 	ld	a,-3 (ix)
   617E B7            [ 4] 3794 	or	a,a
   617F 20 16         [12] 3795 	jr	NZ,00109$
   6181 B3            [ 4] 3796 	or	a,e
   6182 20 13         [12] 3797 	jr	NZ,00109$
   6184 B1            [ 4] 3798 	or	a,c
   6185 20 10         [12] 3799 	jr	NZ,00109$
                           3800 ;src/CalcColision.h:33: if(atk >= 21)
   6187 DD 7E FF      [19] 3801 	ld	a,-1 (ix)
   618A B7            [ 4] 3802 	or	a, a
   618B 20 05         [12] 3803 	jr	NZ,00106$
                           3804 ;src/CalcColision.h:34: return 1;
   618D 2E 01         [ 7] 3805 	ld	l,#0x01
   618F C3 1B 62      [10] 3806 	jp	00137$
   6192                    3807 00106$:
                           3808 ;src/CalcColision.h:36: return 2;
   6192 2E 02         [ 7] 3809 	ld	l,#0x02
   6194 C3 1B 62      [10] 3810 	jp	00137$
   6197                    3811 00109$:
                           3812 ;src/CalcColision.h:38: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   6197 DD 7E 06      [19] 3813 	ld	a,6 (ix)
   619A DD 96 04      [19] 3814 	sub	a, 4 (ix)
   619D 3E 00         [ 7] 3815 	ld	a,#0x00
   619F 17            [ 4] 3816 	rla
   61A0 DD 77 FE      [19] 3817 	ld	-2 (ix),a
   61A3 7D            [ 4] 3818 	ld	a,l
   61A4 DD 96 06      [19] 3819 	sub	a, 6 (ix)
   61A7 3E 00         [ 7] 3820 	ld	a,#0x00
   61A9 17            [ 4] 3821 	rla
   61AA 6F            [ 4] 3822 	ld	l,a
   61AB DD 7E FE      [19] 3823 	ld	a,-2 (ix)
   61AE B7            [ 4] 3824 	or	a,a
   61AF 20 17         [12] 3825 	jr	NZ,00117$
   61B1 B5            [ 4] 3826 	or	a,l
   61B2 20 14         [12] 3827 	jr	NZ,00117$
   61B4 B3            [ 4] 3828 	or	a,e
   61B5 20 11         [12] 3829 	jr	NZ,00117$
   61B7 B1            [ 4] 3830 	or	a,c
   61B8 20 0E         [12] 3831 	jr	NZ,00117$
                           3832 ;src/CalcColision.h:39: if(atk >= 21)
   61BA DD 7E FF      [19] 3833 	ld	a,-1 (ix)
   61BD B7            [ 4] 3834 	or	a, a
   61BE 20 04         [12] 3835 	jr	NZ,00114$
                           3836 ;src/CalcColision.h:40: return 1;
   61C0 2E 01         [ 7] 3837 	ld	l,#0x01
   61C2 18 57         [12] 3838 	jr	00137$
   61C4                    3839 00114$:
                           3840 ;src/CalcColision.h:42: return 2;
   61C4 2E 02         [ 7] 3841 	ld	l,#0x02
   61C6 18 53         [12] 3842 	jr	00137$
   61C8                    3843 00117$:
                           3844 ;src/CalcColision.h:44: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   61C8 DD 7E FB      [19] 3845 	ld	a,-5 (ix)
   61CB DD 96 05      [19] 3846 	sub	a, 5 (ix)
   61CE 3E 00         [ 7] 3847 	ld	a,#0x00
   61D0 17            [ 4] 3848 	rla
   61D1 5F            [ 4] 3849 	ld	e,a
   61D2 DD 7E FA      [19] 3850 	ld	a,-6 (ix)
   61D5 DD 96 FB      [19] 3851 	sub	a, -5 (ix)
   61D8 3E 00         [ 7] 3852 	ld	a,#0x00
   61DA 17            [ 4] 3853 	rla
   61DB 67            [ 4] 3854 	ld	h,a
   61DC DD 7E FE      [19] 3855 	ld	a,-2 (ix)
   61DF B7            [ 4] 3856 	or	a,a
   61E0 20 17         [12] 3857 	jr	NZ,00125$
   61E2 B5            [ 4] 3858 	or	a,l
   61E3 20 14         [12] 3859 	jr	NZ,00125$
   61E5 B3            [ 4] 3860 	or	a,e
   61E6 20 11         [12] 3861 	jr	NZ,00125$
   61E8 B4            [ 4] 3862 	or	a,h
   61E9 20 0E         [12] 3863 	jr	NZ,00125$
                           3864 ;src/CalcColision.h:45: if(atk >= 21)
   61EB DD 7E FF      [19] 3865 	ld	a,-1 (ix)
   61EE B7            [ 4] 3866 	or	a, a
   61EF 20 04         [12] 3867 	jr	NZ,00122$
                           3868 ;src/CalcColision.h:46: return 1;
   61F1 2E 01         [ 7] 3869 	ld	l,#0x01
   61F3 18 26         [12] 3870 	jr	00137$
   61F5                    3871 00122$:
                           3872 ;src/CalcColision.h:48: return 2;
   61F5 2E 02         [ 7] 3873 	ld	l,#0x02
   61F7 18 22         [12] 3874 	jr	00137$
   61F9                    3875 00125$:
                           3876 ;src/CalcColision.h:50: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   61F9 DD 7E FC      [19] 3877 	ld	a,-4 (ix)
   61FC B7            [ 4] 3878 	or	a, a
   61FD 20 1A         [12] 3879 	jr	NZ,00133$
   61FF DD 7E FD      [19] 3880 	ld	a,-3 (ix)
   6202 B7            [ 4] 3881 	or	a,a
   6203 20 14         [12] 3882 	jr	NZ,00133$
   6205 B3            [ 4] 3883 	or	a,e
   6206 20 11         [12] 3884 	jr	NZ,00133$
   6208 B4            [ 4] 3885 	or	a,h
   6209 20 0E         [12] 3886 	jr	NZ,00133$
                           3887 ;src/CalcColision.h:51: if(atk >= 21)
   620B DD 7E FF      [19] 3888 	ld	a,-1 (ix)
   620E B7            [ 4] 3889 	or	a, a
   620F 20 04         [12] 3890 	jr	NZ,00130$
                           3891 ;src/CalcColision.h:52: return 1;
   6211 2E 01         [ 7] 3892 	ld	l,#0x01
   6213 18 06         [12] 3893 	jr	00137$
   6215                    3894 00130$:
                           3895 ;src/CalcColision.h:54: return 2;
   6215 2E 02         [ 7] 3896 	ld	l,#0x02
   6217 18 02         [12] 3897 	jr	00137$
   6219                    3898 00133$:
                           3899 ;src/CalcColision.h:56: return 0;
   6219 2E 00         [ 7] 3900 	ld	l,#0x00
   621B                    3901 00137$:
   621B DD F9         [10] 3902 	ld	sp, ix
   621D DD E1         [14] 3903 	pop	ix
   621F C9            [10] 3904 	ret
                           3905 ;src/CalcColision.h:60: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3906 ;	---------------------------------
                           3907 ; Function checkBoundsCollisions
                           3908 ; ---------------------------------
   6220                    3909 _checkBoundsCollisions::
   6220 DD E5         [15] 3910 	push	ix
   6222 DD 21 00 00   [14] 3911 	ld	ix,#0
   6226 DD 39         [15] 3912 	add	ix,sp
   6228 21 ED FF      [10] 3913 	ld	hl,#-19
   622B 39            [11] 3914 	add	hl,sp
   622C F9            [ 6] 3915 	ld	sp,hl
                           3916 ;src/CalcColision.h:61: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   622D 3A 3D 91      [13] 3917 	ld	a,(#(_player + 0x0001) + 0)
   6230 DD 77 EE      [19] 3918 	ld	-18 (ix), a
   6233 07            [ 4] 3919 	rlca
   6234 07            [ 4] 3920 	rlca
   6235 07            [ 4] 3921 	rlca
   6236 07            [ 4] 3922 	rlca
   6237 E6 0F         [ 7] 3923 	and	a,#0x0F
   6239 4F            [ 4] 3924 	ld	c,a
   623A 06 00         [ 7] 3925 	ld	b,#0x00
   623C 69            [ 4] 3926 	ld	l, c
   623D 60            [ 4] 3927 	ld	h, b
   623E 29            [11] 3928 	add	hl, hl
   623F 29            [11] 3929 	add	hl, hl
   6240 09            [11] 3930 	add	hl, bc
   6241 29            [11] 3931 	add	hl, hl
   6242 29            [11] 3932 	add	hl, hl
   6243 3E 36         [ 7] 3933 	ld	a,#<(_scene)
   6245 85            [ 4] 3934 	add	a, l
   6246 DD 77 F9      [19] 3935 	ld	-7 (ix),a
   6249 3E 90         [ 7] 3936 	ld	a,#>(_scene)
   624B 8C            [ 4] 3937 	adc	a, h
   624C DD 77 FA      [19] 3938 	ld	-6 (ix),a
   624F 3A 3C 91      [13] 3939 	ld	a,(#_player + 0)
   6252 DD 77 ED      [19] 3940 	ld	-19 (ix), a
   6255 0F            [ 4] 3941 	rrca
   6256 0F            [ 4] 3942 	rrca
   6257 E6 3F         [ 7] 3943 	and	a,#0x3F
   6259 DD 77 FF      [19] 3944 	ld	-1 (ix), a
   625C DD 86 F9      [19] 3945 	add	a, -7 (ix)
   625F 6F            [ 4] 3946 	ld	l,a
   6260 3E 00         [ 7] 3947 	ld	a,#0x00
   6262 DD 8E FA      [19] 3948 	adc	a, -6 (ix)
   6265 67            [ 4] 3949 	ld	h,a
   6266 7E            [ 7] 3950 	ld	a,(hl)
                           3951 ;src/CalcColision.h:66: player.x=player.lx;
                           3952 ;src/CalcColision.h:67: player.y=player.ly;
                           3953 ;src/CalcColision.h:61: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   6267 DD 77 F3      [19] 3954 	ld	-13 (ix), a
   626A 3D            [ 4] 3955 	dec	a
   626B CA 23 64      [10] 3956 	jp	Z,00129$
                           3957 ;src/CalcColision.h:62: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   626E DD 5E ED      [19] 3958 	ld	e,-19 (ix)
   6271 16 00         [ 7] 3959 	ld	d,#0x00
   6273 21 03 00      [10] 3960 	ld	hl,#0x0003
   6276 19            [11] 3961 	add	hl,de
   6277 DD 75 F6      [19] 3962 	ld	-10 (ix),l
   627A DD 74 F7      [19] 3963 	ld	-9 (ix),h
   627D DD 7E F6      [19] 3964 	ld	a,-10 (ix)
   6280 DD 77 FD      [19] 3965 	ld	-3 (ix),a
   6283 DD 7E F7      [19] 3966 	ld	a,-9 (ix)
   6286 DD 77 FE      [19] 3967 	ld	-2 (ix),a
   6289 DD 7E F7      [19] 3968 	ld	a,-9 (ix)
   628C 07            [ 4] 3969 	rlca
   628D E6 01         [ 7] 3970 	and	a,#0x01
   628F DD 77 ED      [19] 3971 	ld	-19 (ix),a
   6292 21 06 00      [10] 3972 	ld	hl,#0x0006
   6295 19            [11] 3973 	add	hl,de
   6296 DD 75 FB      [19] 3974 	ld	-5 (ix),l
   6299 DD 74 FC      [19] 3975 	ld	-4 (ix),h
   629C DD 7E ED      [19] 3976 	ld	a,-19 (ix)
   629F B7            [ 4] 3977 	or	a, a
   62A0 28 0C         [12] 3978 	jr	Z,00137$
   62A2 DD 7E FB      [19] 3979 	ld	a,-5 (ix)
   62A5 DD 77 FD      [19] 3980 	ld	-3 (ix),a
   62A8 DD 7E FC      [19] 3981 	ld	a,-4 (ix)
   62AB DD 77 FE      [19] 3982 	ld	-2 (ix),a
   62AE                    3983 00137$:
   62AE DD 6E FD      [19] 3984 	ld	l,-3 (ix)
   62B1 DD 66 FE      [19] 3985 	ld	h,-2 (ix)
   62B4 CB 2C         [ 8] 3986 	sra	h
   62B6 CB 1D         [ 8] 3987 	rr	l
   62B8 CB 2C         [ 8] 3988 	sra	h
   62BA CB 1D         [ 8] 3989 	rr	l
   62BC DD 5E F9      [19] 3990 	ld	e,-7 (ix)
   62BF DD 56 FA      [19] 3991 	ld	d,-6 (ix)
   62C2 19            [11] 3992 	add	hl,de
   62C3 7E            [ 7] 3993 	ld	a,(hl)
   62C4 3D            [ 4] 3994 	dec	a
   62C5 CA 23 64      [10] 3995 	jp	Z,00129$
                           3996 ;src/CalcColision.h:63: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   62C8 DD 7E EE      [19] 3997 	ld	a,-18 (ix)
   62CB DD 77 FD      [19] 3998 	ld	-3 (ix),a
   62CE DD 36 FE 00   [19] 3999 	ld	-2 (ix),#0x00
   62D2 DD 7E FD      [19] 4000 	ld	a,-3 (ix)
   62D5 C6 0E         [ 7] 4001 	add	a, #0x0E
   62D7 DD 77 F1      [19] 4002 	ld	-15 (ix),a
   62DA DD 7E FE      [19] 4003 	ld	a,-2 (ix)
   62DD CE 00         [ 7] 4004 	adc	a, #0x00
   62DF DD 77 F2      [19] 4005 	ld	-14 (ix),a
   62E2 DD 7E F1      [19] 4006 	ld	a,-15 (ix)
   62E5 DD 77 F4      [19] 4007 	ld	-12 (ix),a
   62E8 DD 7E F2      [19] 4008 	ld	a,-14 (ix)
   62EB DD 77 F5      [19] 4009 	ld	-11 (ix),a
   62EE DD 7E F2      [19] 4010 	ld	a,-14 (ix)
   62F1 07            [ 4] 4011 	rlca
   62F2 E6 01         [ 7] 4012 	and	a,#0x01
   62F4 DD 77 EE      [19] 4013 	ld	-18 (ix),a
   62F7 DD 7E FD      [19] 4014 	ld	a,-3 (ix)
   62FA C6 1D         [ 7] 4015 	add	a, #0x1D
   62FC DD 77 FD      [19] 4016 	ld	-3 (ix),a
   62FF DD 7E FE      [19] 4017 	ld	a,-2 (ix)
   6302 CE 00         [ 7] 4018 	adc	a, #0x00
   6304 DD 77 FE      [19] 4019 	ld	-2 (ix),a
   6307 DD 7E EE      [19] 4020 	ld	a,-18 (ix)
   630A B7            [ 4] 4021 	or	a, a
   630B 28 0C         [12] 4022 	jr	Z,00138$
   630D DD 7E FD      [19] 4023 	ld	a,-3 (ix)
   6310 DD 77 F4      [19] 4024 	ld	-12 (ix),a
   6313 DD 7E FE      [19] 4025 	ld	a,-2 (ix)
   6316 DD 77 F5      [19] 4026 	ld	-11 (ix),a
   6319                    4027 00138$:
   6319 DD CB F5 2E   [23] 4028 	sra	-11 (ix)
   631D DD CB F4 1E   [23] 4029 	rr	-12 (ix)
   6321 DD CB F5 2E   [23] 4030 	sra	-11 (ix)
   6325 DD CB F4 1E   [23] 4031 	rr	-12 (ix)
   6329 DD CB F5 2E   [23] 4032 	sra	-11 (ix)
   632D DD CB F4 1E   [23] 4033 	rr	-12 (ix)
   6331 DD CB F5 2E   [23] 4034 	sra	-11 (ix)
   6335 DD CB F4 1E   [23] 4035 	rr	-12 (ix)
   6339 DD 4E F4      [19] 4036 	ld	c,-12 (ix)
   633C DD 46 F5      [19] 4037 	ld	b,-11 (ix)
   633F 69            [ 4] 4038 	ld	l, c
   6340 60            [ 4] 4039 	ld	h, b
   6341 29            [11] 4040 	add	hl, hl
   6342 29            [11] 4041 	add	hl, hl
   6343 09            [11] 4042 	add	hl, bc
   6344 29            [11] 4043 	add	hl, hl
   6345 29            [11] 4044 	add	hl, hl
   6346 DD 75 F4      [19] 4045 	ld	-12 (ix),l
   6349 DD 74 F5      [19] 4046 	ld	-11 (ix),h
   634C 3E 36         [ 7] 4047 	ld	a,#<(_scene)
   634E DD 86 F4      [19] 4048 	add	a, -12 (ix)
   6351 DD 77 F4      [19] 4049 	ld	-12 (ix),a
   6354 3E 90         [ 7] 4050 	ld	a,#>(_scene)
   6356 DD 8E F5      [19] 4051 	adc	a, -11 (ix)
   6359 DD 77 F5      [19] 4052 	ld	-11 (ix),a
   635C DD 7E F4      [19] 4053 	ld	a,-12 (ix)
   635F DD 86 FF      [19] 4054 	add	a, -1 (ix)
   6362 DD 77 F4      [19] 4055 	ld	-12 (ix),a
   6365 DD 7E F5      [19] 4056 	ld	a,-11 (ix)
   6368 CE 00         [ 7] 4057 	adc	a, #0x00
   636A DD 77 F5      [19] 4058 	ld	-11 (ix),a
   636D DD 6E F4      [19] 4059 	ld	l,-12 (ix)
   6370 DD 66 F5      [19] 4060 	ld	h,-11 (ix)
   6373 7E            [ 7] 4061 	ld	a,(hl)
   6374 3D            [ 4] 4062 	dec	a
   6375 CA 23 64      [10] 4063 	jp	Z,00129$
                           4064 ;src/CalcColision.h:64: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   6378 DD 7E F1      [19] 4065 	ld	a,-15 (ix)
   637B DD 77 F4      [19] 4066 	ld	-12 (ix),a
   637E DD 7E F2      [19] 4067 	ld	a,-14 (ix)
   6381 DD 77 F5      [19] 4068 	ld	-11 (ix),a
   6384 DD 7E EE      [19] 4069 	ld	a,-18 (ix)
   6387 B7            [ 4] 4070 	or	a, a
   6388 28 0C         [12] 4071 	jr	Z,00139$
   638A DD 7E FD      [19] 4072 	ld	a,-3 (ix)
   638D DD 77 F4      [19] 4073 	ld	-12 (ix),a
   6390 DD 7E FE      [19] 4074 	ld	a,-2 (ix)
   6393 DD 77 F5      [19] 4075 	ld	-11 (ix),a
   6396                    4076 00139$:
   6396 DD CB F5 2E   [23] 4077 	sra	-11 (ix)
   639A DD CB F4 1E   [23] 4078 	rr	-12 (ix)
   639E DD CB F5 2E   [23] 4079 	sra	-11 (ix)
   63A2 DD CB F4 1E   [23] 4080 	rr	-12 (ix)
   63A6 DD CB F5 2E   [23] 4081 	sra	-11 (ix)
   63AA DD CB F4 1E   [23] 4082 	rr	-12 (ix)
   63AE DD CB F5 2E   [23] 4083 	sra	-11 (ix)
   63B2 DD CB F4 1E   [23] 4084 	rr	-12 (ix)
   63B6 DD 4E F4      [19] 4085 	ld	c,-12 (ix)
   63B9 DD 46 F5      [19] 4086 	ld	b,-11 (ix)
   63BC 69            [ 4] 4087 	ld	l, c
   63BD 60            [ 4] 4088 	ld	h, b
   63BE 29            [11] 4089 	add	hl, hl
   63BF 29            [11] 4090 	add	hl, hl
   63C0 09            [11] 4091 	add	hl, bc
   63C1 29            [11] 4092 	add	hl, hl
   63C2 29            [11] 4093 	add	hl, hl
   63C3 DD 75 F4      [19] 4094 	ld	-12 (ix),l
   63C6 DD 74 F5      [19] 4095 	ld	-11 (ix),h
   63C9 3E 36         [ 7] 4096 	ld	a,#<(_scene)
   63CB DD 86 F4      [19] 4097 	add	a, -12 (ix)
   63CE DD 77 F4      [19] 4098 	ld	-12 (ix),a
   63D1 3E 90         [ 7] 4099 	ld	a,#>(_scene)
   63D3 DD 8E F5      [19] 4100 	adc	a, -11 (ix)
   63D6 DD 77 F5      [19] 4101 	ld	-11 (ix),a
   63D9 DD 7E F6      [19] 4102 	ld	a,-10 (ix)
   63DC DD 77 EF      [19] 4103 	ld	-17 (ix),a
   63DF DD 7E F7      [19] 4104 	ld	a,-9 (ix)
   63E2 DD 77 F0      [19] 4105 	ld	-16 (ix),a
   63E5 DD 7E ED      [19] 4106 	ld	a,-19 (ix)
   63E8 B7            [ 4] 4107 	or	a, a
   63E9 28 0C         [12] 4108 	jr	Z,00140$
   63EB DD 7E FB      [19] 4109 	ld	a,-5 (ix)
   63EE DD 77 EF      [19] 4110 	ld	-17 (ix),a
   63F1 DD 7E FC      [19] 4111 	ld	a,-4 (ix)
   63F4 DD 77 F0      [19] 4112 	ld	-16 (ix),a
   63F7                    4113 00140$:
   63F7 DD CB F0 2E   [23] 4114 	sra	-16 (ix)
   63FB DD CB EF 1E   [23] 4115 	rr	-17 (ix)
   63FF DD CB F0 2E   [23] 4116 	sra	-16 (ix)
   6403 DD CB EF 1E   [23] 4117 	rr	-17 (ix)
   6407 DD 7E F4      [19] 4118 	ld	a,-12 (ix)
   640A DD 86 EF      [19] 4119 	add	a, -17 (ix)
   640D DD 77 EF      [19] 4120 	ld	-17 (ix),a
   6410 DD 7E F5      [19] 4121 	ld	a,-11 (ix)
   6413 DD 8E F0      [19] 4122 	adc	a, -16 (ix)
   6416 DD 77 F0      [19] 4123 	ld	-16 (ix),a
   6419 DD 6E EF      [19] 4124 	ld	l,-17 (ix)
   641C DD 66 F0      [19] 4125 	ld	h,-16 (ix)
   641F 7E            [ 7] 4126 	ld	a,(hl)
   6420 3D            [ 4] 4127 	dec	a
   6421 20 10         [12] 4128 	jr	NZ,00130$
   6423                    4129 00129$:
                           4130 ;src/CalcColision.h:66: player.x=player.lx;
   6423 3A 3E 91      [13] 4131 	ld	a, (#(_player + 0x0002) + 0)
   6426 21 3C 91      [10] 4132 	ld	hl,#_player
   6429 77            [ 7] 4133 	ld	(hl),a
                           4134 ;src/CalcColision.h:67: player.y=player.ly;
   642A 3A 3F 91      [13] 4135 	ld	a, (#(_player + 0x0003) + 0)
   642D 32 3D 91      [13] 4136 	ld	(#(_player + 0x0001)),a
   6430 C3 23 69      [10] 4137 	jp	00135$
   6433                    4138 00130$:
                           4139 ;src/CalcColision.h:69: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   6433 DD 7E F3      [19] 4140 	ld	a,-13 (ix)
   6436 D6 02         [ 7] 4141 	sub	a, #0x02
   6438 CA B1 65      [10] 4142 	jp	Z,00123$
                           4143 ;src/CalcColision.h:70: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   643B DD 7E F6      [19] 4144 	ld	a,-10 (ix)
   643E DD 77 EF      [19] 4145 	ld	-17 (ix),a
   6441 DD 7E F7      [19] 4146 	ld	a,-9 (ix)
   6444 DD 77 F0      [19] 4147 	ld	-16 (ix),a
   6447 DD 7E ED      [19] 4148 	ld	a,-19 (ix)
   644A B7            [ 4] 4149 	or	a, a
   644B 28 0C         [12] 4150 	jr	Z,00141$
   644D DD 7E FB      [19] 4151 	ld	a,-5 (ix)
   6450 DD 77 EF      [19] 4152 	ld	-17 (ix),a
   6453 DD 7E FC      [19] 4153 	ld	a,-4 (ix)
   6456 DD 77 F0      [19] 4154 	ld	-16 (ix),a
   6459                    4155 00141$:
   6459 DD CB F0 2E   [23] 4156 	sra	-16 (ix)
   645D DD CB EF 1E   [23] 4157 	rr	-17 (ix)
   6461 DD CB F0 2E   [23] 4158 	sra	-16 (ix)
   6465 DD CB EF 1E   [23] 4159 	rr	-17 (ix)
   6469 DD 7E F9      [19] 4160 	ld	a,-7 (ix)
   646C DD 86 EF      [19] 4161 	add	a, -17 (ix)
   646F DD 77 EF      [19] 4162 	ld	-17 (ix),a
   6472 DD 7E FA      [19] 4163 	ld	a,-6 (ix)
   6475 DD 8E F0      [19] 4164 	adc	a, -16 (ix)
   6478 DD 77 F0      [19] 4165 	ld	-16 (ix),a
   647B DD 6E EF      [19] 4166 	ld	l,-17 (ix)
   647E DD 66 F0      [19] 4167 	ld	h,-16 (ix)
   6481 7E            [ 7] 4168 	ld	a,(hl)
   6482 D6 02         [ 7] 4169 	sub	a, #0x02
   6484 CA B1 65      [10] 4170 	jp	Z,00123$
                           4171 ;src/CalcColision.h:71: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   6487 DD 7E F1      [19] 4172 	ld	a,-15 (ix)
   648A DD 77 EF      [19] 4173 	ld	-17 (ix),a
   648D DD 7E F2      [19] 4174 	ld	a,-14 (ix)
   6490 DD 77 F0      [19] 4175 	ld	-16 (ix),a
   6493 DD 7E EE      [19] 4176 	ld	a,-18 (ix)
   6496 B7            [ 4] 4177 	or	a, a
   6497 28 0C         [12] 4178 	jr	Z,00142$
   6499 DD 7E FD      [19] 4179 	ld	a,-3 (ix)
   649C DD 77 EF      [19] 4180 	ld	-17 (ix),a
   649F DD 7E FE      [19] 4181 	ld	a,-2 (ix)
   64A2 DD 77 F0      [19] 4182 	ld	-16 (ix),a
   64A5                    4183 00142$:
   64A5 DD CB F0 2E   [23] 4184 	sra	-16 (ix)
   64A9 DD CB EF 1E   [23] 4185 	rr	-17 (ix)
   64AD DD CB F0 2E   [23] 4186 	sra	-16 (ix)
   64B1 DD CB EF 1E   [23] 4187 	rr	-17 (ix)
   64B5 DD CB F0 2E   [23] 4188 	sra	-16 (ix)
   64B9 DD CB EF 1E   [23] 4189 	rr	-17 (ix)
   64BD DD CB F0 2E   [23] 4190 	sra	-16 (ix)
   64C1 DD CB EF 1E   [23] 4191 	rr	-17 (ix)
   64C5 DD 4E EF      [19] 4192 	ld	c,-17 (ix)
   64C8 DD 46 F0      [19] 4193 	ld	b,-16 (ix)
   64CB 69            [ 4] 4194 	ld	l, c
   64CC 60            [ 4] 4195 	ld	h, b
   64CD 29            [11] 4196 	add	hl, hl
   64CE 29            [11] 4197 	add	hl, hl
   64CF 09            [11] 4198 	add	hl, bc
   64D0 29            [11] 4199 	add	hl, hl
   64D1 29            [11] 4200 	add	hl, hl
   64D2 DD 75 EF      [19] 4201 	ld	-17 (ix),l
   64D5 DD 74 F0      [19] 4202 	ld	-16 (ix),h
   64D8 3E 36         [ 7] 4203 	ld	a,#<(_scene)
   64DA DD 86 EF      [19] 4204 	add	a, -17 (ix)
   64DD DD 77 EF      [19] 4205 	ld	-17 (ix),a
   64E0 3E 90         [ 7] 4206 	ld	a,#>(_scene)
   64E2 DD 8E F0      [19] 4207 	adc	a, -16 (ix)
   64E5 DD 77 F0      [19] 4208 	ld	-16 (ix),a
   64E8 DD 7E EF      [19] 4209 	ld	a,-17 (ix)
   64EB DD 86 FF      [19] 4210 	add	a, -1 (ix)
   64EE DD 77 EF      [19] 4211 	ld	-17 (ix),a
   64F1 DD 7E F0      [19] 4212 	ld	a,-16 (ix)
   64F4 CE 00         [ 7] 4213 	adc	a, #0x00
   64F6 DD 77 F0      [19] 4214 	ld	-16 (ix),a
   64F9 DD 6E EF      [19] 4215 	ld	l,-17 (ix)
   64FC DD 66 F0      [19] 4216 	ld	h,-16 (ix)
   64FF 7E            [ 7] 4217 	ld	a,(hl)
   6500 D6 02         [ 7] 4218 	sub	a, #0x02
   6502 CA B1 65      [10] 4219 	jp	Z,00123$
                           4220 ;src/CalcColision.h:72: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   6505 DD 7E F1      [19] 4221 	ld	a,-15 (ix)
   6508 DD 77 EF      [19] 4222 	ld	-17 (ix),a
   650B DD 7E F2      [19] 4223 	ld	a,-14 (ix)
   650E DD 77 F0      [19] 4224 	ld	-16 (ix),a
   6511 DD 7E EE      [19] 4225 	ld	a,-18 (ix)
   6514 B7            [ 4] 4226 	or	a, a
   6515 28 0C         [12] 4227 	jr	Z,00143$
   6517 DD 7E FD      [19] 4228 	ld	a,-3 (ix)
   651A DD 77 EF      [19] 4229 	ld	-17 (ix),a
   651D DD 7E FE      [19] 4230 	ld	a,-2 (ix)
   6520 DD 77 F0      [19] 4231 	ld	-16 (ix),a
   6523                    4232 00143$:
   6523 DD CB F0 2E   [23] 4233 	sra	-16 (ix)
   6527 DD CB EF 1E   [23] 4234 	rr	-17 (ix)
   652B DD CB F0 2E   [23] 4235 	sra	-16 (ix)
   652F DD CB EF 1E   [23] 4236 	rr	-17 (ix)
   6533 DD CB F0 2E   [23] 4237 	sra	-16 (ix)
   6537 DD CB EF 1E   [23] 4238 	rr	-17 (ix)
   653B DD CB F0 2E   [23] 4239 	sra	-16 (ix)
   653F DD CB EF 1E   [23] 4240 	rr	-17 (ix)
   6543 DD 4E EF      [19] 4241 	ld	c,-17 (ix)
   6546 DD 46 F0      [19] 4242 	ld	b,-16 (ix)
   6549 69            [ 4] 4243 	ld	l, c
   654A 60            [ 4] 4244 	ld	h, b
   654B 29            [11] 4245 	add	hl, hl
   654C 29            [11] 4246 	add	hl, hl
   654D 09            [11] 4247 	add	hl, bc
   654E 29            [11] 4248 	add	hl, hl
   654F 29            [11] 4249 	add	hl, hl
   6550 DD 75 EF      [19] 4250 	ld	-17 (ix),l
   6553 DD 74 F0      [19] 4251 	ld	-16 (ix),h
   6556 3E 36         [ 7] 4252 	ld	a,#<(_scene)
   6558 DD 86 EF      [19] 4253 	add	a, -17 (ix)
   655B DD 77 EF      [19] 4254 	ld	-17 (ix),a
   655E 3E 90         [ 7] 4255 	ld	a,#>(_scene)
   6560 DD 8E F0      [19] 4256 	adc	a, -16 (ix)
   6563 DD 77 F0      [19] 4257 	ld	-16 (ix),a
   6566 DD 7E F6      [19] 4258 	ld	a,-10 (ix)
   6569 DD 77 F4      [19] 4259 	ld	-12 (ix),a
   656C DD 7E F7      [19] 4260 	ld	a,-9 (ix)
   656F DD 77 F5      [19] 4261 	ld	-11 (ix),a
   6572 DD 7E ED      [19] 4262 	ld	a,-19 (ix)
   6575 B7            [ 4] 4263 	or	a, a
   6576 28 0C         [12] 4264 	jr	Z,00144$
   6578 DD 7E FB      [19] 4265 	ld	a,-5 (ix)
   657B DD 77 F4      [19] 4266 	ld	-12 (ix),a
   657E DD 7E FC      [19] 4267 	ld	a,-4 (ix)
   6581 DD 77 F5      [19] 4268 	ld	-11 (ix),a
   6584                    4269 00144$:
   6584 DD CB F5 2E   [23] 4270 	sra	-11 (ix)
   6588 DD CB F4 1E   [23] 4271 	rr	-12 (ix)
   658C DD CB F5 2E   [23] 4272 	sra	-11 (ix)
   6590 DD CB F4 1E   [23] 4273 	rr	-12 (ix)
   6594 DD 7E EF      [19] 4274 	ld	a,-17 (ix)
   6597 DD 86 F4      [19] 4275 	add	a, -12 (ix)
   659A DD 77 EF      [19] 4276 	ld	-17 (ix),a
   659D DD 7E F0      [19] 4277 	ld	a,-16 (ix)
   65A0 DD 8E F5      [19] 4278 	adc	a, -11 (ix)
   65A3 DD 77 F0      [19] 4279 	ld	-16 (ix),a
   65A6 DD 6E EF      [19] 4280 	ld	l,-17 (ix)
   65A9 DD 66 F0      [19] 4281 	ld	h,-16 (ix)
   65AC 7E            [ 7] 4282 	ld	a,(hl)
   65AD D6 02         [ 7] 4283 	sub	a, #0x02
   65AF 20 37         [12] 4284 	jr	NZ,00124$
   65B1                    4285 00123$:
                           4286 ;src/CalcColision.h:74: if(player.life < 3 && *corazon == 0){
   65B1 3A 42 91      [13] 4287 	ld	a,(#(_player + 0x0006) + 0)
   65B4 DD 77 EF      [19] 4288 	ld	-17 (ix), a
   65B7 D6 03         [ 7] 4289 	sub	a, #0x03
   65B9 D2 23 69      [10] 4290 	jp	NC,00135$
   65BC DD 7E 04      [19] 4291 	ld	a,4 (ix)
   65BF DD 77 F4      [19] 4292 	ld	-12 (ix),a
   65C2 DD 7E 05      [19] 4293 	ld	a,5 (ix)
   65C5 DD 77 F5      [19] 4294 	ld	-11 (ix),a
   65C8 DD 6E F4      [19] 4295 	ld	l,-12 (ix)
   65CB DD 66 F5      [19] 4296 	ld	h,-11 (ix)
   65CE 7E            [ 7] 4297 	ld	a,(hl)
   65CF DD 77 F8      [19] 4298 	ld	-8 (ix), a
   65D2 B7            [ 4] 4299 	or	a, a
   65D3 C2 23 69      [10] 4300 	jp	NZ,00135$
                           4301 ;src/CalcColision.h:75: player.life += 1;
   65D6 DD 7E EF      [19] 4302 	ld	a,-17 (ix)
   65D9 3C            [ 4] 4303 	inc	a
   65DA 32 42 91      [13] 4304 	ld	(#(_player + 0x0006)),a
                           4305 ;src/CalcColision.h:76: *corazon = 1;
   65DD DD 6E F4      [19] 4306 	ld	l,-12 (ix)
   65E0 DD 66 F5      [19] 4307 	ld	h,-11 (ix)
   65E3 36 01         [10] 4308 	ld	(hl),#0x01
   65E5 C3 23 69      [10] 4309 	jp	00135$
   65E8                    4310 00124$:
                           4311 ;src/CalcColision.h:79: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   65E8 DD 7E F3      [19] 4312 	ld	a,-13 (ix)
   65EB D6 05         [ 7] 4313 	sub	a, #0x05
   65ED CA 03 67      [10] 4314 	jp	Z,00117$
                           4315 ;src/CalcColision.h:80: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   65F0 DD 7E F6      [19] 4316 	ld	a,-10 (ix)
   65F3 DD 77 EF      [19] 4317 	ld	-17 (ix),a
   65F6 DD 7E F7      [19] 4318 	ld	a,-9 (ix)
   65F9 DD 77 F0      [19] 4319 	ld	-16 (ix),a
   65FC DD 7E ED      [19] 4320 	ld	a,-19 (ix)
   65FF B7            [ 4] 4321 	or	a, a
   6600 28 0C         [12] 4322 	jr	Z,00145$
   6602 DD 7E FB      [19] 4323 	ld	a,-5 (ix)
   6605 DD 77 EF      [19] 4324 	ld	-17 (ix),a
   6608 DD 7E FC      [19] 4325 	ld	a,-4 (ix)
   660B DD 77 F0      [19] 4326 	ld	-16 (ix),a
   660E                    4327 00145$:
   660E C1            [10] 4328 	pop	bc
   660F E1            [10] 4329 	pop	hl
   6610 E5            [11] 4330 	push	hl
   6611 C5            [11] 4331 	push	bc
   6612 CB 2C         [ 8] 4332 	sra	h
   6614 CB 1D         [ 8] 4333 	rr	l
   6616 CB 2C         [ 8] 4334 	sra	h
   6618 CB 1D         [ 8] 4335 	rr	l
   661A DD 5E F9      [19] 4336 	ld	e,-7 (ix)
   661D DD 56 FA      [19] 4337 	ld	d,-6 (ix)
   6620 19            [11] 4338 	add	hl,de
   6621 7E            [ 7] 4339 	ld	a,(hl)
   6622 D6 05         [ 7] 4340 	sub	a, #0x05
   6624 CA 03 67      [10] 4341 	jp	Z,00117$
                           4342 ;src/CalcColision.h:81: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   6627 DD 7E F1      [19] 4343 	ld	a,-15 (ix)
   662A DD 77 EF      [19] 4344 	ld	-17 (ix),a
   662D DD 7E F2      [19] 4345 	ld	a,-14 (ix)
   6630 DD 77 F0      [19] 4346 	ld	-16 (ix),a
   6633 DD 7E EE      [19] 4347 	ld	a,-18 (ix)
   6636 B7            [ 4] 4348 	or	a, a
   6637 28 0C         [12] 4349 	jr	Z,00146$
   6639 DD 7E FD      [19] 4350 	ld	a,-3 (ix)
   663C DD 77 EF      [19] 4351 	ld	-17 (ix),a
   663F DD 7E FE      [19] 4352 	ld	a,-2 (ix)
   6642 DD 77 F0      [19] 4353 	ld	-16 (ix),a
   6645                    4354 00146$:
   6645 C1            [10] 4355 	pop	bc
   6646 E1            [10] 4356 	pop	hl
   6647 E5            [11] 4357 	push	hl
   6648 C5            [11] 4358 	push	bc
   6649 CB 2C         [ 8] 4359 	sra	h
   664B CB 1D         [ 8] 4360 	rr	l
   664D CB 2C         [ 8] 4361 	sra	h
   664F CB 1D         [ 8] 4362 	rr	l
   6651 CB 2C         [ 8] 4363 	sra	h
   6653 CB 1D         [ 8] 4364 	rr	l
   6655 CB 2C         [ 8] 4365 	sra	h
   6657 CB 1D         [ 8] 4366 	rr	l
   6659 4D            [ 4] 4367 	ld	c, l
   665A 44            [ 4] 4368 	ld	b, h
   665B 29            [11] 4369 	add	hl, hl
   665C 29            [11] 4370 	add	hl, hl
   665D 09            [11] 4371 	add	hl, bc
   665E 29            [11] 4372 	add	hl, hl
   665F 29            [11] 4373 	add	hl, hl
   6660 11 36 90      [10] 4374 	ld	de,#_scene
   6663 19            [11] 4375 	add	hl,de
   6664 DD 5E FF      [19] 4376 	ld	e,-1 (ix)
   6667 16 00         [ 7] 4377 	ld	d,#0x00
   6669 19            [11] 4378 	add	hl,de
   666A 7E            [ 7] 4379 	ld	a,(hl)
   666B D6 05         [ 7] 4380 	sub	a, #0x05
   666D CA 03 67      [10] 4381 	jp	Z,00117$
                           4382 ;src/CalcColision.h:82: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   6670 DD 7E F1      [19] 4383 	ld	a,-15 (ix)
   6673 DD 77 EF      [19] 4384 	ld	-17 (ix),a
   6676 DD 7E F2      [19] 4385 	ld	a,-14 (ix)
   6679 DD 77 F0      [19] 4386 	ld	-16 (ix),a
   667C DD 7E EE      [19] 4387 	ld	a,-18 (ix)
   667F B7            [ 4] 4388 	or	a, a
   6680 28 0C         [12] 4389 	jr	Z,00147$
   6682 DD 7E FD      [19] 4390 	ld	a,-3 (ix)
   6685 DD 77 EF      [19] 4391 	ld	-17 (ix),a
   6688 DD 7E FE      [19] 4392 	ld	a,-2 (ix)
   668B DD 77 F0      [19] 4393 	ld	-16 (ix),a
   668E                    4394 00147$:
   668E C1            [10] 4395 	pop	bc
   668F E1            [10] 4396 	pop	hl
   6690 E5            [11] 4397 	push	hl
   6691 C5            [11] 4398 	push	bc
   6692 CB 2C         [ 8] 4399 	sra	h
   6694 CB 1D         [ 8] 4400 	rr	l
   6696 CB 2C         [ 8] 4401 	sra	h
   6698 CB 1D         [ 8] 4402 	rr	l
   669A CB 2C         [ 8] 4403 	sra	h
   669C CB 1D         [ 8] 4404 	rr	l
   669E CB 2C         [ 8] 4405 	sra	h
   66A0 CB 1D         [ 8] 4406 	rr	l
   66A2 4D            [ 4] 4407 	ld	c, l
   66A3 44            [ 4] 4408 	ld	b, h
   66A4 29            [11] 4409 	add	hl, hl
   66A5 29            [11] 4410 	add	hl, hl
   66A6 09            [11] 4411 	add	hl, bc
   66A7 29            [11] 4412 	add	hl, hl
   66A8 29            [11] 4413 	add	hl, hl
   66A9 3E 36         [ 7] 4414 	ld	a,#<(_scene)
   66AB 85            [ 4] 4415 	add	a, l
   66AC DD 77 EF      [19] 4416 	ld	-17 (ix),a
   66AF 3E 90         [ 7] 4417 	ld	a,#>(_scene)
   66B1 8C            [ 4] 4418 	adc	a, h
   66B2 DD 77 F0      [19] 4419 	ld	-16 (ix),a
   66B5 DD 7E F6      [19] 4420 	ld	a,-10 (ix)
   66B8 DD 77 F4      [19] 4421 	ld	-12 (ix),a
   66BB DD 7E F7      [19] 4422 	ld	a,-9 (ix)
   66BE DD 77 F5      [19] 4423 	ld	-11 (ix),a
   66C1 DD 7E ED      [19] 4424 	ld	a,-19 (ix)
   66C4 B7            [ 4] 4425 	or	a, a
   66C5 28 0C         [12] 4426 	jr	Z,00148$
   66C7 DD 7E FB      [19] 4427 	ld	a,-5 (ix)
   66CA DD 77 F4      [19] 4428 	ld	-12 (ix),a
   66CD DD 7E FC      [19] 4429 	ld	a,-4 (ix)
   66D0 DD 77 F5      [19] 4430 	ld	-11 (ix),a
   66D3                    4431 00148$:
   66D3 DD CB F5 2E   [23] 4432 	sra	-11 (ix)
   66D7 DD CB F4 1E   [23] 4433 	rr	-12 (ix)
   66DB DD CB F5 2E   [23] 4434 	sra	-11 (ix)
   66DF DD CB F4 1E   [23] 4435 	rr	-12 (ix)
   66E3 DD 7E F4      [19] 4436 	ld	a,-12 (ix)
   66E6 DD 86 EF      [19] 4437 	add	a, -17 (ix)
   66E9 DD 77 EF      [19] 4438 	ld	-17 (ix),a
   66EC DD 7E F5      [19] 4439 	ld	a,-11 (ix)
   66EF DD 8E F0      [19] 4440 	adc	a, -16 (ix)
   66F2 DD 77 F0      [19] 4441 	ld	-16 (ix),a
   66F5 DD 6E EF      [19] 4442 	ld	l,-17 (ix)
   66F8 DD 66 F0      [19] 4443 	ld	h,-16 (ix)
   66FB 7E            [ 7] 4444 	ld	a,(hl)
   66FC DD 77 F8      [19] 4445 	ld	-8 (ix), a
   66FF D6 05         [ 7] 4446 	sub	a, #0x05
   6701 20 37         [12] 4447 	jr	NZ,00118$
   6703                    4448 00117$:
                           4449 ;src/CalcColision.h:84: if(player.bullets < 3 && *flecha == 0){
   6703 3A 46 91      [13] 4450 	ld	a,(#(_player + 0x000a) + 0)
   6706 DD 77 F8      [19] 4451 	ld	-8 (ix), a
   6709 D6 03         [ 7] 4452 	sub	a, #0x03
   670B D2 23 69      [10] 4453 	jp	NC,00135$
   670E DD 7E 06      [19] 4454 	ld	a,6 (ix)
   6711 DD 77 EF      [19] 4455 	ld	-17 (ix),a
   6714 DD 7E 07      [19] 4456 	ld	a,7 (ix)
   6717 DD 77 F0      [19] 4457 	ld	-16 (ix),a
   671A DD 6E EF      [19] 4458 	ld	l,-17 (ix)
   671D DD 66 F0      [19] 4459 	ld	h,-16 (ix)
   6720 7E            [ 7] 4460 	ld	a,(hl)
   6721 B7            [ 4] 4461 	or	a, a
   6722 C2 23 69      [10] 4462 	jp	NZ,00135$
                           4463 ;src/CalcColision.h:85: player.bullets += 1;
   6725 DD 34 F8      [23] 4464 	inc	-8 (ix)
   6728 21 46 91      [10] 4465 	ld	hl,#(_player + 0x000a)
   672B DD 7E F8      [19] 4466 	ld	a,-8 (ix)
   672E 77            [ 7] 4467 	ld	(hl),a
                           4468 ;src/CalcColision.h:86: *flecha = 1;
   672F DD 6E EF      [19] 4469 	ld	l,-17 (ix)
   6732 DD 66 F0      [19] 4470 	ld	h,-16 (ix)
   6735 36 01         [10] 4471 	ld	(hl),#0x01
   6737 C3 23 69      [10] 4472 	jp	00135$
   673A                    4473 00118$:
                           4474 ;src/CalcColision.h:88: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   673A DD 7E F3      [19] 4475 	ld	a,-13 (ix)
   673D D6 09         [ 7] 4476 	sub	a, #0x09
   673F CA C1 68      [10] 4477 	jp	Z,00112$
                           4478 ;src/CalcColision.h:89: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   6742 DD 7E F6      [19] 4479 	ld	a,-10 (ix)
   6745 DD 77 EF      [19] 4480 	ld	-17 (ix),a
   6748 DD 7E F7      [19] 4481 	ld	a,-9 (ix)
   674B DD 77 F0      [19] 4482 	ld	-16 (ix),a
   674E DD 7E ED      [19] 4483 	ld	a,-19 (ix)
   6751 B7            [ 4] 4484 	or	a, a
   6752 28 0C         [12] 4485 	jr	Z,00149$
   6754 DD 7E FB      [19] 4486 	ld	a,-5 (ix)
   6757 DD 77 EF      [19] 4487 	ld	-17 (ix),a
   675A DD 7E FC      [19] 4488 	ld	a,-4 (ix)
   675D DD 77 F0      [19] 4489 	ld	-16 (ix),a
   6760                    4490 00149$:
   6760 DD CB F0 2E   [23] 4491 	sra	-16 (ix)
   6764 DD CB EF 1E   [23] 4492 	rr	-17 (ix)
   6768 DD CB F0 2E   [23] 4493 	sra	-16 (ix)
   676C DD CB EF 1E   [23] 4494 	rr	-17 (ix)
   6770 DD 7E EF      [19] 4495 	ld	a,-17 (ix)
   6773 DD 86 F9      [19] 4496 	add	a, -7 (ix)
   6776 DD 77 EF      [19] 4497 	ld	-17 (ix),a
   6779 DD 7E F0      [19] 4498 	ld	a,-16 (ix)
   677C DD 8E FA      [19] 4499 	adc	a, -6 (ix)
   677F DD 77 F0      [19] 4500 	ld	-16 (ix),a
   6782 DD 6E EF      [19] 4501 	ld	l,-17 (ix)
   6785 DD 66 F0      [19] 4502 	ld	h,-16 (ix)
   6788 7E            [ 7] 4503 	ld	a,(hl)
   6789 DD 77 F8      [19] 4504 	ld	-8 (ix), a
   678C D6 09         [ 7] 4505 	sub	a, #0x09
   678E CA C1 68      [10] 4506 	jp	Z,00112$
                           4507 ;src/CalcColision.h:90: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   6791 DD 7E F1      [19] 4508 	ld	a,-15 (ix)
   6794 DD 77 EF      [19] 4509 	ld	-17 (ix),a
   6797 DD 7E F2      [19] 4510 	ld	a,-14 (ix)
   679A DD 77 F0      [19] 4511 	ld	-16 (ix),a
   679D DD 7E EE      [19] 4512 	ld	a,-18 (ix)
   67A0 B7            [ 4] 4513 	or	a, a
   67A1 28 0C         [12] 4514 	jr	Z,00150$
   67A3 DD 7E FD      [19] 4515 	ld	a,-3 (ix)
   67A6 DD 77 EF      [19] 4516 	ld	-17 (ix),a
   67A9 DD 7E FE      [19] 4517 	ld	a,-2 (ix)
   67AC DD 77 F0      [19] 4518 	ld	-16 (ix),a
   67AF                    4519 00150$:
   67AF DD CB F0 2E   [23] 4520 	sra	-16 (ix)
   67B3 DD CB EF 1E   [23] 4521 	rr	-17 (ix)
   67B7 DD CB F0 2E   [23] 4522 	sra	-16 (ix)
   67BB DD CB EF 1E   [23] 4523 	rr	-17 (ix)
   67BF DD CB F0 2E   [23] 4524 	sra	-16 (ix)
   67C3 DD CB EF 1E   [23] 4525 	rr	-17 (ix)
   67C7 DD CB F0 2E   [23] 4526 	sra	-16 (ix)
   67CB DD CB EF 1E   [23] 4527 	rr	-17 (ix)
   67CF DD 4E EF      [19] 4528 	ld	c,-17 (ix)
   67D2 DD 46 F0      [19] 4529 	ld	b,-16 (ix)
   67D5 69            [ 4] 4530 	ld	l, c
   67D6 60            [ 4] 4531 	ld	h, b
   67D7 29            [11] 4532 	add	hl, hl
   67D8 29            [11] 4533 	add	hl, hl
   67D9 09            [11] 4534 	add	hl, bc
   67DA 29            [11] 4535 	add	hl, hl
   67DB 29            [11] 4536 	add	hl, hl
   67DC DD 75 EF      [19] 4537 	ld	-17 (ix),l
   67DF DD 74 F0      [19] 4538 	ld	-16 (ix),h
   67E2 DD 7E EF      [19] 4539 	ld	a,-17 (ix)
   67E5 C6 36         [ 7] 4540 	add	a, #<(_scene)
   67E7 DD 77 EF      [19] 4541 	ld	-17 (ix),a
   67EA DD 7E F0      [19] 4542 	ld	a,-16 (ix)
   67ED CE 90         [ 7] 4543 	adc	a, #>(_scene)
   67EF DD 77 F0      [19] 4544 	ld	-16 (ix),a
   67F2 DD 7E EF      [19] 4545 	ld	a,-17 (ix)
   67F5 DD 86 FF      [19] 4546 	add	a, -1 (ix)
   67F8 DD 77 EF      [19] 4547 	ld	-17 (ix),a
   67FB DD 7E F0      [19] 4548 	ld	a,-16 (ix)
   67FE CE 00         [ 7] 4549 	adc	a, #0x00
   6800 DD 77 F0      [19] 4550 	ld	-16 (ix),a
   6803 DD 6E EF      [19] 4551 	ld	l,-17 (ix)
   6806 DD 66 F0      [19] 4552 	ld	h,-16 (ix)
   6809 7E            [ 7] 4553 	ld	a,(hl)
   680A DD 77 F8      [19] 4554 	ld	-8 (ix), a
   680D D6 09         [ 7] 4555 	sub	a, #0x09
   680F CA C1 68      [10] 4556 	jp	Z,00112$
                           4557 ;src/CalcColision.h:91: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   6812 DD 7E F1      [19] 4558 	ld	a,-15 (ix)
   6815 DD 77 EF      [19] 4559 	ld	-17 (ix),a
   6818 DD 7E F2      [19] 4560 	ld	a,-14 (ix)
   681B DD 77 F0      [19] 4561 	ld	-16 (ix),a
   681E DD 7E EE      [19] 4562 	ld	a,-18 (ix)
   6821 B7            [ 4] 4563 	or	a, a
   6822 28 0C         [12] 4564 	jr	Z,00151$
   6824 DD 7E FD      [19] 4565 	ld	a,-3 (ix)
   6827 DD 77 EF      [19] 4566 	ld	-17 (ix),a
   682A DD 7E FE      [19] 4567 	ld	a,-2 (ix)
   682D DD 77 F0      [19] 4568 	ld	-16 (ix),a
   6830                    4569 00151$:
   6830 DD CB F0 2E   [23] 4570 	sra	-16 (ix)
   6834 DD CB EF 1E   [23] 4571 	rr	-17 (ix)
   6838 DD CB F0 2E   [23] 4572 	sra	-16 (ix)
   683C DD CB EF 1E   [23] 4573 	rr	-17 (ix)
   6840 DD CB F0 2E   [23] 4574 	sra	-16 (ix)
   6844 DD CB EF 1E   [23] 4575 	rr	-17 (ix)
   6848 DD CB F0 2E   [23] 4576 	sra	-16 (ix)
   684C DD CB EF 1E   [23] 4577 	rr	-17 (ix)
   6850 DD 4E EF      [19] 4578 	ld	c,-17 (ix)
   6853 DD 46 F0      [19] 4579 	ld	b,-16 (ix)
   6856 69            [ 4] 4580 	ld	l, c
   6857 60            [ 4] 4581 	ld	h, b
   6858 29            [11] 4582 	add	hl, hl
   6859 29            [11] 4583 	add	hl, hl
   685A 09            [11] 4584 	add	hl, bc
   685B 29            [11] 4585 	add	hl, hl
   685C 29            [11] 4586 	add	hl, hl
   685D DD 75 EF      [19] 4587 	ld	-17 (ix),l
   6860 DD 74 F0      [19] 4588 	ld	-16 (ix),h
   6863 3E 36         [ 7] 4589 	ld	a,#<(_scene)
   6865 DD 86 EF      [19] 4590 	add	a, -17 (ix)
   6868 DD 77 EF      [19] 4591 	ld	-17 (ix),a
   686B 3E 90         [ 7] 4592 	ld	a,#>(_scene)
   686D DD 8E F0      [19] 4593 	adc	a, -16 (ix)
   6870 DD 77 F0      [19] 4594 	ld	-16 (ix),a
   6873 DD 7E F6      [19] 4595 	ld	a,-10 (ix)
   6876 DD 77 F4      [19] 4596 	ld	-12 (ix),a
   6879 DD 7E F7      [19] 4597 	ld	a,-9 (ix)
   687C DD 77 F5      [19] 4598 	ld	-11 (ix),a
   687F DD 7E ED      [19] 4599 	ld	a,-19 (ix)
   6882 B7            [ 4] 4600 	or	a, a
   6883 28 0C         [12] 4601 	jr	Z,00152$
   6885 DD 7E FB      [19] 4602 	ld	a,-5 (ix)
   6888 DD 77 F4      [19] 4603 	ld	-12 (ix),a
   688B DD 7E FC      [19] 4604 	ld	a,-4 (ix)
   688E DD 77 F5      [19] 4605 	ld	-11 (ix),a
   6891                    4606 00152$:
   6891 DD CB F5 2E   [23] 4607 	sra	-11 (ix)
   6895 DD CB F4 1E   [23] 4608 	rr	-12 (ix)
   6899 DD CB F5 2E   [23] 4609 	sra	-11 (ix)
   689D DD CB F4 1E   [23] 4610 	rr	-12 (ix)
   68A1 DD 7E F4      [19] 4611 	ld	a,-12 (ix)
   68A4 DD 86 EF      [19] 4612 	add	a, -17 (ix)
   68A7 DD 77 EF      [19] 4613 	ld	-17 (ix),a
   68AA DD 7E F5      [19] 4614 	ld	a,-11 (ix)
   68AD DD 8E F0      [19] 4615 	adc	a, -16 (ix)
   68B0 DD 77 F0      [19] 4616 	ld	-16 (ix),a
   68B3 DD 6E EF      [19] 4617 	ld	l,-17 (ix)
   68B6 DD 66 F0      [19] 4618 	ld	h,-16 (ix)
   68B9 7E            [ 7] 4619 	ld	a,(hl)
   68BA DD 77 F8      [19] 4620 	ld	-8 (ix), a
   68BD D6 09         [ 7] 4621 	sub	a, #0x09
   68BF 20 62         [12] 4622 	jr	NZ,00135$
   68C1                    4623 00112$:
                           4624 ;src/CalcColision.h:94: if(enemy.life == 0){
   68C1 3A 4F 91      [13] 4625 	ld	a, (#(_enemy + 0x0008) + 0)
   68C4 B7            [ 4] 4626 	or	a, a
   68C5 20 4F         [12] 4627 	jr	NZ,00110$
                           4628 ;src/CalcColision.h:95: map+=1;
   68C7 21 27 91      [10] 4629 	ld	hl, #_map+0
   68CA 34            [11] 4630 	inc	(hl)
                           4631 ;src/CalcColision.h:96: if(map > maps){
   68CB 3E 04         [ 7] 4632 	ld	a,#0x04
   68CD FD 21 27 91   [14] 4633 	ld	iy,#_map
   68D1 FD 96 00      [19] 4634 	sub	a, 0 (iy)
   68D4 30 0A         [12] 4635 	jr	NC,00108$
                           4636 ;src/CalcColision.h:97: endGame();
   68D6 CD 6B 4E      [17] 4637 	call	_endGame
                           4638 ;src/CalcColision.h:98: finish = 1;
   68D9 21 29 91      [10] 4639 	ld	hl,#_finish + 0
   68DC 36 01         [10] 4640 	ld	(hl), #0x01
                           4641 ;src/CalcColision.h:99: return;
   68DE 18 43         [12] 4642 	jr	00135$
   68E0                    4643 00108$:
                           4644 ;src/CalcColision.h:102: initVariables(map);
   68E0 3A 27 91      [13] 4645 	ld	a,(_map)
   68E3 F5            [11] 4646 	push	af
   68E4 33            [ 6] 4647 	inc	sp
   68E5 CD 3F 4E      [17] 4648 	call	_initVariables
   68E8 33            [ 6] 4649 	inc	sp
                           4650 ;src/CalcColision.h:103: restartPlayer(map);
   68E9 3A 27 91      [13] 4651 	ld	a,(_map)
   68EC F5            [11] 4652 	push	af
   68ED 33            [ 6] 4653 	inc	sp
   68EE CD 8B 4D      [17] 4654 	call	_restartPlayer
   68F1 33            [ 6] 4655 	inc	sp
                           4656 ;src/CalcColision.h:104: initNivel();
   68F2 CD 2F 4E      [17] 4657 	call	_initNivel
                           4658 ;src/CalcColision.h:105: initEnemies(map);
   68F5 3A 27 91      [13] 4659 	ld	a,(_map)
   68F8 F5            [11] 4660 	push	af
   68F9 33            [ 6] 4661 	inc	sp
   68FA CD CB 4D      [17] 4662 	call	_initEnemies
   68FD 33            [ 6] 4663 	inc	sp
                           4664 ;src/CalcColision.h:107: cpct_clearScreen(0);
   68FE 21 00 40      [10] 4665 	ld	hl,#0x4000
   6901 E5            [11] 4666 	push	hl
   6902 AF            [ 4] 4667 	xor	a, a
   6903 F5            [11] 4668 	push	af
   6904 33            [ 6] 4669 	inc	sp
   6905 26 C0         [ 7] 4670 	ld	h, #0xC0
   6907 E5            [11] 4671 	push	hl
   6908 CD 4D 8E      [17] 4672 	call	_cpct_memset
                           4673 ;src/CalcColision.h:109: drawMap(map);
   690B 3A 27 91      [13] 4674 	ld	a,(_map)
   690E F5            [11] 4675 	push	af
   690F 33            [ 6] 4676 	inc	sp
   6910 CD BC 51      [17] 4677 	call	_drawMap
   6913 33            [ 6] 4678 	inc	sp
   6914 18 0D         [12] 4679 	jr	00135$
   6916                    4680 00110$:
                           4681 ;src/CalcColision.h:111: player.x=player.lx;
   6916 3A 3E 91      [13] 4682 	ld	a, (#(_player + 0x0002) + 0)
   6919 21 3C 91      [10] 4683 	ld	hl,#_player
   691C 77            [ 7] 4684 	ld	(hl),a
                           4685 ;src/CalcColision.h:112: player.y=player.ly;
   691D 3A 3F 91      [13] 4686 	ld	a, (#(_player + 0x0003) + 0)
   6920 32 3D 91      [13] 4687 	ld	(#(_player + 0x0001)),a
   6923                    4688 00135$:
   6923 DD F9         [10] 4689 	ld	sp, ix
   6925 DD E1         [14] 4690 	pop	ix
   6927 C9            [10] 4691 	ret
                           4692 ;src/CalcColision.h:118: u8 checkArrowCollisions(){
                           4693 ;	---------------------------------
                           4694 ; Function checkArrowCollisions
                           4695 ; ---------------------------------
   6928                    4696 _checkArrowCollisions::
   6928 DD E5         [15] 4697 	push	ix
   692A DD 21 00 00   [14] 4698 	ld	ix,#0
   692E DD 39         [15] 4699 	add	ix,sp
   6930 21 F2 FF      [10] 4700 	ld	hl,#-14
   6933 39            [11] 4701 	add	hl,sp
   6934 F9            [ 6] 4702 	ld	sp,hl
                           4703 ;src/CalcColision.h:121: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   6935 3A 33 91      [13] 4704 	ld	a,(#(_object + 0x0001) + 0)
   6938 DD 77 F3      [19] 4705 	ld	-13 (ix), a
   693B 07            [ 4] 4706 	rlca
   693C 07            [ 4] 4707 	rlca
   693D 07            [ 4] 4708 	rlca
   693E 07            [ 4] 4709 	rlca
   693F E6 0F         [ 7] 4710 	and	a,#0x0F
   6941 4F            [ 4] 4711 	ld	c,a
   6942 06 00         [ 7] 4712 	ld	b,#0x00
   6944 69            [ 4] 4713 	ld	l, c
   6945 60            [ 4] 4714 	ld	h, b
   6946 29            [11] 4715 	add	hl, hl
   6947 29            [11] 4716 	add	hl, hl
   6948 09            [11] 4717 	add	hl, bc
   6949 29            [11] 4718 	add	hl, hl
   694A 29            [11] 4719 	add	hl, hl
   694B 3E 36         [ 7] 4720 	ld	a,#<(_scene)
   694D 85            [ 4] 4721 	add	a, l
   694E DD 77 F6      [19] 4722 	ld	-10 (ix),a
   6951 3E 90         [ 7] 4723 	ld	a,#>(_scene)
   6953 8C            [ 4] 4724 	adc	a, h
   6954 DD 77 F7      [19] 4725 	ld	-9 (ix),a
   6957 21 32 91      [10] 4726 	ld	hl, #_object + 0
   695A 4E            [ 7] 4727 	ld	c,(hl)
   695B 79            [ 4] 4728 	ld	a,c
   695C 0F            [ 4] 4729 	rrca
   695D 0F            [ 4] 4730 	rrca
   695E E6 3F         [ 7] 4731 	and	a,#0x3F
   6960 DD 77 F2      [19] 4732 	ld	-14 (ix), a
   6963 DD 86 F6      [19] 4733 	add	a, -10 (ix)
   6966 6F            [ 4] 4734 	ld	l,a
   6967 3E 00         [ 7] 4735 	ld	a,#0x00
   6969 DD 8E F7      [19] 4736 	adc	a, -9 (ix)
   696C 67            [ 4] 4737 	ld	h,a
   696D 7E            [ 7] 4738 	ld	a,(hl)
                           4739 ;src/CalcColision.h:126: object.x=object.lx;
                           4740 ;src/CalcColision.h:127: object.y=object.ly;
                           4741 ;src/CalcColision.h:121: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   696E DD 77 F4      [19] 4742 	ld	-12 (ix), a
   6971 3D            [ 4] 4743 	dec	a
   6972 CA 91 6A      [10] 4744 	jp	Z,00101$
                           4745 ;src/CalcColision.h:122: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   6975 06 00         [ 7] 4746 	ld	b,#0x00
   6977 21 03 00      [10] 4747 	ld	hl,#0x0003
   697A 09            [11] 4748 	add	hl,bc
   697B DD 75 FC      [19] 4749 	ld	-4 (ix),l
   697E DD 74 FD      [19] 4750 	ld	-3 (ix),h
   6981 DD 7E FC      [19] 4751 	ld	a,-4 (ix)
   6984 DD 77 FA      [19] 4752 	ld	-6 (ix),a
   6987 DD 7E FD      [19] 4753 	ld	a,-3 (ix)
   698A DD 77 FB      [19] 4754 	ld	-5 (ix),a
   698D DD 7E FD      [19] 4755 	ld	a,-3 (ix)
   6990 07            [ 4] 4756 	rlca
   6991 E6 01         [ 7] 4757 	and	a,#0x01
   6993 DD 77 F5      [19] 4758 	ld	-11 (ix),a
   6996 21 06 00      [10] 4759 	ld	hl,#0x0006
   6999 09            [11] 4760 	add	hl,bc
   699A DD 75 FE      [19] 4761 	ld	-2 (ix),l
   699D DD 74 FF      [19] 4762 	ld	-1 (ix),h
   69A0 DD 7E F5      [19] 4763 	ld	a,-11 (ix)
   69A3 B7            [ 4] 4764 	or	a, a
   69A4 28 0C         [12] 4765 	jr	Z,00113$
   69A6 DD 7E FE      [19] 4766 	ld	a,-2 (ix)
   69A9 DD 77 FA      [19] 4767 	ld	-6 (ix),a
   69AC DD 7E FF      [19] 4768 	ld	a,-1 (ix)
   69AF DD 77 FB      [19] 4769 	ld	-5 (ix),a
   69B2                    4770 00113$:
   69B2 DD 6E FA      [19] 4771 	ld	l,-6 (ix)
   69B5 DD 66 FB      [19] 4772 	ld	h,-5 (ix)
   69B8 CB 2C         [ 8] 4773 	sra	h
   69BA CB 1D         [ 8] 4774 	rr	l
   69BC CB 2C         [ 8] 4775 	sra	h
   69BE CB 1D         [ 8] 4776 	rr	l
   69C0 DD 5E F6      [19] 4777 	ld	e,-10 (ix)
   69C3 DD 56 F7      [19] 4778 	ld	d,-9 (ix)
   69C6 19            [11] 4779 	add	hl,de
   69C7 7E            [ 7] 4780 	ld	a,(hl)
   69C8 3D            [ 4] 4781 	dec	a
   69C9 CA 91 6A      [10] 4782 	jp	Z,00101$
                           4783 ;src/CalcColision.h:123: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 1
   69CC DD 5E F3      [19] 4784 	ld	e,-13 (ix)
   69CF 16 00         [ 7] 4785 	ld	d,#0x00
   69D1 21 06 00      [10] 4786 	ld	hl,#0x0006
   69D4 19            [11] 4787 	add	hl,de
   69D5 4D            [ 4] 4788 	ld	c,l
   69D6 44            [ 4] 4789 	ld	b,h
   69D7 DD 71 FA      [19] 4790 	ld	-6 (ix),c
   69DA DD 70 FB      [19] 4791 	ld	-5 (ix),b
   69DD 78            [ 4] 4792 	ld	a,b
   69DE 07            [ 4] 4793 	rlca
   69DF E6 01         [ 7] 4794 	and	a,#0x01
   69E1 DD 77 F3      [19] 4795 	ld	-13 (ix),a
   69E4 21 15 00      [10] 4796 	ld	hl,#0x0015
   69E7 19            [11] 4797 	add	hl,de
   69E8 DD 75 F8      [19] 4798 	ld	-8 (ix),l
   69EB DD 74 F9      [19] 4799 	ld	-7 (ix),h
   69EE DD 7E F3      [19] 4800 	ld	a,-13 (ix)
   69F1 B7            [ 4] 4801 	or	a, a
   69F2 28 0C         [12] 4802 	jr	Z,00114$
   69F4 DD 7E F8      [19] 4803 	ld	a,-8 (ix)
   69F7 DD 77 FA      [19] 4804 	ld	-6 (ix),a
   69FA DD 7E F9      [19] 4805 	ld	a,-7 (ix)
   69FD DD 77 FB      [19] 4806 	ld	-5 (ix),a
   6A00                    4807 00114$:
   6A00 DD 6E FA      [19] 4808 	ld	l,-6 (ix)
   6A03 DD 66 FB      [19] 4809 	ld	h,-5 (ix)
   6A06 CB 2C         [ 8] 4810 	sra	h
   6A08 CB 1D         [ 8] 4811 	rr	l
   6A0A CB 2C         [ 8] 4812 	sra	h
   6A0C CB 1D         [ 8] 4813 	rr	l
   6A0E CB 2C         [ 8] 4814 	sra	h
   6A10 CB 1D         [ 8] 4815 	rr	l
   6A12 CB 2C         [ 8] 4816 	sra	h
   6A14 CB 1D         [ 8] 4817 	rr	l
   6A16 5D            [ 4] 4818 	ld	e, l
   6A17 54            [ 4] 4819 	ld	d, h
   6A18 29            [11] 4820 	add	hl, hl
   6A19 29            [11] 4821 	add	hl, hl
   6A1A 19            [11] 4822 	add	hl, de
   6A1B 29            [11] 4823 	add	hl, hl
   6A1C 29            [11] 4824 	add	hl, hl
   6A1D 11 36 90      [10] 4825 	ld	de,#_scene
   6A20 19            [11] 4826 	add	hl,de
   6A21 DD 5E F2      [19] 4827 	ld	e,-14 (ix)
   6A24 16 00         [ 7] 4828 	ld	d,#0x00
   6A26 19            [11] 4829 	add	hl,de
   6A27 7E            [ 7] 4830 	ld	a,(hl)
   6A28 3D            [ 4] 4831 	dec	a
   6A29 28 66         [12] 4832 	jr	Z,00101$
                           4833 ;src/CalcColision.h:124: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   6A2B DD 71 FA      [19] 4834 	ld	-6 (ix),c
   6A2E DD 70 FB      [19] 4835 	ld	-5 (ix),b
   6A31 DD 7E F3      [19] 4836 	ld	a,-13 (ix)
   6A34 B7            [ 4] 4837 	or	a, a
   6A35 28 0C         [12] 4838 	jr	Z,00115$
   6A37 DD 7E F8      [19] 4839 	ld	a,-8 (ix)
   6A3A DD 77 FA      [19] 4840 	ld	-6 (ix),a
   6A3D DD 7E F9      [19] 4841 	ld	a,-7 (ix)
   6A40 DD 77 FB      [19] 4842 	ld	-5 (ix),a
   6A43                    4843 00115$:
   6A43 DD 6E FA      [19] 4844 	ld	l,-6 (ix)
   6A46 DD 66 FB      [19] 4845 	ld	h,-5 (ix)
   6A49 CB 2C         [ 8] 4846 	sra	h
   6A4B CB 1D         [ 8] 4847 	rr	l
   6A4D CB 2C         [ 8] 4848 	sra	h
   6A4F CB 1D         [ 8] 4849 	rr	l
   6A51 CB 2C         [ 8] 4850 	sra	h
   6A53 CB 1D         [ 8] 4851 	rr	l
   6A55 CB 2C         [ 8] 4852 	sra	h
   6A57 CB 1D         [ 8] 4853 	rr	l
   6A59 5D            [ 4] 4854 	ld	e, l
   6A5A 54            [ 4] 4855 	ld	d, h
   6A5B 29            [11] 4856 	add	hl, hl
   6A5C 29            [11] 4857 	add	hl, hl
   6A5D 19            [11] 4858 	add	hl, de
   6A5E 29            [11] 4859 	add	hl, hl
   6A5F 29            [11] 4860 	add	hl, hl
   6A60 3E 36         [ 7] 4861 	ld	a,#<(_scene)
   6A62 85            [ 4] 4862 	add	a, l
   6A63 DD 77 FA      [19] 4863 	ld	-6 (ix),a
   6A66 3E 90         [ 7] 4864 	ld	a,#>(_scene)
   6A68 8C            [ 4] 4865 	adc	a, h
   6A69 DD 77 FB      [19] 4866 	ld	-5 (ix),a
   6A6C DD 6E FC      [19] 4867 	ld	l,-4 (ix)
   6A6F DD 66 FD      [19] 4868 	ld	h,-3 (ix)
   6A72 DD 7E F5      [19] 4869 	ld	a,-11 (ix)
   6A75 B7            [ 4] 4870 	or	a, a
   6A76 28 06         [12] 4871 	jr	Z,00116$
   6A78 DD 6E FE      [19] 4872 	ld	l,-2 (ix)
   6A7B DD 66 FF      [19] 4873 	ld	h,-1 (ix)
   6A7E                    4874 00116$:
   6A7E CB 2C         [ 8] 4875 	sra	h
   6A80 CB 1D         [ 8] 4876 	rr	l
   6A82 CB 2C         [ 8] 4877 	sra	h
   6A84 CB 1D         [ 8] 4878 	rr	l
   6A86 DD 5E FA      [19] 4879 	ld	e,-6 (ix)
   6A89 DD 56 FB      [19] 4880 	ld	d,-5 (ix)
   6A8C 19            [11] 4881 	add	hl,de
   6A8D 7E            [ 7] 4882 	ld	a,(hl)
   6A8E 3D            [ 4] 4883 	dec	a
   6A8F 20 11         [12] 4884 	jr	NZ,00102$
   6A91                    4885 00101$:
                           4886 ;src/CalcColision.h:126: object.x=object.lx;
   6A91 3A 34 91      [13] 4887 	ld	a, (#(_object + 0x0002) + 0)
   6A94 32 32 91      [13] 4888 	ld	(#_object),a
                           4889 ;src/CalcColision.h:127: object.y=object.ly;
   6A97 3A 35 91      [13] 4890 	ld	a, (#(_object + 0x0003) + 0)
   6A9A 32 33 91      [13] 4891 	ld	(#(_object + 0x0001)),a
                           4892 ;src/CalcColision.h:129: return bound;
   6A9D 2E 01         [ 7] 4893 	ld	l,#0x01
   6A9F C3 6C 6B      [10] 4894 	jp	00111$
   6AA2                    4895 00102$:
                           4896 ;src/CalcColision.h:132: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 9
   6AA2 DD 7E F4      [19] 4897 	ld	a,-12 (ix)
   6AA5 D6 09         [ 7] 4898 	sub	a, #0x09
   6AA7 CA 5A 6B      [10] 4899 	jp	Z,00106$
                           4900 ;src/CalcColision.h:133: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   6AAA DD 6E FC      [19] 4901 	ld	l,-4 (ix)
   6AAD DD 66 FD      [19] 4902 	ld	h,-3 (ix)
   6AB0 DD 7E F5      [19] 4903 	ld	a,-11 (ix)
   6AB3 B7            [ 4] 4904 	or	a, a
   6AB4 28 06         [12] 4905 	jr	Z,00117$
   6AB6 DD 6E FE      [19] 4906 	ld	l,-2 (ix)
   6AB9 DD 66 FF      [19] 4907 	ld	h,-1 (ix)
   6ABC                    4908 00117$:
   6ABC CB 2C         [ 8] 4909 	sra	h
   6ABE CB 1D         [ 8] 4910 	rr	l
   6AC0 CB 2C         [ 8] 4911 	sra	h
   6AC2 CB 1D         [ 8] 4912 	rr	l
   6AC4 DD 5E F6      [19] 4913 	ld	e,-10 (ix)
   6AC7 DD 56 F7      [19] 4914 	ld	d,-9 (ix)
   6ACA 19            [11] 4915 	add	hl,de
   6ACB 7E            [ 7] 4916 	ld	a,(hl)
   6ACC D6 09         [ 7] 4917 	sub	a, #0x09
   6ACE CA 5A 6B      [10] 4918 	jp	Z,00106$
                           4919 ;src/CalcColision.h:134: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 9
   6AD1 69            [ 4] 4920 	ld	l, c
   6AD2 60            [ 4] 4921 	ld	h, b
   6AD3 DD 7E F3      [19] 4922 	ld	a,-13 (ix)
   6AD6 B7            [ 4] 4923 	or	a, a
   6AD7 28 06         [12] 4924 	jr	Z,00118$
   6AD9 DD 6E F8      [19] 4925 	ld	l,-8 (ix)
   6ADC DD 66 F9      [19] 4926 	ld	h,-7 (ix)
   6ADF                    4927 00118$:
   6ADF CB 2C         [ 8] 4928 	sra	h
   6AE1 CB 1D         [ 8] 4929 	rr	l
   6AE3 CB 2C         [ 8] 4930 	sra	h
   6AE5 CB 1D         [ 8] 4931 	rr	l
   6AE7 CB 2C         [ 8] 4932 	sra	h
   6AE9 CB 1D         [ 8] 4933 	rr	l
   6AEB CB 2C         [ 8] 4934 	sra	h
   6AED CB 1D         [ 8] 4935 	rr	l
   6AEF 5D            [ 4] 4936 	ld	e, l
   6AF0 54            [ 4] 4937 	ld	d, h
   6AF1 29            [11] 4938 	add	hl, hl
   6AF2 29            [11] 4939 	add	hl, hl
   6AF3 19            [11] 4940 	add	hl, de
   6AF4 29            [11] 4941 	add	hl, hl
   6AF5 29            [11] 4942 	add	hl, hl
   6AF6 11 36 90      [10] 4943 	ld	de,#_scene
   6AF9 19            [11] 4944 	add	hl,de
   6AFA DD 5E F2      [19] 4945 	ld	e,-14 (ix)
   6AFD 16 00         [ 7] 4946 	ld	d,#0x00
   6AFF 19            [11] 4947 	add	hl,de
   6B00 7E            [ 7] 4948 	ld	a,(hl)
   6B01 D6 09         [ 7] 4949 	sub	a, #0x09
   6B03 28 55         [12] 4950 	jr	Z,00106$
                           4951 ;src/CalcColision.h:135: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   6B05 DD 7E F3      [19] 4952 	ld	a,-13 (ix)
   6B08 B7            [ 4] 4953 	or	a, a
   6B09 28 06         [12] 4954 	jr	Z,00119$
   6B0B DD 4E F8      [19] 4955 	ld	c,-8 (ix)
   6B0E DD 46 F9      [19] 4956 	ld	b,-7 (ix)
   6B11                    4957 00119$:
   6B11 CB 28         [ 8] 4958 	sra	b
   6B13 CB 19         [ 8] 4959 	rr	c
   6B15 CB 28         [ 8] 4960 	sra	b
   6B17 CB 19         [ 8] 4961 	rr	c
   6B19 CB 28         [ 8] 4962 	sra	b
   6B1B CB 19         [ 8] 4963 	rr	c
   6B1D CB 28         [ 8] 4964 	sra	b
   6B1F CB 19         [ 8] 4965 	rr	c
   6B21 69            [ 4] 4966 	ld	l, c
   6B22 60            [ 4] 4967 	ld	h, b
   6B23 29            [11] 4968 	add	hl, hl
   6B24 29            [11] 4969 	add	hl, hl
   6B25 09            [11] 4970 	add	hl, bc
   6B26 29            [11] 4971 	add	hl, hl
   6B27 29            [11] 4972 	add	hl, hl
   6B28 3E 36         [ 7] 4973 	ld	a,#<(_scene)
   6B2A 85            [ 4] 4974 	add	a, l
   6B2B DD 77 F8      [19] 4975 	ld	-8 (ix),a
   6B2E 3E 90         [ 7] 4976 	ld	a,#>(_scene)
   6B30 8C            [ 4] 4977 	adc	a, h
   6B31 DD 77 F9      [19] 4978 	ld	-7 (ix),a
   6B34 DD 6E FC      [19] 4979 	ld	l,-4 (ix)
   6B37 DD 66 FD      [19] 4980 	ld	h,-3 (ix)
   6B3A DD 7E F5      [19] 4981 	ld	a,-11 (ix)
   6B3D B7            [ 4] 4982 	or	a, a
   6B3E 28 06         [12] 4983 	jr	Z,00120$
   6B40 DD 6E FE      [19] 4984 	ld	l,-2 (ix)
   6B43 DD 66 FF      [19] 4985 	ld	h,-1 (ix)
   6B46                    4986 00120$:
   6B46 CB 2C         [ 8] 4987 	sra	h
   6B48 CB 1D         [ 8] 4988 	rr	l
   6B4A CB 2C         [ 8] 4989 	sra	h
   6B4C CB 1D         [ 8] 4990 	rr	l
   6B4E DD 5E F8      [19] 4991 	ld	e,-8 (ix)
   6B51 DD 56 F9      [19] 4992 	ld	d,-7 (ix)
   6B54 19            [11] 4993 	add	hl,de
   6B55 7E            [ 7] 4994 	ld	a,(hl)
   6B56 D6 09         [ 7] 4995 	sub	a, #0x09
   6B58 20 10         [12] 4996 	jr	NZ,00107$
   6B5A                    4997 00106$:
                           4998 ;src/CalcColision.h:137: object.x=object.lx;
   6B5A 3A 34 91      [13] 4999 	ld	a, (#(_object + 0x0002) + 0)
   6B5D 32 32 91      [13] 5000 	ld	(#_object),a
                           5001 ;src/CalcColision.h:138: object.y=object.ly;
   6B60 3A 35 91      [13] 5002 	ld	a, (#(_object + 0x0003) + 0)
   6B63 32 33 91      [13] 5003 	ld	(#(_object + 0x0001)),a
                           5004 ;src/CalcColision.h:140: return bound;
   6B66 2E 01         [ 7] 5005 	ld	l,#0x01
   6B68 18 02         [12] 5006 	jr	00111$
   6B6A                    5007 00107$:
                           5008 ;src/CalcColision.h:143: return bound;
   6B6A 2E 00         [ 7] 5009 	ld	l,#0x00
   6B6C                    5010 00111$:
   6B6C DD F9         [10] 5011 	ld	sp, ix
   6B6E DD E1         [14] 5012 	pop	ix
   6B70 C9            [10] 5013 	ret
                           5014 ;src/keyboard.h:13: u8* checkKeyboard(){
                           5015 ;	---------------------------------
                           5016 ; Function checkKeyboard
                           5017 ; ---------------------------------
   6B71                    5018 _checkKeyboard::
   6B71 DD E5         [15] 5019 	push	ix
   6B73 DD 21 00 00   [14] 5020 	ld	ix,#0
   6B77 DD 39         [15] 5021 	add	ix,sp
   6B79 21 FA FF      [10] 5022 	ld	hl,#-6
   6B7C 39            [11] 5023 	add	hl,sp
   6B7D F9            [ 6] 5024 	ld	sp,hl
                           5025 ;src/keyboard.h:14: u8 *s = NULL;
   6B7E DD 36 FE 00   [19] 5026 	ld	-2 (ix),#0x00
   6B82 DD 36 FF 00   [19] 5027 	ld	-1 (ix),#0x00
                           5028 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   6B86 21 05 80      [10] 5029 	ld	hl,#0x8005
   6B89 CD 72 8B      [17] 5030 	call	_cpct_isKeyPressed
   6B8C 4D            [ 4] 5031 	ld	c,l
   6B8D 79            [ 4] 5032 	ld	a,c
   6B8E B7            [ 4] 5033 	or	a, a
   6B8F 28 68         [12] 5034 	jr	Z,00145$
   6B91 21 44 91      [10] 5035 	ld	hl, #(_player + 0x0008) + 0
   6B94 7E            [ 7] 5036 	ld	a,(hl)
   6B95 DD 77 FB      [19] 5037 	ld	-5 (ix), a
   6B98 D6 14         [ 7] 5038 	sub	a, #0x14
   6B9A 38 5D         [12] 5039 	jr	C,00145$
                           5040 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   6B9C DD 7E FB      [19] 5041 	ld	a,-5 (ix)
   6B9F D6 32         [ 7] 5042 	sub	a, #0x32
   6BA1 38 07         [12] 5043 	jr	C,00102$
   6BA3 21 44 91      [10] 5044 	ld	hl,#(_player + 0x0008)
   6BA6 36 00         [10] 5045 	ld	(hl),#0x00
   6BA8 18 08         [12] 5046 	jr	00103$
   6BAA                    5047 00102$:
                           5048 ;src/keyboard.h:17: else player.atk += 1;
   6BAA DD 7E FB      [19] 5049 	ld	a,-5 (ix)
   6BAD 3C            [ 4] 5050 	inc	a
   6BAE 21 44 91      [10] 5051 	ld	hl,#(_player + 0x0008)
   6BB1 77            [ 7] 5052 	ld	(hl),a
   6BB2                    5053 00103$:
                           5054 ;src/keyboard.h:18: switch(player.dir){
   6BB2 21 43 91      [10] 5055 	ld	hl, #_player + 7
   6BB5 66            [ 7] 5056 	ld	h,(hl)
   6BB6 7C            [ 4] 5057 	ld	a,h
   6BB7 D6 02         [ 7] 5058 	sub	a, #0x02
   6BB9 28 33         [12] 5059 	jr	Z,00107$
   6BBB 7C            [ 4] 5060 	ld	a,h
   6BBC D6 04         [ 7] 5061 	sub	a, #0x04
   6BBE 28 0D         [12] 5062 	jr	Z,00104$
   6BC0 7C            [ 4] 5063 	ld	a,h
   6BC1 D6 06         [ 7] 5064 	sub	a, #0x06
   6BC3 28 13         [12] 5065 	jr	Z,00105$
   6BC5 7C            [ 4] 5066 	ld	a,h
   6BC6 D6 08         [ 7] 5067 	sub	a, #0x08
   6BC8 28 19         [12] 5068 	jr	Z,00106$
   6BCA C3 D3 6D      [10] 5069 	jp	00146$
                           5070 ;src/keyboard.h:19: case 4:
   6BCD                    5071 00104$:
                           5072 ;src/keyboard.h:20: s = gladis_atk_izda;
   6BCD DD 36 FE 80   [19] 5073 	ld	-2 (ix),#<(_gladis_atk_izda)
   6BD1 DD 36 FF 41   [19] 5074 	ld	-1 (ix),#>(_gladis_atk_izda)
                           5075 ;src/keyboard.h:21: break;
   6BD5 C3 D3 6D      [10] 5076 	jp	00146$
                           5077 ;src/keyboard.h:22: case 6:
   6BD8                    5078 00105$:
                           5079 ;src/keyboard.h:23: s = gladis_atk_dcha;
   6BD8 DD 36 FE 00   [19] 5080 	ld	-2 (ix),#<(_gladis_atk_dcha)
   6BDC DD 36 FF 41   [19] 5081 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           5082 ;src/keyboard.h:24: break;
   6BE0 C3 D3 6D      [10] 5083 	jp	00146$
                           5084 ;src/keyboard.h:25: case 8:
   6BE3                    5085 00106$:
                           5086 ;src/keyboard.h:26: s = gladis_atk_arriba;
   6BE3 DD 36 FE 80   [19] 5087 	ld	-2 (ix),#<(_gladis_atk_arriba)
   6BE7 DD 36 FF 43   [19] 5088 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           5089 ;src/keyboard.h:27: break;
   6BEB C3 D3 6D      [10] 5090 	jp	00146$
                           5091 ;src/keyboard.h:28: case 2:
   6BEE                    5092 00107$:
                           5093 ;src/keyboard.h:29: s = gladis_atk_abajo;
   6BEE DD 36 FE 00   [19] 5094 	ld	-2 (ix),#<(_gladis_atk_abajo)
   6BF2 DD 36 FF 43   [19] 5095 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           5096 ;src/keyboard.h:31: }
   6BF6 C3 D3 6D      [10] 5097 	jp	00146$
   6BF9                    5098 00145$:
                           5099 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   6BF9 21 44 91      [10] 5100 	ld	hl, #(_player + 0x0008) + 0
   6BFC 56            [ 7] 5101 	ld	d,(hl)
   6BFD 7A            [ 4] 5102 	ld	a,d
   6BFE D6 14         [ 7] 5103 	sub	a, #0x14
   6C00 30 07         [12] 5104 	jr	NC,00110$
   6C02 14            [ 4] 5105 	inc	d
   6C03 21 44 91      [10] 5106 	ld	hl,#(_player + 0x0008)
   6C06 72            [ 7] 5107 	ld	(hl),d
   6C07 18 05         [12] 5108 	jr	00111$
   6C09                    5109 00110$:
                           5110 ;src/keyboard.h:34: else player.atk = 20;
   6C09 21 44 91      [10] 5111 	ld	hl,#(_player + 0x0008)
   6C0C 36 14         [10] 5112 	ld	(hl),#0x14
   6C0E                    5113 00111$:
                           5114 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   6C0E 21 00 02      [10] 5115 	ld	hl,#0x0200
   6C11 CD 72 8B      [17] 5116 	call	_cpct_isKeyPressed
                           5117 ;src/keyboard.h:37: player.dir = 6;
                           5118 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   6C14 7D            [ 4] 5119 	ld	a,l
   6C15 B7            [ 4] 5120 	or	a, a
   6C16 28 1E         [12] 5121 	jr	Z,00141$
   6C18 21 3C 91      [10] 5122 	ld	hl, #_player + 0
   6C1B 56            [ 7] 5123 	ld	d,(hl)
   6C1C 7A            [ 4] 5124 	ld	a,d
   6C1D D6 4C         [ 7] 5125 	sub	a, #0x4C
   6C1F 30 15         [12] 5126 	jr	NC,00141$
                           5127 ;src/keyboard.h:36: player.x += 1;
   6C21 14            [ 4] 5128 	inc	d
   6C22 21 3C 91      [10] 5129 	ld	hl,#_player
   6C25 72            [ 7] 5130 	ld	(hl),d
                           5131 ;src/keyboard.h:37: player.dir = 6;
   6C26 21 43 91      [10] 5132 	ld	hl,#(_player + 0x0007)
   6C29 36 06         [10] 5133 	ld	(hl),#0x06
                           5134 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   6C2B DD 36 FE 00   [19] 5135 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   6C2F DD 36 FF 40   [19] 5136 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   6C33 C3 D3 6D      [10] 5137 	jp	00146$
   6C36                    5138 00141$:
                           5139 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   6C36 21 01 01      [10] 5140 	ld	hl,#0x0101
   6C39 CD 72 8B      [17] 5141 	call	_cpct_isKeyPressed
   6C3C 7D            [ 4] 5142 	ld	a,l
   6C3D B7            [ 4] 5143 	or	a, a
   6C3E 28 1B         [12] 5144 	jr	Z,00137$
   6C40 3A 3C 91      [13] 5145 	ld	a, (#_player + 0)
   6C43 B7            [ 4] 5146 	or	a, a
   6C44 28 15         [12] 5147 	jr	Z,00137$
                           5148 ;src/keyboard.h:40: player.x -= 1;
   6C46 C6 FF         [ 7] 5149 	add	a,#0xFF
   6C48 32 3C 91      [13] 5150 	ld	(#_player),a
                           5151 ;src/keyboard.h:41: player.dir = 4;
   6C4B 21 43 91      [10] 5152 	ld	hl,#(_player + 0x0007)
   6C4E 36 04         [10] 5153 	ld	(hl),#0x04
                           5154 ;src/keyboard.h:42: s = gladis_quieto_izda;
   6C50 DD 36 FE 80   [19] 5155 	ld	-2 (ix),#<(_gladis_quieto_izda)
   6C54 DD 36 FF 40   [19] 5156 	ld	-1 (ix),#>(_gladis_quieto_izda)
   6C58 C3 D3 6D      [10] 5157 	jp	00146$
   6C5B                    5158 00137$:
                           5159 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   6C5B 21 00 04      [10] 5160 	ld	hl,#0x0400
   6C5E CD 72 8B      [17] 5161 	call	_cpct_isKeyPressed
   6C61 7D            [ 4] 5162 	ld	a,l
   6C62 B7            [ 4] 5163 	or	a, a
   6C63 28 1F         [12] 5164 	jr	Z,00133$
   6C65 21 3D 91      [10] 5165 	ld	hl, #(_player + 0x0001) + 0
   6C68 56            [ 7] 5166 	ld	d,(hl)
   6C69 7A            [ 4] 5167 	ld	a,d
   6C6A D6 B4         [ 7] 5168 	sub	a, #0xB4
   6C6C 30 16         [12] 5169 	jr	NC,00133$
                           5170 ;src/keyboard.h:44: player.y += 2;
   6C6E 14            [ 4] 5171 	inc	d
   6C6F 14            [ 4] 5172 	inc	d
   6C70 21 3D 91      [10] 5173 	ld	hl,#(_player + 0x0001)
   6C73 72            [ 7] 5174 	ld	(hl),d
                           5175 ;src/keyboard.h:45: player.dir = 2;
   6C74 21 43 91      [10] 5176 	ld	hl,#(_player + 0x0007)
   6C77 36 02         [10] 5177 	ld	(hl),#0x02
                           5178 ;src/keyboard.h:46: s = gladis_abajo;
   6C79 DD 36 FE 80   [19] 5179 	ld	-2 (ix),#<(_gladis_abajo)
   6C7D DD 36 FF 42   [19] 5180 	ld	-1 (ix),#>(_gladis_abajo)
   6C81 C3 D3 6D      [10] 5181 	jp	00146$
   6C84                    5182 00133$:
                           5183 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   6C84 21 00 01      [10] 5184 	ld	hl,#0x0100
   6C87 CD 72 8B      [17] 5185 	call	_cpct_isKeyPressed
   6C8A 7D            [ 4] 5186 	ld	a,l
   6C8B B7            [ 4] 5187 	or	a, a
   6C8C 28 1B         [12] 5188 	jr	Z,00129$
   6C8E 3A 3D 91      [13] 5189 	ld	a, (#(_player + 0x0001) + 0)
   6C91 B7            [ 4] 5190 	or	a, a
   6C92 28 15         [12] 5191 	jr	Z,00129$
                           5192 ;src/keyboard.h:48: player.y -= 2;
   6C94 C6 FE         [ 7] 5193 	add	a,#0xFE
   6C96 32 3D 91      [13] 5194 	ld	(#(_player + 0x0001)),a
                           5195 ;src/keyboard.h:49: player.dir = 8;
   6C99 21 43 91      [10] 5196 	ld	hl,#(_player + 0x0007)
   6C9C 36 08         [10] 5197 	ld	(hl),#0x08
                           5198 ;src/keyboard.h:50: s = gladis_arriba;
   6C9E DD 36 FE 00   [19] 5199 	ld	-2 (ix),#<(_gladis_arriba)
   6CA2 DD 36 FF 42   [19] 5200 	ld	-1 (ix),#>(_gladis_arriba)
   6CA6 C3 D3 6D      [10] 5201 	jp	00146$
   6CA9                    5202 00129$:
                           5203 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   6CA9 21 07 80      [10] 5204 	ld	hl,#0x8007
   6CAC CD 72 8B      [17] 5205 	call	_cpct_isKeyPressed
   6CAF 5D            [ 4] 5206 	ld	e,l
                           5207 ;src/keyboard.h:53: switch(player.dir){
   6CB0 21 43 91      [10] 5208 	ld	hl, #(_player + 0x0007) + 0
   6CB3 6E            [ 7] 5209 	ld	l,(hl)
   6CB4 7D            [ 4] 5210 	ld	a,l
   6CB5 D6 02         [ 7] 5211 	sub	a, #0x02
   6CB7 20 04         [12] 5212 	jr	NZ,00272$
   6CB9 3E 01         [ 7] 5213 	ld	a,#0x01
   6CBB 18 01         [12] 5214 	jr	00273$
   6CBD                    5215 00272$:
   6CBD AF            [ 4] 5216 	xor	a,a
   6CBE                    5217 00273$:
   6CBE 4F            [ 4] 5218 	ld	c,a
   6CBF 7D            [ 4] 5219 	ld	a,l
   6CC0 D6 04         [ 7] 5220 	sub	a, #0x04
   6CC2 20 04         [12] 5221 	jr	NZ,00274$
   6CC4 3E 01         [ 7] 5222 	ld	a,#0x01
   6CC6 18 01         [12] 5223 	jr	00275$
   6CC8                    5224 00274$:
   6CC8 AF            [ 4] 5225 	xor	a,a
   6CC9                    5226 00275$:
   6CC9 DD 77 FB      [19] 5227 	ld	-5 (ix),a
   6CCC 7D            [ 4] 5228 	ld	a,l
   6CCD D6 06         [ 7] 5229 	sub	a, #0x06
   6CCF 20 04         [12] 5230 	jr	NZ,00276$
   6CD1 3E 01         [ 7] 5231 	ld	a,#0x01
   6CD3 18 01         [12] 5232 	jr	00277$
   6CD5                    5233 00276$:
   6CD5 AF            [ 4] 5234 	xor	a,a
   6CD6                    5235 00277$:
   6CD6 DD 77 FC      [19] 5236 	ld	-4 (ix),a
   6CD9 7D            [ 4] 5237 	ld	a,l
   6CDA D6 08         [ 7] 5238 	sub	a, #0x08
   6CDC 20 04         [12] 5239 	jr	NZ,00278$
   6CDE 3E 01         [ 7] 5240 	ld	a,#0x01
   6CE0 18 01         [12] 5241 	jr	00279$
   6CE2                    5242 00278$:
   6CE2 AF            [ 4] 5243 	xor	a,a
   6CE3                    5244 00279$:
   6CE3 DD 77 FD      [19] 5245 	ld	-3 (ix),a
                           5246 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   6CE6 7B            [ 4] 5247 	ld	a,e
   6CE7 B7            [ 4] 5248 	or	a, a
   6CE8 CA 95 6D      [10] 5249 	jp	Z,00123$
   6CEB 3A 2A 91      [13] 5250 	ld	a,(#_arrow + 0)
   6CEE B7            [ 4] 5251 	or	a, a
   6CEF C2 95 6D      [10] 5252 	jp	NZ,00123$
   6CF2 3A 44 91      [13] 5253 	ld	a, (#(_player + 0x0008) + 0)
   6CF5 D6 14         [ 7] 5254 	sub	a, #0x14
   6CF7 C2 95 6D      [10] 5255 	jp	NZ,00123$
   6CFA 3A 46 91      [13] 5256 	ld	a, (#(_player + 0x000a) + 0)
   6CFD B7            [ 4] 5257 	or	a, a
   6CFE CA 95 6D      [10] 5258 	jp	Z,00123$
                           5259 ;src/keyboard.h:52: u8 *spr = flecha_dcha,xs=2,ys=8;
   6D01 11 5E 76      [10] 5260 	ld	de,#_flecha_dcha
   6D04 DD 36 FA 02   [19] 5261 	ld	-6 (ix),#0x02
   6D08 06 08         [ 7] 5262 	ld	b,#0x08
                           5263 ;src/keyboard.h:53: switch(player.dir){
   6D0A 79            [ 4] 5264 	ld	a,c
   6D0B B7            [ 4] 5265 	or	a, a
   6D0C 20 2A         [12] 5266 	jr	NZ,00114$
   6D0E DD 7E FB      [19] 5267 	ld	a,-5 (ix)
   6D11 B7            [ 4] 5268 	or	a, a
   6D12 20 19         [12] 5269 	jr	NZ,00113$
   6D14 DD 7E FC      [19] 5270 	ld	a,-4 (ix)
   6D17 B7            [ 4] 5271 	or	a, a
   6D18 20 08         [12] 5272 	jr	NZ,00112$
   6D1A DD 7E FD      [19] 5273 	ld	a,-3 (ix)
   6D1D B7            [ 4] 5274 	or	a, a
   6D1E 20 23         [12] 5275 	jr	NZ,00115$
   6D20 18 2A         [12] 5276 	jr	00116$
                           5277 ;src/keyboard.h:54: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   6D22                    5278 00112$:
   6D22 11 5E 76      [10] 5279 	ld	de,#_flecha_dcha
   6D25 DD 36 FA 04   [19] 5280 	ld	-6 (ix),#0x04
   6D29 06 04         [ 7] 5281 	ld	b,#0x04
   6D2B 18 1F         [12] 5282 	jr	00116$
                           5283 ;src/keyboard.h:55: case 4: spr = flecha_izda; xs=4;ys=4; break;
   6D2D                    5284 00113$:
   6D2D 11 7E 76      [10] 5285 	ld	de,#_flecha_izda+0
   6D30 DD 36 FA 04   [19] 5286 	ld	-6 (ix),#0x04
   6D34 06 04         [ 7] 5287 	ld	b,#0x04
   6D36 18 14         [12] 5288 	jr	00116$
                           5289 ;src/keyboard.h:56: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   6D38                    5290 00114$:
   6D38 11 3E 76      [10] 5291 	ld	de,#_flecha_abajo+0
   6D3B DD 36 FA 02   [19] 5292 	ld	-6 (ix),#0x02
   6D3F 06 08         [ 7] 5293 	ld	b,#0x08
   6D41 18 09         [12] 5294 	jr	00116$
                           5295 ;src/keyboard.h:57: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   6D43                    5296 00115$:
   6D43 11 1E 76      [10] 5297 	ld	de,#_flecha_arriba+0
   6D46 DD 36 FA 02   [19] 5298 	ld	-6 (ix),#0x02
   6D4A 06 08         [ 7] 5299 	ld	b,#0x08
                           5300 ;src/keyboard.h:58: }
   6D4C                    5301 00116$:
                           5302 ;src/keyboard.h:59: player.atk = 0;
   6D4C 21 44 91      [10] 5303 	ld	hl,#(_player + 0x0008)
   6D4F 36 00         [10] 5304 	ld	(hl),#0x00
                           5305 ;src/keyboard.h:60: object.x = player.x;
   6D51 3A 3C 91      [13] 5306 	ld	a, (#_player + 0)
   6D54 21 32 91      [10] 5307 	ld	hl,#_object
   6D57 77            [ 7] 5308 	ld	(hl),a
                           5309 ;src/keyboard.h:61: object.y = player.y+8;
   6D58 3A 3D 91      [13] 5310 	ld	a, (#(_player + 0x0001) + 0)
   6D5B C6 08         [ 7] 5311 	add	a, #0x08
   6D5D 32 33 91      [13] 5312 	ld	(#(_object + 0x0001)),a
                           5313 ;src/keyboard.h:62: object.x = object.x;
   6D60 21 32 91      [10] 5314 	ld	hl, #_object + 0
   6D63 4E            [ 7] 5315 	ld	c,(hl)
   6D64 21 32 91      [10] 5316 	ld	hl,#_object
   6D67 71            [ 7] 5317 	ld	(hl),c
                           5318 ;src/keyboard.h:63: object.y = object.y;
   6D68 32 33 91      [13] 5319 	ld	(#(_object + 0x0001)),a
                           5320 ;src/keyboard.h:64: object.sprite = spr;
   6D6B ED 53 36 91   [20] 5321 	ld	((_object + 0x0004)), de
                           5322 ;src/keyboard.h:65: object.vivo = 1;
   6D6F 21 38 91      [10] 5323 	ld	hl,#_object + 6
   6D72 36 01         [10] 5324 	ld	(hl),#0x01
                           5325 ;src/keyboard.h:66: object.dir = player.dir;
   6D74 11 39 91      [10] 5326 	ld	de,#_object + 7
   6D77 3A 43 91      [13] 5327 	ld	a, (#(_player + 0x0007) + 0)
   6D7A 12            [ 7] 5328 	ld	(de),a
                           5329 ;src/keyboard.h:67: object.sizeX = xs;
   6D7B 21 3A 91      [10] 5330 	ld	hl,#_object + 8
   6D7E DD 7E FA      [19] 5331 	ld	a,-6 (ix)
   6D81 77            [ 7] 5332 	ld	(hl),a
                           5333 ;src/keyboard.h:68: object.sizeY = ys;
   6D82 21 3B 91      [10] 5334 	ld	hl,#_object + 9
   6D85 70            [ 7] 5335 	ld	(hl),b
                           5336 ;src/keyboard.h:69: player.bullets--;
   6D86 3A 46 91      [13] 5337 	ld	a, (#(_player + 0x000a) + 0)
   6D89 C6 FF         [ 7] 5338 	add	a,#0xFF
   6D8B 32 46 91      [13] 5339 	ld	(#(_player + 0x000a)),a
                           5340 ;src/keyboard.h:70: arrow=1;
   6D8E 21 2A 91      [10] 5341 	ld	hl,#_arrow + 0
   6D91 36 01         [10] 5342 	ld	(hl), #0x01
   6D93 18 3E         [12] 5343 	jr	00146$
   6D95                    5344 00123$:
                           5345 ;src/keyboard.h:72: switch(player.dir){
   6D95 79            [ 4] 5346 	ld	a,c
   6D96 B7            [ 4] 5347 	or	a, a
   6D97 20 32         [12] 5348 	jr	NZ,00120$
   6D99 DD 7E FB      [19] 5349 	ld	a,-5 (ix)
   6D9C B7            [ 4] 5350 	or	a, a
   6D9D 20 0E         [12] 5351 	jr	NZ,00117$
   6D9F DD 7E FC      [19] 5352 	ld	a,-4 (ix)
   6DA2 B7            [ 4] 5353 	or	a, a
   6DA3 20 12         [12] 5354 	jr	NZ,00118$
   6DA5 DD 7E FD      [19] 5355 	ld	a,-3 (ix)
   6DA8 B7            [ 4] 5356 	or	a, a
   6DA9 20 16         [12] 5357 	jr	NZ,00119$
   6DAB 18 26         [12] 5358 	jr	00146$
                           5359 ;src/keyboard.h:73: case 4:
   6DAD                    5360 00117$:
                           5361 ;src/keyboard.h:74: s = gladis_quieto_izda;
   6DAD DD 36 FE 80   [19] 5362 	ld	-2 (ix),#<(_gladis_quieto_izda)
   6DB1 DD 36 FF 40   [19] 5363 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           5364 ;src/keyboard.h:75: break;
   6DB5 18 1C         [12] 5365 	jr	00146$
                           5366 ;src/keyboard.h:76: case 6:
   6DB7                    5367 00118$:
                           5368 ;src/keyboard.h:77: s = gladis_quieto_dcha;
   6DB7 DD 36 FE 00   [19] 5369 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   6DBB DD 36 FF 40   [19] 5370 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           5371 ;src/keyboard.h:78: break;
   6DBF 18 12         [12] 5372 	jr	00146$
                           5373 ;src/keyboard.h:79: case 8:
   6DC1                    5374 00119$:
                           5375 ;src/keyboard.h:80: s = gladis_arriba;
   6DC1 DD 36 FE 00   [19] 5376 	ld	-2 (ix),#<(_gladis_arriba)
   6DC5 DD 36 FF 42   [19] 5377 	ld	-1 (ix),#>(_gladis_arriba)
                           5378 ;src/keyboard.h:81: break;
   6DC9 18 08         [12] 5379 	jr	00146$
                           5380 ;src/keyboard.h:82: case 2:
   6DCB                    5381 00120$:
                           5382 ;src/keyboard.h:83: s = gladis_abajo;
   6DCB DD 36 FE 80   [19] 5383 	ld	-2 (ix),#<(_gladis_abajo)
   6DCF DD 36 FF 42   [19] 5384 	ld	-1 (ix),#>(_gladis_abajo)
                           5385 ;src/keyboard.h:85: }
   6DD3                    5386 00146$:
                           5387 ;src/keyboard.h:90: if(cpct_isKeyPressed(Key_Esc)){
   6DD3 21 08 04      [10] 5388 	ld	hl,#0x0408
   6DD6 CD 72 8B      [17] 5389 	call	_cpct_isKeyPressed
   6DD9 7D            [ 4] 5390 	ld	a,l
   6DDA B7            [ 4] 5391 	or	a, a
   6DDB 28 05         [12] 5392 	jr	Z,00149$
                           5393 ;src/keyboard.h:91: finish = 1;
   6DDD 21 29 91      [10] 5394 	ld	hl,#_finish + 0
   6DE0 36 01         [10] 5395 	ld	(hl), #0x01
   6DE2                    5396 00149$:
                           5397 ;src/keyboard.h:93: return s;
   6DE2 DD 6E FE      [19] 5398 	ld	l,-2 (ix)
   6DE5 DD 66 FF      [19] 5399 	ld	h,-1 (ix)
   6DE8 DD F9         [10] 5400 	ld	sp, ix
   6DEA DD E1         [14] 5401 	pop	ix
   6DEC C9            [10] 5402 	ret
                           5403 ;src/keyboard.h:96: void moveObject(){
                           5404 ;	---------------------------------
                           5405 ; Function moveObject
                           5406 ; ---------------------------------
   6DED                    5407 _moveObject::
                           5408 ;src/keyboard.h:97: object.lx = object.x;
   6DED 01 32 91      [10] 5409 	ld	bc,#_object+0
   6DF0 0A            [ 7] 5410 	ld	a,(bc)
   6DF1 32 34 91      [13] 5411 	ld	(#(_object + 0x0002)),a
                           5412 ;src/keyboard.h:98: object.ly = object.y;
   6DF4 59            [ 4] 5413 	ld	e, c
   6DF5 50            [ 4] 5414 	ld	d, b
   6DF6 13            [ 6] 5415 	inc	de
   6DF7 1A            [ 7] 5416 	ld	a,(de)
   6DF8 32 35 91      [13] 5417 	ld	(#(_object + 0x0003)),a
                           5418 ;src/keyboard.h:99: switch(object.dir){
   6DFB 3A 39 91      [13] 5419 	ld	a,(#_object + 7)
   6DFE FE 02         [ 7] 5420 	cp	a,#0x02
   6E00 28 16         [12] 5421 	jr	Z,00103$
   6E02 FE 04         [ 7] 5422 	cp	a,#0x04
   6E04 28 0D         [12] 5423 	jr	Z,00102$
   6E06 FE 06         [ 7] 5424 	cp	a,#0x06
   6E08 28 05         [12] 5425 	jr	Z,00101$
   6E0A D6 08         [ 7] 5426 	sub	a, #0x08
   6E0C 28 0F         [12] 5427 	jr	Z,00104$
   6E0E C9            [10] 5428 	ret
                           5429 ;src/keyboard.h:100: case 6: object.x += 1; break;
   6E0F                    5430 00101$:
   6E0F 0A            [ 7] 5431 	ld	a,(bc)
   6E10 3C            [ 4] 5432 	inc	a
   6E11 02            [ 7] 5433 	ld	(bc),a
   6E12 C9            [10] 5434 	ret
                           5435 ;src/keyboard.h:101: case 4: object.x -= 1; break;
   6E13                    5436 00102$:
   6E13 0A            [ 7] 5437 	ld	a,(bc)
   6E14 C6 FF         [ 7] 5438 	add	a,#0xFF
   6E16 02            [ 7] 5439 	ld	(bc),a
   6E17 C9            [10] 5440 	ret
                           5441 ;src/keyboard.h:102: case 2: object.y += 2; break;
   6E18                    5442 00103$:
   6E18 1A            [ 7] 5443 	ld	a,(de)
   6E19 C6 02         [ 7] 5444 	add	a, #0x02
   6E1B 12            [ 7] 5445 	ld	(de),a
   6E1C C9            [10] 5446 	ret
                           5447 ;src/keyboard.h:103: case 8: object.y -= 2; break;
   6E1D                    5448 00104$:
   6E1D 1A            [ 7] 5449 	ld	a,(de)
   6E1E C6 FE         [ 7] 5450 	add	a,#0xFE
   6E20 12            [ 7] 5451 	ld	(de),a
                           5452 ;src/keyboard.h:104: }
   6E21 C9            [10] 5453 	ret
                           5454 ;src/main.c:44: void gameOver(){
                           5455 ;	---------------------------------
                           5456 ; Function gameOver
                           5457 ; ---------------------------------
   6E22                    5458 _gameOver::
                           5459 ;src/main.c:46: cpct_clearScreen(0);
   6E22 21 00 40      [10] 5460 	ld	hl,#0x4000
   6E25 E5            [11] 5461 	push	hl
   6E26 AF            [ 4] 5462 	xor	a, a
   6E27 F5            [11] 5463 	push	af
   6E28 33            [ 6] 5464 	inc	sp
   6E29 26 C0         [ 7] 5465 	ld	h, #0xC0
   6E2B E5            [11] 5466 	push	hl
   6E2C CD 4D 8E      [17] 5467 	call	_cpct_memset
                           5468 ;src/main.c:47: memptr = cpct_getScreenPtr(VMEM,10,10);
   6E2F 21 0A 0A      [10] 5469 	ld	hl,#0x0A0A
   6E32 E5            [11] 5470 	push	hl
   6E33 21 00 C0      [10] 5471 	ld	hl,#0xC000
   6E36 E5            [11] 5472 	push	hl
   6E37 CD 40 8F      [17] 5473 	call	_cpct_getScreenPtr
                           5474 ;src/main.c:48: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6E3A EB            [ 4] 5475 	ex	de,hl
   6E3B 01 8F 6E      [10] 5476 	ld	bc,#___str_2+0
   6E3E 21 01 00      [10] 5477 	ld	hl,#0x0001
   6E41 E5            [11] 5478 	push	hl
   6E42 D5            [11] 5479 	push	de
   6E43 C5            [11] 5480 	push	bc
   6E44 CD 5F 8C      [17] 5481 	call	_cpct_drawStringM0
   6E47 21 06 00      [10] 5482 	ld	hl,#6
   6E4A 39            [11] 5483 	add	hl,sp
   6E4B F9            [ 6] 5484 	ld	sp,hl
                           5485 ;src/main.c:50: memptr = cpct_getScreenPtr(VMEM,10,30);
   6E4C 21 0A 1E      [10] 5486 	ld	hl,#0x1E0A
   6E4F E5            [11] 5487 	push	hl
   6E50 21 00 C0      [10] 5488 	ld	hl,#0xC000
   6E53 E5            [11] 5489 	push	hl
   6E54 CD 40 8F      [17] 5490 	call	_cpct_getScreenPtr
                           5491 ;src/main.c:51: cpct_drawSprite(gameover,memptr,60,28);
   6E57 EB            [ 4] 5492 	ex	de,hl
   6E58 01 AE 76      [10] 5493 	ld	bc,#_gameover+0
   6E5B 21 3C 1C      [10] 5494 	ld	hl,#0x1C3C
   6E5E E5            [11] 5495 	push	hl
   6E5F D5            [11] 5496 	push	de
   6E60 C5            [11] 5497 	push	bc
   6E61 CD 83 8C      [17] 5498 	call	_cpct_drawSprite
                           5499 ;src/main.c:54: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   6E64 21 0C AF      [10] 5500 	ld	hl,#0xAF0C
   6E67 E5            [11] 5501 	push	hl
   6E68 21 00 C0      [10] 5502 	ld	hl,#0xC000
   6E6B E5            [11] 5503 	push	hl
   6E6C CD 40 8F      [17] 5504 	call	_cpct_getScreenPtr
                           5505 ;src/main.c:55: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   6E6F EB            [ 4] 5506 	ex	de,hl
   6E70 01 A0 6E      [10] 5507 	ld	bc,#___str_3+0
   6E73 21 01 00      [10] 5508 	ld	hl,#0x0001
   6E76 E5            [11] 5509 	push	hl
   6E77 D5            [11] 5510 	push	de
   6E78 C5            [11] 5511 	push	bc
   6E79 CD 5F 8C      [17] 5512 	call	_cpct_drawStringM0
   6E7C 21 06 00      [10] 5513 	ld	hl,#6
   6E7F 39            [11] 5514 	add	hl,sp
   6E80 F9            [ 6] 5515 	ld	sp,hl
                           5516 ;src/main.c:59: while (1){
   6E81                    5517 00104$:
                           5518 ;src/main.c:60: cpct_scanKeyboard_f();
   6E81 CD 7E 8B      [17] 5519 	call	_cpct_scanKeyboard_f
                           5520 ;src/main.c:61: if(cpct_isKeyPressed(Key_Space)) {
   6E84 21 05 80      [10] 5521 	ld	hl,#0x8005
   6E87 CD 72 8B      [17] 5522 	call	_cpct_isKeyPressed
   6E8A 7D            [ 4] 5523 	ld	a,l
   6E8B B7            [ 4] 5524 	or	a, a
   6E8C 28 F3         [12] 5525 	jr	Z,00104$
                           5526 ;src/main.c:63: return;
   6E8E C9            [10] 5527 	ret
   6E8F                    5528 ___str_2:
   6E8F 4C 6F 75 6E 67 65  5529 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   6E9F 00                 5530 	.db 0x00
   6EA0                    5531 ___str_3:
   6EA0 50 75 6C 73 61 20  5532 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   6EAD 00                 5533 	.db 0x00
                           5534 ;src/main.c:70: int menu(){
                           5535 ;	---------------------------------
                           5536 ; Function menu
                           5537 ; ---------------------------------
   6EAE                    5538 _menu::
   6EAE DD E5         [15] 5539 	push	ix
   6EB0 DD 21 00 00   [14] 5540 	ld	ix,#0
   6EB4 DD 39         [15] 5541 	add	ix,sp
   6EB6 21 FA FF      [10] 5542 	ld	hl,#-6
   6EB9 39            [11] 5543 	add	hl,sp
   6EBA F9            [ 6] 5544 	ld	sp,hl
                           5545 ;src/main.c:72: int init = 50;
   6EBB DD 36 FC 32   [19] 5546 	ld	-4 (ix),#0x32
   6EBF DD 36 FD 00   [19] 5547 	ld	-3 (ix),#0x00
                           5548 ;src/main.c:73: int pushed =0;
   6EC3 11 00 00      [10] 5549 	ld	de,#0x0000
                           5550 ;src/main.c:74: int cont =0;
   6EC6 21 00 00      [10] 5551 	ld	hl,#0x0000
   6EC9 E3            [19] 5552 	ex	(sp), hl
                           5553 ;src/main.c:75: cpct_clearScreen(0);
   6ECA D5            [11] 5554 	push	de
   6ECB 21 00 40      [10] 5555 	ld	hl,#0x4000
   6ECE E5            [11] 5556 	push	hl
   6ECF AF            [ 4] 5557 	xor	a, a
   6ED0 F5            [11] 5558 	push	af
   6ED1 33            [ 6] 5559 	inc	sp
   6ED2 26 C0         [ 7] 5560 	ld	h, #0xC0
   6ED4 E5            [11] 5561 	push	hl
   6ED5 CD 4D 8E      [17] 5562 	call	_cpct_memset
   6ED8 21 0A 0A      [10] 5563 	ld	hl,#0x0A0A
   6EDB E5            [11] 5564 	push	hl
   6EDC 21 00 C0      [10] 5565 	ld	hl,#0xC000
   6EDF E5            [11] 5566 	push	hl
   6EE0 CD 40 8F      [17] 5567 	call	_cpct_getScreenPtr
   6EE3 D1            [10] 5568 	pop	de
                           5569 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6EE4 4D            [ 4] 5570 	ld	c, l
   6EE5 44            [ 4] 5571 	ld	b, h
   6EE6 D5            [11] 5572 	push	de
   6EE7 21 3C 3C      [10] 5573 	ld	hl,#0x3C3C
   6EEA E5            [11] 5574 	push	hl
   6EEB C5            [11] 5575 	push	bc
   6EEC 21 3E 7D      [10] 5576 	ld	hl,#_portada1
   6EEF E5            [11] 5577 	push	hl
   6EF0 CD 83 8C      [17] 5578 	call	_cpct_drawSprite
   6EF3 21 14 5A      [10] 5579 	ld	hl,#0x5A14
   6EF6 E5            [11] 5580 	push	hl
   6EF7 21 00 C0      [10] 5581 	ld	hl,#0xC000
   6EFA E5            [11] 5582 	push	hl
   6EFB CD 40 8F      [17] 5583 	call	_cpct_getScreenPtr
   6EFE D1            [10] 5584 	pop	de
                           5585 ;src/main.c:82: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   6EFF 4D            [ 4] 5586 	ld	c, l
   6F00 44            [ 4] 5587 	ld	b, h
   6F01 D5            [11] 5588 	push	de
   6F02 21 01 00      [10] 5589 	ld	hl,#0x0001
   6F05 E5            [11] 5590 	push	hl
   6F06 C5            [11] 5591 	push	bc
   6F07 21 D0 70      [10] 5592 	ld	hl,#___str_4
   6F0A E5            [11] 5593 	push	hl
   6F0B CD 5F 8C      [17] 5594 	call	_cpct_drawStringM0
   6F0E 21 06 00      [10] 5595 	ld	hl,#6
   6F11 39            [11] 5596 	add	hl,sp
   6F12 F9            [ 6] 5597 	ld	sp,hl
   6F13 21 14 6E      [10] 5598 	ld	hl,#0x6E14
   6F16 E5            [11] 5599 	push	hl
   6F17 21 00 C0      [10] 5600 	ld	hl,#0xC000
   6F1A E5            [11] 5601 	push	hl
   6F1B CD 40 8F      [17] 5602 	call	_cpct_getScreenPtr
   6F1E D1            [10] 5603 	pop	de
                           5604 ;src/main.c:85: cpct_drawStringM0("Creditos",memptr,1,0);
   6F1F 4D            [ 4] 5605 	ld	c, l
   6F20 44            [ 4] 5606 	ld	b, h
   6F21 D5            [11] 5607 	push	de
   6F22 21 01 00      [10] 5608 	ld	hl,#0x0001
   6F25 E5            [11] 5609 	push	hl
   6F26 C5            [11] 5610 	push	bc
   6F27 21 DE 70      [10] 5611 	ld	hl,#___str_5
   6F2A E5            [11] 5612 	push	hl
   6F2B CD 5F 8C      [17] 5613 	call	_cpct_drawStringM0
   6F2E 21 06 00      [10] 5614 	ld	hl,#6
   6F31 39            [11] 5615 	add	hl,sp
   6F32 F9            [ 6] 5616 	ld	sp,hl
   6F33 21 14 82      [10] 5617 	ld	hl,#0x8214
   6F36 E5            [11] 5618 	push	hl
   6F37 21 00 C0      [10] 5619 	ld	hl,#0xC000
   6F3A E5            [11] 5620 	push	hl
   6F3B CD 40 8F      [17] 5621 	call	_cpct_getScreenPtr
   6F3E D1            [10] 5622 	pop	de
                           5623 ;src/main.c:88: cpct_drawStringM0("Constroles",memptr,1,0);
   6F3F 4D            [ 4] 5624 	ld	c, l
   6F40 44            [ 4] 5625 	ld	b, h
   6F41 D5            [11] 5626 	push	de
   6F42 21 01 00      [10] 5627 	ld	hl,#0x0001
   6F45 E5            [11] 5628 	push	hl
   6F46 C5            [11] 5629 	push	bc
   6F47 21 E7 70      [10] 5630 	ld	hl,#___str_6
   6F4A E5            [11] 5631 	push	hl
   6F4B CD 5F 8C      [17] 5632 	call	_cpct_drawStringM0
   6F4E 21 06 00      [10] 5633 	ld	hl,#6
   6F51 39            [11] 5634 	add	hl,sp
   6F52 F9            [ 6] 5635 	ld	sp,hl
   6F53 21 14 96      [10] 5636 	ld	hl,#0x9614
   6F56 E5            [11] 5637 	push	hl
   6F57 21 00 C0      [10] 5638 	ld	hl,#0xC000
   6F5A E5            [11] 5639 	push	hl
   6F5B CD 40 8F      [17] 5640 	call	_cpct_getScreenPtr
   6F5E D1            [10] 5641 	pop	de
                           5642 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6F5F DD 75 FE      [19] 5643 	ld	-2 (ix),l
   6F62 DD 74 FF      [19] 5644 	ld	-1 (ix),h
                           5645 ;src/main.c:91: cpct_drawStringM0("Salir",memptr,1,0);
   6F65 01 F2 70      [10] 5646 	ld	bc,#___str_7
   6F68 D5            [11] 5647 	push	de
   6F69 21 01 00      [10] 5648 	ld	hl,#0x0001
   6F6C E5            [11] 5649 	push	hl
   6F6D DD 6E FE      [19] 5650 	ld	l,-2 (ix)
   6F70 DD 66 FF      [19] 5651 	ld	h,-1 (ix)
   6F73 E5            [11] 5652 	push	hl
   6F74 C5            [11] 5653 	push	bc
   6F75 CD 5F 8C      [17] 5654 	call	_cpct_drawStringM0
   6F78 21 06 00      [10] 5655 	ld	hl,#6
   6F7B 39            [11] 5656 	add	hl,sp
   6F7C F9            [ 6] 5657 	ld	sp,hl
   6F7D D1            [10] 5658 	pop	de
                           5659 ;src/main.c:97: while(1){
   6F7E                    5660 00124$:
                           5661 ;src/main.c:99: cpct_scanKeyboard();
   6F7E D5            [11] 5662 	push	de
   6F7F CD 60 8F      [17] 5663 	call	_cpct_scanKeyboard
   6F82 21 00 04      [10] 5664 	ld	hl,#0x0400
   6F85 CD 72 8B      [17] 5665 	call	_cpct_isKeyPressed
   6F88 7D            [ 4] 5666 	ld	a,l
   6F89 D1            [10] 5667 	pop	de
   6F8A B7            [ 4] 5668 	or	a, a
   6F8B 28 38         [12] 5669 	jr	Z,00104$
   6F8D 3E 96         [ 7] 5670 	ld	a,#0x96
   6F8F DD BE FA      [19] 5671 	cp	a, -6 (ix)
   6F92 3E 00         [ 7] 5672 	ld	a,#0x00
   6F94 DD 9E FB      [19] 5673 	sbc	a, -5 (ix)
   6F97 E2 9C 6F      [10] 5674 	jp	PO, 00176$
   6F9A EE 80         [ 7] 5675 	xor	a, #0x80
   6F9C                    5676 00176$:
   6F9C F2 C5 6F      [10] 5677 	jp	P,00104$
                           5678 ;src/main.c:101: cpct_drawSolidBox(memptr, 0, 2, 8);
   6F9F D5            [11] 5679 	push	de
   6FA0 21 02 08      [10] 5680 	ld	hl,#0x0802
   6FA3 E5            [11] 5681 	push	hl
   6FA4 AF            [ 4] 5682 	xor	a, a
   6FA5 F5            [11] 5683 	push	af
   6FA6 33            [ 6] 5684 	inc	sp
   6FA7 DD 6E FE      [19] 5685 	ld	l,-2 (ix)
   6FAA DD 66 FF      [19] 5686 	ld	h,-1 (ix)
   6FAD E5            [11] 5687 	push	hl
   6FAE CD 6F 8E      [17] 5688 	call	_cpct_drawSolidBox
   6FB1 F1            [10] 5689 	pop	af
   6FB2 F1            [10] 5690 	pop	af
   6FB3 33            [ 6] 5691 	inc	sp
   6FB4 D1            [10] 5692 	pop	de
                           5693 ;src/main.c:102: if(pushed<3) pushed ++;
   6FB5 7B            [ 4] 5694 	ld	a,e
   6FB6 D6 03         [ 7] 5695 	sub	a, #0x03
   6FB8 7A            [ 4] 5696 	ld	a,d
   6FB9 17            [ 4] 5697 	rla
   6FBA 3F            [ 4] 5698 	ccf
   6FBB 1F            [ 4] 5699 	rra
   6FBC DE 80         [ 7] 5700 	sbc	a, #0x80
   6FBE 30 01         [12] 5701 	jr	NC,00102$
   6FC0 13            [ 6] 5702 	inc	de
   6FC1                    5703 00102$:
                           5704 ;src/main.c:103: cont =0;
   6FC1 21 00 00      [10] 5705 	ld	hl,#0x0000
   6FC4 E3            [19] 5706 	ex	(sp), hl
   6FC5                    5707 00104$:
                           5708 ;src/main.c:105: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   6FC5 D5            [11] 5709 	push	de
   6FC6 21 00 01      [10] 5710 	ld	hl,#0x0100
   6FC9 CD 72 8B      [17] 5711 	call	_cpct_isKeyPressed
   6FCC 7D            [ 4] 5712 	ld	a,l
   6FCD D1            [10] 5713 	pop	de
   6FCE B7            [ 4] 5714 	or	a, a
   6FCF 28 38         [12] 5715 	jr	Z,00109$
   6FD1 3E 96         [ 7] 5716 	ld	a,#0x96
   6FD3 DD BE FA      [19] 5717 	cp	a, -6 (ix)
   6FD6 3E 00         [ 7] 5718 	ld	a,#0x00
   6FD8 DD 9E FB      [19] 5719 	sbc	a, -5 (ix)
   6FDB E2 E0 6F      [10] 5720 	jp	PO, 00177$
   6FDE EE 80         [ 7] 5721 	xor	a, #0x80
   6FE0                    5722 00177$:
   6FE0 F2 09 70      [10] 5723 	jp	P,00109$
                           5724 ;src/main.c:106: cpct_drawSolidBox(memptr, 0, 2, 8);
   6FE3 D5            [11] 5725 	push	de
   6FE4 21 02 08      [10] 5726 	ld	hl,#0x0802
   6FE7 E5            [11] 5727 	push	hl
   6FE8 AF            [ 4] 5728 	xor	a, a
   6FE9 F5            [11] 5729 	push	af
   6FEA 33            [ 6] 5730 	inc	sp
   6FEB DD 6E FE      [19] 5731 	ld	l,-2 (ix)
   6FEE DD 66 FF      [19] 5732 	ld	h,-1 (ix)
   6FF1 E5            [11] 5733 	push	hl
   6FF2 CD 6F 8E      [17] 5734 	call	_cpct_drawSolidBox
   6FF5 F1            [10] 5735 	pop	af
   6FF6 F1            [10] 5736 	pop	af
   6FF7 33            [ 6] 5737 	inc	sp
   6FF8 D1            [10] 5738 	pop	de
                           5739 ;src/main.c:107: if(pushed>0) pushed --;
   6FF9 AF            [ 4] 5740 	xor	a, a
   6FFA BB            [ 4] 5741 	cp	a, e
   6FFB 9A            [ 4] 5742 	sbc	a, d
   6FFC E2 01 70      [10] 5743 	jp	PO, 00178$
   6FFF EE 80         [ 7] 5744 	xor	a, #0x80
   7001                    5745 00178$:
   7001 F2 05 70      [10] 5746 	jp	P,00107$
   7004 1B            [ 6] 5747 	dec	de
   7005                    5748 00107$:
                           5749 ;src/main.c:108: cont = 0;
   7005 21 00 00      [10] 5750 	ld	hl,#0x0000
   7008 E3            [19] 5751 	ex	(sp), hl
   7009                    5752 00109$:
                           5753 ;src/main.c:111: switch (pushed){
   7009 7A            [ 4] 5754 	ld	a,d
   700A 07            [ 4] 5755 	rlca
   700B E6 01         [ 7] 5756 	and	a,#0x01
   700D 47            [ 4] 5757 	ld	b,a
   700E 3E 03         [ 7] 5758 	ld	a,#0x03
   7010 BB            [ 4] 5759 	cp	a, e
   7011 3E 00         [ 7] 5760 	ld	a,#0x00
   7013 9A            [ 4] 5761 	sbc	a, d
   7014 E2 19 70      [10] 5762 	jp	PO, 00179$
   7017 EE 80         [ 7] 5763 	xor	a, #0x80
   7019                    5764 00179$:
   7019 07            [ 4] 5765 	rlca
   701A E6 01         [ 7] 5766 	and	a,#0x01
   701C 4F            [ 4] 5767 	ld	c,a
   701D 78            [ 4] 5768 	ld	a,b
   701E B7            [ 4] 5769 	or	a,a
   701F 20 3A         [12] 5770 	jr	NZ,00115$
   7021 B1            [ 4] 5771 	or	a,c
   7022 20 37         [12] 5772 	jr	NZ,00115$
   7024 D5            [11] 5773 	push	de
   7025 57            [ 4] 5774 	ld	d,a
   7026 21 2D 70      [10] 5775 	ld	hl,#00180$
   7029 19            [11] 5776 	add	hl,de
   702A 19            [11] 5777 	add	hl,de
                           5778 ;src/main.c:112: case 0: init = 90;break;
   702B D1            [10] 5779 	pop	de
   702C E9            [ 4] 5780 	jp	(hl)
   702D                    5781 00180$:
   702D 18 06         [12] 5782 	jr	00111$
   702F 18 0E         [12] 5783 	jr	00112$
   7031 18 16         [12] 5784 	jr	00113$
   7033 18 1E         [12] 5785 	jr	00114$
   7035                    5786 00111$:
   7035 DD 36 FC 5A   [19] 5787 	ld	-4 (ix),#0x5A
   7039 DD 36 FD 00   [19] 5788 	ld	-3 (ix),#0x00
   703D 18 1C         [12] 5789 	jr	00115$
                           5790 ;src/main.c:113: case 1: init = 110;break;
   703F                    5791 00112$:
   703F DD 36 FC 6E   [19] 5792 	ld	-4 (ix),#0x6E
   7043 DD 36 FD 00   [19] 5793 	ld	-3 (ix),#0x00
   7047 18 12         [12] 5794 	jr	00115$
                           5795 ;src/main.c:114: case 2: init = 130;break;
   7049                    5796 00113$:
   7049 DD 36 FC 82   [19] 5797 	ld	-4 (ix),#0x82
   704D DD 36 FD 00   [19] 5798 	ld	-3 (ix),#0x00
   7051 18 08         [12] 5799 	jr	00115$
                           5800 ;src/main.c:115: case 3: init = 150;break;
   7053                    5801 00114$:
   7053 DD 36 FC 96   [19] 5802 	ld	-4 (ix),#0x96
   7057 DD 36 FD 00   [19] 5803 	ld	-3 (ix),#0x00
                           5804 ;src/main.c:116: }
   705B                    5805 00115$:
                           5806 ;src/main.c:117: memptr = cpct_getScreenPtr(VMEM,15,init);
   705B DD 66 FC      [19] 5807 	ld	h,-4 (ix)
   705E C5            [11] 5808 	push	bc
   705F D5            [11] 5809 	push	de
   7060 E5            [11] 5810 	push	hl
   7061 33            [ 6] 5811 	inc	sp
   7062 3E 0F         [ 7] 5812 	ld	a,#0x0F
   7064 F5            [11] 5813 	push	af
   7065 33            [ 6] 5814 	inc	sp
   7066 21 00 C0      [10] 5815 	ld	hl,#0xC000
   7069 E5            [11] 5816 	push	hl
   706A CD 40 8F      [17] 5817 	call	_cpct_getScreenPtr
   706D D1            [10] 5818 	pop	de
   706E C1            [10] 5819 	pop	bc
                           5820 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   706F DD 75 FE      [19] 5821 	ld	-2 (ix),l
   7072 DD 74 FF      [19] 5822 	ld	-1 (ix),h
                           5823 ;src/main.c:118: cpct_drawSprite(marcador,memptr, 2, 8);
   7075 C5            [11] 5824 	push	bc
   7076 D5            [11] 5825 	push	de
   7077 21 02 08      [10] 5826 	ld	hl,#0x0802
   707A E5            [11] 5827 	push	hl
   707B DD 6E FE      [19] 5828 	ld	l,-2 (ix)
   707E DD 66 FF      [19] 5829 	ld	h,-1 (ix)
   7081 E5            [11] 5830 	push	hl
   7082 21 9E 76      [10] 5831 	ld	hl,#_marcador
   7085 E5            [11] 5832 	push	hl
   7086 CD 83 8C      [17] 5833 	call	_cpct_drawSprite
   7089 21 05 80      [10] 5834 	ld	hl,#0x8005
   708C CD 72 8B      [17] 5835 	call	_cpct_isKeyPressed
   708F 7D            [ 4] 5836 	ld	a,l
   7090 D1            [10] 5837 	pop	de
   7091 C1            [10] 5838 	pop	bc
   7092 B7            [ 4] 5839 	or	a, a
   7093 28 2A         [12] 5840 	jr	Z,00122$
                           5841 ;src/main.c:120: switch (pushed){
   7095 78            [ 4] 5842 	ld	a,b
   7096 B7            [ 4] 5843 	or	a,a
   7097 20 26         [12] 5844 	jr	NZ,00122$
   7099 B1            [ 4] 5845 	or	a,c
   709A 20 23         [12] 5846 	jr	NZ,00122$
   709C 57            [ 4] 5847 	ld	d,a
   709D 21 A3 70      [10] 5848 	ld	hl,#00181$
   70A0 19            [11] 5849 	add	hl,de
   70A1 19            [11] 5850 	add	hl,de
                           5851 ;src/main.c:121: case 0: return 1;break;
   70A2 E9            [ 4] 5852 	jp	(hl)
   70A3                    5853 00181$:
   70A3 18 06         [12] 5854 	jr	00116$
   70A5 18 09         [12] 5855 	jr	00117$
   70A7 18 0C         [12] 5856 	jr	00118$
   70A9 18 0F         [12] 5857 	jr	00119$
   70AB                    5858 00116$:
   70AB 21 01 00      [10] 5859 	ld	hl,#0x0001
   70AE 18 1B         [12] 5860 	jr	00126$
                           5861 ;src/main.c:122: case 1: return 2;break;
   70B0                    5862 00117$:
   70B0 21 02 00      [10] 5863 	ld	hl,#0x0002
   70B3 18 16         [12] 5864 	jr	00126$
                           5865 ;src/main.c:123: case 2: return 3;break;
   70B5                    5866 00118$:
   70B5 21 03 00      [10] 5867 	ld	hl,#0x0003
   70B8 18 11         [12] 5868 	jr	00126$
                           5869 ;src/main.c:124: case 3: return 0;break;
   70BA                    5870 00119$:
   70BA 21 00 00      [10] 5871 	ld	hl,#0x0000
   70BD 18 0C         [12] 5872 	jr	00126$
                           5873 ;src/main.c:125: }
   70BF                    5874 00122$:
                           5875 ;src/main.c:127: cont++;
   70BF DD 34 FA      [23] 5876 	inc	-6 (ix)
   70C2 C2 7E 6F      [10] 5877 	jp	NZ,00124$
   70C5 DD 34 FB      [23] 5878 	inc	-5 (ix)
   70C8 C3 7E 6F      [10] 5879 	jp	00124$
   70CB                    5880 00126$:
   70CB DD F9         [10] 5881 	ld	sp, ix
   70CD DD E1         [14] 5882 	pop	ix
   70CF C9            [10] 5883 	ret
   70D0                    5884 ___str_4:
   70D0 4E 75 65 76 61 20  5885 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   70DD 00                 5886 	.db 0x00
   70DE                    5887 ___str_5:
   70DE 43 72 65 64 69 74  5888 	.ascii "Creditos"
        6F 73
   70E6 00                 5889 	.db 0x00
   70E7                    5890 ___str_6:
   70E7 43 6F 6E 73 74 72  5891 	.ascii "Constroles"
        6F 6C 65 73
   70F1 00                 5892 	.db 0x00
   70F2                    5893 ___str_7:
   70F2 53 61 6C 69 72     5894 	.ascii "Salir"
   70F7 00                 5895 	.db 0x00
                           5896 ;src/main.c:133: void game(){
                           5897 ;	---------------------------------
                           5898 ; Function game
                           5899 ; ---------------------------------
   70F8                    5900 _game::
                           5901 ;src/main.c:136: initVariables(1);
   70F8 3E 01         [ 7] 5902 	ld	a,#0x01
   70FA F5            [11] 5903 	push	af
   70FB 33            [ 6] 5904 	inc	sp
   70FC CD 3F 4E      [17] 5905 	call	_initVariables
   70FF 33            [ 6] 5906 	inc	sp
                           5907 ;src/main.c:137: initPlayer(map);
   7100 3A 27 91      [13] 5908 	ld	a,(_map)
   7103 F5            [11] 5909 	push	af
   7104 33            [ 6] 5910 	inc	sp
   7105 CD 41 4D      [17] 5911 	call	_initPlayer
   7108 33            [ 6] 5912 	inc	sp
                           5913 ;src/main.c:138: initNivel();
   7109 CD 2F 4E      [17] 5914 	call	_initNivel
                           5915 ;src/main.c:139: initEnemies(map);
   710C 3A 27 91      [13] 5916 	ld	a,(_map)
   710F F5            [11] 5917 	push	af
   7110 33            [ 6] 5918 	inc	sp
   7111 CD CB 4D      [17] 5919 	call	_initEnemies
   7114 33            [ 6] 5920 	inc	sp
                           5921 ;src/main.c:141: cpct_clearScreen(0);
   7115 21 00 40      [10] 5922 	ld	hl,#0x4000
   7118 E5            [11] 5923 	push	hl
   7119 AF            [ 4] 5924 	xor	a, a
   711A F5            [11] 5925 	push	af
   711B 33            [ 6] 5926 	inc	sp
   711C 26 C0         [ 7] 5927 	ld	h, #0xC0
   711E E5            [11] 5928 	push	hl
   711F CD 4D 8E      [17] 5929 	call	_cpct_memset
                           5930 ;src/main.c:142: drawMap(map);
   7122 3A 27 91      [13] 5931 	ld	a,(_map)
   7125 F5            [11] 5932 	push	af
   7126 33            [ 6] 5933 	inc	sp
   7127 CD BC 51      [17] 5934 	call	_drawMap
   712A 33            [ 6] 5935 	inc	sp
                           5936 ;src/main.c:143: while (1){
   712B                    5937 00137$:
                           5938 ;src/main.c:144: if(finish == 1) return;
   712B 3A 29 91      [13] 5939 	ld	a,(#_finish + 0)
   712E 3D            [ 4] 5940 	dec	a
   712F C8            [11] 5941 	ret	Z
   7130 18 00         [12] 5942 	jr	00102$
   7132                    5943 00102$:
                           5944 ;src/main.c:146: cpct_waitVSYNC();
   7132 CD 33 8E      [17] 5945 	call	_cpct_waitVSYNC
                           5946 ;src/main.c:149: erases();
   7135 CD 38 55      [17] 5947 	call	_erases
                           5948 ;src/main.c:152: if(temp == 10)
   7138 3A 26 91      [13] 5949 	ld	a,(#_temp + 0)
   713B D6 0A         [ 7] 5950 	sub	a, #0x0A
   713D 20 0F         [12] 5951 	jr	NZ,00104$
                           5952 ;src/main.c:153: drawPickUps(n.corazon,n.bullet);
   713F 21 31 91      [10] 5953 	ld	hl, #(_n + 0x0002) + 0
   7142 56            [ 7] 5954 	ld	d,(hl)
   7143 3A 30 91      [13] 5955 	ld	a, (#(_n + 0x0001) + 0)
   7146 D5            [11] 5956 	push	de
   7147 33            [ 6] 5957 	inc	sp
   7148 F5            [11] 5958 	push	af
   7149 33            [ 6] 5959 	inc	sp
   714A CD DF 56      [17] 5960 	call	_drawPickUps
   714D F1            [10] 5961 	pop	af
   714E                    5962 00104$:
                           5963 ;src/main.c:156: draws();
   714E CD 79 54      [17] 5964 	call	_draws
                           5965 ;src/main.c:159: if(temp == 10){
   7151 3A 26 91      [13] 5966 	ld	a,(#_temp + 0)
   7154 D6 0A         [ 7] 5967 	sub	a, #0x0A
   7156 20 2F         [12] 5968 	jr	NZ,00112$
                           5969 ;src/main.c:160: if(player.atk < 20) drawFatiga(player.atk,2);
   7158 21 44 91      [10] 5970 	ld	hl, #(_player + 0x0008) + 0
   715B 56            [ 7] 5971 	ld	d,(hl)
   715C 7A            [ 4] 5972 	ld	a,d
   715D D6 14         [ 7] 5973 	sub	a, #0x14
   715F 30 0C         [12] 5974 	jr	NC,00109$
   7161 3E 02         [ 7] 5975 	ld	a,#0x02
   7163 F5            [11] 5976 	push	af
   7164 33            [ 6] 5977 	inc	sp
   7165 D5            [11] 5978 	push	de
   7166 33            [ 6] 5979 	inc	sp
   7167 CD B9 55      [17] 5980 	call	_drawFatiga
   716A F1            [10] 5981 	pop	af
   716B 18 1A         [12] 5982 	jr	00112$
   716D                    5983 00109$:
                           5984 ;src/main.c:161: else if(player.atk > 20) drawFatiga(player.atk,1);
   716D 3E 14         [ 7] 5985 	ld	a,#0x14
   716F 92            [ 4] 5986 	sub	a, d
   7170 30 0C         [12] 5987 	jr	NC,00106$
   7172 3E 01         [ 7] 5988 	ld	a,#0x01
   7174 F5            [11] 5989 	push	af
   7175 33            [ 6] 5990 	inc	sp
   7176 D5            [11] 5991 	push	de
   7177 33            [ 6] 5992 	inc	sp
   7178 CD B9 55      [17] 5993 	call	_drawFatiga
   717B F1            [10] 5994 	pop	af
   717C 18 09         [12] 5995 	jr	00112$
   717E                    5996 00106$:
                           5997 ;src/main.c:162: else drawFatiga(player.atk,0);
   717E AF            [ 4] 5998 	xor	a, a
   717F F5            [11] 5999 	push	af
   7180 33            [ 6] 6000 	inc	sp
   7181 D5            [11] 6001 	push	de
   7182 33            [ 6] 6002 	inc	sp
   7183 CD B9 55      [17] 6003 	call	_drawFatiga
   7186 F1            [10] 6004 	pop	af
   7187                    6005 00112$:
                           6006 ;src/main.c:165: if(temp%2 == 0){
   7187 3A 26 91      [13] 6007 	ld	a,(#_temp + 0)
                           6008 ;src/main.c:166: player.lx = player.x;
                           6009 ;src/main.c:167: player.ly = player.y;
                           6010 ;src/main.c:165: if(temp%2 == 0){
   718A E6 01         [ 7] 6011 	and	a,#0x01
   718C 20 0D         [12] 6012 	jr	NZ,00114$
                           6013 ;src/main.c:166: player.lx = player.x;
   718E 3A 3C 91      [13] 6014 	ld	a, (#_player + 0)
   7191 21 3E 91      [10] 6015 	ld	hl,#(_player + 0x0002)
   7194 77            [ 7] 6016 	ld	(hl),a
                           6017 ;src/main.c:167: player.ly = player.y;
   7195 3A 3D 91      [13] 6018 	ld	a, (#(_player + 0x0001) + 0)
   7198 32 3F 91      [13] 6019 	ld	(#(_player + 0x0003)),a
   719B                    6020 00114$:
                           6021 ;src/main.c:170: if(enemy.life > 0){
   719B 21 4F 91      [10] 6022 	ld	hl, #(_enemy + 0x0008) + 0
   719E 6E            [ 7] 6023 	ld	l,(hl)
                           6024 ;src/main.c:173: enemy.ly = enemy.y;
                           6025 ;src/main.c:181: enemy.x = enemy.ox;
                           6026 ;src/main.c:182: enemy.y = enemy.oy;
                           6027 ;src/main.c:170: if(enemy.life > 0){
   719F 7D            [ 4] 6028 	ld	a,l
   71A0 B7            [ 4] 6029 	or	a, a
   71A1 CA C2 72      [10] 6030 	jp	Z,00121$
                           6031 ;src/main.c:171: if(temp%2 == 1){
   71A4 3A 26 91      [13] 6032 	ld	a,(#_temp + 0)
   71A7 E6 01         [ 7] 6033 	and	a, #0x01
   71A9 67            [ 4] 6034 	ld	h,a
                           6035 ;src/main.c:172: enemy.lx = enemy.x;
                           6036 ;src/main.c:173: enemy.ly = enemy.y;
                           6037 ;src/main.c:171: if(temp%2 == 1){
   71AA 25            [ 4] 6038 	dec	h
   71AB 20 0C         [12] 6039 	jr	NZ,00116$
                           6040 ;src/main.c:172: enemy.lx = enemy.x;
   71AD 3A 47 91      [13] 6041 	ld	a, (#_enemy + 0)
   71B0 32 49 91      [13] 6042 	ld	(#(_enemy + 0x0002)),a
                           6043 ;src/main.c:173: enemy.ly = enemy.y;
   71B3 3A 48 91      [13] 6044 	ld	a, (#(_enemy + 0x0001) + 0)
   71B6 32 4A 91      [13] 6045 	ld	(#(_enemy + 0x0003)),a
   71B9                    6046 00116$:
                           6047 ;src/main.c:176: move();
   71B9 CD 32 60      [17] 6048 	call	_move
                           6049 ;src/main.c:178: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   71BC 21 44 91      [10] 6050 	ld	hl, #(_player + 0x0008) + 0
   71BF 56            [ 7] 6051 	ld	d,(hl)
   71C0 3A 48 91      [13] 6052 	ld	a, (#(_enemy + 0x0001) + 0)
   71C3 21 47 91      [10] 6053 	ld	hl, #_enemy + 0
   71C6 5E            [ 7] 6054 	ld	e,(hl)
   71C7 21 3D 91      [10] 6055 	ld	hl, #(_player + 0x0001) + 0
   71CA 46            [ 7] 6056 	ld	b,(hl)
   71CB 21 3C 91      [10] 6057 	ld	hl, #_player + 0
   71CE 4E            [ 7] 6058 	ld	c,(hl)
   71CF D5            [11] 6059 	push	de
   71D0 33            [ 6] 6060 	inc	sp
   71D1 57            [ 4] 6061 	ld	d,a
   71D2 D5            [11] 6062 	push	de
   71D3 C5            [11] 6063 	push	bc
   71D4 CD FF 60      [17] 6064 	call	_checkCollisions
   71D7 F1            [10] 6065 	pop	af
   71D8 F1            [10] 6066 	pop	af
   71D9 33            [ 6] 6067 	inc	sp
                           6068 ;src/main.c:189: enemy.pursue = 0;
                           6069 ;src/main.c:178: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   71DA 7D            [ 4] 6070 	ld	a,l
   71DB 3D            [ 4] 6071 	dec	a
   71DC 28 08         [12] 6072 	jr	Z,00117$
   71DE 7D            [ 4] 6073 	ld	a,l
   71DF D6 02         [ 7] 6074 	sub	a, #0x02
   71E1 28 72         [12] 6075 	jr	Z,00118$
   71E3 C3 C2 72      [10] 6076 	jp	00121$
                           6077 ;src/main.c:179: case 1:
   71E6                    6078 00117$:
                           6079 ;src/main.c:180: erase(enemy.lx,enemy.ly,0);
   71E6 21 4A 91      [10] 6080 	ld	hl, #(_enemy + 0x0003) + 0
   71E9 56            [ 7] 6081 	ld	d,(hl)
   71EA 21 49 91      [10] 6082 	ld	hl, #(_enemy + 0x0002) + 0
   71ED 46            [ 7] 6083 	ld	b,(hl)
   71EE AF            [ 4] 6084 	xor	a, a
   71EF F5            [11] 6085 	push	af
   71F0 33            [ 6] 6086 	inc	sp
   71F1 D5            [11] 6087 	push	de
   71F2 33            [ 6] 6088 	inc	sp
   71F3 C5            [11] 6089 	push	bc
   71F4 33            [ 6] 6090 	inc	sp
   71F5 CD E4 53      [17] 6091 	call	_erase
   71F8 F1            [10] 6092 	pop	af
   71F9 33            [ 6] 6093 	inc	sp
                           6094 ;src/main.c:181: enemy.x = enemy.ox;
   71FA 3A 4B 91      [13] 6095 	ld	a, (#(_enemy + 0x0004) + 0)
   71FD 32 47 91      [13] 6096 	ld	(#_enemy),a
                           6097 ;src/main.c:182: enemy.y = enemy.oy;
   7200 21 4C 91      [10] 6098 	ld	hl, #(_enemy + 0x0005) + 0
   7203 5E            [ 7] 6099 	ld	e,(hl)
   7204 21 48 91      [10] 6100 	ld	hl,#(_enemy + 0x0001)
   7207 73            [ 7] 6101 	ld	(hl),e
                           6102 ;src/main.c:183: enemy.lx = enemy.x;
   7208 32 49 91      [13] 6103 	ld	(#(_enemy + 0x0002)),a
                           6104 ;src/main.c:184: enemy.ly = enemy.y;
   720B 21 4A 91      [10] 6105 	ld	hl,#(_enemy + 0x0003)
   720E 73            [ 7] 6106 	ld	(hl),e
                           6107 ;src/main.c:185: enemy.ox = originse[map-1][4];
   720F 21 27 91      [10] 6108 	ld	hl,#_map + 0
   7212 56            [ 7] 6109 	ld	d, (hl)
   7213 15            [ 4] 6110 	dec	d
   7214 4A            [ 4] 6111 	ld	c,d
   7215 06 00         [ 7] 6112 	ld	b,#0x00
   7217 69            [ 4] 6113 	ld	l, c
   7218 60            [ 4] 6114 	ld	h, b
   7219 29            [11] 6115 	add	hl, hl
   721A 09            [11] 6116 	add	hl, bc
   721B 29            [11] 6117 	add	hl, hl
   721C 11 39 4B      [10] 6118 	ld	de,#_originse
   721F 19            [11] 6119 	add	hl,de
   7220 11 04 00      [10] 6120 	ld	de, #0x0004
   7223 19            [11] 6121 	add	hl, de
   7224 7E            [ 7] 6122 	ld	a,(hl)
   7225 32 4B 91      [13] 6123 	ld	(#(_enemy + 0x0004)),a
                           6124 ;src/main.c:186: enemy.oy = originse[map-1][5];
   7228 21 27 91      [10] 6125 	ld	hl,#_map + 0
   722B 56            [ 7] 6126 	ld	d, (hl)
   722C 15            [ 4] 6127 	dec	d
   722D 4A            [ 4] 6128 	ld	c,d
   722E 06 00         [ 7] 6129 	ld	b,#0x00
   7230 69            [ 4] 6130 	ld	l, c
   7231 60            [ 4] 6131 	ld	h, b
   7232 29            [11] 6132 	add	hl, hl
   7233 09            [11] 6133 	add	hl, bc
   7234 29            [11] 6134 	add	hl, hl
   7235 11 39 4B      [10] 6135 	ld	de,#_originse
   7238 19            [11] 6136 	add	hl,de
   7239 11 05 00      [10] 6137 	ld	de, #0x0005
   723C 19            [11] 6138 	add	hl, de
   723D 7E            [ 7] 6139 	ld	a,(hl)
   723E 32 4C 91      [13] 6140 	ld	(#(_enemy + 0x0005)),a
                           6141 ;src/main.c:187: enemy.life -= 1;
   7241 3A 4F 91      [13] 6142 	ld	a, (#(_enemy + 0x0008) + 0)
   7244 C6 FF         [ 7] 6143 	add	a,#0xFF
   7246 32 4F 91      [13] 6144 	ld	(#(_enemy + 0x0008)),a
                           6145 ;src/main.c:188: player.atk = 20;
   7249 21 44 91      [10] 6146 	ld	hl,#(_player + 0x0008)
   724C 36 14         [10] 6147 	ld	(hl),#0x14
                           6148 ;src/main.c:189: enemy.pursue = 0;
   724E 21 54 91      [10] 6149 	ld	hl,#(_enemy + 0x000d)
   7251 36 00         [10] 6150 	ld	(hl),#0x00
                           6151 ;src/main.c:190: break;
   7253 18 6D         [12] 6152 	jr	00121$
                           6153 ;src/main.c:191: case 2:
   7255                    6154 00118$:
                           6155 ;src/main.c:192: erase(player.lx,player.ly,0);
   7255 21 3F 91      [10] 6156 	ld	hl, #(_player + 0x0003) + 0
   7258 56            [ 7] 6157 	ld	d,(hl)
   7259 21 3E 91      [10] 6158 	ld	hl, #(_player + 0x0002) + 0
   725C 46            [ 7] 6159 	ld	b,(hl)
   725D AF            [ 4] 6160 	xor	a, a
   725E F5            [11] 6161 	push	af
   725F 33            [ 6] 6162 	inc	sp
   7260 D5            [11] 6163 	push	de
   7261 33            [ 6] 6164 	inc	sp
   7262 C5            [11] 6165 	push	bc
   7263 33            [ 6] 6166 	inc	sp
   7264 CD E4 53      [17] 6167 	call	_erase
   7267 F1            [10] 6168 	pop	af
   7268 33            [ 6] 6169 	inc	sp
                           6170 ;src/main.c:193: player.x =originsp[map-1][0];
   7269 21 27 91      [10] 6171 	ld	hl,#_map + 0
   726C 56            [ 7] 6172 	ld	d, (hl)
   726D 15            [ 4] 6173 	dec	d
   726E 6A            [ 4] 6174 	ld	l,d
   726F 26 00         [ 7] 6175 	ld	h,#0x00
   7271 29            [11] 6176 	add	hl, hl
   7272 11 31 4B      [10] 6177 	ld	de,#_originsp
   7275 19            [11] 6178 	add	hl,de
   7276 7E            [ 7] 6179 	ld	a,(hl)
   7277 32 3C 91      [13] 6180 	ld	(#_player),a
                           6181 ;src/main.c:194: player.y = originsp[map-1][1];
   727A 21 27 91      [10] 6182 	ld	hl,#_map + 0
   727D 56            [ 7] 6183 	ld	d, (hl)
   727E 15            [ 4] 6184 	dec	d
   727F 6A            [ 4] 6185 	ld	l,d
   7280 26 00         [ 7] 6186 	ld	h,#0x00
   7282 29            [11] 6187 	add	hl, hl
   7283 11 31 4B      [10] 6188 	ld	de,#_originsp
   7286 19            [11] 6189 	add	hl,de
   7287 23            [ 6] 6190 	inc	hl
   7288 7E            [ 7] 6191 	ld	a,(hl)
   7289 32 3D 91      [13] 6192 	ld	(#(_player + 0x0001)),a
                           6193 ;src/main.c:195: player.lx =originsp[map-1][0];
   728C 21 27 91      [10] 6194 	ld	hl,#_map + 0
   728F 56            [ 7] 6195 	ld	d, (hl)
   7290 15            [ 4] 6196 	dec	d
   7291 6A            [ 4] 6197 	ld	l,d
   7292 26 00         [ 7] 6198 	ld	h,#0x00
   7294 29            [11] 6199 	add	hl, hl
   7295 11 31 4B      [10] 6200 	ld	de,#_originsp
   7298 19            [11] 6201 	add	hl,de
   7299 7E            [ 7] 6202 	ld	a,(hl)
   729A 32 3E 91      [13] 6203 	ld	(#(_player + 0x0002)),a
                           6204 ;src/main.c:196: player.ly = originsp[map-1][1];
   729D 21 27 91      [10] 6205 	ld	hl,#_map + 0
   72A0 56            [ 7] 6206 	ld	d, (hl)
   72A1 15            [ 4] 6207 	dec	d
   72A2 6A            [ 4] 6208 	ld	l,d
   72A3 26 00         [ 7] 6209 	ld	h,#0x00
   72A5 29            [11] 6210 	add	hl, hl
   72A6 11 31 4B      [10] 6211 	ld	de,#_originsp
   72A9 19            [11] 6212 	add	hl,de
   72AA 23            [ 6] 6213 	inc	hl
   72AB 7E            [ 7] 6214 	ld	a,(hl)
   72AC 21 3F 91      [10] 6215 	ld	hl,#(_player + 0x0003)
   72AF 77            [ 7] 6216 	ld	(hl),a
                           6217 ;src/main.c:197: player.life -= 1;
   72B0 3A 42 91      [13] 6218 	ld	a, (#(_player + 0x0006) + 0)
   72B3 C6 FF         [ 7] 6219 	add	a,#0xFF
   72B5 32 42 91      [13] 6220 	ld	(#(_player + 0x0006)),a
                           6221 ;src/main.c:198: player.atk = 20;
   72B8 21 44 91      [10] 6222 	ld	hl,#(_player + 0x0008)
   72BB 36 14         [10] 6223 	ld	(hl),#0x14
                           6224 ;src/main.c:199: enemy.pursue = 0;
   72BD 21 54 91      [10] 6225 	ld	hl,#(_enemy + 0x000d)
   72C0 36 00         [10] 6226 	ld	(hl),#0x00
                           6227 ;src/main.c:201: }
   72C2                    6228 00121$:
                           6229 ;src/main.c:203: if(temp > 10)
   72C2 3E 0A         [ 7] 6230 	ld	a,#0x0A
   72C4 FD 21 26 91   [14] 6231 	ld	iy,#_temp
   72C8 FD 96 00      [19] 6232 	sub	a, 0 (iy)
   72CB 30 08         [12] 6233 	jr	NC,00123$
                           6234 ;src/main.c:204: temp = 0;
   72CD FD 21 26 91   [14] 6235 	ld	iy,#_temp
   72D1 FD 36 00 00   [19] 6236 	ld	0 (iy),#0x00
   72D5                    6237 00123$:
                           6238 ;src/main.c:205: temp += 1;
   72D5 FD 21 26 91   [14] 6239 	ld	iy,#_temp
   72D9 FD 34 00      [23] 6240 	inc	0 (iy)
                           6241 ;src/main.c:206: player.latk = player.atk;
   72DC 11 45 91      [10] 6242 	ld	de,#_player + 9
   72DF 3A 44 91      [13] 6243 	ld	a, (#(_player + 0x0008) + 0)
   72E2 12            [ 7] 6244 	ld	(de),a
                           6245 ;src/main.c:208: cpct_scanKeyboard_f();
   72E3 CD 7E 8B      [17] 6246 	call	_cpct_scanKeyboard_f
                           6247 ;src/main.c:209: player.sprite = checkKeyboard();
   72E6 CD 71 6B      [17] 6248 	call	_checkKeyboard
   72E9 5D            [ 4] 6249 	ld	e,l
   72EA 54            [ 4] 6250 	ld	d,h
   72EB ED 53 40 91   [20] 6251 	ld	((_player + 0x0004)), de
                           6252 ;src/main.c:210: checkBoundsCollisions(&n.corazon,&n.bullet);
   72EF 21 31 91      [10] 6253 	ld	hl,#(_n + 0x0002)
   72F2 11 30 91      [10] 6254 	ld	de,#(_n + 0x0001)
   72F5 E5            [11] 6255 	push	hl
   72F6 D5            [11] 6256 	push	de
   72F7 CD 20 62      [17] 6257 	call	_checkBoundsCollisions
   72FA F1            [10] 6258 	pop	af
   72FB F1            [10] 6259 	pop	af
                           6260 ;src/main.c:212: if(arrow == 1){
   72FC 3A 2A 91      [13] 6261 	ld	a,(#_arrow + 0)
   72FF 3D            [ 4] 6262 	dec	a
   7300 20 70         [12] 6263 	jr	NZ,00133$
                           6264 ;src/main.c:213: moveObject();
   7302 CD ED 6D      [17] 6265 	call	_moveObject
                           6266 ;src/main.c:214: bound = checkArrowCollisions();
   7305 CD 28 69      [17] 6267 	call	_checkArrowCollisions
   7308 FD 21 2C 91   [14] 6268 	ld	iy,#_bound
   730C FD 75 00      [19] 6269 	ld	0 (iy),l
                           6270 ;src/main.c:215: if(object.dir == 2 || object.dir == 8)
   730F 21 39 91      [10] 6271 	ld	hl, #_object + 7
   7312 7E            [ 7] 6272 	ld	a, (hl)
   7313 FE 02         [ 7] 6273 	cp	a,#0x02
   7315 28 04         [12] 6274 	jr	Z,00124$
   7317 D6 08         [ 7] 6275 	sub	a, #0x08
   7319 20 04         [12] 6276 	jr	NZ,00125$
   731B                    6277 00124$:
                           6278 ;src/main.c:216: atkObj = 21;
   731B 06 15         [ 7] 6279 	ld	b,#0x15
   731D 18 02         [12] 6280 	jr	00126$
   731F                    6281 00125$:
                           6282 ;src/main.c:218: atkObj = 22;
   731F 06 16         [ 7] 6283 	ld	b,#0x16
   7321                    6284 00126$:
                           6285 ;src/main.c:219: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
   7321 3A 4F 91      [13] 6286 	ld	a, (#(_enemy + 0x0008) + 0)
   7324 B7            [ 4] 6287 	or	a, a
   7325 28 4B         [12] 6288 	jr	Z,00133$
   7327 3A 48 91      [13] 6289 	ld	a, (#(_enemy + 0x0001) + 0)
   732A 21 47 91      [10] 6290 	ld	hl, #_enemy + 0
   732D 4E            [ 7] 6291 	ld	c,(hl)
   732E 21 33 91      [10] 6292 	ld	hl, #_object + 1
   7331 5E            [ 7] 6293 	ld	e,(hl)
   7332 21 32 91      [10] 6294 	ld	hl, #_object + 0
   7335 56            [ 7] 6295 	ld	d,(hl)
   7336 C5            [11] 6296 	push	bc
   7337 33            [ 6] 6297 	inc	sp
   7338 F5            [11] 6298 	push	af
   7339 33            [ 6] 6299 	inc	sp
   733A 79            [ 4] 6300 	ld	a,c
   733B F5            [11] 6301 	push	af
   733C 33            [ 6] 6302 	inc	sp
   733D 7B            [ 4] 6303 	ld	a,e
   733E F5            [11] 6304 	push	af
   733F 33            [ 6] 6305 	inc	sp
   7340 D5            [11] 6306 	push	de
   7341 33            [ 6] 6307 	inc	sp
   7342 CD FF 60      [17] 6308 	call	_checkCollisions
   7345 F1            [10] 6309 	pop	af
   7346 F1            [10] 6310 	pop	af
   7347 33            [ 6] 6311 	inc	sp
   7348 2D            [ 4] 6312 	dec	l
   7349 20 27         [12] 6313 	jr	NZ,00133$
   734B 3A 2C 91      [13] 6314 	ld	a,(#_bound + 0)
   734E B7            [ 4] 6315 	or	a, a
   734F 20 21         [12] 6316 	jr	NZ,00133$
                           6317 ;src/main.c:220: enemy.life -= 1;
   7351 3A 4F 91      [13] 6318 	ld	a, (#(_enemy + 0x0008) + 0)
   7354 C6 FF         [ 7] 6319 	add	a,#0xFF
   7356 32 4F 91      [13] 6320 	ld	(#(_enemy + 0x0008)),a
                           6321 ;src/main.c:221: enemy.x = enemy.ox;
   7359 3A 4B 91      [13] 6322 	ld	a, (#(_enemy + 0x0004) + 0)
   735C 32 47 91      [13] 6323 	ld	(#_enemy),a
                           6324 ;src/main.c:222: enemy.y = enemy.oy;
   735F 3A 4C 91      [13] 6325 	ld	a, (#(_enemy + 0x0005) + 0)
   7362 32 48 91      [13] 6326 	ld	(#(_enemy + 0x0001)),a
                           6327 ;src/main.c:223: object.vivo = 0;
   7365 21 38 91      [10] 6328 	ld	hl,#_object + 6
   7368 36 00         [10] 6329 	ld	(hl),#0x00
                           6330 ;src/main.c:224: bound = 1;
   736A FD 21 2C 91   [14] 6331 	ld	iy,#_bound
   736E FD 36 00 01   [19] 6332 	ld	0 (iy),#0x01
   7372                    6333 00133$:
                           6334 ;src/main.c:228: if(player.life == 0){
   7372 3A 42 91      [13] 6335 	ld	a, (#(_player + 0x0006) + 0)
   7375 B7            [ 4] 6336 	or	a, a
   7376 C2 2B 71      [10] 6337 	jp	NZ,00137$
                           6338 ;src/main.c:229: gameOver();
   7379 CD 22 6E      [17] 6339 	call	_gameOver
                           6340 ;src/main.c:230: finish = 1;
   737C 21 29 91      [10] 6341 	ld	hl,#_finish + 0
   737F 36 01         [10] 6342 	ld	(hl), #0x01
   7381 C3 2B 71      [10] 6343 	jp	00137$
                           6344 ;src/main.c:239: void credits(){
                           6345 ;	---------------------------------
                           6346 ; Function credits
                           6347 ; ---------------------------------
   7384                    6348 _credits::
                           6349 ;src/main.c:241: cpct_clearScreen(0);
   7384 21 00 40      [10] 6350 	ld	hl,#0x4000
   7387 E5            [11] 6351 	push	hl
   7388 AF            [ 4] 6352 	xor	a, a
   7389 F5            [11] 6353 	push	af
   738A 33            [ 6] 6354 	inc	sp
   738B 26 C0         [ 7] 6355 	ld	h, #0xC0
   738D E5            [11] 6356 	push	hl
   738E CD 4D 8E      [17] 6357 	call	_cpct_memset
                           6358 ;src/main.c:243: memptr = cpct_getScreenPtr(VMEM, 18, 30); 
   7391 21 12 1E      [10] 6359 	ld	hl,#0x1E12
   7394 E5            [11] 6360 	push	hl
   7395 21 00 C0      [10] 6361 	ld	hl,#0xC000
   7398 E5            [11] 6362 	push	hl
   7399 CD 40 8F      [17] 6363 	call	_cpct_getScreenPtr
                           6364 ;src/main.c:244: cpct_drawStringM0("Grupo Pyxis", memptr, 1, 0); 
   739C EB            [ 4] 6365 	ex	de,hl
   739D 01 6A 74      [10] 6366 	ld	bc,#___str_8+0
   73A0 21 01 00      [10] 6367 	ld	hl,#0x0001
   73A3 E5            [11] 6368 	push	hl
   73A4 D5            [11] 6369 	push	de
   73A5 C5            [11] 6370 	push	bc
   73A6 CD 5F 8C      [17] 6371 	call	_cpct_drawStringM0
   73A9 21 06 00      [10] 6372 	ld	hl,#6
   73AC 39            [11] 6373 	add	hl,sp
   73AD F9            [ 6] 6374 	ld	sp,hl
                           6375 ;src/main.c:246: memptr = cpct_getScreenPtr(VMEM, 23, 60); 
   73AE 21 17 3C      [10] 6376 	ld	hl,#0x3C17
   73B1 E5            [11] 6377 	push	hl
   73B2 21 00 C0      [10] 6378 	ld	hl,#0xC000
   73B5 E5            [11] 6379 	push	hl
   73B6 CD 40 8F      [17] 6380 	call	_cpct_getScreenPtr
                           6381 ;src/main.c:247: cpct_drawStringM0("Miembros:", memptr, 1, 0); 
   73B9 EB            [ 4] 6382 	ex	de,hl
   73BA 01 76 74      [10] 6383 	ld	bc,#___str_9+0
   73BD 21 01 00      [10] 6384 	ld	hl,#0x0001
   73C0 E5            [11] 6385 	push	hl
   73C1 D5            [11] 6386 	push	de
   73C2 C5            [11] 6387 	push	bc
   73C3 CD 5F 8C      [17] 6388 	call	_cpct_drawStringM0
   73C6 21 06 00      [10] 6389 	ld	hl,#6
   73C9 39            [11] 6390 	add	hl,sp
   73CA F9            [ 6] 6391 	ld	sp,hl
                           6392 ;src/main.c:249: memptr = cpct_getScreenPtr(VMEM, 10, 80); 
   73CB 21 0A 50      [10] 6393 	ld	hl,#0x500A
   73CE E5            [11] 6394 	push	hl
   73CF 21 00 C0      [10] 6395 	ld	hl,#0xC000
   73D2 E5            [11] 6396 	push	hl
   73D3 CD 40 8F      [17] 6397 	call	_cpct_getScreenPtr
                           6398 ;src/main.c:250: cpct_drawStringM0("Alberto Martinez", memptr,2, 0); 
   73D6 EB            [ 4] 6399 	ex	de,hl
   73D7 01 80 74      [10] 6400 	ld	bc,#___str_10+0
   73DA 21 02 00      [10] 6401 	ld	hl,#0x0002
   73DD E5            [11] 6402 	push	hl
   73DE D5            [11] 6403 	push	de
   73DF C5            [11] 6404 	push	bc
   73E0 CD 5F 8C      [17] 6405 	call	_cpct_drawStringM0
   73E3 21 06 00      [10] 6406 	ld	hl,#6
   73E6 39            [11] 6407 	add	hl,sp
   73E7 F9            [ 6] 6408 	ld	sp,hl
                           6409 ;src/main.c:251: memptr = cpct_getScreenPtr(VMEM, 27, 95); 
   73E8 21 1B 5F      [10] 6410 	ld	hl,#0x5F1B
   73EB E5            [11] 6411 	push	hl
   73EC 21 00 C0      [10] 6412 	ld	hl,#0xC000
   73EF E5            [11] 6413 	push	hl
   73F0 CD 40 8F      [17] 6414 	call	_cpct_getScreenPtr
                           6415 ;src/main.c:252: cpct_drawStringM0("Martinez", memptr,2, 0); 
   73F3 EB            [ 4] 6416 	ex	de,hl
   73F4 01 91 74      [10] 6417 	ld	bc,#___str_11+0
   73F7 21 02 00      [10] 6418 	ld	hl,#0x0002
   73FA E5            [11] 6419 	push	hl
   73FB D5            [11] 6420 	push	de
   73FC C5            [11] 6421 	push	bc
   73FD CD 5F 8C      [17] 6422 	call	_cpct_drawStringM0
   7400 21 06 00      [10] 6423 	ld	hl,#6
   7403 39            [11] 6424 	add	hl,sp
   7404 F9            [ 6] 6425 	ld	sp,hl
                           6426 ;src/main.c:254: memptr = cpct_getScreenPtr(VMEM, 13, 115); 
   7405 21 0D 73      [10] 6427 	ld	hl,#0x730D
   7408 E5            [11] 6428 	push	hl
   7409 21 00 C0      [10] 6429 	ld	hl,#0xC000
   740C E5            [11] 6430 	push	hl
   740D CD 40 8F      [17] 6431 	call	_cpct_getScreenPtr
                           6432 ;src/main.c:255: cpct_drawStringM0("Josep Domenech", memptr,2, 0);
   7410 EB            [ 4] 6433 	ex	de,hl
   7411 01 9A 74      [10] 6434 	ld	bc,#___str_12+0
   7414 21 02 00      [10] 6435 	ld	hl,#0x0002
   7417 E5            [11] 6436 	push	hl
   7418 D5            [11] 6437 	push	de
   7419 C5            [11] 6438 	push	bc
   741A CD 5F 8C      [17] 6439 	call	_cpct_drawStringM0
   741D 21 06 00      [10] 6440 	ld	hl,#6
   7420 39            [11] 6441 	add	hl,sp
   7421 F9            [ 6] 6442 	ld	sp,hl
                           6443 ;src/main.c:256: memptr = cpct_getScreenPtr(VMEM, 27, 125); 
   7422 21 1B 7D      [10] 6444 	ld	hl,#0x7D1B
   7425 E5            [11] 6445 	push	hl
   7426 21 00 C0      [10] 6446 	ld	hl,#0xC000
   7429 E5            [11] 6447 	push	hl
   742A CD 40 8F      [17] 6448 	call	_cpct_getScreenPtr
                           6449 ;src/main.c:257: cpct_drawStringM0("Mingot", memptr, 2, 0);  
   742D EB            [ 4] 6450 	ex	de,hl
   742E 01 A9 74      [10] 6451 	ld	bc,#___str_13+0
   7431 21 02 00      [10] 6452 	ld	hl,#0x0002
   7434 E5            [11] 6453 	push	hl
   7435 D5            [11] 6454 	push	de
   7436 C5            [11] 6455 	push	bc
   7437 CD 5F 8C      [17] 6456 	call	_cpct_drawStringM0
   743A 21 06 00      [10] 6457 	ld	hl,#6
   743D 39            [11] 6458 	add	hl,sp
   743E F9            [ 6] 6459 	ld	sp,hl
                           6460 ;src/main.c:259: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   743F 21 0C AF      [10] 6461 	ld	hl,#0xAF0C
   7442 E5            [11] 6462 	push	hl
   7443 21 00 C0      [10] 6463 	ld	hl,#0xC000
   7446 E5            [11] 6464 	push	hl
   7447 CD 40 8F      [17] 6465 	call	_cpct_getScreenPtr
                           6466 ;src/main.c:260: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   744A EB            [ 4] 6467 	ex	de,hl
   744B 01 B0 74      [10] 6468 	ld	bc,#___str_14+0
   744E 21 01 00      [10] 6469 	ld	hl,#0x0001
   7451 E5            [11] 6470 	push	hl
   7452 D5            [11] 6471 	push	de
   7453 C5            [11] 6472 	push	bc
   7454 CD 5F 8C      [17] 6473 	call	_cpct_drawStringM0
   7457 21 06 00      [10] 6474 	ld	hl,#6
   745A 39            [11] 6475 	add	hl,sp
   745B F9            [ 6] 6476 	ld	sp,hl
                           6477 ;src/main.c:264: while (1){
   745C                    6478 00104$:
                           6479 ;src/main.c:265: cpct_scanKeyboard_f();
   745C CD 7E 8B      [17] 6480 	call	_cpct_scanKeyboard_f
                           6481 ;src/main.c:266: if(cpct_isKeyPressed(Key_Space)) {
   745F 21 05 80      [10] 6482 	ld	hl,#0x8005
   7462 CD 72 8B      [17] 6483 	call	_cpct_isKeyPressed
   7465 7D            [ 4] 6484 	ld	a,l
   7466 B7            [ 4] 6485 	or	a, a
   7467 28 F3         [12] 6486 	jr	Z,00104$
                           6487 ;src/main.c:268: return;
   7469 C9            [10] 6488 	ret
   746A                    6489 ___str_8:
   746A 47 72 75 70 6F 20  6490 	.ascii "Grupo Pyxis"
        50 79 78 69 73
   7475 00                 6491 	.db 0x00
   7476                    6492 ___str_9:
   7476 4D 69 65 6D 62 72  6493 	.ascii "Miembros:"
        6F 73 3A
   747F 00                 6494 	.db 0x00
   7480                    6495 ___str_10:
   7480 41 6C 62 65 72 74  6496 	.ascii "Alberto Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A
   7490 00                 6497 	.db 0x00
   7491                    6498 ___str_11:
   7491 4D 61 72 74 69 6E  6499 	.ascii "Martinez"
        65 7A
   7499 00                 6500 	.db 0x00
   749A                    6501 ___str_12:
   749A 4A 6F 73 65 70 20  6502 	.ascii "Josep Domenech"
        44 6F 6D 65 6E 65
        63 68
   74A8 00                 6503 	.db 0x00
   74A9                    6504 ___str_13:
   74A9 4D 69 6E 67 6F 74  6505 	.ascii "Mingot"
   74AF 00                 6506 	.db 0x00
   74B0                    6507 ___str_14:
   74B0 50 75 6C 73 61 20  6508 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   74BD 00                 6509 	.db 0x00
                           6510 ;src/main.c:277: void controles(){
                           6511 ;	---------------------------------
                           6512 ; Function controles
                           6513 ; ---------------------------------
   74BE                    6514 _controles::
                           6515 ;src/main.c:279: cpct_clearScreen(0);
   74BE 21 00 40      [10] 6516 	ld	hl,#0x4000
   74C1 E5            [11] 6517 	push	hl
   74C2 AF            [ 4] 6518 	xor	a, a
   74C3 F5            [11] 6519 	push	af
   74C4 33            [ 6] 6520 	inc	sp
   74C5 26 C0         [ 7] 6521 	ld	h, #0xC0
   74C7 E5            [11] 6522 	push	hl
   74C8 CD 4D 8E      [17] 6523 	call	_cpct_memset
                           6524 ;src/main.c:281: memptr = cpct_getScreenPtr(VMEM, 23, 60); 
   74CB 21 17 3C      [10] 6525 	ld	hl,#0x3C17
   74CE E5            [11] 6526 	push	hl
   74CF 21 00 C0      [10] 6527 	ld	hl,#0xC000
   74D2 E5            [11] 6528 	push	hl
   74D3 CD 40 8F      [17] 6529 	call	_cpct_getScreenPtr
                           6530 ;src/main.c:282: cpct_drawStringM0("Controles:", memptr, 1, 0); 
   74D6 EB            [ 4] 6531 	ex	de,hl
   74D7 01 6A 75      [10] 6532 	ld	bc,#___str_15+0
   74DA 21 01 00      [10] 6533 	ld	hl,#0x0001
   74DD E5            [11] 6534 	push	hl
   74DE D5            [11] 6535 	push	de
   74DF C5            [11] 6536 	push	bc
   74E0 CD 5F 8C      [17] 6537 	call	_cpct_drawStringM0
   74E3 21 06 00      [10] 6538 	ld	hl,#6
   74E6 39            [11] 6539 	add	hl,sp
   74E7 F9            [ 6] 6540 	ld	sp,hl
                           6541 ;src/main.c:284: memptr = cpct_getScreenPtr(VMEM, 11, 80); 
   74E8 21 0B 50      [10] 6542 	ld	hl,#0x500B
   74EB E5            [11] 6543 	push	hl
   74EC 21 00 C0      [10] 6544 	ld	hl,#0xC000
   74EF E5            [11] 6545 	push	hl
   74F0 CD 40 8F      [17] 6546 	call	_cpct_getScreenPtr
                           6547 ;src/main.c:285: cpct_drawStringM0("Movimiento: ", memptr, 2, 0); 
   74F3 EB            [ 4] 6548 	ex	de,hl
   74F4 01 75 75      [10] 6549 	ld	bc,#___str_16+0
   74F7 21 02 00      [10] 6550 	ld	hl,#0x0002
   74FA E5            [11] 6551 	push	hl
   74FB D5            [11] 6552 	push	de
   74FC C5            [11] 6553 	push	bc
   74FD CD 5F 8C      [17] 6554 	call	_cpct_drawStringM0
   7500 21 06 00      [10] 6555 	ld	hl,#6
   7503 39            [11] 6556 	add	hl,sp
   7504 F9            [ 6] 6557 	ld	sp,hl
                           6558 ;src/main.c:286: memptr = cpct_getScreenPtr(VMEM, 27, 95); 
   7505 21 1B 5F      [10] 6559 	ld	hl,#0x5F1B
   7508 E5            [11] 6560 	push	hl
   7509 21 00 C0      [10] 6561 	ld	hl,#0xC000
   750C E5            [11] 6562 	push	hl
   750D CD 40 8F      [17] 6563 	call	_cpct_getScreenPtr
                           6564 ;src/main.c:287: cpct_drawStringM0("Flechas", memptr, 2, 0); 
   7510 EB            [ 4] 6565 	ex	de,hl
   7511 01 82 75      [10] 6566 	ld	bc,#___str_17+0
   7514 21 02 00      [10] 6567 	ld	hl,#0x0002
   7517 E5            [11] 6568 	push	hl
   7518 D5            [11] 6569 	push	de
   7519 C5            [11] 6570 	push	bc
   751A CD 5F 8C      [17] 6571 	call	_cpct_drawStringM0
   751D 21 06 00      [10] 6572 	ld	hl,#6
   7520 39            [11] 6573 	add	hl,sp
   7521 F9            [ 6] 6574 	ld	sp,hl
                           6575 ;src/main.c:289: memptr = cpct_getScreenPtr(VMEM, 13, 115); 
   7522 21 0D 73      [10] 6576 	ld	hl,#0x730D
   7525 E5            [11] 6577 	push	hl
   7526 21 00 C0      [10] 6578 	ld	hl,#0xC000
   7529 E5            [11] 6579 	push	hl
   752A CD 40 8F      [17] 6580 	call	_cpct_getScreenPtr
                           6581 ;src/main.c:290: cpct_drawStringM0("Esc: Menu", memptr, 2, 0); 
   752D EB            [ 4] 6582 	ex	de,hl
   752E 01 8A 75      [10] 6583 	ld	bc,#___str_18+0
   7531 21 02 00      [10] 6584 	ld	hl,#0x0002
   7534 E5            [11] 6585 	push	hl
   7535 D5            [11] 6586 	push	de
   7536 C5            [11] 6587 	push	bc
   7537 CD 5F 8C      [17] 6588 	call	_cpct_drawStringM0
   753A 21 06 00      [10] 6589 	ld	hl,#6
   753D 39            [11] 6590 	add	hl,sp
   753E F9            [ 6] 6591 	ld	sp,hl
                           6592 ;src/main.c:292: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   753F 21 0C AF      [10] 6593 	ld	hl,#0xAF0C
   7542 E5            [11] 6594 	push	hl
   7543 21 00 C0      [10] 6595 	ld	hl,#0xC000
   7546 E5            [11] 6596 	push	hl
   7547 CD 40 8F      [17] 6597 	call	_cpct_getScreenPtr
                           6598 ;src/main.c:293: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   754A EB            [ 4] 6599 	ex	de,hl
   754B 01 94 75      [10] 6600 	ld	bc,#___str_19+0
   754E 21 01 00      [10] 6601 	ld	hl,#0x0001
   7551 E5            [11] 6602 	push	hl
   7552 D5            [11] 6603 	push	de
   7553 C5            [11] 6604 	push	bc
   7554 CD 5F 8C      [17] 6605 	call	_cpct_drawStringM0
   7557 21 06 00      [10] 6606 	ld	hl,#6
   755A 39            [11] 6607 	add	hl,sp
   755B F9            [ 6] 6608 	ld	sp,hl
                           6609 ;src/main.c:295: while (1){
   755C                    6610 00104$:
                           6611 ;src/main.c:296: cpct_scanKeyboard_f();
   755C CD 7E 8B      [17] 6612 	call	_cpct_scanKeyboard_f
                           6613 ;src/main.c:297: if(cpct_isKeyPressed(Key_Space)) {
   755F 21 05 80      [10] 6614 	ld	hl,#0x8005
   7562 CD 72 8B      [17] 6615 	call	_cpct_isKeyPressed
   7565 7D            [ 4] 6616 	ld	a,l
   7566 B7            [ 4] 6617 	or	a, a
   7567 28 F3         [12] 6618 	jr	Z,00104$
                           6619 ;src/main.c:299: return;
   7569 C9            [10] 6620 	ret
   756A                    6621 ___str_15:
   756A 43 6F 6E 74 72 6F  6622 	.ascii "Controles:"
        6C 65 73 3A
   7574 00                 6623 	.db 0x00
   7575                    6624 ___str_16:
   7575 4D 6F 76 69 6D 69  6625 	.ascii "Movimiento: "
        65 6E 74 6F 3A 20
   7581 00                 6626 	.db 0x00
   7582                    6627 ___str_17:
   7582 46 6C 65 63 68 61  6628 	.ascii "Flechas"
        73
   7589 00                 6629 	.db 0x00
   758A                    6630 ___str_18:
   758A 45 73 63 3A 20 4D  6631 	.ascii "Esc: Menu"
        65 6E 75
   7593 00                 6632 	.db 0x00
   7594                    6633 ___str_19:
   7594 50 75 6C 73 61 20  6634 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   75A1 00                 6635 	.db 0x00
                           6636 ;src/main.c:307: void main(void) {
                           6637 ;	---------------------------------
                           6638 ; Function main
                           6639 ; ---------------------------------
   75A2                    6640 _main::
                           6641 ;src/main.c:309: init();
   75A2 CD 08 4B      [17] 6642 	call	_init
                           6643 ;src/main.c:312: while(1){
   75A5                    6644 00107$:
                           6645 ;src/main.c:313: x=menu();
   75A5 CD AE 6E      [17] 6646 	call	_menu
   75A8 5D            [ 4] 6647 	ld	e, l
   75A9 54            [ 4] 6648 	ld	d, h
                           6649 ;src/main.c:314: switch(x){
   75AA CB 7A         [ 8] 6650 	bit	7, d
   75AC 20 F7         [12] 6651 	jr	NZ,00107$
   75AE 3E 03         [ 7] 6652 	ld	a,#0x03
   75B0 BB            [ 4] 6653 	cp	a, e
   75B1 3E 00         [ 7] 6654 	ld	a,#0x00
   75B3 9A            [ 4] 6655 	sbc	a, d
   75B4 E2 B9 75      [10] 6656 	jp	PO, 00123$
   75B7 EE 80         [ 7] 6657 	xor	a, #0x80
   75B9                    6658 00123$:
   75B9 FA A5 75      [10] 6659 	jp	M,00107$
   75BC 16 00         [ 7] 6660 	ld	d,#0x00
   75BE 21 C4 75      [10] 6661 	ld	hl,#00124$
   75C1 19            [11] 6662 	add	hl,de
   75C2 19            [11] 6663 	add	hl,de
                           6664 ;src/main.c:315: case 0: return;break;
                           6665 ;src/main.c:316: case 1: game(); break;
   75C3 E9            [ 4] 6666 	jp	(hl)
   75C4                    6667 00124$:
   75C4 18 17         [12] 6668 	jr	00109$
   75C6 18 06         [12] 6669 	jr	00102$
   75C8 18 09         [12] 6670 	jr	00103$
   75CA 18 0C         [12] 6671 	jr	00104$
   75CC 18 0F         [12] 6672 	jr	00109$
   75CE                    6673 00102$:
   75CE CD F8 70      [17] 6674 	call	_game
   75D1 18 D2         [12] 6675 	jr	00107$
                           6676 ;src/main.c:317: case 2: credits();break;
   75D3                    6677 00103$:
   75D3 CD 84 73      [17] 6678 	call	_credits
   75D6 18 CD         [12] 6679 	jr	00107$
                           6680 ;src/main.c:318: case 3: controles();break;
   75D8                    6681 00104$:
   75D8 CD BE 74      [17] 6682 	call	_controles
                           6683 ;src/main.c:319: }
   75DB 18 C8         [12] 6684 	jr	00107$
   75DD                    6685 00109$:
   75DD C9            [10] 6686 	ret
                           6687 	.area _CODE
                           6688 	.area _INITIALIZER
                           6689 	.area _CABS (ABS)
