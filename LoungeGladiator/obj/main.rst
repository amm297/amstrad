                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct 23 18:06:58 2015
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
   8FDE                      90 _scene::
   8FDE                      91 	.ds 240
   90CE                      92 _temp::
   90CE                      93 	.ds 1
   90CF                      94 _map::
   90CF                      95 	.ds 1
   90D0                      96 _path::
   90D0                      97 	.ds 1
   90D1                      98 _finish::
   90D1                      99 	.ds 1
   90D2                     100 _arrow::
   90D2                     101 	.ds 1
   90D3                     102 _following::
   90D3                     103 	.ds 1
   90D4                     104 _bound::
   90D4                     105 	.ds 1
   90D5                     106 _archer::
   90D5                     107 	.ds 1
   90D6                     108 _dead::
   90D6                     109 	.ds 1
   90D7                     110 _n::
   90D7                     111 	.ds 3
   90DA                     112 _object::
   90DA                     113 	.ds 10
   90E4                     114 _player::
   90E4                     115 	.ds 11
   90EF                     116 _enemy::
   90EF                     117 	.ds 15
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
   4B08 CD 06 8E      [17]  148 	call	_cpct_disableFirmware
                            149 ;src/init.h:15: cpct_setVideoMode(0);
   4B0B AF            [ 4]  150 	xor	a, a
   4B0C F5            [11]  151 	push	af
   4B0D 33            [ 6]  152 	inc	sp
   4B0E CD E3 8D      [17]  153 	call	_cpct_setVideoMode
   4B11 33            [ 6]  154 	inc	sp
                            155 ;src/init.h:16: cpct_fw2hw(g_palette,4);
   4B12 11 2D 4B      [10]  156 	ld	de,#_g_palette
   4B15 3E 04         [ 7]  157 	ld	a,#0x04
   4B17 F5            [11]  158 	push	af
   4B18 33            [ 6]  159 	inc	sp
   4B19 D5            [11]  160 	push	de
   4B1A CD 6D 8D      [17]  161 	call	_cpct_fw2hw
   4B1D F1            [10]  162 	pop	af
   4B1E 33            [ 6]  163 	inc	sp
                            164 ;src/init.h:17: cpct_setPalette(g_palette,4);
   4B1F 11 2D 4B      [10]  165 	ld	de,#_g_palette
   4B22 3E 04         [ 7]  166 	ld	a,#0x04
   4B24 F5            [11]  167 	push	af
   4B25 33            [ 6]  168 	inc	sp
   4B26 D5            [11]  169 	push	de
   4B27 CD F6 8A      [17]  170 	call	_cpct_setPalette
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
   4D57 32 E4 90      [13]  731 	ld	(#_player),a
                            732 ;src/init.h:23: player.y = originsp[p-1][1];
   4D5A 59            [ 4]  733 	ld	e, c
   4D5B 50            [ 4]  734 	ld	d, b
   4D5C 13            [ 6]  735 	inc	de
   4D5D 1A            [ 7]  736 	ld	a,(de)
   4D5E 32 E5 90      [13]  737 	ld	(#(_player + 0x0001)),a
                            738 ;src/init.h:24: player.lx = originsp[p-1][0];
   4D61 0A            [ 7]  739 	ld	a,(bc)
   4D62 32 E6 90      [13]  740 	ld	(#(_player + 0x0002)),a
                            741 ;src/init.h:25: player.ly = originsp[p-1][1];
   4D65 1A            [ 7]  742 	ld	a,(de)
   4D66 32 E7 90      [13]  743 	ld	(#(_player + 0x0003)),a
                            744 ;src/init.h:26: player.sprite = sprite;
   4D69 21 00 40      [10]  745 	ld	hl,#_gladis_quieto_dcha
   4D6C 22 E8 90      [16]  746 	ld	((_player + 0x0004)), hl
                            747 ;src/init.h:27: player.life = 3;
   4D6F 21 EA 90      [10]  748 	ld	hl,#_player + 6
   4D72 36 03         [10]  749 	ld	(hl),#0x03
                            750 ;src/init.h:28: player.dir = 6;
   4D74 21 EB 90      [10]  751 	ld	hl,#_player + 7
   4D77 36 06         [10]  752 	ld	(hl),#0x06
                            753 ;src/init.h:29: player.atk = 20;
   4D79 21 EC 90      [10]  754 	ld	hl,#_player + 8
   4D7C 36 14         [10]  755 	ld	(hl),#0x14
                            756 ;src/init.h:30: player.latk = 20;
   4D7E 21 ED 90      [10]  757 	ld	hl,#_player + 9
   4D81 36 14         [10]  758 	ld	(hl),#0x14
                            759 ;src/init.h:31: player.bullets = 3;
   4D83 21 EE 90      [10]  760 	ld	hl,#_player + 10
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
   4DA1 32 E4 90      [13]  783 	ld	(#_player),a
                            784 ;src/init.h:37: player.y = originsp[p-1][1];
   4DA4 59            [ 4]  785 	ld	e, c
   4DA5 50            [ 4]  786 	ld	d, b
   4DA6 13            [ 6]  787 	inc	de
   4DA7 1A            [ 7]  788 	ld	a,(de)
   4DA8 32 E5 90      [13]  789 	ld	(#(_player + 0x0001)),a
                            790 ;src/init.h:38: player.lx = originsp[p-1][0];
   4DAB 0A            [ 7]  791 	ld	a,(bc)
   4DAC 32 E6 90      [13]  792 	ld	(#(_player + 0x0002)),a
                            793 ;src/init.h:39: player.ly = originsp[p-1][1];
   4DAF 1A            [ 7]  794 	ld	a,(de)
   4DB0 32 E7 90      [13]  795 	ld	(#(_player + 0x0003)),a
                            796 ;src/init.h:40: player.sprite = sprite;
   4DB3 21 00 40      [10]  797 	ld	hl,#_gladis_quieto_dcha
   4DB6 22 E8 90      [16]  798 	ld	((_player + 0x0004)), hl
                            799 ;src/init.h:41: player.dir = 6;
   4DB9 21 EB 90      [10]  800 	ld	hl,#_player + 7
   4DBC 36 06         [10]  801 	ld	(hl),#0x06
                            802 ;src/init.h:42: player.atk = 20;
   4DBE 21 EC 90      [10]  803 	ld	hl,#_player + 8
   4DC1 36 14         [10]  804 	ld	(hl),#0x14
                            805 ;src/init.h:43: player.latk = 20;
   4DC3 21 ED 90      [10]  806 	ld	hl,#_player + 9
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
   4DE4 32 EF 90      [13]  832 	ld	(#_enemy),a
                            833 ;src/init.h:49: enemy.y = originse[p-1][1];
   4DE7 D5            [11]  834 	push	de
   4DE8 FD E1         [14]  835 	pop	iy
   4DEA FD 23         [10]  836 	inc	iy
   4DEC FD 7E 00      [19]  837 	ld	a, 0 (iy)
   4DEF 32 F0 90      [13]  838 	ld	(#(_enemy + 0x0001)),a
                            839 ;src/init.h:50: enemy.lx = originse[p-1][0];
   4DF2 1A            [ 7]  840 	ld	a,(de)
   4DF3 32 F1 90      [13]  841 	ld	(#(_enemy + 0x0002)),a
                            842 ;src/init.h:51: enemy.ly = originse[p-1][1];
   4DF6 FD 7E 00      [19]  843 	ld	a, 0 (iy)
   4DF9 32 F2 90      [13]  844 	ld	(#(_enemy + 0x0003)),a
                            845 ;src/init.h:52: enemy.ox = originse[p-1][2];
   4DFC 6B            [ 4]  846 	ld	l, e
   4DFD 62            [ 4]  847 	ld	h, d
   4DFE 23            [ 6]  848 	inc	hl
   4DFF 23            [ 6]  849 	inc	hl
   4E00 7E            [ 7]  850 	ld	a,(hl)
   4E01 32 F3 90      [13]  851 	ld	(#(_enemy + 0x0004)),a
                            852 ;src/init.h:53: enemy.oy = originse[p-1][3];
   4E04 D5            [11]  853 	push	de
   4E05 FD E1         [14]  854 	pop	iy
   4E07 FD 7E 03      [19]  855 	ld	a,3 (iy)
   4E0A 32 F4 90      [13]  856 	ld	(#(_enemy + 0x0005)),a
                            857 ;src/init.h:54: enemy.sprite = sprite;
   4E0D 21 80 44      [10]  858 	ld	hl,#_chacho_dcha
   4E10 22 F5 90      [16]  859 	ld	((_enemy + 0x0006)), hl
                            860 ;src/init.h:55: enemy.life = 1;//p;
   4E13 21 F7 90      [10]  861 	ld	hl,#_enemy + 8
   4E16 36 01         [10]  862 	ld	(hl),#0x01
                            863 ;src/init.h:56: enemy.dir = 6;
   4E18 21 F8 90      [10]  864 	ld	hl,#_enemy + 9
   4E1B 36 06         [10]  865 	ld	(hl),#0x06
                            866 ;src/init.h:57: enemy.room = 3;
   4E1D 21 F9 90      [10]  867 	ld	hl,#_enemy + 10
   4E20 36 03         [10]  868 	ld	(hl),#0x03
                            869 ;src/init.h:58: enemy.lp = 75 - ((p-1)*5);
   4E22 69            [ 4]  870 	ld	l,c
   4E23 29            [11]  871 	add	hl, hl
   4E24 29            [11]  872 	add	hl, hl
   4E25 09            [11]  873 	add	hl, bc
   4E26 3E 4B         [ 7]  874 	ld	a,#0x4B
   4E28 95            [ 4]  875 	sub	a, l
   4E29 32 FD 90      [13]  876 	ld	(#(_enemy + 0x000e)),a
   4E2C DD E1         [14]  877 	pop	ix
   4E2E C9            [10]  878 	ret
                            879 ;src/init.h:61: void initNivel(){
                            880 ;	---------------------------------
                            881 ; Function initNivel
                            882 ; ---------------------------------
   4E2F                     883 _initNivel::
                            884 ;src/init.h:62: n.num=0;
   4E2F 21 D7 90      [10]  885 	ld	hl,#_n+0
   4E32 36 00         [10]  886 	ld	(hl),#0x00
                            887 ;src/init.h:63: n.corazon=0;
   4E34 21 D8 90      [10]  888 	ld	hl,#_n + 1
   4E37 36 00         [10]  889 	ld	(hl),#0x00
                            890 ;src/init.h:64: n.bullet=0;
   4E39 21 D9 90      [10]  891 	ld	hl,#_n + 2
   4E3C 36 00         [10]  892 	ld	(hl),#0x00
   4E3E C9            [10]  893 	ret
                            894 ;src/init.h:67: void initVariables(u8 m){
                            895 ;	---------------------------------
                            896 ; Function initVariables
                            897 ; ---------------------------------
   4E3F                     898 _initVariables::
                            899 ;src/init.h:68: bound =0;
   4E3F 21 D4 90      [10]  900 	ld	hl,#_bound + 0
   4E42 36 00         [10]  901 	ld	(hl), #0x00
                            902 ;src/init.h:69: temp = 0;
   4E44 21 CE 90      [10]  903 	ld	hl,#_temp + 0
   4E47 36 00         [10]  904 	ld	(hl), #0x00
                            905 ;src/init.h:70: map = m;
   4E49 21 02 00      [10]  906 	ld	hl, #2+0
   4E4C 39            [11]  907 	add	hl, sp
   4E4D 7E            [ 7]  908 	ld	a, (hl)
   4E4E 32 CF 90      [13]  909 	ld	(#_map + 0),a
                            910 ;src/init.h:71: arrow =0;
   4E51 21 D2 90      [10]  911 	ld	hl,#_arrow + 0
   4E54 36 00         [10]  912 	ld	(hl), #0x00
                            913 ;src/init.h:72: finish =0;
   4E56 21 D1 90      [10]  914 	ld	hl,#_finish + 0
   4E59 36 00         [10]  915 	ld	(hl), #0x00
                            916 ;src/init.h:73: following =0;
   4E5B 21 D3 90      [10]  917 	ld	hl,#_following + 0
   4E5E 36 00         [10]  918 	ld	(hl), #0x00
                            919 ;src/init.h:74: archer = 0;
   4E60 21 D5 90      [10]  920 	ld	hl,#_archer + 0
   4E63 36 00         [10]  921 	ld	(hl), #0x00
                            922 ;src/init.h:75: dead =0;
   4E65 21 D6 90      [10]  923 	ld	hl,#_dead + 0
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
   4E75 CD F5 8D      [17]  939 	call	_cpct_memset
                            940 ;src/draws.h:15: memptr = cpct_getScreenPtr(VMEM,10,10);
   4E78 21 0A 0A      [10]  941 	ld	hl,#0x0A0A
   4E7B E5            [11]  942 	push	hl
   4E7C 21 00 C0      [10]  943 	ld	hl,#0xC000
   4E7F E5            [11]  944 	push	hl
   4E80 CD E8 8E      [17]  945 	call	_cpct_getScreenPtr
                            946 ;src/draws.h:16: cpct_drawStringM0("Congratulations",memptr,1,0);
   4E83 EB            [ 4]  947 	ex	de,hl
   4E84 01 D8 4E      [10]  948 	ld	bc,#___str_0+0
   4E87 21 01 00      [10]  949 	ld	hl,#0x0001
   4E8A E5            [11]  950 	push	hl
   4E8B D5            [11]  951 	push	de
   4E8C C5            [11]  952 	push	bc
   4E8D CD 07 8C      [17]  953 	call	_cpct_drawStringM0
   4E90 21 06 00      [10]  954 	ld	hl,#6
   4E93 39            [11]  955 	add	hl,sp
   4E94 F9            [ 6]  956 	ld	sp,hl
                            957 ;src/draws.h:18: memptr = cpct_getScreenPtr(VMEM,29,82);
   4E95 21 1D 52      [10]  958 	ld	hl,#0x521D
   4E98 E5            [11]  959 	push	hl
   4E99 21 00 C0      [10]  960 	ld	hl,#0xC000
   4E9C E5            [11]  961 	push	hl
   4E9D CD E8 8E      [17]  962 	call	_cpct_getScreenPtr
                            963 ;src/draws.h:19: cpct_drawSprite(cup,memptr,22,44);
   4EA0 EB            [ 4]  964 	ex	de,hl
   4EA1 01 80 46      [10]  965 	ld	bc,#_cup+0
   4EA4 21 16 2C      [10]  966 	ld	hl,#0x2C16
   4EA7 E5            [11]  967 	push	hl
   4EA8 D5            [11]  968 	push	de
   4EA9 C5            [11]  969 	push	bc
   4EAA CD 2B 8C      [17]  970 	call	_cpct_drawSprite
                            971 ;src/draws.h:22: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   4EAD 21 0C AF      [10]  972 	ld	hl,#0xAF0C
   4EB0 E5            [11]  973 	push	hl
   4EB1 21 00 C0      [10]  974 	ld	hl,#0xC000
   4EB4 E5            [11]  975 	push	hl
   4EB5 CD E8 8E      [17]  976 	call	_cpct_getScreenPtr
                            977 ;src/draws.h:23: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   4EB8 EB            [ 4]  978 	ex	de,hl
   4EB9 01 E8 4E      [10]  979 	ld	bc,#___str_1+0
   4EBC 21 01 00      [10]  980 	ld	hl,#0x0001
   4EBF E5            [11]  981 	push	hl
   4EC0 D5            [11]  982 	push	de
   4EC1 C5            [11]  983 	push	bc
   4EC2 CD 07 8C      [17]  984 	call	_cpct_drawStringM0
   4EC5 21 06 00      [10]  985 	ld	hl,#6
   4EC8 39            [11]  986 	add	hl,sp
   4EC9 F9            [ 6]  987 	ld	sp,hl
                            988 ;src/draws.h:25: while(1){
   4ECA                     989 00104$:
                            990 ;src/draws.h:26: cpct_scanKeyboard_f();
   4ECA CD 26 8B      [17]  991 	call	_cpct_scanKeyboard_f
                            992 ;src/draws.h:27: if(cpct_isKeyPressed(Key_Space)) return;
   4ECD 21 05 80      [10]  993 	ld	hl,#0x8005
   4ED0 CD 1A 8B      [17]  994 	call	_cpct_isKeyPressed
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
   4EFB 21 DE 8F      [10] 1015 	ld	hl,#_scene
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
   4F6A 3E DE         [ 7] 1087 	ld	a,#<(_scene)
   4F6C DD 86 FC      [19] 1088 	add	a, -4 (ix)
   4F6F DD 77 FA      [19] 1089 	ld	-6 (ix),a
   4F72 3E 8F         [ 7] 1090 	ld	a,#>(_scene)
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
   4FF1 3E DE         [ 7] 1146 	ld	a,#<(_scene)
   4FF3 DD 86 F6      [19] 1147 	add	a, -10 (ix)
   4FF6 DD 77 F8      [19] 1148 	ld	-8 (ix),a
   4FF9 3E 8F         [ 7] 1149 	ld	a,#>(_scene)
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
   507A 21 DE 8F      [10] 1206 	ld	hl,#_scene
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
   50E8 3E DE         [ 7] 1265 	ld	a,#<(_scene)
   50EA 85            [ 4] 1266 	add	a, l
   50EB 4F            [ 4] 1267 	ld	c,a
   50EC 3E 8F         [ 7] 1268 	ld	a,#>(_scene)
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
   511D 21 DE 8F      [10] 1302 	ld	hl,#_scene
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
   518B 3E DE         [ 7] 1361 	ld	a,#<(_scene)
   518D 85            [ 4] 1362 	add	a, l
   518E 5F            [ 4] 1363 	ld	e,a
   518F 3E 8F         [ 7] 1364 	ld	a,#>(_scene)
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
   51F1 21 DE 8F      [10] 1429 	ld	hl,#_scene
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
   5210 CD E8 8E      [17] 1447 	call	_cpct_getScreenPtr
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
   5242 21 86 75      [10] 1480 	ld	hl,#_muro
   5245 E5            [11] 1481 	push	hl
   5246 CD 2B 8C      [17] 1482 	call	_cpct_drawSprite
   5249 D1            [10] 1483 	pop	de
   524A C1            [10] 1484 	pop	bc
   524B                    1485 00102$:
                           1486 ;src/draws.h:98: if(scene[posY][posX] == 9){
   524B 3E DE         [ 7] 1487 	ld	a,#<(_scene)
   524D DD 86 FC      [19] 1488 	add	a, -4 (ix)
   5250 6F            [ 4] 1489 	ld	l,a
   5251 3E 8F         [ 7] 1490 	ld	a,#>(_scene)
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
   5277 CD 2B 8C      [17] 1515 	call	_cpct_drawSprite
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
   5290 CD 2B 8C      [17] 1532 	call	_cpct_drawSprite
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
   52D9 CD E8 8E      [17] 1580 	call	_cpct_getScreenPtr
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
   52F3 CD 91 8D      [17] 1598 	call	_cpct_drawSpriteMasked
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
   5309 CD 17 8E      [17] 1615 	call	_cpct_drawSolidBox
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
   531B CD 91 8D      [17] 1628 	call	_cpct_drawSpriteMasked
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
   5346 CD E8 8E      [17] 1663 	call	_cpct_getScreenPtr
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
   535C 21 C6 75      [10] 1678 	ld	hl,#_flecha_arriba
   535F E5            [11] 1679 	push	hl
   5360 CD 91 8D      [17] 1680 	call	_cpct_drawSpriteMasked
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
   536F CD 17 8E      [17] 1692 	call	_cpct_drawSolidBox
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
   5396 CD E8 8E      [17] 1724 	call	_cpct_getScreenPtr
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
   53CC CD 91 8D      [17] 1760 	call	_cpct_drawSpriteMasked
                           1761 ;src/draws.h:151: break;
   53CF C9            [10] 1762 	ret
                           1763 ;src/draws.h:152: case 1:
   53D0                    1764 00102$:
                           1765 ;src/draws.h:153: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   53D0 21 02 08      [10] 1766 	ld	hl,#0x0802
   53D3 E5            [11] 1767 	push	hl
   53D4 D5            [11] 1768 	push	de
   53D5 C5            [11] 1769 	push	bc
   53D6 CD 91 8D      [17] 1770 	call	_cpct_drawSpriteMasked
                           1771 ;src/draws.h:154: break;
   53D9 C9            [10] 1772 	ret
                           1773 ;src/draws.h:155: case 2:
   53DA                    1774 00103$:
                           1775 ;src/draws.h:156: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   53DA 21 04 04      [10] 1776 	ld	hl,#0x0404
   53DD E5            [11] 1777 	push	hl
   53DE D5            [11] 1778 	push	de
   53DF C5            [11] 1779 	push	bc
   53E0 CD 91 8D      [17] 1780 	call	_cpct_drawSpriteMasked
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
   53F6 CD E8 8E      [17] 1801 	call	_cpct_getScreenPtr
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
   5420 CD 17 8E      [17] 1831 	call	_cpct_drawSolidBox
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
   542F CD 17 8E      [17] 1846 	call	_cpct_drawSolidBox
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
   543E CD 17 8E      [17] 1861 	call	_cpct_drawSolidBox
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
   5445 21 EA 90      [10] 1873 	ld	hl, #_player + 6
   5448 56            [ 7] 1874 	ld	d,(hl)
   5449 21 01 03      [10] 1875 	ld	hl,#0x0301
   544C E5            [11] 1876 	push	hl
   544D D5            [11] 1877 	push	de
   544E 33            [ 6] 1878 	inc	sp
   544F CD C1 52      [17] 1879 	call	_drawVida
   5452 F1            [10] 1880 	pop	af
   5453 33            [ 6] 1881 	inc	sp
                           1882 ;src/draws.h:181: drawBullets(player.bullets,16);
   5454 21 EE 90      [10] 1883 	ld	hl, #_player + 10
   5457 56            [ 7] 1884 	ld	d,(hl)
   5458 3E 10         [ 7] 1885 	ld	a,#0x10
   545A F5            [11] 1886 	push	af
   545B 33            [ 6] 1887 	inc	sp
   545C D5            [11] 1888 	push	de
   545D 33            [ 6] 1889 	inc	sp
   545E CD 28 53      [17] 1890 	call	_drawBullets
   5461 F1            [10] 1891 	pop	af
                           1892 ;src/draws.h:182: drawVida(enemy.life,enemy.lp,map);
   5462 21 FD 90      [10] 1893 	ld	hl, #_enemy + 14
   5465 56            [ 7] 1894 	ld	d,(hl)
   5466 21 F7 90      [10] 1895 	ld	hl, #_enemy + 8
   5469 46            [ 7] 1896 	ld	b,(hl)
   546A 3A CF 90      [13] 1897 	ld	a,(_map)
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
   5482 FD 21 CE 90   [14] 1918 	ld	iy,#_temp
   5486 FD CB 00 46   [20] 1919 	bit	0, 0 (iy)
   548A 20 17         [12] 1920 	jr	NZ,00102$
                           1921 ;src/draws.h:190: draw(player.x,player.y,player.sprite,0);
   548C ED 5B E8 90   [20] 1922 	ld	de, (#_player + 4)
   5490 21 E5 90      [10] 1923 	ld	hl, #_player + 1
   5493 46            [ 7] 1924 	ld	b,(hl)
   5494 21 E4 90      [10] 1925 	ld	hl, #_player + 0
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
   54A3 11 EF 90      [10] 1938 	ld	de,#_enemy+0
   54A6 3A F7 90      [13] 1939 	ld	a, (#_enemy + 8)
   54A9 B7            [ 4] 1940 	or	a, a
   54AA 28 23         [12] 1941 	jr	Z,00104$
   54AC 3A CE 90      [13] 1942 	ld	a,(#_temp + 0)
   54AF E6 01         [ 7] 1943 	and	a, #0x01
   54B1 3D            [ 4] 1944 	dec	a
   54B2 20 1B         [12] 1945 	jr	NZ,00104$
                           1946 ;src/draws.h:192: draw(enemy.x,enemy.y,enemy.sprite,0);
   54B4 ED 4B F5 90   [20] 1947 	ld	bc, (#_enemy + 6)
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
   54CF 3A D2 90      [13] 1967 	ld	a,(#_arrow + 0)
   54D2 3D            [ 4] 1968 	dec	a
   54D3 20 5C         [12] 1969 	jr	NZ,00116$
                           1970 ;src/draws.h:194: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   54D5 21 E1 90      [10] 1971 	ld	hl, #_object + 7
   54D8 5E            [ 7] 1972 	ld	e,(hl)
                           1973 ;src/draws.h:195: draw(object.x,object.y,object.sprite,2);
   54D9 01 DB 90      [10] 1974 	ld	bc,#_object + 1
                           1975 ;src/draws.h:194: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   54DC 7B            [ 4] 1976 	ld	a,e
   54DD D6 04         [ 7] 1977 	sub	a, #0x04
   54DF 28 0C         [12] 1978 	jr	Z,00110$
   54E1 21 E0 90      [10] 1979 	ld	hl,#_object + 6
   54E4 7B            [ 4] 1980 	ld	a,e
   54E5 D6 06         [ 7] 1981 	sub	a, #0x06
   54E7 20 25         [12] 1982 	jr	NZ,00111$
   54E9 7E            [ 7] 1983 	ld	a,(hl)
   54EA 3D            [ 4] 1984 	dec	a
   54EB 20 21         [12] 1985 	jr	NZ,00111$
   54ED                    1986 00110$:
                           1987 ;src/draws.h:195: draw(object.x,object.y,object.sprite,2);
   54ED ED 5B DE 90   [20] 1988 	ld	de, (#(_object + 0x0004) + 0)
   54F1 0A            [ 7] 1989 	ld	a,(bc)
   54F2 DD 77 FF      [19] 1990 	ld	-1 (ix),a
   54F5 21 DA 90      [10] 1991 	ld	hl, #_object + 0
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
   551B ED 5B DE 90   [20] 2020 	ld	de, (#(_object + 0x0004) + 0)
   551F 0A            [ 7] 2021 	ld	a,(bc)
   5520 47            [ 4] 2022 	ld	b,a
   5521 21 DA 90      [10] 2023 	ld	hl, #_object + 0
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
   5538 FD 21 CE 90   [14] 2046 	ld	iy,#_temp
   553C FD CB 00 46   [20] 2047 	bit	0, 0 (iy)
   5540 20 14         [12] 2048 	jr	NZ,00102$
                           2049 ;src/draws.h:205: erase(player.lx,player.ly,0);
   5542 21 E7 90      [10] 2050 	ld	hl, #_player + 3
   5545 56            [ 7] 2051 	ld	d,(hl)
   5546 21 E6 90      [10] 2052 	ld	hl, #_player + 2
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
   5556 3A CE 90      [13] 2066 	ld	a,(#_temp + 0)
   5559 E6 01         [ 7] 2067 	and	a, #0x01
   555B 3D            [ 4] 2068 	dec	a
   555C 20 1A         [12] 2069 	jr	NZ,00104$
   555E 3A F7 90      [13] 2070 	ld	a, (#_enemy + 8)
   5561 B7            [ 4] 2071 	or	a, a
   5562 28 14         [12] 2072 	jr	Z,00104$
                           2073 ;src/draws.h:207: erase(enemy.lx,enemy.ly,0);
   5564 21 F2 90      [10] 2074 	ld	hl, #_enemy + 3
   5567 56            [ 7] 2075 	ld	d,(hl)
   5568 21 F1 90      [10] 2076 	ld	hl, #_enemy + 2
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
   5578 3A D2 90      [13] 2090 	ld	a,(#_arrow + 0)
   557B 3D            [ 4] 2091 	dec	a
   557C C0            [11] 2092 	ret	NZ
                           2093 ;src/draws.h:209: if(object.dir == 4 || object.dir == 6)
   557D 21 E1 90      [10] 2094 	ld	hl, #_object + 7
   5580 5E            [ 7] 2095 	ld	e,(hl)
                           2096 ;src/draws.h:210: erase(object.lx,object.ly,2);
   5581 21 DD 90      [10] 2097 	ld	hl, #_object + 3
   5584 56            [ 7] 2098 	ld	d,(hl)
   5585 21 DC 90      [10] 2099 	ld	hl, #_object + 2
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
   55AE 3A D4 90      [13] 2134 	ld	a,(#_bound + 0)
   55B1 3D            [ 4] 2135 	dec	a
   55B2 C0            [11] 2136 	ret	NZ
   55B3 21 D2 90      [10] 2137 	ld	hl,#_arrow + 0
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
   55F7 CD E8 8E      [17] 2181 	call	_cpct_getScreenPtr
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
   561D CD 17 8E      [17] 2209 	call	_cpct_drawSolidBox
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
   562E CD 91 8D      [17] 2223 	call	_cpct_drawSpriteMasked
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
   563C CD 91 8D      [17] 2234 	call	_cpct_drawSpriteMasked
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
   5653 CD E8 8E      [17] 2250 	call	_cpct_getScreenPtr
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
   5679 CD 17 8E      [17] 2278 	call	_cpct_drawSolidBox
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
   568A CD 91 8D      [17] 2292 	call	_cpct_drawSpriteMasked
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
   5698 CD 91 8D      [17] 2303 	call	_cpct_drawSpriteMasked
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
   56A8 CD E8 8E      [17] 2315 	call	_cpct_getScreenPtr
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
   56C6 CD 17 8E      [17] 2336 	call	_cpct_drawSolidBox
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
   56D7 CD 91 8D      [17] 2350 	call	_cpct_drawSpriteMasked
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
   56EA 21 CF 90      [10] 2366 	ld	hl,#_map + 0
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
   5709 CD E8 8E      [17] 2388 	call	_cpct_getScreenPtr
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
   571E CD 91 8D      [17] 2403 	call	_cpct_drawSpriteMasked
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
   572D CD 17 8E      [17] 2415 	call	_cpct_drawSolidBox
   5730 F1            [10] 2416 	pop	af
   5731 F1            [10] 2417 	pop	af
   5732 33            [ 6] 2418 	inc	sp
   5733 C1            [10] 2419 	pop	bc
   5734                    2420 00103$:
                           2421 ;src/draws.h:272: memptr = cpct_getScreenPtr(VMEM, originsu[map-1][2],originsu[map-1][3]);
   5734 21 CF 90      [10] 2422 	ld	hl,#_map + 0
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
   574E CD E8 8E      [17] 2443 	call	_cpct_getScreenPtr
                           2444 ;src/draws.h:268: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   5751 EB            [ 4] 2445 	ex	de,hl
                           2446 ;src/draws.h:273: if(bullet == 0)
   5752 DD 7E 05      [19] 2447 	ld	a,5 (ix)
   5755 B7            [ 4] 2448 	or	a, a
   5756 20 0E         [12] 2449 	jr	NZ,00105$
                           2450 ;src/draws.h:274: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   5758 01 C6 75      [10] 2451 	ld	bc,#_flecha_arriba
   575B 21 02 08      [10] 2452 	ld	hl,#0x0802
   575E E5            [11] 2453 	push	hl
   575F D5            [11] 2454 	push	de
   5760 C5            [11] 2455 	push	bc
   5761 CD 91 8D      [17] 2456 	call	_cpct_drawSpriteMasked
   5764 18 0E         [12] 2457 	jr	00107$
   5766                    2458 00105$:
                           2459 ;src/draws.h:276: cpct_drawSolidBox(memptr, 0, 2, 8);
   5766 21 02 08      [10] 2460 	ld	hl,#0x0802
   5769 E5            [11] 2461 	push	hl
   576A AF            [ 4] 2462 	xor	a, a
   576B F5            [11] 2463 	push	af
   576C 33            [ 6] 2464 	inc	sp
   576D D5            [11] 2465 	push	de
   576E CD 17 8E      [17] 2466 	call	_cpct_drawSolidBox
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
   577F 11 DE 8F      [10] 2482 	ld	de,#_scene+0
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
   57A7 CD 90 8B      [17] 2516 	call	_rand
   57AA 01 04 00      [10] 2517 	ld	bc,#0x0004
   57AD C5            [11] 2518 	push	bc
   57AE E5            [11] 2519 	push	hl
   57AF CD DC 8E      [17] 2520 	call	__modsint
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
   5805 21 EF 90      [10] 2587 	ld	hl,#_enemy+0
   5808 34            [11] 2588 	inc	(hl)
   5809 C9            [10] 2589 	ret
                           2590 ;src/ia.h:33: case 4: enemy.x -= 1; break;
   580A                    2591 00102$:
   580A 11 EF 90      [10] 2592 	ld	de,#_enemy+0
   580D 1A            [ 7] 2593 	ld	a,(de)
   580E C6 FF         [ 7] 2594 	add	a,#0xFF
   5810 12            [ 7] 2595 	ld	(de),a
   5811 C9            [10] 2596 	ret
                           2597 ;src/ia.h:34: case 8: enemy.y -= 2; break;
   5812                    2598 00103$:
   5812 11 F0 90      [10] 2599 	ld	de,#_enemy+1
   5815 1A            [ 7] 2600 	ld	a,(de)
   5816 C6 FE         [ 7] 2601 	add	a,#0xFE
   5818 12            [ 7] 2602 	ld	(de),a
   5819 C9            [10] 2603 	ret
                           2604 ;src/ia.h:35: case 2: enemy.y += 2; break;
   581A                    2605 00104$:
   581A 21 F0 90      [10] 2606 	ld	hl,#_enemy+1
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
   582F 21 E5 90      [10] 2624 	ld	hl, #(_player + 0x0001) + 0
   5832 56            [ 7] 2625 	ld	d,(hl)
   5833 3A E4 90      [13] 2626 	ld	a, (#_player + 0)
   5836 D5            [11] 2627 	push	de
   5837 33            [ 6] 2628 	inc	sp
   5838 F5            [11] 2629 	push	af
   5839 33            [ 6] 2630 	inc	sp
   583A CD 77 57      [17] 2631 	call	_detectPlayerRoom
   583D F1            [10] 2632 	pop	af
   583E DD 75 E3      [19] 2633 	ld	-29 (ix),l
   5841 21 F9 90      [10] 2634 	ld	hl, #_enemy + 10
   5844 DD 7E E3      [19] 2635 	ld	a,-29 (ix)
   5847 96            [ 7] 2636 	sub	a,(hl)
   5848 28 0E         [12] 2637 	jr	Z,00102$
                           2638 ;src/ia.h:43: auxX = enemy.seenX;
   584A 3A FA 90      [13] 2639 	ld	a,(#_enemy + 11)
   584D DD 77 E2      [19] 2640 	ld	-30 (ix),a
                           2641 ;src/ia.h:44: auxY = enemy.seenY;
   5850 3A FB 90      [13] 2642 	ld	a,(#_enemy + 12)
   5853 DD 77 E1      [19] 2643 	ld	-31 (ix),a
   5856 18 0C         [12] 2644 	jr	00103$
   5858                    2645 00102$:
                           2646 ;src/ia.h:46: auxX = player.x;
   5858 3A E4 90      [13] 2647 	ld	a,(#_player + 0)
   585B DD 77 E2      [19] 2648 	ld	-30 (ix),a
                           2649 ;src/ia.h:47: auxY = player.y;
   585E 3A E5 90      [13] 2650 	ld	a,(#(_player + 0x0001) + 0)
   5861 DD 77 E1      [19] 2651 	ld	-31 (ix),a
   5864                    2652 00103$:
                           2653 ;src/ia.h:49: if(auxX < enemy.x){
   5864 3A EF 90      [13] 2654 	ld	a,(#_enemy + 0)
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
   588B 3A F0 90      [13] 2672 	ld	a,(#(_enemy + 0x0001) + 0)
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
   594B C6 DE         [ 7] 2763 	add	a, #<(_scene)
   594D DD 77 F0      [19] 2764 	ld	-16 (ix),a
   5950 DD 7E F7      [19] 2765 	ld	a,-9 (ix)
   5953 CE 8F         [ 7] 2766 	adc	a, #>(_scene)
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
   59F4 3E DE         [ 7] 2827 	ld	a,#<(_scene)
   59F6 DD 86 EE      [19] 2828 	add	a, -18 (ix)
   59F9 DD 77 EE      [19] 2829 	ld	-18 (ix),a
   59FC 3E 8F         [ 7] 2830 	ld	a,#>(_scene)
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
   5A52 21 EF 90      [10] 2863 	ld	hl,#_enemy
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
   5AB1 3E DE         [ 7] 2903 	ld	a,#<(_scene)
   5AB3 DD 86 EE      [19] 2904 	add	a, -18 (ix)
   5AB6 DD 77 EE      [19] 2905 	ld	-18 (ix),a
   5AB9 3E 8F         [ 7] 2906 	ld	a,#>(_scene)
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
   5ADD 21 F0 90      [10] 2921 	ld	hl,#(_enemy + 0x0001)
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
   5B38 3E DE         [ 7] 2958 	ld	a,#<(_scene)
   5B3A DD 86 EE      [19] 2959 	add	a, -18 (ix)
   5B3D DD 77 EE      [19] 2960 	ld	-18 (ix),a
   5B40 3E 8F         [ 7] 2961 	ld	a,#>(_scene)
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
   5B64 21 F0 90      [10] 2976 	ld	hl,#(_enemy + 0x0001)
   5B67 DD 7E EC      [19] 2977 	ld	a,-20 (ix)
   5B6A 77            [ 7] 2978 	ld	(hl),a
   5B6B C3 93 5E      [10] 2979 	jp	00139$
   5B6E                    2980 00137$:
                           2981 ;src/ia.h:60: }else if(auxX > enemy.x){
   5B6E DD 7E E3      [19] 2982 	ld	a,-29 (ix)
   5B71 DD 96 E2      [19] 2983 	sub	a, -30 (ix)
   5B74 D2 7C 5D      [10] 2984 	jp	NC,00134$
                           2985 ;src/ia.h:61: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
   5B77 3E DE         [ 7] 2986 	ld	a,#<(_scene)
   5B79 DD 86 F6      [19] 2987 	add	a, -10 (ix)
   5B7C DD 77 EE      [19] 2988 	ld	-18 (ix),a
   5B7F 3E 8F         [ 7] 2989 	ld	a,#>(_scene)
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
   5C39 3E DE         [ 7] 3064 	ld	a,#<(_scene)
   5C3B DD 86 F6      [19] 3065 	add	a, -10 (ix)
   5C3E DD 77 F6      [19] 3066 	ld	-10 (ix),a
   5C41 3E 8F         [ 7] 3067 	ld	a,#>(_scene)
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
   5C8E 32 EF 90      [13] 3097 	ld	(#_enemy),a
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
   5CE8 21 F0 90      [10] 3134 	ld	hl,#(_enemy + 0x0001)
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
   5D43 3E DE         [ 7] 3171 	ld	a,#<(_scene)
   5D45 DD 86 EE      [19] 3172 	add	a, -18 (ix)
   5D48 DD 77 EE      [19] 3173 	ld	-18 (ix),a
   5D4B 3E 8F         [ 7] 3174 	ld	a,#>(_scene)
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
   5D72 21 F0 90      [10] 3190 	ld	hl,#(_enemy + 0x0001)
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
   5DD4 3E DE         [ 7] 3231 	ld	a,#<(_scene)
   5DD6 DD 86 EE      [19] 3232 	add	a, -18 (ix)
   5DD9 DD 77 EE      [19] 3233 	ld	-18 (ix),a
   5DDC 3E 8F         [ 7] 3234 	ld	a,#>(_scene)
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
   5E03 21 F0 90      [10] 3250 	ld	hl,#(_enemy + 0x0001)
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
   5E5E 3E DE         [ 7] 3287 	ld	a,#<(_scene)
   5E60 DD 86 EE      [19] 3288 	add	a, -18 (ix)
   5E63 DD 77 EE      [19] 3289 	ld	-18 (ix),a
   5E66 3E 8F         [ 7] 3290 	ld	a,#>(_scene)
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
   5E8C 21 F0 90      [10] 3306 	ld	hl,#(_enemy + 0x0001)
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
   5EA5 3A F8 90      [13] 3325 	ld	a, (#(_enemy + 0x0009) + 0)
   5EA8 F5            [11] 3326 	push	af
   5EA9 33            [ 6] 3327 	inc	sp
   5EAA CD E2 57      [17] 3328 	call	_movement
   5EAD 33            [ 6] 3329 	inc	sp
                           3330 ;src/ia.h:86: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   5EAE 3A F0 90      [13] 3331 	ld	a,(#_enemy + 1)
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
   5EC4 3E DE         [ 7] 3347 	ld	a,#<(_scene)
   5EC6 85            [ 4] 3348 	add	a, l
   5EC7 DD 77 F4      [19] 3349 	ld	-12 (ix),a
   5ECA 3E 8F         [ 7] 3350 	ld	a,#>(_scene)
   5ECC 8C            [ 4] 3351 	adc	a, h
   5ECD DD 77 F5      [19] 3352 	ld	-11 (ix),a
   5ED0 3A EF 90      [13] 3353 	ld	a,(#_enemy + 0)
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
   5EEA 3A F9 90      [13] 3365 	ld	a,(#_enemy + 10)
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
   5F90 11 DE 8F      [10] 3451 	ld	de,#_scene
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
   5FBF 3E DE         [ 7] 3481 	ld	a,#<(_scene)
   5FC1 85            [ 4] 3482 	add	a, l
   5FC2 DD 77 FE      [19] 3483 	ld	-2 (ix),a
   5FC5 3E 8F         [ 7] 3484 	ld	a,#>(_scene)
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
   5FF2 3A F8 90      [13] 3507 	ld	a,(#(_enemy + 0x0009) + 0)
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
   6034 FD 21 CE 90   [14] 3567 	ld	iy,#_temp
   6038 FD 96 00      [19] 3568 	sub	a, 0 (iy)
   603B 30 45         [12] 3569 	jr	NC,00117$
                           3570 ;src/ia.h:111: following = detectPlayerRoom(player.x,player.y);
   603D 3A E5 90      [13] 3571 	ld	a, (#_player + 1)
   6040 21 E4 90      [10] 3572 	ld	hl, #_player + 0
   6043 56            [ 7] 3573 	ld	d,(hl)
   6044 F5            [11] 3574 	push	af
   6045 33            [ 6] 3575 	inc	sp
   6046 D5            [11] 3576 	push	de
   6047 33            [ 6] 3577 	inc	sp
   6048 CD 77 57      [17] 3578 	call	_detectPlayerRoom
   604B F1            [10] 3579 	pop	af
   604C FD 21 D3 90   [14] 3580 	ld	iy,#_following
   6050 FD 75 00      [19] 3581 	ld	0 (iy),l
                           3582 ;src/ia.h:112: if(following == enemy.room || enemy.pursue != 0){
   6053 21 F9 90      [10] 3583 	ld	hl, #_enemy + 10
   6056 56            [ 7] 3584 	ld	d,(hl)
   6057 01 FC 90      [10] 3585 	ld	bc,#_enemy + 13
   605A 0A            [ 7] 3586 	ld	a,(bc)
   605B 5F            [ 4] 3587 	ld	e,a
   605C 3A D3 90      [13] 3588 	ld	a,(#_following + 0)
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
   607D 32 F8 90      [13] 3617 	ld	(#(_enemy + 0x0009)),a
   6080 18 2C         [12] 3618 	jr	00118$
   6082                    3619 00117$:
                           3620 ;src/ia.h:121: if(enemy.pursue >= 1){
   6082 3A FC 90      [13] 3621 	ld	a,(#(_enemy + 0x000d) + 0)
   6085 D6 01         [ 7] 3622 	sub	a, #0x01
   6087 38 22         [12] 3623 	jr	C,00114$
                           3624 ;src/ia.h:122: followPlayer();
   6089 CD 22 58      [17] 3625 	call	_followPlayer
                           3626 ;src/ia.h:123: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   608C 21 FA 90      [10] 3627 	ld	hl, #_enemy + 11
   608F 56            [ 7] 3628 	ld	d,(hl)
   6090 21 EF 90      [10] 3629 	ld	hl, #_enemy + 0
   6093 5E            [ 7] 3630 	ld	e,(hl)
   6094 7A            [ 4] 3631 	ld	a,d
   6095 93            [ 4] 3632 	sub	a, e
   6096 20 16         [12] 3633 	jr	NZ,00118$
   6098 21 FB 90      [10] 3634 	ld	hl, #_enemy + 12
   609B 56            [ 7] 3635 	ld	d,(hl)
   609C 21 F0 90      [10] 3636 	ld	hl, #_enemy + 1
   609F 5E            [ 7] 3637 	ld	e,(hl)
   60A0 7A            [ 4] 3638 	ld	a,d
   60A1 93            [ 4] 3639 	sub	a, e
   60A2 20 0A         [12] 3640 	jr	NZ,00118$
                           3641 ;src/ia.h:124: enemy.pursue = 0;
   60A4 21 FC 90      [10] 3642 	ld	hl,#(_enemy + 0x000d)
   60A7 36 00         [10] 3643 	ld	(hl),#0x00
   60A9 18 03         [12] 3644 	jr	00118$
   60AB                    3645 00114$:
                           3646 ;src/ia.h:126: patrol();
   60AB CD 98 5E      [17] 3647 	call	_patrol
   60AE                    3648 00118$:
                           3649 ;src/ia.h:129: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   60AE 21 F2 90      [10] 3650 	ld	hl, #_enemy + 3
   60B1 56            [ 7] 3651 	ld	d,(hl)
   60B2 3A F1 90      [13] 3652 	ld	a, (#_enemy + 2)
   60B5 D5            [11] 3653 	push	de
   60B6 33            [ 6] 3654 	inc	sp
   60B7 F5            [11] 3655 	push	af
   60B8 33            [ 6] 3656 	inc	sp
   60B9 CD 77 57      [17] 3657 	call	_detectPlayerRoom
   60BC F1            [10] 3658 	pop	af
   60BD 55            [ 4] 3659 	ld	d,l
   60BE 3A E5 90      [13] 3660 	ld	a, (#(_player + 0x0001) + 0)
   60C1 21 E4 90      [10] 3661 	ld	hl, #_player + 0
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
   60D4 21 FC 90      [10] 3675 	ld	hl, #_enemy + 13
   60D7 66            [ 7] 3676 	ld	h,(hl)
   60D8 3E 01         [ 7] 3677 	ld	a,#0x01
   60DA 94            [ 4] 3678 	sub	a, h
   60DB 30 0E         [12] 3679 	jr	NC,00120$
   60DD                    3680 00119$:
                           3681 ;src/ia.h:130: enemy.seenX = player.x;
   60DD 11 FA 90      [10] 3682 	ld	de,#_enemy + 11
   60E0 3A E4 90      [13] 3683 	ld	a, (#_player + 0)
   60E3 12            [ 7] 3684 	ld	(de),a
                           3685 ;src/ia.h:131: enemy.seenY = player.y;
   60E4 11 FB 90      [10] 3686 	ld	de,#_enemy + 12
   60E7 3A E5 90      [13] 3687 	ld	a, (#(_player + 0x0001) + 0)
   60EA 12            [ 7] 3688 	ld	(de),a
   60EB                    3689 00120$:
                           3690 ;src/ia.h:133: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   60EB 3A F0 90      [13] 3691 	ld	a, (#_enemy + 1)
   60EE 21 EF 90      [10] 3692 	ld	hl, #_enemy + 0
   60F1 56            [ 7] 3693 	ld	d,(hl)
   60F2 F5            [11] 3694 	push	af
   60F3 33            [ 6] 3695 	inc	sp
   60F4 D5            [11] 3696 	push	de
   60F5 33            [ 6] 3697 	inc	sp
   60F6 CD 77 57      [17] 3698 	call	_detectPlayerRoom
   60F9 F1            [10] 3699 	pop	af
   60FA 7D            [ 4] 3700 	ld	a,l
   60FB 32 F9 90      [13] 3701 	ld	(#(_enemy + 0x000a)),a
   60FE C9            [10] 3702 	ret
                           3703 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           3704 ;	---------------------------------
                           3705 ; Function checkCollisions
                           3706 ; ---------------------------------
   60FF                    3707 _checkCollisions::
   60FF DD E5         [15] 3708 	push	ix
   6101 DD 21 00 00   [14] 3709 	ld	ix,#0
   6105 DD 39         [15] 3710 	add	ix,sp
                           3711 ;src/CalcColision.h:14: switch(atk){
   6107 DD 7E 08      [19] 3712 	ld	a,8 (ix)
   610A D6 15         [ 7] 3713 	sub	a, #0x15
   610C 28 09         [12] 3714 	jr	Z,00101$
   610E DD 7E 08      [19] 3715 	ld	a,8 (ix)
   6111 D6 16         [ 7] 3716 	sub	a, #0x16
   6113 28 07         [12] 3717 	jr	Z,00102$
   6115 18 0A         [12] 3718 	jr	00103$
                           3719 ;src/CalcColision.h:15: case 21:
   6117                    3720 00101$:
                           3721 ;src/CalcColision.h:16: auxX = 2;
                           3722 ;src/CalcColision.h:17: auxY = 8;
   6117 21 08 02      [10] 3723 	ld	hl,#0x0208
                           3724 ;src/CalcColision.h:18: break;
   611A 18 08         [12] 3725 	jr	00104$
                           3726 ;src/CalcColision.h:19: case 22:
   611C                    3727 00102$:
                           3728 ;src/CalcColision.h:20: auxX = 4;
                           3729 ;src/CalcColision.h:21: auxY = 4;
   611C 21 04 04      [10] 3730 	ld	hl,#0x0404
                           3731 ;src/CalcColision.h:22: break;
   611F 18 03         [12] 3732 	jr	00104$
                           3733 ;src/CalcColision.h:23: default:
   6121                    3734 00103$:
                           3735 ;src/CalcColision.h:24: auxX = tilewidth;
                           3736 ;src/CalcColision.h:25: auxY = tileheight;
   6121 21 10 04      [10] 3737 	ld	hl,#0x0410
                           3738 ;src/CalcColision.h:26: }
   6124                    3739 00104$:
                           3740 ;src/CalcColision.h:27: popX = pX + auxX;
   6124 DD 7E 04      [19] 3741 	ld	a,4 (ix)
   6127 84            [ 4] 3742 	add	a, h
   6128 67            [ 4] 3743 	ld	h,a
                           3744 ;src/CalcColision.h:28: popY = pY + auxY;
   6129 DD 7E 05      [19] 3745 	ld	a,5 (ix)
   612C 85            [ 4] 3746 	add	a, l
   612D 6F            [ 4] 3747 	ld	l,a
                           3748 ;src/CalcColision.h:29: eopX = eX + tilewidth;
   612E DD 56 06      [19] 3749 	ld	d,6 (ix)
   6131 14            [ 4] 3750 	inc	d
   6132 14            [ 4] 3751 	inc	d
   6133 14            [ 4] 3752 	inc	d
   6134 14            [ 4] 3753 	inc	d
                           3754 ;src/CalcColision.h:30: eopY = eY + tileheight;
   6135 DD 7E 07      [19] 3755 	ld	a,7 (ix)
   6138 C6 10         [ 7] 3756 	add	a, #0x10
   613A 5F            [ 4] 3757 	ld	e,a
                           3758 ;src/CalcColision.h:33: if(eY <= pY  && eopY>= pY || eY <= popY  && eopY>= popY ){
   613B DD 7E 05      [19] 3759 	ld	a,5 (ix)
   613E DD 96 07      [19] 3760 	sub	a, 7 (ix)
   6141 38 06         [12] 3761 	jr	C,00117$
   6143 7B            [ 4] 3762 	ld	a,e
   6144 DD 96 05      [19] 3763 	sub	a, 5 (ix)
   6147 30 0A         [12] 3764 	jr	NC,00113$
   6149                    3765 00117$:
   6149 7D            [ 4] 3766 	ld	a,l
   614A DD 96 07      [19] 3767 	sub	a, 7 (ix)
   614D 38 2B         [12] 3768 	jr	C,00114$
   614F 7B            [ 4] 3769 	ld	a,e
   6150 95            [ 4] 3770 	sub	a, l
   6151 38 27         [12] 3771 	jr	C,00114$
   6153                    3772 00113$:
                           3773 ;src/CalcColision.h:34: if(eX <= pX && eopX>= pX || eX <= popX &&  eopX >= popX){
   6153 DD 7E 04      [19] 3774 	ld	a,4 (ix)
   6156 DD 96 06      [19] 3775 	sub	a, 6 (ix)
   6159 38 06         [12] 3776 	jr	C,00112$
   615B 7A            [ 4] 3777 	ld	a,d
   615C DD 96 04      [19] 3778 	sub	a, 4 (ix)
   615F 30 0A         [12] 3779 	jr	NC,00108$
   6161                    3780 00112$:
   6161 7C            [ 4] 3781 	ld	a,h
   6162 DD 96 06      [19] 3782 	sub	a, 6 (ix)
   6165 38 13         [12] 3783 	jr	C,00114$
   6167 7A            [ 4] 3784 	ld	a,d
   6168 94            [ 4] 3785 	sub	a, h
   6169 38 0F         [12] 3786 	jr	C,00114$
   616B                    3787 00108$:
                           3788 ;src/CalcColision.h:35: if(atk >= 21) return 1;
   616B DD 7E 08      [19] 3789 	ld	a,8 (ix)
   616E D6 15         [ 7] 3790 	sub	a, #0x15
   6170 38 04         [12] 3791 	jr	C,00106$
   6172 2E 01         [ 7] 3792 	ld	l,#0x01
   6174 18 06         [12] 3793 	jr	00118$
   6176                    3794 00106$:
                           3795 ;src/CalcColision.h:36: else return 2;
   6176 2E 02         [ 7] 3796 	ld	l,#0x02
   6178 18 02         [12] 3797 	jr	00118$
   617A                    3798 00114$:
                           3799 ;src/CalcColision.h:40: return 0;
   617A 2E 00         [ 7] 3800 	ld	l,#0x00
   617C                    3801 00118$:
   617C DD E1         [14] 3802 	pop	ix
   617E C9            [10] 3803 	ret
                           3804 ;src/CalcColision.h:44: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3805 ;	---------------------------------
                           3806 ; Function checkBoundsCollisions
                           3807 ; ---------------------------------
   617F                    3808 _checkBoundsCollisions::
   617F DD E5         [15] 3809 	push	ix
   6181 DD 21 00 00   [14] 3810 	ld	ix,#0
   6185 DD 39         [15] 3811 	add	ix,sp
   6187 21 ED FF      [10] 3812 	ld	hl,#-19
   618A 39            [11] 3813 	add	hl,sp
   618B F9            [ 6] 3814 	ld	sp,hl
                           3815 ;src/CalcColision.h:45: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   618C 3A E5 90      [13] 3816 	ld	a,(#(_player + 0x0001) + 0)
   618F DD 77 EE      [19] 3817 	ld	-18 (ix), a
   6192 07            [ 4] 3818 	rlca
   6193 07            [ 4] 3819 	rlca
   6194 07            [ 4] 3820 	rlca
   6195 07            [ 4] 3821 	rlca
   6196 E6 0F         [ 7] 3822 	and	a,#0x0F
   6198 4F            [ 4] 3823 	ld	c,a
   6199 06 00         [ 7] 3824 	ld	b,#0x00
   619B 69            [ 4] 3825 	ld	l, c
   619C 60            [ 4] 3826 	ld	h, b
   619D 29            [11] 3827 	add	hl, hl
   619E 29            [11] 3828 	add	hl, hl
   619F 09            [11] 3829 	add	hl, bc
   61A0 29            [11] 3830 	add	hl, hl
   61A1 29            [11] 3831 	add	hl, hl
   61A2 3E DE         [ 7] 3832 	ld	a,#<(_scene)
   61A4 85            [ 4] 3833 	add	a, l
   61A5 DD 77 F9      [19] 3834 	ld	-7 (ix),a
   61A8 3E 8F         [ 7] 3835 	ld	a,#>(_scene)
   61AA 8C            [ 4] 3836 	adc	a, h
   61AB DD 77 FA      [19] 3837 	ld	-6 (ix),a
   61AE 3A E4 90      [13] 3838 	ld	a,(#_player + 0)
   61B1 DD 77 ED      [19] 3839 	ld	-19 (ix), a
   61B4 0F            [ 4] 3840 	rrca
   61B5 0F            [ 4] 3841 	rrca
   61B6 E6 3F         [ 7] 3842 	and	a,#0x3F
   61B8 DD 77 FF      [19] 3843 	ld	-1 (ix), a
   61BB DD 86 F9      [19] 3844 	add	a, -7 (ix)
   61BE 6F            [ 4] 3845 	ld	l,a
   61BF 3E 00         [ 7] 3846 	ld	a,#0x00
   61C1 DD 8E FA      [19] 3847 	adc	a, -6 (ix)
   61C4 67            [ 4] 3848 	ld	h,a
   61C5 7E            [ 7] 3849 	ld	a,(hl)
                           3850 ;src/CalcColision.h:50: player.x=player.lx;
                           3851 ;src/CalcColision.h:51: player.y=player.ly;
                           3852 ;src/CalcColision.h:45: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   61C6 DD 77 F3      [19] 3853 	ld	-13 (ix), a
   61C9 3D            [ 4] 3854 	dec	a
   61CA CA 82 63      [10] 3855 	jp	Z,00129$
                           3856 ;src/CalcColision.h:46: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   61CD DD 5E ED      [19] 3857 	ld	e,-19 (ix)
   61D0 16 00         [ 7] 3858 	ld	d,#0x00
   61D2 21 03 00      [10] 3859 	ld	hl,#0x0003
   61D5 19            [11] 3860 	add	hl,de
   61D6 DD 75 F6      [19] 3861 	ld	-10 (ix),l
   61D9 DD 74 F7      [19] 3862 	ld	-9 (ix),h
   61DC DD 7E F6      [19] 3863 	ld	a,-10 (ix)
   61DF DD 77 FD      [19] 3864 	ld	-3 (ix),a
   61E2 DD 7E F7      [19] 3865 	ld	a,-9 (ix)
   61E5 DD 77 FE      [19] 3866 	ld	-2 (ix),a
   61E8 DD 7E F7      [19] 3867 	ld	a,-9 (ix)
   61EB 07            [ 4] 3868 	rlca
   61EC E6 01         [ 7] 3869 	and	a,#0x01
   61EE DD 77 ED      [19] 3870 	ld	-19 (ix),a
   61F1 21 06 00      [10] 3871 	ld	hl,#0x0006
   61F4 19            [11] 3872 	add	hl,de
   61F5 DD 75 FB      [19] 3873 	ld	-5 (ix),l
   61F8 DD 74 FC      [19] 3874 	ld	-4 (ix),h
   61FB DD 7E ED      [19] 3875 	ld	a,-19 (ix)
   61FE B7            [ 4] 3876 	or	a, a
   61FF 28 0C         [12] 3877 	jr	Z,00137$
   6201 DD 7E FB      [19] 3878 	ld	a,-5 (ix)
   6204 DD 77 FD      [19] 3879 	ld	-3 (ix),a
   6207 DD 7E FC      [19] 3880 	ld	a,-4 (ix)
   620A DD 77 FE      [19] 3881 	ld	-2 (ix),a
   620D                    3882 00137$:
   620D DD 6E FD      [19] 3883 	ld	l,-3 (ix)
   6210 DD 66 FE      [19] 3884 	ld	h,-2 (ix)
   6213 CB 2C         [ 8] 3885 	sra	h
   6215 CB 1D         [ 8] 3886 	rr	l
   6217 CB 2C         [ 8] 3887 	sra	h
   6219 CB 1D         [ 8] 3888 	rr	l
   621B DD 5E F9      [19] 3889 	ld	e,-7 (ix)
   621E DD 56 FA      [19] 3890 	ld	d,-6 (ix)
   6221 19            [11] 3891 	add	hl,de
   6222 7E            [ 7] 3892 	ld	a,(hl)
   6223 3D            [ 4] 3893 	dec	a
   6224 CA 82 63      [10] 3894 	jp	Z,00129$
                           3895 ;src/CalcColision.h:47: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   6227 DD 7E EE      [19] 3896 	ld	a,-18 (ix)
   622A DD 77 FD      [19] 3897 	ld	-3 (ix),a
   622D DD 36 FE 00   [19] 3898 	ld	-2 (ix),#0x00
   6231 DD 7E FD      [19] 3899 	ld	a,-3 (ix)
   6234 C6 0E         [ 7] 3900 	add	a, #0x0E
   6236 DD 77 F1      [19] 3901 	ld	-15 (ix),a
   6239 DD 7E FE      [19] 3902 	ld	a,-2 (ix)
   623C CE 00         [ 7] 3903 	adc	a, #0x00
   623E DD 77 F2      [19] 3904 	ld	-14 (ix),a
   6241 DD 7E F1      [19] 3905 	ld	a,-15 (ix)
   6244 DD 77 F4      [19] 3906 	ld	-12 (ix),a
   6247 DD 7E F2      [19] 3907 	ld	a,-14 (ix)
   624A DD 77 F5      [19] 3908 	ld	-11 (ix),a
   624D DD 7E F2      [19] 3909 	ld	a,-14 (ix)
   6250 07            [ 4] 3910 	rlca
   6251 E6 01         [ 7] 3911 	and	a,#0x01
   6253 DD 77 EE      [19] 3912 	ld	-18 (ix),a
   6256 DD 7E FD      [19] 3913 	ld	a,-3 (ix)
   6259 C6 1D         [ 7] 3914 	add	a, #0x1D
   625B DD 77 FD      [19] 3915 	ld	-3 (ix),a
   625E DD 7E FE      [19] 3916 	ld	a,-2 (ix)
   6261 CE 00         [ 7] 3917 	adc	a, #0x00
   6263 DD 77 FE      [19] 3918 	ld	-2 (ix),a
   6266 DD 7E EE      [19] 3919 	ld	a,-18 (ix)
   6269 B7            [ 4] 3920 	or	a, a
   626A 28 0C         [12] 3921 	jr	Z,00138$
   626C DD 7E FD      [19] 3922 	ld	a,-3 (ix)
   626F DD 77 F4      [19] 3923 	ld	-12 (ix),a
   6272 DD 7E FE      [19] 3924 	ld	a,-2 (ix)
   6275 DD 77 F5      [19] 3925 	ld	-11 (ix),a
   6278                    3926 00138$:
   6278 DD CB F5 2E   [23] 3927 	sra	-11 (ix)
   627C DD CB F4 1E   [23] 3928 	rr	-12 (ix)
   6280 DD CB F5 2E   [23] 3929 	sra	-11 (ix)
   6284 DD CB F4 1E   [23] 3930 	rr	-12 (ix)
   6288 DD CB F5 2E   [23] 3931 	sra	-11 (ix)
   628C DD CB F4 1E   [23] 3932 	rr	-12 (ix)
   6290 DD CB F5 2E   [23] 3933 	sra	-11 (ix)
   6294 DD CB F4 1E   [23] 3934 	rr	-12 (ix)
   6298 DD 4E F4      [19] 3935 	ld	c,-12 (ix)
   629B DD 46 F5      [19] 3936 	ld	b,-11 (ix)
   629E 69            [ 4] 3937 	ld	l, c
   629F 60            [ 4] 3938 	ld	h, b
   62A0 29            [11] 3939 	add	hl, hl
   62A1 29            [11] 3940 	add	hl, hl
   62A2 09            [11] 3941 	add	hl, bc
   62A3 29            [11] 3942 	add	hl, hl
   62A4 29            [11] 3943 	add	hl, hl
   62A5 DD 75 F4      [19] 3944 	ld	-12 (ix),l
   62A8 DD 74 F5      [19] 3945 	ld	-11 (ix),h
   62AB 3E DE         [ 7] 3946 	ld	a,#<(_scene)
   62AD DD 86 F4      [19] 3947 	add	a, -12 (ix)
   62B0 DD 77 F4      [19] 3948 	ld	-12 (ix),a
   62B3 3E 8F         [ 7] 3949 	ld	a,#>(_scene)
   62B5 DD 8E F5      [19] 3950 	adc	a, -11 (ix)
   62B8 DD 77 F5      [19] 3951 	ld	-11 (ix),a
   62BB DD 7E F4      [19] 3952 	ld	a,-12 (ix)
   62BE DD 86 FF      [19] 3953 	add	a, -1 (ix)
   62C1 DD 77 F4      [19] 3954 	ld	-12 (ix),a
   62C4 DD 7E F5      [19] 3955 	ld	a,-11 (ix)
   62C7 CE 00         [ 7] 3956 	adc	a, #0x00
   62C9 DD 77 F5      [19] 3957 	ld	-11 (ix),a
   62CC DD 6E F4      [19] 3958 	ld	l,-12 (ix)
   62CF DD 66 F5      [19] 3959 	ld	h,-11 (ix)
   62D2 7E            [ 7] 3960 	ld	a,(hl)
   62D3 3D            [ 4] 3961 	dec	a
   62D4 CA 82 63      [10] 3962 	jp	Z,00129$
                           3963 ;src/CalcColision.h:48: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   62D7 DD 7E F1      [19] 3964 	ld	a,-15 (ix)
   62DA DD 77 F4      [19] 3965 	ld	-12 (ix),a
   62DD DD 7E F2      [19] 3966 	ld	a,-14 (ix)
   62E0 DD 77 F5      [19] 3967 	ld	-11 (ix),a
   62E3 DD 7E EE      [19] 3968 	ld	a,-18 (ix)
   62E6 B7            [ 4] 3969 	or	a, a
   62E7 28 0C         [12] 3970 	jr	Z,00139$
   62E9 DD 7E FD      [19] 3971 	ld	a,-3 (ix)
   62EC DD 77 F4      [19] 3972 	ld	-12 (ix),a
   62EF DD 7E FE      [19] 3973 	ld	a,-2 (ix)
   62F2 DD 77 F5      [19] 3974 	ld	-11 (ix),a
   62F5                    3975 00139$:
   62F5 DD CB F5 2E   [23] 3976 	sra	-11 (ix)
   62F9 DD CB F4 1E   [23] 3977 	rr	-12 (ix)
   62FD DD CB F5 2E   [23] 3978 	sra	-11 (ix)
   6301 DD CB F4 1E   [23] 3979 	rr	-12 (ix)
   6305 DD CB F5 2E   [23] 3980 	sra	-11 (ix)
   6309 DD CB F4 1E   [23] 3981 	rr	-12 (ix)
   630D DD CB F5 2E   [23] 3982 	sra	-11 (ix)
   6311 DD CB F4 1E   [23] 3983 	rr	-12 (ix)
   6315 DD 4E F4      [19] 3984 	ld	c,-12 (ix)
   6318 DD 46 F5      [19] 3985 	ld	b,-11 (ix)
   631B 69            [ 4] 3986 	ld	l, c
   631C 60            [ 4] 3987 	ld	h, b
   631D 29            [11] 3988 	add	hl, hl
   631E 29            [11] 3989 	add	hl, hl
   631F 09            [11] 3990 	add	hl, bc
   6320 29            [11] 3991 	add	hl, hl
   6321 29            [11] 3992 	add	hl, hl
   6322 DD 75 F4      [19] 3993 	ld	-12 (ix),l
   6325 DD 74 F5      [19] 3994 	ld	-11 (ix),h
   6328 3E DE         [ 7] 3995 	ld	a,#<(_scene)
   632A DD 86 F4      [19] 3996 	add	a, -12 (ix)
   632D DD 77 F4      [19] 3997 	ld	-12 (ix),a
   6330 3E 8F         [ 7] 3998 	ld	a,#>(_scene)
   6332 DD 8E F5      [19] 3999 	adc	a, -11 (ix)
   6335 DD 77 F5      [19] 4000 	ld	-11 (ix),a
   6338 DD 7E F6      [19] 4001 	ld	a,-10 (ix)
   633B DD 77 EF      [19] 4002 	ld	-17 (ix),a
   633E DD 7E F7      [19] 4003 	ld	a,-9 (ix)
   6341 DD 77 F0      [19] 4004 	ld	-16 (ix),a
   6344 DD 7E ED      [19] 4005 	ld	a,-19 (ix)
   6347 B7            [ 4] 4006 	or	a, a
   6348 28 0C         [12] 4007 	jr	Z,00140$
   634A DD 7E FB      [19] 4008 	ld	a,-5 (ix)
   634D DD 77 EF      [19] 4009 	ld	-17 (ix),a
   6350 DD 7E FC      [19] 4010 	ld	a,-4 (ix)
   6353 DD 77 F0      [19] 4011 	ld	-16 (ix),a
   6356                    4012 00140$:
   6356 DD CB F0 2E   [23] 4013 	sra	-16 (ix)
   635A DD CB EF 1E   [23] 4014 	rr	-17 (ix)
   635E DD CB F0 2E   [23] 4015 	sra	-16 (ix)
   6362 DD CB EF 1E   [23] 4016 	rr	-17 (ix)
   6366 DD 7E F4      [19] 4017 	ld	a,-12 (ix)
   6369 DD 86 EF      [19] 4018 	add	a, -17 (ix)
   636C DD 77 EF      [19] 4019 	ld	-17 (ix),a
   636F DD 7E F5      [19] 4020 	ld	a,-11 (ix)
   6372 DD 8E F0      [19] 4021 	adc	a, -16 (ix)
   6375 DD 77 F0      [19] 4022 	ld	-16 (ix),a
   6378 DD 6E EF      [19] 4023 	ld	l,-17 (ix)
   637B DD 66 F0      [19] 4024 	ld	h,-16 (ix)
   637E 7E            [ 7] 4025 	ld	a,(hl)
   637F 3D            [ 4] 4026 	dec	a
   6380 20 10         [12] 4027 	jr	NZ,00130$
   6382                    4028 00129$:
                           4029 ;src/CalcColision.h:50: player.x=player.lx;
   6382 3A E6 90      [13] 4030 	ld	a, (#(_player + 0x0002) + 0)
   6385 21 E4 90      [10] 4031 	ld	hl,#_player
   6388 77            [ 7] 4032 	ld	(hl),a
                           4033 ;src/CalcColision.h:51: player.y=player.ly;
   6389 3A E7 90      [13] 4034 	ld	a, (#(_player + 0x0003) + 0)
   638C 32 E5 90      [13] 4035 	ld	(#(_player + 0x0001)),a
   638F C3 82 68      [10] 4036 	jp	00135$
   6392                    4037 00130$:
                           4038 ;src/CalcColision.h:53: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   6392 DD 7E F3      [19] 4039 	ld	a,-13 (ix)
   6395 D6 02         [ 7] 4040 	sub	a, #0x02
   6397 CA 10 65      [10] 4041 	jp	Z,00123$
                           4042 ;src/CalcColision.h:54: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   639A DD 7E F6      [19] 4043 	ld	a,-10 (ix)
   639D DD 77 EF      [19] 4044 	ld	-17 (ix),a
   63A0 DD 7E F7      [19] 4045 	ld	a,-9 (ix)
   63A3 DD 77 F0      [19] 4046 	ld	-16 (ix),a
   63A6 DD 7E ED      [19] 4047 	ld	a,-19 (ix)
   63A9 B7            [ 4] 4048 	or	a, a
   63AA 28 0C         [12] 4049 	jr	Z,00141$
   63AC DD 7E FB      [19] 4050 	ld	a,-5 (ix)
   63AF DD 77 EF      [19] 4051 	ld	-17 (ix),a
   63B2 DD 7E FC      [19] 4052 	ld	a,-4 (ix)
   63B5 DD 77 F0      [19] 4053 	ld	-16 (ix),a
   63B8                    4054 00141$:
   63B8 DD CB F0 2E   [23] 4055 	sra	-16 (ix)
   63BC DD CB EF 1E   [23] 4056 	rr	-17 (ix)
   63C0 DD CB F0 2E   [23] 4057 	sra	-16 (ix)
   63C4 DD CB EF 1E   [23] 4058 	rr	-17 (ix)
   63C8 DD 7E F9      [19] 4059 	ld	a,-7 (ix)
   63CB DD 86 EF      [19] 4060 	add	a, -17 (ix)
   63CE DD 77 EF      [19] 4061 	ld	-17 (ix),a
   63D1 DD 7E FA      [19] 4062 	ld	a,-6 (ix)
   63D4 DD 8E F0      [19] 4063 	adc	a, -16 (ix)
   63D7 DD 77 F0      [19] 4064 	ld	-16 (ix),a
   63DA DD 6E EF      [19] 4065 	ld	l,-17 (ix)
   63DD DD 66 F0      [19] 4066 	ld	h,-16 (ix)
   63E0 7E            [ 7] 4067 	ld	a,(hl)
   63E1 D6 02         [ 7] 4068 	sub	a, #0x02
   63E3 CA 10 65      [10] 4069 	jp	Z,00123$
                           4070 ;src/CalcColision.h:55: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   63E6 DD 7E F1      [19] 4071 	ld	a,-15 (ix)
   63E9 DD 77 EF      [19] 4072 	ld	-17 (ix),a
   63EC DD 7E F2      [19] 4073 	ld	a,-14 (ix)
   63EF DD 77 F0      [19] 4074 	ld	-16 (ix),a
   63F2 DD 7E EE      [19] 4075 	ld	a,-18 (ix)
   63F5 B7            [ 4] 4076 	or	a, a
   63F6 28 0C         [12] 4077 	jr	Z,00142$
   63F8 DD 7E FD      [19] 4078 	ld	a,-3 (ix)
   63FB DD 77 EF      [19] 4079 	ld	-17 (ix),a
   63FE DD 7E FE      [19] 4080 	ld	a,-2 (ix)
   6401 DD 77 F0      [19] 4081 	ld	-16 (ix),a
   6404                    4082 00142$:
   6404 DD CB F0 2E   [23] 4083 	sra	-16 (ix)
   6408 DD CB EF 1E   [23] 4084 	rr	-17 (ix)
   640C DD CB F0 2E   [23] 4085 	sra	-16 (ix)
   6410 DD CB EF 1E   [23] 4086 	rr	-17 (ix)
   6414 DD CB F0 2E   [23] 4087 	sra	-16 (ix)
   6418 DD CB EF 1E   [23] 4088 	rr	-17 (ix)
   641C DD CB F0 2E   [23] 4089 	sra	-16 (ix)
   6420 DD CB EF 1E   [23] 4090 	rr	-17 (ix)
   6424 DD 4E EF      [19] 4091 	ld	c,-17 (ix)
   6427 DD 46 F0      [19] 4092 	ld	b,-16 (ix)
   642A 69            [ 4] 4093 	ld	l, c
   642B 60            [ 4] 4094 	ld	h, b
   642C 29            [11] 4095 	add	hl, hl
   642D 29            [11] 4096 	add	hl, hl
   642E 09            [11] 4097 	add	hl, bc
   642F 29            [11] 4098 	add	hl, hl
   6430 29            [11] 4099 	add	hl, hl
   6431 DD 75 EF      [19] 4100 	ld	-17 (ix),l
   6434 DD 74 F0      [19] 4101 	ld	-16 (ix),h
   6437 3E DE         [ 7] 4102 	ld	a,#<(_scene)
   6439 DD 86 EF      [19] 4103 	add	a, -17 (ix)
   643C DD 77 EF      [19] 4104 	ld	-17 (ix),a
   643F 3E 8F         [ 7] 4105 	ld	a,#>(_scene)
   6441 DD 8E F0      [19] 4106 	adc	a, -16 (ix)
   6444 DD 77 F0      [19] 4107 	ld	-16 (ix),a
   6447 DD 7E EF      [19] 4108 	ld	a,-17 (ix)
   644A DD 86 FF      [19] 4109 	add	a, -1 (ix)
   644D DD 77 EF      [19] 4110 	ld	-17 (ix),a
   6450 DD 7E F0      [19] 4111 	ld	a,-16 (ix)
   6453 CE 00         [ 7] 4112 	adc	a, #0x00
   6455 DD 77 F0      [19] 4113 	ld	-16 (ix),a
   6458 DD 6E EF      [19] 4114 	ld	l,-17 (ix)
   645B DD 66 F0      [19] 4115 	ld	h,-16 (ix)
   645E 7E            [ 7] 4116 	ld	a,(hl)
   645F D6 02         [ 7] 4117 	sub	a, #0x02
   6461 CA 10 65      [10] 4118 	jp	Z,00123$
                           4119 ;src/CalcColision.h:56: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   6464 DD 7E F1      [19] 4120 	ld	a,-15 (ix)
   6467 DD 77 EF      [19] 4121 	ld	-17 (ix),a
   646A DD 7E F2      [19] 4122 	ld	a,-14 (ix)
   646D DD 77 F0      [19] 4123 	ld	-16 (ix),a
   6470 DD 7E EE      [19] 4124 	ld	a,-18 (ix)
   6473 B7            [ 4] 4125 	or	a, a
   6474 28 0C         [12] 4126 	jr	Z,00143$
   6476 DD 7E FD      [19] 4127 	ld	a,-3 (ix)
   6479 DD 77 EF      [19] 4128 	ld	-17 (ix),a
   647C DD 7E FE      [19] 4129 	ld	a,-2 (ix)
   647F DD 77 F0      [19] 4130 	ld	-16 (ix),a
   6482                    4131 00143$:
   6482 DD CB F0 2E   [23] 4132 	sra	-16 (ix)
   6486 DD CB EF 1E   [23] 4133 	rr	-17 (ix)
   648A DD CB F0 2E   [23] 4134 	sra	-16 (ix)
   648E DD CB EF 1E   [23] 4135 	rr	-17 (ix)
   6492 DD CB F0 2E   [23] 4136 	sra	-16 (ix)
   6496 DD CB EF 1E   [23] 4137 	rr	-17 (ix)
   649A DD CB F0 2E   [23] 4138 	sra	-16 (ix)
   649E DD CB EF 1E   [23] 4139 	rr	-17 (ix)
   64A2 DD 4E EF      [19] 4140 	ld	c,-17 (ix)
   64A5 DD 46 F0      [19] 4141 	ld	b,-16 (ix)
   64A8 69            [ 4] 4142 	ld	l, c
   64A9 60            [ 4] 4143 	ld	h, b
   64AA 29            [11] 4144 	add	hl, hl
   64AB 29            [11] 4145 	add	hl, hl
   64AC 09            [11] 4146 	add	hl, bc
   64AD 29            [11] 4147 	add	hl, hl
   64AE 29            [11] 4148 	add	hl, hl
   64AF DD 75 EF      [19] 4149 	ld	-17 (ix),l
   64B2 DD 74 F0      [19] 4150 	ld	-16 (ix),h
   64B5 3E DE         [ 7] 4151 	ld	a,#<(_scene)
   64B7 DD 86 EF      [19] 4152 	add	a, -17 (ix)
   64BA DD 77 EF      [19] 4153 	ld	-17 (ix),a
   64BD 3E 8F         [ 7] 4154 	ld	a,#>(_scene)
   64BF DD 8E F0      [19] 4155 	adc	a, -16 (ix)
   64C2 DD 77 F0      [19] 4156 	ld	-16 (ix),a
   64C5 DD 7E F6      [19] 4157 	ld	a,-10 (ix)
   64C8 DD 77 F4      [19] 4158 	ld	-12 (ix),a
   64CB DD 7E F7      [19] 4159 	ld	a,-9 (ix)
   64CE DD 77 F5      [19] 4160 	ld	-11 (ix),a
   64D1 DD 7E ED      [19] 4161 	ld	a,-19 (ix)
   64D4 B7            [ 4] 4162 	or	a, a
   64D5 28 0C         [12] 4163 	jr	Z,00144$
   64D7 DD 7E FB      [19] 4164 	ld	a,-5 (ix)
   64DA DD 77 F4      [19] 4165 	ld	-12 (ix),a
   64DD DD 7E FC      [19] 4166 	ld	a,-4 (ix)
   64E0 DD 77 F5      [19] 4167 	ld	-11 (ix),a
   64E3                    4168 00144$:
   64E3 DD CB F5 2E   [23] 4169 	sra	-11 (ix)
   64E7 DD CB F4 1E   [23] 4170 	rr	-12 (ix)
   64EB DD CB F5 2E   [23] 4171 	sra	-11 (ix)
   64EF DD CB F4 1E   [23] 4172 	rr	-12 (ix)
   64F3 DD 7E EF      [19] 4173 	ld	a,-17 (ix)
   64F6 DD 86 F4      [19] 4174 	add	a, -12 (ix)
   64F9 DD 77 EF      [19] 4175 	ld	-17 (ix),a
   64FC DD 7E F0      [19] 4176 	ld	a,-16 (ix)
   64FF DD 8E F5      [19] 4177 	adc	a, -11 (ix)
   6502 DD 77 F0      [19] 4178 	ld	-16 (ix),a
   6505 DD 6E EF      [19] 4179 	ld	l,-17 (ix)
   6508 DD 66 F0      [19] 4180 	ld	h,-16 (ix)
   650B 7E            [ 7] 4181 	ld	a,(hl)
   650C D6 02         [ 7] 4182 	sub	a, #0x02
   650E 20 37         [12] 4183 	jr	NZ,00124$
   6510                    4184 00123$:
                           4185 ;src/CalcColision.h:58: if(player.life < 3 && *corazon == 0){
   6510 3A EA 90      [13] 4186 	ld	a,(#(_player + 0x0006) + 0)
   6513 DD 77 EF      [19] 4187 	ld	-17 (ix), a
   6516 D6 03         [ 7] 4188 	sub	a, #0x03
   6518 D2 82 68      [10] 4189 	jp	NC,00135$
   651B DD 7E 04      [19] 4190 	ld	a,4 (ix)
   651E DD 77 F4      [19] 4191 	ld	-12 (ix),a
   6521 DD 7E 05      [19] 4192 	ld	a,5 (ix)
   6524 DD 77 F5      [19] 4193 	ld	-11 (ix),a
   6527 DD 6E F4      [19] 4194 	ld	l,-12 (ix)
   652A DD 66 F5      [19] 4195 	ld	h,-11 (ix)
   652D 7E            [ 7] 4196 	ld	a,(hl)
   652E DD 77 F8      [19] 4197 	ld	-8 (ix), a
   6531 B7            [ 4] 4198 	or	a, a
   6532 C2 82 68      [10] 4199 	jp	NZ,00135$
                           4200 ;src/CalcColision.h:59: player.life += 1;
   6535 DD 7E EF      [19] 4201 	ld	a,-17 (ix)
   6538 3C            [ 4] 4202 	inc	a
   6539 32 EA 90      [13] 4203 	ld	(#(_player + 0x0006)),a
                           4204 ;src/CalcColision.h:60: *corazon = 1;
   653C DD 6E F4      [19] 4205 	ld	l,-12 (ix)
   653F DD 66 F5      [19] 4206 	ld	h,-11 (ix)
   6542 36 01         [10] 4207 	ld	(hl),#0x01
   6544 C3 82 68      [10] 4208 	jp	00135$
   6547                    4209 00124$:
                           4210 ;src/CalcColision.h:63: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   6547 DD 7E F3      [19] 4211 	ld	a,-13 (ix)
   654A D6 05         [ 7] 4212 	sub	a, #0x05
   654C CA 62 66      [10] 4213 	jp	Z,00117$
                           4214 ;src/CalcColision.h:64: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   654F DD 7E F6      [19] 4215 	ld	a,-10 (ix)
   6552 DD 77 EF      [19] 4216 	ld	-17 (ix),a
   6555 DD 7E F7      [19] 4217 	ld	a,-9 (ix)
   6558 DD 77 F0      [19] 4218 	ld	-16 (ix),a
   655B DD 7E ED      [19] 4219 	ld	a,-19 (ix)
   655E B7            [ 4] 4220 	or	a, a
   655F 28 0C         [12] 4221 	jr	Z,00145$
   6561 DD 7E FB      [19] 4222 	ld	a,-5 (ix)
   6564 DD 77 EF      [19] 4223 	ld	-17 (ix),a
   6567 DD 7E FC      [19] 4224 	ld	a,-4 (ix)
   656A DD 77 F0      [19] 4225 	ld	-16 (ix),a
   656D                    4226 00145$:
   656D C1            [10] 4227 	pop	bc
   656E E1            [10] 4228 	pop	hl
   656F E5            [11] 4229 	push	hl
   6570 C5            [11] 4230 	push	bc
   6571 CB 2C         [ 8] 4231 	sra	h
   6573 CB 1D         [ 8] 4232 	rr	l
   6575 CB 2C         [ 8] 4233 	sra	h
   6577 CB 1D         [ 8] 4234 	rr	l
   6579 DD 5E F9      [19] 4235 	ld	e,-7 (ix)
   657C DD 56 FA      [19] 4236 	ld	d,-6 (ix)
   657F 19            [11] 4237 	add	hl,de
   6580 7E            [ 7] 4238 	ld	a,(hl)
   6581 D6 05         [ 7] 4239 	sub	a, #0x05
   6583 CA 62 66      [10] 4240 	jp	Z,00117$
                           4241 ;src/CalcColision.h:65: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   6586 DD 7E F1      [19] 4242 	ld	a,-15 (ix)
   6589 DD 77 EF      [19] 4243 	ld	-17 (ix),a
   658C DD 7E F2      [19] 4244 	ld	a,-14 (ix)
   658F DD 77 F0      [19] 4245 	ld	-16 (ix),a
   6592 DD 7E EE      [19] 4246 	ld	a,-18 (ix)
   6595 B7            [ 4] 4247 	or	a, a
   6596 28 0C         [12] 4248 	jr	Z,00146$
   6598 DD 7E FD      [19] 4249 	ld	a,-3 (ix)
   659B DD 77 EF      [19] 4250 	ld	-17 (ix),a
   659E DD 7E FE      [19] 4251 	ld	a,-2 (ix)
   65A1 DD 77 F0      [19] 4252 	ld	-16 (ix),a
   65A4                    4253 00146$:
   65A4 C1            [10] 4254 	pop	bc
   65A5 E1            [10] 4255 	pop	hl
   65A6 E5            [11] 4256 	push	hl
   65A7 C5            [11] 4257 	push	bc
   65A8 CB 2C         [ 8] 4258 	sra	h
   65AA CB 1D         [ 8] 4259 	rr	l
   65AC CB 2C         [ 8] 4260 	sra	h
   65AE CB 1D         [ 8] 4261 	rr	l
   65B0 CB 2C         [ 8] 4262 	sra	h
   65B2 CB 1D         [ 8] 4263 	rr	l
   65B4 CB 2C         [ 8] 4264 	sra	h
   65B6 CB 1D         [ 8] 4265 	rr	l
   65B8 4D            [ 4] 4266 	ld	c, l
   65B9 44            [ 4] 4267 	ld	b, h
   65BA 29            [11] 4268 	add	hl, hl
   65BB 29            [11] 4269 	add	hl, hl
   65BC 09            [11] 4270 	add	hl, bc
   65BD 29            [11] 4271 	add	hl, hl
   65BE 29            [11] 4272 	add	hl, hl
   65BF 11 DE 8F      [10] 4273 	ld	de,#_scene
   65C2 19            [11] 4274 	add	hl,de
   65C3 DD 5E FF      [19] 4275 	ld	e,-1 (ix)
   65C6 16 00         [ 7] 4276 	ld	d,#0x00
   65C8 19            [11] 4277 	add	hl,de
   65C9 7E            [ 7] 4278 	ld	a,(hl)
   65CA D6 05         [ 7] 4279 	sub	a, #0x05
   65CC CA 62 66      [10] 4280 	jp	Z,00117$
                           4281 ;src/CalcColision.h:66: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   65CF DD 7E F1      [19] 4282 	ld	a,-15 (ix)
   65D2 DD 77 EF      [19] 4283 	ld	-17 (ix),a
   65D5 DD 7E F2      [19] 4284 	ld	a,-14 (ix)
   65D8 DD 77 F0      [19] 4285 	ld	-16 (ix),a
   65DB DD 7E EE      [19] 4286 	ld	a,-18 (ix)
   65DE B7            [ 4] 4287 	or	a, a
   65DF 28 0C         [12] 4288 	jr	Z,00147$
   65E1 DD 7E FD      [19] 4289 	ld	a,-3 (ix)
   65E4 DD 77 EF      [19] 4290 	ld	-17 (ix),a
   65E7 DD 7E FE      [19] 4291 	ld	a,-2 (ix)
   65EA DD 77 F0      [19] 4292 	ld	-16 (ix),a
   65ED                    4293 00147$:
   65ED C1            [10] 4294 	pop	bc
   65EE E1            [10] 4295 	pop	hl
   65EF E5            [11] 4296 	push	hl
   65F0 C5            [11] 4297 	push	bc
   65F1 CB 2C         [ 8] 4298 	sra	h
   65F3 CB 1D         [ 8] 4299 	rr	l
   65F5 CB 2C         [ 8] 4300 	sra	h
   65F7 CB 1D         [ 8] 4301 	rr	l
   65F9 CB 2C         [ 8] 4302 	sra	h
   65FB CB 1D         [ 8] 4303 	rr	l
   65FD CB 2C         [ 8] 4304 	sra	h
   65FF CB 1D         [ 8] 4305 	rr	l
   6601 4D            [ 4] 4306 	ld	c, l
   6602 44            [ 4] 4307 	ld	b, h
   6603 29            [11] 4308 	add	hl, hl
   6604 29            [11] 4309 	add	hl, hl
   6605 09            [11] 4310 	add	hl, bc
   6606 29            [11] 4311 	add	hl, hl
   6607 29            [11] 4312 	add	hl, hl
   6608 3E DE         [ 7] 4313 	ld	a,#<(_scene)
   660A 85            [ 4] 4314 	add	a, l
   660B DD 77 EF      [19] 4315 	ld	-17 (ix),a
   660E 3E 8F         [ 7] 4316 	ld	a,#>(_scene)
   6610 8C            [ 4] 4317 	adc	a, h
   6611 DD 77 F0      [19] 4318 	ld	-16 (ix),a
   6614 DD 7E F6      [19] 4319 	ld	a,-10 (ix)
   6617 DD 77 F4      [19] 4320 	ld	-12 (ix),a
   661A DD 7E F7      [19] 4321 	ld	a,-9 (ix)
   661D DD 77 F5      [19] 4322 	ld	-11 (ix),a
   6620 DD 7E ED      [19] 4323 	ld	a,-19 (ix)
   6623 B7            [ 4] 4324 	or	a, a
   6624 28 0C         [12] 4325 	jr	Z,00148$
   6626 DD 7E FB      [19] 4326 	ld	a,-5 (ix)
   6629 DD 77 F4      [19] 4327 	ld	-12 (ix),a
   662C DD 7E FC      [19] 4328 	ld	a,-4 (ix)
   662F DD 77 F5      [19] 4329 	ld	-11 (ix),a
   6632                    4330 00148$:
   6632 DD CB F5 2E   [23] 4331 	sra	-11 (ix)
   6636 DD CB F4 1E   [23] 4332 	rr	-12 (ix)
   663A DD CB F5 2E   [23] 4333 	sra	-11 (ix)
   663E DD CB F4 1E   [23] 4334 	rr	-12 (ix)
   6642 DD 7E F4      [19] 4335 	ld	a,-12 (ix)
   6645 DD 86 EF      [19] 4336 	add	a, -17 (ix)
   6648 DD 77 EF      [19] 4337 	ld	-17 (ix),a
   664B DD 7E F5      [19] 4338 	ld	a,-11 (ix)
   664E DD 8E F0      [19] 4339 	adc	a, -16 (ix)
   6651 DD 77 F0      [19] 4340 	ld	-16 (ix),a
   6654 DD 6E EF      [19] 4341 	ld	l,-17 (ix)
   6657 DD 66 F0      [19] 4342 	ld	h,-16 (ix)
   665A 7E            [ 7] 4343 	ld	a,(hl)
   665B DD 77 F8      [19] 4344 	ld	-8 (ix), a
   665E D6 05         [ 7] 4345 	sub	a, #0x05
   6660 20 37         [12] 4346 	jr	NZ,00118$
   6662                    4347 00117$:
                           4348 ;src/CalcColision.h:68: if(player.bullets < 3 && *flecha == 0){
   6662 3A EE 90      [13] 4349 	ld	a,(#(_player + 0x000a) + 0)
   6665 DD 77 F8      [19] 4350 	ld	-8 (ix), a
   6668 D6 03         [ 7] 4351 	sub	a, #0x03
   666A D2 82 68      [10] 4352 	jp	NC,00135$
   666D DD 7E 06      [19] 4353 	ld	a,6 (ix)
   6670 DD 77 EF      [19] 4354 	ld	-17 (ix),a
   6673 DD 7E 07      [19] 4355 	ld	a,7 (ix)
   6676 DD 77 F0      [19] 4356 	ld	-16 (ix),a
   6679 DD 6E EF      [19] 4357 	ld	l,-17 (ix)
   667C DD 66 F0      [19] 4358 	ld	h,-16 (ix)
   667F 7E            [ 7] 4359 	ld	a,(hl)
   6680 B7            [ 4] 4360 	or	a, a
   6681 C2 82 68      [10] 4361 	jp	NZ,00135$
                           4362 ;src/CalcColision.h:69: player.bullets += 1;
   6684 DD 34 F8      [23] 4363 	inc	-8 (ix)
   6687 21 EE 90      [10] 4364 	ld	hl,#(_player + 0x000a)
   668A DD 7E F8      [19] 4365 	ld	a,-8 (ix)
   668D 77            [ 7] 4366 	ld	(hl),a
                           4367 ;src/CalcColision.h:70: *flecha = 1;
   668E DD 6E EF      [19] 4368 	ld	l,-17 (ix)
   6691 DD 66 F0      [19] 4369 	ld	h,-16 (ix)
   6694 36 01         [10] 4370 	ld	(hl),#0x01
   6696 C3 82 68      [10] 4371 	jp	00135$
   6699                    4372 00118$:
                           4373 ;src/CalcColision.h:72: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   6699 DD 7E F3      [19] 4374 	ld	a,-13 (ix)
   669C D6 09         [ 7] 4375 	sub	a, #0x09
   669E CA 20 68      [10] 4376 	jp	Z,00112$
                           4377 ;src/CalcColision.h:73: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   66A1 DD 7E F6      [19] 4378 	ld	a,-10 (ix)
   66A4 DD 77 EF      [19] 4379 	ld	-17 (ix),a
   66A7 DD 7E F7      [19] 4380 	ld	a,-9 (ix)
   66AA DD 77 F0      [19] 4381 	ld	-16 (ix),a
   66AD DD 7E ED      [19] 4382 	ld	a,-19 (ix)
   66B0 B7            [ 4] 4383 	or	a, a
   66B1 28 0C         [12] 4384 	jr	Z,00149$
   66B3 DD 7E FB      [19] 4385 	ld	a,-5 (ix)
   66B6 DD 77 EF      [19] 4386 	ld	-17 (ix),a
   66B9 DD 7E FC      [19] 4387 	ld	a,-4 (ix)
   66BC DD 77 F0      [19] 4388 	ld	-16 (ix),a
   66BF                    4389 00149$:
   66BF DD CB F0 2E   [23] 4390 	sra	-16 (ix)
   66C3 DD CB EF 1E   [23] 4391 	rr	-17 (ix)
   66C7 DD CB F0 2E   [23] 4392 	sra	-16 (ix)
   66CB DD CB EF 1E   [23] 4393 	rr	-17 (ix)
   66CF DD 7E EF      [19] 4394 	ld	a,-17 (ix)
   66D2 DD 86 F9      [19] 4395 	add	a, -7 (ix)
   66D5 DD 77 EF      [19] 4396 	ld	-17 (ix),a
   66D8 DD 7E F0      [19] 4397 	ld	a,-16 (ix)
   66DB DD 8E FA      [19] 4398 	adc	a, -6 (ix)
   66DE DD 77 F0      [19] 4399 	ld	-16 (ix),a
   66E1 DD 6E EF      [19] 4400 	ld	l,-17 (ix)
   66E4 DD 66 F0      [19] 4401 	ld	h,-16 (ix)
   66E7 7E            [ 7] 4402 	ld	a,(hl)
   66E8 DD 77 F8      [19] 4403 	ld	-8 (ix), a
   66EB D6 09         [ 7] 4404 	sub	a, #0x09
   66ED CA 20 68      [10] 4405 	jp	Z,00112$
                           4406 ;src/CalcColision.h:74: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   66F0 DD 7E F1      [19] 4407 	ld	a,-15 (ix)
   66F3 DD 77 EF      [19] 4408 	ld	-17 (ix),a
   66F6 DD 7E F2      [19] 4409 	ld	a,-14 (ix)
   66F9 DD 77 F0      [19] 4410 	ld	-16 (ix),a
   66FC DD 7E EE      [19] 4411 	ld	a,-18 (ix)
   66FF B7            [ 4] 4412 	or	a, a
   6700 28 0C         [12] 4413 	jr	Z,00150$
   6702 DD 7E FD      [19] 4414 	ld	a,-3 (ix)
   6705 DD 77 EF      [19] 4415 	ld	-17 (ix),a
   6708 DD 7E FE      [19] 4416 	ld	a,-2 (ix)
   670B DD 77 F0      [19] 4417 	ld	-16 (ix),a
   670E                    4418 00150$:
   670E DD CB F0 2E   [23] 4419 	sra	-16 (ix)
   6712 DD CB EF 1E   [23] 4420 	rr	-17 (ix)
   6716 DD CB F0 2E   [23] 4421 	sra	-16 (ix)
   671A DD CB EF 1E   [23] 4422 	rr	-17 (ix)
   671E DD CB F0 2E   [23] 4423 	sra	-16 (ix)
   6722 DD CB EF 1E   [23] 4424 	rr	-17 (ix)
   6726 DD CB F0 2E   [23] 4425 	sra	-16 (ix)
   672A DD CB EF 1E   [23] 4426 	rr	-17 (ix)
   672E DD 4E EF      [19] 4427 	ld	c,-17 (ix)
   6731 DD 46 F0      [19] 4428 	ld	b,-16 (ix)
   6734 69            [ 4] 4429 	ld	l, c
   6735 60            [ 4] 4430 	ld	h, b
   6736 29            [11] 4431 	add	hl, hl
   6737 29            [11] 4432 	add	hl, hl
   6738 09            [11] 4433 	add	hl, bc
   6739 29            [11] 4434 	add	hl, hl
   673A 29            [11] 4435 	add	hl, hl
   673B DD 75 EF      [19] 4436 	ld	-17 (ix),l
   673E DD 74 F0      [19] 4437 	ld	-16 (ix),h
   6741 DD 7E EF      [19] 4438 	ld	a,-17 (ix)
   6744 C6 DE         [ 7] 4439 	add	a, #<(_scene)
   6746 DD 77 EF      [19] 4440 	ld	-17 (ix),a
   6749 DD 7E F0      [19] 4441 	ld	a,-16 (ix)
   674C CE 8F         [ 7] 4442 	adc	a, #>(_scene)
   674E DD 77 F0      [19] 4443 	ld	-16 (ix),a
   6751 DD 7E EF      [19] 4444 	ld	a,-17 (ix)
   6754 DD 86 FF      [19] 4445 	add	a, -1 (ix)
   6757 DD 77 EF      [19] 4446 	ld	-17 (ix),a
   675A DD 7E F0      [19] 4447 	ld	a,-16 (ix)
   675D CE 00         [ 7] 4448 	adc	a, #0x00
   675F DD 77 F0      [19] 4449 	ld	-16 (ix),a
   6762 DD 6E EF      [19] 4450 	ld	l,-17 (ix)
   6765 DD 66 F0      [19] 4451 	ld	h,-16 (ix)
   6768 7E            [ 7] 4452 	ld	a,(hl)
   6769 DD 77 F8      [19] 4453 	ld	-8 (ix), a
   676C D6 09         [ 7] 4454 	sub	a, #0x09
   676E CA 20 68      [10] 4455 	jp	Z,00112$
                           4456 ;src/CalcColision.h:75: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   6771 DD 7E F1      [19] 4457 	ld	a,-15 (ix)
   6774 DD 77 EF      [19] 4458 	ld	-17 (ix),a
   6777 DD 7E F2      [19] 4459 	ld	a,-14 (ix)
   677A DD 77 F0      [19] 4460 	ld	-16 (ix),a
   677D DD 7E EE      [19] 4461 	ld	a,-18 (ix)
   6780 B7            [ 4] 4462 	or	a, a
   6781 28 0C         [12] 4463 	jr	Z,00151$
   6783 DD 7E FD      [19] 4464 	ld	a,-3 (ix)
   6786 DD 77 EF      [19] 4465 	ld	-17 (ix),a
   6789 DD 7E FE      [19] 4466 	ld	a,-2 (ix)
   678C DD 77 F0      [19] 4467 	ld	-16 (ix),a
   678F                    4468 00151$:
   678F DD CB F0 2E   [23] 4469 	sra	-16 (ix)
   6793 DD CB EF 1E   [23] 4470 	rr	-17 (ix)
   6797 DD CB F0 2E   [23] 4471 	sra	-16 (ix)
   679B DD CB EF 1E   [23] 4472 	rr	-17 (ix)
   679F DD CB F0 2E   [23] 4473 	sra	-16 (ix)
   67A3 DD CB EF 1E   [23] 4474 	rr	-17 (ix)
   67A7 DD CB F0 2E   [23] 4475 	sra	-16 (ix)
   67AB DD CB EF 1E   [23] 4476 	rr	-17 (ix)
   67AF DD 4E EF      [19] 4477 	ld	c,-17 (ix)
   67B2 DD 46 F0      [19] 4478 	ld	b,-16 (ix)
   67B5 69            [ 4] 4479 	ld	l, c
   67B6 60            [ 4] 4480 	ld	h, b
   67B7 29            [11] 4481 	add	hl, hl
   67B8 29            [11] 4482 	add	hl, hl
   67B9 09            [11] 4483 	add	hl, bc
   67BA 29            [11] 4484 	add	hl, hl
   67BB 29            [11] 4485 	add	hl, hl
   67BC DD 75 EF      [19] 4486 	ld	-17 (ix),l
   67BF DD 74 F0      [19] 4487 	ld	-16 (ix),h
   67C2 3E DE         [ 7] 4488 	ld	a,#<(_scene)
   67C4 DD 86 EF      [19] 4489 	add	a, -17 (ix)
   67C7 DD 77 EF      [19] 4490 	ld	-17 (ix),a
   67CA 3E 8F         [ 7] 4491 	ld	a,#>(_scene)
   67CC DD 8E F0      [19] 4492 	adc	a, -16 (ix)
   67CF DD 77 F0      [19] 4493 	ld	-16 (ix),a
   67D2 DD 7E F6      [19] 4494 	ld	a,-10 (ix)
   67D5 DD 77 F4      [19] 4495 	ld	-12 (ix),a
   67D8 DD 7E F7      [19] 4496 	ld	a,-9 (ix)
   67DB DD 77 F5      [19] 4497 	ld	-11 (ix),a
   67DE DD 7E ED      [19] 4498 	ld	a,-19 (ix)
   67E1 B7            [ 4] 4499 	or	a, a
   67E2 28 0C         [12] 4500 	jr	Z,00152$
   67E4 DD 7E FB      [19] 4501 	ld	a,-5 (ix)
   67E7 DD 77 F4      [19] 4502 	ld	-12 (ix),a
   67EA DD 7E FC      [19] 4503 	ld	a,-4 (ix)
   67ED DD 77 F5      [19] 4504 	ld	-11 (ix),a
   67F0                    4505 00152$:
   67F0 DD CB F5 2E   [23] 4506 	sra	-11 (ix)
   67F4 DD CB F4 1E   [23] 4507 	rr	-12 (ix)
   67F8 DD CB F5 2E   [23] 4508 	sra	-11 (ix)
   67FC DD CB F4 1E   [23] 4509 	rr	-12 (ix)
   6800 DD 7E F4      [19] 4510 	ld	a,-12 (ix)
   6803 DD 86 EF      [19] 4511 	add	a, -17 (ix)
   6806 DD 77 EF      [19] 4512 	ld	-17 (ix),a
   6809 DD 7E F5      [19] 4513 	ld	a,-11 (ix)
   680C DD 8E F0      [19] 4514 	adc	a, -16 (ix)
   680F DD 77 F0      [19] 4515 	ld	-16 (ix),a
   6812 DD 6E EF      [19] 4516 	ld	l,-17 (ix)
   6815 DD 66 F0      [19] 4517 	ld	h,-16 (ix)
   6818 7E            [ 7] 4518 	ld	a,(hl)
   6819 DD 77 F8      [19] 4519 	ld	-8 (ix), a
   681C D6 09         [ 7] 4520 	sub	a, #0x09
   681E 20 62         [12] 4521 	jr	NZ,00135$
   6820                    4522 00112$:
                           4523 ;src/CalcColision.h:78: if(enemy.life == 0){
   6820 3A F7 90      [13] 4524 	ld	a, (#(_enemy + 0x0008) + 0)
   6823 B7            [ 4] 4525 	or	a, a
   6824 20 4F         [12] 4526 	jr	NZ,00110$
                           4527 ;src/CalcColision.h:79: map+=1;
   6826 21 CF 90      [10] 4528 	ld	hl, #_map+0
   6829 34            [11] 4529 	inc	(hl)
                           4530 ;src/CalcColision.h:80: if(map > maps){
   682A 3E 04         [ 7] 4531 	ld	a,#0x04
   682C FD 21 CF 90   [14] 4532 	ld	iy,#_map
   6830 FD 96 00      [19] 4533 	sub	a, 0 (iy)
   6833 30 0A         [12] 4534 	jr	NC,00108$
                           4535 ;src/CalcColision.h:81: endGame();
   6835 CD 6B 4E      [17] 4536 	call	_endGame
                           4537 ;src/CalcColision.h:82: finish = 1;
   6838 21 D1 90      [10] 4538 	ld	hl,#_finish + 0
   683B 36 01         [10] 4539 	ld	(hl), #0x01
                           4540 ;src/CalcColision.h:83: return;
   683D 18 43         [12] 4541 	jr	00135$
   683F                    4542 00108$:
                           4543 ;src/CalcColision.h:86: initVariables(map);
   683F 3A CF 90      [13] 4544 	ld	a,(_map)
   6842 F5            [11] 4545 	push	af
   6843 33            [ 6] 4546 	inc	sp
   6844 CD 3F 4E      [17] 4547 	call	_initVariables
   6847 33            [ 6] 4548 	inc	sp
                           4549 ;src/CalcColision.h:87: restartPlayer(map);
   6848 3A CF 90      [13] 4550 	ld	a,(_map)
   684B F5            [11] 4551 	push	af
   684C 33            [ 6] 4552 	inc	sp
   684D CD 8B 4D      [17] 4553 	call	_restartPlayer
   6850 33            [ 6] 4554 	inc	sp
                           4555 ;src/CalcColision.h:88: initNivel();
   6851 CD 2F 4E      [17] 4556 	call	_initNivel
                           4557 ;src/CalcColision.h:89: initEnemies(map);
   6854 3A CF 90      [13] 4558 	ld	a,(_map)
   6857 F5            [11] 4559 	push	af
   6858 33            [ 6] 4560 	inc	sp
   6859 CD CB 4D      [17] 4561 	call	_initEnemies
   685C 33            [ 6] 4562 	inc	sp
                           4563 ;src/CalcColision.h:91: cpct_clearScreen(0);
   685D 21 00 40      [10] 4564 	ld	hl,#0x4000
   6860 E5            [11] 4565 	push	hl
   6861 AF            [ 4] 4566 	xor	a, a
   6862 F5            [11] 4567 	push	af
   6863 33            [ 6] 4568 	inc	sp
   6864 26 C0         [ 7] 4569 	ld	h, #0xC0
   6866 E5            [11] 4570 	push	hl
   6867 CD F5 8D      [17] 4571 	call	_cpct_memset
                           4572 ;src/CalcColision.h:93: drawMap(map);
   686A 3A CF 90      [13] 4573 	ld	a,(_map)
   686D F5            [11] 4574 	push	af
   686E 33            [ 6] 4575 	inc	sp
   686F CD BC 51      [17] 4576 	call	_drawMap
   6872 33            [ 6] 4577 	inc	sp
   6873 18 0D         [12] 4578 	jr	00135$
   6875                    4579 00110$:
                           4580 ;src/CalcColision.h:95: player.x=player.lx;
   6875 3A E6 90      [13] 4581 	ld	a, (#(_player + 0x0002) + 0)
   6878 21 E4 90      [10] 4582 	ld	hl,#_player
   687B 77            [ 7] 4583 	ld	(hl),a
                           4584 ;src/CalcColision.h:96: player.y=player.ly;
   687C 3A E7 90      [13] 4585 	ld	a, (#(_player + 0x0003) + 0)
   687F 32 E5 90      [13] 4586 	ld	(#(_player + 0x0001)),a
   6882                    4587 00135$:
   6882 DD F9         [10] 4588 	ld	sp, ix
   6884 DD E1         [14] 4589 	pop	ix
   6886 C9            [10] 4590 	ret
                           4591 ;src/CalcColision.h:102: u8 checkArrowCollisions(){
                           4592 ;	---------------------------------
                           4593 ; Function checkArrowCollisions
                           4594 ; ---------------------------------
   6887                    4595 _checkArrowCollisions::
   6887 DD E5         [15] 4596 	push	ix
   6889 DD 21 00 00   [14] 4597 	ld	ix,#0
   688D DD 39         [15] 4598 	add	ix,sp
   688F 21 F2 FF      [10] 4599 	ld	hl,#-14
   6892 39            [11] 4600 	add	hl,sp
   6893 F9            [ 6] 4601 	ld	sp,hl
                           4602 ;src/CalcColision.h:105: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   6894 3A DB 90      [13] 4603 	ld	a,(#(_object + 0x0001) + 0)
   6897 DD 77 F3      [19] 4604 	ld	-13 (ix), a
   689A 07            [ 4] 4605 	rlca
   689B 07            [ 4] 4606 	rlca
   689C 07            [ 4] 4607 	rlca
   689D 07            [ 4] 4608 	rlca
   689E E6 0F         [ 7] 4609 	and	a,#0x0F
   68A0 4F            [ 4] 4610 	ld	c,a
   68A1 06 00         [ 7] 4611 	ld	b,#0x00
   68A3 69            [ 4] 4612 	ld	l, c
   68A4 60            [ 4] 4613 	ld	h, b
   68A5 29            [11] 4614 	add	hl, hl
   68A6 29            [11] 4615 	add	hl, hl
   68A7 09            [11] 4616 	add	hl, bc
   68A8 29            [11] 4617 	add	hl, hl
   68A9 29            [11] 4618 	add	hl, hl
   68AA 3E DE         [ 7] 4619 	ld	a,#<(_scene)
   68AC 85            [ 4] 4620 	add	a, l
   68AD DD 77 F6      [19] 4621 	ld	-10 (ix),a
   68B0 3E 8F         [ 7] 4622 	ld	a,#>(_scene)
   68B2 8C            [ 4] 4623 	adc	a, h
   68B3 DD 77 F7      [19] 4624 	ld	-9 (ix),a
   68B6 21 DA 90      [10] 4625 	ld	hl, #_object + 0
   68B9 4E            [ 7] 4626 	ld	c,(hl)
   68BA 79            [ 4] 4627 	ld	a,c
   68BB 0F            [ 4] 4628 	rrca
   68BC 0F            [ 4] 4629 	rrca
   68BD E6 3F         [ 7] 4630 	and	a,#0x3F
   68BF DD 77 F2      [19] 4631 	ld	-14 (ix), a
   68C2 DD 86 F6      [19] 4632 	add	a, -10 (ix)
   68C5 6F            [ 4] 4633 	ld	l,a
   68C6 3E 00         [ 7] 4634 	ld	a,#0x00
   68C8 DD 8E F7      [19] 4635 	adc	a, -9 (ix)
   68CB 67            [ 4] 4636 	ld	h,a
   68CC 7E            [ 7] 4637 	ld	a,(hl)
                           4638 ;src/CalcColision.h:110: object.x=object.lx;
                           4639 ;src/CalcColision.h:111: object.y=object.ly;
                           4640 ;src/CalcColision.h:105: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   68CD DD 77 F4      [19] 4641 	ld	-12 (ix), a
   68D0 3D            [ 4] 4642 	dec	a
   68D1 CA F0 69      [10] 4643 	jp	Z,00101$
                           4644 ;src/CalcColision.h:106: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   68D4 06 00         [ 7] 4645 	ld	b,#0x00
   68D6 21 03 00      [10] 4646 	ld	hl,#0x0003
   68D9 09            [11] 4647 	add	hl,bc
   68DA DD 75 FC      [19] 4648 	ld	-4 (ix),l
   68DD DD 74 FD      [19] 4649 	ld	-3 (ix),h
   68E0 DD 7E FC      [19] 4650 	ld	a,-4 (ix)
   68E3 DD 77 FA      [19] 4651 	ld	-6 (ix),a
   68E6 DD 7E FD      [19] 4652 	ld	a,-3 (ix)
   68E9 DD 77 FB      [19] 4653 	ld	-5 (ix),a
   68EC DD 7E FD      [19] 4654 	ld	a,-3 (ix)
   68EF 07            [ 4] 4655 	rlca
   68F0 E6 01         [ 7] 4656 	and	a,#0x01
   68F2 DD 77 F5      [19] 4657 	ld	-11 (ix),a
   68F5 21 06 00      [10] 4658 	ld	hl,#0x0006
   68F8 09            [11] 4659 	add	hl,bc
   68F9 DD 75 FE      [19] 4660 	ld	-2 (ix),l
   68FC DD 74 FF      [19] 4661 	ld	-1 (ix),h
   68FF DD 7E F5      [19] 4662 	ld	a,-11 (ix)
   6902 B7            [ 4] 4663 	or	a, a
   6903 28 0C         [12] 4664 	jr	Z,00113$
   6905 DD 7E FE      [19] 4665 	ld	a,-2 (ix)
   6908 DD 77 FA      [19] 4666 	ld	-6 (ix),a
   690B DD 7E FF      [19] 4667 	ld	a,-1 (ix)
   690E DD 77 FB      [19] 4668 	ld	-5 (ix),a
   6911                    4669 00113$:
   6911 DD 6E FA      [19] 4670 	ld	l,-6 (ix)
   6914 DD 66 FB      [19] 4671 	ld	h,-5 (ix)
   6917 CB 2C         [ 8] 4672 	sra	h
   6919 CB 1D         [ 8] 4673 	rr	l
   691B CB 2C         [ 8] 4674 	sra	h
   691D CB 1D         [ 8] 4675 	rr	l
   691F DD 5E F6      [19] 4676 	ld	e,-10 (ix)
   6922 DD 56 F7      [19] 4677 	ld	d,-9 (ix)
   6925 19            [11] 4678 	add	hl,de
   6926 7E            [ 7] 4679 	ld	a,(hl)
   6927 3D            [ 4] 4680 	dec	a
   6928 CA F0 69      [10] 4681 	jp	Z,00101$
                           4682 ;src/CalcColision.h:107: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 1
   692B DD 5E F3      [19] 4683 	ld	e,-13 (ix)
   692E 16 00         [ 7] 4684 	ld	d,#0x00
   6930 21 06 00      [10] 4685 	ld	hl,#0x0006
   6933 19            [11] 4686 	add	hl,de
   6934 4D            [ 4] 4687 	ld	c,l
   6935 44            [ 4] 4688 	ld	b,h
   6936 DD 71 FA      [19] 4689 	ld	-6 (ix),c
   6939 DD 70 FB      [19] 4690 	ld	-5 (ix),b
   693C 78            [ 4] 4691 	ld	a,b
   693D 07            [ 4] 4692 	rlca
   693E E6 01         [ 7] 4693 	and	a,#0x01
   6940 DD 77 F3      [19] 4694 	ld	-13 (ix),a
   6943 21 15 00      [10] 4695 	ld	hl,#0x0015
   6946 19            [11] 4696 	add	hl,de
   6947 DD 75 F8      [19] 4697 	ld	-8 (ix),l
   694A DD 74 F9      [19] 4698 	ld	-7 (ix),h
   694D DD 7E F3      [19] 4699 	ld	a,-13 (ix)
   6950 B7            [ 4] 4700 	or	a, a
   6951 28 0C         [12] 4701 	jr	Z,00114$
   6953 DD 7E F8      [19] 4702 	ld	a,-8 (ix)
   6956 DD 77 FA      [19] 4703 	ld	-6 (ix),a
   6959 DD 7E F9      [19] 4704 	ld	a,-7 (ix)
   695C DD 77 FB      [19] 4705 	ld	-5 (ix),a
   695F                    4706 00114$:
   695F DD 6E FA      [19] 4707 	ld	l,-6 (ix)
   6962 DD 66 FB      [19] 4708 	ld	h,-5 (ix)
   6965 CB 2C         [ 8] 4709 	sra	h
   6967 CB 1D         [ 8] 4710 	rr	l
   6969 CB 2C         [ 8] 4711 	sra	h
   696B CB 1D         [ 8] 4712 	rr	l
   696D CB 2C         [ 8] 4713 	sra	h
   696F CB 1D         [ 8] 4714 	rr	l
   6971 CB 2C         [ 8] 4715 	sra	h
   6973 CB 1D         [ 8] 4716 	rr	l
   6975 5D            [ 4] 4717 	ld	e, l
   6976 54            [ 4] 4718 	ld	d, h
   6977 29            [11] 4719 	add	hl, hl
   6978 29            [11] 4720 	add	hl, hl
   6979 19            [11] 4721 	add	hl, de
   697A 29            [11] 4722 	add	hl, hl
   697B 29            [11] 4723 	add	hl, hl
   697C 11 DE 8F      [10] 4724 	ld	de,#_scene
   697F 19            [11] 4725 	add	hl,de
   6980 DD 5E F2      [19] 4726 	ld	e,-14 (ix)
   6983 16 00         [ 7] 4727 	ld	d,#0x00
   6985 19            [11] 4728 	add	hl,de
   6986 7E            [ 7] 4729 	ld	a,(hl)
   6987 3D            [ 4] 4730 	dec	a
   6988 28 66         [12] 4731 	jr	Z,00101$
                           4732 ;src/CalcColision.h:108: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   698A DD 71 FA      [19] 4733 	ld	-6 (ix),c
   698D DD 70 FB      [19] 4734 	ld	-5 (ix),b
   6990 DD 7E F3      [19] 4735 	ld	a,-13 (ix)
   6993 B7            [ 4] 4736 	or	a, a
   6994 28 0C         [12] 4737 	jr	Z,00115$
   6996 DD 7E F8      [19] 4738 	ld	a,-8 (ix)
   6999 DD 77 FA      [19] 4739 	ld	-6 (ix),a
   699C DD 7E F9      [19] 4740 	ld	a,-7 (ix)
   699F DD 77 FB      [19] 4741 	ld	-5 (ix),a
   69A2                    4742 00115$:
   69A2 DD 6E FA      [19] 4743 	ld	l,-6 (ix)
   69A5 DD 66 FB      [19] 4744 	ld	h,-5 (ix)
   69A8 CB 2C         [ 8] 4745 	sra	h
   69AA CB 1D         [ 8] 4746 	rr	l
   69AC CB 2C         [ 8] 4747 	sra	h
   69AE CB 1D         [ 8] 4748 	rr	l
   69B0 CB 2C         [ 8] 4749 	sra	h
   69B2 CB 1D         [ 8] 4750 	rr	l
   69B4 CB 2C         [ 8] 4751 	sra	h
   69B6 CB 1D         [ 8] 4752 	rr	l
   69B8 5D            [ 4] 4753 	ld	e, l
   69B9 54            [ 4] 4754 	ld	d, h
   69BA 29            [11] 4755 	add	hl, hl
   69BB 29            [11] 4756 	add	hl, hl
   69BC 19            [11] 4757 	add	hl, de
   69BD 29            [11] 4758 	add	hl, hl
   69BE 29            [11] 4759 	add	hl, hl
   69BF 3E DE         [ 7] 4760 	ld	a,#<(_scene)
   69C1 85            [ 4] 4761 	add	a, l
   69C2 DD 77 FA      [19] 4762 	ld	-6 (ix),a
   69C5 3E 8F         [ 7] 4763 	ld	a,#>(_scene)
   69C7 8C            [ 4] 4764 	adc	a, h
   69C8 DD 77 FB      [19] 4765 	ld	-5 (ix),a
   69CB DD 6E FC      [19] 4766 	ld	l,-4 (ix)
   69CE DD 66 FD      [19] 4767 	ld	h,-3 (ix)
   69D1 DD 7E F5      [19] 4768 	ld	a,-11 (ix)
   69D4 B7            [ 4] 4769 	or	a, a
   69D5 28 06         [12] 4770 	jr	Z,00116$
   69D7 DD 6E FE      [19] 4771 	ld	l,-2 (ix)
   69DA DD 66 FF      [19] 4772 	ld	h,-1 (ix)
   69DD                    4773 00116$:
   69DD CB 2C         [ 8] 4774 	sra	h
   69DF CB 1D         [ 8] 4775 	rr	l
   69E1 CB 2C         [ 8] 4776 	sra	h
   69E3 CB 1D         [ 8] 4777 	rr	l
   69E5 DD 5E FA      [19] 4778 	ld	e,-6 (ix)
   69E8 DD 56 FB      [19] 4779 	ld	d,-5 (ix)
   69EB 19            [11] 4780 	add	hl,de
   69EC 7E            [ 7] 4781 	ld	a,(hl)
   69ED 3D            [ 4] 4782 	dec	a
   69EE 20 11         [12] 4783 	jr	NZ,00102$
   69F0                    4784 00101$:
                           4785 ;src/CalcColision.h:110: object.x=object.lx;
   69F0 3A DC 90      [13] 4786 	ld	a, (#(_object + 0x0002) + 0)
   69F3 32 DA 90      [13] 4787 	ld	(#_object),a
                           4788 ;src/CalcColision.h:111: object.y=object.ly;
   69F6 3A DD 90      [13] 4789 	ld	a, (#(_object + 0x0003) + 0)
   69F9 32 DB 90      [13] 4790 	ld	(#(_object + 0x0001)),a
                           4791 ;src/CalcColision.h:113: return bound;
   69FC 2E 01         [ 7] 4792 	ld	l,#0x01
   69FE C3 CB 6A      [10] 4793 	jp	00111$
   6A01                    4794 00102$:
                           4795 ;src/CalcColision.h:116: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 9
   6A01 DD 7E F4      [19] 4796 	ld	a,-12 (ix)
   6A04 D6 09         [ 7] 4797 	sub	a, #0x09
   6A06 CA B9 6A      [10] 4798 	jp	Z,00106$
                           4799 ;src/CalcColision.h:117: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   6A09 DD 6E FC      [19] 4800 	ld	l,-4 (ix)
   6A0C DD 66 FD      [19] 4801 	ld	h,-3 (ix)
   6A0F DD 7E F5      [19] 4802 	ld	a,-11 (ix)
   6A12 B7            [ 4] 4803 	or	a, a
   6A13 28 06         [12] 4804 	jr	Z,00117$
   6A15 DD 6E FE      [19] 4805 	ld	l,-2 (ix)
   6A18 DD 66 FF      [19] 4806 	ld	h,-1 (ix)
   6A1B                    4807 00117$:
   6A1B CB 2C         [ 8] 4808 	sra	h
   6A1D CB 1D         [ 8] 4809 	rr	l
   6A1F CB 2C         [ 8] 4810 	sra	h
   6A21 CB 1D         [ 8] 4811 	rr	l
   6A23 DD 5E F6      [19] 4812 	ld	e,-10 (ix)
   6A26 DD 56 F7      [19] 4813 	ld	d,-9 (ix)
   6A29 19            [11] 4814 	add	hl,de
   6A2A 7E            [ 7] 4815 	ld	a,(hl)
   6A2B D6 09         [ 7] 4816 	sub	a, #0x09
   6A2D CA B9 6A      [10] 4817 	jp	Z,00106$
                           4818 ;src/CalcColision.h:118: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 9
   6A30 69            [ 4] 4819 	ld	l, c
   6A31 60            [ 4] 4820 	ld	h, b
   6A32 DD 7E F3      [19] 4821 	ld	a,-13 (ix)
   6A35 B7            [ 4] 4822 	or	a, a
   6A36 28 06         [12] 4823 	jr	Z,00118$
   6A38 DD 6E F8      [19] 4824 	ld	l,-8 (ix)
   6A3B DD 66 F9      [19] 4825 	ld	h,-7 (ix)
   6A3E                    4826 00118$:
   6A3E CB 2C         [ 8] 4827 	sra	h
   6A40 CB 1D         [ 8] 4828 	rr	l
   6A42 CB 2C         [ 8] 4829 	sra	h
   6A44 CB 1D         [ 8] 4830 	rr	l
   6A46 CB 2C         [ 8] 4831 	sra	h
   6A48 CB 1D         [ 8] 4832 	rr	l
   6A4A CB 2C         [ 8] 4833 	sra	h
   6A4C CB 1D         [ 8] 4834 	rr	l
   6A4E 5D            [ 4] 4835 	ld	e, l
   6A4F 54            [ 4] 4836 	ld	d, h
   6A50 29            [11] 4837 	add	hl, hl
   6A51 29            [11] 4838 	add	hl, hl
   6A52 19            [11] 4839 	add	hl, de
   6A53 29            [11] 4840 	add	hl, hl
   6A54 29            [11] 4841 	add	hl, hl
   6A55 11 DE 8F      [10] 4842 	ld	de,#_scene
   6A58 19            [11] 4843 	add	hl,de
   6A59 DD 5E F2      [19] 4844 	ld	e,-14 (ix)
   6A5C 16 00         [ 7] 4845 	ld	d,#0x00
   6A5E 19            [11] 4846 	add	hl,de
   6A5F 7E            [ 7] 4847 	ld	a,(hl)
   6A60 D6 09         [ 7] 4848 	sub	a, #0x09
   6A62 28 55         [12] 4849 	jr	Z,00106$
                           4850 ;src/CalcColision.h:119: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   6A64 DD 7E F3      [19] 4851 	ld	a,-13 (ix)
   6A67 B7            [ 4] 4852 	or	a, a
   6A68 28 06         [12] 4853 	jr	Z,00119$
   6A6A DD 4E F8      [19] 4854 	ld	c,-8 (ix)
   6A6D DD 46 F9      [19] 4855 	ld	b,-7 (ix)
   6A70                    4856 00119$:
   6A70 CB 28         [ 8] 4857 	sra	b
   6A72 CB 19         [ 8] 4858 	rr	c
   6A74 CB 28         [ 8] 4859 	sra	b
   6A76 CB 19         [ 8] 4860 	rr	c
   6A78 CB 28         [ 8] 4861 	sra	b
   6A7A CB 19         [ 8] 4862 	rr	c
   6A7C CB 28         [ 8] 4863 	sra	b
   6A7E CB 19         [ 8] 4864 	rr	c
   6A80 69            [ 4] 4865 	ld	l, c
   6A81 60            [ 4] 4866 	ld	h, b
   6A82 29            [11] 4867 	add	hl, hl
   6A83 29            [11] 4868 	add	hl, hl
   6A84 09            [11] 4869 	add	hl, bc
   6A85 29            [11] 4870 	add	hl, hl
   6A86 29            [11] 4871 	add	hl, hl
   6A87 3E DE         [ 7] 4872 	ld	a,#<(_scene)
   6A89 85            [ 4] 4873 	add	a, l
   6A8A DD 77 F8      [19] 4874 	ld	-8 (ix),a
   6A8D 3E 8F         [ 7] 4875 	ld	a,#>(_scene)
   6A8F 8C            [ 4] 4876 	adc	a, h
   6A90 DD 77 F9      [19] 4877 	ld	-7 (ix),a
   6A93 DD 6E FC      [19] 4878 	ld	l,-4 (ix)
   6A96 DD 66 FD      [19] 4879 	ld	h,-3 (ix)
   6A99 DD 7E F5      [19] 4880 	ld	a,-11 (ix)
   6A9C B7            [ 4] 4881 	or	a, a
   6A9D 28 06         [12] 4882 	jr	Z,00120$
   6A9F DD 6E FE      [19] 4883 	ld	l,-2 (ix)
   6AA2 DD 66 FF      [19] 4884 	ld	h,-1 (ix)
   6AA5                    4885 00120$:
   6AA5 CB 2C         [ 8] 4886 	sra	h
   6AA7 CB 1D         [ 8] 4887 	rr	l
   6AA9 CB 2C         [ 8] 4888 	sra	h
   6AAB CB 1D         [ 8] 4889 	rr	l
   6AAD DD 5E F8      [19] 4890 	ld	e,-8 (ix)
   6AB0 DD 56 F9      [19] 4891 	ld	d,-7 (ix)
   6AB3 19            [11] 4892 	add	hl,de
   6AB4 7E            [ 7] 4893 	ld	a,(hl)
   6AB5 D6 09         [ 7] 4894 	sub	a, #0x09
   6AB7 20 10         [12] 4895 	jr	NZ,00107$
   6AB9                    4896 00106$:
                           4897 ;src/CalcColision.h:121: object.x=object.lx;
   6AB9 3A DC 90      [13] 4898 	ld	a, (#(_object + 0x0002) + 0)
   6ABC 32 DA 90      [13] 4899 	ld	(#_object),a
                           4900 ;src/CalcColision.h:122: object.y=object.ly;
   6ABF 3A DD 90      [13] 4901 	ld	a, (#(_object + 0x0003) + 0)
   6AC2 32 DB 90      [13] 4902 	ld	(#(_object + 0x0001)),a
                           4903 ;src/CalcColision.h:124: return bound;
   6AC5 2E 01         [ 7] 4904 	ld	l,#0x01
   6AC7 18 02         [12] 4905 	jr	00111$
   6AC9                    4906 00107$:
                           4907 ;src/CalcColision.h:127: return bound;
   6AC9 2E 00         [ 7] 4908 	ld	l,#0x00
   6ACB                    4909 00111$:
   6ACB DD F9         [10] 4910 	ld	sp, ix
   6ACD DD E1         [14] 4911 	pop	ix
   6ACF C9            [10] 4912 	ret
                           4913 ;src/keyboard.h:13: u8* checkKeyboard(){
                           4914 ;	---------------------------------
                           4915 ; Function checkKeyboard
                           4916 ; ---------------------------------
   6AD0                    4917 _checkKeyboard::
   6AD0 DD E5         [15] 4918 	push	ix
   6AD2 DD 21 00 00   [14] 4919 	ld	ix,#0
   6AD6 DD 39         [15] 4920 	add	ix,sp
   6AD8 21 FA FF      [10] 4921 	ld	hl,#-6
   6ADB 39            [11] 4922 	add	hl,sp
   6ADC F9            [ 6] 4923 	ld	sp,hl
                           4924 ;src/keyboard.h:14: u8 *s = NULL;
   6ADD DD 36 FE 00   [19] 4925 	ld	-2 (ix),#0x00
   6AE1 DD 36 FF 00   [19] 4926 	ld	-1 (ix),#0x00
                           4927 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   6AE5 21 05 80      [10] 4928 	ld	hl,#0x8005
   6AE8 CD 1A 8B      [17] 4929 	call	_cpct_isKeyPressed
   6AEB 4D            [ 4] 4930 	ld	c,l
   6AEC 79            [ 4] 4931 	ld	a,c
   6AED B7            [ 4] 4932 	or	a, a
   6AEE 28 68         [12] 4933 	jr	Z,00145$
   6AF0 21 EC 90      [10] 4934 	ld	hl, #(_player + 0x0008) + 0
   6AF3 7E            [ 7] 4935 	ld	a,(hl)
   6AF4 DD 77 FB      [19] 4936 	ld	-5 (ix), a
   6AF7 D6 14         [ 7] 4937 	sub	a, #0x14
   6AF9 38 5D         [12] 4938 	jr	C,00145$
                           4939 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   6AFB DD 7E FB      [19] 4940 	ld	a,-5 (ix)
   6AFE D6 32         [ 7] 4941 	sub	a, #0x32
   6B00 38 07         [12] 4942 	jr	C,00102$
   6B02 21 EC 90      [10] 4943 	ld	hl,#(_player + 0x0008)
   6B05 36 00         [10] 4944 	ld	(hl),#0x00
   6B07 18 08         [12] 4945 	jr	00103$
   6B09                    4946 00102$:
                           4947 ;src/keyboard.h:17: else player.atk += 1;
   6B09 DD 7E FB      [19] 4948 	ld	a,-5 (ix)
   6B0C 3C            [ 4] 4949 	inc	a
   6B0D 21 EC 90      [10] 4950 	ld	hl,#(_player + 0x0008)
   6B10 77            [ 7] 4951 	ld	(hl),a
   6B11                    4952 00103$:
                           4953 ;src/keyboard.h:18: switch(player.dir){
   6B11 21 EB 90      [10] 4954 	ld	hl, #_player + 7
   6B14 66            [ 7] 4955 	ld	h,(hl)
   6B15 7C            [ 4] 4956 	ld	a,h
   6B16 D6 02         [ 7] 4957 	sub	a, #0x02
   6B18 28 33         [12] 4958 	jr	Z,00107$
   6B1A 7C            [ 4] 4959 	ld	a,h
   6B1B D6 04         [ 7] 4960 	sub	a, #0x04
   6B1D 28 0D         [12] 4961 	jr	Z,00104$
   6B1F 7C            [ 4] 4962 	ld	a,h
   6B20 D6 06         [ 7] 4963 	sub	a, #0x06
   6B22 28 13         [12] 4964 	jr	Z,00105$
   6B24 7C            [ 4] 4965 	ld	a,h
   6B25 D6 08         [ 7] 4966 	sub	a, #0x08
   6B27 28 19         [12] 4967 	jr	Z,00106$
   6B29 C3 32 6D      [10] 4968 	jp	00146$
                           4969 ;src/keyboard.h:19: case 4:
   6B2C                    4970 00104$:
                           4971 ;src/keyboard.h:20: s = gladis_atk_izda;
   6B2C DD 36 FE 80   [19] 4972 	ld	-2 (ix),#<(_gladis_atk_izda)
   6B30 DD 36 FF 41   [19] 4973 	ld	-1 (ix),#>(_gladis_atk_izda)
                           4974 ;src/keyboard.h:21: break;
   6B34 C3 32 6D      [10] 4975 	jp	00146$
                           4976 ;src/keyboard.h:22: case 6:
   6B37                    4977 00105$:
                           4978 ;src/keyboard.h:23: s = gladis_atk_dcha;
   6B37 DD 36 FE 00   [19] 4979 	ld	-2 (ix),#<(_gladis_atk_dcha)
   6B3B DD 36 FF 41   [19] 4980 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           4981 ;src/keyboard.h:24: break;
   6B3F C3 32 6D      [10] 4982 	jp	00146$
                           4983 ;src/keyboard.h:25: case 8:
   6B42                    4984 00106$:
                           4985 ;src/keyboard.h:26: s = gladis_atk_arriba;
   6B42 DD 36 FE 80   [19] 4986 	ld	-2 (ix),#<(_gladis_atk_arriba)
   6B46 DD 36 FF 43   [19] 4987 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           4988 ;src/keyboard.h:27: break;
   6B4A C3 32 6D      [10] 4989 	jp	00146$
                           4990 ;src/keyboard.h:28: case 2:
   6B4D                    4991 00107$:
                           4992 ;src/keyboard.h:29: s = gladis_atk_abajo;
   6B4D DD 36 FE 00   [19] 4993 	ld	-2 (ix),#<(_gladis_atk_abajo)
   6B51 DD 36 FF 43   [19] 4994 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           4995 ;src/keyboard.h:31: }
   6B55 C3 32 6D      [10] 4996 	jp	00146$
   6B58                    4997 00145$:
                           4998 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   6B58 21 EC 90      [10] 4999 	ld	hl, #(_player + 0x0008) + 0
   6B5B 56            [ 7] 5000 	ld	d,(hl)
   6B5C 7A            [ 4] 5001 	ld	a,d
   6B5D D6 14         [ 7] 5002 	sub	a, #0x14
   6B5F 30 07         [12] 5003 	jr	NC,00110$
   6B61 14            [ 4] 5004 	inc	d
   6B62 21 EC 90      [10] 5005 	ld	hl,#(_player + 0x0008)
   6B65 72            [ 7] 5006 	ld	(hl),d
   6B66 18 05         [12] 5007 	jr	00111$
   6B68                    5008 00110$:
                           5009 ;src/keyboard.h:34: else player.atk = 20;
   6B68 21 EC 90      [10] 5010 	ld	hl,#(_player + 0x0008)
   6B6B 36 14         [10] 5011 	ld	(hl),#0x14
   6B6D                    5012 00111$:
                           5013 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   6B6D 21 00 02      [10] 5014 	ld	hl,#0x0200
   6B70 CD 1A 8B      [17] 5015 	call	_cpct_isKeyPressed
                           5016 ;src/keyboard.h:37: player.dir = 6;
                           5017 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   6B73 7D            [ 4] 5018 	ld	a,l
   6B74 B7            [ 4] 5019 	or	a, a
   6B75 28 1E         [12] 5020 	jr	Z,00141$
   6B77 21 E4 90      [10] 5021 	ld	hl, #_player + 0
   6B7A 56            [ 7] 5022 	ld	d,(hl)
   6B7B 7A            [ 4] 5023 	ld	a,d
   6B7C D6 4C         [ 7] 5024 	sub	a, #0x4C
   6B7E 30 15         [12] 5025 	jr	NC,00141$
                           5026 ;src/keyboard.h:36: player.x += 1;
   6B80 14            [ 4] 5027 	inc	d
   6B81 21 E4 90      [10] 5028 	ld	hl,#_player
   6B84 72            [ 7] 5029 	ld	(hl),d
                           5030 ;src/keyboard.h:37: player.dir = 6;
   6B85 21 EB 90      [10] 5031 	ld	hl,#(_player + 0x0007)
   6B88 36 06         [10] 5032 	ld	(hl),#0x06
                           5033 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   6B8A DD 36 FE 00   [19] 5034 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   6B8E DD 36 FF 40   [19] 5035 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   6B92 C3 32 6D      [10] 5036 	jp	00146$
   6B95                    5037 00141$:
                           5038 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   6B95 21 01 01      [10] 5039 	ld	hl,#0x0101
   6B98 CD 1A 8B      [17] 5040 	call	_cpct_isKeyPressed
   6B9B 7D            [ 4] 5041 	ld	a,l
   6B9C B7            [ 4] 5042 	or	a, a
   6B9D 28 1B         [12] 5043 	jr	Z,00137$
   6B9F 3A E4 90      [13] 5044 	ld	a, (#_player + 0)
   6BA2 B7            [ 4] 5045 	or	a, a
   6BA3 28 15         [12] 5046 	jr	Z,00137$
                           5047 ;src/keyboard.h:40: player.x -= 1;
   6BA5 C6 FF         [ 7] 5048 	add	a,#0xFF
   6BA7 32 E4 90      [13] 5049 	ld	(#_player),a
                           5050 ;src/keyboard.h:41: player.dir = 4;
   6BAA 21 EB 90      [10] 5051 	ld	hl,#(_player + 0x0007)
   6BAD 36 04         [10] 5052 	ld	(hl),#0x04
                           5053 ;src/keyboard.h:42: s = gladis_quieto_izda;
   6BAF DD 36 FE 80   [19] 5054 	ld	-2 (ix),#<(_gladis_quieto_izda)
   6BB3 DD 36 FF 40   [19] 5055 	ld	-1 (ix),#>(_gladis_quieto_izda)
   6BB7 C3 32 6D      [10] 5056 	jp	00146$
   6BBA                    5057 00137$:
                           5058 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   6BBA 21 00 04      [10] 5059 	ld	hl,#0x0400
   6BBD CD 1A 8B      [17] 5060 	call	_cpct_isKeyPressed
   6BC0 7D            [ 4] 5061 	ld	a,l
   6BC1 B7            [ 4] 5062 	or	a, a
   6BC2 28 1F         [12] 5063 	jr	Z,00133$
   6BC4 21 E5 90      [10] 5064 	ld	hl, #(_player + 0x0001) + 0
   6BC7 56            [ 7] 5065 	ld	d,(hl)
   6BC8 7A            [ 4] 5066 	ld	a,d
   6BC9 D6 B4         [ 7] 5067 	sub	a, #0xB4
   6BCB 30 16         [12] 5068 	jr	NC,00133$
                           5069 ;src/keyboard.h:44: player.y += 2;
   6BCD 14            [ 4] 5070 	inc	d
   6BCE 14            [ 4] 5071 	inc	d
   6BCF 21 E5 90      [10] 5072 	ld	hl,#(_player + 0x0001)
   6BD2 72            [ 7] 5073 	ld	(hl),d
                           5074 ;src/keyboard.h:45: player.dir = 2;
   6BD3 21 EB 90      [10] 5075 	ld	hl,#(_player + 0x0007)
   6BD6 36 02         [10] 5076 	ld	(hl),#0x02
                           5077 ;src/keyboard.h:46: s = gladis_abajo;
   6BD8 DD 36 FE 80   [19] 5078 	ld	-2 (ix),#<(_gladis_abajo)
   6BDC DD 36 FF 42   [19] 5079 	ld	-1 (ix),#>(_gladis_abajo)
   6BE0 C3 32 6D      [10] 5080 	jp	00146$
   6BE3                    5081 00133$:
                           5082 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   6BE3 21 00 01      [10] 5083 	ld	hl,#0x0100
   6BE6 CD 1A 8B      [17] 5084 	call	_cpct_isKeyPressed
   6BE9 7D            [ 4] 5085 	ld	a,l
   6BEA B7            [ 4] 5086 	or	a, a
   6BEB 28 1B         [12] 5087 	jr	Z,00129$
   6BED 3A E5 90      [13] 5088 	ld	a, (#(_player + 0x0001) + 0)
   6BF0 B7            [ 4] 5089 	or	a, a
   6BF1 28 15         [12] 5090 	jr	Z,00129$
                           5091 ;src/keyboard.h:48: player.y -= 2;
   6BF3 C6 FE         [ 7] 5092 	add	a,#0xFE
   6BF5 32 E5 90      [13] 5093 	ld	(#(_player + 0x0001)),a
                           5094 ;src/keyboard.h:49: player.dir = 8;
   6BF8 21 EB 90      [10] 5095 	ld	hl,#(_player + 0x0007)
   6BFB 36 08         [10] 5096 	ld	(hl),#0x08
                           5097 ;src/keyboard.h:50: s = gladis_arriba;
   6BFD DD 36 FE 00   [19] 5098 	ld	-2 (ix),#<(_gladis_arriba)
   6C01 DD 36 FF 42   [19] 5099 	ld	-1 (ix),#>(_gladis_arriba)
   6C05 C3 32 6D      [10] 5100 	jp	00146$
   6C08                    5101 00129$:
                           5102 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   6C08 21 07 80      [10] 5103 	ld	hl,#0x8007
   6C0B CD 1A 8B      [17] 5104 	call	_cpct_isKeyPressed
   6C0E 5D            [ 4] 5105 	ld	e,l
                           5106 ;src/keyboard.h:53: switch(player.dir){
   6C0F 21 EB 90      [10] 5107 	ld	hl, #(_player + 0x0007) + 0
   6C12 6E            [ 7] 5108 	ld	l,(hl)
   6C13 7D            [ 4] 5109 	ld	a,l
   6C14 D6 02         [ 7] 5110 	sub	a, #0x02
   6C16 20 04         [12] 5111 	jr	NZ,00272$
   6C18 3E 01         [ 7] 5112 	ld	a,#0x01
   6C1A 18 01         [12] 5113 	jr	00273$
   6C1C                    5114 00272$:
   6C1C AF            [ 4] 5115 	xor	a,a
   6C1D                    5116 00273$:
   6C1D 4F            [ 4] 5117 	ld	c,a
   6C1E 7D            [ 4] 5118 	ld	a,l
   6C1F D6 04         [ 7] 5119 	sub	a, #0x04
   6C21 20 04         [12] 5120 	jr	NZ,00274$
   6C23 3E 01         [ 7] 5121 	ld	a,#0x01
   6C25 18 01         [12] 5122 	jr	00275$
   6C27                    5123 00274$:
   6C27 AF            [ 4] 5124 	xor	a,a
   6C28                    5125 00275$:
   6C28 DD 77 FB      [19] 5126 	ld	-5 (ix),a
   6C2B 7D            [ 4] 5127 	ld	a,l
   6C2C D6 06         [ 7] 5128 	sub	a, #0x06
   6C2E 20 04         [12] 5129 	jr	NZ,00276$
   6C30 3E 01         [ 7] 5130 	ld	a,#0x01
   6C32 18 01         [12] 5131 	jr	00277$
   6C34                    5132 00276$:
   6C34 AF            [ 4] 5133 	xor	a,a
   6C35                    5134 00277$:
   6C35 DD 77 FC      [19] 5135 	ld	-4 (ix),a
   6C38 7D            [ 4] 5136 	ld	a,l
   6C39 D6 08         [ 7] 5137 	sub	a, #0x08
   6C3B 20 04         [12] 5138 	jr	NZ,00278$
   6C3D 3E 01         [ 7] 5139 	ld	a,#0x01
   6C3F 18 01         [12] 5140 	jr	00279$
   6C41                    5141 00278$:
   6C41 AF            [ 4] 5142 	xor	a,a
   6C42                    5143 00279$:
   6C42 DD 77 FD      [19] 5144 	ld	-3 (ix),a
                           5145 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   6C45 7B            [ 4] 5146 	ld	a,e
   6C46 B7            [ 4] 5147 	or	a, a
   6C47 CA F4 6C      [10] 5148 	jp	Z,00123$
   6C4A 3A D2 90      [13] 5149 	ld	a,(#_arrow + 0)
   6C4D B7            [ 4] 5150 	or	a, a
   6C4E C2 F4 6C      [10] 5151 	jp	NZ,00123$
   6C51 3A EC 90      [13] 5152 	ld	a, (#(_player + 0x0008) + 0)
   6C54 D6 14         [ 7] 5153 	sub	a, #0x14
   6C56 C2 F4 6C      [10] 5154 	jp	NZ,00123$
   6C59 3A EE 90      [13] 5155 	ld	a, (#(_player + 0x000a) + 0)
   6C5C B7            [ 4] 5156 	or	a, a
   6C5D CA F4 6C      [10] 5157 	jp	Z,00123$
                           5158 ;src/keyboard.h:52: u8 *spr = flecha_dcha,xs=2,ys=8;
   6C60 11 06 76      [10] 5159 	ld	de,#_flecha_dcha
   6C63 DD 36 FA 02   [19] 5160 	ld	-6 (ix),#0x02
   6C67 06 08         [ 7] 5161 	ld	b,#0x08
                           5162 ;src/keyboard.h:53: switch(player.dir){
   6C69 79            [ 4] 5163 	ld	a,c
   6C6A B7            [ 4] 5164 	or	a, a
   6C6B 20 2A         [12] 5165 	jr	NZ,00114$
   6C6D DD 7E FB      [19] 5166 	ld	a,-5 (ix)
   6C70 B7            [ 4] 5167 	or	a, a
   6C71 20 19         [12] 5168 	jr	NZ,00113$
   6C73 DD 7E FC      [19] 5169 	ld	a,-4 (ix)
   6C76 B7            [ 4] 5170 	or	a, a
   6C77 20 08         [12] 5171 	jr	NZ,00112$
   6C79 DD 7E FD      [19] 5172 	ld	a,-3 (ix)
   6C7C B7            [ 4] 5173 	or	a, a
   6C7D 20 23         [12] 5174 	jr	NZ,00115$
   6C7F 18 2A         [12] 5175 	jr	00116$
                           5176 ;src/keyboard.h:54: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   6C81                    5177 00112$:
   6C81 11 06 76      [10] 5178 	ld	de,#_flecha_dcha
   6C84 DD 36 FA 04   [19] 5179 	ld	-6 (ix),#0x04
   6C88 06 04         [ 7] 5180 	ld	b,#0x04
   6C8A 18 1F         [12] 5181 	jr	00116$
                           5182 ;src/keyboard.h:55: case 4: spr = flecha_izda; xs=4;ys=4; break;
   6C8C                    5183 00113$:
   6C8C 11 26 76      [10] 5184 	ld	de,#_flecha_izda+0
   6C8F DD 36 FA 04   [19] 5185 	ld	-6 (ix),#0x04
   6C93 06 04         [ 7] 5186 	ld	b,#0x04
   6C95 18 14         [12] 5187 	jr	00116$
                           5188 ;src/keyboard.h:56: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   6C97                    5189 00114$:
   6C97 11 E6 75      [10] 5190 	ld	de,#_flecha_abajo+0
   6C9A DD 36 FA 02   [19] 5191 	ld	-6 (ix),#0x02
   6C9E 06 08         [ 7] 5192 	ld	b,#0x08
   6CA0 18 09         [12] 5193 	jr	00116$
                           5194 ;src/keyboard.h:57: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   6CA2                    5195 00115$:
   6CA2 11 C6 75      [10] 5196 	ld	de,#_flecha_arriba+0
   6CA5 DD 36 FA 02   [19] 5197 	ld	-6 (ix),#0x02
   6CA9 06 08         [ 7] 5198 	ld	b,#0x08
                           5199 ;src/keyboard.h:58: }
   6CAB                    5200 00116$:
                           5201 ;src/keyboard.h:59: player.atk = 0;
   6CAB 21 EC 90      [10] 5202 	ld	hl,#(_player + 0x0008)
   6CAE 36 00         [10] 5203 	ld	(hl),#0x00
                           5204 ;src/keyboard.h:60: object.x = player.x;
   6CB0 3A E4 90      [13] 5205 	ld	a, (#_player + 0)
   6CB3 21 DA 90      [10] 5206 	ld	hl,#_object
   6CB6 77            [ 7] 5207 	ld	(hl),a
                           5208 ;src/keyboard.h:61: object.y = player.y+8;
   6CB7 3A E5 90      [13] 5209 	ld	a, (#(_player + 0x0001) + 0)
   6CBA C6 08         [ 7] 5210 	add	a, #0x08
   6CBC 32 DB 90      [13] 5211 	ld	(#(_object + 0x0001)),a
                           5212 ;src/keyboard.h:62: object.x = object.x;
   6CBF 21 DA 90      [10] 5213 	ld	hl, #_object + 0
   6CC2 4E            [ 7] 5214 	ld	c,(hl)
   6CC3 21 DA 90      [10] 5215 	ld	hl,#_object
   6CC6 71            [ 7] 5216 	ld	(hl),c
                           5217 ;src/keyboard.h:63: object.y = object.y;
   6CC7 32 DB 90      [13] 5218 	ld	(#(_object + 0x0001)),a
                           5219 ;src/keyboard.h:64: object.sprite = spr;
   6CCA ED 53 DE 90   [20] 5220 	ld	((_object + 0x0004)), de
                           5221 ;src/keyboard.h:65: object.vivo = 1;
   6CCE 21 E0 90      [10] 5222 	ld	hl,#_object + 6
   6CD1 36 01         [10] 5223 	ld	(hl),#0x01
                           5224 ;src/keyboard.h:66: object.dir = player.dir;
   6CD3 11 E1 90      [10] 5225 	ld	de,#_object + 7
   6CD6 3A EB 90      [13] 5226 	ld	a, (#(_player + 0x0007) + 0)
   6CD9 12            [ 7] 5227 	ld	(de),a
                           5228 ;src/keyboard.h:67: object.sizeX = xs;
   6CDA 21 E2 90      [10] 5229 	ld	hl,#_object + 8
   6CDD DD 7E FA      [19] 5230 	ld	a,-6 (ix)
   6CE0 77            [ 7] 5231 	ld	(hl),a
                           5232 ;src/keyboard.h:68: object.sizeY = ys;
   6CE1 21 E3 90      [10] 5233 	ld	hl,#_object + 9
   6CE4 70            [ 7] 5234 	ld	(hl),b
                           5235 ;src/keyboard.h:69: player.bullets--;
   6CE5 3A EE 90      [13] 5236 	ld	a, (#(_player + 0x000a) + 0)
   6CE8 C6 FF         [ 7] 5237 	add	a,#0xFF
   6CEA 32 EE 90      [13] 5238 	ld	(#(_player + 0x000a)),a
                           5239 ;src/keyboard.h:70: arrow=1;
   6CED 21 D2 90      [10] 5240 	ld	hl,#_arrow + 0
   6CF0 36 01         [10] 5241 	ld	(hl), #0x01
   6CF2 18 3E         [12] 5242 	jr	00146$
   6CF4                    5243 00123$:
                           5244 ;src/keyboard.h:72: switch(player.dir){
   6CF4 79            [ 4] 5245 	ld	a,c
   6CF5 B7            [ 4] 5246 	or	a, a
   6CF6 20 32         [12] 5247 	jr	NZ,00120$
   6CF8 DD 7E FB      [19] 5248 	ld	a,-5 (ix)
   6CFB B7            [ 4] 5249 	or	a, a
   6CFC 20 0E         [12] 5250 	jr	NZ,00117$
   6CFE DD 7E FC      [19] 5251 	ld	a,-4 (ix)
   6D01 B7            [ 4] 5252 	or	a, a
   6D02 20 12         [12] 5253 	jr	NZ,00118$
   6D04 DD 7E FD      [19] 5254 	ld	a,-3 (ix)
   6D07 B7            [ 4] 5255 	or	a, a
   6D08 20 16         [12] 5256 	jr	NZ,00119$
   6D0A 18 26         [12] 5257 	jr	00146$
                           5258 ;src/keyboard.h:73: case 4:
   6D0C                    5259 00117$:
                           5260 ;src/keyboard.h:74: s = gladis_quieto_izda;
   6D0C DD 36 FE 80   [19] 5261 	ld	-2 (ix),#<(_gladis_quieto_izda)
   6D10 DD 36 FF 40   [19] 5262 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           5263 ;src/keyboard.h:75: break;
   6D14 18 1C         [12] 5264 	jr	00146$
                           5265 ;src/keyboard.h:76: case 6:
   6D16                    5266 00118$:
                           5267 ;src/keyboard.h:77: s = gladis_quieto_dcha;
   6D16 DD 36 FE 00   [19] 5268 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   6D1A DD 36 FF 40   [19] 5269 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           5270 ;src/keyboard.h:78: break;
   6D1E 18 12         [12] 5271 	jr	00146$
                           5272 ;src/keyboard.h:79: case 8:
   6D20                    5273 00119$:
                           5274 ;src/keyboard.h:80: s = gladis_arriba;
   6D20 DD 36 FE 00   [19] 5275 	ld	-2 (ix),#<(_gladis_arriba)
   6D24 DD 36 FF 42   [19] 5276 	ld	-1 (ix),#>(_gladis_arriba)
                           5277 ;src/keyboard.h:81: break;
   6D28 18 08         [12] 5278 	jr	00146$
                           5279 ;src/keyboard.h:82: case 2:
   6D2A                    5280 00120$:
                           5281 ;src/keyboard.h:83: s = gladis_abajo;
   6D2A DD 36 FE 80   [19] 5282 	ld	-2 (ix),#<(_gladis_abajo)
   6D2E DD 36 FF 42   [19] 5283 	ld	-1 (ix),#>(_gladis_abajo)
                           5284 ;src/keyboard.h:85: }
   6D32                    5285 00146$:
                           5286 ;src/keyboard.h:90: if(cpct_isKeyPressed(Key_Esc)){
   6D32 21 08 04      [10] 5287 	ld	hl,#0x0408
   6D35 CD 1A 8B      [17] 5288 	call	_cpct_isKeyPressed
   6D38 7D            [ 4] 5289 	ld	a,l
   6D39 B7            [ 4] 5290 	or	a, a
   6D3A 28 05         [12] 5291 	jr	Z,00149$
                           5292 ;src/keyboard.h:91: finish = 1;
   6D3C 21 D1 90      [10] 5293 	ld	hl,#_finish + 0
   6D3F 36 01         [10] 5294 	ld	(hl), #0x01
   6D41                    5295 00149$:
                           5296 ;src/keyboard.h:93: return s;
   6D41 DD 6E FE      [19] 5297 	ld	l,-2 (ix)
   6D44 DD 66 FF      [19] 5298 	ld	h,-1 (ix)
   6D47 DD F9         [10] 5299 	ld	sp, ix
   6D49 DD E1         [14] 5300 	pop	ix
   6D4B C9            [10] 5301 	ret
                           5302 ;src/keyboard.h:96: void moveObject(){
                           5303 ;	---------------------------------
                           5304 ; Function moveObject
                           5305 ; ---------------------------------
   6D4C                    5306 _moveObject::
                           5307 ;src/keyboard.h:97: object.lx = object.x;
   6D4C 01 DA 90      [10] 5308 	ld	bc,#_object+0
   6D4F 0A            [ 7] 5309 	ld	a,(bc)
   6D50 32 DC 90      [13] 5310 	ld	(#(_object + 0x0002)),a
                           5311 ;src/keyboard.h:98: object.ly = object.y;
   6D53 59            [ 4] 5312 	ld	e, c
   6D54 50            [ 4] 5313 	ld	d, b
   6D55 13            [ 6] 5314 	inc	de
   6D56 1A            [ 7] 5315 	ld	a,(de)
   6D57 32 DD 90      [13] 5316 	ld	(#(_object + 0x0003)),a
                           5317 ;src/keyboard.h:99: switch(object.dir){
   6D5A 3A E1 90      [13] 5318 	ld	a,(#_object + 7)
   6D5D FE 02         [ 7] 5319 	cp	a,#0x02
   6D5F 28 16         [12] 5320 	jr	Z,00103$
   6D61 FE 04         [ 7] 5321 	cp	a,#0x04
   6D63 28 0D         [12] 5322 	jr	Z,00102$
   6D65 FE 06         [ 7] 5323 	cp	a,#0x06
   6D67 28 05         [12] 5324 	jr	Z,00101$
   6D69 D6 08         [ 7] 5325 	sub	a, #0x08
   6D6B 28 0F         [12] 5326 	jr	Z,00104$
   6D6D C9            [10] 5327 	ret
                           5328 ;src/keyboard.h:100: case 6: object.x += 1; break;
   6D6E                    5329 00101$:
   6D6E 0A            [ 7] 5330 	ld	a,(bc)
   6D6F 3C            [ 4] 5331 	inc	a
   6D70 02            [ 7] 5332 	ld	(bc),a
   6D71 C9            [10] 5333 	ret
                           5334 ;src/keyboard.h:101: case 4: object.x -= 1; break;
   6D72                    5335 00102$:
   6D72 0A            [ 7] 5336 	ld	a,(bc)
   6D73 C6 FF         [ 7] 5337 	add	a,#0xFF
   6D75 02            [ 7] 5338 	ld	(bc),a
   6D76 C9            [10] 5339 	ret
                           5340 ;src/keyboard.h:102: case 2: object.y += 2; break;
   6D77                    5341 00103$:
   6D77 1A            [ 7] 5342 	ld	a,(de)
   6D78 C6 02         [ 7] 5343 	add	a, #0x02
   6D7A 12            [ 7] 5344 	ld	(de),a
   6D7B C9            [10] 5345 	ret
                           5346 ;src/keyboard.h:103: case 8: object.y -= 2; break;
   6D7C                    5347 00104$:
   6D7C 1A            [ 7] 5348 	ld	a,(de)
   6D7D C6 FE         [ 7] 5349 	add	a,#0xFE
   6D7F 12            [ 7] 5350 	ld	(de),a
                           5351 ;src/keyboard.h:104: }
   6D80 C9            [10] 5352 	ret
                           5353 ;src/main.c:44: void gameOver(){
                           5354 ;	---------------------------------
                           5355 ; Function gameOver
                           5356 ; ---------------------------------
   6D81                    5357 _gameOver::
                           5358 ;src/main.c:46: cpct_clearScreen(0);
   6D81 21 00 40      [10] 5359 	ld	hl,#0x4000
   6D84 E5            [11] 5360 	push	hl
   6D85 AF            [ 4] 5361 	xor	a, a
   6D86 F5            [11] 5362 	push	af
   6D87 33            [ 6] 5363 	inc	sp
   6D88 26 C0         [ 7] 5364 	ld	h, #0xC0
   6D8A E5            [11] 5365 	push	hl
   6D8B CD F5 8D      [17] 5366 	call	_cpct_memset
                           5367 ;src/main.c:47: memptr = cpct_getScreenPtr(VMEM,10,10);
   6D8E 21 0A 0A      [10] 5368 	ld	hl,#0x0A0A
   6D91 E5            [11] 5369 	push	hl
   6D92 21 00 C0      [10] 5370 	ld	hl,#0xC000
   6D95 E5            [11] 5371 	push	hl
   6D96 CD E8 8E      [17] 5372 	call	_cpct_getScreenPtr
                           5373 ;src/main.c:48: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6D99 EB            [ 4] 5374 	ex	de,hl
   6D9A 01 EE 6D      [10] 5375 	ld	bc,#___str_2+0
   6D9D 21 01 00      [10] 5376 	ld	hl,#0x0001
   6DA0 E5            [11] 5377 	push	hl
   6DA1 D5            [11] 5378 	push	de
   6DA2 C5            [11] 5379 	push	bc
   6DA3 CD 07 8C      [17] 5380 	call	_cpct_drawStringM0
   6DA6 21 06 00      [10] 5381 	ld	hl,#6
   6DA9 39            [11] 5382 	add	hl,sp
   6DAA F9            [ 6] 5383 	ld	sp,hl
                           5384 ;src/main.c:50: memptr = cpct_getScreenPtr(VMEM,10,50);
   6DAB 21 0A 32      [10] 5385 	ld	hl,#0x320A
   6DAE E5            [11] 5386 	push	hl
   6DAF 21 00 C0      [10] 5387 	ld	hl,#0xC000
   6DB2 E5            [11] 5388 	push	hl
   6DB3 CD E8 8E      [17] 5389 	call	_cpct_getScreenPtr
                           5390 ;src/main.c:51: cpct_drawSprite(gameover,memptr,60,28);
   6DB6 EB            [ 4] 5391 	ex	de,hl
   6DB7 01 56 76      [10] 5392 	ld	bc,#_gameover+0
   6DBA 21 3C 1C      [10] 5393 	ld	hl,#0x1C3C
   6DBD E5            [11] 5394 	push	hl
   6DBE D5            [11] 5395 	push	de
   6DBF C5            [11] 5396 	push	bc
   6DC0 CD 2B 8C      [17] 5397 	call	_cpct_drawSprite
                           5398 ;src/main.c:54: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   6DC3 21 0C AF      [10] 5399 	ld	hl,#0xAF0C
   6DC6 E5            [11] 5400 	push	hl
   6DC7 21 00 C0      [10] 5401 	ld	hl,#0xC000
   6DCA E5            [11] 5402 	push	hl
   6DCB CD E8 8E      [17] 5403 	call	_cpct_getScreenPtr
                           5404 ;src/main.c:55: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   6DCE EB            [ 4] 5405 	ex	de,hl
   6DCF 01 FF 6D      [10] 5406 	ld	bc,#___str_3+0
   6DD2 21 01 00      [10] 5407 	ld	hl,#0x0001
   6DD5 E5            [11] 5408 	push	hl
   6DD6 D5            [11] 5409 	push	de
   6DD7 C5            [11] 5410 	push	bc
   6DD8 CD 07 8C      [17] 5411 	call	_cpct_drawStringM0
   6DDB 21 06 00      [10] 5412 	ld	hl,#6
   6DDE 39            [11] 5413 	add	hl,sp
   6DDF F9            [ 6] 5414 	ld	sp,hl
                           5415 ;src/main.c:59: while (1){
   6DE0                    5416 00104$:
                           5417 ;src/main.c:60: cpct_scanKeyboard_f();
   6DE0 CD 26 8B      [17] 5418 	call	_cpct_scanKeyboard_f
                           5419 ;src/main.c:61: if(cpct_isKeyPressed(Key_Space)) {
   6DE3 21 05 80      [10] 5420 	ld	hl,#0x8005
   6DE6 CD 1A 8B      [17] 5421 	call	_cpct_isKeyPressed
   6DE9 7D            [ 4] 5422 	ld	a,l
   6DEA B7            [ 4] 5423 	or	a, a
   6DEB 28 F3         [12] 5424 	jr	Z,00104$
                           5425 ;src/main.c:63: return;
   6DED C9            [10] 5426 	ret
   6DEE                    5427 ___str_2:
   6DEE 4C 6F 75 6E 67 65  5428 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   6DFE 00                 5429 	.db 0x00
   6DFF                    5430 ___str_3:
   6DFF 50 75 6C 73 61 20  5431 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   6E0C 00                 5432 	.db 0x00
                           5433 ;src/main.c:70: int menu(){
                           5434 ;	---------------------------------
                           5435 ; Function menu
                           5436 ; ---------------------------------
   6E0D                    5437 _menu::
   6E0D DD E5         [15] 5438 	push	ix
   6E0F DD 21 00 00   [14] 5439 	ld	ix,#0
   6E13 DD 39         [15] 5440 	add	ix,sp
   6E15 21 FA FF      [10] 5441 	ld	hl,#-6
   6E18 39            [11] 5442 	add	hl,sp
   6E19 F9            [ 6] 5443 	ld	sp,hl
                           5444 ;src/main.c:72: int init = 50;
   6E1A DD 36 FC 32   [19] 5445 	ld	-4 (ix),#0x32
   6E1E DD 36 FD 00   [19] 5446 	ld	-3 (ix),#0x00
                           5447 ;src/main.c:73: int pushed =0;
   6E22 11 00 00      [10] 5448 	ld	de,#0x0000
                           5449 ;src/main.c:74: int cont =0;
   6E25 21 00 00      [10] 5450 	ld	hl,#0x0000
   6E28 E3            [19] 5451 	ex	(sp), hl
                           5452 ;src/main.c:75: cpct_clearScreen(0);
   6E29 D5            [11] 5453 	push	de
   6E2A 21 00 40      [10] 5454 	ld	hl,#0x4000
   6E2D E5            [11] 5455 	push	hl
   6E2E AF            [ 4] 5456 	xor	a, a
   6E2F F5            [11] 5457 	push	af
   6E30 33            [ 6] 5458 	inc	sp
   6E31 26 C0         [ 7] 5459 	ld	h, #0xC0
   6E33 E5            [11] 5460 	push	hl
   6E34 CD F5 8D      [17] 5461 	call	_cpct_memset
   6E37 21 0A 0A      [10] 5462 	ld	hl,#0x0A0A
   6E3A E5            [11] 5463 	push	hl
   6E3B 21 00 C0      [10] 5464 	ld	hl,#0xC000
   6E3E E5            [11] 5465 	push	hl
   6E3F CD E8 8E      [17] 5466 	call	_cpct_getScreenPtr
   6E42 D1            [10] 5467 	pop	de
                           5468 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6E43 4D            [ 4] 5469 	ld	c, l
   6E44 44            [ 4] 5470 	ld	b, h
   6E45 D5            [11] 5471 	push	de
   6E46 21 3C 3C      [10] 5472 	ld	hl,#0x3C3C
   6E49 E5            [11] 5473 	push	hl
   6E4A C5            [11] 5474 	push	bc
   6E4B 21 E6 7C      [10] 5475 	ld	hl,#_portada1
   6E4E E5            [11] 5476 	push	hl
   6E4F CD 2B 8C      [17] 5477 	call	_cpct_drawSprite
   6E52 21 14 5A      [10] 5478 	ld	hl,#0x5A14
   6E55 E5            [11] 5479 	push	hl
   6E56 21 00 C0      [10] 5480 	ld	hl,#0xC000
   6E59 E5            [11] 5481 	push	hl
   6E5A CD E8 8E      [17] 5482 	call	_cpct_getScreenPtr
   6E5D D1            [10] 5483 	pop	de
                           5484 ;src/main.c:82: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   6E5E 4D            [ 4] 5485 	ld	c, l
   6E5F 44            [ 4] 5486 	ld	b, h
   6E60 D5            [11] 5487 	push	de
   6E61 21 01 00      [10] 5488 	ld	hl,#0x0001
   6E64 E5            [11] 5489 	push	hl
   6E65 C5            [11] 5490 	push	bc
   6E66 21 2F 70      [10] 5491 	ld	hl,#___str_4
   6E69 E5            [11] 5492 	push	hl
   6E6A CD 07 8C      [17] 5493 	call	_cpct_drawStringM0
   6E6D 21 06 00      [10] 5494 	ld	hl,#6
   6E70 39            [11] 5495 	add	hl,sp
   6E71 F9            [ 6] 5496 	ld	sp,hl
   6E72 21 14 6E      [10] 5497 	ld	hl,#0x6E14
   6E75 E5            [11] 5498 	push	hl
   6E76 21 00 C0      [10] 5499 	ld	hl,#0xC000
   6E79 E5            [11] 5500 	push	hl
   6E7A CD E8 8E      [17] 5501 	call	_cpct_getScreenPtr
   6E7D D1            [10] 5502 	pop	de
                           5503 ;src/main.c:85: cpct_drawStringM0("Creditos",memptr,1,0);
   6E7E 4D            [ 4] 5504 	ld	c, l
   6E7F 44            [ 4] 5505 	ld	b, h
   6E80 D5            [11] 5506 	push	de
   6E81 21 01 00      [10] 5507 	ld	hl,#0x0001
   6E84 E5            [11] 5508 	push	hl
   6E85 C5            [11] 5509 	push	bc
   6E86 21 3D 70      [10] 5510 	ld	hl,#___str_5
   6E89 E5            [11] 5511 	push	hl
   6E8A CD 07 8C      [17] 5512 	call	_cpct_drawStringM0
   6E8D 21 06 00      [10] 5513 	ld	hl,#6
   6E90 39            [11] 5514 	add	hl,sp
   6E91 F9            [ 6] 5515 	ld	sp,hl
   6E92 21 14 82      [10] 5516 	ld	hl,#0x8214
   6E95 E5            [11] 5517 	push	hl
   6E96 21 00 C0      [10] 5518 	ld	hl,#0xC000
   6E99 E5            [11] 5519 	push	hl
   6E9A CD E8 8E      [17] 5520 	call	_cpct_getScreenPtr
   6E9D D1            [10] 5521 	pop	de
                           5522 ;src/main.c:88: cpct_drawStringM0("Constroles",memptr,1,0);
   6E9E 4D            [ 4] 5523 	ld	c, l
   6E9F 44            [ 4] 5524 	ld	b, h
   6EA0 D5            [11] 5525 	push	de
   6EA1 21 01 00      [10] 5526 	ld	hl,#0x0001
   6EA4 E5            [11] 5527 	push	hl
   6EA5 C5            [11] 5528 	push	bc
   6EA6 21 46 70      [10] 5529 	ld	hl,#___str_6
   6EA9 E5            [11] 5530 	push	hl
   6EAA CD 07 8C      [17] 5531 	call	_cpct_drawStringM0
   6EAD 21 06 00      [10] 5532 	ld	hl,#6
   6EB0 39            [11] 5533 	add	hl,sp
   6EB1 F9            [ 6] 5534 	ld	sp,hl
   6EB2 21 14 96      [10] 5535 	ld	hl,#0x9614
   6EB5 E5            [11] 5536 	push	hl
   6EB6 21 00 C0      [10] 5537 	ld	hl,#0xC000
   6EB9 E5            [11] 5538 	push	hl
   6EBA CD E8 8E      [17] 5539 	call	_cpct_getScreenPtr
   6EBD D1            [10] 5540 	pop	de
                           5541 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6EBE DD 75 FE      [19] 5542 	ld	-2 (ix),l
   6EC1 DD 74 FF      [19] 5543 	ld	-1 (ix),h
                           5544 ;src/main.c:91: cpct_drawStringM0("Salir",memptr,1,0);
   6EC4 01 51 70      [10] 5545 	ld	bc,#___str_7
   6EC7 D5            [11] 5546 	push	de
   6EC8 21 01 00      [10] 5547 	ld	hl,#0x0001
   6ECB E5            [11] 5548 	push	hl
   6ECC DD 6E FE      [19] 5549 	ld	l,-2 (ix)
   6ECF DD 66 FF      [19] 5550 	ld	h,-1 (ix)
   6ED2 E5            [11] 5551 	push	hl
   6ED3 C5            [11] 5552 	push	bc
   6ED4 CD 07 8C      [17] 5553 	call	_cpct_drawStringM0
   6ED7 21 06 00      [10] 5554 	ld	hl,#6
   6EDA 39            [11] 5555 	add	hl,sp
   6EDB F9            [ 6] 5556 	ld	sp,hl
   6EDC D1            [10] 5557 	pop	de
                           5558 ;src/main.c:97: while(1){
   6EDD                    5559 00124$:
                           5560 ;src/main.c:99: cpct_scanKeyboard();
   6EDD D5            [11] 5561 	push	de
   6EDE CD 08 8F      [17] 5562 	call	_cpct_scanKeyboard
   6EE1 21 00 04      [10] 5563 	ld	hl,#0x0400
   6EE4 CD 1A 8B      [17] 5564 	call	_cpct_isKeyPressed
   6EE7 7D            [ 4] 5565 	ld	a,l
   6EE8 D1            [10] 5566 	pop	de
   6EE9 B7            [ 4] 5567 	or	a, a
   6EEA 28 38         [12] 5568 	jr	Z,00104$
   6EEC 3E 96         [ 7] 5569 	ld	a,#0x96
   6EEE DD BE FA      [19] 5570 	cp	a, -6 (ix)
   6EF1 3E 00         [ 7] 5571 	ld	a,#0x00
   6EF3 DD 9E FB      [19] 5572 	sbc	a, -5 (ix)
   6EF6 E2 FB 6E      [10] 5573 	jp	PO, 00176$
   6EF9 EE 80         [ 7] 5574 	xor	a, #0x80
   6EFB                    5575 00176$:
   6EFB F2 24 6F      [10] 5576 	jp	P,00104$
                           5577 ;src/main.c:101: cpct_drawSolidBox(memptr, 0, 2, 8);
   6EFE D5            [11] 5578 	push	de
   6EFF 21 02 08      [10] 5579 	ld	hl,#0x0802
   6F02 E5            [11] 5580 	push	hl
   6F03 AF            [ 4] 5581 	xor	a, a
   6F04 F5            [11] 5582 	push	af
   6F05 33            [ 6] 5583 	inc	sp
   6F06 DD 6E FE      [19] 5584 	ld	l,-2 (ix)
   6F09 DD 66 FF      [19] 5585 	ld	h,-1 (ix)
   6F0C E5            [11] 5586 	push	hl
   6F0D CD 17 8E      [17] 5587 	call	_cpct_drawSolidBox
   6F10 F1            [10] 5588 	pop	af
   6F11 F1            [10] 5589 	pop	af
   6F12 33            [ 6] 5590 	inc	sp
   6F13 D1            [10] 5591 	pop	de
                           5592 ;src/main.c:102: if(pushed<3) pushed ++;
   6F14 7B            [ 4] 5593 	ld	a,e
   6F15 D6 03         [ 7] 5594 	sub	a, #0x03
   6F17 7A            [ 4] 5595 	ld	a,d
   6F18 17            [ 4] 5596 	rla
   6F19 3F            [ 4] 5597 	ccf
   6F1A 1F            [ 4] 5598 	rra
   6F1B DE 80         [ 7] 5599 	sbc	a, #0x80
   6F1D 30 01         [12] 5600 	jr	NC,00102$
   6F1F 13            [ 6] 5601 	inc	de
   6F20                    5602 00102$:
                           5603 ;src/main.c:103: cont =0;
   6F20 21 00 00      [10] 5604 	ld	hl,#0x0000
   6F23 E3            [19] 5605 	ex	(sp), hl
   6F24                    5606 00104$:
                           5607 ;src/main.c:105: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   6F24 D5            [11] 5608 	push	de
   6F25 21 00 01      [10] 5609 	ld	hl,#0x0100
   6F28 CD 1A 8B      [17] 5610 	call	_cpct_isKeyPressed
   6F2B 7D            [ 4] 5611 	ld	a,l
   6F2C D1            [10] 5612 	pop	de
   6F2D B7            [ 4] 5613 	or	a, a
   6F2E 28 38         [12] 5614 	jr	Z,00109$
   6F30 3E 96         [ 7] 5615 	ld	a,#0x96
   6F32 DD BE FA      [19] 5616 	cp	a, -6 (ix)
   6F35 3E 00         [ 7] 5617 	ld	a,#0x00
   6F37 DD 9E FB      [19] 5618 	sbc	a, -5 (ix)
   6F3A E2 3F 6F      [10] 5619 	jp	PO, 00177$
   6F3D EE 80         [ 7] 5620 	xor	a, #0x80
   6F3F                    5621 00177$:
   6F3F F2 68 6F      [10] 5622 	jp	P,00109$
                           5623 ;src/main.c:106: cpct_drawSolidBox(memptr, 0, 2, 8);
   6F42 D5            [11] 5624 	push	de
   6F43 21 02 08      [10] 5625 	ld	hl,#0x0802
   6F46 E5            [11] 5626 	push	hl
   6F47 AF            [ 4] 5627 	xor	a, a
   6F48 F5            [11] 5628 	push	af
   6F49 33            [ 6] 5629 	inc	sp
   6F4A DD 6E FE      [19] 5630 	ld	l,-2 (ix)
   6F4D DD 66 FF      [19] 5631 	ld	h,-1 (ix)
   6F50 E5            [11] 5632 	push	hl
   6F51 CD 17 8E      [17] 5633 	call	_cpct_drawSolidBox
   6F54 F1            [10] 5634 	pop	af
   6F55 F1            [10] 5635 	pop	af
   6F56 33            [ 6] 5636 	inc	sp
   6F57 D1            [10] 5637 	pop	de
                           5638 ;src/main.c:107: if(pushed>0) pushed --;
   6F58 AF            [ 4] 5639 	xor	a, a
   6F59 BB            [ 4] 5640 	cp	a, e
   6F5A 9A            [ 4] 5641 	sbc	a, d
   6F5B E2 60 6F      [10] 5642 	jp	PO, 00178$
   6F5E EE 80         [ 7] 5643 	xor	a, #0x80
   6F60                    5644 00178$:
   6F60 F2 64 6F      [10] 5645 	jp	P,00107$
   6F63 1B            [ 6] 5646 	dec	de
   6F64                    5647 00107$:
                           5648 ;src/main.c:108: cont = 0;
   6F64 21 00 00      [10] 5649 	ld	hl,#0x0000
   6F67 E3            [19] 5650 	ex	(sp), hl
   6F68                    5651 00109$:
                           5652 ;src/main.c:111: switch (pushed){
   6F68 7A            [ 4] 5653 	ld	a,d
   6F69 07            [ 4] 5654 	rlca
   6F6A E6 01         [ 7] 5655 	and	a,#0x01
   6F6C 47            [ 4] 5656 	ld	b,a
   6F6D 3E 03         [ 7] 5657 	ld	a,#0x03
   6F6F BB            [ 4] 5658 	cp	a, e
   6F70 3E 00         [ 7] 5659 	ld	a,#0x00
   6F72 9A            [ 4] 5660 	sbc	a, d
   6F73 E2 78 6F      [10] 5661 	jp	PO, 00179$
   6F76 EE 80         [ 7] 5662 	xor	a, #0x80
   6F78                    5663 00179$:
   6F78 07            [ 4] 5664 	rlca
   6F79 E6 01         [ 7] 5665 	and	a,#0x01
   6F7B 4F            [ 4] 5666 	ld	c,a
   6F7C 78            [ 4] 5667 	ld	a,b
   6F7D B7            [ 4] 5668 	or	a,a
   6F7E 20 3A         [12] 5669 	jr	NZ,00115$
   6F80 B1            [ 4] 5670 	or	a,c
   6F81 20 37         [12] 5671 	jr	NZ,00115$
   6F83 D5            [11] 5672 	push	de
   6F84 57            [ 4] 5673 	ld	d,a
   6F85 21 8C 6F      [10] 5674 	ld	hl,#00180$
   6F88 19            [11] 5675 	add	hl,de
   6F89 19            [11] 5676 	add	hl,de
                           5677 ;src/main.c:112: case 0: init = 90;break;
   6F8A D1            [10] 5678 	pop	de
   6F8B E9            [ 4] 5679 	jp	(hl)
   6F8C                    5680 00180$:
   6F8C 18 06         [12] 5681 	jr	00111$
   6F8E 18 0E         [12] 5682 	jr	00112$
   6F90 18 16         [12] 5683 	jr	00113$
   6F92 18 1E         [12] 5684 	jr	00114$
   6F94                    5685 00111$:
   6F94 DD 36 FC 5A   [19] 5686 	ld	-4 (ix),#0x5A
   6F98 DD 36 FD 00   [19] 5687 	ld	-3 (ix),#0x00
   6F9C 18 1C         [12] 5688 	jr	00115$
                           5689 ;src/main.c:113: case 1: init = 110;break;
   6F9E                    5690 00112$:
   6F9E DD 36 FC 6E   [19] 5691 	ld	-4 (ix),#0x6E
   6FA2 DD 36 FD 00   [19] 5692 	ld	-3 (ix),#0x00
   6FA6 18 12         [12] 5693 	jr	00115$
                           5694 ;src/main.c:114: case 2: init = 130;break;
   6FA8                    5695 00113$:
   6FA8 DD 36 FC 82   [19] 5696 	ld	-4 (ix),#0x82
   6FAC DD 36 FD 00   [19] 5697 	ld	-3 (ix),#0x00
   6FB0 18 08         [12] 5698 	jr	00115$
                           5699 ;src/main.c:115: case 3: init = 150;break;
   6FB2                    5700 00114$:
   6FB2 DD 36 FC 96   [19] 5701 	ld	-4 (ix),#0x96
   6FB6 DD 36 FD 00   [19] 5702 	ld	-3 (ix),#0x00
                           5703 ;src/main.c:116: }
   6FBA                    5704 00115$:
                           5705 ;src/main.c:117: memptr = cpct_getScreenPtr(VMEM,15,init);
   6FBA DD 66 FC      [19] 5706 	ld	h,-4 (ix)
   6FBD C5            [11] 5707 	push	bc
   6FBE D5            [11] 5708 	push	de
   6FBF E5            [11] 5709 	push	hl
   6FC0 33            [ 6] 5710 	inc	sp
   6FC1 3E 0F         [ 7] 5711 	ld	a,#0x0F
   6FC3 F5            [11] 5712 	push	af
   6FC4 33            [ 6] 5713 	inc	sp
   6FC5 21 00 C0      [10] 5714 	ld	hl,#0xC000
   6FC8 E5            [11] 5715 	push	hl
   6FC9 CD E8 8E      [17] 5716 	call	_cpct_getScreenPtr
   6FCC D1            [10] 5717 	pop	de
   6FCD C1            [10] 5718 	pop	bc
                           5719 ;src/main.c:78: cpct_drawSprite(portada1,memptr,60,60);
   6FCE DD 75 FE      [19] 5720 	ld	-2 (ix),l
   6FD1 DD 74 FF      [19] 5721 	ld	-1 (ix),h
                           5722 ;src/main.c:118: cpct_drawSprite(marcador,memptr, 2, 8);
   6FD4 C5            [11] 5723 	push	bc
   6FD5 D5            [11] 5724 	push	de
   6FD6 21 02 08      [10] 5725 	ld	hl,#0x0802
   6FD9 E5            [11] 5726 	push	hl
   6FDA DD 6E FE      [19] 5727 	ld	l,-2 (ix)
   6FDD DD 66 FF      [19] 5728 	ld	h,-1 (ix)
   6FE0 E5            [11] 5729 	push	hl
   6FE1 21 46 76      [10] 5730 	ld	hl,#_marcador
   6FE4 E5            [11] 5731 	push	hl
   6FE5 CD 2B 8C      [17] 5732 	call	_cpct_drawSprite
   6FE8 21 05 80      [10] 5733 	ld	hl,#0x8005
   6FEB CD 1A 8B      [17] 5734 	call	_cpct_isKeyPressed
   6FEE 7D            [ 4] 5735 	ld	a,l
   6FEF D1            [10] 5736 	pop	de
   6FF0 C1            [10] 5737 	pop	bc
   6FF1 B7            [ 4] 5738 	or	a, a
   6FF2 28 2A         [12] 5739 	jr	Z,00122$
                           5740 ;src/main.c:120: switch (pushed){
   6FF4 78            [ 4] 5741 	ld	a,b
   6FF5 B7            [ 4] 5742 	or	a,a
   6FF6 20 26         [12] 5743 	jr	NZ,00122$
   6FF8 B1            [ 4] 5744 	or	a,c
   6FF9 20 23         [12] 5745 	jr	NZ,00122$
   6FFB 57            [ 4] 5746 	ld	d,a
   6FFC 21 02 70      [10] 5747 	ld	hl,#00181$
   6FFF 19            [11] 5748 	add	hl,de
   7000 19            [11] 5749 	add	hl,de
                           5750 ;src/main.c:121: case 0: return 1;break;
   7001 E9            [ 4] 5751 	jp	(hl)
   7002                    5752 00181$:
   7002 18 06         [12] 5753 	jr	00116$
   7004 18 09         [12] 5754 	jr	00117$
   7006 18 0C         [12] 5755 	jr	00118$
   7008 18 0F         [12] 5756 	jr	00119$
   700A                    5757 00116$:
   700A 21 01 00      [10] 5758 	ld	hl,#0x0001
   700D 18 1B         [12] 5759 	jr	00126$
                           5760 ;src/main.c:122: case 1: return 2;break;
   700F                    5761 00117$:
   700F 21 02 00      [10] 5762 	ld	hl,#0x0002
   7012 18 16         [12] 5763 	jr	00126$
                           5764 ;src/main.c:123: case 2: return 3;break;
   7014                    5765 00118$:
   7014 21 03 00      [10] 5766 	ld	hl,#0x0003
   7017 18 11         [12] 5767 	jr	00126$
                           5768 ;src/main.c:124: case 3: return 0;break;
   7019                    5769 00119$:
   7019 21 00 00      [10] 5770 	ld	hl,#0x0000
   701C 18 0C         [12] 5771 	jr	00126$
                           5772 ;src/main.c:125: }
   701E                    5773 00122$:
                           5774 ;src/main.c:127: cont++;
   701E DD 34 FA      [23] 5775 	inc	-6 (ix)
   7021 C2 DD 6E      [10] 5776 	jp	NZ,00124$
   7024 DD 34 FB      [23] 5777 	inc	-5 (ix)
   7027 C3 DD 6E      [10] 5778 	jp	00124$
   702A                    5779 00126$:
   702A DD F9         [10] 5780 	ld	sp, ix
   702C DD E1         [14] 5781 	pop	ix
   702E C9            [10] 5782 	ret
   702F                    5783 ___str_4:
   702F 4E 75 65 76 61 20  5784 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   703C 00                 5785 	.db 0x00
   703D                    5786 ___str_5:
   703D 43 72 65 64 69 74  5787 	.ascii "Creditos"
        6F 73
   7045 00                 5788 	.db 0x00
   7046                    5789 ___str_6:
   7046 43 6F 6E 73 74 72  5790 	.ascii "Constroles"
        6F 6C 65 73
   7050 00                 5791 	.db 0x00
   7051                    5792 ___str_7:
   7051 53 61 6C 69 72     5793 	.ascii "Salir"
   7056 00                 5794 	.db 0x00
                           5795 ;src/main.c:132: void game(){
                           5796 ;	---------------------------------
                           5797 ; Function game
                           5798 ; ---------------------------------
   7057                    5799 _game::
                           5800 ;src/main.c:135: initVariables(1);
   7057 3E 01         [ 7] 5801 	ld	a,#0x01
   7059 F5            [11] 5802 	push	af
   705A 33            [ 6] 5803 	inc	sp
   705B CD 3F 4E      [17] 5804 	call	_initVariables
   705E 33            [ 6] 5805 	inc	sp
                           5806 ;src/main.c:136: initPlayer(map);
   705F 3A CF 90      [13] 5807 	ld	a,(_map)
   7062 F5            [11] 5808 	push	af
   7063 33            [ 6] 5809 	inc	sp
   7064 CD 41 4D      [17] 5810 	call	_initPlayer
   7067 33            [ 6] 5811 	inc	sp
                           5812 ;src/main.c:137: initNivel();
   7068 CD 2F 4E      [17] 5813 	call	_initNivel
                           5814 ;src/main.c:138: initEnemies(map);
   706B 3A CF 90      [13] 5815 	ld	a,(_map)
   706E F5            [11] 5816 	push	af
   706F 33            [ 6] 5817 	inc	sp
   7070 CD CB 4D      [17] 5818 	call	_initEnemies
   7073 33            [ 6] 5819 	inc	sp
                           5820 ;src/main.c:140: cpct_clearScreen(0);
   7074 21 00 40      [10] 5821 	ld	hl,#0x4000
   7077 E5            [11] 5822 	push	hl
   7078 AF            [ 4] 5823 	xor	a, a
   7079 F5            [11] 5824 	push	af
   707A 33            [ 6] 5825 	inc	sp
   707B 26 C0         [ 7] 5826 	ld	h, #0xC0
   707D E5            [11] 5827 	push	hl
   707E CD F5 8D      [17] 5828 	call	_cpct_memset
                           5829 ;src/main.c:141: drawMap(map);
   7081 3A CF 90      [13] 5830 	ld	a,(_map)
   7084 F5            [11] 5831 	push	af
   7085 33            [ 6] 5832 	inc	sp
   7086 CD BC 51      [17] 5833 	call	_drawMap
   7089 33            [ 6] 5834 	inc	sp
                           5835 ;src/main.c:142: while (1){
   708A                    5836 00137$:
                           5837 ;src/main.c:143: if(finish == 1) return;
   708A 3A D1 90      [13] 5838 	ld	a,(#_finish + 0)
   708D 3D            [ 4] 5839 	dec	a
   708E C8            [11] 5840 	ret	Z
   708F 18 00         [12] 5841 	jr	00102$
   7091                    5842 00102$:
                           5843 ;src/main.c:145: cpct_waitVSYNC();
   7091 CD DB 8D      [17] 5844 	call	_cpct_waitVSYNC
                           5845 ;src/main.c:148: erases();
   7094 CD 38 55      [17] 5846 	call	_erases
                           5847 ;src/main.c:151: if(temp == 10)
   7097 3A CE 90      [13] 5848 	ld	a,(#_temp + 0)
   709A D6 0A         [ 7] 5849 	sub	a, #0x0A
   709C 20 0F         [12] 5850 	jr	NZ,00104$
                           5851 ;src/main.c:152: drawPickUps(n.corazon,n.bullet);
   709E 21 D9 90      [10] 5852 	ld	hl, #(_n + 0x0002) + 0
   70A1 56            [ 7] 5853 	ld	d,(hl)
   70A2 3A D8 90      [13] 5854 	ld	a, (#(_n + 0x0001) + 0)
   70A5 D5            [11] 5855 	push	de
   70A6 33            [ 6] 5856 	inc	sp
   70A7 F5            [11] 5857 	push	af
   70A8 33            [ 6] 5858 	inc	sp
   70A9 CD DF 56      [17] 5859 	call	_drawPickUps
   70AC F1            [10] 5860 	pop	af
   70AD                    5861 00104$:
                           5862 ;src/main.c:155: draws();
   70AD CD 79 54      [17] 5863 	call	_draws
                           5864 ;src/main.c:158: if(temp == 10){
   70B0 3A CE 90      [13] 5865 	ld	a,(#_temp + 0)
   70B3 D6 0A         [ 7] 5866 	sub	a, #0x0A
   70B5 20 2F         [12] 5867 	jr	NZ,00112$
                           5868 ;src/main.c:159: if(player.atk < 20) drawFatiga(player.atk,2);
   70B7 21 EC 90      [10] 5869 	ld	hl, #(_player + 0x0008) + 0
   70BA 56            [ 7] 5870 	ld	d,(hl)
   70BB 7A            [ 4] 5871 	ld	a,d
   70BC D6 14         [ 7] 5872 	sub	a, #0x14
   70BE 30 0C         [12] 5873 	jr	NC,00109$
   70C0 3E 02         [ 7] 5874 	ld	a,#0x02
   70C2 F5            [11] 5875 	push	af
   70C3 33            [ 6] 5876 	inc	sp
   70C4 D5            [11] 5877 	push	de
   70C5 33            [ 6] 5878 	inc	sp
   70C6 CD B9 55      [17] 5879 	call	_drawFatiga
   70C9 F1            [10] 5880 	pop	af
   70CA 18 1A         [12] 5881 	jr	00112$
   70CC                    5882 00109$:
                           5883 ;src/main.c:160: else if(player.atk > 20) drawFatiga(player.atk,1);
   70CC 3E 14         [ 7] 5884 	ld	a,#0x14
   70CE 92            [ 4] 5885 	sub	a, d
   70CF 30 0C         [12] 5886 	jr	NC,00106$
   70D1 3E 01         [ 7] 5887 	ld	a,#0x01
   70D3 F5            [11] 5888 	push	af
   70D4 33            [ 6] 5889 	inc	sp
   70D5 D5            [11] 5890 	push	de
   70D6 33            [ 6] 5891 	inc	sp
   70D7 CD B9 55      [17] 5892 	call	_drawFatiga
   70DA F1            [10] 5893 	pop	af
   70DB 18 09         [12] 5894 	jr	00112$
   70DD                    5895 00106$:
                           5896 ;src/main.c:161: else drawFatiga(player.atk,0);
   70DD AF            [ 4] 5897 	xor	a, a
   70DE F5            [11] 5898 	push	af
   70DF 33            [ 6] 5899 	inc	sp
   70E0 D5            [11] 5900 	push	de
   70E1 33            [ 6] 5901 	inc	sp
   70E2 CD B9 55      [17] 5902 	call	_drawFatiga
   70E5 F1            [10] 5903 	pop	af
   70E6                    5904 00112$:
                           5905 ;src/main.c:164: if(temp%2 == 0){
   70E6 3A CE 90      [13] 5906 	ld	a,(#_temp + 0)
                           5907 ;src/main.c:165: player.lx = player.x;
                           5908 ;src/main.c:166: player.ly = player.y;
                           5909 ;src/main.c:164: if(temp%2 == 0){
   70E9 E6 01         [ 7] 5910 	and	a,#0x01
   70EB 20 0D         [12] 5911 	jr	NZ,00114$
                           5912 ;src/main.c:165: player.lx = player.x;
   70ED 3A E4 90      [13] 5913 	ld	a, (#_player + 0)
   70F0 21 E6 90      [10] 5914 	ld	hl,#(_player + 0x0002)
   70F3 77            [ 7] 5915 	ld	(hl),a
                           5916 ;src/main.c:166: player.ly = player.y;
   70F4 3A E5 90      [13] 5917 	ld	a, (#(_player + 0x0001) + 0)
   70F7 32 E7 90      [13] 5918 	ld	(#(_player + 0x0003)),a
   70FA                    5919 00114$:
                           5920 ;src/main.c:169: if(enemy.life > 0){
   70FA 21 F7 90      [10] 5921 	ld	hl, #(_enemy + 0x0008) + 0
   70FD 6E            [ 7] 5922 	ld	l,(hl)
                           5923 ;src/main.c:171: enemy.lx = enemy.x;
                           5924 ;src/main.c:172: enemy.ly = enemy.y;
                           5925 ;src/main.c:180: enemy.x = enemy.ox;
                           5926 ;src/main.c:181: enemy.y = enemy.oy;
                           5927 ;src/main.c:188: enemy.pursue = 0;
                           5928 ;src/main.c:169: if(enemy.life > 0){
   70FE 7D            [ 4] 5929 	ld	a,l
   70FF B7            [ 4] 5930 	or	a, a
   7100 CA 20 72      [10] 5931 	jp	Z,00121$
                           5932 ;src/main.c:170: if(temp%2 == 1){
   7103 3A CE 90      [13] 5933 	ld	a,(#_temp + 0)
   7106 E6 01         [ 7] 5934 	and	a, #0x01
   7108 3D            [ 4] 5935 	dec	a
   7109 20 0C         [12] 5936 	jr	NZ,00116$
                           5937 ;src/main.c:171: enemy.lx = enemy.x;
   710B 3A EF 90      [13] 5938 	ld	a, (#_enemy + 0)
   710E 32 F1 90      [13] 5939 	ld	(#(_enemy + 0x0002)),a
                           5940 ;src/main.c:172: enemy.ly = enemy.y;
   7111 3A F0 90      [13] 5941 	ld	a, (#(_enemy + 0x0001) + 0)
   7114 32 F2 90      [13] 5942 	ld	(#(_enemy + 0x0003)),a
   7117                    5943 00116$:
                           5944 ;src/main.c:175: move();
   7117 CD 32 60      [17] 5945 	call	_move
                           5946 ;src/main.c:177: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   711A 21 EC 90      [10] 5947 	ld	hl, #(_player + 0x0008) + 0
   711D 56            [ 7] 5948 	ld	d,(hl)
   711E 3A F0 90      [13] 5949 	ld	a, (#(_enemy + 0x0001) + 0)
   7121 21 EF 90      [10] 5950 	ld	hl, #_enemy + 0
   7124 5E            [ 7] 5951 	ld	e,(hl)
   7125 21 E5 90      [10] 5952 	ld	hl, #(_player + 0x0001) + 0
   7128 46            [ 7] 5953 	ld	b,(hl)
   7129 21 E4 90      [10] 5954 	ld	hl, #_player + 0
   712C 4E            [ 7] 5955 	ld	c,(hl)
   712D D5            [11] 5956 	push	de
   712E 33            [ 6] 5957 	inc	sp
   712F 57            [ 4] 5958 	ld	d,a
   7130 D5            [11] 5959 	push	de
   7131 C5            [11] 5960 	push	bc
   7132 CD FF 60      [17] 5961 	call	_checkCollisions
   7135 F1            [10] 5962 	pop	af
   7136 F1            [10] 5963 	pop	af
   7137 33            [ 6] 5964 	inc	sp
   7138 7D            [ 4] 5965 	ld	a,l
   7139 3D            [ 4] 5966 	dec	a
   713A 28 08         [12] 5967 	jr	Z,00117$
   713C 7D            [ 4] 5968 	ld	a,l
   713D D6 02         [ 7] 5969 	sub	a, #0x02
   713F 28 72         [12] 5970 	jr	Z,00118$
   7141 C3 20 72      [10] 5971 	jp	00121$
                           5972 ;src/main.c:178: case 1:
   7144                    5973 00117$:
                           5974 ;src/main.c:179: erase(enemy.lx,enemy.ly,0);
   7144 21 F2 90      [10] 5975 	ld	hl, #(_enemy + 0x0003) + 0
   7147 56            [ 7] 5976 	ld	d,(hl)
   7148 21 F1 90      [10] 5977 	ld	hl, #(_enemy + 0x0002) + 0
   714B 46            [ 7] 5978 	ld	b,(hl)
   714C AF            [ 4] 5979 	xor	a, a
   714D F5            [11] 5980 	push	af
   714E 33            [ 6] 5981 	inc	sp
   714F D5            [11] 5982 	push	de
   7150 33            [ 6] 5983 	inc	sp
   7151 C5            [11] 5984 	push	bc
   7152 33            [ 6] 5985 	inc	sp
   7153 CD E4 53      [17] 5986 	call	_erase
   7156 F1            [10] 5987 	pop	af
   7157 33            [ 6] 5988 	inc	sp
                           5989 ;src/main.c:180: enemy.x = enemy.ox;
   7158 3A F3 90      [13] 5990 	ld	a, (#(_enemy + 0x0004) + 0)
   715B 32 EF 90      [13] 5991 	ld	(#_enemy),a
                           5992 ;src/main.c:181: enemy.y = enemy.oy;
   715E 21 F4 90      [10] 5993 	ld	hl, #(_enemy + 0x0005) + 0
   7161 56            [ 7] 5994 	ld	d,(hl)
   7162 21 F0 90      [10] 5995 	ld	hl,#(_enemy + 0x0001)
   7165 72            [ 7] 5996 	ld	(hl),d
                           5997 ;src/main.c:182: enemy.lx = enemy.x;
   7166 32 F1 90      [13] 5998 	ld	(#(_enemy + 0x0002)),a
                           5999 ;src/main.c:183: enemy.ly = enemy.y;
   7169 21 F2 90      [10] 6000 	ld	hl,#(_enemy + 0x0003)
   716C 72            [ 7] 6001 	ld	(hl),d
                           6002 ;src/main.c:184: enemy.ox = originse[map-1][4];
   716D 21 CF 90      [10] 6003 	ld	hl,#_map + 0
   7170 56            [ 7] 6004 	ld	d, (hl)
   7171 15            [ 4] 6005 	dec	d
   7172 4A            [ 4] 6006 	ld	c,d
   7173 06 00         [ 7] 6007 	ld	b,#0x00
   7175 69            [ 4] 6008 	ld	l, c
   7176 60            [ 4] 6009 	ld	h, b
   7177 29            [11] 6010 	add	hl, hl
   7178 09            [11] 6011 	add	hl, bc
   7179 29            [11] 6012 	add	hl, hl
   717A 11 39 4B      [10] 6013 	ld	de,#_originse
   717D 19            [11] 6014 	add	hl,de
   717E 11 04 00      [10] 6015 	ld	de, #0x0004
   7181 19            [11] 6016 	add	hl, de
   7182 7E            [ 7] 6017 	ld	a,(hl)
   7183 32 F3 90      [13] 6018 	ld	(#(_enemy + 0x0004)),a
                           6019 ;src/main.c:185: enemy.oy = originse[map-1][5];
   7186 21 CF 90      [10] 6020 	ld	hl,#_map + 0
   7189 56            [ 7] 6021 	ld	d, (hl)
   718A 15            [ 4] 6022 	dec	d
   718B 4A            [ 4] 6023 	ld	c,d
   718C 06 00         [ 7] 6024 	ld	b,#0x00
   718E 69            [ 4] 6025 	ld	l, c
   718F 60            [ 4] 6026 	ld	h, b
   7190 29            [11] 6027 	add	hl, hl
   7191 09            [11] 6028 	add	hl, bc
   7192 29            [11] 6029 	add	hl, hl
   7193 11 39 4B      [10] 6030 	ld	de,#_originse
   7196 19            [11] 6031 	add	hl,de
   7197 11 05 00      [10] 6032 	ld	de, #0x0005
   719A 19            [11] 6033 	add	hl, de
   719B 7E            [ 7] 6034 	ld	a,(hl)
   719C 32 F4 90      [13] 6035 	ld	(#(_enemy + 0x0005)),a
                           6036 ;src/main.c:186: enemy.life -= 1;
   719F 3A F7 90      [13] 6037 	ld	a, (#(_enemy + 0x0008) + 0)
   71A2 C6 FF         [ 7] 6038 	add	a,#0xFF
   71A4 32 F7 90      [13] 6039 	ld	(#(_enemy + 0x0008)),a
                           6040 ;src/main.c:187: player.atk = 20;
   71A7 21 EC 90      [10] 6041 	ld	hl,#(_player + 0x0008)
   71AA 36 14         [10] 6042 	ld	(hl),#0x14
                           6043 ;src/main.c:188: enemy.pursue = 0;
   71AC 21 FC 90      [10] 6044 	ld	hl,#(_enemy + 0x000d)
   71AF 36 00         [10] 6045 	ld	(hl),#0x00
                           6046 ;src/main.c:189: break;
   71B1 18 6D         [12] 6047 	jr	00121$
                           6048 ;src/main.c:190: case 2:
   71B3                    6049 00118$:
                           6050 ;src/main.c:191: erase(player.lx,player.ly,0);
   71B3 21 E7 90      [10] 6051 	ld	hl, #(_player + 0x0003) + 0
   71B6 56            [ 7] 6052 	ld	d,(hl)
   71B7 21 E6 90      [10] 6053 	ld	hl, #(_player + 0x0002) + 0
   71BA 46            [ 7] 6054 	ld	b,(hl)
   71BB AF            [ 4] 6055 	xor	a, a
   71BC F5            [11] 6056 	push	af
   71BD 33            [ 6] 6057 	inc	sp
   71BE D5            [11] 6058 	push	de
   71BF 33            [ 6] 6059 	inc	sp
   71C0 C5            [11] 6060 	push	bc
   71C1 33            [ 6] 6061 	inc	sp
   71C2 CD E4 53      [17] 6062 	call	_erase
   71C5 F1            [10] 6063 	pop	af
   71C6 33            [ 6] 6064 	inc	sp
                           6065 ;src/main.c:192: player.x =originsp[map-1][0];
   71C7 21 CF 90      [10] 6066 	ld	hl,#_map + 0
   71CA 56            [ 7] 6067 	ld	d, (hl)
   71CB 15            [ 4] 6068 	dec	d
   71CC 6A            [ 4] 6069 	ld	l,d
   71CD 26 00         [ 7] 6070 	ld	h,#0x00
   71CF 29            [11] 6071 	add	hl, hl
   71D0 11 31 4B      [10] 6072 	ld	de,#_originsp
   71D3 19            [11] 6073 	add	hl,de
   71D4 7E            [ 7] 6074 	ld	a,(hl)
   71D5 32 E4 90      [13] 6075 	ld	(#_player),a
                           6076 ;src/main.c:193: player.y = originsp[map-1][1];
   71D8 21 CF 90      [10] 6077 	ld	hl,#_map + 0
   71DB 56            [ 7] 6078 	ld	d, (hl)
   71DC 15            [ 4] 6079 	dec	d
   71DD 6A            [ 4] 6080 	ld	l,d
   71DE 26 00         [ 7] 6081 	ld	h,#0x00
   71E0 29            [11] 6082 	add	hl, hl
   71E1 11 31 4B      [10] 6083 	ld	de,#_originsp
   71E4 19            [11] 6084 	add	hl,de
   71E5 23            [ 6] 6085 	inc	hl
   71E6 7E            [ 7] 6086 	ld	a,(hl)
   71E7 32 E5 90      [13] 6087 	ld	(#(_player + 0x0001)),a
                           6088 ;src/main.c:194: player.lx =originsp[map-1][0];
   71EA 21 CF 90      [10] 6089 	ld	hl,#_map + 0
   71ED 56            [ 7] 6090 	ld	d, (hl)
   71EE 15            [ 4] 6091 	dec	d
   71EF 6A            [ 4] 6092 	ld	l,d
   71F0 26 00         [ 7] 6093 	ld	h,#0x00
   71F2 29            [11] 6094 	add	hl, hl
   71F3 11 31 4B      [10] 6095 	ld	de,#_originsp
   71F6 19            [11] 6096 	add	hl,de
   71F7 7E            [ 7] 6097 	ld	a,(hl)
   71F8 32 E6 90      [13] 6098 	ld	(#(_player + 0x0002)),a
                           6099 ;src/main.c:195: player.ly = originsp[map-1][1];
   71FB 21 CF 90      [10] 6100 	ld	hl,#_map + 0
   71FE 56            [ 7] 6101 	ld	d, (hl)
   71FF 15            [ 4] 6102 	dec	d
   7200 6A            [ 4] 6103 	ld	l,d
   7201 26 00         [ 7] 6104 	ld	h,#0x00
   7203 29            [11] 6105 	add	hl, hl
   7204 11 31 4B      [10] 6106 	ld	de,#_originsp
   7207 19            [11] 6107 	add	hl,de
   7208 23            [ 6] 6108 	inc	hl
   7209 7E            [ 7] 6109 	ld	a,(hl)
   720A 21 E7 90      [10] 6110 	ld	hl,#(_player + 0x0003)
   720D 77            [ 7] 6111 	ld	(hl),a
                           6112 ;src/main.c:196: player.life -= 1;
   720E 3A EA 90      [13] 6113 	ld	a, (#(_player + 0x0006) + 0)
   7211 C6 FF         [ 7] 6114 	add	a,#0xFF
   7213 32 EA 90      [13] 6115 	ld	(#(_player + 0x0006)),a
                           6116 ;src/main.c:197: player.atk = 20;
   7216 21 EC 90      [10] 6117 	ld	hl,#(_player + 0x0008)
   7219 36 14         [10] 6118 	ld	(hl),#0x14
                           6119 ;src/main.c:198: enemy.pursue = 0;
   721B 21 FC 90      [10] 6120 	ld	hl,#(_enemy + 0x000d)
   721E 36 00         [10] 6121 	ld	(hl),#0x00
                           6122 ;src/main.c:200: }
   7220                    6123 00121$:
                           6124 ;src/main.c:202: if(temp > 10)
   7220 3E 0A         [ 7] 6125 	ld	a,#0x0A
   7222 FD 21 CE 90   [14] 6126 	ld	iy,#_temp
   7226 FD 96 00      [19] 6127 	sub	a, 0 (iy)
   7229 30 08         [12] 6128 	jr	NC,00123$
                           6129 ;src/main.c:203: temp = 0;
   722B FD 21 CE 90   [14] 6130 	ld	iy,#_temp
   722F FD 36 00 00   [19] 6131 	ld	0 (iy),#0x00
   7233                    6132 00123$:
                           6133 ;src/main.c:204: temp += 1;
   7233 FD 21 CE 90   [14] 6134 	ld	iy,#_temp
   7237 FD 34 00      [23] 6135 	inc	0 (iy)
                           6136 ;src/main.c:205: player.latk = player.atk;
   723A 11 ED 90      [10] 6137 	ld	de,#_player + 9
   723D 3A EC 90      [13] 6138 	ld	a, (#(_player + 0x0008) + 0)
   7240 12            [ 7] 6139 	ld	(de),a
                           6140 ;src/main.c:207: cpct_scanKeyboard_f();
   7241 CD 26 8B      [17] 6141 	call	_cpct_scanKeyboard_f
                           6142 ;src/main.c:208: player.sprite = checkKeyboard();
   7244 CD D0 6A      [17] 6143 	call	_checkKeyboard
   7247 5D            [ 4] 6144 	ld	e,l
   7248 54            [ 4] 6145 	ld	d,h
   7249 ED 53 E8 90   [20] 6146 	ld	((_player + 0x0004)), de
                           6147 ;src/main.c:209: checkBoundsCollisions(&n.corazon,&n.bullet);
   724D 21 D9 90      [10] 6148 	ld	hl,#(_n + 0x0002)
   7250 11 D8 90      [10] 6149 	ld	de,#(_n + 0x0001)
   7253 E5            [11] 6150 	push	hl
   7254 D5            [11] 6151 	push	de
   7255 CD 7F 61      [17] 6152 	call	_checkBoundsCollisions
   7258 F1            [10] 6153 	pop	af
   7259 F1            [10] 6154 	pop	af
                           6155 ;src/main.c:211: if(arrow == 1){
   725A 3A D2 90      [13] 6156 	ld	a,(#_arrow + 0)
   725D 3D            [ 4] 6157 	dec	a
   725E C2 F1 72      [10] 6158 	jp	NZ,00133$
                           6159 ;src/main.c:212: moveObject();
   7261 CD 4C 6D      [17] 6160 	call	_moveObject
                           6161 ;src/main.c:213: bound = checkArrowCollisions();
   7264 CD 87 68      [17] 6162 	call	_checkArrowCollisions
   7267 FD 21 D4 90   [14] 6163 	ld	iy,#_bound
   726B FD 75 00      [19] 6164 	ld	0 (iy),l
                           6165 ;src/main.c:214: if(object.dir == 2 || object.dir == 8)
   726E 21 E1 90      [10] 6166 	ld	hl, #_object + 7
   7271 7E            [ 7] 6167 	ld	a, (hl)
   7272 FE 02         [ 7] 6168 	cp	a,#0x02
   7274 28 04         [12] 6169 	jr	Z,00124$
   7276 D6 08         [ 7] 6170 	sub	a, #0x08
   7278 20 04         [12] 6171 	jr	NZ,00125$
   727A                    6172 00124$:
                           6173 ;src/main.c:215: atkObj = 21;
   727A 06 15         [ 7] 6174 	ld	b,#0x15
   727C 18 02         [12] 6175 	jr	00126$
   727E                    6176 00125$:
                           6177 ;src/main.c:217: atkObj = 22;
   727E 06 16         [ 7] 6178 	ld	b,#0x16
   7280                    6179 00126$:
                           6180 ;src/main.c:218: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
   7280 3A F7 90      [13] 6181 	ld	a, (#(_enemy + 0x0008) + 0)
   7283 B7            [ 4] 6182 	or	a, a
   7284 28 6B         [12] 6183 	jr	Z,00133$
   7286 3A F0 90      [13] 6184 	ld	a, (#(_enemy + 0x0001) + 0)
   7289 21 EF 90      [10] 6185 	ld	hl, #_enemy + 0
   728C 4E            [ 7] 6186 	ld	c,(hl)
   728D 21 DB 90      [10] 6187 	ld	hl, #_object + 1
   7290 5E            [ 7] 6188 	ld	e,(hl)
   7291 21 DA 90      [10] 6189 	ld	hl, #_object + 0
   7294 56            [ 7] 6190 	ld	d,(hl)
   7295 C5            [11] 6191 	push	bc
   7296 33            [ 6] 6192 	inc	sp
   7297 F5            [11] 6193 	push	af
   7298 33            [ 6] 6194 	inc	sp
   7299 79            [ 4] 6195 	ld	a,c
   729A F5            [11] 6196 	push	af
   729B 33            [ 6] 6197 	inc	sp
   729C 7B            [ 4] 6198 	ld	a,e
   729D F5            [11] 6199 	push	af
   729E 33            [ 6] 6200 	inc	sp
   729F D5            [11] 6201 	push	de
   72A0 33            [ 6] 6202 	inc	sp
   72A1 CD FF 60      [17] 6203 	call	_checkCollisions
   72A4 F1            [10] 6204 	pop	af
   72A5 F1            [10] 6205 	pop	af
   72A6 33            [ 6] 6206 	inc	sp
   72A7 2D            [ 4] 6207 	dec	l
   72A8 20 47         [12] 6208 	jr	NZ,00133$
   72AA 3A D4 90      [13] 6209 	ld	a,(#_bound + 0)
   72AD B7            [ 4] 6210 	or	a, a
   72AE 20 41         [12] 6211 	jr	NZ,00133$
                           6212 ;src/main.c:219: enemy.life -= 1;
   72B0 3A F7 90      [13] 6213 	ld	a, (#(_enemy + 0x0008) + 0)
   72B3 C6 FF         [ 7] 6214 	add	a,#0xFF
   72B5 32 F7 90      [13] 6215 	ld	(#(_enemy + 0x0008)),a
                           6216 ;src/main.c:220: erase(enemy.lx,enemy.ly,0);
   72B8 21 F2 90      [10] 6217 	ld	hl, #(_enemy + 0x0003) + 0
   72BB 46            [ 7] 6218 	ld	b,(hl)
   72BC 21 F1 90      [10] 6219 	ld	hl, #(_enemy + 0x0002) + 0
   72BF 56            [ 7] 6220 	ld	d,(hl)
   72C0 AF            [ 4] 6221 	xor	a, a
   72C1 F5            [11] 6222 	push	af
   72C2 33            [ 6] 6223 	inc	sp
   72C3 4A            [ 4] 6224 	ld	c, d
   72C4 C5            [11] 6225 	push	bc
   72C5 CD E4 53      [17] 6226 	call	_erase
   72C8 F1            [10] 6227 	pop	af
   72C9 33            [ 6] 6228 	inc	sp
                           6229 ;src/main.c:221: enemy.x = enemy.ox;
   72CA 21 F3 90      [10] 6230 	ld	hl, #(_enemy + 0x0004) + 0
   72CD 56            [ 7] 6231 	ld	d,(hl)
   72CE 21 EF 90      [10] 6232 	ld	hl,#_enemy
   72D1 72            [ 7] 6233 	ld	(hl),d
                           6234 ;src/main.c:222: enemy.y = enemy.oy;
   72D2 3A F4 90      [13] 6235 	ld	a, (#(_enemy + 0x0005) + 0)
   72D5 32 F0 90      [13] 6236 	ld	(#(_enemy + 0x0001)),a
                           6237 ;src/main.c:223: enemy.lx = enemy.x;
   72D8 21 F1 90      [10] 6238 	ld	hl,#(_enemy + 0x0002)
   72DB 72            [ 7] 6239 	ld	(hl),d
                           6240 ;src/main.c:224: enemy.ly = enemy.y;
   72DC 32 F2 90      [13] 6241 	ld	(#(_enemy + 0x0003)),a
                           6242 ;src/main.c:225: enemy.pursue = 0;
   72DF 21 FC 90      [10] 6243 	ld	hl,#(_enemy + 0x000d)
   72E2 36 00         [10] 6244 	ld	(hl),#0x00
                           6245 ;src/main.c:226: object.vivo = 0;
   72E4 21 E0 90      [10] 6246 	ld	hl,#_object + 6
   72E7 36 00         [10] 6247 	ld	(hl),#0x00
                           6248 ;src/main.c:227: bound = 1;
   72E9 FD 21 D4 90   [14] 6249 	ld	iy,#_bound
   72ED FD 36 00 01   [19] 6250 	ld	0 (iy),#0x01
   72F1                    6251 00133$:
                           6252 ;src/main.c:231: if(player.life == 0){
   72F1 3A EA 90      [13] 6253 	ld	a, (#(_player + 0x0006) + 0)
   72F4 B7            [ 4] 6254 	or	a, a
   72F5 C2 8A 70      [10] 6255 	jp	NZ,00137$
                           6256 ;src/main.c:232: gameOver();
   72F8 CD 81 6D      [17] 6257 	call	_gameOver
                           6258 ;src/main.c:233: finish = 1;
   72FB 21 D1 90      [10] 6259 	ld	hl,#_finish + 0
   72FE 36 01         [10] 6260 	ld	(hl), #0x01
   7300 C3 8A 70      [10] 6261 	jp	00137$
                           6262 ;src/main.c:242: void credits(){
                           6263 ;	---------------------------------
                           6264 ; Function credits
                           6265 ; ---------------------------------
   7303                    6266 _credits::
                           6267 ;src/main.c:244: cpct_clearScreen(0);
   7303 21 00 40      [10] 6268 	ld	hl,#0x4000
   7306 E5            [11] 6269 	push	hl
   7307 AF            [ 4] 6270 	xor	a, a
   7308 F5            [11] 6271 	push	af
   7309 33            [ 6] 6272 	inc	sp
   730A 26 C0         [ 7] 6273 	ld	h, #0xC0
   730C E5            [11] 6274 	push	hl
   730D CD F5 8D      [17] 6275 	call	_cpct_memset
                           6276 ;src/main.c:246: memptr = cpct_getScreenPtr(VMEM, 18, 30); 
   7310 21 12 1E      [10] 6277 	ld	hl,#0x1E12
   7313 E5            [11] 6278 	push	hl
   7314 21 00 C0      [10] 6279 	ld	hl,#0xC000
   7317 E5            [11] 6280 	push	hl
   7318 CD E8 8E      [17] 6281 	call	_cpct_getScreenPtr
                           6282 ;src/main.c:247: cpct_drawStringM0("Grupo Pyxis", memptr, 1, 0); 
   731B EB            [ 4] 6283 	ex	de,hl
   731C 01 E9 73      [10] 6284 	ld	bc,#___str_8+0
   731F 21 01 00      [10] 6285 	ld	hl,#0x0001
   7322 E5            [11] 6286 	push	hl
   7323 D5            [11] 6287 	push	de
   7324 C5            [11] 6288 	push	bc
   7325 CD 07 8C      [17] 6289 	call	_cpct_drawStringM0
   7328 21 06 00      [10] 6290 	ld	hl,#6
   732B 39            [11] 6291 	add	hl,sp
   732C F9            [ 6] 6292 	ld	sp,hl
                           6293 ;src/main.c:249: memptr = cpct_getScreenPtr(VMEM, 23, 60); 
   732D 21 17 3C      [10] 6294 	ld	hl,#0x3C17
   7330 E5            [11] 6295 	push	hl
   7331 21 00 C0      [10] 6296 	ld	hl,#0xC000
   7334 E5            [11] 6297 	push	hl
   7335 CD E8 8E      [17] 6298 	call	_cpct_getScreenPtr
                           6299 ;src/main.c:250: cpct_drawStringM0("Miembros:", memptr, 1, 0); 
   7338 EB            [ 4] 6300 	ex	de,hl
   7339 01 F5 73      [10] 6301 	ld	bc,#___str_9+0
   733C 21 01 00      [10] 6302 	ld	hl,#0x0001
   733F E5            [11] 6303 	push	hl
   7340 D5            [11] 6304 	push	de
   7341 C5            [11] 6305 	push	bc
   7342 CD 07 8C      [17] 6306 	call	_cpct_drawStringM0
   7345 21 06 00      [10] 6307 	ld	hl,#6
   7348 39            [11] 6308 	add	hl,sp
   7349 F9            [ 6] 6309 	ld	sp,hl
                           6310 ;src/main.c:252: memptr = cpct_getScreenPtr(VMEM, 10, 80); 
   734A 21 0A 50      [10] 6311 	ld	hl,#0x500A
   734D E5            [11] 6312 	push	hl
   734E 21 00 C0      [10] 6313 	ld	hl,#0xC000
   7351 E5            [11] 6314 	push	hl
   7352 CD E8 8E      [17] 6315 	call	_cpct_getScreenPtr
                           6316 ;src/main.c:253: cpct_drawStringM0("Alberto Martinez", memptr,2, 0); 
   7355 EB            [ 4] 6317 	ex	de,hl
   7356 01 FF 73      [10] 6318 	ld	bc,#___str_10+0
   7359 21 02 00      [10] 6319 	ld	hl,#0x0002
   735C E5            [11] 6320 	push	hl
   735D D5            [11] 6321 	push	de
   735E C5            [11] 6322 	push	bc
   735F CD 07 8C      [17] 6323 	call	_cpct_drawStringM0
   7362 21 06 00      [10] 6324 	ld	hl,#6
   7365 39            [11] 6325 	add	hl,sp
   7366 F9            [ 6] 6326 	ld	sp,hl
                           6327 ;src/main.c:254: memptr = cpct_getScreenPtr(VMEM, 27, 95); 
   7367 21 1B 5F      [10] 6328 	ld	hl,#0x5F1B
   736A E5            [11] 6329 	push	hl
   736B 21 00 C0      [10] 6330 	ld	hl,#0xC000
   736E E5            [11] 6331 	push	hl
   736F CD E8 8E      [17] 6332 	call	_cpct_getScreenPtr
                           6333 ;src/main.c:255: cpct_drawStringM0("Martinez", memptr,2, 0); 
   7372 EB            [ 4] 6334 	ex	de,hl
   7373 01 10 74      [10] 6335 	ld	bc,#___str_11+0
   7376 21 02 00      [10] 6336 	ld	hl,#0x0002
   7379 E5            [11] 6337 	push	hl
   737A D5            [11] 6338 	push	de
   737B C5            [11] 6339 	push	bc
   737C CD 07 8C      [17] 6340 	call	_cpct_drawStringM0
   737F 21 06 00      [10] 6341 	ld	hl,#6
   7382 39            [11] 6342 	add	hl,sp
   7383 F9            [ 6] 6343 	ld	sp,hl
                           6344 ;src/main.c:257: memptr = cpct_getScreenPtr(VMEM, 13, 115); 
   7384 21 0D 73      [10] 6345 	ld	hl,#0x730D
   7387 E5            [11] 6346 	push	hl
   7388 21 00 C0      [10] 6347 	ld	hl,#0xC000
   738B E5            [11] 6348 	push	hl
   738C CD E8 8E      [17] 6349 	call	_cpct_getScreenPtr
                           6350 ;src/main.c:258: cpct_drawStringM0("Josep Domenech", memptr,2, 0);
   738F EB            [ 4] 6351 	ex	de,hl
   7390 01 19 74      [10] 6352 	ld	bc,#___str_12+0
   7393 21 02 00      [10] 6353 	ld	hl,#0x0002
   7396 E5            [11] 6354 	push	hl
   7397 D5            [11] 6355 	push	de
   7398 C5            [11] 6356 	push	bc
   7399 CD 07 8C      [17] 6357 	call	_cpct_drawStringM0
   739C 21 06 00      [10] 6358 	ld	hl,#6
   739F 39            [11] 6359 	add	hl,sp
   73A0 F9            [ 6] 6360 	ld	sp,hl
                           6361 ;src/main.c:259: memptr = cpct_getScreenPtr(VMEM, 27, 125); 
   73A1 21 1B 7D      [10] 6362 	ld	hl,#0x7D1B
   73A4 E5            [11] 6363 	push	hl
   73A5 21 00 C0      [10] 6364 	ld	hl,#0xC000
   73A8 E5            [11] 6365 	push	hl
   73A9 CD E8 8E      [17] 6366 	call	_cpct_getScreenPtr
                           6367 ;src/main.c:260: cpct_drawStringM0("Mingot", memptr, 2, 0);  
   73AC EB            [ 4] 6368 	ex	de,hl
   73AD 01 28 74      [10] 6369 	ld	bc,#___str_13+0
   73B0 21 02 00      [10] 6370 	ld	hl,#0x0002
   73B3 E5            [11] 6371 	push	hl
   73B4 D5            [11] 6372 	push	de
   73B5 C5            [11] 6373 	push	bc
   73B6 CD 07 8C      [17] 6374 	call	_cpct_drawStringM0
   73B9 21 06 00      [10] 6375 	ld	hl,#6
   73BC 39            [11] 6376 	add	hl,sp
   73BD F9            [ 6] 6377 	ld	sp,hl
                           6378 ;src/main.c:262: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   73BE 21 0C AF      [10] 6379 	ld	hl,#0xAF0C
   73C1 E5            [11] 6380 	push	hl
   73C2 21 00 C0      [10] 6381 	ld	hl,#0xC000
   73C5 E5            [11] 6382 	push	hl
   73C6 CD E8 8E      [17] 6383 	call	_cpct_getScreenPtr
                           6384 ;src/main.c:263: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   73C9 EB            [ 4] 6385 	ex	de,hl
   73CA 01 2F 74      [10] 6386 	ld	bc,#___str_14+0
   73CD 21 01 00      [10] 6387 	ld	hl,#0x0001
   73D0 E5            [11] 6388 	push	hl
   73D1 D5            [11] 6389 	push	de
   73D2 C5            [11] 6390 	push	bc
   73D3 CD 07 8C      [17] 6391 	call	_cpct_drawStringM0
   73D6 21 06 00      [10] 6392 	ld	hl,#6
   73D9 39            [11] 6393 	add	hl,sp
   73DA F9            [ 6] 6394 	ld	sp,hl
                           6395 ;src/main.c:267: while (1){
   73DB                    6396 00104$:
                           6397 ;src/main.c:268: cpct_scanKeyboard_f();
   73DB CD 26 8B      [17] 6398 	call	_cpct_scanKeyboard_f
                           6399 ;src/main.c:269: if(cpct_isKeyPressed(Key_Space)) {
   73DE 21 05 80      [10] 6400 	ld	hl,#0x8005
   73E1 CD 1A 8B      [17] 6401 	call	_cpct_isKeyPressed
   73E4 7D            [ 4] 6402 	ld	a,l
   73E5 B7            [ 4] 6403 	or	a, a
   73E6 28 F3         [12] 6404 	jr	Z,00104$
                           6405 ;src/main.c:271: return;
   73E8 C9            [10] 6406 	ret
   73E9                    6407 ___str_8:
   73E9 47 72 75 70 6F 20  6408 	.ascii "Grupo Pyxis"
        50 79 78 69 73
   73F4 00                 6409 	.db 0x00
   73F5                    6410 ___str_9:
   73F5 4D 69 65 6D 62 72  6411 	.ascii "Miembros:"
        6F 73 3A
   73FE 00                 6412 	.db 0x00
   73FF                    6413 ___str_10:
   73FF 41 6C 62 65 72 74  6414 	.ascii "Alberto Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A
   740F 00                 6415 	.db 0x00
   7410                    6416 ___str_11:
   7410 4D 61 72 74 69 6E  6417 	.ascii "Martinez"
        65 7A
   7418 00                 6418 	.db 0x00
   7419                    6419 ___str_12:
   7419 4A 6F 73 65 70 20  6420 	.ascii "Josep Domenech"
        44 6F 6D 65 6E 65
        63 68
   7427 00                 6421 	.db 0x00
   7428                    6422 ___str_13:
   7428 4D 69 6E 67 6F 74  6423 	.ascii "Mingot"
   742E 00                 6424 	.db 0x00
   742F                    6425 ___str_14:
   742F 50 75 6C 73 61 20  6426 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   743C 00                 6427 	.db 0x00
                           6428 ;src/main.c:280: void controles(){
                           6429 ;	---------------------------------
                           6430 ; Function controles
                           6431 ; ---------------------------------
   743D                    6432 _controles::
                           6433 ;src/main.c:282: cpct_clearScreen(0);
   743D 21 00 40      [10] 6434 	ld	hl,#0x4000
   7440 E5            [11] 6435 	push	hl
   7441 AF            [ 4] 6436 	xor	a, a
   7442 F5            [11] 6437 	push	af
   7443 33            [ 6] 6438 	inc	sp
   7444 26 C0         [ 7] 6439 	ld	h, #0xC0
   7446 E5            [11] 6440 	push	hl
   7447 CD F5 8D      [17] 6441 	call	_cpct_memset
                           6442 ;src/main.c:284: memptr = cpct_getScreenPtr(VMEM, 23, 60); 
   744A 21 17 3C      [10] 6443 	ld	hl,#0x3C17
   744D E5            [11] 6444 	push	hl
   744E 21 00 C0      [10] 6445 	ld	hl,#0xC000
   7451 E5            [11] 6446 	push	hl
   7452 CD E8 8E      [17] 6447 	call	_cpct_getScreenPtr
                           6448 ;src/main.c:285: cpct_drawStringM0("Controles:", memptr, 1, 0); 
   7455 EB            [ 4] 6449 	ex	de,hl
   7456 01 06 75      [10] 6450 	ld	bc,#___str_15+0
   7459 21 01 00      [10] 6451 	ld	hl,#0x0001
   745C E5            [11] 6452 	push	hl
   745D D5            [11] 6453 	push	de
   745E C5            [11] 6454 	push	bc
   745F CD 07 8C      [17] 6455 	call	_cpct_drawStringM0
   7462 21 06 00      [10] 6456 	ld	hl,#6
   7465 39            [11] 6457 	add	hl,sp
   7466 F9            [ 6] 6458 	ld	sp,hl
                           6459 ;src/main.c:287: memptr = cpct_getScreenPtr(VMEM, 11, 80); 
   7467 21 0B 50      [10] 6460 	ld	hl,#0x500B
   746A E5            [11] 6461 	push	hl
   746B 21 00 C0      [10] 6462 	ld	hl,#0xC000
   746E E5            [11] 6463 	push	hl
   746F CD E8 8E      [17] 6464 	call	_cpct_getScreenPtr
                           6465 ;src/main.c:288: cpct_drawStringM0("Movimiento: ", memptr, 2, 0); 
   7472 EB            [ 4] 6466 	ex	de,hl
   7473 01 11 75      [10] 6467 	ld	bc,#___str_16+0
   7476 21 02 00      [10] 6468 	ld	hl,#0x0002
   7479 E5            [11] 6469 	push	hl
   747A D5            [11] 6470 	push	de
   747B C5            [11] 6471 	push	bc
   747C CD 07 8C      [17] 6472 	call	_cpct_drawStringM0
   747F 21 06 00      [10] 6473 	ld	hl,#6
   7482 39            [11] 6474 	add	hl,sp
   7483 F9            [ 6] 6475 	ld	sp,hl
                           6476 ;src/main.c:289: memptr = cpct_getScreenPtr(VMEM, 27, 95); 
   7484 21 1B 5F      [10] 6477 	ld	hl,#0x5F1B
   7487 E5            [11] 6478 	push	hl
   7488 21 00 C0      [10] 6479 	ld	hl,#0xC000
   748B E5            [11] 6480 	push	hl
   748C CD E8 8E      [17] 6481 	call	_cpct_getScreenPtr
                           6482 ;src/main.c:290: cpct_drawStringM0("Flechas", memptr, 2, 0); 
   748F EB            [ 4] 6483 	ex	de,hl
   7490 01 1E 75      [10] 6484 	ld	bc,#___str_17+0
   7493 21 02 00      [10] 6485 	ld	hl,#0x0002
   7496 E5            [11] 6486 	push	hl
   7497 D5            [11] 6487 	push	de
   7498 C5            [11] 6488 	push	bc
   7499 CD 07 8C      [17] 6489 	call	_cpct_drawStringM0
   749C 21 06 00      [10] 6490 	ld	hl,#6
   749F 39            [11] 6491 	add	hl,sp
   74A0 F9            [ 6] 6492 	ld	sp,hl
                           6493 ;src/main.c:292: memptr = cpct_getScreenPtr(VMEM, 13, 115); 
   74A1 21 0D 73      [10] 6494 	ld	hl,#0x730D
   74A4 E5            [11] 6495 	push	hl
   74A5 21 00 C0      [10] 6496 	ld	hl,#0xC000
   74A8 E5            [11] 6497 	push	hl
   74A9 CD E8 8E      [17] 6498 	call	_cpct_getScreenPtr
                           6499 ;src/main.c:293: cpct_drawStringM0("Esc: Menu", memptr, 2, 0); 
   74AC EB            [ 4] 6500 	ex	de,hl
   74AD 01 26 75      [10] 6501 	ld	bc,#___str_18+0
   74B0 21 02 00      [10] 6502 	ld	hl,#0x0002
   74B3 E5            [11] 6503 	push	hl
   74B4 D5            [11] 6504 	push	de
   74B5 C5            [11] 6505 	push	bc
   74B6 CD 07 8C      [17] 6506 	call	_cpct_drawStringM0
   74B9 21 06 00      [10] 6507 	ld	hl,#6
   74BC 39            [11] 6508 	add	hl,sp
   74BD F9            [ 6] 6509 	ld	sp,hl
                           6510 ;src/main.c:294: memptr = cpct_getScreenPtr(VMEM, 13, 130); 
   74BE 21 0D 82      [10] 6511 	ld	hl,#0x820D
   74C1 E5            [11] 6512 	push	hl
   74C2 21 00 C0      [10] 6513 	ld	hl,#0xC000
   74C5 E5            [11] 6514 	push	hl
   74C6 CD E8 8E      [17] 6515 	call	_cpct_getScreenPtr
                           6516 ;src/main.c:295: cpct_drawStringM0("Disparar: X", memptr, 2, 0); 
   74C9 EB            [ 4] 6517 	ex	de,hl
   74CA 01 30 75      [10] 6518 	ld	bc,#___str_19+0
   74CD 21 02 00      [10] 6519 	ld	hl,#0x0002
   74D0 E5            [11] 6520 	push	hl
   74D1 D5            [11] 6521 	push	de
   74D2 C5            [11] 6522 	push	bc
   74D3 CD 07 8C      [17] 6523 	call	_cpct_drawStringM0
   74D6 21 06 00      [10] 6524 	ld	hl,#6
   74D9 39            [11] 6525 	add	hl,sp
   74DA F9            [ 6] 6526 	ld	sp,hl
                           6527 ;src/main.c:297: memptr = cpct_getScreenPtr(VMEM, 12, 175); 
   74DB 21 0C AF      [10] 6528 	ld	hl,#0xAF0C
   74DE E5            [11] 6529 	push	hl
   74DF 21 00 C0      [10] 6530 	ld	hl,#0xC000
   74E2 E5            [11] 6531 	push	hl
   74E3 CD E8 8E      [17] 6532 	call	_cpct_getScreenPtr
                           6533 ;src/main.c:298: cpct_drawStringM0("Pulsa espacio", memptr, 1, 0); 
   74E6 EB            [ 4] 6534 	ex	de,hl
   74E7 01 3C 75      [10] 6535 	ld	bc,#___str_20+0
   74EA 21 01 00      [10] 6536 	ld	hl,#0x0001
   74ED E5            [11] 6537 	push	hl
   74EE D5            [11] 6538 	push	de
   74EF C5            [11] 6539 	push	bc
   74F0 CD 07 8C      [17] 6540 	call	_cpct_drawStringM0
   74F3 21 06 00      [10] 6541 	ld	hl,#6
   74F6 39            [11] 6542 	add	hl,sp
   74F7 F9            [ 6] 6543 	ld	sp,hl
                           6544 ;src/main.c:300: while (1){
   74F8                    6545 00104$:
                           6546 ;src/main.c:301: cpct_scanKeyboard_f();
   74F8 CD 26 8B      [17] 6547 	call	_cpct_scanKeyboard_f
                           6548 ;src/main.c:302: if(cpct_isKeyPressed(Key_Space)) {
   74FB 21 05 80      [10] 6549 	ld	hl,#0x8005
   74FE CD 1A 8B      [17] 6550 	call	_cpct_isKeyPressed
   7501 7D            [ 4] 6551 	ld	a,l
   7502 B7            [ 4] 6552 	or	a, a
   7503 28 F3         [12] 6553 	jr	Z,00104$
                           6554 ;src/main.c:304: return;
   7505 C9            [10] 6555 	ret
   7506                    6556 ___str_15:
   7506 43 6F 6E 74 72 6F  6557 	.ascii "Controles:"
        6C 65 73 3A
   7510 00                 6558 	.db 0x00
   7511                    6559 ___str_16:
   7511 4D 6F 76 69 6D 69  6560 	.ascii "Movimiento: "
        65 6E 74 6F 3A 20
   751D 00                 6561 	.db 0x00
   751E                    6562 ___str_17:
   751E 46 6C 65 63 68 61  6563 	.ascii "Flechas"
        73
   7525 00                 6564 	.db 0x00
   7526                    6565 ___str_18:
   7526 45 73 63 3A 20 4D  6566 	.ascii "Esc: Menu"
        65 6E 75
   752F 00                 6567 	.db 0x00
   7530                    6568 ___str_19:
   7530 44 69 73 70 61 72  6569 	.ascii "Disparar: X"
        61 72 3A 20 58
   753B 00                 6570 	.db 0x00
   753C                    6571 ___str_20:
   753C 50 75 6C 73 61 20  6572 	.ascii "Pulsa espacio"
        65 73 70 61 63 69
        6F
   7549 00                 6573 	.db 0x00
                           6574 ;src/main.c:312: void main(void) {
                           6575 ;	---------------------------------
                           6576 ; Function main
                           6577 ; ---------------------------------
   754A                    6578 _main::
                           6579 ;src/main.c:314: init();
   754A CD 08 4B      [17] 6580 	call	_init
                           6581 ;src/main.c:317: while(1){
   754D                    6582 00107$:
                           6583 ;src/main.c:318: x=menu();
   754D CD 0D 6E      [17] 6584 	call	_menu
   7550 5D            [ 4] 6585 	ld	e, l
   7551 54            [ 4] 6586 	ld	d, h
                           6587 ;src/main.c:319: switch(x){
   7552 CB 7A         [ 8] 6588 	bit	7, d
   7554 20 F7         [12] 6589 	jr	NZ,00107$
   7556 3E 03         [ 7] 6590 	ld	a,#0x03
   7558 BB            [ 4] 6591 	cp	a, e
   7559 3E 00         [ 7] 6592 	ld	a,#0x00
   755B 9A            [ 4] 6593 	sbc	a, d
   755C E2 61 75      [10] 6594 	jp	PO, 00123$
   755F EE 80         [ 7] 6595 	xor	a, #0x80
   7561                    6596 00123$:
   7561 FA 4D 75      [10] 6597 	jp	M,00107$
   7564 16 00         [ 7] 6598 	ld	d,#0x00
   7566 21 6C 75      [10] 6599 	ld	hl,#00124$
   7569 19            [11] 6600 	add	hl,de
   756A 19            [11] 6601 	add	hl,de
                           6602 ;src/main.c:320: case 0: return;break;
                           6603 ;src/main.c:321: case 1: game(); break;
   756B E9            [ 4] 6604 	jp	(hl)
   756C                    6605 00124$:
   756C 18 17         [12] 6606 	jr	00109$
   756E 18 06         [12] 6607 	jr	00102$
   7570 18 09         [12] 6608 	jr	00103$
   7572 18 0C         [12] 6609 	jr	00104$
   7574 18 0F         [12] 6610 	jr	00109$
   7576                    6611 00102$:
   7576 CD 57 70      [17] 6612 	call	_game
   7579 18 D2         [12] 6613 	jr	00107$
                           6614 ;src/main.c:322: case 2: credits();break;
   757B                    6615 00103$:
   757B CD 03 73      [17] 6616 	call	_credits
   757E 18 CD         [12] 6617 	jr	00107$
                           6618 ;src/main.c:323: case 3: controles();break;
   7580                    6619 00104$:
   7580 CD 3D 74      [17] 6620 	call	_controles
                           6621 ;src/main.c:324: }
   7583 18 C8         [12] 6622 	jr	00107$
   7585                    6623 00109$:
   7585 C9            [10] 6624 	ret
                           6625 	.area _CODE
                           6626 	.area _INITIALIZER
                           6627 	.area _CABS (ABS)
