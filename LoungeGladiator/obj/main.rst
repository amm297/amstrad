                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Thu Oct 22 12:48:52 2015
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
                             16 	.globl _patrol
                             17 	.globl _followPlayer
                             18 	.globl _checkArrowCollisions
                             19 	.globl _checkBoundsCollisions
                             20 	.globl _checkBoundsCollisionsEnemy
                             21 	.globl _menu
                             22 	.globl _gameOver
                             23 	.globl _initEnemies
                             24 	.globl _initPlayer
                             25 	.globl _init
                             26 	.globl _moveObject
                             27 	.globl _checkKeyboard
                             28 	.globl _checkCollisions
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
                             60 	.globl _object
                             61 	.globl _archer
                             62 	.globl _bound
                             63 	.globl _following
                             64 	.globl _arrow
                             65 	.globl _finish
                             66 	.globl _path
                             67 	.globl _map
                             68 	.globl _temp
                             69 	.globl _scene
                             70 	.globl _mapa2
                             71 	.globl _mapa1
                             72 	.globl _origins
                             73 	.globl _g_palette
                             74 ;--------------------------------------------------------
                             75 ; special function registers
                             76 ;--------------------------------------------------------
                             77 ;--------------------------------------------------------
                             78 ; ram data
                             79 ;--------------------------------------------------------
                             80 	.area _DATA
   7125                      81 _scene::
   7125                      82 	.ds 240
   7215                      83 _temp::
   7215                      84 	.ds 1
   7216                      85 _map::
   7216                      86 	.ds 1
   7217                      87 _path::
   7217                      88 	.ds 1
   7218                      89 _finish::
   7218                      90 	.ds 1
   7219                      91 _arrow::
   7219                      92 	.ds 1
   721A                      93 _following::
   721A                      94 	.ds 1
   721B                      95 _bound::
   721B                      96 	.ds 1
   721C                      97 _archer::
   721C                      98 	.ds 1
   721D                      99 _object::
   721D                     100 	.ds 10
   7227                     101 _player::
   7227                     102 	.ds 11
   7232                     103 _enemy::
   7232                     104 	.ds 15
                            105 ;--------------------------------------------------------
                            106 ; ram data
                            107 ;--------------------------------------------------------
                            108 	.area _INITIALIZED
                            109 ;--------------------------------------------------------
                            110 ; absolute external ram data
                            111 ;--------------------------------------------------------
                            112 	.area _DABS (ABS)
                            113 ;--------------------------------------------------------
                            114 ; global & static initialisations
                            115 ;--------------------------------------------------------
                            116 	.area _HOME
                            117 	.area _GSINIT
                            118 	.area _GSFINAL
                            119 	.area _GSINIT
                            120 ;--------------------------------------------------------
                            121 ; Home
                            122 ;--------------------------------------------------------
                            123 	.area _HOME
                            124 	.area _HOME
                            125 ;--------------------------------------------------------
                            126 ; code
                            127 ;--------------------------------------------------------
                            128 	.area _CODE
                            129 ;src/draws.h:14: void drawMap(u8 t){
                            130 ;	---------------------------------
                            131 ; Function drawMap
                            132 ; ---------------------------------
   46C0                     133 _drawMap::
   46C0 DD E5         [15]  134 	push	ix
   46C2 DD 21 00 00   [14]  135 	ld	ix,#0
   46C6 DD 39         [15]  136 	add	ix,sp
   46C8 21 F0 FF      [10]  137 	ld	hl,#-16
   46CB 39            [11]  138 	add	hl,sp
   46CC F9            [ 6]  139 	ld	sp,hl
                            140 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  141 	ld	a,4 (ix)
   46D0 3D            [ 4]  142 	dec	a
   46D1 C2 79 47      [10]  143 	jp	NZ,00104$
                            144 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  145 	ld	hl,#0x0000
   46D7 E3            [19]  146 	ex	(sp), hl
   46D8 DD 36 F8 00   [19]  147 	ld	-8 (ix),#0x00
   46DC DD 36 F9 00   [19]  148 	ld	-7 (ix),#0x00
                            149 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     150 00130$:
   46E0 3E 25         [ 7]  151 	ld	a,#<(_scene)
   46E2 DD 86 F8      [19]  152 	add	a, -8 (ix)
   46E5 DD 77 FE      [19]  153 	ld	-2 (ix),a
   46E8 3E 71         [ 7]  154 	ld	a,#>(_scene)
   46EA DD 8E F9      [19]  155 	adc	a, -7 (ix)
   46ED DD 77 FF      [19]  156 	ld	-1 (ix),a
   46F0 3E 17         [ 7]  157 	ld	a,#<(_mapa1)
   46F2 DD 86 F8      [19]  158 	add	a, -8 (ix)
   46F5 DD 77 FA      [19]  159 	ld	-6 (ix),a
   46F8 3E 49         [ 7]  160 	ld	a,#>(_mapa1)
   46FA DD 8E F9      [19]  161 	adc	a, -7 (ix)
   46FD DD 77 FB      [19]  162 	ld	-5 (ix),a
   4700 DD 36 F2 00   [19]  163 	ld	-14 (ix),#0x00
   4704 DD 36 F3 00   [19]  164 	ld	-13 (ix),#0x00
   4708                     165 00115$:
                            166 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E FE      [19]  167 	ld	a,-2 (ix)
   470B DD 86 F2      [19]  168 	add	a, -14 (ix)
   470E DD 77 FC      [19]  169 	ld	-4 (ix),a
   4711 DD 7E FF      [19]  170 	ld	a,-1 (ix)
   4714 DD 8E F3      [19]  171 	adc	a, -13 (ix)
   4717 DD 77 FD      [19]  172 	ld	-3 (ix),a
   471A DD 7E FA      [19]  173 	ld	a,-6 (ix)
   471D DD 86 F2      [19]  174 	add	a, -14 (ix)
   4720 DD 77 F6      [19]  175 	ld	-10 (ix),a
   4723 DD 7E FB      [19]  176 	ld	a,-5 (ix)
   4726 DD 8E F3      [19]  177 	adc	a, -13 (ix)
   4729 DD 77 F7      [19]  178 	ld	-9 (ix),a
   472C DD 6E F6      [19]  179 	ld	l,-10 (ix)
   472F DD 66 F7      [19]  180 	ld	h,-9 (ix)
   4732 7E            [ 7]  181 	ld	a,(hl)
   4733 DD 6E FC      [19]  182 	ld	l,-4 (ix)
   4736 DD 66 FD      [19]  183 	ld	h,-3 (ix)
   4739 77            [ 7]  184 	ld	(hl),a
                            185 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F2      [23]  186 	inc	-14 (ix)
   473D 20 03         [12]  187 	jr	NZ,00189$
   473F DD 34 F3      [23]  188 	inc	-13 (ix)
   4742                     189 00189$:
   4742 DD 7E F2      [19]  190 	ld	a,-14 (ix)
   4745 D6 14         [ 7]  191 	sub	a, #0x14
   4747 DD 7E F3      [19]  192 	ld	a,-13 (ix)
   474A 17            [ 4]  193 	rla
   474B 3F            [ 4]  194 	ccf
   474C 1F            [ 4]  195 	rra
   474D DE 80         [ 7]  196 	sbc	a, #0x80
   474F 38 B7         [12]  197 	jr	C,00115$
                            198 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E F8      [19]  199 	ld	a,-8 (ix)
   4754 C6 14         [ 7]  200 	add	a, #0x14
   4756 DD 77 F8      [19]  201 	ld	-8 (ix),a
   4759 DD 7E F9      [19]  202 	ld	a,-7 (ix)
   475C CE 00         [ 7]  203 	adc	a, #0x00
   475E DD 77 F9      [19]  204 	ld	-7 (ix),a
   4761 DD 34 F0      [23]  205 	inc	-16 (ix)
   4764 20 03         [12]  206 	jr	NZ,00190$
   4766 DD 34 F1      [23]  207 	inc	-15 (ix)
   4769                     208 00190$:
   4769 DD 7E F0      [19]  209 	ld	a,-16 (ix)
   476C D6 0C         [ 7]  210 	sub	a, #0x0C
   476E DD 7E F1      [19]  211 	ld	a,-15 (ix)
   4771 17            [ 4]  212 	rla
   4772 3F            [ 4]  213 	ccf
   4773 1F            [ 4]  214 	rra
   4774 DE 80         [ 7]  215 	sbc	a, #0x80
   4776 DA E0 46      [10]  216 	jp	C,00130$
   4779                     217 00104$:
                            218 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  219 	ld	a,4 (ix)
   477C D6 02         [ 7]  220 	sub	a, #0x02
   477E C2 26 48      [10]  221 	jp	NZ,00141$
                            222 ;src/draws.h:27: for(y=0;y<height;y++){
   4781 21 00 00      [10]  223 	ld	hl,#0x0000
   4784 E3            [19]  224 	ex	(sp), hl
   4785 DD 36 F6 00   [19]  225 	ld	-10 (ix),#0x00
   4789 DD 36 F7 00   [19]  226 	ld	-9 (ix),#0x00
                            227 ;src/draws.h:28: for(x=0;x<width;x++){
   478D                     228 00134$:
   478D 3E 25         [ 7]  229 	ld	a,#<(_scene)
   478F DD 86 F6      [19]  230 	add	a, -10 (ix)
   4792 DD 77 FC      [19]  231 	ld	-4 (ix),a
   4795 3E 71         [ 7]  232 	ld	a,#>(_scene)
   4797 DD 8E F7      [19]  233 	adc	a, -9 (ix)
   479A DD 77 FD      [19]  234 	ld	-3 (ix),a
   479D 3E 07         [ 7]  235 	ld	a,#<(_mapa2)
   479F DD 86 F6      [19]  236 	add	a, -10 (ix)
   47A2 DD 77 FA      [19]  237 	ld	-6 (ix),a
   47A5 3E 4A         [ 7]  238 	ld	a,#>(_mapa2)
   47A7 DD 8E F7      [19]  239 	adc	a, -9 (ix)
   47AA DD 77 FB      [19]  240 	ld	-5 (ix),a
   47AD DD 36 F2 00   [19]  241 	ld	-14 (ix),#0x00
   47B1 DD 36 F3 00   [19]  242 	ld	-13 (ix),#0x00
   47B5                     243 00119$:
                            244 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   47B5 DD 7E FC      [19]  245 	ld	a,-4 (ix)
   47B8 DD 86 F2      [19]  246 	add	a, -14 (ix)
   47BB DD 77 FE      [19]  247 	ld	-2 (ix),a
   47BE DD 7E FD      [19]  248 	ld	a,-3 (ix)
   47C1 DD 8E F3      [19]  249 	adc	a, -13 (ix)
   47C4 DD 77 FF      [19]  250 	ld	-1 (ix),a
   47C7 DD 7E FA      [19]  251 	ld	a,-6 (ix)
   47CA DD 86 F2      [19]  252 	add	a, -14 (ix)
   47CD DD 77 F8      [19]  253 	ld	-8 (ix),a
   47D0 DD 7E FB      [19]  254 	ld	a,-5 (ix)
   47D3 DD 8E F3      [19]  255 	adc	a, -13 (ix)
   47D6 DD 77 F9      [19]  256 	ld	-7 (ix),a
   47D9 DD 6E F8      [19]  257 	ld	l,-8 (ix)
   47DC DD 66 F9      [19]  258 	ld	h,-7 (ix)
   47DF 7E            [ 7]  259 	ld	a,(hl)
   47E0 DD 6E FE      [19]  260 	ld	l,-2 (ix)
   47E3 DD 66 FF      [19]  261 	ld	h,-1 (ix)
   47E6 77            [ 7]  262 	ld	(hl),a
                            263 ;src/draws.h:28: for(x=0;x<width;x++){
   47E7 DD 34 F2      [23]  264 	inc	-14 (ix)
   47EA 20 03         [12]  265 	jr	NZ,00193$
   47EC DD 34 F3      [23]  266 	inc	-13 (ix)
   47EF                     267 00193$:
   47EF DD 7E F2      [19]  268 	ld	a,-14 (ix)
   47F2 D6 14         [ 7]  269 	sub	a, #0x14
   47F4 DD 7E F3      [19]  270 	ld	a,-13 (ix)
   47F7 17            [ 4]  271 	rla
   47F8 3F            [ 4]  272 	ccf
   47F9 1F            [ 4]  273 	rra
   47FA DE 80         [ 7]  274 	sbc	a, #0x80
   47FC 38 B7         [12]  275 	jr	C,00119$
                            276 ;src/draws.h:27: for(y=0;y<height;y++){
   47FE DD 7E F6      [19]  277 	ld	a,-10 (ix)
   4801 C6 14         [ 7]  278 	add	a, #0x14
   4803 DD 77 F6      [19]  279 	ld	-10 (ix),a
   4806 DD 7E F7      [19]  280 	ld	a,-9 (ix)
   4809 CE 00         [ 7]  281 	adc	a, #0x00
   480B DD 77 F7      [19]  282 	ld	-9 (ix),a
   480E DD 34 F0      [23]  283 	inc	-16 (ix)
   4811 20 03         [12]  284 	jr	NZ,00194$
   4813 DD 34 F1      [23]  285 	inc	-15 (ix)
   4816                     286 00194$:
   4816 DD 7E F0      [19]  287 	ld	a,-16 (ix)
   4819 D6 0C         [ 7]  288 	sub	a, #0x0C
   481B DD 7E F1      [19]  289 	ld	a,-15 (ix)
   481E 17            [ 4]  290 	rla
   481F 3F            [ 4]  291 	ccf
   4820 1F            [ 4]  292 	rra
   4821 DE 80         [ 7]  293 	sbc	a, #0x80
   4823 DA 8D 47      [10]  294 	jp	C,00134$
                            295 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   4826                     296 00141$:
   4826 01 00 00      [10]  297 	ld	bc,#0x0000
   4829 DD 36 F6 00   [19]  298 	ld	-10 (ix),#0x00
   482D DD 36 F7 00   [19]  299 	ld	-9 (ix),#0x00
   4831 11 00 00      [10]  300 	ld	de,#0x0000
                            301 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4834                     302 00139$:
   4834 21 25 71      [10]  303 	ld	hl,#_scene
   4837 19            [11]  304 	add	hl,de
   4838 DD 75 FC      [19]  305 	ld	-4 (ix),l
   483B DD 74 FD      [19]  306 	ld	-3 (ix),h
   483E DD 36 F4 00   [19]  307 	ld	-12 (ix),#0x00
   4842 DD 36 F5 00   [19]  308 	ld	-11 (ix),#0x00
   4846                     309 00123$:
                            310 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   4846 79            [ 4]  311 	ld	a,c
   4847 07            [ 4]  312 	rlca
   4848 07            [ 4]  313 	rlca
   4849 07            [ 4]  314 	rlca
   484A 07            [ 4]  315 	rlca
   484B E6 F0         [ 7]  316 	and	a,#0xF0
   484D 67            [ 4]  317 	ld	h,a
   484E DD 7E F4      [19]  318 	ld	a,-12 (ix)
   4851 87            [ 4]  319 	add	a, a
   4852 87            [ 4]  320 	add	a, a
   4853 C5            [11]  321 	push	bc
   4854 D5            [11]  322 	push	de
   4855 E5            [11]  323 	push	hl
   4856 33            [ 6]  324 	inc	sp
   4857 F5            [11]  325 	push	af
   4858 33            [ 6]  326 	inc	sp
   4859 21 00 C0      [10]  327 	ld	hl,#0xC000
   485C E5            [11]  328 	push	hl
   485D CD 2F 70      [17]  329 	call	_cpct_getScreenPtr
   4860 D1            [10]  330 	pop	de
   4861 C1            [10]  331 	pop	bc
   4862 E5            [11]  332 	push	hl
   4863 FD E1         [14]  333 	pop	iy
                            334 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4865 DD 7E FC      [19]  335 	ld	a,-4 (ix)
   4868 DD 86 F4      [19]  336 	add	a, -12 (ix)
   486B 6F            [ 4]  337 	ld	l,a
   486C DD 7E FD      [19]  338 	ld	a,-3 (ix)
   486F DD 8E F5      [19]  339 	adc	a, -11 (ix)
   4872 67            [ 4]  340 	ld	h,a
   4873 66            [ 7]  341 	ld	h,(hl)
                            342 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4874 FD E5         [15]  343 	push	iy
   4876 F1            [10]  344 	pop	af
   4877 DD 77 FB      [19]  345 	ld	-5 (ix),a
   487A FD E5         [15]  346 	push	iy
   487C 3B            [ 6]  347 	dec	sp
   487D F1            [10]  348 	pop	af
   487E 33            [ 6]  349 	inc	sp
   487F DD 77 FA      [19]  350 	ld	-6 (ix),a
                            351 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4882 25            [ 4]  352 	dec	h
   4883 20 16         [12]  353 	jr	NZ,00110$
                            354 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4885 C5            [11]  355 	push	bc
   4886 D5            [11]  356 	push	de
   4887 21 04 10      [10]  357 	ld	hl,#0x1004
   488A E5            [11]  358 	push	hl
   488B DD 6E FA      [19]  359 	ld	l,-6 (ix)
   488E DD 66 FB      [19]  360 	ld	h,-5 (ix)
   4891 E5            [11]  361 	push	hl
   4892 21 7D 6B      [10]  362 	ld	hl,#_muro
   4895 E5            [11]  363 	push	hl
   4896 CD 72 6D      [17]  364 	call	_cpct_drawSprite
   4899 D1            [10]  365 	pop	de
   489A C1            [10]  366 	pop	bc
   489B                     367 00110$:
                            368 ;src/draws.h:40: if(scene[posY][posX] == 9){
   489B 3E 25         [ 7]  369 	ld	a,#<(_scene)
   489D DD 86 F6      [19]  370 	add	a, -10 (ix)
   48A0 6F            [ 4]  371 	ld	l,a
   48A1 3E 71         [ 7]  372 	ld	a,#>(_scene)
   48A3 DD 8E F7      [19]  373 	adc	a, -9 (ix)
   48A6 67            [ 4]  374 	ld	h,a
   48A7 7D            [ 4]  375 	ld	a,l
   48A8 DD 86 F4      [19]  376 	add	a, -12 (ix)
   48AB 6F            [ 4]  377 	ld	l,a
   48AC 7C            [ 4]  378 	ld	a,h
   48AD DD 8E F5      [19]  379 	adc	a, -11 (ix)
   48B0 67            [ 4]  380 	ld	h,a
   48B1 7E            [ 7]  381 	ld	a,(hl)
   48B2 D6 09         [ 7]  382 	sub	a, #0x09
   48B4 20 19         [12]  383 	jr	NZ,00124$
                            384 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   48B6 C5            [11]  385 	push	bc
   48B7 D5            [11]  386 	push	de
   48B8 21 04 10      [10]  387 	ld	hl,#0x1004
   48BB E5            [11]  388 	push	hl
   48BC 3E 09         [ 7]  389 	ld	a,#0x09
   48BE F5            [11]  390 	push	af
   48BF 33            [ 6]  391 	inc	sp
   48C0 DD 6E FA      [19]  392 	ld	l,-6 (ix)
   48C3 DD 66 FB      [19]  393 	ld	h,-5 (ix)
   48C6 E5            [11]  394 	push	hl
   48C7 CD 5E 6F      [17]  395 	call	_cpct_drawSolidBox
   48CA F1            [10]  396 	pop	af
   48CB F1            [10]  397 	pop	af
   48CC 33            [ 6]  398 	inc	sp
   48CD D1            [10]  399 	pop	de
   48CE C1            [10]  400 	pop	bc
   48CF                     401 00124$:
                            402 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   48CF DD 34 F4      [23]  403 	inc	-12 (ix)
   48D2 20 03         [12]  404 	jr	NZ,00199$
   48D4 DD 34 F5      [23]  405 	inc	-11 (ix)
   48D7                     406 00199$:
   48D7 DD 7E F4      [19]  407 	ld	a,-12 (ix)
   48DA D6 14         [ 7]  408 	sub	a, #0x14
   48DC DD 7E F5      [19]  409 	ld	a,-11 (ix)
   48DF 17            [ 4]  410 	rla
   48E0 3F            [ 4]  411 	ccf
   48E1 1F            [ 4]  412 	rra
   48E2 DE 80         [ 7]  413 	sbc	a, #0x80
   48E4 DA 46 48      [10]  414 	jp	C,00123$
                            415 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   48E7 DD 7E F6      [19]  416 	ld	a,-10 (ix)
   48EA C6 14         [ 7]  417 	add	a, #0x14
   48EC DD 77 F6      [19]  418 	ld	-10 (ix),a
   48EF DD 7E F7      [19]  419 	ld	a,-9 (ix)
   48F2 CE 00         [ 7]  420 	adc	a, #0x00
   48F4 DD 77 F7      [19]  421 	ld	-9 (ix),a
   48F7 21 14 00      [10]  422 	ld	hl,#0x0014
   48FA 19            [11]  423 	add	hl,de
   48FB EB            [ 4]  424 	ex	de,hl
   48FC 03            [ 6]  425 	inc	bc
   48FD 79            [ 4]  426 	ld	a,c
   48FE D6 0C         [ 7]  427 	sub	a, #0x0C
   4900 78            [ 4]  428 	ld	a,b
   4901 17            [ 4]  429 	rla
   4902 3F            [ 4]  430 	ccf
   4903 1F            [ 4]  431 	rra
   4904 DE 80         [ 7]  432 	sbc	a, #0x80
   4906 DA 34 48      [10]  433 	jp	C,00139$
   4909 DD F9         [10]  434 	ld	sp, ix
   490B DD E1         [14]  435 	pop	ix
   490D C9            [10]  436 	ret
   490E                     437 _g_palette:
   490E 00                  438 	.db #0x00	; 0
   490F 1A                  439 	.db #0x1A	; 26
   4910 06                  440 	.db #0x06	; 6
   4911 0D                  441 	.db #0x0D	; 13
   4912 00                  442 	.db 0x00
   4913                     443 _origins:
   4913 00                  444 	.db #0x00	; 0
   4914 50                  445 	.db #0x50	; 80	'P'
   4915 34                  446 	.db #0x34	; 52	'4'
   4916 50                  447 	.db #0x50	; 80	'P'
   4917                     448 _mapa1:
   4917 01                  449 	.db #0x01	; 1
   4918 01                  450 	.db #0x01	; 1
   4919 01                  451 	.db #0x01	; 1
   491A 01                  452 	.db #0x01	; 1
   491B 01                  453 	.db #0x01	; 1
   491C 01                  454 	.db #0x01	; 1
   491D 01                  455 	.db #0x01	; 1
   491E 01                  456 	.db #0x01	; 1
   491F 01                  457 	.db #0x01	; 1
   4920 01                  458 	.db #0x01	; 1
   4921 01                  459 	.db #0x01	; 1
   4922 01                  460 	.db #0x01	; 1
   4923 01                  461 	.db #0x01	; 1
   4924 01                  462 	.db #0x01	; 1
   4925 01                  463 	.db #0x01	; 1
   4926 01                  464 	.db #0x01	; 1
   4927 01                  465 	.db #0x01	; 1
   4928 01                  466 	.db #0x01	; 1
   4929 01                  467 	.db #0x01	; 1
   492A 01                  468 	.db #0x01	; 1
   492B 01                  469 	.db #0x01	; 1
   492C 07                  470 	.db #0x07	; 7
   492D 05                  471 	.db #0x05	; 5
   492E 07                  472 	.db #0x07	; 7
   492F 07                  473 	.db #0x07	; 7
   4930 07                  474 	.db #0x07	; 7
   4931 07                  475 	.db #0x07	; 7
   4932 07                  476 	.db #0x07	; 7
   4933 07                  477 	.db #0x07	; 7
   4934 07                  478 	.db #0x07	; 7
   4935 07                  479 	.db #0x07	; 7
   4936 07                  480 	.db #0x07	; 7
   4937 07                  481 	.db #0x07	; 7
   4938 07                  482 	.db #0x07	; 7
   4939 07                  483 	.db #0x07	; 7
   493A 07                  484 	.db #0x07	; 7
   493B 07                  485 	.db #0x07	; 7
   493C 07                  486 	.db #0x07	; 7
   493D 07                  487 	.db #0x07	; 7
   493E 01                  488 	.db #0x01	; 1
   493F 01                  489 	.db #0x01	; 1
   4940 07                  490 	.db #0x07	; 7
   4941 07                  491 	.db #0x07	; 7
   4942 07                  492 	.db #0x07	; 7
   4943 07                  493 	.db #0x07	; 7
   4944 07                  494 	.db #0x07	; 7
   4945 07                  495 	.db #0x07	; 7
   4946 07                  496 	.db #0x07	; 7
   4947 07                  497 	.db #0x07	; 7
   4948 07                  498 	.db #0x07	; 7
   4949 07                  499 	.db #0x07	; 7
   494A 07                  500 	.db #0x07	; 7
   494B 07                  501 	.db #0x07	; 7
   494C 07                  502 	.db #0x07	; 7
   494D 07                  503 	.db #0x07	; 7
   494E 07                  504 	.db #0x07	; 7
   494F 07                  505 	.db #0x07	; 7
   4950 07                  506 	.db #0x07	; 7
   4951 07                  507 	.db #0x07	; 7
   4952 01                  508 	.db #0x01	; 1
   4953 01                  509 	.db #0x01	; 1
   4954 01                  510 	.db #0x01	; 1
   4955 01                  511 	.db #0x01	; 1
   4956 01                  512 	.db #0x01	; 1
   4957 01                  513 	.db #0x01	; 1
   4958 01                  514 	.db #0x01	; 1
   4959 01                  515 	.db #0x01	; 1
   495A 01                  516 	.db #0x01	; 1
   495B 01                  517 	.db #0x01	; 1
   495C 07                  518 	.db #0x07	; 7
   495D 07                  519 	.db #0x07	; 7
   495E 01                  520 	.db #0x01	; 1
   495F 01                  521 	.db #0x01	; 1
   4960 01                  522 	.db #0x01	; 1
   4961 01                  523 	.db #0x01	; 1
   4962 07                  524 	.db #0x07	; 7
   4963 07                  525 	.db #0x07	; 7
   4964 01                  526 	.db #0x01	; 1
   4965 01                  527 	.db #0x01	; 1
   4966 01                  528 	.db #0x01	; 1
   4967 01                  529 	.db #0x01	; 1
   4968 00                  530 	.db #0x00	; 0
   4969 00                  531 	.db #0x00	; 0
   496A 00                  532 	.db #0x00	; 0
   496B 00                  533 	.db #0x00	; 0
   496C 00                  534 	.db #0x00	; 0
   496D 00                  535 	.db #0x00	; 0
   496E 00                  536 	.db #0x00	; 0
   496F 06                  537 	.db #0x06	; 6
   4970 06                  538 	.db #0x06	; 6
   4971 06                  539 	.db #0x06	; 6
   4972 01                  540 	.db #0x01	; 1
   4973 03                  541 	.db #0x03	; 3
   4974 03                  542 	.db #0x03	; 3
   4975 03                  543 	.db #0x03	; 3
   4976 03                  544 	.db #0x03	; 3
   4977 03                  545 	.db #0x03	; 3
   4978 03                  546 	.db #0x03	; 3
   4979 03                  547 	.db #0x03	; 3
   497A 01                  548 	.db #0x01	; 1
   497B 00                  549 	.db #0x00	; 0
   497C 00                  550 	.db #0x00	; 0
   497D 01                  551 	.db #0x01	; 1
   497E 01                  552 	.db #0x01	; 1
   497F 04                  553 	.db #0x04	; 4
   4980 04                  554 	.db #0x04	; 4
   4981 01                  555 	.db #0x01	; 1
   4982 01                  556 	.db #0x01	; 1
   4983 06                  557 	.db #0x06	; 6
   4984 06                  558 	.db #0x06	; 6
   4985 06                  559 	.db #0x06	; 6
   4986 01                  560 	.db #0x01	; 1
   4987 03                  561 	.db #0x03	; 3
   4988 03                  562 	.db #0x03	; 3
   4989 03                  563 	.db #0x03	; 3
   498A 03                  564 	.db #0x03	; 3
   498B 03                  565 	.db #0x03	; 3
   498C 03                  566 	.db #0x03	; 3
   498D 03                  567 	.db #0x03	; 3
   498E 01                  568 	.db #0x01	; 1
   498F 01                  569 	.db #0x01	; 1
   4990 00                  570 	.db #0x00	; 0
   4991 01                  571 	.db #0x01	; 1
   4992 04                  572 	.db #0x04	; 4
   4993 04                  573 	.db #0x04	; 4
   4994 04                  574 	.db #0x04	; 4
   4995 04                  575 	.db #0x04	; 4
   4996 01                  576 	.db #0x01	; 1
   4997 06                  577 	.db #0x06	; 6
   4998 06                  578 	.db #0x06	; 6
   4999 06                  579 	.db #0x06	; 6
   499A 01                  580 	.db #0x01	; 1
   499B 03                  581 	.db #0x03	; 3
   499C 03                  582 	.db #0x03	; 3
   499D 03                  583 	.db #0x03	; 3
   499E 03                  584 	.db #0x03	; 3
   499F 03                  585 	.db #0x03	; 3
   49A0 03                  586 	.db #0x03	; 3
   49A1 03                  587 	.db #0x03	; 3
   49A2 01                  588 	.db #0x01	; 1
   49A3 01                  589 	.db #0x01	; 1
   49A4 00                  590 	.db #0x00	; 0
   49A5 01                  591 	.db #0x01	; 1
   49A6 04                  592 	.db #0x04	; 4
   49A7 04                  593 	.db #0x04	; 4
   49A8 04                  594 	.db #0x04	; 4
   49A9 04                  595 	.db #0x04	; 4
   49AA 01                  596 	.db #0x01	; 1
   49AB 06                  597 	.db #0x06	; 6
   49AC 06                  598 	.db #0x06	; 6
   49AD 06                  599 	.db #0x06	; 6
   49AE 01                  600 	.db #0x01	; 1
   49AF 03                  601 	.db #0x03	; 3
   49B0 03                  602 	.db #0x03	; 3
   49B1 03                  603 	.db #0x03	; 3
   49B2 03                  604 	.db #0x03	; 3
   49B3 03                  605 	.db #0x03	; 3
   49B4 03                  606 	.db #0x03	; 3
   49B5 03                  607 	.db #0x03	; 3
   49B6 01                  608 	.db #0x01	; 1
   49B7 01                  609 	.db #0x01	; 1
   49B8 00                  610 	.db #0x00	; 0
   49B9 01                  611 	.db #0x01	; 1
   49BA 04                  612 	.db #0x04	; 4
   49BB 04                  613 	.db #0x04	; 4
   49BC 04                  614 	.db #0x04	; 4
   49BD 04                  615 	.db #0x04	; 4
   49BE 01                  616 	.db #0x01	; 1
   49BF 06                  617 	.db #0x06	; 6
   49C0 06                  618 	.db #0x06	; 6
   49C1 06                  619 	.db #0x06	; 6
   49C2 01                  620 	.db #0x01	; 1
   49C3 03                  621 	.db #0x03	; 3
   49C4 03                  622 	.db #0x03	; 3
   49C5 03                  623 	.db #0x03	; 3
   49C6 03                  624 	.db #0x03	; 3
   49C7 03                  625 	.db #0x03	; 3
   49C8 03                  626 	.db #0x03	; 3
   49C9 03                  627 	.db #0x03	; 3
   49CA 01                  628 	.db #0x01	; 1
   49CB 01                  629 	.db #0x01	; 1
   49CC 00                  630 	.db #0x00	; 0
   49CD 01                  631 	.db #0x01	; 1
   49CE 04                  632 	.db #0x04	; 4
   49CF 04                  633 	.db #0x04	; 4
   49D0 04                  634 	.db #0x04	; 4
   49D1 04                  635 	.db #0x04	; 4
   49D2 01                  636 	.db #0x01	; 1
   49D3 06                  637 	.db #0x06	; 6
   49D4 06                  638 	.db #0x06	; 6
   49D5 06                  639 	.db #0x06	; 6
   49D6 03                  640 	.db #0x03	; 3
   49D7 03                  641 	.db #0x03	; 3
   49D8 03                  642 	.db #0x03	; 3
   49D9 03                  643 	.db #0x03	; 3
   49DA 03                  644 	.db #0x03	; 3
   49DB 03                  645 	.db #0x03	; 3
   49DC 03                  646 	.db #0x03	; 3
   49DD 03                  647 	.db #0x03	; 3
   49DE 01                  648 	.db #0x01	; 1
   49DF 01                  649 	.db #0x01	; 1
   49E0 02                  650 	.db #0x02	; 2
   49E1 01                  651 	.db #0x01	; 1
   49E2 04                  652 	.db #0x04	; 4
   49E3 04                  653 	.db #0x04	; 4
   49E4 04                  654 	.db #0x04	; 4
   49E5 04                  655 	.db #0x04	; 4
   49E6 01                  656 	.db #0x01	; 1
   49E7 06                  657 	.db #0x06	; 6
   49E8 06                  658 	.db #0x06	; 6
   49E9 06                  659 	.db #0x06	; 6
   49EA 03                  660 	.db #0x03	; 3
   49EB 03                  661 	.db #0x03	; 3
   49EC 03                  662 	.db #0x03	; 3
   49ED 03                  663 	.db #0x03	; 3
   49EE 03                  664 	.db #0x03	; 3
   49EF 03                  665 	.db #0x03	; 3
   49F0 03                  666 	.db #0x03	; 3
   49F1 03                  667 	.db #0x03	; 3
   49F2 01                  668 	.db #0x01	; 1
   49F3 01                  669 	.db #0x01	; 1
   49F4 01                  670 	.db #0x01	; 1
   49F5 01                  671 	.db #0x01	; 1
   49F6 01                  672 	.db #0x01	; 1
   49F7 01                  673 	.db #0x01	; 1
   49F8 01                  674 	.db #0x01	; 1
   49F9 01                  675 	.db #0x01	; 1
   49FA 01                  676 	.db #0x01	; 1
   49FB 01                  677 	.db #0x01	; 1
   49FC 01                  678 	.db #0x01	; 1
   49FD 01                  679 	.db #0x01	; 1
   49FE 01                  680 	.db #0x01	; 1
   49FF 01                  681 	.db #0x01	; 1
   4A00 01                  682 	.db #0x01	; 1
   4A01 01                  683 	.db #0x01	; 1
   4A02 09                  684 	.db #0x09	; 9
   4A03 09                  685 	.db #0x09	; 9
   4A04 01                  686 	.db #0x01	; 1
   4A05 01                  687 	.db #0x01	; 1
   4A06 01                  688 	.db #0x01	; 1
   4A07                     689 _mapa2:
   4A07 01                  690 	.db #0x01	; 1
   4A08 01                  691 	.db #0x01	; 1
   4A09 01                  692 	.db #0x01	; 1
   4A0A 01                  693 	.db #0x01	; 1
   4A0B 01                  694 	.db #0x01	; 1
   4A0C 01                  695 	.db #0x01	; 1
   4A0D 01                  696 	.db #0x01	; 1
   4A0E 01                  697 	.db #0x01	; 1
   4A0F 01                  698 	.db #0x01	; 1
   4A10 01                  699 	.db #0x01	; 1
   4A11 01                  700 	.db #0x01	; 1
   4A12 01                  701 	.db #0x01	; 1
   4A13 01                  702 	.db #0x01	; 1
   4A14 01                  703 	.db #0x01	; 1
   4A15 01                  704 	.db #0x01	; 1
   4A16 01                  705 	.db #0x01	; 1
   4A17 01                  706 	.db #0x01	; 1
   4A18 01                  707 	.db #0x01	; 1
   4A19 01                  708 	.db #0x01	; 1
   4A1A 01                  709 	.db #0x01	; 1
   4A1B 01                  710 	.db #0x01	; 1
   4A1C 00                  711 	.db #0x00	; 0
   4A1D 00                  712 	.db #0x00	; 0
   4A1E 00                  713 	.db #0x00	; 0
   4A1F 00                  714 	.db #0x00	; 0
   4A20 01                  715 	.db #0x01	; 1
   4A21 00                  716 	.db #0x00	; 0
   4A22 00                  717 	.db #0x00	; 0
   4A23 00                  718 	.db #0x00	; 0
   4A24 00                  719 	.db #0x00	; 0
   4A25 00                  720 	.db #0x00	; 0
   4A26 00                  721 	.db #0x00	; 0
   4A27 00                  722 	.db #0x00	; 0
   4A28 00                  723 	.db #0x00	; 0
   4A29 00                  724 	.db #0x00	; 0
   4A2A 00                  725 	.db #0x00	; 0
   4A2B 00                  726 	.db #0x00	; 0
   4A2C 00                  727 	.db #0x00	; 0
   4A2D 00                  728 	.db #0x00	; 0
   4A2E 06                  729 	.db #0x06	; 6
   4A2F 01                  730 	.db #0x01	; 1
   4A30 00                  731 	.db #0x00	; 0
   4A31 00                  732 	.db #0x00	; 0
   4A32 01                  733 	.db #0x01	; 1
   4A33 00                  734 	.db #0x00	; 0
   4A34 00                  735 	.db #0x00	; 0
   4A35 00                  736 	.db #0x00	; 0
   4A36 00                  737 	.db #0x00	; 0
   4A37 00                  738 	.db #0x00	; 0
   4A38 00                  739 	.db #0x00	; 0
   4A39 00                  740 	.db #0x00	; 0
   4A3A 00                  741 	.db #0x00	; 0
   4A3B 00                  742 	.db #0x00	; 0
   4A3C 00                  743 	.db #0x00	; 0
   4A3D 00                  744 	.db #0x00	; 0
   4A3E 00                  745 	.db #0x00	; 0
   4A3F 00                  746 	.db #0x00	; 0
   4A40 00                  747 	.db #0x00	; 0
   4A41 00                  748 	.db #0x00	; 0
   4A42 01                  749 	.db #0x01	; 1
   4A43 01                  750 	.db #0x01	; 1
   4A44 00                  751 	.db #0x00	; 0
   4A45 01                  752 	.db #0x01	; 1
   4A46 01                  753 	.db #0x01	; 1
   4A47 01                  754 	.db #0x01	; 1
   4A48 01                  755 	.db #0x01	; 1
   4A49 00                  756 	.db #0x00	; 0
   4A4A 00                  757 	.db #0x00	; 0
   4A4B 01                  758 	.db #0x01	; 1
   4A4C 01                  759 	.db #0x01	; 1
   4A4D 01                  760 	.db #0x01	; 1
   4A4E 01                  761 	.db #0x01	; 1
   4A4F 01                  762 	.db #0x01	; 1
   4A50 01                  763 	.db #0x01	; 1
   4A51 01                  764 	.db #0x01	; 1
   4A52 01                  765 	.db #0x01	; 1
   4A53 01                  766 	.db #0x01	; 1
   4A54 01                  767 	.db #0x01	; 1
   4A55 01                  768 	.db #0x01	; 1
   4A56 01                  769 	.db #0x01	; 1
   4A57 01                  770 	.db #0x01	; 1
   4A58 00                  771 	.db #0x00	; 0
   4A59 05                  772 	.db #0x05	; 5
   4A5A 01                  773 	.db #0x01	; 1
   4A5B 00                  774 	.db #0x00	; 0
   4A5C 00                  775 	.db #0x00	; 0
   4A5D 00                  776 	.db #0x00	; 0
   4A5E 00                  777 	.db #0x00	; 0
   4A5F 00                  778 	.db #0x00	; 0
   4A60 00                  779 	.db #0x00	; 0
   4A61 00                  780 	.db #0x00	; 0
   4A62 01                  781 	.db #0x01	; 1
   4A63 00                  782 	.db #0x00	; 0
   4A64 00                  783 	.db #0x00	; 0
   4A65 00                  784 	.db #0x00	; 0
   4A66 00                  785 	.db #0x00	; 0
   4A67 00                  786 	.db #0x00	; 0
   4A68 00                  787 	.db #0x00	; 0
   4A69 00                  788 	.db #0x00	; 0
   4A6A 01                  789 	.db #0x01	; 1
   4A6B 01                  790 	.db #0x01	; 1
   4A6C 00                  791 	.db #0x00	; 0
   4A6D 01                  792 	.db #0x01	; 1
   4A6E 01                  793 	.db #0x01	; 1
   4A6F 00                  794 	.db #0x00	; 0
   4A70 01                  795 	.db #0x01	; 1
   4A71 01                  796 	.db #0x01	; 1
   4A72 01                  797 	.db #0x01	; 1
   4A73 02                  798 	.db #0x02	; 2
   4A74 02                  799 	.db #0x02	; 2
   4A75 02                  800 	.db #0x02	; 2
   4A76 01                  801 	.db #0x01	; 1
   4A77 00                  802 	.db #0x00	; 0
   4A78 00                  803 	.db #0x00	; 0
   4A79 00                  804 	.db #0x00	; 0
   4A7A 05                  805 	.db #0x05	; 5
   4A7B 00                  806 	.db #0x00	; 0
   4A7C 00                  807 	.db #0x00	; 0
   4A7D 00                  808 	.db #0x00	; 0
   4A7E 01                  809 	.db #0x01	; 1
   4A7F 01                  810 	.db #0x01	; 1
   4A80 00                  811 	.db #0x00	; 0
   4A81 01                  812 	.db #0x01	; 1
   4A82 02                  813 	.db #0x02	; 2
   4A83 02                  814 	.db #0x02	; 2
   4A84 02                  815 	.db #0x02	; 2
   4A85 02                  816 	.db #0x02	; 2
   4A86 01                  817 	.db #0x01	; 1
   4A87 00                  818 	.db #0x00	; 0
   4A88 00                  819 	.db #0x00	; 0
   4A89 00                  820 	.db #0x00	; 0
   4A8A 01                  821 	.db #0x01	; 1
   4A8B 00                  822 	.db #0x00	; 0
   4A8C 00                  823 	.db #0x00	; 0
   4A8D 00                  824 	.db #0x00	; 0
   4A8E 05                  825 	.db #0x05	; 5
   4A8F 00                  826 	.db #0x00	; 0
   4A90 00                  827 	.db #0x00	; 0
   4A91 00                  828 	.db #0x00	; 0
   4A92 01                  829 	.db #0x01	; 1
   4A93 01                  830 	.db #0x01	; 1
   4A94 00                  831 	.db #0x00	; 0
   4A95 01                  832 	.db #0x01	; 1
   4A96 02                  833 	.db #0x02	; 2
   4A97 02                  834 	.db #0x02	; 2
   4A98 02                  835 	.db #0x02	; 2
   4A99 02                  836 	.db #0x02	; 2
   4A9A 01                  837 	.db #0x01	; 1
   4A9B 02                  838 	.db #0x02	; 2
   4A9C 02                  839 	.db #0x02	; 2
   4A9D 02                  840 	.db #0x02	; 2
   4A9E 01                  841 	.db #0x01	; 1
   4A9F 00                  842 	.db #0x00	; 0
   4AA0 00                  843 	.db #0x00	; 0
   4AA1 00                  844 	.db #0x00	; 0
   4AA2 05                  845 	.db #0x05	; 5
   4AA3 00                  846 	.db #0x00	; 0
   4AA4 00                  847 	.db #0x00	; 0
   4AA5 00                  848 	.db #0x00	; 0
   4AA6 01                  849 	.db #0x01	; 1
   4AA7 01                  850 	.db #0x01	; 1
   4AA8 00                  851 	.db #0x00	; 0
   4AA9 01                  852 	.db #0x01	; 1
   4AAA 02                  853 	.db #0x02	; 2
   4AAB 02                  854 	.db #0x02	; 2
   4AAC 02                  855 	.db #0x02	; 2
   4AAD 02                  856 	.db #0x02	; 2
   4AAE 01                  857 	.db #0x01	; 1
   4AAF 00                  858 	.db #0x00	; 0
   4AB0 00                  859 	.db #0x00	; 0
   4AB1 00                  860 	.db #0x00	; 0
   4AB2 01                  861 	.db #0x01	; 1
   4AB3 00                  862 	.db #0x00	; 0
   4AB4 00                  863 	.db #0x00	; 0
   4AB5 00                  864 	.db #0x00	; 0
   4AB6 00                  865 	.db #0x00	; 0
   4AB7 00                  866 	.db #0x00	; 0
   4AB8 00                  867 	.db #0x00	; 0
   4AB9 00                  868 	.db #0x00	; 0
   4ABA 01                  869 	.db #0x01	; 1
   4ABB 01                  870 	.db #0x01	; 1
   4ABC 00                  871 	.db #0x00	; 0
   4ABD 01                  872 	.db #0x01	; 1
   4ABE 02                  873 	.db #0x02	; 2
   4ABF 02                  874 	.db #0x02	; 2
   4AC0 02                  875 	.db #0x02	; 2
   4AC1 02                  876 	.db #0x02	; 2
   4AC2 01                  877 	.db #0x01	; 1
   4AC3 02                  878 	.db #0x02	; 2
   4AC4 02                  879 	.db #0x02	; 2
   4AC5 02                  880 	.db #0x02	; 2
   4AC6 01                  881 	.db #0x01	; 1
   4AC7 00                  882 	.db #0x00	; 0
   4AC8 00                  883 	.db #0x00	; 0
   4AC9 00                  884 	.db #0x00	; 0
   4ACA 00                  885 	.db #0x00	; 0
   4ACB 00                  886 	.db #0x00	; 0
   4ACC 00                  887 	.db #0x00	; 0
   4ACD 00                  888 	.db #0x00	; 0
   4ACE 01                  889 	.db #0x01	; 1
   4ACF 01                  890 	.db #0x01	; 1
   4AD0 05                  891 	.db #0x05	; 5
   4AD1 01                  892 	.db #0x01	; 1
   4AD2 02                  893 	.db #0x02	; 2
   4AD3 02                  894 	.db #0x02	; 2
   4AD4 02                  895 	.db #0x02	; 2
   4AD5 02                  896 	.db #0x02	; 2
   4AD6 01                  897 	.db #0x01	; 1
   4AD7 00                  898 	.db #0x00	; 0
   4AD8 00                  899 	.db #0x00	; 0
   4AD9 00                  900 	.db #0x00	; 0
   4ADA 00                  901 	.db #0x00	; 0
   4ADB 00                  902 	.db #0x00	; 0
   4ADC 00                  903 	.db #0x00	; 0
   4ADD 00                  904 	.db #0x00	; 0
   4ADE 00                  905 	.db #0x00	; 0
   4ADF 00                  906 	.db #0x00	; 0
   4AE0 00                  907 	.db #0x00	; 0
   4AE1 00                  908 	.db #0x00	; 0
   4AE2 01                  909 	.db #0x01	; 1
   4AE3 01                  910 	.db #0x01	; 1
   4AE4 01                  911 	.db #0x01	; 1
   4AE5 01                  912 	.db #0x01	; 1
   4AE6 01                  913 	.db #0x01	; 1
   4AE7 01                  914 	.db #0x01	; 1
   4AE8 01                  915 	.db #0x01	; 1
   4AE9 01                  916 	.db #0x01	; 1
   4AEA 01                  917 	.db #0x01	; 1
   4AEB 01                  918 	.db #0x01	; 1
   4AEC 01                  919 	.db #0x01	; 1
   4AED 01                  920 	.db #0x01	; 1
   4AEE 01                  921 	.db #0x01	; 1
   4AEF 01                  922 	.db #0x01	; 1
   4AF0 01                  923 	.db #0x01	; 1
   4AF1 01                  924 	.db #0x01	; 1
   4AF2 00                  925 	.db #0x00	; 0
   4AF3 01                  926 	.db #0x01	; 1
   4AF4 01                  927 	.db #0x01	; 1
   4AF5 01                  928 	.db #0x01	; 1
   4AF6 01                  929 	.db #0x01	; 1
                            930 ;src/draws.h:48: void drawVida(u8 life,u8 pos){
                            931 ;	---------------------------------
                            932 ; Function drawVida
                            933 ; ---------------------------------
   4AF7                     934 _drawVida::
   4AF7 DD E5         [15]  935 	push	ix
   4AF9 DD 21 00 00   [14]  936 	ld	ix,#0
   4AFD DD 39         [15]  937 	add	ix,sp
                            938 ;src/draws.h:51: u8 p = pos;
   4AFF DD 56 05      [19]  939 	ld	d,5 (ix)
                            940 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B02 1E 01         [ 7]  941 	ld	e,#0x01
   4B04                     942 00105$:
                            943 ;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B04 D5            [11]  944 	push	de
   4B05 3E C0         [ 7]  945 	ld	a,#0xC0
   4B07 F5            [11]  946 	push	af
   4B08 33            [ 6]  947 	inc	sp
   4B09 D5            [11]  948 	push	de
   4B0A 33            [ 6]  949 	inc	sp
   4B0B 21 00 C0      [10]  950 	ld	hl,#0xC000
   4B0E E5            [11]  951 	push	hl
   4B0F CD 2F 70      [17]  952 	call	_cpct_getScreenPtr
   4B12 D1            [10]  953 	pop	de
                            954 ;src/draws.h:55: p+=5;
   4B13 7A            [ 4]  955 	ld	a,d
   4B14 C6 05         [ 7]  956 	add	a, #0x05
   4B16 57            [ 4]  957 	ld	d,a
                            958 ;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4B17 4D            [ 4]  959 	ld	c, l
   4B18 44            [ 4]  960 	ld	b, h
   4B19 DD 7E 04      [19]  961 	ld	a,4 (ix)
   4B1C 93            [ 4]  962 	sub	a, e
   4B1D 38 10         [12]  963 	jr	C,00102$
   4B1F D5            [11]  964 	push	de
   4B20 21 04 08      [10]  965 	ld	hl,#0x0804
   4B23 E5            [11]  966 	push	hl
   4B24 C5            [11]  967 	push	bc
   4B25 21 00 46      [10]  968 	ld	hl,#_corazon_lleno
   4B28 E5            [11]  969 	push	hl
   4B29 CD D8 6E      [17]  970 	call	_cpct_drawSpriteMasked
   4B2C D1            [10]  971 	pop	de
   4B2D 18 20         [12]  972 	jr	00106$
   4B2F                     973 00102$:
                            974 ;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
   4B2F C5            [11]  975 	push	bc
   4B30 D5            [11]  976 	push	de
   4B31 21 04 08      [10]  977 	ld	hl,#0x0804
   4B34 E5            [11]  978 	push	hl
   4B35 AF            [ 4]  979 	xor	a, a
   4B36 F5            [11]  980 	push	af
   4B37 33            [ 6]  981 	inc	sp
   4B38 C5            [11]  982 	push	bc
   4B39 CD 5E 6F      [17]  983 	call	_cpct_drawSolidBox
   4B3C F1            [10]  984 	pop	af
   4B3D F1            [10]  985 	pop	af
   4B3E 33            [ 6]  986 	inc	sp
   4B3F D1            [10]  987 	pop	de
   4B40 C1            [10]  988 	pop	bc
                            989 ;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4B41 D5            [11]  990 	push	de
   4B42 21 04 08      [10]  991 	ld	hl,#0x0804
   4B45 E5            [11]  992 	push	hl
   4B46 C5            [11]  993 	push	bc
   4B47 21 40 46      [10]  994 	ld	hl,#_corazon_roto
   4B4A E5            [11]  995 	push	hl
   4B4B CD D8 6E      [17]  996 	call	_cpct_drawSpriteMasked
   4B4E D1            [10]  997 	pop	de
   4B4F                     998 00106$:
                            999 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B4F 1C            [ 4] 1000 	inc	e
   4B50 3E 03         [ 7] 1001 	ld	a,#0x03
   4B52 93            [ 4] 1002 	sub	a, e
   4B53 30 AF         [12] 1003 	jr	NC,00105$
   4B55 DD E1         [14] 1004 	pop	ix
   4B57 C9            [10] 1005 	ret
                           1006 ;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
                           1007 ;	---------------------------------
                           1008 ; Function drawBullets
                           1009 ; ---------------------------------
   4B58                    1010 _drawBullets::
   4B58 DD E5         [15] 1011 	push	ix
   4B5A DD 21 00 00   [14] 1012 	ld	ix,#0
   4B5E DD 39         [15] 1013 	add	ix,sp
   4B60 3B            [ 6] 1014 	dec	sp
                           1015 ;src/draws.h:67: int p = pos;
   4B61 DD 4E 05      [19] 1016 	ld	c,5 (ix)
   4B64 06 00         [ 7] 1017 	ld	b,#0x00
                           1018 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B66 DD 36 FF 01   [19] 1019 	ld	-1 (ix),#0x01
   4B6A                    1020 00105$:
                           1021 ;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B6A 51            [ 4] 1022 	ld	d,c
   4B6B C5            [11] 1023 	push	bc
   4B6C 3E C0         [ 7] 1024 	ld	a,#0xC0
   4B6E F5            [11] 1025 	push	af
   4B6F 33            [ 6] 1026 	inc	sp
   4B70 D5            [11] 1027 	push	de
   4B71 33            [ 6] 1028 	inc	sp
   4B72 21 00 C0      [10] 1029 	ld	hl,#0xC000
   4B75 E5            [11] 1030 	push	hl
   4B76 CD 2F 70      [17] 1031 	call	_cpct_getScreenPtr
   4B79 C1            [10] 1032 	pop	bc
                           1033 ;src/draws.h:71: p+=3;
   4B7A 03            [ 6] 1034 	inc	bc
   4B7B 03            [ 6] 1035 	inc	bc
   4B7C 03            [ 6] 1036 	inc	bc
                           1037 ;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4B7D EB            [ 4] 1038 	ex	de,hl
   4B7E DD 7E 04      [19] 1039 	ld	a,4 (ix)
   4B81 DD 96 FF      [19] 1040 	sub	a, -1 (ix)
   4B84 38 10         [12] 1041 	jr	C,00102$
   4B86 C5            [11] 1042 	push	bc
   4B87 21 02 08      [10] 1043 	ld	hl,#0x0802
   4B8A E5            [11] 1044 	push	hl
   4B8B D5            [11] 1045 	push	de
   4B8C 21 BD 6B      [10] 1046 	ld	hl,#_flecha_arriba
   4B8F E5            [11] 1047 	push	hl
   4B90 CD D8 6E      [17] 1048 	call	_cpct_drawSpriteMasked
   4B93 C1            [10] 1049 	pop	bc
   4B94 18 10         [12] 1050 	jr	00106$
   4B96                    1051 00102$:
                           1052 ;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
   4B96 C5            [11] 1053 	push	bc
   4B97 21 02 08      [10] 1054 	ld	hl,#0x0802
   4B9A E5            [11] 1055 	push	hl
   4B9B AF            [ 4] 1056 	xor	a, a
   4B9C F5            [11] 1057 	push	af
   4B9D 33            [ 6] 1058 	inc	sp
   4B9E D5            [11] 1059 	push	de
   4B9F CD 5E 6F      [17] 1060 	call	_cpct_drawSolidBox
   4BA2 F1            [10] 1061 	pop	af
   4BA3 F1            [10] 1062 	pop	af
   4BA4 33            [ 6] 1063 	inc	sp
   4BA5 C1            [10] 1064 	pop	bc
   4BA6                    1065 00106$:
                           1066 ;src/draws.h:69: for(i=1;i<=3;i++){
   4BA6 DD 34 FF      [23] 1067 	inc	-1 (ix)
   4BA9 3E 03         [ 7] 1068 	ld	a,#0x03
   4BAB DD 96 FF      [19] 1069 	sub	a, -1 (ix)
   4BAE 30 BA         [12] 1070 	jr	NC,00105$
   4BB0 33            [ 6] 1071 	inc	sp
   4BB1 DD E1         [14] 1072 	pop	ix
   4BB3 C9            [10] 1073 	ret
                           1074 ;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1075 ;	---------------------------------
                           1076 ; Function draw
                           1077 ; ---------------------------------
   4BB4                    1078 _draw::
                           1079 ;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
   4BB4 21 03 00      [10] 1080 	ld	hl, #3+0
   4BB7 39            [11] 1081 	add	hl, sp
   4BB8 7E            [ 7] 1082 	ld	a, (hl)
   4BB9 F5            [11] 1083 	push	af
   4BBA 33            [ 6] 1084 	inc	sp
   4BBB 21 03 00      [10] 1085 	ld	hl, #3+0
   4BBE 39            [11] 1086 	add	hl, sp
   4BBF 7E            [ 7] 1087 	ld	a, (hl)
   4BC0 F5            [11] 1088 	push	af
   4BC1 33            [ 6] 1089 	inc	sp
   4BC2 21 00 C0      [10] 1090 	ld	hl,#0xC000
   4BC5 E5            [11] 1091 	push	hl
   4BC6 CD 2F 70      [17] 1092 	call	_cpct_getScreenPtr
   4BC9 EB            [ 4] 1093 	ex	de,hl
                           1094 ;src/draws.h:84: switch(mode){
   4BCA 3E 02         [ 7] 1095 	ld	a,#0x02
   4BCC FD 21 06 00   [14] 1096 	ld	iy,#6
   4BD0 FD 39         [15] 1097 	add	iy,sp
   4BD2 FD 96 00      [19] 1098 	sub	a, 0 (iy)
   4BD5 D8            [11] 1099 	ret	C
                           1100 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BD6 21 04 00      [10] 1101 	ld	hl, #4
   4BD9 39            [11] 1102 	add	hl, sp
   4BDA 4E            [ 7] 1103 	ld	c, (hl)
   4BDB 23            [ 6] 1104 	inc	hl
   4BDC 46            [ 7] 1105 	ld	b, (hl)
                           1106 ;src/draws.h:84: switch(mode){
   4BDD D5            [11] 1107 	push	de
   4BDE FD 21 08 00   [14] 1108 	ld	iy,#8
   4BE2 FD 39         [15] 1109 	add	iy,sp
   4BE4 FD 5E 00      [19] 1110 	ld	e,0 (iy)
   4BE7 16 00         [ 7] 1111 	ld	d,#0x00
   4BE9 21 F0 4B      [10] 1112 	ld	hl,#00111$
   4BEC 19            [11] 1113 	add	hl,de
   4BED 19            [11] 1114 	add	hl,de
                           1115 ;src/draws.h:85: case 0:
   4BEE D1            [10] 1116 	pop	de
   4BEF E9            [ 4] 1117 	jp	(hl)
   4BF0                    1118 00111$:
   4BF0 18 04         [12] 1119 	jr	00101$
   4BF2 18 0C         [12] 1120 	jr	00102$
   4BF4 18 14         [12] 1121 	jr	00103$
   4BF6                    1122 00101$:
                           1123 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BF6 21 04 10      [10] 1124 	ld	hl,#0x1004
   4BF9 E5            [11] 1125 	push	hl
   4BFA D5            [11] 1126 	push	de
   4BFB C5            [11] 1127 	push	bc
   4BFC CD D8 6E      [17] 1128 	call	_cpct_drawSpriteMasked
                           1129 ;src/draws.h:87: break;
   4BFF C9            [10] 1130 	ret
                           1131 ;src/draws.h:88: case 1:
   4C00                    1132 00102$:
                           1133 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4C00 21 02 08      [10] 1134 	ld	hl,#0x0802
   4C03 E5            [11] 1135 	push	hl
   4C04 D5            [11] 1136 	push	de
   4C05 C5            [11] 1137 	push	bc
   4C06 CD D8 6E      [17] 1138 	call	_cpct_drawSpriteMasked
                           1139 ;src/draws.h:90: break;
   4C09 C9            [10] 1140 	ret
                           1141 ;src/draws.h:91: case 2:
   4C0A                    1142 00103$:
                           1143 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4C0A 21 04 04      [10] 1144 	ld	hl,#0x0404
   4C0D E5            [11] 1145 	push	hl
   4C0E D5            [11] 1146 	push	de
   4C0F C5            [11] 1147 	push	bc
   4C10 CD D8 6E      [17] 1148 	call	_cpct_drawSpriteMasked
                           1149 ;src/draws.h:94: }
   4C13 C9            [10] 1150 	ret
                           1151 ;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
                           1152 ;	---------------------------------
                           1153 ; Function erase
                           1154 ; ---------------------------------
   4C14                    1155 _erase::
                           1156 ;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
   4C14 21 03 00      [10] 1157 	ld	hl, #3+0
   4C17 39            [11] 1158 	add	hl, sp
   4C18 7E            [ 7] 1159 	ld	a, (hl)
   4C19 F5            [11] 1160 	push	af
   4C1A 33            [ 6] 1161 	inc	sp
   4C1B 21 03 00      [10] 1162 	ld	hl, #3+0
   4C1E 39            [11] 1163 	add	hl, sp
   4C1F 7E            [ 7] 1164 	ld	a, (hl)
   4C20 F5            [11] 1165 	push	af
   4C21 33            [ 6] 1166 	inc	sp
   4C22 21 00 C0      [10] 1167 	ld	hl,#0xC000
   4C25 E5            [11] 1168 	push	hl
   4C26 CD 2F 70      [17] 1169 	call	_cpct_getScreenPtr
   4C29 4D            [ 4] 1170 	ld	c, l
   4C2A 44            [ 4] 1171 	ld	b, h
                           1172 ;src/draws.h:102: switch(mode){
   4C2B 3E 02         [ 7] 1173 	ld	a,#0x02
   4C2D FD 21 04 00   [14] 1174 	ld	iy,#4
   4C31 FD 39         [15] 1175 	add	iy,sp
   4C33 FD 96 00      [19] 1176 	sub	a, 0 (iy)
   4C36 D8            [11] 1177 	ret	C
                           1178 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
                           1179 ;src/draws.h:102: switch(mode){
   4C37 FD 5E 00      [19] 1180 	ld	e,0 (iy)
   4C3A 16 00         [ 7] 1181 	ld	d,#0x00
   4C3C 21 42 4C      [10] 1182 	ld	hl,#00111$
   4C3F 19            [11] 1183 	add	hl,de
   4C40 19            [11] 1184 	add	hl,de
                           1185 ;src/draws.h:103: case 0:
   4C41 E9            [ 4] 1186 	jp	(hl)
   4C42                    1187 00111$:
   4C42 18 04         [12] 1188 	jr	00101$
   4C44 18 11         [12] 1189 	jr	00102$
   4C46 18 1E         [12] 1190 	jr	00103$
   4C48                    1191 00101$:
                           1192 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
   4C48 21 04 10      [10] 1193 	ld	hl,#0x1004
   4C4B E5            [11] 1194 	push	hl
   4C4C AF            [ 4] 1195 	xor	a, a
   4C4D F5            [11] 1196 	push	af
   4C4E 33            [ 6] 1197 	inc	sp
   4C4F C5            [11] 1198 	push	bc
   4C50 CD 5E 6F      [17] 1199 	call	_cpct_drawSolidBox
   4C53 F1            [10] 1200 	pop	af
   4C54 F1            [10] 1201 	pop	af
   4C55 33            [ 6] 1202 	inc	sp
                           1203 ;src/draws.h:105: break;
   4C56 C9            [10] 1204 	ret
                           1205 ;src/draws.h:106: case 1:
   4C57                    1206 00102$:
                           1207 ;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
   4C57 21 02 08      [10] 1208 	ld	hl,#0x0802
   4C5A E5            [11] 1209 	push	hl
   4C5B AF            [ 4] 1210 	xor	a, a
   4C5C F5            [11] 1211 	push	af
   4C5D 33            [ 6] 1212 	inc	sp
   4C5E C5            [11] 1213 	push	bc
   4C5F CD 5E 6F      [17] 1214 	call	_cpct_drawSolidBox
   4C62 F1            [10] 1215 	pop	af
   4C63 F1            [10] 1216 	pop	af
   4C64 33            [ 6] 1217 	inc	sp
                           1218 ;src/draws.h:108: break;
   4C65 C9            [10] 1219 	ret
                           1220 ;src/draws.h:109: case 2:
   4C66                    1221 00103$:
                           1222 ;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
   4C66 21 04 04      [10] 1223 	ld	hl,#0x0404
   4C69 E5            [11] 1224 	push	hl
   4C6A AF            [ 4] 1225 	xor	a, a
   4C6B F5            [11] 1226 	push	af
   4C6C 33            [ 6] 1227 	inc	sp
   4C6D C5            [11] 1228 	push	bc
   4C6E CD 5E 6F      [17] 1229 	call	_cpct_drawSolidBox
   4C71 F1            [10] 1230 	pop	af
   4C72 F1            [10] 1231 	pop	af
   4C73 33            [ 6] 1232 	inc	sp
                           1233 ;src/draws.h:112: }
   4C74 C9            [10] 1234 	ret
                           1235 ;src/draws.h:115: void drawStats(){
                           1236 ;	---------------------------------
                           1237 ; Function drawStats
                           1238 ; ---------------------------------
   4C75                    1239 _drawStats::
                           1240 ;src/draws.h:116: drawVida(player.life,1);
   4C75 21 2D 72      [10] 1241 	ld	hl, #_player + 6
   4C78 56            [ 7] 1242 	ld	d,(hl)
   4C79 3E 01         [ 7] 1243 	ld	a,#0x01
   4C7B F5            [11] 1244 	push	af
   4C7C 33            [ 6] 1245 	inc	sp
   4C7D D5            [11] 1246 	push	de
   4C7E 33            [ 6] 1247 	inc	sp
   4C7F CD F7 4A      [17] 1248 	call	_drawVida
   4C82 F1            [10] 1249 	pop	af
                           1250 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C83 21 31 72      [10] 1251 	ld	hl, #_player + 10
   4C86 56            [ 7] 1252 	ld	d,(hl)
   4C87 3E 10         [ 7] 1253 	ld	a,#0x10
   4C89 F5            [11] 1254 	push	af
   4C8A 33            [ 6] 1255 	inc	sp
   4C8B D5            [11] 1256 	push	de
   4C8C 33            [ 6] 1257 	inc	sp
   4C8D CD 58 4B      [17] 1258 	call	_drawBullets
   4C90 F1            [10] 1259 	pop	af
                           1260 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C91 21 3C 72      [10] 1261 	ld	hl, #_enemy + 10
   4C94 56            [ 7] 1262 	ld	d,(hl)
   4C95 3E 38         [ 7] 1263 	ld	a,#0x38
   4C97 F5            [11] 1264 	push	af
   4C98 33            [ 6] 1265 	inc	sp
   4C99 D5            [11] 1266 	push	de
   4C9A 33            [ 6] 1267 	inc	sp
   4C9B CD 58 4B      [17] 1268 	call	_drawBullets
   4C9E F1            [10] 1269 	pop	af
                           1270 ;src/draws.h:119: drawVida(enemy.life,65);
   4C9F 21 3A 72      [10] 1271 	ld	hl, #_enemy + 8
   4CA2 56            [ 7] 1272 	ld	d,(hl)
   4CA3 3E 41         [ 7] 1273 	ld	a,#0x41
   4CA5 F5            [11] 1274 	push	af
   4CA6 33            [ 6] 1275 	inc	sp
   4CA7 D5            [11] 1276 	push	de
   4CA8 33            [ 6] 1277 	inc	sp
   4CA9 CD F7 4A      [17] 1278 	call	_drawVida
   4CAC F1            [10] 1279 	pop	af
   4CAD C9            [10] 1280 	ret
                           1281 ;src/draws.h:124: void draws(){
                           1282 ;	---------------------------------
                           1283 ; Function draws
                           1284 ; ---------------------------------
   4CAE                    1285 _draws::
   4CAE DD E5         [15] 1286 	push	ix
   4CB0 DD 21 00 00   [14] 1287 	ld	ix,#0
   4CB4 DD 39         [15] 1288 	add	ix,sp
   4CB6 3B            [ 6] 1289 	dec	sp
                           1290 ;src/draws.h:126: if(temp%2 == 0)
   4CB7 FD 21 15 72   [14] 1291 	ld	iy,#_temp
   4CBB FD CB 00 46   [20] 1292 	bit	0, 0 (iy)
   4CBF 20 17         [12] 1293 	jr	NZ,00102$
                           1294 ;src/draws.h:127: draw(player.x,player.y,player.sprite,0);
   4CC1 ED 5B 2B 72   [20] 1295 	ld	de, (#_player + 4)
   4CC5 21 28 72      [10] 1296 	ld	hl, #_player + 1
   4CC8 46            [ 7] 1297 	ld	b,(hl)
   4CC9 21 27 72      [10] 1298 	ld	hl, #_player + 0
   4CCC 4E            [ 7] 1299 	ld	c,(hl)
   4CCD AF            [ 4] 1300 	xor	a, a
   4CCE F5            [11] 1301 	push	af
   4CCF 33            [ 6] 1302 	inc	sp
   4CD0 D5            [11] 1303 	push	de
   4CD1 C5            [11] 1304 	push	bc
   4CD2 CD B4 4B      [17] 1305 	call	_draw
   4CD5 F1            [10] 1306 	pop	af
   4CD6 F1            [10] 1307 	pop	af
   4CD7 33            [ 6] 1308 	inc	sp
   4CD8                    1309 00102$:
                           1310 ;src/draws.h:128: if(enemy.life > 0 && temp%2 == 1)
   4CD8 11 32 72      [10] 1311 	ld	de,#_enemy+0
   4CDB 3A 3A 72      [13] 1312 	ld	a, (#_enemy + 8)
   4CDE B7            [ 4] 1313 	or	a, a
   4CDF 28 23         [12] 1314 	jr	Z,00104$
   4CE1 3A 15 72      [13] 1315 	ld	a,(#_temp + 0)
   4CE4 E6 01         [ 7] 1316 	and	a, #0x01
   4CE6 3D            [ 4] 1317 	dec	a
   4CE7 20 1B         [12] 1318 	jr	NZ,00104$
                           1319 ;src/draws.h:129: draw(enemy.x,enemy.y,enemy.sprite,0);
   4CE9 ED 4B 38 72   [20] 1320 	ld	bc, (#_enemy + 6)
   4CED 6B            [ 4] 1321 	ld	l, e
   4CEE 62            [ 4] 1322 	ld	h, d
   4CEF 23            [ 6] 1323 	inc	hl
   4CF0 7E            [ 7] 1324 	ld	a,(hl)
   4CF1 DD 77 FF      [19] 1325 	ld	-1 (ix),a
   4CF4 1A            [ 7] 1326 	ld	a,(de)
   4CF5 5F            [ 4] 1327 	ld	e,a
   4CF6 AF            [ 4] 1328 	xor	a, a
   4CF7 F5            [11] 1329 	push	af
   4CF8 33            [ 6] 1330 	inc	sp
   4CF9 C5            [11] 1331 	push	bc
   4CFA DD 56 FF      [19] 1332 	ld	d, -1 (ix)
   4CFD D5            [11] 1333 	push	de
   4CFE CD B4 4B      [17] 1334 	call	_draw
   4D01 F1            [10] 1335 	pop	af
   4D02 F1            [10] 1336 	pop	af
   4D03 33            [ 6] 1337 	inc	sp
   4D04                    1338 00104$:
                           1339 ;src/draws.h:130: if(arrow == 1){
   4D04 3A 19 72      [13] 1340 	ld	a,(#_arrow + 0)
   4D07 3D            [ 4] 1341 	dec	a
   4D08 20 5C         [12] 1342 	jr	NZ,00116$
                           1343 ;src/draws.h:131: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4D0A 21 24 72      [10] 1344 	ld	hl, #_object + 7
   4D0D 5E            [ 7] 1345 	ld	e,(hl)
                           1346 ;src/draws.h:132: draw(object.x,object.y,object.sprite,2);
   4D0E 01 1E 72      [10] 1347 	ld	bc,#_object + 1
                           1348 ;src/draws.h:131: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4D11 7B            [ 4] 1349 	ld	a,e
   4D12 D6 04         [ 7] 1350 	sub	a, #0x04
   4D14 28 0C         [12] 1351 	jr	Z,00110$
   4D16 21 23 72      [10] 1352 	ld	hl,#_object + 6
   4D19 7B            [ 4] 1353 	ld	a,e
   4D1A D6 06         [ 7] 1354 	sub	a, #0x06
   4D1C 20 25         [12] 1355 	jr	NZ,00111$
   4D1E 7E            [ 7] 1356 	ld	a,(hl)
   4D1F 3D            [ 4] 1357 	dec	a
   4D20 20 21         [12] 1358 	jr	NZ,00111$
   4D22                    1359 00110$:
                           1360 ;src/draws.h:132: draw(object.x,object.y,object.sprite,2);
   4D22 ED 5B 21 72   [20] 1361 	ld	de, (#(_object + 0x0004) + 0)
   4D26 0A            [ 7] 1362 	ld	a,(bc)
   4D27 DD 77 FF      [19] 1363 	ld	-1 (ix),a
   4D2A 21 1D 72      [10] 1364 	ld	hl, #_object + 0
   4D2D 4E            [ 7] 1365 	ld	c,(hl)
   4D2E 3E 02         [ 7] 1366 	ld	a,#0x02
   4D30 F5            [11] 1367 	push	af
   4D31 33            [ 6] 1368 	inc	sp
   4D32 D5            [11] 1369 	push	de
   4D33 DD 7E FF      [19] 1370 	ld	a,-1 (ix)
   4D36 F5            [11] 1371 	push	af
   4D37 33            [ 6] 1372 	inc	sp
   4D38 79            [ 4] 1373 	ld	a,c
   4D39 F5            [11] 1374 	push	af
   4D3A 33            [ 6] 1375 	inc	sp
   4D3B CD B4 4B      [17] 1376 	call	_draw
   4D3E F1            [10] 1377 	pop	af
   4D3F F1            [10] 1378 	pop	af
   4D40 33            [ 6] 1379 	inc	sp
   4D41 18 23         [12] 1380 	jr	00116$
   4D43                    1381 00111$:
                           1382 ;src/draws.h:133: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4D43 7B            [ 4] 1383 	ld	a,e
   4D44 FE 02         [ 7] 1384 	cp	a,#0x02
   4D46 28 08         [12] 1385 	jr	Z,00106$
   4D48 D6 08         [ 7] 1386 	sub	a, #0x08
   4D4A 20 1A         [12] 1387 	jr	NZ,00116$
   4D4C 7E            [ 7] 1388 	ld	a,(hl)
   4D4D 3D            [ 4] 1389 	dec	a
   4D4E 20 16         [12] 1390 	jr	NZ,00116$
   4D50                    1391 00106$:
                           1392 ;src/draws.h:134: draw(object.x,object.y,object.sprite,1);
   4D50 ED 5B 21 72   [20] 1393 	ld	de, (#(_object + 0x0004) + 0)
   4D54 0A            [ 7] 1394 	ld	a,(bc)
   4D55 47            [ 4] 1395 	ld	b,a
   4D56 21 1D 72      [10] 1396 	ld	hl, #_object + 0
   4D59 4E            [ 7] 1397 	ld	c,(hl)
   4D5A 3E 01         [ 7] 1398 	ld	a,#0x01
   4D5C F5            [11] 1399 	push	af
   4D5D 33            [ 6] 1400 	inc	sp
   4D5E D5            [11] 1401 	push	de
   4D5F C5            [11] 1402 	push	bc
   4D60 CD B4 4B      [17] 1403 	call	_draw
   4D63 F1            [10] 1404 	pop	af
   4D64 F1            [10] 1405 	pop	af
   4D65 33            [ 6] 1406 	inc	sp
   4D66                    1407 00116$:
                           1408 ;src/draws.h:136: drawStats();
   4D66 CD 75 4C      [17] 1409 	call	_drawStats
   4D69 33            [ 6] 1410 	inc	sp
   4D6A DD E1         [14] 1411 	pop	ix
   4D6C C9            [10] 1412 	ret
                           1413 ;src/draws.h:139: void erases(){
                           1414 ;	---------------------------------
                           1415 ; Function erases
                           1416 ; ---------------------------------
   4D6D                    1417 _erases::
                           1418 ;src/draws.h:141: if(temp%2 == 0)
   4D6D FD 21 15 72   [14] 1419 	ld	iy,#_temp
   4D71 FD CB 00 46   [20] 1420 	bit	0, 0 (iy)
   4D75 20 14         [12] 1421 	jr	NZ,00102$
                           1422 ;src/draws.h:142: erase(player.lx,player.ly,0);
   4D77 21 2A 72      [10] 1423 	ld	hl, #_player + 3
   4D7A 56            [ 7] 1424 	ld	d,(hl)
   4D7B 21 29 72      [10] 1425 	ld	hl, #_player + 2
   4D7E 46            [ 7] 1426 	ld	b,(hl)
   4D7F AF            [ 4] 1427 	xor	a, a
   4D80 F5            [11] 1428 	push	af
   4D81 33            [ 6] 1429 	inc	sp
   4D82 D5            [11] 1430 	push	de
   4D83 33            [ 6] 1431 	inc	sp
   4D84 C5            [11] 1432 	push	bc
   4D85 33            [ 6] 1433 	inc	sp
   4D86 CD 14 4C      [17] 1434 	call	_erase
   4D89 F1            [10] 1435 	pop	af
   4D8A 33            [ 6] 1436 	inc	sp
   4D8B                    1437 00102$:
                           1438 ;src/draws.h:143: if(temp%2 == 1 && enemy.life > 0)
   4D8B 3A 15 72      [13] 1439 	ld	a,(#_temp + 0)
   4D8E E6 01         [ 7] 1440 	and	a, #0x01
   4D90 3D            [ 4] 1441 	dec	a
   4D91 20 1A         [12] 1442 	jr	NZ,00104$
   4D93 3A 3A 72      [13] 1443 	ld	a, (#_enemy + 8)
   4D96 B7            [ 4] 1444 	or	a, a
   4D97 28 14         [12] 1445 	jr	Z,00104$
                           1446 ;src/draws.h:144: erase(enemy.lx,enemy.ly,0);
   4D99 21 35 72      [10] 1447 	ld	hl, #_enemy + 3
   4D9C 56            [ 7] 1448 	ld	d,(hl)
   4D9D 21 34 72      [10] 1449 	ld	hl, #_enemy + 2
   4DA0 46            [ 7] 1450 	ld	b,(hl)
   4DA1 AF            [ 4] 1451 	xor	a, a
   4DA2 F5            [11] 1452 	push	af
   4DA3 33            [ 6] 1453 	inc	sp
   4DA4 D5            [11] 1454 	push	de
   4DA5 33            [ 6] 1455 	inc	sp
   4DA6 C5            [11] 1456 	push	bc
   4DA7 33            [ 6] 1457 	inc	sp
   4DA8 CD 14 4C      [17] 1458 	call	_erase
   4DAB F1            [10] 1459 	pop	af
   4DAC 33            [ 6] 1460 	inc	sp
   4DAD                    1461 00104$:
                           1462 ;src/draws.h:145: if(arrow == 1){
   4DAD 3A 19 72      [13] 1463 	ld	a,(#_arrow + 0)
   4DB0 3D            [ 4] 1464 	dec	a
   4DB1 C0            [11] 1465 	ret	NZ
                           1466 ;src/draws.h:146: if(object.dir == 4 || object.dir == 6)
   4DB2 21 24 72      [10] 1467 	ld	hl, #_object + 7
   4DB5 5E            [ 7] 1468 	ld	e,(hl)
                           1469 ;src/draws.h:147: erase(object.lx,object.ly,2);
   4DB6 21 20 72      [10] 1470 	ld	hl, #_object + 3
   4DB9 56            [ 7] 1471 	ld	d,(hl)
   4DBA 21 1F 72      [10] 1472 	ld	hl, #_object + 2
   4DBD 46            [ 7] 1473 	ld	b,(hl)
                           1474 ;src/draws.h:146: if(object.dir == 4 || object.dir == 6)
   4DBE 7B            [ 4] 1475 	ld	a,e
   4DBF FE 04         [ 7] 1476 	cp	a,#0x04
   4DC1 28 04         [12] 1477 	jr	Z,00106$
   4DC3 D6 06         [ 7] 1478 	sub	a, #0x06
   4DC5 20 0F         [12] 1479 	jr	NZ,00107$
   4DC7                    1480 00106$:
                           1481 ;src/draws.h:147: erase(object.lx,object.ly,2);
   4DC7 3E 02         [ 7] 1482 	ld	a,#0x02
   4DC9 F5            [11] 1483 	push	af
   4DCA 33            [ 6] 1484 	inc	sp
   4DCB D5            [11] 1485 	push	de
   4DCC 33            [ 6] 1486 	inc	sp
   4DCD C5            [11] 1487 	push	bc
   4DCE 33            [ 6] 1488 	inc	sp
   4DCF CD 14 4C      [17] 1489 	call	_erase
   4DD2 F1            [10] 1490 	pop	af
   4DD3 33            [ 6] 1491 	inc	sp
   4DD4 18 0D         [12] 1492 	jr	00108$
   4DD6                    1493 00107$:
                           1494 ;src/draws.h:149: erase(object.lx,object.ly,1);
   4DD6 3E 01         [ 7] 1495 	ld	a,#0x01
   4DD8 F5            [11] 1496 	push	af
   4DD9 33            [ 6] 1497 	inc	sp
   4DDA D5            [11] 1498 	push	de
   4DDB 33            [ 6] 1499 	inc	sp
   4DDC C5            [11] 1500 	push	bc
   4DDD 33            [ 6] 1501 	inc	sp
   4DDE CD 14 4C      [17] 1502 	call	_erase
   4DE1 F1            [10] 1503 	pop	af
   4DE2 33            [ 6] 1504 	inc	sp
   4DE3                    1505 00108$:
                           1506 ;src/draws.h:150: if(bound == 1) arrow = 0;
   4DE3 3A 1B 72      [13] 1507 	ld	a,(#_bound + 0)
   4DE6 3D            [ 4] 1508 	dec	a
   4DE7 C0            [11] 1509 	ret	NZ
   4DE8 21 19 72      [10] 1510 	ld	hl,#_arrow + 0
   4DEB 36 00         [10] 1511 	ld	(hl), #0x00
   4DED C9            [10] 1512 	ret
                           1513 ;src/draws.h:157: void drawFatiga(u8 atk, u8 col){
                           1514 ;	---------------------------------
                           1515 ; Function drawFatiga
                           1516 ; ---------------------------------
   4DEE                    1517 _drawFatiga::
   4DEE DD E5         [15] 1518 	push	ix
   4DF0 DD 21 00 00   [14] 1519 	ld	ix,#0
   4DF4 DD 39         [15] 1520 	add	ix,sp
   4DF6 F5            [11] 1521 	push	af
                           1522 ;src/draws.h:159: if(atk < 20)
   4DF7 DD 7E 04      [19] 1523 	ld	a,4 (ix)
   4DFA D6 14         [ 7] 1524 	sub	a, #0x14
   4DFC 30 04         [12] 1525 	jr	NC,00102$
                           1526 ;src/draws.h:160: col = 2;
   4DFE DD 36 05 02   [19] 1527 	ld	5 (ix),#0x02
   4E02                    1528 00102$:
                           1529 ;src/draws.h:161: if(atk > 30 || atk <= 20){
   4E02 3E 14         [ 7] 1530 	ld	a,#0x14
   4E04 DD 96 04      [19] 1531 	sub	a, 4 (ix)
   4E07 3E 00         [ 7] 1532 	ld	a,#0x00
   4E09 17            [ 4] 1533 	rla
   4E0A DD 77 FF      [19] 1534 	ld	-1 (ix),a
                           1535 ;src/draws.h:163: switch(col){
   4E0D 3E 02         [ 7] 1536 	ld	a,#0x02
   4E0F DD 96 05      [19] 1537 	sub	a, 5 (ix)
   4E12 3E 00         [ 7] 1538 	ld	a,#0x00
   4E14 17            [ 4] 1539 	rla
   4E15 DD 77 FE      [19] 1540 	ld	-2 (ix),a
                           1541 ;src/draws.h:161: if(atk > 30 || atk <= 20){
   4E18 3E 1E         [ 7] 1542 	ld	a,#0x1E
   4E1A DD 96 04      [19] 1543 	sub	a, 4 (ix)
   4E1D 38 06         [12] 1544 	jr	C,00107$
   4E1F DD 7E FF      [19] 1545 	ld	a,-1 (ix)
   4E22 B7            [ 4] 1546 	or	a, a
   4E23 20 4F         [12] 1547 	jr	NZ,00108$
   4E25                    1548 00107$:
                           1549 ;src/draws.h:162: memptr = cpct_getScreenPtr(VMEM,28,192);
   4E25 21 1C C0      [10] 1550 	ld	hl,#0xC01C
   4E28 E5            [11] 1551 	push	hl
   4E29 2E 00         [ 7] 1552 	ld	l, #0x00
   4E2B E5            [11] 1553 	push	hl
   4E2C CD 2F 70      [17] 1554 	call	_cpct_getScreenPtr
                           1555 ;src/draws.h:163: switch(col){
   4E2F DD 7E FE      [19] 1556 	ld	a,-2 (ix)
   4E32 B7            [ 4] 1557 	or	a, a
   4E33 20 3F         [12] 1558 	jr	NZ,00108$
                           1559 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E35 4D            [ 4] 1560 	ld	c, l
   4E36 44            [ 4] 1561 	ld	b, h
                           1562 ;src/draws.h:163: switch(col){
   4E37 DD 5E 05      [19] 1563 	ld	e,5 (ix)
   4E3A 16 00         [ 7] 1564 	ld	d,#0x00
   4E3C 21 42 4E      [10] 1565 	ld	hl,#00156$
   4E3F 19            [11] 1566 	add	hl,de
   4E40 19            [11] 1567 	add	hl,de
                           1568 ;src/draws.h:164: case 0:
   4E41 E9            [ 4] 1569 	jp	(hl)
   4E42                    1570 00156$:
   4E42 18 04         [12] 1571 	jr	00103$
   4E44 18 14         [12] 1572 	jr	00104$
   4E46 18 20         [12] 1573 	jr	00105$
   4E48                    1574 00103$:
                           1575 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E48 21 02 08      [10] 1576 	ld	hl,#0x0802
   4E4B E5            [11] 1577 	push	hl
   4E4C DD 7E 05      [19] 1578 	ld	a,5 (ix)
   4E4F F5            [11] 1579 	push	af
   4E50 33            [ 6] 1580 	inc	sp
   4E51 C5            [11] 1581 	push	bc
   4E52 CD 5E 6F      [17] 1582 	call	_cpct_drawSolidBox
   4E55 F1            [10] 1583 	pop	af
   4E56 F1            [10] 1584 	pop	af
   4E57 33            [ 6] 1585 	inc	sp
                           1586 ;src/draws.h:166: break;
   4E58 18 1A         [12] 1587 	jr	00108$
                           1588 ;src/draws.h:167: case 1:
   4E5A                    1589 00104$:
                           1590 ;src/draws.h:168: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E5A 11 80 46      [10] 1591 	ld	de,#_fatiga_nor
   4E5D 21 02 08      [10] 1592 	ld	hl,#0x0802
   4E60 E5            [11] 1593 	push	hl
   4E61 C5            [11] 1594 	push	bc
   4E62 D5            [11] 1595 	push	de
   4E63 CD D8 6E      [17] 1596 	call	_cpct_drawSpriteMasked
                           1597 ;src/draws.h:169: break;
   4E66 18 0C         [12] 1598 	jr	00108$
                           1599 ;src/draws.h:170: case 2:
   4E68                    1600 00105$:
                           1601 ;src/draws.h:171: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E68 11 A0 46      [10] 1602 	ld	de,#_fatiga_full
   4E6B 21 02 08      [10] 1603 	ld	hl,#0x0802
   4E6E E5            [11] 1604 	push	hl
   4E6F C5            [11] 1605 	push	bc
   4E70 D5            [11] 1606 	push	de
   4E71 CD D8 6E      [17] 1607 	call	_cpct_drawSpriteMasked
                           1608 ;src/draws.h:172: }
   4E74                    1609 00108$:
                           1610 ;src/draws.h:174: if(atk > 40 || atk <= 20){
   4E74 3E 28         [ 7] 1611 	ld	a,#0x28
   4E76 DD 96 04      [19] 1612 	sub	a, 4 (ix)
   4E79 38 06         [12] 1613 	jr	C,00114$
   4E7B DD 7E FF      [19] 1614 	ld	a,-1 (ix)
   4E7E B7            [ 4] 1615 	or	a, a
   4E7F 20 4F         [12] 1616 	jr	NZ,00115$
   4E81                    1617 00114$:
                           1618 ;src/draws.h:175: memptr = cpct_getScreenPtr(VMEM,31,192);
   4E81 21 1F C0      [10] 1619 	ld	hl,#0xC01F
   4E84 E5            [11] 1620 	push	hl
   4E85 2E 00         [ 7] 1621 	ld	l, #0x00
   4E87 E5            [11] 1622 	push	hl
   4E88 CD 2F 70      [17] 1623 	call	_cpct_getScreenPtr
                           1624 ;src/draws.h:176: switch(col){
   4E8B DD 7E FE      [19] 1625 	ld	a,-2 (ix)
   4E8E B7            [ 4] 1626 	or	a, a
   4E8F 20 3F         [12] 1627 	jr	NZ,00115$
                           1628 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E91 4D            [ 4] 1629 	ld	c, l
   4E92 44            [ 4] 1630 	ld	b, h
                           1631 ;src/draws.h:176: switch(col){
   4E93 DD 5E 05      [19] 1632 	ld	e,5 (ix)
   4E96 16 00         [ 7] 1633 	ld	d,#0x00
   4E98 21 9E 4E      [10] 1634 	ld	hl,#00157$
   4E9B 19            [11] 1635 	add	hl,de
   4E9C 19            [11] 1636 	add	hl,de
                           1637 ;src/draws.h:177: case 0:
   4E9D E9            [ 4] 1638 	jp	(hl)
   4E9E                    1639 00157$:
   4E9E 18 04         [12] 1640 	jr	00110$
   4EA0 18 14         [12] 1641 	jr	00111$
   4EA2 18 20         [12] 1642 	jr	00112$
   4EA4                    1643 00110$:
                           1644 ;src/draws.h:178: cpct_drawSolidBox(memptr, col, 2, 8);
   4EA4 21 02 08      [10] 1645 	ld	hl,#0x0802
   4EA7 E5            [11] 1646 	push	hl
   4EA8 DD 7E 05      [19] 1647 	ld	a,5 (ix)
   4EAB F5            [11] 1648 	push	af
   4EAC 33            [ 6] 1649 	inc	sp
   4EAD C5            [11] 1650 	push	bc
   4EAE CD 5E 6F      [17] 1651 	call	_cpct_drawSolidBox
   4EB1 F1            [10] 1652 	pop	af
   4EB2 F1            [10] 1653 	pop	af
   4EB3 33            [ 6] 1654 	inc	sp
                           1655 ;src/draws.h:179: break;
   4EB4 18 1A         [12] 1656 	jr	00115$
                           1657 ;src/draws.h:180: case 1:
   4EB6                    1658 00111$:
                           1659 ;src/draws.h:181: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4EB6 11 80 46      [10] 1660 	ld	de,#_fatiga_nor
   4EB9 21 02 08      [10] 1661 	ld	hl,#0x0802
   4EBC E5            [11] 1662 	push	hl
   4EBD C5            [11] 1663 	push	bc
   4EBE D5            [11] 1664 	push	de
   4EBF CD D8 6E      [17] 1665 	call	_cpct_drawSpriteMasked
                           1666 ;src/draws.h:182: break;
   4EC2 18 0C         [12] 1667 	jr	00115$
                           1668 ;src/draws.h:183: case 2:
   4EC4                    1669 00112$:
                           1670 ;src/draws.h:184: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4EC4 11 A0 46      [10] 1671 	ld	de,#_fatiga_full
   4EC7 21 02 08      [10] 1672 	ld	hl,#0x0802
   4ECA E5            [11] 1673 	push	hl
   4ECB C5            [11] 1674 	push	bc
   4ECC D5            [11] 1675 	push	de
   4ECD CD D8 6E      [17] 1676 	call	_cpct_drawSpriteMasked
                           1677 ;src/draws.h:185: }
   4ED0                    1678 00115$:
                           1679 ;src/draws.h:187: if(atk <= 20){
   4ED0 DD 7E FF      [19] 1680 	ld	a,-1 (ix)
   4ED3 B7            [ 4] 1681 	or	a, a
   4ED4 20 39         [12] 1682 	jr	NZ,00122$
                           1683 ;src/draws.h:188: memptr = cpct_getScreenPtr(VMEM,34,192);
   4ED6 21 22 C0      [10] 1684 	ld	hl,#0xC022
   4ED9 E5            [11] 1685 	push	hl
   4EDA 2E 00         [ 7] 1686 	ld	l, #0x00
   4EDC E5            [11] 1687 	push	hl
   4EDD CD 2F 70      [17] 1688 	call	_cpct_getScreenPtr
                           1689 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4EE0 4D            [ 4] 1690 	ld	c, l
   4EE1 44            [ 4] 1691 	ld	b, h
                           1692 ;src/draws.h:189: switch(col){
   4EE2 DD 7E 05      [19] 1693 	ld	a,5 (ix)
   4EE5 B7            [ 4] 1694 	or	a, a
   4EE6 28 09         [12] 1695 	jr	Z,00117$
   4EE8 DD 7E 05      [19] 1696 	ld	a,5 (ix)
   4EEB D6 02         [ 7] 1697 	sub	a, #0x02
   4EED 28 14         [12] 1698 	jr	Z,00118$
   4EEF 18 1E         [12] 1699 	jr	00122$
                           1700 ;src/draws.h:190: case 0:
   4EF1                    1701 00117$:
                           1702 ;src/draws.h:191: cpct_drawSolidBox(memptr, col, 2, 8);
   4EF1 21 02 08      [10] 1703 	ld	hl,#0x0802
   4EF4 E5            [11] 1704 	push	hl
   4EF5 DD 7E 05      [19] 1705 	ld	a,5 (ix)
   4EF8 F5            [11] 1706 	push	af
   4EF9 33            [ 6] 1707 	inc	sp
   4EFA C5            [11] 1708 	push	bc
   4EFB CD 5E 6F      [17] 1709 	call	_cpct_drawSolidBox
   4EFE F1            [10] 1710 	pop	af
   4EFF F1            [10] 1711 	pop	af
   4F00 33            [ 6] 1712 	inc	sp
                           1713 ;src/draws.h:192: break;
   4F01 18 0C         [12] 1714 	jr	00122$
                           1715 ;src/draws.h:193: case 2:
   4F03                    1716 00118$:
                           1717 ;src/draws.h:194: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4F03 11 A0 46      [10] 1718 	ld	de,#_fatiga_full
   4F06 21 02 08      [10] 1719 	ld	hl,#0x0802
   4F09 E5            [11] 1720 	push	hl
   4F0A C5            [11] 1721 	push	bc
   4F0B D5            [11] 1722 	push	de
   4F0C CD D8 6E      [17] 1723 	call	_cpct_drawSpriteMasked
                           1724 ;src/draws.h:195: }
   4F0F                    1725 00122$:
   4F0F DD F9         [10] 1726 	ld	sp, ix
   4F11 DD E1         [14] 1727 	pop	ix
   4F13 C9            [10] 1728 	ret
                           1729 ;src/draws.h:200: void drawPickUps(u8 corazon, u8 bullet){
                           1730 ;	---------------------------------
                           1731 ; Function drawPickUps
                           1732 ; ---------------------------------
   4F14                    1733 _drawPickUps::
   4F14 DD E5         [15] 1734 	push	ix
   4F16 DD 21 00 00   [14] 1735 	ld	ix,#0
   4F1A DD 39         [15] 1736 	add	ix,sp
                           1737 ;src/draws.h:203: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4F1C 21 04 A0      [10] 1738 	ld	hl,#0xA004
   4F1F E5            [11] 1739 	push	hl
   4F20 21 00 C0      [10] 1740 	ld	hl,#0xC000
   4F23 E5            [11] 1741 	push	hl
   4F24 CD 2F 70      [17] 1742 	call	_cpct_getScreenPtr
                           1743 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F27 4D            [ 4] 1744 	ld	c, l
   4F28 44            [ 4] 1745 	ld	b, h
                           1746 ;src/draws.h:204: if(corazon == 0)
   4F29 DD 7E 04      [19] 1747 	ld	a,4 (ix)
   4F2C B7            [ 4] 1748 	or	a, a
   4F2D 20 0E         [12] 1749 	jr	NZ,00102$
                           1750 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F2F 11 00 46      [10] 1751 	ld	de,#_corazon_lleno
   4F32 21 04 08      [10] 1752 	ld	hl,#0x0804
   4F35 E5            [11] 1753 	push	hl
   4F36 C5            [11] 1754 	push	bc
   4F37 D5            [11] 1755 	push	de
   4F38 CD D8 6E      [17] 1756 	call	_cpct_drawSpriteMasked
   4F3B 18 0E         [12] 1757 	jr	00103$
   4F3D                    1758 00102$:
                           1759 ;src/draws.h:207: cpct_drawSolidBox(memptr, 0, 4, 8);
   4F3D 21 04 08      [10] 1760 	ld	hl,#0x0804
   4F40 E5            [11] 1761 	push	hl
   4F41 AF            [ 4] 1762 	xor	a, a
   4F42 F5            [11] 1763 	push	af
   4F43 33            [ 6] 1764 	inc	sp
   4F44 C5            [11] 1765 	push	bc
   4F45 CD 5E 6F      [17] 1766 	call	_cpct_drawSolidBox
   4F48 F1            [10] 1767 	pop	af
   4F49 F1            [10] 1768 	pop	af
   4F4A 33            [ 6] 1769 	inc	sp
   4F4B                    1770 00103$:
                           1771 ;src/draws.h:209: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4F4B 21 08 10      [10] 1772 	ld	hl,#0x1008
   4F4E E5            [11] 1773 	push	hl
   4F4F 21 00 C0      [10] 1774 	ld	hl,#0xC000
   4F52 E5            [11] 1775 	push	hl
   4F53 CD 2F 70      [17] 1776 	call	_cpct_getScreenPtr
                           1777 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F56 EB            [ 4] 1778 	ex	de,hl
                           1779 ;src/draws.h:210: if(bullet == 0)
   4F57 DD 7E 05      [19] 1780 	ld	a,5 (ix)
   4F5A B7            [ 4] 1781 	or	a, a
   4F5B 20 0E         [12] 1782 	jr	NZ,00105$
                           1783 ;src/draws.h:211: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4F5D 01 BD 6B      [10] 1784 	ld	bc,#_flecha_arriba
   4F60 21 02 08      [10] 1785 	ld	hl,#0x0802
   4F63 E5            [11] 1786 	push	hl
   4F64 D5            [11] 1787 	push	de
   4F65 C5            [11] 1788 	push	bc
   4F66 CD D8 6E      [17] 1789 	call	_cpct_drawSpriteMasked
   4F69 18 0E         [12] 1790 	jr	00107$
   4F6B                    1791 00105$:
                           1792 ;src/draws.h:213: cpct_drawSolidBox(memptr, 0, 2, 8);
   4F6B 21 02 08      [10] 1793 	ld	hl,#0x0802
   4F6E E5            [11] 1794 	push	hl
   4F6F AF            [ 4] 1795 	xor	a, a
   4F70 F5            [11] 1796 	push	af
   4F71 33            [ 6] 1797 	inc	sp
   4F72 D5            [11] 1798 	push	de
   4F73 CD 5E 6F      [17] 1799 	call	_cpct_drawSolidBox
   4F76 F1            [10] 1800 	pop	af
   4F77 F1            [10] 1801 	pop	af
   4F78 33            [ 6] 1802 	inc	sp
   4F79                    1803 00107$:
   4F79 DD E1         [14] 1804 	pop	ix
   4F7B C9            [10] 1805 	ret
                           1806 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1807 ;	---------------------------------
                           1808 ; Function detectPlayerRoom
                           1809 ; ---------------------------------
   4F7C                    1810 _detectPlayerRoom::
   4F7C DD E5         [15] 1811 	push	ix
   4F7E DD 21 00 00   [14] 1812 	ld	ix,#0
   4F82 DD 39         [15] 1813 	add	ix,sp
                           1814 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   4F84 11 25 71      [10] 1815 	ld	de,#_scene+0
   4F87 DD 7E 05      [19] 1816 	ld	a,5 (ix)
   4F8A 07            [ 4] 1817 	rlca
   4F8B 07            [ 4] 1818 	rlca
   4F8C 07            [ 4] 1819 	rlca
   4F8D 07            [ 4] 1820 	rlca
   4F8E E6 0F         [ 7] 1821 	and	a,#0x0F
   4F90 4F            [ 4] 1822 	ld	c,a
   4F91 06 00         [ 7] 1823 	ld	b,#0x00
   4F93 69            [ 4] 1824 	ld	l, c
   4F94 60            [ 4] 1825 	ld	h, b
   4F95 29            [11] 1826 	add	hl, hl
   4F96 29            [11] 1827 	add	hl, hl
   4F97 09            [11] 1828 	add	hl, bc
   4F98 29            [11] 1829 	add	hl, hl
   4F99 29            [11] 1830 	add	hl, hl
   4F9A 19            [11] 1831 	add	hl,de
   4F9B DD 5E 04      [19] 1832 	ld	e,4 (ix)
   4F9E CB 3B         [ 8] 1833 	srl	e
   4FA0 CB 3B         [ 8] 1834 	srl	e
   4FA2 16 00         [ 7] 1835 	ld	d,#0x00
   4FA4 19            [11] 1836 	add	hl,de
   4FA5 6E            [ 7] 1837 	ld	l,(hl)
   4FA6 DD E1         [14] 1838 	pop	ix
   4FA8 C9            [10] 1839 	ret
                           1840 ;src/ia.h:16: u8 chooseDirection(){
                           1841 ;	---------------------------------
                           1842 ; Function chooseDirection
                           1843 ; ---------------------------------
   4FA9                    1844 _chooseDirection::
                           1845 ;src/ia.h:18: u8 dir = 0;
   4FA9 16 00         [ 7] 1846 	ld	d,#0x00
                           1847 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   4FAB D5            [11] 1848 	push	de
   4FAC CD D7 6C      [17] 1849 	call	_rand
   4FAF 01 04 00      [10] 1850 	ld	bc,#0x0004
   4FB2 C5            [11] 1851 	push	bc
   4FB3 E5            [11] 1852 	push	hl
   4FB4 CD 23 70      [17] 1853 	call	__modsint
   4FB7 F1            [10] 1854 	pop	af
   4FB8 F1            [10] 1855 	pop	af
   4FB9 D1            [10] 1856 	pop	de
   4FBA 5D            [ 4] 1857 	ld	e,l
   4FBB 1C            [ 4] 1858 	inc	e
                           1859 ;src/ia.h:20: switch(rnd){
   4FBC 7B            [ 4] 1860 	ld	a,e
   4FBD D6 01         [ 7] 1861 	sub	a, #0x01
   4FBF 38 24         [12] 1862 	jr	C,00105$
   4FC1 3E 04         [ 7] 1863 	ld	a,#0x04
   4FC3 93            [ 4] 1864 	sub	a, e
   4FC4 38 1F         [12] 1865 	jr	C,00105$
   4FC6 1D            [ 4] 1866 	dec	e
   4FC7 16 00         [ 7] 1867 	ld	d,#0x00
   4FC9 21 CF 4F      [10] 1868 	ld	hl,#00116$
   4FCC 19            [11] 1869 	add	hl,de
   4FCD 19            [11] 1870 	add	hl,de
                           1871 ;src/ia.h:21: case 4: dir = 6;break;
   4FCE E9            [ 4] 1872 	jp	(hl)
   4FCF                    1873 00116$:
   4FCF 18 12         [12] 1874 	jr	00104$
   4FD1 18 0C         [12] 1875 	jr	00103$
   4FD3 18 06         [12] 1876 	jr	00102$
   4FD5 18 00         [12] 1877 	jr	00101$
   4FD7                    1878 00101$:
   4FD7 16 06         [ 7] 1879 	ld	d,#0x06
   4FD9 18 0A         [12] 1880 	jr	00105$
                           1881 ;src/ia.h:22: case 3: dir = 4;break;
   4FDB                    1882 00102$:
   4FDB 16 04         [ 7] 1883 	ld	d,#0x04
   4FDD 18 06         [12] 1884 	jr	00105$
                           1885 ;src/ia.h:23: case 2: dir = 2;break;
   4FDF                    1886 00103$:
   4FDF 16 02         [ 7] 1887 	ld	d,#0x02
   4FE1 18 02         [12] 1888 	jr	00105$
                           1889 ;src/ia.h:24: case 1: dir = 8;break;
   4FE3                    1890 00104$:
   4FE3 16 08         [ 7] 1891 	ld	d,#0x08
                           1892 ;src/ia.h:25: }
   4FE5                    1893 00105$:
                           1894 ;src/ia.h:27: return dir;
   4FE5 6A            [ 4] 1895 	ld	l,d
   4FE6 C9            [10] 1896 	ret
                           1897 ;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           1898 ;	---------------------------------
                           1899 ; Function setDirection
                           1900 ; ---------------------------------
   4FE7                    1901 _setDirection::
   4FE7 DD E5         [15] 1902 	push	ix
   4FE9 DD 21 00 00   [14] 1903 	ld	ix,#0
   4FED DD 39         [15] 1904 	add	ix,sp
                           1905 ;src/ia.h:33: if(px < x) dir = 4;
   4FEF DD 7E 04      [19] 1906 	ld	a,4 (ix)
   4FF2 DD 96 06      [19] 1907 	sub	a, 6 (ix)
   4FF5 30 04         [12] 1908 	jr	NC,00108$
   4FF7 2E 04         [ 7] 1909 	ld	l,#0x04
   4FF9 18 1A         [12] 1910 	jr	00109$
   4FFB                    1911 00108$:
                           1912 ;src/ia.h:34: else if(py > y) dir = 2;
   4FFB DD 7E 07      [19] 1913 	ld	a,7 (ix)
   4FFE DD 96 05      [19] 1914 	sub	a, 5 (ix)
   5001 30 04         [12] 1915 	jr	NC,00105$
   5003 2E 02         [ 7] 1916 	ld	l,#0x02
   5005 18 0E         [12] 1917 	jr	00109$
   5007                    1918 00105$:
                           1919 ;src/ia.h:35: else if(px > x) dir = 6;
   5007 DD 7E 06      [19] 1920 	ld	a,6 (ix)
   500A DD 96 04      [19] 1921 	sub	a, 4 (ix)
   500D 30 04         [12] 1922 	jr	NC,00102$
   500F 2E 06         [ 7] 1923 	ld	l,#0x06
   5011 18 02         [12] 1924 	jr	00109$
   5013                    1925 00102$:
                           1926 ;src/ia.h:36: else dir = 8;
   5013 2E 08         [ 7] 1927 	ld	l,#0x08
   5015                    1928 00109$:
                           1929 ;src/ia.h:37: return dir;
   5015 DD E1         [14] 1930 	pop	ix
   5017 C9            [10] 1931 	ret
                           1932 ;src/ia.h:40: void movement(u8 dir){
                           1933 ;	---------------------------------
                           1934 ; Function movement
                           1935 ; ---------------------------------
   5018                    1936 _movement::
                           1937 ;src/ia.h:41: switch(dir){
   5018 FD 21 02 00   [14] 1938 	ld	iy,#2
   501C FD 39         [15] 1939 	add	iy,sp
   501E FD 7E 00      [19] 1940 	ld	a,0 (iy)
   5021 D6 02         [ 7] 1941 	sub	a, #0x02
   5023 28 2B         [12] 1942 	jr	Z,00104$
   5025 FD 7E 00      [19] 1943 	ld	a,0 (iy)
   5028 D6 04         [ 7] 1944 	sub	a, #0x04
   502A 28 14         [12] 1945 	jr	Z,00102$
   502C FD 7E 00      [19] 1946 	ld	a,0 (iy)
   502F D6 06         [ 7] 1947 	sub	a, #0x06
   5031 28 08         [12] 1948 	jr	Z,00101$
   5033 FD 7E 00      [19] 1949 	ld	a,0 (iy)
   5036 D6 08         [ 7] 1950 	sub	a, #0x08
   5038 28 0E         [12] 1951 	jr	Z,00103$
   503A C9            [10] 1952 	ret
                           1953 ;src/ia.h:42: case 6: enemy.x += 1; break;
   503B                    1954 00101$:
   503B 21 32 72      [10] 1955 	ld	hl,#_enemy+0
   503E 34            [11] 1956 	inc	(hl)
   503F C9            [10] 1957 	ret
                           1958 ;src/ia.h:43: case 4: enemy.x -= 1; break;
   5040                    1959 00102$:
   5040 11 32 72      [10] 1960 	ld	de,#_enemy+0
   5043 1A            [ 7] 1961 	ld	a,(de)
   5044 C6 FF         [ 7] 1962 	add	a,#0xFF
   5046 12            [ 7] 1963 	ld	(de),a
   5047 C9            [10] 1964 	ret
                           1965 ;src/ia.h:44: case 8: enemy.y -= 2; break;
   5048                    1966 00103$:
   5048 11 33 72      [10] 1967 	ld	de,#_enemy+1
   504B 1A            [ 7] 1968 	ld	a,(de)
   504C C6 FE         [ 7] 1969 	add	a,#0xFE
   504E 12            [ 7] 1970 	ld	(de),a
   504F C9            [10] 1971 	ret
                           1972 ;src/ia.h:45: case 2: enemy.y += 2; break;
   5050                    1973 00104$:
   5050 21 33 72      [10] 1974 	ld	hl,#_enemy+1
   5053 7E            [ 7] 1975 	ld	a,(hl)
   5054 C6 02         [ 7] 1976 	add	a, #0x02
   5056 77            [ 7] 1977 	ld	(hl),a
                           1978 ;src/ia.h:46: }
   5057 C9            [10] 1979 	ret
                           1980 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           1981 ;	---------------------------------
                           1982 ; Function checkCollisions
                           1983 ; ---------------------------------
   5058                    1984 _checkCollisions::
   5058 DD E5         [15] 1985 	push	ix
   505A DD 21 00 00   [14] 1986 	ld	ix,#0
   505E DD 39         [15] 1987 	add	ix,sp
   5060 21 FA FF      [10] 1988 	ld	hl,#-6
   5063 39            [11] 1989 	add	hl,sp
   5064 F9            [ 6] 1990 	ld	sp,hl
                           1991 ;src/CalcColision.h:14: switch(atk){
   5065 DD 7E 08      [19] 1992 	ld	a,8 (ix)
   5068 D6 15         [ 7] 1993 	sub	a, #0x15
   506A 28 09         [12] 1994 	jr	Z,00101$
   506C DD 7E 08      [19] 1995 	ld	a,8 (ix)
   506F D6 16         [ 7] 1996 	sub	a, #0x16
   5071 28 08         [12] 1997 	jr	Z,00102$
   5073 18 0C         [12] 1998 	jr	00103$
                           1999 ;src/CalcColision.h:15: case 21:
   5075                    2000 00101$:
                           2001 ;src/CalcColision.h:16: auxX = 2;
   5075 1E 02         [ 7] 2002 	ld	e,#0x02
                           2003 ;src/CalcColision.h:17: auxY = 8;
   5077 0E 08         [ 7] 2004 	ld	c,#0x08
                           2005 ;src/CalcColision.h:18: break;
   5079 18 0A         [12] 2006 	jr	00104$
                           2007 ;src/CalcColision.h:19: case 22:
   507B                    2008 00102$:
                           2009 ;src/CalcColision.h:20: auxX = 4;
   507B 1E 04         [ 7] 2010 	ld	e,#0x04
                           2011 ;src/CalcColision.h:21: auxY = 4;
   507D 0E 04         [ 7] 2012 	ld	c,#0x04
                           2013 ;src/CalcColision.h:22: break;
   507F 18 04         [12] 2014 	jr	00104$
                           2015 ;src/CalcColision.h:23: default:
   5081                    2016 00103$:
                           2017 ;src/CalcColision.h:24: auxX = tilewidth;
   5081 1E 04         [ 7] 2018 	ld	e,#0x04
                           2019 ;src/CalcColision.h:25: auxY = tileheight;
   5083 0E 10         [ 7] 2020 	ld	c,#0x10
                           2021 ;src/CalcColision.h:26: }
   5085                    2022 00104$:
                           2023 ;src/CalcColision.h:27: popX = pX + auxX;
   5085 DD 7E 04      [19] 2024 	ld	a,4 (ix)
   5088 83            [ 4] 2025 	add	a, e
   5089 6F            [ 4] 2026 	ld	l,a
                           2027 ;src/CalcColision.h:28: popY = pY + auxY;
   508A DD 7E 05      [19] 2028 	ld	a,5 (ix)
   508D 81            [ 4] 2029 	add	a, c
   508E DD 77 FB      [19] 2030 	ld	-5 (ix),a
                           2031 ;src/CalcColision.h:29: eopX = eX + auxX;
   5091 DD 7E 06      [19] 2032 	ld	a,6 (ix)
   5094 83            [ 4] 2033 	add	a, e
   5095 5F            [ 4] 2034 	ld	e,a
                           2035 ;src/CalcColision.h:30: eopY = eY + auxY;
   5096 DD 7E 07      [19] 2036 	ld	a,7 (ix)
   5099 81            [ 4] 2037 	add	a, c
   509A DD 77 FA      [19] 2038 	ld	-6 (ix),a
                           2039 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   509D 7B            [ 4] 2040 	ld	a,e
   509E DD 96 04      [19] 2041 	sub	a, 4 (ix)
   50A1 3E 00         [ 7] 2042 	ld	a,#0x00
   50A3 17            [ 4] 2043 	rla
   50A4 DD 77 FC      [19] 2044 	ld	-4 (ix),a
   50A7 7D            [ 4] 2045 	ld	a,l
   50A8 93            [ 4] 2046 	sub	a, e
   50A9 3E 00         [ 7] 2047 	ld	a,#0x00
   50AB 17            [ 4] 2048 	rla
   50AC DD 77 FD      [19] 2049 	ld	-3 (ix),a
   50AF DD 7E 07      [19] 2050 	ld	a,7 (ix)
   50B2 DD 96 05      [19] 2051 	sub	a, 5 (ix)
   50B5 3E 00         [ 7] 2052 	ld	a,#0x00
   50B7 17            [ 4] 2053 	rla
   50B8 5F            [ 4] 2054 	ld	e,a
   50B9 DD 7E FB      [19] 2055 	ld	a,-5 (ix)
   50BC DD 96 07      [19] 2056 	sub	a, 7 (ix)
   50BF 3E 00         [ 7] 2057 	ld	a,#0x00
   50C1 17            [ 4] 2058 	rla
   50C2 4F            [ 4] 2059 	ld	c,a
                           2060 ;src/CalcColision.h:33: if(atk >= 21)
   50C3 DD 7E 08      [19] 2061 	ld	a,8 (ix)
   50C6 D6 15         [ 7] 2062 	sub	a, #0x15
   50C8 3E 00         [ 7] 2063 	ld	a,#0x00
   50CA 17            [ 4] 2064 	rla
   50CB DD 77 FF      [19] 2065 	ld	-1 (ix),a
                           2066 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   50CE DD 7E FC      [19] 2067 	ld	a,-4 (ix)
   50D1 B7            [ 4] 2068 	or	a, a
   50D2 20 1C         [12] 2069 	jr	NZ,00109$
   50D4 DD 7E FD      [19] 2070 	ld	a,-3 (ix)
   50D7 B7            [ 4] 2071 	or	a,a
   50D8 20 16         [12] 2072 	jr	NZ,00109$
   50DA B3            [ 4] 2073 	or	a,e
   50DB 20 13         [12] 2074 	jr	NZ,00109$
   50DD B1            [ 4] 2075 	or	a,c
   50DE 20 10         [12] 2076 	jr	NZ,00109$
                           2077 ;src/CalcColision.h:33: if(atk >= 21)
   50E0 DD 7E FF      [19] 2078 	ld	a,-1 (ix)
   50E3 B7            [ 4] 2079 	or	a, a
   50E4 20 05         [12] 2080 	jr	NZ,00106$
                           2081 ;src/CalcColision.h:34: return 1;
   50E6 2E 01         [ 7] 2082 	ld	l,#0x01
   50E8 C3 74 51      [10] 2083 	jp	00137$
   50EB                    2084 00106$:
                           2085 ;src/CalcColision.h:36: return 2;
   50EB 2E 02         [ 7] 2086 	ld	l,#0x02
   50ED C3 74 51      [10] 2087 	jp	00137$
   50F0                    2088 00109$:
                           2089 ;src/CalcColision.h:38: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   50F0 DD 7E 06      [19] 2090 	ld	a,6 (ix)
   50F3 DD 96 04      [19] 2091 	sub	a, 4 (ix)
   50F6 3E 00         [ 7] 2092 	ld	a,#0x00
   50F8 17            [ 4] 2093 	rla
   50F9 DD 77 FE      [19] 2094 	ld	-2 (ix),a
   50FC 7D            [ 4] 2095 	ld	a,l
   50FD DD 96 06      [19] 2096 	sub	a, 6 (ix)
   5100 3E 00         [ 7] 2097 	ld	a,#0x00
   5102 17            [ 4] 2098 	rla
   5103 6F            [ 4] 2099 	ld	l,a
   5104 DD 7E FE      [19] 2100 	ld	a,-2 (ix)
   5107 B7            [ 4] 2101 	or	a,a
   5108 20 17         [12] 2102 	jr	NZ,00117$
   510A B5            [ 4] 2103 	or	a,l
   510B 20 14         [12] 2104 	jr	NZ,00117$
   510D B3            [ 4] 2105 	or	a,e
   510E 20 11         [12] 2106 	jr	NZ,00117$
   5110 B1            [ 4] 2107 	or	a,c
   5111 20 0E         [12] 2108 	jr	NZ,00117$
                           2109 ;src/CalcColision.h:39: if(atk >= 21)
   5113 DD 7E FF      [19] 2110 	ld	a,-1 (ix)
   5116 B7            [ 4] 2111 	or	a, a
   5117 20 04         [12] 2112 	jr	NZ,00114$
                           2113 ;src/CalcColision.h:40: return 1;
   5119 2E 01         [ 7] 2114 	ld	l,#0x01
   511B 18 57         [12] 2115 	jr	00137$
   511D                    2116 00114$:
                           2117 ;src/CalcColision.h:42: return 2;
   511D 2E 02         [ 7] 2118 	ld	l,#0x02
   511F 18 53         [12] 2119 	jr	00137$
   5121                    2120 00117$:
                           2121 ;src/CalcColision.h:44: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   5121 DD 7E FA      [19] 2122 	ld	a,-6 (ix)
   5124 DD 96 05      [19] 2123 	sub	a, 5 (ix)
   5127 3E 00         [ 7] 2124 	ld	a,#0x00
   5129 17            [ 4] 2125 	rla
   512A 5F            [ 4] 2126 	ld	e,a
   512B DD 7E FB      [19] 2127 	ld	a,-5 (ix)
   512E DD 96 FA      [19] 2128 	sub	a, -6 (ix)
   5131 3E 00         [ 7] 2129 	ld	a,#0x00
   5133 17            [ 4] 2130 	rla
   5134 67            [ 4] 2131 	ld	h,a
   5135 DD 7E FE      [19] 2132 	ld	a,-2 (ix)
   5138 B7            [ 4] 2133 	or	a,a
   5139 20 17         [12] 2134 	jr	NZ,00125$
   513B B5            [ 4] 2135 	or	a,l
   513C 20 14         [12] 2136 	jr	NZ,00125$
   513E B3            [ 4] 2137 	or	a,e
   513F 20 11         [12] 2138 	jr	NZ,00125$
   5141 B4            [ 4] 2139 	or	a,h
   5142 20 0E         [12] 2140 	jr	NZ,00125$
                           2141 ;src/CalcColision.h:45: if(atk >= 21)
   5144 DD 7E FF      [19] 2142 	ld	a,-1 (ix)
   5147 B7            [ 4] 2143 	or	a, a
   5148 20 04         [12] 2144 	jr	NZ,00122$
                           2145 ;src/CalcColision.h:46: return 1;
   514A 2E 01         [ 7] 2146 	ld	l,#0x01
   514C 18 26         [12] 2147 	jr	00137$
   514E                    2148 00122$:
                           2149 ;src/CalcColision.h:48: return 2;
   514E 2E 02         [ 7] 2150 	ld	l,#0x02
   5150 18 22         [12] 2151 	jr	00137$
   5152                    2152 00125$:
                           2153 ;src/CalcColision.h:50: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   5152 DD 7E FC      [19] 2154 	ld	a,-4 (ix)
   5155 B7            [ 4] 2155 	or	a, a
   5156 20 1A         [12] 2156 	jr	NZ,00133$
   5158 DD 7E FD      [19] 2157 	ld	a,-3 (ix)
   515B B7            [ 4] 2158 	or	a,a
   515C 20 14         [12] 2159 	jr	NZ,00133$
   515E B3            [ 4] 2160 	or	a,e
   515F 20 11         [12] 2161 	jr	NZ,00133$
   5161 B4            [ 4] 2162 	or	a,h
   5162 20 0E         [12] 2163 	jr	NZ,00133$
                           2164 ;src/CalcColision.h:51: if(atk >= 21)
   5164 DD 7E FF      [19] 2165 	ld	a,-1 (ix)
   5167 B7            [ 4] 2166 	or	a, a
   5168 20 04         [12] 2167 	jr	NZ,00130$
                           2168 ;src/CalcColision.h:52: return 1;
   516A 2E 01         [ 7] 2169 	ld	l,#0x01
   516C 18 06         [12] 2170 	jr	00137$
   516E                    2171 00130$:
                           2172 ;src/CalcColision.h:54: return 2;
   516E 2E 02         [ 7] 2173 	ld	l,#0x02
   5170 18 02         [12] 2174 	jr	00137$
   5172                    2175 00133$:
                           2176 ;src/CalcColision.h:56: return 0;
   5172 2E 00         [ 7] 2177 	ld	l,#0x00
   5174                    2178 00137$:
   5174 DD F9         [10] 2179 	ld	sp, ix
   5176 DD E1         [14] 2180 	pop	ix
   5178 C9            [10] 2181 	ret
                           2182 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2183 ;	---------------------------------
                           2184 ; Function checkKeyboard
                           2185 ; ---------------------------------
   5179                    2186 _checkKeyboard::
   5179 DD E5         [15] 2187 	push	ix
   517B DD 21 00 00   [14] 2188 	ld	ix,#0
   517F DD 39         [15] 2189 	add	ix,sp
   5181 21 FA FF      [10] 2190 	ld	hl,#-6
   5184 39            [11] 2191 	add	hl,sp
   5185 F9            [ 6] 2192 	ld	sp,hl
                           2193 ;src/keyboard.h:14: u8 *s = NULL;
   5186 DD 36 FD 00   [19] 2194 	ld	-3 (ix),#0x00
   518A DD 36 FE 00   [19] 2195 	ld	-2 (ix),#0x00
                           2196 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   518E 21 05 80      [10] 2197 	ld	hl,#0x8005
   5191 CD 61 6C      [17] 2198 	call	_cpct_isKeyPressed
   5194 4D            [ 4] 2199 	ld	c,l
   5195 79            [ 4] 2200 	ld	a,c
   5196 B7            [ 4] 2201 	or	a, a
   5197 28 68         [12] 2202 	jr	Z,00145$
   5199 21 2F 72      [10] 2203 	ld	hl, #(_player + 0x0008) + 0
   519C 7E            [ 7] 2204 	ld	a,(hl)
   519D DD 77 FC      [19] 2205 	ld	-4 (ix), a
   51A0 D6 14         [ 7] 2206 	sub	a, #0x14
   51A2 38 5D         [12] 2207 	jr	C,00145$
                           2208 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   51A4 DD 7E FC      [19] 2209 	ld	a,-4 (ix)
   51A7 D6 32         [ 7] 2210 	sub	a, #0x32
   51A9 38 07         [12] 2211 	jr	C,00102$
   51AB 21 2F 72      [10] 2212 	ld	hl,#(_player + 0x0008)
   51AE 36 00         [10] 2213 	ld	(hl),#0x00
   51B0 18 08         [12] 2214 	jr	00103$
   51B2                    2215 00102$:
                           2216 ;src/keyboard.h:17: else player.atk += 1;
   51B2 DD 7E FC      [19] 2217 	ld	a,-4 (ix)
   51B5 3C            [ 4] 2218 	inc	a
   51B6 21 2F 72      [10] 2219 	ld	hl,#(_player + 0x0008)
   51B9 77            [ 7] 2220 	ld	(hl),a
   51BA                    2221 00103$:
                           2222 ;src/keyboard.h:18: switch(player.dir){
   51BA 21 2E 72      [10] 2223 	ld	hl, #_player + 7
   51BD 66            [ 7] 2224 	ld	h,(hl)
   51BE 7C            [ 4] 2225 	ld	a,h
   51BF D6 02         [ 7] 2226 	sub	a, #0x02
   51C1 28 33         [12] 2227 	jr	Z,00107$
   51C3 7C            [ 4] 2228 	ld	a,h
   51C4 D6 04         [ 7] 2229 	sub	a, #0x04
   51C6 28 0D         [12] 2230 	jr	Z,00104$
   51C8 7C            [ 4] 2231 	ld	a,h
   51C9 D6 06         [ 7] 2232 	sub	a, #0x06
   51CB 28 13         [12] 2233 	jr	Z,00105$
   51CD 7C            [ 4] 2234 	ld	a,h
   51CE D6 08         [ 7] 2235 	sub	a, #0x08
   51D0 28 19         [12] 2236 	jr	Z,00106$
   51D2 C3 DB 53      [10] 2237 	jp	00146$
                           2238 ;src/keyboard.h:19: case 4:
   51D5                    2239 00104$:
                           2240 ;src/keyboard.h:20: s = gladis_atk_izda;
   51D5 DD 36 FD 80   [19] 2241 	ld	-3 (ix),#<(_gladis_atk_izda)
   51D9 DD 36 FE 41   [19] 2242 	ld	-2 (ix),#>(_gladis_atk_izda)
                           2243 ;src/keyboard.h:21: break;
   51DD C3 DB 53      [10] 2244 	jp	00146$
                           2245 ;src/keyboard.h:22: case 6:
   51E0                    2246 00105$:
                           2247 ;src/keyboard.h:23: s = gladis_atk_dcha;
   51E0 DD 36 FD 00   [19] 2248 	ld	-3 (ix),#<(_gladis_atk_dcha)
   51E4 DD 36 FE 41   [19] 2249 	ld	-2 (ix),#>(_gladis_atk_dcha)
                           2250 ;src/keyboard.h:24: break;
   51E8 C3 DB 53      [10] 2251 	jp	00146$
                           2252 ;src/keyboard.h:25: case 8:
   51EB                    2253 00106$:
                           2254 ;src/keyboard.h:26: s = gladis_atk_arriba;
   51EB DD 36 FD 80   [19] 2255 	ld	-3 (ix),#<(_gladis_atk_arriba)
   51EF DD 36 FE 43   [19] 2256 	ld	-2 (ix),#>(_gladis_atk_arriba)
                           2257 ;src/keyboard.h:27: break;
   51F3 C3 DB 53      [10] 2258 	jp	00146$
                           2259 ;src/keyboard.h:28: case 2:
   51F6                    2260 00107$:
                           2261 ;src/keyboard.h:29: s = gladis_atk_abajo;
   51F6 DD 36 FD 00   [19] 2262 	ld	-3 (ix),#<(_gladis_atk_abajo)
   51FA DD 36 FE 43   [19] 2263 	ld	-2 (ix),#>(_gladis_atk_abajo)
                           2264 ;src/keyboard.h:31: }
   51FE C3 DB 53      [10] 2265 	jp	00146$
   5201                    2266 00145$:
                           2267 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   5201 21 2F 72      [10] 2268 	ld	hl, #(_player + 0x0008) + 0
   5204 56            [ 7] 2269 	ld	d,(hl)
   5205 7A            [ 4] 2270 	ld	a,d
   5206 D6 14         [ 7] 2271 	sub	a, #0x14
   5208 30 07         [12] 2272 	jr	NC,00110$
   520A 14            [ 4] 2273 	inc	d
   520B 21 2F 72      [10] 2274 	ld	hl,#(_player + 0x0008)
   520E 72            [ 7] 2275 	ld	(hl),d
   520F 18 05         [12] 2276 	jr	00111$
   5211                    2277 00110$:
                           2278 ;src/keyboard.h:34: else player.atk = 20;
   5211 21 2F 72      [10] 2279 	ld	hl,#(_player + 0x0008)
   5214 36 14         [10] 2280 	ld	(hl),#0x14
   5216                    2281 00111$:
                           2282 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   5216 21 00 02      [10] 2283 	ld	hl,#0x0200
   5219 CD 61 6C      [17] 2284 	call	_cpct_isKeyPressed
                           2285 ;src/keyboard.h:37: player.dir = 6;
                           2286 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   521C 7D            [ 4] 2287 	ld	a,l
   521D B7            [ 4] 2288 	or	a, a
   521E 28 1E         [12] 2289 	jr	Z,00141$
   5220 21 27 72      [10] 2290 	ld	hl, #_player + 0
   5223 56            [ 7] 2291 	ld	d,(hl)
   5224 7A            [ 4] 2292 	ld	a,d
   5225 D6 4C         [ 7] 2293 	sub	a, #0x4C
   5227 30 15         [12] 2294 	jr	NC,00141$
                           2295 ;src/keyboard.h:36: player.x += 1;
   5229 14            [ 4] 2296 	inc	d
   522A 21 27 72      [10] 2297 	ld	hl,#_player
   522D 72            [ 7] 2298 	ld	(hl),d
                           2299 ;src/keyboard.h:37: player.dir = 6;
   522E 21 2E 72      [10] 2300 	ld	hl,#(_player + 0x0007)
   5231 36 06         [10] 2301 	ld	(hl),#0x06
                           2302 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   5233 DD 36 FD 00   [19] 2303 	ld	-3 (ix),#<(_gladis_quieto_dcha)
   5237 DD 36 FE 40   [19] 2304 	ld	-2 (ix),#>(_gladis_quieto_dcha)
   523B C3 DB 53      [10] 2305 	jp	00146$
   523E                    2306 00141$:
                           2307 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   523E 21 01 01      [10] 2308 	ld	hl,#0x0101
   5241 CD 61 6C      [17] 2309 	call	_cpct_isKeyPressed
   5244 7D            [ 4] 2310 	ld	a,l
   5245 B7            [ 4] 2311 	or	a, a
   5246 28 1B         [12] 2312 	jr	Z,00137$
   5248 3A 27 72      [13] 2313 	ld	a, (#_player + 0)
   524B B7            [ 4] 2314 	or	a, a
   524C 28 15         [12] 2315 	jr	Z,00137$
                           2316 ;src/keyboard.h:40: player.x -= 1;
   524E C6 FF         [ 7] 2317 	add	a,#0xFF
   5250 32 27 72      [13] 2318 	ld	(#_player),a
                           2319 ;src/keyboard.h:41: player.dir = 4;
   5253 21 2E 72      [10] 2320 	ld	hl,#(_player + 0x0007)
   5256 36 04         [10] 2321 	ld	(hl),#0x04
                           2322 ;src/keyboard.h:42: s = gladis_quieto_izda;
   5258 DD 36 FD 80   [19] 2323 	ld	-3 (ix),#<(_gladis_quieto_izda)
   525C DD 36 FE 40   [19] 2324 	ld	-2 (ix),#>(_gladis_quieto_izda)
   5260 C3 DB 53      [10] 2325 	jp	00146$
   5263                    2326 00137$:
                           2327 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   5263 21 00 04      [10] 2328 	ld	hl,#0x0400
   5266 CD 61 6C      [17] 2329 	call	_cpct_isKeyPressed
   5269 7D            [ 4] 2330 	ld	a,l
   526A B7            [ 4] 2331 	or	a, a
   526B 28 1F         [12] 2332 	jr	Z,00133$
   526D 21 28 72      [10] 2333 	ld	hl, #(_player + 0x0001) + 0
   5270 56            [ 7] 2334 	ld	d,(hl)
   5271 7A            [ 4] 2335 	ld	a,d
   5272 D6 B4         [ 7] 2336 	sub	a, #0xB4
   5274 30 16         [12] 2337 	jr	NC,00133$
                           2338 ;src/keyboard.h:44: player.y += 2;
   5276 14            [ 4] 2339 	inc	d
   5277 14            [ 4] 2340 	inc	d
   5278 21 28 72      [10] 2341 	ld	hl,#(_player + 0x0001)
   527B 72            [ 7] 2342 	ld	(hl),d
                           2343 ;src/keyboard.h:45: player.dir = 2;
   527C 21 2E 72      [10] 2344 	ld	hl,#(_player + 0x0007)
   527F 36 02         [10] 2345 	ld	(hl),#0x02
                           2346 ;src/keyboard.h:46: s = gladis_abajo;
   5281 DD 36 FD 80   [19] 2347 	ld	-3 (ix),#<(_gladis_abajo)
   5285 DD 36 FE 42   [19] 2348 	ld	-2 (ix),#>(_gladis_abajo)
   5289 C3 DB 53      [10] 2349 	jp	00146$
   528C                    2350 00133$:
                           2351 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   528C 21 00 01      [10] 2352 	ld	hl,#0x0100
   528F CD 61 6C      [17] 2353 	call	_cpct_isKeyPressed
   5292 7D            [ 4] 2354 	ld	a,l
   5293 B7            [ 4] 2355 	or	a, a
   5294 28 1B         [12] 2356 	jr	Z,00129$
   5296 3A 28 72      [13] 2357 	ld	a, (#(_player + 0x0001) + 0)
   5299 B7            [ 4] 2358 	or	a, a
   529A 28 15         [12] 2359 	jr	Z,00129$
                           2360 ;src/keyboard.h:48: player.y -= 2;
   529C C6 FE         [ 7] 2361 	add	a,#0xFE
   529E 32 28 72      [13] 2362 	ld	(#(_player + 0x0001)),a
                           2363 ;src/keyboard.h:49: player.dir = 8;
   52A1 21 2E 72      [10] 2364 	ld	hl,#(_player + 0x0007)
   52A4 36 08         [10] 2365 	ld	(hl),#0x08
                           2366 ;src/keyboard.h:50: s = gladis_arriba;
   52A6 DD 36 FD 00   [19] 2367 	ld	-3 (ix),#<(_gladis_arriba)
   52AA DD 36 FE 42   [19] 2368 	ld	-2 (ix),#>(_gladis_arriba)
   52AE C3 DB 53      [10] 2369 	jp	00146$
   52B1                    2370 00129$:
                           2371 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   52B1 21 07 80      [10] 2372 	ld	hl,#0x8007
   52B4 CD 61 6C      [17] 2373 	call	_cpct_isKeyPressed
   52B7 5D            [ 4] 2374 	ld	e,l
                           2375 ;src/keyboard.h:53: switch(player.dir){
   52B8 21 2E 72      [10] 2376 	ld	hl, #(_player + 0x0007) + 0
   52BB 6E            [ 7] 2377 	ld	l,(hl)
   52BC 7D            [ 4] 2378 	ld	a,l
   52BD D6 02         [ 7] 2379 	sub	a, #0x02
   52BF 20 04         [12] 2380 	jr	NZ,00278$
   52C1 3E 01         [ 7] 2381 	ld	a,#0x01
   52C3 18 01         [12] 2382 	jr	00279$
   52C5                    2383 00278$:
   52C5 AF            [ 4] 2384 	xor	a,a
   52C6                    2385 00279$:
   52C6 4F            [ 4] 2386 	ld	c,a
   52C7 7D            [ 4] 2387 	ld	a,l
   52C8 D6 04         [ 7] 2388 	sub	a, #0x04
   52CA 20 04         [12] 2389 	jr	NZ,00280$
   52CC 3E 01         [ 7] 2390 	ld	a,#0x01
   52CE 18 01         [12] 2391 	jr	00281$
   52D0                    2392 00280$:
   52D0 AF            [ 4] 2393 	xor	a,a
   52D1                    2394 00281$:
   52D1 DD 77 FC      [19] 2395 	ld	-4 (ix),a
   52D4 7D            [ 4] 2396 	ld	a,l
   52D5 D6 06         [ 7] 2397 	sub	a, #0x06
   52D7 20 04         [12] 2398 	jr	NZ,00282$
   52D9 3E 01         [ 7] 2399 	ld	a,#0x01
   52DB 18 01         [12] 2400 	jr	00283$
   52DD                    2401 00282$:
   52DD AF            [ 4] 2402 	xor	a,a
   52DE                    2403 00283$:
   52DE DD 77 FF      [19] 2404 	ld	-1 (ix),a
   52E1 7D            [ 4] 2405 	ld	a,l
   52E2 D6 08         [ 7] 2406 	sub	a, #0x08
   52E4 20 04         [12] 2407 	jr	NZ,00284$
   52E6 3E 01         [ 7] 2408 	ld	a,#0x01
   52E8 18 01         [12] 2409 	jr	00285$
   52EA                    2410 00284$:
   52EA AF            [ 4] 2411 	xor	a,a
   52EB                    2412 00285$:
   52EB DD 77 FB      [19] 2413 	ld	-5 (ix),a
                           2414 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   52EE 7B            [ 4] 2415 	ld	a,e
   52EF B7            [ 4] 2416 	or	a, a
   52F0 CA 9D 53      [10] 2417 	jp	Z,00123$
   52F3 3A 19 72      [13] 2418 	ld	a,(#_arrow + 0)
   52F6 B7            [ 4] 2419 	or	a, a
   52F7 C2 9D 53      [10] 2420 	jp	NZ,00123$
   52FA 3A 2F 72      [13] 2421 	ld	a, (#(_player + 0x0008) + 0)
   52FD D6 14         [ 7] 2422 	sub	a, #0x14
   52FF C2 9D 53      [10] 2423 	jp	NZ,00123$
   5302 3A 31 72      [13] 2424 	ld	a, (#(_player + 0x000a) + 0)
   5305 B7            [ 4] 2425 	or	a, a
   5306 CA 9D 53      [10] 2426 	jp	Z,00123$
                           2427 ;src/keyboard.h:52: u8 *spr = flecha_dcha,xs=2,ys=8;
   5309 11 FD 6B      [10] 2428 	ld	de,#_flecha_dcha
   530C DD 36 FA 02   [19] 2429 	ld	-6 (ix),#0x02
   5310 06 08         [ 7] 2430 	ld	b,#0x08
                           2431 ;src/keyboard.h:53: switch(player.dir){
   5312 79            [ 4] 2432 	ld	a,c
   5313 B7            [ 4] 2433 	or	a, a
   5314 20 2A         [12] 2434 	jr	NZ,00114$
   5316 DD 7E FC      [19] 2435 	ld	a,-4 (ix)
   5319 B7            [ 4] 2436 	or	a, a
   531A 20 19         [12] 2437 	jr	NZ,00113$
   531C DD 7E FF      [19] 2438 	ld	a,-1 (ix)
   531F B7            [ 4] 2439 	or	a, a
   5320 20 08         [12] 2440 	jr	NZ,00112$
   5322 DD 7E FB      [19] 2441 	ld	a,-5 (ix)
   5325 B7            [ 4] 2442 	or	a, a
   5326 20 23         [12] 2443 	jr	NZ,00115$
   5328 18 2A         [12] 2444 	jr	00116$
                           2445 ;src/keyboard.h:54: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   532A                    2446 00112$:
   532A 11 FD 6B      [10] 2447 	ld	de,#_flecha_dcha
   532D DD 36 FA 04   [19] 2448 	ld	-6 (ix),#0x04
   5331 06 04         [ 7] 2449 	ld	b,#0x04
   5333 18 1F         [12] 2450 	jr	00116$
                           2451 ;src/keyboard.h:55: case 4: spr = flecha_izda; xs=4;ys=4; break;
   5335                    2452 00113$:
   5335 11 1D 6C      [10] 2453 	ld	de,#_flecha_izda+0
   5338 DD 36 FA 04   [19] 2454 	ld	-6 (ix),#0x04
   533C 06 04         [ 7] 2455 	ld	b,#0x04
   533E 18 14         [12] 2456 	jr	00116$
                           2457 ;src/keyboard.h:56: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   5340                    2458 00114$:
   5340 11 DD 6B      [10] 2459 	ld	de,#_flecha_abajo+0
   5343 DD 36 FA 02   [19] 2460 	ld	-6 (ix),#0x02
   5347 06 08         [ 7] 2461 	ld	b,#0x08
   5349 18 09         [12] 2462 	jr	00116$
                           2463 ;src/keyboard.h:57: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   534B                    2464 00115$:
   534B 11 BD 6B      [10] 2465 	ld	de,#_flecha_arriba+0
   534E DD 36 FA 02   [19] 2466 	ld	-6 (ix),#0x02
   5352 06 08         [ 7] 2467 	ld	b,#0x08
                           2468 ;src/keyboard.h:58: }
   5354                    2469 00116$:
                           2470 ;src/keyboard.h:59: player.atk = 0;
   5354 21 2F 72      [10] 2471 	ld	hl,#(_player + 0x0008)
   5357 36 00         [10] 2472 	ld	(hl),#0x00
                           2473 ;src/keyboard.h:60: object.x = player.x;
   5359 3A 27 72      [13] 2474 	ld	a, (#_player + 0)
   535C 21 1D 72      [10] 2475 	ld	hl,#_object
   535F 77            [ 7] 2476 	ld	(hl),a
                           2477 ;src/keyboard.h:61: object.y = player.y+8;
   5360 3A 28 72      [13] 2478 	ld	a, (#(_player + 0x0001) + 0)
   5363 C6 08         [ 7] 2479 	add	a, #0x08
   5365 32 1E 72      [13] 2480 	ld	(#(_object + 0x0001)),a
                           2481 ;src/keyboard.h:62: object.x = object.x;
   5368 21 1D 72      [10] 2482 	ld	hl, #_object + 0
   536B 4E            [ 7] 2483 	ld	c,(hl)
   536C 21 1D 72      [10] 2484 	ld	hl,#_object
   536F 71            [ 7] 2485 	ld	(hl),c
                           2486 ;src/keyboard.h:63: object.y = object.y;
   5370 32 1E 72      [13] 2487 	ld	(#(_object + 0x0001)),a
                           2488 ;src/keyboard.h:64: object.sprite = spr;
   5373 ED 53 21 72   [20] 2489 	ld	((_object + 0x0004)), de
                           2490 ;src/keyboard.h:65: object.vivo = 1;
   5377 21 23 72      [10] 2491 	ld	hl,#_object + 6
   537A 36 01         [10] 2492 	ld	(hl),#0x01
                           2493 ;src/keyboard.h:66: object.dir = player.dir;
   537C 11 24 72      [10] 2494 	ld	de,#_object + 7
   537F 3A 2E 72      [13] 2495 	ld	a, (#(_player + 0x0007) + 0)
   5382 12            [ 7] 2496 	ld	(de),a
                           2497 ;src/keyboard.h:67: object.sizeX = xs;
   5383 21 25 72      [10] 2498 	ld	hl,#_object + 8
   5386 DD 7E FA      [19] 2499 	ld	a,-6 (ix)
   5389 77            [ 7] 2500 	ld	(hl),a
                           2501 ;src/keyboard.h:68: object.sizeY = ys;
   538A 21 26 72      [10] 2502 	ld	hl,#_object + 9
   538D 70            [ 7] 2503 	ld	(hl),b
                           2504 ;src/keyboard.h:69: player.bullets--;
   538E 3A 31 72      [13] 2505 	ld	a, (#(_player + 0x000a) + 0)
   5391 C6 FF         [ 7] 2506 	add	a,#0xFF
   5393 32 31 72      [13] 2507 	ld	(#(_player + 0x000a)),a
                           2508 ;src/keyboard.h:70: arrow=1;
   5396 21 19 72      [10] 2509 	ld	hl,#_arrow + 0
   5399 36 01         [10] 2510 	ld	(hl), #0x01
   539B 18 3E         [12] 2511 	jr	00146$
   539D                    2512 00123$:
                           2513 ;src/keyboard.h:72: switch(player.dir){
   539D 79            [ 4] 2514 	ld	a,c
   539E B7            [ 4] 2515 	or	a, a
   539F 20 32         [12] 2516 	jr	NZ,00120$
   53A1 DD 7E FC      [19] 2517 	ld	a,-4 (ix)
   53A4 B7            [ 4] 2518 	or	a, a
   53A5 20 0E         [12] 2519 	jr	NZ,00117$
   53A7 DD 7E FF      [19] 2520 	ld	a,-1 (ix)
   53AA B7            [ 4] 2521 	or	a, a
   53AB 20 12         [12] 2522 	jr	NZ,00118$
   53AD DD 7E FB      [19] 2523 	ld	a,-5 (ix)
   53B0 B7            [ 4] 2524 	or	a, a
   53B1 20 16         [12] 2525 	jr	NZ,00119$
   53B3 18 26         [12] 2526 	jr	00146$
                           2527 ;src/keyboard.h:73: case 4:
   53B5                    2528 00117$:
                           2529 ;src/keyboard.h:74: s = gladis_quieto_izda;
   53B5 DD 36 FD 80   [19] 2530 	ld	-3 (ix),#<(_gladis_quieto_izda)
   53B9 DD 36 FE 40   [19] 2531 	ld	-2 (ix),#>(_gladis_quieto_izda)
                           2532 ;src/keyboard.h:75: break;
   53BD 18 1C         [12] 2533 	jr	00146$
                           2534 ;src/keyboard.h:76: case 6:
   53BF                    2535 00118$:
                           2536 ;src/keyboard.h:77: s = gladis_quieto_dcha;
   53BF DD 36 FD 00   [19] 2537 	ld	-3 (ix),#<(_gladis_quieto_dcha)
   53C3 DD 36 FE 40   [19] 2538 	ld	-2 (ix),#>(_gladis_quieto_dcha)
                           2539 ;src/keyboard.h:78: break;
   53C7 18 12         [12] 2540 	jr	00146$
                           2541 ;src/keyboard.h:79: case 8:
   53C9                    2542 00119$:
                           2543 ;src/keyboard.h:80: s = gladis_arriba;
   53C9 DD 36 FD 00   [19] 2544 	ld	-3 (ix),#<(_gladis_arriba)
   53CD DD 36 FE 42   [19] 2545 	ld	-2 (ix),#>(_gladis_arriba)
                           2546 ;src/keyboard.h:81: break;
   53D1 18 08         [12] 2547 	jr	00146$
                           2548 ;src/keyboard.h:82: case 2:
   53D3                    2549 00120$:
                           2550 ;src/keyboard.h:83: s = gladis_abajo;
   53D3 DD 36 FD 80   [19] 2551 	ld	-3 (ix),#<(_gladis_abajo)
   53D7 DD 36 FE 42   [19] 2552 	ld	-2 (ix),#>(_gladis_abajo)
                           2553 ;src/keyboard.h:85: }
   53DB                    2554 00146$:
                           2555 ;src/keyboard.h:91: if(cpct_isKeyPressed(Key_L)){
   53DB 21 04 10      [10] 2556 	ld	hl,#0x1004
   53DE CD 61 6C      [17] 2557 	call	_cpct_isKeyPressed
   53E1 7D            [ 4] 2558 	ld	a,l
   53E2 B7            [ 4] 2559 	or	a, a
   53E3 28 05         [12] 2560 	jr	Z,00149$
                           2561 ;src/keyboard.h:92: arrow = 0;
   53E5 21 19 72      [10] 2562 	ld	hl,#_arrow + 0
   53E8 36 00         [10] 2563 	ld	(hl), #0x00
   53EA                    2564 00149$:
                           2565 ;src/keyboard.h:94: if(cpct_isKeyPressed(Key_Esc)){
   53EA 21 08 04      [10] 2566 	ld	hl,#0x0408
   53ED CD 61 6C      [17] 2567 	call	_cpct_isKeyPressed
   53F0 7D            [ 4] 2568 	ld	a,l
   53F1 B7            [ 4] 2569 	or	a, a
   53F2 28 05         [12] 2570 	jr	Z,00151$
                           2571 ;src/keyboard.h:95: finish = 1;
   53F4 21 18 72      [10] 2572 	ld	hl,#_finish + 0
   53F7 36 01         [10] 2573 	ld	(hl), #0x01
   53F9                    2574 00151$:
                           2575 ;src/keyboard.h:97: return s;
   53F9 DD 6E FD      [19] 2576 	ld	l,-3 (ix)
   53FC DD 66 FE      [19] 2577 	ld	h,-2 (ix)
   53FF DD F9         [10] 2578 	ld	sp, ix
   5401 DD E1         [14] 2579 	pop	ix
   5403 C9            [10] 2580 	ret
                           2581 ;src/keyboard.h:100: void moveObject(){
                           2582 ;	---------------------------------
                           2583 ; Function moveObject
                           2584 ; ---------------------------------
   5404                    2585 _moveObject::
                           2586 ;src/keyboard.h:101: object.lx = object.x;
   5404 01 1D 72      [10] 2587 	ld	bc,#_object+0
   5407 0A            [ 7] 2588 	ld	a,(bc)
   5408 32 1F 72      [13] 2589 	ld	(#(_object + 0x0002)),a
                           2590 ;src/keyboard.h:102: object.ly = object.y;
   540B 59            [ 4] 2591 	ld	e, c
   540C 50            [ 4] 2592 	ld	d, b
   540D 13            [ 6] 2593 	inc	de
   540E 1A            [ 7] 2594 	ld	a,(de)
   540F 32 20 72      [13] 2595 	ld	(#(_object + 0x0003)),a
                           2596 ;src/keyboard.h:103: switch(object.dir){
   5412 3A 24 72      [13] 2597 	ld	a,(#_object + 7)
   5415 FE 02         [ 7] 2598 	cp	a,#0x02
   5417 28 16         [12] 2599 	jr	Z,00103$
   5419 FE 04         [ 7] 2600 	cp	a,#0x04
   541B 28 0D         [12] 2601 	jr	Z,00102$
   541D FE 06         [ 7] 2602 	cp	a,#0x06
   541F 28 05         [12] 2603 	jr	Z,00101$
   5421 D6 08         [ 7] 2604 	sub	a, #0x08
   5423 28 0F         [12] 2605 	jr	Z,00104$
   5425 C9            [10] 2606 	ret
                           2607 ;src/keyboard.h:104: case 6: object.x += 1; break;
   5426                    2608 00101$:
   5426 0A            [ 7] 2609 	ld	a,(bc)
   5427 3C            [ 4] 2610 	inc	a
   5428 02            [ 7] 2611 	ld	(bc),a
   5429 C9            [10] 2612 	ret
                           2613 ;src/keyboard.h:105: case 4: object.x -= 1; break;
   542A                    2614 00102$:
   542A 0A            [ 7] 2615 	ld	a,(bc)
   542B C6 FF         [ 7] 2616 	add	a,#0xFF
   542D 02            [ 7] 2617 	ld	(bc),a
   542E C9            [10] 2618 	ret
                           2619 ;src/keyboard.h:106: case 2: object.y += 2; break;
   542F                    2620 00103$:
   542F 1A            [ 7] 2621 	ld	a,(de)
   5430 C6 02         [ 7] 2622 	add	a, #0x02
   5432 12            [ 7] 2623 	ld	(de),a
   5433 C9            [10] 2624 	ret
                           2625 ;src/keyboard.h:107: case 8: object.y -= 2; break;
   5434                    2626 00104$:
   5434 1A            [ 7] 2627 	ld	a,(de)
   5435 C6 FE         [ 7] 2628 	add	a,#0xFE
   5437 12            [ 7] 2629 	ld	(de),a
                           2630 ;src/keyboard.h:108: }
   5438 C9            [10] 2631 	ret
                           2632 ;src/main.c:37: void init(){
                           2633 ;	---------------------------------
                           2634 ; Function init
                           2635 ; ---------------------------------
   5439                    2636 _init::
                           2637 ;src/main.c:38: cpct_disableFirmware();
   5439 CD 4D 6F      [17] 2638 	call	_cpct_disableFirmware
                           2639 ;src/main.c:39: cpct_setVideoMode(0);
   543C AF            [ 4] 2640 	xor	a, a
   543D F5            [11] 2641 	push	af
   543E 33            [ 6] 2642 	inc	sp
   543F CD 2A 6F      [17] 2643 	call	_cpct_setVideoMode
   5442 33            [ 6] 2644 	inc	sp
                           2645 ;src/main.c:40: cpct_fw2hw(g_palette,4);
   5443 11 0E 49      [10] 2646 	ld	de,#_g_palette
   5446 3E 04         [ 7] 2647 	ld	a,#0x04
   5448 F5            [11] 2648 	push	af
   5449 33            [ 6] 2649 	inc	sp
   544A D5            [11] 2650 	push	de
   544B CD B4 6E      [17] 2651 	call	_cpct_fw2hw
   544E F1            [10] 2652 	pop	af
   544F 33            [ 6] 2653 	inc	sp
                           2654 ;src/main.c:41: cpct_setPalette(g_palette,4);
   5450 11 0E 49      [10] 2655 	ld	de,#_g_palette
   5453 3E 04         [ 7] 2656 	ld	a,#0x04
   5455 F5            [11] 2657 	push	af
   5456 33            [ 6] 2658 	inc	sp
   5457 D5            [11] 2659 	push	de
   5458 CD 3D 6C      [17] 2660 	call	_cpct_setPalette
   545B F1            [10] 2661 	pop	af
   545C 33            [ 6] 2662 	inc	sp
   545D C9            [10] 2663 	ret
                           2664 ;src/main.c:44: void initPlayer(){
                           2665 ;	---------------------------------
                           2666 ; Function initPlayer
                           2667 ; ---------------------------------
   545E                    2668 _initPlayer::
                           2669 ;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
                           2670 ;src/main.c:46: player.x = origins[0][0];
   545E 01 13 49      [10] 2671 	ld	bc,#_origins+0
   5461 0A            [ 7] 2672 	ld	a,(bc)
   5462 32 27 72      [13] 2673 	ld	(#_player),a
                           2674 ;src/main.c:47: player.y = origins[0][1];
   5465 59            [ 4] 2675 	ld	e, c
   5466 50            [ 4] 2676 	ld	d, b
   5467 13            [ 6] 2677 	inc	de
   5468 1A            [ 7] 2678 	ld	a,(de)
   5469 32 28 72      [13] 2679 	ld	(#(_player + 0x0001)),a
                           2680 ;src/main.c:48: player.lx = origins[0][0];
   546C 0A            [ 7] 2681 	ld	a,(bc)
   546D 32 29 72      [13] 2682 	ld	(#(_player + 0x0002)),a
                           2683 ;src/main.c:49: player.ly = origins[0][1];
   5470 1A            [ 7] 2684 	ld	a,(de)
   5471 32 2A 72      [13] 2685 	ld	(#(_player + 0x0003)),a
                           2686 ;src/main.c:50: player.sprite = sprite;
   5474 21 00 40      [10] 2687 	ld	hl,#_gladis_quieto_dcha
   5477 22 2B 72      [16] 2688 	ld	((_player + 0x0004)), hl
                           2689 ;src/main.c:51: player.life = 3;
   547A 21 2D 72      [10] 2690 	ld	hl,#_player + 6
   547D 36 03         [10] 2691 	ld	(hl),#0x03
                           2692 ;src/main.c:52: player.dir = 6;
   547F 21 2E 72      [10] 2693 	ld	hl,#_player + 7
   5482 36 06         [10] 2694 	ld	(hl),#0x06
                           2695 ;src/main.c:53: player.atk = 20;
   5484 21 2F 72      [10] 2696 	ld	hl,#_player + 8
   5487 36 14         [10] 2697 	ld	(hl),#0x14
                           2698 ;src/main.c:54: player.latk = 20;
   5489 21 30 72      [10] 2699 	ld	hl,#_player + 9
   548C 36 14         [10] 2700 	ld	(hl),#0x14
                           2701 ;src/main.c:55: player.bullets = 3;
   548E 21 31 72      [10] 2702 	ld	hl,#_player + 10
   5491 36 03         [10] 2703 	ld	(hl),#0x03
   5493 C9            [10] 2704 	ret
                           2705 ;src/main.c:58: void initEnemies(){
                           2706 ;	---------------------------------
                           2707 ; Function initEnemies
                           2708 ; ---------------------------------
   5494                    2709 _initEnemies::
                           2710 ;src/main.c:59: u8 *sprite = chacho_dcha;
                           2711 ;src/main.c:60: enemy.x = origins[1][0];
   5494 01 15 49      [10] 2712 	ld	bc,#_origins + 2
   5497 0A            [ 7] 2713 	ld	a,(bc)
   5498 32 32 72      [13] 2714 	ld	(#_enemy),a
                           2715 ;src/main.c:61: enemy.y = origins[1][1];
   549B 11 16 49      [10] 2716 	ld	de,#_origins + 3
   549E 1A            [ 7] 2717 	ld	a,(de)
   549F 32 33 72      [13] 2718 	ld	(#(_enemy + 0x0001)),a
                           2719 ;src/main.c:62: enemy.lx = origins[1][0];
   54A2 0A            [ 7] 2720 	ld	a,(bc)
   54A3 32 34 72      [13] 2721 	ld	(#(_enemy + 0x0002)),a
                           2722 ;src/main.c:63: enemy.ly = origins[1][1];
   54A6 1A            [ 7] 2723 	ld	a,(de)
   54A7 32 35 72      [13] 2724 	ld	(#(_enemy + 0x0003)),a
                           2725 ;src/main.c:64: enemy.ox = origins[1][0];
   54AA 0A            [ 7] 2726 	ld	a,(bc)
   54AB 32 36 72      [13] 2727 	ld	(#(_enemy + 0x0004)),a
                           2728 ;src/main.c:65: enemy.oy = origins[1][1];
   54AE 1A            [ 7] 2729 	ld	a,(de)
   54AF 32 37 72      [13] 2730 	ld	(#(_enemy + 0x0005)),a
                           2731 ;src/main.c:66: enemy.sprite = sprite;
   54B2 21 00 44      [10] 2732 	ld	hl,#_chacho_dcha
   54B5 22 38 72      [16] 2733 	ld	((_enemy + 0x0006)), hl
                           2734 ;src/main.c:67: enemy.life = 3;
   54B8 21 3A 72      [10] 2735 	ld	hl,#_enemy + 8
   54BB 36 03         [10] 2736 	ld	(hl),#0x03
                           2737 ;src/main.c:68: enemy.dir = 6;
   54BD 21 3B 72      [10] 2738 	ld	hl,#_enemy + 9
   54C0 36 06         [10] 2739 	ld	(hl),#0x06
                           2740 ;src/main.c:69: enemy.bullets = 3;
   54C2 21 3C 72      [10] 2741 	ld	hl,#_enemy + 10
   54C5 36 03         [10] 2742 	ld	(hl),#0x03
                           2743 ;src/main.c:70: enemy.room = 3;
   54C7 21 3D 72      [10] 2744 	ld	hl,#_enemy + 11
   54CA 36 03         [10] 2745 	ld	(hl),#0x03
   54CC C9            [10] 2746 	ret
                           2747 ;src/main.c:75: void gameOver(){
                           2748 ;	---------------------------------
                           2749 ; Function gameOver
                           2750 ; ---------------------------------
   54CD                    2751 _gameOver::
                           2752 ;src/main.c:77: cpct_clearScreen(0);
   54CD 21 00 40      [10] 2753 	ld	hl,#0x4000
   54D0 E5            [11] 2754 	push	hl
   54D1 AF            [ 4] 2755 	xor	a, a
   54D2 F5            [11] 2756 	push	af
   54D3 33            [ 6] 2757 	inc	sp
   54D4 26 C0         [ 7] 2758 	ld	h, #0xC0
   54D6 E5            [11] 2759 	push	hl
   54D7 CD 3C 6F      [17] 2760 	call	_cpct_memset
                           2761 ;src/main.c:78: memptr = cpct_getScreenPtr(VMEM,10,10);
   54DA 21 0A 0A      [10] 2762 	ld	hl,#0x0A0A
   54DD E5            [11] 2763 	push	hl
   54DE 21 00 C0      [10] 2764 	ld	hl,#0xC000
   54E1 E5            [11] 2765 	push	hl
   54E2 CD 2F 70      [17] 2766 	call	_cpct_getScreenPtr
                           2767 ;src/main.c:79: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   54E5 4D            [ 4] 2768 	ld	c, l
   54E6 44            [ 4] 2769 	ld	b, h
   54E7 11 F9 54      [10] 2770 	ld	de,#___str_0
   54EA 21 01 00      [10] 2771 	ld	hl,#0x0001
   54ED E5            [11] 2772 	push	hl
   54EE C5            [11] 2773 	push	bc
   54EF D5            [11] 2774 	push	de
   54F0 CD 4E 6D      [17] 2775 	call	_cpct_drawStringM0
   54F3 21 06 00      [10] 2776 	ld	hl,#6
   54F6 39            [11] 2777 	add	hl,sp
   54F7 F9            [ 6] 2778 	ld	sp,hl
   54F8 C9            [10] 2779 	ret
   54F9                    2780 ___str_0:
   54F9 4C 6F 75 6E 67 65  2781 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5509 00                 2782 	.db 0x00
                           2783 ;src/main.c:84: int menu(){
                           2784 ;	---------------------------------
                           2785 ; Function menu
                           2786 ; ---------------------------------
   550A                    2787 _menu::
   550A DD E5         [15] 2788 	push	ix
   550C DD 21 00 00   [14] 2789 	ld	ix,#0
   5510 DD 39         [15] 2790 	add	ix,sp
   5512 21 FA FF      [10] 2791 	ld	hl,#-6
   5515 39            [11] 2792 	add	hl,sp
   5516 F9            [ 6] 2793 	ld	sp,hl
                           2794 ;src/main.c:86: int init = 50;
   5517 DD 36 FC 32   [19] 2795 	ld	-4 (ix),#0x32
   551B DD 36 FD 00   [19] 2796 	ld	-3 (ix),#0x00
                           2797 ;src/main.c:87: int pushed =0;
   551F 21 00 00      [10] 2798 	ld	hl,#0x0000
   5522 E3            [19] 2799 	ex	(sp), hl
                           2800 ;src/main.c:88: int cont =0;
   5523 11 00 00      [10] 2801 	ld	de,#0x0000
                           2802 ;src/main.c:89: cpct_clearScreen(0);
   5526 D5            [11] 2803 	push	de
   5527 21 00 40      [10] 2804 	ld	hl,#0x4000
   552A E5            [11] 2805 	push	hl
   552B AF            [ 4] 2806 	xor	a, a
   552C F5            [11] 2807 	push	af
   552D 33            [ 6] 2808 	inc	sp
   552E 26 C0         [ 7] 2809 	ld	h, #0xC0
   5530 E5            [11] 2810 	push	hl
   5531 CD 3C 6F      [17] 2811 	call	_cpct_memset
   5534 21 0A 0A      [10] 2812 	ld	hl,#0x0A0A
   5537 E5            [11] 2813 	push	hl
   5538 21 00 C0      [10] 2814 	ld	hl,#0xC000
   553B E5            [11] 2815 	push	hl
   553C CD 2F 70      [17] 2816 	call	_cpct_getScreenPtr
   553F D1            [10] 2817 	pop	de
                           2818 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5540 4D            [ 4] 2819 	ld	c, l
   5541 44            [ 4] 2820 	ld	b, h
   5542 D5            [11] 2821 	push	de
   5543 21 01 00      [10] 2822 	ld	hl,#0x0001
   5546 E5            [11] 2823 	push	hl
   5547 C5            [11] 2824 	push	bc
   5548 21 ED 56      [10] 2825 	ld	hl,#___str_1
   554B E5            [11] 2826 	push	hl
   554C CD 4E 6D      [17] 2827 	call	_cpct_drawStringM0
   554F 21 06 00      [10] 2828 	ld	hl,#6
   5552 39            [11] 2829 	add	hl,sp
   5553 F9            [ 6] 2830 	ld	sp,hl
   5554 21 14 32      [10] 2831 	ld	hl,#0x3214
   5557 E5            [11] 2832 	push	hl
   5558 21 00 C0      [10] 2833 	ld	hl,#0xC000
   555B E5            [11] 2834 	push	hl
   555C CD 2F 70      [17] 2835 	call	_cpct_getScreenPtr
   555F D1            [10] 2836 	pop	de
                           2837 ;src/main.c:96: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   5560 4D            [ 4] 2838 	ld	c, l
   5561 44            [ 4] 2839 	ld	b, h
   5562 D5            [11] 2840 	push	de
   5563 21 01 00      [10] 2841 	ld	hl,#0x0001
   5566 E5            [11] 2842 	push	hl
   5567 C5            [11] 2843 	push	bc
   5568 21 FE 56      [10] 2844 	ld	hl,#___str_2
   556B E5            [11] 2845 	push	hl
   556C CD 4E 6D      [17] 2846 	call	_cpct_drawStringM0
   556F 21 06 00      [10] 2847 	ld	hl,#6
   5572 39            [11] 2848 	add	hl,sp
   5573 F9            [ 6] 2849 	ld	sp,hl
   5574 21 14 46      [10] 2850 	ld	hl,#0x4614
   5577 E5            [11] 2851 	push	hl
   5578 21 00 C0      [10] 2852 	ld	hl,#0xC000
   557B E5            [11] 2853 	push	hl
   557C CD 2F 70      [17] 2854 	call	_cpct_getScreenPtr
   557F D1            [10] 2855 	pop	de
                           2856 ;src/main.c:99: cpct_drawStringM0("Creditos",memptr,1,0);
   5580 4D            [ 4] 2857 	ld	c, l
   5581 44            [ 4] 2858 	ld	b, h
   5582 D5            [11] 2859 	push	de
   5583 21 01 00      [10] 2860 	ld	hl,#0x0001
   5586 E5            [11] 2861 	push	hl
   5587 C5            [11] 2862 	push	bc
   5588 21 0C 57      [10] 2863 	ld	hl,#___str_3
   558B E5            [11] 2864 	push	hl
   558C CD 4E 6D      [17] 2865 	call	_cpct_drawStringM0
   558F 21 06 00      [10] 2866 	ld	hl,#6
   5592 39            [11] 2867 	add	hl,sp
   5593 F9            [ 6] 2868 	ld	sp,hl
   5594 21 14 5A      [10] 2869 	ld	hl,#0x5A14
   5597 E5            [11] 2870 	push	hl
   5598 21 00 C0      [10] 2871 	ld	hl,#0xC000
   559B E5            [11] 2872 	push	hl
   559C CD 2F 70      [17] 2873 	call	_cpct_getScreenPtr
   559F D1            [10] 2874 	pop	de
                           2875 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   55A0 DD 75 FE      [19] 2876 	ld	-2 (ix),l
   55A3 DD 74 FF      [19] 2877 	ld	-1 (ix),h
                           2878 ;src/main.c:102: cpct_drawStringM0("Salir",memptr,1,0);
   55A6 01 15 57      [10] 2879 	ld	bc,#___str_4
   55A9 D5            [11] 2880 	push	de
   55AA 21 01 00      [10] 2881 	ld	hl,#0x0001
   55AD E5            [11] 2882 	push	hl
   55AE DD 6E FE      [19] 2883 	ld	l,-2 (ix)
   55B1 DD 66 FF      [19] 2884 	ld	h,-1 (ix)
   55B4 E5            [11] 2885 	push	hl
   55B5 C5            [11] 2886 	push	bc
   55B6 CD 4E 6D      [17] 2887 	call	_cpct_drawStringM0
   55B9 21 06 00      [10] 2888 	ld	hl,#6
   55BC 39            [11] 2889 	add	hl,sp
   55BD F9            [ 6] 2890 	ld	sp,hl
   55BE D1            [10] 2891 	pop	de
                           2892 ;src/main.c:108: while(1){
   55BF                    2893 00118$:
                           2894 ;src/main.c:110: cpct_scanKeyboard();
   55BF D5            [11] 2895 	push	de
   55C0 CD 4F 70      [17] 2896 	call	_cpct_scanKeyboard
   55C3 21 00 04      [10] 2897 	ld	hl,#0x0400
   55C6 CD 61 6C      [17] 2898 	call	_cpct_isKeyPressed
   55C9 7D            [ 4] 2899 	ld	a,l
   55CA D1            [10] 2900 	pop	de
   55CB B7            [ 4] 2901 	or	a, a
   55CC 28 2D         [12] 2902 	jr	Z,00102$
   55CE 3E 96         [ 7] 2903 	ld	a,#0x96
   55D0 BB            [ 4] 2904 	cp	a, e
   55D1 3E 00         [ 7] 2905 	ld	a,#0x00
   55D3 9A            [ 4] 2906 	sbc	a, d
   55D4 E2 D9 55      [10] 2907 	jp	PO, 00162$
   55D7 EE 80         [ 7] 2908 	xor	a, #0x80
   55D9                    2909 00162$:
   55D9 F2 FB 55      [10] 2910 	jp	P,00102$
                           2911 ;src/main.c:112: cpct_drawSolidBox(memptr, 0, 2, 8);
   55DC 21 02 08      [10] 2912 	ld	hl,#0x0802
   55DF E5            [11] 2913 	push	hl
   55E0 AF            [ 4] 2914 	xor	a, a
   55E1 F5            [11] 2915 	push	af
   55E2 33            [ 6] 2916 	inc	sp
   55E3 DD 6E FE      [19] 2917 	ld	l,-2 (ix)
   55E6 DD 66 FF      [19] 2918 	ld	h,-1 (ix)
   55E9 E5            [11] 2919 	push	hl
   55EA CD 5E 6F      [17] 2920 	call	_cpct_drawSolidBox
   55ED F1            [10] 2921 	pop	af
   55EE F1            [10] 2922 	pop	af
   55EF 33            [ 6] 2923 	inc	sp
                           2924 ;src/main.c:113: pushed ++;
   55F0 DD 34 FA      [23] 2925 	inc	-6 (ix)
   55F3 20 03         [12] 2926 	jr	NZ,00163$
   55F5 DD 34 FB      [23] 2927 	inc	-5 (ix)
   55F8                    2928 00163$:
                           2929 ;src/main.c:114: cont =0;
   55F8 11 00 00      [10] 2930 	ld	de,#0x0000
   55FB                    2931 00102$:
                           2932 ;src/main.c:116: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   55FB D5            [11] 2933 	push	de
   55FC 21 00 01      [10] 2934 	ld	hl,#0x0100
   55FF CD 61 6C      [17] 2935 	call	_cpct_isKeyPressed
   5602 7D            [ 4] 2936 	ld	a,l
   5603 D1            [10] 2937 	pop	de
   5604 B7            [ 4] 2938 	or	a, a
   5605 28 29         [12] 2939 	jr	Z,00105$
   5607 3E 96         [ 7] 2940 	ld	a,#0x96
   5609 BB            [ 4] 2941 	cp	a, e
   560A 3E 00         [ 7] 2942 	ld	a,#0x00
   560C 9A            [ 4] 2943 	sbc	a, d
   560D E2 12 56      [10] 2944 	jp	PO, 00164$
   5610 EE 80         [ 7] 2945 	xor	a, #0x80
   5612                    2946 00164$:
   5612 F2 30 56      [10] 2947 	jp	P,00105$
                           2948 ;src/main.c:117: cpct_drawSolidBox(memptr, 0, 2, 8);
   5615 21 02 08      [10] 2949 	ld	hl,#0x0802
   5618 E5            [11] 2950 	push	hl
   5619 AF            [ 4] 2951 	xor	a, a
   561A F5            [11] 2952 	push	af
   561B 33            [ 6] 2953 	inc	sp
   561C DD 6E FE      [19] 2954 	ld	l,-2 (ix)
   561F DD 66 FF      [19] 2955 	ld	h,-1 (ix)
   5622 E5            [11] 2956 	push	hl
   5623 CD 5E 6F      [17] 2957 	call	_cpct_drawSolidBox
   5626 F1            [10] 2958 	pop	af
   5627 F1            [10] 2959 	pop	af
   5628 33            [ 6] 2960 	inc	sp
                           2961 ;src/main.c:118: pushed --;
   5629 E1            [10] 2962 	pop	hl
   562A E5            [11] 2963 	push	hl
   562B 2B            [ 6] 2964 	dec	hl
   562C E3            [19] 2965 	ex	(sp), hl
                           2966 ;src/main.c:119: cont = 0;
   562D 11 00 00      [10] 2967 	ld	de,#0x0000
   5630                    2968 00105$:
                           2969 ;src/main.c:122: switch (pushed){
   5630 DD 7E FB      [19] 2970 	ld	a,-5 (ix)
   5633 07            [ 4] 2971 	rlca
   5634 E6 01         [ 7] 2972 	and	a,#0x01
   5636 47            [ 4] 2973 	ld	b,a
   5637 3E 02         [ 7] 2974 	ld	a,#0x02
   5639 DD BE FA      [19] 2975 	cp	a, -6 (ix)
   563C 3E 00         [ 7] 2976 	ld	a,#0x00
   563E DD 9E FB      [19] 2977 	sbc	a, -5 (ix)
   5641 E2 46 56      [10] 2978 	jp	PO, 00165$
   5644 EE 80         [ 7] 2979 	xor	a, #0x80
   5646                    2980 00165$:
   5646 07            [ 4] 2981 	rlca
   5647 E6 01         [ 7] 2982 	and	a,#0x01
   5649 4F            [ 4] 2983 	ld	c,a
   564A 78            [ 4] 2984 	ld	a,b
   564B B7            [ 4] 2985 	or	a,a
   564C 20 32         [12] 2986 	jr	NZ,00110$
   564E B1            [ 4] 2987 	or	a,c
   564F 20 2F         [12] 2988 	jr	NZ,00110$
   5651 D5            [11] 2989 	push	de
   5652 DD 5E FA      [19] 2990 	ld	e,-6 (ix)
   5655 16 00         [ 7] 2991 	ld	d,#0x00
   5657 21 5E 56      [10] 2992 	ld	hl,#00166$
   565A 19            [11] 2993 	add	hl,de
   565B 19            [11] 2994 	add	hl,de
                           2995 ;src/main.c:123: case 0: init = 50;break;
   565C D1            [10] 2996 	pop	de
   565D E9            [ 4] 2997 	jp	(hl)
   565E                    2998 00166$:
   565E 18 04         [12] 2999 	jr	00107$
   5660 18 0C         [12] 3000 	jr	00108$
   5662 18 14         [12] 3001 	jr	00109$
   5664                    3002 00107$:
   5664 DD 36 FC 32   [19] 3003 	ld	-4 (ix),#0x32
   5668 DD 36 FD 00   [19] 3004 	ld	-3 (ix),#0x00
   566C 18 12         [12] 3005 	jr	00110$
                           3006 ;src/main.c:124: case 1: init = 70;break;
   566E                    3007 00108$:
   566E DD 36 FC 46   [19] 3008 	ld	-4 (ix),#0x46
   5672 DD 36 FD 00   [19] 3009 	ld	-3 (ix),#0x00
   5676 18 08         [12] 3010 	jr	00110$
                           3011 ;src/main.c:125: case 2: init = 90;break;
   5678                    3012 00109$:
   5678 DD 36 FC 5A   [19] 3013 	ld	-4 (ix),#0x5A
   567C DD 36 FD 00   [19] 3014 	ld	-3 (ix),#0x00
                           3015 ;src/main.c:126: }
   5680                    3016 00110$:
                           3017 ;src/main.c:127: memptr = cpct_getScreenPtr(VMEM,15,init);
   5680 DD 66 FC      [19] 3018 	ld	h,-4 (ix)
   5683 C5            [11] 3019 	push	bc
   5684 D5            [11] 3020 	push	de
   5685 E5            [11] 3021 	push	hl
   5686 33            [ 6] 3022 	inc	sp
   5687 3E 0F         [ 7] 3023 	ld	a,#0x0F
   5689 F5            [11] 3024 	push	af
   568A 33            [ 6] 3025 	inc	sp
   568B 21 00 C0      [10] 3026 	ld	hl,#0xC000
   568E E5            [11] 3027 	push	hl
   568F CD 2F 70      [17] 3028 	call	_cpct_getScreenPtr
   5692 D1            [10] 3029 	pop	de
   5693 C1            [10] 3030 	pop	bc
                           3031 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5694 DD 75 FE      [19] 3032 	ld	-2 (ix),l
   5697 DD 74 FF      [19] 3033 	ld	-1 (ix),h
                           3034 ;src/main.c:128: cpct_drawSolidBox(memptr, 3, 2, 8);
   569A C5            [11] 3035 	push	bc
   569B D5            [11] 3036 	push	de
   569C 21 02 08      [10] 3037 	ld	hl,#0x0802
   569F E5            [11] 3038 	push	hl
   56A0 3E 03         [ 7] 3039 	ld	a,#0x03
   56A2 F5            [11] 3040 	push	af
   56A3 33            [ 6] 3041 	inc	sp
   56A4 DD 6E FE      [19] 3042 	ld	l,-2 (ix)
   56A7 DD 66 FF      [19] 3043 	ld	h,-1 (ix)
   56AA E5            [11] 3044 	push	hl
   56AB CD 5E 6F      [17] 3045 	call	_cpct_drawSolidBox
   56AE F1            [10] 3046 	pop	af
   56AF F1            [10] 3047 	pop	af
   56B0 33            [ 6] 3048 	inc	sp
   56B1 21 00 40      [10] 3049 	ld	hl,#0x4000
   56B4 CD 61 6C      [17] 3050 	call	_cpct_isKeyPressed
   56B7 7D            [ 4] 3051 	ld	a,l
   56B8 D1            [10] 3052 	pop	de
   56B9 C1            [10] 3053 	pop	bc
   56BA B7            [ 4] 3054 	or	a, a
   56BB 28 27         [12] 3055 	jr	Z,00116$
                           3056 ;src/main.c:130: switch (pushed){
   56BD 78            [ 4] 3057 	ld	a,b
   56BE B7            [ 4] 3058 	or	a,a
   56BF 20 23         [12] 3059 	jr	NZ,00116$
   56C1 B1            [ 4] 3060 	or	a,c
   56C2 20 20         [12] 3061 	jr	NZ,00116$
   56C4 DD 5E FA      [19] 3062 	ld	e,-6 (ix)
   56C7 16 00         [ 7] 3063 	ld	d,#0x00
   56C9 21 CF 56      [10] 3064 	ld	hl,#00167$
   56CC 19            [11] 3065 	add	hl,de
   56CD 19            [11] 3066 	add	hl,de
                           3067 ;src/main.c:131: case 0: return 1;break;
   56CE E9            [ 4] 3068 	jp	(hl)
   56CF                    3069 00167$:
   56CF 18 04         [12] 3070 	jr	00111$
   56D1 18 07         [12] 3071 	jr	00112$
   56D3 18 0A         [12] 3072 	jr	00113$
   56D5                    3073 00111$:
   56D5 21 01 00      [10] 3074 	ld	hl,#0x0001
   56D8 18 0E         [12] 3075 	jr	00120$
                           3076 ;src/main.c:132: case 1: return 2;break;
   56DA                    3077 00112$:
   56DA 21 02 00      [10] 3078 	ld	hl,#0x0002
   56DD 18 09         [12] 3079 	jr	00120$
                           3080 ;src/main.c:133: case 2: return 0;break;
   56DF                    3081 00113$:
   56DF 21 00 00      [10] 3082 	ld	hl,#0x0000
   56E2 18 04         [12] 3083 	jr	00120$
                           3084 ;src/main.c:134: }
   56E4                    3085 00116$:
                           3086 ;src/main.c:136: cont++;
   56E4 13            [ 6] 3087 	inc	de
   56E5 C3 BF 55      [10] 3088 	jp	00118$
   56E8                    3089 00120$:
   56E8 DD F9         [10] 3090 	ld	sp, ix
   56EA DD E1         [14] 3091 	pop	ix
   56EC C9            [10] 3092 	ret
   56ED                    3093 ___str_1:
   56ED 4C 6F 75 6E 67 65  3094 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   56FD 00                 3095 	.db 0x00
   56FE                    3096 ___str_2:
   56FE 4E 75 65 76 61 20  3097 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   570B 00                 3098 	.db 0x00
   570C                    3099 ___str_3:
   570C 43 72 65 64 69 74  3100 	.ascii "Creditos"
        6F 73
   5714 00                 3101 	.db 0x00
   5715                    3102 ___str_4:
   5715 53 61 6C 69 72     3103 	.ascii "Salir"
   571A 00                 3104 	.db 0x00
                           3105 ;src/main.c:155: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           3106 ;	---------------------------------
                           3107 ; Function checkBoundsCollisionsEnemy
                           3108 ; ---------------------------------
   571B                    3109 _checkBoundsCollisionsEnemy::
   571B DD E5         [15] 3110 	push	ix
   571D DD 21 00 00   [14] 3111 	ld	ix,#0
   5721 DD 39         [15] 3112 	add	ix,sp
   5723 21 EC FF      [10] 3113 	ld	hl,#-20
   5726 39            [11] 3114 	add	hl,sp
   5727 F9            [ 6] 3115 	ld	sp,hl
                           3116 ;src/main.c:157: u8 *posX = x;
   5728 DD 7E 04      [19] 3117 	ld	a,4 (ix)
   572B DD 77 EE      [19] 3118 	ld	-18 (ix),a
   572E DD 7E 05      [19] 3119 	ld	a,5 (ix)
   5731 DD 77 EF      [19] 3120 	ld	-17 (ix),a
                           3121 ;src/main.c:158: u8 *posY = y;
   5734 DD 7E 06      [19] 3122 	ld	a,6 (ix)
   5737 DD 77 EC      [19] 3123 	ld	-20 (ix),a
   573A DD 7E 07      [19] 3124 	ld	a,7 (ix)
   573D DD 77 ED      [19] 3125 	ld	-19 (ix),a
                           3126 ;src/main.c:159: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   5740 E1            [10] 3127 	pop	hl
   5741 E5            [11] 3128 	push	hl
   5742 7E            [ 7] 3129 	ld	a,(hl)
   5743 DD 77 FB      [19] 3130 	ld	-5 (ix), a
   5746 07            [ 4] 3131 	rlca
   5747 07            [ 4] 3132 	rlca
   5748 07            [ 4] 3133 	rlca
   5749 07            [ 4] 3134 	rlca
   574A E6 0F         [ 7] 3135 	and	a,#0x0F
   574C 4F            [ 4] 3136 	ld	c,a
   574D 06 00         [ 7] 3137 	ld	b,#0x00
   574F 69            [ 4] 3138 	ld	l, c
   5750 60            [ 4] 3139 	ld	h, b
   5751 29            [11] 3140 	add	hl, hl
   5752 29            [11] 3141 	add	hl, hl
   5753 09            [11] 3142 	add	hl, bc
   5754 29            [11] 3143 	add	hl, hl
   5755 29            [11] 3144 	add	hl, hl
   5756 3E 25         [ 7] 3145 	ld	a,#<(_scene)
   5758 85            [ 4] 3146 	add	a, l
   5759 DD 77 F9      [19] 3147 	ld	-7 (ix),a
   575C 3E 71         [ 7] 3148 	ld	a,#>(_scene)
   575E 8C            [ 4] 3149 	adc	a, h
   575F DD 77 FA      [19] 3150 	ld	-6 (ix),a
   5762 DD 6E EE      [19] 3151 	ld	l,-18 (ix)
   5765 DD 66 EF      [19] 3152 	ld	h,-17 (ix)
   5768 7E            [ 7] 3153 	ld	a,(hl)
   5769 DD 77 FE      [19] 3154 	ld	-2 (ix), a
   576C 0F            [ 4] 3155 	rrca
   576D 0F            [ 4] 3156 	rrca
   576E E6 3F         [ 7] 3157 	and	a,#0x3F
   5770 DD 77 FF      [19] 3158 	ld	-1 (ix), a
   5773 DD 86 F9      [19] 3159 	add	a, -7 (ix)
   5776 6F            [ 4] 3160 	ld	l,a
   5777 3E 00         [ 7] 3161 	ld	a,#0x00
   5779 DD 8E FA      [19] 3162 	adc	a, -6 (ix)
   577C 67            [ 4] 3163 	ld	h,a
   577D 7E            [ 7] 3164 	ld	a,(hl)
   577E DD 77 F8      [19] 3165 	ld	-8 (ix), a
   5781 3D            [ 4] 3166 	dec	a
   5782 CA 90 58      [10] 3167 	jp	Z,00106$
                           3168 ;src/main.c:160: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5785 DD 6E FE      [19] 3169 	ld	l,-2 (ix)
   5788 26 00         [ 7] 3170 	ld	h,#0x00
   578A DD 5E 0A      [19] 3171 	ld	e,10 (ix)
   578D 16 00         [ 7] 3172 	ld	d,#0x00
   578F 19            [11] 3173 	add	hl,de
   5790 7D            [ 4] 3174 	ld	a,l
   5791 C6 FF         [ 7] 3175 	add	a,#0xFF
   5793 DD 77 F0      [19] 3176 	ld	-16 (ix),a
   5796 7C            [ 4] 3177 	ld	a,h
   5797 CE FF         [ 7] 3178 	adc	a,#0xFF
   5799 DD 77 F1      [19] 3179 	ld	-15 (ix),a
   579C DD 7E F0      [19] 3180 	ld	a,-16 (ix)
   579F DD 77 F6      [19] 3181 	ld	-10 (ix),a
   57A2 DD 7E F1      [19] 3182 	ld	a,-15 (ix)
   57A5 DD 77 F7      [19] 3183 	ld	-9 (ix),a
   57A8 DD 7E F1      [19] 3184 	ld	a,-15 (ix)
   57AB 07            [ 4] 3185 	rlca
   57AC E6 01         [ 7] 3186 	and	a,#0x01
   57AE DD 77 FE      [19] 3187 	ld	-2 (ix),a
   57B1 23            [ 6] 3188 	inc	hl
   57B2 23            [ 6] 3189 	inc	hl
   57B3 DD 75 F2      [19] 3190 	ld	-14 (ix),l
   57B6 DD 74 F3      [19] 3191 	ld	-13 (ix),h
   57B9 DD 7E FE      [19] 3192 	ld	a,-2 (ix)
   57BC B7            [ 4] 3193 	or	a, a
   57BD 28 0C         [12] 3194 	jr	Z,00114$
   57BF DD 7E F2      [19] 3195 	ld	a,-14 (ix)
   57C2 DD 77 F6      [19] 3196 	ld	-10 (ix),a
   57C5 DD 7E F3      [19] 3197 	ld	a,-13 (ix)
   57C8 DD 77 F7      [19] 3198 	ld	-9 (ix),a
   57CB                    3199 00114$:
   57CB DD 6E F6      [19] 3200 	ld	l,-10 (ix)
   57CE DD 66 F7      [19] 3201 	ld	h,-9 (ix)
   57D1 CB 2C         [ 8] 3202 	sra	h
   57D3 CB 1D         [ 8] 3203 	rr	l
   57D5 CB 2C         [ 8] 3204 	sra	h
   57D7 CB 1D         [ 8] 3205 	rr	l
   57D9 DD 5E F9      [19] 3206 	ld	e,-7 (ix)
   57DC DD 56 FA      [19] 3207 	ld	d,-6 (ix)
   57DF 19            [11] 3208 	add	hl,de
   57E0 7E            [ 7] 3209 	ld	a,(hl)
   57E1 3D            [ 4] 3210 	dec	a
   57E2 CA 90 58      [10] 3211 	jp	Z,00106$
                           3212 ;src/main.c:161: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   57E5 DD 6E FB      [19] 3213 	ld	l,-5 (ix)
   57E8 26 00         [ 7] 3214 	ld	h,#0x00
   57EA DD 5E 0B      [19] 3215 	ld	e,11 (ix)
   57ED 16 00         [ 7] 3216 	ld	d,#0x00
   57EF 19            [11] 3217 	add	hl,de
   57F0 4D            [ 4] 3218 	ld	c,l
   57F1 44            [ 4] 3219 	ld	b,h
   57F2 0B            [ 6] 3220 	dec	bc
   57F3 0B            [ 6] 3221 	dec	bc
   57F4 59            [ 4] 3222 	ld	e, c
   57F5 78            [ 4] 3223 	ld	a,b
   57F6 57            [ 4] 3224 	ld	d,a
   57F7 07            [ 4] 3225 	rlca
   57F8 E6 01         [ 7] 3226 	and	a,#0x01
   57FA DD 77 F6      [19] 3227 	ld	-10 (ix),a
   57FD 7D            [ 4] 3228 	ld	a,l
   57FE C6 0D         [ 7] 3229 	add	a, #0x0D
   5800 DD 77 FC      [19] 3230 	ld	-4 (ix),a
   5803 7C            [ 4] 3231 	ld	a,h
   5804 CE 00         [ 7] 3232 	adc	a, #0x00
   5806 DD 77 FD      [19] 3233 	ld	-3 (ix),a
   5809 DD 7E F6      [19] 3234 	ld	a,-10 (ix)
   580C B7            [ 4] 3235 	or	a, a
   580D 28 06         [12] 3236 	jr	Z,00115$
   580F DD 5E FC      [19] 3237 	ld	e,-4 (ix)
   5812 DD 56 FD      [19] 3238 	ld	d,-3 (ix)
   5815                    3239 00115$:
   5815 CB 2A         [ 8] 3240 	sra	d
   5817 CB 1B         [ 8] 3241 	rr	e
   5819 CB 2A         [ 8] 3242 	sra	d
   581B CB 1B         [ 8] 3243 	rr	e
   581D CB 2A         [ 8] 3244 	sra	d
   581F CB 1B         [ 8] 3245 	rr	e
   5821 CB 2A         [ 8] 3246 	sra	d
   5823 CB 1B         [ 8] 3247 	rr	e
   5825 6B            [ 4] 3248 	ld	l, e
   5826 62            [ 4] 3249 	ld	h, d
   5827 29            [11] 3250 	add	hl, hl
   5828 29            [11] 3251 	add	hl, hl
   5829 19            [11] 3252 	add	hl, de
   582A 29            [11] 3253 	add	hl, hl
   582B 29            [11] 3254 	add	hl, hl
   582C 11 25 71      [10] 3255 	ld	de,#_scene
   582F 19            [11] 3256 	add	hl,de
   5830 DD 5E FF      [19] 3257 	ld	e,-1 (ix)
   5833 16 00         [ 7] 3258 	ld	d,#0x00
   5835 19            [11] 3259 	add	hl,de
   5836 7E            [ 7] 3260 	ld	a,(hl)
   5837 3D            [ 4] 3261 	dec	a
   5838 28 56         [12] 3262 	jr	Z,00106$
                           3263 ;src/main.c:162: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   583A 69            [ 4] 3264 	ld	l, c
   583B 60            [ 4] 3265 	ld	h, b
   583C DD 7E F6      [19] 3266 	ld	a,-10 (ix)
   583F B7            [ 4] 3267 	or	a, a
   5840 28 06         [12] 3268 	jr	Z,00116$
   5842 DD 6E FC      [19] 3269 	ld	l,-4 (ix)
   5845 DD 66 FD      [19] 3270 	ld	h,-3 (ix)
   5848                    3271 00116$:
   5848 CB 2C         [ 8] 3272 	sra	h
   584A CB 1D         [ 8] 3273 	rr	l
   584C CB 2C         [ 8] 3274 	sra	h
   584E CB 1D         [ 8] 3275 	rr	l
   5850 CB 2C         [ 8] 3276 	sra	h
   5852 CB 1D         [ 8] 3277 	rr	l
   5854 CB 2C         [ 8] 3278 	sra	h
   5856 CB 1D         [ 8] 3279 	rr	l
   5858 5D            [ 4] 3280 	ld	e, l
   5859 54            [ 4] 3281 	ld	d, h
   585A 29            [11] 3282 	add	hl, hl
   585B 29            [11] 3283 	add	hl, hl
   585C 19            [11] 3284 	add	hl, de
   585D 29            [11] 3285 	add	hl, hl
   585E 29            [11] 3286 	add	hl, hl
   585F 3E 25         [ 7] 3287 	ld	a,#<(_scene)
   5861 85            [ 4] 3288 	add	a, l
   5862 DD 77 F4      [19] 3289 	ld	-12 (ix),a
   5865 3E 71         [ 7] 3290 	ld	a,#>(_scene)
   5867 8C            [ 4] 3291 	adc	a, h
   5868 DD 77 F5      [19] 3292 	ld	-11 (ix),a
   586B DD 6E F0      [19] 3293 	ld	l,-16 (ix)
   586E DD 66 F1      [19] 3294 	ld	h,-15 (ix)
   5871 DD 7E FE      [19] 3295 	ld	a,-2 (ix)
   5874 B7            [ 4] 3296 	or	a, a
   5875 28 06         [12] 3297 	jr	Z,00117$
   5877 DD 6E F2      [19] 3298 	ld	l,-14 (ix)
   587A DD 66 F3      [19] 3299 	ld	h,-13 (ix)
   587D                    3300 00117$:
   587D CB 2C         [ 8] 3301 	sra	h
   587F CB 1D         [ 8] 3302 	rr	l
   5881 CB 2C         [ 8] 3303 	sra	h
   5883 CB 1D         [ 8] 3304 	rr	l
   5885 DD 5E F4      [19] 3305 	ld	e,-12 (ix)
   5888 DD 56 F5      [19] 3306 	ld	d,-11 (ix)
   588B 19            [11] 3307 	add	hl,de
   588C 7E            [ 7] 3308 	ld	a,(hl)
   588D 3D            [ 4] 3309 	dec	a
   588E 20 13         [12] 3310 	jr	NZ,00107$
   5890                    3311 00106$:
                           3312 ;src/main.c:164: *posX=lx;
   5890 DD 6E EE      [19] 3313 	ld	l,-18 (ix)
   5893 DD 66 EF      [19] 3314 	ld	h,-17 (ix)
   5896 DD 7E 08      [19] 3315 	ld	a,8 (ix)
   5899 77            [ 7] 3316 	ld	(hl),a
                           3317 ;src/main.c:165: *posY=ly;
   589A E1            [10] 3318 	pop	hl
   589B E5            [11] 3319 	push	hl
   589C DD 7E 09      [19] 3320 	ld	a,9 (ix)
   589F 77            [ 7] 3321 	ld	(hl),a
   58A0 C3 6B 59      [10] 3322 	jp	00112$
   58A3                    3323 00107$:
                           3324 ;src/main.c:167: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   58A3 DD 7E F8      [19] 3325 	ld	a,-8 (ix)
   58A6 D6 03         [ 7] 3326 	sub	a, #0x03
   58A8 C2 5B 59      [10] 3327 	jp	NZ,00101$
                           3328 ;src/main.c:168: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   58AB DD 6E F0      [19] 3329 	ld	l,-16 (ix)
   58AE DD 66 F1      [19] 3330 	ld	h,-15 (ix)
   58B1 DD 7E FE      [19] 3331 	ld	a,-2 (ix)
   58B4 B7            [ 4] 3332 	or	a, a
   58B5 28 06         [12] 3333 	jr	Z,00118$
   58B7 DD 6E F2      [19] 3334 	ld	l,-14 (ix)
   58BA DD 66 F3      [19] 3335 	ld	h,-13 (ix)
   58BD                    3336 00118$:
   58BD CB 2C         [ 8] 3337 	sra	h
   58BF CB 1D         [ 8] 3338 	rr	l
   58C1 CB 2C         [ 8] 3339 	sra	h
   58C3 CB 1D         [ 8] 3340 	rr	l
   58C5 DD 5E F9      [19] 3341 	ld	e,-7 (ix)
   58C8 DD 56 FA      [19] 3342 	ld	d,-6 (ix)
   58CB 19            [11] 3343 	add	hl,de
   58CC 7E            [ 7] 3344 	ld	a,(hl)
   58CD D6 03         [ 7] 3345 	sub	a, #0x03
   58CF C2 5B 59      [10] 3346 	jp	NZ,00101$
                           3347 ;src/main.c:169: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   58D2 69            [ 4] 3348 	ld	l, c
   58D3 60            [ 4] 3349 	ld	h, b
   58D4 DD 7E F6      [19] 3350 	ld	a,-10 (ix)
   58D7 B7            [ 4] 3351 	or	a, a
   58D8 28 06         [12] 3352 	jr	Z,00119$
   58DA DD 6E FC      [19] 3353 	ld	l,-4 (ix)
   58DD DD 66 FD      [19] 3354 	ld	h,-3 (ix)
   58E0                    3355 00119$:
   58E0 CB 2C         [ 8] 3356 	sra	h
   58E2 CB 1D         [ 8] 3357 	rr	l
   58E4 CB 2C         [ 8] 3358 	sra	h
   58E6 CB 1D         [ 8] 3359 	rr	l
   58E8 CB 2C         [ 8] 3360 	sra	h
   58EA CB 1D         [ 8] 3361 	rr	l
   58EC CB 2C         [ 8] 3362 	sra	h
   58EE CB 1D         [ 8] 3363 	rr	l
   58F0 5D            [ 4] 3364 	ld	e, l
   58F1 54            [ 4] 3365 	ld	d, h
   58F2 29            [11] 3366 	add	hl, hl
   58F3 29            [11] 3367 	add	hl, hl
   58F4 19            [11] 3368 	add	hl, de
   58F5 29            [11] 3369 	add	hl, hl
   58F6 29            [11] 3370 	add	hl, hl
   58F7 11 25 71      [10] 3371 	ld	de,#_scene
   58FA 19            [11] 3372 	add	hl,de
   58FB DD 5E FF      [19] 3373 	ld	e,-1 (ix)
   58FE 16 00         [ 7] 3374 	ld	d,#0x00
   5900 19            [11] 3375 	add	hl,de
   5901 7E            [ 7] 3376 	ld	a,(hl)
   5902 D6 03         [ 7] 3377 	sub	a, #0x03
   5904 20 55         [12] 3378 	jr	NZ,00101$
                           3379 ;src/main.c:170: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5906 DD 7E F6      [19] 3380 	ld	a,-10 (ix)
   5909 B7            [ 4] 3381 	or	a, a
   590A 28 06         [12] 3382 	jr	Z,00120$
   590C DD 4E FC      [19] 3383 	ld	c,-4 (ix)
   590F DD 46 FD      [19] 3384 	ld	b,-3 (ix)
   5912                    3385 00120$:
   5912 CB 28         [ 8] 3386 	sra	b
   5914 CB 19         [ 8] 3387 	rr	c
   5916 CB 28         [ 8] 3388 	sra	b
   5918 CB 19         [ 8] 3389 	rr	c
   591A CB 28         [ 8] 3390 	sra	b
   591C CB 19         [ 8] 3391 	rr	c
   591E CB 28         [ 8] 3392 	sra	b
   5920 CB 19         [ 8] 3393 	rr	c
   5922 69            [ 4] 3394 	ld	l, c
   5923 60            [ 4] 3395 	ld	h, b
   5924 29            [11] 3396 	add	hl, hl
   5925 29            [11] 3397 	add	hl, hl
   5926 09            [11] 3398 	add	hl, bc
   5927 29            [11] 3399 	add	hl, hl
   5928 29            [11] 3400 	add	hl, hl
   5929 3E 25         [ 7] 3401 	ld	a,#<(_scene)
   592B 85            [ 4] 3402 	add	a, l
   592C DD 77 F4      [19] 3403 	ld	-12 (ix),a
   592F 3E 71         [ 7] 3404 	ld	a,#>(_scene)
   5931 8C            [ 4] 3405 	adc	a, h
   5932 DD 77 F5      [19] 3406 	ld	-11 (ix),a
   5935 DD 6E F0      [19] 3407 	ld	l,-16 (ix)
   5938 DD 66 F1      [19] 3408 	ld	h,-15 (ix)
   593B DD 7E FE      [19] 3409 	ld	a,-2 (ix)
   593E B7            [ 4] 3410 	or	a, a
   593F 28 06         [12] 3411 	jr	Z,00121$
   5941 DD 6E F2      [19] 3412 	ld	l,-14 (ix)
   5944 DD 66 F3      [19] 3413 	ld	h,-13 (ix)
   5947                    3414 00121$:
   5947 CB 2C         [ 8] 3415 	sra	h
   5949 CB 1D         [ 8] 3416 	rr	l
   594B CB 2C         [ 8] 3417 	sra	h
   594D CB 1D         [ 8] 3418 	rr	l
   594F DD 5E F4      [19] 3419 	ld	e,-12 (ix)
   5952 DD 56 F5      [19] 3420 	ld	d,-11 (ix)
   5955 19            [11] 3421 	add	hl,de
   5956 7E            [ 7] 3422 	ld	a,(hl)
   5957 D6 03         [ 7] 3423 	sub	a, #0x03
   5959 28 10         [12] 3424 	jr	Z,00112$
   595B                    3425 00101$:
                           3426 ;src/main.c:172: *posX=lx;
   595B DD 6E EE      [19] 3427 	ld	l,-18 (ix)
   595E DD 66 EF      [19] 3428 	ld	h,-17 (ix)
   5961 DD 7E 08      [19] 3429 	ld	a,8 (ix)
   5964 77            [ 7] 3430 	ld	(hl),a
                           3431 ;src/main.c:173: *posY=ly;
   5965 E1            [10] 3432 	pop	hl
   5966 E5            [11] 3433 	push	hl
   5967 DD 7E 09      [19] 3434 	ld	a,9 (ix)
   596A 77            [ 7] 3435 	ld	(hl),a
   596B                    3436 00112$:
   596B DD F9         [10] 3437 	ld	sp, ix
   596D DD E1         [14] 3438 	pop	ix
   596F C9            [10] 3439 	ret
                           3440 ;src/main.c:179: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3441 ;	---------------------------------
                           3442 ; Function checkBoundsCollisions
                           3443 ; ---------------------------------
   5970                    3444 _checkBoundsCollisions::
   5970 DD E5         [15] 3445 	push	ix
   5972 DD 21 00 00   [14] 3446 	ld	ix,#0
   5976 DD 39         [15] 3447 	add	ix,sp
   5978 21 F2 FF      [10] 3448 	ld	hl,#-14
   597B 39            [11] 3449 	add	hl,sp
   597C F9            [ 6] 3450 	ld	sp,hl
                           3451 ;src/main.c:180: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   597D 3A 28 72      [13] 3452 	ld	a,(#(_player + 0x0001) + 0)
   5980 DD 77 F8      [19] 3453 	ld	-8 (ix), a
   5983 07            [ 4] 3454 	rlca
   5984 07            [ 4] 3455 	rlca
   5985 07            [ 4] 3456 	rlca
   5986 07            [ 4] 3457 	rlca
   5987 E6 0F         [ 7] 3458 	and	a,#0x0F
   5989 4F            [ 4] 3459 	ld	c,a
   598A 06 00         [ 7] 3460 	ld	b,#0x00
   598C 69            [ 4] 3461 	ld	l, c
   598D 60            [ 4] 3462 	ld	h, b
   598E 29            [11] 3463 	add	hl, hl
   598F 29            [11] 3464 	add	hl, hl
   5990 09            [11] 3465 	add	hl, bc
   5991 29            [11] 3466 	add	hl, hl
   5992 29            [11] 3467 	add	hl, hl
   5993 3E 25         [ 7] 3468 	ld	a,#<(_scene)
   5995 85            [ 4] 3469 	add	a, l
   5996 DD 77 F4      [19] 3470 	ld	-12 (ix),a
   5999 3E 71         [ 7] 3471 	ld	a,#>(_scene)
   599B 8C            [ 4] 3472 	adc	a, h
   599C DD 77 F5      [19] 3473 	ld	-11 (ix),a
   599F 21 27 72      [10] 3474 	ld	hl, #_player + 0
   59A2 4E            [ 7] 3475 	ld	c,(hl)
   59A3 79            [ 4] 3476 	ld	a,c
   59A4 0F            [ 4] 3477 	rrca
   59A5 0F            [ 4] 3478 	rrca
   59A6 E6 3F         [ 7] 3479 	and	a,#0x3F
   59A8 DD 77 F7      [19] 3480 	ld	-9 (ix), a
   59AB DD 86 F4      [19] 3481 	add	a, -12 (ix)
   59AE 6F            [ 4] 3482 	ld	l,a
   59AF 3E 00         [ 7] 3483 	ld	a,#0x00
   59B1 DD 8E F5      [19] 3484 	adc	a, -11 (ix)
   59B4 67            [ 4] 3485 	ld	h,a
   59B5 7E            [ 7] 3486 	ld	a,(hl)
   59B6 DD 77 F6      [19] 3487 	ld	-10 (ix), a
   59B9 3D            [ 4] 3488 	dec	a
   59BA CA D0 5A      [10] 3489 	jp	Z,00124$
                           3490 ;src/main.c:181: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   59BD 06 00         [ 7] 3491 	ld	b,#0x00
   59BF 21 03 00      [10] 3492 	ld	hl,#0x0003
   59C2 09            [11] 3493 	add	hl,bc
   59C3 DD 75 FB      [19] 3494 	ld	-5 (ix),l
   59C6 DD 74 FC      [19] 3495 	ld	-4 (ix),h
   59C9 DD 7E FB      [19] 3496 	ld	a,-5 (ix)
   59CC DD 77 FE      [19] 3497 	ld	-2 (ix),a
   59CF DD 7E FC      [19] 3498 	ld	a,-4 (ix)
   59D2 DD 77 FF      [19] 3499 	ld	-1 (ix),a
   59D5 DD 7E FC      [19] 3500 	ld	a,-4 (ix)
   59D8 07            [ 4] 3501 	rlca
   59D9 E6 01         [ 7] 3502 	and	a,#0x01
   59DB DD 77 FD      [19] 3503 	ld	-3 (ix),a
   59DE 21 06 00      [10] 3504 	ld	hl,#0x0006
   59E1 09            [11] 3505 	add	hl,bc
   59E2 E3            [19] 3506 	ex	(sp), hl
   59E3 DD 7E FD      [19] 3507 	ld	a,-3 (ix)
   59E6 B7            [ 4] 3508 	or	a, a
   59E7 28 0C         [12] 3509 	jr	Z,00132$
   59E9 DD 7E F2      [19] 3510 	ld	a,-14 (ix)
   59EC DD 77 FE      [19] 3511 	ld	-2 (ix),a
   59EF DD 7E F3      [19] 3512 	ld	a,-13 (ix)
   59F2 DD 77 FF      [19] 3513 	ld	-1 (ix),a
   59F5                    3514 00132$:
   59F5 DD 6E FE      [19] 3515 	ld	l,-2 (ix)
   59F8 DD 66 FF      [19] 3516 	ld	h,-1 (ix)
   59FB CB 2C         [ 8] 3517 	sra	h
   59FD CB 1D         [ 8] 3518 	rr	l
   59FF CB 2C         [ 8] 3519 	sra	h
   5A01 CB 1D         [ 8] 3520 	rr	l
   5A03 DD 5E F4      [19] 3521 	ld	e,-12 (ix)
   5A06 DD 56 F5      [19] 3522 	ld	d,-11 (ix)
   5A09 19            [11] 3523 	add	hl,de
   5A0A 7E            [ 7] 3524 	ld	a,(hl)
   5A0B 3D            [ 4] 3525 	dec	a
   5A0C CA D0 5A      [10] 3526 	jp	Z,00124$
                           3527 ;src/main.c:182: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   5A0F DD 5E F8      [19] 3528 	ld	e,-8 (ix)
   5A12 16 00         [ 7] 3529 	ld	d,#0x00
   5A14 21 0E 00      [10] 3530 	ld	hl,#0x000E
   5A17 19            [11] 3531 	add	hl,de
   5A18 4D            [ 4] 3532 	ld	c,l
   5A19 44            [ 4] 3533 	ld	b,h
   5A1A DD 71 FE      [19] 3534 	ld	-2 (ix),c
   5A1D DD 70 FF      [19] 3535 	ld	-1 (ix),b
   5A20 78            [ 4] 3536 	ld	a,b
   5A21 07            [ 4] 3537 	rlca
   5A22 E6 01         [ 7] 3538 	and	a,#0x01
   5A24 DD 77 F8      [19] 3539 	ld	-8 (ix),a
   5A27 21 1D 00      [10] 3540 	ld	hl,#0x001D
   5A2A 19            [11] 3541 	add	hl,de
   5A2B DD 75 F9      [19] 3542 	ld	-7 (ix),l
   5A2E DD 74 FA      [19] 3543 	ld	-6 (ix),h
   5A31 DD 7E F8      [19] 3544 	ld	a,-8 (ix)
   5A34 B7            [ 4] 3545 	or	a, a
   5A35 28 0C         [12] 3546 	jr	Z,00133$
   5A37 DD 7E F9      [19] 3547 	ld	a,-7 (ix)
   5A3A DD 77 FE      [19] 3548 	ld	-2 (ix),a
   5A3D DD 7E FA      [19] 3549 	ld	a,-6 (ix)
   5A40 DD 77 FF      [19] 3550 	ld	-1 (ix),a
   5A43                    3551 00133$:
   5A43 DD 6E FE      [19] 3552 	ld	l,-2 (ix)
   5A46 DD 66 FF      [19] 3553 	ld	h,-1 (ix)
   5A49 CB 2C         [ 8] 3554 	sra	h
   5A4B CB 1D         [ 8] 3555 	rr	l
   5A4D CB 2C         [ 8] 3556 	sra	h
   5A4F CB 1D         [ 8] 3557 	rr	l
   5A51 CB 2C         [ 8] 3558 	sra	h
   5A53 CB 1D         [ 8] 3559 	rr	l
   5A55 CB 2C         [ 8] 3560 	sra	h
   5A57 CB 1D         [ 8] 3561 	rr	l
   5A59 5D            [ 4] 3562 	ld	e, l
   5A5A 54            [ 4] 3563 	ld	d, h
   5A5B 29            [11] 3564 	add	hl, hl
   5A5C 29            [11] 3565 	add	hl, hl
   5A5D 19            [11] 3566 	add	hl, de
   5A5E 29            [11] 3567 	add	hl, hl
   5A5F 29            [11] 3568 	add	hl, hl
   5A60 11 25 71      [10] 3569 	ld	de,#_scene
   5A63 19            [11] 3570 	add	hl,de
   5A64 DD 5E F7      [19] 3571 	ld	e,-9 (ix)
   5A67 16 00         [ 7] 3572 	ld	d,#0x00
   5A69 19            [11] 3573 	add	hl,de
   5A6A 7E            [ 7] 3574 	ld	a,(hl)
   5A6B 3D            [ 4] 3575 	dec	a
   5A6C 28 62         [12] 3576 	jr	Z,00124$
                           3577 ;src/main.c:183: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5A6E DD 71 FE      [19] 3578 	ld	-2 (ix),c
   5A71 DD 70 FF      [19] 3579 	ld	-1 (ix),b
   5A74 DD 7E F8      [19] 3580 	ld	a,-8 (ix)
   5A77 B7            [ 4] 3581 	or	a, a
   5A78 28 0C         [12] 3582 	jr	Z,00134$
   5A7A DD 7E F9      [19] 3583 	ld	a,-7 (ix)
   5A7D DD 77 FE      [19] 3584 	ld	-2 (ix),a
   5A80 DD 7E FA      [19] 3585 	ld	a,-6 (ix)
   5A83 DD 77 FF      [19] 3586 	ld	-1 (ix),a
   5A86                    3587 00134$:
   5A86 DD 6E FE      [19] 3588 	ld	l,-2 (ix)
   5A89 DD 66 FF      [19] 3589 	ld	h,-1 (ix)
   5A8C CB 2C         [ 8] 3590 	sra	h
   5A8E CB 1D         [ 8] 3591 	rr	l
   5A90 CB 2C         [ 8] 3592 	sra	h
   5A92 CB 1D         [ 8] 3593 	rr	l
   5A94 CB 2C         [ 8] 3594 	sra	h
   5A96 CB 1D         [ 8] 3595 	rr	l
   5A98 CB 2C         [ 8] 3596 	sra	h
   5A9A CB 1D         [ 8] 3597 	rr	l
   5A9C 5D            [ 4] 3598 	ld	e, l
   5A9D 54            [ 4] 3599 	ld	d, h
   5A9E 29            [11] 3600 	add	hl, hl
   5A9F 29            [11] 3601 	add	hl, hl
   5AA0 19            [11] 3602 	add	hl, de
   5AA1 29            [11] 3603 	add	hl, hl
   5AA2 29            [11] 3604 	add	hl, hl
   5AA3 3E 25         [ 7] 3605 	ld	a,#<(_scene)
   5AA5 85            [ 4] 3606 	add	a, l
   5AA6 DD 77 FE      [19] 3607 	ld	-2 (ix),a
   5AA9 3E 71         [ 7] 3608 	ld	a,#>(_scene)
   5AAB 8C            [ 4] 3609 	adc	a, h
   5AAC DD 77 FF      [19] 3610 	ld	-1 (ix),a
   5AAF DD 6E FB      [19] 3611 	ld	l,-5 (ix)
   5AB2 DD 66 FC      [19] 3612 	ld	h,-4 (ix)
   5AB5 DD 7E FD      [19] 3613 	ld	a,-3 (ix)
   5AB8 B7            [ 4] 3614 	or	a, a
   5AB9 28 02         [12] 3615 	jr	Z,00135$
   5ABB E1            [10] 3616 	pop	hl
   5ABC E5            [11] 3617 	push	hl
   5ABD                    3618 00135$:
   5ABD CB 2C         [ 8] 3619 	sra	h
   5ABF CB 1D         [ 8] 3620 	rr	l
   5AC1 CB 2C         [ 8] 3621 	sra	h
   5AC3 CB 1D         [ 8] 3622 	rr	l
   5AC5 DD 5E FE      [19] 3623 	ld	e,-2 (ix)
   5AC8 DD 56 FF      [19] 3624 	ld	d,-1 (ix)
   5ACB 19            [11] 3625 	add	hl,de
   5ACC 7E            [ 7] 3626 	ld	a,(hl)
   5ACD 3D            [ 4] 3627 	dec	a
   5ACE 20 10         [12] 3628 	jr	NZ,00125$
   5AD0                    3629 00124$:
                           3630 ;src/main.c:185: player.x=player.lx;
   5AD0 3A 29 72      [13] 3631 	ld	a, (#_player + 2)
   5AD3 21 27 72      [10] 3632 	ld	hl,#_player
   5AD6 77            [ 7] 3633 	ld	(hl),a
                           3634 ;src/main.c:186: player.y=player.ly;
   5AD7 3A 2A 72      [13] 3635 	ld	a, (#_player + 3)
   5ADA 32 28 72      [13] 3636 	ld	(#(_player + 0x0001)),a
   5ADD C3 3C 5D      [10] 3637 	jp	00130$
   5AE0                    3638 00125$:
                           3639 ;src/main.c:188: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5AE0 DD 7E F6      [19] 3640 	ld	a,-10 (ix)
   5AE3 D6 02         [ 7] 3641 	sub	a, #0x02
   5AE5 CA 88 5B      [10] 3642 	jp	Z,00118$
                           3643 ;src/main.c:189: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5AE8 DD 6E FB      [19] 3644 	ld	l,-5 (ix)
   5AEB DD 66 FC      [19] 3645 	ld	h,-4 (ix)
   5AEE DD 7E FD      [19] 3646 	ld	a,-3 (ix)
   5AF1 B7            [ 4] 3647 	or	a, a
   5AF2 28 02         [12] 3648 	jr	Z,00136$
   5AF4 E1            [10] 3649 	pop	hl
   5AF5 E5            [11] 3650 	push	hl
   5AF6                    3651 00136$:
   5AF6 CB 2C         [ 8] 3652 	sra	h
   5AF8 CB 1D         [ 8] 3653 	rr	l
   5AFA CB 2C         [ 8] 3654 	sra	h
   5AFC CB 1D         [ 8] 3655 	rr	l
   5AFE DD 5E F4      [19] 3656 	ld	e,-12 (ix)
   5B01 DD 56 F5      [19] 3657 	ld	d,-11 (ix)
   5B04 19            [11] 3658 	add	hl,de
   5B05 7E            [ 7] 3659 	ld	a,(hl)
   5B06 D6 02         [ 7] 3660 	sub	a, #0x02
   5B08 CA 88 5B      [10] 3661 	jp	Z,00118$
                           3662 ;src/main.c:190: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5B0B 69            [ 4] 3663 	ld	l, c
   5B0C 60            [ 4] 3664 	ld	h, b
   5B0D DD 7E F8      [19] 3665 	ld	a,-8 (ix)
   5B10 B7            [ 4] 3666 	or	a, a
   5B11 28 06         [12] 3667 	jr	Z,00137$
   5B13 DD 6E F9      [19] 3668 	ld	l,-7 (ix)
   5B16 DD 66 FA      [19] 3669 	ld	h,-6 (ix)
   5B19                    3670 00137$:
   5B19 CB 2C         [ 8] 3671 	sra	h
   5B1B CB 1D         [ 8] 3672 	rr	l
   5B1D CB 2C         [ 8] 3673 	sra	h
   5B1F CB 1D         [ 8] 3674 	rr	l
   5B21 CB 2C         [ 8] 3675 	sra	h
   5B23 CB 1D         [ 8] 3676 	rr	l
   5B25 CB 2C         [ 8] 3677 	sra	h
   5B27 CB 1D         [ 8] 3678 	rr	l
   5B29 5D            [ 4] 3679 	ld	e, l
   5B2A 54            [ 4] 3680 	ld	d, h
   5B2B 29            [11] 3681 	add	hl, hl
   5B2C 29            [11] 3682 	add	hl, hl
   5B2D 19            [11] 3683 	add	hl, de
   5B2E 29            [11] 3684 	add	hl, hl
   5B2F 29            [11] 3685 	add	hl, hl
   5B30 11 25 71      [10] 3686 	ld	de,#_scene
   5B33 19            [11] 3687 	add	hl,de
   5B34 DD 5E F7      [19] 3688 	ld	e,-9 (ix)
   5B37 16 00         [ 7] 3689 	ld	d,#0x00
   5B39 19            [11] 3690 	add	hl,de
   5B3A 7E            [ 7] 3691 	ld	a,(hl)
   5B3B D6 02         [ 7] 3692 	sub	a, #0x02
   5B3D 28 49         [12] 3693 	jr	Z,00118$
                           3694 ;src/main.c:191: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5B3F 69            [ 4] 3695 	ld	l, c
   5B40 60            [ 4] 3696 	ld	h, b
   5B41 DD 7E F8      [19] 3697 	ld	a,-8 (ix)
   5B44 B7            [ 4] 3698 	or	a, a
   5B45 28 06         [12] 3699 	jr	Z,00138$
   5B47 DD 6E F9      [19] 3700 	ld	l,-7 (ix)
   5B4A DD 66 FA      [19] 3701 	ld	h,-6 (ix)
   5B4D                    3702 00138$:
   5B4D CB 2C         [ 8] 3703 	sra	h
   5B4F CB 1D         [ 8] 3704 	rr	l
   5B51 CB 2C         [ 8] 3705 	sra	h
   5B53 CB 1D         [ 8] 3706 	rr	l
   5B55 CB 2C         [ 8] 3707 	sra	h
   5B57 CB 1D         [ 8] 3708 	rr	l
   5B59 CB 2C         [ 8] 3709 	sra	h
   5B5B CB 1D         [ 8] 3710 	rr	l
   5B5D 5D            [ 4] 3711 	ld	e, l
   5B5E 54            [ 4] 3712 	ld	d, h
   5B5F 29            [11] 3713 	add	hl, hl
   5B60 29            [11] 3714 	add	hl, hl
   5B61 19            [11] 3715 	add	hl, de
   5B62 29            [11] 3716 	add	hl, hl
   5B63 29            [11] 3717 	add	hl, hl
   5B64 3E 25         [ 7] 3718 	ld	a,#<(_scene)
   5B66 85            [ 4] 3719 	add	a, l
   5B67 5F            [ 4] 3720 	ld	e,a
   5B68 3E 71         [ 7] 3721 	ld	a,#>(_scene)
   5B6A 8C            [ 4] 3722 	adc	a, h
   5B6B 57            [ 4] 3723 	ld	d,a
   5B6C DD 6E FB      [19] 3724 	ld	l,-5 (ix)
   5B6F DD 66 FC      [19] 3725 	ld	h,-4 (ix)
   5B72 DD 7E FD      [19] 3726 	ld	a,-3 (ix)
   5B75 B7            [ 4] 3727 	or	a, a
   5B76 28 02         [12] 3728 	jr	Z,00139$
   5B78 E1            [10] 3729 	pop	hl
   5B79 E5            [11] 3730 	push	hl
   5B7A                    3731 00139$:
   5B7A CB 2C         [ 8] 3732 	sra	h
   5B7C CB 1D         [ 8] 3733 	rr	l
   5B7E CB 2C         [ 8] 3734 	sra	h
   5B80 CB 1D         [ 8] 3735 	rr	l
   5B82 19            [11] 3736 	add	hl,de
   5B83 7E            [ 7] 3737 	ld	a,(hl)
   5B84 D6 02         [ 7] 3738 	sub	a, #0x02
   5B86 20 21         [12] 3739 	jr	NZ,00119$
   5B88                    3740 00118$:
                           3741 ;src/main.c:193: if(player.life < 3 && *corazon == 0){
   5B88 FD 21 2D 72   [14] 3742 	ld	iy,#_player + 6
   5B8C FD 5E 00      [19] 3743 	ld	e, 0 (iy)
   5B8F 7B            [ 4] 3744 	ld	a,e
   5B90 D6 03         [ 7] 3745 	sub	a, #0x03
   5B92 D2 3C 5D      [10] 3746 	jp	NC,00130$
   5B95 DD 6E 04      [19] 3747 	ld	l,4 (ix)
   5B98 DD 66 05      [19] 3748 	ld	h,5 (ix)
   5B9B 7E            [ 7] 3749 	ld	a,(hl)
   5B9C B7            [ 4] 3750 	or	a, a
   5B9D C2 3C 5D      [10] 3751 	jp	NZ,00130$
                           3752 ;src/main.c:194: player.life += 1;
   5BA0 1C            [ 4] 3753 	inc	e
   5BA1 FD 73 00      [19] 3754 	ld	0 (iy), e
                           3755 ;src/main.c:195: *corazon = 1;
   5BA4 36 01         [10] 3756 	ld	(hl),#0x01
   5BA6 C3 3C 5D      [10] 3757 	jp	00130$
   5BA9                    3758 00119$:
                           3759 ;src/main.c:198: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5BA9 DD 7E F6      [19] 3760 	ld	a,-10 (ix)
   5BAC D6 05         [ 7] 3761 	sub	a, #0x05
   5BAE CA 51 5C      [10] 3762 	jp	Z,00112$
                           3763 ;src/main.c:199: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5BB1 DD 6E FB      [19] 3764 	ld	l,-5 (ix)
   5BB4 DD 66 FC      [19] 3765 	ld	h,-4 (ix)
   5BB7 DD 7E FD      [19] 3766 	ld	a,-3 (ix)
   5BBA B7            [ 4] 3767 	or	a, a
   5BBB 28 02         [12] 3768 	jr	Z,00140$
   5BBD E1            [10] 3769 	pop	hl
   5BBE E5            [11] 3770 	push	hl
   5BBF                    3771 00140$:
   5BBF CB 2C         [ 8] 3772 	sra	h
   5BC1 CB 1D         [ 8] 3773 	rr	l
   5BC3 CB 2C         [ 8] 3774 	sra	h
   5BC5 CB 1D         [ 8] 3775 	rr	l
   5BC7 DD 5E F4      [19] 3776 	ld	e,-12 (ix)
   5BCA DD 56 F5      [19] 3777 	ld	d,-11 (ix)
   5BCD 19            [11] 3778 	add	hl,de
   5BCE 7E            [ 7] 3779 	ld	a,(hl)
   5BCF D6 05         [ 7] 3780 	sub	a, #0x05
   5BD1 CA 51 5C      [10] 3781 	jp	Z,00112$
                           3782 ;src/main.c:200: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5BD4 69            [ 4] 3783 	ld	l, c
   5BD5 60            [ 4] 3784 	ld	h, b
   5BD6 DD 7E F8      [19] 3785 	ld	a,-8 (ix)
   5BD9 B7            [ 4] 3786 	or	a, a
   5BDA 28 06         [12] 3787 	jr	Z,00141$
   5BDC DD 6E F9      [19] 3788 	ld	l,-7 (ix)
   5BDF DD 66 FA      [19] 3789 	ld	h,-6 (ix)
   5BE2                    3790 00141$:
   5BE2 CB 2C         [ 8] 3791 	sra	h
   5BE4 CB 1D         [ 8] 3792 	rr	l
   5BE6 CB 2C         [ 8] 3793 	sra	h
   5BE8 CB 1D         [ 8] 3794 	rr	l
   5BEA CB 2C         [ 8] 3795 	sra	h
   5BEC CB 1D         [ 8] 3796 	rr	l
   5BEE CB 2C         [ 8] 3797 	sra	h
   5BF0 CB 1D         [ 8] 3798 	rr	l
   5BF2 5D            [ 4] 3799 	ld	e, l
   5BF3 54            [ 4] 3800 	ld	d, h
   5BF4 29            [11] 3801 	add	hl, hl
   5BF5 29            [11] 3802 	add	hl, hl
   5BF6 19            [11] 3803 	add	hl, de
   5BF7 29            [11] 3804 	add	hl, hl
   5BF8 29            [11] 3805 	add	hl, hl
   5BF9 11 25 71      [10] 3806 	ld	de,#_scene
   5BFC 19            [11] 3807 	add	hl,de
   5BFD DD 5E F7      [19] 3808 	ld	e,-9 (ix)
   5C00 16 00         [ 7] 3809 	ld	d,#0x00
   5C02 19            [11] 3810 	add	hl,de
   5C03 7E            [ 7] 3811 	ld	a,(hl)
   5C04 D6 05         [ 7] 3812 	sub	a, #0x05
   5C06 28 49         [12] 3813 	jr	Z,00112$
                           3814 ;src/main.c:201: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5C08 69            [ 4] 3815 	ld	l, c
   5C09 60            [ 4] 3816 	ld	h, b
   5C0A DD 7E F8      [19] 3817 	ld	a,-8 (ix)
   5C0D B7            [ 4] 3818 	or	a, a
   5C0E 28 06         [12] 3819 	jr	Z,00142$
   5C10 DD 6E F9      [19] 3820 	ld	l,-7 (ix)
   5C13 DD 66 FA      [19] 3821 	ld	h,-6 (ix)
   5C16                    3822 00142$:
   5C16 CB 2C         [ 8] 3823 	sra	h
   5C18 CB 1D         [ 8] 3824 	rr	l
   5C1A CB 2C         [ 8] 3825 	sra	h
   5C1C CB 1D         [ 8] 3826 	rr	l
   5C1E CB 2C         [ 8] 3827 	sra	h
   5C20 CB 1D         [ 8] 3828 	rr	l
   5C22 CB 2C         [ 8] 3829 	sra	h
   5C24 CB 1D         [ 8] 3830 	rr	l
   5C26 5D            [ 4] 3831 	ld	e, l
   5C27 54            [ 4] 3832 	ld	d, h
   5C28 29            [11] 3833 	add	hl, hl
   5C29 29            [11] 3834 	add	hl, hl
   5C2A 19            [11] 3835 	add	hl, de
   5C2B 29            [11] 3836 	add	hl, hl
   5C2C 29            [11] 3837 	add	hl, hl
   5C2D 3E 25         [ 7] 3838 	ld	a,#<(_scene)
   5C2F 85            [ 4] 3839 	add	a, l
   5C30 5F            [ 4] 3840 	ld	e,a
   5C31 3E 71         [ 7] 3841 	ld	a,#>(_scene)
   5C33 8C            [ 4] 3842 	adc	a, h
   5C34 57            [ 4] 3843 	ld	d,a
   5C35 DD 6E FB      [19] 3844 	ld	l,-5 (ix)
   5C38 DD 66 FC      [19] 3845 	ld	h,-4 (ix)
   5C3B DD 7E FD      [19] 3846 	ld	a,-3 (ix)
   5C3E B7            [ 4] 3847 	or	a, a
   5C3F 28 02         [12] 3848 	jr	Z,00143$
   5C41 E1            [10] 3849 	pop	hl
   5C42 E5            [11] 3850 	push	hl
   5C43                    3851 00143$:
   5C43 CB 2C         [ 8] 3852 	sra	h
   5C45 CB 1D         [ 8] 3853 	rr	l
   5C47 CB 2C         [ 8] 3854 	sra	h
   5C49 CB 1D         [ 8] 3855 	rr	l
   5C4B 19            [11] 3856 	add	hl,de
   5C4C 7E            [ 7] 3857 	ld	a,(hl)
   5C4D D6 05         [ 7] 3858 	sub	a, #0x05
   5C4F 20 21         [12] 3859 	jr	NZ,00113$
   5C51                    3860 00112$:
                           3861 ;src/main.c:203: if(player.bullets < 3 && *flecha == 0){
   5C51 FD 21 31 72   [14] 3862 	ld	iy,#_player + 10
   5C55 FD 5E 00      [19] 3863 	ld	e, 0 (iy)
   5C58 7B            [ 4] 3864 	ld	a,e
   5C59 D6 03         [ 7] 3865 	sub	a, #0x03
   5C5B D2 3C 5D      [10] 3866 	jp	NC,00130$
   5C5E DD 6E 06      [19] 3867 	ld	l,6 (ix)
   5C61 DD 66 07      [19] 3868 	ld	h,7 (ix)
   5C64 7E            [ 7] 3869 	ld	a,(hl)
   5C65 B7            [ 4] 3870 	or	a, a
   5C66 C2 3C 5D      [10] 3871 	jp	NZ,00130$
                           3872 ;src/main.c:204: player.bullets += 1;
   5C69 1C            [ 4] 3873 	inc	e
   5C6A FD 73 00      [19] 3874 	ld	0 (iy), e
                           3875 ;src/main.c:205: *flecha = 1;
   5C6D 36 01         [10] 3876 	ld	(hl),#0x01
   5C6F C3 3C 5D      [10] 3877 	jp	00130$
   5C72                    3878 00113$:
                           3879 ;src/main.c:207: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5C72 DD 7E F6      [19] 3880 	ld	a,-10 (ix)
   5C75 D6 09         [ 7] 3881 	sub	a, #0x09
   5C77 CA 22 5D      [10] 3882 	jp	Z,00107$
                           3883 ;src/main.c:208: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5C7A DD 6E FB      [19] 3884 	ld	l,-5 (ix)
   5C7D DD 66 FC      [19] 3885 	ld	h,-4 (ix)
   5C80 DD 7E FD      [19] 3886 	ld	a,-3 (ix)
   5C83 B7            [ 4] 3887 	or	a, a
   5C84 28 02         [12] 3888 	jr	Z,00144$
   5C86 E1            [10] 3889 	pop	hl
   5C87 E5            [11] 3890 	push	hl
   5C88                    3891 00144$:
   5C88 CB 2C         [ 8] 3892 	sra	h
   5C8A CB 1D         [ 8] 3893 	rr	l
   5C8C CB 2C         [ 8] 3894 	sra	h
   5C8E CB 1D         [ 8] 3895 	rr	l
   5C90 DD 5E F4      [19] 3896 	ld	e,-12 (ix)
   5C93 DD 56 F5      [19] 3897 	ld	d,-11 (ix)
   5C96 19            [11] 3898 	add	hl,de
   5C97 7E            [ 7] 3899 	ld	a,(hl)
   5C98 D6 09         [ 7] 3900 	sub	a, #0x09
   5C9A CA 22 5D      [10] 3901 	jp	Z,00107$
                           3902 ;src/main.c:209: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5C9D 69            [ 4] 3903 	ld	l, c
   5C9E 60            [ 4] 3904 	ld	h, b
   5C9F DD 7E F8      [19] 3905 	ld	a,-8 (ix)
   5CA2 B7            [ 4] 3906 	or	a, a
   5CA3 28 06         [12] 3907 	jr	Z,00145$
   5CA5 DD 6E F9      [19] 3908 	ld	l,-7 (ix)
   5CA8 DD 66 FA      [19] 3909 	ld	h,-6 (ix)
   5CAB                    3910 00145$:
   5CAB CB 2C         [ 8] 3911 	sra	h
   5CAD CB 1D         [ 8] 3912 	rr	l
   5CAF CB 2C         [ 8] 3913 	sra	h
   5CB1 CB 1D         [ 8] 3914 	rr	l
   5CB3 CB 2C         [ 8] 3915 	sra	h
   5CB5 CB 1D         [ 8] 3916 	rr	l
   5CB7 CB 2C         [ 8] 3917 	sra	h
   5CB9 CB 1D         [ 8] 3918 	rr	l
   5CBB 5D            [ 4] 3919 	ld	e, l
   5CBC 54            [ 4] 3920 	ld	d, h
   5CBD 29            [11] 3921 	add	hl, hl
   5CBE 29            [11] 3922 	add	hl, hl
   5CBF 19            [11] 3923 	add	hl, de
   5CC0 29            [11] 3924 	add	hl, hl
   5CC1 29            [11] 3925 	add	hl, hl
   5CC2 11 25 71      [10] 3926 	ld	de,#_scene
   5CC5 19            [11] 3927 	add	hl,de
   5CC6 DD 5E F7      [19] 3928 	ld	e,-9 (ix)
   5CC9 16 00         [ 7] 3929 	ld	d,#0x00
   5CCB 19            [11] 3930 	add	hl,de
   5CCC 7E            [ 7] 3931 	ld	a,(hl)
   5CCD D6 09         [ 7] 3932 	sub	a, #0x09
   5CCF 28 51         [12] 3933 	jr	Z,00107$
                           3934 ;src/main.c:210: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5CD1 DD 7E F8      [19] 3935 	ld	a,-8 (ix)
   5CD4 B7            [ 4] 3936 	or	a, a
   5CD5 28 06         [12] 3937 	jr	Z,00146$
   5CD7 DD 4E F9      [19] 3938 	ld	c,-7 (ix)
   5CDA DD 46 FA      [19] 3939 	ld	b,-6 (ix)
   5CDD                    3940 00146$:
   5CDD CB 28         [ 8] 3941 	sra	b
   5CDF CB 19         [ 8] 3942 	rr	c
   5CE1 CB 28         [ 8] 3943 	sra	b
   5CE3 CB 19         [ 8] 3944 	rr	c
   5CE5 CB 28         [ 8] 3945 	sra	b
   5CE7 CB 19         [ 8] 3946 	rr	c
   5CE9 CB 28         [ 8] 3947 	sra	b
   5CEB CB 19         [ 8] 3948 	rr	c
   5CED 69            [ 4] 3949 	ld	l, c
   5CEE 60            [ 4] 3950 	ld	h, b
   5CEF 29            [11] 3951 	add	hl, hl
   5CF0 29            [11] 3952 	add	hl, hl
   5CF1 09            [11] 3953 	add	hl, bc
   5CF2 29            [11] 3954 	add	hl, hl
   5CF3 29            [11] 3955 	add	hl, hl
   5CF4 3E 25         [ 7] 3956 	ld	a,#<(_scene)
   5CF6 85            [ 4] 3957 	add	a, l
   5CF7 DD 77 F9      [19] 3958 	ld	-7 (ix),a
   5CFA 3E 71         [ 7] 3959 	ld	a,#>(_scene)
   5CFC 8C            [ 4] 3960 	adc	a, h
   5CFD DD 77 FA      [19] 3961 	ld	-6 (ix),a
   5D00 DD 6E FB      [19] 3962 	ld	l,-5 (ix)
   5D03 DD 66 FC      [19] 3963 	ld	h,-4 (ix)
   5D06 DD 7E FD      [19] 3964 	ld	a,-3 (ix)
   5D09 B7            [ 4] 3965 	or	a, a
   5D0A 28 02         [12] 3966 	jr	Z,00147$
   5D0C E1            [10] 3967 	pop	hl
   5D0D E5            [11] 3968 	push	hl
   5D0E                    3969 00147$:
   5D0E CB 2C         [ 8] 3970 	sra	h
   5D10 CB 1D         [ 8] 3971 	rr	l
   5D12 CB 2C         [ 8] 3972 	sra	h
   5D14 CB 1D         [ 8] 3973 	rr	l
   5D16 DD 5E F9      [19] 3974 	ld	e,-7 (ix)
   5D19 DD 56 FA      [19] 3975 	ld	d,-6 (ix)
   5D1C 19            [11] 3976 	add	hl,de
   5D1D 7E            [ 7] 3977 	ld	a,(hl)
   5D1E D6 09         [ 7] 3978 	sub	a, #0x09
   5D20 20 1A         [12] 3979 	jr	NZ,00130$
   5D22                    3980 00107$:
                           3981 ;src/main.c:213: cpct_clearScreen(0);
   5D22 21 00 40      [10] 3982 	ld	hl,#0x4000
   5D25 E5            [11] 3983 	push	hl
   5D26 AF            [ 4] 3984 	xor	a, a
   5D27 F5            [11] 3985 	push	af
   5D28 33            [ 6] 3986 	inc	sp
   5D29 26 C0         [ 7] 3987 	ld	h, #0xC0
   5D2B E5            [11] 3988 	push	hl
   5D2C CD 3C 6F      [17] 3989 	call	_cpct_memset
                           3990 ;src/main.c:214: map+=1;
   5D2F 21 16 72      [10] 3991 	ld	hl, #_map+0
   5D32 34            [11] 3992 	inc	(hl)
                           3993 ;src/main.c:215: drawMap(map);
   5D33 3A 16 72      [13] 3994 	ld	a,(_map)
   5D36 F5            [11] 3995 	push	af
   5D37 33            [ 6] 3996 	inc	sp
   5D38 CD C0 46      [17] 3997 	call	_drawMap
   5D3B 33            [ 6] 3998 	inc	sp
   5D3C                    3999 00130$:
   5D3C DD F9         [10] 4000 	ld	sp, ix
   5D3E DD E1         [14] 4001 	pop	ix
   5D40 C9            [10] 4002 	ret
                           4003 ;src/main.c:219: u8 checkArrowCollisions(){
                           4004 ;	---------------------------------
                           4005 ; Function checkArrowCollisions
                           4006 ; ---------------------------------
   5D41                    4007 _checkArrowCollisions::
   5D41 DD E5         [15] 4008 	push	ix
   5D43 DD 21 00 00   [14] 4009 	ld	ix,#0
   5D47 DD 39         [15] 4010 	add	ix,sp
   5D49 21 F2 FF      [10] 4011 	ld	hl,#-14
   5D4C 39            [11] 4012 	add	hl,sp
   5D4D F9            [ 6] 4013 	ld	sp,hl
                           4014 ;src/main.c:222: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5D4E 3A 1E 72      [13] 4015 	ld	a,(#(_object + 0x0001) + 0)
   5D51 DD 77 F3      [19] 4016 	ld	-13 (ix), a
   5D54 07            [ 4] 4017 	rlca
   5D55 07            [ 4] 4018 	rlca
   5D56 07            [ 4] 4019 	rlca
   5D57 07            [ 4] 4020 	rlca
   5D58 E6 0F         [ 7] 4021 	and	a,#0x0F
   5D5A 4F            [ 4] 4022 	ld	c,a
   5D5B 06 00         [ 7] 4023 	ld	b,#0x00
   5D5D 69            [ 4] 4024 	ld	l, c
   5D5E 60            [ 4] 4025 	ld	h, b
   5D5F 29            [11] 4026 	add	hl, hl
   5D60 29            [11] 4027 	add	hl, hl
   5D61 09            [11] 4028 	add	hl, bc
   5D62 29            [11] 4029 	add	hl, hl
   5D63 29            [11] 4030 	add	hl, hl
   5D64 3E 25         [ 7] 4031 	ld	a,#<(_scene)
   5D66 85            [ 4] 4032 	add	a, l
   5D67 DD 77 F6      [19] 4033 	ld	-10 (ix),a
   5D6A 3E 71         [ 7] 4034 	ld	a,#>(_scene)
   5D6C 8C            [ 4] 4035 	adc	a, h
   5D6D DD 77 F7      [19] 4036 	ld	-9 (ix),a
   5D70 21 1D 72      [10] 4037 	ld	hl, #_object + 0
   5D73 4E            [ 7] 4038 	ld	c,(hl)
   5D74 79            [ 4] 4039 	ld	a,c
   5D75 0F            [ 4] 4040 	rrca
   5D76 0F            [ 4] 4041 	rrca
   5D77 E6 3F         [ 7] 4042 	and	a,#0x3F
   5D79 DD 77 F2      [19] 4043 	ld	-14 (ix), a
   5D7C DD 86 F6      [19] 4044 	add	a, -10 (ix)
   5D7F 6F            [ 4] 4045 	ld	l,a
   5D80 3E 00         [ 7] 4046 	ld	a,#0x00
   5D82 DD 8E F7      [19] 4047 	adc	a, -9 (ix)
   5D85 67            [ 4] 4048 	ld	h,a
   5D86 7E            [ 7] 4049 	ld	a,(hl)
                           4050 ;src/main.c:227: object.x=object.lx;
                           4051 ;src/main.c:228: object.y=object.ly;
                           4052 ;src/main.c:222: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5D87 DD 77 F4      [19] 4053 	ld	-12 (ix), a
   5D8A 3D            [ 4] 4054 	dec	a
   5D8B CA AA 5E      [10] 4055 	jp	Z,00101$
                           4056 ;src/main.c:223: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5D8E 06 00         [ 7] 4057 	ld	b,#0x00
   5D90 21 03 00      [10] 4058 	ld	hl,#0x0003
   5D93 09            [11] 4059 	add	hl,bc
   5D94 DD 75 FC      [19] 4060 	ld	-4 (ix),l
   5D97 DD 74 FD      [19] 4061 	ld	-3 (ix),h
   5D9A DD 7E FC      [19] 4062 	ld	a,-4 (ix)
   5D9D DD 77 FA      [19] 4063 	ld	-6 (ix),a
   5DA0 DD 7E FD      [19] 4064 	ld	a,-3 (ix)
   5DA3 DD 77 FB      [19] 4065 	ld	-5 (ix),a
   5DA6 DD 7E FD      [19] 4066 	ld	a,-3 (ix)
   5DA9 07            [ 4] 4067 	rlca
   5DAA E6 01         [ 7] 4068 	and	a,#0x01
   5DAC DD 77 F5      [19] 4069 	ld	-11 (ix),a
   5DAF 21 06 00      [10] 4070 	ld	hl,#0x0006
   5DB2 09            [11] 4071 	add	hl,bc
   5DB3 DD 75 FE      [19] 4072 	ld	-2 (ix),l
   5DB6 DD 74 FF      [19] 4073 	ld	-1 (ix),h
   5DB9 DD 7E F5      [19] 4074 	ld	a,-11 (ix)
   5DBC B7            [ 4] 4075 	or	a, a
   5DBD 28 0C         [12] 4076 	jr	Z,00113$
   5DBF DD 7E FE      [19] 4077 	ld	a,-2 (ix)
   5DC2 DD 77 FA      [19] 4078 	ld	-6 (ix),a
   5DC5 DD 7E FF      [19] 4079 	ld	a,-1 (ix)
   5DC8 DD 77 FB      [19] 4080 	ld	-5 (ix),a
   5DCB                    4081 00113$:
   5DCB DD 6E FA      [19] 4082 	ld	l,-6 (ix)
   5DCE DD 66 FB      [19] 4083 	ld	h,-5 (ix)
   5DD1 CB 2C         [ 8] 4084 	sra	h
   5DD3 CB 1D         [ 8] 4085 	rr	l
   5DD5 CB 2C         [ 8] 4086 	sra	h
   5DD7 CB 1D         [ 8] 4087 	rr	l
   5DD9 DD 5E F6      [19] 4088 	ld	e,-10 (ix)
   5DDC DD 56 F7      [19] 4089 	ld	d,-9 (ix)
   5DDF 19            [11] 4090 	add	hl,de
   5DE0 7E            [ 7] 4091 	ld	a,(hl)
   5DE1 3D            [ 4] 4092 	dec	a
   5DE2 CA AA 5E      [10] 4093 	jp	Z,00101$
                           4094 ;src/main.c:224: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 1
   5DE5 DD 5E F3      [19] 4095 	ld	e,-13 (ix)
   5DE8 16 00         [ 7] 4096 	ld	d,#0x00
   5DEA 21 06 00      [10] 4097 	ld	hl,#0x0006
   5DED 19            [11] 4098 	add	hl,de
   5DEE 4D            [ 4] 4099 	ld	c,l
   5DEF 44            [ 4] 4100 	ld	b,h
   5DF0 DD 71 FA      [19] 4101 	ld	-6 (ix),c
   5DF3 DD 70 FB      [19] 4102 	ld	-5 (ix),b
   5DF6 78            [ 4] 4103 	ld	a,b
   5DF7 07            [ 4] 4104 	rlca
   5DF8 E6 01         [ 7] 4105 	and	a,#0x01
   5DFA DD 77 F3      [19] 4106 	ld	-13 (ix),a
   5DFD 21 15 00      [10] 4107 	ld	hl,#0x0015
   5E00 19            [11] 4108 	add	hl,de
   5E01 DD 75 F8      [19] 4109 	ld	-8 (ix),l
   5E04 DD 74 F9      [19] 4110 	ld	-7 (ix),h
   5E07 DD 7E F3      [19] 4111 	ld	a,-13 (ix)
   5E0A B7            [ 4] 4112 	or	a, a
   5E0B 28 0C         [12] 4113 	jr	Z,00114$
   5E0D DD 7E F8      [19] 4114 	ld	a,-8 (ix)
   5E10 DD 77 FA      [19] 4115 	ld	-6 (ix),a
   5E13 DD 7E F9      [19] 4116 	ld	a,-7 (ix)
   5E16 DD 77 FB      [19] 4117 	ld	-5 (ix),a
   5E19                    4118 00114$:
   5E19 DD 6E FA      [19] 4119 	ld	l,-6 (ix)
   5E1C DD 66 FB      [19] 4120 	ld	h,-5 (ix)
   5E1F CB 2C         [ 8] 4121 	sra	h
   5E21 CB 1D         [ 8] 4122 	rr	l
   5E23 CB 2C         [ 8] 4123 	sra	h
   5E25 CB 1D         [ 8] 4124 	rr	l
   5E27 CB 2C         [ 8] 4125 	sra	h
   5E29 CB 1D         [ 8] 4126 	rr	l
   5E2B CB 2C         [ 8] 4127 	sra	h
   5E2D CB 1D         [ 8] 4128 	rr	l
   5E2F 5D            [ 4] 4129 	ld	e, l
   5E30 54            [ 4] 4130 	ld	d, h
   5E31 29            [11] 4131 	add	hl, hl
   5E32 29            [11] 4132 	add	hl, hl
   5E33 19            [11] 4133 	add	hl, de
   5E34 29            [11] 4134 	add	hl, hl
   5E35 29            [11] 4135 	add	hl, hl
   5E36 11 25 71      [10] 4136 	ld	de,#_scene
   5E39 19            [11] 4137 	add	hl,de
   5E3A DD 5E F2      [19] 4138 	ld	e,-14 (ix)
   5E3D 16 00         [ 7] 4139 	ld	d,#0x00
   5E3F 19            [11] 4140 	add	hl,de
   5E40 7E            [ 7] 4141 	ld	a,(hl)
   5E41 3D            [ 4] 4142 	dec	a
   5E42 28 66         [12] 4143 	jr	Z,00101$
                           4144 ;src/main.c:225: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5E44 DD 71 FA      [19] 4145 	ld	-6 (ix),c
   5E47 DD 70 FB      [19] 4146 	ld	-5 (ix),b
   5E4A DD 7E F3      [19] 4147 	ld	a,-13 (ix)
   5E4D B7            [ 4] 4148 	or	a, a
   5E4E 28 0C         [12] 4149 	jr	Z,00115$
   5E50 DD 7E F8      [19] 4150 	ld	a,-8 (ix)
   5E53 DD 77 FA      [19] 4151 	ld	-6 (ix),a
   5E56 DD 7E F9      [19] 4152 	ld	a,-7 (ix)
   5E59 DD 77 FB      [19] 4153 	ld	-5 (ix),a
   5E5C                    4154 00115$:
   5E5C DD 6E FA      [19] 4155 	ld	l,-6 (ix)
   5E5F DD 66 FB      [19] 4156 	ld	h,-5 (ix)
   5E62 CB 2C         [ 8] 4157 	sra	h
   5E64 CB 1D         [ 8] 4158 	rr	l
   5E66 CB 2C         [ 8] 4159 	sra	h
   5E68 CB 1D         [ 8] 4160 	rr	l
   5E6A CB 2C         [ 8] 4161 	sra	h
   5E6C CB 1D         [ 8] 4162 	rr	l
   5E6E CB 2C         [ 8] 4163 	sra	h
   5E70 CB 1D         [ 8] 4164 	rr	l
   5E72 5D            [ 4] 4165 	ld	e, l
   5E73 54            [ 4] 4166 	ld	d, h
   5E74 29            [11] 4167 	add	hl, hl
   5E75 29            [11] 4168 	add	hl, hl
   5E76 19            [11] 4169 	add	hl, de
   5E77 29            [11] 4170 	add	hl, hl
   5E78 29            [11] 4171 	add	hl, hl
   5E79 3E 25         [ 7] 4172 	ld	a,#<(_scene)
   5E7B 85            [ 4] 4173 	add	a, l
   5E7C DD 77 FA      [19] 4174 	ld	-6 (ix),a
   5E7F 3E 71         [ 7] 4175 	ld	a,#>(_scene)
   5E81 8C            [ 4] 4176 	adc	a, h
   5E82 DD 77 FB      [19] 4177 	ld	-5 (ix),a
   5E85 DD 6E FC      [19] 4178 	ld	l,-4 (ix)
   5E88 DD 66 FD      [19] 4179 	ld	h,-3 (ix)
   5E8B DD 7E F5      [19] 4180 	ld	a,-11 (ix)
   5E8E B7            [ 4] 4181 	or	a, a
   5E8F 28 06         [12] 4182 	jr	Z,00116$
   5E91 DD 6E FE      [19] 4183 	ld	l,-2 (ix)
   5E94 DD 66 FF      [19] 4184 	ld	h,-1 (ix)
   5E97                    4185 00116$:
   5E97 CB 2C         [ 8] 4186 	sra	h
   5E99 CB 1D         [ 8] 4187 	rr	l
   5E9B CB 2C         [ 8] 4188 	sra	h
   5E9D CB 1D         [ 8] 4189 	rr	l
   5E9F DD 5E FA      [19] 4190 	ld	e,-6 (ix)
   5EA2 DD 56 FB      [19] 4191 	ld	d,-5 (ix)
   5EA5 19            [11] 4192 	add	hl,de
   5EA6 7E            [ 7] 4193 	ld	a,(hl)
   5EA7 3D            [ 4] 4194 	dec	a
   5EA8 20 11         [12] 4195 	jr	NZ,00102$
   5EAA                    4196 00101$:
                           4197 ;src/main.c:227: object.x=object.lx;
   5EAA 3A 1F 72      [13] 4198 	ld	a, (#(_object + 0x0002) + 0)
   5EAD 32 1D 72      [13] 4199 	ld	(#_object),a
                           4200 ;src/main.c:228: object.y=object.ly;
   5EB0 3A 20 72      [13] 4201 	ld	a, (#(_object + 0x0003) + 0)
   5EB3 32 1E 72      [13] 4202 	ld	(#(_object + 0x0001)),a
                           4203 ;src/main.c:230: return bound;
   5EB6 2E 01         [ 7] 4204 	ld	l,#0x01
   5EB8 C3 85 5F      [10] 4205 	jp	00111$
   5EBB                    4206 00102$:
                           4207 ;src/main.c:233: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 9
   5EBB DD 7E F4      [19] 4208 	ld	a,-12 (ix)
   5EBE D6 09         [ 7] 4209 	sub	a, #0x09
   5EC0 CA 73 5F      [10] 4210 	jp	Z,00106$
                           4211 ;src/main.c:234: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   5EC3 DD 6E FC      [19] 4212 	ld	l,-4 (ix)
   5EC6 DD 66 FD      [19] 4213 	ld	h,-3 (ix)
   5EC9 DD 7E F5      [19] 4214 	ld	a,-11 (ix)
   5ECC B7            [ 4] 4215 	or	a, a
   5ECD 28 06         [12] 4216 	jr	Z,00117$
   5ECF DD 6E FE      [19] 4217 	ld	l,-2 (ix)
   5ED2 DD 66 FF      [19] 4218 	ld	h,-1 (ix)
   5ED5                    4219 00117$:
   5ED5 CB 2C         [ 8] 4220 	sra	h
   5ED7 CB 1D         [ 8] 4221 	rr	l
   5ED9 CB 2C         [ 8] 4222 	sra	h
   5EDB CB 1D         [ 8] 4223 	rr	l
   5EDD DD 5E F6      [19] 4224 	ld	e,-10 (ix)
   5EE0 DD 56 F7      [19] 4225 	ld	d,-9 (ix)
   5EE3 19            [11] 4226 	add	hl,de
   5EE4 7E            [ 7] 4227 	ld	a,(hl)
   5EE5 D6 09         [ 7] 4228 	sub	a, #0x09
   5EE7 CA 73 5F      [10] 4229 	jp	Z,00106$
                           4230 ;src/main.c:235: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 9
   5EEA 69            [ 4] 4231 	ld	l, c
   5EEB 60            [ 4] 4232 	ld	h, b
   5EEC DD 7E F3      [19] 4233 	ld	a,-13 (ix)
   5EEF B7            [ 4] 4234 	or	a, a
   5EF0 28 06         [12] 4235 	jr	Z,00118$
   5EF2 DD 6E F8      [19] 4236 	ld	l,-8 (ix)
   5EF5 DD 66 F9      [19] 4237 	ld	h,-7 (ix)
   5EF8                    4238 00118$:
   5EF8 CB 2C         [ 8] 4239 	sra	h
   5EFA CB 1D         [ 8] 4240 	rr	l
   5EFC CB 2C         [ 8] 4241 	sra	h
   5EFE CB 1D         [ 8] 4242 	rr	l
   5F00 CB 2C         [ 8] 4243 	sra	h
   5F02 CB 1D         [ 8] 4244 	rr	l
   5F04 CB 2C         [ 8] 4245 	sra	h
   5F06 CB 1D         [ 8] 4246 	rr	l
   5F08 5D            [ 4] 4247 	ld	e, l
   5F09 54            [ 4] 4248 	ld	d, h
   5F0A 29            [11] 4249 	add	hl, hl
   5F0B 29            [11] 4250 	add	hl, hl
   5F0C 19            [11] 4251 	add	hl, de
   5F0D 29            [11] 4252 	add	hl, hl
   5F0E 29            [11] 4253 	add	hl, hl
   5F0F 11 25 71      [10] 4254 	ld	de,#_scene
   5F12 19            [11] 4255 	add	hl,de
   5F13 DD 5E F2      [19] 4256 	ld	e,-14 (ix)
   5F16 16 00         [ 7] 4257 	ld	d,#0x00
   5F18 19            [11] 4258 	add	hl,de
   5F19 7E            [ 7] 4259 	ld	a,(hl)
   5F1A D6 09         [ 7] 4260 	sub	a, #0x09
   5F1C 28 55         [12] 4261 	jr	Z,00106$
                           4262 ;src/main.c:236: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   5F1E DD 7E F3      [19] 4263 	ld	a,-13 (ix)
   5F21 B7            [ 4] 4264 	or	a, a
   5F22 28 06         [12] 4265 	jr	Z,00119$
   5F24 DD 4E F8      [19] 4266 	ld	c,-8 (ix)
   5F27 DD 46 F9      [19] 4267 	ld	b,-7 (ix)
   5F2A                    4268 00119$:
   5F2A CB 28         [ 8] 4269 	sra	b
   5F2C CB 19         [ 8] 4270 	rr	c
   5F2E CB 28         [ 8] 4271 	sra	b
   5F30 CB 19         [ 8] 4272 	rr	c
   5F32 CB 28         [ 8] 4273 	sra	b
   5F34 CB 19         [ 8] 4274 	rr	c
   5F36 CB 28         [ 8] 4275 	sra	b
   5F38 CB 19         [ 8] 4276 	rr	c
   5F3A 69            [ 4] 4277 	ld	l, c
   5F3B 60            [ 4] 4278 	ld	h, b
   5F3C 29            [11] 4279 	add	hl, hl
   5F3D 29            [11] 4280 	add	hl, hl
   5F3E 09            [11] 4281 	add	hl, bc
   5F3F 29            [11] 4282 	add	hl, hl
   5F40 29            [11] 4283 	add	hl, hl
   5F41 3E 25         [ 7] 4284 	ld	a,#<(_scene)
   5F43 85            [ 4] 4285 	add	a, l
   5F44 DD 77 F8      [19] 4286 	ld	-8 (ix),a
   5F47 3E 71         [ 7] 4287 	ld	a,#>(_scene)
   5F49 8C            [ 4] 4288 	adc	a, h
   5F4A DD 77 F9      [19] 4289 	ld	-7 (ix),a
   5F4D DD 6E FC      [19] 4290 	ld	l,-4 (ix)
   5F50 DD 66 FD      [19] 4291 	ld	h,-3 (ix)
   5F53 DD 7E F5      [19] 4292 	ld	a,-11 (ix)
   5F56 B7            [ 4] 4293 	or	a, a
   5F57 28 06         [12] 4294 	jr	Z,00120$
   5F59 DD 6E FE      [19] 4295 	ld	l,-2 (ix)
   5F5C DD 66 FF      [19] 4296 	ld	h,-1 (ix)
   5F5F                    4297 00120$:
   5F5F CB 2C         [ 8] 4298 	sra	h
   5F61 CB 1D         [ 8] 4299 	rr	l
   5F63 CB 2C         [ 8] 4300 	sra	h
   5F65 CB 1D         [ 8] 4301 	rr	l
   5F67 DD 5E F8      [19] 4302 	ld	e,-8 (ix)
   5F6A DD 56 F9      [19] 4303 	ld	d,-7 (ix)
   5F6D 19            [11] 4304 	add	hl,de
   5F6E 7E            [ 7] 4305 	ld	a,(hl)
   5F6F D6 09         [ 7] 4306 	sub	a, #0x09
   5F71 20 10         [12] 4307 	jr	NZ,00107$
   5F73                    4308 00106$:
                           4309 ;src/main.c:238: object.x=object.lx;
   5F73 3A 1F 72      [13] 4310 	ld	a, (#(_object + 0x0002) + 0)
   5F76 32 1D 72      [13] 4311 	ld	(#_object),a
                           4312 ;src/main.c:239: object.y=object.ly;
   5F79 3A 20 72      [13] 4313 	ld	a, (#(_object + 0x0003) + 0)
   5F7C 32 1E 72      [13] 4314 	ld	(#(_object + 0x0001)),a
                           4315 ;src/main.c:241: return bound;
   5F7F 2E 01         [ 7] 4316 	ld	l,#0x01
   5F81 18 02         [12] 4317 	jr	00111$
   5F83                    4318 00107$:
                           4319 ;src/main.c:244: return bound;
   5F83 2E 00         [ 7] 4320 	ld	l,#0x00
   5F85                    4321 00111$:
   5F85 DD F9         [10] 4322 	ld	sp, ix
   5F87 DD E1         [14] 4323 	pop	ix
   5F89 C9            [10] 4324 	ret
                           4325 ;src/main.c:250: void followPlayer(){
                           4326 ;	---------------------------------
                           4327 ; Function followPlayer
                           4328 ; ---------------------------------
   5F8A                    4329 _followPlayer::
   5F8A DD E5         [15] 4330 	push	ix
   5F8C DD 21 00 00   [14] 4331 	ld	ix,#0
   5F90 DD 39         [15] 4332 	add	ix,sp
   5F92 21 E1 FF      [10] 4333 	ld	hl,#-31
   5F95 39            [11] 4334 	add	hl,sp
   5F96 F9            [ 6] 4335 	ld	sp,hl
                           4336 ;src/main.c:253: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   5F97 21 28 72      [10] 4337 	ld	hl, #(_player + 0x0001) + 0
   5F9A 56            [ 7] 4338 	ld	d,(hl)
   5F9B 3A 27 72      [13] 4339 	ld	a, (#_player + 0)
   5F9E D5            [11] 4340 	push	de
   5F9F 33            [ 6] 4341 	inc	sp
   5FA0 F5            [11] 4342 	push	af
   5FA1 33            [ 6] 4343 	inc	sp
   5FA2 CD 7C 4F      [17] 4344 	call	_detectPlayerRoom
   5FA5 F1            [10] 4345 	pop	af
   5FA6 DD 75 E3      [19] 4346 	ld	-29 (ix),l
   5FA9 21 3D 72      [10] 4347 	ld	hl, #_enemy + 11
   5FAC DD 7E E3      [19] 4348 	ld	a,-29 (ix)
   5FAF 96            [ 7] 4349 	sub	a,(hl)
   5FB0 28 0E         [12] 4350 	jr	Z,00102$
                           4351 ;src/main.c:254: auxX = enemy.seenX;
   5FB2 3A 3E 72      [13] 4352 	ld	a,(#_enemy + 12)
   5FB5 DD 77 E2      [19] 4353 	ld	-30 (ix),a
                           4354 ;src/main.c:255: auxY = enemy.seenY;
   5FB8 3A 3F 72      [13] 4355 	ld	a,(#_enemy + 13)
   5FBB DD 77 E1      [19] 4356 	ld	-31 (ix),a
   5FBE 18 0C         [12] 4357 	jr	00103$
   5FC0                    4358 00102$:
                           4359 ;src/main.c:257: auxX = player.x;
   5FC0 3A 27 72      [13] 4360 	ld	a,(#_player + 0)
   5FC3 DD 77 E2      [19] 4361 	ld	-30 (ix),a
                           4362 ;src/main.c:258: auxY = player.y;
   5FC6 3A 28 72      [13] 4363 	ld	a,(#(_player + 0x0001) + 0)
   5FC9 DD 77 E1      [19] 4364 	ld	-31 (ix),a
   5FCC                    4365 00103$:
                           4366 ;src/main.c:262: if(auxX < enemy.x){
   5FCC 3A 32 72      [13] 4367 	ld	a,(#_enemy + 0)
                           4368 ;src/main.c:264: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5FCF DD 77 E3      [19] 4369 	ld	-29 (ix), a
   5FD2 DD 77 E4      [19] 4370 	ld	-28 (ix),a
   5FD5 DD 36 E5 00   [19] 4371 	ld	-27 (ix),#0x00
   5FD9 DD 7E E4      [19] 4372 	ld	a,-28 (ix)
   5FDC C6 02         [ 7] 4373 	add	a, #0x02
   5FDE DD 77 E8      [19] 4374 	ld	-24 (ix),a
   5FE1 DD 7E E5      [19] 4375 	ld	a,-27 (ix)
   5FE4 CE 00         [ 7] 4376 	adc	a, #0x00
   5FE6 DD 77 E9      [19] 4377 	ld	-23 (ix),a
                           4378 ;src/main.c:268: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5FE9 DD 7E E3      [19] 4379 	ld	a,-29 (ix)
   5FEC 0F            [ 4] 4380 	rrca
   5FED 0F            [ 4] 4381 	rrca
   5FEE E6 3F         [ 7] 4382 	and	a,#0x3F
   5FF0 DD 77 FD      [19] 4383 	ld	-3 (ix),a
                           4384 ;src/main.c:264: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5FF3 3A 33 72      [13] 4385 	ld	a,(#(_enemy + 0x0001) + 0)
   5FF6 DD 77 F4      [19] 4386 	ld	-12 (ix),a
   5FF9 DD 7E E4      [19] 4387 	ld	a,-28 (ix)
   5FFC C6 FF         [ 7] 4388 	add	a,#0xFF
   5FFE DD 77 EA      [19] 4389 	ld	-22 (ix),a
   6001 DD 7E E5      [19] 4390 	ld	a,-27 (ix)
   6004 CE FF         [ 7] 4391 	adc	a,#0xFF
   6006 DD 77 EB      [19] 4392 	ld	-21 (ix),a
   6009 DD 7E F4      [19] 4393 	ld	a,-12 (ix)
   600C 07            [ 4] 4394 	rlca
   600D 07            [ 4] 4395 	rlca
   600E 07            [ 4] 4396 	rlca
   600F 07            [ 4] 4397 	rlca
   6010 E6 0F         [ 7] 4398 	and	a,#0x0F
   6012 DD 77 FE      [19] 4399 	ld	-2 (ix),a
   6015 DD 7E EB      [19] 4400 	ld	a,-21 (ix)
   6018 07            [ 4] 4401 	rlca
   6019 E6 01         [ 7] 4402 	and	a,#0x01
   601B DD 77 F5      [19] 4403 	ld	-11 (ix),a
                           4404 ;src/main.c:267: }else if(auxY < enemy.y){
   601E DD 7E E1      [19] 4405 	ld	a,-31 (ix)
   6021 DD 96 F4      [19] 4406 	sub	a, -12 (ix)
   6024 3E 00         [ 7] 4407 	ld	a,#0x00
   6026 17            [ 4] 4408 	rla
   6027 DD 77 FF      [19] 4409 	ld	-1 (ix),a
                           4410 ;src/main.c:269: enemy.y-=1;
   602A DD 7E F4      [19] 4411 	ld	a,-12 (ix)
   602D C6 FF         [ 7] 4412 	add	a,#0xFF
   602F DD 77 ED      [19] 4413 	ld	-19 (ix),a
                           4414 ;src/main.c:272: enemy.y+=1;
   6032 DD 7E F4      [19] 4415 	ld	a,-12 (ix)
   6035 3C            [ 4] 4416 	inc	a
   6036 DD 77 EC      [19] 4417 	ld	-20 (ix),a
                           4418 ;src/main.c:265: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   6039 DD 7E F4      [19] 4419 	ld	a,-12 (ix)
   603C DD 77 F2      [19] 4420 	ld	-14 (ix),a
   603F DD 36 F3 00   [19] 4421 	ld	-13 (ix),#0x00
                           4422 ;src/main.c:264: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   6043 DD 4E FE      [19] 4423 	ld	c,-2 (ix)
   6046 06 00         [ 7] 4424 	ld	b,#0x00
   6048 69            [ 4] 4425 	ld	l, c
   6049 60            [ 4] 4426 	ld	h, b
   604A 29            [11] 4427 	add	hl, hl
   604B 29            [11] 4428 	add	hl, hl
   604C 09            [11] 4429 	add	hl, bc
   604D 29            [11] 4430 	add	hl, hl
   604E 29            [11] 4431 	add	hl, hl
   604F DD 75 F6      [19] 4432 	ld	-10 (ix),l
   6052 DD 74 F7      [19] 4433 	ld	-9 (ix),h
                           4434 ;src/main.c:268: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   6055 DD 7E F2      [19] 4435 	ld	a,-14 (ix)
   6058 C6 FF         [ 7] 4436 	add	a,#0xFF
   605A DD 77 FB      [19] 4437 	ld	-5 (ix),a
   605D DD 7E F3      [19] 4438 	ld	a,-13 (ix)
   6060 CE FF         [ 7] 4439 	adc	a,#0xFF
   6062 DD 77 FC      [19] 4440 	ld	-4 (ix),a
   6065 DD 7E F2      [19] 4441 	ld	a,-14 (ix)
   6068 C6 0E         [ 7] 4442 	add	a, #0x0E
   606A DD 77 F8      [19] 4443 	ld	-8 (ix),a
   606D DD 7E F3      [19] 4444 	ld	a,-13 (ix)
   6070 CE 00         [ 7] 4445 	adc	a, #0x00
   6072 DD 77 F9      [19] 4446 	ld	-7 (ix),a
                           4447 ;src/main.c:265: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   6075 DD 7E F2      [19] 4448 	ld	a,-14 (ix)
   6078 C6 10         [ 7] 4449 	add	a, #0x10
   607A DD 77 E6      [19] 4450 	ld	-26 (ix),a
   607D DD 7E F3      [19] 4451 	ld	a,-13 (ix)
   6080 CE 00         [ 7] 4452 	adc	a, #0x00
   6082 DD 77 E7      [19] 4453 	ld	-25 (ix),a
   6085 DD 7E F2      [19] 4454 	ld	a,-14 (ix)
   6088 C6 1F         [ 7] 4455 	add	a, #0x1F
   608A DD 77 F2      [19] 4456 	ld	-14 (ix),a
   608D DD 7E F3      [19] 4457 	ld	a,-13 (ix)
   6090 CE 00         [ 7] 4458 	adc	a, #0x00
   6092 DD 77 F3      [19] 4459 	ld	-13 (ix),a
                           4460 ;src/main.c:268: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   6095 DD 7E FC      [19] 4461 	ld	a,-4 (ix)
   6098 07            [ 4] 4462 	rlca
   6099 E6 01         [ 7] 4463 	and	a,#0x01
   609B DD 77 FE      [19] 4464 	ld	-2 (ix),a
                           4465 ;src/main.c:265: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   609E DD 7E E7      [19] 4466 	ld	a,-25 (ix)
   60A1 07            [ 4] 4467 	rlca
   60A2 E6 01         [ 7] 4468 	and	a,#0x01
   60A4 DD 77 F4      [19] 4469 	ld	-12 (ix),a
                           4470 ;src/main.c:262: if(auxX < enemy.x){
   60A7 DD 7E E2      [19] 4471 	ld	a,-30 (ix)
   60AA DD 96 E3      [19] 4472 	sub	a, -29 (ix)
   60AD D2 D6 62      [10] 4473 	jp	NC,00137$
                           4474 ;src/main.c:264: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   60B0 DD 7E F6      [19] 4475 	ld	a,-10 (ix)
   60B3 C6 25         [ 7] 4476 	add	a, #<(_scene)
   60B5 DD 77 F0      [19] 4477 	ld	-16 (ix),a
   60B8 DD 7E F7      [19] 4478 	ld	a,-9 (ix)
   60BB CE 71         [ 7] 4479 	adc	a, #>(_scene)
   60BD DD 77 F1      [19] 4480 	ld	-15 (ix),a
   60C0 DD 7E EA      [19] 4481 	ld	a,-22 (ix)
   60C3 DD 77 EE      [19] 4482 	ld	-18 (ix),a
   60C6 DD 7E EB      [19] 4483 	ld	a,-21 (ix)
   60C9 DD 77 EF      [19] 4484 	ld	-17 (ix),a
   60CC DD 7E F5      [19] 4485 	ld	a,-11 (ix)
   60CF B7            [ 4] 4486 	or	a, a
   60D0 28 0C         [12] 4487 	jr	Z,00141$
   60D2 DD 7E E8      [19] 4488 	ld	a,-24 (ix)
   60D5 DD 77 EE      [19] 4489 	ld	-18 (ix),a
   60D8 DD 7E E9      [19] 4490 	ld	a,-23 (ix)
   60DB DD 77 EF      [19] 4491 	ld	-17 (ix),a
   60DE                    4492 00141$:
   60DE DD CB EF 2E   [23] 4493 	sra	-17 (ix)
   60E2 DD CB EE 1E   [23] 4494 	rr	-18 (ix)
   60E6 DD CB EF 2E   [23] 4495 	sra	-17 (ix)
   60EA DD CB EE 1E   [23] 4496 	rr	-18 (ix)
   60EE DD 7E F0      [19] 4497 	ld	a,-16 (ix)
   60F1 DD 86 EE      [19] 4498 	add	a, -18 (ix)
   60F4 DD 77 EE      [19] 4499 	ld	-18 (ix),a
   60F7 DD 7E F1      [19] 4500 	ld	a,-15 (ix)
   60FA DD 8E EF      [19] 4501 	adc	a, -17 (ix)
   60FD DD 77 EF      [19] 4502 	ld	-17 (ix),a
   6100 DD 6E EE      [19] 4503 	ld	l,-18 (ix)
   6103 DD 66 EF      [19] 4504 	ld	h,-17 (ix)
   6106 7E            [ 7] 4505 	ld	a,(hl)
   6107 3D            [ 4] 4506 	dec	a
   6108 CA C1 61      [10] 4507 	jp	Z,00112$
                           4508 ;src/main.c:265: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   610B DD 7E E6      [19] 4509 	ld	a,-26 (ix)
   610E DD 77 EE      [19] 4510 	ld	-18 (ix),a
   6111 DD 7E E7      [19] 4511 	ld	a,-25 (ix)
   6114 DD 77 EF      [19] 4512 	ld	-17 (ix),a
   6117 DD 7E F4      [19] 4513 	ld	a,-12 (ix)
   611A B7            [ 4] 4514 	or	a, a
   611B 28 0C         [12] 4515 	jr	Z,00142$
   611D DD 7E F2      [19] 4516 	ld	a,-14 (ix)
   6120 DD 77 EE      [19] 4517 	ld	-18 (ix),a
   6123 DD 7E F3      [19] 4518 	ld	a,-13 (ix)
   6126 DD 77 EF      [19] 4519 	ld	-17 (ix),a
   6129                    4520 00142$:
   6129 DD CB EF 2E   [23] 4521 	sra	-17 (ix)
   612D DD CB EE 1E   [23] 4522 	rr	-18 (ix)
   6131 DD CB EF 2E   [23] 4523 	sra	-17 (ix)
   6135 DD CB EE 1E   [23] 4524 	rr	-18 (ix)
   6139 DD CB EF 2E   [23] 4525 	sra	-17 (ix)
   613D DD CB EE 1E   [23] 4526 	rr	-18 (ix)
   6141 DD CB EF 2E   [23] 4527 	sra	-17 (ix)
   6145 DD CB EE 1E   [23] 4528 	rr	-18 (ix)
   6149 DD 4E EE      [19] 4529 	ld	c,-18 (ix)
   614C DD 46 EF      [19] 4530 	ld	b,-17 (ix)
   614F 69            [ 4] 4531 	ld	l, c
   6150 60            [ 4] 4532 	ld	h, b
   6151 29            [11] 4533 	add	hl, hl
   6152 29            [11] 4534 	add	hl, hl
   6153 09            [11] 4535 	add	hl, bc
   6154 29            [11] 4536 	add	hl, hl
   6155 29            [11] 4537 	add	hl, hl
   6156 DD 75 EE      [19] 4538 	ld	-18 (ix),l
   6159 DD 74 EF      [19] 4539 	ld	-17 (ix),h
   615C 3E 25         [ 7] 4540 	ld	a,#<(_scene)
   615E DD 86 EE      [19] 4541 	add	a, -18 (ix)
   6161 DD 77 EE      [19] 4542 	ld	-18 (ix),a
   6164 3E 71         [ 7] 4543 	ld	a,#>(_scene)
   6166 DD 8E EF      [19] 4544 	adc	a, -17 (ix)
   6169 DD 77 EF      [19] 4545 	ld	-17 (ix),a
   616C DD 7E EA      [19] 4546 	ld	a,-22 (ix)
   616F DD 77 F0      [19] 4547 	ld	-16 (ix),a
   6172 DD 7E EB      [19] 4548 	ld	a,-21 (ix)
   6175 DD 77 F1      [19] 4549 	ld	-15 (ix),a
   6178 DD 7E F5      [19] 4550 	ld	a,-11 (ix)
   617B B7            [ 4] 4551 	or	a, a
   617C 28 0C         [12] 4552 	jr	Z,00143$
   617E DD 7E E8      [19] 4553 	ld	a,-24 (ix)
   6181 DD 77 F0      [19] 4554 	ld	-16 (ix),a
   6184 DD 7E E9      [19] 4555 	ld	a,-23 (ix)
   6187 DD 77 F1      [19] 4556 	ld	-15 (ix),a
   618A                    4557 00143$:
   618A DD CB F1 2E   [23] 4558 	sra	-15 (ix)
   618E DD CB F0 1E   [23] 4559 	rr	-16 (ix)
   6192 DD CB F1 2E   [23] 4560 	sra	-15 (ix)
   6196 DD CB F0 1E   [23] 4561 	rr	-16 (ix)
   619A DD 7E EE      [19] 4562 	ld	a,-18 (ix)
   619D DD 86 F0      [19] 4563 	add	a, -16 (ix)
   61A0 DD 77 EE      [19] 4564 	ld	-18 (ix),a
   61A3 DD 7E EF      [19] 4565 	ld	a,-17 (ix)
   61A6 DD 8E F1      [19] 4566 	adc	a, -15 (ix)
   61A9 DD 77 EF      [19] 4567 	ld	-17 (ix),a
   61AC DD 6E EE      [19] 4568 	ld	l,-18 (ix)
   61AF DD 66 EF      [19] 4569 	ld	h,-17 (ix)
   61B2 7E            [ 7] 4570 	ld	a,(hl)
   61B3 3D            [ 4] 4571 	dec	a
   61B4 28 0B         [12] 4572 	jr	Z,00112$
                           4573 ;src/main.c:266: enemy.x-=1;
   61B6 DD 56 E3      [19] 4574 	ld	d,-29 (ix)
   61B9 15            [ 4] 4575 	dec	d
   61BA 21 32 72      [10] 4576 	ld	hl,#_enemy
   61BD 72            [ 7] 4577 	ld	(hl),d
   61BE C3 FB 65      [10] 4578 	jp	00139$
   61C1                    4579 00112$:
                           4580 ;src/main.c:267: }else if(auxY < enemy.y){
   61C1 DD 7E FF      [19] 4581 	ld	a,-1 (ix)
   61C4 B7            [ 4] 4582 	or	a, a
   61C5 CA 4F 62      [10] 4583 	jp	Z,00109$
                           4584 ;src/main.c:268: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   61C8 DD 7E FB      [19] 4585 	ld	a,-5 (ix)
   61CB DD 77 EE      [19] 4586 	ld	-18 (ix),a
   61CE DD 7E FC      [19] 4587 	ld	a,-4 (ix)
   61D1 DD 77 EF      [19] 4588 	ld	-17 (ix),a
   61D4 DD 7E FE      [19] 4589 	ld	a,-2 (ix)
   61D7 B7            [ 4] 4590 	or	a, a
   61D8 28 0C         [12] 4591 	jr	Z,00144$
   61DA DD 7E F8      [19] 4592 	ld	a,-8 (ix)
   61DD DD 77 EE      [19] 4593 	ld	-18 (ix),a
   61E0 DD 7E F9      [19] 4594 	ld	a,-7 (ix)
   61E3 DD 77 EF      [19] 4595 	ld	-17 (ix),a
   61E6                    4596 00144$:
   61E6 DD CB EF 2E   [23] 4597 	sra	-17 (ix)
   61EA DD CB EE 1E   [23] 4598 	rr	-18 (ix)
   61EE DD CB EF 2E   [23] 4599 	sra	-17 (ix)
   61F2 DD CB EE 1E   [23] 4600 	rr	-18 (ix)
   61F6 DD CB EF 2E   [23] 4601 	sra	-17 (ix)
   61FA DD CB EE 1E   [23] 4602 	rr	-18 (ix)
   61FE DD CB EF 2E   [23] 4603 	sra	-17 (ix)
   6202 DD CB EE 1E   [23] 4604 	rr	-18 (ix)
   6206 DD 4E EE      [19] 4605 	ld	c,-18 (ix)
   6209 DD 46 EF      [19] 4606 	ld	b,-17 (ix)
   620C 69            [ 4] 4607 	ld	l, c
   620D 60            [ 4] 4608 	ld	h, b
   620E 29            [11] 4609 	add	hl, hl
   620F 29            [11] 4610 	add	hl, hl
   6210 09            [11] 4611 	add	hl, bc
   6211 29            [11] 4612 	add	hl, hl
   6212 29            [11] 4613 	add	hl, hl
   6213 DD 75 EE      [19] 4614 	ld	-18 (ix),l
   6216 DD 74 EF      [19] 4615 	ld	-17 (ix),h
   6219 3E 25         [ 7] 4616 	ld	a,#<(_scene)
   621B DD 86 EE      [19] 4617 	add	a, -18 (ix)
   621E DD 77 EE      [19] 4618 	ld	-18 (ix),a
   6221 3E 71         [ 7] 4619 	ld	a,#>(_scene)
   6223 DD 8E EF      [19] 4620 	adc	a, -17 (ix)
   6226 DD 77 EF      [19] 4621 	ld	-17 (ix),a
   6229 DD 7E FD      [19] 4622 	ld	a,-3 (ix)
   622C DD 86 EE      [19] 4623 	add	a, -18 (ix)
   622F DD 77 EE      [19] 4624 	ld	-18 (ix),a
   6232 3E 00         [ 7] 4625 	ld	a,#0x00
   6234 DD 8E EF      [19] 4626 	adc	a, -17 (ix)
   6237 DD 77 EF      [19] 4627 	ld	-17 (ix),a
   623A DD 6E EE      [19] 4628 	ld	l,-18 (ix)
   623D DD 66 EF      [19] 4629 	ld	h,-17 (ix)
   6240 7E            [ 7] 4630 	ld	a,(hl)
   6241 3D            [ 4] 4631 	dec	a
   6242 CA FB 65      [10] 4632 	jp	Z,00139$
                           4633 ;src/main.c:269: enemy.y-=1;
   6245 21 33 72      [10] 4634 	ld	hl,#(_enemy + 0x0001)
   6248 DD 7E ED      [19] 4635 	ld	a,-19 (ix)
   624B 77            [ 7] 4636 	ld	(hl),a
   624C C3 FB 65      [10] 4637 	jp	00139$
   624F                    4638 00109$:
                           4639 ;src/main.c:271: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   624F DD 7E E6      [19] 4640 	ld	a,-26 (ix)
   6252 DD 77 EE      [19] 4641 	ld	-18 (ix),a
   6255 DD 7E E7      [19] 4642 	ld	a,-25 (ix)
   6258 DD 77 EF      [19] 4643 	ld	-17 (ix),a
   625B DD 7E F4      [19] 4644 	ld	a,-12 (ix)
   625E B7            [ 4] 4645 	or	a, a
   625F 28 0C         [12] 4646 	jr	Z,00145$
   6261 DD 7E F2      [19] 4647 	ld	a,-14 (ix)
   6264 DD 77 EE      [19] 4648 	ld	-18 (ix),a
   6267 DD 7E F3      [19] 4649 	ld	a,-13 (ix)
   626A DD 77 EF      [19] 4650 	ld	-17 (ix),a
   626D                    4651 00145$:
   626D DD CB EF 2E   [23] 4652 	sra	-17 (ix)
   6271 DD CB EE 1E   [23] 4653 	rr	-18 (ix)
   6275 DD CB EF 2E   [23] 4654 	sra	-17 (ix)
   6279 DD CB EE 1E   [23] 4655 	rr	-18 (ix)
   627D DD CB EF 2E   [23] 4656 	sra	-17 (ix)
   6281 DD CB EE 1E   [23] 4657 	rr	-18 (ix)
   6285 DD CB EF 2E   [23] 4658 	sra	-17 (ix)
   6289 DD CB EE 1E   [23] 4659 	rr	-18 (ix)
   628D DD 4E EE      [19] 4660 	ld	c,-18 (ix)
   6290 DD 46 EF      [19] 4661 	ld	b,-17 (ix)
   6293 69            [ 4] 4662 	ld	l, c
   6294 60            [ 4] 4663 	ld	h, b
   6295 29            [11] 4664 	add	hl, hl
   6296 29            [11] 4665 	add	hl, hl
   6297 09            [11] 4666 	add	hl, bc
   6298 29            [11] 4667 	add	hl, hl
   6299 29            [11] 4668 	add	hl, hl
   629A DD 75 EE      [19] 4669 	ld	-18 (ix),l
   629D DD 74 EF      [19] 4670 	ld	-17 (ix),h
   62A0 3E 25         [ 7] 4671 	ld	a,#<(_scene)
   62A2 DD 86 EE      [19] 4672 	add	a, -18 (ix)
   62A5 DD 77 EE      [19] 4673 	ld	-18 (ix),a
   62A8 3E 71         [ 7] 4674 	ld	a,#>(_scene)
   62AA DD 8E EF      [19] 4675 	adc	a, -17 (ix)
   62AD DD 77 EF      [19] 4676 	ld	-17 (ix),a
   62B0 DD 7E FD      [19] 4677 	ld	a,-3 (ix)
   62B3 DD 86 EE      [19] 4678 	add	a, -18 (ix)
   62B6 DD 77 EE      [19] 4679 	ld	-18 (ix),a
   62B9 3E 00         [ 7] 4680 	ld	a,#0x00
   62BB DD 8E EF      [19] 4681 	adc	a, -17 (ix)
   62BE DD 77 EF      [19] 4682 	ld	-17 (ix),a
   62C1 DD 6E EE      [19] 4683 	ld	l,-18 (ix)
   62C4 DD 66 EF      [19] 4684 	ld	h,-17 (ix)
   62C7 7E            [ 7] 4685 	ld	a,(hl)
   62C8 3D            [ 4] 4686 	dec	a
   62C9 CA FB 65      [10] 4687 	jp	Z,00139$
                           4688 ;src/main.c:272: enemy.y+=1;
   62CC 21 33 72      [10] 4689 	ld	hl,#(_enemy + 0x0001)
   62CF DD 7E EC      [19] 4690 	ld	a,-20 (ix)
   62D2 77            [ 7] 4691 	ld	(hl),a
   62D3 C3 FB 65      [10] 4692 	jp	00139$
   62D6                    4693 00137$:
                           4694 ;src/main.c:274: }else if(auxX > enemy.x){
   62D6 DD 7E E3      [19] 4695 	ld	a,-29 (ix)
   62D9 DD 96 E2      [19] 4696 	sub	a, -30 (ix)
   62DC D2 E4 64      [10] 4697 	jp	NC,00134$
                           4698 ;src/main.c:276: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
   62DF 3E 25         [ 7] 4699 	ld	a,#<(_scene)
   62E1 DD 86 F6      [19] 4700 	add	a, -10 (ix)
   62E4 DD 77 EE      [19] 4701 	ld	-18 (ix),a
   62E7 3E 71         [ 7] 4702 	ld	a,#>(_scene)
   62E9 DD 8E F7      [19] 4703 	adc	a, -9 (ix)
   62EC DD 77 EF      [19] 4704 	ld	-17 (ix),a
   62EF DD 7E E4      [19] 4705 	ld	a,-28 (ix)
   62F2 C6 04         [ 7] 4706 	add	a, #0x04
   62F4 DD 77 F0      [19] 4707 	ld	-16 (ix),a
   62F7 DD 7E E5      [19] 4708 	ld	a,-27 (ix)
   62FA CE 00         [ 7] 4709 	adc	a, #0x00
   62FC DD 77 F1      [19] 4710 	ld	-15 (ix),a
   62FF DD 7E F0      [19] 4711 	ld	a,-16 (ix)
   6302 DD 77 F6      [19] 4712 	ld	-10 (ix),a
   6305 DD 7E F1      [19] 4713 	ld	a,-15 (ix)
   6308 DD 77 F7      [19] 4714 	ld	-9 (ix),a
   630B DD 7E F1      [19] 4715 	ld	a,-15 (ix)
   630E 07            [ 4] 4716 	rlca
   630F E6 01         [ 7] 4717 	and	a,#0x01
   6311 DD 77 FA      [19] 4718 	ld	-6 (ix),a
   6314 DD 7E E4      [19] 4719 	ld	a,-28 (ix)
   6317 C6 07         [ 7] 4720 	add	a, #0x07
   6319 DD 77 E4      [19] 4721 	ld	-28 (ix),a
   631C DD 7E E5      [19] 4722 	ld	a,-27 (ix)
   631F CE 00         [ 7] 4723 	adc	a, #0x00
   6321 DD 77 E5      [19] 4724 	ld	-27 (ix),a
   6324 DD 7E FA      [19] 4725 	ld	a,-6 (ix)
   6327 B7            [ 4] 4726 	or	a, a
   6328 28 0C         [12] 4727 	jr	Z,00146$
   632A DD 7E E4      [19] 4728 	ld	a,-28 (ix)
   632D DD 77 F6      [19] 4729 	ld	-10 (ix),a
   6330 DD 7E E5      [19] 4730 	ld	a,-27 (ix)
   6333 DD 77 F7      [19] 4731 	ld	-9 (ix),a
   6336                    4732 00146$:
   6336 DD 6E F6      [19] 4733 	ld	l,-10 (ix)
   6339 DD 66 F7      [19] 4734 	ld	h,-9 (ix)
   633C CB 2C         [ 8] 4735 	sra	h
   633E CB 1D         [ 8] 4736 	rr	l
   6340 CB 2C         [ 8] 4737 	sra	h
   6342 CB 1D         [ 8] 4738 	rr	l
   6344 DD 5E EE      [19] 4739 	ld	e,-18 (ix)
   6347 DD 56 EF      [19] 4740 	ld	d,-17 (ix)
   634A 19            [11] 4741 	add	hl,de
   634B 7E            [ 7] 4742 	ld	a,(hl)
   634C 3D            [ 4] 4743 	dec	a
   634D CA FC 63      [10] 4744 	jp	Z,00123$
                           4745 ;src/main.c:277: && scene[(enemy.y+tileheight)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   6350 DD 7E E6      [19] 4746 	ld	a,-26 (ix)
   6353 DD 77 F6      [19] 4747 	ld	-10 (ix),a
   6356 DD 7E E7      [19] 4748 	ld	a,-25 (ix)
   6359 DD 77 F7      [19] 4749 	ld	-9 (ix),a
   635C DD 7E F4      [19] 4750 	ld	a,-12 (ix)
   635F B7            [ 4] 4751 	or	a, a
   6360 28 0C         [12] 4752 	jr	Z,00147$
   6362 DD 7E F2      [19] 4753 	ld	a,-14 (ix)
   6365 DD 77 F6      [19] 4754 	ld	-10 (ix),a
   6368 DD 7E F3      [19] 4755 	ld	a,-13 (ix)
   636B DD 77 F7      [19] 4756 	ld	-9 (ix),a
   636E                    4757 00147$:
   636E DD CB F7 2E   [23] 4758 	sra	-9 (ix)
   6372 DD CB F6 1E   [23] 4759 	rr	-10 (ix)
   6376 DD CB F7 2E   [23] 4760 	sra	-9 (ix)
   637A DD CB F6 1E   [23] 4761 	rr	-10 (ix)
   637E DD CB F7 2E   [23] 4762 	sra	-9 (ix)
   6382 DD CB F6 1E   [23] 4763 	rr	-10 (ix)
   6386 DD CB F7 2E   [23] 4764 	sra	-9 (ix)
   638A DD CB F6 1E   [23] 4765 	rr	-10 (ix)
   638E DD 4E F6      [19] 4766 	ld	c,-10 (ix)
   6391 DD 46 F7      [19] 4767 	ld	b,-9 (ix)
   6394 69            [ 4] 4768 	ld	l, c
   6395 60            [ 4] 4769 	ld	h, b
   6396 29            [11] 4770 	add	hl, hl
   6397 29            [11] 4771 	add	hl, hl
   6398 09            [11] 4772 	add	hl, bc
   6399 29            [11] 4773 	add	hl, hl
   639A 29            [11] 4774 	add	hl, hl
   639B DD 75 F6      [19] 4775 	ld	-10 (ix),l
   639E DD 74 F7      [19] 4776 	ld	-9 (ix),h
   63A1 3E 25         [ 7] 4777 	ld	a,#<(_scene)
   63A3 DD 86 F6      [19] 4778 	add	a, -10 (ix)
   63A6 DD 77 F6      [19] 4779 	ld	-10 (ix),a
   63A9 3E 71         [ 7] 4780 	ld	a,#>(_scene)
   63AB DD 8E F7      [19] 4781 	adc	a, -9 (ix)
   63AE DD 77 F7      [19] 4782 	ld	-9 (ix),a
   63B1 DD 7E FA      [19] 4783 	ld	a,-6 (ix)
   63B4 B7            [ 4] 4784 	or	a, a
   63B5 28 0C         [12] 4785 	jr	Z,00148$
   63B7 DD 7E E4      [19] 4786 	ld	a,-28 (ix)
   63BA DD 77 F0      [19] 4787 	ld	-16 (ix),a
   63BD DD 7E E5      [19] 4788 	ld	a,-27 (ix)
   63C0 DD 77 F1      [19] 4789 	ld	-15 (ix),a
   63C3                    4790 00148$:
   63C3 DD CB F1 2E   [23] 4791 	sra	-15 (ix)
   63C7 DD CB F0 1E   [23] 4792 	rr	-16 (ix)
   63CB DD CB F1 2E   [23] 4793 	sra	-15 (ix)
   63CF DD CB F0 1E   [23] 4794 	rr	-16 (ix)
   63D3 DD 7E F6      [19] 4795 	ld	a,-10 (ix)
   63D6 DD 86 F0      [19] 4796 	add	a, -16 (ix)
   63D9 DD 77 F0      [19] 4797 	ld	-16 (ix),a
   63DC DD 7E F7      [19] 4798 	ld	a,-9 (ix)
   63DF DD 8E F1      [19] 4799 	adc	a, -15 (ix)
   63E2 DD 77 F1      [19] 4800 	ld	-15 (ix),a
   63E5 DD 6E F0      [19] 4801 	ld	l,-16 (ix)
   63E8 DD 66 F1      [19] 4802 	ld	h,-15 (ix)
   63EB 7E            [ 7] 4803 	ld	a,(hl)
   63EC DD 77 FA      [19] 4804 	ld	-6 (ix), a
   63EF 3D            [ 4] 4805 	dec	a
   63F0 28 0A         [12] 4806 	jr	Z,00123$
                           4807 ;src/main.c:278: enemy.x+=1;
   63F2 DD 7E E3      [19] 4808 	ld	a,-29 (ix)
   63F5 3C            [ 4] 4809 	inc	a
   63F6 32 32 72      [13] 4810 	ld	(#_enemy),a
   63F9 C3 FB 65      [10] 4811 	jp	00139$
   63FC                    4812 00123$:
                           4813 ;src/main.c:279: }else if(auxY < enemy.y){
   63FC DD 7E FF      [19] 4814 	ld	a,-1 (ix)
   63FF B7            [ 4] 4815 	or	a, a
   6400 28 58         [12] 4816 	jr	Z,00120$
                           4817 ;src/main.c:280: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   6402 DD 7E EA      [19] 4818 	ld	a,-22 (ix)
   6405 DD 77 F0      [19] 4819 	ld	-16 (ix),a
   6408 DD 7E EB      [19] 4820 	ld	a,-21 (ix)
   640B DD 77 F1      [19] 4821 	ld	-15 (ix),a
   640E DD 7E F5      [19] 4822 	ld	a,-11 (ix)
   6411 B7            [ 4] 4823 	or	a, a
   6412 28 0C         [12] 4824 	jr	Z,00149$
   6414 DD 7E E8      [19] 4825 	ld	a,-24 (ix)
   6417 DD 77 F0      [19] 4826 	ld	-16 (ix),a
   641A DD 7E E9      [19] 4827 	ld	a,-23 (ix)
   641D DD 77 F1      [19] 4828 	ld	-15 (ix),a
   6420                    4829 00149$:
   6420 DD CB F1 2E   [23] 4830 	sra	-15 (ix)
   6424 DD CB F0 1E   [23] 4831 	rr	-16 (ix)
   6428 DD CB F1 2E   [23] 4832 	sra	-15 (ix)
   642C DD CB F0 1E   [23] 4833 	rr	-16 (ix)
   6430 DD 7E F0      [19] 4834 	ld	a,-16 (ix)
   6433 DD 86 EE      [19] 4835 	add	a, -18 (ix)
   6436 DD 77 EE      [19] 4836 	ld	-18 (ix),a
   6439 DD 7E F1      [19] 4837 	ld	a,-15 (ix)
   643C DD 8E EF      [19] 4838 	adc	a, -17 (ix)
   643F DD 77 EF      [19] 4839 	ld	-17 (ix),a
   6442 DD 6E EE      [19] 4840 	ld	l,-18 (ix)
   6445 DD 66 EF      [19] 4841 	ld	h,-17 (ix)
   6448 7E            [ 7] 4842 	ld	a,(hl)
   6449 DD 77 FA      [19] 4843 	ld	-6 (ix), a
   644C 3D            [ 4] 4844 	dec	a
   644D CA FB 65      [10] 4845 	jp	Z,00139$
                           4846 ;src/main.c:281: enemy.y-=1;
   6450 21 33 72      [10] 4847 	ld	hl,#(_enemy + 0x0001)
   6453 DD 7E ED      [19] 4848 	ld	a,-19 (ix)
   6456 77            [ 7] 4849 	ld	(hl),a
   6457 C3 FB 65      [10] 4850 	jp	00139$
   645A                    4851 00120$:
                           4852 ;src/main.c:283: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   645A DD 7E E6      [19] 4853 	ld	a,-26 (ix)
   645D DD 77 EE      [19] 4854 	ld	-18 (ix),a
   6460 DD 7E E7      [19] 4855 	ld	a,-25 (ix)
   6463 DD 77 EF      [19] 4856 	ld	-17 (ix),a
   6466 DD 7E F4      [19] 4857 	ld	a,-12 (ix)
   6469 B7            [ 4] 4858 	or	a, a
   646A 28 0C         [12] 4859 	jr	Z,00150$
   646C DD 7E F2      [19] 4860 	ld	a,-14 (ix)
   646F DD 77 EE      [19] 4861 	ld	-18 (ix),a
   6472 DD 7E F3      [19] 4862 	ld	a,-13 (ix)
   6475 DD 77 EF      [19] 4863 	ld	-17 (ix),a
   6478                    4864 00150$:
   6478 DD CB EF 2E   [23] 4865 	sra	-17 (ix)
   647C DD CB EE 1E   [23] 4866 	rr	-18 (ix)
   6480 DD CB EF 2E   [23] 4867 	sra	-17 (ix)
   6484 DD CB EE 1E   [23] 4868 	rr	-18 (ix)
   6488 DD CB EF 2E   [23] 4869 	sra	-17 (ix)
   648C DD CB EE 1E   [23] 4870 	rr	-18 (ix)
   6490 DD CB EF 2E   [23] 4871 	sra	-17 (ix)
   6494 DD CB EE 1E   [23] 4872 	rr	-18 (ix)
   6498 DD 4E EE      [19] 4873 	ld	c,-18 (ix)
   649B DD 46 EF      [19] 4874 	ld	b,-17 (ix)
   649E 69            [ 4] 4875 	ld	l, c
   649F 60            [ 4] 4876 	ld	h, b
   64A0 29            [11] 4877 	add	hl, hl
   64A1 29            [11] 4878 	add	hl, hl
   64A2 09            [11] 4879 	add	hl, bc
   64A3 29            [11] 4880 	add	hl, hl
   64A4 29            [11] 4881 	add	hl, hl
   64A5 DD 75 EE      [19] 4882 	ld	-18 (ix),l
   64A8 DD 74 EF      [19] 4883 	ld	-17 (ix),h
   64AB 3E 25         [ 7] 4884 	ld	a,#<(_scene)
   64AD DD 86 EE      [19] 4885 	add	a, -18 (ix)
   64B0 DD 77 EE      [19] 4886 	ld	-18 (ix),a
   64B3 3E 71         [ 7] 4887 	ld	a,#>(_scene)
   64B5 DD 8E EF      [19] 4888 	adc	a, -17 (ix)
   64B8 DD 77 EF      [19] 4889 	ld	-17 (ix),a
   64BB DD 7E EE      [19] 4890 	ld	a,-18 (ix)
   64BE DD 86 FD      [19] 4891 	add	a, -3 (ix)
   64C1 DD 77 EE      [19] 4892 	ld	-18 (ix),a
   64C4 DD 7E EF      [19] 4893 	ld	a,-17 (ix)
   64C7 CE 00         [ 7] 4894 	adc	a, #0x00
   64C9 DD 77 EF      [19] 4895 	ld	-17 (ix),a
   64CC DD 6E EE      [19] 4896 	ld	l,-18 (ix)
   64CF DD 66 EF      [19] 4897 	ld	h,-17 (ix)
   64D2 7E            [ 7] 4898 	ld	a,(hl)
   64D3 DD 77 FA      [19] 4899 	ld	-6 (ix), a
   64D6 3D            [ 4] 4900 	dec	a
   64D7 CA FB 65      [10] 4901 	jp	Z,00139$
                           4902 ;src/main.c:284: enemy.y+=1;
   64DA 21 33 72      [10] 4903 	ld	hl,#(_enemy + 0x0001)
   64DD DD 7E EC      [19] 4904 	ld	a,-20 (ix)
   64E0 77            [ 7] 4905 	ld	(hl),a
   64E1 C3 FB 65      [10] 4906 	jp	00139$
   64E4                    4907 00134$:
                           4908 ;src/main.c:288: if(auxY < enemy.y){
   64E4 DD 7E FF      [19] 4909 	ld	a,-1 (ix)
   64E7 B7            [ 4] 4910 	or	a, a
   64E8 CA 75 65      [10] 4911 	jp	Z,00131$
                           4912 ;src/main.c:289: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   64EB DD 7E FB      [19] 4913 	ld	a,-5 (ix)
   64EE DD 77 EE      [19] 4914 	ld	-18 (ix),a
   64F1 DD 7E FC      [19] 4915 	ld	a,-4 (ix)
   64F4 DD 77 EF      [19] 4916 	ld	-17 (ix),a
   64F7 DD 7E FE      [19] 4917 	ld	a,-2 (ix)
   64FA B7            [ 4] 4918 	or	a, a
   64FB 28 0C         [12] 4919 	jr	Z,00151$
   64FD DD 7E F8      [19] 4920 	ld	a,-8 (ix)
   6500 DD 77 EE      [19] 4921 	ld	-18 (ix),a
   6503 DD 7E F9      [19] 4922 	ld	a,-7 (ix)
   6506 DD 77 EF      [19] 4923 	ld	-17 (ix),a
   6509                    4924 00151$:
   6509 DD CB EF 2E   [23] 4925 	sra	-17 (ix)
   650D DD CB EE 1E   [23] 4926 	rr	-18 (ix)
   6511 DD CB EF 2E   [23] 4927 	sra	-17 (ix)
   6515 DD CB EE 1E   [23] 4928 	rr	-18 (ix)
   6519 DD CB EF 2E   [23] 4929 	sra	-17 (ix)
   651D DD CB EE 1E   [23] 4930 	rr	-18 (ix)
   6521 DD CB EF 2E   [23] 4931 	sra	-17 (ix)
   6525 DD CB EE 1E   [23] 4932 	rr	-18 (ix)
   6529 DD 4E EE      [19] 4933 	ld	c,-18 (ix)
   652C DD 46 EF      [19] 4934 	ld	b,-17 (ix)
   652F 69            [ 4] 4935 	ld	l, c
   6530 60            [ 4] 4936 	ld	h, b
   6531 29            [11] 4937 	add	hl, hl
   6532 29            [11] 4938 	add	hl, hl
   6533 09            [11] 4939 	add	hl, bc
   6534 29            [11] 4940 	add	hl, hl
   6535 29            [11] 4941 	add	hl, hl
   6536 DD 75 EE      [19] 4942 	ld	-18 (ix),l
   6539 DD 74 EF      [19] 4943 	ld	-17 (ix),h
   653C 3E 25         [ 7] 4944 	ld	a,#<(_scene)
   653E DD 86 EE      [19] 4945 	add	a, -18 (ix)
   6541 DD 77 EE      [19] 4946 	ld	-18 (ix),a
   6544 3E 71         [ 7] 4947 	ld	a,#>(_scene)
   6546 DD 8E EF      [19] 4948 	adc	a, -17 (ix)
   6549 DD 77 EF      [19] 4949 	ld	-17 (ix),a
   654C DD 7E EE      [19] 4950 	ld	a,-18 (ix)
   654F DD 86 FD      [19] 4951 	add	a, -3 (ix)
   6552 DD 77 EE      [19] 4952 	ld	-18 (ix),a
   6555 DD 7E EF      [19] 4953 	ld	a,-17 (ix)
   6558 CE 00         [ 7] 4954 	adc	a, #0x00
   655A DD 77 EF      [19] 4955 	ld	-17 (ix),a
   655D DD 6E EE      [19] 4956 	ld	l,-18 (ix)
   6560 DD 66 EF      [19] 4957 	ld	h,-17 (ix)
   6563 7E            [ 7] 4958 	ld	a,(hl)
   6564 DD 77 FA      [19] 4959 	ld	-6 (ix), a
   6567 3D            [ 4] 4960 	dec	a
   6568 CA FB 65      [10] 4961 	jp	Z,00139$
                           4962 ;src/main.c:290: enemy.y-=1;
   656B 21 33 72      [10] 4963 	ld	hl,#(_enemy + 0x0001)
   656E DD 7E ED      [19] 4964 	ld	a,-19 (ix)
   6571 77            [ 7] 4965 	ld	(hl),a
   6572 C3 FB 65      [10] 4966 	jp	00139$
   6575                    4967 00131$:
                           4968 ;src/main.c:292: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   6575 DD 7E E6      [19] 4969 	ld	a,-26 (ix)
   6578 DD 77 EE      [19] 4970 	ld	-18 (ix),a
   657B DD 7E E7      [19] 4971 	ld	a,-25 (ix)
   657E DD 77 EF      [19] 4972 	ld	-17 (ix),a
   6581 DD 7E F4      [19] 4973 	ld	a,-12 (ix)
   6584 B7            [ 4] 4974 	or	a, a
   6585 28 0C         [12] 4975 	jr	Z,00152$
   6587 DD 7E F2      [19] 4976 	ld	a,-14 (ix)
   658A DD 77 EE      [19] 4977 	ld	-18 (ix),a
   658D DD 7E F3      [19] 4978 	ld	a,-13 (ix)
   6590 DD 77 EF      [19] 4979 	ld	-17 (ix),a
   6593                    4980 00152$:
   6593 DD CB EF 2E   [23] 4981 	sra	-17 (ix)
   6597 DD CB EE 1E   [23] 4982 	rr	-18 (ix)
   659B DD CB EF 2E   [23] 4983 	sra	-17 (ix)
   659F DD CB EE 1E   [23] 4984 	rr	-18 (ix)
   65A3 DD CB EF 2E   [23] 4985 	sra	-17 (ix)
   65A7 DD CB EE 1E   [23] 4986 	rr	-18 (ix)
   65AB DD CB EF 2E   [23] 4987 	sra	-17 (ix)
   65AF DD CB EE 1E   [23] 4988 	rr	-18 (ix)
   65B3 DD 4E EE      [19] 4989 	ld	c,-18 (ix)
   65B6 DD 46 EF      [19] 4990 	ld	b,-17 (ix)
   65B9 69            [ 4] 4991 	ld	l, c
   65BA 60            [ 4] 4992 	ld	h, b
   65BB 29            [11] 4993 	add	hl, hl
   65BC 29            [11] 4994 	add	hl, hl
   65BD 09            [11] 4995 	add	hl, bc
   65BE 29            [11] 4996 	add	hl, hl
   65BF 29            [11] 4997 	add	hl, hl
   65C0 DD 75 EE      [19] 4998 	ld	-18 (ix),l
   65C3 DD 74 EF      [19] 4999 	ld	-17 (ix),h
   65C6 3E 25         [ 7] 5000 	ld	a,#<(_scene)
   65C8 DD 86 EE      [19] 5001 	add	a, -18 (ix)
   65CB DD 77 EE      [19] 5002 	ld	-18 (ix),a
   65CE 3E 71         [ 7] 5003 	ld	a,#>(_scene)
   65D0 DD 8E EF      [19] 5004 	adc	a, -17 (ix)
   65D3 DD 77 EF      [19] 5005 	ld	-17 (ix),a
   65D6 DD 7E FD      [19] 5006 	ld	a,-3 (ix)
   65D9 DD 86 EE      [19] 5007 	add	a, -18 (ix)
   65DC DD 77 EE      [19] 5008 	ld	-18 (ix),a
   65DF 3E 00         [ 7] 5009 	ld	a,#0x00
   65E1 DD 8E EF      [19] 5010 	adc	a, -17 (ix)
   65E4 DD 77 EF      [19] 5011 	ld	-17 (ix),a
   65E7 DD 6E EE      [19] 5012 	ld	l,-18 (ix)
   65EA DD 66 EF      [19] 5013 	ld	h,-17 (ix)
   65ED 7E            [ 7] 5014 	ld	a,(hl)
   65EE DD 77 FA      [19] 5015 	ld	-6 (ix), a
   65F1 3D            [ 4] 5016 	dec	a
   65F2 28 07         [12] 5017 	jr	Z,00139$
                           5018 ;src/main.c:293: enemy.y+=1;
   65F4 21 33 72      [10] 5019 	ld	hl,#(_enemy + 0x0001)
   65F7 DD 7E EC      [19] 5020 	ld	a,-20 (ix)
   65FA 77            [ 7] 5021 	ld	(hl),a
   65FB                    5022 00139$:
   65FB DD F9         [10] 5023 	ld	sp, ix
   65FD DD E1         [14] 5024 	pop	ix
   65FF C9            [10] 5025 	ret
                           5026 ;src/main.c:298: void patrol(){
                           5027 ;	---------------------------------
                           5028 ; Function patrol
                           5029 ; ---------------------------------
   6600                    5030 _patrol::
   6600 DD E5         [15] 5031 	push	ix
   6602 DD 21 00 00   [14] 5032 	ld	ix,#0
   6606 DD 39         [15] 5033 	add	ix,sp
   6608 21 F4 FF      [10] 5034 	ld	hl,#-12
   660B 39            [11] 5035 	add	hl,sp
   660C F9            [ 6] 5036 	ld	sp,hl
                           5037 ;src/main.c:301: movement(enemy.dir);
   660D 3A 3B 72      [13] 5038 	ld	a, (#(_enemy + 0x0009) + 0)
   6610 F5            [11] 5039 	push	af
   6611 33            [ 6] 5040 	inc	sp
   6612 CD 18 50      [17] 5041 	call	_movement
   6615 33            [ 6] 5042 	inc	sp
                           5043 ;src/main.c:303: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   6616 3A 33 72      [13] 5044 	ld	a,(#_enemy + 1)
   6619 DD 77 F6      [19] 5045 	ld	-10 (ix), a
   661C 07            [ 4] 5046 	rlca
   661D 07            [ 4] 5047 	rlca
   661E 07            [ 4] 5048 	rlca
   661F 07            [ 4] 5049 	rlca
   6620 E6 0F         [ 7] 5050 	and	a,#0x0F
   6622 4F            [ 4] 5051 	ld	c,a
   6623 06 00         [ 7] 5052 	ld	b,#0x00
   6625 69            [ 4] 5053 	ld	l, c
   6626 60            [ 4] 5054 	ld	h, b
   6627 29            [11] 5055 	add	hl, hl
   6628 29            [11] 5056 	add	hl, hl
   6629 09            [11] 5057 	add	hl, bc
   662A 29            [11] 5058 	add	hl, hl
   662B 29            [11] 5059 	add	hl, hl
   662C 3E 25         [ 7] 5060 	ld	a,#<(_scene)
   662E 85            [ 4] 5061 	add	a, l
   662F DD 77 F4      [19] 5062 	ld	-12 (ix),a
   6632 3E 71         [ 7] 5063 	ld	a,#>(_scene)
   6634 8C            [ 4] 5064 	adc	a, h
   6635 DD 77 F5      [19] 5065 	ld	-11 (ix),a
   6638 3A 32 72      [13] 5066 	ld	a,(#_enemy + 0)
   663B DD 77 FC      [19] 5067 	ld	-4 (ix), a
   663E 0F            [ 4] 5068 	rrca
   663F 0F            [ 4] 5069 	rrca
   6640 E6 3F         [ 7] 5070 	and	a,#0x3F
   6642 DD 77 F9      [19] 5071 	ld	-7 (ix),a
   6645 DD 7E F4      [19] 5072 	ld	a,-12 (ix)
   6648 DD 86 F9      [19] 5073 	add	a, -7 (ix)
   664B 5F            [ 4] 5074 	ld	e,a
   664C DD 7E F5      [19] 5075 	ld	a,-11 (ix)
   664F CE 00         [ 7] 5076 	adc	a, #0x00
   6651 57            [ 4] 5077 	ld	d,a
   6652 3A 3D 72      [13] 5078 	ld	a,(#_enemy + 11)
   6655 DD 77 FD      [19] 5079 	ld	-3 (ix),a
   6658 1A            [ 7] 5080 	ld	a,(de)
   6659 57            [ 4] 5081 	ld	d,a
   665A DD 7E FD      [19] 5082 	ld	a,-3 (ix)
   665D 92            [ 4] 5083 	sub	a, d
   665E C2 5A 67      [10] 5084 	jp	NZ,00106$
                           5085 ;src/main.c:304: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   6661 DD 5E FC      [19] 5086 	ld	e,-4 (ix)
   6664 16 00         [ 7] 5087 	ld	d,#0x00
   6666 21 03 00      [10] 5088 	ld	hl,#0x0003
   6669 19            [11] 5089 	add	hl,de
   666A DD 75 F7      [19] 5090 	ld	-9 (ix),l
   666D DD 74 F8      [19] 5091 	ld	-8 (ix),h
   6670 DD 7E F7      [19] 5092 	ld	a,-9 (ix)
   6673 DD 77 FE      [19] 5093 	ld	-2 (ix),a
   6676 DD 7E F8      [19] 5094 	ld	a,-8 (ix)
   6679 DD 77 FF      [19] 5095 	ld	-1 (ix),a
   667C DD 7E F8      [19] 5096 	ld	a,-8 (ix)
   667F 07            [ 4] 5097 	rlca
   6680 E6 01         [ 7] 5098 	and	a,#0x01
   6682 DD 77 FC      [19] 5099 	ld	-4 (ix),a
   6685 21 06 00      [10] 5100 	ld	hl,#0x0006
   6688 19            [11] 5101 	add	hl,de
   6689 DD 75 FA      [19] 5102 	ld	-6 (ix),l
   668C DD 74 FB      [19] 5103 	ld	-5 (ix),h
   668F DD 7E FC      [19] 5104 	ld	a,-4 (ix)
   6692 B7            [ 4] 5105 	or	a, a
   6693 28 0C         [12] 5106 	jr	Z,00113$
   6695 DD 7E FA      [19] 5107 	ld	a,-6 (ix)
   6698 DD 77 FE      [19] 5108 	ld	-2 (ix),a
   669B DD 7E FB      [19] 5109 	ld	a,-5 (ix)
   669E DD 77 FF      [19] 5110 	ld	-1 (ix),a
   66A1                    5111 00113$:
   66A1 DD 6E FE      [19] 5112 	ld	l,-2 (ix)
   66A4 DD 66 FF      [19] 5113 	ld	h,-1 (ix)
   66A7 CB 2C         [ 8] 5114 	sra	h
   66A9 CB 1D         [ 8] 5115 	rr	l
   66AB CB 2C         [ 8] 5116 	sra	h
   66AD CB 1D         [ 8] 5117 	rr	l
   66AF D1            [10] 5118 	pop	de
   66B0 D5            [11] 5119 	push	de
   66B1 19            [11] 5120 	add	hl,de
   66B2 DD 7E FD      [19] 5121 	ld	a,-3 (ix)
   66B5 96            [ 7] 5122 	sub	a,(hl)
   66B6 C2 5A 67      [10] 5123 	jp	NZ,00106$
                           5124 ;src/main.c:305: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   66B9 DD 5E F6      [19] 5125 	ld	e,-10 (ix)
   66BC 16 00         [ 7] 5126 	ld	d,#0x00
   66BE 21 0E 00      [10] 5127 	ld	hl,#0x000E
   66C1 19            [11] 5128 	add	hl,de
   66C2 4D            [ 4] 5129 	ld	c,l
   66C3 44            [ 4] 5130 	ld	b,h
   66C4 69            [ 4] 5131 	ld	l, c
   66C5 78            [ 4] 5132 	ld	a,b
   66C6 67            [ 4] 5133 	ld	h,a
   66C7 07            [ 4] 5134 	rlca
   66C8 E6 01         [ 7] 5135 	and	a,#0x01
   66CA DD 77 FE      [19] 5136 	ld	-2 (ix),a
   66CD 7B            [ 4] 5137 	ld	a,e
   66CE C6 1D         [ 7] 5138 	add	a, #0x1D
   66D0 DD 77 F4      [19] 5139 	ld	-12 (ix),a
   66D3 7A            [ 4] 5140 	ld	a,d
   66D4 CE 00         [ 7] 5141 	adc	a, #0x00
   66D6 DD 77 F5      [19] 5142 	ld	-11 (ix),a
   66D9 DD 7E FE      [19] 5143 	ld	a,-2 (ix)
   66DC B7            [ 4] 5144 	or	a, a
   66DD 28 02         [12] 5145 	jr	Z,00114$
   66DF E1            [10] 5146 	pop	hl
   66E0 E5            [11] 5147 	push	hl
   66E1                    5148 00114$:
   66E1 CB 2C         [ 8] 5149 	sra	h
   66E3 CB 1D         [ 8] 5150 	rr	l
   66E5 CB 2C         [ 8] 5151 	sra	h
   66E7 CB 1D         [ 8] 5152 	rr	l
   66E9 CB 2C         [ 8] 5153 	sra	h
   66EB CB 1D         [ 8] 5154 	rr	l
   66ED CB 2C         [ 8] 5155 	sra	h
   66EF CB 1D         [ 8] 5156 	rr	l
   66F1 5D            [ 4] 5157 	ld	e, l
   66F2 54            [ 4] 5158 	ld	d, h
   66F3 29            [11] 5159 	add	hl, hl
   66F4 29            [11] 5160 	add	hl, hl
   66F5 19            [11] 5161 	add	hl, de
   66F6 29            [11] 5162 	add	hl, hl
   66F7 29            [11] 5163 	add	hl, hl
   66F8 11 25 71      [10] 5164 	ld	de,#_scene
   66FB 19            [11] 5165 	add	hl,de
   66FC DD 5E F9      [19] 5166 	ld	e,-7 (ix)
   66FF 16 00         [ 7] 5167 	ld	d,#0x00
   6701 19            [11] 5168 	add	hl,de
   6702 DD 7E FD      [19] 5169 	ld	a,-3 (ix)
   6705 96            [ 7] 5170 	sub	a,(hl)
   6706 20 52         [12] 5171 	jr	NZ,00106$
                           5172 ;src/main.c:306: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   6708 DD 7E FE      [19] 5173 	ld	a,-2 (ix)
   670B B7            [ 4] 5174 	or	a, a
   670C 28 02         [12] 5175 	jr	Z,00115$
   670E C1            [10] 5176 	pop	bc
   670F C5            [11] 5177 	push	bc
   6710                    5178 00115$:
   6710 CB 28         [ 8] 5179 	sra	b
   6712 CB 19         [ 8] 5180 	rr	c
   6714 CB 28         [ 8] 5181 	sra	b
   6716 CB 19         [ 8] 5182 	rr	c
   6718 CB 28         [ 8] 5183 	sra	b
   671A CB 19         [ 8] 5184 	rr	c
   671C CB 28         [ 8] 5185 	sra	b
   671E CB 19         [ 8] 5186 	rr	c
   6720 69            [ 4] 5187 	ld	l, c
   6721 60            [ 4] 5188 	ld	h, b
   6722 29            [11] 5189 	add	hl, hl
   6723 29            [11] 5190 	add	hl, hl
   6724 09            [11] 5191 	add	hl, bc
   6725 29            [11] 5192 	add	hl, hl
   6726 29            [11] 5193 	add	hl, hl
   6727 3E 25         [ 7] 5194 	ld	a,#<(_scene)
   6729 85            [ 4] 5195 	add	a, l
   672A DD 77 FE      [19] 5196 	ld	-2 (ix),a
   672D 3E 71         [ 7] 5197 	ld	a,#>(_scene)
   672F 8C            [ 4] 5198 	adc	a, h
   6730 DD 77 FF      [19] 5199 	ld	-1 (ix),a
   6733 DD 5E F7      [19] 5200 	ld	e,-9 (ix)
   6736 DD 56 F8      [19] 5201 	ld	d,-8 (ix)
   6739 DD 7E FC      [19] 5202 	ld	a,-4 (ix)
   673C B7            [ 4] 5203 	or	a, a
   673D 28 06         [12] 5204 	jr	Z,00116$
   673F DD 5E FA      [19] 5205 	ld	e,-6 (ix)
   6742 DD 56 FB      [19] 5206 	ld	d,-5 (ix)
   6745                    5207 00116$:
   6745 CB 2A         [ 8] 5208 	sra	d
   6747 CB 1B         [ 8] 5209 	rr	e
   6749 CB 2A         [ 8] 5210 	sra	d
   674B CB 1B         [ 8] 5211 	rr	e
   674D DD 6E FE      [19] 5212 	ld	l,-2 (ix)
   6750 DD 66 FF      [19] 5213 	ld	h,-1 (ix)
   6753 19            [11] 5214 	add	hl,de
   6754 DD 7E FD      [19] 5215 	ld	a,-3 (ix)
   6757 96            [ 7] 5216 	sub	a,(hl)
   6758 28 3B         [12] 5217 	jr	Z,00111$
   675A                    5218 00106$:
                           5219 ;src/main.c:308: switch(enemy.dir){
   675A 3A 3B 72      [13] 5220 	ld	a,(#(_enemy + 0x0009) + 0)
   675D FE 02         [ 7] 5221 	cp	a,#0x02
   675F 28 22         [12] 5222 	jr	Z,00103$
   6761 FE 04         [ 7] 5223 	cp	a,#0x04
   6763 28 0A         [12] 5224 	jr	Z,00101$
   6765 FE 06         [ 7] 5225 	cp	a,#0x06
   6767 28 10         [12] 5226 	jr	Z,00102$
   6769 D6 08         [ 7] 5227 	sub	a, #0x08
   676B 28 20         [12] 5228 	jr	Z,00104$
   676D 18 26         [12] 5229 	jr	00111$
                           5230 ;src/main.c:309: case 4:
   676F                    5231 00101$:
                           5232 ;src/main.c:310: movement(6);
   676F 3E 06         [ 7] 5233 	ld	a,#0x06
   6771 F5            [11] 5234 	push	af
   6772 33            [ 6] 5235 	inc	sp
   6773 CD 18 50      [17] 5236 	call	_movement
   6776 33            [ 6] 5237 	inc	sp
                           5238 ;src/main.c:311: break;
   6777 18 1C         [12] 5239 	jr	00111$
                           5240 ;src/main.c:312: case 6:
   6779                    5241 00102$:
                           5242 ;src/main.c:313: movement(4);
   6779 3E 04         [ 7] 5243 	ld	a,#0x04
   677B F5            [11] 5244 	push	af
   677C 33            [ 6] 5245 	inc	sp
   677D CD 18 50      [17] 5246 	call	_movement
   6780 33            [ 6] 5247 	inc	sp
                           5248 ;src/main.c:314: break;
   6781 18 12         [12] 5249 	jr	00111$
                           5250 ;src/main.c:315: case 2:
   6783                    5251 00103$:
                           5252 ;src/main.c:316: movement(8);
   6783 3E 08         [ 7] 5253 	ld	a,#0x08
   6785 F5            [11] 5254 	push	af
   6786 33            [ 6] 5255 	inc	sp
   6787 CD 18 50      [17] 5256 	call	_movement
   678A 33            [ 6] 5257 	inc	sp
                           5258 ;src/main.c:317: break;
   678B 18 08         [12] 5259 	jr	00111$
                           5260 ;src/main.c:318: case 8:
   678D                    5261 00104$:
                           5262 ;src/main.c:319: movement(2);
   678D 3E 02         [ 7] 5263 	ld	a,#0x02
   678F F5            [11] 5264 	push	af
   6790 33            [ 6] 5265 	inc	sp
   6791 CD 18 50      [17] 5266 	call	_movement
   6794 33            [ 6] 5267 	inc	sp
                           5268 ;src/main.c:321: }
   6795                    5269 00111$:
   6795 DD F9         [10] 5270 	ld	sp, ix
   6797 DD E1         [14] 5271 	pop	ix
   6799 C9            [10] 5272 	ret
                           5273 ;src/main.c:326: void move(){
                           5274 ;	---------------------------------
                           5275 ; Function move
                           5276 ; ---------------------------------
   679A                    5277 _move::
                           5278 ;src/main.c:328: if(temp > 10){
   679A 3E 0A         [ 7] 5279 	ld	a,#0x0A
   679C FD 21 15 72   [14] 5280 	ld	iy,#_temp
   67A0 FD 96 00      [19] 5281 	sub	a, 0 (iy)
   67A3 30 44         [12] 5282 	jr	NC,00116$
                           5283 ;src/main.c:329: enemy.dir = chooseDirection();
   67A5 CD A9 4F      [17] 5284 	call	_chooseDirection
   67A8 7D            [ 4] 5285 	ld	a,l
   67A9 21 3B 72      [10] 5286 	ld	hl,#(_enemy + 0x0009)
   67AC 77            [ 7] 5287 	ld	(hl),a
                           5288 ;src/main.c:330: following = detectPlayerRoom(player.x,player.y);
   67AD 3A 28 72      [13] 5289 	ld	a, (#_player + 1)
   67B0 21 27 72      [10] 5290 	ld	hl, #_player + 0
   67B3 56            [ 7] 5291 	ld	d,(hl)
   67B4 F5            [11] 5292 	push	af
   67B5 33            [ 6] 5293 	inc	sp
   67B6 D5            [11] 5294 	push	de
   67B7 33            [ 6] 5295 	inc	sp
   67B8 CD 7C 4F      [17] 5296 	call	_detectPlayerRoom
   67BB F1            [10] 5297 	pop	af
   67BC FD 21 1A 72   [14] 5298 	ld	iy,#_following
   67C0 FD 75 00      [19] 5299 	ld	0 (iy),l
                           5300 ;src/main.c:335: if(following == enemy.room || enemy.pursue != 0){
   67C3 21 3D 72      [10] 5301 	ld	hl, #_enemy + 11
   67C6 56            [ 7] 5302 	ld	d,(hl)
   67C7 01 40 72      [10] 5303 	ld	bc,#_enemy + 14
   67CA 0A            [ 7] 5304 	ld	a,(bc)
   67CB 5F            [ 4] 5305 	ld	e,a
   67CC 3A 1A 72      [13] 5306 	ld	a,(#_following + 0)
   67CF 92            [ 4] 5307 	sub	a, d
   67D0 28 04         [12] 5308 	jr	Z,00106$
   67D2 7B            [ 4] 5309 	ld	a,e
   67D3 B7            [ 4] 5310 	or	a, a
   67D4 28 3F         [12] 5311 	jr	Z,00117$
   67D6                    5312 00106$:
                           5313 ;src/main.c:336: if(enemy.pursue == 0)
   67D6 7B            [ 4] 5314 	ld	a,e
   67D7 B7            [ 4] 5315 	or	a, a
   67D8 20 05         [12] 5316 	jr	NZ,00104$
                           5317 ;src/main.c:337: enemy.pursue = 4;
   67DA 3E 04         [ 7] 5318 	ld	a,#0x04
   67DC 02            [ 7] 5319 	ld	(bc),a
   67DD 18 36         [12] 5320 	jr	00117$
   67DF                    5321 00104$:
                           5322 ;src/main.c:338: else if(enemy.pursue > 1)
   67DF 3E 01         [ 7] 5323 	ld	a,#0x01
   67E1 93            [ 4] 5324 	sub	a, e
   67E2 30 31         [12] 5325 	jr	NC,00117$
                           5326 ;src/main.c:339: enemy.pursue -=1;
   67E4 1D            [ 4] 5327 	dec	e
   67E5 7B            [ 4] 5328 	ld	a,e
   67E6 02            [ 7] 5329 	ld	(bc),a
   67E7 18 2C         [12] 5330 	jr	00117$
   67E9                    5331 00116$:
                           5332 ;src/main.c:342: if(enemy.pursue >= 1){
   67E9 3A 40 72      [13] 5333 	ld	a,(#(_enemy + 0x000e) + 0)
   67EC D6 01         [ 7] 5334 	sub	a, #0x01
   67EE 38 22         [12] 5335 	jr	C,00113$
                           5336 ;src/main.c:343: followPlayer();
   67F0 CD 8A 5F      [17] 5337 	call	_followPlayer
                           5338 ;src/main.c:344: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   67F3 21 3E 72      [10] 5339 	ld	hl, #_enemy + 12
   67F6 56            [ 7] 5340 	ld	d,(hl)
   67F7 21 32 72      [10] 5341 	ld	hl, #_enemy + 0
   67FA 5E            [ 7] 5342 	ld	e,(hl)
   67FB 7A            [ 4] 5343 	ld	a,d
   67FC 93            [ 4] 5344 	sub	a, e
   67FD 20 16         [12] 5345 	jr	NZ,00117$
   67FF 21 3F 72      [10] 5346 	ld	hl, #_enemy + 13
   6802 56            [ 7] 5347 	ld	d,(hl)
   6803 21 33 72      [10] 5348 	ld	hl, #_enemy + 1
   6806 5E            [ 7] 5349 	ld	e,(hl)
   6807 7A            [ 4] 5350 	ld	a,d
   6808 93            [ 4] 5351 	sub	a, e
   6809 20 0A         [12] 5352 	jr	NZ,00117$
                           5353 ;src/main.c:345: enemy.pursue = 0;
   680B 21 40 72      [10] 5354 	ld	hl,#(_enemy + 0x000e)
   680E 36 00         [10] 5355 	ld	(hl),#0x00
   6810 18 03         [12] 5356 	jr	00117$
   6812                    5357 00113$:
                           5358 ;src/main.c:347: patrol();
   6812 CD 00 66      [17] 5359 	call	_patrol
   6815                    5360 00117$:
                           5361 ;src/main.c:350: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   6815 21 35 72      [10] 5362 	ld	hl, #_enemy + 3
   6818 56            [ 7] 5363 	ld	d,(hl)
   6819 3A 34 72      [13] 5364 	ld	a, (#_enemy + 2)
   681C D5            [11] 5365 	push	de
   681D 33            [ 6] 5366 	inc	sp
   681E F5            [11] 5367 	push	af
   681F 33            [ 6] 5368 	inc	sp
   6820 CD 7C 4F      [17] 5369 	call	_detectPlayerRoom
   6823 F1            [10] 5370 	pop	af
   6824 55            [ 4] 5371 	ld	d,l
   6825 3A 28 72      [13] 5372 	ld	a, (#(_player + 0x0001) + 0)
   6828 21 27 72      [10] 5373 	ld	hl, #_player + 0
   682B 46            [ 7] 5374 	ld	b,(hl)
   682C D5            [11] 5375 	push	de
   682D F5            [11] 5376 	push	af
   682E 33            [ 6] 5377 	inc	sp
   682F C5            [11] 5378 	push	bc
   6830 33            [ 6] 5379 	inc	sp
   6831 CD 7C 4F      [17] 5380 	call	_detectPlayerRoom
   6834 F1            [10] 5381 	pop	af
   6835 45            [ 4] 5382 	ld	b,l
   6836 D1            [10] 5383 	pop	de
   6837 7A            [ 4] 5384 	ld	a,d
   6838 90            [ 4] 5385 	sub	a, b
   6839 28 09         [12] 5386 	jr	Z,00118$
   683B 21 40 72      [10] 5387 	ld	hl, #_enemy + 14
   683E 66            [ 7] 5388 	ld	h,(hl)
   683F 3E 01         [ 7] 5389 	ld	a,#0x01
   6841 94            [ 4] 5390 	sub	a, h
   6842 30 0E         [12] 5391 	jr	NC,00119$
   6844                    5392 00118$:
                           5393 ;src/main.c:351: enemy.seenX = player.x;
   6844 11 3E 72      [10] 5394 	ld	de,#_enemy + 12
   6847 3A 27 72      [13] 5395 	ld	a, (#_player + 0)
   684A 12            [ 7] 5396 	ld	(de),a
                           5397 ;src/main.c:352: enemy.seenY = player.y;
   684B 11 3F 72      [10] 5398 	ld	de,#_enemy + 13
   684E 3A 28 72      [13] 5399 	ld	a, (#(_player + 0x0001) + 0)
   6851 12            [ 7] 5400 	ld	(de),a
   6852                    5401 00119$:
                           5402 ;src/main.c:354: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   6852 3A 33 72      [13] 5403 	ld	a, (#_enemy + 1)
   6855 21 32 72      [10] 5404 	ld	hl, #_enemy + 0
   6858 56            [ 7] 5405 	ld	d,(hl)
   6859 F5            [11] 5406 	push	af
   685A 33            [ 6] 5407 	inc	sp
   685B D5            [11] 5408 	push	de
   685C 33            [ 6] 5409 	inc	sp
   685D CD 7C 4F      [17] 5410 	call	_detectPlayerRoom
   6860 F1            [10] 5411 	pop	af
   6861 7D            [ 4] 5412 	ld	a,l
   6862 32 3D 72      [13] 5413 	ld	(#(_enemy + 0x000b)),a
   6865 C9            [10] 5414 	ret
                           5415 ;src/main.c:359: void game(){
                           5416 ;	---------------------------------
                           5417 ; Function game
                           5418 ; ---------------------------------
   6866                    5419 _game::
   6866 DD E5         [15] 5420 	push	ix
   6868 DD 21 00 00   [14] 5421 	ld	ix,#0
   686C DD 39         [15] 5422 	add	ix,sp
   686E 21 F4 FF      [10] 5423 	ld	hl,#-12
   6871 39            [11] 5424 	add	hl,sp
   6872 F9            [ 6] 5425 	ld	sp,hl
                           5426 ;src/main.c:361: TNivel n = {0,0,0};
   6873 21 00 00      [10] 5427 	ld	hl,#0x0000
   6876 39            [11] 5428 	add	hl,sp
   6877 36 00         [10] 5429 	ld	(hl),#0x00
   6879 21 00 00      [10] 5430 	ld	hl,#0x0000
   687C 39            [11] 5431 	add	hl,sp
   687D 5D            [ 4] 5432 	ld	e, l
   687E 54            [ 4] 5433 	ld	d, h
   687F 23            [ 6] 5434 	inc	hl
   6880 DD 75 FC      [19] 5435 	ld	-4 (ix),l
   6883 DD 74 FD      [19] 5436 	ld	-3 (ix),h
   6886 DD 6E FC      [19] 5437 	ld	l,-4 (ix)
   6889 DD 66 FD      [19] 5438 	ld	h,-3 (ix)
   688C 36 00         [10] 5439 	ld	(hl),#0x00
   688E 13            [ 6] 5440 	inc	de
   688F 13            [ 6] 5441 	inc	de
   6890 DD 73 F8      [19] 5442 	ld	-8 (ix),e
   6893 DD 72 F9      [19] 5443 	ld	-7 (ix),d
   6896 DD 6E F8      [19] 5444 	ld	l,-8 (ix)
   6899 DD 66 F9      [19] 5445 	ld	h,-7 (ix)
   689C 36 00         [10] 5446 	ld	(hl),#0x00
                           5447 ;src/main.c:362: bound =0;
   689E 21 1B 72      [10] 5448 	ld	hl,#_bound + 0
   68A1 36 00         [10] 5449 	ld	(hl), #0x00
                           5450 ;src/main.c:363: temp = 0;
   68A3 21 15 72      [10] 5451 	ld	hl,#_temp + 0
   68A6 36 00         [10] 5452 	ld	(hl), #0x00
                           5453 ;src/main.c:364: map = 1;
   68A8 21 16 72      [10] 5454 	ld	hl,#_map + 0
   68AB 36 01         [10] 5455 	ld	(hl), #0x01
                           5456 ;src/main.c:365: arrow =0;
   68AD 21 19 72      [10] 5457 	ld	hl,#_arrow + 0
   68B0 36 00         [10] 5458 	ld	(hl), #0x00
                           5459 ;src/main.c:366: finish =0;
   68B2 21 18 72      [10] 5460 	ld	hl,#_finish + 0
   68B5 36 00         [10] 5461 	ld	(hl), #0x00
                           5462 ;src/main.c:367: following =0;
   68B7 21 1A 72      [10] 5463 	ld	hl,#_following + 0
   68BA 36 00         [10] 5464 	ld	(hl), #0x00
                           5465 ;src/main.c:368: archer = 0;
   68BC 21 1C 72      [10] 5466 	ld	hl,#_archer + 0
   68BF 36 00         [10] 5467 	ld	(hl), #0x00
                           5468 ;src/main.c:370: initPlayer();
   68C1 CD 5E 54      [17] 5469 	call	_initPlayer
                           5470 ;src/main.c:371: initEnemies();
   68C4 CD 94 54      [17] 5471 	call	_initEnemies
                           5472 ;src/main.c:373: cpct_clearScreen(0);
   68C7 21 00 40      [10] 5473 	ld	hl,#0x4000
   68CA E5            [11] 5474 	push	hl
   68CB AF            [ 4] 5475 	xor	a, a
   68CC F5            [11] 5476 	push	af
   68CD 33            [ 6] 5477 	inc	sp
   68CE 26 C0         [ 7] 5478 	ld	h, #0xC0
   68D0 E5            [11] 5479 	push	hl
   68D1 CD 3C 6F      [17] 5480 	call	_cpct_memset
                           5481 ;src/main.c:374: drawMap(map);
   68D4 3A 16 72      [13] 5482 	ld	a,(_map)
   68D7 F5            [11] 5483 	push	af
   68D8 33            [ 6] 5484 	inc	sp
   68D9 CD C0 46      [17] 5485 	call	_drawMap
   68DC 33            [ 6] 5486 	inc	sp
                           5487 ;src/main.c:376: while (1){
   68DD DD 7E F8      [19] 5488 	ld	a,-8 (ix)
   68E0 DD 77 FE      [19] 5489 	ld	-2 (ix),a
   68E3 DD 7E F9      [19] 5490 	ld	a,-7 (ix)
   68E6 DD 77 FF      [19] 5491 	ld	-1 (ix),a
   68E9 DD 7E FC      [19] 5492 	ld	a,-4 (ix)
   68EC DD 77 FA      [19] 5493 	ld	-6 (ix),a
   68EF DD 7E FD      [19] 5494 	ld	a,-3 (ix)
   68F2 DD 77 FB      [19] 5495 	ld	-5 (ix),a
   68F5                    5496 00135$:
                           5497 ;src/main.c:379: cpct_waitVSYNC();
   68F5 CD 22 6F      [17] 5498 	call	_cpct_waitVSYNC
                           5499 ;src/main.c:382: erases();
   68F8 CD 6D 4D      [17] 5500 	call	_erases
                           5501 ;src/main.c:385: if(temp == 10)
   68FB 3A 15 72      [13] 5502 	ld	a,(#_temp + 0)
   68FE D6 0A         [ 7] 5503 	sub	a, #0x0A
   6900 20 1C         [12] 5504 	jr	NZ,00102$
                           5505 ;src/main.c:386: drawPickUps(n.corazon,n.bullet);
   6902 DD 6E F8      [19] 5506 	ld	l,-8 (ix)
   6905 DD 66 F9      [19] 5507 	ld	h,-7 (ix)
   6908 7E            [ 7] 5508 	ld	a,(hl)
   6909 DD 77 F7      [19] 5509 	ld	-9 (ix),a
   690C DD 6E FC      [19] 5510 	ld	l,-4 (ix)
   690F DD 66 FD      [19] 5511 	ld	h,-3 (ix)
   6912 56            [ 7] 5512 	ld	d,(hl)
   6913 DD 7E F7      [19] 5513 	ld	a,-9 (ix)
   6916 F5            [11] 5514 	push	af
   6917 33            [ 6] 5515 	inc	sp
   6918 D5            [11] 5516 	push	de
   6919 33            [ 6] 5517 	inc	sp
   691A CD 14 4F      [17] 5518 	call	_drawPickUps
   691D F1            [10] 5519 	pop	af
   691E                    5520 00102$:
                           5521 ;src/main.c:389: draws();
   691E CD AE 4C      [17] 5522 	call	_draws
                           5523 ;src/main.c:392: if(temp == 10){
   6921 3A 15 72      [13] 5524 	ld	a,(#_temp + 0)
   6924 D6 0A         [ 7] 5525 	sub	a, #0x0A
   6926 20 2F         [12] 5526 	jr	NZ,00110$
                           5527 ;src/main.c:393: if(player.atk < 20) drawFatiga(player.atk,2);
   6928 21 2F 72      [10] 5528 	ld	hl, #(_player + 0x0008) + 0
   692B 56            [ 7] 5529 	ld	d,(hl)
   692C 7A            [ 4] 5530 	ld	a,d
   692D D6 14         [ 7] 5531 	sub	a, #0x14
   692F 30 0C         [12] 5532 	jr	NC,00107$
   6931 3E 02         [ 7] 5533 	ld	a,#0x02
   6933 F5            [11] 5534 	push	af
   6934 33            [ 6] 5535 	inc	sp
   6935 D5            [11] 5536 	push	de
   6936 33            [ 6] 5537 	inc	sp
   6937 CD EE 4D      [17] 5538 	call	_drawFatiga
   693A F1            [10] 5539 	pop	af
   693B 18 1A         [12] 5540 	jr	00110$
   693D                    5541 00107$:
                           5542 ;src/main.c:394: else if(player.atk > 20) drawFatiga(player.atk,1);
   693D 3E 14         [ 7] 5543 	ld	a,#0x14
   693F 92            [ 4] 5544 	sub	a, d
   6940 30 0C         [12] 5545 	jr	NC,00104$
   6942 3E 01         [ 7] 5546 	ld	a,#0x01
   6944 F5            [11] 5547 	push	af
   6945 33            [ 6] 5548 	inc	sp
   6946 D5            [11] 5549 	push	de
   6947 33            [ 6] 5550 	inc	sp
   6948 CD EE 4D      [17] 5551 	call	_drawFatiga
   694B F1            [10] 5552 	pop	af
   694C 18 09         [12] 5553 	jr	00110$
   694E                    5554 00104$:
                           5555 ;src/main.c:395: else drawFatiga(player.atk,0);
   694E AF            [ 4] 5556 	xor	a, a
   694F F5            [11] 5557 	push	af
   6950 33            [ 6] 5558 	inc	sp
   6951 D5            [11] 5559 	push	de
   6952 33            [ 6] 5560 	inc	sp
   6953 CD EE 4D      [17] 5561 	call	_drawFatiga
   6956 F1            [10] 5562 	pop	af
   6957                    5563 00110$:
                           5564 ;src/main.c:400: if(temp%2 == 0){
   6957 FD 21 15 72   [14] 5565 	ld	iy,#_temp
   695B FD CB 00 46   [20] 5566 	bit	0, 0 (iy)
   695F 20 0D         [12] 5567 	jr	NZ,00112$
                           5568 ;src/main.c:401: player.lx = player.x;
   6961 3A 27 72      [13] 5569 	ld	a, (#_player + 0)
   6964 21 29 72      [10] 5570 	ld	hl,#(_player + 0x0002)
   6967 77            [ 7] 5571 	ld	(hl),a
                           5572 ;src/main.c:402: player.ly = player.y;
   6968 3A 28 72      [13] 5573 	ld	a, (#(_player + 0x0001) + 0)
   696B 32 2A 72      [13] 5574 	ld	(#(_player + 0x0003)),a
   696E                    5575 00112$:
                           5576 ;src/main.c:405: if(enemy.life > 0){
   696E 21 3A 72      [10] 5577 	ld	hl, #(_enemy + 0x0008) + 0
   6971 6E            [ 7] 5578 	ld	l,(hl)
                           5579 ;src/main.c:408: enemy.ly = enemy.y;
                           5580 ;src/main.c:415: enemy.x = enemy.ox;
                           5581 ;src/main.c:416: enemy.y = enemy.oy;
                           5582 ;src/main.c:405: if(enemy.life > 0){
   6972 7D            [ 4] 5583 	ld	a,l
   6973 B7            [ 4] 5584 	or	a, a
   6974 28 71         [12] 5585 	jr	Z,00119$
                           5586 ;src/main.c:406: if(temp%2 == 1){
   6976 3A 15 72      [13] 5587 	ld	a,(#_temp + 0)
   6979 E6 01         [ 7] 5588 	and	a, #0x01
   697B 3D            [ 4] 5589 	dec	a
   697C 20 0D         [12] 5590 	jr	NZ,00114$
                           5591 ;src/main.c:407: enemy.lx = enemy.x;
   697E 3A 32 72      [13] 5592 	ld	a, (#_enemy + 0)
   6981 32 34 72      [13] 5593 	ld	(#(_enemy + 0x0002)),a
                           5594 ;src/main.c:408: enemy.ly = enemy.y;
   6984 11 35 72      [10] 5595 	ld	de,#_enemy + 3
   6987 3A 33 72      [13] 5596 	ld	a, (#(_enemy + 0x0001) + 0)
   698A 12            [ 7] 5597 	ld	(de),a
   698B                    5598 00114$:
                           5599 ;src/main.c:411: move();
   698B CD 9A 67      [17] 5600 	call	_move
                           5601 ;src/main.c:413: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   698E 21 2F 72      [10] 5602 	ld	hl, #(_player + 0x0008) + 0
   6991 56            [ 7] 5603 	ld	d,(hl)
   6992 3A 33 72      [13] 5604 	ld	a, (#(_enemy + 0x0001) + 0)
   6995 21 32 72      [10] 5605 	ld	hl, #_enemy + 0
   6998 5E            [ 7] 5606 	ld	e,(hl)
   6999 21 28 72      [10] 5607 	ld	hl, #(_player + 0x0001) + 0
   699C 46            [ 7] 5608 	ld	b,(hl)
   699D 21 27 72      [10] 5609 	ld	hl, #_player + 0
   69A0 4E            [ 7] 5610 	ld	c,(hl)
   69A1 D5            [11] 5611 	push	de
   69A2 33            [ 6] 5612 	inc	sp
   69A3 57            [ 4] 5613 	ld	d,a
   69A4 D5            [11] 5614 	push	de
   69A5 C5            [11] 5615 	push	bc
   69A6 CD 58 50      [17] 5616 	call	_checkCollisions
   69A9 F1            [10] 5617 	pop	af
   69AA F1            [10] 5618 	pop	af
   69AB 33            [ 6] 5619 	inc	sp
   69AC 7D            [ 4] 5620 	ld	a,l
   69AD 3D            [ 4] 5621 	dec	a
   69AE 28 07         [12] 5622 	jr	Z,00115$
   69B0 7D            [ 4] 5623 	ld	a,l
   69B1 D6 02         [ 7] 5624 	sub	a, #0x02
   69B3 28 1D         [12] 5625 	jr	Z,00116$
   69B5 18 30         [12] 5626 	jr	00119$
                           5627 ;src/main.c:414: case 1:
   69B7                    5628 00115$:
                           5629 ;src/main.c:415: enemy.x = enemy.ox;
   69B7 3A 36 72      [13] 5630 	ld	a, (#(_enemy + 0x0004) + 0)
   69BA 32 32 72      [13] 5631 	ld	(#_enemy),a
                           5632 ;src/main.c:416: enemy.y = enemy.oy;
   69BD 3A 37 72      [13] 5633 	ld	a, (#(_enemy + 0x0005) + 0)
   69C0 32 33 72      [13] 5634 	ld	(#(_enemy + 0x0001)),a
                           5635 ;src/main.c:417: enemy.life -= 1;
   69C3 3A 3A 72      [13] 5636 	ld	a, (#(_enemy + 0x0008) + 0)
   69C6 C6 FF         [ 7] 5637 	add	a,#0xFF
   69C8 32 3A 72      [13] 5638 	ld	(#(_enemy + 0x0008)),a
                           5639 ;src/main.c:418: player.atk = 20;
   69CB 21 2F 72      [10] 5640 	ld	hl,#(_player + 0x0008)
   69CE 36 14         [10] 5641 	ld	(hl),#0x14
                           5642 ;src/main.c:419: break;
   69D0 18 15         [12] 5643 	jr	00119$
                           5644 ;src/main.c:420: case 2:
   69D2                    5645 00116$:
                           5646 ;src/main.c:421: player.x = 0;
   69D2 21 27 72      [10] 5647 	ld	hl,#_player
   69D5 36 00         [10] 5648 	ld	(hl),#0x00
                           5649 ;src/main.c:422: player.y = 80;
   69D7 21 28 72      [10] 5650 	ld	hl,#(_player + 0x0001)
   69DA 36 50         [10] 5651 	ld	(hl),#0x50
                           5652 ;src/main.c:423: player.life -= 1;
   69DC 21 2D 72      [10] 5653 	ld	hl,#_player + 6
   69DF 56            [ 7] 5654 	ld	d,(hl)
   69E0 15            [ 4] 5655 	dec	d
   69E1 72            [ 7] 5656 	ld	(hl),d
                           5657 ;src/main.c:424: player.atk = 20;
   69E2 21 2F 72      [10] 5658 	ld	hl,#(_player + 0x0008)
   69E5 36 14         [10] 5659 	ld	(hl),#0x14
                           5660 ;src/main.c:426: }
   69E7                    5661 00119$:
                           5662 ;src/main.c:428: if(temp > 10)
   69E7 3E 0A         [ 7] 5663 	ld	a,#0x0A
   69E9 FD 21 15 72   [14] 5664 	ld	iy,#_temp
   69ED FD 96 00      [19] 5665 	sub	a, 0 (iy)
   69F0 30 08         [12] 5666 	jr	NC,00121$
                           5667 ;src/main.c:429: temp = 0;
   69F2 FD 21 15 72   [14] 5668 	ld	iy,#_temp
   69F6 FD 36 00 00   [19] 5669 	ld	0 (iy),#0x00
   69FA                    5670 00121$:
                           5671 ;src/main.c:430: temp += 1;
   69FA FD 21 15 72   [14] 5672 	ld	iy,#_temp
   69FE FD 34 00      [23] 5673 	inc	0 (iy)
                           5674 ;src/main.c:431: player.latk = player.atk;
   6A01 11 30 72      [10] 5675 	ld	de,#_player + 9
   6A04 3A 2F 72      [13] 5676 	ld	a, (#(_player + 0x0008) + 0)
   6A07 12            [ 7] 5677 	ld	(de),a
                           5678 ;src/main.c:436: cpct_scanKeyboard_f();
   6A08 CD 6D 6C      [17] 5679 	call	_cpct_scanKeyboard_f
                           5680 ;src/main.c:437: player.sprite = checkKeyboard();
   6A0B CD 79 51      [17] 5681 	call	_checkKeyboard
   6A0E 5D            [ 4] 5682 	ld	e,l
   6A0F 54            [ 4] 5683 	ld	d,h
   6A10 ED 53 2B 72   [20] 5684 	ld	((_player + 0x0004)), de
                           5685 ;src/main.c:438: checkBoundsCollisions(&n.corazon,&n.bullet);
   6A14 DD 6E FE      [19] 5686 	ld	l,-2 (ix)
   6A17 DD 66 FF      [19] 5687 	ld	h,-1 (ix)
   6A1A DD 5E FA      [19] 5688 	ld	e,-6 (ix)
   6A1D DD 56 FB      [19] 5689 	ld	d,-5 (ix)
   6A20 E5            [11] 5690 	push	hl
   6A21 D5            [11] 5691 	push	de
   6A22 CD 70 59      [17] 5692 	call	_checkBoundsCollisions
   6A25 F1            [10] 5693 	pop	af
   6A26 F1            [10] 5694 	pop	af
                           5695 ;src/main.c:440: if(arrow == 1){
   6A27 3A 19 72      [13] 5696 	ld	a,(#_arrow + 0)
   6A2A 3D            [ 4] 5697 	dec	a
   6A2B 20 6C         [12] 5698 	jr	NZ,00131$
                           5699 ;src/main.c:441: moveObject();
   6A2D CD 04 54      [17] 5700 	call	_moveObject
                           5701 ;src/main.c:442: bound = checkArrowCollisions();
   6A30 CD 41 5D      [17] 5702 	call	_checkArrowCollisions
   6A33 FD 21 1B 72   [14] 5703 	ld	iy,#_bound
   6A37 FD 75 00      [19] 5704 	ld	0 (iy),l
                           5705 ;src/main.c:443: if(object.dir == 2 || object.dir == 8)
   6A3A 3A 24 72      [13] 5706 	ld	a,(#_object + 7)
   6A3D FE 02         [ 7] 5707 	cp	a,#0x02
   6A3F 28 04         [12] 5708 	jr	Z,00122$
   6A41 D6 08         [ 7] 5709 	sub	a, #0x08
   6A43 20 04         [12] 5710 	jr	NZ,00123$
   6A45                    5711 00122$:
                           5712 ;src/main.c:444: atkObj = 21;
   6A45 06 15         [ 7] 5713 	ld	b,#0x15
   6A47 18 02         [12] 5714 	jr	00124$
   6A49                    5715 00123$:
                           5716 ;src/main.c:446: atkObj = 22;
   6A49 06 16         [ 7] 5717 	ld	b,#0x16
   6A4B                    5718 00124$:
                           5719 ;src/main.c:447: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
   6A4B 3A 3A 72      [13] 5720 	ld	a, (#(_enemy + 0x0008) + 0)
   6A4E B7            [ 4] 5721 	or	a, a
   6A4F 28 48         [12] 5722 	jr	Z,00131$
   6A51 3A 33 72      [13] 5723 	ld	a, (#(_enemy + 0x0001) + 0)
   6A54 21 32 72      [10] 5724 	ld	hl, #_enemy + 0
   6A57 4E            [ 7] 5725 	ld	c,(hl)
   6A58 21 1E 72      [10] 5726 	ld	hl, #_object + 1
   6A5B 5E            [ 7] 5727 	ld	e,(hl)
   6A5C 21 1D 72      [10] 5728 	ld	hl, #_object + 0
   6A5F 56            [ 7] 5729 	ld	d,(hl)
   6A60 C5            [11] 5730 	push	bc
   6A61 33            [ 6] 5731 	inc	sp
   6A62 F5            [11] 5732 	push	af
   6A63 33            [ 6] 5733 	inc	sp
   6A64 79            [ 4] 5734 	ld	a,c
   6A65 F5            [11] 5735 	push	af
   6A66 33            [ 6] 5736 	inc	sp
   6A67 7B            [ 4] 5737 	ld	a,e
   6A68 F5            [11] 5738 	push	af
   6A69 33            [ 6] 5739 	inc	sp
   6A6A D5            [11] 5740 	push	de
   6A6B 33            [ 6] 5741 	inc	sp
   6A6C CD 58 50      [17] 5742 	call	_checkCollisions
   6A6F F1            [10] 5743 	pop	af
   6A70 F1            [10] 5744 	pop	af
   6A71 33            [ 6] 5745 	inc	sp
   6A72 2D            [ 4] 5746 	dec	l
   6A73 20 24         [12] 5747 	jr	NZ,00131$
   6A75 3A 1B 72      [13] 5748 	ld	a,(#_bound + 0)
   6A78 B7            [ 4] 5749 	or	a, a
   6A79 20 1E         [12] 5750 	jr	NZ,00131$
                           5751 ;src/main.c:448: enemy.life -= 1;
   6A7B 3A 3A 72      [13] 5752 	ld	a, (#(_enemy + 0x0008) + 0)
   6A7E C6 FF         [ 7] 5753 	add	a,#0xFF
   6A80 32 3A 72      [13] 5754 	ld	(#(_enemy + 0x0008)),a
                           5755 ;src/main.c:449: enemy.x = enemy.ox;
   6A83 3A 36 72      [13] 5756 	ld	a, (#(_enemy + 0x0004) + 0)
   6A86 32 32 72      [13] 5757 	ld	(#_enemy),a
                           5758 ;src/main.c:450: enemy.y = enemy.oy;
   6A89 3A 37 72      [13] 5759 	ld	a, (#(_enemy + 0x0005) + 0)
   6A8C 32 33 72      [13] 5760 	ld	(#(_enemy + 0x0001)),a
                           5761 ;src/main.c:451: object.vivo = 0;
   6A8F 21 23 72      [10] 5762 	ld	hl,#_object + 6
   6A92 36 00         [10] 5763 	ld	(hl),#0x00
                           5764 ;src/main.c:452: bound = 1;
   6A94 21 1B 72      [10] 5765 	ld	hl,#_bound + 0
   6A97 36 01         [10] 5766 	ld	(hl), #0x01
   6A99                    5767 00131$:
                           5768 ;src/main.c:455: if(finish == 1) return;
   6A99 3A 18 72      [13] 5769 	ld	a,(#_finish + 0)
   6A9C 3D            [ 4] 5770 	dec	a
   6A9D C2 F5 68      [10] 5771 	jp	NZ,00135$
   6AA0 DD F9         [10] 5772 	ld	sp, ix
   6AA2 DD E1         [14] 5773 	pop	ix
   6AA4 C9            [10] 5774 	ret
                           5775 ;src/main.c:462: void credits(){
                           5776 ;	---------------------------------
                           5777 ; Function credits
                           5778 ; ---------------------------------
   6AA5                    5779 _credits::
                           5780 ;src/main.c:464: cpct_clearScreen(0);
   6AA5 21 00 40      [10] 5781 	ld	hl,#0x4000
   6AA8 E5            [11] 5782 	push	hl
   6AA9 AF            [ 4] 5783 	xor	a, a
   6AAA F5            [11] 5784 	push	af
   6AAB 33            [ 6] 5785 	inc	sp
   6AAC 26 C0         [ 7] 5786 	ld	h, #0xC0
   6AAE E5            [11] 5787 	push	hl
   6AAF CD 3C 6F      [17] 5788 	call	_cpct_memset
                           5789 ;src/main.c:465: memptr = cpct_getScreenPtr(VMEM,10,10);
   6AB2 21 0A 0A      [10] 5790 	ld	hl,#0x0A0A
   6AB5 E5            [11] 5791 	push	hl
   6AB6 21 00 C0      [10] 5792 	ld	hl,#0xC000
   6AB9 E5            [11] 5793 	push	hl
   6ABA CD 2F 70      [17] 5794 	call	_cpct_getScreenPtr
                           5795 ;src/main.c:466: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6ABD EB            [ 4] 5796 	ex	de,hl
   6ABE 01 07 6B      [10] 5797 	ld	bc,#___str_5
   6AC1 D5            [11] 5798 	push	de
   6AC2 21 01 00      [10] 5799 	ld	hl,#0x0001
   6AC5 E5            [11] 5800 	push	hl
   6AC6 D5            [11] 5801 	push	de
   6AC7 C5            [11] 5802 	push	bc
   6AC8 CD 4E 6D      [17] 5803 	call	_cpct_drawStringM0
   6ACB 21 06 00      [10] 5804 	ld	hl,#6
   6ACE 39            [11] 5805 	add	hl,sp
   6ACF F9            [ 6] 5806 	ld	sp,hl
   6AD0 D1            [10] 5807 	pop	de
                           5808 ;src/main.c:468: while (1){
   6AD1                    5809 00104$:
                           5810 ;src/main.c:470: cpct_scanKeyboard_f();
   6AD1 D5            [11] 5811 	push	de
   6AD2 CD 6D 6C      [17] 5812 	call	_cpct_scanKeyboard_f
   6AD5 D1            [10] 5813 	pop	de
                           5814 ;src/main.c:471: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   6AD6 01 18 6B      [10] 5815 	ld	bc,#___str_6
   6AD9 D5            [11] 5816 	push	de
   6ADA 21 01 00      [10] 5817 	ld	hl,#0x0001
   6ADD E5            [11] 5818 	push	hl
   6ADE D5            [11] 5819 	push	de
   6ADF C5            [11] 5820 	push	bc
   6AE0 CD 4E 6D      [17] 5821 	call	_cpct_drawStringM0
   6AE3 21 06 00      [10] 5822 	ld	hl,#6
   6AE6 39            [11] 5823 	add	hl,sp
   6AE7 F9            [ 6] 5824 	ld	sp,hl
   6AE8 D1            [10] 5825 	pop	de
                           5826 ;src/main.c:472: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   6AE9 01 2E 6B      [10] 5827 	ld	bc,#___str_7
   6AEC D5            [11] 5828 	push	de
   6AED 21 01 00      [10] 5829 	ld	hl,#0x0001
   6AF0 E5            [11] 5830 	push	hl
   6AF1 D5            [11] 5831 	push	de
   6AF2 C5            [11] 5832 	push	bc
   6AF3 CD 4E 6D      [17] 5833 	call	_cpct_drawStringM0
   6AF6 21 06 00      [10] 5834 	ld	hl,#6
   6AF9 39            [11] 5835 	add	hl,sp
   6AFA F9            [ 6] 5836 	ld	sp,hl
   6AFB 21 08 04      [10] 5837 	ld	hl,#0x0408
   6AFE CD 61 6C      [17] 5838 	call	_cpct_isKeyPressed
   6B01 7D            [ 4] 5839 	ld	a,l
   6B02 D1            [10] 5840 	pop	de
   6B03 B7            [ 4] 5841 	or	a, a
   6B04 28 CB         [12] 5842 	jr	Z,00104$
                           5843 ;src/main.c:476: return;
   6B06 C9            [10] 5844 	ret
   6B07                    5845 ___str_5:
   6B07 4C 6F 75 6E 67 65  5846 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   6B17 00                 5847 	.db 0x00
   6B18                    5848 ___str_6:
   6B18 4A 6F 73 65 70 20  5849 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   6B2D 00                 5850 	.db 0x00
   6B2E                    5851 ___str_7:
   6B2E 41 6C 62 65 72 74  5852 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   6B47 00                 5853 	.db 0x00
                           5854 ;src/main.c:486: void main(void) {
                           5855 ;	---------------------------------
                           5856 ; Function main
                           5857 ; ---------------------------------
   6B48                    5858 _main::
                           5859 ;src/main.c:490: init();
   6B48 CD 39 54      [17] 5860 	call	_init
                           5861 ;src/main.c:493: while(1){
   6B4B                    5862 00106$:
                           5863 ;src/main.c:494: x=menu();
   6B4B CD 0A 55      [17] 5864 	call	_menu
   6B4E 5D            [ 4] 5865 	ld	e, l
   6B4F 54            [ 4] 5866 	ld	d, h
                           5867 ;src/main.c:495: switch(x){
   6B50 CB 7A         [ 8] 5868 	bit	7, d
   6B52 20 F7         [12] 5869 	jr	NZ,00106$
   6B54 3E 02         [ 7] 5870 	ld	a,#0x02
   6B56 BB            [ 4] 5871 	cp	a, e
   6B57 3E 00         [ 7] 5872 	ld	a,#0x00
   6B59 9A            [ 4] 5873 	sbc	a, d
   6B5A E2 5F 6B      [10] 5874 	jp	PO, 00122$
   6B5D EE 80         [ 7] 5875 	xor	a, #0x80
   6B5F                    5876 00122$:
   6B5F FA 4B 6B      [10] 5877 	jp	M,00106$
   6B62 16 00         [ 7] 5878 	ld	d,#0x00
   6B64 21 6A 6B      [10] 5879 	ld	hl,#00123$
   6B67 19            [11] 5880 	add	hl,de
   6B68 19            [11] 5881 	add	hl,de
                           5882 ;src/main.c:496: case 0: return;break;
                           5883 ;src/main.c:497: case 1: game(); break;
   6B69 E9            [ 4] 5884 	jp	(hl)
   6B6A                    5885 00123$:
   6B6A 18 10         [12] 5886 	jr	00108$
   6B6C 18 04         [12] 5887 	jr	00102$
   6B6E 18 07         [12] 5888 	jr	00103$
   6B70 18 0A         [12] 5889 	jr	00108$
   6B72                    5890 00102$:
   6B72 CD 66 68      [17] 5891 	call	_game
   6B75 18 D4         [12] 5892 	jr	00106$
                           5893 ;src/main.c:498: case 2: credits();break;
   6B77                    5894 00103$:
   6B77 CD A5 6A      [17] 5895 	call	_credits
                           5896 ;src/main.c:499: }
   6B7A 18 CF         [12] 5897 	jr	00106$
   6B7C                    5898 00108$:
   6B7C C9            [10] 5899 	ret
                           5900 	.area _CODE
                           5901 	.area _INITIALIZER
                           5902 	.area _CABS (ABS)
