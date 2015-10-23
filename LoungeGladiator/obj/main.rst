                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct 23 09:22:38 2015
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
                             15 	.globl _menu
                             16 	.globl _gameOver
                             17 	.globl _initVariables
                             18 	.globl _initNivel
                             19 	.globl _initEnemies
                             20 	.globl _initPlayer
                             21 	.globl _init
                             22 	.globl _moveObject
                             23 	.globl _checkKeyboard
                             24 	.globl _checkArrowCollisions
                             25 	.globl _checkBoundsCollisions
                             26 	.globl _checkCollisions
                             27 	.globl _move
                             28 	.globl _patrol
                             29 	.globl _followPlayer
                             30 	.globl _movement
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
                             52 	.globl _cpct_isAnyKeyPressed
                             53 	.globl _cpct_isKeyPressed
                             54 	.globl _cpct_scanKeyboard_f
                             55 	.globl _cpct_scanKeyboard
                             56 	.globl _cpct_memset
                             57 	.globl _cpct_disableFirmware
                             58 	.globl _rand
                             59 	.globl _enemy
                             60 	.globl _player
                             61 	.globl _object
                             62 	.globl _n
                             63 	.globl _dead
                             64 	.globl _archer
                             65 	.globl _bound
                             66 	.globl _following
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
   6F2A                      84 _scene::
   6F2A                      85 	.ds 240
   701A                      86 _temp::
   701A                      87 	.ds 1
   701B                      88 _map::
   701B                      89 	.ds 1
   701C                      90 _path::
   701C                      91 	.ds 1
   701D                      92 _finish::
   701D                      93 	.ds 1
   701E                      94 _arrow::
   701E                      95 	.ds 1
   701F                      96 _following::
   701F                      97 	.ds 1
   7020                      98 _bound::
   7020                      99 	.ds 1
   7021                     100 _archer::
   7021                     101 	.ds 1
   7022                     102 _dead::
   7022                     103 	.ds 1
   7023                     104 _n::
   7023                     105 	.ds 3
   7026                     106 _object::
   7026                     107 	.ds 10
   7030                     108 _player::
   7030                     109 	.ds 11
   703B                     110 _enemy::
   703B                     111 	.ds 15
                            112 ;--------------------------------------------------------
                            113 ; ram data
                            114 ;--------------------------------------------------------
                            115 	.area _INITIALIZED
                            116 ;--------------------------------------------------------
                            117 ; absolute external ram data
                            118 ;--------------------------------------------------------
                            119 	.area _DABS (ABS)
                            120 ;--------------------------------------------------------
                            121 ; global & static initialisations
                            122 ;--------------------------------------------------------
                            123 	.area _HOME
                            124 	.area _GSINIT
                            125 	.area _GSFINAL
                            126 	.area _GSINIT
                            127 ;--------------------------------------------------------
                            128 ; Home
                            129 ;--------------------------------------------------------
                            130 	.area _HOME
                            131 	.area _HOME
                            132 ;--------------------------------------------------------
                            133 ; code
                            134 ;--------------------------------------------------------
                            135 	.area _CODE
                            136 ;src/draws.h:14: void drawMap(u8 t){
                            137 ;	---------------------------------
                            138 ; Function drawMap
                            139 ; ---------------------------------
   46C0                     140 _drawMap::
   46C0 DD E5         [15]  141 	push	ix
   46C2 DD 21 00 00   [14]  142 	ld	ix,#0
   46C6 DD 39         [15]  143 	add	ix,sp
   46C8 21 F0 FF      [10]  144 	ld	hl,#-16
   46CB 39            [11]  145 	add	hl,sp
   46CC F9            [ 6]  146 	ld	sp,hl
                            147 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  148 	ld	a,4 (ix)
   46D0 3D            [ 4]  149 	dec	a
   46D1 C2 79 47      [10]  150 	jp	NZ,00104$
                            151 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  152 	ld	hl,#0x0000
   46D7 E3            [19]  153 	ex	(sp), hl
   46D8 DD 36 F8 00   [19]  154 	ld	-8 (ix),#0x00
   46DC DD 36 F9 00   [19]  155 	ld	-7 (ix),#0x00
                            156 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     157 00130$:
   46E0 3E 2A         [ 7]  158 	ld	a,#<(_scene)
   46E2 DD 86 F8      [19]  159 	add	a, -8 (ix)
   46E5 DD 77 FE      [19]  160 	ld	-2 (ix),a
   46E8 3E 6F         [ 7]  161 	ld	a,#>(_scene)
   46EA DD 8E F9      [19]  162 	adc	a, -7 (ix)
   46ED DD 77 FF      [19]  163 	ld	-1 (ix),a
   46F0 3E 1B         [ 7]  164 	ld	a,#<(_mapa1)
   46F2 DD 86 F8      [19]  165 	add	a, -8 (ix)
   46F5 DD 77 FA      [19]  166 	ld	-6 (ix),a
   46F8 3E 49         [ 7]  167 	ld	a,#>(_mapa1)
   46FA DD 8E F9      [19]  168 	adc	a, -7 (ix)
   46FD DD 77 FB      [19]  169 	ld	-5 (ix),a
   4700 DD 36 F2 00   [19]  170 	ld	-14 (ix),#0x00
   4704 DD 36 F3 00   [19]  171 	ld	-13 (ix),#0x00
   4708                     172 00115$:
                            173 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E FE      [19]  174 	ld	a,-2 (ix)
   470B DD 86 F2      [19]  175 	add	a, -14 (ix)
   470E DD 77 FC      [19]  176 	ld	-4 (ix),a
   4711 DD 7E FF      [19]  177 	ld	a,-1 (ix)
   4714 DD 8E F3      [19]  178 	adc	a, -13 (ix)
   4717 DD 77 FD      [19]  179 	ld	-3 (ix),a
   471A DD 7E FA      [19]  180 	ld	a,-6 (ix)
   471D DD 86 F2      [19]  181 	add	a, -14 (ix)
   4720 DD 77 F6      [19]  182 	ld	-10 (ix),a
   4723 DD 7E FB      [19]  183 	ld	a,-5 (ix)
   4726 DD 8E F3      [19]  184 	adc	a, -13 (ix)
   4729 DD 77 F7      [19]  185 	ld	-9 (ix),a
   472C DD 6E F6      [19]  186 	ld	l,-10 (ix)
   472F DD 66 F7      [19]  187 	ld	h,-9 (ix)
   4732 7E            [ 7]  188 	ld	a,(hl)
   4733 DD 6E FC      [19]  189 	ld	l,-4 (ix)
   4736 DD 66 FD      [19]  190 	ld	h,-3 (ix)
   4739 77            [ 7]  191 	ld	(hl),a
                            192 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F2      [23]  193 	inc	-14 (ix)
   473D 20 03         [12]  194 	jr	NZ,00189$
   473F DD 34 F3      [23]  195 	inc	-13 (ix)
   4742                     196 00189$:
   4742 DD 7E F2      [19]  197 	ld	a,-14 (ix)
   4745 D6 14         [ 7]  198 	sub	a, #0x14
   4747 DD 7E F3      [19]  199 	ld	a,-13 (ix)
   474A 17            [ 4]  200 	rla
   474B 3F            [ 4]  201 	ccf
   474C 1F            [ 4]  202 	rra
   474D DE 80         [ 7]  203 	sbc	a, #0x80
   474F 38 B7         [12]  204 	jr	C,00115$
                            205 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E F8      [19]  206 	ld	a,-8 (ix)
   4754 C6 14         [ 7]  207 	add	a, #0x14
   4756 DD 77 F8      [19]  208 	ld	-8 (ix),a
   4759 DD 7E F9      [19]  209 	ld	a,-7 (ix)
   475C CE 00         [ 7]  210 	adc	a, #0x00
   475E DD 77 F9      [19]  211 	ld	-7 (ix),a
   4761 DD 34 F0      [23]  212 	inc	-16 (ix)
   4764 20 03         [12]  213 	jr	NZ,00190$
   4766 DD 34 F1      [23]  214 	inc	-15 (ix)
   4769                     215 00190$:
   4769 DD 7E F0      [19]  216 	ld	a,-16 (ix)
   476C D6 0C         [ 7]  217 	sub	a, #0x0C
   476E DD 7E F1      [19]  218 	ld	a,-15 (ix)
   4771 17            [ 4]  219 	rla
   4772 3F            [ 4]  220 	ccf
   4773 1F            [ 4]  221 	rra
   4774 DE 80         [ 7]  222 	sbc	a, #0x80
   4776 DA E0 46      [10]  223 	jp	C,00130$
   4779                     224 00104$:
                            225 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  226 	ld	a,4 (ix)
   477C D6 02         [ 7]  227 	sub	a, #0x02
   477E C2 26 48      [10]  228 	jp	NZ,00141$
                            229 ;src/draws.h:27: for(y=0;y<height;y++){
   4781 21 00 00      [10]  230 	ld	hl,#0x0000
   4784 E3            [19]  231 	ex	(sp), hl
   4785 DD 36 F6 00   [19]  232 	ld	-10 (ix),#0x00
   4789 DD 36 F7 00   [19]  233 	ld	-9 (ix),#0x00
                            234 ;src/draws.h:28: for(x=0;x<width;x++){
   478D                     235 00134$:
   478D 3E 2A         [ 7]  236 	ld	a,#<(_scene)
   478F DD 86 F6      [19]  237 	add	a, -10 (ix)
   4792 DD 77 FC      [19]  238 	ld	-4 (ix),a
   4795 3E 6F         [ 7]  239 	ld	a,#>(_scene)
   4797 DD 8E F7      [19]  240 	adc	a, -9 (ix)
   479A DD 77 FD      [19]  241 	ld	-3 (ix),a
   479D 3E 0B         [ 7]  242 	ld	a,#<(_mapa2)
   479F DD 86 F6      [19]  243 	add	a, -10 (ix)
   47A2 DD 77 FA      [19]  244 	ld	-6 (ix),a
   47A5 3E 4A         [ 7]  245 	ld	a,#>(_mapa2)
   47A7 DD 8E F7      [19]  246 	adc	a, -9 (ix)
   47AA DD 77 FB      [19]  247 	ld	-5 (ix),a
   47AD DD 36 F2 00   [19]  248 	ld	-14 (ix),#0x00
   47B1 DD 36 F3 00   [19]  249 	ld	-13 (ix),#0x00
   47B5                     250 00119$:
                            251 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   47B5 DD 7E FC      [19]  252 	ld	a,-4 (ix)
   47B8 DD 86 F2      [19]  253 	add	a, -14 (ix)
   47BB DD 77 FE      [19]  254 	ld	-2 (ix),a
   47BE DD 7E FD      [19]  255 	ld	a,-3 (ix)
   47C1 DD 8E F3      [19]  256 	adc	a, -13 (ix)
   47C4 DD 77 FF      [19]  257 	ld	-1 (ix),a
   47C7 DD 7E FA      [19]  258 	ld	a,-6 (ix)
   47CA DD 86 F2      [19]  259 	add	a, -14 (ix)
   47CD DD 77 F8      [19]  260 	ld	-8 (ix),a
   47D0 DD 7E FB      [19]  261 	ld	a,-5 (ix)
   47D3 DD 8E F3      [19]  262 	adc	a, -13 (ix)
   47D6 DD 77 F9      [19]  263 	ld	-7 (ix),a
   47D9 DD 6E F8      [19]  264 	ld	l,-8 (ix)
   47DC DD 66 F9      [19]  265 	ld	h,-7 (ix)
   47DF 7E            [ 7]  266 	ld	a,(hl)
   47E0 DD 6E FE      [19]  267 	ld	l,-2 (ix)
   47E3 DD 66 FF      [19]  268 	ld	h,-1 (ix)
   47E6 77            [ 7]  269 	ld	(hl),a
                            270 ;src/draws.h:28: for(x=0;x<width;x++){
   47E7 DD 34 F2      [23]  271 	inc	-14 (ix)
   47EA 20 03         [12]  272 	jr	NZ,00193$
   47EC DD 34 F3      [23]  273 	inc	-13 (ix)
   47EF                     274 00193$:
   47EF DD 7E F2      [19]  275 	ld	a,-14 (ix)
   47F2 D6 14         [ 7]  276 	sub	a, #0x14
   47F4 DD 7E F3      [19]  277 	ld	a,-13 (ix)
   47F7 17            [ 4]  278 	rla
   47F8 3F            [ 4]  279 	ccf
   47F9 1F            [ 4]  280 	rra
   47FA DE 80         [ 7]  281 	sbc	a, #0x80
   47FC 38 B7         [12]  282 	jr	C,00119$
                            283 ;src/draws.h:27: for(y=0;y<height;y++){
   47FE DD 7E F6      [19]  284 	ld	a,-10 (ix)
   4801 C6 14         [ 7]  285 	add	a, #0x14
   4803 DD 77 F6      [19]  286 	ld	-10 (ix),a
   4806 DD 7E F7      [19]  287 	ld	a,-9 (ix)
   4809 CE 00         [ 7]  288 	adc	a, #0x00
   480B DD 77 F7      [19]  289 	ld	-9 (ix),a
   480E DD 34 F0      [23]  290 	inc	-16 (ix)
   4811 20 03         [12]  291 	jr	NZ,00194$
   4813 DD 34 F1      [23]  292 	inc	-15 (ix)
   4816                     293 00194$:
   4816 DD 7E F0      [19]  294 	ld	a,-16 (ix)
   4819 D6 0C         [ 7]  295 	sub	a, #0x0C
   481B DD 7E F1      [19]  296 	ld	a,-15 (ix)
   481E 17            [ 4]  297 	rla
   481F 3F            [ 4]  298 	ccf
   4820 1F            [ 4]  299 	rra
   4821 DE 80         [ 7]  300 	sbc	a, #0x80
   4823 DA 8D 47      [10]  301 	jp	C,00134$
                            302 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   4826                     303 00141$:
   4826 01 00 00      [10]  304 	ld	bc,#0x0000
   4829 DD 36 F6 00   [19]  305 	ld	-10 (ix),#0x00
   482D DD 36 F7 00   [19]  306 	ld	-9 (ix),#0x00
   4831 11 00 00      [10]  307 	ld	de,#0x0000
                            308 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4834                     309 00139$:
   4834 21 2A 6F      [10]  310 	ld	hl,#_scene
   4837 19            [11]  311 	add	hl,de
   4838 DD 75 FC      [19]  312 	ld	-4 (ix),l
   483B DD 74 FD      [19]  313 	ld	-3 (ix),h
   483E DD 36 F4 00   [19]  314 	ld	-12 (ix),#0x00
   4842 DD 36 F5 00   [19]  315 	ld	-11 (ix),#0x00
   4846                     316 00123$:
                            317 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   4846 79            [ 4]  318 	ld	a,c
   4847 07            [ 4]  319 	rlca
   4848 07            [ 4]  320 	rlca
   4849 07            [ 4]  321 	rlca
   484A 07            [ 4]  322 	rlca
   484B E6 F0         [ 7]  323 	and	a,#0xF0
   484D 67            [ 4]  324 	ld	h,a
   484E DD 7E F4      [19]  325 	ld	a,-12 (ix)
   4851 87            [ 4]  326 	add	a, a
   4852 87            [ 4]  327 	add	a, a
   4853 C5            [11]  328 	push	bc
   4854 D5            [11]  329 	push	de
   4855 E5            [11]  330 	push	hl
   4856 33            [ 6]  331 	inc	sp
   4857 F5            [11]  332 	push	af
   4858 33            [ 6]  333 	inc	sp
   4859 21 00 C0      [10]  334 	ld	hl,#0xC000
   485C E5            [11]  335 	push	hl
   485D CD 34 6E      [17]  336 	call	_cpct_getScreenPtr
   4860 D1            [10]  337 	pop	de
   4861 C1            [10]  338 	pop	bc
   4862 E5            [11]  339 	push	hl
   4863 FD E1         [14]  340 	pop	iy
                            341 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4865 DD 7E FC      [19]  342 	ld	a,-4 (ix)
   4868 DD 86 F4      [19]  343 	add	a, -12 (ix)
   486B 6F            [ 4]  344 	ld	l,a
   486C DD 7E FD      [19]  345 	ld	a,-3 (ix)
   486F DD 8E F5      [19]  346 	adc	a, -11 (ix)
   4872 67            [ 4]  347 	ld	h,a
   4873 66            [ 7]  348 	ld	h,(hl)
                            349 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4874 FD E5         [15]  350 	push	iy
   4876 F1            [10]  351 	pop	af
   4877 DD 77 FB      [19]  352 	ld	-5 (ix),a
   487A FD E5         [15]  353 	push	iy
   487C 3B            [ 6]  354 	dec	sp
   487D F1            [10]  355 	pop	af
   487E 33            [ 6]  356 	inc	sp
   487F DD 77 FA      [19]  357 	ld	-6 (ix),a
                            358 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4882 25            [ 4]  359 	dec	h
   4883 20 16         [12]  360 	jr	NZ,00110$
                            361 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4885 C5            [11]  362 	push	bc
   4886 D5            [11]  363 	push	de
   4887 21 04 10      [10]  364 	ld	hl,#0x1004
   488A E5            [11]  365 	push	hl
   488B DD 6E FA      [19]  366 	ld	l,-6 (ix)
   488E DD 66 FB      [19]  367 	ld	h,-5 (ix)
   4891 E5            [11]  368 	push	hl
   4892 21 75 69      [10]  369 	ld	hl,#_muro
   4895 E5            [11]  370 	push	hl
   4896 CD 6A 6B      [17]  371 	call	_cpct_drawSprite
   4899 D1            [10]  372 	pop	de
   489A C1            [10]  373 	pop	bc
   489B                     374 00110$:
                            375 ;src/draws.h:40: if(scene[posY][posX] == 9){
   489B 3E 2A         [ 7]  376 	ld	a,#<(_scene)
   489D DD 86 F6      [19]  377 	add	a, -10 (ix)
   48A0 6F            [ 4]  378 	ld	l,a
   48A1 3E 6F         [ 7]  379 	ld	a,#>(_scene)
   48A3 DD 8E F7      [19]  380 	adc	a, -9 (ix)
   48A6 67            [ 4]  381 	ld	h,a
   48A7 7D            [ 4]  382 	ld	a,l
   48A8 DD 86 F4      [19]  383 	add	a, -12 (ix)
   48AB 6F            [ 4]  384 	ld	l,a
   48AC 7C            [ 4]  385 	ld	a,h
   48AD DD 8E F5      [19]  386 	adc	a, -11 (ix)
   48B0 67            [ 4]  387 	ld	h,a
   48B1 7E            [ 7]  388 	ld	a,(hl)
   48B2 D6 09         [ 7]  389 	sub	a, #0x09
   48B4 20 19         [12]  390 	jr	NZ,00124$
                            391 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   48B6 C5            [11]  392 	push	bc
   48B7 D5            [11]  393 	push	de
   48B8 21 04 10      [10]  394 	ld	hl,#0x1004
   48BB E5            [11]  395 	push	hl
   48BC 3E 09         [ 7]  396 	ld	a,#0x09
   48BE F5            [11]  397 	push	af
   48BF 33            [ 6]  398 	inc	sp
   48C0 DD 6E FA      [19]  399 	ld	l,-6 (ix)
   48C3 DD 66 FB      [19]  400 	ld	h,-5 (ix)
   48C6 E5            [11]  401 	push	hl
   48C7 CD 63 6D      [17]  402 	call	_cpct_drawSolidBox
   48CA F1            [10]  403 	pop	af
   48CB F1            [10]  404 	pop	af
   48CC 33            [ 6]  405 	inc	sp
   48CD D1            [10]  406 	pop	de
   48CE C1            [10]  407 	pop	bc
   48CF                     408 00124$:
                            409 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   48CF DD 34 F4      [23]  410 	inc	-12 (ix)
   48D2 20 03         [12]  411 	jr	NZ,00199$
   48D4 DD 34 F5      [23]  412 	inc	-11 (ix)
   48D7                     413 00199$:
   48D7 DD 7E F4      [19]  414 	ld	a,-12 (ix)
   48DA D6 14         [ 7]  415 	sub	a, #0x14
   48DC DD 7E F5      [19]  416 	ld	a,-11 (ix)
   48DF 17            [ 4]  417 	rla
   48E0 3F            [ 4]  418 	ccf
   48E1 1F            [ 4]  419 	rra
   48E2 DE 80         [ 7]  420 	sbc	a, #0x80
   48E4 DA 46 48      [10]  421 	jp	C,00123$
                            422 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   48E7 DD 7E F6      [19]  423 	ld	a,-10 (ix)
   48EA C6 14         [ 7]  424 	add	a, #0x14
   48EC DD 77 F6      [19]  425 	ld	-10 (ix),a
   48EF DD 7E F7      [19]  426 	ld	a,-9 (ix)
   48F2 CE 00         [ 7]  427 	adc	a, #0x00
   48F4 DD 77 F7      [19]  428 	ld	-9 (ix),a
   48F7 21 14 00      [10]  429 	ld	hl,#0x0014
   48FA 19            [11]  430 	add	hl,de
   48FB EB            [ 4]  431 	ex	de,hl
   48FC 03            [ 6]  432 	inc	bc
   48FD 79            [ 4]  433 	ld	a,c
   48FE D6 0C         [ 7]  434 	sub	a, #0x0C
   4900 78            [ 4]  435 	ld	a,b
   4901 17            [ 4]  436 	rla
   4902 3F            [ 4]  437 	ccf
   4903 1F            [ 4]  438 	rra
   4904 DE 80         [ 7]  439 	sbc	a, #0x80
   4906 DA 34 48      [10]  440 	jp	C,00139$
   4909 DD F9         [10]  441 	ld	sp, ix
   490B DD E1         [14]  442 	pop	ix
   490D C9            [10]  443 	ret
   490E                     444 _g_palette:
   490E 00                  445 	.db #0x00	; 0
   490F 1A                  446 	.db #0x1A	; 26
   4910 06                  447 	.db #0x06	; 6
   4911 0D                  448 	.db #0x0D	; 13
   4912 00                  449 	.db 0x00
   4913                     450 _origins:
   4913 00                  451 	.db #0x00	; 0
   4914 50                  452 	.db #0x50	; 80	'P'
   4915 34                  453 	.db #0x34	; 52	'4'
   4916 50                  454 	.db #0x50	; 80	'P'
   4917 00                  455 	.db #0x00	; 0
   4918 50                  456 	.db #0x50	; 80	'P'
   4919 34                  457 	.db #0x34	; 52	'4'
   491A 50                  458 	.db #0x50	; 80	'P'
   491B                     459 _mapa1:
   491B 01                  460 	.db #0x01	; 1
   491C 01                  461 	.db #0x01	; 1
   491D 01                  462 	.db #0x01	; 1
   491E 01                  463 	.db #0x01	; 1
   491F 01                  464 	.db #0x01	; 1
   4920 01                  465 	.db #0x01	; 1
   4921 01                  466 	.db #0x01	; 1
   4922 01                  467 	.db #0x01	; 1
   4923 01                  468 	.db #0x01	; 1
   4924 01                  469 	.db #0x01	; 1
   4925 01                  470 	.db #0x01	; 1
   4926 01                  471 	.db #0x01	; 1
   4927 01                  472 	.db #0x01	; 1
   4928 01                  473 	.db #0x01	; 1
   4929 01                  474 	.db #0x01	; 1
   492A 01                  475 	.db #0x01	; 1
   492B 01                  476 	.db #0x01	; 1
   492C 01                  477 	.db #0x01	; 1
   492D 01                  478 	.db #0x01	; 1
   492E 01                  479 	.db #0x01	; 1
   492F 01                  480 	.db #0x01	; 1
   4930 07                  481 	.db #0x07	; 7
   4931 05                  482 	.db #0x05	; 5
   4932 07                  483 	.db #0x07	; 7
   4933 07                  484 	.db #0x07	; 7
   4934 07                  485 	.db #0x07	; 7
   4935 07                  486 	.db #0x07	; 7
   4936 07                  487 	.db #0x07	; 7
   4937 07                  488 	.db #0x07	; 7
   4938 07                  489 	.db #0x07	; 7
   4939 07                  490 	.db #0x07	; 7
   493A 07                  491 	.db #0x07	; 7
   493B 07                  492 	.db #0x07	; 7
   493C 07                  493 	.db #0x07	; 7
   493D 07                  494 	.db #0x07	; 7
   493E 07                  495 	.db #0x07	; 7
   493F 07                  496 	.db #0x07	; 7
   4940 07                  497 	.db #0x07	; 7
   4941 07                  498 	.db #0x07	; 7
   4942 01                  499 	.db #0x01	; 1
   4943 01                  500 	.db #0x01	; 1
   4944 07                  501 	.db #0x07	; 7
   4945 07                  502 	.db #0x07	; 7
   4946 07                  503 	.db #0x07	; 7
   4947 07                  504 	.db #0x07	; 7
   4948 07                  505 	.db #0x07	; 7
   4949 07                  506 	.db #0x07	; 7
   494A 07                  507 	.db #0x07	; 7
   494B 07                  508 	.db #0x07	; 7
   494C 07                  509 	.db #0x07	; 7
   494D 07                  510 	.db #0x07	; 7
   494E 07                  511 	.db #0x07	; 7
   494F 07                  512 	.db #0x07	; 7
   4950 07                  513 	.db #0x07	; 7
   4951 07                  514 	.db #0x07	; 7
   4952 07                  515 	.db #0x07	; 7
   4953 07                  516 	.db #0x07	; 7
   4954 07                  517 	.db #0x07	; 7
   4955 07                  518 	.db #0x07	; 7
   4956 01                  519 	.db #0x01	; 1
   4957 01                  520 	.db #0x01	; 1
   4958 01                  521 	.db #0x01	; 1
   4959 01                  522 	.db #0x01	; 1
   495A 01                  523 	.db #0x01	; 1
   495B 01                  524 	.db #0x01	; 1
   495C 01                  525 	.db #0x01	; 1
   495D 01                  526 	.db #0x01	; 1
   495E 01                  527 	.db #0x01	; 1
   495F 01                  528 	.db #0x01	; 1
   4960 07                  529 	.db #0x07	; 7
   4961 07                  530 	.db #0x07	; 7
   4962 01                  531 	.db #0x01	; 1
   4963 01                  532 	.db #0x01	; 1
   4964 01                  533 	.db #0x01	; 1
   4965 01                  534 	.db #0x01	; 1
   4966 07                  535 	.db #0x07	; 7
   4967 07                  536 	.db #0x07	; 7
   4968 01                  537 	.db #0x01	; 1
   4969 01                  538 	.db #0x01	; 1
   496A 01                  539 	.db #0x01	; 1
   496B 01                  540 	.db #0x01	; 1
   496C 00                  541 	.db #0x00	; 0
   496D 00                  542 	.db #0x00	; 0
   496E 00                  543 	.db #0x00	; 0
   496F 00                  544 	.db #0x00	; 0
   4970 00                  545 	.db #0x00	; 0
   4971 00                  546 	.db #0x00	; 0
   4972 00                  547 	.db #0x00	; 0
   4973 06                  548 	.db #0x06	; 6
   4974 06                  549 	.db #0x06	; 6
   4975 06                  550 	.db #0x06	; 6
   4976 01                  551 	.db #0x01	; 1
   4977 03                  552 	.db #0x03	; 3
   4978 03                  553 	.db #0x03	; 3
   4979 03                  554 	.db #0x03	; 3
   497A 03                  555 	.db #0x03	; 3
   497B 03                  556 	.db #0x03	; 3
   497C 03                  557 	.db #0x03	; 3
   497D 03                  558 	.db #0x03	; 3
   497E 01                  559 	.db #0x01	; 1
   497F 00                  560 	.db #0x00	; 0
   4980 00                  561 	.db #0x00	; 0
   4981 01                  562 	.db #0x01	; 1
   4982 01                  563 	.db #0x01	; 1
   4983 04                  564 	.db #0x04	; 4
   4984 04                  565 	.db #0x04	; 4
   4985 01                  566 	.db #0x01	; 1
   4986 01                  567 	.db #0x01	; 1
   4987 06                  568 	.db #0x06	; 6
   4988 06                  569 	.db #0x06	; 6
   4989 06                  570 	.db #0x06	; 6
   498A 01                  571 	.db #0x01	; 1
   498B 03                  572 	.db #0x03	; 3
   498C 03                  573 	.db #0x03	; 3
   498D 03                  574 	.db #0x03	; 3
   498E 03                  575 	.db #0x03	; 3
   498F 03                  576 	.db #0x03	; 3
   4990 03                  577 	.db #0x03	; 3
   4991 03                  578 	.db #0x03	; 3
   4992 01                  579 	.db #0x01	; 1
   4993 01                  580 	.db #0x01	; 1
   4994 00                  581 	.db #0x00	; 0
   4995 01                  582 	.db #0x01	; 1
   4996 04                  583 	.db #0x04	; 4
   4997 04                  584 	.db #0x04	; 4
   4998 04                  585 	.db #0x04	; 4
   4999 04                  586 	.db #0x04	; 4
   499A 01                  587 	.db #0x01	; 1
   499B 06                  588 	.db #0x06	; 6
   499C 06                  589 	.db #0x06	; 6
   499D 06                  590 	.db #0x06	; 6
   499E 01                  591 	.db #0x01	; 1
   499F 03                  592 	.db #0x03	; 3
   49A0 03                  593 	.db #0x03	; 3
   49A1 03                  594 	.db #0x03	; 3
   49A2 03                  595 	.db #0x03	; 3
   49A3 03                  596 	.db #0x03	; 3
   49A4 03                  597 	.db #0x03	; 3
   49A5 03                  598 	.db #0x03	; 3
   49A6 01                  599 	.db #0x01	; 1
   49A7 01                  600 	.db #0x01	; 1
   49A8 00                  601 	.db #0x00	; 0
   49A9 01                  602 	.db #0x01	; 1
   49AA 04                  603 	.db #0x04	; 4
   49AB 04                  604 	.db #0x04	; 4
   49AC 04                  605 	.db #0x04	; 4
   49AD 04                  606 	.db #0x04	; 4
   49AE 01                  607 	.db #0x01	; 1
   49AF 06                  608 	.db #0x06	; 6
   49B0 06                  609 	.db #0x06	; 6
   49B1 06                  610 	.db #0x06	; 6
   49B2 01                  611 	.db #0x01	; 1
   49B3 03                  612 	.db #0x03	; 3
   49B4 03                  613 	.db #0x03	; 3
   49B5 03                  614 	.db #0x03	; 3
   49B6 03                  615 	.db #0x03	; 3
   49B7 03                  616 	.db #0x03	; 3
   49B8 03                  617 	.db #0x03	; 3
   49B9 03                  618 	.db #0x03	; 3
   49BA 01                  619 	.db #0x01	; 1
   49BB 01                  620 	.db #0x01	; 1
   49BC 00                  621 	.db #0x00	; 0
   49BD 01                  622 	.db #0x01	; 1
   49BE 04                  623 	.db #0x04	; 4
   49BF 04                  624 	.db #0x04	; 4
   49C0 04                  625 	.db #0x04	; 4
   49C1 04                  626 	.db #0x04	; 4
   49C2 01                  627 	.db #0x01	; 1
   49C3 06                  628 	.db #0x06	; 6
   49C4 06                  629 	.db #0x06	; 6
   49C5 06                  630 	.db #0x06	; 6
   49C6 01                  631 	.db #0x01	; 1
   49C7 03                  632 	.db #0x03	; 3
   49C8 03                  633 	.db #0x03	; 3
   49C9 03                  634 	.db #0x03	; 3
   49CA 03                  635 	.db #0x03	; 3
   49CB 03                  636 	.db #0x03	; 3
   49CC 03                  637 	.db #0x03	; 3
   49CD 03                  638 	.db #0x03	; 3
   49CE 01                  639 	.db #0x01	; 1
   49CF 01                  640 	.db #0x01	; 1
   49D0 00                  641 	.db #0x00	; 0
   49D1 01                  642 	.db #0x01	; 1
   49D2 04                  643 	.db #0x04	; 4
   49D3 04                  644 	.db #0x04	; 4
   49D4 04                  645 	.db #0x04	; 4
   49D5 04                  646 	.db #0x04	; 4
   49D6 01                  647 	.db #0x01	; 1
   49D7 06                  648 	.db #0x06	; 6
   49D8 06                  649 	.db #0x06	; 6
   49D9 06                  650 	.db #0x06	; 6
   49DA 03                  651 	.db #0x03	; 3
   49DB 03                  652 	.db #0x03	; 3
   49DC 03                  653 	.db #0x03	; 3
   49DD 03                  654 	.db #0x03	; 3
   49DE 03                  655 	.db #0x03	; 3
   49DF 03                  656 	.db #0x03	; 3
   49E0 03                  657 	.db #0x03	; 3
   49E1 03                  658 	.db #0x03	; 3
   49E2 01                  659 	.db #0x01	; 1
   49E3 01                  660 	.db #0x01	; 1
   49E4 02                  661 	.db #0x02	; 2
   49E5 01                  662 	.db #0x01	; 1
   49E6 04                  663 	.db #0x04	; 4
   49E7 04                  664 	.db #0x04	; 4
   49E8 04                  665 	.db #0x04	; 4
   49E9 04                  666 	.db #0x04	; 4
   49EA 01                  667 	.db #0x01	; 1
   49EB 06                  668 	.db #0x06	; 6
   49EC 06                  669 	.db #0x06	; 6
   49ED 06                  670 	.db #0x06	; 6
   49EE 03                  671 	.db #0x03	; 3
   49EF 03                  672 	.db #0x03	; 3
   49F0 03                  673 	.db #0x03	; 3
   49F1 03                  674 	.db #0x03	; 3
   49F2 03                  675 	.db #0x03	; 3
   49F3 03                  676 	.db #0x03	; 3
   49F4 03                  677 	.db #0x03	; 3
   49F5 03                  678 	.db #0x03	; 3
   49F6 01                  679 	.db #0x01	; 1
   49F7 01                  680 	.db #0x01	; 1
   49F8 01                  681 	.db #0x01	; 1
   49F9 01                  682 	.db #0x01	; 1
   49FA 01                  683 	.db #0x01	; 1
   49FB 01                  684 	.db #0x01	; 1
   49FC 01                  685 	.db #0x01	; 1
   49FD 01                  686 	.db #0x01	; 1
   49FE 01                  687 	.db #0x01	; 1
   49FF 01                  688 	.db #0x01	; 1
   4A00 01                  689 	.db #0x01	; 1
   4A01 01                  690 	.db #0x01	; 1
   4A02 01                  691 	.db #0x01	; 1
   4A03 01                  692 	.db #0x01	; 1
   4A04 01                  693 	.db #0x01	; 1
   4A05 01                  694 	.db #0x01	; 1
   4A06 09                  695 	.db #0x09	; 9
   4A07 09                  696 	.db #0x09	; 9
   4A08 01                  697 	.db #0x01	; 1
   4A09 01                  698 	.db #0x01	; 1
   4A0A 01                  699 	.db #0x01	; 1
   4A0B                     700 _mapa2:
   4A0B 01                  701 	.db #0x01	; 1
   4A0C 01                  702 	.db #0x01	; 1
   4A0D 01                  703 	.db #0x01	; 1
   4A0E 01                  704 	.db #0x01	; 1
   4A0F 01                  705 	.db #0x01	; 1
   4A10 01                  706 	.db #0x01	; 1
   4A11 01                  707 	.db #0x01	; 1
   4A12 01                  708 	.db #0x01	; 1
   4A13 01                  709 	.db #0x01	; 1
   4A14 01                  710 	.db #0x01	; 1
   4A15 01                  711 	.db #0x01	; 1
   4A16 01                  712 	.db #0x01	; 1
   4A17 01                  713 	.db #0x01	; 1
   4A18 01                  714 	.db #0x01	; 1
   4A19 01                  715 	.db #0x01	; 1
   4A1A 01                  716 	.db #0x01	; 1
   4A1B 01                  717 	.db #0x01	; 1
   4A1C 01                  718 	.db #0x01	; 1
   4A1D 01                  719 	.db #0x01	; 1
   4A1E 01                  720 	.db #0x01	; 1
   4A1F 01                  721 	.db #0x01	; 1
   4A20 00                  722 	.db #0x00	; 0
   4A21 00                  723 	.db #0x00	; 0
   4A22 00                  724 	.db #0x00	; 0
   4A23 00                  725 	.db #0x00	; 0
   4A24 01                  726 	.db #0x01	; 1
   4A25 00                  727 	.db #0x00	; 0
   4A26 00                  728 	.db #0x00	; 0
   4A27 00                  729 	.db #0x00	; 0
   4A28 00                  730 	.db #0x00	; 0
   4A29 00                  731 	.db #0x00	; 0
   4A2A 00                  732 	.db #0x00	; 0
   4A2B 00                  733 	.db #0x00	; 0
   4A2C 00                  734 	.db #0x00	; 0
   4A2D 00                  735 	.db #0x00	; 0
   4A2E 00                  736 	.db #0x00	; 0
   4A2F 00                  737 	.db #0x00	; 0
   4A30 00                  738 	.db #0x00	; 0
   4A31 00                  739 	.db #0x00	; 0
   4A32 06                  740 	.db #0x06	; 6
   4A33 01                  741 	.db #0x01	; 1
   4A34 00                  742 	.db #0x00	; 0
   4A35 00                  743 	.db #0x00	; 0
   4A36 01                  744 	.db #0x01	; 1
   4A37 00                  745 	.db #0x00	; 0
   4A38 00                  746 	.db #0x00	; 0
   4A39 00                  747 	.db #0x00	; 0
   4A3A 00                  748 	.db #0x00	; 0
   4A3B 00                  749 	.db #0x00	; 0
   4A3C 00                  750 	.db #0x00	; 0
   4A3D 00                  751 	.db #0x00	; 0
   4A3E 00                  752 	.db #0x00	; 0
   4A3F 00                  753 	.db #0x00	; 0
   4A40 00                  754 	.db #0x00	; 0
   4A41 00                  755 	.db #0x00	; 0
   4A42 00                  756 	.db #0x00	; 0
   4A43 00                  757 	.db #0x00	; 0
   4A44 00                  758 	.db #0x00	; 0
   4A45 00                  759 	.db #0x00	; 0
   4A46 01                  760 	.db #0x01	; 1
   4A47 01                  761 	.db #0x01	; 1
   4A48 00                  762 	.db #0x00	; 0
   4A49 01                  763 	.db #0x01	; 1
   4A4A 01                  764 	.db #0x01	; 1
   4A4B 01                  765 	.db #0x01	; 1
   4A4C 01                  766 	.db #0x01	; 1
   4A4D 00                  767 	.db #0x00	; 0
   4A4E 00                  768 	.db #0x00	; 0
   4A4F 01                  769 	.db #0x01	; 1
   4A50 01                  770 	.db #0x01	; 1
   4A51 01                  771 	.db #0x01	; 1
   4A52 01                  772 	.db #0x01	; 1
   4A53 01                  773 	.db #0x01	; 1
   4A54 01                  774 	.db #0x01	; 1
   4A55 01                  775 	.db #0x01	; 1
   4A56 01                  776 	.db #0x01	; 1
   4A57 01                  777 	.db #0x01	; 1
   4A58 01                  778 	.db #0x01	; 1
   4A59 01                  779 	.db #0x01	; 1
   4A5A 01                  780 	.db #0x01	; 1
   4A5B 01                  781 	.db #0x01	; 1
   4A5C 00                  782 	.db #0x00	; 0
   4A5D 05                  783 	.db #0x05	; 5
   4A5E 01                  784 	.db #0x01	; 1
   4A5F 00                  785 	.db #0x00	; 0
   4A60 00                  786 	.db #0x00	; 0
   4A61 00                  787 	.db #0x00	; 0
   4A62 00                  788 	.db #0x00	; 0
   4A63 00                  789 	.db #0x00	; 0
   4A64 00                  790 	.db #0x00	; 0
   4A65 00                  791 	.db #0x00	; 0
   4A66 01                  792 	.db #0x01	; 1
   4A67 00                  793 	.db #0x00	; 0
   4A68 00                  794 	.db #0x00	; 0
   4A69 00                  795 	.db #0x00	; 0
   4A6A 00                  796 	.db #0x00	; 0
   4A6B 00                  797 	.db #0x00	; 0
   4A6C 00                  798 	.db #0x00	; 0
   4A6D 00                  799 	.db #0x00	; 0
   4A6E 01                  800 	.db #0x01	; 1
   4A6F 01                  801 	.db #0x01	; 1
   4A70 00                  802 	.db #0x00	; 0
   4A71 01                  803 	.db #0x01	; 1
   4A72 01                  804 	.db #0x01	; 1
   4A73 00                  805 	.db #0x00	; 0
   4A74 01                  806 	.db #0x01	; 1
   4A75 01                  807 	.db #0x01	; 1
   4A76 01                  808 	.db #0x01	; 1
   4A77 02                  809 	.db #0x02	; 2
   4A78 02                  810 	.db #0x02	; 2
   4A79 02                  811 	.db #0x02	; 2
   4A7A 01                  812 	.db #0x01	; 1
   4A7B 00                  813 	.db #0x00	; 0
   4A7C 00                  814 	.db #0x00	; 0
   4A7D 00                  815 	.db #0x00	; 0
   4A7E 05                  816 	.db #0x05	; 5
   4A7F 00                  817 	.db #0x00	; 0
   4A80 00                  818 	.db #0x00	; 0
   4A81 00                  819 	.db #0x00	; 0
   4A82 01                  820 	.db #0x01	; 1
   4A83 01                  821 	.db #0x01	; 1
   4A84 00                  822 	.db #0x00	; 0
   4A85 01                  823 	.db #0x01	; 1
   4A86 02                  824 	.db #0x02	; 2
   4A87 02                  825 	.db #0x02	; 2
   4A88 02                  826 	.db #0x02	; 2
   4A89 02                  827 	.db #0x02	; 2
   4A8A 01                  828 	.db #0x01	; 1
   4A8B 00                  829 	.db #0x00	; 0
   4A8C 00                  830 	.db #0x00	; 0
   4A8D 00                  831 	.db #0x00	; 0
   4A8E 01                  832 	.db #0x01	; 1
   4A8F 00                  833 	.db #0x00	; 0
   4A90 00                  834 	.db #0x00	; 0
   4A91 00                  835 	.db #0x00	; 0
   4A92 05                  836 	.db #0x05	; 5
   4A93 00                  837 	.db #0x00	; 0
   4A94 00                  838 	.db #0x00	; 0
   4A95 00                  839 	.db #0x00	; 0
   4A96 01                  840 	.db #0x01	; 1
   4A97 01                  841 	.db #0x01	; 1
   4A98 00                  842 	.db #0x00	; 0
   4A99 01                  843 	.db #0x01	; 1
   4A9A 02                  844 	.db #0x02	; 2
   4A9B 02                  845 	.db #0x02	; 2
   4A9C 02                  846 	.db #0x02	; 2
   4A9D 02                  847 	.db #0x02	; 2
   4A9E 01                  848 	.db #0x01	; 1
   4A9F 02                  849 	.db #0x02	; 2
   4AA0 02                  850 	.db #0x02	; 2
   4AA1 02                  851 	.db #0x02	; 2
   4AA2 01                  852 	.db #0x01	; 1
   4AA3 00                  853 	.db #0x00	; 0
   4AA4 00                  854 	.db #0x00	; 0
   4AA5 00                  855 	.db #0x00	; 0
   4AA6 05                  856 	.db #0x05	; 5
   4AA7 00                  857 	.db #0x00	; 0
   4AA8 00                  858 	.db #0x00	; 0
   4AA9 00                  859 	.db #0x00	; 0
   4AAA 01                  860 	.db #0x01	; 1
   4AAB 01                  861 	.db #0x01	; 1
   4AAC 00                  862 	.db #0x00	; 0
   4AAD 01                  863 	.db #0x01	; 1
   4AAE 02                  864 	.db #0x02	; 2
   4AAF 02                  865 	.db #0x02	; 2
   4AB0 02                  866 	.db #0x02	; 2
   4AB1 02                  867 	.db #0x02	; 2
   4AB2 01                  868 	.db #0x01	; 1
   4AB3 00                  869 	.db #0x00	; 0
   4AB4 00                  870 	.db #0x00	; 0
   4AB5 00                  871 	.db #0x00	; 0
   4AB6 01                  872 	.db #0x01	; 1
   4AB7 00                  873 	.db #0x00	; 0
   4AB8 00                  874 	.db #0x00	; 0
   4AB9 00                  875 	.db #0x00	; 0
   4ABA 00                  876 	.db #0x00	; 0
   4ABB 00                  877 	.db #0x00	; 0
   4ABC 00                  878 	.db #0x00	; 0
   4ABD 00                  879 	.db #0x00	; 0
   4ABE 01                  880 	.db #0x01	; 1
   4ABF 01                  881 	.db #0x01	; 1
   4AC0 00                  882 	.db #0x00	; 0
   4AC1 01                  883 	.db #0x01	; 1
   4AC2 02                  884 	.db #0x02	; 2
   4AC3 02                  885 	.db #0x02	; 2
   4AC4 02                  886 	.db #0x02	; 2
   4AC5 02                  887 	.db #0x02	; 2
   4AC6 01                  888 	.db #0x01	; 1
   4AC7 02                  889 	.db #0x02	; 2
   4AC8 02                  890 	.db #0x02	; 2
   4AC9 02                  891 	.db #0x02	; 2
   4ACA 01                  892 	.db #0x01	; 1
   4ACB 00                  893 	.db #0x00	; 0
   4ACC 00                  894 	.db #0x00	; 0
   4ACD 00                  895 	.db #0x00	; 0
   4ACE 00                  896 	.db #0x00	; 0
   4ACF 00                  897 	.db #0x00	; 0
   4AD0 00                  898 	.db #0x00	; 0
   4AD1 00                  899 	.db #0x00	; 0
   4AD2 01                  900 	.db #0x01	; 1
   4AD3 01                  901 	.db #0x01	; 1
   4AD4 05                  902 	.db #0x05	; 5
   4AD5 01                  903 	.db #0x01	; 1
   4AD6 02                  904 	.db #0x02	; 2
   4AD7 02                  905 	.db #0x02	; 2
   4AD8 02                  906 	.db #0x02	; 2
   4AD9 02                  907 	.db #0x02	; 2
   4ADA 01                  908 	.db #0x01	; 1
   4ADB 00                  909 	.db #0x00	; 0
   4ADC 00                  910 	.db #0x00	; 0
   4ADD 00                  911 	.db #0x00	; 0
   4ADE 00                  912 	.db #0x00	; 0
   4ADF 00                  913 	.db #0x00	; 0
   4AE0 00                  914 	.db #0x00	; 0
   4AE1 00                  915 	.db #0x00	; 0
   4AE2 00                  916 	.db #0x00	; 0
   4AE3 00                  917 	.db #0x00	; 0
   4AE4 00                  918 	.db #0x00	; 0
   4AE5 00                  919 	.db #0x00	; 0
   4AE6 01                  920 	.db #0x01	; 1
   4AE7 01                  921 	.db #0x01	; 1
   4AE8 01                  922 	.db #0x01	; 1
   4AE9 01                  923 	.db #0x01	; 1
   4AEA 01                  924 	.db #0x01	; 1
   4AEB 01                  925 	.db #0x01	; 1
   4AEC 01                  926 	.db #0x01	; 1
   4AED 01                  927 	.db #0x01	; 1
   4AEE 01                  928 	.db #0x01	; 1
   4AEF 01                  929 	.db #0x01	; 1
   4AF0 01                  930 	.db #0x01	; 1
   4AF1 01                  931 	.db #0x01	; 1
   4AF2 01                  932 	.db #0x01	; 1
   4AF3 01                  933 	.db #0x01	; 1
   4AF4 01                  934 	.db #0x01	; 1
   4AF5 01                  935 	.db #0x01	; 1
   4AF6 00                  936 	.db #0x00	; 0
   4AF7 01                  937 	.db #0x01	; 1
   4AF8 01                  938 	.db #0x01	; 1
   4AF9 01                  939 	.db #0x01	; 1
   4AFA 01                  940 	.db #0x01	; 1
                            941 ;src/draws.h:48: void drawVida(u8 life,u8 pos){
                            942 ;	---------------------------------
                            943 ; Function drawVida
                            944 ; ---------------------------------
   4AFB                     945 _drawVida::
   4AFB DD E5         [15]  946 	push	ix
   4AFD DD 21 00 00   [14]  947 	ld	ix,#0
   4B01 DD 39         [15]  948 	add	ix,sp
                            949 ;src/draws.h:51: u8 p = pos;
   4B03 DD 56 05      [19]  950 	ld	d,5 (ix)
                            951 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B06 1E 01         [ 7]  952 	ld	e,#0x01
   4B08                     953 00105$:
                            954 ;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B08 D5            [11]  955 	push	de
   4B09 3E C0         [ 7]  956 	ld	a,#0xC0
   4B0B F5            [11]  957 	push	af
   4B0C 33            [ 6]  958 	inc	sp
   4B0D D5            [11]  959 	push	de
   4B0E 33            [ 6]  960 	inc	sp
   4B0F 21 00 C0      [10]  961 	ld	hl,#0xC000
   4B12 E5            [11]  962 	push	hl
   4B13 CD 34 6E      [17]  963 	call	_cpct_getScreenPtr
   4B16 D1            [10]  964 	pop	de
                            965 ;src/draws.h:55: p+=5;
   4B17 7A            [ 4]  966 	ld	a,d
   4B18 C6 05         [ 7]  967 	add	a, #0x05
   4B1A 57            [ 4]  968 	ld	d,a
                            969 ;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4B1B 4D            [ 4]  970 	ld	c, l
   4B1C 44            [ 4]  971 	ld	b, h
   4B1D DD 7E 04      [19]  972 	ld	a,4 (ix)
   4B20 93            [ 4]  973 	sub	a, e
   4B21 38 10         [12]  974 	jr	C,00102$
   4B23 D5            [11]  975 	push	de
   4B24 21 04 08      [10]  976 	ld	hl,#0x0804
   4B27 E5            [11]  977 	push	hl
   4B28 C5            [11]  978 	push	bc
   4B29 21 00 46      [10]  979 	ld	hl,#_corazon_lleno
   4B2C E5            [11]  980 	push	hl
   4B2D CD D0 6C      [17]  981 	call	_cpct_drawSpriteMasked
   4B30 D1            [10]  982 	pop	de
   4B31 18 20         [12]  983 	jr	00106$
   4B33                     984 00102$:
                            985 ;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
   4B33 C5            [11]  986 	push	bc
   4B34 D5            [11]  987 	push	de
   4B35 21 04 08      [10]  988 	ld	hl,#0x0804
   4B38 E5            [11]  989 	push	hl
   4B39 AF            [ 4]  990 	xor	a, a
   4B3A F5            [11]  991 	push	af
   4B3B 33            [ 6]  992 	inc	sp
   4B3C C5            [11]  993 	push	bc
   4B3D CD 63 6D      [17]  994 	call	_cpct_drawSolidBox
   4B40 F1            [10]  995 	pop	af
   4B41 F1            [10]  996 	pop	af
   4B42 33            [ 6]  997 	inc	sp
   4B43 D1            [10]  998 	pop	de
   4B44 C1            [10]  999 	pop	bc
                           1000 ;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4B45 D5            [11] 1001 	push	de
   4B46 21 04 08      [10] 1002 	ld	hl,#0x0804
   4B49 E5            [11] 1003 	push	hl
   4B4A C5            [11] 1004 	push	bc
   4B4B 21 40 46      [10] 1005 	ld	hl,#_corazon_roto
   4B4E E5            [11] 1006 	push	hl
   4B4F CD D0 6C      [17] 1007 	call	_cpct_drawSpriteMasked
   4B52 D1            [10] 1008 	pop	de
   4B53                    1009 00106$:
                           1010 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B53 1C            [ 4] 1011 	inc	e
   4B54 3E 03         [ 7] 1012 	ld	a,#0x03
   4B56 93            [ 4] 1013 	sub	a, e
   4B57 30 AF         [12] 1014 	jr	NC,00105$
   4B59 DD E1         [14] 1015 	pop	ix
   4B5B C9            [10] 1016 	ret
                           1017 ;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
                           1018 ;	---------------------------------
                           1019 ; Function drawBullets
                           1020 ; ---------------------------------
   4B5C                    1021 _drawBullets::
   4B5C DD E5         [15] 1022 	push	ix
   4B5E DD 21 00 00   [14] 1023 	ld	ix,#0
   4B62 DD 39         [15] 1024 	add	ix,sp
   4B64 3B            [ 6] 1025 	dec	sp
                           1026 ;src/draws.h:67: int p = pos;
   4B65 DD 4E 05      [19] 1027 	ld	c,5 (ix)
   4B68 06 00         [ 7] 1028 	ld	b,#0x00
                           1029 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B6A DD 36 FF 01   [19] 1030 	ld	-1 (ix),#0x01
   4B6E                    1031 00105$:
                           1032 ;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B6E 51            [ 4] 1033 	ld	d,c
   4B6F C5            [11] 1034 	push	bc
   4B70 3E C0         [ 7] 1035 	ld	a,#0xC0
   4B72 F5            [11] 1036 	push	af
   4B73 33            [ 6] 1037 	inc	sp
   4B74 D5            [11] 1038 	push	de
   4B75 33            [ 6] 1039 	inc	sp
   4B76 21 00 C0      [10] 1040 	ld	hl,#0xC000
   4B79 E5            [11] 1041 	push	hl
   4B7A CD 34 6E      [17] 1042 	call	_cpct_getScreenPtr
   4B7D C1            [10] 1043 	pop	bc
                           1044 ;src/draws.h:71: p+=3;
   4B7E 03            [ 6] 1045 	inc	bc
   4B7F 03            [ 6] 1046 	inc	bc
   4B80 03            [ 6] 1047 	inc	bc
                           1048 ;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4B81 EB            [ 4] 1049 	ex	de,hl
   4B82 DD 7E 04      [19] 1050 	ld	a,4 (ix)
   4B85 DD 96 FF      [19] 1051 	sub	a, -1 (ix)
   4B88 38 10         [12] 1052 	jr	C,00102$
   4B8A C5            [11] 1053 	push	bc
   4B8B 21 02 08      [10] 1054 	ld	hl,#0x0802
   4B8E E5            [11] 1055 	push	hl
   4B8F D5            [11] 1056 	push	de
   4B90 21 B5 69      [10] 1057 	ld	hl,#_flecha_arriba
   4B93 E5            [11] 1058 	push	hl
   4B94 CD D0 6C      [17] 1059 	call	_cpct_drawSpriteMasked
   4B97 C1            [10] 1060 	pop	bc
   4B98 18 10         [12] 1061 	jr	00106$
   4B9A                    1062 00102$:
                           1063 ;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
   4B9A C5            [11] 1064 	push	bc
   4B9B 21 02 08      [10] 1065 	ld	hl,#0x0802
   4B9E E5            [11] 1066 	push	hl
   4B9F AF            [ 4] 1067 	xor	a, a
   4BA0 F5            [11] 1068 	push	af
   4BA1 33            [ 6] 1069 	inc	sp
   4BA2 D5            [11] 1070 	push	de
   4BA3 CD 63 6D      [17] 1071 	call	_cpct_drawSolidBox
   4BA6 F1            [10] 1072 	pop	af
   4BA7 F1            [10] 1073 	pop	af
   4BA8 33            [ 6] 1074 	inc	sp
   4BA9 C1            [10] 1075 	pop	bc
   4BAA                    1076 00106$:
                           1077 ;src/draws.h:69: for(i=1;i<=3;i++){
   4BAA DD 34 FF      [23] 1078 	inc	-1 (ix)
   4BAD 3E 03         [ 7] 1079 	ld	a,#0x03
   4BAF DD 96 FF      [19] 1080 	sub	a, -1 (ix)
   4BB2 30 BA         [12] 1081 	jr	NC,00105$
   4BB4 33            [ 6] 1082 	inc	sp
   4BB5 DD E1         [14] 1083 	pop	ix
   4BB7 C9            [10] 1084 	ret
                           1085 ;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1086 ;	---------------------------------
                           1087 ; Function draw
                           1088 ; ---------------------------------
   4BB8                    1089 _draw::
                           1090 ;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
   4BB8 21 03 00      [10] 1091 	ld	hl, #3+0
   4BBB 39            [11] 1092 	add	hl, sp
   4BBC 7E            [ 7] 1093 	ld	a, (hl)
   4BBD F5            [11] 1094 	push	af
   4BBE 33            [ 6] 1095 	inc	sp
   4BBF 21 03 00      [10] 1096 	ld	hl, #3+0
   4BC2 39            [11] 1097 	add	hl, sp
   4BC3 7E            [ 7] 1098 	ld	a, (hl)
   4BC4 F5            [11] 1099 	push	af
   4BC5 33            [ 6] 1100 	inc	sp
   4BC6 21 00 C0      [10] 1101 	ld	hl,#0xC000
   4BC9 E5            [11] 1102 	push	hl
   4BCA CD 34 6E      [17] 1103 	call	_cpct_getScreenPtr
   4BCD EB            [ 4] 1104 	ex	de,hl
                           1105 ;src/draws.h:84: switch(mode){
   4BCE 3E 02         [ 7] 1106 	ld	a,#0x02
   4BD0 FD 21 06 00   [14] 1107 	ld	iy,#6
   4BD4 FD 39         [15] 1108 	add	iy,sp
   4BD6 FD 96 00      [19] 1109 	sub	a, 0 (iy)
   4BD9 D8            [11] 1110 	ret	C
                           1111 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BDA 21 04 00      [10] 1112 	ld	hl, #4
   4BDD 39            [11] 1113 	add	hl, sp
   4BDE 4E            [ 7] 1114 	ld	c, (hl)
   4BDF 23            [ 6] 1115 	inc	hl
   4BE0 46            [ 7] 1116 	ld	b, (hl)
                           1117 ;src/draws.h:84: switch(mode){
   4BE1 D5            [11] 1118 	push	de
   4BE2 FD 21 08 00   [14] 1119 	ld	iy,#8
   4BE6 FD 39         [15] 1120 	add	iy,sp
   4BE8 FD 5E 00      [19] 1121 	ld	e,0 (iy)
   4BEB 16 00         [ 7] 1122 	ld	d,#0x00
   4BED 21 F4 4B      [10] 1123 	ld	hl,#00111$
   4BF0 19            [11] 1124 	add	hl,de
   4BF1 19            [11] 1125 	add	hl,de
                           1126 ;src/draws.h:85: case 0:
   4BF2 D1            [10] 1127 	pop	de
   4BF3 E9            [ 4] 1128 	jp	(hl)
   4BF4                    1129 00111$:
   4BF4 18 04         [12] 1130 	jr	00101$
   4BF6 18 0C         [12] 1131 	jr	00102$
   4BF8 18 14         [12] 1132 	jr	00103$
   4BFA                    1133 00101$:
                           1134 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BFA 21 04 10      [10] 1135 	ld	hl,#0x1004
   4BFD E5            [11] 1136 	push	hl
   4BFE D5            [11] 1137 	push	de
   4BFF C5            [11] 1138 	push	bc
   4C00 CD D0 6C      [17] 1139 	call	_cpct_drawSpriteMasked
                           1140 ;src/draws.h:87: break;
   4C03 C9            [10] 1141 	ret
                           1142 ;src/draws.h:88: case 1:
   4C04                    1143 00102$:
                           1144 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4C04 21 02 08      [10] 1145 	ld	hl,#0x0802
   4C07 E5            [11] 1146 	push	hl
   4C08 D5            [11] 1147 	push	de
   4C09 C5            [11] 1148 	push	bc
   4C0A CD D0 6C      [17] 1149 	call	_cpct_drawSpriteMasked
                           1150 ;src/draws.h:90: break;
   4C0D C9            [10] 1151 	ret
                           1152 ;src/draws.h:91: case 2:
   4C0E                    1153 00103$:
                           1154 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4C0E 21 04 04      [10] 1155 	ld	hl,#0x0404
   4C11 E5            [11] 1156 	push	hl
   4C12 D5            [11] 1157 	push	de
   4C13 C5            [11] 1158 	push	bc
   4C14 CD D0 6C      [17] 1159 	call	_cpct_drawSpriteMasked
                           1160 ;src/draws.h:94: }
   4C17 C9            [10] 1161 	ret
                           1162 ;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
                           1163 ;	---------------------------------
                           1164 ; Function erase
                           1165 ; ---------------------------------
   4C18                    1166 _erase::
                           1167 ;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
   4C18 21 03 00      [10] 1168 	ld	hl, #3+0
   4C1B 39            [11] 1169 	add	hl, sp
   4C1C 7E            [ 7] 1170 	ld	a, (hl)
   4C1D F5            [11] 1171 	push	af
   4C1E 33            [ 6] 1172 	inc	sp
   4C1F 21 03 00      [10] 1173 	ld	hl, #3+0
   4C22 39            [11] 1174 	add	hl, sp
   4C23 7E            [ 7] 1175 	ld	a, (hl)
   4C24 F5            [11] 1176 	push	af
   4C25 33            [ 6] 1177 	inc	sp
   4C26 21 00 C0      [10] 1178 	ld	hl,#0xC000
   4C29 E5            [11] 1179 	push	hl
   4C2A CD 34 6E      [17] 1180 	call	_cpct_getScreenPtr
   4C2D 4D            [ 4] 1181 	ld	c, l
   4C2E 44            [ 4] 1182 	ld	b, h
                           1183 ;src/draws.h:102: switch(mode){
   4C2F 3E 02         [ 7] 1184 	ld	a,#0x02
   4C31 FD 21 04 00   [14] 1185 	ld	iy,#4
   4C35 FD 39         [15] 1186 	add	iy,sp
   4C37 FD 96 00      [19] 1187 	sub	a, 0 (iy)
   4C3A D8            [11] 1188 	ret	C
                           1189 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
                           1190 ;src/draws.h:102: switch(mode){
   4C3B FD 5E 00      [19] 1191 	ld	e,0 (iy)
   4C3E 16 00         [ 7] 1192 	ld	d,#0x00
   4C40 21 46 4C      [10] 1193 	ld	hl,#00111$
   4C43 19            [11] 1194 	add	hl,de
   4C44 19            [11] 1195 	add	hl,de
                           1196 ;src/draws.h:103: case 0:
   4C45 E9            [ 4] 1197 	jp	(hl)
   4C46                    1198 00111$:
   4C46 18 04         [12] 1199 	jr	00101$
   4C48 18 11         [12] 1200 	jr	00102$
   4C4A 18 1E         [12] 1201 	jr	00103$
   4C4C                    1202 00101$:
                           1203 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
   4C4C 21 04 10      [10] 1204 	ld	hl,#0x1004
   4C4F E5            [11] 1205 	push	hl
   4C50 AF            [ 4] 1206 	xor	a, a
   4C51 F5            [11] 1207 	push	af
   4C52 33            [ 6] 1208 	inc	sp
   4C53 C5            [11] 1209 	push	bc
   4C54 CD 63 6D      [17] 1210 	call	_cpct_drawSolidBox
   4C57 F1            [10] 1211 	pop	af
   4C58 F1            [10] 1212 	pop	af
   4C59 33            [ 6] 1213 	inc	sp
                           1214 ;src/draws.h:105: break;
   4C5A C9            [10] 1215 	ret
                           1216 ;src/draws.h:106: case 1:
   4C5B                    1217 00102$:
                           1218 ;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
   4C5B 21 02 08      [10] 1219 	ld	hl,#0x0802
   4C5E E5            [11] 1220 	push	hl
   4C5F AF            [ 4] 1221 	xor	a, a
   4C60 F5            [11] 1222 	push	af
   4C61 33            [ 6] 1223 	inc	sp
   4C62 C5            [11] 1224 	push	bc
   4C63 CD 63 6D      [17] 1225 	call	_cpct_drawSolidBox
   4C66 F1            [10] 1226 	pop	af
   4C67 F1            [10] 1227 	pop	af
   4C68 33            [ 6] 1228 	inc	sp
                           1229 ;src/draws.h:108: break;
   4C69 C9            [10] 1230 	ret
                           1231 ;src/draws.h:109: case 2:
   4C6A                    1232 00103$:
                           1233 ;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
   4C6A 21 04 04      [10] 1234 	ld	hl,#0x0404
   4C6D E5            [11] 1235 	push	hl
   4C6E AF            [ 4] 1236 	xor	a, a
   4C6F F5            [11] 1237 	push	af
   4C70 33            [ 6] 1238 	inc	sp
   4C71 C5            [11] 1239 	push	bc
   4C72 CD 63 6D      [17] 1240 	call	_cpct_drawSolidBox
   4C75 F1            [10] 1241 	pop	af
   4C76 F1            [10] 1242 	pop	af
   4C77 33            [ 6] 1243 	inc	sp
                           1244 ;src/draws.h:112: }
   4C78 C9            [10] 1245 	ret
                           1246 ;src/draws.h:115: void drawStats(){
                           1247 ;	---------------------------------
                           1248 ; Function drawStats
                           1249 ; ---------------------------------
   4C79                    1250 _drawStats::
                           1251 ;src/draws.h:116: drawVida(player.life,1);
   4C79 21 36 70      [10] 1252 	ld	hl, #_player + 6
   4C7C 56            [ 7] 1253 	ld	d,(hl)
   4C7D 3E 01         [ 7] 1254 	ld	a,#0x01
   4C7F F5            [11] 1255 	push	af
   4C80 33            [ 6] 1256 	inc	sp
   4C81 D5            [11] 1257 	push	de
   4C82 33            [ 6] 1258 	inc	sp
   4C83 CD FB 4A      [17] 1259 	call	_drawVida
   4C86 F1            [10] 1260 	pop	af
                           1261 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C87 21 3A 70      [10] 1262 	ld	hl, #_player + 10
   4C8A 56            [ 7] 1263 	ld	d,(hl)
   4C8B 3E 10         [ 7] 1264 	ld	a,#0x10
   4C8D F5            [11] 1265 	push	af
   4C8E 33            [ 6] 1266 	inc	sp
   4C8F D5            [11] 1267 	push	de
   4C90 33            [ 6] 1268 	inc	sp
   4C91 CD 5C 4B      [17] 1269 	call	_drawBullets
   4C94 F1            [10] 1270 	pop	af
                           1271 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C95 21 45 70      [10] 1272 	ld	hl, #_enemy + 10
   4C98 56            [ 7] 1273 	ld	d,(hl)
   4C99 3E 38         [ 7] 1274 	ld	a,#0x38
   4C9B F5            [11] 1275 	push	af
   4C9C 33            [ 6] 1276 	inc	sp
   4C9D D5            [11] 1277 	push	de
   4C9E 33            [ 6] 1278 	inc	sp
   4C9F CD 5C 4B      [17] 1279 	call	_drawBullets
   4CA2 F1            [10] 1280 	pop	af
                           1281 ;src/draws.h:119: drawVida(enemy.life,65);
   4CA3 21 43 70      [10] 1282 	ld	hl, #_enemy + 8
   4CA6 56            [ 7] 1283 	ld	d,(hl)
   4CA7 3E 41         [ 7] 1284 	ld	a,#0x41
   4CA9 F5            [11] 1285 	push	af
   4CAA 33            [ 6] 1286 	inc	sp
   4CAB D5            [11] 1287 	push	de
   4CAC 33            [ 6] 1288 	inc	sp
   4CAD CD FB 4A      [17] 1289 	call	_drawVida
   4CB0 F1            [10] 1290 	pop	af
   4CB1 C9            [10] 1291 	ret
                           1292 ;src/draws.h:124: void draws(){
                           1293 ;	---------------------------------
                           1294 ; Function draws
                           1295 ; ---------------------------------
   4CB2                    1296 _draws::
   4CB2 DD E5         [15] 1297 	push	ix
   4CB4 DD 21 00 00   [14] 1298 	ld	ix,#0
   4CB8 DD 39         [15] 1299 	add	ix,sp
   4CBA 3B            [ 6] 1300 	dec	sp
                           1301 ;src/draws.h:126: if(temp%2 == 0)
   4CBB FD 21 1A 70   [14] 1302 	ld	iy,#_temp
   4CBF FD CB 00 46   [20] 1303 	bit	0, 0 (iy)
   4CC3 20 17         [12] 1304 	jr	NZ,00102$
                           1305 ;src/draws.h:127: draw(player.x,player.y,player.sprite,0);
   4CC5 ED 5B 34 70   [20] 1306 	ld	de, (#_player + 4)
   4CC9 21 31 70      [10] 1307 	ld	hl, #_player + 1
   4CCC 46            [ 7] 1308 	ld	b,(hl)
   4CCD 21 30 70      [10] 1309 	ld	hl, #_player + 0
   4CD0 4E            [ 7] 1310 	ld	c,(hl)
   4CD1 AF            [ 4] 1311 	xor	a, a
   4CD2 F5            [11] 1312 	push	af
   4CD3 33            [ 6] 1313 	inc	sp
   4CD4 D5            [11] 1314 	push	de
   4CD5 C5            [11] 1315 	push	bc
   4CD6 CD B8 4B      [17] 1316 	call	_draw
   4CD9 F1            [10] 1317 	pop	af
   4CDA F1            [10] 1318 	pop	af
   4CDB 33            [ 6] 1319 	inc	sp
   4CDC                    1320 00102$:
                           1321 ;src/draws.h:128: if(enemy.life > 0 && temp%2 == 1)
   4CDC 11 3B 70      [10] 1322 	ld	de,#_enemy+0
   4CDF 3A 43 70      [13] 1323 	ld	a, (#_enemy + 8)
   4CE2 B7            [ 4] 1324 	or	a, a
   4CE3 28 23         [12] 1325 	jr	Z,00104$
   4CE5 3A 1A 70      [13] 1326 	ld	a,(#_temp + 0)
   4CE8 E6 01         [ 7] 1327 	and	a, #0x01
   4CEA 3D            [ 4] 1328 	dec	a
   4CEB 20 1B         [12] 1329 	jr	NZ,00104$
                           1330 ;src/draws.h:129: draw(enemy.x,enemy.y,enemy.sprite,0);
   4CED ED 4B 41 70   [20] 1331 	ld	bc, (#_enemy + 6)
   4CF1 6B            [ 4] 1332 	ld	l, e
   4CF2 62            [ 4] 1333 	ld	h, d
   4CF3 23            [ 6] 1334 	inc	hl
   4CF4 7E            [ 7] 1335 	ld	a,(hl)
   4CF5 DD 77 FF      [19] 1336 	ld	-1 (ix),a
   4CF8 1A            [ 7] 1337 	ld	a,(de)
   4CF9 5F            [ 4] 1338 	ld	e,a
   4CFA AF            [ 4] 1339 	xor	a, a
   4CFB F5            [11] 1340 	push	af
   4CFC 33            [ 6] 1341 	inc	sp
   4CFD C5            [11] 1342 	push	bc
   4CFE DD 56 FF      [19] 1343 	ld	d, -1 (ix)
   4D01 D5            [11] 1344 	push	de
   4D02 CD B8 4B      [17] 1345 	call	_draw
   4D05 F1            [10] 1346 	pop	af
   4D06 F1            [10] 1347 	pop	af
   4D07 33            [ 6] 1348 	inc	sp
   4D08                    1349 00104$:
                           1350 ;src/draws.h:130: if(arrow == 1){
   4D08 3A 1E 70      [13] 1351 	ld	a,(#_arrow + 0)
   4D0B 3D            [ 4] 1352 	dec	a
   4D0C 20 5C         [12] 1353 	jr	NZ,00116$
                           1354 ;src/draws.h:131: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4D0E 21 2D 70      [10] 1355 	ld	hl, #_object + 7
   4D11 5E            [ 7] 1356 	ld	e,(hl)
                           1357 ;src/draws.h:132: draw(object.x,object.y,object.sprite,2);
   4D12 01 27 70      [10] 1358 	ld	bc,#_object + 1
                           1359 ;src/draws.h:131: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4D15 7B            [ 4] 1360 	ld	a,e
   4D16 D6 04         [ 7] 1361 	sub	a, #0x04
   4D18 28 0C         [12] 1362 	jr	Z,00110$
   4D1A 21 2C 70      [10] 1363 	ld	hl,#_object + 6
   4D1D 7B            [ 4] 1364 	ld	a,e
   4D1E D6 06         [ 7] 1365 	sub	a, #0x06
   4D20 20 25         [12] 1366 	jr	NZ,00111$
   4D22 7E            [ 7] 1367 	ld	a,(hl)
   4D23 3D            [ 4] 1368 	dec	a
   4D24 20 21         [12] 1369 	jr	NZ,00111$
   4D26                    1370 00110$:
                           1371 ;src/draws.h:132: draw(object.x,object.y,object.sprite,2);
   4D26 ED 5B 2A 70   [20] 1372 	ld	de, (#(_object + 0x0004) + 0)
   4D2A 0A            [ 7] 1373 	ld	a,(bc)
   4D2B DD 77 FF      [19] 1374 	ld	-1 (ix),a
   4D2E 21 26 70      [10] 1375 	ld	hl, #_object + 0
   4D31 4E            [ 7] 1376 	ld	c,(hl)
   4D32 3E 02         [ 7] 1377 	ld	a,#0x02
   4D34 F5            [11] 1378 	push	af
   4D35 33            [ 6] 1379 	inc	sp
   4D36 D5            [11] 1380 	push	de
   4D37 DD 7E FF      [19] 1381 	ld	a,-1 (ix)
   4D3A F5            [11] 1382 	push	af
   4D3B 33            [ 6] 1383 	inc	sp
   4D3C 79            [ 4] 1384 	ld	a,c
   4D3D F5            [11] 1385 	push	af
   4D3E 33            [ 6] 1386 	inc	sp
   4D3F CD B8 4B      [17] 1387 	call	_draw
   4D42 F1            [10] 1388 	pop	af
   4D43 F1            [10] 1389 	pop	af
   4D44 33            [ 6] 1390 	inc	sp
   4D45 18 23         [12] 1391 	jr	00116$
   4D47                    1392 00111$:
                           1393 ;src/draws.h:133: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4D47 7B            [ 4] 1394 	ld	a,e
   4D48 FE 02         [ 7] 1395 	cp	a,#0x02
   4D4A 28 08         [12] 1396 	jr	Z,00106$
   4D4C D6 08         [ 7] 1397 	sub	a, #0x08
   4D4E 20 1A         [12] 1398 	jr	NZ,00116$
   4D50 7E            [ 7] 1399 	ld	a,(hl)
   4D51 3D            [ 4] 1400 	dec	a
   4D52 20 16         [12] 1401 	jr	NZ,00116$
   4D54                    1402 00106$:
                           1403 ;src/draws.h:134: draw(object.x,object.y,object.sprite,1);
   4D54 ED 5B 2A 70   [20] 1404 	ld	de, (#(_object + 0x0004) + 0)
   4D58 0A            [ 7] 1405 	ld	a,(bc)
   4D59 47            [ 4] 1406 	ld	b,a
   4D5A 21 26 70      [10] 1407 	ld	hl, #_object + 0
   4D5D 4E            [ 7] 1408 	ld	c,(hl)
   4D5E 3E 01         [ 7] 1409 	ld	a,#0x01
   4D60 F5            [11] 1410 	push	af
   4D61 33            [ 6] 1411 	inc	sp
   4D62 D5            [11] 1412 	push	de
   4D63 C5            [11] 1413 	push	bc
   4D64 CD B8 4B      [17] 1414 	call	_draw
   4D67 F1            [10] 1415 	pop	af
   4D68 F1            [10] 1416 	pop	af
   4D69 33            [ 6] 1417 	inc	sp
   4D6A                    1418 00116$:
                           1419 ;src/draws.h:136: drawStats();
   4D6A CD 79 4C      [17] 1420 	call	_drawStats
   4D6D 33            [ 6] 1421 	inc	sp
   4D6E DD E1         [14] 1422 	pop	ix
   4D70 C9            [10] 1423 	ret
                           1424 ;src/draws.h:139: void erases(){
                           1425 ;	---------------------------------
                           1426 ; Function erases
                           1427 ; ---------------------------------
   4D71                    1428 _erases::
                           1429 ;src/draws.h:141: if(temp%2 == 0)
   4D71 FD 21 1A 70   [14] 1430 	ld	iy,#_temp
   4D75 FD CB 00 46   [20] 1431 	bit	0, 0 (iy)
   4D79 20 14         [12] 1432 	jr	NZ,00102$
                           1433 ;src/draws.h:142: erase(player.lx,player.ly,0);
   4D7B 21 33 70      [10] 1434 	ld	hl, #_player + 3
   4D7E 56            [ 7] 1435 	ld	d,(hl)
   4D7F 21 32 70      [10] 1436 	ld	hl, #_player + 2
   4D82 46            [ 7] 1437 	ld	b,(hl)
   4D83 AF            [ 4] 1438 	xor	a, a
   4D84 F5            [11] 1439 	push	af
   4D85 33            [ 6] 1440 	inc	sp
   4D86 D5            [11] 1441 	push	de
   4D87 33            [ 6] 1442 	inc	sp
   4D88 C5            [11] 1443 	push	bc
   4D89 33            [ 6] 1444 	inc	sp
   4D8A CD 18 4C      [17] 1445 	call	_erase
   4D8D F1            [10] 1446 	pop	af
   4D8E 33            [ 6] 1447 	inc	sp
   4D8F                    1448 00102$:
                           1449 ;src/draws.h:143: if(temp%2 == 1 && enemy.life > 0)
   4D8F 3A 1A 70      [13] 1450 	ld	a,(#_temp + 0)
   4D92 E6 01         [ 7] 1451 	and	a, #0x01
   4D94 3D            [ 4] 1452 	dec	a
   4D95 20 1A         [12] 1453 	jr	NZ,00104$
   4D97 3A 43 70      [13] 1454 	ld	a, (#_enemy + 8)
   4D9A B7            [ 4] 1455 	or	a, a
   4D9B 28 14         [12] 1456 	jr	Z,00104$
                           1457 ;src/draws.h:144: erase(enemy.lx,enemy.ly,0);
   4D9D 21 3E 70      [10] 1458 	ld	hl, #_enemy + 3
   4DA0 56            [ 7] 1459 	ld	d,(hl)
   4DA1 21 3D 70      [10] 1460 	ld	hl, #_enemy + 2
   4DA4 46            [ 7] 1461 	ld	b,(hl)
   4DA5 AF            [ 4] 1462 	xor	a, a
   4DA6 F5            [11] 1463 	push	af
   4DA7 33            [ 6] 1464 	inc	sp
   4DA8 D5            [11] 1465 	push	de
   4DA9 33            [ 6] 1466 	inc	sp
   4DAA C5            [11] 1467 	push	bc
   4DAB 33            [ 6] 1468 	inc	sp
   4DAC CD 18 4C      [17] 1469 	call	_erase
   4DAF F1            [10] 1470 	pop	af
   4DB0 33            [ 6] 1471 	inc	sp
   4DB1                    1472 00104$:
                           1473 ;src/draws.h:145: if(arrow == 1){
   4DB1 3A 1E 70      [13] 1474 	ld	a,(#_arrow + 0)
   4DB4 3D            [ 4] 1475 	dec	a
   4DB5 C0            [11] 1476 	ret	NZ
                           1477 ;src/draws.h:146: if(object.dir == 4 || object.dir == 6)
   4DB6 21 2D 70      [10] 1478 	ld	hl, #_object + 7
   4DB9 5E            [ 7] 1479 	ld	e,(hl)
                           1480 ;src/draws.h:147: erase(object.lx,object.ly,2);
   4DBA 21 29 70      [10] 1481 	ld	hl, #_object + 3
   4DBD 56            [ 7] 1482 	ld	d,(hl)
   4DBE 21 28 70      [10] 1483 	ld	hl, #_object + 2
   4DC1 46            [ 7] 1484 	ld	b,(hl)
                           1485 ;src/draws.h:146: if(object.dir == 4 || object.dir == 6)
   4DC2 7B            [ 4] 1486 	ld	a,e
   4DC3 FE 04         [ 7] 1487 	cp	a,#0x04
   4DC5 28 04         [12] 1488 	jr	Z,00106$
   4DC7 D6 06         [ 7] 1489 	sub	a, #0x06
   4DC9 20 0F         [12] 1490 	jr	NZ,00107$
   4DCB                    1491 00106$:
                           1492 ;src/draws.h:147: erase(object.lx,object.ly,2);
   4DCB 3E 02         [ 7] 1493 	ld	a,#0x02
   4DCD F5            [11] 1494 	push	af
   4DCE 33            [ 6] 1495 	inc	sp
   4DCF D5            [11] 1496 	push	de
   4DD0 33            [ 6] 1497 	inc	sp
   4DD1 C5            [11] 1498 	push	bc
   4DD2 33            [ 6] 1499 	inc	sp
   4DD3 CD 18 4C      [17] 1500 	call	_erase
   4DD6 F1            [10] 1501 	pop	af
   4DD7 33            [ 6] 1502 	inc	sp
   4DD8 18 0D         [12] 1503 	jr	00108$
   4DDA                    1504 00107$:
                           1505 ;src/draws.h:149: erase(object.lx,object.ly,1);
   4DDA 3E 01         [ 7] 1506 	ld	a,#0x01
   4DDC F5            [11] 1507 	push	af
   4DDD 33            [ 6] 1508 	inc	sp
   4DDE D5            [11] 1509 	push	de
   4DDF 33            [ 6] 1510 	inc	sp
   4DE0 C5            [11] 1511 	push	bc
   4DE1 33            [ 6] 1512 	inc	sp
   4DE2 CD 18 4C      [17] 1513 	call	_erase
   4DE5 F1            [10] 1514 	pop	af
   4DE6 33            [ 6] 1515 	inc	sp
   4DE7                    1516 00108$:
                           1517 ;src/draws.h:150: if(bound == 1) arrow = 0;
   4DE7 3A 20 70      [13] 1518 	ld	a,(#_bound + 0)
   4DEA 3D            [ 4] 1519 	dec	a
   4DEB C0            [11] 1520 	ret	NZ
   4DEC 21 1E 70      [10] 1521 	ld	hl,#_arrow + 0
   4DEF 36 00         [10] 1522 	ld	(hl), #0x00
   4DF1 C9            [10] 1523 	ret
                           1524 ;src/draws.h:157: void drawFatiga(u8 atk, u8 col){
                           1525 ;	---------------------------------
                           1526 ; Function drawFatiga
                           1527 ; ---------------------------------
   4DF2                    1528 _drawFatiga::
   4DF2 DD E5         [15] 1529 	push	ix
   4DF4 DD 21 00 00   [14] 1530 	ld	ix,#0
   4DF8 DD 39         [15] 1531 	add	ix,sp
   4DFA F5            [11] 1532 	push	af
                           1533 ;src/draws.h:159: if(atk < 20)
   4DFB DD 7E 04      [19] 1534 	ld	a,4 (ix)
   4DFE D6 14         [ 7] 1535 	sub	a, #0x14
   4E00 30 04         [12] 1536 	jr	NC,00102$
                           1537 ;src/draws.h:160: col = 2;
   4E02 DD 36 05 02   [19] 1538 	ld	5 (ix),#0x02
   4E06                    1539 00102$:
                           1540 ;src/draws.h:161: if(atk > 30 || atk <= 20){
   4E06 3E 14         [ 7] 1541 	ld	a,#0x14
   4E08 DD 96 04      [19] 1542 	sub	a, 4 (ix)
   4E0B 3E 00         [ 7] 1543 	ld	a,#0x00
   4E0D 17            [ 4] 1544 	rla
   4E0E DD 77 FF      [19] 1545 	ld	-1 (ix),a
                           1546 ;src/draws.h:163: switch(col){
   4E11 3E 02         [ 7] 1547 	ld	a,#0x02
   4E13 DD 96 05      [19] 1548 	sub	a, 5 (ix)
   4E16 3E 00         [ 7] 1549 	ld	a,#0x00
   4E18 17            [ 4] 1550 	rla
   4E19 DD 77 FE      [19] 1551 	ld	-2 (ix),a
                           1552 ;src/draws.h:161: if(atk > 30 || atk <= 20){
   4E1C 3E 1E         [ 7] 1553 	ld	a,#0x1E
   4E1E DD 96 04      [19] 1554 	sub	a, 4 (ix)
   4E21 38 06         [12] 1555 	jr	C,00107$
   4E23 DD 7E FF      [19] 1556 	ld	a,-1 (ix)
   4E26 B7            [ 4] 1557 	or	a, a
   4E27 20 4F         [12] 1558 	jr	NZ,00108$
   4E29                    1559 00107$:
                           1560 ;src/draws.h:162: memptr = cpct_getScreenPtr(VMEM,28,192);
   4E29 21 1C C0      [10] 1561 	ld	hl,#0xC01C
   4E2C E5            [11] 1562 	push	hl
   4E2D 2E 00         [ 7] 1563 	ld	l, #0x00
   4E2F E5            [11] 1564 	push	hl
   4E30 CD 34 6E      [17] 1565 	call	_cpct_getScreenPtr
                           1566 ;src/draws.h:163: switch(col){
   4E33 DD 7E FE      [19] 1567 	ld	a,-2 (ix)
   4E36 B7            [ 4] 1568 	or	a, a
   4E37 20 3F         [12] 1569 	jr	NZ,00108$
                           1570 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E39 4D            [ 4] 1571 	ld	c, l
   4E3A 44            [ 4] 1572 	ld	b, h
                           1573 ;src/draws.h:163: switch(col){
   4E3B DD 5E 05      [19] 1574 	ld	e,5 (ix)
   4E3E 16 00         [ 7] 1575 	ld	d,#0x00
   4E40 21 46 4E      [10] 1576 	ld	hl,#00156$
   4E43 19            [11] 1577 	add	hl,de
   4E44 19            [11] 1578 	add	hl,de
                           1579 ;src/draws.h:164: case 0:
   4E45 E9            [ 4] 1580 	jp	(hl)
   4E46                    1581 00156$:
   4E46 18 04         [12] 1582 	jr	00103$
   4E48 18 14         [12] 1583 	jr	00104$
   4E4A 18 20         [12] 1584 	jr	00105$
   4E4C                    1585 00103$:
                           1586 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E4C 21 02 08      [10] 1587 	ld	hl,#0x0802
   4E4F E5            [11] 1588 	push	hl
   4E50 DD 7E 05      [19] 1589 	ld	a,5 (ix)
   4E53 F5            [11] 1590 	push	af
   4E54 33            [ 6] 1591 	inc	sp
   4E55 C5            [11] 1592 	push	bc
   4E56 CD 63 6D      [17] 1593 	call	_cpct_drawSolidBox
   4E59 F1            [10] 1594 	pop	af
   4E5A F1            [10] 1595 	pop	af
   4E5B 33            [ 6] 1596 	inc	sp
                           1597 ;src/draws.h:166: break;
   4E5C 18 1A         [12] 1598 	jr	00108$
                           1599 ;src/draws.h:167: case 1:
   4E5E                    1600 00104$:
                           1601 ;src/draws.h:168: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E5E 11 80 46      [10] 1602 	ld	de,#_fatiga_nor
   4E61 21 02 08      [10] 1603 	ld	hl,#0x0802
   4E64 E5            [11] 1604 	push	hl
   4E65 C5            [11] 1605 	push	bc
   4E66 D5            [11] 1606 	push	de
   4E67 CD D0 6C      [17] 1607 	call	_cpct_drawSpriteMasked
                           1608 ;src/draws.h:169: break;
   4E6A 18 0C         [12] 1609 	jr	00108$
                           1610 ;src/draws.h:170: case 2:
   4E6C                    1611 00105$:
                           1612 ;src/draws.h:171: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E6C 11 A0 46      [10] 1613 	ld	de,#_fatiga_full
   4E6F 21 02 08      [10] 1614 	ld	hl,#0x0802
   4E72 E5            [11] 1615 	push	hl
   4E73 C5            [11] 1616 	push	bc
   4E74 D5            [11] 1617 	push	de
   4E75 CD D0 6C      [17] 1618 	call	_cpct_drawSpriteMasked
                           1619 ;src/draws.h:172: }
   4E78                    1620 00108$:
                           1621 ;src/draws.h:174: if(atk > 40 || atk <= 20){
   4E78 3E 28         [ 7] 1622 	ld	a,#0x28
   4E7A DD 96 04      [19] 1623 	sub	a, 4 (ix)
   4E7D 38 06         [12] 1624 	jr	C,00114$
   4E7F DD 7E FF      [19] 1625 	ld	a,-1 (ix)
   4E82 B7            [ 4] 1626 	or	a, a
   4E83 20 4F         [12] 1627 	jr	NZ,00115$
   4E85                    1628 00114$:
                           1629 ;src/draws.h:175: memptr = cpct_getScreenPtr(VMEM,31,192);
   4E85 21 1F C0      [10] 1630 	ld	hl,#0xC01F
   4E88 E5            [11] 1631 	push	hl
   4E89 2E 00         [ 7] 1632 	ld	l, #0x00
   4E8B E5            [11] 1633 	push	hl
   4E8C CD 34 6E      [17] 1634 	call	_cpct_getScreenPtr
                           1635 ;src/draws.h:176: switch(col){
   4E8F DD 7E FE      [19] 1636 	ld	a,-2 (ix)
   4E92 B7            [ 4] 1637 	or	a, a
   4E93 20 3F         [12] 1638 	jr	NZ,00115$
                           1639 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E95 4D            [ 4] 1640 	ld	c, l
   4E96 44            [ 4] 1641 	ld	b, h
                           1642 ;src/draws.h:176: switch(col){
   4E97 DD 5E 05      [19] 1643 	ld	e,5 (ix)
   4E9A 16 00         [ 7] 1644 	ld	d,#0x00
   4E9C 21 A2 4E      [10] 1645 	ld	hl,#00157$
   4E9F 19            [11] 1646 	add	hl,de
   4EA0 19            [11] 1647 	add	hl,de
                           1648 ;src/draws.h:177: case 0:
   4EA1 E9            [ 4] 1649 	jp	(hl)
   4EA2                    1650 00157$:
   4EA2 18 04         [12] 1651 	jr	00110$
   4EA4 18 14         [12] 1652 	jr	00111$
   4EA6 18 20         [12] 1653 	jr	00112$
   4EA8                    1654 00110$:
                           1655 ;src/draws.h:178: cpct_drawSolidBox(memptr, col, 2, 8);
   4EA8 21 02 08      [10] 1656 	ld	hl,#0x0802
   4EAB E5            [11] 1657 	push	hl
   4EAC DD 7E 05      [19] 1658 	ld	a,5 (ix)
   4EAF F5            [11] 1659 	push	af
   4EB0 33            [ 6] 1660 	inc	sp
   4EB1 C5            [11] 1661 	push	bc
   4EB2 CD 63 6D      [17] 1662 	call	_cpct_drawSolidBox
   4EB5 F1            [10] 1663 	pop	af
   4EB6 F1            [10] 1664 	pop	af
   4EB7 33            [ 6] 1665 	inc	sp
                           1666 ;src/draws.h:179: break;
   4EB8 18 1A         [12] 1667 	jr	00115$
                           1668 ;src/draws.h:180: case 1:
   4EBA                    1669 00111$:
                           1670 ;src/draws.h:181: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4EBA 11 80 46      [10] 1671 	ld	de,#_fatiga_nor
   4EBD 21 02 08      [10] 1672 	ld	hl,#0x0802
   4EC0 E5            [11] 1673 	push	hl
   4EC1 C5            [11] 1674 	push	bc
   4EC2 D5            [11] 1675 	push	de
   4EC3 CD D0 6C      [17] 1676 	call	_cpct_drawSpriteMasked
                           1677 ;src/draws.h:182: break;
   4EC6 18 0C         [12] 1678 	jr	00115$
                           1679 ;src/draws.h:183: case 2:
   4EC8                    1680 00112$:
                           1681 ;src/draws.h:184: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4EC8 11 A0 46      [10] 1682 	ld	de,#_fatiga_full
   4ECB 21 02 08      [10] 1683 	ld	hl,#0x0802
   4ECE E5            [11] 1684 	push	hl
   4ECF C5            [11] 1685 	push	bc
   4ED0 D5            [11] 1686 	push	de
   4ED1 CD D0 6C      [17] 1687 	call	_cpct_drawSpriteMasked
                           1688 ;src/draws.h:185: }
   4ED4                    1689 00115$:
                           1690 ;src/draws.h:187: if(atk <= 20){
   4ED4 DD 7E FF      [19] 1691 	ld	a,-1 (ix)
   4ED7 B7            [ 4] 1692 	or	a, a
   4ED8 20 39         [12] 1693 	jr	NZ,00122$
                           1694 ;src/draws.h:188: memptr = cpct_getScreenPtr(VMEM,34,192);
   4EDA 21 22 C0      [10] 1695 	ld	hl,#0xC022
   4EDD E5            [11] 1696 	push	hl
   4EDE 2E 00         [ 7] 1697 	ld	l, #0x00
   4EE0 E5            [11] 1698 	push	hl
   4EE1 CD 34 6E      [17] 1699 	call	_cpct_getScreenPtr
                           1700 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4EE4 4D            [ 4] 1701 	ld	c, l
   4EE5 44            [ 4] 1702 	ld	b, h
                           1703 ;src/draws.h:189: switch(col){
   4EE6 DD 7E 05      [19] 1704 	ld	a,5 (ix)
   4EE9 B7            [ 4] 1705 	or	a, a
   4EEA 28 09         [12] 1706 	jr	Z,00117$
   4EEC DD 7E 05      [19] 1707 	ld	a,5 (ix)
   4EEF D6 02         [ 7] 1708 	sub	a, #0x02
   4EF1 28 14         [12] 1709 	jr	Z,00118$
   4EF3 18 1E         [12] 1710 	jr	00122$
                           1711 ;src/draws.h:190: case 0:
   4EF5                    1712 00117$:
                           1713 ;src/draws.h:191: cpct_drawSolidBox(memptr, col, 2, 8);
   4EF5 21 02 08      [10] 1714 	ld	hl,#0x0802
   4EF8 E5            [11] 1715 	push	hl
   4EF9 DD 7E 05      [19] 1716 	ld	a,5 (ix)
   4EFC F5            [11] 1717 	push	af
   4EFD 33            [ 6] 1718 	inc	sp
   4EFE C5            [11] 1719 	push	bc
   4EFF CD 63 6D      [17] 1720 	call	_cpct_drawSolidBox
   4F02 F1            [10] 1721 	pop	af
   4F03 F1            [10] 1722 	pop	af
   4F04 33            [ 6] 1723 	inc	sp
                           1724 ;src/draws.h:192: break;
   4F05 18 0C         [12] 1725 	jr	00122$
                           1726 ;src/draws.h:193: case 2:
   4F07                    1727 00118$:
                           1728 ;src/draws.h:194: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4F07 11 A0 46      [10] 1729 	ld	de,#_fatiga_full
   4F0A 21 02 08      [10] 1730 	ld	hl,#0x0802
   4F0D E5            [11] 1731 	push	hl
   4F0E C5            [11] 1732 	push	bc
   4F0F D5            [11] 1733 	push	de
   4F10 CD D0 6C      [17] 1734 	call	_cpct_drawSpriteMasked
                           1735 ;src/draws.h:195: }
   4F13                    1736 00122$:
   4F13 DD F9         [10] 1737 	ld	sp, ix
   4F15 DD E1         [14] 1738 	pop	ix
   4F17 C9            [10] 1739 	ret
                           1740 ;src/draws.h:200: void drawPickUps(u8 corazon, u8 bullet){
                           1741 ;	---------------------------------
                           1742 ; Function drawPickUps
                           1743 ; ---------------------------------
   4F18                    1744 _drawPickUps::
   4F18 DD E5         [15] 1745 	push	ix
   4F1A DD 21 00 00   [14] 1746 	ld	ix,#0
   4F1E DD 39         [15] 1747 	add	ix,sp
                           1748 ;src/draws.h:203: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4F20 21 04 A0      [10] 1749 	ld	hl,#0xA004
   4F23 E5            [11] 1750 	push	hl
   4F24 21 00 C0      [10] 1751 	ld	hl,#0xC000
   4F27 E5            [11] 1752 	push	hl
   4F28 CD 34 6E      [17] 1753 	call	_cpct_getScreenPtr
                           1754 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F2B 4D            [ 4] 1755 	ld	c, l
   4F2C 44            [ 4] 1756 	ld	b, h
                           1757 ;src/draws.h:204: if(corazon == 0)
   4F2D DD 7E 04      [19] 1758 	ld	a,4 (ix)
   4F30 B7            [ 4] 1759 	or	a, a
   4F31 20 0E         [12] 1760 	jr	NZ,00102$
                           1761 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F33 11 00 46      [10] 1762 	ld	de,#_corazon_lleno
   4F36 21 04 08      [10] 1763 	ld	hl,#0x0804
   4F39 E5            [11] 1764 	push	hl
   4F3A C5            [11] 1765 	push	bc
   4F3B D5            [11] 1766 	push	de
   4F3C CD D0 6C      [17] 1767 	call	_cpct_drawSpriteMasked
   4F3F 18 0E         [12] 1768 	jr	00103$
   4F41                    1769 00102$:
                           1770 ;src/draws.h:207: cpct_drawSolidBox(memptr, 0, 4, 8);
   4F41 21 04 08      [10] 1771 	ld	hl,#0x0804
   4F44 E5            [11] 1772 	push	hl
   4F45 AF            [ 4] 1773 	xor	a, a
   4F46 F5            [11] 1774 	push	af
   4F47 33            [ 6] 1775 	inc	sp
   4F48 C5            [11] 1776 	push	bc
   4F49 CD 63 6D      [17] 1777 	call	_cpct_drawSolidBox
   4F4C F1            [10] 1778 	pop	af
   4F4D F1            [10] 1779 	pop	af
   4F4E 33            [ 6] 1780 	inc	sp
   4F4F                    1781 00103$:
                           1782 ;src/draws.h:209: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4F4F 21 08 10      [10] 1783 	ld	hl,#0x1008
   4F52 E5            [11] 1784 	push	hl
   4F53 21 00 C0      [10] 1785 	ld	hl,#0xC000
   4F56 E5            [11] 1786 	push	hl
   4F57 CD 34 6E      [17] 1787 	call	_cpct_getScreenPtr
                           1788 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F5A EB            [ 4] 1789 	ex	de,hl
                           1790 ;src/draws.h:210: if(bullet == 0)
   4F5B DD 7E 05      [19] 1791 	ld	a,5 (ix)
   4F5E B7            [ 4] 1792 	or	a, a
   4F5F 20 0E         [12] 1793 	jr	NZ,00105$
                           1794 ;src/draws.h:211: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4F61 01 B5 69      [10] 1795 	ld	bc,#_flecha_arriba
   4F64 21 02 08      [10] 1796 	ld	hl,#0x0802
   4F67 E5            [11] 1797 	push	hl
   4F68 D5            [11] 1798 	push	de
   4F69 C5            [11] 1799 	push	bc
   4F6A CD D0 6C      [17] 1800 	call	_cpct_drawSpriteMasked
   4F6D 18 0E         [12] 1801 	jr	00107$
   4F6F                    1802 00105$:
                           1803 ;src/draws.h:213: cpct_drawSolidBox(memptr, 0, 2, 8);
   4F6F 21 02 08      [10] 1804 	ld	hl,#0x0802
   4F72 E5            [11] 1805 	push	hl
   4F73 AF            [ 4] 1806 	xor	a, a
   4F74 F5            [11] 1807 	push	af
   4F75 33            [ 6] 1808 	inc	sp
   4F76 D5            [11] 1809 	push	de
   4F77 CD 63 6D      [17] 1810 	call	_cpct_drawSolidBox
   4F7A F1            [10] 1811 	pop	af
   4F7B F1            [10] 1812 	pop	af
   4F7C 33            [ 6] 1813 	inc	sp
   4F7D                    1814 00107$:
   4F7D DD E1         [14] 1815 	pop	ix
   4F7F C9            [10] 1816 	ret
                           1817 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1818 ;	---------------------------------
                           1819 ; Function detectPlayerRoom
                           1820 ; ---------------------------------
   4F80                    1821 _detectPlayerRoom::
   4F80 DD E5         [15] 1822 	push	ix
   4F82 DD 21 00 00   [14] 1823 	ld	ix,#0
   4F86 DD 39         [15] 1824 	add	ix,sp
                           1825 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   4F88 11 2A 6F      [10] 1826 	ld	de,#_scene+0
   4F8B DD 7E 05      [19] 1827 	ld	a,5 (ix)
   4F8E 07            [ 4] 1828 	rlca
   4F8F 07            [ 4] 1829 	rlca
   4F90 07            [ 4] 1830 	rlca
   4F91 07            [ 4] 1831 	rlca
   4F92 E6 0F         [ 7] 1832 	and	a,#0x0F
   4F94 4F            [ 4] 1833 	ld	c,a
   4F95 06 00         [ 7] 1834 	ld	b,#0x00
   4F97 69            [ 4] 1835 	ld	l, c
   4F98 60            [ 4] 1836 	ld	h, b
   4F99 29            [11] 1837 	add	hl, hl
   4F9A 29            [11] 1838 	add	hl, hl
   4F9B 09            [11] 1839 	add	hl, bc
   4F9C 29            [11] 1840 	add	hl, hl
   4F9D 29            [11] 1841 	add	hl, hl
   4F9E 19            [11] 1842 	add	hl,de
   4F9F DD 5E 04      [19] 1843 	ld	e,4 (ix)
   4FA2 CB 3B         [ 8] 1844 	srl	e
   4FA4 CB 3B         [ 8] 1845 	srl	e
   4FA6 16 00         [ 7] 1846 	ld	d,#0x00
   4FA8 19            [11] 1847 	add	hl,de
   4FA9 6E            [ 7] 1848 	ld	l,(hl)
   4FAA DD E1         [14] 1849 	pop	ix
   4FAC C9            [10] 1850 	ret
                           1851 ;src/ia.h:16: u8 chooseDirection(){
                           1852 ;	---------------------------------
                           1853 ; Function chooseDirection
                           1854 ; ---------------------------------
   4FAD                    1855 _chooseDirection::
                           1856 ;src/ia.h:18: u8 dir = 0;
   4FAD 16 00         [ 7] 1857 	ld	d,#0x00
                           1858 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   4FAF D5            [11] 1859 	push	de
   4FB0 CD CF 6A      [17] 1860 	call	_rand
   4FB3 01 04 00      [10] 1861 	ld	bc,#0x0004
   4FB6 C5            [11] 1862 	push	bc
   4FB7 E5            [11] 1863 	push	hl
   4FB8 CD 28 6E      [17] 1864 	call	__modsint
   4FBB F1            [10] 1865 	pop	af
   4FBC F1            [10] 1866 	pop	af
   4FBD D1            [10] 1867 	pop	de
   4FBE 5D            [ 4] 1868 	ld	e,l
   4FBF 1C            [ 4] 1869 	inc	e
                           1870 ;src/ia.h:20: switch(rnd){
   4FC0 7B            [ 4] 1871 	ld	a,e
   4FC1 D6 01         [ 7] 1872 	sub	a, #0x01
   4FC3 38 24         [12] 1873 	jr	C,00105$
   4FC5 3E 04         [ 7] 1874 	ld	a,#0x04
   4FC7 93            [ 4] 1875 	sub	a, e
   4FC8 38 1F         [12] 1876 	jr	C,00105$
   4FCA 1D            [ 4] 1877 	dec	e
   4FCB 16 00         [ 7] 1878 	ld	d,#0x00
   4FCD 21 D3 4F      [10] 1879 	ld	hl,#00116$
   4FD0 19            [11] 1880 	add	hl,de
   4FD1 19            [11] 1881 	add	hl,de
                           1882 ;src/ia.h:21: case 4: dir = 6;break;
   4FD2 E9            [ 4] 1883 	jp	(hl)
   4FD3                    1884 00116$:
   4FD3 18 12         [12] 1885 	jr	00104$
   4FD5 18 0C         [12] 1886 	jr	00103$
   4FD7 18 06         [12] 1887 	jr	00102$
   4FD9 18 00         [12] 1888 	jr	00101$
   4FDB                    1889 00101$:
   4FDB 16 06         [ 7] 1890 	ld	d,#0x06
   4FDD 18 0A         [12] 1891 	jr	00105$
                           1892 ;src/ia.h:22: case 3: dir = 4;break;
   4FDF                    1893 00102$:
   4FDF 16 04         [ 7] 1894 	ld	d,#0x04
   4FE1 18 06         [12] 1895 	jr	00105$
                           1896 ;src/ia.h:23: case 2: dir = 2;break;
   4FE3                    1897 00103$:
   4FE3 16 02         [ 7] 1898 	ld	d,#0x02
   4FE5 18 02         [12] 1899 	jr	00105$
                           1900 ;src/ia.h:24: case 1: dir = 8;break;
   4FE7                    1901 00104$:
   4FE7 16 08         [ 7] 1902 	ld	d,#0x08
                           1903 ;src/ia.h:25: }
   4FE9                    1904 00105$:
                           1905 ;src/ia.h:27: return dir;
   4FE9 6A            [ 4] 1906 	ld	l,d
   4FEA C9            [10] 1907 	ret
                           1908 ;src/ia.h:30: void movement(u8 dir){
                           1909 ;	---------------------------------
                           1910 ; Function movement
                           1911 ; ---------------------------------
   4FEB                    1912 _movement::
                           1913 ;src/ia.h:31: switch(dir){
   4FEB FD 21 02 00   [14] 1914 	ld	iy,#2
   4FEF FD 39         [15] 1915 	add	iy,sp
   4FF1 FD 7E 00      [19] 1916 	ld	a,0 (iy)
   4FF4 D6 02         [ 7] 1917 	sub	a, #0x02
   4FF6 28 2B         [12] 1918 	jr	Z,00104$
   4FF8 FD 7E 00      [19] 1919 	ld	a,0 (iy)
   4FFB D6 04         [ 7] 1920 	sub	a, #0x04
   4FFD 28 14         [12] 1921 	jr	Z,00102$
   4FFF FD 7E 00      [19] 1922 	ld	a,0 (iy)
   5002 D6 06         [ 7] 1923 	sub	a, #0x06
   5004 28 08         [12] 1924 	jr	Z,00101$
   5006 FD 7E 00      [19] 1925 	ld	a,0 (iy)
   5009 D6 08         [ 7] 1926 	sub	a, #0x08
   500B 28 0E         [12] 1927 	jr	Z,00103$
   500D C9            [10] 1928 	ret
                           1929 ;src/ia.h:32: case 6: enemy.x += 1; break;
   500E                    1930 00101$:
   500E 21 3B 70      [10] 1931 	ld	hl,#_enemy+0
   5011 34            [11] 1932 	inc	(hl)
   5012 C9            [10] 1933 	ret
                           1934 ;src/ia.h:33: case 4: enemy.x -= 1; break;
   5013                    1935 00102$:
   5013 11 3B 70      [10] 1936 	ld	de,#_enemy+0
   5016 1A            [ 7] 1937 	ld	a,(de)
   5017 C6 FF         [ 7] 1938 	add	a,#0xFF
   5019 12            [ 7] 1939 	ld	(de),a
   501A C9            [10] 1940 	ret
                           1941 ;src/ia.h:34: case 8: enemy.y -= 2; break;
   501B                    1942 00103$:
   501B 11 3C 70      [10] 1943 	ld	de,#_enemy+1
   501E 1A            [ 7] 1944 	ld	a,(de)
   501F C6 FE         [ 7] 1945 	add	a,#0xFE
   5021 12            [ 7] 1946 	ld	(de),a
   5022 C9            [10] 1947 	ret
                           1948 ;src/ia.h:35: case 2: enemy.y += 2; break;
   5023                    1949 00104$:
   5023 21 3C 70      [10] 1950 	ld	hl,#_enemy+1
   5026 7E            [ 7] 1951 	ld	a,(hl)
   5027 C6 02         [ 7] 1952 	add	a, #0x02
   5029 77            [ 7] 1953 	ld	(hl),a
                           1954 ;src/ia.h:36: }
   502A C9            [10] 1955 	ret
                           1956 ;src/ia.h:39: void followPlayer(){
                           1957 ;	---------------------------------
                           1958 ; Function followPlayer
                           1959 ; ---------------------------------
   502B                    1960 _followPlayer::
   502B DD E5         [15] 1961 	push	ix
   502D DD 21 00 00   [14] 1962 	ld	ix,#0
   5031 DD 39         [15] 1963 	add	ix,sp
   5033 21 E1 FF      [10] 1964 	ld	hl,#-31
   5036 39            [11] 1965 	add	hl,sp
   5037 F9            [ 6] 1966 	ld	sp,hl
                           1967 ;src/ia.h:42: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   5038 21 31 70      [10] 1968 	ld	hl, #(_player + 0x0001) + 0
   503B 56            [ 7] 1969 	ld	d,(hl)
   503C 3A 30 70      [13] 1970 	ld	a, (#_player + 0)
   503F D5            [11] 1971 	push	de
   5040 33            [ 6] 1972 	inc	sp
   5041 F5            [11] 1973 	push	af
   5042 33            [ 6] 1974 	inc	sp
   5043 CD 80 4F      [17] 1975 	call	_detectPlayerRoom
   5046 F1            [10] 1976 	pop	af
   5047 DD 75 E3      [19] 1977 	ld	-29 (ix),l
   504A 21 46 70      [10] 1978 	ld	hl, #_enemy + 11
   504D DD 7E E3      [19] 1979 	ld	a,-29 (ix)
   5050 96            [ 7] 1980 	sub	a,(hl)
   5051 28 0E         [12] 1981 	jr	Z,00102$
                           1982 ;src/ia.h:43: auxX = enemy.seenX;
   5053 3A 47 70      [13] 1983 	ld	a,(#_enemy + 12)
   5056 DD 77 E2      [19] 1984 	ld	-30 (ix),a
                           1985 ;src/ia.h:44: auxY = enemy.seenY;
   5059 3A 48 70      [13] 1986 	ld	a,(#_enemy + 13)
   505C DD 77 E1      [19] 1987 	ld	-31 (ix),a
   505F 18 0C         [12] 1988 	jr	00103$
   5061                    1989 00102$:
                           1990 ;src/ia.h:46: auxX = player.x;
   5061 3A 30 70      [13] 1991 	ld	a,(#_player + 0)
   5064 DD 77 E2      [19] 1992 	ld	-30 (ix),a
                           1993 ;src/ia.h:47: auxY = player.y;
   5067 3A 31 70      [13] 1994 	ld	a,(#(_player + 0x0001) + 0)
   506A DD 77 E1      [19] 1995 	ld	-31 (ix),a
   506D                    1996 00103$:
                           1997 ;src/ia.h:51: if(auxX < enemy.x){
   506D 3A 3B 70      [13] 1998 	ld	a,(#_enemy + 0)
                           1999 ;src/ia.h:53: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5070 DD 77 E3      [19] 2000 	ld	-29 (ix), a
   5073 DD 77 E4      [19] 2001 	ld	-28 (ix),a
   5076 DD 36 E5 00   [19] 2002 	ld	-27 (ix),#0x00
   507A DD 7E E4      [19] 2003 	ld	a,-28 (ix)
   507D C6 02         [ 7] 2004 	add	a, #0x02
   507F DD 77 E8      [19] 2005 	ld	-24 (ix),a
   5082 DD 7E E5      [19] 2006 	ld	a,-27 (ix)
   5085 CE 00         [ 7] 2007 	adc	a, #0x00
   5087 DD 77 E9      [19] 2008 	ld	-23 (ix),a
                           2009 ;src/ia.h:57: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   508A DD 7E E3      [19] 2010 	ld	a,-29 (ix)
   508D 0F            [ 4] 2011 	rrca
   508E 0F            [ 4] 2012 	rrca
   508F E6 3F         [ 7] 2013 	and	a,#0x3F
   5091 DD 77 FD      [19] 2014 	ld	-3 (ix),a
                           2015 ;src/ia.h:53: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5094 3A 3C 70      [13] 2016 	ld	a,(#(_enemy + 0x0001) + 0)
   5097 DD 77 F4      [19] 2017 	ld	-12 (ix),a
   509A DD 7E E4      [19] 2018 	ld	a,-28 (ix)
   509D C6 FF         [ 7] 2019 	add	a,#0xFF
   509F DD 77 EA      [19] 2020 	ld	-22 (ix),a
   50A2 DD 7E E5      [19] 2021 	ld	a,-27 (ix)
   50A5 CE FF         [ 7] 2022 	adc	a,#0xFF
   50A7 DD 77 EB      [19] 2023 	ld	-21 (ix),a
   50AA DD 7E F4      [19] 2024 	ld	a,-12 (ix)
   50AD 07            [ 4] 2025 	rlca
   50AE 07            [ 4] 2026 	rlca
   50AF 07            [ 4] 2027 	rlca
   50B0 07            [ 4] 2028 	rlca
   50B1 E6 0F         [ 7] 2029 	and	a,#0x0F
   50B3 DD 77 FE      [19] 2030 	ld	-2 (ix),a
   50B6 DD 7E EB      [19] 2031 	ld	a,-21 (ix)
   50B9 07            [ 4] 2032 	rlca
   50BA E6 01         [ 7] 2033 	and	a,#0x01
   50BC DD 77 F5      [19] 2034 	ld	-11 (ix),a
                           2035 ;src/ia.h:56: }else if(auxY < enemy.y){
   50BF DD 7E E1      [19] 2036 	ld	a,-31 (ix)
   50C2 DD 96 F4      [19] 2037 	sub	a, -12 (ix)
   50C5 3E 00         [ 7] 2038 	ld	a,#0x00
   50C7 17            [ 4] 2039 	rla
   50C8 DD 77 FF      [19] 2040 	ld	-1 (ix),a
                           2041 ;src/ia.h:58: enemy.y-=1;
   50CB DD 7E F4      [19] 2042 	ld	a,-12 (ix)
   50CE C6 FF         [ 7] 2043 	add	a,#0xFF
   50D0 DD 77 ED      [19] 2044 	ld	-19 (ix),a
                           2045 ;src/ia.h:61: enemy.y+=1;
   50D3 DD 7E F4      [19] 2046 	ld	a,-12 (ix)
   50D6 3C            [ 4] 2047 	inc	a
   50D7 DD 77 EC      [19] 2048 	ld	-20 (ix),a
                           2049 ;src/ia.h:54: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   50DA DD 7E F4      [19] 2050 	ld	a,-12 (ix)
   50DD DD 77 F2      [19] 2051 	ld	-14 (ix),a
   50E0 DD 36 F3 00   [19] 2052 	ld	-13 (ix),#0x00
                           2053 ;src/ia.h:53: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   50E4 DD 4E FE      [19] 2054 	ld	c,-2 (ix)
   50E7 06 00         [ 7] 2055 	ld	b,#0x00
   50E9 69            [ 4] 2056 	ld	l, c
   50EA 60            [ 4] 2057 	ld	h, b
   50EB 29            [11] 2058 	add	hl, hl
   50EC 29            [11] 2059 	add	hl, hl
   50ED 09            [11] 2060 	add	hl, bc
   50EE 29            [11] 2061 	add	hl, hl
   50EF 29            [11] 2062 	add	hl, hl
   50F0 DD 75 F6      [19] 2063 	ld	-10 (ix),l
   50F3 DD 74 F7      [19] 2064 	ld	-9 (ix),h
                           2065 ;src/ia.h:57: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   50F6 DD 7E F2      [19] 2066 	ld	a,-14 (ix)
   50F9 C6 FF         [ 7] 2067 	add	a,#0xFF
   50FB DD 77 FB      [19] 2068 	ld	-5 (ix),a
   50FE DD 7E F3      [19] 2069 	ld	a,-13 (ix)
   5101 CE FF         [ 7] 2070 	adc	a,#0xFF
   5103 DD 77 FC      [19] 2071 	ld	-4 (ix),a
   5106 DD 7E F2      [19] 2072 	ld	a,-14 (ix)
   5109 C6 0E         [ 7] 2073 	add	a, #0x0E
   510B DD 77 F8      [19] 2074 	ld	-8 (ix),a
   510E DD 7E F3      [19] 2075 	ld	a,-13 (ix)
   5111 CE 00         [ 7] 2076 	adc	a, #0x00
   5113 DD 77 F9      [19] 2077 	ld	-7 (ix),a
                           2078 ;src/ia.h:54: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5116 DD 7E F2      [19] 2079 	ld	a,-14 (ix)
   5119 C6 10         [ 7] 2080 	add	a, #0x10
   511B DD 77 E6      [19] 2081 	ld	-26 (ix),a
   511E DD 7E F3      [19] 2082 	ld	a,-13 (ix)
   5121 CE 00         [ 7] 2083 	adc	a, #0x00
   5123 DD 77 E7      [19] 2084 	ld	-25 (ix),a
   5126 DD 7E F2      [19] 2085 	ld	a,-14 (ix)
   5129 C6 1F         [ 7] 2086 	add	a, #0x1F
   512B DD 77 F2      [19] 2087 	ld	-14 (ix),a
   512E DD 7E F3      [19] 2088 	ld	a,-13 (ix)
   5131 CE 00         [ 7] 2089 	adc	a, #0x00
   5133 DD 77 F3      [19] 2090 	ld	-13 (ix),a
                           2091 ;src/ia.h:57: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5136 DD 7E FC      [19] 2092 	ld	a,-4 (ix)
   5139 07            [ 4] 2093 	rlca
   513A E6 01         [ 7] 2094 	and	a,#0x01
   513C DD 77 FE      [19] 2095 	ld	-2 (ix),a
                           2096 ;src/ia.h:54: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   513F DD 7E E7      [19] 2097 	ld	a,-25 (ix)
   5142 07            [ 4] 2098 	rlca
   5143 E6 01         [ 7] 2099 	and	a,#0x01
   5145 DD 77 F4      [19] 2100 	ld	-12 (ix),a
                           2101 ;src/ia.h:51: if(auxX < enemy.x){
   5148 DD 7E E2      [19] 2102 	ld	a,-30 (ix)
   514B DD 96 E3      [19] 2103 	sub	a, -29 (ix)
   514E D2 77 53      [10] 2104 	jp	NC,00137$
                           2105 ;src/ia.h:53: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
   5151 DD 7E F6      [19] 2106 	ld	a,-10 (ix)
   5154 C6 2A         [ 7] 2107 	add	a, #<(_scene)
   5156 DD 77 F0      [19] 2108 	ld	-16 (ix),a
   5159 DD 7E F7      [19] 2109 	ld	a,-9 (ix)
   515C CE 6F         [ 7] 2110 	adc	a, #>(_scene)
   515E DD 77 F1      [19] 2111 	ld	-15 (ix),a
   5161 DD 7E EA      [19] 2112 	ld	a,-22 (ix)
   5164 DD 77 EE      [19] 2113 	ld	-18 (ix),a
   5167 DD 7E EB      [19] 2114 	ld	a,-21 (ix)
   516A DD 77 EF      [19] 2115 	ld	-17 (ix),a
   516D DD 7E F5      [19] 2116 	ld	a,-11 (ix)
   5170 B7            [ 4] 2117 	or	a, a
   5171 28 0C         [12] 2118 	jr	Z,00141$
   5173 DD 7E E8      [19] 2119 	ld	a,-24 (ix)
   5176 DD 77 EE      [19] 2120 	ld	-18 (ix),a
   5179 DD 7E E9      [19] 2121 	ld	a,-23 (ix)
   517C DD 77 EF      [19] 2122 	ld	-17 (ix),a
   517F                    2123 00141$:
   517F DD CB EF 2E   [23] 2124 	sra	-17 (ix)
   5183 DD CB EE 1E   [23] 2125 	rr	-18 (ix)
   5187 DD CB EF 2E   [23] 2126 	sra	-17 (ix)
   518B DD CB EE 1E   [23] 2127 	rr	-18 (ix)
   518F DD 7E F0      [19] 2128 	ld	a,-16 (ix)
   5192 DD 86 EE      [19] 2129 	add	a, -18 (ix)
   5195 DD 77 EE      [19] 2130 	ld	-18 (ix),a
   5198 DD 7E F1      [19] 2131 	ld	a,-15 (ix)
   519B DD 8E EF      [19] 2132 	adc	a, -17 (ix)
   519E DD 77 EF      [19] 2133 	ld	-17 (ix),a
   51A1 DD 6E EE      [19] 2134 	ld	l,-18 (ix)
   51A4 DD 66 EF      [19] 2135 	ld	h,-17 (ix)
   51A7 7E            [ 7] 2136 	ld	a,(hl)
   51A8 3D            [ 4] 2137 	dec	a
   51A9 CA 62 52      [10] 2138 	jp	Z,00112$
                           2139 ;src/ia.h:54: && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
   51AC DD 7E E6      [19] 2140 	ld	a,-26 (ix)
   51AF DD 77 EE      [19] 2141 	ld	-18 (ix),a
   51B2 DD 7E E7      [19] 2142 	ld	a,-25 (ix)
   51B5 DD 77 EF      [19] 2143 	ld	-17 (ix),a
   51B8 DD 7E F4      [19] 2144 	ld	a,-12 (ix)
   51BB B7            [ 4] 2145 	or	a, a
   51BC 28 0C         [12] 2146 	jr	Z,00142$
   51BE DD 7E F2      [19] 2147 	ld	a,-14 (ix)
   51C1 DD 77 EE      [19] 2148 	ld	-18 (ix),a
   51C4 DD 7E F3      [19] 2149 	ld	a,-13 (ix)
   51C7 DD 77 EF      [19] 2150 	ld	-17 (ix),a
   51CA                    2151 00142$:
   51CA DD CB EF 2E   [23] 2152 	sra	-17 (ix)
   51CE DD CB EE 1E   [23] 2153 	rr	-18 (ix)
   51D2 DD CB EF 2E   [23] 2154 	sra	-17 (ix)
   51D6 DD CB EE 1E   [23] 2155 	rr	-18 (ix)
   51DA DD CB EF 2E   [23] 2156 	sra	-17 (ix)
   51DE DD CB EE 1E   [23] 2157 	rr	-18 (ix)
   51E2 DD CB EF 2E   [23] 2158 	sra	-17 (ix)
   51E6 DD CB EE 1E   [23] 2159 	rr	-18 (ix)
   51EA DD 4E EE      [19] 2160 	ld	c,-18 (ix)
   51ED DD 46 EF      [19] 2161 	ld	b,-17 (ix)
   51F0 69            [ 4] 2162 	ld	l, c
   51F1 60            [ 4] 2163 	ld	h, b
   51F2 29            [11] 2164 	add	hl, hl
   51F3 29            [11] 2165 	add	hl, hl
   51F4 09            [11] 2166 	add	hl, bc
   51F5 29            [11] 2167 	add	hl, hl
   51F6 29            [11] 2168 	add	hl, hl
   51F7 DD 75 EE      [19] 2169 	ld	-18 (ix),l
   51FA DD 74 EF      [19] 2170 	ld	-17 (ix),h
   51FD 3E 2A         [ 7] 2171 	ld	a,#<(_scene)
   51FF DD 86 EE      [19] 2172 	add	a, -18 (ix)
   5202 DD 77 EE      [19] 2173 	ld	-18 (ix),a
   5205 3E 6F         [ 7] 2174 	ld	a,#>(_scene)
   5207 DD 8E EF      [19] 2175 	adc	a, -17 (ix)
   520A DD 77 EF      [19] 2176 	ld	-17 (ix),a
   520D DD 7E EA      [19] 2177 	ld	a,-22 (ix)
   5210 DD 77 F0      [19] 2178 	ld	-16 (ix),a
   5213 DD 7E EB      [19] 2179 	ld	a,-21 (ix)
   5216 DD 77 F1      [19] 2180 	ld	-15 (ix),a
   5219 DD 7E F5      [19] 2181 	ld	a,-11 (ix)
   521C B7            [ 4] 2182 	or	a, a
   521D 28 0C         [12] 2183 	jr	Z,00143$
   521F DD 7E E8      [19] 2184 	ld	a,-24 (ix)
   5222 DD 77 F0      [19] 2185 	ld	-16 (ix),a
   5225 DD 7E E9      [19] 2186 	ld	a,-23 (ix)
   5228 DD 77 F1      [19] 2187 	ld	-15 (ix),a
   522B                    2188 00143$:
   522B DD CB F1 2E   [23] 2189 	sra	-15 (ix)
   522F DD CB F0 1E   [23] 2190 	rr	-16 (ix)
   5233 DD CB F1 2E   [23] 2191 	sra	-15 (ix)
   5237 DD CB F0 1E   [23] 2192 	rr	-16 (ix)
   523B DD 7E EE      [19] 2193 	ld	a,-18 (ix)
   523E DD 86 F0      [19] 2194 	add	a, -16 (ix)
   5241 DD 77 EE      [19] 2195 	ld	-18 (ix),a
   5244 DD 7E EF      [19] 2196 	ld	a,-17 (ix)
   5247 DD 8E F1      [19] 2197 	adc	a, -15 (ix)
   524A DD 77 EF      [19] 2198 	ld	-17 (ix),a
   524D DD 6E EE      [19] 2199 	ld	l,-18 (ix)
   5250 DD 66 EF      [19] 2200 	ld	h,-17 (ix)
   5253 7E            [ 7] 2201 	ld	a,(hl)
   5254 3D            [ 4] 2202 	dec	a
   5255 28 0B         [12] 2203 	jr	Z,00112$
                           2204 ;src/ia.h:55: enemy.x-=1;
   5257 DD 56 E3      [19] 2205 	ld	d,-29 (ix)
   525A 15            [ 4] 2206 	dec	d
   525B 21 3B 70      [10] 2207 	ld	hl,#_enemy
   525E 72            [ 7] 2208 	ld	(hl),d
   525F C3 9C 56      [10] 2209 	jp	00139$
   5262                    2210 00112$:
                           2211 ;src/ia.h:56: }else if(auxY < enemy.y){
   5262 DD 7E FF      [19] 2212 	ld	a,-1 (ix)
   5265 B7            [ 4] 2213 	or	a, a
   5266 CA F0 52      [10] 2214 	jp	Z,00109$
                           2215 ;src/ia.h:57: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5269 DD 7E FB      [19] 2216 	ld	a,-5 (ix)
   526C DD 77 EE      [19] 2217 	ld	-18 (ix),a
   526F DD 7E FC      [19] 2218 	ld	a,-4 (ix)
   5272 DD 77 EF      [19] 2219 	ld	-17 (ix),a
   5275 DD 7E FE      [19] 2220 	ld	a,-2 (ix)
   5278 B7            [ 4] 2221 	or	a, a
   5279 28 0C         [12] 2222 	jr	Z,00144$
   527B DD 7E F8      [19] 2223 	ld	a,-8 (ix)
   527E DD 77 EE      [19] 2224 	ld	-18 (ix),a
   5281 DD 7E F9      [19] 2225 	ld	a,-7 (ix)
   5284 DD 77 EF      [19] 2226 	ld	-17 (ix),a
   5287                    2227 00144$:
   5287 DD CB EF 2E   [23] 2228 	sra	-17 (ix)
   528B DD CB EE 1E   [23] 2229 	rr	-18 (ix)
   528F DD CB EF 2E   [23] 2230 	sra	-17 (ix)
   5293 DD CB EE 1E   [23] 2231 	rr	-18 (ix)
   5297 DD CB EF 2E   [23] 2232 	sra	-17 (ix)
   529B DD CB EE 1E   [23] 2233 	rr	-18 (ix)
   529F DD CB EF 2E   [23] 2234 	sra	-17 (ix)
   52A3 DD CB EE 1E   [23] 2235 	rr	-18 (ix)
   52A7 DD 4E EE      [19] 2236 	ld	c,-18 (ix)
   52AA DD 46 EF      [19] 2237 	ld	b,-17 (ix)
   52AD 69            [ 4] 2238 	ld	l, c
   52AE 60            [ 4] 2239 	ld	h, b
   52AF 29            [11] 2240 	add	hl, hl
   52B0 29            [11] 2241 	add	hl, hl
   52B1 09            [11] 2242 	add	hl, bc
   52B2 29            [11] 2243 	add	hl, hl
   52B3 29            [11] 2244 	add	hl, hl
   52B4 DD 75 EE      [19] 2245 	ld	-18 (ix),l
   52B7 DD 74 EF      [19] 2246 	ld	-17 (ix),h
   52BA 3E 2A         [ 7] 2247 	ld	a,#<(_scene)
   52BC DD 86 EE      [19] 2248 	add	a, -18 (ix)
   52BF DD 77 EE      [19] 2249 	ld	-18 (ix),a
   52C2 3E 6F         [ 7] 2250 	ld	a,#>(_scene)
   52C4 DD 8E EF      [19] 2251 	adc	a, -17 (ix)
   52C7 DD 77 EF      [19] 2252 	ld	-17 (ix),a
   52CA DD 7E FD      [19] 2253 	ld	a,-3 (ix)
   52CD DD 86 EE      [19] 2254 	add	a, -18 (ix)
   52D0 DD 77 EE      [19] 2255 	ld	-18 (ix),a
   52D3 3E 00         [ 7] 2256 	ld	a,#0x00
   52D5 DD 8E EF      [19] 2257 	adc	a, -17 (ix)
   52D8 DD 77 EF      [19] 2258 	ld	-17 (ix),a
   52DB DD 6E EE      [19] 2259 	ld	l,-18 (ix)
   52DE DD 66 EF      [19] 2260 	ld	h,-17 (ix)
   52E1 7E            [ 7] 2261 	ld	a,(hl)
   52E2 3D            [ 4] 2262 	dec	a
   52E3 CA 9C 56      [10] 2263 	jp	Z,00139$
                           2264 ;src/ia.h:58: enemy.y-=1;
   52E6 21 3C 70      [10] 2265 	ld	hl,#(_enemy + 0x0001)
   52E9 DD 7E ED      [19] 2266 	ld	a,-19 (ix)
   52EC 77            [ 7] 2267 	ld	(hl),a
   52ED C3 9C 56      [10] 2268 	jp	00139$
   52F0                    2269 00109$:
                           2270 ;src/ia.h:60: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   52F0 DD 7E E6      [19] 2271 	ld	a,-26 (ix)
   52F3 DD 77 EE      [19] 2272 	ld	-18 (ix),a
   52F6 DD 7E E7      [19] 2273 	ld	a,-25 (ix)
   52F9 DD 77 EF      [19] 2274 	ld	-17 (ix),a
   52FC DD 7E F4      [19] 2275 	ld	a,-12 (ix)
   52FF B7            [ 4] 2276 	or	a, a
   5300 28 0C         [12] 2277 	jr	Z,00145$
   5302 DD 7E F2      [19] 2278 	ld	a,-14 (ix)
   5305 DD 77 EE      [19] 2279 	ld	-18 (ix),a
   5308 DD 7E F3      [19] 2280 	ld	a,-13 (ix)
   530B DD 77 EF      [19] 2281 	ld	-17 (ix),a
   530E                    2282 00145$:
   530E DD CB EF 2E   [23] 2283 	sra	-17 (ix)
   5312 DD CB EE 1E   [23] 2284 	rr	-18 (ix)
   5316 DD CB EF 2E   [23] 2285 	sra	-17 (ix)
   531A DD CB EE 1E   [23] 2286 	rr	-18 (ix)
   531E DD CB EF 2E   [23] 2287 	sra	-17 (ix)
   5322 DD CB EE 1E   [23] 2288 	rr	-18 (ix)
   5326 DD CB EF 2E   [23] 2289 	sra	-17 (ix)
   532A DD CB EE 1E   [23] 2290 	rr	-18 (ix)
   532E DD 4E EE      [19] 2291 	ld	c,-18 (ix)
   5331 DD 46 EF      [19] 2292 	ld	b,-17 (ix)
   5334 69            [ 4] 2293 	ld	l, c
   5335 60            [ 4] 2294 	ld	h, b
   5336 29            [11] 2295 	add	hl, hl
   5337 29            [11] 2296 	add	hl, hl
   5338 09            [11] 2297 	add	hl, bc
   5339 29            [11] 2298 	add	hl, hl
   533A 29            [11] 2299 	add	hl, hl
   533B DD 75 EE      [19] 2300 	ld	-18 (ix),l
   533E DD 74 EF      [19] 2301 	ld	-17 (ix),h
   5341 3E 2A         [ 7] 2302 	ld	a,#<(_scene)
   5343 DD 86 EE      [19] 2303 	add	a, -18 (ix)
   5346 DD 77 EE      [19] 2304 	ld	-18 (ix),a
   5349 3E 6F         [ 7] 2305 	ld	a,#>(_scene)
   534B DD 8E EF      [19] 2306 	adc	a, -17 (ix)
   534E DD 77 EF      [19] 2307 	ld	-17 (ix),a
   5351 DD 7E FD      [19] 2308 	ld	a,-3 (ix)
   5354 DD 86 EE      [19] 2309 	add	a, -18 (ix)
   5357 DD 77 EE      [19] 2310 	ld	-18 (ix),a
   535A 3E 00         [ 7] 2311 	ld	a,#0x00
   535C DD 8E EF      [19] 2312 	adc	a, -17 (ix)
   535F DD 77 EF      [19] 2313 	ld	-17 (ix),a
   5362 DD 6E EE      [19] 2314 	ld	l,-18 (ix)
   5365 DD 66 EF      [19] 2315 	ld	h,-17 (ix)
   5368 7E            [ 7] 2316 	ld	a,(hl)
   5369 3D            [ 4] 2317 	dec	a
   536A CA 9C 56      [10] 2318 	jp	Z,00139$
                           2319 ;src/ia.h:61: enemy.y+=1;
   536D 21 3C 70      [10] 2320 	ld	hl,#(_enemy + 0x0001)
   5370 DD 7E EC      [19] 2321 	ld	a,-20 (ix)
   5373 77            [ 7] 2322 	ld	(hl),a
   5374 C3 9C 56      [10] 2323 	jp	00139$
   5377                    2324 00137$:
                           2325 ;src/ia.h:63: }else if(auxX > enemy.x){
   5377 DD 7E E3      [19] 2326 	ld	a,-29 (ix)
   537A DD 96 E2      [19] 2327 	sub	a, -30 (ix)
   537D D2 85 55      [10] 2328 	jp	NC,00134$
                           2329 ;src/ia.h:65: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
   5380 3E 2A         [ 7] 2330 	ld	a,#<(_scene)
   5382 DD 86 F6      [19] 2331 	add	a, -10 (ix)
   5385 DD 77 EE      [19] 2332 	ld	-18 (ix),a
   5388 3E 6F         [ 7] 2333 	ld	a,#>(_scene)
   538A DD 8E F7      [19] 2334 	adc	a, -9 (ix)
   538D DD 77 EF      [19] 2335 	ld	-17 (ix),a
   5390 DD 7E E4      [19] 2336 	ld	a,-28 (ix)
   5393 C6 04         [ 7] 2337 	add	a, #0x04
   5395 DD 77 F0      [19] 2338 	ld	-16 (ix),a
   5398 DD 7E E5      [19] 2339 	ld	a,-27 (ix)
   539B CE 00         [ 7] 2340 	adc	a, #0x00
   539D DD 77 F1      [19] 2341 	ld	-15 (ix),a
   53A0 DD 7E F0      [19] 2342 	ld	a,-16 (ix)
   53A3 DD 77 F6      [19] 2343 	ld	-10 (ix),a
   53A6 DD 7E F1      [19] 2344 	ld	a,-15 (ix)
   53A9 DD 77 F7      [19] 2345 	ld	-9 (ix),a
   53AC DD 7E F1      [19] 2346 	ld	a,-15 (ix)
   53AF 07            [ 4] 2347 	rlca
   53B0 E6 01         [ 7] 2348 	and	a,#0x01
   53B2 DD 77 FA      [19] 2349 	ld	-6 (ix),a
   53B5 DD 7E E4      [19] 2350 	ld	a,-28 (ix)
   53B8 C6 07         [ 7] 2351 	add	a, #0x07
   53BA DD 77 E4      [19] 2352 	ld	-28 (ix),a
   53BD DD 7E E5      [19] 2353 	ld	a,-27 (ix)
   53C0 CE 00         [ 7] 2354 	adc	a, #0x00
   53C2 DD 77 E5      [19] 2355 	ld	-27 (ix),a
   53C5 DD 7E FA      [19] 2356 	ld	a,-6 (ix)
   53C8 B7            [ 4] 2357 	or	a, a
   53C9 28 0C         [12] 2358 	jr	Z,00146$
   53CB DD 7E E4      [19] 2359 	ld	a,-28 (ix)
   53CE DD 77 F6      [19] 2360 	ld	-10 (ix),a
   53D1 DD 7E E5      [19] 2361 	ld	a,-27 (ix)
   53D4 DD 77 F7      [19] 2362 	ld	-9 (ix),a
   53D7                    2363 00146$:
   53D7 DD 6E F6      [19] 2364 	ld	l,-10 (ix)
   53DA DD 66 F7      [19] 2365 	ld	h,-9 (ix)
   53DD CB 2C         [ 8] 2366 	sra	h
   53DF CB 1D         [ 8] 2367 	rr	l
   53E1 CB 2C         [ 8] 2368 	sra	h
   53E3 CB 1D         [ 8] 2369 	rr	l
   53E5 DD 5E EE      [19] 2370 	ld	e,-18 (ix)
   53E8 DD 56 EF      [19] 2371 	ld	d,-17 (ix)
   53EB 19            [11] 2372 	add	hl,de
   53EC 7E            [ 7] 2373 	ld	a,(hl)
   53ED 3D            [ 4] 2374 	dec	a
   53EE CA 9D 54      [10] 2375 	jp	Z,00123$
                           2376 ;src/ia.h:66: && scene[(enemy.y+tileheight)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   53F1 DD 7E E6      [19] 2377 	ld	a,-26 (ix)
   53F4 DD 77 F6      [19] 2378 	ld	-10 (ix),a
   53F7 DD 7E E7      [19] 2379 	ld	a,-25 (ix)
   53FA DD 77 F7      [19] 2380 	ld	-9 (ix),a
   53FD DD 7E F4      [19] 2381 	ld	a,-12 (ix)
   5400 B7            [ 4] 2382 	or	a, a
   5401 28 0C         [12] 2383 	jr	Z,00147$
   5403 DD 7E F2      [19] 2384 	ld	a,-14 (ix)
   5406 DD 77 F6      [19] 2385 	ld	-10 (ix),a
   5409 DD 7E F3      [19] 2386 	ld	a,-13 (ix)
   540C DD 77 F7      [19] 2387 	ld	-9 (ix),a
   540F                    2388 00147$:
   540F DD CB F7 2E   [23] 2389 	sra	-9 (ix)
   5413 DD CB F6 1E   [23] 2390 	rr	-10 (ix)
   5417 DD CB F7 2E   [23] 2391 	sra	-9 (ix)
   541B DD CB F6 1E   [23] 2392 	rr	-10 (ix)
   541F DD CB F7 2E   [23] 2393 	sra	-9 (ix)
   5423 DD CB F6 1E   [23] 2394 	rr	-10 (ix)
   5427 DD CB F7 2E   [23] 2395 	sra	-9 (ix)
   542B DD CB F6 1E   [23] 2396 	rr	-10 (ix)
   542F DD 4E F6      [19] 2397 	ld	c,-10 (ix)
   5432 DD 46 F7      [19] 2398 	ld	b,-9 (ix)
   5435 69            [ 4] 2399 	ld	l, c
   5436 60            [ 4] 2400 	ld	h, b
   5437 29            [11] 2401 	add	hl, hl
   5438 29            [11] 2402 	add	hl, hl
   5439 09            [11] 2403 	add	hl, bc
   543A 29            [11] 2404 	add	hl, hl
   543B 29            [11] 2405 	add	hl, hl
   543C DD 75 F6      [19] 2406 	ld	-10 (ix),l
   543F DD 74 F7      [19] 2407 	ld	-9 (ix),h
   5442 3E 2A         [ 7] 2408 	ld	a,#<(_scene)
   5444 DD 86 F6      [19] 2409 	add	a, -10 (ix)
   5447 DD 77 F6      [19] 2410 	ld	-10 (ix),a
   544A 3E 6F         [ 7] 2411 	ld	a,#>(_scene)
   544C DD 8E F7      [19] 2412 	adc	a, -9 (ix)
   544F DD 77 F7      [19] 2413 	ld	-9 (ix),a
   5452 DD 7E FA      [19] 2414 	ld	a,-6 (ix)
   5455 B7            [ 4] 2415 	or	a, a
   5456 28 0C         [12] 2416 	jr	Z,00148$
   5458 DD 7E E4      [19] 2417 	ld	a,-28 (ix)
   545B DD 77 F0      [19] 2418 	ld	-16 (ix),a
   545E DD 7E E5      [19] 2419 	ld	a,-27 (ix)
   5461 DD 77 F1      [19] 2420 	ld	-15 (ix),a
   5464                    2421 00148$:
   5464 DD CB F1 2E   [23] 2422 	sra	-15 (ix)
   5468 DD CB F0 1E   [23] 2423 	rr	-16 (ix)
   546C DD CB F1 2E   [23] 2424 	sra	-15 (ix)
   5470 DD CB F0 1E   [23] 2425 	rr	-16 (ix)
   5474 DD 7E F6      [19] 2426 	ld	a,-10 (ix)
   5477 DD 86 F0      [19] 2427 	add	a, -16 (ix)
   547A DD 77 F0      [19] 2428 	ld	-16 (ix),a
   547D DD 7E F7      [19] 2429 	ld	a,-9 (ix)
   5480 DD 8E F1      [19] 2430 	adc	a, -15 (ix)
   5483 DD 77 F1      [19] 2431 	ld	-15 (ix),a
   5486 DD 6E F0      [19] 2432 	ld	l,-16 (ix)
   5489 DD 66 F1      [19] 2433 	ld	h,-15 (ix)
   548C 7E            [ 7] 2434 	ld	a,(hl)
   548D DD 77 FA      [19] 2435 	ld	-6 (ix), a
   5490 3D            [ 4] 2436 	dec	a
   5491 28 0A         [12] 2437 	jr	Z,00123$
                           2438 ;src/ia.h:67: enemy.x+=1;
   5493 DD 7E E3      [19] 2439 	ld	a,-29 (ix)
   5496 3C            [ 4] 2440 	inc	a
   5497 32 3B 70      [13] 2441 	ld	(#_enemy),a
   549A C3 9C 56      [10] 2442 	jp	00139$
   549D                    2443 00123$:
                           2444 ;src/ia.h:68: }else if(auxY < enemy.y){
   549D DD 7E FF      [19] 2445 	ld	a,-1 (ix)
   54A0 B7            [ 4] 2446 	or	a, a
   54A1 28 58         [12] 2447 	jr	Z,00120$
                           2448 ;src/ia.h:69: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   54A3 DD 7E EA      [19] 2449 	ld	a,-22 (ix)
   54A6 DD 77 F0      [19] 2450 	ld	-16 (ix),a
   54A9 DD 7E EB      [19] 2451 	ld	a,-21 (ix)
   54AC DD 77 F1      [19] 2452 	ld	-15 (ix),a
   54AF DD 7E F5      [19] 2453 	ld	a,-11 (ix)
   54B2 B7            [ 4] 2454 	or	a, a
   54B3 28 0C         [12] 2455 	jr	Z,00149$
   54B5 DD 7E E8      [19] 2456 	ld	a,-24 (ix)
   54B8 DD 77 F0      [19] 2457 	ld	-16 (ix),a
   54BB DD 7E E9      [19] 2458 	ld	a,-23 (ix)
   54BE DD 77 F1      [19] 2459 	ld	-15 (ix),a
   54C1                    2460 00149$:
   54C1 DD CB F1 2E   [23] 2461 	sra	-15 (ix)
   54C5 DD CB F0 1E   [23] 2462 	rr	-16 (ix)
   54C9 DD CB F1 2E   [23] 2463 	sra	-15 (ix)
   54CD DD CB F0 1E   [23] 2464 	rr	-16 (ix)
   54D1 DD 7E F0      [19] 2465 	ld	a,-16 (ix)
   54D4 DD 86 EE      [19] 2466 	add	a, -18 (ix)
   54D7 DD 77 EE      [19] 2467 	ld	-18 (ix),a
   54DA DD 7E F1      [19] 2468 	ld	a,-15 (ix)
   54DD DD 8E EF      [19] 2469 	adc	a, -17 (ix)
   54E0 DD 77 EF      [19] 2470 	ld	-17 (ix),a
   54E3 DD 6E EE      [19] 2471 	ld	l,-18 (ix)
   54E6 DD 66 EF      [19] 2472 	ld	h,-17 (ix)
   54E9 7E            [ 7] 2473 	ld	a,(hl)
   54EA DD 77 FA      [19] 2474 	ld	-6 (ix), a
   54ED 3D            [ 4] 2475 	dec	a
   54EE CA 9C 56      [10] 2476 	jp	Z,00139$
                           2477 ;src/ia.h:70: enemy.y-=1;
   54F1 21 3C 70      [10] 2478 	ld	hl,#(_enemy + 0x0001)
   54F4 DD 7E ED      [19] 2479 	ld	a,-19 (ix)
   54F7 77            [ 7] 2480 	ld	(hl),a
   54F8 C3 9C 56      [10] 2481 	jp	00139$
   54FB                    2482 00120$:
                           2483 ;src/ia.h:72: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   54FB DD 7E E6      [19] 2484 	ld	a,-26 (ix)
   54FE DD 77 EE      [19] 2485 	ld	-18 (ix),a
   5501 DD 7E E7      [19] 2486 	ld	a,-25 (ix)
   5504 DD 77 EF      [19] 2487 	ld	-17 (ix),a
   5507 DD 7E F4      [19] 2488 	ld	a,-12 (ix)
   550A B7            [ 4] 2489 	or	a, a
   550B 28 0C         [12] 2490 	jr	Z,00150$
   550D DD 7E F2      [19] 2491 	ld	a,-14 (ix)
   5510 DD 77 EE      [19] 2492 	ld	-18 (ix),a
   5513 DD 7E F3      [19] 2493 	ld	a,-13 (ix)
   5516 DD 77 EF      [19] 2494 	ld	-17 (ix),a
   5519                    2495 00150$:
   5519 DD CB EF 2E   [23] 2496 	sra	-17 (ix)
   551D DD CB EE 1E   [23] 2497 	rr	-18 (ix)
   5521 DD CB EF 2E   [23] 2498 	sra	-17 (ix)
   5525 DD CB EE 1E   [23] 2499 	rr	-18 (ix)
   5529 DD CB EF 2E   [23] 2500 	sra	-17 (ix)
   552D DD CB EE 1E   [23] 2501 	rr	-18 (ix)
   5531 DD CB EF 2E   [23] 2502 	sra	-17 (ix)
   5535 DD CB EE 1E   [23] 2503 	rr	-18 (ix)
   5539 DD 4E EE      [19] 2504 	ld	c,-18 (ix)
   553C DD 46 EF      [19] 2505 	ld	b,-17 (ix)
   553F 69            [ 4] 2506 	ld	l, c
   5540 60            [ 4] 2507 	ld	h, b
   5541 29            [11] 2508 	add	hl, hl
   5542 29            [11] 2509 	add	hl, hl
   5543 09            [11] 2510 	add	hl, bc
   5544 29            [11] 2511 	add	hl, hl
   5545 29            [11] 2512 	add	hl, hl
   5546 DD 75 EE      [19] 2513 	ld	-18 (ix),l
   5549 DD 74 EF      [19] 2514 	ld	-17 (ix),h
   554C 3E 2A         [ 7] 2515 	ld	a,#<(_scene)
   554E DD 86 EE      [19] 2516 	add	a, -18 (ix)
   5551 DD 77 EE      [19] 2517 	ld	-18 (ix),a
   5554 3E 6F         [ 7] 2518 	ld	a,#>(_scene)
   5556 DD 8E EF      [19] 2519 	adc	a, -17 (ix)
   5559 DD 77 EF      [19] 2520 	ld	-17 (ix),a
   555C DD 7E EE      [19] 2521 	ld	a,-18 (ix)
   555F DD 86 FD      [19] 2522 	add	a, -3 (ix)
   5562 DD 77 EE      [19] 2523 	ld	-18 (ix),a
   5565 DD 7E EF      [19] 2524 	ld	a,-17 (ix)
   5568 CE 00         [ 7] 2525 	adc	a, #0x00
   556A DD 77 EF      [19] 2526 	ld	-17 (ix),a
   556D DD 6E EE      [19] 2527 	ld	l,-18 (ix)
   5570 DD 66 EF      [19] 2528 	ld	h,-17 (ix)
   5573 7E            [ 7] 2529 	ld	a,(hl)
   5574 DD 77 FA      [19] 2530 	ld	-6 (ix), a
   5577 3D            [ 4] 2531 	dec	a
   5578 CA 9C 56      [10] 2532 	jp	Z,00139$
                           2533 ;src/ia.h:73: enemy.y+=1;
   557B 21 3C 70      [10] 2534 	ld	hl,#(_enemy + 0x0001)
   557E DD 7E EC      [19] 2535 	ld	a,-20 (ix)
   5581 77            [ 7] 2536 	ld	(hl),a
   5582 C3 9C 56      [10] 2537 	jp	00139$
   5585                    2538 00134$:
                           2539 ;src/ia.h:77: if(auxY < enemy.y){
   5585 DD 7E FF      [19] 2540 	ld	a,-1 (ix)
   5588 B7            [ 4] 2541 	or	a, a
   5589 CA 16 56      [10] 2542 	jp	Z,00131$
                           2543 ;src/ia.h:78: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   558C DD 7E FB      [19] 2544 	ld	a,-5 (ix)
   558F DD 77 EE      [19] 2545 	ld	-18 (ix),a
   5592 DD 7E FC      [19] 2546 	ld	a,-4 (ix)
   5595 DD 77 EF      [19] 2547 	ld	-17 (ix),a
   5598 DD 7E FE      [19] 2548 	ld	a,-2 (ix)
   559B B7            [ 4] 2549 	or	a, a
   559C 28 0C         [12] 2550 	jr	Z,00151$
   559E DD 7E F8      [19] 2551 	ld	a,-8 (ix)
   55A1 DD 77 EE      [19] 2552 	ld	-18 (ix),a
   55A4 DD 7E F9      [19] 2553 	ld	a,-7 (ix)
   55A7 DD 77 EF      [19] 2554 	ld	-17 (ix),a
   55AA                    2555 00151$:
   55AA DD CB EF 2E   [23] 2556 	sra	-17 (ix)
   55AE DD CB EE 1E   [23] 2557 	rr	-18 (ix)
   55B2 DD CB EF 2E   [23] 2558 	sra	-17 (ix)
   55B6 DD CB EE 1E   [23] 2559 	rr	-18 (ix)
   55BA DD CB EF 2E   [23] 2560 	sra	-17 (ix)
   55BE DD CB EE 1E   [23] 2561 	rr	-18 (ix)
   55C2 DD CB EF 2E   [23] 2562 	sra	-17 (ix)
   55C6 DD CB EE 1E   [23] 2563 	rr	-18 (ix)
   55CA DD 4E EE      [19] 2564 	ld	c,-18 (ix)
   55CD DD 46 EF      [19] 2565 	ld	b,-17 (ix)
   55D0 69            [ 4] 2566 	ld	l, c
   55D1 60            [ 4] 2567 	ld	h, b
   55D2 29            [11] 2568 	add	hl, hl
   55D3 29            [11] 2569 	add	hl, hl
   55D4 09            [11] 2570 	add	hl, bc
   55D5 29            [11] 2571 	add	hl, hl
   55D6 29            [11] 2572 	add	hl, hl
   55D7 DD 75 EE      [19] 2573 	ld	-18 (ix),l
   55DA DD 74 EF      [19] 2574 	ld	-17 (ix),h
   55DD 3E 2A         [ 7] 2575 	ld	a,#<(_scene)
   55DF DD 86 EE      [19] 2576 	add	a, -18 (ix)
   55E2 DD 77 EE      [19] 2577 	ld	-18 (ix),a
   55E5 3E 6F         [ 7] 2578 	ld	a,#>(_scene)
   55E7 DD 8E EF      [19] 2579 	adc	a, -17 (ix)
   55EA DD 77 EF      [19] 2580 	ld	-17 (ix),a
   55ED DD 7E EE      [19] 2581 	ld	a,-18 (ix)
   55F0 DD 86 FD      [19] 2582 	add	a, -3 (ix)
   55F3 DD 77 EE      [19] 2583 	ld	-18 (ix),a
   55F6 DD 7E EF      [19] 2584 	ld	a,-17 (ix)
   55F9 CE 00         [ 7] 2585 	adc	a, #0x00
   55FB DD 77 EF      [19] 2586 	ld	-17 (ix),a
   55FE DD 6E EE      [19] 2587 	ld	l,-18 (ix)
   5601 DD 66 EF      [19] 2588 	ld	h,-17 (ix)
   5604 7E            [ 7] 2589 	ld	a,(hl)
   5605 DD 77 FA      [19] 2590 	ld	-6 (ix), a
   5608 3D            [ 4] 2591 	dec	a
   5609 CA 9C 56      [10] 2592 	jp	Z,00139$
                           2593 ;src/ia.h:79: enemy.y-=1;
   560C 21 3C 70      [10] 2594 	ld	hl,#(_enemy + 0x0001)
   560F DD 7E ED      [19] 2595 	ld	a,-19 (ix)
   5612 77            [ 7] 2596 	ld	(hl),a
   5613 C3 9C 56      [10] 2597 	jp	00139$
   5616                    2598 00131$:
                           2599 ;src/ia.h:81: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5616 DD 7E E6      [19] 2600 	ld	a,-26 (ix)
   5619 DD 77 EE      [19] 2601 	ld	-18 (ix),a
   561C DD 7E E7      [19] 2602 	ld	a,-25 (ix)
   561F DD 77 EF      [19] 2603 	ld	-17 (ix),a
   5622 DD 7E F4      [19] 2604 	ld	a,-12 (ix)
   5625 B7            [ 4] 2605 	or	a, a
   5626 28 0C         [12] 2606 	jr	Z,00152$
   5628 DD 7E F2      [19] 2607 	ld	a,-14 (ix)
   562B DD 77 EE      [19] 2608 	ld	-18 (ix),a
   562E DD 7E F3      [19] 2609 	ld	a,-13 (ix)
   5631 DD 77 EF      [19] 2610 	ld	-17 (ix),a
   5634                    2611 00152$:
   5634 DD CB EF 2E   [23] 2612 	sra	-17 (ix)
   5638 DD CB EE 1E   [23] 2613 	rr	-18 (ix)
   563C DD CB EF 2E   [23] 2614 	sra	-17 (ix)
   5640 DD CB EE 1E   [23] 2615 	rr	-18 (ix)
   5644 DD CB EF 2E   [23] 2616 	sra	-17 (ix)
   5648 DD CB EE 1E   [23] 2617 	rr	-18 (ix)
   564C DD CB EF 2E   [23] 2618 	sra	-17 (ix)
   5650 DD CB EE 1E   [23] 2619 	rr	-18 (ix)
   5654 DD 4E EE      [19] 2620 	ld	c,-18 (ix)
   5657 DD 46 EF      [19] 2621 	ld	b,-17 (ix)
   565A 69            [ 4] 2622 	ld	l, c
   565B 60            [ 4] 2623 	ld	h, b
   565C 29            [11] 2624 	add	hl, hl
   565D 29            [11] 2625 	add	hl, hl
   565E 09            [11] 2626 	add	hl, bc
   565F 29            [11] 2627 	add	hl, hl
   5660 29            [11] 2628 	add	hl, hl
   5661 DD 75 EE      [19] 2629 	ld	-18 (ix),l
   5664 DD 74 EF      [19] 2630 	ld	-17 (ix),h
   5667 3E 2A         [ 7] 2631 	ld	a,#<(_scene)
   5669 DD 86 EE      [19] 2632 	add	a, -18 (ix)
   566C DD 77 EE      [19] 2633 	ld	-18 (ix),a
   566F 3E 6F         [ 7] 2634 	ld	a,#>(_scene)
   5671 DD 8E EF      [19] 2635 	adc	a, -17 (ix)
   5674 DD 77 EF      [19] 2636 	ld	-17 (ix),a
   5677 DD 7E FD      [19] 2637 	ld	a,-3 (ix)
   567A DD 86 EE      [19] 2638 	add	a, -18 (ix)
   567D DD 77 EE      [19] 2639 	ld	-18 (ix),a
   5680 3E 00         [ 7] 2640 	ld	a,#0x00
   5682 DD 8E EF      [19] 2641 	adc	a, -17 (ix)
   5685 DD 77 EF      [19] 2642 	ld	-17 (ix),a
   5688 DD 6E EE      [19] 2643 	ld	l,-18 (ix)
   568B DD 66 EF      [19] 2644 	ld	h,-17 (ix)
   568E 7E            [ 7] 2645 	ld	a,(hl)
   568F DD 77 FA      [19] 2646 	ld	-6 (ix), a
   5692 3D            [ 4] 2647 	dec	a
   5693 28 07         [12] 2648 	jr	Z,00139$
                           2649 ;src/ia.h:82: enemy.y+=1;
   5695 21 3C 70      [10] 2650 	ld	hl,#(_enemy + 0x0001)
   5698 DD 7E EC      [19] 2651 	ld	a,-20 (ix)
   569B 77            [ 7] 2652 	ld	(hl),a
   569C                    2653 00139$:
   569C DD F9         [10] 2654 	ld	sp, ix
   569E DD E1         [14] 2655 	pop	ix
   56A0 C9            [10] 2656 	ret
                           2657 ;src/ia.h:87: void patrol(){
                           2658 ;	---------------------------------
                           2659 ; Function patrol
                           2660 ; ---------------------------------
   56A1                    2661 _patrol::
   56A1 DD E5         [15] 2662 	push	ix
   56A3 DD 21 00 00   [14] 2663 	ld	ix,#0
   56A7 DD 39         [15] 2664 	add	ix,sp
   56A9 21 F4 FF      [10] 2665 	ld	hl,#-12
   56AC 39            [11] 2666 	add	hl,sp
   56AD F9            [ 6] 2667 	ld	sp,hl
                           2668 ;src/ia.h:90: movement(enemy.dir);
   56AE 3A 44 70      [13] 2669 	ld	a, (#(_enemy + 0x0009) + 0)
   56B1 F5            [11] 2670 	push	af
   56B2 33            [ 6] 2671 	inc	sp
   56B3 CD EB 4F      [17] 2672 	call	_movement
   56B6 33            [ 6] 2673 	inc	sp
                           2674 ;src/ia.h:92: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   56B7 3A 3C 70      [13] 2675 	ld	a,(#_enemy + 1)
   56BA DD 77 F6      [19] 2676 	ld	-10 (ix), a
   56BD 07            [ 4] 2677 	rlca
   56BE 07            [ 4] 2678 	rlca
   56BF 07            [ 4] 2679 	rlca
   56C0 07            [ 4] 2680 	rlca
   56C1 E6 0F         [ 7] 2681 	and	a,#0x0F
   56C3 4F            [ 4] 2682 	ld	c,a
   56C4 06 00         [ 7] 2683 	ld	b,#0x00
   56C6 69            [ 4] 2684 	ld	l, c
   56C7 60            [ 4] 2685 	ld	h, b
   56C8 29            [11] 2686 	add	hl, hl
   56C9 29            [11] 2687 	add	hl, hl
   56CA 09            [11] 2688 	add	hl, bc
   56CB 29            [11] 2689 	add	hl, hl
   56CC 29            [11] 2690 	add	hl, hl
   56CD 3E 2A         [ 7] 2691 	ld	a,#<(_scene)
   56CF 85            [ 4] 2692 	add	a, l
   56D0 DD 77 F4      [19] 2693 	ld	-12 (ix),a
   56D3 3E 6F         [ 7] 2694 	ld	a,#>(_scene)
   56D5 8C            [ 4] 2695 	adc	a, h
   56D6 DD 77 F5      [19] 2696 	ld	-11 (ix),a
   56D9 3A 3B 70      [13] 2697 	ld	a,(#_enemy + 0)
   56DC DD 77 FC      [19] 2698 	ld	-4 (ix), a
   56DF 0F            [ 4] 2699 	rrca
   56E0 0F            [ 4] 2700 	rrca
   56E1 E6 3F         [ 7] 2701 	and	a,#0x3F
   56E3 DD 77 F9      [19] 2702 	ld	-7 (ix),a
   56E6 DD 7E F4      [19] 2703 	ld	a,-12 (ix)
   56E9 DD 86 F9      [19] 2704 	add	a, -7 (ix)
   56EC 5F            [ 4] 2705 	ld	e,a
   56ED DD 7E F5      [19] 2706 	ld	a,-11 (ix)
   56F0 CE 00         [ 7] 2707 	adc	a, #0x00
   56F2 57            [ 4] 2708 	ld	d,a
   56F3 3A 46 70      [13] 2709 	ld	a,(#_enemy + 11)
   56F6 DD 77 FD      [19] 2710 	ld	-3 (ix),a
   56F9 1A            [ 7] 2711 	ld	a,(de)
   56FA 57            [ 4] 2712 	ld	d,a
   56FB DD 7E FD      [19] 2713 	ld	a,-3 (ix)
   56FE 92            [ 4] 2714 	sub	a, d
   56FF C2 FB 57      [10] 2715 	jp	NZ,00106$
                           2716 ;src/ia.h:93: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5702 DD 5E FC      [19] 2717 	ld	e,-4 (ix)
   5705 16 00         [ 7] 2718 	ld	d,#0x00
   5707 21 03 00      [10] 2719 	ld	hl,#0x0003
   570A 19            [11] 2720 	add	hl,de
   570B DD 75 F7      [19] 2721 	ld	-9 (ix),l
   570E DD 74 F8      [19] 2722 	ld	-8 (ix),h
   5711 DD 7E F7      [19] 2723 	ld	a,-9 (ix)
   5714 DD 77 FE      [19] 2724 	ld	-2 (ix),a
   5717 DD 7E F8      [19] 2725 	ld	a,-8 (ix)
   571A DD 77 FF      [19] 2726 	ld	-1 (ix),a
   571D DD 7E F8      [19] 2727 	ld	a,-8 (ix)
   5720 07            [ 4] 2728 	rlca
   5721 E6 01         [ 7] 2729 	and	a,#0x01
   5723 DD 77 FC      [19] 2730 	ld	-4 (ix),a
   5726 21 06 00      [10] 2731 	ld	hl,#0x0006
   5729 19            [11] 2732 	add	hl,de
   572A DD 75 FA      [19] 2733 	ld	-6 (ix),l
   572D DD 74 FB      [19] 2734 	ld	-5 (ix),h
   5730 DD 7E FC      [19] 2735 	ld	a,-4 (ix)
   5733 B7            [ 4] 2736 	or	a, a
   5734 28 0C         [12] 2737 	jr	Z,00113$
   5736 DD 7E FA      [19] 2738 	ld	a,-6 (ix)
   5739 DD 77 FE      [19] 2739 	ld	-2 (ix),a
   573C DD 7E FB      [19] 2740 	ld	a,-5 (ix)
   573F DD 77 FF      [19] 2741 	ld	-1 (ix),a
   5742                    2742 00113$:
   5742 DD 6E FE      [19] 2743 	ld	l,-2 (ix)
   5745 DD 66 FF      [19] 2744 	ld	h,-1 (ix)
   5748 CB 2C         [ 8] 2745 	sra	h
   574A CB 1D         [ 8] 2746 	rr	l
   574C CB 2C         [ 8] 2747 	sra	h
   574E CB 1D         [ 8] 2748 	rr	l
   5750 D1            [10] 2749 	pop	de
   5751 D5            [11] 2750 	push	de
   5752 19            [11] 2751 	add	hl,de
   5753 DD 7E FD      [19] 2752 	ld	a,-3 (ix)
   5756 96            [ 7] 2753 	sub	a,(hl)
   5757 C2 FB 57      [10] 2754 	jp	NZ,00106$
                           2755 ;src/ia.h:94: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   575A DD 5E F6      [19] 2756 	ld	e,-10 (ix)
   575D 16 00         [ 7] 2757 	ld	d,#0x00
   575F 21 0E 00      [10] 2758 	ld	hl,#0x000E
   5762 19            [11] 2759 	add	hl,de
   5763 4D            [ 4] 2760 	ld	c,l
   5764 44            [ 4] 2761 	ld	b,h
   5765 69            [ 4] 2762 	ld	l, c
   5766 78            [ 4] 2763 	ld	a,b
   5767 67            [ 4] 2764 	ld	h,a
   5768 07            [ 4] 2765 	rlca
   5769 E6 01         [ 7] 2766 	and	a,#0x01
   576B DD 77 FE      [19] 2767 	ld	-2 (ix),a
   576E 7B            [ 4] 2768 	ld	a,e
   576F C6 1D         [ 7] 2769 	add	a, #0x1D
   5771 DD 77 F4      [19] 2770 	ld	-12 (ix),a
   5774 7A            [ 4] 2771 	ld	a,d
   5775 CE 00         [ 7] 2772 	adc	a, #0x00
   5777 DD 77 F5      [19] 2773 	ld	-11 (ix),a
   577A DD 7E FE      [19] 2774 	ld	a,-2 (ix)
   577D B7            [ 4] 2775 	or	a, a
   577E 28 02         [12] 2776 	jr	Z,00114$
   5780 E1            [10] 2777 	pop	hl
   5781 E5            [11] 2778 	push	hl
   5782                    2779 00114$:
   5782 CB 2C         [ 8] 2780 	sra	h
   5784 CB 1D         [ 8] 2781 	rr	l
   5786 CB 2C         [ 8] 2782 	sra	h
   5788 CB 1D         [ 8] 2783 	rr	l
   578A CB 2C         [ 8] 2784 	sra	h
   578C CB 1D         [ 8] 2785 	rr	l
   578E CB 2C         [ 8] 2786 	sra	h
   5790 CB 1D         [ 8] 2787 	rr	l
   5792 5D            [ 4] 2788 	ld	e, l
   5793 54            [ 4] 2789 	ld	d, h
   5794 29            [11] 2790 	add	hl, hl
   5795 29            [11] 2791 	add	hl, hl
   5796 19            [11] 2792 	add	hl, de
   5797 29            [11] 2793 	add	hl, hl
   5798 29            [11] 2794 	add	hl, hl
   5799 11 2A 6F      [10] 2795 	ld	de,#_scene
   579C 19            [11] 2796 	add	hl,de
   579D DD 5E F9      [19] 2797 	ld	e,-7 (ix)
   57A0 16 00         [ 7] 2798 	ld	d,#0x00
   57A2 19            [11] 2799 	add	hl,de
   57A3 DD 7E FD      [19] 2800 	ld	a,-3 (ix)
   57A6 96            [ 7] 2801 	sub	a,(hl)
   57A7 20 52         [12] 2802 	jr	NZ,00106$
                           2803 ;src/ia.h:95: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   57A9 DD 7E FE      [19] 2804 	ld	a,-2 (ix)
   57AC B7            [ 4] 2805 	or	a, a
   57AD 28 02         [12] 2806 	jr	Z,00115$
   57AF C1            [10] 2807 	pop	bc
   57B0 C5            [11] 2808 	push	bc
   57B1                    2809 00115$:
   57B1 CB 28         [ 8] 2810 	sra	b
   57B3 CB 19         [ 8] 2811 	rr	c
   57B5 CB 28         [ 8] 2812 	sra	b
   57B7 CB 19         [ 8] 2813 	rr	c
   57B9 CB 28         [ 8] 2814 	sra	b
   57BB CB 19         [ 8] 2815 	rr	c
   57BD CB 28         [ 8] 2816 	sra	b
   57BF CB 19         [ 8] 2817 	rr	c
   57C1 69            [ 4] 2818 	ld	l, c
   57C2 60            [ 4] 2819 	ld	h, b
   57C3 29            [11] 2820 	add	hl, hl
   57C4 29            [11] 2821 	add	hl, hl
   57C5 09            [11] 2822 	add	hl, bc
   57C6 29            [11] 2823 	add	hl, hl
   57C7 29            [11] 2824 	add	hl, hl
   57C8 3E 2A         [ 7] 2825 	ld	a,#<(_scene)
   57CA 85            [ 4] 2826 	add	a, l
   57CB DD 77 FE      [19] 2827 	ld	-2 (ix),a
   57CE 3E 6F         [ 7] 2828 	ld	a,#>(_scene)
   57D0 8C            [ 4] 2829 	adc	a, h
   57D1 DD 77 FF      [19] 2830 	ld	-1 (ix),a
   57D4 DD 5E F7      [19] 2831 	ld	e,-9 (ix)
   57D7 DD 56 F8      [19] 2832 	ld	d,-8 (ix)
   57DA DD 7E FC      [19] 2833 	ld	a,-4 (ix)
   57DD B7            [ 4] 2834 	or	a, a
   57DE 28 06         [12] 2835 	jr	Z,00116$
   57E0 DD 5E FA      [19] 2836 	ld	e,-6 (ix)
   57E3 DD 56 FB      [19] 2837 	ld	d,-5 (ix)
   57E6                    2838 00116$:
   57E6 CB 2A         [ 8] 2839 	sra	d
   57E8 CB 1B         [ 8] 2840 	rr	e
   57EA CB 2A         [ 8] 2841 	sra	d
   57EC CB 1B         [ 8] 2842 	rr	e
   57EE DD 6E FE      [19] 2843 	ld	l,-2 (ix)
   57F1 DD 66 FF      [19] 2844 	ld	h,-1 (ix)
   57F4 19            [11] 2845 	add	hl,de
   57F5 DD 7E FD      [19] 2846 	ld	a,-3 (ix)
   57F8 96            [ 7] 2847 	sub	a,(hl)
   57F9 28 3B         [12] 2848 	jr	Z,00111$
   57FB                    2849 00106$:
                           2850 ;src/ia.h:97: switch(enemy.dir){
   57FB 3A 44 70      [13] 2851 	ld	a,(#(_enemy + 0x0009) + 0)
   57FE FE 02         [ 7] 2852 	cp	a,#0x02
   5800 28 22         [12] 2853 	jr	Z,00103$
   5802 FE 04         [ 7] 2854 	cp	a,#0x04
   5804 28 0A         [12] 2855 	jr	Z,00101$
   5806 FE 06         [ 7] 2856 	cp	a,#0x06
   5808 28 10         [12] 2857 	jr	Z,00102$
   580A D6 08         [ 7] 2858 	sub	a, #0x08
   580C 28 20         [12] 2859 	jr	Z,00104$
   580E 18 26         [12] 2860 	jr	00111$
                           2861 ;src/ia.h:98: case 4:
   5810                    2862 00101$:
                           2863 ;src/ia.h:99: movement(6);
   5810 3E 06         [ 7] 2864 	ld	a,#0x06
   5812 F5            [11] 2865 	push	af
   5813 33            [ 6] 2866 	inc	sp
   5814 CD EB 4F      [17] 2867 	call	_movement
   5817 33            [ 6] 2868 	inc	sp
                           2869 ;src/ia.h:100: break;
   5818 18 1C         [12] 2870 	jr	00111$
                           2871 ;src/ia.h:101: case 6:
   581A                    2872 00102$:
                           2873 ;src/ia.h:102: movement(4);
   581A 3E 04         [ 7] 2874 	ld	a,#0x04
   581C F5            [11] 2875 	push	af
   581D 33            [ 6] 2876 	inc	sp
   581E CD EB 4F      [17] 2877 	call	_movement
   5821 33            [ 6] 2878 	inc	sp
                           2879 ;src/ia.h:103: break;
   5822 18 12         [12] 2880 	jr	00111$
                           2881 ;src/ia.h:104: case 2:
   5824                    2882 00103$:
                           2883 ;src/ia.h:105: movement(8);
   5824 3E 08         [ 7] 2884 	ld	a,#0x08
   5826 F5            [11] 2885 	push	af
   5827 33            [ 6] 2886 	inc	sp
   5828 CD EB 4F      [17] 2887 	call	_movement
   582B 33            [ 6] 2888 	inc	sp
                           2889 ;src/ia.h:106: break;
   582C 18 08         [12] 2890 	jr	00111$
                           2891 ;src/ia.h:107: case 8:
   582E                    2892 00104$:
                           2893 ;src/ia.h:108: movement(2);
   582E 3E 02         [ 7] 2894 	ld	a,#0x02
   5830 F5            [11] 2895 	push	af
   5831 33            [ 6] 2896 	inc	sp
   5832 CD EB 4F      [17] 2897 	call	_movement
   5835 33            [ 6] 2898 	inc	sp
                           2899 ;src/ia.h:110: }
   5836                    2900 00111$:
   5836 DD F9         [10] 2901 	ld	sp, ix
   5838 DD E1         [14] 2902 	pop	ix
   583A C9            [10] 2903 	ret
                           2904 ;src/ia.h:115: void move(){
                           2905 ;	---------------------------------
                           2906 ; Function move
                           2907 ; ---------------------------------
   583B                    2908 _move::
                           2909 ;src/ia.h:117: if(temp > 10){
   583B 3E 0A         [ 7] 2910 	ld	a,#0x0A
   583D FD 21 1A 70   [14] 2911 	ld	iy,#_temp
   5841 FD 96 00      [19] 2912 	sub	a, 0 (iy)
   5844 30 45         [12] 2913 	jr	NC,00117$
                           2914 ;src/ia.h:118: following = detectPlayerRoom(player.x,player.y);
   5846 3A 31 70      [13] 2915 	ld	a, (#_player + 1)
   5849 21 30 70      [10] 2916 	ld	hl, #_player + 0
   584C 56            [ 7] 2917 	ld	d,(hl)
   584D F5            [11] 2918 	push	af
   584E 33            [ 6] 2919 	inc	sp
   584F D5            [11] 2920 	push	de
   5850 33            [ 6] 2921 	inc	sp
   5851 CD 80 4F      [17] 2922 	call	_detectPlayerRoom
   5854 F1            [10] 2923 	pop	af
   5855 FD 21 1F 70   [14] 2924 	ld	iy,#_following
   5859 FD 75 00      [19] 2925 	ld	0 (iy),l
                           2926 ;src/ia.h:123: if(following == enemy.room || enemy.pursue != 0){
   585C 21 46 70      [10] 2927 	ld	hl, #_enemy + 11
   585F 56            [ 7] 2928 	ld	d,(hl)
   5860 01 49 70      [10] 2929 	ld	bc,#_enemy + 14
   5863 0A            [ 7] 2930 	ld	a,(bc)
   5864 5F            [ 4] 2931 	ld	e,a
   5865 3A 1F 70      [13] 2932 	ld	a,(#_following + 0)
   5868 92            [ 4] 2933 	sub	a, d
   5869 28 04         [12] 2934 	jr	Z,00106$
   586B 7B            [ 4] 2935 	ld	a,e
   586C B7            [ 4] 2936 	or	a, a
   586D 28 13         [12] 2937 	jr	Z,00107$
   586F                    2938 00106$:
                           2939 ;src/ia.h:124: if(enemy.pursue == 0)
   586F 7B            [ 4] 2940 	ld	a,e
   5870 B7            [ 4] 2941 	or	a, a
   5871 20 05         [12] 2942 	jr	NZ,00104$
                           2943 ;src/ia.h:125: enemy.pursue = 4;
   5873 3E 04         [ 7] 2944 	ld	a,#0x04
   5875 02            [ 7] 2945 	ld	(bc),a
   5876 18 3F         [12] 2946 	jr	00118$
   5878                    2947 00104$:
                           2948 ;src/ia.h:126: else if(enemy.pursue > 1)
   5878 3E 01         [ 7] 2949 	ld	a,#0x01
   587A 93            [ 4] 2950 	sub	a, e
   587B 30 3A         [12] 2951 	jr	NC,00118$
                           2952 ;src/ia.h:127: enemy.pursue -=1;
   587D 1D            [ 4] 2953 	dec	e
   587E 7B            [ 4] 2954 	ld	a,e
   587F 02            [ 7] 2955 	ld	(bc),a
   5880 18 35         [12] 2956 	jr	00118$
   5882                    2957 00107$:
                           2958 ;src/ia.h:129: enemy.dir = chooseDirection();
   5882 CD AD 4F      [17] 2959 	call	_chooseDirection
   5885 7D            [ 4] 2960 	ld	a,l
   5886 32 44 70      [13] 2961 	ld	(#(_enemy + 0x0009)),a
   5889 18 2C         [12] 2962 	jr	00118$
   588B                    2963 00117$:
                           2964 ;src/ia.h:132: if(enemy.pursue >= 1){
   588B 3A 49 70      [13] 2965 	ld	a,(#(_enemy + 0x000e) + 0)
   588E D6 01         [ 7] 2966 	sub	a, #0x01
   5890 38 22         [12] 2967 	jr	C,00114$
                           2968 ;src/ia.h:133: followPlayer();
   5892 CD 2B 50      [17] 2969 	call	_followPlayer
                           2970 ;src/ia.h:134: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   5895 21 47 70      [10] 2971 	ld	hl, #_enemy + 12
   5898 56            [ 7] 2972 	ld	d,(hl)
   5899 21 3B 70      [10] 2973 	ld	hl, #_enemy + 0
   589C 5E            [ 7] 2974 	ld	e,(hl)
   589D 7A            [ 4] 2975 	ld	a,d
   589E 93            [ 4] 2976 	sub	a, e
   589F 20 16         [12] 2977 	jr	NZ,00118$
   58A1 21 48 70      [10] 2978 	ld	hl, #_enemy + 13
   58A4 56            [ 7] 2979 	ld	d,(hl)
   58A5 21 3C 70      [10] 2980 	ld	hl, #_enemy + 1
   58A8 5E            [ 7] 2981 	ld	e,(hl)
   58A9 7A            [ 4] 2982 	ld	a,d
   58AA 93            [ 4] 2983 	sub	a, e
   58AB 20 0A         [12] 2984 	jr	NZ,00118$
                           2985 ;src/ia.h:135: enemy.pursue = 0;
   58AD 21 49 70      [10] 2986 	ld	hl,#(_enemy + 0x000e)
   58B0 36 00         [10] 2987 	ld	(hl),#0x00
   58B2 18 03         [12] 2988 	jr	00118$
   58B4                    2989 00114$:
                           2990 ;src/ia.h:137: patrol();
   58B4 CD A1 56      [17] 2991 	call	_patrol
   58B7                    2992 00118$:
                           2993 ;src/ia.h:140: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   58B7 21 3E 70      [10] 2994 	ld	hl, #_enemy + 3
   58BA 56            [ 7] 2995 	ld	d,(hl)
   58BB 3A 3D 70      [13] 2996 	ld	a, (#_enemy + 2)
   58BE D5            [11] 2997 	push	de
   58BF 33            [ 6] 2998 	inc	sp
   58C0 F5            [11] 2999 	push	af
   58C1 33            [ 6] 3000 	inc	sp
   58C2 CD 80 4F      [17] 3001 	call	_detectPlayerRoom
   58C5 F1            [10] 3002 	pop	af
   58C6 55            [ 4] 3003 	ld	d,l
   58C7 3A 31 70      [13] 3004 	ld	a, (#(_player + 0x0001) + 0)
   58CA 21 30 70      [10] 3005 	ld	hl, #_player + 0
   58CD 46            [ 7] 3006 	ld	b,(hl)
   58CE D5            [11] 3007 	push	de
   58CF F5            [11] 3008 	push	af
   58D0 33            [ 6] 3009 	inc	sp
   58D1 C5            [11] 3010 	push	bc
   58D2 33            [ 6] 3011 	inc	sp
   58D3 CD 80 4F      [17] 3012 	call	_detectPlayerRoom
   58D6 F1            [10] 3013 	pop	af
   58D7 45            [ 4] 3014 	ld	b,l
   58D8 D1            [10] 3015 	pop	de
   58D9 7A            [ 4] 3016 	ld	a,d
   58DA 90            [ 4] 3017 	sub	a, b
   58DB 28 09         [12] 3018 	jr	Z,00119$
   58DD 21 49 70      [10] 3019 	ld	hl, #_enemy + 14
   58E0 66            [ 7] 3020 	ld	h,(hl)
   58E1 3E 01         [ 7] 3021 	ld	a,#0x01
   58E3 94            [ 4] 3022 	sub	a, h
   58E4 30 0E         [12] 3023 	jr	NC,00120$
   58E6                    3024 00119$:
                           3025 ;src/ia.h:141: enemy.seenX = player.x;
   58E6 11 47 70      [10] 3026 	ld	de,#_enemy + 12
   58E9 3A 30 70      [13] 3027 	ld	a, (#_player + 0)
   58EC 12            [ 7] 3028 	ld	(de),a
                           3029 ;src/ia.h:142: enemy.seenY = player.y;
   58ED 11 48 70      [10] 3030 	ld	de,#_enemy + 13
   58F0 3A 31 70      [13] 3031 	ld	a, (#(_player + 0x0001) + 0)
   58F3 12            [ 7] 3032 	ld	(de),a
   58F4                    3033 00120$:
                           3034 ;src/ia.h:144: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   58F4 3A 3C 70      [13] 3035 	ld	a, (#_enemy + 1)
   58F7 21 3B 70      [10] 3036 	ld	hl, #_enemy + 0
   58FA 56            [ 7] 3037 	ld	d,(hl)
   58FB F5            [11] 3038 	push	af
   58FC 33            [ 6] 3039 	inc	sp
   58FD D5            [11] 3040 	push	de
   58FE 33            [ 6] 3041 	inc	sp
   58FF CD 80 4F      [17] 3042 	call	_detectPlayerRoom
   5902 F1            [10] 3043 	pop	af
   5903 7D            [ 4] 3044 	ld	a,l
   5904 32 46 70      [13] 3045 	ld	(#(_enemy + 0x000b)),a
   5907 C9            [10] 3046 	ret
                           3047 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           3048 ;	---------------------------------
                           3049 ; Function checkCollisions
                           3050 ; ---------------------------------
   5908                    3051 _checkCollisions::
   5908 DD E5         [15] 3052 	push	ix
   590A DD 21 00 00   [14] 3053 	ld	ix,#0
   590E DD 39         [15] 3054 	add	ix,sp
   5910 21 FA FF      [10] 3055 	ld	hl,#-6
   5913 39            [11] 3056 	add	hl,sp
   5914 F9            [ 6] 3057 	ld	sp,hl
                           3058 ;src/CalcColision.h:14: switch(atk){
   5915 DD 7E 08      [19] 3059 	ld	a,8 (ix)
   5918 D6 15         [ 7] 3060 	sub	a, #0x15
   591A 28 09         [12] 3061 	jr	Z,00101$
   591C DD 7E 08      [19] 3062 	ld	a,8 (ix)
   591F D6 16         [ 7] 3063 	sub	a, #0x16
   5921 28 08         [12] 3064 	jr	Z,00102$
   5923 18 0C         [12] 3065 	jr	00103$
                           3066 ;src/CalcColision.h:15: case 21:
   5925                    3067 00101$:
                           3068 ;src/CalcColision.h:16: auxX = 2;
   5925 1E 02         [ 7] 3069 	ld	e,#0x02
                           3070 ;src/CalcColision.h:17: auxY = 8;
   5927 0E 08         [ 7] 3071 	ld	c,#0x08
                           3072 ;src/CalcColision.h:18: break;
   5929 18 0A         [12] 3073 	jr	00104$
                           3074 ;src/CalcColision.h:19: case 22:
   592B                    3075 00102$:
                           3076 ;src/CalcColision.h:20: auxX = 4;
   592B 1E 04         [ 7] 3077 	ld	e,#0x04
                           3078 ;src/CalcColision.h:21: auxY = 4;
   592D 0E 04         [ 7] 3079 	ld	c,#0x04
                           3080 ;src/CalcColision.h:22: break;
   592F 18 04         [12] 3081 	jr	00104$
                           3082 ;src/CalcColision.h:23: default:
   5931                    3083 00103$:
                           3084 ;src/CalcColision.h:24: auxX = tilewidth;
   5931 1E 04         [ 7] 3085 	ld	e,#0x04
                           3086 ;src/CalcColision.h:25: auxY = tileheight;
   5933 0E 10         [ 7] 3087 	ld	c,#0x10
                           3088 ;src/CalcColision.h:26: }
   5935                    3089 00104$:
                           3090 ;src/CalcColision.h:27: popX = pX + auxX;
   5935 DD 7E 04      [19] 3091 	ld	a,4 (ix)
   5938 83            [ 4] 3092 	add	a, e
   5939 6F            [ 4] 3093 	ld	l,a
                           3094 ;src/CalcColision.h:28: popY = pY + auxY;
   593A DD 7E 05      [19] 3095 	ld	a,5 (ix)
   593D 81            [ 4] 3096 	add	a, c
   593E DD 77 FA      [19] 3097 	ld	-6 (ix),a
                           3098 ;src/CalcColision.h:29: eopX = eX + auxX;
   5941 DD 7E 06      [19] 3099 	ld	a,6 (ix)
   5944 83            [ 4] 3100 	add	a, e
   5945 5F            [ 4] 3101 	ld	e,a
                           3102 ;src/CalcColision.h:30: eopY = eY + auxY;
   5946 DD 7E 07      [19] 3103 	ld	a,7 (ix)
   5949 81            [ 4] 3104 	add	a, c
   594A DD 77 FB      [19] 3105 	ld	-5 (ix),a
                           3106 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   594D 7B            [ 4] 3107 	ld	a,e
   594E DD 96 04      [19] 3108 	sub	a, 4 (ix)
   5951 3E 00         [ 7] 3109 	ld	a,#0x00
   5953 17            [ 4] 3110 	rla
   5954 DD 77 FC      [19] 3111 	ld	-4 (ix),a
   5957 7D            [ 4] 3112 	ld	a,l
   5958 93            [ 4] 3113 	sub	a, e
   5959 3E 00         [ 7] 3114 	ld	a,#0x00
   595B 17            [ 4] 3115 	rla
   595C DD 77 FD      [19] 3116 	ld	-3 (ix),a
   595F DD 7E 07      [19] 3117 	ld	a,7 (ix)
   5962 DD 96 05      [19] 3118 	sub	a, 5 (ix)
   5965 3E 00         [ 7] 3119 	ld	a,#0x00
   5967 17            [ 4] 3120 	rla
   5968 5F            [ 4] 3121 	ld	e,a
   5969 DD 7E FA      [19] 3122 	ld	a,-6 (ix)
   596C DD 96 07      [19] 3123 	sub	a, 7 (ix)
   596F 3E 00         [ 7] 3124 	ld	a,#0x00
   5971 17            [ 4] 3125 	rla
   5972 4F            [ 4] 3126 	ld	c,a
                           3127 ;src/CalcColision.h:33: if(atk >= 21)
   5973 DD 7E 08      [19] 3128 	ld	a,8 (ix)
   5976 D6 15         [ 7] 3129 	sub	a, #0x15
   5978 3E 00         [ 7] 3130 	ld	a,#0x00
   597A 17            [ 4] 3131 	rla
   597B DD 77 FF      [19] 3132 	ld	-1 (ix),a
                           3133 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   597E DD 7E FC      [19] 3134 	ld	a,-4 (ix)
   5981 B7            [ 4] 3135 	or	a, a
   5982 20 1C         [12] 3136 	jr	NZ,00109$
   5984 DD 7E FD      [19] 3137 	ld	a,-3 (ix)
   5987 B7            [ 4] 3138 	or	a,a
   5988 20 16         [12] 3139 	jr	NZ,00109$
   598A B3            [ 4] 3140 	or	a,e
   598B 20 13         [12] 3141 	jr	NZ,00109$
   598D B1            [ 4] 3142 	or	a,c
   598E 20 10         [12] 3143 	jr	NZ,00109$
                           3144 ;src/CalcColision.h:33: if(atk >= 21)
   5990 DD 7E FF      [19] 3145 	ld	a,-1 (ix)
   5993 B7            [ 4] 3146 	or	a, a
   5994 20 05         [12] 3147 	jr	NZ,00106$
                           3148 ;src/CalcColision.h:34: return 1;
   5996 2E 01         [ 7] 3149 	ld	l,#0x01
   5998 C3 24 5A      [10] 3150 	jp	00137$
   599B                    3151 00106$:
                           3152 ;src/CalcColision.h:36: return 2;
   599B 2E 02         [ 7] 3153 	ld	l,#0x02
   599D C3 24 5A      [10] 3154 	jp	00137$
   59A0                    3155 00109$:
                           3156 ;src/CalcColision.h:38: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   59A0 DD 7E 06      [19] 3157 	ld	a,6 (ix)
   59A3 DD 96 04      [19] 3158 	sub	a, 4 (ix)
   59A6 3E 00         [ 7] 3159 	ld	a,#0x00
   59A8 17            [ 4] 3160 	rla
   59A9 DD 77 FE      [19] 3161 	ld	-2 (ix),a
   59AC 7D            [ 4] 3162 	ld	a,l
   59AD DD 96 06      [19] 3163 	sub	a, 6 (ix)
   59B0 3E 00         [ 7] 3164 	ld	a,#0x00
   59B2 17            [ 4] 3165 	rla
   59B3 6F            [ 4] 3166 	ld	l,a
   59B4 DD 7E FE      [19] 3167 	ld	a,-2 (ix)
   59B7 B7            [ 4] 3168 	or	a,a
   59B8 20 17         [12] 3169 	jr	NZ,00117$
   59BA B5            [ 4] 3170 	or	a,l
   59BB 20 14         [12] 3171 	jr	NZ,00117$
   59BD B3            [ 4] 3172 	or	a,e
   59BE 20 11         [12] 3173 	jr	NZ,00117$
   59C0 B1            [ 4] 3174 	or	a,c
   59C1 20 0E         [12] 3175 	jr	NZ,00117$
                           3176 ;src/CalcColision.h:39: if(atk >= 21)
   59C3 DD 7E FF      [19] 3177 	ld	a,-1 (ix)
   59C6 B7            [ 4] 3178 	or	a, a
   59C7 20 04         [12] 3179 	jr	NZ,00114$
                           3180 ;src/CalcColision.h:40: return 1;
   59C9 2E 01         [ 7] 3181 	ld	l,#0x01
   59CB 18 57         [12] 3182 	jr	00137$
   59CD                    3183 00114$:
                           3184 ;src/CalcColision.h:42: return 2;
   59CD 2E 02         [ 7] 3185 	ld	l,#0x02
   59CF 18 53         [12] 3186 	jr	00137$
   59D1                    3187 00117$:
                           3188 ;src/CalcColision.h:44: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   59D1 DD 7E FB      [19] 3189 	ld	a,-5 (ix)
   59D4 DD 96 05      [19] 3190 	sub	a, 5 (ix)
   59D7 3E 00         [ 7] 3191 	ld	a,#0x00
   59D9 17            [ 4] 3192 	rla
   59DA 5F            [ 4] 3193 	ld	e,a
   59DB DD 7E FA      [19] 3194 	ld	a,-6 (ix)
   59DE DD 96 FB      [19] 3195 	sub	a, -5 (ix)
   59E1 3E 00         [ 7] 3196 	ld	a,#0x00
   59E3 17            [ 4] 3197 	rla
   59E4 67            [ 4] 3198 	ld	h,a
   59E5 DD 7E FE      [19] 3199 	ld	a,-2 (ix)
   59E8 B7            [ 4] 3200 	or	a,a
   59E9 20 17         [12] 3201 	jr	NZ,00125$
   59EB B5            [ 4] 3202 	or	a,l
   59EC 20 14         [12] 3203 	jr	NZ,00125$
   59EE B3            [ 4] 3204 	or	a,e
   59EF 20 11         [12] 3205 	jr	NZ,00125$
   59F1 B4            [ 4] 3206 	or	a,h
   59F2 20 0E         [12] 3207 	jr	NZ,00125$
                           3208 ;src/CalcColision.h:45: if(atk >= 21)
   59F4 DD 7E FF      [19] 3209 	ld	a,-1 (ix)
   59F7 B7            [ 4] 3210 	or	a, a
   59F8 20 04         [12] 3211 	jr	NZ,00122$
                           3212 ;src/CalcColision.h:46: return 1;
   59FA 2E 01         [ 7] 3213 	ld	l,#0x01
   59FC 18 26         [12] 3214 	jr	00137$
   59FE                    3215 00122$:
                           3216 ;src/CalcColision.h:48: return 2;
   59FE 2E 02         [ 7] 3217 	ld	l,#0x02
   5A00 18 22         [12] 3218 	jr	00137$
   5A02                    3219 00125$:
                           3220 ;src/CalcColision.h:50: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   5A02 DD 7E FC      [19] 3221 	ld	a,-4 (ix)
   5A05 B7            [ 4] 3222 	or	a, a
   5A06 20 1A         [12] 3223 	jr	NZ,00133$
   5A08 DD 7E FD      [19] 3224 	ld	a,-3 (ix)
   5A0B B7            [ 4] 3225 	or	a,a
   5A0C 20 14         [12] 3226 	jr	NZ,00133$
   5A0E B3            [ 4] 3227 	or	a,e
   5A0F 20 11         [12] 3228 	jr	NZ,00133$
   5A11 B4            [ 4] 3229 	or	a,h
   5A12 20 0E         [12] 3230 	jr	NZ,00133$
                           3231 ;src/CalcColision.h:51: if(atk >= 21)
   5A14 DD 7E FF      [19] 3232 	ld	a,-1 (ix)
   5A17 B7            [ 4] 3233 	or	a, a
   5A18 20 04         [12] 3234 	jr	NZ,00130$
                           3235 ;src/CalcColision.h:52: return 1;
   5A1A 2E 01         [ 7] 3236 	ld	l,#0x01
   5A1C 18 06         [12] 3237 	jr	00137$
   5A1E                    3238 00130$:
                           3239 ;src/CalcColision.h:54: return 2;
   5A1E 2E 02         [ 7] 3240 	ld	l,#0x02
   5A20 18 02         [12] 3241 	jr	00137$
   5A22                    3242 00133$:
                           3243 ;src/CalcColision.h:56: return 0;
   5A22 2E 00         [ 7] 3244 	ld	l,#0x00
   5A24                    3245 00137$:
   5A24 DD F9         [10] 3246 	ld	sp, ix
   5A26 DD E1         [14] 3247 	pop	ix
   5A28 C9            [10] 3248 	ret
                           3249 ;src/CalcColision.h:60: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3250 ;	---------------------------------
                           3251 ; Function checkBoundsCollisions
                           3252 ; ---------------------------------
   5A29                    3253 _checkBoundsCollisions::
   5A29 DD E5         [15] 3254 	push	ix
   5A2B DD 21 00 00   [14] 3255 	ld	ix,#0
   5A2F DD 39         [15] 3256 	add	ix,sp
   5A31 21 F2 FF      [10] 3257 	ld	hl,#-14
   5A34 39            [11] 3258 	add	hl,sp
   5A35 F9            [ 6] 3259 	ld	sp,hl
                           3260 ;src/CalcColision.h:61: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   5A36 3A 31 70      [13] 3261 	ld	a,(#(_player + 0x0001) + 0)
   5A39 DD 77 F8      [19] 3262 	ld	-8 (ix), a
   5A3C 07            [ 4] 3263 	rlca
   5A3D 07            [ 4] 3264 	rlca
   5A3E 07            [ 4] 3265 	rlca
   5A3F 07            [ 4] 3266 	rlca
   5A40 E6 0F         [ 7] 3267 	and	a,#0x0F
   5A42 4F            [ 4] 3268 	ld	c,a
   5A43 06 00         [ 7] 3269 	ld	b,#0x00
   5A45 69            [ 4] 3270 	ld	l, c
   5A46 60            [ 4] 3271 	ld	h, b
   5A47 29            [11] 3272 	add	hl, hl
   5A48 29            [11] 3273 	add	hl, hl
   5A49 09            [11] 3274 	add	hl, bc
   5A4A 29            [11] 3275 	add	hl, hl
   5A4B 29            [11] 3276 	add	hl, hl
   5A4C 3E 2A         [ 7] 3277 	ld	a,#<(_scene)
   5A4E 85            [ 4] 3278 	add	a, l
   5A4F DD 77 F4      [19] 3279 	ld	-12 (ix),a
   5A52 3E 6F         [ 7] 3280 	ld	a,#>(_scene)
   5A54 8C            [ 4] 3281 	adc	a, h
   5A55 DD 77 F5      [19] 3282 	ld	-11 (ix),a
   5A58 21 30 70      [10] 3283 	ld	hl, #_player + 0
   5A5B 4E            [ 7] 3284 	ld	c,(hl)
   5A5C 79            [ 4] 3285 	ld	a,c
   5A5D 0F            [ 4] 3286 	rrca
   5A5E 0F            [ 4] 3287 	rrca
   5A5F E6 3F         [ 7] 3288 	and	a,#0x3F
   5A61 DD 77 F7      [19] 3289 	ld	-9 (ix), a
   5A64 DD 86 F4      [19] 3290 	add	a, -12 (ix)
   5A67 6F            [ 4] 3291 	ld	l,a
   5A68 3E 00         [ 7] 3292 	ld	a,#0x00
   5A6A DD 8E F5      [19] 3293 	adc	a, -11 (ix)
   5A6D 67            [ 4] 3294 	ld	h,a
   5A6E 7E            [ 7] 3295 	ld	a,(hl)
   5A6F DD 77 F6      [19] 3296 	ld	-10 (ix), a
   5A72 3D            [ 4] 3297 	dec	a
   5A73 CA 89 5B      [10] 3298 	jp	Z,00124$
                           3299 ;src/CalcColision.h:62: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5A76 06 00         [ 7] 3300 	ld	b,#0x00
   5A78 21 03 00      [10] 3301 	ld	hl,#0x0003
   5A7B 09            [11] 3302 	add	hl,bc
   5A7C DD 75 FB      [19] 3303 	ld	-5 (ix),l
   5A7F DD 74 FC      [19] 3304 	ld	-4 (ix),h
   5A82 DD 7E FB      [19] 3305 	ld	a,-5 (ix)
   5A85 DD 77 FE      [19] 3306 	ld	-2 (ix),a
   5A88 DD 7E FC      [19] 3307 	ld	a,-4 (ix)
   5A8B DD 77 FF      [19] 3308 	ld	-1 (ix),a
   5A8E DD 7E FC      [19] 3309 	ld	a,-4 (ix)
   5A91 07            [ 4] 3310 	rlca
   5A92 E6 01         [ 7] 3311 	and	a,#0x01
   5A94 DD 77 FD      [19] 3312 	ld	-3 (ix),a
   5A97 21 06 00      [10] 3313 	ld	hl,#0x0006
   5A9A 09            [11] 3314 	add	hl,bc
   5A9B E3            [19] 3315 	ex	(sp), hl
   5A9C DD 7E FD      [19] 3316 	ld	a,-3 (ix)
   5A9F B7            [ 4] 3317 	or	a, a
   5AA0 28 0C         [12] 3318 	jr	Z,00132$
   5AA2 DD 7E F2      [19] 3319 	ld	a,-14 (ix)
   5AA5 DD 77 FE      [19] 3320 	ld	-2 (ix),a
   5AA8 DD 7E F3      [19] 3321 	ld	a,-13 (ix)
   5AAB DD 77 FF      [19] 3322 	ld	-1 (ix),a
   5AAE                    3323 00132$:
   5AAE DD 6E FE      [19] 3324 	ld	l,-2 (ix)
   5AB1 DD 66 FF      [19] 3325 	ld	h,-1 (ix)
   5AB4 CB 2C         [ 8] 3326 	sra	h
   5AB6 CB 1D         [ 8] 3327 	rr	l
   5AB8 CB 2C         [ 8] 3328 	sra	h
   5ABA CB 1D         [ 8] 3329 	rr	l
   5ABC DD 5E F4      [19] 3330 	ld	e,-12 (ix)
   5ABF DD 56 F5      [19] 3331 	ld	d,-11 (ix)
   5AC2 19            [11] 3332 	add	hl,de
   5AC3 7E            [ 7] 3333 	ld	a,(hl)
   5AC4 3D            [ 4] 3334 	dec	a
   5AC5 CA 89 5B      [10] 3335 	jp	Z,00124$
                           3336 ;src/CalcColision.h:63: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   5AC8 DD 5E F8      [19] 3337 	ld	e,-8 (ix)
   5ACB 16 00         [ 7] 3338 	ld	d,#0x00
   5ACD 21 0E 00      [10] 3339 	ld	hl,#0x000E
   5AD0 19            [11] 3340 	add	hl,de
   5AD1 4D            [ 4] 3341 	ld	c,l
   5AD2 44            [ 4] 3342 	ld	b,h
   5AD3 DD 71 FE      [19] 3343 	ld	-2 (ix),c
   5AD6 DD 70 FF      [19] 3344 	ld	-1 (ix),b
   5AD9 78            [ 4] 3345 	ld	a,b
   5ADA 07            [ 4] 3346 	rlca
   5ADB E6 01         [ 7] 3347 	and	a,#0x01
   5ADD DD 77 F8      [19] 3348 	ld	-8 (ix),a
   5AE0 21 1D 00      [10] 3349 	ld	hl,#0x001D
   5AE3 19            [11] 3350 	add	hl,de
   5AE4 DD 75 F9      [19] 3351 	ld	-7 (ix),l
   5AE7 DD 74 FA      [19] 3352 	ld	-6 (ix),h
   5AEA DD 7E F8      [19] 3353 	ld	a,-8 (ix)
   5AED B7            [ 4] 3354 	or	a, a
   5AEE 28 0C         [12] 3355 	jr	Z,00133$
   5AF0 DD 7E F9      [19] 3356 	ld	a,-7 (ix)
   5AF3 DD 77 FE      [19] 3357 	ld	-2 (ix),a
   5AF6 DD 7E FA      [19] 3358 	ld	a,-6 (ix)
   5AF9 DD 77 FF      [19] 3359 	ld	-1 (ix),a
   5AFC                    3360 00133$:
   5AFC DD 6E FE      [19] 3361 	ld	l,-2 (ix)
   5AFF DD 66 FF      [19] 3362 	ld	h,-1 (ix)
   5B02 CB 2C         [ 8] 3363 	sra	h
   5B04 CB 1D         [ 8] 3364 	rr	l
   5B06 CB 2C         [ 8] 3365 	sra	h
   5B08 CB 1D         [ 8] 3366 	rr	l
   5B0A CB 2C         [ 8] 3367 	sra	h
   5B0C CB 1D         [ 8] 3368 	rr	l
   5B0E CB 2C         [ 8] 3369 	sra	h
   5B10 CB 1D         [ 8] 3370 	rr	l
   5B12 5D            [ 4] 3371 	ld	e, l
   5B13 54            [ 4] 3372 	ld	d, h
   5B14 29            [11] 3373 	add	hl, hl
   5B15 29            [11] 3374 	add	hl, hl
   5B16 19            [11] 3375 	add	hl, de
   5B17 29            [11] 3376 	add	hl, hl
   5B18 29            [11] 3377 	add	hl, hl
   5B19 11 2A 6F      [10] 3378 	ld	de,#_scene
   5B1C 19            [11] 3379 	add	hl,de
   5B1D DD 5E F7      [19] 3380 	ld	e,-9 (ix)
   5B20 16 00         [ 7] 3381 	ld	d,#0x00
   5B22 19            [11] 3382 	add	hl,de
   5B23 7E            [ 7] 3383 	ld	a,(hl)
   5B24 3D            [ 4] 3384 	dec	a
   5B25 28 62         [12] 3385 	jr	Z,00124$
                           3386 ;src/CalcColision.h:64: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5B27 DD 71 FE      [19] 3387 	ld	-2 (ix),c
   5B2A DD 70 FF      [19] 3388 	ld	-1 (ix),b
   5B2D DD 7E F8      [19] 3389 	ld	a,-8 (ix)
   5B30 B7            [ 4] 3390 	or	a, a
   5B31 28 0C         [12] 3391 	jr	Z,00134$
   5B33 DD 7E F9      [19] 3392 	ld	a,-7 (ix)
   5B36 DD 77 FE      [19] 3393 	ld	-2 (ix),a
   5B39 DD 7E FA      [19] 3394 	ld	a,-6 (ix)
   5B3C DD 77 FF      [19] 3395 	ld	-1 (ix),a
   5B3F                    3396 00134$:
   5B3F DD 6E FE      [19] 3397 	ld	l,-2 (ix)
   5B42 DD 66 FF      [19] 3398 	ld	h,-1 (ix)
   5B45 CB 2C         [ 8] 3399 	sra	h
   5B47 CB 1D         [ 8] 3400 	rr	l
   5B49 CB 2C         [ 8] 3401 	sra	h
   5B4B CB 1D         [ 8] 3402 	rr	l
   5B4D CB 2C         [ 8] 3403 	sra	h
   5B4F CB 1D         [ 8] 3404 	rr	l
   5B51 CB 2C         [ 8] 3405 	sra	h
   5B53 CB 1D         [ 8] 3406 	rr	l
   5B55 5D            [ 4] 3407 	ld	e, l
   5B56 54            [ 4] 3408 	ld	d, h
   5B57 29            [11] 3409 	add	hl, hl
   5B58 29            [11] 3410 	add	hl, hl
   5B59 19            [11] 3411 	add	hl, de
   5B5A 29            [11] 3412 	add	hl, hl
   5B5B 29            [11] 3413 	add	hl, hl
   5B5C 3E 2A         [ 7] 3414 	ld	a,#<(_scene)
   5B5E 85            [ 4] 3415 	add	a, l
   5B5F DD 77 FE      [19] 3416 	ld	-2 (ix),a
   5B62 3E 6F         [ 7] 3417 	ld	a,#>(_scene)
   5B64 8C            [ 4] 3418 	adc	a, h
   5B65 DD 77 FF      [19] 3419 	ld	-1 (ix),a
   5B68 DD 6E FB      [19] 3420 	ld	l,-5 (ix)
   5B6B DD 66 FC      [19] 3421 	ld	h,-4 (ix)
   5B6E DD 7E FD      [19] 3422 	ld	a,-3 (ix)
   5B71 B7            [ 4] 3423 	or	a, a
   5B72 28 02         [12] 3424 	jr	Z,00135$
   5B74 E1            [10] 3425 	pop	hl
   5B75 E5            [11] 3426 	push	hl
   5B76                    3427 00135$:
   5B76 CB 2C         [ 8] 3428 	sra	h
   5B78 CB 1D         [ 8] 3429 	rr	l
   5B7A CB 2C         [ 8] 3430 	sra	h
   5B7C CB 1D         [ 8] 3431 	rr	l
   5B7E DD 5E FE      [19] 3432 	ld	e,-2 (ix)
   5B81 DD 56 FF      [19] 3433 	ld	d,-1 (ix)
   5B84 19            [11] 3434 	add	hl,de
   5B85 7E            [ 7] 3435 	ld	a,(hl)
   5B86 3D            [ 4] 3436 	dec	a
   5B87 20 10         [12] 3437 	jr	NZ,00125$
   5B89                    3438 00124$:
                           3439 ;src/CalcColision.h:66: player.x=player.lx;
   5B89 3A 32 70      [13] 3440 	ld	a, (#_player + 2)
   5B8C 21 30 70      [10] 3441 	ld	hl,#_player
   5B8F 77            [ 7] 3442 	ld	(hl),a
                           3443 ;src/CalcColision.h:67: player.y=player.ly;
   5B90 3A 33 70      [13] 3444 	ld	a, (#_player + 3)
   5B93 32 31 70      [13] 3445 	ld	(#(_player + 0x0001)),a
   5B96 C3 F5 5D      [10] 3446 	jp	00130$
   5B99                    3447 00125$:
                           3448 ;src/CalcColision.h:69: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5B99 DD 7E F6      [19] 3449 	ld	a,-10 (ix)
   5B9C D6 02         [ 7] 3450 	sub	a, #0x02
   5B9E CA 41 5C      [10] 3451 	jp	Z,00118$
                           3452 ;src/CalcColision.h:70: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5BA1 DD 6E FB      [19] 3453 	ld	l,-5 (ix)
   5BA4 DD 66 FC      [19] 3454 	ld	h,-4 (ix)
   5BA7 DD 7E FD      [19] 3455 	ld	a,-3 (ix)
   5BAA B7            [ 4] 3456 	or	a, a
   5BAB 28 02         [12] 3457 	jr	Z,00136$
   5BAD E1            [10] 3458 	pop	hl
   5BAE E5            [11] 3459 	push	hl
   5BAF                    3460 00136$:
   5BAF CB 2C         [ 8] 3461 	sra	h
   5BB1 CB 1D         [ 8] 3462 	rr	l
   5BB3 CB 2C         [ 8] 3463 	sra	h
   5BB5 CB 1D         [ 8] 3464 	rr	l
   5BB7 DD 5E F4      [19] 3465 	ld	e,-12 (ix)
   5BBA DD 56 F5      [19] 3466 	ld	d,-11 (ix)
   5BBD 19            [11] 3467 	add	hl,de
   5BBE 7E            [ 7] 3468 	ld	a,(hl)
   5BBF D6 02         [ 7] 3469 	sub	a, #0x02
   5BC1 CA 41 5C      [10] 3470 	jp	Z,00118$
                           3471 ;src/CalcColision.h:71: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5BC4 69            [ 4] 3472 	ld	l, c
   5BC5 60            [ 4] 3473 	ld	h, b
   5BC6 DD 7E F8      [19] 3474 	ld	a,-8 (ix)
   5BC9 B7            [ 4] 3475 	or	a, a
   5BCA 28 06         [12] 3476 	jr	Z,00137$
   5BCC DD 6E F9      [19] 3477 	ld	l,-7 (ix)
   5BCF DD 66 FA      [19] 3478 	ld	h,-6 (ix)
   5BD2                    3479 00137$:
   5BD2 CB 2C         [ 8] 3480 	sra	h
   5BD4 CB 1D         [ 8] 3481 	rr	l
   5BD6 CB 2C         [ 8] 3482 	sra	h
   5BD8 CB 1D         [ 8] 3483 	rr	l
   5BDA CB 2C         [ 8] 3484 	sra	h
   5BDC CB 1D         [ 8] 3485 	rr	l
   5BDE CB 2C         [ 8] 3486 	sra	h
   5BE0 CB 1D         [ 8] 3487 	rr	l
   5BE2 5D            [ 4] 3488 	ld	e, l
   5BE3 54            [ 4] 3489 	ld	d, h
   5BE4 29            [11] 3490 	add	hl, hl
   5BE5 29            [11] 3491 	add	hl, hl
   5BE6 19            [11] 3492 	add	hl, de
   5BE7 29            [11] 3493 	add	hl, hl
   5BE8 29            [11] 3494 	add	hl, hl
   5BE9 11 2A 6F      [10] 3495 	ld	de,#_scene
   5BEC 19            [11] 3496 	add	hl,de
   5BED DD 5E F7      [19] 3497 	ld	e,-9 (ix)
   5BF0 16 00         [ 7] 3498 	ld	d,#0x00
   5BF2 19            [11] 3499 	add	hl,de
   5BF3 7E            [ 7] 3500 	ld	a,(hl)
   5BF4 D6 02         [ 7] 3501 	sub	a, #0x02
   5BF6 28 49         [12] 3502 	jr	Z,00118$
                           3503 ;src/CalcColision.h:72: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5BF8 69            [ 4] 3504 	ld	l, c
   5BF9 60            [ 4] 3505 	ld	h, b
   5BFA DD 7E F8      [19] 3506 	ld	a,-8 (ix)
   5BFD B7            [ 4] 3507 	or	a, a
   5BFE 28 06         [12] 3508 	jr	Z,00138$
   5C00 DD 6E F9      [19] 3509 	ld	l,-7 (ix)
   5C03 DD 66 FA      [19] 3510 	ld	h,-6 (ix)
   5C06                    3511 00138$:
   5C06 CB 2C         [ 8] 3512 	sra	h
   5C08 CB 1D         [ 8] 3513 	rr	l
   5C0A CB 2C         [ 8] 3514 	sra	h
   5C0C CB 1D         [ 8] 3515 	rr	l
   5C0E CB 2C         [ 8] 3516 	sra	h
   5C10 CB 1D         [ 8] 3517 	rr	l
   5C12 CB 2C         [ 8] 3518 	sra	h
   5C14 CB 1D         [ 8] 3519 	rr	l
   5C16 5D            [ 4] 3520 	ld	e, l
   5C17 54            [ 4] 3521 	ld	d, h
   5C18 29            [11] 3522 	add	hl, hl
   5C19 29            [11] 3523 	add	hl, hl
   5C1A 19            [11] 3524 	add	hl, de
   5C1B 29            [11] 3525 	add	hl, hl
   5C1C 29            [11] 3526 	add	hl, hl
   5C1D 3E 2A         [ 7] 3527 	ld	a,#<(_scene)
   5C1F 85            [ 4] 3528 	add	a, l
   5C20 5F            [ 4] 3529 	ld	e,a
   5C21 3E 6F         [ 7] 3530 	ld	a,#>(_scene)
   5C23 8C            [ 4] 3531 	adc	a, h
   5C24 57            [ 4] 3532 	ld	d,a
   5C25 DD 6E FB      [19] 3533 	ld	l,-5 (ix)
   5C28 DD 66 FC      [19] 3534 	ld	h,-4 (ix)
   5C2B DD 7E FD      [19] 3535 	ld	a,-3 (ix)
   5C2E B7            [ 4] 3536 	or	a, a
   5C2F 28 02         [12] 3537 	jr	Z,00139$
   5C31 E1            [10] 3538 	pop	hl
   5C32 E5            [11] 3539 	push	hl
   5C33                    3540 00139$:
   5C33 CB 2C         [ 8] 3541 	sra	h
   5C35 CB 1D         [ 8] 3542 	rr	l
   5C37 CB 2C         [ 8] 3543 	sra	h
   5C39 CB 1D         [ 8] 3544 	rr	l
   5C3B 19            [11] 3545 	add	hl,de
   5C3C 7E            [ 7] 3546 	ld	a,(hl)
   5C3D D6 02         [ 7] 3547 	sub	a, #0x02
   5C3F 20 21         [12] 3548 	jr	NZ,00119$
   5C41                    3549 00118$:
                           3550 ;src/CalcColision.h:74: if(player.life < 3 && *corazon == 0){
   5C41 FD 21 36 70   [14] 3551 	ld	iy,#_player + 6
   5C45 FD 5E 00      [19] 3552 	ld	e, 0 (iy)
   5C48 7B            [ 4] 3553 	ld	a,e
   5C49 D6 03         [ 7] 3554 	sub	a, #0x03
   5C4B D2 F5 5D      [10] 3555 	jp	NC,00130$
   5C4E DD 6E 04      [19] 3556 	ld	l,4 (ix)
   5C51 DD 66 05      [19] 3557 	ld	h,5 (ix)
   5C54 7E            [ 7] 3558 	ld	a,(hl)
   5C55 B7            [ 4] 3559 	or	a, a
   5C56 C2 F5 5D      [10] 3560 	jp	NZ,00130$
                           3561 ;src/CalcColision.h:75: player.life += 1;
   5C59 1C            [ 4] 3562 	inc	e
   5C5A FD 73 00      [19] 3563 	ld	0 (iy), e
                           3564 ;src/CalcColision.h:76: *corazon = 1;
   5C5D 36 01         [10] 3565 	ld	(hl),#0x01
   5C5F C3 F5 5D      [10] 3566 	jp	00130$
   5C62                    3567 00119$:
                           3568 ;src/CalcColision.h:79: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5C62 DD 7E F6      [19] 3569 	ld	a,-10 (ix)
   5C65 D6 05         [ 7] 3570 	sub	a, #0x05
   5C67 CA 0A 5D      [10] 3571 	jp	Z,00112$
                           3572 ;src/CalcColision.h:80: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5C6A DD 6E FB      [19] 3573 	ld	l,-5 (ix)
   5C6D DD 66 FC      [19] 3574 	ld	h,-4 (ix)
   5C70 DD 7E FD      [19] 3575 	ld	a,-3 (ix)
   5C73 B7            [ 4] 3576 	or	a, a
   5C74 28 02         [12] 3577 	jr	Z,00140$
   5C76 E1            [10] 3578 	pop	hl
   5C77 E5            [11] 3579 	push	hl
   5C78                    3580 00140$:
   5C78 CB 2C         [ 8] 3581 	sra	h
   5C7A CB 1D         [ 8] 3582 	rr	l
   5C7C CB 2C         [ 8] 3583 	sra	h
   5C7E CB 1D         [ 8] 3584 	rr	l
   5C80 DD 5E F4      [19] 3585 	ld	e,-12 (ix)
   5C83 DD 56 F5      [19] 3586 	ld	d,-11 (ix)
   5C86 19            [11] 3587 	add	hl,de
   5C87 7E            [ 7] 3588 	ld	a,(hl)
   5C88 D6 05         [ 7] 3589 	sub	a, #0x05
   5C8A CA 0A 5D      [10] 3590 	jp	Z,00112$
                           3591 ;src/CalcColision.h:81: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5C8D 69            [ 4] 3592 	ld	l, c
   5C8E 60            [ 4] 3593 	ld	h, b
   5C8F DD 7E F8      [19] 3594 	ld	a,-8 (ix)
   5C92 B7            [ 4] 3595 	or	a, a
   5C93 28 06         [12] 3596 	jr	Z,00141$
   5C95 DD 6E F9      [19] 3597 	ld	l,-7 (ix)
   5C98 DD 66 FA      [19] 3598 	ld	h,-6 (ix)
   5C9B                    3599 00141$:
   5C9B CB 2C         [ 8] 3600 	sra	h
   5C9D CB 1D         [ 8] 3601 	rr	l
   5C9F CB 2C         [ 8] 3602 	sra	h
   5CA1 CB 1D         [ 8] 3603 	rr	l
   5CA3 CB 2C         [ 8] 3604 	sra	h
   5CA5 CB 1D         [ 8] 3605 	rr	l
   5CA7 CB 2C         [ 8] 3606 	sra	h
   5CA9 CB 1D         [ 8] 3607 	rr	l
   5CAB 5D            [ 4] 3608 	ld	e, l
   5CAC 54            [ 4] 3609 	ld	d, h
   5CAD 29            [11] 3610 	add	hl, hl
   5CAE 29            [11] 3611 	add	hl, hl
   5CAF 19            [11] 3612 	add	hl, de
   5CB0 29            [11] 3613 	add	hl, hl
   5CB1 29            [11] 3614 	add	hl, hl
   5CB2 11 2A 6F      [10] 3615 	ld	de,#_scene
   5CB5 19            [11] 3616 	add	hl,de
   5CB6 DD 5E F7      [19] 3617 	ld	e,-9 (ix)
   5CB9 16 00         [ 7] 3618 	ld	d,#0x00
   5CBB 19            [11] 3619 	add	hl,de
   5CBC 7E            [ 7] 3620 	ld	a,(hl)
   5CBD D6 05         [ 7] 3621 	sub	a, #0x05
   5CBF 28 49         [12] 3622 	jr	Z,00112$
                           3623 ;src/CalcColision.h:82: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5CC1 69            [ 4] 3624 	ld	l, c
   5CC2 60            [ 4] 3625 	ld	h, b
   5CC3 DD 7E F8      [19] 3626 	ld	a,-8 (ix)
   5CC6 B7            [ 4] 3627 	or	a, a
   5CC7 28 06         [12] 3628 	jr	Z,00142$
   5CC9 DD 6E F9      [19] 3629 	ld	l,-7 (ix)
   5CCC DD 66 FA      [19] 3630 	ld	h,-6 (ix)
   5CCF                    3631 00142$:
   5CCF CB 2C         [ 8] 3632 	sra	h
   5CD1 CB 1D         [ 8] 3633 	rr	l
   5CD3 CB 2C         [ 8] 3634 	sra	h
   5CD5 CB 1D         [ 8] 3635 	rr	l
   5CD7 CB 2C         [ 8] 3636 	sra	h
   5CD9 CB 1D         [ 8] 3637 	rr	l
   5CDB CB 2C         [ 8] 3638 	sra	h
   5CDD CB 1D         [ 8] 3639 	rr	l
   5CDF 5D            [ 4] 3640 	ld	e, l
   5CE0 54            [ 4] 3641 	ld	d, h
   5CE1 29            [11] 3642 	add	hl, hl
   5CE2 29            [11] 3643 	add	hl, hl
   5CE3 19            [11] 3644 	add	hl, de
   5CE4 29            [11] 3645 	add	hl, hl
   5CE5 29            [11] 3646 	add	hl, hl
   5CE6 3E 2A         [ 7] 3647 	ld	a,#<(_scene)
   5CE8 85            [ 4] 3648 	add	a, l
   5CE9 5F            [ 4] 3649 	ld	e,a
   5CEA 3E 6F         [ 7] 3650 	ld	a,#>(_scene)
   5CEC 8C            [ 4] 3651 	adc	a, h
   5CED 57            [ 4] 3652 	ld	d,a
   5CEE DD 6E FB      [19] 3653 	ld	l,-5 (ix)
   5CF1 DD 66 FC      [19] 3654 	ld	h,-4 (ix)
   5CF4 DD 7E FD      [19] 3655 	ld	a,-3 (ix)
   5CF7 B7            [ 4] 3656 	or	a, a
   5CF8 28 02         [12] 3657 	jr	Z,00143$
   5CFA E1            [10] 3658 	pop	hl
   5CFB E5            [11] 3659 	push	hl
   5CFC                    3660 00143$:
   5CFC CB 2C         [ 8] 3661 	sra	h
   5CFE CB 1D         [ 8] 3662 	rr	l
   5D00 CB 2C         [ 8] 3663 	sra	h
   5D02 CB 1D         [ 8] 3664 	rr	l
   5D04 19            [11] 3665 	add	hl,de
   5D05 7E            [ 7] 3666 	ld	a,(hl)
   5D06 D6 05         [ 7] 3667 	sub	a, #0x05
   5D08 20 21         [12] 3668 	jr	NZ,00113$
   5D0A                    3669 00112$:
                           3670 ;src/CalcColision.h:84: if(player.bullets < 3 && *flecha == 0){
   5D0A FD 21 3A 70   [14] 3671 	ld	iy,#_player + 10
   5D0E FD 5E 00      [19] 3672 	ld	e, 0 (iy)
   5D11 7B            [ 4] 3673 	ld	a,e
   5D12 D6 03         [ 7] 3674 	sub	a, #0x03
   5D14 D2 F5 5D      [10] 3675 	jp	NC,00130$
   5D17 DD 6E 06      [19] 3676 	ld	l,6 (ix)
   5D1A DD 66 07      [19] 3677 	ld	h,7 (ix)
   5D1D 7E            [ 7] 3678 	ld	a,(hl)
   5D1E B7            [ 4] 3679 	or	a, a
   5D1F C2 F5 5D      [10] 3680 	jp	NZ,00130$
                           3681 ;src/CalcColision.h:85: player.bullets += 1;
   5D22 1C            [ 4] 3682 	inc	e
   5D23 FD 73 00      [19] 3683 	ld	0 (iy), e
                           3684 ;src/CalcColision.h:86: *flecha = 1;
   5D26 36 01         [10] 3685 	ld	(hl),#0x01
   5D28 C3 F5 5D      [10] 3686 	jp	00130$
   5D2B                    3687 00113$:
                           3688 ;src/CalcColision.h:88: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5D2B DD 7E F6      [19] 3689 	ld	a,-10 (ix)
   5D2E D6 09         [ 7] 3690 	sub	a, #0x09
   5D30 CA DB 5D      [10] 3691 	jp	Z,00107$
                           3692 ;src/CalcColision.h:89: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5D33 DD 6E FB      [19] 3693 	ld	l,-5 (ix)
   5D36 DD 66 FC      [19] 3694 	ld	h,-4 (ix)
   5D39 DD 7E FD      [19] 3695 	ld	a,-3 (ix)
   5D3C B7            [ 4] 3696 	or	a, a
   5D3D 28 02         [12] 3697 	jr	Z,00144$
   5D3F E1            [10] 3698 	pop	hl
   5D40 E5            [11] 3699 	push	hl
   5D41                    3700 00144$:
   5D41 CB 2C         [ 8] 3701 	sra	h
   5D43 CB 1D         [ 8] 3702 	rr	l
   5D45 CB 2C         [ 8] 3703 	sra	h
   5D47 CB 1D         [ 8] 3704 	rr	l
   5D49 DD 5E F4      [19] 3705 	ld	e,-12 (ix)
   5D4C DD 56 F5      [19] 3706 	ld	d,-11 (ix)
   5D4F 19            [11] 3707 	add	hl,de
   5D50 7E            [ 7] 3708 	ld	a,(hl)
   5D51 D6 09         [ 7] 3709 	sub	a, #0x09
   5D53 CA DB 5D      [10] 3710 	jp	Z,00107$
                           3711 ;src/CalcColision.h:90: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5D56 69            [ 4] 3712 	ld	l, c
   5D57 60            [ 4] 3713 	ld	h, b
   5D58 DD 7E F8      [19] 3714 	ld	a,-8 (ix)
   5D5B B7            [ 4] 3715 	or	a, a
   5D5C 28 06         [12] 3716 	jr	Z,00145$
   5D5E DD 6E F9      [19] 3717 	ld	l,-7 (ix)
   5D61 DD 66 FA      [19] 3718 	ld	h,-6 (ix)
   5D64                    3719 00145$:
   5D64 CB 2C         [ 8] 3720 	sra	h
   5D66 CB 1D         [ 8] 3721 	rr	l
   5D68 CB 2C         [ 8] 3722 	sra	h
   5D6A CB 1D         [ 8] 3723 	rr	l
   5D6C CB 2C         [ 8] 3724 	sra	h
   5D6E CB 1D         [ 8] 3725 	rr	l
   5D70 CB 2C         [ 8] 3726 	sra	h
   5D72 CB 1D         [ 8] 3727 	rr	l
   5D74 5D            [ 4] 3728 	ld	e, l
   5D75 54            [ 4] 3729 	ld	d, h
   5D76 29            [11] 3730 	add	hl, hl
   5D77 29            [11] 3731 	add	hl, hl
   5D78 19            [11] 3732 	add	hl, de
   5D79 29            [11] 3733 	add	hl, hl
   5D7A 29            [11] 3734 	add	hl, hl
   5D7B 11 2A 6F      [10] 3735 	ld	de,#_scene
   5D7E 19            [11] 3736 	add	hl,de
   5D7F DD 5E F7      [19] 3737 	ld	e,-9 (ix)
   5D82 16 00         [ 7] 3738 	ld	d,#0x00
   5D84 19            [11] 3739 	add	hl,de
   5D85 7E            [ 7] 3740 	ld	a,(hl)
   5D86 D6 09         [ 7] 3741 	sub	a, #0x09
   5D88 28 51         [12] 3742 	jr	Z,00107$
                           3743 ;src/CalcColision.h:91: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5D8A DD 7E F8      [19] 3744 	ld	a,-8 (ix)
   5D8D B7            [ 4] 3745 	or	a, a
   5D8E 28 06         [12] 3746 	jr	Z,00146$
   5D90 DD 4E F9      [19] 3747 	ld	c,-7 (ix)
   5D93 DD 46 FA      [19] 3748 	ld	b,-6 (ix)
   5D96                    3749 00146$:
   5D96 CB 28         [ 8] 3750 	sra	b
   5D98 CB 19         [ 8] 3751 	rr	c
   5D9A CB 28         [ 8] 3752 	sra	b
   5D9C CB 19         [ 8] 3753 	rr	c
   5D9E CB 28         [ 8] 3754 	sra	b
   5DA0 CB 19         [ 8] 3755 	rr	c
   5DA2 CB 28         [ 8] 3756 	sra	b
   5DA4 CB 19         [ 8] 3757 	rr	c
   5DA6 69            [ 4] 3758 	ld	l, c
   5DA7 60            [ 4] 3759 	ld	h, b
   5DA8 29            [11] 3760 	add	hl, hl
   5DA9 29            [11] 3761 	add	hl, hl
   5DAA 09            [11] 3762 	add	hl, bc
   5DAB 29            [11] 3763 	add	hl, hl
   5DAC 29            [11] 3764 	add	hl, hl
   5DAD 3E 2A         [ 7] 3765 	ld	a,#<(_scene)
   5DAF 85            [ 4] 3766 	add	a, l
   5DB0 DD 77 F9      [19] 3767 	ld	-7 (ix),a
   5DB3 3E 6F         [ 7] 3768 	ld	a,#>(_scene)
   5DB5 8C            [ 4] 3769 	adc	a, h
   5DB6 DD 77 FA      [19] 3770 	ld	-6 (ix),a
   5DB9 DD 6E FB      [19] 3771 	ld	l,-5 (ix)
   5DBC DD 66 FC      [19] 3772 	ld	h,-4 (ix)
   5DBF DD 7E FD      [19] 3773 	ld	a,-3 (ix)
   5DC2 B7            [ 4] 3774 	or	a, a
   5DC3 28 02         [12] 3775 	jr	Z,00147$
   5DC5 E1            [10] 3776 	pop	hl
   5DC6 E5            [11] 3777 	push	hl
   5DC7                    3778 00147$:
   5DC7 CB 2C         [ 8] 3779 	sra	h
   5DC9 CB 1D         [ 8] 3780 	rr	l
   5DCB CB 2C         [ 8] 3781 	sra	h
   5DCD CB 1D         [ 8] 3782 	rr	l
   5DCF DD 5E F9      [19] 3783 	ld	e,-7 (ix)
   5DD2 DD 56 FA      [19] 3784 	ld	d,-6 (ix)
   5DD5 19            [11] 3785 	add	hl,de
   5DD6 7E            [ 7] 3786 	ld	a,(hl)
   5DD7 D6 09         [ 7] 3787 	sub	a, #0x09
   5DD9 20 1A         [12] 3788 	jr	NZ,00130$
   5DDB                    3789 00107$:
                           3790 ;src/CalcColision.h:94: cpct_clearScreen(0);
   5DDB 21 00 40      [10] 3791 	ld	hl,#0x4000
   5DDE E5            [11] 3792 	push	hl
   5DDF AF            [ 4] 3793 	xor	a, a
   5DE0 F5            [11] 3794 	push	af
   5DE1 33            [ 6] 3795 	inc	sp
   5DE2 26 C0         [ 7] 3796 	ld	h, #0xC0
   5DE4 E5            [11] 3797 	push	hl
   5DE5 CD 41 6D      [17] 3798 	call	_cpct_memset
                           3799 ;src/CalcColision.h:95: map+=1;
   5DE8 21 1B 70      [10] 3800 	ld	hl, #_map+0
   5DEB 34            [11] 3801 	inc	(hl)
                           3802 ;src/CalcColision.h:96: drawMap(map);
   5DEC 3A 1B 70      [13] 3803 	ld	a,(_map)
   5DEF F5            [11] 3804 	push	af
   5DF0 33            [ 6] 3805 	inc	sp
   5DF1 CD C0 46      [17] 3806 	call	_drawMap
   5DF4 33            [ 6] 3807 	inc	sp
   5DF5                    3808 00130$:
   5DF5 DD F9         [10] 3809 	ld	sp, ix
   5DF7 DD E1         [14] 3810 	pop	ix
   5DF9 C9            [10] 3811 	ret
                           3812 ;src/CalcColision.h:100: u8 checkArrowCollisions(){
                           3813 ;	---------------------------------
                           3814 ; Function checkArrowCollisions
                           3815 ; ---------------------------------
   5DFA                    3816 _checkArrowCollisions::
   5DFA DD E5         [15] 3817 	push	ix
   5DFC DD 21 00 00   [14] 3818 	ld	ix,#0
   5E00 DD 39         [15] 3819 	add	ix,sp
   5E02 21 F2 FF      [10] 3820 	ld	hl,#-14
   5E05 39            [11] 3821 	add	hl,sp
   5E06 F9            [ 6] 3822 	ld	sp,hl
                           3823 ;src/CalcColision.h:103: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5E07 3A 27 70      [13] 3824 	ld	a,(#(_object + 0x0001) + 0)
   5E0A DD 77 F3      [19] 3825 	ld	-13 (ix), a
   5E0D 07            [ 4] 3826 	rlca
   5E0E 07            [ 4] 3827 	rlca
   5E0F 07            [ 4] 3828 	rlca
   5E10 07            [ 4] 3829 	rlca
   5E11 E6 0F         [ 7] 3830 	and	a,#0x0F
   5E13 4F            [ 4] 3831 	ld	c,a
   5E14 06 00         [ 7] 3832 	ld	b,#0x00
   5E16 69            [ 4] 3833 	ld	l, c
   5E17 60            [ 4] 3834 	ld	h, b
   5E18 29            [11] 3835 	add	hl, hl
   5E19 29            [11] 3836 	add	hl, hl
   5E1A 09            [11] 3837 	add	hl, bc
   5E1B 29            [11] 3838 	add	hl, hl
   5E1C 29            [11] 3839 	add	hl, hl
   5E1D 3E 2A         [ 7] 3840 	ld	a,#<(_scene)
   5E1F 85            [ 4] 3841 	add	a, l
   5E20 DD 77 F6      [19] 3842 	ld	-10 (ix),a
   5E23 3E 6F         [ 7] 3843 	ld	a,#>(_scene)
   5E25 8C            [ 4] 3844 	adc	a, h
   5E26 DD 77 F7      [19] 3845 	ld	-9 (ix),a
   5E29 21 26 70      [10] 3846 	ld	hl, #_object + 0
   5E2C 4E            [ 7] 3847 	ld	c,(hl)
   5E2D 79            [ 4] 3848 	ld	a,c
   5E2E 0F            [ 4] 3849 	rrca
   5E2F 0F            [ 4] 3850 	rrca
   5E30 E6 3F         [ 7] 3851 	and	a,#0x3F
   5E32 DD 77 F2      [19] 3852 	ld	-14 (ix), a
   5E35 DD 86 F6      [19] 3853 	add	a, -10 (ix)
   5E38 6F            [ 4] 3854 	ld	l,a
   5E39 3E 00         [ 7] 3855 	ld	a,#0x00
   5E3B DD 8E F7      [19] 3856 	adc	a, -9 (ix)
   5E3E 67            [ 4] 3857 	ld	h,a
   5E3F 7E            [ 7] 3858 	ld	a,(hl)
                           3859 ;src/CalcColision.h:108: object.x=object.lx;
                           3860 ;src/CalcColision.h:109: object.y=object.ly;
                           3861 ;src/CalcColision.h:103: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5E40 DD 77 F4      [19] 3862 	ld	-12 (ix), a
   5E43 3D            [ 4] 3863 	dec	a
   5E44 CA 63 5F      [10] 3864 	jp	Z,00101$
                           3865 ;src/CalcColision.h:104: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5E47 06 00         [ 7] 3866 	ld	b,#0x00
   5E49 21 03 00      [10] 3867 	ld	hl,#0x0003
   5E4C 09            [11] 3868 	add	hl,bc
   5E4D DD 75 FC      [19] 3869 	ld	-4 (ix),l
   5E50 DD 74 FD      [19] 3870 	ld	-3 (ix),h
   5E53 DD 7E FC      [19] 3871 	ld	a,-4 (ix)
   5E56 DD 77 FA      [19] 3872 	ld	-6 (ix),a
   5E59 DD 7E FD      [19] 3873 	ld	a,-3 (ix)
   5E5C DD 77 FB      [19] 3874 	ld	-5 (ix),a
   5E5F DD 7E FD      [19] 3875 	ld	a,-3 (ix)
   5E62 07            [ 4] 3876 	rlca
   5E63 E6 01         [ 7] 3877 	and	a,#0x01
   5E65 DD 77 F5      [19] 3878 	ld	-11 (ix),a
   5E68 21 06 00      [10] 3879 	ld	hl,#0x0006
   5E6B 09            [11] 3880 	add	hl,bc
   5E6C DD 75 FE      [19] 3881 	ld	-2 (ix),l
   5E6F DD 74 FF      [19] 3882 	ld	-1 (ix),h
   5E72 DD 7E F5      [19] 3883 	ld	a,-11 (ix)
   5E75 B7            [ 4] 3884 	or	a, a
   5E76 28 0C         [12] 3885 	jr	Z,00113$
   5E78 DD 7E FE      [19] 3886 	ld	a,-2 (ix)
   5E7B DD 77 FA      [19] 3887 	ld	-6 (ix),a
   5E7E DD 7E FF      [19] 3888 	ld	a,-1 (ix)
   5E81 DD 77 FB      [19] 3889 	ld	-5 (ix),a
   5E84                    3890 00113$:
   5E84 DD 6E FA      [19] 3891 	ld	l,-6 (ix)
   5E87 DD 66 FB      [19] 3892 	ld	h,-5 (ix)
   5E8A CB 2C         [ 8] 3893 	sra	h
   5E8C CB 1D         [ 8] 3894 	rr	l
   5E8E CB 2C         [ 8] 3895 	sra	h
   5E90 CB 1D         [ 8] 3896 	rr	l
   5E92 DD 5E F6      [19] 3897 	ld	e,-10 (ix)
   5E95 DD 56 F7      [19] 3898 	ld	d,-9 (ix)
   5E98 19            [11] 3899 	add	hl,de
   5E99 7E            [ 7] 3900 	ld	a,(hl)
   5E9A 3D            [ 4] 3901 	dec	a
   5E9B CA 63 5F      [10] 3902 	jp	Z,00101$
                           3903 ;src/CalcColision.h:105: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 1
   5E9E DD 5E F3      [19] 3904 	ld	e,-13 (ix)
   5EA1 16 00         [ 7] 3905 	ld	d,#0x00
   5EA3 21 06 00      [10] 3906 	ld	hl,#0x0006
   5EA6 19            [11] 3907 	add	hl,de
   5EA7 4D            [ 4] 3908 	ld	c,l
   5EA8 44            [ 4] 3909 	ld	b,h
   5EA9 DD 71 FA      [19] 3910 	ld	-6 (ix),c
   5EAC DD 70 FB      [19] 3911 	ld	-5 (ix),b
   5EAF 78            [ 4] 3912 	ld	a,b
   5EB0 07            [ 4] 3913 	rlca
   5EB1 E6 01         [ 7] 3914 	and	a,#0x01
   5EB3 DD 77 F3      [19] 3915 	ld	-13 (ix),a
   5EB6 21 15 00      [10] 3916 	ld	hl,#0x0015
   5EB9 19            [11] 3917 	add	hl,de
   5EBA DD 75 F8      [19] 3918 	ld	-8 (ix),l
   5EBD DD 74 F9      [19] 3919 	ld	-7 (ix),h
   5EC0 DD 7E F3      [19] 3920 	ld	a,-13 (ix)
   5EC3 B7            [ 4] 3921 	or	a, a
   5EC4 28 0C         [12] 3922 	jr	Z,00114$
   5EC6 DD 7E F8      [19] 3923 	ld	a,-8 (ix)
   5EC9 DD 77 FA      [19] 3924 	ld	-6 (ix),a
   5ECC DD 7E F9      [19] 3925 	ld	a,-7 (ix)
   5ECF DD 77 FB      [19] 3926 	ld	-5 (ix),a
   5ED2                    3927 00114$:
   5ED2 DD 6E FA      [19] 3928 	ld	l,-6 (ix)
   5ED5 DD 66 FB      [19] 3929 	ld	h,-5 (ix)
   5ED8 CB 2C         [ 8] 3930 	sra	h
   5EDA CB 1D         [ 8] 3931 	rr	l
   5EDC CB 2C         [ 8] 3932 	sra	h
   5EDE CB 1D         [ 8] 3933 	rr	l
   5EE0 CB 2C         [ 8] 3934 	sra	h
   5EE2 CB 1D         [ 8] 3935 	rr	l
   5EE4 CB 2C         [ 8] 3936 	sra	h
   5EE6 CB 1D         [ 8] 3937 	rr	l
   5EE8 5D            [ 4] 3938 	ld	e, l
   5EE9 54            [ 4] 3939 	ld	d, h
   5EEA 29            [11] 3940 	add	hl, hl
   5EEB 29            [11] 3941 	add	hl, hl
   5EEC 19            [11] 3942 	add	hl, de
   5EED 29            [11] 3943 	add	hl, hl
   5EEE 29            [11] 3944 	add	hl, hl
   5EEF 11 2A 6F      [10] 3945 	ld	de,#_scene
   5EF2 19            [11] 3946 	add	hl,de
   5EF3 DD 5E F2      [19] 3947 	ld	e,-14 (ix)
   5EF6 16 00         [ 7] 3948 	ld	d,#0x00
   5EF8 19            [11] 3949 	add	hl,de
   5EF9 7E            [ 7] 3950 	ld	a,(hl)
   5EFA 3D            [ 4] 3951 	dec	a
   5EFB 28 66         [12] 3952 	jr	Z,00101$
                           3953 ;src/CalcColision.h:106: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5EFD DD 71 FA      [19] 3954 	ld	-6 (ix),c
   5F00 DD 70 FB      [19] 3955 	ld	-5 (ix),b
   5F03 DD 7E F3      [19] 3956 	ld	a,-13 (ix)
   5F06 B7            [ 4] 3957 	or	a, a
   5F07 28 0C         [12] 3958 	jr	Z,00115$
   5F09 DD 7E F8      [19] 3959 	ld	a,-8 (ix)
   5F0C DD 77 FA      [19] 3960 	ld	-6 (ix),a
   5F0F DD 7E F9      [19] 3961 	ld	a,-7 (ix)
   5F12 DD 77 FB      [19] 3962 	ld	-5 (ix),a
   5F15                    3963 00115$:
   5F15 DD 6E FA      [19] 3964 	ld	l,-6 (ix)
   5F18 DD 66 FB      [19] 3965 	ld	h,-5 (ix)
   5F1B CB 2C         [ 8] 3966 	sra	h
   5F1D CB 1D         [ 8] 3967 	rr	l
   5F1F CB 2C         [ 8] 3968 	sra	h
   5F21 CB 1D         [ 8] 3969 	rr	l
   5F23 CB 2C         [ 8] 3970 	sra	h
   5F25 CB 1D         [ 8] 3971 	rr	l
   5F27 CB 2C         [ 8] 3972 	sra	h
   5F29 CB 1D         [ 8] 3973 	rr	l
   5F2B 5D            [ 4] 3974 	ld	e, l
   5F2C 54            [ 4] 3975 	ld	d, h
   5F2D 29            [11] 3976 	add	hl, hl
   5F2E 29            [11] 3977 	add	hl, hl
   5F2F 19            [11] 3978 	add	hl, de
   5F30 29            [11] 3979 	add	hl, hl
   5F31 29            [11] 3980 	add	hl, hl
   5F32 3E 2A         [ 7] 3981 	ld	a,#<(_scene)
   5F34 85            [ 4] 3982 	add	a, l
   5F35 DD 77 FA      [19] 3983 	ld	-6 (ix),a
   5F38 3E 6F         [ 7] 3984 	ld	a,#>(_scene)
   5F3A 8C            [ 4] 3985 	adc	a, h
   5F3B DD 77 FB      [19] 3986 	ld	-5 (ix),a
   5F3E DD 6E FC      [19] 3987 	ld	l,-4 (ix)
   5F41 DD 66 FD      [19] 3988 	ld	h,-3 (ix)
   5F44 DD 7E F5      [19] 3989 	ld	a,-11 (ix)
   5F47 B7            [ 4] 3990 	or	a, a
   5F48 28 06         [12] 3991 	jr	Z,00116$
   5F4A DD 6E FE      [19] 3992 	ld	l,-2 (ix)
   5F4D DD 66 FF      [19] 3993 	ld	h,-1 (ix)
   5F50                    3994 00116$:
   5F50 CB 2C         [ 8] 3995 	sra	h
   5F52 CB 1D         [ 8] 3996 	rr	l
   5F54 CB 2C         [ 8] 3997 	sra	h
   5F56 CB 1D         [ 8] 3998 	rr	l
   5F58 DD 5E FA      [19] 3999 	ld	e,-6 (ix)
   5F5B DD 56 FB      [19] 4000 	ld	d,-5 (ix)
   5F5E 19            [11] 4001 	add	hl,de
   5F5F 7E            [ 7] 4002 	ld	a,(hl)
   5F60 3D            [ 4] 4003 	dec	a
   5F61 20 11         [12] 4004 	jr	NZ,00102$
   5F63                    4005 00101$:
                           4006 ;src/CalcColision.h:108: object.x=object.lx;
   5F63 3A 28 70      [13] 4007 	ld	a, (#(_object + 0x0002) + 0)
   5F66 32 26 70      [13] 4008 	ld	(#_object),a
                           4009 ;src/CalcColision.h:109: object.y=object.ly;
   5F69 3A 29 70      [13] 4010 	ld	a, (#(_object + 0x0003) + 0)
   5F6C 32 27 70      [13] 4011 	ld	(#(_object + 0x0001)),a
                           4012 ;src/CalcColision.h:111: return bound;
   5F6F 2E 01         [ 7] 4013 	ld	l,#0x01
   5F71 C3 3E 60      [10] 4014 	jp	00111$
   5F74                    4015 00102$:
                           4016 ;src/CalcColision.h:114: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 9
   5F74 DD 7E F4      [19] 4017 	ld	a,-12 (ix)
   5F77 D6 09         [ 7] 4018 	sub	a, #0x09
   5F79 CA 2C 60      [10] 4019 	jp	Z,00106$
                           4020 ;src/CalcColision.h:115: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   5F7C DD 6E FC      [19] 4021 	ld	l,-4 (ix)
   5F7F DD 66 FD      [19] 4022 	ld	h,-3 (ix)
   5F82 DD 7E F5      [19] 4023 	ld	a,-11 (ix)
   5F85 B7            [ 4] 4024 	or	a, a
   5F86 28 06         [12] 4025 	jr	Z,00117$
   5F88 DD 6E FE      [19] 4026 	ld	l,-2 (ix)
   5F8B DD 66 FF      [19] 4027 	ld	h,-1 (ix)
   5F8E                    4028 00117$:
   5F8E CB 2C         [ 8] 4029 	sra	h
   5F90 CB 1D         [ 8] 4030 	rr	l
   5F92 CB 2C         [ 8] 4031 	sra	h
   5F94 CB 1D         [ 8] 4032 	rr	l
   5F96 DD 5E F6      [19] 4033 	ld	e,-10 (ix)
   5F99 DD 56 F7      [19] 4034 	ld	d,-9 (ix)
   5F9C 19            [11] 4035 	add	hl,de
   5F9D 7E            [ 7] 4036 	ld	a,(hl)
   5F9E D6 09         [ 7] 4037 	sub	a, #0x09
   5FA0 CA 2C 60      [10] 4038 	jp	Z,00106$
                           4039 ;src/CalcColision.h:116: || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 9
   5FA3 69            [ 4] 4040 	ld	l, c
   5FA4 60            [ 4] 4041 	ld	h, b
   5FA5 DD 7E F3      [19] 4042 	ld	a,-13 (ix)
   5FA8 B7            [ 4] 4043 	or	a, a
   5FA9 28 06         [12] 4044 	jr	Z,00118$
   5FAB DD 6E F8      [19] 4045 	ld	l,-8 (ix)
   5FAE DD 66 F9      [19] 4046 	ld	h,-7 (ix)
   5FB1                    4047 00118$:
   5FB1 CB 2C         [ 8] 4048 	sra	h
   5FB3 CB 1D         [ 8] 4049 	rr	l
   5FB5 CB 2C         [ 8] 4050 	sra	h
   5FB7 CB 1D         [ 8] 4051 	rr	l
   5FB9 CB 2C         [ 8] 4052 	sra	h
   5FBB CB 1D         [ 8] 4053 	rr	l
   5FBD CB 2C         [ 8] 4054 	sra	h
   5FBF CB 1D         [ 8] 4055 	rr	l
   5FC1 5D            [ 4] 4056 	ld	e, l
   5FC2 54            [ 4] 4057 	ld	d, h
   5FC3 29            [11] 4058 	add	hl, hl
   5FC4 29            [11] 4059 	add	hl, hl
   5FC5 19            [11] 4060 	add	hl, de
   5FC6 29            [11] 4061 	add	hl, hl
   5FC7 29            [11] 4062 	add	hl, hl
   5FC8 11 2A 6F      [10] 4063 	ld	de,#_scene
   5FCB 19            [11] 4064 	add	hl,de
   5FCC DD 5E F2      [19] 4065 	ld	e,-14 (ix)
   5FCF 16 00         [ 7] 4066 	ld	d,#0x00
   5FD1 19            [11] 4067 	add	hl,de
   5FD2 7E            [ 7] 4068 	ld	a,(hl)
   5FD3 D6 09         [ 7] 4069 	sub	a, #0x09
   5FD5 28 55         [12] 4070 	jr	Z,00106$
                           4071 ;src/CalcColision.h:117: || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
   5FD7 DD 7E F3      [19] 4072 	ld	a,-13 (ix)
   5FDA B7            [ 4] 4073 	or	a, a
   5FDB 28 06         [12] 4074 	jr	Z,00119$
   5FDD DD 4E F8      [19] 4075 	ld	c,-8 (ix)
   5FE0 DD 46 F9      [19] 4076 	ld	b,-7 (ix)
   5FE3                    4077 00119$:
   5FE3 CB 28         [ 8] 4078 	sra	b
   5FE5 CB 19         [ 8] 4079 	rr	c
   5FE7 CB 28         [ 8] 4080 	sra	b
   5FE9 CB 19         [ 8] 4081 	rr	c
   5FEB CB 28         [ 8] 4082 	sra	b
   5FED CB 19         [ 8] 4083 	rr	c
   5FEF CB 28         [ 8] 4084 	sra	b
   5FF1 CB 19         [ 8] 4085 	rr	c
   5FF3 69            [ 4] 4086 	ld	l, c
   5FF4 60            [ 4] 4087 	ld	h, b
   5FF5 29            [11] 4088 	add	hl, hl
   5FF6 29            [11] 4089 	add	hl, hl
   5FF7 09            [11] 4090 	add	hl, bc
   5FF8 29            [11] 4091 	add	hl, hl
   5FF9 29            [11] 4092 	add	hl, hl
   5FFA 3E 2A         [ 7] 4093 	ld	a,#<(_scene)
   5FFC 85            [ 4] 4094 	add	a, l
   5FFD DD 77 F8      [19] 4095 	ld	-8 (ix),a
   6000 3E 6F         [ 7] 4096 	ld	a,#>(_scene)
   6002 8C            [ 4] 4097 	adc	a, h
   6003 DD 77 F9      [19] 4098 	ld	-7 (ix),a
   6006 DD 6E FC      [19] 4099 	ld	l,-4 (ix)
   6009 DD 66 FD      [19] 4100 	ld	h,-3 (ix)
   600C DD 7E F5      [19] 4101 	ld	a,-11 (ix)
   600F B7            [ 4] 4102 	or	a, a
   6010 28 06         [12] 4103 	jr	Z,00120$
   6012 DD 6E FE      [19] 4104 	ld	l,-2 (ix)
   6015 DD 66 FF      [19] 4105 	ld	h,-1 (ix)
   6018                    4106 00120$:
   6018 CB 2C         [ 8] 4107 	sra	h
   601A CB 1D         [ 8] 4108 	rr	l
   601C CB 2C         [ 8] 4109 	sra	h
   601E CB 1D         [ 8] 4110 	rr	l
   6020 DD 5E F8      [19] 4111 	ld	e,-8 (ix)
   6023 DD 56 F9      [19] 4112 	ld	d,-7 (ix)
   6026 19            [11] 4113 	add	hl,de
   6027 7E            [ 7] 4114 	ld	a,(hl)
   6028 D6 09         [ 7] 4115 	sub	a, #0x09
   602A 20 10         [12] 4116 	jr	NZ,00107$
   602C                    4117 00106$:
                           4118 ;src/CalcColision.h:119: object.x=object.lx;
   602C 3A 28 70      [13] 4119 	ld	a, (#(_object + 0x0002) + 0)
   602F 32 26 70      [13] 4120 	ld	(#_object),a
                           4121 ;src/CalcColision.h:120: object.y=object.ly;
   6032 3A 29 70      [13] 4122 	ld	a, (#(_object + 0x0003) + 0)
   6035 32 27 70      [13] 4123 	ld	(#(_object + 0x0001)),a
                           4124 ;src/CalcColision.h:122: return bound;
   6038 2E 01         [ 7] 4125 	ld	l,#0x01
   603A 18 02         [12] 4126 	jr	00111$
   603C                    4127 00107$:
                           4128 ;src/CalcColision.h:125: return bound;
   603C 2E 00         [ 7] 4129 	ld	l,#0x00
   603E                    4130 00111$:
   603E DD F9         [10] 4131 	ld	sp, ix
   6040 DD E1         [14] 4132 	pop	ix
   6042 C9            [10] 4133 	ret
                           4134 ;src/keyboard.h:13: u8* checkKeyboard(){
                           4135 ;	---------------------------------
                           4136 ; Function checkKeyboard
                           4137 ; ---------------------------------
   6043                    4138 _checkKeyboard::
   6043 DD E5         [15] 4139 	push	ix
   6045 DD 21 00 00   [14] 4140 	ld	ix,#0
   6049 DD 39         [15] 4141 	add	ix,sp
   604B 21 FA FF      [10] 4142 	ld	hl,#-6
   604E 39            [11] 4143 	add	hl,sp
   604F F9            [ 6] 4144 	ld	sp,hl
                           4145 ;src/keyboard.h:14: u8 *s = NULL;
   6050 DD 36 FD 00   [19] 4146 	ld	-3 (ix),#0x00
   6054 DD 36 FE 00   [19] 4147 	ld	-2 (ix),#0x00
                           4148 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   6058 21 05 80      [10] 4149 	ld	hl,#0x8005
   605B CD 59 6A      [17] 4150 	call	_cpct_isKeyPressed
   605E 4D            [ 4] 4151 	ld	c,l
   605F 79            [ 4] 4152 	ld	a,c
   6060 B7            [ 4] 4153 	or	a, a
   6061 28 68         [12] 4154 	jr	Z,00145$
   6063 21 38 70      [10] 4155 	ld	hl, #(_player + 0x0008) + 0
   6066 7E            [ 7] 4156 	ld	a,(hl)
   6067 DD 77 FC      [19] 4157 	ld	-4 (ix), a
   606A D6 14         [ 7] 4158 	sub	a, #0x14
   606C 38 5D         [12] 4159 	jr	C,00145$
                           4160 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   606E DD 7E FC      [19] 4161 	ld	a,-4 (ix)
   6071 D6 32         [ 7] 4162 	sub	a, #0x32
   6073 38 07         [12] 4163 	jr	C,00102$
   6075 21 38 70      [10] 4164 	ld	hl,#(_player + 0x0008)
   6078 36 00         [10] 4165 	ld	(hl),#0x00
   607A 18 08         [12] 4166 	jr	00103$
   607C                    4167 00102$:
                           4168 ;src/keyboard.h:17: else player.atk += 1;
   607C DD 7E FC      [19] 4169 	ld	a,-4 (ix)
   607F 3C            [ 4] 4170 	inc	a
   6080 21 38 70      [10] 4171 	ld	hl,#(_player + 0x0008)
   6083 77            [ 7] 4172 	ld	(hl),a
   6084                    4173 00103$:
                           4174 ;src/keyboard.h:18: switch(player.dir){
   6084 21 37 70      [10] 4175 	ld	hl, #_player + 7
   6087 66            [ 7] 4176 	ld	h,(hl)
   6088 7C            [ 4] 4177 	ld	a,h
   6089 D6 02         [ 7] 4178 	sub	a, #0x02
   608B 28 33         [12] 4179 	jr	Z,00107$
   608D 7C            [ 4] 4180 	ld	a,h
   608E D6 04         [ 7] 4181 	sub	a, #0x04
   6090 28 0D         [12] 4182 	jr	Z,00104$
   6092 7C            [ 4] 4183 	ld	a,h
   6093 D6 06         [ 7] 4184 	sub	a, #0x06
   6095 28 13         [12] 4185 	jr	Z,00105$
   6097 7C            [ 4] 4186 	ld	a,h
   6098 D6 08         [ 7] 4187 	sub	a, #0x08
   609A 28 19         [12] 4188 	jr	Z,00106$
   609C C3 A5 62      [10] 4189 	jp	00146$
                           4190 ;src/keyboard.h:19: case 4:
   609F                    4191 00104$:
                           4192 ;src/keyboard.h:20: s = gladis_atk_izda;
   609F DD 36 FD 80   [19] 4193 	ld	-3 (ix),#<(_gladis_atk_izda)
   60A3 DD 36 FE 41   [19] 4194 	ld	-2 (ix),#>(_gladis_atk_izda)
                           4195 ;src/keyboard.h:21: break;
   60A7 C3 A5 62      [10] 4196 	jp	00146$
                           4197 ;src/keyboard.h:22: case 6:
   60AA                    4198 00105$:
                           4199 ;src/keyboard.h:23: s = gladis_atk_dcha;
   60AA DD 36 FD 00   [19] 4200 	ld	-3 (ix),#<(_gladis_atk_dcha)
   60AE DD 36 FE 41   [19] 4201 	ld	-2 (ix),#>(_gladis_atk_dcha)
                           4202 ;src/keyboard.h:24: break;
   60B2 C3 A5 62      [10] 4203 	jp	00146$
                           4204 ;src/keyboard.h:25: case 8:
   60B5                    4205 00106$:
                           4206 ;src/keyboard.h:26: s = gladis_atk_arriba;
   60B5 DD 36 FD 80   [19] 4207 	ld	-3 (ix),#<(_gladis_atk_arriba)
   60B9 DD 36 FE 43   [19] 4208 	ld	-2 (ix),#>(_gladis_atk_arriba)
                           4209 ;src/keyboard.h:27: break;
   60BD C3 A5 62      [10] 4210 	jp	00146$
                           4211 ;src/keyboard.h:28: case 2:
   60C0                    4212 00107$:
                           4213 ;src/keyboard.h:29: s = gladis_atk_abajo;
   60C0 DD 36 FD 00   [19] 4214 	ld	-3 (ix),#<(_gladis_atk_abajo)
   60C4 DD 36 FE 43   [19] 4215 	ld	-2 (ix),#>(_gladis_atk_abajo)
                           4216 ;src/keyboard.h:31: }
   60C8 C3 A5 62      [10] 4217 	jp	00146$
   60CB                    4218 00145$:
                           4219 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   60CB 21 38 70      [10] 4220 	ld	hl, #(_player + 0x0008) + 0
   60CE 56            [ 7] 4221 	ld	d,(hl)
   60CF 7A            [ 4] 4222 	ld	a,d
   60D0 D6 14         [ 7] 4223 	sub	a, #0x14
   60D2 30 07         [12] 4224 	jr	NC,00110$
   60D4 14            [ 4] 4225 	inc	d
   60D5 21 38 70      [10] 4226 	ld	hl,#(_player + 0x0008)
   60D8 72            [ 7] 4227 	ld	(hl),d
   60D9 18 05         [12] 4228 	jr	00111$
   60DB                    4229 00110$:
                           4230 ;src/keyboard.h:34: else player.atk = 20;
   60DB 21 38 70      [10] 4231 	ld	hl,#(_player + 0x0008)
   60DE 36 14         [10] 4232 	ld	(hl),#0x14
   60E0                    4233 00111$:
                           4234 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   60E0 21 00 02      [10] 4235 	ld	hl,#0x0200
   60E3 CD 59 6A      [17] 4236 	call	_cpct_isKeyPressed
                           4237 ;src/keyboard.h:37: player.dir = 6;
                           4238 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   60E6 7D            [ 4] 4239 	ld	a,l
   60E7 B7            [ 4] 4240 	or	a, a
   60E8 28 1E         [12] 4241 	jr	Z,00141$
   60EA 21 30 70      [10] 4242 	ld	hl, #_player + 0
   60ED 56            [ 7] 4243 	ld	d,(hl)
   60EE 7A            [ 4] 4244 	ld	a,d
   60EF D6 4C         [ 7] 4245 	sub	a, #0x4C
   60F1 30 15         [12] 4246 	jr	NC,00141$
                           4247 ;src/keyboard.h:36: player.x += 1;
   60F3 14            [ 4] 4248 	inc	d
   60F4 21 30 70      [10] 4249 	ld	hl,#_player
   60F7 72            [ 7] 4250 	ld	(hl),d
                           4251 ;src/keyboard.h:37: player.dir = 6;
   60F8 21 37 70      [10] 4252 	ld	hl,#(_player + 0x0007)
   60FB 36 06         [10] 4253 	ld	(hl),#0x06
                           4254 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   60FD DD 36 FD 00   [19] 4255 	ld	-3 (ix),#<(_gladis_quieto_dcha)
   6101 DD 36 FE 40   [19] 4256 	ld	-2 (ix),#>(_gladis_quieto_dcha)
   6105 C3 A5 62      [10] 4257 	jp	00146$
   6108                    4258 00141$:
                           4259 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   6108 21 01 01      [10] 4260 	ld	hl,#0x0101
   610B CD 59 6A      [17] 4261 	call	_cpct_isKeyPressed
   610E 7D            [ 4] 4262 	ld	a,l
   610F B7            [ 4] 4263 	or	a, a
   6110 28 1B         [12] 4264 	jr	Z,00137$
   6112 3A 30 70      [13] 4265 	ld	a, (#_player + 0)
   6115 B7            [ 4] 4266 	or	a, a
   6116 28 15         [12] 4267 	jr	Z,00137$
                           4268 ;src/keyboard.h:40: player.x -= 1;
   6118 C6 FF         [ 7] 4269 	add	a,#0xFF
   611A 32 30 70      [13] 4270 	ld	(#_player),a
                           4271 ;src/keyboard.h:41: player.dir = 4;
   611D 21 37 70      [10] 4272 	ld	hl,#(_player + 0x0007)
   6120 36 04         [10] 4273 	ld	(hl),#0x04
                           4274 ;src/keyboard.h:42: s = gladis_quieto_izda;
   6122 DD 36 FD 80   [19] 4275 	ld	-3 (ix),#<(_gladis_quieto_izda)
   6126 DD 36 FE 40   [19] 4276 	ld	-2 (ix),#>(_gladis_quieto_izda)
   612A C3 A5 62      [10] 4277 	jp	00146$
   612D                    4278 00137$:
                           4279 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   612D 21 00 04      [10] 4280 	ld	hl,#0x0400
   6130 CD 59 6A      [17] 4281 	call	_cpct_isKeyPressed
   6133 7D            [ 4] 4282 	ld	a,l
   6134 B7            [ 4] 4283 	or	a, a
   6135 28 1F         [12] 4284 	jr	Z,00133$
   6137 21 31 70      [10] 4285 	ld	hl, #(_player + 0x0001) + 0
   613A 56            [ 7] 4286 	ld	d,(hl)
   613B 7A            [ 4] 4287 	ld	a,d
   613C D6 B4         [ 7] 4288 	sub	a, #0xB4
   613E 30 16         [12] 4289 	jr	NC,00133$
                           4290 ;src/keyboard.h:44: player.y += 2;
   6140 14            [ 4] 4291 	inc	d
   6141 14            [ 4] 4292 	inc	d
   6142 21 31 70      [10] 4293 	ld	hl,#(_player + 0x0001)
   6145 72            [ 7] 4294 	ld	(hl),d
                           4295 ;src/keyboard.h:45: player.dir = 2;
   6146 21 37 70      [10] 4296 	ld	hl,#(_player + 0x0007)
   6149 36 02         [10] 4297 	ld	(hl),#0x02
                           4298 ;src/keyboard.h:46: s = gladis_abajo;
   614B DD 36 FD 80   [19] 4299 	ld	-3 (ix),#<(_gladis_abajo)
   614F DD 36 FE 42   [19] 4300 	ld	-2 (ix),#>(_gladis_abajo)
   6153 C3 A5 62      [10] 4301 	jp	00146$
   6156                    4302 00133$:
                           4303 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   6156 21 00 01      [10] 4304 	ld	hl,#0x0100
   6159 CD 59 6A      [17] 4305 	call	_cpct_isKeyPressed
   615C 7D            [ 4] 4306 	ld	a,l
   615D B7            [ 4] 4307 	or	a, a
   615E 28 1B         [12] 4308 	jr	Z,00129$
   6160 3A 31 70      [13] 4309 	ld	a, (#(_player + 0x0001) + 0)
   6163 B7            [ 4] 4310 	or	a, a
   6164 28 15         [12] 4311 	jr	Z,00129$
                           4312 ;src/keyboard.h:48: player.y -= 2;
   6166 C6 FE         [ 7] 4313 	add	a,#0xFE
   6168 32 31 70      [13] 4314 	ld	(#(_player + 0x0001)),a
                           4315 ;src/keyboard.h:49: player.dir = 8;
   616B 21 37 70      [10] 4316 	ld	hl,#(_player + 0x0007)
   616E 36 08         [10] 4317 	ld	(hl),#0x08
                           4318 ;src/keyboard.h:50: s = gladis_arriba;
   6170 DD 36 FD 00   [19] 4319 	ld	-3 (ix),#<(_gladis_arriba)
   6174 DD 36 FE 42   [19] 4320 	ld	-2 (ix),#>(_gladis_arriba)
   6178 C3 A5 62      [10] 4321 	jp	00146$
   617B                    4322 00129$:
                           4323 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   617B 21 07 80      [10] 4324 	ld	hl,#0x8007
   617E CD 59 6A      [17] 4325 	call	_cpct_isKeyPressed
   6181 5D            [ 4] 4326 	ld	e,l
                           4327 ;src/keyboard.h:53: switch(player.dir){
   6182 21 37 70      [10] 4328 	ld	hl, #(_player + 0x0007) + 0
   6185 6E            [ 7] 4329 	ld	l,(hl)
   6186 7D            [ 4] 4330 	ld	a,l
   6187 D6 02         [ 7] 4331 	sub	a, #0x02
   6189 20 04         [12] 4332 	jr	NZ,00278$
   618B 3E 01         [ 7] 4333 	ld	a,#0x01
   618D 18 01         [12] 4334 	jr	00279$
   618F                    4335 00278$:
   618F AF            [ 4] 4336 	xor	a,a
   6190                    4337 00279$:
   6190 4F            [ 4] 4338 	ld	c,a
   6191 7D            [ 4] 4339 	ld	a,l
   6192 D6 04         [ 7] 4340 	sub	a, #0x04
   6194 20 04         [12] 4341 	jr	NZ,00280$
   6196 3E 01         [ 7] 4342 	ld	a,#0x01
   6198 18 01         [12] 4343 	jr	00281$
   619A                    4344 00280$:
   619A AF            [ 4] 4345 	xor	a,a
   619B                    4346 00281$:
   619B DD 77 FC      [19] 4347 	ld	-4 (ix),a
   619E 7D            [ 4] 4348 	ld	a,l
   619F D6 06         [ 7] 4349 	sub	a, #0x06
   61A1 20 04         [12] 4350 	jr	NZ,00282$
   61A3 3E 01         [ 7] 4351 	ld	a,#0x01
   61A5 18 01         [12] 4352 	jr	00283$
   61A7                    4353 00282$:
   61A7 AF            [ 4] 4354 	xor	a,a
   61A8                    4355 00283$:
   61A8 DD 77 FF      [19] 4356 	ld	-1 (ix),a
   61AB 7D            [ 4] 4357 	ld	a,l
   61AC D6 08         [ 7] 4358 	sub	a, #0x08
   61AE 20 04         [12] 4359 	jr	NZ,00284$
   61B0 3E 01         [ 7] 4360 	ld	a,#0x01
   61B2 18 01         [12] 4361 	jr	00285$
   61B4                    4362 00284$:
   61B4 AF            [ 4] 4363 	xor	a,a
   61B5                    4364 00285$:
   61B5 DD 77 FB      [19] 4365 	ld	-5 (ix),a
                           4366 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   61B8 7B            [ 4] 4367 	ld	a,e
   61B9 B7            [ 4] 4368 	or	a, a
   61BA CA 67 62      [10] 4369 	jp	Z,00123$
   61BD 3A 1E 70      [13] 4370 	ld	a,(#_arrow + 0)
   61C0 B7            [ 4] 4371 	or	a, a
   61C1 C2 67 62      [10] 4372 	jp	NZ,00123$
   61C4 3A 38 70      [13] 4373 	ld	a, (#(_player + 0x0008) + 0)
   61C7 D6 14         [ 7] 4374 	sub	a, #0x14
   61C9 C2 67 62      [10] 4375 	jp	NZ,00123$
   61CC 3A 3A 70      [13] 4376 	ld	a, (#(_player + 0x000a) + 0)
   61CF B7            [ 4] 4377 	or	a, a
   61D0 CA 67 62      [10] 4378 	jp	Z,00123$
                           4379 ;src/keyboard.h:52: u8 *spr = flecha_dcha,xs=2,ys=8;
   61D3 11 F5 69      [10] 4380 	ld	de,#_flecha_dcha
   61D6 DD 36 FA 02   [19] 4381 	ld	-6 (ix),#0x02
   61DA 06 08         [ 7] 4382 	ld	b,#0x08
                           4383 ;src/keyboard.h:53: switch(player.dir){
   61DC 79            [ 4] 4384 	ld	a,c
   61DD B7            [ 4] 4385 	or	a, a
   61DE 20 2A         [12] 4386 	jr	NZ,00114$
   61E0 DD 7E FC      [19] 4387 	ld	a,-4 (ix)
   61E3 B7            [ 4] 4388 	or	a, a
   61E4 20 19         [12] 4389 	jr	NZ,00113$
   61E6 DD 7E FF      [19] 4390 	ld	a,-1 (ix)
   61E9 B7            [ 4] 4391 	or	a, a
   61EA 20 08         [12] 4392 	jr	NZ,00112$
   61EC DD 7E FB      [19] 4393 	ld	a,-5 (ix)
   61EF B7            [ 4] 4394 	or	a, a
   61F0 20 23         [12] 4395 	jr	NZ,00115$
   61F2 18 2A         [12] 4396 	jr	00116$
                           4397 ;src/keyboard.h:54: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   61F4                    4398 00112$:
   61F4 11 F5 69      [10] 4399 	ld	de,#_flecha_dcha
   61F7 DD 36 FA 04   [19] 4400 	ld	-6 (ix),#0x04
   61FB 06 04         [ 7] 4401 	ld	b,#0x04
   61FD 18 1F         [12] 4402 	jr	00116$
                           4403 ;src/keyboard.h:55: case 4: spr = flecha_izda; xs=4;ys=4; break;
   61FF                    4404 00113$:
   61FF 11 15 6A      [10] 4405 	ld	de,#_flecha_izda+0
   6202 DD 36 FA 04   [19] 4406 	ld	-6 (ix),#0x04
   6206 06 04         [ 7] 4407 	ld	b,#0x04
   6208 18 14         [12] 4408 	jr	00116$
                           4409 ;src/keyboard.h:56: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   620A                    4410 00114$:
   620A 11 D5 69      [10] 4411 	ld	de,#_flecha_abajo+0
   620D DD 36 FA 02   [19] 4412 	ld	-6 (ix),#0x02
   6211 06 08         [ 7] 4413 	ld	b,#0x08
   6213 18 09         [12] 4414 	jr	00116$
                           4415 ;src/keyboard.h:57: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   6215                    4416 00115$:
   6215 11 B5 69      [10] 4417 	ld	de,#_flecha_arriba+0
   6218 DD 36 FA 02   [19] 4418 	ld	-6 (ix),#0x02
   621C 06 08         [ 7] 4419 	ld	b,#0x08
                           4420 ;src/keyboard.h:58: }
   621E                    4421 00116$:
                           4422 ;src/keyboard.h:59: player.atk = 0;
   621E 21 38 70      [10] 4423 	ld	hl,#(_player + 0x0008)
   6221 36 00         [10] 4424 	ld	(hl),#0x00
                           4425 ;src/keyboard.h:60: object.x = player.x;
   6223 3A 30 70      [13] 4426 	ld	a, (#_player + 0)
   6226 21 26 70      [10] 4427 	ld	hl,#_object
   6229 77            [ 7] 4428 	ld	(hl),a
                           4429 ;src/keyboard.h:61: object.y = player.y+8;
   622A 3A 31 70      [13] 4430 	ld	a, (#(_player + 0x0001) + 0)
   622D C6 08         [ 7] 4431 	add	a, #0x08
   622F 32 27 70      [13] 4432 	ld	(#(_object + 0x0001)),a
                           4433 ;src/keyboard.h:62: object.x = object.x;
   6232 21 26 70      [10] 4434 	ld	hl, #_object + 0
   6235 4E            [ 7] 4435 	ld	c,(hl)
   6236 21 26 70      [10] 4436 	ld	hl,#_object
   6239 71            [ 7] 4437 	ld	(hl),c
                           4438 ;src/keyboard.h:63: object.y = object.y;
   623A 32 27 70      [13] 4439 	ld	(#(_object + 0x0001)),a
                           4440 ;src/keyboard.h:64: object.sprite = spr;
   623D ED 53 2A 70   [20] 4441 	ld	((_object + 0x0004)), de
                           4442 ;src/keyboard.h:65: object.vivo = 1;
   6241 21 2C 70      [10] 4443 	ld	hl,#_object + 6
   6244 36 01         [10] 4444 	ld	(hl),#0x01
                           4445 ;src/keyboard.h:66: object.dir = player.dir;
   6246 11 2D 70      [10] 4446 	ld	de,#_object + 7
   6249 3A 37 70      [13] 4447 	ld	a, (#(_player + 0x0007) + 0)
   624C 12            [ 7] 4448 	ld	(de),a
                           4449 ;src/keyboard.h:67: object.sizeX = xs;
   624D 21 2E 70      [10] 4450 	ld	hl,#_object + 8
   6250 DD 7E FA      [19] 4451 	ld	a,-6 (ix)
   6253 77            [ 7] 4452 	ld	(hl),a
                           4453 ;src/keyboard.h:68: object.sizeY = ys;
   6254 21 2F 70      [10] 4454 	ld	hl,#_object + 9
   6257 70            [ 7] 4455 	ld	(hl),b
                           4456 ;src/keyboard.h:69: player.bullets--;
   6258 3A 3A 70      [13] 4457 	ld	a, (#(_player + 0x000a) + 0)
   625B C6 FF         [ 7] 4458 	add	a,#0xFF
   625D 32 3A 70      [13] 4459 	ld	(#(_player + 0x000a)),a
                           4460 ;src/keyboard.h:70: arrow=1;
   6260 21 1E 70      [10] 4461 	ld	hl,#_arrow + 0
   6263 36 01         [10] 4462 	ld	(hl), #0x01
   6265 18 3E         [12] 4463 	jr	00146$
   6267                    4464 00123$:
                           4465 ;src/keyboard.h:72: switch(player.dir){
   6267 79            [ 4] 4466 	ld	a,c
   6268 B7            [ 4] 4467 	or	a, a
   6269 20 32         [12] 4468 	jr	NZ,00120$
   626B DD 7E FC      [19] 4469 	ld	a,-4 (ix)
   626E B7            [ 4] 4470 	or	a, a
   626F 20 0E         [12] 4471 	jr	NZ,00117$
   6271 DD 7E FF      [19] 4472 	ld	a,-1 (ix)
   6274 B7            [ 4] 4473 	or	a, a
   6275 20 12         [12] 4474 	jr	NZ,00118$
   6277 DD 7E FB      [19] 4475 	ld	a,-5 (ix)
   627A B7            [ 4] 4476 	or	a, a
   627B 20 16         [12] 4477 	jr	NZ,00119$
   627D 18 26         [12] 4478 	jr	00146$
                           4479 ;src/keyboard.h:73: case 4:
   627F                    4480 00117$:
                           4481 ;src/keyboard.h:74: s = gladis_quieto_izda;
   627F DD 36 FD 80   [19] 4482 	ld	-3 (ix),#<(_gladis_quieto_izda)
   6283 DD 36 FE 40   [19] 4483 	ld	-2 (ix),#>(_gladis_quieto_izda)
                           4484 ;src/keyboard.h:75: break;
   6287 18 1C         [12] 4485 	jr	00146$
                           4486 ;src/keyboard.h:76: case 6:
   6289                    4487 00118$:
                           4488 ;src/keyboard.h:77: s = gladis_quieto_dcha;
   6289 DD 36 FD 00   [19] 4489 	ld	-3 (ix),#<(_gladis_quieto_dcha)
   628D DD 36 FE 40   [19] 4490 	ld	-2 (ix),#>(_gladis_quieto_dcha)
                           4491 ;src/keyboard.h:78: break;
   6291 18 12         [12] 4492 	jr	00146$
                           4493 ;src/keyboard.h:79: case 8:
   6293                    4494 00119$:
                           4495 ;src/keyboard.h:80: s = gladis_arriba;
   6293 DD 36 FD 00   [19] 4496 	ld	-3 (ix),#<(_gladis_arriba)
   6297 DD 36 FE 42   [19] 4497 	ld	-2 (ix),#>(_gladis_arriba)
                           4498 ;src/keyboard.h:81: break;
   629B 18 08         [12] 4499 	jr	00146$
                           4500 ;src/keyboard.h:82: case 2:
   629D                    4501 00120$:
                           4502 ;src/keyboard.h:83: s = gladis_abajo;
   629D DD 36 FD 80   [19] 4503 	ld	-3 (ix),#<(_gladis_abajo)
   62A1 DD 36 FE 42   [19] 4504 	ld	-2 (ix),#>(_gladis_abajo)
                           4505 ;src/keyboard.h:85: }
   62A5                    4506 00146$:
                           4507 ;src/keyboard.h:91: if(cpct_isKeyPressed(Key_L)){
   62A5 21 04 10      [10] 4508 	ld	hl,#0x1004
   62A8 CD 59 6A      [17] 4509 	call	_cpct_isKeyPressed
   62AB 7D            [ 4] 4510 	ld	a,l
   62AC B7            [ 4] 4511 	or	a, a
   62AD 28 05         [12] 4512 	jr	Z,00149$
                           4513 ;src/keyboard.h:92: arrow = 0;
   62AF 21 1E 70      [10] 4514 	ld	hl,#_arrow + 0
   62B2 36 00         [10] 4515 	ld	(hl), #0x00
   62B4                    4516 00149$:
                           4517 ;src/keyboard.h:94: if(cpct_isKeyPressed(Key_Esc)){
   62B4 21 08 04      [10] 4518 	ld	hl,#0x0408
   62B7 CD 59 6A      [17] 4519 	call	_cpct_isKeyPressed
   62BA 7D            [ 4] 4520 	ld	a,l
   62BB B7            [ 4] 4521 	or	a, a
   62BC 28 05         [12] 4522 	jr	Z,00151$
                           4523 ;src/keyboard.h:95: finish = 1;
   62BE 21 1D 70      [10] 4524 	ld	hl,#_finish + 0
   62C1 36 01         [10] 4525 	ld	(hl), #0x01
   62C3                    4526 00151$:
                           4527 ;src/keyboard.h:97: return s;
   62C3 DD 6E FD      [19] 4528 	ld	l,-3 (ix)
   62C6 DD 66 FE      [19] 4529 	ld	h,-2 (ix)
   62C9 DD F9         [10] 4530 	ld	sp, ix
   62CB DD E1         [14] 4531 	pop	ix
   62CD C9            [10] 4532 	ret
                           4533 ;src/keyboard.h:100: void moveObject(){
                           4534 ;	---------------------------------
                           4535 ; Function moveObject
                           4536 ; ---------------------------------
   62CE                    4537 _moveObject::
                           4538 ;src/keyboard.h:101: object.lx = object.x;
   62CE 01 26 70      [10] 4539 	ld	bc,#_object+0
   62D1 0A            [ 7] 4540 	ld	a,(bc)
   62D2 32 28 70      [13] 4541 	ld	(#(_object + 0x0002)),a
                           4542 ;src/keyboard.h:102: object.ly = object.y;
   62D5 59            [ 4] 4543 	ld	e, c
   62D6 50            [ 4] 4544 	ld	d, b
   62D7 13            [ 6] 4545 	inc	de
   62D8 1A            [ 7] 4546 	ld	a,(de)
   62D9 32 29 70      [13] 4547 	ld	(#(_object + 0x0003)),a
                           4548 ;src/keyboard.h:103: switch(object.dir){
   62DC 3A 2D 70      [13] 4549 	ld	a,(#_object + 7)
   62DF FE 02         [ 7] 4550 	cp	a,#0x02
   62E1 28 16         [12] 4551 	jr	Z,00103$
   62E3 FE 04         [ 7] 4552 	cp	a,#0x04
   62E5 28 0D         [12] 4553 	jr	Z,00102$
   62E7 FE 06         [ 7] 4554 	cp	a,#0x06
   62E9 28 05         [12] 4555 	jr	Z,00101$
   62EB D6 08         [ 7] 4556 	sub	a, #0x08
   62ED 28 0F         [12] 4557 	jr	Z,00104$
   62EF C9            [10] 4558 	ret
                           4559 ;src/keyboard.h:104: case 6: object.x += 1; break;
   62F0                    4560 00101$:
   62F0 0A            [ 7] 4561 	ld	a,(bc)
   62F1 3C            [ 4] 4562 	inc	a
   62F2 02            [ 7] 4563 	ld	(bc),a
   62F3 C9            [10] 4564 	ret
                           4565 ;src/keyboard.h:105: case 4: object.x -= 1; break;
   62F4                    4566 00102$:
   62F4 0A            [ 7] 4567 	ld	a,(bc)
   62F5 C6 FF         [ 7] 4568 	add	a,#0xFF
   62F7 02            [ 7] 4569 	ld	(bc),a
   62F8 C9            [10] 4570 	ret
                           4571 ;src/keyboard.h:106: case 2: object.y += 2; break;
   62F9                    4572 00103$:
   62F9 1A            [ 7] 4573 	ld	a,(de)
   62FA C6 02         [ 7] 4574 	add	a, #0x02
   62FC 12            [ 7] 4575 	ld	(de),a
   62FD C9            [10] 4576 	ret
                           4577 ;src/keyboard.h:107: case 8: object.y -= 2; break;
   62FE                    4578 00104$:
   62FE 1A            [ 7] 4579 	ld	a,(de)
   62FF C6 FE         [ 7] 4580 	add	a,#0xFE
   6301 12            [ 7] 4581 	ld	(de),a
                           4582 ;src/keyboard.h:108: }
   6302 C9            [10] 4583 	ret
                           4584 ;src/main.c:37: void init(){
                           4585 ;	---------------------------------
                           4586 ; Function init
                           4587 ; ---------------------------------
   6303                    4588 _init::
                           4589 ;src/main.c:38: cpct_disableFirmware();
   6303 CD 52 6D      [17] 4590 	call	_cpct_disableFirmware
                           4591 ;src/main.c:39: cpct_setVideoMode(0);
   6306 AF            [ 4] 4592 	xor	a, a
   6307 F5            [11] 4593 	push	af
   6308 33            [ 6] 4594 	inc	sp
   6309 CD 2F 6D      [17] 4595 	call	_cpct_setVideoMode
   630C 33            [ 6] 4596 	inc	sp
                           4597 ;src/main.c:40: cpct_fw2hw(g_palette,4);
   630D 11 0E 49      [10] 4598 	ld	de,#_g_palette
   6310 3E 04         [ 7] 4599 	ld	a,#0x04
   6312 F5            [11] 4600 	push	af
   6313 33            [ 6] 4601 	inc	sp
   6314 D5            [11] 4602 	push	de
   6315 CD AC 6C      [17] 4603 	call	_cpct_fw2hw
   6318 F1            [10] 4604 	pop	af
   6319 33            [ 6] 4605 	inc	sp
                           4606 ;src/main.c:41: cpct_setPalette(g_palette,4);
   631A 11 0E 49      [10] 4607 	ld	de,#_g_palette
   631D 3E 04         [ 7] 4608 	ld	a,#0x04
   631F F5            [11] 4609 	push	af
   6320 33            [ 6] 4610 	inc	sp
   6321 D5            [11] 4611 	push	de
   6322 CD 35 6A      [17] 4612 	call	_cpct_setPalette
   6325 F1            [10] 4613 	pop	af
   6326 33            [ 6] 4614 	inc	sp
   6327 C9            [10] 4615 	ret
                           4616 ;src/main.c:44: void initPlayer(u8 p){
                           4617 ;	---------------------------------
                           4618 ; Function initPlayer
                           4619 ; ---------------------------------
   6328                    4620 _initPlayer::
   6328 DD E5         [15] 4621 	push	ix
   632A DD 21 00 00   [14] 4622 	ld	ix,#0
   632E DD 39         [15] 4623 	add	ix,sp
                           4624 ;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
                           4625 ;src/main.c:46: player.x = origins[p-1][0];
   6330 11 13 49      [10] 4626 	ld	de,#_origins+0
   6333 DD 6E 04      [19] 4627 	ld	l,4 (ix)
   6336 2D            [ 4] 4628 	dec	l
   6337 26 00         [ 7] 4629 	ld	h,#0x00
   6339 29            [11] 4630 	add	hl, hl
   633A 29            [11] 4631 	add	hl, hl
   633B 19            [11] 4632 	add	hl,de
   633C 4D            [ 4] 4633 	ld	c,l
   633D 44            [ 4] 4634 	ld	b,h
   633E 0A            [ 7] 4635 	ld	a,(bc)
   633F 32 30 70      [13] 4636 	ld	(#_player),a
                           4637 ;src/main.c:47: player.y = origins[p-1][1];
   6342 59            [ 4] 4638 	ld	e, c
   6343 50            [ 4] 4639 	ld	d, b
   6344 13            [ 6] 4640 	inc	de
   6345 1A            [ 7] 4641 	ld	a,(de)
   6346 32 31 70      [13] 4642 	ld	(#(_player + 0x0001)),a
                           4643 ;src/main.c:48: player.lx = origins[p-1][0];
   6349 0A            [ 7] 4644 	ld	a,(bc)
   634A 32 32 70      [13] 4645 	ld	(#(_player + 0x0002)),a
                           4646 ;src/main.c:49: player.ly = origins[p-1][1];
   634D 1A            [ 7] 4647 	ld	a,(de)
   634E 32 33 70      [13] 4648 	ld	(#(_player + 0x0003)),a
                           4649 ;src/main.c:50: player.sprite = sprite;
   6351 21 00 40      [10] 4650 	ld	hl,#_gladis_quieto_dcha
   6354 22 34 70      [16] 4651 	ld	((_player + 0x0004)), hl
                           4652 ;src/main.c:51: player.life = 3;
   6357 21 36 70      [10] 4653 	ld	hl,#_player + 6
   635A 36 03         [10] 4654 	ld	(hl),#0x03
                           4655 ;src/main.c:52: player.dir = 6;
   635C 21 37 70      [10] 4656 	ld	hl,#_player + 7
   635F 36 06         [10] 4657 	ld	(hl),#0x06
                           4658 ;src/main.c:53: player.atk = 20;
   6361 21 38 70      [10] 4659 	ld	hl,#_player + 8
   6364 36 14         [10] 4660 	ld	(hl),#0x14
                           4661 ;src/main.c:54: player.latk = 20;
   6366 21 39 70      [10] 4662 	ld	hl,#_player + 9
   6369 36 14         [10] 4663 	ld	(hl),#0x14
                           4664 ;src/main.c:55: player.bullets = 3;
   636B 21 3A 70      [10] 4665 	ld	hl,#_player + 10
   636E 36 03         [10] 4666 	ld	(hl),#0x03
   6370 DD E1         [14] 4667 	pop	ix
   6372 C9            [10] 4668 	ret
                           4669 ;src/main.c:58: void initEnemies(u8 p){
                           4670 ;	---------------------------------
                           4671 ; Function initEnemies
                           4672 ; ---------------------------------
   6373                    4673 _initEnemies::
   6373 DD E5         [15] 4674 	push	ix
   6375 DD 21 00 00   [14] 4675 	ld	ix,#0
   6379 DD 39         [15] 4676 	add	ix,sp
                           4677 ;src/main.c:59: u8 *sprite = chacho_dcha;
                           4678 ;src/main.c:60: enemy.x = origins[p-1][2];
   637B 11 13 49      [10] 4679 	ld	de,#_origins+0
   637E DD 6E 04      [19] 4680 	ld	l,4 (ix)
   6381 2D            [ 4] 4681 	dec	l
   6382 26 00         [ 7] 4682 	ld	h,#0x00
   6384 29            [11] 4683 	add	hl, hl
   6385 29            [11] 4684 	add	hl, hl
   6386 19            [11] 4685 	add	hl,de
   6387 EB            [ 4] 4686 	ex	de,hl
   6388 4B            [ 4] 4687 	ld	c, e
   6389 42            [ 4] 4688 	ld	b, d
   638A 03            [ 6] 4689 	inc	bc
   638B 03            [ 6] 4690 	inc	bc
   638C 0A            [ 7] 4691 	ld	a,(bc)
   638D 32 3B 70      [13] 4692 	ld	(#_enemy),a
                           4693 ;src/main.c:61: enemy.y = origins[p-1][3];
   6390 13            [ 6] 4694 	inc	de
   6391 13            [ 6] 4695 	inc	de
   6392 13            [ 6] 4696 	inc	de
   6393 1A            [ 7] 4697 	ld	a,(de)
   6394 32 3C 70      [13] 4698 	ld	(#(_enemy + 0x0001)),a
                           4699 ;src/main.c:62: enemy.lx = origins[p-1][2];
   6397 0A            [ 7] 4700 	ld	a,(bc)
   6398 32 3D 70      [13] 4701 	ld	(#(_enemy + 0x0002)),a
                           4702 ;src/main.c:63: enemy.ly = origins[p-1][3];
   639B 1A            [ 7] 4703 	ld	a,(de)
   639C 32 3E 70      [13] 4704 	ld	(#(_enemy + 0x0003)),a
                           4705 ;src/main.c:64: enemy.ox = origins[p-1][2];
   639F 0A            [ 7] 4706 	ld	a,(bc)
   63A0 32 3F 70      [13] 4707 	ld	(#(_enemy + 0x0004)),a
                           4708 ;src/main.c:65: enemy.oy = origins[p-1][3];
   63A3 1A            [ 7] 4709 	ld	a,(de)
   63A4 32 40 70      [13] 4710 	ld	(#(_enemy + 0x0005)),a
                           4711 ;src/main.c:66: enemy.sprite = sprite;
   63A7 21 00 44      [10] 4712 	ld	hl,#_chacho_dcha
   63AA 22 41 70      [16] 4713 	ld	((_enemy + 0x0006)), hl
                           4714 ;src/main.c:67: enemy.life = 3;
   63AD 21 43 70      [10] 4715 	ld	hl,#_enemy + 8
   63B0 36 03         [10] 4716 	ld	(hl),#0x03
                           4717 ;src/main.c:68: enemy.dir = 6;
   63B2 21 44 70      [10] 4718 	ld	hl,#_enemy + 9
   63B5 36 06         [10] 4719 	ld	(hl),#0x06
                           4720 ;src/main.c:69: enemy.bullets = 3;
   63B7 21 45 70      [10] 4721 	ld	hl,#_enemy + 10
   63BA 36 03         [10] 4722 	ld	(hl),#0x03
                           4723 ;src/main.c:70: enemy.room = 3;
   63BC 21 46 70      [10] 4724 	ld	hl,#_enemy + 11
   63BF 36 03         [10] 4725 	ld	(hl),#0x03
   63C1 DD E1         [14] 4726 	pop	ix
   63C3 C9            [10] 4727 	ret
                           4728 ;src/main.c:74: void initNivel(){
                           4729 ;	---------------------------------
                           4730 ; Function initNivel
                           4731 ; ---------------------------------
   63C4                    4732 _initNivel::
                           4733 ;src/main.c:75: n.num=0;
   63C4 21 23 70      [10] 4734 	ld	hl,#_n+0
   63C7 36 00         [10] 4735 	ld	(hl),#0x00
                           4736 ;src/main.c:76: n.corazon=0;
   63C9 21 24 70      [10] 4737 	ld	hl,#_n + 1
   63CC 36 00         [10] 4738 	ld	(hl),#0x00
                           4739 ;src/main.c:77: n.bullet=0;
   63CE 21 25 70      [10] 4740 	ld	hl,#_n + 2
   63D1 36 00         [10] 4741 	ld	(hl),#0x00
   63D3 C9            [10] 4742 	ret
                           4743 ;src/main.c:80: void initVariables(){
                           4744 ;	---------------------------------
                           4745 ; Function initVariables
                           4746 ; ---------------------------------
   63D4                    4747 _initVariables::
                           4748 ;src/main.c:81: bound =0;
   63D4 21 20 70      [10] 4749 	ld	hl,#_bound + 0
   63D7 36 00         [10] 4750 	ld	(hl), #0x00
                           4751 ;src/main.c:82: temp = 0;
   63D9 21 1A 70      [10] 4752 	ld	hl,#_temp + 0
   63DC 36 00         [10] 4753 	ld	(hl), #0x00
                           4754 ;src/main.c:83: map = 1;
   63DE 21 1B 70      [10] 4755 	ld	hl,#_map + 0
   63E1 36 01         [10] 4756 	ld	(hl), #0x01
                           4757 ;src/main.c:84: arrow =0;
   63E3 21 1E 70      [10] 4758 	ld	hl,#_arrow + 0
   63E6 36 00         [10] 4759 	ld	(hl), #0x00
                           4760 ;src/main.c:85: finish =0;
   63E8 21 1D 70      [10] 4761 	ld	hl,#_finish + 0
   63EB 36 00         [10] 4762 	ld	(hl), #0x00
                           4763 ;src/main.c:86: following =0;
   63ED 21 1F 70      [10] 4764 	ld	hl,#_following + 0
   63F0 36 00         [10] 4765 	ld	(hl), #0x00
                           4766 ;src/main.c:87: archer = 0;
   63F2 21 21 70      [10] 4767 	ld	hl,#_archer + 0
   63F5 36 00         [10] 4768 	ld	(hl), #0x00
                           4769 ;src/main.c:88: dead =0;
   63F7 21 22 70      [10] 4770 	ld	hl,#_dead + 0
   63FA 36 00         [10] 4771 	ld	(hl), #0x00
   63FC C9            [10] 4772 	ret
                           4773 ;src/main.c:92: void gameOver(){
                           4774 ;	---------------------------------
                           4775 ; Function gameOver
                           4776 ; ---------------------------------
   63FD                    4777 _gameOver::
                           4778 ;src/main.c:94: cpct_clearScreen(0);
   63FD 21 00 40      [10] 4779 	ld	hl,#0x4000
   6400 E5            [11] 4780 	push	hl
   6401 AF            [ 4] 4781 	xor	a, a
   6402 F5            [11] 4782 	push	af
   6403 33            [ 6] 4783 	inc	sp
   6404 26 C0         [ 7] 4784 	ld	h, #0xC0
   6406 E5            [11] 4785 	push	hl
   6407 CD 41 6D      [17] 4786 	call	_cpct_memset
                           4787 ;src/main.c:95: memptr = cpct_getScreenPtr(VMEM,10,10);
   640A 21 0A 0A      [10] 4788 	ld	hl,#0x0A0A
   640D E5            [11] 4789 	push	hl
   640E 21 00 C0      [10] 4790 	ld	hl,#0xC000
   6411 E5            [11] 4791 	push	hl
   6412 CD 34 6E      [17] 4792 	call	_cpct_getScreenPtr
                           4793 ;src/main.c:96: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6415 EB            [ 4] 4794 	ex	de,hl
   6416 01 4F 64      [10] 4795 	ld	bc,#___str_0+0
   6419 21 01 00      [10] 4796 	ld	hl,#0x0001
   641C E5            [11] 4797 	push	hl
   641D D5            [11] 4798 	push	de
   641E C5            [11] 4799 	push	bc
   641F CD 46 6B      [17] 4800 	call	_cpct_drawStringM0
   6422 21 06 00      [10] 4801 	ld	hl,#6
   6425 39            [11] 4802 	add	hl,sp
   6426 F9            [ 6] 4803 	ld	sp,hl
                           4804 ;src/main.c:98: memptr = cpct_getScreenPtr(VMEM,2,180);
   6427 21 02 B4      [10] 4805 	ld	hl,#0xB402
   642A E5            [11] 4806 	push	hl
   642B 21 00 C0      [10] 4807 	ld	hl,#0xC000
   642E E5            [11] 4808 	push	hl
   642F CD 34 6E      [17] 4809 	call	_cpct_getScreenPtr
                           4810 ;src/main.c:99: cpct_drawStringM0("Pulsa cualquier tecla",memptr,1,0);
   6432 EB            [ 4] 4811 	ex	de,hl
   6433 01 60 64      [10] 4812 	ld	bc,#___str_1+0
   6436 21 01 00      [10] 4813 	ld	hl,#0x0001
   6439 E5            [11] 4814 	push	hl
   643A D5            [11] 4815 	push	de
   643B C5            [11] 4816 	push	bc
   643C CD 46 6B      [17] 4817 	call	_cpct_drawStringM0
   643F 21 06 00      [10] 4818 	ld	hl,#6
   6442 39            [11] 4819 	add	hl,sp
   6443 F9            [ 6] 4820 	ld	sp,hl
                           4821 ;src/main.c:101: while(1){
   6444                    4822 00104$:
                           4823 ;src/main.c:102: cpct_scanKeyboard_f();
   6444 CD 65 6A      [17] 4824 	call	_cpct_scanKeyboard_f
                           4825 ;src/main.c:103: if(cpct_isAnyKeyPressed()) return;
   6447 CD 1A 6D      [17] 4826 	call	_cpct_isAnyKeyPressed
   644A 7D            [ 4] 4827 	ld	a,l
   644B B7            [ 4] 4828 	or	a, a
   644C 28 F6         [12] 4829 	jr	Z,00104$
   644E C9            [10] 4830 	ret
   644F                    4831 ___str_0:
   644F 4C 6F 75 6E 67 65  4832 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   645F 00                 4833 	.db 0x00
   6460                    4834 ___str_1:
   6460 50 75 6C 73 61 20  4835 	.ascii "Pulsa cualquier tecla"
        63 75 61 6C 71 75
        69 65 72 20 74 65
        63 6C 61
   6475 00                 4836 	.db 0x00
                           4837 ;src/main.c:108: int menu(){
                           4838 ;	---------------------------------
                           4839 ; Function menu
                           4840 ; ---------------------------------
   6476                    4841 _menu::
   6476 DD E5         [15] 4842 	push	ix
   6478 DD 21 00 00   [14] 4843 	ld	ix,#0
   647C DD 39         [15] 4844 	add	ix,sp
   647E 21 FA FF      [10] 4845 	ld	hl,#-6
   6481 39            [11] 4846 	add	hl,sp
   6482 F9            [ 6] 4847 	ld	sp,hl
                           4848 ;src/main.c:110: int init = 50;
   6483 21 32 00      [10] 4849 	ld	hl,#0x0032
   6486 E3            [19] 4850 	ex	(sp), hl
                           4851 ;src/main.c:111: int pushed =0;
   6487 DD 36 FC 00   [19] 4852 	ld	-4 (ix),#0x00
   648B DD 36 FD 00   [19] 4853 	ld	-3 (ix),#0x00
                           4854 ;src/main.c:112: int cont =0;
   648F 11 00 00      [10] 4855 	ld	de,#0x0000
                           4856 ;src/main.c:113: cpct_clearScreen(0);
   6492 D5            [11] 4857 	push	de
   6493 21 00 40      [10] 4858 	ld	hl,#0x4000
   6496 E5            [11] 4859 	push	hl
   6497 AF            [ 4] 4860 	xor	a, a
   6498 F5            [11] 4861 	push	af
   6499 33            [ 6] 4862 	inc	sp
   649A 26 C0         [ 7] 4863 	ld	h, #0xC0
   649C E5            [11] 4864 	push	hl
   649D CD 41 6D      [17] 4865 	call	_cpct_memset
   64A0 21 0A 0A      [10] 4866 	ld	hl,#0x0A0A
   64A3 E5            [11] 4867 	push	hl
   64A4 21 00 C0      [10] 4868 	ld	hl,#0xC000
   64A7 E5            [11] 4869 	push	hl
   64A8 CD 34 6E      [17] 4870 	call	_cpct_getScreenPtr
   64AB D1            [10] 4871 	pop	de
                           4872 ;src/main.c:116: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   64AC 4D            [ 4] 4873 	ld	c, l
   64AD 44            [ 4] 4874 	ld	b, h
   64AE D5            [11] 4875 	push	de
   64AF 21 01 00      [10] 4876 	ld	hl,#0x0001
   64B2 E5            [11] 4877 	push	hl
   64B3 C5            [11] 4878 	push	bc
   64B4 21 56 66      [10] 4879 	ld	hl,#___str_2
   64B7 E5            [11] 4880 	push	hl
   64B8 CD 46 6B      [17] 4881 	call	_cpct_drawStringM0
   64BB 21 06 00      [10] 4882 	ld	hl,#6
   64BE 39            [11] 4883 	add	hl,sp
   64BF F9            [ 6] 4884 	ld	sp,hl
   64C0 21 14 32      [10] 4885 	ld	hl,#0x3214
   64C3 E5            [11] 4886 	push	hl
   64C4 21 00 C0      [10] 4887 	ld	hl,#0xC000
   64C7 E5            [11] 4888 	push	hl
   64C8 CD 34 6E      [17] 4889 	call	_cpct_getScreenPtr
   64CB D1            [10] 4890 	pop	de
                           4891 ;src/main.c:120: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   64CC 4D            [ 4] 4892 	ld	c, l
   64CD 44            [ 4] 4893 	ld	b, h
   64CE D5            [11] 4894 	push	de
   64CF 21 01 00      [10] 4895 	ld	hl,#0x0001
   64D2 E5            [11] 4896 	push	hl
   64D3 C5            [11] 4897 	push	bc
   64D4 21 67 66      [10] 4898 	ld	hl,#___str_3
   64D7 E5            [11] 4899 	push	hl
   64D8 CD 46 6B      [17] 4900 	call	_cpct_drawStringM0
   64DB 21 06 00      [10] 4901 	ld	hl,#6
   64DE 39            [11] 4902 	add	hl,sp
   64DF F9            [ 6] 4903 	ld	sp,hl
   64E0 21 14 46      [10] 4904 	ld	hl,#0x4614
   64E3 E5            [11] 4905 	push	hl
   64E4 21 00 C0      [10] 4906 	ld	hl,#0xC000
   64E7 E5            [11] 4907 	push	hl
   64E8 CD 34 6E      [17] 4908 	call	_cpct_getScreenPtr
   64EB D1            [10] 4909 	pop	de
                           4910 ;src/main.c:123: cpct_drawStringM0("Creditos",memptr,1,0);
   64EC 4D            [ 4] 4911 	ld	c, l
   64ED 44            [ 4] 4912 	ld	b, h
   64EE D5            [11] 4913 	push	de
   64EF 21 01 00      [10] 4914 	ld	hl,#0x0001
   64F2 E5            [11] 4915 	push	hl
   64F3 C5            [11] 4916 	push	bc
   64F4 21 75 66      [10] 4917 	ld	hl,#___str_4
   64F7 E5            [11] 4918 	push	hl
   64F8 CD 46 6B      [17] 4919 	call	_cpct_drawStringM0
   64FB 21 06 00      [10] 4920 	ld	hl,#6
   64FE 39            [11] 4921 	add	hl,sp
   64FF F9            [ 6] 4922 	ld	sp,hl
   6500 21 14 5A      [10] 4923 	ld	hl,#0x5A14
   6503 E5            [11] 4924 	push	hl
   6504 21 00 C0      [10] 4925 	ld	hl,#0xC000
   6507 E5            [11] 4926 	push	hl
   6508 CD 34 6E      [17] 4927 	call	_cpct_getScreenPtr
   650B D1            [10] 4928 	pop	de
                           4929 ;src/main.c:116: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   650C DD 75 FE      [19] 4930 	ld	-2 (ix),l
   650F DD 74 FF      [19] 4931 	ld	-1 (ix),h
                           4932 ;src/main.c:126: cpct_drawStringM0("Salir",memptr,1,0);
   6512 01 7E 66      [10] 4933 	ld	bc,#___str_5
   6515 D5            [11] 4934 	push	de
   6516 21 01 00      [10] 4935 	ld	hl,#0x0001
   6519 E5            [11] 4936 	push	hl
   651A DD 6E FE      [19] 4937 	ld	l,-2 (ix)
   651D DD 66 FF      [19] 4938 	ld	h,-1 (ix)
   6520 E5            [11] 4939 	push	hl
   6521 C5            [11] 4940 	push	bc
   6522 CD 46 6B      [17] 4941 	call	_cpct_drawStringM0
   6525 21 06 00      [10] 4942 	ld	hl,#6
   6528 39            [11] 4943 	add	hl,sp
   6529 F9            [ 6] 4944 	ld	sp,hl
   652A D1            [10] 4945 	pop	de
                           4946 ;src/main.c:132: while(1){
   652B                    4947 00118$:
                           4948 ;src/main.c:134: cpct_scanKeyboard();
   652B D5            [11] 4949 	push	de
   652C CD 54 6E      [17] 4950 	call	_cpct_scanKeyboard
   652F 21 00 04      [10] 4951 	ld	hl,#0x0400
   6532 CD 59 6A      [17] 4952 	call	_cpct_isKeyPressed
   6535 7D            [ 4] 4953 	ld	a,l
   6536 D1            [10] 4954 	pop	de
   6537 B7            [ 4] 4955 	or	a, a
   6538 28 2D         [12] 4956 	jr	Z,00102$
   653A 3E 96         [ 7] 4957 	ld	a,#0x96
   653C BB            [ 4] 4958 	cp	a, e
   653D 3E 00         [ 7] 4959 	ld	a,#0x00
   653F 9A            [ 4] 4960 	sbc	a, d
   6540 E2 45 65      [10] 4961 	jp	PO, 00162$
   6543 EE 80         [ 7] 4962 	xor	a, #0x80
   6545                    4963 00162$:
   6545 F2 67 65      [10] 4964 	jp	P,00102$
                           4965 ;src/main.c:136: cpct_drawSolidBox(memptr, 0, 2, 8);
   6548 21 02 08      [10] 4966 	ld	hl,#0x0802
   654B E5            [11] 4967 	push	hl
   654C AF            [ 4] 4968 	xor	a, a
   654D F5            [11] 4969 	push	af
   654E 33            [ 6] 4970 	inc	sp
   654F DD 6E FE      [19] 4971 	ld	l,-2 (ix)
   6552 DD 66 FF      [19] 4972 	ld	h,-1 (ix)
   6555 E5            [11] 4973 	push	hl
   6556 CD 63 6D      [17] 4974 	call	_cpct_drawSolidBox
   6559 F1            [10] 4975 	pop	af
   655A F1            [10] 4976 	pop	af
   655B 33            [ 6] 4977 	inc	sp
                           4978 ;src/main.c:137: pushed ++;
   655C DD 34 FC      [23] 4979 	inc	-4 (ix)
   655F 20 03         [12] 4980 	jr	NZ,00163$
   6561 DD 34 FD      [23] 4981 	inc	-3 (ix)
   6564                    4982 00163$:
                           4983 ;src/main.c:138: cont =0;
   6564 11 00 00      [10] 4984 	ld	de,#0x0000
   6567                    4985 00102$:
                           4986 ;src/main.c:140: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   6567 D5            [11] 4987 	push	de
   6568 21 00 01      [10] 4988 	ld	hl,#0x0100
   656B CD 59 6A      [17] 4989 	call	_cpct_isKeyPressed
   656E 7D            [ 4] 4990 	ld	a,l
   656F D1            [10] 4991 	pop	de
   6570 B7            [ 4] 4992 	or	a, a
   6571 28 32         [12] 4993 	jr	Z,00105$
   6573 3E 96         [ 7] 4994 	ld	a,#0x96
   6575 BB            [ 4] 4995 	cp	a, e
   6576 3E 00         [ 7] 4996 	ld	a,#0x00
   6578 9A            [ 4] 4997 	sbc	a, d
   6579 E2 7E 65      [10] 4998 	jp	PO, 00164$
   657C EE 80         [ 7] 4999 	xor	a, #0x80
   657E                    5000 00164$:
   657E F2 A5 65      [10] 5001 	jp	P,00105$
                           5002 ;src/main.c:141: cpct_drawSolidBox(memptr, 0, 2, 8);
   6581 21 02 08      [10] 5003 	ld	hl,#0x0802
   6584 E5            [11] 5004 	push	hl
   6585 AF            [ 4] 5005 	xor	a, a
   6586 F5            [11] 5006 	push	af
   6587 33            [ 6] 5007 	inc	sp
   6588 DD 6E FE      [19] 5008 	ld	l,-2 (ix)
   658B DD 66 FF      [19] 5009 	ld	h,-1 (ix)
   658E E5            [11] 5010 	push	hl
   658F CD 63 6D      [17] 5011 	call	_cpct_drawSolidBox
   6592 F1            [10] 5012 	pop	af
   6593 F1            [10] 5013 	pop	af
   6594 33            [ 6] 5014 	inc	sp
                           5015 ;src/main.c:142: pushed --;
   6595 DD 6E FC      [19] 5016 	ld	l,-4 (ix)
   6598 DD 66 FD      [19] 5017 	ld	h,-3 (ix)
   659B 2B            [ 6] 5018 	dec	hl
   659C DD 75 FC      [19] 5019 	ld	-4 (ix),l
   659F DD 74 FD      [19] 5020 	ld	-3 (ix),h
                           5021 ;src/main.c:143: cont = 0;
   65A2 11 00 00      [10] 5022 	ld	de,#0x0000
   65A5                    5023 00105$:
                           5024 ;src/main.c:146: switch (pushed){
   65A5 DD 7E FD      [19] 5025 	ld	a,-3 (ix)
   65A8 07            [ 4] 5026 	rlca
   65A9 E6 01         [ 7] 5027 	and	a,#0x01
   65AB 47            [ 4] 5028 	ld	b,a
   65AC 3E 02         [ 7] 5029 	ld	a,#0x02
   65AE DD BE FC      [19] 5030 	cp	a, -4 (ix)
   65B1 3E 00         [ 7] 5031 	ld	a,#0x00
   65B3 DD 9E FD      [19] 5032 	sbc	a, -3 (ix)
   65B6 E2 BB 65      [10] 5033 	jp	PO, 00165$
   65B9 EE 80         [ 7] 5034 	xor	a, #0x80
   65BB                    5035 00165$:
   65BB 07            [ 4] 5036 	rlca
   65BC E6 01         [ 7] 5037 	and	a,#0x01
   65BE 4F            [ 4] 5038 	ld	c,a
   65BF 78            [ 4] 5039 	ld	a,b
   65C0 B7            [ 4] 5040 	or	a,a
   65C1 20 26         [12] 5041 	jr	NZ,00110$
   65C3 B1            [ 4] 5042 	or	a,c
   65C4 20 23         [12] 5043 	jr	NZ,00110$
   65C6 D5            [11] 5044 	push	de
   65C7 DD 5E FC      [19] 5045 	ld	e,-4 (ix)
   65CA 16 00         [ 7] 5046 	ld	d,#0x00
   65CC 21 D3 65      [10] 5047 	ld	hl,#00166$
   65CF 19            [11] 5048 	add	hl,de
   65D0 19            [11] 5049 	add	hl,de
                           5050 ;src/main.c:147: case 0: init = 50;break;
   65D1 D1            [10] 5051 	pop	de
   65D2 E9            [ 4] 5052 	jp	(hl)
   65D3                    5053 00166$:
   65D3 18 04         [12] 5054 	jr	00107$
   65D5 18 08         [12] 5055 	jr	00108$
   65D7 18 0C         [12] 5056 	jr	00109$
   65D9                    5057 00107$:
   65D9 21 32 00      [10] 5058 	ld	hl,#0x0032
   65DC E3            [19] 5059 	ex	(sp), hl
   65DD 18 0A         [12] 5060 	jr	00110$
                           5061 ;src/main.c:148: case 1: init = 70;break;
   65DF                    5062 00108$:
   65DF 21 46 00      [10] 5063 	ld	hl,#0x0046
   65E2 E3            [19] 5064 	ex	(sp), hl
   65E3 18 04         [12] 5065 	jr	00110$
                           5066 ;src/main.c:149: case 2: init = 90;break;
   65E5                    5067 00109$:
   65E5 21 5A 00      [10] 5068 	ld	hl,#0x005A
   65E8 E3            [19] 5069 	ex	(sp), hl
                           5070 ;src/main.c:150: }
   65E9                    5071 00110$:
                           5072 ;src/main.c:151: memptr = cpct_getScreenPtr(VMEM,15,init);
   65E9 DD 66 FA      [19] 5073 	ld	h,-6 (ix)
   65EC C5            [11] 5074 	push	bc
   65ED D5            [11] 5075 	push	de
   65EE E5            [11] 5076 	push	hl
   65EF 33            [ 6] 5077 	inc	sp
   65F0 3E 0F         [ 7] 5078 	ld	a,#0x0F
   65F2 F5            [11] 5079 	push	af
   65F3 33            [ 6] 5080 	inc	sp
   65F4 21 00 C0      [10] 5081 	ld	hl,#0xC000
   65F7 E5            [11] 5082 	push	hl
   65F8 CD 34 6E      [17] 5083 	call	_cpct_getScreenPtr
   65FB D1            [10] 5084 	pop	de
   65FC C1            [10] 5085 	pop	bc
                           5086 ;src/main.c:116: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   65FD DD 75 FE      [19] 5087 	ld	-2 (ix),l
   6600 DD 74 FF      [19] 5088 	ld	-1 (ix),h
                           5089 ;src/main.c:152: cpct_drawSolidBox(memptr, 3, 2, 8);
   6603 C5            [11] 5090 	push	bc
   6604 D5            [11] 5091 	push	de
   6605 21 02 08      [10] 5092 	ld	hl,#0x0802
   6608 E5            [11] 5093 	push	hl
   6609 3E 03         [ 7] 5094 	ld	a,#0x03
   660B F5            [11] 5095 	push	af
   660C 33            [ 6] 5096 	inc	sp
   660D DD 6E FE      [19] 5097 	ld	l,-2 (ix)
   6610 DD 66 FF      [19] 5098 	ld	h,-1 (ix)
   6613 E5            [11] 5099 	push	hl
   6614 CD 63 6D      [17] 5100 	call	_cpct_drawSolidBox
   6617 F1            [10] 5101 	pop	af
   6618 F1            [10] 5102 	pop	af
   6619 33            [ 6] 5103 	inc	sp
   661A 21 00 40      [10] 5104 	ld	hl,#0x4000
   661D CD 59 6A      [17] 5105 	call	_cpct_isKeyPressed
   6620 7D            [ 4] 5106 	ld	a,l
   6621 D1            [10] 5107 	pop	de
   6622 C1            [10] 5108 	pop	bc
   6623 B7            [ 4] 5109 	or	a, a
   6624 28 27         [12] 5110 	jr	Z,00116$
                           5111 ;src/main.c:154: switch (pushed){
   6626 78            [ 4] 5112 	ld	a,b
   6627 B7            [ 4] 5113 	or	a,a
   6628 20 23         [12] 5114 	jr	NZ,00116$
   662A B1            [ 4] 5115 	or	a,c
   662B 20 20         [12] 5116 	jr	NZ,00116$
   662D DD 5E FC      [19] 5117 	ld	e,-4 (ix)
   6630 16 00         [ 7] 5118 	ld	d,#0x00
   6632 21 38 66      [10] 5119 	ld	hl,#00167$
   6635 19            [11] 5120 	add	hl,de
   6636 19            [11] 5121 	add	hl,de
                           5122 ;src/main.c:155: case 0: return 1;break;
   6637 E9            [ 4] 5123 	jp	(hl)
   6638                    5124 00167$:
   6638 18 04         [12] 5125 	jr	00111$
   663A 18 07         [12] 5126 	jr	00112$
   663C 18 0A         [12] 5127 	jr	00113$
   663E                    5128 00111$:
   663E 21 01 00      [10] 5129 	ld	hl,#0x0001
   6641 18 0E         [12] 5130 	jr	00120$
                           5131 ;src/main.c:156: case 1: return 2;break;
   6643                    5132 00112$:
   6643 21 02 00      [10] 5133 	ld	hl,#0x0002
   6646 18 09         [12] 5134 	jr	00120$
                           5135 ;src/main.c:157: case 2: return 0;break;
   6648                    5136 00113$:
   6648 21 00 00      [10] 5137 	ld	hl,#0x0000
   664B 18 04         [12] 5138 	jr	00120$
                           5139 ;src/main.c:158: }
   664D                    5140 00116$:
                           5141 ;src/main.c:160: cont++;
   664D 13            [ 6] 5142 	inc	de
   664E C3 2B 65      [10] 5143 	jp	00118$
   6651                    5144 00120$:
   6651 DD F9         [10] 5145 	ld	sp, ix
   6653 DD E1         [14] 5146 	pop	ix
   6655 C9            [10] 5147 	ret
   6656                    5148 ___str_2:
   6656 4C 6F 75 6E 67 65  5149 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   6666 00                 5150 	.db 0x00
   6667                    5151 ___str_3:
   6667 4E 75 65 76 61 20  5152 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   6674 00                 5153 	.db 0x00
   6675                    5154 ___str_4:
   6675 43 72 65 64 69 74  5155 	.ascii "Creditos"
        6F 73
   667D 00                 5156 	.db 0x00
   667E                    5157 ___str_5:
   667E 53 61 6C 69 72     5158 	.ascii "Salir"
   6683 00                 5159 	.db 0x00
                           5160 ;src/main.c:172: void game(){
                           5161 ;	---------------------------------
                           5162 ; Function game
                           5163 ; ---------------------------------
   6684                    5164 _game::
                           5165 ;src/main.c:175: initVariables();
   6684 CD D4 63      [17] 5166 	call	_initVariables
                           5167 ;src/main.c:176: initPlayer(map);
   6687 3A 1B 70      [13] 5168 	ld	a,(_map)
   668A F5            [11] 5169 	push	af
   668B 33            [ 6] 5170 	inc	sp
   668C CD 28 63      [17] 5171 	call	_initPlayer
   668F 33            [ 6] 5172 	inc	sp
                           5173 ;src/main.c:177: initNivel();
   6690 CD C4 63      [17] 5174 	call	_initNivel
                           5175 ;src/main.c:178: initEnemies(map);
   6693 3A 1B 70      [13] 5176 	ld	a,(_map)
   6696 F5            [11] 5177 	push	af
   6697 33            [ 6] 5178 	inc	sp
   6698 CD 73 63      [17] 5179 	call	_initEnemies
   669B 33            [ 6] 5180 	inc	sp
                           5181 ;src/main.c:181: cpct_clearScreen(0);
   669C 21 00 40      [10] 5182 	ld	hl,#0x4000
   669F E5            [11] 5183 	push	hl
   66A0 AF            [ 4] 5184 	xor	a, a
   66A1 F5            [11] 5185 	push	af
   66A2 33            [ 6] 5186 	inc	sp
   66A3 26 C0         [ 7] 5187 	ld	h, #0xC0
   66A5 E5            [11] 5188 	push	hl
   66A6 CD 41 6D      [17] 5189 	call	_cpct_memset
                           5190 ;src/main.c:182: drawMap(map);
   66A9 3A 1B 70      [13] 5191 	ld	a,(_map)
   66AC F5            [11] 5192 	push	af
   66AD 33            [ 6] 5193 	inc	sp
   66AE CD C0 46      [17] 5194 	call	_drawMap
   66B1 33            [ 6] 5195 	inc	sp
                           5196 ;src/main.c:184: while (1){
   66B2                    5197 00137$:
                           5198 ;src/main.c:187: cpct_waitVSYNC();
   66B2 CD 27 6D      [17] 5199 	call	_cpct_waitVSYNC
                           5200 ;src/main.c:190: erases();
   66B5 CD 71 4D      [17] 5201 	call	_erases
                           5202 ;src/main.c:193: if(temp == 10)
   66B8 3A 1A 70      [13] 5203 	ld	a,(#_temp + 0)
   66BB D6 0A         [ 7] 5204 	sub	a, #0x0A
   66BD 20 0F         [12] 5205 	jr	NZ,00102$
                           5206 ;src/main.c:194: drawPickUps(n.corazon,n.bullet);
   66BF 21 25 70      [10] 5207 	ld	hl, #(_n + 0x0002) + 0
   66C2 56            [ 7] 5208 	ld	d,(hl)
   66C3 3A 24 70      [13] 5209 	ld	a, (#(_n + 0x0001) + 0)
   66C6 D5            [11] 5210 	push	de
   66C7 33            [ 6] 5211 	inc	sp
   66C8 F5            [11] 5212 	push	af
   66C9 33            [ 6] 5213 	inc	sp
   66CA CD 18 4F      [17] 5214 	call	_drawPickUps
   66CD F1            [10] 5215 	pop	af
   66CE                    5216 00102$:
                           5217 ;src/main.c:197: draws();
   66CE CD B2 4C      [17] 5218 	call	_draws
                           5219 ;src/main.c:200: if(temp == 10){
   66D1 3A 1A 70      [13] 5220 	ld	a,(#_temp + 0)
   66D4 D6 0A         [ 7] 5221 	sub	a, #0x0A
   66D6 20 2F         [12] 5222 	jr	NZ,00110$
                           5223 ;src/main.c:201: if(player.atk < 20) drawFatiga(player.atk,2);
   66D8 21 38 70      [10] 5224 	ld	hl, #(_player + 0x0008) + 0
   66DB 56            [ 7] 5225 	ld	d,(hl)
   66DC 7A            [ 4] 5226 	ld	a,d
   66DD D6 14         [ 7] 5227 	sub	a, #0x14
   66DF 30 0C         [12] 5228 	jr	NC,00107$
   66E1 3E 02         [ 7] 5229 	ld	a,#0x02
   66E3 F5            [11] 5230 	push	af
   66E4 33            [ 6] 5231 	inc	sp
   66E5 D5            [11] 5232 	push	de
   66E6 33            [ 6] 5233 	inc	sp
   66E7 CD F2 4D      [17] 5234 	call	_drawFatiga
   66EA F1            [10] 5235 	pop	af
   66EB 18 1A         [12] 5236 	jr	00110$
   66ED                    5237 00107$:
                           5238 ;src/main.c:202: else if(player.atk > 20) drawFatiga(player.atk,1);
   66ED 3E 14         [ 7] 5239 	ld	a,#0x14
   66EF 92            [ 4] 5240 	sub	a, d
   66F0 30 0C         [12] 5241 	jr	NC,00104$
   66F2 3E 01         [ 7] 5242 	ld	a,#0x01
   66F4 F5            [11] 5243 	push	af
   66F5 33            [ 6] 5244 	inc	sp
   66F6 D5            [11] 5245 	push	de
   66F7 33            [ 6] 5246 	inc	sp
   66F8 CD F2 4D      [17] 5247 	call	_drawFatiga
   66FB F1            [10] 5248 	pop	af
   66FC 18 09         [12] 5249 	jr	00110$
   66FE                    5250 00104$:
                           5251 ;src/main.c:203: else drawFatiga(player.atk,0);
   66FE AF            [ 4] 5252 	xor	a, a
   66FF F5            [11] 5253 	push	af
   6700 33            [ 6] 5254 	inc	sp
   6701 D5            [11] 5255 	push	de
   6702 33            [ 6] 5256 	inc	sp
   6703 CD F2 4D      [17] 5257 	call	_drawFatiga
   6706 F1            [10] 5258 	pop	af
   6707                    5259 00110$:
                           5260 ;src/main.c:208: if(temp%2 == 0){
   6707 3A 1A 70      [13] 5261 	ld	a,(#_temp + 0)
                           5262 ;src/main.c:209: player.lx = player.x;
                           5263 ;src/main.c:210: player.ly = player.y;
                           5264 ;src/main.c:208: if(temp%2 == 0){
   670A E6 01         [ 7] 5265 	and	a,#0x01
   670C 20 0D         [12] 5266 	jr	NZ,00112$
                           5267 ;src/main.c:209: player.lx = player.x;
   670E 3A 30 70      [13] 5268 	ld	a, (#_player + 0)
   6711 21 32 70      [10] 5269 	ld	hl,#(_player + 0x0002)
   6714 77            [ 7] 5270 	ld	(hl),a
                           5271 ;src/main.c:210: player.ly = player.y;
   6715 3A 31 70      [13] 5272 	ld	a, (#(_player + 0x0001) + 0)
   6718 32 33 70      [13] 5273 	ld	(#(_player + 0x0003)),a
   671B                    5274 00112$:
                           5275 ;src/main.c:213: if(enemy.life > 0){
   671B 21 43 70      [10] 5276 	ld	hl, #(_enemy + 0x0008) + 0
   671E 6E            [ 7] 5277 	ld	l,(hl)
                           5278 ;src/main.c:216: enemy.ly = enemy.y;
                           5279 ;src/main.c:224: enemy.x = enemy.ox;
                           5280 ;src/main.c:225: enemy.y = enemy.oy;
                           5281 ;src/main.c:213: if(enemy.life > 0){
   671F 7D            [ 4] 5282 	ld	a,l
   6720 B7            [ 4] 5283 	or	a, a
   6721 CA D7 67      [10] 5284 	jp	Z,00119$
                           5285 ;src/main.c:214: if(temp%2 == 1){
   6724 3A 1A 70      [13] 5286 	ld	a,(#_temp + 0)
   6727 E6 01         [ 7] 5287 	and	a, #0x01
   6729 67            [ 4] 5288 	ld	h,a
                           5289 ;src/main.c:215: enemy.lx = enemy.x;
                           5290 ;src/main.c:216: enemy.ly = enemy.y;
                           5291 ;src/main.c:214: if(temp%2 == 1){
   672A 25            [ 4] 5292 	dec	h
   672B 20 0C         [12] 5293 	jr	NZ,00114$
                           5294 ;src/main.c:215: enemy.lx = enemy.x;
   672D 3A 3B 70      [13] 5295 	ld	a, (#_enemy + 0)
   6730 32 3D 70      [13] 5296 	ld	(#(_enemy + 0x0002)),a
                           5297 ;src/main.c:216: enemy.ly = enemy.y;
   6733 3A 3C 70      [13] 5298 	ld	a, (#(_enemy + 0x0001) + 0)
   6736 32 3E 70      [13] 5299 	ld	(#(_enemy + 0x0003)),a
   6739                    5300 00114$:
                           5301 ;src/main.c:219: move();
   6739 CD 3B 58      [17] 5302 	call	_move
                           5303 ;src/main.c:221: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   673C 21 38 70      [10] 5304 	ld	hl, #(_player + 0x0008) + 0
   673F 56            [ 7] 5305 	ld	d,(hl)
   6740 3A 3C 70      [13] 5306 	ld	a, (#(_enemy + 0x0001) + 0)
   6743 21 3B 70      [10] 5307 	ld	hl, #_enemy + 0
   6746 5E            [ 7] 5308 	ld	e,(hl)
   6747 21 31 70      [10] 5309 	ld	hl, #(_player + 0x0001) + 0
   674A 46            [ 7] 5310 	ld	b,(hl)
   674B 21 30 70      [10] 5311 	ld	hl, #_player + 0
   674E 4E            [ 7] 5312 	ld	c,(hl)
   674F D5            [11] 5313 	push	de
   6750 33            [ 6] 5314 	inc	sp
   6751 57            [ 4] 5315 	ld	d,a
   6752 D5            [11] 5316 	push	de
   6753 C5            [11] 5317 	push	bc
   6754 CD 08 59      [17] 5318 	call	_checkCollisions
   6757 F1            [10] 5319 	pop	af
   6758 F1            [10] 5320 	pop	af
   6759 33            [ 6] 5321 	inc	sp
   675A 7D            [ 4] 5322 	ld	a,l
   675B 3D            [ 4] 5323 	dec	a
   675C 28 07         [12] 5324 	jr	Z,00115$
   675E 7D            [ 4] 5325 	ld	a,l
   675F D6 02         [ 7] 5326 	sub	a, #0x02
   6761 28 3A         [12] 5327 	jr	Z,00116$
   6763 18 72         [12] 5328 	jr	00119$
                           5329 ;src/main.c:222: case 1:
   6765                    5330 00115$:
                           5331 ;src/main.c:223: erase(enemy.lx,enemy.ly,0);
   6765 21 3E 70      [10] 5332 	ld	hl, #(_enemy + 0x0003) + 0
   6768 56            [ 7] 5333 	ld	d,(hl)
   6769 21 3D 70      [10] 5334 	ld	hl, #(_enemy + 0x0002) + 0
   676C 46            [ 7] 5335 	ld	b,(hl)
   676D AF            [ 4] 5336 	xor	a, a
   676E F5            [11] 5337 	push	af
   676F 33            [ 6] 5338 	inc	sp
   6770 D5            [11] 5339 	push	de
   6771 33            [ 6] 5340 	inc	sp
   6772 C5            [11] 5341 	push	bc
   6773 33            [ 6] 5342 	inc	sp
   6774 CD 18 4C      [17] 5343 	call	_erase
   6777 F1            [10] 5344 	pop	af
   6778 33            [ 6] 5345 	inc	sp
                           5346 ;src/main.c:224: enemy.x = enemy.ox;
   6779 3A 3F 70      [13] 5347 	ld	a, (#(_enemy + 0x0004) + 0)
   677C 32 3B 70      [13] 5348 	ld	(#_enemy),a
                           5349 ;src/main.c:225: enemy.y = enemy.oy;
   677F 21 40 70      [10] 5350 	ld	hl, #(_enemy + 0x0005) + 0
   6782 5E            [ 7] 5351 	ld	e,(hl)
   6783 21 3C 70      [10] 5352 	ld	hl,#(_enemy + 0x0001)
   6786 73            [ 7] 5353 	ld	(hl),e
                           5354 ;src/main.c:226: enemy.lx = enemy.x;
   6787 32 3D 70      [13] 5355 	ld	(#(_enemy + 0x0002)),a
                           5356 ;src/main.c:227: enemy.ly = enemy.y;
   678A 21 3E 70      [10] 5357 	ld	hl,#(_enemy + 0x0003)
   678D 73            [ 7] 5358 	ld	(hl),e
                           5359 ;src/main.c:228: enemy.life -= 1;
   678E 3A 43 70      [13] 5360 	ld	a, (#(_enemy + 0x0008) + 0)
   6791 C6 FF         [ 7] 5361 	add	a,#0xFF
   6793 32 43 70      [13] 5362 	ld	(#(_enemy + 0x0008)),a
                           5363 ;src/main.c:229: player.atk = 20;
   6796 21 38 70      [10] 5364 	ld	hl,#(_player + 0x0008)
   6799 36 14         [10] 5365 	ld	(hl),#0x14
                           5366 ;src/main.c:230: break;
   679B 18 3A         [12] 5367 	jr	00119$
                           5368 ;src/main.c:231: case 2:
   679D                    5369 00116$:
                           5370 ;src/main.c:232: erase(player.lx,player.ly,0);
   679D 21 33 70      [10] 5371 	ld	hl, #(_player + 0x0003) + 0
   67A0 56            [ 7] 5372 	ld	d,(hl)
   67A1 21 32 70      [10] 5373 	ld	hl, #(_player + 0x0002) + 0
   67A4 46            [ 7] 5374 	ld	b,(hl)
   67A5 AF            [ 4] 5375 	xor	a, a
   67A6 F5            [11] 5376 	push	af
   67A7 33            [ 6] 5377 	inc	sp
   67A8 D5            [11] 5378 	push	de
   67A9 33            [ 6] 5379 	inc	sp
   67AA C5            [11] 5380 	push	bc
   67AB 33            [ 6] 5381 	inc	sp
   67AC CD 18 4C      [17] 5382 	call	_erase
   67AF F1            [10] 5383 	pop	af
   67B0 33            [ 6] 5384 	inc	sp
                           5385 ;src/main.c:233: player.x = 0;
   67B1 21 30 70      [10] 5386 	ld	hl,#_player
   67B4 36 00         [10] 5387 	ld	(hl),#0x00
                           5388 ;src/main.c:234: player.y = 80;
   67B6 21 31 70      [10] 5389 	ld	hl,#(_player + 0x0001)
   67B9 36 50         [10] 5390 	ld	(hl),#0x50
                           5391 ;src/main.c:235: player.lx = 0;
   67BB 21 32 70      [10] 5392 	ld	hl,#(_player + 0x0002)
   67BE 36 00         [10] 5393 	ld	(hl),#0x00
                           5394 ;src/main.c:236: player.ly = 80;
   67C0 21 33 70      [10] 5395 	ld	hl,#(_player + 0x0003)
   67C3 36 50         [10] 5396 	ld	(hl),#0x50
                           5397 ;src/main.c:237: player.life -= 1;
   67C5 3A 36 70      [13] 5398 	ld	a, (#(_player + 0x0006) + 0)
   67C8 C6 FF         [ 7] 5399 	add	a,#0xFF
   67CA 32 36 70      [13] 5400 	ld	(#(_player + 0x0006)),a
                           5401 ;src/main.c:238: player.atk = 20;
   67CD 21 38 70      [10] 5402 	ld	hl,#(_player + 0x0008)
   67D0 36 14         [10] 5403 	ld	(hl),#0x14
                           5404 ;src/main.c:239: enemy.pursue = 0;
   67D2 21 49 70      [10] 5405 	ld	hl,#_enemy + 14
   67D5 36 00         [10] 5406 	ld	(hl),#0x00
                           5407 ;src/main.c:241: }
   67D7                    5408 00119$:
                           5409 ;src/main.c:243: if(temp > 10)
   67D7 3E 0A         [ 7] 5410 	ld	a,#0x0A
   67D9 FD 21 1A 70   [14] 5411 	ld	iy,#_temp
   67DD FD 96 00      [19] 5412 	sub	a, 0 (iy)
   67E0 30 08         [12] 5413 	jr	NC,00121$
                           5414 ;src/main.c:244: temp = 0;
   67E2 FD 21 1A 70   [14] 5415 	ld	iy,#_temp
   67E6 FD 36 00 00   [19] 5416 	ld	0 (iy),#0x00
   67EA                    5417 00121$:
                           5418 ;src/main.c:245: temp += 1;
   67EA FD 21 1A 70   [14] 5419 	ld	iy,#_temp
   67EE FD 34 00      [23] 5420 	inc	0 (iy)
                           5421 ;src/main.c:246: player.latk = player.atk;
   67F1 11 39 70      [10] 5422 	ld	de,#_player + 9
   67F4 3A 38 70      [13] 5423 	ld	a, (#(_player + 0x0008) + 0)
   67F7 12            [ 7] 5424 	ld	(de),a
                           5425 ;src/main.c:249: cpct_scanKeyboard_f();
   67F8 CD 65 6A      [17] 5426 	call	_cpct_scanKeyboard_f
                           5427 ;src/main.c:250: player.sprite = checkKeyboard();
   67FB CD 43 60      [17] 5428 	call	_checkKeyboard
   67FE 5D            [ 4] 5429 	ld	e,l
   67FF 54            [ 4] 5430 	ld	d,h
   6800 ED 53 34 70   [20] 5431 	ld	((_player + 0x0004)), de
                           5432 ;src/main.c:251: checkBoundsCollisions(&n.corazon,&n.bullet);
   6804 21 25 70      [10] 5433 	ld	hl,#(_n + 0x0002)
   6807 11 24 70      [10] 5434 	ld	de,#(_n + 0x0001)
   680A E5            [11] 5435 	push	hl
   680B D5            [11] 5436 	push	de
   680C CD 29 5A      [17] 5437 	call	_checkBoundsCollisions
   680F F1            [10] 5438 	pop	af
   6810 F1            [10] 5439 	pop	af
                           5440 ;src/main.c:253: if(arrow == 1){
   6811 3A 1E 70      [13] 5441 	ld	a,(#_arrow + 0)
   6814 3D            [ 4] 5442 	dec	a
   6815 20 70         [12] 5443 	jr	NZ,00131$
                           5444 ;src/main.c:254: moveObject();
   6817 CD CE 62      [17] 5445 	call	_moveObject
                           5446 ;src/main.c:255: bound = checkArrowCollisions();
   681A CD FA 5D      [17] 5447 	call	_checkArrowCollisions
   681D FD 21 20 70   [14] 5448 	ld	iy,#_bound
   6821 FD 75 00      [19] 5449 	ld	0 (iy),l
                           5450 ;src/main.c:256: if(object.dir == 2 || object.dir == 8)
   6824 21 2D 70      [10] 5451 	ld	hl, #_object + 7
   6827 7E            [ 7] 5452 	ld	a, (hl)
   6828 FE 02         [ 7] 5453 	cp	a,#0x02
   682A 28 04         [12] 5454 	jr	Z,00122$
   682C D6 08         [ 7] 5455 	sub	a, #0x08
   682E 20 04         [12] 5456 	jr	NZ,00123$
   6830                    5457 00122$:
                           5458 ;src/main.c:257: atkObj = 21;
   6830 06 15         [ 7] 5459 	ld	b,#0x15
   6832 18 02         [12] 5460 	jr	00124$
   6834                    5461 00123$:
                           5462 ;src/main.c:259: atkObj = 22;
   6834 06 16         [ 7] 5463 	ld	b,#0x16
   6836                    5464 00124$:
                           5465 ;src/main.c:260: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
   6836 3A 43 70      [13] 5466 	ld	a, (#(_enemy + 0x0008) + 0)
   6839 B7            [ 4] 5467 	or	a, a
   683A 28 4B         [12] 5468 	jr	Z,00131$
   683C 3A 3C 70      [13] 5469 	ld	a, (#(_enemy + 0x0001) + 0)
   683F 21 3B 70      [10] 5470 	ld	hl, #_enemy + 0
   6842 4E            [ 7] 5471 	ld	c,(hl)
   6843 21 27 70      [10] 5472 	ld	hl, #_object + 1
   6846 5E            [ 7] 5473 	ld	e,(hl)
   6847 21 26 70      [10] 5474 	ld	hl, #_object + 0
   684A 56            [ 7] 5475 	ld	d,(hl)
   684B C5            [11] 5476 	push	bc
   684C 33            [ 6] 5477 	inc	sp
   684D F5            [11] 5478 	push	af
   684E 33            [ 6] 5479 	inc	sp
   684F 79            [ 4] 5480 	ld	a,c
   6850 F5            [11] 5481 	push	af
   6851 33            [ 6] 5482 	inc	sp
   6852 7B            [ 4] 5483 	ld	a,e
   6853 F5            [11] 5484 	push	af
   6854 33            [ 6] 5485 	inc	sp
   6855 D5            [11] 5486 	push	de
   6856 33            [ 6] 5487 	inc	sp
   6857 CD 08 59      [17] 5488 	call	_checkCollisions
   685A F1            [10] 5489 	pop	af
   685B F1            [10] 5490 	pop	af
   685C 33            [ 6] 5491 	inc	sp
   685D 2D            [ 4] 5492 	dec	l
   685E 20 27         [12] 5493 	jr	NZ,00131$
   6860 3A 20 70      [13] 5494 	ld	a,(#_bound + 0)
   6863 B7            [ 4] 5495 	or	a, a
   6864 20 21         [12] 5496 	jr	NZ,00131$
                           5497 ;src/main.c:261: enemy.life -= 1;
   6866 3A 43 70      [13] 5498 	ld	a, (#(_enemy + 0x0008) + 0)
   6869 C6 FF         [ 7] 5499 	add	a,#0xFF
   686B 32 43 70      [13] 5500 	ld	(#(_enemy + 0x0008)),a
                           5501 ;src/main.c:262: enemy.x = enemy.ox;
   686E 3A 3F 70      [13] 5502 	ld	a, (#(_enemy + 0x0004) + 0)
   6871 32 3B 70      [13] 5503 	ld	(#_enemy),a
                           5504 ;src/main.c:263: enemy.y = enemy.oy;
   6874 3A 40 70      [13] 5505 	ld	a, (#(_enemy + 0x0005) + 0)
   6877 32 3C 70      [13] 5506 	ld	(#(_enemy + 0x0001)),a
                           5507 ;src/main.c:264: object.vivo = 0;
   687A 21 2C 70      [10] 5508 	ld	hl,#_object + 6
   687D 36 00         [10] 5509 	ld	(hl),#0x00
                           5510 ;src/main.c:265: bound = 1;
   687F FD 21 20 70   [14] 5511 	ld	iy,#_bound
   6883 FD 36 00 01   [19] 5512 	ld	0 (iy),#0x01
   6887                    5513 00131$:
                           5514 ;src/main.c:269: if(player.life == 0){
   6887 3A 36 70      [13] 5515 	ld	a, (#(_player + 0x0006) + 0)
   688A B7            [ 4] 5516 	or	a, a
   688B 20 08         [12] 5517 	jr	NZ,00133$
                           5518 ;src/main.c:270: gameOver();
   688D CD FD 63      [17] 5519 	call	_gameOver
                           5520 ;src/main.c:271: finish = 1;
   6890 21 1D 70      [10] 5521 	ld	hl,#_finish + 0
   6893 36 01         [10] 5522 	ld	(hl), #0x01
   6895                    5523 00133$:
                           5524 ;src/main.c:273: if(finish == 1) return;
   6895 3A 1D 70      [13] 5525 	ld	a,(#_finish + 0)
   6898 3D            [ 4] 5526 	dec	a
   6899 C2 B2 66      [10] 5527 	jp	NZ,00137$
   689C C9            [10] 5528 	ret
                           5529 ;src/main.c:280: void credits(){
                           5530 ;	---------------------------------
                           5531 ; Function credits
                           5532 ; ---------------------------------
   689D                    5533 _credits::
                           5534 ;src/main.c:282: cpct_clearScreen(0);
   689D 21 00 40      [10] 5535 	ld	hl,#0x4000
   68A0 E5            [11] 5536 	push	hl
   68A1 AF            [ 4] 5537 	xor	a, a
   68A2 F5            [11] 5538 	push	af
   68A3 33            [ 6] 5539 	inc	sp
   68A4 26 C0         [ 7] 5540 	ld	h, #0xC0
   68A6 E5            [11] 5541 	push	hl
   68A7 CD 41 6D      [17] 5542 	call	_cpct_memset
                           5543 ;src/main.c:283: memptr = cpct_getScreenPtr(VMEM,10,10);
   68AA 21 0A 0A      [10] 5544 	ld	hl,#0x0A0A
   68AD E5            [11] 5545 	push	hl
   68AE 21 00 C0      [10] 5546 	ld	hl,#0xC000
   68B1 E5            [11] 5547 	push	hl
   68B2 CD 34 6E      [17] 5548 	call	_cpct_getScreenPtr
                           5549 ;src/main.c:284: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   68B5 EB            [ 4] 5550 	ex	de,hl
   68B6 01 FF 68      [10] 5551 	ld	bc,#___str_6
   68B9 D5            [11] 5552 	push	de
   68BA 21 01 00      [10] 5553 	ld	hl,#0x0001
   68BD E5            [11] 5554 	push	hl
   68BE D5            [11] 5555 	push	de
   68BF C5            [11] 5556 	push	bc
   68C0 CD 46 6B      [17] 5557 	call	_cpct_drawStringM0
   68C3 21 06 00      [10] 5558 	ld	hl,#6
   68C6 39            [11] 5559 	add	hl,sp
   68C7 F9            [ 6] 5560 	ld	sp,hl
   68C8 D1            [10] 5561 	pop	de
                           5562 ;src/main.c:286: while (1){
   68C9                    5563 00104$:
                           5564 ;src/main.c:288: cpct_scanKeyboard_f();
   68C9 D5            [11] 5565 	push	de
   68CA CD 65 6A      [17] 5566 	call	_cpct_scanKeyboard_f
   68CD D1            [10] 5567 	pop	de
                           5568 ;src/main.c:289: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   68CE 01 10 69      [10] 5569 	ld	bc,#___str_7
   68D1 D5            [11] 5570 	push	de
   68D2 21 01 00      [10] 5571 	ld	hl,#0x0001
   68D5 E5            [11] 5572 	push	hl
   68D6 D5            [11] 5573 	push	de
   68D7 C5            [11] 5574 	push	bc
   68D8 CD 46 6B      [17] 5575 	call	_cpct_drawStringM0
   68DB 21 06 00      [10] 5576 	ld	hl,#6
   68DE 39            [11] 5577 	add	hl,sp
   68DF F9            [ 6] 5578 	ld	sp,hl
   68E0 D1            [10] 5579 	pop	de
                           5580 ;src/main.c:290: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   68E1 01 26 69      [10] 5581 	ld	bc,#___str_8
   68E4 D5            [11] 5582 	push	de
   68E5 21 01 00      [10] 5583 	ld	hl,#0x0001
   68E8 E5            [11] 5584 	push	hl
   68E9 D5            [11] 5585 	push	de
   68EA C5            [11] 5586 	push	bc
   68EB CD 46 6B      [17] 5587 	call	_cpct_drawStringM0
   68EE 21 06 00      [10] 5588 	ld	hl,#6
   68F1 39            [11] 5589 	add	hl,sp
   68F2 F9            [ 6] 5590 	ld	sp,hl
   68F3 21 08 04      [10] 5591 	ld	hl,#0x0408
   68F6 CD 59 6A      [17] 5592 	call	_cpct_isKeyPressed
   68F9 7D            [ 4] 5593 	ld	a,l
   68FA D1            [10] 5594 	pop	de
   68FB B7            [ 4] 5595 	or	a, a
   68FC 28 CB         [12] 5596 	jr	Z,00104$
                           5597 ;src/main.c:294: return;
   68FE C9            [10] 5598 	ret
   68FF                    5599 ___str_6:
   68FF 4C 6F 75 6E 67 65  5600 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   690F 00                 5601 	.db 0x00
   6910                    5602 ___str_7:
   6910 4A 6F 73 65 70 20  5603 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   6925 00                 5604 	.db 0x00
   6926                    5605 ___str_8:
   6926 41 6C 62 65 72 74  5606 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   693F 00                 5607 	.db 0x00
                           5608 ;src/main.c:304: void main(void) {
                           5609 ;	---------------------------------
                           5610 ; Function main
                           5611 ; ---------------------------------
   6940                    5612 _main::
                           5613 ;src/main.c:308: init();
   6940 CD 03 63      [17] 5614 	call	_init
                           5615 ;src/main.c:311: while(1){
   6943                    5616 00106$:
                           5617 ;src/main.c:312: x=menu();
   6943 CD 76 64      [17] 5618 	call	_menu
   6946 5D            [ 4] 5619 	ld	e, l
   6947 54            [ 4] 5620 	ld	d, h
                           5621 ;src/main.c:313: switch(x){
   6948 CB 7A         [ 8] 5622 	bit	7, d
   694A 20 F7         [12] 5623 	jr	NZ,00106$
   694C 3E 02         [ 7] 5624 	ld	a,#0x02
   694E BB            [ 4] 5625 	cp	a, e
   694F 3E 00         [ 7] 5626 	ld	a,#0x00
   6951 9A            [ 4] 5627 	sbc	a, d
   6952 E2 57 69      [10] 5628 	jp	PO, 00122$
   6955 EE 80         [ 7] 5629 	xor	a, #0x80
   6957                    5630 00122$:
   6957 FA 43 69      [10] 5631 	jp	M,00106$
   695A 16 00         [ 7] 5632 	ld	d,#0x00
   695C 21 62 69      [10] 5633 	ld	hl,#00123$
   695F 19            [11] 5634 	add	hl,de
   6960 19            [11] 5635 	add	hl,de
                           5636 ;src/main.c:314: case 0: return;break;
                           5637 ;src/main.c:315: case 1: game(); break;
   6961 E9            [ 4] 5638 	jp	(hl)
   6962                    5639 00123$:
   6962 18 10         [12] 5640 	jr	00108$
   6964 18 04         [12] 5641 	jr	00102$
   6966 18 07         [12] 5642 	jr	00103$
   6968 18 0A         [12] 5643 	jr	00108$
   696A                    5644 00102$:
   696A CD 84 66      [17] 5645 	call	_game
   696D 18 D4         [12] 5646 	jr	00106$
                           5647 ;src/main.c:316: case 2: credits();break;
   696F                    5648 00103$:
   696F CD 9D 68      [17] 5649 	call	_credits
                           5650 ;src/main.c:317: }
   6972 18 CF         [12] 5651 	jr	00106$
   6974                    5652 00108$:
   6974 C9            [10] 5653 	ret
                           5654 	.area _CODE
                           5655 	.area _INITIALIZER
                           5656 	.area _CABS (ABS)
