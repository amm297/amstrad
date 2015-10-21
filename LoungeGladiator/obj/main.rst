                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Wed Oct 21 23:59:57 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _credits
                             14 	.globl _game
                             15 	.globl _enemyIa
                             16 	.globl _move
                             17 	.globl _arrowCheckings
                             18 	.globl _shoot
                             19 	.globl _vissionSensor
                             20 	.globl _followPlayer
                             21 	.globl _checkBoundsCollisions
                             22 	.globl _checkBoundsCollisionsEnemy
                             23 	.globl _moveObject
                             24 	.globl _menu
                             25 	.globl _gameOver
                             26 	.globl _initEnemies
                             27 	.globl _initPlayer
                             28 	.globl _init
                             29 	.globl _checkKeyboard
                             30 	.globl _checkArrowCollisions
                             31 	.globl _checkCollisions
                             32 	.globl _patrol
                             33 	.globl _movement
                             34 	.globl _setDirection
                             35 	.globl _chooseDirection
                             36 	.globl _detectPlayerRoom
                             37 	.globl _drawPickUps
                             38 	.globl _drawFatiga
                             39 	.globl _erases
                             40 	.globl _draws
                             41 	.globl _drawStats
                             42 	.globl _erase
                             43 	.globl _draw
                             44 	.globl _drawBullets
                             45 	.globl _drawVida
                             46 	.globl _drawMap
                             47 	.globl _cpct_getScreenPtr
                             48 	.globl _cpct_setPalette
                             49 	.globl _cpct_fw2hw
                             50 	.globl _cpct_waitVSYNC
                             51 	.globl _cpct_setVideoMode
                             52 	.globl _cpct_drawStringM0
                             53 	.globl _cpct_drawSolidBox
                             54 	.globl _cpct_drawSpriteMasked
                             55 	.globl _cpct_drawSprite
                             56 	.globl _cpct_isKeyPressed
                             57 	.globl _cpct_scanKeyboard_f
                             58 	.globl _cpct_scanKeyboard
                             59 	.globl _cpct_memset
                             60 	.globl _cpct_disableFirmware
                             61 	.globl _rand
                             62 	.globl _enemy
                             63 	.globl _player
                             64 	.globl _earrow
                             65 	.globl _parrow
                             66 	.globl _archer
                             67 	.globl _bounds
                             68 	.globl _bound
                             69 	.globl _following
                             70 	.globl _shooted
                             71 	.globl _arrow
                             72 	.globl _finish
                             73 	.globl _path
                             74 	.globl _map
                             75 	.globl _temp
                             76 	.globl _scene
                             77 	.globl _mapa2
                             78 	.globl _mapa1
                             79 	.globl _origins
                             80 	.globl _g_palette
                             81 ;--------------------------------------------------------
                             82 ; special function registers
                             83 ;--------------------------------------------------------
                             84 ;--------------------------------------------------------
                             85 ; ram data
                             86 ;--------------------------------------------------------
                             87 	.area _DATA
   6E00                      88 _scene::
   6E00                      89 	.ds 240
   6EF0                      90 _temp::
   6EF0                      91 	.ds 1
   6EF1                      92 _map::
   6EF1                      93 	.ds 1
   6EF2                      94 _path::
   6EF2                      95 	.ds 1
   6EF3                      96 _finish::
   6EF3                      97 	.ds 1
   6EF4                      98 _arrow::
   6EF4                      99 	.ds 1
   6EF5                     100 _shooted::
   6EF5                     101 	.ds 1
   6EF6                     102 _following::
   6EF6                     103 	.ds 1
   6EF7                     104 _bound::
   6EF7                     105 	.ds 1
   6EF8                     106 _bounds::
   6EF8                     107 	.ds 1
   6EF9                     108 _archer::
   6EF9                     109 	.ds 1
   6EFA                     110 _parrow::
   6EFA                     111 	.ds 10
   6F04                     112 _earrow::
   6F04                     113 	.ds 10
   6F0E                     114 _player::
   6F0E                     115 	.ds 11
   6F19                     116 _enemy::
   6F19                     117 	.ds 15
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
                            142 ;src/draws.h:14: void drawMap(u8 t){
                            143 ;	---------------------------------
                            144 ; Function drawMap
                            145 ; ---------------------------------
   46C0                     146 _drawMap::
   46C0 DD E5         [15]  147 	push	ix
   46C2 DD 21 00 00   [14]  148 	ld	ix,#0
   46C6 DD 39         [15]  149 	add	ix,sp
   46C8 21 F0 FF      [10]  150 	ld	hl,#-16
   46CB 39            [11]  151 	add	hl,sp
   46CC F9            [ 6]  152 	ld	sp,hl
                            153 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  154 	ld	a,4 (ix)
   46D0 3D            [ 4]  155 	dec	a
   46D1 C2 79 47      [10]  156 	jp	NZ,00104$
                            157 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  158 	ld	hl,#0x0000
   46D7 E3            [19]  159 	ex	(sp), hl
   46D8 DD 36 F8 00   [19]  160 	ld	-8 (ix),#0x00
   46DC DD 36 F9 00   [19]  161 	ld	-7 (ix),#0x00
                            162 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     163 00130$:
   46E0 3E 00         [ 7]  164 	ld	a,#<(_scene)
   46E2 DD 86 F8      [19]  165 	add	a, -8 (ix)
   46E5 DD 77 FE      [19]  166 	ld	-2 (ix),a
   46E8 3E 6E         [ 7]  167 	ld	a,#>(_scene)
   46EA DD 8E F9      [19]  168 	adc	a, -7 (ix)
   46ED DD 77 FF      [19]  169 	ld	-1 (ix),a
   46F0 3E 17         [ 7]  170 	ld	a,#<(_mapa1)
   46F2 DD 86 F8      [19]  171 	add	a, -8 (ix)
   46F5 DD 77 FA      [19]  172 	ld	-6 (ix),a
   46F8 3E 49         [ 7]  173 	ld	a,#>(_mapa1)
   46FA DD 8E F9      [19]  174 	adc	a, -7 (ix)
   46FD DD 77 FB      [19]  175 	ld	-5 (ix),a
   4700 DD 36 F2 00   [19]  176 	ld	-14 (ix),#0x00
   4704 DD 36 F3 00   [19]  177 	ld	-13 (ix),#0x00
   4708                     178 00115$:
                            179 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E FE      [19]  180 	ld	a,-2 (ix)
   470B DD 86 F2      [19]  181 	add	a, -14 (ix)
   470E DD 77 FC      [19]  182 	ld	-4 (ix),a
   4711 DD 7E FF      [19]  183 	ld	a,-1 (ix)
   4714 DD 8E F3      [19]  184 	adc	a, -13 (ix)
   4717 DD 77 FD      [19]  185 	ld	-3 (ix),a
   471A DD 7E FA      [19]  186 	ld	a,-6 (ix)
   471D DD 86 F2      [19]  187 	add	a, -14 (ix)
   4720 DD 77 F6      [19]  188 	ld	-10 (ix),a
   4723 DD 7E FB      [19]  189 	ld	a,-5 (ix)
   4726 DD 8E F3      [19]  190 	adc	a, -13 (ix)
   4729 DD 77 F7      [19]  191 	ld	-9 (ix),a
   472C DD 6E F6      [19]  192 	ld	l,-10 (ix)
   472F DD 66 F7      [19]  193 	ld	h,-9 (ix)
   4732 7E            [ 7]  194 	ld	a,(hl)
   4733 DD 6E FC      [19]  195 	ld	l,-4 (ix)
   4736 DD 66 FD      [19]  196 	ld	h,-3 (ix)
   4739 77            [ 7]  197 	ld	(hl),a
                            198 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F2      [23]  199 	inc	-14 (ix)
   473D 20 03         [12]  200 	jr	NZ,00189$
   473F DD 34 F3      [23]  201 	inc	-13 (ix)
   4742                     202 00189$:
   4742 DD 7E F2      [19]  203 	ld	a,-14 (ix)
   4745 D6 14         [ 7]  204 	sub	a, #0x14
   4747 DD 7E F3      [19]  205 	ld	a,-13 (ix)
   474A 17            [ 4]  206 	rla
   474B 3F            [ 4]  207 	ccf
   474C 1F            [ 4]  208 	rra
   474D DE 80         [ 7]  209 	sbc	a, #0x80
   474F 38 B7         [12]  210 	jr	C,00115$
                            211 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E F8      [19]  212 	ld	a,-8 (ix)
   4754 C6 14         [ 7]  213 	add	a, #0x14
   4756 DD 77 F8      [19]  214 	ld	-8 (ix),a
   4759 DD 7E F9      [19]  215 	ld	a,-7 (ix)
   475C CE 00         [ 7]  216 	adc	a, #0x00
   475E DD 77 F9      [19]  217 	ld	-7 (ix),a
   4761 DD 34 F0      [23]  218 	inc	-16 (ix)
   4764 20 03         [12]  219 	jr	NZ,00190$
   4766 DD 34 F1      [23]  220 	inc	-15 (ix)
   4769                     221 00190$:
   4769 DD 7E F0      [19]  222 	ld	a,-16 (ix)
   476C D6 0C         [ 7]  223 	sub	a, #0x0C
   476E DD 7E F1      [19]  224 	ld	a,-15 (ix)
   4771 17            [ 4]  225 	rla
   4772 3F            [ 4]  226 	ccf
   4773 1F            [ 4]  227 	rra
   4774 DE 80         [ 7]  228 	sbc	a, #0x80
   4776 DA E0 46      [10]  229 	jp	C,00130$
   4779                     230 00104$:
                            231 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  232 	ld	a,4 (ix)
   477C D6 02         [ 7]  233 	sub	a, #0x02
   477E C2 26 48      [10]  234 	jp	NZ,00141$
                            235 ;src/draws.h:27: for(y=0;y<height;y++){
   4781 21 00 00      [10]  236 	ld	hl,#0x0000
   4784 E3            [19]  237 	ex	(sp), hl
   4785 DD 36 F6 00   [19]  238 	ld	-10 (ix),#0x00
   4789 DD 36 F7 00   [19]  239 	ld	-9 (ix),#0x00
                            240 ;src/draws.h:28: for(x=0;x<width;x++){
   478D                     241 00134$:
   478D 3E 00         [ 7]  242 	ld	a,#<(_scene)
   478F DD 86 F6      [19]  243 	add	a, -10 (ix)
   4792 DD 77 FC      [19]  244 	ld	-4 (ix),a
   4795 3E 6E         [ 7]  245 	ld	a,#>(_scene)
   4797 DD 8E F7      [19]  246 	adc	a, -9 (ix)
   479A DD 77 FD      [19]  247 	ld	-3 (ix),a
   479D 3E 07         [ 7]  248 	ld	a,#<(_mapa2)
   479F DD 86 F6      [19]  249 	add	a, -10 (ix)
   47A2 DD 77 FA      [19]  250 	ld	-6 (ix),a
   47A5 3E 4A         [ 7]  251 	ld	a,#>(_mapa2)
   47A7 DD 8E F7      [19]  252 	adc	a, -9 (ix)
   47AA DD 77 FB      [19]  253 	ld	-5 (ix),a
   47AD DD 36 F2 00   [19]  254 	ld	-14 (ix),#0x00
   47B1 DD 36 F3 00   [19]  255 	ld	-13 (ix),#0x00
   47B5                     256 00119$:
                            257 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   47B5 DD 7E FC      [19]  258 	ld	a,-4 (ix)
   47B8 DD 86 F2      [19]  259 	add	a, -14 (ix)
   47BB DD 77 FE      [19]  260 	ld	-2 (ix),a
   47BE DD 7E FD      [19]  261 	ld	a,-3 (ix)
   47C1 DD 8E F3      [19]  262 	adc	a, -13 (ix)
   47C4 DD 77 FF      [19]  263 	ld	-1 (ix),a
   47C7 DD 7E FA      [19]  264 	ld	a,-6 (ix)
   47CA DD 86 F2      [19]  265 	add	a, -14 (ix)
   47CD DD 77 F8      [19]  266 	ld	-8 (ix),a
   47D0 DD 7E FB      [19]  267 	ld	a,-5 (ix)
   47D3 DD 8E F3      [19]  268 	adc	a, -13 (ix)
   47D6 DD 77 F9      [19]  269 	ld	-7 (ix),a
   47D9 DD 6E F8      [19]  270 	ld	l,-8 (ix)
   47DC DD 66 F9      [19]  271 	ld	h,-7 (ix)
   47DF 7E            [ 7]  272 	ld	a,(hl)
   47E0 DD 6E FE      [19]  273 	ld	l,-2 (ix)
   47E3 DD 66 FF      [19]  274 	ld	h,-1 (ix)
   47E6 77            [ 7]  275 	ld	(hl),a
                            276 ;src/draws.h:28: for(x=0;x<width;x++){
   47E7 DD 34 F2      [23]  277 	inc	-14 (ix)
   47EA 20 03         [12]  278 	jr	NZ,00193$
   47EC DD 34 F3      [23]  279 	inc	-13 (ix)
   47EF                     280 00193$:
   47EF DD 7E F2      [19]  281 	ld	a,-14 (ix)
   47F2 D6 14         [ 7]  282 	sub	a, #0x14
   47F4 DD 7E F3      [19]  283 	ld	a,-13 (ix)
   47F7 17            [ 4]  284 	rla
   47F8 3F            [ 4]  285 	ccf
   47F9 1F            [ 4]  286 	rra
   47FA DE 80         [ 7]  287 	sbc	a, #0x80
   47FC 38 B7         [12]  288 	jr	C,00119$
                            289 ;src/draws.h:27: for(y=0;y<height;y++){
   47FE DD 7E F6      [19]  290 	ld	a,-10 (ix)
   4801 C6 14         [ 7]  291 	add	a, #0x14
   4803 DD 77 F6      [19]  292 	ld	-10 (ix),a
   4806 DD 7E F7      [19]  293 	ld	a,-9 (ix)
   4809 CE 00         [ 7]  294 	adc	a, #0x00
   480B DD 77 F7      [19]  295 	ld	-9 (ix),a
   480E DD 34 F0      [23]  296 	inc	-16 (ix)
   4811 20 03         [12]  297 	jr	NZ,00194$
   4813 DD 34 F1      [23]  298 	inc	-15 (ix)
   4816                     299 00194$:
   4816 DD 7E F0      [19]  300 	ld	a,-16 (ix)
   4819 D6 0C         [ 7]  301 	sub	a, #0x0C
   481B DD 7E F1      [19]  302 	ld	a,-15 (ix)
   481E 17            [ 4]  303 	rla
   481F 3F            [ 4]  304 	ccf
   4820 1F            [ 4]  305 	rra
   4821 DE 80         [ 7]  306 	sbc	a, #0x80
   4823 DA 8D 47      [10]  307 	jp	C,00134$
                            308 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   4826                     309 00141$:
   4826 01 00 00      [10]  310 	ld	bc,#0x0000
   4829 DD 36 F6 00   [19]  311 	ld	-10 (ix),#0x00
   482D DD 36 F7 00   [19]  312 	ld	-9 (ix),#0x00
   4831 11 00 00      [10]  313 	ld	de,#0x0000
                            314 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4834                     315 00139$:
   4834 21 00 6E      [10]  316 	ld	hl,#_scene
   4837 19            [11]  317 	add	hl,de
   4838 DD 75 FC      [19]  318 	ld	-4 (ix),l
   483B DD 74 FD      [19]  319 	ld	-3 (ix),h
   483E DD 36 F4 00   [19]  320 	ld	-12 (ix),#0x00
   4842 DD 36 F5 00   [19]  321 	ld	-11 (ix),#0x00
   4846                     322 00123$:
                            323 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   4846 79            [ 4]  324 	ld	a,c
   4847 07            [ 4]  325 	rlca
   4848 07            [ 4]  326 	rlca
   4849 07            [ 4]  327 	rlca
   484A 07            [ 4]  328 	rlca
   484B E6 F0         [ 7]  329 	and	a,#0xF0
   484D 67            [ 4]  330 	ld	h,a
   484E DD 7E F4      [19]  331 	ld	a,-12 (ix)
   4851 87            [ 4]  332 	add	a, a
   4852 87            [ 4]  333 	add	a, a
   4853 C5            [11]  334 	push	bc
   4854 D5            [11]  335 	push	de
   4855 E5            [11]  336 	push	hl
   4856 33            [ 6]  337 	inc	sp
   4857 F5            [11]  338 	push	af
   4858 33            [ 6]  339 	inc	sp
   4859 21 00 C0      [10]  340 	ld	hl,#0xC000
   485C E5            [11]  341 	push	hl
   485D CD 0A 6D      [17]  342 	call	_cpct_getScreenPtr
   4860 D1            [10]  343 	pop	de
   4861 C1            [10]  344 	pop	bc
   4862 E5            [11]  345 	push	hl
   4863 FD E1         [14]  346 	pop	iy
                            347 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4865 DD 7E FC      [19]  348 	ld	a,-4 (ix)
   4868 DD 86 F4      [19]  349 	add	a, -12 (ix)
   486B 6F            [ 4]  350 	ld	l,a
   486C DD 7E FD      [19]  351 	ld	a,-3 (ix)
   486F DD 8E F5      [19]  352 	adc	a, -11 (ix)
   4872 67            [ 4]  353 	ld	h,a
   4873 66            [ 7]  354 	ld	h,(hl)
                            355 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4874 FD E5         [15]  356 	push	iy
   4876 F1            [10]  357 	pop	af
   4877 DD 77 FB      [19]  358 	ld	-5 (ix),a
   487A FD E5         [15]  359 	push	iy
   487C 3B            [ 6]  360 	dec	sp
   487D F1            [10]  361 	pop	af
   487E 33            [ 6]  362 	inc	sp
   487F DD 77 FA      [19]  363 	ld	-6 (ix),a
                            364 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4882 25            [ 4]  365 	dec	h
   4883 20 16         [12]  366 	jr	NZ,00110$
                            367 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4885 C5            [11]  368 	push	bc
   4886 D5            [11]  369 	push	de
   4887 21 04 10      [10]  370 	ld	hl,#0x1004
   488A E5            [11]  371 	push	hl
   488B DD 6E FA      [19]  372 	ld	l,-6 (ix)
   488E DD 66 FB      [19]  373 	ld	h,-5 (ix)
   4891 E5            [11]  374 	push	hl
   4892 21 58 68      [10]  375 	ld	hl,#_muro
   4895 E5            [11]  376 	push	hl
   4896 CD 4D 6A      [17]  377 	call	_cpct_drawSprite
   4899 D1            [10]  378 	pop	de
   489A C1            [10]  379 	pop	bc
   489B                     380 00110$:
                            381 ;src/draws.h:40: if(scene[posY][posX] == 9){
   489B 3E 00         [ 7]  382 	ld	a,#<(_scene)
   489D DD 86 F6      [19]  383 	add	a, -10 (ix)
   48A0 6F            [ 4]  384 	ld	l,a
   48A1 3E 6E         [ 7]  385 	ld	a,#>(_scene)
   48A3 DD 8E F7      [19]  386 	adc	a, -9 (ix)
   48A6 67            [ 4]  387 	ld	h,a
   48A7 7D            [ 4]  388 	ld	a,l
   48A8 DD 86 F4      [19]  389 	add	a, -12 (ix)
   48AB 6F            [ 4]  390 	ld	l,a
   48AC 7C            [ 4]  391 	ld	a,h
   48AD DD 8E F5      [19]  392 	adc	a, -11 (ix)
   48B0 67            [ 4]  393 	ld	h,a
   48B1 7E            [ 7]  394 	ld	a,(hl)
   48B2 D6 09         [ 7]  395 	sub	a, #0x09
   48B4 20 19         [12]  396 	jr	NZ,00124$
                            397 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   48B6 C5            [11]  398 	push	bc
   48B7 D5            [11]  399 	push	de
   48B8 21 04 10      [10]  400 	ld	hl,#0x1004
   48BB E5            [11]  401 	push	hl
   48BC 3E 09         [ 7]  402 	ld	a,#0x09
   48BE F5            [11]  403 	push	af
   48BF 33            [ 6]  404 	inc	sp
   48C0 DD 6E FA      [19]  405 	ld	l,-6 (ix)
   48C3 DD 66 FB      [19]  406 	ld	h,-5 (ix)
   48C6 E5            [11]  407 	push	hl
   48C7 CD 39 6C      [17]  408 	call	_cpct_drawSolidBox
   48CA F1            [10]  409 	pop	af
   48CB F1            [10]  410 	pop	af
   48CC 33            [ 6]  411 	inc	sp
   48CD D1            [10]  412 	pop	de
   48CE C1            [10]  413 	pop	bc
   48CF                     414 00124$:
                            415 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   48CF DD 34 F4      [23]  416 	inc	-12 (ix)
   48D2 20 03         [12]  417 	jr	NZ,00199$
   48D4 DD 34 F5      [23]  418 	inc	-11 (ix)
   48D7                     419 00199$:
   48D7 DD 7E F4      [19]  420 	ld	a,-12 (ix)
   48DA D6 14         [ 7]  421 	sub	a, #0x14
   48DC DD 7E F5      [19]  422 	ld	a,-11 (ix)
   48DF 17            [ 4]  423 	rla
   48E0 3F            [ 4]  424 	ccf
   48E1 1F            [ 4]  425 	rra
   48E2 DE 80         [ 7]  426 	sbc	a, #0x80
   48E4 DA 46 48      [10]  427 	jp	C,00123$
                            428 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   48E7 DD 7E F6      [19]  429 	ld	a,-10 (ix)
   48EA C6 14         [ 7]  430 	add	a, #0x14
   48EC DD 77 F6      [19]  431 	ld	-10 (ix),a
   48EF DD 7E F7      [19]  432 	ld	a,-9 (ix)
   48F2 CE 00         [ 7]  433 	adc	a, #0x00
   48F4 DD 77 F7      [19]  434 	ld	-9 (ix),a
   48F7 21 14 00      [10]  435 	ld	hl,#0x0014
   48FA 19            [11]  436 	add	hl,de
   48FB EB            [ 4]  437 	ex	de,hl
   48FC 03            [ 6]  438 	inc	bc
   48FD 79            [ 4]  439 	ld	a,c
   48FE D6 0C         [ 7]  440 	sub	a, #0x0C
   4900 78            [ 4]  441 	ld	a,b
   4901 17            [ 4]  442 	rla
   4902 3F            [ 4]  443 	ccf
   4903 1F            [ 4]  444 	rra
   4904 DE 80         [ 7]  445 	sbc	a, #0x80
   4906 DA 34 48      [10]  446 	jp	C,00139$
   4909 DD F9         [10]  447 	ld	sp, ix
   490B DD E1         [14]  448 	pop	ix
   490D C9            [10]  449 	ret
   490E                     450 _g_palette:
   490E 00                  451 	.db #0x00	; 0
   490F 1A                  452 	.db #0x1A	; 26
   4910 06                  453 	.db #0x06	; 6
   4911 0D                  454 	.db #0x0D	; 13
   4912 00                  455 	.db 0x00
   4913                     456 _origins:
   4913 00                  457 	.db #0x00	; 0
   4914 50                  458 	.db #0x50	; 80	'P'
   4915 34                  459 	.db #0x34	; 52	'4'
   4916 50                  460 	.db #0x50	; 80	'P'
   4917                     461 _mapa1:
   4917 01                  462 	.db #0x01	; 1
   4918 01                  463 	.db #0x01	; 1
   4919 01                  464 	.db #0x01	; 1
   491A 01                  465 	.db #0x01	; 1
   491B 01                  466 	.db #0x01	; 1
   491C 01                  467 	.db #0x01	; 1
   491D 01                  468 	.db #0x01	; 1
   491E 01                  469 	.db #0x01	; 1
   491F 01                  470 	.db #0x01	; 1
   4920 01                  471 	.db #0x01	; 1
   4921 01                  472 	.db #0x01	; 1
   4922 01                  473 	.db #0x01	; 1
   4923 01                  474 	.db #0x01	; 1
   4924 01                  475 	.db #0x01	; 1
   4925 01                  476 	.db #0x01	; 1
   4926 01                  477 	.db #0x01	; 1
   4927 01                  478 	.db #0x01	; 1
   4928 01                  479 	.db #0x01	; 1
   4929 01                  480 	.db #0x01	; 1
   492A 01                  481 	.db #0x01	; 1
   492B 01                  482 	.db #0x01	; 1
   492C 07                  483 	.db #0x07	; 7
   492D 05                  484 	.db #0x05	; 5
   492E 07                  485 	.db #0x07	; 7
   492F 07                  486 	.db #0x07	; 7
   4930 07                  487 	.db #0x07	; 7
   4931 07                  488 	.db #0x07	; 7
   4932 07                  489 	.db #0x07	; 7
   4933 07                  490 	.db #0x07	; 7
   4934 07                  491 	.db #0x07	; 7
   4935 07                  492 	.db #0x07	; 7
   4936 07                  493 	.db #0x07	; 7
   4937 07                  494 	.db #0x07	; 7
   4938 07                  495 	.db #0x07	; 7
   4939 07                  496 	.db #0x07	; 7
   493A 07                  497 	.db #0x07	; 7
   493B 07                  498 	.db #0x07	; 7
   493C 07                  499 	.db #0x07	; 7
   493D 07                  500 	.db #0x07	; 7
   493E 01                  501 	.db #0x01	; 1
   493F 01                  502 	.db #0x01	; 1
   4940 07                  503 	.db #0x07	; 7
   4941 07                  504 	.db #0x07	; 7
   4942 07                  505 	.db #0x07	; 7
   4943 07                  506 	.db #0x07	; 7
   4944 07                  507 	.db #0x07	; 7
   4945 07                  508 	.db #0x07	; 7
   4946 07                  509 	.db #0x07	; 7
   4947 07                  510 	.db #0x07	; 7
   4948 07                  511 	.db #0x07	; 7
   4949 07                  512 	.db #0x07	; 7
   494A 07                  513 	.db #0x07	; 7
   494B 07                  514 	.db #0x07	; 7
   494C 07                  515 	.db #0x07	; 7
   494D 07                  516 	.db #0x07	; 7
   494E 07                  517 	.db #0x07	; 7
   494F 07                  518 	.db #0x07	; 7
   4950 07                  519 	.db #0x07	; 7
   4951 07                  520 	.db #0x07	; 7
   4952 01                  521 	.db #0x01	; 1
   4953 01                  522 	.db #0x01	; 1
   4954 01                  523 	.db #0x01	; 1
   4955 01                  524 	.db #0x01	; 1
   4956 01                  525 	.db #0x01	; 1
   4957 01                  526 	.db #0x01	; 1
   4958 01                  527 	.db #0x01	; 1
   4959 01                  528 	.db #0x01	; 1
   495A 01                  529 	.db #0x01	; 1
   495B 01                  530 	.db #0x01	; 1
   495C 07                  531 	.db #0x07	; 7
   495D 07                  532 	.db #0x07	; 7
   495E 01                  533 	.db #0x01	; 1
   495F 01                  534 	.db #0x01	; 1
   4960 01                  535 	.db #0x01	; 1
   4961 01                  536 	.db #0x01	; 1
   4962 07                  537 	.db #0x07	; 7
   4963 07                  538 	.db #0x07	; 7
   4964 01                  539 	.db #0x01	; 1
   4965 01                  540 	.db #0x01	; 1
   4966 01                  541 	.db #0x01	; 1
   4967 01                  542 	.db #0x01	; 1
   4968 00                  543 	.db #0x00	; 0
   4969 00                  544 	.db #0x00	; 0
   496A 00                  545 	.db #0x00	; 0
   496B 00                  546 	.db #0x00	; 0
   496C 00                  547 	.db #0x00	; 0
   496D 00                  548 	.db #0x00	; 0
   496E 00                  549 	.db #0x00	; 0
   496F 06                  550 	.db #0x06	; 6
   4970 06                  551 	.db #0x06	; 6
   4971 06                  552 	.db #0x06	; 6
   4972 01                  553 	.db #0x01	; 1
   4973 03                  554 	.db #0x03	; 3
   4974 03                  555 	.db #0x03	; 3
   4975 03                  556 	.db #0x03	; 3
   4976 03                  557 	.db #0x03	; 3
   4977 03                  558 	.db #0x03	; 3
   4978 03                  559 	.db #0x03	; 3
   4979 03                  560 	.db #0x03	; 3
   497A 01                  561 	.db #0x01	; 1
   497B 00                  562 	.db #0x00	; 0
   497C 00                  563 	.db #0x00	; 0
   497D 01                  564 	.db #0x01	; 1
   497E 01                  565 	.db #0x01	; 1
   497F 04                  566 	.db #0x04	; 4
   4980 04                  567 	.db #0x04	; 4
   4981 01                  568 	.db #0x01	; 1
   4982 01                  569 	.db #0x01	; 1
   4983 06                  570 	.db #0x06	; 6
   4984 06                  571 	.db #0x06	; 6
   4985 06                  572 	.db #0x06	; 6
   4986 01                  573 	.db #0x01	; 1
   4987 03                  574 	.db #0x03	; 3
   4988 03                  575 	.db #0x03	; 3
   4989 03                  576 	.db #0x03	; 3
   498A 03                  577 	.db #0x03	; 3
   498B 03                  578 	.db #0x03	; 3
   498C 03                  579 	.db #0x03	; 3
   498D 03                  580 	.db #0x03	; 3
   498E 01                  581 	.db #0x01	; 1
   498F 01                  582 	.db #0x01	; 1
   4990 00                  583 	.db #0x00	; 0
   4991 01                  584 	.db #0x01	; 1
   4992 04                  585 	.db #0x04	; 4
   4993 04                  586 	.db #0x04	; 4
   4994 04                  587 	.db #0x04	; 4
   4995 04                  588 	.db #0x04	; 4
   4996 01                  589 	.db #0x01	; 1
   4997 06                  590 	.db #0x06	; 6
   4998 06                  591 	.db #0x06	; 6
   4999 06                  592 	.db #0x06	; 6
   499A 01                  593 	.db #0x01	; 1
   499B 03                  594 	.db #0x03	; 3
   499C 03                  595 	.db #0x03	; 3
   499D 03                  596 	.db #0x03	; 3
   499E 03                  597 	.db #0x03	; 3
   499F 03                  598 	.db #0x03	; 3
   49A0 03                  599 	.db #0x03	; 3
   49A1 03                  600 	.db #0x03	; 3
   49A2 01                  601 	.db #0x01	; 1
   49A3 01                  602 	.db #0x01	; 1
   49A4 00                  603 	.db #0x00	; 0
   49A5 01                  604 	.db #0x01	; 1
   49A6 04                  605 	.db #0x04	; 4
   49A7 04                  606 	.db #0x04	; 4
   49A8 04                  607 	.db #0x04	; 4
   49A9 04                  608 	.db #0x04	; 4
   49AA 01                  609 	.db #0x01	; 1
   49AB 06                  610 	.db #0x06	; 6
   49AC 06                  611 	.db #0x06	; 6
   49AD 06                  612 	.db #0x06	; 6
   49AE 01                  613 	.db #0x01	; 1
   49AF 03                  614 	.db #0x03	; 3
   49B0 03                  615 	.db #0x03	; 3
   49B1 03                  616 	.db #0x03	; 3
   49B2 03                  617 	.db #0x03	; 3
   49B3 03                  618 	.db #0x03	; 3
   49B4 03                  619 	.db #0x03	; 3
   49B5 03                  620 	.db #0x03	; 3
   49B6 01                  621 	.db #0x01	; 1
   49B7 01                  622 	.db #0x01	; 1
   49B8 00                  623 	.db #0x00	; 0
   49B9 01                  624 	.db #0x01	; 1
   49BA 04                  625 	.db #0x04	; 4
   49BB 04                  626 	.db #0x04	; 4
   49BC 04                  627 	.db #0x04	; 4
   49BD 04                  628 	.db #0x04	; 4
   49BE 01                  629 	.db #0x01	; 1
   49BF 06                  630 	.db #0x06	; 6
   49C0 06                  631 	.db #0x06	; 6
   49C1 06                  632 	.db #0x06	; 6
   49C2 01                  633 	.db #0x01	; 1
   49C3 03                  634 	.db #0x03	; 3
   49C4 03                  635 	.db #0x03	; 3
   49C5 03                  636 	.db #0x03	; 3
   49C6 03                  637 	.db #0x03	; 3
   49C7 03                  638 	.db #0x03	; 3
   49C8 03                  639 	.db #0x03	; 3
   49C9 03                  640 	.db #0x03	; 3
   49CA 01                  641 	.db #0x01	; 1
   49CB 01                  642 	.db #0x01	; 1
   49CC 00                  643 	.db #0x00	; 0
   49CD 01                  644 	.db #0x01	; 1
   49CE 04                  645 	.db #0x04	; 4
   49CF 04                  646 	.db #0x04	; 4
   49D0 04                  647 	.db #0x04	; 4
   49D1 04                  648 	.db #0x04	; 4
   49D2 01                  649 	.db #0x01	; 1
   49D3 06                  650 	.db #0x06	; 6
   49D4 06                  651 	.db #0x06	; 6
   49D5 06                  652 	.db #0x06	; 6
   49D6 01                  653 	.db #0x01	; 1
   49D7 03                  654 	.db #0x03	; 3
   49D8 03                  655 	.db #0x03	; 3
   49D9 03                  656 	.db #0x03	; 3
   49DA 03                  657 	.db #0x03	; 3
   49DB 03                  658 	.db #0x03	; 3
   49DC 03                  659 	.db #0x03	; 3
   49DD 03                  660 	.db #0x03	; 3
   49DE 01                  661 	.db #0x01	; 1
   49DF 01                  662 	.db #0x01	; 1
   49E0 02                  663 	.db #0x02	; 2
   49E1 01                  664 	.db #0x01	; 1
   49E2 04                  665 	.db #0x04	; 4
   49E3 04                  666 	.db #0x04	; 4
   49E4 04                  667 	.db #0x04	; 4
   49E5 04                  668 	.db #0x04	; 4
   49E6 01                  669 	.db #0x01	; 1
   49E7 06                  670 	.db #0x06	; 6
   49E8 06                  671 	.db #0x06	; 6
   49E9 06                  672 	.db #0x06	; 6
   49EA 03                  673 	.db #0x03	; 3
   49EB 03                  674 	.db #0x03	; 3
   49EC 03                  675 	.db #0x03	; 3
   49ED 03                  676 	.db #0x03	; 3
   49EE 03                  677 	.db #0x03	; 3
   49EF 03                  678 	.db #0x03	; 3
   49F0 03                  679 	.db #0x03	; 3
   49F1 03                  680 	.db #0x03	; 3
   49F2 01                  681 	.db #0x01	; 1
   49F3 01                  682 	.db #0x01	; 1
   49F4 01                  683 	.db #0x01	; 1
   49F5 01                  684 	.db #0x01	; 1
   49F6 01                  685 	.db #0x01	; 1
   49F7 01                  686 	.db #0x01	; 1
   49F8 01                  687 	.db #0x01	; 1
   49F9 01                  688 	.db #0x01	; 1
   49FA 01                  689 	.db #0x01	; 1
   49FB 01                  690 	.db #0x01	; 1
   49FC 01                  691 	.db #0x01	; 1
   49FD 01                  692 	.db #0x01	; 1
   49FE 01                  693 	.db #0x01	; 1
   49FF 01                  694 	.db #0x01	; 1
   4A00 01                  695 	.db #0x01	; 1
   4A01 01                  696 	.db #0x01	; 1
   4A02 09                  697 	.db #0x09	; 9
   4A03 09                  698 	.db #0x09	; 9
   4A04 01                  699 	.db #0x01	; 1
   4A05 01                  700 	.db #0x01	; 1
   4A06 01                  701 	.db #0x01	; 1
   4A07                     702 _mapa2:
   4A07 01                  703 	.db #0x01	; 1
   4A08 01                  704 	.db #0x01	; 1
   4A09 01                  705 	.db #0x01	; 1
   4A0A 01                  706 	.db #0x01	; 1
   4A0B 01                  707 	.db #0x01	; 1
   4A0C 01                  708 	.db #0x01	; 1
   4A0D 01                  709 	.db #0x01	; 1
   4A0E 01                  710 	.db #0x01	; 1
   4A0F 01                  711 	.db #0x01	; 1
   4A10 01                  712 	.db #0x01	; 1
   4A11 01                  713 	.db #0x01	; 1
   4A12 01                  714 	.db #0x01	; 1
   4A13 01                  715 	.db #0x01	; 1
   4A14 01                  716 	.db #0x01	; 1
   4A15 01                  717 	.db #0x01	; 1
   4A16 01                  718 	.db #0x01	; 1
   4A17 01                  719 	.db #0x01	; 1
   4A18 01                  720 	.db #0x01	; 1
   4A19 01                  721 	.db #0x01	; 1
   4A1A 01                  722 	.db #0x01	; 1
   4A1B 01                  723 	.db #0x01	; 1
   4A1C 00                  724 	.db #0x00	; 0
   4A1D 00                  725 	.db #0x00	; 0
   4A1E 00                  726 	.db #0x00	; 0
   4A1F 00                  727 	.db #0x00	; 0
   4A20 01                  728 	.db #0x01	; 1
   4A21 00                  729 	.db #0x00	; 0
   4A22 00                  730 	.db #0x00	; 0
   4A23 00                  731 	.db #0x00	; 0
   4A24 00                  732 	.db #0x00	; 0
   4A25 00                  733 	.db #0x00	; 0
   4A26 00                  734 	.db #0x00	; 0
   4A27 00                  735 	.db #0x00	; 0
   4A28 00                  736 	.db #0x00	; 0
   4A29 00                  737 	.db #0x00	; 0
   4A2A 00                  738 	.db #0x00	; 0
   4A2B 00                  739 	.db #0x00	; 0
   4A2C 00                  740 	.db #0x00	; 0
   4A2D 00                  741 	.db #0x00	; 0
   4A2E 06                  742 	.db #0x06	; 6
   4A2F 01                  743 	.db #0x01	; 1
   4A30 00                  744 	.db #0x00	; 0
   4A31 00                  745 	.db #0x00	; 0
   4A32 01                  746 	.db #0x01	; 1
   4A33 00                  747 	.db #0x00	; 0
   4A34 00                  748 	.db #0x00	; 0
   4A35 00                  749 	.db #0x00	; 0
   4A36 00                  750 	.db #0x00	; 0
   4A37 00                  751 	.db #0x00	; 0
   4A38 00                  752 	.db #0x00	; 0
   4A39 00                  753 	.db #0x00	; 0
   4A3A 00                  754 	.db #0x00	; 0
   4A3B 00                  755 	.db #0x00	; 0
   4A3C 00                  756 	.db #0x00	; 0
   4A3D 00                  757 	.db #0x00	; 0
   4A3E 00                  758 	.db #0x00	; 0
   4A3F 00                  759 	.db #0x00	; 0
   4A40 00                  760 	.db #0x00	; 0
   4A41 00                  761 	.db #0x00	; 0
   4A42 01                  762 	.db #0x01	; 1
   4A43 01                  763 	.db #0x01	; 1
   4A44 00                  764 	.db #0x00	; 0
   4A45 01                  765 	.db #0x01	; 1
   4A46 01                  766 	.db #0x01	; 1
   4A47 01                  767 	.db #0x01	; 1
   4A48 01                  768 	.db #0x01	; 1
   4A49 00                  769 	.db #0x00	; 0
   4A4A 00                  770 	.db #0x00	; 0
   4A4B 01                  771 	.db #0x01	; 1
   4A4C 01                  772 	.db #0x01	; 1
   4A4D 01                  773 	.db #0x01	; 1
   4A4E 01                  774 	.db #0x01	; 1
   4A4F 01                  775 	.db #0x01	; 1
   4A50 01                  776 	.db #0x01	; 1
   4A51 01                  777 	.db #0x01	; 1
   4A52 01                  778 	.db #0x01	; 1
   4A53 01                  779 	.db #0x01	; 1
   4A54 01                  780 	.db #0x01	; 1
   4A55 01                  781 	.db #0x01	; 1
   4A56 01                  782 	.db #0x01	; 1
   4A57 01                  783 	.db #0x01	; 1
   4A58 00                  784 	.db #0x00	; 0
   4A59 05                  785 	.db #0x05	; 5
   4A5A 01                  786 	.db #0x01	; 1
   4A5B 00                  787 	.db #0x00	; 0
   4A5C 00                  788 	.db #0x00	; 0
   4A5D 00                  789 	.db #0x00	; 0
   4A5E 00                  790 	.db #0x00	; 0
   4A5F 00                  791 	.db #0x00	; 0
   4A60 00                  792 	.db #0x00	; 0
   4A61 00                  793 	.db #0x00	; 0
   4A62 01                  794 	.db #0x01	; 1
   4A63 00                  795 	.db #0x00	; 0
   4A64 00                  796 	.db #0x00	; 0
   4A65 00                  797 	.db #0x00	; 0
   4A66 00                  798 	.db #0x00	; 0
   4A67 00                  799 	.db #0x00	; 0
   4A68 00                  800 	.db #0x00	; 0
   4A69 00                  801 	.db #0x00	; 0
   4A6A 01                  802 	.db #0x01	; 1
   4A6B 01                  803 	.db #0x01	; 1
   4A6C 00                  804 	.db #0x00	; 0
   4A6D 01                  805 	.db #0x01	; 1
   4A6E 01                  806 	.db #0x01	; 1
   4A6F 00                  807 	.db #0x00	; 0
   4A70 01                  808 	.db #0x01	; 1
   4A71 01                  809 	.db #0x01	; 1
   4A72 01                  810 	.db #0x01	; 1
   4A73 02                  811 	.db #0x02	; 2
   4A74 02                  812 	.db #0x02	; 2
   4A75 02                  813 	.db #0x02	; 2
   4A76 01                  814 	.db #0x01	; 1
   4A77 00                  815 	.db #0x00	; 0
   4A78 00                  816 	.db #0x00	; 0
   4A79 00                  817 	.db #0x00	; 0
   4A7A 05                  818 	.db #0x05	; 5
   4A7B 00                  819 	.db #0x00	; 0
   4A7C 00                  820 	.db #0x00	; 0
   4A7D 00                  821 	.db #0x00	; 0
   4A7E 01                  822 	.db #0x01	; 1
   4A7F 01                  823 	.db #0x01	; 1
   4A80 00                  824 	.db #0x00	; 0
   4A81 01                  825 	.db #0x01	; 1
   4A82 02                  826 	.db #0x02	; 2
   4A83 02                  827 	.db #0x02	; 2
   4A84 02                  828 	.db #0x02	; 2
   4A85 02                  829 	.db #0x02	; 2
   4A86 01                  830 	.db #0x01	; 1
   4A87 00                  831 	.db #0x00	; 0
   4A88 00                  832 	.db #0x00	; 0
   4A89 00                  833 	.db #0x00	; 0
   4A8A 01                  834 	.db #0x01	; 1
   4A8B 00                  835 	.db #0x00	; 0
   4A8C 00                  836 	.db #0x00	; 0
   4A8D 00                  837 	.db #0x00	; 0
   4A8E 05                  838 	.db #0x05	; 5
   4A8F 00                  839 	.db #0x00	; 0
   4A90 00                  840 	.db #0x00	; 0
   4A91 00                  841 	.db #0x00	; 0
   4A92 01                  842 	.db #0x01	; 1
   4A93 01                  843 	.db #0x01	; 1
   4A94 00                  844 	.db #0x00	; 0
   4A95 01                  845 	.db #0x01	; 1
   4A96 02                  846 	.db #0x02	; 2
   4A97 02                  847 	.db #0x02	; 2
   4A98 02                  848 	.db #0x02	; 2
   4A99 02                  849 	.db #0x02	; 2
   4A9A 01                  850 	.db #0x01	; 1
   4A9B 02                  851 	.db #0x02	; 2
   4A9C 02                  852 	.db #0x02	; 2
   4A9D 02                  853 	.db #0x02	; 2
   4A9E 01                  854 	.db #0x01	; 1
   4A9F 00                  855 	.db #0x00	; 0
   4AA0 00                  856 	.db #0x00	; 0
   4AA1 00                  857 	.db #0x00	; 0
   4AA2 05                  858 	.db #0x05	; 5
   4AA3 00                  859 	.db #0x00	; 0
   4AA4 00                  860 	.db #0x00	; 0
   4AA5 00                  861 	.db #0x00	; 0
   4AA6 01                  862 	.db #0x01	; 1
   4AA7 01                  863 	.db #0x01	; 1
   4AA8 00                  864 	.db #0x00	; 0
   4AA9 01                  865 	.db #0x01	; 1
   4AAA 02                  866 	.db #0x02	; 2
   4AAB 02                  867 	.db #0x02	; 2
   4AAC 02                  868 	.db #0x02	; 2
   4AAD 02                  869 	.db #0x02	; 2
   4AAE 01                  870 	.db #0x01	; 1
   4AAF 00                  871 	.db #0x00	; 0
   4AB0 00                  872 	.db #0x00	; 0
   4AB1 00                  873 	.db #0x00	; 0
   4AB2 01                  874 	.db #0x01	; 1
   4AB3 00                  875 	.db #0x00	; 0
   4AB4 00                  876 	.db #0x00	; 0
   4AB5 00                  877 	.db #0x00	; 0
   4AB6 00                  878 	.db #0x00	; 0
   4AB7 00                  879 	.db #0x00	; 0
   4AB8 00                  880 	.db #0x00	; 0
   4AB9 00                  881 	.db #0x00	; 0
   4ABA 01                  882 	.db #0x01	; 1
   4ABB 01                  883 	.db #0x01	; 1
   4ABC 00                  884 	.db #0x00	; 0
   4ABD 01                  885 	.db #0x01	; 1
   4ABE 02                  886 	.db #0x02	; 2
   4ABF 02                  887 	.db #0x02	; 2
   4AC0 02                  888 	.db #0x02	; 2
   4AC1 02                  889 	.db #0x02	; 2
   4AC2 01                  890 	.db #0x01	; 1
   4AC3 02                  891 	.db #0x02	; 2
   4AC4 02                  892 	.db #0x02	; 2
   4AC5 02                  893 	.db #0x02	; 2
   4AC6 01                  894 	.db #0x01	; 1
   4AC7 00                  895 	.db #0x00	; 0
   4AC8 00                  896 	.db #0x00	; 0
   4AC9 00                  897 	.db #0x00	; 0
   4ACA 00                  898 	.db #0x00	; 0
   4ACB 00                  899 	.db #0x00	; 0
   4ACC 00                  900 	.db #0x00	; 0
   4ACD 00                  901 	.db #0x00	; 0
   4ACE 01                  902 	.db #0x01	; 1
   4ACF 01                  903 	.db #0x01	; 1
   4AD0 05                  904 	.db #0x05	; 5
   4AD1 01                  905 	.db #0x01	; 1
   4AD2 02                  906 	.db #0x02	; 2
   4AD3 02                  907 	.db #0x02	; 2
   4AD4 02                  908 	.db #0x02	; 2
   4AD5 02                  909 	.db #0x02	; 2
   4AD6 01                  910 	.db #0x01	; 1
   4AD7 00                  911 	.db #0x00	; 0
   4AD8 00                  912 	.db #0x00	; 0
   4AD9 00                  913 	.db #0x00	; 0
   4ADA 00                  914 	.db #0x00	; 0
   4ADB 00                  915 	.db #0x00	; 0
   4ADC 00                  916 	.db #0x00	; 0
   4ADD 00                  917 	.db #0x00	; 0
   4ADE 00                  918 	.db #0x00	; 0
   4ADF 00                  919 	.db #0x00	; 0
   4AE0 00                  920 	.db #0x00	; 0
   4AE1 00                  921 	.db #0x00	; 0
   4AE2 01                  922 	.db #0x01	; 1
   4AE3 01                  923 	.db #0x01	; 1
   4AE4 01                  924 	.db #0x01	; 1
   4AE5 01                  925 	.db #0x01	; 1
   4AE6 01                  926 	.db #0x01	; 1
   4AE7 01                  927 	.db #0x01	; 1
   4AE8 01                  928 	.db #0x01	; 1
   4AE9 01                  929 	.db #0x01	; 1
   4AEA 01                  930 	.db #0x01	; 1
   4AEB 01                  931 	.db #0x01	; 1
   4AEC 01                  932 	.db #0x01	; 1
   4AED 01                  933 	.db #0x01	; 1
   4AEE 01                  934 	.db #0x01	; 1
   4AEF 01                  935 	.db #0x01	; 1
   4AF0 01                  936 	.db #0x01	; 1
   4AF1 01                  937 	.db #0x01	; 1
   4AF2 00                  938 	.db #0x00	; 0
   4AF3 01                  939 	.db #0x01	; 1
   4AF4 01                  940 	.db #0x01	; 1
   4AF5 01                  941 	.db #0x01	; 1
   4AF6 01                  942 	.db #0x01	; 1
                            943 ;src/draws.h:48: void drawVida(u8 life,u8 pos){
                            944 ;	---------------------------------
                            945 ; Function drawVida
                            946 ; ---------------------------------
   4AF7                     947 _drawVida::
   4AF7 DD E5         [15]  948 	push	ix
   4AF9 DD 21 00 00   [14]  949 	ld	ix,#0
   4AFD DD 39         [15]  950 	add	ix,sp
                            951 ;src/draws.h:51: u8 p = pos;
   4AFF DD 56 05      [19]  952 	ld	d,5 (ix)
                            953 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B02 1E 01         [ 7]  954 	ld	e,#0x01
   4B04                     955 00105$:
                            956 ;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B04 D5            [11]  957 	push	de
   4B05 3E C0         [ 7]  958 	ld	a,#0xC0
   4B07 F5            [11]  959 	push	af
   4B08 33            [ 6]  960 	inc	sp
   4B09 D5            [11]  961 	push	de
   4B0A 33            [ 6]  962 	inc	sp
   4B0B 21 00 C0      [10]  963 	ld	hl,#0xC000
   4B0E E5            [11]  964 	push	hl
   4B0F CD 0A 6D      [17]  965 	call	_cpct_getScreenPtr
   4B12 D1            [10]  966 	pop	de
                            967 ;src/draws.h:55: p+=5;
   4B13 7A            [ 4]  968 	ld	a,d
   4B14 C6 05         [ 7]  969 	add	a, #0x05
   4B16 57            [ 4]  970 	ld	d,a
                            971 ;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4B17 4D            [ 4]  972 	ld	c, l
   4B18 44            [ 4]  973 	ld	b, h
   4B19 DD 7E 04      [19]  974 	ld	a,4 (ix)
   4B1C 93            [ 4]  975 	sub	a, e
   4B1D 38 10         [12]  976 	jr	C,00102$
   4B1F D5            [11]  977 	push	de
   4B20 21 04 08      [10]  978 	ld	hl,#0x0804
   4B23 E5            [11]  979 	push	hl
   4B24 C5            [11]  980 	push	bc
   4B25 21 00 46      [10]  981 	ld	hl,#_corazon_lleno
   4B28 E5            [11]  982 	push	hl
   4B29 CD B3 6B      [17]  983 	call	_cpct_drawSpriteMasked
   4B2C D1            [10]  984 	pop	de
   4B2D 18 20         [12]  985 	jr	00106$
   4B2F                     986 00102$:
                            987 ;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
   4B2F C5            [11]  988 	push	bc
   4B30 D5            [11]  989 	push	de
   4B31 21 04 08      [10]  990 	ld	hl,#0x0804
   4B34 E5            [11]  991 	push	hl
   4B35 AF            [ 4]  992 	xor	a, a
   4B36 F5            [11]  993 	push	af
   4B37 33            [ 6]  994 	inc	sp
   4B38 C5            [11]  995 	push	bc
   4B39 CD 39 6C      [17]  996 	call	_cpct_drawSolidBox
   4B3C F1            [10]  997 	pop	af
   4B3D F1            [10]  998 	pop	af
   4B3E 33            [ 6]  999 	inc	sp
   4B3F D1            [10] 1000 	pop	de
   4B40 C1            [10] 1001 	pop	bc
                           1002 ;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4B41 D5            [11] 1003 	push	de
   4B42 21 04 08      [10] 1004 	ld	hl,#0x0804
   4B45 E5            [11] 1005 	push	hl
   4B46 C5            [11] 1006 	push	bc
   4B47 21 40 46      [10] 1007 	ld	hl,#_corazon_roto
   4B4A E5            [11] 1008 	push	hl
   4B4B CD B3 6B      [17] 1009 	call	_cpct_drawSpriteMasked
   4B4E D1            [10] 1010 	pop	de
   4B4F                    1011 00106$:
                           1012 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B4F 1C            [ 4] 1013 	inc	e
   4B50 3E 03         [ 7] 1014 	ld	a,#0x03
   4B52 93            [ 4] 1015 	sub	a, e
   4B53 30 AF         [12] 1016 	jr	NC,00105$
   4B55 DD E1         [14] 1017 	pop	ix
   4B57 C9            [10] 1018 	ret
                           1019 ;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
                           1020 ;	---------------------------------
                           1021 ; Function drawBullets
                           1022 ; ---------------------------------
   4B58                    1023 _drawBullets::
   4B58 DD E5         [15] 1024 	push	ix
   4B5A DD 21 00 00   [14] 1025 	ld	ix,#0
   4B5E DD 39         [15] 1026 	add	ix,sp
   4B60 3B            [ 6] 1027 	dec	sp
                           1028 ;src/draws.h:67: int p = pos;
   4B61 DD 4E 05      [19] 1029 	ld	c,5 (ix)
   4B64 06 00         [ 7] 1030 	ld	b,#0x00
                           1031 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B66 DD 36 FF 01   [19] 1032 	ld	-1 (ix),#0x01
   4B6A                    1033 00105$:
                           1034 ;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B6A 51            [ 4] 1035 	ld	d,c
   4B6B C5            [11] 1036 	push	bc
   4B6C 3E C0         [ 7] 1037 	ld	a,#0xC0
   4B6E F5            [11] 1038 	push	af
   4B6F 33            [ 6] 1039 	inc	sp
   4B70 D5            [11] 1040 	push	de
   4B71 33            [ 6] 1041 	inc	sp
   4B72 21 00 C0      [10] 1042 	ld	hl,#0xC000
   4B75 E5            [11] 1043 	push	hl
   4B76 CD 0A 6D      [17] 1044 	call	_cpct_getScreenPtr
   4B79 C1            [10] 1045 	pop	bc
                           1046 ;src/draws.h:71: p+=3;
   4B7A 03            [ 6] 1047 	inc	bc
   4B7B 03            [ 6] 1048 	inc	bc
   4B7C 03            [ 6] 1049 	inc	bc
                           1050 ;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4B7D EB            [ 4] 1051 	ex	de,hl
   4B7E DD 7E 04      [19] 1052 	ld	a,4 (ix)
   4B81 DD 96 FF      [19] 1053 	sub	a, -1 (ix)
   4B84 38 10         [12] 1054 	jr	C,00102$
   4B86 C5            [11] 1055 	push	bc
   4B87 21 02 08      [10] 1056 	ld	hl,#0x0802
   4B8A E5            [11] 1057 	push	hl
   4B8B D5            [11] 1058 	push	de
   4B8C 21 98 68      [10] 1059 	ld	hl,#_flecha_arriba
   4B8F E5            [11] 1060 	push	hl
   4B90 CD B3 6B      [17] 1061 	call	_cpct_drawSpriteMasked
   4B93 C1            [10] 1062 	pop	bc
   4B94 18 10         [12] 1063 	jr	00106$
   4B96                    1064 00102$:
                           1065 ;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
   4B96 C5            [11] 1066 	push	bc
   4B97 21 02 08      [10] 1067 	ld	hl,#0x0802
   4B9A E5            [11] 1068 	push	hl
   4B9B AF            [ 4] 1069 	xor	a, a
   4B9C F5            [11] 1070 	push	af
   4B9D 33            [ 6] 1071 	inc	sp
   4B9E D5            [11] 1072 	push	de
   4B9F CD 39 6C      [17] 1073 	call	_cpct_drawSolidBox
   4BA2 F1            [10] 1074 	pop	af
   4BA3 F1            [10] 1075 	pop	af
   4BA4 33            [ 6] 1076 	inc	sp
   4BA5 C1            [10] 1077 	pop	bc
   4BA6                    1078 00106$:
                           1079 ;src/draws.h:69: for(i=1;i<=3;i++){
   4BA6 DD 34 FF      [23] 1080 	inc	-1 (ix)
   4BA9 3E 03         [ 7] 1081 	ld	a,#0x03
   4BAB DD 96 FF      [19] 1082 	sub	a, -1 (ix)
   4BAE 30 BA         [12] 1083 	jr	NC,00105$
   4BB0 33            [ 6] 1084 	inc	sp
   4BB1 DD E1         [14] 1085 	pop	ix
   4BB3 C9            [10] 1086 	ret
                           1087 ;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1088 ;	---------------------------------
                           1089 ; Function draw
                           1090 ; ---------------------------------
   4BB4                    1091 _draw::
                           1092 ;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
   4BB4 21 03 00      [10] 1093 	ld	hl, #3+0
   4BB7 39            [11] 1094 	add	hl, sp
   4BB8 7E            [ 7] 1095 	ld	a, (hl)
   4BB9 F5            [11] 1096 	push	af
   4BBA 33            [ 6] 1097 	inc	sp
   4BBB 21 03 00      [10] 1098 	ld	hl, #3+0
   4BBE 39            [11] 1099 	add	hl, sp
   4BBF 7E            [ 7] 1100 	ld	a, (hl)
   4BC0 F5            [11] 1101 	push	af
   4BC1 33            [ 6] 1102 	inc	sp
   4BC2 21 00 C0      [10] 1103 	ld	hl,#0xC000
   4BC5 E5            [11] 1104 	push	hl
   4BC6 CD 0A 6D      [17] 1105 	call	_cpct_getScreenPtr
   4BC9 EB            [ 4] 1106 	ex	de,hl
                           1107 ;src/draws.h:84: switch(mode){
   4BCA 3E 02         [ 7] 1108 	ld	a,#0x02
   4BCC FD 21 06 00   [14] 1109 	ld	iy,#6
   4BD0 FD 39         [15] 1110 	add	iy,sp
   4BD2 FD 96 00      [19] 1111 	sub	a, 0 (iy)
   4BD5 D8            [11] 1112 	ret	C
                           1113 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BD6 21 04 00      [10] 1114 	ld	hl, #4
   4BD9 39            [11] 1115 	add	hl, sp
   4BDA 4E            [ 7] 1116 	ld	c, (hl)
   4BDB 23            [ 6] 1117 	inc	hl
   4BDC 46            [ 7] 1118 	ld	b, (hl)
                           1119 ;src/draws.h:84: switch(mode){
   4BDD D5            [11] 1120 	push	de
   4BDE FD 21 08 00   [14] 1121 	ld	iy,#8
   4BE2 FD 39         [15] 1122 	add	iy,sp
   4BE4 FD 5E 00      [19] 1123 	ld	e,0 (iy)
   4BE7 16 00         [ 7] 1124 	ld	d,#0x00
   4BE9 21 F0 4B      [10] 1125 	ld	hl,#00111$
   4BEC 19            [11] 1126 	add	hl,de
   4BED 19            [11] 1127 	add	hl,de
                           1128 ;src/draws.h:85: case 0:
   4BEE D1            [10] 1129 	pop	de
   4BEF E9            [ 4] 1130 	jp	(hl)
   4BF0                    1131 00111$:
   4BF0 18 04         [12] 1132 	jr	00101$
   4BF2 18 0C         [12] 1133 	jr	00102$
   4BF4 18 14         [12] 1134 	jr	00103$
   4BF6                    1135 00101$:
                           1136 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BF6 21 04 10      [10] 1137 	ld	hl,#0x1004
   4BF9 E5            [11] 1138 	push	hl
   4BFA D5            [11] 1139 	push	de
   4BFB C5            [11] 1140 	push	bc
   4BFC CD B3 6B      [17] 1141 	call	_cpct_drawSpriteMasked
                           1142 ;src/draws.h:87: break;
   4BFF C9            [10] 1143 	ret
                           1144 ;src/draws.h:88: case 1:
   4C00                    1145 00102$:
                           1146 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4C00 21 02 08      [10] 1147 	ld	hl,#0x0802
   4C03 E5            [11] 1148 	push	hl
   4C04 D5            [11] 1149 	push	de
   4C05 C5            [11] 1150 	push	bc
   4C06 CD B3 6B      [17] 1151 	call	_cpct_drawSpriteMasked
                           1152 ;src/draws.h:90: break;
   4C09 C9            [10] 1153 	ret
                           1154 ;src/draws.h:91: case 2:
   4C0A                    1155 00103$:
                           1156 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4C0A 21 04 04      [10] 1157 	ld	hl,#0x0404
   4C0D E5            [11] 1158 	push	hl
   4C0E D5            [11] 1159 	push	de
   4C0F C5            [11] 1160 	push	bc
   4C10 CD B3 6B      [17] 1161 	call	_cpct_drawSpriteMasked
                           1162 ;src/draws.h:94: }
   4C13 C9            [10] 1163 	ret
                           1164 ;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
                           1165 ;	---------------------------------
                           1166 ; Function erase
                           1167 ; ---------------------------------
   4C14                    1168 _erase::
                           1169 ;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
   4C14 21 03 00      [10] 1170 	ld	hl, #3+0
   4C17 39            [11] 1171 	add	hl, sp
   4C18 7E            [ 7] 1172 	ld	a, (hl)
   4C19 F5            [11] 1173 	push	af
   4C1A 33            [ 6] 1174 	inc	sp
   4C1B 21 03 00      [10] 1175 	ld	hl, #3+0
   4C1E 39            [11] 1176 	add	hl, sp
   4C1F 7E            [ 7] 1177 	ld	a, (hl)
   4C20 F5            [11] 1178 	push	af
   4C21 33            [ 6] 1179 	inc	sp
   4C22 21 00 C0      [10] 1180 	ld	hl,#0xC000
   4C25 E5            [11] 1181 	push	hl
   4C26 CD 0A 6D      [17] 1182 	call	_cpct_getScreenPtr
   4C29 4D            [ 4] 1183 	ld	c, l
   4C2A 44            [ 4] 1184 	ld	b, h
                           1185 ;src/draws.h:102: switch(mode){
   4C2B 3E 02         [ 7] 1186 	ld	a,#0x02
   4C2D FD 21 04 00   [14] 1187 	ld	iy,#4
   4C31 FD 39         [15] 1188 	add	iy,sp
   4C33 FD 96 00      [19] 1189 	sub	a, 0 (iy)
   4C36 D8            [11] 1190 	ret	C
                           1191 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
                           1192 ;src/draws.h:102: switch(mode){
   4C37 FD 5E 00      [19] 1193 	ld	e,0 (iy)
   4C3A 16 00         [ 7] 1194 	ld	d,#0x00
   4C3C 21 42 4C      [10] 1195 	ld	hl,#00111$
   4C3F 19            [11] 1196 	add	hl,de
   4C40 19            [11] 1197 	add	hl,de
                           1198 ;src/draws.h:103: case 0:
   4C41 E9            [ 4] 1199 	jp	(hl)
   4C42                    1200 00111$:
   4C42 18 04         [12] 1201 	jr	00101$
   4C44 18 11         [12] 1202 	jr	00102$
   4C46 18 1E         [12] 1203 	jr	00103$
   4C48                    1204 00101$:
                           1205 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
   4C48 21 04 10      [10] 1206 	ld	hl,#0x1004
   4C4B E5            [11] 1207 	push	hl
   4C4C AF            [ 4] 1208 	xor	a, a
   4C4D F5            [11] 1209 	push	af
   4C4E 33            [ 6] 1210 	inc	sp
   4C4F C5            [11] 1211 	push	bc
   4C50 CD 39 6C      [17] 1212 	call	_cpct_drawSolidBox
   4C53 F1            [10] 1213 	pop	af
   4C54 F1            [10] 1214 	pop	af
   4C55 33            [ 6] 1215 	inc	sp
                           1216 ;src/draws.h:105: break;
   4C56 C9            [10] 1217 	ret
                           1218 ;src/draws.h:106: case 1:
   4C57                    1219 00102$:
                           1220 ;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
   4C57 21 02 08      [10] 1221 	ld	hl,#0x0802
   4C5A E5            [11] 1222 	push	hl
   4C5B AF            [ 4] 1223 	xor	a, a
   4C5C F5            [11] 1224 	push	af
   4C5D 33            [ 6] 1225 	inc	sp
   4C5E C5            [11] 1226 	push	bc
   4C5F CD 39 6C      [17] 1227 	call	_cpct_drawSolidBox
   4C62 F1            [10] 1228 	pop	af
   4C63 F1            [10] 1229 	pop	af
   4C64 33            [ 6] 1230 	inc	sp
                           1231 ;src/draws.h:108: break;
   4C65 C9            [10] 1232 	ret
                           1233 ;src/draws.h:109: case 2:
   4C66                    1234 00103$:
                           1235 ;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
   4C66 21 04 04      [10] 1236 	ld	hl,#0x0404
   4C69 E5            [11] 1237 	push	hl
   4C6A AF            [ 4] 1238 	xor	a, a
   4C6B F5            [11] 1239 	push	af
   4C6C 33            [ 6] 1240 	inc	sp
   4C6D C5            [11] 1241 	push	bc
   4C6E CD 39 6C      [17] 1242 	call	_cpct_drawSolidBox
   4C71 F1            [10] 1243 	pop	af
   4C72 F1            [10] 1244 	pop	af
   4C73 33            [ 6] 1245 	inc	sp
                           1246 ;src/draws.h:112: }
   4C74 C9            [10] 1247 	ret
                           1248 ;src/draws.h:115: void drawStats(){
                           1249 ;	---------------------------------
                           1250 ; Function drawStats
                           1251 ; ---------------------------------
   4C75                    1252 _drawStats::
                           1253 ;src/draws.h:116: drawVida(player.life,1);
   4C75 21 14 6F      [10] 1254 	ld	hl, #_player + 6
   4C78 56            [ 7] 1255 	ld	d,(hl)
   4C79 3E 01         [ 7] 1256 	ld	a,#0x01
   4C7B F5            [11] 1257 	push	af
   4C7C 33            [ 6] 1258 	inc	sp
   4C7D D5            [11] 1259 	push	de
   4C7E 33            [ 6] 1260 	inc	sp
   4C7F CD F7 4A      [17] 1261 	call	_drawVida
   4C82 F1            [10] 1262 	pop	af
                           1263 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C83 21 18 6F      [10] 1264 	ld	hl, #_player + 10
   4C86 56            [ 7] 1265 	ld	d,(hl)
   4C87 3E 10         [ 7] 1266 	ld	a,#0x10
   4C89 F5            [11] 1267 	push	af
   4C8A 33            [ 6] 1268 	inc	sp
   4C8B D5            [11] 1269 	push	de
   4C8C 33            [ 6] 1270 	inc	sp
   4C8D CD 58 4B      [17] 1271 	call	_drawBullets
   4C90 F1            [10] 1272 	pop	af
                           1273 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C91 21 23 6F      [10] 1274 	ld	hl, #_enemy + 10
   4C94 56            [ 7] 1275 	ld	d,(hl)
   4C95 3E 38         [ 7] 1276 	ld	a,#0x38
   4C97 F5            [11] 1277 	push	af
   4C98 33            [ 6] 1278 	inc	sp
   4C99 D5            [11] 1279 	push	de
   4C9A 33            [ 6] 1280 	inc	sp
   4C9B CD 58 4B      [17] 1281 	call	_drawBullets
   4C9E F1            [10] 1282 	pop	af
                           1283 ;src/draws.h:119: drawVida(enemy.life,65);
   4C9F 21 21 6F      [10] 1284 	ld	hl, #_enemy + 8
   4CA2 56            [ 7] 1285 	ld	d,(hl)
   4CA3 3E 41         [ 7] 1286 	ld	a,#0x41
   4CA5 F5            [11] 1287 	push	af
   4CA6 33            [ 6] 1288 	inc	sp
   4CA7 D5            [11] 1289 	push	de
   4CA8 33            [ 6] 1290 	inc	sp
   4CA9 CD F7 4A      [17] 1291 	call	_drawVida
   4CAC F1            [10] 1292 	pop	af
   4CAD C9            [10] 1293 	ret
                           1294 ;src/draws.h:124: void draws(){
                           1295 ;	---------------------------------
                           1296 ; Function draws
                           1297 ; ---------------------------------
   4CAE                    1298 _draws::
   4CAE DD E5         [15] 1299 	push	ix
   4CB0 DD 21 00 00   [14] 1300 	ld	ix,#0
   4CB4 DD 39         [15] 1301 	add	ix,sp
   4CB6 3B            [ 6] 1302 	dec	sp
                           1303 ;src/draws.h:126: if(temp%2 == 0)
   4CB7 FD 21 F0 6E   [14] 1304 	ld	iy,#_temp
   4CBB FD CB 00 46   [20] 1305 	bit	0, 0 (iy)
   4CBF 20 17         [12] 1306 	jr	NZ,00102$
                           1307 ;src/draws.h:127: draw(player.x,player.y,player.sprite,0);
   4CC1 ED 5B 12 6F   [20] 1308 	ld	de, (#_player + 4)
   4CC5 21 0F 6F      [10] 1309 	ld	hl, #_player + 1
   4CC8 46            [ 7] 1310 	ld	b,(hl)
   4CC9 21 0E 6F      [10] 1311 	ld	hl, #_player + 0
   4CCC 4E            [ 7] 1312 	ld	c,(hl)
   4CCD AF            [ 4] 1313 	xor	a, a
   4CCE F5            [11] 1314 	push	af
   4CCF 33            [ 6] 1315 	inc	sp
   4CD0 D5            [11] 1316 	push	de
   4CD1 C5            [11] 1317 	push	bc
   4CD2 CD B4 4B      [17] 1318 	call	_draw
   4CD5 F1            [10] 1319 	pop	af
   4CD6 F1            [10] 1320 	pop	af
   4CD7 33            [ 6] 1321 	inc	sp
   4CD8                    1322 00102$:
                           1323 ;src/draws.h:128: if(enemy.life > 0 && temp%2 == 1)
   4CD8 11 19 6F      [10] 1324 	ld	de,#_enemy+0
   4CDB 3A 21 6F      [13] 1325 	ld	a, (#_enemy + 8)
   4CDE B7            [ 4] 1326 	or	a, a
   4CDF 28 23         [12] 1327 	jr	Z,00104$
   4CE1 3A F0 6E      [13] 1328 	ld	a,(#_temp + 0)
   4CE4 E6 01         [ 7] 1329 	and	a, #0x01
   4CE6 3D            [ 4] 1330 	dec	a
   4CE7 20 1B         [12] 1331 	jr	NZ,00104$
                           1332 ;src/draws.h:129: draw(enemy.x,enemy.y,enemy.sprite,0);
   4CE9 ED 4B 1F 6F   [20] 1333 	ld	bc, (#_enemy + 6)
   4CED 6B            [ 4] 1334 	ld	l, e
   4CEE 62            [ 4] 1335 	ld	h, d
   4CEF 23            [ 6] 1336 	inc	hl
   4CF0 7E            [ 7] 1337 	ld	a,(hl)
   4CF1 DD 77 FF      [19] 1338 	ld	-1 (ix),a
   4CF4 1A            [ 7] 1339 	ld	a,(de)
   4CF5 5F            [ 4] 1340 	ld	e,a
   4CF6 AF            [ 4] 1341 	xor	a, a
   4CF7 F5            [11] 1342 	push	af
   4CF8 33            [ 6] 1343 	inc	sp
   4CF9 C5            [11] 1344 	push	bc
   4CFA DD 56 FF      [19] 1345 	ld	d, -1 (ix)
   4CFD D5            [11] 1346 	push	de
   4CFE CD B4 4B      [17] 1347 	call	_draw
   4D01 F1            [10] 1348 	pop	af
   4D02 F1            [10] 1349 	pop	af
   4D03 33            [ 6] 1350 	inc	sp
   4D04                    1351 00104$:
                           1352 ;src/draws.h:130: if(arrow == 1){
   4D04 3A F4 6E      [13] 1353 	ld	a,(#_arrow + 0)
   4D07 3D            [ 4] 1354 	dec	a
   4D08 20 5D         [12] 1355 	jr	NZ,00116$
                           1356 ;src/draws.h:131: if(parrow.dir == 4 || parrow.dir == 6 && parrow.vivo == 1)
   4D0A 21 01 6F      [10] 1357 	ld	hl, #_parrow + 7
   4D0D 5E            [ 7] 1358 	ld	e,(hl)
                           1359 ;src/draws.h:132: draw(parrow.x,parrow.y,parrow.sprite,2);
   4D0E 01 FB 6E      [10] 1360 	ld	bc,#_parrow + 1
                           1361 ;src/draws.h:131: if(parrow.dir == 4 || parrow.dir == 6 && parrow.vivo == 1)
   4D11 7B            [ 4] 1362 	ld	a,e
   4D12 D6 04         [ 7] 1363 	sub	a, #0x04
   4D14 28 0C         [12] 1364 	jr	Z,00110$
   4D16 21 00 6F      [10] 1365 	ld	hl,#_parrow + 6
   4D19 7B            [ 4] 1366 	ld	a,e
   4D1A D6 06         [ 7] 1367 	sub	a, #0x06
   4D1C 20 25         [12] 1368 	jr	NZ,00111$
   4D1E 7E            [ 7] 1369 	ld	a,(hl)
   4D1F 3D            [ 4] 1370 	dec	a
   4D20 20 21         [12] 1371 	jr	NZ,00111$
   4D22                    1372 00110$:
                           1373 ;src/draws.h:132: draw(parrow.x,parrow.y,parrow.sprite,2);
   4D22 ED 5B FE 6E   [20] 1374 	ld	de, (#(_parrow + 0x0004) + 0)
   4D26 0A            [ 7] 1375 	ld	a,(bc)
   4D27 DD 77 FF      [19] 1376 	ld	-1 (ix),a
   4D2A 21 FA 6E      [10] 1377 	ld	hl, #_parrow + 0
   4D2D 4E            [ 7] 1378 	ld	c,(hl)
   4D2E 3E 02         [ 7] 1379 	ld	a,#0x02
   4D30 F5            [11] 1380 	push	af
   4D31 33            [ 6] 1381 	inc	sp
   4D32 D5            [11] 1382 	push	de
   4D33 DD 7E FF      [19] 1383 	ld	a,-1 (ix)
   4D36 F5            [11] 1384 	push	af
   4D37 33            [ 6] 1385 	inc	sp
   4D38 79            [ 4] 1386 	ld	a,c
   4D39 F5            [11] 1387 	push	af
   4D3A 33            [ 6] 1388 	inc	sp
   4D3B CD B4 4B      [17] 1389 	call	_draw
   4D3E F1            [10] 1390 	pop	af
   4D3F F1            [10] 1391 	pop	af
   4D40 33            [ 6] 1392 	inc	sp
   4D41 18 24         [12] 1393 	jr	00116$
   4D43                    1394 00111$:
                           1395 ;src/draws.h:133: else if(parrow.dir == 2 || parrow.dir == 8 && parrow.vivo == 1)
   4D43 7B            [ 4] 1396 	ld	a,e
   4D44 D6 02         [ 7] 1397 	sub	a, #0x02
   4D46 28 09         [12] 1398 	jr	Z,00106$
   4D48 7B            [ 4] 1399 	ld	a,e
   4D49 D6 08         [ 7] 1400 	sub	a, #0x08
   4D4B 20 1A         [12] 1401 	jr	NZ,00116$
   4D4D 7E            [ 7] 1402 	ld	a,(hl)
   4D4E 3D            [ 4] 1403 	dec	a
   4D4F 20 16         [12] 1404 	jr	NZ,00116$
   4D51                    1405 00106$:
                           1406 ;src/draws.h:134: draw(parrow.x,parrow.y,parrow.sprite,1);
   4D51 ED 5B FE 6E   [20] 1407 	ld	de, (#(_parrow + 0x0004) + 0)
   4D55 0A            [ 7] 1408 	ld	a,(bc)
   4D56 47            [ 4] 1409 	ld	b,a
   4D57 21 FA 6E      [10] 1410 	ld	hl, #_parrow + 0
   4D5A 4E            [ 7] 1411 	ld	c,(hl)
   4D5B 3E 01         [ 7] 1412 	ld	a,#0x01
   4D5D F5            [11] 1413 	push	af
   4D5E 33            [ 6] 1414 	inc	sp
   4D5F D5            [11] 1415 	push	de
   4D60 C5            [11] 1416 	push	bc
   4D61 CD B4 4B      [17] 1417 	call	_draw
   4D64 F1            [10] 1418 	pop	af
   4D65 F1            [10] 1419 	pop	af
   4D66 33            [ 6] 1420 	inc	sp
   4D67                    1421 00116$:
                           1422 ;src/draws.h:136: if(shooted == 1){
   4D67 3A F5 6E      [13] 1423 	ld	a,(#_shooted + 0)
   4D6A 3D            [ 4] 1424 	dec	a
   4D6B 20 5D         [12] 1425 	jr	NZ,00127$
                           1426 ;src/draws.h:137: if(earrow.dir == 4 || earrow.dir == 6 && earrow.vivo == 1)
   4D6D 21 0B 6F      [10] 1427 	ld	hl, #_earrow + 7
   4D70 5E            [ 7] 1428 	ld	e,(hl)
                           1429 ;src/draws.h:138: draw(earrow.x,earrow.y,earrow.sprite,2);
   4D71 01 05 6F      [10] 1430 	ld	bc,#_earrow + 1
                           1431 ;src/draws.h:137: if(earrow.dir == 4 || earrow.dir == 6 && earrow.vivo == 1)
   4D74 7B            [ 4] 1432 	ld	a,e
   4D75 D6 04         [ 7] 1433 	sub	a, #0x04
   4D77 28 0C         [12] 1434 	jr	Z,00121$
   4D79 21 0A 6F      [10] 1435 	ld	hl,#_earrow + 6
   4D7C 7B            [ 4] 1436 	ld	a,e
   4D7D D6 06         [ 7] 1437 	sub	a, #0x06
   4D7F 20 25         [12] 1438 	jr	NZ,00122$
   4D81 7E            [ 7] 1439 	ld	a,(hl)
   4D82 3D            [ 4] 1440 	dec	a
   4D83 20 21         [12] 1441 	jr	NZ,00122$
   4D85                    1442 00121$:
                           1443 ;src/draws.h:138: draw(earrow.x,earrow.y,earrow.sprite,2);
   4D85 ED 5B 08 6F   [20] 1444 	ld	de, (#(_earrow + 0x0004) + 0)
   4D89 0A            [ 7] 1445 	ld	a,(bc)
   4D8A DD 77 FF      [19] 1446 	ld	-1 (ix),a
   4D8D 21 04 6F      [10] 1447 	ld	hl, #_earrow + 0
   4D90 4E            [ 7] 1448 	ld	c,(hl)
   4D91 3E 02         [ 7] 1449 	ld	a,#0x02
   4D93 F5            [11] 1450 	push	af
   4D94 33            [ 6] 1451 	inc	sp
   4D95 D5            [11] 1452 	push	de
   4D96 DD 7E FF      [19] 1453 	ld	a,-1 (ix)
   4D99 F5            [11] 1454 	push	af
   4D9A 33            [ 6] 1455 	inc	sp
   4D9B 79            [ 4] 1456 	ld	a,c
   4D9C F5            [11] 1457 	push	af
   4D9D 33            [ 6] 1458 	inc	sp
   4D9E CD B4 4B      [17] 1459 	call	_draw
   4DA1 F1            [10] 1460 	pop	af
   4DA2 F1            [10] 1461 	pop	af
   4DA3 33            [ 6] 1462 	inc	sp
   4DA4 18 24         [12] 1463 	jr	00127$
   4DA6                    1464 00122$:
                           1465 ;src/draws.h:139: else if(earrow.dir == 2 || earrow.dir == 8 && earrow.vivo == 1)
   4DA6 7B            [ 4] 1466 	ld	a,e
   4DA7 D6 02         [ 7] 1467 	sub	a, #0x02
   4DA9 28 09         [12] 1468 	jr	Z,00117$
   4DAB 7B            [ 4] 1469 	ld	a,e
   4DAC D6 08         [ 7] 1470 	sub	a, #0x08
   4DAE 20 1A         [12] 1471 	jr	NZ,00127$
   4DB0 7E            [ 7] 1472 	ld	a,(hl)
   4DB1 3D            [ 4] 1473 	dec	a
   4DB2 20 16         [12] 1474 	jr	NZ,00127$
   4DB4                    1475 00117$:
                           1476 ;src/draws.h:140: draw(earrow.x,earrow.y,earrow.sprite,1);
   4DB4 ED 5B 08 6F   [20] 1477 	ld	de, (#(_earrow + 0x0004) + 0)
   4DB8 0A            [ 7] 1478 	ld	a,(bc)
   4DB9 47            [ 4] 1479 	ld	b,a
   4DBA 21 04 6F      [10] 1480 	ld	hl, #_earrow + 0
   4DBD 4E            [ 7] 1481 	ld	c,(hl)
   4DBE 3E 01         [ 7] 1482 	ld	a,#0x01
   4DC0 F5            [11] 1483 	push	af
   4DC1 33            [ 6] 1484 	inc	sp
   4DC2 D5            [11] 1485 	push	de
   4DC3 C5            [11] 1486 	push	bc
   4DC4 CD B4 4B      [17] 1487 	call	_draw
   4DC7 F1            [10] 1488 	pop	af
   4DC8 F1            [10] 1489 	pop	af
   4DC9 33            [ 6] 1490 	inc	sp
   4DCA                    1491 00127$:
                           1492 ;src/draws.h:142: drawStats();
   4DCA CD 75 4C      [17] 1493 	call	_drawStats
   4DCD 33            [ 6] 1494 	inc	sp
   4DCE DD E1         [14] 1495 	pop	ix
   4DD0 C9            [10] 1496 	ret
                           1497 ;src/draws.h:145: void erases(){
                           1498 ;	---------------------------------
                           1499 ; Function erases
                           1500 ; ---------------------------------
   4DD1                    1501 _erases::
                           1502 ;src/draws.h:147: if(temp%2 == 0) erase(player.lx,player.ly,0);
   4DD1 FD 21 F0 6E   [14] 1503 	ld	iy,#_temp
   4DD5 FD CB 00 46   [20] 1504 	bit	0, 0 (iy)
   4DD9 20 14         [12] 1505 	jr	NZ,00102$
   4DDB 21 11 6F      [10] 1506 	ld	hl, #_player + 3
   4DDE 56            [ 7] 1507 	ld	d,(hl)
   4DDF 21 10 6F      [10] 1508 	ld	hl, #_player + 2
   4DE2 46            [ 7] 1509 	ld	b,(hl)
   4DE3 AF            [ 4] 1510 	xor	a, a
   4DE4 F5            [11] 1511 	push	af
   4DE5 33            [ 6] 1512 	inc	sp
   4DE6 D5            [11] 1513 	push	de
   4DE7 33            [ 6] 1514 	inc	sp
   4DE8 C5            [11] 1515 	push	bc
   4DE9 33            [ 6] 1516 	inc	sp
   4DEA CD 14 4C      [17] 1517 	call	_erase
   4DED F1            [10] 1518 	pop	af
   4DEE 33            [ 6] 1519 	inc	sp
   4DEF                    1520 00102$:
                           1521 ;src/draws.h:148: if(temp%2 == 1) erase(enemy.lx,enemy.ly,0);
   4DEF 3A F0 6E      [13] 1522 	ld	a,(#_temp + 0)
   4DF2 E6 01         [ 7] 1523 	and	a, #0x01
   4DF4 3D            [ 4] 1524 	dec	a
   4DF5 20 14         [12] 1525 	jr	NZ,00104$
   4DF7 21 1C 6F      [10] 1526 	ld	hl, #_enemy + 3
   4DFA 56            [ 7] 1527 	ld	d,(hl)
   4DFB 21 1B 6F      [10] 1528 	ld	hl, #_enemy + 2
   4DFE 46            [ 7] 1529 	ld	b,(hl)
   4DFF AF            [ 4] 1530 	xor	a, a
   4E00 F5            [11] 1531 	push	af
   4E01 33            [ 6] 1532 	inc	sp
   4E02 D5            [11] 1533 	push	de
   4E03 33            [ 6] 1534 	inc	sp
   4E04 C5            [11] 1535 	push	bc
   4E05 33            [ 6] 1536 	inc	sp
   4E06 CD 14 4C      [17] 1537 	call	_erase
   4E09 F1            [10] 1538 	pop	af
   4E0A 33            [ 6] 1539 	inc	sp
   4E0B                    1540 00104$:
                           1541 ;src/draws.h:149: if(arrow == 1){
   4E0B 3A F4 6E      [13] 1542 	ld	a,(#_arrow + 0)
   4E0E 3D            [ 4] 1543 	dec	a
   4E0F 20 3C         [12] 1544 	jr	NZ,00112$
                           1545 ;src/draws.h:150: if(parrow.dir == 4 || parrow.dir == 6) erase(parrow.lx,parrow.ly,2);
   4E11 21 01 6F      [10] 1546 	ld	hl, #_parrow + 7
   4E14 5E            [ 7] 1547 	ld	e,(hl)
   4E15 21 FD 6E      [10] 1548 	ld	hl, #_parrow + 3
   4E18 56            [ 7] 1549 	ld	d,(hl)
   4E19 21 FC 6E      [10] 1550 	ld	hl, #_parrow + 2
   4E1C 46            [ 7] 1551 	ld	b,(hl)
   4E1D 7B            [ 4] 1552 	ld	a,e
   4E1E FE 04         [ 7] 1553 	cp	a,#0x04
   4E20 28 04         [12] 1554 	jr	Z,00105$
   4E22 D6 06         [ 7] 1555 	sub	a, #0x06
   4E24 20 0F         [12] 1556 	jr	NZ,00106$
   4E26                    1557 00105$:
   4E26 3E 02         [ 7] 1558 	ld	a,#0x02
   4E28 F5            [11] 1559 	push	af
   4E29 33            [ 6] 1560 	inc	sp
   4E2A D5            [11] 1561 	push	de
   4E2B 33            [ 6] 1562 	inc	sp
   4E2C C5            [11] 1563 	push	bc
   4E2D 33            [ 6] 1564 	inc	sp
   4E2E CD 14 4C      [17] 1565 	call	_erase
   4E31 F1            [10] 1566 	pop	af
   4E32 33            [ 6] 1567 	inc	sp
   4E33 18 0D         [12] 1568 	jr	00107$
   4E35                    1569 00106$:
                           1570 ;src/draws.h:151: else erase(parrow.lx,parrow.ly,1);
   4E35 3E 01         [ 7] 1571 	ld	a,#0x01
   4E37 F5            [11] 1572 	push	af
   4E38 33            [ 6] 1573 	inc	sp
   4E39 D5            [11] 1574 	push	de
   4E3A 33            [ 6] 1575 	inc	sp
   4E3B C5            [11] 1576 	push	bc
   4E3C 33            [ 6] 1577 	inc	sp
   4E3D CD 14 4C      [17] 1578 	call	_erase
   4E40 F1            [10] 1579 	pop	af
   4E41 33            [ 6] 1580 	inc	sp
   4E42                    1581 00107$:
                           1582 ;src/draws.h:152: if(bound == 1) arrow = 0;
   4E42 3A F7 6E      [13] 1583 	ld	a,(#_bound + 0)
   4E45 3D            [ 4] 1584 	dec	a
   4E46 20 05         [12] 1585 	jr	NZ,00112$
   4E48 21 F4 6E      [10] 1586 	ld	hl,#_arrow + 0
   4E4B 36 00         [10] 1587 	ld	(hl), #0x00
   4E4D                    1588 00112$:
                           1589 ;src/draws.h:154: if(shooted == 1){
   4E4D 3A F5 6E      [13] 1590 	ld	a,(#_shooted + 0)
   4E50 3D            [ 4] 1591 	dec	a
   4E51 C0            [11] 1592 	ret	NZ
                           1593 ;src/draws.h:155: if(earrow.dir == 4 || earrow.dir == 6) erase(earrow.lx,earrow.ly,2);
   4E52 21 0B 6F      [10] 1594 	ld	hl, #_earrow + 7
   4E55 5E            [ 7] 1595 	ld	e,(hl)
   4E56 21 07 6F      [10] 1596 	ld	hl, #_earrow + 3
   4E59 56            [ 7] 1597 	ld	d,(hl)
   4E5A 21 06 6F      [10] 1598 	ld	hl, #_earrow + 2
   4E5D 46            [ 7] 1599 	ld	b,(hl)
   4E5E 7B            [ 4] 1600 	ld	a,e
   4E5F FE 04         [ 7] 1601 	cp	a,#0x04
   4E61 28 04         [12] 1602 	jr	Z,00113$
   4E63 D6 06         [ 7] 1603 	sub	a, #0x06
   4E65 20 0F         [12] 1604 	jr	NZ,00114$
   4E67                    1605 00113$:
   4E67 3E 02         [ 7] 1606 	ld	a,#0x02
   4E69 F5            [11] 1607 	push	af
   4E6A 33            [ 6] 1608 	inc	sp
   4E6B D5            [11] 1609 	push	de
   4E6C 33            [ 6] 1610 	inc	sp
   4E6D C5            [11] 1611 	push	bc
   4E6E 33            [ 6] 1612 	inc	sp
   4E6F CD 14 4C      [17] 1613 	call	_erase
   4E72 F1            [10] 1614 	pop	af
   4E73 33            [ 6] 1615 	inc	sp
   4E74 18 0D         [12] 1616 	jr	00115$
   4E76                    1617 00114$:
                           1618 ;src/draws.h:156: else erase(earrow.lx,earrow.ly,1);
   4E76 3E 01         [ 7] 1619 	ld	a,#0x01
   4E78 F5            [11] 1620 	push	af
   4E79 33            [ 6] 1621 	inc	sp
   4E7A D5            [11] 1622 	push	de
   4E7B 33            [ 6] 1623 	inc	sp
   4E7C C5            [11] 1624 	push	bc
   4E7D 33            [ 6] 1625 	inc	sp
   4E7E CD 14 4C      [17] 1626 	call	_erase
   4E81 F1            [10] 1627 	pop	af
   4E82 33            [ 6] 1628 	inc	sp
   4E83                    1629 00115$:
                           1630 ;src/draws.h:157: if(bounds == 1) shooted = 0;
   4E83 3A F8 6E      [13] 1631 	ld	a,(#_bounds + 0)
   4E86 3D            [ 4] 1632 	dec	a
   4E87 C0            [11] 1633 	ret	NZ
   4E88 21 F5 6E      [10] 1634 	ld	hl,#_shooted + 0
   4E8B 36 00         [10] 1635 	ld	(hl), #0x00
   4E8D C9            [10] 1636 	ret
                           1637 ;src/draws.h:164: void drawFatiga(u8 atk, u8 col){
                           1638 ;	---------------------------------
                           1639 ; Function drawFatiga
                           1640 ; ---------------------------------
   4E8E                    1641 _drawFatiga::
   4E8E DD E5         [15] 1642 	push	ix
   4E90 DD 21 00 00   [14] 1643 	ld	ix,#0
   4E94 DD 39         [15] 1644 	add	ix,sp
   4E96 F5            [11] 1645 	push	af
                           1646 ;src/draws.h:166: if(atk < 20)
   4E97 DD 7E 04      [19] 1647 	ld	a,4 (ix)
   4E9A D6 14         [ 7] 1648 	sub	a, #0x14
   4E9C 30 04         [12] 1649 	jr	NC,00102$
                           1650 ;src/draws.h:167: col = 2;
   4E9E DD 36 05 02   [19] 1651 	ld	5 (ix),#0x02
   4EA2                    1652 00102$:
                           1653 ;src/draws.h:168: if(atk > 30 || atk <= 20){
   4EA2 3E 14         [ 7] 1654 	ld	a,#0x14
   4EA4 DD 96 04      [19] 1655 	sub	a, 4 (ix)
   4EA7 3E 00         [ 7] 1656 	ld	a,#0x00
   4EA9 17            [ 4] 1657 	rla
   4EAA DD 77 FF      [19] 1658 	ld	-1 (ix),a
                           1659 ;src/draws.h:170: switch(col){
   4EAD 3E 02         [ 7] 1660 	ld	a,#0x02
   4EAF DD 96 05      [19] 1661 	sub	a, 5 (ix)
   4EB2 3E 00         [ 7] 1662 	ld	a,#0x00
   4EB4 17            [ 4] 1663 	rla
   4EB5 DD 77 FE      [19] 1664 	ld	-2 (ix),a
                           1665 ;src/draws.h:168: if(atk > 30 || atk <= 20){
   4EB8 3E 1E         [ 7] 1666 	ld	a,#0x1E
   4EBA DD 96 04      [19] 1667 	sub	a, 4 (ix)
   4EBD 38 06         [12] 1668 	jr	C,00107$
   4EBF DD 7E FF      [19] 1669 	ld	a,-1 (ix)
   4EC2 B7            [ 4] 1670 	or	a, a
   4EC3 20 4F         [12] 1671 	jr	NZ,00108$
   4EC5                    1672 00107$:
                           1673 ;src/draws.h:169: memptr = cpct_getScreenPtr(VMEM,28,192);
   4EC5 21 1C C0      [10] 1674 	ld	hl,#0xC01C
   4EC8 E5            [11] 1675 	push	hl
   4EC9 2E 00         [ 7] 1676 	ld	l, #0x00
   4ECB E5            [11] 1677 	push	hl
   4ECC CD 0A 6D      [17] 1678 	call	_cpct_getScreenPtr
                           1679 ;src/draws.h:170: switch(col){
   4ECF DD 7E FE      [19] 1680 	ld	a,-2 (ix)
   4ED2 B7            [ 4] 1681 	or	a, a
   4ED3 20 3F         [12] 1682 	jr	NZ,00108$
                           1683 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4ED5 4D            [ 4] 1684 	ld	c, l
   4ED6 44            [ 4] 1685 	ld	b, h
                           1686 ;src/draws.h:170: switch(col){
   4ED7 DD 5E 05      [19] 1687 	ld	e,5 (ix)
   4EDA 16 00         [ 7] 1688 	ld	d,#0x00
   4EDC 21 E2 4E      [10] 1689 	ld	hl,#00156$
   4EDF 19            [11] 1690 	add	hl,de
   4EE0 19            [11] 1691 	add	hl,de
                           1692 ;src/draws.h:171: case 0:
   4EE1 E9            [ 4] 1693 	jp	(hl)
   4EE2                    1694 00156$:
   4EE2 18 04         [12] 1695 	jr	00103$
   4EE4 18 14         [12] 1696 	jr	00104$
   4EE6 18 20         [12] 1697 	jr	00105$
   4EE8                    1698 00103$:
                           1699 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4EE8 21 02 08      [10] 1700 	ld	hl,#0x0802
   4EEB E5            [11] 1701 	push	hl
   4EEC DD 7E 05      [19] 1702 	ld	a,5 (ix)
   4EEF F5            [11] 1703 	push	af
   4EF0 33            [ 6] 1704 	inc	sp
   4EF1 C5            [11] 1705 	push	bc
   4EF2 CD 39 6C      [17] 1706 	call	_cpct_drawSolidBox
   4EF5 F1            [10] 1707 	pop	af
   4EF6 F1            [10] 1708 	pop	af
   4EF7 33            [ 6] 1709 	inc	sp
                           1710 ;src/draws.h:173: break;
   4EF8 18 1A         [12] 1711 	jr	00108$
                           1712 ;src/draws.h:174: case 1:
   4EFA                    1713 00104$:
                           1714 ;src/draws.h:175: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4EFA 11 80 46      [10] 1715 	ld	de,#_fatiga_nor
   4EFD 21 02 08      [10] 1716 	ld	hl,#0x0802
   4F00 E5            [11] 1717 	push	hl
   4F01 C5            [11] 1718 	push	bc
   4F02 D5            [11] 1719 	push	de
   4F03 CD B3 6B      [17] 1720 	call	_cpct_drawSpriteMasked
                           1721 ;src/draws.h:176: break;
   4F06 18 0C         [12] 1722 	jr	00108$
                           1723 ;src/draws.h:177: case 2:
   4F08                    1724 00105$:
                           1725 ;src/draws.h:178: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4F08 11 A0 46      [10] 1726 	ld	de,#_fatiga_full
   4F0B 21 02 08      [10] 1727 	ld	hl,#0x0802
   4F0E E5            [11] 1728 	push	hl
   4F0F C5            [11] 1729 	push	bc
   4F10 D5            [11] 1730 	push	de
   4F11 CD B3 6B      [17] 1731 	call	_cpct_drawSpriteMasked
                           1732 ;src/draws.h:179: }
   4F14                    1733 00108$:
                           1734 ;src/draws.h:181: if(atk > 40 || atk <= 20){
   4F14 3E 28         [ 7] 1735 	ld	a,#0x28
   4F16 DD 96 04      [19] 1736 	sub	a, 4 (ix)
   4F19 38 06         [12] 1737 	jr	C,00114$
   4F1B DD 7E FF      [19] 1738 	ld	a,-1 (ix)
   4F1E B7            [ 4] 1739 	or	a, a
   4F1F 20 4F         [12] 1740 	jr	NZ,00115$
   4F21                    1741 00114$:
                           1742 ;src/draws.h:182: memptr = cpct_getScreenPtr(VMEM,31,192);
   4F21 21 1F C0      [10] 1743 	ld	hl,#0xC01F
   4F24 E5            [11] 1744 	push	hl
   4F25 2E 00         [ 7] 1745 	ld	l, #0x00
   4F27 E5            [11] 1746 	push	hl
   4F28 CD 0A 6D      [17] 1747 	call	_cpct_getScreenPtr
                           1748 ;src/draws.h:183: switch(col){
   4F2B DD 7E FE      [19] 1749 	ld	a,-2 (ix)
   4F2E B7            [ 4] 1750 	or	a, a
   4F2F 20 3F         [12] 1751 	jr	NZ,00115$
                           1752 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4F31 4D            [ 4] 1753 	ld	c, l
   4F32 44            [ 4] 1754 	ld	b, h
                           1755 ;src/draws.h:183: switch(col){
   4F33 DD 5E 05      [19] 1756 	ld	e,5 (ix)
   4F36 16 00         [ 7] 1757 	ld	d,#0x00
   4F38 21 3E 4F      [10] 1758 	ld	hl,#00157$
   4F3B 19            [11] 1759 	add	hl,de
   4F3C 19            [11] 1760 	add	hl,de
                           1761 ;src/draws.h:184: case 0:
   4F3D E9            [ 4] 1762 	jp	(hl)
   4F3E                    1763 00157$:
   4F3E 18 04         [12] 1764 	jr	00110$
   4F40 18 14         [12] 1765 	jr	00111$
   4F42 18 20         [12] 1766 	jr	00112$
   4F44                    1767 00110$:
                           1768 ;src/draws.h:185: cpct_drawSolidBox(memptr, col, 2, 8);
   4F44 21 02 08      [10] 1769 	ld	hl,#0x0802
   4F47 E5            [11] 1770 	push	hl
   4F48 DD 7E 05      [19] 1771 	ld	a,5 (ix)
   4F4B F5            [11] 1772 	push	af
   4F4C 33            [ 6] 1773 	inc	sp
   4F4D C5            [11] 1774 	push	bc
   4F4E CD 39 6C      [17] 1775 	call	_cpct_drawSolidBox
   4F51 F1            [10] 1776 	pop	af
   4F52 F1            [10] 1777 	pop	af
   4F53 33            [ 6] 1778 	inc	sp
                           1779 ;src/draws.h:186: break;
   4F54 18 1A         [12] 1780 	jr	00115$
                           1781 ;src/draws.h:187: case 1:
   4F56                    1782 00111$:
                           1783 ;src/draws.h:188: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4F56 11 80 46      [10] 1784 	ld	de,#_fatiga_nor
   4F59 21 02 08      [10] 1785 	ld	hl,#0x0802
   4F5C E5            [11] 1786 	push	hl
   4F5D C5            [11] 1787 	push	bc
   4F5E D5            [11] 1788 	push	de
   4F5F CD B3 6B      [17] 1789 	call	_cpct_drawSpriteMasked
                           1790 ;src/draws.h:189: break;
   4F62 18 0C         [12] 1791 	jr	00115$
                           1792 ;src/draws.h:190: case 2:
   4F64                    1793 00112$:
                           1794 ;src/draws.h:191: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4F64 11 A0 46      [10] 1795 	ld	de,#_fatiga_full
   4F67 21 02 08      [10] 1796 	ld	hl,#0x0802
   4F6A E5            [11] 1797 	push	hl
   4F6B C5            [11] 1798 	push	bc
   4F6C D5            [11] 1799 	push	de
   4F6D CD B3 6B      [17] 1800 	call	_cpct_drawSpriteMasked
                           1801 ;src/draws.h:192: }
   4F70                    1802 00115$:
                           1803 ;src/draws.h:194: if(atk <= 20){
   4F70 DD 7E FF      [19] 1804 	ld	a,-1 (ix)
   4F73 B7            [ 4] 1805 	or	a, a
   4F74 20 39         [12] 1806 	jr	NZ,00122$
                           1807 ;src/draws.h:195: memptr = cpct_getScreenPtr(VMEM,34,192);
   4F76 21 22 C0      [10] 1808 	ld	hl,#0xC022
   4F79 E5            [11] 1809 	push	hl
   4F7A 2E 00         [ 7] 1810 	ld	l, #0x00
   4F7C E5            [11] 1811 	push	hl
   4F7D CD 0A 6D      [17] 1812 	call	_cpct_getScreenPtr
                           1813 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4F80 4D            [ 4] 1814 	ld	c, l
   4F81 44            [ 4] 1815 	ld	b, h
                           1816 ;src/draws.h:196: switch(col){
   4F82 DD 7E 05      [19] 1817 	ld	a,5 (ix)
   4F85 B7            [ 4] 1818 	or	a, a
   4F86 28 09         [12] 1819 	jr	Z,00117$
   4F88 DD 7E 05      [19] 1820 	ld	a,5 (ix)
   4F8B D6 02         [ 7] 1821 	sub	a, #0x02
   4F8D 28 14         [12] 1822 	jr	Z,00118$
   4F8F 18 1E         [12] 1823 	jr	00122$
                           1824 ;src/draws.h:197: case 0:
   4F91                    1825 00117$:
                           1826 ;src/draws.h:198: cpct_drawSolidBox(memptr, col, 2, 8);
   4F91 21 02 08      [10] 1827 	ld	hl,#0x0802
   4F94 E5            [11] 1828 	push	hl
   4F95 DD 7E 05      [19] 1829 	ld	a,5 (ix)
   4F98 F5            [11] 1830 	push	af
   4F99 33            [ 6] 1831 	inc	sp
   4F9A C5            [11] 1832 	push	bc
   4F9B CD 39 6C      [17] 1833 	call	_cpct_drawSolidBox
   4F9E F1            [10] 1834 	pop	af
   4F9F F1            [10] 1835 	pop	af
   4FA0 33            [ 6] 1836 	inc	sp
                           1837 ;src/draws.h:199: break;
   4FA1 18 0C         [12] 1838 	jr	00122$
                           1839 ;src/draws.h:200: case 2:
   4FA3                    1840 00118$:
                           1841 ;src/draws.h:201: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4FA3 11 A0 46      [10] 1842 	ld	de,#_fatiga_full
   4FA6 21 02 08      [10] 1843 	ld	hl,#0x0802
   4FA9 E5            [11] 1844 	push	hl
   4FAA C5            [11] 1845 	push	bc
   4FAB D5            [11] 1846 	push	de
   4FAC CD B3 6B      [17] 1847 	call	_cpct_drawSpriteMasked
                           1848 ;src/draws.h:202: }
   4FAF                    1849 00122$:
   4FAF DD F9         [10] 1850 	ld	sp, ix
   4FB1 DD E1         [14] 1851 	pop	ix
   4FB3 C9            [10] 1852 	ret
                           1853 ;src/draws.h:207: void drawPickUps(u8 corazon, u8 bullet){
                           1854 ;	---------------------------------
                           1855 ; Function drawPickUps
                           1856 ; ---------------------------------
   4FB4                    1857 _drawPickUps::
   4FB4 DD E5         [15] 1858 	push	ix
   4FB6 DD 21 00 00   [14] 1859 	ld	ix,#0
   4FBA DD 39         [15] 1860 	add	ix,sp
                           1861 ;src/draws.h:210: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4FBC 21 04 A0      [10] 1862 	ld	hl,#0xA004
   4FBF E5            [11] 1863 	push	hl
   4FC0 21 00 C0      [10] 1864 	ld	hl,#0xC000
   4FC3 E5            [11] 1865 	push	hl
   4FC4 CD 0A 6D      [17] 1866 	call	_cpct_getScreenPtr
                           1867 ;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4FC7 4D            [ 4] 1868 	ld	c, l
   4FC8 44            [ 4] 1869 	ld	b, h
                           1870 ;src/draws.h:211: if(corazon == 0)
   4FC9 DD 7E 04      [19] 1871 	ld	a,4 (ix)
   4FCC B7            [ 4] 1872 	or	a, a
   4FCD 20 0E         [12] 1873 	jr	NZ,00102$
                           1874 ;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4FCF 11 00 46      [10] 1875 	ld	de,#_corazon_lleno
   4FD2 21 04 08      [10] 1876 	ld	hl,#0x0804
   4FD5 E5            [11] 1877 	push	hl
   4FD6 C5            [11] 1878 	push	bc
   4FD7 D5            [11] 1879 	push	de
   4FD8 CD B3 6B      [17] 1880 	call	_cpct_drawSpriteMasked
   4FDB 18 0E         [12] 1881 	jr	00103$
   4FDD                    1882 00102$:
                           1883 ;src/draws.h:214: cpct_drawSolidBox(memptr, 0, 4, 8);
   4FDD 21 04 08      [10] 1884 	ld	hl,#0x0804
   4FE0 E5            [11] 1885 	push	hl
   4FE1 AF            [ 4] 1886 	xor	a, a
   4FE2 F5            [11] 1887 	push	af
   4FE3 33            [ 6] 1888 	inc	sp
   4FE4 C5            [11] 1889 	push	bc
   4FE5 CD 39 6C      [17] 1890 	call	_cpct_drawSolidBox
   4FE8 F1            [10] 1891 	pop	af
   4FE9 F1            [10] 1892 	pop	af
   4FEA 33            [ 6] 1893 	inc	sp
   4FEB                    1894 00103$:
                           1895 ;src/draws.h:216: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4FEB 21 08 10      [10] 1896 	ld	hl,#0x1008
   4FEE E5            [11] 1897 	push	hl
   4FEF 21 00 C0      [10] 1898 	ld	hl,#0xC000
   4FF2 E5            [11] 1899 	push	hl
   4FF3 CD 0A 6D      [17] 1900 	call	_cpct_getScreenPtr
                           1901 ;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4FF6 EB            [ 4] 1902 	ex	de,hl
                           1903 ;src/draws.h:217: if(bullet == 0)
   4FF7 DD 7E 05      [19] 1904 	ld	a,5 (ix)
   4FFA B7            [ 4] 1905 	or	a, a
   4FFB 20 0E         [12] 1906 	jr	NZ,00105$
                           1907 ;src/draws.h:218: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4FFD 01 98 68      [10] 1908 	ld	bc,#_flecha_arriba
   5000 21 02 08      [10] 1909 	ld	hl,#0x0802
   5003 E5            [11] 1910 	push	hl
   5004 D5            [11] 1911 	push	de
   5005 C5            [11] 1912 	push	bc
   5006 CD B3 6B      [17] 1913 	call	_cpct_drawSpriteMasked
   5009 18 0E         [12] 1914 	jr	00107$
   500B                    1915 00105$:
                           1916 ;src/draws.h:220: cpct_drawSolidBox(memptr, 0, 2, 8);
   500B 21 02 08      [10] 1917 	ld	hl,#0x0802
   500E E5            [11] 1918 	push	hl
   500F AF            [ 4] 1919 	xor	a, a
   5010 F5            [11] 1920 	push	af
   5011 33            [ 6] 1921 	inc	sp
   5012 D5            [11] 1922 	push	de
   5013 CD 39 6C      [17] 1923 	call	_cpct_drawSolidBox
   5016 F1            [10] 1924 	pop	af
   5017 F1            [10] 1925 	pop	af
   5018 33            [ 6] 1926 	inc	sp
   5019                    1927 00107$:
   5019 DD E1         [14] 1928 	pop	ix
   501B C9            [10] 1929 	ret
                           1930 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1931 ;	---------------------------------
                           1932 ; Function detectPlayerRoom
                           1933 ; ---------------------------------
   501C                    1934 _detectPlayerRoom::
   501C DD E5         [15] 1935 	push	ix
   501E DD 21 00 00   [14] 1936 	ld	ix,#0
   5022 DD 39         [15] 1937 	add	ix,sp
                           1938 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   5024 11 00 6E      [10] 1939 	ld	de,#_scene+0
   5027 DD 7E 05      [19] 1940 	ld	a,5 (ix)
   502A 07            [ 4] 1941 	rlca
   502B 07            [ 4] 1942 	rlca
   502C 07            [ 4] 1943 	rlca
   502D 07            [ 4] 1944 	rlca
   502E E6 0F         [ 7] 1945 	and	a,#0x0F
   5030 4F            [ 4] 1946 	ld	c,a
   5031 06 00         [ 7] 1947 	ld	b,#0x00
   5033 69            [ 4] 1948 	ld	l, c
   5034 60            [ 4] 1949 	ld	h, b
   5035 29            [11] 1950 	add	hl, hl
   5036 29            [11] 1951 	add	hl, hl
   5037 09            [11] 1952 	add	hl, bc
   5038 29            [11] 1953 	add	hl, hl
   5039 29            [11] 1954 	add	hl, hl
   503A 19            [11] 1955 	add	hl,de
   503B DD 5E 04      [19] 1956 	ld	e,4 (ix)
   503E CB 3B         [ 8] 1957 	srl	e
   5040 CB 3B         [ 8] 1958 	srl	e
   5042 16 00         [ 7] 1959 	ld	d,#0x00
   5044 19            [11] 1960 	add	hl,de
   5045 6E            [ 7] 1961 	ld	l,(hl)
   5046 DD E1         [14] 1962 	pop	ix
   5048 C9            [10] 1963 	ret
                           1964 ;src/ia.h:16: u8 chooseDirection(){
                           1965 ;	---------------------------------
                           1966 ; Function chooseDirection
                           1967 ; ---------------------------------
   5049                    1968 _chooseDirection::
                           1969 ;src/ia.h:18: u8 dir = 0;
   5049 16 00         [ 7] 1970 	ld	d,#0x00
                           1971 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   504B D5            [11] 1972 	push	de
   504C CD B2 69      [17] 1973 	call	_rand
   504F 01 04 00      [10] 1974 	ld	bc,#0x0004
   5052 C5            [11] 1975 	push	bc
   5053 E5            [11] 1976 	push	hl
   5054 CD FE 6C      [17] 1977 	call	__modsint
   5057 F1            [10] 1978 	pop	af
   5058 F1            [10] 1979 	pop	af
   5059 D1            [10] 1980 	pop	de
   505A 5D            [ 4] 1981 	ld	e,l
   505B 1C            [ 4] 1982 	inc	e
                           1983 ;src/ia.h:20: switch(rnd){
   505C 7B            [ 4] 1984 	ld	a,e
   505D D6 01         [ 7] 1985 	sub	a, #0x01
   505F 38 24         [12] 1986 	jr	C,00105$
   5061 3E 04         [ 7] 1987 	ld	a,#0x04
   5063 93            [ 4] 1988 	sub	a, e
   5064 38 1F         [12] 1989 	jr	C,00105$
   5066 1D            [ 4] 1990 	dec	e
   5067 16 00         [ 7] 1991 	ld	d,#0x00
   5069 21 6F 50      [10] 1992 	ld	hl,#00116$
   506C 19            [11] 1993 	add	hl,de
   506D 19            [11] 1994 	add	hl,de
                           1995 ;src/ia.h:21: case 4: dir = 6;break;
   506E E9            [ 4] 1996 	jp	(hl)
   506F                    1997 00116$:
   506F 18 12         [12] 1998 	jr	00104$
   5071 18 0C         [12] 1999 	jr	00103$
   5073 18 06         [12] 2000 	jr	00102$
   5075 18 00         [12] 2001 	jr	00101$
   5077                    2002 00101$:
   5077 16 06         [ 7] 2003 	ld	d,#0x06
   5079 18 0A         [12] 2004 	jr	00105$
                           2005 ;src/ia.h:22: case 3: dir = 4;break;
   507B                    2006 00102$:
   507B 16 04         [ 7] 2007 	ld	d,#0x04
   507D 18 06         [12] 2008 	jr	00105$
                           2009 ;src/ia.h:23: case 2: dir = 2;break;
   507F                    2010 00103$:
   507F 16 02         [ 7] 2011 	ld	d,#0x02
   5081 18 02         [12] 2012 	jr	00105$
                           2013 ;src/ia.h:24: case 1: dir = 8;break;
   5083                    2014 00104$:
   5083 16 08         [ 7] 2015 	ld	d,#0x08
                           2016 ;src/ia.h:25: }
   5085                    2017 00105$:
                           2018 ;src/ia.h:27: return dir;
   5085 6A            [ 4] 2019 	ld	l,d
   5086 C9            [10] 2020 	ret
                           2021 ;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           2022 ;	---------------------------------
                           2023 ; Function setDirection
                           2024 ; ---------------------------------
   5087                    2025 _setDirection::
   5087 DD E5         [15] 2026 	push	ix
   5089 DD 21 00 00   [14] 2027 	ld	ix,#0
   508D DD 39         [15] 2028 	add	ix,sp
                           2029 ;src/ia.h:33: if(px < x) dir = 4;
   508F DD 7E 04      [19] 2030 	ld	a,4 (ix)
   5092 DD 96 06      [19] 2031 	sub	a, 6 (ix)
   5095 30 04         [12] 2032 	jr	NC,00108$
   5097 2E 04         [ 7] 2033 	ld	l,#0x04
   5099 18 1A         [12] 2034 	jr	00109$
   509B                    2035 00108$:
                           2036 ;src/ia.h:34: else if(py > y) dir = 2;
   509B DD 7E 07      [19] 2037 	ld	a,7 (ix)
   509E DD 96 05      [19] 2038 	sub	a, 5 (ix)
   50A1 30 04         [12] 2039 	jr	NC,00105$
   50A3 2E 02         [ 7] 2040 	ld	l,#0x02
   50A5 18 0E         [12] 2041 	jr	00109$
   50A7                    2042 00105$:
                           2043 ;src/ia.h:35: else if(px > x) dir = 6;
   50A7 DD 7E 06      [19] 2044 	ld	a,6 (ix)
   50AA DD 96 04      [19] 2045 	sub	a, 4 (ix)
   50AD 30 04         [12] 2046 	jr	NC,00102$
   50AF 2E 06         [ 7] 2047 	ld	l,#0x06
   50B1 18 02         [12] 2048 	jr	00109$
   50B3                    2049 00102$:
                           2050 ;src/ia.h:36: else dir = 8;
   50B3 2E 08         [ 7] 2051 	ld	l,#0x08
   50B5                    2052 00109$:
                           2053 ;src/ia.h:37: return dir;
   50B5 DD E1         [14] 2054 	pop	ix
   50B7 C9            [10] 2055 	ret
                           2056 ;src/ia.h:40: void movement(u8 dir){
                           2057 ;	---------------------------------
                           2058 ; Function movement
                           2059 ; ---------------------------------
   50B8                    2060 _movement::
                           2061 ;src/ia.h:41: switch(dir){
   50B8 FD 21 02 00   [14] 2062 	ld	iy,#2
   50BC FD 39         [15] 2063 	add	iy,sp
   50BE FD 7E 00      [19] 2064 	ld	a,0 (iy)
   50C1 D6 02         [ 7] 2065 	sub	a, #0x02
   50C3 28 2B         [12] 2066 	jr	Z,00104$
   50C5 FD 7E 00      [19] 2067 	ld	a,0 (iy)
   50C8 D6 04         [ 7] 2068 	sub	a, #0x04
   50CA 28 14         [12] 2069 	jr	Z,00102$
   50CC FD 7E 00      [19] 2070 	ld	a,0 (iy)
   50CF D6 06         [ 7] 2071 	sub	a, #0x06
   50D1 28 08         [12] 2072 	jr	Z,00101$
   50D3 FD 7E 00      [19] 2073 	ld	a,0 (iy)
   50D6 D6 08         [ 7] 2074 	sub	a, #0x08
   50D8 28 0E         [12] 2075 	jr	Z,00103$
   50DA C9            [10] 2076 	ret
                           2077 ;src/ia.h:42: case 6: enemy.x += 1; break;
   50DB                    2078 00101$:
   50DB 21 19 6F      [10] 2079 	ld	hl,#_enemy+0
   50DE 34            [11] 2080 	inc	(hl)
   50DF C9            [10] 2081 	ret
                           2082 ;src/ia.h:43: case 4: enemy.x -= 1; break;
   50E0                    2083 00102$:
   50E0 11 19 6F      [10] 2084 	ld	de,#_enemy+0
   50E3 1A            [ 7] 2085 	ld	a,(de)
   50E4 C6 FF         [ 7] 2086 	add	a,#0xFF
   50E6 12            [ 7] 2087 	ld	(de),a
   50E7 C9            [10] 2088 	ret
                           2089 ;src/ia.h:44: case 8: enemy.y -= 2; break;
   50E8                    2090 00103$:
   50E8 11 1A 6F      [10] 2091 	ld	de,#_enemy+1
   50EB 1A            [ 7] 2092 	ld	a,(de)
   50EC C6 FE         [ 7] 2093 	add	a,#0xFE
   50EE 12            [ 7] 2094 	ld	(de),a
   50EF C9            [10] 2095 	ret
                           2096 ;src/ia.h:45: case 2: enemy.y += 2; break;
   50F0                    2097 00104$:
   50F0 21 1A 6F      [10] 2098 	ld	hl,#_enemy+1
   50F3 7E            [ 7] 2099 	ld	a,(hl)
   50F4 C6 02         [ 7] 2100 	add	a, #0x02
   50F6 77            [ 7] 2101 	ld	(hl),a
                           2102 ;src/ia.h:46: }
   50F7 C9            [10] 2103 	ret
                           2104 ;src/ia.h:50: void patrol(){
                           2105 ;	---------------------------------
                           2106 ; Function patrol
                           2107 ; ---------------------------------
   50F8                    2108 _patrol::
   50F8 DD E5         [15] 2109 	push	ix
   50FA DD 21 00 00   [14] 2110 	ld	ix,#0
   50FE DD 39         [15] 2111 	add	ix,sp
   5100 21 F4 FF      [10] 2112 	ld	hl,#-12
   5103 39            [11] 2113 	add	hl,sp
   5104 F9            [ 6] 2114 	ld	sp,hl
                           2115 ;src/ia.h:52: movement(enemy.dir);
   5105 3A 22 6F      [13] 2116 	ld	a, (#(_enemy + 0x0009) + 0)
   5108 F5            [11] 2117 	push	af
   5109 33            [ 6] 2118 	inc	sp
   510A CD B8 50      [17] 2119 	call	_movement
   510D 33            [ 6] 2120 	inc	sp
                           2121 ;src/ia.h:54: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   510E 3A 1A 6F      [13] 2122 	ld	a,(#_enemy + 1)
   5111 DD 77 F6      [19] 2123 	ld	-10 (ix), a
   5114 07            [ 4] 2124 	rlca
   5115 07            [ 4] 2125 	rlca
   5116 07            [ 4] 2126 	rlca
   5117 07            [ 4] 2127 	rlca
   5118 E6 0F         [ 7] 2128 	and	a,#0x0F
   511A 4F            [ 4] 2129 	ld	c,a
   511B 06 00         [ 7] 2130 	ld	b,#0x00
   511D 69            [ 4] 2131 	ld	l, c
   511E 60            [ 4] 2132 	ld	h, b
   511F 29            [11] 2133 	add	hl, hl
   5120 29            [11] 2134 	add	hl, hl
   5121 09            [11] 2135 	add	hl, bc
   5122 29            [11] 2136 	add	hl, hl
   5123 29            [11] 2137 	add	hl, hl
   5124 3E 00         [ 7] 2138 	ld	a,#<(_scene)
   5126 85            [ 4] 2139 	add	a, l
   5127 DD 77 F4      [19] 2140 	ld	-12 (ix),a
   512A 3E 6E         [ 7] 2141 	ld	a,#>(_scene)
   512C 8C            [ 4] 2142 	adc	a, h
   512D DD 77 F5      [19] 2143 	ld	-11 (ix),a
   5130 3A 19 6F      [13] 2144 	ld	a,(#_enemy + 0)
   5133 DD 77 FC      [19] 2145 	ld	-4 (ix), a
   5136 0F            [ 4] 2146 	rrca
   5137 0F            [ 4] 2147 	rrca
   5138 E6 3F         [ 7] 2148 	and	a,#0x3F
   513A DD 77 F9      [19] 2149 	ld	-7 (ix),a
   513D DD 7E F4      [19] 2150 	ld	a,-12 (ix)
   5140 DD 86 F9      [19] 2151 	add	a, -7 (ix)
   5143 5F            [ 4] 2152 	ld	e,a
   5144 DD 7E F5      [19] 2153 	ld	a,-11 (ix)
   5147 CE 00         [ 7] 2154 	adc	a, #0x00
   5149 57            [ 4] 2155 	ld	d,a
   514A 3A 24 6F      [13] 2156 	ld	a,(#_enemy + 11)
   514D DD 77 FD      [19] 2157 	ld	-3 (ix),a
   5150 1A            [ 7] 2158 	ld	a,(de)
   5151 57            [ 4] 2159 	ld	d,a
   5152 DD 7E FD      [19] 2160 	ld	a,-3 (ix)
   5155 92            [ 4] 2161 	sub	a, d
   5156 C2 52 52      [10] 2162 	jp	NZ,00106$
                           2163 ;src/ia.h:55: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5159 DD 5E FC      [19] 2164 	ld	e,-4 (ix)
   515C 16 00         [ 7] 2165 	ld	d,#0x00
   515E 21 03 00      [10] 2166 	ld	hl,#0x0003
   5161 19            [11] 2167 	add	hl,de
   5162 DD 75 F7      [19] 2168 	ld	-9 (ix),l
   5165 DD 74 F8      [19] 2169 	ld	-8 (ix),h
   5168 DD 7E F7      [19] 2170 	ld	a,-9 (ix)
   516B DD 77 FE      [19] 2171 	ld	-2 (ix),a
   516E DD 7E F8      [19] 2172 	ld	a,-8 (ix)
   5171 DD 77 FF      [19] 2173 	ld	-1 (ix),a
   5174 DD 7E F8      [19] 2174 	ld	a,-8 (ix)
   5177 07            [ 4] 2175 	rlca
   5178 E6 01         [ 7] 2176 	and	a,#0x01
   517A DD 77 FC      [19] 2177 	ld	-4 (ix),a
   517D 21 06 00      [10] 2178 	ld	hl,#0x0006
   5180 19            [11] 2179 	add	hl,de
   5181 DD 75 FA      [19] 2180 	ld	-6 (ix),l
   5184 DD 74 FB      [19] 2181 	ld	-5 (ix),h
   5187 DD 7E FC      [19] 2182 	ld	a,-4 (ix)
   518A B7            [ 4] 2183 	or	a, a
   518B 28 0C         [12] 2184 	jr	Z,00113$
   518D DD 7E FA      [19] 2185 	ld	a,-6 (ix)
   5190 DD 77 FE      [19] 2186 	ld	-2 (ix),a
   5193 DD 7E FB      [19] 2187 	ld	a,-5 (ix)
   5196 DD 77 FF      [19] 2188 	ld	-1 (ix),a
   5199                    2189 00113$:
   5199 DD 6E FE      [19] 2190 	ld	l,-2 (ix)
   519C DD 66 FF      [19] 2191 	ld	h,-1 (ix)
   519F CB 2C         [ 8] 2192 	sra	h
   51A1 CB 1D         [ 8] 2193 	rr	l
   51A3 CB 2C         [ 8] 2194 	sra	h
   51A5 CB 1D         [ 8] 2195 	rr	l
   51A7 D1            [10] 2196 	pop	de
   51A8 D5            [11] 2197 	push	de
   51A9 19            [11] 2198 	add	hl,de
   51AA DD 7E FD      [19] 2199 	ld	a,-3 (ix)
   51AD 96            [ 7] 2200 	sub	a,(hl)
   51AE C2 52 52      [10] 2201 	jp	NZ,00106$
                           2202 ;src/ia.h:56: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   51B1 DD 5E F6      [19] 2203 	ld	e,-10 (ix)
   51B4 16 00         [ 7] 2204 	ld	d,#0x00
   51B6 21 0E 00      [10] 2205 	ld	hl,#0x000E
   51B9 19            [11] 2206 	add	hl,de
   51BA 4D            [ 4] 2207 	ld	c,l
   51BB 44            [ 4] 2208 	ld	b,h
   51BC 69            [ 4] 2209 	ld	l, c
   51BD 78            [ 4] 2210 	ld	a,b
   51BE 67            [ 4] 2211 	ld	h,a
   51BF 07            [ 4] 2212 	rlca
   51C0 E6 01         [ 7] 2213 	and	a,#0x01
   51C2 DD 77 FE      [19] 2214 	ld	-2 (ix),a
   51C5 7B            [ 4] 2215 	ld	a,e
   51C6 C6 1D         [ 7] 2216 	add	a, #0x1D
   51C8 DD 77 F4      [19] 2217 	ld	-12 (ix),a
   51CB 7A            [ 4] 2218 	ld	a,d
   51CC CE 00         [ 7] 2219 	adc	a, #0x00
   51CE DD 77 F5      [19] 2220 	ld	-11 (ix),a
   51D1 DD 7E FE      [19] 2221 	ld	a,-2 (ix)
   51D4 B7            [ 4] 2222 	or	a, a
   51D5 28 02         [12] 2223 	jr	Z,00114$
   51D7 E1            [10] 2224 	pop	hl
   51D8 E5            [11] 2225 	push	hl
   51D9                    2226 00114$:
   51D9 CB 2C         [ 8] 2227 	sra	h
   51DB CB 1D         [ 8] 2228 	rr	l
   51DD CB 2C         [ 8] 2229 	sra	h
   51DF CB 1D         [ 8] 2230 	rr	l
   51E1 CB 2C         [ 8] 2231 	sra	h
   51E3 CB 1D         [ 8] 2232 	rr	l
   51E5 CB 2C         [ 8] 2233 	sra	h
   51E7 CB 1D         [ 8] 2234 	rr	l
   51E9 5D            [ 4] 2235 	ld	e, l
   51EA 54            [ 4] 2236 	ld	d, h
   51EB 29            [11] 2237 	add	hl, hl
   51EC 29            [11] 2238 	add	hl, hl
   51ED 19            [11] 2239 	add	hl, de
   51EE 29            [11] 2240 	add	hl, hl
   51EF 29            [11] 2241 	add	hl, hl
   51F0 11 00 6E      [10] 2242 	ld	de,#_scene
   51F3 19            [11] 2243 	add	hl,de
   51F4 DD 5E F9      [19] 2244 	ld	e,-7 (ix)
   51F7 16 00         [ 7] 2245 	ld	d,#0x00
   51F9 19            [11] 2246 	add	hl,de
   51FA DD 7E FD      [19] 2247 	ld	a,-3 (ix)
   51FD 96            [ 7] 2248 	sub	a,(hl)
   51FE 20 52         [12] 2249 	jr	NZ,00106$
                           2250 ;src/ia.h:57: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5200 DD 7E FE      [19] 2251 	ld	a,-2 (ix)
   5203 B7            [ 4] 2252 	or	a, a
   5204 28 02         [12] 2253 	jr	Z,00115$
   5206 C1            [10] 2254 	pop	bc
   5207 C5            [11] 2255 	push	bc
   5208                    2256 00115$:
   5208 CB 28         [ 8] 2257 	sra	b
   520A CB 19         [ 8] 2258 	rr	c
   520C CB 28         [ 8] 2259 	sra	b
   520E CB 19         [ 8] 2260 	rr	c
   5210 CB 28         [ 8] 2261 	sra	b
   5212 CB 19         [ 8] 2262 	rr	c
   5214 CB 28         [ 8] 2263 	sra	b
   5216 CB 19         [ 8] 2264 	rr	c
   5218 69            [ 4] 2265 	ld	l, c
   5219 60            [ 4] 2266 	ld	h, b
   521A 29            [11] 2267 	add	hl, hl
   521B 29            [11] 2268 	add	hl, hl
   521C 09            [11] 2269 	add	hl, bc
   521D 29            [11] 2270 	add	hl, hl
   521E 29            [11] 2271 	add	hl, hl
   521F 3E 00         [ 7] 2272 	ld	a,#<(_scene)
   5221 85            [ 4] 2273 	add	a, l
   5222 DD 77 FE      [19] 2274 	ld	-2 (ix),a
   5225 3E 6E         [ 7] 2275 	ld	a,#>(_scene)
   5227 8C            [ 4] 2276 	adc	a, h
   5228 DD 77 FF      [19] 2277 	ld	-1 (ix),a
   522B DD 5E F7      [19] 2278 	ld	e,-9 (ix)
   522E DD 56 F8      [19] 2279 	ld	d,-8 (ix)
   5231 DD 7E FC      [19] 2280 	ld	a,-4 (ix)
   5234 B7            [ 4] 2281 	or	a, a
   5235 28 06         [12] 2282 	jr	Z,00116$
   5237 DD 5E FA      [19] 2283 	ld	e,-6 (ix)
   523A DD 56 FB      [19] 2284 	ld	d,-5 (ix)
   523D                    2285 00116$:
   523D CB 2A         [ 8] 2286 	sra	d
   523F CB 1B         [ 8] 2287 	rr	e
   5241 CB 2A         [ 8] 2288 	sra	d
   5243 CB 1B         [ 8] 2289 	rr	e
   5245 DD 6E FE      [19] 2290 	ld	l,-2 (ix)
   5248 DD 66 FF      [19] 2291 	ld	h,-1 (ix)
   524B 19            [11] 2292 	add	hl,de
   524C DD 7E FD      [19] 2293 	ld	a,-3 (ix)
   524F 96            [ 7] 2294 	sub	a,(hl)
   5250 28 3B         [12] 2295 	jr	Z,00111$
   5252                    2296 00106$:
                           2297 ;src/ia.h:59: switch(enemy.dir){
   5252 3A 22 6F      [13] 2298 	ld	a,(#(_enemy + 0x0009) + 0)
   5255 FE 02         [ 7] 2299 	cp	a,#0x02
   5257 28 22         [12] 2300 	jr	Z,00103$
   5259 FE 04         [ 7] 2301 	cp	a,#0x04
   525B 28 0A         [12] 2302 	jr	Z,00101$
   525D FE 06         [ 7] 2303 	cp	a,#0x06
   525F 28 10         [12] 2304 	jr	Z,00102$
   5261 D6 08         [ 7] 2305 	sub	a, #0x08
   5263 28 20         [12] 2306 	jr	Z,00104$
   5265 18 26         [12] 2307 	jr	00111$
                           2308 ;src/ia.h:60: case 4: movement(6); break;
   5267                    2309 00101$:
   5267 3E 06         [ 7] 2310 	ld	a,#0x06
   5269 F5            [11] 2311 	push	af
   526A 33            [ 6] 2312 	inc	sp
   526B CD B8 50      [17] 2313 	call	_movement
   526E 33            [ 6] 2314 	inc	sp
   526F 18 1C         [12] 2315 	jr	00111$
                           2316 ;src/ia.h:61: case 6: movement(4); break;
   5271                    2317 00102$:
   5271 3E 04         [ 7] 2318 	ld	a,#0x04
   5273 F5            [11] 2319 	push	af
   5274 33            [ 6] 2320 	inc	sp
   5275 CD B8 50      [17] 2321 	call	_movement
   5278 33            [ 6] 2322 	inc	sp
   5279 18 12         [12] 2323 	jr	00111$
                           2324 ;src/ia.h:62: case 2: movement(8); break;
   527B                    2325 00103$:
   527B 3E 08         [ 7] 2326 	ld	a,#0x08
   527D F5            [11] 2327 	push	af
   527E 33            [ 6] 2328 	inc	sp
   527F CD B8 50      [17] 2329 	call	_movement
   5282 33            [ 6] 2330 	inc	sp
   5283 18 08         [12] 2331 	jr	00111$
                           2332 ;src/ia.h:63: case 8: movement(2); break;
   5285                    2333 00104$:
   5285 3E 02         [ 7] 2334 	ld	a,#0x02
   5287 F5            [11] 2335 	push	af
   5288 33            [ 6] 2336 	inc	sp
   5289 CD B8 50      [17] 2337 	call	_movement
   528C 33            [ 6] 2338 	inc	sp
                           2339 ;src/ia.h:64: }
   528D                    2340 00111$:
   528D DD F9         [10] 2341 	ld	sp, ix
   528F DD E1         [14] 2342 	pop	ix
   5291 C9            [10] 2343 	ret
                           2344 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           2345 ;	---------------------------------
                           2346 ; Function checkCollisions
                           2347 ; ---------------------------------
   5292                    2348 _checkCollisions::
   5292 DD E5         [15] 2349 	push	ix
   5294 DD 21 00 00   [14] 2350 	ld	ix,#0
   5298 DD 39         [15] 2351 	add	ix,sp
   529A 21 FA FF      [10] 2352 	ld	hl,#-6
   529D 39            [11] 2353 	add	hl,sp
   529E F9            [ 6] 2354 	ld	sp,hl
                           2355 ;src/CalcColision.h:14: switch(atk){
   529F DD 7E 08      [19] 2356 	ld	a,8 (ix)
   52A2 D6 15         [ 7] 2357 	sub	a, #0x15
   52A4 28 09         [12] 2358 	jr	Z,00101$
   52A6 DD 7E 08      [19] 2359 	ld	a,8 (ix)
   52A9 D6 16         [ 7] 2360 	sub	a, #0x16
   52AB 28 08         [12] 2361 	jr	Z,00102$
   52AD 18 0C         [12] 2362 	jr	00103$
                           2363 ;src/CalcColision.h:15: case 21:
   52AF                    2364 00101$:
                           2365 ;src/CalcColision.h:16: auxX = 2;
   52AF 1E 02         [ 7] 2366 	ld	e,#0x02
                           2367 ;src/CalcColision.h:17: auxY = 8;
   52B1 0E 08         [ 7] 2368 	ld	c,#0x08
                           2369 ;src/CalcColision.h:18: break;
   52B3 18 0A         [12] 2370 	jr	00104$
                           2371 ;src/CalcColision.h:19: case 22:
   52B5                    2372 00102$:
                           2373 ;src/CalcColision.h:20: auxX = 4;
   52B5 1E 04         [ 7] 2374 	ld	e,#0x04
                           2375 ;src/CalcColision.h:21: auxY = 4;
   52B7 0E 04         [ 7] 2376 	ld	c,#0x04
                           2377 ;src/CalcColision.h:22: break;
   52B9 18 04         [12] 2378 	jr	00104$
                           2379 ;src/CalcColision.h:23: default:
   52BB                    2380 00103$:
                           2381 ;src/CalcColision.h:24: auxX = tilewidth;
   52BB 1E 04         [ 7] 2382 	ld	e,#0x04
                           2383 ;src/CalcColision.h:25: auxY = tileheight;
   52BD 0E 10         [ 7] 2384 	ld	c,#0x10
                           2385 ;src/CalcColision.h:26: }
   52BF                    2386 00104$:
                           2387 ;src/CalcColision.h:27: popX = pX + auxX;
   52BF DD 7E 04      [19] 2388 	ld	a,4 (ix)
   52C2 83            [ 4] 2389 	add	a, e
   52C3 6F            [ 4] 2390 	ld	l,a
                           2391 ;src/CalcColision.h:28: popY = pY + auxY;
   52C4 DD 7E 05      [19] 2392 	ld	a,5 (ix)
   52C7 81            [ 4] 2393 	add	a, c
   52C8 DD 77 FA      [19] 2394 	ld	-6 (ix),a
                           2395 ;src/CalcColision.h:29: eopX = eX + auxX;
   52CB DD 7E 06      [19] 2396 	ld	a,6 (ix)
   52CE 83            [ 4] 2397 	add	a, e
   52CF 5F            [ 4] 2398 	ld	e,a
                           2399 ;src/CalcColision.h:30: eopY = eY + auxY;
   52D0 DD 7E 07      [19] 2400 	ld	a,7 (ix)
   52D3 81            [ 4] 2401 	add	a, c
   52D4 DD 77 FB      [19] 2402 	ld	-5 (ix),a
                           2403 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   52D7 7B            [ 4] 2404 	ld	a,e
   52D8 DD 96 04      [19] 2405 	sub	a, 4 (ix)
   52DB 3E 00         [ 7] 2406 	ld	a,#0x00
   52DD 17            [ 4] 2407 	rla
   52DE DD 77 FC      [19] 2408 	ld	-4 (ix),a
   52E1 7D            [ 4] 2409 	ld	a,l
   52E2 93            [ 4] 2410 	sub	a, e
   52E3 3E 00         [ 7] 2411 	ld	a,#0x00
   52E5 17            [ 4] 2412 	rla
   52E6 DD 77 FD      [19] 2413 	ld	-3 (ix),a
   52E9 DD 7E 07      [19] 2414 	ld	a,7 (ix)
   52EC DD 96 05      [19] 2415 	sub	a, 5 (ix)
   52EF 3E 00         [ 7] 2416 	ld	a,#0x00
   52F1 17            [ 4] 2417 	rla
   52F2 5F            [ 4] 2418 	ld	e,a
   52F3 DD 7E FA      [19] 2419 	ld	a,-6 (ix)
   52F6 DD 96 07      [19] 2420 	sub	a, 7 (ix)
   52F9 3E 00         [ 7] 2421 	ld	a,#0x00
   52FB 17            [ 4] 2422 	rla
   52FC 4F            [ 4] 2423 	ld	c,a
                           2424 ;src/CalcColision.h:33: if(atk >= 21)
   52FD DD 7E 08      [19] 2425 	ld	a,8 (ix)
   5300 D6 15         [ 7] 2426 	sub	a, #0x15
   5302 3E 00         [ 7] 2427 	ld	a,#0x00
   5304 17            [ 4] 2428 	rla
   5305 DD 77 FF      [19] 2429 	ld	-1 (ix),a
                           2430 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   5308 DD 7E FC      [19] 2431 	ld	a,-4 (ix)
   530B B7            [ 4] 2432 	or	a, a
   530C 20 1C         [12] 2433 	jr	NZ,00109$
   530E DD 7E FD      [19] 2434 	ld	a,-3 (ix)
   5311 B7            [ 4] 2435 	or	a,a
   5312 20 16         [12] 2436 	jr	NZ,00109$
   5314 B3            [ 4] 2437 	or	a,e
   5315 20 13         [12] 2438 	jr	NZ,00109$
   5317 B1            [ 4] 2439 	or	a,c
   5318 20 10         [12] 2440 	jr	NZ,00109$
                           2441 ;src/CalcColision.h:33: if(atk >= 21)
   531A DD 7E FF      [19] 2442 	ld	a,-1 (ix)
   531D B7            [ 4] 2443 	or	a, a
   531E 20 05         [12] 2444 	jr	NZ,00106$
                           2445 ;src/CalcColision.h:34: return 1;
   5320 2E 01         [ 7] 2446 	ld	l,#0x01
   5322 C3 AE 53      [10] 2447 	jp	00137$
   5325                    2448 00106$:
                           2449 ;src/CalcColision.h:36: return 2;
   5325 2E 02         [ 7] 2450 	ld	l,#0x02
   5327 C3 AE 53      [10] 2451 	jp	00137$
   532A                    2452 00109$:
                           2453 ;src/CalcColision.h:38: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   532A DD 7E 06      [19] 2454 	ld	a,6 (ix)
   532D DD 96 04      [19] 2455 	sub	a, 4 (ix)
   5330 3E 00         [ 7] 2456 	ld	a,#0x00
   5332 17            [ 4] 2457 	rla
   5333 DD 77 FE      [19] 2458 	ld	-2 (ix),a
   5336 7D            [ 4] 2459 	ld	a,l
   5337 DD 96 06      [19] 2460 	sub	a, 6 (ix)
   533A 3E 00         [ 7] 2461 	ld	a,#0x00
   533C 17            [ 4] 2462 	rla
   533D 6F            [ 4] 2463 	ld	l,a
   533E DD 7E FE      [19] 2464 	ld	a,-2 (ix)
   5341 B7            [ 4] 2465 	or	a,a
   5342 20 17         [12] 2466 	jr	NZ,00117$
   5344 B5            [ 4] 2467 	or	a,l
   5345 20 14         [12] 2468 	jr	NZ,00117$
   5347 B3            [ 4] 2469 	or	a,e
   5348 20 11         [12] 2470 	jr	NZ,00117$
   534A B1            [ 4] 2471 	or	a,c
   534B 20 0E         [12] 2472 	jr	NZ,00117$
                           2473 ;src/CalcColision.h:39: if(atk >= 21)
   534D DD 7E FF      [19] 2474 	ld	a,-1 (ix)
   5350 B7            [ 4] 2475 	or	a, a
   5351 20 04         [12] 2476 	jr	NZ,00114$
                           2477 ;src/CalcColision.h:40: return 1;
   5353 2E 01         [ 7] 2478 	ld	l,#0x01
   5355 18 57         [12] 2479 	jr	00137$
   5357                    2480 00114$:
                           2481 ;src/CalcColision.h:42: return 2;
   5357 2E 02         [ 7] 2482 	ld	l,#0x02
   5359 18 53         [12] 2483 	jr	00137$
   535B                    2484 00117$:
                           2485 ;src/CalcColision.h:44: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   535B DD 7E FB      [19] 2486 	ld	a,-5 (ix)
   535E DD 96 05      [19] 2487 	sub	a, 5 (ix)
   5361 3E 00         [ 7] 2488 	ld	a,#0x00
   5363 17            [ 4] 2489 	rla
   5364 5F            [ 4] 2490 	ld	e,a
   5365 DD 7E FA      [19] 2491 	ld	a,-6 (ix)
   5368 DD 96 FB      [19] 2492 	sub	a, -5 (ix)
   536B 3E 00         [ 7] 2493 	ld	a,#0x00
   536D 17            [ 4] 2494 	rla
   536E 67            [ 4] 2495 	ld	h,a
   536F DD 7E FE      [19] 2496 	ld	a,-2 (ix)
   5372 B7            [ 4] 2497 	or	a,a
   5373 20 17         [12] 2498 	jr	NZ,00125$
   5375 B5            [ 4] 2499 	or	a,l
   5376 20 14         [12] 2500 	jr	NZ,00125$
   5378 B3            [ 4] 2501 	or	a,e
   5379 20 11         [12] 2502 	jr	NZ,00125$
   537B B4            [ 4] 2503 	or	a,h
   537C 20 0E         [12] 2504 	jr	NZ,00125$
                           2505 ;src/CalcColision.h:45: if(atk >= 21)
   537E DD 7E FF      [19] 2506 	ld	a,-1 (ix)
   5381 B7            [ 4] 2507 	or	a, a
   5382 20 04         [12] 2508 	jr	NZ,00122$
                           2509 ;src/CalcColision.h:46: return 1;
   5384 2E 01         [ 7] 2510 	ld	l,#0x01
   5386 18 26         [12] 2511 	jr	00137$
   5388                    2512 00122$:
                           2513 ;src/CalcColision.h:48: return 2;
   5388 2E 02         [ 7] 2514 	ld	l,#0x02
   538A 18 22         [12] 2515 	jr	00137$
   538C                    2516 00125$:
                           2517 ;src/CalcColision.h:50: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   538C DD 7E FC      [19] 2518 	ld	a,-4 (ix)
   538F B7            [ 4] 2519 	or	a, a
   5390 20 1A         [12] 2520 	jr	NZ,00133$
   5392 DD 7E FD      [19] 2521 	ld	a,-3 (ix)
   5395 B7            [ 4] 2522 	or	a,a
   5396 20 14         [12] 2523 	jr	NZ,00133$
   5398 B3            [ 4] 2524 	or	a,e
   5399 20 11         [12] 2525 	jr	NZ,00133$
   539B B4            [ 4] 2526 	or	a,h
   539C 20 0E         [12] 2527 	jr	NZ,00133$
                           2528 ;src/CalcColision.h:51: if(atk >= 21)
   539E DD 7E FF      [19] 2529 	ld	a,-1 (ix)
   53A1 B7            [ 4] 2530 	or	a, a
   53A2 20 04         [12] 2531 	jr	NZ,00130$
                           2532 ;src/CalcColision.h:52: return 1;
   53A4 2E 01         [ 7] 2533 	ld	l,#0x01
   53A6 18 06         [12] 2534 	jr	00137$
   53A8                    2535 00130$:
                           2536 ;src/CalcColision.h:54: return 2;
   53A8 2E 02         [ 7] 2537 	ld	l,#0x02
   53AA 18 02         [12] 2538 	jr	00137$
   53AC                    2539 00133$:
                           2540 ;src/CalcColision.h:56: return 0;
   53AC 2E 00         [ 7] 2541 	ld	l,#0x00
   53AE                    2542 00137$:
   53AE DD F9         [10] 2543 	ld	sp, ix
   53B0 DD E1         [14] 2544 	pop	ix
   53B2 C9            [10] 2545 	ret
                           2546 ;src/CalcColision.h:59: u8 checkArrowCollisions(){
                           2547 ;	---------------------------------
                           2548 ; Function checkArrowCollisions
                           2549 ; ---------------------------------
   53B3                    2550 _checkArrowCollisions::
   53B3 DD E5         [15] 2551 	push	ix
   53B5 DD 21 00 00   [14] 2552 	ld	ix,#0
   53B9 DD 39         [15] 2553 	add	ix,sp
   53BB 21 F4 FF      [10] 2554 	ld	hl,#-12
   53BE 39            [11] 2555 	add	hl,sp
   53BF F9            [ 6] 2556 	ld	sp,hl
                           2557 ;src/CalcColision.h:82: u8 bound =0;
   53C0 DD 36 F4 00   [19] 2558 	ld	-12 (ix),#0x00
                           2559 ;src/CalcColision.h:83: if(    scene[(parrow.y)/tileheight][(parrow.x)/tilewidth] == 1
   53C4 3A FB 6E      [13] 2560 	ld	a,(#(_parrow + 0x0001) + 0)
   53C7 DD 77 FB      [19] 2561 	ld	-5 (ix), a
   53CA 07            [ 4] 2562 	rlca
   53CB 07            [ 4] 2563 	rlca
   53CC 07            [ 4] 2564 	rlca
   53CD 07            [ 4] 2565 	rlca
   53CE E6 0F         [ 7] 2566 	and	a,#0x0F
   53D0 4F            [ 4] 2567 	ld	c,a
   53D1 06 00         [ 7] 2568 	ld	b,#0x00
   53D3 69            [ 4] 2569 	ld	l, c
   53D4 60            [ 4] 2570 	ld	h, b
   53D5 29            [11] 2571 	add	hl, hl
   53D6 29            [11] 2572 	add	hl, hl
   53D7 09            [11] 2573 	add	hl, bc
   53D8 29            [11] 2574 	add	hl, hl
   53D9 29            [11] 2575 	add	hl, hl
   53DA 3E 00         [ 7] 2576 	ld	a,#<(_scene)
   53DC 85            [ 4] 2577 	add	a, l
   53DD DD 77 FC      [19] 2578 	ld	-4 (ix),a
   53E0 3E 6E         [ 7] 2579 	ld	a,#>(_scene)
   53E2 8C            [ 4] 2580 	adc	a, h
   53E3 DD 77 FD      [19] 2581 	ld	-3 (ix),a
   53E6 21 FA 6E      [10] 2582 	ld	hl, #_parrow + 0
   53E9 4E            [ 7] 2583 	ld	c,(hl)
   53EA 79            [ 4] 2584 	ld	a,c
   53EB 0F            [ 4] 2585 	rrca
   53EC 0F            [ 4] 2586 	rrca
   53ED E6 3F         [ 7] 2587 	and	a,#0x3F
   53EF DD 77 FA      [19] 2588 	ld	-6 (ix),a
   53F2 DD 7E FC      [19] 2589 	ld	a,-4 (ix)
   53F5 DD 86 FA      [19] 2590 	add	a, -6 (ix)
   53F8 6F            [ 4] 2591 	ld	l,a
   53F9 DD 7E FD      [19] 2592 	ld	a,-3 (ix)
   53FC CE 00         [ 7] 2593 	adc	a, #0x00
   53FE 67            [ 4] 2594 	ld	h,a
   53FF 7E            [ 7] 2595 	ld	a,(hl)
   5400 3D            [ 4] 2596 	dec	a
   5401 CA FE 54      [10] 2597 	jp	Z,00101$
                           2598 ;src/CalcColision.h:84: || scene[(parrow.y)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
   5404 06 00         [ 7] 2599 	ld	b,#0x00
   5406 21 03 00      [10] 2600 	ld	hl,#0x0003
   5409 09            [11] 2601 	add	hl,bc
   540A DD 75 F6      [19] 2602 	ld	-10 (ix),l
   540D DD 74 F7      [19] 2603 	ld	-9 (ix),h
   5410 DD 7E F6      [19] 2604 	ld	a,-10 (ix)
   5413 DD 77 FE      [19] 2605 	ld	-2 (ix),a
   5416 DD 7E F7      [19] 2606 	ld	a,-9 (ix)
   5419 DD 77 FF      [19] 2607 	ld	-1 (ix),a
   541C DD 7E F7      [19] 2608 	ld	a,-9 (ix)
   541F 07            [ 4] 2609 	rlca
   5420 E6 01         [ 7] 2610 	and	a,#0x01
   5422 DD 77 F5      [19] 2611 	ld	-11 (ix),a
   5425 21 06 00      [10] 2612 	ld	hl,#0x0006
   5428 09            [11] 2613 	add	hl,bc
   5429 DD 75 F8      [19] 2614 	ld	-8 (ix),l
   542C DD 74 F9      [19] 2615 	ld	-7 (ix),h
   542F DD 7E F5      [19] 2616 	ld	a,-11 (ix)
   5432 B7            [ 4] 2617 	or	a, a
   5433 28 0C         [12] 2618 	jr	Z,00108$
   5435 DD 7E F8      [19] 2619 	ld	a,-8 (ix)
   5438 DD 77 FE      [19] 2620 	ld	-2 (ix),a
   543B DD 7E F9      [19] 2621 	ld	a,-7 (ix)
   543E DD 77 FF      [19] 2622 	ld	-1 (ix),a
   5441                    2623 00108$:
   5441 DD 6E FE      [19] 2624 	ld	l,-2 (ix)
   5444 DD 66 FF      [19] 2625 	ld	h,-1 (ix)
   5447 CB 2C         [ 8] 2626 	sra	h
   5449 CB 1D         [ 8] 2627 	rr	l
   544B CB 2C         [ 8] 2628 	sra	h
   544D CB 1D         [ 8] 2629 	rr	l
   544F DD 5E FC      [19] 2630 	ld	e,-4 (ix)
   5452 DD 56 FD      [19] 2631 	ld	d,-3 (ix)
   5455 19            [11] 2632 	add	hl,de
   5456 7E            [ 7] 2633 	ld	a,(hl)
   5457 3D            [ 4] 2634 	dec	a
   5458 CA FE 54      [10] 2635 	jp	Z,00101$
                           2636 ;src/CalcColision.h:85: || scene[(parrow.y+tileheight-2)/tileheight][(parrow.x)/tilewidth] == 1
   545B DD 5E FB      [19] 2637 	ld	e,-5 (ix)
   545E 16 00         [ 7] 2638 	ld	d,#0x00
   5460 21 0E 00      [10] 2639 	ld	hl,#0x000E
   5463 19            [11] 2640 	add	hl,de
   5464 4D            [ 4] 2641 	ld	c,l
   5465 44            [ 4] 2642 	ld	b,h
   5466 69            [ 4] 2643 	ld	l, c
   5467 78            [ 4] 2644 	ld	a,b
   5468 67            [ 4] 2645 	ld	h,a
   5469 07            [ 4] 2646 	rlca
   546A E6 01         [ 7] 2647 	and	a,#0x01
   546C DD 77 FE      [19] 2648 	ld	-2 (ix),a
   546F 7B            [ 4] 2649 	ld	a,e
   5470 C6 1D         [ 7] 2650 	add	a, #0x1D
   5472 DD 77 FC      [19] 2651 	ld	-4 (ix),a
   5475 7A            [ 4] 2652 	ld	a,d
   5476 CE 00         [ 7] 2653 	adc	a, #0x00
   5478 DD 77 FD      [19] 2654 	ld	-3 (ix),a
   547B DD 7E FE      [19] 2655 	ld	a,-2 (ix)
   547E B7            [ 4] 2656 	or	a, a
   547F 28 06         [12] 2657 	jr	Z,00109$
   5481 DD 6E FC      [19] 2658 	ld	l,-4 (ix)
   5484 DD 66 FD      [19] 2659 	ld	h,-3 (ix)
   5487                    2660 00109$:
   5487 CB 2C         [ 8] 2661 	sra	h
   5489 CB 1D         [ 8] 2662 	rr	l
   548B CB 2C         [ 8] 2663 	sra	h
   548D CB 1D         [ 8] 2664 	rr	l
   548F CB 2C         [ 8] 2665 	sra	h
   5491 CB 1D         [ 8] 2666 	rr	l
   5493 CB 2C         [ 8] 2667 	sra	h
   5495 CB 1D         [ 8] 2668 	rr	l
   5497 5D            [ 4] 2669 	ld	e, l
   5498 54            [ 4] 2670 	ld	d, h
   5499 29            [11] 2671 	add	hl, hl
   549A 29            [11] 2672 	add	hl, hl
   549B 19            [11] 2673 	add	hl, de
   549C 29            [11] 2674 	add	hl, hl
   549D 29            [11] 2675 	add	hl, hl
   549E 11 00 6E      [10] 2676 	ld	de,#_scene
   54A1 19            [11] 2677 	add	hl,de
   54A2 DD 5E FA      [19] 2678 	ld	e,-6 (ix)
   54A5 16 00         [ 7] 2679 	ld	d,#0x00
   54A7 19            [11] 2680 	add	hl,de
   54A8 7E            [ 7] 2681 	ld	a,(hl)
   54A9 3D            [ 4] 2682 	dec	a
   54AA 28 52         [12] 2683 	jr	Z,00101$
                           2684 ;src/CalcColision.h:86: || scene[(parrow.y+tileheight-2)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
   54AC DD 7E FE      [19] 2685 	ld	a,-2 (ix)
   54AF B7            [ 4] 2686 	or	a, a
   54B0 28 06         [12] 2687 	jr	Z,00110$
   54B2 DD 4E FC      [19] 2688 	ld	c,-4 (ix)
   54B5 DD 46 FD      [19] 2689 	ld	b,-3 (ix)
   54B8                    2690 00110$:
   54B8 CB 28         [ 8] 2691 	sra	b
   54BA CB 19         [ 8] 2692 	rr	c
   54BC CB 28         [ 8] 2693 	sra	b
   54BE CB 19         [ 8] 2694 	rr	c
   54C0 CB 28         [ 8] 2695 	sra	b
   54C2 CB 19         [ 8] 2696 	rr	c
   54C4 CB 28         [ 8] 2697 	sra	b
   54C6 CB 19         [ 8] 2698 	rr	c
   54C8 69            [ 4] 2699 	ld	l, c
   54C9 60            [ 4] 2700 	ld	h, b
   54CA 29            [11] 2701 	add	hl, hl
   54CB 29            [11] 2702 	add	hl, hl
   54CC 09            [11] 2703 	add	hl, bc
   54CD 29            [11] 2704 	add	hl, hl
   54CE 29            [11] 2705 	add	hl, hl
   54CF 3E 00         [ 7] 2706 	ld	a,#<(_scene)
   54D1 85            [ 4] 2707 	add	a, l
   54D2 DD 77 FE      [19] 2708 	ld	-2 (ix),a
   54D5 3E 6E         [ 7] 2709 	ld	a,#>(_scene)
   54D7 8C            [ 4] 2710 	adc	a, h
   54D8 DD 77 FF      [19] 2711 	ld	-1 (ix),a
   54DB C1            [10] 2712 	pop	bc
   54DC E1            [10] 2713 	pop	hl
   54DD E5            [11] 2714 	push	hl
   54DE C5            [11] 2715 	push	bc
   54DF DD 7E F5      [19] 2716 	ld	a,-11 (ix)
   54E2 B7            [ 4] 2717 	or	a, a
   54E3 28 06         [12] 2718 	jr	Z,00111$
   54E5 DD 6E F8      [19] 2719 	ld	l,-8 (ix)
   54E8 DD 66 F9      [19] 2720 	ld	h,-7 (ix)
   54EB                    2721 00111$:
   54EB CB 2C         [ 8] 2722 	sra	h
   54ED CB 1D         [ 8] 2723 	rr	l
   54EF CB 2C         [ 8] 2724 	sra	h
   54F1 CB 1D         [ 8] 2725 	rr	l
   54F3 DD 5E FE      [19] 2726 	ld	e,-2 (ix)
   54F6 DD 56 FF      [19] 2727 	ld	d,-1 (ix)
   54F9 19            [11] 2728 	add	hl,de
   54FA 7E            [ 7] 2729 	ld	a,(hl)
   54FB 3D            [ 4] 2730 	dec	a
   54FC 20 10         [12] 2731 	jr	NZ,00102$
   54FE                    2732 00101$:
                           2733 ;src/CalcColision.h:88: parrow.x=parrow.lx;
   54FE 3A FC 6E      [13] 2734 	ld	a, (#_parrow + 2)
   5501 32 FA 6E      [13] 2735 	ld	(#_parrow),a
                           2736 ;src/CalcColision.h:89: parrow.y=parrow.ly;
   5504 3A FD 6E      [13] 2737 	ld	a, (#_parrow + 3)
   5507 32 FB 6E      [13] 2738 	ld	(#(_parrow + 0x0001)),a
                           2739 ;src/CalcColision.h:90: bound = 1;
   550A DD 36 F4 01   [19] 2740 	ld	-12 (ix),#0x01
   550E                    2741 00102$:
                           2742 ;src/CalcColision.h:93: return bound;
   550E DD 6E F4      [19] 2743 	ld	l,-12 (ix)
   5511 DD F9         [10] 2744 	ld	sp, ix
   5513 DD E1         [14] 2745 	pop	ix
   5515 C9            [10] 2746 	ret
                           2747 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2748 ;	---------------------------------
                           2749 ; Function checkKeyboard
                           2750 ; ---------------------------------
   5516                    2751 _checkKeyboard::
   5516 DD E5         [15] 2752 	push	ix
   5518 DD 21 00 00   [14] 2753 	ld	ix,#0
   551C DD 39         [15] 2754 	add	ix,sp
   551E 21 FA FF      [10] 2755 	ld	hl,#-6
   5521 39            [11] 2756 	add	hl,sp
   5522 F9            [ 6] 2757 	ld	sp,hl
                           2758 ;src/keyboard.h:14: u8 *s = NULL;
   5523 DD 36 FE 00   [19] 2759 	ld	-2 (ix),#0x00
   5527 DD 36 FF 00   [19] 2760 	ld	-1 (ix),#0x00
                           2761 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   552B 21 05 80      [10] 2762 	ld	hl,#0x8005
   552E CD 3C 69      [17] 2763 	call	_cpct_isKeyPressed
   5531 7D            [ 4] 2764 	ld	a,l
   5532 B7            [ 4] 2765 	or	a, a
   5533 28 68         [12] 2766 	jr	Z,00147$
   5535 21 16 6F      [10] 2767 	ld	hl, #(_player + 0x0008) + 0
   5538 7E            [ 7] 2768 	ld	a,(hl)
   5539 DD 77 FD      [19] 2769 	ld	-3 (ix), a
   553C D6 14         [ 7] 2770 	sub	a, #0x14
   553E 38 5D         [12] 2771 	jr	C,00147$
                           2772 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   5540 DD 7E FD      [19] 2773 	ld	a,-3 (ix)
   5543 D6 32         [ 7] 2774 	sub	a, #0x32
   5545 38 07         [12] 2775 	jr	C,00102$
   5547 21 16 6F      [10] 2776 	ld	hl,#(_player + 0x0008)
   554A 36 00         [10] 2777 	ld	(hl),#0x00
   554C 18 08         [12] 2778 	jr	00103$
   554E                    2779 00102$:
                           2780 ;src/keyboard.h:17: else player.atk += 1;
   554E DD 7E FD      [19] 2781 	ld	a,-3 (ix)
   5551 3C            [ 4] 2782 	inc	a
   5552 21 16 6F      [10] 2783 	ld	hl,#(_player + 0x0008)
   5555 77            [ 7] 2784 	ld	(hl),a
   5556                    2785 00103$:
                           2786 ;src/keyboard.h:18: switch(player.dir){
   5556 21 15 6F      [10] 2787 	ld	hl, #_player + 7
   5559 66            [ 7] 2788 	ld	h,(hl)
   555A 7C            [ 4] 2789 	ld	a,h
   555B D6 02         [ 7] 2790 	sub	a, #0x02
   555D 28 33         [12] 2791 	jr	Z,00107$
   555F 7C            [ 4] 2792 	ld	a,h
   5560 D6 04         [ 7] 2793 	sub	a, #0x04
   5562 28 0D         [12] 2794 	jr	Z,00104$
   5564 7C            [ 4] 2795 	ld	a,h
   5565 D6 06         [ 7] 2796 	sub	a, #0x06
   5567 28 13         [12] 2797 	jr	Z,00105$
   5569 7C            [ 4] 2798 	ld	a,h
   556A D6 08         [ 7] 2799 	sub	a, #0x08
   556C 28 19         [12] 2800 	jr	Z,00106$
   556E C3 64 57      [10] 2801 	jp	00148$
                           2802 ;src/keyboard.h:19: case 4:
   5571                    2803 00104$:
                           2804 ;src/keyboard.h:20: s = gladis_atk_izda;
   5571 DD 36 FE 80   [19] 2805 	ld	-2 (ix),#<(_gladis_atk_izda)
   5575 DD 36 FF 41   [19] 2806 	ld	-1 (ix),#>(_gladis_atk_izda)
                           2807 ;src/keyboard.h:21: break;
   5579 C3 64 57      [10] 2808 	jp	00148$
                           2809 ;src/keyboard.h:22: case 6:
   557C                    2810 00105$:
                           2811 ;src/keyboard.h:23: s = gladis_atk_dcha;
   557C DD 36 FE 00   [19] 2812 	ld	-2 (ix),#<(_gladis_atk_dcha)
   5580 DD 36 FF 41   [19] 2813 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           2814 ;src/keyboard.h:24: break;
   5584 C3 64 57      [10] 2815 	jp	00148$
                           2816 ;src/keyboard.h:25: case 8:
   5587                    2817 00106$:
                           2818 ;src/keyboard.h:26: s = gladis_atk_arriba;
   5587 DD 36 FE 80   [19] 2819 	ld	-2 (ix),#<(_gladis_atk_arriba)
   558B DD 36 FF 43   [19] 2820 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           2821 ;src/keyboard.h:27: break;
   558F C3 64 57      [10] 2822 	jp	00148$
                           2823 ;src/keyboard.h:28: case 2:
   5592                    2824 00107$:
                           2825 ;src/keyboard.h:29: s = gladis_atk_abajo;
   5592 DD 36 FE 00   [19] 2826 	ld	-2 (ix),#<(_gladis_atk_abajo)
   5596 DD 36 FF 43   [19] 2827 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           2828 ;src/keyboard.h:31: }
   559A C3 64 57      [10] 2829 	jp	00148$
   559D                    2830 00147$:
                           2831 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   559D 21 16 6F      [10] 2832 	ld	hl, #(_player + 0x0008) + 0
   55A0 56            [ 7] 2833 	ld	d,(hl)
   55A1 7A            [ 4] 2834 	ld	a,d
   55A2 D6 14         [ 7] 2835 	sub	a, #0x14
   55A4 30 07         [12] 2836 	jr	NC,00110$
   55A6 14            [ 4] 2837 	inc	d
   55A7 21 16 6F      [10] 2838 	ld	hl,#(_player + 0x0008)
   55AA 72            [ 7] 2839 	ld	(hl),d
   55AB 18 05         [12] 2840 	jr	00111$
   55AD                    2841 00110$:
                           2842 ;src/keyboard.h:34: else player.atk = 20;
   55AD 21 16 6F      [10] 2843 	ld	hl,#(_player + 0x0008)
   55B0 36 14         [10] 2844 	ld	(hl),#0x14
   55B2                    2845 00111$:
                           2846 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   55B2 21 00 02      [10] 2847 	ld	hl,#0x0200
   55B5 CD 3C 69      [17] 2848 	call	_cpct_isKeyPressed
                           2849 ;src/keyboard.h:37: player.dir = 6;
                           2850 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   55B8 7D            [ 4] 2851 	ld	a,l
   55B9 B7            [ 4] 2852 	or	a, a
   55BA 28 1E         [12] 2853 	jr	Z,00143$
   55BC 21 0E 6F      [10] 2854 	ld	hl, #_player + 0
   55BF 56            [ 7] 2855 	ld	d,(hl)
   55C0 7A            [ 4] 2856 	ld	a,d
   55C1 D6 4C         [ 7] 2857 	sub	a, #0x4C
   55C3 30 15         [12] 2858 	jr	NC,00143$
                           2859 ;src/keyboard.h:36: player.x += 1;
   55C5 14            [ 4] 2860 	inc	d
   55C6 21 0E 6F      [10] 2861 	ld	hl,#_player
   55C9 72            [ 7] 2862 	ld	(hl),d
                           2863 ;src/keyboard.h:37: player.dir = 6;
   55CA 21 15 6F      [10] 2864 	ld	hl,#(_player + 0x0007)
   55CD 36 06         [10] 2865 	ld	(hl),#0x06
                           2866 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   55CF DD 36 FE 00   [19] 2867 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   55D3 DD 36 FF 40   [19] 2868 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   55D7 C3 64 57      [10] 2869 	jp	00148$
   55DA                    2870 00143$:
                           2871 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   55DA 21 01 01      [10] 2872 	ld	hl,#0x0101
   55DD CD 3C 69      [17] 2873 	call	_cpct_isKeyPressed
   55E0 7D            [ 4] 2874 	ld	a,l
   55E1 B7            [ 4] 2875 	or	a, a
   55E2 28 1B         [12] 2876 	jr	Z,00139$
   55E4 3A 0E 6F      [13] 2877 	ld	a, (#_player + 0)
   55E7 B7            [ 4] 2878 	or	a, a
   55E8 28 15         [12] 2879 	jr	Z,00139$
                           2880 ;src/keyboard.h:40: player.x -= 1;
   55EA C6 FF         [ 7] 2881 	add	a,#0xFF
   55EC 32 0E 6F      [13] 2882 	ld	(#_player),a
                           2883 ;src/keyboard.h:41: player.dir = 4;
   55EF 21 15 6F      [10] 2884 	ld	hl,#(_player + 0x0007)
   55F2 36 04         [10] 2885 	ld	(hl),#0x04
                           2886 ;src/keyboard.h:42: s = gladis_quieto_izda;
   55F4 DD 36 FE 80   [19] 2887 	ld	-2 (ix),#<(_gladis_quieto_izda)
   55F8 DD 36 FF 40   [19] 2888 	ld	-1 (ix),#>(_gladis_quieto_izda)
   55FC C3 64 57      [10] 2889 	jp	00148$
   55FF                    2890 00139$:
                           2891 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   55FF 21 00 04      [10] 2892 	ld	hl,#0x0400
   5602 CD 3C 69      [17] 2893 	call	_cpct_isKeyPressed
   5605 01 0F 6F      [10] 2894 	ld	bc,#_player + 1
   5608 7D            [ 4] 2895 	ld	a,l
   5609 B7            [ 4] 2896 	or	a, a
   560A 28 1A         [12] 2897 	jr	Z,00135$
   560C 0A            [ 7] 2898 	ld	a,(bc)
   560D 67            [ 4] 2899 	ld	h,a
   560E D6 B4         [ 7] 2900 	sub	a, #0xB4
   5610 30 14         [12] 2901 	jr	NC,00135$
                           2902 ;src/keyboard.h:44: player.y += 2;
   5612 7C            [ 4] 2903 	ld	a,h
   5613 C6 02         [ 7] 2904 	add	a, #0x02
   5615 02            [ 7] 2905 	ld	(bc),a
                           2906 ;src/keyboard.h:45: player.dir = 2;
   5616 21 15 6F      [10] 2907 	ld	hl,#(_player + 0x0007)
   5619 36 02         [10] 2908 	ld	(hl),#0x02
                           2909 ;src/keyboard.h:46: s = gladis_abajo;
   561B DD 36 FE 80   [19] 2910 	ld	-2 (ix),#<(_gladis_abajo)
   561F DD 36 FF 42   [19] 2911 	ld	-1 (ix),#>(_gladis_abajo)
   5623 C3 64 57      [10] 2912 	jp	00148$
   5626                    2913 00135$:
                           2914 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   5626 C5            [11] 2915 	push	bc
   5627 21 00 01      [10] 2916 	ld	hl,#0x0100
   562A CD 3C 69      [17] 2917 	call	_cpct_isKeyPressed
   562D 7D            [ 4] 2918 	ld	a,l
   562E C1            [10] 2919 	pop	bc
   562F B7            [ 4] 2920 	or	a, a
   5630 28 17         [12] 2921 	jr	Z,00131$
   5632 0A            [ 7] 2922 	ld	a,(bc)
   5633 B7            [ 4] 2923 	or	a, a
   5634 28 13         [12] 2924 	jr	Z,00131$
                           2925 ;src/keyboard.h:48: player.y -= 2;
   5636 C6 FE         [ 7] 2926 	add	a,#0xFE
   5638 02            [ 7] 2927 	ld	(bc),a
                           2928 ;src/keyboard.h:49: player.dir = 8;
   5639 21 15 6F      [10] 2929 	ld	hl,#(_player + 0x0007)
   563C 36 08         [10] 2930 	ld	(hl),#0x08
                           2931 ;src/keyboard.h:50: s = gladis_arriba;
   563E DD 36 FE 00   [19] 2932 	ld	-2 (ix),#<(_gladis_arriba)
   5642 DD 36 FF 42   [19] 2933 	ld	-1 (ix),#>(_gladis_arriba)
   5646 C3 64 57      [10] 2934 	jp	00148$
   5649                    2935 00131$:
                           2936 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   5649 C5            [11] 2937 	push	bc
   564A 21 07 80      [10] 2938 	ld	hl,#0x8007
   564D CD 3C 69      [17] 2939 	call	_cpct_isKeyPressed
   5650 7D            [ 4] 2940 	ld	a,l
   5651 C1            [10] 2941 	pop	bc
   5652 B7            [ 4] 2942 	or	a, a
   5653 CA 24 57      [10] 2943 	jp	Z,00125$
   5656 3A F4 6E      [13] 2944 	ld	a,(#_arrow + 0)
   5659 B7            [ 4] 2945 	or	a, a
   565A C2 24 57      [10] 2946 	jp	NZ,00125$
   565D 3A 16 6F      [13] 2947 	ld	a, (#(_player + 0x0008) + 0)
   5660 D6 14         [ 7] 2948 	sub	a, #0x14
   5662 C2 24 57      [10] 2949 	jp	NZ,00125$
   5665 3A 18 6F      [13] 2950 	ld	a, (#(_player + 0x000a) + 0)
   5668 B7            [ 4] 2951 	or	a, a
   5669 CA 24 57      [10] 2952 	jp	Z,00125$
                           2953 ;src/keyboard.h:52: if(player.bullets> 0){
   566C B7            [ 4] 2954 	or	a, a
   566D CA 1D 57      [10] 2955 	jp	Z,00118$
                           2956 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   5670 DD 36 FB D8   [19] 2957 	ld	-5 (ix),#<(_flecha_dcha)
   5674 DD 36 FC 68   [19] 2958 	ld	-4 (ix),#>(_flecha_dcha)
   5678 DD 36 FA 02   [19] 2959 	ld	-6 (ix),#0x02
   567C 1E 08         [ 7] 2960 	ld	e,#0x08
                           2961 ;src/keyboard.h:54: switch(player.dir){
   567E 21 15 6F      [10] 2962 	ld	hl, #(_player + 0x0007) + 0
   5681 56            [ 7] 2963 	ld	d,(hl)
   5682 7A            [ 4] 2964 	ld	a,d
   5683 D6 02         [ 7] 2965 	sub	a, #0x02
   5685 28 31         [12] 2966 	jr	Z,00114$
   5687 7A            [ 4] 2967 	ld	a,d
   5688 D6 04         [ 7] 2968 	sub	a, #0x04
   568A 28 1C         [12] 2969 	jr	Z,00113$
   568C 7A            [ 4] 2970 	ld	a,d
   568D D6 06         [ 7] 2971 	sub	a, #0x06
   568F 28 07         [12] 2972 	jr	Z,00112$
   5691 7A            [ 4] 2973 	ld	a,d
   5692 D6 08         [ 7] 2974 	sub	a, #0x08
   5694 28 32         [12] 2975 	jr	Z,00115$
   5696 18 3E         [12] 2976 	jr	00116$
                           2977 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   5698                    2978 00112$:
   5698 DD 36 FB D8   [19] 2979 	ld	-5 (ix),#<(_flecha_dcha)
   569C DD 36 FC 68   [19] 2980 	ld	-4 (ix),#>(_flecha_dcha)
   56A0 DD 36 FA 04   [19] 2981 	ld	-6 (ix),#0x04
   56A4 1E 04         [ 7] 2982 	ld	e,#0x04
   56A6 18 2E         [12] 2983 	jr	00116$
                           2984 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   56A8                    2985 00113$:
   56A8 DD 36 FB F8   [19] 2986 	ld	-5 (ix),#<(_flecha_izda)
   56AC DD 36 FC 68   [19] 2987 	ld	-4 (ix),#>(_flecha_izda)
   56B0 DD 36 FA 04   [19] 2988 	ld	-6 (ix),#0x04
   56B4 1E 04         [ 7] 2989 	ld	e,#0x04
   56B6 18 1E         [12] 2990 	jr	00116$
                           2991 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   56B8                    2992 00114$:
   56B8 DD 36 FB B8   [19] 2993 	ld	-5 (ix),#<(_flecha_abajo)
   56BC DD 36 FC 68   [19] 2994 	ld	-4 (ix),#>(_flecha_abajo)
   56C0 DD 36 FA 02   [19] 2995 	ld	-6 (ix),#0x02
   56C4 1E 08         [ 7] 2996 	ld	e,#0x08
   56C6 18 0E         [12] 2997 	jr	00116$
                           2998 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   56C8                    2999 00115$:
   56C8 DD 36 FB 98   [19] 3000 	ld	-5 (ix),#<(_flecha_arriba)
   56CC DD 36 FC 68   [19] 3001 	ld	-4 (ix),#>(_flecha_arriba)
   56D0 DD 36 FA 02   [19] 3002 	ld	-6 (ix),#0x02
   56D4 1E 08         [ 7] 3003 	ld	e,#0x08
                           3004 ;src/keyboard.h:59: }
   56D6                    3005 00116$:
                           3006 ;src/keyboard.h:60: player.atk = 0;
   56D6 21 16 6F      [10] 3007 	ld	hl,#(_player + 0x0008)
   56D9 36 00         [10] 3008 	ld	(hl),#0x00
                           3009 ;src/keyboard.h:61: parrow.x = player.x;
   56DB 3A 0E 6F      [13] 3010 	ld	a, (#_player + 0)
   56DE 32 FA 6E      [13] 3011 	ld	(#_parrow),a
                           3012 ;src/keyboard.h:62: parrow.y = player.y+8;
   56E1 0A            [ 7] 3013 	ld	a,(bc)
   56E2 C6 08         [ 7] 3014 	add	a, #0x08
   56E4 32 FB 6E      [13] 3015 	ld	(#(_parrow + 0x0001)),a
                           3016 ;src/keyboard.h:63: parrow.x = parrow.x;
   56E7 21 FA 6E      [10] 3017 	ld	hl, #_parrow + 0
   56EA 56            [ 7] 3018 	ld	d,(hl)
   56EB 21 FA 6E      [10] 3019 	ld	hl,#_parrow
   56EE 72            [ 7] 3020 	ld	(hl),d
                           3021 ;src/keyboard.h:64: parrow.y = parrow.y;
   56EF 32 FB 6E      [13] 3022 	ld	(#(_parrow + 0x0001)),a
                           3023 ;src/keyboard.h:65: parrow.sprite = spr;
   56F2 21 FE 6E      [10] 3024 	ld	hl,#_parrow + 4
   56F5 DD 7E FB      [19] 3025 	ld	a,-5 (ix)
   56F8 77            [ 7] 3026 	ld	(hl),a
   56F9 23            [ 6] 3027 	inc	hl
   56FA DD 7E FC      [19] 3028 	ld	a,-4 (ix)
   56FD 77            [ 7] 3029 	ld	(hl),a
                           3030 ;src/keyboard.h:66: parrow.vivo = 1;
   56FE 21 00 6F      [10] 3031 	ld	hl,#_parrow + 6
   5701 36 01         [10] 3032 	ld	(hl),#0x01
                           3033 ;src/keyboard.h:67: parrow.dir = player.dir;
   5703 01 01 6F      [10] 3034 	ld	bc,#_parrow + 7
   5706 3A 15 6F      [13] 3035 	ld	a, (#(_player + 0x0007) + 0)
   5709 02            [ 7] 3036 	ld	(bc),a
                           3037 ;src/keyboard.h:68: parrow.sizeX = xs;
   570A 21 02 6F      [10] 3038 	ld	hl,#_parrow + 8
   570D DD 7E FA      [19] 3039 	ld	a,-6 (ix)
   5710 77            [ 7] 3040 	ld	(hl),a
                           3041 ;src/keyboard.h:69: parrow.sizeY = ys;
   5711 21 03 6F      [10] 3042 	ld	hl,#_parrow + 9
   5714 73            [ 7] 3043 	ld	(hl),e
                           3044 ;src/keyboard.h:70: player.bullets--;
   5715 3A 18 6F      [13] 3045 	ld	a, (#(_player + 0x000a) + 0)
   5718 C6 FF         [ 7] 3046 	add	a,#0xFF
   571A 32 18 6F      [13] 3047 	ld	(#(_player + 0x000a)),a
   571D                    3048 00118$:
                           3049 ;src/keyboard.h:72: arrow=1;
   571D 21 F4 6E      [10] 3050 	ld	hl,#_arrow + 0
   5720 36 01         [10] 3051 	ld	(hl), #0x01
   5722 18 40         [12] 3052 	jr	00148$
   5724                    3053 00125$:
                           3054 ;src/keyboard.h:74: switch(player.dir){
   5724 21 15 6F      [10] 3055 	ld	hl, #(_player + 0x0007) + 0
   5727 66            [ 7] 3056 	ld	h,(hl)
   5728 7C            [ 4] 3057 	ld	a,h
   5729 D6 02         [ 7] 3058 	sub	a, #0x02
   572B 28 2F         [12] 3059 	jr	Z,00122$
   572D 7C            [ 4] 3060 	ld	a,h
   572E D6 04         [ 7] 3061 	sub	a, #0x04
   5730 28 0C         [12] 3062 	jr	Z,00119$
   5732 7C            [ 4] 3063 	ld	a,h
   5733 D6 06         [ 7] 3064 	sub	a, #0x06
   5735 28 11         [12] 3065 	jr	Z,00120$
   5737 7C            [ 4] 3066 	ld	a,h
   5738 D6 08         [ 7] 3067 	sub	a, #0x08
   573A 28 16         [12] 3068 	jr	Z,00121$
   573C 18 26         [12] 3069 	jr	00148$
                           3070 ;src/keyboard.h:75: case 4:
   573E                    3071 00119$:
                           3072 ;src/keyboard.h:76: s = gladis_quieto_izda;
   573E DD 36 FE 80   [19] 3073 	ld	-2 (ix),#<(_gladis_quieto_izda)
   5742 DD 36 FF 40   [19] 3074 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           3075 ;src/keyboard.h:77: break;
   5746 18 1C         [12] 3076 	jr	00148$
                           3077 ;src/keyboard.h:78: case 6:
   5748                    3078 00120$:
                           3079 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   5748 DD 36 FE 00   [19] 3080 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   574C DD 36 FF 40   [19] 3081 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           3082 ;src/keyboard.h:80: break;
   5750 18 12         [12] 3083 	jr	00148$
                           3084 ;src/keyboard.h:81: case 8:
   5752                    3085 00121$:
                           3086 ;src/keyboard.h:82: s = gladis_arriba;
   5752 DD 36 FE 00   [19] 3087 	ld	-2 (ix),#<(_gladis_arriba)
   5756 DD 36 FF 42   [19] 3088 	ld	-1 (ix),#>(_gladis_arriba)
                           3089 ;src/keyboard.h:83: break;
   575A 18 08         [12] 3090 	jr	00148$
                           3091 ;src/keyboard.h:84: case 2:
   575C                    3092 00122$:
                           3093 ;src/keyboard.h:85: s = gladis_abajo;
   575C DD 36 FE 80   [19] 3094 	ld	-2 (ix),#<(_gladis_abajo)
   5760 DD 36 FF 42   [19] 3095 	ld	-1 (ix),#>(_gladis_abajo)
                           3096 ;src/keyboard.h:87: }
   5764                    3097 00148$:
                           3098 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   5764 21 04 10      [10] 3099 	ld	hl,#0x1004
   5767 CD 3C 69      [17] 3100 	call	_cpct_isKeyPressed
   576A 7D            [ 4] 3101 	ld	a,l
   576B B7            [ 4] 3102 	or	a, a
   576C 28 05         [12] 3103 	jr	Z,00151$
                           3104 ;src/keyboard.h:94: arrow = 0;
   576E 21 F4 6E      [10] 3105 	ld	hl,#_arrow + 0
   5771 36 00         [10] 3106 	ld	(hl), #0x00
   5773                    3107 00151$:
                           3108 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   5773 21 08 04      [10] 3109 	ld	hl,#0x0408
   5776 CD 3C 69      [17] 3110 	call	_cpct_isKeyPressed
   5779 7D            [ 4] 3111 	ld	a,l
   577A B7            [ 4] 3112 	or	a, a
   577B 28 05         [12] 3113 	jr	Z,00153$
                           3114 ;src/keyboard.h:97: finish = 1;
   577D 21 F3 6E      [10] 3115 	ld	hl,#_finish + 0
   5780 36 01         [10] 3116 	ld	(hl), #0x01
   5782                    3117 00153$:
                           3118 ;src/keyboard.h:99: return s;
   5782 DD 6E FE      [19] 3119 	ld	l,-2 (ix)
   5785 DD 66 FF      [19] 3120 	ld	h,-1 (ix)
   5788 DD F9         [10] 3121 	ld	sp, ix
   578A DD E1         [14] 3122 	pop	ix
   578C C9            [10] 3123 	ret
                           3124 ;src/main.c:37: void init(){
                           3125 ;	---------------------------------
                           3126 ; Function init
                           3127 ; ---------------------------------
   578D                    3128 _init::
                           3129 ;src/main.c:38: cpct_disableFirmware();
   578D CD 28 6C      [17] 3130 	call	_cpct_disableFirmware
                           3131 ;src/main.c:39: cpct_setVideoMode(0);
   5790 AF            [ 4] 3132 	xor	a, a
   5791 F5            [11] 3133 	push	af
   5792 33            [ 6] 3134 	inc	sp
   5793 CD 05 6C      [17] 3135 	call	_cpct_setVideoMode
   5796 33            [ 6] 3136 	inc	sp
                           3137 ;src/main.c:40: cpct_fw2hw(g_palette,4);
   5797 11 0E 49      [10] 3138 	ld	de,#_g_palette
   579A 3E 04         [ 7] 3139 	ld	a,#0x04
   579C F5            [11] 3140 	push	af
   579D 33            [ 6] 3141 	inc	sp
   579E D5            [11] 3142 	push	de
   579F CD 8F 6B      [17] 3143 	call	_cpct_fw2hw
   57A2 F1            [10] 3144 	pop	af
   57A3 33            [ 6] 3145 	inc	sp
                           3146 ;src/main.c:41: cpct_setPalette(g_palette,4);
   57A4 11 0E 49      [10] 3147 	ld	de,#_g_palette
   57A7 3E 04         [ 7] 3148 	ld	a,#0x04
   57A9 F5            [11] 3149 	push	af
   57AA 33            [ 6] 3150 	inc	sp
   57AB D5            [11] 3151 	push	de
   57AC CD 18 69      [17] 3152 	call	_cpct_setPalette
   57AF F1            [10] 3153 	pop	af
   57B0 33            [ 6] 3154 	inc	sp
   57B1 C9            [10] 3155 	ret
                           3156 ;src/main.c:44: void initPlayer(){
                           3157 ;	---------------------------------
                           3158 ; Function initPlayer
                           3159 ; ---------------------------------
   57B2                    3160 _initPlayer::
                           3161 ;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
                           3162 ;src/main.c:46: player.x = origins[0][0];
   57B2 01 13 49      [10] 3163 	ld	bc,#_origins+0
   57B5 0A            [ 7] 3164 	ld	a,(bc)
   57B6 32 0E 6F      [13] 3165 	ld	(#_player),a
                           3166 ;src/main.c:47: player.y = origins[0][1];
   57B9 59            [ 4] 3167 	ld	e, c
   57BA 50            [ 4] 3168 	ld	d, b
   57BB 13            [ 6] 3169 	inc	de
   57BC 1A            [ 7] 3170 	ld	a,(de)
   57BD 32 0F 6F      [13] 3171 	ld	(#(_player + 0x0001)),a
                           3172 ;src/main.c:48: player.lx = origins[0][0];
   57C0 0A            [ 7] 3173 	ld	a,(bc)
   57C1 32 10 6F      [13] 3174 	ld	(#(_player + 0x0002)),a
                           3175 ;src/main.c:49: player.ly = origins[0][1];
   57C4 1A            [ 7] 3176 	ld	a,(de)
   57C5 32 11 6F      [13] 3177 	ld	(#(_player + 0x0003)),a
                           3178 ;src/main.c:50: player.sprite = sprite;
   57C8 21 00 40      [10] 3179 	ld	hl,#_gladis_quieto_dcha
   57CB 22 12 6F      [16] 3180 	ld	((_player + 0x0004)), hl
                           3181 ;src/main.c:51: player.life = 3;
   57CE 21 14 6F      [10] 3182 	ld	hl,#_player + 6
   57D1 36 03         [10] 3183 	ld	(hl),#0x03
                           3184 ;src/main.c:52: player.dir = 6;
   57D3 21 15 6F      [10] 3185 	ld	hl,#_player + 7
   57D6 36 06         [10] 3186 	ld	(hl),#0x06
                           3187 ;src/main.c:53: player.atk = 20;
   57D8 21 16 6F      [10] 3188 	ld	hl,#_player + 8
   57DB 36 14         [10] 3189 	ld	(hl),#0x14
                           3190 ;src/main.c:54: player.latk = 20;
   57DD 21 17 6F      [10] 3191 	ld	hl,#_player + 9
   57E0 36 14         [10] 3192 	ld	(hl),#0x14
                           3193 ;src/main.c:55: player.bullets = 3;
   57E2 21 18 6F      [10] 3194 	ld	hl,#_player + 10
   57E5 36 03         [10] 3195 	ld	(hl),#0x03
   57E7 C9            [10] 3196 	ret
                           3197 ;src/main.c:58: void initEnemies(){
                           3198 ;	---------------------------------
                           3199 ; Function initEnemies
                           3200 ; ---------------------------------
   57E8                    3201 _initEnemies::
                           3202 ;src/main.c:59: u8 *sprite = chacho_dcha;
                           3203 ;src/main.c:60: enemy.x = origins[1][0];
   57E8 01 15 49      [10] 3204 	ld	bc,#_origins + 2
   57EB 0A            [ 7] 3205 	ld	a,(bc)
   57EC 32 19 6F      [13] 3206 	ld	(#_enemy),a
                           3207 ;src/main.c:61: enemy.y = origins[1][1];
   57EF 11 16 49      [10] 3208 	ld	de,#_origins + 3
   57F2 1A            [ 7] 3209 	ld	a,(de)
   57F3 32 1A 6F      [13] 3210 	ld	(#(_enemy + 0x0001)),a
                           3211 ;src/main.c:62: enemy.lx = origins[1][0];
   57F6 0A            [ 7] 3212 	ld	a,(bc)
   57F7 32 1B 6F      [13] 3213 	ld	(#(_enemy + 0x0002)),a
                           3214 ;src/main.c:63: enemy.ly = origins[1][1];
   57FA 1A            [ 7] 3215 	ld	a,(de)
   57FB 32 1C 6F      [13] 3216 	ld	(#(_enemy + 0x0003)),a
                           3217 ;src/main.c:64: enemy.ox = origins[1][0];
   57FE 0A            [ 7] 3218 	ld	a,(bc)
   57FF 32 1D 6F      [13] 3219 	ld	(#(_enemy + 0x0004)),a
                           3220 ;src/main.c:65: enemy.oy = origins[1][1];
   5802 1A            [ 7] 3221 	ld	a,(de)
   5803 32 1E 6F      [13] 3222 	ld	(#(_enemy + 0x0005)),a
                           3223 ;src/main.c:66: enemy.sprite = sprite;
   5806 21 00 44      [10] 3224 	ld	hl,#_chacho_dcha
   5809 22 1F 6F      [16] 3225 	ld	((_enemy + 0x0006)), hl
                           3226 ;src/main.c:67: enemy.life = 3;
   580C 21 21 6F      [10] 3227 	ld	hl,#_enemy + 8
   580F 36 03         [10] 3228 	ld	(hl),#0x03
                           3229 ;src/main.c:68: enemy.dir = 6;
   5811 21 22 6F      [10] 3230 	ld	hl,#_enemy + 9
   5814 36 06         [10] 3231 	ld	(hl),#0x06
                           3232 ;src/main.c:69: enemy.bullets = 3;
   5816 21 23 6F      [10] 3233 	ld	hl,#_enemy + 10
   5819 36 03         [10] 3234 	ld	(hl),#0x03
                           3235 ;src/main.c:70: enemy.room = 3;
   581B 21 24 6F      [10] 3236 	ld	hl,#_enemy + 11
   581E 36 03         [10] 3237 	ld	(hl),#0x03
   5820 C9            [10] 3238 	ret
                           3239 ;src/main.c:75: void gameOver(){
                           3240 ;	---------------------------------
                           3241 ; Function gameOver
                           3242 ; ---------------------------------
   5821                    3243 _gameOver::
                           3244 ;src/main.c:77: cpct_clearScreen(0);
   5821 21 00 40      [10] 3245 	ld	hl,#0x4000
   5824 E5            [11] 3246 	push	hl
   5825 AF            [ 4] 3247 	xor	a, a
   5826 F5            [11] 3248 	push	af
   5827 33            [ 6] 3249 	inc	sp
   5828 26 C0         [ 7] 3250 	ld	h, #0xC0
   582A E5            [11] 3251 	push	hl
   582B CD 17 6C      [17] 3252 	call	_cpct_memset
                           3253 ;src/main.c:78: memptr = cpct_getScreenPtr(VMEM,10,10);
   582E 21 0A 0A      [10] 3254 	ld	hl,#0x0A0A
   5831 E5            [11] 3255 	push	hl
   5832 21 00 C0      [10] 3256 	ld	hl,#0xC000
   5835 E5            [11] 3257 	push	hl
   5836 CD 0A 6D      [17] 3258 	call	_cpct_getScreenPtr
                           3259 ;src/main.c:79: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5839 4D            [ 4] 3260 	ld	c, l
   583A 44            [ 4] 3261 	ld	b, h
   583B 11 4E 58      [10] 3262 	ld	de,#___str_0
   583E 21 01 00      [10] 3263 	ld	hl,#0x0001
   5841 E5            [11] 3264 	push	hl
   5842 C5            [11] 3265 	push	bc
   5843 D5            [11] 3266 	push	de
   5844 CD 29 6A      [17] 3267 	call	_cpct_drawStringM0
   5847 21 06 00      [10] 3268 	ld	hl,#6
   584A 39            [11] 3269 	add	hl,sp
   584B F9            [ 6] 3270 	ld	sp,hl
                           3271 ;src/main.c:80: while(1){
   584C                    3272 00102$:
   584C 18 FE         [12] 3273 	jr	00102$
   584E                    3274 ___str_0:
   584E 4C 6F 75 6E 67 65  3275 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   585E 00                 3276 	.db 0x00
                           3277 ;src/main.c:87: int menu(){
                           3278 ;	---------------------------------
                           3279 ; Function menu
                           3280 ; ---------------------------------
   585F                    3281 _menu::
   585F DD E5         [15] 3282 	push	ix
   5861 DD 21 00 00   [14] 3283 	ld	ix,#0
   5865 DD 39         [15] 3284 	add	ix,sp
   5867 21 FA FF      [10] 3285 	ld	hl,#-6
   586A 39            [11] 3286 	add	hl,sp
   586B F9            [ 6] 3287 	ld	sp,hl
                           3288 ;src/main.c:89: int init = 50;
   586C DD 36 FC 32   [19] 3289 	ld	-4 (ix),#0x32
   5870 DD 36 FD 00   [19] 3290 	ld	-3 (ix),#0x00
                           3291 ;src/main.c:90: int pushed =0;
   5874 21 00 00      [10] 3292 	ld	hl,#0x0000
   5877 E3            [19] 3293 	ex	(sp), hl
                           3294 ;src/main.c:91: int cont =0;
   5878 11 00 00      [10] 3295 	ld	de,#0x0000
                           3296 ;src/main.c:92: cpct_clearScreen(0);
   587B D5            [11] 3297 	push	de
   587C 21 00 40      [10] 3298 	ld	hl,#0x4000
   587F E5            [11] 3299 	push	hl
   5880 AF            [ 4] 3300 	xor	a, a
   5881 F5            [11] 3301 	push	af
   5882 33            [ 6] 3302 	inc	sp
   5883 26 C0         [ 7] 3303 	ld	h, #0xC0
   5885 E5            [11] 3304 	push	hl
   5886 CD 17 6C      [17] 3305 	call	_cpct_memset
   5889 21 0A 0A      [10] 3306 	ld	hl,#0x0A0A
   588C E5            [11] 3307 	push	hl
   588D 21 00 C0      [10] 3308 	ld	hl,#0xC000
   5890 E5            [11] 3309 	push	hl
   5891 CD 0A 6D      [17] 3310 	call	_cpct_getScreenPtr
   5894 D1            [10] 3311 	pop	de
                           3312 ;src/main.c:95: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5895 4D            [ 4] 3313 	ld	c, l
   5896 44            [ 4] 3314 	ld	b, h
   5897 D5            [11] 3315 	push	de
   5898 21 01 00      [10] 3316 	ld	hl,#0x0001
   589B E5            [11] 3317 	push	hl
   589C C5            [11] 3318 	push	bc
   589D 21 42 5A      [10] 3319 	ld	hl,#___str_1
   58A0 E5            [11] 3320 	push	hl
   58A1 CD 29 6A      [17] 3321 	call	_cpct_drawStringM0
   58A4 21 06 00      [10] 3322 	ld	hl,#6
   58A7 39            [11] 3323 	add	hl,sp
   58A8 F9            [ 6] 3324 	ld	sp,hl
   58A9 21 14 32      [10] 3325 	ld	hl,#0x3214
   58AC E5            [11] 3326 	push	hl
   58AD 21 00 C0      [10] 3327 	ld	hl,#0xC000
   58B0 E5            [11] 3328 	push	hl
   58B1 CD 0A 6D      [17] 3329 	call	_cpct_getScreenPtr
   58B4 D1            [10] 3330 	pop	de
                           3331 ;src/main.c:99: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   58B5 4D            [ 4] 3332 	ld	c, l
   58B6 44            [ 4] 3333 	ld	b, h
   58B7 D5            [11] 3334 	push	de
   58B8 21 01 00      [10] 3335 	ld	hl,#0x0001
   58BB E5            [11] 3336 	push	hl
   58BC C5            [11] 3337 	push	bc
   58BD 21 53 5A      [10] 3338 	ld	hl,#___str_2
   58C0 E5            [11] 3339 	push	hl
   58C1 CD 29 6A      [17] 3340 	call	_cpct_drawStringM0
   58C4 21 06 00      [10] 3341 	ld	hl,#6
   58C7 39            [11] 3342 	add	hl,sp
   58C8 F9            [ 6] 3343 	ld	sp,hl
   58C9 21 14 46      [10] 3344 	ld	hl,#0x4614
   58CC E5            [11] 3345 	push	hl
   58CD 21 00 C0      [10] 3346 	ld	hl,#0xC000
   58D0 E5            [11] 3347 	push	hl
   58D1 CD 0A 6D      [17] 3348 	call	_cpct_getScreenPtr
   58D4 D1            [10] 3349 	pop	de
                           3350 ;src/main.c:102: cpct_drawStringM0("Creditos",memptr,1,0);
   58D5 4D            [ 4] 3351 	ld	c, l
   58D6 44            [ 4] 3352 	ld	b, h
   58D7 D5            [11] 3353 	push	de
   58D8 21 01 00      [10] 3354 	ld	hl,#0x0001
   58DB E5            [11] 3355 	push	hl
   58DC C5            [11] 3356 	push	bc
   58DD 21 61 5A      [10] 3357 	ld	hl,#___str_3
   58E0 E5            [11] 3358 	push	hl
   58E1 CD 29 6A      [17] 3359 	call	_cpct_drawStringM0
   58E4 21 06 00      [10] 3360 	ld	hl,#6
   58E7 39            [11] 3361 	add	hl,sp
   58E8 F9            [ 6] 3362 	ld	sp,hl
   58E9 21 14 5A      [10] 3363 	ld	hl,#0x5A14
   58EC E5            [11] 3364 	push	hl
   58ED 21 00 C0      [10] 3365 	ld	hl,#0xC000
   58F0 E5            [11] 3366 	push	hl
   58F1 CD 0A 6D      [17] 3367 	call	_cpct_getScreenPtr
   58F4 D1            [10] 3368 	pop	de
                           3369 ;src/main.c:95: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   58F5 DD 75 FE      [19] 3370 	ld	-2 (ix),l
   58F8 DD 74 FF      [19] 3371 	ld	-1 (ix),h
                           3372 ;src/main.c:105: cpct_drawStringM0("Salir",memptr,1,0);
   58FB 01 6A 5A      [10] 3373 	ld	bc,#___str_4
   58FE D5            [11] 3374 	push	de
   58FF 21 01 00      [10] 3375 	ld	hl,#0x0001
   5902 E5            [11] 3376 	push	hl
   5903 DD 6E FE      [19] 3377 	ld	l,-2 (ix)
   5906 DD 66 FF      [19] 3378 	ld	h,-1 (ix)
   5909 E5            [11] 3379 	push	hl
   590A C5            [11] 3380 	push	bc
   590B CD 29 6A      [17] 3381 	call	_cpct_drawStringM0
   590E 21 06 00      [10] 3382 	ld	hl,#6
   5911 39            [11] 3383 	add	hl,sp
   5912 F9            [ 6] 3384 	ld	sp,hl
   5913 D1            [10] 3385 	pop	de
                           3386 ;src/main.c:111: while(1){
   5914                    3387 00118$:
                           3388 ;src/main.c:113: cpct_scanKeyboard();
   5914 D5            [11] 3389 	push	de
   5915 CD 2A 6D      [17] 3390 	call	_cpct_scanKeyboard
   5918 21 00 04      [10] 3391 	ld	hl,#0x0400
   591B CD 3C 69      [17] 3392 	call	_cpct_isKeyPressed
   591E 7D            [ 4] 3393 	ld	a,l
   591F D1            [10] 3394 	pop	de
   5920 B7            [ 4] 3395 	or	a, a
   5921 28 2D         [12] 3396 	jr	Z,00102$
   5923 3E 96         [ 7] 3397 	ld	a,#0x96
   5925 BB            [ 4] 3398 	cp	a, e
   5926 3E 00         [ 7] 3399 	ld	a,#0x00
   5928 9A            [ 4] 3400 	sbc	a, d
   5929 E2 2E 59      [10] 3401 	jp	PO, 00162$
   592C EE 80         [ 7] 3402 	xor	a, #0x80
   592E                    3403 00162$:
   592E F2 50 59      [10] 3404 	jp	P,00102$
                           3405 ;src/main.c:115: cpct_drawSolidBox(memptr, 0, 2, 8);
   5931 21 02 08      [10] 3406 	ld	hl,#0x0802
   5934 E5            [11] 3407 	push	hl
   5935 AF            [ 4] 3408 	xor	a, a
   5936 F5            [11] 3409 	push	af
   5937 33            [ 6] 3410 	inc	sp
   5938 DD 6E FE      [19] 3411 	ld	l,-2 (ix)
   593B DD 66 FF      [19] 3412 	ld	h,-1 (ix)
   593E E5            [11] 3413 	push	hl
   593F CD 39 6C      [17] 3414 	call	_cpct_drawSolidBox
   5942 F1            [10] 3415 	pop	af
   5943 F1            [10] 3416 	pop	af
   5944 33            [ 6] 3417 	inc	sp
                           3418 ;src/main.c:116: pushed ++;
   5945 DD 34 FA      [23] 3419 	inc	-6 (ix)
   5948 20 03         [12] 3420 	jr	NZ,00163$
   594A DD 34 FB      [23] 3421 	inc	-5 (ix)
   594D                    3422 00163$:
                           3423 ;src/main.c:117: cont =0;
   594D 11 00 00      [10] 3424 	ld	de,#0x0000
   5950                    3425 00102$:
                           3426 ;src/main.c:119: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   5950 D5            [11] 3427 	push	de
   5951 21 00 01      [10] 3428 	ld	hl,#0x0100
   5954 CD 3C 69      [17] 3429 	call	_cpct_isKeyPressed
   5957 7D            [ 4] 3430 	ld	a,l
   5958 D1            [10] 3431 	pop	de
   5959 B7            [ 4] 3432 	or	a, a
   595A 28 29         [12] 3433 	jr	Z,00105$
   595C 3E 96         [ 7] 3434 	ld	a,#0x96
   595E BB            [ 4] 3435 	cp	a, e
   595F 3E 00         [ 7] 3436 	ld	a,#0x00
   5961 9A            [ 4] 3437 	sbc	a, d
   5962 E2 67 59      [10] 3438 	jp	PO, 00164$
   5965 EE 80         [ 7] 3439 	xor	a, #0x80
   5967                    3440 00164$:
   5967 F2 85 59      [10] 3441 	jp	P,00105$
                           3442 ;src/main.c:120: cpct_drawSolidBox(memptr, 0, 2, 8);
   596A 21 02 08      [10] 3443 	ld	hl,#0x0802
   596D E5            [11] 3444 	push	hl
   596E AF            [ 4] 3445 	xor	a, a
   596F F5            [11] 3446 	push	af
   5970 33            [ 6] 3447 	inc	sp
   5971 DD 6E FE      [19] 3448 	ld	l,-2 (ix)
   5974 DD 66 FF      [19] 3449 	ld	h,-1 (ix)
   5977 E5            [11] 3450 	push	hl
   5978 CD 39 6C      [17] 3451 	call	_cpct_drawSolidBox
   597B F1            [10] 3452 	pop	af
   597C F1            [10] 3453 	pop	af
   597D 33            [ 6] 3454 	inc	sp
                           3455 ;src/main.c:121: pushed --;
   597E E1            [10] 3456 	pop	hl
   597F E5            [11] 3457 	push	hl
   5980 2B            [ 6] 3458 	dec	hl
   5981 E3            [19] 3459 	ex	(sp), hl
                           3460 ;src/main.c:122: cont = 0;
   5982 11 00 00      [10] 3461 	ld	de,#0x0000
   5985                    3462 00105$:
                           3463 ;src/main.c:125: switch (pushed){
   5985 DD 7E FB      [19] 3464 	ld	a,-5 (ix)
   5988 07            [ 4] 3465 	rlca
   5989 E6 01         [ 7] 3466 	and	a,#0x01
   598B 47            [ 4] 3467 	ld	b,a
   598C 3E 02         [ 7] 3468 	ld	a,#0x02
   598E DD BE FA      [19] 3469 	cp	a, -6 (ix)
   5991 3E 00         [ 7] 3470 	ld	a,#0x00
   5993 DD 9E FB      [19] 3471 	sbc	a, -5 (ix)
   5996 E2 9B 59      [10] 3472 	jp	PO, 00165$
   5999 EE 80         [ 7] 3473 	xor	a, #0x80
   599B                    3474 00165$:
   599B 07            [ 4] 3475 	rlca
   599C E6 01         [ 7] 3476 	and	a,#0x01
   599E 4F            [ 4] 3477 	ld	c,a
   599F 78            [ 4] 3478 	ld	a,b
   59A0 B7            [ 4] 3479 	or	a,a
   59A1 20 32         [12] 3480 	jr	NZ,00110$
   59A3 B1            [ 4] 3481 	or	a,c
   59A4 20 2F         [12] 3482 	jr	NZ,00110$
   59A6 D5            [11] 3483 	push	de
   59A7 DD 5E FA      [19] 3484 	ld	e,-6 (ix)
   59AA 16 00         [ 7] 3485 	ld	d,#0x00
   59AC 21 B3 59      [10] 3486 	ld	hl,#00166$
   59AF 19            [11] 3487 	add	hl,de
   59B0 19            [11] 3488 	add	hl,de
                           3489 ;src/main.c:126: case 0: init = 50;break;
   59B1 D1            [10] 3490 	pop	de
   59B2 E9            [ 4] 3491 	jp	(hl)
   59B3                    3492 00166$:
   59B3 18 04         [12] 3493 	jr	00107$
   59B5 18 0C         [12] 3494 	jr	00108$
   59B7 18 14         [12] 3495 	jr	00109$
   59B9                    3496 00107$:
   59B9 DD 36 FC 32   [19] 3497 	ld	-4 (ix),#0x32
   59BD DD 36 FD 00   [19] 3498 	ld	-3 (ix),#0x00
   59C1 18 12         [12] 3499 	jr	00110$
                           3500 ;src/main.c:127: case 1: init = 70;break;
   59C3                    3501 00108$:
   59C3 DD 36 FC 46   [19] 3502 	ld	-4 (ix),#0x46
   59C7 DD 36 FD 00   [19] 3503 	ld	-3 (ix),#0x00
   59CB 18 08         [12] 3504 	jr	00110$
                           3505 ;src/main.c:128: case 2: init = 90;break;
   59CD                    3506 00109$:
   59CD DD 36 FC 5A   [19] 3507 	ld	-4 (ix),#0x5A
   59D1 DD 36 FD 00   [19] 3508 	ld	-3 (ix),#0x00
                           3509 ;src/main.c:129: }
   59D5                    3510 00110$:
                           3511 ;src/main.c:130: memptr = cpct_getScreenPtr(VMEM,15,init);
   59D5 DD 66 FC      [19] 3512 	ld	h,-4 (ix)
   59D8 C5            [11] 3513 	push	bc
   59D9 D5            [11] 3514 	push	de
   59DA E5            [11] 3515 	push	hl
   59DB 33            [ 6] 3516 	inc	sp
   59DC 3E 0F         [ 7] 3517 	ld	a,#0x0F
   59DE F5            [11] 3518 	push	af
   59DF 33            [ 6] 3519 	inc	sp
   59E0 21 00 C0      [10] 3520 	ld	hl,#0xC000
   59E3 E5            [11] 3521 	push	hl
   59E4 CD 0A 6D      [17] 3522 	call	_cpct_getScreenPtr
   59E7 D1            [10] 3523 	pop	de
   59E8 C1            [10] 3524 	pop	bc
                           3525 ;src/main.c:95: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   59E9 DD 75 FE      [19] 3526 	ld	-2 (ix),l
   59EC DD 74 FF      [19] 3527 	ld	-1 (ix),h
                           3528 ;src/main.c:131: cpct_drawSolidBox(memptr, 3, 2, 8);
   59EF C5            [11] 3529 	push	bc
   59F0 D5            [11] 3530 	push	de
   59F1 21 02 08      [10] 3531 	ld	hl,#0x0802
   59F4 E5            [11] 3532 	push	hl
   59F5 3E 03         [ 7] 3533 	ld	a,#0x03
   59F7 F5            [11] 3534 	push	af
   59F8 33            [ 6] 3535 	inc	sp
   59F9 DD 6E FE      [19] 3536 	ld	l,-2 (ix)
   59FC DD 66 FF      [19] 3537 	ld	h,-1 (ix)
   59FF E5            [11] 3538 	push	hl
   5A00 CD 39 6C      [17] 3539 	call	_cpct_drawSolidBox
   5A03 F1            [10] 3540 	pop	af
   5A04 F1            [10] 3541 	pop	af
   5A05 33            [ 6] 3542 	inc	sp
   5A06 21 00 40      [10] 3543 	ld	hl,#0x4000
   5A09 CD 3C 69      [17] 3544 	call	_cpct_isKeyPressed
   5A0C 7D            [ 4] 3545 	ld	a,l
   5A0D D1            [10] 3546 	pop	de
   5A0E C1            [10] 3547 	pop	bc
   5A0F B7            [ 4] 3548 	or	a, a
   5A10 28 27         [12] 3549 	jr	Z,00116$
                           3550 ;src/main.c:133: switch (pushed){
   5A12 78            [ 4] 3551 	ld	a,b
   5A13 B7            [ 4] 3552 	or	a,a
   5A14 20 23         [12] 3553 	jr	NZ,00116$
   5A16 B1            [ 4] 3554 	or	a,c
   5A17 20 20         [12] 3555 	jr	NZ,00116$
   5A19 DD 5E FA      [19] 3556 	ld	e,-6 (ix)
   5A1C 16 00         [ 7] 3557 	ld	d,#0x00
   5A1E 21 24 5A      [10] 3558 	ld	hl,#00167$
   5A21 19            [11] 3559 	add	hl,de
   5A22 19            [11] 3560 	add	hl,de
                           3561 ;src/main.c:134: case 0: return 1;break;
   5A23 E9            [ 4] 3562 	jp	(hl)
   5A24                    3563 00167$:
   5A24 18 04         [12] 3564 	jr	00111$
   5A26 18 07         [12] 3565 	jr	00112$
   5A28 18 0A         [12] 3566 	jr	00113$
   5A2A                    3567 00111$:
   5A2A 21 01 00      [10] 3568 	ld	hl,#0x0001
   5A2D 18 0E         [12] 3569 	jr	00120$
                           3570 ;src/main.c:135: case 1: return 2;break;
   5A2F                    3571 00112$:
   5A2F 21 02 00      [10] 3572 	ld	hl,#0x0002
   5A32 18 09         [12] 3573 	jr	00120$
                           3574 ;src/main.c:136: case 2: return 0;break;
   5A34                    3575 00113$:
   5A34 21 00 00      [10] 3576 	ld	hl,#0x0000
   5A37 18 04         [12] 3577 	jr	00120$
                           3578 ;src/main.c:137: }
   5A39                    3579 00116$:
                           3580 ;src/main.c:139: cont++;
   5A39 13            [ 6] 3581 	inc	de
   5A3A C3 14 59      [10] 3582 	jp	00118$
   5A3D                    3583 00120$:
   5A3D DD F9         [10] 3584 	ld	sp, ix
   5A3F DD E1         [14] 3585 	pop	ix
   5A41 C9            [10] 3586 	ret
   5A42                    3587 ___str_1:
   5A42 4C 6F 75 6E 67 65  3588 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5A52 00                 3589 	.db 0x00
   5A53                    3590 ___str_2:
   5A53 4E 75 65 76 61 20  3591 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   5A60 00                 3592 	.db 0x00
   5A61                    3593 ___str_3:
   5A61 43 72 65 64 69 74  3594 	.ascii "Creditos"
        6F 73
   5A69 00                 3595 	.db 0x00
   5A6A                    3596 ___str_4:
   5A6A 53 61 6C 69 72     3597 	.ascii "Salir"
   5A6F 00                 3598 	.db 0x00
                           3599 ;src/main.c:152: void moveObject(u8 c){
                           3600 ;	---------------------------------
                           3601 ; Function moveObject
                           3602 ; ---------------------------------
   5A70                    3603 _moveObject::
   5A70 DD E5         [15] 3604 	push	ix
   5A72 DD 21 00 00   [14] 3605 	ld	ix,#0
   5A76 DD 39         [15] 3606 	add	ix,sp
                           3607 ;src/main.c:153: if(c == 0){
   5A78 DD 7E 04      [19] 3608 	ld	a,4 (ix)
   5A7B B7            [ 4] 3609 	or	a, a
   5A7C 20 3A         [12] 3610 	jr	NZ,00112$
                           3611 ;src/main.c:154: parrow.lx = parrow.x;
   5A7E 11 FA 6E      [10] 3612 	ld	de,#_parrow+0
   5A81 1A            [ 7] 3613 	ld	a,(de)
   5A82 32 FC 6E      [13] 3614 	ld	(#(_parrow + 0x0002)),a
                           3615 ;src/main.c:155: parrow.ly = parrow.y;
   5A85 4B            [ 4] 3616 	ld	c, e
   5A86 42            [ 4] 3617 	ld	b, d
   5A87 03            [ 6] 3618 	inc	bc
   5A88 0A            [ 7] 3619 	ld	a,(bc)
   5A89 32 FD 6E      [13] 3620 	ld	(#(_parrow + 0x0003)),a
                           3621 ;src/main.c:156: switch(parrow.dir){
   5A8C 3A 01 6F      [13] 3622 	ld	a,(#_parrow + 7)
   5A8F FE 02         [ 7] 3623 	cp	a,#0x02
   5A91 28 19         [12] 3624 	jr	Z,00103$
   5A93 FE 04         [ 7] 3625 	cp	a,#0x04
   5A95 28 0F         [12] 3626 	jr	Z,00102$
   5A97 FE 06         [ 7] 3627 	cp	a,#0x06
   5A99 28 06         [12] 3628 	jr	Z,00101$
   5A9B D6 08         [ 7] 3629 	sub	a, #0x08
   5A9D 28 13         [12] 3630 	jr	Z,00104$
   5A9F 18 4F         [12] 3631 	jr	00114$
                           3632 ;src/main.c:157: case 6: parrow.x += 1; break;
   5AA1                    3633 00101$:
   5AA1 1A            [ 7] 3634 	ld	a,(de)
   5AA2 3C            [ 4] 3635 	inc	a
   5AA3 12            [ 7] 3636 	ld	(de),a
   5AA4 18 4A         [12] 3637 	jr	00114$
                           3638 ;src/main.c:158: case 4: parrow.x -= 1; break;
   5AA6                    3639 00102$:
   5AA6 1A            [ 7] 3640 	ld	a,(de)
   5AA7 C6 FF         [ 7] 3641 	add	a,#0xFF
   5AA9 12            [ 7] 3642 	ld	(de),a
   5AAA 18 44         [12] 3643 	jr	00114$
                           3644 ;src/main.c:159: case 2: parrow.y += 2; break;
   5AAC                    3645 00103$:
   5AAC 0A            [ 7] 3646 	ld	a,(bc)
   5AAD C6 02         [ 7] 3647 	add	a, #0x02
   5AAF 02            [ 7] 3648 	ld	(bc),a
   5AB0 18 3E         [12] 3649 	jr	00114$
                           3650 ;src/main.c:160: case 8: parrow.y -= 2; break;
   5AB2                    3651 00104$:
   5AB2 0A            [ 7] 3652 	ld	a,(bc)
   5AB3 C6 FE         [ 7] 3653 	add	a,#0xFE
   5AB5 02            [ 7] 3654 	ld	(bc),a
                           3655 ;src/main.c:161: }
   5AB6 18 38         [12] 3656 	jr	00114$
   5AB8                    3657 00112$:
                           3658 ;src/main.c:164: earrow.lx = earrow.x;
   5AB8 01 04 6F      [10] 3659 	ld	bc,#_earrow+0
   5ABB 0A            [ 7] 3660 	ld	a,(bc)
   5ABC 32 06 6F      [13] 3661 	ld	(#(_earrow + 0x0002)),a
                           3662 ;src/main.c:165: earrow.ly = earrow.y;
   5ABF 59            [ 4] 3663 	ld	e, c
   5AC0 50            [ 4] 3664 	ld	d, b
   5AC1 13            [ 6] 3665 	inc	de
   5AC2 1A            [ 7] 3666 	ld	a,(de)
   5AC3 32 07 6F      [13] 3667 	ld	(#(_earrow + 0x0003)),a
                           3668 ;src/main.c:166: switch(earrow.dir){
   5AC6 3A 0B 6F      [13] 3669 	ld	a,(#_earrow + 7)
   5AC9 FE 02         [ 7] 3670 	cp	a,#0x02
   5ACB 28 19         [12] 3671 	jr	Z,00108$
   5ACD FE 04         [ 7] 3672 	cp	a,#0x04
   5ACF 28 0F         [12] 3673 	jr	Z,00107$
   5AD1 FE 06         [ 7] 3674 	cp	a,#0x06
   5AD3 28 06         [12] 3675 	jr	Z,00106$
   5AD5 D6 08         [ 7] 3676 	sub	a, #0x08
   5AD7 28 13         [12] 3677 	jr	Z,00109$
   5AD9 18 15         [12] 3678 	jr	00114$
                           3679 ;src/main.c:167: case 6: earrow.x += 1; break;
   5ADB                    3680 00106$:
   5ADB 0A            [ 7] 3681 	ld	a,(bc)
   5ADC 3C            [ 4] 3682 	inc	a
   5ADD 02            [ 7] 3683 	ld	(bc),a
   5ADE 18 10         [12] 3684 	jr	00114$
                           3685 ;src/main.c:168: case 4: earrow.x -= 1; break;
   5AE0                    3686 00107$:
   5AE0 0A            [ 7] 3687 	ld	a,(bc)
   5AE1 C6 FF         [ 7] 3688 	add	a,#0xFF
   5AE3 02            [ 7] 3689 	ld	(bc),a
   5AE4 18 0A         [12] 3690 	jr	00114$
                           3691 ;src/main.c:169: case 2: earrow.y += 2; break;
   5AE6                    3692 00108$:
   5AE6 1A            [ 7] 3693 	ld	a,(de)
   5AE7 C6 02         [ 7] 3694 	add	a, #0x02
   5AE9 12            [ 7] 3695 	ld	(de),a
   5AEA 18 04         [12] 3696 	jr	00114$
                           3697 ;src/main.c:170: case 8: earrow.y -= 2; break;
   5AEC                    3698 00109$:
   5AEC 1A            [ 7] 3699 	ld	a,(de)
   5AED C6 FE         [ 7] 3700 	add	a,#0xFE
   5AEF 12            [ 7] 3701 	ld	(de),a
                           3702 ;src/main.c:171: }
   5AF0                    3703 00114$:
   5AF0 DD E1         [14] 3704 	pop	ix
   5AF2 C9            [10] 3705 	ret
                           3706 ;src/main.c:179: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           3707 ;	---------------------------------
                           3708 ; Function checkBoundsCollisionsEnemy
                           3709 ; ---------------------------------
   5AF3                    3710 _checkBoundsCollisionsEnemy::
   5AF3 DD E5         [15] 3711 	push	ix
   5AF5 DD 21 00 00   [14] 3712 	ld	ix,#0
   5AF9 DD 39         [15] 3713 	add	ix,sp
   5AFB 21 EC FF      [10] 3714 	ld	hl,#-20
   5AFE 39            [11] 3715 	add	hl,sp
   5AFF F9            [ 6] 3716 	ld	sp,hl
                           3717 ;src/main.c:181: u8 *posX = x;
   5B00 DD 7E 04      [19] 3718 	ld	a,4 (ix)
   5B03 DD 77 EE      [19] 3719 	ld	-18 (ix),a
   5B06 DD 7E 05      [19] 3720 	ld	a,5 (ix)
   5B09 DD 77 EF      [19] 3721 	ld	-17 (ix),a
                           3722 ;src/main.c:182: u8 *posY = y;
   5B0C DD 7E 06      [19] 3723 	ld	a,6 (ix)
   5B0F DD 77 EC      [19] 3724 	ld	-20 (ix),a
   5B12 DD 7E 07      [19] 3725 	ld	a,7 (ix)
   5B15 DD 77 ED      [19] 3726 	ld	-19 (ix),a
                           3727 ;src/main.c:183: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   5B18 E1            [10] 3728 	pop	hl
   5B19 E5            [11] 3729 	push	hl
   5B1A 7E            [ 7] 3730 	ld	a,(hl)
   5B1B DD 77 FB      [19] 3731 	ld	-5 (ix), a
   5B1E 07            [ 4] 3732 	rlca
   5B1F 07            [ 4] 3733 	rlca
   5B20 07            [ 4] 3734 	rlca
   5B21 07            [ 4] 3735 	rlca
   5B22 E6 0F         [ 7] 3736 	and	a,#0x0F
   5B24 4F            [ 4] 3737 	ld	c,a
   5B25 06 00         [ 7] 3738 	ld	b,#0x00
   5B27 69            [ 4] 3739 	ld	l, c
   5B28 60            [ 4] 3740 	ld	h, b
   5B29 29            [11] 3741 	add	hl, hl
   5B2A 29            [11] 3742 	add	hl, hl
   5B2B 09            [11] 3743 	add	hl, bc
   5B2C 29            [11] 3744 	add	hl, hl
   5B2D 29            [11] 3745 	add	hl, hl
   5B2E 3E 00         [ 7] 3746 	ld	a,#<(_scene)
   5B30 85            [ 4] 3747 	add	a, l
   5B31 DD 77 F9      [19] 3748 	ld	-7 (ix),a
   5B34 3E 6E         [ 7] 3749 	ld	a,#>(_scene)
   5B36 8C            [ 4] 3750 	adc	a, h
   5B37 DD 77 FA      [19] 3751 	ld	-6 (ix),a
   5B3A DD 6E EE      [19] 3752 	ld	l,-18 (ix)
   5B3D DD 66 EF      [19] 3753 	ld	h,-17 (ix)
   5B40 7E            [ 7] 3754 	ld	a,(hl)
   5B41 DD 77 FE      [19] 3755 	ld	-2 (ix), a
   5B44 0F            [ 4] 3756 	rrca
   5B45 0F            [ 4] 3757 	rrca
   5B46 E6 3F         [ 7] 3758 	and	a,#0x3F
   5B48 DD 77 FF      [19] 3759 	ld	-1 (ix), a
   5B4B DD 86 F9      [19] 3760 	add	a, -7 (ix)
   5B4E 6F            [ 4] 3761 	ld	l,a
   5B4F 3E 00         [ 7] 3762 	ld	a,#0x00
   5B51 DD 8E FA      [19] 3763 	adc	a, -6 (ix)
   5B54 67            [ 4] 3764 	ld	h,a
   5B55 7E            [ 7] 3765 	ld	a,(hl)
   5B56 DD 77 F8      [19] 3766 	ld	-8 (ix), a
   5B59 3D            [ 4] 3767 	dec	a
   5B5A CA 68 5C      [10] 3768 	jp	Z,00106$
                           3769 ;src/main.c:184: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5B5D DD 6E FE      [19] 3770 	ld	l,-2 (ix)
   5B60 26 00         [ 7] 3771 	ld	h,#0x00
   5B62 DD 5E 0A      [19] 3772 	ld	e,10 (ix)
   5B65 16 00         [ 7] 3773 	ld	d,#0x00
   5B67 19            [11] 3774 	add	hl,de
   5B68 7D            [ 4] 3775 	ld	a,l
   5B69 C6 FF         [ 7] 3776 	add	a,#0xFF
   5B6B DD 77 F0      [19] 3777 	ld	-16 (ix),a
   5B6E 7C            [ 4] 3778 	ld	a,h
   5B6F CE FF         [ 7] 3779 	adc	a,#0xFF
   5B71 DD 77 F1      [19] 3780 	ld	-15 (ix),a
   5B74 DD 7E F0      [19] 3781 	ld	a,-16 (ix)
   5B77 DD 77 F6      [19] 3782 	ld	-10 (ix),a
   5B7A DD 7E F1      [19] 3783 	ld	a,-15 (ix)
   5B7D DD 77 F7      [19] 3784 	ld	-9 (ix),a
   5B80 DD 7E F1      [19] 3785 	ld	a,-15 (ix)
   5B83 07            [ 4] 3786 	rlca
   5B84 E6 01         [ 7] 3787 	and	a,#0x01
   5B86 DD 77 FE      [19] 3788 	ld	-2 (ix),a
   5B89 23            [ 6] 3789 	inc	hl
   5B8A 23            [ 6] 3790 	inc	hl
   5B8B DD 75 F2      [19] 3791 	ld	-14 (ix),l
   5B8E DD 74 F3      [19] 3792 	ld	-13 (ix),h
   5B91 DD 7E FE      [19] 3793 	ld	a,-2 (ix)
   5B94 B7            [ 4] 3794 	or	a, a
   5B95 28 0C         [12] 3795 	jr	Z,00114$
   5B97 DD 7E F2      [19] 3796 	ld	a,-14 (ix)
   5B9A DD 77 F6      [19] 3797 	ld	-10 (ix),a
   5B9D DD 7E F3      [19] 3798 	ld	a,-13 (ix)
   5BA0 DD 77 F7      [19] 3799 	ld	-9 (ix),a
   5BA3                    3800 00114$:
   5BA3 DD 6E F6      [19] 3801 	ld	l,-10 (ix)
   5BA6 DD 66 F7      [19] 3802 	ld	h,-9 (ix)
   5BA9 CB 2C         [ 8] 3803 	sra	h
   5BAB CB 1D         [ 8] 3804 	rr	l
   5BAD CB 2C         [ 8] 3805 	sra	h
   5BAF CB 1D         [ 8] 3806 	rr	l
   5BB1 DD 5E F9      [19] 3807 	ld	e,-7 (ix)
   5BB4 DD 56 FA      [19] 3808 	ld	d,-6 (ix)
   5BB7 19            [11] 3809 	add	hl,de
   5BB8 7E            [ 7] 3810 	ld	a,(hl)
   5BB9 3D            [ 4] 3811 	dec	a
   5BBA CA 68 5C      [10] 3812 	jp	Z,00106$
                           3813 ;src/main.c:185: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   5BBD DD 6E FB      [19] 3814 	ld	l,-5 (ix)
   5BC0 26 00         [ 7] 3815 	ld	h,#0x00
   5BC2 DD 5E 0B      [19] 3816 	ld	e,11 (ix)
   5BC5 16 00         [ 7] 3817 	ld	d,#0x00
   5BC7 19            [11] 3818 	add	hl,de
   5BC8 4D            [ 4] 3819 	ld	c,l
   5BC9 44            [ 4] 3820 	ld	b,h
   5BCA 0B            [ 6] 3821 	dec	bc
   5BCB 0B            [ 6] 3822 	dec	bc
   5BCC 59            [ 4] 3823 	ld	e, c
   5BCD 78            [ 4] 3824 	ld	a,b
   5BCE 57            [ 4] 3825 	ld	d,a
   5BCF 07            [ 4] 3826 	rlca
   5BD0 E6 01         [ 7] 3827 	and	a,#0x01
   5BD2 DD 77 F6      [19] 3828 	ld	-10 (ix),a
   5BD5 7D            [ 4] 3829 	ld	a,l
   5BD6 C6 0D         [ 7] 3830 	add	a, #0x0D
   5BD8 DD 77 FC      [19] 3831 	ld	-4 (ix),a
   5BDB 7C            [ 4] 3832 	ld	a,h
   5BDC CE 00         [ 7] 3833 	adc	a, #0x00
   5BDE DD 77 FD      [19] 3834 	ld	-3 (ix),a
   5BE1 DD 7E F6      [19] 3835 	ld	a,-10 (ix)
   5BE4 B7            [ 4] 3836 	or	a, a
   5BE5 28 06         [12] 3837 	jr	Z,00115$
   5BE7 DD 5E FC      [19] 3838 	ld	e,-4 (ix)
   5BEA DD 56 FD      [19] 3839 	ld	d,-3 (ix)
   5BED                    3840 00115$:
   5BED CB 2A         [ 8] 3841 	sra	d
   5BEF CB 1B         [ 8] 3842 	rr	e
   5BF1 CB 2A         [ 8] 3843 	sra	d
   5BF3 CB 1B         [ 8] 3844 	rr	e
   5BF5 CB 2A         [ 8] 3845 	sra	d
   5BF7 CB 1B         [ 8] 3846 	rr	e
   5BF9 CB 2A         [ 8] 3847 	sra	d
   5BFB CB 1B         [ 8] 3848 	rr	e
   5BFD 6B            [ 4] 3849 	ld	l, e
   5BFE 62            [ 4] 3850 	ld	h, d
   5BFF 29            [11] 3851 	add	hl, hl
   5C00 29            [11] 3852 	add	hl, hl
   5C01 19            [11] 3853 	add	hl, de
   5C02 29            [11] 3854 	add	hl, hl
   5C03 29            [11] 3855 	add	hl, hl
   5C04 11 00 6E      [10] 3856 	ld	de,#_scene
   5C07 19            [11] 3857 	add	hl,de
   5C08 DD 5E FF      [19] 3858 	ld	e,-1 (ix)
   5C0B 16 00         [ 7] 3859 	ld	d,#0x00
   5C0D 19            [11] 3860 	add	hl,de
   5C0E 7E            [ 7] 3861 	ld	a,(hl)
   5C0F 3D            [ 4] 3862 	dec	a
   5C10 28 56         [12] 3863 	jr	Z,00106$
                           3864 ;src/main.c:186: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5C12 69            [ 4] 3865 	ld	l, c
   5C13 60            [ 4] 3866 	ld	h, b
   5C14 DD 7E F6      [19] 3867 	ld	a,-10 (ix)
   5C17 B7            [ 4] 3868 	or	a, a
   5C18 28 06         [12] 3869 	jr	Z,00116$
   5C1A DD 6E FC      [19] 3870 	ld	l,-4 (ix)
   5C1D DD 66 FD      [19] 3871 	ld	h,-3 (ix)
   5C20                    3872 00116$:
   5C20 CB 2C         [ 8] 3873 	sra	h
   5C22 CB 1D         [ 8] 3874 	rr	l
   5C24 CB 2C         [ 8] 3875 	sra	h
   5C26 CB 1D         [ 8] 3876 	rr	l
   5C28 CB 2C         [ 8] 3877 	sra	h
   5C2A CB 1D         [ 8] 3878 	rr	l
   5C2C CB 2C         [ 8] 3879 	sra	h
   5C2E CB 1D         [ 8] 3880 	rr	l
   5C30 5D            [ 4] 3881 	ld	e, l
   5C31 54            [ 4] 3882 	ld	d, h
   5C32 29            [11] 3883 	add	hl, hl
   5C33 29            [11] 3884 	add	hl, hl
   5C34 19            [11] 3885 	add	hl, de
   5C35 29            [11] 3886 	add	hl, hl
   5C36 29            [11] 3887 	add	hl, hl
   5C37 3E 00         [ 7] 3888 	ld	a,#<(_scene)
   5C39 85            [ 4] 3889 	add	a, l
   5C3A DD 77 F4      [19] 3890 	ld	-12 (ix),a
   5C3D 3E 6E         [ 7] 3891 	ld	a,#>(_scene)
   5C3F 8C            [ 4] 3892 	adc	a, h
   5C40 DD 77 F5      [19] 3893 	ld	-11 (ix),a
   5C43 DD 6E F0      [19] 3894 	ld	l,-16 (ix)
   5C46 DD 66 F1      [19] 3895 	ld	h,-15 (ix)
   5C49 DD 7E FE      [19] 3896 	ld	a,-2 (ix)
   5C4C B7            [ 4] 3897 	or	a, a
   5C4D 28 06         [12] 3898 	jr	Z,00117$
   5C4F DD 6E F2      [19] 3899 	ld	l,-14 (ix)
   5C52 DD 66 F3      [19] 3900 	ld	h,-13 (ix)
   5C55                    3901 00117$:
   5C55 CB 2C         [ 8] 3902 	sra	h
   5C57 CB 1D         [ 8] 3903 	rr	l
   5C59 CB 2C         [ 8] 3904 	sra	h
   5C5B CB 1D         [ 8] 3905 	rr	l
   5C5D DD 5E F4      [19] 3906 	ld	e,-12 (ix)
   5C60 DD 56 F5      [19] 3907 	ld	d,-11 (ix)
   5C63 19            [11] 3908 	add	hl,de
   5C64 7E            [ 7] 3909 	ld	a,(hl)
   5C65 3D            [ 4] 3910 	dec	a
   5C66 20 13         [12] 3911 	jr	NZ,00107$
   5C68                    3912 00106$:
                           3913 ;src/main.c:188: *posX=lx;
   5C68 DD 6E EE      [19] 3914 	ld	l,-18 (ix)
   5C6B DD 66 EF      [19] 3915 	ld	h,-17 (ix)
   5C6E DD 7E 08      [19] 3916 	ld	a,8 (ix)
   5C71 77            [ 7] 3917 	ld	(hl),a
                           3918 ;src/main.c:189: *posY=ly;
   5C72 E1            [10] 3919 	pop	hl
   5C73 E5            [11] 3920 	push	hl
   5C74 DD 7E 09      [19] 3921 	ld	a,9 (ix)
   5C77 77            [ 7] 3922 	ld	(hl),a
   5C78 C3 43 5D      [10] 3923 	jp	00112$
   5C7B                    3924 00107$:
                           3925 ;src/main.c:191: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   5C7B DD 7E F8      [19] 3926 	ld	a,-8 (ix)
   5C7E D6 03         [ 7] 3927 	sub	a, #0x03
   5C80 C2 33 5D      [10] 3928 	jp	NZ,00101$
                           3929 ;src/main.c:192: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5C83 DD 6E F0      [19] 3930 	ld	l,-16 (ix)
   5C86 DD 66 F1      [19] 3931 	ld	h,-15 (ix)
   5C89 DD 7E FE      [19] 3932 	ld	a,-2 (ix)
   5C8C B7            [ 4] 3933 	or	a, a
   5C8D 28 06         [12] 3934 	jr	Z,00118$
   5C8F DD 6E F2      [19] 3935 	ld	l,-14 (ix)
   5C92 DD 66 F3      [19] 3936 	ld	h,-13 (ix)
   5C95                    3937 00118$:
   5C95 CB 2C         [ 8] 3938 	sra	h
   5C97 CB 1D         [ 8] 3939 	rr	l
   5C99 CB 2C         [ 8] 3940 	sra	h
   5C9B CB 1D         [ 8] 3941 	rr	l
   5C9D DD 5E F9      [19] 3942 	ld	e,-7 (ix)
   5CA0 DD 56 FA      [19] 3943 	ld	d,-6 (ix)
   5CA3 19            [11] 3944 	add	hl,de
   5CA4 7E            [ 7] 3945 	ld	a,(hl)
   5CA5 D6 03         [ 7] 3946 	sub	a, #0x03
   5CA7 C2 33 5D      [10] 3947 	jp	NZ,00101$
                           3948 ;src/main.c:193: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   5CAA 69            [ 4] 3949 	ld	l, c
   5CAB 60            [ 4] 3950 	ld	h, b
   5CAC DD 7E F6      [19] 3951 	ld	a,-10 (ix)
   5CAF B7            [ 4] 3952 	or	a, a
   5CB0 28 06         [12] 3953 	jr	Z,00119$
   5CB2 DD 6E FC      [19] 3954 	ld	l,-4 (ix)
   5CB5 DD 66 FD      [19] 3955 	ld	h,-3 (ix)
   5CB8                    3956 00119$:
   5CB8 CB 2C         [ 8] 3957 	sra	h
   5CBA CB 1D         [ 8] 3958 	rr	l
   5CBC CB 2C         [ 8] 3959 	sra	h
   5CBE CB 1D         [ 8] 3960 	rr	l
   5CC0 CB 2C         [ 8] 3961 	sra	h
   5CC2 CB 1D         [ 8] 3962 	rr	l
   5CC4 CB 2C         [ 8] 3963 	sra	h
   5CC6 CB 1D         [ 8] 3964 	rr	l
   5CC8 5D            [ 4] 3965 	ld	e, l
   5CC9 54            [ 4] 3966 	ld	d, h
   5CCA 29            [11] 3967 	add	hl, hl
   5CCB 29            [11] 3968 	add	hl, hl
   5CCC 19            [11] 3969 	add	hl, de
   5CCD 29            [11] 3970 	add	hl, hl
   5CCE 29            [11] 3971 	add	hl, hl
   5CCF 11 00 6E      [10] 3972 	ld	de,#_scene
   5CD2 19            [11] 3973 	add	hl,de
   5CD3 DD 5E FF      [19] 3974 	ld	e,-1 (ix)
   5CD6 16 00         [ 7] 3975 	ld	d,#0x00
   5CD8 19            [11] 3976 	add	hl,de
   5CD9 7E            [ 7] 3977 	ld	a,(hl)
   5CDA D6 03         [ 7] 3978 	sub	a, #0x03
   5CDC 20 55         [12] 3979 	jr	NZ,00101$
                           3980 ;src/main.c:194: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5CDE DD 7E F6      [19] 3981 	ld	a,-10 (ix)
   5CE1 B7            [ 4] 3982 	or	a, a
   5CE2 28 06         [12] 3983 	jr	Z,00120$
   5CE4 DD 4E FC      [19] 3984 	ld	c,-4 (ix)
   5CE7 DD 46 FD      [19] 3985 	ld	b,-3 (ix)
   5CEA                    3986 00120$:
   5CEA CB 28         [ 8] 3987 	sra	b
   5CEC CB 19         [ 8] 3988 	rr	c
   5CEE CB 28         [ 8] 3989 	sra	b
   5CF0 CB 19         [ 8] 3990 	rr	c
   5CF2 CB 28         [ 8] 3991 	sra	b
   5CF4 CB 19         [ 8] 3992 	rr	c
   5CF6 CB 28         [ 8] 3993 	sra	b
   5CF8 CB 19         [ 8] 3994 	rr	c
   5CFA 69            [ 4] 3995 	ld	l, c
   5CFB 60            [ 4] 3996 	ld	h, b
   5CFC 29            [11] 3997 	add	hl, hl
   5CFD 29            [11] 3998 	add	hl, hl
   5CFE 09            [11] 3999 	add	hl, bc
   5CFF 29            [11] 4000 	add	hl, hl
   5D00 29            [11] 4001 	add	hl, hl
   5D01 3E 00         [ 7] 4002 	ld	a,#<(_scene)
   5D03 85            [ 4] 4003 	add	a, l
   5D04 DD 77 F4      [19] 4004 	ld	-12 (ix),a
   5D07 3E 6E         [ 7] 4005 	ld	a,#>(_scene)
   5D09 8C            [ 4] 4006 	adc	a, h
   5D0A DD 77 F5      [19] 4007 	ld	-11 (ix),a
   5D0D DD 6E F0      [19] 4008 	ld	l,-16 (ix)
   5D10 DD 66 F1      [19] 4009 	ld	h,-15 (ix)
   5D13 DD 7E FE      [19] 4010 	ld	a,-2 (ix)
   5D16 B7            [ 4] 4011 	or	a, a
   5D17 28 06         [12] 4012 	jr	Z,00121$
   5D19 DD 6E F2      [19] 4013 	ld	l,-14 (ix)
   5D1C DD 66 F3      [19] 4014 	ld	h,-13 (ix)
   5D1F                    4015 00121$:
   5D1F CB 2C         [ 8] 4016 	sra	h
   5D21 CB 1D         [ 8] 4017 	rr	l
   5D23 CB 2C         [ 8] 4018 	sra	h
   5D25 CB 1D         [ 8] 4019 	rr	l
   5D27 DD 5E F4      [19] 4020 	ld	e,-12 (ix)
   5D2A DD 56 F5      [19] 4021 	ld	d,-11 (ix)
   5D2D 19            [11] 4022 	add	hl,de
   5D2E 7E            [ 7] 4023 	ld	a,(hl)
   5D2F D6 03         [ 7] 4024 	sub	a, #0x03
   5D31 28 10         [12] 4025 	jr	Z,00112$
   5D33                    4026 00101$:
                           4027 ;src/main.c:196: *posX=lx;
   5D33 DD 6E EE      [19] 4028 	ld	l,-18 (ix)
   5D36 DD 66 EF      [19] 4029 	ld	h,-17 (ix)
   5D39 DD 7E 08      [19] 4030 	ld	a,8 (ix)
   5D3C 77            [ 7] 4031 	ld	(hl),a
                           4032 ;src/main.c:197: *posY=ly;
   5D3D E1            [10] 4033 	pop	hl
   5D3E E5            [11] 4034 	push	hl
   5D3F DD 7E 09      [19] 4035 	ld	a,9 (ix)
   5D42 77            [ 7] 4036 	ld	(hl),a
   5D43                    4037 00112$:
   5D43 DD F9         [10] 4038 	ld	sp, ix
   5D45 DD E1         [14] 4039 	pop	ix
   5D47 C9            [10] 4040 	ret
                           4041 ;src/main.c:203: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           4042 ;	---------------------------------
                           4043 ; Function checkBoundsCollisions
                           4044 ; ---------------------------------
   5D48                    4045 _checkBoundsCollisions::
   5D48 DD E5         [15] 4046 	push	ix
   5D4A DD 21 00 00   [14] 4047 	ld	ix,#0
   5D4E DD 39         [15] 4048 	add	ix,sp
   5D50 21 F2 FF      [10] 4049 	ld	hl,#-14
   5D53 39            [11] 4050 	add	hl,sp
   5D54 F9            [ 6] 4051 	ld	sp,hl
                           4052 ;src/main.c:204: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   5D55 3A 0F 6F      [13] 4053 	ld	a,(#(_player + 0x0001) + 0)
   5D58 DD 77 F8      [19] 4054 	ld	-8 (ix), a
   5D5B 07            [ 4] 4055 	rlca
   5D5C 07            [ 4] 4056 	rlca
   5D5D 07            [ 4] 4057 	rlca
   5D5E 07            [ 4] 4058 	rlca
   5D5F E6 0F         [ 7] 4059 	and	a,#0x0F
   5D61 4F            [ 4] 4060 	ld	c,a
   5D62 06 00         [ 7] 4061 	ld	b,#0x00
   5D64 69            [ 4] 4062 	ld	l, c
   5D65 60            [ 4] 4063 	ld	h, b
   5D66 29            [11] 4064 	add	hl, hl
   5D67 29            [11] 4065 	add	hl, hl
   5D68 09            [11] 4066 	add	hl, bc
   5D69 29            [11] 4067 	add	hl, hl
   5D6A 29            [11] 4068 	add	hl, hl
   5D6B 3E 00         [ 7] 4069 	ld	a,#<(_scene)
   5D6D 85            [ 4] 4070 	add	a, l
   5D6E DD 77 F4      [19] 4071 	ld	-12 (ix),a
   5D71 3E 6E         [ 7] 4072 	ld	a,#>(_scene)
   5D73 8C            [ 4] 4073 	adc	a, h
   5D74 DD 77 F5      [19] 4074 	ld	-11 (ix),a
   5D77 21 0E 6F      [10] 4075 	ld	hl, #_player + 0
   5D7A 4E            [ 7] 4076 	ld	c,(hl)
   5D7B 79            [ 4] 4077 	ld	a,c
   5D7C 0F            [ 4] 4078 	rrca
   5D7D 0F            [ 4] 4079 	rrca
   5D7E E6 3F         [ 7] 4080 	and	a,#0x3F
   5D80 DD 77 F7      [19] 4081 	ld	-9 (ix), a
   5D83 DD 86 F4      [19] 4082 	add	a, -12 (ix)
   5D86 6F            [ 4] 4083 	ld	l,a
   5D87 3E 00         [ 7] 4084 	ld	a,#0x00
   5D89 DD 8E F5      [19] 4085 	adc	a, -11 (ix)
   5D8C 67            [ 4] 4086 	ld	h,a
   5D8D 7E            [ 7] 4087 	ld	a,(hl)
   5D8E DD 77 F6      [19] 4088 	ld	-10 (ix), a
   5D91 3D            [ 4] 4089 	dec	a
   5D92 CA A8 5E      [10] 4090 	jp	Z,00124$
                           4091 ;src/main.c:205: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5D95 06 00         [ 7] 4092 	ld	b,#0x00
   5D97 21 03 00      [10] 4093 	ld	hl,#0x0003
   5D9A 09            [11] 4094 	add	hl,bc
   5D9B DD 75 FB      [19] 4095 	ld	-5 (ix),l
   5D9E DD 74 FC      [19] 4096 	ld	-4 (ix),h
   5DA1 DD 7E FB      [19] 4097 	ld	a,-5 (ix)
   5DA4 DD 77 FE      [19] 4098 	ld	-2 (ix),a
   5DA7 DD 7E FC      [19] 4099 	ld	a,-4 (ix)
   5DAA DD 77 FF      [19] 4100 	ld	-1 (ix),a
   5DAD DD 7E FC      [19] 4101 	ld	a,-4 (ix)
   5DB0 07            [ 4] 4102 	rlca
   5DB1 E6 01         [ 7] 4103 	and	a,#0x01
   5DB3 DD 77 FD      [19] 4104 	ld	-3 (ix),a
   5DB6 21 06 00      [10] 4105 	ld	hl,#0x0006
   5DB9 09            [11] 4106 	add	hl,bc
   5DBA E3            [19] 4107 	ex	(sp), hl
   5DBB DD 7E FD      [19] 4108 	ld	a,-3 (ix)
   5DBE B7            [ 4] 4109 	or	a, a
   5DBF 28 0C         [12] 4110 	jr	Z,00132$
   5DC1 DD 7E F2      [19] 4111 	ld	a,-14 (ix)
   5DC4 DD 77 FE      [19] 4112 	ld	-2 (ix),a
   5DC7 DD 7E F3      [19] 4113 	ld	a,-13 (ix)
   5DCA DD 77 FF      [19] 4114 	ld	-1 (ix),a
   5DCD                    4115 00132$:
   5DCD DD 6E FE      [19] 4116 	ld	l,-2 (ix)
   5DD0 DD 66 FF      [19] 4117 	ld	h,-1 (ix)
   5DD3 CB 2C         [ 8] 4118 	sra	h
   5DD5 CB 1D         [ 8] 4119 	rr	l
   5DD7 CB 2C         [ 8] 4120 	sra	h
   5DD9 CB 1D         [ 8] 4121 	rr	l
   5DDB DD 5E F4      [19] 4122 	ld	e,-12 (ix)
   5DDE DD 56 F5      [19] 4123 	ld	d,-11 (ix)
   5DE1 19            [11] 4124 	add	hl,de
   5DE2 7E            [ 7] 4125 	ld	a,(hl)
   5DE3 3D            [ 4] 4126 	dec	a
   5DE4 CA A8 5E      [10] 4127 	jp	Z,00124$
                           4128 ;src/main.c:206: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   5DE7 DD 5E F8      [19] 4129 	ld	e,-8 (ix)
   5DEA 16 00         [ 7] 4130 	ld	d,#0x00
   5DEC 21 0E 00      [10] 4131 	ld	hl,#0x000E
   5DEF 19            [11] 4132 	add	hl,de
   5DF0 4D            [ 4] 4133 	ld	c,l
   5DF1 44            [ 4] 4134 	ld	b,h
   5DF2 DD 71 FE      [19] 4135 	ld	-2 (ix),c
   5DF5 DD 70 FF      [19] 4136 	ld	-1 (ix),b
   5DF8 78            [ 4] 4137 	ld	a,b
   5DF9 07            [ 4] 4138 	rlca
   5DFA E6 01         [ 7] 4139 	and	a,#0x01
   5DFC DD 77 F8      [19] 4140 	ld	-8 (ix),a
   5DFF 21 1D 00      [10] 4141 	ld	hl,#0x001D
   5E02 19            [11] 4142 	add	hl,de
   5E03 DD 75 F9      [19] 4143 	ld	-7 (ix),l
   5E06 DD 74 FA      [19] 4144 	ld	-6 (ix),h
   5E09 DD 7E F8      [19] 4145 	ld	a,-8 (ix)
   5E0C B7            [ 4] 4146 	or	a, a
   5E0D 28 0C         [12] 4147 	jr	Z,00133$
   5E0F DD 7E F9      [19] 4148 	ld	a,-7 (ix)
   5E12 DD 77 FE      [19] 4149 	ld	-2 (ix),a
   5E15 DD 7E FA      [19] 4150 	ld	a,-6 (ix)
   5E18 DD 77 FF      [19] 4151 	ld	-1 (ix),a
   5E1B                    4152 00133$:
   5E1B DD 6E FE      [19] 4153 	ld	l,-2 (ix)
   5E1E DD 66 FF      [19] 4154 	ld	h,-1 (ix)
   5E21 CB 2C         [ 8] 4155 	sra	h
   5E23 CB 1D         [ 8] 4156 	rr	l
   5E25 CB 2C         [ 8] 4157 	sra	h
   5E27 CB 1D         [ 8] 4158 	rr	l
   5E29 CB 2C         [ 8] 4159 	sra	h
   5E2B CB 1D         [ 8] 4160 	rr	l
   5E2D CB 2C         [ 8] 4161 	sra	h
   5E2F CB 1D         [ 8] 4162 	rr	l
   5E31 5D            [ 4] 4163 	ld	e, l
   5E32 54            [ 4] 4164 	ld	d, h
   5E33 29            [11] 4165 	add	hl, hl
   5E34 29            [11] 4166 	add	hl, hl
   5E35 19            [11] 4167 	add	hl, de
   5E36 29            [11] 4168 	add	hl, hl
   5E37 29            [11] 4169 	add	hl, hl
   5E38 11 00 6E      [10] 4170 	ld	de,#_scene
   5E3B 19            [11] 4171 	add	hl,de
   5E3C DD 5E F7      [19] 4172 	ld	e,-9 (ix)
   5E3F 16 00         [ 7] 4173 	ld	d,#0x00
   5E41 19            [11] 4174 	add	hl,de
   5E42 7E            [ 7] 4175 	ld	a,(hl)
   5E43 3D            [ 4] 4176 	dec	a
   5E44 28 62         [12] 4177 	jr	Z,00124$
                           4178 ;src/main.c:207: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5E46 DD 71 FE      [19] 4179 	ld	-2 (ix),c
   5E49 DD 70 FF      [19] 4180 	ld	-1 (ix),b
   5E4C DD 7E F8      [19] 4181 	ld	a,-8 (ix)
   5E4F B7            [ 4] 4182 	or	a, a
   5E50 28 0C         [12] 4183 	jr	Z,00134$
   5E52 DD 7E F9      [19] 4184 	ld	a,-7 (ix)
   5E55 DD 77 FE      [19] 4185 	ld	-2 (ix),a
   5E58 DD 7E FA      [19] 4186 	ld	a,-6 (ix)
   5E5B DD 77 FF      [19] 4187 	ld	-1 (ix),a
   5E5E                    4188 00134$:
   5E5E DD 6E FE      [19] 4189 	ld	l,-2 (ix)
   5E61 DD 66 FF      [19] 4190 	ld	h,-1 (ix)
   5E64 CB 2C         [ 8] 4191 	sra	h
   5E66 CB 1D         [ 8] 4192 	rr	l
   5E68 CB 2C         [ 8] 4193 	sra	h
   5E6A CB 1D         [ 8] 4194 	rr	l
   5E6C CB 2C         [ 8] 4195 	sra	h
   5E6E CB 1D         [ 8] 4196 	rr	l
   5E70 CB 2C         [ 8] 4197 	sra	h
   5E72 CB 1D         [ 8] 4198 	rr	l
   5E74 5D            [ 4] 4199 	ld	e, l
   5E75 54            [ 4] 4200 	ld	d, h
   5E76 29            [11] 4201 	add	hl, hl
   5E77 29            [11] 4202 	add	hl, hl
   5E78 19            [11] 4203 	add	hl, de
   5E79 29            [11] 4204 	add	hl, hl
   5E7A 29            [11] 4205 	add	hl, hl
   5E7B 3E 00         [ 7] 4206 	ld	a,#<(_scene)
   5E7D 85            [ 4] 4207 	add	a, l
   5E7E DD 77 FE      [19] 4208 	ld	-2 (ix),a
   5E81 3E 6E         [ 7] 4209 	ld	a,#>(_scene)
   5E83 8C            [ 4] 4210 	adc	a, h
   5E84 DD 77 FF      [19] 4211 	ld	-1 (ix),a
   5E87 DD 6E FB      [19] 4212 	ld	l,-5 (ix)
   5E8A DD 66 FC      [19] 4213 	ld	h,-4 (ix)
   5E8D DD 7E FD      [19] 4214 	ld	a,-3 (ix)
   5E90 B7            [ 4] 4215 	or	a, a
   5E91 28 02         [12] 4216 	jr	Z,00135$
   5E93 E1            [10] 4217 	pop	hl
   5E94 E5            [11] 4218 	push	hl
   5E95                    4219 00135$:
   5E95 CB 2C         [ 8] 4220 	sra	h
   5E97 CB 1D         [ 8] 4221 	rr	l
   5E99 CB 2C         [ 8] 4222 	sra	h
   5E9B CB 1D         [ 8] 4223 	rr	l
   5E9D DD 5E FE      [19] 4224 	ld	e,-2 (ix)
   5EA0 DD 56 FF      [19] 4225 	ld	d,-1 (ix)
   5EA3 19            [11] 4226 	add	hl,de
   5EA4 7E            [ 7] 4227 	ld	a,(hl)
   5EA5 3D            [ 4] 4228 	dec	a
   5EA6 20 10         [12] 4229 	jr	NZ,00125$
   5EA8                    4230 00124$:
                           4231 ;src/main.c:209: player.x=player.lx;
   5EA8 3A 10 6F      [13] 4232 	ld	a, (#_player + 2)
   5EAB 21 0E 6F      [10] 4233 	ld	hl,#_player
   5EAE 77            [ 7] 4234 	ld	(hl),a
                           4235 ;src/main.c:210: player.y=player.ly;
   5EAF 3A 11 6F      [13] 4236 	ld	a, (#_player + 3)
   5EB2 32 0F 6F      [13] 4237 	ld	(#(_player + 0x0001)),a
   5EB5 C3 14 61      [10] 4238 	jp	00130$
   5EB8                    4239 00125$:
                           4240 ;src/main.c:212: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5EB8 DD 7E F6      [19] 4241 	ld	a,-10 (ix)
   5EBB D6 02         [ 7] 4242 	sub	a, #0x02
   5EBD CA 60 5F      [10] 4243 	jp	Z,00118$
                           4244 ;src/main.c:213: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5EC0 DD 6E FB      [19] 4245 	ld	l,-5 (ix)
   5EC3 DD 66 FC      [19] 4246 	ld	h,-4 (ix)
   5EC6 DD 7E FD      [19] 4247 	ld	a,-3 (ix)
   5EC9 B7            [ 4] 4248 	or	a, a
   5ECA 28 02         [12] 4249 	jr	Z,00136$
   5ECC E1            [10] 4250 	pop	hl
   5ECD E5            [11] 4251 	push	hl
   5ECE                    4252 00136$:
   5ECE CB 2C         [ 8] 4253 	sra	h
   5ED0 CB 1D         [ 8] 4254 	rr	l
   5ED2 CB 2C         [ 8] 4255 	sra	h
   5ED4 CB 1D         [ 8] 4256 	rr	l
   5ED6 DD 5E F4      [19] 4257 	ld	e,-12 (ix)
   5ED9 DD 56 F5      [19] 4258 	ld	d,-11 (ix)
   5EDC 19            [11] 4259 	add	hl,de
   5EDD 7E            [ 7] 4260 	ld	a,(hl)
   5EDE D6 02         [ 7] 4261 	sub	a, #0x02
   5EE0 CA 60 5F      [10] 4262 	jp	Z,00118$
                           4263 ;src/main.c:214: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5EE3 69            [ 4] 4264 	ld	l, c
   5EE4 60            [ 4] 4265 	ld	h, b
   5EE5 DD 7E F8      [19] 4266 	ld	a,-8 (ix)
   5EE8 B7            [ 4] 4267 	or	a, a
   5EE9 28 06         [12] 4268 	jr	Z,00137$
   5EEB DD 6E F9      [19] 4269 	ld	l,-7 (ix)
   5EEE DD 66 FA      [19] 4270 	ld	h,-6 (ix)
   5EF1                    4271 00137$:
   5EF1 CB 2C         [ 8] 4272 	sra	h
   5EF3 CB 1D         [ 8] 4273 	rr	l
   5EF5 CB 2C         [ 8] 4274 	sra	h
   5EF7 CB 1D         [ 8] 4275 	rr	l
   5EF9 CB 2C         [ 8] 4276 	sra	h
   5EFB CB 1D         [ 8] 4277 	rr	l
   5EFD CB 2C         [ 8] 4278 	sra	h
   5EFF CB 1D         [ 8] 4279 	rr	l
   5F01 5D            [ 4] 4280 	ld	e, l
   5F02 54            [ 4] 4281 	ld	d, h
   5F03 29            [11] 4282 	add	hl, hl
   5F04 29            [11] 4283 	add	hl, hl
   5F05 19            [11] 4284 	add	hl, de
   5F06 29            [11] 4285 	add	hl, hl
   5F07 29            [11] 4286 	add	hl, hl
   5F08 11 00 6E      [10] 4287 	ld	de,#_scene
   5F0B 19            [11] 4288 	add	hl,de
   5F0C DD 5E F7      [19] 4289 	ld	e,-9 (ix)
   5F0F 16 00         [ 7] 4290 	ld	d,#0x00
   5F11 19            [11] 4291 	add	hl,de
   5F12 7E            [ 7] 4292 	ld	a,(hl)
   5F13 D6 02         [ 7] 4293 	sub	a, #0x02
   5F15 28 49         [12] 4294 	jr	Z,00118$
                           4295 ;src/main.c:215: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5F17 69            [ 4] 4296 	ld	l, c
   5F18 60            [ 4] 4297 	ld	h, b
   5F19 DD 7E F8      [19] 4298 	ld	a,-8 (ix)
   5F1C B7            [ 4] 4299 	or	a, a
   5F1D 28 06         [12] 4300 	jr	Z,00138$
   5F1F DD 6E F9      [19] 4301 	ld	l,-7 (ix)
   5F22 DD 66 FA      [19] 4302 	ld	h,-6 (ix)
   5F25                    4303 00138$:
   5F25 CB 2C         [ 8] 4304 	sra	h
   5F27 CB 1D         [ 8] 4305 	rr	l
   5F29 CB 2C         [ 8] 4306 	sra	h
   5F2B CB 1D         [ 8] 4307 	rr	l
   5F2D CB 2C         [ 8] 4308 	sra	h
   5F2F CB 1D         [ 8] 4309 	rr	l
   5F31 CB 2C         [ 8] 4310 	sra	h
   5F33 CB 1D         [ 8] 4311 	rr	l
   5F35 5D            [ 4] 4312 	ld	e, l
   5F36 54            [ 4] 4313 	ld	d, h
   5F37 29            [11] 4314 	add	hl, hl
   5F38 29            [11] 4315 	add	hl, hl
   5F39 19            [11] 4316 	add	hl, de
   5F3A 29            [11] 4317 	add	hl, hl
   5F3B 29            [11] 4318 	add	hl, hl
   5F3C 3E 00         [ 7] 4319 	ld	a,#<(_scene)
   5F3E 85            [ 4] 4320 	add	a, l
   5F3F 5F            [ 4] 4321 	ld	e,a
   5F40 3E 6E         [ 7] 4322 	ld	a,#>(_scene)
   5F42 8C            [ 4] 4323 	adc	a, h
   5F43 57            [ 4] 4324 	ld	d,a
   5F44 DD 6E FB      [19] 4325 	ld	l,-5 (ix)
   5F47 DD 66 FC      [19] 4326 	ld	h,-4 (ix)
   5F4A DD 7E FD      [19] 4327 	ld	a,-3 (ix)
   5F4D B7            [ 4] 4328 	or	a, a
   5F4E 28 02         [12] 4329 	jr	Z,00139$
   5F50 E1            [10] 4330 	pop	hl
   5F51 E5            [11] 4331 	push	hl
   5F52                    4332 00139$:
   5F52 CB 2C         [ 8] 4333 	sra	h
   5F54 CB 1D         [ 8] 4334 	rr	l
   5F56 CB 2C         [ 8] 4335 	sra	h
   5F58 CB 1D         [ 8] 4336 	rr	l
   5F5A 19            [11] 4337 	add	hl,de
   5F5B 7E            [ 7] 4338 	ld	a,(hl)
   5F5C D6 02         [ 7] 4339 	sub	a, #0x02
   5F5E 20 21         [12] 4340 	jr	NZ,00119$
   5F60                    4341 00118$:
                           4342 ;src/main.c:217: if(player.life < 3 && *corazon == 0){
   5F60 FD 21 14 6F   [14] 4343 	ld	iy,#_player + 6
   5F64 FD 5E 00      [19] 4344 	ld	e, 0 (iy)
   5F67 7B            [ 4] 4345 	ld	a,e
   5F68 D6 03         [ 7] 4346 	sub	a, #0x03
   5F6A D2 14 61      [10] 4347 	jp	NC,00130$
   5F6D DD 6E 04      [19] 4348 	ld	l,4 (ix)
   5F70 DD 66 05      [19] 4349 	ld	h,5 (ix)
   5F73 7E            [ 7] 4350 	ld	a,(hl)
   5F74 B7            [ 4] 4351 	or	a, a
   5F75 C2 14 61      [10] 4352 	jp	NZ,00130$
                           4353 ;src/main.c:218: player.life += 1;
   5F78 1C            [ 4] 4354 	inc	e
   5F79 FD 73 00      [19] 4355 	ld	0 (iy), e
                           4356 ;src/main.c:219: *corazon = 1;
   5F7C 36 01         [10] 4357 	ld	(hl),#0x01
   5F7E C3 14 61      [10] 4358 	jp	00130$
   5F81                    4359 00119$:
                           4360 ;src/main.c:222: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5F81 DD 7E F6      [19] 4361 	ld	a,-10 (ix)
   5F84 D6 05         [ 7] 4362 	sub	a, #0x05
   5F86 CA 29 60      [10] 4363 	jp	Z,00112$
                           4364 ;src/main.c:223: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5F89 DD 6E FB      [19] 4365 	ld	l,-5 (ix)
   5F8C DD 66 FC      [19] 4366 	ld	h,-4 (ix)
   5F8F DD 7E FD      [19] 4367 	ld	a,-3 (ix)
   5F92 B7            [ 4] 4368 	or	a, a
   5F93 28 02         [12] 4369 	jr	Z,00140$
   5F95 E1            [10] 4370 	pop	hl
   5F96 E5            [11] 4371 	push	hl
   5F97                    4372 00140$:
   5F97 CB 2C         [ 8] 4373 	sra	h
   5F99 CB 1D         [ 8] 4374 	rr	l
   5F9B CB 2C         [ 8] 4375 	sra	h
   5F9D CB 1D         [ 8] 4376 	rr	l
   5F9F DD 5E F4      [19] 4377 	ld	e,-12 (ix)
   5FA2 DD 56 F5      [19] 4378 	ld	d,-11 (ix)
   5FA5 19            [11] 4379 	add	hl,de
   5FA6 7E            [ 7] 4380 	ld	a,(hl)
   5FA7 D6 05         [ 7] 4381 	sub	a, #0x05
   5FA9 CA 29 60      [10] 4382 	jp	Z,00112$
                           4383 ;src/main.c:224: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5FAC 69            [ 4] 4384 	ld	l, c
   5FAD 60            [ 4] 4385 	ld	h, b
   5FAE DD 7E F8      [19] 4386 	ld	a,-8 (ix)
   5FB1 B7            [ 4] 4387 	or	a, a
   5FB2 28 06         [12] 4388 	jr	Z,00141$
   5FB4 DD 6E F9      [19] 4389 	ld	l,-7 (ix)
   5FB7 DD 66 FA      [19] 4390 	ld	h,-6 (ix)
   5FBA                    4391 00141$:
   5FBA CB 2C         [ 8] 4392 	sra	h
   5FBC CB 1D         [ 8] 4393 	rr	l
   5FBE CB 2C         [ 8] 4394 	sra	h
   5FC0 CB 1D         [ 8] 4395 	rr	l
   5FC2 CB 2C         [ 8] 4396 	sra	h
   5FC4 CB 1D         [ 8] 4397 	rr	l
   5FC6 CB 2C         [ 8] 4398 	sra	h
   5FC8 CB 1D         [ 8] 4399 	rr	l
   5FCA 5D            [ 4] 4400 	ld	e, l
   5FCB 54            [ 4] 4401 	ld	d, h
   5FCC 29            [11] 4402 	add	hl, hl
   5FCD 29            [11] 4403 	add	hl, hl
   5FCE 19            [11] 4404 	add	hl, de
   5FCF 29            [11] 4405 	add	hl, hl
   5FD0 29            [11] 4406 	add	hl, hl
   5FD1 11 00 6E      [10] 4407 	ld	de,#_scene
   5FD4 19            [11] 4408 	add	hl,de
   5FD5 DD 5E F7      [19] 4409 	ld	e,-9 (ix)
   5FD8 16 00         [ 7] 4410 	ld	d,#0x00
   5FDA 19            [11] 4411 	add	hl,de
   5FDB 7E            [ 7] 4412 	ld	a,(hl)
   5FDC D6 05         [ 7] 4413 	sub	a, #0x05
   5FDE 28 49         [12] 4414 	jr	Z,00112$
                           4415 ;src/main.c:225: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5FE0 69            [ 4] 4416 	ld	l, c
   5FE1 60            [ 4] 4417 	ld	h, b
   5FE2 DD 7E F8      [19] 4418 	ld	a,-8 (ix)
   5FE5 B7            [ 4] 4419 	or	a, a
   5FE6 28 06         [12] 4420 	jr	Z,00142$
   5FE8 DD 6E F9      [19] 4421 	ld	l,-7 (ix)
   5FEB DD 66 FA      [19] 4422 	ld	h,-6 (ix)
   5FEE                    4423 00142$:
   5FEE CB 2C         [ 8] 4424 	sra	h
   5FF0 CB 1D         [ 8] 4425 	rr	l
   5FF2 CB 2C         [ 8] 4426 	sra	h
   5FF4 CB 1D         [ 8] 4427 	rr	l
   5FF6 CB 2C         [ 8] 4428 	sra	h
   5FF8 CB 1D         [ 8] 4429 	rr	l
   5FFA CB 2C         [ 8] 4430 	sra	h
   5FFC CB 1D         [ 8] 4431 	rr	l
   5FFE 5D            [ 4] 4432 	ld	e, l
   5FFF 54            [ 4] 4433 	ld	d, h
   6000 29            [11] 4434 	add	hl, hl
   6001 29            [11] 4435 	add	hl, hl
   6002 19            [11] 4436 	add	hl, de
   6003 29            [11] 4437 	add	hl, hl
   6004 29            [11] 4438 	add	hl, hl
   6005 3E 00         [ 7] 4439 	ld	a,#<(_scene)
   6007 85            [ 4] 4440 	add	a, l
   6008 5F            [ 4] 4441 	ld	e,a
   6009 3E 6E         [ 7] 4442 	ld	a,#>(_scene)
   600B 8C            [ 4] 4443 	adc	a, h
   600C 57            [ 4] 4444 	ld	d,a
   600D DD 6E FB      [19] 4445 	ld	l,-5 (ix)
   6010 DD 66 FC      [19] 4446 	ld	h,-4 (ix)
   6013 DD 7E FD      [19] 4447 	ld	a,-3 (ix)
   6016 B7            [ 4] 4448 	or	a, a
   6017 28 02         [12] 4449 	jr	Z,00143$
   6019 E1            [10] 4450 	pop	hl
   601A E5            [11] 4451 	push	hl
   601B                    4452 00143$:
   601B CB 2C         [ 8] 4453 	sra	h
   601D CB 1D         [ 8] 4454 	rr	l
   601F CB 2C         [ 8] 4455 	sra	h
   6021 CB 1D         [ 8] 4456 	rr	l
   6023 19            [11] 4457 	add	hl,de
   6024 7E            [ 7] 4458 	ld	a,(hl)
   6025 D6 05         [ 7] 4459 	sub	a, #0x05
   6027 20 21         [12] 4460 	jr	NZ,00113$
   6029                    4461 00112$:
                           4462 ;src/main.c:227: if(player.bullets < 3 && *flecha == 0){
   6029 FD 21 18 6F   [14] 4463 	ld	iy,#_player + 10
   602D FD 5E 00      [19] 4464 	ld	e, 0 (iy)
   6030 7B            [ 4] 4465 	ld	a,e
   6031 D6 03         [ 7] 4466 	sub	a, #0x03
   6033 D2 14 61      [10] 4467 	jp	NC,00130$
   6036 DD 6E 06      [19] 4468 	ld	l,6 (ix)
   6039 DD 66 07      [19] 4469 	ld	h,7 (ix)
   603C 7E            [ 7] 4470 	ld	a,(hl)
   603D B7            [ 4] 4471 	or	a, a
   603E C2 14 61      [10] 4472 	jp	NZ,00130$
                           4473 ;src/main.c:228: player.bullets += 1;
   6041 1C            [ 4] 4474 	inc	e
   6042 FD 73 00      [19] 4475 	ld	0 (iy), e
                           4476 ;src/main.c:229: *flecha = 1;
   6045 36 01         [10] 4477 	ld	(hl),#0x01
   6047 C3 14 61      [10] 4478 	jp	00130$
   604A                    4479 00113$:
                           4480 ;src/main.c:231: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   604A DD 7E F6      [19] 4481 	ld	a,-10 (ix)
   604D D6 09         [ 7] 4482 	sub	a, #0x09
   604F CA FA 60      [10] 4483 	jp	Z,00107$
                           4484 ;src/main.c:232: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   6052 DD 6E FB      [19] 4485 	ld	l,-5 (ix)
   6055 DD 66 FC      [19] 4486 	ld	h,-4 (ix)
   6058 DD 7E FD      [19] 4487 	ld	a,-3 (ix)
   605B B7            [ 4] 4488 	or	a, a
   605C 28 02         [12] 4489 	jr	Z,00144$
   605E E1            [10] 4490 	pop	hl
   605F E5            [11] 4491 	push	hl
   6060                    4492 00144$:
   6060 CB 2C         [ 8] 4493 	sra	h
   6062 CB 1D         [ 8] 4494 	rr	l
   6064 CB 2C         [ 8] 4495 	sra	h
   6066 CB 1D         [ 8] 4496 	rr	l
   6068 DD 5E F4      [19] 4497 	ld	e,-12 (ix)
   606B DD 56 F5      [19] 4498 	ld	d,-11 (ix)
   606E 19            [11] 4499 	add	hl,de
   606F 7E            [ 7] 4500 	ld	a,(hl)
   6070 D6 09         [ 7] 4501 	sub	a, #0x09
   6072 CA FA 60      [10] 4502 	jp	Z,00107$
                           4503 ;src/main.c:233: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   6075 69            [ 4] 4504 	ld	l, c
   6076 60            [ 4] 4505 	ld	h, b
   6077 DD 7E F8      [19] 4506 	ld	a,-8 (ix)
   607A B7            [ 4] 4507 	or	a, a
   607B 28 06         [12] 4508 	jr	Z,00145$
   607D DD 6E F9      [19] 4509 	ld	l,-7 (ix)
   6080 DD 66 FA      [19] 4510 	ld	h,-6 (ix)
   6083                    4511 00145$:
   6083 CB 2C         [ 8] 4512 	sra	h
   6085 CB 1D         [ 8] 4513 	rr	l
   6087 CB 2C         [ 8] 4514 	sra	h
   6089 CB 1D         [ 8] 4515 	rr	l
   608B CB 2C         [ 8] 4516 	sra	h
   608D CB 1D         [ 8] 4517 	rr	l
   608F CB 2C         [ 8] 4518 	sra	h
   6091 CB 1D         [ 8] 4519 	rr	l
   6093 5D            [ 4] 4520 	ld	e, l
   6094 54            [ 4] 4521 	ld	d, h
   6095 29            [11] 4522 	add	hl, hl
   6096 29            [11] 4523 	add	hl, hl
   6097 19            [11] 4524 	add	hl, de
   6098 29            [11] 4525 	add	hl, hl
   6099 29            [11] 4526 	add	hl, hl
   609A 11 00 6E      [10] 4527 	ld	de,#_scene
   609D 19            [11] 4528 	add	hl,de
   609E DD 5E F7      [19] 4529 	ld	e,-9 (ix)
   60A1 16 00         [ 7] 4530 	ld	d,#0x00
   60A3 19            [11] 4531 	add	hl,de
   60A4 7E            [ 7] 4532 	ld	a,(hl)
   60A5 D6 09         [ 7] 4533 	sub	a, #0x09
   60A7 28 51         [12] 4534 	jr	Z,00107$
                           4535 ;src/main.c:234: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   60A9 DD 7E F8      [19] 4536 	ld	a,-8 (ix)
   60AC B7            [ 4] 4537 	or	a, a
   60AD 28 06         [12] 4538 	jr	Z,00146$
   60AF DD 4E F9      [19] 4539 	ld	c,-7 (ix)
   60B2 DD 46 FA      [19] 4540 	ld	b,-6 (ix)
   60B5                    4541 00146$:
   60B5 CB 28         [ 8] 4542 	sra	b
   60B7 CB 19         [ 8] 4543 	rr	c
   60B9 CB 28         [ 8] 4544 	sra	b
   60BB CB 19         [ 8] 4545 	rr	c
   60BD CB 28         [ 8] 4546 	sra	b
   60BF CB 19         [ 8] 4547 	rr	c
   60C1 CB 28         [ 8] 4548 	sra	b
   60C3 CB 19         [ 8] 4549 	rr	c
   60C5 69            [ 4] 4550 	ld	l, c
   60C6 60            [ 4] 4551 	ld	h, b
   60C7 29            [11] 4552 	add	hl, hl
   60C8 29            [11] 4553 	add	hl, hl
   60C9 09            [11] 4554 	add	hl, bc
   60CA 29            [11] 4555 	add	hl, hl
   60CB 29            [11] 4556 	add	hl, hl
   60CC 3E 00         [ 7] 4557 	ld	a,#<(_scene)
   60CE 85            [ 4] 4558 	add	a, l
   60CF DD 77 F9      [19] 4559 	ld	-7 (ix),a
   60D2 3E 6E         [ 7] 4560 	ld	a,#>(_scene)
   60D4 8C            [ 4] 4561 	adc	a, h
   60D5 DD 77 FA      [19] 4562 	ld	-6 (ix),a
   60D8 DD 6E FB      [19] 4563 	ld	l,-5 (ix)
   60DB DD 66 FC      [19] 4564 	ld	h,-4 (ix)
   60DE DD 7E FD      [19] 4565 	ld	a,-3 (ix)
   60E1 B7            [ 4] 4566 	or	a, a
   60E2 28 02         [12] 4567 	jr	Z,00147$
   60E4 E1            [10] 4568 	pop	hl
   60E5 E5            [11] 4569 	push	hl
   60E6                    4570 00147$:
   60E6 CB 2C         [ 8] 4571 	sra	h
   60E8 CB 1D         [ 8] 4572 	rr	l
   60EA CB 2C         [ 8] 4573 	sra	h
   60EC CB 1D         [ 8] 4574 	rr	l
   60EE DD 5E F9      [19] 4575 	ld	e,-7 (ix)
   60F1 DD 56 FA      [19] 4576 	ld	d,-6 (ix)
   60F4 19            [11] 4577 	add	hl,de
   60F5 7E            [ 7] 4578 	ld	a,(hl)
   60F6 D6 09         [ 7] 4579 	sub	a, #0x09
   60F8 20 1A         [12] 4580 	jr	NZ,00130$
   60FA                    4581 00107$:
                           4582 ;src/main.c:237: cpct_clearScreen(0);
   60FA 21 00 40      [10] 4583 	ld	hl,#0x4000
   60FD E5            [11] 4584 	push	hl
   60FE AF            [ 4] 4585 	xor	a, a
   60FF F5            [11] 4586 	push	af
   6100 33            [ 6] 4587 	inc	sp
   6101 26 C0         [ 7] 4588 	ld	h, #0xC0
   6103 E5            [11] 4589 	push	hl
   6104 CD 17 6C      [17] 4590 	call	_cpct_memset
                           4591 ;src/main.c:238: map+=1;
   6107 21 F1 6E      [10] 4592 	ld	hl, #_map+0
   610A 34            [11] 4593 	inc	(hl)
                           4594 ;src/main.c:239: drawMap(map);
   610B 3A F1 6E      [13] 4595 	ld	a,(_map)
   610E F5            [11] 4596 	push	af
   610F 33            [ 6] 4597 	inc	sp
   6110 CD C0 46      [17] 4598 	call	_drawMap
   6113 33            [ 6] 4599 	inc	sp
   6114                    4600 00130$:
   6114 DD F9         [10] 4601 	ld	sp, ix
   6116 DD E1         [14] 4602 	pop	ix
   6118 C9            [10] 4603 	ret
                           4604 ;src/main.c:248: void followPlayer(){
                           4605 ;	---------------------------------
                           4606 ; Function followPlayer
                           4607 ; ---------------------------------
   6119                    4608 _followPlayer::
   6119 DD E5         [15] 4609 	push	ix
   611B DD 21 00 00   [14] 4610 	ld	ix,#0
   611F DD 39         [15] 4611 	add	ix,sp
   6121 21 F6 FF      [10] 4612 	ld	hl,#-10
   6124 39            [11] 4613 	add	hl,sp
   6125 F9            [ 6] 4614 	ld	sp,hl
                           4615 ;src/main.c:251: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   6126 21 0F 6F      [10] 4616 	ld	hl, #(_player + 0x0001) + 0
   6129 56            [ 7] 4617 	ld	d,(hl)
   612A 3A 0E 6F      [13] 4618 	ld	a, (#_player + 0)
   612D D5            [11] 4619 	push	de
   612E 33            [ 6] 4620 	inc	sp
   612F F5            [11] 4621 	push	af
   6130 33            [ 6] 4622 	inc	sp
   6131 CD 1C 50      [17] 4623 	call	_detectPlayerRoom
   6134 F1            [10] 4624 	pop	af
   6135 DD 75 FD      [19] 4625 	ld	-3 (ix),l
   6138 21 24 6F      [10] 4626 	ld	hl, #_enemy + 11
   613B 56            [ 7] 4627 	ld	d,(hl)
   613C DD 7E FD      [19] 4628 	ld	a,-3 (ix)
   613F 92            [ 4] 4629 	sub	a, d
   6140 28 0C         [12] 4630 	jr	Z,00102$
                           4631 ;src/main.c:252: auxX = enemy.seenX;
   6142 3A 25 6F      [13] 4632 	ld	a,(#_enemy + 12)
   6145 DD 77 FD      [19] 4633 	ld	-3 (ix),a
                           4634 ;src/main.c:253: auxY = enemy.seenY;
   6148 21 26 6F      [10] 4635 	ld	hl, #_enemy + 13
   614B 4E            [ 7] 4636 	ld	c,(hl)
   614C 18 0B         [12] 4637 	jr	00103$
   614E                    4638 00102$:
                           4639 ;src/main.c:255: auxX = player.x;
   614E 21 0E 6F      [10] 4640 	ld	hl, #_player + 0
   6151 7E            [ 7] 4641 	ld	a,(hl)
   6152 DD 77 FD      [19] 4642 	ld	-3 (ix),a
                           4643 ;src/main.c:256: auxY = player.y;
   6155 21 0F 6F      [10] 4644 	ld	hl, #(_player + 0x0001) + 0
   6158 4E            [ 7] 4645 	ld	c,(hl)
   6159                    4646 00103$:
                           4647 ;src/main.c:292: if(temp%2==0){
   6159 3A F0 6E      [13] 4648 	ld	a,(#_temp + 0)
   615C E6 01         [ 7] 4649 	and	a, #0x01
   615E DD 77 FC      [19] 4650 	ld	-4 (ix),a
                           4651 ;src/main.c:293: if(auxX < enemy.x){
   6161 21 19 6F      [10] 4652 	ld	hl, #_enemy + 0
   6164 5E            [ 7] 4653 	ld	e,(hl)
                           4654 ;src/main.c:294: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.x-=1;
   6165 3A 1A 6F      [13] 4655 	ld	a,(#(_enemy + 0x0001) + 0)
   6168 DD 77 FE      [19] 4656 	ld	-2 (ix),a
   616B 7B            [ 4] 4657 	ld	a,e
   616C 0F            [ 4] 4658 	rrca
   616D 0F            [ 4] 4659 	rrca
   616E E6 3F         [ 7] 4660 	and	a,#0x3F
   6170 DD 77 FF      [19] 4661 	ld	-1 (ix),a
                           4662 ;src/main.c:297: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1) enemy.x+=1;
   6173 DD 73 FA      [19] 4663 	ld	-6 (ix),e
   6176 DD 36 FB 00   [19] 4664 	ld	-5 (ix),#0x00
                           4665 ;src/main.c:294: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.x-=1;
   617A DD 7E FE      [19] 4666 	ld	a,-2 (ix)
   617D 07            [ 4] 4667 	rlca
   617E 07            [ 4] 4668 	rlca
   617F 07            [ 4] 4669 	rlca
   6180 07            [ 4] 4670 	rlca
   6181 E6 0F         [ 7] 4671 	and	a,#0x0F
   6183 D5            [11] 4672 	push	de
   6184 5F            [ 4] 4673 	ld	e,a
   6185 16 00         [ 7] 4674 	ld	d,#0x00
   6187 6B            [ 4] 4675 	ld	l, e
   6188 62            [ 4] 4676 	ld	h, d
   6189 29            [11] 4677 	add	hl, hl
   618A 29            [11] 4678 	add	hl, hl
   618B 19            [11] 4679 	add	hl, de
   618C 29            [11] 4680 	add	hl, hl
   618D 29            [11] 4681 	add	hl, hl
   618E D1            [10] 4682 	pop	de
   618F DD 75 F8      [19] 4683 	ld	-8 (ix),l
   6192 DD 74 F9      [19] 4684 	ld	-7 (ix),h
                           4685 ;src/main.c:292: if(temp%2==0){
   6195 DD 7E FC      [19] 4686 	ld	a,-4 (ix)
   6198 B7            [ 4] 4687 	or	a, a
   6199 20 69         [12] 4688 	jr	NZ,00119$
                           4689 ;src/main.c:293: if(auxX < enemy.x){
   619B DD 7E FD      [19] 4690 	ld	a,-3 (ix)
   619E 93            [ 4] 4691 	sub	a, e
   619F 30 1D         [12] 4692 	jr	NC,00109$
                           4693 ;src/main.c:294: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.x-=1;
   61A1 21 00 6E      [10] 4694 	ld	hl,#_scene+0
   61A4 DD 4E F8      [19] 4695 	ld	c,-8 (ix)
   61A7 DD 46 F9      [19] 4696 	ld	b,-7 (ix)
   61AA 09            [11] 4697 	add	hl,bc
   61AB DD 4E FF      [19] 4698 	ld	c,-1 (ix)
   61AE 06 00         [ 7] 4699 	ld	b,#0x00
   61B0 09            [11] 4700 	add	hl,bc
   61B1 7E            [ 7] 4701 	ld	a,(hl)
   61B2 3D            [ 4] 4702 	dec	a
   61B3 CA 7E 62      [10] 4703 	jp	Z,00121$
   61B6 1D            [ 4] 4704 	dec	e
   61B7 21 19 6F      [10] 4705 	ld	hl,#_enemy
   61BA 73            [ 7] 4706 	ld	(hl),e
   61BB C3 7E 62      [10] 4707 	jp	00121$
   61BE                    4708 00109$:
                           4709 ;src/main.c:297: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1) enemy.x+=1;
   61BE DD 7E F8      [19] 4710 	ld	a,-8 (ix)
   61C1 C6 00         [ 7] 4711 	add	a, #<(_scene)
   61C3 4F            [ 4] 4712 	ld	c,a
   61C4 DD 7E F9      [19] 4713 	ld	a,-7 (ix)
   61C7 CE 6E         [ 7] 4714 	adc	a, #>(_scene)
   61C9 47            [ 4] 4715 	ld	b,a
   61CA DD 7E FA      [19] 4716 	ld	a,-6 (ix)
   61CD C6 04         [ 7] 4717 	add	a, #0x04
   61CF DD 77 F6      [19] 4718 	ld	-10 (ix),a
   61D2 DD 7E FB      [19] 4719 	ld	a,-5 (ix)
   61D5 CE 00         [ 7] 4720 	adc	a, #0x00
   61D7 DD 77 F7      [19] 4721 	ld	-9 (ix),a
   61DA E1            [10] 4722 	pop	hl
   61DB E5            [11] 4723 	push	hl
   61DC DD CB F7 7E   [20] 4724 	bit	7, -9 (ix)
   61E0 28 0C         [12] 4725 	jr	Z,00123$
   61E2 DD 7E FA      [19] 4726 	ld	a,-6 (ix)
   61E5 C6 07         [ 7] 4727 	add	a, #0x07
   61E7 6F            [ 4] 4728 	ld	l,a
   61E8 DD 7E FB      [19] 4729 	ld	a,-5 (ix)
   61EB CE 00         [ 7] 4730 	adc	a, #0x00
   61ED 67            [ 4] 4731 	ld	h,a
   61EE                    4732 00123$:
   61EE CB 2C         [ 8] 4733 	sra	h
   61F0 CB 1D         [ 8] 4734 	rr	l
   61F2 CB 2C         [ 8] 4735 	sra	h
   61F4 CB 1D         [ 8] 4736 	rr	l
   61F6 09            [11] 4737 	add	hl,bc
   61F7 7E            [ 7] 4738 	ld	a,(hl)
   61F8 3D            [ 4] 4739 	dec	a
   61F9 CA 7E 62      [10] 4740 	jp	Z,00121$
   61FC 1C            [ 4] 4741 	inc	e
   61FD 21 19 6F      [10] 4742 	ld	hl,#_enemy
   6200 73            [ 7] 4743 	ld	(hl),e
   6201 C3 7E 62      [10] 4744 	jp	00121$
   6204                    4745 00119$:
                           4746 ;src/main.c:300: if(auxY < enemy.y){
   6204 79            [ 4] 4747 	ld	a,c
   6205 DD 96 FE      [19] 4748 	sub	a, -2 (ix)
   6208 30 1E         [12] 4749 	jr	NC,00116$
                           4750 ;src/main.c:301: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != 1) enemy.y-=1;
   620A 21 00 6E      [10] 4751 	ld	hl,#_scene+0
   620D DD 5E F8      [19] 4752 	ld	e,-8 (ix)
   6210 DD 56 F9      [19] 4753 	ld	d,-7 (ix)
   6213 19            [11] 4754 	add	hl,de
   6214 DD 5E FF      [19] 4755 	ld	e,-1 (ix)
   6217 16 00         [ 7] 4756 	ld	d,#0x00
   6219 19            [11] 4757 	add	hl,de
   621A 7E            [ 7] 4758 	ld	a,(hl)
   621B 3D            [ 4] 4759 	dec	a
   621C 28 60         [12] 4760 	jr	Z,00121$
   621E DD 56 FE      [19] 4761 	ld	d,-2 (ix)
   6221 15            [ 4] 4762 	dec	d
   6222 21 1A 6F      [10] 4763 	ld	hl,#(_enemy + 0x0001)
   6225 72            [ 7] 4764 	ld	(hl),d
   6226 18 56         [12] 4765 	jr	00121$
   6228                    4766 00116$:
                           4767 ;src/main.c:304: if(scene[(enemy.y+tilewidth)/tileheight][(enemy.x-1)/tilewidth] != 1) enemy.y+=1;
   6228 DD 4E FE      [19] 4768 	ld	c,-2 (ix)
   622B 06 00         [ 7] 4769 	ld	b,#0x00
   622D 21 04 00      [10] 4770 	ld	hl,#0x0004
   6230 09            [11] 4771 	add	hl,bc
   6231 5C            [ 4] 4772 	ld	e,h
   6232 CB 7B         [ 8] 4773 	bit	7, e
   6234 28 04         [12] 4774 	jr	Z,00124$
   6236 21 13 00      [10] 4775 	ld	hl,#0x0013
   6239 09            [11] 4776 	add	hl,bc
   623A                    4777 00124$:
   623A CB 2C         [ 8] 4778 	sra	h
   623C CB 1D         [ 8] 4779 	rr	l
   623E CB 2C         [ 8] 4780 	sra	h
   6240 CB 1D         [ 8] 4781 	rr	l
   6242 CB 2C         [ 8] 4782 	sra	h
   6244 CB 1D         [ 8] 4783 	rr	l
   6246 CB 2C         [ 8] 4784 	sra	h
   6248 CB 1D         [ 8] 4785 	rr	l
   624A 4D            [ 4] 4786 	ld	c, l
   624B 44            [ 4] 4787 	ld	b, h
   624C 29            [11] 4788 	add	hl, hl
   624D 29            [11] 4789 	add	hl, hl
   624E 09            [11] 4790 	add	hl, bc
   624F 29            [11] 4791 	add	hl, hl
   6250 29            [11] 4792 	add	hl, hl
   6251 11 00 6E      [10] 4793 	ld	de,#_scene
   6254 19            [11] 4794 	add	hl,de
   6255 DD 4E FA      [19] 4795 	ld	c,-6 (ix)
   6258 DD 46 FB      [19] 4796 	ld	b,-5 (ix)
   625B 0B            [ 6] 4797 	dec	bc
   625C 59            [ 4] 4798 	ld	e, c
   625D 50            [ 4] 4799 	ld	d, b
   625E CB 78         [ 8] 4800 	bit	7, b
   6260 28 08         [12] 4801 	jr	Z,00125$
   6262 DD 5E FA      [19] 4802 	ld	e,-6 (ix)
   6265 DD 56 FB      [19] 4803 	ld	d,-5 (ix)
   6268 13            [ 6] 4804 	inc	de
   6269 13            [ 6] 4805 	inc	de
   626A                    4806 00125$:
   626A CB 2A         [ 8] 4807 	sra	d
   626C CB 1B         [ 8] 4808 	rr	e
   626E CB 2A         [ 8] 4809 	sra	d
   6270 CB 1B         [ 8] 4810 	rr	e
   6272 19            [11] 4811 	add	hl,de
   6273 7E            [ 7] 4812 	ld	a,(hl)
   6274 3D            [ 4] 4813 	dec	a
   6275 28 07         [12] 4814 	jr	Z,00121$
   6277 DD 7E FE      [19] 4815 	ld	a,-2 (ix)
   627A 3C            [ 4] 4816 	inc	a
   627B 32 1A 6F      [13] 4817 	ld	(#(_enemy + 0x0001)),a
   627E                    4818 00121$:
   627E DD F9         [10] 4819 	ld	sp, ix
   6280 DD E1         [14] 4820 	pop	ix
   6282 C9            [10] 4821 	ret
                           4822 ;src/main.c:311: u8 vissionSensor(){
                           4823 ;	---------------------------------
                           4824 ; Function vissionSensor
                           4825 ; ---------------------------------
   6283                    4826 _vissionSensor::
   6283 DD E5         [15] 4827 	push	ix
   6285 DD 21 00 00   [14] 4828 	ld	ix,#0
   6289 DD 39         [15] 4829 	add	ix,sp
   628B 21 F9 FF      [10] 4830 	ld	hl,#-7
   628E 39            [11] 4831 	add	hl,sp
   628F F9            [ 6] 4832 	ld	sp,hl
                           4833 ;src/main.c:312: u8 following = 0;
   6290 DD 36 FC 00   [19] 4834 	ld	-4 (ix),#0x00
                           4835 ;src/main.c:313: u8 cx = enemy.x/tilewidth;
   6294 3A 19 6F      [13] 4836 	ld	a, (#_enemy + 0)
   6297 0F            [ 4] 4837 	rrca
   6298 0F            [ 4] 4838 	rrca
   6299 E6 3F         [ 7] 4839 	and	a,#0x3F
   629B DD 77 F9      [19] 4840 	ld	-7 (ix),a
                           4841 ;src/main.c:314: u8 cy = enemy.y/tilewidth;
   629E 3A 1A 6F      [13] 4842 	ld	a, (#(_enemy + 0x0001) + 0)
   62A1 0F            [ 4] 4843 	rrca
   62A2 0F            [ 4] 4844 	rrca
   62A3 E6 3F         [ 7] 4845 	and	a,#0x3F
   62A5 4F            [ 4] 4846 	ld	c,a
                           4847 ;src/main.c:315: u8 pcx = player.x/tilewidth;
   62A6 3A 0E 6F      [13] 4848 	ld	a, (#_player + 0)
   62A9 0F            [ 4] 4849 	rrca
   62AA 0F            [ 4] 4850 	rrca
   62AB E6 3F         [ 7] 4851 	and	a,#0x3F
   62AD DD 77 FF      [19] 4852 	ld	-1 (ix),a
                           4853 ;src/main.c:316: u8 pcy = player.y/tilewidth;
   62B0 3A 0F 6F      [13] 4854 	ld	a, (#(_player + 0x0001) + 0)
   62B3 0F            [ 4] 4855 	rrca
   62B4 0F            [ 4] 4856 	rrca
   62B5 E6 3F         [ 7] 4857 	and	a,#0x3F
   62B7 DD 77 FE      [19] 4858 	ld	-2 (ix),a
                           4859 ;src/main.c:319: for(i=0;i<3;i++){
   62BA 1E 00         [ 7] 4860 	ld	e,#0x00
   62BC                    4861 00107$:
                           4862 ;src/main.c:320: lex = cx - i;
   62BC DD 7E F9      [19] 4863 	ld	a,-7 (ix)
   62BF 93            [ 4] 4864 	sub	a, e
   62C0 DD 77 FD      [19] 4865 	ld	-3 (ix),a
                           4866 ;src/main.c:321: ley = cy - i;
   62C3 79            [ 4] 4867 	ld	a,c
   62C4 93            [ 4] 4868 	sub	a, e
   62C5 DD 77 FA      [19] 4869 	ld	-6 (ix),a
                           4870 ;src/main.c:322: mex = cx + i;
   62C8 DD 7E F9      [19] 4871 	ld	a,-7 (ix)
   62CB 83            [ 4] 4872 	add	a, e
   62CC DD 77 FB      [19] 4873 	ld	-5 (ix),a
                           4874 ;src/main.c:323: mey = cy + i;
   62CF 79            [ 4] 4875 	ld	a,c
   62D0 83            [ 4] 4876 	add	a, e
   62D1 57            [ 4] 4877 	ld	d,a
                           4878 ;src/main.c:324: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
   62D2 DD 7E FD      [19] 4879 	ld	a,-3 (ix)
   62D5 DD 96 FF      [19] 4880 	sub	a, -1 (ix)
   62D8 28 16         [12] 4881 	jr	Z,00101$
   62DA DD 7E FA      [19] 4882 	ld	a,-6 (ix)
   62DD DD 96 FE      [19] 4883 	sub	a, -2 (ix)
   62E0 28 0E         [12] 4884 	jr	Z,00101$
   62E2 DD 7E FB      [19] 4885 	ld	a,-5 (ix)
   62E5 DD 96 FF      [19] 4886 	sub	a, -1 (ix)
   62E8 28 06         [12] 4887 	jr	Z,00101$
   62EA DD 7E FE      [19] 4888 	ld	a,-2 (ix)
   62ED 92            [ 4] 4889 	sub	a, d
   62EE 20 04         [12] 4890 	jr	NZ,00108$
   62F0                    4891 00101$:
                           4892 ;src/main.c:325: following = 1;
   62F0 DD 36 FC 01   [19] 4893 	ld	-4 (ix),#0x01
   62F4                    4894 00108$:
                           4895 ;src/main.c:319: for(i=0;i<3;i++){
   62F4 1C            [ 4] 4896 	inc	e
   62F5 7B            [ 4] 4897 	ld	a,e
   62F6 D6 03         [ 7] 4898 	sub	a, #0x03
   62F8 38 C2         [12] 4899 	jr	C,00107$
                           4900 ;src/main.c:329: return following;
   62FA DD 6E FC      [19] 4901 	ld	l,-4 (ix)
   62FD DD F9         [10] 4902 	ld	sp, ix
   62FF DD E1         [14] 4903 	pop	ix
   6301 C9            [10] 4904 	ret
                           4905 ;src/main.c:333: void shoot(){
                           4906 ;	---------------------------------
                           4907 ; Function shoot
                           4908 ; ---------------------------------
   6302                    4909 _shoot::
   6302 DD E5         [15] 4910 	push	ix
   6304 DD 21 00 00   [14] 4911 	ld	ix,#0
   6308 DD 39         [15] 4912 	add	ix,sp
   630A 3B            [ 6] 4913 	dec	sp
                           4914 ;src/main.c:334: u8 *spr = flecha_dcha,xs=2,ys=8;
   630B 01 D8 68      [10] 4915 	ld	bc,#_flecha_dcha
   630E 1E 02         [ 7] 4916 	ld	e,#0x02
   6310 DD 36 FF 08   [19] 4917 	ld	-1 (ix),#0x08
                           4918 ;src/main.c:335: switch(enemy.dir){
   6314 3A 22 6F      [13] 4919 	ld	a,(#(_enemy + 0x0009) + 0)
   6317 FE 02         [ 7] 4920 	cp	a,#0x02
   6319 28 24         [12] 4921 	jr	Z,00103$
   631B FE 04         [ 7] 4922 	cp	a,#0x04
   631D 28 15         [12] 4923 	jr	Z,00102$
   631F FE 06         [ 7] 4924 	cp	a,#0x06
   6321 28 06         [12] 4925 	jr	Z,00101$
   6323 D6 08         [ 7] 4926 	sub	a, #0x08
   6325 28 23         [12] 4927 	jr	Z,00104$
   6327 18 2A         [12] 4928 	jr	00105$
                           4929 ;src/main.c:336: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   6329                    4930 00101$:
   6329 01 D8 68      [10] 4931 	ld	bc,#_flecha_dcha
   632C 1E 04         [ 7] 4932 	ld	e,#0x04
   632E DD 36 FF 04   [19] 4933 	ld	-1 (ix),#0x04
   6332 18 1F         [12] 4934 	jr	00105$
                           4935 ;src/main.c:337: case 4: spr = flecha_izda; xs=4;ys=4; break;
   6334                    4936 00102$:
   6334 01 F8 68      [10] 4937 	ld	bc,#_flecha_izda+0
   6337 1E 04         [ 7] 4938 	ld	e,#0x04
   6339 DD 36 FF 04   [19] 4939 	ld	-1 (ix),#0x04
   633D 18 14         [12] 4940 	jr	00105$
                           4941 ;src/main.c:338: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   633F                    4942 00103$:
   633F 01 B8 68      [10] 4943 	ld	bc,#_flecha_abajo+0
   6342 1E 02         [ 7] 4944 	ld	e,#0x02
   6344 DD 36 FF 08   [19] 4945 	ld	-1 (ix),#0x08
   6348 18 09         [12] 4946 	jr	00105$
                           4947 ;src/main.c:339: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   634A                    4948 00104$:
   634A 01 98 68      [10] 4949 	ld	bc,#_flecha_arriba+0
   634D 1E 02         [ 7] 4950 	ld	e,#0x02
   634F DD 36 FF 08   [19] 4951 	ld	-1 (ix),#0x08
                           4952 ;src/main.c:340: }
   6353                    4953 00105$:
                           4954 ;src/main.c:341: earrow.x = enemy.x;
   6353 3A 19 6F      [13] 4955 	ld	a, (#_enemy + 0)
   6356 32 04 6F      [13] 4956 	ld	(#_earrow),a
                           4957 ;src/main.c:342: earrow.y = enemy.y+8;
   6359 3A 1A 6F      [13] 4958 	ld	a, (#_enemy + 1)
   635C C6 08         [ 7] 4959 	add	a, #0x08
   635E 32 05 6F      [13] 4960 	ld	(#(_earrow + 0x0001)),a
                           4961 ;src/main.c:343: earrow.x = earrow.x;
   6361 21 04 6F      [10] 4962 	ld	hl, #_earrow + 0
   6364 56            [ 7] 4963 	ld	d,(hl)
   6365 21 04 6F      [10] 4964 	ld	hl,#_earrow
   6368 72            [ 7] 4965 	ld	(hl),d
                           4966 ;src/main.c:344: earrow.y = earrow.y;
   6369 32 05 6F      [13] 4967 	ld	(#(_earrow + 0x0001)),a
                           4968 ;src/main.c:345: earrow.sprite = spr;
   636C ED 43 08 6F   [20] 4969 	ld	((_earrow + 0x0004)), bc
                           4970 ;src/main.c:346: earrow.vivo = 1;
   6370 21 0A 6F      [10] 4971 	ld	hl,#_earrow + 6
   6373 36 01         [10] 4972 	ld	(hl),#0x01
                           4973 ;src/main.c:347: earrow.dir = enemy.dir;
   6375 01 0B 6F      [10] 4974 	ld	bc,#_earrow + 7
   6378 3A 22 6F      [13] 4975 	ld	a, (#(_enemy + 0x0009) + 0)
   637B 02            [ 7] 4976 	ld	(bc),a
                           4977 ;src/main.c:348: earrow.sizeX = xs;
   637C 21 0C 6F      [10] 4978 	ld	hl,#_earrow + 8
   637F 73            [ 7] 4979 	ld	(hl),e
                           4980 ;src/main.c:349: earrow.sizeY = ys;
   6380 21 0D 6F      [10] 4981 	ld	hl,#_earrow + 9
   6383 DD 7E FF      [19] 4982 	ld	a,-1 (ix)
   6386 77            [ 7] 4983 	ld	(hl),a
                           4984 ;src/main.c:350: enemy.bullets--;
   6387 21 23 6F      [10] 4985 	ld	hl,#_enemy + 10
   638A 56            [ 7] 4986 	ld	d,(hl)
   638B 15            [ 4] 4987 	dec	d
   638C 72            [ 7] 4988 	ld	(hl),d
                           4989 ;src/main.c:351: shooted = 1;
   638D 21 F5 6E      [10] 4990 	ld	hl,#_shooted + 0
   6390 36 01         [10] 4991 	ld	(hl), #0x01
   6392 33            [ 6] 4992 	inc	sp
   6393 DD E1         [14] 4993 	pop	ix
   6395 C9            [10] 4994 	ret
                           4995 ;src/main.c:360: void arrowCheckings(u8 c){
                           4996 ;	---------------------------------
                           4997 ; Function arrowCheckings
                           4998 ; ---------------------------------
   6396                    4999 _arrowCheckings::
   6396 DD E5         [15] 5000 	push	ix
   6398 DD 21 00 00   [14] 5001 	ld	ix,#0
   639C DD 39         [15] 5002 	add	ix,sp
   639E 3B            [ 6] 5003 	dec	sp
                           5004 ;src/main.c:362: if(c == 0){
   639F DD 7E 04      [19] 5005 	ld	a,4 (ix)
   63A2 B7            [ 4] 5006 	or	a, a
   63A3 C2 29 64      [10] 5007 	jp	NZ,00122$
                           5008 ;src/main.c:363: if(arrow == 1){
   63A6 3A F4 6E      [13] 5009 	ld	a,(#_arrow + 0)
   63A9 3D            [ 4] 5010 	dec	a
   63AA C2 A7 64      [10] 5011 	jp	NZ,00124$
                           5012 ;src/main.c:364: moveObject(0);
   63AD AF            [ 4] 5013 	xor	a, a
   63AE F5            [11] 5014 	push	af
   63AF 33            [ 6] 5015 	inc	sp
   63B0 CD 70 5A      [17] 5016 	call	_moveObject
   63B3 33            [ 6] 5017 	inc	sp
                           5018 ;src/main.c:365: bound = checkArrowCollisions();
   63B4 CD B3 53      [17] 5019 	call	_checkArrowCollisions
   63B7 FD 21 F7 6E   [14] 5020 	ld	iy,#_bound
   63BB FD 75 00      [19] 5021 	ld	0 (iy),l
                           5022 ;src/main.c:367: if(parrow.dir == 2 || parrow.dir == 8) atkObj = 21;
   63BE 3A 01 6F      [13] 5023 	ld	a,(#_parrow + 7)
   63C1 FE 02         [ 7] 5024 	cp	a,#0x02
   63C3 28 04         [12] 5025 	jr	Z,00101$
   63C5 D6 08         [ 7] 5026 	sub	a, #0x08
   63C7 20 04         [12] 5027 	jr	NZ,00102$
   63C9                    5028 00101$:
   63C9 0E 15         [ 7] 5029 	ld	c,#0x15
   63CB 18 02         [12] 5030 	jr	00103$
   63CD                    5031 00102$:
                           5032 ;src/main.c:368: else atkObj = 22;
   63CD 0E 16         [ 7] 5033 	ld	c,#0x16
   63CF                    5034 00103$:
                           5035 ;src/main.c:370: if(enemy.life > 0 && checkCollisions(parrow.x, parrow.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
   63CF 3A 21 6F      [13] 5036 	ld	a, (#(_enemy + 0x0008) + 0)
   63D2 B7            [ 4] 5037 	or	a, a
   63D3 CA A7 64      [10] 5038 	jp	Z,00124$
   63D6 21 1A 6F      [10] 5039 	ld	hl, #(_enemy + 0x0001) + 0
   63D9 46            [ 7] 5040 	ld	b,(hl)
   63DA 21 19 6F      [10] 5041 	ld	hl, #_enemy + 0
   63DD 5E            [ 7] 5042 	ld	e,(hl)
   63DE 3A FB 6E      [13] 5043 	ld	a,(#_parrow + 1)
   63E1 DD 77 FF      [19] 5044 	ld	-1 (ix),a
   63E4 21 FA 6E      [10] 5045 	ld	hl, #_parrow + 0
   63E7 56            [ 7] 5046 	ld	d,(hl)
   63E8 79            [ 4] 5047 	ld	a,c
   63E9 F5            [11] 5048 	push	af
   63EA 33            [ 6] 5049 	inc	sp
   63EB C5            [11] 5050 	push	bc
   63EC 33            [ 6] 5051 	inc	sp
   63ED 7B            [ 4] 5052 	ld	a,e
   63EE F5            [11] 5053 	push	af
   63EF 33            [ 6] 5054 	inc	sp
   63F0 DD 7E FF      [19] 5055 	ld	a,-1 (ix)
   63F3 F5            [11] 5056 	push	af
   63F4 33            [ 6] 5057 	inc	sp
   63F5 D5            [11] 5058 	push	de
   63F6 33            [ 6] 5059 	inc	sp
   63F7 CD 92 52      [17] 5060 	call	_checkCollisions
   63FA F1            [10] 5061 	pop	af
   63FB F1            [10] 5062 	pop	af
   63FC 33            [ 6] 5063 	inc	sp
   63FD 2D            [ 4] 5064 	dec	l
   63FE C2 A7 64      [10] 5065 	jp	NZ,00124$
   6401 3A F7 6E      [13] 5066 	ld	a,(#_bound + 0)
   6404 B7            [ 4] 5067 	or	a, a
   6405 C2 A7 64      [10] 5068 	jp	NZ,00124$
                           5069 ;src/main.c:371: enemy.life -= 1;
   6408 3A 21 6F      [13] 5070 	ld	a, (#(_enemy + 0x0008) + 0)
   640B C6 FF         [ 7] 5071 	add	a,#0xFF
   640D 32 21 6F      [13] 5072 	ld	(#(_enemy + 0x0008)),a
                           5073 ;src/main.c:372: enemy.x = enemy.ox;
   6410 3A 1D 6F      [13] 5074 	ld	a, (#_enemy + 4)
   6413 32 19 6F      [13] 5075 	ld	(#_enemy),a
                           5076 ;src/main.c:373: enemy.y = enemy.oy;
   6416 3A 1E 6F      [13] 5077 	ld	a, (#_enemy + 5)
   6419 32 1A 6F      [13] 5078 	ld	(#(_enemy + 0x0001)),a
                           5079 ;src/main.c:374: parrow.vivo = 0;
   641C 21 00 6F      [10] 5080 	ld	hl,#_parrow + 6
   641F 36 00         [10] 5081 	ld	(hl),#0x00
                           5082 ;src/main.c:375: bound = 1;
   6421 21 F7 6E      [10] 5083 	ld	hl,#_bound + 0
   6424 36 01         [10] 5084 	ld	(hl), #0x01
   6426 C3 A7 64      [10] 5085 	jp	00124$
   6429                    5086 00122$:
                           5087 ;src/main.c:380: if(shooted == 1){
   6429 3A F5 6E      [13] 5088 	ld	a,(#_shooted + 0)
   642C 3D            [ 4] 5089 	dec	a
   642D 20 78         [12] 5090 	jr	NZ,00124$
                           5091 ;src/main.c:381: moveObject(1);
   642F 3E 01         [ 7] 5092 	ld	a,#0x01
   6431 F5            [11] 5093 	push	af
   6432 33            [ 6] 5094 	inc	sp
   6433 CD 70 5A      [17] 5095 	call	_moveObject
   6436 33            [ 6] 5096 	inc	sp
                           5097 ;src/main.c:382: bounds = checkArrowCollisions();
   6437 CD B3 53      [17] 5098 	call	_checkArrowCollisions
   643A FD 21 F8 6E   [14] 5099 	ld	iy,#_bounds
   643E FD 75 00      [19] 5100 	ld	0 (iy),l
                           5101 ;src/main.c:384: if(earrow.dir == 2 || earrow.dir == 8) atkObj = 21;
   6441 21 0B 6F      [10] 5102 	ld	hl, #_earrow + 7
   6444 66            [ 7] 5103 	ld	h,(hl)
   6445 7C            [ 4] 5104 	ld	a,h
   6446 D6 02         [ 7] 5105 	sub	a, #0x02
   6448 28 05         [12] 5106 	jr	Z,00111$
   644A 7C            [ 4] 5107 	ld	a,h
   644B D6 08         [ 7] 5108 	sub	a, #0x08
   644D 20 04         [12] 5109 	jr	NZ,00112$
   644F                    5110 00111$:
   644F 0E 15         [ 7] 5111 	ld	c,#0x15
   6451 18 02         [12] 5112 	jr	00113$
   6453                    5113 00112$:
                           5114 ;src/main.c:385: else atkObj = 22;
   6453 0E 16         [ 7] 5115 	ld	c,#0x16
   6455                    5116 00113$:
                           5117 ;src/main.c:387: if(player.life > 0 && checkCollisions(earrow.x, earrow.y, player.x, player.y, atkObj) == 1 && bounds == 0){
   6455 3A 14 6F      [13] 5118 	ld	a, (#(_player + 0x0006) + 0)
   6458 B7            [ 4] 5119 	or	a, a
   6459 28 4C         [12] 5120 	jr	Z,00124$
   645B 21 0F 6F      [10] 5121 	ld	hl, #(_player + 0x0001) + 0
   645E 46            [ 7] 5122 	ld	b,(hl)
   645F 21 0E 6F      [10] 5123 	ld	hl, #_player + 0
   6462 5E            [ 7] 5124 	ld	e,(hl)
   6463 3A 05 6F      [13] 5125 	ld	a,(#_earrow + 1)
   6466 DD 77 FF      [19] 5126 	ld	-1 (ix),a
   6469 21 04 6F      [10] 5127 	ld	hl, #_earrow + 0
   646C 56            [ 7] 5128 	ld	d,(hl)
   646D 79            [ 4] 5129 	ld	a,c
   646E F5            [11] 5130 	push	af
   646F 33            [ 6] 5131 	inc	sp
   6470 C5            [11] 5132 	push	bc
   6471 33            [ 6] 5133 	inc	sp
   6472 7B            [ 4] 5134 	ld	a,e
   6473 F5            [11] 5135 	push	af
   6474 33            [ 6] 5136 	inc	sp
   6475 DD 7E FF      [19] 5137 	ld	a,-1 (ix)
   6478 F5            [11] 5138 	push	af
   6479 33            [ 6] 5139 	inc	sp
   647A D5            [11] 5140 	push	de
   647B 33            [ 6] 5141 	inc	sp
   647C CD 92 52      [17] 5142 	call	_checkCollisions
   647F F1            [10] 5143 	pop	af
   6480 F1            [10] 5144 	pop	af
   6481 33            [ 6] 5145 	inc	sp
   6482 2D            [ 4] 5146 	dec	l
   6483 20 22         [12] 5147 	jr	NZ,00124$
   6485 3A F8 6E      [13] 5148 	ld	a,(#_bounds + 0)
   6488 B7            [ 4] 5149 	or	a, a
   6489 20 1C         [12] 5150 	jr	NZ,00124$
                           5151 ;src/main.c:388: player.life -= 1;
   648B 3A 14 6F      [13] 5152 	ld	a, (#(_player + 0x0006) + 0)
   648E C6 FF         [ 7] 5153 	add	a,#0xFF
   6490 32 14 6F      [13] 5154 	ld	(#(_player + 0x0006)),a
                           5155 ;src/main.c:389: player.x = 0;
   6493 21 0E 6F      [10] 5156 	ld	hl,#_player
   6496 36 00         [10] 5157 	ld	(hl),#0x00
                           5158 ;src/main.c:390: player.y = 80;
   6498 21 0F 6F      [10] 5159 	ld	hl,#(_player + 0x0001)
   649B 36 50         [10] 5160 	ld	(hl),#0x50
                           5161 ;src/main.c:391: earrow.vivo = 0;
   649D 21 0A 6F      [10] 5162 	ld	hl,#_earrow + 6
   64A0 36 00         [10] 5163 	ld	(hl),#0x00
                           5164 ;src/main.c:392: bounds = 1;
   64A2 21 F8 6E      [10] 5165 	ld	hl,#_bounds + 0
   64A5 36 01         [10] 5166 	ld	(hl), #0x01
   64A7                    5167 00124$:
   64A7 33            [ 6] 5168 	inc	sp
   64A8 DD E1         [14] 5169 	pop	ix
   64AA C9            [10] 5170 	ret
                           5171 ;src/main.c:400: void move(){
                           5172 ;	---------------------------------
                           5173 ; Function move
                           5174 ; ---------------------------------
   64AB                    5175 _move::
                           5176 ;src/main.c:402: if(temp > 10){
   64AB 3E 0A         [ 7] 5177 	ld	a,#0x0A
   64AD FD 21 F0 6E   [14] 5178 	ld	iy,#_temp
   64B1 FD 96 00      [19] 5179 	sub	a, 0 (iy)
   64B4 30 49         [12] 5180 	jr	NC,00123$
                           5181 ;src/main.c:403: enemy.dir = chooseDirection();
   64B6 CD 49 50      [17] 5182 	call	_chooseDirection
   64B9 7D            [ 4] 5183 	ld	a,l
   64BA 21 22 6F      [10] 5184 	ld	hl,#(_enemy + 0x0009)
   64BD 77            [ 7] 5185 	ld	(hl),a
                           5186 ;src/main.c:404: following = detectPlayerRoom(player.x,player.y);
   64BE 21 0F 6F      [10] 5187 	ld	hl, #_player + 1
   64C1 56            [ 7] 5188 	ld	d,(hl)
   64C2 3A 0E 6F      [13] 5189 	ld	a, (#_player + 0)
   64C5 D5            [11] 5190 	push	de
   64C6 33            [ 6] 5191 	inc	sp
   64C7 F5            [11] 5192 	push	af
   64C8 33            [ 6] 5193 	inc	sp
   64C9 CD 1C 50      [17] 5194 	call	_detectPlayerRoom
   64CC F1            [10] 5195 	pop	af
   64CD FD 21 F6 6E   [14] 5196 	ld	iy,#_following
   64D1 FD 75 00      [19] 5197 	ld	0 (iy),l
                           5198 ;src/main.c:409: if(following == enemy.room || enemy.pursue != 0){
   64D4 21 24 6F      [10] 5199 	ld	hl, #_enemy + 11
   64D7 4E            [ 7] 5200 	ld	c,(hl)
   64D8 11 27 6F      [10] 5201 	ld	de,#_enemy + 14
   64DB 1A            [ 7] 5202 	ld	a,(de)
   64DC 47            [ 4] 5203 	ld	b,a
   64DD 3A F6 6E      [13] 5204 	ld	a,(#_following + 0)
   64E0 91            [ 4] 5205 	sub	a, c
   64E1 28 04         [12] 5206 	jr	Z,00106$
   64E3 78            [ 4] 5207 	ld	a,b
   64E4 B7            [ 4] 5208 	or	a, a
   64E5 28 11         [12] 5209 	jr	Z,00107$
   64E7                    5210 00106$:
                           5211 ;src/main.c:410: if(enemy.pursue == 0)
   64E7 78            [ 4] 5212 	ld	a,b
   64E8 B7            [ 4] 5213 	or	a, a
   64E9 20 05         [12] 5214 	jr	NZ,00104$
                           5215 ;src/main.c:411: enemy.pursue = 3;
   64EB 3E 03         [ 7] 5216 	ld	a,#0x03
   64ED 12            [ 7] 5217 	ld	(de),a
   64EE 18 08         [12] 5218 	jr	00107$
   64F0                    5219 00104$:
                           5220 ;src/main.c:412: else if(enemy.pursue > 1)
   64F0 3E 01         [ 7] 5221 	ld	a,#0x01
   64F2 90            [ 4] 5222 	sub	a, b
   64F3 30 03         [12] 5223 	jr	NC,00107$
                           5224 ;src/main.c:413: enemy.pursue -=1;
   64F5 05            [ 4] 5225 	dec	b
   64F6 78            [ 4] 5226 	ld	a,b
   64F7 12            [ 7] 5227 	ld	(de),a
   64F8                    5228 00107$:
                           5229 ;src/main.c:415: temp = 0;
   64F8 21 F0 6E      [10] 5230 	ld	hl,#_temp + 0
   64FB 36 00         [10] 5231 	ld	(hl), #0x00
   64FD 18 5B         [12] 5232 	jr	00124$
   64FF                    5233 00123$:
                           5234 ;src/main.c:417: if(enemy.pursue >= 1){
   64FF 3A 27 6F      [13] 5235 	ld	a,(#(_enemy + 0x000e) + 0)
   6502 D6 01         [ 7] 5236 	sub	a, #0x01
   6504 38 51         [12] 5237 	jr	C,00120$
                           5238 ;src/main.c:418: if(archer >= 2 && enemy.bullets > 0 && shooted == 0){
   6506 3A F9 6E      [13] 5239 	ld	a,(#_archer + 0)
   6509 D6 02         [ 7] 5240 	sub	a, #0x02
   650B 38 16         [12] 5241 	jr	C,00115$
   650D 3A 23 6F      [13] 5242 	ld	a, (#_enemy + 10)
   6510 B7            [ 4] 5243 	or	a, a
   6511 28 10         [12] 5244 	jr	Z,00115$
   6513 3A F5 6E      [13] 5245 	ld	a,(#_shooted + 0)
   6516 B7            [ 4] 5246 	or	a, a
   6517 20 0A         [12] 5247 	jr	NZ,00115$
                           5248 ;src/main.c:419: shoot();
   6519 CD 02 63      [17] 5249 	call	_shoot
                           5250 ;src/main.c:420: archer =0;
   651C 21 F9 6E      [10] 5251 	ld	hl,#_archer + 0
   651F 36 00         [10] 5252 	ld	(hl), #0x00
   6521 18 37         [12] 5253 	jr	00124$
   6523                    5254 00115$:
                           5255 ;src/main.c:423: followPlayer();
   6523 CD 19 61      [17] 5256 	call	_followPlayer
                           5257 ;src/main.c:424: if(shooted == 1) arrowCheckings(1);
   6526 3A F5 6E      [13] 5258 	ld	a,(#_shooted + 0)
   6529 3D            [ 4] 5259 	dec	a
   652A 20 08         [12] 5260 	jr	NZ,00110$
   652C 3E 01         [ 7] 5261 	ld	a,#0x01
   652E F5            [11] 5262 	push	af
   652F 33            [ 6] 5263 	inc	sp
   6530 CD 96 63      [17] 5264 	call	_arrowCheckings
   6533 33            [ 6] 5265 	inc	sp
   6534                    5266 00110$:
                           5267 ;src/main.c:425: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y){
   6534 21 25 6F      [10] 5268 	ld	hl, #_enemy + 12
   6537 56            [ 7] 5269 	ld	d,(hl)
   6538 21 19 6F      [10] 5270 	ld	hl, #_enemy + 0
   653B 5E            [ 7] 5271 	ld	e,(hl)
   653C 7A            [ 4] 5272 	ld	a,d
   653D 93            [ 4] 5273 	sub	a, e
   653E 20 1A         [12] 5274 	jr	NZ,00124$
   6540 21 26 6F      [10] 5275 	ld	hl, #_enemy + 13
   6543 56            [ 7] 5276 	ld	d,(hl)
   6544 21 1A 6F      [10] 5277 	ld	hl, #_enemy + 1
   6547 5E            [ 7] 5278 	ld	e,(hl)
   6548 7A            [ 4] 5279 	ld	a,d
   6549 93            [ 4] 5280 	sub	a, e
   654A 20 0E         [12] 5281 	jr	NZ,00124$
                           5282 ;src/main.c:426: enemy.pursue = 0;
   654C 21 27 6F      [10] 5283 	ld	hl,#(_enemy + 0x000e)
   654F 36 00         [10] 5284 	ld	(hl),#0x00
                           5285 ;src/main.c:427: archer++;
   6551 21 F9 6E      [10] 5286 	ld	hl, #_archer+0
   6554 34            [11] 5287 	inc	(hl)
   6555 18 03         [12] 5288 	jr	00124$
   6557                    5289 00120$:
                           5290 ;src/main.c:432: patrol();
   6557 CD F8 50      [17] 5291 	call	_patrol
   655A                    5292 00124$:
                           5293 ;src/main.c:435: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   655A 21 1C 6F      [10] 5294 	ld	hl, #_enemy + 3
   655D 56            [ 7] 5295 	ld	d,(hl)
   655E 3A 1B 6F      [13] 5296 	ld	a, (#_enemy + 2)
   6561 D5            [11] 5297 	push	de
   6562 33            [ 6] 5298 	inc	sp
   6563 F5            [11] 5299 	push	af
   6564 33            [ 6] 5300 	inc	sp
   6565 CD 1C 50      [17] 5301 	call	_detectPlayerRoom
   6568 F1            [10] 5302 	pop	af
   6569 55            [ 4] 5303 	ld	d,l
   656A 3A 0F 6F      [13] 5304 	ld	a, (#(_player + 0x0001) + 0)
   656D 21 0E 6F      [10] 5305 	ld	hl, #_player + 0
   6570 46            [ 7] 5306 	ld	b,(hl)
   6571 D5            [11] 5307 	push	de
   6572 F5            [11] 5308 	push	af
   6573 33            [ 6] 5309 	inc	sp
   6574 C5            [11] 5310 	push	bc
   6575 33            [ 6] 5311 	inc	sp
   6576 CD 1C 50      [17] 5312 	call	_detectPlayerRoom
   6579 F1            [10] 5313 	pop	af
   657A 45            [ 4] 5314 	ld	b,l
   657B D1            [10] 5315 	pop	de
   657C 7A            [ 4] 5316 	ld	a,d
   657D 90            [ 4] 5317 	sub	a, b
   657E 28 09         [12] 5318 	jr	Z,00125$
   6580 21 27 6F      [10] 5319 	ld	hl, #_enemy + 14
   6583 66            [ 7] 5320 	ld	h,(hl)
   6584 3E 01         [ 7] 5321 	ld	a,#0x01
   6586 94            [ 4] 5322 	sub	a, h
   6587 30 0E         [12] 5323 	jr	NC,00126$
   6589                    5324 00125$:
                           5325 ;src/main.c:436: enemy.seenX = player.x;
   6589 11 25 6F      [10] 5326 	ld	de,#_enemy + 12
   658C 3A 0E 6F      [13] 5327 	ld	a, (#_player + 0)
   658F 12            [ 7] 5328 	ld	(de),a
                           5329 ;src/main.c:437: enemy.seenY = player.y;
   6590 11 26 6F      [10] 5330 	ld	de,#_enemy + 13
   6593 3A 0F 6F      [13] 5331 	ld	a, (#(_player + 0x0001) + 0)
   6596 12            [ 7] 5332 	ld	(de),a
   6597                    5333 00126$:
                           5334 ;src/main.c:439: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   6597 3A 1A 6F      [13] 5335 	ld	a, (#_enemy + 1)
   659A 21 19 6F      [10] 5336 	ld	hl, #_enemy + 0
   659D 56            [ 7] 5337 	ld	d,(hl)
   659E F5            [11] 5338 	push	af
   659F 33            [ 6] 5339 	inc	sp
   65A0 D5            [11] 5340 	push	de
   65A1 33            [ 6] 5341 	inc	sp
   65A2 CD 1C 50      [17] 5342 	call	_detectPlayerRoom
   65A5 F1            [10] 5343 	pop	af
   65A6 7D            [ 4] 5344 	ld	a,l
   65A7 32 24 6F      [13] 5345 	ld	(#(_enemy + 0x000b)),a
                           5346 ;src/main.c:440: temp += 1;
   65AA 21 F0 6E      [10] 5347 	ld	hl, #_temp+0
   65AD 34            [11] 5348 	inc	(hl)
   65AE C9            [10] 5349 	ret
                           5350 ;src/main.c:444: void enemyIa(){
                           5351 ;	---------------------------------
                           5352 ; Function enemyIa
                           5353 ; ---------------------------------
   65AF                    5354 _enemyIa::
   65AF DD E5         [15] 5355 	push	ix
   65B1 DD 21 00 00   [14] 5356 	ld	ix,#0
   65B5 DD 39         [15] 5357 	add	ix,sp
   65B7 3B            [ 6] 5358 	dec	sp
                           5359 ;src/main.c:445: if(enemy.life > 0){
   65B8 3A 21 6F      [13] 5360 	ld	a,(#(_enemy + 0x0008) + 0)
   65BB B7            [ 4] 5361 	or	a, a
   65BC 28 74         [12] 5362 	jr	Z,00110$
                           5363 ;src/main.c:446: if(temp%2 == 1){
   65BE 3A F0 6E      [13] 5364 	ld	a,(#_temp + 0)
   65C1 E6 01         [ 7] 5365 	and	a, #0x01
   65C3 67            [ 4] 5366 	ld	h,a
                           5367 ;src/main.c:448: enemy.ly = enemy.y;
                           5368 ;src/main.c:446: if(temp%2 == 1){
   65C4 25            [ 4] 5369 	dec	h
   65C5 20 0D         [12] 5370 	jr	NZ,00102$
                           5371 ;src/main.c:447: enemy.lx = enemy.x;
   65C7 3A 19 6F      [13] 5372 	ld	a, (#_enemy + 0)
   65CA 32 1B 6F      [13] 5373 	ld	(#(_enemy + 0x0002)),a
                           5374 ;src/main.c:448: enemy.ly = enemy.y;
   65CD 11 1C 6F      [10] 5375 	ld	de,#_enemy + 3
   65D0 3A 1A 6F      [13] 5376 	ld	a, (#(_enemy + 0x0001) + 0)
   65D3 12            [ 7] 5377 	ld	(de),a
   65D4                    5378 00102$:
                           5379 ;src/main.c:451: move();
   65D4 CD AB 64      [17] 5380 	call	_move
                           5381 ;src/main.c:453: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   65D7 21 16 6F      [10] 5382 	ld	hl, #_player + 8
   65DA 56            [ 7] 5383 	ld	d,(hl)
   65DB 21 1A 6F      [10] 5384 	ld	hl, #(_enemy + 0x0001) + 0
   65DE 5E            [ 7] 5385 	ld	e,(hl)
   65DF 21 19 6F      [10] 5386 	ld	hl, #_enemy + 0
   65E2 46            [ 7] 5387 	ld	b,(hl)
   65E3 21 0F 6F      [10] 5388 	ld	hl, #(_player + 0x0001) + 0
   65E6 4E            [ 7] 5389 	ld	c,(hl)
   65E7 3A 0E 6F      [13] 5390 	ld	a,(#_player + 0)
   65EA DD 77 FF      [19] 5391 	ld	-1 (ix),a
   65ED D5            [11] 5392 	push	de
   65EE C5            [11] 5393 	push	bc
   65EF DD 7E FF      [19] 5394 	ld	a,-1 (ix)
   65F2 F5            [11] 5395 	push	af
   65F3 33            [ 6] 5396 	inc	sp
   65F4 CD 92 52      [17] 5397 	call	_checkCollisions
   65F7 F1            [10] 5398 	pop	af
   65F8 F1            [10] 5399 	pop	af
   65F9 33            [ 6] 5400 	inc	sp
   65FA 7D            [ 4] 5401 	ld	a,l
   65FB 3D            [ 4] 5402 	dec	a
   65FC 28 07         [12] 5403 	jr	Z,00103$
   65FE 7D            [ 4] 5404 	ld	a,l
   65FF D6 02         [ 7] 5405 	sub	a, #0x02
   6601 28 18         [12] 5406 	jr	Z,00104$
   6603 18 2D         [12] 5407 	jr	00110$
                           5408 ;src/main.c:454: case 1:
   6605                    5409 00103$:
                           5410 ;src/main.c:455: enemy.x = enemy.ox;
   6605 3A 1D 6F      [13] 5411 	ld	a, (#_enemy + 4)
   6608 32 19 6F      [13] 5412 	ld	(#_enemy),a
                           5413 ;src/main.c:456: enemy.y = enemy.oy;
   660B 3A 1E 6F      [13] 5414 	ld	a, (#_enemy + 5)
   660E 32 1A 6F      [13] 5415 	ld	(#(_enemy + 0x0001)),a
                           5416 ;src/main.c:457: enemy.life -= 1;
   6611 3A 21 6F      [13] 5417 	ld	a, (#(_enemy + 0x0008) + 0)
   6614 C6 FF         [ 7] 5418 	add	a,#0xFF
   6616 32 21 6F      [13] 5419 	ld	(#(_enemy + 0x0008)),a
                           5420 ;src/main.c:458: break;
   6619 18 17         [12] 5421 	jr	00110$
                           5422 ;src/main.c:459: case 2:
   661B                    5423 00104$:
                           5424 ;src/main.c:460: player.x = 0;
   661B 21 0E 6F      [10] 5425 	ld	hl,#_player
   661E 36 00         [10] 5426 	ld	(hl),#0x00
                           5427 ;src/main.c:461: player.y = 80;
   6620 21 0F 6F      [10] 5428 	ld	hl,#(_player + 0x0001)
   6623 36 50         [10] 5429 	ld	(hl),#0x50
                           5430 ;src/main.c:462: player.life -= 1;
   6625 21 14 6F      [10] 5431 	ld	hl,#_player + 6
   6628 7E            [ 7] 5432 	ld	a,(hl)
   6629 C6 FF         [ 7] 5433 	add	a,#0xFF
   662B 77            [ 7] 5434 	ld	(hl),a
                           5435 ;src/main.c:463: if(player.life == 0){
   662C B7            [ 4] 5436 	or	a, a
   662D 20 03         [12] 5437 	jr	NZ,00110$
                           5438 ;src/main.c:464: gameOver();
   662F CD 21 58      [17] 5439 	call	_gameOver
                           5440 ;src/main.c:468: }
   6632                    5441 00110$:
   6632 33            [ 6] 5442 	inc	sp
   6633 DD E1         [14] 5443 	pop	ix
   6635 C9            [10] 5444 	ret
                           5445 ;src/main.c:480: void game(){
                           5446 ;	---------------------------------
                           5447 ; Function game
                           5448 ; ---------------------------------
   6636                    5449 _game::
   6636 DD E5         [15] 5450 	push	ix
   6638 DD 21 00 00   [14] 5451 	ld	ix,#0
   663C DD 39         [15] 5452 	add	ix,sp
   663E 21 F4 FF      [10] 5453 	ld	hl,#-12
   6641 39            [11] 5454 	add	hl,sp
   6642 F9            [ 6] 5455 	ld	sp,hl
                           5456 ;src/main.c:482: TNivel n = {0,0,0};
   6643 21 00 00      [10] 5457 	ld	hl,#0x0000
   6646 39            [11] 5458 	add	hl,sp
   6647 36 00         [10] 5459 	ld	(hl),#0x00
   6649 21 00 00      [10] 5460 	ld	hl,#0x0000
   664C 39            [11] 5461 	add	hl,sp
   664D 5D            [ 4] 5462 	ld	e, l
   664E 54            [ 4] 5463 	ld	d, h
   664F 23            [ 6] 5464 	inc	hl
   6650 DD 75 F9      [19] 5465 	ld	-7 (ix),l
   6653 DD 74 FA      [19] 5466 	ld	-6 (ix),h
   6656 DD 6E F9      [19] 5467 	ld	l,-7 (ix)
   6659 DD 66 FA      [19] 5468 	ld	h,-6 (ix)
   665C 36 00         [10] 5469 	ld	(hl),#0x00
   665E 13            [ 6] 5470 	inc	de
   665F 13            [ 6] 5471 	inc	de
   6660 DD 73 F7      [19] 5472 	ld	-9 (ix),e
   6663 DD 72 F8      [19] 5473 	ld	-8 (ix),d
   6666 DD 6E F7      [19] 5474 	ld	l,-9 (ix)
   6669 DD 66 F8      [19] 5475 	ld	h,-8 (ix)
   666C 36 00         [10] 5476 	ld	(hl),#0x00
                           5477 ;src/main.c:483: bound =0;
   666E 21 F7 6E      [10] 5478 	ld	hl,#_bound + 0
   6671 36 00         [10] 5479 	ld	(hl), #0x00
                           5480 ;src/main.c:484: temp = 0;
   6673 21 F0 6E      [10] 5481 	ld	hl,#_temp + 0
   6676 36 00         [10] 5482 	ld	(hl), #0x00
                           5483 ;src/main.c:485: map = 1;
   6678 21 F1 6E      [10] 5484 	ld	hl,#_map + 0
   667B 36 01         [10] 5485 	ld	(hl), #0x01
                           5486 ;src/main.c:486: arrow =0;
   667D 21 F4 6E      [10] 5487 	ld	hl,#_arrow + 0
   6680 36 00         [10] 5488 	ld	(hl), #0x00
                           5489 ;src/main.c:487: finish =0;
   6682 21 F3 6E      [10] 5490 	ld	hl,#_finish + 0
   6685 36 00         [10] 5491 	ld	(hl), #0x00
                           5492 ;src/main.c:488: following =0;
   6687 21 F6 6E      [10] 5493 	ld	hl,#_following + 0
   668A 36 00         [10] 5494 	ld	(hl), #0x00
                           5495 ;src/main.c:489: archer = 0;
   668C 21 F9 6E      [10] 5496 	ld	hl,#_archer + 0
   668F 36 00         [10] 5497 	ld	(hl), #0x00
                           5498 ;src/main.c:490: shooted =0;
   6691 21 F5 6E      [10] 5499 	ld	hl,#_shooted + 0
   6694 36 00         [10] 5500 	ld	(hl), #0x00
                           5501 ;src/main.c:492: initPlayer();
   6696 CD B2 57      [17] 5502 	call	_initPlayer
                           5503 ;src/main.c:493: initEnemies();
   6699 CD E8 57      [17] 5504 	call	_initEnemies
                           5505 ;src/main.c:495: cpct_clearScreen(0);
   669C 21 00 40      [10] 5506 	ld	hl,#0x4000
   669F E5            [11] 5507 	push	hl
   66A0 AF            [ 4] 5508 	xor	a, a
   66A1 F5            [11] 5509 	push	af
   66A2 33            [ 6] 5510 	inc	sp
   66A3 26 C0         [ 7] 5511 	ld	h, #0xC0
   66A5 E5            [11] 5512 	push	hl
   66A6 CD 17 6C      [17] 5513 	call	_cpct_memset
                           5514 ;src/main.c:496: drawMap(map);
   66A9 3A F1 6E      [13] 5515 	ld	a,(_map)
   66AC F5            [11] 5516 	push	af
   66AD 33            [ 6] 5517 	inc	sp
   66AE CD C0 46      [17] 5518 	call	_drawMap
   66B1 33            [ 6] 5519 	inc	sp
                           5520 ;src/main.c:502: while (1){
   66B2 DD 7E F7      [19] 5521 	ld	a,-9 (ix)
   66B5 DD 77 FB      [19] 5522 	ld	-5 (ix),a
   66B8 DD 7E F8      [19] 5523 	ld	a,-8 (ix)
   66BB DD 77 FC      [19] 5524 	ld	-4 (ix),a
   66BE DD 7E F9      [19] 5525 	ld	a,-7 (ix)
   66C1 DD 77 FE      [19] 5526 	ld	-2 (ix),a
   66C4 DD 7E FA      [19] 5527 	ld	a,-6 (ix)
   66C7 DD 77 FF      [19] 5528 	ld	-1 (ix),a
   66CA                    5529 00116$:
                           5530 ;src/main.c:505: cpct_waitVSYNC();
   66CA CD FD 6B      [17] 5531 	call	_cpct_waitVSYNC
                           5532 ;src/main.c:508: erases();
   66CD CD D1 4D      [17] 5533 	call	_erases
                           5534 ;src/main.c:511: if(temp == 10)
   66D0 3A F0 6E      [13] 5535 	ld	a,(#_temp + 0)
   66D3 D6 0A         [ 7] 5536 	sub	a, #0x0A
   66D5 20 1C         [12] 5537 	jr	NZ,00102$
                           5538 ;src/main.c:512: drawPickUps(n.corazon,n.bullet);
   66D7 DD 6E F7      [19] 5539 	ld	l,-9 (ix)
   66DA DD 66 F8      [19] 5540 	ld	h,-8 (ix)
   66DD 7E            [ 7] 5541 	ld	a,(hl)
   66DE DD 77 FD      [19] 5542 	ld	-3 (ix),a
   66E1 DD 6E F9      [19] 5543 	ld	l,-7 (ix)
   66E4 DD 66 FA      [19] 5544 	ld	h,-6 (ix)
   66E7 56            [ 7] 5545 	ld	d,(hl)
   66E8 DD 7E FD      [19] 5546 	ld	a,-3 (ix)
   66EB F5            [11] 5547 	push	af
   66EC 33            [ 6] 5548 	inc	sp
   66ED D5            [11] 5549 	push	de
   66EE 33            [ 6] 5550 	inc	sp
   66EF CD B4 4F      [17] 5551 	call	_drawPickUps
   66F2 F1            [10] 5552 	pop	af
   66F3                    5553 00102$:
                           5554 ;src/main.c:515: draws();
   66F3 CD AE 4C      [17] 5555 	call	_draws
                           5556 ;src/main.c:518: if(temp == 10){
   66F6 3A F0 6E      [13] 5557 	ld	a,(#_temp + 0)
   66F9 D6 0A         [ 7] 5558 	sub	a, #0x0A
   66FB 20 2F         [12] 5559 	jr	NZ,00110$
                           5560 ;src/main.c:519: if(player.atk < 20) drawFatiga(player.atk,2);
   66FD 21 16 6F      [10] 5561 	ld	hl, #(_player + 0x0008) + 0
   6700 56            [ 7] 5562 	ld	d,(hl)
   6701 7A            [ 4] 5563 	ld	a,d
   6702 D6 14         [ 7] 5564 	sub	a, #0x14
   6704 30 0C         [12] 5565 	jr	NC,00107$
   6706 3E 02         [ 7] 5566 	ld	a,#0x02
   6708 F5            [11] 5567 	push	af
   6709 33            [ 6] 5568 	inc	sp
   670A D5            [11] 5569 	push	de
   670B 33            [ 6] 5570 	inc	sp
   670C CD 8E 4E      [17] 5571 	call	_drawFatiga
   670F F1            [10] 5572 	pop	af
   6710 18 1A         [12] 5573 	jr	00110$
   6712                    5574 00107$:
                           5575 ;src/main.c:520: else if(player.atk > 20) drawFatiga(player.atk,1);
   6712 3E 14         [ 7] 5576 	ld	a,#0x14
   6714 92            [ 4] 5577 	sub	a, d
   6715 30 0C         [12] 5578 	jr	NC,00104$
   6717 3E 01         [ 7] 5579 	ld	a,#0x01
   6719 F5            [11] 5580 	push	af
   671A 33            [ 6] 5581 	inc	sp
   671B D5            [11] 5582 	push	de
   671C 33            [ 6] 5583 	inc	sp
   671D CD 8E 4E      [17] 5584 	call	_drawFatiga
   6720 F1            [10] 5585 	pop	af
   6721 18 09         [12] 5586 	jr	00110$
   6723                    5587 00104$:
                           5588 ;src/main.c:521: else drawFatiga(player.atk,0);
   6723 AF            [ 4] 5589 	xor	a, a
   6724 F5            [11] 5590 	push	af
   6725 33            [ 6] 5591 	inc	sp
   6726 D5            [11] 5592 	push	de
   6727 33            [ 6] 5593 	inc	sp
   6728 CD 8E 4E      [17] 5594 	call	_drawFatiga
   672B F1            [10] 5595 	pop	af
   672C                    5596 00110$:
                           5597 ;src/main.c:526: if(temp%2 == 0){
   672C FD 21 F0 6E   [14] 5598 	ld	iy,#_temp
   6730 FD CB 00 46   [20] 5599 	bit	0, 0 (iy)
   6734 20 0E         [12] 5600 	jr	NZ,00112$
                           5601 ;src/main.c:527: player.lx = player.x;
   6736 3A 0E 6F      [13] 5602 	ld	a, (#_player + 0)
   6739 21 10 6F      [10] 5603 	ld	hl,#(_player + 0x0002)
   673C 77            [ 7] 5604 	ld	(hl),a
                           5605 ;src/main.c:528: player.ly = player.y;
   673D 11 11 6F      [10] 5606 	ld	de,#_player + 3
   6740 3A 0F 6F      [13] 5607 	ld	a, (#_player + 1)
   6743 12            [ 7] 5608 	ld	(de),a
   6744                    5609 00112$:
                           5610 ;src/main.c:531: enemyIa();
   6744 CD AF 65      [17] 5611 	call	_enemyIa
                           5612 ;src/main.c:532: player.latk = player.atk;
   6747 11 17 6F      [10] 5613 	ld	de,#_player + 9
   674A 3A 16 6F      [13] 5614 	ld	a, (#(_player + 0x0008) + 0)
   674D 12            [ 7] 5615 	ld	(de),a
                           5616 ;src/main.c:537: cpct_scanKeyboard_f();
   674E CD 48 69      [17] 5617 	call	_cpct_scanKeyboard_f
                           5618 ;src/main.c:538: player.sprite = checkKeyboard();
   6751 CD 16 55      [17] 5619 	call	_checkKeyboard
   6754 5D            [ 4] 5620 	ld	e,l
   6755 54            [ 4] 5621 	ld	d,h
   6756 ED 53 12 6F   [20] 5622 	ld	((_player + 0x0004)), de
                           5623 ;src/main.c:539: checkBoundsCollisions(&n.corazon,&n.bullet);
   675A DD 6E FB      [19] 5624 	ld	l,-5 (ix)
   675D DD 66 FC      [19] 5625 	ld	h,-4 (ix)
   6760 DD 5E FE      [19] 5626 	ld	e,-2 (ix)
   6763 DD 56 FF      [19] 5627 	ld	d,-1 (ix)
   6766 E5            [11] 5628 	push	hl
   6767 D5            [11] 5629 	push	de
   6768 CD 48 5D      [17] 5630 	call	_checkBoundsCollisions
   676B F1            [10] 5631 	pop	af
   676C F1            [10] 5632 	pop	af
                           5633 ;src/main.c:541: arrowCheckings(0);
   676D AF            [ 4] 5634 	xor	a, a
   676E F5            [11] 5635 	push	af
   676F 33            [ 6] 5636 	inc	sp
   6770 CD 96 63      [17] 5637 	call	_arrowCheckings
   6773 33            [ 6] 5638 	inc	sp
                           5639 ;src/main.c:543: if(finish == 1) return;
   6774 3A F3 6E      [13] 5640 	ld	a,(#_finish + 0)
   6777 3D            [ 4] 5641 	dec	a
   6778 C2 CA 66      [10] 5642 	jp	NZ,00116$
   677B DD F9         [10] 5643 	ld	sp, ix
   677D DD E1         [14] 5644 	pop	ix
   677F C9            [10] 5645 	ret
                           5646 ;src/main.c:550: void credits(){
                           5647 ;	---------------------------------
                           5648 ; Function credits
                           5649 ; ---------------------------------
   6780                    5650 _credits::
                           5651 ;src/main.c:552: cpct_clearScreen(0);
   6780 21 00 40      [10] 5652 	ld	hl,#0x4000
   6783 E5            [11] 5653 	push	hl
   6784 AF            [ 4] 5654 	xor	a, a
   6785 F5            [11] 5655 	push	af
   6786 33            [ 6] 5656 	inc	sp
   6787 26 C0         [ 7] 5657 	ld	h, #0xC0
   6789 E5            [11] 5658 	push	hl
   678A CD 17 6C      [17] 5659 	call	_cpct_memset
                           5660 ;src/main.c:553: memptr = cpct_getScreenPtr(VMEM,10,10);
   678D 21 0A 0A      [10] 5661 	ld	hl,#0x0A0A
   6790 E5            [11] 5662 	push	hl
   6791 21 00 C0      [10] 5663 	ld	hl,#0xC000
   6794 E5            [11] 5664 	push	hl
   6795 CD 0A 6D      [17] 5665 	call	_cpct_getScreenPtr
                           5666 ;src/main.c:554: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6798 EB            [ 4] 5667 	ex	de,hl
   6799 01 E2 67      [10] 5668 	ld	bc,#___str_5
   679C D5            [11] 5669 	push	de
   679D 21 01 00      [10] 5670 	ld	hl,#0x0001
   67A0 E5            [11] 5671 	push	hl
   67A1 D5            [11] 5672 	push	de
   67A2 C5            [11] 5673 	push	bc
   67A3 CD 29 6A      [17] 5674 	call	_cpct_drawStringM0
   67A6 21 06 00      [10] 5675 	ld	hl,#6
   67A9 39            [11] 5676 	add	hl,sp
   67AA F9            [ 6] 5677 	ld	sp,hl
   67AB D1            [10] 5678 	pop	de
                           5679 ;src/main.c:556: while (1){
   67AC                    5680 00104$:
                           5681 ;src/main.c:558: cpct_scanKeyboard_f();
   67AC D5            [11] 5682 	push	de
   67AD CD 48 69      [17] 5683 	call	_cpct_scanKeyboard_f
   67B0 D1            [10] 5684 	pop	de
                           5685 ;src/main.c:559: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   67B1 01 F3 67      [10] 5686 	ld	bc,#___str_6
   67B4 D5            [11] 5687 	push	de
   67B5 21 01 00      [10] 5688 	ld	hl,#0x0001
   67B8 E5            [11] 5689 	push	hl
   67B9 D5            [11] 5690 	push	de
   67BA C5            [11] 5691 	push	bc
   67BB CD 29 6A      [17] 5692 	call	_cpct_drawStringM0
   67BE 21 06 00      [10] 5693 	ld	hl,#6
   67C1 39            [11] 5694 	add	hl,sp
   67C2 F9            [ 6] 5695 	ld	sp,hl
   67C3 D1            [10] 5696 	pop	de
                           5697 ;src/main.c:560: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   67C4 01 09 68      [10] 5698 	ld	bc,#___str_7
   67C7 D5            [11] 5699 	push	de
   67C8 21 01 00      [10] 5700 	ld	hl,#0x0001
   67CB E5            [11] 5701 	push	hl
   67CC D5            [11] 5702 	push	de
   67CD C5            [11] 5703 	push	bc
   67CE CD 29 6A      [17] 5704 	call	_cpct_drawStringM0
   67D1 21 06 00      [10] 5705 	ld	hl,#6
   67D4 39            [11] 5706 	add	hl,sp
   67D5 F9            [ 6] 5707 	ld	sp,hl
   67D6 21 08 04      [10] 5708 	ld	hl,#0x0408
   67D9 CD 3C 69      [17] 5709 	call	_cpct_isKeyPressed
   67DC 7D            [ 4] 5710 	ld	a,l
   67DD D1            [10] 5711 	pop	de
   67DE B7            [ 4] 5712 	or	a, a
   67DF 28 CB         [12] 5713 	jr	Z,00104$
                           5714 ;src/main.c:564: return;
   67E1 C9            [10] 5715 	ret
   67E2                    5716 ___str_5:
   67E2 4C 6F 75 6E 67 65  5717 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   67F2 00                 5718 	.db 0x00
   67F3                    5719 ___str_6:
   67F3 4A 6F 73 65 70 20  5720 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   6808 00                 5721 	.db 0x00
   6809                    5722 ___str_7:
   6809 41 6C 62 65 72 74  5723 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   6822 00                 5724 	.db 0x00
                           5725 ;src/main.c:574: void main(void) {
                           5726 ;	---------------------------------
                           5727 ; Function main
                           5728 ; ---------------------------------
   6823                    5729 _main::
                           5730 ;src/main.c:578: init();
   6823 CD 8D 57      [17] 5731 	call	_init
                           5732 ;src/main.c:581: while(1){
   6826                    5733 00106$:
                           5734 ;src/main.c:582: x=menu();
   6826 CD 5F 58      [17] 5735 	call	_menu
   6829 5D            [ 4] 5736 	ld	e, l
   682A 54            [ 4] 5737 	ld	d, h
                           5738 ;src/main.c:583: switch(x){
   682B CB 7A         [ 8] 5739 	bit	7, d
   682D 20 F7         [12] 5740 	jr	NZ,00106$
   682F 3E 02         [ 7] 5741 	ld	a,#0x02
   6831 BB            [ 4] 5742 	cp	a, e
   6832 3E 00         [ 7] 5743 	ld	a,#0x00
   6834 9A            [ 4] 5744 	sbc	a, d
   6835 E2 3A 68      [10] 5745 	jp	PO, 00122$
   6838 EE 80         [ 7] 5746 	xor	a, #0x80
   683A                    5747 00122$:
   683A FA 26 68      [10] 5748 	jp	M,00106$
   683D 16 00         [ 7] 5749 	ld	d,#0x00
   683F 21 45 68      [10] 5750 	ld	hl,#00123$
   6842 19            [11] 5751 	add	hl,de
   6843 19            [11] 5752 	add	hl,de
                           5753 ;src/main.c:584: case 0: return;break;
                           5754 ;src/main.c:585: case 1: game(); break;
   6844 E9            [ 4] 5755 	jp	(hl)
   6845                    5756 00123$:
   6845 18 10         [12] 5757 	jr	00108$
   6847 18 04         [12] 5758 	jr	00102$
   6849 18 07         [12] 5759 	jr	00103$
   684B 18 0A         [12] 5760 	jr	00108$
   684D                    5761 00102$:
   684D CD 36 66      [17] 5762 	call	_game
   6850 18 D4         [12] 5763 	jr	00106$
                           5764 ;src/main.c:586: case 2: credits();break;
   6852                    5765 00103$:
   6852 CD 80 67      [17] 5766 	call	_credits
                           5767 ;src/main.c:587: }
   6855 18 CF         [12] 5768 	jr	00106$
   6857                    5769 00108$:
   6857 C9            [10] 5770 	ret
                           5771 	.area _CODE
                           5772 	.area _INITIALIZER
                           5773 	.area _CABS (ABS)
