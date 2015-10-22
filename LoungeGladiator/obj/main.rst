                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Thu Oct 22 22:36:41 2015
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
                             15 	.globl _move
                             16 	.globl _followPlayer
                             17 	.globl _checkBoundsCollisions
                             18 	.globl _checkBoundsCollisionsEnemy
                             19 	.globl _moveObject
                             20 	.globl _menu
                             21 	.globl _gameOver
                             22 	.globl _initEnemies
                             23 	.globl _initPlayer
                             24 	.globl _init
                             25 	.globl _checkKeyboard
                             26 	.globl _checkArrowCollisions
                             27 	.globl _checkCollisions
                             28 	.globl _patrol
                             29 	.globl _movement
                             30 	.globl _setDirection
                             31 	.globl _chooseDirection
                             32 	.globl _detectPlayerRoom
                             33 	.globl _drawPickUps
                             34 	.globl _drawFatiga
                             35 	.globl _erases
                             36 	.globl _draws
                             37 	.globl _drawStats
                             38 	.globl _erase
                             39 	.globl _draw
                             40 	.globl _drawBullets
                             41 	.globl _drawVida
                             42 	.globl _drawMap
                             43 	.globl _cpct_getScreenPtr
                             44 	.globl _cpct_setPalette
                             45 	.globl _cpct_fw2hw
                             46 	.globl _cpct_waitVSYNC
                             47 	.globl _cpct_setVideoMode
                             48 	.globl _cpct_drawStringM0
                             49 	.globl _cpct_drawSolidBox
                             50 	.globl _cpct_drawSpriteMasked
                             51 	.globl _cpct_drawSprite
                             52 	.globl _cpct_isKeyPressed
                             53 	.globl _cpct_scanKeyboard_f
                             54 	.globl _cpct_scanKeyboard
                             55 	.globl _cpct_memset
                             56 	.globl _cpct_disableFirmware
                             57 	.globl _rand
                             58 	.globl _enemy
                             59 	.globl _player
                             60 	.globl _earrow
                             61 	.globl _parrow
                             62 	.globl _archer
                             63 	.globl _bounds
                             64 	.globl _bound
                             65 	.globl _following
                             66 	.globl _shooted
                             67 	.globl _arrow
                             68 	.globl _finish
                             69 	.globl _path
                             70 	.globl _map
                             71 	.globl _temp
                             72 	.globl _scene
                             73 	.globl _mapa2
                             74 	.globl _mapa1
                             75 	.globl _origins
                             76 	.globl _g_palette
                             77 ;--------------------------------------------------------
                             78 ; special function registers
                             79 ;--------------------------------------------------------
                             80 ;--------------------------------------------------------
                             81 ; ram data
                             82 ;--------------------------------------------------------
                             83 	.area _DATA
   7209                      84 _scene::
   7209                      85 	.ds 240
   72F9                      86 _temp::
   72F9                      87 	.ds 1
   72FA                      88 _map::
   72FA                      89 	.ds 1
   72FB                      90 _path::
   72FB                      91 	.ds 1
   72FC                      92 _finish::
   72FC                      93 	.ds 1
   72FD                      94 _arrow::
   72FD                      95 	.ds 1
   72FE                      96 _shooted::
   72FE                      97 	.ds 1
   72FF                      98 _following::
   72FF                      99 	.ds 1
   7300                     100 _bound::
   7300                     101 	.ds 1
   7301                     102 _bounds::
   7301                     103 	.ds 1
   7302                     104 _archer::
   7302                     105 	.ds 1
   7303                     106 _parrow::
   7303                     107 	.ds 10
   730D                     108 _earrow::
   730D                     109 	.ds 10
   7317                     110 _player::
   7317                     111 	.ds 11
   7322                     112 _enemy::
   7322                     113 	.ds 15
                            114 ;--------------------------------------------------------
                            115 ; ram data
                            116 ;--------------------------------------------------------
                            117 	.area _INITIALIZED
                            118 ;--------------------------------------------------------
                            119 ; absolute external ram data
                            120 ;--------------------------------------------------------
                            121 	.area _DABS (ABS)
                            122 ;--------------------------------------------------------
                            123 ; global & static initialisations
                            124 ;--------------------------------------------------------
                            125 	.area _HOME
                            126 	.area _GSINIT
                            127 	.area _GSFINAL
                            128 	.area _GSINIT
                            129 ;--------------------------------------------------------
                            130 ; Home
                            131 ;--------------------------------------------------------
                            132 	.area _HOME
                            133 	.area _HOME
                            134 ;--------------------------------------------------------
                            135 ; code
                            136 ;--------------------------------------------------------
                            137 	.area _CODE
                            138 ;src/draws.h:14: void drawMap(u8 t){
                            139 ;	---------------------------------
                            140 ; Function drawMap
                            141 ; ---------------------------------
   46C0                     142 _drawMap::
   46C0 DD E5         [15]  143 	push	ix
   46C2 DD 21 00 00   [14]  144 	ld	ix,#0
   46C6 DD 39         [15]  145 	add	ix,sp
   46C8 21 F0 FF      [10]  146 	ld	hl,#-16
   46CB 39            [11]  147 	add	hl,sp
   46CC F9            [ 6]  148 	ld	sp,hl
                            149 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  150 	ld	a,4 (ix)
   46D0 3D            [ 4]  151 	dec	a
   46D1 C2 79 47      [10]  152 	jp	NZ,00104$
                            153 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  154 	ld	hl,#0x0000
   46D7 E3            [19]  155 	ex	(sp), hl
   46D8 DD 36 F8 00   [19]  156 	ld	-8 (ix),#0x00
   46DC DD 36 F9 00   [19]  157 	ld	-7 (ix),#0x00
                            158 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     159 00130$:
   46E0 3E 09         [ 7]  160 	ld	a,#<(_scene)
   46E2 DD 86 F8      [19]  161 	add	a, -8 (ix)
   46E5 DD 77 FE      [19]  162 	ld	-2 (ix),a
   46E8 3E 72         [ 7]  163 	ld	a,#>(_scene)
   46EA DD 8E F9      [19]  164 	adc	a, -7 (ix)
   46ED DD 77 FF      [19]  165 	ld	-1 (ix),a
   46F0 3E 17         [ 7]  166 	ld	a,#<(_mapa1)
   46F2 DD 86 F8      [19]  167 	add	a, -8 (ix)
   46F5 DD 77 FA      [19]  168 	ld	-6 (ix),a
   46F8 3E 49         [ 7]  169 	ld	a,#>(_mapa1)
   46FA DD 8E F9      [19]  170 	adc	a, -7 (ix)
   46FD DD 77 FB      [19]  171 	ld	-5 (ix),a
   4700 DD 36 F2 00   [19]  172 	ld	-14 (ix),#0x00
   4704 DD 36 F3 00   [19]  173 	ld	-13 (ix),#0x00
   4708                     174 00115$:
                            175 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E FE      [19]  176 	ld	a,-2 (ix)
   470B DD 86 F2      [19]  177 	add	a, -14 (ix)
   470E DD 77 FC      [19]  178 	ld	-4 (ix),a
   4711 DD 7E FF      [19]  179 	ld	a,-1 (ix)
   4714 DD 8E F3      [19]  180 	adc	a, -13 (ix)
   4717 DD 77 FD      [19]  181 	ld	-3 (ix),a
   471A DD 7E FA      [19]  182 	ld	a,-6 (ix)
   471D DD 86 F2      [19]  183 	add	a, -14 (ix)
   4720 DD 77 F6      [19]  184 	ld	-10 (ix),a
   4723 DD 7E FB      [19]  185 	ld	a,-5 (ix)
   4726 DD 8E F3      [19]  186 	adc	a, -13 (ix)
   4729 DD 77 F7      [19]  187 	ld	-9 (ix),a
   472C DD 6E F6      [19]  188 	ld	l,-10 (ix)
   472F DD 66 F7      [19]  189 	ld	h,-9 (ix)
   4732 7E            [ 7]  190 	ld	a,(hl)
   4733 DD 6E FC      [19]  191 	ld	l,-4 (ix)
   4736 DD 66 FD      [19]  192 	ld	h,-3 (ix)
   4739 77            [ 7]  193 	ld	(hl),a
                            194 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F2      [23]  195 	inc	-14 (ix)
   473D 20 03         [12]  196 	jr	NZ,00189$
   473F DD 34 F3      [23]  197 	inc	-13 (ix)
   4742                     198 00189$:
   4742 DD 7E F2      [19]  199 	ld	a,-14 (ix)
   4745 D6 14         [ 7]  200 	sub	a, #0x14
   4747 DD 7E F3      [19]  201 	ld	a,-13 (ix)
   474A 17            [ 4]  202 	rla
   474B 3F            [ 4]  203 	ccf
   474C 1F            [ 4]  204 	rra
   474D DE 80         [ 7]  205 	sbc	a, #0x80
   474F 38 B7         [12]  206 	jr	C,00115$
                            207 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E F8      [19]  208 	ld	a,-8 (ix)
   4754 C6 14         [ 7]  209 	add	a, #0x14
   4756 DD 77 F8      [19]  210 	ld	-8 (ix),a
   4759 DD 7E F9      [19]  211 	ld	a,-7 (ix)
   475C CE 00         [ 7]  212 	adc	a, #0x00
   475E DD 77 F9      [19]  213 	ld	-7 (ix),a
   4761 DD 34 F0      [23]  214 	inc	-16 (ix)
   4764 20 03         [12]  215 	jr	NZ,00190$
   4766 DD 34 F1      [23]  216 	inc	-15 (ix)
   4769                     217 00190$:
   4769 DD 7E F0      [19]  218 	ld	a,-16 (ix)
   476C D6 0C         [ 7]  219 	sub	a, #0x0C
   476E DD 7E F1      [19]  220 	ld	a,-15 (ix)
   4771 17            [ 4]  221 	rla
   4772 3F            [ 4]  222 	ccf
   4773 1F            [ 4]  223 	rra
   4774 DE 80         [ 7]  224 	sbc	a, #0x80
   4776 DA E0 46      [10]  225 	jp	C,00130$
   4779                     226 00104$:
                            227 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  228 	ld	a,4 (ix)
   477C D6 02         [ 7]  229 	sub	a, #0x02
   477E C2 26 48      [10]  230 	jp	NZ,00141$
                            231 ;src/draws.h:27: for(y=0;y<height;y++){
   4781 21 00 00      [10]  232 	ld	hl,#0x0000
   4784 E3            [19]  233 	ex	(sp), hl
   4785 DD 36 F6 00   [19]  234 	ld	-10 (ix),#0x00
   4789 DD 36 F7 00   [19]  235 	ld	-9 (ix),#0x00
                            236 ;src/draws.h:28: for(x=0;x<width;x++){
   478D                     237 00134$:
   478D 3E 09         [ 7]  238 	ld	a,#<(_scene)
   478F DD 86 F6      [19]  239 	add	a, -10 (ix)
   4792 DD 77 FC      [19]  240 	ld	-4 (ix),a
   4795 3E 72         [ 7]  241 	ld	a,#>(_scene)
   4797 DD 8E F7      [19]  242 	adc	a, -9 (ix)
   479A DD 77 FD      [19]  243 	ld	-3 (ix),a
   479D 3E 07         [ 7]  244 	ld	a,#<(_mapa2)
   479F DD 86 F6      [19]  245 	add	a, -10 (ix)
   47A2 DD 77 FA      [19]  246 	ld	-6 (ix),a
   47A5 3E 4A         [ 7]  247 	ld	a,#>(_mapa2)
   47A7 DD 8E F7      [19]  248 	adc	a, -9 (ix)
   47AA DD 77 FB      [19]  249 	ld	-5 (ix),a
   47AD DD 36 F2 00   [19]  250 	ld	-14 (ix),#0x00
   47B1 DD 36 F3 00   [19]  251 	ld	-13 (ix),#0x00
   47B5                     252 00119$:
                            253 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   47B5 DD 7E FC      [19]  254 	ld	a,-4 (ix)
   47B8 DD 86 F2      [19]  255 	add	a, -14 (ix)
   47BB DD 77 FE      [19]  256 	ld	-2 (ix),a
   47BE DD 7E FD      [19]  257 	ld	a,-3 (ix)
   47C1 DD 8E F3      [19]  258 	adc	a, -13 (ix)
   47C4 DD 77 FF      [19]  259 	ld	-1 (ix),a
   47C7 DD 7E FA      [19]  260 	ld	a,-6 (ix)
   47CA DD 86 F2      [19]  261 	add	a, -14 (ix)
   47CD DD 77 F8      [19]  262 	ld	-8 (ix),a
   47D0 DD 7E FB      [19]  263 	ld	a,-5 (ix)
   47D3 DD 8E F3      [19]  264 	adc	a, -13 (ix)
   47D6 DD 77 F9      [19]  265 	ld	-7 (ix),a
   47D9 DD 6E F8      [19]  266 	ld	l,-8 (ix)
   47DC DD 66 F9      [19]  267 	ld	h,-7 (ix)
   47DF 7E            [ 7]  268 	ld	a,(hl)
   47E0 DD 6E FE      [19]  269 	ld	l,-2 (ix)
   47E3 DD 66 FF      [19]  270 	ld	h,-1 (ix)
   47E6 77            [ 7]  271 	ld	(hl),a
                            272 ;src/draws.h:28: for(x=0;x<width;x++){
   47E7 DD 34 F2      [23]  273 	inc	-14 (ix)
   47EA 20 03         [12]  274 	jr	NZ,00193$
   47EC DD 34 F3      [23]  275 	inc	-13 (ix)
   47EF                     276 00193$:
   47EF DD 7E F2      [19]  277 	ld	a,-14 (ix)
   47F2 D6 14         [ 7]  278 	sub	a, #0x14
   47F4 DD 7E F3      [19]  279 	ld	a,-13 (ix)
   47F7 17            [ 4]  280 	rla
   47F8 3F            [ 4]  281 	ccf
   47F9 1F            [ 4]  282 	rra
   47FA DE 80         [ 7]  283 	sbc	a, #0x80
   47FC 38 B7         [12]  284 	jr	C,00119$
                            285 ;src/draws.h:27: for(y=0;y<height;y++){
   47FE DD 7E F6      [19]  286 	ld	a,-10 (ix)
   4801 C6 14         [ 7]  287 	add	a, #0x14
   4803 DD 77 F6      [19]  288 	ld	-10 (ix),a
   4806 DD 7E F7      [19]  289 	ld	a,-9 (ix)
   4809 CE 00         [ 7]  290 	adc	a, #0x00
   480B DD 77 F7      [19]  291 	ld	-9 (ix),a
   480E DD 34 F0      [23]  292 	inc	-16 (ix)
   4811 20 03         [12]  293 	jr	NZ,00194$
   4813 DD 34 F1      [23]  294 	inc	-15 (ix)
   4816                     295 00194$:
   4816 DD 7E F0      [19]  296 	ld	a,-16 (ix)
   4819 D6 0C         [ 7]  297 	sub	a, #0x0C
   481B DD 7E F1      [19]  298 	ld	a,-15 (ix)
   481E 17            [ 4]  299 	rla
   481F 3F            [ 4]  300 	ccf
   4820 1F            [ 4]  301 	rra
   4821 DE 80         [ 7]  302 	sbc	a, #0x80
   4823 DA 8D 47      [10]  303 	jp	C,00134$
                            304 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   4826                     305 00141$:
   4826 01 00 00      [10]  306 	ld	bc,#0x0000
   4829 DD 36 F6 00   [19]  307 	ld	-10 (ix),#0x00
   482D DD 36 F7 00   [19]  308 	ld	-9 (ix),#0x00
   4831 11 00 00      [10]  309 	ld	de,#0x0000
                            310 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4834                     311 00139$:
   4834 21 09 72      [10]  312 	ld	hl,#_scene
   4837 19            [11]  313 	add	hl,de
   4838 DD 75 FC      [19]  314 	ld	-4 (ix),l
   483B DD 74 FD      [19]  315 	ld	-3 (ix),h
   483E DD 36 F4 00   [19]  316 	ld	-12 (ix),#0x00
   4842 DD 36 F5 00   [19]  317 	ld	-11 (ix),#0x00
   4846                     318 00123$:
                            319 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   4846 79            [ 4]  320 	ld	a,c
   4847 07            [ 4]  321 	rlca
   4848 07            [ 4]  322 	rlca
   4849 07            [ 4]  323 	rlca
   484A 07            [ 4]  324 	rlca
   484B E6 F0         [ 7]  325 	and	a,#0xF0
   484D 67            [ 4]  326 	ld	h,a
   484E DD 7E F4      [19]  327 	ld	a,-12 (ix)
   4851 87            [ 4]  328 	add	a, a
   4852 87            [ 4]  329 	add	a, a
   4853 C5            [11]  330 	push	bc
   4854 D5            [11]  331 	push	de
   4855 E5            [11]  332 	push	hl
   4856 33            [ 6]  333 	inc	sp
   4857 F5            [11]  334 	push	af
   4858 33            [ 6]  335 	inc	sp
   4859 21 00 C0      [10]  336 	ld	hl,#0xC000
   485C E5            [11]  337 	push	hl
   485D CD 13 71      [17]  338 	call	_cpct_getScreenPtr
   4860 D1            [10]  339 	pop	de
   4861 C1            [10]  340 	pop	bc
   4862 E5            [11]  341 	push	hl
   4863 FD E1         [14]  342 	pop	iy
                            343 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4865 DD 7E FC      [19]  344 	ld	a,-4 (ix)
   4868 DD 86 F4      [19]  345 	add	a, -12 (ix)
   486B 6F            [ 4]  346 	ld	l,a
   486C DD 7E FD      [19]  347 	ld	a,-3 (ix)
   486F DD 8E F5      [19]  348 	adc	a, -11 (ix)
   4872 67            [ 4]  349 	ld	h,a
   4873 66            [ 7]  350 	ld	h,(hl)
                            351 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4874 FD E5         [15]  352 	push	iy
   4876 F1            [10]  353 	pop	af
   4877 DD 77 FB      [19]  354 	ld	-5 (ix),a
   487A FD E5         [15]  355 	push	iy
   487C 3B            [ 6]  356 	dec	sp
   487D F1            [10]  357 	pop	af
   487E 33            [ 6]  358 	inc	sp
   487F DD 77 FA      [19]  359 	ld	-6 (ix),a
                            360 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4882 25            [ 4]  361 	dec	h
   4883 20 16         [12]  362 	jr	NZ,00110$
                            363 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4885 C5            [11]  364 	push	bc
   4886 D5            [11]  365 	push	de
   4887 21 04 10      [10]  366 	ld	hl,#0x1004
   488A E5            [11]  367 	push	hl
   488B DD 6E FA      [19]  368 	ld	l,-6 (ix)
   488E DD 66 FB      [19]  369 	ld	h,-5 (ix)
   4891 E5            [11]  370 	push	hl
   4892 21 61 6C      [10]  371 	ld	hl,#_muro
   4895 E5            [11]  372 	push	hl
   4896 CD 56 6E      [17]  373 	call	_cpct_drawSprite
   4899 D1            [10]  374 	pop	de
   489A C1            [10]  375 	pop	bc
   489B                     376 00110$:
                            377 ;src/draws.h:40: if(scene[posY][posX] == 9){
   489B 3E 09         [ 7]  378 	ld	a,#<(_scene)
   489D DD 86 F6      [19]  379 	add	a, -10 (ix)
   48A0 6F            [ 4]  380 	ld	l,a
   48A1 3E 72         [ 7]  381 	ld	a,#>(_scene)
   48A3 DD 8E F7      [19]  382 	adc	a, -9 (ix)
   48A6 67            [ 4]  383 	ld	h,a
   48A7 7D            [ 4]  384 	ld	a,l
   48A8 DD 86 F4      [19]  385 	add	a, -12 (ix)
   48AB 6F            [ 4]  386 	ld	l,a
   48AC 7C            [ 4]  387 	ld	a,h
   48AD DD 8E F5      [19]  388 	adc	a, -11 (ix)
   48B0 67            [ 4]  389 	ld	h,a
   48B1 7E            [ 7]  390 	ld	a,(hl)
   48B2 D6 09         [ 7]  391 	sub	a, #0x09
   48B4 20 19         [12]  392 	jr	NZ,00124$
                            393 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   48B6 C5            [11]  394 	push	bc
   48B7 D5            [11]  395 	push	de
   48B8 21 04 10      [10]  396 	ld	hl,#0x1004
   48BB E5            [11]  397 	push	hl
   48BC 3E 09         [ 7]  398 	ld	a,#0x09
   48BE F5            [11]  399 	push	af
   48BF 33            [ 6]  400 	inc	sp
   48C0 DD 6E FA      [19]  401 	ld	l,-6 (ix)
   48C3 DD 66 FB      [19]  402 	ld	h,-5 (ix)
   48C6 E5            [11]  403 	push	hl
   48C7 CD 42 70      [17]  404 	call	_cpct_drawSolidBox
   48CA F1            [10]  405 	pop	af
   48CB F1            [10]  406 	pop	af
   48CC 33            [ 6]  407 	inc	sp
   48CD D1            [10]  408 	pop	de
   48CE C1            [10]  409 	pop	bc
   48CF                     410 00124$:
                            411 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   48CF DD 34 F4      [23]  412 	inc	-12 (ix)
   48D2 20 03         [12]  413 	jr	NZ,00199$
   48D4 DD 34 F5      [23]  414 	inc	-11 (ix)
   48D7                     415 00199$:
   48D7 DD 7E F4      [19]  416 	ld	a,-12 (ix)
   48DA D6 14         [ 7]  417 	sub	a, #0x14
   48DC DD 7E F5      [19]  418 	ld	a,-11 (ix)
   48DF 17            [ 4]  419 	rla
   48E0 3F            [ 4]  420 	ccf
   48E1 1F            [ 4]  421 	rra
   48E2 DE 80         [ 7]  422 	sbc	a, #0x80
   48E4 DA 46 48      [10]  423 	jp	C,00123$
                            424 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   48E7 DD 7E F6      [19]  425 	ld	a,-10 (ix)
   48EA C6 14         [ 7]  426 	add	a, #0x14
   48EC DD 77 F6      [19]  427 	ld	-10 (ix),a
   48EF DD 7E F7      [19]  428 	ld	a,-9 (ix)
   48F2 CE 00         [ 7]  429 	adc	a, #0x00
   48F4 DD 77 F7      [19]  430 	ld	-9 (ix),a
   48F7 21 14 00      [10]  431 	ld	hl,#0x0014
   48FA 19            [11]  432 	add	hl,de
   48FB EB            [ 4]  433 	ex	de,hl
   48FC 03            [ 6]  434 	inc	bc
   48FD 79            [ 4]  435 	ld	a,c
   48FE D6 0C         [ 7]  436 	sub	a, #0x0C
   4900 78            [ 4]  437 	ld	a,b
   4901 17            [ 4]  438 	rla
   4902 3F            [ 4]  439 	ccf
   4903 1F            [ 4]  440 	rra
   4904 DE 80         [ 7]  441 	sbc	a, #0x80
   4906 DA 34 48      [10]  442 	jp	C,00139$
   4909 DD F9         [10]  443 	ld	sp, ix
   490B DD E1         [14]  444 	pop	ix
   490D C9            [10]  445 	ret
   490E                     446 _g_palette:
   490E 00                  447 	.db #0x00	; 0
   490F 1A                  448 	.db #0x1A	; 26
   4910 06                  449 	.db #0x06	; 6
   4911 0D                  450 	.db #0x0D	; 13
   4912 00                  451 	.db 0x00
   4913                     452 _origins:
   4913 00                  453 	.db #0x00	; 0
   4914 50                  454 	.db #0x50	; 80	'P'
   4915 34                  455 	.db #0x34	; 52	'4'
   4916 50                  456 	.db #0x50	; 80	'P'
   4917                     457 _mapa1:
   4917 01                  458 	.db #0x01	; 1
   4918 01                  459 	.db #0x01	; 1
   4919 01                  460 	.db #0x01	; 1
   491A 01                  461 	.db #0x01	; 1
   491B 01                  462 	.db #0x01	; 1
   491C 01                  463 	.db #0x01	; 1
   491D 01                  464 	.db #0x01	; 1
   491E 01                  465 	.db #0x01	; 1
   491F 01                  466 	.db #0x01	; 1
   4920 01                  467 	.db #0x01	; 1
   4921 01                  468 	.db #0x01	; 1
   4922 01                  469 	.db #0x01	; 1
   4923 01                  470 	.db #0x01	; 1
   4924 01                  471 	.db #0x01	; 1
   4925 01                  472 	.db #0x01	; 1
   4926 01                  473 	.db #0x01	; 1
   4927 01                  474 	.db #0x01	; 1
   4928 01                  475 	.db #0x01	; 1
   4929 01                  476 	.db #0x01	; 1
   492A 01                  477 	.db #0x01	; 1
   492B 01                  478 	.db #0x01	; 1
   492C 07                  479 	.db #0x07	; 7
   492D 05                  480 	.db #0x05	; 5
   492E 07                  481 	.db #0x07	; 7
   492F 07                  482 	.db #0x07	; 7
   4930 07                  483 	.db #0x07	; 7
   4931 07                  484 	.db #0x07	; 7
   4932 07                  485 	.db #0x07	; 7
   4933 07                  486 	.db #0x07	; 7
   4934 07                  487 	.db #0x07	; 7
   4935 07                  488 	.db #0x07	; 7
   4936 07                  489 	.db #0x07	; 7
   4937 07                  490 	.db #0x07	; 7
   4938 07                  491 	.db #0x07	; 7
   4939 07                  492 	.db #0x07	; 7
   493A 07                  493 	.db #0x07	; 7
   493B 07                  494 	.db #0x07	; 7
   493C 07                  495 	.db #0x07	; 7
   493D 07                  496 	.db #0x07	; 7
   493E 01                  497 	.db #0x01	; 1
   493F 01                  498 	.db #0x01	; 1
   4940 07                  499 	.db #0x07	; 7
   4941 07                  500 	.db #0x07	; 7
   4942 07                  501 	.db #0x07	; 7
   4943 07                  502 	.db #0x07	; 7
   4944 07                  503 	.db #0x07	; 7
   4945 07                  504 	.db #0x07	; 7
   4946 07                  505 	.db #0x07	; 7
   4947 07                  506 	.db #0x07	; 7
   4948 07                  507 	.db #0x07	; 7
   4949 07                  508 	.db #0x07	; 7
   494A 07                  509 	.db #0x07	; 7
   494B 07                  510 	.db #0x07	; 7
   494C 07                  511 	.db #0x07	; 7
   494D 07                  512 	.db #0x07	; 7
   494E 07                  513 	.db #0x07	; 7
   494F 07                  514 	.db #0x07	; 7
   4950 07                  515 	.db #0x07	; 7
   4951 07                  516 	.db #0x07	; 7
   4952 01                  517 	.db #0x01	; 1
   4953 01                  518 	.db #0x01	; 1
   4954 01                  519 	.db #0x01	; 1
   4955 01                  520 	.db #0x01	; 1
   4956 01                  521 	.db #0x01	; 1
   4957 01                  522 	.db #0x01	; 1
   4958 01                  523 	.db #0x01	; 1
   4959 01                  524 	.db #0x01	; 1
   495A 01                  525 	.db #0x01	; 1
   495B 01                  526 	.db #0x01	; 1
   495C 07                  527 	.db #0x07	; 7
   495D 07                  528 	.db #0x07	; 7
   495E 01                  529 	.db #0x01	; 1
   495F 01                  530 	.db #0x01	; 1
   4960 01                  531 	.db #0x01	; 1
   4961 01                  532 	.db #0x01	; 1
   4962 07                  533 	.db #0x07	; 7
   4963 07                  534 	.db #0x07	; 7
   4964 01                  535 	.db #0x01	; 1
   4965 01                  536 	.db #0x01	; 1
   4966 01                  537 	.db #0x01	; 1
   4967 01                  538 	.db #0x01	; 1
   4968 00                  539 	.db #0x00	; 0
   4969 00                  540 	.db #0x00	; 0
   496A 00                  541 	.db #0x00	; 0
   496B 00                  542 	.db #0x00	; 0
   496C 00                  543 	.db #0x00	; 0
   496D 00                  544 	.db #0x00	; 0
   496E 00                  545 	.db #0x00	; 0
   496F 06                  546 	.db #0x06	; 6
   4970 06                  547 	.db #0x06	; 6
   4971 06                  548 	.db #0x06	; 6
   4972 01                  549 	.db #0x01	; 1
   4973 03                  550 	.db #0x03	; 3
   4974 03                  551 	.db #0x03	; 3
   4975 03                  552 	.db #0x03	; 3
   4976 03                  553 	.db #0x03	; 3
   4977 03                  554 	.db #0x03	; 3
   4978 03                  555 	.db #0x03	; 3
   4979 03                  556 	.db #0x03	; 3
   497A 01                  557 	.db #0x01	; 1
   497B 00                  558 	.db #0x00	; 0
   497C 00                  559 	.db #0x00	; 0
   497D 01                  560 	.db #0x01	; 1
   497E 01                  561 	.db #0x01	; 1
   497F 04                  562 	.db #0x04	; 4
   4980 04                  563 	.db #0x04	; 4
   4981 01                  564 	.db #0x01	; 1
   4982 01                  565 	.db #0x01	; 1
   4983 06                  566 	.db #0x06	; 6
   4984 06                  567 	.db #0x06	; 6
   4985 06                  568 	.db #0x06	; 6
   4986 01                  569 	.db #0x01	; 1
   4987 03                  570 	.db #0x03	; 3
   4988 03                  571 	.db #0x03	; 3
   4989 03                  572 	.db #0x03	; 3
   498A 03                  573 	.db #0x03	; 3
   498B 03                  574 	.db #0x03	; 3
   498C 03                  575 	.db #0x03	; 3
   498D 03                  576 	.db #0x03	; 3
   498E 01                  577 	.db #0x01	; 1
   498F 01                  578 	.db #0x01	; 1
   4990 00                  579 	.db #0x00	; 0
   4991 01                  580 	.db #0x01	; 1
   4992 04                  581 	.db #0x04	; 4
   4993 04                  582 	.db #0x04	; 4
   4994 04                  583 	.db #0x04	; 4
   4995 04                  584 	.db #0x04	; 4
   4996 01                  585 	.db #0x01	; 1
   4997 06                  586 	.db #0x06	; 6
   4998 06                  587 	.db #0x06	; 6
   4999 06                  588 	.db #0x06	; 6
   499A 01                  589 	.db #0x01	; 1
   499B 03                  590 	.db #0x03	; 3
   499C 03                  591 	.db #0x03	; 3
   499D 03                  592 	.db #0x03	; 3
   499E 03                  593 	.db #0x03	; 3
   499F 03                  594 	.db #0x03	; 3
   49A0 03                  595 	.db #0x03	; 3
   49A1 03                  596 	.db #0x03	; 3
   49A2 01                  597 	.db #0x01	; 1
   49A3 01                  598 	.db #0x01	; 1
   49A4 00                  599 	.db #0x00	; 0
   49A5 01                  600 	.db #0x01	; 1
   49A6 04                  601 	.db #0x04	; 4
   49A7 04                  602 	.db #0x04	; 4
   49A8 04                  603 	.db #0x04	; 4
   49A9 04                  604 	.db #0x04	; 4
   49AA 01                  605 	.db #0x01	; 1
   49AB 06                  606 	.db #0x06	; 6
   49AC 06                  607 	.db #0x06	; 6
   49AD 06                  608 	.db #0x06	; 6
   49AE 01                  609 	.db #0x01	; 1
   49AF 03                  610 	.db #0x03	; 3
   49B0 03                  611 	.db #0x03	; 3
   49B1 03                  612 	.db #0x03	; 3
   49B2 03                  613 	.db #0x03	; 3
   49B3 03                  614 	.db #0x03	; 3
   49B4 03                  615 	.db #0x03	; 3
   49B5 03                  616 	.db #0x03	; 3
   49B6 01                  617 	.db #0x01	; 1
   49B7 01                  618 	.db #0x01	; 1
   49B8 00                  619 	.db #0x00	; 0
   49B9 01                  620 	.db #0x01	; 1
   49BA 04                  621 	.db #0x04	; 4
   49BB 04                  622 	.db #0x04	; 4
   49BC 04                  623 	.db #0x04	; 4
   49BD 04                  624 	.db #0x04	; 4
   49BE 01                  625 	.db #0x01	; 1
   49BF 06                  626 	.db #0x06	; 6
   49C0 06                  627 	.db #0x06	; 6
   49C1 06                  628 	.db #0x06	; 6
   49C2 01                  629 	.db #0x01	; 1
   49C3 03                  630 	.db #0x03	; 3
   49C4 03                  631 	.db #0x03	; 3
   49C5 03                  632 	.db #0x03	; 3
   49C6 03                  633 	.db #0x03	; 3
   49C7 03                  634 	.db #0x03	; 3
   49C8 03                  635 	.db #0x03	; 3
   49C9 03                  636 	.db #0x03	; 3
   49CA 01                  637 	.db #0x01	; 1
   49CB 01                  638 	.db #0x01	; 1
   49CC 00                  639 	.db #0x00	; 0
   49CD 01                  640 	.db #0x01	; 1
   49CE 04                  641 	.db #0x04	; 4
   49CF 04                  642 	.db #0x04	; 4
   49D0 04                  643 	.db #0x04	; 4
   49D1 04                  644 	.db #0x04	; 4
   49D2 01                  645 	.db #0x01	; 1
   49D3 06                  646 	.db #0x06	; 6
   49D4 06                  647 	.db #0x06	; 6
   49D5 06                  648 	.db #0x06	; 6
   49D6 01                  649 	.db #0x01	; 1
   49D7 03                  650 	.db #0x03	; 3
   49D8 03                  651 	.db #0x03	; 3
   49D9 03                  652 	.db #0x03	; 3
   49DA 03                  653 	.db #0x03	; 3
   49DB 03                  654 	.db #0x03	; 3
   49DC 03                  655 	.db #0x03	; 3
   49DD 03                  656 	.db #0x03	; 3
   49DE 01                  657 	.db #0x01	; 1
   49DF 01                  658 	.db #0x01	; 1
   49E0 02                  659 	.db #0x02	; 2
   49E1 01                  660 	.db #0x01	; 1
   49E2 04                  661 	.db #0x04	; 4
   49E3 04                  662 	.db #0x04	; 4
   49E4 04                  663 	.db #0x04	; 4
   49E5 04                  664 	.db #0x04	; 4
   49E6 01                  665 	.db #0x01	; 1
   49E7 06                  666 	.db #0x06	; 6
   49E8 06                  667 	.db #0x06	; 6
   49E9 06                  668 	.db #0x06	; 6
   49EA 03                  669 	.db #0x03	; 3
   49EB 03                  670 	.db #0x03	; 3
   49EC 03                  671 	.db #0x03	; 3
   49ED 03                  672 	.db #0x03	; 3
   49EE 03                  673 	.db #0x03	; 3
   49EF 03                  674 	.db #0x03	; 3
   49F0 03                  675 	.db #0x03	; 3
   49F1 03                  676 	.db #0x03	; 3
   49F2 01                  677 	.db #0x01	; 1
   49F3 01                  678 	.db #0x01	; 1
   49F4 01                  679 	.db #0x01	; 1
   49F5 01                  680 	.db #0x01	; 1
   49F6 01                  681 	.db #0x01	; 1
   49F7 01                  682 	.db #0x01	; 1
   49F8 01                  683 	.db #0x01	; 1
   49F9 01                  684 	.db #0x01	; 1
   49FA 01                  685 	.db #0x01	; 1
   49FB 01                  686 	.db #0x01	; 1
   49FC 01                  687 	.db #0x01	; 1
   49FD 01                  688 	.db #0x01	; 1
   49FE 01                  689 	.db #0x01	; 1
   49FF 01                  690 	.db #0x01	; 1
   4A00 01                  691 	.db #0x01	; 1
   4A01 01                  692 	.db #0x01	; 1
   4A02 09                  693 	.db #0x09	; 9
   4A03 09                  694 	.db #0x09	; 9
   4A04 01                  695 	.db #0x01	; 1
   4A05 01                  696 	.db #0x01	; 1
   4A06 01                  697 	.db #0x01	; 1
   4A07                     698 _mapa2:
   4A07 01                  699 	.db #0x01	; 1
   4A08 01                  700 	.db #0x01	; 1
   4A09 01                  701 	.db #0x01	; 1
   4A0A 01                  702 	.db #0x01	; 1
   4A0B 01                  703 	.db #0x01	; 1
   4A0C 01                  704 	.db #0x01	; 1
   4A0D 01                  705 	.db #0x01	; 1
   4A0E 01                  706 	.db #0x01	; 1
   4A0F 01                  707 	.db #0x01	; 1
   4A10 01                  708 	.db #0x01	; 1
   4A11 01                  709 	.db #0x01	; 1
   4A12 01                  710 	.db #0x01	; 1
   4A13 01                  711 	.db #0x01	; 1
   4A14 01                  712 	.db #0x01	; 1
   4A15 01                  713 	.db #0x01	; 1
   4A16 01                  714 	.db #0x01	; 1
   4A17 01                  715 	.db #0x01	; 1
   4A18 01                  716 	.db #0x01	; 1
   4A19 01                  717 	.db #0x01	; 1
   4A1A 01                  718 	.db #0x01	; 1
   4A1B 01                  719 	.db #0x01	; 1
   4A1C 00                  720 	.db #0x00	; 0
   4A1D 00                  721 	.db #0x00	; 0
   4A1E 00                  722 	.db #0x00	; 0
   4A1F 00                  723 	.db #0x00	; 0
   4A20 01                  724 	.db #0x01	; 1
   4A21 00                  725 	.db #0x00	; 0
   4A22 00                  726 	.db #0x00	; 0
   4A23 00                  727 	.db #0x00	; 0
   4A24 00                  728 	.db #0x00	; 0
   4A25 00                  729 	.db #0x00	; 0
   4A26 00                  730 	.db #0x00	; 0
   4A27 00                  731 	.db #0x00	; 0
   4A28 00                  732 	.db #0x00	; 0
   4A29 00                  733 	.db #0x00	; 0
   4A2A 00                  734 	.db #0x00	; 0
   4A2B 00                  735 	.db #0x00	; 0
   4A2C 00                  736 	.db #0x00	; 0
   4A2D 00                  737 	.db #0x00	; 0
   4A2E 06                  738 	.db #0x06	; 6
   4A2F 01                  739 	.db #0x01	; 1
   4A30 00                  740 	.db #0x00	; 0
   4A31 00                  741 	.db #0x00	; 0
   4A32 01                  742 	.db #0x01	; 1
   4A33 00                  743 	.db #0x00	; 0
   4A34 00                  744 	.db #0x00	; 0
   4A35 00                  745 	.db #0x00	; 0
   4A36 00                  746 	.db #0x00	; 0
   4A37 00                  747 	.db #0x00	; 0
   4A38 00                  748 	.db #0x00	; 0
   4A39 00                  749 	.db #0x00	; 0
   4A3A 00                  750 	.db #0x00	; 0
   4A3B 00                  751 	.db #0x00	; 0
   4A3C 00                  752 	.db #0x00	; 0
   4A3D 00                  753 	.db #0x00	; 0
   4A3E 00                  754 	.db #0x00	; 0
   4A3F 00                  755 	.db #0x00	; 0
   4A40 00                  756 	.db #0x00	; 0
   4A41 00                  757 	.db #0x00	; 0
   4A42 01                  758 	.db #0x01	; 1
   4A43 01                  759 	.db #0x01	; 1
   4A44 00                  760 	.db #0x00	; 0
   4A45 01                  761 	.db #0x01	; 1
   4A46 01                  762 	.db #0x01	; 1
   4A47 01                  763 	.db #0x01	; 1
   4A48 01                  764 	.db #0x01	; 1
   4A49 00                  765 	.db #0x00	; 0
   4A4A 00                  766 	.db #0x00	; 0
   4A4B 01                  767 	.db #0x01	; 1
   4A4C 01                  768 	.db #0x01	; 1
   4A4D 01                  769 	.db #0x01	; 1
   4A4E 01                  770 	.db #0x01	; 1
   4A4F 01                  771 	.db #0x01	; 1
   4A50 01                  772 	.db #0x01	; 1
   4A51 01                  773 	.db #0x01	; 1
   4A52 01                  774 	.db #0x01	; 1
   4A53 01                  775 	.db #0x01	; 1
   4A54 01                  776 	.db #0x01	; 1
   4A55 01                  777 	.db #0x01	; 1
   4A56 01                  778 	.db #0x01	; 1
   4A57 01                  779 	.db #0x01	; 1
   4A58 00                  780 	.db #0x00	; 0
   4A59 05                  781 	.db #0x05	; 5
   4A5A 01                  782 	.db #0x01	; 1
   4A5B 00                  783 	.db #0x00	; 0
   4A5C 00                  784 	.db #0x00	; 0
   4A5D 00                  785 	.db #0x00	; 0
   4A5E 00                  786 	.db #0x00	; 0
   4A5F 00                  787 	.db #0x00	; 0
   4A60 00                  788 	.db #0x00	; 0
   4A61 00                  789 	.db #0x00	; 0
   4A62 01                  790 	.db #0x01	; 1
   4A63 00                  791 	.db #0x00	; 0
   4A64 00                  792 	.db #0x00	; 0
   4A65 00                  793 	.db #0x00	; 0
   4A66 00                  794 	.db #0x00	; 0
   4A67 00                  795 	.db #0x00	; 0
   4A68 00                  796 	.db #0x00	; 0
   4A69 00                  797 	.db #0x00	; 0
   4A6A 01                  798 	.db #0x01	; 1
   4A6B 01                  799 	.db #0x01	; 1
   4A6C 00                  800 	.db #0x00	; 0
   4A6D 01                  801 	.db #0x01	; 1
   4A6E 01                  802 	.db #0x01	; 1
   4A6F 00                  803 	.db #0x00	; 0
   4A70 01                  804 	.db #0x01	; 1
   4A71 01                  805 	.db #0x01	; 1
   4A72 01                  806 	.db #0x01	; 1
   4A73 02                  807 	.db #0x02	; 2
   4A74 02                  808 	.db #0x02	; 2
   4A75 02                  809 	.db #0x02	; 2
   4A76 01                  810 	.db #0x01	; 1
   4A77 00                  811 	.db #0x00	; 0
   4A78 00                  812 	.db #0x00	; 0
   4A79 00                  813 	.db #0x00	; 0
   4A7A 05                  814 	.db #0x05	; 5
   4A7B 00                  815 	.db #0x00	; 0
   4A7C 00                  816 	.db #0x00	; 0
   4A7D 00                  817 	.db #0x00	; 0
   4A7E 01                  818 	.db #0x01	; 1
   4A7F 01                  819 	.db #0x01	; 1
   4A80 00                  820 	.db #0x00	; 0
   4A81 01                  821 	.db #0x01	; 1
   4A82 02                  822 	.db #0x02	; 2
   4A83 02                  823 	.db #0x02	; 2
   4A84 02                  824 	.db #0x02	; 2
   4A85 02                  825 	.db #0x02	; 2
   4A86 01                  826 	.db #0x01	; 1
   4A87 00                  827 	.db #0x00	; 0
   4A88 00                  828 	.db #0x00	; 0
   4A89 00                  829 	.db #0x00	; 0
   4A8A 01                  830 	.db #0x01	; 1
   4A8B 00                  831 	.db #0x00	; 0
   4A8C 00                  832 	.db #0x00	; 0
   4A8D 00                  833 	.db #0x00	; 0
   4A8E 05                  834 	.db #0x05	; 5
   4A8F 00                  835 	.db #0x00	; 0
   4A90 00                  836 	.db #0x00	; 0
   4A91 00                  837 	.db #0x00	; 0
   4A92 01                  838 	.db #0x01	; 1
   4A93 01                  839 	.db #0x01	; 1
   4A94 00                  840 	.db #0x00	; 0
   4A95 01                  841 	.db #0x01	; 1
   4A96 02                  842 	.db #0x02	; 2
   4A97 02                  843 	.db #0x02	; 2
   4A98 02                  844 	.db #0x02	; 2
   4A99 02                  845 	.db #0x02	; 2
   4A9A 01                  846 	.db #0x01	; 1
   4A9B 02                  847 	.db #0x02	; 2
   4A9C 02                  848 	.db #0x02	; 2
   4A9D 02                  849 	.db #0x02	; 2
   4A9E 01                  850 	.db #0x01	; 1
   4A9F 00                  851 	.db #0x00	; 0
   4AA0 00                  852 	.db #0x00	; 0
   4AA1 00                  853 	.db #0x00	; 0
   4AA2 05                  854 	.db #0x05	; 5
   4AA3 00                  855 	.db #0x00	; 0
   4AA4 00                  856 	.db #0x00	; 0
   4AA5 00                  857 	.db #0x00	; 0
   4AA6 01                  858 	.db #0x01	; 1
   4AA7 01                  859 	.db #0x01	; 1
   4AA8 00                  860 	.db #0x00	; 0
   4AA9 01                  861 	.db #0x01	; 1
   4AAA 02                  862 	.db #0x02	; 2
   4AAB 02                  863 	.db #0x02	; 2
   4AAC 02                  864 	.db #0x02	; 2
   4AAD 02                  865 	.db #0x02	; 2
   4AAE 01                  866 	.db #0x01	; 1
   4AAF 00                  867 	.db #0x00	; 0
   4AB0 00                  868 	.db #0x00	; 0
   4AB1 00                  869 	.db #0x00	; 0
   4AB2 01                  870 	.db #0x01	; 1
   4AB3 00                  871 	.db #0x00	; 0
   4AB4 00                  872 	.db #0x00	; 0
   4AB5 00                  873 	.db #0x00	; 0
   4AB6 00                  874 	.db #0x00	; 0
   4AB7 00                  875 	.db #0x00	; 0
   4AB8 00                  876 	.db #0x00	; 0
   4AB9 00                  877 	.db #0x00	; 0
   4ABA 01                  878 	.db #0x01	; 1
   4ABB 01                  879 	.db #0x01	; 1
   4ABC 00                  880 	.db #0x00	; 0
   4ABD 01                  881 	.db #0x01	; 1
   4ABE 02                  882 	.db #0x02	; 2
   4ABF 02                  883 	.db #0x02	; 2
   4AC0 02                  884 	.db #0x02	; 2
   4AC1 02                  885 	.db #0x02	; 2
   4AC2 01                  886 	.db #0x01	; 1
   4AC3 02                  887 	.db #0x02	; 2
   4AC4 02                  888 	.db #0x02	; 2
   4AC5 02                  889 	.db #0x02	; 2
   4AC6 01                  890 	.db #0x01	; 1
   4AC7 00                  891 	.db #0x00	; 0
   4AC8 00                  892 	.db #0x00	; 0
   4AC9 00                  893 	.db #0x00	; 0
   4ACA 00                  894 	.db #0x00	; 0
   4ACB 00                  895 	.db #0x00	; 0
   4ACC 00                  896 	.db #0x00	; 0
   4ACD 00                  897 	.db #0x00	; 0
   4ACE 01                  898 	.db #0x01	; 1
   4ACF 01                  899 	.db #0x01	; 1
   4AD0 05                  900 	.db #0x05	; 5
   4AD1 01                  901 	.db #0x01	; 1
   4AD2 02                  902 	.db #0x02	; 2
   4AD3 02                  903 	.db #0x02	; 2
   4AD4 02                  904 	.db #0x02	; 2
   4AD5 02                  905 	.db #0x02	; 2
   4AD6 01                  906 	.db #0x01	; 1
   4AD7 00                  907 	.db #0x00	; 0
   4AD8 00                  908 	.db #0x00	; 0
   4AD9 00                  909 	.db #0x00	; 0
   4ADA 00                  910 	.db #0x00	; 0
   4ADB 00                  911 	.db #0x00	; 0
   4ADC 00                  912 	.db #0x00	; 0
   4ADD 00                  913 	.db #0x00	; 0
   4ADE 00                  914 	.db #0x00	; 0
   4ADF 00                  915 	.db #0x00	; 0
   4AE0 00                  916 	.db #0x00	; 0
   4AE1 00                  917 	.db #0x00	; 0
   4AE2 01                  918 	.db #0x01	; 1
   4AE3 01                  919 	.db #0x01	; 1
   4AE4 01                  920 	.db #0x01	; 1
   4AE5 01                  921 	.db #0x01	; 1
   4AE6 01                  922 	.db #0x01	; 1
   4AE7 01                  923 	.db #0x01	; 1
   4AE8 01                  924 	.db #0x01	; 1
   4AE9 01                  925 	.db #0x01	; 1
   4AEA 01                  926 	.db #0x01	; 1
   4AEB 01                  927 	.db #0x01	; 1
   4AEC 01                  928 	.db #0x01	; 1
   4AED 01                  929 	.db #0x01	; 1
   4AEE 01                  930 	.db #0x01	; 1
   4AEF 01                  931 	.db #0x01	; 1
   4AF0 01                  932 	.db #0x01	; 1
   4AF1 01                  933 	.db #0x01	; 1
   4AF2 00                  934 	.db #0x00	; 0
   4AF3 01                  935 	.db #0x01	; 1
   4AF4 01                  936 	.db #0x01	; 1
   4AF5 01                  937 	.db #0x01	; 1
   4AF6 01                  938 	.db #0x01	; 1
                            939 ;src/draws.h:48: void drawVida(u8 life,u8 pos){
                            940 ;	---------------------------------
                            941 ; Function drawVida
                            942 ; ---------------------------------
   4AF7                     943 _drawVida::
   4AF7 DD E5         [15]  944 	push	ix
   4AF9 DD 21 00 00   [14]  945 	ld	ix,#0
   4AFD DD 39         [15]  946 	add	ix,sp
                            947 ;src/draws.h:51: u8 p = pos;
   4AFF DD 56 05      [19]  948 	ld	d,5 (ix)
                            949 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B02 1E 01         [ 7]  950 	ld	e,#0x01
   4B04                     951 00105$:
                            952 ;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B04 D5            [11]  953 	push	de
   4B05 3E C0         [ 7]  954 	ld	a,#0xC0
   4B07 F5            [11]  955 	push	af
   4B08 33            [ 6]  956 	inc	sp
   4B09 D5            [11]  957 	push	de
   4B0A 33            [ 6]  958 	inc	sp
   4B0B 21 00 C0      [10]  959 	ld	hl,#0xC000
   4B0E E5            [11]  960 	push	hl
   4B0F CD 13 71      [17]  961 	call	_cpct_getScreenPtr
   4B12 D1            [10]  962 	pop	de
                            963 ;src/draws.h:55: p+=5;
   4B13 7A            [ 4]  964 	ld	a,d
   4B14 C6 05         [ 7]  965 	add	a, #0x05
   4B16 57            [ 4]  966 	ld	d,a
                            967 ;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4B17 4D            [ 4]  968 	ld	c, l
   4B18 44            [ 4]  969 	ld	b, h
   4B19 DD 7E 04      [19]  970 	ld	a,4 (ix)
   4B1C 93            [ 4]  971 	sub	a, e
   4B1D 38 10         [12]  972 	jr	C,00102$
   4B1F D5            [11]  973 	push	de
   4B20 21 04 08      [10]  974 	ld	hl,#0x0804
   4B23 E5            [11]  975 	push	hl
   4B24 C5            [11]  976 	push	bc
   4B25 21 00 46      [10]  977 	ld	hl,#_corazon_lleno
   4B28 E5            [11]  978 	push	hl
   4B29 CD BC 6F      [17]  979 	call	_cpct_drawSpriteMasked
   4B2C D1            [10]  980 	pop	de
   4B2D 18 20         [12]  981 	jr	00106$
   4B2F                     982 00102$:
                            983 ;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
   4B2F C5            [11]  984 	push	bc
   4B30 D5            [11]  985 	push	de
   4B31 21 04 08      [10]  986 	ld	hl,#0x0804
   4B34 E5            [11]  987 	push	hl
   4B35 AF            [ 4]  988 	xor	a, a
   4B36 F5            [11]  989 	push	af
   4B37 33            [ 6]  990 	inc	sp
   4B38 C5            [11]  991 	push	bc
   4B39 CD 42 70      [17]  992 	call	_cpct_drawSolidBox
   4B3C F1            [10]  993 	pop	af
   4B3D F1            [10]  994 	pop	af
   4B3E 33            [ 6]  995 	inc	sp
   4B3F D1            [10]  996 	pop	de
   4B40 C1            [10]  997 	pop	bc
                            998 ;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4B41 D5            [11]  999 	push	de
   4B42 21 04 08      [10] 1000 	ld	hl,#0x0804
   4B45 E5            [11] 1001 	push	hl
   4B46 C5            [11] 1002 	push	bc
   4B47 21 40 46      [10] 1003 	ld	hl,#_corazon_roto
   4B4A E5            [11] 1004 	push	hl
   4B4B CD BC 6F      [17] 1005 	call	_cpct_drawSpriteMasked
   4B4E D1            [10] 1006 	pop	de
   4B4F                    1007 00106$:
                           1008 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B4F 1C            [ 4] 1009 	inc	e
   4B50 3E 03         [ 7] 1010 	ld	a,#0x03
   4B52 93            [ 4] 1011 	sub	a, e
   4B53 30 AF         [12] 1012 	jr	NC,00105$
   4B55 DD E1         [14] 1013 	pop	ix
   4B57 C9            [10] 1014 	ret
                           1015 ;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
                           1016 ;	---------------------------------
                           1017 ; Function drawBullets
                           1018 ; ---------------------------------
   4B58                    1019 _drawBullets::
   4B58 DD E5         [15] 1020 	push	ix
   4B5A DD 21 00 00   [14] 1021 	ld	ix,#0
   4B5E DD 39         [15] 1022 	add	ix,sp
   4B60 3B            [ 6] 1023 	dec	sp
                           1024 ;src/draws.h:67: int p = pos;
   4B61 DD 4E 05      [19] 1025 	ld	c,5 (ix)
   4B64 06 00         [ 7] 1026 	ld	b,#0x00
                           1027 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B66 DD 36 FF 01   [19] 1028 	ld	-1 (ix),#0x01
   4B6A                    1029 00105$:
                           1030 ;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B6A 51            [ 4] 1031 	ld	d,c
   4B6B C5            [11] 1032 	push	bc
   4B6C 3E C0         [ 7] 1033 	ld	a,#0xC0
   4B6E F5            [11] 1034 	push	af
   4B6F 33            [ 6] 1035 	inc	sp
   4B70 D5            [11] 1036 	push	de
   4B71 33            [ 6] 1037 	inc	sp
   4B72 21 00 C0      [10] 1038 	ld	hl,#0xC000
   4B75 E5            [11] 1039 	push	hl
   4B76 CD 13 71      [17] 1040 	call	_cpct_getScreenPtr
   4B79 C1            [10] 1041 	pop	bc
                           1042 ;src/draws.h:71: p+=3;
   4B7A 03            [ 6] 1043 	inc	bc
   4B7B 03            [ 6] 1044 	inc	bc
   4B7C 03            [ 6] 1045 	inc	bc
                           1046 ;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4B7D EB            [ 4] 1047 	ex	de,hl
   4B7E DD 7E 04      [19] 1048 	ld	a,4 (ix)
   4B81 DD 96 FF      [19] 1049 	sub	a, -1 (ix)
   4B84 38 10         [12] 1050 	jr	C,00102$
   4B86 C5            [11] 1051 	push	bc
   4B87 21 02 08      [10] 1052 	ld	hl,#0x0802
   4B8A E5            [11] 1053 	push	hl
   4B8B D5            [11] 1054 	push	de
   4B8C 21 A1 6C      [10] 1055 	ld	hl,#_flecha_arriba
   4B8F E5            [11] 1056 	push	hl
   4B90 CD BC 6F      [17] 1057 	call	_cpct_drawSpriteMasked
   4B93 C1            [10] 1058 	pop	bc
   4B94 18 10         [12] 1059 	jr	00106$
   4B96                    1060 00102$:
                           1061 ;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
   4B96 C5            [11] 1062 	push	bc
   4B97 21 02 08      [10] 1063 	ld	hl,#0x0802
   4B9A E5            [11] 1064 	push	hl
   4B9B AF            [ 4] 1065 	xor	a, a
   4B9C F5            [11] 1066 	push	af
   4B9D 33            [ 6] 1067 	inc	sp
   4B9E D5            [11] 1068 	push	de
   4B9F CD 42 70      [17] 1069 	call	_cpct_drawSolidBox
   4BA2 F1            [10] 1070 	pop	af
   4BA3 F1            [10] 1071 	pop	af
   4BA4 33            [ 6] 1072 	inc	sp
   4BA5 C1            [10] 1073 	pop	bc
   4BA6                    1074 00106$:
                           1075 ;src/draws.h:69: for(i=1;i<=3;i++){
   4BA6 DD 34 FF      [23] 1076 	inc	-1 (ix)
   4BA9 3E 03         [ 7] 1077 	ld	a,#0x03
   4BAB DD 96 FF      [19] 1078 	sub	a, -1 (ix)
   4BAE 30 BA         [12] 1079 	jr	NC,00105$
   4BB0 33            [ 6] 1080 	inc	sp
   4BB1 DD E1         [14] 1081 	pop	ix
   4BB3 C9            [10] 1082 	ret
                           1083 ;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1084 ;	---------------------------------
                           1085 ; Function draw
                           1086 ; ---------------------------------
   4BB4                    1087 _draw::
                           1088 ;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
   4BB4 21 03 00      [10] 1089 	ld	hl, #3+0
   4BB7 39            [11] 1090 	add	hl, sp
   4BB8 7E            [ 7] 1091 	ld	a, (hl)
   4BB9 F5            [11] 1092 	push	af
   4BBA 33            [ 6] 1093 	inc	sp
   4BBB 21 03 00      [10] 1094 	ld	hl, #3+0
   4BBE 39            [11] 1095 	add	hl, sp
   4BBF 7E            [ 7] 1096 	ld	a, (hl)
   4BC0 F5            [11] 1097 	push	af
   4BC1 33            [ 6] 1098 	inc	sp
   4BC2 21 00 C0      [10] 1099 	ld	hl,#0xC000
   4BC5 E5            [11] 1100 	push	hl
   4BC6 CD 13 71      [17] 1101 	call	_cpct_getScreenPtr
   4BC9 EB            [ 4] 1102 	ex	de,hl
                           1103 ;src/draws.h:84: switch(mode){
   4BCA 3E 02         [ 7] 1104 	ld	a,#0x02
   4BCC FD 21 06 00   [14] 1105 	ld	iy,#6
   4BD0 FD 39         [15] 1106 	add	iy,sp
   4BD2 FD 96 00      [19] 1107 	sub	a, 0 (iy)
   4BD5 D8            [11] 1108 	ret	C
                           1109 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BD6 21 04 00      [10] 1110 	ld	hl, #4
   4BD9 39            [11] 1111 	add	hl, sp
   4BDA 4E            [ 7] 1112 	ld	c, (hl)
   4BDB 23            [ 6] 1113 	inc	hl
   4BDC 46            [ 7] 1114 	ld	b, (hl)
                           1115 ;src/draws.h:84: switch(mode){
   4BDD D5            [11] 1116 	push	de
   4BDE FD 21 08 00   [14] 1117 	ld	iy,#8
   4BE2 FD 39         [15] 1118 	add	iy,sp
   4BE4 FD 5E 00      [19] 1119 	ld	e,0 (iy)
   4BE7 16 00         [ 7] 1120 	ld	d,#0x00
   4BE9 21 F0 4B      [10] 1121 	ld	hl,#00111$
   4BEC 19            [11] 1122 	add	hl,de
   4BED 19            [11] 1123 	add	hl,de
                           1124 ;src/draws.h:85: case 0:
   4BEE D1            [10] 1125 	pop	de
   4BEF E9            [ 4] 1126 	jp	(hl)
   4BF0                    1127 00111$:
   4BF0 18 04         [12] 1128 	jr	00101$
   4BF2 18 0C         [12] 1129 	jr	00102$
   4BF4 18 14         [12] 1130 	jr	00103$
   4BF6                    1131 00101$:
                           1132 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BF6 21 04 10      [10] 1133 	ld	hl,#0x1004
   4BF9 E5            [11] 1134 	push	hl
   4BFA D5            [11] 1135 	push	de
   4BFB C5            [11] 1136 	push	bc
   4BFC CD BC 6F      [17] 1137 	call	_cpct_drawSpriteMasked
                           1138 ;src/draws.h:87: break;
   4BFF C9            [10] 1139 	ret
                           1140 ;src/draws.h:88: case 1:
   4C00                    1141 00102$:
                           1142 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4C00 21 02 08      [10] 1143 	ld	hl,#0x0802
   4C03 E5            [11] 1144 	push	hl
   4C04 D5            [11] 1145 	push	de
   4C05 C5            [11] 1146 	push	bc
   4C06 CD BC 6F      [17] 1147 	call	_cpct_drawSpriteMasked
                           1148 ;src/draws.h:90: break;
   4C09 C9            [10] 1149 	ret
                           1150 ;src/draws.h:91: case 2:
   4C0A                    1151 00103$:
                           1152 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4C0A 21 04 04      [10] 1153 	ld	hl,#0x0404
   4C0D E5            [11] 1154 	push	hl
   4C0E D5            [11] 1155 	push	de
   4C0F C5            [11] 1156 	push	bc
   4C10 CD BC 6F      [17] 1157 	call	_cpct_drawSpriteMasked
                           1158 ;src/draws.h:94: }
   4C13 C9            [10] 1159 	ret
                           1160 ;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
                           1161 ;	---------------------------------
                           1162 ; Function erase
                           1163 ; ---------------------------------
   4C14                    1164 _erase::
                           1165 ;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
   4C14 21 03 00      [10] 1166 	ld	hl, #3+0
   4C17 39            [11] 1167 	add	hl, sp
   4C18 7E            [ 7] 1168 	ld	a, (hl)
   4C19 F5            [11] 1169 	push	af
   4C1A 33            [ 6] 1170 	inc	sp
   4C1B 21 03 00      [10] 1171 	ld	hl, #3+0
   4C1E 39            [11] 1172 	add	hl, sp
   4C1F 7E            [ 7] 1173 	ld	a, (hl)
   4C20 F5            [11] 1174 	push	af
   4C21 33            [ 6] 1175 	inc	sp
   4C22 21 00 C0      [10] 1176 	ld	hl,#0xC000
   4C25 E5            [11] 1177 	push	hl
   4C26 CD 13 71      [17] 1178 	call	_cpct_getScreenPtr
   4C29 4D            [ 4] 1179 	ld	c, l
   4C2A 44            [ 4] 1180 	ld	b, h
                           1181 ;src/draws.h:102: switch(mode){
   4C2B 3E 02         [ 7] 1182 	ld	a,#0x02
   4C2D FD 21 04 00   [14] 1183 	ld	iy,#4
   4C31 FD 39         [15] 1184 	add	iy,sp
   4C33 FD 96 00      [19] 1185 	sub	a, 0 (iy)
   4C36 D8            [11] 1186 	ret	C
                           1187 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
                           1188 ;src/draws.h:102: switch(mode){
   4C37 FD 5E 00      [19] 1189 	ld	e,0 (iy)
   4C3A 16 00         [ 7] 1190 	ld	d,#0x00
   4C3C 21 42 4C      [10] 1191 	ld	hl,#00111$
   4C3F 19            [11] 1192 	add	hl,de
   4C40 19            [11] 1193 	add	hl,de
                           1194 ;src/draws.h:103: case 0:
   4C41 E9            [ 4] 1195 	jp	(hl)
   4C42                    1196 00111$:
   4C42 18 04         [12] 1197 	jr	00101$
   4C44 18 11         [12] 1198 	jr	00102$
   4C46 18 1E         [12] 1199 	jr	00103$
   4C48                    1200 00101$:
                           1201 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
   4C48 21 04 10      [10] 1202 	ld	hl,#0x1004
   4C4B E5            [11] 1203 	push	hl
   4C4C AF            [ 4] 1204 	xor	a, a
   4C4D F5            [11] 1205 	push	af
   4C4E 33            [ 6] 1206 	inc	sp
   4C4F C5            [11] 1207 	push	bc
   4C50 CD 42 70      [17] 1208 	call	_cpct_drawSolidBox
   4C53 F1            [10] 1209 	pop	af
   4C54 F1            [10] 1210 	pop	af
   4C55 33            [ 6] 1211 	inc	sp
                           1212 ;src/draws.h:105: break;
   4C56 C9            [10] 1213 	ret
                           1214 ;src/draws.h:106: case 1:
   4C57                    1215 00102$:
                           1216 ;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
   4C57 21 02 08      [10] 1217 	ld	hl,#0x0802
   4C5A E5            [11] 1218 	push	hl
   4C5B AF            [ 4] 1219 	xor	a, a
   4C5C F5            [11] 1220 	push	af
   4C5D 33            [ 6] 1221 	inc	sp
   4C5E C5            [11] 1222 	push	bc
   4C5F CD 42 70      [17] 1223 	call	_cpct_drawSolidBox
   4C62 F1            [10] 1224 	pop	af
   4C63 F1            [10] 1225 	pop	af
   4C64 33            [ 6] 1226 	inc	sp
                           1227 ;src/draws.h:108: break;
   4C65 C9            [10] 1228 	ret
                           1229 ;src/draws.h:109: case 2:
   4C66                    1230 00103$:
                           1231 ;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
   4C66 21 04 04      [10] 1232 	ld	hl,#0x0404
   4C69 E5            [11] 1233 	push	hl
   4C6A AF            [ 4] 1234 	xor	a, a
   4C6B F5            [11] 1235 	push	af
   4C6C 33            [ 6] 1236 	inc	sp
   4C6D C5            [11] 1237 	push	bc
   4C6E CD 42 70      [17] 1238 	call	_cpct_drawSolidBox
   4C71 F1            [10] 1239 	pop	af
   4C72 F1            [10] 1240 	pop	af
   4C73 33            [ 6] 1241 	inc	sp
                           1242 ;src/draws.h:112: }
   4C74 C9            [10] 1243 	ret
                           1244 ;src/draws.h:115: void drawStats(){
                           1245 ;	---------------------------------
                           1246 ; Function drawStats
                           1247 ; ---------------------------------
   4C75                    1248 _drawStats::
                           1249 ;src/draws.h:116: drawVida(player.life,1);
   4C75 21 1D 73      [10] 1250 	ld	hl, #_player + 6
   4C78 56            [ 7] 1251 	ld	d,(hl)
   4C79 3E 01         [ 7] 1252 	ld	a,#0x01
   4C7B F5            [11] 1253 	push	af
   4C7C 33            [ 6] 1254 	inc	sp
   4C7D D5            [11] 1255 	push	de
   4C7E 33            [ 6] 1256 	inc	sp
   4C7F CD F7 4A      [17] 1257 	call	_drawVida
   4C82 F1            [10] 1258 	pop	af
                           1259 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C83 21 21 73      [10] 1260 	ld	hl, #_player + 10
   4C86 56            [ 7] 1261 	ld	d,(hl)
   4C87 3E 10         [ 7] 1262 	ld	a,#0x10
   4C89 F5            [11] 1263 	push	af
   4C8A 33            [ 6] 1264 	inc	sp
   4C8B D5            [11] 1265 	push	de
   4C8C 33            [ 6] 1266 	inc	sp
   4C8D CD 58 4B      [17] 1267 	call	_drawBullets
   4C90 F1            [10] 1268 	pop	af
                           1269 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C91 21 2C 73      [10] 1270 	ld	hl, #_enemy + 10
   4C94 56            [ 7] 1271 	ld	d,(hl)
   4C95 3E 38         [ 7] 1272 	ld	a,#0x38
   4C97 F5            [11] 1273 	push	af
   4C98 33            [ 6] 1274 	inc	sp
   4C99 D5            [11] 1275 	push	de
   4C9A 33            [ 6] 1276 	inc	sp
   4C9B CD 58 4B      [17] 1277 	call	_drawBullets
   4C9E F1            [10] 1278 	pop	af
                           1279 ;src/draws.h:119: drawVida(enemy.life,65);
   4C9F 21 2A 73      [10] 1280 	ld	hl, #_enemy + 8
   4CA2 56            [ 7] 1281 	ld	d,(hl)
   4CA3 3E 41         [ 7] 1282 	ld	a,#0x41
   4CA5 F5            [11] 1283 	push	af
   4CA6 33            [ 6] 1284 	inc	sp
   4CA7 D5            [11] 1285 	push	de
   4CA8 33            [ 6] 1286 	inc	sp
   4CA9 CD F7 4A      [17] 1287 	call	_drawVida
   4CAC F1            [10] 1288 	pop	af
   4CAD C9            [10] 1289 	ret
                           1290 ;src/draws.h:124: void draws(){
                           1291 ;	---------------------------------
                           1292 ; Function draws
                           1293 ; ---------------------------------
   4CAE                    1294 _draws::
   4CAE DD E5         [15] 1295 	push	ix
   4CB0 DD 21 00 00   [14] 1296 	ld	ix,#0
   4CB4 DD 39         [15] 1297 	add	ix,sp
   4CB6 3B            [ 6] 1298 	dec	sp
                           1299 ;src/draws.h:126: if(temp%2 == 0)
   4CB7 FD 21 F9 72   [14] 1300 	ld	iy,#_temp
   4CBB FD CB 00 46   [20] 1301 	bit	0, 0 (iy)
   4CBF 20 17         [12] 1302 	jr	NZ,00102$
                           1303 ;src/draws.h:127: draw(player.x,player.y,player.sprite,0);
   4CC1 ED 5B 1B 73   [20] 1304 	ld	de, (#_player + 4)
   4CC5 21 18 73      [10] 1305 	ld	hl, #_player + 1
   4CC8 46            [ 7] 1306 	ld	b,(hl)
   4CC9 21 17 73      [10] 1307 	ld	hl, #_player + 0
   4CCC 4E            [ 7] 1308 	ld	c,(hl)
   4CCD AF            [ 4] 1309 	xor	a, a
   4CCE F5            [11] 1310 	push	af
   4CCF 33            [ 6] 1311 	inc	sp
   4CD0 D5            [11] 1312 	push	de
   4CD1 C5            [11] 1313 	push	bc
   4CD2 CD B4 4B      [17] 1314 	call	_draw
   4CD5 F1            [10] 1315 	pop	af
   4CD6 F1            [10] 1316 	pop	af
   4CD7 33            [ 6] 1317 	inc	sp
   4CD8                    1318 00102$:
                           1319 ;src/draws.h:128: if(enemy.life > 0 && temp%2 == 1)
   4CD8 11 22 73      [10] 1320 	ld	de,#_enemy+0
   4CDB 3A 2A 73      [13] 1321 	ld	a, (#_enemy + 8)
   4CDE B7            [ 4] 1322 	or	a, a
   4CDF 28 23         [12] 1323 	jr	Z,00104$
   4CE1 3A F9 72      [13] 1324 	ld	a,(#_temp + 0)
   4CE4 E6 01         [ 7] 1325 	and	a, #0x01
   4CE6 3D            [ 4] 1326 	dec	a
   4CE7 20 1B         [12] 1327 	jr	NZ,00104$
                           1328 ;src/draws.h:129: draw(enemy.x,enemy.y,enemy.sprite,0);
   4CE9 ED 4B 28 73   [20] 1329 	ld	bc, (#_enemy + 6)
   4CED 6B            [ 4] 1330 	ld	l, e
   4CEE 62            [ 4] 1331 	ld	h, d
   4CEF 23            [ 6] 1332 	inc	hl
   4CF0 7E            [ 7] 1333 	ld	a,(hl)
   4CF1 DD 77 FF      [19] 1334 	ld	-1 (ix),a
   4CF4 1A            [ 7] 1335 	ld	a,(de)
   4CF5 5F            [ 4] 1336 	ld	e,a
   4CF6 AF            [ 4] 1337 	xor	a, a
   4CF7 F5            [11] 1338 	push	af
   4CF8 33            [ 6] 1339 	inc	sp
   4CF9 C5            [11] 1340 	push	bc
   4CFA DD 56 FF      [19] 1341 	ld	d, -1 (ix)
   4CFD D5            [11] 1342 	push	de
   4CFE CD B4 4B      [17] 1343 	call	_draw
   4D01 F1            [10] 1344 	pop	af
   4D02 F1            [10] 1345 	pop	af
   4D03 33            [ 6] 1346 	inc	sp
   4D04                    1347 00104$:
                           1348 ;src/draws.h:130: if(arrow == 1){
   4D04 3A FD 72      [13] 1349 	ld	a,(#_arrow + 0)
   4D07 3D            [ 4] 1350 	dec	a
   4D08 20 5D         [12] 1351 	jr	NZ,00116$
                           1352 ;src/draws.h:131: if(parrow.dir == 4 || parrow.dir == 6 && parrow.vivo == 1)
   4D0A 21 0A 73      [10] 1353 	ld	hl, #_parrow + 7
   4D0D 5E            [ 7] 1354 	ld	e,(hl)
                           1355 ;src/draws.h:132: draw(parrow.x,parrow.y,parrow.sprite,2);
   4D0E 01 04 73      [10] 1356 	ld	bc,#_parrow + 1
                           1357 ;src/draws.h:131: if(parrow.dir == 4 || parrow.dir == 6 && parrow.vivo == 1)
   4D11 7B            [ 4] 1358 	ld	a,e
   4D12 D6 04         [ 7] 1359 	sub	a, #0x04
   4D14 28 0C         [12] 1360 	jr	Z,00110$
   4D16 21 09 73      [10] 1361 	ld	hl,#_parrow + 6
   4D19 7B            [ 4] 1362 	ld	a,e
   4D1A D6 06         [ 7] 1363 	sub	a, #0x06
   4D1C 20 25         [12] 1364 	jr	NZ,00111$
   4D1E 7E            [ 7] 1365 	ld	a,(hl)
   4D1F 3D            [ 4] 1366 	dec	a
   4D20 20 21         [12] 1367 	jr	NZ,00111$
   4D22                    1368 00110$:
                           1369 ;src/draws.h:132: draw(parrow.x,parrow.y,parrow.sprite,2);
   4D22 ED 5B 07 73   [20] 1370 	ld	de, (#(_parrow + 0x0004) + 0)
   4D26 0A            [ 7] 1371 	ld	a,(bc)
   4D27 DD 77 FF      [19] 1372 	ld	-1 (ix),a
   4D2A 21 03 73      [10] 1373 	ld	hl, #_parrow + 0
   4D2D 4E            [ 7] 1374 	ld	c,(hl)
   4D2E 3E 02         [ 7] 1375 	ld	a,#0x02
   4D30 F5            [11] 1376 	push	af
   4D31 33            [ 6] 1377 	inc	sp
   4D32 D5            [11] 1378 	push	de
   4D33 DD 7E FF      [19] 1379 	ld	a,-1 (ix)
   4D36 F5            [11] 1380 	push	af
   4D37 33            [ 6] 1381 	inc	sp
   4D38 79            [ 4] 1382 	ld	a,c
   4D39 F5            [11] 1383 	push	af
   4D3A 33            [ 6] 1384 	inc	sp
   4D3B CD B4 4B      [17] 1385 	call	_draw
   4D3E F1            [10] 1386 	pop	af
   4D3F F1            [10] 1387 	pop	af
   4D40 33            [ 6] 1388 	inc	sp
   4D41 18 24         [12] 1389 	jr	00116$
   4D43                    1390 00111$:
                           1391 ;src/draws.h:133: else if(parrow.dir == 2 || parrow.dir == 8 && parrow.vivo == 1)
   4D43 7B            [ 4] 1392 	ld	a,e
   4D44 D6 02         [ 7] 1393 	sub	a, #0x02
   4D46 28 09         [12] 1394 	jr	Z,00106$
   4D48 7B            [ 4] 1395 	ld	a,e
   4D49 D6 08         [ 7] 1396 	sub	a, #0x08
   4D4B 20 1A         [12] 1397 	jr	NZ,00116$
   4D4D 7E            [ 7] 1398 	ld	a,(hl)
   4D4E 3D            [ 4] 1399 	dec	a
   4D4F 20 16         [12] 1400 	jr	NZ,00116$
   4D51                    1401 00106$:
                           1402 ;src/draws.h:134: draw(parrow.x,parrow.y,parrow.sprite,1);
   4D51 ED 5B 07 73   [20] 1403 	ld	de, (#(_parrow + 0x0004) + 0)
   4D55 0A            [ 7] 1404 	ld	a,(bc)
   4D56 47            [ 4] 1405 	ld	b,a
   4D57 21 03 73      [10] 1406 	ld	hl, #_parrow + 0
   4D5A 4E            [ 7] 1407 	ld	c,(hl)
   4D5B 3E 01         [ 7] 1408 	ld	a,#0x01
   4D5D F5            [11] 1409 	push	af
   4D5E 33            [ 6] 1410 	inc	sp
   4D5F D5            [11] 1411 	push	de
   4D60 C5            [11] 1412 	push	bc
   4D61 CD B4 4B      [17] 1413 	call	_draw
   4D64 F1            [10] 1414 	pop	af
   4D65 F1            [10] 1415 	pop	af
   4D66 33            [ 6] 1416 	inc	sp
   4D67                    1417 00116$:
                           1418 ;src/draws.h:136: if(shooted == 1){
   4D67 3A FE 72      [13] 1419 	ld	a,(#_shooted + 0)
   4D6A 3D            [ 4] 1420 	dec	a
   4D6B 20 5D         [12] 1421 	jr	NZ,00127$
                           1422 ;src/draws.h:137: if(earrow.dir == 4 || earrow.dir == 6 && earrow.vivo == 1)
   4D6D 21 14 73      [10] 1423 	ld	hl, #_earrow + 7
   4D70 5E            [ 7] 1424 	ld	e,(hl)
                           1425 ;src/draws.h:138: draw(earrow.x,earrow.y,earrow.sprite,2);
   4D71 01 0E 73      [10] 1426 	ld	bc,#_earrow + 1
                           1427 ;src/draws.h:137: if(earrow.dir == 4 || earrow.dir == 6 && earrow.vivo == 1)
   4D74 7B            [ 4] 1428 	ld	a,e
   4D75 D6 04         [ 7] 1429 	sub	a, #0x04
   4D77 28 0C         [12] 1430 	jr	Z,00121$
   4D79 21 13 73      [10] 1431 	ld	hl,#_earrow + 6
   4D7C 7B            [ 4] 1432 	ld	a,e
   4D7D D6 06         [ 7] 1433 	sub	a, #0x06
   4D7F 20 25         [12] 1434 	jr	NZ,00122$
   4D81 7E            [ 7] 1435 	ld	a,(hl)
   4D82 3D            [ 4] 1436 	dec	a
   4D83 20 21         [12] 1437 	jr	NZ,00122$
   4D85                    1438 00121$:
                           1439 ;src/draws.h:138: draw(earrow.x,earrow.y,earrow.sprite,2);
   4D85 ED 5B 11 73   [20] 1440 	ld	de, (#(_earrow + 0x0004) + 0)
   4D89 0A            [ 7] 1441 	ld	a,(bc)
   4D8A DD 77 FF      [19] 1442 	ld	-1 (ix),a
   4D8D 21 0D 73      [10] 1443 	ld	hl, #_earrow + 0
   4D90 4E            [ 7] 1444 	ld	c,(hl)
   4D91 3E 02         [ 7] 1445 	ld	a,#0x02
   4D93 F5            [11] 1446 	push	af
   4D94 33            [ 6] 1447 	inc	sp
   4D95 D5            [11] 1448 	push	de
   4D96 DD 7E FF      [19] 1449 	ld	a,-1 (ix)
   4D99 F5            [11] 1450 	push	af
   4D9A 33            [ 6] 1451 	inc	sp
   4D9B 79            [ 4] 1452 	ld	a,c
   4D9C F5            [11] 1453 	push	af
   4D9D 33            [ 6] 1454 	inc	sp
   4D9E CD B4 4B      [17] 1455 	call	_draw
   4DA1 F1            [10] 1456 	pop	af
   4DA2 F1            [10] 1457 	pop	af
   4DA3 33            [ 6] 1458 	inc	sp
   4DA4 18 24         [12] 1459 	jr	00127$
   4DA6                    1460 00122$:
                           1461 ;src/draws.h:139: else if(earrow.dir == 2 || earrow.dir == 8 && earrow.vivo == 1)
   4DA6 7B            [ 4] 1462 	ld	a,e
   4DA7 D6 02         [ 7] 1463 	sub	a, #0x02
   4DA9 28 09         [12] 1464 	jr	Z,00117$
   4DAB 7B            [ 4] 1465 	ld	a,e
   4DAC D6 08         [ 7] 1466 	sub	a, #0x08
   4DAE 20 1A         [12] 1467 	jr	NZ,00127$
   4DB0 7E            [ 7] 1468 	ld	a,(hl)
   4DB1 3D            [ 4] 1469 	dec	a
   4DB2 20 16         [12] 1470 	jr	NZ,00127$
   4DB4                    1471 00117$:
                           1472 ;src/draws.h:140: draw(earrow.x,earrow.y,earrow.sprite,1);
   4DB4 ED 5B 11 73   [20] 1473 	ld	de, (#(_earrow + 0x0004) + 0)
   4DB8 0A            [ 7] 1474 	ld	a,(bc)
   4DB9 47            [ 4] 1475 	ld	b,a
   4DBA 21 0D 73      [10] 1476 	ld	hl, #_earrow + 0
   4DBD 4E            [ 7] 1477 	ld	c,(hl)
   4DBE 3E 01         [ 7] 1478 	ld	a,#0x01
   4DC0 F5            [11] 1479 	push	af
   4DC1 33            [ 6] 1480 	inc	sp
   4DC2 D5            [11] 1481 	push	de
   4DC3 C5            [11] 1482 	push	bc
   4DC4 CD B4 4B      [17] 1483 	call	_draw
   4DC7 F1            [10] 1484 	pop	af
   4DC8 F1            [10] 1485 	pop	af
   4DC9 33            [ 6] 1486 	inc	sp
   4DCA                    1487 00127$:
                           1488 ;src/draws.h:142: drawStats();
   4DCA CD 75 4C      [17] 1489 	call	_drawStats
   4DCD 33            [ 6] 1490 	inc	sp
   4DCE DD E1         [14] 1491 	pop	ix
   4DD0 C9            [10] 1492 	ret
                           1493 ;src/draws.h:145: void erases(){
                           1494 ;	---------------------------------
                           1495 ; Function erases
                           1496 ; ---------------------------------
   4DD1                    1497 _erases::
                           1498 ;src/draws.h:147: if(temp%2 == 0) erase(player.lx,player.ly,0);
   4DD1 FD 21 F9 72   [14] 1499 	ld	iy,#_temp
   4DD5 FD CB 00 46   [20] 1500 	bit	0, 0 (iy)
   4DD9 20 14         [12] 1501 	jr	NZ,00102$
   4DDB 21 1A 73      [10] 1502 	ld	hl, #_player + 3
   4DDE 56            [ 7] 1503 	ld	d,(hl)
   4DDF 21 19 73      [10] 1504 	ld	hl, #_player + 2
   4DE2 46            [ 7] 1505 	ld	b,(hl)
   4DE3 AF            [ 4] 1506 	xor	a, a
   4DE4 F5            [11] 1507 	push	af
   4DE5 33            [ 6] 1508 	inc	sp
   4DE6 D5            [11] 1509 	push	de
   4DE7 33            [ 6] 1510 	inc	sp
   4DE8 C5            [11] 1511 	push	bc
   4DE9 33            [ 6] 1512 	inc	sp
   4DEA CD 14 4C      [17] 1513 	call	_erase
   4DED F1            [10] 1514 	pop	af
   4DEE 33            [ 6] 1515 	inc	sp
   4DEF                    1516 00102$:
                           1517 ;src/draws.h:148: if(temp%2 == 1) erase(enemy.lx,enemy.ly,0);
   4DEF 3A F9 72      [13] 1518 	ld	a,(#_temp + 0)
   4DF2 E6 01         [ 7] 1519 	and	a, #0x01
   4DF4 3D            [ 4] 1520 	dec	a
   4DF5 20 14         [12] 1521 	jr	NZ,00104$
   4DF7 21 25 73      [10] 1522 	ld	hl, #_enemy + 3
   4DFA 56            [ 7] 1523 	ld	d,(hl)
   4DFB 21 24 73      [10] 1524 	ld	hl, #_enemy + 2
   4DFE 46            [ 7] 1525 	ld	b,(hl)
   4DFF AF            [ 4] 1526 	xor	a, a
   4E00 F5            [11] 1527 	push	af
   4E01 33            [ 6] 1528 	inc	sp
   4E02 D5            [11] 1529 	push	de
   4E03 33            [ 6] 1530 	inc	sp
   4E04 C5            [11] 1531 	push	bc
   4E05 33            [ 6] 1532 	inc	sp
   4E06 CD 14 4C      [17] 1533 	call	_erase
   4E09 F1            [10] 1534 	pop	af
   4E0A 33            [ 6] 1535 	inc	sp
   4E0B                    1536 00104$:
                           1537 ;src/draws.h:149: if(arrow == 1){
   4E0B 3A FD 72      [13] 1538 	ld	a,(#_arrow + 0)
   4E0E 3D            [ 4] 1539 	dec	a
   4E0F 20 3C         [12] 1540 	jr	NZ,00112$
                           1541 ;src/draws.h:150: if(parrow.dir == 4 || parrow.dir == 6) erase(parrow.lx,parrow.ly,2);
   4E11 21 0A 73      [10] 1542 	ld	hl, #_parrow + 7
   4E14 5E            [ 7] 1543 	ld	e,(hl)
   4E15 21 06 73      [10] 1544 	ld	hl, #_parrow + 3
   4E18 56            [ 7] 1545 	ld	d,(hl)
   4E19 21 05 73      [10] 1546 	ld	hl, #_parrow + 2
   4E1C 46            [ 7] 1547 	ld	b,(hl)
   4E1D 7B            [ 4] 1548 	ld	a,e
   4E1E FE 04         [ 7] 1549 	cp	a,#0x04
   4E20 28 04         [12] 1550 	jr	Z,00105$
   4E22 D6 06         [ 7] 1551 	sub	a, #0x06
   4E24 20 0F         [12] 1552 	jr	NZ,00106$
   4E26                    1553 00105$:
   4E26 3E 02         [ 7] 1554 	ld	a,#0x02
   4E28 F5            [11] 1555 	push	af
   4E29 33            [ 6] 1556 	inc	sp
   4E2A D5            [11] 1557 	push	de
   4E2B 33            [ 6] 1558 	inc	sp
   4E2C C5            [11] 1559 	push	bc
   4E2D 33            [ 6] 1560 	inc	sp
   4E2E CD 14 4C      [17] 1561 	call	_erase
   4E31 F1            [10] 1562 	pop	af
   4E32 33            [ 6] 1563 	inc	sp
   4E33 18 0D         [12] 1564 	jr	00107$
   4E35                    1565 00106$:
                           1566 ;src/draws.h:151: else erase(parrow.lx,parrow.ly,1);
   4E35 3E 01         [ 7] 1567 	ld	a,#0x01
   4E37 F5            [11] 1568 	push	af
   4E38 33            [ 6] 1569 	inc	sp
   4E39 D5            [11] 1570 	push	de
   4E3A 33            [ 6] 1571 	inc	sp
   4E3B C5            [11] 1572 	push	bc
   4E3C 33            [ 6] 1573 	inc	sp
   4E3D CD 14 4C      [17] 1574 	call	_erase
   4E40 F1            [10] 1575 	pop	af
   4E41 33            [ 6] 1576 	inc	sp
   4E42                    1577 00107$:
                           1578 ;src/draws.h:152: if(bound == 1) arrow = 0;
   4E42 3A 00 73      [13] 1579 	ld	a,(#_bound + 0)
   4E45 3D            [ 4] 1580 	dec	a
   4E46 20 05         [12] 1581 	jr	NZ,00112$
   4E48 21 FD 72      [10] 1582 	ld	hl,#_arrow + 0
   4E4B 36 00         [10] 1583 	ld	(hl), #0x00
   4E4D                    1584 00112$:
                           1585 ;src/draws.h:154: if(shooted == 1){
   4E4D 3A FE 72      [13] 1586 	ld	a,(#_shooted + 0)
   4E50 3D            [ 4] 1587 	dec	a
   4E51 C0            [11] 1588 	ret	NZ
                           1589 ;src/draws.h:155: if(earrow.dir == 4 || earrow.dir == 6) erase(earrow.lx,earrow.ly,2);
   4E52 21 14 73      [10] 1590 	ld	hl, #_earrow + 7
   4E55 5E            [ 7] 1591 	ld	e,(hl)
   4E56 21 10 73      [10] 1592 	ld	hl, #_earrow + 3
   4E59 56            [ 7] 1593 	ld	d,(hl)
   4E5A 21 0F 73      [10] 1594 	ld	hl, #_earrow + 2
   4E5D 46            [ 7] 1595 	ld	b,(hl)
   4E5E 7B            [ 4] 1596 	ld	a,e
   4E5F FE 04         [ 7] 1597 	cp	a,#0x04
   4E61 28 04         [12] 1598 	jr	Z,00113$
   4E63 D6 06         [ 7] 1599 	sub	a, #0x06
   4E65 20 0F         [12] 1600 	jr	NZ,00114$
   4E67                    1601 00113$:
   4E67 3E 02         [ 7] 1602 	ld	a,#0x02
   4E69 F5            [11] 1603 	push	af
   4E6A 33            [ 6] 1604 	inc	sp
   4E6B D5            [11] 1605 	push	de
   4E6C 33            [ 6] 1606 	inc	sp
   4E6D C5            [11] 1607 	push	bc
   4E6E 33            [ 6] 1608 	inc	sp
   4E6F CD 14 4C      [17] 1609 	call	_erase
   4E72 F1            [10] 1610 	pop	af
   4E73 33            [ 6] 1611 	inc	sp
   4E74 18 0D         [12] 1612 	jr	00115$
   4E76                    1613 00114$:
                           1614 ;src/draws.h:156: else erase(earrow.lx,earrow.ly,1);
   4E76 3E 01         [ 7] 1615 	ld	a,#0x01
   4E78 F5            [11] 1616 	push	af
   4E79 33            [ 6] 1617 	inc	sp
   4E7A D5            [11] 1618 	push	de
   4E7B 33            [ 6] 1619 	inc	sp
   4E7C C5            [11] 1620 	push	bc
   4E7D 33            [ 6] 1621 	inc	sp
   4E7E CD 14 4C      [17] 1622 	call	_erase
   4E81 F1            [10] 1623 	pop	af
   4E82 33            [ 6] 1624 	inc	sp
   4E83                    1625 00115$:
                           1626 ;src/draws.h:157: if(bounds == 1) shooted = 0;
   4E83 3A 01 73      [13] 1627 	ld	a,(#_bounds + 0)
   4E86 3D            [ 4] 1628 	dec	a
   4E87 C0            [11] 1629 	ret	NZ
   4E88 21 FE 72      [10] 1630 	ld	hl,#_shooted + 0
   4E8B 36 00         [10] 1631 	ld	(hl), #0x00
   4E8D C9            [10] 1632 	ret
                           1633 ;src/draws.h:164: void drawFatiga(u8 atk, u8 col){
                           1634 ;	---------------------------------
                           1635 ; Function drawFatiga
                           1636 ; ---------------------------------
   4E8E                    1637 _drawFatiga::
   4E8E DD E5         [15] 1638 	push	ix
   4E90 DD 21 00 00   [14] 1639 	ld	ix,#0
   4E94 DD 39         [15] 1640 	add	ix,sp
   4E96 F5            [11] 1641 	push	af
                           1642 ;src/draws.h:166: if(atk < 20)
   4E97 DD 7E 04      [19] 1643 	ld	a,4 (ix)
   4E9A D6 14         [ 7] 1644 	sub	a, #0x14
   4E9C 30 04         [12] 1645 	jr	NC,00102$
                           1646 ;src/draws.h:167: col = 2;
   4E9E DD 36 05 02   [19] 1647 	ld	5 (ix),#0x02
   4EA2                    1648 00102$:
                           1649 ;src/draws.h:168: if(atk > 30 || atk <= 20){
   4EA2 3E 14         [ 7] 1650 	ld	a,#0x14
   4EA4 DD 96 04      [19] 1651 	sub	a, 4 (ix)
   4EA7 3E 00         [ 7] 1652 	ld	a,#0x00
   4EA9 17            [ 4] 1653 	rla
   4EAA DD 77 FF      [19] 1654 	ld	-1 (ix),a
                           1655 ;src/draws.h:170: switch(col){
   4EAD 3E 02         [ 7] 1656 	ld	a,#0x02
   4EAF DD 96 05      [19] 1657 	sub	a, 5 (ix)
   4EB2 3E 00         [ 7] 1658 	ld	a,#0x00
   4EB4 17            [ 4] 1659 	rla
   4EB5 DD 77 FE      [19] 1660 	ld	-2 (ix),a
                           1661 ;src/draws.h:168: if(atk > 30 || atk <= 20){
   4EB8 3E 1E         [ 7] 1662 	ld	a,#0x1E
   4EBA DD 96 04      [19] 1663 	sub	a, 4 (ix)
   4EBD 38 06         [12] 1664 	jr	C,00107$
   4EBF DD 7E FF      [19] 1665 	ld	a,-1 (ix)
   4EC2 B7            [ 4] 1666 	or	a, a
   4EC3 20 4F         [12] 1667 	jr	NZ,00108$
   4EC5                    1668 00107$:
                           1669 ;src/draws.h:169: memptr = cpct_getScreenPtr(VMEM,28,192);
   4EC5 21 1C C0      [10] 1670 	ld	hl,#0xC01C
   4EC8 E5            [11] 1671 	push	hl
   4EC9 2E 00         [ 7] 1672 	ld	l, #0x00
   4ECB E5            [11] 1673 	push	hl
   4ECC CD 13 71      [17] 1674 	call	_cpct_getScreenPtr
                           1675 ;src/draws.h:170: switch(col){
   4ECF DD 7E FE      [19] 1676 	ld	a,-2 (ix)
   4ED2 B7            [ 4] 1677 	or	a, a
   4ED3 20 3F         [12] 1678 	jr	NZ,00108$
                           1679 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4ED5 4D            [ 4] 1680 	ld	c, l
   4ED6 44            [ 4] 1681 	ld	b, h
                           1682 ;src/draws.h:170: switch(col){
   4ED7 DD 5E 05      [19] 1683 	ld	e,5 (ix)
   4EDA 16 00         [ 7] 1684 	ld	d,#0x00
   4EDC 21 E2 4E      [10] 1685 	ld	hl,#00156$
   4EDF 19            [11] 1686 	add	hl,de
   4EE0 19            [11] 1687 	add	hl,de
                           1688 ;src/draws.h:171: case 0:
   4EE1 E9            [ 4] 1689 	jp	(hl)
   4EE2                    1690 00156$:
   4EE2 18 04         [12] 1691 	jr	00103$
   4EE4 18 14         [12] 1692 	jr	00104$
   4EE6 18 20         [12] 1693 	jr	00105$
   4EE8                    1694 00103$:
                           1695 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4EE8 21 02 08      [10] 1696 	ld	hl,#0x0802
   4EEB E5            [11] 1697 	push	hl
   4EEC DD 7E 05      [19] 1698 	ld	a,5 (ix)
   4EEF F5            [11] 1699 	push	af
   4EF0 33            [ 6] 1700 	inc	sp
   4EF1 C5            [11] 1701 	push	bc
   4EF2 CD 42 70      [17] 1702 	call	_cpct_drawSolidBox
   4EF5 F1            [10] 1703 	pop	af
   4EF6 F1            [10] 1704 	pop	af
   4EF7 33            [ 6] 1705 	inc	sp
                           1706 ;src/draws.h:173: break;
   4EF8 18 1A         [12] 1707 	jr	00108$
                           1708 ;src/draws.h:174: case 1:
   4EFA                    1709 00104$:
                           1710 ;src/draws.h:175: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4EFA 11 80 46      [10] 1711 	ld	de,#_fatiga_nor
   4EFD 21 02 08      [10] 1712 	ld	hl,#0x0802
   4F00 E5            [11] 1713 	push	hl
   4F01 C5            [11] 1714 	push	bc
   4F02 D5            [11] 1715 	push	de
   4F03 CD BC 6F      [17] 1716 	call	_cpct_drawSpriteMasked
                           1717 ;src/draws.h:176: break;
   4F06 18 0C         [12] 1718 	jr	00108$
                           1719 ;src/draws.h:177: case 2:
   4F08                    1720 00105$:
                           1721 ;src/draws.h:178: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4F08 11 A0 46      [10] 1722 	ld	de,#_fatiga_full
   4F0B 21 02 08      [10] 1723 	ld	hl,#0x0802
   4F0E E5            [11] 1724 	push	hl
   4F0F C5            [11] 1725 	push	bc
   4F10 D5            [11] 1726 	push	de
   4F11 CD BC 6F      [17] 1727 	call	_cpct_drawSpriteMasked
                           1728 ;src/draws.h:179: }
   4F14                    1729 00108$:
                           1730 ;src/draws.h:181: if(atk > 40 || atk <= 20){
   4F14 3E 28         [ 7] 1731 	ld	a,#0x28
   4F16 DD 96 04      [19] 1732 	sub	a, 4 (ix)
   4F19 38 06         [12] 1733 	jr	C,00114$
   4F1B DD 7E FF      [19] 1734 	ld	a,-1 (ix)
   4F1E B7            [ 4] 1735 	or	a, a
   4F1F 20 4F         [12] 1736 	jr	NZ,00115$
   4F21                    1737 00114$:
                           1738 ;src/draws.h:182: memptr = cpct_getScreenPtr(VMEM,31,192);
   4F21 21 1F C0      [10] 1739 	ld	hl,#0xC01F
   4F24 E5            [11] 1740 	push	hl
   4F25 2E 00         [ 7] 1741 	ld	l, #0x00
   4F27 E5            [11] 1742 	push	hl
   4F28 CD 13 71      [17] 1743 	call	_cpct_getScreenPtr
                           1744 ;src/draws.h:183: switch(col){
   4F2B DD 7E FE      [19] 1745 	ld	a,-2 (ix)
   4F2E B7            [ 4] 1746 	or	a, a
   4F2F 20 3F         [12] 1747 	jr	NZ,00115$
                           1748 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4F31 4D            [ 4] 1749 	ld	c, l
   4F32 44            [ 4] 1750 	ld	b, h
                           1751 ;src/draws.h:183: switch(col){
   4F33 DD 5E 05      [19] 1752 	ld	e,5 (ix)
   4F36 16 00         [ 7] 1753 	ld	d,#0x00
   4F38 21 3E 4F      [10] 1754 	ld	hl,#00157$
   4F3B 19            [11] 1755 	add	hl,de
   4F3C 19            [11] 1756 	add	hl,de
                           1757 ;src/draws.h:184: case 0:
   4F3D E9            [ 4] 1758 	jp	(hl)
   4F3E                    1759 00157$:
   4F3E 18 04         [12] 1760 	jr	00110$
   4F40 18 14         [12] 1761 	jr	00111$
   4F42 18 20         [12] 1762 	jr	00112$
   4F44                    1763 00110$:
                           1764 ;src/draws.h:185: cpct_drawSolidBox(memptr, col, 2, 8);
   4F44 21 02 08      [10] 1765 	ld	hl,#0x0802
   4F47 E5            [11] 1766 	push	hl
   4F48 DD 7E 05      [19] 1767 	ld	a,5 (ix)
   4F4B F5            [11] 1768 	push	af
   4F4C 33            [ 6] 1769 	inc	sp
   4F4D C5            [11] 1770 	push	bc
   4F4E CD 42 70      [17] 1771 	call	_cpct_drawSolidBox
   4F51 F1            [10] 1772 	pop	af
   4F52 F1            [10] 1773 	pop	af
   4F53 33            [ 6] 1774 	inc	sp
                           1775 ;src/draws.h:186: break;
   4F54 18 1A         [12] 1776 	jr	00115$
                           1777 ;src/draws.h:187: case 1:
   4F56                    1778 00111$:
                           1779 ;src/draws.h:188: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4F56 11 80 46      [10] 1780 	ld	de,#_fatiga_nor
   4F59 21 02 08      [10] 1781 	ld	hl,#0x0802
   4F5C E5            [11] 1782 	push	hl
   4F5D C5            [11] 1783 	push	bc
   4F5E D5            [11] 1784 	push	de
   4F5F CD BC 6F      [17] 1785 	call	_cpct_drawSpriteMasked
                           1786 ;src/draws.h:189: break;
   4F62 18 0C         [12] 1787 	jr	00115$
                           1788 ;src/draws.h:190: case 2:
   4F64                    1789 00112$:
                           1790 ;src/draws.h:191: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4F64 11 A0 46      [10] 1791 	ld	de,#_fatiga_full
   4F67 21 02 08      [10] 1792 	ld	hl,#0x0802
   4F6A E5            [11] 1793 	push	hl
   4F6B C5            [11] 1794 	push	bc
   4F6C D5            [11] 1795 	push	de
   4F6D CD BC 6F      [17] 1796 	call	_cpct_drawSpriteMasked
                           1797 ;src/draws.h:192: }
   4F70                    1798 00115$:
                           1799 ;src/draws.h:194: if(atk <= 20){
   4F70 DD 7E FF      [19] 1800 	ld	a,-1 (ix)
   4F73 B7            [ 4] 1801 	or	a, a
   4F74 20 39         [12] 1802 	jr	NZ,00122$
                           1803 ;src/draws.h:195: memptr = cpct_getScreenPtr(VMEM,34,192);
   4F76 21 22 C0      [10] 1804 	ld	hl,#0xC022
   4F79 E5            [11] 1805 	push	hl
   4F7A 2E 00         [ 7] 1806 	ld	l, #0x00
   4F7C E5            [11] 1807 	push	hl
   4F7D CD 13 71      [17] 1808 	call	_cpct_getScreenPtr
                           1809 ;src/draws.h:172: cpct_drawSolidBox(memptr, col, 2, 8);
   4F80 4D            [ 4] 1810 	ld	c, l
   4F81 44            [ 4] 1811 	ld	b, h
                           1812 ;src/draws.h:196: switch(col){
   4F82 DD 7E 05      [19] 1813 	ld	a,5 (ix)
   4F85 B7            [ 4] 1814 	or	a, a
   4F86 28 09         [12] 1815 	jr	Z,00117$
   4F88 DD 7E 05      [19] 1816 	ld	a,5 (ix)
   4F8B D6 02         [ 7] 1817 	sub	a, #0x02
   4F8D 28 14         [12] 1818 	jr	Z,00118$
   4F8F 18 1E         [12] 1819 	jr	00122$
                           1820 ;src/draws.h:197: case 0:
   4F91                    1821 00117$:
                           1822 ;src/draws.h:198: cpct_drawSolidBox(memptr, col, 2, 8);
   4F91 21 02 08      [10] 1823 	ld	hl,#0x0802
   4F94 E5            [11] 1824 	push	hl
   4F95 DD 7E 05      [19] 1825 	ld	a,5 (ix)
   4F98 F5            [11] 1826 	push	af
   4F99 33            [ 6] 1827 	inc	sp
   4F9A C5            [11] 1828 	push	bc
   4F9B CD 42 70      [17] 1829 	call	_cpct_drawSolidBox
   4F9E F1            [10] 1830 	pop	af
   4F9F F1            [10] 1831 	pop	af
   4FA0 33            [ 6] 1832 	inc	sp
                           1833 ;src/draws.h:199: break;
   4FA1 18 0C         [12] 1834 	jr	00122$
                           1835 ;src/draws.h:200: case 2:
   4FA3                    1836 00118$:
                           1837 ;src/draws.h:201: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4FA3 11 A0 46      [10] 1838 	ld	de,#_fatiga_full
   4FA6 21 02 08      [10] 1839 	ld	hl,#0x0802
   4FA9 E5            [11] 1840 	push	hl
   4FAA C5            [11] 1841 	push	bc
   4FAB D5            [11] 1842 	push	de
   4FAC CD BC 6F      [17] 1843 	call	_cpct_drawSpriteMasked
                           1844 ;src/draws.h:202: }
   4FAF                    1845 00122$:
   4FAF DD F9         [10] 1846 	ld	sp, ix
   4FB1 DD E1         [14] 1847 	pop	ix
   4FB3 C9            [10] 1848 	ret
                           1849 ;src/draws.h:207: void drawPickUps(u8 corazon, u8 bullet){
                           1850 ;	---------------------------------
                           1851 ; Function drawPickUps
                           1852 ; ---------------------------------
   4FB4                    1853 _drawPickUps::
   4FB4 DD E5         [15] 1854 	push	ix
   4FB6 DD 21 00 00   [14] 1855 	ld	ix,#0
   4FBA DD 39         [15] 1856 	add	ix,sp
                           1857 ;src/draws.h:210: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4FBC 21 04 A0      [10] 1858 	ld	hl,#0xA004
   4FBF E5            [11] 1859 	push	hl
   4FC0 21 00 C0      [10] 1860 	ld	hl,#0xC000
   4FC3 E5            [11] 1861 	push	hl
   4FC4 CD 13 71      [17] 1862 	call	_cpct_getScreenPtr
                           1863 ;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4FC7 4D            [ 4] 1864 	ld	c, l
   4FC8 44            [ 4] 1865 	ld	b, h
                           1866 ;src/draws.h:211: if(corazon == 0)
   4FC9 DD 7E 04      [19] 1867 	ld	a,4 (ix)
   4FCC B7            [ 4] 1868 	or	a, a
   4FCD 20 0E         [12] 1869 	jr	NZ,00102$
                           1870 ;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4FCF 11 00 46      [10] 1871 	ld	de,#_corazon_lleno
   4FD2 21 04 08      [10] 1872 	ld	hl,#0x0804
   4FD5 E5            [11] 1873 	push	hl
   4FD6 C5            [11] 1874 	push	bc
   4FD7 D5            [11] 1875 	push	de
   4FD8 CD BC 6F      [17] 1876 	call	_cpct_drawSpriteMasked
   4FDB 18 0E         [12] 1877 	jr	00103$
   4FDD                    1878 00102$:
                           1879 ;src/draws.h:214: cpct_drawSolidBox(memptr, 0, 4, 8);
   4FDD 21 04 08      [10] 1880 	ld	hl,#0x0804
   4FE0 E5            [11] 1881 	push	hl
   4FE1 AF            [ 4] 1882 	xor	a, a
   4FE2 F5            [11] 1883 	push	af
   4FE3 33            [ 6] 1884 	inc	sp
   4FE4 C5            [11] 1885 	push	bc
   4FE5 CD 42 70      [17] 1886 	call	_cpct_drawSolidBox
   4FE8 F1            [10] 1887 	pop	af
   4FE9 F1            [10] 1888 	pop	af
   4FEA 33            [ 6] 1889 	inc	sp
   4FEB                    1890 00103$:
                           1891 ;src/draws.h:216: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4FEB 21 08 10      [10] 1892 	ld	hl,#0x1008
   4FEE E5            [11] 1893 	push	hl
   4FEF 21 00 C0      [10] 1894 	ld	hl,#0xC000
   4FF2 E5            [11] 1895 	push	hl
   4FF3 CD 13 71      [17] 1896 	call	_cpct_getScreenPtr
                           1897 ;src/draws.h:212: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4FF6 EB            [ 4] 1898 	ex	de,hl
                           1899 ;src/draws.h:217: if(bullet == 0)
   4FF7 DD 7E 05      [19] 1900 	ld	a,5 (ix)
   4FFA B7            [ 4] 1901 	or	a, a
   4FFB 20 0E         [12] 1902 	jr	NZ,00105$
                           1903 ;src/draws.h:218: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4FFD 01 A1 6C      [10] 1904 	ld	bc,#_flecha_arriba
   5000 21 02 08      [10] 1905 	ld	hl,#0x0802
   5003 E5            [11] 1906 	push	hl
   5004 D5            [11] 1907 	push	de
   5005 C5            [11] 1908 	push	bc
   5006 CD BC 6F      [17] 1909 	call	_cpct_drawSpriteMasked
   5009 18 0E         [12] 1910 	jr	00107$
   500B                    1911 00105$:
                           1912 ;src/draws.h:220: cpct_drawSolidBox(memptr, 0, 2, 8);
   500B 21 02 08      [10] 1913 	ld	hl,#0x0802
   500E E5            [11] 1914 	push	hl
   500F AF            [ 4] 1915 	xor	a, a
   5010 F5            [11] 1916 	push	af
   5011 33            [ 6] 1917 	inc	sp
   5012 D5            [11] 1918 	push	de
   5013 CD 42 70      [17] 1919 	call	_cpct_drawSolidBox
   5016 F1            [10] 1920 	pop	af
   5017 F1            [10] 1921 	pop	af
   5018 33            [ 6] 1922 	inc	sp
   5019                    1923 00107$:
   5019 DD E1         [14] 1924 	pop	ix
   501B C9            [10] 1925 	ret
                           1926 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1927 ;	---------------------------------
                           1928 ; Function detectPlayerRoom
                           1929 ; ---------------------------------
   501C                    1930 _detectPlayerRoom::
   501C DD E5         [15] 1931 	push	ix
   501E DD 21 00 00   [14] 1932 	ld	ix,#0
   5022 DD 39         [15] 1933 	add	ix,sp
                           1934 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   5024 11 09 72      [10] 1935 	ld	de,#_scene+0
   5027 DD 7E 05      [19] 1936 	ld	a,5 (ix)
   502A 07            [ 4] 1937 	rlca
   502B 07            [ 4] 1938 	rlca
   502C 07            [ 4] 1939 	rlca
   502D 07            [ 4] 1940 	rlca
   502E E6 0F         [ 7] 1941 	and	a,#0x0F
   5030 4F            [ 4] 1942 	ld	c,a
   5031 06 00         [ 7] 1943 	ld	b,#0x00
   5033 69            [ 4] 1944 	ld	l, c
   5034 60            [ 4] 1945 	ld	h, b
   5035 29            [11] 1946 	add	hl, hl
   5036 29            [11] 1947 	add	hl, hl
   5037 09            [11] 1948 	add	hl, bc
   5038 29            [11] 1949 	add	hl, hl
   5039 29            [11] 1950 	add	hl, hl
   503A 19            [11] 1951 	add	hl,de
   503B DD 5E 04      [19] 1952 	ld	e,4 (ix)
   503E CB 3B         [ 8] 1953 	srl	e
   5040 CB 3B         [ 8] 1954 	srl	e
   5042 16 00         [ 7] 1955 	ld	d,#0x00
   5044 19            [11] 1956 	add	hl,de
   5045 6E            [ 7] 1957 	ld	l,(hl)
   5046 DD E1         [14] 1958 	pop	ix
   5048 C9            [10] 1959 	ret
                           1960 ;src/ia.h:16: u8 chooseDirection(){
                           1961 ;	---------------------------------
                           1962 ; Function chooseDirection
                           1963 ; ---------------------------------
   5049                    1964 _chooseDirection::
                           1965 ;src/ia.h:18: u8 dir = 0;
   5049 16 00         [ 7] 1966 	ld	d,#0x00
                           1967 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   504B D5            [11] 1968 	push	de
   504C CD BB 6D      [17] 1969 	call	_rand
   504F 01 04 00      [10] 1970 	ld	bc,#0x0004
   5052 C5            [11] 1971 	push	bc
   5053 E5            [11] 1972 	push	hl
   5054 CD 07 71      [17] 1973 	call	__modsint
   5057 F1            [10] 1974 	pop	af
   5058 F1            [10] 1975 	pop	af
   5059 D1            [10] 1976 	pop	de
   505A 5D            [ 4] 1977 	ld	e,l
   505B 1C            [ 4] 1978 	inc	e
                           1979 ;src/ia.h:20: switch(rnd){
   505C 7B            [ 4] 1980 	ld	a,e
   505D D6 01         [ 7] 1981 	sub	a, #0x01
   505F 38 24         [12] 1982 	jr	C,00105$
   5061 3E 04         [ 7] 1983 	ld	a,#0x04
   5063 93            [ 4] 1984 	sub	a, e
   5064 38 1F         [12] 1985 	jr	C,00105$
   5066 1D            [ 4] 1986 	dec	e
   5067 16 00         [ 7] 1987 	ld	d,#0x00
   5069 21 6F 50      [10] 1988 	ld	hl,#00116$
   506C 19            [11] 1989 	add	hl,de
   506D 19            [11] 1990 	add	hl,de
                           1991 ;src/ia.h:21: case 4: dir = 6;break;
   506E E9            [ 4] 1992 	jp	(hl)
   506F                    1993 00116$:
   506F 18 12         [12] 1994 	jr	00104$
   5071 18 0C         [12] 1995 	jr	00103$
   5073 18 06         [12] 1996 	jr	00102$
   5075 18 00         [12] 1997 	jr	00101$
   5077                    1998 00101$:
   5077 16 06         [ 7] 1999 	ld	d,#0x06
   5079 18 0A         [12] 2000 	jr	00105$
                           2001 ;src/ia.h:22: case 3: dir = 4;break;
   507B                    2002 00102$:
   507B 16 04         [ 7] 2003 	ld	d,#0x04
   507D 18 06         [12] 2004 	jr	00105$
                           2005 ;src/ia.h:23: case 2: dir = 2;break;
   507F                    2006 00103$:
   507F 16 02         [ 7] 2007 	ld	d,#0x02
   5081 18 02         [12] 2008 	jr	00105$
                           2009 ;src/ia.h:24: case 1: dir = 8;break;
   5083                    2010 00104$:
   5083 16 08         [ 7] 2011 	ld	d,#0x08
                           2012 ;src/ia.h:25: }
   5085                    2013 00105$:
                           2014 ;src/ia.h:27: return dir;
   5085 6A            [ 4] 2015 	ld	l,d
   5086 C9            [10] 2016 	ret
                           2017 ;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           2018 ;	---------------------------------
                           2019 ; Function setDirection
                           2020 ; ---------------------------------
   5087                    2021 _setDirection::
   5087 DD E5         [15] 2022 	push	ix
   5089 DD 21 00 00   [14] 2023 	ld	ix,#0
   508D DD 39         [15] 2024 	add	ix,sp
                           2025 ;src/ia.h:33: if(px < x) dir = 4;
   508F DD 7E 04      [19] 2026 	ld	a,4 (ix)
   5092 DD 96 06      [19] 2027 	sub	a, 6 (ix)
   5095 30 04         [12] 2028 	jr	NC,00108$
   5097 2E 04         [ 7] 2029 	ld	l,#0x04
   5099 18 1A         [12] 2030 	jr	00109$
   509B                    2031 00108$:
                           2032 ;src/ia.h:34: else if(py > y) dir = 2;
   509B DD 7E 07      [19] 2033 	ld	a,7 (ix)
   509E DD 96 05      [19] 2034 	sub	a, 5 (ix)
   50A1 30 04         [12] 2035 	jr	NC,00105$
   50A3 2E 02         [ 7] 2036 	ld	l,#0x02
   50A5 18 0E         [12] 2037 	jr	00109$
   50A7                    2038 00105$:
                           2039 ;src/ia.h:35: else if(px > x) dir = 6;
   50A7 DD 7E 06      [19] 2040 	ld	a,6 (ix)
   50AA DD 96 04      [19] 2041 	sub	a, 4 (ix)
   50AD 30 04         [12] 2042 	jr	NC,00102$
   50AF 2E 06         [ 7] 2043 	ld	l,#0x06
   50B1 18 02         [12] 2044 	jr	00109$
   50B3                    2045 00102$:
                           2046 ;src/ia.h:36: else dir = 8;
   50B3 2E 08         [ 7] 2047 	ld	l,#0x08
   50B5                    2048 00109$:
                           2049 ;src/ia.h:37: return dir;
   50B5 DD E1         [14] 2050 	pop	ix
   50B7 C9            [10] 2051 	ret
                           2052 ;src/ia.h:40: void movement(u8 dir){
                           2053 ;	---------------------------------
                           2054 ; Function movement
                           2055 ; ---------------------------------
   50B8                    2056 _movement::
                           2057 ;src/ia.h:41: switch(dir){
   50B8 FD 21 02 00   [14] 2058 	ld	iy,#2
   50BC FD 39         [15] 2059 	add	iy,sp
   50BE FD 7E 00      [19] 2060 	ld	a,0 (iy)
   50C1 D6 02         [ 7] 2061 	sub	a, #0x02
   50C3 28 2B         [12] 2062 	jr	Z,00104$
   50C5 FD 7E 00      [19] 2063 	ld	a,0 (iy)
   50C8 D6 04         [ 7] 2064 	sub	a, #0x04
   50CA 28 14         [12] 2065 	jr	Z,00102$
   50CC FD 7E 00      [19] 2066 	ld	a,0 (iy)
   50CF D6 06         [ 7] 2067 	sub	a, #0x06
   50D1 28 08         [12] 2068 	jr	Z,00101$
   50D3 FD 7E 00      [19] 2069 	ld	a,0 (iy)
   50D6 D6 08         [ 7] 2070 	sub	a, #0x08
   50D8 28 0E         [12] 2071 	jr	Z,00103$
   50DA C9            [10] 2072 	ret
                           2073 ;src/ia.h:42: case 6: enemy.x += 1; break;
   50DB                    2074 00101$:
   50DB 21 22 73      [10] 2075 	ld	hl,#_enemy+0
   50DE 34            [11] 2076 	inc	(hl)
   50DF C9            [10] 2077 	ret
                           2078 ;src/ia.h:43: case 4: enemy.x -= 1; break;
   50E0                    2079 00102$:
   50E0 11 22 73      [10] 2080 	ld	de,#_enemy+0
   50E3 1A            [ 7] 2081 	ld	a,(de)
   50E4 C6 FF         [ 7] 2082 	add	a,#0xFF
   50E6 12            [ 7] 2083 	ld	(de),a
   50E7 C9            [10] 2084 	ret
                           2085 ;src/ia.h:44: case 8: enemy.y -= 2; break;
   50E8                    2086 00103$:
   50E8 11 23 73      [10] 2087 	ld	de,#_enemy+1
   50EB 1A            [ 7] 2088 	ld	a,(de)
   50EC C6 FE         [ 7] 2089 	add	a,#0xFE
   50EE 12            [ 7] 2090 	ld	(de),a
   50EF C9            [10] 2091 	ret
                           2092 ;src/ia.h:45: case 2: enemy.y += 2; break;
   50F0                    2093 00104$:
   50F0 21 23 73      [10] 2094 	ld	hl,#_enemy+1
   50F3 7E            [ 7] 2095 	ld	a,(hl)
   50F4 C6 02         [ 7] 2096 	add	a, #0x02
   50F6 77            [ 7] 2097 	ld	(hl),a
                           2098 ;src/ia.h:46: }
   50F7 C9            [10] 2099 	ret
                           2100 ;src/ia.h:50: void patrol(){
                           2101 ;	---------------------------------
                           2102 ; Function patrol
                           2103 ; ---------------------------------
   50F8                    2104 _patrol::
   50F8 DD E5         [15] 2105 	push	ix
   50FA DD 21 00 00   [14] 2106 	ld	ix,#0
   50FE DD 39         [15] 2107 	add	ix,sp
   5100 21 F4 FF      [10] 2108 	ld	hl,#-12
   5103 39            [11] 2109 	add	hl,sp
   5104 F9            [ 6] 2110 	ld	sp,hl
                           2111 ;src/ia.h:52: movement(enemy.dir);
   5105 3A 2B 73      [13] 2112 	ld	a, (#(_enemy + 0x0009) + 0)
   5108 F5            [11] 2113 	push	af
   5109 33            [ 6] 2114 	inc	sp
   510A CD B8 50      [17] 2115 	call	_movement
   510D 33            [ 6] 2116 	inc	sp
                           2117 ;src/ia.h:54: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   510E 3A 23 73      [13] 2118 	ld	a,(#_enemy + 1)
   5111 DD 77 F6      [19] 2119 	ld	-10 (ix), a
   5114 07            [ 4] 2120 	rlca
   5115 07            [ 4] 2121 	rlca
   5116 07            [ 4] 2122 	rlca
   5117 07            [ 4] 2123 	rlca
   5118 E6 0F         [ 7] 2124 	and	a,#0x0F
   511A 4F            [ 4] 2125 	ld	c,a
   511B 06 00         [ 7] 2126 	ld	b,#0x00
   511D 69            [ 4] 2127 	ld	l, c
   511E 60            [ 4] 2128 	ld	h, b
   511F 29            [11] 2129 	add	hl, hl
   5120 29            [11] 2130 	add	hl, hl
   5121 09            [11] 2131 	add	hl, bc
   5122 29            [11] 2132 	add	hl, hl
   5123 29            [11] 2133 	add	hl, hl
   5124 3E 09         [ 7] 2134 	ld	a,#<(_scene)
   5126 85            [ 4] 2135 	add	a, l
   5127 DD 77 F4      [19] 2136 	ld	-12 (ix),a
   512A 3E 72         [ 7] 2137 	ld	a,#>(_scene)
   512C 8C            [ 4] 2138 	adc	a, h
   512D DD 77 F5      [19] 2139 	ld	-11 (ix),a
   5130 3A 22 73      [13] 2140 	ld	a,(#_enemy + 0)
   5133 DD 77 FC      [19] 2141 	ld	-4 (ix), a
   5136 0F            [ 4] 2142 	rrca
   5137 0F            [ 4] 2143 	rrca
   5138 E6 3F         [ 7] 2144 	and	a,#0x3F
   513A DD 77 F9      [19] 2145 	ld	-7 (ix),a
   513D DD 7E F4      [19] 2146 	ld	a,-12 (ix)
   5140 DD 86 F9      [19] 2147 	add	a, -7 (ix)
   5143 5F            [ 4] 2148 	ld	e,a
   5144 DD 7E F5      [19] 2149 	ld	a,-11 (ix)
   5147 CE 00         [ 7] 2150 	adc	a, #0x00
   5149 57            [ 4] 2151 	ld	d,a
   514A 3A 2D 73      [13] 2152 	ld	a,(#_enemy + 11)
   514D DD 77 FD      [19] 2153 	ld	-3 (ix),a
   5150 1A            [ 7] 2154 	ld	a,(de)
   5151 57            [ 4] 2155 	ld	d,a
   5152 DD 7E FD      [19] 2156 	ld	a,-3 (ix)
   5155 92            [ 4] 2157 	sub	a, d
   5156 C2 52 52      [10] 2158 	jp	NZ,00106$
                           2159 ;src/ia.h:55: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5159 DD 5E FC      [19] 2160 	ld	e,-4 (ix)
   515C 16 00         [ 7] 2161 	ld	d,#0x00
   515E 21 03 00      [10] 2162 	ld	hl,#0x0003
   5161 19            [11] 2163 	add	hl,de
   5162 DD 75 F7      [19] 2164 	ld	-9 (ix),l
   5165 DD 74 F8      [19] 2165 	ld	-8 (ix),h
   5168 DD 7E F7      [19] 2166 	ld	a,-9 (ix)
   516B DD 77 FE      [19] 2167 	ld	-2 (ix),a
   516E DD 7E F8      [19] 2168 	ld	a,-8 (ix)
   5171 DD 77 FF      [19] 2169 	ld	-1 (ix),a
   5174 DD 7E F8      [19] 2170 	ld	a,-8 (ix)
   5177 07            [ 4] 2171 	rlca
   5178 E6 01         [ 7] 2172 	and	a,#0x01
   517A DD 77 FC      [19] 2173 	ld	-4 (ix),a
   517D 21 06 00      [10] 2174 	ld	hl,#0x0006
   5180 19            [11] 2175 	add	hl,de
   5181 DD 75 FA      [19] 2176 	ld	-6 (ix),l
   5184 DD 74 FB      [19] 2177 	ld	-5 (ix),h
   5187 DD 7E FC      [19] 2178 	ld	a,-4 (ix)
   518A B7            [ 4] 2179 	or	a, a
   518B 28 0C         [12] 2180 	jr	Z,00113$
   518D DD 7E FA      [19] 2181 	ld	a,-6 (ix)
   5190 DD 77 FE      [19] 2182 	ld	-2 (ix),a
   5193 DD 7E FB      [19] 2183 	ld	a,-5 (ix)
   5196 DD 77 FF      [19] 2184 	ld	-1 (ix),a
   5199                    2185 00113$:
   5199 DD 6E FE      [19] 2186 	ld	l,-2 (ix)
   519C DD 66 FF      [19] 2187 	ld	h,-1 (ix)
   519F CB 2C         [ 8] 2188 	sra	h
   51A1 CB 1D         [ 8] 2189 	rr	l
   51A3 CB 2C         [ 8] 2190 	sra	h
   51A5 CB 1D         [ 8] 2191 	rr	l
   51A7 D1            [10] 2192 	pop	de
   51A8 D5            [11] 2193 	push	de
   51A9 19            [11] 2194 	add	hl,de
   51AA DD 7E FD      [19] 2195 	ld	a,-3 (ix)
   51AD 96            [ 7] 2196 	sub	a,(hl)
   51AE C2 52 52      [10] 2197 	jp	NZ,00106$
                           2198 ;src/ia.h:56: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   51B1 DD 5E F6      [19] 2199 	ld	e,-10 (ix)
   51B4 16 00         [ 7] 2200 	ld	d,#0x00
   51B6 21 0E 00      [10] 2201 	ld	hl,#0x000E
   51B9 19            [11] 2202 	add	hl,de
   51BA 4D            [ 4] 2203 	ld	c,l
   51BB 44            [ 4] 2204 	ld	b,h
   51BC 69            [ 4] 2205 	ld	l, c
   51BD 78            [ 4] 2206 	ld	a,b
   51BE 67            [ 4] 2207 	ld	h,a
   51BF 07            [ 4] 2208 	rlca
   51C0 E6 01         [ 7] 2209 	and	a,#0x01
   51C2 DD 77 FE      [19] 2210 	ld	-2 (ix),a
   51C5 7B            [ 4] 2211 	ld	a,e
   51C6 C6 1D         [ 7] 2212 	add	a, #0x1D
   51C8 DD 77 F4      [19] 2213 	ld	-12 (ix),a
   51CB 7A            [ 4] 2214 	ld	a,d
   51CC CE 00         [ 7] 2215 	adc	a, #0x00
   51CE DD 77 F5      [19] 2216 	ld	-11 (ix),a
   51D1 DD 7E FE      [19] 2217 	ld	a,-2 (ix)
   51D4 B7            [ 4] 2218 	or	a, a
   51D5 28 02         [12] 2219 	jr	Z,00114$
   51D7 E1            [10] 2220 	pop	hl
   51D8 E5            [11] 2221 	push	hl
   51D9                    2222 00114$:
   51D9 CB 2C         [ 8] 2223 	sra	h
   51DB CB 1D         [ 8] 2224 	rr	l
   51DD CB 2C         [ 8] 2225 	sra	h
   51DF CB 1D         [ 8] 2226 	rr	l
   51E1 CB 2C         [ 8] 2227 	sra	h
   51E3 CB 1D         [ 8] 2228 	rr	l
   51E5 CB 2C         [ 8] 2229 	sra	h
   51E7 CB 1D         [ 8] 2230 	rr	l
   51E9 5D            [ 4] 2231 	ld	e, l
   51EA 54            [ 4] 2232 	ld	d, h
   51EB 29            [11] 2233 	add	hl, hl
   51EC 29            [11] 2234 	add	hl, hl
   51ED 19            [11] 2235 	add	hl, de
   51EE 29            [11] 2236 	add	hl, hl
   51EF 29            [11] 2237 	add	hl, hl
   51F0 11 09 72      [10] 2238 	ld	de,#_scene
   51F3 19            [11] 2239 	add	hl,de
   51F4 DD 5E F9      [19] 2240 	ld	e,-7 (ix)
   51F7 16 00         [ 7] 2241 	ld	d,#0x00
   51F9 19            [11] 2242 	add	hl,de
   51FA DD 7E FD      [19] 2243 	ld	a,-3 (ix)
   51FD 96            [ 7] 2244 	sub	a,(hl)
   51FE 20 52         [12] 2245 	jr	NZ,00106$
                           2246 ;src/ia.h:57: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5200 DD 7E FE      [19] 2247 	ld	a,-2 (ix)
   5203 B7            [ 4] 2248 	or	a, a
   5204 28 02         [12] 2249 	jr	Z,00115$
   5206 C1            [10] 2250 	pop	bc
   5207 C5            [11] 2251 	push	bc
   5208                    2252 00115$:
   5208 CB 28         [ 8] 2253 	sra	b
   520A CB 19         [ 8] 2254 	rr	c
   520C CB 28         [ 8] 2255 	sra	b
   520E CB 19         [ 8] 2256 	rr	c
   5210 CB 28         [ 8] 2257 	sra	b
   5212 CB 19         [ 8] 2258 	rr	c
   5214 CB 28         [ 8] 2259 	sra	b
   5216 CB 19         [ 8] 2260 	rr	c
   5218 69            [ 4] 2261 	ld	l, c
   5219 60            [ 4] 2262 	ld	h, b
   521A 29            [11] 2263 	add	hl, hl
   521B 29            [11] 2264 	add	hl, hl
   521C 09            [11] 2265 	add	hl, bc
   521D 29            [11] 2266 	add	hl, hl
   521E 29            [11] 2267 	add	hl, hl
   521F 3E 09         [ 7] 2268 	ld	a,#<(_scene)
   5221 85            [ 4] 2269 	add	a, l
   5222 DD 77 FE      [19] 2270 	ld	-2 (ix),a
   5225 3E 72         [ 7] 2271 	ld	a,#>(_scene)
   5227 8C            [ 4] 2272 	adc	a, h
   5228 DD 77 FF      [19] 2273 	ld	-1 (ix),a
   522B DD 5E F7      [19] 2274 	ld	e,-9 (ix)
   522E DD 56 F8      [19] 2275 	ld	d,-8 (ix)
   5231 DD 7E FC      [19] 2276 	ld	a,-4 (ix)
   5234 B7            [ 4] 2277 	or	a, a
   5235 28 06         [12] 2278 	jr	Z,00116$
   5237 DD 5E FA      [19] 2279 	ld	e,-6 (ix)
   523A DD 56 FB      [19] 2280 	ld	d,-5 (ix)
   523D                    2281 00116$:
   523D CB 2A         [ 8] 2282 	sra	d
   523F CB 1B         [ 8] 2283 	rr	e
   5241 CB 2A         [ 8] 2284 	sra	d
   5243 CB 1B         [ 8] 2285 	rr	e
   5245 DD 6E FE      [19] 2286 	ld	l,-2 (ix)
   5248 DD 66 FF      [19] 2287 	ld	h,-1 (ix)
   524B 19            [11] 2288 	add	hl,de
   524C DD 7E FD      [19] 2289 	ld	a,-3 (ix)
   524F 96            [ 7] 2290 	sub	a,(hl)
   5250 28 3B         [12] 2291 	jr	Z,00111$
   5252                    2292 00106$:
                           2293 ;src/ia.h:59: switch(enemy.dir){
   5252 3A 2B 73      [13] 2294 	ld	a,(#(_enemy + 0x0009) + 0)
   5255 FE 02         [ 7] 2295 	cp	a,#0x02
   5257 28 22         [12] 2296 	jr	Z,00103$
   5259 FE 04         [ 7] 2297 	cp	a,#0x04
   525B 28 0A         [12] 2298 	jr	Z,00101$
   525D FE 06         [ 7] 2299 	cp	a,#0x06
   525F 28 10         [12] 2300 	jr	Z,00102$
   5261 D6 08         [ 7] 2301 	sub	a, #0x08
   5263 28 20         [12] 2302 	jr	Z,00104$
   5265 18 26         [12] 2303 	jr	00111$
                           2304 ;src/ia.h:60: case 4: movement(6); break;
   5267                    2305 00101$:
   5267 3E 06         [ 7] 2306 	ld	a,#0x06
   5269 F5            [11] 2307 	push	af
   526A 33            [ 6] 2308 	inc	sp
   526B CD B8 50      [17] 2309 	call	_movement
   526E 33            [ 6] 2310 	inc	sp
   526F 18 1C         [12] 2311 	jr	00111$
                           2312 ;src/ia.h:61: case 6: movement(4); break;
   5271                    2313 00102$:
   5271 3E 04         [ 7] 2314 	ld	a,#0x04
   5273 F5            [11] 2315 	push	af
   5274 33            [ 6] 2316 	inc	sp
   5275 CD B8 50      [17] 2317 	call	_movement
   5278 33            [ 6] 2318 	inc	sp
   5279 18 12         [12] 2319 	jr	00111$
                           2320 ;src/ia.h:62: case 2: movement(8); break;
   527B                    2321 00103$:
   527B 3E 08         [ 7] 2322 	ld	a,#0x08
   527D F5            [11] 2323 	push	af
   527E 33            [ 6] 2324 	inc	sp
   527F CD B8 50      [17] 2325 	call	_movement
   5282 33            [ 6] 2326 	inc	sp
   5283 18 08         [12] 2327 	jr	00111$
                           2328 ;src/ia.h:63: case 8: movement(2); break;
   5285                    2329 00104$:
   5285 3E 02         [ 7] 2330 	ld	a,#0x02
   5287 F5            [11] 2331 	push	af
   5288 33            [ 6] 2332 	inc	sp
   5289 CD B8 50      [17] 2333 	call	_movement
   528C 33            [ 6] 2334 	inc	sp
                           2335 ;src/ia.h:64: }
   528D                    2336 00111$:
   528D DD F9         [10] 2337 	ld	sp, ix
   528F DD E1         [14] 2338 	pop	ix
   5291 C9            [10] 2339 	ret
                           2340 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           2341 ;	---------------------------------
                           2342 ; Function checkCollisions
                           2343 ; ---------------------------------
   5292                    2344 _checkCollisions::
   5292 DD E5         [15] 2345 	push	ix
   5294 DD 21 00 00   [14] 2346 	ld	ix,#0
   5298 DD 39         [15] 2347 	add	ix,sp
   529A 21 FA FF      [10] 2348 	ld	hl,#-6
   529D 39            [11] 2349 	add	hl,sp
   529E F9            [ 6] 2350 	ld	sp,hl
                           2351 ;src/CalcColision.h:14: switch(atk){
   529F DD 7E 08      [19] 2352 	ld	a,8 (ix)
   52A2 D6 15         [ 7] 2353 	sub	a, #0x15
   52A4 28 09         [12] 2354 	jr	Z,00101$
   52A6 DD 7E 08      [19] 2355 	ld	a,8 (ix)
   52A9 D6 16         [ 7] 2356 	sub	a, #0x16
   52AB 28 08         [12] 2357 	jr	Z,00102$
   52AD 18 0C         [12] 2358 	jr	00103$
                           2359 ;src/CalcColision.h:15: case 21:
   52AF                    2360 00101$:
                           2361 ;src/CalcColision.h:16: auxX = 2;
   52AF 1E 02         [ 7] 2362 	ld	e,#0x02
                           2363 ;src/CalcColision.h:17: auxY = 8;
   52B1 0E 08         [ 7] 2364 	ld	c,#0x08
                           2365 ;src/CalcColision.h:18: break;
   52B3 18 0A         [12] 2366 	jr	00104$
                           2367 ;src/CalcColision.h:19: case 22:
   52B5                    2368 00102$:
                           2369 ;src/CalcColision.h:20: auxX = 4;
   52B5 1E 04         [ 7] 2370 	ld	e,#0x04
                           2371 ;src/CalcColision.h:21: auxY = 4;
   52B7 0E 04         [ 7] 2372 	ld	c,#0x04
                           2373 ;src/CalcColision.h:22: break;
   52B9 18 04         [12] 2374 	jr	00104$
                           2375 ;src/CalcColision.h:23: default:
   52BB                    2376 00103$:
                           2377 ;src/CalcColision.h:24: auxX = tilewidth;
   52BB 1E 04         [ 7] 2378 	ld	e,#0x04
                           2379 ;src/CalcColision.h:25: auxY = tileheight;
   52BD 0E 10         [ 7] 2380 	ld	c,#0x10
                           2381 ;src/CalcColision.h:26: }
   52BF                    2382 00104$:
                           2383 ;src/CalcColision.h:27: popX = pX + auxX;
   52BF DD 7E 04      [19] 2384 	ld	a,4 (ix)
   52C2 83            [ 4] 2385 	add	a, e
   52C3 6F            [ 4] 2386 	ld	l,a
                           2387 ;src/CalcColision.h:28: popY = pY + auxY;
   52C4 DD 7E 05      [19] 2388 	ld	a,5 (ix)
   52C7 81            [ 4] 2389 	add	a, c
   52C8 DD 77 FA      [19] 2390 	ld	-6 (ix),a
                           2391 ;src/CalcColision.h:29: eopX = eX + auxX;
   52CB DD 7E 06      [19] 2392 	ld	a,6 (ix)
   52CE 83            [ 4] 2393 	add	a, e
   52CF 5F            [ 4] 2394 	ld	e,a
                           2395 ;src/CalcColision.h:30: eopY = eY + auxY;
   52D0 DD 7E 07      [19] 2396 	ld	a,7 (ix)
   52D3 81            [ 4] 2397 	add	a, c
   52D4 DD 77 FB      [19] 2398 	ld	-5 (ix),a
                           2399 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   52D7 7B            [ 4] 2400 	ld	a,e
   52D8 DD 96 04      [19] 2401 	sub	a, 4 (ix)
   52DB 3E 00         [ 7] 2402 	ld	a,#0x00
   52DD 17            [ 4] 2403 	rla
   52DE DD 77 FC      [19] 2404 	ld	-4 (ix),a
   52E1 7D            [ 4] 2405 	ld	a,l
   52E2 93            [ 4] 2406 	sub	a, e
   52E3 3E 00         [ 7] 2407 	ld	a,#0x00
   52E5 17            [ 4] 2408 	rla
   52E6 DD 77 FD      [19] 2409 	ld	-3 (ix),a
   52E9 DD 7E 07      [19] 2410 	ld	a,7 (ix)
   52EC DD 96 05      [19] 2411 	sub	a, 5 (ix)
   52EF 3E 00         [ 7] 2412 	ld	a,#0x00
   52F1 17            [ 4] 2413 	rla
   52F2 5F            [ 4] 2414 	ld	e,a
   52F3 DD 7E FA      [19] 2415 	ld	a,-6 (ix)
   52F6 DD 96 07      [19] 2416 	sub	a, 7 (ix)
   52F9 3E 00         [ 7] 2417 	ld	a,#0x00
   52FB 17            [ 4] 2418 	rla
   52FC 4F            [ 4] 2419 	ld	c,a
                           2420 ;src/CalcColision.h:33: if(atk >= 21)
   52FD DD 7E 08      [19] 2421 	ld	a,8 (ix)
   5300 D6 15         [ 7] 2422 	sub	a, #0x15
   5302 3E 00         [ 7] 2423 	ld	a,#0x00
   5304 17            [ 4] 2424 	rla
   5305 DD 77 FF      [19] 2425 	ld	-1 (ix),a
                           2426 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   5308 DD 7E FC      [19] 2427 	ld	a,-4 (ix)
   530B B7            [ 4] 2428 	or	a, a
   530C 20 1C         [12] 2429 	jr	NZ,00109$
   530E DD 7E FD      [19] 2430 	ld	a,-3 (ix)
   5311 B7            [ 4] 2431 	or	a,a
   5312 20 16         [12] 2432 	jr	NZ,00109$
   5314 B3            [ 4] 2433 	or	a,e
   5315 20 13         [12] 2434 	jr	NZ,00109$
   5317 B1            [ 4] 2435 	or	a,c
   5318 20 10         [12] 2436 	jr	NZ,00109$
                           2437 ;src/CalcColision.h:33: if(atk >= 21)
   531A DD 7E FF      [19] 2438 	ld	a,-1 (ix)
   531D B7            [ 4] 2439 	or	a, a
   531E 20 05         [12] 2440 	jr	NZ,00106$
                           2441 ;src/CalcColision.h:34: return 1;
   5320 2E 01         [ 7] 2442 	ld	l,#0x01
   5322 C3 AE 53      [10] 2443 	jp	00137$
   5325                    2444 00106$:
                           2445 ;src/CalcColision.h:36: return 2;
   5325 2E 02         [ 7] 2446 	ld	l,#0x02
   5327 C3 AE 53      [10] 2447 	jp	00137$
   532A                    2448 00109$:
                           2449 ;src/CalcColision.h:38: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   532A DD 7E 06      [19] 2450 	ld	a,6 (ix)
   532D DD 96 04      [19] 2451 	sub	a, 4 (ix)
   5330 3E 00         [ 7] 2452 	ld	a,#0x00
   5332 17            [ 4] 2453 	rla
   5333 DD 77 FE      [19] 2454 	ld	-2 (ix),a
   5336 7D            [ 4] 2455 	ld	a,l
   5337 DD 96 06      [19] 2456 	sub	a, 6 (ix)
   533A 3E 00         [ 7] 2457 	ld	a,#0x00
   533C 17            [ 4] 2458 	rla
   533D 6F            [ 4] 2459 	ld	l,a
   533E DD 7E FE      [19] 2460 	ld	a,-2 (ix)
   5341 B7            [ 4] 2461 	or	a,a
   5342 20 17         [12] 2462 	jr	NZ,00117$
   5344 B5            [ 4] 2463 	or	a,l
   5345 20 14         [12] 2464 	jr	NZ,00117$
   5347 B3            [ 4] 2465 	or	a,e
   5348 20 11         [12] 2466 	jr	NZ,00117$
   534A B1            [ 4] 2467 	or	a,c
   534B 20 0E         [12] 2468 	jr	NZ,00117$
                           2469 ;src/CalcColision.h:39: if(atk >= 21)
   534D DD 7E FF      [19] 2470 	ld	a,-1 (ix)
   5350 B7            [ 4] 2471 	or	a, a
   5351 20 04         [12] 2472 	jr	NZ,00114$
                           2473 ;src/CalcColision.h:40: return 1;
   5353 2E 01         [ 7] 2474 	ld	l,#0x01
   5355 18 57         [12] 2475 	jr	00137$
   5357                    2476 00114$:
                           2477 ;src/CalcColision.h:42: return 2;
   5357 2E 02         [ 7] 2478 	ld	l,#0x02
   5359 18 53         [12] 2479 	jr	00137$
   535B                    2480 00117$:
                           2481 ;src/CalcColision.h:44: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   535B DD 7E FB      [19] 2482 	ld	a,-5 (ix)
   535E DD 96 05      [19] 2483 	sub	a, 5 (ix)
   5361 3E 00         [ 7] 2484 	ld	a,#0x00
   5363 17            [ 4] 2485 	rla
   5364 5F            [ 4] 2486 	ld	e,a
   5365 DD 7E FA      [19] 2487 	ld	a,-6 (ix)
   5368 DD 96 FB      [19] 2488 	sub	a, -5 (ix)
   536B 3E 00         [ 7] 2489 	ld	a,#0x00
   536D 17            [ 4] 2490 	rla
   536E 67            [ 4] 2491 	ld	h,a
   536F DD 7E FE      [19] 2492 	ld	a,-2 (ix)
   5372 B7            [ 4] 2493 	or	a,a
   5373 20 17         [12] 2494 	jr	NZ,00125$
   5375 B5            [ 4] 2495 	or	a,l
   5376 20 14         [12] 2496 	jr	NZ,00125$
   5378 B3            [ 4] 2497 	or	a,e
   5379 20 11         [12] 2498 	jr	NZ,00125$
   537B B4            [ 4] 2499 	or	a,h
   537C 20 0E         [12] 2500 	jr	NZ,00125$
                           2501 ;src/CalcColision.h:45: if(atk >= 21)
   537E DD 7E FF      [19] 2502 	ld	a,-1 (ix)
   5381 B7            [ 4] 2503 	or	a, a
   5382 20 04         [12] 2504 	jr	NZ,00122$
                           2505 ;src/CalcColision.h:46: return 1;
   5384 2E 01         [ 7] 2506 	ld	l,#0x01
   5386 18 26         [12] 2507 	jr	00137$
   5388                    2508 00122$:
                           2509 ;src/CalcColision.h:48: return 2;
   5388 2E 02         [ 7] 2510 	ld	l,#0x02
   538A 18 22         [12] 2511 	jr	00137$
   538C                    2512 00125$:
                           2513 ;src/CalcColision.h:50: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   538C DD 7E FC      [19] 2514 	ld	a,-4 (ix)
   538F B7            [ 4] 2515 	or	a, a
   5390 20 1A         [12] 2516 	jr	NZ,00133$
   5392 DD 7E FD      [19] 2517 	ld	a,-3 (ix)
   5395 B7            [ 4] 2518 	or	a,a
   5396 20 14         [12] 2519 	jr	NZ,00133$
   5398 B3            [ 4] 2520 	or	a,e
   5399 20 11         [12] 2521 	jr	NZ,00133$
   539B B4            [ 4] 2522 	or	a,h
   539C 20 0E         [12] 2523 	jr	NZ,00133$
                           2524 ;src/CalcColision.h:51: if(atk >= 21)
   539E DD 7E FF      [19] 2525 	ld	a,-1 (ix)
   53A1 B7            [ 4] 2526 	or	a, a
   53A2 20 04         [12] 2527 	jr	NZ,00130$
                           2528 ;src/CalcColision.h:52: return 1;
   53A4 2E 01         [ 7] 2529 	ld	l,#0x01
   53A6 18 06         [12] 2530 	jr	00137$
   53A8                    2531 00130$:
                           2532 ;src/CalcColision.h:54: return 2;
   53A8 2E 02         [ 7] 2533 	ld	l,#0x02
   53AA 18 02         [12] 2534 	jr	00137$
   53AC                    2535 00133$:
                           2536 ;src/CalcColision.h:56: return 0;
   53AC 2E 00         [ 7] 2537 	ld	l,#0x00
   53AE                    2538 00137$:
   53AE DD F9         [10] 2539 	ld	sp, ix
   53B0 DD E1         [14] 2540 	pop	ix
   53B2 C9            [10] 2541 	ret
                           2542 ;src/CalcColision.h:59: u8 checkArrowCollisions(){
                           2543 ;	---------------------------------
                           2544 ; Function checkArrowCollisions
                           2545 ; ---------------------------------
   53B3                    2546 _checkArrowCollisions::
   53B3 DD E5         [15] 2547 	push	ix
   53B5 DD 21 00 00   [14] 2548 	ld	ix,#0
   53B9 DD 39         [15] 2549 	add	ix,sp
   53BB 21 F2 FF      [10] 2550 	ld	hl,#-14
   53BE 39            [11] 2551 	add	hl,sp
   53BF F9            [ 6] 2552 	ld	sp,hl
                           2553 ;src/CalcColision.h:62: if(    scene[(parrow.y)/tileheight][(parrow.x)/tilewidth] == 1
   53C0 3A 04 73      [13] 2554 	ld	a,(#(_parrow + 0x0001) + 0)
   53C3 DD 77 F3      [19] 2555 	ld	-13 (ix), a
   53C6 07            [ 4] 2556 	rlca
   53C7 07            [ 4] 2557 	rlca
   53C8 07            [ 4] 2558 	rlca
   53C9 07            [ 4] 2559 	rlca
   53CA E6 0F         [ 7] 2560 	and	a,#0x0F
   53CC 4F            [ 4] 2561 	ld	c,a
   53CD 06 00         [ 7] 2562 	ld	b,#0x00
   53CF 69            [ 4] 2563 	ld	l, c
   53D0 60            [ 4] 2564 	ld	h, b
   53D1 29            [11] 2565 	add	hl, hl
   53D2 29            [11] 2566 	add	hl, hl
   53D3 09            [11] 2567 	add	hl, bc
   53D4 29            [11] 2568 	add	hl, hl
   53D5 29            [11] 2569 	add	hl, hl
   53D6 3E 09         [ 7] 2570 	ld	a,#<(_scene)
   53D8 85            [ 4] 2571 	add	a, l
   53D9 DD 77 F6      [19] 2572 	ld	-10 (ix),a
   53DC 3E 72         [ 7] 2573 	ld	a,#>(_scene)
   53DE 8C            [ 4] 2574 	adc	a, h
   53DF DD 77 F7      [19] 2575 	ld	-9 (ix),a
   53E2 21 03 73      [10] 2576 	ld	hl, #_parrow + 0
   53E5 4E            [ 7] 2577 	ld	c,(hl)
   53E6 79            [ 4] 2578 	ld	a,c
   53E7 0F            [ 4] 2579 	rrca
   53E8 0F            [ 4] 2580 	rrca
   53E9 E6 3F         [ 7] 2581 	and	a,#0x3F
   53EB DD 77 F2      [19] 2582 	ld	-14 (ix), a
   53EE DD 86 F6      [19] 2583 	add	a, -10 (ix)
   53F1 6F            [ 4] 2584 	ld	l,a
   53F2 3E 00         [ 7] 2585 	ld	a,#0x00
   53F4 DD 8E F7      [19] 2586 	adc	a, -9 (ix)
   53F7 67            [ 4] 2587 	ld	h,a
   53F8 7E            [ 7] 2588 	ld	a,(hl)
                           2589 ;src/CalcColision.h:67: parrow.x=parrow.lx;
                           2590 ;src/CalcColision.h:68: parrow.y=parrow.ly;
                           2591 ;src/CalcColision.h:62: if(    scene[(parrow.y)/tileheight][(parrow.x)/tilewidth] == 1
   53F9 DD 77 F4      [19] 2592 	ld	-12 (ix), a
   53FC 3D            [ 4] 2593 	dec	a
   53FD CA 1C 55      [10] 2594 	jp	Z,00101$
                           2595 ;src/CalcColision.h:63: || scene[(parrow.y)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
   5400 06 00         [ 7] 2596 	ld	b,#0x00
   5402 21 03 00      [10] 2597 	ld	hl,#0x0003
   5405 09            [11] 2598 	add	hl,bc
   5406 DD 75 FC      [19] 2599 	ld	-4 (ix),l
   5409 DD 74 FD      [19] 2600 	ld	-3 (ix),h
   540C DD 7E FC      [19] 2601 	ld	a,-4 (ix)
   540F DD 77 FA      [19] 2602 	ld	-6 (ix),a
   5412 DD 7E FD      [19] 2603 	ld	a,-3 (ix)
   5415 DD 77 FB      [19] 2604 	ld	-5 (ix),a
   5418 DD 7E FD      [19] 2605 	ld	a,-3 (ix)
   541B 07            [ 4] 2606 	rlca
   541C E6 01         [ 7] 2607 	and	a,#0x01
   541E DD 77 F5      [19] 2608 	ld	-11 (ix),a
   5421 21 06 00      [10] 2609 	ld	hl,#0x0006
   5424 09            [11] 2610 	add	hl,bc
   5425 DD 75 FE      [19] 2611 	ld	-2 (ix),l
   5428 DD 74 FF      [19] 2612 	ld	-1 (ix),h
   542B DD 7E F5      [19] 2613 	ld	a,-11 (ix)
   542E B7            [ 4] 2614 	or	a, a
   542F 28 0C         [12] 2615 	jr	Z,00113$
   5431 DD 7E FE      [19] 2616 	ld	a,-2 (ix)
   5434 DD 77 FA      [19] 2617 	ld	-6 (ix),a
   5437 DD 7E FF      [19] 2618 	ld	a,-1 (ix)
   543A DD 77 FB      [19] 2619 	ld	-5 (ix),a
   543D                    2620 00113$:
   543D DD 6E FA      [19] 2621 	ld	l,-6 (ix)
   5440 DD 66 FB      [19] 2622 	ld	h,-5 (ix)
   5443 CB 2C         [ 8] 2623 	sra	h
   5445 CB 1D         [ 8] 2624 	rr	l
   5447 CB 2C         [ 8] 2625 	sra	h
   5449 CB 1D         [ 8] 2626 	rr	l
   544B DD 5E F6      [19] 2627 	ld	e,-10 (ix)
   544E DD 56 F7      [19] 2628 	ld	d,-9 (ix)
   5451 19            [11] 2629 	add	hl,de
   5452 7E            [ 7] 2630 	ld	a,(hl)
   5453 3D            [ 4] 2631 	dec	a
   5454 CA 1C 55      [10] 2632 	jp	Z,00101$
                           2633 ;src/CalcColision.h:64: || scene[(parrow.y+6)/tileheight][(parrow.x)/tilewidth] == 1
   5457 DD 5E F3      [19] 2634 	ld	e,-13 (ix)
   545A 16 00         [ 7] 2635 	ld	d,#0x00
   545C 21 06 00      [10] 2636 	ld	hl,#0x0006
   545F 19            [11] 2637 	add	hl,de
   5460 4D            [ 4] 2638 	ld	c,l
   5461 44            [ 4] 2639 	ld	b,h
   5462 DD 71 FA      [19] 2640 	ld	-6 (ix),c
   5465 DD 70 FB      [19] 2641 	ld	-5 (ix),b
   5468 78            [ 4] 2642 	ld	a,b
   5469 07            [ 4] 2643 	rlca
   546A E6 01         [ 7] 2644 	and	a,#0x01
   546C DD 77 F3      [19] 2645 	ld	-13 (ix),a
   546F 21 15 00      [10] 2646 	ld	hl,#0x0015
   5472 19            [11] 2647 	add	hl,de
   5473 DD 75 F8      [19] 2648 	ld	-8 (ix),l
   5476 DD 74 F9      [19] 2649 	ld	-7 (ix),h
   5479 DD 7E F3      [19] 2650 	ld	a,-13 (ix)
   547C B7            [ 4] 2651 	or	a, a
   547D 28 0C         [12] 2652 	jr	Z,00114$
   547F DD 7E F8      [19] 2653 	ld	a,-8 (ix)
   5482 DD 77 FA      [19] 2654 	ld	-6 (ix),a
   5485 DD 7E F9      [19] 2655 	ld	a,-7 (ix)
   5488 DD 77 FB      [19] 2656 	ld	-5 (ix),a
   548B                    2657 00114$:
   548B DD 6E FA      [19] 2658 	ld	l,-6 (ix)
   548E DD 66 FB      [19] 2659 	ld	h,-5 (ix)
   5491 CB 2C         [ 8] 2660 	sra	h
   5493 CB 1D         [ 8] 2661 	rr	l
   5495 CB 2C         [ 8] 2662 	sra	h
   5497 CB 1D         [ 8] 2663 	rr	l
   5499 CB 2C         [ 8] 2664 	sra	h
   549B CB 1D         [ 8] 2665 	rr	l
   549D CB 2C         [ 8] 2666 	sra	h
   549F CB 1D         [ 8] 2667 	rr	l
   54A1 5D            [ 4] 2668 	ld	e, l
   54A2 54            [ 4] 2669 	ld	d, h
   54A3 29            [11] 2670 	add	hl, hl
   54A4 29            [11] 2671 	add	hl, hl
   54A5 19            [11] 2672 	add	hl, de
   54A6 29            [11] 2673 	add	hl, hl
   54A7 29            [11] 2674 	add	hl, hl
   54A8 11 09 72      [10] 2675 	ld	de,#_scene
   54AB 19            [11] 2676 	add	hl,de
   54AC DD 5E F2      [19] 2677 	ld	e,-14 (ix)
   54AF 16 00         [ 7] 2678 	ld	d,#0x00
   54B1 19            [11] 2679 	add	hl,de
   54B2 7E            [ 7] 2680 	ld	a,(hl)
   54B3 3D            [ 4] 2681 	dec	a
   54B4 28 66         [12] 2682 	jr	Z,00101$
                           2683 ;src/CalcColision.h:65: || scene[(parrow.y+6)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
   54B6 DD 71 FA      [19] 2684 	ld	-6 (ix),c
   54B9 DD 70 FB      [19] 2685 	ld	-5 (ix),b
   54BC DD 7E F3      [19] 2686 	ld	a,-13 (ix)
   54BF B7            [ 4] 2687 	or	a, a
   54C0 28 0C         [12] 2688 	jr	Z,00115$
   54C2 DD 7E F8      [19] 2689 	ld	a,-8 (ix)
   54C5 DD 77 FA      [19] 2690 	ld	-6 (ix),a
   54C8 DD 7E F9      [19] 2691 	ld	a,-7 (ix)
   54CB DD 77 FB      [19] 2692 	ld	-5 (ix),a
   54CE                    2693 00115$:
   54CE DD 6E FA      [19] 2694 	ld	l,-6 (ix)
   54D1 DD 66 FB      [19] 2695 	ld	h,-5 (ix)
   54D4 CB 2C         [ 8] 2696 	sra	h
   54D6 CB 1D         [ 8] 2697 	rr	l
   54D8 CB 2C         [ 8] 2698 	sra	h
   54DA CB 1D         [ 8] 2699 	rr	l
   54DC CB 2C         [ 8] 2700 	sra	h
   54DE CB 1D         [ 8] 2701 	rr	l
   54E0 CB 2C         [ 8] 2702 	sra	h
   54E2 CB 1D         [ 8] 2703 	rr	l
   54E4 5D            [ 4] 2704 	ld	e, l
   54E5 54            [ 4] 2705 	ld	d, h
   54E6 29            [11] 2706 	add	hl, hl
   54E7 29            [11] 2707 	add	hl, hl
   54E8 19            [11] 2708 	add	hl, de
   54E9 29            [11] 2709 	add	hl, hl
   54EA 29            [11] 2710 	add	hl, hl
   54EB 3E 09         [ 7] 2711 	ld	a,#<(_scene)
   54ED 85            [ 4] 2712 	add	a, l
   54EE DD 77 FA      [19] 2713 	ld	-6 (ix),a
   54F1 3E 72         [ 7] 2714 	ld	a,#>(_scene)
   54F3 8C            [ 4] 2715 	adc	a, h
   54F4 DD 77 FB      [19] 2716 	ld	-5 (ix),a
   54F7 DD 6E FC      [19] 2717 	ld	l,-4 (ix)
   54FA DD 66 FD      [19] 2718 	ld	h,-3 (ix)
   54FD DD 7E F5      [19] 2719 	ld	a,-11 (ix)
   5500 B7            [ 4] 2720 	or	a, a
   5501 28 06         [12] 2721 	jr	Z,00116$
   5503 DD 6E FE      [19] 2722 	ld	l,-2 (ix)
   5506 DD 66 FF      [19] 2723 	ld	h,-1 (ix)
   5509                    2724 00116$:
   5509 CB 2C         [ 8] 2725 	sra	h
   550B CB 1D         [ 8] 2726 	rr	l
   550D CB 2C         [ 8] 2727 	sra	h
   550F CB 1D         [ 8] 2728 	rr	l
   5511 DD 5E FA      [19] 2729 	ld	e,-6 (ix)
   5514 DD 56 FB      [19] 2730 	ld	d,-5 (ix)
   5517 19            [11] 2731 	add	hl,de
   5518 7E            [ 7] 2732 	ld	a,(hl)
   5519 3D            [ 4] 2733 	dec	a
   551A 20 11         [12] 2734 	jr	NZ,00102$
   551C                    2735 00101$:
                           2736 ;src/CalcColision.h:67: parrow.x=parrow.lx;
   551C 3A 05 73      [13] 2737 	ld	a, (#(_parrow + 0x0002) + 0)
   551F 32 03 73      [13] 2738 	ld	(#_parrow),a
                           2739 ;src/CalcColision.h:68: parrow.y=parrow.ly;
   5522 3A 06 73      [13] 2740 	ld	a, (#(_parrow + 0x0003) + 0)
   5525 32 04 73      [13] 2741 	ld	(#(_parrow + 0x0001)),a
                           2742 ;src/CalcColision.h:70: return bound;
   5528 2E 01         [ 7] 2743 	ld	l,#0x01
   552A C3 F7 55      [10] 2744 	jp	00111$
   552D                    2745 00102$:
                           2746 ;src/CalcColision.h:73: if(    scene[(parrow.y)/tileheight][(parrow.x)/tilewidth] == 9
   552D DD 7E F4      [19] 2747 	ld	a,-12 (ix)
   5530 D6 09         [ 7] 2748 	sub	a, #0x09
   5532 CA E5 55      [10] 2749 	jp	Z,00106$
                           2750 ;src/CalcColision.h:74: || scene[(parrow.y)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 9
   5535 DD 6E FC      [19] 2751 	ld	l,-4 (ix)
   5538 DD 66 FD      [19] 2752 	ld	h,-3 (ix)
   553B DD 7E F5      [19] 2753 	ld	a,-11 (ix)
   553E B7            [ 4] 2754 	or	a, a
   553F 28 06         [12] 2755 	jr	Z,00117$
   5541 DD 6E FE      [19] 2756 	ld	l,-2 (ix)
   5544 DD 66 FF      [19] 2757 	ld	h,-1 (ix)
   5547                    2758 00117$:
   5547 CB 2C         [ 8] 2759 	sra	h
   5549 CB 1D         [ 8] 2760 	rr	l
   554B CB 2C         [ 8] 2761 	sra	h
   554D CB 1D         [ 8] 2762 	rr	l
   554F DD 5E F6      [19] 2763 	ld	e,-10 (ix)
   5552 DD 56 F7      [19] 2764 	ld	d,-9 (ix)
   5555 19            [11] 2765 	add	hl,de
   5556 7E            [ 7] 2766 	ld	a,(hl)
   5557 D6 09         [ 7] 2767 	sub	a, #0x09
   5559 CA E5 55      [10] 2768 	jp	Z,00106$
                           2769 ;src/CalcColision.h:75: || scene[(parrow.y+6)/tileheight][(parrow.x)/tilewidth] == 9
   555C 69            [ 4] 2770 	ld	l, c
   555D 60            [ 4] 2771 	ld	h, b
   555E DD 7E F3      [19] 2772 	ld	a,-13 (ix)
   5561 B7            [ 4] 2773 	or	a, a
   5562 28 06         [12] 2774 	jr	Z,00118$
   5564 DD 6E F8      [19] 2775 	ld	l,-8 (ix)
   5567 DD 66 F9      [19] 2776 	ld	h,-7 (ix)
   556A                    2777 00118$:
   556A CB 2C         [ 8] 2778 	sra	h
   556C CB 1D         [ 8] 2779 	rr	l
   556E CB 2C         [ 8] 2780 	sra	h
   5570 CB 1D         [ 8] 2781 	rr	l
   5572 CB 2C         [ 8] 2782 	sra	h
   5574 CB 1D         [ 8] 2783 	rr	l
   5576 CB 2C         [ 8] 2784 	sra	h
   5578 CB 1D         [ 8] 2785 	rr	l
   557A 5D            [ 4] 2786 	ld	e, l
   557B 54            [ 4] 2787 	ld	d, h
   557C 29            [11] 2788 	add	hl, hl
   557D 29            [11] 2789 	add	hl, hl
   557E 19            [11] 2790 	add	hl, de
   557F 29            [11] 2791 	add	hl, hl
   5580 29            [11] 2792 	add	hl, hl
   5581 11 09 72      [10] 2793 	ld	de,#_scene
   5584 19            [11] 2794 	add	hl,de
   5585 DD 5E F2      [19] 2795 	ld	e,-14 (ix)
   5588 16 00         [ 7] 2796 	ld	d,#0x00
   558A 19            [11] 2797 	add	hl,de
   558B 7E            [ 7] 2798 	ld	a,(hl)
   558C D6 09         [ 7] 2799 	sub	a, #0x09
   558E 28 55         [12] 2800 	jr	Z,00106$
                           2801 ;src/CalcColision.h:76: || scene[(parrow.y+6)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 9
   5590 DD 7E F3      [19] 2802 	ld	a,-13 (ix)
   5593 B7            [ 4] 2803 	or	a, a
   5594 28 06         [12] 2804 	jr	Z,00119$
   5596 DD 4E F8      [19] 2805 	ld	c,-8 (ix)
   5599 DD 46 F9      [19] 2806 	ld	b,-7 (ix)
   559C                    2807 00119$:
   559C CB 28         [ 8] 2808 	sra	b
   559E CB 19         [ 8] 2809 	rr	c
   55A0 CB 28         [ 8] 2810 	sra	b
   55A2 CB 19         [ 8] 2811 	rr	c
   55A4 CB 28         [ 8] 2812 	sra	b
   55A6 CB 19         [ 8] 2813 	rr	c
   55A8 CB 28         [ 8] 2814 	sra	b
   55AA CB 19         [ 8] 2815 	rr	c
   55AC 69            [ 4] 2816 	ld	l, c
   55AD 60            [ 4] 2817 	ld	h, b
   55AE 29            [11] 2818 	add	hl, hl
   55AF 29            [11] 2819 	add	hl, hl
   55B0 09            [11] 2820 	add	hl, bc
   55B1 29            [11] 2821 	add	hl, hl
   55B2 29            [11] 2822 	add	hl, hl
   55B3 3E 09         [ 7] 2823 	ld	a,#<(_scene)
   55B5 85            [ 4] 2824 	add	a, l
   55B6 DD 77 F8      [19] 2825 	ld	-8 (ix),a
   55B9 3E 72         [ 7] 2826 	ld	a,#>(_scene)
   55BB 8C            [ 4] 2827 	adc	a, h
   55BC DD 77 F9      [19] 2828 	ld	-7 (ix),a
   55BF DD 6E FC      [19] 2829 	ld	l,-4 (ix)
   55C2 DD 66 FD      [19] 2830 	ld	h,-3 (ix)
   55C5 DD 7E F5      [19] 2831 	ld	a,-11 (ix)
   55C8 B7            [ 4] 2832 	or	a, a
   55C9 28 06         [12] 2833 	jr	Z,00120$
   55CB DD 6E FE      [19] 2834 	ld	l,-2 (ix)
   55CE DD 66 FF      [19] 2835 	ld	h,-1 (ix)
   55D1                    2836 00120$:
   55D1 CB 2C         [ 8] 2837 	sra	h
   55D3 CB 1D         [ 8] 2838 	rr	l
   55D5 CB 2C         [ 8] 2839 	sra	h
   55D7 CB 1D         [ 8] 2840 	rr	l
   55D9 DD 5E F8      [19] 2841 	ld	e,-8 (ix)
   55DC DD 56 F9      [19] 2842 	ld	d,-7 (ix)
   55DF 19            [11] 2843 	add	hl,de
   55E0 7E            [ 7] 2844 	ld	a,(hl)
   55E1 D6 09         [ 7] 2845 	sub	a, #0x09
   55E3 20 10         [12] 2846 	jr	NZ,00107$
   55E5                    2847 00106$:
                           2848 ;src/CalcColision.h:78: parrow.x=parrow.lx;
   55E5 3A 05 73      [13] 2849 	ld	a, (#(_parrow + 0x0002) + 0)
   55E8 32 03 73      [13] 2850 	ld	(#_parrow),a
                           2851 ;src/CalcColision.h:79: parrow.y=parrow.ly;
   55EB 3A 06 73      [13] 2852 	ld	a, (#(_parrow + 0x0003) + 0)
   55EE 32 04 73      [13] 2853 	ld	(#(_parrow + 0x0001)),a
                           2854 ;src/CalcColision.h:81: return bound;
   55F1 2E 01         [ 7] 2855 	ld	l,#0x01
   55F3 18 02         [12] 2856 	jr	00111$
   55F5                    2857 00107$:
                           2858 ;src/CalcColision.h:84: return bound;
   55F5 2E 00         [ 7] 2859 	ld	l,#0x00
   55F7                    2860 00111$:
   55F7 DD F9         [10] 2861 	ld	sp, ix
   55F9 DD E1         [14] 2862 	pop	ix
   55FB C9            [10] 2863 	ret
                           2864 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2865 ;	---------------------------------
                           2866 ; Function checkKeyboard
                           2867 ; ---------------------------------
   55FC                    2868 _checkKeyboard::
   55FC DD E5         [15] 2869 	push	ix
   55FE DD 21 00 00   [14] 2870 	ld	ix,#0
   5602 DD 39         [15] 2871 	add	ix,sp
   5604 21 FA FF      [10] 2872 	ld	hl,#-6
   5607 39            [11] 2873 	add	hl,sp
   5608 F9            [ 6] 2874 	ld	sp,hl
                           2875 ;src/keyboard.h:14: u8 *s = NULL;
   5609 DD 36 FE 00   [19] 2876 	ld	-2 (ix),#0x00
   560D DD 36 FF 00   [19] 2877 	ld	-1 (ix),#0x00
                           2878 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   5611 21 05 80      [10] 2879 	ld	hl,#0x8005
   5614 CD 45 6D      [17] 2880 	call	_cpct_isKeyPressed
   5617 7D            [ 4] 2881 	ld	a,l
   5618 B7            [ 4] 2882 	or	a, a
   5619 28 68         [12] 2883 	jr	Z,00147$
   561B 21 1F 73      [10] 2884 	ld	hl, #(_player + 0x0008) + 0
   561E 7E            [ 7] 2885 	ld	a,(hl)
   561F DD 77 FD      [19] 2886 	ld	-3 (ix), a
   5622 D6 14         [ 7] 2887 	sub	a, #0x14
   5624 38 5D         [12] 2888 	jr	C,00147$
                           2889 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   5626 DD 7E FD      [19] 2890 	ld	a,-3 (ix)
   5629 D6 32         [ 7] 2891 	sub	a, #0x32
   562B 38 07         [12] 2892 	jr	C,00102$
   562D 21 1F 73      [10] 2893 	ld	hl,#(_player + 0x0008)
   5630 36 00         [10] 2894 	ld	(hl),#0x00
   5632 18 08         [12] 2895 	jr	00103$
   5634                    2896 00102$:
                           2897 ;src/keyboard.h:17: else player.atk += 1;
   5634 DD 7E FD      [19] 2898 	ld	a,-3 (ix)
   5637 3C            [ 4] 2899 	inc	a
   5638 21 1F 73      [10] 2900 	ld	hl,#(_player + 0x0008)
   563B 77            [ 7] 2901 	ld	(hl),a
   563C                    2902 00103$:
                           2903 ;src/keyboard.h:18: switch(player.dir){
   563C 21 1E 73      [10] 2904 	ld	hl, #_player + 7
   563F 66            [ 7] 2905 	ld	h,(hl)
   5640 7C            [ 4] 2906 	ld	a,h
   5641 D6 02         [ 7] 2907 	sub	a, #0x02
   5643 28 33         [12] 2908 	jr	Z,00107$
   5645 7C            [ 4] 2909 	ld	a,h
   5646 D6 04         [ 7] 2910 	sub	a, #0x04
   5648 28 0D         [12] 2911 	jr	Z,00104$
   564A 7C            [ 4] 2912 	ld	a,h
   564B D6 06         [ 7] 2913 	sub	a, #0x06
   564D 28 13         [12] 2914 	jr	Z,00105$
   564F 7C            [ 4] 2915 	ld	a,h
   5650 D6 08         [ 7] 2916 	sub	a, #0x08
   5652 28 19         [12] 2917 	jr	Z,00106$
   5654 C3 4A 58      [10] 2918 	jp	00148$
                           2919 ;src/keyboard.h:19: case 4:
   5657                    2920 00104$:
                           2921 ;src/keyboard.h:20: s = gladis_atk_izda;
   5657 DD 36 FE 80   [19] 2922 	ld	-2 (ix),#<(_gladis_atk_izda)
   565B DD 36 FF 41   [19] 2923 	ld	-1 (ix),#>(_gladis_atk_izda)
                           2924 ;src/keyboard.h:21: break;
   565F C3 4A 58      [10] 2925 	jp	00148$
                           2926 ;src/keyboard.h:22: case 6:
   5662                    2927 00105$:
                           2928 ;src/keyboard.h:23: s = gladis_atk_dcha;
   5662 DD 36 FE 00   [19] 2929 	ld	-2 (ix),#<(_gladis_atk_dcha)
   5666 DD 36 FF 41   [19] 2930 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           2931 ;src/keyboard.h:24: break;
   566A C3 4A 58      [10] 2932 	jp	00148$
                           2933 ;src/keyboard.h:25: case 8:
   566D                    2934 00106$:
                           2935 ;src/keyboard.h:26: s = gladis_atk_arriba;
   566D DD 36 FE 80   [19] 2936 	ld	-2 (ix),#<(_gladis_atk_arriba)
   5671 DD 36 FF 43   [19] 2937 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           2938 ;src/keyboard.h:27: break;
   5675 C3 4A 58      [10] 2939 	jp	00148$
                           2940 ;src/keyboard.h:28: case 2:
   5678                    2941 00107$:
                           2942 ;src/keyboard.h:29: s = gladis_atk_abajo;
   5678 DD 36 FE 00   [19] 2943 	ld	-2 (ix),#<(_gladis_atk_abajo)
   567C DD 36 FF 43   [19] 2944 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           2945 ;src/keyboard.h:31: }
   5680 C3 4A 58      [10] 2946 	jp	00148$
   5683                    2947 00147$:
                           2948 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   5683 21 1F 73      [10] 2949 	ld	hl, #(_player + 0x0008) + 0
   5686 56            [ 7] 2950 	ld	d,(hl)
   5687 7A            [ 4] 2951 	ld	a,d
   5688 D6 14         [ 7] 2952 	sub	a, #0x14
   568A 30 07         [12] 2953 	jr	NC,00110$
   568C 14            [ 4] 2954 	inc	d
   568D 21 1F 73      [10] 2955 	ld	hl,#(_player + 0x0008)
   5690 72            [ 7] 2956 	ld	(hl),d
   5691 18 05         [12] 2957 	jr	00111$
   5693                    2958 00110$:
                           2959 ;src/keyboard.h:34: else player.atk = 20;
   5693 21 1F 73      [10] 2960 	ld	hl,#(_player + 0x0008)
   5696 36 14         [10] 2961 	ld	(hl),#0x14
   5698                    2962 00111$:
                           2963 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   5698 21 00 02      [10] 2964 	ld	hl,#0x0200
   569B CD 45 6D      [17] 2965 	call	_cpct_isKeyPressed
                           2966 ;src/keyboard.h:37: player.dir = 6;
                           2967 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   569E 7D            [ 4] 2968 	ld	a,l
   569F B7            [ 4] 2969 	or	a, a
   56A0 28 1E         [12] 2970 	jr	Z,00143$
   56A2 21 17 73      [10] 2971 	ld	hl, #_player + 0
   56A5 56            [ 7] 2972 	ld	d,(hl)
   56A6 7A            [ 4] 2973 	ld	a,d
   56A7 D6 4C         [ 7] 2974 	sub	a, #0x4C
   56A9 30 15         [12] 2975 	jr	NC,00143$
                           2976 ;src/keyboard.h:36: player.x += 1;
   56AB 14            [ 4] 2977 	inc	d
   56AC 21 17 73      [10] 2978 	ld	hl,#_player
   56AF 72            [ 7] 2979 	ld	(hl),d
                           2980 ;src/keyboard.h:37: player.dir = 6;
   56B0 21 1E 73      [10] 2981 	ld	hl,#(_player + 0x0007)
   56B3 36 06         [10] 2982 	ld	(hl),#0x06
                           2983 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   56B5 DD 36 FE 00   [19] 2984 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   56B9 DD 36 FF 40   [19] 2985 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   56BD C3 4A 58      [10] 2986 	jp	00148$
   56C0                    2987 00143$:
                           2988 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   56C0 21 01 01      [10] 2989 	ld	hl,#0x0101
   56C3 CD 45 6D      [17] 2990 	call	_cpct_isKeyPressed
   56C6 7D            [ 4] 2991 	ld	a,l
   56C7 B7            [ 4] 2992 	or	a, a
   56C8 28 1B         [12] 2993 	jr	Z,00139$
   56CA 3A 17 73      [13] 2994 	ld	a, (#_player + 0)
   56CD B7            [ 4] 2995 	or	a, a
   56CE 28 15         [12] 2996 	jr	Z,00139$
                           2997 ;src/keyboard.h:40: player.x -= 1;
   56D0 C6 FF         [ 7] 2998 	add	a,#0xFF
   56D2 32 17 73      [13] 2999 	ld	(#_player),a
                           3000 ;src/keyboard.h:41: player.dir = 4;
   56D5 21 1E 73      [10] 3001 	ld	hl,#(_player + 0x0007)
   56D8 36 04         [10] 3002 	ld	(hl),#0x04
                           3003 ;src/keyboard.h:42: s = gladis_quieto_izda;
   56DA DD 36 FE 80   [19] 3004 	ld	-2 (ix),#<(_gladis_quieto_izda)
   56DE DD 36 FF 40   [19] 3005 	ld	-1 (ix),#>(_gladis_quieto_izda)
   56E2 C3 4A 58      [10] 3006 	jp	00148$
   56E5                    3007 00139$:
                           3008 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   56E5 21 00 04      [10] 3009 	ld	hl,#0x0400
   56E8 CD 45 6D      [17] 3010 	call	_cpct_isKeyPressed
   56EB 01 18 73      [10] 3011 	ld	bc,#_player + 1
   56EE 7D            [ 4] 3012 	ld	a,l
   56EF B7            [ 4] 3013 	or	a, a
   56F0 28 1A         [12] 3014 	jr	Z,00135$
   56F2 0A            [ 7] 3015 	ld	a,(bc)
   56F3 67            [ 4] 3016 	ld	h,a
   56F4 D6 B4         [ 7] 3017 	sub	a, #0xB4
   56F6 30 14         [12] 3018 	jr	NC,00135$
                           3019 ;src/keyboard.h:44: player.y += 2;
   56F8 7C            [ 4] 3020 	ld	a,h
   56F9 C6 02         [ 7] 3021 	add	a, #0x02
   56FB 02            [ 7] 3022 	ld	(bc),a
                           3023 ;src/keyboard.h:45: player.dir = 2;
   56FC 21 1E 73      [10] 3024 	ld	hl,#(_player + 0x0007)
   56FF 36 02         [10] 3025 	ld	(hl),#0x02
                           3026 ;src/keyboard.h:46: s = gladis_abajo;
   5701 DD 36 FE 80   [19] 3027 	ld	-2 (ix),#<(_gladis_abajo)
   5705 DD 36 FF 42   [19] 3028 	ld	-1 (ix),#>(_gladis_abajo)
   5709 C3 4A 58      [10] 3029 	jp	00148$
   570C                    3030 00135$:
                           3031 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   570C C5            [11] 3032 	push	bc
   570D 21 00 01      [10] 3033 	ld	hl,#0x0100
   5710 CD 45 6D      [17] 3034 	call	_cpct_isKeyPressed
   5713 7D            [ 4] 3035 	ld	a,l
   5714 C1            [10] 3036 	pop	bc
   5715 B7            [ 4] 3037 	or	a, a
   5716 28 17         [12] 3038 	jr	Z,00131$
   5718 0A            [ 7] 3039 	ld	a,(bc)
   5719 B7            [ 4] 3040 	or	a, a
   571A 28 13         [12] 3041 	jr	Z,00131$
                           3042 ;src/keyboard.h:48: player.y -= 2;
   571C C6 FE         [ 7] 3043 	add	a,#0xFE
   571E 02            [ 7] 3044 	ld	(bc),a
                           3045 ;src/keyboard.h:49: player.dir = 8;
   571F 21 1E 73      [10] 3046 	ld	hl,#(_player + 0x0007)
   5722 36 08         [10] 3047 	ld	(hl),#0x08
                           3048 ;src/keyboard.h:50: s = gladis_arriba;
   5724 DD 36 FE 00   [19] 3049 	ld	-2 (ix),#<(_gladis_arriba)
   5728 DD 36 FF 42   [19] 3050 	ld	-1 (ix),#>(_gladis_arriba)
   572C C3 4A 58      [10] 3051 	jp	00148$
   572F                    3052 00131$:
                           3053 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   572F C5            [11] 3054 	push	bc
   5730 21 07 80      [10] 3055 	ld	hl,#0x8007
   5733 CD 45 6D      [17] 3056 	call	_cpct_isKeyPressed
   5736 7D            [ 4] 3057 	ld	a,l
   5737 C1            [10] 3058 	pop	bc
   5738 B7            [ 4] 3059 	or	a, a
   5739 CA 0A 58      [10] 3060 	jp	Z,00125$
   573C 3A FD 72      [13] 3061 	ld	a,(#_arrow + 0)
   573F B7            [ 4] 3062 	or	a, a
   5740 C2 0A 58      [10] 3063 	jp	NZ,00125$
   5743 3A 1F 73      [13] 3064 	ld	a, (#(_player + 0x0008) + 0)
   5746 D6 14         [ 7] 3065 	sub	a, #0x14
   5748 C2 0A 58      [10] 3066 	jp	NZ,00125$
   574B 3A 21 73      [13] 3067 	ld	a, (#(_player + 0x000a) + 0)
   574E B7            [ 4] 3068 	or	a, a
   574F CA 0A 58      [10] 3069 	jp	Z,00125$
                           3070 ;src/keyboard.h:52: if(player.bullets> 0){
   5752 B7            [ 4] 3071 	or	a, a
   5753 CA 03 58      [10] 3072 	jp	Z,00118$
                           3073 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   5756 DD 36 FB E1   [19] 3074 	ld	-5 (ix),#<(_flecha_dcha)
   575A DD 36 FC 6C   [19] 3075 	ld	-4 (ix),#>(_flecha_dcha)
   575E DD 36 FA 02   [19] 3076 	ld	-6 (ix),#0x02
   5762 1E 08         [ 7] 3077 	ld	e,#0x08
                           3078 ;src/keyboard.h:54: switch(player.dir){
   5764 21 1E 73      [10] 3079 	ld	hl, #(_player + 0x0007) + 0
   5767 56            [ 7] 3080 	ld	d,(hl)
   5768 7A            [ 4] 3081 	ld	a,d
   5769 D6 02         [ 7] 3082 	sub	a, #0x02
   576B 28 31         [12] 3083 	jr	Z,00114$
   576D 7A            [ 4] 3084 	ld	a,d
   576E D6 04         [ 7] 3085 	sub	a, #0x04
   5770 28 1C         [12] 3086 	jr	Z,00113$
   5772 7A            [ 4] 3087 	ld	a,d
   5773 D6 06         [ 7] 3088 	sub	a, #0x06
   5775 28 07         [12] 3089 	jr	Z,00112$
   5777 7A            [ 4] 3090 	ld	a,d
   5778 D6 08         [ 7] 3091 	sub	a, #0x08
   577A 28 32         [12] 3092 	jr	Z,00115$
   577C 18 3E         [12] 3093 	jr	00116$
                           3094 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   577E                    3095 00112$:
   577E DD 36 FB E1   [19] 3096 	ld	-5 (ix),#<(_flecha_dcha)
   5782 DD 36 FC 6C   [19] 3097 	ld	-4 (ix),#>(_flecha_dcha)
   5786 DD 36 FA 04   [19] 3098 	ld	-6 (ix),#0x04
   578A 1E 04         [ 7] 3099 	ld	e,#0x04
   578C 18 2E         [12] 3100 	jr	00116$
                           3101 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   578E                    3102 00113$:
   578E DD 36 FB 01   [19] 3103 	ld	-5 (ix),#<(_flecha_izda)
   5792 DD 36 FC 6D   [19] 3104 	ld	-4 (ix),#>(_flecha_izda)
   5796 DD 36 FA 04   [19] 3105 	ld	-6 (ix),#0x04
   579A 1E 04         [ 7] 3106 	ld	e,#0x04
   579C 18 1E         [12] 3107 	jr	00116$
                           3108 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   579E                    3109 00114$:
   579E DD 36 FB C1   [19] 3110 	ld	-5 (ix),#<(_flecha_abajo)
   57A2 DD 36 FC 6C   [19] 3111 	ld	-4 (ix),#>(_flecha_abajo)
   57A6 DD 36 FA 02   [19] 3112 	ld	-6 (ix),#0x02
   57AA 1E 08         [ 7] 3113 	ld	e,#0x08
   57AC 18 0E         [12] 3114 	jr	00116$
                           3115 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   57AE                    3116 00115$:
   57AE DD 36 FB A1   [19] 3117 	ld	-5 (ix),#<(_flecha_arriba)
   57B2 DD 36 FC 6C   [19] 3118 	ld	-4 (ix),#>(_flecha_arriba)
   57B6 DD 36 FA 02   [19] 3119 	ld	-6 (ix),#0x02
   57BA 1E 08         [ 7] 3120 	ld	e,#0x08
                           3121 ;src/keyboard.h:59: }
   57BC                    3122 00116$:
                           3123 ;src/keyboard.h:60: player.atk = 0;
   57BC 21 1F 73      [10] 3124 	ld	hl,#(_player + 0x0008)
   57BF 36 00         [10] 3125 	ld	(hl),#0x00
                           3126 ;src/keyboard.h:61: parrow.x = player.x;
   57C1 3A 17 73      [13] 3127 	ld	a, (#_player + 0)
   57C4 32 03 73      [13] 3128 	ld	(#_parrow),a
                           3129 ;src/keyboard.h:62: parrow.y = player.y+8;
   57C7 0A            [ 7] 3130 	ld	a,(bc)
   57C8 C6 08         [ 7] 3131 	add	a, #0x08
   57CA 32 04 73      [13] 3132 	ld	(#(_parrow + 0x0001)),a
                           3133 ;src/keyboard.h:63: parrow.x = parrow.x;
   57CD 21 03 73      [10] 3134 	ld	hl, #_parrow + 0
   57D0 56            [ 7] 3135 	ld	d,(hl)
   57D1 21 03 73      [10] 3136 	ld	hl,#_parrow
   57D4 72            [ 7] 3137 	ld	(hl),d
                           3138 ;src/keyboard.h:64: parrow.y = parrow.y;
   57D5 32 04 73      [13] 3139 	ld	(#(_parrow + 0x0001)),a
                           3140 ;src/keyboard.h:65: parrow.sprite = spr;
   57D8 21 07 73      [10] 3141 	ld	hl,#_parrow + 4
   57DB DD 7E FB      [19] 3142 	ld	a,-5 (ix)
   57DE 77            [ 7] 3143 	ld	(hl),a
   57DF 23            [ 6] 3144 	inc	hl
   57E0 DD 7E FC      [19] 3145 	ld	a,-4 (ix)
   57E3 77            [ 7] 3146 	ld	(hl),a
                           3147 ;src/keyboard.h:66: parrow.vivo = 1;
   57E4 21 09 73      [10] 3148 	ld	hl,#_parrow + 6
   57E7 36 01         [10] 3149 	ld	(hl),#0x01
                           3150 ;src/keyboard.h:67: parrow.dir = player.dir;
   57E9 01 0A 73      [10] 3151 	ld	bc,#_parrow + 7
   57EC 3A 1E 73      [13] 3152 	ld	a, (#(_player + 0x0007) + 0)
   57EF 02            [ 7] 3153 	ld	(bc),a
                           3154 ;src/keyboard.h:68: parrow.sizeX = xs;
   57F0 21 0B 73      [10] 3155 	ld	hl,#_parrow + 8
   57F3 DD 7E FA      [19] 3156 	ld	a,-6 (ix)
   57F6 77            [ 7] 3157 	ld	(hl),a
                           3158 ;src/keyboard.h:69: parrow.sizeY = ys;
   57F7 21 0C 73      [10] 3159 	ld	hl,#_parrow + 9
   57FA 73            [ 7] 3160 	ld	(hl),e
                           3161 ;src/keyboard.h:70: player.bullets--;
   57FB 3A 21 73      [13] 3162 	ld	a, (#(_player + 0x000a) + 0)
   57FE C6 FF         [ 7] 3163 	add	a,#0xFF
   5800 32 21 73      [13] 3164 	ld	(#(_player + 0x000a)),a
   5803                    3165 00118$:
                           3166 ;src/keyboard.h:72: arrow=1;
   5803 21 FD 72      [10] 3167 	ld	hl,#_arrow + 0
   5806 36 01         [10] 3168 	ld	(hl), #0x01
   5808 18 40         [12] 3169 	jr	00148$
   580A                    3170 00125$:
                           3171 ;src/keyboard.h:74: switch(player.dir){
   580A 21 1E 73      [10] 3172 	ld	hl, #(_player + 0x0007) + 0
   580D 66            [ 7] 3173 	ld	h,(hl)
   580E 7C            [ 4] 3174 	ld	a,h
   580F D6 02         [ 7] 3175 	sub	a, #0x02
   5811 28 2F         [12] 3176 	jr	Z,00122$
   5813 7C            [ 4] 3177 	ld	a,h
   5814 D6 04         [ 7] 3178 	sub	a, #0x04
   5816 28 0C         [12] 3179 	jr	Z,00119$
   5818 7C            [ 4] 3180 	ld	a,h
   5819 D6 06         [ 7] 3181 	sub	a, #0x06
   581B 28 11         [12] 3182 	jr	Z,00120$
   581D 7C            [ 4] 3183 	ld	a,h
   581E D6 08         [ 7] 3184 	sub	a, #0x08
   5820 28 16         [12] 3185 	jr	Z,00121$
   5822 18 26         [12] 3186 	jr	00148$
                           3187 ;src/keyboard.h:75: case 4:
   5824                    3188 00119$:
                           3189 ;src/keyboard.h:76: s = gladis_quieto_izda;
   5824 DD 36 FE 80   [19] 3190 	ld	-2 (ix),#<(_gladis_quieto_izda)
   5828 DD 36 FF 40   [19] 3191 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           3192 ;src/keyboard.h:77: break;
   582C 18 1C         [12] 3193 	jr	00148$
                           3194 ;src/keyboard.h:78: case 6:
   582E                    3195 00120$:
                           3196 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   582E DD 36 FE 00   [19] 3197 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   5832 DD 36 FF 40   [19] 3198 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           3199 ;src/keyboard.h:80: break;
   5836 18 12         [12] 3200 	jr	00148$
                           3201 ;src/keyboard.h:81: case 8:
   5838                    3202 00121$:
                           3203 ;src/keyboard.h:82: s = gladis_arriba;
   5838 DD 36 FE 00   [19] 3204 	ld	-2 (ix),#<(_gladis_arriba)
   583C DD 36 FF 42   [19] 3205 	ld	-1 (ix),#>(_gladis_arriba)
                           3206 ;src/keyboard.h:83: break;
   5840 18 08         [12] 3207 	jr	00148$
                           3208 ;src/keyboard.h:84: case 2:
   5842                    3209 00122$:
                           3210 ;src/keyboard.h:85: s = gladis_abajo;
   5842 DD 36 FE 80   [19] 3211 	ld	-2 (ix),#<(_gladis_abajo)
   5846 DD 36 FF 42   [19] 3212 	ld	-1 (ix),#>(_gladis_abajo)
                           3213 ;src/keyboard.h:87: }
   584A                    3214 00148$:
                           3215 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   584A 21 04 10      [10] 3216 	ld	hl,#0x1004
   584D CD 45 6D      [17] 3217 	call	_cpct_isKeyPressed
   5850 7D            [ 4] 3218 	ld	a,l
   5851 B7            [ 4] 3219 	or	a, a
   5852 28 05         [12] 3220 	jr	Z,00151$
                           3221 ;src/keyboard.h:94: arrow = 0;
   5854 21 FD 72      [10] 3222 	ld	hl,#_arrow + 0
   5857 36 00         [10] 3223 	ld	(hl), #0x00
   5859                    3224 00151$:
                           3225 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   5859 21 08 04      [10] 3226 	ld	hl,#0x0408
   585C CD 45 6D      [17] 3227 	call	_cpct_isKeyPressed
   585F 7D            [ 4] 3228 	ld	a,l
   5860 B7            [ 4] 3229 	or	a, a
   5861 28 05         [12] 3230 	jr	Z,00153$
                           3231 ;src/keyboard.h:97: finish = 1;
   5863 21 FC 72      [10] 3232 	ld	hl,#_finish + 0
   5866 36 01         [10] 3233 	ld	(hl), #0x01
   5868                    3234 00153$:
                           3235 ;src/keyboard.h:99: return s;
   5868 DD 6E FE      [19] 3236 	ld	l,-2 (ix)
   586B DD 66 FF      [19] 3237 	ld	h,-1 (ix)
   586E DD F9         [10] 3238 	ld	sp, ix
   5870 DD E1         [14] 3239 	pop	ix
   5872 C9            [10] 3240 	ret
                           3241 ;src/main.c:37: void init(){
                           3242 ;	---------------------------------
                           3243 ; Function init
                           3244 ; ---------------------------------
   5873                    3245 _init::
                           3246 ;src/main.c:38: cpct_disableFirmware();
   5873 CD 31 70      [17] 3247 	call	_cpct_disableFirmware
                           3248 ;src/main.c:39: cpct_setVideoMode(0);
   5876 AF            [ 4] 3249 	xor	a, a
   5877 F5            [11] 3250 	push	af
   5878 33            [ 6] 3251 	inc	sp
   5879 CD 0E 70      [17] 3252 	call	_cpct_setVideoMode
   587C 33            [ 6] 3253 	inc	sp
                           3254 ;src/main.c:40: cpct_fw2hw(g_palette,4);
   587D 11 0E 49      [10] 3255 	ld	de,#_g_palette
   5880 3E 04         [ 7] 3256 	ld	a,#0x04
   5882 F5            [11] 3257 	push	af
   5883 33            [ 6] 3258 	inc	sp
   5884 D5            [11] 3259 	push	de
   5885 CD 98 6F      [17] 3260 	call	_cpct_fw2hw
   5888 F1            [10] 3261 	pop	af
   5889 33            [ 6] 3262 	inc	sp
                           3263 ;src/main.c:41: cpct_setPalette(g_palette,4);
   588A 11 0E 49      [10] 3264 	ld	de,#_g_palette
   588D 3E 04         [ 7] 3265 	ld	a,#0x04
   588F F5            [11] 3266 	push	af
   5890 33            [ 6] 3267 	inc	sp
   5891 D5            [11] 3268 	push	de
   5892 CD 21 6D      [17] 3269 	call	_cpct_setPalette
   5895 F1            [10] 3270 	pop	af
   5896 33            [ 6] 3271 	inc	sp
   5897 C9            [10] 3272 	ret
                           3273 ;src/main.c:44: void initPlayer(){
                           3274 ;	---------------------------------
                           3275 ; Function initPlayer
                           3276 ; ---------------------------------
   5898                    3277 _initPlayer::
                           3278 ;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
                           3279 ;src/main.c:46: player.x = origins[0][0];
   5898 01 13 49      [10] 3280 	ld	bc,#_origins+0
   589B 0A            [ 7] 3281 	ld	a,(bc)
   589C 32 17 73      [13] 3282 	ld	(#_player),a
                           3283 ;src/main.c:47: player.y = origins[0][1];
   589F 59            [ 4] 3284 	ld	e, c
   58A0 50            [ 4] 3285 	ld	d, b
   58A1 13            [ 6] 3286 	inc	de
   58A2 1A            [ 7] 3287 	ld	a,(de)
   58A3 32 18 73      [13] 3288 	ld	(#(_player + 0x0001)),a
                           3289 ;src/main.c:48: player.lx = origins[0][0];
   58A6 0A            [ 7] 3290 	ld	a,(bc)
   58A7 32 19 73      [13] 3291 	ld	(#(_player + 0x0002)),a
                           3292 ;src/main.c:49: player.ly = origins[0][1];
   58AA 1A            [ 7] 3293 	ld	a,(de)
   58AB 32 1A 73      [13] 3294 	ld	(#(_player + 0x0003)),a
                           3295 ;src/main.c:50: player.sprite = sprite;
   58AE 21 00 40      [10] 3296 	ld	hl,#_gladis_quieto_dcha
   58B1 22 1B 73      [16] 3297 	ld	((_player + 0x0004)), hl
                           3298 ;src/main.c:51: player.life = 3;
   58B4 21 1D 73      [10] 3299 	ld	hl,#_player + 6
   58B7 36 03         [10] 3300 	ld	(hl),#0x03
                           3301 ;src/main.c:52: player.dir = 6;
   58B9 21 1E 73      [10] 3302 	ld	hl,#_player + 7
   58BC 36 06         [10] 3303 	ld	(hl),#0x06
                           3304 ;src/main.c:53: player.atk = 20;
   58BE 21 1F 73      [10] 3305 	ld	hl,#_player + 8
   58C1 36 14         [10] 3306 	ld	(hl),#0x14
                           3307 ;src/main.c:54: player.latk = 20;
   58C3 21 20 73      [10] 3308 	ld	hl,#_player + 9
   58C6 36 14         [10] 3309 	ld	(hl),#0x14
                           3310 ;src/main.c:55: player.bullets = 3;
   58C8 21 21 73      [10] 3311 	ld	hl,#_player + 10
   58CB 36 03         [10] 3312 	ld	(hl),#0x03
   58CD C9            [10] 3313 	ret
                           3314 ;src/main.c:58: void initEnemies(){
                           3315 ;	---------------------------------
                           3316 ; Function initEnemies
                           3317 ; ---------------------------------
   58CE                    3318 _initEnemies::
                           3319 ;src/main.c:59: u8 *sprite = chacho_dcha;
                           3320 ;src/main.c:60: enemy.x = origins[1][0];
   58CE 01 15 49      [10] 3321 	ld	bc,#_origins + 2
   58D1 0A            [ 7] 3322 	ld	a,(bc)
   58D2 32 22 73      [13] 3323 	ld	(#_enemy),a
                           3324 ;src/main.c:61: enemy.y = origins[1][1];
   58D5 11 16 49      [10] 3325 	ld	de,#_origins + 3
   58D8 1A            [ 7] 3326 	ld	a,(de)
   58D9 32 23 73      [13] 3327 	ld	(#(_enemy + 0x0001)),a
                           3328 ;src/main.c:62: enemy.lx = origins[1][0];
   58DC 0A            [ 7] 3329 	ld	a,(bc)
   58DD 32 24 73      [13] 3330 	ld	(#(_enemy + 0x0002)),a
                           3331 ;src/main.c:63: enemy.ly = origins[1][1];
   58E0 1A            [ 7] 3332 	ld	a,(de)
   58E1 32 25 73      [13] 3333 	ld	(#(_enemy + 0x0003)),a
                           3334 ;src/main.c:64: enemy.ox = origins[1][0];
   58E4 0A            [ 7] 3335 	ld	a,(bc)
   58E5 32 26 73      [13] 3336 	ld	(#(_enemy + 0x0004)),a
                           3337 ;src/main.c:65: enemy.oy = origins[1][1];
   58E8 1A            [ 7] 3338 	ld	a,(de)
   58E9 32 27 73      [13] 3339 	ld	(#(_enemy + 0x0005)),a
                           3340 ;src/main.c:66: enemy.sprite = sprite;
   58EC 21 00 44      [10] 3341 	ld	hl,#_chacho_dcha
   58EF 22 28 73      [16] 3342 	ld	((_enemy + 0x0006)), hl
                           3343 ;src/main.c:67: enemy.life = 3;
   58F2 21 2A 73      [10] 3344 	ld	hl,#_enemy + 8
   58F5 36 03         [10] 3345 	ld	(hl),#0x03
                           3346 ;src/main.c:68: enemy.dir = 6;
   58F7 21 2B 73      [10] 3347 	ld	hl,#_enemy + 9
   58FA 36 06         [10] 3348 	ld	(hl),#0x06
                           3349 ;src/main.c:69: enemy.bullets = 3;
   58FC 21 2C 73      [10] 3350 	ld	hl,#_enemy + 10
   58FF 36 03         [10] 3351 	ld	(hl),#0x03
                           3352 ;src/main.c:70: enemy.room = 3;
   5901 21 2D 73      [10] 3353 	ld	hl,#_enemy + 11
   5904 36 03         [10] 3354 	ld	(hl),#0x03
   5906 C9            [10] 3355 	ret
                           3356 ;src/main.c:75: void gameOver(){
                           3357 ;	---------------------------------
                           3358 ; Function gameOver
                           3359 ; ---------------------------------
   5907                    3360 _gameOver::
                           3361 ;src/main.c:77: cpct_clearScreen(0);
   5907 21 00 40      [10] 3362 	ld	hl,#0x4000
   590A E5            [11] 3363 	push	hl
   590B AF            [ 4] 3364 	xor	a, a
   590C F5            [11] 3365 	push	af
   590D 33            [ 6] 3366 	inc	sp
   590E 26 C0         [ 7] 3367 	ld	h, #0xC0
   5910 E5            [11] 3368 	push	hl
   5911 CD 20 70      [17] 3369 	call	_cpct_memset
                           3370 ;src/main.c:78: memptr = cpct_getScreenPtr(VMEM,10,10);
   5914 21 0A 0A      [10] 3371 	ld	hl,#0x0A0A
   5917 E5            [11] 3372 	push	hl
   5918 21 00 C0      [10] 3373 	ld	hl,#0xC000
   591B E5            [11] 3374 	push	hl
   591C CD 13 71      [17] 3375 	call	_cpct_getScreenPtr
                           3376 ;src/main.c:79: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   591F 4D            [ 4] 3377 	ld	c, l
   5920 44            [ 4] 3378 	ld	b, h
   5921 11 33 59      [10] 3379 	ld	de,#___str_0
   5924 21 01 00      [10] 3380 	ld	hl,#0x0001
   5927 E5            [11] 3381 	push	hl
   5928 C5            [11] 3382 	push	bc
   5929 D5            [11] 3383 	push	de
   592A CD 32 6E      [17] 3384 	call	_cpct_drawStringM0
   592D 21 06 00      [10] 3385 	ld	hl,#6
   5930 39            [11] 3386 	add	hl,sp
   5931 F9            [ 6] 3387 	ld	sp,hl
   5932 C9            [10] 3388 	ret
   5933                    3389 ___str_0:
   5933 4C 6F 75 6E 67 65  3390 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5943 00                 3391 	.db 0x00
                           3392 ;src/main.c:84: int menu(){
                           3393 ;	---------------------------------
                           3394 ; Function menu
                           3395 ; ---------------------------------
   5944                    3396 _menu::
   5944 DD E5         [15] 3397 	push	ix
   5946 DD 21 00 00   [14] 3398 	ld	ix,#0
   594A DD 39         [15] 3399 	add	ix,sp
   594C 21 FA FF      [10] 3400 	ld	hl,#-6
   594F 39            [11] 3401 	add	hl,sp
   5950 F9            [ 6] 3402 	ld	sp,hl
                           3403 ;src/main.c:86: int init = 50;
   5951 DD 36 FC 32   [19] 3404 	ld	-4 (ix),#0x32
   5955 DD 36 FD 00   [19] 3405 	ld	-3 (ix),#0x00
                           3406 ;src/main.c:87: int pushed =0;
   5959 21 00 00      [10] 3407 	ld	hl,#0x0000
   595C E3            [19] 3408 	ex	(sp), hl
                           3409 ;src/main.c:88: int cont =0;
   595D 11 00 00      [10] 3410 	ld	de,#0x0000
                           3411 ;src/main.c:89: cpct_clearScreen(0);
   5960 D5            [11] 3412 	push	de
   5961 21 00 40      [10] 3413 	ld	hl,#0x4000
   5964 E5            [11] 3414 	push	hl
   5965 AF            [ 4] 3415 	xor	a, a
   5966 F5            [11] 3416 	push	af
   5967 33            [ 6] 3417 	inc	sp
   5968 26 C0         [ 7] 3418 	ld	h, #0xC0
   596A E5            [11] 3419 	push	hl
   596B CD 20 70      [17] 3420 	call	_cpct_memset
   596E 21 0A 0A      [10] 3421 	ld	hl,#0x0A0A
   5971 E5            [11] 3422 	push	hl
   5972 21 00 C0      [10] 3423 	ld	hl,#0xC000
   5975 E5            [11] 3424 	push	hl
   5976 CD 13 71      [17] 3425 	call	_cpct_getScreenPtr
   5979 D1            [10] 3426 	pop	de
                           3427 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   597A 4D            [ 4] 3428 	ld	c, l
   597B 44            [ 4] 3429 	ld	b, h
   597C D5            [11] 3430 	push	de
   597D 21 01 00      [10] 3431 	ld	hl,#0x0001
   5980 E5            [11] 3432 	push	hl
   5981 C5            [11] 3433 	push	bc
   5982 21 27 5B      [10] 3434 	ld	hl,#___str_1
   5985 E5            [11] 3435 	push	hl
   5986 CD 32 6E      [17] 3436 	call	_cpct_drawStringM0
   5989 21 06 00      [10] 3437 	ld	hl,#6
   598C 39            [11] 3438 	add	hl,sp
   598D F9            [ 6] 3439 	ld	sp,hl
   598E 21 14 32      [10] 3440 	ld	hl,#0x3214
   5991 E5            [11] 3441 	push	hl
   5992 21 00 C0      [10] 3442 	ld	hl,#0xC000
   5995 E5            [11] 3443 	push	hl
   5996 CD 13 71      [17] 3444 	call	_cpct_getScreenPtr
   5999 D1            [10] 3445 	pop	de
                           3446 ;src/main.c:96: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   599A 4D            [ 4] 3447 	ld	c, l
   599B 44            [ 4] 3448 	ld	b, h
   599C D5            [11] 3449 	push	de
   599D 21 01 00      [10] 3450 	ld	hl,#0x0001
   59A0 E5            [11] 3451 	push	hl
   59A1 C5            [11] 3452 	push	bc
   59A2 21 38 5B      [10] 3453 	ld	hl,#___str_2
   59A5 E5            [11] 3454 	push	hl
   59A6 CD 32 6E      [17] 3455 	call	_cpct_drawStringM0
   59A9 21 06 00      [10] 3456 	ld	hl,#6
   59AC 39            [11] 3457 	add	hl,sp
   59AD F9            [ 6] 3458 	ld	sp,hl
   59AE 21 14 46      [10] 3459 	ld	hl,#0x4614
   59B1 E5            [11] 3460 	push	hl
   59B2 21 00 C0      [10] 3461 	ld	hl,#0xC000
   59B5 E5            [11] 3462 	push	hl
   59B6 CD 13 71      [17] 3463 	call	_cpct_getScreenPtr
   59B9 D1            [10] 3464 	pop	de
                           3465 ;src/main.c:99: cpct_drawStringM0("Creditos",memptr,1,0);
   59BA 4D            [ 4] 3466 	ld	c, l
   59BB 44            [ 4] 3467 	ld	b, h
   59BC D5            [11] 3468 	push	de
   59BD 21 01 00      [10] 3469 	ld	hl,#0x0001
   59C0 E5            [11] 3470 	push	hl
   59C1 C5            [11] 3471 	push	bc
   59C2 21 46 5B      [10] 3472 	ld	hl,#___str_3
   59C5 E5            [11] 3473 	push	hl
   59C6 CD 32 6E      [17] 3474 	call	_cpct_drawStringM0
   59C9 21 06 00      [10] 3475 	ld	hl,#6
   59CC 39            [11] 3476 	add	hl,sp
   59CD F9            [ 6] 3477 	ld	sp,hl
   59CE 21 14 5A      [10] 3478 	ld	hl,#0x5A14
   59D1 E5            [11] 3479 	push	hl
   59D2 21 00 C0      [10] 3480 	ld	hl,#0xC000
   59D5 E5            [11] 3481 	push	hl
   59D6 CD 13 71      [17] 3482 	call	_cpct_getScreenPtr
   59D9 D1            [10] 3483 	pop	de
                           3484 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   59DA DD 75 FE      [19] 3485 	ld	-2 (ix),l
   59DD DD 74 FF      [19] 3486 	ld	-1 (ix),h
                           3487 ;src/main.c:102: cpct_drawStringM0("Salir",memptr,1,0);
   59E0 01 4F 5B      [10] 3488 	ld	bc,#___str_4
   59E3 D5            [11] 3489 	push	de
   59E4 21 01 00      [10] 3490 	ld	hl,#0x0001
   59E7 E5            [11] 3491 	push	hl
   59E8 DD 6E FE      [19] 3492 	ld	l,-2 (ix)
   59EB DD 66 FF      [19] 3493 	ld	h,-1 (ix)
   59EE E5            [11] 3494 	push	hl
   59EF C5            [11] 3495 	push	bc
   59F0 CD 32 6E      [17] 3496 	call	_cpct_drawStringM0
   59F3 21 06 00      [10] 3497 	ld	hl,#6
   59F6 39            [11] 3498 	add	hl,sp
   59F7 F9            [ 6] 3499 	ld	sp,hl
   59F8 D1            [10] 3500 	pop	de
                           3501 ;src/main.c:108: while(1){
   59F9                    3502 00118$:
                           3503 ;src/main.c:110: cpct_scanKeyboard();
   59F9 D5            [11] 3504 	push	de
   59FA CD 33 71      [17] 3505 	call	_cpct_scanKeyboard
   59FD 21 00 04      [10] 3506 	ld	hl,#0x0400
   5A00 CD 45 6D      [17] 3507 	call	_cpct_isKeyPressed
   5A03 7D            [ 4] 3508 	ld	a,l
   5A04 D1            [10] 3509 	pop	de
   5A05 B7            [ 4] 3510 	or	a, a
   5A06 28 2D         [12] 3511 	jr	Z,00102$
   5A08 3E 96         [ 7] 3512 	ld	a,#0x96
   5A0A BB            [ 4] 3513 	cp	a, e
   5A0B 3E 00         [ 7] 3514 	ld	a,#0x00
   5A0D 9A            [ 4] 3515 	sbc	a, d
   5A0E E2 13 5A      [10] 3516 	jp	PO, 00162$
   5A11 EE 80         [ 7] 3517 	xor	a, #0x80
   5A13                    3518 00162$:
   5A13 F2 35 5A      [10] 3519 	jp	P,00102$
                           3520 ;src/main.c:112: cpct_drawSolidBox(memptr, 0, 2, 8);
   5A16 21 02 08      [10] 3521 	ld	hl,#0x0802
   5A19 E5            [11] 3522 	push	hl
   5A1A AF            [ 4] 3523 	xor	a, a
   5A1B F5            [11] 3524 	push	af
   5A1C 33            [ 6] 3525 	inc	sp
   5A1D DD 6E FE      [19] 3526 	ld	l,-2 (ix)
   5A20 DD 66 FF      [19] 3527 	ld	h,-1 (ix)
   5A23 E5            [11] 3528 	push	hl
   5A24 CD 42 70      [17] 3529 	call	_cpct_drawSolidBox
   5A27 F1            [10] 3530 	pop	af
   5A28 F1            [10] 3531 	pop	af
   5A29 33            [ 6] 3532 	inc	sp
                           3533 ;src/main.c:113: pushed ++;
   5A2A DD 34 FA      [23] 3534 	inc	-6 (ix)
   5A2D 20 03         [12] 3535 	jr	NZ,00163$
   5A2F DD 34 FB      [23] 3536 	inc	-5 (ix)
   5A32                    3537 00163$:
                           3538 ;src/main.c:114: cont =0;
   5A32 11 00 00      [10] 3539 	ld	de,#0x0000
   5A35                    3540 00102$:
                           3541 ;src/main.c:116: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   5A35 D5            [11] 3542 	push	de
   5A36 21 00 01      [10] 3543 	ld	hl,#0x0100
   5A39 CD 45 6D      [17] 3544 	call	_cpct_isKeyPressed
   5A3C 7D            [ 4] 3545 	ld	a,l
   5A3D D1            [10] 3546 	pop	de
   5A3E B7            [ 4] 3547 	or	a, a
   5A3F 28 29         [12] 3548 	jr	Z,00105$
   5A41 3E 96         [ 7] 3549 	ld	a,#0x96
   5A43 BB            [ 4] 3550 	cp	a, e
   5A44 3E 00         [ 7] 3551 	ld	a,#0x00
   5A46 9A            [ 4] 3552 	sbc	a, d
   5A47 E2 4C 5A      [10] 3553 	jp	PO, 00164$
   5A4A EE 80         [ 7] 3554 	xor	a, #0x80
   5A4C                    3555 00164$:
   5A4C F2 6A 5A      [10] 3556 	jp	P,00105$
                           3557 ;src/main.c:117: cpct_drawSolidBox(memptr, 0, 2, 8);
   5A4F 21 02 08      [10] 3558 	ld	hl,#0x0802
   5A52 E5            [11] 3559 	push	hl
   5A53 AF            [ 4] 3560 	xor	a, a
   5A54 F5            [11] 3561 	push	af
   5A55 33            [ 6] 3562 	inc	sp
   5A56 DD 6E FE      [19] 3563 	ld	l,-2 (ix)
   5A59 DD 66 FF      [19] 3564 	ld	h,-1 (ix)
   5A5C E5            [11] 3565 	push	hl
   5A5D CD 42 70      [17] 3566 	call	_cpct_drawSolidBox
   5A60 F1            [10] 3567 	pop	af
   5A61 F1            [10] 3568 	pop	af
   5A62 33            [ 6] 3569 	inc	sp
                           3570 ;src/main.c:118: pushed --;
   5A63 E1            [10] 3571 	pop	hl
   5A64 E5            [11] 3572 	push	hl
   5A65 2B            [ 6] 3573 	dec	hl
   5A66 E3            [19] 3574 	ex	(sp), hl
                           3575 ;src/main.c:119: cont = 0;
   5A67 11 00 00      [10] 3576 	ld	de,#0x0000
   5A6A                    3577 00105$:
                           3578 ;src/main.c:122: switch (pushed){
   5A6A DD 7E FB      [19] 3579 	ld	a,-5 (ix)
   5A6D 07            [ 4] 3580 	rlca
   5A6E E6 01         [ 7] 3581 	and	a,#0x01
   5A70 47            [ 4] 3582 	ld	b,a
   5A71 3E 02         [ 7] 3583 	ld	a,#0x02
   5A73 DD BE FA      [19] 3584 	cp	a, -6 (ix)
   5A76 3E 00         [ 7] 3585 	ld	a,#0x00
   5A78 DD 9E FB      [19] 3586 	sbc	a, -5 (ix)
   5A7B E2 80 5A      [10] 3587 	jp	PO, 00165$
   5A7E EE 80         [ 7] 3588 	xor	a, #0x80
   5A80                    3589 00165$:
   5A80 07            [ 4] 3590 	rlca
   5A81 E6 01         [ 7] 3591 	and	a,#0x01
   5A83 4F            [ 4] 3592 	ld	c,a
   5A84 78            [ 4] 3593 	ld	a,b
   5A85 B7            [ 4] 3594 	or	a,a
   5A86 20 32         [12] 3595 	jr	NZ,00110$
   5A88 B1            [ 4] 3596 	or	a,c
   5A89 20 2F         [12] 3597 	jr	NZ,00110$
   5A8B D5            [11] 3598 	push	de
   5A8C DD 5E FA      [19] 3599 	ld	e,-6 (ix)
   5A8F 16 00         [ 7] 3600 	ld	d,#0x00
   5A91 21 98 5A      [10] 3601 	ld	hl,#00166$
   5A94 19            [11] 3602 	add	hl,de
   5A95 19            [11] 3603 	add	hl,de
                           3604 ;src/main.c:123: case 0: init = 50;break;
   5A96 D1            [10] 3605 	pop	de
   5A97 E9            [ 4] 3606 	jp	(hl)
   5A98                    3607 00166$:
   5A98 18 04         [12] 3608 	jr	00107$
   5A9A 18 0C         [12] 3609 	jr	00108$
   5A9C 18 14         [12] 3610 	jr	00109$
   5A9E                    3611 00107$:
   5A9E DD 36 FC 32   [19] 3612 	ld	-4 (ix),#0x32
   5AA2 DD 36 FD 00   [19] 3613 	ld	-3 (ix),#0x00
   5AA6 18 12         [12] 3614 	jr	00110$
                           3615 ;src/main.c:124: case 1: init = 70;break;
   5AA8                    3616 00108$:
   5AA8 DD 36 FC 46   [19] 3617 	ld	-4 (ix),#0x46
   5AAC DD 36 FD 00   [19] 3618 	ld	-3 (ix),#0x00
   5AB0 18 08         [12] 3619 	jr	00110$
                           3620 ;src/main.c:125: case 2: init = 90;break;
   5AB2                    3621 00109$:
   5AB2 DD 36 FC 5A   [19] 3622 	ld	-4 (ix),#0x5A
   5AB6 DD 36 FD 00   [19] 3623 	ld	-3 (ix),#0x00
                           3624 ;src/main.c:126: }
   5ABA                    3625 00110$:
                           3626 ;src/main.c:127: memptr = cpct_getScreenPtr(VMEM,15,init);
   5ABA DD 66 FC      [19] 3627 	ld	h,-4 (ix)
   5ABD C5            [11] 3628 	push	bc
   5ABE D5            [11] 3629 	push	de
   5ABF E5            [11] 3630 	push	hl
   5AC0 33            [ 6] 3631 	inc	sp
   5AC1 3E 0F         [ 7] 3632 	ld	a,#0x0F
   5AC3 F5            [11] 3633 	push	af
   5AC4 33            [ 6] 3634 	inc	sp
   5AC5 21 00 C0      [10] 3635 	ld	hl,#0xC000
   5AC8 E5            [11] 3636 	push	hl
   5AC9 CD 13 71      [17] 3637 	call	_cpct_getScreenPtr
   5ACC D1            [10] 3638 	pop	de
   5ACD C1            [10] 3639 	pop	bc
                           3640 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5ACE DD 75 FE      [19] 3641 	ld	-2 (ix),l
   5AD1 DD 74 FF      [19] 3642 	ld	-1 (ix),h
                           3643 ;src/main.c:128: cpct_drawSolidBox(memptr, 3, 2, 8);
   5AD4 C5            [11] 3644 	push	bc
   5AD5 D5            [11] 3645 	push	de
   5AD6 21 02 08      [10] 3646 	ld	hl,#0x0802
   5AD9 E5            [11] 3647 	push	hl
   5ADA 3E 03         [ 7] 3648 	ld	a,#0x03
   5ADC F5            [11] 3649 	push	af
   5ADD 33            [ 6] 3650 	inc	sp
   5ADE DD 6E FE      [19] 3651 	ld	l,-2 (ix)
   5AE1 DD 66 FF      [19] 3652 	ld	h,-1 (ix)
   5AE4 E5            [11] 3653 	push	hl
   5AE5 CD 42 70      [17] 3654 	call	_cpct_drawSolidBox
   5AE8 F1            [10] 3655 	pop	af
   5AE9 F1            [10] 3656 	pop	af
   5AEA 33            [ 6] 3657 	inc	sp
   5AEB 21 00 40      [10] 3658 	ld	hl,#0x4000
   5AEE CD 45 6D      [17] 3659 	call	_cpct_isKeyPressed
   5AF1 7D            [ 4] 3660 	ld	a,l
   5AF2 D1            [10] 3661 	pop	de
   5AF3 C1            [10] 3662 	pop	bc
   5AF4 B7            [ 4] 3663 	or	a, a
   5AF5 28 27         [12] 3664 	jr	Z,00116$
                           3665 ;src/main.c:130: switch (pushed){
   5AF7 78            [ 4] 3666 	ld	a,b
   5AF8 B7            [ 4] 3667 	or	a,a
   5AF9 20 23         [12] 3668 	jr	NZ,00116$
   5AFB B1            [ 4] 3669 	or	a,c
   5AFC 20 20         [12] 3670 	jr	NZ,00116$
   5AFE DD 5E FA      [19] 3671 	ld	e,-6 (ix)
   5B01 16 00         [ 7] 3672 	ld	d,#0x00
   5B03 21 09 5B      [10] 3673 	ld	hl,#00167$
   5B06 19            [11] 3674 	add	hl,de
   5B07 19            [11] 3675 	add	hl,de
                           3676 ;src/main.c:131: case 0: return 1;break;
   5B08 E9            [ 4] 3677 	jp	(hl)
   5B09                    3678 00167$:
   5B09 18 04         [12] 3679 	jr	00111$
   5B0B 18 07         [12] 3680 	jr	00112$
   5B0D 18 0A         [12] 3681 	jr	00113$
   5B0F                    3682 00111$:
   5B0F 21 01 00      [10] 3683 	ld	hl,#0x0001
   5B12 18 0E         [12] 3684 	jr	00120$
                           3685 ;src/main.c:132: case 1: return 2;break;
   5B14                    3686 00112$:
   5B14 21 02 00      [10] 3687 	ld	hl,#0x0002
   5B17 18 09         [12] 3688 	jr	00120$
                           3689 ;src/main.c:133: case 2: return 0;break;
   5B19                    3690 00113$:
   5B19 21 00 00      [10] 3691 	ld	hl,#0x0000
   5B1C 18 04         [12] 3692 	jr	00120$
                           3693 ;src/main.c:134: }
   5B1E                    3694 00116$:
                           3695 ;src/main.c:136: cont++;
   5B1E 13            [ 6] 3696 	inc	de
   5B1F C3 F9 59      [10] 3697 	jp	00118$
   5B22                    3698 00120$:
   5B22 DD F9         [10] 3699 	ld	sp, ix
   5B24 DD E1         [14] 3700 	pop	ix
   5B26 C9            [10] 3701 	ret
   5B27                    3702 ___str_1:
   5B27 4C 6F 75 6E 67 65  3703 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5B37 00                 3704 	.db 0x00
   5B38                    3705 ___str_2:
   5B38 4E 75 65 76 61 20  3706 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   5B45 00                 3707 	.db 0x00
   5B46                    3708 ___str_3:
   5B46 43 72 65 64 69 74  3709 	.ascii "Creditos"
        6F 73
   5B4E 00                 3710 	.db 0x00
   5B4F                    3711 ___str_4:
   5B4F 53 61 6C 69 72     3712 	.ascii "Salir"
   5B54 00                 3713 	.db 0x00
                           3714 ;src/main.c:150: void moveObject(u8 c){
                           3715 ;	---------------------------------
                           3716 ; Function moveObject
                           3717 ; ---------------------------------
   5B55                    3718 _moveObject::
   5B55 DD E5         [15] 3719 	push	ix
   5B57 DD 21 00 00   [14] 3720 	ld	ix,#0
   5B5B DD 39         [15] 3721 	add	ix,sp
                           3722 ;src/main.c:151: if(c == 0){
   5B5D DD 7E 04      [19] 3723 	ld	a,4 (ix)
   5B60 B7            [ 4] 3724 	or	a, a
   5B61 20 3A         [12] 3725 	jr	NZ,00112$
                           3726 ;src/main.c:152: parrow.lx = parrow.x;
   5B63 11 03 73      [10] 3727 	ld	de,#_parrow+0
   5B66 1A            [ 7] 3728 	ld	a,(de)
   5B67 32 05 73      [13] 3729 	ld	(#(_parrow + 0x0002)),a
                           3730 ;src/main.c:153: parrow.ly = parrow.y;
   5B6A 4B            [ 4] 3731 	ld	c, e
   5B6B 42            [ 4] 3732 	ld	b, d
   5B6C 03            [ 6] 3733 	inc	bc
   5B6D 0A            [ 7] 3734 	ld	a,(bc)
   5B6E 32 06 73      [13] 3735 	ld	(#(_parrow + 0x0003)),a
                           3736 ;src/main.c:154: switch(parrow.dir){
   5B71 3A 0A 73      [13] 3737 	ld	a,(#_parrow + 7)
   5B74 FE 02         [ 7] 3738 	cp	a,#0x02
   5B76 28 19         [12] 3739 	jr	Z,00103$
   5B78 FE 04         [ 7] 3740 	cp	a,#0x04
   5B7A 28 0F         [12] 3741 	jr	Z,00102$
   5B7C FE 06         [ 7] 3742 	cp	a,#0x06
   5B7E 28 06         [12] 3743 	jr	Z,00101$
   5B80 D6 08         [ 7] 3744 	sub	a, #0x08
   5B82 28 13         [12] 3745 	jr	Z,00104$
   5B84 18 4F         [12] 3746 	jr	00114$
                           3747 ;src/main.c:155: case 6: parrow.x += 1; break;
   5B86                    3748 00101$:
   5B86 1A            [ 7] 3749 	ld	a,(de)
   5B87 3C            [ 4] 3750 	inc	a
   5B88 12            [ 7] 3751 	ld	(de),a
   5B89 18 4A         [12] 3752 	jr	00114$
                           3753 ;src/main.c:156: case 4: parrow.x -= 1; break;
   5B8B                    3754 00102$:
   5B8B 1A            [ 7] 3755 	ld	a,(de)
   5B8C C6 FF         [ 7] 3756 	add	a,#0xFF
   5B8E 12            [ 7] 3757 	ld	(de),a
   5B8F 18 44         [12] 3758 	jr	00114$
                           3759 ;src/main.c:157: case 2: parrow.y += 2; break;
   5B91                    3760 00103$:
   5B91 0A            [ 7] 3761 	ld	a,(bc)
   5B92 C6 02         [ 7] 3762 	add	a, #0x02
   5B94 02            [ 7] 3763 	ld	(bc),a
   5B95 18 3E         [12] 3764 	jr	00114$
                           3765 ;src/main.c:158: case 8: parrow.y -= 2; break;
   5B97                    3766 00104$:
   5B97 0A            [ 7] 3767 	ld	a,(bc)
   5B98 C6 FE         [ 7] 3768 	add	a,#0xFE
   5B9A 02            [ 7] 3769 	ld	(bc),a
                           3770 ;src/main.c:159: }
   5B9B 18 38         [12] 3771 	jr	00114$
   5B9D                    3772 00112$:
                           3773 ;src/main.c:162: earrow.lx = earrow.x;
   5B9D 01 0D 73      [10] 3774 	ld	bc,#_earrow+0
   5BA0 0A            [ 7] 3775 	ld	a,(bc)
   5BA1 32 0F 73      [13] 3776 	ld	(#(_earrow + 0x0002)),a
                           3777 ;src/main.c:163: earrow.ly = earrow.y;
   5BA4 59            [ 4] 3778 	ld	e, c
   5BA5 50            [ 4] 3779 	ld	d, b
   5BA6 13            [ 6] 3780 	inc	de
   5BA7 1A            [ 7] 3781 	ld	a,(de)
   5BA8 32 10 73      [13] 3782 	ld	(#(_earrow + 0x0003)),a
                           3783 ;src/main.c:164: switch(earrow.dir){
   5BAB 3A 14 73      [13] 3784 	ld	a,(#_earrow + 7)
   5BAE FE 02         [ 7] 3785 	cp	a,#0x02
   5BB0 28 19         [12] 3786 	jr	Z,00108$
   5BB2 FE 04         [ 7] 3787 	cp	a,#0x04
   5BB4 28 0F         [12] 3788 	jr	Z,00107$
   5BB6 FE 06         [ 7] 3789 	cp	a,#0x06
   5BB8 28 06         [12] 3790 	jr	Z,00106$
   5BBA D6 08         [ 7] 3791 	sub	a, #0x08
   5BBC 28 13         [12] 3792 	jr	Z,00109$
   5BBE 18 15         [12] 3793 	jr	00114$
                           3794 ;src/main.c:165: case 6: earrow.x += 1; break;
   5BC0                    3795 00106$:
   5BC0 0A            [ 7] 3796 	ld	a,(bc)
   5BC1 3C            [ 4] 3797 	inc	a
   5BC2 02            [ 7] 3798 	ld	(bc),a
   5BC3 18 10         [12] 3799 	jr	00114$
                           3800 ;src/main.c:166: case 4: earrow.x -= 1; break;
   5BC5                    3801 00107$:
   5BC5 0A            [ 7] 3802 	ld	a,(bc)
   5BC6 C6 FF         [ 7] 3803 	add	a,#0xFF
   5BC8 02            [ 7] 3804 	ld	(bc),a
   5BC9 18 0A         [12] 3805 	jr	00114$
                           3806 ;src/main.c:167: case 2: earrow.y += 2; break;
   5BCB                    3807 00108$:
   5BCB 1A            [ 7] 3808 	ld	a,(de)
   5BCC C6 02         [ 7] 3809 	add	a, #0x02
   5BCE 12            [ 7] 3810 	ld	(de),a
   5BCF 18 04         [12] 3811 	jr	00114$
                           3812 ;src/main.c:168: case 8: earrow.y -= 2; break;
   5BD1                    3813 00109$:
   5BD1 1A            [ 7] 3814 	ld	a,(de)
   5BD2 C6 FE         [ 7] 3815 	add	a,#0xFE
   5BD4 12            [ 7] 3816 	ld	(de),a
                           3817 ;src/main.c:169: }
   5BD5                    3818 00114$:
   5BD5 DD E1         [14] 3819 	pop	ix
   5BD7 C9            [10] 3820 	ret
                           3821 ;src/main.c:178: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           3822 ;	---------------------------------
                           3823 ; Function checkBoundsCollisionsEnemy
                           3824 ; ---------------------------------
   5BD8                    3825 _checkBoundsCollisionsEnemy::
   5BD8 DD E5         [15] 3826 	push	ix
   5BDA DD 21 00 00   [14] 3827 	ld	ix,#0
   5BDE DD 39         [15] 3828 	add	ix,sp
   5BE0 21 EC FF      [10] 3829 	ld	hl,#-20
   5BE3 39            [11] 3830 	add	hl,sp
   5BE4 F9            [ 6] 3831 	ld	sp,hl
                           3832 ;src/main.c:180: u8 *posX = x;
   5BE5 DD 7E 04      [19] 3833 	ld	a,4 (ix)
   5BE8 DD 77 EE      [19] 3834 	ld	-18 (ix),a
   5BEB DD 7E 05      [19] 3835 	ld	a,5 (ix)
   5BEE DD 77 EF      [19] 3836 	ld	-17 (ix),a
                           3837 ;src/main.c:181: u8 *posY = y;
   5BF1 DD 7E 06      [19] 3838 	ld	a,6 (ix)
   5BF4 DD 77 EC      [19] 3839 	ld	-20 (ix),a
   5BF7 DD 7E 07      [19] 3840 	ld	a,7 (ix)
   5BFA DD 77 ED      [19] 3841 	ld	-19 (ix),a
                           3842 ;src/main.c:182: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   5BFD E1            [10] 3843 	pop	hl
   5BFE E5            [11] 3844 	push	hl
   5BFF 7E            [ 7] 3845 	ld	a,(hl)
   5C00 DD 77 FB      [19] 3846 	ld	-5 (ix), a
   5C03 07            [ 4] 3847 	rlca
   5C04 07            [ 4] 3848 	rlca
   5C05 07            [ 4] 3849 	rlca
   5C06 07            [ 4] 3850 	rlca
   5C07 E6 0F         [ 7] 3851 	and	a,#0x0F
   5C09 4F            [ 4] 3852 	ld	c,a
   5C0A 06 00         [ 7] 3853 	ld	b,#0x00
   5C0C 69            [ 4] 3854 	ld	l, c
   5C0D 60            [ 4] 3855 	ld	h, b
   5C0E 29            [11] 3856 	add	hl, hl
   5C0F 29            [11] 3857 	add	hl, hl
   5C10 09            [11] 3858 	add	hl, bc
   5C11 29            [11] 3859 	add	hl, hl
   5C12 29            [11] 3860 	add	hl, hl
   5C13 3E 09         [ 7] 3861 	ld	a,#<(_scene)
   5C15 85            [ 4] 3862 	add	a, l
   5C16 DD 77 F9      [19] 3863 	ld	-7 (ix),a
   5C19 3E 72         [ 7] 3864 	ld	a,#>(_scene)
   5C1B 8C            [ 4] 3865 	adc	a, h
   5C1C DD 77 FA      [19] 3866 	ld	-6 (ix),a
   5C1F DD 6E EE      [19] 3867 	ld	l,-18 (ix)
   5C22 DD 66 EF      [19] 3868 	ld	h,-17 (ix)
   5C25 7E            [ 7] 3869 	ld	a,(hl)
   5C26 DD 77 FE      [19] 3870 	ld	-2 (ix), a
   5C29 0F            [ 4] 3871 	rrca
   5C2A 0F            [ 4] 3872 	rrca
   5C2B E6 3F         [ 7] 3873 	and	a,#0x3F
   5C2D DD 77 FF      [19] 3874 	ld	-1 (ix), a
   5C30 DD 86 F9      [19] 3875 	add	a, -7 (ix)
   5C33 6F            [ 4] 3876 	ld	l,a
   5C34 3E 00         [ 7] 3877 	ld	a,#0x00
   5C36 DD 8E FA      [19] 3878 	adc	a, -6 (ix)
   5C39 67            [ 4] 3879 	ld	h,a
   5C3A 7E            [ 7] 3880 	ld	a,(hl)
   5C3B DD 77 F8      [19] 3881 	ld	-8 (ix), a
   5C3E 3D            [ 4] 3882 	dec	a
   5C3F CA 4D 5D      [10] 3883 	jp	Z,00106$
                           3884 ;src/main.c:183: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5C42 DD 6E FE      [19] 3885 	ld	l,-2 (ix)
   5C45 26 00         [ 7] 3886 	ld	h,#0x00
   5C47 DD 5E 0A      [19] 3887 	ld	e,10 (ix)
   5C4A 16 00         [ 7] 3888 	ld	d,#0x00
   5C4C 19            [11] 3889 	add	hl,de
   5C4D 7D            [ 4] 3890 	ld	a,l
   5C4E C6 FF         [ 7] 3891 	add	a,#0xFF
   5C50 DD 77 F0      [19] 3892 	ld	-16 (ix),a
   5C53 7C            [ 4] 3893 	ld	a,h
   5C54 CE FF         [ 7] 3894 	adc	a,#0xFF
   5C56 DD 77 F1      [19] 3895 	ld	-15 (ix),a
   5C59 DD 7E F0      [19] 3896 	ld	a,-16 (ix)
   5C5C DD 77 F6      [19] 3897 	ld	-10 (ix),a
   5C5F DD 7E F1      [19] 3898 	ld	a,-15 (ix)
   5C62 DD 77 F7      [19] 3899 	ld	-9 (ix),a
   5C65 DD 7E F1      [19] 3900 	ld	a,-15 (ix)
   5C68 07            [ 4] 3901 	rlca
   5C69 E6 01         [ 7] 3902 	and	a,#0x01
   5C6B DD 77 FE      [19] 3903 	ld	-2 (ix),a
   5C6E 23            [ 6] 3904 	inc	hl
   5C6F 23            [ 6] 3905 	inc	hl
   5C70 DD 75 F2      [19] 3906 	ld	-14 (ix),l
   5C73 DD 74 F3      [19] 3907 	ld	-13 (ix),h
   5C76 DD 7E FE      [19] 3908 	ld	a,-2 (ix)
   5C79 B7            [ 4] 3909 	or	a, a
   5C7A 28 0C         [12] 3910 	jr	Z,00114$
   5C7C DD 7E F2      [19] 3911 	ld	a,-14 (ix)
   5C7F DD 77 F6      [19] 3912 	ld	-10 (ix),a
   5C82 DD 7E F3      [19] 3913 	ld	a,-13 (ix)
   5C85 DD 77 F7      [19] 3914 	ld	-9 (ix),a
   5C88                    3915 00114$:
   5C88 DD 6E F6      [19] 3916 	ld	l,-10 (ix)
   5C8B DD 66 F7      [19] 3917 	ld	h,-9 (ix)
   5C8E CB 2C         [ 8] 3918 	sra	h
   5C90 CB 1D         [ 8] 3919 	rr	l
   5C92 CB 2C         [ 8] 3920 	sra	h
   5C94 CB 1D         [ 8] 3921 	rr	l
   5C96 DD 5E F9      [19] 3922 	ld	e,-7 (ix)
   5C99 DD 56 FA      [19] 3923 	ld	d,-6 (ix)
   5C9C 19            [11] 3924 	add	hl,de
   5C9D 7E            [ 7] 3925 	ld	a,(hl)
   5C9E 3D            [ 4] 3926 	dec	a
   5C9F CA 4D 5D      [10] 3927 	jp	Z,00106$
                           3928 ;src/main.c:184: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   5CA2 DD 6E FB      [19] 3929 	ld	l,-5 (ix)
   5CA5 26 00         [ 7] 3930 	ld	h,#0x00
   5CA7 DD 5E 0B      [19] 3931 	ld	e,11 (ix)
   5CAA 16 00         [ 7] 3932 	ld	d,#0x00
   5CAC 19            [11] 3933 	add	hl,de
   5CAD 4D            [ 4] 3934 	ld	c,l
   5CAE 44            [ 4] 3935 	ld	b,h
   5CAF 0B            [ 6] 3936 	dec	bc
   5CB0 0B            [ 6] 3937 	dec	bc
   5CB1 59            [ 4] 3938 	ld	e, c
   5CB2 78            [ 4] 3939 	ld	a,b
   5CB3 57            [ 4] 3940 	ld	d,a
   5CB4 07            [ 4] 3941 	rlca
   5CB5 E6 01         [ 7] 3942 	and	a,#0x01
   5CB7 DD 77 F6      [19] 3943 	ld	-10 (ix),a
   5CBA 7D            [ 4] 3944 	ld	a,l
   5CBB C6 0D         [ 7] 3945 	add	a, #0x0D
   5CBD DD 77 FC      [19] 3946 	ld	-4 (ix),a
   5CC0 7C            [ 4] 3947 	ld	a,h
   5CC1 CE 00         [ 7] 3948 	adc	a, #0x00
   5CC3 DD 77 FD      [19] 3949 	ld	-3 (ix),a
   5CC6 DD 7E F6      [19] 3950 	ld	a,-10 (ix)
   5CC9 B7            [ 4] 3951 	or	a, a
   5CCA 28 06         [12] 3952 	jr	Z,00115$
   5CCC DD 5E FC      [19] 3953 	ld	e,-4 (ix)
   5CCF DD 56 FD      [19] 3954 	ld	d,-3 (ix)
   5CD2                    3955 00115$:
   5CD2 CB 2A         [ 8] 3956 	sra	d
   5CD4 CB 1B         [ 8] 3957 	rr	e
   5CD6 CB 2A         [ 8] 3958 	sra	d
   5CD8 CB 1B         [ 8] 3959 	rr	e
   5CDA CB 2A         [ 8] 3960 	sra	d
   5CDC CB 1B         [ 8] 3961 	rr	e
   5CDE CB 2A         [ 8] 3962 	sra	d
   5CE0 CB 1B         [ 8] 3963 	rr	e
   5CE2 6B            [ 4] 3964 	ld	l, e
   5CE3 62            [ 4] 3965 	ld	h, d
   5CE4 29            [11] 3966 	add	hl, hl
   5CE5 29            [11] 3967 	add	hl, hl
   5CE6 19            [11] 3968 	add	hl, de
   5CE7 29            [11] 3969 	add	hl, hl
   5CE8 29            [11] 3970 	add	hl, hl
   5CE9 11 09 72      [10] 3971 	ld	de,#_scene
   5CEC 19            [11] 3972 	add	hl,de
   5CED DD 5E FF      [19] 3973 	ld	e,-1 (ix)
   5CF0 16 00         [ 7] 3974 	ld	d,#0x00
   5CF2 19            [11] 3975 	add	hl,de
   5CF3 7E            [ 7] 3976 	ld	a,(hl)
   5CF4 3D            [ 4] 3977 	dec	a
   5CF5 28 56         [12] 3978 	jr	Z,00106$
                           3979 ;src/main.c:185: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5CF7 69            [ 4] 3980 	ld	l, c
   5CF8 60            [ 4] 3981 	ld	h, b
   5CF9 DD 7E F6      [19] 3982 	ld	a,-10 (ix)
   5CFC B7            [ 4] 3983 	or	a, a
   5CFD 28 06         [12] 3984 	jr	Z,00116$
   5CFF DD 6E FC      [19] 3985 	ld	l,-4 (ix)
   5D02 DD 66 FD      [19] 3986 	ld	h,-3 (ix)
   5D05                    3987 00116$:
   5D05 CB 2C         [ 8] 3988 	sra	h
   5D07 CB 1D         [ 8] 3989 	rr	l
   5D09 CB 2C         [ 8] 3990 	sra	h
   5D0B CB 1D         [ 8] 3991 	rr	l
   5D0D CB 2C         [ 8] 3992 	sra	h
   5D0F CB 1D         [ 8] 3993 	rr	l
   5D11 CB 2C         [ 8] 3994 	sra	h
   5D13 CB 1D         [ 8] 3995 	rr	l
   5D15 5D            [ 4] 3996 	ld	e, l
   5D16 54            [ 4] 3997 	ld	d, h
   5D17 29            [11] 3998 	add	hl, hl
   5D18 29            [11] 3999 	add	hl, hl
   5D19 19            [11] 4000 	add	hl, de
   5D1A 29            [11] 4001 	add	hl, hl
   5D1B 29            [11] 4002 	add	hl, hl
   5D1C 3E 09         [ 7] 4003 	ld	a,#<(_scene)
   5D1E 85            [ 4] 4004 	add	a, l
   5D1F DD 77 F4      [19] 4005 	ld	-12 (ix),a
   5D22 3E 72         [ 7] 4006 	ld	a,#>(_scene)
   5D24 8C            [ 4] 4007 	adc	a, h
   5D25 DD 77 F5      [19] 4008 	ld	-11 (ix),a
   5D28 DD 6E F0      [19] 4009 	ld	l,-16 (ix)
   5D2B DD 66 F1      [19] 4010 	ld	h,-15 (ix)
   5D2E DD 7E FE      [19] 4011 	ld	a,-2 (ix)
   5D31 B7            [ 4] 4012 	or	a, a
   5D32 28 06         [12] 4013 	jr	Z,00117$
   5D34 DD 6E F2      [19] 4014 	ld	l,-14 (ix)
   5D37 DD 66 F3      [19] 4015 	ld	h,-13 (ix)
   5D3A                    4016 00117$:
   5D3A CB 2C         [ 8] 4017 	sra	h
   5D3C CB 1D         [ 8] 4018 	rr	l
   5D3E CB 2C         [ 8] 4019 	sra	h
   5D40 CB 1D         [ 8] 4020 	rr	l
   5D42 DD 5E F4      [19] 4021 	ld	e,-12 (ix)
   5D45 DD 56 F5      [19] 4022 	ld	d,-11 (ix)
   5D48 19            [11] 4023 	add	hl,de
   5D49 7E            [ 7] 4024 	ld	a,(hl)
   5D4A 3D            [ 4] 4025 	dec	a
   5D4B 20 13         [12] 4026 	jr	NZ,00107$
   5D4D                    4027 00106$:
                           4028 ;src/main.c:187: *posX=lx;
   5D4D DD 6E EE      [19] 4029 	ld	l,-18 (ix)
   5D50 DD 66 EF      [19] 4030 	ld	h,-17 (ix)
   5D53 DD 7E 08      [19] 4031 	ld	a,8 (ix)
   5D56 77            [ 7] 4032 	ld	(hl),a
                           4033 ;src/main.c:188: *posY=ly;
   5D57 E1            [10] 4034 	pop	hl
   5D58 E5            [11] 4035 	push	hl
   5D59 DD 7E 09      [19] 4036 	ld	a,9 (ix)
   5D5C 77            [ 7] 4037 	ld	(hl),a
   5D5D C3 28 5E      [10] 4038 	jp	00112$
   5D60                    4039 00107$:
                           4040 ;src/main.c:190: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   5D60 DD 7E F8      [19] 4041 	ld	a,-8 (ix)
   5D63 D6 03         [ 7] 4042 	sub	a, #0x03
   5D65 C2 18 5E      [10] 4043 	jp	NZ,00101$
                           4044 ;src/main.c:191: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5D68 DD 6E F0      [19] 4045 	ld	l,-16 (ix)
   5D6B DD 66 F1      [19] 4046 	ld	h,-15 (ix)
   5D6E DD 7E FE      [19] 4047 	ld	a,-2 (ix)
   5D71 B7            [ 4] 4048 	or	a, a
   5D72 28 06         [12] 4049 	jr	Z,00118$
   5D74 DD 6E F2      [19] 4050 	ld	l,-14 (ix)
   5D77 DD 66 F3      [19] 4051 	ld	h,-13 (ix)
   5D7A                    4052 00118$:
   5D7A CB 2C         [ 8] 4053 	sra	h
   5D7C CB 1D         [ 8] 4054 	rr	l
   5D7E CB 2C         [ 8] 4055 	sra	h
   5D80 CB 1D         [ 8] 4056 	rr	l
   5D82 DD 5E F9      [19] 4057 	ld	e,-7 (ix)
   5D85 DD 56 FA      [19] 4058 	ld	d,-6 (ix)
   5D88 19            [11] 4059 	add	hl,de
   5D89 7E            [ 7] 4060 	ld	a,(hl)
   5D8A D6 03         [ 7] 4061 	sub	a, #0x03
   5D8C C2 18 5E      [10] 4062 	jp	NZ,00101$
                           4063 ;src/main.c:192: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   5D8F 69            [ 4] 4064 	ld	l, c
   5D90 60            [ 4] 4065 	ld	h, b
   5D91 DD 7E F6      [19] 4066 	ld	a,-10 (ix)
   5D94 B7            [ 4] 4067 	or	a, a
   5D95 28 06         [12] 4068 	jr	Z,00119$
   5D97 DD 6E FC      [19] 4069 	ld	l,-4 (ix)
   5D9A DD 66 FD      [19] 4070 	ld	h,-3 (ix)
   5D9D                    4071 00119$:
   5D9D CB 2C         [ 8] 4072 	sra	h
   5D9F CB 1D         [ 8] 4073 	rr	l
   5DA1 CB 2C         [ 8] 4074 	sra	h
   5DA3 CB 1D         [ 8] 4075 	rr	l
   5DA5 CB 2C         [ 8] 4076 	sra	h
   5DA7 CB 1D         [ 8] 4077 	rr	l
   5DA9 CB 2C         [ 8] 4078 	sra	h
   5DAB CB 1D         [ 8] 4079 	rr	l
   5DAD 5D            [ 4] 4080 	ld	e, l
   5DAE 54            [ 4] 4081 	ld	d, h
   5DAF 29            [11] 4082 	add	hl, hl
   5DB0 29            [11] 4083 	add	hl, hl
   5DB1 19            [11] 4084 	add	hl, de
   5DB2 29            [11] 4085 	add	hl, hl
   5DB3 29            [11] 4086 	add	hl, hl
   5DB4 11 09 72      [10] 4087 	ld	de,#_scene
   5DB7 19            [11] 4088 	add	hl,de
   5DB8 DD 5E FF      [19] 4089 	ld	e,-1 (ix)
   5DBB 16 00         [ 7] 4090 	ld	d,#0x00
   5DBD 19            [11] 4091 	add	hl,de
   5DBE 7E            [ 7] 4092 	ld	a,(hl)
   5DBF D6 03         [ 7] 4093 	sub	a, #0x03
   5DC1 20 55         [12] 4094 	jr	NZ,00101$
                           4095 ;src/main.c:193: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5DC3 DD 7E F6      [19] 4096 	ld	a,-10 (ix)
   5DC6 B7            [ 4] 4097 	or	a, a
   5DC7 28 06         [12] 4098 	jr	Z,00120$
   5DC9 DD 4E FC      [19] 4099 	ld	c,-4 (ix)
   5DCC DD 46 FD      [19] 4100 	ld	b,-3 (ix)
   5DCF                    4101 00120$:
   5DCF CB 28         [ 8] 4102 	sra	b
   5DD1 CB 19         [ 8] 4103 	rr	c
   5DD3 CB 28         [ 8] 4104 	sra	b
   5DD5 CB 19         [ 8] 4105 	rr	c
   5DD7 CB 28         [ 8] 4106 	sra	b
   5DD9 CB 19         [ 8] 4107 	rr	c
   5DDB CB 28         [ 8] 4108 	sra	b
   5DDD CB 19         [ 8] 4109 	rr	c
   5DDF 69            [ 4] 4110 	ld	l, c
   5DE0 60            [ 4] 4111 	ld	h, b
   5DE1 29            [11] 4112 	add	hl, hl
   5DE2 29            [11] 4113 	add	hl, hl
   5DE3 09            [11] 4114 	add	hl, bc
   5DE4 29            [11] 4115 	add	hl, hl
   5DE5 29            [11] 4116 	add	hl, hl
   5DE6 3E 09         [ 7] 4117 	ld	a,#<(_scene)
   5DE8 85            [ 4] 4118 	add	a, l
   5DE9 DD 77 F4      [19] 4119 	ld	-12 (ix),a
   5DEC 3E 72         [ 7] 4120 	ld	a,#>(_scene)
   5DEE 8C            [ 4] 4121 	adc	a, h
   5DEF DD 77 F5      [19] 4122 	ld	-11 (ix),a
   5DF2 DD 6E F0      [19] 4123 	ld	l,-16 (ix)
   5DF5 DD 66 F1      [19] 4124 	ld	h,-15 (ix)
   5DF8 DD 7E FE      [19] 4125 	ld	a,-2 (ix)
   5DFB B7            [ 4] 4126 	or	a, a
   5DFC 28 06         [12] 4127 	jr	Z,00121$
   5DFE DD 6E F2      [19] 4128 	ld	l,-14 (ix)
   5E01 DD 66 F3      [19] 4129 	ld	h,-13 (ix)
   5E04                    4130 00121$:
   5E04 CB 2C         [ 8] 4131 	sra	h
   5E06 CB 1D         [ 8] 4132 	rr	l
   5E08 CB 2C         [ 8] 4133 	sra	h
   5E0A CB 1D         [ 8] 4134 	rr	l
   5E0C DD 5E F4      [19] 4135 	ld	e,-12 (ix)
   5E0F DD 56 F5      [19] 4136 	ld	d,-11 (ix)
   5E12 19            [11] 4137 	add	hl,de
   5E13 7E            [ 7] 4138 	ld	a,(hl)
   5E14 D6 03         [ 7] 4139 	sub	a, #0x03
   5E16 28 10         [12] 4140 	jr	Z,00112$
   5E18                    4141 00101$:
                           4142 ;src/main.c:195: *posX=lx;
   5E18 DD 6E EE      [19] 4143 	ld	l,-18 (ix)
   5E1B DD 66 EF      [19] 4144 	ld	h,-17 (ix)
   5E1E DD 7E 08      [19] 4145 	ld	a,8 (ix)
   5E21 77            [ 7] 4146 	ld	(hl),a
                           4147 ;src/main.c:196: *posY=ly;
   5E22 E1            [10] 4148 	pop	hl
   5E23 E5            [11] 4149 	push	hl
   5E24 DD 7E 09      [19] 4150 	ld	a,9 (ix)
   5E27 77            [ 7] 4151 	ld	(hl),a
   5E28                    4152 00112$:
   5E28 DD F9         [10] 4153 	ld	sp, ix
   5E2A DD E1         [14] 4154 	pop	ix
   5E2C C9            [10] 4155 	ret
                           4156 ;src/main.c:202: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           4157 ;	---------------------------------
                           4158 ; Function checkBoundsCollisions
                           4159 ; ---------------------------------
   5E2D                    4160 _checkBoundsCollisions::
   5E2D DD E5         [15] 4161 	push	ix
   5E2F DD 21 00 00   [14] 4162 	ld	ix,#0
   5E33 DD 39         [15] 4163 	add	ix,sp
   5E35 21 F2 FF      [10] 4164 	ld	hl,#-14
   5E38 39            [11] 4165 	add	hl,sp
   5E39 F9            [ 6] 4166 	ld	sp,hl
                           4167 ;src/main.c:203: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   5E3A 3A 18 73      [13] 4168 	ld	a,(#(_player + 0x0001) + 0)
   5E3D DD 77 F8      [19] 4169 	ld	-8 (ix), a
   5E40 07            [ 4] 4170 	rlca
   5E41 07            [ 4] 4171 	rlca
   5E42 07            [ 4] 4172 	rlca
   5E43 07            [ 4] 4173 	rlca
   5E44 E6 0F         [ 7] 4174 	and	a,#0x0F
   5E46 4F            [ 4] 4175 	ld	c,a
   5E47 06 00         [ 7] 4176 	ld	b,#0x00
   5E49 69            [ 4] 4177 	ld	l, c
   5E4A 60            [ 4] 4178 	ld	h, b
   5E4B 29            [11] 4179 	add	hl, hl
   5E4C 29            [11] 4180 	add	hl, hl
   5E4D 09            [11] 4181 	add	hl, bc
   5E4E 29            [11] 4182 	add	hl, hl
   5E4F 29            [11] 4183 	add	hl, hl
   5E50 3E 09         [ 7] 4184 	ld	a,#<(_scene)
   5E52 85            [ 4] 4185 	add	a, l
   5E53 DD 77 F4      [19] 4186 	ld	-12 (ix),a
   5E56 3E 72         [ 7] 4187 	ld	a,#>(_scene)
   5E58 8C            [ 4] 4188 	adc	a, h
   5E59 DD 77 F5      [19] 4189 	ld	-11 (ix),a
   5E5C 21 17 73      [10] 4190 	ld	hl, #_player + 0
   5E5F 4E            [ 7] 4191 	ld	c,(hl)
   5E60 79            [ 4] 4192 	ld	a,c
   5E61 0F            [ 4] 4193 	rrca
   5E62 0F            [ 4] 4194 	rrca
   5E63 E6 3F         [ 7] 4195 	and	a,#0x3F
   5E65 DD 77 F7      [19] 4196 	ld	-9 (ix), a
   5E68 DD 86 F4      [19] 4197 	add	a, -12 (ix)
   5E6B 6F            [ 4] 4198 	ld	l,a
   5E6C 3E 00         [ 7] 4199 	ld	a,#0x00
   5E6E DD 8E F5      [19] 4200 	adc	a, -11 (ix)
   5E71 67            [ 4] 4201 	ld	h,a
   5E72 7E            [ 7] 4202 	ld	a,(hl)
   5E73 DD 77 F6      [19] 4203 	ld	-10 (ix), a
   5E76 3D            [ 4] 4204 	dec	a
   5E77 CA 8D 5F      [10] 4205 	jp	Z,00124$
                           4206 ;src/main.c:204: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5E7A 06 00         [ 7] 4207 	ld	b,#0x00
   5E7C 21 03 00      [10] 4208 	ld	hl,#0x0003
   5E7F 09            [11] 4209 	add	hl,bc
   5E80 DD 75 FB      [19] 4210 	ld	-5 (ix),l
   5E83 DD 74 FC      [19] 4211 	ld	-4 (ix),h
   5E86 DD 7E FB      [19] 4212 	ld	a,-5 (ix)
   5E89 DD 77 FE      [19] 4213 	ld	-2 (ix),a
   5E8C DD 7E FC      [19] 4214 	ld	a,-4 (ix)
   5E8F DD 77 FF      [19] 4215 	ld	-1 (ix),a
   5E92 DD 7E FC      [19] 4216 	ld	a,-4 (ix)
   5E95 07            [ 4] 4217 	rlca
   5E96 E6 01         [ 7] 4218 	and	a,#0x01
   5E98 DD 77 FD      [19] 4219 	ld	-3 (ix),a
   5E9B 21 06 00      [10] 4220 	ld	hl,#0x0006
   5E9E 09            [11] 4221 	add	hl,bc
   5E9F E3            [19] 4222 	ex	(sp), hl
   5EA0 DD 7E FD      [19] 4223 	ld	a,-3 (ix)
   5EA3 B7            [ 4] 4224 	or	a, a
   5EA4 28 0C         [12] 4225 	jr	Z,00132$
   5EA6 DD 7E F2      [19] 4226 	ld	a,-14 (ix)
   5EA9 DD 77 FE      [19] 4227 	ld	-2 (ix),a
   5EAC DD 7E F3      [19] 4228 	ld	a,-13 (ix)
   5EAF DD 77 FF      [19] 4229 	ld	-1 (ix),a
   5EB2                    4230 00132$:
   5EB2 DD 6E FE      [19] 4231 	ld	l,-2 (ix)
   5EB5 DD 66 FF      [19] 4232 	ld	h,-1 (ix)
   5EB8 CB 2C         [ 8] 4233 	sra	h
   5EBA CB 1D         [ 8] 4234 	rr	l
   5EBC CB 2C         [ 8] 4235 	sra	h
   5EBE CB 1D         [ 8] 4236 	rr	l
   5EC0 DD 5E F4      [19] 4237 	ld	e,-12 (ix)
   5EC3 DD 56 F5      [19] 4238 	ld	d,-11 (ix)
   5EC6 19            [11] 4239 	add	hl,de
   5EC7 7E            [ 7] 4240 	ld	a,(hl)
   5EC8 3D            [ 4] 4241 	dec	a
   5EC9 CA 8D 5F      [10] 4242 	jp	Z,00124$
                           4243 ;src/main.c:205: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   5ECC DD 5E F8      [19] 4244 	ld	e,-8 (ix)
   5ECF 16 00         [ 7] 4245 	ld	d,#0x00
   5ED1 21 0E 00      [10] 4246 	ld	hl,#0x000E
   5ED4 19            [11] 4247 	add	hl,de
   5ED5 4D            [ 4] 4248 	ld	c,l
   5ED6 44            [ 4] 4249 	ld	b,h
   5ED7 DD 71 FE      [19] 4250 	ld	-2 (ix),c
   5EDA DD 70 FF      [19] 4251 	ld	-1 (ix),b
   5EDD 78            [ 4] 4252 	ld	a,b
   5EDE 07            [ 4] 4253 	rlca
   5EDF E6 01         [ 7] 4254 	and	a,#0x01
   5EE1 DD 77 F8      [19] 4255 	ld	-8 (ix),a
   5EE4 21 1D 00      [10] 4256 	ld	hl,#0x001D
   5EE7 19            [11] 4257 	add	hl,de
   5EE8 DD 75 F9      [19] 4258 	ld	-7 (ix),l
   5EEB DD 74 FA      [19] 4259 	ld	-6 (ix),h
   5EEE DD 7E F8      [19] 4260 	ld	a,-8 (ix)
   5EF1 B7            [ 4] 4261 	or	a, a
   5EF2 28 0C         [12] 4262 	jr	Z,00133$
   5EF4 DD 7E F9      [19] 4263 	ld	a,-7 (ix)
   5EF7 DD 77 FE      [19] 4264 	ld	-2 (ix),a
   5EFA DD 7E FA      [19] 4265 	ld	a,-6 (ix)
   5EFD DD 77 FF      [19] 4266 	ld	-1 (ix),a
   5F00                    4267 00133$:
   5F00 DD 6E FE      [19] 4268 	ld	l,-2 (ix)
   5F03 DD 66 FF      [19] 4269 	ld	h,-1 (ix)
   5F06 CB 2C         [ 8] 4270 	sra	h
   5F08 CB 1D         [ 8] 4271 	rr	l
   5F0A CB 2C         [ 8] 4272 	sra	h
   5F0C CB 1D         [ 8] 4273 	rr	l
   5F0E CB 2C         [ 8] 4274 	sra	h
   5F10 CB 1D         [ 8] 4275 	rr	l
   5F12 CB 2C         [ 8] 4276 	sra	h
   5F14 CB 1D         [ 8] 4277 	rr	l
   5F16 5D            [ 4] 4278 	ld	e, l
   5F17 54            [ 4] 4279 	ld	d, h
   5F18 29            [11] 4280 	add	hl, hl
   5F19 29            [11] 4281 	add	hl, hl
   5F1A 19            [11] 4282 	add	hl, de
   5F1B 29            [11] 4283 	add	hl, hl
   5F1C 29            [11] 4284 	add	hl, hl
   5F1D 11 09 72      [10] 4285 	ld	de,#_scene
   5F20 19            [11] 4286 	add	hl,de
   5F21 DD 5E F7      [19] 4287 	ld	e,-9 (ix)
   5F24 16 00         [ 7] 4288 	ld	d,#0x00
   5F26 19            [11] 4289 	add	hl,de
   5F27 7E            [ 7] 4290 	ld	a,(hl)
   5F28 3D            [ 4] 4291 	dec	a
   5F29 28 62         [12] 4292 	jr	Z,00124$
                           4293 ;src/main.c:206: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5F2B DD 71 FE      [19] 4294 	ld	-2 (ix),c
   5F2E DD 70 FF      [19] 4295 	ld	-1 (ix),b
   5F31 DD 7E F8      [19] 4296 	ld	a,-8 (ix)
   5F34 B7            [ 4] 4297 	or	a, a
   5F35 28 0C         [12] 4298 	jr	Z,00134$
   5F37 DD 7E F9      [19] 4299 	ld	a,-7 (ix)
   5F3A DD 77 FE      [19] 4300 	ld	-2 (ix),a
   5F3D DD 7E FA      [19] 4301 	ld	a,-6 (ix)
   5F40 DD 77 FF      [19] 4302 	ld	-1 (ix),a
   5F43                    4303 00134$:
   5F43 DD 6E FE      [19] 4304 	ld	l,-2 (ix)
   5F46 DD 66 FF      [19] 4305 	ld	h,-1 (ix)
   5F49 CB 2C         [ 8] 4306 	sra	h
   5F4B CB 1D         [ 8] 4307 	rr	l
   5F4D CB 2C         [ 8] 4308 	sra	h
   5F4F CB 1D         [ 8] 4309 	rr	l
   5F51 CB 2C         [ 8] 4310 	sra	h
   5F53 CB 1D         [ 8] 4311 	rr	l
   5F55 CB 2C         [ 8] 4312 	sra	h
   5F57 CB 1D         [ 8] 4313 	rr	l
   5F59 5D            [ 4] 4314 	ld	e, l
   5F5A 54            [ 4] 4315 	ld	d, h
   5F5B 29            [11] 4316 	add	hl, hl
   5F5C 29            [11] 4317 	add	hl, hl
   5F5D 19            [11] 4318 	add	hl, de
   5F5E 29            [11] 4319 	add	hl, hl
   5F5F 29            [11] 4320 	add	hl, hl
   5F60 3E 09         [ 7] 4321 	ld	a,#<(_scene)
   5F62 85            [ 4] 4322 	add	a, l
   5F63 DD 77 FE      [19] 4323 	ld	-2 (ix),a
   5F66 3E 72         [ 7] 4324 	ld	a,#>(_scene)
   5F68 8C            [ 4] 4325 	adc	a, h
   5F69 DD 77 FF      [19] 4326 	ld	-1 (ix),a
   5F6C DD 6E FB      [19] 4327 	ld	l,-5 (ix)
   5F6F DD 66 FC      [19] 4328 	ld	h,-4 (ix)
   5F72 DD 7E FD      [19] 4329 	ld	a,-3 (ix)
   5F75 B7            [ 4] 4330 	or	a, a
   5F76 28 02         [12] 4331 	jr	Z,00135$
   5F78 E1            [10] 4332 	pop	hl
   5F79 E5            [11] 4333 	push	hl
   5F7A                    4334 00135$:
   5F7A CB 2C         [ 8] 4335 	sra	h
   5F7C CB 1D         [ 8] 4336 	rr	l
   5F7E CB 2C         [ 8] 4337 	sra	h
   5F80 CB 1D         [ 8] 4338 	rr	l
   5F82 DD 5E FE      [19] 4339 	ld	e,-2 (ix)
   5F85 DD 56 FF      [19] 4340 	ld	d,-1 (ix)
   5F88 19            [11] 4341 	add	hl,de
   5F89 7E            [ 7] 4342 	ld	a,(hl)
   5F8A 3D            [ 4] 4343 	dec	a
   5F8B 20 10         [12] 4344 	jr	NZ,00125$
   5F8D                    4345 00124$:
                           4346 ;src/main.c:208: player.x=player.lx;
   5F8D 3A 19 73      [13] 4347 	ld	a, (#_player + 2)
   5F90 21 17 73      [10] 4348 	ld	hl,#_player
   5F93 77            [ 7] 4349 	ld	(hl),a
                           4350 ;src/main.c:209: player.y=player.ly;
   5F94 3A 1A 73      [13] 4351 	ld	a, (#_player + 3)
   5F97 32 18 73      [13] 4352 	ld	(#(_player + 0x0001)),a
   5F9A C3 F9 61      [10] 4353 	jp	00130$
   5F9D                    4354 00125$:
                           4355 ;src/main.c:211: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5F9D DD 7E F6      [19] 4356 	ld	a,-10 (ix)
   5FA0 D6 02         [ 7] 4357 	sub	a, #0x02
   5FA2 CA 45 60      [10] 4358 	jp	Z,00118$
                           4359 ;src/main.c:212: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5FA5 DD 6E FB      [19] 4360 	ld	l,-5 (ix)
   5FA8 DD 66 FC      [19] 4361 	ld	h,-4 (ix)
   5FAB DD 7E FD      [19] 4362 	ld	a,-3 (ix)
   5FAE B7            [ 4] 4363 	or	a, a
   5FAF 28 02         [12] 4364 	jr	Z,00136$
   5FB1 E1            [10] 4365 	pop	hl
   5FB2 E5            [11] 4366 	push	hl
   5FB3                    4367 00136$:
   5FB3 CB 2C         [ 8] 4368 	sra	h
   5FB5 CB 1D         [ 8] 4369 	rr	l
   5FB7 CB 2C         [ 8] 4370 	sra	h
   5FB9 CB 1D         [ 8] 4371 	rr	l
   5FBB DD 5E F4      [19] 4372 	ld	e,-12 (ix)
   5FBE DD 56 F5      [19] 4373 	ld	d,-11 (ix)
   5FC1 19            [11] 4374 	add	hl,de
   5FC2 7E            [ 7] 4375 	ld	a,(hl)
   5FC3 D6 02         [ 7] 4376 	sub	a, #0x02
   5FC5 CA 45 60      [10] 4377 	jp	Z,00118$
                           4378 ;src/main.c:213: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5FC8 69            [ 4] 4379 	ld	l, c
   5FC9 60            [ 4] 4380 	ld	h, b
   5FCA DD 7E F8      [19] 4381 	ld	a,-8 (ix)
   5FCD B7            [ 4] 4382 	or	a, a
   5FCE 28 06         [12] 4383 	jr	Z,00137$
   5FD0 DD 6E F9      [19] 4384 	ld	l,-7 (ix)
   5FD3 DD 66 FA      [19] 4385 	ld	h,-6 (ix)
   5FD6                    4386 00137$:
   5FD6 CB 2C         [ 8] 4387 	sra	h
   5FD8 CB 1D         [ 8] 4388 	rr	l
   5FDA CB 2C         [ 8] 4389 	sra	h
   5FDC CB 1D         [ 8] 4390 	rr	l
   5FDE CB 2C         [ 8] 4391 	sra	h
   5FE0 CB 1D         [ 8] 4392 	rr	l
   5FE2 CB 2C         [ 8] 4393 	sra	h
   5FE4 CB 1D         [ 8] 4394 	rr	l
   5FE6 5D            [ 4] 4395 	ld	e, l
   5FE7 54            [ 4] 4396 	ld	d, h
   5FE8 29            [11] 4397 	add	hl, hl
   5FE9 29            [11] 4398 	add	hl, hl
   5FEA 19            [11] 4399 	add	hl, de
   5FEB 29            [11] 4400 	add	hl, hl
   5FEC 29            [11] 4401 	add	hl, hl
   5FED 11 09 72      [10] 4402 	ld	de,#_scene
   5FF0 19            [11] 4403 	add	hl,de
   5FF1 DD 5E F7      [19] 4404 	ld	e,-9 (ix)
   5FF4 16 00         [ 7] 4405 	ld	d,#0x00
   5FF6 19            [11] 4406 	add	hl,de
   5FF7 7E            [ 7] 4407 	ld	a,(hl)
   5FF8 D6 02         [ 7] 4408 	sub	a, #0x02
   5FFA 28 49         [12] 4409 	jr	Z,00118$
                           4410 ;src/main.c:214: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5FFC 69            [ 4] 4411 	ld	l, c
   5FFD 60            [ 4] 4412 	ld	h, b
   5FFE DD 7E F8      [19] 4413 	ld	a,-8 (ix)
   6001 B7            [ 4] 4414 	or	a, a
   6002 28 06         [12] 4415 	jr	Z,00138$
   6004 DD 6E F9      [19] 4416 	ld	l,-7 (ix)
   6007 DD 66 FA      [19] 4417 	ld	h,-6 (ix)
   600A                    4418 00138$:
   600A CB 2C         [ 8] 4419 	sra	h
   600C CB 1D         [ 8] 4420 	rr	l
   600E CB 2C         [ 8] 4421 	sra	h
   6010 CB 1D         [ 8] 4422 	rr	l
   6012 CB 2C         [ 8] 4423 	sra	h
   6014 CB 1D         [ 8] 4424 	rr	l
   6016 CB 2C         [ 8] 4425 	sra	h
   6018 CB 1D         [ 8] 4426 	rr	l
   601A 5D            [ 4] 4427 	ld	e, l
   601B 54            [ 4] 4428 	ld	d, h
   601C 29            [11] 4429 	add	hl, hl
   601D 29            [11] 4430 	add	hl, hl
   601E 19            [11] 4431 	add	hl, de
   601F 29            [11] 4432 	add	hl, hl
   6020 29            [11] 4433 	add	hl, hl
   6021 3E 09         [ 7] 4434 	ld	a,#<(_scene)
   6023 85            [ 4] 4435 	add	a, l
   6024 5F            [ 4] 4436 	ld	e,a
   6025 3E 72         [ 7] 4437 	ld	a,#>(_scene)
   6027 8C            [ 4] 4438 	adc	a, h
   6028 57            [ 4] 4439 	ld	d,a
   6029 DD 6E FB      [19] 4440 	ld	l,-5 (ix)
   602C DD 66 FC      [19] 4441 	ld	h,-4 (ix)
   602F DD 7E FD      [19] 4442 	ld	a,-3 (ix)
   6032 B7            [ 4] 4443 	or	a, a
   6033 28 02         [12] 4444 	jr	Z,00139$
   6035 E1            [10] 4445 	pop	hl
   6036 E5            [11] 4446 	push	hl
   6037                    4447 00139$:
   6037 CB 2C         [ 8] 4448 	sra	h
   6039 CB 1D         [ 8] 4449 	rr	l
   603B CB 2C         [ 8] 4450 	sra	h
   603D CB 1D         [ 8] 4451 	rr	l
   603F 19            [11] 4452 	add	hl,de
   6040 7E            [ 7] 4453 	ld	a,(hl)
   6041 D6 02         [ 7] 4454 	sub	a, #0x02
   6043 20 21         [12] 4455 	jr	NZ,00119$
   6045                    4456 00118$:
                           4457 ;src/main.c:216: if(player.life < 3 && *corazon == 0){
   6045 FD 21 1D 73   [14] 4458 	ld	iy,#_player + 6
   6049 FD 5E 00      [19] 4459 	ld	e, 0 (iy)
   604C 7B            [ 4] 4460 	ld	a,e
   604D D6 03         [ 7] 4461 	sub	a, #0x03
   604F D2 F9 61      [10] 4462 	jp	NC,00130$
   6052 DD 6E 04      [19] 4463 	ld	l,4 (ix)
   6055 DD 66 05      [19] 4464 	ld	h,5 (ix)
   6058 7E            [ 7] 4465 	ld	a,(hl)
   6059 B7            [ 4] 4466 	or	a, a
   605A C2 F9 61      [10] 4467 	jp	NZ,00130$
                           4468 ;src/main.c:217: player.life += 1;
   605D 1C            [ 4] 4469 	inc	e
   605E FD 73 00      [19] 4470 	ld	0 (iy), e
                           4471 ;src/main.c:218: *corazon = 1;
   6061 36 01         [10] 4472 	ld	(hl),#0x01
   6063 C3 F9 61      [10] 4473 	jp	00130$
   6066                    4474 00119$:
                           4475 ;src/main.c:221: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   6066 DD 7E F6      [19] 4476 	ld	a,-10 (ix)
   6069 D6 05         [ 7] 4477 	sub	a, #0x05
   606B CA 0E 61      [10] 4478 	jp	Z,00112$
                           4479 ;src/main.c:222: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   606E DD 6E FB      [19] 4480 	ld	l,-5 (ix)
   6071 DD 66 FC      [19] 4481 	ld	h,-4 (ix)
   6074 DD 7E FD      [19] 4482 	ld	a,-3 (ix)
   6077 B7            [ 4] 4483 	or	a, a
   6078 28 02         [12] 4484 	jr	Z,00140$
   607A E1            [10] 4485 	pop	hl
   607B E5            [11] 4486 	push	hl
   607C                    4487 00140$:
   607C CB 2C         [ 8] 4488 	sra	h
   607E CB 1D         [ 8] 4489 	rr	l
   6080 CB 2C         [ 8] 4490 	sra	h
   6082 CB 1D         [ 8] 4491 	rr	l
   6084 DD 5E F4      [19] 4492 	ld	e,-12 (ix)
   6087 DD 56 F5      [19] 4493 	ld	d,-11 (ix)
   608A 19            [11] 4494 	add	hl,de
   608B 7E            [ 7] 4495 	ld	a,(hl)
   608C D6 05         [ 7] 4496 	sub	a, #0x05
   608E CA 0E 61      [10] 4497 	jp	Z,00112$
                           4498 ;src/main.c:223: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   6091 69            [ 4] 4499 	ld	l, c
   6092 60            [ 4] 4500 	ld	h, b
   6093 DD 7E F8      [19] 4501 	ld	a,-8 (ix)
   6096 B7            [ 4] 4502 	or	a, a
   6097 28 06         [12] 4503 	jr	Z,00141$
   6099 DD 6E F9      [19] 4504 	ld	l,-7 (ix)
   609C DD 66 FA      [19] 4505 	ld	h,-6 (ix)
   609F                    4506 00141$:
   609F CB 2C         [ 8] 4507 	sra	h
   60A1 CB 1D         [ 8] 4508 	rr	l
   60A3 CB 2C         [ 8] 4509 	sra	h
   60A5 CB 1D         [ 8] 4510 	rr	l
   60A7 CB 2C         [ 8] 4511 	sra	h
   60A9 CB 1D         [ 8] 4512 	rr	l
   60AB CB 2C         [ 8] 4513 	sra	h
   60AD CB 1D         [ 8] 4514 	rr	l
   60AF 5D            [ 4] 4515 	ld	e, l
   60B0 54            [ 4] 4516 	ld	d, h
   60B1 29            [11] 4517 	add	hl, hl
   60B2 29            [11] 4518 	add	hl, hl
   60B3 19            [11] 4519 	add	hl, de
   60B4 29            [11] 4520 	add	hl, hl
   60B5 29            [11] 4521 	add	hl, hl
   60B6 11 09 72      [10] 4522 	ld	de,#_scene
   60B9 19            [11] 4523 	add	hl,de
   60BA DD 5E F7      [19] 4524 	ld	e,-9 (ix)
   60BD 16 00         [ 7] 4525 	ld	d,#0x00
   60BF 19            [11] 4526 	add	hl,de
   60C0 7E            [ 7] 4527 	ld	a,(hl)
   60C1 D6 05         [ 7] 4528 	sub	a, #0x05
   60C3 28 49         [12] 4529 	jr	Z,00112$
                           4530 ;src/main.c:224: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   60C5 69            [ 4] 4531 	ld	l, c
   60C6 60            [ 4] 4532 	ld	h, b
   60C7 DD 7E F8      [19] 4533 	ld	a,-8 (ix)
   60CA B7            [ 4] 4534 	or	a, a
   60CB 28 06         [12] 4535 	jr	Z,00142$
   60CD DD 6E F9      [19] 4536 	ld	l,-7 (ix)
   60D0 DD 66 FA      [19] 4537 	ld	h,-6 (ix)
   60D3                    4538 00142$:
   60D3 CB 2C         [ 8] 4539 	sra	h
   60D5 CB 1D         [ 8] 4540 	rr	l
   60D7 CB 2C         [ 8] 4541 	sra	h
   60D9 CB 1D         [ 8] 4542 	rr	l
   60DB CB 2C         [ 8] 4543 	sra	h
   60DD CB 1D         [ 8] 4544 	rr	l
   60DF CB 2C         [ 8] 4545 	sra	h
   60E1 CB 1D         [ 8] 4546 	rr	l
   60E3 5D            [ 4] 4547 	ld	e, l
   60E4 54            [ 4] 4548 	ld	d, h
   60E5 29            [11] 4549 	add	hl, hl
   60E6 29            [11] 4550 	add	hl, hl
   60E7 19            [11] 4551 	add	hl, de
   60E8 29            [11] 4552 	add	hl, hl
   60E9 29            [11] 4553 	add	hl, hl
   60EA 3E 09         [ 7] 4554 	ld	a,#<(_scene)
   60EC 85            [ 4] 4555 	add	a, l
   60ED 5F            [ 4] 4556 	ld	e,a
   60EE 3E 72         [ 7] 4557 	ld	a,#>(_scene)
   60F0 8C            [ 4] 4558 	adc	a, h
   60F1 57            [ 4] 4559 	ld	d,a
   60F2 DD 6E FB      [19] 4560 	ld	l,-5 (ix)
   60F5 DD 66 FC      [19] 4561 	ld	h,-4 (ix)
   60F8 DD 7E FD      [19] 4562 	ld	a,-3 (ix)
   60FB B7            [ 4] 4563 	or	a, a
   60FC 28 02         [12] 4564 	jr	Z,00143$
   60FE E1            [10] 4565 	pop	hl
   60FF E5            [11] 4566 	push	hl
   6100                    4567 00143$:
   6100 CB 2C         [ 8] 4568 	sra	h
   6102 CB 1D         [ 8] 4569 	rr	l
   6104 CB 2C         [ 8] 4570 	sra	h
   6106 CB 1D         [ 8] 4571 	rr	l
   6108 19            [11] 4572 	add	hl,de
   6109 7E            [ 7] 4573 	ld	a,(hl)
   610A D6 05         [ 7] 4574 	sub	a, #0x05
   610C 20 21         [12] 4575 	jr	NZ,00113$
   610E                    4576 00112$:
                           4577 ;src/main.c:226: if(player.bullets < 3 && *flecha == 0){
   610E FD 21 21 73   [14] 4578 	ld	iy,#_player + 10
   6112 FD 5E 00      [19] 4579 	ld	e, 0 (iy)
   6115 7B            [ 4] 4580 	ld	a,e
   6116 D6 03         [ 7] 4581 	sub	a, #0x03
   6118 D2 F9 61      [10] 4582 	jp	NC,00130$
   611B DD 6E 06      [19] 4583 	ld	l,6 (ix)
   611E DD 66 07      [19] 4584 	ld	h,7 (ix)
   6121 7E            [ 7] 4585 	ld	a,(hl)
   6122 B7            [ 4] 4586 	or	a, a
   6123 C2 F9 61      [10] 4587 	jp	NZ,00130$
                           4588 ;src/main.c:227: player.bullets += 1;
   6126 1C            [ 4] 4589 	inc	e
   6127 FD 73 00      [19] 4590 	ld	0 (iy), e
                           4591 ;src/main.c:228: *flecha = 1;
   612A 36 01         [10] 4592 	ld	(hl),#0x01
   612C C3 F9 61      [10] 4593 	jp	00130$
   612F                    4594 00113$:
                           4595 ;src/main.c:230: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   612F DD 7E F6      [19] 4596 	ld	a,-10 (ix)
   6132 D6 09         [ 7] 4597 	sub	a, #0x09
   6134 CA DF 61      [10] 4598 	jp	Z,00107$
                           4599 ;src/main.c:231: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   6137 DD 6E FB      [19] 4600 	ld	l,-5 (ix)
   613A DD 66 FC      [19] 4601 	ld	h,-4 (ix)
   613D DD 7E FD      [19] 4602 	ld	a,-3 (ix)
   6140 B7            [ 4] 4603 	or	a, a
   6141 28 02         [12] 4604 	jr	Z,00144$
   6143 E1            [10] 4605 	pop	hl
   6144 E5            [11] 4606 	push	hl
   6145                    4607 00144$:
   6145 CB 2C         [ 8] 4608 	sra	h
   6147 CB 1D         [ 8] 4609 	rr	l
   6149 CB 2C         [ 8] 4610 	sra	h
   614B CB 1D         [ 8] 4611 	rr	l
   614D DD 5E F4      [19] 4612 	ld	e,-12 (ix)
   6150 DD 56 F5      [19] 4613 	ld	d,-11 (ix)
   6153 19            [11] 4614 	add	hl,de
   6154 7E            [ 7] 4615 	ld	a,(hl)
   6155 D6 09         [ 7] 4616 	sub	a, #0x09
   6157 CA DF 61      [10] 4617 	jp	Z,00107$
                           4618 ;src/main.c:232: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   615A 69            [ 4] 4619 	ld	l, c
   615B 60            [ 4] 4620 	ld	h, b
   615C DD 7E F8      [19] 4621 	ld	a,-8 (ix)
   615F B7            [ 4] 4622 	or	a, a
   6160 28 06         [12] 4623 	jr	Z,00145$
   6162 DD 6E F9      [19] 4624 	ld	l,-7 (ix)
   6165 DD 66 FA      [19] 4625 	ld	h,-6 (ix)
   6168                    4626 00145$:
   6168 CB 2C         [ 8] 4627 	sra	h
   616A CB 1D         [ 8] 4628 	rr	l
   616C CB 2C         [ 8] 4629 	sra	h
   616E CB 1D         [ 8] 4630 	rr	l
   6170 CB 2C         [ 8] 4631 	sra	h
   6172 CB 1D         [ 8] 4632 	rr	l
   6174 CB 2C         [ 8] 4633 	sra	h
   6176 CB 1D         [ 8] 4634 	rr	l
   6178 5D            [ 4] 4635 	ld	e, l
   6179 54            [ 4] 4636 	ld	d, h
   617A 29            [11] 4637 	add	hl, hl
   617B 29            [11] 4638 	add	hl, hl
   617C 19            [11] 4639 	add	hl, de
   617D 29            [11] 4640 	add	hl, hl
   617E 29            [11] 4641 	add	hl, hl
   617F 11 09 72      [10] 4642 	ld	de,#_scene
   6182 19            [11] 4643 	add	hl,de
   6183 DD 5E F7      [19] 4644 	ld	e,-9 (ix)
   6186 16 00         [ 7] 4645 	ld	d,#0x00
   6188 19            [11] 4646 	add	hl,de
   6189 7E            [ 7] 4647 	ld	a,(hl)
   618A D6 09         [ 7] 4648 	sub	a, #0x09
   618C 28 51         [12] 4649 	jr	Z,00107$
                           4650 ;src/main.c:233: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   618E DD 7E F8      [19] 4651 	ld	a,-8 (ix)
   6191 B7            [ 4] 4652 	or	a, a
   6192 28 06         [12] 4653 	jr	Z,00146$
   6194 DD 4E F9      [19] 4654 	ld	c,-7 (ix)
   6197 DD 46 FA      [19] 4655 	ld	b,-6 (ix)
   619A                    4656 00146$:
   619A CB 28         [ 8] 4657 	sra	b
   619C CB 19         [ 8] 4658 	rr	c
   619E CB 28         [ 8] 4659 	sra	b
   61A0 CB 19         [ 8] 4660 	rr	c
   61A2 CB 28         [ 8] 4661 	sra	b
   61A4 CB 19         [ 8] 4662 	rr	c
   61A6 CB 28         [ 8] 4663 	sra	b
   61A8 CB 19         [ 8] 4664 	rr	c
   61AA 69            [ 4] 4665 	ld	l, c
   61AB 60            [ 4] 4666 	ld	h, b
   61AC 29            [11] 4667 	add	hl, hl
   61AD 29            [11] 4668 	add	hl, hl
   61AE 09            [11] 4669 	add	hl, bc
   61AF 29            [11] 4670 	add	hl, hl
   61B0 29            [11] 4671 	add	hl, hl
   61B1 3E 09         [ 7] 4672 	ld	a,#<(_scene)
   61B3 85            [ 4] 4673 	add	a, l
   61B4 DD 77 F9      [19] 4674 	ld	-7 (ix),a
   61B7 3E 72         [ 7] 4675 	ld	a,#>(_scene)
   61B9 8C            [ 4] 4676 	adc	a, h
   61BA DD 77 FA      [19] 4677 	ld	-6 (ix),a
   61BD DD 6E FB      [19] 4678 	ld	l,-5 (ix)
   61C0 DD 66 FC      [19] 4679 	ld	h,-4 (ix)
   61C3 DD 7E FD      [19] 4680 	ld	a,-3 (ix)
   61C6 B7            [ 4] 4681 	or	a, a
   61C7 28 02         [12] 4682 	jr	Z,00147$
   61C9 E1            [10] 4683 	pop	hl
   61CA E5            [11] 4684 	push	hl
   61CB                    4685 00147$:
   61CB CB 2C         [ 8] 4686 	sra	h
   61CD CB 1D         [ 8] 4687 	rr	l
   61CF CB 2C         [ 8] 4688 	sra	h
   61D1 CB 1D         [ 8] 4689 	rr	l
   61D3 DD 5E F9      [19] 4690 	ld	e,-7 (ix)
   61D6 DD 56 FA      [19] 4691 	ld	d,-6 (ix)
   61D9 19            [11] 4692 	add	hl,de
   61DA 7E            [ 7] 4693 	ld	a,(hl)
   61DB D6 09         [ 7] 4694 	sub	a, #0x09
   61DD 20 1A         [12] 4695 	jr	NZ,00130$
   61DF                    4696 00107$:
                           4697 ;src/main.c:236: cpct_clearScreen(0);
   61DF 21 00 40      [10] 4698 	ld	hl,#0x4000
   61E2 E5            [11] 4699 	push	hl
   61E3 AF            [ 4] 4700 	xor	a, a
   61E4 F5            [11] 4701 	push	af
   61E5 33            [ 6] 4702 	inc	sp
   61E6 26 C0         [ 7] 4703 	ld	h, #0xC0
   61E8 E5            [11] 4704 	push	hl
   61E9 CD 20 70      [17] 4705 	call	_cpct_memset
                           4706 ;src/main.c:237: map+=1;
   61EC 21 FA 72      [10] 4707 	ld	hl, #_map+0
   61EF 34            [11] 4708 	inc	(hl)
                           4709 ;src/main.c:238: drawMap(map);
   61F0 3A FA 72      [13] 4710 	ld	a,(_map)
   61F3 F5            [11] 4711 	push	af
   61F4 33            [ 6] 4712 	inc	sp
   61F5 CD C0 46      [17] 4713 	call	_drawMap
   61F8 33            [ 6] 4714 	inc	sp
   61F9                    4715 00130$:
   61F9 DD F9         [10] 4716 	ld	sp, ix
   61FB DD E1         [14] 4717 	pop	ix
   61FD C9            [10] 4718 	ret
                           4719 ;src/main.c:247: void followPlayer(){
                           4720 ;	---------------------------------
                           4721 ; Function followPlayer
                           4722 ; ---------------------------------
   61FE                    4723 _followPlayer::
   61FE DD E5         [15] 4724 	push	ix
   6200 DD 21 00 00   [14] 4725 	ld	ix,#0
   6204 DD 39         [15] 4726 	add	ix,sp
   6206 21 E1 FF      [10] 4727 	ld	hl,#-31
   6209 39            [11] 4728 	add	hl,sp
   620A F9            [ 6] 4729 	ld	sp,hl
                           4730 ;src/main.c:250: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   620B 21 18 73      [10] 4731 	ld	hl, #(_player + 0x0001) + 0
   620E 56            [ 7] 4732 	ld	d,(hl)
   620F 3A 17 73      [13] 4733 	ld	a, (#_player + 0)
   6212 D5            [11] 4734 	push	de
   6213 33            [ 6] 4735 	inc	sp
   6214 F5            [11] 4736 	push	af
   6215 33            [ 6] 4737 	inc	sp
   6216 CD 1C 50      [17] 4738 	call	_detectPlayerRoom
   6219 F1            [10] 4739 	pop	af
   621A DD 75 E3      [19] 4740 	ld	-29 (ix),l
   621D 21 2D 73      [10] 4741 	ld	hl, #_enemy + 11
   6220 DD 7E E3      [19] 4742 	ld	a,-29 (ix)
   6223 96            [ 7] 4743 	sub	a,(hl)
   6224 28 0E         [12] 4744 	jr	Z,00102$
                           4745 ;src/main.c:251: auxX = enemy.seenX;
   6226 3A 2E 73      [13] 4746 	ld	a,(#_enemy + 12)
   6229 DD 77 E2      [19] 4747 	ld	-30 (ix),a
                           4748 ;src/main.c:252: auxY = enemy.seenY;
   622C 3A 2F 73      [13] 4749 	ld	a,(#_enemy + 13)
   622F DD 77 E1      [19] 4750 	ld	-31 (ix),a
   6232 18 0C         [12] 4751 	jr	00103$
   6234                    4752 00102$:
                           4753 ;src/main.c:254: auxX = player.x;
   6234 3A 17 73      [13] 4754 	ld	a,(#_player + 0)
   6237 DD 77 E2      [19] 4755 	ld	-30 (ix),a
                           4756 ;src/main.c:255: auxY = player.y;
   623A 3A 18 73      [13] 4757 	ld	a,(#(_player + 0x0001) + 0)
   623D DD 77 E1      [19] 4758 	ld	-31 (ix),a
   6240                    4759 00103$:
                           4760 ;src/main.c:259: if(auxX < enemy.x){
   6240 3A 22 73      [13] 4761 	ld	a,(#_enemy + 0)
                           4762 ;src/main.c:261: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   6243 DD 77 E3      [19] 4763 	ld	-29 (ix), a
   6246 DD 77 E4      [19] 4764 	ld	-28 (ix),a
   6249 DD 36 E5 00   [19] 4765 	ld	-27 (ix),#0x00
   624D DD 7E E4      [19] 4766 	ld	a,-28 (ix)
   6250 C6 02         [ 7] 4767 	add	a, #0x02
   6252 DD 77 E8      [19] 4768 	ld	-24 (ix),a
   6255 DD 7E E5      [19] 4769 	ld	a,-27 (ix)
   6258 CE 00         [ 7] 4770 	adc	a, #0x00
   625A DD 77 E9      [19] 4771 	ld	-23 (ix),a
                           4772 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   625D DD 7E E3      [19] 4773 	ld	a,-29 (ix)
   6260 0F            [ 4] 4774 	rrca
   6261 0F            [ 4] 4775 	rrca
   6262 E6 3F         [ 7] 4776 	and	a,#0x3F
   6264 DD 77 FD      [19] 4777 	ld	-3 (ix),a
                           4778 ;src/main.c:261: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   6267 3A 23 73      [13] 4779 	ld	a,(#(_enemy + 0x0001) + 0)
   626A DD 77 F4      [19] 4780 	ld	-12 (ix),a
   626D DD 7E E4      [19] 4781 	ld	a,-28 (ix)
   6270 C6 FF         [ 7] 4782 	add	a,#0xFF
   6272 DD 77 EA      [19] 4783 	ld	-22 (ix),a
   6275 DD 7E E5      [19] 4784 	ld	a,-27 (ix)
   6278 CE FF         [ 7] 4785 	adc	a,#0xFF
   627A DD 77 EB      [19] 4786 	ld	-21 (ix),a
   627D DD 7E F4      [19] 4787 	ld	a,-12 (ix)
   6280 07            [ 4] 4788 	rlca
   6281 07            [ 4] 4789 	rlca
   6282 07            [ 4] 4790 	rlca
   6283 07            [ 4] 4791 	rlca
   6284 E6 0F         [ 7] 4792 	and	a,#0x0F
   6286 DD 77 FE      [19] 4793 	ld	-2 (ix),a
   6289 DD 7E EB      [19] 4794 	ld	a,-21 (ix)
   628C 07            [ 4] 4795 	rlca
   628D E6 01         [ 7] 4796 	and	a,#0x01
   628F DD 77 F5      [19] 4797 	ld	-11 (ix),a
                           4798 ;src/main.c:264: }else if(auxY < enemy.y){
   6292 DD 7E E1      [19] 4799 	ld	a,-31 (ix)
   6295 DD 96 F4      [19] 4800 	sub	a, -12 (ix)
   6298 3E 00         [ 7] 4801 	ld	a,#0x00
   629A 17            [ 4] 4802 	rla
   629B DD 77 FF      [19] 4803 	ld	-1 (ix),a
                           4804 ;src/main.c:266: enemy.y-=1;
   629E DD 7E F4      [19] 4805 	ld	a,-12 (ix)
   62A1 C6 FF         [ 7] 4806 	add	a,#0xFF
   62A3 DD 77 ED      [19] 4807 	ld	-19 (ix),a
                           4808 ;src/main.c:269: enemy.y+=1;
   62A6 DD 7E F4      [19] 4809 	ld	a,-12 (ix)
   62A9 3C            [ 4] 4810 	inc	a
   62AA DD 77 EC      [19] 4811 	ld	-20 (ix),a
                           4812 ;src/main.c:262: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   62AD DD 7E F4      [19] 4813 	ld	a,-12 (ix)
   62B0 DD 77 F2      [19] 4814 	ld	-14 (ix),a
   62B3 DD 36 F3 00   [19] 4815 	ld	-13 (ix),#0x00
                           4816 ;src/main.c:261: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   62B7 DD 4E FE      [19] 4817 	ld	c,-2 (ix)
   62BA 06 00         [ 7] 4818 	ld	b,#0x00
   62BC 69            [ 4] 4819 	ld	l, c
   62BD 60            [ 4] 4820 	ld	h, b
   62BE 29            [11] 4821 	add	hl, hl
   62BF 29            [11] 4822 	add	hl, hl
   62C0 09            [11] 4823 	add	hl, bc
   62C1 29            [11] 4824 	add	hl, hl
   62C2 29            [11] 4825 	add	hl, hl
   62C3 DD 75 F6      [19] 4826 	ld	-10 (ix),l
   62C6 DD 74 F7      [19] 4827 	ld	-9 (ix),h
                           4828 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   62C9 DD 7E F2      [19] 4829 	ld	a,-14 (ix)
   62CC C6 FF         [ 7] 4830 	add	a,#0xFF
   62CE DD 77 FB      [19] 4831 	ld	-5 (ix),a
   62D1 DD 7E F3      [19] 4832 	ld	a,-13 (ix)
   62D4 CE FF         [ 7] 4833 	adc	a,#0xFF
   62D6 DD 77 FC      [19] 4834 	ld	-4 (ix),a
   62D9 DD 7E F2      [19] 4835 	ld	a,-14 (ix)
   62DC C6 0E         [ 7] 4836 	add	a, #0x0E
   62DE DD 77 F8      [19] 4837 	ld	-8 (ix),a
   62E1 DD 7E F3      [19] 4838 	ld	a,-13 (ix)
   62E4 CE 00         [ 7] 4839 	adc	a, #0x00
   62E6 DD 77 F9      [19] 4840 	ld	-7 (ix),a
                           4841 ;src/main.c:262: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   62E9 DD 7E F2      [19] 4842 	ld	a,-14 (ix)
   62EC C6 10         [ 7] 4843 	add	a, #0x10
   62EE DD 77 E6      [19] 4844 	ld	-26 (ix),a
   62F1 DD 7E F3      [19] 4845 	ld	a,-13 (ix)
   62F4 CE 00         [ 7] 4846 	adc	a, #0x00
   62F6 DD 77 E7      [19] 4847 	ld	-25 (ix),a
   62F9 DD 7E F2      [19] 4848 	ld	a,-14 (ix)
   62FC C6 1F         [ 7] 4849 	add	a, #0x1F
   62FE DD 77 F2      [19] 4850 	ld	-14 (ix),a
   6301 DD 7E F3      [19] 4851 	ld	a,-13 (ix)
   6304 CE 00         [ 7] 4852 	adc	a, #0x00
   6306 DD 77 F3      [19] 4853 	ld	-13 (ix),a
                           4854 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   6309 DD 7E FC      [19] 4855 	ld	a,-4 (ix)
   630C 07            [ 4] 4856 	rlca
   630D E6 01         [ 7] 4857 	and	a,#0x01
   630F DD 77 FE      [19] 4858 	ld	-2 (ix),a
                           4859 ;src/main.c:262: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   6312 DD 7E E7      [19] 4860 	ld	a,-25 (ix)
   6315 07            [ 4] 4861 	rlca
   6316 E6 01         [ 7] 4862 	and	a,#0x01
   6318 DD 77 F4      [19] 4863 	ld	-12 (ix),a
                           4864 ;src/main.c:259: if(auxX < enemy.x){
   631B DD 7E E2      [19] 4865 	ld	a,-30 (ix)
   631E DD 96 E3      [19] 4866 	sub	a, -29 (ix)
   6321 D2 4A 65      [10] 4867 	jp	NC,00137$
                           4868 ;src/main.c:261: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   6324 DD 7E F6      [19] 4869 	ld	a,-10 (ix)
   6327 C6 09         [ 7] 4870 	add	a, #<(_scene)
   6329 DD 77 F0      [19] 4871 	ld	-16 (ix),a
   632C DD 7E F7      [19] 4872 	ld	a,-9 (ix)
   632F CE 72         [ 7] 4873 	adc	a, #>(_scene)
   6331 DD 77 F1      [19] 4874 	ld	-15 (ix),a
   6334 DD 7E EA      [19] 4875 	ld	a,-22 (ix)
   6337 DD 77 EE      [19] 4876 	ld	-18 (ix),a
   633A DD 7E EB      [19] 4877 	ld	a,-21 (ix)
   633D DD 77 EF      [19] 4878 	ld	-17 (ix),a
   6340 DD 7E F5      [19] 4879 	ld	a,-11 (ix)
   6343 B7            [ 4] 4880 	or	a, a
   6344 28 0C         [12] 4881 	jr	Z,00141$
   6346 DD 7E E8      [19] 4882 	ld	a,-24 (ix)
   6349 DD 77 EE      [19] 4883 	ld	-18 (ix),a
   634C DD 7E E9      [19] 4884 	ld	a,-23 (ix)
   634F DD 77 EF      [19] 4885 	ld	-17 (ix),a
   6352                    4886 00141$:
   6352 DD CB EF 2E   [23] 4887 	sra	-17 (ix)
   6356 DD CB EE 1E   [23] 4888 	rr	-18 (ix)
   635A DD CB EF 2E   [23] 4889 	sra	-17 (ix)
   635E DD CB EE 1E   [23] 4890 	rr	-18 (ix)
   6362 DD 7E F0      [19] 4891 	ld	a,-16 (ix)
   6365 DD 86 EE      [19] 4892 	add	a, -18 (ix)
   6368 DD 77 EE      [19] 4893 	ld	-18 (ix),a
   636B DD 7E F1      [19] 4894 	ld	a,-15 (ix)
   636E DD 8E EF      [19] 4895 	adc	a, -17 (ix)
   6371 DD 77 EF      [19] 4896 	ld	-17 (ix),a
   6374 DD 6E EE      [19] 4897 	ld	l,-18 (ix)
   6377 DD 66 EF      [19] 4898 	ld	h,-17 (ix)
   637A 7E            [ 7] 4899 	ld	a,(hl)
   637B 3D            [ 4] 4900 	dec	a
   637C CA 35 64      [10] 4901 	jp	Z,00112$
                           4902 ;src/main.c:262: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   637F DD 7E E6      [19] 4903 	ld	a,-26 (ix)
   6382 DD 77 EE      [19] 4904 	ld	-18 (ix),a
   6385 DD 7E E7      [19] 4905 	ld	a,-25 (ix)
   6388 DD 77 EF      [19] 4906 	ld	-17 (ix),a
   638B DD 7E F4      [19] 4907 	ld	a,-12 (ix)
   638E B7            [ 4] 4908 	or	a, a
   638F 28 0C         [12] 4909 	jr	Z,00142$
   6391 DD 7E F2      [19] 4910 	ld	a,-14 (ix)
   6394 DD 77 EE      [19] 4911 	ld	-18 (ix),a
   6397 DD 7E F3      [19] 4912 	ld	a,-13 (ix)
   639A DD 77 EF      [19] 4913 	ld	-17 (ix),a
   639D                    4914 00142$:
   639D DD CB EF 2E   [23] 4915 	sra	-17 (ix)
   63A1 DD CB EE 1E   [23] 4916 	rr	-18 (ix)
   63A5 DD CB EF 2E   [23] 4917 	sra	-17 (ix)
   63A9 DD CB EE 1E   [23] 4918 	rr	-18 (ix)
   63AD DD CB EF 2E   [23] 4919 	sra	-17 (ix)
   63B1 DD CB EE 1E   [23] 4920 	rr	-18 (ix)
   63B5 DD CB EF 2E   [23] 4921 	sra	-17 (ix)
   63B9 DD CB EE 1E   [23] 4922 	rr	-18 (ix)
   63BD DD 4E EE      [19] 4923 	ld	c,-18 (ix)
   63C0 DD 46 EF      [19] 4924 	ld	b,-17 (ix)
   63C3 69            [ 4] 4925 	ld	l, c
   63C4 60            [ 4] 4926 	ld	h, b
   63C5 29            [11] 4927 	add	hl, hl
   63C6 29            [11] 4928 	add	hl, hl
   63C7 09            [11] 4929 	add	hl, bc
   63C8 29            [11] 4930 	add	hl, hl
   63C9 29            [11] 4931 	add	hl, hl
   63CA DD 75 EE      [19] 4932 	ld	-18 (ix),l
   63CD DD 74 EF      [19] 4933 	ld	-17 (ix),h
   63D0 3E 09         [ 7] 4934 	ld	a,#<(_scene)
   63D2 DD 86 EE      [19] 4935 	add	a, -18 (ix)
   63D5 DD 77 EE      [19] 4936 	ld	-18 (ix),a
   63D8 3E 72         [ 7] 4937 	ld	a,#>(_scene)
   63DA DD 8E EF      [19] 4938 	adc	a, -17 (ix)
   63DD DD 77 EF      [19] 4939 	ld	-17 (ix),a
   63E0 DD 7E EA      [19] 4940 	ld	a,-22 (ix)
   63E3 DD 77 F0      [19] 4941 	ld	-16 (ix),a
   63E6 DD 7E EB      [19] 4942 	ld	a,-21 (ix)
   63E9 DD 77 F1      [19] 4943 	ld	-15 (ix),a
   63EC DD 7E F5      [19] 4944 	ld	a,-11 (ix)
   63EF B7            [ 4] 4945 	or	a, a
   63F0 28 0C         [12] 4946 	jr	Z,00143$
   63F2 DD 7E E8      [19] 4947 	ld	a,-24 (ix)
   63F5 DD 77 F0      [19] 4948 	ld	-16 (ix),a
   63F8 DD 7E E9      [19] 4949 	ld	a,-23 (ix)
   63FB DD 77 F1      [19] 4950 	ld	-15 (ix),a
   63FE                    4951 00143$:
   63FE DD CB F1 2E   [23] 4952 	sra	-15 (ix)
   6402 DD CB F0 1E   [23] 4953 	rr	-16 (ix)
   6406 DD CB F1 2E   [23] 4954 	sra	-15 (ix)
   640A DD CB F0 1E   [23] 4955 	rr	-16 (ix)
   640E DD 7E EE      [19] 4956 	ld	a,-18 (ix)
   6411 DD 86 F0      [19] 4957 	add	a, -16 (ix)
   6414 DD 77 EE      [19] 4958 	ld	-18 (ix),a
   6417 DD 7E EF      [19] 4959 	ld	a,-17 (ix)
   641A DD 8E F1      [19] 4960 	adc	a, -15 (ix)
   641D DD 77 EF      [19] 4961 	ld	-17 (ix),a
   6420 DD 6E EE      [19] 4962 	ld	l,-18 (ix)
   6423 DD 66 EF      [19] 4963 	ld	h,-17 (ix)
   6426 7E            [ 7] 4964 	ld	a,(hl)
   6427 3D            [ 4] 4965 	dec	a
   6428 28 0B         [12] 4966 	jr	Z,00112$
                           4967 ;src/main.c:263: enemy.x-=1;
   642A DD 56 E3      [19] 4968 	ld	d,-29 (ix)
   642D 15            [ 4] 4969 	dec	d
   642E 21 22 73      [10] 4970 	ld	hl,#_enemy
   6431 72            [ 7] 4971 	ld	(hl),d
   6432 C3 6F 68      [10] 4972 	jp	00139$
   6435                    4973 00112$:
                           4974 ;src/main.c:264: }else if(auxY < enemy.y){
   6435 DD 7E FF      [19] 4975 	ld	a,-1 (ix)
   6438 B7            [ 4] 4976 	or	a, a
   6439 CA C3 64      [10] 4977 	jp	Z,00109$
                           4978 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   643C DD 7E FB      [19] 4979 	ld	a,-5 (ix)
   643F DD 77 EE      [19] 4980 	ld	-18 (ix),a
   6442 DD 7E FC      [19] 4981 	ld	a,-4 (ix)
   6445 DD 77 EF      [19] 4982 	ld	-17 (ix),a
   6448 DD 7E FE      [19] 4983 	ld	a,-2 (ix)
   644B B7            [ 4] 4984 	or	a, a
   644C 28 0C         [12] 4985 	jr	Z,00144$
   644E DD 7E F8      [19] 4986 	ld	a,-8 (ix)
   6451 DD 77 EE      [19] 4987 	ld	-18 (ix),a
   6454 DD 7E F9      [19] 4988 	ld	a,-7 (ix)
   6457 DD 77 EF      [19] 4989 	ld	-17 (ix),a
   645A                    4990 00144$:
   645A DD CB EF 2E   [23] 4991 	sra	-17 (ix)
   645E DD CB EE 1E   [23] 4992 	rr	-18 (ix)
   6462 DD CB EF 2E   [23] 4993 	sra	-17 (ix)
   6466 DD CB EE 1E   [23] 4994 	rr	-18 (ix)
   646A DD CB EF 2E   [23] 4995 	sra	-17 (ix)
   646E DD CB EE 1E   [23] 4996 	rr	-18 (ix)
   6472 DD CB EF 2E   [23] 4997 	sra	-17 (ix)
   6476 DD CB EE 1E   [23] 4998 	rr	-18 (ix)
   647A DD 4E EE      [19] 4999 	ld	c,-18 (ix)
   647D DD 46 EF      [19] 5000 	ld	b,-17 (ix)
   6480 69            [ 4] 5001 	ld	l, c
   6481 60            [ 4] 5002 	ld	h, b
   6482 29            [11] 5003 	add	hl, hl
   6483 29            [11] 5004 	add	hl, hl
   6484 09            [11] 5005 	add	hl, bc
   6485 29            [11] 5006 	add	hl, hl
   6486 29            [11] 5007 	add	hl, hl
   6487 DD 75 EE      [19] 5008 	ld	-18 (ix),l
   648A DD 74 EF      [19] 5009 	ld	-17 (ix),h
   648D 3E 09         [ 7] 5010 	ld	a,#<(_scene)
   648F DD 86 EE      [19] 5011 	add	a, -18 (ix)
   6492 DD 77 EE      [19] 5012 	ld	-18 (ix),a
   6495 3E 72         [ 7] 5013 	ld	a,#>(_scene)
   6497 DD 8E EF      [19] 5014 	adc	a, -17 (ix)
   649A DD 77 EF      [19] 5015 	ld	-17 (ix),a
   649D DD 7E FD      [19] 5016 	ld	a,-3 (ix)
   64A0 DD 86 EE      [19] 5017 	add	a, -18 (ix)
   64A3 DD 77 EE      [19] 5018 	ld	-18 (ix),a
   64A6 3E 00         [ 7] 5019 	ld	a,#0x00
   64A8 DD 8E EF      [19] 5020 	adc	a, -17 (ix)
   64AB DD 77 EF      [19] 5021 	ld	-17 (ix),a
   64AE DD 6E EE      [19] 5022 	ld	l,-18 (ix)
   64B1 DD 66 EF      [19] 5023 	ld	h,-17 (ix)
   64B4 7E            [ 7] 5024 	ld	a,(hl)
   64B5 3D            [ 4] 5025 	dec	a
   64B6 CA 6F 68      [10] 5026 	jp	Z,00139$
                           5027 ;src/main.c:266: enemy.y-=1;
   64B9 21 23 73      [10] 5028 	ld	hl,#(_enemy + 0x0001)
   64BC DD 7E ED      [19] 5029 	ld	a,-19 (ix)
   64BF 77            [ 7] 5030 	ld	(hl),a
   64C0 C3 6F 68      [10] 5031 	jp	00139$
   64C3                    5032 00109$:
                           5033 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   64C3 DD 7E E6      [19] 5034 	ld	a,-26 (ix)
   64C6 DD 77 EE      [19] 5035 	ld	-18 (ix),a
   64C9 DD 7E E7      [19] 5036 	ld	a,-25 (ix)
   64CC DD 77 EF      [19] 5037 	ld	-17 (ix),a
   64CF DD 7E F4      [19] 5038 	ld	a,-12 (ix)
   64D2 B7            [ 4] 5039 	or	a, a
   64D3 28 0C         [12] 5040 	jr	Z,00145$
   64D5 DD 7E F2      [19] 5041 	ld	a,-14 (ix)
   64D8 DD 77 EE      [19] 5042 	ld	-18 (ix),a
   64DB DD 7E F3      [19] 5043 	ld	a,-13 (ix)
   64DE DD 77 EF      [19] 5044 	ld	-17 (ix),a
   64E1                    5045 00145$:
   64E1 DD CB EF 2E   [23] 5046 	sra	-17 (ix)
   64E5 DD CB EE 1E   [23] 5047 	rr	-18 (ix)
   64E9 DD CB EF 2E   [23] 5048 	sra	-17 (ix)
   64ED DD CB EE 1E   [23] 5049 	rr	-18 (ix)
   64F1 DD CB EF 2E   [23] 5050 	sra	-17 (ix)
   64F5 DD CB EE 1E   [23] 5051 	rr	-18 (ix)
   64F9 DD CB EF 2E   [23] 5052 	sra	-17 (ix)
   64FD DD CB EE 1E   [23] 5053 	rr	-18 (ix)
   6501 DD 4E EE      [19] 5054 	ld	c,-18 (ix)
   6504 DD 46 EF      [19] 5055 	ld	b,-17 (ix)
   6507 69            [ 4] 5056 	ld	l, c
   6508 60            [ 4] 5057 	ld	h, b
   6509 29            [11] 5058 	add	hl, hl
   650A 29            [11] 5059 	add	hl, hl
   650B 09            [11] 5060 	add	hl, bc
   650C 29            [11] 5061 	add	hl, hl
   650D 29            [11] 5062 	add	hl, hl
   650E DD 75 EE      [19] 5063 	ld	-18 (ix),l
   6511 DD 74 EF      [19] 5064 	ld	-17 (ix),h
   6514 3E 09         [ 7] 5065 	ld	a,#<(_scene)
   6516 DD 86 EE      [19] 5066 	add	a, -18 (ix)
   6519 DD 77 EE      [19] 5067 	ld	-18 (ix),a
   651C 3E 72         [ 7] 5068 	ld	a,#>(_scene)
   651E DD 8E EF      [19] 5069 	adc	a, -17 (ix)
   6521 DD 77 EF      [19] 5070 	ld	-17 (ix),a
   6524 DD 7E FD      [19] 5071 	ld	a,-3 (ix)
   6527 DD 86 EE      [19] 5072 	add	a, -18 (ix)
   652A DD 77 EE      [19] 5073 	ld	-18 (ix),a
   652D 3E 00         [ 7] 5074 	ld	a,#0x00
   652F DD 8E EF      [19] 5075 	adc	a, -17 (ix)
   6532 DD 77 EF      [19] 5076 	ld	-17 (ix),a
   6535 DD 6E EE      [19] 5077 	ld	l,-18 (ix)
   6538 DD 66 EF      [19] 5078 	ld	h,-17 (ix)
   653B 7E            [ 7] 5079 	ld	a,(hl)
   653C 3D            [ 4] 5080 	dec	a
   653D CA 6F 68      [10] 5081 	jp	Z,00139$
                           5082 ;src/main.c:269: enemy.y+=1;
   6540 21 23 73      [10] 5083 	ld	hl,#(_enemy + 0x0001)
   6543 DD 7E EC      [19] 5084 	ld	a,-20 (ix)
   6546 77            [ 7] 5085 	ld	(hl),a
   6547 C3 6F 68      [10] 5086 	jp	00139$
   654A                    5087 00137$:
                           5088 ;src/main.c:271: }else if(auxX > enemy.x){
   654A DD 7E E3      [19] 5089 	ld	a,-29 (ix)
   654D DD 96 E2      [19] 5090 	sub	a, -30 (ix)
   6550 D2 58 67      [10] 5091 	jp	NC,00134$
                           5092 ;src/main.c:273: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
   6553 3E 09         [ 7] 5093 	ld	a,#<(_scene)
   6555 DD 86 F6      [19] 5094 	add	a, -10 (ix)
   6558 DD 77 EE      [19] 5095 	ld	-18 (ix),a
   655B 3E 72         [ 7] 5096 	ld	a,#>(_scene)
   655D DD 8E F7      [19] 5097 	adc	a, -9 (ix)
   6560 DD 77 EF      [19] 5098 	ld	-17 (ix),a
   6563 DD 7E E4      [19] 5099 	ld	a,-28 (ix)
   6566 C6 04         [ 7] 5100 	add	a, #0x04
   6568 DD 77 F0      [19] 5101 	ld	-16 (ix),a
   656B DD 7E E5      [19] 5102 	ld	a,-27 (ix)
   656E CE 00         [ 7] 5103 	adc	a, #0x00
   6570 DD 77 F1      [19] 5104 	ld	-15 (ix),a
   6573 DD 7E F0      [19] 5105 	ld	a,-16 (ix)
   6576 DD 77 F6      [19] 5106 	ld	-10 (ix),a
   6579 DD 7E F1      [19] 5107 	ld	a,-15 (ix)
   657C DD 77 F7      [19] 5108 	ld	-9 (ix),a
   657F DD 7E F1      [19] 5109 	ld	a,-15 (ix)
   6582 07            [ 4] 5110 	rlca
   6583 E6 01         [ 7] 5111 	and	a,#0x01
   6585 DD 77 FA      [19] 5112 	ld	-6 (ix),a
   6588 DD 7E E4      [19] 5113 	ld	a,-28 (ix)
   658B C6 07         [ 7] 5114 	add	a, #0x07
   658D DD 77 E4      [19] 5115 	ld	-28 (ix),a
   6590 DD 7E E5      [19] 5116 	ld	a,-27 (ix)
   6593 CE 00         [ 7] 5117 	adc	a, #0x00
   6595 DD 77 E5      [19] 5118 	ld	-27 (ix),a
   6598 DD 7E FA      [19] 5119 	ld	a,-6 (ix)
   659B B7            [ 4] 5120 	or	a, a
   659C 28 0C         [12] 5121 	jr	Z,00146$
   659E DD 7E E4      [19] 5122 	ld	a,-28 (ix)
   65A1 DD 77 F6      [19] 5123 	ld	-10 (ix),a
   65A4 DD 7E E5      [19] 5124 	ld	a,-27 (ix)
   65A7 DD 77 F7      [19] 5125 	ld	-9 (ix),a
   65AA                    5126 00146$:
   65AA DD 6E F6      [19] 5127 	ld	l,-10 (ix)
   65AD DD 66 F7      [19] 5128 	ld	h,-9 (ix)
   65B0 CB 2C         [ 8] 5129 	sra	h
   65B2 CB 1D         [ 8] 5130 	rr	l
   65B4 CB 2C         [ 8] 5131 	sra	h
   65B6 CB 1D         [ 8] 5132 	rr	l
   65B8 DD 5E EE      [19] 5133 	ld	e,-18 (ix)
   65BB DD 56 EF      [19] 5134 	ld	d,-17 (ix)
   65BE 19            [11] 5135 	add	hl,de
   65BF 7E            [ 7] 5136 	ld	a,(hl)
   65C0 3D            [ 4] 5137 	dec	a
   65C1 CA 70 66      [10] 5138 	jp	Z,00123$
                           5139 ;src/main.c:274: && scene[(enemy.y+tileheight)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   65C4 DD 7E E6      [19] 5140 	ld	a,-26 (ix)
   65C7 DD 77 F6      [19] 5141 	ld	-10 (ix),a
   65CA DD 7E E7      [19] 5142 	ld	a,-25 (ix)
   65CD DD 77 F7      [19] 5143 	ld	-9 (ix),a
   65D0 DD 7E F4      [19] 5144 	ld	a,-12 (ix)
   65D3 B7            [ 4] 5145 	or	a, a
   65D4 28 0C         [12] 5146 	jr	Z,00147$
   65D6 DD 7E F2      [19] 5147 	ld	a,-14 (ix)
   65D9 DD 77 F6      [19] 5148 	ld	-10 (ix),a
   65DC DD 7E F3      [19] 5149 	ld	a,-13 (ix)
   65DF DD 77 F7      [19] 5150 	ld	-9 (ix),a
   65E2                    5151 00147$:
   65E2 DD CB F7 2E   [23] 5152 	sra	-9 (ix)
   65E6 DD CB F6 1E   [23] 5153 	rr	-10 (ix)
   65EA DD CB F7 2E   [23] 5154 	sra	-9 (ix)
   65EE DD CB F6 1E   [23] 5155 	rr	-10 (ix)
   65F2 DD CB F7 2E   [23] 5156 	sra	-9 (ix)
   65F6 DD CB F6 1E   [23] 5157 	rr	-10 (ix)
   65FA DD CB F7 2E   [23] 5158 	sra	-9 (ix)
   65FE DD CB F6 1E   [23] 5159 	rr	-10 (ix)
   6602 DD 4E F6      [19] 5160 	ld	c,-10 (ix)
   6605 DD 46 F7      [19] 5161 	ld	b,-9 (ix)
   6608 69            [ 4] 5162 	ld	l, c
   6609 60            [ 4] 5163 	ld	h, b
   660A 29            [11] 5164 	add	hl, hl
   660B 29            [11] 5165 	add	hl, hl
   660C 09            [11] 5166 	add	hl, bc
   660D 29            [11] 5167 	add	hl, hl
   660E 29            [11] 5168 	add	hl, hl
   660F DD 75 F6      [19] 5169 	ld	-10 (ix),l
   6612 DD 74 F7      [19] 5170 	ld	-9 (ix),h
   6615 3E 09         [ 7] 5171 	ld	a,#<(_scene)
   6617 DD 86 F6      [19] 5172 	add	a, -10 (ix)
   661A DD 77 F6      [19] 5173 	ld	-10 (ix),a
   661D 3E 72         [ 7] 5174 	ld	a,#>(_scene)
   661F DD 8E F7      [19] 5175 	adc	a, -9 (ix)
   6622 DD 77 F7      [19] 5176 	ld	-9 (ix),a
   6625 DD 7E FA      [19] 5177 	ld	a,-6 (ix)
   6628 B7            [ 4] 5178 	or	a, a
   6629 28 0C         [12] 5179 	jr	Z,00148$
   662B DD 7E E4      [19] 5180 	ld	a,-28 (ix)
   662E DD 77 F0      [19] 5181 	ld	-16 (ix),a
   6631 DD 7E E5      [19] 5182 	ld	a,-27 (ix)
   6634 DD 77 F1      [19] 5183 	ld	-15 (ix),a
   6637                    5184 00148$:
   6637 DD CB F1 2E   [23] 5185 	sra	-15 (ix)
   663B DD CB F0 1E   [23] 5186 	rr	-16 (ix)
   663F DD CB F1 2E   [23] 5187 	sra	-15 (ix)
   6643 DD CB F0 1E   [23] 5188 	rr	-16 (ix)
   6647 DD 7E F6      [19] 5189 	ld	a,-10 (ix)
   664A DD 86 F0      [19] 5190 	add	a, -16 (ix)
   664D DD 77 F0      [19] 5191 	ld	-16 (ix),a
   6650 DD 7E F7      [19] 5192 	ld	a,-9 (ix)
   6653 DD 8E F1      [19] 5193 	adc	a, -15 (ix)
   6656 DD 77 F1      [19] 5194 	ld	-15 (ix),a
   6659 DD 6E F0      [19] 5195 	ld	l,-16 (ix)
   665C DD 66 F1      [19] 5196 	ld	h,-15 (ix)
   665F 7E            [ 7] 5197 	ld	a,(hl)
   6660 DD 77 FA      [19] 5198 	ld	-6 (ix), a
   6663 3D            [ 4] 5199 	dec	a
   6664 28 0A         [12] 5200 	jr	Z,00123$
                           5201 ;src/main.c:275: enemy.x+=1;
   6666 DD 7E E3      [19] 5202 	ld	a,-29 (ix)
   6669 3C            [ 4] 5203 	inc	a
   666A 32 22 73      [13] 5204 	ld	(#_enemy),a
   666D C3 6F 68      [10] 5205 	jp	00139$
   6670                    5206 00123$:
                           5207 ;src/main.c:276: }else if(auxY < enemy.y){
   6670 DD 7E FF      [19] 5208 	ld	a,-1 (ix)
   6673 B7            [ 4] 5209 	or	a, a
   6674 28 58         [12] 5210 	jr	Z,00120$
                           5211 ;src/main.c:277: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   6676 DD 7E EA      [19] 5212 	ld	a,-22 (ix)
   6679 DD 77 F0      [19] 5213 	ld	-16 (ix),a
   667C DD 7E EB      [19] 5214 	ld	a,-21 (ix)
   667F DD 77 F1      [19] 5215 	ld	-15 (ix),a
   6682 DD 7E F5      [19] 5216 	ld	a,-11 (ix)
   6685 B7            [ 4] 5217 	or	a, a
   6686 28 0C         [12] 5218 	jr	Z,00149$
   6688 DD 7E E8      [19] 5219 	ld	a,-24 (ix)
   668B DD 77 F0      [19] 5220 	ld	-16 (ix),a
   668E DD 7E E9      [19] 5221 	ld	a,-23 (ix)
   6691 DD 77 F1      [19] 5222 	ld	-15 (ix),a
   6694                    5223 00149$:
   6694 DD CB F1 2E   [23] 5224 	sra	-15 (ix)
   6698 DD CB F0 1E   [23] 5225 	rr	-16 (ix)
   669C DD CB F1 2E   [23] 5226 	sra	-15 (ix)
   66A0 DD CB F0 1E   [23] 5227 	rr	-16 (ix)
   66A4 DD 7E F0      [19] 5228 	ld	a,-16 (ix)
   66A7 DD 86 EE      [19] 5229 	add	a, -18 (ix)
   66AA DD 77 EE      [19] 5230 	ld	-18 (ix),a
   66AD DD 7E F1      [19] 5231 	ld	a,-15 (ix)
   66B0 DD 8E EF      [19] 5232 	adc	a, -17 (ix)
   66B3 DD 77 EF      [19] 5233 	ld	-17 (ix),a
   66B6 DD 6E EE      [19] 5234 	ld	l,-18 (ix)
   66B9 DD 66 EF      [19] 5235 	ld	h,-17 (ix)
   66BC 7E            [ 7] 5236 	ld	a,(hl)
   66BD DD 77 FA      [19] 5237 	ld	-6 (ix), a
   66C0 3D            [ 4] 5238 	dec	a
   66C1 CA 6F 68      [10] 5239 	jp	Z,00139$
                           5240 ;src/main.c:278: enemy.y-=1;
   66C4 21 23 73      [10] 5241 	ld	hl,#(_enemy + 0x0001)
   66C7 DD 7E ED      [19] 5242 	ld	a,-19 (ix)
   66CA 77            [ 7] 5243 	ld	(hl),a
   66CB C3 6F 68      [10] 5244 	jp	00139$
   66CE                    5245 00120$:
                           5246 ;src/main.c:280: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   66CE DD 7E E6      [19] 5247 	ld	a,-26 (ix)
   66D1 DD 77 EE      [19] 5248 	ld	-18 (ix),a
   66D4 DD 7E E7      [19] 5249 	ld	a,-25 (ix)
   66D7 DD 77 EF      [19] 5250 	ld	-17 (ix),a
   66DA DD 7E F4      [19] 5251 	ld	a,-12 (ix)
   66DD B7            [ 4] 5252 	or	a, a
   66DE 28 0C         [12] 5253 	jr	Z,00150$
   66E0 DD 7E F2      [19] 5254 	ld	a,-14 (ix)
   66E3 DD 77 EE      [19] 5255 	ld	-18 (ix),a
   66E6 DD 7E F3      [19] 5256 	ld	a,-13 (ix)
   66E9 DD 77 EF      [19] 5257 	ld	-17 (ix),a
   66EC                    5258 00150$:
   66EC DD CB EF 2E   [23] 5259 	sra	-17 (ix)
   66F0 DD CB EE 1E   [23] 5260 	rr	-18 (ix)
   66F4 DD CB EF 2E   [23] 5261 	sra	-17 (ix)
   66F8 DD CB EE 1E   [23] 5262 	rr	-18 (ix)
   66FC DD CB EF 2E   [23] 5263 	sra	-17 (ix)
   6700 DD CB EE 1E   [23] 5264 	rr	-18 (ix)
   6704 DD CB EF 2E   [23] 5265 	sra	-17 (ix)
   6708 DD CB EE 1E   [23] 5266 	rr	-18 (ix)
   670C DD 4E EE      [19] 5267 	ld	c,-18 (ix)
   670F DD 46 EF      [19] 5268 	ld	b,-17 (ix)
   6712 69            [ 4] 5269 	ld	l, c
   6713 60            [ 4] 5270 	ld	h, b
   6714 29            [11] 5271 	add	hl, hl
   6715 29            [11] 5272 	add	hl, hl
   6716 09            [11] 5273 	add	hl, bc
   6717 29            [11] 5274 	add	hl, hl
   6718 29            [11] 5275 	add	hl, hl
   6719 DD 75 EE      [19] 5276 	ld	-18 (ix),l
   671C DD 74 EF      [19] 5277 	ld	-17 (ix),h
   671F 3E 09         [ 7] 5278 	ld	a,#<(_scene)
   6721 DD 86 EE      [19] 5279 	add	a, -18 (ix)
   6724 DD 77 EE      [19] 5280 	ld	-18 (ix),a
   6727 3E 72         [ 7] 5281 	ld	a,#>(_scene)
   6729 DD 8E EF      [19] 5282 	adc	a, -17 (ix)
   672C DD 77 EF      [19] 5283 	ld	-17 (ix),a
   672F DD 7E EE      [19] 5284 	ld	a,-18 (ix)
   6732 DD 86 FD      [19] 5285 	add	a, -3 (ix)
   6735 DD 77 EE      [19] 5286 	ld	-18 (ix),a
   6738 DD 7E EF      [19] 5287 	ld	a,-17 (ix)
   673B CE 00         [ 7] 5288 	adc	a, #0x00
   673D DD 77 EF      [19] 5289 	ld	-17 (ix),a
   6740 DD 6E EE      [19] 5290 	ld	l,-18 (ix)
   6743 DD 66 EF      [19] 5291 	ld	h,-17 (ix)
   6746 7E            [ 7] 5292 	ld	a,(hl)
   6747 DD 77 FA      [19] 5293 	ld	-6 (ix), a
   674A 3D            [ 4] 5294 	dec	a
   674B CA 6F 68      [10] 5295 	jp	Z,00139$
                           5296 ;src/main.c:281: enemy.y+=1;
   674E 21 23 73      [10] 5297 	ld	hl,#(_enemy + 0x0001)
   6751 DD 7E EC      [19] 5298 	ld	a,-20 (ix)
   6754 77            [ 7] 5299 	ld	(hl),a
   6755 C3 6F 68      [10] 5300 	jp	00139$
   6758                    5301 00134$:
                           5302 ;src/main.c:285: if(auxY < enemy.y){
   6758 DD 7E FF      [19] 5303 	ld	a,-1 (ix)
   675B B7            [ 4] 5304 	or	a, a
   675C CA E9 67      [10] 5305 	jp	Z,00131$
                           5306 ;src/main.c:286: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   675F DD 7E FB      [19] 5307 	ld	a,-5 (ix)
   6762 DD 77 EE      [19] 5308 	ld	-18 (ix),a
   6765 DD 7E FC      [19] 5309 	ld	a,-4 (ix)
   6768 DD 77 EF      [19] 5310 	ld	-17 (ix),a
   676B DD 7E FE      [19] 5311 	ld	a,-2 (ix)
   676E B7            [ 4] 5312 	or	a, a
   676F 28 0C         [12] 5313 	jr	Z,00151$
   6771 DD 7E F8      [19] 5314 	ld	a,-8 (ix)
   6774 DD 77 EE      [19] 5315 	ld	-18 (ix),a
   6777 DD 7E F9      [19] 5316 	ld	a,-7 (ix)
   677A DD 77 EF      [19] 5317 	ld	-17 (ix),a
   677D                    5318 00151$:
   677D DD CB EF 2E   [23] 5319 	sra	-17 (ix)
   6781 DD CB EE 1E   [23] 5320 	rr	-18 (ix)
   6785 DD CB EF 2E   [23] 5321 	sra	-17 (ix)
   6789 DD CB EE 1E   [23] 5322 	rr	-18 (ix)
   678D DD CB EF 2E   [23] 5323 	sra	-17 (ix)
   6791 DD CB EE 1E   [23] 5324 	rr	-18 (ix)
   6795 DD CB EF 2E   [23] 5325 	sra	-17 (ix)
   6799 DD CB EE 1E   [23] 5326 	rr	-18 (ix)
   679D DD 4E EE      [19] 5327 	ld	c,-18 (ix)
   67A0 DD 46 EF      [19] 5328 	ld	b,-17 (ix)
   67A3 69            [ 4] 5329 	ld	l, c
   67A4 60            [ 4] 5330 	ld	h, b
   67A5 29            [11] 5331 	add	hl, hl
   67A6 29            [11] 5332 	add	hl, hl
   67A7 09            [11] 5333 	add	hl, bc
   67A8 29            [11] 5334 	add	hl, hl
   67A9 29            [11] 5335 	add	hl, hl
   67AA DD 75 EE      [19] 5336 	ld	-18 (ix),l
   67AD DD 74 EF      [19] 5337 	ld	-17 (ix),h
   67B0 3E 09         [ 7] 5338 	ld	a,#<(_scene)
   67B2 DD 86 EE      [19] 5339 	add	a, -18 (ix)
   67B5 DD 77 EE      [19] 5340 	ld	-18 (ix),a
   67B8 3E 72         [ 7] 5341 	ld	a,#>(_scene)
   67BA DD 8E EF      [19] 5342 	adc	a, -17 (ix)
   67BD DD 77 EF      [19] 5343 	ld	-17 (ix),a
   67C0 DD 7E EE      [19] 5344 	ld	a,-18 (ix)
   67C3 DD 86 FD      [19] 5345 	add	a, -3 (ix)
   67C6 DD 77 EE      [19] 5346 	ld	-18 (ix),a
   67C9 DD 7E EF      [19] 5347 	ld	a,-17 (ix)
   67CC CE 00         [ 7] 5348 	adc	a, #0x00
   67CE DD 77 EF      [19] 5349 	ld	-17 (ix),a
   67D1 DD 6E EE      [19] 5350 	ld	l,-18 (ix)
   67D4 DD 66 EF      [19] 5351 	ld	h,-17 (ix)
   67D7 7E            [ 7] 5352 	ld	a,(hl)
   67D8 DD 77 FA      [19] 5353 	ld	-6 (ix), a
   67DB 3D            [ 4] 5354 	dec	a
   67DC CA 6F 68      [10] 5355 	jp	Z,00139$
                           5356 ;src/main.c:287: enemy.y-=1;
   67DF 21 23 73      [10] 5357 	ld	hl,#(_enemy + 0x0001)
   67E2 DD 7E ED      [19] 5358 	ld	a,-19 (ix)
   67E5 77            [ 7] 5359 	ld	(hl),a
   67E6 C3 6F 68      [10] 5360 	jp	00139$
   67E9                    5361 00131$:
                           5362 ;src/main.c:289: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   67E9 DD 7E E6      [19] 5363 	ld	a,-26 (ix)
   67EC DD 77 EE      [19] 5364 	ld	-18 (ix),a
   67EF DD 7E E7      [19] 5365 	ld	a,-25 (ix)
   67F2 DD 77 EF      [19] 5366 	ld	-17 (ix),a
   67F5 DD 7E F4      [19] 5367 	ld	a,-12 (ix)
   67F8 B7            [ 4] 5368 	or	a, a
   67F9 28 0C         [12] 5369 	jr	Z,00152$
   67FB DD 7E F2      [19] 5370 	ld	a,-14 (ix)
   67FE DD 77 EE      [19] 5371 	ld	-18 (ix),a
   6801 DD 7E F3      [19] 5372 	ld	a,-13 (ix)
   6804 DD 77 EF      [19] 5373 	ld	-17 (ix),a
   6807                    5374 00152$:
   6807 DD CB EF 2E   [23] 5375 	sra	-17 (ix)
   680B DD CB EE 1E   [23] 5376 	rr	-18 (ix)
   680F DD CB EF 2E   [23] 5377 	sra	-17 (ix)
   6813 DD CB EE 1E   [23] 5378 	rr	-18 (ix)
   6817 DD CB EF 2E   [23] 5379 	sra	-17 (ix)
   681B DD CB EE 1E   [23] 5380 	rr	-18 (ix)
   681F DD CB EF 2E   [23] 5381 	sra	-17 (ix)
   6823 DD CB EE 1E   [23] 5382 	rr	-18 (ix)
   6827 DD 4E EE      [19] 5383 	ld	c,-18 (ix)
   682A DD 46 EF      [19] 5384 	ld	b,-17 (ix)
   682D 69            [ 4] 5385 	ld	l, c
   682E 60            [ 4] 5386 	ld	h, b
   682F 29            [11] 5387 	add	hl, hl
   6830 29            [11] 5388 	add	hl, hl
   6831 09            [11] 5389 	add	hl, bc
   6832 29            [11] 5390 	add	hl, hl
   6833 29            [11] 5391 	add	hl, hl
   6834 DD 75 EE      [19] 5392 	ld	-18 (ix),l
   6837 DD 74 EF      [19] 5393 	ld	-17 (ix),h
   683A 3E 09         [ 7] 5394 	ld	a,#<(_scene)
   683C DD 86 EE      [19] 5395 	add	a, -18 (ix)
   683F DD 77 EE      [19] 5396 	ld	-18 (ix),a
   6842 3E 72         [ 7] 5397 	ld	a,#>(_scene)
   6844 DD 8E EF      [19] 5398 	adc	a, -17 (ix)
   6847 DD 77 EF      [19] 5399 	ld	-17 (ix),a
   684A DD 7E FD      [19] 5400 	ld	a,-3 (ix)
   684D DD 86 EE      [19] 5401 	add	a, -18 (ix)
   6850 DD 77 EE      [19] 5402 	ld	-18 (ix),a
   6853 3E 00         [ 7] 5403 	ld	a,#0x00
   6855 DD 8E EF      [19] 5404 	adc	a, -17 (ix)
   6858 DD 77 EF      [19] 5405 	ld	-17 (ix),a
   685B DD 6E EE      [19] 5406 	ld	l,-18 (ix)
   685E DD 66 EF      [19] 5407 	ld	h,-17 (ix)
   6861 7E            [ 7] 5408 	ld	a,(hl)
   6862 DD 77 FA      [19] 5409 	ld	-6 (ix), a
   6865 3D            [ 4] 5410 	dec	a
   6866 28 07         [12] 5411 	jr	Z,00139$
                           5412 ;src/main.c:290: enemy.y+=1;
   6868 21 23 73      [10] 5413 	ld	hl,#(_enemy + 0x0001)
   686B DD 7E EC      [19] 5414 	ld	a,-20 (ix)
   686E 77            [ 7] 5415 	ld	(hl),a
   686F                    5416 00139$:
   686F DD F9         [10] 5417 	ld	sp, ix
   6871 DD E1         [14] 5418 	pop	ix
   6873 C9            [10] 5419 	ret
                           5420 ;src/main.c:297: void move(){
                           5421 ;	---------------------------------
                           5422 ; Function move
                           5423 ; ---------------------------------
   6874                    5424 _move::
                           5425 ;src/main.c:299: if(temp > 10){
   6874 3E 0A         [ 7] 5426 	ld	a,#0x0A
   6876 FD 21 F9 72   [14] 5427 	ld	iy,#_temp
   687A FD 96 00      [19] 5428 	sub	a, 0 (iy)
   687D 30 45         [12] 5429 	jr	NC,00117$
                           5430 ;src/main.c:300: following = detectPlayerRoom(player.x,player.y);
   687F 3A 18 73      [13] 5431 	ld	a, (#_player + 1)
   6882 21 17 73      [10] 5432 	ld	hl, #_player + 0
   6885 56            [ 7] 5433 	ld	d,(hl)
   6886 F5            [11] 5434 	push	af
   6887 33            [ 6] 5435 	inc	sp
   6888 D5            [11] 5436 	push	de
   6889 33            [ 6] 5437 	inc	sp
   688A CD 1C 50      [17] 5438 	call	_detectPlayerRoom
   688D F1            [10] 5439 	pop	af
   688E FD 21 FF 72   [14] 5440 	ld	iy,#_following
   6892 FD 75 00      [19] 5441 	ld	0 (iy),l
                           5442 ;src/main.c:305: if(following == enemy.room || enemy.pursue != 0){
   6895 21 2D 73      [10] 5443 	ld	hl, #_enemy + 11
   6898 56            [ 7] 5444 	ld	d,(hl)
   6899 01 30 73      [10] 5445 	ld	bc,#_enemy + 14
   689C 0A            [ 7] 5446 	ld	a,(bc)
   689D 5F            [ 4] 5447 	ld	e,a
   689E 3A FF 72      [13] 5448 	ld	a,(#_following + 0)
   68A1 92            [ 4] 5449 	sub	a, d
   68A2 28 04         [12] 5450 	jr	Z,00106$
   68A4 7B            [ 4] 5451 	ld	a,e
   68A5 B7            [ 4] 5452 	or	a, a
   68A6 28 13         [12] 5453 	jr	Z,00107$
   68A8                    5454 00106$:
                           5455 ;src/main.c:306: if(enemy.pursue == 0)
   68A8 7B            [ 4] 5456 	ld	a,e
   68A9 B7            [ 4] 5457 	or	a, a
   68AA 20 05         [12] 5458 	jr	NZ,00104$
                           5459 ;src/main.c:307: enemy.pursue = 4;
   68AC 3E 04         [ 7] 5460 	ld	a,#0x04
   68AE 02            [ 7] 5461 	ld	(bc),a
   68AF 18 3F         [12] 5462 	jr	00118$
   68B1                    5463 00104$:
                           5464 ;src/main.c:308: else if(enemy.pursue > 1)
   68B1 3E 01         [ 7] 5465 	ld	a,#0x01
   68B3 93            [ 4] 5466 	sub	a, e
   68B4 30 3A         [12] 5467 	jr	NC,00118$
                           5468 ;src/main.c:309: enemy.pursue -=1;
   68B6 1D            [ 4] 5469 	dec	e
   68B7 7B            [ 4] 5470 	ld	a,e
   68B8 02            [ 7] 5471 	ld	(bc),a
   68B9 18 35         [12] 5472 	jr	00118$
   68BB                    5473 00107$:
                           5474 ;src/main.c:311: enemy.dir = chooseDirection();
   68BB CD 49 50      [17] 5475 	call	_chooseDirection
   68BE 7D            [ 4] 5476 	ld	a,l
   68BF 32 2B 73      [13] 5477 	ld	(#(_enemy + 0x0009)),a
   68C2 18 2C         [12] 5478 	jr	00118$
   68C4                    5479 00117$:
                           5480 ;src/main.c:314: if(enemy.pursue >= 1){
   68C4 3A 30 73      [13] 5481 	ld	a,(#(_enemy + 0x000e) + 0)
   68C7 D6 01         [ 7] 5482 	sub	a, #0x01
   68C9 38 22         [12] 5483 	jr	C,00114$
                           5484 ;src/main.c:315: followPlayer();
   68CB CD FE 61      [17] 5485 	call	_followPlayer
                           5486 ;src/main.c:316: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   68CE 21 2E 73      [10] 5487 	ld	hl, #_enemy + 12
   68D1 56            [ 7] 5488 	ld	d,(hl)
   68D2 21 22 73      [10] 5489 	ld	hl, #_enemy + 0
   68D5 5E            [ 7] 5490 	ld	e,(hl)
   68D6 7A            [ 4] 5491 	ld	a,d
   68D7 93            [ 4] 5492 	sub	a, e
   68D8 20 16         [12] 5493 	jr	NZ,00118$
   68DA 21 2F 73      [10] 5494 	ld	hl, #_enemy + 13
   68DD 56            [ 7] 5495 	ld	d,(hl)
   68DE 21 23 73      [10] 5496 	ld	hl, #_enemy + 1
   68E1 5E            [ 7] 5497 	ld	e,(hl)
   68E2 7A            [ 4] 5498 	ld	a,d
   68E3 93            [ 4] 5499 	sub	a, e
   68E4 20 0A         [12] 5500 	jr	NZ,00118$
                           5501 ;src/main.c:317: enemy.pursue = 0;
   68E6 21 30 73      [10] 5502 	ld	hl,#(_enemy + 0x000e)
   68E9 36 00         [10] 5503 	ld	(hl),#0x00
   68EB 18 03         [12] 5504 	jr	00118$
   68ED                    5505 00114$:
                           5506 ;src/main.c:319: patrol();
   68ED CD F8 50      [17] 5507 	call	_patrol
   68F0                    5508 00118$:
                           5509 ;src/main.c:322: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   68F0 21 25 73      [10] 5510 	ld	hl, #_enemy + 3
   68F3 56            [ 7] 5511 	ld	d,(hl)
   68F4 3A 24 73      [13] 5512 	ld	a, (#_enemy + 2)
   68F7 D5            [11] 5513 	push	de
   68F8 33            [ 6] 5514 	inc	sp
   68F9 F5            [11] 5515 	push	af
   68FA 33            [ 6] 5516 	inc	sp
   68FB CD 1C 50      [17] 5517 	call	_detectPlayerRoom
   68FE F1            [10] 5518 	pop	af
   68FF 55            [ 4] 5519 	ld	d,l
   6900 3A 18 73      [13] 5520 	ld	a, (#(_player + 0x0001) + 0)
   6903 21 17 73      [10] 5521 	ld	hl, #_player + 0
   6906 46            [ 7] 5522 	ld	b,(hl)
   6907 D5            [11] 5523 	push	de
   6908 F5            [11] 5524 	push	af
   6909 33            [ 6] 5525 	inc	sp
   690A C5            [11] 5526 	push	bc
   690B 33            [ 6] 5527 	inc	sp
   690C CD 1C 50      [17] 5528 	call	_detectPlayerRoom
   690F F1            [10] 5529 	pop	af
   6910 45            [ 4] 5530 	ld	b,l
   6911 D1            [10] 5531 	pop	de
   6912 7A            [ 4] 5532 	ld	a,d
   6913 90            [ 4] 5533 	sub	a, b
   6914 28 09         [12] 5534 	jr	Z,00119$
   6916 21 30 73      [10] 5535 	ld	hl, #_enemy + 14
   6919 66            [ 7] 5536 	ld	h,(hl)
   691A 3E 01         [ 7] 5537 	ld	a,#0x01
   691C 94            [ 4] 5538 	sub	a, h
   691D 30 0E         [12] 5539 	jr	NC,00120$
   691F                    5540 00119$:
                           5541 ;src/main.c:323: enemy.seenX = player.x;
   691F 11 2E 73      [10] 5542 	ld	de,#_enemy + 12
   6922 3A 17 73      [13] 5543 	ld	a, (#_player + 0)
   6925 12            [ 7] 5544 	ld	(de),a
                           5545 ;src/main.c:324: enemy.seenY = player.y;
   6926 11 2F 73      [10] 5546 	ld	de,#_enemy + 13
   6929 3A 18 73      [13] 5547 	ld	a, (#(_player + 0x0001) + 0)
   692C 12            [ 7] 5548 	ld	(de),a
   692D                    5549 00120$:
                           5550 ;src/main.c:326: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   692D 3A 23 73      [13] 5551 	ld	a, (#_enemy + 1)
   6930 21 22 73      [10] 5552 	ld	hl, #_enemy + 0
   6933 56            [ 7] 5553 	ld	d,(hl)
   6934 F5            [11] 5554 	push	af
   6935 33            [ 6] 5555 	inc	sp
   6936 D5            [11] 5556 	push	de
   6937 33            [ 6] 5557 	inc	sp
   6938 CD 1C 50      [17] 5558 	call	_detectPlayerRoom
   693B F1            [10] 5559 	pop	af
   693C 7D            [ 4] 5560 	ld	a,l
   693D 32 2D 73      [13] 5561 	ld	(#(_enemy + 0x000b)),a
   6940 C9            [10] 5562 	ret
                           5563 ;src/main.c:331: void game(){
                           5564 ;	---------------------------------
                           5565 ; Function game
                           5566 ; ---------------------------------
   6941                    5567 _game::
   6941 DD E5         [15] 5568 	push	ix
   6943 DD 21 00 00   [14] 5569 	ld	ix,#0
   6947 DD 39         [15] 5570 	add	ix,sp
   6949 21 F4 FF      [10] 5571 	ld	hl,#-12
   694C 39            [11] 5572 	add	hl,sp
   694D F9            [ 6] 5573 	ld	sp,hl
                           5574 ;src/main.c:333: TNivel n = {0,0,0};
   694E 21 00 00      [10] 5575 	ld	hl,#0x0000
   6951 39            [11] 5576 	add	hl,sp
   6952 36 00         [10] 5577 	ld	(hl),#0x00
   6954 21 00 00      [10] 5578 	ld	hl,#0x0000
   6957 39            [11] 5579 	add	hl,sp
   6958 5D            [ 4] 5580 	ld	e, l
   6959 54            [ 4] 5581 	ld	d, h
   695A 23            [ 6] 5582 	inc	hl
   695B DD 75 FC      [19] 5583 	ld	-4 (ix),l
   695E DD 74 FD      [19] 5584 	ld	-3 (ix),h
   6961 DD 6E FC      [19] 5585 	ld	l,-4 (ix)
   6964 DD 66 FD      [19] 5586 	ld	h,-3 (ix)
   6967 36 00         [10] 5587 	ld	(hl),#0x00
   6969 13            [ 6] 5588 	inc	de
   696A 13            [ 6] 5589 	inc	de
   696B DD 73 FE      [19] 5590 	ld	-2 (ix),e
   696E DD 72 FF      [19] 5591 	ld	-1 (ix),d
   6971 DD 6E FE      [19] 5592 	ld	l,-2 (ix)
   6974 DD 66 FF      [19] 5593 	ld	h,-1 (ix)
   6977 36 00         [10] 5594 	ld	(hl),#0x00
                           5595 ;src/main.c:334: bound =0;
   6979 21 00 73      [10] 5596 	ld	hl,#_bound + 0
   697C 36 00         [10] 5597 	ld	(hl), #0x00
                           5598 ;src/main.c:335: temp = 0;
   697E 21 F9 72      [10] 5599 	ld	hl,#_temp + 0
   6981 36 00         [10] 5600 	ld	(hl), #0x00
                           5601 ;src/main.c:336: map = 1;
   6983 21 FA 72      [10] 5602 	ld	hl,#_map + 0
   6986 36 01         [10] 5603 	ld	(hl), #0x01
                           5604 ;src/main.c:337: arrow =0;
   6988 21 FD 72      [10] 5605 	ld	hl,#_arrow + 0
   698B 36 00         [10] 5606 	ld	(hl), #0x00
                           5607 ;src/main.c:338: finish =0;
   698D 21 FC 72      [10] 5608 	ld	hl,#_finish + 0
   6990 36 00         [10] 5609 	ld	(hl), #0x00
                           5610 ;src/main.c:339: following =0;
   6992 21 FF 72      [10] 5611 	ld	hl,#_following + 0
   6995 36 00         [10] 5612 	ld	(hl), #0x00
                           5613 ;src/main.c:340: archer = 0;
   6997 21 02 73      [10] 5614 	ld	hl,#_archer + 0
   699A 36 00         [10] 5615 	ld	(hl), #0x00
                           5616 ;src/main.c:342: initPlayer();
   699C CD 98 58      [17] 5617 	call	_initPlayer
                           5618 ;src/main.c:343: initEnemies();
   699F CD CE 58      [17] 5619 	call	_initEnemies
                           5620 ;src/main.c:345: cpct_clearScreen(0);
   69A2 21 00 40      [10] 5621 	ld	hl,#0x4000
   69A5 E5            [11] 5622 	push	hl
   69A6 AF            [ 4] 5623 	xor	a, a
   69A7 F5            [11] 5624 	push	af
   69A8 33            [ 6] 5625 	inc	sp
   69A9 26 C0         [ 7] 5626 	ld	h, #0xC0
   69AB E5            [11] 5627 	push	hl
   69AC CD 20 70      [17] 5628 	call	_cpct_memset
                           5629 ;src/main.c:346: drawMap(map);
   69AF 3A FA 72      [13] 5630 	ld	a,(_map)
   69B2 F5            [11] 5631 	push	af
   69B3 33            [ 6] 5632 	inc	sp
   69B4 CD C0 46      [17] 5633 	call	_drawMap
   69B7 33            [ 6] 5634 	inc	sp
                           5635 ;src/main.c:348: while (1){
   69B8 DD 7E FE      [19] 5636 	ld	a,-2 (ix)
   69BB DD 77 F8      [19] 5637 	ld	-8 (ix),a
   69BE DD 7E FF      [19] 5638 	ld	a,-1 (ix)
   69C1 DD 77 F9      [19] 5639 	ld	-7 (ix),a
   69C4 DD 7E FC      [19] 5640 	ld	a,-4 (ix)
   69C7 DD 77 FA      [19] 5641 	ld	-6 (ix),a
   69CA DD 7E FD      [19] 5642 	ld	a,-3 (ix)
   69CD DD 77 FB      [19] 5643 	ld	-5 (ix),a
   69D0                    5644 00135$:
                           5645 ;src/main.c:351: cpct_waitVSYNC();
   69D0 CD 06 70      [17] 5646 	call	_cpct_waitVSYNC
                           5647 ;src/main.c:354: erases();
   69D3 CD D1 4D      [17] 5648 	call	_erases
                           5649 ;src/main.c:357: if(temp == 10)
   69D6 3A F9 72      [13] 5650 	ld	a,(#_temp + 0)
   69D9 D6 0A         [ 7] 5651 	sub	a, #0x0A
   69DB 20 1C         [12] 5652 	jr	NZ,00102$
                           5653 ;src/main.c:358: drawPickUps(n.corazon,n.bullet);
   69DD DD 6E FE      [19] 5654 	ld	l,-2 (ix)
   69E0 DD 66 FF      [19] 5655 	ld	h,-1 (ix)
   69E3 7E            [ 7] 5656 	ld	a,(hl)
   69E4 DD 77 F7      [19] 5657 	ld	-9 (ix),a
   69E7 DD 6E FC      [19] 5658 	ld	l,-4 (ix)
   69EA DD 66 FD      [19] 5659 	ld	h,-3 (ix)
   69ED 56            [ 7] 5660 	ld	d,(hl)
   69EE DD 7E F7      [19] 5661 	ld	a,-9 (ix)
   69F1 F5            [11] 5662 	push	af
   69F2 33            [ 6] 5663 	inc	sp
   69F3 D5            [11] 5664 	push	de
   69F4 33            [ 6] 5665 	inc	sp
   69F5 CD B4 4F      [17] 5666 	call	_drawPickUps
   69F8 F1            [10] 5667 	pop	af
   69F9                    5668 00102$:
                           5669 ;src/main.c:361: draws();
   69F9 CD AE 4C      [17] 5670 	call	_draws
                           5671 ;src/main.c:364: if(temp == 10){
   69FC 3A F9 72      [13] 5672 	ld	a,(#_temp + 0)
   69FF D6 0A         [ 7] 5673 	sub	a, #0x0A
   6A01 20 2F         [12] 5674 	jr	NZ,00110$
                           5675 ;src/main.c:365: if(player.atk < 20) drawFatiga(player.atk,2);
   6A03 21 1F 73      [10] 5676 	ld	hl, #(_player + 0x0008) + 0
   6A06 56            [ 7] 5677 	ld	d,(hl)
   6A07 7A            [ 4] 5678 	ld	a,d
   6A08 D6 14         [ 7] 5679 	sub	a, #0x14
   6A0A 30 0C         [12] 5680 	jr	NC,00107$
   6A0C 3E 02         [ 7] 5681 	ld	a,#0x02
   6A0E F5            [11] 5682 	push	af
   6A0F 33            [ 6] 5683 	inc	sp
   6A10 D5            [11] 5684 	push	de
   6A11 33            [ 6] 5685 	inc	sp
   6A12 CD 8E 4E      [17] 5686 	call	_drawFatiga
   6A15 F1            [10] 5687 	pop	af
   6A16 18 1A         [12] 5688 	jr	00110$
   6A18                    5689 00107$:
                           5690 ;src/main.c:366: else if(player.atk > 20) drawFatiga(player.atk,1);
   6A18 3E 14         [ 7] 5691 	ld	a,#0x14
   6A1A 92            [ 4] 5692 	sub	a, d
   6A1B 30 0C         [12] 5693 	jr	NC,00104$
   6A1D 3E 01         [ 7] 5694 	ld	a,#0x01
   6A1F F5            [11] 5695 	push	af
   6A20 33            [ 6] 5696 	inc	sp
   6A21 D5            [11] 5697 	push	de
   6A22 33            [ 6] 5698 	inc	sp
   6A23 CD 8E 4E      [17] 5699 	call	_drawFatiga
   6A26 F1            [10] 5700 	pop	af
   6A27 18 09         [12] 5701 	jr	00110$
   6A29                    5702 00104$:
                           5703 ;src/main.c:367: else drawFatiga(player.atk,0);
   6A29 AF            [ 4] 5704 	xor	a, a
   6A2A F5            [11] 5705 	push	af
   6A2B 33            [ 6] 5706 	inc	sp
   6A2C D5            [11] 5707 	push	de
   6A2D 33            [ 6] 5708 	inc	sp
   6A2E CD 8E 4E      [17] 5709 	call	_drawFatiga
   6A31 F1            [10] 5710 	pop	af
   6A32                    5711 00110$:
                           5712 ;src/main.c:372: if(temp%2 == 0){
   6A32 FD 21 F9 72   [14] 5713 	ld	iy,#_temp
   6A36 FD CB 00 46   [20] 5714 	bit	0, 0 (iy)
   6A3A 20 0D         [12] 5715 	jr	NZ,00112$
                           5716 ;src/main.c:373: player.lx = player.x;
   6A3C 3A 17 73      [13] 5717 	ld	a, (#_player + 0)
   6A3F 21 19 73      [10] 5718 	ld	hl,#(_player + 0x0002)
   6A42 77            [ 7] 5719 	ld	(hl),a
                           5720 ;src/main.c:374: player.ly = player.y;
   6A43 3A 18 73      [13] 5721 	ld	a, (#(_player + 0x0001) + 0)
   6A46 32 1A 73      [13] 5722 	ld	(#(_player + 0x0003)),a
   6A49                    5723 00112$:
                           5724 ;src/main.c:377: if(enemy.life > 0){
   6A49 21 2A 73      [10] 5725 	ld	hl, #(_enemy + 0x0008) + 0
   6A4C 6E            [ 7] 5726 	ld	l,(hl)
                           5727 ;src/main.c:380: enemy.ly = enemy.y;
                           5728 ;src/main.c:387: enemy.x = enemy.ox;
                           5729 ;src/main.c:388: enemy.y = enemy.oy;
                           5730 ;src/main.c:377: if(enemy.life > 0){
   6A4D 7D            [ 4] 5731 	ld	a,l
   6A4E B7            [ 4] 5732 	or	a, a
   6A4F 28 76         [12] 5733 	jr	Z,00119$
                           5734 ;src/main.c:378: if(temp%2 == 1){
   6A51 3A F9 72      [13] 5735 	ld	a,(#_temp + 0)
   6A54 E6 01         [ 7] 5736 	and	a, #0x01
   6A56 3D            [ 4] 5737 	dec	a
   6A57 20 0D         [12] 5738 	jr	NZ,00114$
                           5739 ;src/main.c:379: enemy.lx = enemy.x;
   6A59 3A 22 73      [13] 5740 	ld	a, (#_enemy + 0)
   6A5C 32 24 73      [13] 5741 	ld	(#(_enemy + 0x0002)),a
                           5742 ;src/main.c:380: enemy.ly = enemy.y;
   6A5F 11 25 73      [10] 5743 	ld	de,#_enemy + 3
   6A62 3A 23 73      [13] 5744 	ld	a, (#(_enemy + 0x0001) + 0)
   6A65 12            [ 7] 5745 	ld	(de),a
   6A66                    5746 00114$:
                           5747 ;src/main.c:383: move();
   6A66 CD 74 68      [17] 5748 	call	_move
                           5749 ;src/main.c:385: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   6A69 21 1F 73      [10] 5750 	ld	hl, #(_player + 0x0008) + 0
   6A6C 56            [ 7] 5751 	ld	d,(hl)
   6A6D 3A 23 73      [13] 5752 	ld	a, (#(_enemy + 0x0001) + 0)
   6A70 21 22 73      [10] 5753 	ld	hl, #_enemy + 0
   6A73 5E            [ 7] 5754 	ld	e,(hl)
   6A74 21 18 73      [10] 5755 	ld	hl, #(_player + 0x0001) + 0
   6A77 46            [ 7] 5756 	ld	b,(hl)
   6A78 21 17 73      [10] 5757 	ld	hl, #_player + 0
   6A7B 4E            [ 7] 5758 	ld	c,(hl)
   6A7C D5            [11] 5759 	push	de
   6A7D 33            [ 6] 5760 	inc	sp
   6A7E 57            [ 4] 5761 	ld	d,a
   6A7F D5            [11] 5762 	push	de
   6A80 C5            [11] 5763 	push	bc
   6A81 CD 92 52      [17] 5764 	call	_checkCollisions
   6A84 F1            [10] 5765 	pop	af
   6A85 F1            [10] 5766 	pop	af
   6A86 33            [ 6] 5767 	inc	sp
   6A87 7D            [ 4] 5768 	ld	a,l
   6A88 3D            [ 4] 5769 	dec	a
   6A89 28 07         [12] 5770 	jr	Z,00115$
   6A8B 7D            [ 4] 5771 	ld	a,l
   6A8C D6 02         [ 7] 5772 	sub	a, #0x02
   6A8E 28 1D         [12] 5773 	jr	Z,00116$
   6A90 18 35         [12] 5774 	jr	00119$
                           5775 ;src/main.c:386: case 1:
   6A92                    5776 00115$:
                           5777 ;src/main.c:387: enemy.x = enemy.ox;
   6A92 3A 26 73      [13] 5778 	ld	a, (#(_enemy + 0x0004) + 0)
   6A95 32 22 73      [13] 5779 	ld	(#_enemy),a
                           5780 ;src/main.c:388: enemy.y = enemy.oy;
   6A98 3A 27 73      [13] 5781 	ld	a, (#(_enemy + 0x0005) + 0)
   6A9B 32 23 73      [13] 5782 	ld	(#(_enemy + 0x0001)),a
                           5783 ;src/main.c:389: enemy.life -= 1;
   6A9E 3A 2A 73      [13] 5784 	ld	a, (#(_enemy + 0x0008) + 0)
   6AA1 C6 FF         [ 7] 5785 	add	a,#0xFF
   6AA3 32 2A 73      [13] 5786 	ld	(#(_enemy + 0x0008)),a
                           5787 ;src/main.c:390: player.atk = 20;
   6AA6 21 1F 73      [10] 5788 	ld	hl,#(_player + 0x0008)
   6AA9 36 14         [10] 5789 	ld	(hl),#0x14
                           5790 ;src/main.c:391: break;
   6AAB 18 1A         [12] 5791 	jr	00119$
                           5792 ;src/main.c:392: case 2:
   6AAD                    5793 00116$:
                           5794 ;src/main.c:393: player.x = 0;
   6AAD 21 17 73      [10] 5795 	ld	hl,#_player
   6AB0 36 00         [10] 5796 	ld	(hl),#0x00
                           5797 ;src/main.c:394: player.y = 80;
   6AB2 21 18 73      [10] 5798 	ld	hl,#(_player + 0x0001)
   6AB5 36 50         [10] 5799 	ld	(hl),#0x50
                           5800 ;src/main.c:395: player.life -= 1;
   6AB7 21 1D 73      [10] 5801 	ld	hl,#_player + 6
   6ABA 56            [ 7] 5802 	ld	d,(hl)
   6ABB 15            [ 4] 5803 	dec	d
   6ABC 72            [ 7] 5804 	ld	(hl),d
                           5805 ;src/main.c:396: player.atk = 20;
   6ABD 21 1F 73      [10] 5806 	ld	hl,#(_player + 0x0008)
   6AC0 36 14         [10] 5807 	ld	(hl),#0x14
                           5808 ;src/main.c:397: enemy.pursue = 0;
   6AC2 21 30 73      [10] 5809 	ld	hl,#_enemy + 14
   6AC5 36 00         [10] 5810 	ld	(hl),#0x00
                           5811 ;src/main.c:399: }
   6AC7                    5812 00119$:
                           5813 ;src/main.c:401: if(temp > 10)
   6AC7 3E 0A         [ 7] 5814 	ld	a,#0x0A
   6AC9 FD 21 F9 72   [14] 5815 	ld	iy,#_temp
   6ACD FD 96 00      [19] 5816 	sub	a, 0 (iy)
   6AD0 30 08         [12] 5817 	jr	NC,00121$
                           5818 ;src/main.c:402: temp = 0;
   6AD2 FD 21 F9 72   [14] 5819 	ld	iy,#_temp
   6AD6 FD 36 00 00   [19] 5820 	ld	0 (iy),#0x00
   6ADA                    5821 00121$:
                           5822 ;src/main.c:403: temp += 1;
   6ADA FD 21 F9 72   [14] 5823 	ld	iy,#_temp
   6ADE FD 34 00      [23] 5824 	inc	0 (iy)
                           5825 ;src/main.c:404: player.latk = player.atk;
   6AE1 11 20 73      [10] 5826 	ld	de,#_player + 9
   6AE4 3A 1F 73      [13] 5827 	ld	a, (#(_player + 0x0008) + 0)
   6AE7 12            [ 7] 5828 	ld	(de),a
                           5829 ;src/main.c:409: cpct_scanKeyboard_f();
   6AE8 CD 51 6D      [17] 5830 	call	_cpct_scanKeyboard_f
                           5831 ;src/main.c:410: player.sprite = checkKeyboard();
   6AEB CD FC 55      [17] 5832 	call	_checkKeyboard
   6AEE 5D            [ 4] 5833 	ld	e,l
   6AEF 54            [ 4] 5834 	ld	d,h
   6AF0 ED 53 1B 73   [20] 5835 	ld	((_player + 0x0004)), de
                           5836 ;src/main.c:411: checkBoundsCollisions(&n.corazon,&n.bullet);
   6AF4 DD 6E F8      [19] 5837 	ld	l,-8 (ix)
   6AF7 DD 66 F9      [19] 5838 	ld	h,-7 (ix)
   6AFA DD 5E FA      [19] 5839 	ld	e,-6 (ix)
   6AFD DD 56 FB      [19] 5840 	ld	d,-5 (ix)
   6B00 E5            [11] 5841 	push	hl
   6B01 D5            [11] 5842 	push	de
   6B02 CD 2D 5E      [17] 5843 	call	_checkBoundsCollisions
   6B05 F1            [10] 5844 	pop	af
   6B06 F1            [10] 5845 	pop	af
                           5846 ;src/main.c:413: if(arrow == 1){
   6B07 3A FD 72      [13] 5847 	ld	a,(#_arrow + 0)
   6B0A 3D            [ 4] 5848 	dec	a
   6B0B 20 70         [12] 5849 	jr	NZ,00131$
                           5850 ;src/main.c:414: moveObject(0);
   6B0D AF            [ 4] 5851 	xor	a, a
   6B0E F5            [11] 5852 	push	af
   6B0F 33            [ 6] 5853 	inc	sp
   6B10 CD 55 5B      [17] 5854 	call	_moveObject
   6B13 33            [ 6] 5855 	inc	sp
                           5856 ;src/main.c:415: bound = checkArrowCollisions();
   6B14 CD B3 53      [17] 5857 	call	_checkArrowCollisions
   6B17 FD 21 00 73   [14] 5858 	ld	iy,#_bound
   6B1B FD 75 00      [19] 5859 	ld	0 (iy),l
                           5860 ;src/main.c:416: if(parrow.dir == 2 || parrow.dir == 8)
   6B1E 3A 0A 73      [13] 5861 	ld	a,(#_parrow + 7)
   6B21 FE 02         [ 7] 5862 	cp	a,#0x02
   6B23 28 04         [12] 5863 	jr	Z,00122$
   6B25 D6 08         [ 7] 5864 	sub	a, #0x08
   6B27 20 04         [12] 5865 	jr	NZ,00123$
   6B29                    5866 00122$:
                           5867 ;src/main.c:417: atkObj = 21;
   6B29 06 15         [ 7] 5868 	ld	b,#0x15
   6B2B 18 02         [12] 5869 	jr	00124$
   6B2D                    5870 00123$:
                           5871 ;src/main.c:419: atkObj = 22;
   6B2D 06 16         [ 7] 5872 	ld	b,#0x16
   6B2F                    5873 00124$:
                           5874 ;src/main.c:420: if(enemy.life > 0 && checkCollisions(parrow.x, parrow.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
   6B2F 3A 2A 73      [13] 5875 	ld	a, (#(_enemy + 0x0008) + 0)
   6B32 B7            [ 4] 5876 	or	a, a
   6B33 28 48         [12] 5877 	jr	Z,00131$
   6B35 3A 23 73      [13] 5878 	ld	a, (#(_enemy + 0x0001) + 0)
   6B38 21 22 73      [10] 5879 	ld	hl, #_enemy + 0
   6B3B 4E            [ 7] 5880 	ld	c,(hl)
   6B3C 21 04 73      [10] 5881 	ld	hl, #_parrow + 1
   6B3F 5E            [ 7] 5882 	ld	e,(hl)
   6B40 21 03 73      [10] 5883 	ld	hl, #_parrow + 0
   6B43 56            [ 7] 5884 	ld	d,(hl)
   6B44 C5            [11] 5885 	push	bc
   6B45 33            [ 6] 5886 	inc	sp
   6B46 F5            [11] 5887 	push	af
   6B47 33            [ 6] 5888 	inc	sp
   6B48 79            [ 4] 5889 	ld	a,c
   6B49 F5            [11] 5890 	push	af
   6B4A 33            [ 6] 5891 	inc	sp
   6B4B 7B            [ 4] 5892 	ld	a,e
   6B4C F5            [11] 5893 	push	af
   6B4D 33            [ 6] 5894 	inc	sp
   6B4E D5            [11] 5895 	push	de
   6B4F 33            [ 6] 5896 	inc	sp
   6B50 CD 92 52      [17] 5897 	call	_checkCollisions
   6B53 F1            [10] 5898 	pop	af
   6B54 F1            [10] 5899 	pop	af
   6B55 33            [ 6] 5900 	inc	sp
   6B56 2D            [ 4] 5901 	dec	l
   6B57 20 24         [12] 5902 	jr	NZ,00131$
   6B59 3A 00 73      [13] 5903 	ld	a,(#_bound + 0)
   6B5C B7            [ 4] 5904 	or	a, a
   6B5D 20 1E         [12] 5905 	jr	NZ,00131$
                           5906 ;src/main.c:421: enemy.life -= 1;
   6B5F 3A 2A 73      [13] 5907 	ld	a, (#(_enemy + 0x0008) + 0)
   6B62 C6 FF         [ 7] 5908 	add	a,#0xFF
   6B64 32 2A 73      [13] 5909 	ld	(#(_enemy + 0x0008)),a
                           5910 ;src/main.c:422: enemy.x = enemy.ox;
   6B67 3A 26 73      [13] 5911 	ld	a, (#(_enemy + 0x0004) + 0)
   6B6A 32 22 73      [13] 5912 	ld	(#_enemy),a
                           5913 ;src/main.c:423: enemy.y = enemy.oy;
   6B6D 3A 27 73      [13] 5914 	ld	a, (#(_enemy + 0x0005) + 0)
   6B70 32 23 73      [13] 5915 	ld	(#(_enemy + 0x0001)),a
                           5916 ;src/main.c:424: parrow.vivo = 0;
   6B73 21 09 73      [10] 5917 	ld	hl,#_parrow + 6
   6B76 36 00         [10] 5918 	ld	(hl),#0x00
                           5919 ;src/main.c:425: bound = 1;
   6B78 21 00 73      [10] 5920 	ld	hl,#_bound + 0
   6B7B 36 01         [10] 5921 	ld	(hl), #0x01
   6B7D                    5922 00131$:
                           5923 ;src/main.c:428: if(finish == 1) return;
   6B7D 3A FC 72      [13] 5924 	ld	a,(#_finish + 0)
   6B80 3D            [ 4] 5925 	dec	a
   6B81 C2 D0 69      [10] 5926 	jp	NZ,00135$
   6B84 DD F9         [10] 5927 	ld	sp, ix
   6B86 DD E1         [14] 5928 	pop	ix
   6B88 C9            [10] 5929 	ret
                           5930 ;src/main.c:435: void credits(){
                           5931 ;	---------------------------------
                           5932 ; Function credits
                           5933 ; ---------------------------------
   6B89                    5934 _credits::
                           5935 ;src/main.c:437: cpct_clearScreen(0);
   6B89 21 00 40      [10] 5936 	ld	hl,#0x4000
   6B8C E5            [11] 5937 	push	hl
   6B8D AF            [ 4] 5938 	xor	a, a
   6B8E F5            [11] 5939 	push	af
   6B8F 33            [ 6] 5940 	inc	sp
   6B90 26 C0         [ 7] 5941 	ld	h, #0xC0
   6B92 E5            [11] 5942 	push	hl
   6B93 CD 20 70      [17] 5943 	call	_cpct_memset
                           5944 ;src/main.c:438: memptr = cpct_getScreenPtr(VMEM,10,10);
   6B96 21 0A 0A      [10] 5945 	ld	hl,#0x0A0A
   6B99 E5            [11] 5946 	push	hl
   6B9A 21 00 C0      [10] 5947 	ld	hl,#0xC000
   6B9D E5            [11] 5948 	push	hl
   6B9E CD 13 71      [17] 5949 	call	_cpct_getScreenPtr
                           5950 ;src/main.c:439: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6BA1 EB            [ 4] 5951 	ex	de,hl
   6BA2 01 EB 6B      [10] 5952 	ld	bc,#___str_5
   6BA5 D5            [11] 5953 	push	de
   6BA6 21 01 00      [10] 5954 	ld	hl,#0x0001
   6BA9 E5            [11] 5955 	push	hl
   6BAA D5            [11] 5956 	push	de
   6BAB C5            [11] 5957 	push	bc
   6BAC CD 32 6E      [17] 5958 	call	_cpct_drawStringM0
   6BAF 21 06 00      [10] 5959 	ld	hl,#6
   6BB2 39            [11] 5960 	add	hl,sp
   6BB3 F9            [ 6] 5961 	ld	sp,hl
   6BB4 D1            [10] 5962 	pop	de
                           5963 ;src/main.c:441: while (1){
   6BB5                    5964 00104$:
                           5965 ;src/main.c:443: cpct_scanKeyboard_f();
   6BB5 D5            [11] 5966 	push	de
   6BB6 CD 51 6D      [17] 5967 	call	_cpct_scanKeyboard_f
   6BB9 D1            [10] 5968 	pop	de
                           5969 ;src/main.c:444: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   6BBA 01 FC 6B      [10] 5970 	ld	bc,#___str_6
   6BBD D5            [11] 5971 	push	de
   6BBE 21 01 00      [10] 5972 	ld	hl,#0x0001
   6BC1 E5            [11] 5973 	push	hl
   6BC2 D5            [11] 5974 	push	de
   6BC3 C5            [11] 5975 	push	bc
   6BC4 CD 32 6E      [17] 5976 	call	_cpct_drawStringM0
   6BC7 21 06 00      [10] 5977 	ld	hl,#6
   6BCA 39            [11] 5978 	add	hl,sp
   6BCB F9            [ 6] 5979 	ld	sp,hl
   6BCC D1            [10] 5980 	pop	de
                           5981 ;src/main.c:445: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   6BCD 01 12 6C      [10] 5982 	ld	bc,#___str_7
   6BD0 D5            [11] 5983 	push	de
   6BD1 21 01 00      [10] 5984 	ld	hl,#0x0001
   6BD4 E5            [11] 5985 	push	hl
   6BD5 D5            [11] 5986 	push	de
   6BD6 C5            [11] 5987 	push	bc
   6BD7 CD 32 6E      [17] 5988 	call	_cpct_drawStringM0
   6BDA 21 06 00      [10] 5989 	ld	hl,#6
   6BDD 39            [11] 5990 	add	hl,sp
   6BDE F9            [ 6] 5991 	ld	sp,hl
   6BDF 21 08 04      [10] 5992 	ld	hl,#0x0408
   6BE2 CD 45 6D      [17] 5993 	call	_cpct_isKeyPressed
   6BE5 7D            [ 4] 5994 	ld	a,l
   6BE6 D1            [10] 5995 	pop	de
   6BE7 B7            [ 4] 5996 	or	a, a
   6BE8 28 CB         [12] 5997 	jr	Z,00104$
                           5998 ;src/main.c:449: return;
   6BEA C9            [10] 5999 	ret
   6BEB                    6000 ___str_5:
   6BEB 4C 6F 75 6E 67 65  6001 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   6BFB 00                 6002 	.db 0x00
   6BFC                    6003 ___str_6:
   6BFC 4A 6F 73 65 70 20  6004 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   6C11 00                 6005 	.db 0x00
   6C12                    6006 ___str_7:
   6C12 41 6C 62 65 72 74  6007 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   6C2B 00                 6008 	.db 0x00
                           6009 ;src/main.c:459: void main(void) {
                           6010 ;	---------------------------------
                           6011 ; Function main
                           6012 ; ---------------------------------
   6C2C                    6013 _main::
                           6014 ;src/main.c:463: init();
   6C2C CD 73 58      [17] 6015 	call	_init
                           6016 ;src/main.c:466: while(1){
   6C2F                    6017 00106$:
                           6018 ;src/main.c:467: x=menu();
   6C2F CD 44 59      [17] 6019 	call	_menu
   6C32 5D            [ 4] 6020 	ld	e, l
   6C33 54            [ 4] 6021 	ld	d, h
                           6022 ;src/main.c:468: switch(x){
   6C34 CB 7A         [ 8] 6023 	bit	7, d
   6C36 20 F7         [12] 6024 	jr	NZ,00106$
   6C38 3E 02         [ 7] 6025 	ld	a,#0x02
   6C3A BB            [ 4] 6026 	cp	a, e
   6C3B 3E 00         [ 7] 6027 	ld	a,#0x00
   6C3D 9A            [ 4] 6028 	sbc	a, d
   6C3E E2 43 6C      [10] 6029 	jp	PO, 00122$
   6C41 EE 80         [ 7] 6030 	xor	a, #0x80
   6C43                    6031 00122$:
   6C43 FA 2F 6C      [10] 6032 	jp	M,00106$
   6C46 16 00         [ 7] 6033 	ld	d,#0x00
   6C48 21 4E 6C      [10] 6034 	ld	hl,#00123$
   6C4B 19            [11] 6035 	add	hl,de
   6C4C 19            [11] 6036 	add	hl,de
                           6037 ;src/main.c:469: case 0: return;break;
                           6038 ;src/main.c:470: case 1: game(); break;
   6C4D E9            [ 4] 6039 	jp	(hl)
   6C4E                    6040 00123$:
   6C4E 18 10         [12] 6041 	jr	00108$
   6C50 18 04         [12] 6042 	jr	00102$
   6C52 18 07         [12] 6043 	jr	00103$
   6C54 18 0A         [12] 6044 	jr	00108$
   6C56                    6045 00102$:
   6C56 CD 41 69      [17] 6046 	call	_game
   6C59 18 D4         [12] 6047 	jr	00106$
                           6048 ;src/main.c:471: case 2: credits();break;
   6C5B                    6049 00103$:
   6C5B CD 89 6B      [17] 6050 	call	_credits
                           6051 ;src/main.c:472: }
   6C5E 18 CF         [12] 6052 	jr	00106$
   6C60                    6053 00108$:
   6C60 C9            [10] 6054 	ret
                           6055 	.area _CODE
                           6056 	.area _INITIALIZER
                           6057 	.area _CABS (ABS)
